@interface RPCCUIAddActivityFooterView
+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5;
- (BOOL)_needsTextAttributesUpdate;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)preferredContentSizeCategory;
- (RPCCUIAddActivityFooterView)initWithAction:(id)a3;
- (void)_configureActivityTitleLabelIfNecessaryWithTitle:(id)a3;
- (void)_configureAddActivityControlIfNecessaryWithAction:(id)a3;
- (void)_layoutSubviewsInBounds:(CGRect)a3 measuringOnly:(CGSize *)a4;
- (void)_setNeedsTextAttributesUpdate;
- (void)_updateTextAttributes;
- (void)_updateTextAttributesForTitleLabel;
- (void)_updateTextAttributesIfNecessary;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
@end

@implementation RPCCUIAddActivityFooterView

- (RPCCUIAddActivityFooterView)initWithAction:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPCCUIAddActivityFooterView;
  v5 = [(RPCCUIAddActivityFooterView *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v5->_adjustsFontForContentSizeCategory = 1;
    [(RPCCUIAddActivityFooterView *)v5 _configureAddActivityControlIfNecessaryWithAction:v4];
    v7 = [v4 title];
    [(RPCCUIAddActivityFooterView *)v6 _configureActivityTitleLabelIfNecessaryWithTitle:v7];
  }
  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(RPCCUIAddActivityFooterView *)self _updateTextAttributesIfNecessary];
  CGSize v6 = CGSizeZero;
  BSRectWithSize();
  -[RPCCUIAddActivityFooterView _layoutSubviewsInBounds:measuringOnly:](self, "_layoutSubviewsInBounds:measuringOnly:", &v6);
  double height = v6.height;
  double width = v6.width;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RPCCUIAddActivityFooterView;
  [(RPCCUIAddActivityFooterView *)&v3 layoutSubviews];
  [(RPCCUIAddActivityFooterView *)self _updateTextAttributesIfNecessary];
  [(RPCCUIAddActivityFooterView *)self bounds];
  -[RPCCUIAddActivityFooterView _layoutSubviewsInBounds:measuringOnly:](self, "_layoutSubviewsInBounds:measuringOnly:", 0);
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_BOOL adjustsFontForContentSizeCategory = a3;
    [(RPCCUIAddActivityFooterView *)self _setNeedsTextAttributesUpdate];
    addActivityControl = self->_addActivityControl;
    BOOL adjustsFontForContentSizeCategory = self->_adjustsFontForContentSizeCategory;
    [(_RPCCUIAddActivityControl *)addActivityControl setAdjustsFontForContentSizeCategory:adjustsFontForContentSizeCategory];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(RPCCUIAddActivityFooterView *)self adjustsFontForContentSizeCategory];
  if (v3)
  {
    [(RPCCUIAddActivityFooterView *)self _setNeedsTextAttributesUpdate];
    [(_RPCCUIAddActivityControl *)self->_addActivityControl adjustForContentSizeCategoryChange];
  }
  return v3;
}

- (void)_layoutSubviewsInBounds:(CGRect)a3 measuringOnly:(CGSize *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  -[_RPCCUIAddActivityControl sizeThatFits:](self->_addActivityControl, "sizeThatFits:", a3.size.width, a3.size.height);
  BSRectWithSize();
  uint64_t v25 = 0;
  UIRectCenteredXInRectScale();
  CGFloat v12 = v8;
  CGFloat v13 = v9;
  CGFloat v14 = v10;
  CGFloat v15 = v11;
  if (!a4) {
    -[_RPCCUIAddActivityControl setFrame:](self->_addActivityControl, "setFrame:", v8, v9, v10, v11, 0);
  }
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height, v25);
  v27.origin.x = v12;
  v27.origin.y = v13;
  v27.size.double width = v14;
  v27.size.double height = v15;
  CGRectGetMaxY(v27);
  UIRectCenteredXInRectScale();
  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  if (a4)
  {
    v28.origin.x = v12;
    v28.origin.y = v13;
    v28.size.double width = v14;
    v28.size.double height = v15;
    CGRect v29 = CGRectUnion(v28, *(CGRect *)&v20);
    a4->double width = v29.size.width;
    a4->double height = v29.size.height;
  }
  else
  {
    titleLabel = self->_titleLabel;
    -[UILabel setFrame:](titleLabel, "setFrame:", v16, v17, v18, v19, v16, v17, v18, v19);
  }
}

