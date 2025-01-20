@interface HUCameraSmartDetectionSettingsModule
+ (BOOL)isSpecificMotionSelectedForConfiguration:(id)a3 withCurrentConfiguration:(id)a4;
+ (id)_updatedCurrentSignificantEventConfiguration:(id)a3 withSelectedConfiguration:(id)a4 context:(unint64_t)a5;
+ (id)_updatedNotificationCurrentSignificantEventConfiguration:(id)a3 withSelectedConfiguration:(id)a4 cameraProfile:(id)a5;
+ (id)_updatedRecordingCurrentSignificantEventConfiguration:(id)a3 withSelectedConfiguration:(id)a4 cameraProfile:(id)a5;
+ (id)notificationConfiguration:(id)a3 forRecordingTriggers:(unint64_t)a4;
+ (id)notificationConfigurationForAClipIsRecorded;
+ (id)recordingConfiguration:(id)a3 withCurrentConfiguration:(id)a4 forProfile:(id)a5;
+ (id)selectedNotificationConfigurationForAClipIsRecorded;
+ (id)selectedNotificationConfigurationForAnyMotion;
+ (id)selectedNotificationConfigurationForSmartMotion;
+ (id)selectedRecordingConfigurationForAnyMotion;
+ (id)selectedRecordingConfigurationForSmartMotion;
+ (id)specificMotionNotificationConfigurationForCameraProfile:(id)a3;
+ (id)updateCurrentSignificantEventConfiguration:(id)a3 withSelectedConfiguration:(id)a4 cameraProfile:(id)a5 context:(unint64_t)a6;
- (BOOL)isItemHeader:(id)a3;
- (HFCameraSmartDetectionCondition)condition;
- (HFConditionCollection)conditionCollection;
- (HFItemProvider)motionDetectionOffOnItemProvider;
- (HFItemProvider)motionDetectionSettingsItemProvider;
- (HFStaticItem)aClipIsRecordedItem;
- (HFStaticItem)anyMotionDetectedItem;
- (HFStaticItem)specificMotionDetectedItem;
- (HUCameraSmartDetectionSettingsModule)initWithItemUpdater:(id)a3;
- (HUCameraSmartDetectionSettingsModule)initWithItemUpdater:(id)a3 cameraProfiles:(id)a4 conditionCollection:(id)a5 settingsContext:(unint64_t)a6;
- (NSSet)cameraProfiles;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)didSelectItem:(id)a3;
- (id)enableSmartMotion:(BOOL)a3 forItem:(id)a4;
- (id)itemProviders;
- (id)updateMotionDetectionSettingForItem:(id)a3;
- (id)updateSignificantEventConfiguration:(id)a3;
- (unint64_t)settingsContext;
- (void)setAClipIsRecordedItem:(id)a3;
- (void)setAnyMotionDetectedItem:(id)a3;
- (void)setCondition:(id)a3;
- (void)setSpecificMotionDetectedItem:(id)a3;
@end

@implementation HUCameraSmartDetectionSettingsModule

- (HUCameraSmartDetectionSettingsModule)initWithItemUpdater:(id)a3 cameraProfiles:(id)a4 conditionCollection:(id)a5 settingsContext:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (![v12 count])
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HUCameraSmartDetectionSettingsModule.m", 43, @"Invalid parameter not satisfying: %@", @"cameraProfiles.count > 0" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)HUCameraSmartDetectionSettingsModule;
  v14 = [(HFItemModule *)&v23 initWithItemUpdater:v11];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    cameraProfiles = v14->_cameraProfiles;
    v14->_cameraProfiles = (NSSet *)v15;

    v14->_settingsContext = a6;
    objc_storeStrong((id *)&v14->_conditionCollection, a5);
    v17 = [v13 conditions];
    v18 = objc_msgSend(v17, "na_map:", &__block_literal_global_238);
    uint64_t v19 = [v18 firstObject];
    condition = v14->_condition;
    v14->_condition = (HFCameraSmartDetectionCondition *)v19;
  }
  return v14;
}

