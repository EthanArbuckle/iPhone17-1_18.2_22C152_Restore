@interface HUCameraPresenceRecordingSettingsModule
+ (id)messageForHomeOwnerQuotaAlertForCameraCount:(id)a3;
+ (id)messageForQuotaAlertForCameraCount:(id)a3;
+ (id)stringFromNumber:(id)a3;
+ (id)titleForHomeOwnerQuotaAlertForCameraCount:(id)a3;
+ (id)titleForQuotaAlertForCameraCount:(id)a3;
+ (id)upgradeURLForCameraCount:(id)a3;
- (BOOL)didCompleteCloudUpgradeOffer;
- (BOOL)isItemHeader:(id)a3;
- (BOOL)pendingUpgradeRequest;
- (FeatureChangeObserver)featureChangeObserver;
- (HFStaticItemProvider)itemProvider;
- (HMHome)home;
- (HUCameraPresenceRecordingSettingsModule)initWithItemUpdater:(id)a3;
- (HUCameraPresenceRecordingSettingsModule)initWithItemUpdater:(id)a3 cameraProfiles:(id)a4 presenceEventType:(unint64_t)a5;
- (HUCameraUsageOptionItemProvider)recordingSettingItemProvider;
- (NSArray)optionItems;
- (NSNumber)currentPlanCameraCount;
- (NSSet)cameraProfiles;
- (NSString)longestCameraUsageOptionItemTitle;
- (UIViewController)presentingViewController;
- (UIViewController)viewController;
- (id)_titleString;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)didSelectItem:(id)a3;
- (id)itemProviders;
- (id)showOptionsItem;
- (id)updateStreamingSetting:(unint64_t)a3 isRetry:(BOOL)a4;
- (unint64_t)accessModeSetting;
- (unint64_t)countCameraProfilesWithRecordingService;
- (unint64_t)numCamerasSupportRecordingService;
- (unint64_t)offerState;
- (unint64_t)presenceEventType;
- (unint64_t)upgradeState;
- (void)_buildItemProvider;
- (void)_clearItemsUpdating;
- (void)_dispatchUpdateForCameraProfile:(id)a3;
- (void)_presentCloudUpgradeFlowWithCameraCount:(unint64_t)a3;
- (void)clearLoadingIndicator;
- (void)dealloc;
- (void)presentCloudUpgradeFlowWithCameraCount:(unint64_t)a3;
- (void)presentGenericError;
- (void)presentHomeOwnerQuotaAlertForOverflowCount:(int64_t)a3;
- (void)presentInsufficientPrivilegesAlert;
- (void)presentMissingSupportedHubAlert;
- (void)presentSharedAdminQuotaAlertForCount:(unint64_t)a3;
- (void)sendCAMetricInfo;
- (void)setCurrentPlanCameraCount:(id)a3;
- (void)setDidCompleteCloudUpgradeOffer:(BOOL)a3;
- (void)setFeatureChangeObserver:(id)a3;
- (void)setHome:(id)a3;
- (void)setItemProvider:(id)a3;
- (void)setNumCamerasSupportRecordingService:(unint64_t)a3;
- (void)setOfferState:(unint64_t)a3;
- (void)setOptionItems:(id)a3;
- (void)setPendingUpgradeRequest:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setRecordingSettingItemProvider:(id)a3;
- (void)setUpgradeState:(unint64_t)a3;
- (void)setViewController:(id)a3;
- (void)updatePlanCameraCount;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
@end

@implementation HUCameraPresenceRecordingSettingsModule

- (HUCameraPresenceRecordingSettingsModule)initWithItemUpdater:(id)a3 cameraProfiles:(id)a4 presenceEventType:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (![v10 count])
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HUCameraPresenceRecordingSettingsModule.m", 90, @"Invalid parameter not satisfying: %@", @"cameraProfiles.count > 0" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)HUCameraPresenceRecordingSettingsModule;
  v11 = [(HFItemModule *)&v25 initWithItemUpdater:v9];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    cameraProfiles = v11->_cameraProfiles;
    v11->_cameraProfiles = (NSSet *)v12;

    v11->_presenceEventType = a5;
    v14 = [v10 anyObject];
    v15 = [v14 accessory];
    uint64_t v16 = [v15 home];
    home = v11->_home;
    v11->_home = (HMHome *)v16;

    if (_os_feature_enabled_impl())
    {
      objc_initWeak(&location, v11);
      v18 = (void *)MEMORY[0x1E4F59BB8];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __96__HUCameraPresenceRecordingSettingsModule_initWithItemUpdater_cameraProfiles_presenceEventType___block_invoke;
      v22[3] = &unk_1E63862A0;
      objc_copyWeak(&v23, &location);
      v19 = [v18 registerForFeatureChangeNotificationsUsingBlock:v22];
      [(HUCameraPresenceRecordingSettingsModule *)v11 setFeatureChangeObserver:v19];

      [(HUCameraPresenceRecordingSettingsModule *)v11 updatePlanCameraCount];
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
    [(HUCameraPresenceRecordingSettingsModule *)v11 _buildItemProvider];
  }

  return v11;
}

void __96__HUCameraPresenceRecordingSettingsModule_initWithItemUpdater_cameraProfiles_presenceEventType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updatePlanCameraCount];
}

- (HUCameraPresenceRecordingSettingsModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_cameraProfiles_presenceEventType_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCameraPresenceRecordingSettingsModule.m", 117, @"%s is unavailable; use %@ instead",
    "-[HUCameraPresenceRecordingSettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (BOOL)isItemHeader:(id)a3
{
  return 0;
}

- (unint64_t)accessModeSetting
{
  v3 = (void *)MEMORY[0x1E4F2E728];
  v4 = [(HUCameraPresenceRecordingSettingsModule *)self cameraProfiles];
  unint64_t v5 = objc_msgSend(v3, "hf_cameraAccessModeSelectedOptionForCameraProfiles:presenceType:", v4, -[HUCameraPresenceRecordingSettingsModule presenceEventType](self, "presenceEventType"));

  return v5;
}

- (id)updateStreamingSetting:(unint64_t)a3 isRetry:(BOOL)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  int v7 = _os_feature_enabled_impl();
  if (a3 == 2
    && v7
    && (BOOL v8 = a4,
        [(HUCameraPresenceRecordingSettingsModule *)self home],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = objc_msgSend(v9, "hf_currentUserIsAdministrator"),
        v9,
        a4 = v8,
        (v10 & 1) == 0))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke;
    block[3] = &unk_1E6386018;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    v20 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    id v23 = objc_opt_new();
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v36[3] = 0;
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    char v35 = 0;
    [(HUCameraPresenceRecordingSettingsModule *)self setNumCamerasSupportRecordingService:[(HUCameraPresenceRecordingSettingsModule *)self countCameraProfilesWithRecordingService]];
    if (!a4)
    {
      [(HUCameraPresenceRecordingSettingsModule *)self setUpgradeState:0];
      [(HUCameraPresenceRecordingSettingsModule *)self setOfferState:0];
    }
    BOOL v22 = a4;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v11 = self;
    uint64_t v12 = [(HUCameraPresenceRecordingSettingsModule *)self cameraProfiles];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          objc_initWeak(&location, v11);
          v17 = (void *)MEMORY[0x1E4F7A0D8];
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_2;
          v27[3] = &unk_1E638CD50;
          objc_copyWeak(v28, &location);
          v27[4] = v16;
          v27[5] = v36;
          v28[1] = (id)a3;
          v27[6] = v34;
          v18 = [v17 futureWithBlock:v27];
          [v23 addObject:v18];

          objc_destroyWeak(v28);
          objc_destroyWeak(&location);
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v13);
    }

    objc_initWeak(&location, v11);
    v19 = [MEMORY[0x1E4F7A0D8] combineAllFutures:v23];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_2_62;
    v24[3] = &unk_1E638CD78;
    objc_copyWeak(&v25, &location);
    v24[4] = v36;
    BOOL v26 = v22;
    v20 = [v19 addCompletionBlock:v24];
    objc_destroyWeak(&v25);

    objc_destroyWeak(&location);
    _Block_object_dispose(v34, 8);
    _Block_object_dispose(v36, 8);
  }

  return v20;
}

uint64_t __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentInsufficientPrivilegesAlert];
}

void __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  unint64_t v5 = [*(id *)(a1 + 32) userSettings];
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = [WeakRetained presenceEventType];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_3;
  v10[3] = &unk_1E638CD28;
  objc_copyWeak(v14, (id *)(a1 + 56));
  v14[1] = *(id *)(a1 + 64);
  long long v13 = *(_OWORD *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 32);
  id v11 = v8;
  uint64_t v12 = v9;
  [v5 updateAccessMode:v6 forPresenceEventType:v7 completionHandler:v10];

  objc_destroyWeak(v14);
}

void __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (*(void *)(a1 + 72) == 2 && [v3 code] == 2006)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    [WeakRetained setUpgradeState:2];
    goto LABEL_15;
  }
  if ([v3 code] == 17)
  {
    unint64_t v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v3;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Error setting camera streaming setting: %@", buf, 0xCu);
    }

    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      uint64_t v16 = __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_58;
      v17 = &unk_1E6386018;
      id v18 = WeakRetained;
      uint64_t v6 = MEMORY[0x1E4F14428];
      uint64_t v7 = &v14;
LABEL_14:
      dispatch_async(v6, v7);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  else if (v3)
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v3;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "Error setting camera streaming setting: %@", buf, 0xCu);
    }

    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      id v11 = __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_59;
      uint64_t v12 = &unk_1E6386018;
      id v13 = WeakRetained;
      uint64_t v6 = MEMORY[0x1E4F14428];
      uint64_t v7 = &v9;
      goto LABEL_14;
    }
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult", v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
  [WeakRetained _dispatchUpdateForCameraProfile:*(void *)(a1 + 40)];
}

uint64_t __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_58(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentInsufficientPrivilegesAlert];
}

uint64_t __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_59(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentGenericError];
}

void __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_2_62(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (([WeakRetained didCompleteCloudUpgradeOffer] & 1) != 0
    || !*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    if ([WeakRetained didCompleteCloudUpgradeOffer]) {
      [WeakRetained setDidCompleteCloudUpgradeOffer:0];
    }
  }
  else
  {
    int v2 = _os_feature_enabled_impl();
    id v3 = [WeakRetained home];
    int v4 = objc_msgSend(v3, "hf_currentUserIsOwner");

    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (v2)
    {
      if (v4)
      {
        [WeakRetained presentHomeOwnerQuotaAlertForOverflowCount:v5];
        goto LABEL_11;
      }
    }
    else if (v4)
    {
      [WeakRetained presentCloudUpgradeFlowWithCameraCount:v5];
      goto LABEL_11;
    }
    [WeakRetained presentSharedAdminQuotaAlertForCount:v5];
  }
LABEL_11:
  if (*(unsigned char *)(a1 + 48))
  {
LABEL_12:
    [WeakRetained sendCAMetricInfo];
    uint64_t v6 = WeakRetained;
    goto LABEL_14;
  }
  uint64_t v6 = WeakRetained;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    [WeakRetained setUpgradeState:1];
    goto LABEL_12;
  }
