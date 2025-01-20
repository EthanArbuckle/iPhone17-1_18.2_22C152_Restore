@interface HUServiceDetailsCollectDiagnosticsItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUServiceDetailsCollectDiagnosticsItem

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  v4 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [v6 accessory];

  if (!v7)
  {
    objc_opt_class();
    v8 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
    v9 = (objc_opt_isKindOfClass() & 1) != 0 ? v8 : 0;
    id v10 = v9;

    v11 = [v10 service];

    v7 = [v11 accessory];

    if (!v7)
    {
      v12 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
      v13 = [v12 accessories];

      v7 = [v13 anyObject];
    }
  }
  v66 = self;
  v14 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v15 = [v14 home];
  int v16 = objc_msgSend(v15, "hf_currentUserIsAdministrator");

  v17 = [v7 supportedDiagnostics];
  unint64_t v18 = [v17 supportedTypes];

  uint64_t v19 = HFPreferencesBooleanValueForKey();
  uint64_t v67 = v19;
  if (([MEMORY[0x1E4F69758] isInternalInstall] & 1) != 0 || v19 == 2) {
    uint64_t v20 = (v18 >> 1) & 1;
  }
  else {
    LODWORD(v20) = 0;
  }
  unint64_t v21 = v18 & 1;
  if ([v7 supportsCHIP])
  {
    v22 = [v7 home];
    v23 = objc_msgSend(v22, "hdm_sharedMatterController");
    if (!v23)
    {
      v24 = HFLogForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v65 = [v22 matterControllerID];
        *(_DWORD *)buf = 138412546;
        *(void *)v75 = v22;
        *(_WORD *)&v75[8] = 2112;
        v76 = v65;
        _os_log_error_impl(&dword_1BE345000, v24, OS_LOG_TYPE_ERROR, "No MTRDeviceController found for home: %@, matterControllerID: %@", buf, 0x16u);
      }
    }
    v25 = (void *)MEMORY[0x1E4F31188];
    v26 = [v7 matterNodeID];
    v27 = [v25 deviceWithNodeID:v26 controller:v23];

    if (!v27)
    {
      v28 = HFLogForCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v75 = v7;
        *(_WORD *)&v75[8] = 2112;
        v76 = v23;
        _os_log_error_impl(&dword_1BE345000, v28, OS_LOG_TYPE_ERROR, "No MTRDevice found for sourceAccessory: %@, MTRDeviceController: %@", buf, 0x16u);
      }
    }
    v29 = [v27 readAttributeWithEndpointID:&unk_1F19B3F98 clusterID:&unk_1F19B3FB0 attributeID:&unk_1F19B3FC8 params:0];
    if (!v29)
    {
      v30 = HFLogForCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v75 = v27;
        _os_log_error_impl(&dword_1BE345000, v30, OS_LOG_TYPE_ERROR, "No attributes found for device: %@", buf, 0xCu);
      }
    }
    v31 = [v29 allValues];
    int v32 = [v31 containsObject:&unk_1F19B3FE0];
  }
  else
  {
    int v32 = 0;
  }
  if (v7) {
    int v33 = v16;
  }
  else {
    int v33 = 0;
  }
  if ((v33 & (v21 == 0)) != 0) {
    int v34 = v20 | v32;
  }
  else {
    int v34 = v33;
  }
  v35 = HFLogForCategory();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    int v36 = [MEMORY[0x1E4F69758] isInternalInstall];
    *(_DWORD *)buf = 67110912;
    *(_DWORD *)v75 = v34;
    *(_WORD *)&v75[4] = 1024;
    *(_DWORD *)&v75[6] = v16;
    LOWORD(v76) = 1024;
    *(_DWORD *)((char *)&v76 + 2) = v7 != 0;
    HIWORD(v76) = 1024;
    int v77 = v21;
    __int16 v78 = 1024;
    int v79 = v20;
    __int16 v80 = 1024;
    int v81 = v32;
    __int16 v82 = 1024;
    BOOL v83 = v67 == 2;
    __int16 v84 = 1024;
    int v85 = v36;
    _os_log_impl(&dword_1BE345000, v35, OS_LOG_TYPE_INFO, "Showing Logs button: %{BOOL}d. isAdmin= %{BOOL}d, sourceAccessory= %{BOOL}d, manufacturerSnapshot= %{BOOL}d, adkSnapshot= %{BOOL}d, matterSnapshot= %{BOOL}d, supportProfileInstalled= %{BOOL}d, isInternalInstall= %{BOOL}d", buf, 0x32u);
  }

  v37 = (void *)MEMORY[0x1E4F692F0];
  v72[0] = *MEMORY[0x1E4F68AB8];
  v38 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsCollectDiagnosticsButton", @"HUServiceDetailsCollectDiagnosticsButton", 1);
  v73[0] = v38;
  uint64_t v39 = *MEMORY[0x1E4F68B10];
  v72[1] = *MEMORY[0x1E4F68B10];
  uint64_t v40 = v34 ^ 1u;
  v41 = [NSNumber numberWithInt:v40];
  v73[1] = v41;
  v72[2] = *MEMORY[0x1E4F68908];
  v42 = objc_msgSend(MEMORY[0x1E4F1CAD0], "na_setWithSafeObject:", v7);
  v73[2] = v42;
  v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:3];
  v44 = [v37 outcomeWithResults:v43];

  if (!v20 || (v40 & 1) != 0 || v67 == 2)
  {
    v54 = [MEMORY[0x1E4F7A0D8] futureWithResult:v44];
  }
  else
  {
    objc_opt_class();
    v45 = [(HUServiceDetailsAbstractItem *)v66 sourceServiceItem];
    if (objc_opt_isKindOfClass()) {
      v46 = v45;
    }
    else {
      v46 = 0;
    }
    id v47 = v46;

    if (v47)
    {
      v48 = [v47 accessories];
      if ([v48 count] != 1) {
        NSLog(&cfstr_ExpectedOneAcc.isa, v48);
      }
      v49 = [v48 anyObject];
      v50 = [v49 services];
      v51 = objc_msgSend(v50, "na_firstObjectPassingTest:", &__block_literal_global_72);

      v52 = objc_msgSend(MEMORY[0x1E4F1CAD0], "na_setWithSafeObject:", v51);
      v53 = [v47 valueSource];
    }
    else
    {
      v55 = [(HUServiceDetailsAbstractItem *)v66 sourceServiceItem];
      v53 = [v55 valueSource];

      v48 = [(HUServiceDetailsAbstractItem *)v66 sourceServiceItem];
      v52 = [v48 services];
    }

    id v56 = objc_alloc(MEMORY[0x1E4F69580]);
    v57 = [v52 anyObject];
    v58 = objc_msgSend(v57, "hf_serviceDescriptor");
    v59 = (void *)[v56 initWithValueSource:v53 services:v52 primaryServiceDescriptor:v58];

    id v60 = objc_alloc(MEMORY[0x1E4F68DF0]);
    uint64_t v70 = v39;
    uint64_t v71 = MEMORY[0x1E4F1CC38];
    v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    v62 = (void *)[v60 initWithValueSource:v59 displayResults:v61];

    v63 = [v62 updateWithOptions:MEMORY[0x1E4F1CC08]];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __70__HUServiceDetailsCollectDiagnosticsItem__subclass_updateWithOptions___block_invoke_2;
    v68[3] = &unk_1E6389290;
    id v69 = v44;
    v54 = [v63 flatMap:v68];
  }

  return v54;
}

uint64_t __70__HUServiceDetailsCollectDiagnosticsItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F2DE10]];

  return v3;
}

id __70__HUServiceDetailsCollectDiagnosticsItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F683D8]];
  uint64_t v4 = [v3 integerValue] & 2;
  if (!(v4 & 0xFFFFFFFFFFFFFFFELL | [v3 integerValue] & 1))
  {
    [*(id *)(a1 + 32) safeSetObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F68B10]];
    v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8[0] = 67109376;
      v8[1] = 0;
      __int16 v9 = 1024;
      int v10 = 0;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_INFO, "Hiding Logs button. verboseLogging= %{BOOL}d, audioClips= %{BOOL}d", (uint8_t *)v8, 0xEu);
    }
  }
  id v6 = [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];

  return v6;
}

@end