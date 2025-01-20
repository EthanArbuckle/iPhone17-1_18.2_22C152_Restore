@interface HMDAccessorySettingsController
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)canUser:(id)a3 editConstraintsForSetting:(id)a4;
- (BOOL)canUser:(id)a3 editConstraintsForSettingWithKeyPath:(id)a4;
- (BOOL)didInitiateSettingsCreationForOlderSoftwareCounterpart;
- (BOOL)hasCreatedUnprocessedRootGroup;
- (BOOL)hasDependants;
- (BOOL)haveGroupWithUUID:(id)a3;
- (BOOL)isMigrationOwner;
- (BOOL)isProxy;
- (BOOL)isSettingOwner;
- (BOOL)shouldEncodeForNonAdminSharedUserForSetting:(id)a3;
- (BOOL)shouldEncodeForXPCTransportForSetting:(id)a3;
- (BOOL)shouldEncodeSetting:(id)a3 withCoder:(id)a4 forAccessorySettingGroup:(id)a5;
- (HMDAccessorySettingGroup)rootGroup;
- (HMDAccessorySettingsController)initWithCoder:(id)a3;
- (HMDAccessorySettingsController)initWithParentUUID:(id)a3 codingKey:(id)a4;
- (HMDAccessorySettingsController)initWithQueue:(id)a3 delegate:(id)a4 dataSource:(id)a5 parentUUID:(id)a6 codingKey:(id)a7 logEventSubmitter:(id)a8;
- (HMDAccessorySettingsController)initWithQueue:(id)a3 delegate:(id)a4 dataSource:(id)a5 parentUUID:(id)a6 codingKey:(id)a7 logEventSubmitter:(id)a8 settingOwner:(BOOL)a9 migrationOwner:(BOOL)a10 factory:(id)a11 rootGroup:(id)a12 notificationCenter:(id)a13;
- (HMDAccessorySettingsController)ownerController;
- (HMDAccessorySettingsControllerDataSource)dataSource;
- (HMDAccessorySettingsControllerDelegate)delegate;
- (HMDAccessorySettingsControllerDependencyFactory)factory;
- (HMDAccessorySettingsMessageHandler)messageHandler;
- (HMDBackingStoreObjectProtocol)transactionReceiver;
- (HMDHome)home;
- (HMDLegacyAccessorySettingsAdaptor)legacySettingsAdaptor;
- (HMFTimer)auditSettingsTimer;
- (HMFTimer)fixupSettingsTimer;
- (HMFTimer)languageChangeDebounceTimer;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSArray)childrenIdentifiers;
- (NSMapTable)groupsMap;
- (NSMapTable)settingsMap;
- (NSMutableArray)allChildrenIdentifiers;
- (NSMutableSet)constraintItemsMarkedForRemoval;
- (NSMutableSet)dependantControllers;
- (NSNotificationCenter)notificationCenter;
- (NSOperationQueue)constraintModifyOperationQueue;
- (NSString)codingKey;
- (NSString)description;
- (NSString)siriLanguage;
- (NSUUID)parentUUID;
- (OS_dispatch_queue)workQueue;
- (id)_keyPathsForSettings;
- (id)groupForKeyPath:(id)a3;
- (id)languageValueList;
- (id)logIdentifier;
- (id)mergeWithSettingsMetadata:(id)a3;
- (id)modelObjectsForSettings;
- (id)settingForKeyPath:(id)a3;
- (id)settingForUUID:(id)a3;
- (void)BOOLSettingForKeyPath:(id)a3 completion:(id)a4;
- (void)_cacheConstraintAdditions:(id)a3 removals:(id)a4 setting:(id)a5;
- (void)_createSettings;
- (void)_didAddGroup:(id)a3;
- (void)_didAddSetting:(id)a3;
- (void)_didRemoveGroup:(id)a3;
- (void)_didRemoveSetting:(id)a3;
- (void)_migrateSettingsWithCompletion:(id)a3;
- (void)_onMessageUpdateValue:(id)a3 settingKeyPath:(id)a4 senderVersion:(id)a5 senderProductClass:(int64_t)a6 completion:(id)a7;
- (void)_performDependantFixup;
- (void)_performSettingsAudit;
- (void)_reevaluateDependantSettings;
- (void)_removeDependant:(id)a3;
- (void)_removeManagedConfigurationProfile:(id)a3 completion:(id)a4;
- (void)_replaceConstraintsOnMessageToChildWithAdditions:(id)a3 removedChildConstraints:(id)a4 settingKeyPath:(id)a5 senderProductClass:(int64_t)a6 completion:(id)a7;
- (void)_replaceConstraintsOnSetting:(id)a3 additions:(id)a4 removals:(id)a5 completion:(id)a6;
- (void)_runUpdateTransactionWithValue:(id)a3 setting:(id)a4 completion:(id)a5;
- (void)_scheduleAuditWithReason:(unint64_t)a3;
- (void)_updateValue:(id)a3 forSetting:(id)a4 senderVersion:(id)a5 senderProductClass:(int64_t)a6 completion:(id)a7;
- (void)addDependant:(id)a3;
- (void)addedSettingModel:(id)a3 completion:(id)a4;
- (void)auditOnFirstFetch;
- (void)configureIsSettingOwner:(BOOL)a3 home:(id)a4;
- (void)configureIsSettingOwner:(BOOL)a3 home:(id)a4 legacySettingsAdaptor:(id)a5;
- (void)configureIsSettingOwner:(BOOL)a3 migrationOwner:(BOOL)a4 home:(id)a5 legacySettingsAdaptor:(id)a6;
- (void)decodeWithCoder:(id)a3;
- (void)didBecomeIndependantOwner;
- (void)didChangeDependantSettings:(id)a3 ownerSettingsKeyPaths:(id)a4;
- (void)didChangeSetting:(id)a3;
- (void)didDetectCounterpartUsesSoftwareVersionBasedMigrationOwner;
- (void)didUpdateSettingConstraints:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleLanguageChangeTimerFired;
- (void)handleRemovedGroupModel:(id)a3 completion:(id)a4;
- (void)handleRemovedSettingConstraintModel:(id)a3 completion:(id)a4;
- (void)handleRemovedSettingModel:(id)a3 completion:(id)a4;
- (void)handleUpdatedGroupModel:(id)a3 completion:(id)a4;
- (void)handleUpdatedSettingConstraintModel:(id)a3 completion:(id)a4;
- (void)handleUpdatedSettingModel:(id)a3 completion:(id)a4;
- (void)legacySettingsAdaptor:(id)a3 didLoadSettingKeyPath:(id)a4 selectedLanguageValue:(id)a5 availableLanguageList:(id)a6;
- (void)legacySettingsAdaptor:(id)a3 didUpdateSettingKeyPath:(id)a4 BOOLValue:(BOOL)a5;
- (void)legacySettingsAdaptor:(id)a3 didUpdateSettingKeyPath:(id)a4 numberValue:(id)a5;
- (void)legacySettingsAdaptor:(id)a3 didUpdateSettingKeyPath:(id)a4 selectedLanguageValue:(id)a5 availableLanguageList:(id)a6;
- (void)onMessageAddConstraint:(id)a3 keyPath:(id)a4 completion:(id)a5;
- (void)onMessageRemoveConstraint:(id)a3 keyPath:(id)a4 completion:(id)a5;
- (void)onMessageReplaceConstraintsWithAdditions:(id)a3 constraintIdsToRemove:(id)a4 keyPath:(id)a5 senderProductClass:(int64_t)a6 isRemote:(BOOL)a7 completion:(id)a8;
- (void)onMessageReplaceConstraintsWithAdditions:(id)a3 constraintIdsToRemove:(id)a4 settingIdentifier:(id)a5 senderProductClass:(int64_t)a6 isRemote:(BOOL)a7 completion:(id)a8;
- (void)onMessageUpdateConstraints:(id)a3 keyPath:(id)a4 completion:(id)a5;
- (void)onMessageUpdateValue:(id)a3 settingIdentifier:(id)a4 senderVersion:(id)a5 senderProductClass:(int64_t)a6 completion:(id)a7;
- (void)onMessageUpdateValue:(id)a3 settingKeyPath:(id)a4 senderVersion:(id)a5 senderProductClass:(int64_t)a6 completion:(id)a7;
- (void)owner:(id)a3 didUpdateSettings:(id)a4;
- (void)removeAllDependants;
- (void)removeDependant:(id)a3;
- (void)scheduleAuditWithReason:(unint64_t)a3 from:(id)a4;
- (void)scheduleDependantFixup;
- (void)setAuditSettingsTimer:(id)a3;
- (void)setConstraintItemsMarkedForRemoval:(id)a3;
- (void)setConstraintModifyOperationQueue:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDidInitiateSettingsCreationForOlderSoftwareCounterpart:(BOOL)a3;
- (void)setFixupSettingsTimer:(id)a3;
- (void)setGroupsMap:(id)a3;
- (void)setHasCreatedUnprocessedRootGroup:(BOOL)a3;
- (void)setIsMigrationOwner:(BOOL)a3;
- (void)setIsSettingOwner:(BOOL)a3;
- (void)setLanguageChangeDebounceTimer:(id)a3;
- (void)setLegacySettingsAdaptor:(id)a3;
- (void)setNestedGroupsDataSourcesWithGroup:(id)a3;
- (void)setOwnerController:(id)a3;
- (void)setRootGroup:(id)a3;
- (void)setSettingsMap:(id)a3;
- (void)settingsHierarchyDidChange;
- (void)timerDidFire:(id)a3;
- (void)updateSettingOwner:(BOOL)a3;
- (void)updatedSetting:(id)a3 model:(id)a4 completion:(id)a5;
@end

@implementation HMDAccessorySettingsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_parentUUID, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_legacySettingsAdaptor, 0);
  objc_storeStrong((id *)&self->_languageChangeDebounceTimer, 0);
  objc_storeStrong((id *)&self->_constraintModifyOperationQueue, 0);
  objc_storeStrong((id *)&self->_constraintItemsMarkedForRemoval, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_auditSettingsTimer, 0);
  objc_storeStrong((id *)&self->_fixupSettingsTimer, 0);
  objc_destroyWeak((id *)&self->_ownerController);
  objc_storeStrong((id *)&self->_dependantControllers, 0);
  objc_storeStrong((id *)&self->_codingKey, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allChildrenIdentifiers, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_transactionReceiver, 0);
  objc_storeStrong((id *)&self->_rootGroup, 0);
  objc_storeStrong((id *)&self->_settingsMap, 0);
  objc_storeStrong((id *)&self->_groupsMap, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 200, 1);
}

- (HMDAccessorySettingsMessageHandler)messageHandler
{
  return (HMDAccessorySettingsMessageHandler *)objc_getProperty(self, a2, 192, 1);
}

- (NSUUID)parentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 184, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDAccessorySettingsControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDAccessorySettingsControllerDataSource *)WeakRetained;
}

- (void)setLegacySettingsAdaptor:(id)a3
{
}

- (HMDLegacyAccessorySettingsAdaptor)legacySettingsAdaptor
{
  return self->_legacySettingsAdaptor;
}

- (void)setLanguageChangeDebounceTimer:(id)a3
{
}

- (HMFTimer)languageChangeDebounceTimer
{
  return self->_languageChangeDebounceTimer;
}

- (void)setConstraintModifyOperationQueue:(id)a3
{
}

- (NSOperationQueue)constraintModifyOperationQueue
{
  return self->_constraintModifyOperationQueue;
}

- (void)setDidInitiateSettingsCreationForOlderSoftwareCounterpart:(BOOL)a3
{
  self->_didInitiateSettingsCreationForOlderSoftwareCounterpart = a3;
}

- (BOOL)didInitiateSettingsCreationForOlderSoftwareCounterpart
{
  return self->_didInitiateSettingsCreationForOlderSoftwareCounterpart;
}

- (void)setConstraintItemsMarkedForRemoval:(id)a3
{
}

- (NSMutableSet)constraintItemsMarkedForRemoval
{
  return self->_constraintItemsMarkedForRemoval;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAuditSettingsTimer:(id)a3
{
}

- (HMFTimer)auditSettingsTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFixupSettingsTimer:(id)a3
{
}

- (HMFTimer)fixupSettingsTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 120, 1);
}

- (void)setIsMigrationOwner:(BOOL)a3
{
  self->_isMigrationOwner = a3;
}

- (BOOL)isMigrationOwner
{
  return self->_isMigrationOwner;
}

- (void)setOwnerController:(id)a3
{
}

- (HMDAccessorySettingsController)ownerController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ownerController);
  return (HMDAccessorySettingsController *)WeakRetained;
}

- (NSMutableSet)dependantControllers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)codingKey
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (HMDAccessorySettingsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDAccessorySettingsControllerDelegate *)WeakRetained;
}

- (NSMutableArray)allChildrenIdentifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (HMDAccessorySettingsControllerDependencyFactory)factory
{
  return (HMDAccessorySettingsControllerDependencyFactory *)objc_getProperty(self, a2, 64, 1);
}

- (HMDBackingStoreObjectProtocol)transactionReceiver
{
  return (HMDBackingStoreObjectProtocol *)objc_getProperty(self, a2, 56, 1);
}

- (id)languageValueList
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDAccessorySettingsController *)self rootGroup];
  v4 = [v3 settingWithKeyPath:@"root.siri.language"];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 constraints];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __51__HMDAccessorySettingsController_languageValueList__block_invoke;
      v19[3] = &unk_1E6A13CA8;
      v19[4] = self;
      v9 = objc_msgSend(v8, "na_map:", v19);
    }
    else
    {
      v14 = (void *)MEMORY[0x1D9452090]();
      v15 = self;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v21 = v17;
        __int16 v22 = 2112;
        v23 = v5;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to get language constraints from language setting: %@", buf, 0x16u);
      }
      v9 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v21 = v13;
      __int16 v22 = 2112;
      v23 = v3;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to get language setting from root group: %@", buf, 0x16u);
    }
    v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

id __51__HMDAccessorySettingsController_languageValueList__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = [v6 title];
    id v8 = [v7 componentsSeparatedByString:@","];
    if ((unint64_t)[v8 count] > 2)
    {
      v18 = [v8 objectAtIndex:0];
      v19 = [v8 objectAtIndex:1];
      v20 = [v8 objectAtIndex:2];
      v21 = 0;
      if ((unint64_t)[v8 count] >= 5)
      {
        v21 = [v8 objectAtIndex:4];
      }
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F2EAA8]) initWithInputLanguageCode:v18 outputVoiceLanguageCode:v19 outputVoiceGenderCode:v20 voiceName:v21];
    }
    else
    {
      v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = *(id *)(a1 + 32);
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = HMFGetLogIdentifier();
        int v23 = 138543618;
        uint64_t v24 = v12;
        __int16 v25 = 2112;
        id v26 = v7;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to get expected language code count from legacy language setting encoding: %@", (uint8_t *)&v23, 0x16u);
      }
      v13 = 0;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = *(id *)(a1 + 32);
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v23 = 138543618;
      uint64_t v24 = v17;
      __int16 v25 = 2112;
      id v26 = v3;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to get legacy langage setting encoding from language constaint: %@", (uint8_t *)&v23, 0x16u);
    }
    v13 = 0;
  }

  return v13;
}

- (void)legacySettingsAdaptor:(id)a3 didUpdateSettingKeyPath:(id)a4 selectedLanguageValue:(id)a5 availableLanguageList:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x1D9452090]();
  id v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    int v18 = 138544130;
    v19 = v17;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v13;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Did update setting from keyPath:%@ value = %@, availableLanguageList = %@", (uint8_t *)&v18, 0x2Au);
  }
}

- (void)legacySettingsAdaptor:(id)a3 didLoadSettingKeyPath:(id)a4 selectedLanguageValue:(id)a5 availableLanguageList:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x1D9452090]();
  id v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    int v18 = 138544130;
    v19 = v17;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v13;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Did update setting from keyPath:%@ value = %@, availableLanguageList = %@", (uint8_t *)&v18, 0x2Au);
  }
  [(HMDAccessorySettingsController *)v15 legacySettingsAdaptor:v10 didUpdateSettingKeyPath:v11 selectedLanguageValue:v12 availableLanguageList:v13];
}

- (void)legacySettingsAdaptor:(id)a3 didUpdateSettingKeyPath:(id)a4 numberValue:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDAccessorySettingsController *)self settingForKeyPath:v9];
  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 value];
    char v14 = HMFEqualObjects();

    if ((v14 & 1) == 0)
    {
      id v15 = (void *)MEMORY[0x1E4F2E5F8];
      v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "integerValue"));
      v17 = [v15 scaleDownNumberSettingValue:v16];

      if ([MEMORY[0x1E4F2E5F8] isKeyPathForTapAssistanceSelectionSettingType:v9])
      {
        uint64_t v18 = [v17 integerValue];
        v19 = [MEMORY[0x1E4F2E5F8] tapAssistanceSelectionItemWithIndex:v18];
        __int16 v20 = (void *)MEMORY[0x1D9452090]();
        id v21 = self;
        __int16 v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = HMFGetLogIdentifier();
          [v12 keyPath];
          __int16 v24 = v34 = v20;
          *(_DWORD *)buf = 138543874;
          v40 = v23;
          __int16 v41 = 2114;
          id v42 = v24;
          __int16 v43 = 2114;
          v44 = v19;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Updated setting keyPath: %{public}@ to %{public}@", buf, 0x20u);

          __int16 v20 = v34;
        }

        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __92__HMDAccessorySettingsController_legacySettingsAdaptor_didUpdateSettingKeyPath_numberValue___block_invoke;
        v37[3] = &unk_1E6A19380;
        v37[4] = v21;
        id v38 = v12;
        [(HMDAccessorySettingsController *)v21 _runUpdateTransactionWithValue:v19 setting:v38 completion:v37];
      }
      else
      {
        v29 = (void *)MEMORY[0x1D9452090]();
        v30 = self;
        v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = HMFGetLogIdentifier();
          v33 = [v12 keyPath];
          *(_DWORD *)buf = 138543874;
          v40 = v32;
          __int16 v41 = 2114;
          id v42 = v33;
          __int16 v43 = 2114;
          v44 = v17;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Updating setting keyPath: %{public}@ on notification from adaptor to %{public}@", buf, 0x20u);
        }
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __92__HMDAccessorySettingsController_legacySettingsAdaptor_didUpdateSettingKeyPath_numberValue___block_invoke_196;
        v35[3] = &unk_1E6A19380;
        v35[4] = v30;
        id v36 = v12;
        [(HMDAccessorySettingsController *)v30 _runUpdateTransactionWithValue:v17 setting:v36 completion:v35];
      }
    }
  }
  else
  {
    id v25 = (void *)MEMORY[0x1D9452090]();
    uint64_t v26 = self;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v40 = v28;
      __int16 v41 = 2114;
      id v42 = v9;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Did not find setting with keyPath: %{public}@ on update from fetched settings adaptor", buf, 0x16u);
    }
  }
}

