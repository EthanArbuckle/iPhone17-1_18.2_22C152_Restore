@interface ACHAwardsWorkoutServer
+ (id)taskIdentifier;
- (ACHAwardsWorkoutServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (ACHWorkoutUtility)workoutUtility;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)queue;
- (id)_protectedDataAvailabilityError;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_bestDistanceForFirstPartyWorkoutsWithType:(unint64_t)a3 endingBeforeDate:(id)a4 completion:(id)a5;
- (void)remote_bestEnergyBurnedForFirstPartyWorkoutsWithType:(unint64_t)a3 endingBeforeDate:(id)a4 completion:(id)a5;
- (void)remote_mindfulMinutesForForDateInterval:(id)a3 completion:(id)a4;
- (void)remote_numberOfFirstPartyWorkoutsWithDuration:(double)a3 containedInInterval:(id)a4 completion:(id)a5;
- (void)remote_numberOfFirstPartyWorkoutsWithDuration:(double)a3 type:(unint64_t)a4 andLocation:(unint64_t)a5 containedInInterval:(id)a6 completion:(id)a7;
- (void)remote_numberOfFirstPartyWorkoutsWithDuration:(double)a3 type:(unint64_t)a4 endingOnOrBeforeDate:(id)a5 completion:(id)a6;
- (void)remote_numberOfWorkoutsWithDuration:(double)a3 containedInInterval:(id)a4 completion:(id)a5;
- (void)remote_workoutsInDateInterval:(id)a3 completion:(id)a4;
- (void)setClientQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setWorkoutUtility:(id)a3;
@end

@implementation ACHAwardsWorkoutServer

- (void)remote_numberOfFirstPartyWorkoutsWithDuration:(double)a3 containedInInterval:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(ACHAwardsWorkoutServer *)self queue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __103__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_completion___block_invoke;
  v13[3] = &unk_264516930;
  id v14 = v8;
  id v15 = v9;
  double v16 = a3;
  v13[4] = self;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __103__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) client];
  v3 = [v2 profile];
  v4 = [v3 database];
  char v5 = [v4 isProtectedDataAvailable];

  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    v7 = [v6 workoutUtility];
    uint64_t v8 = [v7 numberOfFirstPartyWorkoutsWithDuration:*(void *)(a1 + 40) containedInInterval:*(double *)(a1 + 56)];

    id v9 = [*(id *)(a1 + 32) clientQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __103__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_completion___block_invoke_3;
    v13[3] = &unk_264516908;
    v10 = (id *)v14;
    v14[0] = *(id *)(a1 + 48);
    v14[1] = v8;
    id v11 = v13;
  }
  else
  {
    id v9 = [v6 clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __103__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_completion___block_invoke_2;
    block[3] = &unk_2645168B8;
    v10 = &v16;
    id v12 = *(id *)(a1 + 48);
    block[4] = *(void *)(a1 + 32);
    id v16 = v12;
    id v11 = block;
  }
  dispatch_async(v9, v11);
}

- (ACHWorkoutUtility)workoutUtility
{
  return self->_workoutUtility;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

uint64_t __103__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 0);
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x263F234B0];
}

- (ACHAwardsWorkoutServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ACHAwardsWorkoutServer;
  id v11 = [(HDStandardTaskServer *)&v21 initWithUUID:a3 configuration:a4 client:v10 delegate:a6];
  if (v11)
  {
    id v12 = [ACHWorkoutUtility alloc];
    v13 = [v10 profile];
    uint64_t v14 = [(ACHWorkoutUtility *)v12 initWithProfile:v13];
    workoutUtility = v11->_workoutUtility;
    v11->_workoutUtility = (ACHWorkoutUtility *)v14;

    uint64_t v16 = HKCreateSerialDispatchQueue();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v16;

    uint64_t v18 = HKCreateSerialDispatchQueue();
    clientQueue = v11->_clientQueue;
    v11->_clientQueue = (OS_dispatch_queue *)v18;
  }
  return v11;
}

- (id)_protectedDataAvailabilityError
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F08320];
  v7[0] = @"Protected data unavailable";
  v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = [v2 errorWithDomain:@"com.apple.ActivityAchievements" code:-1 userInfo:v3];

  return v4;
}

