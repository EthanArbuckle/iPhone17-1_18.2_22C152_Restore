@interface HKHeartbeatSeriesQuery
+ (id)clientInterfaceProtocol;
- (HKHeartbeatSeriesQuery)initWithHeartbeatSeries:(HKHeartbeatSeriesSample *)heartbeatSeries dataHandler:(void *)dataHandler;
- (HKHeartbeatSeriesQuery)initWithHeartbeatSeries:(id)a3 bufferHandler:(id)a4;
- (void)_enumerateHeartbeatData:(id)a3 final:(BOOL)a4 handler:(id)a5;
- (void)client_deliverHeartbeats;
- (void)queue_deliverError:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
@end

@implementation HKHeartbeatSeriesQuery

- (HKHeartbeatSeriesQuery)initWithHeartbeatSeries:(HKHeartbeatSeriesSample *)heartbeatSeries dataHandler:(void *)dataHandler
{
  v7 = heartbeatSeries;
  v8 = dataHandler;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "heartbeatSeries");
    if (v9) {
      goto LABEL_3;
    }
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "dataHandler");
LABEL_3:
  v10 = +[HKSeriesType heartbeatSeriesType];
  v19.receiver = self;
  v19.super_class = (Class)HKHeartbeatSeriesQuery;
  v11 = [(HKQuery *)&v19 _initWithObjectType:v10 predicate:0];

  if (v11)
  {
    objc_initWeak(&location, v11);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__HKHeartbeatSeriesQuery_initWithHeartbeatSeries_dataHandler___block_invoke;
    aBlock[3] = &unk_1E58BFC88;
    objc_copyWeak(&v17, &location);
    id v16 = v9;
    v12 = _Block_copy(aBlock);
    id bufferHandler = v11->_bufferHandler;
    v11->_id bufferHandler = v12;

    objc_storeStrong((id *)&v11->_heartbeatSeries, heartbeatSeries);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __62__HKHeartbeatSeriesQuery_initWithHeartbeatSeries_dataHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _enumerateHeartbeatData:v7 final:a4 handler:*(void *)(a1 + 32)];
  }
  else
  {
    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
  }
}

- (HKHeartbeatSeriesQuery)initWithHeartbeatSeries:(id)a3 bufferHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "heartbeatSeries");
    if (v9) {
      goto LABEL_3;
    }
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "bufferHandler");
LABEL_3:
  v10 = +[HKSeriesType heartbeatSeriesType];
  v15.receiver = self;
  v15.super_class = (Class)HKHeartbeatSeriesQuery;
  v11 = [(HKQuery *)&v15 _initWithObjectType:v10 predicate:0];

  if (v11)
  {
    uint64_t v12 = [v9 copy];
    id bufferHandler = v11->_bufferHandler;
    v11->_id bufferHandler = (id)v12;

    objc_storeStrong((id *)&v11->_heartbeatSeries, a3);
  }

  return v11;
}

- (void)client_deliverHeartbeats
{
  v3 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__HKHeartbeatSeriesQuery_client_deliverHeartbeats__block_invoke;
  block[3] = &unk_1E58BBA00;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __50__HKHeartbeatSeriesQuery_client_deliverHeartbeats__block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 152));
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = [v3 activationUUID];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__HKHeartbeatSeriesQuery_client_deliverHeartbeats__block_invoke_2;
    v6[3] = &unk_1E58BBF10;
    id v5 = v2;
    v6[4] = *(void *)(a1 + 32);
    id v7 = v5;
    objc_msgSend(v3, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v4, 1, v6);
  }
}

void __50__HKHeartbeatSeriesQuery_client_deliverHeartbeats__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(v2 + 160) heartbeatData];
  (*(void (**)(uint64_t, uint64_t, id, uint64_t, void))(v1 + 16))(v1, v2, v3, 1, 0);
}

- (void)_enumerateHeartbeatData:(id)a3 final:(BOOL)a4 handler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void (**)(id, HKHeartbeatSeriesQuery *, BOOL, BOOL, void, __n128))a5;
  unint64_t v10 = [v8 length];
  int64_t v11 = [(HKQuery *)self deactivateCallCount];
  if (v10 >= 0x10)
  {
    int64_t v12 = v11;
    uint64_t v13 = 0;
    unint64_t v14 = v10 >> 4;
    do
    {
      if ([(HKQuery *)self deactivateCallCount] > v12) {
        break;
      }
      objc_msgSend(v8, "getBytes:range:", &v17, v13, 16);
      v15.n128_u64[0] = v17;
      BOOL v16 = !--v14 && (unint64_t)v6;
      v9[2](v9, self, v18 != 0, v16, 0, v15);
      v13 += 16;
    }
    while (v14);
  }
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EECFAD90;
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  id v5 = _Block_copy(self->_bufferHandler);
  if (v5)
  {
    BOOL v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__HKHeartbeatSeriesQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __45__HKHeartbeatSeriesQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, void))(a1[6] + 16))(a1[6], a1[4], 0, 1, a1[5]);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKHeartbeatSeriesQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id bufferHandler = self->_bufferHandler;
  self->_id bufferHandler = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeatSeries, 0);

  objc_storeStrong(&self->_bufferHandler, 0);
}

@end