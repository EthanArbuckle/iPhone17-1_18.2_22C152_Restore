@interface CXChannelProvider
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)requiresProxyingAVAudioSessionState;
- (CXAbstractProvider)abstractProvider;
- (CXChannelProvider)initWithConfiguration:(id)a3;
- (CXChannelProviderConfiguration)configuration;
- (CXChannelProviderDelegate)delegate;
- (NSArray)pendingTransactions;
- (NSXPCConnection)voipApplicationControllerConnection;
- (id)channelProviderHostDelegate;
- (id)hostProtocolDelegate;
- (void)_didReceivePushPayload:(id)a3;
- (void)_didReceivePushPayload:(id)a3 channelUUID:(id)a4 reply:(id)a5 isServiceUpdateMessage:(BOOL)a6 isHighPriority:(BOOL)a7 remainingHighPriorityBudget:(int64_t)a8;
- (void)_didReceivePushToken:(id)a3;
- (void)_ensureApplicationControllerConnection;
- (void)commitTransaction:(id)a3;
- (void)handleActionTimeout:(id)a3;
- (void)handleAudioSessionActivationStateChangedTo:(id)a3;
- (void)handleMediaServicesWereResetNotification:(id)a3;
- (void)invalidate;
- (void)performAction:(id)a3;
- (void)registerCurrentConfiguration;
- (void)reportChannelWithUUID:(id)a3 connectedAtDate:(id)a4;
- (void)reportChannelWithUUID:(id)a3 disconnectedAtDate:(id)a4 disconnectedReason:(int64_t)a5;
- (void)reportChannelWithUUID:(id)a3 updated:(id)a4;
- (void)reportChannelWithUUID:(id)a3 updated:(id)a4 completionHandler:(id)a5;
- (void)reportIncomingTransmissionEndedForChannelWithUUID:(id)a3 reason:(int64_t)a4 completionHandler:(id)a5;
- (void)reportIncomingTransmissionStartedForChannelWithUUID:(id)a3 update:(id)a4 shouldReplaceOutgoingTransmission:(BOOL)a5 completionHandler:(id)a6;
- (void)requestChannelPushToken;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setVoipApplicationControllerConnection:(id)a3;
- (void)unregisterChannelPushToken;
@end

@implementation CXChannelProvider

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return +[CXChannelProvider allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___CXChannelProvider;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (CXChannelProvider)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CXChannelProvider;
  v5 = [(CXChannelProvider *)&v12 init];
  if (v5)
  {
    if (!v4) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXChannelProvider initWithConfiguration:]", @"configuration" format];
    }
    objc_super v6 = objc_alloc_init(CXAbstractProvider);
    abstractProvider = v5->_abstractProvider;
    v5->_abstractProvider = v6;

    [(CXAbstractProvider *)v5->_abstractProvider setInternalActionDelegate:v5];
    [(CXAbstractProvider *)v5->_abstractProvider setConnectionInterruptionHandler:&__block_literal_global_12];
    uint64_t v8 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (CXChannelProviderConfiguration *)v8;

    if ([(CXChannelProvider *)v5 requiresProxyingAVAudioSessionState])
    {
      v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 addObserver:v5 selector:sel_handleMediaServicesWereResetNotification_ name:*MEMORY[0x1E4F15048] object:0];
    }
  }

  return v5;
}

void __43__CXChannelProvider_initWithConfiguration___block_invoke()
{
  v0 = [MEMORY[0x1E4F153E0] sharedInstance];
  id v6 = 0;
  int v1 = [v0 setInterruptionPriority:0 error:&v6];
  id v2 = v6;

  v3 = CXDefaultLog();
  id v4 = v3;
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

- (CXChannelProviderConfiguration)configuration
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  objc_super v12 = __Block_byref_object_dispose__6;
  id v13 = 0;
  v3 = [(CXChannelProvider *)self abstractProvider];
  id v4 = [v3 queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__CXChannelProvider_configuration__block_invoke;
  v7[3] = &unk_1E5CADEA8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (CXChannelProviderConfiguration *)v5;
}

uint64_t __34__CXChannelProvider_configuration__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(CXChannelProvider *)self abstractProvider];
  id v6 = [v5 queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__CXChannelProvider_setConfiguration___block_invoke;
  v8[3] = &unk_1E5CADC68;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __38__CXChannelProvider_setConfiguration___block_invoke(uint64_t a1)
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
  id v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v5;

  return [*(id *)(a1 + 32) registerCurrentConfiguration];
}

