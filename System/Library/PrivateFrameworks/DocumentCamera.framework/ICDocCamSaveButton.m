@interface ICDocCamSaveButton
- (ICDocCamSaveButton)initWithFrame:(CGRect)a3;
- (NSMutableArray)layoutConstraints;
- (UILabel)countLabel;
- (UILabel)saveLabel;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)saveButtonCountStringForDocumentCount:(unint64_t)a3;
- (id)saveButtonTitleForDocumentCount:(unint64_t)a3;
- (int64_t)documentCount;
- (int64_t)maxWidthForPortraitIPhone;
- (void)layoutSubviews;
- (void)setCountLabel:(id)a3;
- (void)setDocumentCount:(int64_t)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setMaxWidthForPortraitIPhone:(int64_t)a3;
- (void)setSaveLabel:(id)a3;
@end

@implementation ICDocCamSaveButton

- (ICDocCamSaveButton)initWithFrame:(CGRect)a3
{
  v31.receiver = self;
  v31.super_class = (Class)ICDocCamSaveButton;
  v3 = -[ICDocCamSaveButton initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_documentCount = 0;
    v3->_maxWidthForPortraitIPhone = 0x7FFFFFFFLL;
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    countLabel = v4->_countLabel;
    v4->_countLabel = v5;

    v7 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v4->_countLabel setBackgroundColor:v7];

    v8 = v4->_countLabel;
    v9 = [(ICDocCamSaveButton *)v4 saveButtonCountStringForDocumentCount:v4->_documentCount];
    [(UILabel *)v8 setText:v9];

    [(UILabel *)v4->_countLabel sizeToFit];
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    saveLabel = v4->_saveLabel;
    v4->_saveLabel = v10;

    v12 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v4->_saveLabel setBackgroundColor:v12];

    v13 = v4->_saveLabel;
    v14 = [(ICDocCamSaveButton *)v4 saveButtonTitleForDocumentCount:v4->_documentCount];
    [(UILabel *)v13 setText:v14];

    if ((DCDebugInterfaceEnabled() & 1) != 0
      || ([MEMORY[0x263F1C5C0] currentDevice],
          v15 = objc_claimAutoreleasedReturnValue(),
          uint64_t v16 = [v15 userInterfaceIdiom],
          v15,
          v16 == 1))
    {
      v17 = (void *)MEMORY[0x263F1C658];
      v18 = (double *)MEMORY[0x263F1D340];
    }
    else
    {
      v17 = (void *)MEMORY[0x263F1C658];
      v18 = (double *)MEMORY[0x263F1D338];
    }
    double v19 = *v18;
    v20 = [v17 systemFontOfSize:17.0 weight:*v18];
    [(UILabel *)v4->_saveLabel setFont:v20];

    v21 = [MEMORY[0x263F1C658] systemFontOfSize:17.0 weight:v19];
    [(UILabel *)v4->_countLabel setFont:v21];

    [(UILabel *)v4->_saveLabel setLineBreakMode:4];
    v22 = [(ICDocCamSaveButton *)v4 layer];
    [v22 setCornerRadius:14.0];

    [(ICDocCamSaveButton *)v4 setClipsToBounds:1];
    v23 = [MEMORY[0x263F1C550] whiteColor];
    [(ICDocCamSaveButton *)v4 setBackgroundColor:v23];

    v24 = [(ICDocCamSaveButton *)v4 heightAnchor];
    v25 = [v24 constraintEqualToConstant:28.0];
    [v25 setActive:1];

    [(UILabel *)v4->_countLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ICDocCamSaveButton *)v4 addSubview:v4->_countLabel];
    [(UILabel *)v4->_saveLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ICDocCamSaveButton *)v4 addSubview:v4->_saveLabel];
    v26 = [MEMORY[0x263F1C550] blackColor];
    v27 = [(ICDocCamSaveButton *)v4 countLabel];
    [v27 setTextColor:v26];

    v28 = [MEMORY[0x263F1C550] blackColor];
    v29 = [(ICDocCamSaveButton *)v4 saveLabel];
    [v29 setTextColor:v28];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3 = [(ICDocCamSaveButton *)self window];
  v4 = [v3 windowScene];
  uint64_t v5 = [v4 interfaceOrientation];

  v6 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = (unint64_t)(v5 - 1) > 1;
  }
  if (v8) {
    double v9 = 2147483650.0;
  }
  else {
    double v9 = (double)[(ICDocCamSaveButton *)self maxWidthForPortraitIPhone];
  }
  if ([(ICDocCamSaveButton *)self documentCount] >= 2) {
    double v10 = 3.0;
  }
  else {
    double v10 = 0.0;
  }
  if ([(ICDocCamSaveButton *)self documentCount] >= 2) {
    double v11 = 12.0;
  }
  else {
    double v11 = 18.0;
  }
  double v12 = *MEMORY[0x263F1D338];
  int v13 = 17;
  while (1)
  {
    int v14 = v13;
    if (!v7)
    {
      v15 = [MEMORY[0x263F1C658] systemFontOfSize:(double)v13 weight:v12];
      uint64_t v16 = [(ICDocCamSaveButton *)self saveLabel];
      [v16 setFont:v15];

      v17 = [MEMORY[0x263F1C658] systemFontOfSize:(double)v14 weight:v12];
      v18 = [(ICDocCamSaveButton *)self countLabel];
      [v18 setFont:v17];
    }
    double v19 = [(ICDocCamSaveButton *)self countLabel];
    [v19 sizeToFit];

    v20 = [(ICDocCamSaveButton *)self saveLabel];
    [v20 sizeToFit];

    v21 = [(ICDocCamSaveButton *)self countLabel];
    [v21 frame];
    double v23 = v22;

    v24 = [(ICDocCamSaveButton *)self saveLabel];
    [v24 frame];
    double v26 = v25;

    double v27 = v10 + v23 + v26 + v11 * 2.0;
    if (v27 <= v9) {
      break;
    }
    if (v14 <= 15) {
      double v10 = 0.0;
    }
    int v13 = v14 - 1;
    if ((v14 - 1) <= 0xE)
    {
      double v28 = v27 - v9;
      if (v14 > 15) {
        double v28 = 0.0;
      }
      double v26 = v26 - v28;
      break;
    }
  }
  v29 = [(ICDocCamSaveButton *)self layoutConstraints];

  if (v29)
  {
    v30 = (void *)MEMORY[0x263F08938];
    objc_super v31 = [(ICDocCamSaveButton *)self layoutConstraints];
    [v30 deactivateConstraints:v31];

    id v32 = [(ICDocCamSaveButton *)self layoutConstraints];
    [v32 removeAllObjects];
  }
  else
  {
    id v32 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(ICDocCamSaveButton *)self setLayoutConstraints:v32];
  }

  v33 = [(ICDocCamSaveButton *)self layoutConstraints];
  v34 = [(ICDocCamSaveButton *)self countLabel];
  v35 = [v34 trailingAnchor];
  v36 = [(ICDocCamSaveButton *)self trailingAnchor];
  v37 = [v35 constraintEqualToAnchor:v36 constant:-v11];
  [v33 addObject:v37];

  v38 = [(ICDocCamSaveButton *)self layoutConstraints];
  v39 = [(ICDocCamSaveButton *)self countLabel];
  v40 = [v39 widthAnchor];
  v41 = [v40 constraintEqualToConstant:v23];
  [v38 addObject:v41];

  v42 = [(ICDocCamSaveButton *)self layoutConstraints];
  v43 = [(ICDocCamSaveButton *)self countLabel];
  v44 = [v43 centerYAnchor];
  v45 = [(ICDocCamSaveButton *)self centerYAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  [v42 addObject:v46];

  v47 = [(ICDocCamSaveButton *)self layoutConstraints];
  v48 = [(ICDocCamSaveButton *)self saveLabel];
  v49 = [v48 trailingAnchor];
  v50 = [(ICDocCamSaveButton *)self countLabel];
  v51 = [v50 leadingAnchor];
  v52 = [v49 constraintEqualToAnchor:v51 constant:-v10];
  [v47 addObject:v52];

  v53 = [(ICDocCamSaveButton *)self layoutConstraints];
  v54 = [(ICDocCamSaveButton *)self saveLabel];
  v55 = [v54 widthAnchor];
  v56 = [v55 constraintEqualToConstant:v26];
  [v53 addObject:v56];

  v57 = [(ICDocCamSaveButton *)self layoutConstraints];
  v58 = [(ICDocCamSaveButton *)self saveLabel];
  v59 = [v58 centerYAnchor];
  v60 = [(ICDocCamSaveButton *)self centerYAnchor];
  v61 = [v59 constraintEqualToAnchor:v60];
  [v57 addObject:v61];

  v62 = [(ICDocCamSaveButton *)self layoutConstraints];
  v63 = [(ICDocCamSaveButton *)self widthAnchor];
  v64 = [v63 constraintEqualToConstant:v10 + v26 + v23 + v11 * 2.0];
  [v62 addObject:v64];

  v65 = (void *)MEMORY[0x263F08938];
  id v66 = [(ICDocCamSaveButton *)self layoutConstraints];
  [v65 activateConstraints:v66];
}

