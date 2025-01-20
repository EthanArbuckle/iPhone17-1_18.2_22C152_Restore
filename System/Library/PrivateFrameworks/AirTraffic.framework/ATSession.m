@interface ATSession
+ (BOOL)supportsSecureCoding;
+ (id)_remoteSessionsWithTypeIdentifier:(id)a3;
+ (id)allSessions;
+ (id)sessionsWithSessionTypeIdentifier:(id)a3;
+ (id)sessionsWithSessionTypeIdentifier:(id)a3 dataClass:(id)a4;
+ (unint64_t)_remoteActiveSessionCountWithTypeIdentifier:(id)a3;
+ (unint64_t)activeSessionCountWithSessionTypeIdentifier:(id)a3;
+ (void)_cancelSessionWithIdentifier:(id)a3;
+ (void)initialize;
+ (void)setSessionHost:(BOOL)a3;
- (ATMessageLink)messageLink;
- (ATSession)init;
- (ATSession)initWithCoder:(id)a3;
- (ATSession)initWithSessionIdentifier:(id)a3 sessionTypeIdentifier:(id)a4;
- (ATSession)initWithSessionTypeIdentifier:(id)a3;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)isRunning;
- (BOOL)isSuspended;
- (NSError)error;
- (NSString)dataClass;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)localizedDescription;
- (NSString)sessionIdentifier;
- (NSString)sessionTypeIdentifier;
- (NSXPCListenerEndpoint)endpoint;
- (double)duration;
- (double)progress;
- (id)_keysToObserve;
- (id)sessionTasks;
- (id)sessionTasksWithGroupingKey:(id)a3;
- (void)_beginTasks:(id)a3;
- (void)_finishWithError:(id)a3;
- (void)_observeKeysForTask:(id)a3;
- (void)_performSelectorOnObservers:(SEL)a3 object:(id)a4;
- (void)_performSelectorOnObservers:(SEL)a3 object:(id)a4 object:(id)a5;
- (void)_stopObservingKeysForTask:(id)a3;
- (void)addObserver:(id)a3;
- (void)addSessionTasks:(id)a3;
- (void)beginSessionTask:(id)a3;
- (void)cancel;
- (void)encodeWithCoder:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setDataClass:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setError:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setMessageLink:(id)a3;
- (void)setProgress:(double)a3;
- (void)setRunning:(BOOL)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSessionTypeIdentifier:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)start;
- (void)updateSessionTask:(id)a3;
- (void)waitToFinish;
@end

@implementation ATSession

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messageLink);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dataClass, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observing, 0);
  objc_storeStrong((id *)&self->_sessionTasksByIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionTasks, 0);
}

- (void)setMessageLink:(id)a3
{
}

- (ATMessageLink)messageLink
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageLink);
  return (ATMessageLink *)WeakRetained;
}

- (void)setEndpoint:(id)a3
{
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setDataClass:(id)a3
{
}

- (NSString)dataClass
{
  return self->_dataClass;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionTypeIdentifier:(id)a3
{
}

- (NSString)sessionTypeIdentifier
{
  return self->_sessionTypeIdentifier;
}

- (void)_finishWithError:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_2164B1000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Finishing.", (uint8_t *)&v7, 0xCu);
  }

  [(ATSession *)self setFinished:1];
  [(ATSession *)self setRunning:0];
  [(ATSession *)self setError:v4];
  self->_finishTime = CFAbsoluteTimeGetCurrent();
  if (__sessionHost)
  {
    id v6 = (id)__allSessionsList;
    objc_sync_enter(v6);
    [(id)__allSessionsList removeObject:self];
    objc_sync_exit(v6);
  }
  [(ATSession *)self _performSelectorOnObservers:sel_sessionDidFinish_ object:self];
  dispatch_group_leave((dispatch_group_t)self->_group);
}

- (void)_performSelectorOnObservers:(SEL)a3 object:(id)a4 object:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v16 = a4;
  id v8 = a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v9 = self->_observers;
  uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector())
        {
          callbackQueue = self->_callbackQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __55__ATSession__performSelectorOnObservers_object_object___block_invoke;
          block[3] = &unk_264280F48;
          block[4] = v14;
          SEL v20 = a3;
          id v18 = v16;
          id v19 = v8;
          dispatch_async(callbackQueue, block);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }
}

