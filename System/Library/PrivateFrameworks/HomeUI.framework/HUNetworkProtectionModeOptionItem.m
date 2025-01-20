@interface HUNetworkProtectionModeOptionItem
+ (int64_t)_priorityForTargetProtectionMode:(int64_t)a3;
- (HMAccessoryNetworkProtectionGroup)group;
- (HUNetworkProtectionModeOptionItem)initWithGroup:(id)a3 targetProtectionModeOption:(int64_t)a4;
- (id)_subclass_updateWithOptions:(id)a3;
- (int64_t)targetProtectionModeOption;
@end

@implementation HUNetworkProtectionModeOptionItem

- (HUNetworkProtectionModeOptionItem)initWithGroup:(id)a3 targetProtectionModeOption:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUNetworkProtectionModeOptionItem;
  v8 = [(HUNetworkProtectionModeOptionItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_group, a3);
    v9->_targetProtectionModeOption = a4;
  }

  return v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v3 = self;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CA80];
  v5 = [(HUNetworkProtectionModeOptionItem *)self group];
  v6 = objc_msgSend(v5, "hf_networkConfigurationProfiles");
  id v7 = [v4 setWithArray:v6];

  v8 = [v3 group];
  [v7 addObject:v8];

  v9 = [v3 group];
  v10 = objc_msgSend(v9, "hf_home");
  v48 = v7;
  objc_msgSend(v7, "na_safeAddObject:", v10);

  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F2E9C0], "hf_detailedLocalizedTitleForTargetProtectionMode:", objc_msgSend(v3, "targetProtectionModeOption"));
  v12 = [v3 group];
  uint64_t v13 = [v12 targetProtectionMode];
  uint64_t v14 = [v3 targetProtectionModeOption];

  v15 = [v3 group];
  v16 = objc_msgSend(v15, "hf_networkConfigurationProfiles");
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __65__HUNetworkProtectionModeOptionItem__subclass_updateWithOptions___block_invoke;
  v49[3] = &unk_1E638A538;
  v49[4] = v3;
  uint64_t v17 = objc_msgSend(v16, "na_any:", v49);

  v18 = HFLogForCategory();
  v47 = (void *)v11;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [v3 targetProtectionModeOption];
    BOOL v20 = v13 == v14;
    uint64_t v43 = v13;
    if (v13 == v14) {
      int v21 = v17;
    }
    else {
      int v21 = 0;
    }
    v22 = [v3 group];
    [v3 group];
    v23 = unsigned int v45 = v17;
    v24 = objc_msgSend(v23, "hf_title");
    [v3 group];
    v25 = uint64_t v42 = v14;
    uint64_t v26 = [v25 targetProtectionMode];
    *(_DWORD *)buf = 134219778;
    v53 = v3;
    __int16 v54 = 2112;
    v55 = v47;
    __int16 v56 = 2048;
    uint64_t v57 = v19;
    __int16 v58 = 1024;
    BOOL v59 = v20;
    uint64_t v11 = (uint64_t)v47;
    __int16 v60 = 1024;
    int v61 = v21;
    uint64_t v13 = v43;
    __int16 v62 = 2112;
    v63 = v22;
    __int16 v64 = 2112;
    v65 = v24;
    __int16 v66 = 2048;
    uint64_t v67 = v26;
    _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "<HUNetworkProtectionModeOptionItem: %p \"%@\"/%lu> (selected=%{BOOL}d, updating=%{BOOL}d) for group (%@ \"%@\", target mode %lu)", buf, 0x4Au);

    uint64_t v14 = v42;
    uint64_t v17 = v45;
  }
  v44 = (void *)MEMORY[0x1E4F69228];
  uint64_t v27 = *MEMORY[0x1E4F68AB8];
  v50[0] = *MEMORY[0x1E4F68908];
  v50[1] = v27;
  v51[0] = v7;
  v51[1] = v11;
  v50[2] = *MEMORY[0x1E4F68980];
  v46 = objc_msgSend(MEMORY[0x1E4F2E9C0], "hf_detailedLocalizedDescriptionForTargetProtectionMode:", objc_msgSend(v3, "targetProtectionModeOption"));
  v51[2] = v46;
  v50[3] = *MEMORY[0x1E4F68B40];
  v28 = [NSNumber numberWithBool:v13 == v14];
  v51[3] = v28;
  v50[4] = *MEMORY[0x1E4F68C48];
  v29 = [NSNumber numberWithBool:v17];
  v51[4] = v29;
  v50[5] = *MEMORY[0x1E4F68B48];
  v30 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)objc_opt_class(), "_priorityForTargetProtectionMode:", objc_msgSend(v3, "targetProtectionModeOption")));
  v51[5] = v30;
  v50[6] = *MEMORY[0x1E4F68A08];
  v31 = NSNumber;
  v32 = [v3 group];
  v33 = objc_msgSend(v32, "hf_home");
  int v34 = objc_msgSend(v33, "hf_isNetworkProtectionSupportedForAccessories");
  if (v34)
  {
    v35 = (void *)MEMORY[0x1E4F2E9C0];
    v3 = [v3 group];
    uint64_t v36 = objc_msgSend(v35, "hf_targetProtectionModeIsValid:", objc_msgSend(v3, "targetProtectionMode")) ^ 1;
  }
  else
  {
    uint64_t v36 = 1;
  }
  v37 = [v31 numberWithInt:v36];
  v51[6] = v37;
  v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:7];
  v39 = [v44 outcomeWithResults:v38];

  if (v34) {
  v40 = [MEMORY[0x1E4F7A0D8] futureWithResult:v39];
  }

  return v40;
}

uint64_t __65__HUNetworkProtectionModeOptionItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F2E9C0];
  uint64_t v4 = [a2 currentProtectionMode];
  v5 = [*(id *)(a1 + 32) group];
  uint64_t v6 = objc_msgSend(v3, "hf_currentProtectionMode:isValidForTargetProtectionMode:", v4, objc_msgSend(v5, "targetProtectionMode")) ^ 1;

  return v6;
}

+ (int64_t)_priorityForTargetProtectionMode:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return qword_1BEA19F00[a3];
  }
}

- (int64_t)targetProtectionModeOption
{
  return self->_targetProtectionModeOption;
}

- (HMAccessoryNetworkProtectionGroup)group
{
  return self->_group;
}

- (void).cxx_destruct
{
}

@end