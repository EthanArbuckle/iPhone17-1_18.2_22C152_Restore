@interface SGDSpotlightReceiver
- (BOOL)_isFullyInitialized;
- (SGDSpotlightReceiver)init;
- (SGDSuggestManager)suggestManager;
- (id)supportedContentTypes;
- (void)_accessSummarizationPipelineForBundleId:(id)a3 block:(id)a4;
- (void)_addSearchableItem:(id)a3 bundleID:(id)a4;
- (void)addInteractions:(id)a3 bundleID:(id)a4 protectionClass:(id)a5;
- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4;
- (void)addUserAction:(id)a3 withItem:(id)a4;
- (void)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4;
- (void)deleteAllSearchableItemsWithBundleID:(id)a3;
- (void)deleteAllUserActivities:(id)a3;
- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5;
- (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5;
- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 bundleID:(id)a4;
- (void)deleteSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4;
- (void)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)a4;
- (void)purgeSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4;
- (void)setSuggestManager:(id)a3;
@end

@implementation SGDSpotlightReceiver

- (void)addInteractions:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(SGDSpotlightReceiver *)self _isFullyInitialized])
  {
    if (objc_opt_respondsToSelector())
    {
      v11 = (void *)MEMORY[0x1CB79B230]();
      [(SpotlightReceiver *)self->_duReceiver addInteractions:v8 bundleID:v9 protectionClass:v10];
    }
    v12 = sgLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v8 count];
      v14 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_85);
      *(_DWORD *)buf = 134218498;
      v21 = (const char *)v13;
      __int16 v22 = 2114;
      id v23 = v9;
      __int16 v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: received %tu interactions from %{public}@: %@", buf, 0x20u);
    }
    v15 = [MEMORY[0x1E4F93768] defaultReceiver];
    id v19 = 0;
    char v16 = [v15 donateInteractions:v8 bundleIdentifier:v9 error:&v19];
    v17 = v19;

    if ((v16 & 1) == 0)
    {
      v18 = sgLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = (const char *)v17;
        _os_log_error_impl(&dword_1CA650000, v18, OS_LOG_TYPE_ERROR, "SGDSpotlightReceiver: addInteractions: error donating to ProactiveHarvesting: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v17 = sgLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[SGDSpotlightReceiver addInteractions:bundleID:protectionClass:]";
      _os_log_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEFAULT, "%s: SGDSpotlightReceiver is not fully initialized", buf, 0xCu);
    }
  }
}

void __70__SGDSpotlightReceiver__accessSummarizationPipelineForBundleId_block___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v3 = (void *)getPSUSummarizationPipelineClass_softClass;
  uint64_t v11 = getPSUSummarizationPipelineClass_softClass;
  if (!getPSUSummarizationPipelineClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getPSUSummarizationPipelineClass_block_invoke;
    v7[3] = &unk_1E65C0148;
    v7[4] = &v8;
    __getPSUSummarizationPipelineClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  v5 = +[SGContactStoreFactory contactStore];
  v6 = [v4 sharedPipelineWithContactStore:v5 incomingBundleId:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);
}

void __60__SGDSpotlightReceiver_addOrUpdateSearchableItems_bundleID___block_invoke_44(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void (**)(uint64_t))(v2 + 16);
  id v4 = a2;
  v3(v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 processSearchableItem:v5];
}

id __60__SGDSpotlightReceiver_addOrUpdateSearchableItems_bundleID___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v2)
  {
    v3 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F23840], "sg_clonableItemAtIndex:inCodedArray:", *(void *)(a1 + 64), *(void *)(a1 + 32));
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if ([(id)*MEMORY[0x1E4F937B0] isEqual:*(void *)(a1 + 40)])
    {
      v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) attributeSet];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v8 = objc_msgSend(v7, "emailHeaders", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v42 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v31;
LABEL_5:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * v12);
          if (![@"message-id" caseInsensitiveCompare:v13]) {
            break;
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v42 count:16];
            if (v10) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        v14 = [v7 emailHeaders];
        v15 = [v14 objectForKeyedSubscript:v13];
        char v16 = objc_msgSend(v15, "_pas_componentsJoinedByString:", @", ");

        v17 = sgLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = *(void *)(a1 + 40);
          id v19 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) uniqueIdentifier];
          v20 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) domainIdentifier];
          *(_DWORD *)buf = 138544130;
          uint64_t v35 = v18;
          __int16 v36 = 2114;
          v37 = v19;
          __int16 v38 = 2114;
          v39 = v20;
          __int16 v40 = 2114;
          v41 = v16;
          _os_log_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver got email bid:%{public}@ uid:%{public}@ did:%{public}@ mid:%{public}@", buf, 0x2Au);
        }
        if (v16) {
          goto LABEL_18;
        }
      }
      else
      {
LABEL_11:
      }
      v21 = sgLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(a1 + 40);
        id v23 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) uniqueIdentifier];
        __int16 v24 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) domainIdentifier];
        *(_DWORD *)buf = 138543874;
        uint64_t v35 = v22;
        __int16 v36 = 2114;
        v37 = v23;
        __int16 v38 = 2114;
        v39 = v24;
        _os_log_impl(&dword_1CA650000, v21, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver got item from mail bid:%{public}@ uid:%{public}@ did:%{public}@ without message-id, continuing anyway", buf, 0x20u);
      }
      char v16 = 0;