- (void)remote_workoutsInDateInterval:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ACHAwardsWorkoutServer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__ACHAwardsWorkoutServer_remote_workoutsInDateInterval_completion___block_invoke;
  block[3] = &unk_2645168E0;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __67__ACHAwardsWorkoutServer_remote_workoutsInDateInterval_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) client];
  v3 = [v2 profile];
  v4 = [v3 database];
  char v5 = [v4 isProtectedDataAvailable];

  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    id v7 = [v6 workoutUtility];
    uint64_t v8 = [v7 workoutsInDateInterval:*(void *)(a1 + 40)];

    id v9 = [*(id *)(a1 + 32) clientQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __67__ACHAwardsWorkoutServer_remote_workoutsInDateInterval_completion___block_invoke_3;
    v14[3] = &unk_2645168B8;
    id v10 = *(id *)(a1 + 48);
    id v15 = v8;
    id v16 = v10;
    id v11 = v8;
    dispatch_async(v9, v14);
  }
  else
  {
    id v12 = [v6 clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__ACHAwardsWorkoutServer_remote_workoutsInDateInterval_completion___block_invoke_2;
    block[3] = &unk_2645168B8;
    id v13 = *(id *)(a1 + 48);
    block[4] = *(void *)(a1 + 32);
    id v18 = v13;
    dispatch_async(v12, block);

    id v11 = v18;
  }
}

void __67__ACHAwardsWorkoutServer_remote_workoutsInDateInterval_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _protectedDataAvailabilityError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, MEMORY[0x263EFFA68], v2);
}

uint64_t __67__ACHAwardsWorkoutServer_remote_workoutsInDateInterval_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)remote_numberOfWorkoutsWithDuration:(double)a3 containedInInterval:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ACHAwardsWorkoutServer *)self queue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __93__ACHAwardsWorkoutServer_remote_numberOfWorkoutsWithDuration_containedInInterval_completion___block_invoke;
  v13[3] = &unk_264516930;
  id v14 = v8;
  id v15 = v9;
  double v16 = a3;
  void v13[4] = self;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

void __93__ACHAwardsWorkoutServer_remote_numberOfWorkoutsWithDuration_containedInInterval_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  v3 = [v2 profile];
  v4 = [v3 database];
  char v5 = [v4 isProtectedDataAvailable];

  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    id v7 = [v6 workoutUtility];
    uint64_t v8 = [v7 numberOfWorkoutsWithDuration:*(void *)(a1 + 40) containedInInterval:*(double *)(a1 + 56)];

    id v9 = [*(id *)(a1 + 32) clientQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __93__ACHAwardsWorkoutServer_remote_numberOfWorkoutsWithDuration_containedInInterval_completion___block_invoke_3;
    v13[3] = &unk_264516908;
    id v10 = (id *)v14;
    v14[0] = *(id *)(a1 + 48);
    v14[1] = v8;
    id v11 = v13;
  }
  else
  {
    id v9 = [v6 clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __93__ACHAwardsWorkoutServer_remote_numberOfWorkoutsWithDuration_containedInInterval_completion___block_invoke_2;
    block[3] = &unk_2645168B8;
    id v10 = &v16;
    id v12 = *(id *)(a1 + 48);
    block[4] = *(void *)(a1 + 32);
    id v16 = v12;
    id v11 = block;
  }
  dispatch_async(v9, v11);
}

void __93__ACHAwardsWorkoutServer_remote_numberOfWorkoutsWithDuration_containedInInterval_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _protectedDataAvailabilityError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __93__ACHAwardsWorkoutServer_remote_numberOfWorkoutsWithDuration_containedInInterval_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 0);
}