LABEL_14:
  [v6 clearLoadingIndicator];
}

- (void)clearLoadingIndicator
{
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__HUCameraPresenceRecordingSettingsModule_clearLoadingIndicator__block_invoke;
  block[3] = &unk_1E6386BC0;
  objc_copyWeak(v5, &location);
  v5[1] = (id)a2;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __64__HUCameraPresenceRecordingSettingsModule_clearLoadingIndicator__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _clearItemsUpdating];
  int v2 = [WeakRetained itemProvider];
  dispatch_time_t v3 = [v2 items];

  id v4 = objc_alloc(MEMORY[0x1E4F69230]);
  uint64_t v5 = [WeakRetained itemProviders];
  uint64_t v6 = (void *)[v4 initWithItemProviders:v5 items:v3 senderSelector:*(void *)(a1 + 40)];

  uint64_t v7 = [WeakRetained itemUpdater];
  id v8 = (id)[v7 performItemUpdateRequest:v6];
}

- (void)updatePlanCameraCount
{
  dispatch_time_t v3 = [(HUCameraPresenceRecordingSettingsModule *)self home];
  id v4 = [(HUCameraPresenceRecordingSettingsModule *)self home];
  uint64_t v5 = [v4 currentUser];
  char v6 = objc_msgSend(v3, "hf_userIsOwner:", v5);

  uint64_t v7 = HFLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "User is owner, checking CloudSubscriptionFeatures for camera numbers.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    uint64_t v9 = (void *)MEMORY[0x1E4F59BB8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__HUCameraPresenceRecordingSettingsModule_updatePlanCameraCount__block_invoke;
    v10[3] = &unk_1E638CDA0;
    objc_copyWeak(&v11, buf);
    [v9 requestFeatureWithId:@"home.cameras" completion:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
  else
  {
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "User is not owner, skipping CloudSubscriptionFeatures check.", (uint8_t *)buf, 2u);
    }
  }
}

void __64__HUCameraPresenceRecordingSettingsModule_updatePlanCameraCount__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138412290;
      id v20 = v6;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "Camera count request error:%@", (uint8_t *)&v19, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = [v5 value];

  if (v9)
  {
    uint64_t v10 = [WeakRetained currentPlanCameraCount];
    uint64_t v11 = [v10 integerValue];
    uint64_t v12 = [v5 value];
    if (v11 >= [v12 integerValue]) {
      int v13 = 0;
    }
    else {
      int v13 = [WeakRetained pendingUpgradeRequest];
    }

    uint64_t v15 = [v5 value];
LABEL_14:
    [WeakRetained setCurrentPlanCameraCount:v15];

    goto LABEL_15;
  }
  if ([v5 status] == 2)
  {
    uint64_t v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "FeatureStatusUnavailable setting Current plan camera count to 0", (uint8_t *)&v19, 2u);
    }

    uint64_t v15 = [NSNumber numberWithInt:0];
    int v13 = 0;
    goto LABEL_14;
  }
  int v13 = 0;
LABEL_15:
  uint64_t v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [WeakRetained currentPlanCameraCount];
    int v19 = 138412546;
    id v20 = v17;
    __int16 v21 = 1024;
    int v22 = v13;
    _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "Current plan camera count = %@ needsRetry:%{BOOL}d", (uint8_t *)&v19, 0x12u);
  }
  if (v13)
  {
    [WeakRetained setPendingUpgradeRequest:0];
    id v18 = (id)[WeakRetained updateStreamingSetting:2 isRetry:1];
  }
}

- (void)_presentCloudUpgradeFlowWithCameraCount:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_class();
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v7 = [v5 upgradeURLForCameraCount:v6];

  [(HUCameraPresenceRecordingSettingsModule *)self setPendingUpgradeRequest:1];
  if (_os_feature_enabled_impl())
  {
    if ([MEMORY[0x1E4F22448] isCurrentProcessAnApplicationExtension])
    {
      NSLog(&cfstr_WeAreCurrently.isa);
    }
    else
    {
      BOOL v8 = HFLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        uint64_t v11 = v7;
        _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Launching cloud upgrade flow for url:%@", (uint8_t *)&v10, 0xCu);
      }

      uint64_t v9 = [MEMORY[0x1E4F42738] performSelector:sel_sharedApplication];
      [v9 openURL:v7 withCompletionHandler:0];
    }
  }
}

- (void)presentCloudUpgradeFlowWithCameraCount:(unint64_t)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2050000000;
  id v5 = (void *)_MergedGlobals_3_6;
  uint64_t v21 = _MergedGlobals_3_6;
  if (!_MergedGlobals_3_6)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __getICQOfferManagerClass_block_invoke;
    uint64_t v16 = &unk_1E63852F0;
    v17 = &v18;
    __getICQOfferManagerClass_block_invoke((uint64_t)buf);
    id v5 = (void *)v19[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v18, 8);
  id v7 = objc_alloc_init(v6);
  v22[0] = @"cameraCount";
  BOOL v8 = [NSNumber numberWithUnsignedInteger:a3];
  v22[1] = @"appContext";
  v23[0] = v8;
  uint64_t v9 = *MEMORY[0x1E4F68508];
  v23[1] = *MEMORY[0x1E4F68508];
  int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  uint64_t v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_INFO, "ICQOfferManager getting current offer from freshmint service", buf, 2u);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__HUCameraPresenceRecordingSettingsModule_presentCloudUpgradeFlowWithCameraCount___block_invoke;
  v12[3] = &unk_1E638CDC8;
  v12[4] = self;
  [v7 getOfferForBundleIdentifier:v9 offerContext:v10 completion:v12];
}

