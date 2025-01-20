@interface ATXContextKitClient
- (id)ckClient;
- (id)level1TopicIdsForURL:(id)a3;
@end

@implementation ATXContextKitClient

- (id)ckClient
{
  v2 = self;
  objc_sync_enter(v2);
  ckClient = v2->_ckClient;
  if (!ckClient)
  {
    uint64_t v4 = [MEMORY[0x1E4F5AC38] clientWithDefaultRequestType:18];
    v5 = v2->_ckClient;
    v2->_ckClient = (CKContextClient *)v4;

    ckClient = v2->_ckClient;
  }
  v6 = ckClient;
  objc_sync_exit(v2);

  return v6;
}

- (id)level1TopicIdsForURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D25F6CC0]();
  v6 = [(ATXContextKitClient *)self ckClient];
  v7 = v6;
  if (v6)
  {
    v8 = (void *)[v6 newRequest];
    v9 = [v4 absoluteString];
    [v8 setUrl:v9];

    [v8 setIncludeHigherLevelTopics:1];
    v10 = [v8 execute];
    v11 = [v10 error];

    if (v11)
    {
      v12 = __atxlog_handle_default();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(ATXContextKitClient *)(uint64_t)self level1TopicIdsForURL:v12];
      }

      v13 = objc_opt_new();
    }
    else
    {
      v15 = [v10 level1Topics];
      v16 = v15;
      if (v15)
      {
        uint64_t v17 = objc_msgSend(v15, "_pas_mappedArrayWithTransform:", &__block_literal_global_234);
      }
      else
      {
        uint64_t v17 = objc_opt_new();
      }
      v13 = (void *)v17;
    }
  }
  else
  {
    v14 = __atxlog_handle_default();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ATXContextKitClient level1TopicIdsForURL:]((uint64_t)self, v14);
    }

    v13 = objc_opt_new();
  }

  return v13;
}

uint64_t __44__ATXContextKitClient_level1TopicIdsForURL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 topicId];
}

- (void).cxx_destruct
{
}

- (void)level1TopicIdsForURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%@ - could not initialize CKContextClient", (uint8_t *)&v5, 0xCu);
}

- (void)level1TopicIdsForURL:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  uint64_t v7 = [a2 error];
  int v8 = 138412546;
  v9 = v6;
  __int16 v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "%@ - Error from ContextKit: %@", (uint8_t *)&v8, 0x16u);
}

@end