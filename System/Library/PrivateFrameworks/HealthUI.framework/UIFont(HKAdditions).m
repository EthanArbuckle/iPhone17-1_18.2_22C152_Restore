@interface UIFont(HKAdditions)
+ (double)hk_fittingScaleFactorForUILabels:()HKAdditions constrainingWidth:;
+ (id)_hk_compactFontOfStyle:()HKAdditions weight:rounded:;
+ (id)hk_chartActivityValueFont;
+ (id)hk_chartCurrentValueDateFont;
+ (id)hk_chartCurrentValueKindFont;
+ (id)hk_chartCurrentValueUnitFont;
+ (id)hk_chartCurrentValueValueFont;
+ (id)hk_chartLollipopValueFontSmaller;
+ (id)hk_chrValueCellPrimaryFont;
+ (id)hk_defaultFontWithUIFontTextStyle:()HKAdditions symbolicTraits:attributes:;
+ (id)hk_preferredFontForTextStyle:()HKAdditions symbolicTraits:;
+ (id)hk_preferredFontForTextStyle:()HKAdditions symbolicTraits:maximumContentSizeCategory:;
+ (id)hk_preferredFontIgnoringAccessibilitySizeForTextStyle:()HKAdditions symbolicTraits:;
+ (id)hk_preferredRoundedFontForTextStyle:()HKAdditions additionalSymbolicTraits:;
+ (id)hk_roundedSystemFontWithSize:()HKAdditions weight:textStyle:;
+ (id)hk_scalableFontForTextStyle:()HKAdditions symbolicTraits:;
+ (id)hk_staticPreferredFontForTextStyle:()HKAdditions symbolicTraits:;
+ (id)hk_titleLabelFontScaledBy:()HKAdditions;
+ (id)hk_unitLabelFontScaledBy:()HKAdditions;
+ (uint64_t)hk_chartAxisLabelFont;
+ (uint64_t)hk_chartLollipopKeyFont;
+ (uint64_t)hk_chartLollipopValueFont;
+ (uint64_t)hk_chartOverlaySectionHeaderAccessoryButtonFont;
+ (uint64_t)hk_chartOverlaySectionHeaderFont;
+ (uint64_t)hk_chartOverlaySectionItemTitleFont;
+ (uint64_t)hk_chartOverlaySectionItemValueAndUnitFont;
+ (uint64_t)hk_compactFontOfSize:()HKAdditions;
+ (uint64_t)hk_compactFontOfSize:()HKAdditions weight:;
+ (uint64_t)hk_compactFontOfStyle:()HKAdditions weight:;
+ (uint64_t)hk_compactRoundedFontOfSize:()HKAdditions;
+ (uint64_t)hk_compactRoundedFontOfSize:()HKAdditions weight:;
+ (uint64_t)hk_compactRoundedFontOfStyle:()HKAdditions weight:;
+ (uint64_t)hk_preferredFontForTextStyle:()HKAdditions;
+ (uint64_t)hk_preferredFontIgnoringAccessibilitySizeForTextStyle:()HKAdditions;
+ (uint64_t)hk_preferredRoundedFontForTextStyle:()HKAdditions;
+ (uint64_t)hk_roundedSystemFontWithSize:()HKAdditions weight:;
+ (uint64_t)hk_staticPreferredFontForTextStyle:()HKAdditions;
- (id)_hk_fontByModifyingSymbolicTraits:()HKAdditions;
- (id)hk_fontByAddingSymbolicTraits:()HKAdditions;
- (id)hk_fontByRemovingSymbolicTraits:()HKAdditions;
- (id)hk_monospacedFont;
@end

@implementation UIFont(HKAdditions)

+ (uint64_t)hk_roundedSystemFontWithSize:()HKAdditions weight:
{
  return objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:weight:design:", *MEMORY[0x1E4FB0990]);
}

+ (uint64_t)hk_chartAxisLabelFont
{
  return objc_msgSend(a1, "hk_roundedSystemFontWithSize:weight:", 13.0, *MEMORY[0x1E4FB09D0]);
}

+ (id)hk_scalableFontForTextStyle:()HKAdditions symbolicTraits:
{
  id v6 = a3;
  v7 = objc_msgSend(a1, "hk_staticPreferredFontForTextStyle:symbolicTraits:", v6, a4);
  v8 = (void *)[objc_alloc(MEMORY[0x1E4FB17A8]) initForTextStyle:v6];

  v9 = [v8 scaledFontForFont:v7];

  return v9;
}

