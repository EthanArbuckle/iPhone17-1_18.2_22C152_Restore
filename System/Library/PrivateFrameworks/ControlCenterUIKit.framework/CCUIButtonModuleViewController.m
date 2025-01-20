@interface CCUIButtonModuleViewController
- (BOOL)appearsSelected;
- (BOOL)hasGlyph;
- (BOOL)isExpanded;
- (BOOL)isResizing;
- (BOOL)isSelected;
- (BOOL)supportsAccessibilityContentSizeCategories;
- (CCUIButtonModuleGlyph)glyphView;
- (CCUIButtonModuleView)buttonView;
- (CCUIButtonModuleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CCUICAPackageDescription)glyphPackageDescription;
- (CCUIControlTemplateView)_templateView;
- (CCUIModuleContentMetrics)contentMetrics;
- (NSString)glyphState;
- (NSString)selectedValueText;
- (NSString)valueText;
- (UIColor)glyphColor;
- (UIColor)selectedGlyphColor;
- (UIImage)glyphImage;
- (UIImage)selectedGlyphImage;
- (double)compactContinuousCornerRadius;
- (double)glyphScale;
- (double)preferredExpandedContentHeight;
- (int64_t)gridSizeClass;
- (unint64_t)contentRenderingMode;
- (void)_applyCompactContinuousCornerRadius;
- (void)_applyContinuousCornerRadius:(double)a3;
- (void)_buttonTapped:(id)a3 forEvent:(id)a4;
- (void)_updateSelected;
- (void)_updateValueText;
- (void)setCompactContinuousCornerRadius:(double)a3;
- (void)setContentMetrics:(id)a3;
- (void)setContentRenderingMode:(unint64_t)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setGlyphColor:(id)a3;
- (void)setGlyphImage:(id)a3;
- (void)setGlyphPackageDescription:(id)a3;
- (void)setGlyphScale:(double)a3;
- (void)setGlyphState:(id)a3;
- (void)setGlyphView:(id)a3;
- (void)setGridSizeClass:(int64_t)a3;
- (void)setResizing:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedGlyphColor:(id)a3;
- (void)setSelectedGlyphImage:(id)a3;
- (void)setSelectedValueText:(id)a3;
- (void)setSupportsAccessibilityContentSizeCategories:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setValueText:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation CCUIButtonModuleViewController

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (CCUIButtonModuleView)buttonView
{
  return (CCUIButtonModuleView *)self->_buttonModuleView;
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    [(CCUIButtonModuleViewController *)self _updateSelected];
  }
}

- (void)setTitle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIButtonModuleViewController;
  id v4 = a3;
  [(CCUIButtonModuleViewController *)&v5 setTitle:v4];
  -[CCUIControlTemplateView setTitle:](self->_buttonModuleView, "setTitle:", v4, v5.receiver, v5.super_class);
}

- (void)setValueText:(id)a3
{
  id v6 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    id v4 = (NSString *)[v6 copy];
    valueText = self->_valueText;
    self->_valueText = v4;

    [(CCUIButtonModuleViewController *)self _updateValueText];
  }
}

- (void)setSelectedValueText:(id)a3
{
  id v6 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    id v4 = (NSString *)[v6 copy];
    selectedValueText = self->_selectedValueText;
    self->_selectedValueText = v4;

    [(CCUIButtonModuleViewController *)self _updateValueText];
  }
}

- (void)setGlyphView:(id)a3
{
  id v4 = a3;
  [(CCUIButtonModuleViewController *)self loadViewIfNeeded];
  [(CCUIButtonModuleView *)self->_buttonModuleView setGlyphView:v4];
}

- (CCUIButtonModuleGlyph)glyphView
{
  return [(CCUIButtonModuleView *)self->_buttonModuleView glyphView];
}

- (void)setGlyphImage:(id)a3
{
  id v4 = a3;
  [(CCUIButtonModuleViewController *)self loadViewIfNeeded];
  [(CCUIButtonModuleView *)self->_buttonModuleView setGlyphImage:v4];
}

- (UIImage)glyphImage
{
  return [(CCUIButtonModuleView *)self->_buttonModuleView glyphImage];
}

- (void)setGlyphColor:(id)a3
{
  id v4 = a3;
  [(CCUIButtonModuleViewController *)self loadViewIfNeeded];
  [(CCUIButtonModuleView *)self->_buttonModuleView setGlyphColor:v4];
}

- (UIColor)glyphColor
{
  return [(CCUIButtonModuleView *)self->_buttonModuleView glyphColor];
}

- (void)setSelectedGlyphImage:(id)a3
{
  id v4 = a3;
  [(CCUIButtonModuleViewController *)self loadViewIfNeeded];
  [(CCUIButtonModuleView *)self->_buttonModuleView setSelectedGlyphImage:v4];
}

- (UIImage)selectedGlyphImage
{
  return [(CCUIButtonModuleView *)self->_buttonModuleView selectedGlyphImage];
}