void __92__HMDAccessorySettingsController_legacySettingsAdaptor_didUpdateSettingKeyPath_numberValue___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) keyPath];
    int v13 = 138543874;
    char v14 = v11;
    __int16 v15 = 2114;
    v16 = v12;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Updated setting keyPath: %{public}@ with error %@", (uint8_t *)&v13, 0x20u);
  }
}

void __92__HMDAccessorySettingsController_legacySettingsAdaptor_didUpdateSettingKeyPath_numberValue___block_invoke_196(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) keyPath];
    int v13 = 138543618;
    char v14 = v11;
    __int16 v15 = 2114;
    v16 = v12;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Updated setting keyPath: %{public}@", (uint8_t *)&v13, 0x16u);
  }
}

- (void)legacySettingsAdaptor:(id)a3 didUpdateSettingKeyPath:(id)a4 BOOLValue:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HMDAccessorySettingsController *)self settingForKeyPath:v9];
  if (v10)
  {
    id v11 = [NSNumber numberWithBool:v5];
    id v12 = [v10 value];
    char v13 = HMFEqualObjects();

    if ((v13 & 1) == 0)
    {
      char v14 = (void *)MEMORY[0x1D9452090]();
      __int16 v15 = self;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        id v18 = [v10 keyPath];
        *(_DWORD *)buf = 138543874;
        uint64_t v26 = v17;
        __int16 v27 = 2114;
        id v28 = v18;
        __int16 v29 = 2114;
        v30 = v11;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Updating setting keyPath: %{public}@ on notification from adaptor to %{public}@", buf, 0x20u);
      }
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __90__HMDAccessorySettingsController_legacySettingsAdaptor_didUpdateSettingKeyPath_BOOLValue___block_invoke;
      v23[3] = &unk_1E6A19380;
      v23[4] = v15;
      id v24 = v10;
      [(HMDAccessorySettingsController *)v15 _runUpdateTransactionWithValue:v11 setting:v24 completion:v23];
    }
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1D9452090]();
    __int16 v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v22;
      __int16 v27 = 2114;
      id v28 = v9;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Did not find setting with keyPath: %{public}@ on update from fetched settings adaptor", buf, 0x16u);
    }
  }
}

void __90__HMDAccessorySettingsController_legacySettingsAdaptor_didUpdateSettingKeyPath_BOOLValue___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) keyPath];
    int v13 = 138543618;
    char v14 = v11;
    __int16 v15 = 2114;
    v16 = v12;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Updated setting keyPath: %{public}@", (uint8_t *)&v13, 0x16u);
  }
}

- (void)BOOLSettingForKeyPath:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessorySettingsController *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__HMDAccessorySettingsController_BOOLSettingForKeyPath_completion___block_invoke;
  block[3] = &unk_1E6A193D0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __67__HMDAccessorySettingsController_BOOLSettingForKeyPath_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) settingForKeyPath:*(void *)(a1 + 40)];
  id v6 = v2;
  if (v2 && [v2 type] == 2)
  {
    id v3 = [v6 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
    id v5 = v4;

    [v5 BOOLValue];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)didDetectCounterpartUsesSoftwareVersionBasedMigrationOwner
{
  id v3 = [(HMDAccessorySettingsController *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__HMDAccessorySettingsController_didDetectCounterpartUsesSoftwareVersionBasedMigrationOwner__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __92__HMDAccessorySettingsController_didDetectCounterpartUsesSoftwareVersionBasedMigrationOwner__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isMigrationOwner] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 32) rootGroup];

    if (!v2)
    {
      int v3 = [*(id *)(a1 + 32) didInitiateSettingsCreationForOlderSoftwareCounterpart];
      v4 = (void *)MEMORY[0x1D9452090]();
      id v5 = *(id *)(a1 + 32);
      id v6 = HMFGetOSLogHandle();
      id v7 = v6;
      if (v3)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          id v8 = HMFGetLogIdentifier();
          int v10 = 138543362;
          id v11 = v8;
          _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Already initiated settings creation for older software counterpart. Will not attempt again", (uint8_t *)&v10, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = HMFGetLogIdentifier();
          int v10 = 138543362;
          id v11 = v9;
          _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Detected no settings with older software counterpart. Will create settings.", (uint8_t *)&v10, 0xCu);
        }
        [*(id *)(a1 + 32) _createSettings];
        [*(id *)(a1 + 32) setDidInitiateSettingsCreationForOlderSoftwareCounterpart:1];
      }
    }
  }
}

- (void)updateSettingOwner:(BOOL)a3
{
  id v5 = [(HMDAccessorySettingsController *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__HMDAccessorySettingsController_updateSettingOwner___block_invoke;
  v6[3] = &unk_1E6A19B58;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __53__HMDAccessorySettingsController_updateSettingOwner___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isSettingOwner];
  if (*(unsigned __int8 *)(a1 + 40) != result)
  {
    int v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = HMFGetLogIdentifier();
      BOOL v7 = HMFBooleanToString();
      int v8 = 138543618;
      id v9 = v6;
      __int16 v10 = 2112;
      id v11 = v7;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Updating setting owner to %@", (uint8_t *)&v8, 0x16u);
    }
    return [*(id *)(a1 + 32) setIsSettingOwner:*(unsigned __int8 *)(a1 + 40)];
  }
  return result;
}

- (void)auditOnFirstFetch
{
  int v3 = [(HMDAccessorySettingsController *)self ownerController];

  if (!v3)
  {
    id v4 = [(HMDAccessorySettingsController *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__HMDAccessorySettingsController_auditOnFirstFetch__block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

uint64_t __51__HMDAccessorySettingsController_auditOnFirstFetch__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleAuditWithReason:1];
}

- (void)removeAllDependants
{
  int v3 = [(HMDAccessorySettingsController *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__HMDAccessorySettingsController_removeAllDependants__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __53__HMDAccessorySettingsController_removeAllDependants__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "dependantControllers", 0);
  int v3 = (void *)[v2 copy];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 32) _removeDependant:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)removeDependant:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDAccessorySettingsController *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HMDAccessorySettingsController_removeDependant___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __50__HMDAccessorySettingsController_removeDependant___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeDependant:*(void *)(a1 + 40)];
}

- (void)addDependant:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDAccessorySettingsController *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__HMDAccessorySettingsController_addDependant___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__HMDAccessorySettingsController_addDependant___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dependantControllers];
  [v2 addObject:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) scheduleDependantFixup];
  uint64_t v5 = a1 + 32;
  int v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(v5 + 8);
  id v6 = [v3 _keyPathsForSettings];
  [v4 didChangeDependantSettings:v3 ownerSettingsKeyPaths:v6];
}

- (id)modelObjectsForSettings
{
  v2 = [(HMDAccessorySettingsController *)self rootGroup];
  if (v2)
  {
    int v3 = +[HMDAccessorySettingTransform modelsForGroup:v2];
  }
  else
  {
    int v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (void)configureIsSettingOwner:(BOOL)a3 migrationOwner:(BOOL)a4 home:(id)a5 legacySettingsAdaptor:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = (void *)MEMORY[0x1D9452090]();
  uint64_t v13 = self;
  char v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    __int16 v15 = v29 = v11;
    v16 = HMFBooleanToString();
    uint64_t v17 = HMFBooleanToString();
    [(HMDAccessorySettingsController *)v13 rootGroup];
    v19 = id v18 = v12;
    *(_DWORD *)buf = 138544130;
    v37 = v15;
    __int16 v38 = 2112;
    v39 = v16;
    __int16 v40 = 2112;
    __int16 v41 = v17;
    __int16 v42 = 2112;
    __int16 v43 = v19;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Configuring settingOwner: %@, migrationOwner: %@, rootGroup: %@", buf, 0x2Au);

    uint64_t v12 = v18;
    id v11 = v29;
  }

  [(HMDAccessorySettingsController *)v13 setIsSettingOwner:v8];
  [(HMDAccessorySettingsController *)v13 setIsMigrationOwner:v7];
  [(HMDAccessorySettingsController *)v13 setLegacySettingsAdaptor:v11];
  [v11 setDelegate:v13];
  if (v7)
  {
    __int16 v20 = [(HMDAccessorySettingsController *)v13 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__HMDAccessorySettingsController_configureIsSettingOwner_migrationOwner_home_legacySettingsAdaptor___block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = v13;
    dispatch_async(v20, block);
  }
  else
  {
    id v21 = [(HMDAccessorySettingsController *)v13 rootGroup];
    __int16 v22 = +[HMDSettingAlgorithm allSettingsFromRootGroup:v21];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (![v28 type]) {
            +[HMDAccessorySettingTransform changeAccessorySettingType:v28 home:v10];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v25);
    }
  }
}

uint64_t __100__HMDAccessorySettingsController_configureIsSettingOwner_migrationOwner_home_legacySettingsAdaptor___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) rootGroup];

  int v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 _migrateSettingsWithCompletion:0];
  }
  else
  {
    return [v3 _createSettings];
  }
}

- (void)configureIsSettingOwner:(BOOL)a3 home:(id)a4 legacySettingsAdaptor:(id)a5
{
}

- (void)configureIsSettingOwner:(BOOL)a3 home:(id)a4
{
}

- (NSArray)childrenIdentifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_allChildrenIdentifiers copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSString)siriLanguage
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v3 = [(HMDAccessorySettingsController *)self settingForKeyPath:@"root.siri.language"];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    BOOL v8 = [v7 title];
    long long v9 = [v8 componentsSeparatedByString:@","];

    if (objc_msgSend(v9, "hmf_isEmpty"))
    {
      id v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = self;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        int v20 = 138543362;
        id v21 = v13;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse siri language componenets", (uint8_t *)&v20, 0xCu);
      }
      char v14 = 0;
    }
    else
    {
      char v14 = [v9 firstObject];
    }
  }
  else
  {
    __int16 v15 = (void *)MEMORY[0x1D9452090]();
    v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      int v20 = 138543362;
      id v21 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch siri language because the HMDAccessorySetting was nil", (uint8_t *)&v20, 0xCu);
    }
    char v14 = 0;
  }

  return (NSString *)v14;
}

- (void)setNestedGroupsDataSourcesWithGroup:(id)a3
{
  id v4 = a3;
  [v4 setDataSource:self];
  uint64_t v5 = [v4 groups];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__HMDAccessorySettingsController_setNestedGroupsDataSourcesWithGroup___block_invoke;
  v6[3] = &unk_1E6A13C80;
  v6[4] = self;
  objc_msgSend(v5, "na_each:", v6);
}

uint64_t __70__HMDAccessorySettingsController_setNestedGroupsDataSourcesWithGroup___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setNestedGroupsDataSourcesWithGroup:a2];
}

- (void)decodeWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(HMDAccessorySettingsController *)self codingKey];
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  BOOL v8 = (void *)MEMORY[0x1D9452090]([(HMDAccessorySettingsController *)self setNestedGroupsDataSourcesWithGroup:v7]);
  long long v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = HMFGetLogIdentifier();
    int v14 = 138543618;
    __int16 v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Assigning root group on decode. %@", (uint8_t *)&v14, 0x16u);
  }
  [(HMDAccessorySettingsController *)v9 setRootGroup:v7];
  uint64_t v12 = [(HMDAccessorySettingsController *)v9 parentUUID];
  uint64_t v13 = [(HMDAccessorySettingsController *)v9 rootGroup];
  [v13 setParentIdentifier:v12];

  [(HMDAccessorySettingsController *)v9 settingsHierarchyDidChange];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(HMDAccessorySettingsController *)self rootGroup];
  uint64_t v5 = [(HMDAccessorySettingsController *)self codingKey];
  [v4 encodeObject:v6 forKey:v5];
}

- (HMDAccessorySettingsController)initWithCoder:(id)a3
{
  return 0;
}

- (void)didBecomeIndependantOwner
{
  int v3 = [(HMDAccessorySettingsController *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HMDAccessorySettingsController_didBecomeIndependantOwner__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __59__HMDAccessorySettingsController_didBecomeIndependantOwner__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setOwnerController:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "settingsMap", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        BOOL v8 = [*(id *)(a1 + 32) settingsMap];
        long long v9 = [v8 objectForKey:v7];

        [v9 setReflected:0];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  id v10 = [*(id *)(a1 + 32) delegate];
  [v10 accessorySettingsController:*(void *)(a1 + 32) saveWithReason:@"Parent for reflected settings removed"];
}

- (void)didChangeDependantSettings:(id)a3 ownerSettingsKeyPaths:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HMDAccessorySettingsController *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__HMDAccessorySettingsController_didChangeDependantSettings_ownerSettingsKeyPaths___block_invoke;
  block[3] = &unk_1E6A19668;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __83__HMDAccessorySettingsController_didChangeDependantSettings_ownerSettingsKeyPaths___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 32) setOwnerController:*(void *)(a1 + 40)]);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    id v6 = *(void **)(a1 + 48);
    id v7 = [*(id *)(a1 + 32) _keyPathsForSettings];
    *(_DWORD *)buf = 138543874;
    id v28 = v5;
    __int16 v29 = 2112;
    long long v30 = v6;
    __int16 v31 = 2112;
    long long v32 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Evaluating dependents from %@ to current %@", buf, 0x20u);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v9) {
    goto LABEL_17;
  }
  uint64_t v11 = v9;
  char v12 = 0;
  uint64_t v13 = *(void *)v23;
  *(void *)&long long v10 = 138543618;
  long long v21 = v10;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v23 != v13) {
        objc_enumerationMutation(v8);
      }
      __int16 v15 = objc_msgSend(*(id *)(a1 + 32), "settingForKeyPath:", *(void *)(*((void *)&v22 + 1) + 8 * i), v21, (void)v22);
      uint64_t v16 = v15;
      if (v15 && ([v15 isReflected] & 1) == 0)
      {
        uint64_t v17 = (void *)MEMORY[0x1D9452090]();
        id v18 = *(id *)(a1 + 32);
        uint64_t v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = v21;
          id v28 = v20;
          __int16 v29 = 2112;
          long long v30 = v16;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Setting %@ became reflected", buf, 0x16u);
        }
        char v12 = 1;
        [v16 setReflected:1];
      }
    }
    uint64_t v11 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v11);

  if (v12)
  {
    id v8 = [*(id *)(a1 + 32) delegate];
    [v8 accessorySettingsController:*(void *)(a1 + 32) saveWithReason:@"Dependent reflected settings changed"];
LABEL_17:
  }
}

- (void)didUpdateSettingConstraints:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if ([(HMDAccessorySettingsController *)self isSettingOwner]
    && [(HMDAccessorySettingsController *)self hasDependants])
  {
    [(HMDAccessorySettingsController *)self scheduleDependantFixup];
  }
  uint64_t v4 = [v11 keyPath];
  int v5 = [v4 isEqual:@"root.siri.language"];

  if (self && v5)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Accessory settings languages did change, resuming language change timer", buf, 0xCu);
    }
    long long v10 = [(HMDAccessorySettingsController *)v7 languageChangeDebounceTimer];
    [v10 resume];
  }
}

- (void)didChangeSetting:(id)a3
{
  if ([(HMDAccessorySettingsController *)self isSettingOwner])
  {
    [(HMDAccessorySettingsController *)self scheduleDependantFixup];
  }
}

- (void)_didRemoveSetting:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  allChildrenIdentifiers = self->_allChildrenIdentifiers;
  id v7 = [v5 identifier];

  [(NSMutableArray *)allChildrenIdentifiers removeObject:v7];
}

- (void)_didAddSetting:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  allChildrenIdentifiers = self->_allChildrenIdentifiers;
  id v7 = [v5 identifier];

  [(NSMutableArray *)allChildrenIdentifiers addObject:v7];
}

- (void)_didRemoveGroup:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  allChildrenIdentifiers = self->_allChildrenIdentifiers;
  id v7 = [v5 identifier];

  [(NSMutableArray *)allChildrenIdentifiers removeObject:v7];
}

- (void)_didAddGroup:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  allChildrenIdentifiers = self->_allChildrenIdentifiers;
  id v7 = [v5 identifier];

  [(NSMutableArray *)allChildrenIdentifiers addObject:v7];
}

- (void)handleLanguageChangeTimerFired
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  uint64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Accessory settings language change timer did fire, notifying delegate", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(HMDAccessorySettingsController *)v4 delegate];
  [v7 languagesChangedForAccessorySettingsController:v4];
}

