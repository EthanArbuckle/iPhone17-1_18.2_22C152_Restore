@interface EMFEmojiCategory
+ (BOOL)_isBaseHandshakeOrHandshakeWithSkintonesEmoji:(id)a3;
+ (BOOL)_isComposedCoupleMultiSkinToneEmoji:(id)a3;
+ (BOOL)_isCoupleMultiSkinToneEmoji:(id)a3;
+ (BOOL)_isDingbatsVariantEmoji:(id)a3;
+ (BOOL)_isFlagEmoji:(id)a3;
+ (BOOL)_isGenderEmoji:(id)a3;
+ (BOOL)_isHandholdingCoupleEmoji:(id)a3;
+ (BOOL)_isMultiPersonFamilySkinToneEmoji:(id)a3;
+ (BOOL)_isNoneVariantEmoji:(id)a3;
+ (BOOL)_isProfessionEmoji:(id)a3;
+ (BOOL)_isSkinToneEmoji:(id)a3;
+ (BOOL)_supportsCoupleSkinToneSelection:(id)a3;
+ (id)ActivityEmoji;
+ (id)CelebrationEmoji;
+ (id)CoupleMultiSkinToneEmoji;
+ (id)DingbatsVariantEmoji;
+ (id)ExtendedCoupleMultiSkinToneEmoji;
+ (id)FlagsEmoji;
+ (id)FoodAndDrinkEmoji;
+ (id)GenderEmoji;
+ (id)MultiPersonFamilySkinToneEmoji;
+ (id)NatureEmoji;
+ (id)NewlyAddedEmoji;
+ (id)NoneVariantEmoji;
+ (id)ObjectsEmoji;
+ (id)PeopleEmoji;
+ (id)PrepopulatedEmoji;
+ (id)ProfessionEmoji;
+ (id)ProfessionWithoutSkinToneEmoji;
+ (id)SkinToneEmoji;
+ (id)SymbolsEmoji;
+ (id)TravelAndPlacesEmoji;
+ (id)_baseLocalizationKeyForIdentifier:(id)a3;
+ (id)_emojiSetForIdentifier:(id)a3;
+ (id)categoryIdentifierList;
+ (id)categoryWithIdentifier:(id)a3;
+ (id)computeEmojiFlagsSortedByLanguage;
+ (id)extraFlagsForCountryCode:(id)a3;
+ (id)flagEmojiCountryCodesCommon;
+ (id)insertionFlagsForCountryCodes:(id)a3 inSortedCountryCodes:(id)a4;
+ (id)localizedRecentsDescription;
+ (id)localizedSkinToneEmojiDescription;
+ (id)stringToRegionalIndicatorString:(id)a3;
+ (void)insertToSortedCountries:(id)a3 withAdditionalFlags:(id)a4;
- (EMFEmojiCategory)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (NSString)localizedName;
- (NSString)shortLocalizedName;
- (id)emojiTokensForLocaleData:(id)a3;
- (void)dealloc;
@end

@implementation EMFEmojiCategory

+ (id)categoryIdentifierList
{
  v4[9] = *MEMORY[0x1E4F143B8];
  v4[0] = @"EMFEmojiCategoryRecents";
  v4[1] = @"EMFEmojiCategoryPeople";
  v4[2] = @"EMFEmojiCategoryNature";
  v4[3] = @"EMFEmojiCategoryFoodAndDrink";
  v4[4] = @"EMFEmojiCategoryActivity";
  v4[5] = @"EMFEmojiCategoryTravelAndPlaces";
  v4[6] = @"EMFEmojiCategoryObjects";
  v4[7] = @"EMFEmojiCategorySymbols";
  v4[8] = @"EMFEmojiCategoryFlags";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:9];
  return v2;
}

+ (id)categoryWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v4];

  return v5;
}

