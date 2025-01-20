@interface AVTUIFontRepository
+ (id)appropriateContentSizeCategoryForCategory:(id)a3 minCategory:(id)a4 maxCategory:(id)a5;
+ (id)attributeTitleButtonFont;
+ (id)attributeTitleFont;
+ (id)attributeViewLabelFont;
+ (id)avatarActionButtonTitleFont;
+ (id)funCamItemTitleFont;
+ (id)groupDialLabelFont;
+ (id)groupListLabelFont;
+ (id)keyboardRecentsSplashContinueButtonFont;
+ (id)keyboardRecentsSplashSubtitleFont;
+ (id)keyboardRecentsSplashTitleFont;
+ (id)largeTitleTextStyle;
+ (id)multicolorPickerLabelFont;
+ (id)splashContinueButtonFont;
+ (id)splashSubTitleFont;
+ (id)splashTitleFont;
+ (id)templateInstructionLabelFont;
+ (id)templateTitleLabelFont;
+ (id)userInfoLabelFont;
@end

@implementation AVTUIFontRepository

+ (id)appropriateContentSizeCategoryForCategory:(id)a3 minCategory:(id)a4 maxCategory:(id)a5
{
  v21[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (NSString *)a4;
  v9 = (NSString *)a5;
  v10 = (NSString *)v7;
  if (UIContentSizeCategoryCompareToCategory(v8, v9) == NSOrderedDescending)
  {
    v11 = (void *)MEMORY[0x263EFF940];
    uint64_t v12 = *MEMORY[0x263EFF498];
    v20 = @"minCategory";
    v21[0] = v8;
    v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v14 = (id)[v11 exceptionWithName:v12 reason:@"Min content size category must be less than or equal to max content size category" userInfo:v13];
  }
  NSComparisonResult v15 = UIContentSizeCategoryCompareToCategory(v8, v10);
  v16 = v8;
  if (v15 == NSOrderedDescending
    || (NSComparisonResult v17 = UIContentSizeCategoryCompareToCategory(v10, v9), v16 = v9, v18 = v10, v17 == NSOrderedDescending))
  {
    v18 = v16;
  }
  return v18;
}

+ (id)splashTitleFont
{
  v3 = [MEMORY[0x263F1C408] sharedApplication];
  v4 = [v3 preferredContentSizeCategory];
  v5 = [a1 appropriateContentSizeCategoryForCategory:v4 minCategory:*MEMORY[0x263F1D178] maxCategory:*MEMORY[0x263F1D148]];

  [a1 largeTitleTextStyle];
  v6 = (void *)CTFontDescriptorCreateWithTextStyle();
  id v7 = [v6 fontDescriptorWithSymbolicTraits:2];
  v8 = [MEMORY[0x263F1C658] fontWithDescriptor:v7 size:0.0];

  return v8;
}

+ (id)splashSubTitleFont
{
  v3 = [MEMORY[0x263F1C408] sharedApplication];
  v4 = [v3 preferredContentSizeCategory];
  v5 = [a1 appropriateContentSizeCategoryForCategory:v4 minCategory:*MEMORY[0x263F1D178] maxCategory:*MEMORY[0x263F1D148]];

  v6 = (void *)CTFontDescriptorCreateWithTextStyle();
  id v7 = [MEMORY[0x263F1C658] fontWithDescriptor:v6 size:0.0];

  return v7;
}

+ (id)splashContinueButtonFont
{
  v3 = [MEMORY[0x263F1C408] sharedApplication];
  v4 = [v3 preferredContentSizeCategory];
  v5 = [a1 appropriateContentSizeCategoryForCategory:v4 minCategory:*MEMORY[0x263F1D180] maxCategory:*MEMORY[0x263F1D148]];

  v6 = (void *)CTFontDescriptorCreateWithTextStyle();
  id v7 = [v6 fontDescriptorWithSymbolicTraits:2];
  v8 = [MEMORY[0x263F1C658] fontWithDescriptor:v7 size:0.0];

  return v8;
}

+ (id)attributeTitleFont
{
  v3 = [MEMORY[0x263F1C408] sharedApplication];
  v4 = [v3 preferredContentSizeCategory];
  v5 = [a1 appropriateContentSizeCategoryForCategory:v4 minCategory:*MEMORY[0x263F1D178] maxCategory:*MEMORY[0x263F1D148]];

  v6 = (void *)CTFontDescriptorCreateWithTextStyle();
  id v7 = [v6 fontDescriptorWithSymbolicTraits:2];
  v8 = [MEMORY[0x263F1C658] fontWithDescriptor:v7 size:0.0];

  return v8;
}

+ (id)attributeTitleButtonFont
{
  v3 = [MEMORY[0x263F1C408] sharedApplication];
  v4 = [v3 preferredContentSizeCategory];
  v5 = [a1 appropriateContentSizeCategoryForCategory:v4 minCategory:*MEMORY[0x263F1D178] maxCategory:*MEMORY[0x263F1D148]];

  v6 = (void *)CTFontDescriptorCreateWithTextStyle();
  id v7 = [MEMORY[0x263F1C658] fontWithDescriptor:v6 size:0.0];

  return v7;
}

+ (id)templateTitleLabelFont
{
  v2 = (void *)MEMORY[0x263F1C660];
  v3 = [a1 largeTitleTextStyle];
  v4 = [v2 preferredFontDescriptorWithTextStyle:v3 addingSymbolicTraits:2 options:0];

  v5 = [MEMORY[0x263F1C658] fontWithDescriptor:v4 size:0.0];

  return v5;
}

+ (id)templateInstructionLabelFont
{
  return (id)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
}

+ (id)avatarActionButtonTitleFont
{
  v14[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D308] addingSymbolicTraits:0 options:0];
  v3 = [v2 fontAttributes];
  v4 = (void *)[v3 mutableCopy];

  uint64_t v13 = *MEMORY[0x263F1D350];
  v5 = [NSNumber numberWithDouble:*MEMORY[0x263F1D338]];
  v14[0] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x263F1D210]];

  id v7 = (void *)MEMORY[0x263F1C658];
  v8 = (void *)MEMORY[0x263F1C660];
  v9 = (void *)[v4 copy];
  v10 = [v8 fontDescriptorWithFontAttributes:v9];
  v11 = [v7 fontWithDescriptor:v10 size:0.0];

  return v11;
}

