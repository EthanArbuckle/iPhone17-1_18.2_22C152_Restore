@interface HKObjectPickerTableViewCell
- (BOOL)checked;
- (HKObjectPickerDetailView)patientDetailView;
- (HKObjectPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 presentationOptions:(int64_t)a5;
- (NSArray)detailItems;
- (NSArray)patientDetails;
- (NSAttributedString)secondaryAttributedText;
- (NSString)baseAccessibilityIdentifier;
- (NSString)patientName;
- (NSString)primaryText;
- (NSString)secondaryText;
- (UIImageView)checkboxView;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (UIStackView)contentStackView;
- (UIStackView)labelStackView;
- (UIStackView)recordDetailStackView;
- (UIView)secondSeparatorView;
- (UIView)separatorView;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAccessibilityIdentifiers;
- (void)_updateRecordDetailAccessibilityIdentifiers;
- (void)prepareForReuse;
- (void)setBaseAccessibilityIdentifier:(id)a3;
- (void)setCheckboxView:(id)a3;
- (void)setChecked:(BOOL)a3;
- (void)setContentStackView:(id)a3;
- (void)setDetailItems:(id)a3;
- (void)setLabelStackView:(id)a3;
- (void)setPatientDetailView:(id)a3;
- (void)setPatientDetails:(id)a3;
- (void)setPatientName:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setRecordDetailStackView:(id)a3;
- (void)setSecondSeparatorView:(id)a3;
- (void)setSecondaryAttributedText:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setSeparatorView:(id)a3;
@end

@implementation HKObjectPickerTableViewCell

- (HKObjectPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 presentationOptions:(int64_t)a5
{
  self->_presentationOptions = a5;
  v8.receiver = self;
  v8.super_class = (Class)HKObjectPickerTableViewCell;
  v5 = [(HKObjectPickerTableViewCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v6 = v5;
  if (v5)
  {
    [(HKObjectPickerTableViewCell *)v5 _setupSubviews];
    [(HKObjectPickerTableViewCell *)v6 _setupConstraints];
  }
  return v6;
}

- (void)_setupSubviews
{
  v51[1] = *MEMORY[0x1E4F143B8];
  [(HKObjectPickerTableViewCell *)self _setContinuousCornerRadius:10.0];
  [(HKObjectPickerTableViewCell *)self setSelectionStyle:3];
  v3 = [(HKObjectPickerTableViewCell *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 != 6)
  {
    v5 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(HKObjectPickerTableViewCell *)self setBackgroundColor:v5];
  }
  id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v11 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v11;

  [(UILabel *)self->_primaryLabel setAdjustsFontForContentSizeCategory:1];
  uint64_t v13 = *MEMORY[0x1E4FB28C8];
  v14 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB28C8], 2);
  [(UILabel *)self->_primaryLabel setFont:v14];

  [(UILabel *)self->_primaryLabel setNumberOfLines:0];
  v15 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)self->_primaryLabel setTextColor:v15];

  [(UILabel *)self->_primaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = -[HKAttributedTextLabel initWithFrame:]([HKAttributedTextLabel alloc], "initWithFrame:", v7, v8, v9, v10);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = &v16->super;

  [(UILabel *)self->_secondaryLabel setAdjustsFontForContentSizeCategory:1];
  v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v13];
  [(UILabel *)self->_secondaryLabel setFont:v18];

  [(UILabel *)self->_secondaryLabel setNumberOfLines:0];
  v19 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)self->_secondaryLabel setTextColor:v19];

  [(UILabel *)self->_secondaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v20 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v7, v8, v9, v10);
  separatorView = self->_separatorView;
  self->_separatorView = v20;

  v22 = [MEMORY[0x1E4FB1618] separatorColor];
  [(UIView *)self->_separatorView setBackgroundColor:v22];

  [(UIView *)self->_separatorView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v23 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v51[0] = self->_secondaryLabel;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  v25 = (UIStackView *)[v23 initWithArrangedSubviews:v24];
  recordDetailStackView = self->_recordDetailStackView;
  self->_recordDetailStackView = v25;

  [(UIStackView *)self->_recordDetailStackView setAlignment:1];
  [(UIStackView *)self->_recordDetailStackView setAxis:1];
  [(UIStackView *)self->_recordDetailStackView setDistribution:0];
  [(UIStackView *)self->_recordDetailStackView setSpacing:4.0];
  [(UIStackView *)self->_recordDetailStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  v27 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v7, v8, v9, v10);
  secondSeparatorView = self->_secondSeparatorView;
  self->_secondSeparatorView = v27;

  v29 = [MEMORY[0x1E4FB1618] separatorColor];
  [(UIView *)self->_secondSeparatorView setBackgroundColor:v29];

  [(UIView *)self->_secondSeparatorView setTranslatesAutoresizingMaskIntoConstraints:0];
  v30 = -[HKObjectPickerDetailView initWithFrame:]([HKObjectPickerDetailView alloc], "initWithFrame:", v7, v8, v9, v10);
  patientDetailView = self->_patientDetailView;
  self->_patientDetailView = v30;

  [(HKObjectPickerDetailView *)self->_patientDetailView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v32 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v33 = self->_separatorView;
  v50[0] = self->_primaryLabel;
  v50[1] = v33;
  v34 = self->_secondSeparatorView;
  v50[2] = self->_recordDetailStackView;
  v50[3] = v34;
  v50[4] = self->_patientDetailView;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:5];
  v36 = (UIStackView *)[v32 initWithArrangedSubviews:v35];
  labelStackView = self->_labelStackView;
  self->_labelStackView = v36;

  [(UIStackView *)self->_labelStackView setAlignment:1];
  [(UIStackView *)self->_labelStackView setAxis:1];
  [(UIStackView *)self->_labelStackView setDistribution:0];
  [(UIStackView *)self->_labelStackView setSpacing:12.0];
  [(UIStackView *)self->_labelStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  if (self->_presentationOptions)
  {
    v38 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v7, v8, v9, v10);
    checkboxView = self->_checkboxView;
    self->_checkboxView = v38;

    [(UIImageView *)self->_checkboxView setContentMode:1];
    [(UIImageView *)self->_checkboxView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v40) = 1148846080;
    [(UIImageView *)self->_checkboxView setContentCompressionResistancePriority:0 forAxis:v40];
    id v41 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v42 = self->_labelStackView;
    v49[0] = self->_checkboxView;
    v49[1] = v42;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
    v44 = (UIStackView *)[v41 initWithArrangedSubviews:v43];
    contentStackView = self->_contentStackView;
    self->_contentStackView = v44;

    [(UIStackView *)self->_contentStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_contentStackView setAlignment:1];
    [(UIStackView *)self->_contentStackView setAxis:0];
    [(UIStackView *)self->_contentStackView setDistribution:0];
    [(UIStackView *)self->_contentStackView setSpacing:5.0];
  }
  else
  {
    objc_storeStrong((id *)&self->_contentStackView, self->_labelStackView);
  }
  [(UIStackView *)self->_contentStackView setLayoutMarginsRelativeArrangement:1];
  if ((self->_presentationOptions & 2) != 0)
  {
    -[HKObjectPickerTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, 47.0, 0.0, 0.0);
    double v46 = 16.0;
    double v47 = 12.0;
  }
  else
  {
    double v46 = 16.0;
    double v47 = 16.0;
  }
  -[UIStackView setDirectionalLayoutMargins:](self->_contentStackView, "setDirectionalLayoutMargins:", v46, v46, v47, v46);
  [(HKObjectPickerTableViewCell *)self _updateAccessibilityIdentifiers];
  v48 = [(HKObjectPickerTableViewCell *)self contentView];
  [v48 addSubview:self->_contentStackView];
}

