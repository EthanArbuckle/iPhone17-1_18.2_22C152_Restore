@interface ABSPublicABCNCompatibility
+ (BOOL)overwritePublicABPerson:(void *)a3 withContact:(id)a4;
+ (BOOL)updateNewPublicABPerson:(void *)a3 withSavedContact:(id)a4 inAddressBook:(void *)a5;
+ (id)contactFromPublicABPerson:(void *)a3 keysToFetch:(id)a4;
+ (id)contactFromPublicABPerson:(void *)a3 keysToFetch:(id)a4 mutable:(BOOL)a5;
+ (id)contactPropertyKeyFromPublicABPropertyID:(int)a3;
+ (id)contactStoreForPublicAddressBook:(void *)a3;
+ (id)createAddressBookForConversion;
+ (id)labeledValueFromPublicMultiValueIdentifier:(int)a3 contact:(id)a4 key:(id)a5 contactStore:(id)a6;
+ (int)publicABPropertyIDFromContactPropertyKey:(id)a3;
+ (int)publicMultiValueIdentifierFromLabeledValue:(id)a3 contactStore:(id)a4;
+ (void)publicABPersonFromContact:(id)a3 contactStore:(id)a4 publicAddressBook:(const void *)a5;
@end

@implementation ABSPublicABCNCompatibility

+ (BOOL)updateNewPublicABPerson:(void *)a3 withSavedContact:(id)a4 inAddressBook:(void *)a5
{
  id v7 = a4;
  int v8 = [v7 hasBeenPersisted];
  if (v8)
  {
    v9 = a3;
    [v9 replaceRecordStorageWithCNObject:v7];
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized)
    {
      v10 = a5;
      v11 = [v10 contacts];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __85__ABSPublicABCNCompatibility_updateNewPublicABPerson_withSavedContact_inAddressBook___block_invoke;
      v15[3] = &unk_264224110;
      id v12 = v9;
      id v16 = v12;
      id v13 = (id)[v11 cnImplFetched:v7 creationBlock:v15];

      [v12 setAddressBook:v10];
    }
  }
  return v8;
}

id __85__ABSPublicABCNCompatibility_updateNewPublicABPerson_withSavedContact_inAddressBook___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (BOOL)overwritePublicABPerson:(void *)a3 withContact:(id)a4
{
  id v5 = a4;
  v6 = a3;
  id v7 = [v5 keyVector];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__ABSPublicABCNCompatibility_overwritePublicABPerson_withContact___block_invoke;
  v11[3] = &unk_264223BA8;
  id v12 = v6;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 enumeratePropertiesUsingBlock:v11];

  return 1;
}

uint64_t __66__ABSPublicABCNCompatibility_overwritePublicABPerson_withContact___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [MEMORY[0x263EFE9C8] identifierDescription];
  v4 = v11;
  if (v3 != v11)
  {
    id v5 = [MEMORY[0x263EFE9C8] iOSLegacyIdentifierDescription];

    if (v5 == v11) {
      goto LABEL_6;
    }
    v4 = [*(id *)(a1 + 32) cnImpl];
    v6 = [v11 key];
    int v7 = [v4 isKeyAvailable:v6];

    if (v7)
    {
      id v8 = [v11 CNValueForContact:*(void *)(a1 + 40)];
      id v9 = [v11 valueWithResetIdentifiers:v8];

      [v11 setCNValue:v9 onContact:v4];
    }
  }

LABEL_6:

  return MEMORY[0x270F9A758]();
}

+ (id)contactFromPublicABPerson:(void *)a3 keysToFetch:(id)a4
{
  return (id)[a1 contactFromPublicABPerson:a3 keysToFetch:a4 mutable:0];
}