+ (id)hk_staticPreferredFontForTextStyle:()HKAdditions symbolicTraits:
{
  v4 = [MEMORY[0x1E4FB08E8] defaultFontDescriptorWithTextStyle:a3 addingSymbolicTraits:a4 options:0];
  v5 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];

  return v5;
}

+ (uint64_t)hk_staticPreferredFontForTextStyle:()HKAdditions
{
  return objc_msgSend(a1, "hk_staticPreferredFontForTextStyle:symbolicTraits:", a3, 0);
}

+ (uint64_t)hk_preferredFontForTextStyle:()HKAdditions
{
  return objc_msgSend(a1, "hk_preferredFontForTextStyle:symbolicTraits:", a3, 0);
}

+ (id)hk_preferredFontForTextStyle:()HKAdditions symbolicTraits:
{
  v4 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:a4 options:0];
  v5 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];

  return v5;
}

+ (id)hk_preferredFontForTextStyle:()HKAdditions symbolicTraits:maximumContentSizeCategory:
{
  id v6 = [a1 _preferredFontForTextStyle:a3 maximumContentSizeCategory:a5];
  v7 = objc_msgSend(v6, "hk_fontByAddingSymbolicTraits:", a4);

  return v7;
}

+ (uint64_t)hk_preferredFontIgnoringAccessibilitySizeForTextStyle:()HKAdditions
{
  return objc_msgSend(a1, "hk_preferredFontIgnoringAccessibilitySizeForTextStyle:symbolicTraits:", a3, 0);
}

+ (id)hk_preferredFontIgnoringAccessibilitySizeForTextStyle:()HKAdditions symbolicTraits:
{
  v4 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:a4 options:1];
  v5 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];

  return v5;
}

+ (double)hk_fittingScaleFactorForUILabels:()HKAdditions constrainingWidth:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = a4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  double v6 = 1.0;
  if (v5)
  {
    uint64_t v7 = v5;
    v8 = 0;
    v9 = 0;
    uint64_t v10 = *(void *)v32;
    uint64_t v11 = *MEMORY[0x1E4FB06F8];
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v15 = [v14 text];
        uint64_t v37 = v11;
        v16 = [v14 font];
        v38 = v16;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        objc_msgSend(v15, "boundingRectWithSize:options:attributes:context:", 0, v17, 0, 3.40282347e38, 3.40282347e38);
        double v19 = v18;

        double v20 = v19 - a1;
        if (v20 > 0.00000011920929 && v20 > v12)
        {
          uint64_t v22 = [v14 text];

          uint64_t v23 = [v14 font];

          v8 = (void *)v23;
          v9 = (void *)v22;
          double v12 = v20;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v7);
    if (v9)
    {
      double v6 = 0.9;
      do
      {
        [v8 pointSize];
        v25 = [v8 fontWithSize:v6 * v24];
        uint64_t v35 = v11;
        v36 = v25;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 0, v26, 0, 3.40282347e38, 3.40282347e38);
        double v28 = v27;

        if (v28 <= a1) {
          break;
        }
        double v6 = v6 + -0.1;
      }
      while (v6 > 0.1);
    }
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }

  return v6;
}

+ (id)hk_defaultFontWithUIFontTextStyle:()HKAdditions symbolicTraits:attributes:
{
  id v7 = a5;
  v8 = [MEMORY[0x1E4FB08E8] defaultFontDescriptorWithTextStyle:a3 addingSymbolicTraits:a4 options:0];
  v9 = v8;
  if (v7)
  {
    uint64_t v10 = [v8 fontDescriptorByAddingAttributes:v7];

    v9 = (void *)v10;
  }
  uint64_t v11 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v9 size:0.0];

  return v11;
}

+ (id)hk_titleLabelFontScaledBy:()HKAdditions
{
  v3 = objc_msgSend(a1, "hk_defaultFontWithUIFontTextStyle:symbolicTraits:attributes:", *MEMORY[0x1E4FB2908], 0x8000, 0);
  v4 = v3;
  if (a2 != 1.0)
  {
    [v3 pointSize];
    uint64_t v6 = [v4 fontWithSize:v5 * a2];

    v4 = (void *)v6;
  }
  return v4;
}

+ (id)hk_unitLabelFontScaledBy:()HKAdditions
{
  v3 = objc_msgSend(a1, "hk_defaultFontWithUIFontTextStyle:symbolicTraits:attributes:", *MEMORY[0x1E4FB2908], 0x8000, 0);
  v4 = [v3 fontWithSize:a2 * 15.0];

  return v4;
}

