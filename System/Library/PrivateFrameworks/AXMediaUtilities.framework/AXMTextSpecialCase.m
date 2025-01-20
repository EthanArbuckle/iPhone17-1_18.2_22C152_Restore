@interface AXMTextSpecialCase
- (BOOL)detectNutritionLabel:(id)a3;
- (id)detectSpecialCase:(id)a3 preferredLocales:(id)a4;
- (id)nutritionLabelKeywords;
- (int64_t)nutritionLabelKeywordCountMinimum;
@end

@implementation AXMTextSpecialCase

- (id)nutritionLabelKeywords
{
  v18 = (void *)MEMORY[0x1E4F1C978];
  v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v16 = [v22 localizedStringForKey:@"image.text.nutrition" value:&stru_1F0E72D10 table:@"Accessibility"];
  v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v14 = [v21 localizedStringForKey:@"image.text.calories" value:&stru_1F0E72D10 table:@"Accessibility"];
  v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v13 = [v20 localizedStringForKey:@"image.text.fat" value:&stru_1F0E72D10 table:@"Accessibility"];
  v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v10 = [v17 localizedStringForKey:@"image.text.carbohydrate" value:&stru_1F0E72D10 table:@"Accessibility"];
  v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v2 = [v15 localizedStringForKey:@"image.text.protein" value:&stru_1F0E72D10 table:@"Accessibility"];
  v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v3 = [v12 localizedStringForKey:@"image.text.sodium" value:&stru_1F0E72D10 table:@"Accessibility"];
  v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v4 = [v11 localizedStringForKey:@"image.text.potassium" value:&stru_1F0E72D10 table:@"Accessibility"];
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v6 = [v5 localizedStringForKey:@"image.text.calcium" value:&stru_1F0E72D10 table:@"Accessibility"];
  v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v8 = [v7 localizedStringForKey:@"image.text.fiber" value:&stru_1F0E72D10 table:@"Accessibility"];
  v19 = objc_msgSend(v18, "arrayWithObjects:", v16, v14, v13, v10, v2, v3, v4, v6, v8, 0);

  return v19;
}

- (int64_t)nutritionLabelKeywordCountMinimum
{
  return 6;
}

- (id)detectSpecialCase:(id)a3 preferredLocales:(id)a4
{
  if (-[AXMTextSpecialCase detectNutritionLabel:](self, "detectNutritionLabel:", a3, a4)) {
    return @"NutritionLabel";
  }
  else {
    return 0;
  }
}

- (BOOL)detectNutritionLabel:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = (void *)MEMORY[0x1BA9A10B0]();
    v6 = [v4 componentsJoinedByString:@" "];
    v7 = [v6 lowercaseString];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = [(AXMTextSpecialCase *)self nutritionLabelKeywords];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      int64_t v11 = 0;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v8);
          }
          v11 += [v7 containsString:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
    else
    {
      int64_t v11 = 0;
    }

    BOOL v14 = v11 > [(AXMTextSpecialCase *)self nutritionLabelKeywordCountMinimum];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

@end