- (void)handleRemovedSettingConstraintModel:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  int v8 = [(HMDAccessorySettingsController *)self settingsMap];
  uint64_t v9 = [v6 parentUUID];
  uint64_t v10 = [v8 objectForKey:v9];

  if (v10)
  {
    id v11 = [v6 uuid];
    char v12 = [v10 constraintWithIdentifier:v11];

    uint64_t v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = v10;
    __int16 v15 = HMFGetOSLogHandle();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v16)
      {
        uint64_t v17 = HMFGetLogIdentifier();
        int v26 = 138543874;
        __int16 v27 = v17;
        __int16 v28 = 2112;
        id v29 = v12;
        __int16 v30 = 2112;
        id v31 = v14;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Removed constraint: %@ from setting: %@", (uint8_t *)&v26, 0x20u);
      }
      [v14 removeConstraint:v12];
      [(HMDAccessorySettingsController *)self didUpdateSettingConstraints:v14];
      v7[2](v7, 0);
      id v18 = [(HMDAccessorySettingsController *)self ownerController];
      uint64_t v19 = v18;
      if (v18) {
        [v18 scheduleAuditWithReason:7 from:self];
      }
    }
    else
    {
      if (v16)
      {
        long long v25 = HMFGetLogIdentifier();
        int v26 = 138543874;
        __int16 v27 = v25;
        __int16 v28 = 2112;
        id v29 = v6;
        __int16 v30 = 2112;
        id v31 = v14;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Constraint already removed: %@ from setting: %@", (uint8_t *)&v26, 0x20u);
      }
      v7[2](v7, 0);
      char v12 = 0;
    }
  }
  else
  {
    int v20 = (void *)MEMORY[0x1D9452090]();
    long long v21 = self;
    long long v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      long long v23 = HMFGetLogIdentifier();
      long long v24 = [v6 parentUUID];
      int v26 = 138543874;
      __int16 v27 = v23;
      __int16 v28 = 2112;
      id v29 = v24;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Setting %@ to remove constraint %@ not found", (uint8_t *)&v26, 0x20u);
    }
    char v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    ((void (**)(id, void *))v7)[2](v7, v12);
  }
}

- (void)handleUpdatedSettingConstraintModel:(id)a3 completion:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  int v8 = [(HMDAccessorySettingsController *)self settingsMap];
  uint64_t v9 = [v6 parentUUID];
  uint64_t v10 = [v8 objectForKey:v9];

  if (v10)
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F2E5E8]) initWithModel:v6];
    if (v11)
    {
      char v12 = [v10 constraints];
      char v13 = [v12 containsObject:v11];

      id v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = v10;
      BOOL v16 = HMFGetOSLogHandle();
      uint64_t v17 = v16;
      if (v13)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v18 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          __int16 v38 = v18;
          __int16 v39 = 2112;
          __int16 v40 = v11;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Constraint already exists and is not mutable: %@", buf, 0x16u);
        }
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          long long v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          __int16 v38 = v25;
          __int16 v39 = 2112;
          __int16 v40 = v11;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Added accessory settings constraint: %@", buf, 0x16u);
        }
        int v26 = (void *)MEMORY[0x1D9452090]();
        id v27 = v15;
        __int16 v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v29 = v35 = v13;
          [v11 identifier];
          v30 = id v36 = v26;
          id v31 = [v27 name];
          *(_DWORD *)buf = 138543874;
          __int16 v38 = v29;
          __int16 v39 = 2112;
          __int16 v40 = v30;
          __int16 v41 = 2112;
          id v42 = v31;
          _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Added accessory settings constraint: %@, setting: %@", buf, 0x20u);

          int v26 = v36;
          char v13 = v35;
        }

        [v27 addConstraint:v11];
        [(HMDAccessorySettingsController *)self didUpdateSettingConstraints:v27];
      }
      v7[2](v7, 0);
      uint64_t v32 = [(HMDAccessorySettingsController *)self ownerController];
      uint64_t v33 = v32;
      if (v32) {
        char v34 = v13;
      }
      else {
        char v34 = 1;
      }
      if ((v34 & 1) == 0) {
        [v32 scheduleAuditWithReason:6 from:self];
      }
    }
    else
    {
      long long v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      ((void (**)(id, void *))v7)[2](v7, v24);
    }
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1D9452090]();
    int v20 = self;
    long long v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      long long v22 = HMFGetLogIdentifier();
      long long v23 = [v6 parentUUID];
      *(_DWORD *)buf = 138543874;
      __int16 v38 = v22;
      __int16 v39 = 2112;
      __int16 v40 = v23;
      __int16 v41 = 2112;
      id v42 = v6;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Setting %@ to add constraint %@ not found", buf, 0x20u);
    }
    id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    ((void (**)(id, void *))v7)[2](v7, v11);
  }
}

- (void)handleRemovedSettingModel:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  int v8 = [(HMDAccessorySettingsController *)self settingsMap];
  uint64_t v9 = [v6 uuid];
  uint64_t v10 = [v8 objectForKey:v9];

  id v11 = [(HMDAccessorySettingsController *)self groupsMap];
  char v12 = [v6 parentUUID];
  char v13 = [v11 objectForKey:v12];

  if (v10)
  {
    [v13 removeSetting:v10];
    [(HMDAccessorySettingsController *)self settingsHierarchyDidChange];
    v7[2](v7, 0);
    id v14 = [(HMDAccessorySettingsController *)self ownerController];
    id v15 = v14;
    if (v14) {
      [v14 scheduleAuditWithReason:3 from:self];
    }
  }
  else
  {
    BOOL v16 = (void *)MEMORY[0x1D9452090]();
    uint64_t v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      int v20 = [v6 uuid];
      int v22 = 138543618;
      long long v23 = v19;
      __int16 v24 = 2112;
      long long v25 = v20;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Setting with id %@ not found", (uint8_t *)&v22, 0x16u);
    }
    long long v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    ((void (**)(id, void *))v7)[2](v7, v21);
  }
}

- (void)addedSettingModel:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void, HMDAccessorySetting *))a4;
  int v8 = [[HMDAccessorySetting alloc] initWithModel:v6];
  uint64_t v9 = [(HMDAccessorySettingsController *)self groupsMap];
  uint64_t v10 = [v6 parentUUID];
  id v11 = [v9 objectForKey:v10];

  if (v11)
  {
    [v11 addSetting:v8];
    [(HMDAccessorySettingsController *)self settingsHierarchyDidChange];
    v7[2](v7, 1, 0, v8);
    char v12 = [(HMDAccessorySettingsController *)self ownerController];
    char v13 = v12;
    if (!v12)
    {
      if (![(HMDAccessorySettingsController *)self hasDependants])
      {
LABEL_10:

        goto LABEL_11;
      }
      char v12 = self;
    }
    [v12 scheduleAuditWithReason:2 from:self];
    goto LABEL_10;
  }
  id v14 = (void *)MEMORY[0x1D9452090]();
  id v15 = self;
  BOOL v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    id v18 = [v6 parentUUID];
    int v20 = 138543874;
    long long v21 = v17;
    __int16 v22 = 2112;
    long long v23 = v18;
    __int16 v24 = 2112;
    long long v25 = v8;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Parent group %@ to add setting %@ not found", (uint8_t *)&v20, 0x20u);
  }
  uint64_t v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  ((void (**)(id, uint64_t, void *, HMDAccessorySetting *))v7)[2](v7, 1, v19, 0);

LABEL_11:
}

- (void)updatedSetting:(id)a3 model:(id)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void, id))a5;
  id v11 = [v9 configurationVersion];
  unint64_t v12 = [v11 unsignedIntegerValue];

  if (v12
    && (unint64_t v13 = [v8 configurationVersion], objc_msgSend(v8, "setConfigurationVersion:", v12), v12 >= v13)
    && ([v9 value], id v14 = objc_claimAutoreleasedReturnValue(), v14, v14))
  {
    id v15 = (void *)MEMORY[0x1E4F28DC0];
    BOOL v16 = +[HMDAccessorySetting supportedValueClasses];
    uint64_t v17 = [v9 value];
    id v34 = 0;
    id v18 = [v15 unarchivedObjectOfClasses:v16 fromData:v17 error:&v34];
    id v19 = v34;

    if (v18)
    {
      uint64_t v33 = v19;
      int v20 = [v9 value];
      long long v21 = [v8 value];
      char v22 = HMFEqualObjects();

      uint64_t v23 = 0;
      if ((v22 & 1) != 0 || v12 <= v13)
      {
        id v19 = v33;
      }
      else
      {
        [v8 setValue:v18];

        __int16 v24 = (void *)MEMORY[0x1D9452090]();
        id v25 = v8;
        uint64_t v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          id v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v36 = v27;
          __int16 v37 = 2112;
          id v38 = v25;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Setting changed %@ value", buf, 0x16u);
        }
        [(HMDAccessorySettingsController *)self didChangeSetting:v25];
        id v19 = [v25 value];
        if (!v19)
        {
          id v19 = [MEMORY[0x1E4F1CA98] null];
        }
        id v18 = [(HMDAccessorySettingsController *)self messageHandler];
        __int16 v28 = [v25 keyPath];
        [v18 notifyOfUpdatedValue:v19 settingKeyPath:v28];

        uint64_t v23 = 1;
      }
    }
    else
    {
      id v29 = (void *)MEMORY[0x1D9452090]();
      id v30 = v8;
      id v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v36 = v32;
        __int16 v37 = 2112;
        id v38 = v19;
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory setting supported value from model's value: %@", buf, 0x16u);
      }
      id v18 = 0;
      uint64_t v23 = 0;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }
  v10[2](v10, v23, 0, v8);
}

- (void)handleUpdatedSettingModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDAccessorySettingsController *)self settingsMap];
  id v9 = [v7 uuid];
  uint64_t v10 = [v8 objectForKey:v9];

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __71__HMDAccessorySettingsController_handleUpdatedSettingModel_completion___block_invoke;
  BOOL v16 = &unk_1E6A13C58;
  uint64_t v17 = self;
  id v18 = v6;
  id v11 = v6;
  unint64_t v12 = _Block_copy(&v13);
  if (v10) {
    -[HMDAccessorySettingsController updatedSetting:model:completion:](self, "updatedSetting:model:completion:", v10, v7, v12, v13, v14, v15, v16, v17, v18);
  }
  else {
    -[HMDAccessorySettingsController addedSettingModel:completion:](self, "addedSettingModel:completion:", v7, v12, v13, v14, v15, v16, v17, v18);
  }
}

void __71__HMDAccessorySettingsController_handleUpdatedSettingModel_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v8)
  {
    if (a2)
    {
      uint64_t v10 = [v8 keyPath];

      if (v10)
      {
        id v11 = [*(id *)(a1 + 32) notificationCenter];
        unint64_t v12 = [*(id *)(a1 + 32) dataSource];
        v15[0] = @"HMDAccessorySettingsControllerSettingsUpdateNotificationSettingValueCodingKey";
        v15[1] = @"HMDAccessorySettingsControllerSettingsUpdateNotification";
        v16[0] = v9;
        uint64_t v13 = [v9 keyPath];
        v16[1] = v13;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
        [v11 postNotificationName:@"HMDAccessorySettingsControllerSettingsUpdateNotification" object:v12 userInfo:v14];
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)handleRemovedGroupModel:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = [(HMDAccessorySettingsController *)self groupsMap];
  id v9 = [v6 uuid];
  uint64_t v10 = [v8 objectForKey:v9];

  id v11 = [(HMDAccessorySettingsController *)self groupsMap];
  unint64_t v12 = [v6 parentUUID];
  uint64_t v13 = [v11 objectForKey:v12];

  if (v10)
  {
    uint64_t v14 = [v10 keyPath];
    id v15 = [(HMDAccessorySettingsController *)self rootGroup];
    BOOL v16 = [v15 keyPath];
    int v17 = [v14 isEqualToString:v16];

    if (v17)
    {
      id v18 = (void *)MEMORY[0x1D9452090]();
      id v19 = self;
      int v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        long long v21 = HMFGetLogIdentifier();
        char v22 = [(HMDAccessorySettingsController *)v19 rootGroup];
        int v26 = 138543874;
        id v27 = v21;
        __int16 v28 = 2112;
        id v29 = v6;
        __int16 v30 = 2112;
        id v31 = v22;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Root group model %@ was removed %@", (uint8_t *)&v26, 0x20u);
      }
      [(HMDAccessorySettingsController *)v19 setRootGroup:0];
    }
    else
    {
      [v13 removeGroup:v10];
    }
    [(HMDAccessorySettingsController *)self settingsHierarchyDidChange];
    v7[2](v7, 0);
    __int16 v24 = [(HMDAccessorySettingsController *)self ownerController];
    id v25 = v24;
    if (v24) {
      [v24 scheduleAuditWithReason:5 from:self];
    }
  }
  else
  {
    uint64_t v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    ((void (**)(id, void *))v7)[2](v7, v23);
  }
}

- (void)handleUpdatedGroupModel:(id)a3 completion:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = (HMDAccessorySettingGroup *)a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [[HMDAccessorySettingGroup alloc] initWithModel:v6];
  uint64_t v9 = [(HMDAccessorySettingGroup *)v8 setDataSource:self];
  if (!v8)
  {
    id v19 = (void *)MEMORY[0x1D9452090](v9);
    int v20 = self;
    long long v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      char v22 = HMFGetLogIdentifier();
      int v39 = 138543618;
      __int16 v40 = v22;
      __int16 v41 = 2112;
      id v42 = v6;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode group from model %@", (uint8_t *)&v39, 0x16u);
    }
    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = 3;
    goto LABEL_20;
  }
  uint64_t v10 = [(HMDAccessorySettingGroup *)v6 parentUUID];
  id v11 = [(HMDAccessorySettingsController *)self parentUUID];
  int v12 = objc_msgSend(v10, "hmf_isEqualToUUID:", v11);

  if (!v12)
  {
    id v25 = [(HMDAccessorySettingsController *)self groupsMap];
    int v26 = [(HMDAccessorySettingGroup *)v6 parentUUID];
    id v27 = [v25 objectForKey:v26];

    if (v27)
    {
      __int16 v28 = (void *)MEMORY[0x1D9452090]([(HMDAccessorySettingGroup *)v27 addGroup:v8]);
      id v29 = self;
      __int16 v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        id v31 = HMFGetLogIdentifier();
        int v39 = 138543874;
        __int16 v40 = v31;
        __int16 v41 = 2112;
        id v42 = v8;
        __int16 v43 = 2112;
        uint64_t v44 = v27;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Added group %@ to %@", (uint8_t *)&v39, 0x20u);
      }

      goto LABEL_15;
    }
    id v34 = (void *)MEMORY[0x1D9452090]();
    char v35 = self;
    id v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      __int16 v37 = HMFGetLogIdentifier();
      id v38 = [(HMDAccessorySettingGroup *)v6 parentUUID];
      int v39 = 138543874;
      __int16 v40 = v37;
      __int16 v41 = 2112;
      id v42 = v38;
      __int16 v43 = 2112;
      uint64_t v44 = v8;
      _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@Parent group %@ to add group %@ not found", (uint8_t *)&v39, 0x20u);
    }
    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = 2;
LABEL_20:
    uint64_t v33 = [v23 hmErrorWithCode:v24];
    v7[2](v7, v33);
    goto LABEL_21;
  }
  uint64_t v13 = (void *)MEMORY[0x1D9452090]();
  uint64_t v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v16 = HMFGetLogIdentifier();
    int v17 = [(HMDAccessorySettingGroup *)v6 uuid];
    int v39 = 138543874;
    __int16 v40 = v16;
    __int16 v41 = 2112;
    id v42 = v6;
    __int16 v43 = 2112;
    uint64_t v44 = v17;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Assigning root group from transaction model: %@ id: %@.", (uint8_t *)&v39, 0x20u);
  }
  id v18 = [(HMDAccessorySettingsController *)v14 home];
  [v18 isOwnerUser];

  [(HMDAccessorySettingsController *)v14 setRootGroup:v8];
  if ([(HMDAccessorySettingsController *)v14 hasCreatedUnprocessedRootGroup]) {
    [(HMDAccessorySettingsController *)v14 scheduleAuditWithReason:4 from:v14];
  }
  [(HMDAccessorySettingsController *)v14 setHasCreatedUnprocessedRootGroup:0];
LABEL_15:
  [(HMDAccessorySettingsController *)self settingsHierarchyDidChange];
  v7[2](v7, 0);
  uint64_t v32 = [(HMDAccessorySettingsController *)self ownerController];
  uint64_t v33 = v32;
  if (v32) {
    [v32 scheduleAuditWithReason:4 from:self];
  }
LABEL_21:
}

- (void)_removeManagedConfigurationProfile:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(HMDAccessorySettingsController *)self dataSource];
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    uint64_t v10 = self;
    id v11 = HMFGetOSLogHandle();
    int v12 = v11;
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        int v22 = 138543362;
        uint64_t v23 = v13;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Remove managed configuration profile", (uint8_t *)&v22, 0xCu);
      }
      [v8 removeManagedConfigurationProfileWithProfileData:v6 completion:v7];
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v19 = HMFGetLogIdentifier();
        int v22 = 138543362;
        uint64_t v23 = v19;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil datasource.", (uint8_t *)&v22, 0xCu);
      }
      int v20 = (void (**)(void *, void *))_Block_copy(v7);
      if (v20)
      {
        long long v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
        v20[2](v20, v21);
      }
      id v8 = 0;
    }
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = self;
    BOOL v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = HMFGetLogIdentifier();
      int v22 = 138543362;
      uint64_t v23 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Managed configuration profile data is nil", (uint8_t *)&v22, 0xCu);
    }
    id v8 = (void (**)(void, void))_Block_copy(v7);
    if (v8)
    {
      id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      ((void (**)(void, void *))v8)[2](v8, v18);
    }
  }
}

