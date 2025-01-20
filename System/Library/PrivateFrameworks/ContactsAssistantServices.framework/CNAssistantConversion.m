@interface CNAssistantConversion
+ (NSArray)descriptorsForRequiredKeys;
+ (id)addressesForSyncFromContact:(id)a3;
+ (id)addressesFromContact:(id)a3;
+ (id)addressesFromPerson:(id)a3;
+ (id)createSAPersonFromCNContact:(id)a3;
+ (id)createSAPersonFromCNContact:(id)a3 conversionType:(int64_t)a4;
+ (id)createSAPersonFromCNContactWithExternalIdentifier:(id)a3;
+ (id)createSASourceFromCNContainer:(id)a3;
+ (id)descriptorsForRequiredKeysForConversionType:(int64_t)a3;
+ (id)emailAddressesForSyncFromContact:(id)a3;
+ (id)emailAddressesFromContact:(id)a3;
+ (id)emailAddressesFromPerson:(id)a3;
+ (id)filterLabeledValues:(id)a3 droppingEmptyLabels:(BOOL)a4 droppingDuplicates:(BOOL)a5;
+ (id)keysFromPerson:(id)a3;
+ (id)personForSyncFromContact:(id)a3;
+ (id)personFromContact:(id)a3;
+ (id)personFromContact:(id)a3 useABPerson:(BOOL)a4;
+ (id)personFromMeContact:(id)a3;
+ (id)phoneNumbersForSyncFromContact:(id)a3;
+ (id)phoneNumbersFromContact:(id)a3;
+ (id)phoneNumbersFromPerson:(id)a3;
+ (id)relationsForSyncFromContact:(id)a3;
+ (id)relationsFromContact:(id)a3;
+ (id)relationsFromPerson:(id)a3;
+ (id)socialProfilesFromContact:(id)a3;
+ (id)verifyContact:(id)a3 hasDescriptorsForRequiredKeys:(id)a4;
+ (void)addFieldsFromPerson:(id)a3 toContactWithIdentifier:(id)a4 usingStore:(id)a5 saveRequest:(id)a6;
+ (void)applyUpdate:(id)a3 toContactWithIdentifier:(id)a4 usingStore:(id)a5 saveRequest:(id)a6;
+ (void)markMeContactInPeople:(id)a3 usingStore:(id)a4;
+ (void)removeFieldsFromPerson:(id)a3 toContactWithIdentifier:(id)a4 usingStore:(id)a5 saveRequest:(id)a6;
+ (void)setFieldsFromPerson:(id)a3 toContactWithIdentifier:(id)a4 usingStore:(id)a5 saveRequest:(id)a6;
@end

@implementation CNAssistantConversion

+ (NSArray)descriptorsForRequiredKeys
{
  return (NSArray *)+[CNAssistantConversion descriptorsForRequiredKeysForConversionType:0];
}

+ (id)descriptorsForRequiredKeysForConversionType:(int64_t)a3
{
  v21[7] = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x263EFEA20], "descriptorForRequiredKeysForStyle:", *MEMORY[0x263EFDFE0], *MEMORY[0x263EFE148], *MEMORY[0x263EFDFC8], *MEMORY[0x263EFE038], *MEMORY[0x263EFDFB8], *MEMORY[0x263EFDF48], *MEMORY[0x263EFE050], *MEMORY[0x263EFE040], *MEMORY[0x263EFE048], *MEMORY[0x263EFE068], *MEMORY[0x263EFE078], *MEMORY[0x263EFE088], *MEMORY[0x263EFE080], *MEMORY[0x263EFDF80], *MEMORY[0x263EFE070], *MEMORY[0x263EFE0A0], *MEMORY[0x263EFE0F8],
        *MEMORY[0x263EFE110],
      v9 = *MEMORY[0x263EFDFD8]);
      v19[19] = v9;
      v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:20];

      goto LABEL_9;
    case 2:
      uint64_t v11 = *MEMORY[0x263EFE148];
      v20[0] = *MEMORY[0x263EFDFE0];
      v20[1] = v11;
      uint64_t v12 = *MEMORY[0x263EFDFB8];
      v20[2] = *MEMORY[0x263EFDFC8];
      v20[3] = v12;
      uint64_t v13 = *MEMORY[0x263EFE068];
      v20[4] = *MEMORY[0x263EFE050];
      v20[5] = v13;
      uint64_t v14 = *MEMORY[0x263EFE088];
      v20[6] = *MEMORY[0x263EFE078];
      v20[7] = v14;
      uint64_t v15 = *MEMORY[0x263EFDF80];
      v20[8] = *MEMORY[0x263EFE080];
      v20[9] = v15;
      uint64_t v16 = *MEMORY[0x263EFE0A0];
      v20[10] = *MEMORY[0x263EFE070];
      v20[11] = v16;
      uint64_t v17 = *MEMORY[0x263EFDFD8];
      v20[12] = *MEMORY[0x263EFE0F8];
      v20[13] = v17;
      v6 = (void *)MEMORY[0x263EFF8C0];
      v7 = v20;
      uint64_t v8 = 14;
      goto LABEL_7;
    case 1:
      uint64_t v3 = *MEMORY[0x263EFDFC8];
      v21[0] = *MEMORY[0x263EFDFE0];
      v21[1] = v3;
      uint64_t v4 = *MEMORY[0x263EFE050];
      v21[2] = *MEMORY[0x263EFE088];
      v21[3] = v4;
      uint64_t v5 = *MEMORY[0x263EFE078];
      v21[4] = *MEMORY[0x263EFE0F8];
      v21[5] = v5;
      v21[6] = *MEMORY[0x263EFDFD8];
      v6 = (void *)MEMORY[0x263EFF8C0];
      v7 = v21;
      uint64_t v8 = 7;
LABEL_7:
      v10 = [v6 arrayWithObjects:v7 count:v8];
      goto LABEL_9;
  }
  v10 = (void *)MEMORY[0x263EFFA68];
