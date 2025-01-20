@interface CAMVideoPreviewView
- (AVCaptureVideoPreviewLayer)videoPreviewLayer;
- (BOOL)isSquare;
- (CAMVideoPreviewView)initWithFrame:(CGRect)a3;
- (UIView)previewLayerView;
- (int64_t)previewViewAspectMode;
- (void)_updateAspectModeForSublayers;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setPreviewViewAspectMode:(int64_t)a3;
- (void)setSquare:(BOOL)a3;
- (void)setSquare:(BOOL)a3 animated:(BOOL)a4;
- (void)setVideoPreviewLayer:(id)a3;
@end

@implementation CAMVideoPreviewView

- (CAMVideoPreviewView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoPreviewView;
  v3 = -[CAMVideoPreviewView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F82E00]);
    [(CAMVideoPreviewView *)v3 _frameForSubviewsAccountForSquare:1];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    previewLayerView = v3->_previewLayerView;
    v3->_previewLayerView = (UIView *)v5;

    [(CAMVideoPreviewView *)v3 addSubview:v3->_previewLayerView];
    v3->_previewViewAspectMode = 0;
    [(CAMVideoPreviewView *)v3 _updateAspectModeForSublayers];
  }
  return v3;
}

- (void)_updateAspectModeForSublayers
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  id v4 = +[CAMCaptureConversions previewLayerVideoGravityForPreviewViewAspectMode:[(CAMVideoPreviewView *)self previewViewAspectMode]];
  v3 = [(CAMVideoPreviewView *)self videoPreviewLayer];
  [v3 setVideoGravity:v4];
  [MEMORY[0x263F158F8] commit];
}

- (int64_t)previewViewAspectMode
{
  return self->_previewViewAspectMode;
}

- (AVCaptureVideoPreviewLayer)videoPreviewLayer
{
  return self->_videoPreviewLayer;
}

- (void)setVideoPreviewLayer:(id)a3
{
  uint64_t v5 = (AVCaptureVideoPreviewLayer *)a3;
  p_videoPreviewLayer = &self->_videoPreviewLayer;
  videoPreviewLayer = self->_videoPreviewLayer;
  if (videoPreviewLayer != v5)
  {
    v10 = v5;
    [(AVCaptureVideoPreviewLayer *)videoPreviewLayer removeFromSuperlayer];
    objc_storeStrong((id *)&self->_videoPreviewLayer, a3);
    objc_super v8 = *p_videoPreviewLayer;
    [(UIView *)self->_previewLayerView bounds];
    -[AVCaptureVideoPreviewLayer setFrame:](v8, "setFrame:");
    v9 = [(UIView *)self->_previewLayerView layer];
    [v9 addSublayer:*p_videoPreviewLayer];

    [(CAMVideoPreviewView *)self _updateAspectModeForSublayers];
    videoPreviewLayer = (AVCaptureVideoPreviewLayer *)[(CAMVideoPreviewView *)self setNeedsLayout];
    uint64_t v5 = v10;
  }
  MEMORY[0x270F9A758](videoPreviewLayer, v5);
}

- (void)setSquare:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_square != a3)
  {
    self->_square = a3;
    if (a4)
    {
      [(CAMVideoPreviewView *)self _frameForSubviewsAccountForSquare:1];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v13 = *MEMORY[0x263F00148];
      double v14 = *(double *)(MEMORY[0x263F00148] + 8);
      v15 = [(UIView *)self->_previewLayerView layer];
      +[CAMAnimationHelper animateLayer:toFrame:fromCurrentState:](CAMAnimationHelper, "animateLayer:toFrame:fromCurrentState:", v15, 1, v6, v8, v10, v12);

      videoPreviewLayer = self->_videoPreviewLayer;
      +[CAMAnimationHelper animateLayer:toFrame:fromCurrentState:](CAMAnimationHelper, "animateLayer:toFrame:fromCurrentState:", videoPreviewLayer, 1, v13, v14, v10, v12);
    }
    else
    {
      [(CAMVideoPreviewView *)self setNeedsLayout];
    }
  }
}

- (void)setPreviewViewAspectMode:(int64_t)a3
{
  if (self->_previewViewAspectMode != a3)
  {
    self->_previewViewAspectMode = a3;
    [(CAMVideoPreviewView *)self _updateAspectModeForSublayers];
  }
}

- (void)layoutSubviews
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(CAMVideoPreviewView *)self _frameForSubviewsAccountForSquare:1];
  -[UIView setFrame:](self->_previewLayerView, "setFrame:");
  videoPreviewLayer = self->_videoPreviewLayer;
  [(UIView *)self->_previewLayerView bounds];
  -[AVCaptureVideoPreviewLayer setFrame:](videoPreviewLayer, "setFrame:");
  id v4 = (void *)MEMORY[0x263F158F8];
  [v4 commit];
}

- (void)dealloc
{
  v3 = [(UIView *)self->_previewLayerView layer];
  id v4 = [(AVCaptureVideoPreviewLayer *)self->_videoPreviewLayer superlayer];

  if (v3 == v4) {
    [(AVCaptureVideoPreviewLayer *)self->_videoPreviewLayer removeFromSuperlayer];
  }
  v5.receiver = self;
  v5.super_class = (Class)CAMVideoPreviewView;
  [(CAMVideoPreviewView *)&v5 dealloc];
}

- (void)setSquare:(BOOL)a3
{
}

- (UIView)previewLayerView
{
  return self->_previewLayerView;
}

- (BOOL)isSquare
{
  return self->_square;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewLayerView, 0);
  objc_storeStrong((id *)&self->_videoPreviewLayer, 0);
}

@end