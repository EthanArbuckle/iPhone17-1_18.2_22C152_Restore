@interface CDPPiggybackingChannel
- (BOOL)approverBackupRecordsExist;
- (CDPPiggybackingChannel)initWithContext:(id)a3;
- (id)_replyContextWithPakeData:(id)a3;
- (unint64_t)approveriCloudKeychainState;
- (void)sendPayload:(id)a3 completion:(id)a4;
@end

@implementation CDPPiggybackingChannel

- (CDPPiggybackingChannel)initWithContext:(id)a3
{
  id v5 = a3;
  v6 = [(CDPPiggybackingChannel *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (void)sendPayload:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Sending payload over piggybacking channel", buf, 2u);
  }

  v9 = [(CDPPiggybackingChannel *)self _replyContextWithPakeData:v7];

  id v10 = objc_alloc_init(MEMORY[0x263F29118]);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__CDPPiggybackingChannel_sendPayload_completion___block_invoke;
  v12[3] = &unk_264330F80;
  id v13 = v6;
  id v11 = v6;
  [v10 performCircleRequestWithContext:v9 completion:v12];
}

void __49__CDPPiggybackingChannel_sendPayload_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v9 clientErrorCode])
  {
    id v6 = _CDPStateError();
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v6 = [v9 clientInfo];
    id v7 = *(void (**)(void))(v8 + 16);
  }
  v7();
}

- (BOOL)approverBackupRecordsExist
{
  return 0;
}

- (unint64_t)approveriCloudKeychainState
{
  return 0;
}

- (id)_replyContextWithPakeData:(id)a3
{
  context = self->_context;
  id v5 = a3;
  id v6 = [(CDPContext *)context resumeContext];
  id v7 = [v6 payload];
  uint64_t v8 = [v7 replyPayload];
  id v9 = [(CDPContext *)self->_context resumeContext];
  [v9 setPayload:v8];

  id v10 = [(CDPContext *)self->_context resumeContext];
  id v11 = [v10 payload];
  [v11 setClientInfo:v5];

  v12 = self->_context;
  return (id)[(CDPContext *)v12 resumeContext];
}

- (void).cxx_destruct
{
}

@end