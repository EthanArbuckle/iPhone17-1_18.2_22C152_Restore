@interface HMWidgetManager
+ (id)logCategory;
- (HMHomeManager)homeManager;
- (HMWidgetManager)initWithHomeManager:(id)a3 context:(id)a4;
- (_HMContext)context;
- (void)fetchStateForActionSets:(id)a3 completion:(id)a4;
- (void)fetchStateForCharacteristics:(id)a3 completion:(id)a4;
- (void)monitorAndFetchStateForActionSets:(id)a3 widgetIdentifier:(id)a4 kind:(id)a5 completion:(id)a6;
- (void)monitorAndFetchStateForCharacteristics:(id)a3 monitorReachabilityChanges:(BOOL)a4 widgetIdentifier:(id)a5 kind:(id)a6 completion:(id)a7;
- (void)monitorAndFetchStateForCharacteristics:(id)a3 widgetIdentifier:(id)a4 kind:(id)a5 completion:(id)a6;
- (void)monitorStateForMTRAttributeDescriptors:(id)a3 widgetIdentifier:(id)a4 kind:(id)a5 completion:(id)a6;
- (void)performRequests:(id)a3 forKind:(id)a4 completion:(id)a5;
@end

@implementation HMWidgetManager

- (HMWidgetManager)initWithHomeManager:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v12 = (HMUserCloudShareManager *)_HMFPreconditionFailure();
    return (HMWidgetManager *)[(HMUserCloudShareManager *)v12 initWithDataSource:v14];
  }
  v15.receiver = self;
  v15.super_class = (Class)HMWidgetManager;
  v9 = [(HMWidgetManager *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_homeManager, v6);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_homeManager);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (HMHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);

  return (HMHomeManager *)WeakRetained;
}

- (void)monitorStateForMTRAttributeDescriptors:(id)a3 widgetIdentifier:(id)a4 kind:(id)a5 completion:(id)a6
{
  v72[3] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v12)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v13)
  {
LABEL_15:
    _HMFPreconditionFailure();
LABEL_16:
    _HMFPreconditionFailure();
  }
  objc_super v15 = (void (**)(void, void))v14;
  if (!v14) {
    goto LABEL_16;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F653F0]);
  v17 = NSString;
  v18 = MEMORY[0x19F3A5D00](self, a2);
  v19 = [v17 stringWithFormat:@"%@, %s:%ld", v18, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/Widgets/HMWidgetManager.m", 464];
  v20 = (void *)[v16 initWithName:v19];

  v21 = [(HMWidgetManager *)self homeManager];
  uint64_t v22 = MEMORY[0x19F3A64A0]();
  v23 = (void *)v22;
  if (v21)
  {
    v53 = v20;
    context = (void *)v22;
    uint64_t v24 = encodeRootObject(v11);
    id v25 = objc_alloc(MEMORY[0x1E4F65488]);
    v26 = [v21 uuid];
    uint64_t v27 = [v25 initWithTarget:v26];

    v71[0] = @"HMWM.widgetIdentifier";
    v71[1] = @"HMWM.widgetKind";
    v72[0] = v12;
    v72[1] = v13;
    v71[2] = @"HMWM.mtrAttributes";
    v51 = (void *)v24;
    v72[2] = v24;
    v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:3];
    v50 = (void *)v27;
    v28 = objc_msgSend(MEMORY[0x1E4F654B0], "messageWithName:destination:payload:", @"HMWM.monitorMTRAttributes", v27);
    v29 = (void *)MEMORY[0x19F3A64A0]();
    v30 = self;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = v47 = v29;
      v33 = [v53 identifier];
      [v33 shortDescription];
      v52 = v21;
      v35 = id v34 = v13;
      [v28 identifier];
      v48 = v15;
      id v36 = v12;
      v38 = v37 = v11;
      *(_DWORD *)buf = 138544642;
      v60 = v32;
      __int16 v61 = 2114;
      v62 = v35;
      __int16 v63 = 2112;
      v64 = v38;
      __int16 v65 = 2048;
      uint64_t v66 = [v37 count];
      __int16 v67 = 2112;
      id v68 = v36;
      __int16 v69 = 2112;
      id v70 = v34;
      _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] [%@] Monitoring %ld attributes for widget (%@, %@)", buf, 0x3Eu);

      id v11 = v37;
      id v12 = v36;
      objc_super v15 = v48;

      id v13 = v34;
      v21 = v52;

      v29 = v47;
    }

    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __91__HMWidgetManager_monitorStateForMTRAttributeDescriptors_widgetIdentifier_kind_completion___block_invoke;
    v56[3] = &unk_1E5945510;
    v56[4] = v30;
    v20 = v53;
    id v57 = v53;
    v58 = v15;
    [v28 setResponseHandler:v56];
    v39 = [(HMWidgetManager *)v30 context];
    v40 = [v39 messageDispatcher];
    [v40 sendMessage:v28];
  }
  else
  {
    v41 = self;
    v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v43 = contexta = v23;
      v44 = [v20 identifier];
      v45 = [v44 shortDescription];
      *(_DWORD *)buf = 138543618;
      v60 = v43;
      __int16 v61 = 2114;
      v62 = v45;
      _os_log_impl(&dword_19D1A8000, v42, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] HomeManager has been deallocated", buf, 0x16u);

      v23 = contexta;
    }

    v46 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    ((void (**)(void, void *))v15)[2](v15, v46);

    v21 = 0;
  }
}

