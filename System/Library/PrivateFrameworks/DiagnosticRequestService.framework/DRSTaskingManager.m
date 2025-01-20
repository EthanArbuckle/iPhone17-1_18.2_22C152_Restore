@interface DRSTaskingManager
- (BOOL)checkConfigsForInvalidation:(id *)a3;
- (BOOL)clearTaskingHistoryWithErrorOut:(id *)a3;
- (BOOL)isTaskingEnabled;
- (BOOL)processTaskingSystemMessage:(id)a3 cloudChannelConfig:(id)a4 transaction:(id)a5 shouldEmitCATelemetry:(BOOL)a6;
- (BOOL)processTaskingSystemMessageJSONData:(id)a3 transaction:(id)a4 shouldEmitCATelemetry:(BOOL)a5;
- (BOOL)processTaskingSystemMessageJSONDict:(id)a3 cloudChannelConfig:(id)a4 transaction:(id)a5 shouldEmitCATelemetry:(BOOL)a6;
- (BOOL)subscribeToChannelWithConfig:(id)a3 errorOut:(id *)a4;
- (BOOL)unsubscribeFromSubscribedChannelWithErrorOut:(id *)a3;
- (BOOL)updatePersistedChannelConfig:(id)a3 errorOut:(id *)a4;
- (DRSTaskingCloudKitHelper)cloudKitHelper;
- (DRSTaskingDecisionMaker)decisionMaker;
- (DRSTaskingManager)initWithDecisionMaker:(id)a3 cloudKitHelper:(id)a4 configStateChangeBlock:(id)a5;
- (DRSTaskingManager)initWithDecisionMaker:(id)a3 configStateChangeBlock:(id)a4;
- (DRSTaskingMessageChannel)taskingMessageChannel;
- (OS_dispatch_queue)workQueue;
- (id)configStateChangeBlock;
- (id)metadataForConfigUUID:(id)a3 teamID:(id)a4 errorOut:(id *)a5;
- (id)persistedCloudChannelConfig;
- (void)_bestEffortLogMessageReceiptTelemetry:(id)a3 transaction:(id)a4 cloudChannelConfig:(id)a5;
- (void)_emitTaskingSystemMessageTelemetry:(id)a3 messageType:(id)a4 dateBroadcast:(id)a5 dateReceived:(id)a6 transaction:(id)a7 cloudChannelConfig:(id)a8;
- (void)_emitTelemetryForLoggableMesssage:(id)a3 transaction:(id)a4 cloudChannelConfig:(id)a5;
- (void)clientCompletedConfigUUID:(id)a3 teamID:(id)a4;
- (void)clientRejectsConfigUUID:(id)a3 teamID:(id)a4;
- (void)processCancelMessage:(id)a3 cloudChannelConfig:(id)a4 transaction:(id)a5 shouldEmitCATelemetry:(BOOL)a6;
- (void)processPingMessage:(id)a3 cloudChannelConfig:(id)a4 transaction:(id)a5 shouldEmitCATelemetry:(BOOL)a6;
- (void)processTaskingMessage:(id)a3 cloudChannelConfig:(id)a4 transaction:(id)a5 shouldEmitCATelemetry:(BOOL)a6;
- (void)setTaskingMessageChannel:(id)a3;
@end

@implementation DRSTaskingManager

- (void)_emitTaskingSystemMessageTelemetry:(id)a3 messageType:(id)a4 dateBroadcast:(id)a5 dateReceived:(id)a6 transaction:(id)a7 cloudChannelConfig:(id)a8
{
  v42[3] = *MEMORY[0x263EF8340];
  id v14 = a3;
  v15 = (__CFString *)a4;
  id v16 = a5;
  id v17 = a6;
  id v36 = a7;
  id v18 = a8;
  v19 = v18;
  if (v15) {
    v20 = v15;
  }
  else {
    v20 = @"InvalidMessage";
  }
  v35 = v20;
  if (v18)
  {
    v42[0] = v20;
    v41[0] = kMessageReceivedEventKey_MessageType;
    v41[1] = kMessageReceivedEventKey_ChannelType;
    v21 = +[DRSCloudChannelConfig stringForChannelType:](DRSCloudChannelConfig, "stringForChannelType:", [v18 type]);
    v42[1] = v21;
    v41[2] = kMessageReceivedEventKey_ChannelEnvironment;
    v22 = +[DRSCloudChannelConfig stringForEnvironment:](DRSCloudChannelConfig, "stringForEnvironment:", [v19 environment]);
    v42[2] = v22;
    v23 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:3];
    v24 = (void *)[v23 mutableCopy];
  }
  else
  {
    v39[0] = kMessageReceivedEventKey_MessageType;
    v39[1] = kMessageReceivedEventKey_ChannelType;
    v40[0] = v20;
    v40[1] = @"ManualInjection";
    v39[2] = kMessageReceivedEventKey_ChannelEnvironment;
    v40[2] = @"ManualInjection";
    v21 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:3];
    v24 = (void *)[v21 mutableCopy];
  }

  if (v14)
  {
    v25 = [v14 UUIDString];
    [v24 setObject:v25 forKeyedSubscript:kUUIDKey];
  }
  if (v16 && v17)
  {
    v26 = NSNumber;
    [v17 timeIntervalSinceDate:v16];
    v27 = objc_msgSend(v26, "numberWithDouble:");
    [v24 setObject:v27 forKeyedSubscript:kMessageReceivedEventKey_ReceiptDelay];
  }
  DRSCoreAnalyticsSendEvent(kMessageReceivedEventName, v24);
  v28 = +[DRSSystemProfile sharedInstance];
  if (![v28 isInternal]) {
    goto LABEL_15;
  }
  v29 = [(DRSTaskingManager *)self cloudKitHelper];

  if (v29)
  {
    v34 = [(DRSTaskingManager *)self cloudKitHelper];
    v30 = [v24 objectForKeyedSubscript:kUUIDKey];
    v31 = [v24 objectForKeyedSubscript:kMessageReceivedEventKey_MessageType];
    v32 = [v24 objectForKeyedSubscript:kMessageReceivedEventKey_ChannelType];
    v33 = [v24 objectForKeyedSubscript:kMessageReceivedEventKey_ChannelEnvironment];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __126__DRSTaskingManager__emitTaskingSystemMessageTelemetry_messageType_dateBroadcast_dateReceived_transaction_cloudChannelConfig___block_invoke;
    v37[3] = &unk_263FCA200;
    id v38 = v14;
    [v34 reportTaskingSystemMessageReceipt:v30 messageType:v31 channelType:v32 channelEnvironment:v33 dateBroadcast:v16 dateReceived:v17 transaction:v36 completionHandler:v37];

    v28 = v38;
LABEL_15:
  }
}

