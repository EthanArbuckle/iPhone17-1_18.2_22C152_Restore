@interface CDPNavigationTitleLabel
- (CDPNavigationTitleLabel)initWithTitle:(id)a3;
@end

@implementation CDPNavigationTitleLabel

- (CDPNavigationTitleLabel)initWithTitle:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CDPNavigationTitleLabel;
  v5 = [(CDPNavigationTitleLabel *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(CDPNavigationTitleLabel *)v5 setText:v4];
    [(CDPNavigationTitleLabel *)v6 setNumberOfLines:2];
    [(CDPNavigationTitleLabel *)v6 setTextAlignment:1];
    [(CDPNavigationTitleLabel *)v6 setLineBreakMode:4];
    v7 = (void *)MEMORY[0x263F81708];
    uint64_t v8 = *MEMORY[0x263F83618];
    v9 = [MEMORY[0x263F82B60] mainScreen];
    v10 = [v9 traitCollection];
    v11 = [v7 preferredFontForTextStyle:v8 compatibleWithTraitCollection:v10];
    [(CDPNavigationTitleLabel *)v6 setFont:v11];
  }
  return v6;
}

@end