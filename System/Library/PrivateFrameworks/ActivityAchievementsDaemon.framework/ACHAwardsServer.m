@interface ACHAwardsServer
+ (id)taskIdentifier;
- (ACHAwardsServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (NSCalendar)gregorianCalendar;
- (OS_dispatch_queue)queue;
- (id)_transactionContextForReadingProtectedDataWithIdentifier:(id)a3;
- (id)_transactionContextForWritingProtectedDataWithIdentifier:(id)a3;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)protectedDataAvailableWithCompletion:(id)a3;
- (void)remote_addEarnedInstances:(id)a3 completion:(id)a4;
- (void)remote_addEarnedInstances:(id)a3 removingEarnedInstances:(id)a4 completion:(id)a5;
- (void)remote_addOrUpdateTemplates:(id)a3 completion:(id)a4;
- (void)remote_addTemplates:(id)a3 completion:(id)a4;
- (void)remote_addTemplates:(id)a3 removingTemplates:(id)a4 completion:(id)a5;
- (void)remote_countOfEarnedInstancesForTemplateUniqueName:(id)a3 completion:(id)a4;
- (void)remote_countOfEarnedInstancesForUniqueNames:(id)a3 completion:(id)a4;
- (void)remote_fetchAllEarnedInstancesWithCompletion:(id)a3;
- (void)remote_fetchAllTemplatesWithCompletion:(id)a3;
- (void)remote_fetchEarnedInstancesForEarnedDateComponentsString:(id)a3 completion:(id)a4;
- (void)remote_fetchEarnedInstancesForTemplateUniqueName:(id)a3 completion:(id)a4;
- (void)remote_fetchMostRecentEarnedInstanceForTemplateUniqueName:(id)a3 completion:(id)a4;
- (void)remote_fetchMostRecentEarnedInstancesForTemplateUniqueNames:(id)a3 completion:(id)a4;
- (void)remote_removeAllEarnedInstancesWithCompletion:(id)a3;
- (void)remote_removeAllTemplatesWithCompletion:(id)a3;
- (void)remote_removeEarnedInstances:(id)a3 completion:(id)a4;
- (void)remote_removeEarnedInstancesForTemplateUniqueName:(id)a3 completion:(id)a4;
- (void)remote_removeTemplates:(id)a3 completion:(id)a4;
- (void)setGregorianCalendar:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation ACHAwardsServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x263F234A0];
}

- (ACHAwardsServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)ACHAwardsServer;
  v6 = [(HDStandardTaskServer *)&v12 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
  if (v6)
  {
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    gregorianCalendar = v6->_gregorianCalendar;
    v6->_gregorianCalendar = (NSCalendar *)v9;
  }
  return v6;
}

- (void)protectedDataAvailableWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ACHAwardsServer *)self queue];
  dispatch_assert_queue_not_V2(v5);

  v6 = [(ACHAwardsServer *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__ACHAwardsServer_protectedDataAvailableWithCompletion___block_invoke;
  v8[3] = &unk_2645168B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __56__ACHAwardsServer_protectedDataAvailableWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) profile];
  v2 = [v3 database];
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v1, [v2 isProtectedDataAvailable]);
}

- (id)_transactionContextForWritingProtectedDataWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(HDStandardTaskServer *)self client];
  v6 = [v5 profile];
  id v7 = [v6 database];
  id v13 = 0;
  v8 = +[ACHDatabaseAssertion assertionWithDatabase:v7 identifier:v4 error:&v13];

  id v9 = v13;
  if (v9)
  {
    v10 = ACHLogXPC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACHAwardsServer _transactionContextForWritingProtectedDataWithIdentifier:]((uint64_t)v9, v10);
    }
  }
  v11 = ACHDatabaseContextWithAccessibilityAssertion(v8);
  [v11 setRequiresWrite:1];
  [v11 setRequiresProtectedData:1];

  return v11;
}

- (id)_transactionContextForReadingProtectedDataWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(HDStandardTaskServer *)self client];
  v6 = [v5 profile];
  id v7 = [v6 database];
  id v13 = 0;
  v8 = +[ACHDatabaseAssertion assertionWithDatabase:v7 identifier:v4 error:&v13];
  id v9 = v13;

  if (v9)
  {
    v10 = ACHLogXPC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(ACHAwardsServer *)(uint64_t)v4 _transactionContextForReadingProtectedDataWithIdentifier:v10];
    }
  }
  v11 = ACHDatabaseContextWithAccessibilityAssertion(v8);
  [v11 setRequiresWrite:0];
  [v11 setRequiresProtectedData:1];

  return v11;
}

