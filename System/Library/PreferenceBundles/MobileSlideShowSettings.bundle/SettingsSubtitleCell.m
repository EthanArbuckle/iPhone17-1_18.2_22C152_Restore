@interface SettingsSubtitleCell
+ (int64_t)cellStyle;
- (SettingsSubtitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation SettingsSubtitleCell

- (SettingsSubtitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SettingsSubtitleCell;
  v5 = [(SettingsSubtitleCell *)&v9 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(SettingsSubtitleCell *)v5 detailTextLabel];
    [v7 setNumberOfLines:0];
  }
  return v6;
}

+ (int64_t)cellStyle
{
  return 3;
}

@end