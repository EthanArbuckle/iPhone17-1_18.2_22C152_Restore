@interface HMAssistantAccessControl(HFAdditions)
- (uint64_t)hf_effectivelyEnabledForSupportedVoiceRecognitionLanguages:()HFAdditions currentUserIsOwner:;
@end

@implementation HMAssistantAccessControl(HFAdditions)

- (uint64_t)hf_effectivelyEnabledForSupportedVoiceRecognitionLanguages:()HFAdditions currentUserIsOwner:
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = HFLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v43 = v9;
    __int16 v44 = 1024;
    *(_DWORD *)v45 = a4;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "%@ Is Current User the Owner?: %{BOOL}d", buf, 0x12u);
  }
  if ([a1 isEnabled])
  {
    v10 = [a1 accessories];
    uint64_t v11 = [v10 count] != 0;

    if (!a4) {
      goto LABEL_5;
    }
LABEL_11:
    v15 = HFLogForCategory(0);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    v20 = NSStringFromSelector(a2);
    v21 = [a1 accessories];
    uint64_t v22 = [v21 count];
    int v23 = [a1 isEnabled];
    *(_DWORD *)buf = 138413058;
    v43 = v20;
    __int16 v44 = 1024;
    *(_DWORD *)v45 = v11;
    *(_WORD *)&v45[4] = 2048;
    *(void *)&v45[6] = v22;
    *(_WORD *)&v45[14] = 1024;
    *(_DWORD *)&v45[16] = v23;
    _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "%@ = %{BOOL}d because (owner case) Owner has Siri (Assistant) accessories count = %lu, self.enabled = %{BOOL}d", buf, 0x22u);

LABEL_25:
    goto LABEL_26;
  }
  uint64_t v11 = 0;
  if (a4) {
    goto LABEL_11;
  }
LABEL_5:
  v12 = [a1 accessories];
  uint64_t v13 = [v12 count];

  if (!v13)
  {
    v15 = HFLogForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v24 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v43 = v24;
      _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "%@ No Siri accessories available for this user", buf, 0xCu);
    }
    int v25 = 0;
    goto LABEL_23;
  }
  v14 = [a1 accessories];
  v15 = objc_msgSend(v14, "na_filter:", &__block_literal_global_127);

  if (![v15 count])
  {
    v26 = [a1 accessories];
    v27 = objc_msgSend(v26, "na_filter:", &__block_literal_global_3_18);

    v28 = HFLogForCategory(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = NSStringFromSelector(a2);
      uint64_t v30 = [v15 count];
      uint64_t v31 = [v27 count];
      v32 = [a1 accessories];
      uint64_t v33 = [v32 count];
      *(_DWORD *)buf = 138413570;
      v43 = v29;
      __int16 v44 = 2048;
      *(void *)v45 = v30;
      *(_WORD *)&v45[8] = 2112;
      *(void *)&v45[10] = v15;
      *(_WORD *)&v45[18] = 2048;
      uint64_t v46 = v31;
      __int16 v47 = 2112;
      v48 = v27;
      __int16 v49 = 2048;
      uint64_t v50 = v33;
      _os_log_impl(&dword_20B986000, v28, OS_LOG_TYPE_DEFAULT, "%@ (non-owner case) Siri Accessories NOT Supporting Voice Recognition (%lu) = [%@] / Supporting Multi-User (%lu) = [%@] (Total Siri Accessory count: (%lu)", buf, 0x3Eu);
    }
    if (![v27 count]) {
      NSLog(&cfstr_ThisShouldNotH_0.isa);
    }
    uint64_t v34 = [v27 count];
    uint64_t v35 = [v15 count] + v34;
    v36 = [a1 accessories];
    uint64_t v37 = [v36 count];

    if (v35 != v37) {
      NSLog(&cfstr_ThisShouldNotH_1.isa);
    }
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __119__HMAssistantAccessControl_HFAdditions__hf_effectivelyEnabledForSupportedVoiceRecognitionLanguages_currentUserIsOwner___block_invoke_8;
    v40[3] = &unk_26408D968;
    id v41 = v7;
    int v25 = objc_msgSend(v27, "na_any:", v40);

LABEL_23:
    uint64_t v11 = [a1 isEnabled] & v25;
    v15 = HFLogForCategory(0);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    v20 = NSStringFromSelector(a2);
    int v38 = [a1 isEnabled];
    *(_DWORD *)buf = 138413058;
    v43 = v20;
    __int16 v44 = 1024;
    *(_DWORD *)v45 = v11;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = v25;
    *(_WORD *)&v45[10] = 1024;
    *(_DWORD *)&v45[12] = v38;
    _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "%@ = %{BOOL}d (non-owner case) At least one Siri accessory is on a supported Voice Recognition language = %{BOOL}d, & self.enabled = %{BOOL}d", buf, 0x1Eu);
    goto LABEL_25;
  }
  v16 = HFLogForCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = NSStringFromSelector(a2);
    int v18 = [a1 isEnabled];
    uint64_t v19 = [v15 count];
    *(_DWORD *)buf = 138412802;
    v43 = v17;
    __int16 v44 = 1024;
    *(_DWORD *)v45 = v18;
    *(_WORD *)&v45[4] = 2048;
    *(void *)&v45[6] = v19;
    _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "%@ = %{BOOL}d (non-owner case) Some Siri accessories don't support Voice Recognition (%lu), so we'll rely on self.enabled", buf, 0x1Cu);
  }
  uint64_t v11 = [a1 isEnabled];
LABEL_26:

  return v11;
}

@end