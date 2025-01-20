@interface CNContactStore
+ (BOOL)eraseAllDataAtLocationWithName:(id)a3 error:(id *)a4;
+ (BOOL)eraseAllDataAtURL:(id)a3 error:(id *)a4;
+ (BOOL)isAccessLimitedForEntityType:(int64_t)a3;
+ (BOOL)isAccessRestrictedForEntityType:(int64_t)a3;
+ (BOOL)isSharedNamePhotoEnabled;
+ (BOOL)isXPCDataMapperStoreForFavorites:(id)a3;
+ (BOOL)isXPCDataMapperStoreForSpotlight:(id)a3;
+ (CNAuthorizationStatus)authorizationStatusForEntityType:(CNEntityType)entityType;
+ (CNContactStore)storeWithDelegateInfo:(id)a3;
+ (CNContactStore)storeWithEnvironment:(id)a3 options:(unint64_t)a4;
+ (CNContactStore)storeWithOptions:(unint64_t)a3;
+ (Class)storeClassWithIdentifier:(id)a3;
+ (id)IsSpotlightIndexingSupported;
+ (id)_contactStoreForPublicAddressBook:(void *)a3;
+ (id)authorizationForCurrentProcess;
+ (id)contactIdentifierFromInternalIdentifier:(id)a3;
+ (id)internalIdentifierFromContactIdentifier:(id)a3;
+ (id)logSpotlight;
+ (id)standardLabelsForPropertyWithKey:(id)a3;
+ (id)standardLabelsForPropertyWithKey:(id)a3 options:(unint64_t)a4;
+ (id)storeForFamilyMember:(id)a3;
+ (id)storeIdentifier;
+ (id)storeIdentifierFromContactIdentifier:(id)a3;
+ (id)storeInfoClasses;
+ (int64_t)authorizationStatusForEntityType:(int64_t)a3 assumedIdentity:(id)a4;
+ (void)initialize;
- (BOOL)analyzeDatabaseWithError:(id *)a3;
- (BOOL)clearChangeHistoryForClientIdentifier:(id)a3 toChangeAnchor:(id)a4 error:(id *)a5;
- (BOOL)enumerateContactsAndMatchInfoWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)enumerateContactsWithFetchRequest:(CNContactFetchRequest *)fetchRequest error:(NSError *)error usingBlock:(void *)block;
- (BOOL)enumerateNonUnifiedContactsWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)executeChangeHistoryClearRequest:(id)a3 error:(id *)a4;
- (BOOL)executeSaveRequest:(CNSaveRequest *)saveRequest error:(NSError *)error;
- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6;
- (BOOL)hasAccountFirstSyncCompleted;
- (BOOL)hasGroups;
- (BOOL)hasMultipleGroupsOrAccounts;
- (BOOL)isSpotlightIndexingSupported;
- (BOOL)moveContacts:(id)a3 fromContainer:(id)a4 toContainer:(id)a5 error:(id *)a6;
- (BOOL)registerChangeHistoryClientIdentifier:(id)a3 error:(id *)a4;
- (BOOL)registerChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5;
- (BOOL)resetSortDataIfNeededWithError:(id *)a3;
- (BOOL)setBestMeIfNeededForGivenName:(id)a3 familyName:(id)a4 email:(id)a5 error:(id *)a6;
- (BOOL)setDefaultAccountIdentifier:(id)a3 error:(id *)a4;
- (BOOL)setDefaultContainer:(id)a3 forAccount:(id)a4 error:(id *)a5;
- (BOOL)setMeContact:(id)a3 error:(id *)a4;
- (BOOL)setMeContact:(id)a3 forContainer:(id)a4 error:(id *)a5;
- (BOOL)shouldAnalyzeDatabaseWithError:(id *)a3;
- (BOOL)supportsMatchingDictionaries;
- (BOOL)supportsSaveRequest:(id)a3;
- (BOOL)unregisterChangeHistoryClientIdentifier:(id)a3 error:(id *)a4;
- (BOOL)unregisterChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5;
- (BOOL)verifyChangeHistoryForClientIdentifier:(id)a3 error:(id *)a4;
- (CNContact)unifiedContactWithIdentifier:(NSString *)identifier keysToFetch:(NSArray *)keys error:(NSError *)error;
- (CNContact)unifiedMeContactWithKeysToFetch:(NSArray *)keys error:(NSError *)error;
- (CNContactStore)init;
- (CNContactStore)initWithConfiguration:(id)a3;
- (CNContactStore)initWithEnvironment:(id)a3;
- (CNContactStore)initWithEnvironment:(id)a3 options:(unint64_t)a4;
- (CNContactStore)initWithEnvironment:(id)a3 options:(unint64_t)a4 managedConfiguration:(id)a5;
- (CNFetchResult)enumeratorForChangeHistoryFetchRequest:(CNChangeHistoryFetchRequest *)request error:(NSError *)error;
- (CNFetchResult)enumeratorForContactFetchRequest:(CNContactFetchRequest *)request error:(NSError *)error;
- (CNResult)currentHistoryAnchor;
- (CNiOSAddressBook)addressBook;
- (CNiOSAddressBookDataMapper)iOSMapper;
- (NSArray)containersMatchingPredicate:(NSPredicate *)predicate error:(NSError *)error;
- (NSArray)groupsMatchingPredicate:(NSPredicate *)predicate error:(NSError *)error;
- (NSArray)unifiedContactsMatchingPredicate:(NSPredicate *)predicate keysToFetch:(NSArray *)keys error:(NSError *)error;
- (NSData)currentHistoryToken;
- (NSString)defaultContainerIdentifier;
- (id)_contactFromPersonID:(int)a3 keysToFetch:(id)a4;
- (id)_contactFromPublicABPerson:(void *)a3 keysToFetch:(id)a4;
- (id)_crossPlatformUnifiedMeContactWithKeysToFetch:(id)a3 error:(id *)a4;
- (id)_executeFetchRequestsWithInfos:(id)a3 unifyResults:(BOOL)a4 keysToFetch:(id)a5 error:(id *)a6;
- (id)_fetchRequestInfosForEmailOrPhoneForContact:(id)a3;
- (id)_ios_meContactIdentifierWithError:(id *)a3;
- (id)_ios_meContactWithKeysToFetch:(id)a3 error:(id *)a4;
- (id)_labeledValueFromPublicMultiValueIdentifier:(int)a3 contact:(id)a4 key:(id)a5;
- (id)_unifiedMeContactWithKeysToFetch:(uint64_t)a3 error:;
- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)authorizedKeysForContactKeys:(id)a3;
- (id)changeHistoryWithFetchRequest:(id)a3 error:(id *)a4;
- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4;
- (id)contactFromPerson:(void *)a3;
- (id)contactFromPerson:(void *)a3 keysToFetch:(id)a4;
- (id)contactFromPerson:(void *)a3 keysToFetch:(id)a4 mutable:(BOOL)a5;
- (id)contactFromPerson:(void *)a3 mutable:(BOOL)a4;
- (id)contactFromPersonID:(int)a3;
- (id)contactIdentifierFromPersonID:(int)a3;
- (id)contactIdentifierWithMatchingDictionary:(id)a3;
- (id)contactWithMatchingDictionary:(id)a3 keysToFetch:(id)a4;
- (id)contactWithUserActivityUserInfo:(id)a3 keysToFetch:(id)a4;
- (id)contactsMatchingPropertiesOfContact:(id)a3 unifyResults:(BOOL)a4 keysToFetch:(id)a5 error:(id *)a6;
- (id)countForFetchRequest:(id)a3 error:(id *)a4;
- (id)descriptorForRequiredKeysForMatchingDictionary;
- (id)descriptorForRequiredKeysForUserActivityUserInfo;
- (id)executeFetchRequest:(id)a3 completion:(id)a4;
- (id)executeFetchRequest:(id)a3 error:(id *)a4;
- (id)executeFetchRequest:(id)a3 progressiveResults:(id)a4 completion:(id)a5;
- (id)executeFetchRequestAndCountResults:(void *)a1;
- (id)fetchLimitedAccessContactIdentifiersForBundle:(id)a3;
- (id)getLimitedAccessContactsCountForBundle:(id)a3;
- (id)getLimitedAccessLastSyncSequenceNumber:(id *)a3;
- (id)getWatchLimitedAccessSyncDataStartingAtSequenceNumber:(int64_t)a3;
- (id)groupWithIdentifier:(id)a3 error:(id *)a4;
- (id)identifierWithError:(id *)a3;
- (id)individualContactCountWithError:(id *)a3;
- (id)labeledValueFromMultiValueIdentifier:(int)a3 contact:(id)a4 key:(id)a5;
- (id)latestConsumedChangeHistoryAnchorForClientIdentifier:(id)a3 error:(id *)a4;
- (id)mainContactStore;
- (id)matchingDictionaryForContact:(id)a3;
- (id)meContactIdentifiers:(id *)a3;
- (id)membersOfGroupWithIdentifier:(id)a3 keysToFetch:(id)a4 error:(id *)a5;
- (id)originForSuggestion:(id)a3 error:(id *)a4;
- (id)policyForContainerWithIdentifier:(id)a3 error:(id *)a4;
- (id)policyWithDescription:(id)a3 error:(id *)a4;
- (id)populateSyncTableForLimitedAccessAboveSequenceNumber:(id)a3;
- (id)requestAccessForEntityType:(int64_t)a3;
- (id)sectionListOffsetsForSortOrder:(int64_t)a3 error:(id *)a4;
- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4;
- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4;
- (id)unifiedContactCountWithError:(id *)a3;
- (id)unifiedMeContactMatchingEmailAddress:(id)a3 keysToFetch:(id)a4 error:(id *)a5;
- (id)unifiedMeContactMatchingEmailAddresses:(id)a3 keysToFetch:(id)a4 error:(id *)a5;
- (id)usedLabelsForPropertyWithKey:(id)a3 error:(id *)a4;
- (id)userActivityUserInfoForContact:(id)a3;
- (id)verifyIndexWithError:(id *)a3;
- (int)_publicMultiValueIdentifierFromLabeledValue:(id)a3;
- (int)multiValueIdentifierFromLabeledValue:(id)a3;
- (int)saveSequenceCount;
- (void)_publicABPersonFromContact:(id)a3 publicAddressBook:(const void *)a4;
- (void)personFromContact:(id)a3;
- (void)pool_enumerateContactsWithFetchRequest:(void *)a3 error:(void *)a4 usingBlock:;
- (void)reindexSearchableItemsWithIdentifiers:(id)a3;
- (void)requestAccessForEntityType:(CNEntityType)entityType completionHandler:(void *)completionHandler;
- (void)requestAuthorization:(int64_t)a3 entityType:(int64_t)a4 completionHandler:(id)a5;
@end

