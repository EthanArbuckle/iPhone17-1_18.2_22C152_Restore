@interface _DASSystemContext
+ (BOOL)isPluggedIn:(id)a3;
+ (id)defaultInexpensivePathEvaluator;
+ (id)defaultPathEvaluator;
+ (id)initWithContext:(id)a3;
+ (id)sharedInstance;
- (BOOL)allowDiscretionaryWorkForBackgroundTask:(id)a3 withParameters:(id)a4;
- (BOOL)allowDiscretionaryWorkForUtilityTask:(id)a3 withParameters:(id)a4;
- (BOOL)allowsDiscretionaryWorkForTask:(id)a3 withPriority:(unint64_t)a4 withParameters:(id)a5;
- (BOOL)isApplicationFocalForPushTask:(id)a3;
- (BOOL)isInexpensiveNetworkAvailable;
- (BOOL)isNetworkAvailable;
- (NSMutableArray)registrations;
- (OS_os_log)dasSystemContextLog;
- (_CDLocalContext)context;
- (_DASSystemContext)init;
- (id)keyPathForPriority:(unint64_t)a3;
- (int64_t)inexpensiveNetworkPathStatus;
- (int64_t)networkPathStatus;
- (void)addNotificationHandlerForTaskName:(id)a3 withPriority:(unint64_t)a4 withParameters:(id)a5 withHandler:(id)a6;
- (void)removeNotificationHandlerForTaskName:(id)a3;
- (void)setContext:(id)a3;
- (void)setDasSystemContextLog:(id)a3;
- (void)setInexpensiveNetworkPathStatus:(int64_t)a3;
- (void)setNetworkPathStatus:(int64_t)a3;
- (void)setRegistrations:(id)a3;
- (void)updateSystemConstraintsWithParameters:(id)a3;
@end

@implementation _DASSystemContext

- (BOOL)allowsDiscretionaryWorkForTask:(id)a3 withPriority:(unint64_t)a4 withParameters:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1BA99F610]();
  if (_DASSchedulingPriorityBackground >= a4)
  {
    BOOL v13 = [(_DASSystemContext *)self allowDiscretionaryWorkForBackgroundTask:v8 withParameters:v9];
  }
  else if (_DASSchedulingPriorityDefault >= a4)
  {
    BOOL v13 = [(_DASSystemContext *)self allowDiscretionaryWorkForUtilityTask:v8 withParameters:v9];
  }
  else
  {
    v11 = [v9 objectForKeyedSubscript:kDASSystemContextKeyNetworkTask];
    int v12 = [v11 BOOLValue];

    if (!v12)
    {
      BOOL v14 = 1;
      goto LABEL_8;
    }
    BOOL v13 = [(_DASSystemContext *)self isNetworkAvailable];
  }
  BOOL v14 = v13;
LABEL_8:

  return v14;
}

