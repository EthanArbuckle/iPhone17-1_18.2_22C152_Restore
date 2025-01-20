@interface AVTAttributeValueView
+ (CGRect)imageViewRectForBounds:(CGRect)a3 imageSizeRatio:(CGSize)a4 scale:(double)a5;
- (AVTAttributeValueView)initWithFrame:(CGRect)a3;
- (BOOL)isSelected;
- (BOOL)showPlaceholder;
- (CALayer)imageLayer;
- (CALayer)transitionImageLayer;
- (CAShapeLayer)clippingLayer;
- (CAShapeLayer)selectionLayer;
- (CGRect)selectorRect;
- (CGSize)imageSizeRatio;
- (NSUUID)displaySessionUUID;
- (UIImage)image;
- (UIView)contentView;
- (id)clippingBezierPath;
- (id)discardableContentHandler;
- (id)selectionBezierPath;
- (unint64_t)selectionStyle;
- (void)bringSelectionLayersToFront;
- (void)cleanupAfterTransition;
- (void)configureImageLayer:(id)a3;
- (void)discardContent;
- (void)layoutSubviews;
- (void)prepareForTransitionToImage:(id)a3;
- (void)relayoutSublayers;
- (void)setClippingLayer:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDiscardableContentHandler:(id)a3;
- (void)setDisplaySessionUUID:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageLayer:(id)a3;
- (void)setImageSizeRatio:(CGSize)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionLayer:(id)a3;
- (void)setSelectionStyle:(unint64_t)a3;
- (void)setShowPlaceholder:(BOOL)a3;
- (void)setTransitionImageLayer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCornerRadii;
- (void)updateHighlightedState:(BOOL)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)updateSelectedState:(BOOL)a3 animated:(BOOL)a4;
- (void)updateSelectionAndMaskLayer;
- (void)updateWithImage:(id)a3;
@end

@implementation AVTAttributeValueView

- (AVTAttributeValueView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v31.receiver = self;
  v31.super_class = (Class)AVTAttributeValueView;
  v7 = -[AVTAttributeValueView initWithFrame:](&v31, sel_initWithFrame_);
  v8 = (AVTAttributeValueView *)v7;
  if (v7)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v7 + 488) = _Q0;
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", x, y, width, height);
    contentView = v8->_contentView;
    v8->_contentView = (UIView *)v14;

    [(UIView *)v8->_contentView setAutoresizingMask:18];
    [(AVTAttributeValueView *)v8 addSubview:v8->_contentView];
    v16 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    imageLayer = v8->_imageLayer;
    v8->_imageLayer = v16;

    [(AVTAttributeValueView *)v8 configureImageLayer:v8->_imageLayer];
    v18 = [(UIView *)v8->_contentView layer];
    [v18 addSublayer:v8->_imageLayer];

    v19 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    transitionImageLayer = v8->_transitionImageLayer;
    v8->_transitionImageLayer = v19;

    [(CALayer *)v8->_transitionImageLayer setOpacity:0.0];
    [(AVTAttributeValueView *)v8 configureImageLayer:v8->_transitionImageLayer];
    v21 = [(UIView *)v8->_contentView layer];
    [v21 addSublayer:v8->_transitionImageLayer];

    uint64_t v22 = [MEMORY[0x263F15880] layer];
    selectionLayer = v8->_selectionLayer;
    v8->_selectionLayer = (CAShapeLayer *)v22;

    id v24 = +[AVTUIColorRepository attributeValueCellSelectedStrokeColor];
    -[CAShapeLayer setStrokeColor:](v8->_selectionLayer, "setStrokeColor:", [v24 CGColor]);

    id v25 = [MEMORY[0x263F1C550] clearColor];
    -[CAShapeLayer setFillColor:](v8->_selectionLayer, "setFillColor:", [v25 CGColor]);

    [(CAShapeLayer *)v8->_selectionLayer setLineWidth:3.0];
    [(CAShapeLayer *)v8->_selectionLayer setOpacity:0.0];
    v26 = [(AVTAttributeValueView *)v8 layer];
    [v26 addSublayer:v8->_selectionLayer];

    uint64_t v27 = [MEMORY[0x263F15880] layer];
    clippingLayer = v8->_clippingLayer;
    v8->_clippingLayer = (CAShapeLayer *)v27;

    id v29 = [MEMORY[0x263F1C550] blackColor];
    -[CAShapeLayer setFillColor:](v8->_clippingLayer, "setFillColor:", [v29 CGColor]);

    [(CAShapeLayer *)v8->_clippingLayer setLineWidth:0.0];
  }
  return v8;
}

