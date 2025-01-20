@interface AISDCloudDataProtectionHelper
- (AISDCloudDataProtectionHelper)initWithStateController:(id)a3 queue:(id)a4;
- (BOOL)_onqueue_checkAvailability:(id *)a3;
- (CDPStateController)stateController;
- (OS_dispatch_queue)queue;
- (void)checkAvailabilityWithCompletionHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStateController:(id)a3;
@end

@implementation AISDCloudDataProtectionHelper

- (AISDCloudDataProtectionHelper)initWithStateController:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AISDCloudDataProtectionHelper;
  v9 = [(AISDCloudDataProtectionHelper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stateController, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

- (void)checkAvailabilityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(AISDCloudDataProtectionHelper *)self queue];
  qos_class_t v6 = qos_class_self();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__AISDCloudDataProtectionHelper_checkAvailabilityWithCompletionHandler___block_invoke;
  v10[3] = &unk_265238FE8;
  v10[4] = self;
  id v11 = v4;
  id v7 = v5;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v6, 0, v10);
  dispatch_async(v7, v9);
}

void __72__AISDCloudDataProtectionHelper_checkAvailabilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = 0;
  uint64_t v3 = objc_msgSend(v2, "_onqueue_checkAvailability:", &v6);
  id v4 = v6;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v3, v4);
  }
}

- (BOOL)_onqueue_checkAvailability:(id *)a3
{
  id v4 = [(AISDCloudDataProtectionHelper *)self stateController];
  id v11 = 0;
  char v5 = [v4 isManateeAvailable:&v11];
  id v6 = v11;

  uint64_t v7 = [v6 code];
  if ((unint64_t)(v7 + 5110) <= 8 && ((1 << (v7 - 10)) & 0x103) != 0
    || (unint64_t)(v7 + 5404) < 2)
  {

    id v6 = 0;
  }
  if (a3) {
    *a3 = v6;
  }

  return v5;
}

- (CDPStateController)stateController
{
  return self->_stateController;
}

- (void)setStateController:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
}

@end