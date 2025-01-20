@interface CRRecentContact(CloudRecentsExtensions)
- (id)_contactContext;
- (id)contactKey;
- (id)contactWithKeysToFetch:()CloudRecentsExtensions;
- (id)contactWithKeysToFetch:()CloudRecentsExtensions contactStore:;
- (id)existingContactWithKeysToFetch:()CloudRecentsExtensions;
- (id)existingContactWithKeysToFetch:()CloudRecentsExtensions contactStore:;
- (void)_setContactContext:()CloudRecentsExtensions;
@end

@implementation CRRecentContact(CloudRecentsExtensions)

- (id)_contactContext
{
  return objc_getAssociatedObject(a1, "_CRContactContextKey");
}

- (void)_setContactContext:()CloudRecentsExtensions
{
}

- (id)contactKey
{
  v1 = [a1 kind];
  v2 = CNAutocompleteContactKeyForRecentsKind(v1);

  return v2;
}

- (id)existingContactWithKeysToFetch:()CloudRecentsExtensions
{
  id v4 = a3;
  v5 = CNAutocompleteSharedContactStore();
  v6 = [a1 existingContactWithKeysToFetch:v4 contactStore:v5];

  return v6;
}

- (id)existingContactWithKeysToFetch:()CloudRecentsExtensions contactStore:
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 _contactContext];
  v9 = [(_CNAUICRRecentContactCNContext *)v8 existingContact];

  if (v9)
  {
    v10 = [(_CNAUICRRecentContactCNContext *)v8 existingContact];
    char v11 = [v10 areKeysAvailable:v6];

    if (v11) {
      goto LABEL_12;
    }
    v12 = [(_CNAUICRRecentContactCNContext *)v8 existingContact];
    v13 = [v12 availableKeyDescriptor];
    v32 = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];

    if (v6)
    {
      uint64_t v15 = [v14 arrayByAddingObjectsFromArray:v6];

      v14 = (void *)v15;
    }
    v16 = (void *)MEMORY[0x1E4F1B8F8];
    v17 = [(_CNAUICRRecentContactCNContext *)v8 existingContact];
    v18 = [v17 identifier];
    v31 = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    v20 = [v16 predicateForContactsWithIdentifiers:v19];
    v21 = CNAutocompleteFetchNonUnifiedContactsForPredicate(v7, v20, v14, 0);

    v22 = [v21 firstObject];
    [(_CNAUICRRecentContactCNContext *)v8 setExistingContact:v22];
  }
  else
  {
    v23 = [MEMORY[0x1E4F5A350] sharedInstance];
    int v24 = [v23 isAccessGranted];

    if (!v24) {
      goto LABEL_12;
    }
    v25 = [a1 address];
    v33[0] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    v27 = [a1 contactKey];
    v28 = [a1 displayName];
    v14 = CNAutocompleteCopyClosestMatchingExistingContactUsingAddressesAndDisplayName(v7, v26, v27, v28, v6);

    if (v14)
    {
      if (!v8)
      {
        v8 = objc_alloc_init(_CNAUICRRecentContactCNContext);
        [a1 _setContactContext:v8];
      }
      [(_CNAUICRRecentContactCNContext *)v8 setExistingContact:v14];
    }
  }

LABEL_12:
  v29 = [(_CNAUICRRecentContactCNContext *)v8 existingContact];

  return v29;
}

- (id)contactWithKeysToFetch:()CloudRecentsExtensions
{
  id v4 = a3;
  v5 = CNAutocompleteSharedContactStore();
  id v6 = [a1 contactWithKeysToFetch:v4 contactStore:v5];

  return v6;
}

- (id)contactWithKeysToFetch:()CloudRecentsExtensions contactStore:
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 _contactContext];
  uint64_t v9 = [v8 interimContact];
  if (v9
    || ([a1 existingContactWithKeysToFetch:v6 contactStore:v7],
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = (id)v9;
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    v12 = [a1 kind];
    int v13 = [v12 isEqualToString:*MEMORY[0x1E4F5CC80]];

    v14 = [a1 displayName];
    uint64_t v15 = v14;
    if (v13)
    {
      [v10 setGivenName:v14];
    }
    else
    {
      v16 = objc_msgSend(v14, "ea_personNameComponents");

      v17 = [v16 namePrefix];
      [v10 setNamePrefix:v17];

      v18 = [v16 givenName];
      [v10 setGivenName:v18];

      v19 = [v16 middleName];
      [v10 setMiddleName:v19];

      v20 = [v16 familyName];
      [v10 setFamilyName:v20];

      v21 = [v16 nameSuffix];
      [v10 setNameSuffix:v21];

      uint64_t v15 = v16;
    }

    v22 = [a1 contactKey];
    if ([v22 isEqualToString:*MEMORY[0x1E4F1ADC8]])
    {
      v23 = [a1 address];
    }
    else if ([v22 isEqualToString:*MEMORY[0x1E4F1AEE0]])
    {
      int v24 = (void *)MEMORY[0x1E4F1BA70];
      v25 = [a1 address];
      v23 = [v24 phoneNumberWithStringValue:v25];
    }
    else
    {
      v23 = 0;
    }
    v26 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:*MEMORY[0x1E4F1B700] value:v23];
    v29[0] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    [v10 setValue:v27 forKey:v22];

    v28 = objc_alloc_init(_CNAUICRRecentContactCNContext);
    [(_CNAUICRRecentContactCNContext *)v28 setInterimContact:v10];
    [a1 _setContactContext:v28];

    v8 = v28;
  }

  return v10;
}

@end