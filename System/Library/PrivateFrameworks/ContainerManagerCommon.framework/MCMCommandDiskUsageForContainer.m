@interface MCMCommandDiskUsageForContainer
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandDiskUsageForContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMConcreteContainerIdentity)concreteContainerIdentity;
- (void)execute;
@end

@implementation MCMCommandDiskUsageForContainer

- (void).cxx_destruct
{
  p_concreteContainerIdentity = &self->_concreteContainerIdentity;

  objc_storeStrong((id *)p_concreteContainerIdentity, 0);
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (void)execute
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  uint64_t v47 = 1;
  char v4 = _os_feature_enabled_impl();
  v5 = [(MCMCommandDiskUsageForContainer *)self concreteContainerIdentity];
  v6 = [(MCMCommand *)self context];
  v7 = [v6 containerCache];
  id v46 = 0;
  v8 = [v7 entryForContainerIdentity:v5 error:&v46];
  id v9 = v46;

  v10 = [v8 metadataMinimal];
  if (v10)
  {
    id v38 = v9;
    unint64_t v11 = [v5 containerClass];
    v12 = 0;
    if (v11 <= 0xE && ((1 << v11) & 0x412A) != 0)
    {
      v13 = [MCMCommandInfoValueForKey alloc];
      v14 = [(MCMCommand *)self context];
      v15 = [(MCMCommandInfoValueForKey *)v13 initWithKey:@"StaticDiskUsage" concreteContainerIdentity:v5 context:v14 resultPromise:0];

      v12 = [(MCMCommandInfoValueForKey *)v15 infoValueForKeyWithError:&v47];
      if (!v12 && v47 != 24)
      {
        v16 = container_log_handle_for_category();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v49 = v5;
          __int16 v50 = 2048;
          uint64_t v51 = v47;
          _os_log_error_impl(&dword_1D7739000, v16, OS_LOG_TYPE_ERROR, "Error looking up info value for identity: %@: %llu", buf, 0x16u);
        }
      }
    }
    objc_opt_class();
    id v17 = v12;
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }
    v37 = v10;

    if (!v18)
    {
      v30 = v3;
      v31 = container_log_handle_for_category();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v35 = [(MCMCommand *)self context];
        v36 = [v35 clientIdentity];
        *(_DWORD *)buf = 138412290;
        id v49 = v36;
        _os_log_debug_impl(&dword_1D7739000, v31, OS_LOG_TYPE_DEBUG, "Reply to disk usage handed off to the slow workloop for client [%@]", buf, 0xCu);
      }
      v32 = [(MCMCommand *)self reply];
      v33 = [(MCMCommand *)self context];
      v34 = [v33 clientIdentity];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __42__MCMCommandDiskUsageForContainer_execute__block_invoke;
      v40[3] = &unk_1E6A7FEA0;
      v41 = v37;
      char v45 = v4;
      id v42 = v5;
      v43 = self;
      id v44 = v8;
      [v32 handoffToSlowWorkloopforClientIdentity:v34 withBlock:v40];

      v21 = v41;
      v3 = v30;
      v10 = v37;
      id v9 = v38;
      goto LABEL_23;
    }
    v39 = v5;
    uint64_t v22 = [v17 unsignedLongLongValue];
    v23 = [MCMResultDiskUsageForContainer alloc];
    v24 = [v8 containerIdentity];
    uint64_t v25 = [v24 containerClass];
    v19 = v8;
    [v8 containerIdentity];
    v27 = v26 = v3;
    v28 = [v27 userIdentity];
    v21 = -[MCMResultDiskUsageForContainer initWithDiskUsageBytes:descendants:containerClass:personaType:](v23, "initWithDiskUsageBytes:descendants:containerClass:personaType:", v22, 0, v25, [v28 personaType]);

    v3 = v26;
    v10 = v37;
    id v9 = v38;
    if (v21)
    {
LABEL_19:
      v29 = [(MCMCommand *)self resultPromise];
      [v29 completeWithResult:v21];

      v8 = v19;
      v5 = v39;
LABEL_23:

      goto LABEL_24;
    }
  }
  else
  {
    v39 = v5;
    v19 = v8;
    v20 = container_log_handle_for_category();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v49 = v9;
      __int16 v50 = 2112;
      uint64_t v51 = (uint64_t)v39;
      _os_log_error_impl(&dword_1D7739000, v20, OS_LOG_TYPE_ERROR, "No Container with identity: error = %@, identity = %@", buf, 0x16u);
    }

    v21 = [(MCMResultBase *)[MCMResultDiskUsageForContainer alloc] initWithError:v9];
    id v17 = 0;
    if (v21) {
      goto LABEL_19;
    }
  }
  v8 = v19;
  v5 = v39;