+ (id)contactFromPublicABPerson:(void *)a3 keysToFetch:(id)a4 mutable:(BOOL)a5
{
  BOOL v5 = a5;
  int v7 = a3;
  id v8 = a4;
  if (([v7 completeCNImplIfNeededWithKeysToFetch:v8] & 1) == 0) {
    NSLog(&cfstr_ErrorWeCanTCon.isa);
  }
  id v9 = [v7 cnImpl];
  v10 = (void *)[v9 copyWithPropertyKeys:v8];

  if (v5)
  {
    uint64_t v11 = [v10 mutableCopy];

    v10 = (void *)v11;
  }

  return v10;
}

+ (id)contactPropertyKeyFromPublicABPropertyID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [MEMORY[0x263EFE9C8] contactPropertiesByABSPropertyID];
  BOOL v5 = [NSNumber numberWithInt:v3];
  v6 = [v4 objectForKeyedSubscript:v5];
  int v7 = [v6 key];

  return v7;
}

+ (int)publicABPropertyIDFromContactPropertyKey:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFE9C8] contactPropertiesByKey];
  BOOL v5 = [v4 objectForKeyedSubscript:v3];

  int v8 = -1;
  if (([v5 absPropertyID:&v8] & 1) == 0) {
    NSLog(&cfstr_UnableToConver.isa, v3);
  }
  int v6 = v8;

  return v6;
}

+ (void)publicABPersonFromContact:(id)a3 contactStore:(id)a4 publicAddressBook:(const void *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5 && *a5)
  {
    id v10 = (id)*a5;
  }
  else
  {
    uint64_t v11 = [a1 createAddressBookForConversion];
    id v10 = v11;
    if (a5)
    {
      id v10 = v11;
      *a5 = v10;
    }
  }
  if (![v8 hasBeenPersisted]
    || ([v8 isUnified] & 1) != 0
    || ABAddressBookGetAuthorizationStatus() != kABAuthorizationStatusAuthorized
    || (objc_msgSend(v10, "personWithRecordID:", objc_msgSend(v8, "iOSLegacyIdentifier")),
        (id v12 = (ABSPerson *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v13 = [ABSPerson alloc];
    v14 = (void *)[v8 mutableCopy];
    id v12 = [(ABSPerson *)v13 initWithMutableContact:v14];
  }
  v15 = v12;
  id v16 = v15;
  if (v15) {
    CFTypeRef v17 = CFAutorelease(v15);
  }
  else {
    CFTypeRef v17 = 0;
  }

  return (void *)v17;
}

+ (int)publicMultiValueIdentifierFromLabeledValue:(id)a3 contactStore:(id)a4
{
  return [a3 iOSLegacyIdentifier];
}

+ (id)labeledValueFromPublicMultiValueIdentifier:(int)a3 contact:(id)a4 key:(id)a5 contactStore:(id)a6
{
  id v8 = (void *)MEMORY[0x263EFE9C8];
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [v8 contactPropertiesByKey];
  id v12 = [v11 objectForKeyedSubscript:v9];

  id v13 = [v12 CNValueForContact:v10];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __98__ABSPublicABCNCompatibility_labeledValueFromPublicMultiValueIdentifier_contact_key_contactStore___block_invoke;
  v17[3] = &__block_descriptor_36_e31_B32__0__CNLabeledValue_8Q16_B24l;
  int v18 = a3;
  v14 = [v13 indexesOfObjectsPassingTest:v17];
  if ([v14 count] == 1)
  {
    v15 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v14, "firstIndex"));
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

BOOL __98__ABSPublicABCNCompatibility_labeledValueFromPublicMultiValueIdentifier_contact_key_contactStore___block_invoke(uint64_t a1, void *a2)
{
  return [a2 iOSLegacyIdentifier] == *(_DWORD *)(a1 + 32);
}

+ (id)createAddressBookForConversion
{
  v2 = [[ABSAddressBook alloc] initWithOptions:0 error:0];

  return v2;
}

+ (id)contactStoreForPublicAddressBook:(void *)a3
{
  return (id)ABAddressBookGetContactStore(a3, a2);
}

@end