void __91__HMWidgetManager_monitorStateForMTRAttributeDescriptors_widgetIdentifier_kind_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = a1[4];
  v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [a1[5] identifier];
      id v13 = [v12 shortDescription];
      *(_DWORD *)buf = 138543874;
      v26 = v11;
      __int16 v27 = 2114;
      v28 = v13;
      __int16 v29 = 2112;
      id v30 = v5;
      id v14 = "%{public}@[%{public}@] Failed to monitor attributes with error: %@";
      objc_super v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 32;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, buf, v17);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [a1[5] identifier];
    id v13 = [v12 shortDescription];
    *(_DWORD *)buf = 138543618;
    v26 = v11;
    __int16 v27 = 2114;
    v28 = v13;
    id v14 = "%{public}@[%{public}@] Successfully monitored attributes";
    objc_super v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    uint32_t v17 = 22;
    goto LABEL_6;
  }

  v18 = [a1[4] context];
  v19 = [v18 delegateCaller];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __91__HMWidgetManager_monitorStateForMTRAttributeDescriptors_widgetIdentifier_kind_completion___block_invoke_136;
  v22[3] = &unk_1E59454E8;
  id v20 = a1[6];
  id v23 = v5;
  id v24 = v20;
  id v21 = v5;
  [v19 invokeBlock:v22];
}

uint64_t __91__HMWidgetManager_monitorStateForMTRAttributeDescriptors_widgetIdentifier_kind_completion___block_invoke_136(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchStateForActionSets:(id)a3 completion:(id)a4
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
LABEL_12:
    _HMFPreconditionFailure();
  }
  v9 = (void (**)(void, void, void))v8;
  if (!v8) {
    goto LABEL_12;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v11 = NSString;
  id v12 = MEMORY[0x19F3A5D00](self, a2);
  id v13 = [v11 stringWithFormat:@"%@, %s:%ld", v12, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/Widgets/HMWidgetManager.m", 397];
  id v14 = (void *)[v10 initWithName:v13];

  objc_super v15 = [(HMWidgetManager *)self homeManager];
  if (v15)
  {
    os_log_type_t v16 = objc_msgSend(v7, "na_map:", &__block_literal_global_127);
    id v17 = objc_alloc(MEMORY[0x1E4F65488]);
    v18 = [v15 uuid];
    v19 = (void *)[v17 initWithTarget:v18];

    v56 = @"HMWM.actionSets";
    v57[0] = v16;
    v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
    id v20 = objc_msgSend(MEMORY[0x1E4F654B0], "messageWithName:destination:payload:", @"HMWM.fetchStateForActionSets", v19);
    id v21 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v24 = v40 = v21;
      [v14 identifier];
      id v25 = v42 = v14;
      [v25 shortDescription];
      v26 = id v43 = v7;
      [v20 identifier];
      v41 = v19;
      __int16 v27 = v9;
      __int16 v29 = v28 = v15;
      *(_DWORD *)buf = 138544130;
      v49 = v24;
      __int16 v50 = 2114;
      v51 = v26;
      __int16 v52 = 2112;
      v53 = v29;
      __int16 v54 = 2112;
      v55 = v16;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] [%@] Fetching action sets: %@", buf, 0x2Au);

      objc_super v15 = v28;
      v9 = v27;
      v19 = v41;

      id v7 = v43;
      id v14 = v42;

      id v21 = v40;
    }

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __54__HMWidgetManager_fetchStateForActionSets_completion___block_invoke_128;
    v45[3] = &unk_1E5945510;
    v45[4] = v22;
    id v46 = v14;
    v47 = v9;
    [v20 setResponseHandler:v45];
    id v30 = [(HMWidgetManager *)v22 context];
    uint64_t v31 = [v30 messageDispatcher];
    [v31 sendMessage:v20];
  }
  else
  {
    v32 = v14;
    v33 = (void *)MEMORY[0x19F3A64A0]();
    id v34 = self;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      id v36 = HMFGetLogIdentifier();
      [v32 identifier];
      v38 = id v37 = v7;
      v39 = [v38 shortDescription];
      *(_DWORD *)buf = 138543618;
      v49 = v36;
      __int16 v50 = 2114;
      v51 = v39;
      _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] HomeManager has been deallocated", buf, 0x16u);

      id v7 = v37;
      objc_super v15 = 0;
    }
    os_log_type_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    ((void (**)(void, void, void *))v9)[2](v9, 0, v16);
    id v14 = v32;
  }
}