LABEL_9:
  return v10;
}

+ (id)personFromMeContact:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[CNAssistantConversion descriptorsForRequiredKeysForConversionType:1];
  int v5 = [v3 areKeysAvailable:v4];

  if (v5)
  {
    v6 = objc_opt_new();
    [v6 setMe:MEMORY[0x263EFFA88]];
    v7 = [v3 givenName];
    uint64_t v8 = NonEmptyOrNilString(v7);
    [v6 setFirstName:v8];

    v9 = [v3 nickname];
    v10 = NonEmptyOrNilString(v9);
    [v6 setNickName:v10];

    uint64_t v11 = [v3 phoneticGivenName];
    uint64_t v12 = NonEmptyOrNilString(v11);
    [v6 setFirstNamePhonetic:v12];

    [v6 setIdentifier:0];
    uint64_t v13 = +[CNAssistantConversion relationsFromContact:v3];
    uint64_t v14 = NonEmptyOrNilArray(v13);
    [v6 setRelatedNames:v14];

    uint64_t v15 = [v3 phonemeData];
    uint64_t v16 = NonEmptyOrNilString(v15);
    [v6 setPhonemeData:v16];

    uint64_t v17 = [v3 identifier];
    v18 = NonEmptyOrNilString(v17);
    [v6 setInternalGUID:v18];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)personForSyncFromContact:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[CNAssistantConversion descriptorsForRequiredKeysForConversionType:2];
  int v5 = [v3 areKeysAvailable:v4];

  if (!v5) {
    goto LABEL_19;
  }
  v6 = [v3 givenName];
  if (v6)
  {
    v7 = [v3 givenName];
    BOOL v8 = [v7 length] != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  v9 = [v3 familyName];
  if (v9)
  {
    v10 = [v3 familyName];
    if ([v10 length]) {
      BOOL v8 = 1;
    }
  }
  uint64_t v11 = [v3 organizationName];
  if (v11)
  {
    uint64_t v12 = [v3 organizationName];
    if ([v12 length]) {
      BOOL v8 = 1;
    }
  }
  uint64_t v13 = [v3 nickname];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = [v3 nickname];
    if ([v15 length]) {
      BOOL v8 = 1;
    }
  }
  if (v8)
  {
    uint64_t v16 = objc_opt_new();
    uint64_t v17 = +[CNAssistantID assistantIDFromContact:v3];
    [v16 setIdentifier:v17];
    v18 = [v3 identifier];
    [v16 setInternalGUID:v18];

    v19 = [v3 givenName];
    v20 = NonEmptyOrNilString(v19);
    [v16 setFirstName:v20];

    v21 = [v3 familyName];
    v22 = NonEmptyOrNilString(v21);
    [v16 setLastName:v22];

    v23 = [v3 nickname];
    v24 = NonEmptyOrNilString(v23);
    [v16 setNickName:v24];

    v25 = [v3 organizationName];
    v26 = NonEmptyOrNilString(v25);
    [v16 setCompany:v26];

    v27 = [v3 phoneticGivenName];
    v28 = NonEmptyOrNilString(v27);
    [v16 setFirstNamePhonetic:v28];

    v29 = [v3 phoneticFamilyName];
    v30 = NonEmptyOrNilString(v29);
    [v16 setLastNamePhonetic:v30];

    v31 = [v3 phonemeData];
    v32 = NonEmptyOrNilString(v31);
    [v16 setPhonemeData:v32];

    v33 = +[CNAssistantConversion emailAddressesForSyncFromContact:v3];
    v34 = NonEmptyOrNilArray(v33);
    [v16 setEmails:v34];

    v35 = +[CNAssistantConversion phoneNumbersForSyncFromContact:v3];
    v36 = NonEmptyOrNilArray(v35);
    [v16 setPhones:v36];

    v37 = +[CNAssistantConversion addressesForSyncFromContact:v3];
    v38 = NonEmptyOrNilArray(v37);
    [v16 setAddresses:v38];

    v39 = +[CNAssistantConversion relationsForSyncFromContact:v3];
    v40 = NonEmptyOrNilArray(v39);
    [v16 setRelatedNames:v40];
  }
  else
  {
LABEL_19:
    uint64_t v16 = 0;
  }

  return v16;
}

+ (id)personFromContact:(id)a3 useABPerson:(BOOL)a4
{
  id v4 = a3;
  int v5 = +[CNAssistantConversion descriptorsForRequiredKeysForConversionType:0];
  int v6 = [v4 areKeysAvailable:v5];

  v7 = 0;
  if (v6)
  {
    v7 = objc_opt_new();
    BOOL v8 = +[CNAssistantID assistantIDFromContact:v4];
    [v7 setIdentifier:v8];
    v9 = [v4 identifier];
    [v7 setInternalGUID:v9];

    v10 = [v4 givenName];
    uint64_t v11 = NonEmptyOrNilString(v10);
    [v7 setFirstName:v11];

    uint64_t v12 = [v4 middleName];
    uint64_t v13 = NonEmptyOrNilString(v12);
    [v7 setMiddleName:v13];

    uint64_t v14 = [v4 familyName];
    uint64_t v15 = NonEmptyOrNilString(v14);
    [v7 setLastName:v15];

    uint64_t v16 = [v4 birthday];

    if (v16)
    {
      uint64_t v17 = [v4 birthday];
      if ([v17 year] == 0x7FFFFFFFFFFFFFFFLL) {
        [v17 setYear:1604];
      }
      v18 = [v17 timeZone];

      if (!v18)
      {
        v19 = [MEMORY[0x263EFFA18] timeZoneWithName:@"UTC"];
        [v17 setTimeZone:v19];
      }
      v20 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
      v21 = [v20 dateFromComponents:v17];
      [v7 setBirthday:v21];
    }
    v22 = [v4 nickname];
    v23 = NonEmptyOrNilString(v22);
    [v7 setNickName:v23];

    v24 = [v4 namePrefix];
    v25 = NonEmptyOrNilString(v24);
    [v7 setPrefix:v25];

    v26 = [v4 nameSuffix];
    v27 = NonEmptyOrNilString(v26);
    [v7 setSuffix:v27];

    v28 = [v4 organizationName];
    v29 = NonEmptyOrNilString(v28);
    [v7 setCompany:v29];

    v30 = [v4 phoneticGivenName];
    v31 = NonEmptyOrNilString(v30);
    [v7 setFirstNamePhonetic:v31];

    v32 = [v4 phoneticFamilyName];
    v33 = NonEmptyOrNilString(v32);
    [v7 setLastNamePhonetic:v33];

    v34 = [v4 phonemeData];
    v35 = NonEmptyOrNilString(v34);
    [v7 setPhonemeData:v35];

    v36 = +[CNAssistantConversion emailAddressesFromContact:v4];
    v37 = NonEmptyOrNilArray(v36);
    [v7 setEmails:v37];

    v38 = +[CNAssistantConversion phoneNumbersFromContact:v4];
    v39 = NonEmptyOrNilArray(v38);
    [v7 setPhones:v39];

    v40 = +[CNAssistantConversion addressesFromContact:v4];
    v41 = NonEmptyOrNilArray(v40);
    [v7 setAddresses:v41];

    v42 = +[CNAssistantConversion relationsFromContact:v4];
    v43 = NonEmptyOrNilArray(v42);
    [v7 setRelatedNames:v43];

    v44 = [MEMORY[0x263EFEA20] stringFromContact:v4 style:0];
    v45 = NonEmptyOrNilString(v44);
    [v7 setFullName:v45];
  }
  return v7;
}

