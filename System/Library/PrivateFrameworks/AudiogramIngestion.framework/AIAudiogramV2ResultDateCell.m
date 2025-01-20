@interface AIAudiogramV2ResultDateCell
- (AIAudiogramResultDateCellDelegate)delegate;
- (AIAudiogramV2ResultDateCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (NSDate)date;
- (UIDatePicker)datePicker;
- (UILabel)titleLabel;
- (UIStackView)contentStackView;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_datePickerValueChanged:(id)a3;
- (void)configureLayout;
- (void)setContentStackView:(id)a3;
- (void)setDate:(id)a3;
- (void)setDatePicker:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation AIAudiogramV2ResultDateCell

- (AIAudiogramV2ResultDateCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v55[3] = *MEMORY[0x263EF8340];
  v53.receiver = self;
  v53.super_class = (Class)AIAudiogramV2ResultDateCell;
  v4 = [(AIAudiogramV2ResultDateCell *)&v53 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = objc_opt_new();
    [(AIAudiogramV2ResultDateCell *)v4 setTitleLabel:v5];

    v6 = aiLocString(@"AudiogramIngestionResultsDateV2");
    v7 = [(AIAudiogramV2ResultDateCell *)v4 titleLabel];
    [v7 setText:v6];

    v8 = [MEMORY[0x263F825C8] labelColor];
    v9 = [(AIAudiogramV2ResultDateCell *)v4 titleLabel];
    [v9 setTextColor:v8];

    v10 = [MEMORY[0x263F82760] _preferredFontForTextStyle:*MEMORY[0x263F83570] weight:*MEMORY[0x263F83648]];
    v11 = [(AIAudiogramV2ResultDateCell *)v4 titleLabel];
    [v11 setFont:v10];

    v12 = objc_opt_new();
    [(AIAudiogramV2ResultDateCell *)v4 setDatePicker:v12];

    v13 = [(AIAudiogramV2ResultDateCell *)v4 datePicker];
    [v13 setDatePickerMode:1];

    v14 = [(AIAudiogramV2ResultDateCell *)v4 datePicker];
    [v14 setPreferredDatePickerStyle:2];

    v15 = [MEMORY[0x263EFF910] now];
    v16 = [(AIAudiogramV2ResultDateCell *)v4 datePicker];
    [v16 setMaximumDate:v15];

    v17 = [(AIAudiogramV2ResultDateCell *)v4 datePicker];
    [v17 addTarget:v4 action:sel__datePickerValueChanged_ forControlEvents:4096];

    id v18 = objc_alloc(MEMORY[0x263F82BF8]);
    v19 = [(AIAudiogramV2ResultDateCell *)v4 titleLabel];
    v55[0] = v19;
    v20 = objc_opt_new();
    v55[1] = v20;
    v21 = [(AIAudiogramV2ResultDateCell *)v4 datePicker];
    v55[2] = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:3];
    v23 = (void *)[v18 initWithArrangedSubviews:v22];
    [(AIAudiogramV2ResultDateCell *)v4 setContentStackView:v23];

    v24 = [(AIAudiogramV2ResultDateCell *)v4 contentStackView];
    [v24 setAxis:0];

    v25 = [(AIAudiogramV2ResultDateCell *)v4 contentStackView];
    [v25 setDistribution:0];

    v26 = [(AIAudiogramV2ResultDateCell *)v4 contentStackView];
    [v26 setAlignment:0];

    v27 = [(AIAudiogramV2ResultDateCell *)v4 contentStackView];
    [v27 setTranslatesAutoresizingMaskIntoConstraints:0];

    v28 = [(AIAudiogramV2ResultDateCell *)v4 contentView];
    v29 = [(AIAudiogramV2ResultDateCell *)v4 contentStackView];
    [v28 addSubview:v29];

    v44 = (void *)MEMORY[0x263F08938];
    v52 = [(AIAudiogramV2ResultDateCell *)v4 contentStackView];
    v50 = [v52 leadingAnchor];
    v51 = [(AIAudiogramV2ResultDateCell *)v4 contentView];
    v49 = [v51 leadingAnchor];
    v48 = [v50 constraintEqualToAnchor:v49 constant:16.0];
    v54[0] = v48;
    v47 = [(AIAudiogramV2ResultDateCell *)v4 contentStackView];
    v45 = [v47 trailingAnchor];
    v46 = [(AIAudiogramV2ResultDateCell *)v4 contentView];
    v43 = [v46 trailingAnchor];
    v42 = [v45 constraintEqualToAnchor:v43 constant:-10.0];
    v54[1] = v42;
    v41 = [(AIAudiogramV2ResultDateCell *)v4 contentStackView];
    v40 = [v41 topAnchor];
    v30 = [(AIAudiogramV2ResultDateCell *)v4 contentView];
    v31 = [v30 topAnchor];
    v32 = [v40 constraintEqualToAnchor:v31 constant:5.0];
    v54[2] = v32;
    v33 = [(AIAudiogramV2ResultDateCell *)v4 contentStackView];
    v34 = [v33 bottomAnchor];
    v35 = [(AIAudiogramV2ResultDateCell *)v4 contentView];
    v36 = [v35 bottomAnchor];
    v37 = [v34 constraintEqualToAnchor:v36 constant:-5.0];
    v54[3] = v37;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:4];
    [v44 activateConstraints:v38];
  }
  return v4;
}

