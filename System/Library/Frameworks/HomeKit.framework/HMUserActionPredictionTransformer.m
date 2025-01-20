@interface HMUserActionPredictionTransformer
+ (id)logCategory;
- (BOOL)isValidPredictionForAccessory:(id)a3 targetServiceIdentifier:(id)a4;
- (id)matchingAccessoryForDuetAccessoryPrediction:(id)a3 home:(id)a4;
- (id)matchingServiceForDuetAccessoryPrediction:(id)a3 onAccessory:(id)a4 home:(id)a5;
- (id)predictionForDuetAccessoryPrediction:(id)a3 home:(id)a4;
- (id)predictionForDuetScenePrediction:(id)a3 home:(id)a4;
- (id)predictionWithSameTargetGroupAsPrediction:(id)a3 inPredictions:(id)a4;
- (id)predictionsWithDuetPredictions:(id)a3 forHome:(id)a4;
@end

@implementation HMUserActionPredictionTransformer

- (id)predictionsWithDuetPredictions:(id)a3 forHome:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_35:
    _HMFPreconditionFailure();
  }
  if (!v7) {
    goto LABEL_35;
  }
  v36 = v7;
  v34 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (!v8) {
    goto LABEL_31;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v38;
  unint64_t v11 = 0x1E4F29000uLL;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v38 != v10) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v37 + 1) + 8 * v12);
      id v14 = objc_alloc(*(Class *)(v11 + 296));
      v15 = [v13 targetIdentifier];
      v16 = (void *)[v14 initWithUUIDString:v15];

      if (!v16)
      {
        v19 = (void *)MEMORY[0x19F3A64A0]();
        v20 = self;
        v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v42 = v22;
          __int16 v43 = 2112;
          v44 = v36;
          __int16 v45 = 2112;
          v46 = v13;
          v23 = v21;
          v24 = "%{public}@Bad prediction for home %@ from duet, missing targetIdentifier (%@)";
          goto LABEL_19;
        }
LABEL_20:

        goto LABEL_21;
      }
      if (([v13 hasPredictionType] & 1) == 0)
      {
        v19 = (void *)MEMORY[0x19F3A64A0]();
        v20 = self;
        v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v42 = v22;
          __int16 v43 = 2112;
          v44 = v36;
          __int16 v45 = 2112;
          v46 = v13;
          v23 = v21;
          v24 = "%{public}@Bad prediction for home %@ from duet, missing prediction type (%@)";
LABEL_19:
          _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x20u);

          unint64_t v11 = 0x1E4F29000;
        }
        goto LABEL_20;
      }
      int v17 = [v13 predictionType];
      if (v17 == 2)
      {
        v25 = [(HMUserActionPredictionTransformer *)self predictionForDuetAccessoryPrediction:v13 home:v36];
        if (v25)
        {
          v26 = [(HMUserActionPredictionTransformer *)self predictionWithSameTargetGroupAsPrediction:v25 inPredictions:v34];
          v27 = v26;
          if (!v26) {
            goto LABEL_27;
          }
          [v26 predictionScore];
          double v29 = v28;
          [v25 predictionScore];
          if (v29 <= v30)
          {
            [v34 removeObject:v27];
LABEL_27:
            [v34 addObject:v25];
          }

          unint64_t v11 = 0x1E4F29000;
        }

        goto LABEL_21;
      }
      if (v17 == 1)
      {
        v18 = [(HMUserActionPredictionTransformer *)self predictionForDuetScenePrediction:v13 home:v36];
        if (v18) {
          [v34 addObject:v18];
        }
      }
LABEL_21:

      ++v12;
    }
    while (v9 != v12);
    uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
    uint64_t v9 = v31;
  }
  while (v31);
LABEL_31:

  v32 = (void *)[v34 copy];

  return v32;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_17847 != -1) {
    dispatch_once(&logCategory__hmf_once_t5_17847, &__block_literal_global_17848);
  }
  v2 = (void *)logCategory__hmf_once_v6_17849;

  return v2;
}

