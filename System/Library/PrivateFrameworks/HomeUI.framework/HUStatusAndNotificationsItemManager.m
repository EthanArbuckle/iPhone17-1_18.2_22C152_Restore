@interface HUStatusAndNotificationsItemManager
- (BOOL)_isAudioAnalysisSupportedDevice;
- (BOOL)areNotificationsEnabled;
- (BOOL)cameraProfileSupportsSmartNotifications;
- (BOOL)hasDoorbellCamera;
- (BOOL)isNonHKSVCameraDoorbell;
- (BOOL)serviceItemBelongsToCamera;
- (BOOL)showStatusSection;
- (BOOL)showsActivityNotificationsSection;
- (BOOL)showsAudioNotificationSection;
- (BOOL)showsCameraSmartNotificationSection;
- (BOOL)showsCameraSnapshotSection;
- (BOOL)showsCameraStatusChangeSection;
- (BOOL)showsDoorbellChimeSection;
- (BOOL)showsForServiceDetails;
- (BOOL)showsSmartActivitySection;
- (BOOL)showsTriggerConditionSection;
- (HFServiceLikeItem)serviceItem;
- (HFStaticItem)allowActivityNotificationsItem;
- (HFStaticItem)allowAnalogChimeNotificationItem;
- (HFStaticItem)allowAudioNotificationsItem;
- (HFStaticItem)allowCameraReachabilityChangeNotificationsItem;
- (HFStaticItem)allowCameraStatusChangesItem;
- (HFStaticItem)allowDoorbellNotificationsItem;
- (HFStaticItem)allowMotionNotificationsItem;
- (HFStaticItem)allowNotificationsItem;
- (HFStaticItem)includeInStatusItem;
- (HFUserNotificationServiceSettings)notificationSettings;
- (HFUserNotificationServiceSettingsProviding)notificationSettingsProvider;
- (HMHome)overrideHome;
- (HUAudioAnalysisDetectionSettingsModule)audioAnalysisDetectionSettingsModule;
- (HUCameraSmartDetectionSettingsModule)cameraSmartDetectionSettingsModule;
- (HUChimeOnAccessoriesListItem)chimeOnAccessoriesListItem;
- (HUChimeOnHomePodSingleItem)chimeOnHomePodSingleItem;
- (HUServiceDetailsCameraAllowSnapshotsItem)allowCameraSnapshotsItem;
- (HUStatusAndNotificationsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUStatusAndNotificationsItemManager)initWithServiceItem:(id)a3 delegate:(id)a4 home:(id)a5;
- (HUTriggerConditionEditorItemModule)conditionModule;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (id)_sourceItemAsMediaAccessoryItem;
- (id)_updateConditionCollectionForAudioAnalysisNotification:(id)a3;
- (id)_updateNotificationSettings:(id)a3;
- (id)_updateNotificationSettings:(id)a3 notificationSettingsProvider:(id)a4;
- (id)homeStatusVisibleObject;
- (id)updateAllowAudioNotifications:(BOOL)a3;
- (id)updateAllowCameraReachabilityStatusChangeNotifications:(BOOL)a3;
- (id)updateAllowCameraStatusChangeNotifications:(BOOL)a3;
- (id)updateAllowChimeAnalogNotifications:(BOOL)a3;
- (id)updateAllowDoorbellNotifications:(BOOL)a3;
- (id)updateAllowMotionNotifications:(BOOL)a3;
- (id)updateAllowNotifications:(BOOL)a3;
- (id)updateAllowSmartActivityNotifications:(BOOL)a3;
- (id)updateAllowSnapshotsInNotifications:(BOOL)a3;
- (id)updateCameraSmartNotificationCondition:(id)a3;
- (id)updateChimeOnAccessory:(BOOL)a3;
- (id)updateNotificationCondition:(id)a3;
- (void)setAllowActivityNotificationsItem:(id)a3;
- (void)setAllowAnalogChimeNotificationItem:(id)a3;
- (void)setAllowAudioNotificationsItem:(id)a3;
- (void)setAllowCameraReachabilityChangeNotificationsItem:(id)a3;
- (void)setAllowCameraSnapshotsItem:(id)a3;
- (void)setAllowCameraStatusChangesItem:(id)a3;
- (void)setAllowDoorbellNotificationsItem:(id)a3;
- (void)setAllowMotionNotificationsItem:(id)a3;
- (void)setAllowNotificationsItem:(id)a3;
- (void)setChimeOnAccessoriesListItem:(id)a3;
- (void)setHasDoorbellCamera:(BOOL)a3;
- (void)setIncludeInStatusItem:(id)a3;
- (void)setServiceItemBelongsToCamera:(BOOL)a3;
- (void)setShowStatusSection:(BOOL)a3;
- (void)setShowsAudioNotificationSection:(BOOL)a3;
- (void)setShowsCameraSmartNotificationSection:(BOOL)a3;
- (void)setShowsCameraSnapshotSection:(BOOL)a3;
- (void)setShowsCameraStatusChangeSection:(BOOL)a3;
- (void)setShowsDoorbellChimeSection:(BOOL)a3;
- (void)setShowsForServiceDetails:(BOOL)a3;
- (void)setShowsSmartActivitySection:(BOOL)a3;
- (void)setShowsTriggerConditionSection:(BOOL)a3;
@end

@implementation HUStatusAndNotificationsItemManager

- (HUStatusAndNotificationsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithServiceItem_delegate_home_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUStatusAndNotificationsItemManager.m", 63, @"%s is unavailable; use %@ instead",
    "-[HUStatusAndNotificationsItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUStatusAndNotificationsItemManager)initWithServiceItem:(id)a3 delegate:(id)a4 home:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  v12 = (void *)[v9 copy];
  v50.receiver = self;
  v50.super_class = (Class)HUStatusAndNotificationsItemManager;
  v13 = [(HFItemManager *)&v50 initWithDelegate:v11 sourceItem:v12];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_serviceItem, a3);
    objc_storeStrong((id *)&v13->_overrideHome, a5);
    v14 = [(HUStatusAndNotificationsItemManager *)v13 notificationSettings];
    v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[HUStatusAndNotificationsItemManager initWithServiceItem:delegate:home:]";
      __int16 v53 = 2112;
      v54 = v14;
      _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "%s notificationSettings: %@", buf, 0x16u);
    }

    if ([MEMORY[0x1E4F69758] hasInternalDiagnostics])
    {
      objc_opt_class();
      v16 = [(HUStatusAndNotificationsItemManager *)v13 notificationSettingsProvider];
      if (objc_opt_isKindOfClass()) {
        v17 = v16;
      }
      else {
        v17 = 0;
      }
      id v18 = v17;

      if (v18)
      {
        v19 = HFLogForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v49 = [v18 bulletinBoardNotificationByEndpoint];
          *(_DWORD *)buf = 136315394;
          v52 = "-[HUStatusAndNotificationsItemManager initWithServiceItem:delegate:home:]";
          __int16 v53 = 2112;
          v54 = v49;
          _os_log_debug_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEBUG, "%s: bulletinBoardNotificationByEndpoint: %@", buf, 0x16u);
        }
      }
    }
    if (!v14) {
      goto LABEL_32;
    }
    id v20 = objc_alloc(MEMORY[0x1E4F69078]);
    v21 = (void *)[v20 initWithConditions:MEMORY[0x1E4F1CBF0]];
    v22 = [v14 smartCameraNotificationCondition];

    if (v22)
    {
      v23 = (void *)MEMORY[0x1E4F69078];
      uint64_t v24 = [v14 smartCameraNotificationCondition];
    }
    else
    {
      v25 = [v14 notificationCondition];

      if (!v25)
      {
LABEL_19:
        v28 = [MEMORY[0x1E4F1CAD0] set];
        objc_opt_class();
        id v29 = v9;
        if (objc_opt_isKindOfClass()) {
          v30 = v29;
        }
        else {
          v30 = 0;
        }
        id v31 = v30;

        if (v31
          || [(HUStatusAndNotificationsItemManager *)v13 _isAudioAnalysisSupportedDevice])
        {
          uint64_t v32 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F19B3F20];

          v28 = (void *)v32;
        }
        v33 = [[HUTriggerConditionEditorItemModule alloc] initWithItemUpdater:v13 home:v10 conditionCollection:v21 disallowedConditionTypes:v28];
        conditionModule = v13->_conditionModule;
        v13->_conditionModule = v33;

        if ([(HUStatusAndNotificationsItemManager *)v13 _isAudioAnalysisSupportedDevice])
        {
          v35 = [(HUStatusAndNotificationsItemManager *)v13 _sourceItemAsMediaAccessoryItem];
          v36 = v35;
          if (v35)
          {
            v37 = [v35 accessories];
            v38 = [v37 anyObject];

            v39 = [[HUAudioAnalysisDetectionSettingsModule alloc] initWithItemUpdater:v13 accessory:v38];
            audioAnalysisDetectionSettingsModule = v13->_audioAnalysisDetectionSettingsModule;
            v13->_audioAnalysisDetectionSettingsModule = v39;
          }
        }
        if (v31)
        {
          v41 = [HUCameraSmartDetectionSettingsModule alloc];
          v42 = (void *)MEMORY[0x1E4F1CAD0];
          v43 = [v31 profile];
          v44 = [v42 setWithObject:v43];
          uint64_t v45 = [(HUCameraSmartDetectionSettingsModule *)v41 initWithItemUpdater:v13 cameraProfiles:v44 conditionCollection:v21 settingsContext:1];
          cameraSmartDetectionSettingsModule = v13->_cameraSmartDetectionSettingsModule;
          v13->_cameraSmartDetectionSettingsModule = (HUCameraSmartDetectionSettingsModule *)v45;
        }
LABEL_32:
        v47 = [(HUStatusAndNotificationsItemManager *)v13 homeStatusVisibleObject];
        v13->_showStatusSection = v47 != 0;

        goto LABEL_33;
      }
      v23 = (void *)MEMORY[0x1E4F69078];
      uint64_t v24 = [v14 notificationCondition];
    }
    v26 = (void *)v24;
    uint64_t v27 = [v23 conditionCollectionForPredicate:v24];

    v21 = (void *)v27;
    goto LABEL_19;
  }
