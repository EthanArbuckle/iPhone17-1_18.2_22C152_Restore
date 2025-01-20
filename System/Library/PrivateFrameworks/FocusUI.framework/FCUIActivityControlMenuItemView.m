@interface FCUIActivityControlMenuItemView
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
- (FCUIActivityControlMenuItemView)initWithFrame:(CGRect)a3;
- (NSArray)requiredVisualStyleCategories;
- (NSString)alternativeDescription;
- (NSString)preferredContentSizeCategory;
- (NSString)representedObjectIdentifier;
- (UIAction)defaultAction;
- (double)_separatorHeight;
- (id)_accessoryImage;
- (id)_activationDescription;
- (id)_activationDetails;
- (id)_checkmarkImage;
- (id)_newLabel;
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
- (void)_didPerformUpdate;
- (void)_setAccessoryImage:(id)a3;
- (void)_setActivationDescription:(id)a3;
- (void)_setActivationDetails:(id)a3;
- (void)_setNeedsTextAttributesUpdate;
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
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation FCUIActivityControlMenuItemView

- (void)setDefaultAction:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend(v10, "fcui_isEqualToAction:", self->_defaultAction) & 1) == 0)
  {
    v4 = (UIAction *)[v10 copy];
    defaultAction = self->_defaultAction;
    self->_defaultAction = v4;

    v6 = [(UIAction *)self->_defaultAction title];
    [(FCUIActivityControlMenuItemView *)self _setActivationDescription:v6];

    v7 = [(UIAction *)self->_defaultAction discoverabilityTitle];
    [(FCUIActivityControlMenuItemView *)self _setActivationDetails:v7];

    v8 = [(UIAction *)self->_defaultAction image];
    [(FCUIActivityControlMenuItemView *)self _setAccessoryImage:v8];

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
  v4 = [(FCUIActivityControlMenuItemView *)self alternativeDescription];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(FCUIActivityControlMenuItemView *)self _configureAlternativeDescriptionLabelIfNecessary];
    [(FCUIActivityControlMenuItemView *)self _addViewRequiringUpdate:self->_alternativeDescriptionLabel];
    [(UILabel *)self->_alternativeDescriptionLabel setText:v8];
    [(UILabel *)self->_activationDescriptionLabel removeFromSuperview];
    activationDescriptionLabel = self->_activationDescriptionLabel;
    self->_activationDescriptionLabel = 0;

    [(UILabel *)self->_activationDetailsLabel removeFromSuperview];
    activationDetailsLabel = self->_activationDetailsLabel;
    self->_activationDetailsLabel = 0;

    [(FCUIActivityControlMenuItemView *)self setNeedsLayout];
  }
}

- (void)setSeparatorVisible:(BOOL)a3
{
  if (self->_separatorVisible != a3)
  {
    self->_separatorVisible = a3;
    if (a3) {
      [(FCUIActivityControlMenuItemView *)self _configureSeparatorViewIfNecessary];
    }
    else {
      [(FCUIActivityControlMenuItemView *)self _tearDownSeparatorViewIfNecessary];
    }
  }
}

