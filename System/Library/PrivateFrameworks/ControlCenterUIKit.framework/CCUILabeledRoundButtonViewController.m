@interface CCUILabeledRoundButtonViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isDynamicLayoutEnabled;
- (BOOL)isDynamicLayoutUnbounded;
- (BOOL)isEnabled;
- (BOOL)isInoperative;
- (BOOL)labelsVisible;
- (BOOL)toggleStateOnTap;
- (BOOL)useAlternateBackground;
- (BOOL)useAutomaticSymbolColors;
- (BOOL)useLightStyle;
- (CCUICAPackageDescription)glyphPackageDescription;
- (CCUILabeledRoundButton)buttonContainer;
- (CCUILabeledRoundButtonViewController)initWithGlyphImage:(id)a3 highlightColor:(id)a4;
- (CCUILabeledRoundButtonViewController)initWithGlyphImage:(id)a3 highlightColor:(id)a4 highlightTintColor:(id)a5;
- (CCUILabeledRoundButtonViewController)initWithGlyphImage:(id)a3 highlightColor:(id)a4 highlightTintColor:(id)a5 useLightStyle:(BOOL)a6;
- (CCUILabeledRoundButtonViewController)initWithGlyphImage:(id)a3 highlightColor:(id)a4 useLightStyle:(BOOL)a5;
- (CCUILabeledRoundButtonViewController)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4;
- (CCUILabeledRoundButtonViewController)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4 useLightStyle:(BOOL)a5;
- (NSString)contentSizeCategoryThreshold;
- (NSString)glyphState;
- (NSString)subtitle;
- (UIColor)highlightColor;
- (UIColor)highlightTintColor;
- (UIControl)button;
- (UIImage)glyphImage;
- (double)glyphScale;
- (id)requiredVisualStyleCategories;
- (void)buttonTapped:(id)a3;
- (void)loadView;
- (void)setButton:(id)a3;
- (void)setButtonContainer:(id)a3;
- (void)setContentSizeCategoryThreshold:(id)a3;
- (void)setDynamicLayoutEnabled:(BOOL)a3;
- (void)setDynamicLayoutUnbounded:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGlyphImage:(id)a3;
- (void)setGlyphPackageDescription:(id)a3;
- (void)setGlyphScale:(double)a3;
- (void)setGlyphState:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightTintColor:(id)a3;
- (void)setInoperative:(BOOL)a3;
- (void)setLabelsVisible:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setToggleStateOnTap:(BOOL)a3;
- (void)setUseAlternateBackground:(BOOL)a3;
- (void)setUseAutomaticSymbolColors:(BOOL)a3;
- (void)setUseLightStyle:(BOOL)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
@end

@implementation CCUILabeledRoundButtonViewController

- (CCUILabeledRoundButtonViewController)initWithGlyphImage:(id)a3 highlightColor:(id)a4
{
  return [(CCUILabeledRoundButtonViewController *)self initWithGlyphImage:a3 highlightColor:a4 useLightStyle:0];
}

- (CCUILabeledRoundButtonViewController)initWithGlyphImage:(id)a3 highlightColor:(id)a4 useLightStyle:(BOOL)a5
{
  return [(CCUILabeledRoundButtonViewController *)self initWithGlyphImage:a3 highlightColor:a4 highlightTintColor:0 useLightStyle:a5];
}

- (CCUILabeledRoundButtonViewController)initWithGlyphImage:(id)a3 highlightColor:(id)a4 highlightTintColor:(id)a5
{
  return [(CCUILabeledRoundButtonViewController *)self initWithGlyphImage:a3 highlightColor:a4 highlightTintColor:a5 useLightStyle:0];
}

- (CCUILabeledRoundButtonViewController)initWithGlyphImage:(id)a3 highlightColor:(id)a4 highlightTintColor:(id)a5 useLightStyle:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CCUILabeledRoundButtonViewController;
  v14 = [(CCUILabeledRoundButtonViewController *)&v21 initWithNibName:0 bundle:0];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_glyphImage, a3);
    v15->_glyphScale = 1.0;
    uint64_t v16 = [v12 copy];
    highlightColor = v15->_highlightColor;
    v15->_highlightColor = (UIColor *)v16;

    uint64_t v18 = [v13 copy];
    highlightTintColor = v15->_highlightTintColor;
    v15->_highlightTintColor = (UIColor *)v18;

    v15->_toggleStateOnTap = 1;
    v15->_useLightStyle = a6;
    v15->_contentSizeCategoryThreshold = (NSString *)*MEMORY[0x1E4FB27C0];
  }

  return v15;
}

- (CCUILabeledRoundButtonViewController)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4
{
  return [(CCUILabeledRoundButtonViewController *)self initWithGlyphPackageDescription:a3 highlightColor:a4 useLightStyle:0];
}