- (EMFEmojiCategory)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMFEmojiCategory;
  v6 = [(EMFEmojiCategory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (void)dealloc
{
  identifier = self->_identifier;
  self->_identifier = 0;

  v4.receiver = self;
  v4.super_class = (Class)EMFEmojiCategory;
  [(EMFEmojiCategory *)&v4 dealloc];
}

+ (id)_baseLocalizationKeyForIdentifier:(id)a3
{
  if (a3 == @"EMFEmojiCategoryRecents") {
    return @"Frequently Used";
  }
  if (a3 == @"EMFEmojiCategoryPeople") {
    return @"People";
  }
  if (a3 == @"EMFEmojiCategoryNature") {
    return @"Nature";
  }
  if (a3 == @"EMFEmojiCategoryFoodAndDrink") {
    return @"Food & Drink";
  }
  if (a3 == @"EMFEmojiCategoryActivity") {
    return @"Activity";
  }
  if (a3 == @"EMFEmojiCategoryTravelAndPlaces") {
    return @"Travel & Places";
  }
  if (a3 == @"EMFEmojiCategoryObjects") {
    return @"Objects";
  }
  if (a3 == @"EMFEmojiCategorySymbols") {
    return @"Symbols";
  }
  if (a3 == @"EMFEmojiCategoryFlags") {
    return @"Flags";
  }
  return 0;
}

+ (id)_emojiSetForIdentifier:(id)a3
{
  objc_super v4 = (__CFString *)a3;
  id v5 = v4;
  if (v4 == @"EMFEmojiCategoryPrepopulated")
  {
    uint64_t v7 = [a1 PrepopulatedEmoji];
  }
  else if (v4 == @"EMFEmojiCategoryPeople")
  {
    uint64_t v7 = [a1 PeopleEmoji];
  }
  else if (v4 == @"EMFEmojiCategoryNature")
  {
    uint64_t v7 = [a1 NatureEmoji];
  }
  else if (v4 == @"EMFEmojiCategoryFoodAndDrink")
  {
    uint64_t v7 = [a1 FoodAndDrinkEmoji];
  }
  else if (v4 == @"EMFEmojiCategoryActivity")
  {
    uint64_t v7 = [a1 ActivityEmoji];
  }
  else if (v4 == @"EMFEmojiCategoryTravelAndPlaces")
  {
    uint64_t v7 = [a1 TravelAndPlacesEmoji];
  }
  else if (v4 == @"EMFEmojiCategoryObjects")
  {
    uint64_t v7 = [a1 ObjectsEmoji];
  }
  else if (v4 == @"EMFEmojiCategorySymbols")
  {
    uint64_t v7 = [a1 SymbolsEmoji];
  }
  else if (v4 == @"EMFEmojiCategoryFlags")
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__EMFEmojiCategory__emojiSetForIdentifier___block_invoke;
    v9[3] = &__block_descriptor_40_e14___NSArray_8__0l;
    v9[4] = a1;
    uint64_t v7 = +[EMFEmojiPreferences _cachedFlagCategoryEmoji:v9];
  }
  else
  {
    if (v4 != @"EMFEmojiCategoryRecents")
    {
      v6 = 0;
      goto LABEL_23;
    }
    uint64_t v7 = +[EMFEmojiPreferences _recentEmojiStrings];
  }
  v6 = (void *)v7;
LABEL_23:

  return v6;
}

uint64_t __43__EMFEmojiCategory__emojiSetForIdentifier___block_invoke()
{
  v0 = objc_opt_class();
  return [v0 computeEmojiFlagsSortedByLanguage];
}

+ (id)stringToRegionalIndicatorString:(id)a3
{
  id v3 = a3;
  objc_super v4 = [NSString string];
  if ([v3 length])
  {
    unint64_t v5 = 0;
    do
    {
      v6 = +[EMFStringUtilities _stringWithUnichar:](EMFStringUtilities, "_stringWithUnichar:", [v3 characterAtIndex:v5] + 127397);
      uint64_t v7 = [v4 stringByAppendingString:v6];

      ++v5;
      objc_super v4 = v7;
    }
    while (v5 < [v3 length]);
  }
  else
  {
    uint64_t v7 = v4;
  }

  return v7;
}

+ (void)insertToSortedCountries:(id)a3 withAdditionalFlags:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v22 = a4;
  v6 = [v22 allKeys];
  uint64_t v7 = [v6 sortedArrayUsingSelector:sel_compare_];
  v8 = [v7 reverseObjectEnumerator];
  objc_super v9 = [v8 allObjects];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        unint64_t v16 = [v15 integerValue];
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v17 = v16;
          if (v16 < [v5 count])
          {
            v18 = [v22 objectForKey:v15];
            if ([v18 count])
            {
              unint64_t v19 = 0;
              unint64_t v20 = v17 + 1;
              do
              {
                v21 = [v18 objectAtIndex:v19];
                [v5 insertObject:v21 atIndex:v20 + v19];

                ++v19;
              }
              while (v19 < [v18 count]);
            }
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }
}

