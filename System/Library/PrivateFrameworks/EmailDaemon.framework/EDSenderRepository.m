@interface EDSenderRepository
+ (id)log;
- (EDSenderPersistence)senderPersistence;
- (EDSenderRepository)initWithSenderPersistence:(id)a3;
- (EFScheduler)persistenceScheduler;
- (void)simpleAddressesForRelevantSendersForSearchWithCompletionHandler:(id)a3;
@end

@implementation EDSenderRepository

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__EDSenderRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_87 != -1) {
    dispatch_once(&log_onceToken_87, block);
  }
  v2 = (void *)log_log_87;

  return v2;
}

void __25__EDSenderRepository_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_87;
  log_log_87 = (uint64_t)v1;
}

- (EDSenderRepository)initWithSenderPersistence:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EDSenderRepository;
  v6 = [(EDSenderRepository *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_senderPersistence, a3);
    uint64_t v8 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"EDSenderRepository.persistenceScheduler" qualityOfService:25];
    persistenceScheduler = v7->_persistenceScheduler;
    v7->_persistenceScheduler = (EFScheduler *)v8;
  }
  return v7;
}

- (void)simpleAddressesForRelevantSendersForSearchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(EDSenderRepository *)self persistenceScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__EDSenderRepository_simpleAddressesForRelevantSendersForSearchWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6BFFBC8;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performVoucherPreservingBlock:v7];
}

void __86__EDSenderRepository_simpleAddressesForRelevantSendersForSearchWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) senderPersistence];
  id v3 = [v2 relevantSendersForSearch];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (EDSenderPersistence)senderPersistence
{
  return self->_senderPersistence;
}

- (EFScheduler)persistenceScheduler
{
  return self->_persistenceScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceScheduler, 0);

  objc_storeStrong((id *)&self->_senderPersistence, 0);
}

@end