- (void)updateSelectionAndMaskLayer
{
  [(AVTAttributeValueView *)self shapeLayerRect];
  double x = v31.origin.x;
  double y = v31.origin.y;
  double width = v31.size.width;
  double height = v31.size.height;
  if (!CGRectIsEmpty(v31))
  {
    v7 = [(AVTAttributeValueView *)self selectionLayer];
    [v7 frame];
    v33.origin.double x = x;
    v33.origin.double y = y;
    v33.size.double width = width;
    v33.size.double height = height;
    BOOL v8 = CGRectEqualToRect(v32, v33);

    if (!v8)
    {
      v9 = [(AVTAttributeValueView *)self selectionLayer];
      objc_msgSend(v9, "setBounds:", x, y, width, height);

      id v10 = [(AVTAttributeValueView *)self selectionBezierPath];
      uint64_t v11 = [v10 CGPath];
      v12 = [(AVTAttributeValueView *)self selectionLayer];
      [v12 setPath:v11];

      v13 = [(AVTAttributeValueView *)self clippingLayer];
      objc_msgSend(v13, "setBounds:", x, y, width, height);

      id v14 = [(AVTAttributeValueView *)self clippingBezierPath];
      uint64_t v15 = [v14 CGPath];
      v16 = [(AVTAttributeValueView *)self clippingLayer];
      [v16 setPath:v15];
    }
    id v17 = +[AVTUIColorRepository attributeValueCellSelectedStrokeColor];
    uint64_t v18 = [v17 CGColor];
    v19 = [(AVTAttributeValueView *)self selectionLayer];
    [v19 setStrokeColor:v18];

    [(AVTAttributeValueView *)self bounds];
    UIRectGetCenter();
    double v21 = v20;
    double v23 = v22;
    id v24 = [(AVTAttributeValueView *)self selectionLayer];
    objc_msgSend(v24, "setPosition:", v21, v23);

    id v25 = [(AVTAttributeValueView *)self clippingLayer];
    objc_msgSend(v25, "setPosition:", v21, v23);

    if ([(AVTAttributeValueView *)self selectionStyle] == 1
      || [(AVTAttributeValueView *)self isSelected])
    {
      id v29 = [(AVTAttributeValueView *)self clippingLayer];
      int v26 = 1;
    }
    else
    {
      int v26 = 0;
      id v29 = 0;
    }
    uint64_t v27 = [(AVTAttributeValueView *)self contentView];
    v28 = [v27 layer];
    [v28 setMask:v29];

    if (v26)
    {
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVTAttributeValueView;
  [(AVTAttributeValueView *)&v10 traitCollectionDidChange:v4];
  [(AVTAttributeValueView *)self updateSelectionAndMaskLayer];
  if (self->_showPlaceholder)
  {
    uint64_t v5 = [v4 userInterfaceStyle];
    v6 = [(AVTAttributeValueView *)self traitCollection];
    uint64_t v7 = [v6 userInterfaceStyle];

    if (v5 != v7)
    {
      BOOL v8 = [(AVTAttributeValueView *)self traitCollection];
      v9 = AVTFlatSilhouetteImageForTraitCollection(v8);
      [(AVTAttributeValueView *)self updateWithImage:v9];
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVTAttributeValueView;
  [(AVTAttributeValueView *)&v3 layoutSubviews];
  [(AVTAttributeValueView *)self relayoutSublayers];
  [(AVTAttributeValueView *)self updateSelectionAndMaskLayer];
  [(AVTAttributeValueView *)self updateCornerRadii];
}

- (void)relayoutSublayers
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  objc_super v3 = objc_opt_class();
  [(AVTAttributeValueView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(AVTAttributeValueView *)self imageSizeRatio];
  double v13 = v12;
  double v15 = v14;
  v16 = [(AVTAttributeValueView *)self window];
  id v17 = [v16 screen];
  [v17 scale];
  objc_msgSend(v3, "imageViewRectForBounds:imageSizeRatio:scale:", v5, v7, v9, v11, v13, v15, v18);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  [(AVTAttributeValueView *)self bounds];
  UIRectGetCenter();
  double v28 = v27;
  double v30 = v29;
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  CGRect v31 = [(AVTAttributeValueView *)self imageLayer];
  objc_msgSend(v31, "setPosition:", v28, v30);

  CGRect v32 = [(AVTAttributeValueView *)self imageLayer];
  objc_msgSend(v32, "setBounds:", v20, v22, v24, v26);

  CGRect v33 = [(AVTAttributeValueView *)self transitionImageLayer];
  objc_msgSend(v33, "setPosition:", v28, v30);

  v34 = [(AVTAttributeValueView *)self transitionImageLayer];
  objc_msgSend(v34, "setBounds:", v20, v22, v24, v26);

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v35 = [(AVTAttributeValueView *)self imageLayer];
  v36 = [v35 sublayers];

  uint64_t v37 = [v36 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v44;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = *(void **)(*((void *)&v43 + 1) + 8 * v40);
        v42 = [(AVTAttributeValueView *)self imageLayer];
        [v42 bounds];
        objc_msgSend(v41, "setFrame:");

        ++v40;
      }
      while (v38 != v40);
      uint64_t v38 = [v36 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v38);
  }

  [MEMORY[0x263F158F8] commit];
}

- (CGRect)selectorRect
{
  [(AVTAttributeValueView *)self shapeLayerRect];
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  CGFloat v5 = *MEMORY[0x263F00148];
  CGFloat v6 = *(double *)(MEMORY[0x263F00148] + 8);
  v21.origin.double x = *(CGFloat *)MEMORY[0x263F00148];
  v21.origin.double y = v6;
  CGRectGetWidth(v21);
  v22.origin.double x = v5;
  v22.origin.double y = v6;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGRectGetHeight(v22);
  UIRectGetCenter();
  double v7 = [(AVTAttributeValueView *)self window];
  double v8 = [v7 screen];
  [v8 scale];
  UIRectCenteredAboutPointScale();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (void)configureImageLayer:(id)a3
{
  uint64_t v3 = *MEMORY[0x263F15A20];
  id v4 = a3;
  [v4 setCornerCurve:v3];
  [v4 setCornerRadius:6.0];
  [v4 setMasksToBounds:1];
  [v4 setContentsGravity:*MEMORY[0x263F15E20]];
}

+ (CGRect)imageViewRectForBounds:(CGRect)a3 imageSizeRatio:(CGSize)a4 scale:(double)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat v8 = *MEMORY[0x263F001A8];
  CGFloat v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  _UIScaleTransformForAspectFitOfSizeInTargetSize();
  memset(&v9, 0, sizeof(v9));
  v13.origin.double x = v8;
  v13.origin.double y = v7;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGRectApplyAffineTransform(v13, &v9);
  UIRectGetCenter();
  UIRectCenteredAboutPointScale();
  return CGRectInset(v14, 8.0, 8.0);
}

- (id)selectionBezierPath
{
  [(AVTAttributeValueView *)self selectorRect];
  CGRect v11 = CGRectInset(v10, 1.5, 1.5);
  double x = v11.origin.x;
  double y = v11.origin.y;
  double width = v11.size.width;
  double height = v11.size.height;
  if ([(AVTAttributeValueView *)self selectionStyle] == 1) {
    objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", x, y, width, height);
  }
  else {
  CGFloat v7 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, 12.0);
  }
  return v7;
}

- (id)clippingBezierPath
{
  if ([(AVTAttributeValueView *)self selectionStyle])
  {
    uint64_t v3 = objc_opt_class();
    [(AVTAttributeValueView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [(AVTAttributeValueView *)self imageSizeRatio];
    objc_msgSend(v3, "imageViewRectForBounds:imageSizeRatio:scale:", v5, v7, v9, v11, v12, v13, 0.0);
    [(AVTAttributeValueView *)self shapeLayerRect];
    CGRect v14 = (void *)MEMORY[0x263F1C478];
    UIRectGetCenter();
    UIRectCenteredAboutPoint();
    objc_msgSend(v14, "bezierPathWithOvalInRect:");
  }
  else
  {
    [(AVTAttributeValueView *)self selectorRect];
    CGRect v23 = CGRectInset(v22, 8.0, 8.0);
    double x = v23.origin.x;
    double y = v23.origin.y;
    double width = v23.size.width;
    double height = v23.size.height;
    [(AVTAttributeValueView *)self shapeLayerRect];
    objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, 5.5);
  double v15 = };
  return v15;
}

- (void)setSelectionStyle:(unint64_t)a3
{
  if (self->_selectionStyle != a3)
  {
    self->_selectionStyle = a3;
    [(AVTAttributeValueView *)self setNeedsLayout];
  }
}

- (void)updateCornerRadii
{
  if ([(AVTAttributeValueView *)self selectionStyle])
  {
    uint64_t v3 = [(AVTAttributeValueView *)self imageLayer];
    double v4 = 0.0;
  }
  else
  {
    uint64_t v5 = *MEMORY[0x263F15A20];
    double v6 = [(AVTAttributeValueView *)self imageLayer];
    [v6 setCornerCurve:v5];

    uint64_t v3 = [(AVTAttributeValueView *)self imageLayer];
    double v4 = 6.0;
  }
  id v7 = v3;
  [v3 setCornerRadius:v4];
}

- (void)setImageSizeRatio:(CGSize)a3
{
  if (self->_imageSizeRatio.width != a3.width || self->_imageSizeRatio.height != a3.height)
  {
    self->_imageSizeRatio = a3;
    [(AVTAttributeValueView *)self setNeedsLayout];
  }
}

- (void)updateHighlightedState:(BOOL)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  double v8 = (void (**)(id, uint64_t))a5;
  memset(&v13, 0, sizeof(v13));
  if (v6)
  {
    CGAffineTransformMakeScale(&v13, 0.95, 0.95);
    if (!v5) {
      goto LABEL_3;
    }
LABEL_6:
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    CGAffineTransform v12 = v13;
    v11[2] = __73__AVTAttributeValueView_updateHighlightedState_animated_completionBlock___block_invoke;
    v11[3] = &unk_263FF1AA8;
    v11[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v11 options:v8 animations:0.1 completion:0.0];
    goto LABEL_7;
  }
  long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v13.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v13.c = v9;
  *(_OWORD *)&v13.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  if (v5) {
    goto LABEL_6;
  }
LABEL_3:
  CGAffineTransform v10 = v13;
  [(AVTAttributeValueView *)self setTransform:&v10];
  if (v8) {
    v8[2](v8, 1);
  }
LABEL_7:
}

uint64_t __73__AVTAttributeValueView_updateHighlightedState_animated_completionBlock___block_invoke(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return [*(id *)(a1 + 32) setTransform:v3];
}

- (void)updateSelectedState:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[AVTAttributeValueView setSelected:](self, "setSelected:");
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(AVTAttributeValueView *)self updateSelectionAndMaskLayer];
  if (v4)
  {
    [MEMORY[0x263F158F8] commit];
    if (v5) {
      float v7 = 1.0;
    }
    else {
      float v7 = 0.0;
    }
    id v13 = [(AVTAttributeValueView *)self selectionLayer];
    *(float *)&double v8 = v7;
    [v13 setOpacity:v8];
  }
  else
  {
    if (v5) {
      float v9 = 1.0;
    }
    else {
      float v9 = 0.0;
    }
    CGAffineTransform v10 = [(AVTAttributeValueView *)self selectionLayer];
    *(float *)&double v11 = v9;
    [v10 setOpacity:v11];

    CGAffineTransform v12 = (void *)MEMORY[0x263F158F8];
    [v12 commit];
  }
}