+ (id)extraFlagsForCountryCode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"JP"])
  {
    objc_super v4 = &unk_1F1286920;
  }
  else if ([v3 isEqualToString:@"GB"])
  {
    objc_super v4 = &unk_1F1286938;
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

+ (id)insertionFlagsForCountryCodes:(id)a3 inSortedCountryCodes:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    uint64_t v10 = *MEMORY[0x1E4F1C400];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v13 = [MEMORY[0x1E4F1CA20] currentLocale];
        v14 = [v13 displayNameForKey:v10 value:v12];
        uint64_t v15 = [v6 indexOfObject:v14];

        unint64_t v16 = +[EMFEmojiCategory extraFlagsForCountryCode:v12];
        if (v16)
        {
          unint64_t v17 = [NSNumber numberWithUnsignedInteger:v15];
          [v20 setObject:v16 forKey:v17];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  return v20;
}

+ (id)computeEmojiFlagsSortedByLanguage
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  objc_super v4 = +[EMFEmojiCategory flagEmojiCountryCodesCommon];
  id v5 = [v3 arrayWithArray:v4];

  if ((EMFIsDeviceInGreaterChina() & 1) == 0) {
    [v5 addObject:@"TW"];
  }
  uint64_t v6 = [v5 count];
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v6];
  uint64_t v8 = [MEMORY[0x1E4F1CA20] currentLocale];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    uint64_t v12 = *MEMORY[0x1E4F1C400];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v15 = [v8 displayNameForKey:v12 value:v14];
        if (v15)
        {
          unint64_t v16 = (void *)v15;
        }
        else
        {
          unint64_t v17 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];

          unint64_t v16 = [v17 displayNameForKey:v12 value:v14];
          uint64_t v8 = v17;
        }
        v18 = [a1 stringToRegionalIndicatorString:v14];
        [v7 setValue:v18 forKey:v16];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v10);
  }

  unint64_t v19 = [v7 allKeys];
  id v20 = [v19 sortedArrayUsingSelector:sel_localizedStandardCompare_];

  long long v21 = +[EMFEmojiCategory insertionFlagsForCountryCodes:&unk_1F1286950 inSortedCountryCodes:v20];
  long long v22 = [v7 objectsForKeys:v20 notFoundMarker:&stru_1F126FA78];
  long long v23 = (void *)[v22 mutableCopy];

  +[EMFEmojiCategory insertToSortedCountries:v23 withAdditionalFlags:v21];
  long long v24 = [(id)objc_opt_class() FlagsEmoji];
  long long v25 = [v24 arrayByAddingObjectsFromArray:v23];

  return v25;
}

- (NSString)localizedName
{
  id v3 = objc_opt_class();
  objc_super v4 = [(EMFEmojiCategory *)self identifier];
  id v5 = [v3 _baseLocalizationKeyForIdentifier:v4];
  uint64_t v6 = [v5 stringByAppendingString:@" Category"];

  uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringInDeviceLanguageForKey:v6];

  return (NSString *)v8;
}

