@interface CNReputationStore
- (CNReputationContactsAdapter)contactsAdapter;
- (CNReputationCoreRecentsAdapter)coreRecentsAdapter;
- (CNReputationLogger)logger;
- (CNReputationStore)init;
- (CNReputationStore)initWithCoreRecentsAdapter:(id)a3 contactsAdapter:(id)a4 logger:(id)a5 schedulerProvider:(id)a6;
- (CNSchedulerProvider)schedulerProvider;
- (id)makeFutureForHandle:(id)a3;
- (id)reputationForHandle:(id)a3 timeout:(double)a4 error:(id *)a5;
@end

@implementation CNReputationStore

- (CNReputationStore)init
{
  v3 = objc_alloc_init(CNReputationCoreRecentsAdapter);
  v4 = objc_alloc_init(CNReputationContactsAdapter);
  v5 = objc_alloc_init(CNReputationLogger);
  v6 = [MEMORY[0x1E4F5A4F0] defaultProvider];
  v7 = [(CNReputationStore *)self initWithCoreRecentsAdapter:v3 contactsAdapter:v4 logger:v5 schedulerProvider:v6];

  return v7;
}

- (CNReputationStore)initWithCoreRecentsAdapter:(id)a3 contactsAdapter:(id)a4 logger:(id)a5 schedulerProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CNReputationStore;
  v15 = [(CNReputationStore *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_coreRecentsAdapter, a3);
    objc_storeStrong((id *)&v16->_contactsAdapter, a4);
    objc_storeStrong((id *)&v16->_logger, a5);
    objc_storeStrong((id *)&v16->_schedulerProvider, a6);
    v17 = v16;
  }

  return v16;
}

- (id)reputationForHandle:(id)a3 timeout:(double)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F5A508]);
  v10 = [(CNReputationStore *)self schedulerProvider];
  id v11 = [v10 mainThreadScheduler];
  [v11 timestamp];
  uint64_t v13 = v12;

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __55__CNReputationStore_reputationForHandle_timeout_error___block_invoke;
  v31[3] = &unk_1E56B65E8;
  v31[4] = self;
  v31[5] = v13;
  id v14 = (void *)[v31 copy];
  v15 = self;
  v16 = _Block_copy(v15);
  [v9 push:v16];

  v17 = [(CNReputationStore *)self logger];
  [v17 beginQueryForHandle:v8];

  v18 = [(CNReputationStore *)self makeFutureForHandle:v8];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __55__CNReputationStore_reputationForHandle_timeout_error___block_invoke_2;
  v29[3] = &unk_1E56B6610;
  v29[4] = self;
  id v19 = v8;
  id v30 = v19;
  [v18 addSuccessBlock:v29];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __55__CNReputationStore_reputationForHandle_timeout_error___block_invoke_3;
  v26 = &unk_1E56B6638;
  v27 = self;
  id v28 = v19;
  [v18 addFailureBlock:&v23];
  v20 = objc_msgSend(v18, "resultWithTimeout:error:", a5, a4, v23, v24, v25, v26, v27);
  if (!v20 && [MEMORY[0x1E4F5A3F0] isTimeoutError:*a5]) {
    CNSetError(a5, 1001, 0);
  }

  [v9 popAllWithHandler:&__block_literal_global_63];
  id v21 = self;

  return v20;
}

void __55__CNReputationStore_reputationForHandle_timeout_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) schedulerProvider];
  v3 = [v2 mainThreadScheduler];
  [v3 timestamp];
  double v5 = v4;

  id v6 = [*(id *)(a1 + 32) logger];
  [v6 timeToResolve:v5 - *(double *)(a1 + 40)];
}

void __55__CNReputationStore_reputationForHandle_timeout_error___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 logger];
  [v5 queryForHandle:*(void *)(a1 + 40) didFinishWithReputation:v4];
}

void __55__CNReputationStore_reputationForHandle_timeout_error___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 logger];
  [v5 queryForHandle:*(void *)(a1 + 40) didFailWithError:v4];
}

uint64_t __55__CNReputationStore_reputationForHandle_timeout_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)makeFutureForHandle:(id)a3
{
  id v4 = a3;
  id v5 = [CNReputationFutureBuilder alloc];
  id v6 = [(CNReputationStore *)self coreRecentsAdapter];
  v7 = [(CNReputationStore *)self contactsAdapter];
  id v8 = [(CNReputationStore *)self logger];
  id v9 = [(CNReputationFutureBuilder *)v5 initWithHandle:v4 coreRecentsAdapter:v6 contactsAdapter:v7 logger:v8];

  [v4 configureBuilder:v9];
  v10 = [(CNReputationFutureBuilder *)v9 build];

  return v10;
}

- (CNReputationCoreRecentsAdapter)coreRecentsAdapter
{
  return self->_coreRecentsAdapter;
}

- (CNReputationContactsAdapter)contactsAdapter
{
  return self->_contactsAdapter;
}

- (CNReputationLogger)logger
{
  return self->_logger;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_contactsAdapter, 0);

  objc_storeStrong((id *)&self->_coreRecentsAdapter, 0);
}

@end