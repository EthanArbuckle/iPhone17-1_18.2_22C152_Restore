@interface HangThresholdTableViewCell
- (void)layoutSubviews;
@end

@implementation HangThresholdTableViewCell

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)HangThresholdTableViewCell;
  [(HangThresholdTableViewCell *)&v10 layoutSubviews];
  v3 = [(HangThresholdTableViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4 + -14.0;
  v6 = [(HangThresholdTableViewCell *)self control];
  [v6 frame];
  double v8 = v7;
  v9 = [(HangThresholdTableViewCell *)self control];
  objc_msgSend(v9, "setFrame:", 7.0, 7.0, v5, v8);
}

@end