void __54__HMWidgetManager_fetchStateForActionSets_completion___block_invoke_128(id *a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = a1[4];
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [a1[5] identifier];
      id v13 = [v12 shortDescription];
      *(_DWORD *)buf = 138543874;
      __int16 v52 = v11;
      __int16 v53 = 2114;
      __int16 v54 = v13;
      __int16 v55 = 2112;
      id v56 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch action sets with error: %@", buf, 0x20u);
    }
    id v14 = [a1[4] context];
    objc_super v15 = [v14 delegateCaller];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __54__HMWidgetManager_fetchStateForActionSets_completion___block_invoke_129;
    v48[3] = &unk_1E59454E8;
    id v50 = a1[6];
    id v49 = v5;
    [v15 invokeBlock:v48];

    os_log_type_t v16 = v50;
  }
  else
  {
    uint64_t v17 = objc_msgSend(v6, "hmf_dictionaryForKey:", @"HMWM.actionSetsIsOn");
    if (v17)
    {
      os_log_type_t v16 = (void *)v17;
      uint64_t v18 = objc_msgSend(v7, "hmf_dictionaryForKey:", @"HMWM.actionSetsDidExecuteFail");
      v19 = (void *)v18;
      id v20 = (void *)MEMORY[0x1E4F1CC08];
      if (v18) {
        id v20 = (void *)v18;
      }
      id v21 = v20;

      uint64_t v22 = [[HMWidgetManagerFetchStateForActionSetsResponse alloc] initWithIsOnByActionSetsUniqueIdentifier:v16 didExecutionFailByActionSetUniqueIdentifier:v21];
      id v23 = (void *)MEMORY[0x19F3A64A0]();
      id v24 = a1[4];
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = id v42 = v21;
        [a1[5] identifier];
        __int16 v27 = v41 = v23;
        v28 = [v27 shortDescription];
        *(_DWORD *)buf = 138543618;
        __int16 v52 = v26;
        __int16 v53 = 2114;
        __int16 v54 = v28;
        _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched action sets", buf, 0x16u);

        id v23 = v41;
        id v21 = v42;
      }

      __int16 v29 = [a1[4] context];
      id v30 = [v29 delegateCaller];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __54__HMWidgetManager_fetchStateForActionSets_completion___block_invoke_132;
      v43[3] = &unk_1E59454E8;
      id v31 = a1[6];
      v44 = v22;
      id v45 = v31;
      v32 = v22;
      [v30 invokeBlock:v43];
    }
    else
    {
      v33 = (void *)MEMORY[0x19F3A64A0]();
      id v34 = a1[4];
      v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        id v36 = HMFGetLogIdentifier();
        id v37 = [a1[5] identifier];
        v38 = [v37 shortDescription];
        *(_DWORD *)buf = 138543618;
        __int16 v52 = v36;
        __int16 v53 = 2114;
        __int16 v54 = v38;
        _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Action set isOn statuses are unexpectedly missing in the response", buf, 0x16u);
      }
      v39 = [a1[4] context];
      v40 = [v39 delegateCaller];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __54__HMWidgetManager_fetchStateForActionSets_completion___block_invoke_130;
      v46[3] = &unk_1E59454C0;
      id v47 = a1[6];
      [v40 invokeBlock:v46];

      os_log_type_t v16 = 0;
    }
  }
}

uint64_t __54__HMWidgetManager_fetchStateForActionSets_completion___block_invoke_129(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __54__HMWidgetManager_fetchStateForActionSets_completion___block_invoke_130(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __54__HMWidgetManager_fetchStateForActionSets_completion___block_invoke_132(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __54__HMWidgetManager_fetchStateForActionSets_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (void)monitorAndFetchStateForActionSets:(id)a3 widgetIdentifier:(id)a4 kind:(id)a5 completion:(id)a6
{
  v68[3] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v12)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v13)
  {
LABEL_15:
    _HMFPreconditionFailure();
LABEL_16:
    _HMFPreconditionFailure();
  }
  objc_super v15 = (void (**)(void, void, void))v14;
  if (!v14) {
    goto LABEL_16;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F653F0]);
  uint64_t v17 = NSString;
  uint64_t v18 = MEMORY[0x19F3A5D00](self, a2);
  v19 = [v17 stringWithFormat:@"%@, %s:%ld", v18, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/Widgets/HMWidgetManager.m", 334];
  id v20 = (void *)[v16 initWithName:v19];

  id v21 = [(HMWidgetManager *)self homeManager];
  if (v21)
  {
    id v50 = v20;
    v48 = v15;
    uint64_t v22 = objc_msgSend(v11, "na_map:", &__block_literal_global_120);
    id v23 = objc_alloc(MEMORY[0x1E4F65488]);
    id v24 = [v21 uuid];
    uint64_t v25 = [v23 initWithTarget:v24];

    v67[0] = @"HMWM.widgetIdentifier";
    v67[1] = @"HMWM.widgetKind";
    v68[0] = v12;
    v68[1] = v13;
    v67[2] = @"HMWM.actionSets";
    v68[2] = v22;
    id v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:3];
    id v47 = (void *)v25;
    v26 = objc_msgSend(MEMORY[0x1E4F654B0], "messageWithName:destination:payload:", @"HMWM.monitorActionSets", v25);
    __int16 v27 = (void *)MEMORY[0x19F3A64A0]();
    v28 = self;
    __int16 v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v30 = v44 = v27;
      id v31 = [v50 identifier];
      [v31 shortDescription];
      id v49 = v21;
      v33 = id v32 = v12;
      [v26 identifier];
      id v34 = v45 = v11;
      *(_DWORD *)buf = 138544642;
      id v56 = v30;
      __int16 v57 = 2114;
      v58 = v33;
      __int16 v59 = 2112;
      v60 = v34;
      __int16 v61 = 2112;
      id v62 = v32;
      __int16 v63 = 2112;
      id v64 = v13;
      __int16 v65 = 2112;
      uint64_t v66 = v22;
      _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] [%@] Monitoring action sets for widget (%@, %@): %@", buf, 0x3Eu);

      id v11 = v45;
      id v12 = v32;
      id v21 = v49;

      __int16 v27 = v44;
    }

    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __86__HMWidgetManager_monitorAndFetchStateForActionSets_widgetIdentifier_kind_completion___block_invoke_121;
    v52[3] = &unk_1E5945510;
    v52[4] = v28;
    id v20 = v50;
    id v53 = v50;
    objc_super v15 = v48;
    __int16 v54 = v48;
    [v26 setResponseHandler:v52];
    v35 = [(HMWidgetManager *)v28 context];
    id v36 = [v35 messageDispatcher];
    [v36 sendMessage:v26];
  }
  else
  {
    id v37 = (void *)MEMORY[0x19F3A64A0]();
    v38 = self;
    v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = HMFGetLogIdentifier();
      [v20 identifier];
      v41 = v51 = v20;
      [v41 shortDescription];
      id v43 = v42 = v15;
      *(_DWORD *)buf = 138543618;
      id v56 = v40;
      __int16 v57 = 2114;
      v58 = v43;
      _os_log_impl(&dword_19D1A8000, v39, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] HomeManager has been deallocated", buf, 0x16u);

      objc_super v15 = v42;
      id v20 = v51;
    }
    uint64_t v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    ((void (**)(void, void, void *))v15)[2](v15, 0, v22);
    id v21 = 0;
  }
}

