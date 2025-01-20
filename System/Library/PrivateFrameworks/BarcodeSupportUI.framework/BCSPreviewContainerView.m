@interface BCSPreviewContainerView
- (AVCaptureVideoPreviewLayer)previewLayer;
- (void)layoutSubviews;
- (void)setPreviewLayer:(id)a3;
@end

@implementation BCSPreviewContainerView

- (void)setPreviewLayer:(id)a3
{
  v5 = (AVCaptureVideoPreviewLayer *)a3;
  p_previewLayer = &self->_previewLayer;
  if (self->_previewLayer != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_previewLayer, a3);
    [(AVCaptureVideoPreviewLayer *)*p_previewLayer setVideoGravity:*MEMORY[0x263EF9C78]];
    v7 = [(BCSPreviewContainerView *)self layer];
    [v7 addSublayer:*p_previewLayer];

    v5 = v8;
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)BCSPreviewContainerView;
  [(BCSPreviewContainerView *)&v12 layoutSubviews];
  [(BCSPreviewContainerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(BCSPreviewContainerView *)self previewLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (AVCaptureVideoPreviewLayer)previewLayer
{
  return self->_previewLayer;
}

- (void).cxx_destruct
{
}

@end