void __82__HUCameraPresenceRecordingSettingsModule_presentCloudUpgradeFlowWithCameraCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    [*(id *)(a1 + 32) setOfferState:2];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __82__HUCameraPresenceRecordingSettingsModule_presentCloudUpgradeFlowWithCameraCount___block_invoke_2;
    v11[3] = &unk_1E63850E0;
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 32);
    id v12 = v8;
    uint64_t v13 = v9;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
  else if (v6)
  {
    int v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v7;
      _os_log_error_impl(&dword_1BE345000, v10, OS_LOG_TYPE_ERROR, "ICQOfferManager: there was an error getting the current offer: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) setOfferState:1];
    [*(id *)(a1 + 32) sendCAMetricInfo];
  }
}

void __82__HUCameraPresenceRecordingSettingsModule_presentCloudUpgradeFlowWithCameraCount___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2050000000;
  int v2 = (void *)qword_1EA12E090;
  uint64_t v20 = qword_1EA12E090;
  if (!qword_1EA12E090)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __getICQUpgradeFlowOptionsClass_block_invoke;
    uint64_t v15 = &unk_1E63852F0;
    uint64_t v16 = &v17;
    __getICQUpgradeFlowOptionsClass_block_invoke((uint64_t)&v12);
    int v2 = (void *)v18[3];
  }
  dispatch_time_t v3 = v2;
  _Block_object_dispose(&v17, 8);
  id v4 = objc_alloc_init(v3);
  id v5 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  [v4 setButtonTintColor:v5];

  id v6 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  [v4 setNavigationBarTintColor:v6];

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2050000000;
  id v7 = (void *)qword_1EA12E098;
  uint64_t v20 = qword_1EA12E098;
  if (!qword_1EA12E098)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __getICQUpgradeFlowManagerClass_block_invoke;
    uint64_t v15 = &unk_1E63852F0;
    uint64_t v16 = &v17;
    __getICQUpgradeFlowManagerClass_block_invoke((uint64_t)&v12);
    id v7 = (void *)v18[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v17, 8);
  uint64_t v9 = (void *)[[v8 alloc] initWithOffer:*(void *)(a1 + 32)];
  [v9 setDelegate:*(void *)(a1 + 40)];
  [v9 setFlowOptions:v4];
  int v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_INFO, "ICQUpgradeFlowManager presenting current offer UI", (uint8_t *)&v12, 2u);
  }

  uint64_t v11 = [*(id *)(a1 + 40) presentingViewController];
  [v9 beginFlowWithPresentingViewController:v11];
}

- (void)presentInsufficientPrivilegesAlert
{
  dispatch_time_t v3 = (void *)MEMORY[0x1E4F42728];
  id v4 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingSettingsInsufficientPermissionsAlert_Title", @"HUCameraRecordingSettingsInsufficientPermissionsAlert_Title", 1);
  id v5 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingSettingsInsufficientPermissionsAlert_Message", @"HUCameraRecordingSettingsInsufficientPermissionsAlert_Message", 1);
  id v10 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  id v6 = (void *)MEMORY[0x1E4F42720];
  id v7 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  id v8 = [v6 actionWithTitle:v7 style:0 handler:0];
  [v10 addAction:v8];

  uint64_t v9 = [(HUCameraPresenceRecordingSettingsModule *)self presentingViewController];
  [v9 presentViewController:v10 animated:1 completion:0];
}

+ (id)upgradeURLForCameraCount:(id)a3
{
  dispatch_time_t v3 = [NSString stringWithFormat:@"%@%d", @"https://icq.icloud.com/?context=aUNsb3VkU3Vic2NyaXB0aW9uX2NvbS5hcHBsZS5ob21lS2l0X2NhbWVyYVNldHRpbmdz&cameraCount=", objc_msgSend(a3, "intValue")];
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];

  return v4;
}

+ (id)titleForQuotaAlertForCameraCount:(id)a3
{
  uint64_t v3 = [a3 integerValue];
  id v4 = @"HUCameraRecordingSettingsInsufficientQuotaMultipleAlert_Title";
  if (v3 == 1) {
    id v4 = @"HUCameraRecordingSettingsInsufficientQuotaOneAlert_Title";
  }
  if (v3) {
    id v5 = v4;
  }
  else {
    id v5 = @"HUCameraRecordingSettingsInsufficientQuotaNoneAlert_Title";
  }
  id v6 = _HULocalizedStringWithDefaultValue(v5, v5, 1);

  return v6;
}

+ (id)messageForQuotaAlertForCameraCount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 integerValue];
  if (v5 == 1)
  {
    id v6 = @"HUCameraRecordingSettingsInsufficientQuotaOneAlert_Message";
    goto LABEL_5;
  }
  if (!v5)
  {
    id v6 = @"HUCameraRecordingSettingsInsufficientQuotaNoneAlert_Message";
LABEL_5:
    id v7 = _HULocalizedStringWithDefaultValue(v6, v6, 1);
    goto LABEL_7;
  }
  id v8 = [a1 stringFromNumber:v4];
  id v7 = HULocalizedStringWithFormat(@"HUCameraRecordingSettingsInsufficientQuotaMultipleAlert_Message", @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v8);