uint64_t __55__ATSession__performSelectorOnObservers_object_object___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 56) withObject:*(void *)(a1 + 40) withObject:*(void *)(a1 + 48)];
}

- (void)_performSelectorOnObservers:(SEL)a3 object:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v7 = self->_observers;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector())
        {
          callbackQueue = self->_callbackQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __48__ATSession__performSelectorOnObservers_object___block_invoke;
          block[3] = &unk_264280F20;
          block[4] = v12;
          SEL v16 = a3;
          id v15 = v6;
          dispatch_async(callbackQueue, block);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

uint64_t __48__ATSession__performSelectorOnObservers_object___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 48) withObject:*(void *)(a1 + 40)];
}

- (void)_beginTasks:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v14;
    *(void *)&long long v5 = 138543618;
    long long v11 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        -[ATSession _performSelectorOnObservers:object:object:](self, "_performSelectorOnObservers:object:object:", sel_session_willBeginSessionTask_, self, v9, v11);
        uint64_t v10 = os_log_create("com.apple.amp.AirTraffic", "Framework");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v11;
          long long v18 = self;
          __int16 v19 = 2114;
          long long v20 = v9;
          _os_log_impl(&dword_2164B1000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting %{public}@", buf, 0x16u);
        }

        [v9 _start];
        [(ATSession *)self _performSelectorOnObservers:sel_session_didBeginSessionTask_ object:self object:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)_stopObservingKeysForTask:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NSMutableSet *)self->_observing containsObject:v4])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v5 = [(ATSession *)self _keysToObserve];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [v4 removeObserver:self forKeyPath:*(void *)(*((void *)&v10 + 1) + 8 * v9++) context:0];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(NSMutableSet *)self->_observing removeObject:v4];
  }
}

- (void)_observeKeysForTask:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSMutableSet *)self->_observing addObject:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v5 = [(ATSession *)self _keysToObserve];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addObserver:self forKeyPath:*(void *)(*((void *)&v10 + 1) + 8 * v9++) options:1 context:0];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_keysToObserve
{
  return &unk_26C7137E8;
}

- (void)updateSessionTask:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__ATSession_updateSessionTask___block_invoke;
  v7[3] = &unk_2642813C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __31__ATSession_updateSessionTask___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v3 = [*(id *)(a1 + 40) sessionTaskIdentifier];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v5 = [*(id *)(a1 + 32) _keysToObserve];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (!v6) {
      goto LABEL_25;
    }
    uint64_t v7 = v6;
    uint64_t v26 = *(void *)v28;
    uint64_t v25 = *MEMORY[0x263F081B8];
    id obj = v5;
    uint64_t v24 = *MEMORY[0x263F081C8];
    while (1)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v28 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v27 + 1) + 8 * v8);
        long long v10 = [*(id *)(a1 + 40) valueForKey:v9];
        uint64_t v11 = [v4 valueForKey:v9];
        long long v12 = (void *)v11;
        if (v10)
        {
          if ([v10 isEqual:v11]) {
            goto LABEL_17;
          }
        }
        else if (!v11)
        {
          goto LABEL_17;
        }
        [v4 setValue:v10 forKey:v9];
        long long v13 = *(void **)(a1 + 32);
        uint64_t v14 = *(void *)(a1 + 40);
        uint64_t v15 = v10;
        v31[0] = v25;
        if (!v10)
        {
          uint64_t v22 = [MEMORY[0x263EFF9D0] null];
          uint64_t v15 = v22;
        }
        v32[0] = v15;
        v31[1] = v24;
        long long v16 = v12;
        if (!v12)
        {
          long long v21 = [MEMORY[0x263EFF9D0] null];
          long long v16 = v21;
        }
        v32[1] = v16;
        long long v17 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2, v21);
        [v13 observeValueForKeyPath:v9 ofObject:v14 change:v17 context:0];

        if (v12)
        {
          if (v10) {
            goto LABEL_17;
          }
        }
        else
        {

          if (v10) {
            goto LABEL_17;
          }
        }

