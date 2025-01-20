@interface UIFontDescriptor(MKCrossPlatformExtras)
+ (id)_mapkit_fontFeaturesForTabularFigures;
+ (id)_mapkit_fontFeaturesForTimeDisplayUseMonospace:()MKCrossPlatformExtras;
+ (id)_mapkit_fontMonospaceFeature;
+ (id)_mapkit_fontRoundedColonFeature;
+ (uint64_t)_mapkit_fontFeaturesForTimeDisplay;
- (id)_mapkit_fontDescriptorByAddingFeaturesForTabularFigures;
- (id)_mapkit_fontDescriptorByAddingFeaturesForTimeDisplayUseMonospace:()MKCrossPlatformExtras;
- (uint64_t)_mapkit_fontDescriptorByAddingFeaturesForTimeDisplay;
@end

@implementation UIFontDescriptor(MKCrossPlatformExtras)

+ (id)_mapkit_fontFeaturesForTimeDisplayUseMonospace:()MKCrossPlatformExtras
{
  v5 = (void *)MEMORY[0x1E4F1CA48];
  v6 = objc_msgSend(a1, "_mapkit_fontRoundedColonFeature");
  v7 = [v5 arrayWithObject:v6];

  if (a3)
  {
    v8 = objc_msgSend(a1, "_mapkit_fontMonospaceFeature");
    [v7 addObject:v8];
  }
  v9 = [MEMORY[0x1E4F1C978] arrayWithArray:v7];

  return v9;
}

+ (uint64_t)_mapkit_fontFeaturesForTimeDisplay
{
  return objc_msgSend(a1, "_mapkit_fontFeaturesForTimeDisplayUseMonospace:", 0);
}

+ (id)_mapkit_fontMonospaceFeature
{
  v4[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F43858];
  v3[0] = *MEMORY[0x1E4F43850];
  v3[1] = v0;
  v4[0] = &unk_1ED97E310;
  v4[1] = &unk_1ED97E328;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];

  return v1;
}

+ (id)_mapkit_fontRoundedColonFeature
{
  v4[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F43850];
  v3[0] = *MEMORY[0x1E4F43858];
  v3[1] = v0;
  v4[0] = &unk_1ED97E340;
  v4[1] = &unk_1ED97E358;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];

  return v1;
}

+ (id)_mapkit_fontFeaturesForTabularFigures
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend(a1, "_mapkit_fontMonospaceFeature");
  v4[0] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (uint64_t)_mapkit_fontDescriptorByAddingFeaturesForTimeDisplay
{
  return objc_msgSend(a1, "_mapkit_fontDescriptorByAddingFeaturesForTimeDisplayUseMonospace:", 0);
}

- (id)_mapkit_fontDescriptorByAddingFeaturesForTimeDisplayUseMonospace:()MKCrossPlatformExtras
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend((id)objc_opt_class(), "_mapkit_fontFeaturesForTimeDisplayUseMonospace:", a3);
  uint64_t v8 = *MEMORY[0x1E4F43808];
  v9[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [a1 fontDescriptorByAddingAttributes:v5];

  return v6;
}

- (id)_mapkit_fontDescriptorByAddingFeaturesForTabularFigures
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend((id)objc_opt_class(), "_mapkit_fontFeaturesForTabularFigures");
  uint64_t v6 = *MEMORY[0x1E4F43808];
  v7[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = [a1 fontDescriptorByAddingAttributes:v3];

  return v4;
}

@end