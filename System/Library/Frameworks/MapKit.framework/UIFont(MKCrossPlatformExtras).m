@interface UIFont(MKCrossPlatformExtras)
- (double)_mapkit_scaledValueForValue:()MKCrossPlatformExtras scalingForMacIdiom:respectingTraitEnvironment:;
- (id)_mapkit_fontByAddingFeaturesForTabularFigures;
- (id)_mapkit_fontByAddingFeaturesForTimeDisplayUseMonospace:()MKCrossPlatformExtras;
- (id)_mapkit_fontWithSymbolicTraits:()MKCrossPlatformExtras;
- (id)_mapkit_fontWithWeight:()MKCrossPlatformExtras;
- (id)traitCollectionFromTraitEnvironment:()MKCrossPlatformExtras;
- (uint64_t)_mapkit_fontByAddingFeaturesForTimeDisplay;
- (uint64_t)_mapkit_scaledValueForValue:()MKCrossPlatformExtras;
@end

@implementation UIFont(MKCrossPlatformExtras)

- (uint64_t)_mapkit_scaledValueForValue:()MKCrossPlatformExtras
{
  return objc_msgSend(a1, "_mapkit_scaledValueForValue:scalingForMacIdiom:respectingTraitEnvironment:", 1, 0);
}

- (double)_mapkit_scaledValueForValue:()MKCrossPlatformExtras scalingForMacIdiom:respectingTraitEnvironment:
{
  v7 = [a1 traitCollectionFromTraitEnvironment:a5];
  [v7 userInterfaceIdiom];
  [v7 displayScale];
  if (!v7)
  {
    if (_MergedGlobals_139 != -1) {
      dispatch_once(&_MergedGlobals_139, &__block_literal_global_30);
    }
    v8 = [MEMORY[0x1E4F42D90] mainScreen];
    [v8 scale];
  }
  [a1 _scaledValueForValue:a2];
  UICeilToScale();
  double v10 = v9;

  return v10;
}

- (id)traitCollectionFromTraitEnvironment:()MKCrossPlatformExtras
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
    objc_opt_class();
    objc_opt_isKindOfClass();
    v4 = [v3 traitCollection];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_mapkit_fontByAddingFeaturesForTimeDisplayUseMonospace:()MKCrossPlatformExtras
{
  v5 = [a1 fontDescriptor];
  v6 = objc_msgSend(v5, "_mapkit_fontDescriptorByAddingFeaturesForTimeDisplayUseMonospace:", a3);

  v7 = (void *)MEMORY[0x1E4F42A30];
  [a1 pointSize];
  v8 = objc_msgSend(v7, "fontWithDescriptor:size:", v6);

  return v8;
}

- (uint64_t)_mapkit_fontByAddingFeaturesForTimeDisplay
{
  return objc_msgSend(a1, "_mapkit_fontByAddingFeaturesForTimeDisplayUseMonospace:", 0);
}

- (id)_mapkit_fontByAddingFeaturesForTabularFigures
{
  v2 = [a1 fontDescriptor];
  id v3 = objc_msgSend(v2, "_mapkit_fontDescriptorByAddingFeaturesForTabularFigures");

  v4 = (void *)MEMORY[0x1E4F42A30];
  [a1 pointSize];
  v5 = objc_msgSend(v4, "fontWithDescriptor:size:", v3);

  return v5;
}

- (id)_mapkit_fontWithWeight:()MKCrossPlatformExtras
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = *MEMORY[0x1E4F43848];
  uint64_t v10 = *MEMORY[0x1E4F43940];
  v2 = objc_msgSend(NSNumber, "numberWithDouble:");
  v11 = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  v5 = [a1 fontDescriptor];
  v6 = [v5 fontDescriptorByAddingAttributes:v4];

  v7 = (void *)MEMORY[0x1E4F42A30];
  [a1 pointSize];
  v8 = objc_msgSend(v7, "fontWithDescriptor:size:", v6);

  return v8;
}

- (id)_mapkit_fontWithSymbolicTraits:()MKCrossPlatformExtras
{
  v4 = [a1 fontDescriptor];
  v5 = [v4 fontDescriptorWithSymbolicTraits:a3];

  v6 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v5 size:0.0];

  return v6;
}

@end