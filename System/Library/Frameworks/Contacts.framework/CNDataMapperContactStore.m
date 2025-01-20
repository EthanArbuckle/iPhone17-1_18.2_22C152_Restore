@interface CNDataMapperContactStore
+ (BOOL)hasEnvironmentSettingsEnabledContactsOutOfProcess;
+ (Class)dataMapperClassForConfiguration:(id)a3;
- (BOOL)_requestDataMapperAccessType:(unint64_t)a3 error:(id *)a4;
- (BOOL)analyzeDatabaseWithError:(id *)a3;
- (BOOL)enumerateContactsAndMatchInfoWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)executeChangeHistoryClearRequest:(id)a3 error:(id *)a4;
- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4;
- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6;
- (BOOL)hasGroups;
- (BOOL)hasMultipleGroupsOrAccounts;
- (BOOL)isContactProvider;
- (BOOL)isValidSaveRequest:(id)a3 authorizationContext:(id)a4 error:(id *)a5;
- (BOOL)moveContacts:(id)a3 fromContainer:(id)a4 toContainer:(id)a5 error:(id *)a6;
- (BOOL)registerChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5;
- (BOOL)requestContactsReadAccessWithError:(id *)a3;
- (BOOL)requestContactsWriteAccessWithError:(id *)a3;
- (BOOL)requestMetadataAccessWithError:(id *)a3;
- (BOOL)resetSortDataIfNeededWithError:(id *)a3;
- (BOOL)setBestMeIfNeededForGivenName:(id)a3 familyName:(id)a4 email:(id)a5 error:(id *)a6;
- (BOOL)setDefaultAccountIdentifier:(id)a3 error:(id *)a4;
- (BOOL)setMeContact:(id)a3 error:(id *)a4;
- (BOOL)setMeContact:(id)a3 forContainer:(id)a4 error:(id *)a5;
- (BOOL)shouldAnalyzeDatabaseWithError:(id *)a3;
- (BOOL)shouldLogPrivacyAccountingAccessEvents;
- (BOOL)supportsMatchingDictionaries;
- (BOOL)unregisterChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5;
- (CNContactsLogger)logger;
- (CNDataMapper)mapper;
- (CNDataMapperContactStore)init;
- (CNDataMapperContactStore)initWithConfiguration:(id)a3;
- (CNDataMapperContactStore)initWithDataMapper:(id)a3 dataMapperConfiguration:(id)a4;
- (CNDataMapperContactStore)initWithEnvironment:(id)a3;
- (CNDataMapperContactStore)initWithEnvironment:(id)a3 managedConfiguration:(id)a4;
- (CNQueryAnalyticsLogger)queryAnalyticsLogger;
- (CNRegulatoryLogger)regulatoryLogger;
- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)changeHistoryWithFetchRequest:(id)a3 error:(id *)a4;
- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4;
- (id)contactIdentifierWithMatchingDictionary:(id)a3;
- (id)contactWithUserActivityUserInfo:(id)a3 keysToFetch:(id)a4;
- (id)contactsForFetchRequest:(id)a3 matchInfos:(id *)a4 error:(id *)a5;
- (id)contactsInContainerWithIdentifier:(id)a3 keysToFetch:(id)a4 error:(id *)a5;
- (id)containersMatchingPredicate:(id)a3 error:(id *)a4;
- (id)currentHistoryAnchor;
- (id)currentHistoryToken;
- (id)defaultContainerIdentifier;
- (id)description;
- (id)descriptorForRequiredKeysForMatchingDictionary;
- (id)executeFetchRequest:(id)a3 progressiveResults:(id)a4 completion:(id)a5;
- (id)fetchLimitedAccessContactIdentifiersForBundle:(id)a3;
- (id)getBackgroundColorOnImageData:(id)a3 bitmapFormat:(id)a4 error:(id *)a5;
- (id)getLimitedAccessContactsCountForBundle:(id)a3;
- (id)getLimitedAccessLastSyncSequenceNumber:(id *)a3;
- (id)getWatchLimitedAccessSyncDataStartingAtSequenceNumber:(int64_t)a3;
- (id)groupWithIdentifier:(id)a3 error:(id *)a4;
- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)iOSMapper;
- (id)identifierWithError:(id *)a3;
- (id)legacyTetheredSyncComputerAnchor;
- (id)legacyTetheredSyncDeviceAnchor;
- (id)matchingDictionaryForContact:(id)a3;
- (id)meContactIdentifiers:(id *)a3;
- (id)membersOfGroupWithIdentifier:(id)a3 keysToFetch:(id)a4 error:(id *)a5;
- (id)policyWithDescription:(id)a3 error:(id *)a4;
- (id)populateSyncTableForLimitedAccessAboveSequenceNumber:(id)a3;
- (id)requestAccessForEntityType:(int64_t)a3;
- (id)sectionListOffsetsForSortOrder:(int64_t)a3 error:(id *)a4;
- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4;
- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4;
- (id)unifiedContactCountWithError:(id *)a3;
- (id)unifiedContactsMatchingPredicate:(id)a3 keysToFetch:(id)a4 error:(id *)a5;
- (id)usedLabelsForPropertyWithKey:(id)a3 error:(id *)a4;
- (id)userActivityUserInfoForContact:(id)a3;
- (int)saveSequenceCount;
- (void)_logContactsAccessWasDeniedForAccessType:(unint64_t)a3 error:(id)a4;
- (void)_logContactsAccessWasGrantedForAccessType:(unint64_t)a3;
- (void)_logGreenTeaForAccessType:(unint64_t)a3;
- (void)_logPrivacyAccountingForAccessType:(unint64_t)a3;
- (void)addLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4;
- (void)addLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4;
- (void)applyLimitedAccessSyncEvents:(id)a3;
- (void)dropAllLimitedAccessRows;
- (void)dropAllLimitedAccessRowsAndSyncNotify;
- (void)purgeLimitedAccessRecordsForBundle:(id)a3;
- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4;
- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4;
- (void)requestReadAccessForEntityType:(int64_t)a3 completionHandler:(id)a4;
- (void)setLegacyTetheredSyncComputerAnchor:(id)a3;
- (void)setLegacyTetheredSyncDeviceAnchor:(id)a3;
- (void)setLimitedAccessTableCurrentSequenceNumber:(id)a3;
- (void)updateLimitedAccessTable:(id)a3;
@end

@implementation CNDataMapperContactStore

void __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v6 count];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_6;
  v7[3] = &unk_1E56B6FF0;
  uint64_t v9 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 32);
  uint64_t v10 = a4;
  [v6 enumerateObjectsUsingBlock:v7];
}

void __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_6(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = *MEMORY[0x1E4F5A280];
  id v12 = v6;
  id v8 = [v6 first];
  LOBYTE(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  if (v7)
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = [v12 first];
    v11 = [v12 second];
    (*(void (**)(uint64_t, void *, void *, void))(v9 + 16))(v9, v10, v11, a1[6]);

    *a4 = *(unsigned char *)a1[6];
  }
  else
  {
    ++*(void *)(*(void *)(a1[5] + 8) + 24);
  }
}

uint64_t __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_79(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [MEMORY[0x1E4F5A3B8] eitherWithBool:1 error:0];

  return MEMORY[0x1F41817F8]();
}

- (id)currentHistoryToken
{
  v3 = [(CNDataMapperContactStore *)self mapper];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = 0;
    if ([(CNDataMapperContactStore *)self requestMetadataAccessWithError:0])
    {
      id v6 = [(CNDataMapperContactStore *)self mapper];
      v5 = [v6 currentHistoryToken];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke(uint64_t a1)
{
  +[CNAPITriageLogger setThreadEntryPoint:0];
  v2 = +[CNAPITriageLogger os_log];
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", "", v5, 2u);
  }
}

- (BOOL)enumerateContactsAndMatchInfoWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  +[CNAPITriageLogger setThreadEntryPoint:a2];
  v11 = +[CNAPITriageLogger os_log];
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  v13 = +[CNAPITriageLogger os_log];
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Fetching", "", buf, 2u);
  }

  id v15 = objc_alloc_init(MEMORY[0x1E4F5A508]);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke;
  v44[3] = &__block_descriptor_40_e5_v8__0l;
  v44[4] = v12;
  v16 = (void *)[v44 copy];
  v17 = self;
  v18 = _Block_copy(v17);
  [v15 push:v18];

  v19 = [(CNDataMapperContactStore *)self queryAnalyticsLogger];
  [v19 recordQueryWithFetchRequest:v9];

  *(void *)buf = 0;
  v39 = buf;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__18;
  v42 = __Block_byref_object_dispose__18;
  id v43 = 0;
  v20 = [(CNDataMapperContactStore *)self logger];
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  v32 = __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_67;
  v33 = &unk_1E56B7040;
  v34 = self;
  v37 = buf;
  id v35 = v9;
  id v36 = v10;
  [v20 fetchingContacts:&v30];

  id v21 = *((id *)v39 + 5);
  char v25 = (*(uint64_t (**)(void, id, uint64_t, uint64_t, uint64_t))(*MEMORY[0x1E4F5A1C0] + 16))(*MEMORY[0x1E4F5A1C0], v21, v22, v23, v24);
  if ((v25 & 1) == 0)
  {
    v26 = objc_msgSend(v21, "right", v30, v31, v32, v33, v34, v35);
    v27 = v26;
    if (a4) {
      *a4 = v26;
    }
  }
  _Block_object_dispose(buf, 8);

  [v15 popAllWithHandler:&__block_literal_global_81_0];
  id v28 = self;

  return v25 & 1;
}

- (void)_logContactsAccessWasGrantedForAccessType:(unint64_t)a3
{
  v5 = [(CNDataMapperContactStore *)self mapper];
  int v6 = [v5 shouldLogContactsAccess];

  if (v6)
  {
    uint64_t v7 = [(CNDataMapperContactStore *)self logger];
    [v7 contactsAccessWasGranted];

    [(CNDataMapperContactStore *)self _logGreenTeaForAccessType:a3];
    [(CNDataMapperContactStore *)self _logPrivacyAccountingForAccessType:a3];
  }
}

- (CNContactsLogger)logger
{
  return self->_logger;
}

- (void)_logPrivacyAccountingForAccessType:(unint64_t)a3
{
  if (a3 != 2
    && [(CNDataMapperContactStore *)self shouldLogPrivacyAccountingAccessEvents])
  {
    id v4 = [(CNDataMapperContactStore *)self regulatoryLogger];
    [v4 logContactsDataAccessEvent];
  }
}

- (void)_logGreenTeaForAccessType:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v3 = [(CNDataMapperContactStore *)self regulatoryLogger];
    [v3 modifyingContactsData];
  }
  else
  {
    if (a3) {
      return;
    }
    id v3 = [(CNDataMapperContactStore *)self regulatoryLogger];
    [v3 readingContactsData];
  }
}

- (CNRegulatoryLogger)regulatoryLogger
{
  return self->_regulatoryLogger;
}

- (BOOL)shouldLogPrivacyAccountingAccessEvents
{
  return self->_shouldLogPrivacyAccountingAccessEvents;
}

