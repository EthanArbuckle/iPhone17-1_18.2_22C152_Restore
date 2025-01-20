@interface MUISearchSenderQueryManager
+ (id)log;
- (EFFuture)senderFilterQueryFuture;
- (MUISearchSenderQueryManager)initWithSenderRepository:(id)a3;
- (void)_relevantSendersFilterQuery;
@end

@implementation MUISearchSenderQueryManager

+ (id)log
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__MUISearchSenderQueryManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (log_onceToken_13 != -1) {
    dispatch_once(&log_onceToken_13, block);
  }
  v1 = (void *)log_log_13;
  return v1;
}

void __34__MUISearchSenderQueryManager_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_13;
  log_log_13 = (uint64_t)v1;
}

- (MUISearchSenderQueryManager)initWithSenderRepository:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUISearchSenderQueryManager;
  v6 = [(MUISearchSenderQueryManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_senderRepository, a3);
    uint64_t v8 = -[MUISearchSenderQueryManager _relevantSendersFilterQuery](v7);
    senderFilterQueryFuture = v7->_senderFilterQueryFuture;
    v7->_senderFilterQueryFuture = (EFFuture *)v8;
  }
  return v7;
}

- (void)_relevantSendersFilterQuery
{
  os_log_t v1 = a1;
  if (a1)
  {
    v2 = [MEMORY[0x1E4F60E18] promise];
    id v3 = (void *)v1[1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__MUISearchSenderQueryManager__relevantSendersFilterQuery__block_invoke;
    v6[3] = &unk_1E6D13578;
    id v7 = v2;
    id v4 = v2;
    [v3 simpleAddressesForRelevantSendersWithCompletion:v6];
    os_log_t v1 = [v4 future];
  }
  return v1;
}

void __58__MUISearchSenderQueryManager__relevantSendersFilterQuery__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MUISearchSenderQueryManager log]();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      uint64_t v13 = [v5 count];
      _os_log_impl(&dword_1DDCDB000, v8, OS_LOG_TYPE_DEFAULT, "Returned %ld senders", (uint8_t *)&v12, 0xCu);
    }

    v9 = objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_34);
    v10 = *(void **)(a1 + 32);
    objc_super v11 = [v9 componentsJoinedByString:@" || "];
    [v10 finishWithResult:v11];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__MUISearchSenderQueryManager__relevantSendersFilterQuery__block_invoke_cold_1(v6, v8);
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
}

uint64_t __58__MUISearchSenderQueryManager__relevantSendersFilterQuery__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"(kMDItemAuthorEmailAddresses = '%@')", a2];
}

- (EFFuture)senderFilterQueryFuture
{
  return self->_senderFilterQueryFuture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderFilterQueryFuture, 0);
  objc_storeStrong((id *)&self->_senderRepository, 0);
}

void __58__MUISearchSenderQueryManager__relevantSendersFilterQuery__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(a1, "ef_publicDescription");
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_1DDCDB000, a2, OS_LOG_TYPE_ERROR, "Error retrieving primary senders: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end