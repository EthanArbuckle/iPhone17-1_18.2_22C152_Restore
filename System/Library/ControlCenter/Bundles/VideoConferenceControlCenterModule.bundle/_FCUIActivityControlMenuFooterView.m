@interface _FCUIActivityControlMenuFooterView
+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6;
- (BOOL)_needsTextAttributesUpdate;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isHighlighted;
- (BOOL)isMenuElement;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)requiredVisualStyleCategories;
- (NSString)preferredContentSizeCategory;
- (NSString)representedObjectIdentifier;
- (UIAction)footerAction;
- (double)_continuousCornerRadius;
- (void)_configureFooterLabelIfNecessary;
- (void)_configureHightlightViewIfNecessary;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setNeedsTextAttributesUpdate;
- (void)_updateTextAttributes;
- (void)_updateTextAttributesForFooterLabel;
- (void)_updateTextAttributesIfNecessary;
- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6 observerBlock:(id)a7;
- (void)_visualStylingProvider:(id)a3 didChangeForCategory:(int64_t)a4 outgoingProvider:(id)a5;
- (void)layoutSubviews;
- (void)performAction;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setFooterAction:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation _FCUIActivityControlMenuFooterView

- (void)setFooterAction:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_footerAction, a3);
    [(_FCUIActivityControlMenuFooterView *)self _configureFooterLabelIfNecessary];
    [(UILabel *)self->_footerLabel setText:0];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(_FCUIActivityControlMenuFooterView *)self _updateTextAttributesIfNecessary];
  v4 = [(UILabel *)self->_footerLabel font];
  [v4 lineHeight];
  UISizeRoundToScale();
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  [(_FCUIActivityControlMenuFooterView *)self _updateTextAttributesIfNecessary];
  [(_FCUIActivityControlMenuFooterView *)self bounds];
  CGRectGetWidth(v14);
  v3 = [(UILabel *)self->_footerLabel font];
  [v3 lineHeight];
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  footerLabel = self->_footerLabel;

  -[UILabel setFrame:](footerLabel, "setFrame:", v5, v7, v9, v11);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (double)_continuousCornerRadius
{
  [(UIView *)self->_highlightView _continuousCornerRadius];
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  [(_FCUIActivityControlMenuFooterView *)self _configureHightlightViewIfNecessary];
  [(UIView *)self->_highlightView _setContinuousCornerRadius:a3];
  id v5 = [(UIView *)self->_highlightView layer];
  [v5 setMaskedCorners:12];
}

- (BOOL)isMenuElement
{
  return 1;
}

- (NSString)representedObjectIdentifier
{
  return (NSString *)@"footer";
}

- (BOOL)isHighlighted
{
  [(UIView *)self->_highlightView alpha];
  return v2 == 1.0;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_footerAction)
  {
    BOOL v3 = a3;
    if ([(_FCUIActivityControlMenuFooterView *)self isHighlighted] != a3)
    {
      [(_FCUIActivityControlMenuFooterView *)self _configureHightlightViewIfNecessary];
      highlightView = self->_highlightView;
      double v6 = 0.0;
      if (v3) {
        double v6 = 1.0;
      }
      [(UIView *)highlightView setAlpha:v6];
    }
  }
}