- (CNQueryAnalyticsLogger)queryAnalyticsLogger
{
  return self->_queryAnalyticsLogger;
}

- (id)currentHistoryAnchor
{
  id v3 = [(CNDataMapperContactStore *)self mapper];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v12 = 0;
    BOOL v5 = [(CNDataMapperContactStore *)self requestMetadataAccessWithError:&v12];
    id v6 = v12;
    if (v5)
    {
      uint64_t v7 = [(CNDataMapperContactStore *)self mapper];
      id v8 = [v7 currentHistoryAnchor];

      goto LABEL_7;
    }
    id v10 = (void *)MEMORY[0x1E4F5A4E0];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F5A4E0];
    id v6 = +[CNErrorFactory errorWithCode:1005];
    id v10 = v9;
  }
  id v8 = [v10 failureWithError:v6];
LABEL_7:

  return v8;
}

- (BOOL)requestMetadataAccessWithError:(id *)a3
{
  return [(CNDataMapperContactStore *)self _requestDataMapperAccessType:2 error:a3];
}

void __49__CNDataMapperContactStore_meContactIdentifiers___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v14 = 0;
  char v3 = [v2 requestContactsReadAccessWithError:&v14];
  id v4 = v14;
  if (v3)
  {
    BOOL v5 = [*(id *)(a1 + 32) mapper];
    id v13 = v4;
    id v6 = [v5 meContactIdentifiers:&v13];
    id v7 = v13;

    uint64_t v8 = [MEMORY[0x1E4F5A3B8] eitherWithLeft:v6 right:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v4 = v7;
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F5A3B8] eitherWithRight:v4];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v5 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

- (id)meContactIdentifiers:(id *)a3
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  id v17 = 0;
  BOOL v5 = [(CNDataMapperContactStore *)self logger];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__CNDataMapperContactStore_meContactIdentifiers___block_invoke;
  v11[3] = &unk_1E56B6F00;
  v11[4] = self;
  v11[5] = &v12;
  [v5 fetchingMeContactIdentifier:v11];

  id v6 = (id)v13[5];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A1C0] + 16))())
  {
    id v7 = [v6 left];
  }
  else
  {
    uint64_t v8 = [v6 right];
    uint64_t v9 = v8;
    if (a3) {
      *a3 = v8;
    }

    id v7 = 0;
  }

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __57__CNDataMapperContactStore_unifiedContactCountWithError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 requestContactsReadAccessWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    BOOL v5 = [*(id *)(a1 + 32) mapper];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) mapper];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      id v19 = *(id *)(v8 + 40);
      uint64_t v9 = [(CNContactFetchRequest *)v7 unifiedContactCountWithError:&v19];
      objc_storeStrong((id *)(v8 + 40), v19);
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
    else
    {
      uint64_t v12 = [CNContactFetchRequest alloc];
      id v7 = [(CNContactFetchRequest *)v12 initWithKeysToFetch:MEMORY[0x1E4F1CBF0]];
      id v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      id v18 = *(id *)(v14 + 40);
      uint64_t v11 = [v13 contactsForFetchRequest:v7 matchInfos:0 error:&v18];
      objc_storeStrong((id *)(v14 + 40), v18);
      if (v11)
      {
        uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
        uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
        id v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;
      }
    }
  }
}

- (id)contactsForFetchRequest:(id)a3 matchInfos:(id *)a4 error:(id *)a5
{
  id v9 = a3;
  +[CNAPITriageLogger setThreadEntryPoint:a2];
  uint64_t v10 = +[CNAPITriageLogger os_log];
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  uint64_t v12 = +[CNAPITriageLogger os_log];
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Fetching", "", buf, 2u);
  }

  id v14 = objc_alloc_init(MEMORY[0x1E4F5A508]);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __69__CNDataMapperContactStore_contactsForFetchRequest_matchInfos_error___block_invoke;
  v31[3] = &__block_descriptor_40_e5_v8__0l;
  v31[4] = v11;
  uint64_t v15 = (void *)[v31 copy];
  uint64_t v16 = self;
  id v17 = _Block_copy(v16);
  [v14 push:v17];

  id v18 = [(CNDataMapperContactStore *)self queryAnalyticsLogger];
  [v18 recordQueryWithFetchRequest:v9];

  id v19 = [CNContactFetchRequestExecutor alloc];
  v20 = [(CNDataMapperContactStore *)self mapper];
  id v21 = -[CNContactFetchRequestExecutor initWithDataMapper:]((id *)&v19->super.isa, v20);

  uint64_t v22 = -[CNContactFetchRequestExecutor observableForFetchRequest:](v21, v9);
  uint64_t v23 = [v22 allObjects:a5];
  uint64_t v24 = objc_msgSend(v23, "_cn_flatten");

  char v25 = objc_msgSend(v24, "_cn_map:", *MEMORY[0x1E4F5A2B8]);
  if (a4)
  {
    v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
    v27 = objc_msgSend(v24, "_cn_reduce:initialValue:", &__block_literal_global_85_0, v26);

    id v28 = v27;
    *a4 = v28;
  }
  [v14 popAllWithHandler:&__block_literal_global_88];
  id v29 = self;

  return v25;
}

void __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_67(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  id v37 = 0;
  char v5 = [v4 requestContactsReadAccessWithError:&v37];
  id v6 = v37;
  if (v5)
  {
    id v7 = [CNContactFetchRequestExecutor alloc];
    uint64_t v8 = [*(id *)(a1 + 32) mapper];
    id v9 = -[CNContactFetchRequestExecutor initWithDataMapper:]((id *)&v7->super.isa, v8);

    uint64_t v10 = -[CNContactFetchRequestExecutor observableForFetchRequest:](v9, *(void **)(a1 + 40));
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_2;
    v36[3] = &unk_1E56B6FC8;
    v36[4] = *(void *)(a1 + 56);
    os_signpost_id_t v11 = [v10 doOnError:v36];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_3;
    v35[3] = &unk_1E56B45C0;
    v35[4] = *(void *)(a1 + 56);
    uint64_t v12 = [v11 doOnCompletion:v35];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_4;
    v34[3] = &unk_1E56B45C0;
    v34[4] = *(void *)(a1 + 56);
    id v13 = [v12 doOnCancel:v34];

    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_5;
    v22[3] = &unk_1E56B7018;
    uint64_t v24 = &v26;
    char v25 = &v30;
    id v23 = *(id *)(a1 + 48);
    [v13 enumerateObjectsUsingBlock:v22];
    if (v31[3])
    {
      id v14 = os_log_create("com.apple.contacts", "data-access-error");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_67_cold_1(v14);
      }

      uint64_t v15 = (void *)MEMORY[0x1E4F5A3B8];
      uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNErrorDomain" code:2 userInfo:0];
      uint64_t v17 = [v15 eitherWithRight:v16];
      uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
      id v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      objc_msgSend(MEMORY[0x1E4F5A4F8], "simulateCrashWithMessage:", @"enumerateContactsAndMatchInfoWithFetchRequest encountered NSNull %lu times where %lu CNContact objects where expcted", v31[3], v27[3]);
    }

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F5A3B8] eitherWithRight:v6];
    uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(void ***)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
}

- (BOOL)_requestDataMapperAccessType:(unint64_t)a3 error:(id *)a4
{
  if ([(CNDataMapperContactStore *)self isContactProvider])
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    uint64_t v8 = [(CNDataMapperContactStore *)self mapper];
    id v11 = 0;
    int v7 = [v8 requestAccessForEntityType:0 error:&v11];
    id v9 = v11;

    if (v7)
    {
      [(CNDataMapperContactStore *)self _logContactsAccessWasGrantedForAccessType:a3];
    }
    else
    {
      [(CNDataMapperContactStore *)self _logContactsAccessWasDeniedForAccessType:a3 error:v9];
      if (a4) {
        *a4 = v9;
      }
    }
  }
  return v7;
}

- (BOOL)isContactProvider
{
  return self->_isContactProvider;
}

- (BOOL)requestContactsReadAccessWithError:(id *)a3
{
  return [(CNDataMapperContactStore *)self _requestDataMapperAccessType:0 error:a3];
}

- (CNDataMapperContactStore)initWithDataMapper:(id)a3 dataMapperConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)CNDataMapperContactStore;
  id v9 = [(CNContactStore *)&v30 init];
  uint64_t v10 = v9;
  if (!v9) {
    goto LABEL_11;
  }
  p_mapper = (id *)&v9->_mapper;
  objc_storeStrong((id *)&v9->_mapper, a3);
  uint64_t v12 = [v8 environment];
  id v13 = [v12 loggerProvider];
  uint64_t v14 = [v13 contactsLogger];
  logger = v10->_logger;
  v10->_logger = (CNContactsLogger *)v14;

  v10->_isContactProvider = [v8 isContactProvider];
  id v16 = objc_alloc(MEMORY[0x1E4F5A4D8]);
  uint64_t v17 = [v8 assumedIdentity];
  uint64_t v18 = [v16 initWithAuditToken:0 assumedIdentity:v17];
  regulatoryLogger = v10->_regulatoryLogger;
  v10->_regulatoryLogger = (CNRegulatoryLogger *)v18;

  v10->_shouldLogPrivacyAccountingAccessEvents = 1;
  uint64_t v20 = [(CNDataMapperContactStore *)v10 mapper];
  LOBYTE(v17) = objc_opt_respondsToSelector();

  if (v17)
  {
    uint64_t v21 = [(CNDataMapperContactStore *)v10 mapper];
    v10->_shouldLogPrivacyAccountingAccessEvents = [v21 shouldLogPrivacyAccountingAccessEvents];
  }
  uint64_t v22 = [(CNDataMapperContactStore *)v10 mapper];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_7;
  }
  id v23 = [(CNDataMapperContactStore *)v10 mapper];
  int v24 = [v23 shouldCaptureMetricsForQueries];

  if (v24)
  {
    char v25 = [CNQueryAnalyticsLogger alloc];
    uint64_t v22 = [v8 assumedIdentity];
    uint64_t v26 = [(CNQueryAnalyticsLogger *)v25 initWithAuditToken:0 assumedIdentity:v22];
    queryAnalyticsLogger = v10->_queryAnalyticsLogger;
    v10->_queryAnalyticsLogger = (CNQueryAnalyticsLogger *)v26;

LABEL_7:
  }
  if (objc_opt_respondsToSelector()) {
    [*p_mapper setNotificationSource:v10];
  }
  uint64_t v28 = v10;
LABEL_11:

  return v10;
}

- (CNDataMapper)mapper
{
  return self->_mapper;
}

- (CNDataMapperContactStore)initWithConfiguration:(id)a3
{
  id v4 = a3;
  char v5 = [[CNDataMapperConfiguration alloc] initWithContactStoreConfiguration:v4];
  id v6 = (objc_class *)[(id)objc_opt_class() dataMapperClassForConfiguration:v4];

  id v7 = (void *)[[v6 alloc] initWithConfiguration:v5];
  id v8 = [(CNDataMapperContactStore *)self initWithDataMapper:v7 dataMapperConfiguration:v5];

  return v8;
}

