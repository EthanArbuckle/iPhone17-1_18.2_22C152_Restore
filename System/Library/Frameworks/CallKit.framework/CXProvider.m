@interface CXProvider
+ (CXProvider)allocWithZone:(_NSZone *)a3;
+ (void)reportNewIncomingVoIPPushPayload:(NSDictionary *)dictionaryPayload completion:(void *)completion;
- (BOOL)requiresProxyingAVAudioSessionState;
- (CXAbstractProvider)abstractProvider;
- (CXAbstractProviderDelegate)delegate;
- (CXFeatures)featureFlags;
- (CXProvider)initWithConfiguration:(CXProviderConfiguration *)configuration;
- (CXProviderConfiguration)configuration;
- (CXProviderDelegatePrivate)privateDelegate;
- (NSArray)pendingCallActionsOfClass:(Class)callActionClass withCallUUID:(NSUUID *)callUUID;
- (NSArray)pendingTransactions;
- (OS_dispatch_queue)completionQueue;
- (OS_dispatch_queue)queue;
- (id)callProviderHostDelegate;
- (id)hostProtocolDelegate;
- (void)commitTransaction:(id)a3;
- (void)handleActionTimeout:(id)a3;
- (void)handleAudioSessionActivationStateChangedTo:(id)a3;
- (void)handleMediaServicesWereResetNotification:(id)a3;
- (void)handleMuteStatusChangedNotification:(id)a3;
- (void)invalidate;
- (void)performAction:(id)a3;
- (void)performCompletionBlock:(id)a3;
- (void)registerCurrentConfiguration;
- (void)reportAudioFinishedForCallWithUUID:(id)a3;
- (void)reportCallWithUUID:(NSUUID *)UUID endedAtDate:(NSDate *)dateEnded reason:(CXCallEndedReason)endedReason;
- (void)reportCallWithUUID:(NSUUID *)UUID updated:(CXCallUpdate *)update;
- (void)reportCallWithUUID:(id)a3 changedFrequencyData:(id)a4 forDirection:(int64_t)a5;
- (void)reportCallWithUUID:(id)a3 changedMeterLevel:(float)a4 forDirection:(int64_t)a5;
- (void)reportCallWithUUID:(id)a3 crossDeviceIdentifier:(id)a4 changedBytesOfDataUsed:(int64_t)a5;
- (void)reportCallWithUUID:(id)a3 endedAtDate:(id)a4 privateReason:(int64_t)a5;
- (void)reportCallWithUUID:(id)a3 endedAtDate:(id)a4 privateReason:(int64_t)a5 failureContext:(id)a6;
- (void)reportCallWithUUID:(id)a3 failedAtDate:(id)a4 withContext:(id)a5;
- (void)reportCallWithUUID:(id)a3 receivedDTMFUpdate:(id)a4;
- (void)reportNewIncomingCallWithUUID:(NSUUID *)UUID update:(CXCallUpdate *)update completion:(void *)completion;
- (void)reportNewOutgoingCallWithUUID:(id)a3 update:(id)a4;
- (void)reportOutgoingCallWithUUID:(NSUUID *)UUID connectedAtDate:(NSDate *)dateConnected;
- (void)reportOutgoingCallWithUUID:(NSUUID *)UUID startedConnectingAtDate:(NSDate *)dateStartedConnecting;
- (void)reportOutgoingCallWithUUID:(id)a3 sentInvitationAtDate:(id)a4;
- (void)requestTransaction:(id)a3 completion:(id)a4;
- (void)setCompletionQueue:(id)a3;
- (void)setConfiguration:(CXProviderConfiguration *)configuration;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)queue;
@end

@implementation CXProvider

