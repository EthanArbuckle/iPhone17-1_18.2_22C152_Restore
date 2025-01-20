@interface AAContactsProvider
- (AAContactsProvider)init;
- (id)_localContactsForCustodians:(id)a3;
- (id)_localContactsForCustodianshipOwners:(id)a3;
- (void)fetchCustodiansAndBeneficiaries:(id)a3;
- (void)fetchCustodianshipsAndBenefactors:(id)a3;
- (void)fetchMyBenefactors:(id)a3;
- (void)fetchMyBeneficiaries:(id)a3;
- (void)fetchMyCachedCustodians:(id)a3;
- (void)fetchMyCustodians:(id)a3;
- (void)fetchMyCustodianshipOwners:(id)a3;
- (void)fetchMyHealthyCustodians:(id)a3;
- (void)fetchMyWalrusEligibleCustodians:(id)a3;
- (void)fetchSuggestedBeneficiaries:(id)a3;
- (void)fetchSuggestedCustodians:(id)a3;
- (void)fetchWalrusEligibleCustodiansForExpansionCohortsWithCompletion:(id)a3;
@end

@implementation AAContactsProvider

- (AAContactsProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)AAContactsProvider;
  v2 = [(AAContactsProvider *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(AAContactsManager);
    contactsManager = v2->_contactsManager;
    v2->_contactsManager = v3;
  }
  return v2;
}

- (void)fetchCustodiansAndBeneficiaries:(id)a3
{
  id v4 = a3;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__3;
  v26[4] = __Block_byref_object_dispose__3;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__3;
  v24[4] = __Block_byref_object_dispose__3;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__3;
  v22[4] = __Block_byref_object_dispose__3;
  id v23 = [MEMORY[0x1E4F1CA48] array];
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke;
  v19[3] = &unk_1E5A48CC8;
  v21 = v26;
  objc_super v6 = v5;
  v20 = v6;
  [(AAContactsProvider *)self fetchMyCustodians:v19];
  v7 = objc_alloc_init(AAInheritanceContactsViewModel);
  dispatch_group_enter(v6);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke_2;
  v16[3] = &unk_1E5A48CC8;
  v18 = v24;
  v8 = v6;
  v17 = v8;
  [(AAInheritanceContactsViewModel *)v7 fetchBeneficiaries:v16];
  v9 = dispatch_get_global_queue(2, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke_3;
  v11[3] = &unk_1E5A48D40;
  v14 = v24;
  v15 = v22;
  id v12 = v4;
  v13 = v26;
  id v10 = v4;
  dispatch_group_notify(v8, v9, v11);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
}

void __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke_4;
  v7[3] = &unk_1E5A48CF0;
  long long v8 = *(_OWORD *)(a1 + 48);
  [v2 enumerateObjectsUsingBlock:v7];
  v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke_5;
  v6[3] = &unk_1E5A48D18;
  v6[4] = *(void *)(a1 + 56);
  [v3 enumerateObjectsUsingBlock:v6];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) copy];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
}

void __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke_4(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v5 = a2;
  if ([v3 containsObject:v5]) {
    uint64_t v4 = 5;
  }
  else {
    uint64_t v4 = 1;
  }
  [v5 setContactType:v4];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
}

void __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "containsObject:") & 1) == 0)
  {
    [v3 setContactType:4];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

- (void)fetchCustodianshipsAndBenefactors:(id)a3
{
  id v4 = a3;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__3;
  v26[4] = __Block_byref_object_dispose__3;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__3;
  v24[4] = __Block_byref_object_dispose__3;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__3;
  v22[4] = __Block_byref_object_dispose__3;
  id v23 = [MEMORY[0x1E4F1CA48] array];
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke;
  v19[3] = &unk_1E5A48CC8;
  v21 = v26;
  objc_super v6 = v5;
  v20 = v6;
  [(AAContactsProvider *)self fetchMyCustodianshipOwners:v19];
  v7 = objc_alloc_init(AAInheritanceContactsViewModel);
  dispatch_group_enter(v6);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke_2;
  v16[3] = &unk_1E5A48CC8;
  v18 = v24;
  long long v8 = v6;
  v17 = v8;
  [(AAInheritanceContactsViewModel *)v7 fetchBenefactors:v16];
  v9 = dispatch_get_global_queue(2, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke_3;
  v11[3] = &unk_1E5A48D40;
  v14 = v24;
  v15 = v22;
  id v12 = v4;
  v13 = v26;
  id v10 = v4;
  dispatch_group_notify(v8, v9, v11);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
}

void __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke_4;
  v7[3] = &unk_1E5A48CF0;
  long long v8 = *(_OWORD *)(a1 + 48);
  [v2 enumerateObjectsUsingBlock:v7];
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke_5;
  v6[3] = &unk_1E5A48D18;
  v6[4] = *(void *)(a1 + 56);
  [v3 enumerateObjectsUsingBlock:v6];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) copy];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
}