- (void)remote_addTemplates:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ACHAwardsServer *)self queue];
  dispatch_assert_queue_not_V2(v8);

  id v9 = [(ACHAwardsServer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ACHAwardsServer_remote_addTemplates_completion___block_invoke;
  block[3] = &unk_264516AB0;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v9, block);
}

void __50__ACHAwardsServer_remote_addTemplates_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _transactionContextForWritingProtectedDataWithIdentifier:@"AddTemplates"];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) client];
  v5 = [v4 profile];
  id v7 = 0;
  +[ACHTemplateEntity insertTemplates:v3 provenance:0 useLegacySyncIdentity:0 profile:v5 databaseContext:v2 error:&v7];
  id v6 = v7;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)remote_addOrUpdateTemplates:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t))a4;
  v8 = [(ACHAwardsServer *)self queue];
  dispatch_assert_queue_not_V2(v8);

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  id v20 = 0;
  id v9 = [(ACHAwardsServer *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__ACHAwardsServer_remote_addOrUpdateTemplates_completion___block_invoke;
  v11[3] = &unk_264516B20;
  v11[4] = self;
  id v13 = &v21;
  id v14 = &v15;
  id v10 = v6;
  id v12 = v10;
  dispatch_sync(v9, v11);

  v7[2](v7, *((unsigned __int8 *)v22 + 24), v16[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __58__ACHAwardsServer_remote_addOrUpdateTemplates_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _transactionContextForWritingProtectedDataWithIdentifier:@"AddOrUpdateTemplates"];
  uint64_t v3 = [*(id *)(a1 + 32) profile];
  id v4 = [v3 database];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v5 + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__ACHAwardsServer_remote_addOrUpdateTemplates_completion___block_invoke_2;
  v9[3] = &unk_264516AD8;
  id v6 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v11 = v2;
  id v7 = v2;
  char v8 = [v4 performTransactionWithContext:v7 error:&obj block:v9 inaccessibilityHandler:&__block_literal_global_8];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
}

BOOL __58__ACHAwardsServer_remote_addOrUpdateTemplates_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*(id *)(a1 + 32) profile];
  id v6 = +[ACHTemplateEntity allTemplatesWithProfile:v5 error:a3];

  if (*a3)
  {
    BOOL v7 = 0;
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v29 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v15 = [v14 uniqueName];
          [v8 setObject:v14 forKeyedSubscript:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v11);
    }

    id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v17 = *(id *)(a1 + 40);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v30 + 1) + 8 * j) uniqueName];
          uint64_t v23 = [v8 objectForKeyedSubscript:v22];

          if (v23) {
            [v16 addObject:v23];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v19);
    }

    if ([v16 count]
      && ([*(id *)(a1 + 32) profile],
          char v24 = objc_claimAutoreleasedReturnValue(),
          BOOL v25 = +[ACHTemplateEntity removeTemplates:v16 profile:v24 error:a3], v24, !v25))
    {
      BOOL v7 = 0;
    }
    else
    {
      uint64_t v26 = *(void *)(a1 + 40);
      v27 = [*(id *)(a1 + 32) profile];
      BOOL v7 = +[ACHTemplateEntity insertTemplates:v26 provenance:0 useLegacySyncIdentity:0 profile:v27 databaseContext:*(void *)(a1 + 48) error:a3];
    }
    id v6 = v29;
  }
  return v7;
}

uint64_t __58__ACHAwardsServer_remote_addOrUpdateTemplates_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  if (v4)
  {
    if (a3) {
      *a3 = v4;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return 0;
}

- (void)remote_addTemplates:(id)a3 removingTemplates:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, uint64_t))a5;
  uint64_t v11 = [(ACHAwardsServer *)self queue];
  dispatch_assert_queue_not_V2(v11);

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__7;
  char v24 = __Block_byref_object_dispose__7;
  id v25 = 0;
  uint64_t v12 = [(ACHAwardsServer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__ACHAwardsServer_remote_addTemplates_removingTemplates_completion___block_invoke;
  block[3] = &unk_264516B90;
  block[4] = self;
  uint64_t v18 = &v26;
  uint64_t v19 = &v20;
  id v13 = v9;
  id v16 = v13;
  id v14 = v8;
  id v17 = v14;
  dispatch_sync(v12, block);

  v10[2](v10, *((unsigned __int8 *)v27 + 24), v21[5]);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

void __68__ACHAwardsServer_remote_addTemplates_removingTemplates_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _transactionContextForWritingProtectedDataWithIdentifier:@"TemplateUpdate"];
  uint64_t v3 = [*(id *)(a1 + 32) profile];
  id v4 = [v3 database];
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id v21 = *(id *)(v5 + 40);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __68__ACHAwardsServer_remote_addTemplates_removingTemplates_completion___block_invoke_2;
  v16[3] = &unk_264516508;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v17 = v6;
  uint64_t v18 = v7;
  id v19 = *(id *)(a1 + 48);
  id v20 = v2;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__ACHAwardsServer_remote_addTemplates_removingTemplates_completion___block_invoke_299;
  v12[3] = &unk_264516B68;
  id v13 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v14 = v8;
  uint64_t v15 = v9;
  id v10 = v2;
  char v11 = [v4 performTransactionWithContext:v10 error:&v21 block:v16 inaccessibilityHandler:v12];
  objc_storeStrong((id *)(v5 + 40), v21);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v11;
}

