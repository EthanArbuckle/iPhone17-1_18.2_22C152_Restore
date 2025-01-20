@interface ATXBestContactHandleForServiceDataSource
- (ATXBestContactHandleForServiceDataSource)initWithDevice:(id)a3;
- (id)_getBestGuessFromRankedHandle:(id)a3 forService:(id)a4;
- (void)allHandlesForContact:(id)a3 callback:(id)a4;
- (void)bestHandleForContact:(id)a3 service:(id)a4 callback:(id)a5;
@end

@implementation ATXBestContactHandleForServiceDataSource

- (ATXBestContactHandleForServiceDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXBestContactHandleForServiceDataSource;
  v6 = [(ATXBestContactHandleForServiceDataSource *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F93B70]);
    v9 = objc_opt_new();
    uint64_t v10 = [v8 initWithGuardedData:v9];
    lock = v7->_lock;
    v7->_lock = (_PASLock *)v10;
  }
  return v7;
}

- (void)allHandlesForContact:(id)a3 callback:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void *, void))a4;
  v7 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = [v5 phoneNumbers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = [*(id *)(*((void *)&v25 + 1) + 8 * v12) value];
        v14 = [v13 unformattedInternationalStringValue];

        if ([v14 length]) {
          [v7 addObject:v14];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v15 = objc_msgSend(v5, "emailAddresses", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v21 + 1) + 8 * v19) value];
        if ([v20 length]) {
          [v7 addObject:v20];
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v17);
  }

  v6[2](v6, v7, 0);
}

- (void)bestHandleForContact:(id)a3 service:(id)a4 callback:(id)a5
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v54 = a4;
  id v8 = (void (**)(id, __CFString *, void))a5;
  if (ATXHeuristicCanLearnFromApp(&unk_1F2727350))
  {
    v50 = (void (**)(id, uint64_t, void))v8;
    v58 = objc_opt_new();
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    obuint64_t j = [v7 phoneNumbers];
    uint64_t v9 = [obj countByEnumeratingWithState:&v76 objects:v86 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v77 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = [*(id *)(*((void *)&v76 + 1) + 8 * i) value];
          id v13 = objc_alloc(MEMORY[0x1E4F5B3A0]);
          v14 = [v12 stringValue];
          v15 = [v7 givenName];
          uint64_t v16 = [v7 identifier];
          uint64_t v17 = (void *)[v13 initWithIdentifier:v14 type:1 displayName:v15 personId:v16 personIdType:3];

          [v58 addObject:v17];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v76 objects:v86 count:16];
      }
      while (v9);
    }

    if (([v54 isEqualToString:*MEMORY[0x1E4F6AA48]] & 1) == 0)
    {
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      uint64_t v18 = [v7 emailAddresses];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v72 objects:v85 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v73;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v73 != v20) {
              objc_enumerationMutation(v18);
            }
            long long v22 = [*(id *)(*((void *)&v72 + 1) + 8 * j) value];
            id v23 = objc_alloc(MEMORY[0x1E4F5B3A0]);
            long long v24 = [v7 givenName];
            long long v25 = [v7 identifier];
            long long v26 = (void *)[v23 initWithIdentifier:v22 type:2 displayName:v24 personId:v25 personIdType:3];

            [v58 addObject:v26];
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v72 objects:v85 count:16];
        }
        while (v19);
      }
    }
    v49 = [MEMORY[0x1E4F5B3E0] sharedInteractionAdvisor];
    v48 = [MEMORY[0x1E4F5B3E8] interactionAdvisorSettingsDefault];
    long long v27 = [v49 rankCandidateContacts:v58 usingSettings:v48];
    long long v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    id obja = objc_claimAutoreleasedReturnValue();
    v29 = (const char *)[obja UTF8String];
    v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v52 = dispatch_queue_create(v29, v30);

    v53 = [MEMORY[0x1E4F6AB38] sharedInstance];
    [v53 addDelegate:self forService:v54 listenerID:obja queue:v52];
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__13;
    v70 = __Block_byref_object_dispose__13;
    id v71 = 0;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v51 = v27;
    uint64_t v31 = [v51 countByEnumeratingWithState:&v62 objects:v84 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v63;
      while (2)
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v63 != v32) {
            objc_enumerationMutation(v51);
          }
          v34 = *(void **)(*((void *)&v62 + 1) + 8 * k);
          dispatch_semaphore_t v35 = dispatch_semaphore_create(0);
          v36 = [v34 identifier];
          BOOL v37 = [v36 rangeOfString:@"@"] == 0x7FFFFFFFFFFFFFFFLL;

          v38 = [v34 identifier];
          if (v37) {
            uint64_t v39 = IDSCopyIDForPhoneNumber();
          }
          else {
            uint64_t v39 = MEMORY[0x1D25F40A0]();
          }
          v40 = (void *)v39;

          if (v40)
          {
            v41 = __atxlog_handle_heuristic();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v81 = v40;
              __int16 v82 = 2112;
              id v83 = v54;
              _os_log_debug_impl(&dword_1D0F43000, v41, OS_LOG_TYPE_DEBUG, "Refreshing ID status for %@ on service %@", buf, 0x16u);
            }

            v60[0] = MEMORY[0x1E4F143A8];
            v60[1] = 3221225472;
            v60[2] = __82__ATXBestContactHandleForServiceDataSource_bestHandleForContact_service_callback___block_invoke;
            v60[3] = &unk_1E68A55A8;
            v60[4] = self;
            v60[5] = v34;
            v42 = v35;
            v61 = v42;
            [v53 refreshIDStatusForDestination:v40 service:v54 listenerID:obja queue:v52 completionBlock:v60];
            [MEMORY[0x1E4F93B18] waitForSemaphore:v42 timeoutSeconds:5.0];
            locuint64_t k = self->_lock;
            v59[0] = MEMORY[0x1E4F143A8];
            v59[1] = 3221225472;
            v59[2] = __82__ATXBestContactHandleForServiceDataSource_bestHandleForContact_service_callback___block_invoke_3;
            v59[3] = &unk_1E68A55D0;
            v59[4] = &v66;
            [(_PASLock *)lock runWithLockAcquired:v59];
            BOOL v44 = v67[5] == 0;

            if (!v44)
            {

              goto LABEL_35;
            }
          }
        }
        uint64_t v31 = [v51 countByEnumeratingWithState:&v62 objects:v84 count:16];
        if (v31) {
          continue;
        }
        break;
      }
    }