- (NSString)shortLocalizedName
{
  id v3 = objc_opt_class();
  objc_super v4 = [(EMFEmojiCategory *)self identifier];
  id v5 = [v3 _baseLocalizationKeyForIdentifier:v4];
  uint64_t v6 = [v5 stringByAppendingString:@" Category Fallback"];

  uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringInDeviceLanguageForKey:v6];

  return (NSString *)v8;
}

+ (id)localizedRecentsDescription
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringInDeviceLanguageForKey:@"Recents Description"];

  return v3;
}

+ (id)localizedSkinToneEmojiDescription
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringInDeviceLanguageForKey:@"Skin Tone Emoji Help"];

  return v3;
}

- (id)emojiTokensForLocaleData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_class();
  uint64_t v6 = [(EMFEmojiCategory *)self identifier];
  uint64_t v7 = [v5 _emojiSetForIdentifier:v6];

  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = +[EMFEmojiToken emojiTokenWithString:localeData:](EMFEmojiToken, "emojiTokenWithString:localeData:", *(void *)(*((void *)&v16 + 1) + 8 * i), v4, (void)v16);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (BOOL)_isDingbatsVariantEmoji:(id)a3
{
  id v4 = a3;
  id v5 = [a1 DingbatsVariantEmoji];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (BOOL)_isNoneVariantEmoji:(id)a3
{
  id v4 = a3;
  id v5 = [a1 NoneVariantEmoji];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (BOOL)_isSkinToneEmoji:(id)a3
{
  id v4 = a3;
  id v5 = [a1 SkinToneEmoji];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (BOOL)_isGenderEmoji:(id)a3
{
  id v4 = a3;
  id v5 = [a1 GenderEmoji];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (BOOL)_isProfessionEmoji:(id)a3
{
  id v4 = a3;
  id v5 = [a1 ProfessionEmoji];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (BOOL)_isFlagEmoji:(id)a3
{
  id v4 = a3;
  id v5 = [a1 FlagsEmoji];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (BOOL)_supportsCoupleSkinToneSelection:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([(id)objc_opt_class() _isHandholdingCoupleEmoji:v3] & 1) != 0
    || ([(id)objc_opt_class() _isCoupleMultiSkinToneEmoji:v3] & 1) != 0
    || [v3 rangeOfString:@"‍❤️‍" options:2] != 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

+ (BOOL)_isCoupleMultiSkinToneEmoji:(id)a3
{
  id v4 = a3;
  id v5 = [a1 CoupleMultiSkinToneEmoji];
  if ([v5 containsObject:v4])
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v7 = [a1 ExtendedCoupleMultiSkinToneEmoji];
    if ([v7 containsObject:v4]) {
      char v6 = 1;
    }
    else {
      char v6 = [a1 _isBaseHandshakeOrHandshakeWithSkintonesEmoji:v4];
    }
  }
  return v6;
}

+ (BOOL)_isHandholdingCoupleEmoji:(id)a3
{
  id v4 = a3;
  id v5 = [a1 CoupleMultiSkinToneEmoji];
  char v6 = +[EMFStringUtilities _stringWithUnichar:](EMFStringUtilities, "_stringWithUnichar:", +[EMFStringUtilities _firstLongCharacterOfString:v4]);
  BOOL v7 = ([v5 containsObject:v6] & 1) != 0
    || [v4 rangeOfString:@"‍🤝‍" options:2] != 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

+ (BOOL)_isComposedCoupleMultiSkinToneEmoji:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"‍🤝‍" options:2];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v4 = [v3 rangeOfString:@"‍❤️‍" options:2];
  }
  BOOL v5 = v4 != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

+ (BOOL)_isBaseHandshakeOrHandshakeWithSkintonesEmoji:(id)a3
{
  id v3 = a3;
  if ([v3 rangeOfString:@"🤝" options:2])
  {
    uint64_t v4 = [v3 rangeOfString:@"🫱" options:2];
    uint64_t v5 = [v3 rangeOfString:@"🫲" options:2];
    BOOL v7 = v4 != 0x7FFFFFFFFFFFFFFFLL && v5 != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

+ (BOOL)_isMultiPersonFamilySkinToneEmoji:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 MultiPersonFamilySkinToneEmoji];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)DingbatsVariantEmoji
{
  if (DingbatsVariantEmoji_onceToken != -1) {
    dispatch_once(&DingbatsVariantEmoji_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)DingbatsVariantEmoji_DingbatsVariantEmojiSet;
  return v2;
}

uint64_t __40__EMFEmojiCategory_DingbatsVariantEmoji__block_invoke()
{
  DingbatsVariantEmoji_DingbatsVariantEmojiSet = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F1286968];
  return MEMORY[0x1F41817F8]();
}

+ (id)NoneVariantEmoji
{
  if (NoneVariantEmoji_onceToken != -1) {
    dispatch_once(&NoneVariantEmoji_onceToken, &__block_literal_global_783);
  }
  v2 = (void *)NoneVariantEmoji_NoneVariantEmojiSet;
  return v2;
}

uint64_t __36__EMFEmojiCategory_NoneVariantEmoji__block_invoke()
{
  NoneVariantEmoji_NoneVariantEmojiSet = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F1286980];
  return MEMORY[0x1F41817F8]();
}

+ (id)SkinToneEmoji
{
  if (SkinToneEmoji_onceToken != -1) {
    dispatch_once(&SkinToneEmoji_onceToken, &__block_literal_global_863);
  }
  v2 = (void *)SkinToneEmoji_SkinToneEmojiSet;
  return v2;
}

uint64_t __33__EMFEmojiCategory_SkinToneEmoji__block_invoke()
{
  SkinToneEmoji_SkinToneEmojiSet = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F1286998];
  return MEMORY[0x1F41817F8]();
}

+ (id)GenderEmoji
{
  if (GenderEmoji_onceToken != -1) {
    dispatch_once(&GenderEmoji_onceToken, &__block_literal_global_1207);
  }
  v2 = (void *)GenderEmoji_GenderEmojiSet;
  return v2;
}

uint64_t __31__EMFEmojiCategory_GenderEmoji__block_invoke()
{
  GenderEmoji_GenderEmojiSet = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F12869B0];
  return MEMORY[0x1F41817F8]();
}

+ (id)ProfessionEmoji
{
  if (ProfessionEmoji_onceToken != -1) {
    dispatch_once(&ProfessionEmoji_onceToken, &__block_literal_global_1221);
  }
  v2 = (void *)ProfessionEmoji_ProfessionEmojiSet;
  return v2;
}

uint64_t __35__EMFEmojiCategory_ProfessionEmoji__block_invoke()
{
  ProfessionEmoji_ProfessionEmojiSet = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F12869C8];
  return MEMORY[0x1F41817F8]();
}

