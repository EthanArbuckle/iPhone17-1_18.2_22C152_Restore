@interface CNAggregateContactStore
- (BOOL)analyzeDatabaseWithError:(id *)a3;
- (BOOL)clearChangeHistoryForClientIdentifier:(id)a3 toChangeAnchor:(id)a4 error:(id *)a5;
- (BOOL)enumerateContactsAndMatchInfoWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)enumerateNonUnifiedContactsWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)executeChangeHistoryClearRequest:(id)a3 error:(id *)a4;
- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4;
- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6;
- (BOOL)hasGroups;
- (BOOL)hasMultipleGroupsOrAccounts;
- (BOOL)isSpotlightIndexingSupported;
- (BOOL)moveContacts:(id)a3 fromContainer:(id)a4 toContainer:(id)a5 error:(id *)a6;
- (BOOL)registerChangeHistoryClientIdentifier:(id)a3 error:(id *)a4;
- (BOOL)resetSortDataIfNeededWithError:(id *)a3;
- (BOOL)setBestMeIfNeededForGivenName:(id)a3 familyName:(id)a4 email:(id)a5 error:(id *)a6;
- (BOOL)setDefaultAccountIdentifier:(id)a3 error:(id *)a4;
- (BOOL)setMeContact:(id)a3 error:(id *)a4;
- (BOOL)setMeContact:(id)a3 forContainer:(id)a4 error:(id *)a5;
- (BOOL)shouldAnalyzeDatabaseWithError:(id *)a3;
- (BOOL)store:(id)a3 supportsSelector:(SEL)a4;
- (BOOL)supportsSaveRequest:(id)a3;
- (BOOL)unregisterChangeHistoryClientIdentifier:(id)a3 error:(id *)a4;
- (BOOL)verifyChangeHistoryForClientIdentifier:(id)a3 error:(id *)a4;
- (CNAggregateContactStore)initWithContactStores:(id)a3;
- (CNAggregateContactStore)initWithContactStores:(id)a3 configuration:(id)a4;
- (CNContactStore)contactStoreForMatchingDictionaryWork;
- (CNContactStore)mainStore;
- (NSArray)contactStores;
- (NSArray)postFetchDecoratorBlocks;
- (id)XPCDataMapperStore;
- (id)_allStoreResultsWithError:(id *)a3 withBlock:(id)a4;
- (id)_unifiedContactsFromContacts:(id)a3 unifyContactsFromMainStore:(BOOL)a4 keysToFetch:(id)a5 error:(id *)a6;
- (id)_unifiedMeContactWithKeysToFetch:(id)a3 error:(id *)a4;
- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)applyPostFetchDecoratorsToContact:(id)a3 keysToFetch:(id)a4 unifyContactsFromMainStore:(BOOL)a5;
- (id)applyPostFetchDecoratorsToContacts:(id)a3 keysToFetch:(id)a4 unifyContactsFromMainStore:(BOOL)a5;
- (id)changeHistoryWithFetchRequest:(id)a3 error:(id *)a4;
- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4;
- (id)contactIdentifierWithMatchingDictionary:(id)a3;
- (id)contactStoresSupportingSpotlightIndexing;
- (id)contactWithUserActivityUserInfo:(id)a3 keysToFetch:(id)a4;
- (id)containersMatchingPredicate:(id)a3 error:(id *)a4;
- (id)currentHistoryAnchor;
- (id)currentHistoryToken;
- (id)defaultContainerIdentifier;
- (id)descriptorForRequiredKeysForMatchingDictionary;
- (id)enumeratorForChangeHistoryFetchRequest:(id)a3 error:(id *)a4;
- (id)enumeratorForContactFetchRequest:(id)a3 error:(id *)a4;
- (id)executeFetchRequest:(id)a3 progressiveResults:(id)a4 completion:(id)a5;
- (id)fetchLimitedAccessContactIdentifiersForBundle:(id)a3;
- (id)findContactStoreForMatchingDictionaryWork;
- (id)firstContactStoreSupportingSpotlightIndexing;
- (id)getBackgroundColorOnImageData:(id)a3 bitmapFormat:(id)a4 error:(id *)a5;
- (id)getLimitedAccessContactsCountForBundle:(id)a3;
- (id)getLimitedAccessLastSyncSequenceNumber:(id *)a3;
- (id)getWatchLimitedAccessSyncDataStartingAtSequenceNumber:(int64_t)a3;
- (id)groupWithIdentifier:(id)a3 error:(id *)a4;
- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)iOSMapper;
- (id)identifierWithError:(id *)a3;
- (id)individualContactCountWithError:(id *)a3;
- (id)latestConsumedChangeHistoryAnchorForClientIdentifier:(id)a3 error:(id *)a4;
- (id)legacyTetheredSyncComputerAnchor;
- (id)legacyTetheredSyncDeviceAnchor;
- (id)matchingDictionaryForContact:(id)a3;
- (id)meContactIdentifiers:(id *)a3;
- (id)membersOfGroupWithIdentifier:(id)a3 keysToFetch:(id)a4 error:(id *)a5;
- (id)originForSuggestion:(id)a3 error:(id *)a4;
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
- (id)verifyIndexWithError:(id *)a3;
- (int)saveSequenceCount;
- (void)_enumerateStoresUsingBlock:(id)a3;
- (void)addLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4;
- (void)addLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4;
- (void)addPostFetchDecorator:(id)a3;
- (void)applyLimitedAccessSyncEvents:(id)a3;
- (void)didFetchContacts:(id)a3 forPredicate:(id)a4 fromStore:(id)a5 unifiedFetch:(BOOL)a6;
- (void)dropAllLimitedAccessRows;
- (void)dropAllLimitedAccessRowsAndSyncNotify;
- (void)purgeLimitedAccessRecordsForBundle:(id)a3;
- (void)reindexSearchableItemsWithIdentifiers:(id)a3;
- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4;
- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4;
- (void)setContactStoreForMatchingDictionaryWork:(id)a3;
- (void)setContactStores:(id)a3;
- (void)setLegacyTetheredSyncComputerAnchor:(id)a3;
- (void)setLegacyTetheredSyncDeviceAnchor:(id)a3;
- (void)setLimitedAccessTableCurrentSequenceNumber:(id)a3;
- (void)setPostFetchDecoratorBlocks:(id)a3;
- (void)updateLimitedAccessTable:(id)a3;
@end

@implementation CNAggregateContactStore

void __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_4(void *a1, void *a2)
{
  id v6 = a2;
  v3 = (void *)a1[4];
  v4 = [v6 identifier];
  v5 = [v3 objectForKeyedSubscript:v4];

  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A280] + 16))()) {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else {
    ++*(void *)(*(void *)(a1[6] + 8) + 24);
  }
}

void __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v10];
  if (*(unsigned char *)(a1 + 56))
  {
    id v6 = *(void **)(a1 + 32);
    v7 = [v10 identifier];
    [v6 addObject:v7];
  }
  if (v5)
  {
    v8 = *(void **)(a1 + 40);
    v9 = [v10 identifier];
    [v8 setObject:v5 forKeyedSubscript:v9];
  }
}