- (void)setSelectedGlyphColor:(id)a3
{
  id v4 = a3;
  [(CCUIButtonModuleViewController *)self loadViewIfNeeded];
  [(CCUIButtonModuleView *)self->_buttonModuleView setSelectedGlyphColor:v4];
}

- (UIColor)selectedGlyphColor
{
  return [(CCUIButtonModuleView *)self->_buttonModuleView selectedGlyphColor];
}

- (void)setGlyphPackageDescription:(id)a3
{
  id v4 = a3;
  [(CCUIButtonModuleViewController *)self loadViewIfNeeded];
  [(CCUIButtonModuleView *)self->_buttonModuleView setGlyphPackageDescription:v4];
}

- (CCUICAPackageDescription)glyphPackageDescription
{
  return [(CCUIButtonModuleView *)self->_buttonModuleView glyphPackageDescription];
}

- (void)setGlyphState:(id)a3
{
  id v4 = a3;
  [(CCUIButtonModuleViewController *)self loadViewIfNeeded];
  [(CCUIButtonModuleView *)self->_buttonModuleView setGlyphState:v4];
}

- (NSString)glyphState
{
  return [(CCUIButtonModuleView *)self->_buttonModuleView glyphState];
}

- (void)setGlyphScale:(double)a3
{
  [(CCUIButtonModuleViewController *)self loadViewIfNeeded];
  buttonModuleView = self->_buttonModuleView;
  [(CCUIButtonModuleView *)buttonModuleView setGlyphScale:a3];
}

- (double)glyphScale
{
  buttonModuleView = self->_buttonModuleView;
  if (!buttonModuleView) {
    return 1.0;
  }
  [(CCUIButtonModuleView *)buttonModuleView glyphScale];
  return result;
}

- (BOOL)appearsSelected
{
  return !self->_contentRenderingMode && self->_selected;
}

- (void)_buttonTapped:(id)a3 forEvent:(id)a4
{
  [(CCUIButtonModuleViewController *)self buttonTapped:a3 forEvent:a4];
  id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v4 _deactivateReachability];
}

- (BOOL)hasGlyph
{
  v3 = [(CCUIButtonModuleViewController *)self glyphView];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    objc_super v5 = [(CCUIButtonModuleViewController *)self glyphImage];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [(CCUIButtonModuleViewController *)self glyphPackageDescription];
      BOOL v4 = v6 != 0;
    }
  }

  return v4;
}

- (CCUIButtonModuleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CCUIButtonModuleViewController;
  BOOL v4 = [(CCUIButtonModuleViewController *)&v12 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    objc_super v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"CONTROL_OFF" value:&stru_1F3016698 table:0];
    valueText = v4->_valueText;
    v4->_valueText = (NSString *)v6;

    v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"CONTROL_ON" value:&stru_1F3016698 table:0];
    selectedValueText = v4->_selectedValueText;
    v4->_selectedValueText = (NSString *)v9;
  }
  return v4;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)CCUIButtonModuleViewController;
  [(CCUIButtonModuleViewController *)&v9 viewDidLoad];
  v3 = [(CCUIButtonModuleViewController *)self view];
  BOOL v4 = [CCUIControlTemplateView alloc];
  [v3 bounds];
  objc_super v5 = -[CCUIControlTemplateView initWithFrame:](v4, "initWithFrame:");
  uint64_t v6 = [(CCUIButtonModuleViewController *)self title];
  [(CCUIControlTemplateView *)v5 setTitle:v6];

  [(CCUIControlTemplateView *)v5 setSupportsAccessibilityContentSizeCategories:[(CCUIButtonModuleViewController *)self supportsAccessibilityContentSizeCategories]];
  buttonModuleView = self->_buttonModuleView;
  self->_buttonModuleView = v5;
  v8 = v5;

  [v3 addSubview:self->_buttonModuleView];
  [(CCUIButtonModuleViewController *)self _updateValueText];
  [(CCUIControlTemplateView *)self->_buttonModuleView addTarget:self action:sel__buttonTouchDown_forEvent_ forControlEvents:1];
  [(CCUIControlTemplateView *)self->_buttonModuleView addTarget:self action:sel__buttonTapped_forEvent_ forControlEvents:64];
}

- (void)viewWillLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CCUIButtonModuleViewController;
  [(CCUIButtonModuleViewController *)&v7 viewWillLayoutSubviews];
  BOOL v3 = [(CCUIButtonModuleViewController *)self isExpanded];
  if (v3)
  {
    if (objc_opt_respondsToSelector()) {
      [(CCUIButtonModuleViewController *)self preferredExpandedContinuousCornerRadius];
    }
    else {
      double v4 = CCUIExpandedModuleContinuousCornerRadius();
    }
    [(CCUIButtonModuleViewController *)self _applyContinuousCornerRadius:v4];
  }
  else if (![(CCUIButtonModuleViewController *)self isResizing])
  {
    [(CCUIButtonModuleViewController *)self _applyCompactContinuousCornerRadius];
  }
  [(CCUIControlTemplateView *)self->_buttonModuleView setExpanded:v3];
  buttonModuleView = self->_buttonModuleView;
  uint64_t v6 = [(CCUIButtonModuleViewController *)self view];
  [v6 bounds];
  -[CCUIControlTemplateView setFrame:](buttonModuleView, "setFrame:");
}

