@interface CCUICAPackageView
- (BOOL)ccui_configureForPunchOutRendering:(BOOL)a3;
- (CAPackage)package;
- (CCUICAPackageDescription)packageDescription;
- (CCUICAPackageView)initWithFrame:(CGRect)a3;
- (double)scale;
- (id)_ccui_colorAppearanceTraitRegistration;
- (id)ccui_punchOutCompensatingCopy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_ccui_setColorAppearanceTraitRegistration:(id)a3;
- (void)_setPackage:(id)a3;
- (void)ccui_applyGlyphTintColor:(id)a3;
- (void)ccui_setCompensationAlpha:(double)a3;
- (void)ccui_updatePunchOutCompensationIfNecessary;
- (void)layoutSubviews;
- (void)setPackage:(id)a3;
- (void)setPackageDescription:(id)a3;
- (void)setScale:(double)a3;
- (void)setStateName:(id)a3;
@end

@implementation CCUICAPackageView

- (BOOL)ccui_configureForPunchOutRendering:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(CCUICAPackageView *)self layer];
  v5 = v4;
  if (v3) {
    uint64_t v6 = *MEMORY[0x1E4F3A098];
  }
  else {
    uint64_t v6 = 0;
  }
  [v4 setCompositingFilter:v6];
  v7 = [v5 superlayer];
  BOOL v8 = !v3;
  [v7 setAllowsGroupOpacity:v8];
  [v7 setAllowsGroupBlending:v8];

  return 1;
}

- (id)ccui_punchOutCompensatingCopy
{
  v2 = (void *)[(CCUICAPackageView *)self copy];
  objc_msgSend(v2, "ccui_updatePunchOutCompensationIfNecessary");
  return v2;
}

- (void)ccui_setCompensationAlpha:(double)a3
{
  if (a3 > 0.15) {
    a3 = 0.15;
  }
  [(CCUICAPackageView *)self setAlpha:a3];
}

- (void)ccui_updatePunchOutCompensationIfNecessary
{
  BOOL v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.37254902 green:0.37254902 blue:0.37254902 alpha:1.0];
  [(CCUICAPackageView *)self ccui_applyGlyphTintColor:v3];

  [(CCUICAPackageView *)self alpha];
  -[CCUICAPackageView ccui_setCompensationAlpha:](self, "ccui_setCompensationAlpha:");
}

- (void)ccui_applyGlyphTintColor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CCUICAPackageView *)self _ccui_colorAppearanceTraitRegistration];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    [(CCUICAPackageView *)self unregisterForTraitChanges:v5];
  }
  if (v4)
  {
    v7 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __71__CCUICAPackageView_CCUIGlyphTintingSupport__ccui_applyGlyphTintColor___block_invoke;
    v22[3] = &unk_1E6AD4278;
    id v23 = v4;
    BOOL v8 = [(CCUICAPackageView *)self registerForTraitChanges:v7 withHandler:v22];
  }
  else
  {
    BOOL v8 = 0;
  }
  [(CCUICAPackageView *)self _ccui_setColorAppearanceTraitRegistration:v8];
  v9 = [(CCUICAPackageView *)self traitCollection];
  v10 = [v4 resolvedColorWithTraitCollection:v9];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  v13 = v12;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__CCUICAPackageView_CCUIGlyphTintingSupport__ccui_applyGlyphTintColor___block_invoke_2;
  aBlock[3] = &unk_1E6AD42A0;
  id v21 = v13;
  id v14 = v13;
  v15 = _Block_copy(aBlock);
  v16 = [(CCUICAPackageView *)self layer];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__CCUICAPackageView_CCUIGlyphTintingSupport__ccui_applyGlyphTintColor___block_invoke_3;
  v18[3] = &unk_1E6AD42C8;
  id v19 = v15;
  id v17 = v15;
  [v16 ccuiEnumerateSubtreeUsingBlock:v18];
}

uint64_t __71__CCUICAPackageView_CCUIGlyphTintingSupport__ccui_applyGlyphTintColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ccui_applyGlyphTintColor:", *(void *)(a1 + 32));
}

uint64_t __71__CCUICAPackageView_CCUIGlyphTintingSupport__ccui_applyGlyphTintColor___block_invoke_2(uint64_t a1, CGColorRef color)
{
  if (!color) {
    return 0;
  }
  id v2 = [*(id *)(a1 + 32) colorWithAlphaComponent:CGColorGetAlpha(color)];
  uint64_t v3 = [v2 CGColor];

  return v3;
}

void __71__CCUICAPackageView_CCUIGlyphTintingSupport__ccui_applyGlyphTintColor___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 sublayers];
  uint64_t v4 = [v3 count];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v8;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setFillColor:", (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), objc_msgSend(v6, "fillColor")));
    objc_msgSend(v7, "setStrokeColor:", (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), objc_msgSend(v7, "strokeColor")));
  }
  else if (!v4)
  {
    objc_msgSend(v8, "setBackgroundColor:", (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), objc_msgSend(v8, "backgroundColor")));
  }
}

- (id)_ccui_colorAppearanceTraitRegistration
{
  return objc_getAssociatedObject(self, "CCUIGlyphTintingColorAppearanceTraitRegistrationKey");
}

- (void)_ccui_setColorAppearanceTraitRegistration:(id)a3
{
}