- (void)setDate:(id)a3
{
  id v4 = a3;
  id v5 = [(AIAudiogramV2ResultDateCell *)self datePicker];
  [v5 setDate:v4];
}

- (void)_datePickerValueChanged:(id)a3
{
  id v4 = a3;
  id v6 = [(AIAudiogramV2ResultDateCell *)self delegate];
  id v5 = [v4 date];

  [v6 dateCellDidPickDate:v5];
}

- (void)configureLayout
{
  v21[1] = *MEMORY[0x263EF8340];
  v3 = [(AIAudiogramV2ResultDateCell *)self titleLabel];
  id v4 = [v3 text];
  [(AIAudiogramV2ResultDateCell *)self frame];
  double v6 = v5;
  double v8 = v7;
  uint64_t v20 = *MEMORY[0x263F82270];
  v9 = [(AIAudiogramV2ResultDateCell *)self titleLabel];
  v10 = [v9 font];
  v21[0] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 32, v11, 0, v6, v8);
  *(float *)&double v6 = CGRectGetWidth(v22);

  v12 = [(AIAudiogramV2ResultDateCell *)self contentView];
  [v12 frame];
  double v14 = v13 * 0.4;

  v15 = [(AIAudiogramV2ResultDateCell *)self contentStackView];
  v16 = v15;
  if (v14 >= *(float *)&v6)
  {
    [v15 setAxis:0];

    v17 = [(AIAudiogramV2ResultDateCell *)self contentStackView];
    id v18 = v17;
    uint64_t v19 = 0;
  }
  else
  {
    [v15 setAxis:1];

    v17 = [(AIAudiogramV2ResultDateCell *)self contentStackView];
    id v18 = v17;
    uint64_t v19 = 1;
  }
  [v17 setAlignment:v19];
}

- (BOOL)isAccessibilityElement
{
  return AXRequestingClient() == 3;
}

- (id)accessibilityLabel
{
  v2 = [(AIAudiogramV2ResultDateCell *)self titleLabel];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = (void *)MEMORY[0x263F08790];
  v3 = [(AIAudiogramV2ResultDateCell *)self datePicker];
  id v4 = [v3 date];
  double v5 = [v2 localizedStringFromDate:v4 dateStyle:3 timeStyle:0];

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F83260];
}

- (BOOL)accessibilityActivate
{
  v3 = [(AIAudiogramV2ResultDateCell *)self datePicker];
  id v4 = [v3 subviews];
  double v5 = [v4 firstObject];
  char v6 = [v5 accessibilityActivate];

  if (v6) {
    return 1;
  }
  v8.receiver = self;
  v8.super_class = (Class)AIAudiogramV2ResultDateCell;
  return [(AIAudiogramV2ResultDateCell *)&v8 accessibilityActivate];
}

- (AIAudiogramResultDateCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AIAudiogramResultDateCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (void)setDatePicker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end