void __126__DRSTaskingManager__emitTaskingSystemMessageTelemetry_messageType_dateBroadcast_dateReceived_transaction_cloudChannelConfig___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = DPLogHandle_ConfigPersistedStoreError();
    if (os_signpost_enabled(v4))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v11 = 138543618;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      id v14 = v3;
      v6 = "TaskingManagerMessageReceiptTelemetryError";
      v7 = "Telemetry reporting for %{public}@ failed %{public}@";
      v8 = v4;
      uint32_t v9 = 22;
LABEL_6:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v6, v7, (uint8_t *)&v11, v9);
    }
  }
  else
  {
    v4 = DPLogHandle_ConfigPersistedStore();
    if (os_signpost_enabled(v4))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138543362;
      uint64_t v12 = v10;
      v6 = "TaskingManagerMessageReceiptTelemetrySuccess";
      v7 = "Telemetry reporting for %{public}@ succeeded!";
      v8 = v4;
      uint32_t v9 = 12;
      goto LABEL_6;
    }
  }
}

- (void)_emitTelemetryForLoggableMesssage:(id)a3 transaction:(id)a4 cloudChannelConfig:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = [v10 messageUUID];
  int v11 = [v10 messageType];
  uint64_t v12 = [v10 dateBroadcast];
  __int16 v13 = [v10 dateReceived];

  [(DRSTaskingManager *)self _emitTaskingSystemMessageTelemetry:v14 messageType:v11 dateBroadcast:v12 dateReceived:v13 transaction:v9 cloudChannelConfig:v8];
}

