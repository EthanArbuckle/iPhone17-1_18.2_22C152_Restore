@interface HUHomePodServiceDetails
+ (id)SAHomePodCardForMediaRoutingIdentifier:(id)a3 deviceName:(id)a4 mediaAccessoryItemType:(int64_t)a5;
+ (id)SAHomePodCardForMediaRoutingIdentifier:(id)a3 deviceName:(id)a4 mediaAccessoryItemType:(int64_t)a5 cornerRadius:(double)a6;
+ (id)SAHomePodCardWithQuickControlsForDeviceUUID:(id)a3 inHomeWithUUID:(id)a4;
+ (id)SAHomePodCardWithQuickControlsForDeviceUUID:(id)a3 inHomeWithUUID:(id)a4 cornerRadius:(double)a5;
+ (id)_homePodDetailsViewControllerForAccessory:(id)a3 inHome:(id)a4 cornerRadius:(double)a5;
+ (id)_homePodDetailsViewControllerForAccessoryWithMediaRoutingIdentifier:(id)a3 deviceName:(id)a4 mediaAccessoryItemType:(int64_t)a5 cornerRadius:(double)a6;
+ (id)_homePodDetailsViewControllerForHomePodWithUUID:(id)a3 inHomeWithUUID:(id)a4 fromHomes:(id)a5 cornerRadius:(double)a6;
+ (id)_homePodDetailsViewControllerForMediaRoutingIdentifier:(id)a3 deviceName:(id)a4 mediaAccessoryItemType:(int64_t)a5 cornerRadius:(double)a6;
+ (id)_homePodSettingsViewControllerForAccessory:(id)a3 inHome:(id)a4;
+ (id)_homePodSettingsViewControllerForHomePodWithUUID:(id)a3 inHomeWithUUID:(id)a4 fromHomes:(id)a5;
+ (id)homePodCardForDeviceUUID:(id)a3 inHomeWithUUID:(id)a4;
+ (id)homePodCardForMediaRoutingIdentifier:(id)a3 deviceName:(id)a4 mediaAccessoryItemType:(int64_t)a5;
+ (id)homePodCardWithQuickControlsForDeviceUUID:(id)a3 inHomeWithUUID:(id)a4;
+ (id)homePodCardWithQuickControlsForDeviceUUID:(id)a3 inHomeWithUUID:(id)a4 cornerRadius:(double)a5;
@end

@implementation HUHomePodServiceDetails

+ (id)homePodCardWithQuickControlsForDeviceUUID:(id)a3 inHomeWithUUID:(id)a4 cornerRadius:(double)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v25 = "+[HUHomePodServiceDetails homePodCardWithQuickControlsForDeviceUUID:inHomeWithUUID:cornerRadius:]";
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2048;
    double v31 = a5;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "(%s) Setting up HMMutableHomeManagerConfiguration to HMHomeManagerOptionsAppleMediaAccessories. homePodUUID %@. homeUUID %@. cornerRadius %f.", buf, 0x2Au);
  }

  v11 = [MEMORY[0x1E4F691A0] configuration];
  v12 = (void *)[v11 mutableCopy];

  [v12 setOptions:105];
  [MEMORY[0x1E4F691A0] setConfiguration:v12];
  v13 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v14 = [v13 allHomesFuture];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __97__HUHomePodServiceDetails_homePodCardWithQuickControlsForDeviceUUID_inHomeWithUUID_cornerRadius___block_invoke;
  v19[3] = &unk_1E638D0D0;
  id v21 = v9;
  id v22 = a1;
  id v20 = v8;
  double v23 = a5;
  id v15 = v9;
  id v16 = v8;
  v17 = [v14 flatMap:v19];

  return v17;
}

uint64_t __97__HUHomePodServiceDetails_homePodCardWithQuickControlsForDeviceUUID_inHomeWithUUID_cornerRadius___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 48) _homePodDetailsViewControllerForHomePodWithUUID:*(void *)(a1 + 32) inHomeWithUUID:*(void *)(a1 + 40) fromHomes:a2 cornerRadius:*(double *)(a1 + 56)];
}

