@interface CKMultipleIDSSubscriptionsTableCell
+ (int64_t)cellStyle;
- (BOOL)canBeChecked;
- (BOOL)canReload;
- (CKMultipleIDSSubscriptionsTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)centeredNameLabel;
- (UILabel)nameLabel;
- (UILabel)numberLabel;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setCenteredNameLabel:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setNumberLabel:(id)a3;
@end

@implementation CKMultipleIDSSubscriptionsTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (CKMultipleIDSSubscriptionsTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v65.receiver = self;
  v65.super_class = (Class)CKMultipleIDSSubscriptionsTableCell;
  v4 = [(CKMultipleIDSSubscriptionsTableCell *)&v65 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v5;

    uint64_t v7 = *MEMORY[0x263F83570];
    v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UILabel *)v4->_nameLabel setFont:v8];

    [(UILabel *)v4->_nameLabel setNumberOfLines:0];
    [(UILabel *)v4->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(CKMultipleIDSSubscriptionsTableCell *)v4 contentView];
    [v9 addSubview:v4->_nameLabel];

    v10 = [(UILabel *)v4->_nameLabel firstBaselineAnchor];
    v11 = [(CKMultipleIDSSubscriptionsTableCell *)v4 contentView];
    v12 = [v11 topAnchor];
    v13 = [v10 constraintEqualToSystemSpacingBelowAnchor:v12 multiplier:1.0];
    [v13 setActive:1];

    v14 = [(UILabel *)v4->_nameLabel leadingAnchor];
    v15 = [(CKMultipleIDSSubscriptionsTableCell *)v4 contentView];
    v16 = [v15 layoutMarginsGuide];
    v17 = [v16 leadingAnchor];
    v18 = [v14 constraintEqualToAnchor:v17];
    [v18 setActive:1];

    v19 = [(UILabel *)v4->_nameLabel trailingAnchor];
    v20 = [(CKMultipleIDSSubscriptionsTableCell *)v4 contentView];
    v21 = [v20 layoutMarginsGuide];
    v22 = [v21 trailingAnchor];
    v23 = [v19 constraintLessThanOrEqualToAnchor:v22];
    [v23 setActive:1];

    v24 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    numberLabel = v4->_numberLabel;
    v4->_numberLabel = v24;

    v26 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
    [(UILabel *)v4->_numberLabel setFont:v26];

    [(UILabel *)v4->_numberLabel setNumberOfLines:0];
    [(UILabel *)v4->_numberLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v27 = [MEMORY[0x263F825C8] systemGrayColor];
    [(UILabel *)v4->_numberLabel setTextColor:v27];

    v28 = [(CKMultipleIDSSubscriptionsTableCell *)v4 contentView];
    [v28 addSubview:v4->_numberLabel];

    v29 = [(UILabel *)v4->_numberLabel firstBaselineAnchor];
    v30 = [(UILabel *)v4->_nameLabel lastBaselineAnchor];
    v31 = [v29 constraintEqualToSystemSpacingBelowAnchor:v30 multiplier:1.0];
    [v31 setActive:1];

    v32 = [(UILabel *)v4->_numberLabel leadingAnchor];
    v33 = [(UILabel *)v4->_nameLabel leadingAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    [v34 setActive:1];

    v35 = [(UILabel *)v4->_numberLabel trailingAnchor];
    v36 = [(CKMultipleIDSSubscriptionsTableCell *)v4 contentView];
    v37 = [v36 layoutMarginsGuide];
    v38 = [v37 trailingAnchor];
    v39 = [v35 constraintLessThanOrEqualToAnchor:v38];
    [v39 setActive:1];

    v40 = [(CKMultipleIDSSubscriptionsTableCell *)v4 contentView];
    v41 = [v40 bottomAnchor];
    v42 = [(UILabel *)v4->_numberLabel lastBaselineAnchor];
    v43 = [v41 constraintEqualToSystemSpacingBelowAnchor:v42 multiplier:1.0];
    [v43 setActive:1];

    v44 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    centeredNameLabel = v4->_centeredNameLabel;
    v4->_centeredNameLabel = v44;

    v46 = [MEMORY[0x263F81708] preferredFontForTextStyle:v7];
    [(UILabel *)v4->_centeredNameLabel setFont:v46];

    [(UILabel *)v4->_centeredNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v47 = [(CKMultipleIDSSubscriptionsTableCell *)v4 contentView];
    [v47 addSubview:v4->_centeredNameLabel];

    v48 = [(UILabel *)v4->_centeredNameLabel leadingAnchor];
    v49 = [(CKMultipleIDSSubscriptionsTableCell *)v4 contentView];
    v50 = [v49 layoutMarginsGuide];
    v51 = [v50 leadingAnchor];
    v52 = [v48 constraintEqualToAnchor:v51];
    [v52 setActive:1];

    v53 = [(UILabel *)v4->_centeredNameLabel trailingAnchor];
    v54 = [(CKMultipleIDSSubscriptionsTableCell *)v4 contentView];
    v55 = [v54 layoutMarginsGuide];
    v56 = [v55 trailingAnchor];
    v57 = [v53 constraintLessThanOrEqualToAnchor:v56];
    [v57 setActive:1];

    v58 = [(UILabel *)v4->_centeredNameLabel centerYAnchor];
    v59 = [(CKMultipleIDSSubscriptionsTableCell *)v4 contentView];
    v60 = [v59 centerYAnchor];
    v61 = [v58 constraintEqualToAnchor:v60];
    [v61 setActive:1];

    v62 = [(CKMultipleIDSSubscriptionsTableCell *)v4 textLabel];
    [v62 setHidden:1];

    v63 = [(CKMultipleIDSSubscriptionsTableCell *)v4 detailTextLabel];
    [v63 setHidden:1];
  }
  return v4;
}

- (BOOL)canReload
{
  return 1;
}

- (BOOL)canBeChecked
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKMultipleIDSSubscriptionsTableCell;
  id v4 = a3;
  [(PSTableCell *)&v8 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", *MEMORY[0x263F60290], v8.receiver, v8.super_class);

  v6 = [v5 label];
  [(UILabel *)self->_nameLabel setText:v6];

  uint64_t v7 = [v5 phoneNumber];
  [(UILabel *)self->_numberLabel setText:v7];

  [(CKMultipleIDSSubscriptionsTableCell *)self setNeedsLayout];
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)numberLabel
{
  return self->_numberLabel;
}

- (void)setNumberLabel:(id)a3
{
}

- (UILabel)centeredNameLabel
{
  return self->_centeredNameLabel;
}

- (void)setCenteredNameLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centeredNameLabel, 0);
  objc_storeStrong((id *)&self->_numberLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end