- (id)_unifiedContactsFromContacts:(id)a3 unifyContactsFromMainStore:(BOOL)a4 keysToFetch:(id)a5 error:(id *)a6
{
  BOOL v54 = a4;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v50 = a5;
  v57 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v78 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        v13 = [v12 identifier];
        [v8 setObject:v12 forKeyedSubscript:v13];

        if ([v12 isUnified])
        {
          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          v14 = [v12 linkedContacts];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v73 objects:v84 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v74;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v74 != v16) {
                  objc_enumerationMutation(v14);
                }
                v18 = [*(id *)(*((void *)&v73 + 1) + 8 * j) identifier];
                [v8 setObject:v12 forKeyedSubscript:v18];
              }
              uint64_t v15 = [v14 countByEnumeratingWithState:&v73 objects:v84 count:16];
            }
            while (v15);
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
    }
    while (v9);
  }

  v47 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:obj];
  v52 = (void *)[v47 mutableCopy];
  uint64_t v19 = [v47 count];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v53 = [v47 reverseObjectEnumerator];
  uint64_t v56 = [v53 countByEnumeratingWithState:&v69 objects:v83 count:16];
  if (v56)
  {
    uint64_t v55 = *(void *)v70;
    do
    {
      for (uint64_t k = 0; k != v56; ++k)
      {
        if (*(void *)v70 != v55) {
          objc_enumerationMutation(v53);
        }
        v21 = *(void **)(*((void *)&v69 + 1) + 8 * k);
        v22 = [v21 storeIdentifier];
        BOOL v23 = v22 == 0;

        --v19;
        if (!v23)
        {
          v24 = [v21 storeInfo];
          v25 = [v24 objectForKeyedSubscript:@"CNContactMainStoreLinkedIdentifier"];

          if (v25)
          {
            uint64_t v26 = [v8 objectForKeyedSubscript:v25];
            id v27 = (id)v26;
            if (v26) {
              goto LABEL_29;
            }
            if (v54)
            {
              v28 = [(CNAggregateContactStore *)self mainStore];
              id v27 = [(CNContactFetchRequest *)v28 unifiedContactWithIdentifier:v25 keysToFetch:v50 error:a6];
            }
            else
            {
              v28 = [[CNContactFetchRequest alloc] initWithKeysToFetch:v50];
              [(CNContactFetchRequest *)v28 setUnifyResults:0];
              v82 = v25;
              v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
              v30 = +[CNContact predicateForContactsWithIdentifiers:v29];
              [(CNContactFetchRequest *)v28 setPredicate:v30];

              uint64_t v63 = 0;
              v64 = &v63;
              uint64_t v65 = 0x3032000000;
              v66 = __Block_byref_object_copy__2;
              v67 = __Block_byref_object_dispose__2;
              id v68 = 0;
              v31 = [(CNAggregateContactStore *)self mainStore];
              v62[0] = MEMORY[0x1E4F143A8];
              v62[1] = 3221225472;
              v62[2] = __101__CNAggregateContactStore__unifiedContactsFromContacts_unifyContactsFromMainStore_keysToFetch_error___block_invoke;
              v62[3] = &unk_1E56B4118;
              v62[4] = &v63;
              [v31 enumerateContactsWithFetchRequest:v28 error:a6 usingBlock:v62];

              id v27 = (id)v64[5];
              _Block_object_dispose(&v63, 8);
            }
            if (v27)
            {
LABEL_29:
              v32 = [v27 identifier];
              v33 = [v57 objectForKeyedSubscript:v32];
              if (!v33)
              {
                v33 = [MEMORY[0x1E4F1CA48] array];
                if ([v27 isUnified])
                {
                  v34 = [v27 linkedContacts];
                  [v33 addObjectsFromArray:v34];
                }
                else
                {
                  [v33 addObject:v27];
                }
                [v57 setObject:v33 forKeyedSubscript:v32];
              }
              [v33 addObject:v21];
              [v52 removeObjectAtIndex:v19];
              if (!v26) {
                [v52 addObject:v27];
              }
            }
          }
        }
      }
      uint64_t v56 = [v53 countByEnumeratingWithState:&v69 objects:v83 count:16];
    }
    while (v56);
  }

  v35 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v52, "count"));
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v36 = v52;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v58 objects:v81 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v59;
    do
    {
      for (uint64_t m = 0; m != v37; ++m)
      {
        if (*(void *)v59 != v38) {
          objc_enumerationMutation(v36);
        }
        v40 = *(void **)(*((void *)&v58 + 1) + 8 * m);
        v41 = [v40 identifier];
        id v42 = v40;
        v43 = [v57 objectForKeyedSubscript:v41];
        if (v43)
        {
          uint64_t v44 = +[CN contactUnifyingContacts:v43 includingMainStoreContacts:v54 allowMutableContactFreeze:1];

          id v42 = (id)v44;
        }
        [v35 addObject:v42];
      }
      uint64_t v37 = [v36 countByEnumeratingWithState:&v58 objects:v81 count:16];
    }
    while (v37);
  }

  v45 = [(CNAggregateContactStore *)self applyPostFetchDecoratorsToContacts:v35 keysToFetch:v50 unifyContactsFromMainStore:v54];

  return v45;
}

uint64_t __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_49(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)_enumerateStoresUsingBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, char *))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_contactStores;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      char v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __63__CNAggregateContactStore__allStoreResultsWithError_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  obuint64_t j = *(id *)(v2 + 40);
  v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_storeStrong((id *)(v2 + 40), obj);
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) && [v3 count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:v3];
  }
}

id __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  id v26 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = *(void *)(a1 + 40);
  BOOL v7 = *(void *)(a1 + 32) == (void)v5;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  long long v15 = __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_3;
  uint64_t v16 = &unk_1E56B41F8;
  uint64_t v19 = &v21;
  BOOL v20 = v7;
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  LOBYTE(a3) = [v5 enumerateContactsAndMatchInfoWithFetchRequest:v6 error:a3 usingBlock:&v13];
  uint64_t v8 = *(void **)(a1 + 64);
  uint64_t v9 = v22[5];
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 40), "predicate", v13, v14, v15, v16);
  objc_msgSend(v8, "didFetchContacts:forPredicate:fromStore:unifiedFetch:", v9, v10, v5, objc_msgSend(*(id *)(a1 + 40), "unifyResults"));

  if ((a3 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }
  id v11 = (id)v22[5];

  _Block_object_dispose(&v21, 8);

  return v11;
}

- (id)currentHistoryToken
{
  uint64_t v2 = [(CNAggregateContactStore *)self mainStore];
  v3 = [v2 currentHistoryToken];

  return v3;
}

void __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke(uint64_t a1)
{
  +[CNAPITriageLogger setThreadEntryPoint:0];
  uint64_t v2 = +[CNAPITriageLogger os_log];
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", "", v5, 2u);
  }
}