+ (id)personFromContact:(id)a3
{
  return (id)[a1 personFromContact:a3 useABPerson:0];
}

+ (id)createSAPersonFromCNContact:(id)a3 conversionType:(int64_t)a4
{
  id v6 = a3;
  v7 = +[CNAssistantConversion descriptorsForRequiredKeysForConversionType:a4];
  BOOL v8 = +[CNAssistantConversion verifyContact:v6 hasDescriptorsForRequiredKeys:v7];

  switch(a4)
  {
    case 0:
      uint64_t v9 = [a1 personFromContact:v8];
      goto LABEL_7;
    case 2:
      uint64_t v9 = [a1 personForSyncFromContact:v8];
      goto LABEL_7;
    case 1:
      uint64_t v9 = [a1 personFromMeContact:v8];
LABEL_7:
      v10 = (void *)v9;
      goto LABEL_9;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

+ (id)createSAPersonFromCNContact:(id)a3
{
  return +[CNAssistantConversion createSAPersonFromCNContact:a3 conversionType:0];
}

+ (id)createSAPersonFromCNContactWithExternalIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  if (v3)
  {
    int v5 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingFullTextSearch:v3 containerIdentifiers:0 groupIdentifiers:0];
    id v6 = +[CNAssistantConversion descriptorsForRequiredKeysForConversionType:0];
    v7 = [v4 unifiedContactsMatchingPredicate:v5 keysToFetch:v6 error:0];
  }
  else
  {
    v7 = 0;
  }
  if ([v7 count])
  {
    BOOL v8 = [v7 firstObject];
    uint64_t v9 = +[CNAssistantConversion createSAPersonFromCNContact:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)createSASourceFromCNContainer:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setDomainIdentifier:*MEMORY[0x263F65080]];
  int v5 = +[CNAssistantID assistantIDFromContainer:v3];
  [v4 setIdentifier:v5];

  id v6 = NSNumber;
  uint64_t v7 = [v3 type];

  BOOL v8 = [v6 numberWithBool:v7 > 1];
  [v4 setRemote:v8];

  return v4;
}

+ (id)filterLabeledValues:(id)a3 droppingEmptyLabels:(BOOL)a4 droppingDuplicates:(BOOL)a5
{
  id v7 = a3;
  BOOL v8 = v7;
  if (a4 || a5)
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __84__CNAssistantConversion_filterLabeledValues_droppingEmptyLabels_droppingDuplicates___block_invoke;
    v13[3] = &unk_264488CA0;
    BOOL v15 = a4;
    BOOL v16 = a5;
    id v14 = v10;
    id v11 = v10;
    id v9 = [v8 filterUsingBlock:v13];
  }
  else
  {
    id v9 = v7;
  }

  return v9;
}

uint64_t __84__CNAssistantConversion_filterLabeledValues_droppingEmptyLabels_droppingDuplicates___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 label];
  id v4 = v3;
  if (*(unsigned char *)(a1 + 40) && (!v3 || ![v3 length])) {
    goto LABEL_6;
  }
  if (!*(unsigned char *)(a1 + 41))
  {
LABEL_8:
    uint64_t v5 = 1;
    goto LABEL_9;
  }
  if (([*(id *)(a1 + 32) containsObject:v4] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v4];
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v5 = 0;
LABEL_9:

  return v5;
}

+ (id)emailAddressesFromContact:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263EFDF80];
  if ([v4 isKeyAvailable:*MEMORY[0x263EFDF80]])
  {
    id v29 = a1;
    v30 = [MEMORY[0x263EFEA98] sharedInstance];
    v31 = v4;
    id v6 = [v30 entriesForContact:v4 propertyKey:v5 labeledValueIdentifier:0 actionType:0 bundleIdentifier:*MEMORY[0x263EFDEC0]];
    id v7 = [MEMORY[0x263EFF9C0] set];
    v32 = [MEMORY[0x263EFF9C0] set];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (!v9) {
      goto LABEL_14;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v37;
    uint64_t v12 = *MEMORY[0x263EFDEF8];
    uint64_t v13 = *MEMORY[0x263EFDF38];
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        BOOL v16 = [v15 actionType];
        int v17 = [v16 isEqualToString:v12];

        if (v17)
        {
          v18 = [v15 contactProperty];
          v19 = [v18 identifier];
          v20 = v7;
        }
        else
        {
          v21 = [v15 actionType];
          int v22 = [v21 isEqualToString:v13];

          if (!v22) {
            continue;
          }
          v18 = [v15 contactProperty];
          v19 = [v18 identifier];
          v20 = v32;
        }
        [v20 addObject:v19];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (!v10)
      {
LABEL_14:

        id v4 = v31;
        v23 = [v31 emailAddresses];
        v24 = [v29 filterLabeledValues:v23 droppingEmptyLabels:0 droppingDuplicates:0];

        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __51__CNAssistantConversion_emailAddressesFromContact___block_invoke;
        v33[3] = &unk_264488CC8;
        id v34 = v7;
        id v35 = v32;
        id v25 = v32;
        id v26 = v7;
        v27 = [v24 mapUsingBlock:v33];

        goto LABEL_16;
      }
    }
  }
  v27 = (void *)MEMORY[0x263EFFA68];
