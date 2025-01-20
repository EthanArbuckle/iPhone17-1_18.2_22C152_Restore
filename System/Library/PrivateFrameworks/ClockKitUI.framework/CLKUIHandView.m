@interface CLKUIHandView
- (BOOL)dropShadowsHidden;
- (BOOL)enableBackgroundColorAction;
- (BOOL)radialShadowsHidden;
- (BOOL)shadowImageBehindHand;
- (BOOL)shadowsHidden;
- (CALayer)inlayLayer;
- (CGPath)dropShadowPath;
- (CGPath)radialShadowPath;
- (CGPoint)anchorPointFromConfiguration;
- (CGSize)directionalShadowOffset;
- (CLKDevice)device;
- (CLKMonochromeFilterProvider)filterProvider;
- (CLKUIAnalogHandConfiguration)configuration;
- (CLKUIColoringImageView)handImageView;
- (CLKUIHandView)initWithConfiguration:(id)a3 forDevice:(id)a4 maskedShadow:(BOOL)a5;
- (CLKUIHandView)initWithImage:(id)a3 forDevice:(id)a4;
- (UIColor)color;
- (UIColor)handDotColor;
- (UIColor)inlayColor;
- (UIEdgeInsets)inlayInsets;
- (UIEdgeInsets)shadowInsets;
- (UIImage)dropShadowImage;
- (UIImage)image;
- (UIImage)radialShadowImage;
- (UIView)handDotView;
- (double)scale;
- (double)zRotation;
- (id)shadowView;
- (void)_adjustHandImageSubviewOrder;
- (void)_initWithImage:(id)a3 forDevice:(id)a4;
- (void)_layoutInlayLayer;
- (void)_updateShadows;
- (void)_updateTransform;
- (void)layoutSubviews;
- (void)noModelUpdate_setColor:(id)a3;
- (void)noModelUpdate_setHandDotColor:(id)a3;
- (void)noModelUpdate_setInlayColor:(id)a3;
- (void)noModelUpdate_setInlayInsets:(UIEdgeInsets)a3;
- (void)setAlpha:(double)a3;
- (void)setColor:(id)a3;
- (void)setDirectionalShadowOffset:(CGSize)a3;
- (void)setDropShadowImage:(id)a3;
- (void)setDropShadowPath:(CGPath *)a3;
- (void)setDropShadowsHidden:(BOOL)a3;
- (void)setEnableBackgroundColorAction:(BOOL)a3;
- (void)setFilterProvider:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setNeedsLayout;
- (void)setRadialShadowImage:(id)a3;
- (void)setRadialShadowPath:(CGPath *)a3;
- (void)setRadialShadowsHidden:(BOOL)a3;
- (void)setScale:(double)a3;
- (void)setShadowImageBehindHand:(BOOL)a3;
- (void)setShadowInsets:(UIEdgeInsets)a3;
- (void)setShadowsHidden:(BOOL)a3;
- (void)setZRotation:(double)a3;
- (void)setupHandDotViewWithDiameter:(double)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation CLKUIHandView

- (CLKUIHandView)initWithImage:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CLKUIHandView;
  v8 = [(CLKUIHandView *)&v11 init];
  v9 = v8;
  if (v8) {
    [(CLKUIHandView *)v8 _initWithImage:v6 forDevice:v7];
  }

  return v9;
}