- (BOOL)enumerateContactsAndMatchInfoWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v9 = a3;
  id v10 = a5;
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
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke;
  v62[3] = &__block_descriptor_40_e5_v8__0l;
  v62[4] = v12;
  uint64_t v16 = (void *)[v62 copy];
  id v17 = self;
  id v18 = _Block_copy(v17);
  [v15 push:v18];

  *(void *)buf = 0;
  long long v59 = buf;
  uint64_t v60 = 0x2020000000;
  char v61 = 1;
  if ([v9 onlyMainStore])
  {
    uint64_t v19 = [(CNAggregateContactStore *)self mainStore];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_41;
    v55[3] = &unk_1E56B41D0;
    v55[4] = self;
    id v56 = v9;
    id v57 = v10;
    uint8_t v20 = [v19 enumerateContactsAndMatchInfoWithFetchRequest:v56 error:a4 usingBlock:v55];
    v59[24] = v20;

    uint64_t v21 = v56;
  }
  else
  {
    uint64_t v37 = v10;
    v22 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
    v24 = [(CNAggregateContactStore *)self mainStore];
    id v54 = 0;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_2;
    v47[3] = &unk_1E56B4220;
    id v25 = v24;
    id v48 = v25;
    id v26 = v9;
    id v49 = v26;
    id v27 = v23;
    id v50 = v27;
    id v28 = v22;
    id v51 = v28;
    v52 = self;
    id v53 = buf;
    v29 = [(CNAggregateContactStore *)self _allStoreResultsWithError:&v54 withBlock:v47];
    id v38 = v54;
    if (v59[24])
    {
      uint64_t v30 = [v26 unifyResults];
      v31 = [v26 keysToFetch];
      v32 = [(CNAggregateContactStore *)self _unifiedContactsFromContacts:v29 unifyContactsFromMainStore:v30 keysToFetch:v31 error:a4];

      uint64_t v43 = 0;
      uint64_t v44 = &v43;
      uint64_t v45 = 0x2020000000;
      uint64_t v46 = 0;
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_4;
      v39[3] = &unk_1E56B4248;
      id v40 = v28;
      id v42 = &v43;
      id v10 = v37;
      id v41 = v37;
      [v32 enumerateObjectsUsingBlock:v39];
      if (v44[3])
      {
        v33 = os_log_create("com.apple.contacts", "data-access-error");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[CNAggregateContactStore enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:](v33);
        }

        v59[24] = 0;
        if (a4)
        {
          *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNErrorDomain" code:2 userInfo:0];
        }
        objc_msgSend(MEMORY[0x1E4F5A4F8], "simulateCrashWithMessage:", @"enumerateContactsAndMatchInfoWithFetchRequest encountered NSNull %lu times where %lu CNContact objects where expcted", v44[3], objc_msgSend(v32, "count"));
      }

      _Block_object_dispose(&v43, 8);
    }
    else
    {
      if (a4) {
        *a4 = v38;
      }
      v32 = v29;
    }

    uint64_t v21 = v38;
  }

  BOOL v34 = v59[24] != 0;
  _Block_object_dispose(buf, 8);
  [v15 popAllWithHandler:&__block_literal_global_51];
  id v35 = self;

  return v34;
}

- (void)didFetchContacts:(id)a3 forPredicate:(id)a4 fromStore:(id)a5 unifiedFetch:(BOOL)a6
{
  BOOL v6 = a6;
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(CNAggregateContactStore *)self mainStore];

  if (v12 == v11)
  {
    objc_opt_class();
    id v13 = v10;
    if (objc_opt_isKindOfClass()) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    id v15 = v14;

    [v15 mainStoreDidFetchContacts:v16 unifiedFetch:v6];
  }
}

- (CNContactStore)mainStore
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_mainStore = &self->_mainStore;
  if (!self->_mainStore)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v3 = self->_contactStores;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          id v9 = objc_msgSend((id)objc_opt_class(), "storeIdentifier", (void)v12);

          if (!v9)
          {
            objc_storeStrong((id *)p_mainStore, v8);
            goto LABEL_12;
          }
        }
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  id v10 = *p_mainStore;

  return v10;
}

- (id)_allStoreResultsWithError:(id *)a3 withBlock:(id)a4
{
  id v6 = a4;
  BOOL v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__CNAggregateContactStore__allStoreResultsWithError_withBlock___block_invoke;
  v14[3] = &unk_1E56B40F0;
  id v8 = v6;
  id v16 = v8;
  uint64_t v17 = &v18;
  id v9 = v7;
  id v15 = v9;
  [(CNAggregateContactStore *)self _enumerateStoresUsingBlock:v14];
  id v10 = (void *)v19[5];
  if (v10 && a3) {
    *a3 = v10;
  }
  id v11 = v15;
  id v12 = v9;

  _Block_object_dispose(&v18, 8);

  return v12;
}

- (id)currentHistoryAnchor
{
  uint64_t v2 = [(CNAggregateContactStore *)self mainStore];
  v3 = [v2 currentHistoryAnchor];

  return v3;
}

- (id)meContactIdentifiers:(id *)a3
{
  uint64_t v4 = [(CNAggregateContactStore *)self contactStores];
  uint64_t v5 = [MEMORY[0x1E4F5A3B8] eitherWithLeft:MEMORY[0x1E4F1CBF0]];
  id v6 = objc_msgSend(v4, "_cn_reduce:initialValue:", &__block_literal_global_40, v5);

  id v7 = v6;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A1C0] + 16))())
  {
    id v8 = [v7 left];
  }
  else
  {
    id v9 = [v7 right];
    id v10 = v9;
    if (a3) {
      *a3 = v9;
    }

    id v8 = 0;
  }

  return v8;
}

- (NSArray)contactStores
{
  return self->_contactStores;
}

id __48__CNAggregateContactStore_meContactIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 isLeft])
  {
    id v14 = 0;
    id v6 = [v5 meContactIdentifiers:&v14];
    id v7 = v14;
    id v8 = v7;
    if (v7 && (CNIsErrorWithCode(v7, 200) & 1) == 0)
    {
      id v12 = [MEMORY[0x1E4F5A3B8] eitherWithRight:v8];
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F5A3B8];
      id v10 = [v4 left];
      id v11 = [v10 arrayByAddingObjectsFromArray:v6];
      id v12 = [v9 eitherWithLeft:v11];
    }
  }
  else
  {
    id v12 = v4;
  }

  return v12;
}

void __88__CNAggregateContactStore_enumerateNonUnifiedContactsWithFetchRequest_error_usingBlock___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  char v11 = 0;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v7 = a2;
  id v8 = [v6 keysToFetch];
  id v9 = objc_msgSend(v5, "applyPostFetchDecoratorsToContact:keysToFetch:unifyContactsFromMainStore:", v7, v8, objc_msgSend(*(id *)(a1 + 40), "unifyResults"));

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  char v10 = v11;
  *a3 = v11;
  **(unsigned char **)(a1 + 56) = v10;
}

- (id)applyPostFetchDecoratorsToContact:(id)a3 keysToFetch:(id)a4 unifyContactsFromMainStore:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a4;
  id v10 = a3;
  char v11 = [v8 arrayWithObjects:&v15 count:1];

  id v12 = -[CNAggregateContactStore applyPostFetchDecoratorsToContacts:keysToFetch:unifyContactsFromMainStore:](self, "applyPostFetchDecoratorsToContacts:keysToFetch:unifyContactsFromMainStore:", v11, v9, v5, v15, v16);

  long long v13 = [v12 firstObject];

  return v13;
}

- (CNAggregateContactStore)initWithContactStores:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CNAggregateContactStore;
  id v8 = [(CNContactStore *)&v12 init];
  id v9 = v8;
  if (v8)
  {
    [(CNAggregateContactStore *)v8 setContactStores:v6];
    [(CNAggregateContactStore *)v9 setPostFetchDecoratorBlocks:MEMORY[0x1E4F1CBF0]];
    if ([v7 includeSharedPhotoContacts]) {
      [(CNAggregateContactStore *)v9 addPostFetchDecorator:&__block_literal_global_6];
    }
    id v10 = v9;
  }

  return v9;
}

- (void)setContactStores:(id)a3
{
}

- (void)addPostFetchDecorator:(id)a3
{
  id v4 = a3;
  id v8 = [(CNAggregateContactStore *)self postFetchDecoratorBlocks];
  BOOL v5 = (void *)[v4 copy];

  id v6 = _Block_copy(v5);
  id v7 = [v8 arrayByAddingObject:v6];
  [(CNAggregateContactStore *)self setPostFetchDecoratorBlocks:v7];
}

- (void)setPostFetchDecoratorBlocks:(id)a3
{
}