- (BOOL)allowDiscretionaryWorkForBackgroundTask:(id)a3 withParameters:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_DASSystemContext *)self keyPathForPriority:_DASSchedulingPriorityBackground];
  id v9 = [(_CDLocalContext *)self->_context objectForKeyedSubscript:v8];
  char v10 = [v9 unsignedIntegerValue];

  v11 = [v7 objectForKeyedSubscript:kDASSystemContextKeyPushTask];
  int v12 = [v11 BOOLValue];

  if (v12 && [(_DASSystemContext *)self isApplicationFocalForPushTask:v6])
  {
    BOOL v13 = [(_DASSystemContext *)self dasSystemContextLog];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412290;
      id v26 = v6;
      BOOL v14 = "Task %@: Application focal";
LABEL_26:
      _os_log_impl(&dword_1B578B000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v25, 0xCu);
    }
  }
  else
  {
    BOOL v15 = (v10 & 1) == 0;
    if (v10)
    {
      v16 = [(_DASSystemContext *)self dasSystemContextLog];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138412546;
        id v26 = v6;
        __int16 v27 = 2048;
        uint64_t v28 = 30;
        _os_log_impl(&dword_1B578B000, v16, OS_LOG_TYPE_DEFAULT, "Task %@: Battery level below %lu returning NO", (uint8_t *)&v25, 0x16u);
      }
    }
    if ((v10 & 2) != 0)
    {
      v17 = [(_DASSystemContext *)self dasSystemContextLog];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138412546;
        id v26 = v6;
        __int16 v27 = 2048;
        uint64_t v28 = 0;
        _os_log_impl(&dword_1B578B000, v17, OS_LOG_TYPE_DEFAULT, "Task %@: Thermal pressure level above %lu returning NO", (uint8_t *)&v25, 0x16u);
      }

      BOOL v15 = 0;
    }
    v18 = [v7 objectForKeyedSubscript:kDASSystemContextKeyBypassEnergyBudget];
    char v19 = [v18 BOOLValue];

    if ((v19 & 1) == 0 && (v10 & 4) != 0)
    {
      v20 = [(_DASSystemContext *)self dasSystemContextLog];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138412290;
        id v26 = v6;
        _os_log_impl(&dword_1B578B000, v20, OS_LOG_TYPE_DEFAULT, "Task %@: Out of Energy budget returning NO", (uint8_t *)&v25, 0xCu);
      }

      BOOL v15 = 0;
    }
    v21 = [v7 objectForKeyedSubscript:kDASSystemContextKeyNetworkTask];
    int v22 = [v21 BOOLValue];

    if (v22 && (v10 & 0x10) != 0)
    {
      BOOL v13 = [(_DASSystemContext *)self dasSystemContextLog];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138412290;
        id v26 = v6;
        _os_log_impl(&dword_1B578B000, v13, OS_LOG_TYPE_DEFAULT, "Task %@: Inexpensive network not available returning NO", (uint8_t *)&v25, 0xCu);
      }
      BOOL v23 = 0;
      goto LABEL_28;
    }
    if (!v15)
    {
      BOOL v23 = 0;
      goto LABEL_29;
    }
    BOOL v13 = [(_DASSystemContext *)self dasSystemContextLog];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412290;
      id v26 = v6;
      BOOL v14 = "Task %@: Returning YES";
      goto LABEL_26;
    }
  }
  BOOL v23 = 1;
LABEL_28:

LABEL_29:
  return v23;
}

- (id)keyPathForPriority:(unint64_t)a3
{
  if (_DASSchedulingPriorityBackground >= a3)
  {
    v4 = @"/das/maintenanceConstraints";
  }
  else
  {
    if (_DASSchedulingPriorityDefault < a3)
    {
      v3 = 0;
      goto LABEL_7;
    }
    v4 = @"/das/utilityConstraints";
  }
  v3 = [MEMORY[0x1E4F5B6D8] keyPathWithKey:v4];
LABEL_7:

  return v3;
}

- (OS_os_log)dasSystemContextLog
{
  return self->_dasSystemContextLog;
}

+ (BOOL)isPluggedIn:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F5B6B0];
  id v4 = a3;
  v5 = [v3 keyPathForPluginStatus];
  id v6 = [v4 objectForKeyedSubscript:v5];

  LOBYTE(v4) = [v6 BOOLValue];
  return (char)v4;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35___DASSystemContext_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

- (_DASSystemContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DASSystemContext;
  v2 = [(_DASSystemContext *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F5B6A0] userContext];
    context = v2->_context;
    v2->_context = (_CDLocalContext *)v3;

    os_log_t v5 = os_log_create((const char *)[@"com.apple.das" UTF8String], (const char *)objc_msgSend(@"systemcontext", "UTF8String"));
    dasSystemContextLog = v2->_dasSystemContextLog;
    v2->_dasSystemContextLog = (OS_os_log *)v5;
  }
  return v2;
}

+ (id)initWithContext:(id)a3
{
  id v3 = a3;
  id v4 = +[_DASSystemContext sharedInstance];
  [v4 setContext:v3];

  return v4;
}

