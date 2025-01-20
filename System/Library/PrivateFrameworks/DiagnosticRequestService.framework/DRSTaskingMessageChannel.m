@interface DRSTaskingMessageChannel
- (APSConnection)apsConnection;
- (BOOL)subscribe:(id *)a3;
- (BOOL)unsubscribe:(id *)a3;
- (DRSCloudChannelConfig)config;
- (DRSTaskingMessageChannel)initWithCloudChannelConfig:(id)a3 payloadProcessingBlock:(id)a4;
- (NSString)apsEnvironmentString;
- (NSString)debugDescription;
- (OS_dispatch_queue)workQueue;
- (PKPublicChannel)pubSubChannel;
- (id)processingBlock;
- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)setApsConnection:(id)a3;
@end

@implementation DRSTaskingMessageChannel

- (NSString)debugDescription
{
  v2 = NSString;
  v3 = [(DRSTaskingMessageChannel *)self config];
  v4 = [v3 debugDescription];
  v5 = [v2 stringWithFormat:@"Subscribed Channel with config: %@", v4];

  return (NSString *)v5;
}

- (DRSTaskingMessageChannel)initWithCloudChannelConfig:(id)a3 payloadProcessingBlock:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v20 = DPLogHandle_TaskingMessageChannelError();
    if (!os_signpost_enabled(v20)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v21 = "InvalidChannelConfiguration";
    v22 = "Channel config cannot be nil";
    goto LABEL_12;
  }
  if (!v8)
  {
    v20 = DPLogHandle_TaskingMessageChannelError();
    if (!os_signpost_enabled(v20)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v21 = "MissingProcessingBlock";
    v22 = "Payload processing block is required.";
LABEL_12:
    v23 = v20;
    uint32_t v24 = 2;
LABEL_13:
    _os_signpost_emit_with_name_impl(&dword_209E70000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v21, v22, buf, v24);
    goto LABEL_14;
  }
  v43.receiver = self;
  v43.super_class = (Class)DRSTaskingMessageChannel;
  v10 = [(DRSTaskingMessageChannel *)&v43 init];
  self = v10;
  if (!v10)
  {
LABEL_22:
    self = self;
    v25 = self;
    goto LABEL_23;
  }
  objc_storeStrong((id *)&v10->_config, a3);
  v11 = _Block_copy(v9);
  id processingBlock = self->_processingBlock;
  self->_id processingBlock = v11;

  id v13 = [(DRSTaskingMessageChannel *)self debugDescription];
  v14 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v13 UTF8String], 0);
  workQueue = self->_workQueue;
  self->_workQueue = v14;

  v16 = [(DRSTaskingMessageChannel *)self config];
  char v17 = [v16 isNoSubscriptionConfig];

  if (v17)
  {
LABEL_19:
    v35 = DPLogHandle_TaskingMessageChannel();
    if (os_signpost_enabled(v35))
    {
      v36 = [(DRSTaskingMessageChannel *)self config];
      v37 = [v36 debugDescription];
      *(_DWORD *)buf = 138543362;
      v45 = v37;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v35, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NewChannelInstance", "New channel instance: %{public}@", buf, 0xCu);
    }
    goto LABEL_22;
  }
  int v18 = [v7 environment];
  if (v18 == 1)
  {
    v19 = (id *)MEMORY[0x263F280C8];
  }
  else
  {
    if (v18 != 2)
    {
LABEL_24:
      v20 = DPLogHandle_TaskingMessageChannelError();
      if (!os_signpost_enabled(v20)) {
        goto LABEL_14;
      }
      int v39 = [v7 environment];
      *(_DWORD *)buf = 67109120;
      LODWORD(v45) = v39;
      v21 = "InvalidEnvironmentEnum";
      v22 = "Invalid environment enum %hhu";
      v23 = v20;
      uint32_t v24 = 8;
      goto LABEL_13;
    }
    v19 = (id *)MEMORY[0x263F280D0];
  }
  v26 = *v19;
  if (!v26) {
    goto LABEL_24;
  }
  v20 = v26;
  uint64_t v27 = [v7 channelName];
  if (v27)
  {
    v28 = (void *)v27;
    id v29 = objc_alloc(MEMORY[0x263F15718]);
    v30 = [(DRSTaskingMessageChannel *)self config];
    v31 = [v30 channelID];
    v32 = (PKPublicChannel *)[v29 initWithChannelID:v31];
    pubSubChannel = self->_pubSubChannel;
    self->_pubSubChannel = v32;

    apsEnvironmentString = self->_apsEnvironmentString;
    self->_apsEnvironmentString = (NSString *)&v20->isa;

    goto LABEL_19;
  }
  v40 = DPLogHandle_TaskingMessageChannelError();
  if (os_signpost_enabled(v40))
  {
    v41 = DRSSystemProfilePlatformStringForPlatform([v7 platform]);
    v42 = +[DRSCloudChannelConfig stringForChannelType:](DRSCloudChannelConfig, "stringForChannelType:", [v7 type]);
    *(_DWORD *)buf = 138543618;
    v45 = v41;
    __int16 v46 = 2114;
    v47 = v42;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v40, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidChannelConfiguration", "Failed to produce a channel name for %{public}@ %{public}@", buf, 0x16u);
  }
