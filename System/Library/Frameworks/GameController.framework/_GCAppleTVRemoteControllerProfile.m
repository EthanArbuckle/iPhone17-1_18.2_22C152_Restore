@interface _GCAppleTVRemoteControllerProfile
- (BOOL)ownershipClaimingElementsZero;
- (_GCAppleTVRemoteControllerProfile)initWithController:(id)a3;
- (id)name;
- (int64_t)deviceType;
- (unint64_t)owner;
- (unsigned)sampleRate;
- (void)digitizerTouchEvent:(id)a3 x:(double)a4 y:(double)a5 timestamp:(unint64_t)a6 forceSkipDpadRotation:(BOOL)a7;
- (void)digitizerTouchUp:(id)a3 timestamp:(unint64_t)a4 forceSkipDpadRotation:(BOOL)a5;
- (void)getPositionInSlidingWindowForRealX:(double)a3 realY:(double)a4 outXInWindow:(double *)a5 outYInWindow:(double *)a6;
- (void)handleReport:(unsigned int)a3 data:(id)a4;
- (void)initCommon:(id)a3;
- (void)processOrientationData:(id)a3;
- (void)setAllowsRotation:(BOOL)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setDpad:(id)a3 x:(double)a4 y:(double)a5 timestamp:(unint64_t)a6 forceSkipDpadRotation:(BOOL)a7;
- (void)setOwner:(unint64_t)a3;
@end

@implementation _GCAppleTVRemoteControllerProfile