- (void)_initWithImage:(id)a3 forDevice:(id)a4
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v6 = (UIImage *)a3;
  id v7 = (CLKDevice *)a4;
  v8 = [[CLKUIColoringImageView alloc] initWithImage:v6];
  handImageView = self->_handImageView;
  self->_handImageView = v8;

  [(UIImage *)v6 size];
  double v11 = v10;
  [(UIImage *)v6 size];
  -[CLKUIColoringImageView setBounds:](self->_handImageView, "setBounds:", 0.0, 0.0, v11, v12);
  [(CLKUIHandView *)self addSubview:self->_handImageView];
  device = self->_device;
  self->_device = v7;
  v14 = v7;

  image = self->_image;
  self->_image = v6;
  v16 = v6;

  self->_dropShadowsHidden = 1;
  [(CLKUIHandView *)self _updateShadows];
  self->_scale = 1.0;
  self->_zRotation = 0.0;
  v17 = [(CLKUIHandView *)self layer];
  v22[0] = @"transform";
  v18 = [MEMORY[0x1E4F1CA98] null];
  v23[0] = v18;
  v22[1] = @"bounds";
  v19 = [MEMORY[0x1E4F1CA98] null];
  v23[1] = v19;
  v22[2] = @"position";
  v20 = [MEMORY[0x1E4F1CA98] null];
  v23[2] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];

  [v17 setActions:v21];
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)CLKUIHandView;
  [(CLKUIHandView *)&v18 layoutSubviews];
  [(CLKUIHandView *)self bounds];
  double v4 = v3 * 0.5;
  double v6 = v5 * 0.5;
  -[CLKUIColoringImageView setCenter:](self->_handImageView, "setCenter:", v3 * 0.5, v5 * 0.5);
  [(CLKUIHandView *)self _layoutInlayLayer];
  [(UIImageView *)self->_radialShadowImageView sizeToFit];
  -[UIImageView setCenter:](self->_radialShadowImageView, "setCenter:", v4, v6);
  [(UIImageView *)self->_dropShadowImageView sizeToFit];
  [(CLKUIHandView *)self bounds];
  double Width = CGRectGetWidth(v19);
  [(UIImageView *)self->_dropShadowImageView bounds];
  double v8 = Width / CGRectGetWidth(v20);
  [(CLKUIHandView *)self bounds];
  double Height = CGRectGetHeight(v21);
  [(UIImageView *)self->_dropShadowImageView bounds];
  double v10 = Height / CGRectGetHeight(v22);
  double v11 = [(CLKUIHandView *)self layer];
  [v11 anchorPoint];
  double v13 = (v12 + -0.5) * v8 + 0.5;
  v14 = [(CLKUIHandView *)self layer];
  [v14 anchorPoint];
  double v16 = (v15 + -0.5) * v10 + 0.5;
  v17 = [(UIImageView *)self->_dropShadowImageView layer];
  objc_msgSend(v17, "setAnchorPoint:", v13, v16);

  [(CLKUIHandView *)self _updateShadows];
}

- (void)_layoutInlayLayer
{
  [(CLKUIHandView *)self bounds];
  double top = self->_inlayInsets.top;
  double left = self->_inlayInsets.left;
  double v6 = v5 + left;
  double v8 = v7 + top;
  double v10 = v9 - (left + self->_inlayInsets.right);
  double v12 = v11 - (top + self->_inlayInsets.bottom);
  uint64_t v13 = -[CALayer setBounds:](self->_inlayLayer, "setBounds:", 0.0, 0.0, v10, v12);
  inlayLayer = self->_inlayLayer;
  MEMORY[0x1D94315A0](v13, v6, v8, v10, v12);
  -[CALayer setPosition:](inlayLayer, "setPosition:");
  double v15 = self->_inlayLayer;
  [(CALayer *)v15 setCornerRadius:v10 * 0.5];
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
  id v5 = a3;
  [(CLKUIHandView *)self noModelUpdate_setColor:v5];
}

- (void)noModelUpdate_setColor:(id)a3
{
}

- (void)setImage:(id)a3
{
}

- (void)setZRotation:(double)a3
{
  self->_zRotation = a3;
  [(CLKUIHandView *)self _updateTransform];
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
  [(CLKUIHandView *)self _updateTransform];
}

- (void)_updateTransform
{
  double v3 = [(CLKUIHandView *)self layer];
  CATransform3DMakeScale(&v7, self->_scale, self->_scale, self->_scale);
  CATransform3DRotate(&v8, &v7, self->_zRotation, 0.0, 0.0, 1.0);
  [v3 setTransform:&v8];

  double v4 = [(UIImageView *)self->_dropShadowImageView layer];
  CATransform3DMakeScale(&v5, self->_scale, self->_scale, self->_scale);
  CATransform3DRotate(&v6, &v5, self->_zRotation, 0.0, 0.0, 1.0);
  [v4 setTransform:&v6];
}

