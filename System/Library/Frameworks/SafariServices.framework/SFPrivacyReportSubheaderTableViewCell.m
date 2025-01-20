@interface SFPrivacyReportSubheaderTableViewCell
- (NSString)subheaderText;
- (SFPrivacyReportSubheaderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setSubheaderText:(id)a3;
@end

@implementation SFPrivacyReportSubheaderTableViewCell

- (SFPrivacyReportSubheaderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v30[4] = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)SFPrivacyReportSubheaderTableViewCell;
  v4 = [(SFPrivacyReportSubheaderTableViewCell *)&v29 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subheaderLabel = v4->_subheaderLabel;
    v4->_subheaderLabel = v5;

    [(UILabel *)v4->_subheaderLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_subheaderLabel setAdjustsFontForContentSizeCategory:1];
    v7 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    [(UILabel *)v4->_subheaderLabel setFont:v7];

    v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v4->_subheaderLabel setTextColor:v8];

    [(UILabel *)v4->_subheaderLabel setNumberOfLines:0];
    v9 = [(SFPrivacyReportSubheaderTableViewCell *)v4 contentView];
    [v9 addSubview:v4->_subheaderLabel];
    v10 = [v9 layoutMarginsGuide];
    v22 = (void *)MEMORY[0x1E4F28DC8];
    v27 = [(UILabel *)v4->_subheaderLabel leadingAnchor];
    v28 = v10;
    v26 = [v10 leadingAnchor];
    v25 = [v27 constraintEqualToAnchor:v26];
    v30[0] = v25;
    v24 = [(UILabel *)v4->_subheaderLabel trailingAnchor];
    v23 = [v10 trailingAnchor];
    v11 = [v24 constraintEqualToAnchor:v23];
    v30[1] = v11;
    v12 = [(UILabel *)v4->_subheaderLabel topAnchor];
    v13 = [v9 topAnchor];
    v14 = [v12 constraintEqualToSystemSpacingBelowAnchor:v13 multiplier:2.0];
    v30[2] = v14;
    v15 = [v9 bottomAnchor];
    v16 = [(UILabel *)v4->_subheaderLabel bottomAnchor];
    v17 = [v15 constraintEqualToSystemSpacingBelowAnchor:v16 multiplier:0.5];
    v30[3] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
    [v22 activateConstraints:v18];

    subheaderText = v4->_subheaderText;
    v4->_subheaderText = (NSString *)&stru_1EFB97EB8;

    v20 = v4;
  }

  return v4;
}

- (void)setSubheaderText:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_subheaderText, "isEqualToString:"))
  {
    v4 = (NSString *)[v7 copy];
    subheaderText = self->_subheaderText;
    self->_subheaderText = v4;

    v6 = [v7 localizedUppercaseString];
    [(UILabel *)self->_subheaderLabel setText:v6];
  }
}

- (NSString)subheaderText
{
  return self->_subheaderText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subheaderText, 0);

  objc_storeStrong((id *)&self->_subheaderLabel, 0);
}

@end