- (double)preferredExpandedContentHeight
{
  return 0.0;
}

- (void)setResizing:(BOOL)a3
{
  BOOL v3 = a3;
  [(CCUIButtonModuleViewController *)self loadViewIfNeeded];
  buttonModuleView = self->_buttonModuleView;
  [(CCUIControlTemplateView *)buttonModuleView setResizing:v3];
}

- (BOOL)isResizing
{
  return [(CCUIControlTemplateView *)self->_buttonModuleView isResizing];
}

- (void)setGridSizeClass:(int64_t)a3
{
  [(CCUIButtonModuleViewController *)self loadViewIfNeeded];
  buttonModuleView = self->_buttonModuleView;
  [(CCUIControlTemplateView *)buttonModuleView setGridSizeClass:a3];
}

- (int64_t)gridSizeClass
{
  return [(CCUIControlTemplateView *)self->_buttonModuleView gridSizeClass];
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  if (self->_compactContinuousCornerRadius != a3)
  {
    self->_compactContinuousCornerRadius = a3;
    if ([(CCUIButtonModuleViewController *)self isResizing])
    {
      [(CCUIButtonModuleViewController *)self _applyCompactContinuousCornerRadius];
    }
    else
    {
      id v4 = [(CCUIButtonModuleViewController *)self viewIfLoaded];
      [v4 setNeedsLayout];
    }
  }
}

- (void)setContentRenderingMode:(unint64_t)a3
{
  if (self->_contentRenderingMode != a3)
  {
    self->_contentRenderingMode = a3;
    [(CCUIButtonModuleViewController *)self _updateSelected];
  }
}

- (void)setContentMetrics:(id)a3
{
  id v4 = a3;
  [(CCUIButtonModuleViewController *)self loadViewIfNeeded];
  [(CCUIControlTemplateView *)self->_buttonModuleView setContentMetrics:v4];
}

- (CCUIModuleContentMetrics)contentMetrics
{
  return [(CCUIControlTemplateView *)self->_buttonModuleView contentMetrics];
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  self->_expanded = a3;
  if ([(CCUIControlTemplateView *)self->_buttonModuleView isHighlighted])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __70__CCUIButtonModuleViewController_willTransitionToExpandedContentMode___block_invoke;
    v4[3] = &unk_1E6AD41E8;
    v4[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v4];
  }
}

uint64_t __70__CCUIButtonModuleViewController_willTransitionToExpandedContentMode___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 976) setHighlighted:0];
}

- (void)setSupportsAccessibilityContentSizeCategories:(BOOL)a3
{
  if (self->_supportsAccessibilityContentSizeCategories != a3)
  {
    self->_supportsAccessibilityContentSizeCategories = a3;
    -[CCUIControlTemplateView setSupportsAccessibilityContentSizeCategories:](self->_buttonModuleView, "setSupportsAccessibilityContentSizeCategories:");
  }
}

- (BOOL)supportsAccessibilityContentSizeCategories
{
  return self->_supportsAccessibilityContentSizeCategories;
}

- (CCUIControlTemplateView)_templateView
{
  return self->_buttonModuleView;
}

- (void)_applyCompactContinuousCornerRadius
{
  [(CCUIButtonModuleViewController *)self compactContinuousCornerRadius];
  -[CCUIButtonModuleViewController _applyContinuousCornerRadius:](self, "_applyContinuousCornerRadius:");
}

- (void)_updateSelected
{
  [(CCUIButtonModuleViewController *)self loadViewIfNeeded];
  [(CCUIButtonModuleView *)self->_buttonModuleView setSelected:[(CCUIButtonModuleViewController *)self appearsSelected]];
  [(CCUIButtonModuleViewController *)self _updateValueText];
}

- (void)_updateValueText
{
  if ([(CCUIButtonModuleViewController *)self appearsSelected]) {
    [(CCUIButtonModuleViewController *)self selectedValueText];
  }
  else {
  id v3 = [(CCUIButtonModuleViewController *)self valueText];
  }
  [(CCUIControlTemplateView *)self->_buttonModuleView setSubtitle:v3];
}

- (void)_applyContinuousCornerRadius:(double)a3
{
}

- (NSString)valueText
{
  return self->_valueText;
}

- (NSString)selectedValueText
{
  return self->_selectedValueText;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (double)compactContinuousCornerRadius
{
  return self->_compactContinuousCornerRadius;
}

- (unint64_t)contentRenderingMode
{
  return self->_contentRenderingMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedValueText, 0);
  objc_storeStrong((id *)&self->_valueText, 0);
  objc_storeStrong((id *)&self->_buttonModuleView, 0);
}

@end