@interface PKInputPointUtility
+ ($F30B99E357B462A7BBD676CBC61D9025)drawingInputPoint:(SEL)a3 view:(CGPoint)a4 touch:(id)a5 predicted:(id)a6 activeInputProperties:(BOOL)a7;
+ (unint64_t)activeInputPropertiesFromTouchProperties:(int64_t)a3;
@end

@implementation PKInputPointUtility

+ (unint64_t)activeInputPropertiesFromTouchProperties:(int64_t)a3
{
  return a3 & 0x10 | (4 * (a3 & 1)) | ((unint64_t)a3 >> 1) & 3;
}

+ ($F30B99E357B462A7BBD676CBC61D9025)drawingInputPoint:(SEL)a3 view:(CGPoint)a4 touch:(id)a5 predicted:(id)a6 activeInputProperties:(BOOL)a7
{
  char v8 = a8;
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v15 = a5;
  id v16 = a6;
  objc_msgSend(v16, "PK_rollAngle");
  double v18 = v17;
  [v16 maximumPossibleForce];
  double v19 = -1.0;
  if (v20 > 0.0)
  {
    [v16 force];
    if (fabs(v21) == INFINITY)
    {
      v23 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C44F8000, v23, OS_LOG_TYPE_ERROR, "Got non-finite force from UITouch", buf, 2u);
      }

      [v16 maximumPossibleForce];
      double v19 = v24 * 0.5;
    }
    else
    {
      [v16 force];
      double v19 = v22;
    }
  }
  if ([v16 type] == 2)
  {
    double v25 = 0.0;
    if (v8)
    {
      [v16 azimuthAngleInView:v15];
      if (fabs(v26) == INFINITY)
      {
        v29 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v38 = 0;
          _os_log_error_impl(&dword_1C44F8000, v29, OS_LOG_TYPE_ERROR, "Got non-finite azimuthAngle from UITouch", v38, 2u);
        }
      }
      else
      {
        double v25 = v26 + -3.14159265;
      }
    }
    double v27 = 0.785398163;
    if ((v8 & 2) != 0)
    {
      [v16 altitudeAngle];
      if (fabs(v30) == INFINITY)
      {
        v31 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v37 = 0;
          _os_log_error_impl(&dword_1C44F8000, v31, OS_LOG_TYPE_ERROR, "Got non-finite altitudeAngle from UITouch", v37, 2u);
        }
      }
      else
      {
        double v27 = 1.57079633 - v30;
      }
    }
    v32 = [v16 estimationUpdateIndex];

    if (v32)
    {
      v33 = [v16 estimationUpdateIndex];
      int64_t v28 = [v33 integerValue];
    }
    else
    {
      int64_t v28 = -1;
    }
  }
  else
  {
    double v27 = 0.0;
    int64_t v28 = -1;
    double v25 = 0.0;
  }
  *(_OWORD *)&retstr->var11 = 0u;
  *(_OWORD *)&retstr->var13 = 0u;
  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  retstr->var0.var0.CGFloat x = x;
  retstr->var0.var0.CGFloat y = y;
  retstr->var1 = v19;
  retstr->var2 = v25;
  retstr->var3 = v27;
  retstr->var5 = 0.0;
  retstr->var6 = 0.0;
  retstr->var4 = 0.0;
  [v16 timestamp];
  retstr->var7 = v34;
  retstr->var8 = a7;
  retstr->var9 = v28;
  retstr->var10 = 0.0;
  if (([v16 estimatedProperties] & 2) != 0) {
    LOBYTE(v35) = 1;
  }
  else {
    unint64_t v35 = ((unint64_t)[v16 estimatedProperties] >> 2) & 1;
  }
  retstr->var11 = v35;
  retstr->var12 = v18;
  retstr->var13 = objc_msgSend(a2, "activeInputPropertiesFromTouchProperties:", objc_msgSend(v16, "estimatedProperties"));
  retstr->var14 = objc_msgSend(a2, "activeInputPropertiesFromTouchProperties:", objc_msgSend(v16, "estimatedPropertiesExpectingUpdates"));

  return result;
}

@end