id __111__HUCameraSmartDetectionSettingsModule_initWithItemUpdater_cameraProfiles_conditionCollection_settingsContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (HUCameraSmartDetectionSettingsModule)initWithItemUpdater:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_cameraProfiles_conditionCollection_settingsContext_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCameraSmartDetectionSettingsModule.m", 59, @"%s is unavailable; use %@ instead",
    "-[HUCameraSmartDetectionSettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)enableSmartMotion:(BOOL)a3 forItem:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [v6 latestResults];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
  int v9 = [v8 BOOLValue];

  if (v9) {
    BOOL v10 = !v4;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if ([(HUCameraSmartDetectionSettingsModule *)self settingsContext] == 1)
    {
      id v11 = +[HUCameraSmartDetectionSettingsModule selectedNotificationConfigurationForSmartMotion];
      id v12 = [(HUCameraSmartDetectionSettingsModule *)self aClipIsRecordedItem];
      int v13 = [v6 isEqual:v12];

      if (v13) {
        +[HUCameraSmartDetectionSettingsModule selectedNotificationConfigurationForAClipIsRecorded];
      }
      else {
      uint64_t v14 = +[HUCameraSmartDetectionSettingsModule selectedNotificationConfigurationForAnyMotion];
      }
    }
    else
    {
      id v11 = +[HUCameraSmartDetectionSettingsModule selectedRecordingConfigurationForSmartMotion];
      uint64_t v14 = +[HUCameraSmartDetectionSettingsModule selectedRecordingConfigurationForAnyMotion];
    }
    v16 = (void *)v14;
    if (v4) {
      v17 = v11;
    }
    else {
      v17 = (void *)v14;
    }
    uint64_t v15 = [(HUCameraSmartDetectionSettingsModule *)self updateSignificantEventConfiguration:v17];
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v15;
}

+ (id)selectedRecordingConfigurationForAnyMotion
{
  return (id)[MEMORY[0x1E4F68FD8] configurationWithEventTypes:1 personFamiliarityOptions:0];
}

+ (id)selectedRecordingConfigurationForSmartMotion
{
  return (id)[MEMORY[0x1E4F68FD8] defaultSmartMotionConfiguration];
}

+ (id)selectedNotificationConfigurationForAClipIsRecorded
{
  return (id)[MEMORY[0x1E4F68FD8] configurationWithEventTypes:1 personFamiliarityOptions:0];
}

+ (id)selectedNotificationConfigurationForAnyMotion
{
  return (id)[MEMORY[0x1E4F68FD8] configurationWithEventTypes:0 personFamiliarityOptions:0];
}

+ (id)selectedNotificationConfigurationForSmartMotion
{
  return (id)[MEMORY[0x1E4F68FD8] defaultSmartMotionConfiguration];
}

- (id)updateMotionDetectionSettingForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 latestResults];
  id v6 = [v5 objectForKeyedSubscript:@"HUCameraSettingResultKey"];
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8
    && (-[HUCameraSmartDetectionSettingsModule motionDetectionSettingsItemProvider](self, "motionDetectionSettingsItemProvider"), v9 = objc_claimAutoreleasedReturnValue(), [v9 items], v10 = objc_claimAutoreleasedReturnValue(), int v11 = objc_msgSend(v10, "containsObject:", v4), v10, v9, v11))
  {
    uint64_t v12 = [(HUCameraSmartDetectionSettingsModule *)self updateSignificantEventConfiguration:v8];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  int v13 = (void *)v12;

  return v13;
}

