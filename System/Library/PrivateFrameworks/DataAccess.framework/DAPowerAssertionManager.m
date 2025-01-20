@interface DAPowerAssertionManager
+ (id)sharedPowerAssertionManager;
+ (void)vendDaemons:(Class)a3;
- (BOOL)_releaseAssertionForContext:(id)a3;
- (BOOL)_retainAssertionForContext:(id)a3;
- (DAPowerAssertionManager)init;
- (NSCountedSet)contexts;
- (NSCountedSet)heldAsideContexts;
- (NSMapTable)contextToGroupIdentifier;
- (NSMapTable)contextToPowerAssertionRef;
- (NSMapTable)groupIdentifierToContexts;
- (NSMutableSet)heldAsideGroupIdentifiers;
- (id)stateString;
- (unint64_t)powerAssertionRetainCount:(id)a3;
- (void)dropPowerAssertionsForGroupIdentifier:(id)a3;
- (void)reattainPowerAssertionsForGroupIdentifier:(id)a3;
- (void)releasePowerAssertion:(id)a3;
- (void)retainPowerAssertion:(id)a3 withGroupIdentifier:(id)a4;
- (void)setContextToGroupIdentifier:(id)a3;
- (void)setContextToPowerAssertionRef:(id)a3;
- (void)setContexts:(id)a3;
- (void)setGroupIdentifierToContexts:(id)a3;
- (void)setHeldAsideContexts:(id)a3;
- (void)setHeldAsideGroupIdentifiers:(id)a3;
@end

@implementation DAPowerAssertionManager

- (DAPowerAssertionManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)DAPowerAssertionManager;
  v2 = [(DAPowerAssertionManager *)&v10 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(DAPowerAssertionManager *)v2 setContexts:v3];

    v4 = objc_opt_new();
    [(DAPowerAssertionManager *)v2 setGroupIdentifierToContexts:v4];

    v5 = objc_opt_new();
    [(DAPowerAssertionManager *)v2 setContextToGroupIdentifier:v5];

    v6 = objc_opt_new();
    [(DAPowerAssertionManager *)v2 setHeldAsideContexts:v6];

    v7 = objc_opt_new();
    [(DAPowerAssertionManager *)v2 setHeldAsideGroupIdentifiers:v7];

    v8 = objc_opt_new();
    [(DAPowerAssertionManager *)v2 setContextToPowerAssertionRef:v8];
  }
  return v2;
}

+ (void)vendDaemons:(Class)a3
{
  _sVendDaemonManagerType = (uint64_t)a3;
}

+ (id)sharedPowerAssertionManager
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!sharedPowerAssertionManager_obj)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)sharedPowerAssertionManager_obj;
    sharedPowerAssertionManager_obj = v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)sharedPowerAssertionManager_obj;
  return v5;
}

- (unint64_t)powerAssertionRetainCount:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"DAPowerAssertionManager.m", 62, @"%s must have a non-nil context", sel_getName(a2));
  }
  v6 = self;
  objc_sync_enter(v6);
  v7 = [(DAPowerAssertionManager *)v6 contexts];
  uint64_t v8 = [v7 countForObject:v5];

  v9 = [(DAPowerAssertionManager *)v6 heldAsideContexts];
  unint64_t v10 = [v9 countForObject:v5] + v8;

  objc_sync_exit(v6);
  return v10;
}

- (void)retainPowerAssertion:(id)a3 withGroupIdentifier:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"DAPowerAssertionManager.m", 72, @"%s must have a non-nil context", sel_getName(a2));

    if (v9) {
      goto LABEL_3;
    }
  }
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"DAPowerAssertionManager.m", 73, @"%s must have a non-nil group identifier", sel_getName(a2));

