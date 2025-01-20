@interface AXCameraLevelingMotionAnalyzer
+ (double)_offsetFromLevelForOrientation:(int64_t)a3 rotation:(double)a4 shift:(double)a5;
+ (int64_t)_deviceOrientationForRotation:(double)a3 shift:(double)a4;
+ (int64_t)_levelZoneForDeviceMotion:(id)a3 previousZone:(int64_t)a4;
- (BOOL)_cameraStableForLeveling;
- (CMDeviceMotion)_lastDeviceMotion;
- (double)_lastUnstableMotionTimestamp;
- (int64_t)updateWithDeviceMotion:(id)a3 previousZone:(int64_t)a4;
- (void)_updateCameraStableForMotion:(id)a3 previousMotion:(id)a4;
- (void)reset;
- (void)set_cameraStableForLeveling:(BOOL)a3;
- (void)set_lastDeviceMotion:(id)a3;
- (void)set_lastUnstableMotionTimestamp:(double)a3;
@end

@implementation AXCameraLevelingMotionAnalyzer

- (void)reset
{
  [(AXCameraLevelingMotionAnalyzer *)self set_lastDeviceMotion:0];
  [(AXCameraLevelingMotionAnalyzer *)self set_cameraStableForLeveling:0];

  [(AXCameraLevelingMotionAnalyzer *)self set_lastUnstableMotionTimestamp:0.0];
}

- (int64_t)updateWithDeviceMotion:(id)a3 previousZone:(int64_t)a4
{
  id v6 = a3;
  v7 = [(AXCameraLevelingMotionAnalyzer *)self _lastDeviceMotion];
  [(AXCameraLevelingMotionAnalyzer *)self _updateCameraStableForMotion:v6 previousMotion:v7];
  if ([(AXCameraLevelingMotionAnalyzer *)self _cameraStableForLeveling]) {
    int64_t v8 = [(id)objc_opt_class() _levelZoneForDeviceMotion:v6 previousZone:a4];
  }
  else {
    int64_t v8 = 0;
  }
  [(AXCameraLevelingMotionAnalyzer *)self set_lastDeviceMotion:v6];

  return v8;
}

- (void)_updateCameraStableForMotion:(id)a3 previousMotion:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    [v6 timestamp];
    double v9 = v8;
    [v7 timestamp];
    if (v9 == v10)
    {
      v11 = AXMediaLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        [v6 timestamp];
        int v33 = 134217984;
        uint64_t v34 = v12;
        _os_log_impl(&dword_24019A000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring device motion for previously handled timestamp %f", (uint8_t *)&v33, 0xCu);
      }
    }
    else
    {
      v13 = [v6 attitude];
      v14 = (void *)[v13 copy];

      v15 = [v7 attitude];
      [v14 multiplyByInverseOfAttitude:v15];

      [v6 timestamp];
      double v17 = v16;
      [v7 timestamp];
      double v19 = v17 - v18;
      [v14 pitch];
      double v21 = fabs(v20 * 57.2957795) / v19;
      [v14 roll];
      double v23 = v22;
      [v14 yaw];
      double v25 = fabs(v24 * 57.2957795) / v19;
      BOOL v26 = v21 < 30.0 || v21 < v25;
      if (!v26
        || ((double v27 = fabs(v23 * 57.2957795) / v19, v27 >= v25) ? (v28 = v27 < 30.0) : (v28 = 1),
            v28 ? (BOOL v29 = v25 > 100.0) : (BOOL v29 = 1),
            v29))
      {
        [v6 timestamp];
        -[AXCameraLevelingMotionAnalyzer set_lastUnstableMotionTimestamp:](self, "set_lastUnstableMotionTimestamp:");
      }
      [v6 timestamp];
      double v31 = v30;
      [(AXCameraLevelingMotionAnalyzer *)self _lastUnstableMotionTimestamp];
      [(AXCameraLevelingMotionAnalyzer *)self set_cameraStableForLeveling:v31 - v32 >= 0.6];
    }
  }
  else
  {
    [(AXCameraLevelingMotionAnalyzer *)self set_cameraStableForLeveling:0];
    [v6 timestamp];
    -[AXCameraLevelingMotionAnalyzer set_lastUnstableMotionTimestamp:](self, "set_lastUnstableMotionTimestamp:");
  }
}

