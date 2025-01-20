@interface MTMaterialShadowView
+ (id)materialShadowViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4;
+ (id)materialShadowViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4 initialWeighting:(double)a5;
+ (id)materialShadowViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4 initialWeighting:(double)a5 scaleAdjustment:(id)a6;
+ (id)materialShadowViewWithRecipeNamed:(id)a3 inBundle:(id)a4 configuration:(int64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7;
+ (id)materialShadowViewWithRecipeNamesByTraitCollection:(id)a3 inBundle:(id)a4 configuration:(int64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7;
- (BOOL)isCaptureOnlyMaterialViewSuppliedByClient;
- (BOOL)shadowPathIsBounds;
- (CGSize)shadowOffset;
- (MTMaterialShadowView)initWithMaterialView:(id)a3;
- (MTMaterialView)materialView;
- (UIColor)shadowColor;
- (double)shadowOpacity;
- (double)shadowRadius;
- (void)_configureCaptureOnlyMaterialViewIfNecessary;
- (void)_configureShadowViewIfNecessary;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)groupNameDidChangeForMaterialView:(id)a3;
- (void)layoutSubviews;
- (void)recipeNameDidChangeForMaterialView:(id)a3;
- (void)setCaptureOnlyMaterialViewSuppliedByClient:(BOOL)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setShadowOpacity:(double)a3;
- (void)setShadowPathIsBounds:(BOOL)a3;
- (void)setShadowRadius:(double)a3;
- (void)weightingDidChangeForMaterialView:(id)a3;
@end

@implementation MTMaterialShadowView

+ (id)materialShadowViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4
{
  return (id)[a1 materialShadowViewWithRecipe:a3 configuration:a4 initialWeighting:1.0];
}

+ (id)materialShadowViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4 initialWeighting:(double)a5
{
  return (id)[a1 materialShadowViewWithRecipe:a3 configuration:a4 initialWeighting:0 scaleAdjustment:a5];
}

+ (id)materialShadowViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4 initialWeighting:(double)a5 scaleAdjustment:(id)a6
{
  id v10 = a6;
  id v11 = objc_alloc((Class)a1);
  v12 = +[MTMaterialView materialViewWithRecipe:a3 configuration:a4 initialWeighting:v10 scaleAdjustment:a5];

  v13 = (void *)[v11 initWithMaterialView:v12];

  return v13;
}

+ (id)materialShadowViewWithRecipeNamed:(id)a3 inBundle:(id)a4 configuration:(int64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7
{
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc((Class)a1);
  v16 = +[MTMaterialView materialViewWithRecipeNamed:v14 inBundle:v13 configuration:a5 initialWeighting:v12 scaleAdjustment:a6];

  v17 = (void *)[v15 initWithMaterialView:v16];

  return v17;
}

+ (id)materialShadowViewWithRecipeNamesByTraitCollection:(id)a3 inBundle:(id)a4 configuration:(int64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7
{
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc((Class)a1);
  v16 = +[MTMaterialView materialViewWithRecipeNamesByTraitCollection:v14 compatibleWithTraitCollection:0 bundle:v13 configuration:a5 initialWeighting:v12 scaleAdjustment:a6];

  v17 = (void *)[v15 initWithMaterialView:v16];

  return v17;
}

- (MTMaterialShadowView)initWithMaterialView:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"MTMaterialShadowView.m", 54, @"Invalid parameter not satisfying: %@", @"materialView" object file lineNumber description];
  }
  [(MTMaterialView *)self->_materialView bounds];
  v15.receiver = self;
  v15.super_class = (Class)MTMaterialShadowView;
  v7 = -[MTMaterialShadowView initWithFrame:](&v15, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    [(MTMaterialShadowView *)v7 setAutoresizesSubviews:1];
    p_materialView = (id *)&v8->_materialView;
    objc_storeStrong((id *)&v8->_materialView, a3);
    id v10 = [(MTMaterialView *)v8->_materialView groupNameBase];

    if (!v10)
    {
      id v11 = *p_materialView;
      id v12 = [NSString stringWithFormat:@"%@.%p", objc_opt_class(), v8];
      [v11 setGroupNameBase:v12];
    }
    [*p_materialView _addObserver:v8];
    [*p_materialView frame];
    -[MTMaterialShadowView setBounds:](v8, "setBounds:");
    [(MTMaterialShadowView *)v8 addSubview:*p_materialView];
    [*p_materialView setAutoresizingMask:18];
  }

  return v8;
}

- (UIColor)shadowColor
{
  shadowView = self->_shadowView;
  if (shadowView)
  {
    v3 = (void *)MEMORY[0x263F1C550];
    v4 = [(UIView *)shadowView layer];
    v5 = objc_msgSend(v3, "colorWithCGColor:", objc_msgSend(v4, "shadowColor"));
  }
  else
  {
    v5 = 0;
  }

  return (UIColor *)v5;
}

- (void)setShadowColor:(id)a3
{
  id v4 = a3;
  [(MTMaterialShadowView *)self _configureShadowViewIfNecessary];
  id v7 = [(UIView *)self->_shadowView layer];
  id v5 = v4;
  uint64_t v6 = [v5 CGColor];

  [v7 setShadowColor:v6];
}

- (double)shadowOpacity
{
  v2 = [(UIView *)self->_shadowView layer];
  [v2 shadowOpacity];
  double v4 = v3;

  return v4;
}