+ (id)homePodCardWithQuickControlsForDeviceUUID:(id)a3 inHomeWithUUID:(id)a4
{
  return (id)[a1 homePodCardWithQuickControlsForDeviceUUID:a3 inHomeWithUUID:a4 cornerRadius:20.0];
}

+ (id)SAHomePodCardWithQuickControlsForDeviceUUID:(id)a3 inHomeWithUUID:(id)a4
{
  return (id)[a1 SAHomePodCardWithQuickControlsForDeviceUUID:a3 inHomeWithUUID:a4 cornerRadius:20.0];
}

+ (id)SAHomePodCardWithQuickControlsForDeviceUUID:(id)a3 inHomeWithUUID:(id)a4 cornerRadius:(double)a5
{
  id v8 = (void *)MEMORY[0x1E4F69430];
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 sharedInstance];
  [v11 setUseSAConfig:1];
  v12 = [a1 homePodCardWithQuickControlsForDeviceUUID:v10 inHomeWithUUID:v9 cornerRadius:a5];

  return v12;
}

+ (id)SAHomePodCardForMediaRoutingIdentifier:(id)a3 deviceName:(id)a4 mediaAccessoryItemType:(int64_t)a5
{
  return (id)[a1 SAHomePodCardForMediaRoutingIdentifier:a3 deviceName:a4 mediaAccessoryItemType:a5 cornerRadius:20.0];
}

+ (id)SAHomePodCardForMediaRoutingIdentifier:(id)a3 deviceName:(id)a4 mediaAccessoryItemType:(int64_t)a5 cornerRadius:(double)a6
{
  id v10 = (void *)MEMORY[0x1E4F69430];
  id v11 = a4;
  id v12 = a3;
  v13 = [v10 sharedInstance];
  [v13 setUseSAConfig:1];
  v14 = [a1 homePodCardForMediaRoutingIdentifier:v12 deviceName:v11 mediaAccessoryItemType:a5 cornerRadius:a6];

  return v14;
}

+ (id)homePodCardForDeviceUUID:(id)a3 inHomeWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Setting up HMMutableHomeManagerConfiguration to HMHomeManagerOptionsAppleMediaAccessories", buf, 2u);
  }

  id v9 = [MEMORY[0x1E4F691A0] configuration];
  id v10 = (void *)[v9 mutableCopy];

  [v10 setOptions:105];
  [MEMORY[0x1E4F691A0] setConfiguration:v10];
  id v11 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v12 = [v11 allHomesFuture];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__HUHomePodServiceDetails_homePodCardForDeviceUUID_inHomeWithUUID___block_invoke;
  v17[3] = &unk_1E638D0F8;
  id v19 = v7;
  id v20 = a1;
  id v18 = v6;
  id v13 = v7;
  id v14 = v6;
  id v15 = [v12 flatMap:v17];

  return v15;
}

uint64_t __67__HUHomePodServiceDetails_homePodCardForDeviceUUID_inHomeWithUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 48) _homePodSettingsViewControllerForHomePodWithUUID:*(void *)(a1 + 32) inHomeWithUUID:*(void *)(a1 + 40) fromHomes:a2];
}

+ (id)homePodCardForMediaRoutingIdentifier:(id)a3 deviceName:(id)a4 mediaAccessoryItemType:(int64_t)a5
{
  return (id)[a1 homePodCardForMediaRoutingIdentifier:a3 deviceName:a4 mediaAccessoryItemType:a5 cornerRadius:20.0];
}

+ (id)_homePodSettingsViewControllerForHomePodWithUUID:(id)a3 inHomeWithUUID:(id)a4 fromHomes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F7A0D8];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __101__HUHomePodServiceDetails__homePodSettingsViewControllerForHomePodWithUUID_inHomeWithUUID_fromHomes___block_invoke;
  v17[3] = &unk_1E638D120;
  id v18 = v10;
  id v19 = v9;
  id v20 = v8;
  id v21 = a1;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  id v15 = [v11 futureWithBlock:v17];

  return v15;
}

