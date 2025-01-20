@interface HDWorkoutCondenserControlServer
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)_condenserWithError:(void *)a1;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_condensableWorkoutsWithCompletion:(id)a3;
- (void)remote_condenseWorkoutWithUUID:(id)a3 completion:(id)a4;
- (void)remote_condenseWorkoutsForReason:(int64_t)a3 workoutBatchLimit:(int64_t)a4 completion:(id)a5;
- (void)remote_condensedWorkoutsWithCompletion:(id)a3;
@end

@implementation HDWorkoutCondenserControlServer

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2B760] taskIdentifier];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F29930];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)_condenserWithError:(void *)a1
{
  if (a1)
  {
    v4 = [a1 profile];
    v5 = [v4 workoutCondenser];

    if (v5)
    {
      v6 = [a1 profile];
      v7 = [v6 workoutCondenser];

      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_featureUnavailableForProfileError");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (a2) {
        *a2 = v8;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _HKInitializeLogging();
    v9 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "Asked for condenser on profile other than the primary profile", v11, 2u);
    }
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (void)remote_condenseWorkoutsForReason:(int64_t)a3 workoutBatchLimit:(int64_t)a4 completion:(id)a5
{
  id v11 = 0;
  id v8 = (void (**)(id, void, id))a5;
  v9 = -[HDWorkoutCondenserControlServer _condenserWithError:](self, &v11);
  id v10 = v11;
  if (v9) {
    [v9 condenseWorkoutsForReason:a3 workoutBatchLimit:a4 completion:v8];
  }
  else {
    v8[2](v8, 0, v10);
  }
}

- (void)remote_condenseWorkoutWithUUID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t, id))a4;
  v9 = [(HDStandardTaskServer *)self profile];
  id v19 = 0;
  id v10 = +[HDDataEntity objectWithUUID:v7 encodingOptions:0 profile:v9 error:&v19];
  id v11 = v19;

  if (v10)
  {
    id v18 = 0;
    v12 = -[HDWorkoutCondenserControlServer _condenserWithError:](self, &v18);
    id v13 = v18;
    v14 = v13;
    if (v12)
    {
      id v17 = v13;
      uint64_t v15 = [v12 condenseWorkout:v10 error:&v17];
      id v16 = v17;

      v8[2](v8, v15, v16);
      v14 = v16;
    }
    else
    {
      v8[2](v8, 0, v13);
    }
  }
  else
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"No workout found with UUID %@"", v7);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8[2](v8, 0, v11);
  }
}

- (void)remote_condensedWorkoutsWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, id))a3;
  id v11 = 0;
  v5 = -[HDWorkoutCondenserControlServer _condenserWithError:](self, &v11);
  id v6 = v11;
  id v7 = v6;
  if (v5)
  {
    id v10 = v6;
    id v8 = [v5 condensedWorkoutsWithError:&v10];
    id v9 = v10;

    v4[2](v4, v8, v9);
    id v7 = v9;
  }
  else
  {
    v4[2](v4, 0, v6);
  }
}

- (void)remote_condensableWorkoutsWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, id))a3;
  id v11 = 0;
  v5 = -[HDWorkoutCondenserControlServer _condenserWithError:](self, &v11);
  id v6 = v11;
  id v7 = v6;
  if (v5)
  {
    id v10 = v6;
    id v8 = [v5 condensableWorkoutsWithError:&v10];
    id v9 = v10;

    v4[2](v4, v8, v9);
    id v7 = v9;
  }
  else
  {
    v4[2](v4, 0, v6);
  }
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B760] serverInterface];
}

- (id)remoteInterface
{
  return 0;
}

@end