LABEL_33:

  return v13;
}

- (void)setShowStatusSection:(BOOL)a3
{
  if (a3
    && ([(HUStatusAndNotificationsItemManager *)self homeStatusVisibleObject],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    id v6 = [(HUStatusAndNotificationsItemManager *)self serviceItem];
    NSLog(&cfstr_CannotShowStat.isa, v6);
  }
  else
  {
    self->_showStatusSection = a3;
  }
}

- (BOOL)showsDoorbellChimeSection
{
  if (![(HUStatusAndNotificationsItemManager *)self hasDoorbellCamera]) {
    return 0;
  }
  v3 = [(HFItemManager *)self home];
  v4 = objc_msgSend(v3, "hf_allHomePodsOrStereoPairsThatWillChime");
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)showsCameraSnapshotSection
{
  objc_opt_class();
  v3 = [(HUStatusAndNotificationsItemManager *)self serviceItem];
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [v5 profile];
    v7 = [v6 userSettings];
    unint64_t v8 = ((unint64_t)[v7 supportedFeatures] >> 5) & 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)areNotificationsEnabled
{
  if ([(HUStatusAndNotificationsItemManager *)self hasDoorbellCamera]
    && [(HUStatusAndNotificationsItemManager *)self cameraProfileSupportsSmartNotifications])
  {
    v3 = [(HUStatusAndNotificationsItemManager *)self notificationSettings];
    char v4 = [v3 areSmartDetectionNotificationsEnabled];
  }
  else
  {
    v3 = [(HUStatusAndNotificationsItemManager *)self notificationSettings];
    char v4 = [v3 areNotificationsEnabled];
  }
  BOOL v5 = v4;

  return v5;
}

- (BOOL)showsTriggerConditionSection
{
  v3 = [(HFItemManager *)self home];
  char v4 = [(HFItemManager *)self home];
  BOOL v5 = [v4 currentUser];
  char v6 = objc_msgSend(v3, "hf_userIsRestrictedGuest:", v5);

  if (v6)
  {
    LOBYTE(v7) = 0;
    return v7;
  }
  objc_opt_class();
  unint64_t v8 = [(HUStatusAndNotificationsItemManager *)self serviceItem];
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  if (!v9)
  {
    v13 = [(HUStatusAndNotificationsItemManager *)self notificationSettings];
    if ([v13 areNotificationsEnabled]) {
      BOOL v7 = ![(HUStatusAndNotificationsItemManager *)self serviceItemBelongsToCamera];
    }
    else {
      LOBYTE(v7) = 0;
    }

    return v7;
  }
  if ([(HUStatusAndNotificationsItemManager *)self isNonHKSVCameraDoorbell])
  {
    id v10 = [(HUStatusAndNotificationsItemManager *)self notificationSettings];
    char v11 = [v10 areMotionNotificationsEnabled];

    return v11;
  }
  else
  {
    return [(HUStatusAndNotificationsItemManager *)self areNotificationsEnabled];
  }
}

- (BOOL)showsActivityNotificationsSection
{
  v3 = [(HUStatusAndNotificationsItemManager *)self _sourceItemAsMediaAccessoryItem];
  char v4 = [v3 accessories];
  BOOL v5 = [v4 anyObject];

  char v6 = [(HUStatusAndNotificationsItemManager *)self notificationSettings];
  if (v6 && ![(HUStatusAndNotificationsItemManager *)self serviceItemBelongsToCamera]) {
    int v7 = objc_msgSend(v5, "hf_isHomePod") ^ 1;
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isNonHKSVCameraDoorbell
{
  BOOL v3 = [(HUStatusAndNotificationsItemManager *)self hasDoorbellCamera];
  if (v3) {
    LOBYTE(v3) = ![(HUStatusAndNotificationsItemManager *)self cameraProfileSupportsSmartNotifications];
  }
  return v3;
}

- (BOOL)cameraProfileSupportsSmartNotifications
{
  objc_opt_class();
  BOOL v3 = [(HUStatusAndNotificationsItemManager *)self serviceItem];
  if (objc_opt_isKindOfClass()) {
    char v4 = v3;
  }
  else {
    char v4 = 0;
  }
  id v5 = v4;

  char v6 = [v5 profile];
  char v7 = objc_msgSend(v6, "hf_supportsRecordingEvents");

  unint64_t v8 = [v5 accessory];

  id v9 = [v8 home];
  char v10 = objc_msgSend(v9, "hf_hasCameraRecordingResident");

  if (v5) {
    char v11 = v7;
  }
  else {
    char v11 = 0;
  }
  return v11 & v10;
}

- (BOOL)showsCameraSmartNotificationSection
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  BOOL v3 = [(HUStatusAndNotificationsItemManager *)self serviceItem];
  if (objc_opt_isKindOfClass()) {
    char v4 = v3;
  }
  else {
    char v4 = 0;
  }
  id v5 = v4;

  BOOL v6 = [(HUStatusAndNotificationsItemManager *)self hasDoorbellCamera];
  char v7 = [(HUStatusAndNotificationsItemManager *)self notificationSettings];
  unint64_t v8 = v7;
  if (v6) {
    char v9 = [v7 areSmartDetectionNotificationsEnabled];
  }
  else {
    char v9 = [v7 areNotificationsEnabled];
  }
  char v10 = v9;

  char v11 = [v5 profile];
  char v12 = objc_msgSend(v11, "hf_supportsRecordingEvents");

  v13 = [v5 accessory];
  v14 = [v13 home];
  char v15 = objc_msgSend(v14, "hf_hasCameraRecordingResident");

  v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = [v5 accessory];
    id v18 = [v17 home];
    v19 = NSStringFromBOOL();
    id v20 = NSStringFromBOOL();
    v21 = NSStringFromBOOL();
    int v23 = 138413058;
    uint64_t v24 = v18;
    __int16 v25 = 2112;
    v26 = v19;
    __int16 v27 = 2112;
    v28 = v20;
    __int16 v29 = 2112;
    v30 = v21;
    _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_INFO, "Performing check for show camera smart notification section. home: %@, notificationsEnabled: %@, camera supports recording: %@, home has recording resident: %@", (uint8_t *)&v23, 0x2Au);
  }
  if (!v5) {
    char v10 = 0;
  }

  return v10 & v12 & v15;
}