@implementation CNContactStore

uint64_t __99__CNContactStore_ElaborateSearches___executeFetchRequestsWithInfos_unifyResults_keysToFetch_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

- (void).cxx_destruct
{
}

+ (id)storeIdentifierFromContactIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"://"];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v5 = [v3 substringToIndex:v4];
  }

  return v5;
}

+ (id)internalIdentifierFromContactIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"://"];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = v3;
  }
  else
  {
    id v6 = [v3 substringFromIndex:v4 + v5];
  }
  v7 = v6;

  return v7;
}

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_18);
  }
}

void __65__CNContactStore_unifiedContactWithIdentifier_keysToFetch_error___block_invoke(uint64_t a1)
{
  +[CNAPITriageLogger setThreadEntryPoint:0];
  v2 = +[CNAPITriageLogger os_log];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", "", v5, 2u);
  }
}

void __44__CNContactStore_executeFetchRequest_error___block_invoke(uint64_t a1)
{
  +[CNAPITriageLogger setThreadEntryPoint:0];
  v2 = +[CNAPITriageLogger os_log];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", "", v5, 2u);
  }
}

- (id)executeFetchRequest:(id)a3 error:(id *)a4
{
  id v7 = a3;
  +[CNAPITriageLogger setThreadEntryPoint:a2];
  v8 = +[CNAPITriageLogger os_log];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = +[CNAPITriageLogger os_log];
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Fetching", "", buf, 2u);
  }

  id v12 = objc_alloc_init(MEMORY[0x1E4F5A508]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __44__CNContactStore_executeFetchRequest_error___block_invoke;
  v27[3] = &__block_descriptor_40_e5_v8__0l;
  v27[4] = v9;
  v13 = (void *)[v27 copy];
  v14 = self;
  v15 = _Block_copy(v14);
  [v12 push:v15];

  objc_opt_class();
  id v16 = v7;
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  if (v18) {
    [v18 setResultType:0];
  }
  v19 = [[CNContactStoreFetchExecutor alloc] initWithContactStore:self];
  id v20 = [(CNContactStoreFetchExecutor *)v19 executeFetchRequest:v16];
  v21 = [v20 value];

  if (v21)
  {
    v22 = [v20 value];
  }
  else
  {
    v23 = [v20 error];
    v24 = v23;
    if (a4) {
      *a4 = v23;
    }

    v22 = 0;
  }

  [v12 popAllWithHandler:&__block_literal_global_89_0];
  id v25 = self;

  return v22;
}

+ (id)storeIdentifier
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    os_signpost_id_t v4 = 0;
  }
  else
  {
    os_signpost_id_t v4 = NSStringFromClass((Class)a1);
  }

  return v4;
}

- (id)_unifiedMeContactWithKeysToFetch:(uint64_t)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = [a1 meContactIdentifiers:a3];
    id v7 = [v6 firstObject];

    if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
    {
      v8 = 0;
    }
    else
    {
      v8 = [a1 unifiedContactWithIdentifier:v7 keysToFetch:v5 error:a3];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __81__CNContactStore_ElaborateSearches___fetchRequestInfosForEmailOrPhoneForContact___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (([v7 isSuggested] & 1) == 0)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    os_signpost_id_t v4 = [v7 value];
    id v5 = +[CNContact predicateForContactsMatchingEmailAddress:v4];
    id v6 = +[_CNContactMatchingFetchRequestInfos fetchRequestInfoForPredicate:v5 properties:0];
    [v3 addObject:v6];
  }
}

void __81__CNContactStore_ElaborateSearches___fetchRequestInfosForEmailOrPhoneForContact___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (([v7 isSuggested] & 1) == 0)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    os_signpost_id_t v4 = [v7 value];
    id v5 = +[CNContact predicateForContactsMatchingPhoneNumber:v4];
    id v6 = +[_CNContactMatchingFetchRequestInfos fetchRequestInfoForPredicate:v5 properties:0];
    [v3 addObject:v6];
  }
}

void __74__CNContactStore_pool_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) mutableObjects])
  {
    id v7 = [v6 selfOrMutableCopy];
  }
  else
  {
    id v7 = 0;
  }
  v8 = [*(id *)(a1 + 40) logger];
  [v8 request:*(void *)(a1 + 32) containsContact:v6];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__CNContactStore_pool_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke_2;
  v12[3] = &unk_1E56B5838;
  id v13 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  id v9 = v7;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  v17 = a4;
  __74__CNContactStore_pool_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke_2((uint64_t)v12);
  if (*a4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    v11 = [*(id *)(a1 + 40) logger];
    [v11 clientStoppedEnumerationForRequest:*(void *)(a1 + 32)];
  }
}

void __74__CNContactStore_pool_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) timeProvider];
  [v2 timestamp];
  double v4 = v3;

  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __74__CNContactStore_pool_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke_3;
  id v13 = &unk_1E56B5810;
  id v16 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 64);
  id v15 = v5;
  uint64_t v17 = v6;
  __74__CNContactStore_pool_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke_3(&v10);
  id v7 = objc_msgSend(*(id *)(a1 + 32), "timeProvider", v10, v11);
  [v7 timestamp];
  double v9 = v8;

  [*(id *)(a1 + 32) addClientCalloutTime:v9 - v4];
}

uint64_t __74__CNContactStore_pool_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = a1[4];
  if (!v3) {
    uint64_t v3 = a1[5];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, v3, a1[7]);
}

- (void)pool_enumerateContactsWithFetchRequest:(void *)a3 error:(void *)a4 usingBlock:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    double v9 = [[CNAPITriageSession alloc] initWithRequest:v7];
    [(CNAPITriageSession *)v9 open];
    if ([v7 shouldFailIfAccountNotYetSynced]
      && ([a1 hasAccountFirstSyncCompleted] & 1) == 0)
    {
      id v14 = +[CNErrorFactory errorWithCode:1007];
      [(CNAPITriageSession *)v9 closeWithError:v14];
      if (a3) {
        *a3 = v14;
      }

      a1 = 0;
      goto LABEL_14;
    }
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    id v21 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__CNContactStore_pool_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke;
    v16[3] = &unk_1E56B5860;
    id v10 = v7;
    id v17 = v10;
    uint64_t v11 = v9;
    id v18 = v11;
    id v19 = v8;
    id v20 = &v22;
    a1 = (void *)[a1 enumerateContactsAndMatchInfoWithFetchRequest:v10 error:&v21 usingBlock:v16];
    id v12 = v21;
    if (*((unsigned char *)v23 + 24))
    {
      if (a1)
      {
LABEL_6:
        [(CNAPITriageSession *)v11 close];
LABEL_10:

        _Block_object_dispose(&v22, 8);
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      id v13 = [(CNAPITriageSession *)v11 logger];
      [v13 didReturnAllResultsForContactFetchRequest:v10];

      if (a1) {
        goto LABEL_6;
      }
    }
    [(CNAPITriageSession *)v11 closeWithError:v12];
    if (a3) {
      *a3 = v12;
    }
    goto LABEL_10;
  }
LABEL_15:

  return a1;
}

- (CNContact)unifiedContactWithIdentifier:(NSString *)identifier keysToFetch:(NSArray *)keys error:(NSError *)error
{
  v52[1] = *MEMORY[0x1E4F143B8];
  double v9 = identifier;
  id v10 = keys;
  +[CNAPITriageLogger setThreadEntryPoint:a2];
  uint64_t v11 = +[CNAPITriageLogger os_log];
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  id v13 = +[CNAPITriageLogger os_log];
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Fetching", "", buf, 2u);
  }

  id v15 = objc_alloc_init(MEMORY[0x1E4F5A508]);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __65__CNContactStore_unifiedContactWithIdentifier_keysToFetch_error___block_invoke;
  v50[3] = &__block_descriptor_40_e5_v8__0l;
  v50[4] = v12;
  id v16 = (void *)[v50 copy];
  id v17 = self;
  id v18 = _Block_copy(v17);
  [v15 push:v18];

  id v19 = [[CNContactFetchRequest alloc] initWithKeysToFetch:v10];
  if (v9)
  {
    v52[0] = v9;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
  }
  else
  {
    id v20 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v21 = +[CNContact predicateForContactsWithIdentifiers:v20];
  [(CNContactFetchRequest *)v19 setPredicate:v21];

  if (v9) {
  uint64_t v22 = [[CNAPITriageSession alloc] initWithRequest:v19];
  }
  [(CNAPITriageSession *)v22 open];
  *(void *)buf = 0;
  v45 = buf;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__13;
  v48 = __Block_byref_object_dispose__13;
  id v49 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  v34[6] = &v36;
  id v35 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __65__CNContactStore_unifiedContactWithIdentifier_keysToFetch_error___block_invoke_52;
  v34[3] = &unk_1E56B57C8;
  v34[4] = buf;
  v34[5] = &v40;
  BOOL v23 = [(CNContactStore *)self enumerateContactsAndMatchInfoWithFetchRequest:v19 error:&v35 usingBlock:v34];
  id v24 = v35;
  char v25 = v24;
  if (v23)
  {
    if (!*((unsigned char *)v41 + 24)) {
      CNSetError(error, 200, 0);
    }
    if (*((unsigned char *)v37 + 24))
    {
      v26 = os_log_create("com.apple.contacts", "data-access-error");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[CNContactStore unifiedContactWithIdentifier:keysToFetch:error:]();
      }

      CNSetError(error, 2, 0);
    }
    uint64_t v27 = (*(void (**)(void))(*MEMORY[0x1E4F5A2B0] + 16))();
    v28 = (void *)*((void *)v45 + 5);
    *((void *)v45 + 5) = v27;

    if (error && *error)
    {
      -[CNAPITriageSession closeWithError:](v22, "closeWithError:");
    }
    else if (*((void *)v45 + 5))
    {
      uint64_t v51 = *((void *)v45 + 5);
      v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
      [(CNAPITriageSession *)v22 closeWithContacts:v31];
    }
    else
    {
      [(CNAPITriageSession *)v22 close];
    }
    id v30 = *((id *)v45 + 5);
  }
  else
  {
    if (!v24)
    {
      v29 = os_log_create("com.apple.contacts", "data-access-error");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[CNContactStore unifiedContactWithIdentifier:keysToFetch:error:]();
      }

      char v25 = +[CNErrorFactory errorWithCode:2];
    }
    [(CNAPITriageSession *)v22 closeWithError:v25];
    id v30 = 0;
    if (error) {
      *error = (NSError *)v25;
    }
  }
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(buf, 8);

  [v15 popAllWithHandler:&__block_literal_global_60];
  id v32 = self;

  return (CNContact *)v30;
}