- (id)updateSignificantEventConfiguration:(id)a3
{
  id v5 = a3;
  objc_initWeak(&location, self);
  id v6 = [(HUCameraSmartDetectionSettingsModule *)self cameraProfiles];
  v7 = [v6 allObjects];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke;
  v16[3] = &unk_1E6390150;
  objc_copyWeak(&v18, &location);
  id v8 = v5;
  id v17 = v8;
  int v9 = objc_msgSend(v7, "na_map:", v16);

  BOOL v10 = (void *)MEMORY[0x1E4F7A0D8];
  int v11 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  uint64_t v12 = [v10 combineAllFutures:v9 ignoringErrors:1 scheduler:v11];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_3_32;
  v15[3] = &unk_1E63877D0;
  v15[4] = self;
  v15[5] = a2;
  int v13 = [v12 addCompletionBlock:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v13;
}

id __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F7A0D8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_2;
  v12[3] = &unk_1E6386CC0;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  id v13 = *(id *)(a1 + 32);
  id v5 = v3;
  id v14 = v5;
  id v6 = [v4 futureWithBlock:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_25;
  v10[3] = &unk_1E6387DC8;
  id v7 = v5;
  id v11 = v7;
  id v8 = [v6 addSuccessBlock:v10];

  objc_destroyWeak(&v15);

  return v8;
}

void __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (![WeakRetained settingsContext])
  {
    id v8 = (void *)MEMORY[0x1E4F68FD8];
    id v6 = [WeakRetained cameraProfiles];
    uint64_t v7 = [v8 configurationForCameraProfilesRecordingSettings:v6];
    goto LABEL_5;
  }
  if ([WeakRetained settingsContext] == 1)
  {
    id v5 = (void *)MEMORY[0x1E4F68FD8];
    id v6 = [WeakRetained cameraProfiles];
    uint64_t v7 = [v5 configurationForCameraProfilesNotificationSettings:v6];
LABEL_5:
    int v9 = (void *)v7;

    goto LABEL_7;
  }
  int v9 = 0;
LABEL_7:
  BOOL v10 = +[HUCameraSmartDetectionSettingsModule updateCurrentSignificantEventConfiguration:withSelectedConfiguration:cameraProfile:context:](HUCameraSmartDetectionSettingsModule, "updateCurrentSignificantEventConfiguration:withSelectedConfiguration:cameraProfile:context:", v9, *(void *)(a1 + 32), *(void *)(a1 + 40), [WeakRetained settingsContext]);
  if ([WeakRetained settingsContext])
  {
    if ([WeakRetained settingsContext] == 1)
    {
      id v11 = [v10 predicateRepresentation];
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F68FE0]) initWithPredicate:v11];
      id v13 = [WeakRetained conditionCollection];
      id v14 = [WeakRetained condition];
      [v13 removeCondition:v14];

      [WeakRetained setCondition:v12];
      id v15 = [WeakRetained conditionCollection];
      v16 = [WeakRetained condition];
      [v15 addCondition:v16];

      [v3 finishWithNoResult];
    }
  }
  else
  {
    id v17 = [*(id *)(a1 + 40) userSettings];
    uint64_t v18 = [v10 eventTypes];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_3;
    v19[3] = &unk_1E638C140;
    id v20 = v10;
    id v21 = *(id *)(a1 + 40);
    id v22 = v3;
    [v17 updateRecordingEventTriggers:v18 completionHandler:v19];
  }
}

void __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [*(id *)(a1 + 32) eventTypes];
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 134218498;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "Error updating smart motion recording eventTypes: %lu for camera: %@ (error: %@)", (uint8_t *)&v7, 0x20u);
    }

    [*(id *)(a1 + 48) finishWithError:v3];
  }
  else
  {
    [*(id *)(a1 + 48) finishWithNoResult];
  }
}

void __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_25(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_2_27;
  v3[3] = &unk_1E638CE18;
  id v4 = *(id *)(a1 + 32);
  [v2 dispatchCameraObserverMessage:v3 sender:0];
}

void __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_2_27(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 userSettings];
  [v3 cameraUserSettingsDidUpdate:v4];
}

void __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_3_32(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) itemUpdater];
  id v2 = (void *)MEMORY[0x1E4F69230];
  id v3 = [*(id *)(a1 + 32) itemProviders];
  id v4 = [v2 requestToReloadItemProviders:v3 senderSelector:*(void *)(a1 + 40)];
  id v5 = (id)[v6 performItemUpdateRequest:v4];
}

+ (id)updateCurrentSignificantEventConfiguration:(id)a3 withSelectedConfiguration:(id)a4 cameraProfile:(id)a5 context:(unint64_t)a6
{
  if (a6) {
    +[HUCameraSmartDetectionSettingsModule _updatedNotificationCurrentSignificantEventConfiguration:a3 withSelectedConfiguration:a4 cameraProfile:a5];
  }
  else {
  id v6 = +[HUCameraSmartDetectionSettingsModule _updatedRecordingCurrentSignificantEventConfiguration:a3 withSelectedConfiguration:a4 cameraProfile:a5];
  }

  return v6;
}

