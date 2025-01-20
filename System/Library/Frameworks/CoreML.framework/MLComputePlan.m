@interface MLComputePlan
+ (id)computePlanOfModelStructure:(id)a3 modelAsset:(id)a4 configuration:(id)a5 error:(id *)a6;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadModelAsset:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
- (MLComputePlan)initWithModelStructure:(id)a3 modelDescription:(id)a4 modelAssetStorageType:(int64_t)a5 executionSchedule:(id)a6 configuration:(id)a7;
- (MLModelConfiguration)configuration;
- (MLModelDescription)modelDescription;
- (MLModelStructure)modelStructure;
- (NSDictionary)computeDevicesBySupportedComputeUnits;
- (NSDictionary)executionScheduleByModelStructurePath;
- (id)computeDeviceUsageForMLProgramOperation:(id)a3;
- (id)computeDeviceUsageForNeuralNetworkLayer:(id)a3;
- (id)estimatedCostOfMLProgramOperation:(id)a3;
- (int64_t)modelAssetStorageType;
@end

@implementation MLComputePlan

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_executionScheduleByModelStructurePath, 0);
  objc_storeStrong((id *)&self->_computeDevicesBySupportedComputeUnits, 0);

  objc_storeStrong((id *)&self->_modelStructure, 0);
}

- (MLModelConfiguration)configuration
{
  return self->_configuration;
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (int64_t)modelAssetStorageType
{
  return self->_modelAssetStorageType;
}

- (NSDictionary)executionScheduleByModelStructurePath
{
  return self->_executionScheduleByModelStructurePath;
}

- (NSDictionary)computeDevicesBySupportedComputeUnits
{
  return self->_computeDevicesBySupportedComputeUnits;
}

- (MLModelStructure)modelStructure
{
  return self->_modelStructure;
}

- (id)computeDeviceUsageForMLProgramOperation:(id)a3
{
  id v4 = a3;
  v5 = [(MLComputePlan *)self modelDescription];
  uint64_t v6 = [(MLComputePlan *)self modelAssetStorageType];
  v8 = v7 = [(MLComputePlan *)self executionScheduleByModelStructurePath];

  if (v8)
  {
    v9 = [(MLComputePlan *)self configuration];
    v11 = v10 = [(MLComputePlan *)self computeDevicesBySupportedComputeUnits];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)computeDeviceUsageForNeuralNetworkLayer:(id)a3
{
  id v4 = a3;
  id v5 = [(MLComputePlan *)self executionScheduleByModelStructurePath];
  uint64_t v6 = [v4 path];
  v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = [(MLComputePlan *)self configuration];
    v10 = v9 = [(MLComputePlan *)self computeDevicesBySupportedComputeUnits];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)estimatedCostOfMLProgramOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(MLComputePlan *)self modelDescription];
  uint64_t v6 = [(MLComputePlan *)self modelAssetStorageType];
  v8 = v7 = [(MLComputePlan *)self executionScheduleByModelStructurePath];

  if (v8)
  {
    [v8 computeTimeRatio];
    v9 = [MLComputePlanCost alloc];
    [v8 computeTimeRatio];
    v10 = -[MLComputePlanCost initWithWeight:](v9, "initWithWeight:");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MLComputePlan)initWithModelStructure:(id)a3 modelDescription:(id)a4 modelAssetStorageType:(int64_t)a5 executionSchedule:(id)a6 configuration:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v40.receiver = self;
  v40.super_class = (Class)MLComputePlan;
  v17 = [(MLComputePlan *)&v40 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_modelStructure, a3);
    objc_storeStrong((id *)&v18->_modelDescription, a4);
    v18->_modelAssetStorageType = a5;
    objc_storeStrong((id *)&v18->_configuration, a7);
    uint64_t v19 = [v15 modelExecutionScheduleByModelStructurePath];
    executionScheduleByModelStructurePath = v18->_executionScheduleByModelStructurePath;
    v18->_executionScheduleByModelStructurePath = (NSDictionary *)v19;

    v21 = [MEMORY[0x1E4F1CA60] dictionary];
    v22 = +[MLModel availableComputeDevices];
    v24 = uint64_t v23 = objc_opt_class();
    [(NSDictionary *)v21 setObject:v24 forKeyedSubscript:&unk_1EF11A1D8];

    v26 = uint64_t v25 = objc_opt_class();
    [(NSDictionary *)v21 setObject:v26 forKeyedSubscript:&unk_1EF11A1F0];

    v28 = uint64_t v27 = objc_opt_class();
    [(NSDictionary *)v21 setObject:v28 forKeyedSubscript:&unk_1EF11A208];

    v29 = [(NSDictionary *)v21 objectForKeyedSubscript:&unk_1EF11A1D8];
    v30 = [(NSDictionary *)v21 objectForKeyedSubscript:&unk_1EF11A1F0];
    v31 = [v29 arrayByAddingObjectsFromArray:v30];
    [(NSDictionary *)v21 setObject:v31 forKeyedSubscript:&unk_1EF11A220];

    v32 = [(NSDictionary *)v21 objectForKeyedSubscript:&unk_1EF11A1D8];
    v33 = [(NSDictionary *)v21 objectForKeyedSubscript:&unk_1EF11A208];
    v34 = [v32 arrayByAddingObjectsFromArray:v33];
    [(NSDictionary *)v21 setObject:v34 forKeyedSubscript:&unk_1EF11A238];

    v35 = [(NSDictionary *)v21 objectForKeyedSubscript:&unk_1EF11A220];
    v36 = [(NSDictionary *)v21 objectForKeyedSubscript:&unk_1EF11A208];
    v37 = [v35 arrayByAddingObjectsFromArray:v36];
    [(NSDictionary *)v21 setObject:v37 forKeyedSubscript:&unk_1EF11A250];

    computeDevicesBySupportedComputeUnits = v18->_computeDevicesBySupportedComputeUnits;
    v18->_computeDevicesBySupportedComputeUnits = v21;
  }
  return v18;
}