- (id)contactsMatchingPropertiesOfContact:(id)a3 unifyResults:(BOOL)a4 keysToFetch:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  v23[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  os_signpost_id_t v12 = [MEMORY[0x1E4F1CA48] array];
  if ([v10 hasBeenPersisted])
  {
    if ([v10 areKeysAvailable:v11])
    {
LABEL_12:
      id v19 = [MEMORY[0x1E4F1CAA0] orderedSetWithObject:v10];
      goto LABEL_14;
    }
    id v13 = [v10 identifier];
    v23[0] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    id v15 = +[CNContact predicateForContactsWithIdentifiers:v14];
    id v16 = +[_CNContactMatchingFetchRequestInfos fetchRequestInfoForPredicate:v15 properties:0];
    [v12 addObject:v16];
  }
  else
  {
    id v17 = [(CNContactStore *)self _fetchRequestInfosForEmailOrPhoneForContact:v10];
    [v12 addObjectsFromArray:v17];
  }
  if ([v12 count])
  {
    id v18 = [(CNContactStore *)self _executeFetchRequestsWithInfos:v12 unifyResults:v8 keysToFetch:v11 error:a6];
    id v19 = v18;
    if (!v18)
    {
LABEL_9:

      goto LABEL_14;
    }
    if ([v18 count])
    {
      id v20 = v19;
      goto LABEL_9;
    }
  }
  if ([v10 areKeysAvailable:v11]) {
    goto LABEL_12;
  }
  id v21 = +[CNContact newContactWithPropertyKeys:v11 withValuesFromContact:v10];
  id v19 = [MEMORY[0x1E4F1CAA0] orderedSetWithObject:v21];

LABEL_14:

  return v19;
}

- (id)_executeFetchRequestsWithInfos:(id)a3 unifyResults:(BOOL)a4 keysToFetch:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__28;
  id v32 = __Block_byref_object_dispose__28;
  id v33 = [MEMORY[0x1E4F1CA70] orderedSet];
  uint64_t v22 = 0;
  BOOL v23 = &v22;
  uint64_t v24 = 0x3032000000;
  char v25 = __Block_byref_object_copy__28;
  v26 = __Block_byref_object_dispose__28;
  id v27 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __99__CNContactStore_ElaborateSearches___executeFetchRequestsWithInfos_unifyResults_keysToFetch_error___block_invoke;
  v16[3] = &unk_1E56B8AF0;
  id v12 = v11;
  BOOL v21 = a4;
  id v17 = v12;
  id v18 = self;
  id v19 = &v22;
  id v20 = &v28;
  [v10 enumerateObjectsUsingBlock:v16];
  if (a6)
  {
    id v13 = (void *)v23[5];
    if (v13) {
      *a6 = v13;
    }
  }
  id v14 = (void *)[(id)v29[5] copy];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

void __99__CNContactStore_ElaborateSearches___executeFetchRequestsWithInfos_unifyResults_keysToFetch_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [[CNContactFetchRequest alloc] initWithKeysToFetch:*(void *)(a1 + 32)];
  [(CNContactFetchRequest *)v7 setUnifyResults:*(unsigned __int8 *)(a1 + 64)];
  uint64_t v8 = [v6 predicate];

  [(CNContactFetchRequest *)v7 setPredicate:v8];
  double v9 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __99__CNContactStore_ElaborateSearches___executeFetchRequestsWithInfos_unifyResults_keysToFetch_error___block_invoke_2;
  v14[3] = &unk_1E56B8AC8;
  v14[4] = *(void *)(a1 + 56);
  id obj = v11;
  LOBYTE(v8) = [v9 enumerateContactsAndMatchInfoWithFetchRequest:v7 error:&obj usingBlock:v14];
  objc_storeStrong((id *)(v10 + 40), obj);
  if ((v8 & 1) == 0)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;

    *a4 = 1;
  }
}

- (id)_fetchRequestInfosForEmailOrPhoneForContact:(id)a3
{
  id v3 = a3;
  double v4 = [MEMORY[0x1E4F1CA48] array];
  if ([v3 isKeyAvailable:@"emailAddresses"])
  {
    id v5 = [v3 emailAddresses];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__CNContactStore_ElaborateSearches___fetchRequestInfosForEmailOrPhoneForContact___block_invoke;
    v14[3] = &unk_1E56B8AA0;
    id v15 = v4;
    [v5 enumerateObjectsUsingBlock:v14];
  }
  if ([v3 isKeyAvailable:@"phoneNumbers"])
  {
    id v6 = [v3 phoneNumbers];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __81__CNContactStore_ElaborateSearches___fetchRequestInfosForEmailOrPhoneForContact___block_invoke_2;
    uint64_t v12 = &unk_1E56B8AA0;
    id v13 = v4;
    [v6 enumerateObjectsUsingBlock:&v9];
  }
  id v7 = objc_msgSend(v4, "copy", v9, v10, v11, v12);

  return v7;
}

+ (BOOL)isXPCDataMapperStoreForFavorites:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [v6 mapper];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

uint64_t __48__CNContactStore_authorizationForCurrentProcess__block_invoke()
{
  authorizationForCurrentProcess_cn_once_object_0 = objc_alloc_init(CNAuthorization);

  return MEMORY[0x1F41817F8]();
}

+ (int64_t)authorizationStatusForEntityType:(int64_t)a3 assumedIdentity:(id)a4
{
  id v5 = a4;
  id v6 = [[CNAuthorization alloc] initWithAssumedIdentity:v5];

  int64_t v7 = [(CNAuthorization *)v6 authorizationStatusForEntityType:a3];
  return v7;
}

+ (CNAuthorizationStatus)authorizationStatusForEntityType:(CNEntityType)entityType
{
  if (entityType) {
    return 0;
  }
  id v4 = +[CNContactStore authorizationForCurrentProcess]();
  CNAuthorizationStatus v5 = [v4 authorizationStatusForEntityType:0];

  return v5;
}

+ (id)authorizationForCurrentProcess
{
  self;
  if (authorizationForCurrentProcess_cn_once_token_0 != -1) {
    dispatch_once(&authorizationForCurrentProcess_cn_once_token_0, &__block_literal_global_53);
  }
  v0 = (void *)authorizationForCurrentProcess_cn_once_object_0;

  return v0;
}

- (CNContactStore)init
{
  if ([(CNContactStore *)self isMemberOfClass:objc_opt_class()])
  {
    id v3 = objc_alloc_init(CNContactStoreConfiguration);
    id v4 = [(CNContactStore *)self initWithConfiguration:v3];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CNContactStore;
    id v4 = [(CNContactStore *)&v6 init];
  }

  return v4;
}

- (CNContactStore)initWithConfiguration:(id)a3
{
  id v5 = a3;
  objc_super v6 = [v5 environment];

  if (!v6)
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v25 = *MEMORY[0x1E4F1C3C8];
    v26 = NSString;
    id v27 = NSStringFromSelector(a2);
    uint64_t v28 = [v26 stringWithFormat:@"CNContactStoreConfiguration.environment is unexpectedly nil for %@", v27];
    id v29 = [v24 exceptionWithName:v25 reason:v28 userInfo:0];

    objc_exception_throw(v29);
  }
  int64_t v7 = [MEMORY[0x1E4F1CA48] array];
  if ([v5 includeSuggestedContacts])
  {
    uint64_t v8 = [CNSuggestedContactStore alloc];
    uint64_t v9 = [v5 environment];
    uint64_t v10 = [v9 suggestionsService];
    id v11 = [v5 environment];
    uint64_t v12 = [v11 siriIntelligenceSettings];
    id v13 = [(CNSuggestedContactStore *)v8 initWithSuggestionsService:v10 siriIntelligenceSettings:v12];

    [v7 addObject:v13];
  }
  if ([v5 includeDonatedContacts])
  {
    id v14 = [[CNDataMapperConfiguration alloc] initWithContactStoreConfiguration:v5];
    id v15 = [[CNDonationMapper alloc] initWithConfiguration:v14];
    id v16 = [[CNDataMapperContactStore alloc] initWithDataMapper:v15 dataMapperConfiguration:v14];
    [v7 addObject:v16];
  }
  if ([v5 includeIncludeManagedAppleIDs])
  {
    id v17 = [[CNDataMapperConfiguration alloc] initWithContactStoreConfiguration:v5];
    id v18 = [[CNMAIDMapper alloc] initWithConfiguration:v17];
    id v19 = [[CNDataMapperContactStore alloc] initWithDataMapper:v18 dataMapperConfiguration:v17];
    [v7 addObject:v19];
  }
  if (([v5 includeLocalContacts] & 1) != 0 || !objc_msgSend(v7, "count"))
  {
    id v20 = [[CNDataMapperContactStore alloc] initWithConfiguration:v5];
    [v7 insertObject:v20 atIndex:0];
  }
  if ([v7 count] == 1 && objc_msgSend(v5, "leaveSingleStoresUnwrapped"))
  {
    BOOL v21 = [v7 firstObject];
  }
  else
  {
    BOOL v21 = [[CNAggregateContactStore alloc] initWithContactStores:v7 configuration:v5];
  }
  p_super = &v21->super;

  return p_super;
}