LABEL_17:
        ++v8;
      }
      while (v7 != v8);
      long long v5 = obj;
      uint64_t v18 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
      uint64_t v7 = v18;
      if (!v18) {
        goto LABEL_25;
      }
    }
  }
  long long v5 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    long long v20 = [*(id *)(a1 + 40) sessionTaskIdentifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v35 = v19;
    __int16 v36 = 2114;
    v37 = v20;
    _os_log_impl(&dword_2164B1000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Cannot update unknown session task with identifier %{public}@", buf, 0x16u);
  }
LABEL_25:
}

- (void)beginSessionTask:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__ATSession_beginSessionTask___block_invoke;
  v7[3] = &unk_2642813C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __30__ATSession_beginSessionTask___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v3 = [*(id *)(a1 + 40) sessionTaskIdentifier];
  id v6 = [v2 objectForKeyedSubscript:v3];

  if (!v6)
  {
    id v6 = *(id *)(a1 + 40);
    [*(id *)(*(void *)(a1 + 32) + 8) addObject:v6];
    id v4 = *(void **)(*(void *)(a1 + 32) + 16);
    long long v5 = [v6 sessionTaskIdentifier];
    [v4 setObject:v6 forKeyedSubscript:v5];

    [v6 setSession:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 32) _performSelectorOnObservers:sel_session_willBeginSessionTask_ object:*(void *)(a1 + 32) object:v6];
  [v6 setRunning:1];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  queue = self->_queue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __60__ATSession_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v16[3] = &unk_264280EF8;
  v16[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v19 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(queue, v16);
}

void __60__ATSession_observeValueForKeyPath_ofObject_change_context___block_invoke(id *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = (void *)*((void *)a1[4] + 2);
  v3 = [a1[5] sessionTaskIdentifier];
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    if ([a1[6] isEqualToString:@"finished"]
      && ([a1[7] objectForKey:*MEMORY[0x263F081B8]],
          long long v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 BOOLValue],
          v5,
          v6))
    {
      [a1[5] finishTime];
      if (v7 <= 0.0) {
        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      }
      else {
        [a1[5] finishTime];
      }
      objc_msgSend(a1[5], "setFinishTime:");
      id v10 = os_log_create("com.apple.amp.AirTraffic", "Framework");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = a1[4];
        id v11 = a1[5];
        [v11 duration];
        int v18 = 138543874;
        id v19 = v12;
        __int16 v20 = 2114;
        id v21 = v11;
        __int16 v22 = 2048;
        uint64_t v23 = v13;
        _os_log_impl(&dword_2164B1000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished task %{public}@ in %.2f seconds", (uint8_t *)&v18, 0x20u);
      }

      id v14 = (void *)*((void *)a1[4] + 2);
      id v15 = [a1[5] sessionTaskIdentifier];
      [v14 removeObjectForKey:v15];

      [a1[4] _performSelectorOnObservers:sel_session_didFinishSessionTask_ object:a1[4] object:a1[5]];
      [a1[4] _stopObservingKeysForTask:a1[5]];
      [a1[5] setRunning:0];
      if (![*((id *)a1[4] + 2) count])
      {
        id v16 = a1[4];
        if ([v16 isCancelled])
        {
          id v17 = [MEMORY[0x263F087E8] errorWithDomain:@"ATError" code:2 userInfo:0];
          [v16 _finishWithError:v17];
        }
        else
        {
          [v16 _finishWithError:0];
        }
      }
    }
    else
    {
      id v8 = a1[4];
      id v9 = a1[5];
      [v8 _performSelectorOnObservers:sel_session_didUpdateSessionTask_ object:v8 object:v9];
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v5 = [(ATSession *)self sessionIdentifier];
  [v4 encodeObject:v5 forKey:@"sessionIdentifier"];

  int v6 = [(ATSession *)self sessionTypeIdentifier];
  [v4 encodeObject:v6 forKey:@"sessionTypeIdentifier"];

  double v7 = [(ATSession *)self localizedDescription];
  [v4 encodeObject:v7 forKey:@"localizedDescription"];

  id v8 = [(ATSession *)self dataClass];
  [v4 encodeObject:v8 forKey:@"dataClass"];

  id v9 = [(ATSession *)self error];
  id v10 = objc_msgSend(v9, "msv_errorByRemovingUnsafeUserInfo");
  [v4 encodeObject:v10 forKey:@"error"];

  [(ATSession *)self progress];
  objc_msgSend(v4, "encodeDouble:forKey:", @"progress");
  objc_msgSend(v4, "encodeBool:forKey:", -[ATSession isRunning](self, "isRunning"), @"running");
  objc_msgSend(v4, "encodeBool:forKey:", -[ATSession isFinished](self, "isFinished"), @"finished");
  objc_msgSend(v4, "encodeBool:forKey:", -[ATSession isCancelled](self, "isCancelled"), @"cancelled");
  id v11 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = [(ATSession *)self sessionTasks];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v19 + 1) + 8 * v16) baseClassRepresentation];
        [v11 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  [v4 encodeObject:v11 forKey:@"sessionTasks"];
  int v18 = [(ATSession *)self endpoint];
  [v4 encodeObject:v18 forKey:@"endpoint"];
}