- (id)channelProviderHostDelegate
{
  id v2 = [(CXChannelProvider *)self hostProtocolDelegate];
  if ([v2 conformsToProtocol:&unk_1EFC44108]) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (CXChannelProviderDelegate)delegate
{
  id v2 = [(CXChannelProvider *)self abstractProvider];
  uint64_t v3 = [v2 delegate];

  if ([v3 conformsToProtocol:&unk_1EFC4A158]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)reportChannelWithUUID:(id)a3 connectedAtDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXChannelProvider reportChannelWithUUID:connectedAtDate:]", @"UUID" format];
  }
  uint64_t v8 = [(CXChannelProvider *)self abstractProvider];
  int v9 = [v8 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CXChannelProvider_reportChannelWithUUID_connectedAtDate___block_invoke;
  block[3] = &unk_1E5CADD08;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __59__CXChannelProvider_reportChannelWithUUID_connectedAtDate___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that channel with UUID %@ connected at date %@", (uint8_t *)&v7, 0x20u);
  }
  id v6 = [*(id *)(a1 + 32) channelProviderHostDelegate];
  [v6 reportChannelWithUUID:*(void *)(a1 + 40) connectedAtDate:*(void *)(a1 + 48) completionHandler:&__block_literal_global_120];
}

void __59__CXChannelProvider_reportChannelWithUUID_connectedAtDate___block_invoke_117(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = CXDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_1A6E3A000, v3, OS_LOG_TYPE_DEFAULT, "Remote host responded with error %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)reportChannelWithUUID:(id)a3 disconnectedAtDate:(id)a4 disconnectedReason:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXChannelProvider reportChannelWithUUID:disconnectedAtDate:disconnectedReason:]", @"UUID" format];
  }
  id v10 = [(CXChannelProvider *)self abstractProvider];
  __int16 v11 = [v10 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__CXChannelProvider_reportChannelWithUUID_disconnectedAtDate_disconnectedReason___block_invoke;
  block[3] = &unk_1E5CAE508;
  block[4] = self;
  id v15 = v8;
  id v16 = v9;
  int64_t v17 = a5;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, block);
}

void __81__CXChannelProvider_reportChannelWithUUID_disconnectedAtDate_disconnectedReason___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = [*(id *)(a1 + 40) UUIDString];
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    int v11 = 138413058;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    __int16 v17 = 2048;
    uint64_t v18 = v6;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that channel with UUID %@ disconnected at date %@ disconnectedReason: %ld", (uint8_t *)&v11, 0x2Au);
  }
  int v7 = [*(id *)(a1 + 32) channelProviderHostDelegate];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  [v7 reportChannelWithUUID:v8 disconnectedAtDate:v9 disconnectedReason:v10 completionHandler:&__block_literal_global_124];
}

void __81__CXChannelProvider_reportChannelWithUUID_disconnectedAtDate_disconnectedReason___block_invoke_122(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = CXDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_1A6E3A000, v3, OS_LOG_TYPE_DEFAULT, "Remote host responded with error %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)reportChannelWithUUID:(id)a3 updated:(id)a4
{
}

- (void)reportChannelWithUUID:(id)a3 updated:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXChannelProvider reportChannelWithUUID:updated:completionHandler:]", @"UUID" format];
    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXChannelProvider reportChannelWithUUID:updated:completionHandler:]", @"update" format];
    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  int v11 = [(CXChannelProvider *)self abstractProvider];
  uint64_t v12 = [v11 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__CXChannelProvider_reportChannelWithUUID_updated_completionHandler___block_invoke;
  block[3] = &unk_1E5CADE60;
  block[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, block);
}