+ (uint64_t)hk_compactRoundedFontOfSize:()HKAdditions
{
  return objc_msgSend(a1, "hk_compactRoundedFontOfSize:weight:", a3, *MEMORY[0x1E4FB09D8]);
}

+ (uint64_t)hk_compactRoundedFontOfSize:()HKAdditions weight:
{
  return objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:weight:design:", *MEMORY[0x1E4F24630]);
}

+ (uint64_t)hk_compactRoundedFontOfStyle:()HKAdditions weight:
{
  return objc_msgSend(a1, "_hk_compactFontOfStyle:weight:rounded:", a3, 1);
}

+ (uint64_t)hk_compactFontOfSize:()HKAdditions
{
  return objc_msgSend(a1, "hk_compactFontOfSize:weight:", a3, *MEMORY[0x1E4FB09D8]);
}

+ (uint64_t)hk_compactFontOfSize:()HKAdditions weight:
{
  return objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:weight:design:", *MEMORY[0x1E4F24628]);
}

+ (uint64_t)hk_compactFontOfStyle:()HKAdditions weight:
{
  return objc_msgSend(a1, "_hk_compactFontOfStyle:weight:rounded:", a3, 0);
}

+ (id)_hk_compactFontOfStyle:()HKAdditions weight:rounded:
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (a5) {
    id v7 = (id *)MEMORY[0x1E4F24630];
  }
  else {
    id v7 = (id *)MEMORY[0x1E4F24628];
  }
  v8 = (void *)MEMORY[0x1E4FB08E8];
  id v9 = *v7;
  uint64_t v10 = [v8 preferredFontDescriptorWithTextStyle:a4];
  uint64_t v20 = *MEMORY[0x1E4FB0950];
  uint64_t v11 = *MEMORY[0x1E4FB09F0];
  v18[0] = *MEMORY[0x1E4FB0998];
  v18[1] = v11;
  v19[0] = v9;
  double v12 = [NSNumber numberWithDouble:a1];
  v19[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v21[0] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  v15 = [v10 fontDescriptorByAddingAttributes:v14];

  v16 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v15 size:0.0];

  return v16;
}

+ (id)hk_roundedSystemFontWithSize:()HKAdditions weight:textStyle:
{
  id v8 = a5;
  id v9 = objc_msgSend(a1, "hk_roundedSystemFontWithSize:weight:", a2, a3);
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4FB17A8]) initForTextStyle:v8];

  uint64_t v11 = [v10 scaledFontForFont:v9];

  return v11;
}

+ (uint64_t)hk_preferredRoundedFontForTextStyle:()HKAdditions
{
  return [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:a3 variant:0x10000];
}

+ (id)hk_preferredRoundedFontForTextStyle:()HKAdditions additionalSymbolicTraits:
{
  double v5 = objc_msgSend(a1, "hk_preferredRoundedFontForTextStyle:");
  uint64_t v6 = objc_msgSend(v5, "hk_fontByAddingSymbolicTraits:", a4);

  return v6;
}

- (id)hk_monospacedFont
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4FB0960];
  v15[0] = *MEMORY[0x1E4FB0968];
  v15[1] = v2;
  v16[0] = &unk_1F3C20830;
  v16[1] = &unk_1F3C20848;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  uint64_t v4 = *MEMORY[0x1E4FB0910];
  double v12 = v3;
  uint64_t v13 = v4;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v14 = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];

  id v7 = [a1 fontDescriptor];
  id v8 = [v7 fontDescriptorByAddingAttributes:v6];

  id v9 = (void *)MEMORY[0x1E4FB08E0];
  [a1 pointSize];
  uint64_t v10 = objc_msgSend(v9, "fontWithDescriptor:size:", v8);

  return v10;
}

- (id)hk_fontByAddingSymbolicTraits:()HKAdditions
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__UIFont_HKAdditions__hk_fontByAddingSymbolicTraits___block_invoke;
  v5[3] = &__block_descriptor_36_e8_I12__0I8l;
  int v6 = a3;
  v3 = objc_msgSend(a1, "_hk_fontByModifyingSymbolicTraits:", v5);
  return v3;
}

- (id)hk_fontByRemovingSymbolicTraits:()HKAdditions
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__UIFont_HKAdditions__hk_fontByRemovingSymbolicTraits___block_invoke;
  v5[3] = &__block_descriptor_36_e8_I12__0I8l;
  int v6 = a3;
  v3 = objc_msgSend(a1, "_hk_fontByModifyingSymbolicTraits:", v5);
  return v3;
}