+ (Class)dataMapperClassForConfiguration:(id)a3
{
  id v4 = a3;
  if ([v4 useOutOfProcessMapperExclusively]
    || ![v4 useInProcessMapperExclusively]
    && [a1 hasEnvironmentSettingsEnabledContactsOutOfProcess])
  {
    uint64_t v5 = objc_opt_class();
  }
  else
  {
    uint64_t v5 = +[CN defaultDataMapperClass];
  }
  id v6 = (void *)v5;

  return (Class)v6;
}

+ (BOOL)hasEnvironmentSettingsEnabledContactsOutOfProcess
{
  v2 = [MEMORY[0x1E4F5A568] standardPreferences];
  id v3 = [v2 objectForKey:@"SUDO_OOP"];
  id v4 = v3;
  if (!v3)
  {
    if (([v2 userHasOptedOutOfPreference:@"TESTING_OUT_OF_PROCESS"] & 1) == 0)
    {
      if (_block_invoke_cn_once_token_0 != -1) {
        dispatch_once(&_block_invoke_cn_once_token_0, &__block_literal_global_4_5);
      }
      if (![(id)_block_invoke_cn_once_object_0 BOOLValue])
      {
        char v5 = 1;
        goto LABEL_10;
      }
    }
    if (_block_invoke_2_cn_once_token_1 != -1) {
      dispatch_once(&_block_invoke_2_cn_once_token_1, &__block_literal_global_10_1);
    }
    id v3 = (void *)_block_invoke_2_cn_once_object_1;
  }
  char v5 = [v3 BOOLValue];
LABEL_10:

  return v5;
}

void __79__CNDataMapperContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke_63(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 requestContactsReadAccessWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    char v5 = [[CNContactFetchRequest alloc] initWithKeysToFetch:a1[5]];
    [(CNContactFetchRequest *)v5 setPredicate:a1[6]];
    id v6 = [[CNAPITriageSession alloc] initWithRequest:v5];
    [(CNAPITriageSession *)v6 open];
    id v7 = (void *)a1[4];
    uint64_t v8 = *(void *)(a1[7] + 8);
    id v12 = *(id *)(v8 + 40);
    uint64_t v9 = [v7 contactsForFetchRequest:v5 matchInfos:0 error:&v12];
    objc_storeStrong((id *)(v8 + 40), v12);
    uint64_t v10 = *(void *)(a1[8] + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    [(CNAPITriageSession *)v6 closeWithContacts:*(void *)(*(void *)(a1[8] + 8) + 40) orError:*(void *)(*(void *)(a1[7] + 8) + 40)];
  }
}

void __77__CNDataMapperContactStore_hasEnvironmentSettingsEnabledContactsOutOfProcess__block_invoke_4()
{
  v0 = NSNumber;
  id v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v1 = [v4 entitlementVerifier];
  uint64_t v2 = objc_msgSend(v0, "numberWithBool:", objc_msgSend(v1, "currentProcessHasBooleanEntitlement:error:", *MEMORY[0x1E4F5A208], 0));
  uint64_t v3 = (void *)_block_invoke_2_cn_once_object_1;
  _block_invoke_2_cn_once_object_1 = v2;
}

void __77__CNDataMapperContactStore_hasEnvironmentSettingsEnabledContactsOutOfProcess__block_invoke_2()
{
  v0 = NSNumber;
  id v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v1 = [v4 entitlementVerifier];
  uint64_t v2 = objc_msgSend(v0, "numberWithBool:", objc_msgSend(v1, "currentProcessHasBooleanEntitlement:error:", *MEMORY[0x1E4F5A210], 0));
  uint64_t v3 = (void *)_block_invoke_cn_once_object_0;
  _block_invoke_cn_once_object_0 = v2;
}

uint64_t __69__CNDataMapperContactStore_contactsForFetchRequest_matchInfos_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)unifiedContactCountWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__18;
  uint64_t v21 = __Block_byref_object_dispose__18;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__18;
  uint64_t v15 = __Block_byref_object_dispose__18;
  id v16 = 0;
  char v5 = [(CNDataMapperContactStore *)self logger];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__CNDataMapperContactStore_unifiedContactCountWithError___block_invoke;
  v10[3] = &unk_1E56B6ED8;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = &v17;
  [v5 fetchingContactCount:v10];

  id v6 = (void *)v12[5];
  id v7 = (id)v18[5];
  uint64_t v8 = v7;
  if (a3 && !v7) {
    *a3 = v6;
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryAnalyticsLogger, 0);
  objc_storeStrong((id *)&self->_regulatoryLogger, 0);
  objc_storeStrong((id *)&self->_logger, 0);

  objc_storeStrong((id *)&self->_mapper, 0);
}

void __69__CNDataMapperContactStore_contactsForFetchRequest_matchInfos_error___block_invoke(uint64_t a1)
{
  +[CNAPITriageLogger setThreadEntryPoint:0];
  uint64_t v2 = +[CNAPITriageLogger os_log];
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)char v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", "", v5, 2u);
  }
}

void __65__CNDataMapperContactStore_sectionListOffsetsForSortOrder_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 requestMetadataAccessWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    char v5 = [*(id *)(a1 + 32) mapper];
    char v6 = objc_opt_respondsToSelector();

    id v7 = [*(id *)(a1 + 32) mapper];
    if (v6)
    {
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      id v15 = *(id *)(v9 + 40);
      uint64_t v10 = [v7 sectionListOffsetsForSortOrder:v8 error:&v15];
      objc_storeStrong((id *)(v9 + 40), v15);
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    else
    {
      uint64_t v13 = +[CNErrorFactory errorObject:v7 doesNotImplementSelector:sel_sectionListOffsetsForSortOrder_error_];
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      id v12 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
}

- (id)sectionListOffsetsForSortOrder:(int64_t)a3 error:(id *)a4
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__18;
  id v23 = __Block_byref_object_dispose__18;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__18;
  uint64_t v17 = __Block_byref_object_dispose__18;
  id v18 = 0;
  id v7 = [(CNDataMapperContactStore *)self logger];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__CNDataMapperContactStore_sectionListOffsetsForSortOrder_error___block_invoke;
  v12[3] = &unk_1E56B6F78;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = &v19;
  v12[7] = a3;
  [v7 fetchingContactSectionCounts:v12];

  uint64_t v8 = (void *)v14[5];
  id v9 = (id)v20[5];
  uint64_t v10 = v9;
  if (a4 && !v9) {
    *a4 = v8;
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v10;
}

void __55__CNDataMapperContactStore_requestAccessForEntityType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) mapper];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__CNDataMapperContactStore_requestAccessForEntityType___block_invoke_2;
  v9[3] = &unk_1E56B7218;
  uint64_t v5 = *(void *)(a1 + 32);
  char v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v11 = v3;
  v9[4] = v5;
  id v10 = v6;
  id v8 = v3;
  [v4 requestAccessForEntityType:v7 completionHandler:v9];
}

void __55__CNDataMapperContactStore_requestAccessForEntityType___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v5 = *(void **)(a1 + 32);
  if (v6 || !a2)
  {
    [v5 _logContactsAccessWasDeniedForAccessType:0 error:v6];
    [*(id *)(a1 + 40) finishWithError:v6];
  }
  else
  {
    [v5 _logContactsAccessWasGrantedForAccessType:0];
    [*(id *)(a1 + 40) finishWithResult:MEMORY[0x1E4F1CC38]];
  }
}

- (id)requestAccessForEntityType:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  id v6 = [(CNDataMapperContactStore *)self logger];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__CNDataMapperContactStore_requestAccessForEntityType___block_invoke;
  v10[3] = &unk_1E56B7240;
  id v11 = v5;
  int64_t v12 = a3;
  v10[4] = self;
  id v7 = v5;
  [v6 requestingAccessForContacts:v10];

  id v8 = [v7 future];

  return v8;
}

- (id)unifiedContactsMatchingPredicate:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  +[CNAPITriageLogger setThreadEntryPoint:a2];
  id v11 = +[CNAPITriageLogger os_log];
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  uint64_t v13 = +[CNAPITriageLogger os_log];
  uint64_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Fetching", "", buf, 2u);
  }

  id v15 = objc_alloc_init(MEMORY[0x1E4F5A508]);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __79__CNDataMapperContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke;
  v45[3] = &__block_descriptor_40_e5_v8__0l;
  v45[4] = v12;
  id v16 = (void *)[v45 copy];
  uint64_t v17 = self;
  id v18 = _Block_copy(v17);
  [v15 push:v18];

  if (!v9 && pthread_main_np() == 1)
  {
    uint64_t v19 = [MEMORY[0x1E4F963E8] currentProcess];
    int v20 = [v19 isApplication];

    if (v20)
    {
      if (unifiedContactsMatchingPredicate_keysToFetch_error__cn_once_token_6 != -1) {
        dispatch_once(&unifiedContactsMatchingPredicate_keysToFetch_error__cn_once_token_6, &__block_literal_global_60_0);
      }
      uint64_t v21 = unifiedContactsMatchingPredicate_keysToFetch_error__cn_once_object_6;
      if (os_log_type_enabled((os_log_t)unifiedContactsMatchingPredicate_keysToFetch_error__cn_once_object_6, OS_LOG_TYPE_FAULT))
      {
        -[CNDataMapperContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](v21);
      }
    }
  }
  *(void *)buf = 0;
  uint64_t v40 = buf;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__18;
  id v43 = __Block_byref_object_dispose__18;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__18;
  id v37 = __Block_byref_object_dispose__18;
  id v38 = 0;
  id v22 = [(CNDataMapperContactStore *)self logger];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __79__CNDataMapperContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke_63;
  v28[3] = &unk_1E56B6FA0;
  v28[4] = self;
  uint64_t v31 = &v33;
  id v29 = v10;
  id v30 = v9;
  uint64_t v32 = buf;
  [v22 fetchingContacts:v28];

  id v23 = (void *)v34[5];
  id v24 = *((id *)v40 + 5);
  char v25 = v24;
  if (a5 && !v24) {
    *a5 = v23;
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(buf, 8);

  [v15 popAllWithHandler:&__block_literal_global_66];
  id v26 = self;

  return v25;
}

uint64_t __79__CNDataMapperContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __79__CNDataMapperContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke(uint64_t a1)
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

- (CNDataMapperContactStore)init
{
  id v3 = +[CNContactsEnvironment currentEnvironment];
  os_signpost_id_t v4 = [(CNDataMapperContactStore *)self initWithEnvironment:v3];

  return v4;
}

- (CNDataMapperContactStore)initWithEnvironment:(id)a3
{
  return [(CNDataMapperContactStore *)self initWithEnvironment:a3 managedConfiguration:0];
}

- (CNDataMapperContactStore)initWithEnvironment:(id)a3 managedConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(CNContactStoreConfiguration);
  [(CNContactStoreConfiguration *)v8 setEnvironment:v7];

  [(CNContactStoreConfiguration *)v8 setManagedConfiguration:v6];
  id v9 = [(CNDataMapperContactStore *)self initWithConfiguration:v8];

  return v9;
}