LABEL_18:
    }
    v25 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) uniqueIdentifier];
    if (!v25)
    {
      uint64_t v26 = sgLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        uint64_t v28 = *(void *)(a1 + 40);
        v29 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138543619;
        uint64_t v35 = v28;
        __int16 v36 = 2117;
        v37 = v29;
        _os_log_fault_impl(&dword_1CA650000, v26, OS_LOG_TYPE_FAULT, "Received item %{public}@ %{sensitive}@ with nil uniqueIdentifier", buf, 0x16u);
      }

      if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
        abort();
      }
      v25 = @"nil (this is a bug!!!!)";
    }
    [*(id *)(a1 + 48) addObject:v25];

    uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  return v2;
}

- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v36 = a4;
  v6 = sgLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = [v35 count];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v36;
    _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: Received %tu items from %@.", buf, 0x16u);
  }

  BOOL v7 = [(SGDSpotlightReceiver *)self _isFullyInitialized];
  uint64_t v8 = (uint64_t *)MEMORY[0x1E4F5DC38];
  if (!v7)
  {
    uint64_t v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[SGDSpotlightReceiver addOrUpdateSearchableItems:bundleID:]";
      uint64_t v11 = "%s: SGDSpotlightReceiver is not fully initialized";
      uint64_t v12 = v10;
      uint32_t v13 = 12;
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = (void *)MEMORY[0x1CB79B230]();
    [(SpotlightReceiver *)self->_duReceiver addOrUpdateSearchableItems:v35 bundleID:v36];
  }
  if ([v36 isEqualToString:*v8])
  {
    notify_post("com.apple.proactive.SocialHighlightsRefreshed");
    uint64_t v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v11 = "SGDSpotlightReceiver: invalidated highlight cache and notified of refresh";
      uint64_t v12 = v10;
      uint32_t v13 = 2;
LABEL_11:
      _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
LABEL_13:
  char v45 = 0;
  long long v33 = objc_opt_new();
  v34 = objc_opt_new();
  if ([v35 count])
  {
    unint64_t v14 = 0;
    uint64_t v32 = *v8;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    do
    {
      char v16 = (void *)MEMORY[0x1CB79B230]();
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v49 = __Block_byref_object_copy__32703;
      *(void *)&long long v50 = __Block_byref_object_dispose__32704;
      *((void *)&v50 + 1) = 0;
      v39[0] = v15;
      v39[1] = 3221225472;
      v39[2] = __60__SGDSpotlightReceiver_addOrUpdateSearchableItems_bundleID___block_invoke;
      v39[3] = &unk_1E65BBE80;
      uint64_t v43 = buf;
      unint64_t v44 = v14;
      id v17 = v35;
      id v40 = v17;
      id v18 = v36;
      id v41 = v18;
      id v42 = v34;
      id v19 = (void *)MEMORY[0x1CB79B4C0](v39);
      v37[0] = v15;
      v37[1] = 3221225472;
      v37[2] = __60__SGDSpotlightReceiver_addOrUpdateSearchableItems_bundleID___block_invoke_44;
      v37[3] = &unk_1E65BBEA8;
      v20 = v19;
      id v38 = v20;
      [(SGDSpotlightReceiver *)self _accessSummarizationPipelineForBundleId:v18 block:v37];
      if ([(SGDSpotlightReceiver *)self _isFullyInitialized])
      {
        if ([MEMORY[0x1E4F93760] shouldAdmitContentFromBundleIdentifier:v18])
        {
          if ([MEMORY[0x1E4F93770] searchableItemIsStoredEncryptedWithGetterBlock:v20 bundleIdentifier:v18])
          {
            v21 = v20[2](v20);
            uint64_t v22 = [v21 uniqueIdentifier];
            [v33 addObject:v22];
          }
          else
          {
            if (![MEMORY[0x1E4F93770] searchableItemIsEligibleForHarvestingWithGetterBlock:v20 bundleIdentifier:v18 eligibleExceptForAge:&v45])
            {
              if (!v45) {
                goto LABEL_24;
              }
              if (![v18 isEqualToString:v32]) {
                goto LABEL_24;
              }
              id v23 = [(SGDSpotlightReceiver *)self suggestManager];
              int v31 = [v23 isSearchableItemPartOfReimportWithGetterBlock:v20 bundleIdentifier:v18];

              if (!v31) {
                goto LABEL_24;
              }
            }
            v21 = v20[2](v20);
            [(SGDSpotlightReceiver *)self _addSearchableItem:v21 bundleID:v18];
          }
        }
        else
        {
          v21 = sgLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v46 = 138543362;
            id v47 = v36;
            _os_log_impl(&dword_1CA650000, v21, OS_LOG_TYPE_DEFAULT, "ignoring item since the bundle %{public}@ is disallowed by user's settings", v46, 0xCu);
          }
        }
      }
LABEL_24:

      _Block_object_dispose(buf, 8);
      ++v14;
    }
    while (v14 < [v17 count]);
  }
  __int16 v24 = sgLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = [v34 count];
    uint64_t v26 = [v35 count];
    *(_DWORD *)buf = 134218754;
    *(void *)&uint8_t buf[4] = v25;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2114;
    v49 = (uint64_t (*)(uint64_t, uint64_t))v36;
    LOWORD(v50) = 2112;
    *(void *)((char *)&v50 + 2) = v34;
    _os_log_impl(&dword_1CA650000, v24, OS_LOG_TYPE_DEFAULT, "Decoded %tu of %tu items received from %{public}@: %@", buf, 0x2Au);
  }

  if ([v33 count] && -[SGDSpotlightReceiver _isFullyInitialized](self, "_isFullyInitialized"))
  {
    v27 = sgLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = [v33 count];
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v28;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v36;
      *(_WORD *)&buf[22] = 2112;
      v49 = (uint64_t (*)(uint64_t, uint64_t))v33;
      _os_log_impl(&dword_1CA650000, v27, OS_LOG_TYPE_DEFAULT, "Will delete %tu encrypted items from %{public}@: %@", buf, 0x20u);
    }

    [(SGDSpotlightReceiver *)self deleteSearchableItemsWithIdentifiers:v33 bundleID:v36];
    v29 = sgLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = [v33 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v30;
      _os_log_impl(&dword_1CA650000, v29, OS_LOG_TYPE_DEFAULT, "Deleted %tu encrypted items", buf, 0xCu);
    }
  }
}