LABEL_16:

  return v27;
}

id __51__CNAssistantConversion_emailAddressesFromContact___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 value];
  [v4 setEmailAddress:v5];

  id v6 = [v3 label];
  id v7 = NonEmptyOrNilString(v6);
  [v4 setLabel:v7];

  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v3 identifier];
  int v10 = [v8 containsObject:v9];
  uint64_t v11 = MEMORY[0x263EFFA88];
  if (v10) {
    uint64_t v12 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v12 = 0;
  }
  [v4 setFavoriteFacetimeAudio:v12];

  uint64_t v13 = *(void **)(a1 + 40);
  id v14 = [v3 identifier];

  if ([v13 containsObject:v14]) {
    uint64_t v15 = v11;
  }
  else {
    uint64_t v15 = 0;
  }
  [v4 setFavoriteFacetime:v15];

  return v4;
}

+ (id)emailAddressesForSyncFromContact:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263EFDF80];
  if ([v4 isKeyAvailable:*MEMORY[0x263EFDF80]])
  {
    id v29 = a1;
    v30 = [MEMORY[0x263EFEA98] sharedInstance];
    v31 = v4;
    id v6 = [v30 entriesForContact:v4 propertyKey:v5 labeledValueIdentifier:0 actionType:0 bundleIdentifier:*MEMORY[0x263EFDEC0]];
    id v7 = [MEMORY[0x263EFF9C0] set];
    v32 = [MEMORY[0x263EFF9C0] set];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (!v9) {
      goto LABEL_14;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v37;
    uint64_t v12 = *MEMORY[0x263EFDEF8];
    uint64_t v13 = *MEMORY[0x263EFDF38];
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        BOOL v16 = [v15 actionType];
        int v17 = [v16 isEqualToString:v12];

        if (v17)
        {
          v18 = [v15 contactProperty];
          v19 = [v18 identifier];
          v20 = v7;
        }
        else
        {
          v21 = [v15 actionType];
          int v22 = [v21 isEqualToString:v13];

          if (!v22) {
            continue;
          }
          v18 = [v15 contactProperty];
          v19 = [v18 identifier];
          v20 = v32;
        }
        [v20 addObject:v19];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (!v10)
      {
LABEL_14:

        id v4 = v31;
        v23 = [v31 emailAddresses];
        v24 = [v29 filterLabeledValues:v23 droppingEmptyLabels:1 droppingDuplicates:0];

        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __58__CNAssistantConversion_emailAddressesForSyncFromContact___block_invoke;
        v33[3] = &unk_264488CC8;
        id v34 = v7;
        id v35 = v32;
        id v25 = v32;
        id v26 = v7;
        v27 = [v24 mapUsingBlock:v33];

        goto LABEL_16;
      }
    }
  }
  v27 = 0;
LABEL_16:

  return v27;
}

id __58__CNAssistantConversion_emailAddressesForSyncFromContact___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 label];
  [v4 setLabel:v5];

  id v6 = *(void **)(a1 + 32);
  id v7 = [v3 identifier];
  int v8 = [v6 containsObject:v7];
  uint64_t v9 = MEMORY[0x263EFFA88];
  if (v8) {
    uint64_t v10 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v10 = 0;
  }
  [v4 setFavoriteFacetimeAudio:v10];

  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v12 = [v3 identifier];

  if ([v11 containsObject:v12]) {
    uint64_t v13 = v9;
  }
  else {
    uint64_t v13 = 0;
  }
  [v4 setFavoriteFacetime:v13];

  return v4;
}