+ (id)defaultPathEvaluator
{
  if (defaultPathEvaluator_onceToken != -1) {
    dispatch_once(&defaultPathEvaluator_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)defaultPathEvaluator_defaultPathEvaluator;

  return v2;
}

+ (id)defaultInexpensivePathEvaluator
{
  if (defaultInexpensivePathEvaluator_onceToken != -1) {
    dispatch_once(&defaultInexpensivePathEvaluator_onceToken, &__block_literal_global_38);
  }
  v2 = (void *)defaultInexpensivePathEvaluator_defaultInexpensivePathEvaluator;

  return v2;
}

- (BOOL)isNetworkAvailable
{
  v2 = [(id)objc_opt_class() defaultPathEvaluator];
  id v3 = [v2 path];
  uint64_t v4 = [v3 status];

  return v4 != 2;
}

- (BOOL)isInexpensiveNetworkAvailable
{
  v2 = [(id)objc_opt_class() defaultInexpensivePathEvaluator];
  id v3 = [v2 path];
  uint64_t v4 = [v3 status];

  return v4 != 2;
}

- (BOOL)isApplicationFocalForPushTask:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_log_t v5 = v4;
  if ([v4 hasPrefix:@"com.apple.apsd."])
  {
    os_log_t v5 = [v4 substringFromIndex:objc_msgSend(@"com.apple.apsd.", "length")];
  }
  if ([v5 hasPrefix:@"com.apple.icloud-container."])
  {
    uint64_t v6 = [v5 substringFromIndex:objc_msgSend(@"com.apple.icloud-container.", "length")];

    os_log_t v5 = (void *)v6;
  }
  id v7 = [v5 lowercaseString];

  context = self->_context;
  id v9 = [MEMORY[0x1E4F5B6B0] keyPathForAppUsageDataDictionaries];
  char v10 = [(_CDLocalContext *)context objectForKeyedSubscript:v9];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v11);
        }
        BOOL v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v16 = objc_msgSend(MEMORY[0x1E4F5B6B0], "appUsageBundleID", (void)v20);
        v17 = [v15 objectForKeyedSubscript:v16];
        v18 = [v17 lowercaseString];

        if (v18 && ([v18 hasPrefix:v7] & 1) != 0)
        {

          LOBYTE(v12) = 1;
          goto LABEL_16;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v12;
}

- (BOOL)allowDiscretionaryWorkForUtilityTask:(id)a3 withParameters:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [MEMORY[0x1E4F5B6D8] keyPathWithKey:@"/das/utilityConstraints"];
  id v9 = [(_CDLocalContext *)self->_context objectForKeyedSubscript:v8];
  char v10 = [v9 unsignedIntegerValue];

  id v11 = [v7 objectForKeyedSubscript:kDASSystemContextKeyPushTask];
  int v12 = [v11 BOOLValue];

  if (v12 && [(_DASSystemContext *)self isApplicationFocalForPushTask:v6])
  {
    uint64_t v13 = [(_DASSystemContext *)self dasSystemContextLog];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      id v29 = v6;
      BOOL v14 = "Task %@: Application focal";
LABEL_28:
      _os_log_impl(&dword_1B578B000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v28, 0xCu);
      goto LABEL_29;
    }
    goto LABEL_29;
  }
  BOOL v15 = (v10 & 1) == 0;
  if (v10)
  {
    v16 = [(_DASSystemContext *)self dasSystemContextLog];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412546;
      id v29 = v6;
      __int16 v30 = 2048;
      uint64_t v31 = 20;
      _os_log_impl(&dword_1B578B000, v16, OS_LOG_TYPE_DEFAULT, "Task %@: Battery level below %lu returning NO", (uint8_t *)&v28, 0x16u);
    }
  }
  if ((v10 & 2) != 0)
  {
    v17 = [(_DASSystemContext *)self dasSystemContextLog];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412546;
      id v29 = v6;
      __int16 v30 = 2048;
      uint64_t v31 = 20;
      _os_log_impl(&dword_1B578B000, v17, OS_LOG_TYPE_DEFAULT, "Task %@: Thermal pressure level above %lu returning NO", (uint8_t *)&v28, 0x16u);
    }

    BOOL v15 = 0;
  }
  v18 = [v7 objectForKeyedSubscript:kDASSystemContextKeyBypassEnergyBudget];
  char v19 = [v18 BOOLValue];

  if ((v19 & 1) == 0 && (v10 & 4) != 0)
  {
    long long v20 = [(_DASSystemContext *)self dasSystemContextLog];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      id v29 = v6;
      _os_log_impl(&dword_1B578B000, v20, OS_LOG_TYPE_DEFAULT, "Task %@: Out of Energy budget returning NO", (uint8_t *)&v28, 0xCu);
    }

    BOOL v15 = 0;
  }
  long long v21 = [v7 objectForKeyedSubscript:kDASSystemContextKeyNetworkTask];
  int v22 = [v21 BOOLValue];

  if (v22)
  {
    if ((v10 & 0x20) != 0)
    {
      uint64_t v13 = [(_DASSystemContext *)self dasSystemContextLog];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 138412290;
        id v29 = v6;
        uint64_t v25 = "Task %@: Network not available returning NO";
        goto LABEL_33;
      }
LABEL_34:
      BOOL v26 = 0;
      goto LABEL_35;
    }
    if ((v10 & 0x10) != 0)
    {
      long long v23 = [v7 objectForKeyedSubscript:kDASSystemContextKeyBypassDataBudget];
      char v24 = [v23 BOOLValue];

      if ((v24 & 1) == 0 && (v10 & 8) != 0)
      {
        uint64_t v13 = [(_DASSystemContext *)self dasSystemContextLog];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 138412290;
          id v29 = v6;
          uint64_t v25 = "Task %@: Out of data budget returning NO";
LABEL_33:
          _os_log_impl(&dword_1B578B000, v13, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v28, 0xCu);
          goto LABEL_34;
        }
        goto LABEL_34;
      }
    }
  }
  if (v15)
  {
    uint64_t v13 = [(_DASSystemContext *)self dasSystemContextLog];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      id v29 = v6;
      BOOL v14 = "Task %@: Returning YES";
      goto LABEL_28;
    }
