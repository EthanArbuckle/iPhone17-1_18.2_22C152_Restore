@interface CNFRegSettingsTemporaryPhoneCell
- (CNFRegSettingsTemporaryPhoneCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)descriptionLabel;
- (UILabel)expirationLabel;
- (UILabel)phoneNumberLabel;
- (unint64_t)daysUntilExpiration:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setExpirationLabel:(id)a3;
- (void)setPhoneNumberLabel:(id)a3;
@end

@implementation CNFRegSettingsTemporaryPhoneCell

- (CNFRegSettingsTemporaryPhoneCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v62.receiver = self;
  v62.super_class = (Class)CNFRegSettingsTemporaryPhoneCell;
  v4 = [(CNFRegSettingsTemporaryPhoneCell *)&v62 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    phoneNumberLabel = v4->_phoneNumberLabel;
    v4->_phoneNumberLabel = v5;

    [(UILabel *)v4->_phoneNumberLabel setText:&stru_26D05D4F8];
    v7 = [MEMORY[0x263F825C8] labelColor];
    [(UILabel *)v4->_phoneNumberLabel setTextColor:v7];

    v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UILabel *)v4->_phoneNumberLabel setFont:v8];

    [(UILabel *)v4->_phoneNumberLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(CNFRegSettingsTemporaryPhoneCell *)v4 contentView];
    [v9 addSubview:v4->_phoneNumberLabel];

    v10 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    expirationLabel = v4->_expirationLabel;
    v4->_expirationLabel = v10;

    [(UILabel *)v4->_expirationLabel setText:&stru_26D05D4F8];
    v12 = [MEMORY[0x263F825C8] labelColor];
    [(UILabel *)v4->_expirationLabel setTextColor:v12];

    uint64_t v13 = *MEMORY[0x263F835F0];
    v14 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
    [(UILabel *)v4->_expirationLabel setFont:v14];

    [(UILabel *)v4->_expirationLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [(CNFRegSettingsTemporaryPhoneCell *)v4 contentView];
    [v15 addSubview:v4->_expirationLabel];

    v16 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    descriptionLabel = v4->_descriptionLabel;
    v4->_descriptionLabel = v16;

    LODWORD(v15) = _os_feature_enabled_impl();
    v18 = CommunicationsSetupUIBundle();
    v19 = CNFRegStringTableName();
    if (v15) {
      v20 = @"FACETIME_SETTINGS_TEMPORARY_PHONE_DESCRIPTION_APPLEACCOUNT";
    }
    else {
      v20 = @"FACETIME_SETTINGS_TEMPORARY_PHONE_DESCRIPTION";
    }
    v21 = [v18 localizedStringForKey:v20 value:&stru_26D05D4F8 table:v19];
    [(UILabel *)v4->_descriptionLabel setText:v21];

    [(UILabel *)v4->_descriptionLabel setNumberOfLines:0];
    v22 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v4->_descriptionLabel setTextColor:v22];

    v23 = [MEMORY[0x263F81708] preferredFontForTextStyle:v13];
    [(UILabel *)v4->_descriptionLabel setFont:v23];

    [(UILabel *)v4->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v24 = [(CNFRegSettingsTemporaryPhoneCell *)v4 contentView];
    [v24 addSubview:v4->_descriptionLabel];

    v25 = [(UILabel *)v4->_phoneNumberLabel topAnchor];
    v26 = [(CNFRegSettingsTemporaryPhoneCell *)v4 contentView];
    v27 = [v26 layoutMarginsGuide];
    v28 = [v27 topAnchor];
    v29 = [v25 constraintEqualToAnchor:v28];
    [v29 setActive:1];

    v30 = [(UILabel *)v4->_phoneNumberLabel leadingAnchor];
    v31 = [(CNFRegSettingsTemporaryPhoneCell *)v4 contentView];
    v32 = [v31 layoutMarginsGuide];
    v33 = [v32 leadingAnchor];
    v34 = [v30 constraintEqualToAnchor:v33];
    [v34 setActive:1];

    v35 = [(UILabel *)v4->_expirationLabel centerYAnchor];
    v36 = [(UILabel *)v4->_phoneNumberLabel centerYAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    [v37 setActive:1];

    v38 = [(UILabel *)v4->_expirationLabel trailingAnchor];
    v39 = [(CNFRegSettingsTemporaryPhoneCell *)v4 contentView];
    v40 = [v39 layoutMarginsGuide];
    v41 = [v40 trailingAnchor];
    v42 = [v38 constraintEqualToAnchor:v41];
    [v42 setActive:1];

    v43 = [(UILabel *)v4->_descriptionLabel topAnchor];
    v44 = [(UILabel *)v4->_phoneNumberLabel bottomAnchor];
    v45 = [v43 constraintEqualToAnchor:v44 constant:8.0];
    [v45 setActive:1];

    v46 = [(UILabel *)v4->_descriptionLabel leadingAnchor];
    v47 = [(CNFRegSettingsTemporaryPhoneCell *)v4 contentView];
    v48 = [v47 layoutMarginsGuide];
    v49 = [v48 leadingAnchor];
    v50 = [v46 constraintEqualToAnchor:v49];
    [v50 setActive:1];

    v51 = [(UILabel *)v4->_descriptionLabel trailingAnchor];
    v52 = [(CNFRegSettingsTemporaryPhoneCell *)v4 contentView];
    v53 = [v52 layoutMarginsGuide];
    v54 = [v53 trailingAnchor];
    v55 = [v51 constraintEqualToAnchor:v54];
    [v55 setActive:1];

    v56 = [(UILabel *)v4->_descriptionLabel bottomAnchor];
    v57 = [(CNFRegSettingsTemporaryPhoneCell *)v4 contentView];
    v58 = [v57 layoutMarginsGuide];
    v59 = [v58 bottomAnchor];
    v60 = [v56 constraintEqualToAnchor:v59];
    [v60 setActive:1];
  }
  return v4;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CNFRegSettingsTemporaryPhoneCell;
  id v4 = a3;
  [(PSTableCell *)&v15 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 propertyForKey:@"cnfreg-temp-alias"];

  v6 = [v5 displayName];
  v7 = [(CNFRegSettingsTemporaryPhoneCell *)self phoneNumberLabel];
  [v7 setText:v6];

  v8 = NSString;
  v9 = CommunicationsSetupUIBundle();
  v10 = CNFRegStringTableName();
  v11 = [v9 localizedStringForKey:@"FACETIME_SETTINGS_TEMPORARY_PHONE_DAYS_REMAINING" value:&stru_26D05D4F8 table:v10];
  v12 = [v5 expirationDate];
  uint64_t v13 = objc_msgSend(v8, "stringWithFormat:", v11, -[CNFRegSettingsTemporaryPhoneCell daysUntilExpiration:](self, "daysUntilExpiration:", v12));
  v14 = [(CNFRegSettingsTemporaryPhoneCell *)self expirationLabel];
  [v14 setText:v13];
}

- (unint64_t)daysUntilExpiration:(id)a3
{
  [a3 timeIntervalSinceNow];
  if (v3 >= 0.0) {
    return (unint64_t)v3 / 0x15180;
  }
  else {
    return 0;
  }
}

- (UILabel)phoneNumberLabel
{
  return self->_phoneNumberLabel;
}

- (void)setPhoneNumberLabel:(id)a3
{
}

- (UILabel)expirationLabel
{
  return self->_expirationLabel;
}

- (void)setExpirationLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_expirationLabel, 0);
  objc_storeStrong((id *)&self->_phoneNumberLabel, 0);
}

@end