- (void)processTaskingMessage:(id)a3 cloudChannelConfig:(id)a4 transaction:(id)a5 shouldEmitCATelemetry:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v6) {
    [(DRSTaskingManager *)self _emitTelemetryForLoggableMesssage:v10 transaction:v12 cloudChannelConfig:v11];
  }
  __int16 v13 = [(DRSTaskingManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__DRSTaskingManager_processTaskingMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke;
  block[3] = &unk_263FCA360;
  id v18 = v10;
  v19 = self;
  BOOL v22 = v6;
  id v20 = v11;
  id v21 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_sync(v13, block);
}

void __96__DRSTaskingManager_processTaskingMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = DPLogHandle_TaskingManager();
  if (os_signpost_enabled(v2))
  {
    id v3 = [*(id *)(a1 + 32) messageUUID];
    *(_DWORD *)buf = 138543362;
    v25 = v3;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedTaskingMessage", "TaskingMessage with UUID %{public}@", buf, 0xCu);
  }
  v4 = [*(id *)(a1 + 40) decisionMaker];
  uint64_t v5 = objc_msgSend(v4, "acceptedConfigs:logTelemetry:allowWildcardBuild:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), objc_msgSend(*(id *)(a1 + 48), "allowsWildcardBuild"));

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        BOOL v11 = [v10 state] == 2;
        id v12 = [*(id *)(a1 + 40) workQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __96__DRSTaskingManager_processTaskingMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke_44;
        block[3] = &unk_263FCA360;
        __int16 v13 = *(void **)(a1 + 32);
        void block[4] = *(void *)(a1 + 40);
        block[5] = v10;
        BOOL v18 = v11;
        id v16 = v13;
        id v17 = *(id *)(a1 + 56);
        dispatch_async(v12, block);
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
}

void __96__DRSTaskingManager_processTaskingMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke_44(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) configStateChangeBlock];
  id v3 = [*(id *)(a1 + 40) teamID];
  v4 = [*(id *)(a1 + 40) configUUID];
  uint64_t v5 = [*(id *)(a1 + 40) config];
  ((void (**)(void, void *, void *, void *, uint64_t, void, void))v2)[2](v2, v3, v4, v5, [*(id *)(a1 + 40) state], 0, *(unsigned __int8 *)(a1 + 64));

  uint64_t v6 = DPLogHandle_TaskingManager();
  if (os_signpost_enabled(v6))
  {
    uint64_t v7 = [*(id *)(a1 + 40) configUUID];
    uint64_t v8 = [*(id *)(a1 + 40) teamID];
    id v9 = [*(id *)(a1 + 48) messageUUID];
    int v10 = 138543874;
    BOOL v11 = v7;
    __int16 v12 = 2114;
    __int16 v13 = v8;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AcceptedConfig", "Accepted config %{public}@ (teamID: %{public}@) due to tasking message %{public}@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)processCancelMessage:(id)a3 cloudChannelConfig:(id)a4 transaction:(id)a5 shouldEmitCATelemetry:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  if (v6) {
    [(DRSTaskingManager *)self _emitTelemetryForLoggableMesssage:v10 transaction:v11 cloudChannelConfig:a4];
  }
  __int16 v12 = [(DRSTaskingManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__DRSTaskingManager_processCancelMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke;
  block[3] = &unk_263FC9E20;
  id v16 = v10;
  id v17 = self;
  id v18 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_sync(v12, block);
}

void __95__DRSTaskingManager_processCancelMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = DPLogHandle_TaskingManager();
  if (os_signpost_enabled(v2))
  {
    id v3 = [a1[4] messageUUID];
    *(_DWORD *)buf = 138543362;
    __int16 v12 = v3;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedCancelMessage", "CancelMessage with UUID %{public}@", buf, 0xCu);
  }
  v4 = [a1[5] decisionMaker];
  uint64_t v5 = [v4 acceptedCancels:a1[4]];

  if (v5)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __95__DRSTaskingManager_processCancelMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke_46;
    v8[3] = &unk_263FCA3B0;
    int8x16_t v7 = *((int8x16_t *)a1 + 2);
    id v6 = (id)v7.i64[0];
    int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
    id v10 = a1[6];
    [v5 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

void __95__DRSTaskingManager_processCancelMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke_46(id *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * v9);
        id v11 = [a1[4] workQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __95__DRSTaskingManager_processCancelMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke_2;
        block[3] = &unk_263FCA388;
        void block[4] = a1[4];
        id v14 = v5;
        uint64_t v15 = v10;
        id v16 = a1[5];
        id v17 = a1[6];
        dispatch_async(v11, block);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

void __95__DRSTaskingManager_processCancelMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) configStateChangeBlock];
  v2[2](v2, *(void *)(a1 + 40), *(void *)(a1 + 48), 0, 3, 2, 1);

  id v3 = DPLogHandle_TaskingManager();
  if (os_signpost_enabled(v3))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v6 = [*(id *)(a1 + 56) messageUUID];
    int v7 = 138543874;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    __int16 v12 = v6;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelledConfig", "Cancelled config %{public}@ (teamID: %{public}@) due to cancel message %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)processPingMessage:(id)a3 cloudChannelConfig:(id)a4 transaction:(id)a5 shouldEmitCATelemetry:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v6) {
    [(DRSTaskingManager *)self _emitTelemetryForLoggableMesssage:v10 transaction:v12 cloudChannelConfig:v11];
  }
  uint64_t v13 = DPLogHandle_TaskingManager();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)id v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedPingMesssage", (const char *)&unk_209EEADD1, v14, 2u);
  }
}

- (BOOL)processTaskingSystemMessageJSONData:(id)a3 transaction:(id)a4 shouldEmitCATelemetry:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v17 = 0;
  __int16 v9 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v17];
  id v10 = v17;
  if (v9)
  {
    BOOL v11 = [(DRSTaskingManager *)self processTaskingSystemMessageJSONDict:v9 cloudChannelConfig:0 transaction:v8 shouldEmitCATelemetry:v5];
  }
  else
  {
    id v12 = DPLogHandle_TaskingManagerError();
    if (os_signpost_enabled(v12))
    {
      uint64_t v13 = [v10 localizedDescription];
      id v14 = (void *)v13;
      uint64_t v15 = @"Unknown";
      if (v13) {
        uint64_t v15 = (__CFString *)v13;
      }
      *(_DWORD *)buf = 138543362;
      long long v19 = v15;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidJSONData", "Could not process JSON data due to error %{public}@", buf, 0xCu);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_bestEffortLogMessageReceiptTelemetry:(id)a3 transaction:(id)a4 cloudChannelConfig:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF910] date];
  BOOL v11 = _dateFromJSONDict(v16, (uint64_t)kDRSTaskingSystemMessage_DateBroadcastKey);
  uint64_t v12 = [v16 objectForKeyedSubscript:kDRSTaskingSystemMessage_messageUUIDKey];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    id v14 = off_263FC94D8;
LABEL_5:
    uint64_t v15 = [(__objc2_class *)*v14 messageType];
    goto LABEL_6;
  }
  uint64_t v13 = [v16 objectForKeyedSubscript:kDRSTaskingSystemMessage_messageUUIDKey];
  if (v13)
  {
    id v14 = off_263FC93C8;
    goto LABEL_5;
  }
  uint64_t v15 = 0;
LABEL_6:
  [(DRSTaskingManager *)self _emitTaskingSystemMessageTelemetry:v13 messageType:v15 dateBroadcast:v11 dateReceived:v10 transaction:v8 cloudChannelConfig:v9];
}