+ (id)userInfoLabelFont
{
  v15[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F1C408] sharedApplication];
  v4 = [v3 preferredContentSizeCategory];
  v5 = [a1 appropriateContentSizeCategoryForCategory:v4 minCategory:*MEMORY[0x263F1D180] maxCategory:*MEMORY[0x263F1D148]];

  v6 = (void *)CTFontDescriptorCreateWithTextStyle();
  uint64_t v14 = *MEMORY[0x263F1D210];
  uint64_t v12 = *MEMORY[0x263F1D230];
  uint64_t v13 = &unk_26BF4D4F0;
  id v7 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v9 = [v6 fontDescriptorByAddingAttributes:v8];

  v10 = [MEMORY[0x263F1C658] fontWithDescriptor:v9 size:0.0];

  return v10;
}

+ (id)groupDialLabelFont
{
  v3 = [MEMORY[0x263F1C408] sharedApplication];
  v4 = [v3 preferredContentSizeCategory];
  v5 = [a1 appropriateContentSizeCategoryForCategory:v4 minCategory:*MEMORY[0x263F1D178] maxCategory:*MEMORY[0x263F1D148]];

  v6 = (void *)CTFontDescriptorCreateWithTextStyle();
  id v7 = [v6 fontDescriptorWithSymbolicTraits:2];
  v8 = [MEMORY[0x263F1C658] fontWithDescriptor:v7 size:0.0];

  return v8;
}

+ (id)groupListLabelFont
{
  return (id)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
}

+ (id)multicolorPickerLabelFont
{
  v3 = [MEMORY[0x263F1C408] sharedApplication];
  v4 = [v3 preferredContentSizeCategory];
  v5 = [a1 appropriateContentSizeCategoryForCategory:v4 minCategory:*MEMORY[0x263F1D178] maxCategory:*MEMORY[0x263F1D148]];

  v6 = (void *)CTFontDescriptorCreateWithTextStyle();
  id v7 = [v6 fontDescriptorWithSymbolicTraits:2];
  v8 = [MEMORY[0x263F1C658] fontWithDescriptor:v7 size:0.0];

  return v8;
}

+ (id)attributeViewLabelFont
{
  v2 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D278]];
  v3 = [v2 fontDescriptorWithSymbolicTraits:2];
  v4 = [MEMORY[0x263F1C658] fontWithDescriptor:v3 size:0.0];

  return v4;
}

+ (id)funCamItemTitleFont
{
  v15[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F1C408] sharedApplication];
  v4 = [v3 preferredContentSizeCategory];
  v5 = [a1 appropriateContentSizeCategoryForCategory:v4 minCategory:*MEMORY[0x263F1D178] maxCategory:*MEMORY[0x263F1D170]];

  v6 = (void *)CTFontDescriptorCreateWithTextStyle();
  uint64_t v14 = *MEMORY[0x263F1D210];
  uint64_t v12 = *MEMORY[0x263F1D230];
  uint64_t v13 = &unk_26BF4D4F0;
  id v7 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v9 = [v6 fontDescriptorByAddingAttributes:v8];

  v10 = [MEMORY[0x263F1C658] fontWithDescriptor:v9 size:0.0];

  return v10;
}

+ (id)keyboardRecentsSplashTitleFont
{
  v11[1] = *MEMORY[0x263EF8340];
  v2 = (void *)CTFontDescriptorCreateWithTextStyle();
  uint64_t v10 = *MEMORY[0x263F1D210];
  uint64_t v8 = *MEMORY[0x263F1D230];
  v9 = &unk_26BF4D4F0;
  v3 = [NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v11[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v5 = [v2 fontDescriptorByAddingAttributes:v4];

  v6 = [MEMORY[0x263F1C658] fontWithDescriptor:v5 size:0.0];

  return v6;
}

+ (id)keyboardRecentsSplashSubtitleFont
{
  v11[1] = *MEMORY[0x263EF8340];
  v2 = (void *)CTFontDescriptorCreateWithTextStyle();
  uint64_t v10 = *MEMORY[0x263F1D210];
  uint64_t v8 = *MEMORY[0x263F1D230];
  v9 = &unk_26BF4D508;
  v3 = [NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v11[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v5 = [v2 fontDescriptorByAddingAttributes:v4];

  v6 = [MEMORY[0x263F1C658] fontWithDescriptor:v5 size:0.0];

  return v6;
}

+ (id)keyboardRecentsSplashContinueButtonFont
{
  v11[1] = *MEMORY[0x263EF8340];
  v2 = (void *)CTFontDescriptorCreateWithTextStyle();
  uint64_t v10 = *MEMORY[0x263F1D210];
  uint64_t v8 = *MEMORY[0x263F1D230];
  v9 = &unk_26BF4D4F0;
  v3 = [NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v11[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v5 = [v2 fontDescriptorByAddingAttributes:v4];

  v6 = [MEMORY[0x263F1C658] fontWithDescriptor:v5 size:0.0];

  return v6;
}

+ (id)largeTitleTextStyle
{
  return (id)*MEMORY[0x263F1D2B0];
}

@end