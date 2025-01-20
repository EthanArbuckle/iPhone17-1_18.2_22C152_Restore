@interface FMAPSHandler
+ (id)constantForEnvironmentString:(id)a3;
- (APSConnection)apsConnection;
- (BOOL)registerForDarkWake;
- (BOOL)registrationsSuspended;
- (FMAPSHandler)init;
- (FMAPSHandler)initWithEnvironmentName:(id)a3;
- (FMAPSHandler)initWithEnvironmentName:(id)a3 launchOnDemandPort:(id)a4;
- (NSMutableArray)pendingPushes;
- (NSMutableArray)registeredDelegates;
- (NSString)apsToken;
- (NSString)environmentName;
- (void)_handleMessage:(id)a3 onTopic:(id)a4;
- (void)_registrationsWereResumed;
- (void)_setEnabledTopics:(id)a3;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)deregisterDelegate:(id)a3;
- (void)invalidate;
- (void)registerDelegate:(id)a3 forTopic:(id)a4;
- (void)resumeRegistrations;
- (void)setApsConnection:(id)a3;
- (void)setEnvironmentName:(id)a3;
- (void)setPendingPushes:(id)a3;
- (void)setRegisterForDarkWake:(BOOL)a3;
- (void)setRegisteredDelegates:(id)a3;
- (void)setRegistrationsSuspended:(BOOL)a3;
- (void)suspendRegistrations;
@end

@implementation FMAPSHandler

+ (id)constantForEnvironmentString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 compare:@"production" options:1];
  v5 = (id *)MEMORY[0x1E4F4E1D0];
  if (v4)
  {
    if ([v3 compare:@"development" options:1])
    {
      if (![v3 compare:@"demo" options:1]) {
        v5 = (id *)MEMORY[0x1E4F4E1C0];
      }
    }
    else
    {
      v5 = (id *)MEMORY[0x1E4F4E1C8];
    }
  }
  id v6 = *v5;

  return v6;
}

- (FMAPSHandler)init
{
  return [(FMAPSHandler *)self initWithEnvironmentName:*MEMORY[0x1E4F4E1D0] launchOnDemandPort:0];
}

- (FMAPSHandler)initWithEnvironmentName:(id)a3
{
  return [(FMAPSHandler *)self initWithEnvironmentName:a3 launchOnDemandPort:0];
}

- (FMAPSHandler)initWithEnvironmentName:(id)a3 launchOnDemandPort:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)FMAPSHandler;
  v8 = [(FMAPSHandler *)&v17 init];
  v9 = v8;
  if (v8)
  {
    [(FMAPSHandler *)v8 setEnvironmentName:v6];
    id v10 = objc_alloc(MEMORY[0x1E4F4E1E8]);
    if (v7) {
      uint64_t v11 = [v10 initWithEnvironmentName:v6 namedDelegatePort:v7 queue:MEMORY[0x1E4F14428]];
    }
    else {
      uint64_t v11 = [v10 initWithEnvironmentName:v6 queue:MEMORY[0x1E4F14428]];
    }
    v12 = (void *)v11;
    [(FMAPSHandler *)v9 setApsConnection:v11];

    v13 = [(FMAPSHandler *)v9 apsConnection];
    [v13 setDelegate:v9];

    v14 = [MEMORY[0x1E4F1CA48] array];
    [(FMAPSHandler *)v9 setRegisteredDelegates:v14];

    v15 = [MEMORY[0x1E4F1CA48] array];
    [(FMAPSHandler *)v9 setPendingPushes:v15];
  }
  return v9;
}

