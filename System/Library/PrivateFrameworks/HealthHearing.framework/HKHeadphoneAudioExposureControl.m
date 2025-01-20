@interface HKHeadphoneAudioExposureControl
+ (id)taskIdentifier;
- (HKHeadphoneAudioExposureControl)initWithHealthStore:(id)a3;
- (void)fetchDoseLimitInfoWithCompletion:(id)a3;
- (void)fetchInfoWithCompletion:(id)a3;
- (void)insertQuantityWithExposure:(double)a3 duration:(double)a4 startDate:(id)a5 includesNotificationSample:(BOOL)a6 synced:(BOOL)a7 completion:(id)a8;
- (void)overrideDoseLimit:(id)a3 completion:(id)a4;
- (void)rebuildWithCompletion:(id)a3;
@end

@implementation HKHeadphoneAudioExposureControl

- (HKHeadphoneAudioExposureControl)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKHeadphoneAudioExposureControl;
  v5 = [(HKHeadphoneAudioExposureControl *)&v13 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F0A818]);
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x263F08C38] UUID];
    uint64_t v9 = [v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v9;

    [(HKProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
    v11 = v5;
  }

  return v5;
}

- (void)rebuildWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__HKHeadphoneAudioExposureControl_rebuildWithCompletion___block_invoke;
  v9[3] = &unk_2646999B0;
  id v10 = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__HKHeadphoneAudioExposureControl_rebuildWithCompletion___block_invoke_2;
  v7[3] = &unk_2646999D8;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __57__HKHeadphoneAudioExposureControl_rebuildWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_rebuildWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __57__HKHeadphoneAudioExposureControl_rebuildWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchInfoWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__HKHeadphoneAudioExposureControl_fetchInfoWithCompletion___block_invoke;
  v9[3] = &unk_2646999B0;
  id v10 = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__HKHeadphoneAudioExposureControl_fetchInfoWithCompletion___block_invoke_2;
  v7[3] = &unk_2646999D8;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __59__HKHeadphoneAudioExposureControl_fetchInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchInfoWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __59__HKHeadphoneAudioExposureControl_fetchInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)insertQuantityWithExposure:(double)a3 duration:(double)a4 startDate:(id)a5 includesNotificationSample:(BOOL)a6 synced:(BOOL)a7 completion:(id)a8
{
  id v14 = a5;
  v15 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a8];
  proxyProvider = self->_proxyProvider;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __126__HKHeadphoneAudioExposureControl_insertQuantityWithExposure_duration_startDate_includesNotificationSample_synced_completion___block_invoke;
  v21[3] = &unk_264699A00;
  double v24 = a3;
  double v25 = a4;
  id v22 = v14;
  BOOL v26 = a6;
  BOOL v27 = a7;
  id v23 = v15;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __126__HKHeadphoneAudioExposureControl_insertQuantityWithExposure_duration_startDate_includesNotificationSample_synced_completion___block_invoke_2;
  v19[3] = &unk_2646999D8;
  id v20 = v23;
  id v17 = v23;
  id v18 = v14;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v21 errorHandler:v19];
}

uint64_t __126__HKHeadphoneAudioExposureControl_insertQuantityWithExposure_duration_startDate_includesNotificationSample_synced_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_insertQuantityWithExposure:duration:startDate:includesNotificationSample:synced:completion:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __126__HKHeadphoneAudioExposureControl_insertQuantityWithExposure_duration_startDate_includesNotificationSample_synced_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchDoseLimitInfoWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__HKHeadphoneAudioExposureControl_fetchDoseLimitInfoWithCompletion___block_invoke;
  v9[3] = &unk_2646999B0;
  id v10 = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__HKHeadphoneAudioExposureControl_fetchDoseLimitInfoWithCompletion___block_invoke_2;
  v7[3] = &unk_2646999D8;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __68__HKHeadphoneAudioExposureControl_fetchDoseLimitInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchDoseLimitWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __68__HKHeadphoneAudioExposureControl_fetchDoseLimitInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)overrideDoseLimit:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64__HKHeadphoneAudioExposureControl_overrideDoseLimit_completion___block_invoke;
  v13[3] = &unk_264699A28;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__HKHeadphoneAudioExposureControl_overrideDoseLimit_completion___block_invoke_2;
  v11[3] = &unk_2646999D8;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __64__HKHeadphoneAudioExposureControl_overrideDoseLimit_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_overrideDoseLimit:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __64__HKHeadphoneAudioExposureControl_overrideDoseLimit_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
}

@end