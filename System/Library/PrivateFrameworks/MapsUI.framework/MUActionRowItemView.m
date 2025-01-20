@interface MUActionRowItemView
+ (id)glyphFont;
+ (id)labelFont;
+ (id)monospacedLabelFont;
- (BOOL)fullWidthMode;
- (BOOL)hovering;
- (BOOL)showSelectedState;
- (BOOL)titleUsesMonospacedNumbersFont;
- (BOOL)touched;
- (BOOL)useVibrancy;
- (MUActionRowItemView)initWithStyle:(int64_t)a3 useVibrancy:(BOOL)a4;
- (MUActionRowItemViewDelegate)delegate;
- (NSString)glyphName;
- (NSString)titleText;
- (UIColor)contentBackgroundColor;
- (UIColor)highlightedBackgroundColor;
- (UIView)accessoryView;
- (id)accessibilityLabel;
- (int64_t)style;
- (void)_applyBorderIfNeeded;
- (void)_touchBegan;
- (void)_touchCancelled;
- (void)_touchEnded;
- (void)_updateMetrics;
- (void)didMoveToWindow;
- (void)handleHoverGesture:(id)a3;
- (void)handleMenuPresentation;
- (void)handlePress;
- (void)infoCardThemeChanged;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessoryView:(id)a3;
- (void)setContentBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFullWidthMode:(BOOL)a3;
- (void)setGlyphColor:(id)a3;
- (void)setGlyphName:(id)a3;
- (void)setHighlightedBackgroundColor:(id)a3;
- (void)setHovering:(BOOL)a3;
- (void)setMenu:(id)a3;
- (void)setShowSelectedState:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setTitleUsesMonospacedNumbersFont:(BOOL)a3;
- (void)setTouched:(BOOL)a3;
- (void)tintColorDidChange;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)updateColor;
- (void)updateImage;
@end

@implementation MUActionRowItemView

+ (id)labelFont
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  v3 = objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09E0]);

  return v3;
}

+ (id)monospacedLabelFont
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  v3 = objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09E0]);
  v4 = objc_msgSend(v3, "_mapsui_fontWithMonospacedNumbers");

  return v4;
}

+ (id)glyphFont
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2998]];
  v3 = objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09E0]);

  return v3;
}

- (MUActionRowItemView)initWithStyle:(int64_t)a3 useVibrancy:(BOOL)a4
{
  v45.receiver = self;
  v45.super_class = (Class)MUActionRowItemView;
  double v7 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v10 = -[MUActionRowItemView initWithFrame:](&v45, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v6, v9, v8);
  v11 = v10;
  if (!v10) {
    return v11;
  }
  v10->_style = a3;
  v10->_useVibrancy = a4;
  v12 = [MEMORY[0x1E4FB1618] clearColor];
  [(MUActionRowItemView *)v11 setBackgroundColor:v12];

  [(MUActionRowItemView *)v11 setEnabled:1];
  [(MUActionRowItemView *)v11 setPreferredMenuElementOrder:2];
  [(MUActionRowItemView *)v11 _setContinuousCornerRadius:10.0];
  if (v11->_useVibrancy)
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F310B0]), "initWithFrame:", v7, v6, v9, v8);
    p_vibrantView = (id *)&v11->_vibrantView;
    vibrantView = v11->_vibrantView;
    v11->_vibrantView = (MKVibrantView *)v13;

    backgroundView = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.200000003];
    v17 = [(MKVibrantView *)v11->_vibrantView contentView];
    [v17 setBackgroundColor:backgroundView];
  }
  else
  {
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v7, v6, v9, v8);
    p_vibrantView = (id *)&v11->_backgroundView;
    backgroundView = v11->_backgroundView;
    v11->_backgroundView = (UIView *)v18;
  }

  [*p_vibrantView setUserInteractionEnabled:0];
  [(MUActionRowItemView *)v11 addSubview:*p_vibrantView];
  id v19 = *p_vibrantView;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v21 = [[MUEdgeLayout alloc] initWithItem:v19 container:v11];
  [v20 addObject:v21];
  if (MapKitIdiomIsMacCatalyst())
  {
    if (v11->_style != 1)
    {
LABEL_9:
      id v23 = objc_alloc(MEMORY[0x1E4FB1930]);
      [(MUActionRowItemView *)v11 bounds];
      uint64_t v24 = objc_msgSend(v23, "initWithFrame:");
      label = v11->_label;
      v11->_label = (UILabel *)v24;

      [(UILabel *)v11->_label setNumberOfLines:1];
      [(UILabel *)v11->_label setTextAlignment:1];
      [(UILabel *)v11->_label setUserInteractionEnabled:0];
      [(UILabel *)v11->_label setAccessibilityIdentifier:@"ActionRowItemLabel"];
      [(MUActionRowItemView *)v11 addSubview:v11->_label];
      goto LABEL_10;
    }
    [(UIView *)v11->_backgroundView setAlpha:0.0];
    v22 = (void *)[objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:v11 action:sel_handleHoverGesture_];
    [(MUActionRowItemView *)v11 addGestureRecognizer:v22];
  }
  if (v11->_style != 1) {
    goto LABEL_9;
  }