+ (int64_t)_levelZoneForDeviceMotion:(id)a3 previousZone:(int64_t)a4
{
  [a3 gravity];
  long double v6 = v5;
  double v9 = atan2(v8, -v7);
  long double v10 = acos(v6) + -1.57079633;
  uint64_t v11 = [(id)objc_opt_class() _deviceOrientationForRotation:v9 * 57.2957795 shift:(double)(v10 * 57.2957795)];
  [(id)objc_opt_class() _offsetFromLevelForOrientation:v11 rotation:v9 shift:(double)v10];
  double v13 = fabs(v12);
  if ((unint64_t)(v11 - 5) < 0xFFFFFFFFFFFFFFFCLL || v13 > 25.0) {
    return 0;
  }
  double v16 = 2.0;
  if (a4 == 1) {
    double v16 = 4.5;
  }
  int64_t v17 = 2;
  if (v12 > 0.0) {
    int64_t v17 = 3;
  }
  if (v13 < v16) {
    return 1;
  }
  else {
    return v17;
  }
}

+ (int64_t)_deviceOrientationForRotation:(double)a3 shift:(double)a4
{
  if (fabs(a4) <= 45.0)
  {
    double v5 = fabs(a3);
    if (v5 >= 45.0)
    {
      if (v5 <= 135.0)
      {
        if (a3 <= 45.0 || a3 >= 135.0)
        {
          if (a3 > -135.0 && a3 < -45.0) {
            return 4;
          }
          else {
            return 0;
          }
        }
        else
        {
          return 3;
        }
      }
      else
      {
        return 2;
      }
    }
    else
    {
      return 1;
    }
  }
  else if (a4 <= 0.0)
  {
    return 6;
  }
  else
  {
    return 5;
  }
}

+ (double)_offsetFromLevelForOrientation:(int64_t)a3 rotation:(double)a4 shift:(double)a5
{
  switch(a3)
  {
    case 1:
      return a4 * 57.2957795;
    case 2:
      if (a4 <= 3.14159265)
      {
        if (a4 < -3.14159265) {
          a4 = a4 + 6.28318531;
        }
      }
      else
      {
        a4 = -(6.28318531 - a4);
      }
      double v7 = a4 + -3.14159265;
      if (a4 + -3.14159265 <= 3.14159265)
      {
        if (v7 >= -3.14159265) {
          goto LABEL_28;
        }
        double v8 = 6.28318531;
      }
      else
      {
        double v8 = -6.28318531;
      }
      a4 = v7 + v8 + 3.14159265;
LABEL_28:
      double v13 = a4 * 57.2957795;
      double v14 = -180.0;
      return v13 + v14;
    case 3:
      if (a4 <= 3.14159265)
      {
        if (a4 < -3.14159265) {
          a4 = a4 + 6.28318531;
        }
      }
      else
      {
        a4 = -(6.28318531 - a4);
      }
      double v9 = a4 + -1.57079633;
      if (a4 + -1.57079633 <= 3.14159265)
      {
        if (v9 >= -3.14159265) {
          goto LABEL_32;
        }
        double v10 = 6.28318531;
      }
      else
      {
        double v10 = -6.28318531;
      }
      a4 = v9 + v10 + 1.57079633;
LABEL_32:
      double v13 = a4 * 57.2957795;
      double v14 = -90.0;
      return v13 + v14;
    case 4:
      if (a4 <= 3.14159265)
      {
        if (a4 < -3.14159265) {
          a4 = a4 + 6.28318531;
        }
      }
      else
      {
        a4 = -(6.28318531 - a4);
      }
      double v11 = a4 + 2.35619449;
      if (a4 + 2.35619449 <= 3.14159265)
      {
        if (v11 >= -3.14159265) {
          goto LABEL_36;
        }
        double v12 = 6.28318531;
      }
      else
      {
        double v12 = -6.28318531;
      }
      a4 = v11 + v12 + -2.35619449;
LABEL_36:
      double v13 = a4 * 57.2957795;
      double v14 = 90.0;
      return v13 + v14;
    case 5:
      double v5 = -1.57079633;
      goto LABEL_11;
    case 6:
      double v5 = 1.57079633;
LABEL_11:
      a4 = a5 + v5;
      return a4 * 57.2957795;
    default:
      return 0.0;
  }
}

- (CMDeviceMotion)_lastDeviceMotion
{
  return self->__lastDeviceMotion;
}

- (void)set_lastDeviceMotion:(id)a3
{
}

- (BOOL)_cameraStableForLeveling
{
  return self->__cameraStableForLeveling;
}

- (void)set_cameraStableForLeveling:(BOOL)a3
{
  self->__cameraStableForLeveling = a3;
}

- (double)_lastUnstableMotionTimestamp
{
  return self->__lastUnstableMotionTimestamp;
}

- (void)set_lastUnstableMotionTimestamp:(double)a3
{
  self->__lastUnstableMotionTimestamp = a3;
}

- (void).cxx_destruct
{
}

@end