@interface HKOrganDonationAddressCell
- (BOOL)editDisabled;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (HKOrganDonationAddressCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HKSimpleDataEntryCellDelegate)delegate;
- (UITextField)cityTextField;
- (UITextField)stateTextField;
- (UITextField)streetOneTextField;
- (UITextField)streetTwoTextField;
- (UITextField)zipCodeTextField;
- (void)_setupFonts;
- (void)_setupLayoutConstraints;
- (void)_stateShadowButtonTapped:(id)a3;
- (void)beginEditing;
- (void)setCityTextField:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditDisabled:(BOOL)a3;
- (void)setStateTextField:(id)a3;
- (void)setStreetOneTextField:(id)a3;
- (void)setStreetTwoTextField:(id)a3;
- (void)setZipCodeTextField:(id)a3;
- (void)textFieldDidChangeValue:(id)a3;
@end

@implementation HKOrganDonationAddressCell

- (HKOrganDonationAddressCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v81[5] = *MEMORY[0x1E4F143B8];
  v76.receiver = self;
  v76.super_class = (Class)HKOrganDonationAddressCell;
  v4 = [(HKOrganDonationAddressCell *)&v76 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v5;

    v7 = v4->_titleLabel;
    v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v9 = objc_msgSend(v8, "localizedStringForKey:value:table:", @"OD_ADDRESS", &stru_1F3B9CF20);
    [(UILabel *)v7 setText:v9];

    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    addressContainerView = v4->_addressContainerView;
    v4->_addressContainerView = v10;

    v12 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    streetOneTextField = v4->_streetOneTextField;
    v4->_streetOneTextField = v12;

    v14 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    streetTwoTextField = v4->_streetTwoTextField;
    v4->_streetTwoTextField = v14;

    v16 = objc_alloc_init(HKCaretOptionalTextField);
    stateTextField = v4->_stateTextField;
    v4->_stateTextField = &v16->super;

    v18 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    cityTextField = v4->_cityTextField;
    v4->_cityTextField = v18;

    v20 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    zipCodeTextField = v4->_zipCodeTextField;
    v4->_zipCodeTextField = v20;

    v66 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v65 = [v66 localizedStringForKey:@"OD_PLACEHOLDER_ADDRESS_1" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v81[0] = v65;
    v64 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v63 = [v64 localizedStringForKey:@"OD_PLACEHOLDER_ADDRESS_2" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v81[1] = v63;
    v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v23 = [v22 localizedStringForKey:@"OD_PLACEHOLDER_STATE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v81[2] = v23;
    v24 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v25 = [v24 localizedStringForKey:@"OD_PLACEHOLDER_CITY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v81[3] = v25;
    v26 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v27 = [v26 localizedStringForKey:@"OD_PLACEHOLDER_ZIP" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v81[4] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:5];
    v29 = [v28 objectEnumerator];

    v80[0] = v4->_streetOneTextField;
    v80[1] = v4->_streetTwoTextField;
    v80[2] = v4->_stateTextField;
    v80[3] = v4->_cityTextField;
    v80[4] = v4->_zipCodeTextField;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:5];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = [obj countByEnumeratingWithState:&v72 objects:v79 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v73 != v32) {
            objc_enumerationMutation(obj);
          }
          v34 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          [v34 addTarget:v4 action:sel_textFieldDidChangeValue_ forControlEvents:0x20000];
          v35 = [v29 nextObject];
          [v34 setPlaceholder:v35];

          [v34 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v34 setDelegate:v4];
          [v34 setAutocorrectionType:1];
          [v34 setAutocapitalizationType:1];
          [(UIView *)v4->_addressContainerView addSubview:v34];
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v72 objects:v79 count:16];
      }
      while (v31);
    }

    uint64_t v36 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    stateShadowButton = v4->_stateShadowButton;
    v4->_stateShadowButton = (UIButton *)v36;

    [(UIButton *)v4->_stateShadowButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_addressContainerView addSubview:v4->_stateShadowButton];
    [(UIButton *)v4->_stateShadowButton addTarget:v4 action:sel__stateShadowButtonTapped_ forControlEvents:64];
    v38 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    verticalSeparator = v4->_verticalSeparator;
    v4->_verticalSeparator = v38;

    v40 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    horizontalSeparator = v4->_horizontalSeparator;
    v4->_horizontalSeparator = v40;

    v42 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    stateZipSeparator = v4->_stateZipSeparator;
    v4->_stateZipSeparator = v42;

    v44 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    addressSeparator = v4->_addressSeparator;
    v4->_addressSeparator = v44;

    v46 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    citySeparator = v4->_citySeparator;
    v4->_citySeparator = v46;

    v48 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    stateSeparator = v4->_stateSeparator;
    v4->_stateSeparator = v48;

    v78[0] = v4->_horizontalSeparator;
    v78[1] = v4->_verticalSeparator;
    v78[2] = v4->_stateZipSeparator;
    v78[3] = v4->_addressSeparator;
    v78[4] = v4->_citySeparator;
    v78[5] = v4->_stateSeparator;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:6];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v51 = [v50 countByEnumeratingWithState:&v68 objects:v77 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v69;
      do
      {
        for (uint64_t j = 0; j != v52; ++j)
        {
          if (*(void *)v69 != v53) {
            objc_enumerationMutation(v50);
          }
          v55 = *(UIView **)(*((void *)&v68 + 1) + 8 * j);
          v56 = [MEMORY[0x1E4FB1618] systemMidGrayColor];
          [(UIView *)v55 setBackgroundColor:v56];

          [(UIView *)v55 setTranslatesAutoresizingMaskIntoConstraints:0];
          if (v55 == v4->_horizontalSeparator || v55 == v4->_verticalSeparator)
          {
            v57 = [(HKOrganDonationAddressCell *)v4 contentView];
            [v57 addSubview:v55];
          }
          else
          {
            [(UIView *)v4->_addressContainerView addSubview:v55];
          }
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:&v68 objects:v77 count:16];
      }
      while (v52);
    }

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_addressContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v58 = [(HKOrganDonationAddressCell *)v4 contentView];
    [v58 addSubview:v4->_titleLabel];

    v59 = [(HKOrganDonationAddressCell *)v4 contentView];
    [v59 addSubview:v4->_addressContainerView];

    v60 = [(HKOrganDonationAddressCell *)v4 contentView];
    [v60 addSubview:v4->_verticalSeparator];

    v61 = [(HKOrganDonationAddressCell *)v4 contentView];
    [v61 addSubview:v4->_horizontalSeparator];

    [(HKOrganDonationAddressCell *)v4 _setupFonts];
    [(HKOrganDonationAddressCell *)v4 _setupLayoutConstraints];
    [(HKOrganDonationAddressCell *)v4 setSelectionStyle:0];
  }
  return v4;
}