- (FCUIActivityControlMenuItemView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FCUIActivityControlMenuItemView;
  v3 = -[FCUIActivityControlMenuItemView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 == 1)
    {
      v6 = (void *)[objc_alloc(MEMORY[0x263F82A70]) initWithDelegate:v3];
      [(FCUIActivityControlMenuItemView *)v3 addInteraction:v6];
    }
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (a3.width <= 0.0)
  {
    double v33 = *MEMORY[0x263F001B0];
    double v35 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  else
  {
    v4 = [(FCUIActivityControlMenuItemView *)self _activationDescription];
    uint64_t v5 = [v4 length];

    [(FCUIActivityControlMenuItemView *)self _updateTextAttributesIfNecessary];
    BSRectWithSize();
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    if (v5)
    {
      v14 = [(UILabel *)self->_activationDescriptionLabel font];
      v15 = [(UILabel *)self->_activationDescriptionLabel text];
      int v16 = objc_msgSend(v14, "fcui_hasExuberatedLineHeightForText:", v15);

      if (v16)
      {
        objc_msgSend(MEMORY[0x263F81708], "fcui_exuberatedValueForValue:", 12.0);
        objc_msgSend(MEMORY[0x263F81708], "fcui_exuberatedValueForValue:", 12.0);
      }
      -[FCUIActivityControlMenuItemView _accessoryImageFrameForBounds:](self, "_accessoryImageFrameForBounds:", v7, v9, v11, v13);
      -[FCUIActivityControlMenuItemView _textFrameForBounds:accessoryImageFrame:](self, "_textFrameForBounds:accessoryImageFrame:", v7, v9, v11, v13, v17, v18, v19, v20);
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      unint64_t v27 = -[UILabel fcui_numberOfLinesInFrame:maximum:drawingContext:](self->_activationDescriptionLabel, "fcui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext);
      unint64_t v28 = -[UILabel fcui_numberOfLinesInFrame:maximum:drawingContext:](self->_activationDetailsLabel, "fcui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext, v22, v24, v26, 1.79769313e308);
      [(UILabel *)self->_activationDescriptionLabel fcui_measuringHeightWithNumberOfLines:v27];
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
      [(UILabel *)self->_activationDetailsLabel fcui_measuringHeightWithNumberOfLines:v31];
      UISizeRoundToScale();
      double v33 = v32;
      double v35 = v34;
    }
    else
    {
      v36 = [(UILabel *)self->_alternativeDescriptionLabel font];
      v37 = [(UILabel *)self->_alternativeDescriptionLabel text];
      int v38 = objc_msgSend(v36, "fcui_hasExuberatedLineHeightForText:", v37);

      if (v38) {
        objc_msgSend(MEMORY[0x263F81708], "fcui_exuberatedValueForValue:", 22.0);
      }
      v44.origin.x = v7;
      v44.origin.y = v9;
      v44.size.width = v11;
      v44.size.height = v13;
      CGRect v45 = CGRectInset(v44, 24.0, 0.0);
      -[UILabel fcui_measuringHeightWithNumberOfLines:](self->_alternativeDescriptionLabel, "fcui_measuringHeightWithNumberOfLines:", -[UILabel fcui_numberOfLinesInFrame:maximum:drawingContext:](self->_alternativeDescriptionLabel, "fcui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext, v45.origin.x, v45.origin.y, v45.size.width, 1.79769313e308));
      UISizeRoundToScale();
      double v33 = v39;
      double v35 = v40;
    }
  }
  double v41 = v33;
  double v42 = v35;
  result.height = v42;
  result.width = v41;
  return result;
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)FCUIActivityControlMenuItemView;
  [(FCUIActivityControlMenuItemView *)&v36 layoutSubviews];
  [(FCUIActivityControlMenuItemView *)self _configureBackgroundViewIfNecessary];
  [(FCUIActivityControlMenuItemView *)self _updateTextAttributesIfNecessary];
  [(FCUIActivityControlMenuItemView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v28 = v9;
  -[FCUIActivityControlMenuItemView _accessoryImageFrameForBounds:](self, "_accessoryImageFrameForBounds:");
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __49__FCUIActivityControlMenuItemView_layoutSubviews__block_invoke;
  v35[3] = &unk_264542E38;
  v35[4] = self;
  *(double *)&v35[5] = v10;
  *(double *)&v35[6] = v12;
  *(double *)&v35[7] = v14;
  *(double *)&v35[8] = v16;
  [MEMORY[0x263F82E00] performWithoutAnimation:v35];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__FCUIActivityControlMenuItemView_layoutSubviews__block_invoke_2;
  aBlock[3] = &unk_2645430B0;
  aBlock[4] = self;
  double v18 = (void (**)(void *, UILabel *, double, double, double, double))_Block_copy(aBlock);
  double v19 = [(FCUIActivityControlMenuItemView *)self _activationDescription];
  uint64_t v20 = [v19 length];

  if (v20)
  {
    CGFloat v21 = v28;
    -[FCUIActivityControlMenuItemView _textFrameForBounds:accessoryImageFrame:](self, "_textFrameForBounds:accessoryImageFrame:", v4, v6, v8, v28, v11, v13, v15, v17);
    long long v22 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    long long v32 = *MEMORY[0x263F001A8];
    long long v33 = v22;
    long long v30 = v32;
    long long v31 = v22;
    objc_msgSend(MEMORY[0x263F828E0], "fcui_layoutPrimaryLabel:secondaryLabel:inTextFrame:primaryLabelFrame:secondaryLabelFrame:drawingContext:", self->_activationDescriptionLabel, self->_activationDetailsLabel, &v32, &v30, self->_drawingContext);
    v18[2](v18, self->_activationDescriptionLabel, *(double *)&v32, *((double *)&v32 + 1), *(double *)&v33, *((double *)&v33 + 1));
    v18[2](v18, self->_activationDetailsLabel, *(double *)&v30, *((double *)&v30 + 1), *(double *)&v31, *((double *)&v31 + 1));
  }
  else
  {
    v37.origin.x = v4;
    v37.origin.y = v6;
    v37.size.width = v8;
    CGFloat v21 = v28;
    v37.size.height = v28;
    CGRectInset(v37, 24.0, 0.0);
    -[UILabel fcui_drawingHeightWithNumberOfLines:](self->_alternativeDescriptionLabel, "fcui_drawingHeightWithNumberOfLines:", -[UILabel fcui_numberOfLinesInFrame:maximum:drawingContext:](self->_alternativeDescriptionLabel, "fcui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext));
    uint64_t v27 = 0;
    UIRectCenteredIntegralRectScale();
    ((void (*)(void (**)(void *, UILabel *, double, double, double, double), UILabel *))v18[2])(v18, self->_alternativeDescriptionLabel);
  }
  [(FCUIActivityControlMenuItemView *)self _didPerformUpdate];
  if (self->_separatorView)
  {
    [(FCUIActivityControlMenuItemView *)self _separatorHeight];
    double v24 = v23;
    v38.origin.x = v4;
    v38.origin.y = v6;
    v38.size.width = v8;
    v38.size.height = v21;
    CGFloat v25 = CGRectGetMaxY(v38) - v24;
    v39.origin.x = v4;
    v39.origin.y = v6;
    v39.size.width = v8;
    v39.size.height = v21;
    CGFloat Width = CGRectGetWidth(v39);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __49__FCUIActivityControlMenuItemView_layoutSubviews__block_invoke_4;
    v29[3] = &unk_264542E38;
    v29[4] = self;
    v29[5] = 0;
    *(CGFloat *)&v29[6] = v25;
    *(CGFloat *)&v29[7] = Width;
    *(double *)&v29[8] = v24;
    [MEMORY[0x263F82E00] performWithoutAnimation:v29];
  }
}

uint64_t __49__FCUIActivityControlMenuItemView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 464), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __49__FCUIActivityControlMenuItemView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 440) containsObject:v11])
  {
    double v12 = (void *)MEMORY[0x263F82E00];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __49__FCUIActivityControlMenuItemView_layoutSubviews__block_invoke_3;
    v14[3] = &unk_264542E38;
    id v13 = v11;
    id v15 = v13;
    double v16 = a3;
    double v17 = a4;
    double v18 = a5;
    double v19 = a6;
    [v12 performWithoutAnimation:v14];
    [v13 setAlpha:1.0];
  }
  else
  {
    objc_msgSend(v11, "setFrame:", a3, a4, a5, a6);
  }
}

uint64_t __49__FCUIActivityControlMenuItemView_layoutSubviews__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  return [v2 setAlpha:0.0];
}

uint64_t __49__FCUIActivityControlMenuItemView_layoutSubviews__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 456), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
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
    if ([(FCUIActivityControlMenuItemView *)self isHighlighted] != a3)
    {
      [(FCUIActivityControlMenuItemView *)self _configureHighlightViewIfNecessary];
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
  return [(UIAction *)self->_defaultAction state] == UIMenuElementStateOn;
}

- (void)setSelected:(BOOL)a3
{
  if (self->_defaultAction)
  {
    BOOL v3 = a3;
    if ([(FCUIActivityControlMenuItemView *)self isSelected] != a3)
    {
      [(UIAction *)self->_defaultAction setState:v3];
      if ([(FCUIActivityControlMenuItemView *)self isSelected])
      {
        [(FCUIActivityControlMenuItemView *)self _configureCheckmarkImageViewIfNecessary];
      }
      else
      {
        [(FCUIActivityControlMenuItemView *)self _tearDownCheckmarkImageViewIfNecessary];
      }
    }
  }
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_26D1C0320;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v16 = a3;
  double v6 = [(FCUIActivityControlMenuItemView *)self requiredVisualStyleCategories];
  double v7 = [NSNumber numberWithInteger:a4];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    double v10 = [NSNumber numberWithInteger:a4];
    id v11 = [(NSMutableDictionary *)categoriesToVisualStylingProviders objectForKey:v10];

    if (!self->_categoriesToVisualStylingProviders)
    {
      double v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v13 = self->_categoriesToVisualStylingProviders;
      self->_categoriesToVisualStylingProviders = v12;
    }
    double v14 = self->_categoriesToVisualStylingProviders;
    id v15 = [NSNumber numberWithInteger:a4];
    if (v16) {
      [(NSMutableDictionary *)v14 setObject:v16 forKey:v15];
    }
    else {
      [(NSMutableDictionary *)v14 removeObjectForKey:v15];
    }

    [(FCUIActivityControlMenuItemView *)self _visualStylingProvider:v16 didChangeForCategory:a4 outgoingProvider:v11];
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    [(FCUIActivityControlMenuItemView *)self _setNeedsTextAttributesUpdate];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(FCUIActivityControlMenuItemView *)self adjustsFontForContentSizeCategory];
  if (v3) {
    [(FCUIActivityControlMenuItemView *)self _setNeedsTextAttributesUpdate];
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
  double v4 = (void *)MEMORY[0x263F82A90];
  id v5 = (void *)MEMORY[0x263F82A58];
  double v6 = (void *)[objc_alloc(MEMORY[0x263F82CC8]) initWithView:self];
  double v7 = [v5 effectWithPreview:v6];
  int v8 = [v4 styleWithEffect:v7 shape:0];

  return v8;
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  v17[1] = *MEMORY[0x263EF8340];
  if (a3) {
    [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  else {
  double v7 = [MEMORY[0x263F81720] defaultFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  uint64_t v16 = *MEMORY[0x263F817A0];
  uint64_t v14 = *MEMORY[0x263F81850];
  int v8 = [NSNumber numberWithDouble:a5];
  id v15 = v8;
  double v9 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v9;
  double v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  id v11 = [v7 fontDescriptorByAddingAttributes:v10];

  double v12 = [MEMORY[0x263F81708] fontWithDescriptor:v11 size:0.0];

  return v12;
}

- (id)_activationDescription
{
  return [(UILabel *)self->_activationDescriptionLabel text];
}

- (void)_setActivationDescription:(id)a3
{
  id v6 = a3;
  double v4 = [(FCUIActivityControlMenuItemView *)self _activationDescription];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(FCUIActivityControlMenuItemView *)self _configureActivationDescriptionLabelIfNecessary];
    [(FCUIActivityControlMenuItemView *)self _addViewRequiringUpdate:self->_activationDescriptionLabel];
    [(UILabel *)self->_activationDescriptionLabel setText:v6];
    [(FCUIActivityControlMenuItemView *)self setNeedsLayout];
  }
}

- (id)_activationDetails
{
  return [(UILabel *)self->_activationDetailsLabel text];
}

- (void)_setActivationDetails:(id)a3
{
  id v6 = a3;
  double v4 = [(FCUIActivityControlMenuItemView *)self _activationDetails];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(FCUIActivityControlMenuItemView *)self _configureActivationDetailsLabelIfNecessary];
    [(FCUIActivityControlMenuItemView *)self _addViewRequiringUpdate:self->_activationDetailsLabel];
    [(UILabel *)self->_activationDetailsLabel setText:v6];
    [(FCUIActivityControlMenuItemView *)self setNeedsLayout];
  }
}

- (id)_accessoryImage
{
  return [(UIImageView *)self->_accessoryImageView image];
}

- (void)_setAccessoryImage:(id)a3
{
  id v6 = a3;
  double v4 = [(FCUIActivityControlMenuItemView *)self _accessoryImage];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    if (v6)
    {
      [(FCUIActivityControlMenuItemView *)self _configureAccessoryImageViewIfNecessary];
      [(UIImageView *)self->_accessoryImageView setImage:v6];
    }
    [(FCUIActivityControlMenuItemView *)self setNeedsLayout];
  }
}

