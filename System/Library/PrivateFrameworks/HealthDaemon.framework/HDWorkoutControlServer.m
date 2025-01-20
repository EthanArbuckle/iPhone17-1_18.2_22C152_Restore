@interface HDWorkoutControlServer
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_finishAllWorkoutsWithCompletion:(id)a3;
- (void)remote_generateFakeDataForActivityType:(int64_t)a3 minutes:(double)a4 completion:(id)a5;
- (void)remote_generatePauseOrResumeRequestAllowingBackgroundRuntime:(BOOL)a3 completion:(id)a4;
@end

@implementation HDWorkoutControlServer

- (void)remote_finishAllWorkoutsWithCompletion:(id)a3
{
  workoutManager = self->_workoutManager;
  v5 = (void (**)(id, uint64_t, id))a3;
  v6 = [(HDStandardTaskServer *)self client];
  id v9 = 0;
  uint64_t v7 = [(HDWorkoutManager *)workoutManager finishAllWorkoutsForClient:v6 error:&v9];
  id v8 = v9;

  v5[2](v5, v7, v8);
}

- (void)remote_generatePauseOrResumeRequestAllowingBackgroundRuntime:(BOOL)a3 completion:(id)a4
{
}

- (void)remote_generateFakeDataForActivityType:(int64_t)a3 minutes:(double)a4 completion:(id)a5
{
  v11 = (void (**)(id, void, void *))a5;
  id v8 = [(HDStandardTaskServer *)self profile];
  id v9 = [v8 dataCollectionManager];

  if (v9)
  {
    [v9 generateFakeDataForActivityType:a3 minutes:v11 completion:a4];
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_featureUnavailableForProfileError");
    v11[2](v11, 0, v10);
  }
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v13 profile];
  v16 = [v15 workoutManager];

  if (v16)
  {
    v17 = [(HDStandardTaskServer *)[HDWorkoutControlServer alloc] initWithUUID:v11 configuration:v12 client:v13 delegate:v14];
    v18 = v16;
    workoutManager = v17->_workoutManager;
    v17->_workoutManager = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_featureUnavailableForProfileError");
    workoutManager = (HDWorkoutManager *)(id)objc_claimAutoreleasedReturnValue();
    if (workoutManager)
    {
      if (a7) {
        *a7 = workoutManager;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v17 = 0;
  }

  return v17;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E80B0](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E80A8](self, a2);
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2B770] taskIdentifier];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (void).cxx_destruct
{
}

@end