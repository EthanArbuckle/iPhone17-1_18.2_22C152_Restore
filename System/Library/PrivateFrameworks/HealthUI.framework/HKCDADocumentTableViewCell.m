@interface HKCDADocumentTableViewCell
- (BOOL)isChecked;
- (BOOL)showsCheckbox;
- (HKAdjustableTapTargetButton)checkboxButton;
- (HKCDADocumentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HKCDADocumentTableViewCellDelegate)delegate;
- (id)_createDocumentCellLabelWithTag:(int64_t)a3 fontSizePts:(double)a4 flexibleHeight:(BOOL)a5;
- (void)_selectedCheckbox:(id)a3;
- (void)_setDocumentLabelWithTag:(int64_t)a3 text:(id)a4 view:(id)a5;
- (void)_setupCellStructure;
- (void)_updateForCurrentSizeCategory;
- (void)layoutSubviews;
- (void)setCellValuesForDocumentSample:(id)a3;
- (void)setCheckboxButton:(id)a3;
- (void)setChecked:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setShowsCheckbox:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKCDADocumentTableViewCell

- (HKCDADocumentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKCDADocumentTableViewCell;
  v4 = [(HKCDADocumentTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v4->_showsCheckbox = 0;
    objc_storeWeak((id *)&v4->_delegate, 0);
    [(HKCDADocumentTableViewCell *)v5 _setupCellStructure];
  }
  return v5;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)HKCDADocumentTableViewCell;
  [(HKCDADocumentTableViewCell *)&v14 layoutSubviews];
  v3 = [(HKCDADocumentTableViewCell *)self viewWithTag:101];
  [v3 bounds];
  -[HKCDADocumentTableViewCell convertRect:fromView:](self, "convertRect:fromView:", v3);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  if ([(UIView *)self hk_isLeftToRight])
  {
    v15.origin.x = v5;
    v15.origin.y = v7;
    v15.size.width = v9;
    v15.size.height = v11;
    double MinX = CGRectGetMinX(v15);
  }
  else
  {
    [(HKCDADocumentTableViewCell *)self bounds];
    double Width = CGRectGetWidth(v16);
    v17.origin.x = v5;
    v17.origin.y = v7;
    v17.size.width = v9;
    v17.size.height = v11;
    double MinX = Width - CGRectGetMaxX(v17);
  }
  -[HKCDADocumentTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, MinX, 0.0, 0.0);
}

- (void)setShowsCheckbox:(BOOL)a3
{
  self->_showsCheckbox = a3;
  [(HKAdjustableTapTargetButton *)self->_checkboxButton setHidden:!a3];
  [(HKCDADocumentTableViewCell *)self setNeedsLayout];
}

- (void)setChecked:(BOOL)a3
{
}

- (void)setCellValuesForDocumentSample:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [v4 document];
  id v19 = [v5 title];

  double v6 = [(HKCDADocumentTableViewCell *)self contentView];
  [(HKCDADocumentTableViewCell *)self _setDocumentLabelWithTag:101 text:v19 view:v6];

  CGFloat v7 = [v4 document];
  double v8 = [v7 patientName];

  CGFloat v9 = [(HKCDADocumentTableViewCell *)self contentView];
  [(HKCDADocumentTableViewCell *)self _setDocumentLabelWithTag:105 text:v8 view:v9];

  double v10 = [v4 endDate];
  CGFloat v11 = HKLocalizedStringForDateAndTemplate(v10, 35);
  v12 = [(HKCDADocumentTableViewCell *)self contentView];
  [(HKCDADocumentTableViewCell *)self _setDocumentLabelWithTag:102 text:v11 view:v12];

  v13 = [v4 document];
  objc_super v14 = [v13 custodianName];

  CGRect v15 = [(HKCDADocumentTableViewCell *)self contentView];
  [(HKCDADocumentTableViewCell *)self _setDocumentLabelWithTag:103 text:v14 view:v15];

  CGRect v16 = [v4 document];

  CGRect v17 = [v16 authorName];

  v18 = [(HKCDADocumentTableViewCell *)self contentView];
  [(HKCDADocumentTableViewCell *)self _setDocumentLabelWithTag:104 text:v17 view:v18];
}

- (BOOL)isChecked
{
  return [(HKAdjustableTapTargetButton *)self->_checkboxButton isSelected];
}

