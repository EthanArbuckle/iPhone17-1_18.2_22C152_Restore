@interface CPSPointsOfInterestPickerExtendedCell
+ (id)identifier;
- (CPSPointsOfInterestPickerExtendedCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)subtitle;
- (NSString)text;
- (NSString)title;
- (UIEdgeInsets)safeAreaInsets;
- (UILabel)extendedInformativeLabel;
- (UILabel)extendedSubtitleLabel;
- (UILabel)extendedTitleLabel;
- (void)setExtendedInformativeLabel:(id)a3;
- (void)setExtendedSubtitleLabel:(id)a3;
- (void)setExtendedTitleLabel:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setText:(id)a3;
- (void)setTitle:(id)a3;
- (void)setupViews;
@end

@implementation CPSPointsOfInterestPickerExtendedCell

- (CPSPointsOfInterestPickerExtendedCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v4 = v9;
  v9 = 0;
  v7.receiver = v4;
  v7.super_class = (Class)CPSPointsOfInterestPickerExtendedCell;
  v9 = [(CPSPointsOfInterestPickerCell *)&v7 initWithStyle:3 reuseIdentifier:location[0]];
  objc_storeStrong((id *)&v9, v9);
  v6 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v6;
}

+ (id)identifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)setTitle:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_title, location[0]);
  id v3 = location[0];
  v4 = [(CPSPointsOfInterestPickerExtendedCell *)v6 extendedTitleLabel];
  [(UILabel *)v4 setText:v3];

  objc_storeStrong(location, 0);
}

- (void)setSubtitle:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_subtitle, location[0]);
  id v3 = location[0];
  v4 = [(CPSPointsOfInterestPickerExtendedCell *)v6 extendedSubtitleLabel];
  [(UILabel *)v4 setText:v3];

  objc_storeStrong(location, 0);
}

- (void)setText:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_text, location[0]);
  id v3 = location[0];
  v4 = [(CPSPointsOfInterestPickerExtendedCell *)v6 extendedInformativeLabel];
  [(UILabel *)v4 setText:v3];

  objc_storeStrong(location, 0);
}

