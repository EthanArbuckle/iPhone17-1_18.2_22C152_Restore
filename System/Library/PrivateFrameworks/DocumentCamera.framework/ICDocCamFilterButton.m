@interface ICDocCamFilterButton
+ (id)filterButtonWithType:(signed __int16)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (NSLayoutConstraint)iconSizeConstraint;
- (NSLayoutConstraint)labelVerticalSpacingConstraint;
- (UIColor)activeBackgroundViewColor;
- (UIColor)inactiveBackgroundViewColor;
- (UIColor)inactiveTextColor;
- (UIImageView)filterIconView;
- (UILabel)filterNameLabel;
- (UIView)backgroundView;
- (double)iconSize;
- (id)accessibilityLabel;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)imageForFilterType:(signed __int16)a3;
- (signed)filterType;
- (unint64_t)accessibilityTraits;
- (void)awakeFromNib;
- (void)dealloc;
- (void)setBackgroundView:(id)a3;
- (void)setFilterIconView:(id)a3;
- (void)setFilterNameLabel:(id)a3;
- (void)setFilterType:(signed __int16)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIconSize:(double)a3;
- (void)setIconSizeConstraint:(id)a3;
- (void)setLabelVerticalSpacingConstraint:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)updateForAccessibilityDarkerSystemColors:(id)a3;
@end

@implementation ICDocCamFilterButton

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICDocCamFilterButton;
  [(ICDocCamFilterButton *)&v4 dealloc];
}

- (void)awakeFromNib
{
  v9.receiver = self;
  v9.super_class = (Class)ICDocCamFilterButton;
  [(ICDocCamFilterButton *)&v9 awakeFromNib];
  v3 = [(ICDocCamFilterButton *)self inactiveBackgroundViewColor];
  objc_super v4 = [(ICDocCamFilterButton *)self backgroundView];
  [v4 setBackgroundColor:v3];

  v5 = [(ICDocCamFilterButton *)self inactiveTextColor];
  v6 = [(ICDocCamFilterButton *)self filterNameLabel];
  [v6 setTextColor:v5];

  v7 = [(ICDocCamFilterButton *)self filterIconView];
  [v7 setAccessibilityIgnoresInvertColors:1];

  v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:self selector:sel_updateForAccessibilityDarkerSystemColors_ name:*MEMORY[0x263F1CDF0] object:0];
}

- (void)setFilterType:(signed __int16)a3
{
  uint64_t v3 = a3;
  self->_filterType = a3;
  v5 = -[ICDocCamFilterButton imageForFilterType:](self, "imageForFilterType:");
  v6 = [(ICDocCamFilterButton *)self filterIconView];
  [v6 setImage:v5];

  id v8 = +[ICDocCamImageFilters localizedImageFilterNameForType:v3];
  v7 = [(ICDocCamFilterButton *)self filterNameLabel];
  [v7 setText:v8];
}

- (void)setIconSize:(double)a3
{
  id v4 = [(ICDocCamFilterButton *)self iconSizeConstraint];
  [v4 setConstant:a3];
}

- (double)iconSize
{
  v2 = [(ICDocCamFilterButton *)self iconSizeConstraint];
  [v2 constant];
  double v4 = v3;

  return v4;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ICDocCamFilterButton *)self isSelected] != a3)
  {
    if (v3) {
      [(ICDocCamFilterButton *)self activeBackgroundViewColor];
    }
    else {
    v5 = [(ICDocCamFilterButton *)self inactiveBackgroundViewColor];
    }
    v6 = [(ICDocCamFilterButton *)self backgroundView];
    [v6 setBackgroundColor:v5];

    if (v3) {
      [(ICDocCamFilterButton *)self activeBackgroundViewColor];
    }
    else {
    v7 = [(ICDocCamFilterButton *)self inactiveTextColor];
    }
    id v8 = [(ICDocCamFilterButton *)self filterNameLabel];
    [v8 setTextColor:v7];
  }
  v9.receiver = self;
  v9.super_class = (Class)ICDocCamFilterButton;
  [(ICDocCamFilterButton *)&v9 setSelected:v3];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ICDocCamFilterButton;
  uint64_t v5 = -[ICDocCamFilterButton hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ICDocCamFilterButton *)self isHighlighted] != a3)
  {
    if (v3) {
      double v5 = 0.5;
    }
    else {
      double v5 = 1.0;
    }
    v6 = [(ICDocCamFilterButton *)self filterIconView];
    [v6 setAlpha:v5];
  }
  v7.receiver = self;
  v7.super_class = (Class)ICDocCamFilterButton;
  [(ICDocCamFilterButton *)&v7 setHighlighted:v3];
}