- (BOOL)_isFullyInitialized
{
  uint64_t v2 = [(SGDSpotlightReceiver *)self suggestManager];
  BOOL v3 = v2 != 0;

  return v3;
}

- (SGDSuggestManager)suggestManager
{
  return (SGDSuggestManager *)objc_getProperty(self, a2, 40, 1);
}

- (void)_accessSummarizationPipelineForBundleId:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((_os_feature_enabled_impl() & 1) != 0
    || (_os_feature_enabled_impl() & 1) != 0
    || _os_feature_enabled_impl())
  {
    BOOL v7 = (void *)MEMORY[0x1E4F93B10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__SGDSpotlightReceiver__accessSummarizationPipelineForBundleId_block___block_invoke;
    v8[3] = &unk_1E65C0440;
    id v10 = v6;
    id v9 = v5;
    [v7 runBlockWhenDeviceIsClassCUnlocked:v8];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 bundleID:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(SGDSpotlightReceiver *)self _isFullyInitialized])
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v18 = "-[SGDSpotlightReceiver deleteSearchableItemsWithDomainIdentifiers:bundleID:]";
      _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEFAULT, "%s: SGDSpotlightReceiver is not fully initialized", buf, 0xCu);
    }
    goto LABEL_15;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = (void *)MEMORY[0x1CB79B230]();
    [(SpotlightReceiver *)self->_duReceiver deleteSearchableItemsWithDomainIdentifiers:v6 bundleID:v7];
  }
  if (([v7 isEqualToString:*MEMORY[0x1E4F5DEE0]] & 1) == 0 && objc_msgSend(v6, "count"))
  {
    id v9 = [objc_alloc(MEMORY[0x1E4F93B20]) initWithDomainsFromArray:v6];
    id v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      id v18 = (const char *)[v6 count];
      __int16 v19 = 2048;
      uint64_t v20 = [v9 count];
      __int16 v21 = 2114;
      id v22 = v7;
      __int16 v23 = 2112;
      __int16 v24 = v9;
      _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: deleting %tu domain identifiers (%tu after removing overlaps) for %{public}@: %@", buf, 0x2Au);
    }

    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F937A0]) initWithBundleIdentifier:v7 domainSelection:v9];
    uint64_t v12 = [MEMORY[0x1E4F93768] defaultReceiver];
    id v16 = 0;
    char v13 = [v12 deleteContentWithRequest:v11 error:&v16];
    unint64_t v14 = (char *)v16;

    if ((v13 & 1) == 0)
    {
      uint64_t v15 = sgLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v14;
        _os_log_error_impl(&dword_1CA650000, v15, OS_LOG_TYPE_ERROR, "SGDSpotlightReceiver: deleteSearchableItemsWithDomainIdentifiers: error sending deletion to ProactiveHarvesting: %@", buf, 0xCu);
      }
    }
LABEL_15:
  }
}

uint64_t __65__SGDSpotlightReceiver_addInteractions_bundleID_protectionClass___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestManager, 0);
  objc_storeStrong((id *)&self->_duReceiver, 0);
  objc_storeStrong((id *)&self->_deleteInteractionGroupIdDropbox, 0);
  objc_storeStrong((id *)&self->_deleteInteractionIdDropbox, 0);
  objc_storeStrong((id *)&self->_deleteInteractionBundleIdDropbox, 0);
}

- (void)setSuggestManager:(id)a3
{
}

