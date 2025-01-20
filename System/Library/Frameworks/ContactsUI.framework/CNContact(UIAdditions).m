@interface CNContact(UIAdditions)
+ (id)calendarForBirthdayLabel:()UIAdditions;
+ (id)contactWithStateRestorationCoder:()UIAdditions store:keys:;
+ (id)descriptorForAllUIKeys;
+ (id)multiValuePropertiesSupportingPredicateValidation;
+ (id)stringIdentifierForImageType:()UIAdditions;
+ (uint64_t)downtimeWhitelistUIEnabled;
+ (uint64_t)geminiEnabled;
+ (uint64_t)imageTypeForContactImageSource:()UIAdditions;
+ (uint64_t)imageTypeStringIdentifierForImageSource:()UIAdditions;
+ (uint64_t)nameAndPhotoSharingDebugUIEnabled;
+ (uint64_t)quickActionsEnabled;
+ (uint64_t)rawImageSourceForIdentifier:()UIAdditions;
+ (uint64_t)rawImageTypeForIdentifier:()UIAdditions;
+ (uint64_t)settableMeCardEnabled;
+ (uint64_t)suggestionsEnabled;
+ (uint64_t)suggestionsShownInEditMode;
- (BOOL)hasLowQualityImage;
- (BOOL)overrideSensitiveContent;
- (__CFString)posterFallbackDisplayName;
- (id)birthdays;
- (id)contactImageBackgroundColors;
- (id)contactPosterBackgroundColors;
- (id)copyWithCuratingBirthdaySuggestion;
- (id)personName;
- (id)posterName;
- (id)vCardRepresentation;
- (id)validPropertiesByEvaluatingPredicate:()UIAdditions onMultiValueProperties:;
- (uint64_t)copyWithCuratingAllSuggestionsAndBirthdaySuggestion;
- (uint64_t)hasImageOfType:()UIAdditions;
- (uint64_t)isUnknown;
- (uint64_t)rawImageSource;
- (uint64_t)rawImageType;
- (uint64_t)supportsInstantMessageService;
@end

@implementation CNContact(UIAdditions)

+ (uint64_t)suggestionsEnabled
{
  if (suggestionsEnabled_onceToken != -1) {
    dispatch_once(&suggestionsEnabled_onceToken, &__block_literal_global_30819);
  }
  return suggestionsEnabled_enabled;
}

- (id)copyWithCuratingBirthdaySuggestion
{
  id v1 = a1;
  v2 = [v1 dates];
  v3 = objc_msgSend(v2, "_cn_firstObjectPassingTest:", &__block_literal_global_63_30780);

  if (v3)
  {
    v4 = [v1 birthday];
    if (v4)
    {
    }
    else
    {
      v5 = [v1 nonGregorianBirthday];

      if (!v5)
      {
        v8 = (void *)[v1 mutableCopy];
        v9 = [v3 value];
        v10 = [(id)objc_opt_class() calendarForBirthdayLabel:@"_systemCalendar"];
        [v9 setCalendar:v10];

        [v8 setBirthday:v9];
        v11 = [v8 dates];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __60__CNContact_UIAdditions__copyWithCuratingBirthdaySuggestion__block_invoke_2;
        v13[3] = &unk_1E5498D48;
        id v14 = v3;
        v12 = objc_msgSend(v11, "_cn_filter:", v13);
        [v8 setDates:v12];

        id v6 = [v8 freezeWithSelfAsSnapshot];

        goto LABEL_6;
      }
    }
  }
  id v6 = v1;
LABEL_6:

  return v6;
}

- (uint64_t)copyWithCuratingAllSuggestionsAndBirthdaySuggestion
{
  id v1 = (void *)[a1 copyWithCuratingBirthdaySuggestion];
  uint64_t v2 = [v1 copyWithCuratingAllSuggestions];

  return v2;
}

- (BOOL)hasLowQualityImage
{
  [a1 cropRect];
  if (v1 == *MEMORY[0x1E4F1DB30] && v2 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    return 0;
  }
  if (v2 < 250.0) {
    return 1;
  }
  return v1 < 250.0;
}

