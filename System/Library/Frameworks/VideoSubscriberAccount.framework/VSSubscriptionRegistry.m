@interface VSSubscriptionRegistry
- (BOOL)_saveChangesToContext:(id)a3;
- (VSRemoteNotifier)remoteNotifier;
- (VSSubscriptionPersistentContainer)persistentContainer;
- (VSSubscriptionPredicateFactory)predicateFactory;
- (VSSubscriptionRegistry)init;
- (id)_fetchRequest;
- (id)_predicateForCurrentConnectionWithRequestKind:(int64_t)a3;
- (id)_predicateForPersistentAttributesOfSubscriptions:(id)a3 withEntity:(id)a4 forFiltering:(BOOL)a5;
- (id)_securityTaskForCurrentConnection;
- (id)_subscriptionEntity;
- (int64_t)_saveChangesToContext:(id)a3 withDate:(id)a4;
- (void)_installedAppsDidChange:(id)a3;
- (void)_performBlock:(id)a3;
- (void)_sendRemoteNotification;
- (void)dealloc;
- (void)fetchActiveSubscriptionsWithOptions:(id)a3 completionHandler:(id)a4;
- (void)registerSubscription:(id)a3;
- (void)registerSubscription:(id)a3 withCompletionHandler:(id)a4;
- (void)removeSubscriptions:(id)a3;
- (void)removeSubscriptions:(id)a3 withCompletionHandler:(id)a4;
- (void)setPersistentContainer:(id)a3;
- (void)setPredicateFactory:(id)a3;
- (void)setRemoteNotifier:(id)a3;
@end

@implementation VSSubscriptionRegistry

- (VSSubscriptionRegistry)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSSubscriptionRegistry;
  v2 = [(VSSubscriptionRegistry *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__installedAppsDidChange_ name:@"VSInstalledApplicationsDidChange" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"VSInstalledApplicationsDidChange" object:0];

  v4.receiver = self;
  v4.super_class = (Class)VSSubscriptionRegistry;
  [(VSSubscriptionRegistry *)&v4 dealloc];
}

- (VSSubscriptionPersistentContainer)persistentContainer
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_persistentContainer;
  if (!v3)
  {
    v3 = objc_alloc_init(VSSubscriptionPersistentContainer);
    objc_storeStrong((id *)&v2->_persistentContainer, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The result parameter must not be nil."];
  }

  return v3;
}

- (VSSubscriptionPredicateFactory)predicateFactory
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_predicateFactory;
  if (!v3)
  {
    v3 = objc_alloc_init(VSSubscriptionPredicateFactory);
    objc_storeStrong((id *)&v2->_predicateFactory, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The result parameter must not be nil."];
  }

  return v3;
}

- (VSRemoteNotifier)remoteNotifier
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_remoteNotifier;
  if (!v3)
  {
    v3 = [[VSRemoteNotifier alloc] initWithNotificationName:@"VSActiveSubscriptionsDidChangeNotification"];
    objc_storeStrong((id *)&v2->_remoteNotifier, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The result parameter must not be nil."];
  }

  return v3;
}

- (void)_sendRemoteNotification
{
  id v2 = [(VSSubscriptionRegistry *)self remoteNotifier];
  [v2 postNotification];
}

- (void)_installedAppsDidChange:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1E0173AA0]();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__VSSubscriptionRegistry__installedAppsDidChange___block_invoke;
  v6[3] = &unk_1E6BD28D8;
  v6[4] = self;
  [(VSSubscriptionRegistry *)self _performBlock:v6];
}

uint64_t __50__VSSubscriptionRegistry__installedAppsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendRemoteNotification];
}

- (void)_performBlock:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1E0173AA0]();
  v6 = [(VSSubscriptionRegistry *)self persistentContainer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__VSSubscriptionRegistry__performBlock___block_invoke;
  v8[3] = &unk_1E6BD30B0;
  id v7 = v4;
  id v9 = v7;
  [v6 performBlockAndWait:v8];
}

void __40__VSSubscriptionRegistry__performBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__VSSubscriptionRegistry__performBlock___block_invoke_2;
  v9[3] = &unk_1E6BD3BD0;
  id v10 = *(id *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__VSSubscriptionRegistry__performBlock___block_invoke_4;
  v6[3] = &unk_1E6BD3BF8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  [v5 unwrapObject:v9 error:v6];
}

void __40__VSSubscriptionRegistry__performBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__VSSubscriptionRegistry__performBlock___block_invoke_3;
  v7[3] = &unk_1E6BD2CD8;
  id v8 = v4;
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  [v6 performBlock:v7];
}

