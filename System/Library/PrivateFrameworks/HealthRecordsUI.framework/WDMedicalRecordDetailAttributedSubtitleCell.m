@interface WDMedicalRecordDetailAttributedSubtitleCell
- (NSAttributedString)attributedSubtitle;
- (void)setAttributedSubtitle:(id)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation WDMedicalRecordDetailAttributedSubtitleCell

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = [(WDMedicalRecordDetailSubtitleCell *)self subtitleLabel];
  [v5 setAttributedText:v4];
}

- (NSAttributedString)attributedSubtitle
{
  v2 = [(WDMedicalRecordDetailSubtitleCell *)self subtitleLabel];
  v3 = [v2 text];

  return (NSAttributedString *)v3;
}

- (void)setAttributedSubtitle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end