- (void)dealloc
{
  [(FMAPSHandler *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)FMAPSHandler;
  [(FMAPSHandler *)&v3 dealloc];
}

- (void)invalidate
{
  objc_super v3 = [(FMAPSHandler *)self apsConnection];
  [v3 setDelegate:0];

  [(FMAPSHandler *)self _setEnabledTopics:0];
  id v4 = [(FMAPSHandler *)self apsConnection];
  [v4 shutdown];
}

- (void)suspendRegistrations
{
}

- (void)resumeRegistrations
{
  [(FMAPSHandler *)self setRegistrationsSuspended:0];
  [(FMAPSHandler *)self _registrationsWereResumed];
}

- (void)registerDelegate:(id)a3 forTopic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__FMAPSHandler_registerDelegate_forTopic___block_invoke;
  block[3] = &unk_1E689E8E8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __42__FMAPSHandler_registerDelegate_forTopic___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v2 = (id *)(a1 + 32);
  objc_super v3 = [*(id *)(a1 + 32) registeredDelegates];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v41 count:16];
  if (!v4)
  {

LABEL_13:
    id v12 = objc_alloc_init(FMAPSDelegateInfo);
    [(FMAPSDelegateInfo *)v12 setTopic:*(void *)(a1 + 48)];
    [(FMAPSDelegateInfo *)v12 setDelegate:*(void *)(a1 + 40)];
    v13 = [*(id *)(a1 + 32) registeredDelegates];
    [v13 addObject:v12];

    goto LABEL_14;
  }
  uint64_t v5 = v4;
  char v6 = 0;
  uint64_t v7 = *(void *)v31;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v31 != v7) {
        objc_enumerationMutation(v3);
      }
      id v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      id v10 = [v9 delegate];
      id v11 = *(void **)(a1 + 40);

      if (v10 == v11)
      {
        [v9 setTopic:*(void *)(a1 + 48)];
        char v6 = 1;
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v30 objects:v41 count:16];
  }
  while (v5);

  if ((v6 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_14:
  if ([*v2 registrationsSuspended])
  {
    v14 = LogCategory_APS();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __42__FMAPSHandler_registerDelegate_forTopic___block_invoke_cold_1(a1, v2);
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F1CA80] set];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v15 = objc_msgSend(*v2, "registeredDelegates", 0);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v40 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v26 + 1) + 8 * j) topic];
          [v14 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v40 count:16];
      }
      while (v17);
    }

    v21 = LogCategory_APS();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = *(void *)(a1 + 48);
      v25 = [*(id *)(a1 + 32) environmentName];
      *(_DWORD *)buf = 138412802;
      uint64_t v35 = v24;
      __int16 v36 = 2112;
      v37 = v25;
      __int16 v38 = 2112;
      v39 = v14;
      _os_log_debug_impl(&dword_1D0EC4000, v21, OS_LOG_TYPE_DEBUG, "Registering for topic %@ in environment %@. Total topics : %@", buf, 0x20u);
    }
    id v22 = *v2;
    v23 = [v14 allObjects];
    [v22 _setEnabledTopics:v23];
  }
}

- (void)deregisterDelegate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__FMAPSHandler_deregisterDelegate___block_invoke;
  v6[3] = &unk_1E689E690;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __35__FMAPSHandler_deregisterDelegate___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  objc_super v3 = LogCategory_APS();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __35__FMAPSHandler_deregisterDelegate___block_invoke_cold_2(a1);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = [*(id *)(a1 + 40) registeredDelegates];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v10 = [v9 delegate];
        id v11 = *(void **)(a1 + 32);

        if (v10 != v11) {
          [v2 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v6);
  }

  id v12 = [*(id *)(a1 + 40) registeredDelegates];
  uint64_t v13 = [v12 count];
  uint64_t v14 = [v2 count];

  if (v13 != v14)
  {
    v15 = [MEMORY[0x1E4F1CA80] set];
    [*(id *)(a1 + 40) setRegisteredDelegates:v2];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v16 = objc_msgSend(*(id *)(a1 + 40), "registeredDelegates", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v25 + 1) + 8 * j) topic];
          [v15 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v18);
    }

    id v22 = LogCategory_APS();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      __35__FMAPSHandler_deregisterDelegate___block_invoke_cold_1((uint64_t)v15, v22);
    }

    v23 = *(void **)(a1 + 40);
    uint64_t v24 = [v15 allObjects];
    [v23 _setEnabledTopics:v24];
  }
}