void __101__HUHomePodServiceDetails__homePodSettingsViewControllerForHomePodWithUUID_inHomeWithUUID_fromHomes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v28 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v27 + 1) + 8 * v8);
      id v10 = [v9 uniqueIdentifier];
      char v11 = objc_msgSend(v10, "hmf_isEqualToUUID:", *(void *)(a1 + 40));

      if (v11) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v9;

    if (!v12) {
      goto LABEL_20;
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = objc_msgSend(v12, "accessories", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
LABEL_13:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v23 + 1) + 8 * v17);
        id v19 = [v18 uniqueIdentifier];
        char v20 = objc_msgSend(v19, "hmf_isEqualToUUID:", *(void *)(a1 + 48));

        if (v20) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v15) {
            goto LABEL_13;
          }
          goto LABEL_19;
        }
      }
      id v21 = v18;

      if (!v21) {
        goto LABEL_23;
      }
      id v22 = [*(id *)(a1 + 56) _homePodSettingsViewControllerForAccessory:v21 inHome:v12];
      [v3 finishWithResult:v22];
    }
    else
    {
LABEL_19:

LABEL_23:
      [v3 finishWithNoResult];
    }
  }
  else
  {
LABEL_9:

LABEL_20:
    [v3 finishWithNoResult];
  }
}

+ (id)_homePodDetailsViewControllerForHomePodWithUUID:(id)a3 inHomeWithUUID:(id)a4 fromHomes:(id)a5 cornerRadius:(double)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = [MEMORY[0x1E4F69430] sharedInstance];
  uint64_t v15 = [v14 startMonitoringUpdatesForAccessoryID:v11 homeID:v12];
  uint64_t v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413570;
    id v30 = a1;
    __int16 v31 = 2112;
    uint64_t v32 = v17;
    __int16 v33 = 2112;
    id v34 = v11;
    __int16 v35 = 2112;
    id v36 = v12;
    __int16 v37 = 2112;
    id v38 = v13;
    __int16 v39 = 2048;
    double v40 = a6;
    _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@ homePodUUID = %@, homeUUID = %@, homes = %@ cornerRadius = %f", buf, 0x3Eu);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __113__HUHomePodServiceDetails__homePodDetailsViewControllerForHomePodWithUUID_inHomeWithUUID_fromHomes_cornerRadius___block_invoke;
  v23[3] = &unk_1E638D148;
  id v24 = v13;
  id v25 = v12;
  id v26 = v11;
  id v27 = a1;
  double v28 = a6;
  id v18 = v11;
  id v19 = v12;
  id v20 = v13;
  id v21 = [v15 flatMap:v23];

  return v21;
}

id __113__HUHomePodServiceDetails__homePodDetailsViewControllerForHomePodWithUUID_inHomeWithUUID_fromHomes_cornerRadius___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 BOOLValue];
  id v4 = (void *)MEMORY[0x1E4F7A0D8];
  if (v3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __113__HUHomePodServiceDetails__homePodDetailsViewControllerForHomePodWithUUID_inHomeWithUUID_fromHomes_cornerRadius___block_invoke_2;
    v11[3] = &unk_1E638CD00;
    id v12 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    id v5 = *(id *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    id v14 = v5;
    uint64_t v15 = v6;
    uint64_t v16 = *(void *)(a1 + 64);
    uint64_t v7 = [v4 futureWithBlock:v11];
    uint64_t v8 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    id v9 = [v7 reschedule:v8];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v9;
}

void __113__HUHomePodServiceDetails__homePodDetailsViewControllerForHomePodWithUUID_inHomeWithUUID_fromHomes_cornerRadius___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v28 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v27 + 1) + 8 * v8);
      id v10 = [v9 uniqueIdentifier];
      char v11 = objc_msgSend(v10, "hmf_isEqualToUUID:", *(void *)(a1 + 40));

      if (v11) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v9;

    if (!v12) {
      goto LABEL_20;
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = objc_msgSend(v12, "accessories", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
LABEL_13:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v23 + 1) + 8 * v17);
        id v19 = [v18 uniqueIdentifier];
        char v20 = objc_msgSend(v19, "hmf_isEqualToUUID:", *(void *)(a1 + 48));

        if (v20) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v15) {
            goto LABEL_13;
          }
          goto LABEL_19;
        }
      }
      id v21 = v18;

      if (!v21) {
        goto LABEL_23;
      }
      id v22 = [*(id *)(a1 + 56) _homePodDetailsViewControllerForAccessory:v21 inHome:v12 cornerRadius:*(double *)(a1 + 64)];
      [v3 finishWithResult:v22];
    }
    else
    {
LABEL_19:

LABEL_23:
      [v3 finishWithNoResult];
    }
  }
  else
  {
LABEL_9:

LABEL_20:
    [v3 finishWithNoResult];
  }
}