void __40__VSSubscriptionRegistry__performBlock___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setParentContext:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = +[VSFailable failableWithObject:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __40__VSSubscriptionRegistry__performBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)_saveChangesToContext:(id)a3
{
  id v4 = a3;
  v17 = (void *)MEMORY[0x1E0173AA0]();
  id v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "vs_currentDate");
  id v6 = v4;
  uint64_t v19 = 0;
  char v7 = 0;
  uint64_t v20 = *MEMORY[0x1E4F1C3C8];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v16 = v6;
  do
  {
    context = (void *)MEMORY[0x1E0173AA0]();
    uint64_t v9 = 0;
    do
    {
      id v10 = (void *)MEMORY[0x1E0173AA0]();
      if (!v6) {
        [MEMORY[0x1E4F1CA00] raise:v20 format:@"The currentContextOrNil parameter must not be nil."];
      }
      id v11 = v6;
      int64_t v12 = [(VSSubscriptionRegistry *)self _saveChangesToContext:v11 withDate:v5];
      int64_t v13 = v12;
      if (v12 == 2)
      {

        id v6 = 0;
        char v7 = 0;
      }
      else
      {
        if (v12 == 1)
        {
          v14 = VSDefaultLogObject();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DA674000, v14, OS_LOG_TYPE_DEFAULT, "Resolved constraint violation.  Will attempt to save again.", buf, 2u);
          }
          ++v9;

LABEL_13:
          id v6 = v11;
          goto LABEL_17;
        }
        if (v12) {
          goto LABEL_13;
        }
        id v6 = [v11 parentContext];

        if (v6) {
          ++v19;
        }
        else {
          [(VSSubscriptionRegistry *)self _sendRemoteNotification];
        }
        char v7 = 1;
      }
LABEL_17:
      if (v9 >= 11) {
        [MEMORY[0x1E4F1CA00] raise:v8 format:@"Too many constraints resolved."];
      }
    }
    while (v13 == 1);
    if (v19 >= 2) {
      [MEMORY[0x1E4F1CA00] raise:v8 format:@"Too many ancestor contexts."];
    }
  }
  while (v6);

  return v7 & 1;
}

- (int64_t)_saveChangesToContext:(id)a3 withDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = (void *)MEMORY[0x1E0173AA0]();
  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The context parameter must not be nil."];
  }
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__VSSubscriptionRegistry__saveChangesToContext_withDate___block_invoke;
  v12[3] = &unk_1E6BD3C40;
  id v8 = v5;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  v15 = &v16;
  [v8 performBlockAndWait:v12];
  int64_t v10 = v17[3];

  _Block_object_dispose(&v16, 8);

  return v10;
}