- (ATSession)initWithCoder:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v5 = [(ATSession *)self initWithSessionTypeIdentifier:0];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionIdentifier"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionTypeIdentifier"];
    sessionTypeIdentifier = v5->_sessionTypeIdentifier;
    v5->_sessionTypeIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataClass"];
    dataClass = v5->_dataClass;
    v5->_dataClass = (NSString *)v10;

    id v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"sessionTasks"];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          [(NSMutableArray *)v5->_sessionTasks addObject:v21];
          if (([v21 isFinished] & 1) == 0)
          {
            sessionTasksByIdentifier = v5->_sessionTasksByIdentifier;
            uint64_t v23 = [v21 sessionTaskIdentifier];
            [(NSMutableDictionary *)sessionTasksByIdentifier setObject:v21 forKeyedSubscript:v23];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v18);
    }

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescription"];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v24;

    [v4 decodeDoubleForKey:@"progress"];
    v5->_progress = v26;
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v27;

    v5->_running = [v4 decodeBoolForKey:@"running"];
    v5->_cancelled = [v4 decodeBoolForKey:@"cancelled"];
    v5->_finished = [v4 decodeBoolForKey:@"finished"];
    dispatch_group_enter((dispatch_group_t)v5->_group);
    long long v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpoint"];
    if (v29)
    {
      uint64_t v30 = [objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v29];
      connection = v5->_connection;
      v5->_connection = (NSXPCConnection *)v30;

      [(NSXPCConnection *)v5->_connection setExportedObject:v5];
      v32 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C715518];
      [(NSXPCConnection *)v5->_connection setExportedInterface:v32];

      v33 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C719C98];
      [(NSXPCConnection *)v5->_connection setRemoteObjectInterface:v33];

      [(NSXPCConnection *)v5->_connection resume];
    }
  }
  return v5;
}

- (NSString)debugDescription
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = [(ATSession *)self description];
  long long v5 = (void *)[v3 initWithString:v4];

  [v5 appendString:@"\n"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(ATSession *)self sessionTasks];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v5 appendString:@"  "];
        id v12 = [v11 debugDescription];
        [v5 appendString:v12];

        [v5 appendString:@"\n"];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return (NSString *)v5;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  long long v5 = [(ATSession *)self sessionIdentifier];
  uint64_t v6 = [(ATSession *)self sessionTypeIdentifier];
  uint64_t v7 = [(ATSession *)self dataClass];
  uint64_t v8 = [v3 stringWithFormat:@"<%@ %@ %@/%@: running=%d finished=%d cancelled=%d>", v4, v5, v6, v7, -[ATSession isRunning](self, "isRunning"), -[ATSession isFinished](self, "isFinished"), -[ATSession isCancelled](self, "isCancelled")];

  return (NSString *)v8;
}

- (double)duration
{
  if ([(ATSession *)self isFinished]) {
    double finishTime = self->_finishTime;
  }
  else {
    double finishTime = CFAbsoluteTimeGetCurrent();
  }
  return finishTime - self->_startTime;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__ATSession_removeObserver___block_invoke;
  v7[3] = &unk_2642813C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __28__ATSession_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __25__ATSession_addObserver___block_invoke;
  v7[3] = &unk_2642813C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __25__ATSession_addObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
  v2 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v2)
  {
    id v3 = [v2 remoteObjectProxy];
    [v3 connect];
  }
}

- (id)sessionTasksWithGroupingKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__277;
  long long v16 = __Block_byref_object_dispose__278;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__ATSession_sessionTasksWithGroupingKey___block_invoke;
  block[3] = &unk_2642812B0;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __41__ATSession_sessionTasksWithGroupingKey___block_invoke(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(a1[4] + 8), "count"));
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *(id *)(a1[4] + 8);
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
        id v11 = objc_msgSend(v10, "sessionGroupingKey", (void)v13);
        int v12 = [v11 isEqualToString:a1[5]];

        if (v12) {
          [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (id)sessionTasks
{
  uint64_t v2 = (void *)[(NSMutableArray *)self->_sessionTasks copy];
  return v2;
}

- (void)waitToFinish
{
}

- (void)addSessionTasks:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__ATSession_addSessionTasks___block_invoke;
  v7[3] = &unk_2642813C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __29__ATSession_addSessionTasks___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 89) || *(unsigned char *)(v2 + 91))
  {
    uint64_t v3 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v4;
      _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Can't add tasks to a completed session - ignoring", buf, 0xCu);
    }
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          [*(id *)(a1 + 32) _observeKeysForTask:v10];
          id v11 = *(void **)(*(void *)(a1 + 32) + 16);
          int v12 = [v10 sessionTaskIdentifier];
          [v11 setObject:v10 forKeyedSubscript:v12];

          [*(id *)(*(void *)(a1 + 32) + 8) addObject:v10];
          [v10 setSession:*(void *)(a1 + 32)];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v7);
    }

    uint64_t v13 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v13 + 90) && !*(unsigned char *)(v13 + 88))
    {
      long long v14 = *(NSObject **)(v13 + 40);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __29__ATSession_addSessionTasks___block_invoke_2;
      v15[3] = &unk_2642813C8;
      v15[4] = v13;
      id v16 = *(id *)(a1 + 40);
      dispatch_async(v14, v15);
    }
  }
}

uint64_t __29__ATSession_addSessionTasks___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginTasks:*(void *)(a1 + 40)];
}

- (void)setSuspended:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __26__ATSession_setSuspended___block_invoke;
  v4[3] = &unk_264280ED0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

void __26__ATSession_setSuspended___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = *(unsigned char *)(a1 + 40);
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 88);
  uint64_t v3 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v5;
      _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Suspending.", buf, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v6;
      _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Resuming.", buf, 0xCu);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(NSObject **)(v7 + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __26__ATSession_setSuspended___block_invoke_26;
    block[3] = &unk_264281378;
    block[4] = v7;
    dispatch_async(v8, block);
  }
}

void __26__ATSession_setSuspended___block_invoke_26(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263EFF980] array];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isRunning", (void)v9) & 1) == 0
          && ([v8 isFinished] & 1) == 0
          && ([v8 isCancelled] & 1) == 0)
        {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 32) _beginTasks:v2];
}

- (BOOL)isSuspended
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __24__ATSession_isSuspended__block_invoke;
  v5[3] = &unk_2642813F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __24__ATSession_isSuspended__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 88);
  return result;
}

- (void)cancel
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v3 = __sessionHost;
  uint64_t v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = [(ATSession *)self error];
      *(_DWORD *)buf = 138543618;
      long long v11 = self;
      __int16 v12 = 2114;
      uint64_t v13 = v6;
      _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelling. err=%{public}@", buf, 0x16u);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __19__ATSession_cancel__block_invoke;
    block[3] = &unk_264281378;
    block[4] = self;
    dispatch_async(queue, block);
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      long long v11 = self;
      _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelling remote session.", buf, 0xCu);
    }

    uint64_t v8 = [(ATSession *)self sessionIdentifier];
    +[ATSession _cancelSessionWithIdentifier:v8];
  }
}

void __19__ATSession_cancel__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned char **)(a1 + 32);
  if (!v2[91])
  {
    [v2 setCancelled:1];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v3 = *(id *)(*(void *)(a1 + 32) + 8);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)v14;
      *(void *)&long long v5 = 138543618;
      long long v12 = v5;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v3);
          }
          char v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v9, "isFinished", v12, (void)v13) & 1) == 0 && (objc_msgSend(v9, "isCancelled") & 1) == 0)
          {
            long long v10 = os_log_create("com.apple.amp.AirTraffic", "Framework");
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v11 = *(void *)(a1 + 32);
              *(_DWORD *)buf = v12;
              uint64_t v18 = v11;
              __int16 v19 = 2114;
              long long v20 = v9;
              _os_log_impl(&dword_2164B1000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelling %{public}@", buf, 0x16u);
            }

            [v9 cancel];
          }
        }
        uint64_t v6 = [v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v6);
    }
  }
}

