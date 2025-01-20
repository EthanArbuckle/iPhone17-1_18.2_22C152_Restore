@interface _FCUIAddActivityControl
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)preferredContentSizeCategory;
- (_FCUIAddActivityControl)initWithAction:(id)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (void)_configureBackgroundMaterialViewIfNecesssary;
- (void)_configureGlyphImageViewIfNecessary;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
@end

@implementation _FCUIAddActivityControl

- (_FCUIAddActivityControl)initWithAction:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_FCUIAddActivityControl;
  v5 = [(_FCUIAddActivityControl *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(_FCUIAddActivityControl *)v5 addAction:v4 forControlEvents:64];
    v7 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if (v8 == 1)
    {
      v9 = (void *)[objc_alloc(MEMORY[0x263F82A70]) initWithDelegate:v6];
      [(_FCUIAddActivityControl *)v6 addInteraction:v9];
    }
  }

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(_FCUIAddActivityControl *)self _configureGlyphImageViewIfNecessary];
  -[UIImageView sizeThatFits:](self->_glyphImageView, "sizeThatFits:", width, height);
  UIRoundToScale();
  double v7 = v6;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_FCUIAddActivityControl;
  [(_FCUIAddActivityControl *)&v4 layoutSubviews];
  [(_FCUIAddActivityControl *)self _configureBackgroundMaterialViewIfNecesssary];
  backgroundMaterialView = self->_backgroundMaterialView;
  [(_FCUIAddActivityControl *)self bounds];
  [(MTMaterialView *)backgroundMaterialView _setCornerRadius:CGRectGetHeight(v5) * 0.5];
  [(_FCUIAddActivityControl *)self _configureGlyphImageViewIfNecessary];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  CGRect v5 = [v4 view];
  BOOL v6 = v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || [v4 numberOfTouchesRequired] != 1
    || [v4 numberOfTapsRequired] != 1;

  return v6;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  [(_FCUIAddActivityControl *)self _configureBackgroundMaterialViewIfNecesssary];
  backgroundMaterialView = self->_backgroundMaterialView;
  return (id)[(MTMaterialView *)backgroundMaterialView visualStylingProviderForCategory:a3];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(_FCUIAddActivityControl *)self adjustsFontForContentSizeCategory];
  if (v3) {
    [(_FCUIAddActivityControl *)self setNeedsLayout];
  }
  return v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x263F82AD0]);
  BOOL v6 = (void *)MEMORY[0x263F824C0];
  [(_FCUIAddActivityControl *)self bounds];
  double v7 = objc_msgSend(v6, "bezierPathWithOvalInRect:");
  [v5 setVisiblePath:v7];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F82CC8]) initWithView:self parameters:v5];
  v9 = (void *)MEMORY[0x263F82A90];
  v10 = [MEMORY[0x263F82A78] effectWithPreview:v8];
  objc_super v11 = [v9 styleWithEffect:v10 shape:0];

  return v11;
}

- (void)_configureBackgroundMaterialViewIfNecesssary
{
  if (!self->_backgroundMaterialView)
  {
    BOOL v3 = [MEMORY[0x263F53FE8] materialViewWithRecipe:4];
    backgroundMaterialView = self->_backgroundMaterialView;
    self->_backgroundMaterialView = v3;

    id v5 = self->_backgroundMaterialView;
    [(_FCUIAddActivityControl *)self bounds];
    -[MTMaterialView setFrame:](v5, "setFrame:");
    [(_FCUIAddActivityControl *)self insertSubview:self->_backgroundMaterialView atIndex:0];
    BOOL v6 = self->_backgroundMaterialView;
    [(MTMaterialView *)v6 setAutoresizingMask:18];
  }
}

- (void)_configureGlyphImageViewIfNecessary
{
  if (!self->_glyphImageView)
  {
    id v3 = objc_alloc(MEMORY[0x263F82828]);
    id v4 = (void *)MEMORY[0x263F827E8];
    id v5 = [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F83570]];
    BOOL v6 = [v4 systemImageNamed:@"plus" withConfiguration:v5];
    double v7 = (UIImageView *)[v3 initWithImage:v6];
    glyphImageView = self->_glyphImageView;
    self->_glyphImageView = v7;

    [(UIImageView *)self->_glyphImageView setContentMode:4];
    v9 = self->_glyphImageView;
    [(_FCUIAddActivityControl *)self bounds];
    -[UIImageView setFrame:](v9, "setFrame:");
    [(_FCUIAddActivityControl *)self addSubview:self->_glyphImageView];
    [(UIImageView *)self->_glyphImageView setAutoresizingMask:18];
    id v10 = [(_FCUIAddActivityControl *)self visualStylingProviderForCategory:1];
    [v10 automaticallyUpdateView:self->_glyphImageView withStyle:0];
  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
}

@end