void __57__VSSubscriptionRegistry__saveChangesToContext_withDate___block_invoke(uint64_t a1)
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v3 = [*(id *)(a1 + 32) insertedObjects];
  [v2 unionSet:v3];

  uint64_t v74 = a1;
  id v4 = [*(id *)(a1 + 32) updatedObjects];
  [v2 unionSet:v4];

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v89 objects:v100 count:16];
  id v72 = v5;
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v90;
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v90 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        int64_t v12 = (void *)MEMORY[0x1E0173AA0]();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v13 = (void *)MEMORY[0x1E4F1CA00];
            id v14 = (objc_class *)objc_opt_class();
            v15 = NSStringFromClass(v14);
            uint64_t v16 = v13;
            id v5 = v72;
            [v16 raise:v9, @"Unexpectedly, object was %@, instead of VSPersistentSubscription.", v15 format];
          }
          [v11 setMostRecentSaveDate:*(void *)(a1 + 40)];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v89 objects:v100 count:16];
    }
    while (v7);
  }

  uint64_t v17 = a1;
  uint64_t v18 = *(void **)(a1 + 32);
  id v88 = 0;
  int v19 = [v18 save:&v88];
  id v20 = v88;
  v21 = VSDefaultLogObject();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v97 = v19;
    __int16 v98 = 2112;
    id v99 = v20;
    _os_log_impl(&dword_1DA674000, v21, OS_LOG_TYPE_DEFAULT, "_saveChangesToContext didSave %d,localError %@", buf, 0x12u);
  }

  if (v19)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_62;
  }
  v22 = [v20 domain];
  if ([v22 isEqual:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v23 = [v20 code];

    if (v23 == 133021)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 2;
      v24 = [v20 userInfo];
      v25 = [v24 objectForKey:*MEMORY[0x1E4F1BF00]];

      v26 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_31];
      v62 = v25;
      v27 = [v25 filteredArrayUsingPredicate:v26];

      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      obuint64_t j = v27;
      uint64_t v66 = [obj countByEnumeratingWithState:&v84 objects:v95 count:16];
      if (!v66) {
        goto LABEL_57;
      }
      uint64_t v65 = *(void *)v85;
      uint64_t v73 = *MEMORY[0x1E4F1C3C8];
      id v64 = v20;
      while (1)
      {
        for (uint64_t j = 0; j != v66; ++j)
        {
          if (*(void *)v85 != v65) {
            objc_enumerationMutation(obj);
          }
          v29 = *(void **)(*((void *)&v84 + 1) + 8 * j);
          v30 = (void *)MEMORY[0x1E0173AA0]();
          v31 = [v29 conflictingObjects];
          v32 = (void *)[v31 mutableCopy];

          uint64_t v33 = [v29 databaseObject];
          if (v33) {
            [v32 addObject:v33];
          }
          v71 = (void *)v33;
          v34 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_44];
          [v32 filterUsingPredicate:v34];

          id v35 = v32;
          uint64_t v36 = [v35 count];
          uint64_t v37 = v36;
          if (!v36)
          {
            *(void *)(*(void *)(*(void *)(v17 + 48) + 8) + 24) = 2;
            goto LABEL_54;
          }
          uint64_t v68 = v36;
          v69 = v30;
          uint64_t v70 = j;
          long long v82 = 0u;
          long long v83 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          id v67 = v35;
          id v38 = v35;
          uint64_t v39 = [v38 countByEnumeratingWithState:&v80 objects:v94 count:16];
          if (v39)
          {
            uint64_t v40 = v39;
            v41 = 0;
            id v42 = 0;
            uint64_t v43 = *(void *)v81;
            id v75 = v38;
            do
            {
              uint64_t v44 = 0;
              v45 = v42;
              do
              {
                if (*(void *)v81 != v43) {
                  objc_enumerationMutation(v75);
                }
                v46 = *(void **)(*((void *)&v80 + 1) + 8 * v44);
                if (!v45) {
                  goto LABEL_33;
                }
                v47 = [*(id *)(*((void *)&v80 + 1) + 8 * v44) creationDate];
                id v42 = v45;
                v48 = [v42 creationDate];
                int v49 = objc_msgSend(v47, "vs_isBefore:", v48);

                if (v49)
                {
LABEL_33:
                  id v42 = v46;
                }
                if (!v41) {
                  goto LABEL_38;
                }
                v50 = [v46 mostRecentSaveDate];
                v51 = [v41 mostRecentSaveDate];

                if (!v51) {
                  [MEMORY[0x1E4F1CA00] raise:v73 format:@"The [mostRecentlyUpdatedSubscription mostRecentSaveDate] parameter must not be nil."];
                }
                v52 = [v41 mostRecentSaveDate];
                int v53 = objc_msgSend(v50, "vs_isAfter:", v52);

                if (v53)
                {
LABEL_38:
                  id v54 = v46;

                  v41 = v54;
                }
                ++v44;
                v45 = v42;
              }
              while (v40 != v44);
              id v38 = v75;
              uint64_t v40 = [v75 countByEnumeratingWithState:&v80 objects:v94 count:16];
            }
            while (v40);

            uint64_t v17 = v74;
            if (v41) {
              goto LABEL_46;
            }
          }
          else
          {

            id v42 = 0;
          }
          [MEMORY[0x1E4F1CA00] raise:v73 format:@"The mostRecentlyUpdatedSubscription parameter must not be nil."];
          v41 = 0;
LABEL_46:
          [v38 removeObject:v41];
          v55 = [v42 creationDate];
          [v41 setCreationDate:v55];

          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          id v56 = v38;
          uint64_t v57 = [v56 countByEnumeratingWithState:&v76 objects:v93 count:16];
          if (v57)
          {
            uint64_t v58 = v57;
            uint64_t v59 = *(void *)v77;
            do
            {
              for (uint64_t k = 0; k != v58; ++k)
              {
                if (*(void *)v77 != v59) {
                  objc_enumerationMutation(v56);
                }
                [*(id *)(v17 + 32) deleteObject:*(void *)(*((void *)&v76 + 1) + 8 * k)];
              }
              uint64_t v58 = [v56 countByEnumeratingWithState:&v76 objects:v93 count:16];
            }
            while (v58);
          }

          *(void *)(*(void *)(*(void *)(v17 + 48) + 8) + 24) = 1;
          id v5 = v72;
          id v20 = v64;
          v30 = v69;
          uint64_t j = v70;
          id v35 = v67;
          uint64_t v37 = v68;
LABEL_54:

          if (!v37) {
            goto LABEL_57;
          }
        }
        uint64_t v66 = [obj countByEnumeratingWithState:&v84 objects:v95 count:16];
        if (!v66)
        {
LABEL_57:

          goto LABEL_62;
        }
      }
    }
  }
  else
  {
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 2;
  v61 = VSErrorLogObject();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
    __57__VSSubscriptionRegistry__saveChangesToContext_withDate___block_invoke_cold_1();
  }

