@interface HKWorkoutRouteBuilder
+ (id)clientInterface;
+ (id)serverInterface;
+ (id)taskServerIdentifier;
+ (void)configureClientInterface:(id)a3;
+ (void)configureServerInterface:(id)a3;
- (HKWorkoutRouteBuilder)init;
- (HKWorkoutRouteBuilder)initWithHealthStore:(HKHealthStore *)healthStore device:(HKDevice *)device;
- (HKWorkoutRouteBuilder)initWithHealthStore:(id)a3 identifier:(id)a4 device:(id)a5 workoutBuilderID:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_resourceQueue_finishRouteWithWorkout:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)_resourceQueue_insertRouteData:(id)a3 completion:(id)a4;
- (void)addMetadata:(NSDictionary *)metadata completion:(void *)completion;
- (void)finishRouteWithWorkout:(HKWorkout *)workout metadata:(NSDictionary *)metadata completion:(void *)completion;
- (void)insertRouteData:(NSArray *)routeData completion:(void *)completion;
@end

@implementation HKWorkoutRouteBuilder

- (HKWorkoutRouteBuilder)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKWorkoutRouteBuilder)initWithHealthStore:(HKHealthStore *)healthStore device:(HKDevice *)device
{
  return [(HKWorkoutRouteBuilder *)self initWithHealthStore:healthStore identifier:0 device:device workoutBuilderID:0];
}

- (HKWorkoutRouteBuilder)initWithHealthStore:(id)a3 identifier:(id)a4 device:(id)a5 workoutBuilderID:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[HKSeriesBuilderConfiguration alloc] initWithDevice:v11 workoutBuilderID:v10];

  v17.receiver = self;
  v17.super_class = (Class)HKWorkoutRouteBuilder;
  v15 = [(HKSeriesBuilder *)&v17 _initWithHealthStore:v13 identifier:v12 configuration:v14];

  return v15;
}

- (void)insertRouteData:(NSArray *)routeData completion:(void *)completion
{
  v6 = routeData;
  v7 = completion;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__HKWorkoutRouteBuilder_insertRouteData_completion___block_invoke;
    aBlock[3] = &unk_1E58BBA50;
    aBlock[4] = self;
    id v16 = v7;
    v8 = _Block_copy(aBlock);
  }
  else
  {
    v8 = 0;
  }
  v9 = [(HKSeriesBuilder *)self resourceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HKWorkoutRouteBuilder_insertRouteData_completion___block_invoke_3;
  block[3] = &unk_1E58BBA78;
  block[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __52__HKWorkoutRouteBuilder_insertRouteData_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) completionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HKWorkoutRouteBuilder_insertRouteData_completion___block_invoke_2;
  block[3] = &unk_1E58BBA28;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __52__HKWorkoutRouteBuilder_insertRouteData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __52__HKWorkoutRouteBuilder_insertRouteData_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_insertRouteData:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_resourceQueue_insertRouteData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HKSeriesBuilder *)self resourceQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [(HKSeriesBuilder *)self retryableOperation];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__HKWorkoutRouteBuilder__resourceQueue_insertRouteData_completion___block_invoke;
  v11[3] = &unk_1E58BBDB0;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  objc_msgSend(v9, "_queue_performRetryableOperation:completion:", v11, v7);
}

void __67__HKWorkoutRouteBuilder__resourceQueue_insertRouteData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) proxyProvider];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__HKWorkoutRouteBuilder__resourceQueue_insertRouteData_completion___block_invoke_2;
  v8[3] = &unk_1E58C6750;
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__HKWorkoutRouteBuilder__resourceQueue_insertRouteData_completion___block_invoke_4;
  v6[3] = &unk_1E58BBD88;
  id v7 = v10;
  id v5 = v10;
  [v4 fetchProxyWithHandler:v8 errorHandler:v6];
}

void __67__HKWorkoutRouteBuilder__resourceQueue_insertRouteData_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__HKWorkoutRouteBuilder__resourceQueue_insertRouteData_completion___block_invoke_3;
  v4[3] = &unk_1E58BBD38;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_insertRouteData:completion:", v3, v4);
}

