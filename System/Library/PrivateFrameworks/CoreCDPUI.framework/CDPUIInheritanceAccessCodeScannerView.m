@interface CDPUIInheritanceAccessCodeScannerView
- (AVCaptureMetadataOutput)metadataOutput;
- (AVCaptureSession)captureSession;
- (AVCaptureVideoPreviewLayer)previewLayer;
- (CALayer)spotlightLayer;
- (CDPUIInheritanceAccessCodeScannerView)initWithFrame:(CGRect)a3;
- (CDPUIInheritanceAccessCodeScannerViewDelegate)delegate;
- (CGRect)_bezierRect;
- (CGRect)_circleRectForCenter:(CGPoint)a3;
- (CGSize)lastKnownDimensions;
- (id)_spotOverlayLayerWithBezierRect:(CGRect)a3 CircleRect:(CGRect)a4;
- (void)_setupLivePreview;
- (void)_setupPreviewIfNeeded;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setCaptureSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastKnownDimensions:(CGSize)a3;
- (void)setMetadataOutput:(id)a3;
- (void)setPreviewLayer:(id)a3;
- (void)setSpotlightLayer:(id)a3;
@end

@implementation CDPUIInheritanceAccessCodeScannerView

- (CDPUIInheritanceAccessCodeScannerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CDPUIInheritanceAccessCodeScannerView;
  v3 = -[CDPUIInheritanceAccessCodeScannerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CDPUIInheritanceAccessCodeScannerView *)v3 setClipsToBounds:1];
  }
  return v4;
}

- (void)didMoveToSuperview
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2187CF000, a2, OS_LOG_TYPE_ERROR, "Error creating capture input: %@", (uint8_t *)&v2, 0xCu);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CDPUIInheritanceAccessCodeScannerView;
  [(CDPUIInheritanceAccessCodeScannerView *)&v3 layoutSubviews];
  [(CDPUIInheritanceAccessCodeScannerView *)self _setupLivePreview];
}

- (void)_setupLivePreview
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Setting up a live view layer for camera scanner.", v2, v3, v4, v5, v6);
}

void __58__CDPUIInheritanceAccessCodeScannerView__setupLivePreview__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained captureSession];
    [v3 startRunning];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__CDPUIInheritanceAccessCodeScannerView__setupLivePreview__block_invoke_2;
    block[3] = &unk_26433CC58;
    id v5 = v2;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __58__CDPUIInheritanceAccessCodeScannerView__setupLivePreview__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  id v10 = [*(id *)(a1 + 32) previewLayer];
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);
}

- (void)_setupPreviewIfNeeded
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Updating preview layer for the camera scanner.", v2, v3, v4, v5, v6);
}

- (id)_spotOverlayLayerWithBezierRect:(CGRect)a3 CircleRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v9 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, 90.0);
  [v8 appendPath:v9];
  [v8 setUsesEvenOddFillRule:1];
  id v10 = [MEMORY[0x263F15880] layer];
  id v11 = v8;
  objc_msgSend(v10, "setPath:", objc_msgSend(v11, "CGPath"));
  [v10 setFillRule:*MEMORY[0x263F15AC0]];
  id v12 = [MEMORY[0x263F825C8] blackColor];
  objc_msgSend(v10, "setFillColor:", objc_msgSend(v12, "CGColor"));

  id v13 = [MEMORY[0x263F825C8] systemBlueColor];
  objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v13, "CGColor"));

  [v10 setLineWidth:2.0];
  LODWORD(v14) = *(_DWORD *)"333?";
  [v10 setOpacity:v14];

  return v10;
}

- (CGRect)_circleRectForCenter:(CGPoint)a3
{
  double v3 = a3.x + -90.0;
  double v4 = a3.y + -90.0;
  double v5 = 180.0;
  double v6 = 180.0;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)_bezierRect
{
  [(CDPUIInheritanceAccessCodeScannerView *)self bounds];
  double v4 = v3 + 2.0;
  [(CDPUIInheritanceAccessCodeScannerView *)self bounds];
  double v6 = v5 + 2.0;
  double v7 = -1.0;
  double v8 = -1.0;
  double v9 = v4;
  result.size.double height = v6;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (void)dealloc
{
  double v3 = [(CDPUIInheritanceAccessCodeScannerView *)self captureSession];
  [v3 stopRunning];

  [(CDPUIInheritanceAccessCodeScannerView *)self setCaptureSession:0];
  v4.receiver = self;
  v4.super_class = (Class)CDPUIInheritanceAccessCodeScannerView;
  [(CDPUIInheritanceAccessCodeScannerView *)&v4 dealloc];
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  id v6 = a4;
  double v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CDPUIInheritanceAccessCodeScannerView captureOutput:didOutputMetadataObjects:fromConnection:]();
  }

  double v8 = [v6 firstObject];

  id v9 = [v8 type];
  if (v9 != (id)*MEMORY[0x263EF9F40]) {
    goto LABEL_4;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_5;
  }
  id v9 = v8;
  id v11 = [v9 stringValue];
  if (![v11 length]) {
    goto LABEL_10;
  }
  id v12 = [(CDPUIInheritanceAccessCodeScannerView *)self delegate];
  id v13 = [v9 stringValue];
  int v14 = [v12 accessCodeScanner:self didScanCode:v13];

  if (v14)
  {
    id v11 = [(CDPUIInheritanceAccessCodeScannerView *)self captureSession];
    [v11 stopRunning];
LABEL_10:
  }
LABEL_4:

LABEL_5:
}

- (CDPUIInheritanceAccessCodeScannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CDPUIInheritanceAccessCodeScannerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (void)setCaptureSession:(id)a3
{
}

- (AVCaptureVideoPreviewLayer)previewLayer
{
  return self->_previewLayer;
}

- (void)setPreviewLayer:(id)a3
{
}

- (CALayer)spotlightLayer
{
  return self->_spotlightLayer;
}

- (void)setSpotlightLayer:(id)a3
{
}

- (AVCaptureMetadataOutput)metadataOutput
{
  return self->_metadataOutput;
}

- (void)setMetadataOutput:(id)a3
{
}

- (CGSize)lastKnownDimensions
{
  double width = self->_lastKnownDimensions.width;
  double height = self->_lastKnownDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastKnownDimensions:(CGSize)a3
{
  self->_lastKnownDimensions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataOutput, 0);
  objc_storeStrong((id *)&self->_spotlightLayer, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)captureOutput:didOutputMetadataObjects:fromConnection:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Camera scanner received an input.", v2, v3, v4, v5, v6);
}

@end