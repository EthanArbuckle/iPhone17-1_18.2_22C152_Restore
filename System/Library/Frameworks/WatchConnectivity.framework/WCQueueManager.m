@interface WCQueueManager
- (BOOL)canSend;
- (BOOL)messageOutstanding;
- (NSMutableArray)messageQueue;
- (NSMutableDictionary)inFlightMessages;
- (OS_dispatch_queue)workQueue;
- (WCQueueManager)init;
- (id)onqueue_peekMessage;
- (void)allowMessageSending;
- (void)cancelQueuedMessages;
- (void)handleSentMessageWithIdentifier:(id)a3 error:(id)a4;
- (void)onqueue_allowMessageSending;
- (void)onqueue_attemptToSend;
- (void)onqueue_cancelDaemonMessages;
- (void)onqueue_cancelQueuedMessages;
- (void)onqueue_clearQueuedMessages;
- (void)onqueue_dequeueMessage;
- (void)onqueue_enqueueMessage:(id)a3;
- (void)onqueue_handleAcceptanceWithCurrentAccepted:(BOOL)a3 nextAvailable:(BOOL)a4;
- (void)onqueue_handleFailedDaemonConnectionForQueuedMessage:(id)a3;
- (void)onqueue_handleSentMessageWithIdentifier:(id)a3 error:(id)a4;
- (void)onqueue_sendMessage:(id)a3 completionHandler:(id)a4;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)setCanSend:(BOOL)a3;
- (void)setInFlightMessages:(id)a3;
- (void)setMessageOutstanding:(BOOL)a3;
- (void)setMessageQueue:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation WCQueueManager

- (WCQueueManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)WCQueueManager;
  v2 = [(WCQueueManager *)&v11 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_canSend = 1;
    uint64_t v4 = objc_opt_new();
    messageQueue = v3->_messageQueue;
    v3->_messageQueue = (NSMutableArray *)v4;

    uint64_t v6 = objc_opt_new();
    inFlightMessages = v3->_inFlightMessages;
    v3->_inFlightMessages = (NSMutableDictionary *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.private.watchconnectivity.send-queue.work-queue", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v8;
  }
  return v3;
}

- (void)allowMessageSending
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__WCQueueManager_allowMessageSending__block_invoke;
  block[3] = &unk_26463C168;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __37__WCQueueManager_allowMessageSending__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_allowMessageSending");
}

- (void)onqueue_allowMessageSending
{
  [(WCQueueManager *)self setCanSend:1];

  [(WCQueueManager *)self onqueue_attemptToSend];
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__WCQueueManager_sendMessage_completionHandler___block_invoke;
  block[3] = &unk_26463C758;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

uint64_t __48__WCQueueManager_sendMessage_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_sendMessage:completionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)onqueue_sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_queue_t v8 = [[WCQueuedMessage alloc] initWithMessage:v7 completionHandler:v6];

  [(WCQueueManager *)self onqueue_enqueueMessage:v8];
}

- (void)onqueue_attemptToSend
{
  if ([(WCQueueManager *)self canSend] && ![(WCQueueManager *)self messageOutstanding])
  {
    v3 = [(WCQueueManager *)self onqueue_peekMessage];
    if (v3)
    {
      uint64_t v4 = [(WCQueueManager *)self inFlightMessages];
      v5 = [v3 message];
      id v6 = [v5 identifier];
      [v4 setObject:v3 forKeyedSubscript:v6];

      id v7 = +[WCXPCManager sharedManager];
      dispatch_queue_t v8 = [v3 message];
      id v9 = [v3 message];
      id v10 = [v9 pairingID];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __39__WCQueueManager_onqueue_attemptToSend__block_invoke;
      v13[3] = &unk_26463C7A8;
      v13[4] = self;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __39__WCQueueManager_onqueue_attemptToSend__block_invoke_3;
      v11[3] = &unk_26463C140;
      v11[4] = self;
      id v12 = v3;
      [v7 sendMessage:v8 clientPairingID:v10 acceptanceHandler:v13 errorHandler:v11];

      [(WCQueueManager *)self setMessageOutstanding:1];
    }
  }
}