LABEL_62:
}

uint64_t __57__VSSubscriptionRegistry__saveChangesToContext_withDate___block_invoke_37(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __57__VSSubscriptionRegistry__saveChangesToContext_withDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_subscriptionEntity
{
  return (id)+[VSPersistentSubscription entity];
}

- (id)_fetchRequest
{
  id v2 = +[VSPersistentSubscription fetchRequest];
  [v2 setIncludesPendingChanges:0];

  return v2;
}

- (id)_securityTaskForCurrentConnection
{
  return +[VSSecurityTask securityTaskForCurrentConnection];
}

- (id)_predicateForCurrentConnectionWithRequestKind:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  uint64_t v6 = [(VSSubscriptionRegistry *)self _securityTaskForCurrentConnection];
  if (v6)
  {
    uint64_t v7 = [(VSSubscriptionRegistry *)self predicateFactory];
    uint64_t v8 = [v7 allowedSubscriptionsPredicateForRequestKind:a3 fromTask:v6];

    id v5 = (void *)v8;
  }

  return v5;
}

- (void)fetchActiveSubscriptionsWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The options parameter must not be nil."];
    if (v8) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The completionHandler parameter must not be nil."];
LABEL_3:
  uint64_t v9 = VSDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[VSSubscriptionRegistry fetchActiveSubscriptionsWithOptions:completionHandler:]";
    _os_log_impl(&dword_1DA674000, v9, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  int64_t v10 = [(VSSubscriptionRegistry *)self _securityTaskForCurrentConnection];
  id v11 = [v6 objectForKey:@"VSSubscriptionFetchOptionSubscriberIdentifierHashModifier"];
  if (v11 && ([v10 shouldAllowAccessToSubscriberIdentifierHashModifier:v11] & 1) == 0)
  {

    id v11 = 0;
  }
  int64_t v12 = [(VSSubscriptionRegistry *)self predicateFactory];
  id v13 = [v12 subscriptionFetchPredicateForTask:v10 withOptions:v6];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke;
  v18[3] = &unk_1E6BD3CB8;
  v18[4] = self;
  id v19 = v12;
  id v20 = v13;
  id v21 = v11;
  id v22 = v8;
  id v14 = v8;
  id v15 = v11;
  id v16 = v13;
  id v17 = v12;
  [(VSSubscriptionRegistry *)self _performBlock:v18];
}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6BD3C90;
  id v4 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_84;
  v5[3] = &unk_1E6BD2DA0;
  id v6 = *(id *)(a1 + 64);
  [a2 unwrapObject:v7 error:v5];
}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v32 = a2;
  id v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "Successfully obtained context.", (uint8_t *)&buf, 2u);
  }

  id v38 = [*(id *)(a1 + 32) _subscriptionEntity];
  uint64_t v33 = [*(id *)(a1 + 40) predicateByConvertingSubscriptionKeyPathsInPredicate:*(void *)(a1 + 48) toAttributeKeysInEntity:v38];
  id v35 = [*(id *)(a1 + 32) _fetchRequest];
  [v35 setPredicate:v33];
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Will execute fetch request", (uint8_t *)&buf, 2u);
  }

  id v57 = 0;
  v34 = [v32 executeFetchRequest:v35 error:&v57];
  id v31 = v57;
  if (v34)
  {
    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    obuint64_t j = v34;
    uint64_t v42 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
    if (v42)
    {
      uint64_t v40 = 0;
      uint64_t v41 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v54 != v41) {
            objc_enumerationMutation(obj);
          }
          id v5 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          context = (void *)MEMORY[0x1E0173AA0]();
          id v6 = VSDefaultLogObject();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            id v7 = [v5 committedValuesForKeys:0];
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v7;
            _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Result: %@", (uint8_t *)&buf, 0xCu);
          }
          id v8 = VSDefaultLogObject();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            id v9 = [v5 objectID];
            unsigned int v10 = [v9 isTemporaryID];
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v10;
            _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "Subscription isTemporary=%lu", (uint8_t *)&buf, 0xCu);
          }
          id v11 = [v5 sourceKind];
          BOOL v12 = v11 == 0;

          if (v12)
          {
            uint64_t v25 = VSErrorLogObject();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_cold_3(&v51, v52, v25);
            }

            ++v40;
          }
          else
          {
            *(void *)&long long buf = 0;
            *((void *)&buf + 1) = &buf;
            uint64_t v59 = 0x3032000000;
            v60 = __Block_byref_object_copy__9;
            v61 = __Block_byref_object_dispose__9;
            v62 = objc_alloc_init(VSSubscription);
            [v37 addObject:*(void *)(*((void *)&buf + 1) + 40)];
            id v13 = [v38 attributesByName];
            v50[0] = MEMORY[0x1E4F143A8];
            v50[1] = 3221225472;
            v50[2] = __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_66;
            v50[3] = &unk_1E6BD3C68;
            v50[4] = v5;
            v50[5] = &buf;
            [v13 enumerateKeysAndObjectsUsingBlock:v50];

            id v14 = [*(id *)(*((void *)&buf + 1) + 40) subscriberIdentifierHash];
            if ([v14 length] && objc_msgSend(*(id *)(a1 + 56), "length"))
            {
              id v15 = objc_alloc_init(VSHash);
              [(VSHash *)v15 updateWithString:v14];
              [(VSHash *)v15 updateWithString:*(void *)(a1 + 56)];
              id v16 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"3AE626BD-CE1D-4C64-94CB-ED0095DE91EC"];
              id v17 = +[VSOptional optionalWithObject:v16];

              uint64_t v18 = [v17 forceUnwrapObject];
              [(VSHash *)v15 updateWithUUID:v18];

              id v19 = [(VSHash *)v15 finalData];
              id v20 = [MEMORY[0x1E4F29248] valueTransformerForName:@"VSBase64DataValueTransformer"];
              id v21 = [v20 transformedValue:v19];
              id v22 = +[VSOptional optionalWithObject:v21];
              uint64_t v23 = *(void **)(*((void *)&buf + 1) + 40);
              v24 = [v22 forceUnwrapObject];
              [v23 setSubscriberIdentifierHash:v24];
            }
            _Block_object_dispose(&buf, 8);
          }
        }
        uint64_t v42 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
      }
      while (v42);

      if (!v40) {
        goto LABEL_30;
      }
      objc_msgSend(NSString, "stringWithFormat:", @"Skipped %lu empty objects.", v40);
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      v26 = VSErrorLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_cold_2();
      }
    }
