@interface WFOverlayImageEditorCanvasView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isRotationEnabled;
- (UIImageView)backgroundImageView;
- (UIImageView)overlayImageView;
- (UIRotationGestureRecognizer)rotateRecognizer;
- (WFOverlayImageEditorCanvasView)initWithBackgroundImage:(id)a3 overlayImage:(id)a4 transform:(id)a5;
- (WFOverlayImageTransform)imageTransform;
- (void)handlePanGesture:(id)a3;
- (void)handlePinchGesture:(id)a3;
- (void)handleRotateGesture:(id)a3;
- (void)layoutSubviews;
- (void)reset;
- (void)setOverlayImageOpacity:(double)a3;
- (void)setRotationEnabled:(BOOL)a3;
@end

@implementation WFOverlayImageEditorCanvasView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overlayImageView);
  objc_destroyWeak((id *)&self->_backgroundImageView);
  objc_destroyWeak((id *)&self->_rotateRecognizer);
  objc_storeStrong((id *)&self->_imageTransform, 0);
}

- (UIImageView)overlayImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayImageView);
  return (UIImageView *)WeakRetained;
}

- (UIImageView)backgroundImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundImageView);
  return (UIImageView *)WeakRetained;
}

- (UIRotationGestureRecognizer)rotateRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rotateRecognizer);
  return (UIRotationGestureRecognizer *)WeakRetained;
}

- (WFOverlayImageTransform)imageTransform
{
  return self->_imageTransform;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)reset
{
  [(WFOverlayImageTransform *)self->_imageTransform setRotation:0.0];
  [(WFOverlayImageEditorCanvasView *)self setNeedsLayout];
}

- (void)setOverlayImageOpacity:(double)a3
{
  [(WFOverlayImageTransform *)self->_imageTransform setOpacity:a3];
  [(WFOverlayImageEditorCanvasView *)self setNeedsLayout];
}

- (void)setRotationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rotateRecognizer);
  [WeakRetained setEnabled:v3];
}

- (BOOL)isRotationEnabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rotateRecognizer);
  char v3 = [WeakRetained isEnabled];

  return v3;
}

- (void)handlePinchGesture:(id)a3
{
  imageTransform = self->_imageTransform;
  id v5 = a3;
  [v5 scale];
  double v7 = v6;
  [(WFOverlayImageTransform *)imageTransform scale];
  [(WFOverlayImageTransform *)imageTransform setScale:v7 * v8];
  [(WFOverlayImageTransform *)self->_imageTransform center];
  double v14 = v10;
  double v15 = v9;
  [v5 scale];
  CGFloat v12 = 1.0 / v11;
  [v5 scale];
  CGAffineTransformMakeScale(&v16, v12, 1.0 / v13);
  [(WFOverlayImageTransform *)self->_imageTransform setCenter:vaddq_f64(*(float64x2_t *)&v16.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v16.c, v14), *(float64x2_t *)&v16.a, v15))];
  [v5 setScale:1.0];

  [(WFOverlayImageEditorCanvasView *)self setNeedsLayout];
}

- (void)handlePanGesture:(id)a3
{
  id v4 = a3;
  [(WFOverlayImageEditorCanvasView *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundImageView);
  double v14 = [WeakRetained image];
  [v14 size];
  double v16 = v15;
  double v18 = v17;

  [v4 translationInView:self];
  double v20 = v19;
  double v22 = v21;
  v33.origin.x = v6;
  v33.origin.y = v8;
  v33.size.width = v10;
  v33.size.height = v12;
  double v23 = CGRectGetWidth(v33) / v16;
  v34.origin.x = v6;
  v34.origin.y = v8;
  v34.size.width = v10;
  v34.size.height = v12;
  double v24 = fmin(v23, CGRectGetHeight(v34) / v18);
  objc_msgSend(v4, "setTranslation:inView:", self, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

  [(WFOverlayImageTransform *)self->_imageTransform center];
  double v30 = v26;
  double v31 = v25;
  [(WFOverlayImageTransform *)self->_imageTransform scale];
  CGFloat v28 = v20 / v24 / v27;
  [(WFOverlayImageTransform *)self->_imageTransform scale];
  CGAffineTransformMakeTranslation(&v32, v28, v22 / v24 / v29);
  [(WFOverlayImageTransform *)self->_imageTransform setCenter:vaddq_f64(*(float64x2_t *)&v32.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v32.c, v30), *(float64x2_t *)&v32.a, v31))];
  [(WFOverlayImageEditorCanvasView *)self setNeedsLayout];
}

