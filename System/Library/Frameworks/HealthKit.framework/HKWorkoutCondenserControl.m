@interface HKWorkoutCondenserControl
+ (id)serverInterface;
+ (id)taskIdentifier;
- (HKWorkoutCondenserControl)initWithHealthStore:(id)a3;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)condensableWorkoutsWithCompletion:(id)a3;
- (void)condenseWorkoutWithUUID:(id)a3 completion:(id)a4;
- (void)condenseWorkoutsForReason:(int64_t)a3 workoutBatchLimit:(int64_t)a4 completion:(id)a5;
- (void)condensedWorkoutsWithCompletion:(id)a3;
@end

@implementation HKWorkoutCondenserControl

- (HKWorkoutCondenserControl)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKWorkoutCondenserControl;
  v5 = [(HKWorkoutCondenserControl *)&v12 init];
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [(HKTaskServerProxyProvider *)v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;

    [(HKProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v5;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)condenseWorkoutsForReason:(int64_t)a3 workoutBatchLimit:(int64_t)a4 completion:(id)a5
{
  v8 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__HKWorkoutCondenserControl_condenseWorkoutsForReason_workoutBatchLimit_completion___block_invoke;
  v13[3] = &unk_1E58C2448;
  int64_t v15 = a3;
  int64_t v16 = a4;
  id v14 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__HKWorkoutCondenserControl_condenseWorkoutsForReason_workoutBatchLimit_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v14;
  id v10 = v14;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __84__HKWorkoutCondenserControl_condenseWorkoutsForReason_workoutBatchLimit_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_condenseWorkoutsForReason:workoutBatchLimit:completion:", a1[5], a1[6], a1[4]);
}

uint64_t __84__HKWorkoutCondenserControl_condenseWorkoutsForReason_workoutBatchLimit_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)condenseWorkoutWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__HKWorkoutCondenserControl_condenseWorkoutWithUUID_completion___block_invoke;
  v13[3] = &unk_1E58C2470;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__HKWorkoutCondenserControl_condenseWorkoutWithUUID_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __64__HKWorkoutCondenserControl_condenseWorkoutWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_condenseWorkoutWithUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __64__HKWorkoutCondenserControl_condenseWorkoutWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)condensedWorkoutsWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__HKWorkoutCondenserControl_condensedWorkoutsWithCompletion___block_invoke;
  v9[3] = &unk_1E58C2498;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__HKWorkoutCondenserControl_condensedWorkoutsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __61__HKWorkoutCondenserControl_condensedWorkoutsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_condensedWorkoutsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __61__HKWorkoutCondenserControl_condensedWorkoutsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)condensableWorkoutsWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__HKWorkoutCondenserControl_condensableWorkoutsWithCompletion___block_invoke;
  v9[3] = &unk_1E58C2498;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HKWorkoutCondenserControl_condensableWorkoutsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __63__HKWorkoutCondenserControl_condensableWorkoutsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_condensableWorkoutsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __63__HKWorkoutCondenserControl_condensableWorkoutsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)serverInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED528B0];
}

- (id)exportedInterface
{
  return 0;
}

- (id)remoteInterface
{
  return +[HKWorkoutCondenserControl serverInterface];
}

- (void).cxx_destruct
{
}

@end