+ (id)_updatedRecordingCurrentSignificantEventConfiguration:(id)a3 withSelectedConfiguration:(id)a4 cameraProfile:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![v8 eventTypes])
  {
    uint64_t v10 = [v8 copy];
    goto LABEL_5;
  }
  if ([v8 eventTypes] == 1)
  {
    uint64_t v10 = [MEMORY[0x1E4F68FD8] defaultAnyMotionConfiguration];
LABEL_5:
    __int16 v11 = (void *)v10;
    goto LABEL_7;
  }
  id v12 = +[HUCameraSmartDetectionSettingsModule _updatedCurrentSignificantEventConfiguration:v7 withSelectedConfiguration:v8 context:0];
  __int16 v11 = +[HUCameraSmartDetectionSettingsModule recordingConfiguration:v12 withCurrentConfiguration:v7 forProfile:v9];

LABEL_7:

  return v11;
}

+ (id)_updatedNotificationCurrentSignificantEventConfiguration:(id)a3 withSelectedConfiguration:(id)a4 cameraProfile:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 eventTypes] == 1)
  {
    uint64_t v10 = [(id)objc_opt_class() notificationConfigurationForAClipIsRecorded];
  }
  else if ([v8 eventTypes])
  {
    if ([(id)objc_opt_class() isSpecificMotionSelectedForConfiguration:v8 withCurrentConfiguration:v7])objc_msgSend((id)objc_opt_class(), "specificMotionNotificationConfigurationForCameraProfile:", v9); {
    else
    }
    uint64_t v10 = +[HUCameraSmartDetectionSettingsModule _updatedCurrentSignificantEventConfiguration:v7 withSelectedConfiguration:v8 context:1];
  }
  else
  {
    uint64_t v10 = [v8 copy];
  }
  __int16 v11 = (void *)v10;

  return v11;
}

+ (id)_updatedCurrentSignificantEventConfiguration:(id)a3 withSelectedConfiguration:(id)a4 context:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[v8 copy];
  char v10 = [v8 containsConfiguration:v7];

  if (v10)
  {
    [v9 removeConfiguration:v7];
    if ([v9 eventTypes]) {
      goto LABEL_9;
    }
    if (a5) {
      [MEMORY[0x1E4F68FD8] defaultNotificationAnyMotionIsDetected];
    }
    else {
      [MEMORY[0x1E4F68FD8] defaultAnyMotionConfiguration];
    }
    v9 = id v12 = v9;
  }
  else
  {
    __int16 v11 = [MEMORY[0x1E4F68FD8] defaultAnyMotionConfiguration];
    id v12 = [MEMORY[0x1E4F68FD8] configurationWithEventTypes:1 personFamiliarityOptions:0];

    [v9 removeConfiguration:v12];
    [v9 addConfiguration:v7];
  }

LABEL_9:

  return v9;
}

+ (BOOL)isSpecificMotionSelectedForConfiguration:(id)a3 withCurrentConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 eventTypes];
  id v8 = [MEMORY[0x1E4F68FD8] defaultSmartMotionConfiguration];
  uint64_t v9 = [v8 eventTypes];

  if (v7 == v9)
  {
    uint64_t v10 = [v6 eventTypes];
    BOOL v11 = v10 != [v5 eventTypes];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (id)notificationConfigurationForAClipIsRecorded
{
  id v2 = [MEMORY[0x1E4F68FD8] defaultSmartMotionConfiguration];
  objc_msgSend(v2, "setEventTypes:", objc_msgSend(v2, "eventTypes") | 1);

  return v2;
}

+ (id)specificMotionNotificationConfigurationForCameraProfile:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F68FD8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 userSettings];

  objc_msgSend(v5, "setEventTypes:", objc_msgSend(v6, "recordingEventTriggers"));
  if ([v5 eventTypes]) {
    objc_msgSend(v5, "setEventTypes:", objc_msgSend(v5, "eventTypes") ^ 1);
  }

  return v5;
}