LABEL_10:
  id v26 = objc_alloc(MEMORY[0x1E4FB1838]);
  [(MUActionRowItemView *)v11 bounds];
  uint64_t v27 = objc_msgSend(v26, "initWithFrame:");
  glyphImageView = v11->_glyphImageView;
  v11->_glyphImageView = (UIImageView *)v27;

  [(UIImageView *)v11->_glyphImageView setContentMode:1];
  [(UIImageView *)v11->_glyphImageView setUserInteractionEnabled:0];
  LODWORD(v29) = 1144750080;
  [(UIImageView *)v11->_glyphImageView setContentHuggingPriority:0 forAxis:v29];
  if (v11->_style == 1) {
    [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:13.0];
  }
  else {
  v30 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2998]];
  }
  [(UIImageView *)v11->_glyphImageView setPreferredSymbolConfiguration:v30];

  id v31 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(MUActionRowItemView *)v11 bounds];
  uint64_t v32 = objc_msgSend(v31, "initWithFrame:");
  accessoryContainerView = v11->_accessoryContainerView;
  v11->_accessoryContainerView = (UIView *)v32;

  [(UIView *)v11->_accessoryContainerView setUserInteractionEnabled:0];
  LODWORD(v34) = 1144750080;
  [(UIView *)v11->_accessoryContainerView setContentHuggingPriority:0 forAxis:v34];
  [(MUActionRowItemView *)v11 addSubview:v11->_accessoryContainerView];
  if (v11->_style)
  {
    [(MUActionRowItemView *)v11 setClipsToBounds:0];
  }
  else if (v11->_useVibrancy)
  {
    [(MKVibrantView *)v11->_vibrantView setContinuousCornerRadius:10.0];
  }
  else
  {
    [(UIView *)v11->_backgroundView _setContinuousCornerRadius:10.0];
  }
  [(MUActionRowItemView *)v11 updateColor];
  [(MUActionRowItemView *)v11 updateImage];
  v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v35 addObserver:v11 selector:sel__contentSizeDidChange name:*MEMORY[0x1E4FB27A8] object:0];

  if (MapKitIdiomIsMacCatalyst())
  {
    v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v36 addObserver:v11 selector:sel__applyBorderIfNeeded name:*MEMORY[0x1E4FB2438] object:0];
  }
  [(MUActionRowItemView *)v11 addTarget:v11 action:sel_handlePress forControlEvents:0x2000];
  [(MUActionRowItemView *)v11 addTarget:v11 action:sel_handleMenuPresentation forControlEvents:0x4000];
  v37 = [[MUStackLayout alloc] initWithContainer:v11 axis:1];
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_msgSend(v38, "_mapsui_addObjectIfNotNil:", v11->_accessoryContainerView);
  objc_msgSend(v38, "_mapsui_addObjectIfNotNil:", v11->_label);
  v39 = (void *)[v38 copy];
  [(MUStackLayout *)v37 setArrangedLayoutItems:v39];

  objc_storeStrong((id *)&v11->_iconLabelStackLayout, v37);
  [(MUActionRowItemView *)v11 _updateMetrics];
  [v20 addObject:v37];
  v40 = [(MUActionRowItemView *)v11 traitCollection];
  v41 = [(MUSizeLayout *)v40 preferredContentSizeCategory];
  if ([(MUSizeLayout *)v40 userInterfaceIdiom] == 5)
  {

    v40 = -[MUSizeLayout initWithItem:size:]([MUSizeLayout alloc], "initWithItem:size:", v11, 26.0, 23.0);
    [v20 addObject:v40];
  }
  else
  {
    if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v41)) {
      UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v41, (UIContentSizeCategory)*MEMORY[0x1E4FB2780]);
    }
  }
  v42 = (void *)MEMORY[0x1E4F28DC8];
  v43 = (void *)[v20 copy];
  objc_msgSend(v42, "_mapsui_activateLayouts:", v43);

  return v11;
}

