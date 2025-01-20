@interface CSLUIInertialUpdater
- (BOOL)_needsDisplayLink;
- (CGPoint)_constrainedOffset:(CGPoint)a3;
- (CSLUIInertialUpdaterDelegate)delegate;
- (void)_beginDraggingIfNecessary;
- (void)_computeDecelerationTarget;
- (void)_decelerate:(double)a3;
- (void)_displayLinkFired:(id)a3;
- (void)_finalizeOffset;
- (void)_handleDragDelta:(CGPoint)a3;
- (void)_updateDelegateWithDelta:(CGPoint)a3;
- (void)_updateDisplayLink;
- (void)addDragDelta:(CGPoint)a3;
- (void)endDragging;
- (void)endUpdating;
- (void)setDelegate:(id)a3;
@end

@implementation CSLUIInertialUpdater

- (void)addDragDelta:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CSLUIInertialUpdater *)self _beginDraggingIfNecessary];

  -[CSLUIInertialUpdater _handleDragDelta:](self, "_handleDragDelta:", x, y);
}

- (void)endDragging
{
  v3.f64[0] = self->_velocity.x;
  self->_dragging = 0;
  self->_offset = CGPointZero;
  __asm { FMOV            V3.2D, #0.25 }
  v3.f64[1] = self->_velocity.y;
  __asm { FMOV            V2.2D, #0.75 }
  self->_velocitdouble y = (CGPoint)vmlaq_f64(vmulq_f64((float64x2_t)self->_lastVelocity, _Q3), _Q2, v3);
  [(CSLUIInertialUpdater *)self _computeDecelerationTarget];
  [(CSLUIInertialUpdater *)self _updateDisplayLink];
  if (!self->_displayLink)
  {
    delegate = self->_delegate;
    [(CSLUIInertialUpdaterDelegate *)delegate inertialUpdaterFinishedScrolling:self];
  }
}

- (void)endUpdating
{
  if (self->_displayLink)
  {
    self->_dragging = 0;
    self->_target = (CGPoint)vdupq_n_s64(0x7FF8000000000000uLL);
    [(CSLUIInertialUpdater *)self _updateDisplayLink];
    delegate = self->_delegate;
    [(CSLUIInertialUpdaterDelegate *)delegate inertialUpdaterFinishedScrolling:self];
  }
}

- (BOOL)_needsDisplayLink
{
  if (self->_dragging) {
    return 0;
  }
  double x = self->_offset.x;
  BOOL v4 = vabdd_f64(x, self->_target.x) < 0.001 && vabdd_f64(self->_offset.y, self->_target.y) < 0.001;
  BOOL v5 = vabdd_f64(x, self->_clientTarget.x) < 0.001 && vabdd_f64(self->_offset.y, self->_clientTarget.y) < 0.001;
  return !v4 || !v5;
}

- (void)_updateDisplayLink
{
  unsigned int v3 = [(CSLUIInertialUpdater *)self _needsDisplayLink];
  displayLink = self->_displayLink;
  if (v3)
  {
    if (displayLink) {
      return;
    }
    BOOL v5 = +[CADisplayLink displayLinkWithTarget:self selector:"_displayLinkFired:"];
    v6 = self->_displayLink;
    self->_displayLink = v5;

    v7 = self->_displayLink;
    uint64_t v9 = +[NSRunLoop currentRunLoop];
    [(CADisplayLink *)v7 addToRunLoop:v9 forMode:NSRunLoopCommonModes];
    v8 = (CADisplayLink *)v9;
  }
  else
  {
    if (!displayLink) {
      return;
    }
    [(CADisplayLink *)displayLink invalidate];
    v8 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (void)_updateDelegateWithDelta:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = cslprf_ui_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_289B8(v6, x, y);
  }

  -[CSLUIInertialUpdaterDelegate inertialUpdater:scrolledWithDelta:](self->_delegate, "inertialUpdater:scrolledWithDelta:", self, x, y);
}

- (CGPoint)_constrainedOffset:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v6 = self->_clientTarget.x;
  if (a3.x > v6 && self->_target.x >= a3.x || a3.x < v6 && self->_target.x <= a3.x)
  {
    int v7 = 1;
  }
  else
  {
    int v7 = 0;
    double v6 = a3.x;
  }
  double v8 = self->_clientTarget.y;
  if (a3.y <= v8 || self->_target.y < a3.y)
  {
    if (a3.y >= v8)
    {
      double v8 = a3.y;
      if (!v7)
      {
LABEL_14:
        double v8 = a3.y;
        goto LABEL_19;
      }
    }
    else
    {
      if (self->_target.y > a3.y) {
        double v8 = a3.y;
      }
      else {
        LOBYTE(v7) = 1;
      }
      if ((v7 & 1) == 0) {
        goto LABEL_14;
      }
    }
  }
  uint64_t v9 = cslprf_ui_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    CGFloat v12 = self->_target.x;
    CGFloat v13 = self->_target.y;
    CGFloat v14 = self->_clientTarget.x;
    CGFloat v15 = self->_clientTarget.y;
    int v16 = 134219776;
    CGFloat v17 = x;
    __int16 v18 = 2048;
    CGFloat v19 = y;
    __int16 v20 = 2048;
    double v21 = v6;
    __int16 v22 = 2048;
    double v23 = v8;
    __int16 v24 = 2048;
    CGFloat v25 = v12;
    __int16 v26 = 2048;
    CGFloat v27 = v13;
    __int16 v28 = 2048;
    CGFloat v29 = v14;
    __int16 v30 = 2048;
    CGFloat v31 = v15;
    _os_log_debug_impl(&def_1A578, v9, OS_LOG_TYPE_DEBUG, "inertial updater: did constrain offset:{%.4f, %.4f} to offset:{%.4f, %.4f} target:{%.4f, %.4f} clientTarget:{%.4f, %.4f}", (uint8_t *)&v16, 0x52u);
  }

LABEL_19:
  double v10 = v6;
  double v11 = v8;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (void)_decelerate:(double)a3
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  float v6 = a3 * 1000.0;
  double v7 = powf(0.975, v6);
  double v8 = 1.0 - v7;
  CGFloat v9 = x * v7 + (1.0 - v7) * self->_target.x;
  self->_offset.double x = v9;
  float v10 = powf(0.994, v6);
  self->_offset.double y = y * v10 + (1.0 - v10) * self->_target.y;
  [(CSLUIInertialUpdater *)self _constrainedOffset:v9];
  double v13 = v12;
  double v14 = self->_offset.x;
  if (vabdd_f64(v11, v14) > 0.001)
  {
    double v14 = v14 * v7 + v8 * v11;
    self->_offset.double x = v14;
    self->_target.double x = self->_target.x * v7 + v8 * v11;
  }
  double v15 = self->_offset.y;
  if (vabdd_f64(v12, v15) > 0.001)
  {
    double v16 = powf(0.985, v6);
    double v15 = v15 * v16 + (1.0 - v16) * v13;
    self->_offset.double y = v15;
    self->_target.double y = self->_target.y * v16 + (1.0 - v16) * v13;
  }
  CGFloat v17 = cslprf_ui_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    CGFloat v18 = self->_offset.x;
    CGFloat v20 = self->_target.x;
    CGFloat v19 = self->_target.y;
    int v21 = 134219264;
    double v22 = v14 - x;
    __int16 v23 = 2048;
    double v24 = v15 - y;
    __int16 v25 = 2048;
    CGFloat v26 = v18;
    __int16 v27 = 2048;
    CGFloat v28 = v19;
    __int16 v29 = 2048;
    CGFloat v30 = v20;
    __int16 v31 = 2048;
    CGFloat v32 = v19;
    _os_log_debug_impl(&def_1A578, v17, OS_LOG_TYPE_DEBUG, "inertial updater: did decelerate with delta:{%.4f, %.4f} offset:{%.4f, %.4f} target:{%.4f, %.4f}", (uint8_t *)&v21, 0x3Eu);
  }

  -[CSLUIInertialUpdater _updateDelegateWithDelta:](self, "_updateDelegateWithDelta:", v14 - x, v15 - y);
}