- (BOOL)setDefaultAccountIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__18;
  id v23 = __Block_byref_object_dispose__18;
  id v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v7 = [(CNDataMapperContactStore *)self logger];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__CNDataMapperContactStore_setDefaultAccountIdentifier_error___block_invoke;
  v11[3] = &unk_1E56B6EB0;
  v11[4] = self;
  uint64_t v13 = &v19;
  uint64_t v14 = &v15;
  id v8 = v6;
  id v12 = v8;
  [v7 settingDefaultAccount:v11];

  int v9 = *((unsigned __int8 *)v16 + 24);
  if (a4 && !*((unsigned char *)v16 + 24)) {
    *a4 = (id) v20[5];
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9 != 0;
}

void __62__CNDataMapperContactStore_setDefaultAccountIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mapper];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    os_signpost_id_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v5 + 40);
    int v6 = [v4 requestMetadataAccessWithError:&obj];
    objc_storeStrong((id *)(v5 + 40), obj);
    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) mapper];
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      id v15 = *(id *)(v9 + 40);
      char v10 = [v7 setDefaultAccountIdentifier:v8 error:&v15];
      objc_storeStrong((id *)(v9 + 40), v15);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
    }
  }
  else
  {
    id v14 = [*(id *)(a1 + 32) mapper];
    uint64_t v11 = +[CNErrorFactory errorObject:v14 doesNotImplementSelector:sel_setDefaultAccountIdentifier_error_];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

- (BOOL)resetSortDataIfNeededWithError:(id *)a3
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__18;
  uint64_t v17 = __Block_byref_object_dispose__18;
  id v18 = 0;
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v5 = [(CNDataMapperContactStore *)self logger];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__CNDataMapperContactStore_resetSortDataIfNeededWithError___block_invoke;
  v8[3] = &unk_1E56B6ED8;
  v8[4] = self;
  v8[5] = &v13;
  v8[6] = &v9;
  [v5 resettingSortDataIfNeeded:v8];

  if (a3) {
    *a3 = (id) v14[5];
  }
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

void __59__CNDataMapperContactStore_resetSortDataIfNeededWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mapper];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    os_signpost_id_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v5 + 40);
    int v6 = [v4 requestContactsWriteAccessWithError:&obj];
    objc_storeStrong((id *)(v5 + 40), obj);
    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) mapper];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      id v14 = *(id *)(v8 + 40);
      char v9 = [v7 resetSortDataIfNeededWithError:&v14];
      objc_storeStrong((id *)(v8 + 40), v14);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
    }
  }
  else
  {
    id v13 = [*(id *)(a1 + 32) mapper];
    uint64_t v10 = +[CNErrorFactory errorObject:v13 doesNotImplementSelector:sel_resetSortDataIfNeededWithError_];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    char v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (id)description
{
  char v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  os_signpost_id_t v4 = [(CNDataMapperContactStore *)self mapper];
  id v5 = (id)[v3 appendName:@"mapper" object:v4];

  int v6 = [v3 build];

  return v6;
}

- (id)identifierWithError:(id *)a3
{
  if (-[CNDataMapperContactStore requestMetadataAccessWithError:](self, "requestMetadataAccessWithError:")
    && ([(CNDataMapperContactStore *)self mapper],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        (v6 & 1) != 0))
  {
    id v7 = [(CNDataMapperContactStore *)self mapper];
    uint64_t v8 = [v7 identifierWithError:a3];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (int)saveSequenceCount
{
  char v3 = [(CNDataMapperContactStore *)self mapper];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0
    || ![(CNDataMapperContactStore *)self requestMetadataAccessWithError:0])
  {
    return -1;
  }
  id v5 = [(CNDataMapperContactStore *)self mapper];
  int v6 = [v5 saveSequenceCount];

  return v6;
}

- (BOOL)setMeContact:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__18;
  uint64_t v19 = __Block_byref_object_dispose__18;
  id v20 = 0;
  id v7 = [(CNDataMapperContactStore *)self logger];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__CNDataMapperContactStore_setMeContact_error___block_invoke;
  v11[3] = &unk_1E56B6EB0;
  v11[4] = self;
  id v13 = &v15;
  id v14 = &v21;
  id v8 = v6;
  id v12 = v8;
  [v7 changingMeContact:v11];

  int v9 = *((unsigned __int8 *)v22 + 24);
  if (a4 && !*((unsigned char *)v22 + 24)) {
    *a4 = (id) v16[5];
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9 != 0;
}

void __47__CNDataMapperContactStore_setMeContact_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mapper];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    char v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v5 + 40);
    int v6 = [v4 requestContactsWriteAccessWithError:&obj];
    objc_storeStrong((id *)(v5 + 40), obj);
    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) mapper];
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      id v17 = *(id *)(v9 + 40);
      char v10 = [v7 setMeContact:v8 error:&v17];
      objc_storeStrong((id *)(v9 + 40), v17);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;

      uint64_t v11 = +[CNChangesNotifier sharedNotifier];
      [v11 didChangeMeContactSuccessfully:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) fromContactStore:*(void *)(a1 + 32) requestIdentifier:0];

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        id v12 = [*(id *)(a1 + 32) logger];
        [v12 changedMeContact:*(void *)(a1 + 40)];
      }
    }
  }
  else
  {
    id v16 = [*(id *)(a1 + 32) mapper];
    uint64_t v13 = +[CNErrorFactory errorObject:v16 doesNotImplementSelector:sel_setMeContact_error_];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

- (BOOL)setMeContact:(id)a3 forContainer:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__18;
  char v24 = __Block_byref_object_dispose__18;
  id v25 = 0;
  char v10 = [(CNDataMapperContactStore *)self logger];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__CNDataMapperContactStore_setMeContact_forContainer_error___block_invoke;
  v15[3] = &unk_1E56B6F28;
  v15[4] = self;
  id v18 = &v20;
  uint64_t v19 = &v26;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  [v10 changingMeContact:v15];

  int v13 = *((unsigned __int8 *)v27 + 24);
  if (a5 && !*((unsigned char *)v27 + 24)) {
    *a5 = (id) v21[5];
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13 != 0;
}

void __60__CNDataMapperContactStore_setMeContact_forContainer_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mapper];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    char v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v5 + 40);
    int v6 = [v4 requestContactsWriteAccessWithError:&obj];
    objc_storeStrong((id *)(v5 + 40), obj);
    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) mapper];
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
      id v18 = *(id *)(v10 + 40);
      char v11 = [v7 setMeContact:v8 forContainer:v9 error:&v18];
      objc_storeStrong((id *)(v10 + 40), v18);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v11;

      id v12 = +[CNChangesNotifier sharedNotifier];
      [v12 didChangeMeContactSuccessfully:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) fromContactStore:*(void *)(a1 + 32) requestIdentifier:0];

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        int v13 = [*(id *)(a1 + 32) logger];
        [v13 changedMeContact:*(void *)(a1 + 40)];
      }
    }
  }
  else
  {
    id v17 = [*(id *)(a1 + 32) mapper];
    uint64_t v14 = +[CNErrorFactory errorObject:v17 doesNotImplementSelector:sel_setMeContact_forContainer_error_];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

- (BOOL)setBestMeIfNeededForGivenName:(id)a3 familyName:(id)a4 email:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__18;
  char v29 = __Block_byref_object_dispose__18;
  id v30 = 0;
  int v13 = [(CNDataMapperContactStore *)self logger];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __81__CNDataMapperContactStore_setBestMeIfNeededForGivenName_familyName_email_error___block_invoke;
  v19[3] = &unk_1E56B6F50;
  v19[4] = self;
  uint64_t v23 = &v25;
  char v24 = &v31;
  id v14 = v10;
  id v20 = v14;
  id v15 = v11;
  id v21 = v15;
  id v16 = v12;
  id v22 = v16;
  [v13 changingMeContact:v19];

  int v17 = *((unsigned __int8 *)v32 + 24);
  if (a6 && !*((unsigned char *)v32 + 24)) {
    *a6 = (id) v26[5];
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17 != 0;
}

void __81__CNDataMapperContactStore_setBestMeIfNeededForGivenName_familyName_email_error___block_invoke(uint64_t a1)
{
  v18[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 requestContactsWriteAccessWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) mapper];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    id v16 = *(id *)(v9 + 40);
    char v10 = [v5 setBestMeIfNeededForGivenName:v6 familyName:v7 email:v8 error:&v16];
    objc_storeStrong((id *)(v9 + 40), v16);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v10;

    id v11 = +[CNChangesNotifier sharedNotifier];
    [v11 didChangeMeContactSuccessfully:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) fromContactStore:*(void *)(a1 + 32) requestIdentifier:0];

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      id v12 = *(void **)(a1 + 32);
      v18[0] = @"givenName";
      v18[1] = @"familyName";
      v18[2] = @"emailAddresses";
      v18[3] = @"phoneNumbers";
      int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
      id v14 = [v12 _crossPlatformUnifiedMeContactWithKeysToFetch:v13 error:0];

      id v15 = [*(id *)(a1 + 32) logger];
      [v15 changedMeContact:v14];
    }
  }
}

- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 shouldFailIfAccountNotYetSynced]
    && ![(CNContactStore *)self hasAccountFirstSyncCompleted])
  {
    id v11 = +[CNErrorFactory errorWithCode:1007];
    id v12 = v11;
    if (a4) {
      *a4 = v11;
    }

    char v10 = 0;
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__18;
    uint64_t v28 = __Block_byref_object_dispose__18;
    id v29 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    id v21 = __Block_byref_object_copy__18;
    id v22 = __Block_byref_object_dispose__18;
    id v23 = 0;
    uint64_t v7 = [(CNDataMapperContactStore *)self logger];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__CNDataMapperContactStore_contactCountForFetchRequest_error___block_invoke;
    v14[3] = &unk_1E56B6EB0;
    v14[4] = self;
    id v16 = &v18;
    int v17 = &v24;
    id v15 = v6;
    [v7 fetchingContactCount:v14];

    uint64_t v8 = (void *)v19[5];
    id v9 = (id)v25[5];
    char v10 = v9;
    if (a4 && !v9) {
      *a4 = v8;
    }

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }

  return v10;
}

void __62__CNDataMapperContactStore_contactCountForFetchRequest_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 requestContactsReadAccessWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) mapper];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(id *)(v7 + 40);
    uint64_t v8 = [v5 contactCountForFetchRequest:v6 error:&v11];
    objc_storeStrong((id *)(v7 + 40), v11);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    char v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (BOOL)moveContacts:(id)a3 fromContainer:(id)a4 toContainer:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__18;
  uint64_t v33 = __Block_byref_object_dispose__18;
  id v34 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  int v13 = [(CNDataMapperContactStore *)self logger];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __73__CNDataMapperContactStore_moveContacts_fromContainer_toContainer_error___block_invoke;
  v19[3] = &unk_1E56B6F50;
  v19[4] = self;
  id v23 = &v29;
  uint64_t v24 = &v25;
  id v14 = v10;
  id v20 = v14;
  id v15 = v11;
  id v21 = v15;
  id v16 = v12;
  id v22 = v16;
  [v13 fetchingContactSectionCounts:v19];

  int v17 = *((unsigned __int8 *)v26 + 24);
  if (a6 && !*((unsigned char *)v26 + 24)) {
    *a6 = (id) v30[5];
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v17 != 0;
}