- (void)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (char *)a4;
  if ([(SGDSpotlightReceiver *)self _isFullyInitialized])
  {
    if (objc_opt_respondsToSelector())
    {
      id v9 = (void *)MEMORY[0x1CB79B230]();
      [(SpotlightReceiver *)self->_duReceiver deleteUserActivitiesWithPersistentIdentifiers:v7 bundleID:v8];
    }
    id v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v8;
      __int16 v16 = 2048;
      uint64_t v17 = [v7 count];
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: deleting interactions from %{public}@ matching %tu persistent identifiers: %@", buf, 0x20u);
    }

    if (v8)
    {
      if (v7)
      {
LABEL_8:
        uint64_t v11 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_108_32610);
        [(SGDSpotlightReceiver *)self deleteSearchableItemsWithIdentifiers:v11 bundleID:v8];
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"SGDSpotlightReceiver.m", 592, @"Invalid parameter not satisfying: %@", @"bundleID" object file lineNumber description];

      if (v7) {
        goto LABEL_8;
      }
    }
    char v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGDSpotlightReceiver.m", 593, @"Invalid parameter not satisfying: %@", @"persistentIdentifiers" object file lineNumber description];

    goto LABEL_8;
  }
  uint64_t v11 = sgLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[SGDSpotlightReceiver deleteUserActivitiesWithPersistentIdentifiers:bundleID:]";
    _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEFAULT, "%s: SGDSpotlightReceiver is not fully initialized", buf, 0xCu);
  }
LABEL_11:
}

uint64_t __79__SGDSpotlightReceiver_deleteUserActivitiesWithPersistentIdentifiers_bundleID___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F93798] uniqueIdForPersistentIdentifier:a2];
}

- (void)deleteAllUserActivities:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = (char *)a3;
  if ([(SGDSpotlightReceiver *)self _isFullyInitialized])
  {
    if (objc_opt_respondsToSelector())
    {
      id v6 = (void *)MEMORY[0x1CB79B230]();
      [(SpotlightReceiver *)self->_duReceiver deleteAllUserActivities:v5];
    }
    id v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v5;
      _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: deleting all user activities from %{public}@", buf, 0xCu);
    }

    if (!v5)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"SGDSpotlightReceiver.m", 575, @"Invalid parameter not satisfying: %@", @"bundleID" object file lineNumber description];
    }
    uint64_t v10 = *MEMORY[0x1E4F93748];
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
    [(SGDSpotlightReceiver *)self deleteSearchableItemsWithDomainIdentifiers:v8 bundleID:v5];
  }
  else
  {
    uint64_t v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v12 = "-[SGDSpotlightReceiver deleteAllUserActivities:]";
      _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "%s: SGDSpotlightReceiver is not fully initialized", buf, 0xCu);
    }
  }
}

- (void)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = (char *)a3;
  id v8 = a4;
  if ([(SGDSpotlightReceiver *)self _isFullyInitialized])
  {
    if (objc_opt_respondsToSelector())
    {
      id v9 = (void *)MEMORY[0x1CB79B230]();
      [(SpotlightReceiver *)self->_duReceiver deleteAllInteractionsWithBundleID:v7 protectionClass:v8];
    }
    uint64_t v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v21 = v7;
      _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: deleting all interactions from %{public}@", buf, 0xCu);
    }

    if (!v7)
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"SGDSpotlightReceiver.m", 545, @"Invalid parameter not satisfying: %@", @"bundleID" object file lineNumber description];
    }
    deleteInteractionBundleIdDropbox = self->_deleteInteractionBundleIdDropbox;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__SGDSpotlightReceiver_deleteAllInteractionsWithBundleID_protectionClass___block_invoke;
    v16[3] = &unk_1E65BBF40;
    uint64_t v17 = 0;
    uint64_t v12 = v7;
    __int16 v18 = v12;
    [(SGCoalescingDropBox *)deleteInteractionBundleIdDropbox updateBox:v16];
    uint64_t v19 = *MEMORY[0x1E4F93740];
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    [(SGDSpotlightReceiver *)self deleteSearchableItemsWithDomainIdentifiers:v13 bundleID:v12];

    unint64_t v14 = v17;
  }
  else
  {
    unint64_t v14 = sgLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v21 = "-[SGDSpotlightReceiver deleteAllInteractionsWithBundleID:protectionClass:]";
      _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEFAULT, "%s: SGDSpotlightReceiver is not fully initialized", buf, 0xCu);
    }
  }
}

void __74__SGDSpotlightReceiver_deleteAllInteractionsWithBundleID_protectionClass___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v5 addObject:v4];
  unint64_t v6 = [v5 count];

  if (v6 >> 3 >= 0x271) {
    *a3 = 1;
  }
}

- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = (char *)a4;
  id v11 = a5;
  if (![(SGDSpotlightReceiver *)self _isFullyInitialized])
  {
    __int16 v18 = sgLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v25 = "-[SGDSpotlightReceiver deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:]";
      _os_log_impl(&dword_1CA650000, v18, OS_LOG_TYPE_DEFAULT, "%s: SGDSpotlightReceiver is not fully initialized", buf, 0xCu);
    }
    goto LABEL_12;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = (void *)MEMORY[0x1CB79B230]();
    [(SpotlightReceiver *)self->_duReceiver deleteInteractionsWithGroupIdentifiers:v9 bundleID:v10 protectionClass:v11];
  }
  uint64_t v13 = sgLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v25 = v10;
    __int16 v26 = 2048;
    uint64_t v27 = [v9 count];
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: deleting interactions from %{public}@ matching %tu group identifiers: %@", buf, 0x20u);
  }

  if (!v10)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SGDSpotlightReceiver.m", 513, @"Invalid parameter not satisfying: %@", @"bundleID" object file lineNumber description];
  }
  if ([v9 count])
  {
    deleteInteractionGroupIdDropbox = self->_deleteInteractionGroupIdDropbox;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __88__SGDSpotlightReceiver_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass___block_invoke;
    v20[3] = &unk_1E65BBF18;
    __int16 v21 = 0;
    uint64_t v15 = v10;
    uint64_t v22 = v15;
    id v16 = v9;
    id v23 = v16;
    [(SGCoalescingDropBox *)deleteInteractionGroupIdDropbox updateBox:v20];
    uint64_t v17 = objc_msgSend(v16, "_pas_mappedArrayWithTransform:", &__block_literal_global_102_32629);
    [(SGDSpotlightReceiver *)self deleteSearchableItemsWithDomainIdentifiers:v17 bundleID:v15];

    __int16 v18 = v21;
LABEL_12:
  }
}

void __88__SGDSpotlightReceiver_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v5 = [v8 objectForKeyedSubscript:*(void *)(a1 + 40)];
  unint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    [v8 setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];
  }

  [v7 addObjectsFromArray:*(void *)(a1 + 48)];
  if ((unint64_t)[v7 count] >> 3 >= 0x271) {
    *a3 = 1;
  }
}

uint64_t __88__SGDSpotlightReceiver_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F93780] domainIdForInteractionGroupId:a2];
}

- (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = (char *)a4;
  id v11 = a5;
  if (![(SGDSpotlightReceiver *)self _isFullyInitialized])
  {
    __int16 v18 = sgLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v25 = "-[SGDSpotlightReceiver deleteInteractionsWithIdentifiers:bundleID:protectionClass:]";
      _os_log_impl(&dword_1CA650000, v18, OS_LOG_TYPE_DEFAULT, "%s: SGDSpotlightReceiver is not fully initialized", buf, 0xCu);
    }
    goto LABEL_12;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = (void *)MEMORY[0x1CB79B230]();
    [(SpotlightReceiver *)self->_duReceiver deleteInteractionsWithIdentifiers:v9 bundleID:v10 protectionClass:v11];
  }
  uint64_t v13 = sgLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v25 = v10;
    __int16 v26 = 2048;
    uint64_t v27 = [v9 count];
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: deleting interactions from %{public}@ matching %tu identifiers: %@", buf, 0x20u);
  }

  if (!v10)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SGDSpotlightReceiver.m", 480, @"Invalid parameter not satisfying: %@", @"bundleID" object file lineNumber description];
  }
  if ([v9 count])
  {
    deleteInteractionIdDropbox = self->_deleteInteractionIdDropbox;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __83__SGDSpotlightReceiver_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke;
    v20[3] = &unk_1E65BBF18;
    __int16 v21 = 0;
    uint64_t v15 = v10;
    uint64_t v22 = v15;
    id v16 = v9;
    id v23 = v16;
    [(SGCoalescingDropBox *)deleteInteractionIdDropbox updateBox:v20];
    uint64_t v17 = objc_msgSend(v16, "_pas_mappedArrayWithTransform:", &__block_literal_global_99_32636);
    [(SGDSpotlightReceiver *)self deleteSearchableItemsWithIdentifiers:v17 bundleID:v15];

    __int16 v18 = v21;
LABEL_12:
  }
}

void __83__SGDSpotlightReceiver_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v5 = [v8 objectForKeyedSubscript:*(void *)(a1 + 40)];
  unint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    [v8 setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];
  }

  [v7 addObjectsFromArray:*(void *)(a1 + 48)];
  if ((unint64_t)[v7 count] >> 3 >= 0x271) {
    *a3 = 1;
  }
}

uint64_t __83__SGDSpotlightReceiver_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F93780] uniqueIdForInteractionIdentifier:a2];
}

- (id)supportedContentTypes
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_duReceiver && (objc_opt_respondsToSelector() & 1) != 0)
  {
    BOOL v3 = [(SpotlightReceiver *)self->_duReceiver supportedContentTypes];
  }
  else
  {
    BOOL v3 = 0;
  }
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = SGWeakLinkStringConstant();
  uint64_t v13 = v5;
  unint64_t v6 = SGWeakLinkStringConstant();
  unint64_t v14 = v6;
  id v7 = SGWeakLinkStringConstant();
  uint64_t v15 = v7;
  id v8 = SGWeakLinkStringConstant();
  id v16 = v8;
  id v9 = SGWeakLinkStringConstant();
  uint64_t v17 = v9;
  __int16 v18 = @"com.apple.safari.history";
  uint64_t v19 = @"UNNotificationContentTypeDefault";
  uint64_t v20 = @"UNNotificationContentTypeMessagingDirect";
  __int16 v21 = @"UNNotificationContentTypeMessagingGroup";
  uint64_t v22 = @"UNNotificationContentTypeVoicemail";
  id v23 = @"NotificationGroup";
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:11];
  id v11 = objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v10, v13, v14, v15, v16);

  return v11;
}