- (void)_finalizeOffset
{
  float64x2_t v3 = vsubq_f64((float64x2_t)self->_clientTarget, (float64x2_t)self->_offset);
  if (qword_45E80 != -1)
  {
    float64x2_t v13 = v3;
    dispatch_once(&qword_45E80, &stru_3CE10);
    float64x2_t v3 = v13;
  }
  *(void *)&v4.f64[0] = qword_45E78;
  *(void *)&v4.f64[1] = qword_45E78;
  float64x2_t v12 = vdivq_f64(vcvtq_f64_f32(vrnda_f32(vcvt_f32_f64(vmulq_f64(v3, v4)))), v4);
  BOOL v5 = cslprf_ui_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    CGFloat x = self->_offset.x;
    CGFloat y = self->_offset.y;
    CGFloat v8 = self->_target.x;
    CGFloat v9 = self->_target.y;
    CGFloat v10 = self->_clientTarget.x;
    CGFloat v11 = self->_clientTarget.y;
    *(_DWORD *)buf = 134219776;
    float64_t v15 = v12.f64[0];
    __int16 v16 = 2048;
    *(float64_t *)((unint64_t)buf | 0xE) = v12.f64[1];
    __int16 v17 = 2048;
    CGFloat v18 = x;
    __int16 v19 = 2048;
    CGFloat v20 = y;
    __int16 v21 = 2048;
    CGFloat v22 = v8;
    __int16 v23 = 2048;
    CGFloat v24 = v9;
    __int16 v25 = 2048;
    CGFloat v26 = v10;
    __int16 v27 = 2048;
    CGFloat v28 = v11;
    _os_log_debug_impl(&def_1A578, v5, OS_LOG_TYPE_DEBUG, "inertial updater: did finalize delta:{%.4f, %.4f} with offset:{%.4f, %.4f} target:{%.4f, %.4f} clientTarget:{%.4f, %.4f}", buf, 0x52u);
  }

  if (v12.f64[0] != 0.0 || v12.f64[1] != 0.0) {
    -[CSLUIInertialUpdater _handleDragDelta:](self, "_handleDragDelta:", *(_OWORD *)&v12, *(void *)&v12.f64[0]);
  }
}