+ (CXProvider)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (CXProvider *)+[CXProvider allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___CXProvider;
    return (CXProvider *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (CXProvider)initWithConfiguration:(CXProviderConfiguration *)configuration
{
  v4 = configuration;
  v15.receiver = self;
  v15.super_class = (Class)CXProvider;
  v5 = [(CXProvider *)&v15 init];
  if (v5)
  {
    if (!v4) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider initWithConfiguration:]", @"configuration" format];
    }
    objc_super v6 = objc_alloc_init(CXAbstractProvider);
    abstractProvider = v5->_abstractProvider;
    v5->_abstractProvider = v6;

    [(CXAbstractProvider *)v5->_abstractProvider setInternalActionDelegate:v5];
    [(CXAbstractProvider *)v5->_abstractProvider setConnectionInterruptionHandler:&__block_literal_global_9];
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.callkit.callprovider.completion", v8);
    completionQueue = v5->_completionQueue;
    v5->_completionQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [(CXProviderConfiguration *)v4 copy];
    v12 = v5->_configuration;
    v5->_configuration = (CXProviderConfiguration *)v11;

    if ([(CXProvider *)v5 requiresProxyingAVAudioSessionState])
    {
      v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 addObserver:v5 selector:sel_handleMediaServicesWereResetNotification_ name:*MEMORY[0x1E4F15048] object:0];
    }
  }

  return v5;
}

void __36__CXProvider_initWithConfiguration___block_invoke()
{
  v0 = [MEMORY[0x1E4F153E0] sharedInstance];
  id v6 = 0;
  int v1 = [v0 setInterruptionPriority:0 error:&v6];
  id v2 = v6;

  v3 = CXDefaultLog();
  v4 = v3;
  if (v1)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "Successfully reset audio session interruption priority to Normal", v5, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __36__CXProvider_initWithConfiguration___block_invoke_cold_1((uint64_t)v2, v4);
  }
}

- (BOOL)requiresProxyingAVAudioSessionState
{
  return 0;
}

- (id)callProviderHostDelegate
{
  id v2 = [(CXProvider *)self hostProtocolDelegate];
  if ([v2 conformsToProtocol:&unk_1EFC38168]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (CXAbstractProviderDelegate)delegate
{
  id v2 = [(CXProvider *)self abstractProvider];
  v3 = [v2 delegate];

  if ([v3 conformsToProtocol:&unk_1EFC47990]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (CXProviderDelegatePrivate)privateDelegate
{
  id v2 = [(CXProvider *)self abstractProvider];
  v3 = [v2 delegate];

  if ([v3 conformsToProtocol:&unk_1EFC4A038]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (CXProviderConfiguration)configuration
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  v3 = [(CXProvider *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__CXProvider_configuration__block_invoke;
  v6[3] = &unk_1E5CADEA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CXProviderConfiguration *)v4;
}

uint64_t __27__CXProvider_configuration__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)setConfiguration:(CXProviderConfiguration *)configuration
{
  id v4 = configuration;
  int v5 = dyld_program_sdk_at_least();
  if (!v4 && v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider setConfiguration:]", @"configuration" format];
  }
  id v6 = [(CXProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__CXProvider_setConfiguration___block_invoke;
  block[3] = &unk_1E5CADC68;
  block[4] = self;
  uint64_t v9 = v4;
  uint64_t v7 = v4;
  dispatch_async(v6, block);
}

uint64_t __31__CXProvider_setConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v9 = 138412546;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that configuration was set to %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v5 = [*(id *)(a1 + 40) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v5;

  return [*(id *)(a1 + 32) registerCurrentConfiguration];
}

- (NSArray)pendingCallActionsOfClass:(Class)callActionClass withCallUUID:(NSUUID *)callUUID
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = callUUID;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  if ([(objc_class *)callActionClass isSubclassOfClass:objc_opt_class()])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = [(CXProvider *)self pendingTransactions];
    uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v22)
    {
      uint64_t v21 = *(void *)v29;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = v8;
          int v9 = *(void **)(*((void *)&v28 + 1) + 8 * v8);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v10 = [v9 actions];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v25;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v25 != v13) {
                  objc_enumerationMutation(v10);
                }
                objc_super v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
                if (objc_opt_isKindOfClass())
                {
                  v16 = [v15 callUUID];
                  int v17 = [v16 isEqual:v6];

                  if (v17) {
                    [v7 addObject:v15];
                  }
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v12);
          }

          uint64_t v8 = v23 + 1;
        }
        while (v23 + 1 != v22);
        uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v22);
    }
  }
  v18 = (void *)[v7 copy];

  return (NSArray *)v18;
}