- (id)applyPostFetchDecoratorsToContacts:(id)a3 keysToFetch:(id)a4 unifyContactsFromMainStore:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *MEMORY[0x1E4F5A258];
  char v11 = [(CNAggregateContactStore *)self postFetchDecoratorBlocks];
  LODWORD(v10) = (*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  if (v10)
  {
    id v12 = v8;
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__2;
    id v23 = __Block_byref_object_dispose__2;
    id v24 = v8;
    long long v13 = [(CNAggregateContactStore *)self postFetchDecoratorBlocks];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __101__CNAggregateContactStore_applyPostFetchDecoratorsToContacts_keysToFetch_unifyContactsFromMainStore___block_invoke;
    v15[3] = &unk_1E56B43D8;
    uint64_t v17 = &v19;
    id v16 = v9;
    BOOL v18 = a5;
    [v13 enumerateObjectsUsingBlock:v15];

    id v12 = (id)v20[5];
    _Block_object_dispose(&v19, 8);
  }

  return v12;
}

- (NSArray)postFetchDecoratorBlocks
{
  return self->_postFetchDecoratorBlocks;
}

uint64_t __101__CNAggregateContactStore_applyPostFetchDecoratorsToContacts_keysToFetch_unifyContactsFromMainStore___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(uint64_t, void, void, void))(a2 + 16))(a2, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

  return MEMORY[0x1F41817F8]();
}

id __63__CNAggregateContactStore_initWithContactStores_configuration___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  id v7 = a2;
  id v8 = [[CNContactStoreContactsFetchResultSharedAvatarDecorator alloc] initWithContacts:v7 keysToFetch:v6 unifyContactsFromMainStore:a4];

  id v9 = [(CNContactStoreContactsFetchResultSharedAvatarDecorator *)v8 decoratedValue];

  return v9;
}

- (id)unifiedContactCountWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(CNAggregateContactStore *)self contactStores];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) unifiedContactCountWithError:a3];
      if (!v10) {
        break;
      }
      char v11 = v10;
      v7 += [v10 unsignedIntegerValue];

      if (v6 == ++v9)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
  }
  uint64_t v7 = 0;
LABEL_11:

  id v12 = [NSNumber numberWithUnsignedInteger:v7];

  return v12;
}

uint64_t __88__CNAggregateContactStore_enumerateNonUnifiedContactsWithFetchRequest_error_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __54__CNAggregateContactStore_requestAccessForEntityType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 requestAccessForEntityType:*(void *)(a1 + 32)];
}

BOOL __56__CNAggregateContactStore_Favorites__XPCDataMapperStore__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNContactStore isXPCDataMapperStoreForFavorites:a2];
}

uint64_t __54__CNAggregateContactStore_requestAccessForEntityType___block_invoke_2()
{
  return [MEMORY[0x1E4F5A408] futureWithResult:MEMORY[0x1E4F1CC38]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postFetchDecoratorBlocks, 0);
  objc_storeStrong((id *)&self->_contactStoreForMatchingDictionaryWork, 0);
  objc_storeStrong((id *)&self->_contactStores, 0);

  objc_storeStrong((id *)&self->_mainStore, 0);
}

- (id)sectionListOffsetsForSortOrder:(int64_t)a3 error:(id *)a4
{
  uint64_t v6 = [(CNAggregateContactStore *)self mainStore];
  uint64_t v7 = [v6 sectionListOffsetsForSortOrder:a3 error:a4];

  return v7;
}

- (id)requestAccessForEntityType:(int64_t)a3
{
  contactStores = self->_contactStores;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__CNAggregateContactStore_requestAccessForEntityType___block_invoke;
  v8[3] = &__block_descriptor_40_e34___CNFuture_16__0__CNContactStore_8l;
  v8[4] = a3;
  id v4 = [(NSArray *)contactStores _cn_map:v8];
  uint64_t v5 = [MEMORY[0x1E4F5A408] join:v4];
  uint64_t v6 = [v5 flatMap:&__block_literal_global_11];

  return v6;
}

- (id)XPCDataMapperStore
{
  uint64_t v2 = [(CNAggregateContactStore *)self contactStores];
  v3 = objc_msgSend(v2, "_cn_firstObjectPassingTest:", &__block_literal_global_144);

  return v3;
}

void __88__CNAggregateContactStore_enumerateNonUnifiedContactsWithFetchRequest_error_usingBlock___block_invoke(uint64_t a1)
{
  +[CNAPITriageLogger setThreadEntryPoint:0];
  uint64_t v2 = +[CNAPITriageLogger os_log];
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", "", v5, 2u);
  }
}

void __88__CNAggregateContactStore_enumerateNonUnifiedContactsWithFetchRequest_error_usingBlock___block_invoke_57(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  id v13 = *(id *)(v6 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__CNAggregateContactStore_enumerateNonUnifiedContactsWithFetchRequest_error_usingBlock___block_invoke_2;
  v9[3] = &unk_1E56B4270;
  int8x16_t v8 = *(int8x16_t *)(a1 + 32);
  id v7 = (id)v8.i64[0];
  int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = a3;
  LOBYTE(a3) = [a2 enumerateContactsWithFetchRequest:v7 error:&v13 usingBlock:v9];
  objc_storeStrong((id *)(v6 + 40), v13);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
}

id __78__CNAggregateContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke_27(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a2;
  int8x16_t v8 = [v7 unifiedContactsMatchingPredicate:v5 keysToFetch:v6 error:a3];
  [*(id *)(a1 + 48) didFetchContacts:v8 forPredicate:*(void *)(a1 + 32) fromStore:v7 unifiedFetch:1];

  return v8;
}

- (id)unifiedContactsMatchingPredicate:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  +[CNAPITriageLogger setThreadEntryPoint:a2];
  id v11 = +[CNAPITriageLogger os_log];
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  id v13 = +[CNAPITriageLogger os_log];
  long long v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Fetching", "", buf, 2u);
  }

  id v15 = objc_alloc_init(MEMORY[0x1E4F5A508]);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __78__CNAggregateContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke;
  v31[3] = &__block_descriptor_40_e5_v8__0l;
  v31[4] = v12;
  long long v16 = (void *)[v31 copy];
  long long v17 = self;
  BOOL v18 = _Block_copy(v17);
  [v15 push:v18];

  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  id v26 = __78__CNAggregateContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke_27;
  id v27 = &unk_1E56B4140;
  id v28 = v9;
  id v19 = v10;
  id v29 = v19;
  uint64_t v30 = self;
  uint64_t v20 = [(CNAggregateContactStore *)self _allStoreResultsWithError:a5 withBlock:&v24];
  uint64_t v21 = -[CNAggregateContactStore _unifiedContactsFromContacts:unifyContactsFromMainStore:keysToFetch:error:](self, "_unifiedContactsFromContacts:unifyContactsFromMainStore:keysToFetch:error:", v20, 1, v19, a5, v24, v25, v26, v27);

  [v15 popAllWithHandler:&__block_literal_global_31];
  id v22 = self;

  return v21;
}

- (BOOL)enumerateNonUnifiedContactsWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  +[CNAPITriageLogger setThreadEntryPoint:a2];
  id v11 = +[CNAPITriageLogger os_log];
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  id v13 = +[CNAPITriageLogger os_log];
  long long v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Fetching", "", buf, 2u);
  }

  id v15 = objc_alloc_init(MEMORY[0x1E4F5A508]);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __88__CNAggregateContactStore_enumerateNonUnifiedContactsWithFetchRequest_error_usingBlock___block_invoke;
  v43[3] = &__block_descriptor_40_e5_v8__0l;
  v43[4] = v12;
  long long v16 = (void *)[v43 copy];
  long long v17 = self;
  BOOL v18 = _Block_copy(v17);
  [v15 push:v18];

  if ([v9 unifyResults])
  {
    id v22 = (void *)MEMORY[0x1E4F1CA00];
    id v23 = NSString;
    uint64_t v24 = NSStringFromSelector(a2);
    uint64_t v25 = [v23 stringWithFormat:@"Can't set -[CNContactFetchRequest unifyResults] to YES with %@", v24];
    id v26 = [v22 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v25 userInfo:0];

    objc_exception_throw(v26);
  }
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 1;
  *(void *)buf = 0;
  BOOL v34 = buf;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__2;
  uint64_t v37 = __Block_byref_object_dispose__2;
  id v38 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __88__CNAggregateContactStore_enumerateNonUnifiedContactsWithFetchRequest_error_usingBlock___block_invoke_57;
  v27[3] = &unk_1E56B4298;
  v31 = &v39;
  v32 = buf;
  id v28 = v9;
  id v29 = self;
  id v30 = v10;
  [(CNAggregateContactStore *)self _enumerateStoresUsingBlock:v27];
  BOOL v19 = *((unsigned char *)v40 + 24) != 0;
  if (a4 && !*((unsigned char *)v40 + 24)) {
    *a4 = *((id *)v34 + 5);
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v39, 8);
  [v15 popAllWithHandler:&__block_literal_global_59_0];
  id v20 = self;

  return v19;
}

