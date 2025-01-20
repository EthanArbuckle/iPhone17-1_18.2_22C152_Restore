@interface SettingsProfileActionCell
- (SettingsProfileActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation SettingsProfileActionCell

- (SettingsProfileActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SettingsProfileActionCell;
  v5 = [(SettingsProfileCell *)&v9 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v7 = [(SettingsProfileCell *)v5 textLabel];
    [v7 setFont:v6];
  }
  return v5;
}

@end