void __69__CXChannelProvider_reportChannelWithUUID_updated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = [*(id *)(a1 + 40) UUIDString];
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    id v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that channel with UUID %@ updated with: %@", buf, 0x20u);
  }
  uint64_t v6 = [*(id *)(a1 + 32) channelProviderHostDelegate];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__CXChannelProvider_reportChannelWithUUID_updated_completionHandler___block_invoke_128;
  v10[3] = &unk_1E5CAE828;
  id v9 = *(id *)(a1 + 56);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v9;
  [v6 reportChannelWithUUID:v7 updated:v8 completionHandler:v10];
}

void __69__CXChannelProvider_reportChannelWithUUID_updated_completionHandler___block_invoke_128(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = CXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "Remote host responded with error %@", buf, 0xCu);
    }
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 32) abstractProvider];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__CXChannelProvider_reportChannelWithUUID_updated_completionHandler___block_invoke_129;
    v6[3] = &unk_1E5CAE430;
    id v8 = *(id *)(a1 + 40);
    id v7 = v3;
    [v5 performDelegateCallback:v6];
  }
}

uint64_t __69__CXChannelProvider_reportChannelWithUUID_updated_completionHandler___block_invoke_129(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)reportIncomingTransmissionEndedForChannelWithUUID:(id)a3 reason:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXChannelProvider reportIncomingTransmissionEndedForChannelWithUUID:reason:completionHandler:]", @"UUID" format];
  }
  id v10 = [(CXChannelProvider *)self abstractProvider];
  uint64_t v11 = [v10 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__CXChannelProvider_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke;
  block[3] = &unk_1E5CAE850;
  block[4] = self;
  id v15 = v8;
  id v16 = v9;
  int64_t v17 = a4;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, block);
}

void __96__CXChannelProvider_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = [*(id *)(a1 + 40) UUIDString];
    uint64_t v5 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138412802;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    id v15 = v4;
    __int16 v16 = 2048;
    uint64_t v17 = v5;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ reports channel with UUID %@ ended an incoming transmission with reason %ld", buf, 0x20u);
  }
  uint64_t v6 = [*(id *)(a1 + 32) channelProviderHostDelegate];
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__CXChannelProvider_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_130;
  v10[3] = &unk_1E5CAE828;
  id v9 = *(id *)(a1 + 48);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v9;
  [v6 reportIncomingTransmissionEndedForChannelWithUUID:v7 reason:v8 completionHandler:v10];
}

void __96__CXChannelProvider_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_130(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = CXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "Remote host responded with error %@", buf, 0xCu);
    }
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 32) abstractProvider];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __96__CXChannelProvider_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_131;
    v6[3] = &unk_1E5CAE430;
    id v8 = *(id *)(a1 + 40);
    id v7 = v3;
    [v5 performDelegateCallback:v6];
  }
}

uint64_t __96__CXChannelProvider_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_131(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)reportIncomingTransmissionStartedForChannelWithUUID:(id)a3 update:(id)a4 shouldReplaceOutgoingTransmission:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_6:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXChannelProvider reportIncomingTransmissionStartedForChannelWithUUID:update:shouldReplaceOutgoingTransmission:completionHandler:]", @"update" format];
    if (v12) {
      goto LABEL_4;
    }
LABEL_7:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXChannelProvider reportIncomingTransmissionStartedForChannelWithUUID:update:shouldReplaceOutgoingTransmission:completionHandler:]", @"completionHandler" format];
    goto LABEL_4;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXChannelProvider reportIncomingTransmissionStartedForChannelWithUUID:update:shouldReplaceOutgoingTransmission:completionHandler:]", @"UUID" format];
  if (!v11) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v12) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v13 = [(CXChannelProvider *)self abstractProvider];
  __int16 v14 = [v13 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __132__CXChannelProvider_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke;
  block[3] = &unk_1E5CAE878;
  block[4] = self;
  id v19 = v10;
  BOOL v22 = a5;
  id v20 = v11;
  id v21 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  dispatch_async(v14, block);
}