LABEL_30:
    v27 = VSDefaultLogObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v37;
      _os_log_impl(&dword_1DA674000, v27, OS_LOG_TYPE_DEFAULT, "Will return matching subscriptions: %@", (uint8_t *)&buf, 0xCu);
    }

    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_82;
    v47[3] = &unk_1E6BD2C88;
    id v28 = *(id *)(a1 + 64);
    id v48 = v37;
    id v49 = v28;
    id v29 = v37;
    VSPerformCompletionHandler(v47);

    goto LABEL_36;
  }
  v30 = VSErrorLogObject();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_cold_1();
  }

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_83;
  v44[3] = &unk_1E6BD2C88;
  id v46 = *(id *)(a1 + 64);
  id v45 = v31;
  VSPerformCompletionHandler(v44);

  id v29 = v46;
LABEL_36:
}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E0173AA0]();
  if (objc_msgSend(v6, "vs_isSuitableForPurpose:", 4))
  {
    id v8 = objc_msgSend(v6, "vs_subscriptionKeyPath");
    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) valueForKey:v5];
      unsigned int v10 = VSDefaultLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412546;
        BOOL v12 = v9;
        __int16 v13 = 2112;
        id v14 = v8;
        _os_log_impl(&dword_1DA674000, v10, OS_LOG_TYPE_DEFAULT, "Will set value %@ for key path %@", (uint8_t *)&v11, 0x16u);
      }

      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setValue:v9 forKeyPath:v8];
    }
  }
}