void __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v5 = a2;
  if ([v3 containsObject:v5]) {
    uint64_t v4 = 10;
  }
  else {
    uint64_t v4 = 2;
  }
  [v5 setContactType:v4];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
}

void __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "containsObject:") & 1) == 0)
  {
    [v3 setContactType:8];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

- (void)fetchSuggestedCustodians:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(AACustodianController);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__AAContactsProvider_fetchSuggestedCustodians___block_invoke;
  v6[3] = &unk_1E5A48D68;
  id v7 = v3;
  id v5 = v3;
  [(AACustodianController *)v4 fetchSuggestedCustodiansWithCompletion:v6];
}

void __47__AAContactsProvider_fetchSuggestedCustodians___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 count];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchMyCachedCustodians:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AACustodianController);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__AAContactsProvider_fetchMyCachedCustodians___block_invoke;
  v7[3] = &unk_1E5A48D90;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AACustodianController *)v5 fetchCachedTrustedContactsWithCompletion:v7];
}

void __46__AAContactsProvider_fetchMyCachedCustodians___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 count];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) _localContactsForCustodians:v6];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(void, void))(v4 + 16))(*(void *)(a1 + 40), MEMORY[0x1E4F1CBF0]);
  }
}

- (void)fetchMyCustodians:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AACustodianController);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__AAContactsProvider_fetchMyCustodians___block_invoke;
  v7[3] = &unk_1E5A48D90;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AACustodianController *)v5 fetchTrustedContactsWithCompletion:v7];
}

void __40__AAContactsProvider_fetchMyCustodians___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 count];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) _localContactsForCustodians:v6];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(void, void))(v4 + 16))(*(void *)(a1 + 40), MEMORY[0x1E4F1CBF0]);
  }
}

- (void)fetchMyHealthyCustodians:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AACustodianController);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__AAContactsProvider_fetchMyHealthyCustodians___block_invoke;
  v7[3] = &unk_1E5A48D90;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AACustodianController *)v5 fetchTrustedContactsWithCompletion:v7];
}

void __47__AAContactsProvider_fetchMyHealthyCustodians___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "status", (void)v13) == 2) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = [*(id *)(a1 + 32) _localContactsForCustodians:v4];
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
}

- (void)fetchMyWalrusEligibleCustodians:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AACustodianController);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__AAContactsProvider_fetchMyWalrusEligibleCustodians___block_invoke;
  v7[3] = &unk_1E5A48D90;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AACustodianController *)v5 fetchTrustedContactsWithCompletion:v7];
}

void __54__AAContactsProvider_fetchMyWalrusEligibleCustodians___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
          long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v13, "status", (void)v16) == 2
            && [v13 isAcceptedAndShared]
            && [v13 isIdMSConfirmed]
            && [v13 preflightStatus])
          {

            uint64_t v14 = *(void *)(a1 + 40);
            long long v15 = [*(id *)(a1 + 32) _localContactsForCustodians:v8];
            (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v15, 0);

            goto LABEL_16;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
LABEL_16:
}

- (void)fetchWalrusEligibleCustodiansForExpansionCohortsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AACustodianController);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__AAContactsProvider_fetchWalrusEligibleCustodiansForExpansionCohortsWithCompletion___block_invoke;
  v7[3] = &unk_1E5A48D90;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AACustodianController *)v5 fetchTrustedContactsWithCompletion:v7];
}

