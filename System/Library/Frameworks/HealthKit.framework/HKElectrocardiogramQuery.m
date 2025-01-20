@interface HKElectrocardiogramQuery
+ (id)clientInterfaceProtocol;
- (HKElectrocardiogramQuery)initWithElectrocardiogram:(HKElectrocardiogram *)electrocardiogram dataHandler:(void *)dataHandler;
- (HKElectrocardiogramQuery)initWithElectrocardiogram:(id)a3 lead:(int64_t)a4 dataHandler:(id)a5;
- (HKElectrocardiogramQuery)initWithElectrocardiogram:(id)a3 sampleHandler:(id)a4;
- (void)_enumerateMeasurementsForElectrocardiogram:(id)a3 handler:(id)a4;
- (void)client_deliverData;
- (void)queue_deliverError:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
@end

@implementation HKElectrocardiogramQuery

- (HKElectrocardiogramQuery)initWithElectrocardiogram:(id)a3 lead:(int64_t)a4 dataHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__HKElectrocardiogramQuery_initWithElectrocardiogram_lead_dataHandler___block_invoke;
  v12[3] = &unk_1E58C3DB8;
  v13 = self;
  id v9 = v8;
  id v14 = v9;
  v15 = v16;
  v10 = [(HKElectrocardiogramQuery *)v13 initWithElectrocardiogram:v7 dataHandler:v12];

  _Block_object_dispose(v16, 8);
  return v10;
}

void __71__HKElectrocardiogramQuery_initWithElectrocardiogram_lead_dataHandler___block_invoke(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v8 = *(void *)(a1[4] + 160);
  id v9 = a5;
  id v10 = a2;
  v11 = [a3 quantityForLead:v8];
  v12 = +[HKUnit voltUnitWithMetricPrefix:3];
  [v11 doubleValueForUnit:v12];
  float v14 = v13;

  (*(void (**)(float))(a1[5] + 16))(v14);
  ++*(void *)(*(void *)(a1[6] + 8) + 24);
}

- (HKElectrocardiogramQuery)initWithElectrocardiogram:(HKElectrocardiogram *)electrocardiogram dataHandler:(void *)dataHandler
{
  id v7 = electrocardiogram;
  uint64_t v8 = dataHandler;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "electrocardiogram");
    if (v9) {
      goto LABEL_3;
    }
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "dataHandler");
LABEL_3:
  id v10 = +[HKObjectType electrocardiogramType];
  v17.receiver = self;
  v17.super_class = (Class)HKElectrocardiogramQuery;
  v11 = [(HKQuery *)&v17 _initWithObjectType:v10 predicate:0];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_electrocardiogram, electrocardiogram);
    v11->_lead = 1;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__HKElectrocardiogramQuery_initWithElectrocardiogram_dataHandler___block_invoke;
    aBlock[3] = &unk_1E58C3DE0;
    id v16 = v9;
    v12 = _Block_copy(aBlock);
    id sampleHandler = v11->_sampleHandler;
    v11->_id sampleHandler = v12;
  }
  return v11;
}

uint64_t __66__HKElectrocardiogramQuery_initWithElectrocardiogram_dataHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (a3) {
    return objc_msgSend(a2, "_enumerateMeasurementsForElectrocardiogram:handler:", a3, v5, a4);
  }
  else {
    return (*(uint64_t (**)(void, void *, void, uint64_t, uint64_t))(v5 + 16))(*(void *)(a1 + 32), a2, 0, 1, a4);
  }
}

- (HKElectrocardiogramQuery)initWithElectrocardiogram:(id)a3 sampleHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "electrocardiogram");
    if (v9) {
      goto LABEL_3;
    }
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "sampleHandler");
LABEL_3:
  id v10 = +[HKObjectType electrocardiogramType];
  v15.receiver = self;
  v15.super_class = (Class)HKElectrocardiogramQuery;
  v11 = [(HKQuery *)&v15 _initWithObjectType:v10 predicate:0];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_electrocardiogram, a3);
    v11->_lead = 1;
    uint64_t v12 = [v9 copy];
    id sampleHandler = v11->_sampleHandler;
    v11->_id sampleHandler = (id)v12;
  }
  return v11;
}

- (void)client_deliverData
{
  v3 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HKElectrocardiogramQuery_client_deliverData__block_invoke;
  block[3] = &unk_1E58BBA00;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __46__HKElectrocardiogramQuery_client_deliverData__block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 168));
  id v3 = *(id *)(*(void *)(a1 + 32) + 152);
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v4 activationUUID];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__HKElectrocardiogramQuery_client_deliverData__block_invoke_2;
    v8[3] = &unk_1E58BB9A0;
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = v6;
    v8[4] = v7;
    id v9 = v3;
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);
  }
}

uint64_t __46__HKElectrocardiogramQuery_client_deliverData__block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)_enumerateMeasurementsForElectrocardiogram:(id)a3 handler:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, HKElectrocardiogramQuery *, void *, BOOL, void))a4;
  if ([v13 numberOfVoltageMeasurements])
  {
    int64_t v7 = [(HKQuery *)self deactivateCallCount];
    id v8 = [v13 voltageMeasurementEnumerator];
    uint64_t v9 = [v8 nextObject];
    if (v9)
    {
      id v10 = (void *)v9;
      while (1)
      {
        v11 = (void *)MEMORY[0x19F395970]();
        if ([(HKQuery *)self deactivateCallCount] > v7) {
          break;
        }
        uint64_t v12 = [v8 nextObject];
        v6[2](v6, self, v10, v12 == 0, 0);

        id v10 = (void *)v12;
        if (!v12) {
          goto LABEL_9;
        }
      }
    }
LABEL_9:
  }
  else
  {
    v6[2](v6, self, 0, 1, 0);
  }
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED0C390;
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _Block_copy(self->_sampleHandler);
  if (v5)
  {
    id v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__HKElectrocardiogramQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __47__HKElectrocardiogramQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKElectrocardiogramQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id sampleHandler = self->_sampleHandler;
  self->_id sampleHandler = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sampleHandler, 0);

  objc_storeStrong((id *)&self->_electrocardiogram, 0);
}

@end