+ (id)phoneNumbersFromContact:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263EFE070];
  if ([v4 isKeyAvailable:*MEMORY[0x263EFE070]])
  {
    id v36 = a1;
    long long v37 = [MEMORY[0x263EFEA98] sharedInstance];
    long long v38 = v4;
    id v6 = [v37 entriesForContact:v4 propertyKey:v5 labeledValueIdentifier:0 actionType:0 bundleIdentifier:0];
    v40 = [MEMORY[0x263EFF9C0] set];
    v42 = [MEMORY[0x263EFF9C0] set];
    long long v39 = [MEMORY[0x263EFF9C0] set];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (!v8) {
      goto LABEL_18;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v48;
    uint64_t v11 = *MEMORY[0x263EFDEC0];
    uint64_t v12 = *MEMORY[0x263EFDEE8];
    uint64_t v13 = *MEMORY[0x263EFDEF8];
    uint64_t v41 = *MEMORY[0x263EFDF38];
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v48 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        BOOL v16 = [v15 bundleIdentifier];
        int v17 = [v16 isEqualToString:v11];

        if (v17)
        {
          v18 = [v15 actionType];
          int v19 = [v18 isEqualToString:v13];

          if (v19)
          {
            v20 = [v15 contactProperty];
            v21 = [v20 identifier];
            int v22 = v42;
          }
          else
          {
            v27 = [v15 actionType];
            int v28 = [v27 isEqualToString:v41];

            if (!v28) {
              continue;
            }
            v20 = [v15 contactProperty];
            v21 = [v20 identifier];
            int v22 = v39;
          }
          goto LABEL_15;
        }
        v23 = [v15 bundleIdentifier];
        int v24 = [v23 isEqualToString:v12];

        if (v24)
        {
          id v25 = [v15 actionType];
          int v26 = [v25 isEqualToString:v13];

          if (v26)
          {
            v20 = [v15 contactProperty];
            v21 = [v20 identifier];
            int v22 = v40;
LABEL_15:
            [v22 addObject:v21];

            continue;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (!v9)
      {
LABEL_18:

        id v4 = v38;
        id v29 = [v38 phoneNumbers];
        v30 = [v36 filterLabeledValues:v29 droppingEmptyLabels:0 droppingDuplicates:0];

        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __49__CNAssistantConversion_phoneNumbersFromContact___block_invoke;
        v43[3] = &unk_264488CF0;
        id v44 = v42;
        id v45 = v39;
        id v46 = v40;
        id v31 = v40;
        id v32 = v39;
        id v33 = v42;
        id v34 = [v30 mapUsingBlock:v43];

        goto LABEL_20;
      }
    }
  }
  id v34 = 0;
LABEL_20:

  return v34;
}

id __49__CNAssistantConversion_phoneNumbersFromContact___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 value];
  id v6 = [v5 formattedInternationalStringValue];
  [v4 setNumber:v6];

  id v7 = [v3 label];
  uint64_t v8 = NonEmptyOrNilString(v7);
  [v4 setLabel:v8];

  uint64_t v9 = (void *)a1[4];
  uint64_t v10 = [v3 identifier];
  int v11 = [v9 containsObject:v10];
  uint64_t v12 = MEMORY[0x263EFFA88];
  if (v11) {
    uint64_t v13 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v13 = 0;
  }
  [v4 setFavoriteFacetimeAudio:v13];

  id v14 = (void *)a1[5];
  uint64_t v15 = [v3 identifier];
  if ([v14 containsObject:v15]) {
    uint64_t v16 = v12;
  }
  else {
    uint64_t v16 = 0;
  }
  [v4 setFavoriteFacetime:v16];

  int v17 = (void *)a1[6];
  v18 = [v3 identifier];

  if ([v17 containsObject:v18]) {
    uint64_t v19 = v12;
  }
  else {
    uint64_t v19 = 0;
  }
  [v4 setFavoriteVoice:v19];

  return v4;
}

+ (id)phoneNumbersForSyncFromContact:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263EFE070];
  if ([v4 isKeyAvailable:*MEMORY[0x263EFE070]])
  {
    id v36 = a1;
    long long v37 = [MEMORY[0x263EFEA98] sharedInstance];
    long long v38 = v4;
    id v6 = [v37 entriesForContact:v4 propertyKey:v5 labeledValueIdentifier:0 actionType:0 bundleIdentifier:0];
    v40 = [MEMORY[0x263EFF9C0] set];
    v42 = [MEMORY[0x263EFF9C0] set];
    long long v39 = [MEMORY[0x263EFF9C0] set];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (!v8) {
      goto LABEL_18;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v48;
    uint64_t v11 = *MEMORY[0x263EFDEC0];
    uint64_t v12 = *MEMORY[0x263EFDEE8];
    uint64_t v13 = *MEMORY[0x263EFDEF8];
    uint64_t v41 = *MEMORY[0x263EFDF38];
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v48 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v16 = [v15 bundleIdentifier];
        int v17 = [v16 isEqualToString:v11];

        if (v17)
        {
          v18 = [v15 actionType];
          int v19 = [v18 isEqualToString:v13];

          if (v19)
          {
            v20 = [v15 contactProperty];
            v21 = [v20 identifier];
            int v22 = v42;
          }
          else
          {
            v27 = [v15 actionType];
            int v28 = [v27 isEqualToString:v41];

            if (!v28) {
              continue;
            }
            v20 = [v15 contactProperty];
            v21 = [v20 identifier];
            int v22 = v39;
          }
          goto LABEL_15;
        }
        v23 = [v15 bundleIdentifier];
        int v24 = [v23 isEqualToString:v12];

        if (v24)
        {
          id v25 = [v15 actionType];
          int v26 = [v25 isEqualToString:v13];

          if (v26)
          {
            v20 = [v15 contactProperty];
            v21 = [v20 identifier];
            int v22 = v40;
LABEL_15:
            [v22 addObject:v21];

            continue;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (!v9)
      {
LABEL_18:

        id v4 = v38;
        id v29 = [v38 phoneNumbers];
        v30 = [v36 filterLabeledValues:v29 droppingEmptyLabels:1 droppingDuplicates:0];

        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __56__CNAssistantConversion_phoneNumbersForSyncFromContact___block_invoke;
        v43[3] = &unk_264488CF0;
        id v44 = v42;
        id v45 = v39;
        id v46 = v40;
        id v31 = v40;
        id v32 = v39;
        id v33 = v42;
        id v34 = [v30 mapUsingBlock:v43];

        goto LABEL_20;
      }
    }
  }
  id v34 = 0;
LABEL_20:

  return v34;
}

id __56__CNAssistantConversion_phoneNumbersForSyncFromContact___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 label];
  [v4 setLabel:v5];

  id v6 = (void *)a1[4];
  id v7 = [v3 identifier];
  int v8 = [v6 containsObject:v7];
  uint64_t v9 = MEMORY[0x263EFFA88];
  if (v8) {
    uint64_t v10 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v10 = 0;
  }
  [v4 setFavoriteFacetimeAudio:v10];

  uint64_t v11 = (void *)a1[5];
  uint64_t v12 = [v3 identifier];
  if ([v11 containsObject:v12]) {
    uint64_t v13 = v9;
  }
  else {
    uint64_t v13 = 0;
  }
  [v4 setFavoriteFacetime:v13];

  id v14 = (void *)a1[6];
  uint64_t v15 = [v3 identifier];

  if ([v14 containsObject:v15]) {
    uint64_t v16 = v9;
  }
  else {
    uint64_t v16 = 0;
  }
  [v4 setFavoriteVoice:v16];

  return v4;
}