void __39__WCQueueManager_onqueue_attemptToSend__block_invoke(uint64_t a1, char a2, char a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 24);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__WCQueueManager_onqueue_attemptToSend__block_invoke_2;
  v5[3] = &unk_26463C780;
  v5[4] = v3;
  char v6 = a2;
  char v7 = a3;
  dispatch_async(v4, v5);
}

uint64_t __39__WCQueueManager_onqueue_attemptToSend__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setMessageOutstanding:0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 41);

  return objc_msgSend(v2, "onqueue_handleAcceptanceWithCurrentAccepted:nextAvailable:", v3, v4);
}

void __39__WCQueueManager_onqueue_attemptToSend__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__WCQueueManager_onqueue_attemptToSend__block_invoke_4;
  block[3] = &unk_26463C258;
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __39__WCQueueManager_onqueue_attemptToSend__block_invoke_4(uint64_t a1)
{
  v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __39__WCQueueManager_onqueue_attemptToSend__block_invoke_4_cold_1(a1, v2);
  }

  return objc_msgSend(*(id *)(a1 + 40), "onqueue_handleFailedDaemonConnectionForQueuedMessage:", *(void *)(a1 + 48));
}

- (void)onqueue_handleFailedDaemonConnectionForQueuedMessage:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(WCQueueManager *)self setMessageOutstanding:0];
  if ([v4 retryCount] > 1)
  {
    [(WCQueueManager *)self onqueue_dequeueMessage];
    id v6 = [v4 message];
    char v7 = [v6 identifier];
    id v8 = [MEMORY[0x263F087E8] wcErrorWithCode:7001];
    [(WCQueueManager *)self onqueue_handleSentMessageWithIdentifier:v7 error:v8];
  }
  else
  {
    [(WCQueueManager *)self onqueue_attemptToSend];
    objc_msgSend(v4, "setRetryCount:", objc_msgSend(v4, "retryCount") + 1);
    v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136446466;
      id v10 = "-[WCQueueManager onqueue_handleFailedDaemonConnectionForQueuedMessage:]";
      __int16 v11 = 2048;
      uint64_t v12 = [v4 retryCount];
      _os_log_impl(&dword_222A02000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s retrying %ld", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)onqueue_handleAcceptanceWithCurrentAccepted:(BOOL)a3 nextAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  char v7 = wc_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = "NO";
    *(void *)&v10[4] = "-[WCQueueManager onqueue_handleAcceptanceWithCurrentAccepted:nextAvailable:]";
    if (v5) {
      int v9 = "YES";
    }
    else {
      int v9 = "NO";
    }
    *(_DWORD *)id v10 = 136446722;
    *(void *)&v10[14] = v9;
    *(_WORD *)&v10[12] = 2080;
    if (v4) {
      id v8 = "YES";
    }
    *(_WORD *)&v10[22] = 2080;
    __int16 v11 = v8;
    _os_log_impl(&dword_222A02000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s current %s, next %s", v10, 0x20u);
  }

  if (v5 && ([(WCQueueManager *)self onqueue_dequeueMessage], v4)) {
    [(WCQueueManager *)self onqueue_attemptToSend];
  }
  else {
    -[WCQueueManager setCanSend:](self, "setCanSend:", 0, *(_OWORD *)v10, *(void *)&v10[16]);
  }
}

- (void)handleSentMessageWithIdentifier:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__WCQueueManager_handleSentMessageWithIdentifier_error___block_invoke;
  block[3] = &unk_26463C258;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

uint64_t __56__WCQueueManager_handleSentMessageWithIdentifier_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_handleSentMessageWithIdentifier:error:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)onqueue_handleSentMessageWithIdentifier:(id)a3 error:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = wc_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSPrintF();
    *(_DWORD *)buf = 136446722;
    v16 = "-[WCQueueManager onqueue_handleSentMessageWithIdentifier:error:]";
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 2114;
    v20 = v9;
    _os_log_impl(&dword_222A02000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s id: %{public}@ with %{public}@", buf, 0x20u);
  }
  id v10 = [(WCQueueManager *)self inFlightMessages];
  __int16 v11 = [v10 objectForKeyedSubscript:v6];

  id v12 = [v11 completionHandler];

  if (v12)
  {
    id v13 = [v11 completionHandler];
    ((void (**)(void, id))v13)[2](v13, v7);

    v14 = [(WCQueueManager *)self inFlightMessages];
    [v14 removeObjectForKey:v6];
  }
}