uint64_t __78__CNAggregateContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __78__CNAggregateContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke(uint64_t a1)
{
  +[CNAPITriageLogger setThreadEntryPoint:0];
  uint64_t v2 = +[CNAPITriageLogger os_log];
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", "", v5, 2u);
  }
}

- (CNAggregateContactStore)initWithContactStores:(id)a3
{
  return [(CNAggregateContactStore *)self initWithContactStores:a3 configuration:0];
}

- (BOOL)store:(id)a3 supportsSelector:(SEL)a4
{
  uint64_t v5 = [(id)objc_opt_class() instanceMethodForSelector:a4];
  return v5 != +[CNContactStore instanceMethodForSelector:a4];
}

- (BOOL)hasMultipleGroupsOrAccounts
{
  uint64_t v2 = [(CNAggregateContactStore *)self contactStores];
  char v3 = objc_msgSend(v2, "_cn_any:", &__block_literal_global_4);

  return v3;
}

uint64_t __54__CNAggregateContactStore_hasMultipleGroupsOrAccounts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasMultipleGroupsOrAccounts];
}

- (BOOL)hasGroups
{
  uint64_t v2 = [(CNAggregateContactStore *)self contactStores];
  char v3 = objc_msgSend(v2, "_cn_any:", &__block_literal_global_6);

  return v3;
}

uint64_t __36__CNAggregateContactStore_hasGroups__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasGroups];
}

void __101__CNAggregateContactStore__unifiedContactsFromContacts_unifyContactsFromMainStore_keysToFetch_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v6 + 40);
  id v7 = (id *)(v6 + 40);
  int8x16_t v8 = v9;
  if (v9)
  {
    id *v7 = 0;

    *a3 = 1;
  }
  else
  {
    objc_storeStrong(v7, a2);
  }
}

- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [(CNAggregateContactStore *)self contactStores];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v18;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(v7);
      }
      id v13 = [*(id *)(*((void *)&v17 + 1) + 8 * v12) contactCountForFetchRequest:v6 error:a4];
      if (!v13) {
        break;
      }
      long long v14 = v13;
      v10 += [v13 unsignedIntegerValue];

      if (v9 == ++v12)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
  }
  uint64_t v10 = 0;
LABEL_11:

  id v15 = [NSNumber numberWithUnsignedInteger:v10];

  return v15;
}

- (id)_unifiedMeContactWithKeysToFetch:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CNAggregateContactStore *)self contactStores];
  uint64_t v8 = objc_msgSend(v7, "_cn_map:", &__block_literal_global_35);
  uint64_t v9 = objc_msgSend(v8, "_cn_filter:", *MEMORY[0x1E4F5A1C0]);
  uint64_t v10 = objc_msgSend(v9, "_cn_map:", *MEMORY[0x1E4F5A1D0]);
  uint64_t v11 = objc_msgSend(v10, "_cn_flatten");

  uint64_t v12 = +[CNContact predicateForContactsWithIdentifiers:v11];
  id v19 = 0;
  id v13 = [(CNAggregateContactStore *)self unifiedContactsMatchingPredicate:v12 keysToFetch:v6 error:&v19];

  id v14 = v19;
  if (!(*(unsigned int (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    uint64_t v15 = *MEMORY[0x1E4F5A280];
    long long v16 = [v13 firstObject];
    LODWORD(v15) = (*(uint64_t (**)(uint64_t, void *))(v15 + 16))(v15, v16);

    if (v15)
    {
      long long v17 = [v13 firstObject];
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v14)
  {
    if (!a4) {
      goto LABEL_9;
    }
LABEL_8:
    id v14 = v14;
    long long v17 = 0;
    *a4 = v14;
    goto LABEL_10;
  }
  id v14 = +[CNErrorFactory errorWithCode:200 userInfo:0];
  if (a4) {
    goto LABEL_8;
  }
LABEL_9:
  long long v17 = 0;
LABEL_10:

  return v17;
}

void __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [v6 keysToFetch];
  objc_msgSend(v5, "applyPostFetchDecoratorsToContact:keysToFetch:unifyContactsFromMainStore:", v8, v9, objc_msgSend(*(id *)(a1 + 40), "unifyResults"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__CNAggregateContactStore_groupsMatchingPredicate_error___block_invoke;
  v10[3] = &unk_1E56B42C0;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(CNAggregateContactStore *)self _allStoreResultsWithError:a4 withBlock:v10];

  return v8;
}

uint64_t __57__CNAggregateContactStore_groupsMatchingPredicate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 groupsMatchingPredicate:*(void *)(a1 + 32) error:a3];
}

- (id)groupWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = self->_contactStores;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "groupWithIdentifier:error:", v6, a4, (void)v15);
        if (v12)
        {
          id v13 = (void *)v12;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (id)membersOfGroupWithIdentifier:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__CNAggregateContactStore_membersOfGroupWithIdentifier_keysToFetch_error___block_invoke;
  v14[3] = &unk_1E56B42E8;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  uint64_t v12 = [(CNAggregateContactStore *)self _allStoreResultsWithError:a5 withBlock:v14];

  return v12;
}

uint64_t __74__CNAggregateContactStore_membersOfGroupWithIdentifier_keysToFetch_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 membersOfGroupWithIdentifier:*(void *)(a1 + 32) keysToFetch:*(void *)(a1 + 40) error:a3];
}

- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__CNAggregateContactStore_subgroupsOfGroupWithIdentifier_error___block_invoke;
  v10[3] = &unk_1E56B42C0;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(CNAggregateContactStore *)self _allStoreResultsWithError:a4 withBlock:v10];

  return v8;
}

uint64_t __64__CNAggregateContactStore_subgroupsOfGroupWithIdentifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 subgroupsOfGroupWithIdentifier:*(void *)(a1 + 32) error:a3];
}

- (id)containersMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__CNAggregateContactStore_containersMatchingPredicate_error___block_invoke;
  v10[3] = &unk_1E56B42C0;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(CNAggregateContactStore *)self _allStoreResultsWithError:a4 withBlock:v10];

  return v8;
}

uint64_t __61__CNAggregateContactStore_containersMatchingPredicate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 containersMatchingPredicate:*(void *)(a1 + 32) error:a3];
}

- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__CNAggregateContactStore_serverSearchContainersMatchingPredicate_error___block_invoke;
  v10[3] = &unk_1E56B42C0;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(CNAggregateContactStore *)self _allStoreResultsWithError:a4 withBlock:v10];

  return v8;
}

uint64_t __73__CNAggregateContactStore_serverSearchContainersMatchingPredicate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 serverSearchContainersMatchingPredicate:*(void *)(a1 + 32) error:a3];
}