- (void)deleteAllSearchableItemsWithBundleID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (char *)a3;
  if (![(SGDSpotlightReceiver *)self _isFullyInitialized])
  {
    id v11 = sgLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[SGDSpotlightReceiver deleteAllSearchableItemsWithBundleID:]";
      _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEFAULT, "%s: SGDSpotlightReceiver is not fully initialized", buf, 0xCu);
    }
    goto LABEL_16;
  }
  if (objc_opt_respondsToSelector())
  {
    id v5 = (void *)MEMORY[0x1CB79B230]();
    [(SpotlightReceiver *)self->_duReceiver deleteAllSearchableItemsWithBundleID:v4];
  }
  if (([v4 isEqualToString:*MEMORY[0x1E4F5DEE0]] & 1) == 0)
  {
    unint64_t v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v4;
      _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: deleting entire bundle identifier %{public}@", buf, 0xCu);
    }

    if ([(id)*MEMORY[0x1E4F937A8] isEqual:v4])
    {
      id v7 = +[SGDPluginManager sharedInstance];
      [v7 deleteSpotlightReferencesWithBundleIdentifier:v4 completion:0];
    }
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F937A0]) initWithBundleIdentifier:v4];
    id v9 = [MEMORY[0x1E4F93768] defaultReceiver];
    id v13 = 0;
    char v10 = [v9 deleteContentWithRequest:v8 error:&v13];
    id v11 = v13;

    if ((v10 & 1) == 0)
    {
      uint64_t v12 = sgLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v15 = v4;
        __int16 v16 = 2112;
        uint64_t v17 = v11;
        _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "SGDSpotlightReceiver: deleteAllSearchableItemsWithBundleID:%{public}@ error sending deletion to ProactiveHarvesting: %@", buf, 0x16u);
      }
    }
LABEL_16:
  }
}

- (void)deleteSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __70__SGDSpotlightReceiver_deleteSearchableItemsWithIdentifiers_bundleID___block_invoke;
    v21[3] = &unk_1E65BBED0;
    id v8 = v6;
    id v22 = v8;
    id v9 = v7;
    id v23 = v9;
    [(SGDSpotlightReceiver *)self _accessSummarizationPipelineForBundleId:v9 block:v21];
    if ([(SGDSpotlightReceiver *)self _isFullyInitialized])
    {
      if (objc_opt_respondsToSelector())
      {
        char v10 = (void *)MEMORY[0x1CB79B230]();
        [(SpotlightReceiver *)self->_duReceiver deleteSearchableItemsWithIdentifiers:v8 bundleID:v9];
      }
      if ([v9 isEqualToString:*MEMORY[0x1E4F5DEE0]]) {
        goto LABEL_16;
      }
      id v11 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v8];
      uint64_t v12 = sgLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [v8 count];
        uint64_t v14 = [v11 count];
        *(_DWORD *)buf = 134218754;
        uint64_t v25 = (const char *)v13;
        __int16 v26 = 2048;
        uint64_t v27 = v14;
        __int16 v28 = 2114;
        id v29 = v9;
        __int16 v30 = 2112;
        int v31 = v11;
        _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: deleting %tu unique identifiers (%tu after de-duplication) for %{public}@: %@", buf, 0x2Au);
      }

      uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F937A0]) initWithBundleIdentifier:v9 uniqueIdentifiers:v11];
      __int16 v16 = [MEMORY[0x1E4F93768] defaultReceiver];
      id v20 = 0;
      char v17 = [v16 deleteContentWithRequest:v15 error:&v20];
      uint64_t v18 = (char *)v20;

      if ((v17 & 1) == 0)
      {
        uint64_t v19 = sgLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v25 = v18;
          _os_log_error_impl(&dword_1CA650000, v19, OS_LOG_TYPE_ERROR, "SGDSpotlightReceiver: deleteSearchableItemsWithIdentifiers: error sending deletion to ProactiveHarvesting: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v11 = sgLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v25 = "-[SGDSpotlightReceiver deleteSearchableItemsWithIdentifiers:bundleID:]";
        _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEFAULT, "%s: SGDSpotlightReceiver is not fully initialized", buf, 0xCu);
      }
    }

LABEL_16:
  }
}

uint64_t __70__SGDSpotlightReceiver_deleteSearchableItemsWithIdentifiers_bundleID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 handleDeletionOfItemsWithIdentifiers:*(void *)(a1 + 32) bundleIdentifier:*(void *)(a1 + 40)];
}