- (void)bringSelectionLayersToFront
{
  uint64_t v3 = [(AVTAttributeValueView *)self imageLayer];
  [v3 removeFromSuperlayer];

  BOOL v4 = [(AVTAttributeValueView *)self selectionLayer];
  [v4 removeFromSuperlayer];

  BOOL v5 = [(AVTAttributeValueView *)self contentView];
  BOOL v6 = [v5 layer];
  float v7 = [(AVTAttributeValueView *)self imageLayer];
  [v6 addSublayer:v7];

  id v9 = [(AVTAttributeValueView *)self layer];
  double v8 = [(AVTAttributeValueView *)self selectionLayer];
  [v9 addSublayer:v8];
}

- (void)updateWithImage:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAttributeValueView *)self image];

  if (v5 != v4)
  {
    [(AVTAttributeValueView *)self setImage:v4];
    self->_showPlaceholder = 0;
  }
  id v8 = v4;
  uint64_t v6 = [v8 CGImage];
  float v7 = [(AVTAttributeValueView *)self imageLayer];
  [v7 setContents:v6];
}

- (void)prepareForTransitionToImage:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAttributeValueView *)self image];

  if (v5 != v4)
  {
    [(AVTAttributeValueView *)self setImage:v4];
    self->_showPlaceholder = 0;
  }
  id v8 = v4;
  uint64_t v6 = [v8 CGImage];
  float v7 = [(AVTAttributeValueView *)self transitionImageLayer];
  [v7 setContents:v6];
}

