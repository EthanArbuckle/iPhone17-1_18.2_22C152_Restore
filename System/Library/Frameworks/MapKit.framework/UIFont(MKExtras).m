@interface UIFont(MKExtras)
+ (NSString)_contentSizeCategoryInTableViewCellWithContentSizeCategory:()MKExtras;
+ (id)_mapkit_preferredFontForTextStyle:()MKExtras weight:grade:contentSizeCategory:symbolicTraits:;
+ (id)_mapkit_preferredFontForTextStyleInTableViewCell:()MKExtras weight:contentSizeCategory:symbolicTraits:;
+ (id)_mapkit_preferredFontForTextStyleInTableViewCell:()MKExtras weight:grade:contentSizeCategory:symbolicTraits:;
+ (id)_mapkit_preferredFontForTextStyleTimeDisplayInTableViewCell:()MKExtras addingSymbolicTraits:useMonospace:;
+ (uint64_t)_mapkit_accessibilityTextEnabled;
+ (uint64_t)_mapkit_ax3TextEnabled;
+ (uint64_t)_mapkit_preferredFontForTextStyleInTableViewCell:()MKExtras;
+ (uint64_t)_mapkit_preferredFontForTextStyleInTableViewCell:()MKExtras addingSymbolicTraits:;
+ (uint64_t)_mapkit_preferredFontForTextStyleInTableViewCell:()MKExtras weight:;
+ (uint64_t)_mapkit_preferredFontForTextStyleInTableViewCell:()MKExtras weight:grade:;
+ (uint64_t)_mapkit_preferredFontForTextStyleTimeDisplayInTableViewCell:()MKExtras addingSymbolicTraits:;
@end

@implementation UIFont(MKExtras)

+ (id)_mapkit_preferredFontForTextStyleInTableViewCell:()MKExtras weight:grade:contentSizeCategory:symbolicTraits:
{
  id v12 = a4;
  v13 = [a1 _contentSizeCategoryInTableViewCellWithContentSizeCategory:a6];
  v14 = objc_msgSend(a1, "_mapkit_preferredFontForTextStyle:weight:grade:contentSizeCategory:symbolicTraits:", v12, a5, v13, a7, a2);

  return v14;
}

+ (id)_mapkit_preferredFontForTextStyleInTableViewCell:()MKExtras weight:contentSizeCategory:symbolicTraits:
{
  id v10 = a4;
  v11 = [a1 _contentSizeCategoryInTableViewCellWithContentSizeCategory:a5];
  id v12 = objc_msgSend(a1, "_mapkit_preferredFontForTextStyle:weight:grade:contentSizeCategory:symbolicTraits:", v10, 0, v11, a6, a2);

  return v12;
}

+ (id)_mapkit_preferredFontForTextStyle:()MKExtras weight:grade:contentSizeCategory:symbolicTraits:
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  v13 = [NSString stringWithFormat:@"%@_%@_%f_%lu_%d", v12, v11, *(void *)&a1, a5, a7];
  v14 = (void *)fontCache;
  if (!fontCache)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    v16 = (void *)fontCache;
    fontCache = v15;

    v14 = (void *)fontCache;
  }
  v17 = [v14 objectForKeyedSubscript:v13];
  if (!v17)
  {
    v18 = [MEMORY[0x1E4F42F80] traitCollectionWithPreferredContentSizeCategory:v12];
    v19 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:v11 compatibleWithTraitCollection:v18];
    if (a1 != 0.0 || a5 || a7)
    {
      v20 = [MEMORY[0x1E4F1CA60] dictionary];
      if (a1 != 0.0)
      {
        v21 = [NSNumber numberWithDouble:a1];
        [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F43940]];
      }
      if (a7)
      {
        v22 = [NSNumber numberWithUnsignedInt:a7];
        [v20 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F43860]];
      }
      if (a5)
      {
        v23 = [NSNumber numberWithUnsignedInteger:a5];
        [v20 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F43868]];
      }
      uint64_t v28 = *MEMORY[0x1E4F43848];
      v24 = (void *)[v20 copy];
      v29[0] = v24;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      uint64_t v26 = [v19 fontDescriptorByAddingAttributes:v25];

      v19 = (void *)v26;
    }
    v17 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v19 size:0.0];
    [(id)fontCache setObject:v17 forKeyedSubscript:v13];
  }

  return v17;
}

+ (NSString)_contentSizeCategoryInTableViewCellWithContentSizeCategory:()MKExtras
{
  v3 = a3;
  v4 = v3;
  if (v3
    && UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E4F437D0])
    && UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E4F437B0]) != NSOrderedAscending)
  {
    v5 = v4;
  }
  else
  {
    v6 = [MEMORY[0x1E4F42738] sharedApplication];
    v5 = [v6 _preferredContentSizeCategory:2];
  }

  return v5;
}

+ (uint64_t)_mapkit_preferredFontForTextStyleInTableViewCell:()MKExtras weight:
{
  return objc_msgSend(a1, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", a3, 0, 0);
}

+ (uint64_t)_mapkit_preferredFontForTextStyleInTableViewCell:()MKExtras
{
  return objc_msgSend(a1, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", a3, 0, 0, 0.0);
}

+ (uint64_t)_mapkit_preferredFontForTextStyleInTableViewCell:()MKExtras weight:grade:
{
  return objc_msgSend(a1, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:grade:contentSizeCategory:symbolicTraits:", a3, a4, 0, 0);
}

+ (uint64_t)_mapkit_preferredFontForTextStyleInTableViewCell:()MKExtras addingSymbolicTraits:
{
  return objc_msgSend(a1, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", a3, 0, a4, 0.0);
}

+ (uint64_t)_mapkit_preferredFontForTextStyleTimeDisplayInTableViewCell:()MKExtras addingSymbolicTraits:
{
  return objc_msgSend(a1, "_mapkit_preferredFontForTextStyleTimeDisplayInTableViewCell:addingSymbolicTraits:useMonospace:", a3, a4, 0);
}

+ (id)_mapkit_preferredFontForTextStyleTimeDisplayInTableViewCell:()MKExtras addingSymbolicTraits:useMonospace:
{
  v6 = objc_msgSend(a1, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:");
  v7 = objc_msgSend(v6, "_mapkit_fontByAddingFeaturesForTimeDisplayUseMonospace:", a5);

  return v7;
}

+ (uint64_t)_mapkit_ax3TextEnabled
{
  v0 = [MEMORY[0x1E4F42738] sharedApplication];
  v1 = [v0 preferredContentSizeCategory];

  if (qword_1EB315D00 != -1) {
    dispatch_once(&qword_1EB315D00, &__block_literal_global_22);
  }
  uint64_t v2 = [(id)_MergedGlobals_135 containsObject:v1];

  return v2;
}

+ (uint64_t)_mapkit_accessibilityTextEnabled
{
  v0 = [MEMORY[0x1E4F42738] sharedApplication];
  v1 = [v0 preferredContentSizeCategory];

  if (qword_1EB315D10 != -1) {
    dispatch_once(&qword_1EB315D10, &__block_literal_global_11);
  }
  uint64_t v2 = [(id)qword_1EB315D08 containsObject:v1];

  return v2;
}

@end