- (BOOL)processTaskingSystemMessageJSONDict:(id)a3 cloudChannelConfig:(id)a4 transaction:(id)a5 shouldEmitCATelemetry:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(DRSTaskingManager *)self isTaskingEnabled])
  {
    uint64_t v13 = DRSTaskingSystemMessageFromJSONDict(v10);
    if (v13)
    {
      LOBYTE(v6) = [(DRSTaskingManager *)self processTaskingSystemMessage:v13 cloudChannelConfig:v11 transaction:v12 shouldEmitCATelemetry:v6];
    }
    else
    {
      uint64_t v15 = DPLogHandle_TaskingManagerError();
      if (os_signpost_enabled(v15))
      {
        LOWORD(v16) = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidTaskingSystemJSONData", "Received invalid JSON tasking system message", (uint8_t *)&v16, 2u);
      }

      if (v6)
      {
        [(DRSTaskingManager *)self _bestEffortLogMessageReceiptTelemetry:v10 transaction:v12 cloudChannelConfig:v11];
        LOBYTE(v6) = 0;
      }
    }
  }
  else
  {
    uint64_t v13 = DPLogHandle_TaskingManager();
    if (os_signpost_enabled(v13))
    {
      int v16 = 138543362;
      id v17 = v10;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "IgnoringMessageDueToDisablement", "Disabled, so ignoring tasking system message dictionary: %{public}@", (uint8_t *)&v16, 0xCu);
    }
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (BOOL)processTaskingSystemMessage:(id)a3 cloudChannelConfig:(id)a4 transaction:(id)a5 shouldEmitCATelemetry:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(DRSTaskingManager *)self processTaskingMessage:v10 cloudChannelConfig:v11 transaction:v12 shouldEmitCATelemetry:v6];
LABEL_7:
    BOOL v13 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(DRSTaskingManager *)self processCancelMessage:v10 cloudChannelConfig:v11 transaction:v12 shouldEmitCATelemetry:v6];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(DRSTaskingManager *)self processPingMessage:v10 cloudChannelConfig:v11 transaction:v12 shouldEmitCATelemetry:v6];
    goto LABEL_7;
  }
  uint64_t v15 = DPLogHandle_TaskingManagerError();
  if (os_signpost_enabled(v15))
  {
    int v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    int v18 = 138412290;
    long long v19 = v17;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UnknownMessageClass", "Received unknown message class: %{pbulic}@", (uint8_t *)&v18, 0xCu);
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (DRSTaskingManager)initWithDecisionMaker:(id)a3 configStateChangeBlock:(id)a4
{
  return [(DRSTaskingManager *)self initWithDecisionMaker:a3 cloudKitHelper:0 configStateChangeBlock:a4];
}

- (DRSTaskingManager)initWithDecisionMaker:(id)a3 cloudKitHelper:(id)a4 configStateChangeBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    int v18 = DPLogHandle_TaskingManagerError();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      long long v19 = "No config state change block specified";
LABEL_10:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingManagerInitFailure", v19, buf, 2u);
    }
LABEL_11:

    id v17 = 0;
    goto LABEL_12;
  }
  if (!v9)
  {
    int v18 = DPLogHandle_TaskingManagerError();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      long long v19 = "No decision maker provided";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v21.receiver = self;
  v21.super_class = (Class)DRSTaskingManager;
  id v12 = [(DRSTaskingManager *)&v21 init];
  if (v12)
  {
    dispatch_queue_t v13 = dispatch_queue_create("DRSTaskingManager message queue", 0);
    workQueue = v12->_workQueue;
    v12->_workQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = _Block_copy(v11);
    id configStateChangeBlock = v12->_configStateChangeBlock;
    v12->_id configStateChangeBlock = v15;

    objc_storeStrong((id *)&v12->_decisionMaker, a3);
    objc_storeStrong((id *)&v12->_cloudKitHelper, a4);
  }
  self = v12;
  id v17 = self;
LABEL_12:

  return v17;
}

- (void)clientRejectsConfigUUID:(id)a3 teamID:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = DPLogHandle_TaskingManager();
  if (os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v6;
    __int16 v22 = 2114;
    id v23 = v7;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientRejectsConfig", "Client rejects config %{public}@ (teamID: %{public}@)", buf, 0x16u);
  }

  id v9 = [(DRSTaskingManager *)self decisionMaker];
  id v10 = [v9 configStore];
  id v19 = 0;
  id v11 = [v10 configMetadataForUUID:v6 errorOut:&v19];
  id v12 = v19;

  if (v11)
  {
    if ([v11 state] == 3)
    {
      uint64_t v13 = DPLogHandle_TaskingManagerError();
      if (os_signpost_enabled((os_log_t)v13))
      {
        *(_DWORD *)buf = 138543618;
        id v21 = v7;
        __int16 v22 = 2114;
        id v23 = v6;
        id v14 = "Client (teamID %{public}@) attempting to reject completed config %{public}@";
LABEL_13:
        _os_signpost_emit_with_name_impl(&dword_209E70000, (os_log_t)v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientRejectsConfigError", v14, buf, 0x16u);
      }
    }
    else
    {
      uint64_t v15 = [v11 teamID];
      char v16 = [v15 isEqualToString:v7];

      if (v16)
      {
        id v17 = [(DRSTaskingManager *)self decisionMaker];
        [v17 clientRejectsConfigUUID:v6];

        BOOL v18 = [v11 state] == 2;
        uint64_t v13 = [(DRSTaskingManager *)self configStateChangeBlock];
        (*(void (**)(uint64_t, id, id, void, uint64_t, uint64_t, BOOL))(v13 + 16))(v13, v7, v6, 0, 3, 5, v18);
      }
      else
      {
        uint64_t v13 = DPLogHandle_TaskingManagerError();
        if (os_signpost_enabled((os_log_t)v13))
        {
          *(_DWORD *)buf = 138543618;
          id v21 = v7;
          __int16 v22 = 2114;
          id v23 = v6;
          id v14 = "Client (teamID %{public}@) attempting to reject config %{public}@ for wrong team";
          goto LABEL_13;
        }
      }
    }
  }
  else
  {
    uint64_t v13 = DPLogHandle_TaskingManagerError();
    if (os_signpost_enabled((os_log_t)v13))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = v7;
      __int16 v22 = 2114;
      id v23 = v6;
      id v14 = "Client (teamID %{public}@) attempting to reject non-existent config %{public}@";
      goto LABEL_13;
    }
  }
}