- (id)defaultContainerIdentifier
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = self->_contactStores;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "defaultContainerIdentifier", (void)v10);
        if (v7)
        {
          id v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

- (id)policyWithDescription:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = self->_contactStores;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "policyWithDescription:error:", v6, a4, (void)v15);
        if (v12)
        {
          long long v13 = (void *)v12;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  long long v13 = 0;
LABEL_11:

  return v13;
}

- (id)usedLabelsForPropertyWithKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__CNAggregateContactStore_usedLabelsForPropertyWithKey_error___block_invoke;
  v10[3] = &unk_1E56B42C0;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = [(CNAggregateContactStore *)self _allStoreResultsWithError:a4 withBlock:v10];

  return v8;
}

uint64_t __62__CNAggregateContactStore_usedLabelsForPropertyWithKey_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 usedLabelsForPropertyWithKey:*(void *)(a1 + 32) error:a3];
}

- (BOOL)setMeContact:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CNAggregateContactStore *)self contactStores];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __46__CNAggregateContactStore_setMeContact_error___block_invoke;
  v20[3] = &unk_1E56B4310;
  id v8 = v6;
  id v21 = v8;
  uint64_t v9 = objc_msgSend(v7, "_cn_map:", v20);

  uint64_t v10 = MEMORY[0x1E4F5A1C0];
  id v11 = objc_msgSend(v9, "_cn_firstObjectPassingTest:", *MEMORY[0x1E4F5A1C0]);
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    objc_msgSend(v9, "_cn_firstObjectPassingTest:", *MEMORY[0x1E4F5A1C8]);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v14 = v13;

  id v15 = v14;
  char v16 = (*(uint64_t (**)(void))(*(void *)v10 + 16))();
  if ((v16 & 1) == 0)
  {
    long long v17 = [v15 right];
    long long v18 = v17;
    if (a4) {
      *a4 = v17;
    }
  }
  return v16;
}

id __46__CNAggregateContactStore_setMeContact_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F5A3B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = 0;
  uint64_t v4 = [a2 setMeContact:v3 error:&v8];
  id v5 = v8;
  id v6 = [v2 eitherWithBool:v4 error:v5];

  return v6;
}

- (BOOL)setMeContact:(id)a3 forContainer:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(CNAggregateContactStore *)self contactStores];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  id v26 = __59__CNAggregateContactStore_setMeContact_forContainer_error___block_invoke;
  id v27 = &unk_1E56B4338;
  id v11 = v8;
  id v28 = v11;
  id v12 = v9;
  id v29 = v12;
  id v13 = objc_msgSend(v10, "_cn_map:", &v24);

  uint64_t v14 = MEMORY[0x1E4F5A1C0];
  id v15 = objc_msgSend(v13, "_cn_firstObjectPassingTest:", *MEMORY[0x1E4F5A1C0], v24, v25, v26, v27);
  char v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    objc_msgSend(v13, "_cn_firstObjectPassingTest:", *MEMORY[0x1E4F5A1C8]);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  long long v18 = v17;

  id v19 = v18;
  char v20 = (*(uint64_t (**)(void))(*(void *)v14 + 16))();
  if ((v20 & 1) == 0)
  {
    id v21 = [v19 right];
    uint64_t v22 = v21;
    if (a5) {
      *a5 = v21;
    }
  }
  return v20;
}

id __59__CNAggregateContactStore_setMeContact_forContainer_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F5A3B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = 0;
  uint64_t v5 = [a2 setMeContact:v3 forContainer:v4 error:&v9];
  id v6 = v9;
  id v7 = [v2 eitherWithBool:v5 error:v6];

  return v7;
}

- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__CNAggregateContactStore_accountsMatchingPredicate_error___block_invoke;
  v10[3] = &unk_1E56B42C0;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(CNAggregateContactStore *)self _allStoreResultsWithError:a4 withBlock:v10];

  return v8;
}

uint64_t __59__CNAggregateContactStore_accountsMatchingPredicate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 accountsMatchingPredicate:*(void *)(a1 + 32) error:a3];
}

- (BOOL)supportsSaveRequest:(id)a3
{
  id v4 = a3;
  contactStores = self->_contactStores;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__CNAggregateContactStore_supportsSaveRequest___block_invoke;
  v8[3] = &unk_1E56B4360;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(contactStores) = [(NSArray *)contactStores _cn_any:v8];

  return (char)contactStores;
}

uint64_t __47__CNAggregateContactStore_supportsSaveRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsSaveRequest:*(void *)(a1 + 32)];
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  return [(CNAggregateContactStore *)self executeSaveRequest:a3 response:0 authorizationContext:0 error:a4];
}

- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  char v12 = [v10 suppressChangeNotifications];
  unint64_t v13 = 0x1E56B2000uLL;
  if ((v12 & 1) == 0)
  {
    uint64_t v14 = +[CNChangesNotifier sharedNotifier];
    [v14 willSaveChanges];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = self->_contactStores;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v25 = self;
    uint64_t v18 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        char v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v20 supportsSaveRequest:v10]
          && ![v20 executeSaveRequest:v10 response:a4 authorizationContext:v11 error:a6])
        {
          BOOL v21 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v17) {
        continue;
      }
      break;
    }
    BOOL v21 = 1;
LABEL_14:
    self = v25;
    unint64_t v13 = 0x1E56B2000;
  }
  else
  {
    BOOL v21 = 1;
  }

  if ((v12 & 1) == 0)
  {
    uint64_t v22 = [*(id *)(v13 + 2608) sharedNotifier];
    id v23 = [v10 saveRequestIdentifier];
    [v22 didSaveChangesSuccessfully:v21 fromContactStore:self requestIdentifier:v23];
  }
  return v21;
}

- (id)executeFetchRequest:(id)a3 progressiveResults:(id)a4 completion:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v30 = a4;
  id v28 = a5;
  +[CNAPITriageLogger setThreadEntryPoint:a2];
  id v8 = +[CNAPITriageLogger os_log];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = +[CNAPITriageLogger os_log];
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Fetching", "", buf, 2u);
  }

  id v26 = objc_alloc_init(MEMORY[0x1E4F5A508]);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __77__CNAggregateContactStore_executeFetchRequest_progressiveResults_completion___block_invoke;
  v39[3] = &__block_descriptor_40_e5_v8__0l;
  void v39[4] = v9;
  char v12 = (void *)[v39 copy];
  unint64_t v13 = self;
  uint64_t v14 = _Block_copy(v13);
  [v26 push:v14];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v15 = self->_contactStores;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v15);
        }
        id v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __77__CNAggregateContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_61;
        aBlock[3] = &unk_1E56B4388;
        aBlock[4] = self;
        id v20 = v29;
        id v33 = v20;
        id v34 = v30;
        BOOL v21 = _Block_copy(aBlock);
        uint64_t v22 = [v19 executeFetchRequest:v20 progressiveResults:v21 completion:v28];
        id v23 = v22;
        if (v22) {
          id v27 = v22;
        }

        if (v23)
        {

          goto LABEL_16;
        }
      }
      uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  id v27 = 0;
LABEL_16:
  [v26 popAllWithHandler:&__block_literal_global_64];
  id v24 = self;

  return v27;
}

void __77__CNAggregateContactStore_executeFetchRequest_progressiveResults_completion___block_invoke(uint64_t a1)
{
  +[CNAPITriageLogger setThreadEntryPoint:0];
  uint64_t v2 = +[CNAPITriageLogger os_log];
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", "", v5, 2u);
  }
}