void __73__CNDataMapperContactStore_moveContacts_fromContainer_toContainer_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 requestContactsWriteAccessWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) mapper];
    char v6 = objc_opt_respondsToSelector();

    uint64_t v7 = [*(id *)(a1 + 32) mapper];
    if (v6)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
      id v16 = *(id *)(v11 + 40);
      char v12 = [v7 moveContacts:v8 fromContainer:v9 toContainer:v10 error:&v16];
      objc_storeStrong((id *)(v11 + 40), v16);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v12;
    }
    else
    {
      uint64_t v13 = +[CNErrorFactory errorObject:v7 doesNotImplementSelector:sel_moveContacts_fromContainer_toContainer_error_];
      uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
}

uint64_t __79__CNDataMapperContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke_58()
{
  unifiedContactsMatchingPredicate_keysToFetch_error__cn_once_object_6 = (uint64_t)os_log_create("com.apple.runtime-issues", "Contacts");

  return MEMORY[0x1F41817F8]();
}

uint64_t __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [MEMORY[0x1E4F5A3B8] eitherWithRight:a2];

  return MEMORY[0x1F41817F8]();
}

uint64_t __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [MEMORY[0x1E4F5A3B8] eitherWithBool:1 error:0];

  return MEMORY[0x1F41817F8]();
}

id __69__CNDataMapperContactStore_contactsForFetchRequest_matchInfos_error___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  char v6 = [v5 second];

  if (v6)
  {
    uint64_t v7 = [v5 second];
    uint64_t v8 = [v5 first];
    uint64_t v9 = [v8 identifier];
    [v4 setObject:v7 forKeyedSubscript:v9];
  }

  return v4;
}

- (id)executeFetchRequest:(id)a3 progressiveResults:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  +[CNAPITriageLogger setThreadEntryPoint:a2];
  char v12 = +[CNAPITriageLogger os_log];
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  uint64_t v14 = +[CNAPITriageLogger os_log];
  id v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "Fetching", "", buf, 2u);
  }

  id v16 = objc_alloc_init(MEMORY[0x1E4F5A508]);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __78__CNDataMapperContactStore_executeFetchRequest_progressiveResults_completion___block_invoke;
  v36[3] = &__block_descriptor_40_e5_v8__0l;
  v36[4] = v13;
  int v17 = (void *)[v36 copy];
  uint64_t v18 = self;
  uint64_t v19 = _Block_copy(v18);
  [v16 push:v19];

  id v20 = objc_alloc_init(MEMORY[0x1E4F5A368]);
  id v21 = [(CNDataMapperContactStore *)self logger];
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  uint64_t v29 = __78__CNDataMapperContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_90;
  id v30 = &unk_1E56B70B0;
  id v34 = v11;
  id v31 = v9;
  uint64_t v32 = self;
  id v22 = v20;
  id v33 = v22;
  id v35 = v10;
  [v21 fetchingContacts:&v27];

  id v23 = v35;
  id v24 = v22;

  objc_msgSend(v16, "popAllWithHandler:", &__block_literal_global_96, v27, v28, v29, v30);
  id v25 = self;

  return v24;
}

void __78__CNDataMapperContactStore_executeFetchRequest_progressiveResults_completion___block_invoke(uint64_t a1)
{
  +[CNAPITriageLogger setThreadEntryPoint:0];
  uint64_t v2 = +[CNAPITriageLogger os_log];
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", "", v5, 2u);
  }
}

void __78__CNDataMapperContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_90(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__CNDataMapperContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_2;
  aBlock[3] = &unk_1E56B57A0;
  id v18 = *(id *)(a1 + 56);
  os_signpost_id_t v4 = _Block_copy(aBlock);
  id v5 = [*(id *)(a1 + 32) predicate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v7 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78__CNDataMapperContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_3;
    v11[3] = &unk_1E56B7088;
    id v14 = v3;
    id v12 = *(id *)(a1 + 48);
    id v15 = v4;
    int8x16_t v10 = *(int8x16_t *)(a1 + 32);
    id v8 = (id)v10.i64[0];
    int8x16_t v13 = vextq_s8(v10, v10, 8uLL);
    id v16 = *(id *)(a1 + 64);
    [v7 requestReadAccessForEntityType:0 completionHandler:v11];

    id v9 = v14;
  }
  else
  {
    id v9 = +[CNErrorFactory errorWithCode:400 userInfo:0];
    (*((void (**)(void *, void *))v4 + 2))(v4, v9);
  }
}

uint64_t __78__CNDataMapperContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__CNDataMapperContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  a3;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0)
  {
    if (a2)
    {
      id v5 = [*(id *)(a1 + 40) mapper];
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        uint64_t v7 = [*(id *)(a1 + 40) mapper];
        id v8 = [v7 executeFetchRequest:*(void *)(a1 + 48) progressiveResults:*(void *)(a1 + 72) completion:*(void *)(a1 + 64)];

        if (v8) {
          [*(id *)(a1 + 32) addCancelable:v8];
        }
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }

  return MEMORY[0x1F41817F8]();
}

uint64_t __78__CNDataMapperContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__18;
  uint64_t v27 = __Block_byref_object_dispose__18;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__18;
  id v21 = __Block_byref_object_dispose__18;
  id v22 = 0;
  uint64_t v7 = [(CNDataMapperContactStore *)self logger];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__CNDataMapperContactStore_groupsMatchingPredicate_error___block_invoke;
  v13[3] = &unk_1E56B6EB0;
  v13[4] = self;
  id v15 = &v17;
  id v16 = &v23;
  id v8 = v6;
  id v14 = v8;
  [v7 fetchingGroups:v13];

  id v9 = (void *)v18[5];
  id v10 = (id)v24[5];
  id v11 = v10;
  if (a4 && !v10) {
    *a4 = v9;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __58__CNDataMapperContactStore_groupsMatchingPredicate_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 requestMetadataAccessWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) mapper];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(id *)(v7 + 40);
    uint64_t v8 = [v5 groupsMatchingPredicate:v6 error:&v11];
    objc_storeStrong((id *)(v7 + 40), v11);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (id)groupWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__18;
  uint64_t v27 = __Block_byref_object_dispose__18;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__18;
  id v21 = __Block_byref_object_dispose__18;
  id v22 = 0;
  uint64_t v7 = [(CNDataMapperContactStore *)self logger];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__CNDataMapperContactStore_groupWithIdentifier_error___block_invoke;
  v13[3] = &unk_1E56B6EB0;
  v13[4] = self;
  id v15 = &v17;
  id v16 = &v23;
  id v8 = v6;
  id v14 = v8;
  [v7 fetchingGroups:v13];

  uint64_t v9 = (void *)v18[5];
  id v10 = (id)v24[5];
  id v11 = v10;
  if (a4 && !v10) {
    *a4 = v9;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __54__CNDataMapperContactStore_groupWithIdentifier_error___block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 requestMetadataAccessWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) mapper];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v7 = [*(id *)(a1 + 32) mapper];
      v23[0] = *(void *)(a1 + 40);
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      id v20 = *(id *)(v9 + 40);
      id v10 = [v7 groupsWithIdentifiers:v8 error:&v20];
      objc_storeStrong((id *)(v9 + 40), v20);
      uint64_t v11 = [v10 firstObject];
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
      int8x16_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
    else
    {
      uint64_t v22 = *(void *)(a1 + 40);
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
      uint64_t v7 = +[CNGroup predicateForGroupsWithIdentifiers:v14];

      id v15 = *(void **)(a1 + 32);
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
      id v19 = *(id *)(v16 + 40);
      id v8 = [v15 groupsMatchingPredicate:v7 error:&v19];
      objc_storeStrong((id *)(v16 + 40), v19);
      uint64_t v17 = [v8 firstObject];
      uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
      id v10 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
  }
}

- (id)membersOfGroupWithIdentifier:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__18;
  uint64_t v32 = __Block_byref_object_dispose__18;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__18;
  uint64_t v26 = __Block_byref_object_dispose__18;
  id v27 = 0;
  id v10 = [(CNDataMapperContactStore *)self logger];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__CNDataMapperContactStore_membersOfGroupWithIdentifier_keysToFetch_error___block_invoke;
  v17[3] = &unk_1E56B6FA0;
  v17[4] = self;
  id v20 = &v22;
  id v11 = v8;
  id v18 = v11;
  id v12 = v9;
  id v19 = v12;
  id v21 = &v28;
  [v10 fetchingContacts:v17];

  int8x16_t v13 = (void *)v23[5];
  id v14 = (id)v29[5];
  id v15 = v14;
  if (a5 && !v14) {
    *a5 = v13;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v15;
}

