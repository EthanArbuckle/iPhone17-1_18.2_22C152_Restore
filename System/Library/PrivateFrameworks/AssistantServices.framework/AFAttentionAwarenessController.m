@interface AFAttentionAwarenessController
- (AFAttentionAwarenessController)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (void)requestAttentionStateWithCompletion:(id)a3;
@end

@implementation AFAttentionAwarenessController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_attentionQueue, 0);
  objc_storeStrong((id *)&self->_attentionClient, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)requestAttentionStateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    attentionQueue = self->_attentionQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__AFAttentionAwarenessController_requestAttentionStateWithCompletion___block_invoke;
    v7[3] = &unk_1E592C6E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(attentionQueue, v7);
  }
}

void __70__AFAttentionAwarenessController_requestAttentionStateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[AFAttentionAwarenessController requestAttentionStateWithCompletion:]_block_invoke";
    _os_log_debug_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEBUG, "%s #attention awareness start", buf, 0xCu);
  }
  v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v25 = 0;
  char v4 = [v3 resumeWithError:&v25];
  id v5 = v25;
  if ((v4 & 1) == 0)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[AFAttentionAwarenessController requestAttentionStateWithCompletion:]_block_invoke";
      __int16 v28 = 2112;
      id v29 = v5;
      _os_log_debug_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_DEBUG, "%s #attention awareness sync resumeWithError failed: %@", buf, 0x16u);
    }
  }
  v7 = *(void **)(*(void *)(a1 + 32) + 8);
  id v23 = 0;
  id v24 = 0;
  int v8 = [v7 pollForAttentionWithTimeout:&v24 event:&v23 error:0.5];
  id v9 = v24;
  id v10 = v23;
  v11 = (void *)AFSiriLogContextConnection;
  BOOL v12 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v12)
    {
      v18 = v11;
      v19 = [v10 debugDescription];
      *(_DWORD *)buf = 136315650;
      v27 = "-[AFAttentionAwarenessController requestAttentionStateWithCompletion:]_block_invoke";
      __int16 v28 = 2112;
      id v29 = v9;
      __int16 v30 = 2112;
      v31 = v19;
      _os_log_debug_impl(&dword_19CF1D000, v18, OS_LOG_TYPE_DEBUG, "%s #attention sync awareness state event: %@, error: %@", buf, 0x20u);
    }
    v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (v12)
    {
      v20 = v11;
      v21 = [v10 debugDescription];
      *(_DWORD *)buf = 136315394;
      v27 = "-[AFAttentionAwarenessController requestAttentionStateWithCompletion:]_block_invoke";
      __int16 v28 = 2112;
      id v29 = v21;
      _os_log_debug_impl(&dword_19CF1D000, v20, OS_LOG_TYPE_DEBUG, "%s #attention sync awareness error: %@", buf, 0x16u);
    }
    v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v13();
  v14 = *(void **)(*(void *)(a1 + 32) + 8);
  id v22 = 0;
  char v15 = [v14 suspendWithError:&v22];
  id v16 = v22;
  if ((v15 & 1) == 0)
  {
    v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[AFAttentionAwarenessController requestAttentionStateWithCompletion:]_block_invoke";
      __int16 v28 = 2112;
      id v29 = v16;
      _os_log_debug_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_DEBUG, "%s #attention sync suspendWithError failed: %@", buf, 0x16u);
    }
  }
}

- (AFAttentionAwarenessController)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AFAttentionAwarenessController;
  id v5 = [(AFAttentionAwarenessController *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    id v8 = objc_alloc_init((Class)getAWAttentionAwarenessConfigurationClass());
    [v8 setIdentifier:@"com.apple.siri.AFAttentionAwarenessController"];
    [v8 setEventMask:128];
    id v9 = (AWAttentionAwarenessClient *)objc_alloc_init((Class)getAWAttentionAwarenessClientClass());
    attentionClient = v5->_attentionClient;
    v5->_attentionClient = v9;

    [(AWAttentionAwarenessClient *)v5->_attentionClient setConfiguration:v8];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    BOOL v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v13 = dispatch_queue_create((const char *)attention_awareness_queue_label, v12);
    attentionQueue = v5->_attentionQueue;
    v5->_attentionQueue = (OS_dispatch_queue *)v13;
  }
  return v5;
}

@end