- (HMDHome)home
{
  v2 = [(HMDAccessorySettingsController *)self dataSource];
  id v3 = [v2 home];

  return (HMDHome *)v3;
}

- (id)settingForUUID:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMapTable *)self->_settingsMap objectForKey:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (BOOL)canUser:(id)a3 editConstraintsForSetting:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessorySettingsController *)self settingForUUID:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    if (self)
    {
      if ([v8 isCollectionType]) {
        uint64_t v10 = 4;
      }
      else {
        uint64_t v10 = 3;
      }
    }
    else
    {
      uint64_t v10 = 3;
    }
    BOOL v11 = HMDUserPrivilegeCompare([v6 privilege], v10) != -1;
  }
  else
  {
    int v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      int v17 = 138543874;
      id v18 = v15;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@User %@ cannot edit accessory setting with UUID %@ because it does not exist.", (uint8_t *)&v17, 0x20u);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)canUser:(id)a3 editConstraintsForSettingWithKeyPath:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessorySettingsController *)self settingForKeyPath:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    if (self)
    {
      if ([v8 isCollectionType]) {
        uint64_t v10 = 4;
      }
      else {
        uint64_t v10 = 3;
      }
    }
    else
    {
      uint64_t v10 = 3;
    }
    BOOL v11 = HMDUserPrivilegeCompare([v6 privilege], v10) != -1;
  }
  else
  {
    int v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      int v17 = 138543874;
      id v18 = v15;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@User %@ cannot edit accessory setting at key path %@ because it does not exist.", (uint8_t *)&v17, 0x20u);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_replaceConstraintsOnMessageToChildWithAdditions:(id)a3 removedChildConstraints:(id)a4 settingKeyPath:(id)a5 senderProductClass:(int64_t)a6 completion:(id)a7
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, void *))a7;
  BOOL v16 = [(HMDAccessorySettingsController *)self settingForKeyPath:v14];
  if (v16)
  {
    int64_t v53 = a6;
    id v54 = v14;
    id v56 = v12;
    int v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v13, "count"));
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v55 = v13;
    id v18 = v13;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v57 objects:v61 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v58;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v58 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          uint64_t v24 = objc_msgSend(v16, "counterpartConstraintFor:", v23, v53);
          if (!v24)
          {
            id v34 = (void *)MEMORY[0x1D9452090]();
            char v35 = self;
            id v36 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v37 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v63 = v37;
              __int16 v64 = 2112;
              id v65 = v23;
              _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Didn't find constraints to remove in Owner Controller %@", buf, 0x16u);
            }
            id v38 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Constraint not found in owner controller" reason:@"Did not find constraint in owner controller" suggestion:0];
            v15[2](v15, v38);

            int v26 = v18;
            id v12 = v56;
            goto LABEL_26;
          }
          id v25 = (void *)v24;
          [v17 addObject:v24];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v57 objects:v61 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    id v12 = v56;
    int v26 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v56 copyItems:1];
    uint64_t v27 = [v17 count];
    if (v27 == [v18 count])
    {
      if ([(HMDAccessorySettingsController *)self isProxy])
      {
        if (v53 != 6)
        {
          v48 = objc_msgSend(v17, "na_map:", &__block_literal_global_179_152105);
          v49 = [(HMDAccessorySettingsController *)self messageHandler];
          v50 = [(HMDAccessorySettingsController *)self delegate];
          v51 = [v16 identifier];
          v52 = [v50 remoteMessageDestinationForAccessorySettingsController:self target:v51];
          [v49 relayReplaceConstraints:v26 constraintIdsToRemove:v48 keyPath:v54 destination:v52 completion:v15];

          id v12 = v56;
          id v14 = v54;

          id v13 = v55;
          goto LABEL_28;
        }
        __int16 v28 = (void *)MEMORY[0x1D9452090]();
        id v29 = self;
        __int16 v30 = HMFGetOSLogHandle();
        id v13 = v55;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          id v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v63 = v31;
          __int16 v64 = 2112;
          id v65 = v16;
          _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Cannot relay constraint replacement to child for setting(%@) to a second AudioAccessory", buf, 0x16u);
        }
        uint64_t v32 = [(HMDAccessorySettingsController *)v29 factory];
        [v32 assertWithCondition:0 message:@"Cannot reforward settings constraint replacement for child to a second homepod"];

        uint64_t v33 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1 description:@"Cannot relay to an AudioAccessory multiple times" reason:@"Failed to handle relay." suggestion:0];
        v15[2](v15, v33);

LABEL_27:
        id v14 = v54;
LABEL_28:

        goto LABEL_29;
      }
      [(HMDAccessorySettingsController *)self _replaceConstraintsOnSetting:v16 additions:v26 removals:v17 completion:v15];
    }
    else
    {
      __int16 v43 = (void *)MEMORY[0x1D9452090]();
      uint64_t v44 = self;
      uint64_t v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v63 = v46;
        _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@Didn't find same number of constraints to remove", buf, 0xCu);
      }
      v47 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Constraints don't match" reason:@"Didn't find same number of constraints to remove in media system" suggestion:0];
      v15[2](v15, v47);
    }
LABEL_26:
    id v13 = v55;
    goto LABEL_27;
  }
  int v39 = (void *)MEMORY[0x1D9452090]();
  __int16 v40 = self;
  __int16 v41 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    id v42 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v63 = v42;
    __int16 v64 = 2112;
    id v65 = v14;
    _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "%{public}@Setting not found for keyPath %@", buf, 0x16u);
  }
  int v17 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
  v15[2](v15, v17);
LABEL_29:
}

uint64_t __152__HMDAccessorySettingsController__replaceConstraintsOnMessageToChildWithAdditions_removedChildConstraints_settingKeyPath_senderProductClass_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)_replaceConstraintsOnSetting:(id)a3 additions:(id)a4 removals:(id)a5 completion:(id)a6
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v81 = a6;
  id v13 = [(HMDAccessorySettingsController *)self workQueue];
  dispatch_assert_queue_V2(v13);

  id v14 = [MEMORY[0x1E4F1CA48] array];
  id v15 = (void *)MEMORY[0x1D9452090]();
  BOOL v16 = self;
  int v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v114 = v18;
    __int16 v115 = 2112;
    id v116 = v12;
    __int16 v117 = 2112;
    id v118 = v11;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Replacing constraints, %@, with constraint, %@", buf, 0x20u);
  }
  uint64_t v19 = (void *)MEMORY[0x1D9452090]();
  uint64_t v20 = v16;
  uint64_t v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    id v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v114 = v22;
    __int16 v115 = 2112;
    id v116 = v12;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Removing constraints: %@", buf, 0x16u);
  }
  v87 = [MEMORY[0x1E4F1CA48] array];
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v23 = v12;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v105 objects:v112 count:16];
  id obj = v23;
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v85 = *(void *)v106;
    id v82 = v11;
LABEL_7:
    int v26 = v20;
    uint64_t v27 = 0;
    while (1)
    {
      if (*(void *)v106 != v85) {
        objc_enumerationMutation(obj);
      }
      __int16 v28 = *(void **)(*((void *)&v105 + 1) + 8 * v27);
      id v29 = [HMDAccessorySettingConstraintModel alloc];
      uint64_t v30 = [v28 identifier];
      id v31 = [v10 identifier];
      uint64_t v32 = [(HMDBackingStoreModelObject *)v29 initWithObjectChangeType:3 uuid:v30 parentUUID:v31];

      uint64_t v33 = [v10 constraints];
      LOBYTE(v30) = [v33 containsObject:v28];

      if ((v30 & 1) == 0) {
        break;
      }
      id v34 = [(HMDAccessorySettingsController *)v26 constraintItemsMarkedForRemoval];
      char v35 = [v28 identifier];
      int v36 = [v34 containsObject:v35];

      if (v36)
      {
        v75 = (void *)MEMORY[0x1D9452090]();
        v76 = v26;
        v77 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          v78 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v114 = v78;
          __int16 v115 = 2112;
          id v116 = v28;
          _os_log_impl(&dword_1D49D5000, v77, OS_LOG_TYPE_ERROR, "%{public}@Constraint has already been removed %@", buf, 0x16u);
        }
        v72 = (void *)MEMORY[0x1E4F28C58];
        v73 = @"Constraint already removed";
        v74 = @"A constraint is already marked for removal";
LABEL_45:
        v79 = [v72 hmErrorWithCode:2 description:v73 reason:v74 suggestion:0];
        v67 = v81;
        id v11 = v82;
        (*((void (**)(id, void *))v81 + 2))(v81, v79);

        v80 = obj;
        goto LABEL_48;
      }
      __int16 v37 = [v28 value];
      [v87 addObject:v37];

      [v14 addObject:v32];
      if (v25 == ++v27)
      {
        id v23 = obj;
        uint64_t v25 = [obj countByEnumeratingWithState:&v105 objects:v112 count:16];
        id v11 = v82;
        uint64_t v20 = v26;
        if (v25) {
          goto LABEL_7;
        }
        goto LABEL_14;
      }
    }
    v68 = (void *)MEMORY[0x1D9452090]();
    v69 = v26;
    v70 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      v71 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v114 = v71;
      _os_log_impl(&dword_1D49D5000, v70, OS_LOG_TYPE_ERROR, "%{public}@Didn't find same number of constraints to remove", buf, 0xCu);
    }
    v72 = (void *)MEMORY[0x1E4F28C58];
    v73 = @"Constraints don't match";
    v74 = @"Didn't find same number of constraints to remove";
    goto LABEL_45;
  }
LABEL_14:

  id v38 = (void *)MEMORY[0x1D9452090]();
  int v39 = v20;
  __int16 v40 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    __int16 v41 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v114 = v41;
    __int16 v115 = 2112;
    id v116 = v11;
    _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_INFO, "%{public}@Adding constraints: %@", buf, 0x16u);
  }
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v42 = v11;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v101 objects:v111 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v102;
    do
    {
      uint64_t v46 = 0;
      do
      {
        if (*(void *)v102 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = *(void **)(*((void *)&v101 + 1) + 8 * v46);
        v48 = [v10 identifier];
        v49 = [v47 modelWithParentIdentifier:v48];

        [v49 setObjectChangeType:1];
        [v14 addObject:v49];

        ++v46;
      }
      while (v44 != v46);
      uint64_t v44 = [v42 countByEnumeratingWithState:&v101 objects:v111 count:16];
    }
    while (v44);
  }

  if ([v14 count])
  {
    id v83 = v11;
    id v86 = v10;
    v50 = [(HMDAccessorySettingsController *)v39 dataSource];
    v51 = [v50 backingStore];
    v52 = +[HMDBackingStoreTransactionOptions defaultPreferencesOptions];
    int64_t v53 = [v51 transaction:@"Replace Constraints" options:v52];

    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v54 = v14;
    uint64_t v55 = [v54 countByEnumeratingWithState:&v97 objects:v110 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v98;
      do
      {
        uint64_t v58 = 0;
        do
        {
          if (*(void *)v98 != v57) {
            objc_enumerationMutation(v54);
          }
          [v53 add:*(void *)(*((void *)&v97 + 1) + 8 * v58++)];
        }
        while (v56 != v58);
        uint64_t v56 = [v54 countByEnumeratingWithState:&v97 objects:v110 count:16];
      }
      while (v56);
    }

    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v59 = obj;
    uint64_t v60 = [v59 countByEnumeratingWithState:&v93 objects:v109 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v94;
      do
      {
        uint64_t v63 = 0;
        do
        {
          if (*(void *)v94 != v62) {
            objc_enumerationMutation(v59);
          }
          __int16 v64 = *(void **)(*((void *)&v93 + 1) + 8 * v63);
          id v65 = [(HMDAccessorySettingsController *)v39 constraintItemsMarkedForRemoval];
          uint64_t v66 = [v64 identifier];
          [v65 addObject:v66];

          ++v63;
        }
        while (v61 != v63);
        uint64_t v61 = [v59 countByEnumeratingWithState:&v93 objects:v109 count:16];
      }
      while (v61);
    }

    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __93__HMDAccessorySettingsController__replaceConstraintsOnSetting_additions_removals_completion___block_invoke;
    v88[3] = &unk_1E6A16978;
    v88[4] = v39;
    id v89 = v87;
    id v90 = v59;
    id v91 = v42;
    v67 = v81;
    id v92 = v81;
    [v53 run:v88];

    id v10 = v86;
    id v11 = v83;
  }
  else
  {
    v67 = v81;
    (*((void (**)(id, void))v81 + 2))(v81, 0);
  }
  v80 = obj;
LABEL_48:
}

void __93__HMDAccessorySettingsController__replaceConstraintsOnSetting_additions_removals_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__HMDAccessorySettingsController__replaceConstraintsOnSetting_additions_removals_completion___block_invoke_2;
  v8[3] = &unk_1E6A18640;
  id v5 = a1[5];
  id v6 = a1[4];
  id v9 = v5;
  id v10 = v6;
  id v11 = v3;
  id v12 = a1[6];
  id v13 = a1[7];
  id v14 = a1[8];
  id v7 = v3;
  dispatch_async(v4, v8);
}

uint64_t __93__HMDAccessorySettingsController__replaceConstraintsOnSetting_additions_removals_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * v6);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "constraintItemsMarkedForRemoval", (void)v16);
        [v8 removeObject:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v4);
  }

  if (!*(void *)(a1 + 48))
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = *(id *)(a1 + 40);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      uint64_t v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = v14;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully replaced %@ constraints with %@ constraints.", buf, 0x20u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (void)onMessageReplaceConstraintsWithAdditions:(id)a3 constraintIdsToRemove:(id)a4 keyPath:(id)a5 senderProductClass:(int64_t)a6 isRemote:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  int64_t v73 = a6;
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  long long v17 = [(HMDAccessorySettingsController *)self workQueue];
  dispatch_assert_queue_V2(v17);

  long long v18 = [(HMDAccessorySettingsController *)self settingForKeyPath:v15];
  if (v18)
  {
    v77 = v15;
    v78 = (void (**)(void, void))v16;
    v76 = v13;
    long long v19 = [MEMORY[0x1E4F1CA80] set];
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v75 = v14;
    id v20 = v14;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v90 objects:v102 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v91;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v91 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          int v26 = objc_msgSend(v18, "constraintWithIdentifier:", v25, v73);
          if (!v26)
          {
            if (![(HMDAccessorySettingsController *)self isProxy]
              && ([(HMDAccessorySettingsController *)self ownerController],
                  uint64_t v27 = objc_claimAutoreleasedReturnValue(),
                  v27,
                  !v27)
              || ([v18 inMemoryConstraintWithIdentifier:v25],
                  (int v26 = objc_claimAutoreleasedReturnValue()) == 0))
            {
              id v42 = (void *)MEMORY[0x1D9452090]();
              uint64_t v43 = self;
              uint64_t v44 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v45 = HMFGetLogIdentifier();
                uint64_t v46 = [v18 constraints];
                v47 = [v18 constraintsForCodingXPC];
                *(_DWORD *)buf = 138544130;
                long long v95 = v45;
                __int16 v96 = 2112;
                id v97 = v25;
                __int16 v98 = 2112;
                long long v99 = v46;
                __int16 v100 = 2112;
                long long v101 = v47;
                _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to find constraint identifier: %@, currentConstraints: %@, allConstraints: %@", buf, 0x2Au);
              }
              v48 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Constraint not found" reason:@"Failed to find constraint" suggestion:0];
              id v16 = v78;
              ((void (**)(void, void *))v78)[2](v78, v48);

              id v34 = v76;
              goto LABEL_37;
            }
          }
          [v19 addObject:v26];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v90 objects:v102 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    __int16 v28 = [(HMDAccessorySettingsController *)self ownerController];
    if (v28)
    {
      id v29 = [v18 keyPath];
      uint64_t v30 = [v28 settingForKeyPath:v29];

      if (v30)
      {
        id v31 = (void *)MEMORY[0x1D9452090]();
        uint64_t v32 = self;
        uint64_t v33 = HMFGetOSLogHandle();
        id v34 = v76;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          char v35 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          long long v95 = v35;
          __int16 v96 = 2112;
          id v97 = v18;
          __int16 v98 = 2112;
          long long v99 = v28;
          _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Forwarding replace constraints for %@ to owner controller. %@", buf, 0x20u);
        }
        int v36 = [v28 workQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __144__HMDAccessorySettingsController_onMessageReplaceConstraintsWithAdditions_constraintIdsToRemove_keyPath_senderProductClass_isRemote_completion___block_invoke;
        block[3] = &unk_1E6A13B98;
        block[4] = v32;
        id v85 = v76;
        id v86 = v19;
        id v87 = v18;
        int64_t v89 = v73;
        id v16 = v78;
        v88 = v78;
        dispatch_async(v36, block);

        goto LABEL_36;
      }
    }
    id v34 = v76;
    id v16 = v78;
    if ([(HMDAccessorySettingsController *)self isProxy])
    {
      if (v74 != 6)
      {
        uint64_t v60 = [(HMDAccessorySettingsController *)self messageHandler];
        uint64_t v61 = [(HMDAccessorySettingsController *)self delegate];
        uint64_t v62 = [v18 identifier];
        uint64_t v63 = [v61 remoteMessageDestinationForAccessorySettingsController:self target:v62];
        v79[0] = MEMORY[0x1E4F143A8];
        v79[1] = 3221225472;
        v79[2] = __144__HMDAccessorySettingsController_onMessageReplaceConstraintsWithAdditions_constraintIdsToRemove_keyPath_senderProductClass_isRemote_completion___block_invoke_148;
        v79[3] = &unk_1E6A16978;
        v79[4] = self;
        id v80 = v76;
        id v81 = v19;
        id v82 = v18;
        id v83 = v78;
        [v60 relayReplaceConstraints:v80 constraintIdsToRemove:v20 keyPath:v77 destination:v63 completion:v79];

        id v16 = v78;
        id v20 = v28;
        goto LABEL_37;
      }
      v49 = (void *)MEMORY[0x1D9452090]();
      v50 = self;
      v51 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v52 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v95 = v52;
        __int16 v96 = 2112;
        id v97 = v77;
        _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_ERROR, "%{public}@Cannot relay constraint replacement(%@) to a second AudioAccessory", buf, 0x16u);

        id v16 = v78;
      }

      int64_t v53 = [(HMDAccessorySettingsController *)v50 factory];
      [v53 assertWithCondition:0 message:@"Cannot reforward settings constraint replacement to a second homepod"];

      id v54 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1 description:@"Cannot relay to an AudioAccessory multiple times" reason:@"Failed to handle relay." suggestion:0];
      (*((void (**)(id, void *))v16 + 2))(v16, v54);
      goto LABEL_35;
    }
    if (!v9
      || ![v77 isEqualToString:@"root.general.profiles.managedConfigurationProfiles"])
    {
      id v54 = [v19 allObjects];
      [(HMDAccessorySettingsController *)self _replaceConstraintsOnSetting:v18 additions:v76 removals:v54 completion:v78];
LABEL_35:

LABEL_36:
      id v20 = v28;
LABEL_37:
      id v14 = v75;
LABEL_38:

      id v15 = v77;
      goto LABEL_39;
    }
    id v20 = v28;
    id v14 = v75;
    if ([v76 count])
    {
      uint64_t v55 = (void *)MEMORY[0x1D9452090]();
      uint64_t v56 = self;
      uint64_t v57 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
LABEL_48:

        v72 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
        (*((void (**)(id, void *))v16 + 2))(v16, v72);

        goto LABEL_38;
      }
      uint64_t v58 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v95 = v58;
      __int16 v96 = 2112;
      id v97 = v76;
      id v59 = "%{public}@Add managed configuration profile via replace constraint not supported: %@";
    }
    else
    {
      if ([v19 count] == 1)
      {
        __int16 v64 = [v19 allObjects];
        id v65 = [v64 firstObject];

        uint64_t v66 = (void *)MEMORY[0x1D9452090]();
        v67 = self;
        v68 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          v69 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v95 = v69;
          __int16 v96 = 2112;
          id v97 = v65;
          _os_log_impl(&dword_1D49D5000, v68, OS_LOG_TYPE_INFO, "%{public}@Remove managed configuration profile for constraint: %@", buf, 0x16u);
        }
        v70 = [v65 value];
        v71 = [v70 value];
        [(HMDAccessorySettingsController *)v67 _removeManagedConfigurationProfile:v71 completion:v78];

        id v16 = v78;
        goto LABEL_38;
      }
      uint64_t v55 = (void *)MEMORY[0x1D9452090]();
      uint64_t v56 = self;
      uint64_t v57 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      uint64_t v58 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v95 = v58;
      __int16 v96 = 2112;
      id v97 = v19;
      id v59 = "%{public}@Only one profile can be removed: %@";
    }
    _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_ERROR, v59, buf, 0x16u);

    id v16 = v78;
    goto LABEL_48;
  }
  id v34 = v13;
  __int16 v37 = (void *)MEMORY[0x1D9452090]();
  id v38 = self;
  int v39 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    __int16 v41 = v40 = v16;
    *(_DWORD *)buf = 138543618;
    long long v95 = v41;
    __int16 v96 = 2112;
    id v97 = v15;
    _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@Setting not found for key path %@", buf, 0x16u);

    id v16 = v40;
  }

  long long v19 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
  (*((void (**)(id, void *))v16 + 2))(v16, v19);