BOOL __68__ACHAwardsServer_remote_addTemplates_removingTemplates_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if ([*(id *)(a1 + 32) count]
    && (uint64_t v5 = *(void *)(a1 + 32),
        [*(id *)(a1 + 40) profile],
        id v6 = objc_claimAutoreleasedReturnValue(),
        BOOL v7 = +[ACHTemplateEntity removeTemplates:v5 profile:v6 error:a3], v6, !v7))
  {
    uint64_t v12 = ACHLogTemplates();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __68__ACHAwardsServer_remote_addTemplates_removingTemplates_completion___block_invoke_2_cold_1(a3, v12);
    }

    return 0;
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = [*(id *)(a1 + 40) profile];
    BOOL v10 = +[ACHTemplateEntity insertTemplates:v8 provenance:0 useLegacySyncIdentity:0 profile:v9 databaseContext:*(void *)(a1 + 56) error:a3];

    return v10;
  }
}

uint64_t __68__ACHAwardsServer_remote_addTemplates_removingTemplates_completion___block_invoke_299(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = objc_msgSend(a1[4], "hk_map:", &__block_literal_global_303_0);
  id v6 = objc_msgSend(a1[5], "hk_map:", &__block_literal_global_306);
  BOOL v7 = [v6 arrayByAddingObjectsFromArray:v5];
  uint64_t v8 = [a1[6] profile];
  uint64_t v9 = [v8 database];
  uint64_t v10 = [v9 addJournalEntries:v7 error:a3];

  return v10;
}

ACHTemplateJournalEntry *__68__ACHAwardsServer_remote_addTemplates_removingTemplates_completion___block_invoke_2_300(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[ACHTemplateJournalEntry alloc] initWithTemplate:v2 provenance:0 useLegacySyncIdentity:0 action:0];

  return v3;
}

ACHTemplateJournalEntry *__68__ACHAwardsServer_remote_addTemplates_removingTemplates_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[ACHTemplateJournalEntry alloc] initWithTemplate:v2 provenance:0 useLegacySyncIdentity:0 action:1];

  return v3;
}

- (void)remote_fetchAllTemplatesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, uint64_t))a3;
  uint64_t v5 = [(ACHAwardsServer *)self queue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__7;
  uint64_t v18 = __Block_byref_object_dispose__7;
  id v19 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = __Block_byref_object_copy__7;
  uint64_t v12 = __Block_byref_object_dispose__7;
  id v13 = 0;
  id v6 = [(ACHAwardsServer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__ACHAwardsServer_remote_fetchAllTemplatesWithCompletion___block_invoke;
  block[3] = &unk_264516BB8;
  block[4] = self;
  void block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(v6, block);

  v4[2](v4, v15[5], v9[5]);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

void __58__ACHAwardsServer_remote_fetchAllTemplatesWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) profile];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = +[ACHTemplateEntity allTemplatesWithProfile:v2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)remote_removeAllTemplatesWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, uint64_t))a3;
  uint64_t v5 = [(ACHAwardsServer *)self queue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = __Block_byref_object_copy__7;
  uint64_t v12 = __Block_byref_object_dispose__7;
  id v13 = 0;
  id v6 = [(ACHAwardsServer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__ACHAwardsServer_remote_removeAllTemplatesWithCompletion___block_invoke;
  block[3] = &unk_264516BE0;
  block[4] = self;
  void block[5] = &v8;
  block[6] = &v14;
  dispatch_sync(v6, block);

  v4[2](v4, *((unsigned __int8 *)v15 + 24), v9[5]);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

void __59__ACHAwardsServer_remote_removeAllTemplatesWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) profile];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = +[ACHTemplateEntity allTemplatesWithProfile:v2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) || v4 && ![v4 count])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) profile];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(id *)(v6 + 40);
    BOOL v7 = +[ACHTemplateEntity removeTemplates:v4 profile:v5 error:&v8];
    objc_storeStrong((id *)(v6 + 40), v8);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
  }
}