void __75__CNDataMapperContactStore_membersOfGroupWithIdentifier_keysToFetch_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 requestContactsReadAccessWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    id v5 = +[CNContact predicateForContactsInGroupWithIdentifier:a1[5]];
    char v6 = [[CNContactFetchRequest alloc] initWithKeysToFetch:a1[6]];
    [(CNContactFetchRequest *)v6 setPredicate:v5];
    uint64_t v7 = (void *)a1[4];
    uint64_t v8 = *(void *)(a1[7] + 8);
    id v12 = *(id *)(v8 + 40);
    uint64_t v9 = [v7 contactsForFetchRequest:v6 matchInfos:0 error:&v12];
    objc_storeStrong((id *)(v8 + 40), v12);
    uint64_t v10 = *(void *)(a1[8] + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__18;
  id v27 = __Block_byref_object_dispose__18;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__18;
  id v21 = __Block_byref_object_dispose__18;
  id v22 = 0;
  uint64_t v7 = [(CNDataMapperContactStore *)self logger];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__CNDataMapperContactStore_subgroupsOfGroupWithIdentifier_error___block_invoke;
  v13[3] = &unk_1E56B6EB0;
  v13[4] = self;
  id v15 = &v17;
  uint64_t v16 = &v23;
  id v8 = v6;
  id v14 = v8;
  [v7 fetchingGroups:v13];

  uint64_t v9 = (void *)v18[5];
  id v10 = (id)v24[5];
  id v11 = v10;
  if (a4 && !v10) {
    *a4 = v9;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __65__CNDataMapperContactStore_subgroupsOfGroupWithIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 requestMetadataAccessWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) mapper];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(id *)(v7 + 40);
    uint64_t v8 = [v5 subgroupsOfGroupWithIdentifier:v6 error:&v11];
    objc_storeStrong((id *)(v7 + 40), v11);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (id)contactsInContainerWithIdentifier:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)containersMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__18;
  id v27 = __Block_byref_object_dispose__18;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__18;
  id v21 = __Block_byref_object_dispose__18;
  id v22 = 0;
  uint64_t v7 = [(CNDataMapperContactStore *)self logger];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__CNDataMapperContactStore_containersMatchingPredicate_error___block_invoke;
  v13[3] = &unk_1E56B6EB0;
  v13[4] = self;
  id v15 = &v17;
  uint64_t v16 = &v23;
  id v8 = v6;
  id v14 = v8;
  [v7 fetchingContainers:v13];

  uint64_t v9 = (void *)v18[5];
  id v10 = (id)v24[5];
  id v11 = v10;
  if (a4 && !v10) {
    *a4 = v9;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __62__CNDataMapperContactStore_containersMatchingPredicate_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 requestMetadataAccessWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) mapper];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(id *)(v7 + 40);
    uint64_t v8 = [v5 containersMatchingPredicate:v6 error:&v11];
    objc_storeStrong((id *)(v7 + 40), v11);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__18;
  id v27 = __Block_byref_object_dispose__18;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__18;
  id v21 = __Block_byref_object_dispose__18;
  id v22 = 0;
  uint64_t v7 = [(CNDataMapperContactStore *)self logger];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__CNDataMapperContactStore_serverSearchContainersMatchingPredicate_error___block_invoke;
  v13[3] = &unk_1E56B6EB0;
  v13[4] = self;
  id v15 = &v17;
  uint64_t v16 = &v23;
  id v8 = v6;
  id v14 = v8;
  [v7 fetchingContainers:v13];

  uint64_t v9 = (void *)v18[5];
  id v10 = (id)v24[5];
  id v11 = v10;
  if (a4 && !v10) {
    *a4 = v9;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __74__CNDataMapperContactStore_serverSearchContainersMatchingPredicate_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 requestMetadataAccessWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) mapper];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(id *)(v7 + 40);
    uint64_t v8 = [v5 serverSearchContainersMatchingPredicate:v6 error:&v11];
    objc_storeStrong((id *)(v7 + 40), v11);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (id)policyWithDescription:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__18;
  id v27 = __Block_byref_object_dispose__18;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__18;
  id v21 = __Block_byref_object_dispose__18;
  id v22 = 0;
  uint64_t v7 = [(CNDataMapperContactStore *)self logger];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__CNDataMapperContactStore_policyWithDescription_error___block_invoke;
  v13[3] = &unk_1E56B6EB0;
  v13[4] = self;
  id v15 = &v17;
  uint64_t v16 = &v23;
  id v8 = v6;
  id v14 = v8;
  [v7 fetchingContainers:v13];

  uint64_t v9 = (void *)v18[5];
  id v10 = (id)v24[5];
  id v11 = v10;
  if (a4 && !v10) {
    *a4 = v9;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __56__CNDataMapperContactStore_policyWithDescription_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 requestMetadataAccessWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) mapper];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(id *)(v7 + 40);
    uint64_t v8 = [v5 policyWithDescription:v6 error:&v11];
    objc_storeStrong((id *)(v7 + 40), v11);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (id)usedLabelsForPropertyWithKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CNDataMapperContactStore *)self mapper];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(CNDataMapperContactStore *)self mapper];
    id v10 = [v9 usedLabelsForPropertyWithKey:v6 error:a4];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(CNDataMapperContactStore *)self requestMetadataAccessWithError:a4])
  {
    uint64_t v7 = [(CNDataMapperContactStore *)self mapper];
    char v8 = [v7 accountsMatchingPredicate:v6 error:a4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  return [(CNDataMapperContactStore *)self executeSaveRequest:a3 response:0 authorizationContext:0 error:a4];
}

- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = os_log_create("com.apple.contacts", "api-triage");
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  id v12 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  int8x16_t v13 = [v12 timeProvider];
  [v13 timestamp];
  double v15 = v14;

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1909E3000, v10, OS_LOG_TYPE_DEFAULT, "Will save", buf, 2u);
  }
  uint64_t v16 = v10;
  uint64_t v17 = v16;
  unint64_t v18 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Saving Contacts", "", buf, 2u);
  }

  os_signpost_id_t v19 = v11;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  *(void *)buf = 0;
  v48[0] = buf;
  v48[1] = 0x3032000000;
  v48[2] = __Block_byref_object_copy__18;
  v48[3] = __Block_byref_object_dispose__18;
  id v49 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  id v44 = __Block_byref_object_copy__18;
  v45 = __Block_byref_object_dispose__18;
  id v46 = 0;
  id v20 = [(CNDataMapperContactStore *)self logger];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __83__CNDataMapperContactStore_executeSaveRequest_response_authorizationContext_error___block_invoke;
  v35[3] = &unk_1E56B70D8;
  v35[4] = self;
  id v38 = buf;
  id v32 = v8;
  id v36 = v32;
  id v21 = v9;
  id v37 = v21;
  v39 = &v50;
  uint64_t v40 = &v41;
  [v20 saving:v35];

  id v22 = v17;
  uint64_t v23 = v22;
  if (v18 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v22))
  {
    *(_WORD *)v54 = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v23, OS_SIGNPOST_INTERVAL_END, v19, "Saving Contacts", "", v54, 2u);
  }

  if (a4) {
    *a4 = (id) v42[5];
  }
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4F5A3D8], "currentEnvironment", v32);
  uint64_t v25 = [v24 timeProvider];
  [v25 timestamp];
  double v27 = v26;

  id v28 = [MEMORY[0x1E4F5A530] stringForTimeInterval:v27 - v15];
  if (*((unsigned char *)v51 + 24))
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v54 = 138543362;
      v55 = v28;
      _os_log_impl(&dword_1909E3000, v23, OS_LOG_TYPE_DEFAULT, "Did save successfully (%{public}@)", v54, 0xCu);
    }
  }
  else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    -[CNDataMapperContactStore executeSaveRequest:response:authorizationContext:error:]((uint64_t)v28, (uint64_t)v48, v23);
  }
  int v29 = *((unsigned __int8 *)v51 + 24);
  if (a6 && !*((unsigned char *)v51 + 24)) {
    *a6 = *(id *)(v48[0] + 40);
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v50, 8);
  return v29 != 0;
}

void __83__CNDataMapperContactStore_executeSaveRequest_response_authorizationContext_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 requestContactsWriteAccessWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v29 = *(id *)(v8 + 40);
    int v9 = [v5 isValidSaveRequest:v6 authorizationContext:v7 error:&v29];
    objc_storeStrong((id *)(v8 + 40), v29);
    if (v9)
    {
      char v10 = [*(id *)(a1 + 40) suppressChangeNotifications];
      if ((v10 & 1) == 0)
      {
        os_signpost_id_t v11 = +[CNChangesNotifier sharedNotifier];
        [v11 willSaveChanges];
      }
      id v12 = +[CNChangeHistoryTriageLogger saveLogger];
      [v12 willExecuteSaveRequest];
      [*(id *)(a1 + 40) acceptChangeHistoryEventVisitor:v12];
      int8x16_t v13 = [*(id *)(a1 + 32) mapper];
      uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
      double v15 = *(void **)(v14 + 40);
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = *(void *)(a1 + 48);
      uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
      id v27 = *(id *)(v18 + 40);
      id v28 = v15;
      char v19 = [v13 executeSaveRequest:v16 response:&v28 authorizationContext:v17 error:&v27];
      objc_storeStrong((id *)(v14 + 40), v28);
      objc_storeStrong((id *)(v18 + 40), v27);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v19;

      [v12 didExecuteSaveRequest];
      if ((v10 & 1) == 0)
      {
        id v20 = +[CNChangesNotifier sharedNotifier];
        uint64_t v21 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        uint64_t v22 = *(void *)(a1 + 32);
        uint64_t v23 = [*(id *)(a1 + 40) saveRequestIdentifier];
        [v20 didSaveChangesSuccessfully:v21 fromContactStore:v22 requestIdentifier:v23];

        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
        {
          if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) didAffectMeCard])
          {
            uint64_t v24 = +[CNChangesNotifier sharedNotifier];
            uint64_t v25 = *(void *)(a1 + 32);
            double v26 = [*(id *)(a1 + 40) saveRequestIdentifier];
            [v24 didChangeMeContactSuccessfully:1 fromContactStore:v25 requestIdentifier:v26];
          }
        }
      }
    }
  }
}

- (BOOL)isValidSaveRequest:(id)a3 authorizationContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [(id)objc_opt_class() storeIdentifier];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__18;
  id v28 = __Block_byref_object_dispose__18;
  id v29 = 0;
  char v10 = [v7 addedContactsByContainerIdentifier];
  os_signpost_id_t v11 = [v10 allValues];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __74__CNDataMapperContactStore_isValidSaveRequest_authorizationContext_error___block_invoke;
  v21[3] = &unk_1E56B7128;
  id v12 = v9;
  id v22 = v12;
  uint64_t v23 = &v24;
  int v13 = objc_msgSend(v11, "_cn_all:", v21);

  if (v13)
  {
    uint64_t v14 = (id *)(v25 + 5);
    id obj = (id)v25[5];
    BOOL v15 = +[CNSaveRequestVerifier isValidSaveRequest:v7 error:&obj];
    objc_storeStrong(v14, obj);
    char v16 = !v15;
    if (!v8) {
      char v16 = 1;
    }
    if ((v16 & 1) == 0)
    {
      uint64_t v17 = (id *)(v25 + 5);
      id v19 = (id)v25[5];
      BOOL v15 = +[CNSaveRequestVerifier isSaveRequest:v7 authorizedForSavingWithContext:v8 error:&v19];
      objc_storeStrong(v17, v19);
    }
  }
  else
  {
    BOOL v15 = 0;
  }
  if (a5 && !v15) {
    *a5 = (id) v25[5];
  }

  _Block_object_dispose(&v24, 8);
  return v15;
}

uint64_t __74__CNDataMapperContactStore_isValidSaveRequest_authorizationContext_error___block_invoke(uint64_t a1, void *a2)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__CNDataMapperContactStore_isValidSaveRequest_authorizationContext_error___block_invoke_2;
  v8[3] = &unk_1E56B7100;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  uint64_t v6 = objc_msgSend(a2, "_cn_all:", v8);

  return v6;
}

uint64_t __74__CNDataMapperContactStore_isValidSaveRequest_authorizationContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 storeIdentifier];
  if ((v4 || *(void *)(a1 + 32))
    && ([v3 storeIdentifier],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isEqual:*(void *)(a1 + 32)],
        v5,
        v4,
        (v6 & 1) == 0))
  {
    id v14 = v3;
    BOOL v15 = @"CNInvalidRecords";
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    v16[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v10 = +[CNErrorFactory errorWithCode:302 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (id)defaultContainerIdentifier
{
  id v3 = 0;
  if ([(CNDataMapperContactStore *)self requestMetadataAccessWithError:0])
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000;
    uint64_t v10 = __Block_byref_object_copy__18;
    uint64_t v11 = __Block_byref_object_dispose__18;
    id v12 = 0;
    id v4 = [(CNDataMapperContactStore *)self logger];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__CNDataMapperContactStore_defaultContainerIdentifier__block_invoke;
    v6[3] = &unk_1E56B7150;
    v6[4] = self;
    v6[5] = &v7;
    [v4 fetchingDefaultContainerIdentifier:v6];

    id v3 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }

  return v3;
}

void __54__CNDataMapperContactStore_defaultContainerIdentifier__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) mapper];
  uint64_t v2 = [v5 defaultContainerIdentifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)legacyTetheredSyncDeviceAnchor
{
  uint64_t v3 = [(CNDataMapperContactStore *)self mapper];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = 0;
    if ([(CNDataMapperContactStore *)self requestMetadataAccessWithError:0])
    {
      char v6 = [(CNDataMapperContactStore *)self mapper];
      id v5 = [v6 legacyTetheredSyncDeviceAnchor];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)setLegacyTetheredSyncDeviceAnchor:(id)a3
{
  id v7 = a3;
  char v4 = [(CNDataMapperContactStore *)self mapper];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0
    && [(CNDataMapperContactStore *)self requestMetadataAccessWithError:0])
  {
    char v6 = [(CNDataMapperContactStore *)self mapper];
    [v6 setLegacyTetheredSyncDeviceAnchor:v7];
  }
}

