@interface _HKEmergencyCardContactCell
- (UILabel)nameLabel;
- (UILabel)phoneNumberLabel;
- (UILabel)relationshipLabel;
- (_HKEmergencyCardContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_HKEmergencyContact)contact;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_setupIndividualViews;
- (void)dealloc;
- (void)setContact:(id)a3;
- (void)setContact:(id)a3 showRelationship:(BOOL)a4 showPhoneIcon:(BOOL)a5;
- (void)setNameLabel:(id)a3;
- (void)setPhoneNumberLabel:(id)a3;
- (void)setRelationshipLabel:(id)a3;
- (void)setupConstraints;
- (void)setupViewHeirarchy;
@end

@implementation _HKEmergencyCardContactCell

- (_HKEmergencyCardContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_HKEmergencyCardContactCell;
  v4 = [(_HKEmergencyCardContactCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(_HKEmergencyCardContactCell *)v4 _setupIndividualViews];
    [(_HKEmergencyCardContactCell *)v5 setupViewHeirarchy];
    [(_HKEmergencyCardContactCell *)v5 setupConstraints];
    [(_HKEmergencyCardContactCell *)v5 _contentSizeCategoryDidChange:0];
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_HKEmergencyCardContactCell;
  [(_HKEmergencyCardContactCell *)&v4 dealloc];
}

- (void)_setupIndividualViews
{
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  relationshipLabel = self->_relationshipLabel;
  self->_relationshipLabel = v3;

  [(UILabel *)self->_relationshipLabel setNumberOfLines:0];
  v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_relationshipLabel setTextColor:v5];

  [(UILabel *)self->_relationshipLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  nameLabel = self->_nameLabel;
  self->_nameLabel = v6;

  [(UILabel *)self->_nameLabel setNumberOfLines:0];
  objc_super v8 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)self->_nameLabel setTextColor:v8];

  [(UILabel *)self->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  phoneNumberLabel = self->_phoneNumberLabel;
  self->_phoneNumberLabel = v9;

  [(UILabel *)self->_phoneNumberLabel setNumberOfLines:0];
  v11 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [(UILabel *)self->_phoneNumberLabel setTextColor:v11];

  v12 = self->_phoneNumberLabel;
  [(UILabel *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)setupViewHeirarchy
{
  v3 = [(_HKEmergencyCardContactCell *)self contentView];
  objc_super v4 = [(_HKEmergencyCardContactCell *)self relationshipLabel];
  [v3 addSubview:v4];

  v5 = [(_HKEmergencyCardContactCell *)self contentView];
  v6 = [(_HKEmergencyCardContactCell *)self nameLabel];
  [v5 addSubview:v6];

  id v8 = [(_HKEmergencyCardContactCell *)self contentView];
  v7 = [(_HKEmergencyCardContactCell *)self phoneNumberLabel];
  [v8 addSubview:v7];
}

- (void)setupConstraints
{
  v3 = [(_HKEmergencyCardContactCell *)self relationshipLabel];
  objc_super v4 = [v3 firstBaselineAnchor];
  v5 = [(_HKEmergencyCardContactCell *)self contentView];
  v6 = [v5 topAnchor];
  v7 = [(_HKEmergencyCardContactCell *)self relationshipLabel];
  id v8 = [v7 font];
  [v8 _scaledValueForValue:20.0];
  v9 = objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6);
  [v9 setActive:1];

  v10 = [(_HKEmergencyCardContactCell *)self relationshipLabel];
  v11 = [v10 leftAnchor];
  v12 = [(_HKEmergencyCardContactCell *)self contentView];
  v13 = [v12 leftAnchor];
  v14 = [v11 constraintEqualToAnchor:v13 constant:16.0];
  [v14 setActive:1];

  v15 = [(_HKEmergencyCardContactCell *)self contentView];
  v16 = [v15 rightAnchor];
  v17 = [(_HKEmergencyCardContactCell *)self relationshipLabel];
  v18 = [v17 rightAnchor];
  v19 = [v16 constraintEqualToAnchor:v18 constant:16.0];
  [v19 setActive:1];

  v20 = [(_HKEmergencyCardContactCell *)self nameLabel];
  v21 = [v20 firstBaselineAnchor];
  v22 = [(_HKEmergencyCardContactCell *)self relationshipLabel];
  v23 = [v22 lastBaselineAnchor];
  v24 = [(_HKEmergencyCardContactCell *)self nameLabel];
  v25 = [v24 font];
  [v25 _scaledValueForValue:24.0];
  v26 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23);
  [v26 setActive:1];

  v27 = [(_HKEmergencyCardContactCell *)self nameLabel];
  v28 = [v27 leftAnchor];
  v29 = [(_HKEmergencyCardContactCell *)self contentView];
  v30 = [v29 leftAnchor];
  v31 = [v28 constraintEqualToAnchor:v30 constant:16.0];
  [v31 setActive:1];

  v32 = [(_HKEmergencyCardContactCell *)self contentView];
  v33 = [v32 rightAnchor];
  v34 = [(_HKEmergencyCardContactCell *)self nameLabel];
  v35 = [v34 rightAnchor];
  v36 = [v33 constraintEqualToAnchor:v35 constant:16.0];
  [v36 setActive:1];

  v37 = [(_HKEmergencyCardContactCell *)self phoneNumberLabel];
  v38 = [v37 firstBaselineAnchor];
  v39 = [(_HKEmergencyCardContactCell *)self nameLabel];
  v40 = [v39 lastBaselineAnchor];
  v41 = [(_HKEmergencyCardContactCell *)self nameLabel];
  v42 = [v41 font];
  [v42 _scaledValueForValue:24.0];
  v43 = objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40);
  [v43 setActive:1];

  v44 = [(_HKEmergencyCardContactCell *)self phoneNumberLabel];
  v45 = [v44 leftAnchor];
  v46 = [(_HKEmergencyCardContactCell *)self contentView];
  v47 = [v46 leftAnchor];
  v48 = [v45 constraintEqualToAnchor:v47 constant:16.0];
  [v48 setActive:1];

  v49 = [(_HKEmergencyCardContactCell *)self contentView];
  v50 = [v49 rightAnchor];
  v51 = [(_HKEmergencyCardContactCell *)self phoneNumberLabel];
  v52 = [v51 rightAnchor];
  v53 = [v50 constraintEqualToAnchor:v52 constant:16.0];
  [v53 setActive:1];

  id v60 = [(_HKEmergencyCardContactCell *)self contentView];
  v54 = [v60 bottomAnchor];
  v55 = [(_HKEmergencyCardContactCell *)self phoneNumberLabel];
  v56 = [v55 bottomAnchor];
  v57 = [(_HKEmergencyCardContactCell *)self relationshipLabel];
  v58 = [v57 font];
  [v58 _scaledValueForValue:20.0];
  v59 = objc_msgSend(v54, "constraintEqualToAnchor:constant:", v56);
  [v59 setActive:1];
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  objc_super v4 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB2950]);
  [(UILabel *)self->_relationshipLabel setFont:v4];

  uint64_t v5 = *MEMORY[0x1E4FB28C8];
  v6 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
  [(UILabel *)self->_nameLabel setFont:v6];

  objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_phoneNumberLabel setFont:v7];
}

- (void)setContact:(id)a3
{
}

- (void)setContact:(id)a3 showRelationship:(BOOL)a4 showPhoneIcon:(BOOL)a5
{
  BOOL v5 = a4;
  id v13 = a3;
  objc_storeStrong((id *)&self->_contact, a3);
  id v8 = [v13 name];
  [(UILabel *)self->_nameLabel setText:v8];

  v9 = [v13 phoneNumber];
  [(UILabel *)self->_phoneNumberLabel setText:v9];

  if (v5)
  {
    v10 = (void *)MEMORY[0x1E4F1BA20];
    v11 = [v13 relationship];
    v12 = [v10 localizedStringForLabel:v11];
    [(UILabel *)self->_relationshipLabel setText:v12];
  }
  else
  {
    [(UILabel *)self->_relationshipLabel setText:0];
  }
}

- (_HKEmergencyContact)contact
{
  return self->_contact;
}

- (UILabel)relationshipLabel
{
  return self->_relationshipLabel;
}

- (void)setRelationshipLabel:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)phoneNumberLabel
{
  return self->_phoneNumberLabel;
}

- (void)setPhoneNumberLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumberLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_relationshipLabel, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end