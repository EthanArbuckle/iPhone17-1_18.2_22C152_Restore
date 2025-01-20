@interface UIFont(ClockKitUtilities)
- (id)CLKFontByApplyingFeatureSettings:()ClockKitUtilities;
- (id)CLKFontWithAlternativePunctuation;
- (id)CLKFontWithLocalizedLowerCaseSmallCaps;
- (id)CLKFontWithLocalizedSmallCaps;
- (id)CLKFontWithLooplessThaiFallback;
- (id)CLKFontWithMonospacedNumbers;
- (id)CLKFontWithRareLigaturesAndStylisticSet:()ClockKitUtilities;
- (id)CLKFontWithStylisticSet:()ClockKitUtilities;
- (uint64_t)CLKFontWithStraightSix;
@end

@implementation UIFont(ClockKitUtilities)

- (id)CLKFontWithLocalizedSmallCaps
{
  v13[2] = *MEMORY[0x263EF8340];
  if (CLKSmallCapsAllowed())
  {
    uint64_t v3 = *MEMORY[0x263F83530];
    v12[0] = *MEMORY[0x263F83548];
    uint64_t v2 = v12[0];
    v12[1] = v3;
    v13[0] = &unk_26CCDC010;
    v13[1] = &unk_26CCDC028;
    v4 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    v10[0] = v2;
    v10[1] = v3;
    v11[0] = &unk_26CCDC040;
    v11[1] = &unk_26CCDC028;
    v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    v9[0] = v4;
    v9[1] = v5;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];

    id v7 = [a1 CLKFontByApplyingFeatureSettings:v6];
  }
  else
  {
    id v7 = a1;
  }

  return v7;
}

- (id)CLKFontWithLocalizedLowerCaseSmallCaps
{
  void v9[2] = *MEMORY[0x263EF8340];
  if (CLKSmallCapsAllowed())
  {
    uint64_t v2 = *MEMORY[0x263F83530];
    v8[0] = *MEMORY[0x263F83548];
    v8[1] = v2;
    v9[0] = &unk_26CCDC040;
    v9[1] = &unk_26CCDC028;
    uint64_t v3 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
    id v7 = v3;
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:1];

    id v5 = [a1 CLKFontByApplyingFeatureSettings:v4];
  }
  else
  {
    id v5 = a1;
  }

  return v5;
}

- (id)CLKFontWithMonospacedNumbers
{
  uint64_t v2 = _MonospaceNumbersFeatureSettings();
  uint64_t v3 = [a1 CLKFontByApplyingFeatureSettings:v2];

  return v3;
}

- (id)CLKFontWithAlternativePunctuation
{
  void v9[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F83530];
  v8[0] = *MEMORY[0x263F83548];
  v8[1] = v2;
  v9[0] = &unk_26CCDC088;
  v9[1] = &unk_26CCDC070;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v7 = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:1];

  id v5 = [a1 CLKFontByApplyingFeatureSettings:v4];

  return v5;
}

- (uint64_t)CLKFontWithStraightSix
{
  return [a1 CLKFontWithStylisticSet:1];
}

- (id)CLKFontWithStylisticSet:()ClockKitUtilities
{
  v4 = _StylisticSet(a3);
  id v5 = [a1 CLKFontByApplyingFeatureSettings:v4];

  return v5;
}

- (id)CLKFontWithRareLigaturesAndStylisticSet:()ClockKitUtilities
{
  v14[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F83530];
  v13[0] = *MEMORY[0x263F83548];
  v13[1] = v5;
  v14[0] = &unk_26CCDC028;
  v14[1] = &unk_26CCDC0A0;
  v6 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  v12 = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];

  v8 = _StylisticSet(a3);
  v9 = [v7 arrayByAddingObjectsFromArray:v8];

  v10 = [a1 CLKFontByApplyingFeatureSettings:v9];

  return v10;
}

- (id)CLKFontWithLooplessThaiFallback
{
  v7[1] = *MEMORY[0x263EF8340];
  v1 = [a1 fontDescriptor];
  uint64_t v6 = *MEMORY[0x263F03A78];
  v7[0] = &unk_26CCDBFE0;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  uint64_t v3 = [v1 fontDescriptorByAddingAttributes:v2];

  v4 = [(id)objc_opt_class() fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (id)CLKFontByApplyingFeatureSettings:()ClockKitUtilities
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [a1 fontDescriptor];
  uint64_t v10 = *MEMORY[0x263F83518];
  v11[0] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

  id v7 = [v5 fontDescriptorByAddingAttributes:v6];

  v8 = [(id)objc_opt_class() fontWithDescriptor:v7 size:0.0];

  return v8;
}

@end