@interface HKSignedClinicalDataUtilities
+ (id)preferredRecordIssuerDisplayNameWithIssuerIdentifier:(id)a3;
+ (id)recordIssuerDisplayNameWithIssuerIdentifier:(id)a3;
+ (id)recordItemsDisplayNameWithItems:(id)a3;
+ (id)recordTypeDisplayNameWithTypes:(id)a3;
@end

@implementation HKSignedClinicalDataUtilities

+ (id)recordTypeDisplayNameWithTypes:(id)a3
{
  id v3 = a3;
  int v4 = [v3 containsObject:@"https://smarthealth.cards#covid19"];
  if ([v3 containsObject:@"https://smarthealth.cards#immunization"])
  {
    v5 = HKHealthKitFrameworkBundle();
    if (v4) {
      v6 = @"HEALTH_CARD_TYPE_COVID_IMMUNIZATION";
    }
    else {
      v6 = @"HEALTH_CARD_TYPE_IMMUNIZATION";
    }
  }
  else
  {
    int v7 = [v3 containsObject:@"https://smarthealth.cards#laboratory"];
    v5 = HKHealthKitFrameworkBundle();
    if (v7)
    {
      if (v4) {
        v6 = @"HEALTH_CARD_TYPE_COVID_LABORATORY";
      }
      else {
        v6 = @"HEALTH_CARD_TYPE_LABORATORY";
      }
    }
    else if (v4)
    {
      v6 = @"HEALTH_CARD_TYPE_COVID_CARD";
    }
    else
    {
      v6 = @"HEALTH_CARD_TYPE_SMART_HEALTH_CARD";
    }
  }
  v8 = [v5 localizedStringForKey:v6 value:&stru_1EEC60288 table:@"Localizable-Pasadena"];

  return v8;
}

+ (id)recordItemsDisplayNameWithItems:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28BD0]) initWithArray:v21];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [v3 objectEnumerator];
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v10 = [v3 countForObject:v9];
        if (v10 == 1)
        {
          [v4 addObject:v9];
        }
        else
        {
          uint64_t v11 = v10;
          v12 = NSString;
          v13 = HKHealthKitFrameworkBundle();
          v14 = [v13 localizedStringForKey:@"HEALTH_CARD_DISPLAY_NAME_COUNTED" value:&stru_1EEC60288 table:@"Localizable-Pasadena"];
          v15 = [NSNumber numberWithUnsignedInteger:v11];
          v16 = objc_msgSend(v12, "stringWithFormat:", v14, v9, v15);

          [v4 addObject:v16];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  if ([v4 count])
  {
    [v4 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
    v17 = HKHealthKitFrameworkBundle();
    v18 = [v17 localizedStringForKey:@"HEALTH_CARD_DISPLAY_NAME_JOIN_STRING" value:&stru_1EEC60288 table:@"Localizable-Pasadena"];

    [v4 componentsJoinedByString:v18];
  }
  else
  {
    v18 = HKHealthKitFrameworkBundle();
    [v18 localizedStringForKey:@"HEALTH_CARD_DISPLAY_NAME_EMPTY_CARD" value:&stru_1EEC60288 table:@"Localizable-Pasadena"];
  v19 = };

  return v19;
}

+ (id)recordIssuerDisplayNameWithIssuerIdentifier:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = a3;
  uint64_t v5 = [v3 URLWithString:v4];
  uint64_t v6 = [v5 host];
  uint64_t v7 = v6;
  if (!v6) {
    uint64_t v6 = v4;
  }
  id v8 = v6;

  return v8;
}

+ (id)preferredRecordIssuerDisplayNameWithIssuerIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"http://www.iso.org/3166-1/a2/"])
  {
    id v4 = [v3 substringWithRange:objc_msgSend(@"http://www.iso.org/3166-1/a2/", "length"), objc_msgSend(v3, "length") - objc_msgSend(@"http://www.iso.org/3166-1/a2/", "length")];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableCurrentLocale");
    uint64_t v6 = [v5 localizedStringForCountryCode:v4];

    if ([v6 length]) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = v4;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

@end