- (UIColor)inactiveBackgroundViewColor
{
  return (UIColor *)[MEMORY[0x263F1C550] DCExtractedDocumentViewControllerBackgroundColor];
}

- (UIColor)inactiveTextColor
{
  return (UIColor *)[MEMORY[0x263F1C550] colorWithWhite:0.61 alpha:1.0];
}

- (UIColor)activeBackgroundViewColor
{
  v2 = [(ICDocCamFilterButton *)self tintColor];
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263F1C550], "dc_darkerAccessibilityColorForColor:", v2);

    v2 = (void *)v3;
  }

  return (UIColor *)v2;
}

- (id)imageForFilterType:(signed __int16)a3
{
  if (a3 > 4) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = off_2642A9E48[a3];
  }
  double v4 = (void *)MEMORY[0x263F1C6B0];
  double v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v4 imageNamed:v3 inBundle:v5 compatibleWithTraitCollection:0];

  if (!v6)
  {
    objc_super v7 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICDocCamFilterButton imageForFilterType:](v7);
    }
  }

  return v6;
}

+ (id)filterButtonWithType:(signed __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  double v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = NSStringFromClass((Class)a1);
  objc_super v7 = [v5 loadNibNamed:v6 owner:a1 options:0];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v13;

    if (v14) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_9:
  }
  v15 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    +[ICDocCamFilterButton filterButtonWithType:](v15);
  }

  id v14 = 0;
LABEL_14:
  objc_msgSend(v14, "setFilterType:", v3, (void)v17);
  [v14 setTranslatesAutoresizingMaskIntoConstraints:1];
  [v14 setNeedsLayout];
  [v14 layoutIfNeeded];

  return v14;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(ICDocCamFilterButton *)self filterNameLabel];
  uint64_t v3 = [v2 text];

  return v3;
}

- (CGRect)accessibilityFrame
{
  v2 = [(ICDocCamFilterButton *)self filterIconView];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)ICDocCamFilterButton;
  unint64_t v3 = [(ICDocCamFilterButton *)&v7 accessibilityTraits];
  int v4 = [(ICDocCamFilterButton *)self isSelected];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (void)updateForAccessibilityDarkerSystemColors:(id)a3
{
  if ([(ICDocCamFilterButton *)self isSelected])
  {
    id v5 = [(ICDocCamFilterButton *)self activeBackgroundViewColor];
    int v4 = [(ICDocCamFilterButton *)self backgroundView];
    [v4 setBackgroundColor:v5];
  }
}

- (signed)filterType
{
  return self->_filterType;
}

- (NSLayoutConstraint)labelVerticalSpacingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelVerticalSpacingConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setLabelVerticalSpacingConstraint:(id)a3
{
}

- (UILabel)filterNameLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterNameLabel);

  return (UILabel *)WeakRetained;
}

- (void)setFilterNameLabel:(id)a3
{
}

- (UIImageView)filterIconView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterIconView);

  return (UIImageView *)WeakRetained;
}

- (void)setFilterIconView:(id)a3
{
}

- (UIView)backgroundView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundView);

  return (UIView *)WeakRetained;
}

- (void)setBackgroundView:(id)a3
{
}

- (NSLayoutConstraint)iconSizeConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconSizeConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setIconSizeConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconSizeConstraint);
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_destroyWeak((id *)&self->_filterIconView);
  objc_destroyWeak((id *)&self->_filterNameLabel);

  objc_destroyWeak((id *)&self->_labelVerticalSpacingConstraint);
}

- (void)imageForFilterType:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "result";
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "invalid nil value for '%s'", (uint8_t *)&v1, 0xCu);
}

+ (void)filterButtonWithType:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "Unable to load date view", v1, 2u);
}

@end