- (void)setShadowOpacity:(double)a3
{
  [(MTMaterialShadowView *)self _configureShadowViewIfNecessary];
  id v6 = [(UIView *)self->_shadowView layer];
  *(float *)&double v5 = a3;
  [v6 setShadowOpacity:v5];
}

- (CGSize)shadowOffset
{
  v2 = [(UIView *)self->_shadowView layer];
  [v2 shadowOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(MTMaterialShadowView *)self _configureShadowViewIfNecessary];
  id v6 = [(UIView *)self->_shadowView layer];
  objc_msgSend(v6, "setShadowOffset:", width, height);
}

- (double)shadowRadius
{
  v2 = [(UIView *)self->_shadowView layer];
  [v2 shadowRadius];
  double v4 = v3;

  return v4;
}

- (void)setShadowRadius:(double)a3
{
  [(MTMaterialShadowView *)self _configureShadowViewIfNecessary];
  id v5 = [(UIView *)self->_shadowView layer];
  [v5 setShadowRadius:a3];
}

- (BOOL)shadowPathIsBounds
{
  v2 = [(UIView *)self->_shadowView layer];
  char v3 = [v2 shadowPathIsBounds];

  return v3;
}

- (void)setShadowPathIsBounds:(BOOL)a3
{
  BOOL v3 = a3;
  [(MTMaterialShadowView *)self _configureShadowViewIfNecessary];
  id v5 = [(UIView *)self->_shadowView layer];
  [v5 setShadowPathIsBounds:v3];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MTMaterialShadowView;
  [(MTMaterialShadowView *)&v3 layoutSubviews];
  [(MTMaterialShadowView *)self _configureCaptureOnlyMaterialViewIfNecessary];
}

- (void)_setContinuousCornerRadius:(double)a3
{
  -[MTMaterialView _setContinuousCornerRadius:](self->_materialView, "_setContinuousCornerRadius:");
  [(UIView *)self->_shadowView _setContinuousCornerRadius:a3];
  captureOnlyMaterialView = self->_captureOnlyMaterialView;

  [(MTMaterialView *)captureOnlyMaterialView _setContinuousCornerRadius:a3];
}

- (void)recipeNameDidChangeForMaterialView:(id)a3
{
  captureOnlyMaterialView = self->_captureOnlyMaterialView;
  id v4 = [a3 recipeName];
  [(MTMaterialView *)captureOnlyMaterialView setRecipeName:v4];
}

- (void)weightingDidChangeForMaterialView:(id)a3
{
  captureOnlyMaterialView = self->_captureOnlyMaterialView;
  [a3 weighting];

  -[MTMaterialView setWeighting:](captureOnlyMaterialView, "setWeighting:");
}

- (void)groupNameDidChangeForMaterialView:(id)a3
{
  captureOnlyMaterialView = self->_captureOnlyMaterialView;
  id v4 = [a3 groupNameBase];
  [(MTMaterialView *)captureOnlyMaterialView setGroupNameBase:v4];
}

- (void)_configureShadowViewIfNecessary
{
  if (!self->_shadowView)
  {
    id v3 = objc_alloc(MEMORY[0x263F1CB60]);
    [(MTMaterialShadowView *)self bounds];
    id v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    shadowView = self->_shadowView;
    self->_shadowView = v4;

    id v6 = [(UIView *)self->_shadowView layer];
    [v6 setShadowPathIsBounds:1];

    double v7 = self->_shadowView;
    [(MTMaterialView *)self->_materialView _continuousCornerRadius];
    -[UIView _setContinuousCornerRadius:](v7, "_setContinuousCornerRadius:");
    [(MTMaterialShadowView *)self insertSubview:self->_shadowView belowSubview:self->_materialView];
    double v8 = self->_shadowView;
    [(UIView *)v8 setAutoresizingMask:18];
  }
}

- (void)_configureCaptureOnlyMaterialViewIfNecessary
{
  if (self->_shadowView && !self->_captureOnlyMaterialViewSuppliedByClient && !self->_captureOnlyMaterialView)
  {
    id v3 = (MTMaterialView *)[(MTMaterialView *)self->_materialView copy];
    captureOnlyMaterialView = self->_captureOnlyMaterialView;
    self->_captureOnlyMaterialView = v3;

    [(MTMaterialView *)self->_captureOnlyMaterialView setCaptureOnly:1];
    id v5 = self->_captureOnlyMaterialView;
    id v6 = [(MTMaterialView *)self->_materialView groupNameBase];
    [(MTMaterialView *)v5 setGroupNameBase:v6];

    double v7 = self->_captureOnlyMaterialView;
    [(MTMaterialShadowView *)self bounds];
    -[MTMaterialView setFrame:](v7, "setFrame:");
    [(MTMaterialShadowView *)self insertSubview:self->_captureOnlyMaterialView belowSubview:self->_shadowView];
    double v8 = self->_captureOnlyMaterialView;
    [(MTMaterialView *)v8 setAutoresizingMask:18];
  }
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (BOOL)isCaptureOnlyMaterialViewSuppliedByClient
{
  return self->_captureOnlyMaterialViewSuppliedByClient;
}

- (void)setCaptureOnlyMaterialViewSuppliedByClient:(BOOL)a3
{
  self->_captureOnlyMaterialViewSuppliedByClient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_captureOnlyMaterialView, 0);

  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end