- (void)_displayLinkFired:(id)a3
{
  [a3 timestamp];
  double v5 = v4 - self->_lastDecelerationUpdate;
  self->_lastDecelerationUpdate = v4;
  [(CSLUIInertialUpdater *)self _decelerate:v5];
  [(CSLUIInertialUpdater *)self _updateDisplayLink];
  if (!self->_displayLink)
  {
    [(CSLUIInertialUpdater *)self _finalizeOffset];
    delegate = self->_delegate;
    [(CSLUIInertialUpdaterDelegate *)delegate inertialUpdaterFinishedScrolling:self];
  }
}

- (void)_beginDraggingIfNecessary
{
  if (!self->_dragging)
  {
    self->_dragging = 1;
    CGPoint v3 = (CGPoint)vdupq_n_s64(0x7FF8000000000000uLL);
    self->_velocitCGFloat y = v3;
    self->_lastVelocitCGFloat y = v3;
    self->_clientTarget = v3;
    self->_offset = v3;
    self->_lastInteractionTime = CACurrentMediaTime();
    self->_lastDecelerationUpdate = NAN;
    [(CSLUIInertialUpdater *)self _updateDisplayLink];
  }
}

- (void)_handleDragDelta:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = CACurrentMediaTime();
  self->_lastVelocitdouble y = self->_velocity;
  double v7 = v6 - self->_lastInteractionTime;
  self->_lastInteractionTime = v6;
  double v8 = 0.0166666667;
  if (v7 >= 0.001) {
    double v8 = v7;
  }
  self->_velocity.double x = x / v8;
  self->_velocity.double y = y / v8;

  -[CSLUIInertialUpdater _updateDelegateWithDelta:](self, "_updateDelegateWithDelta:", x, y);
}