+ (CNContactStore)storeWithOptions:(unint64_t)a3
{
  id v5 = +[CNContactsEnvironment currentEnvironment];
  objc_super v6 = [a1 storeWithEnvironment:v5 options:a3];

  return (CNContactStore *)v6;
}

+ (CNContactStore)storeWithEnvironment:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  int64_t v7 = (void *)[objc_alloc((Class)a1) initWithEnvironment:v6 options:a4];

  return (CNContactStore *)v7;
}

- (CNContactStore)initWithEnvironment:(id)a3 options:(unint64_t)a4 managedConfiguration:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_alloc_init(CNContactStoreConfiguration);
  [(CNContactStoreConfiguration *)v10 setIncludeLocalContacts:a4 & 1];
  [(CNContactStoreConfiguration *)v10 setIncludeSuggestedContacts:(a4 >> 1) & 1];
  [(CNContactStoreConfiguration *)v10 setIncludeDonatedContacts:(a4 >> 2) & 1];
  [(CNContactStoreConfiguration *)v10 setIncludeIncludeManagedAppleIDs:(a4 >> 3) & 1];
  [(CNContactStoreConfiguration *)v10 setUseInProcessMapperExclusively:(a4 >> 4) & 1];
  [(CNContactStoreConfiguration *)v10 setEnvironment:v9];

  [(CNContactStoreConfiguration *)v10 setManagedConfiguration:v8];
  id v11 = [(CNContactStore *)self initWithConfiguration:v10];

  return v11;
}

- (CNContactStore)initWithEnvironment:(id)a3 options:(unint64_t)a4
{
  return [(CNContactStore *)self initWithEnvironment:a3 options:a4 managedConfiguration:0];
}

- (id)_ios_meContactWithKeysToFetch:(id)a3 error:(id *)a4
{
  return -[CNContactStore _unifiedMeContactWithKeysToFetch:error:](self, a3, (uint64_t)a4);
}

- (id)_crossPlatformUnifiedMeContactWithKeysToFetch:(id)a3 error:(id *)a4
{
  return -[CNContactStore _unifiedMeContactWithKeysToFetch:error:](self, a3, (uint64_t)a4);
}

id __28__CNContactStore_initialize__block_invoke()
{
  return +[CNChangesNotifier sharedNotifier];
}

- (id)unifiedContactCountWithError:(id *)a3
{
  return &unk_1EE089308;
}

uint64_t __63__CNContactStore_requestAccessForEntityType_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestAccessForEntityType:(CNEntityType)entityType completionHandler:(void *)completionHandler
{
  id v6 = completionHandler;
  int64_t v7 = [(CNContactStore *)self requestAccessForEntityType:entityType];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__CNContactStore_requestAccessForEntityType_completionHandler___block_invoke;
  v12[3] = &unk_1E56B5778;
  id v8 = v6;
  id v13 = v8;
  [v7 addSuccessBlock:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__CNContactStore_requestAccessForEntityType_completionHandler___block_invoke_2;
  v10[3] = &unk_1E56B57A0;
  id v11 = v8;
  id v9 = v8;
  [v7 addFailureBlock:v10];
}

void __69__CNContactStore_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke(uint64_t a1)
{
  +[CNAPITriageLogger setThreadEntryPoint:0];
  uint64_t v2 = +[CNAPITriageLogger os_log];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", "", v5, 2u);
  }
}

- (BOOL)enumerateContactsWithFetchRequest:(CNContactFetchRequest *)fetchRequest error:(NSError *)error usingBlock:(void *)block
{
  id v9 = fetchRequest;
  uint64_t v10 = block;
  +[CNAPITriageLogger setThreadEntryPoint:a2];
  id v11 = +[CNAPITriageLogger os_log];
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  id v13 = +[CNAPITriageLogger os_log];
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Fetching", "", buf, 2u);
  }

  id v15 = objc_alloc_init(MEMORY[0x1E4F5A508]);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __69__CNContactStore_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke;
  v29[3] = &__block_descriptor_40_e5_v8__0l;
  v29[4] = v12;
  id v16 = (void *)[v29 copy];
  id v17 = self;
  id v18 = _Block_copy(v17);
  [v15 push:v18];

  id v19 = [(CNContactFetchRequest *)v9 predicate];

  if (!v19 && pthread_main_np() == 1)
  {
    id v20 = [MEMORY[0x1E4F963E8] currentProcess];
    int v21 = [v20 isApplication];

    if (v21)
    {
      if (enumerateContactsWithFetchRequest_error_usingBlock__cn_once_token_15 != -1) {
        dispatch_once(&enumerateContactsWithFetchRequest_error_usingBlock__cn_once_token_15, &__block_literal_global_76);
      }
      if (os_log_type_enabled((os_log_t)enumerateContactsWithFetchRequest_error_usingBlock__cn_once_object_15, OS_LOG_TYPE_FAULT))
      {
        -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:]();
      }
    }
  }
  uint64_t v22 = (void *)MEMORY[0x192FD3A40]();
  id v28 = 0;
  unsigned __int8 v23 = -[CNContactStore pool_enumerateContactsWithFetchRequest:error:usingBlock:](self, v9, &v28, v10);
  id v24 = v28;
  if (error) {
    char v25 = v23;
  }
  else {
    char v25 = 1;
  }
  if ((v25 & 1) == 0) {
    *error = (NSError *)v24;
  }

  [v15 popAllWithHandler:&__block_literal_global_81];
  id v26 = self;

  return v23 & 1;
}

+ (id)storeForFamilyMember:(id)a3
{
  os_signpost_id_t v4 = (objc_class *)MEMORY[0x1E4F5A380];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithFamilyMember:v5];

  int64_t v7 = [a1 storeWithDelegateInfo:v6];

  return v7;
}

+ (CNContactStore)storeWithDelegateInfo:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[CNContactsEnvironment currentEnvironment];
  v11[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  int64_t v7 = (void *)[v5 copyWithDelegateInfos:v6];

  id v8 = objc_alloc_init(CNContactStoreConfiguration);
  [(CNContactStoreConfiguration *)v8 setEnvironment:v7];
  id v9 = (void *)[objc_alloc((Class)a1) initWithConfiguration:v8];

  return (CNContactStore *)v9;
}

+ (BOOL)eraseAllDataAtLocationWithName:(id)a3 error:(id *)a4
{
  id v6 = +[CNContactsEnvironment baseURLWithDataLocationName:a3];
  if (v6) {
    char v7 = [a1 eraseAllDataAtURL:v6 error:a4];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

+ (BOOL)eraseAllDataAtURL:(id)a3 error:(id *)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F28CB8];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  id v13 = 0;
  char v8 = [v7 removeItemAtURL:v6 error:&v13];

  id v9 = v13;
  if ((v8 & 1) == 0)
  {
    if (![MEMORY[0x1E4F5A3F0] isError:v9 errorWithDomain:*MEMORY[0x1E4F281F8] code:4])
    {
      uint64_t v10 = 0;
      goto LABEL_6;
    }

    id v9 = 0;
  }
  uint64_t v10 = 1;
LABEL_6:
  char v11 = [MEMORY[0x1E4F5A3F0] ifResultIsNo:v10 setOutputError:a4 toError:v9];

  return v11;
}

+ (Class)storeClassWithIdentifier:(id)a3
{
  if (a3) {
    NSClassFromString((NSString *)a3);
  }
  else {
  id v3 = objc_opt_class();
  }

  return (Class)v3;
}

+ (id)storeInfoClasses
{
  return 0;
}

+ (id)contactIdentifierFromInternalIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[CNContact makeIdentifierString];
  }
  id v5 = [a1 storeIdentifier];
  if (v5)
  {
    id v6 = [NSString stringWithFormat:@"%@%@%@", v5, @"://", v4];
  }
  else
  {
    id v6 = v4;
  }
  id v7 = v6;

  return v7;
}

+ (BOOL)isSharedNamePhotoEnabled
{
  uint64_t v2 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v3 = [v2 featureFlags];
  char v4 = [v3 isFeatureEnabled:13];

  return v4;
}

- (CNContactStore)initWithEnvironment:(id)a3
{
  return [(CNContactStore *)self initWithEnvironment:a3 options:1];
}

