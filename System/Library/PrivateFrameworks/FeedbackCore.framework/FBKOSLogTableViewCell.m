@interface FBKOSLogTableViewCell
- (UILabel)logLabel;
- (void)awakeFromNib;
- (void)setLogLabel:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation FBKOSLogTableViewCell

- (void)awakeFromNib
{
  v8.receiver = self;
  v8.super_class = (Class)FBKOSLogTableViewCell;
  [(FBKOSLogTableViewCell *)&v8 awakeFromNib];
  v3 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F835B8]];
  v4 = [MEMORY[0x263F81708] monospacedSystemFontOfSize:14.0 weight:*MEMORY[0x263F81838]];
  v5 = [v3 scaledFontForFont:v4];
  v6 = [(FBKOSLogTableViewCell *)self logLabel];
  [v6 setFont:v5];

  v7 = [(FBKOSLogTableViewCell *)self logLabel];
  [v7 setAdjustsFontForContentSizeCategory:1];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)FBKOSLogTableViewCell;
  [(FBKOSLogTableViewCell *)&v4 setSelected:a3 animated:a4];
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