- (void)start
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v7 = self;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting.", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __18__ATSession_start__block_invoke;
  block[3] = &unk_264281378;
  block[4] = self;
  dispatch_async(queue, block);
}

unsigned char *__18__ATSession_start__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[90])
  {
    [result setRunning:1];
    *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 72) = CFAbsoluteTimeGetCurrent();
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 56));
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) count];
    uint64_t v4 = *(void **)(a1 + 32);
    if (v3)
    {
      [v4 _performSelectorOnObservers:sel_sessionWillBegin_ object:*(void *)(a1 + 32)];
      long long v5 = *(void **)(a1 + 32);
      uint64_t v6 = v5[1];
      return (unsigned char *)[v5 _beginTasks:v6];
    }
    else
    {
      return (unsigned char *)[v4 _finishWithError:0];
    }
  }
  return result;
}

- (ATSession)initWithSessionTypeIdentifier:(id)a3
{
  return [(ATSession *)self initWithSessionIdentifier:0 sessionTypeIdentifier:a3];
}

- (ATSession)initWithSessionIdentifier:(id)a3 sessionTypeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)ATSession;
  uint64_t v8 = [(ATSession *)&v31 init];
  if (v8)
  {
    if (v6)
    {
      uint64_t v9 = [v6 copy];
      sessionIdentifier = v8->_sessionIdentifier;
      v8->_sessionIdentifier = (NSString *)v9;
    }
    else
    {
      sessionIdentifier = [MEMORY[0x263F08C38] UUID];
      uint64_t v11 = [sessionIdentifier UUIDString];
      long long v12 = v8->_sessionIdentifier;
      v8->_sessionIdentifier = (NSString *)v11;
    }
    uint64_t v13 = [v7 copy];
    sessionTypeIdentifier = v8->_sessionTypeIdentifier;
    v8->_sessionTypeIdentifier = (NSString *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    sessionTasksByIdentifier = v8->_sessionTasksByIdentifier;
    v8->_sessionTasksByIdentifier = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x263EFF980] array];
    sessionTasks = v8->_sessionTasks;
    v8->_sessionTasks = (NSMutableArray *)v17;

    uint64_t v19 = [MEMORY[0x263EFF9C0] set];
    observing = v8->_observing;
    v8->_observing = (NSMutableSet *)v19;

    uint64_t v21 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v21;

    dispatch_queue_t v23 = dispatch_queue_create("com.apple.AirTraffic.ATSession.accessQueue", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v23;

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.AirTraffic.ATSession.callbackQueue", 0);
    callbackQueue = v8->_callbackQueue;
    v8->_callbackQueue = (OS_dispatch_queue *)v25;

    dispatch_group_t v27 = dispatch_group_create();
    group = v8->_group;
    v8->_group = (OS_dispatch_group *)v27;

    if (__sessionHost)
    {
      id v29 = (id)__allSessionsList;
      objc_sync_enter(v29);
      [(id)__allSessionsList addObject:v8];
      objc_sync_exit(v29);
    }
  }

  return v8;
}

- (ATSession)init
{
  v4.receiver = self;
  v4.super_class = (Class)ATSession;
  [(ATSession *)&v4 doesNotRecognizeSelector:a2];

  return 0;
}

+ (unint64_t)_remoteActiveSessionCountWithTypeIdentifier:(id)a3
{
  id v3 = a3;
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.atc.xpc.sessions" options:0];
  long long v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C719D68];
  [v4 setRemoteObjectInterface:v5];
  uint64_t v26 = 0;
  dispatch_group_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __57__ATSession__remoteActiveSessionCountWithTypeIdentifier___block_invoke;
  v25[3] = &unk_264280F70;
  v25[4] = &v26;
  [v4 setInvalidationHandler:v25];
  [v4 resume];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __57__ATSession__remoteActiveSessionCountWithTypeIdentifier___block_invoke_2;
  v18[3] = &unk_264281038;
  id v7 = v3;
  id v19 = v7;
  uint64_t v8 = v6;
  long long v20 = v8;
  uint64_t v9 = [v4 remoteObjectProxyWithErrorHandler:v18];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__ATSession__remoteActiveSessionCountWithTypeIdentifier___block_invoke_174;
  v15[3] = &unk_264280F98;
  uint64_t v17 = &v21;
  long long v10 = v8;
  long long v16 = v10;
  [v9 fetchActiveSessionCountForSessionTypeIdentifier:v7 completion:v15];

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (*((unsigned char *)v27 + 24))
  {
    [v4 invalidate];
    uint64_t v11 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      _os_log_impl(&dword_2164B1000, v11, OS_LOG_TYPE_DEFAULT, "XPC Connection was still valid - invalidating", (uint8_t *)&v14, 2u);
    }
  }
  unint64_t v12 = v22[3];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