- (id)_hk_fontByModifyingSymbolicTraits:()HKAdditions
{
  uint64_t v4 = a3;
  double v5 = [a1 fontDescriptor];
  int v6 = [a1 fontDescriptor];
  uint64_t v7 = v4[2](v4, [v6 symbolicTraits]);

  id v8 = [v5 fontDescriptorWithSymbolicTraits:v7];
  id v9 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];

  return v9;
}

+ (uint64_t)hk_chartLollipopKeyFont
{
  return objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueKindFont");
}

+ (uint64_t)hk_chartLollipopValueFont
{
  return objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueValueFont");
}

+ (id)hk_chartLollipopValueFontSmaller
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *MEMORY[0x1E4FB0950];
  v8[0] = *MEMORY[0x1E4FB09F0];
  v0 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09D0]];
  uint64_t v1 = *MEMORY[0x1E4FB0978];
  v9[0] = v0;
  v9[1] = &unk_1F3C20860;
  uint64_t v2 = *MEMORY[0x1E4FB0998];
  v8[1] = v1;
  v8[2] = v2;
  v9[2] = *MEMORY[0x1E4FB0938];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  v11[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  double v5 = (void *)CTFontDescriptorCreateWithTextStyleAndAttributes();

  int v6 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:0.0];

  return v6;
}

+ (id)hk_chartCurrentValueKindFont
{
  v0 = [MEMORY[0x1E4FB08E8] defaultFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28F0] addingSymbolicTraits:32770 options:0];
  uint64_t v1 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v0 size:0.0];

  return v1;
}

+ (id)hk_chartCurrentValueValueFont
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *MEMORY[0x1E4FB0950];
  v8[0] = *MEMORY[0x1E4FB09F0];
  v0 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09D0]];
  uint64_t v1 = *MEMORY[0x1E4FB0978];
  v9[0] = v0;
  v9[1] = &unk_1F3C20860;
  uint64_t v2 = *MEMORY[0x1E4FB0998];
  v8[1] = v1;
  v8[2] = v2;
  v9[2] = *MEMORY[0x1E4FB0938];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  v11[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  double v5 = (void *)CTFontDescriptorCreateWithTextStyleAndAttributes();

  int v6 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:0.0];

  return v6;
}

+ (id)hk_chartActivityValueFont
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *MEMORY[0x1E4FB0950];
  v8[0] = *MEMORY[0x1E4FB09F0];
  v0 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09E0]];
  uint64_t v1 = *MEMORY[0x1E4FB0978];
  v9[0] = v0;
  v9[1] = &unk_1F3C20860;
  uint64_t v2 = *MEMORY[0x1E4FB0998];
  v8[1] = v1;
  v8[2] = v2;
  v9[2] = *MEMORY[0x1E4FB0938];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  v11[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  double v5 = (void *)CTFontDescriptorCreateWithTextStyleAndAttributes();

  int v6 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:0.0];

  return v6;
}

+ (id)hk_chartCurrentValueUnitFont
{
  v0 = [MEMORY[0x1E4FB08E8] defaultFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:32770 options:0];
  uint64_t v1 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v0 size:0.0];

  return v1;
}

+ (id)hk_chartCurrentValueDateFont
{
  v0 = [MEMORY[0x1E4FB08E8] defaultFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:32770 options:0];
  uint64_t v1 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v0 size:0.0];

  return v1;
}

+ (uint64_t)hk_chartOverlaySectionHeaderFont
{
  return [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2908] variant:1024];
}

+ (uint64_t)hk_chartOverlaySectionHeaderAccessoryButtonFont
{
  return [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] variant:256];
}

+ (uint64_t)hk_chartOverlaySectionItemTitleFont
{
  return objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB2948], 0x8000);
}

+ (uint64_t)hk_chartOverlaySectionItemValueAndUnitFont
{
  return objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB2948], 32770);
}

+ (id)hk_chrValueCellPrimaryFont
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2988] addingSymbolicTraits:0x8000 options:0];
  uint64_t v11 = *MEMORY[0x1E4FB09F0];
  uint64_t v1 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09E0]];
  v12[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  uint64_t v3 = *MEMORY[0x1E4FB0998];
  v9[0] = *MEMORY[0x1E4FB0950];
  v9[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4FB0938];
  v10[0] = v2;
  v10[1] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  int v6 = [v0 fontDescriptorByAddingAttributes:v5];

  uint64_t v7 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v6 size:0.0];

  return v7;
}

@end