uint64_t __63__CNContactStore_requestAccessForEntityType_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)requestAccessForEntityType:(int64_t)a3
{
  id v3 = self;
  CNAbstractMethodException();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

void __65__CNContactStore_unifiedContactWithIdentifier_keysToFetch_error___block_invoke_52(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  uint64_t v7 = *(void *)(a1[4] + 8);
  uint64_t v10 = *(void **)(v7 + 40);
  char v8 = (id *)(v7 + 40);
  id v9 = v10;
  if (v10)
  {
    id *v8 = 0;

    *a4 = 1;
    uint64_t v11 = a1[6];
  }
  else
  {
    objc_storeStrong(v8, a2);
    uint64_t v11 = a1[5];
  }
  *(unsigned char *)(*(void *)(v11 + 8) + 24) = 1;
}

uint64_t __65__CNContactStore_unifiedContactWithIdentifier_keysToFetch_error___block_invoke_57(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)meContactIdentifiers:(id *)a3
{
  return 0;
}

- (id)_ios_meContactIdentifierWithError:(id *)a3
{
  id v3 = [(CNContactStore *)self meContactIdentifiers:a3];
  id v4 = [v3 firstObject];

  return v4;
}

- (CNContact)unifiedMeContactWithKeysToFetch:(NSArray *)keys error:(NSError *)error
{
  uint64_t v7 = keys;
  +[CNAPITriageLogger setThreadEntryPoint:a2];
  char v8 = +[CNAPITriageLogger os_log];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  uint64_t v10 = +[CNAPITriageLogger os_log];
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Fetching", "", buf, 2u);
  }

  id v12 = objc_alloc_init(MEMORY[0x1E4F5A508]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__CNContactStore_unifiedMeContactWithKeysToFetch_error___block_invoke;
  v19[3] = &__block_descriptor_40_e5_v8__0l;
  v19[4] = v9;
  id v13 = (void *)[v19 copy];
  id v14 = self;
  id v15 = _Block_copy(v14);
  [v12 push:v15];

  id v16 = -[CNContactStore _unifiedMeContactWithKeysToFetch:error:](self, v7, (uint64_t)error);
  [v12 popAllWithHandler:&__block_literal_global_63];
  id v17 = self;

  return (CNContact *)v16;
}

void __56__CNContactStore_unifiedMeContactWithKeysToFetch_error___block_invoke(uint64_t a1)
{
  +[CNAPITriageLogger setThreadEntryPoint:0];
  uint64_t v2 = +[CNAPITriageLogger os_log];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", "", v5, 2u);
  }
}

uint64_t __56__CNContactStore_unifiedMeContactWithKeysToFetch_error___block_invoke_61(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)unifiedMeContactMatchingEmailAddresses:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  os_signpost_id_t v9 = [(CNContactStore *)self _crossPlatformUnifiedMeContactWithKeysToFetch:a4 error:a5];
  uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = objc_msgSend(v9, "emailAddresses", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v24 + 1) + 8 * v15) value];
        id v17 = [v16 lowercaseString];
        [v10 addObject:v17];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  id v18 = (void *)MEMORY[0x1E4F1CAD0];
  id v19 = objc_msgSend(v8, "_cn_map:", &__block_literal_global_68);
  id v20 = [v18 setWithArray:v19];

  if ([v10 intersectsSet:v20]) {
    int v21 = v9;
  }
  else {
    int v21 = 0;
  }
  id v22 = v21;

  return v22;
}

uint64_t __75__CNContactStore_unifiedMeContactMatchingEmailAddresses_keysToFetch_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 lowercaseString];
}

- (id)unifiedMeContactMatchingEmailAddress:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    uint64_t v10 = 0;
  }
  else
  {
    v13[0] = v8;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    uint64_t v10 = [(CNContactStore *)self unifiedMeContactMatchingEmailAddresses:v11 keysToFetch:v9 error:a5];
  }

  return v10;
}

- (BOOL)setMeContact:(id)a3 error:(id *)a4
{
  id v5 = +[CNErrorFactory errorObject:self doesNotImplementSelector:sel_setMeContact_error_];
  id v6 = v5;
  if (a4) {
    *a4 = v5;
  }

  return 0;
}

- (BOOL)setMeContact:(id)a3 forContainer:(id)a4 error:(id *)a5
{
  id v6 = +[CNErrorFactory errorObject:self doesNotImplementSelector:sel_setMeContact_forContainer_error_];
  uint64_t v7 = v6;
  if (a5) {
    *a5 = v6;
  }

  return 0;
}

- (BOOL)setBestMeIfNeededForGivenName:(id)a3 familyName:(id)a4 email:(id)a5 error:(id *)a6
{
  return 0;
}

- (NSArray)unifiedContactsMatchingPredicate:(NSPredicate *)predicate keysToFetch:(NSArray *)keys error:(NSError *)error
{
  return 0;
}

uint64_t __69__CNContactStore_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke_74()
{
  enumerateContactsWithFetchRequest_error_usingBlock__cn_once_object_15 = (uint64_t)os_log_create("com.apple.runtime-issues", "Contacts");

  return MEMORY[0x1F41817F8]();
}

uint64_t __69__CNContactStore_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke_79(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (BOOL)enumerateNonUnifiedContactsWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if ([v9 unifyResults])
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3B8];
    uint64_t v15 = NSString;
    id v16 = NSStringFromSelector(a2);
    id v17 = [v15 stringWithFormat:@"Can't set -[CNContactFetchRequest unifyResults] to YES with %@", v16];
    id v18 = [v13 exceptionWithName:v14 reason:v17 userInfo:0];

    objc_exception_throw(v18);
  }
  BOOL v11 = [(CNContactStore *)self enumerateContactsWithFetchRequest:v9 error:a4 usingBlock:v10];

  return v11;
}

- (BOOL)enumerateContactsAndMatchInfoWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v6 = +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 1005, a4, a5);
  uint64_t v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return 0;
}

- (NSArray)groupsMatchingPredicate:(NSPredicate *)predicate error:(NSError *)error
{
  return 0;
}

- (id)groupWithIdentifier:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)membersOfGroupWithIdentifier:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4
{
  return 0;
}

- (NSArray)containersMatchingPredicate:(NSPredicate *)predicate error:(NSError *)error
{
  return 0;
}

- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6
{
  return 0;
}

- (BOOL)executeSaveRequest:(CNSaveRequest *)saveRequest error:(NSError *)error
{
  return 0;
}

- (BOOL)supportsSaveRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 storeIdentifier];
  if (!v5)
  {
    id v3 = [(id)objc_opt_class() storeIdentifier];
    if (!v3)
    {
      char v8 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  id v6 = [v4 storeIdentifier];
  uint64_t v7 = [(id)objc_opt_class() storeIdentifier];
  char v8 = [v6 isEqual:v7];

  if (!v5) {
    goto LABEL_6;
  }
LABEL_7:

  return v8;
}

- (NSString)defaultContainerIdentifier
{
  return 0;
}

- (BOOL)hasMultipleGroupsOrAccounts
{
  return 0;
}

- (BOOL)hasGroups
{
  return 0;
}

uint64_t __44__CNContactStore_executeFetchRequest_error___block_invoke_87(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)executeFetchRequestAndCountResults:(void *)a1
{
  if (a1)
  {
    id v12 = 0;
    uint64_t v2 = [a1 executeFetchRequest:a2 error:&v12];
    id v3 = v12;
    if (v3)
    {
      id v4 = [MEMORY[0x1E4F5A4E0] failureWithError:v3];
    }
    else
    {
      id v5 = [CNFetchResult alloc];
      id v6 = NSNumber;
      uint64_t v7 = [v2 value];
      char v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      id v9 = [v2 currentHistoryToken];
      id v10 = [(CNFetchResult *)v5 initWithValue:v8 currentHistoryToken:v9];

      id v4 = [MEMORY[0x1E4F5A4E0] successWithValue:v10];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)countForFetchRequest:(id)a3 error:(id *)a4
{
  id v7 = a3;
  +[CNAPITriageLogger setThreadEntryPoint:a2];
  char v8 = +[CNAPITriageLogger os_log];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = +[CNAPITriageLogger os_log];
  BOOL v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Fetching", "", buf, 2u);
  }

  id v12 = objc_alloc_init(MEMORY[0x1E4F5A508]);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __45__CNContactStore_countForFetchRequest_error___block_invoke;
  v28[3] = &__block_descriptor_40_e5_v8__0l;
  v28[4] = v9;
  uint64_t v13 = (void *)[v28 copy];
  uint64_t v14 = self;
  uint64_t v15 = _Block_copy(v14);
  [v12 push:v15];

  objc_opt_class();
  id v16 = v7;
  if (objc_opt_isKindOfClass()) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;

  if (v18)
  {
    [v18 setResultType:1];
    id v19 = [[CNContactStoreFetchExecutor alloc] initWithContactStore:self];
    id v20 = [(CNContactStoreFetchExecutor *)v19 countForFetchRequest:v16];
  }
  else
  {
    id v20 = -[CNContactStore executeFetchRequestAndCountResults:](self, (uint64_t)v16);
  }
  id v21 = v20;
  id v22 = [v21 value];

  if (v22)
  {
    unsigned __int8 v23 = [v21 value];
  }
  else
  {
    long long v24 = [v21 error];
    long long v25 = v24;
    if (a4) {
      *a4 = v24;
    }

    unsigned __int8 v23 = 0;
  }

  [v12 popAllWithHandler:&__block_literal_global_95];
  id v26 = self;

  return v23;
}

void __45__CNContactStore_countForFetchRequest_error___block_invoke(uint64_t a1)
{
  +[CNAPITriageLogger setThreadEntryPoint:0];
  uint64_t v2 = +[CNAPITriageLogger os_log];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", "", v5, 2u);
  }
}

uint64_t __45__CNContactStore_countForFetchRequest_error___block_invoke_93(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (CNFetchResult)enumeratorForContactFetchRequest:(CNContactFetchRequest *)request error:(NSError *)error
{
  id v7 = request;
  +[CNAPITriageLogger setThreadEntryPoint:a2];
  char v8 = +[CNAPITriageLogger os_log];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = +[CNAPITriageLogger os_log];
  BOOL v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Fetching", "", buf, 2u);
  }

  id v12 = objc_alloc_init(MEMORY[0x1E4F5A508]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __57__CNContactStore_enumeratorForContactFetchRequest_error___block_invoke;
  v27[3] = &__block_descriptor_40_e5_v8__0l;
  v27[4] = v9;
  uint64_t v13 = (void *)[v27 copy];
  uint64_t v14 = self;
  uint64_t v15 = _Block_copy(v14);
  [v12 push:v15];

  id v16 = [(CNContactFetchRequest *)v7 predicate];

  if (!v16 && pthread_main_np() == 1)
  {
    id v17 = [MEMORY[0x1E4F963E8] currentProcess];
    int v18 = [v17 isApplication];

    if (v18)
    {
      if (enumeratorForContactFetchRequest_error__cn_once_token_29 != -1) {
        dispatch_once(&enumeratorForContactFetchRequest_error__cn_once_token_29, &__block_literal_global_98);
      }
      if (os_log_type_enabled((os_log_t)enumeratorForContactFetchRequest_error__cn_once_object_29, OS_LOG_TYPE_FAULT)) {
        -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:]();
      }
    }
  }
  id v19 = [(CNContactStore *)self executeFetchRequest:v7 error:error];
  if (v19)
  {
    id v20 = [CNFetchResult alloc];
    id v21 = [v19 value];
    id v22 = [v21 objectEnumerator];
    unsigned __int8 v23 = [v19 currentHistoryToken];
    long long v24 = [(CNFetchResult *)v20 initWithValue:v22 currentHistoryToken:v23];
  }
  else
  {
    long long v24 = 0;
  }

  [v12 popAllWithHandler:&__block_literal_global_101_0];
  id v25 = self;

  return v24;
}

void __57__CNContactStore_enumeratorForContactFetchRequest_error___block_invoke(uint64_t a1)
{
  +[CNAPITriageLogger setThreadEntryPoint:0];
  uint64_t v2 = +[CNAPITriageLogger os_log];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", "", v5, 2u);
  }
}