+ (id)ProfessionWithoutSkinToneEmoji
{
  if (ProfessionWithoutSkinToneEmoji_onceToken != -1) {
    dispatch_once(&ProfessionWithoutSkinToneEmoji_onceToken, &__block_literal_global_1481);
  }
  v2 = (void *)ProfessionWithoutSkinToneEmoji_ProfessionWithoutSkinToneEmojiSet;
  return v2;
}

uint64_t __50__EMFEmojiCategory_ProfessionWithoutSkinToneEmoji__block_invoke()
{
  ProfessionWithoutSkinToneEmoji_ProfessionWithoutSkinToneEmojiSet = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F12869E0];
  return MEMORY[0x1F41817F8]();
}

+ (id)CoupleMultiSkinToneEmoji
{
  if (CoupleMultiSkinToneEmoji_onceToken != -1) {
    dispatch_once(&CoupleMultiSkinToneEmoji_onceToken, &__block_literal_global_1486);
  }
  v2 = (void *)CoupleMultiSkinToneEmoji_CoupleMultiSkinToneEmoji;
  return v2;
}

uint64_t __44__EMFEmojiCategory_CoupleMultiSkinToneEmoji__block_invoke()
{
  CoupleMultiSkinToneEmoji_CoupleMultiSkinToneEmojuint64_t i = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F12869F8];
  return MEMORY[0x1F41817F8]();
}

