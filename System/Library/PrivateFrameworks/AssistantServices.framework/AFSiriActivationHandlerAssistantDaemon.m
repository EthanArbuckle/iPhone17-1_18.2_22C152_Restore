@interface AFSiriActivationHandlerAssistantDaemon
- (BOOL)handleContext:(id)a3 completion:(id)a4;
@end

@implementation AFSiriActivationHandlerAssistantDaemon

- (BOOL)handleContext:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = (AFSiriActivationRequest *)a3;
  id v6 = a4;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[AFSiriActivationHandlerAssistantDaemon handleContext:completion:]";
    __int16 v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  v8 = [[AFSiriActivationRequest alloc] initWithContext:v5];
  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[AFSiriActivationHandlerAssistantDaemon handleContext:completion:]";
    __int16 v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s externalRequest = %@", buf, 0x16u);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__AFSiriActivationHandlerAssistantDaemon_handleContext_completion___block_invoke;
  v12[3] = &unk_1E592B5F8;
  id v13 = v6;
  id v10 = v6;
  [(AFSiriActivationRequest *)v8 performRequestWithResultHandler:v12];

  return 1;
}

void __67__AFSiriActivationHandlerAssistantDaemon_handleContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    v7 = "-[AFSiriActivationHandlerAssistantDaemon handleContext:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s result = %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

@end