- (NSString)apsToken
{
  v2 = [(FMAPSHandler *)self apsConnection];
  objc_super v3 = [v2 publicToken];
  id v4 = objc_msgSend(v3, "fm_hexString");

  if ([v4 length]) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5;

  return v6;
}

- (void)_registrationsWereResumed
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__FMAPSHandler__registrationsWereResumed__block_invoke;
  block[3] = &unk_1E689E780;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __41__FMAPSHandler__registrationsWereResumed__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA80] set];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  objc_super v3 = [*(id *)(a1 + 32) registeredDelegates];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v27 + 1) + 8 * i) topic];
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v5);
  }

  id v9 = LogCategory_APS();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __41__FMAPSHandler__registrationsWereResumed__block_invoke_cold_1((uint64_t)v2, v9);
  }

  id v10 = *(void **)(a1 + 32);
  id v22 = v2;
  id v11 = [v2 allObjects];
  [v10 _setEnabledTopics:v11];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = [*(id *)(a1 + 32) pendingPushes];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        uint64_t v18 = [v17 objectForKeyedSubscript:@"topic"];
        uint64_t v19 = [v17 objectForKeyedSubscript:@"message"];
        v20 = LogCategory_APS();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          long long v32 = v18;
          __int16 v33 = 2112;
          v34 = v19;
          _os_log_debug_impl(&dword_1D0EC4000, v20, OS_LOG_TYPE_DEBUG, "Replaying APS message on topic %@: %@", buf, 0x16u);
        }

        [*(id *)(a1 + 32) _handleMessage:v19 onTopic:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v14);
  }

  v21 = [MEMORY[0x1E4F1CA48] array];
  [*(id *)(a1 + 32) setPendingPushes:v21];
}

- (void)_handleMessage:(id)a3 onTopic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__FMAPSHandler__handleMessage_onTopic___block_invoke;
  block[3] = &unk_1E689E8E8;
  block[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __39__FMAPSHandler__handleMessage_onTopic___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) registrationsSuspended])
  {
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_super v3 = LogCategory_APS();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0EC4000, v3, OS_LOG_TYPE_INFO, "Registrations are suspended. Queueing the APS message for later use", buf, 2u);
    }

    [v2 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"topic"];
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      [v2 setObject:v4 forKeyedSubscript:@"message"];
    }
    uint64_t v5 = [*(id *)(a1 + 32) pendingPushes];
    [v5 addObject:v2];
  }
  else
  {
    id v6 = LogCategory_APS();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [*(id *)(a1 + 32) registeredDelegates];
      *(_DWORD *)buf = 134217984;
      uint64_t v25 = [v7 count];
      _os_log_impl(&dword_1D0EC4000, v6, OS_LOG_TYPE_INFO, "Checking for a handler for the APS message from %lu registered delegates", buf, 0xCu);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v2 = [*(id *)(a1 + 32) registeredDelegates];
    uint64_t v8 = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(void *)v20;
      *(void *)&long long v9 = 138412290;
      long long v18 = v9;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v2);
          }
          uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v13, "topic", v18);
          int v15 = [v14 isEqualToString:*(void *)(a1 + 40)];

          if (v15)
          {
            uint64_t v16 = [v13 delegate];
            uint64_t v17 = LogCategory_APS();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v18;
              uint64_t v25 = (uint64_t)v16;
              _os_log_impl(&dword_1D0EC4000, v17, OS_LOG_TYPE_INFO, "Found delegate with matching topic %@", buf, 0xCu);
            }

            [v16 didReceiveAPSMessage:*(void *)(a1 + 48)];
          }
        }
        uint64_t v10 = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }
  }
}