- (void)_setupCellStructure
{
  v67[4] = *MEMORY[0x1E4F143B8];
  v61 = [(HKCDADocumentTableViewCell *)self contentView];
  id v3 = objc_alloc(MEMORY[0x1E4FB1C60]);
  uint64_t v4 = MEMORY[0x1E4F1CBF0];
  CGFloat v5 = (void *)[v3 initWithArrangedSubviews:MEMORY[0x1E4F1CBF0]];
  [v5 setAxis:0];
  [v5 setDistribution:0];
  double v6 = +[HKAdjustableTapTargetButton buttonWithType:0];
  checkboxButton = self->_checkboxButton;
  self->_checkboxButton = v6;

  double v8 = [MEMORY[0x1E4FB1818] kitImageNamed:@"UITintedCircularButtonCheckmark"];
  CGFloat v9 = [MEMORY[0x1E4FB1818] kitImageNamed:@"UIRemoveControlMultiNotCheckedImage"];
  double v10 = self->_checkboxButton;
  CGFloat v11 = HKHealthKeyColor();
  v60 = v8;
  v12 = [v8 _flatImageWithColor:v11];
  [(HKAdjustableTapTargetButton *)v10 setImage:v12 forState:4];

  v13 = self->_checkboxButton;
  objc_super v14 = HKHealthKeyColor();
  v59 = v9;
  CGRect v15 = [v9 _flatImageWithColor:v14];
  [(HKAdjustableTapTargetButton *)v13 setImage:v15 forState:0];

  -[HKAdjustableTapTargetButton setHitTargetInsets:](self->_checkboxButton, "setHitTargetInsets:", 0.0, -16.0, 0.0, -50.0);
  [(HKAdjustableTapTargetButton *)self->_checkboxButton addTarget:self action:sel__selectedCheckbox_ forControlEvents:64];
  [(HKAdjustableTapTargetButton *)self->_checkboxButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HKAdjustableTapTargetButton *)self->_checkboxButton setHidden:1];
  LODWORD(v16) = 1148846080;
  [(HKAdjustableTapTargetButton *)self->_checkboxButton setContentCompressionResistancePriority:0 forAxis:v16];
  LODWORD(v17) = 1148846080;
  [(HKAdjustableTapTargetButton *)self->_checkboxButton setContentHuggingPriority:0 forAxis:v17];
  -[HKAdjustableTapTargetButton setContentEdgeInsets:](self->_checkboxButton, "setContentEdgeInsets:", 0.0, 0.0, 0.0, 16.0);
  [v5 addArrangedSubview:self->_checkboxButton];
  v18 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
  [(UIStackView *)v18 setAxis:0];
  [(UIStackView *)v18 setDistribution:0];
  v57 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v56 = objc_msgSend(MEMORY[0x1E4FB1818], "imageNamed:inBundle:compatibleWithTraitCollection:", @"cda_doc");
  id v19 = [[_HKDocumentImageView alloc] initWithImage:v56];
  v58 = v18;
  [(UIStackView *)v18 addArrangedSubview:v19];
  LODWORD(v20) = 1148846080;
  [(_HKDocumentImageView *)v19 setContentCompressionResistancePriority:0 forAxis:v20];
  v55 = v19;
  LODWORD(v21) = 1148846080;
  [(_HKDocumentImageView *)v19 setContentHuggingPriority:0 forAxis:v21];
  v22 = (void *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v4];
  [v22 setAxis:1];
  [v22 setDistribution:0];
  v23 = [(HKCDADocumentTableViewCell *)self _createDocumentCellLabelWithTag:101 fontSizePts:1 flexibleHeight:18.0];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v23;

  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"UIA.Health.CDA.ReportTitle"];
  v25 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)self->_titleLabel setTextColor:v25];

  v26 = [(HKCDADocumentTableViewCell *)self _createDocumentCellLabelWithTag:105 fontSizePts:0 flexibleHeight:14.0];
  v67[0] = v26;
  v27 = [(HKCDADocumentTableViewCell *)self _createDocumentCellLabelWithTag:102 fontSizePts:0 flexibleHeight:14.0];
  v67[1] = v27;
  v28 = [(HKCDADocumentTableViewCell *)self _createDocumentCellLabelWithTag:103 fontSizePts:0 flexibleHeight:14.0];
  v67[2] = v28;
  v29 = [(HKCDADocumentTableViewCell *)self _createDocumentCellLabelWithTag:104 fontSizePts:0 flexibleHeight:14.0];
  v67[3] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:4];
  cellLabels = self->_cellLabels;
  self->_cellLabels = v30;

  [v22 addArrangedSubview:self->_titleLabel];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v32 = self->_cellLabels;
  uint64_t v33 = [(NSArray *)v32 countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v63;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v63 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void **)(*((void *)&v62 + 1) + 8 * v36);
        v38 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [v37 setTextColor:v38];

        [v22 addArrangedSubview:v37];
        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = [(NSArray *)v32 countByEnumeratingWithState:&v62 objects:v66 count:16];
    }
    while (v34);
  }

  [(UIStackView *)v58 addArrangedSubview:v22];
  LODWORD(v39) = 1132068864;
  [v22 setContentHuggingPriority:0 forAxis:v39];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 addArrangedSubview:v58];
  [v61 addSubview:v5];
  v40 = [v5 leadingAnchor];
  v41 = [v61 leadingAnchor];
  v42 = [v40 constraintEqualToAnchor:v41 constant:16.0];
  [v42 setActive:1];

  v43 = [v5 trailingAnchor];
  v44 = [v61 trailingAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  [v45 setActive:1];

  v46 = [v5 topAnchor];
  v47 = [v61 topAnchor];
  v48 = [v46 constraintEqualToAnchor:v47 constant:11.0];
  [v48 setActive:1];

  v49 = [v5 bottomAnchor];
  v50 = [v61 bottomAnchor];
  v51 = [v49 constraintEqualToAnchor:v50 constant:-11.0];
  [v51 setActive:1];

  [(HKCDADocumentTableViewCell *)self setAccessoryType:1];
  documentImageView = self->_documentImageView;
  self->_documentImageView = v55;
  v53 = v55;

  imageLabelStack = self->_imageLabelStack;
  self->_imageLabelStack = v58;

  [(HKCDADocumentTableViewCell *)self _updateForCurrentSizeCategory];
}