LABEL_7:

  return v7;
}

+ (id)titleForHomeOwnerQuotaAlertForCameraCount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 stringFromNumber:v4];
  id v6 = [v5 capitalizedString];

  uint64_t v7 = [v4 integerValue];
  uint64_t v14 = HULocalizedStringWithFormat(@"HUCameraRecordingSettingsInsufficientQuotaHomeOwnerAlert_Title", @"%lu", v8, v9, v10, v11, v12, v13, v7);
  uint64_t v15 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  uint64_t v16 = [v14 rangeOfCharacterFromSet:v15];
  uint64_t v18 = v17;

  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v19 = objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", v16, v18, v6);

    uint64_t v14 = (void *)v19;
  }

  return v14;
}

+ (id)stringFromNumber:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F28EE0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setNumberStyle:5];
  id v6 = [v5 stringFromNumber:v4];

  return v6;
}

+ (id)messageForHomeOwnerQuotaAlertForCameraCount:(id)a3
{
  uint64_t v3 = [a3 integerValue];
  return HULocalizedStringWithFormat(@"HUCameraRecordingSettingsInsufficientQuotaHomeOwnerAlert_Message", @"%lu", v4, v5, v6, v7, v8, v9, v3);
}

- (void)presentHomeOwnerQuotaAlertForOverflowCount:(int64_t)a3
{
  [(HUCameraPresenceRecordingSettingsModule *)self clearLoadingIndicator];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(HUCameraPresenceRecordingSettingsModule *)self currentPlanCameraCount];
  uint64_t v7 = [v5 titleForHomeOwnerQuotaAlertForCameraCount:v6];

  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [(HUCameraPresenceRecordingSettingsModule *)self currentPlanCameraCount];
  uint64_t v10 = [v8 messageForHomeOwnerQuotaAlertForCameraCount:v9];

  uint64_t v11 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v7 message:v10 preferredStyle:1];
  objc_initWeak(&location, self);
  uint64_t v12 = (void *)MEMORY[0x1E4F42720];
  uint64_t v13 = _HULocalizedStringWithDefaultValue(@"HUUpgradeNowTitle", @"HUUpgradeNowTitle", 1);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __86__HUCameraPresenceRecordingSettingsModule_presentHomeOwnerQuotaAlertForOverflowCount___block_invoke;
  v19[3] = &unk_1E638CDF0;
  objc_copyWeak(v20, &location);
  v20[1] = (id)a3;
  uint64_t v14 = [v12 actionWithTitle:v13 style:0 handler:v19];

  [v11 addAction:v14];
  uint64_t v15 = (void *)MEMORY[0x1E4F42720];
  uint64_t v16 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
  uint64_t v17 = [v15 actionWithTitle:v16 style:1 handler:0];
  [v11 addAction:v17];

  uint64_t v18 = [(HUCameraPresenceRecordingSettingsModule *)self presentingViewController];
  [v18 presentViewController:v11 animated:1 completion:0];

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

void __86__HUCameraPresenceRecordingSettingsModule_presentHomeOwnerQuotaAlertForOverflowCount___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _presentCloudUpgradeFlowWithCameraCount:*(void *)(a1 + 40)];
}

- (void)presentSharedAdminQuotaAlertForCount:(unint64_t)a3
{
  [(HUCameraPresenceRecordingSettingsModule *)self clearLoadingIndicator];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  id v15 = [v5 titleForQuotaAlertForCameraCount:v6];

  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v9 = [v7 messageForQuotaAlertForCameraCount:v8];

  uint64_t v10 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v15 message:v9 preferredStyle:1];
  uint64_t v11 = (void *)MEMORY[0x1E4F42720];
  uint64_t v12 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  uint64_t v13 = [v11 actionWithTitle:v12 style:0 handler:0];
  [v10 addAction:v13];

  uint64_t v14 = [(HUCameraPresenceRecordingSettingsModule *)self presentingViewController];
  [v14 presentViewController:v10 animated:1 completion:0];
}

- (void)presentGenericError
{
  uint64_t v3 = (void *)MEMORY[0x1E4F42728];
  uint64_t v4 = _HULocalizedStringWithDefaultValue(@"HUCameraStreamingSettingsGenericErrorTitle", @"HUCameraStreamingSettingsGenericErrorTitle", 1);
  uint64_t v5 = _HULocalizedStringWithDefaultValue(@"HUCameraStreamingSettingsGenericErrorDescription", @"HUCameraStreamingSettingsGenericErrorDescription", 1);
  id v10 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  uint64_t v6 = (void *)MEMORY[0x1E4F42720];
  uint64_t v7 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  uint64_t v8 = [v6 actionWithTitle:v7 style:0 handler:0];
  [v10 addAction:v8];

  uint64_t v9 = [(HUCameraPresenceRecordingSettingsModule *)self presentingViewController];
  [v9 presentViewController:v10 animated:1 completion:0];
}