- (BOOL)hasDoorbellCamera
{
  objc_opt_class();
  BOOL v3 = [(HUStatusAndNotificationsItemManager *)self serviceItem];
  if (objc_opt_isKindOfClass()) {
    char v4 = v3;
  }
  else {
    char v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    BOOL v6 = [v5 accessory];
    char v7 = objc_msgSend(v6, "hf_serviceOfType:", *MEMORY[0x1E4F2DE20]);
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)showsCameraStatusChangeSection
{
  objc_opt_class();
  BOOL v3 = [(HUStatusAndNotificationsItemManager *)self serviceItem];
  if (objc_opt_isKindOfClass()) {
    char v4 = v3;
  }
  else {
    char v4 = 0;
  }
  id v5 = v4;

  BOOL v6 = [v5 profile];

  LOBYTE(v5) = objc_msgSend(v6, "hf_supportsRecordingEvents");
  return (char)v5;
}

- (BOOL)showsSmartActivitySection
{
  objc_opt_class();
  BOOL v3 = [(HUStatusAndNotificationsItemManager *)self serviceItem];
  if (objc_opt_isKindOfClass()) {
    char v4 = v3;
  }
  else {
    char v4 = 0;
  }
  id v5 = v4;

  BOOL v6 = [v5 profile];
  if (objc_msgSend(v6, "hf_supportsRecordingEvents"))
  {
    char v7 = [v5 accessory];
    BOOL v8 = [v7 home];
    char v9 = objc_msgSend(v8, "hf_hasCameraRecordingResident");
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)showsAudioNotificationSection
{
  BOOL v3 = [(HUStatusAndNotificationsItemManager *)self notificationSettings];
  if (v3) {
    BOOL v4 = [(HUStatusAndNotificationsItemManager *)self _isAudioAnalysisSupportedDevice];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)serviceItemBelongsToCamera
{
  v2 = (void *)MEMORY[0x1E4F68F98];
  BOOL v3 = [(HUStatusAndNotificationsItemManager *)self serviceItem];
  LOBYTE(v2) = [v2 cameraContainsMotionServiceItem:v3];

  return (char)v2;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v109[11] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v73 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(&location, self);
  char v5 = [v4 areBulletinNotificationsSupported];
  BOOL v6 = (void *)MEMORY[0x1E4F1CA80];
  char v7 = [(HUStatusAndNotificationsItemManager *)self serviceItem];
  BOOL v8 = [v7 homeKitObject];
  char v9 = objc_msgSend(v6, "na_setWithSafeObject:", v8);

  [v9 addObject:v4];
  id v10 = objc_alloc(MEMORY[0x1E4F695C0]);
  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke;
  v105[3] = &unk_1E63861A0;
  objc_copyWeak(&v107, &location);
  id v11 = v9;
  id v106 = v11;
  char v12 = (void *)[v10 initWithResultsBlock:v105];
  [(HUStatusAndNotificationsItemManager *)self setIncludeInStatusItem:v12];

  v13 = [HUChimeOnAccessoriesListItem alloc];
  v14 = [(HFItemManager *)self home];
  char v15 = [(HUChimeOnAccessoriesListItem *)v13 initWithHome:v14];
  [(HUStatusAndNotificationsItemManager *)self setChimeOnAccessoriesListItem:v15];

  v16 = [(HUStatusAndNotificationsItemManager *)self notificationSettings];

  v17 = [HUServiceDetailsCameraAllowSnapshotsItem alloc];
  id v18 = [(HUStatusAndNotificationsItemManager *)self serviceItem];
  v19 = [(HUServiceDetailsCameraAllowSnapshotsItem *)v17 initWithSourceServiceItem:v18 home:v4 shouldBeHidden:v16 == 0];
  [(HUStatusAndNotificationsItemManager *)self setAllowCameraSnapshotsItem:v19];

  id v20 = objc_alloc(MEMORY[0x1E4F695C0]);
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_2;
  v101[3] = &unk_1E6388D38;
  objc_copyWeak(&v103, &location);
  char v104 = v5;
  id v21 = v11;
  id v102 = v21;
  v22 = (void *)[v20 initWithResultsBlock:v101];
  [(HUStatusAndNotificationsItemManager *)self setAllowNotificationsItem:v22];

  id v23 = objc_alloc(MEMORY[0x1E4F695C0]);
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_3;
  v97[3] = &unk_1E6388D38;
  objc_copyWeak(&v99, &location);
  char v100 = v5;
  id v24 = v21;
  id v98 = v24;
  __int16 v25 = (void *)[v23 initWithResultsBlock:v97];
  [(HUStatusAndNotificationsItemManager *)self setAllowMotionNotificationsItem:v25];

  id v26 = objc_alloc(MEMORY[0x1E4F695C0]);
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_4;
  v93[3] = &unk_1E6388D38;
  objc_copyWeak(&v95, &location);
  char v96 = v5;
  id v27 = v24;
  id v94 = v27;
  v28 = (void *)[v26 initWithResultsBlock:v93];
  [(HUStatusAndNotificationsItemManager *)self setAllowDoorbellNotificationsItem:v28];

  id v29 = objc_alloc(MEMORY[0x1E4F695C0]);
  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_5;
  v88[3] = &unk_1E6388D60;
  objc_copyWeak(&v91, &location);
  char v92 = v5;
  id v69 = v4;
  id v89 = v69;
  id v30 = v27;
  id v90 = v30;
  uint64_t v31 = (void *)[v29 initWithResultsBlock:v88];
  [(HUStatusAndNotificationsItemManager *)self setAllowAnalogChimeNotificationItem:v31];

  id v32 = objc_alloc(MEMORY[0x1E4F695C0]);
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_6;
  v84[3] = &unk_1E6388D38;
  objc_copyWeak(&v86, &location);
  char v87 = v5;
  id v33 = v30;
  id v85 = v33;
  v34 = (void *)[v32 initWithResultsBlock:v84];
  [(HUStatusAndNotificationsItemManager *)self setAllowCameraStatusChangesItem:v34];

  id v35 = objc_alloc(MEMORY[0x1E4F695C0]);
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_7;
  v80[3] = &unk_1E6388D38;
  objc_copyWeak(&v82, &location);
  char v83 = v5;
  id v36 = v33;
  id v81 = v36;
  v37 = (void *)[v35 initWithResultsBlock:v80];
  [(HUStatusAndNotificationsItemManager *)self setAllowCameraReachabilityChangeNotificationsItem:v37];

  id v38 = objc_alloc(MEMORY[0x1E4F695C0]);
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_8;
  v76[3] = &unk_1E6388D38;
  objc_copyWeak(&v78, &location);
  char v79 = v5;
  id v68 = v36;
  id v77 = v68;
  v39 = (void *)[v38 initWithResultsBlock:v76];
  [(HUStatusAndNotificationsItemManager *)self setAllowActivityNotificationsItem:v39];

  id v40 = objc_alloc(MEMORY[0x1E4F695C0]);
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_9;
  v74[3] = &unk_1E6384FD0;
  objc_copyWeak(&v75, &location);
  v41 = (void *)[v40 initWithResultsBlock:v74];
  [(HUStatusAndNotificationsItemManager *)self setAllowAudioNotificationsItem:v41];

  v72 = [(HUStatusAndNotificationsItemManager *)self includeInStatusItem];
  v109[0] = v72;
  v71 = [(HUStatusAndNotificationsItemManager *)self chimeOnAccessoriesListItem];
  v109[1] = v71;
  v70 = [(HUStatusAndNotificationsItemManager *)self allowCameraSnapshotsItem];
  v109[2] = v70;
  v42 = [(HUStatusAndNotificationsItemManager *)self allowCameraStatusChangesItem];
  v109[3] = v42;
  v43 = [(HUStatusAndNotificationsItemManager *)self allowCameraReachabilityChangeNotificationsItem];
  v109[4] = v43;
  v44 = [(HUStatusAndNotificationsItemManager *)self allowNotificationsItem];
  v109[5] = v44;
  uint64_t v45 = [(HUStatusAndNotificationsItemManager *)self allowAudioNotificationsItem];
  v109[6] = v45;
  v46 = [(HUStatusAndNotificationsItemManager *)self allowMotionNotificationsItem];
  v109[7] = v46;
  v47 = [(HUStatusAndNotificationsItemManager *)self allowAnalogChimeNotificationItem];
  v109[8] = v47;
  v48 = [(HUStatusAndNotificationsItemManager *)self allowDoorbellNotificationsItem];
  v109[9] = v48;
  v49 = [(HUStatusAndNotificationsItemManager *)self allowActivityNotificationsItem];
  v109[10] = v49;
  objc_super v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:11];
  [v73 addObjectsFromArray:v50];

  v51 = [MEMORY[0x1E4F1CA48] array];
  id v52 = objc_alloc(MEMORY[0x1E4F695C8]);
  __int16 v53 = [MEMORY[0x1E4F1CAD0] setWithArray:v73];
  v54 = (void *)[v52 initWithItems:v53];
  [v51 addObject:v54];

  uint64_t v55 = [(HUStatusAndNotificationsItemManager *)self conditionModule];

  if (v55)
  {
    v56 = [(HUStatusAndNotificationsItemManager *)self conditionModule];
    v57 = [v56 itemProviders];
    v58 = [v57 allObjects];
    [v51 addObjectsFromArray:v58];
  }
  v59 = [(HUStatusAndNotificationsItemManager *)self cameraSmartDetectionSettingsModule];

  if (v59)
  {
    v60 = [(HUStatusAndNotificationsItemManager *)self cameraSmartDetectionSettingsModule];
    v61 = [v60 itemProviders];
    v62 = [v61 allObjects];
    [v51 addObjectsFromArray:v62];
  }
  v63 = [(HUStatusAndNotificationsItemManager *)self audioAnalysisDetectionSettingsModule];

  if (v63)
  {
    v64 = [(HUStatusAndNotificationsItemManager *)self audioAnalysisDetectionSettingsModule];
    v65 = [v64 itemProviders];
    v66 = [v65 allObjects];
    [v51 addObjectsFromArray:v66];
  }
  objc_destroyWeak(&v75);

  objc_destroyWeak(&v78);
  objc_destroyWeak(&v82);

  objc_destroyWeak(&v86);
  objc_destroyWeak(&v91);

  objc_destroyWeak(&v95);
  objc_destroyWeak(&v99);

  objc_destroyWeak(&v103);
  objc_destroyWeak(&v107);

  objc_destroyWeak(&location);

  return v51;
}

id __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = _HULocalizedStringWithDefaultValue(@"HUStatusAndNotificationsIncludeInStatusTitle", @"HUStatusAndNotificationsIncludeInStatusTitle", 1);
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v3 setObject:@"HUStatusAndNotificationsIncludeInStatusTitle" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
  char v5 = (void *)[*(id *)(a1 + 32) copy];
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  uint64_t v6 = [WeakRetained homeStatusVisibleObject];
  if (v6
    && (char v7 = (void *)v6,
        [WeakRetained homeStatusVisibleObject],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = objc_msgSend(v8, "hf_supportsHomeStatus"),
        v8,
        v7,
        v9))
  {
    id v10 = [WeakRetained homeStatusVisibleObject];
    if ((objc_msgSend(v10, "hf_isVisibleInHomeStatus") & 1) == 0)
    {
      id v11 = [WeakRetained homeStatusVisibleObject];
      objc_msgSend(v11, "hf_hasSetVisibleInHomeStatus");
    }
    char v12 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
    [v3 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  v13 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v13;
}

id __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [WeakRetained notificationSettings];
  char v5 = v4;
  if (v4)
  {
    uint64_t v6 = NSNumber;
    [v4 areNotificationsEnabled];
    char v7 = [v6 numberWithInteger:HFPrimaryStateFromBOOL()];
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  BOOL v8 = [NSNumber numberWithInt:*(unsigned char *)(a1 + 48) == 0];
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  int v9 = _HULocalizedStringWithDefaultValue(@"HUStatusAndNotificationsAllowNotifications", @"HUStatusAndNotificationsAllowNotifications", 1);
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  id v10 = (void *)[*(id *)(a1 + 32) copy];
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  id v11 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v11;
}

id __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_opt_class();
  id v4 = [WeakRetained serviceItem];
  if (objc_opt_isKindOfClass()) {
    char v5 = v4;
  }
  else {
    char v5 = 0;
  }

  if (v5)
  {
    uint64_t v6 = NSNumber;
    char v7 = [WeakRetained notificationSettings];
    [v7 areMotionNotificationsEnabled];
    BOOL v8 = [v6 numberWithInteger:HFPrimaryStateFromBOOL()];
    [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  int v9 = [NSNumber numberWithInt:*(unsigned char *)(a1 + 48) == 0];
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  id v10 = _HULocalizedStringWithDefaultValue(@"HUStatusAndNotificationMotionNotificationsTitle", @"HUStatusAndNotificationMotionNotificationsTitle", 1);
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
  id v11 = (void *)[*(id *)(a1 + 32) copy];
  [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  char v12 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v12;
}

id __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_opt_class();
  id v4 = [WeakRetained serviceItem];
  if (objc_opt_isKindOfClass()) {
    char v5 = v4;
  }
  else {
    char v5 = 0;
  }

  if (v5)
  {
    uint64_t v6 = NSNumber;
    char v7 = [WeakRetained notificationSettings];
    [v7 areDoorbellNotificationsEnabled];
    BOOL v8 = [v6 numberWithInteger:HFPrimaryStateFromBOOL()];
    [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  int v9 = [NSNumber numberWithInt:*(unsigned char *)(a1 + 48) == 0];
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  id v10 = _HULocalizedStringWithDefaultValue(@"HUStatusAndNotificationDoorbellNotificationsTitle", @"HUStatusAndNotificationDoorbellNotificationsTitle", 1);
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
  id v11 = (void *)[*(id *)(a1 + 32) copy];
  [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  char v12 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v12;
}

id __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_opt_class();
  id v4 = [WeakRetained serviceItem];
  if (objc_opt_isKindOfClass()) {
    char v5 = v4;
  }
  else {
    char v5 = 0;
  }
  id v6 = v5;

  char v7 = [v6 profile];

  BOOL v8 = objc_msgSend(v7, "hf_doorbellChimeMuteCharacteristic");

  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || ([WeakRetained showsForServiceDetails] & 1) != 0)
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  else
  {
    objc_opt_class();
    id v10 = [v8 value];
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;

    [v12 BOOLValue];
    v13 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
    [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];
  }
  uint64_t v14 = 1;
  char v15 = _HULocalizedStringWithDefaultValue(@"HUCameraDoorbellChimeMuteSwitchTitle", @"HUCameraDoorbellChimeMuteSwitchTitle", 1);
  [v3 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsAdministrator") ^ 1;
  }
  v16 = [NSNumber numberWithBool:v14];
  [v3 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  v17 = (void *)[*(id *)(a1 + 40) copy];
  [v3 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  id v18 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v18;
}

id __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_opt_class();
  id v4 = [WeakRetained serviceItem];
  if (objc_opt_isKindOfClass()) {
    char v5 = v4;
  }
  else {
    char v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    char v7 = NSNumber;
    BOOL v8 = [v6 profile];
    BOOL v9 = [v8 userSettings];
    [v9 isAccessModeChangeNotificationEnabled];
    id v10 = [v7 numberWithInteger:HFPrimaryStateFromBOOL()];
    [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  id v11 = [NSNumber numberWithInt:*(unsigned char *)(a1 + 48) == 0];
  [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  id v12 = _HULocalizedStringWithDefaultValue(@"HUStatusAndNotificationsCameraStatusChangesTitle", @"HUStatusAndNotificationsCameraStatusChangesTitle", 1);
  [v3 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v3 setObject:@"HUStatusAndNotificationsCameraStatusChangesTitle" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
  v13 = (void *)[*(id *)(a1 + 32) copy];
  [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  uint64_t v14 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v14;
}

id __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_opt_class();
  id v4 = [WeakRetained serviceItem];
  if (objc_opt_isKindOfClass()) {
    char v5 = v4;
  }
  else {
    char v5 = 0;
  }
  id v6 = v5;

  char v7 = [v6 profile];
  int v8 = objc_msgSend(v7, "hf_supportsReachabilityNotifications");

  if (v8)
  {
    BOOL v9 = NSNumber;
    id v10 = [v6 profile];
    id v11 = [v10 userSettings];
    [v11 isReachabilityEventNotificationEnabled];
    id v12 = [v9 numberWithInteger:HFPrimaryStateFromBOOL()];
    [v3 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  v13 = [NSNumber numberWithInt:*(unsigned char *)(a1 + 48) == 0];
  [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  uint64_t v14 = _HULocalizedStringWithDefaultValue(@"HUStatusAndNotificationsCameraReachabilityChangesTitle", @"HUStatusAndNotificationsCameraReachabilityChangesTitle", 1);
  [v3 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v3 setObject:@"HUStatusAndNotificationsCameraReachabilityChangesTitle" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
  char v15 = (void *)[*(id *)(a1 + 32) copy];
  [v3 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  v16 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v16;
}

id __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([WeakRetained showsActivityNotificationsSection])
  {
    int v4 = [WeakRetained isNonHKSVCameraDoorbell];
    char v5 = NSNumber;
    if (v4)
    {
      id v6 = [WeakRetained notificationSettings];
      [v6 areMotionNotificationsEnabled];
      char v7 = [v5 numberWithInteger:HFPrimaryStateFromBOOL()];
      [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];
    }
    else
    {
      [WeakRetained areNotificationsEnabled];
      int v8 = [v5 numberWithInteger:HFPrimaryStateFromBOOL()];
      [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];
    }
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  BOOL v9 = [NSNumber numberWithInt:*(unsigned char *)(a1 + 48) == 0];
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
  id v10 = _HULocalizedStringWithDefaultValue(@"HUStatusAndNotificationActivityNotificationsTitle", @"HUStatusAndNotificationActivityNotificationsTitle", 1);
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v3 setObject:@"HUStatusAndNotificationActivityNotificationsTitle" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
  id v11 = (void *)[*(id *)(a1 + 32) copy];
  [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  id v12 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v12;
}

id __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([WeakRetained showsAudioNotificationSection])
  {
    BOOL v3 = NSNumber;
    [WeakRetained areNotificationsEnabled];
    int v4 = [v3 numberWithInteger:HFPrimaryStateFromBOOL()];
    [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];
  }
  else
  {
    [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  [v2 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
  char v5 = _HULocalizedStringWithDefaultValue(@"HUNotificationsTitle", @"HUNotificationsTitle", 1);
  [v2 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  char v7 = [WeakRetained serviceItem];
  int v8 = [v7 homeKitObject];
  BOOL v9 = objc_msgSend(v6, "na_setWithSafeObject:", v8);
  [v2 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  id v10 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v10;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(HUStatusAndNotificationsItemManager *)self _sourceItemAsMediaAccessoryItem];
  char v7 = [v6 accessories];
  uint64_t v71 = [v7 anyObject];

  int v8 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  BOOL v9 = [v8 homeManager];
  int v10 = [v9 hasOptedToHH2];

  id v11 = [(HFItemManager *)self home];
  id v12 = [v11 residentDevices];

  if (v10 && [v12 count]) {
    int v13 = 1;
  }
  else {
    int v13 = v10 ^ 1;
  }
  uint64_t v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    char v83 = "-[HUStatusAndNotificationsItemManager _buildSectionsWithDisplayedItems:]";
    __int16 v84 = 1024;
    int v85 = v10;
    __int16 v86 = 2048;
    uint64_t v87 = [v12 count];
    _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%s hasOptedToHH2 = %{BOOL}d residents = %lu", buf, 0x1Cu);
  }

  if ([(HUStatusAndNotificationsItemManager *)self showStatusSection])
  {
    char v15 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUStatusAndNotificationsIncludeInStatusSectionIdentifier"];
    v16 = [(HUStatusAndNotificationsItemManager *)self includeInStatusItem];
    id v81 = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
    [v15 setItems:v17];

    id v18 = [(HUStatusAndNotificationsItemManager *)self homeStatusVisibleObject];
    LODWORD(v17) = objc_msgSend(v18, "hf_isForcedVisibleInHomeStatus");

    if (v17) {
      v19 = @"HUStatusAndNotificationsAlwaysIncludedInStatusFooter";
    }
    else {
      v19 = @"HUStatusAndNotificationsIncludeInStatusFooter";
    }
    id v20 = _HULocalizedStringWithDefaultValue(v19, v19, 1);
    [v15 setFooterTitle:v20];

    [v5 addObject:v15];
  }
  if (v13)
  {
    id v21 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"Activity"];
    v22 = [(HUStatusAndNotificationsItemManager *)self allowActivityNotificationsItem];
    v80 = v22;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
    [v21 setItems:v23];

    if ([(HUStatusAndNotificationsItemManager *)self cameraProfileSupportsSmartNotifications])
    {
      id v24 = _HULocalizedStringWithDefaultValue(@"HUStatusAndNotificationsAllowNotificationsFooter", @"HUStatusAndNotificationsAllowNotificationsFooter", 1);
      [v21 setFooterTitle:v24];
    }
    objc_msgSend(v5, "addObject:", v21, v71);
  }
  if ([(HUStatusAndNotificationsItemManager *)self showsAudioNotificationSection])
  {
    __int16 v25 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUStatusAndNotificationsAllowAudioNotificationsSectionIdentifier"];
    id v26 = [(HUStatusAndNotificationsItemManager *)self allowAudioNotificationsItem];
    char v79 = v26;
    id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
    [v25 setItems:v27];

    [v5 addObject:v25];
  }
  if (([(HUStatusAndNotificationsItemManager *)self showsTriggerConditionSection] & v13) == 1
    && (objc_msgSend(v72, "hf_isHomePod")
     && [(HUStatusAndNotificationsItemManager *)self showsAudioNotificationSection]
     || (objc_msgSend(v72, "hf_isHomePod") & 1) == 0))
  {
    v28 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUStatusAndNotificationsConditionSectionIdentifier"];
    if ([(HUStatusAndNotificationsItemManager *)self showsCameraSmartNotificationSection])
    {
      id v29 = @"HUStatusAndNotificationCameraMotionHeader";
    }
    else
    {
      id v29 = @"HUStatusAndNotificationsConditionTitle";
    }
    id v30 = _HULocalizedStringWithDefaultValue(v29, v29, 1);
    [v28 setHeaderTitle:v30];

    uint64_t v31 = objc_opt_new();
    id v32 = [(HUStatusAndNotificationsItemManager *)self conditionModule];
    id v33 = [v32 buildSectionsWithDisplayedItems:v4];

    v34 = objc_msgSend(v33, "na_flatMap:", &__block_literal_global_64);
    [v31 addObjectsFromArray:v34];

    [v28 setItems:v31];
    [v5 addObject:v28];
  }
  if (([(HUStatusAndNotificationsItemManager *)self showsCameraSmartNotificationSection] & v13) == 1)
  {
    id v35 = [(HUStatusAndNotificationsItemManager *)self cameraSmartDetectionSettingsModule];
    id v36 = [v35 buildSectionsWithDisplayedItems:v4];

    [v5 addObjectsFromArray:v36];
  }
  if (([(HUStatusAndNotificationsItemManager *)self showsCameraStatusChangeSection] & v13) == 1)
  {
    v37 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"CameraStatusChange"];
    id v38 = [(HUStatusAndNotificationsItemManager *)self allowCameraStatusChangesItem];
    id v78 = v38;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
    [v37 setItems:v39];

    id v40 = _HULocalizedStringWithDefaultValue(@"HUStatusAndNotificationsCameraStatusChangesFooter", @"HUStatusAndNotificationsCameraStatusChangesFooter", 1);
    [v37 setFooterTitle:v40];

    [v5 addObject:v37];
  }
  objc_opt_class();
  v41 = [(HUStatusAndNotificationsItemManager *)self serviceItem];
  if (objc_opt_isKindOfClass()) {
    v42 = v41;
  }
  else {
    v42 = 0;
  }
  id v43 = v42;

  v44 = [v43 profile];

  LODWORD(v43) = objc_msgSend(v44, "hf_supportsReachabilityNotifications") & v13;
  if (v43 == 1)
  {
    uint64_t v45 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"CameraReachabilityStatusChange"];
    v46 = [(HUStatusAndNotificationsItemManager *)self allowCameraReachabilityChangeNotificationsItem];
    id v77 = v46;
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
    [v45 setItems:v47];

    v48 = _HULocalizedStringWithDefaultValue(@"HUStatusAndNotificationsCameraReachabilityChangesFooter", @"HUStatusAndNotificationsCameraReachabilityChangesFooter", 1);
    [v45 setFooterTitle:v48];

    [v5 addObject:v45];
  }
  if (([(HUStatusAndNotificationsItemManager *)self showsCameraSnapshotSection] & v13) == 1)
  {
    v49 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUStatusAndNotificationsCameraSnapshotSectionIdentifier"];
    objc_super v50 = [(HUStatusAndNotificationsItemManager *)self allowCameraSnapshotsItem];
    v76 = v50;
    v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
    [v49 setItems:v51];

    id v52 = _HULocalizedStringWithDefaultValue(@"HUStatusAndNotificationCameraSnapshotFooter", @"HUStatusAndNotificationCameraSnapshotFooter", 1);
    [v49 setFooterTitle:v52];

    [v5 addObject:v49];
  }
  if (([(HUStatusAndNotificationsItemManager *)self hasDoorbellCamera] & v13) == 1)
  {
    __int16 v53 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"Doorbell"];
    v54 = [(HUStatusAndNotificationsItemManager *)self allowDoorbellNotificationsItem];
    id v75 = v54;
    uint64_t v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
    [v53 setItems:v55];

    v56 = _HULocalizedStringWithDefaultValue(@"HUStatusAndNotificationsDoorbellNotificationsFooter", @"HUStatusAndNotificationsDoorbellNotificationsFooter", 1);
    [v53 setFooterTitle:v56];

    [v5 addObject:v53];
    v57 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"analogChimeSection"];
    v58 = [(HUStatusAndNotificationsItemManager *)self allowAnalogChimeNotificationItem];
    v74 = v58;
    v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
    [v57 setItems:v59];

    v60 = _HULocalizedStringWithDefaultValue(@"HUCameraDoorbellChimeMuteSwitchFooter", @"HUCameraDoorbellChimeMuteSwitchFooter", 1);
    [v57 setFooterTitle:v60];

    [v5 addObject:v57];
  }
  if ([(HUStatusAndNotificationsItemManager *)self showsDoorbellChimeSection])
  {
    v61 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUStatusAndNotificationsChimeOnHomePodSectionIdentifier"];
    v62 = [(HUStatusAndNotificationsItemManager *)self chimeOnAccessoriesListItem];
    v73 = v62;
    v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
    [v61 setItems:v63];

    v64 = [(HFItemManager *)self home];
    v65 = objc_msgSend(v64, "hf_allHomePodsOrStereoPairs");
    unint64_t v66 = [v65 count];

    if (v66 <= 1) {
      v67 = @"HUChimeOnAccessoriesFooter_Single";
    }
    else {
      v67 = @"HUChimeOnAccessoriesFooter_Multiple";
    }
    id v68 = _HULocalizedStringWithDefaultValue(v67, v67, 1);
    [v61 setFooterTitle:v68];

    [v5 addObject:v61];
  }
  id v69 = [MEMORY[0x1E4F69220] filterSections:v5 toDisplayedItems:v4];

  return v69;
}

uint64_t __72__HUStatusAndNotificationsItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 items];
}

- (id)updateAllowNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(HUStatusAndNotificationsItemManager *)self notificationSettings];
  id v6 = (void *)[v5 mutableCopy];

  [v6 setNotificationsEnabled:v3];
  [v6 setDoorbellNotificationsEnabled:v3];
  [v6 setSmartDetectionNotificationsEnabled:v3];
  [v6 setMotionNotificationsEnabled:v3];
  char v7 = [(HUStatusAndNotificationsItemManager *)self _updateNotificationSettings:v6];

  return v7;
}

- (id)updateAllowAudioNotifications:(BOOL)a3
{
  BOOL v30 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v5 = [(HUStatusAndNotificationsItemManager *)self _sourceItemAsMediaAccessoryItem];
  id v6 = [v5 mediaProfileContainer];
  char v7 = [v6 accessories];

  int v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v39 = [v5 isHomePodMediaSystem];
    *(_WORD *)&v39[4] = 2112;
    *(void *)&v39[6] = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Is this a HomePod media system? %{BOOL}d Updating audio analysis notification settings for accessories: %@", buf, 0x12u);
  }
  id v29 = v5;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  BOOL v10 = v30;
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v32 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v32) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(id *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v14 = &unk_1F1AD8EB0;
        if (objc_msgSend(v13, "conformsToProtocol:", v14, v29)) {
          char v15 = v13;
        }
        else {
          char v15 = 0;
        }
        id v16 = v15;

        v17 = objc_msgSend(v16, "hf_userNotificationSettings");
        id v18 = (void *)[v17 mutableCopy];

        [v18 setNotificationsEnabled:v10];
        if (-[HUStatusAndNotificationsItemManager _isAudioAnalysisSupportedDevice](self, "_isAudioAnalysisSupportedDevice")&& [v18 areNotificationsEnabled])
        {
          v19 = (void *)MEMORY[0x1E4F69078];
          [v18 notificationCondition];
          v21 = id v20 = v4;
          v22 = [v19 conditionCollectionForPredicate:v21];

          id v23 = [(HUStatusAndNotificationsItemManager *)self _updateConditionCollectionForAudioAnalysisNotification:v22];
          id v24 = [v23 predicate];
          [v18 setNotificationCondition:v24];

          id v4 = v20;
          BOOL v10 = v30;
        }
        __int16 v25 = HFLogForCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v39 = v13;
          _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "Updating audio analysis notification settings for accessory: %@", buf, 0xCu);
        }

        id v26 = [(HUStatusAndNotificationsItemManager *)self _updateNotificationSettings:v18 notificationSettingsProvider:v16];
        objc_msgSend(v4, "na_safeAddObject:", v26);
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v11);
  }

  id v27 = [MEMORY[0x1E4F7A0D8] chainFutures:v4];

  return v27;
}

- (id)updateAllowMotionNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(HUStatusAndNotificationsItemManager *)self notificationSettings];
  id v6 = (void *)[v5 mutableCopy];

  [v6 setMotionNotificationsEnabled:v3];
  objc_msgSend(v6, "setNotificationsEnabled:", objc_msgSend(v6, "areDoorbellNotificationsEnabled") | v3);
  char v7 = [(HUStatusAndNotificationsItemManager *)self _updateNotificationSettings:v6];

  return v7;
}

- (id)updateChimeOnAccessory:(BOOL)a3
{
  char v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(HFItemManager *)self home];
  char v7 = objc_msgSend(v6, "hf_allHomePodsOrStereoPairs");

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  char v15 = __62__HUStatusAndNotificationsItemManager_updateChimeOnAccessory___block_invoke;
  id v16 = &unk_1E6388D88;
  id v17 = v5;
  BOOL v18 = a3;
  id v8 = v5;
  objc_msgSend(v7, "na_each:", &v13);
  uint64_t v9 = (void *)MEMORY[0x1E4F7A0D8];
  BOOL v10 = objc_msgSend(MEMORY[0x1E4F7A0F0], "mainThreadScheduler", v13, v14, v15, v16);
  uint64_t v11 = [v9 combineAllFutures:v8 ignoringErrors:0 scheduler:v10];

  return v11;
}

void __62__HUStatusAndNotificationsItemManager_updateChimeOnAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "hf_settingsValueManager");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 settings];

  char v5 = objc_msgSend(v4, "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E4F68560]);

  id v6 = *(void **)(a1 + 32);
  char v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  id v8 = [v9 changeValueForSetting:v5 toValue:v7];
  [v6 addObject:v8];
}