LABEL_3:
  unint64_t v10 = DALoggingwithCategory();
  uint64_t v11 = MEMORY[0x1E4F5E9A0];
  os_log_type_t v12 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v10, v12))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v7;
    __int16 v31 = 2112;
    v32 = v9;
    _os_log_impl(&dword_1BA384000, v10, v12, "Context %@ retaining power assertion with group identifier %@", buf, 0x16u);
  }

  v13 = self;
  objc_sync_enter(v13);
  if (v9
    && ([(DAPowerAssertionManager *)v13 heldAsideGroupIdentifiers],
        v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 containsObject:v9],
        v14,
        v15))
  {
    v16 = DALoggingwithCategory();
    os_log_type_t v17 = *(unsigned char *)(v11 + 7);
    if (os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v7;
      __int16 v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_1BA384000, v16, v17, "Context %@ getting added to our held aside contexts, as group %@ is currently dropped", buf, 0x16u);
    }

    v18 = [(DAPowerAssertionManager *)v13 heldAsideContexts];
    [v18 addObject:v7];
    uint64_t v19 = 0;
    uint64_t v20 = 0;
  }
  else
  {
    v21 = [(DAPowerAssertionManager *)v13 contexts];
    uint64_t v19 = [v21 countForObject:v7];

    v22 = [(DAPowerAssertionManager *)v13 contexts];
    [v22 addObject:v7];

    v18 = [(DAPowerAssertionManager *)v13 contexts];
    uint64_t v20 = [v18 countForObject:v7];
  }

  v23 = [(DAPowerAssertionManager *)v13 groupIdentifierToContexts];
  v24 = [v23 objectForKey:v9];

  if (!v24)
  {
    v24 = objc_opt_new();
    v25 = [(DAPowerAssertionManager *)v13 groupIdentifierToContexts];
    [v25 setObject:v24 forKey:v9];
  }
  [v24 addObject:v7];
  v26 = [(DAPowerAssertionManager *)v13 contextToGroupIdentifier];
  [v26 setObject:v9 forKey:v7];

  if (!v19 && v20 == 1) {
    [(DAPowerAssertionManager *)v13 _retainAssertionForContext:v7];
  }

  objc_sync_exit(v13);
}

- (void)releasePowerAssertion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"DAPowerAssertionManager.m", 102, @"%s must have a non-nil context", sel_getName(a2));
  }
  v6 = DALoggingwithCategory();
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v6, v7))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v5;
    _os_log_impl(&dword_1BA384000, v6, v7, "Context %@ releasing power assertion", buf, 0xCu);
  }

  id v8 = self;
  objc_sync_enter(v8);
  v9 = [(DAPowerAssertionManager *)v8 heldAsideContexts];
  BOOL v10 = [v9 countForObject:v5] == 0;

  if (!v10)
  {
    uint64_t v11 = [(DAPowerAssertionManager *)v8 heldAsideContexts];
    [v11 removeObject:v5];
LABEL_7:
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    goto LABEL_10;
  }
  v14 = [(DAPowerAssertionManager *)v8 contexts];
  BOOL v15 = [v14 countForObject:v5] == 0;

  if (v15)
  {
    uint64_t v11 = DALoggingwithCategory();
    if (os_log_type_enabled(v11, v7))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v5;
      _os_log_impl(&dword_1BA384000, v11, v7, "Context object %@ attempting to release power assertion without first retaining it", buf, 0xCu);
    }
    goto LABEL_7;
  }
  v16 = [(DAPowerAssertionManager *)v8 contexts];
  uint64_t v13 = [v16 countForObject:v5];

  os_log_type_t v17 = [(DAPowerAssertionManager *)v8 contexts];
  [v17 removeObject:v5];

  uint64_t v11 = [(DAPowerAssertionManager *)v8 contexts];
  uint64_t v12 = [v11 countForObject:v5];
LABEL_10:

  v18 = [(DAPowerAssertionManager *)v8 contextToGroupIdentifier];
  uint64_t v19 = [v18 objectForKey:v5];

  if (v19)
  {
    uint64_t v20 = [(DAPowerAssertionManager *)v8 groupIdentifierToContexts];
    v21 = [v20 objectForKey:v19];

    if (v21)
    {
      [v21 removeObject:v5];
      if (![v21 count])
      {
        v22 = [(DAPowerAssertionManager *)v8 groupIdentifierToContexts];
        [v22 removeObjectForKey:v19];
      }
    }
    v23 = [(DAPowerAssertionManager *)v8 contextToGroupIdentifier];
    [v23 removeObjectForKey:v5];
  }
  if (v13 == 1 && !v12) {
    [(DAPowerAssertionManager *)v8 _releaseAssertionForContext:v5];
  }

  objc_sync_exit(v8);
}

