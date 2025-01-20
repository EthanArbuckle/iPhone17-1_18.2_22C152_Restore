@interface HDWorkoutTrainingLoadQueryServer
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (HDWorkoutTrainingLoadQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (_HKWorkoutTrainingLoadQueryServerConfiguration)trainingLoadQueryServerConfiguration;
- (id)_queue_fetchTrainingLoadWithError:(id *)a3;
- (int64_t)trainingLoadOptions;
- (void)_queue_start;
@end

@implementation HDWorkoutTrainingLoadQueryServer

- (HDWorkoutTrainingLoadQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDWorkoutTrainingLoadQueryServer;
  v11 = [(HDQueryServer *)&v15 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    trainingLoadQueryServerConfiguration = v11->_trainingLoadQueryServerConfiguration;
    v11->_trainingLoadQueryServerConfiguration = (_HKWorkoutTrainingLoadQueryServerConfiguration *)v12;
  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (void)_queue_start
{
  v13.receiver = self;
  v13.super_class = (Class)HDWorkoutTrainingLoadQueryServer;
  [(HDQueryServer *)&v13 _queue_start];
  v3 = [(HDQueryServer *)self queryUUID];
  v4 = [(HDQueryServer *)self clientProxy];
  v5 = [MEMORY[0x1E4F2B2C0] workoutType];
  id v12 = 0;
  v6 = [(HDQueryServer *)self readAuthorizationStatusForType:v5 error:&v12];
  id v7 = v12;

  if (v6)
  {
    if ([v6 canRead])
    {
      id v11 = 0;
      v8 = [(HDWorkoutTrainingLoadQueryServer *)self _queue_fetchTrainingLoadWithError:&v11];
      id v9 = v11;
      id v10 = v9;
      if (v8 || !v9) {
        objc_msgSend(v4, "client_deliverTrainingLoadResults:forQuery:", v8, v3);
      }
      else {
        objc_msgSend(v4, "client_deliverError:forQuery:", v9, v3);
      }
    }
    else
    {
      objc_msgSend(v4, "client_deliverTrainingLoadResults:forQuery:", 0, v3);
    }
  }
  else
  {
    objc_msgSend(v4, "client_deliverError:forQuery:", v7, v3);
  }
}

- (id)_queue_fetchTrainingLoadWithError:(id *)a3
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__92;
  v25 = __Block_byref_object_dispose__92;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__92;
  v19 = __Block_byref_object_dispose__92;
  id v20 = 0;
  uint64_t v5 = [(_HKWorkoutTrainingLoadQueryServerConfiguration *)self->_trainingLoadQueryServerConfiguration options];
  v6 = [HDWorkoutTrainingLoadQueryHelper alloc];
  id v7 = [(HDQueryServer *)self filter];
  v8 = [(HDQueryServer *)self profile];
  id v9 = [(HDWorkoutTrainingLoadQueryHelper *)v6 initWithFilter:v7 options:v5 profile:v8];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__HDWorkoutTrainingLoadQueryServer__queue_fetchTrainingLoadWithError___block_invoke;
  v14[3] = &unk_1E63001E8;
  v14[4] = self;
  v14[5] = &v15;
  v14[6] = &v21;
  [(HDWorkoutTrainingLoadQueryHelper *)v9 fetchTrainingLoadWithCompletion:v14];
  id v10 = (id)v16[5];
  id v11 = v10;
  if (v10)
  {
    if (a3) {
      *a3 = v10;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v12 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);

  return v12;
}

void __70__HDWorkoutTrainingLoadQueryServer__queue_fetchTrainingLoadWithError___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[4];
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch training load: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
}

- (int64_t)trainingLoadOptions
{
  return self->_trainingLoadOptions;
}

- (_HKWorkoutTrainingLoadQueryServerConfiguration)trainingLoadQueryServerConfiguration
{
  return self->_trainingLoadQueryServerConfiguration;
}

- (void).cxx_destruct
{
}

@end