LABEL_39:
}

void __144__HMDAccessorySettingsController_onMessageReplaceConstraintsWithAdditions_constraintIdsToRemove_keyPath_senderProductClass_isRemote_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) ownerController];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) allObjects];
  uint64_t v5 = [*(id *)(a1 + 56) keyPath];
  uint64_t v6 = *(void *)(a1 + 72);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __144__HMDAccessorySettingsController_onMessageReplaceConstraintsWithAdditions_constraintIdsToRemove_keyPath_senderProductClass_isRemote_completion___block_invoke_2;
  v7[3] = &unk_1E6A18F68;
  v7[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  [v2 _replaceConstraintsOnMessageToChildWithAdditions:v3 removedChildConstraints:v4 settingKeyPath:v5 senderProductClass:v6 completion:v7];
}

void __144__HMDAccessorySettingsController_onMessageReplaceConstraintsWithAdditions_constraintIdsToRemove_keyPath_senderProductClass_isRemote_completion___block_invoke_148(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (!v6)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 48) allObjects];
    [v3 _cacheConstraintAdditions:v4 removals:v5 setting:*(void *)(a1 + 56)];
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __144__HMDAccessorySettingsController_onMessageReplaceConstraintsWithAdditions_constraintIdsToRemove_keyPath_senderProductClass_isRemote_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v11 = 138543618;
    id v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Got response from owner failing current %@.", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

- (void)onMessageReplaceConstraintsWithAdditions:(id)a3 constraintIdsToRemove:(id)a4 settingIdentifier:(id)a5 senderProductClass:(int64_t)a6 isRemote:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  long long v18 = [(HMDAccessorySettingsController *)self workQueue];
  dispatch_assert_queue_V2(v18);

  long long v19 = [(HMDAccessorySettingsController *)self settingsMap];
  id v21 = [v19 objectForKey:v15];

  id v20 = [v21 keyPath];
  [(HMDAccessorySettingsController *)self onMessageReplaceConstraintsWithAdditions:v17 constraintIdsToRemove:v16 keyPath:v20 senderProductClass:a6 isRemote:v8 completion:v14];
}

- (void)_cacheConstraintAdditions:(id)a3 removals:(id)a4 setting:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  __int16 v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = HMFGetLogIdentifier();
    int v15 = 138544130;
    id v16 = v14;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@%@ caching additions %@, removals %@", (uint8_t *)&v15, 0x2Au);
  }
  [v10 addConstraintsInMemory:v8];
  [v10 removeConstraintsInMemory:v9];
}

- (void)onMessageUpdateConstraints:(id)a3 keyPath:(id)a4 completion:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  int v11 = [(HMDAccessorySettingsController *)self settingForKeyPath:v9];
  id v12 = v11;
  if (!v11)
  {
    id v20 = (void *)MEMORY[0x1D9452090]();
    __int16 v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v54 = v23;
      __int16 v55 = 2112;
      id v56 = v9;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Setting not found for key path %@", buf, 0x16u);
    }
    uint64_t v19 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    goto LABEL_9;
  }
  __int16 v13 = [v11 keyPath];
  int v14 = [v13 isEqualToString:@"root.mobileTimer.alarms"];

  if (v14)
  {
    int v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = self;
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v54 = v18;
      __int16 v55 = 2112;
      id v56 = v12;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot update constraints on atomic setting %@", buf, 0x16u);
    }
    uint64_t v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
LABEL_9:
    __int16 v24 = (void *)v19;
    v10[2](v10, v19);
    goto LABEL_31;
  }
  __int16 v24 = [(HMDAccessorySettingsController *)self ownerController];
  if (v24)
  {
    uint64_t v25 = (void *)MEMORY[0x1D9452090]();
    int v26 = self;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      __int16 v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v54 = v28;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Ignoring owner controller for updating constraint.", buf, 0xCu);
    }
  }
  if ([(HMDAccessorySettingsController *)self isProxy])
  {
    id v29 = (void *)MEMORY[0x1D9452090]();
    uint64_t v30 = self;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v54 = v32;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Only the setting owner is allowed to remove constraints.", buf, 0xCu);
    }
    id v33 = [MEMORY[0x1E4F28C58] hmErrorWithCode:10];
    v10[2](v10, (uint64_t)v33);
  }
  else
  {
    id v33 = [v12 modelsForConstraintsUpdate:v8];
    if ([v33 count])
    {
      id v34 = (void *)MEMORY[0x1D9452090]();
      char v35 = self;
      int v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        __int16 v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v54 = v37;
        _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@Updating constraints", buf, 0xCu);
      }
      id v38 = [(HMDAccessorySettingsController *)v35 dataSource];
      int v39 = [v38 backingStore];
      id v40 = +[HMDBackingStoreTransactionOptions defaultPreferencesOptions];
      __int16 v41 = [v39 transaction:@"Update Constraints" options:v40];

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v33 = v33;
      uint64_t v42 = [v33 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v49 != v44) {
              objc_enumerationMutation(v33);
            }
            [v41 add:*(void *)(*((void *)&v48 + 1) + 8 * i)];
          }
          uint64_t v43 = [v33 countByEnumeratingWithState:&v48 objects:v52 count:16];
        }
        while (v43);
      }

      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __80__HMDAccessorySettingsController_onMessageUpdateConstraints_keyPath_completion___block_invoke;
      v46[3] = &unk_1E6A19358;
      v47 = v10;
      [v41 run:v46];
    }
    else
    {
      v10[2](v10, 0);
    }
  }

LABEL_31:
}

uint64_t __80__HMDAccessorySettingsController_onMessageUpdateConstraints_keyPath_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)onMessageRemoveConstraint:(id)a3 keyPath:(id)a4 completion:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v10 = a5;
  int v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  __int16 v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    id v33 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Received remove constraint request %@ for setting %@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v33 = __Block_byref_object_copy__152179;
  id v34 = __Block_byref_object_dispose__152180;
  char v35 = objc_alloc_init(HMDAccessorySettingConstraintModifyOperation);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__HMDAccessorySettingsController_onMessageRemoveConstraint_keyPath_completion___block_invoke;
  aBlock[3] = &unk_1E6A13C10;
  id v15 = v10;
  id v30 = v15;
  id v31 = buf;
  id v16 = _Block_copy(aBlock);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __79__HMDAccessorySettingsController_onMessageRemoveConstraint_keyPath_completion___block_invoke_2;
  __int16 v24 = &unk_1E6A18398;
  uint64_t v25 = v12;
  __int16 v17 = v9;
  int v26 = v17;
  id v18 = v8;
  id v27 = v18;
  id v19 = v16;
  id v28 = v19;
  [*(id *)(*(void *)&buf[8] + 40) setExecutionBlock:&v21];
  id v20 = [(HMDAccessorySettingsController *)v12 constraintModifyOperationQueue];
  [v20 addOperation:*(void *)(*(void *)&buf[8] + 40)];

  _Block_object_dispose(buf, 8);
}

void __79__HMDAccessorySettingsController_onMessageRemoveConstraint_keyPath_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) finish];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __79__HMDAccessorySettingsController_onMessageRemoveConstraint_keyPath_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) settingForKeyPath:*(void *)(a1 + 40)];
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    uint64_t v7 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v47 = v6;
    __int16 v48 = 2112;
    long long v49 = v7;
    __int16 v50 = 2112;
    long long v51 = v2;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Executing remove constraint request %@ for setting %@", buf, 0x20u);
  }
  if (!v2)
  {
    id v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = *(id *)(a1 + 32);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      id v20 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v47 = v19;
      __int16 v48 = 2112;
      long long v49 = v20;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Setting not found for key path %@", buf, 0x16u);
    }
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    goto LABEL_11;
  }
  id v8 = [v2 keyPath];
  int v9 = [v8 isEqualToString:@"root.mobileTimer.alarms"];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v47 = v13;
      __int16 v48 = 2112;
      long long v49 = v2;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot remove constraint on atomic setting %@", buf, 0x16u);
    }
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
LABEL_11:
    uint64_t v21 = (void *)v15;
    (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, v15);
    goto LABEL_26;
  }
  uint64_t v21 = [*(id *)(a1 + 32) ownerController];
  if (v21)
  {
    uint64_t v22 = (void *)MEMORY[0x1D9452090]();
    id v23 = *(id *)(a1 + 32);
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v47 = v25;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Ignoring owner controller for removing constraint.", buf, 0xCu);
    }
  }
  if ([*(id *)(a1 + 32) isProxy])
  {
    int v26 = (void *)MEMORY[0x1D9452090]();
    id v27 = *(id *)(a1 + 32);
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v47 = v29;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Only the setting owner is allowed to remove constraints.", buf, 0xCu);
    }
    uint64_t v30 = *(void *)(a1 + 56);
    id v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:10];
    (*(void (**)(uint64_t, HMDAccessorySettingConstraintModel *))(v30 + 16))(v30, v31);
  }
  else
  {
    if (![v2 canRemoveConstraint:*(void *)(a1 + 48)])
    {
      (*(void (**)(void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 0);
      goto LABEL_26;
    }
    uint64_t v32 = (void *)MEMORY[0x1D9452090]();
    id v33 = *(id *)(a1 + 32);
    id v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      char v35 = HMFGetLogIdentifier();
      uint64_t v36 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v47 = v35;
      __int16 v48 = 2112;
      long long v49 = v36;
      __int16 v50 = 2112;
      long long v51 = v2;
      _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Removing constraint %@ from setting %@", buf, 0x20u);
    }
    __int16 v37 = [HMDAccessorySettingConstraintModel alloc];
    id v38 = [*(id *)(a1 + 48) identifier];
    int v39 = [v2 identifier];
    id v31 = [(HMDBackingStoreModelObject *)v37 initWithObjectChangeType:3 uuid:v38 parentUUID:v39];

    id v40 = [*(id *)(a1 + 32) dataSource];
    __int16 v41 = [v40 backingStore];
    uint64_t v42 = +[HMDBackingStoreTransactionOptions defaultPreferencesOptions];
    uint64_t v43 = [v41 transaction:@"Remove Constraint" options:v42];

    [v43 add:v31];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __79__HMDAccessorySettingsController_onMessageRemoveConstraint_keyPath_completion___block_invoke_135;
    v44[3] = &unk_1E6A19358;
    id v45 = *(id *)(a1 + 56);
    [v43 run:v44];
  }
LABEL_26:
}

uint64_t __79__HMDAccessorySettingsController_onMessageRemoveConstraint_keyPath_completion___block_invoke_135(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)onMessageAddConstraint:(id)a3 keyPath:(id)a4 completion:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  __int16 v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    id v33 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Received add constraint request %@ for setting %@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v33 = __Block_byref_object_copy__152179;
  id v34 = __Block_byref_object_dispose__152180;
  char v35 = objc_alloc_init(HMDAccessorySettingConstraintModifyOperation);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__HMDAccessorySettingsController_onMessageAddConstraint_keyPath_completion___block_invoke;
  aBlock[3] = &unk_1E6A13C10;
  id v15 = v10;
  id v30 = v15;
  id v31 = buf;
  id v16 = _Block_copy(aBlock);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  id v23 = __76__HMDAccessorySettingsController_onMessageAddConstraint_keyPath_completion___block_invoke_2;
  __int16 v24 = &unk_1E6A18398;
  uint64_t v25 = v12;
  id v17 = v9;
  int v26 = v17;
  id v18 = v8;
  id v27 = v18;
  id v19 = v16;
  id v28 = v19;
  [*(id *)(*(void *)&buf[8] + 40) setExecutionBlock:&v21];
  id v20 = [(HMDAccessorySettingsController *)v12 constraintModifyOperationQueue];
  [v20 addOperation:*(void *)(*(void *)&buf[8] + 40)];

  _Block_object_dispose(buf, 8);
}