- (void)remote_removeTemplates:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, uint64_t))a4;
  id v8 = [(ACHAwardsServer *)self queue];
  dispatch_assert_queue_not_V2(v8);

  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__7;
  id v20 = __Block_byref_object_dispose__7;
  id v21 = 0;
  uint64_t v9 = [(ACHAwardsServer *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__ACHAwardsServer_remote_removeTemplates_completion___block_invoke;
  v11[3] = &unk_264516A38;
  uint64_t v14 = &v22;
  id v10 = v6;
  id v12 = v10;
  id v13 = self;
  uint64_t v15 = &v16;
  dispatch_sync(v9, v11);

  v7[2](v7, *((unsigned __int8 *)v23 + 24), v17[5]);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

void __53__ACHAwardsServer_remote_removeTemplates_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) profile];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  BOOL v5 = +[ACHTemplateEntity removeTemplates:v2 profile:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
}

- (void)remote_addEarnedInstances:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, uint64_t))a4;
  id v8 = [(ACHAwardsServer *)self queue];
  dispatch_assert_queue_not_V2(v8);

  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__7;
  id v19 = __Block_byref_object_dispose__7;
  id v20 = 0;
  uint64_t v9 = [(ACHAwardsServer *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__ACHAwardsServer_remote_addEarnedInstances_completion___block_invoke;
  v11[3] = &unk_264516C08;
  void v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  id v13 = &v15;
  uint64_t v14 = &v21;
  dispatch_sync(v9, v11);

  v7[2](v7, *((unsigned __int8 *)v22 + 24), v16[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __56__ACHAwardsServer_remote_addEarnedInstances_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _transactionContextForWritingProtectedDataWithIdentifier:@"AddEarnedInstances"];
  uint64_t v3 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 40)];
  uint64_t v4 = [*(id *)(a1 + 32) profile];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v5 + 40);
  id v6 = +[ACHEarnedInstanceEntity insertEarnedInstances:v3 provenance:0 useLegacySyncIdentity:0 profile:v4 databaseContext:v2 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);

  BOOL v7 = 0;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    BOOL v7 = [v6 count] != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7;
}

- (void)remote_removeEarnedInstances:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, uint64_t))a4;
  id v8 = [(ACHAwardsServer *)self queue];
  dispatch_assert_queue_not_V2(v8);

  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__7;
  id v20 = __Block_byref_object_dispose__7;
  id v21 = 0;
  uint64_t v9 = [(ACHAwardsServer *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__ACHAwardsServer_remote_removeEarnedInstances_completion___block_invoke;
  v11[3] = &unk_264516A38;
  uint64_t v14 = &v22;
  id v10 = v6;
  id v12 = v10;
  id v13 = self;
  uint64_t v15 = &v16;
  dispatch_sync(v9, v11);

  v7[2](v7, *((unsigned __int8 *)v23 + 24), v17[5]);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

void __59__ACHAwardsServer_remote_removeEarnedInstances_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) profile];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  BOOL v5 = +[ACHEarnedInstanceEntity removeEarnedInstances:v2 profile:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
}

