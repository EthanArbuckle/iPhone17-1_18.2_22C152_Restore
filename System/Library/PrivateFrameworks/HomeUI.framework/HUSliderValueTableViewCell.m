@interface HUSliderValueTableViewCell
- (BOOL)isContinuous;
- (BOOL)isDisabled;
- (BOOL)showValue;
- (BOOL)useLargeCell;
- (HFItem)item;
- (HUSliderValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUSliderValueTableViewCellDelegate)delegate;
- (NSArray)constraints;
- (NSString)title;
- (UIImage)maximumValueImage;
- (UIImage)minimumValueImage;
- (UILabel)valueLabel;
- (UISlider)slider;
- (double)maximumValue;
- (double)minimumValue;
- (double)value;
- (void)_setupAutoLayoutConstraints;
- (void)_sliderChanged:(id)a3;
- (void)didMoveToSuperview;
- (void)prepareForReuse;
- (void)setConstraints:(id)a3;
- (void)setContinuous:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setMaximumValue:(double)a3;
- (void)setMaximumValueImage:(id)a3;
- (void)setMinimumValue:(double)a3;
- (void)setMinimumValueImage:(id)a3;
- (void)setShowValue:(BOOL)a3;
- (void)setSlider:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUseLargeCell:(BOOL)a3;
- (void)setValue:(double)a3;
- (void)setValueLabel:(id)a3;
@end

@implementation HUSliderValueTableViewCell

- (HUSliderValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)HUSliderValueTableViewCell;
  v4 = [(HUSliderValueTableViewCell *)&v20 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F42DF0]);
    [(HUSliderValueTableViewCell *)v4 setSlider:v5];

    v6 = [(HUSliderValueTableViewCell *)v4 slider];
    [v6 setMinimumValue:0.0];

    v7 = [(HUSliderValueTableViewCell *)v4 slider];
    LODWORD(v8) = 1120403456;
    [v7 setMaximumValue:v8];

    v9 = [(HUSliderValueTableViewCell *)v4 slider];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    v10 = [(HUSliderValueTableViewCell *)v4 slider];
    [v10 addTarget:v4 action:sel__sliderChanged_ forControlEvents:4096];

    v11 = [(HUSliderValueTableViewCell *)v4 contentView];
    v12 = [(HUSliderValueTableViewCell *)v4 slider];
    [v11 addSubview:v12];

    id v13 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [(HUSliderValueTableViewCell *)v4 setValueLabel:v13];

    v14 = [(HUSliderValueTableViewCell *)v4 valueLabel];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

    [(HUSliderValueTableViewCell *)v4 setValue:0.0];
    v15 = [(HUSliderValueTableViewCell *)v4 contentView];
    v16 = [(HUSliderValueTableViewCell *)v4 valueLabel];
    [v15 addSubview:v16];

    v17 = [(HUSliderValueTableViewCell *)v4 textLabel];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

    v18 = [(HUSliderValueTableViewCell *)v4 textLabel];
    [v18 setHidden:1];

    [(HUSliderValueTableViewCell *)v4 setShowValue:1];
  }
  return v4;
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)HUSliderValueTableViewCell;
  [(HUSliderValueTableViewCell *)&v3 didMoveToSuperview];
  [(HUSliderValueTableViewCell *)self _setupAutoLayoutConstraints];
}

- (void)setContinuous:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUSliderValueTableViewCell *)self slider];
  [v4 setContinuous:v3];
}

- (BOOL)isContinuous
{
  v2 = [(HUSliderValueTableViewCell *)self slider];
  char v3 = [v2 isContinuous];

  return v3;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)HUSliderValueTableViewCell;
  [(HUSliderValueTableViewCell *)&v4 prepareForReuse];
  [(HUSliderValueTableViewCell *)self setShowValue:1];
  char v3 = [(HUSliderValueTableViewCell *)self textLabel];
  [v3 setHidden:1];

  [(HUSliderValueTableViewCell *)self setUseLargeCell:0];
}

- (double)minimumValue
{
  v2 = [(HUSliderValueTableViewCell *)self slider];
  [v2 minimumValue];
  double v4 = v3;

  return v4;
}

- (void)setMinimumValue:(double)a3
{
  float v3 = a3;
  id v5 = [(HUSliderValueTableViewCell *)self slider];
  *(float *)&double v4 = v3;
  [v5 setMinimumValue:v4];
}

- (double)maximumValue
{
  v2 = [(HUSliderValueTableViewCell *)self slider];
  [v2 maximumValue];
  double v4 = v3;

  return v4;
}

- (void)setMaximumValue:(double)a3
{
  float v3 = a3;
  id v5 = [(HUSliderValueTableViewCell *)self slider];
  *(float *)&double v4 = v3;
  [v5 setMaximumValue:v4];
}

- (double)value
{
  v2 = [(HUSliderValueTableViewCell *)self slider];
  [v2 value];
  double v4 = v3;

  return v4;
}

