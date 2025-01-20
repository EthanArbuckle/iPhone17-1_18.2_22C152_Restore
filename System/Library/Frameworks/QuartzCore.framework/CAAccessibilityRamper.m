@interface CAAccessibilityRamper
- (CAAccessibilityRamper)initWithDisplay:(id)a3;
- (double)axScaleBegin;
- (double)axScaleEnd;
- (void)rampCallback:(id)a3;
- (void)setAxScaleBegin:(double)a3;
- (void)setAxScaleEnd:(double)a3;
@end

@implementation CAAccessibilityRamper

- (void)setAxScaleEnd:(double)a3
{
  self->_axScaleEnd = a3;
}

- (double)axScaleEnd
{
  return self->_axScaleEnd;
}

- (void)setAxScaleBegin:(double)a3
{
  self->_axScaleBegin = a3;
}

- (double)axScaleBegin
{
  return self->_axScaleBegin;
}

- (void)rampCallback:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  [(CAAccessibilityRamper *)self axScaleBegin];
  double v6 = v5;
  [(CAAccessibilityRamper *)self axScaleEnd];
  double v8 = v7;
  [(CAWindowServerRamper *)self beginTime];
  if (v9 <= 0.0)
  {
    [a3 targetTimestamp];
    -[CAWindowServerRamper setBeginTime:](self, "setBeginTime:");
  }
  [a3 targetTimestamp];
  double v11 = v10;
  [(CAWindowServerRamper *)self beginTime];
  double v13 = v11 - v12;
  [(CAWindowServerRamper *)self duration];
  if (v13 / v14 > 1.0
    || ([a3 targetTimestamp],
        double v16 = v15,
        [(CAWindowServerRamper *)self beginTime],
        double v18 = v16 - v17,
        [(CAWindowServerRamper *)self duration],
        double v20 = v18 / v19,
        double v21 = 0.0,
        v20 >= 0.0))
  {
    [a3 targetTimestamp];
    double v23 = v22;
    [(CAWindowServerRamper *)self beginTime];
    double v25 = v23 - v24;
    [(CAWindowServerRamper *)self duration];
    double v27 = v25 / v26;
    double v21 = 1.0;
    if (v27 <= 1.0)
    {
      [a3 targetTimestamp];
      double v29 = v28;
      [(CAWindowServerRamper *)self beginTime];
      double v31 = v29 - v30;
      [(CAWindowServerRamper *)self duration];
      double v21 = v31 / v32;
    }
  }
  double v33 = pow(v6 / v8, 2.22044605e-16 - v21) * v6;
  if (x_log_hook_p())
  {
    [(CAWindowServerRamper *)self id];
    x_log_();
  }
  else
  {
    v34 = x_log_category_windowserver;
    if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v41 = [(CAWindowServerRamper *)self id];
      __int16 v42 = 2048;
      double v43 = v33;
      _os_log_impl(&dword_184668000, v34, OS_LOG_TYPE_DEFAULT, "Ramp %d: Setting AX Scale to %g", buf, 0x12u);
    }
  }
  if ((*(void *)&v33 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v35 = [(CAWindowServerRamper *)self display];
    *(float *)&double v36 = v33;
    [(CAWindowServerDisplay *)v35 setAccessibilityColorMatrix:&xmmword_1849A8258 scale:v36];
  }
  if (v21 == 1.0)
  {
    [a3 invalidate];
    Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
    if (x_log_hook_p())
    {
      [(CAWindowServerRamper *)self id];
      x_log_();
    }
    else
    {
      v38 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = [(CAWindowServerRamper *)self id];
        *(_DWORD *)buf = 67109120;
        int v41 = v39;
        _os_log_impl(&dword_184668000, v38, OS_LOG_TYPE_DEFAULT, "Ramp %d: Complete", buf, 8u);
      }
    }
  }
}

- (CAAccessibilityRamper)initWithDisplay:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CAAccessibilityRamper;
  v3 = [(CAWindowServerRamper *)&v6 initWithDisplay:a3];
  v4 = v3;
  if (v3)
  {
    [(CAAccessibilityRamper *)v3 setAxScaleBegin:NAN];
    [(CAAccessibilityRamper *)v4 setAxScaleEnd:NAN];
  }
  return v4;
}

@end