- (void)presentMissingSupportedHubAlert
{
  uint64_t v3 = [(HUCameraPresenceRecordingSettingsModule *)self home];
  uint64_t v4 = [v3 residentDevices];
  uint64_t v5 = [v4 count];

  if (v5) {
    uint64_t v6 = @"HUCameraRecordingSettingsUnsupportedHomeHub_Title";
  }
  else {
    uint64_t v6 = @"HUHomeHubRequiredTitle";
  }
  if (v5) {
    uint64_t v7 = @"HUCameraRecordingSettingsUnsupportedHomeHub_Message";
  }
  else {
    uint64_t v7 = @"HUCameraRecordingSettingsNoHomeHub_Message";
  }
  _HULocalizedStringWithDefaultValue(v6, v6, 1);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = _HULocalizedStringWithDefaultValue(v7, v7, 1);
  uint64_t v9 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v14 message:v8 preferredStyle:1];
  id v10 = (void *)MEMORY[0x1E4F42720];
  uint64_t v11 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  uint64_t v12 = [v10 actionWithTitle:v11 style:0 handler:0];
  [v9 addAction:v12];

  uint64_t v13 = [(HUCameraPresenceRecordingSettingsModule *)self presentingViewController];
  [v13 presentViewController:v9 animated:1 completion:0];
}

- (void)_clearItemsUpdating
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = [(HUCameraPresenceRecordingSettingsModule *)self itemProvider];
  uint64_t v3 = [v2 items];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        id v10 = v9;
        if (objc_opt_isKindOfClass()) {
          uint64_t v11 = v10;
        }
        else {
          uint64_t v11 = 0;
        }
        id v12 = v11;

        objc_msgSend(v12, "setUpdateInProgress:", 0, (void)v13);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)_dispatchUpdateForCameraProfile:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__HUCameraPresenceRecordingSettingsModule__dispatchUpdateForCameraProfile___block_invoke;
  v6[3] = &unk_1E638CE18;
  id v7 = v3;
  id v5 = v3;
  [v4 dispatchCameraObserverMessage:v6 sender:0];
}

void __75__HUCameraPresenceRecordingSettingsModule__dispatchUpdateForCameraProfile___block_invoke(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 userSettings];
  [v3 cameraUserSettingsDidUpdate:v4];
}

- (id)_titleString
{
  if ([(HUCameraPresenceRecordingSettingsModule *)self presenceEventType] == 4) {
    int v2 = @"HUCameraStreamingSettingsModuleNoOneHomeSettings";
  }
  else {
    int v2 = @"HUCameraStreamingSettingsModuleAnybodyHomeSettings";
  }
  id v3 = _HULocalizedStringWithDefaultValue(v2, v2, 1);

  return v3;
}

- (id)didSelectItem:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(HUCameraPresenceRecordingSettingsModule *)self home];
  char v7 = objc_msgSend(v6, "hf_hasCameraRecordingResident");

  if (v7)
  {
    uint64_t v8 = [v5 latestResults];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"HUCameraSettingResultKey"];
    uint64_t v10 = [v9 unsignedIntegerValue];

    [(HUCameraPresenceRecordingSettingsModule *)self _clearItemsUpdating];
    uint64_t v11 = [(HUCameraPresenceRecordingSettingsModule *)self recordingSettingItemProvider];
    id v12 = [v11 items];
    int v13 = [v12 containsObject:v5];

    if (v13)
    {
      objc_opt_class();
      id v14 = v5;
      if (objc_opt_isKindOfClass()) {
        long long v15 = v14;
      }
      else {
        long long v15 = 0;
      }
      id v16 = v15;

      [v16 setUpdateInProgress:1];
      id v17 = objc_alloc(MEMORY[0x1E4F69230]);
      uint64_t v18 = [(HUCameraPresenceRecordingSettingsModule *)self itemProviders];
      uint64_t v19 = [MEMORY[0x1E4F1CAD0] setWithObject:v14];
      uint64_t v20 = (void *)[v17 initWithItemProviders:v18 items:v19 senderSelector:a2];

      uint64_t v21 = [(HFItemModule *)self itemUpdater];
      id v22 = (id)[v21 performItemUpdateRequest:v20];

      uint64_t v23 = [(HUCameraPresenceRecordingSettingsModule *)self updateStreamingSetting:v10 isRetry:0];

      goto LABEL_11;
    }
  }
  else
  {
    v24 = HFLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = [(HUCameraPresenceRecordingSettingsModule *)self home];
      BOOL v26 = [(HUCameraPresenceRecordingSettingsModule *)self home];
      v27 = [v26 residentDevices];
      int v29 = 138412546;
      long long v30 = v25;
      __int16 v31 = 2112;
      long long v32 = v27;
      _os_log_impl(&dword_1BE345000, v24, OS_LOG_TYPE_INFO, "Expected a camera recording resident, but none found. Home: %@ Residents: %@", (uint8_t *)&v29, 0x16u);
    }
    [(HUCameraPresenceRecordingSettingsModule *)self presentMissingSupportedHubAlert];
  }
  uint64_t v23 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
LABEL_11:

  return v23;
}

- (id)itemProviders
{
  int v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(HUCameraPresenceRecordingSettingsModule *)self itemProvider];
  id v4 = [v2 setWithObject:v3];

  return v4;
}