- (id)legacyTetheredSyncComputerAnchor
{
  uint64_t v3 = [(CNDataMapperContactStore *)self mapper];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = 0;
    if ([(CNDataMapperContactStore *)self requestMetadataAccessWithError:0])
    {
      char v6 = [(CNDataMapperContactStore *)self mapper];
      char v5 = [v6 legacyTetheredSyncComputerAnchor];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)setLegacyTetheredSyncComputerAnchor:(id)a3
{
  id v7 = a3;
  char v4 = [(CNDataMapperContactStore *)self mapper];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0
    && [(CNDataMapperContactStore *)self requestMetadataAccessWithError:0])
  {
    char v6 = [(CNDataMapperContactStore *)self mapper];
    [v6 setLegacyTetheredSyncComputerAnchor:v7];
  }
}

- (id)contactWithUserActivityUserInfo:(id)a3 keysToFetch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A270] + 16))() & 1) != 0
    || ([(CNDataMapperContactStore *)self mapper],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = objc_opt_respondsToSelector(),
        v8,
        (v9 & 1) == 0))
  {
    id v10 = 0;
  }
  else
  {
    id v10 = 0;
    if ([(CNDataMapperContactStore *)self requestContactsReadAccessWithError:0])
    {
      uint64_t v17 = 0;
      uint64_t v18 = &v17;
      uint64_t v19 = 0x3032000000;
      id v20 = __Block_byref_object_copy__18;
      uint64_t v21 = __Block_byref_object_dispose__18;
      id v22 = 0;
      uint64_t v11 = [(CNDataMapperContactStore *)self logger];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __72__CNDataMapperContactStore_contactWithUserActivityUserInfo_keysToFetch___block_invoke;
      v13[3] = &unk_1E56B7178;
      v13[4] = self;
      char v16 = &v17;
      id v14 = v6;
      id v15 = v7;
      [v11 fetchingContactWithUserActivity:v13];

      id v10 = (id)v18[5];
      _Block_object_dispose(&v17, 8);
    }
  }

  return v10;
}

void __72__CNDataMapperContactStore_contactWithUserActivityUserInfo_keysToFetch___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mapper];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v7 = [*(id *)(a1 + 32) mapper];
    uint64_t v4 = [v7 contactWithUserActivityUserInfo:*(void *)(a1 + 40) keysToFetch:*(void *)(a1 + 48)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)userActivityUserInfoForContact:(id)a3
{
  id v4 = a3;
  id v5 = 0;
  if ([(CNDataMapperContactStore *)self requestContactsReadAccessWithError:0])
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__18;
    id v15 = __Block_byref_object_dispose__18;
    id v16 = 0;
    id v6 = [(CNDataMapperContactStore *)self logger];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__CNDataMapperContactStore_userActivityUserInfoForContact___block_invoke;
    v8[3] = &unk_1E56B71A0;
    void v8[4] = self;
    id v10 = &v11;
    id v9 = v4;
    [v6 fetchingContactWithUserActivity:v8];

    id v5 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }

  return v5;
}

void __59__CNDataMapperContactStore_userActivityUserInfoForContact___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mapper];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v7 = [*(id *)(a1 + 32) mapper];
    uint64_t v4 = [v7 userActivityUserInfoForContact:*(void *)(a1 + 40)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (BOOL)supportsMatchingDictionaries
{
  uint64_t v2 = [(CNDataMapperContactStore *)self mapper];
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (id)descriptorForRequiredKeysForMatchingDictionary
{
  char v3 = [(CNDataMapperContactStore *)self mapper];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(CNDataMapperContactStore *)self mapper];
    id v6 = [v5 descriptorForRequiredKeysForMatchingDictionary];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)contactIdentifierWithMatchingDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNDataMapperContactStore *)self mapper];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = 0;
    if ([(CNDataMapperContactStore *)self requestContactsReadAccessWithError:0])
    {
      uint64_t v13 = 0;
      id v14 = &v13;
      uint64_t v15 = 0x3032000000;
      id v16 = __Block_byref_object_copy__18;
      uint64_t v17 = __Block_byref_object_dispose__18;
      id v18 = 0;
      id v8 = [(CNDataMapperContactStore *)self logger];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __68__CNDataMapperContactStore_contactIdentifierWithMatchingDictionary___block_invoke;
      v10[3] = &unk_1E56B71C8;
      id v12 = &v13;
      v10[4] = self;
      id v11 = v4;
      [v8 fetchingContactIdentifierWithMatchingDictionary:v10];

      id v7 = (id)v14[5];
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __68__CNDataMapperContactStore_contactIdentifierWithMatchingDictionary___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) mapper];
  uint64_t v2 = [v5 contactIdentifierWithMatchingDictionary:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)matchingDictionaryForContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNDataMapperContactStore *)self mapper];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = 0;
    if ([(CNDataMapperContactStore *)self requestContactsReadAccessWithError:0])
    {
      id v8 = [(CNDataMapperContactStore *)self mapper];
      id v7 = [v8 matchingDictionaryForContact:v4];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)registerChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CNDataMapperContactStore *)self mapper];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__18;
    uint64_t v24 = __Block_byref_object_dispose__18;
    id v25 = 0;
    id v12 = [(CNDataMapperContactStore *)self logger];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __95__CNDataMapperContactStore_registerChangeHistoryClientIdentifier_forContainerIdentifier_error___block_invoke;
    v15[3] = &unk_1E56B6F28;
    v15[4] = self;
    id v18 = &v20;
    uint64_t v19 = &v26;
    id v16 = v8;
    id v17 = v9;
    [v12 registeringForChangeHistory:v15];

    BOOL v13 = *((unsigned char *)v27 + 24) != 0;
    if (a5 && !*((unsigned char *)v27 + 24)) {
      *a5 = (id) v21[5];
    }

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

void __95__CNDataMapperContactStore_registerChangeHistoryClientIdentifier_forContainerIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 requestMetadataAccessWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) mapper];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(id *)(v8 + 40);
    char v9 = [v5 registerChangeHistoryClientIdentifier:v6 forContainerIdentifier:v7 error:&v10];
    objc_storeStrong((id *)(v8 + 40), v10);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v9;
  }
}

- (BOOL)unregisterChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CNDataMapperContactStore *)self mapper];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__18;
    uint64_t v24 = __Block_byref_object_dispose__18;
    id v25 = 0;
    id v12 = [(CNDataMapperContactStore *)self logger];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __97__CNDataMapperContactStore_unregisterChangeHistoryClientIdentifier_forContainerIdentifier_error___block_invoke;
    v15[3] = &unk_1E56B6F28;
    v15[4] = self;
    id v18 = &v20;
    uint64_t v19 = &v26;
    id v16 = v8;
    id v17 = v9;
    [v12 unregisteringForChangeHistory:v15];

    BOOL v13 = *((unsigned char *)v27 + 24) != 0;
    if (a5 && !*((unsigned char *)v27 + 24)) {
      *a5 = (id) v21[5];
    }

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

void __97__CNDataMapperContactStore_unregisterChangeHistoryClientIdentifier_forContainerIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 requestMetadataAccessWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) mapper];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(id *)(v8 + 40);
    char v9 = [v5 unregisterChangeHistoryClientIdentifier:v6 forContainerIdentifier:v7 error:&v10];
    objc_storeStrong((id *)(v8 + 40), v10);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v9;
  }
}

- (id)changeHistoryWithFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CNDataMapperContactStore *)self mapper];
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
  {
    id v16 = 0;
    goto LABEL_18;
  }
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__18;
  uint64_t v43 = __Block_byref_object_dispose__18;
  id v44 = 0;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__18;
  id v37 = __Block_byref_object_dispose__18;
  id v38 = 0;
  char v9 = +[CNChangeHistoryTriageLogger fetchLogger];
  [v9 willFetchHistoryWithRequest:v6];
  id v10 = [(CNDataMapperContactStore *)self logger];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  id v27 = __64__CNDataMapperContactStore_changeHistoryWithFetchRequest_error___block_invoke;
  uint64_t v28 = &unk_1E56B6EB0;
  char v29 = self;
  id v31 = &v33;
  id v32 = &v39;
  id v11 = v6;
  id v30 = v11;
  [v10 fetchingChangeHistory:&v25];

  uint64_t v12 = objc_msgSend(v11, "resultType", v25, v26, v27, v28, v29);
  if (v40[5])
  {
    uint64_t v13 = v12;
    if (![v11 resultType] || v13 == 2)
    {
      id v17 = [CNChangeHistoryLegacyResultConverter alloc];
      id v18 = [v11 additionalContactKeyDescriptors];
      uint64_t v15 = [(CNChangeHistoryLegacyResultConverter *)v17 initWithContactStore:self additionalContactKeyDescriptors:v18];

      uint64_t v19 = [(CNChangeHistoryLegacyResultConverter *)v15 eventsFromResult:v40[5]];
      if ([v19 isSuccess])
      {
        uint64_t v20 = [v19 value];
        uint64_t v21 = [(id)v40[5] latestChangeAnchor];
        [v9 didFetchHistoryEvents:v20 anchor:v21];
      }
      else
      {
        uint64_t v20 = [v19 error];
        [v9 fetchDidFailWithError:v20];
      }
    }
    else
    {
      if ([v11 resultType] != 1) {
        goto LABEL_14;
      }
      uint64_t v14 = [(id)v40[5] changesCount];
      uint64_t v15 = [(id)v40[5] latestChangeAnchor];
      objc_msgSend(v9, "didFetchHistoryEventsCount:anchor:truncated:", v14, v15, objc_msgSend((id)v40[5], "changesTruncated"));
    }
  }
  else
  {
    [v9 fetchDidFailWithError:v34[5]];
  }
LABEL_14:
  uint64_t v22 = (void *)v34[5];
  id v23 = (id)v40[5];
  id v16 = v23;
  if (a4 && !v23) {
    *a4 = v22;
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

LABEL_18:

  return v16;
}