void __132__CXChannelProvider_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = [*(id *)(a1 + 40) UUIDString];
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    uint64_t v14 = v3;
    __int16 v15 = 2112;
    id v16 = v4;
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ reports channel with UUID %@ started an incoming transmission with update %@", buf, 0x20u);
  }
  uint64_t v6 = [*(id *)(a1 + 32) channelProviderHostDelegate];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __132__CXChannelProvider_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_135;
  v11[3] = &unk_1E5CAE828;
  id v10 = *(id *)(a1 + 56);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v10;
  [v6 reportIncomingTransmissionStartedForChannelWithUUID:v7 update:v8 shouldReplaceOutgoingTransmission:v9 completionHandler:v11];
}

void __132__CXChannelProvider_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_135(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = CXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "Remote host responded with error %@", buf, 0xCu);
    }
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 32) abstractProvider];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __132__CXChannelProvider_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_136;
    v6[3] = &unk_1E5CAE430;
    id v8 = *(id *)(a1 + 40);
    id v7 = v3;
    [v5 performDelegateCallback:v6];
  }
}

uint64_t __132__CXChannelProvider_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_136(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)handleMediaServicesWereResetNotification:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }

  [(CXChannelProvider *)self registerCurrentConfiguration];
}

- (id)hostProtocolDelegate
{
  return 0;
}

- (void)performAction:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CXChannelProvider *)self abstractProvider];
  int v6 = [v5 delegateQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(CXChannelProvider *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v7 provider:self performChannelJoinAction:v8];
      goto LABEL_25;
    }
    id v9 = CXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(sel_provider_performChannelJoinAction_);
      int v11 = 138412290;
      id v12 = v10;
LABEL_23:
      _os_log_impl(&dword_1A6E3A000, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Delegate does not respond to %@. Action will not be performed", (uint8_t *)&v11, 0xCu);

      goto LABEL_24;
    }
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v7 provider:self performChannelLeaveAction:v8];
      goto LABEL_25;
    }
    id v9 = CXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(sel_provider_performChannelLeaveAction_);
      int v11 = 138412290;
      id v12 = v10;
      goto LABEL_23;
    }
LABEL_24:

    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v7 provider:self performChannelTransmitStartAction:v8];
      goto LABEL_25;
    }
    id v9 = CXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(sel_provider_performChannelTransmitStartAction_);
      int v11 = 138412290;
      id v12 = v10;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v7 provider:self performChannelTransmitStopAction:v8];
      goto LABEL_25;
    }
    id v9 = CXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(sel_provider_performChannelTransmitStopAction_);
      int v11 = 138412290;
      id v12 = v10;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  uint64_t v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[CXProvider performAction:]((uint64_t)v4, v8);
  }
LABEL_25:
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CXChannelProvider *)self abstractProvider];
  [v8 _syncSetDelegate:v7 queue:v6];

  if (v7)
  {
    [(CXChannelProvider *)self _ensureApplicationControllerConnection];
    id v9 = [(CXChannelProvider *)self voipApplicationControllerConnection];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39__CXChannelProvider_setDelegate_queue___block_invoke;
    v12[3] = &unk_1E5CAE6E8;
    v12[4] = self;
    id v10 = [v9 remoteObjectProxyWithErrorHandler:v12];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__CXChannelProvider_setDelegate_queue___block_invoke_3;
    v11[3] = &unk_1E5CAE8C8;
    v11[4] = self;
    [v10 pttCheckInWithReply:v11];
  }
}

void __39__CXChannelProvider_setDelegate_queue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) abstractProvider];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__CXChannelProvider_setDelegate_queue___block_invoke_2;
  v3[3] = &unk_1E5CADD30;
  v3[4] = *(void *)(a1 + 32);
  [v2 performDelegateCallback:v3];
}