- (void)setEnableBackgroundColorAction:(BOOL)a3
{
  if (self->_enableBackgroundColorAction != a3)
  {
    BOOL v3 = a3;
    CATransform3D v5 = [(CALayer *)self->_inlayLayer actions];
    id v8 = (id)[v5 mutableCopy];

    if (v3)
    {
      [v8 removeObjectForKey:@"backgroundColor"];
    }
    else
    {
      CATransform3D v6 = [MEMORY[0x1E4F1CA98] null];
      [v8 setObject:v6 forKey:@"backgroundColor"];
    }
    CATransform3D v7 = [(CLKUIHandView *)self inlayLayer];
    [v7 setActions:v8];

    self->_enableBackgroundColorAction = v3;
  }
}

- (CALayer)inlayLayer
{
  v15[4] = *MEMORY[0x1E4F143B8];
  inlayLayer = self->_inlayLayer;
  if (!inlayLayer)
  {
    double v4 = [MEMORY[0x1E4F39BE8] layer];
    CATransform3D v5 = self->_inlayLayer;
    self->_inlayLayer = v4;

    CATransform3D v6 = self->_inlayLayer;
    v14[0] = @"transform";
    CATransform3D v7 = [MEMORY[0x1E4F1CA98] null];
    v15[0] = v7;
    v14[1] = @"bounds";
    id v8 = [MEMORY[0x1E4F1CA98] null];
    v15[1] = v8;
    v14[2] = @"position";
    double v9 = [MEMORY[0x1E4F1CA98] null];
    v15[2] = v9;
    v14[3] = @"backgroundColor";
    double v10 = [MEMORY[0x1E4F1CA98] null];
    v15[3] = v10;
    double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
    [(CALayer *)v6 setActions:v11];

    double v12 = [(CLKUIColoringImageView *)self->_handImageView layer];
    [v12 addSublayer:self->_inlayLayer];

    [(CLKUIHandView *)self _adjustHandImageSubviewOrder];
    inlayLayer = self->_inlayLayer;
  }
  return inlayLayer;
}

- (void)setRadialShadowImage:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_radialShadowImage, a3);
  radialShadowImageView = self->_radialShadowImageView;
  if (!radialShadowImageView)
  {
    CATransform3D v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    CATransform3D v7 = self->_radialShadowImageView;
    self->_radialShadowImageView = v6;

    [(CLKUIHandView *)self addSubview:self->_radialShadowImageView];
    radialShadowImageView = self->_radialShadowImageView;
  }
  [(UIImageView *)radialShadowImageView setImage:v8];
  [(CLKUIHandView *)self _updateShadows];
}

- (void)setShadowImageBehindHand:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shadowImageBehindHand = a3;
  radialShadowImageView = self->_radialShadowImageView;
  if (v3) {
    [(CLKUIHandView *)self sendSubviewToBack:radialShadowImageView];
  }
  else {
    [(CLKUIHandView *)self bringSubviewToFront:radialShadowImageView];
  }
}

- (void)noModelUpdate_setInlayColor:(id)a3
{
  CATransform3D v5 = (UIColor *)a3;
  p_inlayColor = &self->_inlayColor;
  inlayColor = self->_inlayColor;
  if (inlayColor == v5) {
    goto LABEL_12;
  }
  double v12 = v5;
  objc_storeStrong((id *)&self->_inlayColor, a3);
  if (!v12 || inlayColor)
  {
    if (v12 || !inlayColor) {
      goto LABEL_9;
    }
    id v8 = [(CLKUIHandView *)self inlayLayer];
    double v9 = v8;
    uint64_t v10 = 1;
  }
  else
  {
    id v8 = [(CLKUIHandView *)self inlayLayer];
    double v9 = v8;
    uint64_t v10 = 0;
  }
  [v8 setHidden:v10];

LABEL_9:
  if (*p_inlayColor)
  {
    double v11 = [(CLKUIHandView *)self inlayLayer];
    objc_msgSend(v11, "setBackgroundColor:", -[UIColor CGColor](*p_inlayColor, "CGColor"));
  }
  [(CLKUIHandView *)self setNeedsLayout];
  CATransform3D v5 = v12;
LABEL_12:
}