uint64_t __67__HKWorkoutRouteBuilder__resourceQueue_insertRouteData_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__HKWorkoutRouteBuilder__resourceQueue_insertRouteData_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addMetadata:(NSDictionary *)metadata completion:(void *)completion
{
  id v6 = metadata;
  id v7 = completion;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__HKWorkoutRouteBuilder_addMetadata_completion___block_invoke;
  aBlock[3] = &unk_1E58BBA50;
  aBlock[4] = self;
  id v16 = v7;
  id v8 = _Block_copy(aBlock);
  id v9 = [(HKSeriesBuilder *)self resourceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HKWorkoutRouteBuilder_addMetadata_completion___block_invoke_3;
  block[3] = &unk_1E58BBA78;
  void block[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __48__HKWorkoutRouteBuilder_addMetadata_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) completionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HKWorkoutRouteBuilder_addMetadata_completion___block_invoke_2;
  block[3] = &unk_1E58BBA28;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __48__HKWorkoutRouteBuilder_addMetadata_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __48__HKWorkoutRouteBuilder_addMetadata_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_addMetadata:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)finishRouteWithWorkout:(HKWorkout *)workout metadata:(NSDictionary *)metadata completion:(void *)completion
{
  id v8 = workout;
  id v9 = metadata;
  id v10 = completion;
  if (v10)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__HKWorkoutRouteBuilder_finishRouteWithWorkout_metadata_completion___block_invoke;
    aBlock[3] = &unk_1E58C6778;
    aBlock[4] = self;
    id v21 = v10;
    id v11 = _Block_copy(aBlock);
  }
  else
  {
    id v11 = &__block_literal_global_101;
  }
  char v12 = [(HKSeriesBuilder *)self resourceQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__HKWorkoutRouteBuilder_finishRouteWithWorkout_metadata_completion___block_invoke_17;
  v16[3] = &unk_1E58BBB10;
  v16[4] = self;
  objc_super v17 = v8;
  v18 = v9;
  id v19 = v11;
  id v13 = v11;
  id v14 = v9;
  v15 = v8;
  dispatch_async(v12, v16);
}

void __68__HKWorkoutRouteBuilder_finishRouteWithWorkout_metadata_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) completionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HKWorkoutRouteBuilder_finishRouteWithWorkout_metadata_completion___block_invoke_2;
  block[3] = &unk_1E58BB9A0;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __68__HKWorkoutRouteBuilder_finishRouteWithWorkout_metadata_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __68__HKWorkoutRouteBuilder_finishRouteWithWorkout_metadata_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    _HKInitializeLogging();
    uint64_t v4 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      __68__HKWorkoutRouteBuilder_finishRouteWithWorkout_metadata_completion___block_invoke_3_cold_1((uint64_t)v3, v4);
    }
  }
}

uint64_t __68__HKWorkoutRouteBuilder_finishRouteWithWorkout_metadata_completion___block_invoke_17(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_finishRouteWithWorkout:metadata:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)_resourceQueue_finishRouteWithWorkout:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HKSeriesBuilder *)self resourceQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(HKSeriesBuilder *)self proxyProvider];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__HKWorkoutRouteBuilder__resourceQueue_finishRouteWithWorkout_metadata_completion___block_invoke;
  v18[3] = &unk_1E58C67C0;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__HKWorkoutRouteBuilder__resourceQueue_finishRouteWithWorkout_metadata_completion___block_invoke_2;
  v16[3] = &unk_1E58BBD88;
  id v17 = v21;
  id v13 = v21;
  id v14 = v9;
  id v15 = v8;
  [v12 fetchProxyWithHandler:v18 errorHandler:v16];
}

uint64_t __83__HKWorkoutRouteBuilder__resourceQueue_finishRouteWithWorkout_metadata_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_finishRouteWithWorkout:metadata:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __83__HKWorkoutRouteBuilder__resourceQueue_finishRouteWithWorkout_metadata_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)taskServerIdentifier
{
  return @"HKWorkoutRouteBuilderServerIdentifier";
}

+ (id)clientInterface
{
  id v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED53810];
  [a1 configureClientInterface:v3];

  return v3;
}

+ (id)serverInterface
{
  id v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED53870];
  [a1 configureServerInterface:v3];

  return v3;
}

+ (void)configureClientInterface:(id)a3
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HKWorkoutRouteBuilder;
  objc_msgSendSuper2(&v3, sel_configureClientInterface_, a3);
}

+ (void)configureServerInterface:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKWorkoutRouteBuilder;
  id v3 = a3;
  objc_msgSendSuper2(&v6, sel_configureServerInterface_, v3);
  id v4 = (id)objc_msgSend(v3, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_insertRouteData_completion_, 0, 0, v6.receiver, v6.super_class);
  id v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureCodingClasses");
  [v3 setClasses:v5 forSelector:sel_remote_finishRouteWithWorkout_metadata_completion_ argumentIndex:1 ofReply:0];
}

- (id)exportedInterface
{
  return +[HKWorkoutRouteBuilder clientInterface];
}

- (id)remoteInterface
{
  return +[HKWorkoutRouteBuilder serverInterface];
}

void __68__HKWorkoutRouteBuilder_finishRouteWithWorkout_metadata_completion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "[routes] Couldn't finish workout route with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end