@interface AXCaptionFonts
@end

@implementation AXCaptionFonts

void __AXCaptionFonts_block_invoke(id a1)
{
  v13[0] = @"name";
  v13[1] = @"size";
  v14[0] = MACaptionAppearanceSystemFontIdentifier;
  v14[1] = &off_22A458;
  v13[2] = @"displayName";
  v8 = settingsLocString(@"SYSTEM_FONT", @"CaptioningStyle");
  v13[3] = @"isBold";
  v14[2] = v8;
  v14[3] = &__kCFBooleanFalse;
  v1 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  v15[0] = v1;
  v11[0] = @"name";
  v11[1] = @"size";
  v12[0] = MACaptionAppearanceMediumSystemFontIdentifier;
  v12[1] = &off_22A458;
  v11[2] = @"displayName";
  v2 = settingsLocString(@"SYSTEM_FONT_MEDIUM", @"CaptioningStyle");
  v12[2] = v2;
  v12[3] = &__kCFBooleanFalse;
  v11[3] = @"isBold";
  v11[4] = @"category";
  v12[4] = &off_22A470;
  v3 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5];
  v15[1] = v3;
  v9[0] = @"name";
  v9[1] = @"size";
  v10[0] = MACaptionAppearanceMonoSystemFontIdentifier;
  v10[1] = &off_22A458;
  v9[2] = @"displayName";
  v4 = settingsLocString(@"SYSTEM_MONO_FONT", @"CaptioningStyle");
  v10[2] = v4;
  v10[3] = &__kCFBooleanFalse;
  v9[3] = @"isBold";
  v9[4] = @"category";
  v10[4] = &off_22A488;
  v5 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:5];
  v15[2] = v5;
  v15[3] = &off_22CD00;
  v15[4] = &off_22CD28;
  v15[5] = &off_22CD50;
  v15[6] = &off_22CD78;
  v15[7] = &off_22CDA0;
  v15[8] = &off_22CDC8;
  v15[9] = &off_22CDF0;
  v15[10] = &off_22CE18;
  uint64_t v6 = +[NSArray arrayWithObjects:v15 count:11];
  v7 = (void *)AXCaptionFonts_Fonts;
  AXCaptionFonts_Fonts = v6;
}

@end