- (void)purgeSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(SGDSpotlightReceiver *)self _isFullyInitialized])
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v18 = "-[SGDSpotlightReceiver purgeSearchableItemsWithIdentifiers:bundleID:]";
      _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEFAULT, "%s: SGDSpotlightReceiver is not fully initialized", buf, 0xCu);
    }
    goto LABEL_18;
  }
  if (objc_opt_respondsToSelector())
  {
    id v8 = (void *)MEMORY[0x1CB79B230]();
    [(SpotlightReceiver *)self->_duReceiver purgeSearchableItemsWithIdentifiers:v6 bundleID:v7];
LABEL_8:
    goto LABEL_9;
  }
  if (objc_opt_respondsToSelector())
  {
    id v8 = (void *)MEMORY[0x1CB79B230]();
    [(SpotlightReceiver *)self->_duReceiver deleteSearchableItemsWithIdentifiers:v6 bundleID:v7];
    goto LABEL_8;
  }
LABEL_9:
  if (([v7 isEqualToString:*MEMORY[0x1E4F5DEE0]] & 1) == 0 && objc_msgSend(v6, "count"))
  {
    id v9 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];
    char v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      uint64_t v18 = (const char *)[v6 count];
      __int16 v19 = 2048;
      uint64_t v20 = [v9 count];
      __int16 v21 = 2114;
      id v22 = v7;
      __int16 v23 = 2112;
      uint64_t v24 = v9;
      _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: purging %tu unique identifiers (%tu after de-duplication) for %{public}@: %@", buf, 0x2Au);
    }

    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F937A0]) initWithBundleIdentifier:v7 purgedUniqueIdentifiers:v9];
    uint64_t v12 = [MEMORY[0x1E4F93768] defaultReceiver];
    id v16 = 0;
    char v13 = [v12 deleteContentWithRequest:v11 error:&v16];
    uint64_t v14 = (char *)v16;

    if ((v13 & 1) == 0)
    {
      uint64_t v15 = sgLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v14;
        _os_log_error_impl(&dword_1CA650000, v15, OS_LOG_TYPE_ERROR, "SGDSpotlightReceiver: purgeSearchableItemsWithIdentifiers: error sending purge to ProactiveHarvesting: %@", buf, 0xCu);
      }
    }
LABEL_18:
  }
}

- (void)addUserAction:(id)a3 withItem:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(SGDSpotlightReceiver *)self _isFullyInitialized])
  {
    if (objc_opt_respondsToSelector())
    {
      id v8 = (void *)MEMORY[0x1CB79B230]();
      [(SpotlightReceiver *)self->_duReceiver addUserAction:v6 withItem:v7];
    }
    id v9 = [MEMORY[0x1E4F93768] defaultReceiver];
    id v13 = 0;
    char v10 = [v9 donateUserAction:v6 searchableItem:v7 error:&v13];
    id v11 = v13;

    if ((v10 & 1) == 0)
    {
      uint64_t v12 = sgLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = (const char *)v11;
        _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "SGDSpotlightReceiver: addUserAction: error donating to ProactiveHarvesting: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v11 = sgLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[SGDSpotlightReceiver addUserAction:withItem:]";
      _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEFAULT, "%s: SGDSpotlightReceiver is not fully initialized", buf, 0xCu);
    }
  }
}

- (void)_addSearchableItem:(id)a3 bundleID:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(SGDSpotlightReceiver *)self _isFullyInitialized])
  {
    id v8 = [MEMORY[0x1E4F93768] defaultReceiver];
    id v14 = v6;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    id v13 = 0;
    char v10 = [v8 donateSearchableItems:v9 bundleIdentifier:v7 error:&v13];
    id v11 = v13;

    if ((v10 & 1) == 0)
    {
      uint64_t v12 = sgLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = (const char *)v11;
        _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "SGDSpotlightReceiver: _addSearchableItem: error donating to ProactiveHarvesting: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v11 = sgLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "-[SGDSpotlightReceiver _addSearchableItem:bundleID:]";
      _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEFAULT, "%s: SGDSpotlightReceiver is not fully initialized", buf, 0xCu);
    }
  }
}