- (double)_separatorHeight
{
  double v2 = [(FCUIActivityControlMenuItemView *)self traitCollection];
  BOOL v3 = [v2 preferredContentSizeCategory];
  double v4 = 1.0;
  if (!UIContentSizeCategoryIsAccessibilityCategory(v3))
  {
    char v5 = [MEMORY[0x263F82B60] mainScreen];
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

  [(FCUIActivityControlMenuItemView *)self setNeedsLayout];
}

- (void)_updateTextAttributes
{
  BOOL v3 = [(FCUIActivityControlMenuItemView *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = v4;

  [(FCUIActivityControlMenuItemView *)self _updateTextAttributesForActivationDescriptionLabel];
  [(FCUIActivityControlMenuItemView *)self _updateTextAttributesForActivationDetailsLabel];
  [(FCUIActivityControlMenuItemView *)self _updateTextAttributesForAlternativeDescriptionLabel];
}

- (void)_updateTextAttributesIfNecessary
{
  if ([(FCUIActivityControlMenuItemView *)self _needsTextAttributesUpdate])
  {
    [(FCUIActivityControlMenuItemView *)self _updateTextAttributes];
  }
}

- (void)_updateTextAttributesForActivationDescriptionLabel
{
  activationDescriptionLabel = self->_activationDescriptionLabel;
  if (activationDescriptionLabel)
  {
    id v3 = [(id)objc_opt_class() _preferredFont:1 textStyle:*MEMORY[0x263F83570] weight:0x8000 additionalTraits:*MEMORY[0x263F81838]];
    [(UILabel *)activationDescriptionLabel setFont:v3];
  }
}

- (void)_updateTextAttributesForActivationDetailsLabel
{
  activationDetailsLabel = self->_activationDetailsLabel;
  if (activationDetailsLabel)
  {
    id v3 = [(id)objc_opt_class() _preferredFont:1 textStyle:*MEMORY[0x263F835F0] weight:0x8000 additionalTraits:*MEMORY[0x263F81840]];
    [(UILabel *)activationDetailsLabel setFont:v3];
  }
}

- (void)_updateTextAttributesForAlternativeDescriptionLabel
{
  alternativeDescriptionLabel = self->_alternativeDescriptionLabel;
  if (alternativeDescriptionLabel)
  {
    id v3 = [(id)objc_opt_class() _preferredFont:1 textStyle:*MEMORY[0x263F835B8] weight:0x8000 additionalTraits:*MEMORY[0x263F81838]];
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
    double v12 = [v13 _visualStylingForStyleNamed:@"moduleListTint"];
    [(UIView *)backgroundView mt_replaceVisualStyling:v12];

    id v10 = &OBJC_IVAR___FCUIActivityControlMenuItemView__highlightView;
    uint64_t v9 = 1;
  }
  else
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    [(FCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:self->_activationDescriptionLabel style:0 visualStylingProvider:v13 outgoingProvider:v8];
    [(FCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:self->_activationDetailsLabel style:1 visualStylingProvider:v13 outgoingProvider:v8];
    [(FCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:self->_alternativeDescriptionLabel style:1 visualStylingProvider:v13 outgoingProvider:v8];
    uint64_t v9 = 0;
    id v10 = &OBJC_IVAR___FCUIActivityControlMenuItemView__accessoryImageView;
  }
  [(FCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:*(Class *)((char *)&self->super.super.super.isa + *v10) style:v9 visualStylingProvider:v13 outgoingProvider:v8];
LABEL_6:
}

- (void)_configureBackgroundViewIfNecessary
{
  if (!self->_backgroundView)
  {
    id v3 = objc_alloc(MEMORY[0x263F82E00]);
    [(FCUIActivityControlMenuItemView *)self bounds];
    double v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    backgroundView = self->_backgroundView;
    self->_backgroundView = v4;

    [(UIView *)self->_backgroundView setUserInteractionEnabled:0];
    [(UIView *)self->_backgroundView setAutoresizingMask:18];
    [(FCUIActivityControlMenuItemView *)self insertSubview:self->_backgroundView atIndex:0];
    double v6 = self->_backgroundView;
    id v8 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&unk_26D1C0398];
    double v7 = [v8 _visualStylingForStyleNamed:@"moduleListTint"];
    [(UIView *)v6 mt_replaceVisualStyling:v7];
  }
}

- (id)_newLabel
{
  id v2 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v2 _setTextAlignmentFollowsWritingDirection:1];
  [v2 setNumberOfLines:0];
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
      double v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      id v8 = self->_viewsRequiringUpdate;
      self->_viewsRequiringUpdate = v7;

      viewsRequiringUpdate = self->_viewsRequiringUpdate;
    }
    id v4 = (id)[(NSHashTable *)viewsRequiringUpdate addObject:v9];
    id v5 = v9;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)_didPerformUpdate
{
  self->_viewsRequiringUpdate = 0;
  MEMORY[0x270F9A758]();
}

- (void)_configureActivationDescriptionLabelIfNecessary
{
  if (!self->_activationDescriptionLabel)
  {
    id v3 = [(FCUIActivityControlMenuItemView *)self _newLabel];
    activationDescriptionLabel = self->_activationDescriptionLabel;
    self->_activationDescriptionLabel = v3;

    [(FCUIActivityControlMenuItemView *)self addSubview:self->_activationDescriptionLabel];
    [(FCUIActivityControlMenuItemView *)self _updateTextAttributesForActivationDescriptionLabel];
    id v5 = self->_activationDescriptionLabel;
    id v6 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&unk_26D1C0380];
    [(FCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:v5 style:0 visualStylingProvider:v6 outgoingProvider:0];
  }
}

- (void)_configureActivationDetailsLabelIfNecessary
{
  if (!self->_activationDetailsLabel)
  {
    id v3 = [(FCUIActivityControlMenuItemView *)self _newLabel];
    activationDetailsLabel = self->_activationDetailsLabel;
    self->_activationDetailsLabel = v3;

    [(FCUIActivityControlMenuItemView *)self addSubview:self->_activationDetailsLabel];
    [(FCUIActivityControlMenuItemView *)self _updateTextAttributesForActivationDetailsLabel];
    id v5 = self->_activationDetailsLabel;
    id v6 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&unk_26D1C0380];
    [(FCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:v5 style:1 visualStylingProvider:v6 outgoingProvider:0];
  }
}

- (void)_configureAlternativeDescriptionLabelIfNecessary
{
  if (!self->_alternativeDescriptionLabel)
  {
    id v3 = [(FCUIActivityControlMenuItemView *)self _newLabel];
    alternativeDescriptionLabel = self->_alternativeDescriptionLabel;
    self->_alternativeDescriptionLabel = v3;

    [(UILabel *)self->_alternativeDescriptionLabel setTextAlignment:1];
    [(FCUIActivityControlMenuItemView *)self addSubview:self->_alternativeDescriptionLabel];
    [(FCUIActivityControlMenuItemView *)self _updateTextAttributesForAlternativeDescriptionLabel];
    id v5 = self->_alternativeDescriptionLabel;
    id v6 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&unk_26D1C0380];
    [(FCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:v5 style:1 visualStylingProvider:v6 outgoingProvider:0];
  }
}

- (void)_configureAccessoryImageViewIfNecessary
{
  if (!self->_accessoryImageView)
  {
    id v3 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    accessoryImageView = self->_accessoryImageView;
    self->_accessoryImageView = v3;

    [(FCUIActivityControlMenuItemView *)self addSubview:self->_accessoryImageView];
    id v5 = self->_accessoryImageView;
    id v6 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&unk_26D1C0380];
    [(FCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:v5 style:0 visualStylingProvider:v6 outgoingProvider:0];
  }
}

- (BOOL)_isCheckmarkEnabled
{
  id v2 = [(UIAction *)self->_defaultAction image];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)_checkmarkImage
{
  if ([(FCUIActivityControlMenuItemView *)self _isCheckmarkEnabled]
    && ([(FCUIActivityControlMenuItemView *)self _accessoryImage],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = (void *)v3;
    id v5 = [(FCUIActivityControlMenuItemView *)self _accessoryImage];
  }
  else
  {
    id v5 = [MEMORY[0x263F827E8] systemImageNamed:@"checkmark"];
  }
  return v5;
}

- (void)_configureCheckmarkImageViewIfNecessary
{
  if ([(FCUIActivityControlMenuItemView *)self _isCheckmarkEnabled])
  {
    [(FCUIActivityControlMenuItemView *)self _configureAccessoryImageViewIfNecessary];
    accessoryImageView = self->_accessoryImageView;
    id v4 = [(FCUIActivityControlMenuItemView *)self _checkmarkImage];
    [(UIImageView *)accessoryImageView setImage:v4];
  }
}

- (void)_tearDownAccessoryImageViewIfNecessary
{
  accessoryImageView = self->_accessoryImageView;
  if (accessoryImageView)
  {
    id v4 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&unk_26D1C0380];
    [(FCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:accessoryImageView style:0 visualStylingProvider:0 outgoingProvider:v4];

    [(UIImageView *)self->_accessoryImageView removeFromSuperview];
    id v5 = self->_accessoryImageView;
    self->_accessoryImageView = 0;
  }
}

- (void)_tearDownCheckmarkImageViewIfNecessary
{
  if ([(FCUIActivityControlMenuItemView *)self _isCheckmarkEnabled])
  {
    [(FCUIActivityControlMenuItemView *)self _tearDownAccessoryImageViewIfNecessary];
  }
}

- (void)_configureSeparatorViewIfNecessary
{
  if (!self->_separatorView)
  {
    uint64_t v3 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    separatorView = self->_separatorView;
    self->_separatorView = v3;

    [(FCUIActivityControlMenuItemView *)self addSubview:self->_separatorView];
    id v5 = self->_separatorView;
    id v6 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&unk_26D1C0380];
    [(FCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:v5 style:5 visualStylingProvider:v6 outgoingProvider:0];
  }
}

- (void)_tearDownSeparatorViewIfNecessary
{
  separatorView = self->_separatorView;
  if (separatorView)
  {
    id v4 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&unk_26D1C0380];
    [(FCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:separatorView style:5 visualStylingProvider:0 outgoingProvider:v4];

    [(UIView *)self->_separatorView removeFromSuperview];
    id v5 = self->_separatorView;
    self->_separatorView = 0;
  }
}

- (void)_configureHighlightViewIfNecessary
{
  if (!self->_highlightView)
  {
    uint64_t v3 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    highlightView = self->_highlightView;
    self->_highlightView = v3;

    [(UIView *)self->_highlightView setUserInteractionEnabled:0];
    id v5 = self->_highlightView;
    [(FCUIActivityControlMenuItemView *)self bounds];
    -[UIView setFrame:](v5, "setFrame:");
    [(UIView *)self->_highlightView setAutoresizingMask:18];
    [(FCUIActivityControlMenuItemView *)self _configureBackgroundViewIfNecessary];
    [(FCUIActivityControlMenuItemView *)self insertSubview:self->_highlightView aboveSubview:self->_backgroundView];
    id v6 = self->_highlightView;
    id v7 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&unk_26D1C0398];
    [(FCUIActivityControlMenuItemView *)self _updateVisualStylingOfView:v6 style:1 visualStylingProvider:v7 outgoingProvider:0];
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
  if (([(FCUIActivityControlMenuItemView *)self _shouldReverseLayoutDirection] & 1) == 0)
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
  uint64_t v16 = [(FCUIActivityControlMenuItemView *)self _accessoryImage];
  double v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [(FCUIActivityControlMenuItemView *)self _checkmarkImage];
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
  int v11 = [(FCUIActivityControlMenuItemView *)self _shouldReverseLayoutDirection];
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
  objc_storeStrong((id *)&self->_drawingContext, 0);
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProviders, 0);
  objc_storeStrong((id *)&self->_accessoryImageView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_viewsRequiringUpdate, 0);
  objc_storeStrong((id *)&self->_alternativeDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_activationDetailsLabel, 0);
  objc_storeStrong((id *)&self->_activationDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end