+ (id)recordingConfiguration:(id)a3 withCurrentConfiguration:(id)a4 forProfile:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend(a5, "hf_hasDoorbellService") & 1) == 0 && (objc_msgSend(v8, "eventTypes")) {
    objc_msgSend(v7, "setEventTypes:", objc_msgSend(v7, "eventTypes") ^ 0x10);
  }
  uint64_t v9 = (void *)[v7 copy];

  return v9;
}

+ (id)notificationConfiguration:(id)a3 forRecordingTriggers:(unint64_t)a4
{
  id v5 = a3;
  if ([v5 eventTypes] != 1 && objc_msgSend(v5, "eventTypes"))
  {
    if (([v5 eventTypes] & 1) == 0) {
      goto LABEL_6;
    }
    a4 = [v5 eventTypes] ^ 1;
  }
  [v5 setEventTypes:a4];
LABEL_6:
  id v6 = (void *)[v5 copy];

  return v6;
}

- (id)didSelectItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUCameraSmartDetectionSettingsModule *)self motionDetectionOffOnItemProvider];
  id v6 = [v5 items];
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    id v8 = [(HUCameraSmartDetectionSettingsModule *)self specificMotionDetectedItem];
    uint64_t v9 = -[HUCameraSmartDetectionSettingsModule enableSmartMotion:forItem:](self, "enableSmartMotion:forItem:", [v4 isEqual:v8], v4);
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v9;
}

- (id)itemProviders
{
  itemProviders = self->_itemProviders;
  if (itemProviders)
  {
    id v3 = itemProviders;
  }
  else
  {
    id v5 = [(HUCameraSmartDetectionSettingsModule *)self cameraProfiles];
    id v6 = [v5 anyObject];
    int v7 = [v6 accessory];
    id v8 = [v7 home];

    id v9 = objc_alloc(MEMORY[0x1E4F695C0]);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __53__HUCameraSmartDetectionSettingsModule_itemProviders__block_invoke;
    v37[3] = &unk_1E6386178;
    v37[4] = self;
    id v10 = v8;
    id v38 = v10;
    BOOL v11 = (void *)[v9 initWithResultsBlock:v37];
    [(HUCameraSmartDetectionSettingsModule *)self setAClipIsRecordedItem:v11];

    id v12 = objc_alloc(MEMORY[0x1E4F695C0]);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __53__HUCameraSmartDetectionSettingsModule_itemProviders__block_invoke_43;
    v35[3] = &unk_1E6386178;
    v35[4] = self;
    id v13 = v10;
    id v36 = v13;
    id v14 = (void *)[v12 initWithResultsBlock:v35];
    [(HUCameraSmartDetectionSettingsModule *)self setAnyMotionDetectedItem:v14];

    id v15 = objc_alloc(MEMORY[0x1E4F695C0]);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __53__HUCameraSmartDetectionSettingsModule_itemProviders__block_invoke_49;
    v33[3] = &unk_1E6386178;
    v33[4] = self;
    id v34 = v13;
    id v32 = v13;
    v16 = (void *)[v15 initWithResultsBlock:v33];
    [(HUCameraSmartDetectionSettingsModule *)self setSpecificMotionDetectedItem:v16];

    id v17 = objc_alloc(MEMORY[0x1E4F695C8]);
    uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = [(HUCameraSmartDetectionSettingsModule *)self anyMotionDetectedItem];
    id v20 = [(HUCameraSmartDetectionSettingsModule *)self aClipIsRecordedItem];
    id v21 = [(HUCameraSmartDetectionSettingsModule *)self specificMotionDetectedItem];
    id v22 = objc_msgSend(v18, "setWithObjects:", v19, v20, v21, 0);
    objc_super v23 = (HFItemProvider *)[v17 initWithItems:v22];
    motionDetectionOffOnItemProvider = self->_motionDetectionOffOnItemProvider;
    self->_motionDetectionOffOnItemProvider = v23;

    v25 = [HUCameraSmartDetectionSettingsItemProvider alloc];
    v26 = [(HUCameraSmartDetectionSettingsModule *)self cameraProfiles];
    v27 = [(HUCameraSmartDetectionSettingsItemProvider *)v25 initWithCameraProfiles:v26 settingsContext:[(HUCameraSmartDetectionSettingsModule *)self settingsContext]];
    motionDetectionSettingsItemProvider = self->_motionDetectionSettingsItemProvider;
    self->_motionDetectionSettingsItemProvider = v27;

    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", self->_motionDetectionOffOnItemProvider, self->_motionDetectionSettingsItemProvider, 0);
    v29 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v30 = self->_itemProviders;
    self->_itemProviders = v29;

    id v3 = self->_itemProviders;
  }

  return v3;
}