- (void)noModelUpdate_setInlayInsets:(UIEdgeInsets)a3
{
  self->_inlayInsets = a3;
  [(CLKUIHandView *)self _layoutInlayLayer];
}

- (void)setShadowsHidden:(BOOL)a3
{
  if (self->_shadowsHidden != a3)
  {
    self->_shadowsHidden = a3;
    [(CLKUIHandView *)self _updateShadows];
  }
}

- (void)setRadialShadowsHidden:(BOOL)a3
{
  if (self->_radialShadowsHidden != a3)
  {
    self->_radialShadowsHidden = a3;
    [(CLKUIHandView *)self _updateShadows];
  }
}

- (void)setDropShadowsHidden:(BOOL)a3
{
  if (self->_dropShadowsHidden != a3)
  {
    self->_dropShadowsHidden = a3;
    [(CLKUIHandView *)self _updateShadows];
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CLKUIHandView;
  -[CLKUIHandView setHidden:](&v5, sel_setHidden_);
  [(CLKUIHandView *)self setShadowsHidden:v3];
}

- (void)setNeedsLayout
{
  v4.receiver = self;
  v4.super_class = (Class)CLKUIHandView;
  [(CLKUIHandView *)&v4 setNeedsLayout];
  if (CLKInternalBuild() && ([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v2 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v3 = 0;
      _os_log_impl(&dword_1D3174000, v2, OS_LOG_TYPE_DEFAULT, "AnalogHandsView-WrongThread: Hands view is not laying out on main thread.", v3, 2u);
    }
  }
}

- (void)_updateShadows
{
  if (CLKInternalBuild()) {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  }
  if (self->_shadowsHidden)
  {
    [(UIImageView *)self->_radialShadowImageView setHidden:1];
LABEL_10:
    [(UIImageView *)self->_dropShadowImageView setHidden:1];
    [(UIImageView *)self->_dropShadowImageView removeFromSuperview];
    dropShadowImageView = self->_dropShadowImageView;
    self->_dropShadowImageView = 0;

    return;
  }
  BOOL dropShadowsHidden = self->_dropShadowsHidden;
  if (self->_radialShadowsHidden)
  {
    [(UIImageView *)self->_radialShadowImageView setHidden:1];
  }
  else if (self->_radialShadowImage)
  {
    [(UIImageView *)self->_radialShadowImageView setHidden:0];
    radialShadowImageView = self->_radialShadowImageView;
    [(CLKUIHandView *)self alpha];
    -[UIImageView setAlpha:](radialShadowImageView, "setAlpha:");
  }
  if (dropShadowsHidden) {
    goto LABEL_10;
  }
  CATransform3D v6 = self->_dropShadowImageView;
  if (!v6)
  {
    CATransform3D v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    id v8 = self->_dropShadowImageView;
    self->_dropShadowImageView = v7;

    CATransform3D v6 = self->_dropShadowImageView;
  }
  [(UIImageView *)v6 setImage:self->_dropShadowImage];
  double v9 = self->_dropShadowImageView;
  if (self->_dropShadowImage)
  {
    [(UIImageView *)v9 setHidden:0];
    uint64_t v10 = self->_dropShadowImageView;
    [(CLKUIHandView *)self alpha];
    -[UIImageView setAlpha:](v10, "setAlpha:");
  }
  else
  {
    [(UIImageView *)v9 setHidden:1];
  }
}

- (void)setDropShadowImage:(id)a3
{
  objc_storeStrong((id *)&self->_dropShadowImage, a3);
  [(CLKUIHandView *)self _updateShadows];
}

- (void)noModelUpdate_setHandDotColor:(id)a3
{
  p_handDotColor = &self->_handDotColor;
  objc_storeStrong((id *)&self->_handDotColor, a3);
  id v6 = a3;
  CATransform3D v7 = *p_handDotColor;
  id v8 = [(CLKUIHandView *)self handDotView];
  [v8 setBackgroundColor:v7];
}

- (void)setupHandDotViewWithDiameter:(double)a3
{
  handDotView = self->_handDotView;
  if (!handDotView)
  {
    id v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    CATransform3D v7 = self->_handDotView;
    self->_handDotView = v6;

    handDotView = self->_handDotView;
  }
  -[UIView setBounds:](handDotView, "setBounds:", 0.0, 0.0, a3, a3);
  id v8 = [(UIView *)self->_handDotView layer];
  [v8 setCornerRadius:a3 * 0.5];

  double v9 = self->_handDotView;
  [(CLKUIHandView *)self bounds];
  double v11 = v10;
  double v12 = [(CLKUIHandView *)self layer];
  [v12 anchorPoint];
  double v14 = v11 * v13;
  [(CLKUIHandView *)self bounds];
  double v16 = v15;
  v17 = [(CLKUIHandView *)self layer];
  [v17 anchorPoint];
  -[UIView setCenter:](v9, "setCenter:", v14, v16 * v18);

  [(CLKUIHandView *)self addSubview:self->_handDotView];
  [(CLKUIHandView *)self _adjustHandImageSubviewOrder];
}

- (void)_adjustHandImageSubviewOrder
{
  inlayLayer = self->_inlayLayer;
  if (inlayLayer)
  {
    [(CALayer *)inlayLayer removeFromSuperlayer];
    objc_super v4 = [(CLKUIColoringImageView *)self->_handImageView layer];
    [v4 addSublayer:self->_inlayLayer];
  }
  handDotView = self->_handDotView;
  handImageView = self->_handImageView;
  [(CLKUIHandView *)self insertSubview:handDotView aboveSubview:handImageView];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5 = [(CLKUIHandView *)self filterProvider];
  id v10 = [v5 filtersForView:self style:2 fraction:a3];

  if (v10)
  {
    id v6 = [(CLKUIColoringImageView *)self->_handImageView layer];
    [v6 setFilters:v10];
  }
  CATransform3D v7 = [(CLKUIHandView *)self filterProvider];
  id v8 = [v7 filtersForView:self style:0 fraction:a3];

  if (v8)
  {
    double v9 = [(UIView *)self->_handDotView layer];
    [v9 setFilters:v8];
  }
}

- (void)updateMonochromeColor
{
  BOOL v3 = [(CLKUIHandView *)self filterProvider];
  id v8 = [v3 filtersForView:self style:2];

  if (v8)
  {
    objc_super v4 = [(CLKUIColoringImageView *)self->_handImageView layer];
    [v4 setFilters:v8];
  }
  objc_super v5 = [(CLKUIHandView *)self filterProvider];
  id v6 = [v5 filtersForView:self style:0];

  if (v6)
  {
    CATransform3D v7 = [(UIView *)self->_handDotView layer];
    [v7 setFilters:v6];
  }
}

- (void)setAlpha:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CLKUIHandView;
  [(CLKUIHandView *)&v4 setAlpha:a3];
  [(CLKUIHandView *)self _updateShadows];
}

- (CLKUIHandView)initWithConfiguration:(id)a3 forDevice:(id)a4 maskedShadow:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CLKUIHandView;
  id v10 = [(CLKUIHandView *)&v26 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    configuration = v10->_configuration;
    v10->_configuration = (CLKUIAnalogHandConfiguration *)v11;

    [(CLKUIAnalogHandConfiguration *)v10->_configuration dropShadowOpacity];
    double v14 = v13;
    BOOL v15 = v13 == 0.0;
    [(CLKUIAnalogHandConfiguration *)v10->_configuration radialShadowOpacity];
    double v17 = v16;
    BOOL v18 = v16 == 0.0;
    if (v5) {
      uint64_t v19 = 22;
    }
    else {
      uint64_t v19 = 14;
    }
    CGRect v20 = +[CLKUIAnalogHandFactory getAssets:v19 forConfiguration:v10->_configuration];
    CGRect v21 = [v20 objectForKey:&unk_1F2A6A680];
    [(CLKUIHandView *)v10 _initWithImage:v21 forDevice:v9];
    [(CLKUIAnalogHandConfiguration *)v10->_configuration bounds];
    -[CLKUIHandView setBounds:](v10, "setBounds:");
    [(CLKUIAnalogHandConfiguration *)v10->_configuration inlayInsets];
    -[CLKUIHandView setInlayInsets:](v10, "setInlayInsets:");
    [(CLKUIHandView *)v10 setShadowsHidden:0];
    [(CLKUIHandView *)v10 setDropShadowsHidden:v15];
    [(CLKUIHandView *)v10 setRadialShadowsHidden:v18];
    [(CLKUIAnalogHandConfiguration *)v10->_configuration directionalShadowOffset];
    -[CLKUIHandView setDirectionalShadowOffset:](v10, "setDirectionalShadowOffset:");
    if (v14 != 0.0)
    {
      if (v5) {
        CGRect v22 = &unk_1F2A6A698;
      }
      else {
        CGRect v22 = &unk_1F2A6A6B0;
      }
      v23 = [v20 objectForKey:v22];
      [(CLKUIHandView *)v10 setDropShadowImage:v23];
    }
    if (v17 != 0.0)
    {
      v24 = [v20 objectForKey:&unk_1F2A6A6C8];
      [(CLKUIHandView *)v10 setRadialShadowImage:v24];
      [(CLKUIHandView *)v10 setShadowImageBehindHand:1];
    }
  }

  return v10;
}