- (void)_buildItemProvider
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __61__HUCameraPresenceRecordingSettingsModule__buildItemProvider__block_invoke;
  v24 = &unk_1E6384FD0;
  objc_copyWeak(&v25, &location);
  id v4 = (HFItem *)[v3 initWithResultsBlock:&v21];
  showOptionsItem = self->_showOptionsItem;
  self->_showOptionsItem = v4;

  uint64_t v6 = [HUCameraUsageOptionItemProvider alloc];
  unint64_t v7 = [(HUCameraPresenceRecordingSettingsModule *)self presenceEventType];
  uint64_t v8 = [(HUCameraPresenceRecordingSettingsModule *)self cameraProfiles];
  uint64_t v9 = [(HUCameraUsageOptionItemProvider *)v6 initWithPresenceEventType:v7 cameraProfiles:v8];
  [(HUCameraPresenceRecordingSettingsModule *)self setRecordingSettingItemProvider:v9];

  uint64_t v10 = [(HUCameraPresenceRecordingSettingsModule *)self recordingSettingItemProvider];
  id v11 = (id)[v10 reloadItems];

  id v12 = [(HUCameraPresenceRecordingSettingsModule *)self recordingSettingItemProvider];
  int v13 = [v12 items];
  id v14 = [v13 allObjects];
  [(HUCameraPresenceRecordingSettingsModule *)self setOptionItems:v14];

  long long v15 = (void *)MEMORY[0x1E4F1CAD0];
  id v16 = [(HUCameraPresenceRecordingSettingsModule *)self optionItems];
  id v17 = [v15 setWithArray:v16];
  uint64_t v18 = [(HUCameraPresenceRecordingSettingsModule *)self showOptionsItem];
  uint64_t v19 = [v17 setByAddingObject:v18];

  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v19];
  [(HUCameraPresenceRecordingSettingsModule *)self setItemProvider:v20];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

id __61__HUCameraPresenceRecordingSettingsModule__buildItemProvider__block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v2 = objc_opt_new();
    id v3 = [WeakRetained _titleString];
    [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    [WeakRetained accessModeSetting];
    id v4 = HFLocalizedStringFromHMCameraAccessMode();
    [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68980]];

    id v5 = [WeakRetained home];
    int v6 = objc_msgSend(v5, "hf_currentUserIsAdministrator");
    uint64_t v7 = MEMORY[0x1E4F1CC38];
    if (v6) {
      uint64_t v8 = MEMORY[0x1E4F1CC28];
    }
    else {
      uint64_t v8 = MEMORY[0x1E4F1CC38];
    }
    [v2 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

    [v2 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68A10]];
    uint64_t v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v13 = *MEMORY[0x1E4F68B10];
    v14[0] = MEMORY[0x1E4F1CC38];
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v9 = [v10 futureWithResult:v11];
  }

  return v9;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F692E8]);
  int v6 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[HUCameraPresenceRecordingSettingsModule presenceEventType](self, "presenceEventType"));
  uint64_t v7 = (void *)[v5 initWithIdentifier:v6];

  uint64_t v8 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v9 = [(HUCameraPresenceRecordingSettingsModule *)self showOptionsItem];
  uint64_t v10 = [v8 arrayWithObject:v9];

  if ([(HUExpandableItemModule *)self showOptions])
  {
    id v11 = [(HUCameraPresenceRecordingSettingsModule *)self optionItems];
    id v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_143];

    [v10 addObjectsFromArray:v12];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__HUCameraPresenceRecordingSettingsModule_buildSectionsWithDisplayedItems___block_invoke_3;
  v17[3] = &unk_1E6386108;
  id v18 = v4;
  id v13 = v4;
  id v14 = objc_msgSend(v10, "na_filter:", v17);
  [v7 setItems:v14];

  v19[0] = v7;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];

  return v15;
}

uint64_t __75__HUCameraPresenceRecordingSettingsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68B48];
  uint64_t v7 = [v5 objectForKey:*MEMORY[0x1E4F68B48]];

  uint64_t v8 = [v4 latestResults];

  uint64_t v9 = [v8 objectForKey:v6];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  id v10 = v7;
  id v18 = v10;
  id v11 = v9;
  id v12 = v11;
  id v19 = v11;
  if (v10) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = v11 != 0;
  }
  if (v10) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    long long v15 = v11;
  }
  else
  {
    uint64_t v13 = objc_msgSend(v10, "compare:", v11, v17, 3221225472, __75__HUCameraPresenceRecordingSettingsModule_buildSectionsWithDisplayedItems___block_invoke_2, &unk_1E6385480, v10);
    long long v15 = v19;
  }

  return v13;
}

uint64_t __75__HUCameraPresenceRecordingSettingsModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) compare:*(void *)(a1 + 40)];
}

uint64_t __75__HUCameraPresenceRecordingSettingsModule_buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (NSString)longestCameraUsageOptionItemTitle
{
  p_longestCameraUsageOptionItemTitle = &self->_longestCameraUsageOptionItemTitle;
  longestCameraUsageOptionItemTitle = self->_longestCameraUsageOptionItemTitle;
  if (longestCameraUsageOptionItemTitle)
  {
    id v4 = longestCameraUsageOptionItemTitle;
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__20;
    uint64_t v13 = __Block_byref_object_dispose__20;
    id v14 = 0;
    id v5 = [(HUCameraPresenceRecordingSettingsModule *)self recordingSettingItemProvider];
    uint64_t v6 = [v5 items];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__HUCameraPresenceRecordingSettingsModule_longestCameraUsageOptionItemTitle__block_invoke;
    v8[3] = &unk_1E638CE40;
    v8[4] = &v9;
    objc_msgSend(v6, "na_each:", v8);

    objc_storeStrong((id *)p_longestCameraUsageOptionItemTitle, (id)v10[5]);
    id v4 = (NSString *)(id)v10[5];
    _Block_object_dispose(&v9, 8);
  }

  return v4;
}

