@interface MKFontManager
+ (id)sharedManager;
+ (void)setUseSmallFont:(BOOL)a3;
- (BOOL)useSmallFont;
- (UIFont)attributionFont;
- (UIFont)bodyFont;
- (UIFont)boldBodyFont;
- (UIFont)boldSectionHeaderFont;
- (UIFont)brandTitleFont;
- (UIFont)largeTitleFont;
- (UIFont)largeTitleFontStatic;
- (UIFont)largeTitleHeaderFont;
- (UIFont)lookAroundAttributionButtonFont;
- (UIFont)lookAroundButtonFont;
- (UIFont)lookAroundLabelFont;
- (UIFont)lookAroundSecondaryLabelFont;
- (UIFont)lookAroundTertiaryLabelFont;
- (UIFont)mediumBodyFont;
- (UIFont)mediumTitleFont;
- (UIFont)ratingCallToActionGlyphFont;
- (UIFont)ratingCallToActionHeaderLabelFont;
- (UIFont)ratingCallToActionLabelFont;
- (UIFont)ratingOverallFont;
- (UIFont)ratingOverallPercentageFont;
- (UIFont)recommendSubtitleFont;
- (UIFont)rowButtonFont;
- (UIFont)rowGlyphButtonFont;
- (UIFont)sectionHeaderButtonFont;
- (UIFont)sectionHeaderFont;
- (UIFont)semiboldButtonCellFont;
- (UIFont)smallAttributionFont;
- (UIFont)subtitleFont;
- (UIFont)textBlurbFont;
- (id)iconFontToMatch:(id)a3;
- (void)setUseSmallFont:(BOOL)a3;
@end

@implementation MKFontManager

void __30__MKFontManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB315DE8;
  qword_1EB315DE8 = (uint64_t)v1;
}

+ (void)setUseSmallFont:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [a1 sharedManager];
  [v4 setUseSmallFont:v3];
}

- (void)setUseSmallFont:(BOOL)a3
{
  self->_useSmallFont = a3;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__MKFontManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB315DF0 != -1) {
    dispatch_once(&qword_1EB315DF0, block);
  }
  v2 = (void *)qword_1EB315DE8;

  return v2;
}

- (UIFont)largeTitleFontStatic
{
  if (self->_useSmallFont) {
    [MEMORY[0x1E4F42A30] boldSystemFontOfSize:17.0];
  }
  else {
  v2 = [MEMORY[0x1E4F42A30] systemFontOfSize:22.0 weight:*MEMORY[0x1E4F43908]];
  }

  return (UIFont *)v2;
}

- (UIFont)largeTitleFont
{
  if (self->_useSmallFont) {
    v2 = (void *)MEMORY[0x1E4F43870];
  }
  else {
    v2 = (void *)MEMORY[0x1E4F438F0];
  }
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *v2, 2);

  return (UIFont *)v3;
}

- (UIFont)brandTitleFont
{
  return (UIFont *)[MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438E8]];
}

- (UIFont)subtitleFont
{
  return (UIFont *)[MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C0]];
}

- (UIFont)bodyFont
{
  return (UIFont *)[MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
}

- (UIFont)boldBodyFont
{
  v2 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  BOOL v3 = objc_msgSend(v2, "_mapkit_fontWithSymbolicTraits:", 2);

  return (UIFont *)v3;
}

- (UIFont)mediumTitleFont
{
  v2 = (void *)MEMORY[0x1E4F42A30];
  BOOL v3 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438F8]];
  [v3 pointSize];
  id v4 = objc_msgSend(v2, "systemFontOfSize:weight:");

  return (UIFont *)v4;
}

- (UIFont)mediumBodyFont
{
  v2 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  BOOL v3 = objc_msgSend(v2, "_mapkit_fontWithSymbolicTraits:", *MEMORY[0x1E4F43920]);

  return (UIFont *)v3;
}

- (UIFont)sectionHeaderFont
{
  return (UIFont *)[MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C8]];
}

- (UIFont)sectionHeaderButtonFont
{
  return (UIFont *)[MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C8]];
}

- (UIFont)attributionFont
{
  return (UIFont *)[MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
}

- (UIFont)smallAttributionFont
{
  return (UIFont *)[MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43880]];
}

- (UIFont)rowButtonFont
{
  return (UIFont *)[MEMORY[0x1E4F42A30] systemFontOfSize:11.0 weight:*MEMORY[0x1E4F43920]];
}