- (void)setDocumentCount:(int64_t)a3
{
  self->_documentCount = a3;
  v4 = -[ICDocCamSaveButton saveButtonTitleForDocumentCount:](self, "saveButtonTitleForDocumentCount:");
  uint64_t v5 = [(ICDocCamSaveButton *)self saveLabel];
  [v5 setText:v4];

  v6 = [(ICDocCamSaveButton *)self saveButtonCountStringForDocumentCount:self->_documentCount];
  uint64_t v7 = [(ICDocCamSaveButton *)self countLabel];
  [v7 setText:v6];

  [(ICDocCamSaveButton *)self setNeedsLayout];

  [(ICDocCamSaveButton *)self layoutIfNeeded];
}

- (id)saveButtonTitleForDocumentCount:(unint64_t)a3
{
  v3 = +[DCLocalization localizedStringForKey:@"Save" value:@"Save" table:@"Localizable"];

  return v3;
}

- (id)saveButtonCountStringForDocumentCount:(unint64_t)a3
{
  if (a3 < 2)
  {
    v6 = &stru_26C7D5180;
  }
  else
  {
    v4 = NSString;
    uint64_t v5 = +[DCLocalization localizedStringForKey:@"SAVE_%lu_SCANNED_IMAGES_COUNT" value:@"SAVE_%lu_SCANNED_IMAGES_COUNT" table:@"Localizable"];
    objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)accessibilityLabel
{
  v3 = +[DCLocalization localizedStringForKey:@"Save" value:@"Save" table:@"Localizable"];
  v4 = +[DCLocalization localizedStringForKey:@"%lu scans" value:@"%lu scans" table:@"Localizable"];
  uint64_t v5 = objc_msgSend(NSString, "localizedStringWithFormat:", v4, -[ICDocCamSaveButton documentCount](self, "documentCount"));
  double v12 = __DCAccessibilityStringForVariables(1, v3, v6, v7, v8, v9, v10, v11, (uint64_t)v5);

  return v12;
}

- (id)accessibilityUserInputLabels
{
  v7[2] = *MEMORY[0x263EF8340];
  v3 = +[DCLocalization localizedStringForKey:@"Save" value:@"Save" table:@"Localizable"];
  v7[0] = v3;
  v4 = [(ICDocCamSaveButton *)self accessibilityLabel];
  v7[1] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  return v5;
}

- (id)accessibilityHint
{
  return +[DCLocalization localizedStringForKey:@"Double tap to save this document." value:@"Double tap to save this document." table:@"Localizable"];
}

- (int64_t)documentCount
{
  return self->_documentCount;
}

- (int64_t)maxWidthForPortraitIPhone
{
  return self->_maxWidthForPortraitIPhone;
}

- (void)setMaxWidthForPortraitIPhone:(int64_t)a3
{
  self->_maxWidthForPortraitIPhone = a3;
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (void)setCountLabel:(id)a3
{
}

- (UILabel)saveLabel
{
  return self->_saveLabel;
}

- (void)setSaveLabel:(id)a3
{
}

- (NSMutableArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_saveLabel, 0);

  objc_storeStrong((id *)&self->_countLabel, 0);
}

@end