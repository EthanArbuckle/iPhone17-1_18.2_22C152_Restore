@interface _RPCCUIAddActivityControl
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)preferredContentSizeCategory;
- (_RPCCUIAddActivityControl)initWithAction:(id)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (void)_configureGlyphImageViewIfNecessary;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
@end

@implementation _RPCCUIAddActivityControl

- (_RPCCUIAddActivityControl)initWithAction:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_RPCCUIAddActivityControl;
  v5 = [(_RPCCUIAddActivityControl *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(_RPCCUIAddActivityControl *)v5 addAction:v4 forControlEvents:64];
    v7 = +[UIDevice currentDevice];
    v8 = (char *)[v7 userInterfaceIdiom];

    if (v8 == (unsigned char *)&dword_0 + 1)
    {
      id v9 = [objc_alloc((Class)UIPointerInteraction) initWithDelegate:v6];
      [(_RPCCUIAddActivityControl *)v6 addInteraction:v9];
    }
  }

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(_RPCCUIAddActivityControl *)self _configureGlyphImageViewIfNecessary];
  -[UIImageView sizeThatFits:](self->_glyphImageView, "sizeThatFits:", width, height);
  UIRoundToScale();
  double v7 = v6;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_RPCCUIAddActivityControl;
  [(_RPCCUIAddActivityControl *)&v3 layoutSubviews];
  [(_RPCCUIAddActivityControl *)self _configureBackgroundMaterialViewIfNecesssary];
  [(_RPCCUIAddActivityControl *)self _configureGlyphImageViewIfNecessary];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = [v4 view];
  BOOL v6 = v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || [v4 numberOfTouchesRequired] != (char *)&dword_0 + 1
    || [v4 numberOfTapsRequired] != (char *)&dword_0 + 1;

  return v6;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  return 0;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(_RPCCUIAddActivityControl *)self adjustsFontForContentSizeCategory];
  if (v3) {
    [(_RPCCUIAddActivityControl *)self setNeedsLayout];
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
  id v5 = objc_alloc_init((Class)UIPreviewParameters);
  [(_RPCCUIAddActivityControl *)self bounds];
  BOOL v6 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
  [v5 setVisiblePath:v6];

  id v7 = [objc_alloc((Class)UITargetedPreview) initWithView:self parameters:v5];
  v8 = +[UIPointerLiftEffect effectWithPreview:v7];
  id v9 = +[UIPointerStyle styleWithEffect:v8 shape:0];

  return v9;
}

- (void)_configureGlyphImageViewIfNecessary
{
  if (!self->_glyphImageView)
  {
    id v3 = objc_alloc((Class)UIImageView);
    id v4 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleBody];
    id v5 = +[UIImage systemImageNamed:@"plus" withConfiguration:v4];
    BOOL v6 = (UIImageView *)[v3 initWithImage:v5];
    glyphImageView = self->_glyphImageView;
    self->_glyphImageView = v6;

    [(UIImageView *)self->_glyphImageView setContentMode:4];
    v8 = self->_glyphImageView;
    [(_RPCCUIAddActivityControl *)self bounds];
    -[UIImageView setFrame:](v8, "setFrame:");
    [(_RPCCUIAddActivityControl *)self addSubview:self->_glyphImageView];
    [(UIImageView *)self->_glyphImageView setAutoresizingMask:18];
    id v9 = [(_RPCCUIAddActivityControl *)self visualStylingProviderForCategory:1];
    [v9 automaticallyUpdateView:self->_glyphImageView withStyle:0];

    v10 = self->_glyphImageView;
    [(UIImageView *)v10 setHidden:1];
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
}

@end