LABEL_14:

  v25 = 0;
LABEL_23:

  return v25;
}

- (BOOL)subscribe:(id *)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v5 = [(DRSTaskingMessageChannel *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__DRSTaskingMessageChannel_subscribe___block_invoke;
  block[3] = &unk_263FCA400;
  block[4] = self;
  block[5] = &v8;
  block[6] = a3;
  dispatch_sync(v5, block);

  LOBYTE(a3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

void __38__DRSTaskingMessageChannel_subscribe___block_invoke(uint64_t a1)
{
  v57[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) config];
  int v3 = [v2 isNoSubscriptionConfig];

  if (v3)
  {
    v4 = DPLogHandle_TaskingMessageChannelError();
    if (os_signpost_enabled(v4))
    {
      v5 = [*(id *)(a1 + 32) config];
      v6 = [v5 debugDescription];
      *(_DWORD *)buf = 138543362;
      v52 = v6;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SubscriptionIsNoOp", "Not subscribing due to config %{public}@", buf, 0xCu);

LABEL_4:
      goto LABEL_5;
    }
    goto LABEL_5;
  }
  id v7 = [*(id *)(a1 + 32) apsConnection];

  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F280F0]);
    v9 = [*(id *)(a1 + 32) apsEnvironmentString];
    uint64_t v10 = [*(id *)(a1 + 32) workQueue];
    char v11 = (void *)[v8 initWithEnvironmentName:v9 namedDelegatePort:@"com.apple.aps.diagnosticpipeline.tasking" queue:v10];
    [*(id *)(a1 + 32) setApsConnection:v11];

    v12 = [*(id *)(a1 + 32) apsConnection];

    if (!v12)
    {
      v37 = DPLogHandle_TaskingMessageChannelError();
      if (os_signpost_enabled(v37))
      {
        v38 = [*(id *)(a1 + 32) debugDescription];
        *(_DWORD *)buf = 138543362;
        v52 = v38;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v37, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "APSConnectionInitFailure", "Failed to create connection for %{public}@", buf, 0xCu);
      }
      if (*(void *)(a1 + 48))
      {
        int v39 = (void *)MEMORY[0x263F087E8];
        uint64_t v56 = *MEMORY[0x263F08320];
        v57[0] = @"APSConnection could not be initialized";
        v40 = [NSDictionary dictionaryWithObjects:v57 forKeys:&v56 count:1];
        **(void **)(a1 + 48) = [v39 errorWithDomain:@"DiagnosticRequestCloudChannelError" code:0 userInfo:v40];
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      return;
    }
    id v13 = *(void **)(a1 + 32);
    v14 = [v13 apsConnection];
    [v14 setDelegate:v13];

    v15 = [*(id *)(a1 + 32) apsConnection];
    v55 = @"com.apple.symptomsd-diag";
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
    [v15 setEnabledTopics:v16 ignoredTopics:0];
  }
  char v17 = [*(id *)(a1 + 32) apsConnection];
  id v49 = 0;
  int v18 = [v17 registeredChannelsForTopic:@"com.apple.symptomsd-diag" error:&v49];
  id v19 = v49;

  if (!v19)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v22 = v18;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v23)
    {
      uint64_t v25 = v23;
      char v44 = 0;
      uint64_t v26 = *(void *)v46;
      *(void *)&long long v24 = 138543362;
      long long v43 = v24;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v46 != v26) {
            objc_enumerationMutation(v22);
          }
          v28 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          id v29 = objc_msgSend(v28, "channelID", v43);
          v30 = [*(id *)(a1 + 32) pubSubChannel];
          v31 = [v30 channelID];
          int v32 = [v29 isEqualToString:v31];

          if (v32)
          {
            v33 = DPLogHandle_TaskingMessageChannel();
            if (os_signpost_enabled(v33))
            {
              v34 = [*(id *)(a1 + 32) debugDescription];
              *(_DWORD *)buf = v43;
              v52 = v34;
              _os_signpost_emit_with_name_impl(&dword_209E70000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AlreadySubscribedToChannel", "Already subscribed to %{public}@", buf, 0xCu);
            }
            char v44 = 1;
          }
          else
          {
            v35 = [*(id *)(a1 + 32) apsConnection];
            [v35 unsubscribeFromChannel:v28 forTopic:@"com.apple.symptomsd-diag"];

            v33 = DPLogHandle_TaskingMessageChannelError();
            if (os_signpost_enabled(v33))
            {
              v36 = [v28 channelID];
              *(_DWORD *)buf = v43;
              v52 = v36;
              _os_signpost_emit_with_name_impl(&dword_209E70000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SubscribedToUnexpectedChannel", "Subscribed to unexpected channel %{public}@. Unsubscribing", buf, 0xCu);
            }
          }
        }
        uint64_t v25 = [v22 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v25);

      if (v44) {
        goto LABEL_6;
      }
    }
    else
    {
    }
    v41 = [*(id *)(a1 + 32) apsConnection];
    v42 = [*(id *)(a1 + 32) pubSubChannel];
    [v41 subscribeToChannel:v42 forTopic:@"com.apple.symptomsd-diag"];

    v4 = DPLogHandle_TaskingMessageChannel();
    if (os_signpost_enabled(v4))
    {
      v5 = [*(id *)(a1 + 32) debugDescription];
      *(_DWORD *)buf = 138543362;
      v52 = v5;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ChannelSubscribe", "Subscribing to channel %{public}@", buf, 0xCu);
      goto LABEL_4;
    }