- (void)_computeDecelerationTarget
{
  float64x2_t v3 = vmulq_f64((float64x2_t)self->_velocity, (float64x2_t)xmmword_2E9D0);
  if (qword_45E80 != -1)
  {
    float64x2_t v30 = v3;
    dispatch_once(&qword_45E80, &stru_3CE10);
    float64x2_t v3 = v30;
  }
  *(void *)&v4.f64[0] = qword_45E78;
  *(void *)&v4.f64[1] = qword_45E78;
  CGPoint v5 = (CGPoint)vdivq_f64(vcvtq_f64_f32(vrnda_f32(vcvt_f32_f64(vmulq_f64(v3, v4)))), v4);
  self->_target = v5;
  CGFloat y = v5.y;
  [(CSLUIInertialUpdaterDelegate *)self->_delegate inertialUpdater:self willDecelerateWithTarget:v5];
  double v8 = v7;
  double v10 = v9;
  self->_clientTarget.double x = v7;
  self->_clientTarget.CGFloat y = v9;
  int v11 = v7 < 0.0;
  double x = self->_target.x;
  int v13 = x >= 0.0;
  double v14 = fabs(x);
  double v15 = fabs(v8);
  if (v11 == v13 || v14 < v15)
  {
    self->_target.double x = v8;
    int v17 = 1;
  }
  else
  {
    int v17 = 0;
  }
  double v18 = self->_target.y;
  BOOL v19 = v18 >= 0.0;
  double v20 = fabs(v18);
  double v21 = fabs(v10);
  if (v10 < 0.0 == v19 || v20 < v21)
  {
    self->_target.CGFloat y = v10;
  }
  else if (!v17)
  {
    __int16 v23 = cslprf_ui_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219264;
      uint64_t v32 = v29;
      __int16 v33 = 2048;
      CGFloat v34 = y;
      __int16 v35 = 2048;
      double v36 = v8;
      __int16 v37 = 2048;
      double v38 = v10;
      __int16 v39 = 2048;
      double v40 = v8;
      __int16 v41 = 2048;
      double v42 = v10;
      CGFloat v24 = "inertial updater: computed deceleration target:{%.4f, %.4f} NOT constrained to clientTarget:{%.4f, %.4f} fro"
            "m correctedTarget:{%.4f, %.4f}";
      __int16 v25 = v23;
      uint32_t v26 = 62;
LABEL_21:
      _os_log_debug_impl(&def_1A578, v25, OS_LOG_TYPE_DEBUG, v24, buf, v26);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  __int16 v23 = cslprf_ui_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    CGFloat v27 = self->_target.x;
    CGFloat v28 = self->_target.y;
    *(_DWORD *)buf = 134219776;
    uint64_t v32 = v29;
    __int16 v33 = 2048;
    CGFloat v34 = y;
    __int16 v35 = 2048;
    double v36 = v8;
    __int16 v37 = 2048;
    double v38 = v10;
    __int16 v39 = 2048;
    double v40 = v8;
    __int16 v41 = 2048;
    double v42 = v10;
    __int16 v43 = 2048;
    CGFloat v44 = v27;
    __int16 v45 = 2048;
    CGFloat v46 = v28;
    CGFloat v24 = "inertial updater: computed deceleration target:{%.4f, %.4f} constrained to clientTarget:{%.4f, %.4f} from corr"
          "ectedTarget:{%.4f, %.4f} resulting target:{%.4f, %.4f}";
    __int16 v25 = v23;
    uint32_t v26 = 82;
    goto LABEL_21;
  }
LABEL_16:
}

- (CSLUIInertialUpdaterDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CSLUIInertialUpdaterDelegate *)a3;
}

- (void).cxx_destruct
{
}

@end