- (void)_applyBorderIfNeeded
{
  BOOL v4 = UIAccessibilityDarkerSystemColorsEnabled();
  if (v4) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  [(UIView *)self->_backgroundView setAlpha:v5];
  if (v4)
  {
    id v2 = [(MUActionRowItemView *)self tintColor];
    uint64_t v6 = [v2 CGColor];
  }
  else
  {
    uint64_t v6 = 0;
  }
  double v7 = [(UIView *)self->_backgroundView layer];
  [v7 setBorderColor:v6];

  if (v4) {
  id v8 = [(UIView *)self->_backgroundView layer];
  }
  [v8 setBorderWidth:v5];
}

- (void)handlePress
{
  id v3 = [(MUActionRowItemView *)self delegate];
  [v3 actionRowItemSelected:self];
}

- (void)handleMenuPresentation
{
  id v3 = [(MUActionRowItemView *)self delegate];
  [v3 actionRowItemPresentedMenu:self];
}

- (void)handleHoverGesture:(id)a3
{
  BOOL v4 = (unint64_t)([a3 state] - 1) < 2;
  [(MUActionRowItemView *)self setHovering:v4];
}

- (id)accessibilityLabel
{
  return (id)[(UIImageView *)self->_glyphImageView accessibilityLabel];
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (void)setGlyphName:(id)a3
{
  id v5 = a3;
  if ((-[NSString isEqual:](self->_glyphName, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_glyphName, a3);
    [(MUActionRowItemView *)self updateImage];
  }
}

- (void)setAccessoryView:(id)a3
{
  p_accessoryView = &self->_accessoryView;
  id v6 = a3;
  if ((-[UIView isEqual:](*p_accessoryView, "isEqual:") & 1) == 0)
  {
    [(UIView *)*p_accessoryView removeFromSuperview];
    objc_storeStrong((id *)&self->_accessoryView, a3);
    [(MUActionRowItemView *)self updateImage];
  }
}

- (void)setHovering:(BOOL)a3
{
  if (self->_hovering != a3)
  {
    self->_hovering = a3;
    double v4 = 1.0;
    if (!UIAccessibilityDarkerSystemColorsEnabled())
    {
      if (self->_hovering) {
        double v4 = 1.0;
      }
      else {
        double v4 = 0.0;
      }
    }
    backgroundView = self->_backgroundView;
    [(UIView *)backgroundView setAlpha:v4];
  }
}

- (void)setFullWidthMode:(BOOL)a3
{
  if (self->_fullWidthMode != a3)
  {
    self->_fullWidthMode = a3;
    if (a3) {
      uint64_t v4 = 4;
    }
    else {
      uint64_t v4 = 1;
    }
    [(UILabel *)self->_label setTextAlignment:v4];
    [(MUActionRowItemView *)self _updateMetrics];
  }
}

- (void)_updateMetrics
{
  id v3 = [(MUActionRowItemView *)self traitCollection];
  uint64_t v4 = [v3 preferredContentSizeCategory];
  if ([v3 userInterfaceIdiom] == 5)
  {
    double v5 = 4.0;
    double v6 = 0.0;
    double v7 = 0.0;
  }
  else if (UIContentSizeCategoryIsAccessibilityCategory(v4))
  {
    NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E4FB2780]);
    unint64_t v9 = 18;
    unint64_t v10 = 12;
    if (v8 == NSOrderedAscending)
    {
      unint64_t v9 = 12;
      unint64_t v10 = 8;
    }
    double v6 = (double)v9;
    double v7 = (double)v10;
    double v5 = 10.0;
  }
  else
  {
    double v7 = 5.0;
    double v5 = 6.0;
    double v6 = 8.0;
  }

  -[MUStackLayout setInsets:](self->_iconLabelStackLayout, "setInsets:", v5, v6, v5, v6);
  [(MUStackLayout *)self->_iconLabelStackLayout setSpacing:v7];
  [(MUStackLayout *)self->_iconLabelStackLayout setAxis:!self->_fullWidthMode];
  BOOL titleUsesMonospacedNumbersFont = self->_titleUsesMonospacedNumbersFont;
  v12 = objc_opt_class();
  if (titleUsesMonospacedNumbersFont) {
    [v12 monospacedLabelFont];
  }
  else {
  id v13 = [v12 labelFont];
  }
  [(UILabel *)self->_label setFont:v13];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)MUActionRowItemView;
  [(MUActionRowItemView *)&v6 layoutSubviews];
  if (self->_style == 1)
  {
    id v3 = [(UIView *)self->_backgroundView layer];
    [v3 setCornerRadius:8.0];

    uint64_t v4 = *MEMORY[0x1E4F39EA8];
    double v5 = [(UIView *)self->_backgroundView layer];
    [v5 setCornerCurve:v4];
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)MUActionRowItemView;
  [(MUActionRowItemView *)&v4 didMoveToWindow];
  id v3 = [(MUActionRowItemView *)self window];

  if (v3) {
    [(MUActionRowItemView *)self infoCardThemeChanged];
  }
}

