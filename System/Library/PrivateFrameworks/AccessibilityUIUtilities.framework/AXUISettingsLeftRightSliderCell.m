@interface AXUISettingsLeftRightSliderCell
- (AXUISettingsLeftRightSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (BOOL)_accessibilityIgnoreInternalLabels;
- (double)displayValue;
- (id)labelColor;
- (id)newControl;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)setDisplayValue:(double)a3;
- (void)updateValue;
@end

@implementation AXUISettingsLeftRightSliderCell

- (BOOL)_accessibilityIgnoreInternalLabels
{
  return 1;
}

- (AXUISettingsLeftRightSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  v75.receiver = self;
  v75.super_class = (Class)AXUISettingsLeftRightSliderCell;
  v5 = [(PSSliderTableCell *)&v75 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    leftLabel = v5->_leftLabel;
    v5->_leftLabel = v6;

    uint64_t v8 = *MEMORY[0x1E4FB2950];
    v9 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [(UILabel *)v5->_leftLabel setFont:v9];

    v10 = AXUILocalizedStringForKey(@"LeftStereoBalanceIdentifier");
    [(UILabel *)v5->_leftLabel setText:v10];

    [(UILabel *)v5->_leftLabel setAdjustsFontForContentSizeCategory:1];
    v11 = [(AXUISettingsLeftRightSliderCell *)v5 labelColor];
    [(UILabel *)v5->_leftLabel setTextColor:v11];

    v12 = [(AXUISettingsLeftRightSliderCell *)v5 contentView];
    [v12 addSubview:v5->_leftLabel];

    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    rightLabel = v5->_rightLabel;
    v5->_rightLabel = v13;

    [(UILabel *)v5->_rightLabel setAdjustsFontForContentSizeCategory:1];
    v15 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:v8];
    [(UILabel *)v5->_rightLabel setFont:v15];

    [(UILabel *)v5->_rightLabel setAdjustsFontForContentSizeCategory:1];
    v16 = AXUILocalizedStringForKey(@"RightStereoBalanceIdentifier");
    [(UILabel *)v5->_rightLabel setText:v16];

    v17 = [(AXUISettingsLeftRightSliderCell *)v5 labelColor];
    [(UILabel *)v5->_rightLabel setTextColor:v17];

    v18 = [(AXUISettingsLeftRightSliderCell *)v5 contentView];
    [v18 addSubview:v5->_rightLabel];

    v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    valueLabel = v5->_valueLabel;
    v5->_valueLabel = v19;

    [(UILabel *)v5->_valueLabel setAdjustsFontForContentSizeCategory:1];
    v21 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:v8];
    [(UILabel *)v5->_valueLabel setFont:v21];

    v22 = [(AXUISettingsLeftRightSliderCell *)v5 labelColor];
    [(UILabel *)v5->_valueLabel setTextColor:v22];

    v23 = [(AXUISettingsLeftRightSliderCell *)v5 contentView];
    [v23 addSubview:v5->_valueLabel];

    [(UILabel *)v5->_leftLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v5->_rightLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v5->_valueLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v24 = (int)*MEMORY[0x1E4F92EF0];
    [*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + v24) setTranslatesAutoresizingMaskIntoConstraints:0];
    v25 = [(AXUISettingsLeftRightSliderCell *)v5 contentView];
    v26 = [v25 constraints];
    v27 = (void *)[v26 copy];

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v28 = v27;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v71 objects:v77 count:16];
    p_isa = (id *)&v5->super.super.super.super.super.super.super.isa;
    if (!v29) {
      goto LABEL_15;
    }
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v72;
    while (1)
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v72 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v71 + 1) + 8 * v32);
        v34 = [v33 firstAnchor];
        v35 = [*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + v24) topAnchor];
        if (v34 != v35)
        {

LABEL_9:
          goto LABEL_11;
        }
        v36 = [v33 secondAnchor];
        v37 = [(AXUISettingsLeftRightSliderCell *)v5 contentView];
        v38 = [v37 topAnchor];

        BOOL v39 = v36 == v38;
        v5 = (AXUISettingsLeftRightSliderCell *)p_isa;
        if (v39)
        {
          v34 = [p_isa contentView];
          [v34 removeConstraint:v33];
          goto LABEL_9;
        }