uint64_t __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_82(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_83(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "vs_secureCodingSafeError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_84(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_84_cold_1();
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_85;
  v7[3] = &unk_1E6BD2C88;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  VSPerformCompletionHandler(v7);
}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_85(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "vs_secureCodingSafeError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)registerSubscription:(id)a3
{
}

- (void)registerSubscription:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E0173AA0]();
  id v8 = a3;
  id v9 = VSDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v21 = "-[VSSubscriptionRegistry registerSubscription:withCompletionHandler:]";
    _os_log_impl(&dword_1DA674000, v9, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  unsigned int v10 = (char *)[v8 copy];
  int v11 = VSDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v21 = v10;
    _os_log_impl(&dword_1DA674000, v11, OS_LOG_TYPE_DEFAULT, "Provided subscription: %@", buf, 0xCu);
  }

  BOOL v12 = [(VSSubscriptionRegistry *)self _predicateForCurrentConnectionWithRequestKind:1];
  if ([v12 evaluateWithObject:v10])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke;
    v17[3] = &unk_1E6BD3CE0;
    v17[4] = self;
    uint64_t v18 = v10;
    id v19 = v6;
    [(VSSubscriptionRegistry *)self _performBlock:v17];

    __int16 v13 = v18;
LABEL_11:

    goto LABEL_12;
  }
  id v14 = VSErrorLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[VSSubscriptionRegistry registerSubscription:withCompletionHandler:]();
  }

  if (v6)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_90;
    v15[3] = &unk_1E6BD2DC8;
    id v16 = (char *)v6;
    VSPerformCompletionHandler(v15);
    __int16 v13 = v16;
    goto LABEL_11;
  }
LABEL_12:
}

void __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E0173AA0]();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E6BD3B30;
  id v5 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = *(id *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_2_88;
  v6[3] = &unk_1E6BD2DA0;
  id v7 = *(id *)(a1 + 48);
  [v3 unwrapObject:v8 error:v6];
}

void __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E0173AA0]();
  id v5 = [*(id *)(a1 + 32) _subscriptionEntity];
  id v6 = [[VSPersistentSubscription alloc] initWithEntity:v5 insertIntoManagedObjectContext:v3];
  id v7 = [v5 attributesByName];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_3;
  v20[3] = &unk_1E6BD2D28;
  id v21 = *(id *)(a1 + 40);
  id v8 = v6;
  uint64_t v22 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v20];

  id v9 = VSDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DA674000, v9, OS_LOG_TYPE_DEFAULT, "Will attempt to persist registration", buf, 2u);
  }

  if ([*(id *)(a1 + 32) _saveChangesToContext:v3])
  {
    id v10 = VSDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1DA674000, v10, OS_LOG_TYPE_DEFAULT, "Will send registration notification", buf, 2u);
    }

    uint32_t v11 = notify_post("com.apple.VideoSubscriberAccount.DidRegisterSubscription");
    if (v11)
    {
      int v12 = v11;
      __int16 v13 = VSErrorLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_2_cold_1(v12, v13);
      }
    }
    else
    {
      __int16 v13 = VSDefaultLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1DA674000, v13, OS_LOG_TYPE_DEFAULT, "Did send registration notification", buf, 2u);
      }
    }

    uint64_t v15 = *(void **)(a1 + 48);
    if (v15)
    {
      id v16 = (id *)v18;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_86;
      v18[3] = &unk_1E6BD2DC8;
      goto LABEL_17;
    }
  }
  else
  {
    id v14 = VSErrorLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_2_cold_2();
    }

    uint64_t v15 = *(void **)(a1 + 48);
    if (v15)
    {
      id v16 = (id *)v17;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_87;
      v17[3] = &unk_1E6BD2DC8;
LABEL_17:
      v16[4] = v15;
      VSPerformCompletionHandler(v16);
    }
  }
}

void __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (objc_msgSend(v6, "vs_isSuitableForPurpose:", 2))
  {
    id v7 = (void *)MEMORY[0x1E0173AA0]();
    id v8 = objc_msgSend(v6, "vs_subscriptionKeyPath");
    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) valueForKeyPath:v8];
      id v10 = VSDefaultLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412802;
        int v12 = v9;
        __int16 v13 = 2112;
        id v14 = v8;
        __int16 v15 = 2112;
        id v16 = v5;
        _os_log_impl(&dword_1DA674000, v10, OS_LOG_TYPE_DEFAULT, "Using subscription value %@ for key %@ as value for persistent name %@.", (uint8_t *)&v11, 0x20u);
      }

      [*(id *)(a1 + 40) setValue:v9 forKey:v5];
    }
  }
}