LABEL_24:
}

void __42__MCMCommandDiskUsageForContainer_execute__block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = +[MCMTestLocks sharedInstance];
  [v2 waitOnLock:8];

  v3 = +[MCMTestLocks sharedInstance];
  [v3 waitOnLock:2];

  char v4 = +[MCMFileManager defaultManager];
  v5 = [*(id *)(a1 + 32) containerPath];
  v6 = [v5 containerRootURL];
  uint64_t v7 = [v4 fastDiskUsageForURL:v6];
  uint64_t v9 = v8;

  if (!*(unsigned char *)(a1 + 64))
  {
    unint64_t v10 = [*(id *)(a1 + 40) containerClass];
    if (v10 <= 0xE && ((1 << v10) & 0x412A) != 0)
    {
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x3032000000;
      v35 = __Block_byref_object_copy__4951;
      v36 = __Block_byref_object_dispose__4952;
      id v37 = 0;
      unint64_t v11 = [*(id *)(a1 + 48) reply];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __42__MCMCommandDiskUsageForContainer_execute__block_invoke_8;
      v26[3] = &unk_1E6A7FE78;
      uint64_t v30 = v7;
      uint64_t v31 = v9;
      id v12 = *(id *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      id v27 = v12;
      uint64_t v28 = v13;
      v29 = &v32;
      [v11 dispatchSyncToFastWorkloopWithBlock:v26];

      v14 = [(id)v33[5] result];
      v15 = [v14 error];

      if (v15)
      {
        v16 = container_log_handle_for_category();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = *(void *)(a1 + 40);
          uint64_t v25 = [v14 error];
          *(_DWORD *)buf = 138412546;
          uint64_t v39 = v24;
          __int16 v40 = 2112;
          v41 = v25;
          _os_log_error_impl(&dword_1D7739000, v16, OS_LOG_TYPE_ERROR, "Error setting info value for identity: %@: %@", buf, 0x16u);
        }
      }

      _Block_object_dispose(&v32, 8);
    }
  }
  id v17 = [MCMResultDiskUsageForContainer alloc];
  id v18 = [*(id *)(a1 + 56) containerIdentity];
  uint64_t v19 = [v18 containerClass];
  v20 = [*(id *)(a1 + 56) containerIdentity];
  v21 = [v20 userIdentity];
  uint64_t v22 = -[MCMResultDiskUsageForContainer initWithDiskUsageBytes:descendants:containerClass:personaType:](v17, "initWithDiskUsageBytes:descendants:containerClass:personaType:", v7, v9, v19, [v21 personaType]);

  v23 = [*(id *)(a1 + 48) resultPromise];
  [v23 completeWithResult:v22];
}

void __42__MCMCommandDiskUsageForContainer_execute__block_invoke_8(uint64_t a1)
{
  v2 = [MCMCommandSetInfoValue alloc];
  v3 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = [*(id *)(a1 + 40) context];
  v6 = [(MCMCommandSetInfoValue *)v2 initWithKey:@"StaticDiskUsage" value:v3 containerIdentity:v4 context:v5 resultPromise:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  [(MCMCommandSetInfoValue *)v6 execute];
}

- (BOOL)preflightClientAllowed
{
  v2 = self;
  v3 = [(MCMCommand *)self context];
  uint64_t v4 = [v3 clientIdentity];

  v5 = [(MCMCommandDiskUsageForContainer *)v2 concreteContainerIdentity];
  LOBYTE(v2) = [v4 isAllowedToLookupContainerIdentity:v5];

  return (char)v2;
}

- (MCMCommandDiskUsageForContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandDiskUsageForContainer;
  uint64_t v9 = [(MCMCommand *)&v13 initWithMessage:v8 context:a4 reply:a5];
  if (v9)
  {
    uint64_t v10 = [v8 concreteContainerIdentity];
    concreteContainerIdentity = v9->_concreteContainerIdentity;
    v9->_concreteContainerIdentity = (MCMConcreteContainerIdentity *)v10;
  }
  return v9;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 23;
}

@end