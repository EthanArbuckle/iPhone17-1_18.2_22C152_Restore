@interface FMDaemon
- (id)verifyLaunchEventsConfiguration:(id)a3 withExclusions:(id)a4;
- (id)xpcDarwinEventHandlers;
- (id)xpcDistributedEventHandlers;
- (void)initialize;
- (void)registerXPCEventHandlers;
- (void)run;
- (void)startupWithCompletion:(id)a3;
@end

@implementation FMDaemon

- (void)run
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __15__FMDaemon_run__block_invoke;
  v3[3] = &unk_1E689E780;
  v3[4] = self;
  [(FMDaemon *)self startupWithCompletion:v3];
  v2 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v2 run];
}

uint64_t __15__FMDaemon_run__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerXPCEventHandlers];
}

- (void)initialize
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __22__FMDaemon_initialize__block_invoke;
  v2[3] = &unk_1E689E780;
  v2[4] = self;
  [(FMDaemon *)self startupWithCompletion:v2];
}

uint64_t __22__FMDaemon_initialize__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerXPCEventHandlers];
}

- (void)startupWithCompletion:(id)a3
{
  id v5 = a3;
  [(FMDaemon *)self startup];
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }
}

- (id)xpcDarwinEventHandlers
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)xpcDistributedEventHandlers
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (void)registerXPCEventHandlers
{
  id v4 = [(FMDaemon *)self xpcDarwinEventHandlers];
  if (v4) {
    +[FMXPCNotificationsUtil handleDarwinNotificationsWithHandlers:v4];
  }
  v3 = [(FMDaemon *)self xpcDistributedEventHandlers];
  if (v3) {
    +[FMXPCNotificationsUtil handleDistributedNotificationsWithHandlers:v3];
  }
}

- (id)verifyLaunchEventsConfiguration:(id)a3 withExclusions:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1CAD0] setWithArray:a4];
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v6];
  v9 = v8;
  if (v8)
  {
    v50 = self;
    v52 = v8;
    v53 = v7;
    v10 = [v8 objectForKeyedSubscript:@"LaunchEvents"];
    v11 = [v10 objectForKeyedSubscript:@"com.apple.notifyd.matching"];

    v12 = [MEMORY[0x1E4F1CA80] set];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v63 objects:v68 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v64;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v64 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          [v12 addObject:v18];
          v19 = [v13 objectForKeyedSubscript:v18];
          id v20 = [v19 objectForKeyedSubscript:@"Notification"];

          if (![v18 isEqualToString:v20])
          {
            id v26 = [NSString stringWithFormat:@"Darwin event key %@ does not match with its notification name %@", v18, v20];
            v21 = v13;
            v9 = v52;
            v7 = v53;
            goto LABEL_37;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v63 objects:v68 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    v7 = v53;
    [v12 minusSet:v53];
    v21 = [(FMDaemon *)v50 xpcDarwinEventHandlers];
    v22 = [MEMORY[0x1E4F1CA80] set];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __59__FMDaemon_verifyLaunchEventsConfiguration_withExclusions___block_invoke;
    v61[3] = &unk_1E689E7A8;
    id v20 = v22;
    id v62 = v20;
    [v21 enumerateKeysAndObjectsUsingBlock:v61];
    [v20 minusSet:v53];
    v23 = [MEMORY[0x1E4F28E78] string];
    v24 = (void *)[v12 mutableCopy];
    [v24 minusSet:v20];
    if ([v24 count]) {
      [v23 appendFormat:@"launchd plist has these darwin notifications that don't have a handler defined in code: %@\n", v24];
    }
    v25 = (void *)[v20 mutableCopy];
    [v25 minusSet:v12];
    if ([v25 count]) {
      [v23 appendFormat:@"launchd plist does not have these darwin notifications but, they have a handler defined in code: %@\n", v25];
    }
    v49 = v25;
    v9 = v52;
    if ([v23 length])
    {
      id v26 = v23;
    }
    else
    {
      v45 = v24;
      v46 = v23;
      v47 = v21;
      id v48 = v6;
      v27 = [v52 objectForKeyedSubscript:@"LaunchEvents"];
      v28 = [v27 objectForKeyedSubscript:@"com.apple.distnoted.matching"];

      v54 = [MEMORY[0x1E4F1CA80] set];
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v29 = v28;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v57 objects:v67 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v58;
        while (2)
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v58 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = *(void **)(*((void *)&v57 + 1) + 8 * j);
            [v54 addObject:v34];
            v35 = [v29 objectForKeyedSubscript:v34];
            id v36 = [v35 objectForKeyedSubscript:@"Name"];

            if (![v34 isEqualToString:v36])
            {
              id v26 = [NSString stringWithFormat:@"Distributed event key %@ does not match with its notification name %@", v34, v36];
              v42 = v29;
              v9 = v52;
              v7 = v53;
              goto LABEL_35;
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v57 objects:v67 count:16];
          if (v31) {
            continue;
          }
          break;
        }
      }

      v7 = v53;
      [v54 minusSet:v53];
      v37 = [(FMDaemon *)v50 xpcDistributedEventHandlers];
      v38 = [MEMORY[0x1E4F1CA80] set];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __59__FMDaemon_verifyLaunchEventsConfiguration_withExclusions___block_invoke_2;
      v55[3] = &unk_1E689E7A8;
      id v36 = v38;
      id v56 = v36;
      v51 = v37;
      [v37 enumerateKeysAndObjectsUsingBlock:v55];
      [v36 minusSet:v53];
      v39 = [MEMORY[0x1E4F28E78] string];
      v40 = (void *)[v54 mutableCopy];
      [v40 minusSet:v36];
      if ([v40 count]) {
        [v39 appendFormat:@"launchd plist has these distributed notifications that don't have a handler defined in code: %@\n", v40];
      }
      v44 = v40;
      v41 = (void *)[v36 mutableCopy];
      [v41 minusSet:v54];
      if ([v41 count]) {
        [v39 appendFormat:@"launchd plist does not have these distributed notifications but, they have a handler defined in code: %@\n", v41];
      }
      if ([v39 length]) {
        id v26 = v39;
      }
      else {
        id v26 = 0;
      }
      v9 = v52;

      v42 = v51;
LABEL_35:

      v21 = v47;
      id v6 = v48;
      v24 = v45;
      v23 = v46;
    }

LABEL_37:
  }
  else
  {
    id v26 = [NSString stringWithFormat:@"Could not load %@", 0];
  }

  return v26;
}

void __59__FMDaemon_verifyLaunchEventsConfiguration_withExclusions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) addObjectsFromArray:v3];
    }
  }
}

void __59__FMDaemon_verifyLaunchEventsConfiguration_withExclusions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) addObjectsFromArray:v3];
    }
  }
}

@end