void __86__HMWidgetManager_monitorAndFetchStateForActionSets_widgetIdentifier_kind_completion___block_invoke_121(id *a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = a1[4];
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [a1[5] identifier];
      id v13 = [v12 shortDescription];
      *(_DWORD *)buf = 138543874;
      __int16 v52 = v11;
      __int16 v53 = 2114;
      __int16 v54 = v13;
      __int16 v55 = 2112;
      id v56 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to monitor action sets with error: %@", buf, 0x20u);
    }
    id v14 = [a1[4] context];
    objc_super v15 = [v14 delegateCaller];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __86__HMWidgetManager_monitorAndFetchStateForActionSets_widgetIdentifier_kind_completion___block_invoke_122;
    v48[3] = &unk_1E59454E8;
    id v50 = a1[6];
    id v49 = v5;
    [v15 invokeBlock:v48];

    id v16 = v50;
  }
  else
  {
    uint64_t v17 = objc_msgSend(v6, "hmf_dictionaryForKey:", @"HMWM.actionSetsIsOn");
    if (v17)
    {
      id v16 = (void *)v17;
      uint64_t v18 = objc_msgSend(v7, "hmf_dictionaryForKey:", @"HMWM.actionSetsDidExecuteFail");
      v19 = (void *)v18;
      id v20 = (void *)MEMORY[0x1E4F1CC08];
      if (v18) {
        id v20 = (void *)v18;
      }
      id v21 = v20;

      uint64_t v22 = [[HMWidgetManagerMonitorActionSetsResponse alloc] initWithIsOnByActionSetsUniqueIdentifier:v16 didExecutionFailByActionSetUniqueIdentifier:v21];
      id v23 = (void *)MEMORY[0x19F3A64A0]();
      id v24 = a1[4];
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = id v42 = v21;
        [a1[5] identifier];
        __int16 v27 = v41 = v23;
        v28 = [v27 shortDescription];
        *(_DWORD *)buf = 138543618;
        __int16 v52 = v26;
        __int16 v53 = 2114;
        __int16 v54 = v28;
        _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully monitored action sets", buf, 0x16u);

        id v23 = v41;
        id v21 = v42;
      }

      __int16 v29 = [a1[4] context];
      id v30 = [v29 delegateCaller];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __86__HMWidgetManager_monitorAndFetchStateForActionSets_widgetIdentifier_kind_completion___block_invoke_125;
      v43[3] = &unk_1E59454E8;
      id v31 = a1[6];
      v44 = v22;
      id v45 = v31;
      id v32 = v22;
      [v30 invokeBlock:v43];
    }
    else
    {
      v33 = (void *)MEMORY[0x19F3A64A0]();
      id v34 = a1[4];
      v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        id v36 = HMFGetLogIdentifier();
        id v37 = [a1[5] identifier];
        v38 = [v37 shortDescription];
        *(_DWORD *)buf = 138543618;
        __int16 v52 = v36;
        __int16 v53 = 2114;
        __int16 v54 = v38;
        _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Action set isOn statuses are unexpectedly missing in the response", buf, 0x16u);
      }
      v39 = [a1[4] context];
      v40 = [v39 delegateCaller];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __86__HMWidgetManager_monitorAndFetchStateForActionSets_widgetIdentifier_kind_completion___block_invoke_123;
      v46[3] = &unk_1E59454C0;
      id v47 = a1[6];
      [v40 invokeBlock:v46];

      id v16 = 0;
    }
  }
}

