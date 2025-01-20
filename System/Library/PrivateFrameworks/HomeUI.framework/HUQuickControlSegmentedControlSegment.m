@interface HUQuickControlSegmentedControlSegment
+ (double)borderInset;
+ (id)highlightedColor;
+ (id)selectedColor;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (HUQuickControlSegmentedControlSegment)initWithFrame:(CGRect)a3;
- (NSString)title;
- (UILabel)titleLabel;
- (unint64_t)roundedCorners;
- (void)_setupConstraints;
- (void)_updateBackgroundColor;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setRoundedCorners:(unint64_t)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation HUQuickControlSegmentedControlSegment

+ (id)selectedColor
{
  return (id)[MEMORY[0x1E4F428B8] colorWithWhite:0.5 alpha:0.3];
}

+ (id)highlightedColor
{
  return (id)[MEMORY[0x1E4F428B8] colorWithWhite:0.5 alpha:0.1];
}

+ (double)borderInset
{
  return 1.0;
}

- (HUQuickControlSegmentedControlSegment)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)HUQuickControlSegmentedControlSegment;
  v3 = -[HUQuickControlSegmentedControlSegment initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [(HUQuickControlSegmentedControlSegment *)v3 setTitleLabel:v4];

    v5 = [(HUQuickControlSegmentedControlSegment *)v3 titleLabel];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    v6 = [(HUQuickControlSegmentedControlSegment *)v3 titleLabel];
    [v6 setTextAlignment:1];

    v7 = [MEMORY[0x1E4F428B8] systemGrayColor];
    v8 = [(HUQuickControlSegmentedControlSegment *)v3 titleLabel];
    [v8 setTextColor:v7];

    v9 = HUPillButtonTitleFont();
    v10 = [(HUQuickControlSegmentedControlSegment *)v3 titleLabel];
    [v10 setFont:v9];

    v11 = [(HUQuickControlSegmentedControlSegment *)v3 titleLabel];
    [(HUQuickControlSegmentedControlSegment *)v3 addSubview:v11];

    v12 = [(HUQuickControlSegmentedControlSegment *)v3 titleLabel];
    LODWORD(v13) = 1148846080;
    [v12 setContentHuggingPriority:0 forAxis:v13];

    v14 = [(HUQuickControlSegmentedControlSegment *)v3 titleLabel];
    LODWORD(v15) = 1148846080;
    [v14 setContentHuggingPriority:1 forAxis:v15];

    v16 = [(HUQuickControlSegmentedControlSegment *)v3 titleLabel];
    LODWORD(v17) = 1148846080;
    [v16 setContentCompressionResistancePriority:0 forAxis:v17];

    v18 = [(HUQuickControlSegmentedControlSegment *)v3 titleLabel];
    LODWORD(v19) = 1148846080;
    [v18 setContentCompressionResistancePriority:1 forAxis:v19];

    [(HUQuickControlSegmentedControlSegment *)v3 _setupConstraints];
  }
  return v3;
}

- (NSString)title
{
  v2 = [(HUQuickControlSegmentedControlSegment *)self titleLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(HUQuickControlSegmentedControlSegment *)self titleLabel];
  [v5 setText:v4];
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
  [(HUQuickControlSegmentedControlSegment *)self _updateBackgroundColor];
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  [(HUQuickControlSegmentedControlSegment *)self _updateBackgroundColor];
}

- (void)setRoundedCorners:(unint64_t)a3
{
  if (self->_roundedCorners != a3)
  {
    self->_roundedCorners = a3;
    unint64_t v4 = a3 & 0xF;
    id v5 = [(HUQuickControlSegmentedControlSegment *)self layer];
    [v5 setMaskedCorners:v4];

    [(HUQuickControlSegmentedControlSegment *)self setNeedsLayout];
  }
}

- (void)_updateBackgroundColor
{
  if ([(HUQuickControlSegmentedControlSegment *)self isSelected])
  {
    uint64_t v3 = [(id)objc_opt_class() selectedColor];
LABEL_5:
    id v4 = (id)v3;
    [(HUQuickControlSegmentedControlSegment *)self setBackgroundColor:v3];

    return;
  }
  if ([(HUQuickControlSegmentedControlSegment *)self isHighlighted])
  {
    uint64_t v3 = [(id)objc_opt_class() highlightedColor];
    goto LABEL_5;
  }

  [(HUQuickControlSegmentedControlSegment *)self setBackgroundColor:0];
}

- (void)_setupConstraints
{
  id v32 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [(HUQuickControlSegmentedControlSegment *)self titleLabel];
  id v4 = [v3 centerXAnchor];
  id v5 = [(HUQuickControlSegmentedControlSegment *)self centerXAnchor];
  v6 = [v4 constraintEqualToAnchor:v5];
  [v32 addObject:v6];

  v7 = [(HUQuickControlSegmentedControlSegment *)self titleLabel];
  v8 = [v7 firstBaselineAnchor];
  v9 = [(HUQuickControlSegmentedControlSegment *)self topAnchor];
  [(id)objc_opt_class() borderInset];
  v11 = [v8 constraintEqualToAnchor:v9 constant:20.0 - v10];

  LODWORD(v12) = 1144750080;
  [v11 setPriority:v12];
  [v32 addObject:v11];
  double v13 = [(HUQuickControlSegmentedControlSegment *)self titleLabel];
  v14 = [v13 topAnchor];
  double v15 = [(HUQuickControlSegmentedControlSegment *)self topAnchor];
  v16 = [v14 constraintGreaterThanOrEqualToAnchor:v15];
  [v32 addObject:v16];

  double v17 = [(HUQuickControlSegmentedControlSegment *)self titleLabel];
  v18 = [v17 lastBaselineAnchor];
  double v19 = [(HUQuickControlSegmentedControlSegment *)self bottomAnchor];
  [(id)objc_opt_class() borderInset];
  objc_super v21 = [v18 constraintEqualToAnchor:v19 constant:-(10.0 - v20)];
  [v32 addObject:v21];

  v22 = [(HUQuickControlSegmentedControlSegment *)self widthAnchor];
  v23 = [(HUQuickControlSegmentedControlSegment *)self titleLabel];
  v24 = [v23 widthAnchor];
  v25 = [v22 constraintEqualToAnchor:v24 constant:32.0];
  [v32 addObject:v25];

  v26 = [(HUQuickControlSegmentedControlSegment *)self titleLabel];
  v27 = [v26 centerXAnchor];
  v28 = [(HUQuickControlSegmentedControlSegment *)self centerXAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  [v32 addObject:v29];

  v30 = [(HUQuickControlSegmentedControlSegment *)self widthAnchor];
  v31 = [v30 constraintGreaterThanOrEqualToConstant:114.0];
  [v32 addObject:v31];

  [MEMORY[0x1E4F28DC8] activateConstraints:v32];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlSegmentedControlSegment;
  [(HUQuickControlSegmentedControlSegment *)&v6 layoutSubviews];
  if ([(HUQuickControlSegmentedControlSegment *)self roundedCorners])
  {
    [(HUQuickControlSegmentedControlSegment *)self bounds];
    double v4 = v3 * 0.5;
    id v5 = [(HUQuickControlSegmentedControlSegment *)self layer];
    [v5 setCornerRadius:v4];
  }
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (unint64_t)roundedCorners
{
  return self->_roundedCorners;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end