void __39__CXChannelProvider_setDelegate_queue___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 provider:*(void *)(a1 + 32) didReceiveCheckInResult:4 channelUUID:0];
  }
}

void __39__CXChannelProvider_setDelegate_queue___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) abstractProvider];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__CXChannelProvider_setDelegate_queue___block_invoke_4;
  v9[3] = &unk_1E5CAE8A0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = a2;
  v9[4] = v7;
  id v8 = v5;
  [v6 performDelegateCallback:v9];
}

void __39__CXChannelProvider_setDelegate_queue___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 provider:*(void *)(a1 + 32) didReceiveCheckInResult:*(void *)(a1 + 48) channelUUID:*(void *)(a1 + 40)];
  }
}

- (NSArray)pendingTransactions
{
  id v2 = [(CXChannelProvider *)self abstractProvider];
  char v3 = [v2 pendingTransactions];

  return (NSArray *)v3;
}

- (void)invalidate
{
  id v2 = [(CXChannelProvider *)self abstractProvider];
  [v2 invalidate];
}

- (void)commitTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(CXChannelProvider *)self abstractProvider];
  [v5 provider:self commitTransaction:v4];
}

- (void)handleActionTimeout:(id)a3
{
  id v4 = a3;
  id v5 = [(CXChannelProvider *)self abstractProvider];
  [v5 provider:self handleTimeoutForAction:v4];
}

- (BOOL)requiresProxyingAVAudioSessionState
{
  return 0;
}

- (void)handleAudioSessionActivationStateChangedTo:(id)a3
{
  id v4 = a3;
  id v5 = [(CXChannelProvider *)self abstractProvider];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__CXChannelProvider_handleAudioSessionActivationStateChangedTo___block_invoke;
  v7[3] = &unk_1E5CADC68;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 performDelegateCallback:v7];
}

void __64__CXChannelProvider_handleAudioSessionActivationStateChangedTo___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) BOOLValue];
  char v3 = CXDefaultLog();
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
      uint64_t v7 = CXDefaultLog();
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
      id v10 = CXDefaultLog();
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

- (void)registerCurrentConfiguration
{
  char v3 = [(CXChannelProvider *)self abstractProvider];
  id v4 = [v3 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CXChannelProvider_registerCurrentConfiguration__block_invoke;
  block[3] = &unk_1E5CADD30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __49__CXChannelProvider_registerCurrentConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  if ([*(id *)(a1 + 32) requiresProxyingAVAudioSessionState])
  {
    char v3 = [MEMORY[0x1E4F153E0] sharedInstance];
    objc_msgSend(v2, "setAudioSessionID:", objc_msgSend(v3, "opaqueSessionID"));
  }
  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v2;
    _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "Registering configuration %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [*(id *)(a1 + 32) channelProviderHostDelegate];
  char v6 = (void *)[v2 copy];
  [v5 registerWithConfiguration:v6 completionHandler:&__block_literal_global_151];
}

void __49__CXChannelProvider_registerCurrentConfiguration__block_invoke_149(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    char v3 = CXDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 userInfo];
      int v5 = 138412546;
      id v6 = v2;
      __int16 v7 = 2112;
      id v8 = v4;
      _os_log_impl(&dword_1A6E3A000, v3, OS_LOG_TYPE_DEFAULT, "Remote host responded with error %@, %@", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)_ensureApplicationControllerConnection
{
  char v3 = [(CXChannelProvider *)self voipApplicationControllerConnection];

  if (!v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.telephonyutilities.callservicesdaemon.ptt" options:4096];
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__CXChannelProvider__ensureApplicationControllerConnection__block_invoke;
    v9[3] = &unk_1E5CADED0;
    objc_copyWeak(&v10, &location);
    [v4 setInterruptionHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__CXChannelProvider__ensureApplicationControllerConnection__block_invoke_2;
    v7[3] = &unk_1E5CADED0;
    objc_copyWeak(&v8, &location);
    [v4 setInvalidationHandler:v7];
    int v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC4A1B8];
    [v4 setRemoteObjectInterface:v5];

    id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC41B60];
    [v4 setExportedInterface:v6];

    [v4 setExportedObject:self];
    [(CXChannelProvider *)self setVoipApplicationControllerConnection:v4];
    [v4 resume];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __59__CXChannelProvider__ensureApplicationControllerConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setVoipApplicationControllerConnection:0];
    id WeakRetained = v2;
  }
}