LABEL_5:

LABEL_6:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    return;
  }
  v20 = DPLogHandle_TaskingMessageChannelError();
  if (os_signpost_enabled(v20))
  {
    v21 = [*(id *)(a1 + 32) debugDescription];
    *(_DWORD *)buf = 138543618;
    v52 = v21;
    __int16 v53 = 2114;
    id v54 = v19;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SubscribedChannelCheckFailure", "Failed to check for subscribed channel for %{public}@ due to error: %{public}@", buf, 0x16u);
  }
  if (*(void *)(a1 + 48)) {
    **(void **)(a1 + 48) = v19;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

- (BOOL)unsubscribe:(id *)a3
{
  int v3 = self;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v4 = [(DRSTaskingMessageChannel *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__DRSTaskingMessageChannel_unsubscribe___block_invoke;
  v6[3] = &unk_263FCA2B8;
  v6[4] = v3;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __40__DRSTaskingMessageChannel_unsubscribe___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) config];
  int v3 = [v2 isNoSubscriptionConfig];

  if (!v3)
  {
    uint64_t v7 = [*(id *)(a1 + 32) apsConnection];

    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) apsConnection];
      uint64_t v9 = [*(id *)(a1 + 32) pubSubChannel];
      [v8 unsubscribeFromChannel:v9 forTopic:@"com.apple.symptomsd-diag"];

      char v10 = [*(id *)(a1 + 32) apsConnection];
      [v10 shutdown];

      char v11 = [*(id *)(a1 + 32) apsConnection];
      [v11 setDelegate:0];

      [*(id *)(a1 + 32) setApsConnection:0];
      v4 = DPLogHandle_TaskingMessageChannel();
      if (!os_signpost_enabled(v4)) {
        goto LABEL_11;
      }
      v5 = [*(id *)(a1 + 32) debugDescription];
      int v14 = 138543362;
      v15 = v5;
      v12 = "ChannelUnsubscribe";
      id v13 = "Unsubscribing from channel %{public}@";
    }
    else
    {
      v4 = DPLogHandle_TaskingMessageChannel();
      if (!os_signpost_enabled(v4)) {
        goto LABEL_11;
      }
      v5 = [*(id *)(a1 + 32) debugDescription];
      int v14 = 138543362;
      v15 = v5;
      v12 = "RedundantUnsubscribe";
      id v13 = "No APS connection for %{public}@";
    }
    _os_signpost_emit_with_name_impl(&dword_209E70000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v12, v13, (uint8_t *)&v14, 0xCu);
    goto LABEL_10;
  }
  v4 = DPLogHandle_TaskingMessageChannelError();
  if (os_signpost_enabled(v4))
  {
    v5 = [*(id *)(a1 + 32) config];
    v6 = [v5 debugDescription];
    int v14 = 138543362;
    v15 = v6;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UnsubscribeIsNoOp", "Not subscribed due to config:\n%{public}@", (uint8_t *)&v14, 0xCu);

LABEL_10:
  }