- (void)remote_addEarnedInstances:(id)a3 removingEarnedInstances:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, uint64_t))a5;
  char v11 = [(ACHAwardsServer *)self queue];
  dispatch_assert_queue_not_V2(v11);

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  char v29 = __Block_byref_object_copy__7;
  long long v30 = __Block_byref_object_dispose__7;
  id v31 = (id)MEMORY[0x263EFFA68];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__7;
  uint64_t v24 = __Block_byref_object_dispose__7;
  id v25 = 0;
  id v12 = [(ACHAwardsServer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__ACHAwardsServer_remote_addEarnedInstances_removingEarnedInstances_completion___block_invoke;
  block[3] = &unk_264516C78;
  block[4] = self;
  uint64_t v18 = &v20;
  id v13 = v9;
  id v16 = v13;
  id v14 = v8;
  id v17 = v14;
  id v19 = &v26;
  dispatch_sync(v12, block);

  v10[2](v10, v27[5], v21[5]);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

void __80__ACHAwardsServer_remote_addEarnedInstances_removingEarnedInstances_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _transactionContextForWritingProtectedDataWithIdentifier:@"AddEarnedInstancesAndRemove"];
  uint64_t v3 = [*(id *)(a1 + 32) profile];
  uint64_t v4 = [v3 database];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v21 = *(id *)(v5 + 40);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__ACHAwardsServer_remote_addEarnedInstances_removingEarnedInstances_completion___block_invoke_2;
  v15[3] = &unk_264516C30;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v16 = v6;
  uint64_t v17 = v7;
  id v18 = *(id *)(a1 + 48);
  id v19 = v2;
  uint64_t v20 = *(void *)(a1 + 64);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__ACHAwardsServer_remote_addEarnedInstances_removingEarnedInstances_completion___block_invoke_3;
  v11[3] = &unk_264516B68;
  id v12 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v13 = v8;
  uint64_t v14 = v9;
  id v10 = v2;
  [v4 performTransactionWithContext:v10 error:&v21 block:v15 inaccessibilityHandler:v11];
  objc_storeStrong((id *)(v5 + 40), v21);
}

BOOL __80__ACHAwardsServer_remote_addEarnedInstances_removingEarnedInstances_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (![*(id *)(a1 + 32) count]
    || (uint64_t v5 = *(void *)(a1 + 32),
        [*(id *)(a1 + 40) profile],
        id v6 = objc_claimAutoreleasedReturnValue(),
        BOOL v7 = +[ACHEarnedInstanceEntity removeEarnedInstances:v5 profile:v6 error:a3], v6, v7))
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:*(void *)(a1 + 48)];
    uint64_t v9 = [*(id *)(a1 + 40) profile];
    id v10 = +[ACHEarnedInstanceEntity insertEarnedInstances:v8 provenance:0 useLegacySyncIdentity:0 profile:v9 databaseContext:*(void *)(a1 + 56) error:a3];

    BOOL v7 = v10 != 0;
    if (v10) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v10);
    }
  }
  return v7;
}

uint64_t __80__ACHAwardsServer_remote_addEarnedInstances_removingEarnedInstances_completion___block_invoke_3(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = objc_msgSend(a1[4], "hk_map:", &__block_literal_global_317);
  id v6 = objc_msgSend(a1[5], "hk_map:", &__block_literal_global_320);
  BOOL v7 = [v6 arrayByAddingObjectsFromArray:v5];
  id v8 = [a1[6] profile];
  uint64_t v9 = [v8 database];
  uint64_t v10 = [v9 addJournalEntries:v7 error:a3];

  return v10;
}

ACHEarnedInstanceJournalEntry *__80__ACHAwardsServer_remote_addEarnedInstances_removingEarnedInstances_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[ACHEarnedInstanceJournalEntry alloc] initWithEarnedInstance:v2 provenance:0 useLegacySyncIdentity:0 action:0];

  return v3;
}

ACHEarnedInstanceJournalEntry *__80__ACHAwardsServer_remote_addEarnedInstances_removingEarnedInstances_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[ACHEarnedInstanceJournalEntry alloc] initWithEarnedInstance:v2 provenance:0 useLegacySyncIdentity:0 action:1];

  return v3;
}

- (void)remote_removeEarnedInstancesForTemplateUniqueName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, uint64_t))a4;
  id v8 = [(ACHAwardsServer *)self queue];
  dispatch_assert_queue_not_V2(v8);

  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__7;
  uint64_t v20 = __Block_byref_object_dispose__7;
  id v21 = 0;
  uint64_t v9 = [(ACHAwardsServer *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__ACHAwardsServer_remote_removeEarnedInstancesForTemplateUniqueName_completion___block_invoke;
  v11[3] = &unk_264516A38;
  uint64_t v14 = &v22;
  id v10 = v6;
  id v12 = v10;
  id v13 = self;
  uint64_t v15 = &v16;
  dispatch_sync(v9, v11);

  v7[2](v7, *((unsigned __int8 *)v23 + 24), v17[5]);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

void __80__ACHAwardsServer_remote_removeEarnedInstancesForTemplateUniqueName_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) profile];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  BOOL v5 = +[ACHEarnedInstanceEntity removeEarnedInstancesForTemplateUniqueName:v2 profile:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
}

- (void)remote_removeAllEarnedInstancesWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, uint64_t))a3;
  BOOL v5 = [(ACHAwardsServer *)self queue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = __Block_byref_object_copy__7;
  id v12 = __Block_byref_object_dispose__7;
  id v13 = 0;
  id v6 = [(ACHAwardsServer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__ACHAwardsServer_remote_removeAllEarnedInstancesWithCompletion___block_invoke;
  block[3] = &unk_264516BB8;
  block[4] = self;
  void block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(v6, block);

  v4[2](v4, *((unsigned __int8 *)v15 + 24), v9[5]);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

void __65__ACHAwardsServer_remote_removeAllEarnedInstancesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) profile];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  BOOL v4 = +[ACHEarnedInstanceEntity removeAllEarnedInstancesWithProfile:v2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
}

- (void)remote_fetchAllEarnedInstancesWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t, uint64_t))a3;
  BOOL v5 = [(ACHAwardsServer *)self queue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__7;
  uint64_t v18 = __Block_byref_object_dispose__7;
  id v19 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = __Block_byref_object_copy__7;
  id v12 = __Block_byref_object_dispose__7;
  id v13 = 0;
  id v6 = [(ACHAwardsServer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__ACHAwardsServer_remote_fetchAllEarnedInstancesWithCompletion___block_invoke;
  block[3] = &unk_264516BB8;
  block[4] = self;
  void block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(v6, block);

  v4[2](v4, v15[5], v9[5]);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

void __64__ACHAwardsServer_remote_fetchAllEarnedInstancesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) profile];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = +[ACHEarnedInstanceEntity allEarnedInstancesWithProfile:v2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)remote_fetchEarnedInstancesForTemplateUniqueName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v8 = [(ACHAwardsServer *)self queue];
  dispatch_assert_queue_not_V2(v8);

  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  char v25 = __Block_byref_object_copy__7;
  uint64_t v26 = __Block_byref_object_dispose__7;
  id v27 = 0;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__7;
  uint64_t v20 = __Block_byref_object_dispose__7;
  id v21 = 0;
  uint64_t v9 = [(ACHAwardsServer *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__ACHAwardsServer_remote_fetchEarnedInstancesForTemplateUniqueName_completion___block_invoke;
  v11[3] = &unk_264516A38;
  uint64_t v14 = &v22;
  id v10 = v6;
  id v12 = v10;
  id v13 = self;
  uint64_t v15 = &v16;
  dispatch_sync(v9, v11);

  v7[2](v7, v23[5], v17[5]);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

void __79__ACHAwardsServer_remote_fetchEarnedInstancesForTemplateUniqueName_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) profile];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = +[ACHEarnedInstanceEntity earnedInstancesForTemplateUniqueName:v2 profile:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)remote_fetchMostRecentEarnedInstanceForTemplateUniqueName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v8 = [(ACHAwardsServer *)self queue];
  dispatch_assert_queue_not_V2(v8);

  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__7;
  char v25 = __Block_byref_object_dispose__7;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__7;
  id v19 = __Block_byref_object_dispose__7;
  id v20 = 0;
  uint64_t v9 = [(ACHAwardsServer *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __88__ACHAwardsServer_remote_fetchMostRecentEarnedInstanceForTemplateUniqueName_completion___block_invoke;
  v11[3] = &unk_264516B20;
  void v11[4] = self;
  id v13 = &v15;
  uint64_t v14 = &v21;
  id v10 = v6;
  id v12 = v10;
  dispatch_sync(v9, v11);

  v7[2](v7, v22[5], v16[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __88__ACHAwardsServer_remote_fetchMostRecentEarnedInstanceForTemplateUniqueName_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _transactionContextForReadingProtectedDataWithIdentifier:@"Fetch Most Recent Instnace"];
  uint64_t v3 = [*(id *)(a1 + 32) profile];
  uint64_t v4 = [v3 database];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __88__ACHAwardsServer_remote_fetchMostRecentEarnedInstanceForTemplateUniqueName_completion___block_invoke_2;
  v9[3] = &unk_264515F30;
  uint64_t v12 = *(void *)(a1 + 56);
  id obj = v6;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = v7;
  uint64_t v11 = v8;
  [v4 performTransactionWithContext:v2 error:&obj block:v9 inaccessibilityHandler:0];
  objc_storeStrong((id *)(v5 + 40), obj);
}

BOOL __88__ACHAwardsServer_remote_fetchMostRecentEarnedInstanceForTemplateUniqueName_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) profile];
  uint64_t v7 = +[ACHEarnedInstanceEntity mostRecentEarnedInstanceForTemplateUniqueName:v5 profile:v6 error:a3];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return *a3 == 0;
}