+ (id)_homePodSettingsViewControllerForAccessory:(id)a3 inHome:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = NSStringFromSelector(a2);
    int v17 = 138413058;
    id v18 = a1;
    __int16 v19 = 2112;
    char v20 = v10;
    __int16 v21 = 2112;
    id v22 = v7;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ accessory = %@, home = %@", (uint8_t *)&v17, 0x2Au);
  }
  char v11 = objc_msgSend(v8, "hf_characteristicValueManager");
  id v12 = objc_alloc(MEMORY[0x1E4F69280]);
  id v13 = [v7 mediaProfile];
  uint64_t v14 = (void *)[v12 initWithValueSource:v11 mediaProfileContainer:v13];

  uint64_t v15 = [v14 mediaProfileContainer];

  if (v15) {
    uint64_t v15 = [[HUServiceDetailsViewController alloc] initWithServiceLikeItem:v14];
  }

  return v15;
}

+ (id)_homePodDetailsViewControllerForAccessory:(id)a3 inHome:(id)a4 cornerRadius:(double)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  char v11 = objc_msgSend(v10, "hf_characteristicValueManager");
  id v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413570;
    id v52 = a1;
    __int16 v53 = 2112;
    v54 = v13;
    __int16 v55 = 2112;
    id v56 = v9;
    __int16 v57 = 2112;
    id v58 = v10;
    __int16 v59 = 2048;
    double v60 = a5;
    __int16 v61 = 2112;
    v62 = v11;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ accessory = %@, home = %@, cornerRadius = %f, valueSource = %@", buf, 0x3Eu);
  }
  uint64_t v14 = objc_msgSend(v10, "hf_mediaSystemForAccessory:", v9);
  id v15 = objc_alloc(MEMORY[0x1E4F69280]);
  uint64_t v16 = v15;
  if (v14)
  {
    int v17 = (void *)[v15 initWithValueSource:v11 mediaProfileContainer:v14];
  }
  else
  {
    id v18 = [v9 mediaProfile];
    int v17 = (void *)[v16 initWithValueSource:v11 mediaProfileContainer:v18];
  }
  __int16 v19 = [v17 mediaProfileContainer];

  if (v19)
  {
    v47 = v14;
    aSelector = a2;
    id v50 = a1;
    char v20 = objc_opt_new();
    v48 = v11;
    id v21 = v11;
    id v22 = &unk_1F1AD93F0;
    if ([v21 conformsToProtocol:v22]) {
      __int16 v23 = v21;
    }
    else {
      __int16 v23 = 0;
    }
    id v24 = v23;

    id v25 = v9;
    if (v24)
    {
      id v26 = v21;
    }
    else
    {
      long long v27 = [v17 mediaProfileContainer];
      objc_msgSend(v27, "hf_mediaValueSource");
      id v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v28 = objc_alloc(MEMORY[0x1E4F69298]);
    long long v29 = [v17 mediaProfileContainer];
    long long v30 = objc_msgSend(v28, "initWithValueSource:mediaProfileContainer:mediaAccessoryItemType:displayResults:", v26, v29, objc_msgSend(v17, "mediaAccessoryItemType"), 0);

    __int16 v31 = HFLogForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = NSStringFromSelector(a2);
      uint64_t v33 = [v17 mediaProfileContainer];
      id v34 = objc_msgSend(v33, "hf_mediaValueSource");
      *(_DWORD *)buf = 138413314;
      id v52 = v50;
      __int16 v53 = 2112;
      v54 = v32;
      __int16 v55 = 2112;
      id v56 = v26;
      __int16 v57 = 2112;
      id v58 = v34;
      __int16 v59 = 2112;
      double v60 = *(double *)&v30;
      _os_log_impl(&dword_1BE345000, v31, OS_LOG_TYPE_DEFAULT, "%@:%@ mediaValueSource = %@, hf_mediaValueSource = %@, mediaControlItem = %@", buf, 0x34u);
    }
    id v9 = v25;
    uint64_t v14 = v47;
    if (objc_msgSend(v10, "hf_currentUserIsAdministrator"))
    {
      if ([v17 supportsAlarmQuickControls])
      {
        id v35 = objc_alloc(MEMORY[0x1E4F691B8]);
        id v36 = [v17 mediaProfileContainer];
        __int16 v37 = (void *)[v35 initWithMediaProfileContainer:v36 displayResults:0];

        [v20 addObject:v37];
      }
      if (objc_msgSend(v17, "supportsTimerQuickControls", v47))
      {
        id v38 = objc_alloc(MEMORY[0x1E4F691C8]);
        __int16 v39 = [v17 mediaProfileContainer];
        double v40 = (void *)[v38 initWithMediaProfileContainer:v39 displayResults:0];

        [v20 addObject:v40];
      }
    }
    objc_msgSend(v20, "addObject:", v30, v47);
    uint64_t v41 = [[HUQuickControlPresentationCoordinator alloc] initWithCornerRadius:a5];
    v42 = objc_alloc_init(HUQuickControlPresentationContext);
    [(HUQuickControlPresentationContext *)v42 setControlItems:v20];
    [(HUQuickControlPresentationContext *)v42 setItem:v17];
    [(HUQuickControlPresentationContext *)v42 setHome:v10];
    [(HUQuickControlPresentationContext *)v42 setPrefersSystemTransitions:1];
    __int16 v19 = [(HUQuickControlPresentationCoordinator *)v41 createNavigationControllerForPresentationContext:v42];

    char v11 = v48;
    a2 = aSelector;
    a1 = v50;
  }
  v43 = HFLogForCategory();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = NSStringFromSelector(a2);
    v45 = [v17 mediaProfileContainer];
    *(_DWORD *)buf = 138413058;
    id v52 = a1;
    __int16 v53 = 2112;
    v54 = v44;
    __int16 v55 = 2112;
    id v56 = v19;
    __int16 v57 = 2112;
    id v58 = v45;
    _os_log_impl(&dword_1BE345000, v43, OS_LOG_TYPE_DEFAULT, "%@:%@ Returning Nav Controller = %@, for mediaProfileContainer = %@", buf, 0x2Au);
  }

  return v19;
}

