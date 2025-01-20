@interface NAFuture(HMDUtilities)
+ (id)combineAllFuturesFlatteningArrayResults:()HMDUtilities;
+ (id)combineAllFuturesIgnoringEmptyResults:()HMDUtilities;
+ (id)futureWithRetries:()HMDUtilities timeInterval:workQueue:block:;
+ (id)futureWithRetryIntervals:()HMDUtilities workQueue:block:;
- (id)hmfFuture;
@end

@implementation NAFuture(HMDUtilities)

- (id)hmfFuture
{
  id v10 = 0;
  v2 = [MEMORY[0x263F42538] futureWithPromise:&v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__NAFuture_HMDUtilities__hmfFuture__block_invoke;
  v8[3] = &unk_264A2D950;
  id v9 = v10;
  v3 = [a1 addSuccessBlock:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__NAFuture_HMDUtilities__hmfFuture__block_invoke_2;
  v6[3] = &unk_264A2F3E8;
  id v7 = v10;
  id v4 = (id)[v3 addFailureBlock:v6];

  return v2;
}

+ (id)combineAllFuturesIgnoringEmptyResults:()HMDUtilities
{
  v3 = (void *)MEMORY[0x263F58190];
  id v4 = (void *)MEMORY[0x263F581B8];
  id v5 = a3;
  v6 = [v4 immediateScheduler];
  id v7 = [v3 combineAllFutures:v5 scheduler:v6];

  v8 = [v7 flatMap:&__block_literal_global_836];

  return v8;
}

+ (id)combineAllFuturesFlatteningArrayResults:()HMDUtilities
{
  v3 = (void *)MEMORY[0x263F58190];
  id v4 = (void *)MEMORY[0x263F581B8];
  id v5 = a3;
  v6 = [v4 immediateScheduler];
  id v7 = [v3 combineAllFutures:v5 scheduler:v6];

  v8 = [v7 flatMap:&__block_literal_global_831_78478];

  return v8;
}

+ (id)futureWithRetryIntervals:()HMDUtilities workQueue:block:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x263F58190]);
  v12 = v10[2](v10, v8);
  v13 = [MEMORY[0x263F581B8] schedulerWithDispatchQueue:v9];
  v14 = [v12 reschedule:v13];

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __67__NAFuture_HMDUtilities__futureWithRetryIntervals_workQueue_block___block_invoke;
  v31[3] = &unk_264A2D950;
  id v15 = v11;
  id v32 = v15;
  id v16 = (id)[v14 addSuccessBlock:v31];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __67__NAFuture_HMDUtilities__futureWithRetryIntervals_workQueue_block___block_invoke_2;
  v25[3] = &unk_264A1CD08;
  id v26 = v8;
  id v17 = v15;
  id v27 = v17;
  id v28 = v9;
  v29 = v10;
  uint64_t v30 = a1;
  v18 = v10;
  id v19 = v9;
  id v20 = v8;
  id v21 = (id)[v14 addFailureBlock:v25];
  v22 = v29;
  id v23 = v17;

  return v23;
}

+ (id)futureWithRetries:()HMDUtilities timeInterval:workQueue:block:
{
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_alloc_init(MEMORY[0x263F58190]);
  v13 = v11[2](v11, a4);
  v14 = [MEMORY[0x263F581B8] schedulerWithDispatchQueue:v10];
  id v15 = [v13 reschedule:v14];

  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __73__NAFuture_HMDUtilities__futureWithRetries_timeInterval_workQueue_block___block_invoke;
  v32[3] = &unk_264A2D950;
  id v16 = v12;
  id v33 = v16;
  id v17 = (id)[v15 addSuccessBlock:v32];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __73__NAFuture_HMDUtilities__futureWithRetries_timeInterval_workQueue_block___block_invoke_2;
  v25[3] = &unk_264A1CCE0;
  uint64_t v29 = a4;
  id v18 = v16;
  double v30 = a2;
  id v26 = v18;
  id v27 = v10;
  uint64_t v31 = a1;
  id v28 = v11;
  id v19 = v11;
  id v20 = v10;
  id v21 = (id)[v15 addFailureBlock:v25];
  v22 = v28;
  id v23 = v18;

  return v23;
}

@end