- (void)_setupConstraints
{
  v43[10] = *MEMORY[0x1E4F143B8];
  v27 = (void *)MEMORY[0x1E4F28DC8];
  id v41 = [(UIStackView *)self->_contentStackView topAnchor];
  v42 = [(HKObjectPickerTableViewCell *)self contentView];
  double v40 = [v42 topAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v43[0] = v39;
  v37 = [(UIStackView *)self->_contentStackView leadingAnchor];
  v38 = [(HKObjectPickerTableViewCell *)self contentView];
  v36 = [v38 leadingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v43[1] = v35;
  v34 = [(HKObjectPickerTableViewCell *)self contentView];
  v33 = [v34 trailingAnchor];
  id v32 = [(UIStackView *)self->_contentStackView trailingAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v43[2] = v31;
  v30 = [(HKObjectPickerTableViewCell *)self contentView];
  v29 = [v30 bottomAnchor];
  v28 = [(UIStackView *)self->_contentStackView bottomAnchor];
  v26 = [v29 constraintEqualToAnchor:v28];
  v43[3] = v26;
  v24 = [(UIView *)self->_separatorView heightAnchor];
  v25 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v25 scale];
  id v23 = [v24 constraintEqualToConstant:1.0 / v3];
  v43[4] = v23;
  v22 = [(UIView *)self->_separatorView leadingAnchor];
  v21 = [(UILabel *)self->_primaryLabel leadingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v43[5] = v20;
  v18 = [(UIView *)self->_separatorView trailingAnchor];
  v19 = [(HKObjectPickerTableViewCell *)self contentView];
  v17 = [v19 trailingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v43[6] = v16;
  v15 = [(UIView *)self->_secondSeparatorView heightAnchor];
  uint64_t v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 scale];
  id v6 = [v15 constraintEqualToConstant:1.0 / v5];
  v43[7] = v6;
  double v7 = [(UIView *)self->_secondSeparatorView leadingAnchor];
  double v8 = [(UILabel *)self->_primaryLabel leadingAnchor];
  double v9 = [v7 constraintEqualToAnchor:v8];
  v43[8] = v9;
  double v10 = [(UIView *)self->_secondSeparatorView trailingAnchor];
  v11 = [(HKObjectPickerTableViewCell *)self contentView];
  v12 = [v11 trailingAnchor];
  uint64_t v13 = [v10 constraintEqualToAnchor:v12];
  v43[9] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:10];
  [v27 activateConstraints:v14];
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)HKObjectPickerTableViewCell;
  [(HKObjectPickerTableViewCell *)&v5 prepareForReuse];
  self->_checked = 0;
  [(UILabel *)self->_primaryLabel setText:0];
  [(UILabel *)self->_secondaryLabel setText:0];
  [(UIImageView *)self->_checkboxView setImage:0];
  double v3 = [(HKObjectPickerDetailView *)self->_patientDetailView primaryLabel];
  [v3 setText:0];

  uint64_t v4 = [(HKObjectPickerDetailView *)self->_patientDetailView secondaryLabel];
  [v4 setText:0];
}

- (void)setChecked:(BOOL)a3
{
  self->_BOOL checked = a3;
  id v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithFont:scale:");
  BOOL checked = self->_checked;
  [(UIImageView *)self->_checkboxView setPreferredSymbolConfiguration:v4];
  if (checked)
  {
    id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
    [(UIImageView *)self->_checkboxView setImage:v6];

    [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  else
  {
    double v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"circle"];
    [(UIImageView *)self->_checkboxView setImage:v7];

    [MEMORY[0x1E4FB1618] secondaryLabelColor];
  double v8 = };
  [(UIImageView *)self->_checkboxView setTintColor:v8];
}

- (NSString)primaryText
{
  return [(UILabel *)self->_primaryLabel text];
}

- (void)setPrimaryText:(id)a3
{
}

- (void)setDetailItems:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_detailItems, a3);
  id v6 = [(UIStackView *)self->_recordDetailStackView subviews];
  [v6 makeObjectsPerformSelector:sel_removeFromSuperview];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_msgSend(v16, "primaryText", (void)v24);
        v17 = (HKObjectPickerDetailView *)objc_claimAutoreleasedReturnValue();
        if ([(HKObjectPickerDetailView *)v17 length])
        {
          v18 = [v16 secondaryText];
          uint64_t v19 = [v18 length];

          if (!v19) {
            continue;
          }
          v17 = -[HKObjectPickerDetailView initWithFrame:]([HKObjectPickerDetailView alloc], "initWithFrame:", v11, v12, v13, v14);
          v20 = [v16 primaryText];
          v21 = [(HKObjectPickerDetailView *)v17 primaryLabel];
          [v21 setText:v20];

          v22 = [v16 secondaryText];
          id v23 = [(HKObjectPickerDetailView *)v17 secondaryLabel];
          [v23 setText:v22];

          [(HKObjectPickerDetailView *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
          [(UIStackView *)self->_recordDetailStackView addArrangedSubview:v17];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  [(UIStackView *)self->_recordDetailStackView addArrangedSubview:self->_secondaryLabel];
  [(HKObjectPickerTableViewCell *)self _updateRecordDetailAccessibilityIdentifiers];
}

- (NSString)secondaryText
{
  return [(UILabel *)self->_secondaryLabel text];
}

- (void)setSecondaryText:(id)a3
{
}

- (NSAttributedString)secondaryAttributedText
{
  return [(UILabel *)self->_secondaryLabel attributedText];
}

- (void)setSecondaryAttributedText:(id)a3
{
}

- (NSString)patientName
{
  v2 = [(HKObjectPickerDetailView *)self->_patientDetailView primaryLabel];
  double v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setPatientName:(id)a3
{
  patientDetailView = self->_patientDetailView;
  id v4 = a3;
  id v5 = [(HKObjectPickerDetailView *)patientDetailView primaryLabel];
  [v5 setText:v4];
}

- (NSArray)patientDetails
{
  v2 = [(HKObjectPickerDetailView *)self->_patientDetailView secondaryLabel];
  double v3 = [v2 text];

  return (NSArray *)v3;
}

- (void)setPatientDetails:(id)a3
{
  id v5 = [a3 componentsJoinedByString:@"\n"];
  id v4 = [(HKObjectPickerDetailView *)self->_patientDetailView secondaryLabel];
  [v4 setText:v5];
}

- (void)setBaseAccessibilityIdentifier:(id)a3
{
  if (self->_baseAccessibilityIdentifier != a3)
  {
    id v4 = (NSString *)[a3 copy];
    baseAccessibilityIdentifier = self->_baseAccessibilityIdentifier;
    self->_baseAccessibilityIdentifier = v4;

    [(HKObjectPickerTableViewCell *)self _updateAccessibilityIdentifiers];
  }
}

- (void)_updateAccessibilityIdentifiers
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_baseAccessibilityIdentifier length])
  {
    v17[0] = self->_baseAccessibilityIdentifier;
    v17[1] = @"Primary";
    double v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    id v4 = HKUIJoinStringsForAutomationIdentifier(v3);
    [(UILabel *)self->_primaryLabel setAccessibilityIdentifier:v4];

    v16[0] = self->_baseAccessibilityIdentifier;
    v16[1] = @"Secondary";
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    id v6 = HKUIJoinStringsForAutomationIdentifier(v5);
    [(UILabel *)self->_secondaryLabel setAccessibilityIdentifier:v6];

    v15[0] = self->_baseAccessibilityIdentifier;
    v15[1] = @"PatientDetails";
    v15[2] = @"Primary";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
    uint64_t v8 = HKUIJoinStringsForAutomationIdentifier(v7);
    uint64_t v9 = [(HKObjectPickerDetailView *)self->_patientDetailView primaryLabel];
    [v9 setAccessibilityIdentifier:v8];

    v14[0] = self->_baseAccessibilityIdentifier;
    v14[1] = @"PatientDetails";
    v14[2] = @"Secondary";
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
    double v11 = HKUIJoinStringsForAutomationIdentifier(v10);
    double v12 = [(HKObjectPickerDetailView *)self->_patientDetailView secondaryLabel];
    [v12 setAccessibilityIdentifier:v11];
  }
  else
  {
    [(UILabel *)self->_primaryLabel setAccessibilityIdentifier:0];
    [(UILabel *)self->_secondaryLabel setAccessibilityIdentifier:0];
    double v13 = [(HKObjectPickerDetailView *)self->_patientDetailView primaryLabel];
    [v13 setAccessibilityIdentifier:0];

    uint64_t v10 = [(HKObjectPickerDetailView *)self->_patientDetailView secondaryLabel];
    [v10 setAccessibilityIdentifier:0];
  }

  [(HKObjectPickerTableViewCell *)self _updateRecordDetailAccessibilityIdentifiers];
}

- (void)_updateRecordDetailAccessibilityIdentifiers
{
  v2 = self;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(UIStackView *)self->_recordDetailStackView subviews];
  uint64_t v3 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    p_vtable = HKInfographicTableViewCell.vtable;
    uint64_t v7 = *(void *)v30;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v29 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          baseAccessibilityIdentifier = v2->_baseAccessibilityIdentifier;
          id v11 = v9;
          if ([(NSString *)baseAccessibilityIdentifier length])
          {
            v33[0] = v2->_baseAccessibilityIdentifier;
            v33[1] = @"DetailItems";
            [NSNumber numberWithUnsignedInteger:v5];
            uint64_t v28 = v5;
            uint64_t v12 = v4;
            uint64_t v13 = v7;
            double v14 = v2;
            v16 = v15 = p_vtable;
            v17 = [v16 description];
            v33[2] = v17;
            v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];

            uint64_t v19 = HKUIJoinStringsForAutomationIdentifier(v18);
            [v11 setAccessibilityIdentifier:v19];

            v20 = [v18 arrayByAddingObject:@"Primary"];
            v21 = HKUIJoinStringsForAutomationIdentifier(v20);
            v22 = [v11 primaryLabel];
            [v22 setAccessibilityIdentifier:v21];

            id v23 = [v18 arrayByAddingObject:@"Secondary"];
            long long v24 = HKUIJoinStringsForAutomationIdentifier(v23);
            long long v25 = [v11 secondaryLabel];

            [v25 setAccessibilityIdentifier:v24];
            p_vtable = v15;
            v2 = v14;
            uint64_t v7 = v13;
            uint64_t v4 = v12;
            uint64_t v5 = v28;
          }
          else
          {
            [v11 setAccessibilityIdentifier:0];
            long long v26 = [v11 primaryLabel];
            [v26 setAccessibilityIdentifier:0];

            v18 = [v11 secondaryLabel];

            [v18 setAccessibilityIdentifier:0];
          }

          ++v5;
        }
        ++v8;
      }
      while (v4 != v8);
      uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v4);
  }
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
}

- (BOOL)checked
{
  return self->_checked;
}

- (NSArray)detailItems
{
  return self->_detailItems;
}

- (NSString)baseAccessibilityIdentifier
{
  return self->_baseAccessibilityIdentifier;
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (UIStackView)recordDetailStackView
{
  return self->_recordDetailStackView;
}

- (void)setRecordDetailStackView:(id)a3
{
}

- (HKObjectPickerDetailView)patientDetailView
{
  return self->_patientDetailView;
}

- (void)setPatientDetailView:(id)a3
{
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
}

- (UIImageView)checkboxView
{
  return self->_checkboxView;
}

- (void)setCheckboxView:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (UIView)secondSeparatorView
{
  return self->_secondSeparatorView;
}

- (void)setSecondSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondSeparatorView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_checkboxView, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_patientDetailView, 0);
  objc_storeStrong((id *)&self->_recordDetailStackView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_baseAccessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_detailItems, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
}

@end