void __76__HMDAccessorySettingsController_onMessageAddConstraint_keyPath_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) finish];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __76__HMDAccessorySettingsController_onMessageAddConstraint_keyPath_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) settingForKeyPath:*(void *)(a1 + 40)];
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    uint64_t v7 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    int64_t v53 = v6;
    __int16 v54 = 2112;
    __int16 v55 = v7;
    __int16 v56 = 2112;
    uint64_t v57 = v2;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Executing add constraint request %@ for setting %@", buf, 0x20u);
  }
  if (!v2)
  {
    id v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = *(id *)(a1 + 32);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      id v20 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      int64_t v53 = v19;
      __int16 v54 = 2112;
      __int16 v55 = v20;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Setting not found for key path %@", buf, 0x16u);
    }
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    goto LABEL_11;
  }
  id v8 = [v2 keyPath];
  int v9 = [v8 isEqualToString:@"root.mobileTimer.alarms"];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int64_t v53 = v13;
      __int16 v54 = 2112;
      __int16 v55 = v2;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot add constraint on atomic setting %@", buf, 0x16u);
    }
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
LABEL_11:
    uint64_t v21 = (void *)v15;
    (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, v15);
    goto LABEL_28;
  }
  uint64_t v21 = [*(id *)(a1 + 32) ownerController];
  if (v21)
  {
    uint64_t v22 = (void *)MEMORY[0x1D9452090]();
    id v23 = *(id *)(a1 + 32);
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int64_t v53 = v25;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Ignoring owner controller for adding constraint.", buf, 0xCu);
    }
  }
  if ([*(id *)(a1 + 32) isProxy])
  {
    int v26 = (void *)MEMORY[0x1D9452090]();
    id v27 = *(id *)(a1 + 32);
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int64_t v53 = v29;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Only the setting owner is allowed to add constraints.", buf, 0xCu);
    }
    uint64_t v30 = *(void *)(a1 + 56);
    id v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:10];
    (*(void (**)(uint64_t, id))(v30 + 16))(v30, v31);
  }
  else
  {
    uint64_t v32 = *(void *)(a1 + 48);
    id v51 = 0;
    char v33 = [v2 canAddConstraint:v32 error:&v51];
    id v31 = v51;
    id v34 = (void *)MEMORY[0x1D9452090]();
    id v35 = *(id *)(a1 + 32);
    uint64_t v36 = HMFGetOSLogHandle();
    __int16 v37 = v36;
    if (v33)
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        id v38 = HMFGetLogIdentifier();
        int v39 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        int64_t v53 = v38;
        __int16 v54 = 2112;
        __int16 v55 = v39;
        __int16 v56 = 2112;
        uint64_t v57 = v2;
        _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Adding constraint %@ on setting %@", buf, 0x20u);
      }
      id v40 = *(void **)(a1 + 48);
      __int16 v41 = [v2 identifier];
      uint64_t v42 = [v40 modelWithParentIdentifier:v41];

      [v42 setObjectChangeType:1];
      uint64_t v43 = [*(id *)(a1 + 32) dataSource];
      uint64_t v44 = [v43 backingStore];
      id v45 = +[HMDBackingStoreTransactionOptions defaultPreferencesOptions];
      uint64_t v46 = [v44 transaction:@"Add Constraint" options:v45];

      [v46 add:v42];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __76__HMDAccessorySettingsController_onMessageAddConstraint_keyPath_completion___block_invoke_130;
      v49[3] = &unk_1E6A19358;
      id v50 = *(id *)(a1 + 56);
      [v46 run:v49];
    }
    else
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v47 = HMFGetLogIdentifier();
        __int16 v48 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138544130;
        int64_t v53 = v47;
        __int16 v54 = 2112;
        __int16 v55 = v48;
        __int16 v56 = 2112;
        uint64_t v57 = v2;
        __int16 v58 = 2112;
        id v59 = v31;
        _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@Constraint %@ cannot be added to setting %@. error: %@", buf, 0x2Au);
      }
      (*(void (**)(void, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v31);
    }
  }

LABEL_28:
}

uint64_t __76__HMDAccessorySettingsController_onMessageAddConstraint_keyPath_completion___block_invoke_130(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_runUpdateTransactionWithValue:(id)a3 setting:(id)a4 completion:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v36 = a5;
  id v10 = [(HMDAccessorySettingsController *)self delegate];
  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  __int16 v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    uint64_t v15 = [v9 value];
    *(_DWORD *)buf = 138544130;
    uint64_t v42 = v14;
    __int16 v43 = 2112;
    id v44 = v9;
    __int16 v45 = 2112;
    uint64_t v46 = v15;
    __int16 v47 = 2112;
    id v48 = v8;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating %@ value from %@ to %@", buf, 0x2Au);
  }
  uint64_t v16 = [v10 isMultiUserEnabledForAccessorySettingsController:v12];
  id v17 = [v10 supportedMultiUserLanguageCodesForAccessorySettingsController:v12];
  LODWORD(v16) = [v9 shouldTurnOffPersonalRequestsOnLanguageChangeTo:v8 supportedMultiUserLanguageCodes:v17 isMultiUserEnabled:v16];

  if (v16)
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    id v19 = v12;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v21;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Will remove owner from access control on language change.", buf, 0xCu);
    }
    uint64_t v22 = [v10 assistantAccessControlModelWithRemovedAccessoriesForAccessorySettingsController:v19];
  }
  else
  {
    uint64_t v22 = 0;
  }
  id v23 = [HMDAccessorySettingModel alloc];
  __int16 v24 = [v9 identifier];
  uint64_t v25 = [v9 parentIdentifier];
  int v26 = [(HMDBackingStoreModelObject *)v23 initWithObjectChangeType:2 uuid:v24 parentUUID:v25];

  id v27 = encodeRootObject();
  [(HMDAccessorySettingModel *)v26 setValue:v27];

  uint64_t v28 = [v9 configurationVersion] + 1;
  id v29 = [NSNumber numberWithUnsignedInteger:v28];
  [(HMDAccessorySettingModel *)v26 setConfigurationVersion:v29];

  uint64_t v30 = [(HMDAccessorySettingsController *)v12 dataSource];
  id v31 = [v30 backingStore];
  uint64_t v32 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  char v33 = [v31 transaction:@"Update Setting Value" options:v32];

  [v33 add:v26];
  if (v22) {
    [v33 add:v22];
  }
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __84__HMDAccessorySettingsController__runUpdateTransactionWithValue_setting_completion___block_invoke;
  v37[3] = &unk_1E6A13BE8;
  id v38 = v8;
  id v39 = v36;
  uint64_t v40 = v28;
  id v34 = v8;
  id v35 = v36;
  [v33 run:v37];
}

uint64_t __84__HMDAccessorySettingsController__runUpdateTransactionWithValue_setting_completion___block_invoke(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(a1[5] + 16))(a1[5], a1[4], a1[6], a2);
}

- (void)_updateValue:(id)a3 forSetting:(id)a4 senderVersion:(id)a5 senderProductClass:(int64_t)a6 completion:(id)a7
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = [(HMDAccessorySettingsController *)self workQueue];
  dispatch_assert_queue_V2(v16);

  id v17 = [(HMDAccessorySettingsController *)self ownerController];
  if (!v17
    || ([v13 keyPath],
        id v18 = objc_claimAutoreleasedReturnValue(),
        [v17 settingForKeyPath:v18],
        id v19 = objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        !v19))
  {
    uint64_t v25 = [(HMDAccessorySettingsController *)self delegate];
    if ([(HMDAccessorySettingsController *)self isProxy])
    {
      if (a6 == 6)
      {
        int v26 = (void *)MEMORY[0x1D9452090]();
        id v27 = self;
        uint64_t v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          id v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v70 = v29;
          __int16 v71 = 2112;
          id v72 = v13;
          _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Cannot relay update value on setting(%@) to a second AudioAccessory", buf, 0x16u);
        }
        uint64_t v30 = [(HMDAccessorySettingsController *)v27 factory];
        [v30 assertWithCondition:0 message:@"Cannot reforward settings update value to a second homepod"];

        id v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1 description:@"Cannot relay to an AudioAccessory multiple times" reason:@"Failed to handle relay." suggestion:0];
        (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0, 0, v31);
        goto LABEL_19;
      }
      id v53 = v14;
      uint64_t v40 = [v13 identifier];
      id v31 = [v25 remoteMessageDestinationForAccessorySettingsController:self target:v40];

      __int16 v41 = (void *)MEMORY[0x1D9452090]();
      uint64_t v42 = self;
      __int16 v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        id v44 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v70 = v44;
        __int16 v71 = 2112;
        id v72 = v31;
        _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_INFO, "%{public}@Forwarding update value message to owner device %@.", buf, 0x16u);
      }
      __int16 v45 = [(HMDAccessorySettingsController *)v42 messageHandler];
      uint64_t v46 = [v13 keyPath];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __102__HMDAccessorySettingsController__updateValue_forSetting_senderVersion_senderProductClass_completion___block_invoke_117;
      v58[3] = &unk_1E6A13BC0;
      id v61 = v15;
      id v59 = v13;
      uint64_t v60 = v42;
      [v45 relayUpdateValue:v12 keyPath:v46 destination:v31 completion:v58];

      id v39 = v61;
    }
    else
    {
      uint64_t v32 = [(HMDAccessorySettingsController *)self legacySettingsAdaptor];
      if (!v32)
      {
        id v47 = v14;
        [v13 value];
        v49 = id v48 = v12;
        int v50 = HMFEqualObjects();

        if (v50)
        {
          (*((void (**)(id, id, uint64_t, void))v15 + 2))(v15, v48, [v13 configurationVersion], 0);
          id v31 = 0;
          id v12 = v48;
          id v14 = v47;
        }
        else
        {
          id v14 = v47;
          if (objc_msgSend(v13, "shouldBlockSettingUpdateFromVersion:isMultiUserEnabled:", v47, objc_msgSend(v25, "isMultiUserEnabledForAccessorySettingsController:", self)))
          {
            id v51 = [MEMORY[0x1E4F28C58] hmErrorWithCode:10];
            (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0, 0, v51);

            id v31 = 0;
            id v12 = v48;
          }
          else
          {
            id v12 = v48;
            [(HMDAccessorySettingsController *)self _runUpdateTransactionWithValue:v48 setting:v13 completion:v15];
            id v31 = 0;
          }
        }
        goto LABEL_19;
      }
      id v31 = (void *)v32;
      uint64_t v52 = v12;
      id v53 = v14;
      char v33 = (void *)MEMORY[0x1D9452090]();
      id v34 = self;
      id v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        id v36 = HMFGetLogIdentifier();
        __int16 v37 = [v13 keyPath];
        *(_DWORD *)buf = 138543618;
        v70 = v36;
        __int16 v71 = 2114;
        id v72 = v37;
        _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@Delegating update for %{public}@ to adaptor", buf, 0x16u);
      }
      id v38 = [v13 keyPath];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __102__HMDAccessorySettingsController__updateValue_forSetting_senderVersion_senderProductClass_completion___block_invoke_122;
      v54[3] = &unk_1E6A19A28;
      v54[4] = v34;
      id v55 = v13;
      id v56 = v52;
      id v57 = v15;
      [v31 updateSettingWithKeyPath:v38 settingValue:v56 completion:v54];

      id v12 = v52;
      id v39 = v55;
    }

    id v14 = v53;
LABEL_19:

    goto LABEL_20;
  }
  id v20 = (void *)MEMORY[0x1D9452090]();
  uint64_t v21 = self;
  uint64_t v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v70 = v23;
    __int16 v71 = 2112;
    id v72 = v13;
    __int16 v73 = 2112;
    uint64_t v74 = v17;
    _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Forwarding update value for %@ to owner controller. %@", buf, 0x20u);
  }
  __int16 v24 = [v17 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__HMDAccessorySettingsController__updateValue_forSetting_senderVersion_senderProductClass_completion___block_invoke;
  block[3] = &unk_1E6A13B98;
  id v63 = v17;
  id v64 = v12;
  id v65 = v13;
  id v66 = v14;
  int64_t v68 = a6;
  id v67 = v15;
  dispatch_async(v24, block);

  uint64_t v25 = v63;
LABEL_20:
}

void __102__HMDAccessorySettingsController__updateValue_forSetting_senderVersion_senderProductClass_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) keyPath];
  [v2 _onMessageUpdateValue:v3 settingKeyPath:v4 senderVersion:*(void *)(a1 + 56) senderProductClass:*(void *)(a1 + 72) completion:*(void *)(a1 + 64)];
}

void __102__HMDAccessorySettingsController__updateValue_forSetting_senderVersion_senderProductClass_completion___block_invoke_117(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if ([*(id *)(a1 + 32) configurationVersion] >= a3)
    {
      id v18 = (void *)MEMORY[0x1D9452090]();
      id v19 = *(id *)(a1 + 40);
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        uint64_t v22 = [*(id *)(a1 + 32) configurationVersion];
        int v26 = 138543874;
        id v27 = v21;
        __int16 v28 = 2048;
        unint64_t v29 = a3;
        __int16 v30 = 2048;
        uint64_t v31 = v22;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Not changing locally as the new config version isnt higher %tu (current %tu)", (uint8_t *)&v26, 0x20u);
      }
    }
    else
    {
      id v10 = [*(id *)(a1 + 32) value];
      char v11 = HMFEqualObjects();

      id v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = *(id *)(a1 + 40);
      id v14 = HMFGetOSLogHandle();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
      if (v11)
      {
        if (v15)
        {
          uint64_t v16 = HMFGetLogIdentifier();
          id v17 = [*(id *)(a1 + 32) value];
          int v26 = 138543618;
          id v27 = v16;
          __int16 v28 = 2112;
          unint64_t v29 = (unint64_t)v17;
          _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Not updating the value from %@ as the new value is same", (uint8_t *)&v26, 0x16u);
        }
      }
      else
      {
        if (v15)
        {
          id v23 = HMFGetLogIdentifier();
          __int16 v24 = [*(id *)(a1 + 32) value];
          int v26 = 138543874;
          id v27 = v23;
          __int16 v28 = 2112;
          unint64_t v29 = (unint64_t)v24;
          __int16 v30 = 2112;
          uint64_t v31 = (uint64_t)v7;
          _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Updating the value locally from %@ to %@", (uint8_t *)&v26, 0x20u);
        }
        [*(id *)(a1 + 32) setValue:v7];
      }
      uint64_t v25 = [*(id *)(a1 + 40) delegate];
      [v25 accessorySettingsController:*(void *)(a1 + 40) saveWithReason:@"Update value from remote"];
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v9();
}

void __102__HMDAccessorySettingsController__updateValue_forSetting_senderVersion_senderProductClass_completion___block_invoke_122(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) keyPath];
    int v11 = 138543874;
    id v12 = v7;
    __int16 v13 = 2114;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Adaptor update result keyPath:%{public}@ error: %@", (uint8_t *)&v11, 0x20u);
  }
  if (v3)
  {
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    (*(void (**)(uint64_t, void, void, void *))(v9 + 16))(v9, 0, 0, v10);
  }
  else
  {
    [*(id *)(a1 + 32) _runUpdateTransactionWithValue:*(void *)(a1 + 48) setting:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
  }
}

- (void)_onMessageUpdateValue:(id)a3 settingKeyPath:(id)a4 senderVersion:(id)a5 senderProductClass:(int64_t)a6 completion:(id)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = [(HMDAccessorySettingsController *)self workQueue];
  dispatch_assert_queue_V2(v16);

  uint64_t v17 = [(HMDAccessorySettingsController *)self settingForKeyPath:v13];
  if (v17)
  {
    [(HMDAccessorySettingsController *)self _updateValue:v12 forSetting:v17 senderVersion:v14 senderProductClass:a6 completion:v15];
  }
  else
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    id v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      int v23 = 138543618;
      __int16 v24 = v21;
      __int16 v25 = 2112;
      id v26 = v13;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Setting not found for keyPath %@", (uint8_t *)&v23, 0x16u);
    }
    uint64_t v22 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0, 0, v22);
  }
}

- (void)onMessageUpdateValue:(id)a3 settingKeyPath:(id)a4 senderVersion:(id)a5 senderProductClass:(int64_t)a6 completion:(id)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = [(HMDAccessorySettingsController *)self workQueue];
  dispatch_assert_queue_V2(v16);

  uint64_t v17 = [(HMDAccessorySettingsController *)self settingForKeyPath:v13];
  if (v17)
  {
    [(HMDAccessorySettingsController *)self _updateValue:v12 forSetting:v17 senderVersion:v14 senderProductClass:a6 completion:v15];
  }
  else
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    id v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      int v23 = 138543618;
      __int16 v24 = v21;
      __int16 v25 = 2112;
      id v26 = v13;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Setting not found for key path %@", (uint8_t *)&v23, 0x16u);
    }
    uint64_t v22 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0, 0, v22);
  }
}

- (void)onMessageUpdateValue:(id)a3 settingIdentifier:(id)a4 senderVersion:(id)a5 senderProductClass:(int64_t)a6 completion:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = [(HMDAccessorySettingsController *)self workQueue];
  dispatch_assert_queue_V2(v16);

  uint64_t v17 = [(HMDAccessorySettingsController *)self settingsMap];
  id v18 = [v17 objectForKey:v13];

  if (v18)
  {
    [(HMDAccessorySettingsController *)self _updateValue:v12 forSetting:v18 senderVersion:v14 senderProductClass:a6 completion:v15];
  }
  else
  {
    id v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = self;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      int v24 = 138543618;
      __int16 v25 = v22;
      __int16 v26 = 2112;
      id v27 = v13;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Setting not found for identifier %@", (uint8_t *)&v24, 0x16u);
    }
    int v23 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0, 0, v23);
  }
}

- (id)groupForKeyPath:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessorySettingsController *)self groupsMap];
  id v6 = (void *)[v5 copy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = objc_msgSend(v7, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * v11), (void)v16);
      id v13 = [v12 keyPath];
      char v14 = [v13 isEqualToString:v4];

      if (v14) {
        break;
      }

      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v12 = 0;
  }

  return v12;
}

- (id)settingForKeyPath:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessorySettingsController *)self settingsMap];
  id v6 = (void *)[v5 copy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = objc_msgSend(v7, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * v11), (void)v16);
      id v13 = [v12 keyPath];
      char v14 = [v13 isEqualToString:v4];

      if (v14) {
        break;
      }

      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v12 = 0;
  }

  return v12;
}

- (BOOL)haveGroupWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessorySettingsController *)self groupsMap];
  id v6 = (void *)[v5 copy];
  id v7 = [v6 objectForKey:v4];

  return v7 != 0;
}