- (void)clientCompletedConfigUUID:(id)a3 teamID:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = DPLogHandle_TaskingManager();
  if (os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v6;
    __int16 v22 = 2114;
    id v23 = v7;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientCompletedConfig", "Client completed config %{public}@ (teamID: %{public}@)", buf, 0x16u);
  }

  id v9 = [(DRSTaskingManager *)self decisionMaker];
  id v10 = [v9 configStore];
  id v19 = 0;
  id v11 = [v10 configMetadataForUUID:v6 errorOut:&v19];
  id v12 = v19;

  if (v11)
  {
    if ([v11 state] == 3)
    {
      uint64_t v13 = DPLogHandle_TaskingManagerError();
      if (os_signpost_enabled((os_log_t)v13))
      {
        *(_DWORD *)buf = 138543618;
        id v21 = v7;
        __int16 v22 = 2114;
        id v23 = v6;
        id v14 = "Client (teamID %{public}@) attempting to complete already-completed config %{public}@";
LABEL_13:
        _os_signpost_emit_with_name_impl(&dword_209E70000, (os_log_t)v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientCompletedConfigError", v14, buf, 0x16u);
      }
    }
    else
    {
      uint64_t v15 = [v11 teamID];
      char v16 = [v15 isEqualToString:v7];

      if (v16)
      {
        id v17 = [(DRSTaskingManager *)self decisionMaker];
        [v17 clientCompletedConfigUUID:v6];

        BOOL v18 = [v11 state] == 2;
        uint64_t v13 = [(DRSTaskingManager *)self configStateChangeBlock];
        (*(void (**)(uint64_t, id, id, void, uint64_t, uint64_t, BOOL))(v13 + 16))(v13, v7, v6, 0, 3, 6, v18);
      }
      else
      {
        uint64_t v13 = DPLogHandle_TaskingManagerError();
        if (os_signpost_enabled((os_log_t)v13))
        {
          *(_DWORD *)buf = 138543618;
          id v21 = v7;
          __int16 v22 = 2114;
          id v23 = v6;
          id v14 = "Client (teamID %{public}@) attempting to complete config %{public}@ for wrong team";
          goto LABEL_13;
        }
      }
    }
  }
  else
  {
    uint64_t v13 = DPLogHandle_TaskingManagerError();
    if (os_signpost_enabled((os_log_t)v13))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = v7;
      __int16 v22 = 2114;
      id v23 = v6;
      id v14 = "Client (teamID %{public}@) attempting to complete non-existent config %{public}@";
      goto LABEL_13;
    }
  }
}

- (id)metadataForConfigUUID:(id)a3 teamID:(id)a4 errorOut:(id *)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"(teamID == %@) AND (configUUID == %@)", a4, a3];
  id v8 = [(DRSTaskingManager *)self decisionMaker];
  id v9 = [v8 configStore];
  id v15 = 0;
  id v10 = [v9 configMetadatasForPredicate:v7 sortDescriptors:0 fetchLimit:1 errorOut:&v15];
  id v11 = v15;

  if (v11)
  {
    id v12 = DPLogHandle_TaskingManagerError();
    if (os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v11;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MetadataLookupFailure", "Failed to lookup metadata due to error: %{public}@", buf, 0xCu);
    }

    if (a5)
    {
      uint64_t v13 = 0;
      *a5 = v11;
      goto LABEL_10;
    }
  }
  else if (v10 && [v10 count])
  {
    uint64_t v13 = [v10 firstObject];
    goto LABEL_10;
  }
  uint64_t v13 = 0;
LABEL_10:

  return v13;
}

- (BOOL)clearTaskingHistoryWithErrorOut:(id *)a3
{
  uint64_t v4 = [(DRSTaskingManager *)self decisionMaker];
  BOOL v5 = [v4 configStore];
  LOBYTE(a3) = [v5 clearStoreWithErrorOut:a3];

  return (char)a3;
}

- (id)persistedCloudChannelConfig
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6;
  id v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  id v3 = [(DRSTaskingManager *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__DRSTaskingManager_persistedCloudChannelConfig__block_invoke;
  v6[3] = &unk_263FC9F10;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __48__DRSTaskingManager_persistedCloudChannelConfig__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) decisionMaker];
  v2 = [v6 configStore];
  uint64_t v3 = [v2 cloudChannelConfig];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)updatePersistedChannelConfig:(id)a3 errorOut:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(DRSTaskingManager *)self decisionMaker];
  id v8 = [v7 configStore];
  LOBYTE(a4) = [v8 updateCloudChannelConfig:v6 errorOut:a4];

  return (char)a4;
}