- (void)reportNewIncomingCallWithUUID:(NSUUID *)UUID update:(CXCallUpdate *)update completion:(void *)completion
{
  uint64_t v8 = UUID;
  int v9 = update;
  uint64_t v10 = completion;
  if (dyld_program_sdk_at_least())
  {
    if (v8)
    {
      if (v9) {
        goto LABEL_4;
      }
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportNewIncomingCallWithUUID:update:completion:]", @"UUID" format];
      if (v9)
      {
LABEL_4:
        if (v10) {
          goto LABEL_5;
        }
LABEL_8:
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportNewIncomingCallWithUUID:update:completion:]", @"completion" format];
        goto LABEL_5;
      }
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportNewIncomingCallWithUUID:update:completion:]", @"update" format];
    if (v10) {
      goto LABEL_5;
    }
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:*MEMORY[0x1E4F39AC0] object:0];

  uint64_t v12 = [(CXProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__CXProvider_reportNewIncomingCallWithUUID_update_completion___block_invoke;
  block[3] = &unk_1E5CADE60;
  block[4] = self;
  int v17 = v8;
  v18 = v9;
  id v19 = v10;
  id v13 = v10;
  v14 = v9;
  objc_super v15 = v8;
  dispatch_async(v12, block);
}

void __62__CXProvider_reportNewIncomingCallWithUUID_update_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) UUIDString];
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was asked to report a new incoming call with UUID: %@ update: %@", buf, 0x20u);
  }
  uint64_t v6 = [*(id *)(a1 + 32) callProviderHostDelegate];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__CXProvider_reportNewIncomingCallWithUUID_update_completion___block_invoke_158;
  v9[3] = &unk_1E5CAE458;
  v9[4] = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 56);
  [v6 reportNewIncomingCallWithUUID:v7 update:v8 reply:v9];
}

void __62__CXProvider_reportNewIncomingCallWithUUID_update_completion___block_invoke_158(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__CXProvider_reportNewIncomingCallWithUUID_update_completion___block_invoke_2;
  v7[3] = &unk_1E5CAE430;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 performCompletionBlock:v7];
}

uint64_t __62__CXProvider_reportNewIncomingCallWithUUID_update_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)reportCallWithUUID:(NSUUID *)UUID updated:(CXCallUpdate *)update
{
  id v6 = UUID;
  uint64_t v7 = update;
  if (dyld_program_sdk_at_least())
  {
    if (v6)
    {
      if (v7) {
        goto LABEL_4;
      }
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportCallWithUUID:updated:]", @"UUID" format];
      if (v7) {
        goto LABEL_4;
      }
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportCallWithUUID:updated:]", @"update" format];
  }
LABEL_4:
  id v8 = [(CXProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CXProvider_reportCallWithUUID_updated___block_invoke;
  block[3] = &unk_1E5CADD08;
  block[4] = self;
  uint64_t v12 = v6;
  __int16 v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __41__CXProvider_reportCallWithUUID_updated___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) UUIDString];
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    id v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was asked to report that call with UUID %@ updated with update %@", (uint8_t *)&v7, 0x20u);
  }
  id v6 = [*(id *)(a1 + 32) callProviderHostDelegate];
  [v6 reportCallWithUUID:*(void *)(a1 + 40) updated:*(void *)(a1 + 48)];
}

- (void)reportCallWithUUID:(NSUUID *)UUID endedAtDate:(NSDate *)dateEnded reason:(CXCallEndedReason)endedReason
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = UUID;
  __int16 v9 = dateEnded;
  int v10 = dyld_program_sdk_at_least();
  if (!v8 && v10) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportCallWithUUID:endedAtDate:reason:]", @"UUID" format];
  }
  __int16 v11 = CXDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(NSUUID *)v8 UUIDString];
    *(_DWORD *)buf = 138413058;
    __int16 v15 = self;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2048;
    CXCallEndedReason v21 = endedReason;
    _os_log_impl(&dword_1A6E3A000, v11, OS_LOG_TYPE_DEFAULT, "Provider %@ was asked to report that call with UUID %@ ended at date %@ with reason %ld", buf, 0x2Au);
  }
  if ((unint64_t)(endedReason - 1) >= 5) {
    CXCallEndedReason v13 = -1;
  }
  else {
    CXCallEndedReason v13 = endedReason;
  }
  [(CXProvider *)self reportCallWithUUID:v8 endedAtDate:v9 privateReason:v13];
}