id __53__HUCameraSmartDetectionSettingsModule_itemProviders__block_invoke(uint64_t a1)
{
  v22[7] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) settingsContext])
  {
    if ([*(id *)(a1 + 32) settingsContext] != 1)
    {
      id v6 = 0;
      goto LABEL_7;
    }
    id v2 = (void *)MEMORY[0x1E4F68FD8];
    id v3 = [*(id *)(a1 + 32) cameraProfiles];
    uint64_t v4 = [v2 configurationForCameraProfilesNotificationSettings:v3];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F68FD8];
    id v3 = [*(id *)(a1 + 32) cameraProfiles];
    uint64_t v4 = [v5 configurationForCameraProfilesRecordingSettings:v3];
  }
  id v6 = (void *)v4;

LABEL_7:
  char v7 = [v6 eventTypes];
  if ([*(id *)(a1 + 32) settingsContext]
    || objc_msgSend(*(id *)(a1 + 40), "hf_currentUserIsAdministrator"))
  {
    if ([*(id *)(a1 + 32) settingsContext] == 1) {
      uint64_t v8 = [*(id *)(a1 + 40) areBulletinNotificationsSupported] ^ 1;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }
  v21[0] = *MEMORY[0x1E4F68B40];
  id v9 = [NSNumber numberWithBool:v7 & 1];
  v22[0] = v9;
  v21[1] = *MEMORY[0x1E4F68AB8];
  id v10 = _HULocalizedStringWithDefaultValue(@"HUCameraStreamingSettingAClipIsRecorded", @"HUCameraStreamingSettingAClipIsRecorded", 1);
  v22[1] = v10;
  v21[2] = *MEMORY[0x1E4F68908];
  BOOL v11 = [*(id *)(a1 + 32) cameraProfiles];
  uint64_t v12 = *MEMORY[0x1E4F68A70];
  uint64_t v13 = MEMORY[0x1E4F1CC28];
  v22[2] = v11;
  v22[3] = MEMORY[0x1E4F1CC28];
  uint64_t v14 = *MEMORY[0x1E4F68B48];
  v21[3] = v12;
  v21[4] = v14;
  v22[4] = &unk_1F19B4E98;
  v21[5] = *MEMORY[0x1E4F68A08];
  id v15 = [NSNumber numberWithBool:v8];
  v22[5] = v15;
  v21[6] = *MEMORY[0x1E4F68B10];
  uint64_t v16 = [*(id *)(a1 + 32) settingsContext];
  uint64_t v17 = MEMORY[0x1E4F1CC38];
  if (v16) {
    uint64_t v17 = v13;
  }
  v22[6] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:7];

  uint64_t v19 = [MEMORY[0x1E4F7A0D8] futureWithResult:v18];

  return v19;
}

id __53__HUCameraSmartDetectionSettingsModule_itemProviders__block_invoke_43(uint64_t a1)
{
  v20[6] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) settingsContext])
  {
    if ([*(id *)(a1 + 32) settingsContext] != 1)
    {
      id v6 = 0;
      goto LABEL_7;
    }
    id v2 = (void *)MEMORY[0x1E4F68FD8];
    id v3 = [*(id *)(a1 + 32) cameraProfiles];
    uint64_t v4 = [v2 configurationForCameraProfilesNotificationSettings:v3];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F68FD8];
    id v3 = [*(id *)(a1 + 32) cameraProfiles];
    uint64_t v4 = [v5 configurationForCameraProfilesRecordingSettings:v3];
  }
  id v6 = (void *)v4;