- (id)updateAllowDoorbellNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(HUStatusAndNotificationsItemManager *)self notificationSettings];
  id v6 = (void *)[v5 mutableCopy];

  [v6 setDoorbellNotificationsEnabled:v3];
  objc_opt_class();
  char v7 = [(HUStatusAndNotificationsItemManager *)self serviceItem];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  BOOL v10 = [v9 profile];

  LODWORD(v9) = objc_msgSend(v10, "hf_supportsRecordingEvents");
  if (!v9)
  {
    if (!v3)
    {
      uint64_t v11 = [v6 areMotionNotificationsEnabled];
      goto LABEL_10;
    }
LABEL_8:
    uint64_t v12 = 1;
    goto LABEL_11;
  }
  if (v3) {
    goto LABEL_8;
  }
  uint64_t v11 = [v6 areSmartDetectionNotificationsEnabled];
LABEL_10:
  uint64_t v12 = v11;
LABEL_11:
  [v6 setNotificationsEnabled:v12];
  uint64_t v13 = [(HUStatusAndNotificationsItemManager *)self _updateNotificationSettings:v6];

  return v13;
}

- (id)updateAllowChimeAnalogNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(HUStatusAndNotificationsItemManager *)self notificationSettings];
  id v6 = (void *)[v5 mutableCopy];

  [v6 setDoorbellNotificationsEnabled:v3];
  objc_opt_class();
  char v7 = [(HUStatusAndNotificationsItemManager *)self serviceItem];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  BOOL v10 = [v9 profile];

  objc_msgSend(v10, "hf_updateDoorbellChime:", v3);
  uint64_t v11 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v11;
}

- (id)updateAllowSnapshotsInNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUStatusAndNotificationsItemManager *)self allowCameraSnapshotsItem];
  char v5 = [v4 updateUserSettingsWithValue:v3];

  return v5;
}

- (id)updateAllowSmartActivityNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(HUStatusAndNotificationsItemManager *)self notificationSettings];
  id v6 = (void *)[v5 mutableCopy];

  [v6 setSmartDetectionNotificationsEnabled:v3];
  [v6 setMotionNotificationsEnabled:v3];
  if ([v6 areDoorbellNotificationsEnabled]) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = [v6 areSmartDetectionNotificationsEnabled];
  }
  [v6 setNotificationsEnabled:v7];
  id v8 = [(HUStatusAndNotificationsItemManager *)self _updateNotificationSettings:v6];

  return v8;
}

- (id)updateAllowCameraStatusChangeNotifications:(BOOL)a3
{
  objc_opt_class();
  char v5 = [(HUStatusAndNotificationsItemManager *)self serviceItem];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [v7 profile];
    char v9 = objc_msgSend(v8, "hf_supportsRecordingEvents");

    BOOL v10 = (void *)MEMORY[0x1E4F7A0D8];
    if (v9)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __82__HUStatusAndNotificationsItemManager_updateAllowCameraStatusChangeNotifications___block_invoke;
      v15[3] = &unk_1E6388DB0;
      id v16 = v7;
      BOOL v17 = a3;
      uint64_t v11 = [v10 futureWithBlock:v15];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
    uint64_t v11 = [v12 futureWithError:v13];
  }

  return v11;
}