- (BOOL)unsubscribeFromSubscribedChannelWithErrorOut:(id *)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  *a3 = 0;
  BOOL v5 = [(DRSTaskingManager *)self taskingMessageChannel];

  if (!v5) {
    return 1;
  }
  id v6 = [(DRSTaskingManager *)self taskingMessageChannel];
  int v7 = [v6 unsubscribe:a3];

  if (v7)
  {
    [(DRSTaskingManager *)self setTaskingMessageChannel:0];
    return 1;
  }
  if (!*a3)
  {
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F08320];
    v20[0] = @"Unknown unsubscribe failure";
    id v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    *a3 = [v9 errorWithDomain:@"DiagnosticRequestCloudChannelError" code:0 userInfo:v10];
  }
  id v11 = DPLogHandle_TaskingManagerError();
  if (os_signpost_enabled(v11))
  {
    id v12 = [(DRSTaskingManager *)self taskingMessageChannel];
    uint64_t v13 = [v12 config];
    id v14 = *a3;
    int v15 = 138543618;
    char v16 = v13;
    __int16 v17 = 2114;
    id v18 = v14;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UnsubscribeChannelFailed", "Failed to unsubscribe from %{public}@ due to error: %{public}@", (uint8_t *)&v15, 0x16u);
  }
  return 0;
}

- (BOOL)isTaskingEnabled
{
  v2 = +[DRSSystemProfile sharedInstance];
  char v3 = [v2 isTaskingEnabled];

  return v3;
}

- (BOOL)subscribeToChannelWithConfig:(id)a3 errorOut:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  *a4 = 0;
  if (v6)
  {
    int v7 = [DRSTaskingMessageChannel alloc];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __59__DRSTaskingManager_subscribeToChannelWithConfig_errorOut___block_invoke;
    v15[3] = &unk_263FCA3D8;
    v15[4] = self;
    id v8 = [(DRSTaskingMessageChannel *)v7 initWithCloudChannelConfig:v6 payloadProcessingBlock:v15];
    LODWORD(v9) = [(DRSTaskingMessageChannel *)v8 subscribe:a4];
    if (v9)
    {
      [(DRSTaskingManager *)self setTaskingMessageChannel:v8];
    }
    else
    {
      id v10 = DPLogHandle_TaskingManagerError();
      if (os_signpost_enabled(v10))
      {
        uint64_t v11 = [v6 debugDescription];
        id v12 = (void *)v11;
        uint64_t v13 = (__CFString *)*a4;
        if (!*a4) {
          uint64_t v13 = @"Unknown";
        }
        *(_DWORD *)buf = 138543618;
        uint64_t v17 = v11;
        __int16 v18 = 2114;
        uint64_t v19 = v13;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SubscriptionFailed", "Failed to subscribe to %{public}@ to error: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v9 = DPLogHandle_TaskingManager();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NotSubscribingToTaskingChannel", "nil config means no subscription", buf, 2u);
    }

    LOBYTE(v9) = 1;
  }

  return (char)v9;
}

void __59__DRSTaskingManager_subscribeToChannelWithConfig_errorOut___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = (void *)os_transaction_create();
  id v8 = DPLogHandle_TaskingManager();
  if (os_signpost_enabled(v8))
  {
    int v9 = 138543362;
    id v10 = v5;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingSystemMessageReceived", "Tasking system message: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  [*(id *)(a1 + 32) processTaskingSystemMessageJSONDict:v5 cloudChannelConfig:v6 transaction:v7 shouldEmitCATelemetry:1];
}

- (BOOL)checkConfigsForInvalidation:(id *)a3
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  *a3 = 0;
  id v5 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"(state == %u) || (state == %u)", 2, 1);
  id v6 = [(DRSTaskingManager *)self decisionMaker];
  int v7 = [v6 configStore];
  id v8 = [v7 configMetadatasForPredicate:v5 sortDescriptors:0 fetchLimit:0 errorOut:a3];

  id v9 = *a3;
  if (*a3)
  {
    id v10 = DPLogHandle_TaskingManagerError();
    if (os_signpost_enabled(v10))
    {
      id v11 = *a3;
      *(_DWORD *)buf = 138543362;
      id v99 = v11;
      id v12 = "InvalidationCheckFailed";
      uint64_t v13 = "Failed to fetch waiting or active configs due to error: %{public}@";
      id v14 = v10;
      uint32_t v15 = 12;
LABEL_52:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v12, v13, buf, v15);
      goto LABEL_53;
    }
    goto LABEL_53;
  }
  if (v8 && [v8 count])
  {
    v81 = self;
    v79 = v5;
    char v16 = [MEMORY[0x263EFF910] date];
    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v18 = v8;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v94 objects:v107 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v95;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v95 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v94 + 1) + 8 * i);
          uint64_t v24 = [v23 teamID];
          v25 = [v17 objectForKeyedSubscript:v24];

          if (!v25)
          {
            v25 = [MEMORY[0x263EFF980] array];
            uint64_t v26 = [v23 teamID];
            [v17 setObject:v25 forKeyedSubscript:v26];
          }
          [v25 addObject:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v94 objects:v107 count:16];
      }
      while (v20);
    }

    v27 = [MEMORY[0x263EFF980] array];
    v90[0] = MEMORY[0x263EF8330];
    v90[1] = 3221225472;
    v90[2] = __49__DRSTaskingManager_checkConfigsForInvalidation___block_invoke;
    v90[3] = &unk_263FCA3B0;
    id v28 = v27;
    id v91 = v28;
    v92 = v81;
    v83 = v16;
    v93 = v83;
    [v17 enumerateKeysAndObjectsUsingBlock:v90];
    id v29 = v28;

    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v8 = v29;
    uint64_t v30 = [v8 countByEnumeratingWithState:&v86 objects:v106 count:16];
    if (!v30)
    {
LABEL_49:

      id v9 = 0;
      id v5 = v79;
      id v10 = v83;
      goto LABEL_53;
    }
    uint64_t v31 = v30;
    unint64_t v32 = 0x263FC9000uLL;
    uint64_t v82 = *(void *)v87;
    id obj = v8;