- (void)infoCardThemeChanged
{
  v3.receiver = self;
  v3.super_class = (Class)MUActionRowItemView;
  [(MUActionRowItemView *)&v3 infoCardThemeChanged];
  [(MUActionRowItemView *)self updateColor];
}

- (void)updateImage
{
  v16[1] = *MEMORY[0x1E4F143B8];
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    objc_super v4 = accessoryView;
  }
  else
  {
    objc_super v4 = self->_glyphImageView;
    double v5 = objc_msgSend(MEMORY[0x1E4FB1818], "_mapsui_systemImageNamed:", self->_glyphName);
    [(UIImageView *)self->_glyphImageView setImage:v5];
  }
  if (v4 != (UIImageView *)self->_accessoryView
    || ([(UIImageView *)v4 superview],
        objc_super v6 = (UIView *)objc_claimAutoreleasedReturnValue(),
        double v7 = self->_accessoryContainerView,
        v6,
        v6 != v7))
  {
    if (v4 != self->_glyphImageView
      || ([(UIImageView *)v4 superview],
          NSComparisonResult v8 = (UIView *)objc_claimAutoreleasedReturnValue(),
          accessoryContainerView = self->_accessoryContainerView,
          v8,
          v8 != accessoryContainerView))
    {
      [(UIView *)self->_accessoryView removeFromSuperview];
      [(UIImageView *)self->_glyphImageView removeFromSuperview];
      [(UIView *)self->_accessoryContainerView addSubview:v4];
      unint64_t v10 = [[MUBoxLayout alloc] initWithContainer:self->_accessoryContainerView];
      v16[0] = v4;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      [(MUBoxLayout *)v10 setArrangedLayoutItems:v11];

      [(MUBoxLayout *)v10 setHorizontalAlignment:2];
      [(MUBoxLayout *)v10 setVerticalAlignment:0];
      LODWORD(v12) = 1144750080;
      [(MUBoxLayout *)v10 setHorizontalAlignmentFittingSizePriority:v12];
      id v13 = (void *)MEMORY[0x1E4F28DC8];
      v15 = v10;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
      objc_msgSend(v13, "_mapsui_activateLayouts:", v14);
    }
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MUActionRowItemView;
  [(MUActionRowItemView *)&v3 tintColorDidChange];
  [(MUActionRowItemView *)self updateColor];
}