LABEL_7:
  uint64_t v7 = [*(id *)(a1 + 32) settingsContext];
  uint64_t v8 = [v6 eventTypes];
  if ([*(id *)(a1 + 32) settingsContext]
    || objc_msgSend(*(id *)(a1 + 40), "hf_currentUserIsAdministrator"))
  {
    if ([*(id *)(a1 + 32) settingsContext] == 1) {
      uint64_t v9 = [*(id *)(a1 + 40) areBulletinNotificationsSupported] ^ 1;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }
  BOOL v10 = v8 == 0;
  if (v7 != 1) {
    BOOL v10 = v8;
  }
  v19[0] = *MEMORY[0x1E4F68B40];
  BOOL v11 = [NSNumber numberWithBool:v10];
  v20[0] = v11;
  v19[1] = *MEMORY[0x1E4F68AB8];
  uint64_t v12 = _HULocalizedStringWithDefaultValue(@"HUCameraStreamingSettingAnyMotion", @"HUCameraStreamingSettingAnyMotion", 1);
  v20[1] = v12;
  v19[2] = *MEMORY[0x1E4F68908];
  uint64_t v13 = [*(id *)(a1 + 32) cameraProfiles];
  v20[2] = v13;
  v20[3] = MEMORY[0x1E4F1CC28];
  uint64_t v14 = *MEMORY[0x1E4F68B48];
  v19[3] = *MEMORY[0x1E4F68A70];
  void v19[4] = v14;
  v20[4] = &unk_1F19B4EB0;
  v19[5] = *MEMORY[0x1E4F68A08];
  id v15 = [NSNumber numberWithBool:v9];
  v20[5] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];

  uint64_t v17 = [MEMORY[0x1E4F7A0D8] futureWithResult:v16];

  return v17;
}

id __53__HUCameraSmartDetectionSettingsModule_itemProviders__block_invoke_49(uint64_t a1)
{
  v18[6] = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) settingsContext])
  {
    id v5 = (void *)MEMORY[0x1E4F68FD8];
    id v3 = [*(id *)(a1 + 32) cameraProfiles];
    uint64_t v4 = [v5 configurationForCameraProfilesRecordingSettings:v3];
    goto LABEL_5;
  }
  if ([*(id *)(a1 + 32) settingsContext] == 1)
  {
    id v2 = (void *)MEMORY[0x1E4F68FD8];
    id v3 = [*(id *)(a1 + 32) cameraProfiles];
    uint64_t v4 = [v2 configurationForCameraProfilesNotificationSettings:v3];
LABEL_5:
    id v6 = (void *)v4;

    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:
  BOOL v7 = ([v6 eventTypes] & 1) == 0 && objc_msgSend(v6, "eventTypes") != 0;
  if ([*(id *)(a1 + 32) settingsContext]
    || objc_msgSend(*(id *)(a1 + 40), "hf_currentUserIsAdministrator"))
  {
    if ([*(id *)(a1 + 32) settingsContext] == 1) {
      uint64_t v8 = [*(id *)(a1 + 40) areBulletinNotificationsSupported] ^ 1;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }
  v17[0] = *MEMORY[0x1E4F68B40];
  uint64_t v9 = [NSNumber numberWithBool:v7];
  v18[0] = v9;
  v17[1] = *MEMORY[0x1E4F68AB8];
  BOOL v10 = _HULocalizedStringWithDefaultValue(@"HUCameraStreamingSettingSpecificMotion", @"HUCameraStreamingSettingSpecificMotion", 1);
  v18[1] = v10;
  v17[2] = *MEMORY[0x1E4F68908];
  BOOL v11 = [*(id *)(a1 + 32) cameraProfiles];
  v18[2] = v11;
  v18[3] = MEMORY[0x1E4F1CC28];
  uint64_t v12 = *MEMORY[0x1E4F68B48];
  v17[3] = *MEMORY[0x1E4F68A70];
  v17[4] = v12;
  v18[4] = &unk_1F19B4EC8;
  v17[5] = *MEMORY[0x1E4F68A08];
  uint64_t v13 = [NSNumber numberWithBool:v8];
  v18[5] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:6];

  id v15 = [MEMORY[0x1E4F7A0D8] futureWithResult:v14];

  return v15;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  id v5 = [(HUCameraSmartDetectionSettingsModule *)self itemProviders];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __72__HUCameraSmartDetectionSettingsModule_buildSectionsWithDisplayedItems___block_invoke;
  v25[3] = &unk_1E638D3E8;
  id v6 = v4;
  id v26 = v6;
  BOOL v7 = objc_msgSend(v5, "na_flatMap:", v25);

  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUCameraSmartDetectionSettingsOnOffSectionIdentifier"];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __72__HUCameraSmartDetectionSettingsModule_buildSectionsWithDisplayedItems___block_invoke_2;
  v24[3] = &unk_1E6386108;
  v24[4] = self;
  BOOL v10 = objc_msgSend(v7, "na_filter:", v24);
  BOOL v11 = [v10 allObjects];
  uint64_t v12 = [MEMORY[0x1E4F69220] itemResultManualSortComparator];
  uint64_t v13 = [v11 sortedArrayUsingComparator:v12];
  [v9 setItems:v13];

  if ([(HUCameraSmartDetectionSettingsModule *)self settingsContext]) {
    uint64_t v14 = @"HUStatusAndNotificationCameraMotionHeader";
  }
  else {
    uint64_t v14 = @"HUCameraStreamingSettingsMotionDetectionSettings";
  }
  id v15 = _HULocalizedStringWithDefaultValue(v14, v14, 1);
  [v9 setHeaderTitle:v15];

  if ([(HUCameraSmartDetectionSettingsModule *)self settingsContext]
    && !_os_feature_enabled_impl())
  {
    uint64_t v16 = _HULocalizedStringWithDefaultValue(@"HUStatusAndNotificationsCameraSmartSectionFooter", @"HUStatusAndNotificationsCameraSmartSectionFooter", 1);
    [v9 setFooterTitle:v16];
  }
  else
  {
    [v9 setFooterTitle:&stru_1F18F92B8];
  }
  [v8 addObject:v9];
  uint64_t v17 = [(HUCameraSmartDetectionSettingsModule *)self motionDetectionSettingsItemProvider];
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUCameraSmartDetectionSettingsMotionDetectionSectionIdentifier"];
  uint64_t v19 = [v17 items];
  id v20 = [v19 allObjects];
  id v21 = [MEMORY[0x1E4F69220] itemResultManualSortComparator];
  id v22 = [v20 sortedArrayUsingComparator:v21];

  [v18 setItems:v22 filteringToDisplayedItems:v7];
  [v8 addObject:v18];

  return v8;
}

id __72__HUCameraSmartDetectionSettingsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 items];
  id v4 = objc_msgSend(v3, "na_setByIntersectingWithSet:", *(void *)(a1 + 32));

  return v4;
}

uint64_t __72__HUCameraSmartDetectionSettingsModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = a2;
  id v4 = [v2 items];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (BOOL)isItemHeader:(id)a3
{
  return 0;
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (HFConditionCollection)conditionCollection
{
  return self->_conditionCollection;
}

- (HFStaticItem)aClipIsRecordedItem
{
  return self->_aClipIsRecordedItem;
}

- (void)setAClipIsRecordedItem:(id)a3
{
}

- (HFStaticItem)anyMotionDetectedItem
{
  return self->_anyMotionDetectedItem;
}

- (void)setAnyMotionDetectedItem:(id)a3
{
}

- (HFStaticItem)specificMotionDetectedItem
{
  return self->_specificMotionDetectedItem;
}

- (void)setSpecificMotionDetectedItem:(id)a3
{
}

- (HFItemProvider)motionDetectionSettingsItemProvider
{
  return self->_motionDetectionSettingsItemProvider;
}

- (HFItemProvider)motionDetectionOffOnItemProvider
{
  return self->_motionDetectionOffOnItemProvider;
}

- (unint64_t)settingsContext
{
  return self->_settingsContext;
}

- (HFCameraSmartDetectionCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_motionDetectionOffOnItemProvider, 0);
  objc_storeStrong((id *)&self->_motionDetectionSettingsItemProvider, 0);
  objc_storeStrong((id *)&self->_specificMotionDetectedItem, 0);
  objc_storeStrong((id *)&self->_anyMotionDetectedItem, 0);
  objc_storeStrong((id *)&self->_aClipIsRecordedItem, 0);
  objc_storeStrong((id *)&self->_conditionCollection, 0);
  objc_storeStrong((id *)&self->_cameraProfiles, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end