LABEL_11:

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = DPLogHandle_TaskingMessageChannel();
  if (os_signpost_enabled(v6))
  {
    uint64_t v7 = [(DRSTaskingMessageChannel *)self config];
    id v8 = [v7 channelName];
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2114;
    v12 = v8;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedPublicDeviceToken", "Received public token %{public}@ for channel name %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = DPLogHandle_TaskingMessageChannel();
  if (os_signpost_enabled(v12))
  {
    uint64_t v13 = [(DRSTaskingMessageChannel *)self config];
    int v14 = [v13 channelName];
    int v15 = 138544130;
    id v16 = v9;
    __int16 v17 = 2114;
    id v18 = v10;
    __int16 v19 = 2114;
    id v20 = v11;
    __int16 v21 = 2114;
    id v22 = v14;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedAPNSToken", "Received APNS token %{public}@ for topic: %{public}@ identifier: %{public}@ channel name: %{public}@", (uint8_t *)&v15, 0x2Au);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = DPLogHandle_TaskingMessageChannel();
  if (os_signpost_enabled(v6))
  {
    uint64_t v7 = [(DRSTaskingMessageChannel *)self debugDescription];
    id v8 = [v5 userInfo];
    int v16 = 138543618;
    __int16 v17 = v7;
    __int16 v18 = 2114;
    __int16 v19 = v8;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedMessage", "Received message on %{public}@\n%{public}@", (uint8_t *)&v16, 0x16u);
  }
  id v9 = [v5 userInfo];
  id v10 = [v9 objectForKeyedSubscript:@"tasking_payload"];

  if (!v10)
  {
    id v11 = DPLogHandle_TaskingMessageChannelError();
    if (os_signpost_enabled(v11))
    {
      v12 = [(DRSTaskingMessageChannel *)self debugDescription];
      uint64_t v13 = [v5 userInfo];
      int v16 = 138543874;
      __int16 v17 = v12;
      __int16 v18 = 2114;
      __int16 v19 = @"tasking_payload";
      __int16 v20 = 2114;
      __int16 v21 = v13;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MessageMissingPayload", "Message on %{public}@ missing %{public}@ key\n%{public}@", (uint8_t *)&v16, 0x20u);
    }
  }
  int v14 = [(DRSTaskingMessageChannel *)self processingBlock];
  int v15 = [(DRSTaskingMessageChannel *)self config];
  ((void (**)(void, void *, void *))v14)[2](v14, v10, v15);
}

- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a4;
  id v5 = DPLogHandle_TaskingMessageChannelError();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ChannelSubscriptionFailed", (const char *)&unk_209EEADD1, buf, 2u);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = DPLogHandle_TaskingMessageChannelError();
        if (os_signpost_enabled(v12))
        {
          int v13 = [v11 failureReason];
          int v14 = @"INVALID REASON. FILE A BUG AGAINST 'Apple Push Service|all'";
          if (!v13) {
            int v14 = @"Bad channel ID";
          }
          *(_DWORD *)buf = 138543362;
          __int16 v20 = v14;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ChannelSubscriptionFailure", "Failure: %{public}@", buf, 0xCu);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v8);
  }
}

- (DRSCloudChannelConfig)config
{
  return self->_config;
}

- (id)processingBlock
{
  return self->_processingBlock;
}

- (PKPublicChannel)pubSubChannel
{
  return self->_pubSubChannel;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
}

- (NSString)apsEnvironmentString
{
  return self->_apsEnvironmentString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apsEnvironmentString, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_pubSubChannel, 0);
  objc_storeStrong(&self->_processingBlock, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end