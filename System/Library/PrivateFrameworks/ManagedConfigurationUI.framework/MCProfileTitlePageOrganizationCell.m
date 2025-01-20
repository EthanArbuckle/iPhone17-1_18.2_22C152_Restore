@interface MCProfileTitlePageOrganizationCell
- (MCProfileTitlePageOrganizationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)appleID;
- (NSString)organizationName;
- (UILabel)appleIDLabel;
- (UILabel)appleIDValueLabel;
- (UILabel)organizationLabel;
- (UILabel)organizationValueLabel;
- (UIStackView)labelStackView;
- (id)_createHorizontalStackWithViews:(id)a3;
- (id)_createLabelLabel;
- (id)_createValueLabel;
- (id)_createVerticalStackWithViews:(id)a3;
- (void)_updateConstraintWithStack:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setAppleIDLabel:(id)a3;
- (void)setAppleIDValueLabel:(id)a3;
- (void)setLabelStackView:(id)a3;
- (void)setOrganizationLabel:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setOrganizationValueLabel:(id)a3;
- (void)updateProgressWithTranslationDistance:(double)a3 referenceDistance:(double)a4 isScrolling:(BOOL)a5;
@end

@implementation MCProfileTitlePageOrganizationCell

- (MCProfileTitlePageOrganizationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v31[2] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)MCProfileTitlePageOrganizationCell;
  v4 = [(MCProfileTitlePageOrganizationCell *)&v28 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(MCProfileTitlePageOrganizationCell *)v4 setUserInteractionEnabled:0];
    v6 = [(MCProfileTitlePageOrganizationCell *)v5 contentView];
    [v6 setClipsToBounds:0];

    v7 = [MEMORY[0x1E4F428B8] clearColor];
    [(MCProfileTitlePageOrganizationCell *)v5 setBackgroundColor:v7];

    uint64_t v8 = [(MCProfileTitlePageOrganizationCell *)v5 _createLabelLabel];
    organizationLabel = v5->_organizationLabel;
    v5->_organizationLabel = (UILabel *)v8;

    v10 = MCUILocalizedString(@"ORGANIZATION_LABEL_TITLE");
    [(UILabel *)v5->_organizationLabel setText:v10];

    uint64_t v11 = [(MCProfileTitlePageOrganizationCell *)v5 _createLabelLabel];
    appleIDLabel = v5->_appleIDLabel;
    v5->_appleIDLabel = (UILabel *)v11;

    v13 = MCUILocalizedString(@"APPLE_ACCOUNT_LABEL_TITLE");
    [(UILabel *)v5->_appleIDLabel setText:v13];

    uint64_t v14 = [(MCProfileTitlePageOrganizationCell *)v5 _createValueLabel];
    organizationValueLabel = v5->_organizationValueLabel;
    v5->_organizationValueLabel = (UILabel *)v14;

    uint64_t v16 = [(MCProfileTitlePageOrganizationCell *)v5 _createValueLabel];
    appleIDValueLabel = v5->_appleIDValueLabel;
    v5->_appleIDValueLabel = (UILabel *)v16;

    v31[0] = v5->_organizationLabel;
    v31[1] = v5->_organizationValueLabel;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    v19 = [(MCProfileTitlePageOrganizationCell *)v5 _createHorizontalStackWithViews:v18];

    v30[0] = v5->_appleIDLabel;
    v30[1] = v5->_appleIDValueLabel;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    v21 = [(MCProfileTitlePageOrganizationCell *)v5 _createHorizontalStackWithViews:v20];

    v29[0] = v19;
    v29[1] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    v23 = [(MCProfileTitlePageOrganizationCell *)v5 _createVerticalStackWithViews:v22];

    labelStackView = v5->_labelStackView;
    v5->_labelStackView = v23;
    v25 = v23;

    v26 = [(MCProfileTitlePageOrganizationCell *)v5 contentView];
    [v26 addSubview:v25];

    [(MCProfileTitlePageOrganizationCell *)v5 _updateConstraintWithStack:v25];
  }
  return v5;
}

- (void)_updateConstraintWithStack:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13 = @"stack";
  v14[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v7 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"|-%f-[stack]-%f-|", 0x4034000000000000, 0x4034000000000000);
  v9 = [v7 constraintsWithVisualFormat:v8 options:0 metrics:0 views:v6];

  v10 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[stack]-0-|" options:0 metrics:0 views:v6];

  uint64_t v11 = [(MCProfileTitlePageOrganizationCell *)self contentView];
  [v11 addConstraints:v9];

  v12 = [(MCProfileTitlePageOrganizationCell *)self contentView];
  [v12 addConstraints:v10];
}

- (id)_createLabelLabel
{
  v2 = objc_opt_new();
  v3 = [MEMORY[0x1E4F42A30] systemFontOfSize:17.0];
  [v2 setFont:v3];

  v4 = [MEMORY[0x1E4F428B8] systemGrayColor];
  [v2 setTextColor:v4];

  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v2;
}

- (id)_createValueLabel
{
  v2 = objc_opt_new();
  v3 = [MEMORY[0x1E4F42A30] systemFontOfSize:17.0];
  [v2 setFont:v3];

  LODWORD(v4) = 1132068864;
  [v2 setContentCompressionResistancePriority:0 forAxis:v4];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v2;
}

- (id)_createHorizontalStackWithViews:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F42E20];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithArrangedSubviews:v4];

  [v5 setSpacing:5.0];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setAxis:0];
  [v5 setAlignment:3];
  [v5 setDistribution:4];
  LODWORD(v6) = 1132068864;
  [v5 setContentCompressionResistancePriority:0 forAxis:v6];
  return v5;
}

- (id)_createVerticalStackWithViews:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F42E20];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithArrangedSubviews:v4];

  [v5 setAxis:1];
  [v5 setAlignment:3];
  [v5 setDistribution:1];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setSpacing:10.0];
  return v5;
}

- (void)setOrganizationName:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_organizationName, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_organizationName, a3);
    id v5 = [(MCProfileTitlePageOrganizationCell *)self organizationValueLabel];
    [v5 setText:v6];
  }
}

- (void)setAppleID:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_appleID, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_appleID, a3);
    id v5 = [(MCProfileTitlePageOrganizationCell *)self appleIDValueLabel];
    [v5 setText:v6];
  }
}

- (void)updateProgressWithTranslationDistance:(double)a3 referenceDistance:(double)a4 isScrolling:(BOOL)a5
{
  [(MCProfileTitlePageOrganizationCell *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13 + a3;
  id v15 = [(MCProfileTitlePageOrganizationCell *)self contentView];
  objc_msgSend(v15, "setFrame:", v8, v14, v10, v12);
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (UILabel)organizationLabel
{
  return self->_organizationLabel;
}

- (void)setOrganizationLabel:(id)a3
{
}

- (UILabel)appleIDLabel
{
  return self->_appleIDLabel;
}

- (void)setAppleIDLabel:(id)a3
{
}

- (UILabel)organizationValueLabel
{
  return self->_organizationValueLabel;
}

- (void)setOrganizationValueLabel:(id)a3
{
}

- (UILabel)appleIDValueLabel
{
  return self->_appleIDValueLabel;
}

- (void)setAppleIDValueLabel:(id)a3
{
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_appleIDValueLabel, 0);
  objc_storeStrong((id *)&self->_organizationValueLabel, 0);
  objc_storeStrong((id *)&self->_appleIDLabel, 0);
  objc_storeStrong((id *)&self->_organizationLabel, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
}

@end