+ (id)addressesFromContact:(id)a3
{
  id v4 = a3;
  if ([v4 isKeyAvailable:*MEMORY[0x263EFE0A0]])
  {
    uint64_t v5 = [v4 postalAddresses];
    id v6 = [a1 filterLabeledValues:v5 droppingEmptyLabels:0 droppingDuplicates:0];

    id v7 = [v6 mapUsingBlock:&__block_literal_global];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id __46__CNAssistantConversion_addressesFromContact___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  id v4 = [v2 label];
  uint64_t v5 = NonEmptyOrNilString(v4);
  [v3 setLabel:v5];

  id v6 = [v2 value];
  id v7 = [v6 street];
  int v8 = NonEmptyOrNilString(v7);
  [v3 setStreet:v8];

  uint64_t v9 = [v2 value];
  uint64_t v10 = [v9 city];
  uint64_t v11 = NonEmptyOrNilString(v10);
  [v3 setCity:v11];

  uint64_t v12 = [v2 value];
  uint64_t v13 = [v12 state];
  id v14 = NonEmptyOrNilString(v13);
  [v3 setStateCode:v14];

  uint64_t v15 = [v2 value];
  uint64_t v16 = [v15 postalCode];
  int v17 = NonEmptyOrNilString(v16);
  [v3 setPostalCode:v17];

  v18 = [v2 value];

  int v19 = [v18 ISOCountryCode];
  v20 = NonEmptyOrNilString(v19);
  [v3 setCountryCode:v20];

  return v3;
}

+ (id)addressesForSyncFromContact:(id)a3
{
  id v4 = a3;
  if ([v4 isKeyAvailable:*MEMORY[0x263EFE0A0]])
  {
    uint64_t v5 = [v4 postalAddresses];
    id v6 = [a1 filterLabeledValues:v5 droppingEmptyLabels:1 droppingDuplicates:1];

    id v7 = [v6 mapUsingBlock:&__block_literal_global_22];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id __53__CNAssistantConversion_addressesForSyncFromContact___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  id v4 = [v2 label];

  [v3 setLabel:v4];
  return v3;
}

+ (id)relationsFromContact:(id)a3
{
  id v4 = a3;
  if ([v4 isKeyAvailable:*MEMORY[0x263EFE0F8]])
  {
    uint64_t v5 = [v4 contactRelations];
    id v6 = [a1 filterLabeledValues:v5 droppingEmptyLabels:1 droppingDuplicates:0];

    id v7 = [v6 mapUsingBlock:&__block_literal_global_25];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263EFFA68];
  }

  return v7;
}

id __46__CNAssistantConversion_relationsFromContact___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  id v4 = [v2 label];
  [v3 setLabel:v4];

  uint64_t v5 = [v2 value];

  id v6 = [v5 name];
  [v3 setName:v6];

  return v3;
}

+ (id)relationsForSyncFromContact:(id)a3
{
  id v4 = a3;
  if ([v4 isKeyAvailable:*MEMORY[0x263EFE0F8]])
  {
    uint64_t v5 = [v4 contactRelations];
    id v6 = [a1 filterLabeledValues:v5 droppingEmptyLabels:1 droppingDuplicates:1];

    id v7 = [v6 mapUsingBlock:&__block_literal_global_28];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263EFFA68];
  }

  return v7;
}

id __53__CNAssistantConversion_relationsForSyncFromContact___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  id v4 = [v2 label];

  [v3 setLabel:v4];
  return v3;
}

+ (id)socialProfilesFromContact:(id)a3
{
  id v4 = a3;
  if ([v4 isKeyAvailable:*MEMORY[0x263EFE110]])
  {
    uint64_t v5 = [v4 socialProfiles];
    id v6 = [a1 filterLabeledValues:v5 droppingEmptyLabels:0 droppingDuplicates:0];

    id v7 = [v6 mapUsingBlock:&__block_literal_global_31];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263EFFA68];
  }

  return v7;
}

id __51__CNAssistantConversion_socialProfilesFromContact___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  id v4 = [v2 value];
  uint64_t v5 = [v4 service];
  id v6 = NonEmptyOrNilString(v5);
  [v3 setServiceType:v6];

  id v7 = [v2 value];
  int v8 = [v7 urlString];
  uint64_t v9 = NonEmptyOrNilString(v8);
  [v3 setUrl:v9];

  uint64_t v10 = [v2 value];

  uint64_t v11 = [v10 username];
  uint64_t v12 = NonEmptyOrNilString(v11);
  [v3 setUserName:v12];

  return v3;
}

+ (id)verifyContact:(id)a3 hasDescriptorsForRequiredKeys:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 areKeysAvailable:v6]) {
    goto LABEL_4;
  }
  v14[0] = *MEMORY[0x263EFDFE0];
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  int v8 = [v5 areKeysAvailable:v7];

  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = [v5 identifier];
    uint64_t v11 = [v9 unifiedContactWithIdentifier:v10 keysToFetch:v6 error:0];

    id v5 = (id)v11;
LABEL_4:
    id v5 = v5;
    uint64_t v12 = v5;
    goto LABEL_6;
  }
  uint64_t v12 = 0;
LABEL_6:

  return v12;
}

+ (void)markMeContactInPeople:(id)a3 usingStore:(id)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v24[0] = *MEMORY[0x263EFDFE0];
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  int v8 = [v6 _crossPlatformUnifiedMeContactWithKeysToFetch:v7 error:0];

  if (v8)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v18 = v5;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v15 = [v14 internalGUID];
          uint64_t v16 = [v8 identifier];
          int v17 = [v15 isEqualToString:v16];

          if (v17)
          {
            [v14 setMe:MEMORY[0x263EFFA88]];
            goto LABEL_12;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    id v5 = v18;
  }
}