- (UIFont)rowGlyphButtonFont
{
  return (UIFont *)[MEMORY[0x1E4F42A30] systemFontOfSize:26.0 weight:*MEMORY[0x1E4F43928]];
}

- (UIFont)ratingOverallFont
{
  v2 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438B8]];
  BOOL v3 = objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E4F43908]);

  return (UIFont *)v3;
}

- (UIFont)ratingOverallPercentageFont
{
  v2 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438F0]];
  BOOL v3 = objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E4F43908]);

  return (UIFont *)v3;
}

- (UIFont)recommendSubtitleFont
{
  v2 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
  BOOL v3 = objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E4F43920]);

  return (UIFont *)v3;
}

- (UIFont)ratingCallToActionGlyphFont
{
  v2 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  BOOL v3 = objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E4F43930]);

  return (UIFont *)v3;
}

- (UIFont)ratingCallToActionLabelFont
{
  v2 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  BOOL v3 = objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E4F43928]);

  return (UIFont *)v3;
}

- (UIFont)ratingCallToActionHeaderLabelFont
{
  v2 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C0]];
  BOOL v3 = objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E4F43928]);

  return (UIFont *)v3;
}

- (UIFont)boldSectionHeaderFont
{
  return (UIFont *)[MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438A0]];
}

- (UIFont)textBlurbFont
{
  v2 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  BOOL v3 = objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E4F43920]);

  return (UIFont *)v3;
}

- (UIFont)semiboldButtonCellFont
{
  v2 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  BOOL v3 = objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E4F43930]);

  return (UIFont *)v3;
}

- (UIFont)largeTitleHeaderFont
{
  v2 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438B8]];
  BOOL v3 = objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E4F43930]);

  return (UIFont *)v3;
}

- (UIFont)lookAroundButtonFont
{
  v2 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C8]];
  BOOL v3 = objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E4F43930]);

  return (UIFont *)v3;
}

- (UIFont)lookAroundLabelFont
{
  v2 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438F0]];
  BOOL v3 = objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E4F43908]);

  return (UIFont *)v3;
}

- (UIFont)lookAroundSecondaryLabelFont
{
  v2 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C8]];
  BOOL v3 = objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E4F43928]);

  return (UIFont *)v3;
}

- (UIFont)lookAroundTertiaryLabelFont
{
  v2 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
  BOOL v3 = objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E4F43928]);

  return (UIFont *)v3;
}

- (UIFont)lookAroundAttributionButtonFont
{
  v2 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43888]];
  BOOL v3 = objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E4F43908]);

  return (UIFont *)v3;
}

- (id)iconFontToMatch:(id)a3
{
  id v3 = a3;
  if (qword_1EB315E00 != -1) {
    dispatch_once(&qword_1EB315E00, &__block_literal_global_13_0);
  }
  id v4 = (void *)qword_1EB315DF8;
  v5 = NSNumber;
  [v3 pointSize];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v7 = [v4 objectForKeyedSubscript:v6];

  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E4F42A30];
    [v3 pointSize];
    v7 = objc_msgSend(v8, "fontWithName:size:", @"pcf");
    if (!v7)
    {
      v9 = (void *)MEMORY[0x1E4F42A30];
      [v3 pointSize];
      v7 = objc_msgSend(v9, "systemFontOfSize:");
    }
    v10 = (void *)qword_1EB315DF8;
    v11 = NSNumber;
    [v3 pointSize];
    v12 = objc_msgSend(v11, "numberWithDouble:");
    [v10 setObject:v7 forKeyedSubscript:v12];
  }

  return v7;
}

void __33__MKFontManager_iconFontToMatch___block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] _mapkitBundle];
  CFURLRef v1 = [v0 URLForResource:@"pcf" withExtension:@"otf"];

  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = (void *)qword_1EB315DF8;
  qword_1EB315DF8 = v2;

  CFErrorRef error = 0;
  if (!CTFontManagerRegisterFontsForURL(v1, kCTFontManagerScopeProcess, &error))
  {
    CFStringRef v4 = CFErrorCopyDescription(error);
    NSLog(&cfstr_FailedToLoadFo.isa, v4);
    CFRelease(v4);
  }
}

- (BOOL)useSmallFont
{
  return self->_useSmallFont;
}

@end