- (void)_setupFonts
{
  v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB2950]);
  [(UILabel *)self->_titleLabel setFont:v3];

  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
  [(UITextField *)self->_streetOneTextField setFont:v5];

  v6 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", v4);
  [(UITextField *)self->_streetTwoTextField setFont:v6];

  v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", v4);
  [(UITextField *)self->_stateTextField setFont:v7];

  v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", v4);
  [(UITextField *)self->_cityTextField setFont:v8];

  objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(UITextField *)self->_zipCodeTextField setFont:v9];
}

- (void)_setupLayoutConstraints
{
  v38[1] = *MEMORY[0x1E4F143B8];
  v3 = _NSDictionaryOfVariableBindings(&cfstr_TitlelabelAddr.isa, self->_titleLabel, self->_addressContainerView, self->_streetOneTextField, self->_streetTwoTextField, self->_stateTextField, self->_cityTextField, self->_zipCodeTextField, self->_verticalSeparator, self->_horizontalSeparator, self->_stateZipSeparator, self->_addressSeparator, self->_citySeparator, self->_stateSeparator, self->_stateShadowButton, 0);
  v37 = @"onePixel";
  uint64_t v4 = [NSNumber numberWithDouble:HKUIOnePixel()];
  v38[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];

  v6 = [(HKOrganDonationAddressCell *)self contentView];
  v7 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(20)-[_titleLabel(>=20)]-[_verticalSeparator(onePixel)]-(0)-[_addressContainerView]-(0)-|" options:0 metrics:v5 views:v3];
  [v6 addConstraints:v7];

  v8 = [(HKOrganDonationAddressCell *)self contentView];
  id v9 = (id)objc_msgSend(v8, "hk_addConstraintsWithFormat:options:views:", @"H:|-(20)-[_horizontalSeparator]-(0)-|", 0, v3);

  v10 = [(HKOrganDonationAddressCell *)self contentView];
  id v11 = (id)objc_msgSend(v10, "hk_addConstraintsWithFormat:options:views:", @"V:|-(10)-[_verticalSeparator]-(0)-|", 0, v3);

  v12 = [(HKOrganDonationAddressCell *)self contentView];
  id v13 = (id)objc_msgSend(v12, "hk_addConstraintsWithFormat:options:views:", @"V:|-(10)-[_addressContainerView]-(0)-|", 0, v3);

  v14 = [(HKOrganDonationAddressCell *)self contentView];
  v15 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-(>=10)-[_horizontalSeparator(onePixel)]-(0)-|" options:0 metrics:v5 views:v3];
  [v14 addConstraints:v15];

  v16 = [(HKOrganDonationAddressCell *)self contentView];
  titleLabel = self->_titleLabel;
  v18 = [(HKOrganDonationAddressCell *)self contentView];
  id v19 = (id)objc_msgSend(v16, "hk_addEqualsConstraintWithItem:attribute:relatedTo:attribute:constant:", titleLabel, 10, v18, 10, 0.0);

  addressContainerView = self->_addressContainerView;
  v21 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-(10)-[_streetOneTextField]-(10)-[_addressSeparator(onePixel)]-(10)-[_streetTwoTextField(==_streetOneTextField)]-(10)-[_citySeparator(onePixel)]-(10)-[_cityTextField(==_streetOneTextField)]-(10)-[_stateSeparator(onePixel)]-(10)-[_stateTextField(==_streetOneTextField)]-(10)-|" options:0 metrics:v5 views:v3];
  [(UIView *)addressContainerView addConstraints:v21];

  id v22 = -[UIView hk_addConstraintsWithFormat:options:views:](self->_addressContainerView, "hk_addConstraintsWithFormat:options:views:", @"H:|-[_streetOneTextField]-|", 0, v3);
  id v23 = -[UIView hk_addConstraintsWithFormat:options:views:](self->_addressContainerView, "hk_addConstraintsWithFormat:options:views:", @"H:|-[_streetTwoTextField]-|", 0, v3);
  id v24 = -[UIView hk_addConstraintsWithFormat:options:views:](self->_addressContainerView, "hk_addConstraintsWithFormat:options:views:", @"H:|-[_cityTextField]-|", 0, v3);
  id v25 = -[UIView hk_addConstraintsWithFormat:options:views:](self->_addressContainerView, "hk_addConstraintsWithFormat:options:views:", @"H:|-(0)-[_addressSeparator]-(0)-|", 0, v3);
  id v26 = -[UIView hk_addConstraintsWithFormat:options:views:](self->_addressContainerView, "hk_addConstraintsWithFormat:options:views:", @"H:|-(0)-[_citySeparator]-(0)-|", 0, v3);
  id v27 = -[UIView hk_addConstraintsWithFormat:options:views:](self->_addressContainerView, "hk_addConstraintsWithFormat:options:views:", @"H:|-(0)-[_stateSeparator]-(0)-|", 0, v3);
  id v28 = -[UIView hk_addConstraintsWithFormat:options:views:](self->_addressContainerView, "hk_addConstraintsWithFormat:options:views:", @"V:[_stateSeparator]-(0)-[_stateZipSeparator]-(0)-|", 0, v3);
  id v29 = [(UIView *)self->_addressContainerView hk_addEqualsConstraintWithItem:self->_stateTextField attribute:11 relatedTo:self->_zipCodeTextField attribute:11 constant:0.0];
  uint64_t v30 = self->_addressContainerView;
  uint64_t v31 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[_stateTextField]-(10)-[_stateZipSeparator(onePixel)]-(10)-[_zipCodeTextField(==_stateTextField)]-|" options:0 metrics:v5 views:v3];
  [(UIView *)v30 addConstraints:v31];

  id v32 = [(UIView *)self->_addressContainerView hk_addEqualsConstraintWithItem:self->_stateShadowButton attribute:8 relatedTo:self->_stateTextField attribute:8 constant:0.0];
  id v33 = [(UIView *)self->_addressContainerView hk_addEqualsConstraintWithItem:self->_stateShadowButton attribute:7 relatedTo:self->_stateTextField attribute:7 constant:0.0];
  id v34 = [(UIView *)self->_addressContainerView hk_addEqualsConstraintWithItem:self->_stateShadowButton attribute:9 relatedTo:self->_stateTextField attribute:9 constant:0.0];
  id v35 = [(UIView *)self->_addressContainerView hk_addEqualsConstraintWithItem:self->_stateShadowButton attribute:10 relatedTo:self->_stateTextField attribute:10 constant:0.0];
  LODWORD(v36) = 1148846080;
  [(UILabel *)self->_titleLabel setContentHuggingPriority:0 forAxis:v36];
}