uint64_t __57__ATSession__remoteActiveSessionCountWithTypeIdentifier___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

void __57__ATSession__remoteActiveSessionCountWithTypeIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_super v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch count of active sessions of type %{public}@ error:%{public}@", (uint8_t *)&v6, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __57__ATSession__remoteActiveSessionCountWithTypeIdentifier___block_invoke_174(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)_cancelSessionWithIdentifier:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.atc.xpc.sessions" options:0];
  uint64_t v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C719D68];
  int v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  __int16 v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v5 setClasses:v8 forSelector:sel_fetchSessionsWithTypeIdentifier_completion_ argumentIndex:0 ofReply:1];

  [v4 setRemoteObjectInterface:v5];
  [v4 resume];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __42__ATSession__cancelSessionWithIdentifier___block_invoke;
  v19[3] = &unk_264280F70;
  v19[4] = &v20;
  [v4 setInvalidationHandler:v19];
  id v9 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = v3;
    _os_log_impl(&dword_2164B1000, v9, OS_LOG_TYPE_DEFAULT, "cancelling session. id=%{public}@", buf, 0xCu);
  }

  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __42__ATSession__cancelSessionWithIdentifier___block_invoke_172;
  v17[3] = &unk_264281158;
  uint64_t v11 = v10;
  uint64_t v18 = v11;
  unint64_t v12 = [v4 remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __42__ATSession__cancelSessionWithIdentifier___block_invoke_173;
  v15[3] = &unk_264281158;
  uint64_t v13 = v11;
  long long v16 = v13;
  [v12 cancelSessionWithIdentifier:v3 completion:v15];

  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  if (*((unsigned char *)v21 + 24))
  {
    [v4 invalidate];
    __int16 v14 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2164B1000, v14, OS_LOG_TYPE_DEFAULT, "XPC Connection was still valid - invalidating", buf, 2u);
    }
  }
  _Block_object_dispose(&v20, 8);
}

uint64_t __42__ATSession__cancelSessionWithIdentifier___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

void __42__ATSession__cancelSessionWithIdentifier___block_invoke_172(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_super v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_ERROR, "Failed to cancel session. error=%{public}@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __42__ATSession__cancelSessionWithIdentifier___block_invoke_173(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    objc_super v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_ERROR, "Failed to cancel session. error=%{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)_remoteSessionsWithTypeIdentifier:(id)a3
{
  id v3 = a3;
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.atc.xpc.sessions" options:0];
  int v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C719D68];
  id v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  __int16 v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v5 setClasses:v8 forSelector:sel_fetchSessionsWithTypeIdentifier_completion_ argumentIndex:0 ofReply:1];

  [v4 setRemoteObjectInterface:v5];
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __47__ATSession__remoteSessionsWithTypeIdentifier___block_invoke;
  v28[3] = &unk_264280F70;
  v28[4] = &v29;
  [v4 setInvalidationHandler:v28];
  [v4 resume];
  uint64_t v22 = 0;
  char v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__277;
  uint64_t v26 = __Block_byref_object_dispose__278;
  id v27 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __47__ATSession__remoteSessionsWithTypeIdentifier___block_invoke_2;
  v20[3] = &unk_264281158;
  dispatch_semaphore_t v10 = v9;
  uint64_t v21 = v10;
  uint64_t v11 = [v4 remoteObjectProxyWithErrorHandler:v20];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __47__ATSession__remoteSessionsWithTypeIdentifier___block_invoke_170;
  v17[3] = &unk_264280FC0;
  id v19 = &v22;
  unint64_t v12 = v10;
  uint64_t v18 = v12;
  [v11 fetchSessionsWithTypeIdentifier:v3 completion:v17];

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  if (*((unsigned char *)v30 + 24))
  {
    [v4 invalidate];
    uint64_t v13 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2164B1000, v13, OS_LOG_TYPE_DEFAULT, "XPC Connection was still valid - invalidating", buf, 2u);
    }
  }
  id v14 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