- (void)setTintColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MUActionRowItemView;
  [(MUActionRowItemView *)&v4 setTintColor:a3];
  [(MUActionRowItemView *)self updateColor];
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MUActionRowItemView;
  [(MUActionRowItemView *)&v4 setEnabled:a3];
  [(MUActionRowItemView *)self updateColor];
}

- (void)setTitleText:(id)a3
{
  label = self->_label;
  id v5 = a3;
  [(UILabel *)label setText:v5];
  [(MUActionRowItemView *)self setToolTip:v5];
}

- (NSString)titleText
{
  return [(UILabel *)self->_label text];
}

- (void)setContentBackgroundColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_contentBackgroundColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentBackgroundColor, a3);
    [(MUActionRowItemView *)self updateColor];
  }
}

- (void)setGlyphColor:(id)a3
{
  if (self->_style == 1) {
    [(MUActionRowItemView *)self setTintColor:a3];
  }
}

- (void)setHighlightedBackgroundColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_highlightedBackgroundColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_highlightedBackgroundColor, a3);
    [(MUActionRowItemView *)self updateColor];
  }
}

- (void)updateColor
{
  int64_t style = self->_style;
  if (style != 1)
  {
    if (style) {
      return;
    }
    objc_super v4 = [(MUActionRowItemView *)self mk_theme];
    id v22 = [v4 tintColor];

    id v5 = [(MUActionRowItemView *)self tintColor];

    if (v5)
    {
      uint64_t v6 = [(MUActionRowItemView *)self tintColor];

      id v22 = (id)v6;
    }
    if ([(MUActionRowItemView *)self isEnabled]
      && [(MUActionRowItemView *)self tintAdjustmentMode] != 2)
    {
      id v9 = v22;
    }
    else
    {
      double v7 = [(MUActionRowItemView *)self mk_theme];
      uint64_t v8 = [v7 disabledActionRowTextColor];

      id v9 = (id)v8;
    }
    id v23 = v9;
    if (self->_useVibrancy)
    {
      v15 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
      [(MKVibrantView *)self->_vibrantView setBackgroundColor:v15];

      BOOL touched = self->_touched;
      v17 = [(MUActionRowItemView *)self mk_theme];
      uint64_t v18 = v17;
      if (touched) {
        [v17 buttonHighlightedColor];
      }
      else {
      id v20 = [v17 buttonNormalColor];
      }
      v21 = [(MKVibrantView *)self->_vibrantView contentView];
      [v21 setBackgroundColor:v20];

      goto LABEL_26;
    }
    if (self->_touched)
    {
      if (!self->_highlightedBackgroundColor)
      {
        uint64_t v18 = [(MUActionRowItemView *)self mk_theme];
        uint64_t v19 = [v18 buttonHighlightedColor];
LABEL_33:
        id v20 = (void *)v19;
        [(UIView *)self->_backgroundView setBackgroundColor:v19];
LABEL_26:

LABEL_29:
        [(UIImageView *)self->_glyphImageView setTintColor:v23];
        [(UILabel *)self->_label setTextColor:v23];

        return;
      }
    }
    else if (!self->_contentBackgroundColor)
    {
      uint64_t v18 = [(MUActionRowItemView *)self mk_theme];
      uint64_t v19 = [v18 buttonNormalColor];
      goto LABEL_33;
    }
    -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:");
    goto LABEL_29;
  }
  unint64_t v10 = [(MUActionRowItemView *)self tintColor];
  if (v10) {
    [(MUActionRowItemView *)self tintColor];
  }
  else {
  v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  [(UIImageView *)self->_glyphImageView setTintColor:v11];

  [(UIView *)self->_backgroundView setBackgroundColor:self->_contentBackgroundColor];
  int v12 = [(MUActionRowItemView *)self isEnabled];
  double v13 = 0.5;
  if (v12) {
    double v13 = 1.0;
  }
  glyphImageView = self->_glyphImageView;
  [(UIImageView *)glyphImageView setAlpha:v13];
}

- (void)setTitleUsesMonospacedNumbersFont:(BOOL)a3
{
  if (self->_titleUsesMonospacedNumbersFont != a3)
  {
    self->_BOOL titleUsesMonospacedNumbersFont = a3;
    [(MUActionRowItemView *)self _updateMetrics];
  }
}

- (void)setTouched:(BOOL)a3
{
  if (self->_touched != a3)
  {
    self->_BOOL touched = a3;
    [(MUActionRowItemView *)self updateColor];
  }
}

- (void)_touchBegan
{
  if ([(MUActionRowItemView *)self isEnabled])
  {
    [(MUActionRowItemView *)self setTouched:1];
  }
}

- (void)_touchCancelled
{
}

- (void)_touchEnded
{
  if ([(MUActionRowItemView *)self touched])
  {
    [(MUActionRowItemView *)self setTouched:0];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MUActionRowItemView;
  id v6 = a4;
  [(MUActionRowItemView *)&v10 touchesBegan:a3 withEvent:v6];
  double v7 = [(MUActionRowItemView *)self window];
  uint64_t v8 = [v6 touchesForWindow:v7];

  id v9 = [v8 anyObject];

  if ([v9 tapCount] == 1) {
    [(MUActionRowItemView *)self _touchBegan];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MUActionRowItemView;
  [(MUActionRowItemView *)&v5 touchesCancelled:a3 withEvent:a4];
  [(MUActionRowItemView *)self _touchCancelled];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MUActionRowItemView;
  [(MUActionRowItemView *)&v5 touchesEnded:a3 withEvent:a4];
  [(MUActionRowItemView *)self _touchEnded];
}

- (void)setMenu:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MUActionRowItemView;
  [(MUActionRowItemView *)&v5 setMenu:a3];
  objc_super v4 = [(MUActionRowItemView *)self menu];

  if (v4) {
    [(MUActionRowItemView *)self removeTarget:self action:sel_handlePress forControlEvents:0x2000];
  }
  else {
    [(MUActionRowItemView *)self addTarget:self action:sel_handlePress forControlEvents:0x2000];
  }
  [(MUActionRowItemView *)self setShowsMenuAsPrimaryAction:v4 != 0];
}

- (MUActionRowItemViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUActionRowItemViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)glyphName
{
  return self->_glyphName;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (BOOL)fullWidthMode
{
  return self->_fullWidthMode;
}

- (UIColor)contentBackgroundColor
{
  return self->_contentBackgroundColor;
}

- (UIColor)highlightedBackgroundColor
{
  return self->_highlightedBackgroundColor;
}

- (BOOL)titleUsesMonospacedNumbersFont
{
  return self->_titleUsesMonospacedNumbersFont;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)useVibrancy
{
  return self->_useVibrancy;
}

- (BOOL)touched
{
  return self->_touched;
}

- (BOOL)hovering
{
  return self->_hovering;
}

- (BOOL)showSelectedState
{
  return self->_showSelectedState;
}

- (void)setShowSelectedState:(BOOL)a3
{
  self->_showSelectedState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_contentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_glyphName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconLabelStackLayout, 0);
  objc_storeStrong((id *)&self->_edgeLayout, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_vibrantView, 0);
  objc_storeStrong((id *)&self->_accessoryContainerView, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end