- (void)owner:(id)a3 didUpdateSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDAccessorySettingsController *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__HMDAccessorySettingsController_owner_didUpdateSettings___block_invoke;
  block[3] = &unk_1E6A19668;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __58__HMDAccessorySettingsController_owner_didUpdateSettings___block_invoke(id *a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = a1[4];
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = a1[5];
    *(_DWORD *)buf = 138543618;
    id v51 = v5;
    __int16 v52 = 2112;
    id v53 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Owner %@ sent fix settings request", buf, 0x16u);
  }
  id v7 = [a1[4] dataSource];
  uint64_t v8 = [v7 backingStore];
  id v9 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  __int16 v43 = [v8 transaction:@"fixupAccessorySetting" options:v9];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v10 = a1[6];
  uint64_t v45 = [v10 countByEnumeratingWithState:&v46 objects:v60 count:16];
  if (v45)
  {
    char v12 = 0;
    uint64_t v44 = *(void *)v47;
    *(void *)&long long v11 = 138544130;
    long long v40 = v11;
    id v42 = v10;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v47 != v44) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        id v15 = objc_msgSend(a1[4], "settingForKeyPath:", v14, v40);
        if (v15)
        {
          long long v16 = [a1[6] objectForKeyedSubscript:v14];
          long long v17 = [MEMORY[0x1E4F1CA98] null];
          int v18 = [v16 isEqual:v17];

          if (v18)
          {

            long long v16 = 0;
          }
          long long v19 = [v15 value];
          char v20 = HMFEqualObjects();

          if ((v20 & 1) == 0)
          {
            uint64_t v21 = (void *)MEMORY[0x1D9452090]();
            id v22 = a1[4];
            int v23 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              int v24 = v41 = v21;
              id v25 = a1[5];
              __int16 v26 = [v15 value];
              *(_DWORD *)buf = 138544386;
              id v51 = v24;
              __int16 v52 = 2112;
              id v53 = v15;
              __int16 v54 = 2112;
              id v55 = v25;
              __int16 v56 = 2112;
              id v57 = v26;
              __int16 v58 = 2112;
              id v59 = v16;
              _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Comparing between %@ and owner %@, Values are not matching: %@, %@", buf, 0x34u);

              uint64_t v21 = v41;
            }

            id v27 = [a1[4] factory];
            uint64_t v28 = [v15 identifier];
            unint64_t v29 = [v15 parentIdentifier];
            __int16 v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "configurationVersion") + 1);
            uint64_t v31 = [v27 settingModelForUpdateWithIdentifier:v28 parent:v29 value:v16 configNumber:v30];

            [v43 add:v31];
            char v12 = 1;
            id v10 = v42;
          }
          if ([v15 isCollectionType])
          {
            uint64_t v32 = [a1[5] settingForKeyPath:v14];
            char v33 = [v32 constraints];

            id v34 = +[HMDAccessorySettingTransform modelsForChangedConstraints:v33 fromSetting:v15];
            if ([v34 count])
            {
              id v35 = (void *)MEMORY[0x1D9452090]();
              id v36 = a1[4];
              __int16 v37 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                id v38 = HMFGetLogIdentifier();
                id v39 = a1[5];
                *(_DWORD *)buf = v40;
                id v51 = v38;
                __int16 v52 = 2112;
                id v53 = v34;
                __int16 v54 = 2112;
                id v55 = v15;
                __int16 v56 = 2112;
                id v57 = v39;
                _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Added constraints %@ in fixup %@ and owner %@.", buf, 0x2Au);
              }
              [v43 addObjects:v34];
              char v12 = 1;
              id v10 = v42;
            }
          }
        }
      }
      uint64_t v45 = [v10 countByEnumeratingWithState:&v46 objects:v60 count:16];
    }
    while (v45);

    if (v12) {
      [v43 run];
    }
  }
  else
  {
  }
}

- (void)scheduleDependantFixup
{
  if ([(HMDAccessorySettingsController *)self isSettingOwner])
  {
    if ([(HMDAccessorySettingsController *)self hasDependants])
    {
      id v3 = [(HMDAccessorySettingsController *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__HMDAccessorySettingsController_scheduleDependantFixup__block_invoke;
      block[3] = &unk_1E6A19B30;
      void block[4] = self;
      dispatch_async(v3, block);
    }
  }
}

void __56__HMDAccessorySettingsController_scheduleDependantFixup__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) dependantControllers];
    int v17 = 138543618;
    int v18 = v5;
    __int16 v19 = 2112;
    char v20 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received request to fix settings for dependents: %@", (uint8_t *)&v17, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) fixupSettingsTimer];

  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      long long v11 = HMFGetLogIdentifier();
      int v17 = 138543362;
      int v18 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@There is already an fix setting request in queue, kicking it again", (uint8_t *)&v17, 0xCu);
    }
    char v12 = [*(id *)(a1 + 32) fixupSettingsTimer];
    [v12 kick];
  }
  else
  {
    id v13 = [*(id *)(a1 + 32) factory];
    uint64_t v14 = [v13 timerWithReason:2 interval:3.0];
    [*(id *)(a1 + 32) setFixupSettingsTimer:v14];

    id v15 = *(void **)(a1 + 32);
    long long v16 = [v15 fixupSettingsTimer];
    [v16 setDelegate:v15];

    char v12 = [*(id *)(a1 + 32) fixupSettingsTimer];
    [v12 resume];
  }
}

- (void)_performDependantFixup
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessorySettingsController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDAccessorySettingsController *)self rootGroup];
  id v5 = +[HMDSettingAlgorithm allSettingsFromRootGroup:v4];

  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v13 = [v12 value];
        if (v13) {
          [v12 value];
        }
        else {
        uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
        }
        id v15 = [v12 keyPath];
        [v6 setObject:v14 forKeyedSubscript:v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v9);
  }

  long long v16 = (void *)MEMORY[0x1D9452090]();
  int v17 = self;
  int v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    __int16 v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v35 = v19;
    __int16 v36 = 2112;
    __int16 v37 = v6;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Performing dependent fixup with %@", buf, 0x16u);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  char v20 = [(HMDAccessorySettingsController *)v17 dependantControllers];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * j) owner:v17 didUpdateSettings:v6];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v22);
  }
}

- (void)_removeDependant:(id)a3
{
  id v6 = a3;
  id v4 = [(HMDAccessorySettingsController *)self workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(HMDAccessorySettingsController *)self dependantControllers];
  [v5 removeObject:v6];

  [v6 didBecomeIndependantOwner];
}

- (id)mergeWithSettingsMetadata:(id)a3
{
  id v4 = [a3 rootGroup];
  id v5 = [(HMDAccessorySettingsController *)self rootGroup];
  id v6 = +[HMDAccessorySettingTransform mergeWithGroupMetadata:v4 group:v5];

  return v6;
}

- (void)_migrateSettingsWithCompletion:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessorySettingsController *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    char v33 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Check if migration is required.", buf, 0xCu);
  }
  uint64_t v10 = [(HMDAccessorySettingsController *)v7 dataSource];
  long long v11 = [v10 modelsToMigrateSettingsForController:v7];
  char v12 = v11;
  if (v11 && [v11 count])
  {
    id v13 = (void *)MEMORY[0x1D9452090]();
    uint64_t v14 = v7;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      char v33 = v16;
      __int16 v34 = 2112;
      id v35 = v12;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Have settings to migrate. %@", buf, 0x16u);
    }
    int v17 = [v10 backingStore];
    int v18 = +[HMDBackingStoreTransactionOptions defaultPreferencesOptions];
    __int16 v19 = [v17 transaction:@"updateRootGroup" options:v18];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v20 = v12;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v28;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(v20);
          }
          [v19 add:*(void *)(*((void *)&v27 + 1) + 8 * v24++)];
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v22);
    }

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __65__HMDAccessorySettingsController__migrateSettingsWithCompletion___block_invoke;
    v25[3] = &unk_1E6A17D78;
    v25[4] = v14;
    id v26 = v4;
    [v19 run:v25];
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __65__HMDAccessorySettingsController__migrateSettingsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Finished migrating settings.", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, 1);
  }
}

- (void)_createSettings
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessorySettingsController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v39 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Is setting migration owner will create settings.", buf, 0xCu);
  }
  uint64_t v8 = [(HMDAccessorySettingsController *)v5 dataSource];
  int v9 = [(HMDAccessorySettingsController *)v5 parentUUID];
  uint64_t v10 = [v8 modelsToMakeSettingsForController:v5 parentUUID:v9];

  if (v10)
  {
    [(HMDAccessorySettingsController *)v5 setHasCreatedUnprocessedRootGroup:1];
    uint64_t v11 = [v8 backingStore];
    char v12 = NSString;
    id v13 = [(HMDAccessorySettingsController *)v5 parentUUID];
    uint64_t v14 = [v12 stringWithFormat:@"addRootSettings-%@", v13];
    id v15 = +[HMDBackingStoreTransactionOptions defaultPreferencesOptions];
    long long v16 = [v11 transaction:v14 options:v15];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v17 = v10;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(v17);
          }
          [v16 add:*(void *)(*((void *)&v33 + 1) + 8 * i) withMessage:0];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v19);
    }

    logger = v5->_logger;
    if (os_signpost_enabled(logger))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D49D5000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SettingsCreate", "", buf, 2u);
    }
    uint64_t v23 = [v8 currentAccessorySetupMetricDispatcher];
    [v23 markSetupBeginStage:5 error:0];

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __49__HMDAccessorySettingsController__createSettings__block_invoke;
    v30[3] = &unk_1E6A17040;
    v30[4] = v5;
    id v24 = v8;
    id v31 = v24;
    unint64_t v32 = 0xEEEEB0B5B2B2EEEELL;
    [v16 run:v30];
    long long v25 = [v24 setupActivity];
    [v25 markWithReason:@"HMDAccessorySettingsController._createSettings.complete"];
  }
  else
  {
    id v26 = (void *)MEMORY[0x1D9452090]();
    long long v27 = v5;
    long long v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      long long v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v29;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Did not find any models to create settings.", buf, 0xCu);
    }
  }
}

void __49__HMDAccessorySettingsController__createSettings__block_invoke(uint64_t a1, void *a2)
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    int v34 = 138543362;
    long long v35 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Finished creating settings.", (uint8_t *)&v34, 0xCu);
  }
  uint64_t v8 = [*(id *)(a1 + 40) setupActivity];
  v38[0] = @"error.code";
  int v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "code"));
  v38[1] = @"domain";
  v39[0] = v9;
  uint64_t v10 = [v3 domain];
  uint64_t v11 = (void *)v10;
  char v12 = &stru_1F2C9F1A8;
  if (v10) {
    char v12 = (__CFString *)v10;
  }
  v39[1] = v12;
  id v13 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];

  uint64_t v14 = [*(id *)(a1 + 40) setupActivity];
  [v14 end];

  id v15 = *(id *)(*(void *)(a1 + 32) + 16);
  long long v16 = v15;
  os_signpost_id_t v17 = *(void *)(a1 + 48);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(v34) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D49D5000, v16, OS_SIGNPOST_INTERVAL_END, v17, "SettingsCreate", "", (uint8_t *)&v34, 2u);
  }

  uint64_t v18 = (void *)MEMORY[0x1D9452090]();
  id v19 = *(id *)(a1 + 32);
  uint64_t v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = HMFGetLogIdentifier();
    [*(id *)(a1 + 40) setupStartTimestamp];
    int v34 = 138543618;
    long long v35 = v21;
    __int16 v36 = 2048;
    double v37 = v22;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Setup start timestamp %f", (uint8_t *)&v34, 0x16u);
  }
  __uint64_t v23 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v24 = [*(id *)(a1 + 40) setupStartTimestamp];
  double v26 = v25;
  long long v27 = (void *)MEMORY[0x1D9452090](v24);
  id v28 = *(id *)(a1 + 32);
  long long v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    double v30 = (double)(v23 / 0x3B9ACA00) - v26;
    if (v30 >= 0.0) {
      double v31 = (double)(v23 / 0x3B9ACA00) - v26;
    }
    else {
      double v31 = -v30;
    }
    unint64_t v32 = HMFGetLogIdentifier();
    int v34 = 138543618;
    long long v35 = v32;
    __int16 v36 = 2048;
    double v37 = v31;
    _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Settings creation latency %f", (uint8_t *)&v34, 0x16u);
  }
  [*(id *)(a1 + 40) setSetupStartTimestamp:0.0];
  long long v33 = [*(id *)(a1 + 40) currentAccessorySetupMetricDispatcher];
  [v33 markSetupEndStage:5 error:v3];
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessorySettingsController *)self workQueue];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __47__HMDAccessorySettingsController_timerDidFire___block_invoke;
  uint64_t v11 = &unk_1E6A197C8;
  char v12 = self;
  id v6 = v4;
  id v13 = v6;
  dispatch_async(v5, &v8);

  id v7 = [(HMDAccessorySettingsController *)self languageChangeDebounceTimer];

  if (v7 == v6) {
    [(HMDAccessorySettingsController *)self handleLanguageChangeTimerFired];
  }
}

void __47__HMDAccessorySettingsController_timerDidFire___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) fixupSettingsTimer];
  id v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = *(id *)(a1 + 32);
    char v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      id v15 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Fix settings timer has fired, issuing fix settings", (uint8_t *)&v14, 0xCu);
    }
    [*(id *)(a1 + 32) _performDependantFixup];
    [*(id *)(a1 + 32) setFixupSettingsTimer:0];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) auditSettingsTimer];
    id v5 = *(void **)(a1 + 40);

    if (v4 == v5)
    {
      id v6 = (void *)MEMORY[0x1D9452090]();
      id v7 = *(id *)(a1 + 32);
      uint64_t v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = HMFGetLogIdentifier();
        int v14 = 138543362;
        id v15 = v9;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Audit settings timer has fired, issuing audit for settings", (uint8_t *)&v14, 0xCu);
      }
      [*(id *)(a1 + 32) _performSettingsAudit];
      [*(id *)(a1 + 32) setAuditSettingsTimer:0];
    }
  }
}

- (void)_reevaluateDependantSettings
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessorySettingsController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDAccessorySettingsController *)self isSettingOwner]) {
    [(HMDAccessorySettingsController *)self scheduleDependantFixup];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(HMDAccessorySettingsController *)self dependantControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        uint64_t v10 = [(HMDAccessorySettingsController *)self _keyPathsForSettings];
        [v9 didChangeDependantSettings:self ownerSettingsKeyPaths:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_performSettingsAudit
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessorySettingsController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if (![(HMDAccessorySettingsController *)self hasDependants])
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    uint64_t v5 = self;
    uint64_t v6 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:

      return;
    }
    uint64_t v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v13 = v7;
    uint64_t v8 = "%{public}@No longer setting owner or don't have dependents not auditing.";
    uint64_t v9 = v6;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
    _os_log_impl(&dword_1D49D5000, v9, v10, v8, buf, 0xCu);

    goto LABEL_9;
  }
  if ([(HMDAccessorySettingsController *)self isMigrationOwner])
  {
    if (![(HMDAccessorySettingsController *)self hasCreatedUnprocessedRootGroup])
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __55__HMDAccessorySettingsController__performSettingsAudit__block_invoke;
      v11[3] = &unk_1E6A18288;
      v11[4] = self;
      [(HMDAccessorySettingsController *)self _migrateSettingsWithCompletion:v11];
      return;
    }
    id v4 = (void *)MEMORY[0x1D9452090]();
    uint64_t v5 = self;
    uint64_t v6 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    uint64_t v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v13 = v7;
    uint64_t v8 = "%{public}@Not performing audit as the root group has been created but not processed yet";
    uint64_t v9 = v6;
    os_log_type_t v10 = OS_LOG_TYPE_INFO;
    goto LABEL_8;
  }
  [(HMDAccessorySettingsController *)self _reevaluateDependantSettings];
}

void __55__HMDAccessorySettingsController__performSettingsAudit__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__HMDAccessorySettingsController__performSettingsAudit__block_invoke_2;
    block[3] = &unk_1E6A19B30;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v3, block);
  }
}

uint64_t __55__HMDAccessorySettingsController__performSettingsAudit__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reevaluateDependantSettings];
}

- (void)scheduleAuditWithReason:(unint64_t)a3 from:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HMDAccessorySettingsController *)self ownerController];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 scheduleAuditWithReason:a3 from:v6];
  }
  else
  {
    uint64_t v9 = [(HMDAccessorySettingsController *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__HMDAccessorySettingsController_scheduleAuditWithReason_from___block_invoke;
    block[3] = &unk_1E6A16D78;
    void block[4] = self;
    unint64_t v12 = a3;
    id v11 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __63__HMDAccessorySettingsController_scheduleAuditWithReason_from___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    id v6 = HMDAccessorySettingsAuditReasonAsString(*(void *)(a1 + 48));
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 138543874;
    os_log_type_t v10 = v5;
    __int16 v11 = 2112;
    unint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received audit with reason %@ from %@", (uint8_t *)&v9, 0x20u);
  }
  return [*(id *)(a1 + 32) _scheduleAuditWithReason:*(void *)(a1 + 48)];
}

- (void)_scheduleAuditWithReason:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1D9452090](self, a2);
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v9 = HMDAccessorySettingsAuditReasonAsString(a3);
    int v23 = 138543618;
    uint64_t v24 = v8;
    __int16 v25 = 2112;
    double v26 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Received audit with reason %@", (uint8_t *)&v23, 0x16u);
  }
  if ([(HMDAccessorySettingsController *)v6 hasCreatedUnprocessedRootGroup])
  {
    os_log_type_t v10 = (void *)MEMORY[0x1D9452090]();
    __int16 v11 = v6;
    unint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      int v23 = 138543362;
      uint64_t v24 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Not scheduling audit as the root group has been created but not processed yet", (uint8_t *)&v23, 0xCu);
    }
  }
  else
  {
    uint64_t v14 = [(HMDAccessorySettingsController *)v6 auditSettingsTimer];

    if (v14)
    {
      uint64_t v15 = (void *)MEMORY[0x1D9452090]();
      uint64_t v16 = v6;
      os_signpost_id_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        int v23 = 138543362;
        uint64_t v24 = v18;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@There is already an fix setting request in queue, kicking it again", (uint8_t *)&v23, 0xCu);
      }
      id v19 = [(HMDAccessorySettingsController *)v16 auditSettingsTimer];
      [v19 kick];
    }
    else
    {
      uint64_t v20 = [(HMDAccessorySettingsController *)v6 factory];
      uint64_t v21 = [v20 timerWithReason:1 interval:15.0];
      [(HMDAccessorySettingsController *)v6 setAuditSettingsTimer:v21];

      double v22 = [(HMDAccessorySettingsController *)v6 auditSettingsTimer];
      [v22 setDelegate:v6];

      id v19 = [(HMDAccessorySettingsController *)v6 auditSettingsTimer];
      [v19 resume];
    }
  }
}