uint64_t __47__ATSession__remoteSessionsWithTypeIdentifier___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

void __47__ATSession__remoteSessionsWithTypeIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_super v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch sessions: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __47__ATSession__remoteSessionsWithTypeIdentifier___block_invoke_170(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    __int16 v8 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl(&dword_2164B1000, v8, OS_LOG_TYPE_DEFAULT, "Failed to fetch sessions: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)activeSessionCountWithSessionTypeIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__sessionHost)
  {
    id v5 = (id)__allSessionsList;
    objc_sync_enter(v5);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = (id)__allSessionsList;
    unint64_t v7 = 0;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          unint64_t v12 = objc_msgSend(v11, "sessionTypeIdentifier", (void)v16);
          int v13 = [v12 isEqualToString:v4];

          if (v13 && ([v11 isCancelled] & 1) == 0) {
            v7 += [v11 isFinished] ^ 1;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v8);
    }

    objc_sync_exit(v5);
  }
  else
  {
    unint64_t v7 = [a1 _remoteActiveSessionCountWithTypeIdentifier:v4];
  }
  id v14 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v21 = v7;
    __int16 v22 = 2114;
    id v23 = v4;
    _os_log_impl(&dword_2164B1000, v14, OS_LOG_TYPE_DEFAULT, "Found %lu active sessions for identifier %{public}@", buf, 0x16u);
  }

  return v7;
}

+ (id)sessionsWithSessionTypeIdentifier:(id)a3 dataClass:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = objc_opt_new();
  uint64_t v8 = +[ATSession sessionsWithSessionTypeIdentifier:v5];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (v6)
        {
          id v14 = [*(id *)(*((void *)&v17 + 1) + 8 * i) dataClass];
          int v15 = [v14 isEqualToString:v6];

          if (!v15) {
            continue;
          }
        }
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)sessionsWithSessionTypeIdentifier:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  if (__sessionHost)
  {
    id v6 = (id)__allSessionsList;
    objc_sync_enter(v6);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = (id)__allSessionsList;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          unint64_t v12 = objc_msgSend(v11, "sessionTypeIdentifier", (void)v20);
          int v13 = [v12 isEqualToString:v4];

          if (v13) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v8);
    }

    objc_sync_exit(v6);
  }
  else
  {
    id v14 = [a1 _remoteSessionsWithTypeIdentifier:v4];
    uint64_t v15 = [v14 copy];

    id v5 = (void *)v15;
  }
  long long v16 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v5 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v25 = v17;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_2164B1000, v16, OS_LOG_TYPE_DEFAULT, "Found %lu sessions for identifier %{public}@", buf, 0x16u);
  }

  long long v18 = os_log_create("com.apple.amp.AirTraffic", "Framework_Oversize");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = (uint64_t)v5;
    _os_log_impl(&dword_2164B1000, v18, OS_LOG_TYPE_DEFAULT, "sessions %{public}@:", buf, 0xCu);
  }

  return v5;
}

+ (id)allSessions
{
  if (__sessionHost)
  {
    id v2 = (id)__allSessionsList;
    objc_sync_enter(v2);
    id v3 = (id)__allSessionsList;
    objc_sync_exit(v2);
  }
  else
  {
    id v3 = [a1 _remoteSessionsWithTypeIdentifier:0];
  }
  return v3;
}

+ (void)setSessionHost:(BOOL)a3
{
  __sessionHost = a3;
}

+ (void)initialize
{
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  id v3 = (void *)__allSessionsList;
  __allSessionsList = v2;

  id v4 = (const char *)[@"ATSessionsDidChangeNotification" UTF8String];
  id v5 = dispatch_get_global_queue(0, 0);
  notify_register_dispatch(v4, &__dispatchToken, v5, &__block_literal_global_306);
}

void __23__ATSession_initialize__block_invoke()
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, @"ATSessionsDidChangeNotification", 0, 0, 1u);
}

@end