- (id)stateString
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = NSString;
  v4 = [(DAPowerAssertionManager *)v2 contexts];
  id v5 = [(DAPowerAssertionManager *)v2 heldAsideContexts];
  v6 = [(DAPowerAssertionManager *)v2 contextToPowerAssertionRef];
  os_log_type_t v7 = [v3 stringWithFormat:@"Shared DAPowerAssertionManager object %@:\nContexts asserting power: %@\nContexts held aside: %@\nActive Assertions: %@\n\n", v2, v4, v5, v6];

  objc_sync_exit(v2);
  return v7;
}

- (void)dropPowerAssertionsForGroupIdentifier:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v4;
    _os_log_impl(&dword_1BA384000, v5, v6, "Dropping power assertion for group identifier %@", buf, 0xCu);
  }

  os_log_type_t v7 = self;
  objc_sync_enter(v7);
  id v8 = [(DAPowerAssertionManager *)v7 heldAsideGroupIdentifiers];
  char v9 = [v8 containsObject:v4];

  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v11 = [(DAPowerAssertionManager *)v7 heldAsideGroupIdentifiers];
    [v11 addObject:v4];

    uint64_t v12 = [(DAPowerAssertionManager *)v7 groupIdentifierToContexts];
    uint64_t v13 = [v12 objectForKey:v4];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v10 = v13;
    uint64_t v14 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v10);
          }
          unsigned int v17 = 0;
          uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          while (1)
          {
            uint64_t v19 = [(DAPowerAssertionManager *)v7 contexts];
            BOOL v20 = [v19 countForObject:v18] > (unint64_t)v17;

            if (!v20) {
              break;
            }
            v21 = [(DAPowerAssertionManager *)v7 heldAsideContexts];
            [v21 addObject:v18];

            v22 = [(DAPowerAssertionManager *)v7 contexts];
            [v22 removeObject:v18];

            ++v17;
          }
        }
        uint64_t v14 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v14);
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v23 = (id)[v10 copy];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v23);
        }
        -[DAPowerAssertionManager _releaseAssertionForContext:](v7, "_releaseAssertionForContext:", *(void *)(*((void *)&v27 + 1) + 8 * j), (void)v27);
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v24);
  }

  objc_sync_exit(v7);
}

- (void)reattainPowerAssertionsForGroupIdentifier:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v4;
    _os_log_impl(&dword_1BA384000, v5, v6, "Reattaining power assertion for group identifier %@", buf, 0xCu);
  }

  os_log_type_t v7 = self;
  objc_sync_enter(v7);
  id v8 = [(DAPowerAssertionManager *)v7 heldAsideGroupIdentifiers];
  int v9 = [v8 containsObject:v4];

  if (v9)
  {
    id v10 = [(DAPowerAssertionManager *)v7 heldAsideGroupIdentifiers];
    [v10 removeObject:v4];

    uint64_t v11 = [(DAPowerAssertionManager *)v7 groupIdentifierToContexts];
    uint64_t v12 = [v11 objectForKey:v4];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v13);
          }
          unsigned int v17 = 0;
          uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          while (1)
          {
            uint64_t v19 = [(DAPowerAssertionManager *)v7 heldAsideContexts];
            BOOL v20 = [v19 countForObject:v18] > (unint64_t)v17;

            if (!v20) {
              break;
            }
            v21 = [(DAPowerAssertionManager *)v7 contexts];
            [v21 addObject:v18];

            v22 = [(DAPowerAssertionManager *)v7 heldAsideContexts];
            [v22 removeObject:v18];

            ++v17;
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v13 = 0;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v23 = (id)[v13 copy];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v23);
        }
        -[DAPowerAssertionManager _retainAssertionForContext:](v7, "_retainAssertionForContext:", *(void *)(*((void *)&v27 + 1) + 8 * j), (void)v27);
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v24);
  }

  objc_sync_exit(v7);
}

