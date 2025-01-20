@interface BSUIBackdropView
- (double)rasterizationScale;
- (double)scaleForNoBlur;
- (void)applySettings:(id)a3;
- (void)setRasterizationScale:(double)a3;
- (void)setScaleForNoBlur:(double)a3;
- (void)transitionComplete;
- (void)transitionIncrementallyToSettings:(id)a3 weighting:(double)a4;
@end

@implementation BSUIBackdropView

- (void)transitionIncrementallyToSettings:(id)a3 weighting:(double)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!BSFloatIsZero()) {
    goto LABEL_15;
  }
  v7 = [(_UIBackdropView *)self inputSettings];
  [v7 blurRadius];
  uint64_t v9 = v8;

  [v6 blurRadius];
  uint64_t v11 = v10;
  int IsZero = BSFloatIsZero();
  int v13 = BSFloatIsZero();
  char v14 = v13;
  if (IsZero == v13)
  {
    if (self->_scaleForNoBlur <= 0.0) {
      double scaleForNoBlur = 1.0;
    }
    else {
      double scaleForNoBlur = self->_scaleForNoBlur;
    }
    if (IsZero)
    {
      self->_double initialScale = scaleForNoBlur;
      if (v13) {
        goto LABEL_12;
      }
    }
    else
    {
      v19 = [(_UIBackdropView *)self inputSettings];
      [v19 scale];
      self->_double initialScale = v20;

      if (v14) {
        goto LABEL_12;
      }
    }
    [v6 scale];
    double scaleForNoBlur = v21;
    goto LABEL_12;
  }
  v15 = [(_UIBackdropView *)self inputSettings];
  [v15 scale];
  self->_double initialScale = v16 + v16;

  [v6 scale];
  double scaleForNoBlur = v17 + v17;
LABEL_12:
  self->_double finalScale = scaleForNoBlur;
  v22 = BSLogCommon();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    double initialScale = self->_initialScale;
    double finalScale = self->_finalScale;
    *(_DWORD *)buf = 134218752;
    double v27 = initialScale;
    __int16 v28 = 2048;
    double v29 = finalScale;
    __int16 v30 = 2048;
    uint64_t v31 = v9;
    __int16 v32 = 2048;
    uint64_t v33 = v11;
    _os_log_debug_impl(&dword_1A2B0C000, v22, OS_LOG_TYPE_DEBUG, "Setting initialScale:%f, finalScale: %f, initialRadius:%f, finalRadius: %f", buf, 0x2Au);
  }

LABEL_15:
  self->_transitionProgress = a4;
  v25.receiver = self;
  v25.super_class = (Class)BSUIBackdropView;
  [(_UIBackdropView *)&v25 transitionIncrementallyToSettings:v6 weighting:a4];
}

- (void)applySettings:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_rasterizationScale > 0.0)
  {
    v5 = [(_UIBackdropView *)self effectView];
    id v6 = [v5 layer];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    [v7 setRasterizationScale:self->_rasterizationScale];
  }
  if (self->_initialScale <= 0.0 || (double v8 = self->_finalScale, v8 <= 0.0))
  {
    int v13 = BSLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      double finalScale = self->_finalScale;
      *(_DWORD *)buf = 134217984;
      *(double *)&uint8_t buf[4] = finalScale;
      _os_log_debug_impl(&dword_1A2B0C000, v13, OS_LOG_TYPE_DEBUG, "Not changing scale because _finalScale: %f", buf, 0xCu);
    }

    v17.receiver = self;
    v17.super_class = (Class)BSUIBackdropView;
    [(_UIBackdropView *)&v17 applySettings:v4];
  }
  else
  {
    *(double *)buf = self->_initialScale;
    buf[8] = 1;
    *(_DWORD *)&buf[9] = 0;
    *(_DWORD *)&buf[12] = 0;
    *(double *)&buf[16] = v8;
    LOBYTE(v20) = 1;
    *(_DWORD *)((char *)&v20 + 1) = 0;
    HIDWORD(v20) = 0;
    BSIntervalValueForFraction();
    uint64_t v10 = v9;
    objc_msgSend(v4, "setScale:");
    uint64_t v11 = BSLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      double v15 = self->_finalScale;
      double transitionProgress = self->_transitionProgress;
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2048;
      double v20 = transitionProgress;
      _os_log_debug_impl(&dword_1A2B0C000, v11, OS_LOG_TYPE_DEBUG, "Applying scale: %f for finalScale: %f, transitionProgress: %f", buf, 0x20u);
    }

    BOOL v12 = [(_UIBackdropView *)self applyingTransition];
    [(_UIBackdropView *)self setApplyingTransition:0];
    v18.receiver = self;
    v18.super_class = (Class)BSUIBackdropView;
    [(_UIBackdropView *)&v18 applySettings:v4];
    [(_UIBackdropView *)self setApplyingTransition:v12];
  }
}

- (void)transitionComplete
{
  self->_double transitionProgress = 0.0;
  self->_double initialScale = 0.0;
  self->_double finalScale = 0.0;
  v2.receiver = self;
  v2.super_class = (Class)BSUIBackdropView;
  [(_UIBackdropView *)&v2 transitionComplete];
}

- (double)scaleForNoBlur
{
  return self->_scaleForNoBlur;
}

- (void)setScaleForNoBlur:(double)a3
{
  self->_double scaleForNoBlur = a3;
}

- (double)rasterizationScale
{
  return self->_rasterizationScale;
}

- (void)setRasterizationScale:(double)a3
{
  self->_rasterizationScale = a3;
}

@end