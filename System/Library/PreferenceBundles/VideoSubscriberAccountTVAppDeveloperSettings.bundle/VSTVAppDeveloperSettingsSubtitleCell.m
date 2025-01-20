@interface VSTVAppDeveloperSettingsSubtitleCell
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation VSTVAppDeveloperSettingsSubtitleCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSTVAppDeveloperSettingsSubtitleCell;
  [(VSTVAppDeveloperSettingsSubtitleCell *)&v4 refreshCellContentsWithSpecifier:a3];
  [(VSTVAppDeveloperSettingsSubtitleCell *)self setNeedsUpdateConfiguration];
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4 = a3;
  id v13 = [(VSTVAppDeveloperSettingsSubtitleCell *)self specifier];
  id v5 = [v4 copy];

  v6 = +[UIListContentConfiguration subtitleCellConfiguration];
  v7 = [v6 updatedConfigurationForState:v5];

  v8 = [v13 objectForKeyedSubscript:PSTitleKey];
  [v7 setText:v8];

  v9 = +[UIColor grayColor];
  v10 = [v7 secondaryTextProperties];
  [v10 setColor:v9];

  v11 = [v13 objectForKeyedSubscript:PSTableCellSubtitleTextKey];
  [v7 setSecondaryText:v11];

  v12 = [v13 identifier];
  [(VSTVAppDeveloperSettingsSubtitleCell *)self setAccessibilityIdentifier:v12];

  [(VSTVAppDeveloperSettingsSubtitleCell *)self setContentConfiguration:v7];
}

@end