- (void)remote_numberOfFirstPartyWorkoutsWithDuration:(double)a3 type:(unint64_t)a4 endingOnOrBeforeDate:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = [(ACHAwardsWorkoutServer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __109__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_endingOnOrBeforeDate_completion___block_invoke;
  block[3] = &unk_264516958;
  id v16 = v10;
  id v17 = v11;
  double v18 = a3;
  unint64_t v19 = a4;
  block[4] = self;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(v12, block);
}

void __109__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_endingOnOrBeforeDate_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  v3 = [v2 profile];
  v4 = [v3 database];
  char v5 = [v4 isProtectedDataAvailable];

  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    id v7 = [v6 workoutUtility];
    uint64_t v8 = [v7 numberOfFirstPartyWorkoutsWithDuration:*(void *)(a1 + 64) withType:*(void *)(a1 + 40) endingOnOrBeforeDate:*(double *)(a1 + 56)];

    id v9 = [*(id *)(a1 + 32) clientQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __109__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_endingOnOrBeforeDate_completion___block_invoke_3;
    v13[3] = &unk_264516908;
    id v10 = (id *)v14;
    v14[0] = *(id *)(a1 + 48);
    v14[1] = v8;
    id v11 = v13;
  }
  else
  {
    id v9 = [v6 clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __109__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_endingOnOrBeforeDate_completion___block_invoke_2;
    block[3] = &unk_2645168B8;
    id v10 = &v16;
    id v12 = *(id *)(a1 + 48);
    block[4] = *(void *)(a1 + 32);
    id v16 = v12;
    id v11 = block;
  }
  dispatch_async(v9, v11);
}

void __109__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_endingOnOrBeforeDate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _protectedDataAvailabilityError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __109__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_endingOnOrBeforeDate_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 0);
}

void __103__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _protectedDataAvailabilityError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)remote_numberOfFirstPartyWorkoutsWithDuration:(double)a3 type:(unint64_t)a4 andLocation:(unint64_t)a5 containedInInterval:(id)a6 completion:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  id v14 = [(ACHAwardsWorkoutServer *)self queue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __120__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_andLocation_containedInInterval_completion___block_invoke;
  v17[3] = &unk_264516980;
  id v18 = v12;
  id v19 = v13;
  double v20 = a3;
  unint64_t v21 = a4;
  unint64_t v22 = a5;
  v17[4] = self;
  id v15 = v12;
  id v16 = v13;
  dispatch_async(v14, v17);
}

void __120__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_andLocation_containedInInterval_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  v3 = [v2 profile];
  v4 = [v3 database];
  char v5 = [v4 isProtectedDataAvailable];

  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    id v7 = [v6 workoutUtility];
    uint64_t v8 = [v7 numberOfFirstPartyWorkoutsWithDuration:*(void *)(a1 + 64) withType:*(void *)(a1 + 72) andLocation:*(void *)(a1 + 40) containedInInterval:*(double *)(a1 + 56)];

    id v9 = [*(id *)(a1 + 32) clientQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __120__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_andLocation_containedInInterval_completion___block_invoke_3;
    v13[3] = &unk_264516908;
    id v10 = (id *)v14;
    v14[0] = *(id *)(a1 + 48);
    v14[1] = v8;
    id v11 = v13;
  }
  else
  {
    id v9 = [v6 clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __120__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_andLocation_containedInInterval_completion___block_invoke_2;
    block[3] = &unk_2645168B8;
    id v10 = &v16;
    id v12 = *(id *)(a1 + 48);
    block[4] = *(void *)(a1 + 32);
    id v16 = v12;
    id v11 = block;
  }
  dispatch_async(v9, v11);
}

void __120__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_andLocation_containedInInterval_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _protectedDataAvailabilityError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __120__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_andLocation_containedInInterval_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 0);
}

- (void)remote_bestEnergyBurnedForFirstPartyWorkoutsWithType:(unint64_t)a3 endingBeforeDate:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ACHAwardsWorkoutServer *)self queue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __107__ACHAwardsWorkoutServer_remote_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke;
  v13[3] = &unk_264516930;
  id v15 = v9;
  unint64_t v16 = a3;
  void v13[4] = self;
  id v14 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

void __107__ACHAwardsWorkoutServer_remote_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  v3 = [v2 profile];
  v4 = [v3 database];
  char v5 = [v4 isProtectedDataAvailable];

  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    id v7 = [v6 workoutUtility];
    id v8 = [v7 bestEnergyBurnedForFirstPartyWorkoutsWithType:*(void *)(a1 + 56) endingBeforeDate:*(void *)(a1 + 40)];

    id v9 = [*(id *)(a1 + 32) clientQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __107__ACHAwardsWorkoutServer_remote_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke_3;
    v14[3] = &unk_2645168B8;
    id v10 = *(id *)(a1 + 48);
    id v15 = v8;
    id v16 = v10;
    id v11 = v8;
    dispatch_async(v9, v14);
  }
  else
  {
    id v12 = [v6 clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __107__ACHAwardsWorkoutServer_remote_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke_2;
    block[3] = &unk_2645168B8;
    id v13 = *(id *)(a1 + 48);
    block[4] = *(void *)(a1 + 32);
    id v18 = v13;
    dispatch_async(v12, block);

    id v11 = v18;
  }
}