- (BOOL)_retainAssertionForContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_retainAssertionForContext__onceToken != -1) {
    dispatch_once(&_retainAssertionForContext__onceToken, &__block_literal_global_5);
  }
  [MEMORY[0x1E4F5E940] isAppleInternalInstall];
  id v5 = [(DAPowerAssertionManager *)self contextToPowerAssertionRef];
  uint64_t v6 = [v5 count];

  os_log_type_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.DataAccess:%d-%p", _retainAssertionForContext__pid, v4);
  uint64_t v8 = CPPowerAssertionCreate();
  if (v8)
  {
    int v9 = (const void *)v8;
    id v10 = [(DAPowerAssertionManager *)self contextToPowerAssertionRef];
    [v10 setObject:v9 forKey:v4];

    CFRelease(v9);
    uint64_t v11 = DALoggingwithCategory();
    os_log_type_t v12 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = [(DAPowerAssertionManager *)self contextToPowerAssertionRef];
      *(_DWORD *)buf = 138412802;
      unsigned int v17 = v7;
      __int16 v18 = 2048;
      id v19 = v4;
      __int16 v20 = 2048;
      uint64_t v21 = [v13 count];
      uint64_t v14 = "DAPowerAssertionManager retained power assertion %@ for context %p, outstanding assertion count %lu";
LABEL_8:
      _os_log_impl(&dword_1BA384000, v11, v12, v14, buf, 0x20u);
    }
  }
  else
  {
    uint64_t v11 = DALoggingwithCategory();
    os_log_type_t v12 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = [(DAPowerAssertionManager *)self contextToPowerAssertionRef];
      *(_DWORD *)buf = 138412802;
      unsigned int v17 = v7;
      __int16 v18 = 2048;
      id v19 = v4;
      __int16 v20 = 2048;
      uint64_t v21 = [v13 count];
      uint64_t v14 = "DAPowerAssertionManager unable to get non-nil power assertion %@ for context %p, outstanding assertion count %lu";
      goto LABEL_8;
    }
  }

  return v6 == 0;
}

uint64_t __54__DAPowerAssertionManager__retainAssertionForContext___block_invoke()
{
  uint64_t result = getpid();
  _retainAssertionForContext__pid = result;
  return result;
}

- (BOOL)_releaseAssertionForContext:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = [(DAPowerAssertionManager *)self contextToPowerAssertionRef];
    int v12 = 134218240;
    id v13 = v4;
    __int16 v14 = 1024;
    int v15 = [v7 count] - 1;
    _os_log_impl(&dword_1BA384000, v5, v6, "DAPowerAssertionManager releasing power assertion for context %p, outstanding assertion count %u ontext", (uint8_t *)&v12, 0x12u);
  }
  uint64_t v8 = [(DAPowerAssertionManager *)self contextToPowerAssertionRef];
  [v8 removeObjectForKey:v4];

  int v9 = [(DAPowerAssertionManager *)self contextToPowerAssertionRef];
  BOOL v10 = [v9 count] == 0;

  return v10;
}

- (NSCountedSet)contexts
{
  return self->_contexts;
}

- (void)setContexts:(id)a3
{
}

- (NSMapTable)groupIdentifierToContexts
{
  return self->_groupIdentifierToContexts;
}

- (void)setGroupIdentifierToContexts:(id)a3
{
}

- (NSMapTable)contextToGroupIdentifier
{
  return self->_contextToGroupIdentifier;
}

- (void)setContextToGroupIdentifier:(id)a3
{
}

- (NSMutableSet)heldAsideGroupIdentifiers
{
  return self->_heldAsideGroupIdentifiers;
}

- (void)setHeldAsideGroupIdentifiers:(id)a3
{
}

- (NSCountedSet)heldAsideContexts
{
  return self->_heldAsideContexts;
}

- (void)setHeldAsideContexts:(id)a3
{
}

- (NSMapTable)contextToPowerAssertionRef
{
  return self->_contextToPowerAssertionRef;
}

- (void)setContextToPowerAssertionRef:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextToPowerAssertionRef, 0);
  objc_storeStrong((id *)&self->_heldAsideContexts, 0);
  objc_storeStrong((id *)&self->_heldAsideGroupIdentifiers, 0);
  objc_storeStrong((id *)&self->_contextToGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifierToContexts, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
}

@end