- (void)cancelQueuedMessages
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__WCQueueManager_cancelQueuedMessages__block_invoke;
  block[3] = &unk_26463C168;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __38__WCQueueManager_cancelQueuedMessages__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_cancelQueuedMessages");
}

- (void)onqueue_cancelQueuedMessages
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v2 = [(WCQueueManager *)self inFlightMessages];
  id v3 = [v2 allValues];
  BOOL v4 = [v3 sortedArrayUsingSelector:sel_compare_];

  BOOL v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = WCCompactStringFromCollection(v4);
    id v7 = [(WCQueueManager *)self messageQueue];
    id v8 = WCCompactStringFromCollection(v7);
    *(_DWORD *)buf = 136446722;
    v39 = "-[WCQueueManager onqueue_cancelQueuedMessages]";
    __int16 v40 = 2114;
    v41 = v6;
    __int16 v42 = 2114;
    v43 = v8;
    _os_log_impl(&dword_222A02000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s inflight messages %{public}@ queued messages %{public}@", buf, 0x20u);
  }
  id v9 = [MEMORY[0x263F087E8] wcErrorWithCode:7007];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v4;
  uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v15 = wc_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v39 = "-[WCQueueManager onqueue_cancelQueuedMessages]";
          __int16 v40 = 2114;
          v41 = v14;
          _os_log_impl(&dword_222A02000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
        }

        v16 = [v14 completionHandler];
        ((void (**)(void, void *))v16)[2](v16, v9);
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v11);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  __int16 v17 = [(WCQueueManager *)self messageQueue];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        v23 = wc_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v39 = "-[WCQueueManager onqueue_cancelQueuedMessages]";
          __int16 v40 = 2114;
          v41 = v22;
          _os_log_impl(&dword_222A02000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
        }

        v24 = [v22 completionHandler];
        ((void (**)(void, void *))v24)[2](v24, v9);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v19);
  }

  v25 = [(WCQueueManager *)self inFlightMessages];
  [v25 removeAllObjects];

  [(WCQueueManager *)self onqueue_clearQueuedMessages];
  [(WCQueueManager *)self onqueue_cancelDaemonMessages];
}

- (void)onqueue_cancelDaemonMessages
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    BOOL v5 = "-[WCQueueManager onqueue_cancelDaemonMessages]";
    _os_log_impl(&dword_222A02000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s ", (uint8_t *)&v4, 0xCu);
  }

  id v3 = +[WCXPCManager sharedManager];
  [v3 cancelAllOutstandingMessages];
}

- (void)onqueue_enqueueMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WCQueueManager *)self messageQueue];
  [v5 addObject:v4];

  [(WCQueueManager *)self onqueue_attemptToSend];
}

- (id)onqueue_peekMessage
{
  id v3 = [(WCQueueManager *)self messageQueue];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    BOOL v5 = [(WCQueueManager *)self messageQueue];
    uint64_t v6 = [v5 objectAtIndex:0];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)onqueue_dequeueMessage
{
  id v3 = [(WCQueueManager *)self messageQueue];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(WCQueueManager *)self messageQueue];
    [v5 removeObjectAtIndex:0];
  }
}

- (void)onqueue_clearQueuedMessages
{
  id v2 = [(WCQueueManager *)self messageQueue];
  [v2 removeAllObjects];
}

- (BOOL)canSend
{
  return self->_canSend;
}

- (void)setCanSend:(BOOL)a3
{
  self->_canSend = a3;
}

- (BOOL)messageOutstanding
{
  return self->_messageOutstanding;
}

- (void)setMessageOutstanding:(BOOL)a3
{
  self->_messageOutstanding = a3;
}

- (NSMutableArray)messageQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMessageQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (NSMutableDictionary)inFlightMessages
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInFlightMessages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightMessages, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_messageQueue, 0);
}

void __39__WCQueueManager_onqueue_attemptToSend__block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = NSPrintF();
  *(_DWORD *)buf = 136446466;
  id v5 = "-[WCQueueManager onqueue_attemptToSend]_block_invoke_4";
  __int16 v6 = 2114;
  id v7 = v3;
  _os_log_error_impl(&dword_222A02000, a2, OS_LOG_TYPE_ERROR, "%{public}s xpc failure due to %{public}@", buf, 0x16u);
}

@end