- (void)_setEnabledTopics:(id)a3
{
  id v4 = a3;
  id v5 = [(FMAPSHandler *)self apsConnection];
  [v5 _setEnabledTopics:v4];
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a4, "fm_hexString", a3);
  id v6 = LogCategory_APS();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [(FMAPSHandler *)self environmentName];
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    int v15 = v7;
    _os_log_impl(&dword_1D0EC4000, v6, OS_LOG_TYPE_INFO, "Received updated APS token %@ for environment %@", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__FMAPSHandler_connection_didReceivePublicToken___block_invoke;
  v9[3] = &unk_1E689E690;
  id v10 = v5;
  uint64_t v11 = self;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __49__FMAPSHandler_connection_didReceivePublicToken___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length])
  {
    v2 = LogCategory_APS();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __49__FMAPSHandler_connection_didReceivePublicToken___block_invoke_cold_1(a1, v2);
    }

    activity_block[0] = MEMORY[0x1E4F143A8];
    activity_block[1] = 3221225472;
    activity_block[2] = __49__FMAPSHandler_connection_didReceivePublicToken___block_invoke_37;
    activity_block[3] = &unk_1E689E690;
    int8x16_t v4 = *(int8x16_t *)(a1 + 32);
    id v3 = (id)v4.i64[0];
    int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
    _os_activity_initiate(&dword_1D0EC4000, "APS token changed", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

void __49__FMAPSHandler_connection_didReceivePublicToken___block_invoke_37(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "registeredDelegates", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) delegate];
        [v7 didReceiveAPSToken:*(void *)(a1 + 40)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  long long v9 = LogCategory_APS();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_1D0EC4000, v9, OS_LOG_TYPE_INFO, "Received APS message on topic %@: %@", buf, 0x16u);
  }

  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __62__FMAPSHandler_connection_didReceiveMessageForTopic_userInfo___block_invoke;
  activity_block[3] = &unk_1E689E8E8;
  void activity_block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  _os_activity_initiate(&dword_1D0EC4000, "APS message received", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __62__FMAPSHandler_connection_didReceiveMessageForTopic_userInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleMessage:*(void *)(a1 + 40) onTopic:*(void *)(a1 + 48)];
}

- (BOOL)registerForDarkWake
{
  return self->_registerForDarkWake;
}

- (void)setRegisterForDarkWake:(BOOL)a3
{
  self->_registerForDarkWake = a3;
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
}

- (NSMutableArray)registeredDelegates
{
  return self->_registeredDelegates;
}

- (void)setRegisteredDelegates:(id)a3
{
}

- (NSMutableArray)pendingPushes
{
  return self->_pendingPushes;
}

- (void)setPendingPushes:(id)a3
{
}

- (NSString)environmentName
{
  return self->_environmentName;
}

- (void)setEnvironmentName:(id)a3
{
}

- (BOOL)registrationsSuspended
{
  return self->_registrationsSuspended;
}

- (void)setRegistrationsSuspended:(BOOL)a3
{
  self->_registrationsSuspended = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentName, 0);
  objc_storeStrong((id *)&self->_pendingPushes, 0);
  objc_storeStrong((id *)&self->_registeredDelegates, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
}

void __42__FMAPSHandler_registerDelegate_forTopic___block_invoke_cold_1(uint64_t a1, id *a2)
{
  v2 = [*a2 environmentName];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D0EC4000, v3, v4, "Not registering for topic %@ in environment %@ right now because registrations are suspended. Queueing it up.", v5, v6, v7, v8, v9);
}

void __35__FMAPSHandler_deregisterDelegate___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0EC4000, a2, OS_LOG_TYPE_DEBUG, "Updating list of topics after deregister: %@", (uint8_t *)&v2, 0xCu);
}

void __35__FMAPSHandler_deregisterDelegate___block_invoke_cold_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 40) environmentName];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D0EC4000, v2, v3, "Attempting to deregister delegate %@ in environment %@", v4, v5, v6, v7, v8);
}

void __41__FMAPSHandler__registrationsWereResumed__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0EC4000, a2, OS_LOG_TYPE_DEBUG, "Updating list of topics after suspension was removed: %@", (uint8_t *)&v2, 0xCu);
}

void __49__FMAPSHandler_connection_didReceivePublicToken___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 40) registeredDelegates];
  int v4 = 134217984;
  uint64_t v5 = [v3 count];
  _os_log_debug_impl(&dword_1D0EC4000, a2, OS_LOG_TYPE_DEBUG, "Notifying %lu delegates about the updated APS token", (uint8_t *)&v4, 0xCu);
}

@end