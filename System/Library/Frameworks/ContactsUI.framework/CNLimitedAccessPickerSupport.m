@interface CNLimitedAccessPickerSupport
+ (BOOL)isPickerLimitedAccess:(int)a3;
+ (BOOL)isPickerLimitedAccessSummary:(int)a3;
+ (BOOL)isPickerLimitedAccessWithLists:(int)a3;
+ (BOOL)isPickerLimitedAccessWithMultiSelect:(int)a3;
+ (BOOL)shouldLimitedAccessPickerNeedContactsFilter:(int)a3;
+ (BOOL)shouldLimitedAccessPickerSupportSelectAll:(int)a3;
+ (id)allowedIdentifiersForBundleID:(id)a3;
+ (id)appNameForBundleId:(id)a3;
+ (id)contactStoreForBundleId:(id)a3;
+ (id)contactsFromIdentifiers:(id)a3 withBundleId:(id)a4;
+ (void)addContactsToLimitedAccess:(id)a3 forBundleID:(id)a4;
+ (void)removeAllLimitedAccessIdentifiersForBundleID:(id)a3;
@end

@implementation CNLimitedAccessPickerSupport

+ (BOOL)isPickerLimitedAccess:(int)a3
{
  return a3 != 0;
}

+ (id)appNameForBundleId:(id)a3
{
  id v3 = a3;
  id v13 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v13];
  id v9 = v13;
  if (v4)
  {
    id v10 = [v4 localizedName];
  }
  else
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/LimitedAccess/CNLimitedAccessPickerSupport.m", 167, 3, @"Failed to locate app record for: %@, Error: %@", v5, v6, v7, v8, (uint64_t)v3);
    id v10 = v3;
  }
  v11 = v10;

  return v11;
}

+ (id)contactStoreForBundleId:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F5A440];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = [MEMORY[0x1E4F5A448] sharedConnection];
  uint64_t v7 = (void *)[v5 initWithBundleIdentifier:v4 managedProfileConnection:v6];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1B990]);
  id v9 = [MEMORY[0x1E4F1B9A0] currentEnvironment];
  [v8 setEnvironment:v9];

  [v8 setManagedConfiguration:v7];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1B980]) initWithConfiguration:v8];

  return v10;
}

+ (void)removeAllLimitedAccessIdentifiersForBundleID:(id)a3
{
  id v3 = a3;
  id v4 = +[CNLimitedAccessPickerSupport contactStoreForBundleId:v3];
  [v4 purgeLimitedAccessRecordsForBundle:v3];
}

+ (void)addContactsToLimitedAccess:(id)a3 forBundleID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = +[CNLimitedAccessPickerSupport contactStoreForBundleId:v5];
  uint64_t v7 = objc_msgSend(v6, "_cn_map:", *MEMORY[0x1E4F1AFA0]);

  [v8 addLimitedAccessForBundle:v5 contactIdentifiers:v7];
}

+ (id)allowedIdentifiersForBundleID:(id)a3
{
  id v3 = a3;
  id v4 = +[CNLimitedAccessPickerSupport contactStoreForBundleId:v3];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [v4 fetchLimitedAccessContactIdentifiersForBundle:v3];

  uint64_t v7 = [v5 setWithArray:v6];

  return v7;
}

+ (id)contactsFromIdentifiers:(id)a3 withBundleId:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    id v8 = +[CNLimitedAccessPickerSupport contactStoreForBundleId:v6];
    id v9 = objc_alloc(MEMORY[0x1E4F1B908]);
    id v10 = (void *)[v9 initWithKeysToFetch:MEMORY[0x1E4F1CBF0]];
    v11 = [MEMORY[0x1E4F1B8F8] predicateForContactsWithIdentifiers:v5];
    [v10 setPredicate:v11];

    [v10 setUnifyResults:1];
    id v25 = 0;
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __69__CNLimitedAccessPickerSupport_contactsFromIdentifiers_withBundleId___block_invoke;
    v23 = &unk_1E5498C50;
    id v12 = v7;
    id v24 = v12;
    char v13 = [v8 enumerateContactsWithFetchRequest:v10 error:&v25 usingBlock:&v20];
    id v14 = v25;
    if ((v13 & 1) == 0)
    {
      v15 = CNUILogContactList();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_msgSend(v14, "localizedDescription", v20, v21, v22, v23);
        *(_DWORD *)buf = 138412290;
        v27 = v19;
        _os_log_error_impl(&dword_18B625000, v15, OS_LOG_TYPE_ERROR, "Limited Picker fetch error: %@", buf, 0xCu);
      }
    }
    v16 = v24;
    id v17 = v12;
  }
  else
  {
    id v17 = [MEMORY[0x1E4F1C978] array];
  }

  return v17;
}

uint64_t __69__CNLimitedAccessPickerSupport_contactsFromIdentifiers_withBundleId___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (BOOL)shouldLimitedAccessPickerNeedContactsFilter:(int)a3
{
  return (a3 < 7) & (0x64u >> a3);
}

+ (BOOL)shouldLimitedAccessPickerSupportSelectAll:(int)a3
{
  return (a3 > 6) | (0x1Au >> a3) & 1;
}

+ (BOOL)isPickerLimitedAccessSummary:(int)a3
{
  return a3 == 2 || a3 == 5;
}

+ (BOOL)isPickerLimitedAccessWithLists:(int)a3
{
  return (a3 < 7) & (0x5Au >> a3);
}

+ (BOOL)isPickerLimitedAccessWithMultiSelect:(int)a3
{
  return (a3 < 7) & (0x5Eu >> a3);
}

@end