void __77__CNAggregateContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  os_signpost_id_t v9 = [v6 keysToFetch];
  objc_msgSend(v5, "applyPostFetchDecoratorsToContacts:keysToFetch:unifyContactsFromMainStore:", v8, v9, objc_msgSend(*(id *)(a1 + 40), "unifyResults"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __77__CNAggregateContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)enumeratorForContactFetchRequest:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  +[CNAPITriageLogger setThreadEntryPoint:a2];
  uint64_t v5 = +[CNAPITriageLogger os_log];
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = +[CNAPITriageLogger os_log];
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Fetching", "", buf, 2u);
  }

  id v25 = objc_alloc_init(MEMORY[0x1E4F5A508]);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __66__CNAggregateContactStore_enumeratorForContactFetchRequest_error___block_invoke;
  v36[3] = &__block_descriptor_40_e5_v8__0l;
  v36[4] = v6;
  os_signpost_id_t v9 = (void *)[v36 copy];
  id v10 = self;
  id v11 = _Block_copy(v10);
  [v25 push:v11];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  char v12 = self->_contactStores;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v17 = [v16 enumeratorForContactFetchRequest:v29 error:a4];
          uint64_t v18 = [v17 value];
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __66__CNAggregateContactStore_enumeratorForContactFetchRequest_error___block_invoke_67;
          v30[3] = &unk_1E56B43B0;
          v30[4] = self;
          id v31 = v29;
          id v19 = objc_msgSend(v18, "_cn_compactMap:", v30);

          id v20 = [CNFetchResult alloc];
          BOOL v21 = [v17 currentHistoryToken];
          uint64_t v22 = [(CNFetchResult *)v20 initWithValue:v19 currentHistoryToken:v21];

          if (v22) {
            id v26 = v22;
          }

          if (v22)
          {

            goto LABEL_17;
          }
        }
      }
      uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  id v26 = 0;
LABEL_17:
  [v25 popAllWithHandler:&__block_literal_global_71];
  id v23 = self;

  return v26;
}

void __66__CNAggregateContactStore_enumeratorForContactFetchRequest_error___block_invoke(uint64_t a1)
{
  +[CNAPITriageLogger setThreadEntryPoint:0];
  uint64_t v2 = +[CNAPITriageLogger os_log];
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1909E3000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", "", v5, 2u);
  }
}

id __66__CNAggregateContactStore_enumeratorForContactFetchRequest_error___block_invoke_67(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  os_signpost_id_t v4 = *(void **)(a1 + 40);
  id v5 = a2;
  os_signpost_id_t v6 = [v4 keysToFetch];
  id v7 = objc_msgSend(v3, "applyPostFetchDecoratorsToContact:keysToFetch:unifyContactsFromMainStore:", v5, v6, objc_msgSend(*(id *)(a1 + 40), "unifyResults"));

  return v7;
}

uint64_t __66__CNAggregateContactStore_enumeratorForContactFetchRequest_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)enumeratorForChangeHistoryFetchRequest:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = self->_contactStores;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v13 = objc_msgSend(v12, "enumeratorForChangeHistoryFetchRequest:error:", v6, a4, (void)v16);
          if (v13)
          {
            uint64_t v14 = (void *)v13;
            goto LABEL_12;
          }
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 0;
LABEL_12:

  return v14;
}

- (id)contactWithUserActivityUserInfo:(id)a3 keysToFetch:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = self->_contactStores;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "contactWithUserActivityUserInfo:keysToFetch:", v6, v7, (void)v16);
        if (v13)
        {
          uint64_t v14 = (void *)v13;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 0;
LABEL_11:

  return v14;
}

- (id)userActivityUserInfoForContact:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_contactStores;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "userActivityUserInfoForContact:", v4, (void)v13);
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

- (CNContactStore)contactStoreForMatchingDictionaryWork
{
  uint64_t v2 = cn_objectResultWithObjectLock();

  return (CNContactStore *)v2;
}

id __64__CNAggregateContactStore_contactStoreForMatchingDictionaryWork__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[4];
  if (!v3)
  {
    uint64_t v4 = [v2 findContactStoreForMatchingDictionaryWork];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v4;

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
  }

  return v3;
}

- (id)findContactStoreForMatchingDictionaryWork
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = self->_contactStores;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(id *)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "supportsMatchingDictionaries", (void)v10))
        {

          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v8 = [(CNAggregateContactStore *)self mainContactStore];
LABEL_11:

  return v8;
}

- (id)descriptorForRequiredKeysForMatchingDictionary
{
  uint64_t v2 = [(CNAggregateContactStore *)self contactStoreForMatchingDictionaryWork];
  uint64_t v3 = [v2 descriptorForRequiredKeysForMatchingDictionary];

  return v3;
}

- (id)contactIdentifierWithMatchingDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNAggregateContactStore *)self contactStoreForMatchingDictionaryWork];
  uint64_t v6 = [v5 contactIdentifierWithMatchingDictionary:v4];

  return v6;
}

- (id)matchingDictionaryForContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNAggregateContactStore *)self contactStoreForMatchingDictionaryWork];
  uint64_t v6 = [v5 matchingDictionaryForContact:v4];

  return v6;
}

- (BOOL)registerChangeHistoryClientIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = self->_contactStores;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "registerChangeHistoryClientIdentifier:error:", v6, a4, (void)v14))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)unregisterChangeHistoryClientIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = self->_contactStores;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "unregisterChangeHistoryClientIdentifier:error:", v6, a4, (void)v14))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (id)changeHistoryWithFetchRequest:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = self->_contactStores;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "changeHistoryWithFetchRequest:error:", v6, a4, (void)v15);
        if (v12)
        {
          long long v13 = (void *)v12;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  long long v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)clearChangeHistoryForClientIdentifier:(id)a3 toChangeAnchor:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = self->_contactStores;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if (objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "clearChangeHistoryForClientIdentifier:toChangeAnchor:error:", v8, v9, a5, (void)v17))
        {
          BOOL v15 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)executeChangeHistoryClearRequest:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = self->_contactStores;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "executeChangeHistoryClearRequest:error:", v6, a4, (void)v14))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (id)getBackgroundColorOnImageData:(id)a3 bitmapFormat:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = self->_contactStores;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = 0;
    uint64_t v14 = *(void *)v24;
LABEL_3:
    uint64_t v15 = 0;
    long long v16 = v13;
    while (1)
    {
      if (*(void *)v24 != v14) {
        objc_enumerationMutation(v10);
      }
      long long v17 = *(void **)(*((void *)&v23 + 1) + 8 * v15);
      id v22 = v16;
      long long v18 = [v17 getBackgroundColorOnImageData:v8 bitmapFormat:v9 error:&v22];
      id v13 = v22;

      if (v18) {
        break;
      }
      ++v15;
      long long v16 = v13;
      if (v12 == v15)
      {
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
    id v13 = 0;
LABEL_11:
    long long v18 = 0;
  }

  id v19 = v18;
  long long v20 = v19;
  if (a5 && !v19) {
    *a5 = v13;
  }

  return v20;
}

- (BOOL)setBestMeIfNeededForGivenName:(id)a3 familyName:(id)a4 email:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(CNAggregateContactStore *)self mainStore];
  LOBYTE(a6) = [v13 setBestMeIfNeededForGivenName:v12 familyName:v11 email:v10 error:a6];

  return (char)a6;
}

- (id)identifierWithError:(id *)a3
{
  id v4 = [(CNAggregateContactStore *)self mainStore];
  uint64_t v5 = [v4 identifierWithError:a3];

  return v5;
}

- (int)saveSequenceCount
{
  uint64_t v2 = [(CNAggregateContactStore *)self mainStore];
  int v3 = [v2 saveSequenceCount];

  return v3;
}

- (BOOL)moveContacts:(id)a3 fromContainer:(id)a4 toContainer:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(CNAggregateContactStore *)self mainStore];
  LOBYTE(a6) = [v13 moveContacts:v12 fromContainer:v11 toContainer:v10 error:a6];

  return (char)a6;
}

