@interface AIAudiogramResultDateCell
- (AIAudiogramResultDateCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (AIAudiogramResultDateCellDelegate)delegate;
- (NSArray)expandedConstraints;
- (NSDate)date;
- (NSLayoutConstraint)collapsedConstraint;
- (UIDatePicker)datePicker;
- (UILabel)titleLabel;
- (UILabel)valueLabel;
- (UIStackView)labelStackView;
- (unint64_t)accessibilityTraits;
- (void)_datePickerValueChanged:(id)a3;
- (void)configureLayout;
- (void)setCollapsedConstraint:(id)a3;
- (void)setDate:(id)a3;
- (void)setDatePicker:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpandedConstraints:(id)a3;
- (void)setLabelStackView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setValueLabel:(id)a3;
- (void)showActive:(BOOL)a3;
@end

@implementation AIAudiogramResultDateCell

- (AIAudiogramResultDateCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v88[2] = *MEMORY[0x263EF8340];
  v85.receiver = self;
  v85.super_class = (Class)AIAudiogramResultDateCell;
  v4 = [(AIAudiogramResultDateCell *)&v85 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    BOOL v6 = objc_msgSend(MEMORY[0x263F82E00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[AIAudiogramResultDateCell semanticContentAttribute](v4, "semanticContentAttribute")) != 1;
    v7 = objc_opt_new();
    [(AIAudiogramResultDateCell *)v5 setTitleLabel:v7];

    v8 = aiLocString(@"AudiogramIngestionResultsDate");
    v9 = [(AIAudiogramResultDateCell *)v5 titleLabel];
    [v9 setText:v8];

    v10 = [MEMORY[0x263F825C8] labelColor];
    v11 = [(AIAudiogramResultDateCell *)v5 titleLabel];
    [v11 setTextColor:v10];

    uint64_t v12 = *MEMORY[0x263F83570];
    v13 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    v14 = [(AIAudiogramResultDateCell *)v5 titleLabel];
    [v14 setFont:v13];

    v15 = objc_opt_new();
    [(AIAudiogramResultDateCell *)v5 setValueLabel:v15];

    v16 = [(AIAudiogramResultDateCell *)v5 valueLabel];
    [v16 setTextAlignment:2 * v6];

    v17 = [MEMORY[0x263F825C8] secondaryLabelColor];
    v18 = [(AIAudiogramResultDateCell *)v5 valueLabel];
    [v18 setTextColor:v17];

    v19 = [MEMORY[0x263F82760] preferredFontForTextStyle:v12];
    v20 = [(AIAudiogramResultDateCell *)v5 valueLabel];
    [v20 setFont:v19];

    id v21 = objc_alloc(MEMORY[0x263F82BF8]);
    v22 = [(AIAudiogramResultDateCell *)v5 titleLabel];
    v88[0] = v22;
    v23 = [(AIAudiogramResultDateCell *)v5 valueLabel];
    v88[1] = v23;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:2];
    v25 = (void *)[v21 initWithArrangedSubviews:v24];
    [(AIAudiogramResultDateCell *)v5 setLabelStackView:v25];

    v26 = [(AIAudiogramResultDateCell *)v5 labelStackView];
    [v26 setAxis:0];

    v27 = [(AIAudiogramResultDateCell *)v5 labelStackView];
    [v27 setDistribution:0];

    v28 = [(AIAudiogramResultDateCell *)v5 labelStackView];
    [v28 setAlignment:0];

    v29 = [(AIAudiogramResultDateCell *)v5 labelStackView];
    [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

    v30 = [(AIAudiogramResultDateCell *)v5 contentView];
    v31 = [(AIAudiogramResultDateCell *)v5 labelStackView];
    [v30 addSubview:v31];

    v32 = objc_opt_new();
    [(AIAudiogramResultDateCell *)v5 setDatePicker:v32];

    v33 = [(AIAudiogramResultDateCell *)v5 datePicker];
    [v33 setDatePickerMode:1];

    v34 = [(AIAudiogramResultDateCell *)v5 datePicker];
    [v34 setPreferredDatePickerStyle:3];

    v35 = [(AIAudiogramResultDateCell *)v5 datePicker];
    [v35 setTranslatesAutoresizingMaskIntoConstraints:0];

    v36 = [(AIAudiogramResultDateCell *)v5 datePicker];
    [v36 setHidden:1];

    v37 = [(AIAudiogramResultDateCell *)v5 datePicker];
    [v37 addTarget:v5 action:sel__datePickerValueChanged_ forControlEvents:4096];

    v38 = [(AIAudiogramResultDateCell *)v5 contentView];
    v39 = [(AIAudiogramResultDateCell *)v5 datePicker];
    [v38 addSubview:v39];

    v40 = [(AIAudiogramResultDateCell *)v5 labelStackView];
    v41 = [v40 bottomAnchor];
    v42 = [(AIAudiogramResultDateCell *)v5 contentView];
    v43 = [v42 bottomAnchor];
    v44 = [v41 constraintEqualToAnchor:v43 constant:-16.0];
    [(AIAudiogramResultDateCell *)v5 setCollapsedConstraint:v44];

    v83 = [(AIAudiogramResultDateCell *)v5 labelStackView];
    v81 = [v83 bottomAnchor];
    v45 = [(AIAudiogramResultDateCell *)v5 datePicker];
    v46 = [v45 topAnchor];
    v47 = [v81 constraintEqualToAnchor:v46 constant:-16.0];
    v87[0] = v47;
    v48 = [(AIAudiogramResultDateCell *)v5 datePicker];
    v49 = [v48 bottomAnchor];
    v50 = [(AIAudiogramResultDateCell *)v5 contentView];
    v51 = [v50 bottomAnchor];
    v52 = [v49 constraintEqualToAnchor:v51 constant:-16.0];
    v87[1] = v52;
    v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:2];
    [(AIAudiogramResultDateCell *)v5 setExpandedConstraints:v53];

    v71 = (void *)MEMORY[0x263F08938];
    v84 = [(AIAudiogramResultDateCell *)v5 labelStackView];
    v80 = [v84 leadingAnchor];
    v82 = [(AIAudiogramResultDateCell *)v5 contentView];
    v79 = [v82 leadingAnchor];
    v78 = [v80 constraintEqualToAnchor:v79 constant:16.0];
    v86[0] = v78;
    v77 = [(AIAudiogramResultDateCell *)v5 labelStackView];
    v75 = [v77 trailingAnchor];
    v76 = [(AIAudiogramResultDateCell *)v5 contentView];
    v74 = [v76 trailingAnchor];
    v73 = [v75 constraintEqualToAnchor:v74 constant:-16.0];
    v86[1] = v73;
    v72 = [(AIAudiogramResultDateCell *)v5 labelStackView];
    v69 = [v72 topAnchor];
    v70 = [(AIAudiogramResultDateCell *)v5 contentView];
    v68 = [v70 topAnchor];
    v67 = [v69 constraintEqualToAnchor:v68 constant:16.0];
    v86[2] = v67;
    v66 = [(AIAudiogramResultDateCell *)v5 collapsedConstraint];
    v86[3] = v66;
    v65 = [(AIAudiogramResultDateCell *)v5 datePicker];
    v64 = [v65 leadingAnchor];
    v54 = [(AIAudiogramResultDateCell *)v5 contentView];
    v55 = [v54 leadingAnchor];
    v56 = [v64 constraintEqualToAnchor:v55 constant:16.0];
    v86[4] = v56;
    v57 = [(AIAudiogramResultDateCell *)v5 datePicker];
    v58 = [v57 trailingAnchor];
    v59 = [(AIAudiogramResultDateCell *)v5 contentView];
    v60 = [v59 trailingAnchor];
    v61 = [v58 constraintEqualToAnchor:v60 constant:-16.0];
    v86[5] = v61;
    v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:6];
    [v71 activateConstraints:v62];
  }
  return v5;
}