uint64_t __86__HMWidgetManager_monitorAndFetchStateForActionSets_widgetIdentifier_kind_completion___block_invoke_122(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __86__HMWidgetManager_monitorAndFetchStateForActionSets_widgetIdentifier_kind_completion___block_invoke_123(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __86__HMWidgetManager_monitorAndFetchStateForActionSets_widgetIdentifier_kind_completion___block_invoke_125(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __86__HMWidgetManager_monitorAndFetchStateForActionSets_widgetIdentifier_kind_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (void)performRequests:(id)a3 forKind:(id)a4 completion:(id)a5
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
LABEL_44:
    _HMFPreconditionFailure();
  }
  if (!v10) {
    goto LABEL_44;
  }
  id v12 = v11;
  id v13 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v14 = NSString;
  objc_super v15 = MEMORY[0x19F3A5D00](self, a2);
  id v16 = [v14 stringWithFormat:@"%@, %s:%ld", v15, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/Widgets/HMWidgetManager.m", 263];
  uint64_t v17 = (void *)[v13 initWithName:v16];

  uint64_t v18 = [(HMWidgetManager *)self homeManager];
  if (v18)
  {
    if ([v9 count])
    {
      v78 = self;
      v81 = v17;
      id v82 = v10;
      aBlock = v12;
      uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id v80 = v9;
      id obj = v9;
      uint64_t v20 = [obj countByEnumeratingWithState:&v89 objects:v103 count:16];
      v84 = (void *)v19;
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v90;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v90 != v22) {
              objc_enumerationMutation(obj);
            }
            id v24 = *(void **)(*((void *)&v89 + 1) + 8 * i);
            uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
            id v26 = v24;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              __int16 v27 = v26;
            }
            else {
              __int16 v27 = 0;
            }
            id v28 = v27;

            id v29 = v26;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v30 = v29;
            }
            else {
              id v30 = 0;
            }
            id v31 = v30;

            if (v28)
            {
              [v25 setObject:&unk_1EEF08160 forKeyedSubscript:@"HMWM.requestType"];
              id v32 = [v28 characteristic];
              v33 = [v32 uniqueIdentifier];
              [v25 setObject:v33 forKeyedSubscript:@"HMWM.characteristicUUID"];

              id v34 = [v28 value];
              [v25 setObject:v34 forKeyedSubscript:@"HMWM.characteristicValue"];
            }
            else
            {
              if (!v31)
              {
                id v70 = (void *)MEMORY[0x19F3A64A0]();
                v71 = self;
                v72 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                {
                  v73 = HMFGetLogIdentifier();
                  v74 = [v81 identifier];
                  v75 = [v74 shortDescription];
                  *(_DWORD *)buf = 138543874;
                  v94 = v73;
                  __int16 v95 = 2114;
                  v96 = v75;
                  __int16 v97 = 2112;
                  id v98 = v29;
                  _os_log_impl(&dword_19D1A8000, v72, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Request is not a supported type: %@", buf, 0x20u);
                }
                id v12 = aBlock;
                v76 = (void (**)(void *, void *))_Block_copy(aBlock);
                id v10 = v82;
                if (v76)
                {
                  v77 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
                  v76[2](v76, v77);
                }
                id v9 = v80;
                uint64_t v17 = v81;
                goto LABEL_41;
              }
              v35 = NSNumber;
              if ([v31 isMemberOfClass:objc_opt_class()]) {
                uint64_t v36 = 2;
              }
              else {
                uint64_t v36 = 1;
              }
              id v37 = [v35 numberWithInteger:v36];
              [v25 setObject:v37 forKeyedSubscript:@"HMWM.requestType"];

              id v34 = [v31 actionSet];
              v38 = [v34 uniqueIdentifier];
              [v25 setObject:v38 forKeyedSubscript:@"HMWM.actionSetUUID"];
            }
            uint64_t v19 = (uint64_t)v84;
            [v84 addObject:v25];
          }
          uint64_t v21 = [obj countByEnumeratingWithState:&v89 objects:v103 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      v101[0] = @"HMWM.requests";
      v101[1] = @"HMWM.widgetKind";
      id v10 = v82;
      v102[0] = v19;
      v102[1] = v82;
      v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:2];
      v40 = (void *)MEMORY[0x1E4F654B0];
      id v41 = objc_alloc(MEMORY[0x1E4F65488]);
      id v42 = [v18 uuid];
      id v43 = (void *)[v41 initWithTarget:v42];
      v44 = [v40 messageWithName:@"HMWM.performRequests" destination:v43 payload:v39];

      id v45 = (void *)MEMORY[0x19F3A64A0]();
      id v46 = v78;
      id v47 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        v48 = HMFGetLogIdentifier();
        id v49 = [v81 identifier];
        id v50 = [v49 shortDescription];
        v51 = [v44 identifier];
        *(_DWORD *)buf = 138544130;
        v94 = v48;
        __int16 v95 = 2114;
        v96 = v50;
        __int16 v97 = 2112;
        id v98 = v51;
        __int16 v99 = 2112;
        v100 = v84;
        _os_log_impl(&dword_19D1A8000, v47, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] [%@] Performing requests: %@", buf, 0x2Au);

        id v10 = v82;
      }

      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __54__HMWidgetManager_performRequests_forKind_completion___block_invoke;
      v86[3] = &unk_1E5945510;
      v86[4] = v46;
      uint64_t v17 = v81;
      id v87 = v81;
      id v12 = aBlock;
      id v88 = aBlock;
      [v44 setResponseHandler:v86];
      __int16 v52 = [(HMWidgetManager *)v46 context];
      __int16 v53 = [v52 messageDispatcher];
      [v53 sendMessage:v44];

      id v9 = v80;
LABEL_41:
      v60 = (void (**)(void *, void *))v84;
    }
    else
    {
      id v62 = (void *)MEMORY[0x19F3A64A0]();
      __int16 v63 = self;
      id v64 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        __int16 v65 = HMFGetLogIdentifier();
        uint64_t v66 = [v17 identifier];
        [v66 shortDescription];
        v85 = v62;
        v68 = __int16 v67 = v18;
        *(_DWORD *)buf = 138543618;
        v94 = v65;
        __int16 v95 = 2114;
        v96 = v68;
        _os_log_impl(&dword_19D1A8000, v64, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] No requests to process", buf, 0x16u);

        uint64_t v18 = v67;
        id v62 = v85;
      }
      __int16 v69 = (void (**)(void *, void *))_Block_copy(v12);
      v60 = v69;
      if (v69) {
        v69[2](v69, 0);
      }
    }
  }
  else
  {
    __int16 v54 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v55 = self;
    id v56 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      uint64_t v57 = HMFGetLogIdentifier();
      v58 = [v17 identifier];
      __int16 v59 = [v58 shortDescription];
      *(_DWORD *)buf = 138543618;
      v94 = v57;
      __int16 v95 = 2114;
      v96 = v59;
      _os_log_impl(&dword_19D1A8000, v56, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] HomeManager has been deallocated", buf, 0x16u);

      uint64_t v18 = 0;
    }

    v60 = (void (**)(void *, void *))_Block_copy(v12);
    if (v60)
    {
      __int16 v61 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      v60[2](v60, v61);
    }
  }
}