- (void)setPackage:(id)a3
{
  uint64_t v5 = (CAPackage *)a3;
  if (self->_package != v5)
  {
    objc_storeStrong((id *)&self->_package, a3);
    [(CCUICAPackageView *)self _setPackage:v5];
  }
}

- (void)setPackageDescription:(id)a3
{
  uint64_t v5 = (CCUICAPackageDescription *)a3;
  p_packageDescription = &self->_packageDescription;
  if (self->_packageDescription != v5)
  {
    objc_storeStrong((id *)&self->_packageDescription, a3);
    v7 = [MEMORY[0x1E4F39C38] ccuiPackageFromDescription:*p_packageDescription];
    [(CCUICAPackageView *)self setPackage:v7];

    id v8 = [(CCUICAPackageDescription *)*p_packageDescription stateUpdateHandlers];
    if ([v8 count])
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __43__CCUICAPackageView_setPackageDescription___block_invoke;
      v9[3] = &unk_1E6AD4610;
      v9[4] = self;
      [v8 enumerateKeysAndObjectsUsingBlock:v9];
    }
  }
}

void __43__CCUICAPackageView_setPackageDescription___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 424);
  id v6 = a3;
  id v9 = [v5 stateWithName:a2];
  v7 = v6[2](v6, v9);

  if (v9) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    [*(id *)(*(void *)(a1 + 32) + 424) removeState:v9];
    [*(id *)(*(void *)(a1 + 32) + 424) addState:v7];
  }
}

- (void)setStateName:(id)a3
{
  id v7 = [(CALayer *)self->_packageLayer stateWithName:a3];
  BOOL v4 = [(CCUICAPackageDescription *)self->_packageDescription honorsUIViewAnimationState];
  LODWORD(v5) = 1.0;
  if (v4)
  {
    int v6 = objc_msgSend(MEMORY[0x1E4FB1EB0], "areAnimationsEnabled", v5);
    double v5 = 0.0;
    if (v6) {
      *(float *)&double v5 = 1.0;
    }
  }
  [(CAStateController *)self->_stateController setState:v7 ofLayer:self->_packageLayer transitionSpeed:v5];
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    [(CCUICAPackageView *)self setNeedsLayout];
  }
}

- (CCUICAPackageView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CCUICAPackageView;
  uint64_t v3 = -[CCUICAPackageView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL v4 = v3;
  if (v3)
  {
    v3->_scale = 1.0;
    double v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    packageContentView = v4->_packageContentView;
    v4->_packageContentView = v5;

    [(CCUICAPackageView *)v4 addSubview:v4->_packageContentView];
    [(CCUICAPackageView *)v4 setUserInteractionEnabled:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CCUICAPackageView;
  [(CCUICAPackageView *)&v9 layoutSubviews];
  packageContentView = self->_packageContentView;
  [(CCUICAPackageView *)self bounds];
  UIRectGetCenter();
  -[UIView setCenter:](packageContentView, "setCenter:");
  double scale = self->_scale;
  memset(&v8, 0, sizeof(v8));
  if (fabs(scale + -1.0) >= 2.22044605e-16)
  {
    CGAffineTransformMakeScale(&v8, scale, scale);
  }
  else
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v8.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v8.c = v5;
    *(_OWORD *)&v8.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  int v6 = self->_packageContentView;
  CGAffineTransform v7 = v8;
  [(UIView *)v6 setTransform:&v7];
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = [CCUICAPackageView alloc];
  [(CCUICAPackageView *)self frame];
  long long v5 = -[CCUICAPackageView initWithFrame:](v4, "initWithFrame:");
  [(CCUICAPackageView *)v5 setPackageDescription:self->_packageDescription];
  stateController = v5->_stateController;
  CGAffineTransform v7 = [(CAStateController *)self->_stateController stateOfLayer:self->_packageLayer];
  [(CAStateController *)stateController setState:v7 ofLayer:v5->_packageLayer];

  [(CCUICAPackageView *)v5 setScale:self->_scale];
  return v5;
}

- (void)_setPackage:(id)a3
{
  packageLayer = self->_packageLayer;
  id v5 = a3;
  [(CALayer *)packageLayer removeFromSuperlayer];
  int v6 = [v5 rootLayer];
  uint64_t v7 = [v5 isGeometryFlipped];

  [(CALayer *)v6 setGeometryFlipped:v7];
  CGAffineTransform v8 = [(UIView *)self->_packageContentView layer];
  [v8 addSublayer:v6];

  packageContentView = self->_packageContentView;
  [(CALayer *)v6 bounds];
  -[UIView setBounds:](packageContentView, "setBounds:");
  v10 = self->_packageLayer;
  self->_packageLayer = v6;
  v11 = v6;

  id v12 = (CAStateController *)[objc_alloc(MEMORY[0x1E4F39CB0]) initWithLayer:v11];
  stateController = self->_stateController;
  self->_stateController = v12;

  [(CCUICAPackageView *)self setNeedsLayout];
}

- (CAPackage)package
{
  return self->_package;
}

- (CCUICAPackageDescription)packageDescription
{
  return self->_packageDescription;
}

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageDescription, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_packageLayer, 0);
  objc_storeStrong((id *)&self->_packageContentView, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
}

@end