- (void)configureLayout
{
  v33[1] = *MEMORY[0x263EF8340];
  v3 = [(AIAudiogramResultDateCell *)self titleLabel];
  v4 = [v3 text];
  [(AIAudiogramResultDateCell *)self frame];
  double v6 = v5;
  double v8 = v7;
  uint64_t v32 = *MEMORY[0x263F82270];
  uint64_t v9 = v32;
  v10 = [(AIAudiogramResultDateCell *)self titleLabel];
  v11 = [v10 font];
  v33[0] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
  objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 32, v12, 0, v6, v8);
  float Width = CGRectGetWidth(v34);

  v14 = [(AIAudiogramResultDateCell *)self valueLabel];
  v15 = [v14 text];
  [(AIAudiogramResultDateCell *)self frame];
  double v17 = v16;
  double v19 = v18;
  uint64_t v30 = v9;
  v20 = [(AIAudiogramResultDateCell *)self valueLabel];
  id v21 = [v20 font];
  v31 = v21;
  v22 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  objc_msgSend(v15, "boundingRectWithSize:options:attributes:context:", 32, v22, 0, v17, v19);
  *(float *)&double v17 = CGRectGetWidth(v35);

  [(AIAudiogramResultDateCell *)self frame];
  CGFloat v23 = CGRectGetWidth(v36) * 0.9;
  v24 = [(AIAudiogramResultDateCell *)self labelStackView];
  v25 = v24;
  if (v23 >= (float)(Width + *(float *)&v17))
  {
    [v24 setAxis:0];

    uint64_t v29 = 2
        * (objc_msgSend(MEMORY[0x263F82E00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[AIAudiogramResultDateCell semanticContentAttribute](self, "semanticContentAttribute")) != 1);
    v26 = [(AIAudiogramResultDateCell *)self valueLabel];
    v27 = v26;
    uint64_t v28 = v29;
  }
  else
  {
    [v24 setAxis:1];

    v26 = [(AIAudiogramResultDateCell *)self valueLabel];
    v27 = v26;
    uint64_t v28 = 4;
  }
  [v26 setTextAlignment:v28];
}