+ (id)ExtendedCoupleMultiSkinToneEmoji
{
  if (ExtendedCoupleMultiSkinToneEmoji_onceToken != -1) {
    dispatch_once(&ExtendedCoupleMultiSkinToneEmoji_onceToken, &__block_literal_global_1500);
  }
  v2 = (void *)ExtendedCoupleMultiSkinToneEmoji_ExtendedCoupleMultiSkinToneEmoji;
  return v2;
}

uint64_t __52__EMFEmojiCategory_ExtendedCoupleMultiSkinToneEmoji__block_invoke()
{
  ExtendedCoupleMultiSkinToneEmoji_ExtendedCoupleMultiSkinToneEmojuint64_t i = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F1286A10];
  return MEMORY[0x1F41817F8]();
}

+ (id)MultiPersonFamilySkinToneEmoji
{
  if (MultiPersonFamilySkinToneEmoji_onceToken != -1) {
    dispatch_once(&MultiPersonFamilySkinToneEmoji_onceToken, &__block_literal_global_1529);
  }
  v2 = (void *)MultiPersonFamilySkinToneEmoji_MultiPersonFamilySkinToneEmoji;
  return v2;
}

uint64_t __50__EMFEmojiCategory_MultiPersonFamilySkinToneEmoji__block_invoke()
{
  MultiPersonFamilySkinToneEmoji_MultiPersonFamilySkinToneEmojuint64_t i = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F1286A28];
  return MEMORY[0x1F41817F8]();
}

+ (id)NewlyAddedEmoji
{
  if (NewlyAddedEmoji_onceToken != -1) {
    dispatch_once(&NewlyAddedEmoji_onceToken, &__block_literal_global_1552);
  }
  v2 = (void *)NewlyAddedEmoji_newlyAddedEmojiSet;
  return v2;
}

void __35__EMFEmojiCategory_NewlyAddedEmoji__block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v0 = objc_opt_new();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v1 = [&unk_1F1286A58 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v10;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v10 != v3) {
          objc_enumerationMutation(&unk_1F1286A58);
        }
        uint64_t v5 = +[EMFStringUtilities _skinToneVariantsForString:*(void *)(*((void *)&v9 + 1) + 8 * v4)];
        [v0 addObjectsFromArray:v5];

        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [&unk_1F1286A58 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v2);
  }
  char v6 = [&unk_1F1286A40 arrayByAddingObjectsFromArray:v0];
  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];
  uint64_t v8 = (void *)NewlyAddedEmoji_newlyAddedEmojiSet;
  NewlyAddedEmoji_newlyAddedEmojiSet = v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

+ (id)PrepopulatedEmoji
{
  return &unk_1F1286A70;
}

+ (id)PeopleEmoji
{
  return &unk_1F1286A88;
}

+ (id)NatureEmoji
{
  return &unk_1F1286AA0;
}

+ (id)FoodAndDrinkEmoji
{
  return &unk_1F1286AB8;
}

+ (id)CelebrationEmoji
{
  return &unk_1F1286AD0;
}

+ (id)ActivityEmoji
{
  return &unk_1F1286AE8;
}

+ (id)TravelAndPlacesEmoji
{
  return &unk_1F1286B00;
}

+ (id)ObjectsEmoji
{
  return &unk_1F1286B18;
}

+ (id)SymbolsEmoji
{
  return &unk_1F1286B30;
}

+ (id)FlagsEmoji
{
  return &unk_1F1286B48;
}

+ (id)flagEmojiCountryCodesCommon
{
  return &unk_1F1286B60;
}

@end