- (BOOL)resetSortDataIfNeededWithError:(id *)a3
{
  id v4 = [(CNAggregateContactStore *)self mainStore];
  LOBYTE(a3) = [v4 resetSortDataIfNeededWithError:a3];

  return (char)a3;
}

- (BOOL)setDefaultAccountIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CNAggregateContactStore *)self mainStore];
  LOBYTE(a4) = [v7 setDefaultAccountIdentifier:v6 error:a4];

  return (char)a4;
}

- (id)legacyTetheredSyncDeviceAnchor
{
  uint64_t v2 = [(CNAggregateContactStore *)self mainStore];
  int v3 = [v2 legacyTetheredSyncDeviceAnchor];

  return v3;
}

- (void)setLegacyTetheredSyncDeviceAnchor:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAggregateContactStore *)self mainStore];
  [v5 setLegacyTetheredSyncDeviceAnchor:v4];
}

- (id)legacyTetheredSyncComputerAnchor
{
  uint64_t v2 = [(CNAggregateContactStore *)self mainStore];
  int v3 = [v2 legacyTetheredSyncComputerAnchor];

  return v3;
}

- (void)setLegacyTetheredSyncComputerAnchor:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAggregateContactStore *)self mainStore];
  [v5 setLegacyTetheredSyncComputerAnchor:v4];
}

- (id)individualContactCountWithError:(id *)a3
{
  id v4 = [(CNAggregateContactStore *)self mainStore];
  id v5 = [v4 individualContactCountWithError:a3];

  return v5;
}

- (id)latestConsumedChangeHistoryAnchorForClientIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CNAggregateContactStore *)self mainStore];
  id v8 = [v7 latestConsumedChangeHistoryAnchorForClientIdentifier:v6 error:a4];

  return v8;
}

- (BOOL)verifyChangeHistoryForClientIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CNAggregateContactStore *)self mainStore];
  LOBYTE(a4) = [v7 verifyChangeHistoryForClientIdentifier:v6 error:a4];

  return (char)a4;
}

- (id)fetchLimitedAccessContactIdentifiersForBundle:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAggregateContactStore *)self mainStore];
  id v6 = [v5 fetchLimitedAccessContactIdentifiersForBundle:v4];

  return v6;
}

- (void)addLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNAggregateContactStore *)self mainStore];
  [v8 addLimitedAccessForBundle:v7 contactIdentifier:v6];
}

- (void)addLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNAggregateContactStore *)self mainStore];
  [v8 addLimitedAccessForBundle:v7 contactIdentifiers:v6];
}

- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNAggregateContactStore *)self mainStore];
  [v8 removeLimitedAccessForBundle:v7 contactIdentifier:v6];
}

- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNAggregateContactStore *)self mainStore];
  [v8 removeLimitedAccessForBundle:v7 contactIdentifiers:v6];
}

- (id)getLimitedAccessContactsCountForBundle:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAggregateContactStore *)self mainStore];
  id v6 = [v5 getLimitedAccessContactsCountForBundle:v4];

  return v6;
}

- (id)populateSyncTableForLimitedAccessAboveSequenceNumber:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAggregateContactStore *)self mainStore];
  id v6 = [v5 populateSyncTableForLimitedAccessAboveSequenceNumber:v4];

  return v6;
}

- (void)purgeLimitedAccessRecordsForBundle:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAggregateContactStore *)self mainStore];
  [v5 purgeLimitedAccessRecordsForBundle:v4];
}

- (void)updateLimitedAccessTable:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAggregateContactStore *)self mainStore];
  [v5 updateLimitedAccessTable:v4];
}

- (id)getLimitedAccessLastSyncSequenceNumber:(id *)a3
{
  id v4 = [(CNAggregateContactStore *)self mainStore];
  id v5 = [v4 getLimitedAccessLastSyncSequenceNumber:a3];

  return v5;
}

- (void)applyLimitedAccessSyncEvents:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAggregateContactStore *)self mainStore];
  [v5 applyLimitedAccessSyncEvents:v4];
}

- (void)dropAllLimitedAccessRows
{
  id v2 = [(CNAggregateContactStore *)self mainStore];
  [v2 dropAllLimitedAccessRows];
}

- (void)dropAllLimitedAccessRowsAndSyncNotify
{
  id v2 = [(CNAggregateContactStore *)self mainStore];
  [v2 dropAllLimitedAccessRowsAndSyncNotify];
}

- (void)setLimitedAccessTableCurrentSequenceNumber:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAggregateContactStore *)self mainStore];
  [v5 setLimitedAccessTableCurrentSequenceNumber:v4];
}

- (BOOL)shouldAnalyzeDatabaseWithError:(id *)a3
{
  id v4 = [(CNAggregateContactStore *)self mainStore];
  LOBYTE(a3) = [v4 shouldAnalyzeDatabaseWithError:a3];

  return (char)a3;
}

- (BOOL)analyzeDatabaseWithError:(id *)a3
{
  id v4 = [(CNAggregateContactStore *)self mainStore];
  LOBYTE(a3) = [v4 analyzeDatabaseWithError:a3];

  return (char)a3;
}

- (id)getWatchLimitedAccessSyncDataStartingAtSequenceNumber:(int64_t)a3
{
  id v4 = [(CNAggregateContactStore *)self mainStore];
  id v5 = [v4 getWatchLimitedAccessSyncDataStartingAtSequenceNumber:a3];

  return v5;
}

- (void)setContactStoreForMatchingDictionaryWork:(id)a3
{
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNAggregateContactStore *)self contactStoresSupportingSpotlightIndexing];
  if ([v5 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "reindexSearchableItemsWithIdentifiers:", v4, (void)v11);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v6 = [(id)objc_opt_class() logSpotlight];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CNAggregateContactStore(Spotlight) reindexSearchableItemsWithIdentifiers:](v6);
    }
  }
}

- (id)verifyIndexWithError:(id *)a3
{
  id v4 = [(CNAggregateContactStore *)self firstContactStoreSupportingSpotlightIndexing];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 verifyIndexWithError:a3];
  }
  else
  {
    CNSetError(a3, 1002, 0);
    id v6 = 0;
  }

  return v6;
}

- (id)contactStoresSupportingSpotlightIndexing
{
  id v2 = [(CNAggregateContactStore *)self contactStores];
  int v3 = +[CNContactStore IsSpotlightIndexingSupported];
  id v4 = objc_msgSend(v2, "_cn_filter:", v3);

  return v4;
}

- (id)firstContactStoreSupportingSpotlightIndexing
{
  id v2 = [(CNAggregateContactStore *)self contactStores];
  int v3 = +[CNContactStore IsSpotlightIndexingSupported];
  id v4 = objc_msgSend(v2, "_cn_firstObjectPassingTest:", v3);

  return v4;
}

- (BOOL)isSpotlightIndexingSupported
{
  id v2 = [(CNAggregateContactStore *)self contactStores];
  int v3 = +[CNContactStore IsSpotlightIndexingSupported];
  char v4 = objc_msgSend(v2, "_cn_any:", v3);

  return v4;
}

- (id)iOSMapper
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(CNAggregateContactStore *)self contactStores];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) iOSMapper];
        if (v7)
        {
          uint64_t v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 0;
LABEL_11:

  return v8;
}

- (id)originForSuggestion:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [(CNAggregateContactStore *)self contactStores];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) originForSuggestion:v6 error:a4];
        if (v12)
        {
          long long v13 = (void *)v12;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  long long v13 = 0;
LABEL_11:

  return v13;
}

- (void)enumerateContactsAndMatchInfoWithFetchRequest:(os_log_t)log error:usingBlock:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Encountered null object(s) (aggregate)", v1, 2u);
}

@end