- (void)_updateForCurrentSizeCategory
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL IsUsingAccessibilityContentSizeCategory = HKUIApplicationIsUsingAccessibilityContentSizeCategory();
  BOOL v4 = IsUsingAccessibilityContentSizeCategory;
  if (IsUsingAccessibilityContentSizeCategory) {
    double v5 = 0.0;
  }
  else {
    double v5 = 10.0;
  }
  BOOL v6 = !IsUsingAccessibilityContentSizeCategory;
  [(UIStackView *)self->_imageLabelStack setAxis:IsUsingAccessibilityContentSizeCategory];
  [(UIStackView *)self->_imageLabelStack setAlignment:v4];
  -[_HKDocumentImageView setMargins:](self->_documentImageView, "setMargins:", 0.0, -4.0, 0.0, v5);
  titleLabel = self->_titleLabel;
  double v8 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v9 = *MEMORY[0x1E4FB28C8];
  double v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v10 _scaledValueForValue:18.0];
  CGFloat v11 = objc_msgSend(v8, "systemFontOfSize:");
  [(UILabel *)titleLabel setFont:v11];

  [(UILabel *)self->_titleLabel setNumberOfLines:v6];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v12 = self->_cellLabels;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1E4FB08E0];
        id v19 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:", v9, (void)v21);
        [v19 _scaledValueForValue:14.0];
        double v20 = objc_msgSend(v18, "systemFontOfSize:");
        [v17 setFont:v20];

        [v17 setNumberOfLines:v6];
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }
}

- (id)_createDocumentCellLabelWithTag:(int64_t)a3 fontSizePts:(double)a4 flexibleHeight:(BOOL)a5
{
  BOOL v5 = a5;
  double v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  [v8 setTag:a3];
  [v8 setNumberOfLines:1];
  LODWORD(v9) = 1055286886;
  [v8 _setHyphenationFactor:v9];
  double v10 = [MEMORY[0x1E4FB08E0] systemFontOfSize:a4];
  [v8 setFont:v10];

  LODWORD(v11) = 1144750080;
  if (v5) {
    *(float *)&double v11 = 250.0;
  }
  [v8 setContentHuggingPriority:1 forAxis:v11];
  return v8;
}

- (void)_setDocumentLabelWithTag:(int64_t)a3 text:(id)a4 view:(id)a5
{
  id v7 = a4;
  id v8 = [a5 viewWithTag:a3];
  [v8 setText:v7];
}

- (void)_selectedCheckbox:(id)a3
{
  if (self->_checkboxButton == a3)
  {
    -[HKAdjustableTapTargetButton setSelected:](self->_checkboxButton, "setSelected:", [a3 isSelected] ^ 1);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      id v5 = objc_loadWeakRetained((id *)&self->_delegate);
      [v5 cdaDocumentTableViewCellDidChangeValue:self];
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKCDADocumentTableViewCell;
  [(HKCDADocumentTableViewCell *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(HKCDADocumentTableViewCell *)self traitCollection];
    BOOL v6 = [v5 preferredContentSizeCategory];
    id v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(HKCDADocumentTableViewCell *)self _updateForCurrentSizeCategory];
    }
  }
}

- (BOOL)showsCheckbox
{
  return self->_showsCheckbox;
}

- (HKCDADocumentTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKCDADocumentTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKAdjustableTapTargetButton)checkboxButton
{
  return self->_checkboxButton;
}

- (void)setCheckboxButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkboxButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageLabelStack, 0);
  objc_storeStrong((id *)&self->_cellLabels, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_documentImageView, 0);
}

@end