- (void)handleRotateGesture:(id)a3
{
  imageTransform = self->_imageTransform;
  id v5 = a3;
  [v5 rotation];
  double v7 = v6;
  [(WFOverlayImageTransform *)imageTransform rotation];
  [(WFOverlayImageTransform *)imageTransform setRotation:v7 + v8];
  [v5 setRotation:0.0];

  [(WFOverlayImageEditorCanvasView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v50.receiver = self;
  v50.super_class = (Class)WFOverlayImageEditorCanvasView;
  [(WFOverlayImageEditorCanvasView *)&v50 layoutSubviews];
  [(WFOverlayImageEditorCanvasView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundImageView);
  CGFloat v12 = [WeakRetained image];
  [v12 size];
  double v14 = v13;
  double v16 = v15;

  v51.origin.double x = v4;
  v51.origin.double y = v6;
  v51.size.double width = v8;
  v51.size.double height = v10;
  double v17 = CGRectGetWidth(v51) / v14;
  v52.origin.double x = v4;
  v52.origin.double y = v6;
  v52.size.double width = v8;
  v52.size.double height = v10;
  memset(&v49, 0, sizeof(v49));
  CGFloat v18 = fmin(v17, CGRectGetHeight(v52) / v16);
  CGAffineTransformMakeScale(&v49, v18, v18);
  v53.origin.double x = v4;
  v53.origin.double y = v6;
  v53.size.double width = v8;
  v53.size.double height = v10;
  double MidX = CGRectGetMidX(v53);
  v54.origin.double x = v4;
  v54.origin.double y = v6;
  v54.size.double width = v8;
  v54.size.double height = v10;
  double MidY = CGRectGetMidY(v54);
  id v21 = objc_loadWeakRetained((id *)&self->_backgroundImageView);
  objc_msgSend(v21, "setCenter:", MidX, MidY);

  v55.origin.double x = *(CGFloat *)MEMORY[0x263F00148];
  v55.origin.double y = *(CGFloat *)(MEMORY[0x263F00148] + 8);
  v55.size.double width = v16 * v49.c + v49.a * v14;
  v55.size.double height = v16 * v49.d + v49.b * v14;
  CGRect v56 = CGRectIntegral(v55);
  double x = v56.origin.x;
  double y = v56.origin.y;
  double width = v56.size.width;
  double height = v56.size.height;
  id v26 = objc_loadWeakRetained((id *)&self->_backgroundImageView);
  objc_msgSend(v26, "setBounds:", x, y, width, height);

  memset(&v48, 0, sizeof(v48));
  [(WFOverlayImageTransform *)self->_imageTransform scale];
  CGFloat v28 = v27;
  [(WFOverlayImageTransform *)self->_imageTransform scale];
  CGAffineTransformMakeScale(&t1, v28, v29);
  CGAffineTransform t2 = v49;
  CGAffineTransformConcat(&v48, &t1, &t2);
  [(WFOverlayImageTransform *)self->_imageTransform rotation];
  CGAffineTransformMakeRotation(&v45, v30);
  id v31 = objc_loadWeakRetained((id *)&self->_overlayImageView);
  CGAffineTransform v44 = v45;
  [v31 setTransform:&v44];

  [(WFOverlayImageTransform *)self->_imageTransform center];
  float64x2_t v43 = vaddq_f64(*(float64x2_t *)&v48.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v48.c, v32), *(float64x2_t *)&v48.a, v33));
  id v34 = objc_loadWeakRetained((id *)&self->_overlayImageView);
  [v34 setCenter:*(_OWORD *)&v43];

  [(WFOverlayImageTransform *)self->_imageTransform bounds];
  CGAffineTransform t2 = v48;
  CGRect v58 = CGRectApplyAffineTransform(v57, &t2);
  double v35 = v58.origin.x;
  double v36 = v58.origin.y;
  double v37 = v58.size.width;
  double v38 = v58.size.height;
  id v39 = objc_loadWeakRetained((id *)&self->_overlayImageView);
  objc_msgSend(v39, "setBounds:", v35, v36, v37, v38);

  [(WFOverlayImageTransform *)self->_imageTransform opacity];
  double v41 = v40;
  id v42 = objc_loadWeakRetained((id *)&self->_overlayImageView);
  [v42 setAlpha:v41];
}

- (WFOverlayImageEditorCanvasView)initWithBackgroundImage:(id)a3 overlayImage:(id)a4 transform:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)WFOverlayImageEditorCanvasView;
  double v11 = [(WFOverlayImageEditorCanvasView *)&v21 init];
  CGFloat v12 = v11;
  if (v11)
  {
    [(WFOverlayImageEditorCanvasView *)v11 setClipsToBounds:1];
    double v13 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v8];
    [v13 setUserInteractionEnabled:1];
    [v13 setClipsToBounds:1];
    [(WFOverlayImageEditorCanvasView *)v12 addSubview:v13];
    objc_storeWeak((id *)&v12->_backgroundImageView, v13);
    double v14 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v9];
    [v14 setUserInteractionEnabled:1];
    [v14 setContentMode:1];
    id WeakRetained = objc_loadWeakRetained((id *)&v12->_backgroundImageView);
    [WeakRetained addSubview:v14];

    objc_storeWeak((id *)&v12->_overlayImageView, v14);
    objc_storeStrong((id *)&v12->_imageTransform, a5);
    double v16 = (void *)[objc_alloc(MEMORY[0x263F82A40]) initWithTarget:v12 action:sel_handlePinchGesture_];
    [v16 setDelegate:v12];
    [(WFOverlayImageEditorCanvasView *)v12 addGestureRecognizer:v16];
    double v17 = (void *)[objc_alloc(MEMORY[0x263F82A00]) initWithTarget:v12 action:sel_handlePanGesture_];
    [v17 setDelegate:v12];
    [(WFOverlayImageEditorCanvasView *)v12 addGestureRecognizer:v17];
    CGFloat v18 = (void *)[objc_alloc(MEMORY[0x263F82B28]) initWithTarget:v12 action:sel_handleRotateGesture_];
    [v18 setDelegate:v12];
    [(WFOverlayImageEditorCanvasView *)v12 addGestureRecognizer:v18];
    objc_storeWeak((id *)&v12->_rotateRecognizer, v18);
    double v19 = v12;
  }
  return v12;
}

@end