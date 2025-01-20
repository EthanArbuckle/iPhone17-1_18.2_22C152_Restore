@interface HMDUserActionPredictionModel
+ (BOOL)hmbExcludeFromCloudStorage;
+ (id)hmbProperties;
- (HMDUserActionPredictionModel)initWithUserActionPrediction:(id)a3;
- (id)userActionPrediction;
@end

@implementation HMDUserActionPredictionModel

+ (BOOL)hmbExcludeFromCloudStorage
{
  return 1;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_40074 != -1) {
    dispatch_once(&hmbProperties_onceToken_40074, &__block_literal_global_40075);
  }
  v2 = (void *)hmbProperties_properties_40076;
  return v2;
}

void __45__HMDUserActionPredictionModel_hmbProperties__block_invoke()
{
  v45[7] = *MEMORY[0x1E4F143B8];
  v44[0] = @"predictionTargetUUID";
  v0 = (void *)MEMORY[0x1E4F69E98];
  uint64_t v1 = objc_opt_class();
  v36 = [MEMORY[0x1E4F69EA0] excludeFromCloudStorage];
  v43 = v36;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  v34 = [v0 fieldWithClass:v1 options:v35];
  v45[0] = v34;
  v44[1] = @"targetServiceUUID";
  v2 = (void *)MEMORY[0x1E4F69E98];
  uint64_t v3 = objc_opt_class();
  v33 = [MEMORY[0x1E4F69EA0] excludeFromCloudStorage];
  v42 = v33;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  v31 = [v2 fieldWithClass:v3 options:v32];
  v45[1] = v31;
  v44[2] = @"targetServiceGroupUUID";
  v4 = (void *)MEMORY[0x1E4F69E98];
  uint64_t v5 = objc_opt_class();
  v30 = [MEMORY[0x1E4F69EA0] excludeFromCloudStorage];
  v41 = v30;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  v28 = [v4 fieldWithClass:v5 options:v29];
  v45[2] = v28;
  v44[3] = @"targetGroupUUID";
  v6 = (void *)MEMORY[0x1E4F69E98];
  uint64_t v7 = objc_opt_class();
  v27 = [MEMORY[0x1E4F69EA0] excludeFromCloudStorage];
  v40 = v27;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  v25 = [v6 fieldWithClass:v7 options:v26];
  v45[3] = v25;
  v44[4] = @"type";
  v8 = (void *)MEMORY[0x1E4F69E98];
  uint64_t v9 = objc_opt_class();
  v10 = [MEMORY[0x1E4F69EA0] excludeFromCloudStorage];
  v39 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  v12 = [v8 fieldWithClass:v9 options:v11];
  v45[4] = v12;
  v44[5] = @"groupType";
  v13 = (void *)MEMORY[0x1E4F69E98];
  uint64_t v14 = objc_opt_class();
  v15 = [MEMORY[0x1E4F69EA0] excludeFromCloudStorage];
  v38 = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  v17 = [v13 fieldWithClass:v14 options:v16];
  v45[5] = v17;
  v44[6] = @"predictionScore";
  v18 = (void *)MEMORY[0x1E4F69E98];
  uint64_t v19 = objc_opt_class();
  v20 = [MEMORY[0x1E4F69EA0] excludeFromCloudStorage];
  v37 = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  v22 = [v18 fieldWithClass:v19 options:v21];
  v45[6] = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:7];
  v24 = (void *)hmbProperties_properties_40076;
  hmbProperties_properties_40076 = v23;
}

- (id)userActionPrediction
{
  id v3 = objc_alloc(MEMORY[0x1E4F2EBA8]);
  v4 = [(HMDUserActionPredictionModel *)self predictionTargetUUID];
  uint64_t v5 = [(HMDUserActionPredictionModel *)self targetServiceUUID];
  v6 = [(HMDUserActionPredictionModel *)self targetGroupUUID];
  uint64_t v7 = [(HMDUserActionPredictionModel *)self groupType];
  uint64_t v8 = [v7 unsignedIntegerValue];
  uint64_t v9 = [(HMDUserActionPredictionModel *)self type];
  uint64_t v10 = [v9 unsignedIntegerValue];
  v11 = [(HMDUserActionPredictionModel *)self predictionScore];
  [v11 doubleValue];
  v12 = objc_msgSend(v3, "initWithPredictionTargetUUID:targetServiceUUID:targetGroupUUID:targetGroupType:predictionType:predictionScore:", v4, v5, v6, v8, v10);

  return v12;
}

- (HMDUserActionPredictionModel)initWithUserActionPrediction:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 predictionTargetUUID];
  v6 = [v4 targetServiceUUID];
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F29128];
  id v8 = v5;
  uint64_t v9 = (void *)[[v7 alloc] initWithUUIDString:@"D73F97DF-5711-4EAA-9CA4-EB5C028A5EE8"];
  uint64_t v10 = (void *)MEMORY[0x1E4F29128];
  v11 = [v8 UUIDString];

  v12 = [v11 dataUsingEncoding:4];
  v13 = objc_msgSend(v10, "hmf_UUIDWithNamespace:data:", v9, v12);

  if (v6)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F29128];
    v15 = [v6 UUIDString];
    v16 = [v15 dataUsingEncoding:4];
    uint64_t v17 = objc_msgSend(v14, "hmf_UUIDWithNamespace:data:", v13, v16);

    v13 = (void *)v17;
  }

  v18 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D73F97DF-5711-4EAA-9CA4-EB5C028A5EE8"];
  uint64_t v19 = [(HMBModel *)self initWithModelID:v13 parentModelID:v18];
  v20 = [v4 predictionTargetUUID];
  [(HMDUserActionPredictionModel *)v19 setPredictionTargetUUID:v20];

  v21 = [v4 targetServiceUUID];
  [(HMDUserActionPredictionModel *)v19 setTargetServiceUUID:v21];

  v22 = [v4 targetGroupUUID];
  [(HMDUserActionPredictionModel *)v19 setTargetGroupUUID:v22];

  uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "predictionType"));
  [(HMDUserActionPredictionModel *)v19 setType:v23];

  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "targetGroupType"));
  [(HMDUserActionPredictionModel *)v19 setGroupType:v24];

  v25 = NSNumber;
  [v4 predictionScore];
  v26 = objc_msgSend(v25, "numberWithDouble:");
  [(HMDUserActionPredictionModel *)v19 setPredictionScore:v26];

  [(HMDUserActionPredictionModel *)v19 setTargetServiceGroupUUID:0];
  v27 = [(HMBModel *)v19 hmbModelID];

  if (v27)
  {
    v28 = v19;
  }
  else
  {
    v29 = (void *)MEMORY[0x1D9452090]();
    v30 = v19;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      int v41 = 138543874;
      v42 = v32;
      __int16 v43 = 2112;
      id v44 = v4;
      __int16 v45 = 2112;
      v46 = v30;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@User Action Prediction: %@, resulted in nil hmbModelID for prediction model: %@", (uint8_t *)&v41, 0x20u);
    }
    v33 = [(HMBModel *)v30 hmbModelID];

    if (!v33)
    {
      v35 = (void *)MEMORY[0x1D9452090]();
      v36 = v30;
      v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      {
        v38 = HMFGetLogIdentifier();
        int v41 = 138543362;
        v42 = v38;
        _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: User Action Prediction ModelID should not be nil", (uint8_t *)&v41, 0xCu);
      }
      v39 = [[HMDAssertionLogEvent alloc] initWithReason:@"User Action Prediction ModelID should not be nil"];
      v40 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v40 submitLogEvent:v39];
    }
    v28 = 0;
  }

  return v28;
}

@end