- (void)remote_fetchMostRecentEarnedInstancesForTemplateUniqueNames:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v8 = [(ACHAwardsServer *)self queue];
  dispatch_assert_queue_not_V2(v8);

  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__7;
  char v25 = __Block_byref_object_dispose__7;
  id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__7;
  id v19 = __Block_byref_object_dispose__7;
  id v20 = 0;
  uint64_t v9 = [(ACHAwardsServer *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __90__ACHAwardsServer_remote_fetchMostRecentEarnedInstancesForTemplateUniqueNames_completion___block_invoke;
  v11[3] = &unk_264516730;
  void v11[4] = self;
  id v13 = &v15;
  id v10 = v6;
  id v12 = v10;
  uint64_t v14 = &v21;
  dispatch_sync(v9, v11);

  v7[2](v7, v22[5], v16[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __90__ACHAwardsServer_remote_fetchMostRecentEarnedInstancesForTemplateUniqueNames_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) profile];
  uint64_t v3 = [*(id *)(a1 + 32) _transactionContextForReadingProtectedDataWithIdentifier:@"Fetch Most Recent Instnace"];
  uint64_t v4 = [*(id *)(a1 + 32) profile];
  uint64_t v5 = [v4 database];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __90__ACHAwardsServer_remote_fetchMostRecentEarnedInstancesForTemplateUniqueNames_completion___block_invoke_2;
  v8[3] = &unk_264516CA0;
  id v9 = *(id *)(a1 + 40);
  id v10 = v2;
  uint64_t v11 = *(void *)(a1 + 56);
  id v7 = v2;
  [v5 performTransactionWithContext:v3 error:&obj block:v8 inaccessibilityHandler:0];
  objc_storeStrong((id *)(v6 + 40), obj);
}

BOOL __90__ACHAwardsServer_remote_fetchMostRecentEarnedInstancesForTemplateUniqueNames_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = *(id *)(a1 + 32);
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
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = +[ACHEarnedInstanceEntity mostRecentEarnedInstanceForTemplateUniqueName:profile:error:](ACHEarnedInstanceEntity, "mostRecentEarnedInstanceForTemplateUniqueName:profile:error:", v10, *(void *)(a1 + 40), a3, (void)v13);
        if (v11) {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v11 forKeyedSubscript:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return *a3 == 0;
}

- (void)remote_fetchEarnedInstancesForEarnedDateComponentsString:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ACHAwardsServer *)self queue];
  dispatch_assert_queue_not_V2(v8);

  uint64_t v24 = 0;
  char v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__7;
  uint64_t v28 = __Block_byref_object_dispose__7;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__7;
  uint64_t v22 = __Block_byref_object_dispose__7;
  id v23 = 0;
  id v9 = [(ACHAwardsServer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__ACHAwardsServer_remote_fetchEarnedInstancesForEarnedDateComponentsString_completion___block_invoke;
  block[3] = &unk_264516CC8;
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  long long v14 = self;
  id v15 = v11;
  long long v16 = &v18;
  uint64_t v17 = &v24;
  dispatch_sync(v9, block);

  (*((void (**)(id, uint64_t, uint64_t))v11 + 2))(v11, v25[5], v19[5]);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
}

void __87__ACHAwardsServer_remote_fetchEarnedInstancesForEarnedDateComponentsString_completion___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = ACHYearMonthDayDateComponentsFromString();
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) _transactionContextForReadingProtectedDataWithIdentifier:@"Fetch Most Recent Instnace"];
    uint64_t v4 = [*(id *)(a1 + 40) profile];
    id v5 = [v4 database];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __87__ACHAwardsServer_remote_fetchEarnedInstancesForEarnedDateComponentsString_completion___block_invoke_2;
    v13[3] = &unk_264515F30;
    uint64_t v16 = *(void *)(a1 + 64);
    id obj = v7;
    id v8 = v2;
    uint64_t v9 = *(void *)(a1 + 40);
    id v14 = v8;
    uint64_t v15 = v9;
    [v5 performTransactionWithContext:v3 error:&obj block:v13 inaccessibilityHandler:0];
    objc_storeStrong((id *)(v6 + 40), obj);

    id v10 = v14;
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08320];
    v19[0] = @"Unable to parse date components";
    uint64_t v3 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v10 = [v12 errorWithDomain:@"com.apple.ActivityAchievements" code:133 userInfo:v3];
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, MEMORY[0x263EFFA68], v10);
  }
}