- (void)_stateShadowButtonTapped:(id)a3
{
}

- (void)beginEditing
{
}

- (BOOL)editDisabled
{
  return self->_editDisabled;
}

- (void)setEditDisabled:(BOOL)a3
{
  self->_editDisabled = a3;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return !self->_editDisabled;
}

- (void)textFieldDidChangeValue:(id)a3
{
  id v4 = a3;
  id v5 = [(HKOrganDonationAddressCell *)self delegate];
  [v5 textFieldDidChangeValue:v4 forCell:self];
}

- (HKSimpleDataEntryCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKSimpleDataEntryCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITextField)streetOneTextField
{
  return self->_streetOneTextField;
}

- (void)setStreetOneTextField:(id)a3
{
}

- (UITextField)streetTwoTextField
{
  return self->_streetTwoTextField;
}

- (void)setStreetTwoTextField:(id)a3
{
}

- (UITextField)stateTextField
{
  return self->_stateTextField;
}

- (void)setStateTextField:(id)a3
{
}

- (UITextField)cityTextField
{
  return self->_cityTextField;
}

- (void)setCityTextField:(id)a3
{
}

- (UITextField)zipCodeTextField
{
  return self->_zipCodeTextField;
}

- (void)setZipCodeTextField:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zipCodeTextField, 0);
  objc_storeStrong((id *)&self->_cityTextField, 0);
  objc_storeStrong((id *)&self->_stateTextField, 0);
  objc_storeStrong((id *)&self->_streetTwoTextField, 0);
  objc_storeStrong((id *)&self->_streetOneTextField, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateShadowButton, 0);
  objc_storeStrong((id *)&self->_stateSeparator, 0);
  objc_storeStrong((id *)&self->_citySeparator, 0);
  objc_storeStrong((id *)&self->_addressSeparator, 0);
  objc_storeStrong((id *)&self->_stateZipSeparator, 0);
  objc_storeStrong((id *)&self->_horizontalSeparator, 0);
  objc_storeStrong((id *)&self->_verticalSeparator, 0);
  objc_storeStrong((id *)&self->_addressContainerView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end