- (void)setDate:(id)a3
{
  id v4 = a3;
  double v5 = [(AIAudiogramResultDateCell *)self datePicker];
  [v5 setDate:v4];

  double v6 = (void *)MEMORY[0x263F08790];
  id v10 = [(AIAudiogramResultDateCell *)self datePicker];
  double v7 = [v10 date];
  double v8 = [v6 localizedStringFromDate:v7 dateStyle:3 timeStyle:0];
  uint64_t v9 = [(AIAudiogramResultDateCell *)self valueLabel];
  [v9 setText:v8];
}

- (void)showActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  double v5 = [(AIAudiogramResultDateCell *)self datePicker];
  int v6 = [v5 isHidden];

  if (v6 == v3)
  {
    double v7 = [(AIAudiogramResultDateCell *)self datePicker];
    [v7 setHidden:v3 ^ 1];

    double v8 = [(AIAudiogramResultDateCell *)self collapsedConstraint];
    [v8 setActive:v3 ^ 1];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v9 = [(AIAudiogramResultDateCell *)self expandedConstraints];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v13++) setActive:v3];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)_datePickerValueChanged:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08790];
  id v5 = a3;
  int v6 = [v5 date];
  double v7 = [v4 localizedStringFromDate:v6 dateStyle:3 timeStyle:0];
  double v8 = [(AIAudiogramResultDateCell *)self valueLabel];
  [v8 setText:v7];

  id v10 = [(AIAudiogramResultDateCell *)self delegate];
  uint64_t v9 = [v5 date];

  [v10 dateCellDidPickDate:v9];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AIAudiogramResultDateCell;
  return *MEMORY[0x263F83260] | [(AIAudiogramResultDateCell *)&v3 accessibilityTraits];
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

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (void)setDatePicker:(id)a3
{
}

- (NSLayoutConstraint)collapsedConstraint
{
  return self->_collapsedConstraint;
}

- (void)setCollapsedConstraint:(id)a3
{
}

- (NSArray)expandedConstraints
{
  return self->_expandedConstraints;
}

- (void)setExpandedConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedConstraints, 0);
  objc_storeStrong((id *)&self->_collapsedConstraint, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end