- (void)settingsHierarchyDidChange
{
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__152179;
  v18[4] = __Block_byref_object_dispose__152180;
  id v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  void v16[3] = __Block_byref_object_copy__152179;
  v16[4] = __Block_byref_object_dispose__152180;
  id v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__152179;
  v14[4] = __Block_byref_object_dispose__152180;
  id v15 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__152179;
  v12[4] = __Block_byref_object_dispose__152180;
  id v13 = 0;
  p_lock = &self->_lock;
  uint64_t v4 = os_unfair_lock_lock_with_options();
  uint64_t v5 = (void *)MEMORY[0x1D9452090](v4);
  rootGroup = self->_rootGroup;
  groupsMap = self->_groupsMap;
  settingsMap = self->_settingsMap;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__HMDAccessorySettingsController_settingsHierarchyDidChange__block_invoke;
  v11[3] = &unk_1E6A13B48;
  v11[4] = self;
  void v11[5] = v18;
  v11[6] = v16;
  v11[7] = v14;
  v11[8] = v12;
  +[HMDSettingAlgorithm findChangedSettingsWithRootGroup:rootGroup currentGroups:groupsMap currentSettings:settingsMap completion:v11];
  os_unfair_lock_unlock(p_lock);
  int v9 = [(HMDAccessorySettingsController *)self workQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__HMDAccessorySettingsController_settingsHierarchyDidChange__block_invoke_2;
  v10[3] = &unk_1E6A13B70;
  v10[4] = self;
  v10[5] = v18;
  v10[6] = v16;
  v10[7] = v14;
  v10[8] = v12;
  dispatch_async(v9, v10);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
}

void __60__HMDAccessorySettingsController_settingsHierarchyDidChange__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v19 = [v16 countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v68;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v68 != v21) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(a1 + 32) _didAddSetting:*(void *)(*((void *)&v67 + 1) + 8 * v22++)];
      }
      while (v20 != v22);
      uint64_t v20 = [v16 countByEnumeratingWithState:&v67 objects:v74 count:16];
    }
    while (v20);
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v23 = v18;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v64;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v64 != v26) {
          objc_enumerationMutation(v23);
        }
        [*(id *)(a1 + 32) _didRemoveSetting:*(void *)(*((void *)&v63 + 1) + 8 * v27++)];
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v63 objects:v73 count:16];
    }
    while (v25);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v28 = v15;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v59 objects:v72 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v60;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v60 != v31) {
          objc_enumerationMutation(v28);
        }
        [*(id *)(a1 + 32) _didAddGroup:*(void *)(*((void *)&v59 + 1) + 8 * v32++)];
      }
      while (v30 != v32);
      uint64_t v30 = [v28 countByEnumeratingWithState:&v59 objects:v72 count:16];
    }
    while (v30);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v33 = v17;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v55 objects:v71 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v56;
    do
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v56 != v36) {
          objc_enumerationMutation(v33);
        }
        objc_msgSend(*(id *)(a1 + 32), "_didRemoveGroup:", *(void *)(*((void *)&v55 + 1) + 8 * v37++), (void)v55);
      }
      while (v35 != v37);
      uint64_t v35 = [v33 countByEnumeratingWithState:&v55 objects:v71 count:16];
    }
    while (v35);
  }

  uint64_t v38 = *(void *)(a1 + 32);
  uint64_t v39 = *(void **)(v38 + 40);
  *(void *)(v38 + 40) = v14;
  id v40 = v14;

  uint64_t v41 = *(void *)(a1 + 32);
  id v42 = *(void **)(v41 + 32);
  *(void *)(v41 + 32) = v13;
  id v43 = v13;

  uint64_t v44 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v45 = *(void **)(v44 + 40);
  *(void *)(v44 + 40) = v28;
  id v46 = v28;

  uint64_t v47 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v48 = *(void **)(v47 + 40);
  *(void *)(v47 + 40) = v16;
  id v49 = v16;

  uint64_t v50 = *(void *)(*(void *)(a1 + 56) + 8);
  id v51 = *(void **)(v50 + 40);
  *(void *)(v50 + 40) = v33;
  id v52 = v33;

  uint64_t v53 = *(void *)(*(void *)(a1 + 64) + 8);
  __int16 v54 = *(void **)(v53 + 40);
  *(void *)(v53 + 40) = v23;
}

void __60__HMDAccessorySettingsController_settingsHierarchyDidChange__block_invoke_2(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    *(_DWORD *)buf = 138544386;
    id v33 = v5;
    __int16 v34 = 2112;
    uint64_t v35 = v6;
    __int16 v36 = 2112;
    uint64_t v37 = v7;
    __int16 v38 = 2112;
    uint64_t v39 = v8;
    __int16 v40 = 2112;
    uint64_t v41 = v9;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Added groups: %@, settings: %@. Removed groups: %@, settings: %@", buf, 0x34u);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v27 + 1) + 8 * v14);
        id v16 = objc_msgSend(*(id *)(a1 + 32), "dataSource", (void)v27);
        id v17 = [v16 accessorySetupMetricDispatcher];

        if (v17)
        {
          if (([v17 submitted] & 1) == 0)
          {
            [v17 markFirstSettingObserved];
            id v18 = [v15 keyPath];
            int v19 = [v18 isEqual:@"root.siri.language"];

            if (v19)
            {
              [v17 markLanguageSettingObserved];
              [v17 submit];
            }
          }
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  uint64_t v20 = (void *)MEMORY[0x1D9452090]();
  id v21 = *(id *)(a1 + 32);
  uint64_t v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    id v23 = HMFGetLogIdentifier();
    uint64_t v24 = [*(id *)(a1 + 32) rootGroup];
    uint64_t v25 = [*(id *)(a1 + 32) settingsMap];
    uint64_t v26 = [*(id *)(a1 + 32) groupsMap];
    *(_DWORD *)buf = 138544130;
    id v33 = v23;
    __int16 v34 = 2112;
    uint64_t v35 = v24;
    __int16 v36 = 2112;
    uint64_t v37 = v25;
    __int16 v38 = 2112;
    uint64_t v39 = v26;
    _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Current root:%@, settings: %@, groups: %@", buf, 0x2Au);
  }
}

- (id)_keyPathsForSettings
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(HMDAccessorySettingsController *)self rootGroup];
  id v3 = +[HMDSettingAlgorithm allSettingsFromRootGroup:v2];

  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "keyPath", (void)v13);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = (void *)[v4 copy];
  return v11;
}

- (void)setRootGroup:(id)a3
{
  uint64_t v4 = (HMDAccessorySettingGroup *)a3;
  os_unfair_lock_lock_with_options();
  rootGroup = self->_rootGroup;
  self->_rootGroup = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDAccessorySettingGroup)rootGroup
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_rootGroup;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSettingsMap:(id)a3
{
  uint64_t v4 = (NSMapTable *)a3;
  os_unfair_lock_lock_with_options();
  settingsMap = self->_settingsMap;
  self->_settingsMap = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSMapTable)settingsMap
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_settingsMap;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setGroupsMap:(id)a3
{
  uint64_t v4 = (NSMapTable *)a3;
  os_unfair_lock_lock_with_options();
  groupsMap = self->_groupsMap;
  self->_groupsMap = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSMapTable)groupsMap
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_groupsMap;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)hasDependants
{
  uint64_t v2 = [(HMDAccessorySettingsController *)self dependantControllers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isProxy
{
  return ![(HMDAccessorySettingsController *)self isSettingOwner];
}

- (void)setHasCreatedUnprocessedRootGroup:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hasCreatedUnprocessedRootGroup = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasCreatedUnprocessedRootGroup
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasCreatedUnprocessedRootGroup;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setIsSettingOwner:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_isSettingOwner = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isSettingOwner
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_isSettingOwner;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)description
{
  BOOL v3 = NSString;
  uint64_t v4 = [(HMDAccessorySettingsController *)self parentUUID];
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessorySettingsController isSettingOwner](self, "isSettingOwner"));
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessorySettingsController isMigrationOwner](self, "isMigrationOwner"));
  uint64_t v7 = [v3 stringWithFormat:@"<%p HMDAccessorySettingsController %@: owner:%@, migrationOwner: %@>", self, v4, v5, v6];

  return (NSString *)v7;
}

- (id)logIdentifier
{
  uint64_t v2 = [(HMDAccessorySettingsController *)self parentUUID];
  BOOL v3 = [v2 UUIDString];

  return v3;
}

- (BOOL)shouldEncodeForXPCTransportForSetting:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessorySettingsController *)self dataSource];
  uint64_t v6 = [v5 home];
  if (v6)
  {
    uint64_t v7 = [v4 keyPath];
    int v8 = [v7 isEqualToString:@"root.locationServices.enabled"];

    if (v8)
    {
      uint64_t v9 = [(HMDAccessorySettingsController *)self parentUUID];
      LOBYTE(self) = [v6 shouldEncodeLegacyLocationServiceSettingForSettingsParentUUID:v9];

      goto LABEL_14;
    }
    long long v13 = [v4 keyPath];
    if (([v13 isEqualToString:@"root.music.playbackInfluencesForYou"] & 1) == 0)
    {
      long long v14 = [v4 keyPath];
      if (![v14 isEqualToString:@"root.music.soundCheck"])
      {
        id v21 = [v4 keyPath];
        char v22 = [v21 isEqualToString:@"root.music.allowExplicitContent"];

        if ((v22 & 1) == 0)
        {
          LOBYTE(self) = 1;
          goto LABEL_14;
        }
        goto LABEL_11;
      }
    }
LABEL_11:
    long long v15 = (void *)MEMORY[0x1D9452090]();
    self = self;
    long long v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v17 = HMFGetLogIdentifier();
      uint64_t v18 = [v4 keyPath];
      [v5 supportsUserMediaSettings];
      int v19 = HMFBooleanToString();
      int v23 = 138543874;
      uint64_t v24 = v17;
      __int16 v25 = 2112;
      uint64_t v26 = v18;
      __int16 v27 = 2112;
      long long v28 = v19;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Filtering out keyPath = %@, filtered? = %@", (uint8_t *)&v23, 0x20u);
    }
    LODWORD(self) = [v5 supportsUserMediaSettings] ^ 1;
    goto LABEL_14;
  }
  id v10 = (void *)MEMORY[0x1D9452090]();
  self = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v23 = 138543618;
    uint64_t v24 = v12;
    __int16 v25 = 2112;
    uint64_t v26 = v5;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode xpc settings for controller due to no home for data source: %@", (uint8_t *)&v23, 0x16u);
  }
  LOBYTE(self) = 0;
LABEL_14:

  return (char)self;
}

- (BOOL)shouldEncodeForNonAdminSharedUserForSetting:(id)a3
{
  BOOL v3 = [a3 keyPath];
  char v4 = [&unk_1F2DC6F88 containsObject:v3];

  return v4;
}

- (BOOL)shouldEncodeSetting:(id)a3 withCoder:(id)a4 forAccessorySettingGroup:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend(v8, "hmd_isForNonAdminSharedUser"))
  {
    BOOL v9 = [(HMDAccessorySettingsController *)self shouldEncodeForNonAdminSharedUserForSetting:v7];
  }
  else
  {
    if (!objc_msgSend(v8, "hmd_isForXPCTransport"))
    {
      BOOL v10 = 1;
      goto LABEL_7;
    }
    BOOL v9 = [(HMDAccessorySettingsController *)self shouldEncodeForXPCTransportForSetting:v7];
  }
  BOOL v10 = v9;
LABEL_7:

  return v10;
}

- (HMDAccessorySettingsController)initWithParentUUID:(id)a3 codingKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [HMDAccessorySettingGroup alloc];
  uint64_t v9 = *MEMORY[0x1E4F2C628];
  BOOL v10 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v11 = [(HMDAccessorySettingGroup *)v8 initWithName:v9 identifier:v10 parentIdentifier:v7];

  [(HMDAccessorySettingGroup *)v11 setDataSource:self];
  uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  LOWORD(v15) = 0;
  long long v13 = -[HMDAccessorySettingsController initWithQueue:delegate:dataSource:parentUUID:codingKey:logEventSubmitter:settingOwner:migrationOwner:factory:rootGroup:notificationCenter:](self, "initWithQueue:delegate:dataSource:parentUUID:codingKey:logEventSubmitter:settingOwner:migrationOwner:factory:rootGroup:notificationCenter:", 0, 0, 0, v7, v6, 0, v15, 0, v11, v12);

  return v13;
}

- (HMDAccessorySettingsController)initWithQueue:(id)a3 delegate:(id)a4 dataSource:(id)a5 parentUUID:(id)a6 codingKey:(id)a7 logEventSubmitter:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  uint64_t v20 = objc_alloc_init(HMDAccessorySettingsControllerDependencyFactory);
  id v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
  LOWORD(v24) = 0;
  char v22 = -[HMDAccessorySettingsController initWithQueue:delegate:dataSource:parentUUID:codingKey:logEventSubmitter:settingOwner:migrationOwner:factory:rootGroup:notificationCenter:](self, "initWithQueue:delegate:dataSource:parentUUID:codingKey:logEventSubmitter:settingOwner:migrationOwner:factory:rootGroup:notificationCenter:", v19, v18, v17, v16, v15, v14, v24, v20, 0, v21);

  return v22;
}

- (HMDAccessorySettingsController)initWithQueue:(id)a3 delegate:(id)a4 dataSource:(id)a5 parentUUID:(id)a6 codingKey:(id)a7 logEventSubmitter:(id)a8 settingOwner:(BOOL)a9 migrationOwner:(BOOL)a10 factory:(id)a11 rootGroup:(id)a12 notificationCenter:(id)a13
{
  id v20 = a3;
  id obj = a4;
  id v21 = a5;
  id v49 = a6;
  id v48 = a7;
  id v47 = a8;
  id v22 = a11;
  int v23 = v21;
  id v46 = a13;
  v51.receiver = self;
  v51.super_class = (Class)HMDAccessorySettingsController;
  uint64_t v24 = [(HMDAccessorySettingsController *)&v51 init];
  if (v24)
  {
    uint64_t v25 = HMFGetOSLogHandle();
    logger = v24->_logger;
    v24->_logger = (OS_os_log *)v25;

    objc_storeStrong((id *)&v24->_workQueue, a3);
    v24->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v24->_delegate, obj);
    objc_storeWeak((id *)&v24->_dataSource, v23);
    uint64_t v27 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    groupsMap = v24->_groupsMap;
    v24->_groupsMap = (NSMapTable *)v27;

    uint64_t v29 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    settingsMap = v24->_settingsMap;
    v24->_settingsMap = (NSMapTable *)v29;

    uint64_t v31 = [MEMORY[0x1E4F1CA48] array];
    allChildrenIdentifiers = v24->_allChildrenIdentifiers;
    v24->_allChildrenIdentifiers = (NSMutableArray *)v31;

    id v33 = [[HMDAccessorySettingsBackingStoreTransactionReceiver alloc] initWithDelegate:v24];
    transactionReceiver = v24->_transactionReceiver;
    v24->_transactionReceiver = (HMDBackingStoreObjectProtocol *)v33;

    objc_storeStrong((id *)&v24->_parentUUID, a6);
    objc_storeStrong((id *)&v24->_codingKey, a7);
    objc_storeStrong((id *)&v24->_logEventSubmitter, a8);
    uint64_t v35 = [MEMORY[0x1E4F1CA80] set];
    dependantControllers = v24->_dependantControllers;
    v24->_dependantControllers = (NSMutableSet *)v35;

    v24->_isSettingOwner = a9;
    v24->_isMigrationOwner = a10;
    v24->_hasCreatedUnprocessedRootGroup = 0;
    uint64_t v37 = [v22 createMessageHandlerWithQueue:v20 delegate:v24];
    messageHandler = v24->_messageHandler;
    v24->_messageHandler = (HMDAccessorySettingsMessageHandler *)v37;

    objc_storeStrong((id *)&v24->_factory, a11);
    uint64_t v39 = [MEMORY[0x1E4F1CA80] set];
    constraintItemsMarkedForRemoval = v24->_constraintItemsMarkedForRemoval;
    v24->_constraintItemsMarkedForRemoval = (NSMutableSet *)v39;

    uint64_t v41 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    constraintModifyOperationQueue = v24->_constraintModifyOperationQueue;
    v24->_constraintModifyOperationQueue = v41;

    [(NSOperationQueue *)v24->_constraintModifyOperationQueue setUnderlyingQueue:v20];
    [(NSOperationQueue *)v24->_constraintModifyOperationQueue setMaxConcurrentOperationCount:1];
    uint64_t v43 = [(HMDAccessorySettingsControllerDependencyFactory *)v24->_factory timerWithReason:3 interval:5.0];
    languageChangeDebounceTimer = v24->_languageChangeDebounceTimer;
    v24->_languageChangeDebounceTimer = (HMFTimer *)v43;

    [(HMFTimer *)v24->_languageChangeDebounceTimer setDelegate:v24];
    objc_storeStrong((id *)&v24->_notificationCenter, a13);
  }

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_152313 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_152313, &__block_literal_global_152314);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v4_152315;
  return v2;
}

uint64_t __45__HMDAccessorySettingsController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_152315;
  logCategory__hmf_once_v4_152315 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end