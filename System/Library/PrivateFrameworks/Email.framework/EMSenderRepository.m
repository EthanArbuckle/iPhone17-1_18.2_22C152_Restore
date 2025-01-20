@interface EMSenderRepository
+ (id)log;
+ (id)remoteInterface;
- (id)performQuery:(id)a3 withObserver:(id)a4;
- (void)refreshQueryWithObserver:(id)a3;
- (void)simpleAddressesForRelevantSendersWithCompletion:(id)a3;
@end

@implementation EMSenderRepository

+ (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A86A98];
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__EMSenderRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_39 != -1) {
    dispatch_once(&log_onceToken_39, block);
  }
  v2 = (void *)log_log_39;
  return v2;
}

void __25__EMSenderRepository_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_39;
  log_log_39 = (uint64_t)v1;
}

- (id)performQuery:(id)a3 withObserver:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(EMSenderRepository *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EMSenderRepository performQuery:withObserver:]", "EMSenderRepository.m", 26, "0");
}

- (void)refreshQueryWithObserver:(id)a3
{
  id v5 = a3;
  [(EMSenderRepository *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EMSenderRepository refreshQueryWithObserver:]", "EMSenderRepository.m", 30, "0");
}

- (void)simpleAddressesForRelevantSendersWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(EMRepository *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__EMSenderRepository_simpleAddressesForRelevantSendersWithCompletion___block_invoke;
  v11[3] = &unk_1E63E55F0;
  v11[4] = self;
  id v6 = v4;
  id v12 = v6;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__EMSenderRepository_simpleAddressesForRelevantSendersWithCompletion___block_invoke_3;
  v9[3] = &unk_1E63E5230;
  v9[4] = self;
  id v8 = v6;
  id v10 = v8;
  [v7 simpleAddressesForRelevantSendersForSearchWithCompletionHandler:v9];
}

void __70__EMSenderRepository_simpleAddressesForRelevantSendersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) observerScheduler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__EMSenderRepository_simpleAddressesForRelevantSendersWithCompletion___block_invoke_2;
  v6[3] = &unk_1E63E36B0;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  id v7 = v5;
  [v4 performBlock:v6];
}

uint64_t __70__EMSenderRepository_simpleAddressesForRelevantSendersWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __70__EMSenderRepository_simpleAddressesForRelevantSendersWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) observerScheduler];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__EMSenderRepository_simpleAddressesForRelevantSendersWithCompletion___block_invoke_4;
  v10[3] = &unk_1E63E5208;
  id v13 = *(id *)(a1 + 40);
  id v8 = v5;
  id v11 = v8;
  id v9 = v6;
  id v12 = v9;
  [v7 performBlock:v10];
}

uint64_t __70__EMSenderRepository_simpleAddressesForRelevantSendersWithCompletion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end