+ (id)keysFromPerson:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  id v5 = [v3 firstName];

  if (v5) {
    [v4 addObject:*MEMORY[0x263EFDFC8]];
  }
  id v6 = [v3 lastName];

  if (v6) {
    [v4 addObject:*MEMORY[0x263EFDFB8]];
  }
  id v7 = [v3 middleName];

  if (v7) {
    [v4 addObject:*MEMORY[0x263EFE038]];
  }
  int v8 = [v3 nickName];

  if (v8) {
    [v4 addObject:*MEMORY[0x263EFE050]];
  }
  id v9 = [v3 prefix];

  if (v9) {
    [v4 addObject:*MEMORY[0x263EFE040]];
  }
  uint64_t v10 = [v3 suffix];

  if (v10) {
    [v4 addObject:*MEMORY[0x263EFE048]];
  }
  uint64_t v11 = [v3 company];

  if (v11) {
    [v4 addObject:*MEMORY[0x263EFE068]];
  }
  uint64_t v12 = [v3 birthday];

  if (v12) {
    [v4 addObject:*MEMORY[0x263EFDF48]];
  }
  uint64_t v13 = [v3 phonemeData];

  if (v13) {
    [v4 addObject:*MEMORY[0x263EFE078]];
  }
  id v14 = [v3 addresses];

  if (v14) {
    [v4 addObject:*MEMORY[0x263EFE0A0]];
  }
  uint64_t v15 = [v3 emails];

  if (v15) {
    [v4 addObject:*MEMORY[0x263EFDF80]];
  }
  uint64_t v16 = [v3 phones];

  if (v16) {
    [v4 addObject:*MEMORY[0x263EFE070]];
  }
  int v17 = [v3 relatedNames];

  if (v17) {
    [v4 addObject:*MEMORY[0x263EFE0F8]];
  }

  return v4;
}

+ (id)addressesFromPerson:(id)a3
{
  id v3 = [a3 addresses];
  id v4 = [v3 mapUsingBlock:&__block_literal_global_36];

  return v4;
}

id __45__CNAssistantConversion_addressesFromPerson___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  id v4 = [v2 street];
  [v3 setStreet:v4];

  id v5 = [v2 city];
  [v3 setCity:v5];

  id v6 = [v2 stateCode];
  [v3 setState:v6];

  id v7 = [v2 postalCode];
  [v3 setPostalCode:v7];

  int v8 = [v2 countryCode];
  [v3 setISOCountryCode:v8];

  id v9 = (void *)MEMORY[0x263EFEAD0];
  uint64_t v10 = [v2 label];

  uint64_t v11 = [v9 labeledValueWithLabel:v10 value:v3];

  return v11;
}

+ (id)emailAddressesFromPerson:(id)a3
{
  id v3 = [a3 emails];
  id v4 = [v3 mapUsingBlock:&__block_literal_global_41];

  return v4;
}

id __50__CNAssistantConversion_emailAddressesFromPerson___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263EFEAD0];
  id v3 = a2;
  id v4 = [v3 label];
  id v5 = [v3 emailAddress];

  id v6 = [v2 labeledValueWithLabel:v4 value:v5];

  return v6;
}

+ (id)phoneNumbersFromPerson:(id)a3
{
  id v3 = [a3 phones];
  id v4 = [v3 mapUsingBlock:&__block_literal_global_44];

  return v4;
}

id __48__CNAssistantConversion_phoneNumbersFromPerson___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263EFEB28];
  id v3 = a2;
  id v4 = [v3 number];
  id v5 = [v2 phoneNumberWithStringValue:v4];

  id v6 = (void *)MEMORY[0x263EFEAD0];
  id v7 = [v3 label];

  int v8 = [v6 labeledValueWithLabel:v7 value:v5];

  return v8;
}

+ (id)relationsFromPerson:(id)a3
{
  id v3 = [a3 relatedNames];
  id v4 = [v3 mapUsingBlock:&__block_literal_global_48];

  return v4;
}

id __45__CNAssistantConversion_relationsFromPerson___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263EFEA50];
  id v3 = a2;
  id v4 = [v3 name];
  id v5 = [v2 contactRelationWithName:v4];

  id v6 = (void *)MEMORY[0x263EFEAD0];
  id v7 = [v3 label];

  int v8 = [v6 labeledValueWithLabel:v7 value:v5];

  return v8;
}

+ (void)addFieldsFromPerson:(id)a3 toContactWithIdentifier:(id)a4 usingStore:(id)a5 saveRequest:(id)a6
{
  v41[9] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = [a1 keysFromPerson:v10];
  uint64_t v15 = *MEMORY[0x263EFDF80];
  v41[0] = *MEMORY[0x263EFE070];
  v41[1] = v15;
  uint64_t v16 = *MEMORY[0x263EFE150];
  v41[2] = *MEMORY[0x263EFDF68];
  v41[3] = v16;
  uint64_t v17 = *MEMORY[0x263EFE0F8];
  v41[4] = *MEMORY[0x263EFE010];
  v41[5] = v17;
  uint64_t v18 = *MEMORY[0x263EFE0A0];
  v41[6] = *MEMORY[0x263EFE110];
  v41[7] = v18;
  v41[8] = *MEMORY[0x263EFDF50];
  long long v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:9];
  long long v20 = [v14 arrayByAddingObjectsFromArray:v19];

  id v40 = 0;
  long long v21 = [v12 contactWithIdentifier:v13 keysToFetch:v20 error:&v40];

  id v22 = v40;
  v23 = (void *)[v21 mutableCopy];

  if (v23)
  {
    int v24 = [v10 addresses];

    if (v24)
    {
      id v25 = [a1 addressesFromPerson:v10];
      int v26 = [v23 postalAddresses];
      v27 = [v26 arrayByAddingObjectsFromArray:v25];
      [v23 setPostalAddresses:v27];
    }
    int v28 = [v10 emails];

    if (v28)
    {
      id v29 = [a1 emailAddressesFromPerson:v10];
      v30 = [v23 emailAddresses];
      id v31 = [v30 arrayByAddingObjectsFromArray:v29];
      [v23 setEmailAddresses:v31];
    }
    id v32 = [v10 phones];

    if (v32)
    {
      id v33 = [a1 phoneNumbersFromPerson:v10];
      id v34 = [v23 phoneNumbers];
      id v35 = [v34 arrayByAddingObjectsFromArray:v33];
      [v23 setPhoneNumbers:v35];
    }
    id v36 = [v10 relatedNames];

    if (v36)
    {
      long long v37 = [a1 relationsFromPerson:v10];
      long long v38 = [v23 contactRelations];
      long long v39 = [v38 arrayByAddingObjectsFromArray:v37];
      [v23 setContactRelations:v39];
    }
    [v11 updateContact:v23];
  }
  else
  {
    _AFServiceLog();
  }
}