- (uint64_t)hasImageOfType:()UIAdditions
{
  v4 = [(id)objc_opt_class() stringIdentifierForImageType:a3];
  if (v4 && ([a1 imageType], v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = [a1 imageType];
    uint64_t v7 = [v6 isEqualToString:v4];
  }
  else
  {
    id v6 = [a1 imageType];
    uint64_t v7 = v4 == v6;
  }

  return v7;
}

- (uint64_t)rawImageSource
{
  double v2 = objc_opt_class();
  v3 = [a1 imageType];
  uint64_t v4 = [v2 rawImageSourceForIdentifier:v3];

  return v4;
}

- (uint64_t)rawImageType
{
  double v2 = objc_opt_class();
  v3 = [a1 imageType];
  uint64_t v4 = [v2 rawImageTypeForIdentifier:v3];

  return v4;
}

- (id)vCardRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  double v2 = [MEMORY[0x1E4FB8C18] optionsFromPreferences];
  [v2 setIncludePhotos:1];
  [v2 setIncludeNotes:1];
  v3 = (void *)MEMORY[0x1E4F1B998];
  v7[0] = a1;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = [v3 dataWithContacts:v4 options:v2 error:0];

  return v5;
}

- (id)validPropertiesByEvaluatingPredicate:()UIAdditions onMultiValueProperties:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v24 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [(id)objc_opt_class() multiValuePropertiesSupportingPredicateValidation];

  if (v8 != v7)
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __86__CNContact_UIAdditions__validPropertiesByEvaluatingPredicate_onMultiValueProperties___block_invoke;
    v33[3] = &unk_1E549A598;
    v33[4] = a1;
    uint64_t v9 = objc_msgSend(v7, "_cn_filter:", v33);

    id v7 = (id)v9;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v7;
  uint64_t v22 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v30;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v10;
        uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8 * v10);
        v12 = [a1 valueForKey:v11];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v34 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = [*(id *)(*((void *)&v25 + 1) + 8 * i) identifier];
              v18 = [MEMORY[0x1E4F1B970] contactPropertyWithContact:a1 propertyKey:v11 identifier:v17];
              if ([v6 evaluateWithObject:v18]) {
                [v24 addObject:v18];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v34 count:16];
          }
          while (v14);
        }

        uint64_t v10 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v22);
  }

  return v24;
}

- (id)contactPosterBackgroundColors
{
  double v1 = [a1 backgroundColors];
  double v2 = [v1 contactPoster];

  return v2;
}

- (id)contactImageBackgroundColors
{
  double v1 = [a1 backgroundColors];
  double v2 = [v1 contactImage];

  return v2;
}

- (id)birthdays
{
  double v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  v3 = [a1 birthday];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1BA20] entryWithIdentifier:@"_systemCalendar" label:@"_systemCalendar" value:v3];
    [v2 addObject:v4];
  }
  v5 = [a1 nonGregorianBirthday];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 calendar];
    id v8 = [v7 calendarIdentifier];

    uint64_t v9 = [MEMORY[0x1E4F1BA20] entryWithIdentifier:v8 label:v8 value:v6];
    [v2 addObject:v9];
  }
  if (![v2 count])
  {
    uint64_t v10 = [a1 dates];
    uint64_t v11 = objc_msgSend(v10, "_cn_firstObjectPassingTest:", &__block_literal_global_51_30783);

    objc_msgSend(v2, "_cn_addNonNilObject:", v11);
  }

  return v2;
}

- (__CFString)posterFallbackDisplayName
{
  double v2 = [a1 phoneNumbers];
  v3 = [v2 firstObject];
  uint64_t v4 = [v3 value];
  v5 = [v4 formattedStringValue];

  uint64_t v6 = *MEMORY[0x1E4F5A298];
  if ((*(uint64_t (**)(void, void *))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v5))
  {
    id v7 = [a1 emailAddresses];
    id v8 = [v7 firstObject];
    uint64_t v9 = [v8 value];

    if ((*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v9))
    {
      uint64_t v10 = [a1 organizationName];
      if ((*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v10)) {
        uint64_t v11 = &stru_1ED8AC728;
      }
      else {
        uint64_t v11 = v10;
      }
    }
    else
    {
      uint64_t v11 = v9;
    }
  }
  else
  {
    uint64_t v11 = v5;
  }

  return v11;
}

- (id)posterName
{
  double v2 = [MEMORY[0x1E4F1B910] posterNameComponentsForContact:a1];
  if ([v2 singleNameComponentIndex]) {
    [v2 secondNameComponent];
  }
  else {
  v3 = [v2 firstNameComponent];
  }
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    id v4 = [a1 posterFallbackDisplayName];
  }
  else
  {
    id v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (id)personName
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1B910]);
  [v2 setIgnoresOrganization:1];
  v3 = [v2 stringFromContact:a1];

  return v3;
}

- (BOOL)overrideSensitiveContent
{
  double v1 = [a1 sensitiveContentConfiguration];
  BOOL v2 = [v1 override] == 1;

  return v2;
}

- (uint64_t)supportsInstantMessageService
{
  return 1;
}

