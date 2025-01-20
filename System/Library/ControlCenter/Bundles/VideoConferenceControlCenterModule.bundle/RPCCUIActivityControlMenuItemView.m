@interface RPCCUIActivityControlMenuItemView
+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6;
- (BOOL)_isCheckmarkEnabled;
- (BOOL)_needsTextAttributesUpdate;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isHighlighted;
- (BOOL)isMenuElement;
- (BOOL)isSelected;
- (BOOL)isSeparatorVisible;
- (CGRect)_accessoryImageFrameForBounds:(CGRect)a3;
- (CGRect)_textFrameForBounds:(CGRect)a3 accessoryImageFrame:(CGRect)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)requiredVisualStyleCategories;
- (NSString)alternativeDescription;
- (NSString)preferredContentSizeCategory;
- (NSString)representedObjectIdentifier;
- (RPCCUIActivityControlMenuItemView)initWithFrame:(CGRect)a3;
- (UIAction)defaultAction;
- (double)_separatorHeight;
- (id)_accessoryImage;
- (id)_activationDescription;
- (id)_activationDetails;
- (id)_checkmarkImage;
- (id)_newLabel;
- (id)_newSlider;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_addViewRequiringUpdate:(id)a3;
- (void)_configureAccessoryImageViewIfNecessary;
- (void)_configureActivationDescriptionLabelIfNecessary;
- (void)_configureActivationDetailsLabelIfNecessary;
- (void)_configureAlternativeDescriptionLabelIfNecessary;
- (void)_configureBackgroundViewIfNecessary;
- (void)_configureCheckmarkImageViewIfNecessary;
- (void)_configureHighlightViewIfNecessary;
- (void)_configureSeparatorViewIfNecessary;
- (void)_configureSliderIfNecessary;
- (void)_didPerformUpdate;
- (void)_setAccessoryImage:(id)a3;
- (void)_setActivationDescription:(id)a3;
- (void)_setActivationDetails:(id)a3;
- (void)_setNeedsTextAttributesUpdate;
- (void)_setSliderAction:(id)a3;
- (void)_tearDownAccessoryImageViewIfNecessary;
- (void)_tearDownCheckmarkImageViewIfNecessary;
- (void)_tearDownSeparatorViewIfNecessary;
- (void)_updateTextAttributes;
- (void)_updateTextAttributesForActivationDescriptionLabel;
- (void)_updateTextAttributesForActivationDetailsLabel;
- (void)_updateTextAttributesForAlternativeDescriptionLabel;
- (void)_updateTextAttributesIfNecessary;
- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6;
- (void)_visualStylingProvider:(id)a3 didChangeForCategory:(int64_t)a4 outgoingProvider:(id)a5;
- (void)layoutSubviews;
- (void)performAction;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAlternativeDescription:(id)a3;
- (void)setDefaultAction:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSeparatorVisible:(BOOL)a3;
- (void)setSlider:(BOOL)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)updateItemViewWithState:(BOOL)a3;
@end

@implementation RPCCUIActivityControlMenuItemView

- (void)setDefaultAction:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend(v10, "rpccui_isEqualToAction:", self->_defaultAction) & 1) == 0)
  {
    v4 = (UIAction *)[v10 copy];
    defaultAction = self->_defaultAction;
    self->_defaultAction = v4;

    v6 = [(UIAction *)self->_defaultAction title];
    [(RPCCUIActivityControlMenuItemView *)self _setActivationDescription:v6];

    v7 = [(UIAction *)self->_defaultAction discoverabilityTitle];
    [(RPCCUIActivityControlMenuItemView *)self _setActivationDetails:v7];

    v8 = [(UIAction *)self->_defaultAction image];
    [(RPCCUIActivityControlMenuItemView *)self _setAccessoryImage:v8];

    [(RPCCUIActivityControlMenuItemView *)self _configureSliderIfNecessary];
    [(RPCCUIActivityControlMenuItemView *)self _setSliderAction:self->_defaultAction];
    [(UILabel *)self->_alternativeDescriptionLabel removeFromSuperview];
    alternativeDescriptionLabel = self->_alternativeDescriptionLabel;
    self->_alternativeDescriptionLabel = 0;
  }
}

- (NSString)alternativeDescription
{
  return [(UILabel *)self->_alternativeDescriptionLabel text];
}

- (void)setAlternativeDescription:(id)a3
{
  id v8 = a3;
  v4 = [(RPCCUIActivityControlMenuItemView *)self alternativeDescription];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(RPCCUIActivityControlMenuItemView *)self _configureAlternativeDescriptionLabelIfNecessary];
    [(RPCCUIActivityControlMenuItemView *)self _addViewRequiringUpdate:self->_alternativeDescriptionLabel];
    [(UILabel *)self->_alternativeDescriptionLabel setText:v8];
    [(UILabel *)self->_activationDescriptionLabel removeFromSuperview];
    activationDescriptionLabel = self->_activationDescriptionLabel;
    self->_activationDescriptionLabel = 0;

    [(UILabel *)self->_activationDetailsLabel removeFromSuperview];
    activationDetailsLabel = self->_activationDetailsLabel;
    self->_activationDetailsLabel = 0;

    [(RPCCUIActivityControlMenuItemView *)self setNeedsLayout];
  }
}