LABEL_35:

    [v53 removeDelegate:self forService:*MEMORY[0x1E4F6AA78] listenerID:obja];
    uint64_t v45 = v67[5];
    if (!v45)
    {
      uint64_t v46 = [(ATXBestContactHandleForServiceDataSource *)self _getBestGuessFromRankedHandle:v51 forService:v54];
      v47 = (void *)v67[5];
      v67[5] = v46;

      uint64_t v45 = v67[5];
    }
    v50[2](v50, v45, 0);
    _Block_object_dispose(&v66, 8);

    id v8 = (void (**)(id, __CFString *, void))v50;
  }
  else
  {
    v8[2](v8, &stru_1F2719D20, 0);
  }
}

intptr_t __82__ATXBestContactHandleForServiceDataSource_bestHandleForContact_service_callback___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 16);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __82__ATXBestContactHandleForServiceDataSource_bestHandleForContact_service_callback___block_invoke_2;
    v5[3] = &unk_1E68A5580;
    v5[4] = *(void *)(a1 + 40);
    [v3 runWithLockAcquired:v5];
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __82__ATXBestContactHandleForServiceDataSource_bestHandleForContact_service_callback___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  uint64_t v4 = [v2 identifier];
  id v5 = (id)v3[1];
  v3[1] = v4;
}

void __82__ATXBestContactHandleForServiceDataSource_bestHandleForContact_service_callback___block_invoke_3(uint64_t a1, uint64_t a2)
{
}

- (id)_getBestGuessFromRankedHandle:(id)a3 forService:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    uint64_t v11 = *MEMORY[0x1E4F6AA48];
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v6, "isEqualToString:", v11, (void)v16) && objc_msgSend(v13, "type") == 1)
        {
          v14 = [v13 identifier];
          goto LABEL_12;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end