LABEL_11:
        ++v32;
      }
      while (v30 != v32);
      uint64_t v40 = [v28 countByEnumeratingWithState:&v71 objects:v77 count:16];
      uint64_t v30 = v40;
      if (!v40)
      {
LABEL_15:
        v61 = v28;

        v67 = [*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + v24) bottomAnchor];
        v68 = [(AXUISettingsLeftRightSliderCell *)v5 contentView];
        v66 = [v68 bottomAnchor];
        v65 = [v67 constraintEqualToAnchor:v66 constant:-10.0];
        v76[0] = v65;
        v64 = [(UILabel *)v5->_leftLabel bottomAnchor];
        v63 = [*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + v24) topAnchor];
        v62 = [v64 constraintEqualToAnchor:v63 constant:-10.0];
        v76[1] = v62;
        v60 = [(UILabel *)v5->_rightLabel bottomAnchor];
        v59 = [*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + v24) topAnchor];
        v58 = [v60 constraintEqualToAnchor:v59 constant:-10.0];
        v76[2] = v58;
        v57 = [(UILabel *)v5->_valueLabel bottomAnchor];
        v56 = [*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + v24) topAnchor];
        v55 = [v57 constraintEqualToAnchor:v56 constant:-10.0];
        v76[3] = v55;
        v54 = [(UILabel *)v5->_leftLabel leftAnchor];
        v53 = [*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + v24) leftAnchor];
        v52 = [v54 constraintEqualToAnchor:v53 constant:5.0];
        v76[4] = v52;
        v69 = [(UILabel *)v5->_rightLabel rightAnchor];
        v41 = [*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + v24) rightAnchor];
        v42 = objc_msgSend(v69, "constraintEqualToAnchor:constant:", -5.0);
        v76[5] = v42;
        v43 = [(UILabel *)v5->_valueLabel centerXAnchor];
        v44 = [*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + v24) centerXAnchor];
        v45 = [v43 constraintEqualToAnchor:v44 constant:0.0];
        v76[6] = v45;
        v46 = [p_isa contentView];
        v47 = [v46 topAnchor];
        v48 = [p_isa[151] topAnchor];
        v49 = [v47 constraintEqualToAnchor:v48 constant:-10.0];
        v76[7] = v49;
        v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:8];

        v5 = (AXUISettingsLeftRightSliderCell *)p_isa;
        [MEMORY[0x1E4F28DC8] activateConstraints:v50];

        return v5;
      }
    }
  }
  return v5;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AXUISettingsLeftRightSliderCell;
  [(PSTableCell *)&v3 layoutSubviews];
  [(AXUISettingsLeftRightSliderCell *)self updateValue];
}

- (void)setDisplayValue:(double)a3
{
  self->_displayValue = a3;
  [(AXUISettingsLeftRightSliderCell *)self updateValue];
}

- (void)updateValue
{
  objc_super v3 = NSString;
  [(AXUISettingsLeftRightSliderCell *)self displayValue];
  v5 = [v3 localizedStringWithFormat:@"%.2f", v4];
  [(UILabel *)self->_valueLabel setText:v5];

  uint64_t v6 = (int)*MEMORY[0x1E4F92EF0];
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v7 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v6);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__AXUISettingsLeftRightSliderCell_updateValue__block_invoke;
    v8[3] = &unk_1E649C388;
    objc_copyWeak(&v9, &location);
    [v7 _setAccessibilityValueBlock:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

id __46__AXUISettingsLeftRightSliderCell_updateValue__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained displayValue];
  float v3 = v2;

  if (v3 <= 0.0)
  {
    if (v3 >= 0.0)
    {
      v7 = AXFormatFloatWithPercentage();
      goto LABEL_7;
    }
    uint64_t v4 = AXFormatFloatWithPercentage();
    v5 = @"LEFT_RIGHT_BALANCE_VALUE_FORMAT_LEFT";
  }
  else
  {
    uint64_t v4 = AXFormatFloatWithPercentage();
    v5 = @"LEFT_RIGHT_BALANCE_VALUE_FORMAT_RIGHT";
  }
  uint64_t v6 = AXUILocalizedStringForKey(v5);
  v7 = objc_msgSend(NSString, "stringWithFormat:", v6, v4);

LABEL_7:
  return v7;
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (void)setAccessibilityLabel:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXUISettingsLeftRightSliderCell;
  id v4 = a3;
  [(AXUISettingsLeftRightSliderCell *)&v5 setAccessibilityLabel:v4];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92EF0]), "setAccessibilityLabel:", v4, v5.receiver, v5.super_class);
}

- (id)labelColor
{
  double v2 = [MEMORY[0x1E4F92E40] appearance];
  int v3 = [v2 usesDarkTheme];

  if (v3) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  id v4 = [MEMORY[0x1E4FB1618] labelColor];
  }
  return v4;
}

- (id)newControl
{
  double v2 = [AXUISettingsTickMarkSlider alloc];
  int v3 = -[AXUISettingsTickMarkSlider initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(AXUISettingsTickMarkSlider *)v3 setTicks:&unk_1F1F20308];
  return v3;
}

- (double)displayValue
{
  return self->_displayValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_rightLabel, 0);
  objc_storeStrong((id *)&self->_leftLabel, 0);
}

@end