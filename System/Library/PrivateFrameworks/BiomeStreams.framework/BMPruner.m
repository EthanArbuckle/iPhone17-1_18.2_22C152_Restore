@interface BMPruner
- (BMPruner)initWithStoreStream:(id)a3 remote:(id)a4;
- (BOOL)deleteStoreEvent:(id)a3;
- (void)deleteEventsPassingTest:(id)a3;
- (void)deleteWithPolicy:(id)a3 eventsPassingTest:(id)a4;
@end

@implementation BMPruner

- (BMPruner)initWithStoreStream:(id)a3 remote:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMPruner;
  v9 = [(BMPruner *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storeStream, a3);
    objc_storeStrong((id *)&v10->_remote, a4);
  }

  return v10;
}

- (void)deleteWithPolicy:(id)a3 eventsPassingTest:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [NSString stringWithFormat:@"com.apple.biome.deletion-policy.%@", v6];
  [v8 UTF8String];
  v9 = (void *)os_transaction_create();

  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  storeStream = self->_storeStream;
  remote = self->_remote;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__BMPruner_deleteWithPolicy_eventsPassingTest___block_invoke;
  v15[3] = &unk_1E55D6948;
  id v12 = v7;
  id v16 = v12;
  v17 = &v18;
  [(BMStoreStream *)storeStream pruneEventsOfRemote:remote withReason:2 policyID:v6 usingPredicateBlock:v15];

  v13 = (void *)MEMORY[0x1E4F4FB50];
  v14 = [(BMStoreStream *)self->_storeStream identifier];
  [v13 sendDeletionPolicyMetrics:v6 stream:v14 numDeleted:*((unsigned int *)v19 + 6) exception:0];

  _Block_object_dispose(&v18, 8);
}

uint64_t __47__BMPruner_deleteWithPolicy_eventsPassingTest___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return result;
}

- (void)deleteEventsPassingTest:(id)a3
{
}

- (BOOL)deleteStoreEvent:(id)a3
{
  return [(BMStoreStream *)self->_storeStream deleteStoreEvent:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remote, 0);

  objc_storeStrong((id *)&self->_storeStream, 0);
}

@end