- (CCUILabeledRoundButtonViewController)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4 useLightStyle:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CCUILabeledRoundButtonViewController;
  id v11 = [(CCUILabeledRoundButtonViewController *)&v14 initWithNibName:0 bundle:0];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_glyphPackageDescription, a3);
    v12->_glyphScale = 1.0;
    objc_storeStrong((id *)&v12->_highlightColor, a4);
    v12->_toggleStateOnTap = 1;
    v12->_useLightStyle = a5;
    v12->_contentSizeCategoryThreshold = (NSString *)*MEMORY[0x1E4FB27C0];
  }

  return v12;
}

- (void)buttonTapped:(id)a3
{
  if (self->_toggleStateOnTap)
  {
    button = self->_button;
    uint64_t v4 = [(UIControl *)button isSelected] ^ 1;
    [(UIControl *)button setSelected:v4];
  }
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
  id v5 = a3;
  [(CCUILabeledRoundButton *)self->_buttonContainer setHighlightColor:v5];
}

- (void)setGlyphImage:(id)a3
{
  v6 = (UIImage *)a3;
  if (self->_glyphImage != v6)
  {
    objc_storeStrong((id *)&self->_glyphImage, a3);
    [(CCUILabeledRoundButton *)self->_buttonContainer setGlyphImage:v6];
    id v5 = [(CCUILabeledRoundButtonViewController *)self view];
    [v5 setNeedsLayout];
  }
}

- (void)setGlyphScale:(double)a3
{
  self->_glyphScale = a3;
  -[CCUILabeledRoundButton setGlyphScale:](self->_buttonContainer, "setGlyphScale:");
}

- (void)setGlyphPackageDescription:(id)a3
{
  objc_storeStrong((id *)&self->_glyphPackageDescription, a3);
  id v5 = a3;
  [(CCUILabeledRoundButton *)self->_buttonContainer setGlyphPackageDescription:v5];
}

- (void)setGlyphState:(id)a3
{
  objc_storeStrong((id *)&self->_glyphState, a3);
  id v5 = a3;
  [(CCUILabeledRoundButton *)self->_buttonContainer setGlyphState:v5];
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[UIControl setSelected:](self->_button, "setSelected:");
  id v4 = [(CCUILabeledRoundButtonViewController *)self view];
  [v4 setNeedsLayout];
}

- (void)setInoperative:(BOOL)a3
{
  self->_inoperative = a3;
  [(UIControl *)self->_button setEnabled:!a3];
}

- (void)setTitle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CCUILabeledRoundButtonViewController;
  id v4 = a3;
  [(CCUILabeledRoundButtonViewController *)&v5 setTitle:v4];
  -[CCUILabeledRoundButton setTitle:](self->_buttonContainer, "setTitle:", v4, v5.receiver, v5.super_class);
}

- (void)setSubtitle:(id)a3
{
  id v6 = a3;
  id v4 = (NSString *)[v6 copy];
  subtitle = self->_subtitle;
  self->_subtitle = v4;

  [(CCUILabeledRoundButton *)self->_buttonContainer setSubtitle:v6];
}

- (void)setLabelsVisible:(BOOL)a3
{
  self->_labelsVisible = a3;
  -[CCUILabeledRoundButton setLabelsVisible:](self->_buttonContainer, "setLabelsVisible:");
}

- (void)setUseAlternateBackground:(BOOL)a3
{
  if (self->_useAlternateBackground != a3)
  {
    self->_useAlternateBackground = a3;
    -[CCUILabeledRoundButton setUseAlternateBackground:](self->_buttonContainer, "setUseAlternateBackground:");
    id v4 = [(CCUILabeledRoundButtonViewController *)self view];
    [v4 setNeedsLayout];
  }
}

- (void)setUseAutomaticSymbolColors:(BOOL)a3
{
  if (self->_useAutomaticSymbolColors != a3)
  {
    self->_useAutomaticSymbolColors = a3;
    -[CCUILabeledRoundButton setUseAutomaticSymbolColors:](self->_buttonContainer, "setUseAutomaticSymbolColors:");
    id v4 = [(CCUILabeledRoundButtonViewController *)self view];
    [v4 setNeedsLayout];
  }
}

- (UIControl)button
{
  [(CCUILabeledRoundButtonViewController *)self loadViewIfNeeded];
  button = self->_button;
  return button;
}

- (void)setContentSizeCategoryThreshold:(id)a3
{
  if (self->_contentSizeCategoryThreshold != a3)
  {
    self->_contentSizeCategoryThreshold = (NSString *)a3;
    -[CCUILabeledRoundButton setContentSizeCategoryThreshold:](self->_buttonContainer, "setContentSizeCategoryThreshold:");
  }
}

- (void)setDynamicLayoutEnabled:(BOOL)a3
{
  if (self->_dynamicLayoutEnabled != a3)
  {
    self->_dynamicLayoutEnabled = a3;
    [(CCUILabeledRoundButton *)self->_buttonContainer setDynamicLayoutEnabled:"setDynamicLayoutEnabled:"];
    id v4 = [(CCUILabeledRoundButtonViewController *)self viewIfLoaded];
    [v4 setNeedsLayout];
  }
}