uint64_t __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_86(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_87(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_2_88(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_84_cold_1();
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_89;
    v6[3] = &unk_1E6BD2DC8;
    id v7 = v5;
    VSPerformCompletionHandler(v6);
  }
}

uint64_t __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_89(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_predicateForPersistentAttributesOfSubscriptions:(id)a3 withEntity:(id)a4 forFiltering:(BOOL)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v22 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v14 = (void *)MEMORY[0x1E0173AA0]();
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v16 = [v22 attributesByName];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __99__VSSubscriptionRegistry__predicateForPersistentAttributesOfSubscriptions_withEntity_forFiltering___block_invoke;
        v23[3] = &unk_1E6BD3D08;
        BOOL v25 = a5;
        v23[4] = v13;
        id v24 = v15;
        id v17 = v15;
        [v16 enumerateKeysAndObjectsUsingBlock:v23];

        uint64_t v18 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v17];
        [v8 addObject:v18];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }

  id v19 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v8];

  return v19;
}

void __99__VSSubscriptionRegistry__predicateForPersistentAttributesOfSubscriptions_withEntity_forFiltering___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  int v6 = objc_msgSend(v5, "vs_isSuitableForPurpose:", 1);
  if (*(unsigned char *)(a1 + 48))
  {
    if (!v6) {
      goto LABEL_9;
    }
  }
  else if (!v6 || [v5 attributeType] == 1800)
  {
    goto LABEL_9;
  }
  id v7 = objc_msgSend(v5, "vs_subscriptionKeyPath");
  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) valueForKeyPath:v7];
    uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", v10, v8];
    [*(id *)(a1 + 40) addObject:v9];
  }
LABEL_9:
}

- (void)removeSubscriptions:(id)a3
{
}

- (void)removeSubscriptions:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v19 = "-[VSSubscriptionRegistry removeSubscriptions:withCompletionHandler:]";
    _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  uint64_t v9 = [(VSSubscriptionRegistry *)self _predicateForCurrentConnectionWithRequestKind:1];
  id v10 = [v7 filteredArrayUsingPredicate:v9];

  if ([v10 count])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke;
    v15[3] = &unk_1E6BD3CE0;
    void v15[4] = self;
    id v16 = v10;
    id v17 = v6;
    [(VSSubscriptionRegistry *)self _performBlock:v15];

    uint64_t v11 = v16;
LABEL_9:

    goto LABEL_10;
  }
  int v12 = VSErrorLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[VSSubscriptionRegistry removeSubscriptions:withCompletionHandler:]();
  }

  if (v6)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_102;
    v13[3] = &unk_1E6BD2DC8;
    id v14 = v6;
    VSPerformCompletionHandler(v13);
    uint64_t v11 = v14;
    goto LABEL_9;
  }
LABEL_10:
}

void __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E6BD3B30;
  id v4 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  id v9 = *(id *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2_100;
  v5[3] = &unk_1E6BD2DA0;
  id v6 = *(id *)(a1 + 48);
  [a2 unwrapObject:v7 error:v5];
}