- (void)reportCallWithUUID:(id)a3 endedAtDate:(id)a4 privateReason:(int64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = dyld_program_sdk_at_least();
  if (!v8 && v10) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportCallWithUUID:endedAtDate:privateReason:]", @"UUID" format];
  }
  __int16 v11 = CXDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v8 UUIDString];
    *(_DWORD *)buf = 138413058;
    v14 = self;
    __int16 v15 = 2112;
    __int16 v16 = v12;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2048;
    int64_t v20 = a5;
    _os_log_impl(&dword_1A6E3A000, v11, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that call with UUID %@ ended at date %@ with private reason %ld", buf, 0x2Au);
  }
  [(CXProvider *)self reportCallWithUUID:v8 endedAtDate:v9 privateReason:a5 failureContext:0];
}

- (void)reportCallWithUUID:(id)a3 failedAtDate:(id)a4 withContext:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (dyld_program_sdk_at_least())
  {
    if (v8)
    {
      if (v10) {
        goto LABEL_4;
      }
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportCallWithUUID:failedAtDate:withContext:]", @"UUID" format];
      if (v10) {
        goto LABEL_4;
      }
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportCallWithUUID:failedAtDate:withContext:]", @"failureContext" format];
  }
LABEL_4:
  __int16 v11 = CXDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v8 UUIDString];
    *(_DWORD *)buf = 138413058;
    v14 = self;
    __int16 v15 = 2112;
    __int16 v16 = v12;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl(&dword_1A6E3A000, v11, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that call with UUID %@ failed at date %@ with context %@", buf, 0x2Au);
  }
  [(CXProvider *)self reportCallWithUUID:v8 endedAtDate:v9 privateReason:1 failureContext:v10];
}

- (void)reportCallWithUUID:(id)a3 endedAtDate:(id)a4 privateReason:(int64_t)a5 failureContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  int v13 = dyld_program_sdk_at_least();
  if (!v10 && v13) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportCallWithUUID:endedAtDate:privateReason:failureContext:]", @"UUID" format];
  }
  v14 = [(CXProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__CXProvider_reportCallWithUUID_endedAtDate_privateReason_failureContext___block_invoke;
  block[3] = &unk_1E5CAE068;
  block[4] = self;
  id v19 = v10;
  id v21 = v12;
  int64_t v22 = a5;
  id v20 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  dispatch_async(v14, block);
}

void __74__CXProvider_reportCallWithUUID_endedAtDate_privateReason_failureContext___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) UUIDString];
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 48);
    int v9 = 138413314;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that call with UUID %@ ended at date %@ with private reason %ld and failure context %@", (uint8_t *)&v9, 0x34u);
  }
  id v8 = [*(id *)(a1 + 32) callProviderHostDelegate];
  [v8 reportCallWithUUID:*(void *)(a1 + 40) endedAtDate:*(void *)(a1 + 48) privateReason:*(void *)(a1 + 64) failureContext:*(void *)(a1 + 56)];
}

- (void)reportAudioFinishedForCallWithUUID:(id)a3
{
  id v4 = a3;
  int v5 = dyld_program_sdk_at_least();
  if (!v4 && v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportAudioFinishedForCallWithUUID:]", @"UUID" format];
  }
  uint64_t v6 = [(CXProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CXProvider_reportAudioFinishedForCallWithUUID___block_invoke;
  block[3] = &unk_1E5CADC68;
  block[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, block);
}

void __49__CXProvider_reportAudioFinishedForCallWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) UUIDString];
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that call with UUID %@ finished audio", (uint8_t *)&v6, 0x16u);
  }
  int v5 = [*(id *)(a1 + 32) callProviderHostDelegate];
  [v5 reportAudioFinishedForCallWithUUID:*(void *)(a1 + 40)];
}

- (void)reportOutgoingCallWithUUID:(id)a3 sentInvitationAtDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = dyld_program_sdk_at_least();
  if (!v6 && v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportOutgoingCallWithUUID:sentInvitationAtDate:]", @"UUID" format];
  }
  id v9 = [(CXProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__CXProvider_reportOutgoingCallWithUUID_sentInvitationAtDate___block_invoke;
  block[3] = &unk_1E5CADD08;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __62__CXProvider_reportOutgoingCallWithUUID_sentInvitationAtDate___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) UUIDString];
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    id v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that outgoing call with UUID %@ sent invitation at date %@", (uint8_t *)&v7, 0x20u);
  }
  id v6 = [*(id *)(a1 + 32) callProviderHostDelegate];
  [v6 reportOutgoingCallWithUUID:*(void *)(a1 + 40) sentInvitationAtDate:*(void *)(a1 + 48)];
}