- (CGPoint)anchorPointFromConfiguration
{
  [(CLKUIAnalogHandConfiguration *)self->_configuration anchorPoint];
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)shadowView
{
  return self->_dropShadowImageView;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (UIImage)image
{
  return self->_image;
}

- (double)zRotation
{
  return self->_zRotation;
}

- (double)scale
{
  return self->_scale;
}

- (UIColor)inlayColor
{
  return self->_inlayColor;
}

- (UIEdgeInsets)inlayInsets
{
  double top = self->_inlayInsets.top;
  double left = self->_inlayInsets.left;
  double bottom = self->_inlayInsets.bottom;
  double right = self->_inlayInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CLKUIAnalogHandConfiguration)configuration
{
  return (CLKUIAnalogHandConfiguration *)objc_getProperty(self, a2, 496, 1);
}

- (BOOL)shadowsHidden
{
  return self->_shadowsHidden;
}

- (BOOL)radialShadowsHidden
{
  return self->_radialShadowsHidden;
}

- (BOOL)dropShadowsHidden
{
  return self->_dropShadowsHidden;
}

- (UIEdgeInsets)shadowInsets
{
  double top = self->_shadowInsets.top;
  double left = self->_shadowInsets.left;
  double bottom = self->_shadowInsets.bottom;
  double right = self->_shadowInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setShadowInsets:(UIEdgeInsets)a3
{
  self->_shadowInsets = a3;
}

- (UIImage)radialShadowImage
{
  return self->_radialShadowImage;
}

- (UIImage)dropShadowImage
{
  return self->_dropShadowImage;
}

- (CGPath)dropShadowPath
{
  return self->_dropShadowPath;
}

- (void)setDropShadowPath:(CGPath *)a3
{
  self->_dropShadowPath = a3;
}

- (CGPath)radialShadowPath
{
  return self->_radialShadowPath;
}

- (void)setRadialShadowPath:(CGPath *)a3
{
  self->_radialShadowPath = a3;
}

- (CGSize)directionalShadowOffset
{
  double width = self->_directionalShadowOffset.width;
  double height = self->_directionalShadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDirectionalShadowOffset:(CGSize)a3
{
  self->_directionalShadowOffset = a3;
}

- (BOOL)shadowImageBehindHand
{
  return self->_shadowImageBehindHand;
}

- (UIColor)handDotColor
{
  return self->_handDotColor;
}

- (UIView)handDotView
{
  return self->_handDotView;
}

- (CLKUIColoringImageView)handImageView
{
  return self->_handImageView;
}

- (CLKDevice)device
{
  return self->_device;
}

- (BOOL)enableBackgroundColorAction
{
  return self->_enableBackgroundColorAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_handImageView, 0);
  objc_storeStrong((id *)&self->_handDotColor, 0);
  objc_storeStrong((id *)&self->_dropShadowImage, 0);
  objc_storeStrong((id *)&self->_radialShadowImage, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_inlayColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_dropShadowImageView, 0);
  objc_storeStrong((id *)&self->_radialShadowImageView, 0);
  objc_storeStrong((id *)&self->_handDotView, 0);
  objc_storeStrong((id *)&self->_inlayLayer, 0);
}

@end