uint64_t __57__CNContactStore_enumeratorForContactFetchRequest_error___block_invoke_96()
{
  enumeratorForContactFetchRequest_error__cn_once_object_29 = (uint64_t)os_log_create("com.apple.runtime-issues", "Contacts");

  return MEMORY[0x1F41817F8]();
}

uint64_t __57__CNContactStore_enumeratorForContactFetchRequest_error___block_invoke_99(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (CNFetchResult)enumeratorForChangeHistoryFetchRequest:(CNChangeHistoryFetchRequest *)request error:(NSError *)error
{
  os_signpost_id_t v4 = [(CNContactStore *)self executeFetchRequest:request error:error];
  if (v4)
  {
    id v5 = [CNFetchResult alloc];
    id v6 = [v4 value];
    id v7 = [v6 objectEnumerator];
    char v8 = [v4 currentHistoryToken];
    os_signpost_id_t v9 = [(CNFetchResult *)v5 initWithValue:v7 currentHistoryToken:v8];
  }
  else
  {
    os_signpost_id_t v9 = 0;
  }

  return v9;
}

- (id)executeFetchRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  +[CNAPITriageLogger setThreadEntryPoint:a2];
  os_signpost_id_t v9 = +[CNAPITriageLogger os_log];
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  BOOL v11 = +[CNAPITriageLogger os_log];
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "Fetching", "", buf, 2u);
  }

  id v13 = objc_alloc_init(MEMORY[0x1E4F5A508]);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __49__CNContactStore_executeFetchRequest_completion___block_invoke;
  v38[3] = &__block_descriptor_40_e5_v8__0l;
  v38[4] = v10;
  uint64_t v14 = (void *)[v38 copy];
  uint64_t v15 = self;
  id v16 = _Block_copy(v15);
  [v13 push:v16];

  id v17 = [MEMORY[0x1E4F1CA48] array];
  int v18 = [MEMORY[0x1E4F1CA60] dictionary];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__CNContactStore_executeFetchRequest_completion___block_invoke_103;
  aBlock[3] = &unk_1E56B5888;
  id v19 = v17;
  id v36 = v19;
  id v20 = v18;
  id v37 = v20;
  id v21 = _Block_copy(aBlock);
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  uint64_t v30 = __49__CNContactStore_executeFetchRequest_completion___block_invoke_2;
  v31 = &unk_1E56B58B0;
  id v34 = v8;
  id v22 = v19;
  id v32 = v22;
  id v23 = v20;
  id v33 = v23;
  long long v24 = _Block_copy(&v28);
  id v25 = -[CNContactStore executeFetchRequest:progressiveResults:completion:](self, "executeFetchRequest:progressiveResults:completion:", v7, v21, v24, v28, v29, v30, v31);

  [v13 popAllWithHandler:&__block_literal_global_106];
  id v26 = self;

  return v25;
}

void __49__CNContactStore_executeFetchRequest_completion___block_invoke(uint64_t a1)
{
  +[CNAPITriageLogger setThreadEntryPoint:0];
  uint64_t v2 = +[CNAPITriageLogger os_log];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", "", v5, 2u);
  }
}

void __49__CNContactStore_executeFetchRequest_completion___block_invoke_103(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v6 count])
  {
    [*(id *)(a1 + 32) addObjectsFromArray:v6];
    [*(id *)(a1 + 40) addEntriesFromDictionary:v5];
  }
}

void __49__CNContactStore_executeFetchRequest_completion___block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[6];
  if (a2)
  {
    id v3 = *(void (**)(uint64_t, void, void, uint64_t))(v2 + 16);
    uint64_t v4 = a1[6];
    v3(v4, 0, 0, a2);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1C978] arrayWithArray:a1[4]];
    (*(void (**)(uint64_t, id, void, void))(v2 + 16))(v2, v6, a1[5], 0);
  }
}

uint64_t __49__CNContactStore_executeFetchRequest_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)executeFetchRequest:(id)a3 progressiveResults:(id)a4 completion:(id)a5
{
  return 0;
}

- (id)identifierWithError:(id *)a3
{
  return 0;
}

- (int)saveSequenceCount
{
  return -1;
}

- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4
{
  return &unk_1EE089308;
}

- (BOOL)moveContacts:(id)a3 fromContainer:(id)a4 toContainer:(id)a5 error:(id *)a6
{
  return 0;
}

- (id)policyForContainerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(CNPolicyDescription);
  [(CNPolicyDescription *)v7 setContainerIdentifier:v6];

  id v8 = [(CNContactStore *)self policyWithDescription:v7 error:a4];

  return v8;
}

- (id)policyWithDescription:(id)a3 error:(id *)a4
{
  return 0;
}

+ (id)standardLabelsForPropertyWithKey:(id)a3
{
  return (id)[a1 standardLabelsForPropertyWithKey:a3 options:0];
}

+ (id)standardLabelsForPropertyWithKey:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  id v6 = +[CN contactPropertiesByKey];
  id v7 = [v6 objectForKey:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 standardLabelsWithOptions:a4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)usedLabelsForPropertyWithKey:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)mainContactStore
{
  id v3 = [(id)objc_opt_class() storeIdentifier];

  if (v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = self;
  }

  return v4;
}

- (BOOL)resetSortDataIfNeededWithError:(id *)a3
{
  uint64_t v4 = +[CNErrorFactory errorObject:self doesNotImplementSelector:sel_resetSortDataIfNeededWithError_];
  id v5 = v4;
  if (a3) {
    *a3 = v4;
  }

  return 0;
}

- (BOOL)setDefaultAccountIdentifier:(id)a3 error:(id *)a4
{
  id v5 = +[CNErrorFactory errorObject:self doesNotImplementSelector:sel_setDefaultAccountIdentifier_error_];
  id v6 = v5;
  if (a4) {
    *a4 = v5;
  }

  return 0;
}

- (id)sectionListOffsetsForSortOrder:(int64_t)a3 error:(id *)a4
{
  id v5 = +[CNErrorFactory errorObject:self doesNotImplementSelector:sel_sectionListOffsetsForSortOrder_error_];
  id v6 = v5;
  if (a4) {
    *a4 = v5;
  }

  return 0;
}

- (id)descriptorForRequiredKeysForUserActivityUserInfo
{
  uint64_t v2 = self;
  CNAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)contactWithUserActivityUserInfo:(id)a3 keysToFetch:(id)a4
{
  return 0;
}

- (id)userActivityUserInfoForContact:(id)a3
{
  return 0;
}

- (BOOL)supportsMatchingDictionaries
{
  return 0;
}

- (id)descriptorForRequiredKeysForMatchingDictionary
{
  uint64_t v2 = self;
  CNAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)matchingDictionaryForContact:(id)a3
{
  return 0;
}

- (id)contactWithMatchingDictionary:(id)a3 keysToFetch:(id)a4
{
  id v6 = a4;
  id v7 = [(CNContactStore *)self contactIdentifierWithMatchingDictionary:a3];
  if (v7)
  {
    id v8 = [(CNContactStore *)self unifiedContactWithIdentifier:v7 keysToFetch:v6 error:0];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)contactIdentifierWithMatchingDictionary:(id)a3
{
  return 0;
}

- (NSData)currentHistoryToken
{
  return 0;
}

- (CNResult)currentHistoryAnchor
{
  uint64_t v2 = (void *)MEMORY[0x1E4F5A4E0];
  id v3 = +[CNErrorFactory errorWithCode:1005];
  uint64_t v4 = [v2 failureWithError:v3];

  return (CNResult *)v4;
}

- (id)individualContactCountWithError:(id *)a3
{
  return &unk_1EE089308;
}

- (BOOL)registerChangeHistoryClientIdentifier:(id)a3 error:(id *)a4
{
  return [(CNContactStore *)self registerChangeHistoryClientIdentifier:a3 forContainerIdentifier:0 error:a4];
}

- (BOOL)registerChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)unregisterChangeHistoryClientIdentifier:(id)a3 error:(id *)a4
{
  return [(CNContactStore *)self unregisterChangeHistoryClientIdentifier:a3 forContainerIdentifier:0 error:a4];
}

- (BOOL)unregisterChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)changeHistoryWithFetchRequest:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)clearChangeHistoryForClientIdentifier:(id)a3 toChangeAnchor:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  os_signpost_id_t v10 = [[CNChangeHistoryClearRequest alloc] initWithClientIdentifier:v9];

  [(CNChangeHistoryClearRequest *)v10 setToChangeAnchor:v8];
  LOBYTE(a5) = [(CNContactStore *)self executeChangeHistoryClearRequest:v10 error:a5];

  return (char)a5;
}

- (BOOL)executeChangeHistoryClearRequest:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)latestConsumedChangeHistoryAnchorForClientIdentifier:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)verifyChangeHistoryForClientIdentifier:(id)a3 error:(id *)a4
{
  return 1;
}

