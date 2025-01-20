@interface HKWorkoutControl
+ (id)taskIdentifier;
- (HKWorkoutControl)initWithHealthStore:(id)a3;
- (void)finishAllWorkoutsWithCompletion:(id)a3;
- (void)generateFakeDataForActivityType:(int64_t)a3 minutes:(double)a4 completion:(id)a5;
- (void)generatePauseOrResumeRequest:(id)a3;
- (void)generatePauseOrResumeRequestAllowingBackgroundRuntime:(BOOL)a3 completion:(id)a4;
- (void)generateWorkoutMarkerWithCompletion:(id)a3;
@end

@implementation HKWorkoutControl

- (HKWorkoutControl)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKWorkoutControl;
  v5 = [(HKWorkoutControl *)&v12 init];
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [(HKTaskServerProxyProvider *)v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v9;

    [(HKProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v5;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)finishAllWorkoutsWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__HKWorkoutControl_finishAllWorkoutsWithCompletion___block_invoke;
  v9[3] = &unk_1E58C0CD0;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HKWorkoutControl_finishAllWorkoutsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __52__HKWorkoutControl_finishAllWorkoutsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_finishAllWorkoutsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __52__HKWorkoutControl_finishAllWorkoutsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateWorkoutMarkerWithCompletion:(id)a3
{
}

- (void)generatePauseOrResumeRequestAllowingBackgroundRuntime:(BOOL)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  _HKInitializeLogging();
  v7 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = self;
    _os_log_impl(&dword_19C023000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Pause/resume event requested.", buf, 0xCu);
  }
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__HKWorkoutControl_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke;
  v17[3] = &unk_1E58BBA50;
  v17[4] = self;
  id v18 = v6;
  uint64_t v9 = [(HKProxyProvider *)proxyProvider clientQueueActionHandlerWithCompletion:v17];
  id v10 = self->_proxyProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__HKWorkoutControl_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke_8;
  v14[3] = &unk_1E58C0CF8;
  BOOL v16 = a3;
  id v15 = v9;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__HKWorkoutControl_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke_2;
  v12[3] = &unk_1E58BBD88;
  id v13 = v15;
  id v11 = v15;
  [(HKProxyProvider *)v10 fetchProxyWithHandler:v14 errorHandler:v12];
}

void __85__HKWorkoutControl_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = HKLogWorkouts;
  BOOL v7 = os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v14 = 138543362;
      uint64_t v15 = v9;
      id v10 = "%{public}@: Generated pause or resume request";
      id v11 = v6;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_19C023000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
  }
  else if (v7)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138543618;
    uint64_t v15 = v13;
    __int16 v16 = 2114;
    id v17 = v5;
    id v10 = "%{public}@: Pause/resume event generation failed: %{public}@";
    id v11 = v6;
    uint32_t v12 = 22;
    goto LABEL_6;
  }
  (*(void (**)(void, uint64_t, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, v5, v8);
}

uint64_t __85__HKWorkoutControl_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_generatePauseOrResumeRequestAllowingBackgroundRuntime:completion:", *(unsigned __int8 *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __85__HKWorkoutControl_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateFakeDataForActivityType:(int64_t)a3 minutes:(double)a4 completion:(id)a5
{
  uint64_t v8 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__HKWorkoutControl_generateFakeDataForActivityType_minutes_completion___block_invoke;
  v13[3] = &unk_1E58C0D20;
  int64_t v15 = a3;
  double v16 = a4;
  id v14 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__HKWorkoutControl_generateFakeDataForActivityType_minutes_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v14;
  id v10 = v14;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __71__HKWorkoutControl_generateFakeDataForActivityType_minutes_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_generateFakeDataForActivityType:minutes:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32), *(double *)(a1 + 48));
}

uint64_t __71__HKWorkoutControl_generateFakeDataForActivityType_minutes_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generatePauseOrResumeRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end