uint64_t __48__HMUserActionPredictionTransformer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v6_17849;
  logCategory__hmf_once_v6_17849 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (BOOL)isValidPredictionForAccessory:(id)a3 targetServiceIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = v6;
    uint64_t v8 = [v5 mediaProfile];

    if (v7)
    {
      uint64_t v9 = [v5 services];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __91__HMUserActionPredictionTransformer_isValidPredictionForAccessory_targetServiceIdentifier___block_invoke;
      v16[3] = &unk_1E593FD88;
      id v17 = v7;
      char v10 = objc_msgSend(v9, "na_any:", v16);
    }
    else
    {
      char v10 = 0;
    }
    if (v7) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v8 == 0;
    }
    if (v11) {
      BOOL v12 = v10;
    }
    else {
      BOOL v12 = 1;
    }

    return v12;
  }
  else
  {
    uint64_t v14 = _HMFPreconditionFailure();
    return __91__HMUserActionPredictionTransformer_isValidPredictionForAccessory_targetServiceIdentifier___block_invoke(v14, v15);
  }
}

uint64_t __91__HMUserActionPredictionTransformer_isValidPredictionForAccessory_targetServiceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

- (id)matchingServiceForDuetAccessoryPrediction:(id)a3 onAccessory:(id)a4 home:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 predictionType] != 2)
  {
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v8)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v9)
  {
LABEL_13:
    uint64_t v18 = _HMFPreconditionFailure();
    return (id)__96__HMUserActionPredictionTransformer_matchingServiceForDuetAccessoryPrediction_onAccessory_home___block_invoke(v18, v19);
  }
  uint64_t v10 = [v7 targetAccessoryServiceIdentifier];
  if (v10)
  {
    BOOL v11 = (void *)v10;
    id v12 = objc_alloc(MEMORY[0x1E4F29128]);
    v13 = [v7 targetAccessoryServiceIdentifier];
    uint64_t v14 = (void *)[v12 initWithUUIDString:v13];

    if (v14)
    {
      v15 = [v8 services];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __96__HMUserActionPredictionTransformer_matchingServiceForDuetAccessoryPrediction_onAccessory_home___block_invoke;
      v20[3] = &unk_1E593FD88;
      id v21 = v14;
      id v16 = v14;
      uint64_t v14 = objc_msgSend(v15, "na_firstObjectPassingTest:", v20);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

uint64_t __96__HMUserActionPredictionTransformer_matchingServiceForDuetAccessoryPrediction_onAccessory_home___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

- (id)matchingAccessoryForDuetAccessoryPrediction:(id)a3 home:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 predictionType] != 2)
  {
    _HMFPreconditionFailure();
LABEL_45:
    _HMFPreconditionFailure();
  }
  if (!v6) {
    goto LABEL_45;
  }
  id v7 = [v5 targetIdentifier];
  id v8 = +[HMUserActionPredictionTransformerMatter matchingMatterAccessoryForTargetIdentifier:v7 home:v6];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F29128]);
    BOOL v11 = [v5 targetIdentifier];
    uint64_t v12 = [v10 initWithUUIDString:v11];

    v13 = [v5 targetAccessoryServiceIdentifier];
    if (v13)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F29128]);
      v15 = [v5 targetAccessoryServiceIdentifier];
      __int16 v45 = (void *)[v14 initWithUUIDString:v15];
    }
    else
    {
      __int16 v45 = 0;
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v16 = [v6 accessories];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v52 objects:v65 count:16];
    v42 = (void *)v12;
    if (v17)
    {
      uint64_t v18 = v17;
      id v41 = v5;
      uint64_t v19 = *(void *)v53;
LABEL_10:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v53 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v52 + 1) + 8 * v20);
        v22 = [v21 uniqueIdentifier];
        int v23 = objc_msgSend(v22, "hmf_isEqualToUUID:", v12);

        v24 = [v21 uniqueIdentifiersForBridgedAccessories];
        uint64_t v25 = [v24 count];

        if (v25 && v23 != 0) {
          break;
        }
        if (v23
          && [(HMUserActionPredictionTransformer *)self isValidPredictionForAccessory:v21 targetServiceIdentifier:v45])
        {
          id v9 = v21;
LABEL_39:
          id v5 = v41;
          id v8 = 0;
          goto LABEL_40;
        }
        if (v18 == ++v20)
        {
          uint64_t v18 = [v16 countByEnumeratingWithState:&v52 objects:v65 count:16];
          if (v18) {
            goto LABEL_10;
          }
          id v9 = 0;
          goto LABEL_39;
        }
      }
      long long v40 = v16;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id obj = [v21 bridgedAccessories];
      uint64_t v27 = [obj countByEnumeratingWithState:&v48 objects:v64 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v49;
        while (2)
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v49 != v29) {
              objc_enumerationMutation(obj);
            }
            uint64_t v31 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            v32 = [v31 services];
            v46[0] = MEMORY[0x1E4F143A8];
            v46[1] = 3221225472;
            v46[2] = __86__HMUserActionPredictionTransformer_matchingAccessoryForDuetAccessoryPrediction_home___block_invoke;
            v46[3] = &unk_1E593FD88;
            id v33 = v45;
            id v47 = v33;
            int v34 = objc_msgSend(v32, "na_any:", v46);

            if (v34
              && [(HMUserActionPredictionTransformer *)self isValidPredictionForAccessory:v31 targetServiceIdentifier:v33])
            {
              id v9 = v31;

              id v5 = v41;
              goto LABEL_37;
            }
          }
          uint64_t v28 = [obj countByEnumeratingWithState:&v48 objects:v64 count:16];
          if (v28) {
            continue;
          }
          break;
        }
      }

      v35 = (void *)MEMORY[0x19F3A64A0]();
      v36 = self;
      long long v37 = HMFGetOSLogHandle();
      id v5 = v41;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        long long v38 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v57 = v38;
        __int16 v58 = 2112;
        v59 = v21;
        __int16 v60 = 2112;
        id v61 = v6;
        __int16 v62 = 2112;
        id v63 = v41;
        _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_ERROR, "%{public}@Bad accessory prediction from duet, found bridge: %@ but couldn't find accessory in home (%@) for prediction: %@", buf, 0x2Au);
      }
      id v9 = 0;