+ (BOOL)isAccessRestrictedForEntityType:(int64_t)a3
{
  uint64_t v4 = +[CNContactStore authorizationForCurrentProcess]();
  LOBYTE(a3) = [v4 isAccessRestrictedForEntityType:a3];

  return a3;
}

+ (BOOL)isAccessLimitedForEntityType:(int64_t)a3
{
  uint64_t v4 = +[CNContactStore authorizationForCurrentProcess]();
  uint64_t v5 = [v4 authorizationStatusForEntityType:a3];

  return v5 == 4;
}

- (void)requestAuthorization:(int64_t)a3 entityType:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = (void (**)(id, uint64_t, void))a5;
  if ([(id)objc_opt_class() isAccessRestrictedForEntityType:a4])
  {
    v7[2](v7, 4, 0);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__CNContactStore_requestAuthorization_entityType_completionHandler___block_invoke;
    v8[3] = &unk_1E56B4AC8;
    id v9 = v7;
    [(CNContactStore *)self requestAccessForEntityType:a4 completionHandler:v8];
  }
}

uint64_t __68__CNContactStore_requestAuthorization_entityType_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = 6;
  }
  else {
    uint64_t v3 = 4;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

- (id)authorizedKeysForContactKeys:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = self;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  objc_opt_class();
  id v8 = [(CNContactStore *)v7 mapper];
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    id v11 = [v10 authorizedKeysForContactKeys:v4 error:0];
  }
  else
  {
    id v11 = v4;
  }
  id v12 = v11;

  return v12;
}

- (BOOL)hasAccountFirstSyncCompleted
{
  containerCache = self->_containerCache;
  if (!containerCache)
  {
    id v4 = [[CNContainerCache alloc] initWithContactStore:self];
    uint64_t v5 = self->_containerCache;
    self->_containerCache = v4;

    containerCache = self->_containerCache;
  }
  id v6 = [(CNContainerCache *)containerCache primaryiCloudContainer];
  id v7 = [v6 lastSyncDate];
  BOOL v8 = v7 != 0;

  return v8;
}

- (id)fetchLimitedAccessContactIdentifiersForBundle:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)getLimitedAccessContactsCountForBundle:(id)a3
{
  return 0;
}

- (id)populateSyncTableForLimitedAccessAboveSequenceNumber:(id)a3
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)getLimitedAccessLastSyncSequenceNumber:(id *)a3
{
  id v4 = +[CNErrorFactory errorWithCode:1];
  uint64_t v5 = v4;
  if (a3) {
    *a3 = v4;
  }

  return 0;
}

- (id)getWatchLimitedAccessSyncDataStartingAtSequenceNumber:(int64_t)a3
{
  return 0;
}

- (BOOL)shouldAnalyzeDatabaseWithError:(id *)a3
{
  return 0;
}

- (BOOL)analyzeDatabaseWithError:(id *)a3
{
  return 1;
}

+ (id)logSpotlight
{
  if (logSpotlight_cn_once_token_1 != -1) {
    dispatch_once(&logSpotlight_cn_once_token_1, &__block_literal_global_75);
  }
  uint64_t v2 = (void *)logSpotlight_cn_once_object_1;

  return v2;
}

uint64_t __41__CNContactStore_Spotlight__logSpotlight__block_invoke()
{
  logSpotlight_cn_once_object_1 = (uint64_t)os_log_create("com.apple.contacts", "spotlight");

  return MEMORY[0x1F41817F8]();
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(id)objc_opt_class() isXPCDataMapperStoreForSpotlight:self])
  {
    uint64_t v5 = [(id)objc_opt_class() logSpotlight];
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v4;
        id v7 = "Will reindex searchable items: %{public}@";
        BOOL v8 = v5;
        uint32_t v9 = 12;
LABEL_10:
        _os_log_impl(&dword_1909E3000, v8, OS_LOG_TYPE_INFO, v7, buf, v9);
      }
    }
    else if (v6)
    {
      *(_WORD *)buf = 0;
      id v7 = "Will reindex all searchable items";
      BOOL v8 = v5;
      uint32_t v9 = 2;
      goto LABEL_10;
    }

    id v11 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    id v12 = [v11 timeProvider];
    [v12 timestamp];
    uint64_t v14 = v13;

    id v10 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.contactsd" options:0];
    uint64_t v15 = +[CNXPCDataMapper serviceProtocolInterface];
    [v10 setRemoteObjectInterface:v15];

    [v10 resume];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __67__CNContactStore_Spotlight__reindexSearchableItemsWithIdentifiers___block_invoke;
    v18[3] = &unk_1E56B49B0;
    v18[4] = self;
    id v16 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v18];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __67__CNContactStore_Spotlight__reindexSearchableItemsWithIdentifiers___block_invoke_15;
    v17[3] = &unk_1E56B65E8;
    v17[5] = v14;
    v17[4] = self;
    [v16 reindexSearchableItemsWithIdentifiers:v4 withReply:v17];
    [v10 invalidate];

LABEL_12:
    goto LABEL_13;
  }
  if (v4)
  {
    id v10 = [(id)objc_opt_class() logSpotlight];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CNContactStore(Spotlight) reindexSearchableItemsWithIdentifiers:](v10);
    }
    goto LABEL_12;
  }
LABEL_13:
}

void __67__CNContactStore_Spotlight__reindexSearchableItemsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [(id)objc_opt_class() logSpotlight];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __67__CNContactStore_Spotlight__reindexSearchableItemsWithIdentifiers___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __67__CNContactStore_Spotlight__reindexSearchableItemsWithIdentifiers___block_invoke_15(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  uint64_t v3 = [v2 timeProvider];
  [v3 timestamp];
  double v5 = v4;

  BOOL v6 = [MEMORY[0x1E4F5A530] stringForTimeInterval:v5 - *(double *)(a1 + 40)];
  id v7 = [(id)objc_opt_class() logSpotlight];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    uint32_t v9 = v6;
    _os_log_impl(&dword_1909E3000, v7, OS_LOG_TYPE_INFO, "Did reindex searchable items (%{public}@)", (uint8_t *)&v8, 0xCu);
  }
}

- (id)verifyIndexWithError:(id *)a3
{
  if ([(id)objc_opt_class() isXPCDataMapperStoreForSpotlight:self])
  {
    double v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.contactsd" options:0];
    BOOL v6 = +[CNXPCDataMapper serviceProtocolInterface];
    [v5 setRemoteObjectInterface:v6];

    [v5 resume];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __50__CNContactStore_Spotlight__verifyIndexWithError___block_invoke;
    v25[3] = &unk_1E56B49B0;
    v25[4] = self;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v25];
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__20;
    id v23 = __Block_byref_object_dispose__20;
    id v24 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__20;
    id v17 = __Block_byref_object_dispose__20;
    id v18 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__CNContactStore_Spotlight__verifyIndexWithError___block_invoke_17;
    v12[3] = &unk_1E56B7308;
    void v12[4] = &v19;
    v12[5] = &v13;
    [v7 verifyIndexWithReply:v12];
    [v5 invalidate];
    int v8 = (void *)v14[5];
    id v9 = (id)v20[5];
    uint64_t v10 = v9;
    if (a3 && !v9) {
      *a3 = v8;
    }
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    CNSetError(a3, 1002, 0);
    uint64_t v10 = 0;
  }

  return v10;
}

void __50__CNContactStore_Spotlight__verifyIndexWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [(id)objc_opt_class() logSpotlight];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __67__CNContactStore_Spotlight__reindexSearchableItemsWithIdentifiers___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __50__CNContactStore_Spotlight__verifyIndexWithError___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

+ (id)IsSpotlightIndexingSupported
{
  return &__block_literal_global_21_0;
}

uint64_t __57__CNContactStore_Spotlight__IsSpotlightIndexingSupported__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSpotlightIndexingSupported];
}

- (BOOL)isSpotlightIndexingSupported
{
  uint64_t v3 = objc_opt_class();

  return [v3 isXPCDataMapperStoreForSpotlight:self];
}

+ (BOOL)isXPCDataMapperStoreForSpotlight:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [v6 mapper];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (CNiOSAddressBookDataMapper)iOSMapper
{
  return 0;
}

- (CNiOSAddressBook)addressBook
{
  id v2 = [(CNContactStore *)self iOSMapper];
  id v3 = -[CNiOSAddressBookDataMapper addressBook]((uint64_t)v2);

  return (CNiOSAddressBook *)v3;
}

- (BOOL)setDefaultContainer:(id)a3 forAccount:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 1;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__24;
  v31 = __Block_byref_object_dispose__24;
  id v32 = 0;
  uint64_t v10 = [(CNContactStore *)self iOSMapper];
  id v11 = -[CNiOSAddressBookDataMapper addressBook]((uint64_t)v10);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __73__CNContactStore_iOSABUnitTesting__setDefaultContainer_forAccount_error___block_invoke;
  id v22 = &unk_1E56B7D80;
  id v12 = v8;
  id v23 = v12;
  id v25 = &v33;
  id v26 = &v27;
  id v13 = v9;
  id v24 = v13;
  uint64_t v14 = [v11 performSynchronousWorkWithInvalidatedAddressBook:&v19];

  if (objc_msgSend(v14, "isSuccess", v19, v20, v21, v22))
  {
    BOOL v15 = *((unsigned char *)v34 + 24) != 0;
    if (a5 && !*((unsigned char *)v34 + 24))
    {
      BOOL v15 = 0;
      *a5 = (id) v28[5];
    }
  }
  else
  {
    id v16 = [v14 error];
    id v17 = v16;
    if (a5) {
      *a5 = v16;
    }

    BOOL v15 = 0;
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v15;
}