LABEL_29:
    BOOL v26 = 1;
LABEL_35:

    goto LABEL_36;
  }
  BOOL v26 = 0;
LABEL_36:

  return v26;
}

- (void)updateSystemConstraintsWithParameters:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_log_t v5 = [(_DASSystemContext *)self dasSystemContextLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 description];
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1B578B000, v5, OS_LOG_TYPE_DEFAULT, "Updating system constraints to: %@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = +[_DASScheduler sharedScheduler];
  [v7 updateSystemConstraintsWithParameters:v4];
}

- (void)addNotificationHandlerForTaskName:(id)a3 withPriority:(unint64_t)a4 withParameters:(id)a5 withHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)MEMORY[0x1E4F5B6F0];
  BOOL v14 = [(_DASSystemContext *)self keyPathForPriority:a4];
  BOOL v15 = [v13 predicateForChangeAtKeyPath:v14];

  objc_initWeak(&location, self);
  v16 = (void *)MEMORY[0x1E4F5B6D0];
  v17 = [NSString stringWithFormat:@"com.apple.das.systemcontext.%@", v10];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __95___DASSystemContext_addNotificationHandlerForTaskName_withPriority_withParameters_withHandler___block_invoke;
  v26[3] = &unk_1E6112E88;
  objc_copyWeak(v30, &location);
  id v18 = v12;
  id v29 = v18;
  id v19 = v10;
  id v27 = v19;
  v30[1] = (id)a4;
  id v20 = v11;
  id v28 = v20;
  long long v21 = [v16 localNonWakingRegistrationWithIdentifier:v17 contextualPredicate:v15 callback:v26];

  int v22 = self;
  objc_sync_enter(v22);
  registrations = v22->_registrations;
  if (!registrations)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v25 = v22->_registrations;
    v22->_registrations = (NSMutableArray *)v24;

    registrations = v22->_registrations;
  }
  [(NSMutableArray *)registrations addObject:v21];
  objc_sync_exit(v22);

  [(_CDLocalContext *)v22->_context registerCallback:v21];
  (*((void (**)(id, BOOL))v18 + 2))(v18, [(_DASSystemContext *)v22 allowsDiscretionaryWorkForTask:v19 withPriority:a4 withParameters:v20]);

  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
}

- (void)removeNotificationHandlerForTaskName:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_log_t v5 = [NSString stringWithFormat:@"com.apple.das.systemcontext.%@", v4];
  id v6 = self;
  objc_sync_enter(v6);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6->_registrations;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v7);
      }
      id v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
      id v12 = [v11 identifier];
      char v13 = [v12 isEqualToString:v5];

      if (v13) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    BOOL v14 = v11;

    if (!v14) {
      goto LABEL_12;
    }
    [(NSMutableArray *)v6->_registrations removeObject:v14];
    objc_sync_exit(v6);

    [(_CDLocalContext *)v6->_context deregisterCallback:v14];
    id v6 = v14;
  }
  else
  {
LABEL_9:

LABEL_12:
    objc_sync_exit(v6);
  }
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void)setDasSystemContextLog:(id)a3
{
}

- (NSMutableArray)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
}

- (int64_t)networkPathStatus
{
  return self->_networkPathStatus;
}

- (void)setNetworkPathStatus:(int64_t)a3
{
  self->_networkPathStatus = a3;
}

- (int64_t)inexpensiveNetworkPathStatus
{
  return self->_inexpensiveNetworkPathStatus;
}

- (void)setInexpensiveNetworkPathStatus:(int64_t)a3
{
  self->_inexpensiveNetworkPathStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_dasSystemContextLog, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end