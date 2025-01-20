@interface AKPasswordResetAppearance
+ (id)actionButtonFont;
+ (id)closeButtonConfiguration;
+ (id)screenSummaryFont;
+ (id)screenTitleFont;
+ (id)serviceNameFont;
@end

@implementation AKPasswordResetAppearance

+ (id)serviceNameFont
{
  v2 = [MEMORY[0x1E4F42A30] systemFontOfSize:16.0 weight:*MEMORY[0x1E4F43930]];
  v3 = [MEMORY[0x1E4F42A40] defaultMetrics];
  v4 = [v3 scaledFontForFont:v2 maximumPointSize:20.0];

  return v4;
}

+ (id)screenTitleFont
{
  v2 = [MEMORY[0x1E4F42A30] systemFontOfSize:36.0 weight:*MEMORY[0x1E4F43908]];
  v3 = [MEMORY[0x1E4F42A40] defaultMetrics];
  v4 = [v3 scaledFontForFont:v2 maximumPointSize:40.0];

  return v4;
}

+ (id)screenSummaryFont
{
  return (id)objc_msgSend(MEMORY[0x1E4F42A30], "ak_preferredFontForStyle:weight:", *MEMORY[0x1E4F43870], *MEMORY[0x1E4F43928]);
}

+ (id)actionButtonFont
{
  v2 = [MEMORY[0x1E4F42A30] systemFontOfSize:17.0 weight:*MEMORY[0x1E4F43930]];
  v3 = [MEMORY[0x1E4F42A40] defaultMetrics];
  v4 = [v3 scaledFontForFont:v2 maximumPointSize:24.0];

  return v4;
}

+ (id)closeButtonConfiguration
{
  v2 = [MEMORY[0x1E4F427E8] tintedButtonConfiguration];
  v3 = [MEMORY[0x1E4F42A80] systemImageNamed:@"xmark"];
  [v2 setImage:v3];

  [v2 setCornerStyle:4];
  v4 = [MEMORY[0x1E4F42A98] configurationWithPointSize:7 weight:2 scale:15.0];
  [v2 setPreferredSymbolConfigurationForImage:v4];

  objc_msgSend(v2, "setContentInsets:", 7.0, 8.0, 7.0, 8.0);
  v5 = [MEMORY[0x1E4F428B8] systemGrayColor];
  [v2 setBaseForegroundColor:v5];

  v6 = [MEMORY[0x1E4F428B8] systemGray2Color];
  [v2 setBaseBackgroundColor:v6];

  return v2;
}

@end