- (SGDSpotlightReceiver)init
{
  v30.receiver = self;
  v30.super_class = (Class)SGDSpotlightReceiver;
  uint64_t v2 = [(SGDSpotlightReceiver *)&v30 init];
  if (v2)
  {
    BOOL v3 = [SGCoalescingDropBox alloc];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __28__SGDSpotlightReceiver_init__block_invoke_2;
    v27[3] = &unk_1E65BBDF0;
    id v28 = 0;
    uint64_t v4 = v2;
    id v29 = v4;
    uint64_t v5 = [(SGCoalescingDropBox *)v3 initWithName:"SGDSpotlightReceiver.deleteInteractionBundleIdDropbox" boxMaker:&__block_literal_global_32729 handler:v27 qos:17];
    deleteInteractionBundleIdDropbox = v4->_deleteInteractionBundleIdDropbox;
    v4->_deleteInteractionBundleIdDropbox = (SGCoalescingDropBox *)v5;

    id v7 = [SGCoalescingDropBox alloc];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __28__SGDSpotlightReceiver_init__block_invoke_3;
    v24[3] = &unk_1E65BBE38;
    id v25 = 0;
    id v8 = v4;
    __int16 v26 = v8;
    uint64_t v9 = [(SGCoalescingDropBox *)v7 initWithName:"SGDSpotlightReceiver.deleteInteractionIdDropbox" boxMaker:&__block_literal_global_17_32731 handler:v24 qos:17];
    deleteInteractionIdDropbox = v8->_deleteInteractionIdDropbox;
    v8->_deleteInteractionIdDropbox = (SGCoalescingDropBox *)v9;

    id v11 = [SGCoalescingDropBox alloc];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __28__SGDSpotlightReceiver_init__block_invoke_3_25;
    __int16 v21 = &unk_1E65BBE38;
    id v22 = 0;
    uint64_t v12 = v8;
    __int16 v23 = v12;
    uint64_t v13 = [(SGCoalescingDropBox *)v11 initWithName:"SGDSpotlightReceiver.deleteInteractionGroupIdDropbox" boxMaker:&__block_literal_global_24_32733 handler:&v18 qos:17];
    deleteInteractionGroupIdDropbox = v12->_deleteInteractionGroupIdDropbox;
    v12->_deleteInteractionGroupIdDropbox = (SGCoalescingDropBox *)v13;

    uint64_t v15 = objc_opt_new();
    duReceiver = v12->_duReceiver;
    v12->_duReceiver = (SpotlightReceiver *)v15;

    -[SGDSpotlightReceiver _accessSummarizationPipelineForBundleId:block:](v12, "_accessSummarizationPipelineForBundleId:block:", 0, &__block_literal_global_31_32735, v18, v19, v20, v21);
  }
  return v2;
}

void __28__SGDSpotlightReceiver_init__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = dispatch_group_create();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        dispatch_group_enter(v4);
        char v10 = sgLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v20 = v9;
          _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "Deleting all Interactions from %@.", buf, 0xCu);
        }

        id v11 = [*(id *)(a1 + 40) suggestManager];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __28__SGDSpotlightReceiver_init__block_invoke_10;
        v13[3] = &unk_1E65BBDC8;
        id v14 = v4;
        [v11 deleteInteractionsWithBundleId:v9 completion:v13];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v6);
  }

  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

void __28__SGDSpotlightReceiver_init__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = dispatch_group_create();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v9 = (void *)MEMORY[0x1CB79B230]();
        dispatch_group_enter(v3);
        char v10 = sgLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = [v4 objectForKeyedSubscript:v8];
          uint64_t v12 = [v11 count];
          *(_DWORD *)buf = 134218242;
          uint64_t v25 = v12;
          __int16 v26 = 2112;
          uint64_t v27 = v8;
          _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "Deleting %tu Interactions from %@.", buf, 0x16u);
        }
        uint64_t v13 = [*(id *)(a1 + 40) suggestManager];
        id v14 = [v4 objectForKeyedSubscript:v8];
        long long v15 = [v14 allObjects];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __28__SGDSpotlightReceiver_init__block_invoke_19;
        v18[3] = &unk_1E65BBDC8;
        uint64_t v19 = v3;
        [v13 deleteInteractionsWithBundleId:v8 identifiers:v15 completion:v18];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v6);
  }

  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
}

void __28__SGDSpotlightReceiver_init__block_invoke_3_25(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = dispatch_group_create();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v9 = (void *)MEMORY[0x1CB79B230]();
        dispatch_group_enter(v3);
        char v10 = sgLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = [v4 objectForKeyedSubscript:v8];
          uint64_t v12 = [v11 count];
          *(_DWORD *)buf = 134218242;
          uint64_t v25 = v12;
          __int16 v26 = 2112;
          uint64_t v27 = v8;
          _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "Deleting %tu group indentifiers for Interactions from %@.", buf, 0x16u);
        }
        uint64_t v13 = [*(id *)(a1 + 40) suggestManager];
        id v14 = [v4 objectForKeyedSubscript:v8];
        long long v15 = [v14 allObjects];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __28__SGDSpotlightReceiver_init__block_invoke_26;
        v18[3] = &unk_1E65BBDC8;
        uint64_t v19 = v3;
        [v13 deleteInteractionsWithBundleId:v8 groupIdentifiers:v15 completion:v18];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v6);
  }

  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
}

id __28__SGDSpotlightReceiver_init__block_invoke_2_22()
{
  v0 = objc_opt_new();
  return v0;
}

void __28__SGDSpotlightReceiver_init__block_invoke_26(uint64_t a1)
{
}

id __28__SGDSpotlightReceiver_init__block_invoke_2_14()
{
  v0 = objc_opt_new();
  return v0;
}

void __28__SGDSpotlightReceiver_init__block_invoke_19(uint64_t a1)
{
}

id __28__SGDSpotlightReceiver_init__block_invoke()
{
  v0 = objc_opt_new();
  return v0;
}

void __28__SGDSpotlightReceiver_init__block_invoke_10(uint64_t a1)
{
}

@end