LABEL_37:
      id v16 = v40;
      id v8 = 0;
    }
    else
    {
      id v9 = 0;
    }
LABEL_40:
  }

  return v9;
}

uint64_t __86__HMUserActionPredictionTransformer_matchingAccessoryForDuetAccessoryPrediction_home___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

- (id)predictionForDuetAccessoryPrediction:(id)a3 home:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 predictionType] != 2)
  {
    _HMFPreconditionFailure();
LABEL_20:
    _HMFPreconditionFailure();
  }
  if (!v8) {
    goto LABEL_20;
  }
  id v9 = [(HMUserActionPredictionTransformer *)self matchingAccessoryForDuetAccessoryPrediction:v7 home:v8];
  if (v9)
  {
    id v10 = [(HMUserActionPredictionTransformer *)self matchingServiceForDuetAccessoryPrediction:v7 onAccessory:v9 home:v8];
    if (!v10) {
      goto LABEL_10;
    }
    BOOL v11 = [v8 serviceGroups];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __79__HMUserActionPredictionTransformer_predictionForDuetAccessoryPrediction_home___block_invoke;
    v33[3] = &unk_1E593FDB0;
    uint64_t v4 = &v34;
    id v34 = v10;
    uint64_t v12 = objc_msgSend(v11, "na_firstObjectPassingTest:", v33);
    v13 = [v12 uniqueIdentifier];

    if (v13)
    {
      id v14 = [HMUserActionPrediction alloc];
      [v7 score];
      v15 = -[HMUserActionPrediction initWithPredictionTargetUUID:predictionType:predictionScore:](v14, "initWithPredictionTargetUUID:predictionType:predictionScore:", v13, 3);
    }
    else
    {
LABEL_10:
      uint64_t v20 = [v8 mediaSystems];
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      double v30 = __79__HMUserActionPredictionTransformer_predictionForDuetAccessoryPrediction_home___block_invoke_3;
      uint64_t v31 = &unk_1E593FE00;
      id v21 = v9;
      id v32 = v21;
      v22 = objc_msgSend(v20, "na_firstObjectPassingTest:", &v28);
      int v23 = objc_msgSend(v22, "uniqueIdentifier", v28, v29, v30, v31);

      v24 = [HMUserActionPrediction alloc];
      if (v23)
      {
        [v7 score];
        v15 = -[HMUserActionPrediction initWithPredictionTargetUUID:predictionType:predictionScore:](v24, "initWithPredictionTargetUUID:predictionType:predictionScore:", v23, 4);
      }
      else
      {
        uint64_t v25 = [v21 uniqueIdentifier];
        v26 = [v10 uniqueIdentifier];
        [v7 score];
        v15 = -[HMUserActionPrediction initWithPredictionTargetUUID:targetServiceUUID:predictionType:predictionScore:](v24, "initWithPredictionTargetUUID:targetServiceUUID:predictionType:predictionScore:", v25, v26, 2);
      }
      if (!v10) {
        goto LABEL_15;
      }
    }

LABEL_15:
    goto LABEL_16;
  }
  id v16 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v17 = self;
  uint64_t v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v36 = v19;
    __int16 v37 = 2112;
    id v38 = v7;
    _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Bad service prediction retrieved from duet, missing predicted service in home (%@)", buf, 0x16u);
  }
  v15 = 0;