BOOL __87__ACHAwardsServer_remote_fetchEarnedInstancesForEarnedDateComponentsString_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) profile];
  uint64_t v7 = +[ACHEarnedInstanceEntity earnedInstancesForDateComponents:v5 profile:v6 error:a3];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return *a3 == 0;
}

- (void)remote_countOfEarnedInstancesForTemplateUniqueName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v8 = [(ACHAwardsServer *)self queue];
  dispatch_assert_queue_not_V2(v8);

  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__7;
  id v19 = __Block_byref_object_dispose__7;
  id v20 = 0;
  uint64_t v9 = [(ACHAwardsServer *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __81__ACHAwardsServer_remote_countOfEarnedInstancesForTemplateUniqueName_completion___block_invoke;
  v11[3] = &unk_264516B20;
  void v11[4] = self;
  id v13 = &v15;
  id v14 = &v21;
  id v10 = v6;
  id v12 = v10;
  dispatch_sync(v9, v11);

  v7[2](v7, v22[3], v16[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __81__ACHAwardsServer_remote_countOfEarnedInstancesForTemplateUniqueName_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _transactionContextForReadingProtectedDataWithIdentifier:@"Fetch Most Recent Instnace"];
  uint64_t v3 = [*(id *)(a1 + 32) profile];
  uint64_t v4 = [v3 database];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__ACHAwardsServer_remote_countOfEarnedInstancesForTemplateUniqueName_completion___block_invoke_2;
  v9[3] = &unk_264515F30;
  uint64_t v12 = *(void *)(a1 + 56);
  id obj = v6;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = v7;
  uint64_t v11 = v8;
  [v4 performTransactionWithContext:v2 error:&obj block:v9 inaccessibilityHandler:0];
  objc_storeStrong((id *)(v5 + 40), obj);
}

BOOL __81__ACHAwardsServer_remote_countOfEarnedInstancesForTemplateUniqueName_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) profile];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = +[ACHEarnedInstanceEntity countOfEarnedInstancesForTemplateUniqueName:v5 profile:v6 error:a3];

  return *a3 == 0;
}

- (void)remote_countOfEarnedInstancesForUniqueNames:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v8 = [(ACHAwardsServer *)self queue];
  dispatch_assert_queue_not_V2(v8);

  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__7;
  char v25 = __Block_byref_object_dispose__7;
  id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__7;
  id v19 = __Block_byref_object_dispose__7;
  id v20 = 0;
  uint64_t v9 = [(ACHAwardsServer *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__ACHAwardsServer_remote_countOfEarnedInstancesForUniqueNames_completion___block_invoke;
  v11[3] = &unk_264516730;
  void v11[4] = self;
  id v13 = &v15;
  id v10 = v6;
  id v12 = v10;
  id v14 = &v21;
  dispatch_sync(v9, v11);

  v7[2](v7, v22[5], v16[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __74__ACHAwardsServer_remote_countOfEarnedInstancesForUniqueNames_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _transactionContextForReadingProtectedDataWithIdentifier:@"Fetch Most Recent Instnace"];
  uint64_t v3 = [*(id *)(a1 + 32) profile];
  uint64_t v4 = [v3 database];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v5 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__ACHAwardsServer_remote_countOfEarnedInstancesForUniqueNames_completion___block_invoke_2;
  v8[3] = &unk_264516CA0;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  uint64_t v11 = *(void *)(a1 + 56);
  [v4 performTransactionWithContext:v2 error:&obj block:v8 inaccessibilityHandler:0];
  objc_storeStrong((id *)(v5 + 40), obj);
}

BOOL __74__ACHAwardsServer_remote_countOfEarnedInstancesForUniqueNames_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
        uint64_t v10 = [*(id *)(a1 + 40) profile];
        unint64_t v11 = +[ACHEarnedInstanceEntity countOfEarnedInstancesForTemplateUniqueName:v9 profile:v10 error:a3];

        id v12 = [NSNumber numberWithUnsignedInteger:v11];
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v12 forKeyedSubscript:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return *a3 == 0;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x270F0A5C0](self, a2);
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D133C68];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (void)setGregorianCalendar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_transactionContextForWritingProtectedDataWithIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "Unable to acquire database assertion: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_transactionContextForReadingProtectedDataWithIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21F5DA000, log, OS_LOG_TYPE_ERROR, "Unable to acquire database assertion with identifier %@: %@", (uint8_t *)&v3, 0x16u);
}

void __68__ACHAwardsServer_remote_addTemplates_removingTemplates_completion___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "Error removing old template versions: %@", (uint8_t *)&v3, 0xCu);
}

@end