void __76__HUCameraPresenceRecordingSettingsModule_longestCameraUsageOptionItemTitle__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 latestResults];
  id obj = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  id v4 = obj;
  if (obj)
  {
    unint64_t v5 = [obj length];
    unint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) length];
    id v4 = obj;
    if (v5 > v6)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
      id v4 = obj;
    }
  }
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_INFO, "ICQUpgradeFlowManager did cancel upgrade flow", buf, 2u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = [(HUCameraPresenceRecordingSettingsModule *)self cameraProfiles];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(HUCameraPresenceRecordingSettingsModule *)self _dispatchUpdateForCameraProfile:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }

  [(HUCameraPresenceRecordingSettingsModule *)self sendCAMetricInfo];
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  [(HUCameraPresenceRecordingSettingsModule *)self setDidCompleteCloudUpgradeOffer:1];
  [(HUCameraPresenceRecordingSettingsModule *)self setUpgradeState:3];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_INFO, "ICQUpgradeFlowManager did complete upgrade flow", v6, 2u);
  }

  id v5 = [(HUCameraPresenceRecordingSettingsModule *)self updateStreamingSetting:2 isRetry:1];
}

- (unint64_t)countCameraProfilesWithRecordingService
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v2 = [(HUCameraPresenceRecordingSettingsModule *)self cameraProfiles];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "hf_supportsRecordingEvents");
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)sendCAMetricInfo
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    unint64_t v12 = [(HUCameraPresenceRecordingSettingsModule *)self numCamerasSupportRecordingService];
    __int16 v13 = 2048;
    unint64_t v14 = [(HUCameraPresenceRecordingSettingsModule *)self offerState];
    __int16 v15 = 2048;
    unint64_t v16 = [(HUCameraPresenceRecordingSettingsModule *)self upgradeState];
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_INFO, "[Core-Analytics iCloud Upgrade Metric Info] numCamerasSupportRecording: %lu offerState: %lu iCloudUpgradeState: %lu", buf, 0x20u);
  }

  uint64_t v4 = (void *)MEMORY[0x1E4F68EE0];
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HUCameraPresenceRecordingSettingsModule numCamerasSupportRecordingService](self, "numCamerasSupportRecordingService", *MEMORY[0x1E4F682B8]));
  v10[0] = v5;
  v9[1] = *MEMORY[0x1E4F682C0];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HUCameraPresenceRecordingSettingsModule offerState](self, "offerState"));
  v10[1] = v6;
  v9[2] = *MEMORY[0x1E4F68300];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HUCameraPresenceRecordingSettingsModule upgradeState](self, "upgradeState"));
  v10[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  [v4 sendEvent:2 withData:v8];
}

- (void)dealloc
{
  if (_os_feature_enabled_impl())
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F59BB8];
    uint64_t v4 = [(HUCameraPresenceRecordingSettingsModule *)self featureChangeObserver];
    [v3 unregisterForFeatureChangeNotificationsUsingObserver:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)HUCameraPresenceRecordingSettingsModule;
  [(HUCameraPresenceRecordingSettingsModule *)&v5 dealloc];
}

- (id)showOptionsItem
{
  return self->_showOptionsItem;
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (unint64_t)presenceEventType
{
  return self->_presenceEventType;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (HUCameraUsageOptionItemProvider)recordingSettingItemProvider
{
  return self->_recordingSettingItemProvider;
}

- (void)setRecordingSettingItemProvider:(id)a3
{
}

- (HFStaticItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (UIViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (NSArray)optionItems
{
  return self->_optionItems;
}

- (void)setOptionItems:(id)a3
{
}

- (BOOL)didCompleteCloudUpgradeOffer
{
  return self->_didCompleteCloudUpgradeOffer;
}

- (void)setDidCompleteCloudUpgradeOffer:(BOOL)a3
{
  self->_didCompleteCloudUpgradeOffer = a3;
}

- (unint64_t)upgradeState
{
  return self->_upgradeState;
}

- (void)setUpgradeState:(unint64_t)a3
{
  self->_upgradeState = a3;
}

- (unint64_t)offerState
{
  return self->_offerState;
}

- (void)setOfferState:(unint64_t)a3
{
  self->_offerState = a3;
}

- (unint64_t)numCamerasSupportRecordingService
{
  return self->_numCamerasSupportRecordingService;
}

- (void)setNumCamerasSupportRecordingService:(unint64_t)a3
{
  self->_numCamerasSupportRecordingService = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (NSNumber)currentPlanCameraCount
{
  return self->_currentPlanCameraCount;
}

- (void)setCurrentPlanCameraCount:(id)a3
{
}

- (FeatureChangeObserver)featureChangeObserver
{
  return self->_featureChangeObserver;
}

- (void)setFeatureChangeObserver:(id)a3
{
}

- (BOOL)pendingUpgradeRequest
{
  return self->_pendingUpgradeRequest;
}

- (void)setPendingUpgradeRequest:(BOOL)a3
{
  self->_pendingUpgradeRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureChangeObserver, 0);
  objc_storeStrong((id *)&self->_currentPlanCameraCount, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_optionItems, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_recordingSettingItemProvider, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_cameraProfiles, 0);
  objc_storeStrong((id *)&self->_longestCameraUsageOptionItemTitle, 0);
  objc_storeStrong((id *)&self->_showOptionsItem, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end