void __107__ACHAwardsWorkoutServer_remote_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _protectedDataAvailabilityError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __107__ACHAwardsWorkoutServer_remote_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)remote_bestDistanceForFirstPartyWorkoutsWithType:(unint64_t)a3 endingBeforeDate:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ACHAwardsWorkoutServer *)self queue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __103__ACHAwardsWorkoutServer_remote_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke;
  v13[3] = &unk_264516930;
  id v15 = v9;
  unint64_t v16 = a3;
  void v13[4] = self;
  id v14 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

void __103__ACHAwardsWorkoutServer_remote_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  v3 = [v2 profile];
  v4 = [v3 database];
  char v5 = [v4 isProtectedDataAvailable];

  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    id v7 = [v6 workoutUtility];
    id v8 = [v7 bestDistanceForFirstPartyWorkoutsWithType:*(void *)(a1 + 56) endingBeforeDate:*(void *)(a1 + 40)];

    id v9 = [*(id *)(a1 + 32) clientQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __103__ACHAwardsWorkoutServer_remote_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke_3;
    v14[3] = &unk_2645168B8;
    id v10 = *(id *)(a1 + 48);
    id v15 = v8;
    id v16 = v10;
    id v11 = v8;
    dispatch_async(v9, v14);
  }
  else
  {
    id v12 = [v6 clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __103__ACHAwardsWorkoutServer_remote_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke_2;
    block[3] = &unk_2645168B8;
    id v13 = *(id *)(a1 + 48);
    block[4] = *(void *)(a1 + 32);
    id v18 = v13;
    dispatch_async(v12, block);

    id v11 = v18;
  }
}

void __103__ACHAwardsWorkoutServer_remote_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _protectedDataAvailabilityError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __103__ACHAwardsWorkoutServer_remote_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)remote_mindfulMinutesForForDateInterval:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACHAwardsWorkoutServer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__ACHAwardsWorkoutServer_remote_mindfulMinutesForForDateInterval_completion___block_invoke;
  block[3] = &unk_2645168E0;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __77__ACHAwardsWorkoutServer_remote_mindfulMinutesForForDateInterval_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  v3 = [v2 profile];
  v4 = [v3 database];
  char v5 = [v4 isProtectedDataAvailable];

  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    id v7 = [v6 workoutUtility];
    id v8 = [v7 mindfulMinutesForForDateInterval:*(void *)(a1 + 40)];

    id v9 = [*(id *)(a1 + 32) clientQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __77__ACHAwardsWorkoutServer_remote_mindfulMinutesForForDateInterval_completion___block_invoke_3;
    v14[3] = &unk_2645168B8;
    id v10 = *(id *)(a1 + 48);
    id v15 = v8;
    id v16 = v10;
    id v11 = v8;
    dispatch_async(v9, v14);
  }
  else
  {
    id v12 = [v6 clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__ACHAwardsWorkoutServer_remote_mindfulMinutesForForDateInterval_completion___block_invoke_2;
    block[3] = &unk_2645168B8;
    id v13 = *(id *)(a1 + 48);
    block[4] = *(void *)(a1 + 32);
    id v18 = v13;
    dispatch_async(v12, block);

    id v11 = v18;
  }
}

void __77__ACHAwardsWorkoutServer_remote_mindfulMinutesForForDateInterval_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _protectedDataAvailabilityError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __77__ACHAwardsWorkoutServer_remote_mindfulMinutesForForDateInterval_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D133B78];
}

- (id)exportedInterface
{
  return (id)MEMORY[0x270F0A5C8](self, a2);
}

- (void)setWorkoutUtility:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void)setClientQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_workoutUtility, 0);
}

@end