- (uint64_t)isUnknown
{
  if ([a1 isSuggested]) {
    return [a1 isSuggestedMe] ^ 1;
  }
  int v2 = [a1 iOSLegacyIdentifier];
  if (v2 == *MEMORY[0x1E4F1ADF8]) {
    return [a1 isSuggestedMe] ^ 1;
  }
  else {
    return 0;
  }
}

+ (uint64_t)rawImageSourceForIdentifier:()UIAdditions
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F1AE58]])
  {
    uint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1AE38]])
  {
    uint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1AE50]])
  {
    uint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1AE40]])
  {
    uint64_t v4 = 4;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (uint64_t)rawImageTypeForIdentifier:()UIAdditions
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F1AE58]])
  {
    uint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1AE38]])
  {
    uint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1AE50]])
  {
    uint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1AE40]])
  {
    uint64_t v4 = 4;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (uint64_t)imageTypeForContactImageSource:()UIAdditions
{
  if (a3 > 3) {
    return 4;
  }
  else {
    return qword_18B9C37F8[a3];
  }
}

+ (uint64_t)imageTypeStringIdentifierForImageSource:()UIAdditions
{
  uint64_t v3 = [(id)objc_opt_class() imageTypeForContactImageSource:a3];
  uint64_t v4 = objc_opt_class();

  return [v4 stringIdentifierForImageType:v3];
}

+ (id)stringIdentifierForImageType:()UIAdditions
{
  if ((unint64_t)(a3 - 1) > 3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = **((id **)&unk_1E5498D68 + a3 - 1);
  }
  return v4;
}

+ (id)contactWithStateRestorationCoder:()UIAdditions store:keys:
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [v9 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];

  if (v10)
  {
    uint64_t v11 = [v7 unifiedContactWithIdentifier:v10 keysToFetch:v8 error:0];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)multiValuePropertiesSupportingPredicateValidation
{
  if (multiValuePropertiesSupportingPredicateValidation_cn_once_token_2 != -1) {
    dispatch_once(&multiValuePropertiesSupportingPredicateValidation_cn_once_token_2, &__block_literal_global_54);
  }
  v0 = (void *)multiValuePropertiesSupportingPredicateValidation_cn_once_object_2;

  return v0;
}

+ (id)calendarForBirthdayLabel:()UIAdditions
{
  id v3 = a3;
  if ([v3 isEqualToString:@"_systemCalendar"]) {
    id v4 = (id)*MEMORY[0x1E4F1C318];
  }
  else {
    id v4 = v3;
  }
  v5 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v4];

  return v5;
}

+ (id)descriptorForAllUIKeys
{
  if (descriptorForAllUIKeys_cn_once_token_1 != -1) {
    dispatch_once(&descriptorForAllUIKeys_cn_once_token_1, &__block_literal_global_39_30791);
  }
  v0 = (void *)descriptorForAllUIKeys_cn_once_object_1;

  return v0;
}

+ (uint64_t)nameAndPhotoSharingDebugUIEnabled
{
  if (nameAndPhotoSharingDebugUIEnabled_onceToken != -1) {
    dispatch_once(&nameAndPhotoSharingDebugUIEnabled_onceToken, &__block_literal_global_34_30793);
  }
  return nameAndPhotoSharingDebugUIEnabled_enabled;
}

+ (uint64_t)downtimeWhitelistUIEnabled
{
  if (downtimeWhitelistUIEnabled_onceToken != -1) {
    dispatch_once(&downtimeWhitelistUIEnabled_onceToken, &__block_literal_global_29_30798);
  }
  return downtimeWhitelistUIEnabled_enabled;
}

+ (uint64_t)settableMeCardEnabled
{
  if (settableMeCardEnabled_onceToken != -1) {
    dispatch_once(&settableMeCardEnabled_onceToken, &__block_literal_global_24);
  }
  return settableMeCardEnabled_enabled;
}

+ (uint64_t)geminiEnabled
{
  if (geminiEnabled_onceToken != -1) {
    dispatch_once(&geminiEnabled_onceToken, &__block_literal_global_19);
  }
  return geminiEnabled_enabled;
}

+ (uint64_t)quickActionsEnabled
{
  if (quickActionsEnabled_onceToken != -1) {
    dispatch_once(&quickActionsEnabled_onceToken, &__block_literal_global_14_30809);
  }
  return quickActionsEnabled_enabled;
}

+ (uint64_t)suggestionsShownInEditMode
{
  if (suggestionsShownInEditMode_onceToken != -1) {
    dispatch_once(&suggestionsShownInEditMode_onceToken, &__block_literal_global_9_30814);
  }
  return suggestionsShownInEditMode_enabled;
}

@end