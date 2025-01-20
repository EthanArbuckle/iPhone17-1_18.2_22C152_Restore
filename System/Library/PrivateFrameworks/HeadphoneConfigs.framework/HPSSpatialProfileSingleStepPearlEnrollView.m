@interface HPSSpatialProfileSingleStepPearlEnrollView
- (BOOL)faceCaptured;
- (BOOL)forceBlur;
- (BOOL)pauseBlur;
- (HPSSpatialProfileSingleStepPearlEnrollView)initWithVideoCaptureSession:(id)a3 inSheet:(BOOL)a4 squareNeedsPositionLayout:(BOOL)a5;
- (id)crossHairs;
- (void)layoutSubviews;
- (void)nudgeLeft:(id)a3;
- (void)nudgeRight:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setCameraBlurAmount:(double)a3 useShade:(BOOL)a4 duration:(double)a5 completion:(id)a6;
- (void)setFaceCaptured:(BOOL)a3;
- (void)setForceBlur:(BOOL)a3;
- (void)setPauseBlur:(BOOL)a3;
@end

@implementation HPSSpatialProfileSingleStepPearlEnrollView

- (id)crossHairs
{
  enrollmentCustomCrossHairs = self->_enrollmentCustomCrossHairs;
  if (!enrollmentCustomCrossHairs)
  {
    v4 = [HPSSpatialProfileSingleStepCrossHairs alloc];
    v5 = -[HPSSpatialProfileSingleStepCrossHairs initWithView:view:](v4, "initWithView:view:", self, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_enrollmentCustomCrossHairs;
    self->_enrollmentCustomCrossHairs = v5;

    enrollmentCustomCrossHairs = self->_enrollmentCustomCrossHairs;
  }

  return enrollmentCustomCrossHairs;
}

- (HPSSpatialProfileSingleStepPearlEnrollView)initWithVideoCaptureSession:(id)a3 inSheet:(BOOL)a4 squareNeedsPositionLayout:(BOOL)a5
{
  v8.receiver = self;
  v8.super_class = (Class)HPSSpatialProfileSingleStepPearlEnrollView;
  v5 = [(BKUIPearlEnrollView *)&v8 initWithVideoCaptureSession:a3 inSheet:a4 squareNeedsPositionLayout:a5];
  v6 = v5;
  if (v5) {
    [(HPSSpatialProfileSingleStepPearlEnrollView *)v5 setPauseBlur:0];
  }
  return v6;
}

- (void)setCameraBlurAmount:(double)a3 useShade:(BOOL)a4 duration:(double)a5 completion:(id)a6
{
  uint64_t v7 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  v11 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    BOOL v15 = [(HPSSpatialProfileSingleStepPearlEnrollView *)self pauseBlur];
    __int16 v16 = 1024;
    BOOL v17 = [(HPSSpatialProfileSingleStepPearlEnrollView *)self forceBlur];
    __int16 v18 = 2048;
    double v19 = a3;
    __int16 v20 = 2048;
    double v21 = a5;
    _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Set Camera Blur Blurring paused %d, Blurring forced %d, Requested Blur %f duration = %f ", buf, 0x22u);
  }

  if (a3 == 0.0 && [(HPSSpatialProfileSingleStepPearlEnrollView *)self forceBlur])
  {
    LODWORD(v7) = 0;
    a3 = 15.0;
  }
  else if (a3 == 0.0)
  {
    goto LABEL_9;
  }
  BOOL v12 = [(HPSSpatialProfileSingleStepPearlEnrollView *)self pauseBlur];
  uint64_t v7 = v7 & !v12;
  if (v12) {
    a3 = 0.0;
  }
LABEL_9:
  v13.receiver = self;
  v13.super_class = (Class)HPSSpatialProfileSingleStepPearlEnrollView;
  [(BKUIPearlEnrollView *)&v13 setCameraBlurAmount:v7 useShade:v10 duration:a3 completion:a5];
}

- (void)nudgeLeft:(id)a3
{
}

- (void)nudgeRight:(id)a3
{
}

- (void)layoutSubviews
{
  if (_os_feature_enabled_impl())
  {
    v3 = [(BKUIPearlEnrollView *)self tutorialMovieView];

    if (!v3)
    {
      v4 = [(BKUIPearlEnrollView *)self tutorialMovieView];
      [v4 removeFromSuperview];

      v5 = [HPSSpatialProfileSingleStepPearlMovieLoopView alloc];
      v6 = -[HPSSpatialProfileSingleStepPearlMovieLoopView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(BKUIPearlEnrollView *)self setTutorialMovieView:v6];

      uint64_t v7 = [(BKUIPearlEnrollView *)self tutorialMovieView];
      [(BKUIPearlEnrollView *)self setTutorialMovieView:v7];

      objc_super v8 = [(BKUIPearlEnrollView *)self tutorialMovieView];
      [(HPSSpatialProfileSingleStepPearlEnrollView *)self addSubview:v8];

      v9 = [(BKUIPearlEnrollView *)self tutorialMovieView];
      [v9 load];
    }
  }
  id v10 = [(BKUIPearlEnrollView *)self tutorialMovieView];
  v11 = [v10 layer];
  [v11 setMasksToBounds:0];

  BOOL v12 = [(BKUIPearlEnrollView *)self tutorialMovieView];
  objc_super v13 = [v12 layer];
  [v13 setCornerRadius:0.0];

  v14.receiver = self;
  v14.super_class = (Class)HPSSpatialProfileSingleStepPearlEnrollView;
  [(BKUIPearlEnrollView *)&v14 layoutSubviews];
}

- (void)setAlpha:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HPSSpatialProfileSingleStepPearlEnrollView;
  -[HPSSpatialProfileSingleStepPearlEnrollView setAlpha:](&v6, sel_setAlpha_);
  v5 = [(BKUIPearlEnrollView *)self tutorialMovieView];
  [v5 setAlpha:a3];
}

- (BOOL)faceCaptured
{
  return self->_faceCaptured;
}

- (void)setFaceCaptured:(BOOL)a3
{
  self->_faceCaptured = a3;
}

- (BOOL)pauseBlur
{
  return self->_pauseBlur;
}

- (void)setPauseBlur:(BOOL)a3
{
  self->_pauseBlur = a3;
}

- (BOOL)forceBlur
{
  return self->_forceBlur;
}

- (void)setForceBlur:(BOOL)a3
{
  self->_forceBlur = a3;
}

- (void).cxx_destruct
{
}

@end