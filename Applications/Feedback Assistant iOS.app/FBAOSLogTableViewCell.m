@interface FBAOSLogTableViewCell
- (UILabel)logLabel;
- (void)awakeFromNib;
- (void)setLogLabel:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation FBAOSLogTableViewCell

- (void)awakeFromNib
{
  v8.receiver = self;
  v8.super_class = (Class)FBAOSLogTableViewCell;
  [(FBAOSLogTableViewCell *)&v8 awakeFromNib];
  v3 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleFootnote];
  v4 = +[UIFont monospacedSystemFontOfSize:14.0 weight:UIFontWeightRegular];
  v5 = [v3 scaledFontForFont:v4];
  v6 = [(FBAOSLogTableViewCell *)self logLabel];
  [v6 setFont:v5];

  v7 = [(FBAOSLogTableViewCell *)self logLabel];
  [v7 setAdjustsFontForContentSizeCategory:1];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)FBAOSLogTableViewCell;
  [(FBAOSLogTableViewCell *)&v4 setSelected:a3 animated:a4];
}

- (UILabel)logLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logLabel);

  return (UILabel *)WeakRetained;
}

- (void)setLogLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end