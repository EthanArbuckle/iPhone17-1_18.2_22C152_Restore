@interface HDWorkoutTrainingLoadCollectionQueryServer
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (HDWorkoutTrainingLoadCollectionQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (_HKWorkoutTrainingLoadCollectionQueryServerConfiguration)trainingLoadCollectionQueryServerConfiguration;
- (id)_queue_fetchTrainingLoadCollectionWithError:(id *)a3;
- (void)_queue_start;
@end

@implementation HDWorkoutTrainingLoadCollectionQueryServer

- (HDWorkoutTrainingLoadCollectionQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDWorkoutTrainingLoadCollectionQueryServer;
  v11 = [(HDQueryServer *)&v15 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    trainingLoadCollectionQueryServerConfiguration = v11->_trainingLoadCollectionQueryServerConfiguration;
    v11->_trainingLoadCollectionQueryServerConfiguration = (_HKWorkoutTrainingLoadCollectionQueryServerConfiguration *)v12;
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
  v13.super_class = (Class)HDWorkoutTrainingLoadCollectionQueryServer;
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
      v8 = [(HDWorkoutTrainingLoadCollectionQueryServer *)self _queue_fetchTrainingLoadCollectionWithError:&v11];
      id v9 = v11;
      id v10 = [(HDQueryServer *)self queryUUID];
      if (v8 || !v9) {
        objc_msgSend(v4, "client_deliverTrainingLoadCollection:forQuery:", v8, v10);
      }
      else {
        objc_msgSend(v4, "client_deliverError:forQuery:", v9, v10);
      }
    }
    else
    {
      objc_msgSend(v4, "client_deliverTrainingLoadCollection:forQuery:", 0, v3);
    }
  }
  else
  {
    objc_msgSend(v4, "client_deliverError:forQuery:", v7, v3);
  }
}

- (id)_queue_fetchTrainingLoadCollectionWithError:(id *)a3
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__53;
  v27 = __Block_byref_object_dispose__53;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__53;
  v21 = __Block_byref_object_dispose__53;
  id v22 = 0;
  uint64_t v5 = [(_HKWorkoutTrainingLoadCollectionQueryServerConfiguration *)self->_trainingLoadCollectionQueryServerConfiguration options];
  v6 = [(_HKWorkoutTrainingLoadCollectionQueryServerConfiguration *)self->_trainingLoadCollectionQueryServerConfiguration anchorDate];
  id v7 = [(_HKWorkoutTrainingLoadCollectionQueryServerConfiguration *)self->_trainingLoadCollectionQueryServerConfiguration intervalComponents];
  v8 = [HDWorkoutTrainingLoadQueryHelper alloc];
  id v9 = [(HDQueryServer *)self filter];
  id v10 = [(HDQueryServer *)self profile];
  id v11 = [(HDWorkoutTrainingLoadQueryHelper *)v8 initWithFilter:v9 options:v5 anchorDate:v6 intervalComponents:v7 profile:v10];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__HDWorkoutTrainingLoadCollectionQueryServer__queue_fetchTrainingLoadCollectionWithError___block_invoke;
  v16[3] = &unk_1E62FABE0;
  v16[4] = self;
  v16[5] = &v17;
  v16[6] = &v23;
  [(HDWorkoutTrainingLoadQueryHelper *)v11 fetchTrainingLoadCollectionWithCompletion:v16];
  id v12 = (id)v18[5];
  objc_super v13 = v12;
  if (v12)
  {
    if (a3) {
      *a3 = v12;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v14 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);

  return v14;
}

void __90__HDWorkoutTrainingLoadCollectionQueryServer__queue_fetchTrainingLoadCollectionWithError___block_invoke(void *a1, void *a2, void *a3)
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
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch training load collection: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
}

- (_HKWorkoutTrainingLoadCollectionQueryServerConfiguration)trainingLoadCollectionQueryServerConfiguration
{
  return self->_trainingLoadCollectionQueryServerConfiguration;
}

- (void).cxx_destruct
{
}

@end