@interface CNFRegAccountsButtonCell
- (void)layoutSubviews;
@end

@implementation CNFRegAccountsButtonCell

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CNFRegAccountsButtonCell;
  [(PSTableCell *)&v7 layoutSubviews];
  v3 = [(PSTableCell *)self valueLabel];
  v4 = [v3 text];
  int v5 = [v4 _appearsToBePhoneNumber];

  if (v5) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 4;
  }
  [v3 setLineBreakMode:v6];
  [v3 setAdjustsFontSizeToFitWidth:1];
  [v3 setMinimumScaleFactor:0.75];
}

@end