- (void)performAction
{
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    [(_FCUIActivityControlMenuFooterView *)self _setNeedsTextAttributesUpdate];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(_FCUIActivityControlMenuFooterView *)self adjustsFontForContentSizeCategory];
  if (v3) {
    [(_FCUIActivityControlMenuFooterView *)self _setNeedsTextAttributesUpdate];
  }
  return v3;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&off_6B360;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v18 = a3;
  double v6 = [(_FCUIActivityControlMenuFooterView *)self requiredVisualStyleCategories];
  double v7 = +[NSNumber numberWithInteger:a4];
  unsigned int v8 = [v6 containsObject:v7];

  if (v8)
  {
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    double v10 = +[NSNumber numberWithInteger:a4];
    double v11 = [(NSMutableDictionary *)categoriesToVisualStylingProviders objectForKey:v10];

    v12 = self->_categoriesToVisualStylingProviders;
    if (!v12)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      CGRect v14 = self->_categoriesToVisualStylingProviders;
      self->_categoriesToVisualStylingProviders = v13;

      v12 = self->_categoriesToVisualStylingProviders;
    }
    v15 = +[NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v12 setObject:v18 forKeyedSubscript:v15];

    v16 = self->_categoriesToVisualStylingProviders;
    v17 = +[NSNumber numberWithInteger:a4];
    if (v18) {
      [(NSMutableDictionary *)v16 setObject:v18 forKey:v17];
    }
    else {
      [(NSMutableDictionary *)v16 removeObjectForKey:v17];
    }

    [(_FCUIActivityControlMenuFooterView *)self _visualStylingProvider:v18 didChangeForCategory:a4 outgoingProvider:v11];
  }
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  if (a3) {
    +[UIFontDescriptor preferredFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  else {
  double v7 = +[UIFontDescriptor defaultFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  UIFontDescriptorAttributeName v16 = UIFontDescriptorTraitsAttribute;
  UIFontDescriptorTraitKey v14 = UIFontWeightTrait;
  unsigned int v8 = +[NSNumber numberWithDouble:a5];
  v15 = v8;
  double v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17 = v9;
  double v10 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  double v11 = [v7 fontDescriptorByAddingAttributes:v10];

  v12 = +[UIFont fontWithDescriptor:v11 size:0.0];

  return v12;
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6 observerBlock:(id)a7
{
  if (a3)
  {
    id v11 = a7;
    id v12 = a5;
    id v13 = a3;
    [a6 stopAutomaticallyUpdatingView:v13];
    [v12 automaticallyUpdateView:v13 withStyle:a4 andObserverBlock:v11];
  }
}

- (void)_visualStylingProvider:(id)a3 didChangeForCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  id v15 = a3;
  id v8 = a5;
  if (a4 == 2)
  {
    highlightView = (UILabel *)self->_highlightView;
    UIFontDescriptorTraitKey v14 = &stru_68F50;
    double v10 = self;
    uint64_t v11 = 1;
    id v12 = v15;
    id v13 = v8;
  }
  else
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    highlightView = self->_footerLabel;
    double v10 = self;
    uint64_t v11 = 0;
    id v12 = v15;
    id v13 = v8;
    UIFontDescriptorTraitKey v14 = 0;
  }
  [(_FCUIActivityControlMenuFooterView *)v10 _updateVisualStylingOfView:highlightView style:v11 visualStylingProvider:v12 outgoingProvider:v13 observerBlock:v14];
LABEL_6:
}

- (BOOL)_needsTextAttributesUpdate
{
  return self->_preferredContentSizeCategory == 0;
}

- (void)_setNeedsTextAttributesUpdate
{
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = 0;

  [(_FCUIActivityControlMenuFooterView *)self setNeedsLayout];
}

- (void)_updateTextAttributes
{
  BOOL v3 = [(_FCUIActivityControlMenuFooterView *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = v4;

  [(_FCUIActivityControlMenuFooterView *)self _updateTextAttributesForFooterLabel];
}

- (void)_updateTextAttributesIfNecessary
{
  if ([(_FCUIActivityControlMenuFooterView *)self _needsTextAttributesUpdate])
  {
    [(_FCUIActivityControlMenuFooterView *)self _updateTextAttributes];
  }
}

- (void)_updateTextAttributesForFooterLabel
{
  footerLabel = self->_footerLabel;
  if (footerLabel)
  {
    id v3 = [(id)objc_opt_class() _preferredFont:1 textStyle:UIFontTextStyleSubheadline weight:0 additionalTraits:UIFontWeightRegular];
    [(UILabel *)footerLabel setFont:v3];
  }
}

- (void)_configureFooterLabelIfNecessary
{
  if (!self->_footerLabel)
  {
    id v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    footerLabel = self->_footerLabel;
    self->_footerLabel = v3;

    [(UILabel *)self->_footerLabel setTextAlignment:1];
    [(UILabel *)self->_footerLabel setLineBreakMode:4];
    [(_FCUIActivityControlMenuFooterView *)self addSubview:self->_footerLabel];
    [(_FCUIActivityControlMenuFooterView *)self _updateTextAttributesForFooterLabel];
    id v5 = self->_footerLabel;
    double v6 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&off_6B288];
    [(_FCUIActivityControlMenuFooterView *)self _updateVisualStylingOfView:v5 style:0 visualStylingProvider:v6 outgoingProvider:0 observerBlock:0];

    [(_FCUIActivityControlMenuFooterView *)self setNeedsLayout];
  }
}

- (void)_configureHightlightViewIfNecessary
{
  if (!self->_highlightView)
  {
    id v3 = (UIView *)objc_alloc_init((Class)UIView);
    highlightView = self->_highlightView;
    self->_highlightView = v3;

    [(UIView *)self->_highlightView setUserInteractionEnabled:0];
    id v5 = self->_highlightView;
    [(_FCUIActivityControlMenuFooterView *)self bounds];
    -[UIView setFrame:](v5, "setFrame:");
    [(UIView *)self->_highlightView setAutoresizingMask:18];
    [(UIView *)self->_highlightView setAlpha:0.0];
    [(_FCUIActivityControlMenuFooterView *)self insertSubview:self->_highlightView atIndex:0];
    double v6 = self->_highlightView;
    id v7 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&off_6B2A0];
    [(_FCUIActivityControlMenuFooterView *)self _updateVisualStylingOfView:v6 style:1 visualStylingProvider:v7 outgoingProvider:0 observerBlock:&stru_68F90];
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

- (UIAction)footerAction
{
  return self->_footerAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerAction, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProviders, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);

  objc_storeStrong((id *)&self->_footerLabel, 0);
}

@end