- (void)setDynamicLayoutUnbounded:(BOOL)a3
{
  if (self->_dynamicLayoutUnbounded != a3)
  {
    self->_dynamicLayoutUnbounded = a3;
    [(CCUILabeledRoundButton *)self->_buttonContainer setDynamicLayoutUnbounded:"setDynamicLayoutUnbounded:"];
    id v4 = [(CCUILabeledRoundButtonViewController *)self viewIfLoaded];
    [v4 setNeedsLayout];
  }
}

- (void)loadView
{
  if (self->_glyphImage)
  {
    v3 = [[CCUILabeledRoundButton alloc] initWithGlyphImage:self->_glyphImage highlightColor:self->_highlightColor highlightTintColor:self->_highlightTintColor useLightStyle:self->_useLightStyle];
LABEL_5:
    buttonContainer = self->_buttonContainer;
    self->_buttonContainer = v3;

    goto LABEL_6;
  }
  if (self->_glyphPackageDescription)
  {
    v3 = [[CCUILabeledRoundButton alloc] initWithGlyphPackageDescription:self->_glyphPackageDescription highlightColor:self->_highlightColor useLightStyle:self->_useLightStyle];
    goto LABEL_5;
  }
LABEL_6:
  [(CCUILabeledRoundButton *)self->_buttonContainer setGlyphScale:self->_glyphScale];
  [(CCUILabeledRoundButton *)self->_buttonContainer setDynamicLayoutEnabled:self->_dynamicLayoutEnabled];
  [(CCUILabeledRoundButton *)self->_buttonContainer setUseAlternateBackground:self->_useAlternateBackground];
  [(CCUILabeledRoundButton *)self->_buttonContainer setUseAutomaticSymbolColors:self->_useAutomaticSymbolColors];
  [(CCUILabeledRoundButton *)self->_buttonContainer setLabelsVisible:self->_labelsVisible];
  objc_super v5 = self->_buttonContainer;
  id v6 = [(CCUILabeledRoundButtonViewController *)self title];
  [(CCUILabeledRoundButton *)v5 setTitle:v6];

  v7 = self->_buttonContainer;
  v8 = [(CCUILabeledRoundButtonViewController *)self subtitle];
  [(CCUILabeledRoundButton *)v7 setSubtitle:v8];

  [(CCUILabeledRoundButton *)self->_buttonContainer setContentSizeCategoryThreshold:self->_contentSizeCategoryThreshold];
  id v9 = [(CCUILabeledRoundButton *)self->_buttonContainer buttonView];
  button = self->_button;
  self->_button = v9;

  [(UIControl *)self->_button addTarget:self action:sel_buttonTapped_ forControlEvents:64];
  id v11 = self->_buttonContainer;
  [(CCUILabeledRoundButtonViewController *)self setView:v11];
}

- (BOOL)_canShowWhileLocked
{
  uint64_t v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (id)requiredVisualStyleCategories
{
  return [(CCUILabeledRoundButton *)self->_buttonContainer requiredVisualStyleCategories];
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v9 = a3;
  id v6 = [(CCUILabeledRoundButtonViewController *)self requiredVisualStyleCategories];
  v7 = [NSNumber numberWithInteger:a4];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    [(CCUILabeledRoundButtonViewController *)self loadViewIfNeeded];
    [(CCUILabeledRoundButton *)self->_buttonContainer setVisualStylingProvider:v9 forCategory:a4];
  }
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (CCUICAPackageDescription)glyphPackageDescription
{
  return self->_glyphPackageDescription;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (double)glyphScale
{
  return self->_glyphScale;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (BOOL)labelsVisible
{
  return self->_labelsVisible;
}

- (BOOL)toggleStateOnTap
{
  return self->_toggleStateOnTap;
}

- (void)setToggleStateOnTap:(BOOL)a3
{
  self->_toggleStateOnTap = a3;
}

- (BOOL)useAlternateBackground
{
  return self->_useAlternateBackground;
}

- (BOOL)useAutomaticSymbolColors
{
  return self->_useAutomaticSymbolColors;
}

- (NSString)contentSizeCategoryThreshold
{
  return self->_contentSizeCategoryThreshold;
}

- (BOOL)isDynamicLayoutEnabled
{
  return self->_dynamicLayoutEnabled;
}

- (BOOL)isDynamicLayoutUnbounded
{
  return self->_dynamicLayoutUnbounded;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isInoperative
{
  return self->_inoperative;
}

- (void)setButton:(id)a3
{
}

- (UIColor)highlightTintColor
{
  return self->_highlightTintColor;
}

- (void)setHighlightTintColor:(id)a3
{
}

- (BOOL)useLightStyle
{
  return self->_useLightStyle;
}

- (void)setUseLightStyle:(BOOL)a3
{
  self->_useLightStyle = a3;
}

- (CCUILabeledRoundButton)buttonContainer
{
  return self->_buttonContainer;
}

- (void)setButtonContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonContainer, 0);
  objc_storeStrong((id *)&self->_highlightTintColor, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);
  objc_storeStrong((id *)&self->_glyphPackageDescription, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
}

@end