void __64__CNDataMapperContactStore_changeHistoryWithFetchRequest_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 requestContactsReadAccessWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) mapper];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(id *)(v7 + 40);
    uint64_t v8 = [v5 changeHistoryWithFetchRequest:v6 error:&v11];
    objc_storeStrong((id *)(v7 + 40), v11);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (BOOL)executeChangeHistoryClearRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CNDataMapperContactStore *)self mapper];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__18;
    uint64_t v20 = __Block_byref_object_dispose__18;
    id v21 = 0;
    uint64_t v9 = [(CNDataMapperContactStore *)self logger];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__CNDataMapperContactStore_executeChangeHistoryClearRequest_error___block_invoke;
    v12[3] = &unk_1E56B6EB0;
    v12[4] = self;
    uint64_t v14 = &v16;
    uint64_t v15 = &v22;
    id v13 = v6;
    [v9 clearingChangeHistory:v12];

    BOOL v10 = *((unsigned char *)v23 + 24) != 0;
    if (a4 && !*((unsigned char *)v23 + 24)) {
      *a4 = (id) v17[5];
    }

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __67__CNDataMapperContactStore_executeChangeHistoryClearRequest_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 requestMetadataAccessWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) mapper];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(id *)(v7 + 40);
    char v8 = [v5 executeChangeHistoryClearRequest:v6 error:&v9];
    objc_storeStrong((id *)(v7 + 40), v9);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;
  }
}

- (BOOL)hasMultipleGroupsOrAccounts
{
  uint64_t v3 = [(CNDataMapperContactStore *)self mapper];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0
    || ![(CNDataMapperContactStore *)self requestMetadataAccessWithError:0])
  {
    return 0;
  }
  id v5 = [(CNDataMapperContactStore *)self mapper];
  char v6 = [v5 hasMultipleGroupsOrAccounts];

  return v6;
}

- (BOOL)hasGroups
{
  uint64_t v3 = [(CNDataMapperContactStore *)self mapper];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0
    || ![(CNDataMapperContactStore *)self requestMetadataAccessWithError:0])
  {
    return 0;
  }
  id v5 = [(CNDataMapperContactStore *)self mapper];
  char v6 = [v5 hasGroups];

  return v6;
}

- (id)getBackgroundColorOnImageData:(id)a3 bitmapFormat:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(CNDataMapperContactStore *)self mapper];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__18;
    id v34 = __Block_byref_object_dispose__18;
    id v35 = 0;
    uint64_t v24 = 0;
    char v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = __Block_byref_object_copy__18;
    uint64_t v28 = __Block_byref_object_dispose__18;
    id v29 = 0;
    uint64_t v12 = [(CNDataMapperContactStore *)self logger];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __77__CNDataMapperContactStore_getBackgroundColorOnImageData_bitmapFormat_error___block_invoke;
    v19[3] = &unk_1E56B71F0;
    uint64_t v22 = &v30;
    v19[4] = self;
    id v20 = v8;
    id v21 = v9;
    id v23 = &v24;
    [v12 gettingBackgroundColor:v19];

    id v13 = (void *)v25[5];
    id v14 = (id)v31[5];
    uint64_t v15 = v14;
    if (a5 && !v14) {
      *a5 = v13;
    }

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    uint64_t v16 = +[CNErrorFactory errorWithCode:1005];
    id v17 = v16;
    if (a5) {
      *a5 = v16;
    }

    uint64_t v15 = 0;
  }

  return v15;
}

void __77__CNDataMapperContactStore_getBackgroundColorOnImageData_bitmapFormat_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mapper];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v2 getBackgroundColorOnImageData:v3 bitmapFormat:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (void)requestReadAccessForEntityType:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v6 = (void (**)(id, uint64_t, void))a4;
  if ([(CNDataMapperContactStore *)self isContactProvider]) {
    v6[2](v6, 1, 0);
  }
  uint64_t v7 = [(CNDataMapperContactStore *)self mapper];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__CNDataMapperContactStore_requestReadAccessForEntityType_completionHandler___block_invoke;
  v9[3] = &unk_1E56B7268;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 requestAccessForEntityType:a3 completionHandler:v9];
}

void __77__CNDataMapperContactStore_requestReadAccessForEntityType_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = v7;
  if (a3 || !a2) {
    [v6 _logContactsAccessWasDeniedForAccessType:0 error:v7];
  }
  else {
    objc_msgSend(v6, "_logContactsAccessWasGrantedForAccessType:", 0, v7);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)requestContactsWriteAccessWithError:(id *)a3
{
  return [(CNDataMapperContactStore *)self _requestDataMapperAccessType:1 error:a3];
}

- (void)_logContactsAccessWasDeniedForAccessType:(unint64_t)a3 error:(id)a4
{
  id v8 = a4;
  uint64_t v5 = [(CNDataMapperContactStore *)self mapper];
  int v6 = [v5 shouldLogContactsAccess];

  if (v6)
  {
    id v7 = [(CNDataMapperContactStore *)self logger];
    [v7 contactsAccessWasDeniedWithError:v8];
  }
}

- (id)fetchLimitedAccessContactIdentifiersForBundle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNDataMapperContactStore *)self mapper];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0
    && ([(CNDataMapperContactStore *)self mapper],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        (v8 & 1) != 0))
  {
    id v9 = [(CNDataMapperContactStore *)self mapper];
    id v10 = [v9 fetchLimitedAccessContactIdentifiersForBundle:v4];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (void)addLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(CNDataMapperContactStore *)self mapper];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(CNDataMapperContactStore *)self mapper];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      char v11 = [(CNDataMapperContactStore *)self mapper];
      [v11 addLimitedAccessForBundle:v12 contactIdentifier:v6];
    }
  }
}

- (void)addLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(CNDataMapperContactStore *)self mapper];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(CNDataMapperContactStore *)self mapper];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      char v11 = [(CNDataMapperContactStore *)self mapper];
      [v11 addLimitedAccessForBundle:v12 contactIdentifiers:v6];
    }
  }
}

- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(CNDataMapperContactStore *)self mapper];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(CNDataMapperContactStore *)self mapper];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      char v11 = [(CNDataMapperContactStore *)self mapper];
      [v11 removeLimitedAccessForBundle:v12 contactIdentifier:v6];
    }
  }
}

- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(CNDataMapperContactStore *)self mapper];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(CNDataMapperContactStore *)self mapper];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      char v11 = [(CNDataMapperContactStore *)self mapper];
      [v11 removeLimitedAccessForBundle:v12 contactIdentifiers:v6];
    }
  }
}

- (id)getLimitedAccessContactsCountForBundle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNDataMapperContactStore *)self mapper];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CNDataMapperContactStore *)self mapper];
    char v8 = [v7 getLimitedAccessContactsCountForBundle:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)populateSyncTableForLimitedAccessAboveSequenceNumber:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNDataMapperContactStore *)self mapper];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0
    && ([(CNDataMapperContactStore *)self mapper],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        (v8 & 1) != 0))
  {
    id v9 = [(CNDataMapperContactStore *)self mapper];
    char v10 = [v9 populateSyncTableForLimitedAccessAboveSequenceNumber:v4];
  }
  else
  {
    char v10 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v10;
}

- (void)purgeLimitedAccessRecordsForBundle:(id)a3
{
  id v9 = a3;
  id v4 = [(CNDataMapperContactStore *)self mapper];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CNDataMapperContactStore *)self mapper];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      char v8 = [(CNDataMapperContactStore *)self mapper];
      [v8 purgeLimitedAccessRecordsForBundle:v9];
    }
  }
}

- (void)updateLimitedAccessTable:(id)a3
{
  id v9 = a3;
  id v4 = [(CNDataMapperContactStore *)self mapper];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CNDataMapperContactStore *)self mapper];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      char v8 = [(CNDataMapperContactStore *)self mapper];
      [v8 updateLimitedAccessTable:v9];
    }
  }
}

- (id)getLimitedAccessLastSyncSequenceNumber:(id *)a3
{
  char v5 = [(CNDataMapperContactStore *)self mapper];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(CNDataMapperContactStore *)self mapper];
    char v8 = [v7 getLimitedAccessLastSyncSequenceNumber:a3];
  }
  else
  {
    id v9 = +[CNErrorFactory errorWithCode:1];
    char v7 = v9;
    char v8 = 0;
    if (a3) {
      *a3 = v9;
    }
  }

  return v8;
}

- (id)getWatchLimitedAccessSyncDataStartingAtSequenceNumber:(int64_t)a3
{
  char v5 = [(CNDataMapperContactStore *)self mapper];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0
    && ([(CNDataMapperContactStore *)self mapper],
        char v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        (v8 & 1) != 0))
  {
    id v9 = [(CNDataMapperContactStore *)self mapper];
    char v10 = [NSNumber numberWithInteger:a3];
    char v11 = [v9 getWatchLimitedAccessSyncDataStartingAtSequenceNumber:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)applyLimitedAccessSyncEvents:(id)a3
{
  id v9 = a3;
  id v4 = [(CNDataMapperContactStore *)self mapper];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CNDataMapperContactStore *)self mapper];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      char v8 = [(CNDataMapperContactStore *)self mapper];
      [v8 applyLimitedAccessSyncEvents:v9];
    }
  }
}

- (void)dropAllLimitedAccessRows
{
  uint64_t v3 = [(CNDataMapperContactStore *)self mapper];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(CNDataMapperContactStore *)self mapper];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(CNDataMapperContactStore *)self mapper];
      [v7 dropAllLimitedAccessRows];
    }
  }
}

- (void)dropAllLimitedAccessRowsAndSyncNotify
{
  uint64_t v3 = [(CNDataMapperContactStore *)self mapper];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(CNDataMapperContactStore *)self mapper];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(CNDataMapperContactStore *)self mapper];
      [v7 dropAllLimitedAccessRowsAndSyncNotify];
    }
  }
}

- (void)setLimitedAccessTableCurrentSequenceNumber:(id)a3
{
  id v9 = a3;
  char v4 = [(CNDataMapperContactStore *)self mapper];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CNDataMapperContactStore *)self mapper];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      char v8 = [(CNDataMapperContactStore *)self mapper];
      [v8 setLimitedAccessTableCurrentSequenceNumber:v9];
    }
  }
}

- (BOOL)shouldAnalyzeDatabaseWithError:(id *)a3
{
  char v5 = [(CNDataMapperContactStore *)self mapper];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 0;
  }
  char v7 = [(CNDataMapperContactStore *)self mapper];
  char v8 = [v7 shouldAnalyzeDatabaseWithError:a3];

  return v8;
}

- (BOOL)analyzeDatabaseWithError:(id *)a3
{
  char v5 = [(CNDataMapperContactStore *)self mapper];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 1;
  }
  char v7 = [(CNDataMapperContactStore *)self mapper];
  char v8 = [v7 analyzeDatabaseWithError:a3];

  return v8;
}

- (id)iOSMapper
{
  objc_opt_class();
  uint64_t v3 = [(CNDataMapperContactStore *)self mapper];
  if (objc_opt_isKindOfClass()) {
    char v4 = v3;
  }
  else {
    char v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)unifiedContactsMatchingPredicate:(os_log_t)log keysToFetch:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1909E3000, log, OS_LOG_TYPE_FAULT, "This method should not be called on the main thread as it may lead to UI unresponsiveness.", v1, 2u);
}

void __91__CNDataMapperContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_67_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Encountered null object(s) (data mapper)", v1, 2u);
}

- (void)executeSaveRequest:(os_log_t)log response:authorizationContext:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a2 + 40);
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Did fail to save (%{public}@): %{public}@", (uint8_t *)&v4, 0x16u);
}

@end