LABEL_16:

  return v15;
}

uint64_t __79__HMUserActionPredictionTransformer_predictionForDuetAccessoryPrediction_home___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 services];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__HMUserActionPredictionTransformer_predictionForDuetAccessoryPrediction_home___block_invoke_2;
  v6[3] = &unk_1E593FD88;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __79__HMUserActionPredictionTransformer_predictionForDuetAccessoryPrediction_home___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 components];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__HMUserActionPredictionTransformer_predictionForDuetAccessoryPrediction_home___block_invoke_4;
  v6[3] = &unk_1E593FDD8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __79__HMUserActionPredictionTransformer_predictionForDuetAccessoryPrediction_home___block_invoke_4(uint64_t a1, void *a2)
{
  v3 = [a2 accessory];
  uint64_t v4 = [v3 uniqueIdentifier];
  id v5 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  return v6;
}

uint64_t __79__HMUserActionPredictionTransformer_predictionForDuetAccessoryPrediction_home___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

- (id)predictionForDuetScenePrediction:(id)a3 home:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 predictionType] != 1)
  {
    _HMFPreconditionFailure();
LABEL_12:
    _HMFPreconditionFailure();
  }
  if (!v7) {
    goto LABEL_12;
  }
  id v8 = objc_alloc(MEMORY[0x1E4F29128]);
  id v9 = [v6 targetIdentifier];
  id v10 = (void *)[v8 initWithUUIDString:v9];

  BOOL v11 = [v7 actionSets];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__HMUserActionPredictionTransformer_predictionForDuetScenePrediction_home___block_invoke;
  v22[3] = &unk_1E593FD60;
  id v12 = v10;
  id v23 = v12;
  v13 = objc_msgSend(v11, "na_firstObjectPassingTest:", v22);

  if (v13)
  {
    id v14 = [HMUserActionPrediction alloc];
    v15 = [v13 uniqueIdentifier];
    [v6 score];
    id v16 = -[HMUserActionPrediction initWithPredictionTargetUUID:predictionType:predictionScore:](v14, "initWithPredictionTargetUUID:predictionType:predictionScore:", v15, 1);
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v20;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Bad scene prediction from duet, missing predicted action set in home (%@)", buf, 0x16u);
    }
    id v16 = 0;
  }

  return v16;
}

uint64_t __75__HMUserActionPredictionTransformer_predictionForDuetScenePrediction_home___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 uniqueIdentifier];
  uint64_t v5 = objc_msgSend(v4, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  if (v5)
  {
    id v6 = [v3 actions];
    uint64_t v5 = [v6 count] != 0;
  }
  return v5;
}

- (id)predictionWithSameTargetGroupAsPrediction:(id)a3 inPredictions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  id v7 = v6;
  if (!v6)
  {
LABEL_13:
    uint64_t v13 = _HMFPreconditionFailure();
    return (id)__93__HMUserActionPredictionTransformer_predictionWithSameTargetGroupAsPrediction_inPredictions___block_invoke(v13, v14);
  }
  uint64_t v8 = [v5 predictionType];
  if (v8 == 3)
  {
    id v9 = v15;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v10 = __93__HMUserActionPredictionTransformer_predictionWithSameTargetGroupAsPrediction_inPredictions___block_invoke_2;
  }
  else
  {
    if (v8 != 4)
    {
      BOOL v11 = 0;
      goto LABEL_9;
    }
    id v9 = v16;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    id v10 = __93__HMUserActionPredictionTransformer_predictionWithSameTargetGroupAsPrediction_inPredictions___block_invoke;
  }
  v9[2] = v10;
  v9[3] = &unk_1E593FD38;
  v9[4] = v5;
  BOOL v11 = objc_msgSend(v7, "na_firstObjectPassingTest:", v9);

LABEL_9:

  return v11;
}

uint64_t __93__HMUserActionPredictionTransformer_predictionWithSameTargetGroupAsPrediction_inPredictions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 predictionType] == 4)
  {
    uint64_t v4 = [*(id *)(a1 + 32) predictionTargetUUID];
    id v5 = [v3 predictionTargetUUID];
    uint64_t v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __93__HMUserActionPredictionTransformer_predictionWithSameTargetGroupAsPrediction_inPredictions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 predictionType] == 3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) predictionTargetUUID];
    id v5 = [v3 predictionTargetUUID];
    uint64_t v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

@end