@interface WDAccessTableViewCell
+ (NSString)defaultReuseIdentifier;
- (WDAccessTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation WDAccessTableViewCell

+ (NSString)defaultReuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (WDAccessTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WDAccessTableViewCell;
  v4 = [(WDAccessTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
    v6 = [v5 localizedStringForKey:@"SHARE_DATA_TITLE" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
    v7 = [(WDAccessTableViewCell *)v4 textLabel];
    [v7 setText:v6];

    [(WDAccessTableViewCell *)v4 setAccessoryType:1];
  }
  return v4;
}

@end