- (void)reportCallWithUUID:(id)a3 changedFrequencyData:(id)a4 forDirection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = dyld_program_sdk_at_least();
  if (!v8 && v10) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportCallWithUUID:changedFrequencyData:forDirection:]", @"UUID" format];
  }
  __int16 v11 = [(CXProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__CXProvider_reportCallWithUUID_changedFrequencyData_forDirection___block_invoke;
  block[3] = &unk_1E5CAE508;
  block[4] = self;
  id v15 = v8;
  id v16 = v9;
  int64_t v17 = a5;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, block);
}

void __67__CXProvider_reportCallWithUUID_changedFrequencyData_forDirection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callProviderHostDelegate];
  [v2 reportCallWithUUID:*(void *)(a1 + 40) changedFrequencyData:*(void *)(a1 + 48) forDirection:*(void *)(a1 + 56)];
}

- (void)reportCallWithUUID:(id)a3 changedMeterLevel:(float)a4 forDirection:(int64_t)a5
{
  id v8 = a3;
  int v9 = dyld_program_sdk_at_least();
  if (!v8 && v9) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportCallWithUUID:changedMeterLevel:forDirection:]", @"UUID" format];
  }
  int v10 = [(CXProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CXProvider_reportCallWithUUID_changedMeterLevel_forDirection___block_invoke;
  block[3] = &unk_1E5CAE530;
  block[4] = self;
  id v13 = v8;
  float v15 = a4;
  int64_t v14 = a5;
  id v11 = v8;
  dispatch_async(v10, block);
}

void __64__CXProvider_reportCallWithUUID_changedMeterLevel_forDirection___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) callProviderHostDelegate];
  LODWORD(v2) = *(_DWORD *)(a1 + 56);
  [v3 reportCallWithUUID:*(void *)(a1 + 40) changedMeterLevel:*(void *)(a1 + 48) forDirection:v2];
}

- (void)reportCallWithUUID:(id)a3 crossDeviceIdentifier:(id)a4 changedBytesOfDataUsed:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (dyld_program_sdk_at_least())
  {
    if (v8)
    {
      if (v9) {
        goto LABEL_4;
      }
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportCallWithUUID:crossDeviceIdentifier:changedBytesOfDataUsed:]", @"UUID" format];
      if (v9) {
        goto LABEL_4;
      }
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportCallWithUUID:crossDeviceIdentifier:changedBytesOfDataUsed:]", @"crossDeviceIdentifier" format];
  }
LABEL_4:
  int v10 = [(CXProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__CXProvider_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed___block_invoke;
  block[3] = &unk_1E5CAE508;
  block[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);
}

void __78__CXProvider_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) UUIDString];
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    int v8 = 138413058;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    id v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that call with UUID %@ and cross device identifier %@ changed bytes of data used %ld", (uint8_t *)&v8, 0x2Au);
  }
  int v7 = [*(id *)(a1 + 32) callProviderHostDelegate];
  [v7 reportCallWithUUID:*(void *)(a1 + 40) crossDeviceIdentifier:*(void *)(a1 + 48) changedBytesOfDataUsed:*(void *)(a1 + 56)];
}

- (void)reportOutgoingCallWithUUID:(NSUUID *)UUID startedConnectingAtDate:(NSDate *)dateStartedConnecting
{
  uint64_t v6 = UUID;
  int v7 = dateStartedConnecting;
  int v8 = dyld_program_sdk_at_least();
  if (!v6 && v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportOutgoingCallWithUUID:startedConnectingAtDate:]", @"UUID" format];
  }
  uint64_t v9 = [(CXProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CXProvider_reportOutgoingCallWithUUID_startedConnectingAtDate___block_invoke;
  block[3] = &unk_1E5CADD08;
  block[4] = self;
  uint64_t v13 = v6;
  __int16 v14 = v7;
  __int16 v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __65__CXProvider_reportOutgoingCallWithUUID_startedConnectingAtDate___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) UUIDString];
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    __int16 v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that outgoing call with UUID %@ started connecting at date %@", (uint8_t *)&v7, 0x20u);
  }
  uint64_t v6 = [*(id *)(a1 + 32) callProviderHostDelegate];
  [v6 reportOutgoingCallWithUUID:*(void *)(a1 + 40) startedConnectingAtDate:*(void *)(a1 + 48)];
}