void __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v34 = a2;
  id v3 = [*(id *)(a1 + 32) _fetchRequest];
  id v4 = [v3 entity];
  id v5 = [*(id *)(a1 + 32) _predicateForPersistentAttributesOfSubscriptions:*(void *)(a1 + 40) withEntity:v4 forFiltering:0];
  [v3 setPredicate:v5];
  id v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Will execute fetch request", buf, 2u);
  }

  id v46 = 0;
  id v7 = [v34 executeFetchRequest:v3 error:&v46];
  id v8 = v46;
  if (v7)
  {
    if ([v7 count])
    {
      id v33 = v8;
      id v9 = [*(id *)(a1 + 32) _predicateForPersistentAttributesOfSubscriptions:*(void *)(a1 + 40) withEntity:v4 forFiltering:1];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v10 = v7;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v49 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v28 = a1;
        long long v29 = v7;
        v30 = v5;
        uint64_t v31 = v4;
        id v32 = v3;
        char v13 = 0;
        uint64_t v14 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v43 != v14) {
              objc_enumerationMutation(v10);
            }
            uint64_t v16 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            if (objc_msgSend(v9, "evaluateWithObject:", v16, v28, v29, v30, v31, v32))
            {
              [v34 deleteObject:v16];
              char v13 = 1;
            }
            else
            {
              id v17 = VSDefaultLogObject();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412290;
                uint64_t v48 = v16;
                _os_log_impl(&dword_1DA674000, v17, OS_LOG_TYPE_DEFAULT, "Fetched object %@ does not match in-memory filter.", buf, 0xCu);
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v49 count:16];
        }
        while (v12);

        id v4 = v31;
        id v3 = v32;
        id v7 = v29;
        id v5 = v30;
        a1 = v28;
        if (v13)
        {
          uint64_t v18 = VSDefaultLogObject();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1DA674000, v18, OS_LOG_TYPE_DEFAULT, "Will attempt to persist removal of subscriptions.", buf, 2u);
          }

          if ([*(id *)(v28 + 32) _saveChangesToContext:v34])
          {
            id v19 = VSDefaultLogObject();
            id v8 = v33;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_1DA674000, v19, OS_LOG_TYPE_DEFAULT, "Did remove subscriptions.", buf, 2u);
            }

            uint64_t v20 = *(void **)(v28 + 48);
            if (!v20) {
              goto LABEL_39;
            }
            id v21 = (id *)v41;
            v41[0] = MEMORY[0x1E4F143A8];
            v41[1] = 3221225472;
            v41[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_95;
            v41[3] = &unk_1E6BD2DC8;
          }
          else
          {
            long long v27 = VSErrorLogObject();
            id v8 = v33;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2_cold_3();
            }

            uint64_t v20 = *(void **)(v28 + 48);
            if (!v20) {
              goto LABEL_39;
            }
            id v21 = (id *)v40;
            v40[0] = MEMORY[0x1E4F143A8];
            v40[1] = 3221225472;
            v40[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_96;
            v40[3] = &unk_1E6BD2DC8;
          }
          goto LABEL_38;
        }
      }
      else
      {
      }
      long long v26 = VSErrorLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2_cold_2();
      }

      uint64_t v20 = *(void **)(a1 + 48);
      id v8 = v33;
      if (!v20) {
        goto LABEL_39;
      }
      id v21 = (id *)v39;
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_97;
      v39[3] = &unk_1E6BD2DC8;
LABEL_38:
      v21[4] = v20;
      VSPerformCompletionHandler(v21);

      goto LABEL_39;
    }
    id v24 = VSDefaultLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1DA674000, v24, OS_LOG_TYPE_DEFAULT, "No matching subscriptions to remove.", buf, 2u);
    }

    BOOL v25 = *(void **)(a1 + 48);
    if (v25)
    {
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_98;
      v37[3] = &unk_1E6BD2DC8;
      id v38 = v25;
      VSPerformCompletionHandler(v37);
      id v9 = v38;
      goto LABEL_39;
    }
  }
  else
  {
    id v22 = VSErrorLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2_cold_1();
    }

    uint64_t v23 = *(void **)(a1 + 48);
    if (v23)
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_99;
      v35[3] = &unk_1E6BD2DC8;
      id v36 = v23;
      VSPerformCompletionHandler(v35);
      id v9 = v36;
LABEL_39:
    }
  }
}

uint64_t __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_95(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_96(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_97(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_99(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2_100(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_84_cold_1();
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_101;
    v6[3] = &unk_1E6BD2DC8;
    id v7 = v5;
    VSPerformCompletionHandler(v6);
  }
}

uint64_t __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_101(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_102(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setRemoteNotifier:(id)a3
{
}

- (void)setPersistentContainer:(id)a3
{
}

- (void)setPredicateFactory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicateFactory, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);

  objc_storeStrong((id *)&self->_remoteNotifier, 0);
}

void __57__VSSubscriptionRegistry__saveChangesToContext_withDate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error saving changes: %@", v2, v3, v4, v5, v6);
}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error fetching subscriptions: %@", v2, v3, v4, v5, v6);
}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1DA674000, v0, OS_LOG_TYPE_FAULT, "%@", v1, 0xCu);
}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_cold_3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "Skipping empty object.", buf, 2u);
}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_84_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error obtaining context: %@", v2, v3, v4, v5, v6);
}

- (void)registerSubscription:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Caller lacks ability to modify subscription.", v2, v3, v4, v5, v6);
}

void __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_2_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Error sending registration notification: %d", (uint8_t *)v2, 8u);
}

void __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Unable to register subscription", v2, v3, v4, v5, v6);
}

- (void)removeSubscriptions:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "No filtered subscriptions to remove.", v2, v3, v4, v5, v6);
}

void __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Unable to execute fetch request: %@", v2, v3, v4, v5, v6);
}

void __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Nothing to delete.", v2, v3, v4, v5, v6);
}

void __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Unable to remove subscriptions", v2, v3, v4, v5, v6);
}

@end