@interface _SFReportFeedbackIssueHeader
+ (NSString)reuseIdentifier;
- (NSString)text;
- (_SFReportFeedbackIssueHeader)initWithFrame:(CGRect)a3;
- (void)setText:(id)a3;
@end

@implementation _SFReportFeedbackIssueHeader

+ (NSString)reuseIdentifier
{
  return (NSString *)@"feedbackSectionHeader";
}

- (_SFReportFeedbackIssueHeader)initWithFrame:(CGRect)a3
{
  v25[4] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)_SFReportFeedbackIssueHeader;
  v3 = -[_SFReportFeedbackIssueHeader initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    sectionHeaderLabel = v3->_sectionHeaderLabel;
    v3->_sectionHeaderLabel = v4;

    v6 = [MEMORY[0x1E4FB1798] _preferredFontForTextStyle:*MEMORY[0x1E4FB2990] weight:*MEMORY[0x1E4FB29D0]];
    [(UILabel *)v3->_sectionHeaderLabel setFont:v6];

    [(UILabel *)v3->_sectionHeaderLabel setAdjustsFontForContentSizeCategory:1];
    v7 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v3->_sectionHeaderLabel setTextColor:v7];

    [(UILabel *)v3->_sectionHeaderLabel setNumberOfLines:0];
    [(UILabel *)v3->_sectionHeaderLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_SFReportFeedbackIssueHeader *)v3 addSubview:v3->_sectionHeaderLabel];
    v19 = (void *)MEMORY[0x1E4F28DC8];
    v23 = [(UILabel *)v3->_sectionHeaderLabel topAnchor];
    v22 = [(_SFReportFeedbackIssueHeader *)v3 topAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v25[0] = v21;
    v20 = [(UILabel *)v3->_sectionHeaderLabel leadingAnchor];
    v8 = [(_SFReportFeedbackIssueHeader *)v3 leadingAnchor];
    v9 = [v20 constraintEqualToAnchor:v8];
    v25[1] = v9;
    v10 = [(UILabel *)v3->_sectionHeaderLabel trailingAnchor];
    v11 = [(_SFReportFeedbackIssueHeader *)v3 trailingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v25[2] = v12;
    v13 = [(UILabel *)v3->_sectionHeaderLabel bottomAnchor];
    v14 = [(_SFReportFeedbackIssueHeader *)v3 bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v25[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
    [v19 activateConstraints:v16];

    v17 = v3;
  }

  return v3;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return [(UILabel *)self->_sectionHeaderLabel text];
}

- (void).cxx_destruct
{
}

@end