- (void)_configureAddActivityControlIfNecessaryWithAction:(id)a3
{
  if (!self->_addActivityControl)
  {
    id v4 = a3;
    v5 = [[_RPCCUIAddActivityControl alloc] initWithAction:v4];

    addActivityControl = self->_addActivityControl;
    self->_addActivityControl = v5;

    v7 = self->_addActivityControl;
    [(RPCCUIAddActivityFooterView *)self addSubview:v7];
  }
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5
{
  if (a3) {
    +[UIFontDescriptor preferredFontDescriptorWithTextStyle:a4];
  }
  else {
  CGSize v6 = +[UIFontDescriptor defaultFontDescriptorWithTextStyle:a4];
  }
  UIFontDescriptorAttributeName v15 = UIFontDescriptorTraitsAttribute;
  UIFontDescriptorTraitKey v13 = UIFontWeightTrait;
  v7 = +[NSNumber numberWithDouble:a5];
  CGFloat v14 = v7;
  double v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  double v16 = v8;
  double v9 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  double v10 = [v6 fontDescriptorByAddingAttributes:v9];

  double v11 = +[UIFont fontWithDescriptor:v10 size:0.0];

  return v11;
}

- (void)_updateTextAttributesForTitleLabel
{
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    id v4 = [(id)objc_opt_class() _preferredFont:1 textStyle:UIFontTextStyleCaption1 weight:UIFontWeightRegular];
    [(UILabel *)titleLabel setFont:v4];

    [(RPCCUIAddActivityFooterView *)self setNeedsLayout];
  }
}

- (BOOL)_needsTextAttributesUpdate
{
  return self->_preferredContentSizeCategory == 0;
}

- (void)_setNeedsTextAttributesUpdate
{
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = 0;

  [(RPCCUIAddActivityFooterView *)self setNeedsLayout];
}

- (void)_updateTextAttributes
{
  BOOL v3 = [(RPCCUIAddActivityFooterView *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = v4;

  [(RPCCUIAddActivityFooterView *)self _updateTextAttributesForTitleLabel];
}

- (void)_updateTextAttributesIfNecessary
{
  if ([(RPCCUIAddActivityFooterView *)self _needsTextAttributesUpdate])
  {
    [(RPCCUIAddActivityFooterView *)self _updateTextAttributes];
  }
}

- (void)_configureActivityTitleLabelIfNecessaryWithTitle:(id)a3
{
  if (!self->_titleLabel)
  {
    id v4 = a3;
    v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v5;

    [(UILabel *)self->_titleLabel setText:v4];
    [(UILabel *)self->_titleLabel setTextAlignment:1];
    [(UILabel *)self->_titleLabel setLineBreakMode:4];
    id v10 = [(UILabel *)self->_titleLabel layer];
    id v7 = +[UIColor blackColor];
    objc_msgSend(v10, "setShadowColor:", objc_msgSend(v7, "CGColor"));

    LODWORD(v8) = 1045220557;
    [v10 setShadowOpacity:v8];
    [v10 setShadowRadius:20.0];
    objc_msgSend(v10, "setShadowOffset:", 0.0, 2.0);
    [v10 setShadowPathIsBounds:1];
    [(RPCCUIAddActivityFooterView *)self addSubview:self->_titleLabel];
    [(RPCCUIAddActivityFooterView *)self _updateTextAttributesForTitleLabel];
    double v9 = [(_RPCCUIAddActivityControl *)self->_addActivityControl visualStylingProviderForCategory:1];
    [v9 automaticallyUpdateView:self->_titleLabel withStyle:0];
  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
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
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_addActivityControl, 0);
}

@end