void __59__CXChannelProvider__ensureApplicationControllerConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setVoipApplicationControllerConnection:0];
    id WeakRetained = v2;
  }
}

- (void)requestChannelPushToken
{
  [(CXChannelProvider *)self delegate];

  [(CXChannelProvider *)self _ensureApplicationControllerConnection];
  id v4 = [(CXChannelProvider *)self voipApplicationControllerConnection];
  char v3 = [v4 remoteObjectProxy];
  [v3 pttRegister];
}

- (void)unregisterChannelPushToken
{
  [(CXChannelProvider *)self _ensureApplicationControllerConnection];
  id v4 = [(CXChannelProvider *)self voipApplicationControllerConnection];
  char v3 = [v4 remoteObjectProxy];
  [v3 pttUnregister];
}

- (void)_didReceivePushToken:(id)a3
{
  id v4 = a3;
  [(CXChannelProvider *)self delegate];

  int v5 = [(CXChannelProvider *)self abstractProvider];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__CXChannelProvider__didReceivePushToken___block_invoke;
  v7[3] = &unk_1E5CADC68;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performDelegateCallback:v7];
}

void __42__CXChannelProvider__didReceivePushToken___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 provider:*(void *)(a1 + 32) didReceiveChannelPushToken:*(void *)(a1 + 40)];
  }
}

- (void)_didReceivePushPayload:(id)a3
{
  id v4 = a3;
  [(CXChannelProvider *)self delegate];

  int v5 = [(CXChannelProvider *)self abstractProvider];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__CXChannelProvider__didReceivePushPayload___block_invoke;
  v7[3] = &unk_1E5CADC68;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performDelegateCallback:v7];
}

void __44__CXChannelProvider__didReceivePushPayload___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 provider:*(void *)(a1 + 32) didReceivePushPayload:*(void *)(a1 + 40)];
  }
}

- (void)_didReceivePushPayload:(id)a3 channelUUID:(id)a4 reply:(id)a5 isServiceUpdateMessage:(BOOL)a6 isHighPriority:(BOOL)a7 remainingHighPriorityBudget:(int64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  [(CXChannelProvider *)self delegate];

  __int16 v17 = [(CXChannelProvider *)self abstractProvider];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __128__CXChannelProvider__didReceivePushPayload_channelUUID_reply_isServiceUpdateMessage_isHighPriority_remainingHighPriorityBudget___block_invoke;
  v21[3] = &unk_1E5CAE8F0;
  v21[4] = self;
  id v22 = v14;
  id v23 = v15;
  id v24 = v16;
  BOOL v26 = a6;
  BOOL v27 = a7;
  int64_t v25 = a8;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  [v17 performDelegateCallback:v21];
}

void __128__CXChannelProvider__didReceivePushPayload_channelUUID_reply_isServiceUpdateMessage_isHighPriority_remainingHighPriorityBudget___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 provider:*(void *)(a1 + 32) didReceivePushPayload:*(void *)(a1 + 40) channelUUID:*(void *)(a1 + 48) reply:*(void *)(a1 + 56) isServiceUpdateMessage:*(unsigned __int8 *)(a1 + 72) isHighPriority:*(unsigned __int8 *)(a1 + 73) remainingHighPriorityBudget:*(void *)(a1 + 64)];
  }
}

- (CXAbstractProvider)abstractProvider
{
  return self->_abstractProvider;
}

- (NSXPCConnection)voipApplicationControllerConnection
{
  return self->_voipApplicationControllerConnection;
}

- (void)setVoipApplicationControllerConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voipApplicationControllerConnection, 0);
  objc_storeStrong((id *)&self->_abstractProvider, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end