void __54__HMWidgetManager_performRequests_forKind_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = a1[4];
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [a1[5] identifier];
      id v13 = [v12 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v26 = v11;
      __int16 v27 = 2114;
      id v28 = v13;
      __int16 v29 = 2112;
      id v30 = v5;
      id v14 = "%{public}@[%{public}@] Failed to perform requests with error: %@";
      objc_super v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 32;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, buf, v17);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [a1[5] identifier];
    id v13 = [v12 shortDescription];
    *(_DWORD *)buf = 138543618;
    id v26 = v11;
    __int16 v27 = 2114;
    id v28 = v13;
    id v14 = "%{public}@[%{public}@] Successfully performed requests";
    objc_super v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    uint32_t v17 = 22;
    goto LABEL_6;
  }

  uint64_t v18 = [a1[4] context];
  uint64_t v19 = [v18 delegateCaller];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __54__HMWidgetManager_performRequests_forKind_completion___block_invoke_114;
  v22[3] = &unk_1E59454E8;
  id v20 = a1[6];
  id v23 = v5;
  id v24 = v20;
  id v21 = v5;
  [v19 invokeBlock:v22];
}

void __54__HMWidgetManager_performRequests_forKind_completion___block_invoke_114(uint64_t a1)
{
  id v2 = _Block_copy(*(const void **)(a1 + 40));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(void *, void))v2 + 2))(v2, *(void *)(a1 + 32));
    id v2 = v3;
  }
}

- (void)fetchStateForCharacteristics:(id)a3 completion:(id)a4
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
LABEL_12:
    _HMFPreconditionFailure();
  }
  id v9 = (void (**)(void, void, void))v8;
  if (!v8) {
    goto LABEL_12;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v11 = NSString;
  id v12 = MEMORY[0x19F3A5D00](self, a2);
  id v13 = [v11 stringWithFormat:@"%@, %s:%ld", v12, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/Widgets/HMWidgetManager.m", 203];
  id v14 = (void *)[v10 initWithName:v13];

  objc_super v15 = [(HMWidgetManager *)self homeManager];
  if (v15)
  {
    os_log_type_t v16 = objc_msgSend(v7, "na_map:", &__block_literal_global_99);
    id v17 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v18 = [v15 uuid];
    uint64_t v19 = (void *)[v17 initWithTarget:v18];

    id v56 = @"HMWM.characteristics";
    v57[0] = v16;
    v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
    id v20 = objc_msgSend(MEMORY[0x1E4F654B0], "messageWithName:destination:payload:", @"HMWM.fetchState", v19);
    id v21 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v24 = v40 = v21;
      [v14 identifier];
      uint64_t v25 = v42 = v14;
      [v25 shortDescription];
      v26 = id v43 = v7;
      [v20 identifier];
      id v41 = v19;
      __int16 v27 = v9;
      __int16 v29 = v28 = v15;
      *(_DWORD *)buf = 138544130;
      id v49 = v24;
      __int16 v50 = 2114;
      v51 = v26;
      __int16 v52 = 2112;
      __int16 v53 = v29;
      __int16 v54 = 2112;
      __int16 v55 = v16;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] [%@] Fetching state for characteristics: %@", buf, 0x2Au);

      objc_super v15 = v28;
      id v9 = v27;
      uint64_t v19 = v41;

      id v7 = v43;
      id v14 = v42;

      id v21 = v40;
    }

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __59__HMWidgetManager_fetchStateForCharacteristics_completion___block_invoke_100;
    v45[3] = &unk_1E5945510;
    v45[4] = v22;
    id v46 = v14;
    id v47 = v9;
    [v20 setResponseHandler:v45];
    id v30 = [(HMWidgetManager *)v22 context];
    uint64_t v31 = [v30 messageDispatcher];
    [v31 sendMessage:v20];
  }
  else
  {
    id v32 = v14;
    v33 = (void *)MEMORY[0x19F3A64A0]();
    id v34 = self;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = HMFGetLogIdentifier();
      [v32 identifier];
      v38 = id v37 = v7;
      v39 = [v38 shortDescription];
      *(_DWORD *)buf = 138543618;
      id v49 = v36;
      __int16 v50 = 2114;
      v51 = v39;
      _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] HomeManager has been deallocated", buf, 0x16u);

      id v7 = v37;
      objc_super v15 = 0;
    }
    os_log_type_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    ((void (**)(void, void, void *))v9)[2](v9, 0, v16);
    id v14 = v32;
  }
}