+ (void)setFieldsFromPerson:(id)a3 toContactWithIdentifier:(id)a4 usingStore:(id)a5 saveRequest:(id)a6
{
  v53[9] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = [a1 keysFromPerson:v10];
  uint64_t v15 = *MEMORY[0x263EFDF80];
  v53[0] = *MEMORY[0x263EFE070];
  v53[1] = v15;
  uint64_t v16 = *MEMORY[0x263EFE150];
  v53[2] = *MEMORY[0x263EFDF68];
  v53[3] = v16;
  uint64_t v17 = *MEMORY[0x263EFE0F8];
  v53[4] = *MEMORY[0x263EFE010];
  v53[5] = v17;
  uint64_t v18 = *MEMORY[0x263EFE0A0];
  v53[6] = *MEMORY[0x263EFE110];
  v53[7] = v18;
  v53[8] = *MEMORY[0x263EFDF50];
  long long v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:9];
  long long v20 = [v14 arrayByAddingObjectsFromArray:v19];

  id v52 = 0;
  long long v21 = [v12 contactWithIdentifier:v13 keysToFetch:v20 error:&v52];

  id v22 = v52;
  v23 = (void *)[v21 mutableCopy];

  if (v23)
  {
    int v24 = [v10 firstName];

    if (v24)
    {
      id v25 = [v10 firstName];
      [v23 setGivenName:v25];
    }
    int v26 = [v10 lastName];

    if (v26)
    {
      v27 = [v10 lastName];
      [v23 setFamilyName:v27];
    }
    int v28 = [v10 middleName];

    if (v28)
    {
      id v29 = [v10 middleName];
      [v23 setMiddleName:v29];
    }
    v30 = [v10 nickName];

    if (v30)
    {
      id v31 = [v10 nickName];
      [v23 setNickname:v31];
    }
    id v32 = [v10 prefix];

    if (v32)
    {
      id v33 = [v10 prefix];
      [v23 setNamePrefix:v33];
    }
    id v34 = [v10 suffix];

    if (v34)
    {
      id v35 = [v10 suffix];
      [v23 setNameSuffix:v35];
    }
    id v36 = [v10 company];

    if (v36)
    {
      long long v37 = [v10 company];
      [v23 setOrganizationName:v37];
    }
    long long v38 = [v10 birthday];

    if (v38)
    {
      long long v39 = [MEMORY[0x263EFF8F0] currentCalendar];
      id v40 = [v10 birthday];
      uint64_t v41 = [v39 components:28 fromDate:v40];

      [v23 setBirthday:v41];
    }
    v42 = [v10 phonemeData];

    if (v42)
    {
      v43 = [v10 phonemeData];
      [v23 setPhonemeData:v43];
    }
    id v44 = [v10 addresses];

    if (v44)
    {
      id v45 = +[CNAssistantConversion addressesFromPerson:v10];
      [v23 setPostalAddresses:v45];
    }
    id v46 = [v10 emails];

    if (v46)
    {
      long long v47 = +[CNAssistantConversion emailAddressesFromPerson:v10];
      [v23 setEmailAddresses:v47];
    }
    long long v48 = [v10 phones];

    if (v48)
    {
      long long v49 = +[CNAssistantConversion phoneNumbersFromPerson:v10];
      [v23 setPhoneNumbers:v49];
    }
    long long v50 = [v10 relatedNames];

    if (v50)
    {
      v51 = +[CNAssistantConversion relationsFromPerson:v10];
      [v23 setContactRelations:v51];
    }
    [v11 updateContact:v23];
  }
  else
  {
    _AFServiceLog();
  }
}

+ (void)removeFieldsFromPerson:(id)a3 toContactWithIdentifier:(id)a4 usingStore:(id)a5 saveRequest:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = [a1 keysFromPerson:v10];
  id v19 = 0;
  uint64_t v15 = [v12 contactWithIdentifier:v13 keysToFetch:v14 error:&v19];

  id v16 = v19;
  uint64_t v17 = (void *)[v15 mutableCopy];

  if (v10)
  {
    uint64_t v18 = [v10 phonemeData];

    if (v18) {
      [v17 setPhonemeData:0];
    }
    [v11 updateContact:v17];
  }
  else
  {
    _AFServiceLog();
  }
}

+ (void)applyUpdate:(id)a3 toContactWithIdentifier:(id)a4 usingStore:(id)a5 saveRequest:(id)a6
{
  id v21 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v21 addFields];

  if (v13)
  {
    id v14 = [v21 addFields];
    [a1 addFieldsFromPerson:v14 toContactWithIdentifier:v10 usingStore:v11 saveRequest:v12];
  }
  uint64_t v15 = [v21 setFields];

  if (v15)
  {
    id v16 = [v21 setFields];
    [a1 setFieldsFromPerson:v16 toContactWithIdentifier:v10 usingStore:v11 saveRequest:v12];

    uint64_t v17 = [v21 setFields];
    uint64_t v18 = [v17 me];
    [v18 BOOLValue];
  }
  id v19 = [v21 removeFields];

  if (v19)
  {
    long long v20 = [v21 removeFields];
    [a1 removeFieldsFromPerson:v20 toContactWithIdentifier:v10 usingStore:v11 saveRequest:v12];
  }
}

@end