+ (id)_homePodDetailsViewControllerForMediaRoutingIdentifier:(id)a3 deviceName:(id)a4 mediaAccessoryItemType:(int64_t)a5 cornerRadius:(double)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413570;
    id v28 = a1;
    __int16 v29 = 2112;
    long long v30 = v14;
    __int16 v31 = 2112;
    id v32 = v11;
    __int16 v33 = 2112;
    id v34 = v12;
    __int16 v35 = 2048;
    int64_t v36 = a5;
    __int16 v37 = 2048;
    double v38 = a6;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@ mediaRoutingIdentifier = %@, deviceName = %@, mediaAccessoryItemType = %ld cornerRadius = %lf", buf, 0x3Eu);
  }
  id v15 = [MEMORY[0x1E4F69430] sharedInstance];
  uint64_t v16 = [v15 startMonitoringUpdatesForMediaRemoteIdentifier:v11];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __129__HUHomePodServiceDetails__homePodDetailsViewControllerForMediaRoutingIdentifier_deviceName_mediaAccessoryItemType_cornerRadius___block_invoke;
  v21[3] = &unk_1E638D198;
  id v22 = v11;
  id v23 = v12;
  id v24 = a1;
  int64_t v25 = a5;
  double v26 = a6;
  id v17 = v12;
  id v18 = v11;
  __int16 v19 = [v16 flatMap:v21];

  return v19;
}