void __85__AAContactsProvider_fetchWalrusEligibleCustodiansForExpansionCohortsWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
          long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v13, "status", (void)v16) == 2
            && [v13 isAcceptedAndShared]
            && [v13 isIdMSConfirmed]
            && [v13 preflightStatus]
            || [v13 status] == 1)
          {

            uint64_t v14 = *(void *)(a1 + 40);
            long long v15 = [*(id *)(a1 + 32) _localContactsForCustodians:v8];
            (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v15, 0);

            goto LABEL_18;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
LABEL_18:
}

- (void)fetchMyCustodianshipOwners:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AACustodianController);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__AAContactsProvider_fetchMyCustodianshipOwners___block_invoke;
  v7[3] = &unk_1E5A48D90;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AACustodianController *)v5 fetchCustodianshipInfoWithCompletion:v7];
}

void __49__AAContactsProvider_fetchMyCustodianshipOwners___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "status", (void)v13) == 2) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = [*(id *)(a1 + 32) _localContactsForCustodianshipOwners:v4];
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
}

- (void)fetchSuggestedBeneficiaries:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(AAInheritanceContactsViewModel);
  [(AAInheritanceContactsViewModel *)v4 fetchSuggestedBeneficiaries:v3];
}

- (void)fetchMyBeneficiaries:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(AAInheritanceContactsViewModel);
  [(AAInheritanceContactsViewModel *)v4 fetchBeneficiaries:v3];
}

- (void)fetchMyBenefactors:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(AAInheritanceContactsViewModel);
  [(AAInheritanceContactsViewModel *)v4 fetchBenefactors:v3];
}

- (id)_localContactsForCustodians:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v27 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        contactsManager = self->_contactsManager;
        uint64_t v10 = [v8 handle];
        uint64_t v11 = [(AAContactsManager *)contactsManager contactForHandle:v10];

        if (v11)
        {
          id v12 = [v11 givenName];
          long long v13 = [v12 trim];
          if ([v13 length])
          {
            long long v14 = [v11 familyName];
            long long v15 = [v14 trim];
            uint64_t v16 = [v15 length];

            if (v16)
            {
              long long v17 = [AALocalContactInfo alloc];
              uint64_t v18 = [v8 handle];
              long long v19 = [(AALocalContactInfo *)v17 initWithHandle:v18 contact:v11];
              goto LABEL_12;
            }
          }
          else
          {
          }
        }
        v20 = [AALocalContactInfo alloc];
        uint64_t v18 = [v8 handle];
        uint64_t v21 = [v8 firstName];
        v22 = [v8 lastName];
        long long v19 = [(AALocalContactInfo *)v20 initWithHandle:v18 firstName:v21 lastName:v22];

LABEL_12:
        id v23 = [v8 custodianID];
        [(AALocalContactInfo *)v19 setCustodianID:v23];

        -[AALocalContactInfo setTrustedContactStatus:](v19, "setTrustedContactStatus:", [v8 status]);
        -[AALocalContactInfo setIsAcceptedAndShared:](v19, "setIsAcceptedAndShared:", [v8 isAcceptedAndShared]);
        -[AALocalContactInfo setIsIdMSConfirmed:](v19, "setIsIdMSConfirmed:", [v8 isIdMSConfirmed]);
        -[AALocalContactInfo setPreflightStatus:](v19, "setPreflightStatus:", [v8 preflightStatus]);
        [(AALocalContactInfo *)v19 setContactType:1];
        [v27 addObject:v19];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v5);
  }

  return v27;
}

- (id)_localContactsForCustodianshipOwners:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        contactsManager = self->_contactsManager;
        id v12 = [v10 ownerHandle];
        long long v13 = [(AAContactsManager *)contactsManager contactForHandle:v12];

        long long v14 = [AALocalContactInfo alloc];
        long long v15 = [v10 ownerHandle];
        uint64_t v16 = [(AALocalContactInfo *)v14 initWithHandle:v15 contact:v13];

        long long v17 = [v10 custodianID];
        [(AALocalContactInfo *)v16 setCustodianID:v17];

        -[AALocalContactInfo setTrustedContactStatus:](v16, "setTrustedContactStatus:", [v10 status]);
        [(AALocalContactInfo *)v16 setContactType:2];
        [v5 addObject:v16];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  uint64_t v18 = (void *)[v5 copy];

  return v18;
}

- (void).cxx_destruct
{
}

@end