- (void)setSeparatorVisible:(BOOL)a3
{
  if (self->_separatorVisible != a3)
  {
    self->_separatorVisible = a3;
    if (a3) {
      [(RPCCUIActivityControlMenuItemView *)self _configureSeparatorViewIfNecessary];
    }
    else {
      [(RPCCUIActivityControlMenuItemView *)self _tearDownSeparatorViewIfNecessary];
    }
  }
}

- (RPCCUIActivityControlMenuItemView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RPCCUIActivityControlMenuItemView;
  v3 = -[RPCCUIActivityControlMenuItemView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIDevice currentDevice];
    char v5 = (char *)[v4 userInterfaceIdiom];

    if (v5 == (unsigned char *)&dword_0 + 1)
    {
      id v6 = [objc_alloc((Class)UIPointerInteraction) initWithDelegate:v3];
      [(RPCCUIActivityControlMenuItemView *)v3 addInteraction:v6];
    }
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (a3.width <= 0.0)
  {
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }
  else
  {
    v4 = [(RPCCUIActivityControlMenuItemView *)self _activationDescription];
    id v5 = [v4 length];

    [(RPCCUIActivityControlMenuItemView *)self _updateTextAttributesIfNecessary];
    BSRectWithSize();
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    if (v5)
    {
      v14 = [(UILabel *)self->_activationDescriptionLabel font];
      v15 = [(UILabel *)self->_activationDescriptionLabel text];
      unsigned int v16 = objc_msgSend(v14, "rpccui_hasExuberatedLineHeightForText:", v15);

      if (v16)
      {
        +[UIFont rpccui_exuberatedValueForValue:12.0];
        +[UIFont rpccui_exuberatedValueForValue:12.0];
      }
      -[RPCCUIActivityControlMenuItemView _accessoryImageFrameForBounds:](self, "_accessoryImageFrameForBounds:", v7, v9, v11, v13);
      -[RPCCUIActivityControlMenuItemView _textFrameForBounds:accessoryImageFrame:](self, "_textFrameForBounds:accessoryImageFrame:", v7, v9, v11, v13, v17, v18, v19, v20);
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      unint64_t v27 = -[UILabel rpccui_numberOfLinesInFrame:maximum:drawingContext:](self->_activationDescriptionLabel, "rpccui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext);
      unint64_t v28 = -[UILabel rpccui_numberOfLinesInFrame:maximum:drawingContext:](self->_activationDetailsLabel, "rpccui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext, v22, v24, v26, 1.79769313e308);
      [(UILabel *)self->_activationDescriptionLabel rpccui_measuringHeightWithNumberOfLines:v27];
      BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
      unint64_t v30 = v28 - 1;
      if (!v28) {
        unint64_t v30 = 0;
      }
      if (IsAccessibilityCategory) {
        unint64_t v31 = v28;
      }
      else {
        unint64_t v31 = v30;
      }
      [(UILabel *)self->_activationDetailsLabel rpccui_measuringHeightWithNumberOfLines:v31];
      UISizeRoundToScale();
      CGFloat width = v32;
      CGFloat height = v34;
    }
    else
    {
      v36 = [(UILabel *)self->_alternativeDescriptionLabel font];
      v37 = [(UILabel *)self->_alternativeDescriptionLabel text];
      unsigned int v38 = objc_msgSend(v36, "rpccui_hasExuberatedLineHeightForText:", v37);

      if (v38) {
        +[UIFont rpccui_exuberatedValueForValue:22.0];
      }
      v44.origin.x = v7;
      v44.origin.y = v9;
      v44.size.CGFloat width = v11;
      v44.size.CGFloat height = v13;
      CGRect v45 = CGRectInset(v44, 24.0, 0.0);
      -[UILabel rpccui_measuringHeightWithNumberOfLines:](self->_alternativeDescriptionLabel, "rpccui_measuringHeightWithNumberOfLines:", -[UILabel rpccui_numberOfLinesInFrame:maximum:drawingContext:](self->_alternativeDescriptionLabel, "rpccui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext, v45.origin.x, v45.origin.y, v45.size.width, 1.79769313e308));
      UISizeRoundToScale();
      CGFloat width = v39;
      CGFloat height = v40;
    }
  }
  double v41 = width;
  double v42 = height;
  result.CGFloat height = v42;
  result.CGFloat width = v41;
  return result;
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)RPCCUIActivityControlMenuItemView;
  [(RPCCUIActivityControlMenuItemView *)&v30 layoutSubviews];
  [(RPCCUIActivityControlMenuItemView *)self _configureBackgroundViewIfNecessary];
  [(RPCCUIActivityControlMenuItemView *)self _updateTextAttributesIfNecessary];
  [(RPCCUIActivityControlMenuItemView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[RPCCUIActivityControlMenuItemView _accessoryImageFrameForBounds:](self, "_accessoryImageFrameForBounds:");
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_24AA4;
  v29[3] = &unk_69358;
  v29[4] = self;
  v29[5] = v11;
  v29[6] = v12;
  v29[7] = v13;
  v29[8] = v14;
  +[UIView performWithoutAnimation:v29];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_24AC4;
  v28[3] = &unk_695E8;
  v28[4] = self;
  v15 = objc_retainBlock(v28);
  unsigned int v16 = [(RPCCUIActivityControlMenuItemView *)self _activationDescription];
  id v17 = [v16 length];

  if (v17)
  {
    -[RPCCUIActivityControlMenuItemView _textFrameForBounds:accessoryImageFrame:](self, "_textFrameForBounds:accessoryImageFrame:", v4, v6, v8, v10, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    CGSize size = CGRectZero.size;
    CGPoint origin = CGRectZero.origin;
    CGSize v27 = size;
    CGPoint v24 = origin;
    CGSize v25 = size;
    +[UILabel rpccui_layoutPrimaryLabel:secondaryLabel:inTextFrame:primaryLabelFrame:secondaryLabelFrame:drawingContext:](UILabel, "rpccui_layoutPrimaryLabel:secondaryLabel:inTextFrame:primaryLabelFrame:secondaryLabelFrame:drawingContext:", self->_activationDescriptionLabel, self->_activationDetailsLabel, &origin, &v24, self->_drawingContext);
    ((void (*)(void *, UILabel *, CGFloat, CGFloat, CGFloat, CGFloat))v15[2])(v15, self->_activationDescriptionLabel, origin.x, origin.y, v27.width, v27.height);
    ((void (*)(void *, UILabel *, CGFloat, CGFloat, CGFloat, CGFloat))v15[2])(v15, self->_activationDetailsLabel, v24.x, v24.y, v25.width, v25.height);
    ((void (*)(void *, UISlider *, CGFloat, CGFloat, CGFloat, CGFloat))v15[2])(v15, self->_slider, v24.x, v24.y, v25.width, v25.height);
  }
  else
  {
    v31.origin.x = v4;
    v31.origin.y = v6;
    v31.size.CGFloat width = v8;
    v31.size.CGFloat height = v10;
    CGRectInset(v31, 24.0, 0.0);
    -[UILabel rpccui_drawingHeightWithNumberOfLines:](self->_alternativeDescriptionLabel, "rpccui_drawingHeightWithNumberOfLines:", -[UILabel rpccui_numberOfLinesInFrame:maximum:drawingContext:](self->_alternativeDescriptionLabel, "rpccui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext));
    uint64_t v22 = 0;
    UIRectCenteredIntegralRectScale();
    ((void (*)(void *, UILabel *))v15[2])(v15, self->_alternativeDescriptionLabel);
  }
  [(RPCCUIActivityControlMenuItemView *)self _didPerformUpdate];
  if (self->_separatorView)
  {
    [(RPCCUIActivityControlMenuItemView *)self _separatorHeight];
    double v20 = v19;
    v32.origin.x = v4;
    v32.origin.y = v6;
    v32.size.CGFloat width = v8;
    v32.size.CGFloat height = v10;
    CGFloat v21 = CGRectGetMaxY(v32) - v20;
    v33.origin.x = v4;
    v33.origin.y = v6;
    v33.size.CGFloat width = v8;
    v33.size.CGFloat height = v10;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_24C20;
    v23[3] = &unk_69358;
    v23[4] = self;
    v23[5] = 0;
    *(CGFloat *)&v23[6] = v21;
    v23[7] = CGRectGetWidth(v33);
    *(double *)&v23[8] = v20;
    +[UIView performWithoutAnimation:v23];
  }
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

- (BOOL)isMenuElement
{
  return 1;
}

- (NSString)representedObjectIdentifier
{
  return [(UIAction *)self->_defaultAction identifier];
}

- (BOOL)isHighlighted
{
  [(UIView *)self->_highlightView alpha];
  return v2 == 1.0;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_defaultAction)
  {
    BOOL v3 = a3;
    if ([(RPCCUIActivityControlMenuItemView *)self isHighlighted] != a3)
    {
      [(RPCCUIActivityControlMenuItemView *)self _configureHighlightViewIfNecessary];
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

- (BOOL)isSelected
{
  return (char *)[(UIAction *)self->_defaultAction state] == (char *)&dword_0 + 1;
}

- (void)setSelected:(BOOL)a3
{
  if (self->_defaultAction)
  {
    BOOL v3 = a3;
    if ([(RPCCUIActivityControlMenuItemView *)self isSelected] != a3)
    {
      [(UIAction *)self->_defaultAction setState:v3];
      if ([(RPCCUIActivityControlMenuItemView *)self isSelected])
      {
        [(RPCCUIActivityControlMenuItemView *)self _configureCheckmarkImageViewIfNecessary];
      }
      else
      {
        [(RPCCUIActivityControlMenuItemView *)self _tearDownCheckmarkImageViewIfNecessary];
      }
    }
  }
}

- (void)setSlider:(BOOL)a3
{
  slider = self->_slider;
  if (slider) {
    [(UISlider *)slider setEnabled:a3];
  }
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&off_6B390;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v16 = a3;
  double v6 = [(RPCCUIActivityControlMenuItemView *)self requiredVisualStyleCategories];
  double v7 = +[NSNumber numberWithInteger:a4];
  unsigned int v8 = [v6 containsObject:v7];

  if (v8)
  {
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    double v10 = +[NSNumber numberWithInteger:a4];
    uint64_t v11 = [(NSMutableDictionary *)categoriesToVisualStylingProviders objectForKey:v10];

    if (!self->_categoriesToVisualStylingProviders)
    {
      uint64_t v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v13 = self->_categoriesToVisualStylingProviders;
      self->_categoriesToVisualStylingProviders = v12;
    }
    uint64_t v14 = self->_categoriesToVisualStylingProviders;
    v15 = +[NSNumber numberWithInteger:a4];
    if (v16) {
      [(NSMutableDictionary *)v14 setObject:v16 forKey:v15];
    }
    else {
      [(NSMutableDictionary *)v14 removeObjectForKey:v15];
    }

    [(RPCCUIActivityControlMenuItemView *)self _visualStylingProvider:v16 didChangeForCategory:a4 outgoingProvider:v11];
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    [(RPCCUIActivityControlMenuItemView *)self _setNeedsTextAttributesUpdate];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(RPCCUIActivityControlMenuItemView *)self adjustsFontForContentSizeCategory];
  if (v3) {
    [(RPCCUIActivityControlMenuItemView *)self _setNeedsTextAttributesUpdate];
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
  id v4 = [objc_alloc((Class)UITargetedPreview) initWithView:self];
  id v5 = +[UIPointerEffect effectWithPreview:v4];
  double v6 = +[UIPointerStyle styleWithEffect:v5 shape:0];

  return v6;
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
  id v17 = v9;
  double v10 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  uint64_t v11 = [v7 fontDescriptorByAddingAttributes:v10];

  uint64_t v12 = +[UIFont fontWithDescriptor:v11 size:0.0];

  return v12;
}

- (id)_activationDescription
{
  return [(UILabel *)self->_activationDescriptionLabel text];
}

- (void)_setActivationDescription:(id)a3
{
  id v6 = a3;
  id v4 = [(RPCCUIActivityControlMenuItemView *)self _activationDescription];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(RPCCUIActivityControlMenuItemView *)self _configureActivationDescriptionLabelIfNecessary];
    [(RPCCUIActivityControlMenuItemView *)self _addViewRequiringUpdate:self->_activationDescriptionLabel];
    [(UILabel *)self->_activationDescriptionLabel setText:v6];
    [(RPCCUIActivityControlMenuItemView *)self setNeedsLayout];
  }
}

- (id)_activationDetails
{
  return [(UILabel *)self->_activationDetailsLabel text];
}

- (void)_setActivationDetails:(id)a3
{
  id v6 = a3;
  id v4 = [(RPCCUIActivityControlMenuItemView *)self _activationDetails];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(RPCCUIActivityControlMenuItemView *)self _configureActivationDetailsLabelIfNecessary];
    [(RPCCUIActivityControlMenuItemView *)self _addViewRequiringUpdate:self->_activationDetailsLabel];
    [(UILabel *)self->_activationDetailsLabel setText:v6];
    [(RPCCUIActivityControlMenuItemView *)self setNeedsLayout];
  }
}

- (id)_accessoryImage
{
  return [(UIImageView *)self->_accessoryImageView image];
}

- (void)_setAccessoryImage:(id)a3
{
  id v6 = a3;
  id v4 = [(RPCCUIActivityControlMenuItemView *)self _accessoryImage];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    if (v6)
    {
      [(RPCCUIActivityControlMenuItemView *)self _configureAccessoryImageViewIfNecessary];
      [(UIImageView *)self->_accessoryImageView setImage:v6];
    }
    [(RPCCUIActivityControlMenuItemView *)self setNeedsLayout];
  }
}

- (double)_separatorHeight
{
  double v2 = [(RPCCUIActivityControlMenuItemView *)self traitCollection];
  BOOL v3 = [v2 preferredContentSizeCategory];
  double v4 = 1.0;
  if (!UIContentSizeCategoryIsAccessibilityCategory(v3))
  {
    char v5 = +[UIScreen mainScreen];
    [v5 scale];
    double v4 = v6;
  }
  return 1.0 / v4;
}

- (BOOL)_needsTextAttributesUpdate
{
  return self->_preferredContentSizeCategory == 0;
}

- (void)_setNeedsTextAttributesUpdate
{
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = 0;

  [(RPCCUIActivityControlMenuItemView *)self setNeedsLayout];
}

- (void)_updateTextAttributes
{
  BOOL v3 = [(RPCCUIActivityControlMenuItemView *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = v4;

  [(RPCCUIActivityControlMenuItemView *)self _updateTextAttributesForActivationDescriptionLabel];
  [(RPCCUIActivityControlMenuItemView *)self _updateTextAttributesForActivationDetailsLabel];

  [(RPCCUIActivityControlMenuItemView *)self _updateTextAttributesForAlternativeDescriptionLabel];
}

- (void)_updateTextAttributesIfNecessary
{
  if ([(RPCCUIActivityControlMenuItemView *)self _needsTextAttributesUpdate])
  {
    [(RPCCUIActivityControlMenuItemView *)self _updateTextAttributes];
  }
}

- (void)_updateTextAttributesForActivationDescriptionLabel
{
  activationDescriptionLabel = self->_activationDescriptionLabel;
  if (activationDescriptionLabel)
  {
    id v3 = [(id)objc_opt_class() _preferredFont:1 textStyle:UIFontTextStyleBody weight:0x8000 additionalTraits:UIFontWeightRegular];
    [(UILabel *)activationDescriptionLabel setFont:v3];
  }
}

- (void)_updateTextAttributesForActivationDetailsLabel
{
  activationDetailsLabel = self->_activationDetailsLabel;
  if (activationDetailsLabel)
  {
    id v3 = [(id)objc_opt_class() _preferredFont:1 textStyle:UIFontTextStyleSubheadline weight:0x8000 additionalTraits:UIFontWeightSemibold];
    [(UILabel *)activationDetailsLabel setFont:v3];
  }
}

- (void)_updateTextAttributesForAlternativeDescriptionLabel
{
  alternativeDescriptionLabel = self->_alternativeDescriptionLabel;
  if (alternativeDescriptionLabel)
  {
    id v3 = [(id)objc_opt_class() _preferredFont:1 textStyle:UIFontTextStyleFootnote weight:0x8000 additionalTraits:UIFontWeightRegular];
    [(UILabel *)alternativeDescriptionLabel setFont:v3];
  }
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  if (a3)
  {
    id v9 = a5;
    id v10 = a3;
    [a6 stopAutomaticallyUpdatingView:v10];
    [v9 automaticallyUpdateView:v10 withStyle:a4];
  }
}

- (void)_visualStylingProvider:(id)a3 didChangeForCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  if (a4 == 2)
  {
    backgroundView = self->_backgroundView;
    uint64_t v12 = [v13 _visualStylingForStyleNamed:@"moduleListTint"];
    [(UIView *)backgroundView mt_replaceVisualStyling:v12];

    id v10 = &OBJC_IVAR___RPCCUIActivityControlMenuItemView__highlightView;
    uint64_t v9 = 1;
  }
  else
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    [(RPCCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:self->_activationDescriptionLabel style:0 visualStylingProvider:v13 outgoingProvider:v8];
    [(RPCCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:self->_activationDetailsLabel style:1 visualStylingProvider:v13 outgoingProvider:v8];
    [(RPCCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:self->_alternativeDescriptionLabel style:1 visualStylingProvider:v13 outgoingProvider:v8];
    uint64_t v9 = 0;
    id v10 = &OBJC_IVAR___RPCCUIActivityControlMenuItemView__accessoryImageView;
  }
  [(RPCCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:*(Class *)((char *)&self->super.super.super.isa + *v10) style:v9 visualStylingProvider:v13 outgoingProvider:v8];
LABEL_6:
}

- (void)_configureBackgroundViewIfNecessary
{
  if (!self->_backgroundView)
  {
    id v3 = objc_alloc((Class)UIView);
    [(RPCCUIActivityControlMenuItemView *)self bounds];
    double v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    backgroundView = self->_backgroundView;
    self->_backgroundView = v4;

    [(UIView *)self->_backgroundView setUserInteractionEnabled:0];
    [(UIView *)self->_backgroundView setAutoresizingMask:18];
    [(RPCCUIActivityControlMenuItemView *)self insertSubview:self->_backgroundView atIndex:0];
    double v6 = self->_backgroundView;
    id v8 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&off_6B2E8];
    double v7 = [v8 _visualStylingForStyleNamed:@"moduleListTint"];
    [(UIView *)v6 mt_replaceVisualStyling:v7];
  }
}

- (id)_newLabel
{
  id v2 = objc_alloc_init((Class)UILabel);
  [v2 _setTextAlignmentFollowsWritingDirection:1];
  [v2 setNumberOfLines:0];
  return v2;
}

- (id)_newSlider
{
  id v2 = objc_alloc_init((Class)UISlider);
  [v2 setMinimumValue:0.0];
  LODWORD(v3) = 1.0;
  [v2 setMaximumValue:v3];
  LODWORD(v4) = 0.5;
  [v2 setValue:v4];
  return v2;
}

- (void)_addViewRequiringUpdate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    viewsRequiringUpdate = self->_viewsRequiringUpdate;
    id v9 = v5;
    if (!viewsRequiringUpdate)
    {
      double v7 = +[NSHashTable weakObjectsHashTable];
      id v8 = self->_viewsRequiringUpdate;
      self->_viewsRequiringUpdate = v7;

      viewsRequiringUpdate = self->_viewsRequiringUpdate;
    }
    id v4 = [(NSHashTable *)viewsRequiringUpdate addObject:v9];
    id v5 = v9;
  }

  _objc_release_x1(v4, v5);
}

- (void)_didPerformUpdate
{
  self->_viewsRequiringUpdate = 0;
  _objc_release_x1();
}

- (void)_configureActivationDescriptionLabelIfNecessary
{
  if (!self->_activationDescriptionLabel)
  {
    double v3 = [(RPCCUIActivityControlMenuItemView *)self _newLabel];
    activationDescriptionLabel = self->_activationDescriptionLabel;
    self->_activationDescriptionLabel = v3;

    [(RPCCUIActivityControlMenuItemView *)self addSubview:self->_activationDescriptionLabel];
    [(RPCCUIActivityControlMenuItemView *)self _updateTextAttributesForActivationDescriptionLabel];
    id v5 = self->_activationDescriptionLabel;
    id v6 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&off_6B2D0];
    [(RPCCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:v5 style:0 visualStylingProvider:v6 outgoingProvider:0];
  }
}

- (void)_configureActivationDetailsLabelIfNecessary
{
  if (!self->_activationDetailsLabel)
  {
    double v3 = [(RPCCUIActivityControlMenuItemView *)self _newLabel];
    activationDetailsLabel = self->_activationDetailsLabel;
    self->_activationDetailsLabel = v3;

    [(RPCCUIActivityControlMenuItemView *)self addSubview:self->_activationDetailsLabel];
    [(RPCCUIActivityControlMenuItemView *)self _updateTextAttributesForActivationDetailsLabel];
    id v5 = self->_activationDetailsLabel;
    id v6 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&off_6B2D0];
    [(RPCCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:v5 style:1 visualStylingProvider:v6 outgoingProvider:0];
  }
}

- (void)_configureSliderIfNecessary
{
  if (!self->_slider)
  {
    double v3 = [(RPCCUIActivityControlMenuItemView *)self _newSlider];
    slider = self->_slider;
    self->_slider = v3;

    minImageOn = self->_minImageOn;
    self->_minImageOn = 0;

    minImageOff = self->_minImageOff;
    self->_minImageOff = 0;

    maxImageOn = self->_maxImageOn;
    self->_maxImageOn = 0;

    maxImageOff = self->_maxImageOff;
    self->_maxImageOff = 0;

    [(RPCCUIActivityControlMenuItemView *)self addSubview:self->_slider];
    id v9 = self->_slider;
    id v10 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&off_6B2E8];
    [(RPCCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:v9 style:0 visualStylingProvider:v10 outgoingProvider:0];
  }
}

- (void)_setSliderAction:(id)a3
{
  [(UISlider *)self->_slider addAction:a3 forControlEvents:4096];
  id v4 = [(UIAction *)self->_defaultAction title];
  unsigned int v5 = [v4 isEqualToString:@"Intensity"];

  if (v5)
  {
    minImageOn = self->_minImageOn;
    self->_minImageOn = 0;

    minImageOff = self->_minImageOff;
    self->_minImageOff = 0;

    id v8 = +[UIColor systemBlackColor];
    id v9 = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v8];
    CFStringRef v10 = @"camera.lightcontrol";
    uint64_t v11 = +[UIImage systemImageNamed:@"camera.lightcontrol" withConfiguration:v9];
    maxImageOn = self->_maxImageOn;
    self->_maxImageOn = v11;
  }
  else
  {
    id v13 = [(UIAction *)self->_defaultAction title];
    int v14 = [v13 isEqualToString:@"Depth"];

    if ((v14 & 1) == 0) {
      goto LABEL_6;
    }
    v15 = self->_minImageOn;
    self->_minImageOn = 0;

    UIFontDescriptorAttributeName v16 = self->_minImageOff;
    self->_minImageOff = 0;

    id v17 = +[UIColor systemBlackColor];
    double v18 = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v17];
    CFStringRef v10 = @"f.cursive";
    double v19 = +[UIImage systemImageNamed:@"f.cursive" withConfiguration:v18];
    double v20 = self->_maxImageOn;
    self->_maxImageOn = v19;
  }
  CGFloat v21 = +[UIColor systemWhiteColor];
  uint64_t v22 = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v21];
  double v23 = +[UIImage systemImageNamed:v10 withConfiguration:v22];
  maxImageOff = self->_maxImageOff;
  self->_maxImageOff = v23;

LABEL_6:
  [(UISlider *)self->_slider setMinimumValueImage:self->_minImageOff];
  CGSize v25 = self->_maxImageOff;
  slider = self->_slider;

  [(UISlider *)slider setMaximumValueImage:v25];
}

- (void)_configureAlternativeDescriptionLabelIfNecessary
{
  if (!self->_alternativeDescriptionLabel)
  {
    double v3 = [(RPCCUIActivityControlMenuItemView *)self _newLabel];
    alternativeDescriptionLabel = self->_alternativeDescriptionLabel;
    self->_alternativeDescriptionLabel = v3;

    [(UILabel *)self->_alternativeDescriptionLabel setTextAlignment:1];
    [(RPCCUIActivityControlMenuItemView *)self addSubview:self->_alternativeDescriptionLabel];
    [(RPCCUIActivityControlMenuItemView *)self _updateTextAttributesForAlternativeDescriptionLabel];
    unsigned int v5 = self->_alternativeDescriptionLabel;
    id v6 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&off_6B2D0];
    [(RPCCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:v5 style:1 visualStylingProvider:v6 outgoingProvider:0];
  }
}

- (void)_configureAccessoryImageViewIfNecessary
{
  if (!self->_accessoryImageView)
  {
    double v3 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    accessoryImageView = self->_accessoryImageView;
    self->_accessoryImageView = v3;

    [(RPCCUIActivityControlMenuItemView *)self addSubview:self->_accessoryImageView];
    unsigned int v5 = self->_accessoryImageView;
    id v6 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&off_6B2D0];
    [(RPCCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:v5 style:0 visualStylingProvider:v6 outgoingProvider:0];
  }
}

- (BOOL)_isCheckmarkEnabled
{
  return 0;
}

- (id)_checkmarkImage
{
  if ([(RPCCUIActivityControlMenuItemView *)self _isCheckmarkEnabled]
    && ([(RPCCUIActivityControlMenuItemView *)self _accessoryImage],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = (void *)v3;
    unsigned int v5 = [(RPCCUIActivityControlMenuItemView *)self _accessoryImage];
  }
  else
  {
    unsigned int v5 = +[UIImage systemImageNamed:@"checkmark"];
  }

  return v5;
}

- (void)_configureCheckmarkImageViewIfNecessary
{
  if ([(RPCCUIActivityControlMenuItemView *)self _isCheckmarkEnabled])
  {
    [(RPCCUIActivityControlMenuItemView *)self _configureAccessoryImageViewIfNecessary];
    accessoryImageView = self->_accessoryImageView;
    id v4 = [(RPCCUIActivityControlMenuItemView *)self _checkmarkImage];
    [(UIImageView *)accessoryImageView setImage:v4];
  }
}

- (void)_tearDownAccessoryImageViewIfNecessary
{
  accessoryImageView = self->_accessoryImageView;
  if (accessoryImageView)
  {
    id v4 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&off_6B2D0];
    [(RPCCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:accessoryImageView style:0 visualStylingProvider:0 outgoingProvider:v4];

    [(UIImageView *)self->_accessoryImageView removeFromSuperview];
    unsigned int v5 = self->_accessoryImageView;
    self->_accessoryImageView = 0;
  }
}

- (void)_tearDownCheckmarkImageViewIfNecessary
{
  if ([(RPCCUIActivityControlMenuItemView *)self _isCheckmarkEnabled])
  {
    [(RPCCUIActivityControlMenuItemView *)self _tearDownAccessoryImageViewIfNecessary];
  }
}

- (void)_configureSeparatorViewIfNecessary
{
  if (!self->_separatorView)
  {
    uint64_t v3 = (UIView *)objc_alloc_init((Class)UIView);
    separatorView = self->_separatorView;
    self->_separatorView = v3;

    [(RPCCUIActivityControlMenuItemView *)self addSubview:self->_separatorView];
    unsigned int v5 = self->_separatorView;
    id v6 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&off_6B2D0];
    [(RPCCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:v5 style:5 visualStylingProvider:v6 outgoingProvider:0];
  }
}

- (void)_tearDownSeparatorViewIfNecessary
{
  separatorView = self->_separatorView;
  if (separatorView)
  {
    id v4 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&off_6B2D0];
    [(RPCCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:separatorView style:5 visualStylingProvider:0 outgoingProvider:v4];

    [(UIView *)self->_separatorView removeFromSuperview];
    unsigned int v5 = self->_separatorView;
    self->_separatorView = 0;
  }
}

- (void)_configureHighlightViewIfNecessary
{
  if (!self->_highlightView)
  {
    uint64_t v3 = (UIView *)objc_alloc_init((Class)UIView);
    highlightView = self->_highlightView;
    self->_highlightView = v3;

    [(UIView *)self->_highlightView setUserInteractionEnabled:0];
    unsigned int v5 = self->_highlightView;
    [(RPCCUIActivityControlMenuItemView *)self bounds];
    -[UIView setFrame:](v5, "setFrame:");
    [(UIView *)self->_highlightView setAutoresizingMask:18];
    [(RPCCUIActivityControlMenuItemView *)self _configureBackgroundViewIfNecessary];
    [(RPCCUIActivityControlMenuItemView *)self insertSubview:self->_highlightView aboveSubview:self->_backgroundView];
    id v6 = self->_highlightView;
    id v7 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&off_6B2E8];
    [(RPCCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:v6 style:1 visualStylingProvider:v7 outgoingProvider:0];
  }
}

- (CGRect)_accessoryImageFrameForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  BSRectWithSize();
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  if (([(RPCCUIActivityControlMenuItemView *)self _shouldReverseLayoutDirection] & 1) == 0)
  {
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    CGRectGetWidth(v32);
    v33.origin.CGFloat x = v9;
    v33.origin.CGFloat y = v11;
    v33.size.CGFloat width = v13;
    v33.size.CGFloat height = v15;
    CGRectGetWidth(v33);
  }
  UIRectCenteredYInRect();
  UIFontDescriptorAttributeName v16 = [(RPCCUIActivityControlMenuItemView *)self _accessoryImage];
  id v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [(RPCCUIActivityControlMenuItemView *)self _checkmarkImage];
  }
  double v19 = v18;

  [v19 size];
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  double v28 = v21;
  double v29 = v23;
  double v30 = v25;
  double v31 = v27;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

- (CGRect)_textFrameForBounds:(CGRect)a3 accessoryImageFrame:(CGRect)a4
{
  CGFloat rect = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat height = a3.size.height;
  CGFloat v8 = a3.size.width;
  CGFloat v9 = a3.origin.y;
  CGFloat v10 = a3.origin.x;
  unsigned int v11 = [(RPCCUIActivityControlMenuItemView *)self _shouldReverseLayoutDirection];
  v26.origin.CGFloat x = v10;
  v26.origin.CGFloat y = v9;
  v26.size.CGFloat width = v8;
  v26.size.CGFloat height = height;
  CGRectGetWidth(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = rect;
  CGRectGetWidth(v27);
  v28.origin.CGFloat x = v10;
  v28.origin.CGFloat y = v9;
  v28.size.CGFloat width = v8;
  v28.size.CGFloat height = height;
  CGRectGetHeight(v28);
  BSRectWithSize();
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  double v20 = 25.0;
  if (v11)
  {
    v29.origin.CGFloat x = v10;
    v29.origin.CGFloat y = v9;
    v29.size.CGFloat width = v8;
    v29.size.CGFloat height = height;
    CGFloat v21 = CGRectGetWidth(v29) + -25.0;
    v30.origin.CGFloat x = v13;
    v30.origin.CGFloat y = v15;
    v30.size.CGFloat width = v17;
    v30.size.CGFloat height = v19;
    double v20 = v21 - CGRectGetWidth(v30);
  }
  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v20;
  return result;
}

- (void)updateItemViewWithState:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEBUG)) {
    sub_4B040((uint64_t)self, v3, v5);
  }
  if (v3)
  {
    id v6 = +[UIColor systemBlackColor];
    id v7 = &OBJC_IVAR___RPCCUIActivityControlMenuItemView__maxImageOn;
    CGFloat v8 = &OBJC_IVAR___RPCCUIActivityControlMenuItemView__minImageOn;
  }
  else
  {
    id v6 = +[UIColor systemWhiteColor];
    id v7 = &OBJC_IVAR___RPCCUIActivityControlMenuItemView__maxImageOff;
    CGFloat v8 = &OBJC_IVAR___RPCCUIActivityControlMenuItemView__minImageOff;
  }
  [(UILabel *)self->_activationDescriptionLabel setTextColor:v6];

  [(UISlider *)self->_slider setMinimumValueImage:*(Class *)((char *)&self->super.super.super.isa + *v8)];
  [(UISlider *)self->_slider setMaximumValueImage:*(Class *)((char *)&self->super.super.super.isa + *v7)];
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

- (UIAction)defaultAction
{
  return self->_defaultAction;
}

- (BOOL)isSeparatorVisible
{
  return self->_separatorVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_maxImageOff, 0);
  objc_storeStrong((id *)&self->_minImageOff, 0);
  objc_storeStrong((id *)&self->_maxImageOn, 0);
  objc_storeStrong((id *)&self->_minImageOn, 0);
  objc_storeStrong((id *)&self->_drawingContext, 0);
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProviders, 0);
  objc_storeStrong((id *)&self->_accessoryImageView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_viewsRequiringUpdate, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_alternativeDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_activationDetailsLabel, 0);
  objc_storeStrong((id *)&self->_activationDescriptionLabel, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end