LABEL_17:
    uint64_t v33 = 0;
    while (1)
    {
      if (*(void *)v87 != v82) {
        objc_enumerationMutation(obj);
      }
      v34 = *(void **)(*((void *)&v86 + 1) + 8 * v33);
      v35 = [*(id *)(v32 + 1176) sharedInstance];
      id v36 = [v35 build];
      v37 = [v34 config];
      id v38 = [v37 build];
      char v39 = [v36 isEqualToString:v38];

      if (v39)
      {
        v40 = [v34 config];
        v41 = [v40 endDate];
        uint64_t v42 = [v83 compare:v41];

        if (v42 == -1)
        {
          v48 = DPLogHandle_TaskingManager();
          if (os_signpost_enabled(v48))
          {
            v73 = [v34 configUUID];
            v74 = [v34 teamID];
            *(_DWORD *)buf = 138543618;
            id v99 = v73;
            __int16 v100 = 2114;
            uint64_t v101 = (uint64_t)v74;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v48, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigStillValid", "Config %{public}@ (Team ID %{public}@) is still valid", buf, 0x16u);
          }
          unint64_t v32 = 0x263FC9000;
          goto LABEL_47;
        }
        if ([v34 state] == 1) {
          uint64_t v43 = 1;
        }
        else {
          uint64_t v43 = 8194;
        }
        v44 = [(DRSTaskingManager *)v81 decisionMaker];
        v45 = [v44 configStore];
        v46 = [v34 configUUID];
        id v84 = 0;
        char v47 = [v45 completeConfigWithUUID:v46 completedDate:v83 completionType:v43 completionDescription:@"Expired" errorOut:&v84];
        v48 = v84;

        if (v47)
        {
          uint64_t v49 = [(DRSTaskingManager *)v81 configStateChangeBlock];
          v50 = [v34 teamID];
          v51 = [v34 configUUID];
          (*(void (**)(uint64_t, void *, void *, void, uint64_t, uint64_t, BOOL))(v49 + 16))(v49, v50, v51, 0, 3, 4, [v34 state] == 2);

          goto LABEL_45;
        }
        uint64_t v49 = DPLogHandle_TaskingManagerError();
        if (os_signpost_enabled((os_log_t)v49))
        {
          v50 = [v34 configUUID];
          uint64_t v75 = [v34 teamID];
          v76 = (void *)v75;
          *(_DWORD *)buf = 138543874;
          v77 = @"Unknown";
          if (v48) {
            v77 = (__CFString *)v48;
          }
          id v99 = v50;
          __int16 v100 = 2114;
          uint64_t v101 = v75;
          __int16 v102 = 2114;
          uint64_t v103 = (uint64_t)v77;
          _os_signpost_emit_with_name_impl(&dword_209E70000, (os_log_t)v49, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidationFailed", "Failed to invalidate expiring config %{public}@ (Team ID: %{public}@) due to error: %{public}@", buf, 0x20u);

LABEL_45:
        }
        unint64_t v32 = 0x263FC9000;

        goto LABEL_47;
      }
      v52 = NSString;
      v53 = [v34 config];
      v54 = [v53 build];
      v55 = [*(id *)(v32 + 1176) sharedInstance];
      v56 = [v55 build];
      v48 = [v52 stringWithFormat:@"Build changed (%@ -> %@)", v54, v56];

      if ([v34 state] == 1) {
        uint64_t v57 = 1;
      }
      else {
        uint64_t v57 = 8193;
      }
      v58 = [(DRSTaskingManager *)v81 decisionMaker];
      v59 = [v58 configStore];
      v60 = [v34 configUUID];
      id v85 = 0;
      char v61 = [v59 completeConfigWithUUID:v60 completedDate:v83 completionType:v57 completionDescription:v48 errorOut:&v85];
      v62 = (__CFString *)v85;

      if (v61)
      {
        uint64_t v63 = [(DRSTaskingManager *)v81 configStateChangeBlock];
        v64 = [v34 teamID];
        v65 = [v34 configUUID];
        (*(void (**)(uint64_t, void *, void *, void, uint64_t, uint64_t, BOOL))(v63 + 16))(v63, v64, v65, 0, 3, 3, [v34 state] == 2);
      }
      else
      {
        uint64_t v63 = DPLogHandle_TaskingManagerError();
        if (os_signpost_enabled((os_log_t)v63))
        {
          v66 = [v34 configUUID];
          v67 = [v34 config];
          v68 = [v67 build];
          v69 = +[DRSSystemProfile sharedInstance];
          uint64_t v70 = [v69 build];
          v71 = (void *)v70;
          *(_DWORD *)buf = 138544130;
          v72 = @"Unknown";
          if (v62) {
            v72 = v62;
          }
          id v99 = v66;
          __int16 v100 = 2114;
          uint64_t v101 = (uint64_t)v68;
          __int16 v102 = 2114;
          uint64_t v103 = v70;
          __int16 v104 = 2114;
          v105 = v72;
          _os_signpost_emit_with_name_impl(&dword_209E70000, (os_log_t)v63, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidationFailed", "Failed to invalidate config %{public}@ (%{public}@ -> %{public}@) due to error: %{public}@", buf, 0x2Au);

          unint64_t v32 = 0x263FC9000;
          goto LABEL_37;
        }
      }
      unint64_t v32 = 0x263FC9000;
LABEL_37:

LABEL_47:
      if (v31 == ++v33)
      {
        id v8 = obj;
        uint64_t v31 = [obj countByEnumeratingWithState:&v86 objects:v106 count:16];
        if (!v31) {
          goto LABEL_49;
        }
        goto LABEL_17;
      }
    }
  }
  id v10 = DPLogHandle_TaskingManager();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    id v12 = "NoOpInvalidation";
    uint64_t v13 = "No active or waiting configs";
    id v14 = v10;
    uint32_t v15 = 2;
    goto LABEL_52;
  }