- (void)setOwner:(unint64_t)a3
{
  if (self->_owner != a3)
  {
    v5 = [(GCPhysicalInputProfile *)self _motion];
    objc_msgSend(v5, "_setGravity:", 0.0, 0.0, -1.0);

    v6 = [(GCPhysicalInputProfile *)self _motion];
    objc_msgSend(v6, "_setUserAcceleration:", 0.0, 0.0, 0.0);

    v7 = [(GCPhysicalInputProfile *)self _motion];
    objc_msgSend(v7, "_setAttitude:", 0.0, 0.0, 0.0, 1.0);

    v8 = [(GCPhysicalInputProfile *)self _motion];
    objc_msgSend(v8, "_setRotationRate:", 0.0, 0.0, 0.0);

    v9 = [(GCPhysicalInputProfile *)self _motion];
    uint64_t v10 = [v9 valueChangedHandler];
    if (v10)
    {
      v11 = (void *)v10;
      v12 = [(GCPhysicalInputProfile *)self controller];
      v13 = [v12 handlerQueue];

      if (!v13) {
        goto LABEL_6;
      }
      v9 = [(GCPhysicalInputProfile *)self controller];
      v14 = [v9 handlerQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __46___GCAppleTVRemoteControllerProfile_setOwner___block_invoke;
      block[3] = &unk_26D22A8C0;
      block[4] = self;
      dispatch_async(v14, block);
    }
LABEL_6:
    v15 = [(GCPhysicalInputProfile *)self _motion];
    uint64_t v16 = [v15 internalValueChangedHandler];
    if (v16)
    {
      v17 = (void *)v16;
      v18 = [(GCPhysicalInputProfile *)self controller];
      v19 = [v18 handlerQueue];

      if (!v19)
      {
LABEL_10:
        self->_owner = a3;
        return;
      }
      v15 = [(GCPhysicalInputProfile *)self controller];
      v20 = [v15 handlerQueue];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = __46___GCAppleTVRemoteControllerProfile_setOwner___block_invoke_2;
      v21[3] = &unk_26D22A8C0;
      v21[4] = self;
      dispatch_async(v20, v21);
    }
    goto LABEL_10;
  }
}

- (BOOL)ownershipClaimingElementsZero
{
  v3 = [(GCMicroGamepad *)self buttonA];
  [v3 value];
  if (v4 == 0.0)
  {
    v5 = [(GCMicroGamepad *)self buttonX];
    [v5 value];
    if (v6 == 0.0)
    {
      v7 = [(GCMicroGamepad *)self dpad];
      v8 = [v7 xAxis];
      [v8 value];
      if (v9 == 0.0)
      {
        uint64_t v10 = [(GCMicroGamepad *)self dpad];
        v11 = [v10 yAxis];
        [v11 value];
        BOOL v13 = v12 == 0.0;
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (unsigned)sampleRate
{
  return self->_sampleCount;
}

- (void)handleReport:(unsigned int)a3 data:(id)a4
{
  if (a3 == 226)
  {
    uint64_t v5 = [a4 bytes];
    unsigned int v6 = (unsigned __int16)(*(_WORD *)(v5 + 10) << 7);
    if (8 * *(_WORD *)(v5 + 8)) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      uint64_t v8 = v5;
      double v9 = NormalizedLogicalAxisValueRaw((double)(__int16)(8 * *(_WORD *)(v5 + 8)) / 10240.0, -0.5, 0.5);
      double v10 = NormalizedLogicalAxisValueRaw((double)v6 / 10240.0, 2.7, 5.0);
      if (*(_WORD *)(v8 + 12))
      {
        double v11 = v10;
      }
      else
      {
        double v9 = 0.0;
        double v11 = 0.0;
      }
      id v12 = [(GCMicroGamepad *)self dpad];
      [(GCPhysicalInputProfile *)self setDpad:v12 x:-v11 y:v9];
    }
  }
}

- (void)processOrientationData:(id)a3
{
  [a3 gravity];
  double v6 = fabs(v4);
  if (v5 <= -1.0 || v5 >= -0.55 || v6 >= 0.2)
  {
    if (fabs(v5) >= 0.2 || (v6 > 0.55 ? (BOOL v8 = v6 < 1.0) : (BOOL v8 = 0), !v8))
    {
      if (self->_candidateOrientation == -1) {
        return;
      }
      id v12 = 0;
      self->_candidateOrientation = -1;
      char v13 = 1;
      goto LABEL_21;
    }
    if (v4 < 0.0) {
      int v7 = 1;
    }
    else {
      int v7 = 2;
    }
  }
  else
  {
    int v7 = 0;
  }
  if (v7 == self->_candidateOrientation)
  {
    if (v7 != self->_orientation)
    {
      double v9 = +[NSDate date];
      [v9 timeIntervalSinceDate:self->_candidateOrientationTimestamp];
      double v11 = v10;

      if (v11 >= 1.2) {
        self->_orientation = self->_candidateOrientation;
      }
    }
    return;
  }
  self->_candidateOrientation = v7;
  id v12 = +[NSDate date];
  char v13 = 0;
LABEL_21:
  id v14 = v12;
  objc_storeStrong((id *)&self->_candidateOrientationTimestamp, v12);
  if ((v13 & 1) == 0)
  {
  }
}

- (void)digitizerTouchEvent:(id)a3 x:(double)a4 y:(double)a5 timestamp:(unint64_t)a6 forceSkipDpadRotation:(BOOL)a7
{
  BOOL v7 = a7;
  unsigned int digitizerTouchState = self->_digitizerTouchState;
  if (digitizerTouchState)
  {
    if (digitizerTouchState != 1) {
      goto LABEL_6;
    }
    unsigned int v13 = 2;
  }
  else
  {
    unsigned int v13 = 1;
  }
  self->_unsigned int digitizerTouchState = v13;
LABEL_6:
  id v14 = a3;
  kdebug_trace();
  [(_GCAppleTVRemoteControllerProfile *)self setDpad:v14 x:a6 y:v7 timestamp:a4 forceSkipDpadRotation:a5];
}

- (void)digitizerTouchUp:(id)a3 timestamp:(unint64_t)a4 forceSkipDpadRotation:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  kdebug_trace();
  self->_unsigned int digitizerTouchState = 0;
  [(_GCAppleTVRemoteControllerProfile *)self setDpad:v8 x:a4 y:v5 timestamp:0.0 forceSkipDpadRotation:0.0];
}

- (void)getPositionInSlidingWindowForRealX:(double)a3 realY:(double)a4 outXInWindow:(double *)a5 outYInWindow:(double *)a6
{
  *a5 = 0.0;
  *a6 = 0.0;
  double v6 = a3 - self->_windowX;
  double v7 = a4 - self->_windowY;
  double deadzoneSize = self->_deadzoneSize;
  if (sqrt(v7 * v7 + v6 * v6) >= deadzoneSize)
  {
    double v12 = atan2(a4 - self->_windowY, v6);
    __double2 v13 = __sincos_stret(v12);
    *a5 = v6 - deadzoneSize * v13.__cosval;
    *a6 = v7 - self->_deadzoneSize * v13.__sinval;
    *a5 = clamp(*a5 / (self->_windowSize - self->_deadzoneSize), -1.0, 1.0);
    *a6 = clamp(*a6 / (self->_windowSize - self->_deadzoneSize), -1.0, 1.0);
  }
}

- (void)setDpad:(id)a3 x:(double)a4 y:(double)a5 timestamp:(unint64_t)a6 forceSkipDpadRotation:(BOOL)a7
{
  id v11 = a3;
  if ([(GCMicroGamepad *)self reportsAbsoluteDpadValues]) {
    goto LABEL_28;
  }
  double v27 = 0.0;
  double v28 = 0.0;
  unsigned int digitizerTouchState = self->_digitizerTouchState;
  if (digitizerTouchState)
  {
    if (digitizerTouchState == 1)
    {
      self->_double windowSize = 0.5;
      self->_double deadzoneSize = 0.03;
      memset_pattern16(self->_windowBufferSize, &unk_220A91E80, 0x20uLL);
      self->_double windowX = a4;
      self->_double windowY = a5;
      goto LABEL_26;
    }
    double windowX = self->_windowX;
    double windowSize = self->_windowSize;
    if (vabdd_f64(a4, windowX) > windowSize)
    {
      if (windowX <= a4)
      {
        double v17 = self->_windowBufferSize[3];
        if (windowX + windowSize > 1.0 - v17) {
          goto LABEL_16;
        }
        double v16 = a4 - windowSize;
        if (v16 >= 0.5 - v17) {
          double v16 = 0.5 - v17;
        }
      }
      else
      {
        double v15 = self->_windowBufferSize[2];
        if (windowX - windowSize < v15 + -1.0) {
          goto LABEL_16;
        }
        double v16 = windowSize + a4;
        if (v16 < v15 + -0.5) {
          double v16 = v15 + -0.5;
        }
      }
      self->_double windowX = v16;
    }
LABEL_16:
    double windowY = self->_windowY;
    double v19 = self->_windowSize;
    if (vabdd_f64(a5, windowY) > v19)
    {
      windowBufferSize = self->_windowBufferSize;
      if (windowY <= a5)
      {
        double v23 = *windowBufferSize;
        if (windowY + v19 > 1.0 - *windowBufferSize) {
          goto LABEL_26;
        }
        double v22 = a5 - v19;
        if (v22 >= 0.5 - v23) {
          double v22 = 0.5 - v23;
        }
      }
      else
      {
        double v21 = self->_windowBufferSize[1];
        if (windowY - v19 < v21 + -1.0) {
          goto LABEL_26;
        }
        double v22 = v19 + a5;
        if (v22 < v21 + -0.5) {
          double v22 = v21 + -0.5;
        }
      }
      self->_double windowY = v22;
    }
LABEL_26:
    [(_GCAppleTVRemoteControllerProfile *)self getPositionInSlidingWindowForRealX:&v28 realY:&v27 outXInWindow:a4 outYInWindow:a5];
    goto LABEL_27;
  }
  self->_double windowX = 0.0;
  self->_double windowY = 0.0;
  self->_double windowSize = 0.0;
  self->_double deadzoneSize = 0.0;
  *(_OWORD *)self->_windowBufferSize = 0u;
  *(_OWORD *)&self->_windowBufferSize[2] = 0u;
LABEL_27:
  a5 = v27;
  a4 = v28;
  if (a7 || ![(GCMicroGamepad *)self allowsRotation]) {
    goto LABEL_33;
  }
LABEL_28:
  int orientation = self->_orientation;
  if (orientation == 1)
  {
    a5 = -a5;
    double v25 = a4;
    goto LABEL_34;
  }
  if (orientation == 2)
  {
    double v25 = -a4;
  }
  else
  {
LABEL_33:
    double v25 = a5;
    a5 = a4;
  }
LABEL_34:
  v26.receiver = self;
  v26.super_class = (Class)_GCAppleTVRemoteControllerProfile;
  [(GCPhysicalInputProfile *)&v26 setDpad:v11 x:a5 y:v25];
}

- (void)initCommon:(id)a3
{
  self->_int orientation = 0;
  self->_candidateOrientation = 0;
  candidateOrientationTimestamp = self->_candidateOrientationTimestamp;
  self->_candidateOrientationTimestamp = 0;
  id v5 = a3;

  double v6 = [[_GCAppleTVRemoteMotionProfile alloc] initWithController:v5];
  [(_GCAppleTVRemoteMotionProfile *)v6 _setMotionLite:1];
  [(GCPhysicalInputProfile *)self set_motion:v6];
  self->_unsigned int digitizerTouchState = 0;
  self->_double windowX = 0.0;
  self->_double windowY = 0.0;
}

- (_GCAppleTVRemoteControllerProfile)initWithController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_GCAppleTVRemoteControllerProfile;
  id v5 = [(GCPhysicalInputProfile *)&v8 initWithController:v4];
  double v6 = v5;
  if (v5) {
    [(_GCAppleTVRemoteControllerProfile *)v5 initCommon:v4];
  }

  return v6;
}

- (id)name
{
  return @"Remote";
}

- (void)setAllowsRotation:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(GCMicroGamepad *)self allowsRotation] != a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)_GCAppleTVRemoteControllerProfile;
    [(GCMicroGamepad *)&v10 setAllowsRotation:v3];
    if (v3)
    {
      objc_initWeak(&location, self);
      objc_copyWeak(&v8, &location);
      id v5 = [(GCPhysicalInputProfile *)self _motion];
      [v5 setInternalValueChangedHandler:&v7];

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    else
    {
      double v6 = [(GCPhysicalInputProfile *)self _motion];
      [v6 setInternalValueChangedHandler:0];
    }
  }
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  if (gc_isInternalBuild())
  {
    uint64_t v7 = getGCLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      double v9 = self;
      __int16 v10 = 2048;
      int64_t v11 = a3;
      _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_DEFAULT, "Setting %@ device type to %ld", (uint8_t *)&v8, 0x16u);
    }
  }
  id v5 = [(GCPhysicalInputProfile *)self controller];
  [v5 setForwarded:(unint64_t)(a3 - 3) < 2];

  self->_deviceType = a3;
  double v6 = [(GCPhysicalInputProfile *)self controller];
  [v6 setVendorName:0];
}

- (unint64_t)owner
{
  return self->_owner;
}

- (void).cxx_destruct
{
}

@end