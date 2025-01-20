@interface HUUnreachableResidentsBannerItem
- (BOOL)_hasPotentialResidentsConfiguring;
- (BOOL)forceHidden;
- (id)_subclass_updateWithOptions:(id)a3;
- (void)setForceHidden:(BOOL)a3;
@end

@implementation HUUnreachableResidentsBannerItem

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v5 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F68720]];
  char v6 = [v5 BOOLValue];

  v7 = [(HUBannerItem *)self home];
  v8 = [v7 residentDevices];

  v9 = objc_msgSend(v8, "na_filter:", &__block_literal_global_236);
  v10 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v11 = [v10 homeManager];
  int v12 = [v11 hasOptedToHH2];

  v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = NSStringFromSelector(a2);
    uint64_t v15 = [v8 count];
    uint64_t v16 = [v9 count];
    v17 = @"NO";
    *(_DWORD *)buf = 138413570;
    v43 = self;
    __int16 v44 = 2112;
    if (v12) {
      v17 = @"YES";
    }
    v45 = v14;
    __int16 v46 = 2048;
    uint64_t v47 = v15;
    __int16 v48 = 2048;
    uint64_t v49 = v16;
    __int16 v50 = 2112;
    v51 = v9;
    __int16 v52 = 2112;
    v53 = v17;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@ Total residents: %lu - Reachable (%lu): %@ - hasOptedToHH2: %@", buf, 0x3Eu);
  }
  v41 = v9;
  if (![v8 count] || (!objc_msgSend(v9, "count") ? (char v18 = v12) : (char v18 = 0), (v18 & 1) == 0))
  {
    v19 = HFLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v43 = self;
      __int16 v44 = 2112;
      v45 = v20;
      v21 = "%@:%@ Setting banner shouldShow to NO";
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (v6)
  {
LABEL_20:
    int v22 = 0;
    goto LABEL_21;
  }
  if ([v8 count]
    && ![v9 count]
    && [(HUUnreachableResidentsBannerItem *)self _hasPotentialResidentsConfiguring])
  {
    v19 = HFLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v43 = self;
      __int16 v44 = 2112;
      v45 = v20;
      v21 = "%@:%@: Hiding banner since there are HomePods or Apple TVs in the home that are still configuring.";
LABEL_18:
      _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 0x16u);

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  int v22 = 1;
LABEL_21:
  if ([(HUBannerItem *)self forceShowBanner])
  {
    v23 = HFLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v43 = self;
      __int16 v44 = 2112;
      v45 = v24;
      _os_log_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEFAULT, "%@:%@ Forcing banner shouldShow to YES", buf, 0x16u);
    }
    int v22 = 1;
  }
  v25 = objc_opt_new();
  v26 = _HULocalizedStringWithDefaultValue(@"HUUnreachableResidents_Title", @"HUUnreachableResidents_Title", 1);
  [v25 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v25 setObject:@"Home.Banners.UnreachableResident" forKeyedSubscript:*MEMORY[0x1E4F68928]];
  [v25 setObject:@"HUUnreachableResidents_Title" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
  v27 = _HULocalizedStringWithDefaultValue(@"HUUnreachableResidents_Details", @"HUUnreachableResidents_Details", 1);
  [v25 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  v28 = _HULocalizedStringWithDefaultValue(@"HUUnreachableResidents_Control_Description", @"HUUnreachableResidents_Control_Description", 1);
  [v25 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F68948]];

  v29 = (void *)MEMORY[0x1E4F42A98];
  v30 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  v31 = [v29 configurationWithHierarchicalColor:v30];

  v32 = [MEMORY[0x1E4F42A98] configurationWithScale:0];
  v33 = [v32 configurationByApplyingConfiguration:v31];
  v34 = (void *)[objc_alloc(MEMORY[0x1E4F69600]) initWithSystemImageName:@"homekit" configuration:v33];
  v35 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSymbolIconConfiguration:v34];
  [v25 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F689E8]];
  v36 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v25 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F68900]];

  v37 = [(HUBannerItem *)self home];
  LODWORD(v36) = [v37 supportsResidentSelection];

  v38 = [NSNumber numberWithInt:v36 | v22 ^ 1];
  [v25 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  [v25 setObject:&unk_1F19B4E08 forKeyedSubscript:@"bannerItemCategory"];
  v39 = [MEMORY[0x1E4F7A0D8] futureWithResult:v25];

  return v39;
}

uint64_t __64__HUUnreachableResidentsBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isReachable");
}

- (BOOL)_hasPotentialResidentsConfiguring
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = [(HUBannerItem *)self home];
  v5 = [v4 residentDevices];

  char v6 = [(HUBannerItem *)self home];
  v7 = [v6 accessories];
  v8 = objc_msgSend(v7, "na_filter:", &__block_literal_global_32_1);

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__HUUnreachableResidentsBannerItem__hasPotentialResidentsConfiguring__block_invoke_2;
  v16[3] = &unk_1E63869C8;
  id v17 = v5;
  id v9 = v5;
  v10 = objc_msgSend(v8, "na_filter:", v16);
  uint64_t v11 = [v10 count];
  if (v11)
  {
    int v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = NSStringFromSelector(a2);
      uint64_t v14 = [v10 count];
      *(_DWORD *)buf = 138413058;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v13;
      __int16 v22 = 2048;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Found %lu potential residents that are not in the residents list - possible configuring state: %@ ", buf, 0x2Au);
    }
  }

  return v11 != 0;
}

uint64_t __69__HUUnreachableResidentsBannerItem__hasPotentialResidentsConfiguring__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isHomePod")) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = objc_msgSend(v2, "hf_isAppleTV");
  }

  return v3;
}

uint64_t __69__HUUnreachableResidentsBannerItem__hasPotentialResidentsConfiguring__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__HUUnreachableResidentsBannerItem__hasPotentialResidentsConfiguring__block_invoke_3;
  v8[3] = &unk_1E638AE60;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8) ^ 1;

  return v6;
}

BOOL __69__HUUnreachableResidentsBannerItem__hasPotentialResidentsConfiguring__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "hf_linkedAccessory");
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (BOOL)forceHidden
{
  return self->_forceHidden;
}

- (void)setForceHidden:(BOOL)a3
{
  self->_forceHidden = a3;
}

@end