void __82__HUStatusAndNotificationsItemManager_updateAllowCameraStatusChangeNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) profile];
  char v5 = [v4 userSettings];
  uint64_t v6 = *(unsigned __int8 *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__HUStatusAndNotificationsItemManager_updateAllowCameraStatusChangeNotifications___block_invoke_2;
  v8[3] = &unk_1E6386708;
  id v9 = v3;
  id v7 = v3;
  [v5 updateAccessModeChangeNotificationEnabled:v6 completionHandler:v8];
}

uint64_t __82__HUStatusAndNotificationsItemManager_updateAllowCameraStatusChangeNotifications___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithNoResult];
  }
}

- (id)updateAllowCameraReachabilityStatusChangeNotifications:(BOOL)a3
{
  objc_opt_class();
  char v5 = [(HUStatusAndNotificationsItemManager *)self serviceItem];
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E4F7A0D8];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __94__HUStatusAndNotificationsItemManager_updateAllowCameraReachabilityStatusChangeNotifications___block_invoke;
    v13[3] = &unk_1E6388DB0;
    id v14 = v7;
    BOOL v15 = a3;
    id v9 = [v8 futureWithBlock:v13];
  }
  else
  {
    BOOL v10 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
    id v9 = [v10 futureWithError:v11];
  }

  return v9;
}