- (void)setValue:(double)a3
{
  float v5 = a3;
  v6 = [(HUSliderValueTableViewCell *)self slider];
  *(float *)&double v7 = v5;
  [v6 setValue:v7];

  double v8 = [(HUSliderValueTableViewCell *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v13 = [(HUSliderValueTableViewCell *)self delegate];
    v10 = [(HUSliderValueTableViewCell *)self item];
    v11 = [v13 valueDescriptionForItem:v10 value:a3];
    v12 = [(HUSliderValueTableViewCell *)self valueLabel];
    [v12 setText:v11];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%.1f", *(void *)&a3);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v10 = [(HUSliderValueTableViewCell *)self valueLabel];
    [v10 setText:v13];
  }
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  v6 = [(HUSliderValueTableViewCell *)self textLabel];
  [v6 setText:v5];

  id v7 = [(HUSliderValueTableViewCell *)self textLabel];
  [v7 setHidden:0];
}

- (void)_sliderChanged:(id)a3
{
  double v4 = [(HUSliderValueTableViewCell *)self slider];
  [v4 value];
  [(HUSliderValueTableViewCell *)self setValue:v5];

  id v6 = [(HUSliderValueTableViewCell *)self delegate];
  [(HUSliderValueTableViewCell *)self value];
  objc_msgSend(v6, "sliderValueTableViewCell:didChangeValue:", self);
}

- (void)setShowValue:(BOOL)a3
{
  if (self->_showValue != a3)
  {
    self->_showValue = a3;
    uint64_t v4 = [(HUSliderValueTableViewCell *)self showValue] ^ 1;
    float v5 = [(HUSliderValueTableViewCell *)self valueLabel];
    [v5 setHidden:v4];

    [(HUSliderValueTableViewCell *)self _setupAutoLayoutConstraints];
  }
}

- (UIImage)minimumValueImage
{
  v2 = [(HUSliderValueTableViewCell *)self slider];
  float v3 = [v2 minimumValueImage];

  return (UIImage *)v3;
}

- (void)setMinimumValueImage:(id)a3
{
  id v4 = a3;
  id v5 = [(HUSliderValueTableViewCell *)self slider];
  [v5 setMinimumValueImage:v4];
}

- (UIImage)maximumValueImage
{
  v2 = [(HUSliderValueTableViewCell *)self slider];
  float v3 = [v2 maximumValueImage];

  return (UIImage *)v3;
}

- (void)setMaximumValueImage:(id)a3
{
  id v4 = a3;
  id v5 = [(HUSliderValueTableViewCell *)self slider];
  [v5 setMaximumValueImage:v4];
}

- (void)setUseLargeCell:(BOOL)a3
{
  if (self->_useLargeCell != a3)
  {
    self->_useLargeCell = a3;
    [(HUSliderValueTableViewCell *)self _setupAutoLayoutConstraints];
  }
}

- (BOOL)isDisabled
{
  v2 = [(HUSliderValueTableViewCell *)self slider];
  char v3 = [v2 isEnabled];

  return v3;
}

- (void)setDisabled:(BOOL)a3
{
  BOOL v5 = !a3;
  id v6 = [(HUSliderValueTableViewCell *)self slider];
  [v6 setEnabled:v5];

  [(HUSliderValueTableViewCell *)self setUserInteractionEnabled:v5];
  if (a3) {
    [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else {
  id v9 = [MEMORY[0x1E4F428B8] labelColor];
  }
  id v7 = [(HUSliderValueTableViewCell *)self textLabel];
  [v7 setTextColor:v9];

  double v8 = [(HUSliderValueTableViewCell *)self valueLabel];
  [v8 setTextColor:v9];

  [(HUSliderValueTableViewCell *)self setTextColor:v9];
}

- (void)_setupAutoLayoutConstraints
{
  char v3 = [(HUSliderValueTableViewCell *)self constraints];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC8];
    BOOL v5 = [(HUSliderValueTableViewCell *)self constraints];
    [v4 deactivateConstraints:v5];
  }
  id v95 = [MEMORY[0x1E4F1CA48] array];
  if ([(HUSliderValueTableViewCell *)self useLargeCell])
  {
    id v6 = [(HUSliderValueTableViewCell *)self textLabel];
    id v7 = [v6 topAnchor];
    double v8 = [(HUSliderValueTableViewCell *)self contentView];
    id v9 = [v8 readableContentGuide];
    v10 = [v9 topAnchor];
    v11 = [v7 constraintEqualToAnchor:v10];
    [v95 addObject:v11];

    v12 = [(HUSliderValueTableViewCell *)self textLabel];
    id v13 = [v12 leadingAnchor];
    v14 = [(HUSliderValueTableViewCell *)self contentView];
    v15 = [v14 readableContentGuide];
    v16 = [v15 leadingAnchor];
    v17 = [v13 constraintEqualToAnchor:v16];
    [v95 addObject:v17];

    v18 = [(HUSliderValueTableViewCell *)self valueLabel];
    v19 = [v18 centerYAnchor];
    objc_super v20 = [(HUSliderValueTableViewCell *)self textLabel];
    v21 = [v20 centerYAnchor];
    v22 = [v19 constraintEqualToAnchor:v21];
    [v95 addObject:v22];

    v23 = [(HUSliderValueTableViewCell *)self valueLabel];
    v24 = [v23 trailingAnchor];
    v25 = [(HUSliderValueTableViewCell *)self contentView];
    v26 = [v25 readableContentGuide];
    v27 = [v26 trailingAnchor];
    v28 = [v24 constraintEqualToAnchor:v27];
    [v95 addObject:v28];

    v29 = [(HUSliderValueTableViewCell *)self slider];
    v30 = [v29 topAnchor];
    v31 = [(HUSliderValueTableViewCell *)self textLabel];
    v32 = [v31 bottomAnchor];
    v33 = [v30 constraintEqualToAnchor:v32 constant:12.0];
    [v95 addObject:v33];

    v34 = [(HUSliderValueTableViewCell *)self slider];
    v35 = [v34 leadingAnchor];
    v36 = [(HUSliderValueTableViewCell *)self contentView];
    v37 = [v36 readableContentGuide];
    v38 = [v37 leadingAnchor];
    v39 = [v35 constraintEqualToAnchor:v38];
    [v95 addObject:v39];

    v40 = [(HUSliderValueTableViewCell *)self slider];
    v41 = [v40 trailingAnchor];
    v42 = [(HUSliderValueTableViewCell *)self contentView];
    v43 = [v42 readableContentGuide];
    v44 = [v43 trailingAnchor];
    v45 = [v41 constraintEqualToAnchor:v44];
    [v95 addObject:v45];

    v46 = [(HUSliderValueTableViewCell *)self slider];
  }
  else
  {
    BOOL v47 = [(HUSliderValueTableViewCell *)self showValue];
    v48 = [(HUSliderValueTableViewCell *)self slider];
    v49 = [v48 leadingAnchor];
    v50 = [(HUSliderValueTableViewCell *)self contentView];
    v51 = [v50 readableContentGuide];
    v52 = [v51 leadingAnchor];
    v53 = [v49 constraintEqualToAnchor:v52];
    [v95 addObject:v53];

    v54 = [(HUSliderValueTableViewCell *)self slider];
    v55 = [v54 topAnchor];
    v56 = [(HUSliderValueTableViewCell *)self contentView];
    v57 = [v56 readableContentGuide];
    v58 = [v57 topAnchor];
    v59 = [v55 constraintEqualToAnchor:v58];
    [v95 addObject:v59];

    v60 = [(HUSliderValueTableViewCell *)self slider];
    v61 = [v60 bottomAnchor];
    v62 = [(HUSliderValueTableViewCell *)self contentView];
    v63 = [v62 readableContentGuide];
    v64 = [v63 bottomAnchor];
    v65 = [v61 constraintEqualToAnchor:v64];
    [v95 addObject:v65];

    v66 = [(HUSliderValueTableViewCell *)self slider];
    v67 = [v66 trailingAnchor];
    v68 = [(HUSliderValueTableViewCell *)self contentView];
    v69 = [v68 readableContentGuide];
    v70 = [v69 trailingAnchor];
    v71 = [v67 constraintEqualToAnchor:v70];
    [v95 addObject:v71];

    if (v47) {
      goto LABEL_8;
    }
    v72 = [(HUSliderValueTableViewCell *)self valueLabel];
    v73 = [v72 leadingAnchor];
    v74 = [(HUSliderValueTableViewCell *)self slider];
    v75 = [v74 trailingAnchor];
    v76 = [v73 constraintEqualToAnchor:v75 constant:12.0];
    [v95 addObject:v76];

    v77 = [(HUSliderValueTableViewCell *)self valueLabel];
    v78 = [v77 trailingAnchor];
    v79 = [(HUSliderValueTableViewCell *)self contentView];
    v80 = [v79 readableContentGuide];
    v81 = [v80 trailingAnchor];
    v82 = [v78 constraintEqualToAnchor:v81];
    [v95 addObject:v82];

    v83 = [(HUSliderValueTableViewCell *)self valueLabel];
    v84 = [v83 topAnchor];
    v85 = [(HUSliderValueTableViewCell *)self contentView];
    v86 = [v85 readableContentGuide];
    v87 = [v86 topAnchor];
    v88 = [v84 constraintEqualToAnchor:v87];
    [v95 addObject:v88];

    v46 = [(HUSliderValueTableViewCell *)self valueLabel];
  }
  v89 = v46;
  v90 = [v46 bottomAnchor];
  v91 = [(HUSliderValueTableViewCell *)self contentView];
  v92 = [v91 readableContentGuide];
  v93 = [v92 bottomAnchor];
  v94 = [v90 constraintEqualToAnchor:v93];
  [v95 addObject:v94];

LABEL_8:
  [(HUSliderValueTableViewCell *)self setConstraints:v95];
  [MEMORY[0x1E4F28DC8] activateConstraints:v95];
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (HUSliderValueTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUSliderValueTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showValue
{
  return self->_showValue;
}

- (BOOL)useLargeCell
{
  return self->_useLargeCell;
}

- (NSString)title
{
  return self->_title;
}

- (UISlider)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_item, 0);
}

@end