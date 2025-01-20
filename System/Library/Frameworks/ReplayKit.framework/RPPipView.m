@interface RPPipView
- (AVCaptureVideoPreviewLayer)previewLayer;
- (void)addPreviewLayer:(id)a3;
- (void)layoutSubviews;
- (void)setPreviewLayer:(id)a3;
@end

@implementation RPPipView

- (void)layoutSubviews
{
  [(RPPipView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(RPPipView *)self previewLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)addPreviewLayer:(id)a3
{
  id v4 = a3;
  double v5 = [(RPPipView *)self layer];
  [v5 setMasksToBounds:1];

  [(RPPipView *)self setPreviewLayer:v4];
  id v6 = [(RPPipView *)self layer];
  [v6 addSublayer:v4];
}

- (AVCaptureVideoPreviewLayer)previewLayer
{
  return self->_previewLayer;
}

- (void)setPreviewLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end