- (void)reportOutgoingCallWithUUID:(NSUUID *)UUID connectedAtDate:(NSDate *)dateConnected
{
  uint64_t v6 = UUID;
  int v7 = dateConnected;
  int v8 = dyld_program_sdk_at_least();
  if (!v6 && v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportOutgoingCallWithUUID:connectedAtDate:]", @"UUID" format];
  }
  __int16 v9 = [(CXProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CXProvider_reportOutgoingCallWithUUID_connectedAtDate___block_invoke;
  block[3] = &unk_1E5CADD08;
  block[4] = self;
  uint64_t v13 = v6;
  __int16 v14 = v7;
  __int16 v10 = v7;
  __int16 v11 = v6;
  dispatch_async(v9, block);
}

void __57__CXProvider_reportOutgoingCallWithUUID_connectedAtDate___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) UUIDString];
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    __int16 v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that outgoing call with UUID %@ connected at date %@", (uint8_t *)&v7, 0x20u);
  }
  uint64_t v6 = [*(id *)(a1 + 32) callProviderHostDelegate];
  [v6 reportOutgoingCallWithUUID:*(void *)(a1 + 40) connectedAtDate:*(void *)(a1 + 48)];
}

- (void)reportNewOutgoingCallWithUUID:(id)a3 update:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CXProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CXProvider_reportNewOutgoingCallWithUUID_update___block_invoke;
  block[3] = &unk_1E5CADD08;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __51__CXProvider_reportNewOutgoingCallWithUUID_update___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) UUIDString];
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that outgoing call with UUID %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = [*(id *)(a1 + 32) callProviderHostDelegate];
  [v5 reportNewOutgoingCallWithUUID:*(void *)(a1 + 40) update:*(void *)(a1 + 48)];
}

- (void)requestTransaction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dyld_program_sdk_at_least())
  {
    if (v6)
    {
      if (v7) {
        goto LABEL_4;
      }
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider requestTransaction:completion:]", @"transaction" format];
      if (v7) {
        goto LABEL_4;
      }
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider requestTransaction:completion:]", @"completion" format];
  }
LABEL_4:
  __int16 v8 = [(CXProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CXProvider_requestTransaction_completion___block_invoke;
  block[3] = &unk_1E5CADDA0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __44__CXProvider_requestTransaction_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ requested transaction %@", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) callProviderHostDelegate];
  [v5 requestTransaction:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)reportCallWithUUID:(id)a3 receivedDTMFUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = v7;
  if (!v6)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportCallWithUUID:receivedDTMFUpdate:]", @"UUID" format];
    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProvider reportCallWithUUID:receivedDTMFUpdate:]", @"dtmfUpdate" format];
    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = [(CXProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CXProvider_reportCallWithUUID_receivedDTMFUpdate___block_invoke;
  block[3] = &unk_1E5CADD08;
  block[4] = self;
  id v13 = v8;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  dispatch_async(v9, block);
}

void __52__CXProvider_reportCallWithUUID_receivedDTMFUpdate___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 48) UUIDString];
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified receivedDTMFUpdate %@ from call with UUID %@", (uint8_t *)&v7, 0x20u);
  }
  id v6 = [*(id *)(a1 + 32) callProviderHostDelegate];
  [v6 reportCallWithUUID:*(void *)(a1 + 48) receivedDTMFUpdate:*(void *)(a1 + 40)];
}

- (CXFeatures)featureFlags
{
  featureFlags = self->_featureFlags;
  if (!featureFlags)
  {
    uint64_t v4 = objc_alloc_init(CXFeatures);
    uint64_t v5 = self->_featureFlags;
    self->_featureFlags = v4;

    featureFlags = self->_featureFlags;
  }

  return featureFlags;
}

- (OS_dispatch_queue)queue
{
  double v2 = [(CXProvider *)self abstractProvider];
  uint64_t v3 = [v2 queue];

  return (OS_dispatch_queue *)v3;
}

