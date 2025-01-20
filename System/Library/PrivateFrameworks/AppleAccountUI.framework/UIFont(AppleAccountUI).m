@interface UIFont(AppleAccountUI)
+ (id)aa_fontForLargeButton;
+ (id)aa_fontForLargerInformationLabel;
+ (id)aa_fontForPageTitle;
+ (id)aa_fontForPrimaryInformationLabel;
+ (uint64_t)aa_messageFontForTraitCollection:()AppleAccountUI;
+ (uint64_t)aa_titleFontForTraitCollection:()AppleAccountUI;
@end

@implementation UIFont(AppleAccountUI)

+ (id)aa_fontForPageTitle
{
  v0 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  unint64_t v2 = v1 & 0xFFFFFFFFFFFFFFFBLL;
  v3 = (void *)MEMORY[0x263F81708];
  v4 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  v5 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  double v7 = 32.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v7 = 36.0;
  }
  [v4 scaledValueForValue:v7];
  if (v2 == 1) {
    objc_msgSend(v3, "_thinSystemFontOfSize:");
  }
  else {
  v8 = objc_msgSend(v3, "_lightSystemFontOfSize:");
  }

  return v8;
}

+ (id)aa_fontForLargeButton
{
  v0 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  unint64_t v2 = v1 & 0xFFFFFFFFFFFFFFFBLL;
  v3 = (void *)MEMORY[0x263F81708];
  v4 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  v5 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  double v7 = 23.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v7 = 26.0;
  }
  [v4 scaledValueForValue:v7];
  if (v2 == 1) {
    objc_msgSend(v3, "_thinSystemFontOfSize:");
  }
  else {
  v8 = objc_msgSend(v3, "_lightSystemFontOfSize:");
  }

  return v8;
}

+ (id)aa_fontForPrimaryInformationLabel
{
  v0 = (void *)MEMORY[0x263F81708];
  uint64_t v1 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  [v1 scaledValueForValue:13.0];
  unint64_t v2 = objc_msgSend(v0, "systemFontOfSize:");

  return v2;
}

+ (id)aa_fontForLargerInformationLabel
{
  v0 = (void *)MEMORY[0x263F81708];
  uint64_t v1 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  unint64_t v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  double v4 = 17.0;
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v4 = 23.0;
  }
  [v1 scaledValueForValue:v4];
  v5 = objc_msgSend(v0, "systemFontOfSize:");

  return v5;
}

+ (uint64_t)aa_titleFontForTraitCollection:()AppleAccountUI
{
  return [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83610]];
}

+ (uint64_t)aa_messageFontForTraitCollection:()AppleAccountUI
{
  return [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83618]];
}

@end