void __94__HUStatusAndNotificationsItemManager_updateAllowCameraReachabilityStatusChangeNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) profile];
  char v5 = [v4 userSettings];
  uint64_t v6 = *(unsigned __int8 *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__HUStatusAndNotificationsItemManager_updateAllowCameraReachabilityStatusChangeNotifications___block_invoke_2;
  v8[3] = &unk_1E6386708;
  id v9 = v3;
  id v7 = v3;
  [v5 updateReachabilityEventNotificationEnabled:v6 completionHandler:v8];

  [v7 finishWithNoResult];
}

uint64_t __94__HUStatusAndNotificationsItemManager_updateAllowCameraReachabilityStatusChangeNotifications___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithNoResult];
  }
}

- (id)updateNotificationCondition:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  char v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    *(void *)objc_super v50 = self;
    *(_WORD *)&v50[8] = 2112;
    *(void *)&v50[10] = v6;
    __int16 v51 = 2112;
    id v52 = v40;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating notification condition to %@", buf, 0x20u);
  }
  if ([(HUStatusAndNotificationsItemManager *)self showsAudioNotificationSection])
  {
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = [(HUStatusAndNotificationsItemManager *)self _sourceItemAsMediaAccessoryItem];
    id v8 = [v7 mediaProfileContainer];
    id v9 = [v8 accessories];

    BOOL v10 = HFLogForCategory();
    uint64_t v11 = v40;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [v7 isHomePodMediaSystem];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)objc_super v50 = v12;
      *(_WORD *)&v50[4] = 2112;
      *(void *)&v50[6] = v9;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Is this a HomePod media system? %{BOOL}d Updating audio analysis notification settings for accessories: %@", buf, 0x12u);
    }
    v39 = v7;

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v9;
    uint64_t v13 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v45;
      id v16 = &selRef__displayLinkUpdated_;
      do
      {
        uint64_t v17 = 0;
        uint64_t v42 = v14;
        do
        {
          if (*(void *)v45 != v15) {
            objc_enumerationMutation(obj);
          }
          BOOL v18 = v16[189];
          id v19 = *(id *)(*((void *)&v44 + 1) + 8 * v17);
          id v20 = v18;
          if ([v19 conformsToProtocol:v20]) {
            id v21 = v19;
          }
          else {
            id v21 = 0;
          }
          id v22 = v21;

          id v23 = objc_msgSend(v22, "hf_userNotificationSettings");
          id v24 = (void *)[v23 mutableCopy];

          if ([v24 areNotificationsEnabled])
          {
            uint64_t v25 = v15;
            id v26 = [MEMORY[0x1E4F69078] conditionCollectionForPredicate:v11];
            id v27 = self;
            v28 = [(HUStatusAndNotificationsItemManager *)self _updateConditionCollectionForAudioAnalysisNotification:v26];
            id v29 = [v28 predicate];
            [v24 setNotificationCondition:v29];

            BOOL v30 = HFLogForCategory();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v31 = [v24 notificationCondition];
              *(_DWORD *)buf = 138412546;
              *(void *)objc_super v50 = v19;
              *(_WORD *)&v50[8] = 2112;
              *(void *)&v50[10] = v31;
              _os_log_impl(&dword_1BE345000, v30, OS_LOG_TYPE_DEFAULT, "Updating audio analysis notification settings for accessory: %@ with condition %@", buf, 0x16u);

              uint64_t v11 = v40;
            }

            uint64_t v32 = [(HUStatusAndNotificationsItemManager *)v27 _updateNotificationSettings:v24 notificationSettingsProvider:v22];
            objc_msgSend(v41, "na_safeAddObject:", v32);

            self = v27;
            uint64_t v15 = v25;
            id v16 = &selRef__displayLinkUpdated_;
            uint64_t v14 = v42;
          }

          ++v17;
        }
        while (v14 != v17);
        uint64_t v14 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v14);
    }

    long long v33 = v41;
    long long v34 = [MEMORY[0x1E4F7A0D8] chainFutures:v41];
  }
  else
  {
    long long v35 = [(HUStatusAndNotificationsItemManager *)self notificationSettings];
    long long v33 = (void *)[v35 mutableCopy];

    [v33 setNotificationCondition:v40];
    long long v36 = [(HUStatusAndNotificationsItemManager *)self notificationSettings];
    v37 = [v36 smartCameraNotificationCondition];
    [v33 setSmartCameraNotificationCondition:v37];

    uint64_t v11 = v40;
    long long v34 = [(HUStatusAndNotificationsItemManager *)self _updateNotificationSettings:v33];
  }

  return v34;
}

- (id)updateCameraSmartNotificationCondition:(id)a3
{
  id v4 = a3;
  char v5 = [(HUStatusAndNotificationsItemManager *)self notificationSettings];
  uint64_t v6 = (void *)[v5 mutableCopy];

  id v7 = [(HUStatusAndNotificationsItemManager *)self notificationSettings];
  id v8 = [v7 notificationCondition];
  [v6 setNotificationCondition:v8];

  [v6 setSmartCameraNotificationCondition:v4];
  id v9 = [(HUStatusAndNotificationsItemManager *)self _updateNotificationSettings:v6];

  return v9;
}

- (id)_sourceItemAsMediaAccessoryItem
{
  objc_opt_class();
  id v3 = [(HUStatusAndNotificationsItemManager *)self serviceItem];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)_isAudioAnalysisSupportedDevice
{
  v2 = (void *)MEMORY[0x1E4F692A8];
  id v3 = [(HUStatusAndNotificationsItemManager *)self _sourceItemAsMediaAccessoryItem];
  id v4 = [v3 mediaProfileContainer];
  LOBYTE(v2) = [v2 isAudioAnalysisSupportedDevice:v4];

  return (char)v2;
}

- (id)_updateConditionCollectionForAudioAnalysisNotification:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Condition collection is nil. Cannot update.", v11, 2u);
    }
  }
  id v5 = [v3 conditions];
  uint64_t v6 = objc_msgSend(v5, "na_filter:", &__block_literal_global_192_0);

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F69078]) initWithConditions:v6];
  id v8 = [MEMORY[0x1E4F2E678] predicateForAudioAnalysisOptions:3];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F68F18]) initWithPredicate:v8];
  [v7 addCondition:v9];

  return v7;
}

BOOL __94__HUStatusAndNotificationsItemManager__updateConditionCollectionForAudioAnalysisNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (id)_updateNotificationSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(HUStatusAndNotificationsItemManager *)self notificationSettingsProvider];
  uint64_t v6 = [(HUStatusAndNotificationsItemManager *)self _updateNotificationSettings:v4 notificationSettingsProvider:v5];

  return v6;
}

- (id)_updateNotificationSettings:(id)a3 notificationSettingsProvider:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Updating notification settings to: %@ for object: %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  BOOL v10 = objc_msgSend(v8, "hf_updateUserNotificationSettings:", v7);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __96__HUStatusAndNotificationsItemManager__updateNotificationSettings_notificationSettingsProvider___block_invoke;
  uint64_t v17 = &unk_1E6388DF8;
  objc_copyWeak(v18, (id *)buf);
  v18[1] = (id)a2;
  uint64_t v11 = [v10 addCompletionBlock:&v14];
  int v12 = objc_msgSend(v11, "addFailureBlock:", &__block_literal_global_197, v14, v15, v16, v17);

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);

  return v12;
}