- (void)registerCurrentConfiguration
{
  uint64_t v3 = [(CXProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CXProvider_registerCurrentConfiguration__block_invoke;
  block[3] = &unk_1E5CADD30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __42__CXProvider_registerCurrentConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  if ([*(id *)(a1 + 32) requiresProxyingAVAudioSessionState])
  {
    uint64_t v3 = [MEMORY[0x1E4F153E0] sharedInstance];
    objc_msgSend(v2, "setAudioSessionID:", objc_msgSend(v3, "opaqueSessionID"));

    uint64_t v4 = [*(id *)(a1 + 32) featureFlags];
    int v5 = [v4 callManagementMuteControl];

    if (v5)
    {
      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *MEMORY[0x1E4F14F30];
      __int16 v9 = [MEMORY[0x1E4F15340] sharedInstance];
      [v6 addObserver:v7 selector:sel_handleMuteStatusChangedNotification_ name:v8 object:v9];
    }
  }
  uint64_t v10 = CXDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v2;
    _os_log_impl(&dword_1A6E3A000, v10, OS_LOG_TYPE_DEFAULT, "Registering configuration %@", (uint8_t *)&v13, 0xCu);
  }

  __int16 v11 = [*(id *)(a1 + 32) callProviderHostDelegate];
  id v12 = (void *)[v2 copy];
  [v11 registerWithConfiguration:v12];
}

- (void)handleMuteStatusChangedNotification:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "Handling notification %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)performCompletionBlock:(id)a3
{
  id v4 = a3;
  int v5 = [(CXProvider *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__CXProvider_performCompletionBlock___block_invoke;
  v7[3] = &unk_1E5CADD78;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __37__CXProvider_performCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) abstractProvider];
  id v3 = [v2 delegateQueue];
  id v4 = v3;
  if (v3)
  {
    int v5 = v3;
  }
  else
  {
    int v5 = [*(id *)(a1 + 32) completionQueue];
  }
  queue = v5;

  dispatch_async(queue, *(dispatch_block_t *)(a1 + 40));
}

- (id)hostProtocolDelegate
{
  return 0;
}

- (void)performAction:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(CXProvider *)self abstractProvider];
  id v6 = [v5 delegateQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [(CXProvider *)self delegate];
  id v8 = [(CXProvider *)self privateDelegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v7 provider:self performStartCallAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performStartCallAction_);
      int v12 = 138412290;
      int v13 = v11;
LABEL_103:
      _os_log_impl(&dword_1A6E3A000, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Delegate does not respond to %@. Action will not be performed", (uint8_t *)&v12, 0xCu);

      goto LABEL_104;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v7 provider:self performAnswerCallAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performAnswerCallAction_);
      int v12 = 138412290;
      int v13 = v11;
      goto LABEL_103;
    }
LABEL_104:

    goto LABEL_105;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v7 provider:self performEndCallAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performEndCallAction_);
      int v12 = 138412290;
      int v13 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v7 provider:self performSetHeldCallAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performSetHeldCallAction_);
      int v12 = 138412290;
      int v13 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v7 provider:self performSetMutedCallAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performSetMutedCallAction_);
      int v12 = 138412290;
      int v13 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v7 provider:self performSetGroupCallAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performSetGroupCallAction_);
      int v12 = 138412290;
      int v13 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v7 provider:self performPlayDTMFCallAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performPlayDTMFCallAction_);
      int v12 = 138412290;
      int v13 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v8 provider:self performSendMMIOrUSSDCodeAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performSendMMIOrUSSDCodeAction_);
      int v12 = 138412290;
      int v13 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v8 provider:self performJoinCallAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performJoinCallAction_);
      int v12 = 138412290;
      int v13 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v8 provider:self performSetTTYTypeCallAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performSetTTYTypeCallAction_);
      int v12 = 138412290;
      int v13 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v8 provider:self performSetSendingVideoCallAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performSetSendingVideoCallAction_);
      int v12 = 138412290;
      int v13 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v8 provider:self performSetRelayingCallAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performSetRelayingCallAction_);
      int v12 = 138412290;
      int v13 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v8 provider:self performSetScreeningCallAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performSetScreeningCallAction_);
      int v12 = 138412290;
      int v13 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v8 provider:self performSetAllowUplinkAudioInjectionAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performSetAllowUplinkAudioInjectionAction_);
      int v12 = 138412290;
      int v13 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v8 provider:self performPullCallAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performPullCallAction_);
      int v12 = 138412290;
      int v13 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v8 provider:self performSetVideoPresentationSizeCallAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performSetVideoPresentationSizeCallAction_);
      int v12 = 138412290;
      int v13 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v8 provider:self performSetVideoPresentationStateCallAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performSetVideoPresentationStateCallAction_);
      int v12 = 138412290;
      int v13 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v8 provider:self performSetSharingScreenCallAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performSetSharingScreenCallAction_);
      int v12 = 138412290;
      int v13 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v8 provider:self performSetScreenShareAttributesCallAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performSetScreenShareAttributesCallAction_);
      int v12 = 138412290;
      int v13 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v9 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v8 provider:self performEnableVideoCallAction:v9];
      goto LABEL_105;
    }
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = NSStringFromSelector(sel_provider_performEnableVideoCallAction_);
      int v12 = 138412290;
      int v13 = v11;
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  __int16 v9 = CXDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[CXProvider performAction:]((uint64_t)v4, v9);
  }
