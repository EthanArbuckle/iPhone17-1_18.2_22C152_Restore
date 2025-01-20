@interface HKDeviceQuery
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (HKDeviceQuery)initWithObjectType:(id)a3 predicate:(id)a4 resultsHandler:(id)a5;
- (id)resultsHandler;
- (void)clientRemote_deliverDevices:(id)a3 done:(BOOL)a4 reset:(BOOL)a5 query:(id)a6;
- (void)queue_deliverError:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
@end

@implementation HKDeviceQuery

- (HKDeviceQuery)initWithObjectType:(id)a3 predicate:(id)a4 resultsHandler:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HKDeviceQuery;
  v9 = [(HKQuery *)&v13 _initWithObjectType:a3 predicate:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id resultsHandler = v9->_resultsHandler;
    v9->_id resultsHandler = (id)v10;

    [(HKQuery *)v9 setShouldSuppressDataCollection:1];
  }

  return v9;
}

- (void)clientRemote_deliverDevices:(id)a3 done:(BOOL)a4 reset:(BOOL)a5 query:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = [(HKQuery *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__HKDeviceQuery_clientRemote_deliverDevices_done_reset_query___block_invoke;
  v15[3] = &unk_1E58BF240;
  BOOL v18 = a5;
  v15[4] = self;
  id v16 = v10;
  BOOL v19 = a4;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, v15);
}

void __62__HKDeviceQuery_clientRemote_deliverDevices_done_reset_query___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 152);
  if (!v2 || *(unsigned char *)(a1 + 56))
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 152);
    *(void *)(v4 + 152) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 152);
  }
  [v2 addObjectsFromArray:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 57))
  {
    id v6 = *(id *)(*(void *)(a1 + 32) + 152);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 152);
    *(void *)(v7 + 152) = 0;

    v9 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 160));
    id v10 = v9;
    if (v9)
    {
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 48);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __62__HKDeviceQuery_clientRemote_deliverDevices_done_reset_query___block_invoke_2;
      v15[3] = &unk_1E58BB9A0;
      id v13 = v9;
      uint64_t v14 = *(void *)(a1 + 32);
      id v17 = v13;
      v15[4] = v14;
      id v16 = v6;
      objc_msgSend(v11, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v12, 1, v15);
    }
  }
}

uint64_t __62__HKDeviceQuery_clientRemote_deliverDevices_done_reset_query___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  v5 = _Block_copy(self->_resultsHandler);
  if (v5)
  {
    id v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__HKDeviceQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __36__HKDeviceQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  self->_id resultsHandler = 0;
  MEMORY[0x1F41817F8]();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED31108;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKDeviceQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_clientRemote_deliverDevices_done_reset_query_, 0, 0);
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsHandler, 0);

  objc_storeStrong((id *)&self->_resultDevices, 0);
}

@end