void __59__HMWidgetManager_fetchStateForCharacteristics_completion___block_invoke_100(id *a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = a1[4];
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [a1[5] identifier];
      id v13 = [v12 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v46 = v11;
      __int16 v47 = 2114;
      v48 = v13;
      __int16 v49 = 2112;
      id v50 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch state with error: %@", buf, 0x20u);
    }
    id v14 = [a1[4] context];
    objc_super v15 = [v14 delegateCaller];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __59__HMWidgetManager_fetchStateForCharacteristics_completion___block_invoke_101;
    v42[3] = &unk_1E59454E8;
    id v44 = a1[6];
    id v43 = v5;
    [v15 invokeBlock:v42];

    os_log_type_t v16 = v44;
  }
  else
  {
    os_log_type_t v16 = objc_msgSend(v6, "hmf_dictionaryForKey:", @"HMWM.characteristics");
    if (v16)
    {
      id v17 = [[HMWidgetManagerFetchStateResponse alloc] initWithValueByCharacteristicUniqueIdentifier:v16];
      uint64_t v18 = (void *)MEMORY[0x19F3A64A0]();
      id v19 = a1[4];
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = HMFGetLogIdentifier();
        uint64_t v22 = [a1[5] identifier];
        [v22 shortDescription];
        v23 = uint64_t v36 = v18;
        *(_DWORD *)buf = 138543618;
        id v46 = v21;
        __int16 v47 = 2114;
        v48 = v23;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched state", buf, 0x16u);

        uint64_t v18 = v36;
      }

      id v24 = [a1[4] context];
      uint64_t v25 = [v24 delegateCaller];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __59__HMWidgetManager_fetchStateForCharacteristics_completion___block_invoke_104;
      v37[3] = &unk_1E59454E8;
      id v26 = a1[6];
      v38 = v17;
      id v39 = v26;
      __int16 v27 = v17;
      [v25 invokeBlock:v37];
    }
    else
    {
      id v28 = (void *)MEMORY[0x19F3A64A0]();
      id v29 = a1[4];
      id v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = HMFGetLogIdentifier();
        id v32 = [a1[5] identifier];
        v33 = [v32 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v46 = v31;
        __int16 v47 = 2114;
        v48 = v33;
        _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Characteristic values are unexpectedly missing", buf, 0x16u);
      }
      id v34 = [a1[4] context];
      v35 = [v34 delegateCaller];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __59__HMWidgetManager_fetchStateForCharacteristics_completion___block_invoke_102;
      v40[3] = &unk_1E59454C0;
      id v41 = (HMWidgetManagerFetchStateResponse *)a1[6];
      [v35 invokeBlock:v40];

      __int16 v27 = v41;
    }
  }
}

uint64_t __59__HMWidgetManager_fetchStateForCharacteristics_completion___block_invoke_101(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __59__HMWidgetManager_fetchStateForCharacteristics_completion___block_invoke_102(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __59__HMWidgetManager_fetchStateForCharacteristics_completion___block_invoke_104(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __59__HMWidgetManager_fetchStateForCharacteristics_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (void)monitorAndFetchStateForCharacteristics:(id)a3 monitorReachabilityChanges:(BOOL)a4 widgetIdentifier:(id)a5 kind:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  v77[5] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v14)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v15)
  {
LABEL_15:
    _HMFPreconditionFailure();
LABEL_16:
    _HMFPreconditionFailure();
  }
  if (!v16) {
    goto LABEL_16;
  }
  __int16 v59 = (void (**)(void, void, void))v16;
  id v17 = objc_alloc(MEMORY[0x1E4F653F0]);
  uint64_t v18 = NSString;
  id v19 = MEMORY[0x19F3A5D00](self, a2);
  id v20 = [v18 stringWithFormat:@"%@, %s:%ld", v19, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/Widgets/HMWidgetManager.m", 129];
  v60 = (void *)[v17 initWithName:v20];

  id v21 = [(HMWidgetManager *)self homeManager];
  if (v21)
  {
    id v56 = v13;
    uint64_t v22 = objc_msgSend(v13, "na_map:", &__block_literal_global_51724);
    id v23 = objc_alloc(MEMORY[0x1E4F65488]);
    id v24 = [v21 uuid];
    uint64_t v25 = (void *)[v23 initWithTarget:v24];

    v76[0] = @"HMWM.widgetIdentifier";
    v76[1] = @"HMWM.widgetKind";
    v77[0] = v14;
    v77[1] = v15;
    uint64_t v57 = (void *)v22;
    v77[2] = v22;
    v76[2] = @"HMWM.characteristics";
    v76[3] = @"HMWM.generationCounter";
    id v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "generationCounterPostHomeGraphUpdate"));
    v77[3] = v26;
    v76[4] = @"HMWM.reachability";
    __int16 v27 = [NSNumber numberWithBool:v10];
    v77[4] = v27;
    id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:5];
    id v29 = (void *)[v28 mutableCopy];

    id v30 = [v21 currentHome];
    uint64_t v31 = [v30 uuid];
    [v29 setObject:v31 forKeyedSubscript:@"HMWM.currentHome"];

    __int16 v55 = v29;
    id v32 = [MEMORY[0x1E4F654B0] messageWithName:@"HMWM.monitorCharacteristics" destination:v25 payload:v29];
    v33 = (void *)MEMORY[0x19F3A64A0]();
    id v34 = self;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = HMFGetLogIdentifier();
      id v37 = [v60 identifier];
      [v37 shortDescription];
      __int16 v53 = v33;
      id v39 = v38 = v14;
      [v32 identifier];
      __int16 v54 = v25;
      id v41 = v40 = v15;
      *(_DWORD *)buf = 138544642;
      __int16 v65 = v36;
      __int16 v66 = 2114;
      __int16 v67 = v39;
      __int16 v68 = 2112;
      __int16 v69 = v41;
      __int16 v70 = 2112;
      id v71 = v38;
      __int16 v72 = 2112;
      id v73 = v40;
      __int16 v74 = 2112;
      v75 = v57;
      _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] [%@] Monitoring characteristics for widget (%@, %@): %@", buf, 0x3Eu);

      id v15 = v40;
      uint64_t v25 = v54;

      id v14 = v38;
      v33 = v53;
    }
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_90;
    v61[3] = &unk_1E5945510;
    v61[4] = v34;
    id v42 = v60;
    id v62 = v60;
    id v43 = v59;
    __int16 v63 = v59;
    [v32 setResponseHandler:v61];
    id v44 = [(HMWidgetManager *)v34 context];
    id v45 = [v44 messageDispatcher];
    [v45 sendMessage:v32];

    id v13 = v56;
    id v46 = v57;
  }
  else
  {
    id v58 = v15;
    __int16 v47 = (void *)MEMORY[0x19F3A64A0]();
    v48 = self;
    __int16 v49 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      id v50 = HMFGetLogIdentifier();
      uint64_t v51 = [v60 identifier];
      __int16 v52 = [v51 shortDescription];
      *(_DWORD *)buf = 138543618;
      __int16 v65 = v50;
      __int16 v66 = 2114;
      __int16 v67 = v52;
      _os_log_impl(&dword_19D1A8000, v49, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] HomeManager has been deallocated", buf, 0x16u);
    }
    id v46 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    id v43 = v59;
    ((void (**)(void, void, void *))v59)[2](v59, 0, v46);
    id v15 = v58;
    id v42 = v60;
  }
}