id __129__HUHomePodServiceDetails__homePodDetailsViewControllerForMediaRoutingIdentifier_deviceName_mediaAccessoryItemType_cornerRadius___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __129__HUHomePodServiceDetails__homePodDetailsViewControllerForMediaRoutingIdentifier_deviceName_mediaAccessoryItemType_cornerRadius___block_invoke_2;
  uint64_t v16 = &unk_1E638D170;
  uint64_t v5 = *(void *)(a1 + 48);
  id v17 = v3;
  uint64_t v20 = v5;
  id v18 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  id v19 = v6;
  uint64_t v21 = v7;
  uint64_t v22 = *(void *)(a1 + 64);
  id v8 = v3;
  id v9 = [v4 futureWithBlock:&v13];
  id v10 = objc_msgSend(MEMORY[0x1E4F7A0F0], "mainThreadScheduler", v13, v14, v15, v16);
  id v11 = [v9 reschedule:v10];

  return v11;
}

void __129__HUHomePodServiceDetails__homePodDetailsViewControllerForMediaRoutingIdentifier_deviceName_mediaAccessoryItemType_cornerRadius___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  id v3 = *(id *)(a1 + 32);
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if ([v5 BOOLValue])
  {
    id v6 = [*(id *)(a1 + 56) _homePodDetailsViewControllerForAccessoryWithMediaRoutingIdentifier:*(void *)(a1 + 40) deviceName:*(void *)(a1 + 48) mediaAccessoryItemType:*(void *)(a1 + 64) cornerRadius:*(double *)(a1 + 72)];
    [v7 finishWithResult:v6];
  }
  else
  {
    [v7 finishWithNoResult];
  }
}

+ (id)_homePodDetailsViewControllerForAccessoryWithMediaRoutingIdentifier:(id)a3 deviceName:(id)a4 mediaAccessoryItemType:(int64_t)a5 cornerRadius:(double)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = (HUQuickControlPresentationContext *)a4;
  uint64_t v13 = objc_opt_new();
  uint64_t v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = NSStringFromSelector(a2);
    int v24 = 138413570;
    id v25 = a1;
    __int16 v26 = 2112;
    long long v27 = v15;
    __int16 v28 = 2112;
    id v29 = v11;
    __int16 v30 = 2112;
    __int16 v31 = v12;
    __int16 v32 = 2048;
    int64_t v33 = a5;
    __int16 v34 = 2048;
    double v35 = a6;
    _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ mediaRoutingIdentifier = %@, deviceName = %@, mediaAccessoryItemType = %ld, cornerRadius = %lf", (uint8_t *)&v24, 0x3Eu);
  }
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F69298]) initWithMediaRoutingIdentifier:v11 deviceName:v12 mediaAccessoryItemType:a5];
  [v13 addObject:v16];
  id v17 = [[HUQuickControlPresentationCoordinator alloc] initWithCornerRadius:a6];
  id v18 = objc_alloc_init(HUQuickControlPresentationContext);
  [(HUQuickControlPresentationContext *)v18 setControlItems:v13];
  [(HUQuickControlPresentationContext *)v18 setPrefersSystemTransitions:1];
  [(HUQuickControlPresentationContext *)v18 setIsConfiguredForNonHomeUser:1];
  id v19 = [(HUQuickControlPresentationCoordinator *)v17 createNavigationControllerForPresentationContext:v18];
  if (!v19)
  {
    uint64_t v20 = [MEMORY[0x1E4F69430] sharedInstance];
    [v20 invalidateProxClient];
  }
  uint64_t v21 = HFLogForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = NSStringFromSelector(a2);
    int v24 = 138413058;
    id v25 = a1;
    __int16 v26 = 2112;
    long long v27 = v22;
    __int16 v28 = 2112;
    id v29 = v19;
    __int16 v30 = 2112;
    __int16 v31 = v18;
    _os_log_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@ Returning Nav Controller = %@, for  presentationContext = %@, ", (uint8_t *)&v24, 0x2Au);
  }

  return v19;
}

@end