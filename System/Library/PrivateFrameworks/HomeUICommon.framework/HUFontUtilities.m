@interface HUFontUtilities
+ (UIEdgeInsets)languageAwareOutsetsForString:(id)a3 withFont:(id)a4;
+ (id)_excessiveLineHeightCharacterSet;
+ (id)fontDescriptorWithMonospacedDigitsForFontDescriptor:(id)a3;
+ (id)preferredFontForTextStyle:(id)a3 traits:(unsigned int)a4;
+ (id)staticPreferredFontForTextStyle:(id)a3;
+ (id)staticPreferredFontForTextStyle:(id)a3 traits:(unsigned int)a4;
@end

@implementation HUFontUtilities

+ (id)preferredFontForTextStyle:(id)a3 traits:(unsigned int)a4
{
  v4 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:*(void *)&a4 options:0];
  v5 = [MEMORY[0x263F1C658] fontWithDescriptor:v4 size:0.0];

  return v5;
}

+ (id)_excessiveLineHeightCharacterSet
{
  if (qword_26B22BA30 != -1) {
    dispatch_once(&qword_26B22BA30, &__block_literal_global);
  }
  v2 = (void *)_MergedGlobals_4;
  return v2;
}

uint64_t __51__HUFontUtilities__excessiveLineHeightCharacterSet__block_invoke()
{
  _MergedGlobals_4 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  return MEMORY[0x270F9A758]();
}

+ (id)staticPreferredFontForTextStyle:(id)a3
{
  return +[HUFontUtilities staticPreferredFontForTextStyle:a3 traits:0];
}

+ (id)staticPreferredFontForTextStyle:(id)a3 traits:(unsigned int)a4
{
  v4 = [MEMORY[0x263F1C660] defaultFontDescriptorWithTextStyle:a3 addingSymbolicTraits:*(void *)&a4 options:0];
  v5 = [MEMORY[0x263F1C658] fontWithDescriptor:v4 size:0.0];

  return v5;
}

+ (id)fontDescriptorWithMonospacedDigitsForFontDescriptor:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v16 = *MEMORY[0x263F1D1E8];
  uint64_t v3 = *MEMORY[0x263F1D218];
  uint64_t v11 = *MEMORY[0x263F1D220];
  uint64_t v12 = v3;
  v13 = &unk_2702C2AA8;
  v14 = &unk_2702C2AC0;
  v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:&v13 forKeys:&v11 count:2];
  v15 = v6;
  v7 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v15, 1, v11, v12, v13, v14);
  v17[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v9 = [v5 fontDescriptorByAddingAttributes:v8];

  return v9;
}

+ (UIEdgeInsets)languageAwareOutsetsForString:(id)a3 withFont:(id)a4
{
  id v5 = a4;
  long long v13 = *MEMORY[0x263F1D1C0];
  long long v14 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
  id v6 = a3;
  v7 = [(id)objc_opt_class() _excessiveLineHeightCharacterSet];
  uint64_t v8 = [v6 rangeOfCharacterFromSet:v7];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
    CTFontGetLanguageAwareOutsets();
  }

  double v10 = *((double *)&v13 + 1);
  double v9 = *(double *)&v13;
  double v12 = *((double *)&v14 + 1);
  double v11 = *(double *)&v14;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

@end