void __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_90(id *a1, void *a2, void *a3)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = a1[4];
    BOOL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [a1[5] identifier];
      id v13 = [v12 shortDescription];
      *(_DWORD *)buf = 138543874;
      __int16 v59 = v11;
      __int16 v60 = 2114;
      __int16 v61 = v13;
      __int16 v62 = 2112;
      id v63 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to monitor characteristics with error: %@", buf, 0x20u);
    }
    id v14 = [a1[4] context];
    id v15 = [v14 delegateCaller];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_91;
    v55[3] = &unk_1E59454E8;
    id v57 = a1[6];
    id v56 = v5;
    [v15 invokeBlock:v55];

    id v16 = v57;
  }
  else
  {
    id v16 = objc_msgSend(v6, "hmf_dictionaryForKey:", @"HMWM.characteristics");
    if (v16)
    {
      id v17 = objc_msgSend(v7, "hmf_dictionaryForKey:", @"HMWM.reachability");
      if (v17)
      {
        uint64_t v18 = [[HMWidgetManagerMonitorCharacteristicsResponse alloc] initWithValueByCharacteristicUniqueIdentifier:v16 reachabilityByAccessoryUniqueIdentifier:v17];
        id v19 = (void *)MEMORY[0x19F3A64A0]();
        id v20 = a1[4];
        id v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          uint64_t v22 = v46 = v18;
          id v23 = [a1[5] identifier];
          [v23 shortDescription];
          id v24 = v45 = v19;
          *(_DWORD *)buf = 138543618;
          __int16 v59 = v22;
          __int16 v60 = 2114;
          __int16 v61 = v24;
          _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully monitored characteristics", buf, 0x16u);

          id v19 = v45;
          uint64_t v18 = v46;
        }

        uint64_t v25 = [a1[4] context];
        id v26 = [v25 delegateCaller];
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_96;
        v48[3] = &unk_1E59454E8;
        id v27 = a1[6];
        __int16 v49 = v18;
        id v50 = v27;
        id v28 = v18;
        [v26 invokeBlock:v48];
      }
      else
      {
        id v37 = (void *)MEMORY[0x19F3A64A0]();
        id v38 = a1[4];
        id v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          id v40 = HMFGetLogIdentifier();
          id v41 = [a1[5] identifier];
          [v41 shortDescription];
          id v42 = v47 = v37;
          *(_DWORD *)buf = 138543618;
          __int16 v59 = v40;
          __int16 v60 = 2114;
          __int16 v61 = v42;
          _os_log_impl(&dword_19D1A8000, v39, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Accessory reachability is unexpectedly missing", buf, 0x16u);

          id v37 = v47;
        }

        id v43 = [a1[4] context];
        id v44 = [v43 delegateCaller];
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_94;
        v51[3] = &unk_1E59454C0;
        __int16 v52 = (HMWidgetManagerMonitorCharacteristicsResponse *)a1[6];
        [v44 invokeBlock:v51];

        id v28 = v52;
      }
    }
    else
    {
      id v29 = (void *)MEMORY[0x19F3A64A0]();
      id v30 = a1[4];
      uint64_t v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        id v32 = HMFGetLogIdentifier();
        v33 = [a1[5] identifier];
        id v34 = [v33 shortDescription];
        *(_DWORD *)buf = 138543618;
        __int16 v59 = v32;
        __int16 v60 = 2114;
        __int16 v61 = v34;
        _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Characteristic values are unexpectedly missing", buf, 0x16u);
      }
      v35 = [a1[4] context];
      uint64_t v36 = [v35 delegateCaller];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_93;
      v53[3] = &unk_1E59454C0;
      id v54 = a1[6];
      [v36 invokeBlock:v53];

      id v17 = v54;
    }
  }
}

uint64_t __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_91(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_93(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_94(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_96(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (void)monitorAndFetchStateForCharacteristics:(id)a3 widgetIdentifier:(id)a4 kind:(id)a5 completion:(id)a6
{
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t37_51752 != -1) {
    dispatch_once(&logCategory__hmf_once_t37_51752, &__block_literal_global_138);
  }
  id v2 = (void *)logCategory__hmf_once_v38_51753;

  return v2;
}

uint64_t __30__HMWidgetManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v38_51753;
  logCategory__hmf_once_v38_51753 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end