+ (void)loadModelAsset:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__MLComputePlan_loadModelAsset_configuration_completionHandler___block_invoke;
  v13[3] = &unk_1E59A4070;
  id v15 = v8;
  id v16 = v9;
  id v14 = v7;
  id v10 = v8;
  id v11 = v7;
  id v12 = v9;
  [v11 modelStructureWithCompletionHandler:v13];
}

void __64__MLComputePlan_loadModelAsset_configuration_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    id v11 = v6;
    id v9 = +[MLComputePlan computePlanOfModelStructure:v5 modelAsset:v7 configuration:v8 error:&v11];
    id v10 = v11;

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
    id v10 = v6;
  }
}

+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void, id))a5;
  id v12 = 0;
  id v10 = +[MLModelAsset modelAssetWithURL:a3 error:&v12];
  id v11 = v12;
  if (v10) {
    [a1 loadModelAsset:v10 configuration:v8 completionHandler:v9];
  }
  else {
    v9[2](v9, 0, v11);
  }
}

+ (id)computePlanOfModelStructure:(id)a3 modelAsset:(id)a4 configuration:(id)a5 error:(id *)a6
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v10 = (_anonymous_namespace_ *)a3;
  id v11 = a4;
  id v12 = a5;
  {
    id v14 = (void *)[v12 copy];
    [v14 setProfilingOptions:1];
    id v15 = [v11 modelWithConfiguration:v14 error:a6];
    id v16 = v15;
    if (v15)
    {
      v17 = [v15 executionSchedule];
      v18 = [v17 modelExecutionScheduleByModelStructurePath];

      if (v18)
      {
        id v19 = objc_alloc((Class)a1);
        v20 = [v16 modelDescription];
        v21 = objc_msgSend(v19, "initWithModelStructure:modelDescription:modelAssetStorageType:executionSchedule:configuration:", v10, v20, objc_msgSend(v11, "storageType"), v17, v14);
      }
      else
      {
        v24 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v29 = 0;
          _os_log_error_impl(&dword_19E58B000, v24, OS_LOG_TYPE_ERROR, "Failed to construct compute plan, internal failure.", v29, 2u);
        }

        if (a6)
        {
          uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v30 = *MEMORY[0x1E4F28568];
          v26 = [NSString stringWithFormat:@"Failed to construct compute plan, internal failure."];
          v31 = v26;
          uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
          *a6 = [v25 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v27];
        }
        v21 = 0;
      }
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v22 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v29 = 0;
      _os_log_error_impl(&dword_19E58B000, v22, OS_LOG_TYPE_ERROR, "Failed to construct compute plan, model is not supported.", v29, 2u);
    }

    if (!a6)
    {
      v21 = 0;
      goto LABEL_18;
    }
    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithFormat:@"Failed to construct compute plan, model is not supported."];
    v33[0] = v14;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    [v23 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v16];
    v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_18:

  return v21;
}

@end