LABEL_53:

  return v9 == 0;
}

void __49__DRSTaskingManager_checkConfigsForInvalidation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v27 = a2;
  id v5 = a3;
  if ((unint64_t)[v5 count] > 1)
  {
    id v6 = DPLogHandle_TaskingManagerError();
    if (os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 134349314;
      uint64_t v36 = [v5 count];
      __int16 v37 = 2114;
      id v38 = v27;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CollidingConfigsForTeam", "Found %{public}lu active or waiting configs for team ID %{public}@. Invalidating team configs", buf, 0x16u);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v26 = v5;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (!v7)
    {
LABEL_24:

      id v5 = v26;
      goto LABEL_25;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
LABEL_7:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v31 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
      id v12 = DPLogHandle_TaskingManagerError();
      if (os_signpost_enabled(v12))
      {
        uint64_t v13 = [v11 configUUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v36 = (uint64_t)v27;
        __int16 v37 = 2114;
        id v38 = v13;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidatingCollidingConfigs", "Invalidating %{public}@: %{public}@ due to colliding configs", buf, 0x16u);
      }
      uint64_t v14 = [v11 state] == 1 ? 1 : 8193;
      uint32_t v15 = [*(id *)(a1 + 40) decisionMaker];
      char v16 = [v15 configStore];
      uint64_t v17 = [v11 configUUID];
      uint64_t v18 = *(void *)(a1 + 48);
      id v29 = 0;
      char v19 = [v16 completeConfigWithUUID:v17 completedDate:v18 completionType:v14 completionDescription:@"Collided with active config for team" errorOut:&v29];
      uint64_t v20 = (__CFString *)v29;

      if (v19) {
        break;
      }
      uint64_t v21 = DPLogHandle_TaskingManagerError();
      if (os_signpost_enabled((os_log_t)v21))
      {
        uint64_t v24 = [v11 configUUID];
        __int16 v22 = (void *)v24;
        *(_DWORD *)buf = 138543618;
        v25 = @"Unknown";
        if (v20) {
          v25 = v20;
        }
        uint64_t v36 = v24;
        __int16 v37 = 2114;
        id v38 = v25;
        _os_signpost_emit_with_name_impl(&dword_209E70000, (os_log_t)v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidationFailed", "Failed to invalidate colliding config %{public}@ due to error: %{public}@", buf, 0x16u);
        goto LABEL_21;
      }
LABEL_22:

      if (v8 == ++v10)
      {
        uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (!v8) {
          goto LABEL_24;
        }
        goto LABEL_7;
      }
    }
    uint64_t v21 = [*(id *)(a1 + 40) configStateChangeBlock];
    __int16 v22 = [v11 teamID];
    id v23 = [v11 configUUID];
    (*(void (**)(uint64_t, void *, void *, void, uint64_t, uint64_t, BOOL))(v21 + 16))(v21, v22, v23, 0, 3, 3, [v11 state] == 2);

LABEL_21:
    goto LABEL_22;
  }
  [*(id *)(a1 + 32) addObjectsFromArray:v5];
LABEL_25:
}

- (DRSTaskingDecisionMaker)decisionMaker
{
  return self->_decisionMaker;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (id)configStateChangeBlock
{
  return self->_configStateChangeBlock;
}

- (DRSTaskingMessageChannel)taskingMessageChannel
{
  return self->_taskingMessageChannel;
}

- (void)setTaskingMessageChannel:(id)a3
{
}

- (DRSTaskingCloudKitHelper)cloudKitHelper
{
  return self->_cloudKitHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitHelper, 0);
  objc_storeStrong((id *)&self->_taskingMessageChannel, 0);
  objc_storeStrong(&self->_configStateChangeBlock, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_decisionMaker, 0);
}

@end