- (UIEdgeInsets)safeAreaInsets
{
  UIEdgeInsetsMake_4();
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setupViews
{
  v62[13] = *MEMORY[0x263EF8340];
  v61 = self;
  v60[1] = (id)a2;
  id v2 = objc_alloc(MEMORY[0x263F1C768]);
  v11 = (double *)MEMORY[0x263F001A8];
  uint64_t v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  extendedTitleLabel = v61->_extendedTitleLabel;
  v61->_extendedTitleLabel = (UILabel *)v3;

  [(UILabel *)v61->_extendedTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  id v9 = +[CPSEntityStyles pickerCellPrimaryFont];
  -[UILabel setFont:](v61->_extendedTitleLabel, "setFont:");

  [(CPSPointsOfInterestPickerExtendedCell *)v61 addSubview:v61->_extendedTitleLabel];
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", *v11, v11[1], v11[2], v11[3]);
  extendedSubtitleLabel = v61->_extendedSubtitleLabel;
  v61->_extendedSubtitleLabel = (UILabel *)v5;

  [(UILabel *)v61->_extendedSubtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  id v10 = +[CPSEntityStyles pickerCellSecondaryFont];
  -[UILabel setFont:](v61->_extendedSubtitleLabel, "setFont:");

  [(CPSPointsOfInterestPickerExtendedCell *)v61 addSubview:v61->_extendedSubtitleLabel];
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", *v11, v11[1], v11[2], v11[3]);
  extendedInformativeLabel = v61->_extendedInformativeLabel;
  v61->_extendedInformativeLabel = (UILabel *)v7;

  [(UILabel *)v61->_extendedInformativeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  id v12 = +[CPSEntityStyles pickerCellSecondaryFont];
  -[UILabel setFont:](v61->_extendedInformativeLabel, "setFont:");

  [(CPSPointsOfInterestPickerExtendedCell *)v61 addSubview:v61->_extendedInformativeLabel];
  id v59 = (id)[(UILabel *)v61->_extendedTitleLabel topAnchor];
  id v58 = (id)[(CPSPointsOfInterestPickerExtendedCell *)v61 safeAreaLayoutGuide];
  id v57 = (id)[v58 topAnchor];
  id v56 = (id)objc_msgSend(v59, "constraintEqualToAnchor:");
  v62[0] = v56;
  id v55 = (id)[(UILabel *)v61->_extendedTitleLabel leadingAnchor];
  id v54 = (id)[(CPSPointsOfInterestPickerExtendedCell *)v61 safeAreaLayoutGuide];
  id v53 = (id)[v54 leadingAnchor];
  id v52 = (id)objc_msgSend(v55, "constraintEqualToAnchor:");
  v62[1] = v52;
  id v51 = (id)[(UILabel *)v61->_extendedTitleLabel trailingAnchor];
  id v50 = (id)[(CPSPointsOfInterestPickerExtendedCell *)v61 safeAreaLayoutGuide];
  id v49 = (id)[v50 trailingAnchor];
  id v48 = (id)objc_msgSend(v51, "constraintEqualToAnchor:");
  v62[2] = v48;
  id v47 = (id)[(UILabel *)v61->_extendedTitleLabel heightAnchor];
  v46 = [(UILabel *)v61->_extendedTitleLabel font];
  [(UIFont *)v46 lineHeight];
  id v45 = (id)objc_msgSend(v47, "constraintEqualToConstant:");
  v62[3] = v45;
  id v44 = (id)[(UILabel *)v61->_extendedSubtitleLabel topAnchor];
  id v43 = (id)[(UILabel *)v61->_extendedTitleLabel bottomAnchor];
  id v42 = (id)objc_msgSend(v44, "constraintEqualToAnchor:");
  v62[4] = v42;
  id v41 = (id)[(UILabel *)v61->_extendedSubtitleLabel leadingAnchor];
  id v40 = (id)[(CPSPointsOfInterestPickerExtendedCell *)v61 safeAreaLayoutGuide];
  id v39 = (id)[v40 leadingAnchor];
  id v38 = (id)objc_msgSend(v41, "constraintEqualToAnchor:");
  v62[5] = v38;
  id v37 = (id)[(UILabel *)v61->_extendedSubtitleLabel trailingAnchor];
  id v36 = (id)[(CPSPointsOfInterestPickerExtendedCell *)v61 safeAreaLayoutGuide];
  id v35 = (id)[v36 trailingAnchor];
  id v34 = (id)objc_msgSend(v37, "constraintEqualToAnchor:");
  v62[6] = v34;
  id v33 = (id)[(UILabel *)v61->_extendedSubtitleLabel heightAnchor];
  v32 = [(UILabel *)v61->_extendedSubtitleLabel font];
  [(UIFont *)v32 lineHeight];
  id v31 = (id)objc_msgSend(v33, "constraintEqualToConstant:");
  v62[7] = v31;
  id v30 = (id)[(UILabel *)v61->_extendedInformativeLabel topAnchor];
  id v29 = (id)[(UILabel *)v61->_extendedSubtitleLabel bottomAnchor];
  id v28 = (id)objc_msgSend(v30, "constraintEqualToAnchor:");
  v62[8] = v28;
  id v27 = (id)[(UILabel *)v61->_extendedInformativeLabel leadingAnchor];
  id v26 = (id)[(CPSPointsOfInterestPickerExtendedCell *)v61 safeAreaLayoutGuide];
  id v25 = (id)[v26 leadingAnchor];
  id v24 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
  v62[9] = v24;
  id v23 = (id)[(UILabel *)v61->_extendedInformativeLabel trailingAnchor];
  id v22 = (id)[(CPSPointsOfInterestPickerExtendedCell *)v61 safeAreaLayoutGuide];
  id v21 = (id)[v22 trailingAnchor];
  id v20 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
  v62[10] = v20;
  id v19 = (id)[(UILabel *)v61->_extendedInformativeLabel heightAnchor];
  v18 = [(UILabel *)v61->_extendedInformativeLabel font];
  [(UIFont *)v18 lineHeight];
  id v17 = (id)objc_msgSend(v19, "constraintEqualToConstant:");
  v62[11] = v17;
  id v16 = (id)[(UILabel *)v61->_extendedInformativeLabel bottomAnchor];
  id v15 = (id)[(CPSPointsOfInterestPickerExtendedCell *)v61 safeAreaLayoutGuide];
  id v14 = (id)[v15 bottomAnchor];
  id v13 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
  v62[12] = v13;
  v60[0] = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:13];

  [MEMORY[0x263F08938] activateConstraints:v60[0]];
  objc_storeStrong(v60, 0);
}

- (void)setHighlighted:(BOOL)a3
{
  id v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPSPointsOfInterestPickerExtendedCell;
  [(CPSPointsOfInterestPickerCell *)&v9 setHighlighted:a3];
  char v8 = 1;
  if (![(CPSPointsOfInterestPickerCell *)v12 chosen]) {
    char v8 = v10;
  }
  id v6 = +[CPSEntityStyles pickerCellPrimaryFontColor:v8 & 1];
  -[UILabel setTextColor:](v12->_extendedTitleLabel, "setTextColor:");

  char v7 = 1;
  if (![(CPSPointsOfInterestPickerCell *)v12 chosen]) {
    char v7 = v10;
  }
  id v4 = +[CPSEntityStyles pickerCellSecondaryFontColor:v7 & 1];
  -[UILabel setTextColor:](v12->_extendedSubtitleLabel, "setTextColor:");

  char v5 = 1;
  if (![(CPSPointsOfInterestPickerCell *)v12 chosen]) {
    char v5 = v10;
  }
  id v3 = +[CPSEntityStyles pickerCellSecondaryFontColor:v5 & 1];
  -[UILabel setTextColor:](v12->_extendedInformativeLabel, "setTextColor:");
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)text
{
  return self->_text;
}

- (UILabel)extendedTitleLabel
{
  return self->_extendedTitleLabel;
}

- (void)setExtendedTitleLabel:(id)a3
{
}

- (UILabel)extendedSubtitleLabel
{
  return self->_extendedSubtitleLabel;
}

- (void)setExtendedSubtitleLabel:(id)a3
{
}

- (UILabel)extendedInformativeLabel
{
  return self->_extendedInformativeLabel;
}

- (void)setExtendedInformativeLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end