void __73__CNContactStore_iOSABUnitTesting__setDefaultContainer_forAccount_error___block_invoke(uint64_t a1, const void *a2)
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) identifier];
  v34[0] = v4;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  CFArrayRef v5 = (const __CFArray *)ABAddressBookCopySourcesWithUUIDs();

  if (v5 && CFArrayGetCount(v5) == 1)
  {
    CFArrayGetValueAtIndex(v5, 0);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v31 = *(void *)(a1 + 32);
    id v32 = @"CNInvalidRecords";
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    uint64_t v33 = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    uint64_t v8 = +[CNErrorFactory errorWithCode:200 userInfo:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    CFArrayRef v11 = (const __CFArray *)ABAddressBookCopyArrayOfAllAccounts();
    CFArrayRef v12 = v11;
    if (!v11 || CFArrayGetCount(v11) < 1) {
      goto LABEL_16;
    }
    CFIndex v13 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v12, v13);
      BOOL v15 = (const void *)ABAccountCopyInternalUUID();
      id v16 = [*(id *)(a1 + 40) identifier];
      int v17 = CFEqual(v15, v16);

      if (v15) {
        CFRelease(v15);
      }
      if (v17) {
        break;
      }
      if (++v13 >= CFArrayGetCount(v12)) {
        goto LABEL_16;
      }
    }
    CFTypeRef v18 = CFRetain(ValueAtIndex);
    if (!v18)
    {
LABEL_16:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      uint64_t v28 = *(void *)(a1 + 40);
      uint64_t v29 = @"CNInvalidRecords";
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
      uint64_t v30 = v19;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      uint64_t v21 = +[CNErrorFactory errorWithCode:200 userInfo:v20];
      uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
      id v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;

      CFTypeRef v18 = 0;
    }
    if (v12) {
      CFRelease(v12);
    }
  }
  else
  {
    CFTypeRef v18 = 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    CFErrorRef error = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = ABAddressBookSetDefaultSourceForAccount();
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
      || (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = ABAddressBookSave(a2, &error)) == 0)
    {
      uint64_t v24 = +[CNErrorFactory errorForiOSABError:error];
      uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
      id v26 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = v24;

      if (error) {
        CFRelease(error);
      }
    }
  }
  if (v18) {
    CFRelease(v18);
  }
  if (v5) {
    CFRelease(v5);
  }
}

- (id)contactFromPerson:(void *)a3
{
  return [(CNContactStore *)self contactFromPerson:a3 mutable:0];
}

- (id)contactFromPerson:(void *)a3 mutable:(BOOL)a4
{
  BOOL v4 = a4;
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = +[CN contactPropertiesByKey];
  uint64_t v9 = [v8 allKeys];
  uint64_t v10 = NSStringFromSelector(a2);
  CFArrayRef v11 = +[CNContact descriptorWithKeyDescriptors:v9 description:v10];
  v15[0] = v11;
  CFArrayRef v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  CFIndex v13 = [(CNContactStore *)self contactFromPerson:a3 keysToFetch:v12 mutable:v4];

  return v13;
}

- (id)contactFromPersonID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = +[CN contactPropertiesByKey];
  uint64_t v7 = [v6 allKeys];
  uint64_t v8 = NSStringFromSelector(a2);
  uint64_t v9 = +[CNContact descriptorWithKeyDescriptors:v7 description:v8];
  v13[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  CFArrayRef v11 = [(CNContactStore *)self contactFromPersonID:v3 keysToFetch:v10];

  return v11;
}

- (id)contactFromPerson:(void *)a3 keysToFetch:(id)a4
{
  return +[CNContact contactFromPerson:a3 keysToFetch:a4 mutable:0];
}

- (id)contactFromPerson:(void *)a3 keysToFetch:(id)a4 mutable:(BOOL)a5
{
  return +[CNContact contactFromPerson:a3 keysToFetch:a4 mutable:a5];
}

- (id)_contactFromPersonID:(int)a3 keysToFetch:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = [[CNContactFetchRequest alloc] initWithKeysToFetch:v6];
  uint64_t v8 = +[CNContact predicateForLegacyIdentifier:v4];
  [(CNContactFetchRequest *)v7 setPredicate:v8];

  [(CNContactFetchRequest *)v7 setUnifyResults:0];
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000;
  int v17 = __Block_byref_object_copy__27;
  CFTypeRef v18 = __Block_byref_object_dispose__27;
  id v19 = 0;
  void v12[4] = &v14;
  id v13 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__CNContactStore_iOSABLegacyCompatibility___contactFromPersonID_keysToFetch___block_invoke;
  v12[3] = &unk_1E56B4118;
  [(CNContactStore *)self enumerateContactsWithFetchRequest:v7 error:&v13 usingBlock:v12];
  id v9 = v13;
  id v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v10;
}

void __77__CNContactStore_iOSABLegacyCompatibility___contactFromPersonID_keysToFetch___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  if (v4)
  {
    *(void *)(v3 + 40) = 0;

    *a3 = 1;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (id)contactIdentifierFromPersonID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10[1] = *MEMORY[0x1E4F143B8];
  v10[0] = @"identifier";
  CFArrayRef v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v6 = [(CNContactStore *)self _contactFromPersonID:v3 keysToFetch:v5];

  uint64_t v7 = [v6 identifier];
  uint64_t v8 = (void *)[v7 copy];

  return v8;
}

- (void)personFromContact:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if ([v4 hasBeenPersisted]
    && ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized)
  {
    CFArrayRef v5 = [(CNContactStore *)self iOSMapper];
    int v6 = [v4 isUnified];
    char v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v4 linkedContacts];
      id v9 = [v8 objectAtIndexedSubscript:0];
      id v10 = [v9 identifier];

      if (!v10) {
        goto LABEL_8;
      }
    }
    else
    {
      id v10 = [v4 identifier];
      if (!v10)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    CFArrayRef v11 = -[CNiOSAddressBookDataMapper addressBook]((uint64_t)v5);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __62__CNContactStore_iOSABLegacyCompatibility__personFromContact___block_invoke;
    v15[3] = &unk_1E56B8798;
    int v17 = &v19;
    id v16 = v10;
    char v18 = v7;
    id v12 = (id)[v11 performSynchronousWorkWithInvalidatedAddressBook:v15];

    goto LABEL_8;
  }
LABEL_9:
  id v13 = (void *)v20[3];
  if (!v13)
  {
    if ([v4 isUnified])
    {
      id v13 = (void *)v20[3];
    }
    else
    {
      id v13 = (void *)[v4 detachedPerson];
      v20[3] = (uint64_t)v13;
    }
  }
  _Block_object_dispose(&v19, 8);

  return v13;
}

const void *__62__CNContactStore_iOSABLegacyCompatibility__personFromContact___block_invoke(uint64_t a1)
{
  id v2 = (const void *)ABAddressBookCopyPersonMatchingInternalUUID();
  if (v2) {
    id v2 = CFAutorelease(v2);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
  result = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (result && *(unsigned char *)(a1 + 48))
  {
    result = (const void *)ABPersonCreateUnifiedPerson();
    if (result) {
      result = CFAutorelease(result);
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (int)multiValueIdentifierFromLabeledValue:(id)a3
{
  return [a3 iOSLegacyIdentifier];
}

- (id)labeledValueFromMultiValueIdentifier:(int)a3 contact:(id)a4 key:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = +[CN contactPropertiesByKey];
  id v10 = [v9 objectForKeyedSubscript:v7];

  CFArrayRef v11 = [v10 CNValueForContact:v8];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__CNContactStore_iOSABLegacyCompatibility__labeledValueFromMultiValueIdentifier_contact_key___block_invoke;
  v14[3] = &__block_descriptor_36_e24_B16__0__CNLabeledValue_8l;
  int v15 = a3;
  id v12 = objc_msgSend(v11, "_cn_firstObjectPassingTest:", v14);

  return v12;
}

BOOL __93__CNContactStore_iOSABLegacyCompatibility__labeledValueFromMultiValueIdentifier_contact_key___block_invoke(uint64_t a1, void *a2)
{
  return [a2 iOSLegacyIdentifier] == *(_DWORD *)(a1 + 32);
}

- (id)_contactFromPublicABPerson:(void *)a3 keysToFetch:(id)a4
{
  id v5 = a4;
  int v6 = [getABSPublicABCNCompatibilityClass_0() contactFromPublicABPerson:a3 keysToFetch:v5];

  return v6;
}

- (void)_publicABPersonFromContact:(id)a3 publicAddressBook:(const void *)a4
{
  id v6 = a3;
  id v7 = (void *)[getABSPublicABCNCompatibilityClass_0() publicABPersonFromContact:v6 contactStore:self publicAddressBook:a4];

  return v7;
}

- (int)_publicMultiValueIdentifierFromLabeledValue:(id)a3
{
  id v4 = a3;
  LODWORD(self) = [getABSPublicABCNCompatibilityClass_0() publicMultiValueIdentifierFromLabeledValue:v4 contactStore:self];

  return (int)self;
}

- (id)_labeledValueFromPublicMultiValueIdentifier:(int)a3 contact:(id)a4 key:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [getABSPublicABCNCompatibilityClass_0() labeledValueFromPublicMultiValueIdentifier:v6 contact:v9 key:v8 contactStore:self];

  return v10;
}

+ (id)_contactStoreForPublicAddressBook:(void *)a3
{
  if (a3)
  {
    id v4 = [getABSPublicABCNCompatibilityClass_0() contactStoreForPublicAddressBook:a3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)originForSuggestion:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)unifiedContactWithIdentifier:keysToFetch:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1909E3000, v0, OS_LOG_TYPE_ERROR, "Found extra contacts", v1, 2u);
}

- (void)unifiedContactWithIdentifier:keysToFetch:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1909E3000, v0, OS_LOG_TYPE_ERROR, "Error unifying contact", v1, 2u);
}

- (void)enumerateContactsWithFetchRequest:error:usingBlock:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1909E3000, v0, OS_LOG_TYPE_FAULT, "This method should not be called on the main thread as it may lead to UI unresponsiveness.", v1, 2u);
}

void __67__CNContactStore_Spotlight__reindexSearchableItemsWithIdentifiers___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Could not obtain contacts service proxy for Spotlight query, CFErrorRef error = %@", (uint8_t *)&v2, 0xCu);
}

@end