LABEL_105:
}

- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  id v6 = queue;
  id v7 = delegate;
  id v8 = [(CXProvider *)self abstractProvider];
  [v8 setDelegate:v7 queue:v6];
}

- (NSArray)pendingTransactions
{
  id v2 = [(CXProvider *)self abstractProvider];
  id v3 = [v2 pendingTransactions];

  return (NSArray *)v3;
}

- (void)invalidate
{
  id v2 = [(CXProvider *)self abstractProvider];
  [v2 invalidate];
}

- (void)commitTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(CXProvider *)self abstractProvider];
  [v5 provider:self commitTransaction:v4];
}

- (void)handleActionTimeout:(id)a3
{
  id v4 = a3;
  id v5 = [(CXProvider *)self abstractProvider];
  [v5 provider:self handleTimeoutForAction:v4];
}

- (void)handleAudioSessionActivationStateChangedTo:(id)a3
{
  id v4 = a3;
  id v5 = [(CXProvider *)self abstractProvider];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__CXProvider_handleAudioSessionActivationStateChangedTo___block_invoke;
  v7[3] = &unk_1E5CADC68;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  [v5 performDelegateCallback:v7];
}

void __57__CXProvider_handleAudioSessionActivationStateChangedTo___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) BOOLValue];
  id v3 = CXDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 67109120;
    int v12 = v2;
    _os_log_impl(&dword_1A6E3A000, v3, OS_LOG_TYPE_DEFAULT, "Notified that audio session activation state changed to: %d", (uint8_t *)&v11, 8u);
  }

  id v4 = [MEMORY[0x1E4F153E0] sharedInstance];
  id v5 = [*(id *)(a1 + 40) delegate];
  if (v2)
  {
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = CXDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 67109120;
        int v12 = 1;
        _os_log_impl(&dword_1A6E3A000, v7, OS_LOG_TYPE_DEFAULT, "Notifying delegate that audio session activation state changed to: %d", (uint8_t *)&v11, 8u);
      }

      id v8 = [*(id *)(a1 + 40) delegate];
      [v8 provider:*(void *)(a1 + 40) didActivateAudioSession:v4];
LABEL_12:
    }
  }
  else
  {
    int v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = CXDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 67109120;
        int v12 = 0;
        _os_log_impl(&dword_1A6E3A000, v10, OS_LOG_TYPE_DEFAULT, "Notifying delegate that audio session activation state changed to: %d", (uint8_t *)&v11, 8u);
      }

      id v8 = [*(id *)(a1 + 40) delegate];
      [v8 provider:*(void *)(a1 + 40) didDeactivateAudioSession:v4];
      goto LABEL_12;
    }
  }
}

- (void)handleMediaServicesWereResetNotification:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }

  [(CXProvider *)self registerCurrentConfiguration];
}

+ (void)reportNewIncomingVoIPPushPayload:(NSDictionary *)dictionaryPayload completion:(void *)completion
{
  id v5 = completion;
  int v6 = dictionaryPayload;
  id v7 = objc_alloc_init(CXNotificationServiceExtensionVoIPXPCClient);
  [(CXNotificationServiceExtensionVoIPXPCClient *)v7 requestApplicationLaunchForIncomingCall:v6 completion:v5];
}

- (CXAbstractProvider)abstractProvider
{
  return self->_abstractProvider;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_abstractProvider, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

void __36__CXProvider_initWithConfiguration___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Error resetting audio session interruption priority to Normal: %@", (uint8_t *)&v2, 0xCu);
}

- (void)performAction:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Unknown action class in transaction: %@", (uint8_t *)&v2, 0xCu);
}

@end