- (void)setShowPlaceholder:(BOOL)a3
{
  if (self->_showPlaceholder != a3)
  {
    self->_showPlaceholder = a3;
    if (a3)
    {
      id v4 = [(AVTAttributeValueView *)self traitCollection];
      AVTFlatSilhouetteImageForTraitCollection(v4);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = 0;
    }
    [(AVTAttributeValueView *)self updateWithImage:v5];
  }
}

- (BOOL)showPlaceholder
{
  return self->_showPlaceholder;
}

- (void)cleanupAfterTransition
{
  id v4 = [(AVTAttributeValueView *)self imageLayer];
  uint64_t v3 = [(AVTAttributeValueView *)self transitionImageLayer];
  [(AVTAttributeValueView *)self setImageLayer:v3];

  [(AVTAttributeValueView *)self bringSelectionLayersToFront];
  [(AVTAttributeValueView *)self setTransitionImageLayer:v4];
}

- (void)discardContent
{
  [(AVTAttributeValueView *)self updateWithImage:0];
  uint64_t v3 = [(AVTAttributeValueView *)self discardableContentHandler];

  if (v3)
  {
    id v4 = [(AVTAttributeValueView *)self discardableContentHandler];
    v4[2](v4, self);
  }
}

- (id)discardableContentHandler
{
  return self->discardableContentHandler;
}

- (void)setDiscardableContentHandler:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (CGSize)imageSizeRatio
{
  double width = self->_imageSizeRatio.width;
  double height = self->_imageSizeRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (void)setImageLayer:(id)a3
{
}

- (unint64_t)selectionStyle
{
  return self->_selectionStyle;
}

- (NSUUID)displaySessionUUID
{
  return self->_displaySessionUUID;
}

- (void)setDisplaySessionUUID:(id)a3
{
}

- (CAShapeLayer)clippingLayer
{
  return self->_clippingLayer;
}

- (void)setClippingLayer:(id)a3
{
}

- (CAShapeLayer)selectionLayer
{
  return self->_selectionLayer;
}

- (void)setSelectionLayer:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (CALayer)transitionImageLayer
{
  return self->_transitionImageLayer;
}

- (void)setTransitionImageLayer:(id)a3
{
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionImageLayer, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_selectionLayer, 0);
  objc_storeStrong((id *)&self->_clippingLayer, 0);
  objc_storeStrong((id *)&self->_displaySessionUUID, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->discardableContentHandler, 0);
}

@end