void __96__HUStatusAndNotificationsItemManager__updateNotificationSettings_notificationSettingsProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)MEMORY[0x1E4F1CA80];
  id v3 = [WeakRetained allowNotificationsItem];
  id v4 = [WeakRetained allowDoorbellNotificationsItem];
  id v5 = [WeakRetained allowActivityNotificationsItem];
  uint64_t v6 = [WeakRetained allowCameraSnapshotsItem];
  id v7 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, 0);

  id v8 = [WeakRetained conditionModule];

  if (v8)
  {
    id v9 = [WeakRetained conditionModule];
    BOOL v10 = [v9 allItems];
    [v7 unionSet:v10];
  }
  uint64_t v11 = [WeakRetained cameraSmartDetectionSettingsModule];

  if (v11)
  {
    int v12 = [WeakRetained cameraSmartDetectionSettingsModule];
    uint64_t v13 = [v12 allItems];
    [v7 unionSet:v13];
  }
  uint64_t v14 = [WeakRetained audioAnalysisDetectionSettingsModule];

  if (v14)
  {
    uint64_t v15 = [WeakRetained audioAnalysisDetectionSettingsModule];
    id v16 = [v15 allItems];
    [v7 unionSet:v16];
  }
  id v17 = (id)[WeakRetained updateResultsForItems:v7 senderSelector:*(void *)(a1 + 40)];
}

void __96__HUStatusAndNotificationsItemManager__updateNotificationSettings_notificationSettingsProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 logError:v3 operationDescription:*MEMORY[0x1E4F68788]];
}

- (HFUserNotificationServiceSettingsProviding)notificationSettingsProvider
{
  id v3 = [(HUStatusAndNotificationsItemManager *)self _sourceItemAsMediaAccessoryItem];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 accessories];
    uint64_t v6 = [v5 anyObject];

    id v7 = v6;
    if ([v7 conformsToProtocol:&unk_1F1AD8EB0]) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v7;
  }
  else
  {
    id v9 = [(HUStatusAndNotificationsItemManager *)self serviceItem];
    id v7 = [v9 homeKitObject];
    if ([v7 conformsToProtocol:&unk_1F1AD8EB0]) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  id v10 = v8;

  return (HFUserNotificationServiceSettingsProviding *)v10;
}

- (HFUserNotificationServiceSettings)notificationSettings
{
  id v2 = [(HUStatusAndNotificationsItemManager *)self notificationSettingsProvider];
  id v3 = objc_msgSend(v2, "hf_userNotificationSettings");

  return (HFUserNotificationServiceSettings *)v3;
}

- (id)homeStatusVisibleObject
{
  id v2 = [(HUStatusAndNotificationsItemManager *)self serviceItem];
  id v3 = [v2 homeKitObject];
  if ([v3 conformsToProtocol:&unk_1F1ABACC0]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)_homeFuture
{
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  id v3 = [(HUStatusAndNotificationsItemManager *)self overrideHome];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

- (BOOL)showStatusSection
{
  return self->_showStatusSection;
}

- (BOOL)showsForServiceDetails
{
  return self->_showsForServiceDetails;
}

- (void)setShowsForServiceDetails:(BOOL)a3
{
  self->_showsForServiceDetails = a3;
}

- (HFStaticItem)includeInStatusItem
{
  return self->_includeInStatusItem;
}

- (void)setIncludeInStatusItem:(id)a3
{
}

- (HFStaticItem)allowNotificationsItem
{
  return self->_allowNotificationsItem;
}

- (void)setAllowNotificationsItem:(id)a3
{
}

- (HFStaticItem)allowMotionNotificationsItem
{
  return self->_allowMotionNotificationsItem;
}

- (void)setAllowMotionNotificationsItem:(id)a3
{
}

- (HUServiceDetailsCameraAllowSnapshotsItem)allowCameraSnapshotsItem
{
  return self->_allowCameraSnapshotsItem;
}

- (void)setAllowCameraSnapshotsItem:(id)a3
{
}

- (HUChimeOnHomePodSingleItem)chimeOnHomePodSingleItem
{
  return self->_chimeOnHomePodSingleItem;
}

- (HUChimeOnAccessoriesListItem)chimeOnAccessoriesListItem
{
  return self->_chimeOnAccessoriesListItem;
}

- (void)setChimeOnAccessoriesListItem:(id)a3
{
}

- (HFStaticItem)allowDoorbellNotificationsItem
{
  return self->_allowDoorbellNotificationsItem;
}

- (void)setAllowDoorbellNotificationsItem:(id)a3
{
}

- (HFStaticItem)allowAnalogChimeNotificationItem
{
  return self->_allowAnalogChimeNotificationItem;
}

- (void)setAllowAnalogChimeNotificationItem:(id)a3
{
}

- (HFStaticItem)allowActivityNotificationsItem
{
  return self->_allowActivityNotificationsItem;
}

- (void)setAllowActivityNotificationsItem:(id)a3
{
}

- (HFStaticItem)allowAudioNotificationsItem
{
  return self->_allowAudioNotificationsItem;
}

- (void)setAllowAudioNotificationsItem:(id)a3
{
}

- (HFStaticItem)allowCameraStatusChangesItem
{
  return self->_allowCameraStatusChangesItem;
}

- (void)setAllowCameraStatusChangesItem:(id)a3
{
}

- (HFStaticItem)allowCameraReachabilityChangeNotificationsItem
{
  return self->_allowCameraReachabilityChangeNotificationsItem;
}

- (void)setAllowCameraReachabilityChangeNotificationsItem:(id)a3
{
}

- (HFServiceLikeItem)serviceItem
{
  return self->_serviceItem;
}

- (HUTriggerConditionEditorItemModule)conditionModule
{
  return self->_conditionModule;
}

- (HUCameraSmartDetectionSettingsModule)cameraSmartDetectionSettingsModule
{
  return self->_cameraSmartDetectionSettingsModule;
}

- (void)setServiceItemBelongsToCamera:(BOOL)a3
{
  self->_serviceItemBelongsToCamera = a3;
}

- (HUAudioAnalysisDetectionSettingsModule)audioAnalysisDetectionSettingsModule
{
  return self->_audioAnalysisDetectionSettingsModule;
}

- (void)setShowsDoorbellChimeSection:(BOOL)a3
{
  self->_showsDoorbellChimeSection = a3;
}

- (void)setShowsCameraSnapshotSection:(BOOL)a3
{
  self->_showsCameraSnapshotSection = a3;
}

- (void)setShowsCameraSmartNotificationSection:(BOOL)a3
{
  self->_showsCameraSmartNotificationSection = a3;
}

- (void)setShowsTriggerConditionSection:(BOOL)a3
{
  self->_showsTriggerConditionSection = a3;
}

- (void)setHasDoorbellCamera:(BOOL)a3
{
  self->_hasDoorbellCamera = a3;
}

- (void)setShowsSmartActivitySection:(BOOL)a3
{
  self->_showsSmartActivitySection = a3;
}

- (void)setShowsCameraStatusChangeSection:(BOOL)a3
{
  self->_showsCameraStatusChangeSection = a3;
}

- (void)setShowsAudioNotificationSection:(BOOL)a3
{
  self->_showsAudioNotificationSection = a3;
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_audioAnalysisDetectionSettingsModule, 0);
  objc_storeStrong((id *)&self->_cameraSmartDetectionSettingsModule, 0);
  objc_storeStrong((id *)&self->_conditionModule, 0);
  objc_storeStrong((id *)&self->_serviceItem, 0);
  objc_storeStrong((id *)&self->_allowCameraReachabilityChangeNotificationsItem, 0);
  objc_storeStrong((id *)&self->_allowCameraStatusChangesItem, 0);
  objc_storeStrong((id *)&self->_allowAudioNotificationsItem, 0);
  objc_storeStrong((id *)&self->_allowActivityNotificationsItem, 0);
  objc_storeStrong((id *)&self->_allowAnalogChimeNotificationItem, 0);
  objc_storeStrong((id *)&self->_allowDoorbellNotificationsItem, 0);
  objc_storeStrong((id *)&self->_chimeOnAccessoriesListItem, 0);
  objc_storeStrong((id *)&self->_chimeOnHomePodSingleItem, 0);
  objc_storeStrong((id *)&self->_allowCameraSnapshotsItem, 0);
  objc_storeStrong((id *)&self->_allowMotionNotificationsItem, 0);
  objc_storeStrong((id *)&self->_allowNotificationsItem, 0);

  objc_storeStrong((id *)&self->_includeInStatusItem, 0);
}

@end