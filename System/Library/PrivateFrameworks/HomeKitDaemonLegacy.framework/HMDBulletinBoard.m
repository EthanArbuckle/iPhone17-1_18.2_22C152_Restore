@interface HMDBulletinBoard
+ (BOOL)isBulletinSupportedForCharacteristicType:(id)a3 serviceType:(id)a4;
+ (BOOL)isBulletinSupportedForNonSecureCharacteristicType:(id)a3 serviceType:(id)a4;
+ (BOOL)isCriticalNonSecureServiceType:(id)a3;
+ (BOOL)presentationValueOfCharacteristic:(id)a3 equalTo:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)_supportedNonSecureServices;
+ (id)_supportedSecureServices;
+ (id)attachmentsWithFileURL:(id)a3;
+ (id)bulletinSupportedCharacteristicsForService:(id)a3;
+ (id)characteristicTupleKeyFromServiceContextID:(id)a3 currentType:(id)a4;
+ (id)createImageAttachmentByHardLinkingFile:(id)a3 fileManager:(id)a4;
+ (id)logCategory;
+ (id)notificationCategories;
+ (id)sharedBulletinBoard;
+ (unint64_t)interruptionLevelForChangedCharacteristic:(id)a3;
- (BOOL)_hasDuplicateBulletinForCharacteristic:(id)a3;
- (BOOL)_hasDuplicateBulletinForSnapshotCharacteristic:(id)a3;
- (BOOL)_shouldPostBulletinOnCurrentValueChangeForCharacteristic:(id)a3 includeChangeFromNil:(BOOL)a4;
- (BOOL)_shouldSkipBulletinForChangedCharacteristic:(id)a3;
- (BOOL)_updateDoorbellPressNotificationsWithSignificantEventBulletin:(id)a3;
- (Class)persistentStoreClass;
- (HMDBulletinBoard)init;
- (HMDBulletinBoard)initWithCoder:(id)a3;
- (HMDBulletinBoard)initWithNotificationCenter:(id)a3 fileManager:(id)a4 workQueue:(id)a5 doorbellBulletinUtilities:(id)a6 logEventSubmitter:(id)a7;
- (HMDDoorbellBulletinUtilities)doorbellBulletinUtilities;
- (HMDFileManager)fileManager;
- (HMDHomeManager)homeManager;
- (HMDUserNotificationCenter)notificationCenter;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NAFuture)isConfiguredFuture;
- (NSMutableDictionary)characteristicTuples;
- (NSMutableDictionary)notificationRequests;
- (NSSet)notificationCategories;
- (OS_dispatch_queue)workQueue;
- (id)_copyItemAtURL:(id)a3 toDirectory:(id)a4;
- (id)_doorbellPressNotificationsNearDate:(id)a3 forCameraProfile:(id)a4;
- (id)_insertRequestWithTitle:(id)a3 snapshotData:(id)a4 message:(id)a5 requestIdentifier:(id)a6 date:(id)a7 bulletinType:(unint64_t)a8 actionURL:(id)a9 bulletinContext:(id)a10 actionContext:(id)a11 interruptionLevel:(unint64_t)a12 logEventTopic:(int64_t)a13;
- (id)insertBulletinForIncomingInvitation:(id)a3;
- (id)insertBulletinForSecureTrigger:(id)a3;
- (id)messageForChangedCharacteristic:(id)a3 withSignificantEvents:(id)a4;
- (id)messageForGarageDoorCharacteristic:(id)a3 personName:(id)a4;
- (id)messageForLockCharacteristic:(id)a3 personName:(id)a4;
- (id)messageForSecuritySystemCharacteristic:(id)a3 personName:(id)a4;
- (id)messageForWindowCharacteristic:(id)a3 personName:(id)a4;
- (id)notificationRequestsForCameraClipUUIDs:(id)a3;
- (id)notificationRequestsSortedByDate;
- (id)removeRedundantSignificantEventNotificationsForSignificantEvents:(id)a3;
- (id)threadIdentifierForNotificationGroupWithHomeContextID:(id)a3;
- (id)titleNameForChangedCharacteristic:(id)a3;
- (id)updateBulletinForFirmwareUpdateInHome:(id)a3;
- (int64_t)bulletinNotificationsGroupTimeInterval;
- (void)_handleDidReceiveNotificationResponse:(id)a3 completionHandler:(id)a4;
- (void)_insertImageBulletinsForChangedCharacteristics:(id)a3 snapshotData:(id)a4 completion:(id)a5;
- (void)_submitCameraClipSignificantEventDetailsFromBulletin:(id)a3;
- (void)_submitDoorbellEventDetailsFromBulletinWithDate:(id)a3 significantEvents:(id)a4;
- (void)_updateCharacteristicTupleFor:(id)a3 withCurrentType:(id)a4 changedByThisDevice:(BOOL)a5;
- (void)_updateDoorbellUserInfo:(id)a3 withSignificantEventUserInfo:(id)a4;
- (void)addNotificationRequest:(id)a3 forIdentifier:(id)a4;
- (void)archive;
- (void)configureWithHomeManager:(id)a3;
- (void)cullBulletinsToCount:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)fetchAreUserNotificationsEnabledWithCompletion:(id)a3;
- (void)insertAccessCodeAddedBulletinForHome:(id)a3;
- (void)insertAccessCodeChangedBulletinForHome:(id)a3;
- (void)insertAccessCodeRemovedBulletinForHome:(id)a3;
- (void)insertBulletinForChangedSecureClassCharacteristic:(id)a3;
- (void)insertBulletinForIncompatibleInvitationFromInviterName:(id)a3 homeName:(id)a4 ownedHomeIdentifier:(id)a5;
- (void)insertBulletinsForChangedCharacteristics:(id)a3 modifiedCharacteristics:(id)a4 changedByThisDevice:(BOOL)a5 changeNotificationFromPrimary:(BOOL)a6 completion:(id)a7;
- (void)insertBulletinsForMatterFirmwareUpdateInstalledInHome:(id)a3;
- (void)insertCameraAccessModeChangedBulletin:(id)a3;
- (void)insertCameraClipSignificantEventBulletin:(id)a3;
- (void)insertConnectedCHIPEcosystemsChangedBulletin:(id)a3;
- (void)insertHomeHubReachabilityBulletinForHome:(id)a3 reachable:(BOOL)a4 hasMultipleResidents:(BOOL)a5;
- (void)insertImageBulletinsForChangedCharacteristics:(id)a3 snapshotData:(id)a4 completion:(id)a5;
- (void)insertLockOnboardingBulletinForHome:(id)a3 serviceType:(id)a4;
- (void)insertNewRMVLanguageBulletinForHome:(id)a3 language:(id)a4;
- (void)insertReachabilityEventBulletinForAccessory:(id)a3 reachable:(BOOL)a4 date:(id)a5;
- (void)insertWalletKeyExpressModeSetUpBulletinForHome:(id)a3;
- (void)insertWalletKeySupportAddedBulletinForAccessory:(id)a3;
- (void)notificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)refreshHomeBadgeNumber;
- (void)removeAllBulletins;
- (void)removeBulletinWithRecordID:(id)a3;
- (void)removeBulletinsForAccessory:(id)a3;
- (void)removeBulletinsForHome:(id)a3;
- (void)removeBulletinsForService:(id)a3;
- (void)removeBulletinsForTrigger:(id)a3;
- (void)removeBulletinsUsingPredicate:(id)a3;
- (void)removeCameraClipBulletinsForCameraProfile:(id)a3;
- (void)removeImageFilesForNotificationRequests:(id)a3;
- (void)removeNotificationRequestsWithIdentifiers:(id)a3 shouldDeleteAttachments:(BOOL)a4;
- (void)removeWalletKeyOnboardingBulletinForHome:(id)a3;
- (void)resolveDisplayNameForChangedCharacteristic:(id)a3 completion:(id)a4;
- (void)setDoorbellBulletinUtilities:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setLogEventSubmitter:(id)a3;
- (void)setNotificationRequests:(id)a3;
- (void)setPersistentStoreClass:(Class)a3;
- (void)updateContent:(id)a3 forNotificationWithRequestIdentifier:(id)a4;
- (void)updateDoorbellPressNotificationsWithSignificantEventBulletin:(id)a3 completion:(id)a4;
- (void)updateMessageForDoorbellPressNotificationRequestWithIdentifier:(id)a3 cameraProfile:(id)a4;
@end

@implementation HMDBulletinBoard

+ (BOOL)isBulletinSupportedForCharacteristicType:(id)a3 serviceType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[HMDBulletinBoard _supportedSecureServices];
  v8 = [v7 objectForKeyedSubscript:v6];

  BOOL v9 = v8 && (!v5 || ([v8 containsObject:v5] & 1) != 0)
    || +[HMDBulletinBoard isBulletinSupportedForNonSecureCharacteristicType:v5 serviceType:v6];

  return v9;
}

+ (id)_supportedSecureServices
{
  if (_supportedSecureServices_onceToken != -1) {
    dispatch_once(&_supportedSecureServices_onceToken, &__block_literal_global_41_27300);
  }
  v2 = (void *)_supportedSecureServices_supportedSecureServices;
  return v2;
}

+ (BOOL)isBulletinSupportedForNonSecureCharacteristicType:(id)a3 serviceType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[HMDBulletinBoard _supportedNonSecureServices];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    if (v5) {
      char v9 = [v8 containsObject:v5];
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (id)_supportedNonSecureServices
{
  if (_supportedNonSecureServices_onceToken != -1) {
    dispatch_once(&_supportedNonSecureServices_onceToken, &__block_literal_global_44_27298);
  }
  v2 = (void *)_supportedNonSecureServices_supportedNonSecureServices;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_doorbellBulletinUtilities, 0);
  objc_storeStrong((id *)&self->_persistentStoreClass, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_characteristicTuples, 0);
  objc_storeStrong((id *)&self->_notificationRequests, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_isConfiguredFuture, 0);
  objc_storeStrong((id *)&self->_notificationCategories, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

- (void)setLogEventSubmitter:(id)a3
{
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDoorbellBulletinUtilities:(id)a3
{
}

- (HMDDoorbellBulletinUtilities)doorbellBulletinUtilities
{
  return (HMDDoorbellBulletinUtilities *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPersistentStoreClass:(Class)a3
{
}

- (Class)persistentStoreClass
{
  return (Class)objc_getProperty(self, a2, 72, 1);
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (NSMutableDictionary)characteristicTuples
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNotificationRequests:(id)a3
{
}

- (NSMutableDictionary)notificationRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (HMDUserNotificationCenter)notificationCenter
{
  return (HMDUserNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (NAFuture)isConfiguredFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)notificationCategories
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (HMDFileManager)fileManager
{
  return (HMDFileManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)notificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  char v9 = [(HMDBulletinBoard *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__HMDBulletinBoard_notificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  block[3] = &unk_1E6A193D0;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

uint64_t __92__HMDBulletinBoard_notificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDidReceiveNotificationResponse:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_handleDidReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v8);

  char v9 = [v6 notification];
  id v10 = [v9 request];
  id v11 = [v10 content];
  v12 = [v11 userInfo];

  id v13 = (void *)MEMORY[0x1D9452090]();
  id v14 = self;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v54 = v16;
    __int16 v55 = 2112;
    id v56 = v6;
    __int16 v57 = 2112;
    v58 = v12;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Did receive notification response: %@ with context: %@", buf, 0x20u);
  }
  v17 = [v6 notification];
  v18 = [v17 request];
  v19 = [v18 content];
  v20 = [v19 categoryIdentifier];

  if ([v20 isEqualToString:@"HomeAppBulletinCategory"])
  {
    v21 = [v6 actionIdentifier];
    int v22 = [v21 isEqualToString:*MEMORY[0x1E4F446E0]];

    if (v22)
    {
      v23 = [v6 notification];
      v24 = [v23 request];
      v25 = [v24 identifier];
      v52 = v25;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
      [(HMDBulletinBoard *)v14 removeNotificationRequestsWithIdentifiers:v26 shouldDeleteAttachments:1];

LABEL_23:
      v7[2](v7);
      goto LABEL_24;
    }
  }
  if (![v20 isEqualToString:@"HMDBBSecureTrigger"]) {
    goto LABEL_23;
  }
  v27 = [v12 objectForKeyedSubscript:@"home.uuid.internal"];
  v28 = [v12 objectForKeyedSubscript:@"trigger.uuid.internal"];
  uint64_t v29 = [v6 actionIdentifier];
  v30 = (void *)v29;
  if (v27 && v28 && v29)
  {
    v48 = (void *)v29;
    v49 = v28;
    v31 = [(HMDBulletinBoard *)v14 homeManager];
    v32 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v27];
    v33 = [v31 _homeWithUUID:v32];

    if (v33)
    {
      v34 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v49];
      v35 = v33;
      v36 = [v33 triggerWithUUID:v34];

      if (v36)
      {
        v30 = v48;
        uint64_t v37 = [v48 isEqualToString:@"trigger_execute"];
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __76__HMDBulletinBoard__handleDidReceiveNotificationResponse_completionHandler___block_invoke;
        v50[3] = &unk_1E6A196E0;
        v50[4] = v14;
        id v51 = v36;
        [v51 userDidConfirmExecute:v37 completionHandler:v50];

        int v38 = 0;
      }
      else
      {
        v43 = (void *)MEMORY[0x1D9452090]();
        v47 = v14;
        v44 = HMFGetOSLogHandle();
        v30 = v48;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v45 = v46 = v43;
          *(_DWORD *)buf = 138543618;
          v54 = v45;
          __int16 v55 = 2112;
          id v56 = v49;
          _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@No trigger with UUID %@ found", buf, 0x16u);

          v43 = v46;
        }

        v7[2](v7);
        int v38 = 1;
      }
      v28 = v49;
    }
    else
    {
      v35 = 0;
      v39 = (void *)MEMORY[0x1D9452090]();
      v40 = v14;
      v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v54 = v42;
        __int16 v55 = 2112;
        id v56 = v27;
        _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "%{public}@No home with UUID %@ found", buf, 0x16u);
      }
      v7[2](v7);
      int v38 = 1;
      v30 = v48;
      v28 = v49;
    }
  }
  else
  {
    v7[2](v7);
    int v38 = 1;
  }

  if (!v38) {
    goto LABEL_23;
  }
LABEL_24:
}

void __76__HMDBulletinBoard__handleDidReceiveNotificationResponse_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      char v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Trigger execution error after user confirms: %@", (uint8_t *)&v8, 0x16u);
    }
    +[HMDBulletinUIManager presentExecutionErrorDialogForTrigger:partialSuccess:](HMDBulletinUIManager, "presentExecutionErrorDialogForTrigger:partialSuccess:", *(void *)(a1 + 40), [v3 code] == 64);
  }
}

- (void)_updateDoorbellUserInfo:(id)a3 withSignificantEventUserInfo:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v8);

  char v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = *MEMORY[0x1E4F2E308];
  id v11 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2E308]];
  [v9 setObject:v11 forKeyedSubscript:v10];

  uint64_t v12 = *MEMORY[0x1E4F2CA70];
  id v13 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2CA70]];
  [v9 setObject:v13 forKeyedSubscript:v12];

  uint64_t v14 = *MEMORY[0x1E4F2CA80];
  v15 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2CA80]];
  [v9 setObject:v15 forKeyedSubscript:v14];

  uint64_t v16 = *MEMORY[0x1E4F2CA68];
  v17 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2CA68]];
  [v9 setObject:v17 forKeyedSubscript:v16];

  v18 = (void *)MEMORY[0x1D9452090]();
  v19 = self;
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = HMFGetLogIdentifier();
    int v22 = 138543618;
    v23 = v21;
    __int16 v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Merging user info: %@ from significant event notification into doorbell notification", (uint8_t *)&v22, 0x16u);
  }
  [v6 addEntriesFromDictionary:v9];
}

- (void)_submitCameraClipSignificantEventDetailsFromBulletin:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 significantEvents];

  objc_msgSend(v6, "na_map:", &__block_literal_global_326);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [v15 allObjects];
  int v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_328);

  BOOL v9 = [v15 count] != 0;
  uint64_t v10 = [v8 count];
  uint64_t v11 = [v15 count] - v10;
  uint64_t v12 = [(HMDBulletinBoard *)self logEventSubmitter];
  id v13 = [HMDFamiliarFacesBulletinLogEvent alloc];
  uint64_t v14 = [(HMDFamiliarFacesBulletinLogEvent *)v13 initWithContainsFaceClassification:v9 numberOfKnownPersons:v10 numberOfUnknownPersons:v11 bulletinReason:*MEMORY[0x1E4F2CAE0] doorbellPressed:0 secondsFromDoorbellToFaceClassification:0.0];
  [v12 submitLogEvent:v14];
}

id __73__HMDBulletinBoard__submitCameraClipSignificantEventDetailsFromBulletin___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 person];
  id v3 = [v2 name];

  return v3;
}

uint64_t __73__HMDBulletinBoard__submitCameraClipSignificantEventDetailsFromBulletin___block_invoke(uint64_t a1, void *a2)
{
  return [a2 faceClassification];
}

- (void)_submitDoorbellEventDetailsFromBulletinWithDate:(id)a3 significantEvents:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  id v7 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v7);

  int v8 = objc_msgSend(v6, "na_filter:", &__block_literal_global_314);

  BOOL v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_317);
  uint64_t v10 = [v8 allObjects];
  uint64_t v11 = [v10 sortedArrayUsingComparator:&__block_literal_global_320];
  uint64_t v12 = [v11 firstObject];
  id v13 = [v12 dateOfOccurrence];

  if (v13)
  {
    [v13 timeIntervalSinceDate:v24];
    double v15 = v14;
  }
  else
  {
    double v15 = 0.0;
  }
  uint64_t v16 = [v9 allObjects];
  v17 = objc_msgSend(v16, "na_map:", &__block_literal_global_323);

  BOOL v18 = [v9 count] != 0;
  uint64_t v19 = [v17 count];
  uint64_t v20 = [v9 count] - v19;
  v21 = [(HMDBulletinBoard *)self logEventSubmitter];
  int v22 = [HMDFamiliarFacesBulletinLogEvent alloc];
  v23 = [(HMDFamiliarFacesBulletinLogEvent *)v22 initWithContainsFaceClassification:v18 numberOfKnownPersons:v19 numberOfUnknownPersons:v20 bulletinReason:*MEMORY[0x1E4F2CAC8] doorbellPressed:1 secondsFromDoorbellToFaceClassification:v15];
  [v21 submitLogEvent:v23];
}

id __86__HMDBulletinBoard__submitDoorbellEventDetailsFromBulletinWithDate_significantEvents___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 person];
  id v3 = [v2 name];

  return v3;
}

uint64_t __86__HMDBulletinBoard__submitDoorbellEventDetailsFromBulletinWithDate_significantEvents___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 dateOfOccurrence];
  id v6 = [v4 dateOfOccurrence];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __86__HMDBulletinBoard__submitDoorbellEventDetailsFromBulletinWithDate_significantEvents___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 faceClassification];
}

BOOL __86__HMDBulletinBoard__submitDoorbellEventDetailsFromBulletinWithDate_significantEvents___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 faceClassification];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_copyItemAtURL:(id)a3 toDirectory:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v8);

  BOOL v9 = [(HMDBulletinBoard *)self fileManager];
  id v30 = 0;
  char v10 = [v9 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v30];
  id v11 = v30;

  if (v10)
  {
    uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
    id v13 = [v12 UUIDString];
    double v14 = [v13 stringByAppendingPathExtension:@"jpg"];

    double v15 = [v7 URLByAppendingPathComponent:v14];
    uint64_t v16 = [(HMDBulletinBoard *)self fileManager];
    id v29 = v11;
    char v17 = [v16 copyItemAtURL:v6 toURL:v15 error:&v29];
    id v18 = v29;

    if (v17)
    {
      id v19 = v15;
    }
    else
    {
      id v24 = (void *)MEMORY[0x1D9452090]();
      v25 = self;
      uint64_t v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v32 = v27;
        __int16 v33 = 2112;
        id v34 = v6;
        __int16 v35 = 2112;
        id v36 = v15;
        __int16 v37 = 2112;
        id v38 = v18;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to item from %@ to %@: %@", buf, 0x2Au);
      }
      id v19 = 0;
    }

    id v11 = v18;
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1D9452090]();
    v21 = self;
    int v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v32 = v23;
      __int16 v33 = 2112;
      id v34 = v7;
      __int16 v35 = 2112;
      id v36 = v11;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to create directory at URL %@: %@", buf, 0x20u);
    }
    id v19 = 0;
  }

  return v19;
}

- (id)_doorbellPressNotificationsNearDate:(id)a3 forCameraProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v8);

  BOOL v9 = [(HMDBulletinBoard *)self notificationRequests];
  char v10 = [v9 allValues];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__HMDBulletinBoard__doorbellPressNotificationsNearDate_forCameraProfile___block_invoke;
  v15[3] = &unk_1E6A08DA8;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = objc_msgSend(v10, "na_filter:", v15);

  return v13;
}

uint64_t __73__HMDBulletinBoard__doorbellPressNotificationsNearDate_forCameraProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 content];
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2CAD0]];

  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F2CAC8]];
  int v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:*(void *)(a1 + 32) sinceDate:-30.0];
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:*(void *)(a1 + 32) sinceDate:30.0];
  char v10 = [v3 content];
  id v11 = [v10 date];
  id v24 = (void *)v9;
  if ([v11 compare:v8] == 1)
  {
    id v12 = [v3 content];
    [v12 date];
    v23 = v8;
    id v13 = v6;
    v15 = int v14 = v7;
    BOOL v16 = [v15 compare:v9] == -1;

    int v7 = v14;
    id v6 = v13;
    int v8 = v23;
  }
  else
  {
    BOOL v16 = 0;
  }

  id v17 = [v3 content];
  id v18 = [v17 userInfo];
  id v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F2CA78]];

  uint64_t v20 = [*(id *)(a1 + 40) contextSPIUniqueIdentifier];
  v21 = [v20 UUIDString];
  LODWORD(v18) = [v21 isEqualToString:v19];

  return v7 & v18 & v16;
}

- (id)notificationRequestsForCameraClipUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDBulletinBoard *)self notificationRequests];
  int v7 = (void *)[v6 copy];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__HMDBulletinBoard_notificationRequestsForCameraClipUUIDs___block_invoke;
  v11[3] = &unk_1E6A08D80;
  id v12 = v7;
  id v8 = v7;
  uint64_t v9 = objc_msgSend(v4, "na_map:", v11);

  return v9;
}

id __59__HMDBulletinBoard_notificationRequestsForCameraClipUUIDs___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 UUIDString];
  id v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

- (void)updateMessageForDoorbellPressNotificationRequestWithIdentifier:(id)a3 cameraProfile:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(HMDBulletinBoard *)self notificationRequests];
  char v10 = [v9 objectForKeyedSubscript:v6];

  if (v10)
  {
    id v11 = [v10 content];
    id v12 = (void *)[v11 mutableCopy];

    id v13 = [(HMDBulletinBoard *)self doorbellBulletinUtilities];
    int v14 = [v12 date];
    double v15 = [v13 significantEventsRelevantToDoorbellPress:v14 forCameraProfile:v7];

    BOOL v16 = [v12 date];
    [(HMDBulletinBoard *)self _submitDoorbellEventDetailsFromBulletinWithDate:v16 significantEvents:v15];

    id v17 = [(HMDBulletinBoard *)self doorbellBulletinUtilities];
    id v18 = [v17 localizedDoorbellMessageForSignificantEvents:v15];
    [v12 setBody:v18];

    id v19 = [v12 userInfo];
    uint64_t v20 = *MEMORY[0x1E4F2EE88];
    v21 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F2EE88]];

    if (v21)
    {
      int v22 = (void *)MEMORY[0x1E4F1CB10];
      v23 = [v12 userInfo];
      id v24 = [v23 objectForKeyedSubscript:v20];
      v25 = [v22 fileURLWithPath:v24];

      uint64_t v26 = [(HMDBulletinBoard *)self fileManager];
      v27 = +[HMDBulletinBoard createImageAttachmentByHardLinkingFile:v25 fileManager:v26];
      [v12 setAttachments:v27];
    }
    v28 = (void *)MEMORY[0x1D9452090]();
    id v29 = self;
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = HMFGetLogIdentifier();
      v32 = [v12 body];
      [v12 userInfo];
      __int16 v33 = v41 = v7;
      [v12 attachments];
      v40 = v15;
      v35 = id v34 = v6;
      *(_DWORD *)buf = 138544386;
      v43 = v31;
      __int16 v44 = 2112;
      id v45 = v10;
      __int16 v46 = 2112;
      v47 = v32;
      __int16 v48 = 2112;
      v49 = v33;
      __int16 v50 = 2112;
      id v51 = v35;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Updating doorbell press notification %@ with body: %@, userInfo: %@, attachments: %@", buf, 0x34u);

      id v6 = v34;
      double v15 = v40;

      id v7 = v41;
    }

    [(HMDBulletinBoard *)v29 updateContent:v12 forNotificationWithRequestIdentifier:v6];
  }
  else
  {
    id v36 = (void *)MEMORY[0x1D9452090]();
    __int16 v37 = self;
    id v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      uint64_t v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v43 = v39;
      __int16 v44 = 2112;
      id v45 = v6;
      _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@Did not find request with identifier: %@, so doing nothing", buf, 0x16u);
    }
  }
}

- (BOOL)_updateDoorbellPressNotificationsWithSignificantEventBulletin:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 dateOfOccurrence];
  id v7 = [v4 camera];
  id v8 = [(HMDBulletinBoard *)self _doorbellPressNotificationsNearDate:v6 forCameraProfile:v7];

  char v9 = objc_msgSend(v8, "hmf_isEmpty");
  char v10 = v9;
  if ((v9 & 1) == 0)
  {
    char v67 = v9;
    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v83 = v14;
      __int16 v84 = 2112;
      v85 = v8;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Found recent doorbell press notifications to update: %@", buf, 0x16u);
    }
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    v68 = v8;
    id obj = v8;
    uint64_t v72 = [obj countByEnumeratingWithState:&v78 objects:v92 count:16];
    if (v72)
    {
      uint64_t v71 = *(void *)v79;
      uint64_t v74 = *MEMORY[0x1E4F2EE88];
      id v73 = v4;
      v75 = v12;
      do
      {
        for (uint64_t i = 0; i != v72; ++i)
        {
          if (*(void *)v79 != v71) {
            objc_enumerationMutation(obj);
          }
          v76 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          BOOL v16 = [v76 content];
          id v17 = (void *)[v16 mutableCopy];

          id v18 = [v4 previewImageFilePathURL];

          if (v18)
          {
            id v19 = [v4 previewImageFilePathURL];
            if (v19)
            {
              uint64_t v20 = [v4 previewImageFilePathURL];
              v21 = [(HMDBulletinBoard *)v12 fileManager];
              int v22 = [v21 heroFrameStoreDirectoryURL];
              id v23 = [(HMDBulletinBoard *)v75 _copyItemAtURL:v20 toDirectory:v22];

              id v12 = v75;
            }
            else
            {
              id v23 = 0;
            }

            v31 = [v23 filePathURL];
            v32 = [(HMDBulletinBoard *)v12 fileManager];
            __int16 v33 = +[HMDBulletinBoard createImageAttachmentByHardLinkingFile:v31 fileManager:v32];
            [v17 setAttachments:v33];

            id v34 = [v17 userInfo];
            id v29 = [v34 objectForKeyedSubscript:v74];

            __int16 v35 = [v17 userInfo];
            id v30 = (void *)[v35 mutableCopy];

            id v36 = [v23 filePathURL];
            __int16 v37 = [v36 path];
            [v30 setObject:v37 forKeyedSubscript:v74];

            [v17 setUserInfo:v30];
            if (v29)
            {
              id v38 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v29];
              uint64_t v39 = [(HMDBulletinBoard *)v12 fileManager];
              id v77 = 0;
              char v40 = [v39 removeItemAtURL:v38 error:&v77];
              id v41 = v77;

              if ((v40 & 1) == 0)
              {
                v42 = (void *)MEMORY[0x1D9452090]();
                v43 = v75;
                __int16 v44 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  id v45 = v69 = v42;
                  *(_DWORD *)buf = 138543874;
                  v83 = v45;
                  __int16 v84 = 2112;
                  v85 = v38;
                  __int16 v86 = 2112;
                  id v87 = v41;
                  _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove old notification image: %@ with error: %@", buf, 0x20u);

                  v42 = v69;
                }
              }

              id v4 = v73;
              id v12 = v75;
            }
            else
            {
              id v4 = v73;
            }
          }
          else
          {
            id v24 = [v17 userInfo];
            v25 = [v24 objectForKeyedSubscript:v74];

            if (!v25) {
              goto LABEL_23;
            }
            uint64_t v26 = (void *)MEMORY[0x1E4F1CB10];
            v27 = [v17 userInfo];
            v28 = [v27 objectForKeyedSubscript:v74];
            id v23 = [v26 fileURLWithPath:v28];

            id v29 = [(HMDBulletinBoard *)v12 fileManager];
            id v30 = +[HMDBulletinBoard createImageAttachmentByHardLinkingFile:v23 fileManager:v29];
            [v17 setAttachments:v30];
          }

LABEL_23:
          __int16 v46 = [v17 date];
          v47 = [v4 significantEvents];
          [(HMDBulletinBoard *)v12 _submitDoorbellEventDetailsFromBulletinWithDate:v46 significantEvents:v47];

          __int16 v48 = [v4 significantEvents];
          LODWORD(v47) = objc_msgSend(v48, "na_any:", &__block_literal_global_308);

          if (v47)
          {
            v49 = [v17 userInfo];
            __int16 v50 = (void *)[v49 mutableCopy];

            id v51 = [v4 userInfo];
            [(HMDBulletinBoard *)v12 _updateDoorbellUserInfo:v50 withSignificantEventUserInfo:v51];

            [v17 setUserInfo:v50];
          }
          uint64_t v52 = [(HMDBulletinBoard *)v12 doorbellBulletinUtilities];
          v53 = [v17 date];
          v54 = [v4 camera];
          __int16 v55 = [v52 significantEventsRelevantToDoorbellPress:v53 forCameraProfile:v54];

          id v56 = [(HMDBulletinBoard *)v12 doorbellBulletinUtilities];
          __int16 v57 = [v56 localizedDoorbellMessageForSignificantEvents:v55];
          [v17 setBody:v57];

          v58 = (void *)MEMORY[0x1D9452090]();
          uint64_t v59 = v12;
          v60 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            v61 = HMFGetLogIdentifier();
            v62 = [v17 body];
            v63 = [v17 userInfo];
            v64 = [v17 attachments];
            *(_DWORD *)buf = 138544386;
            v83 = v61;
            __int16 v84 = 2112;
            v85 = v76;
            __int16 v86 = 2112;
            id v87 = v62;
            __int16 v88 = 2112;
            v89 = v63;
            __int16 v90 = 2112;
            v91 = v64;
            _os_log_impl(&dword_1D49D5000, v60, OS_LOG_TYPE_INFO, "%{public}@Updating doorbell press notification %@ with body: %@, userInfo: %@, attachments: %@", buf, 0x34u);

            id v4 = v73;
          }

          v65 = [v76 identifier];
          [(HMDBulletinBoard *)v59 updateContent:v17 forNotificationWithRequestIdentifier:v65];

          id v12 = v75;
        }
        uint64_t v72 = [obj countByEnumeratingWithState:&v78 objects:v92 count:16];
      }
      while (v72);
    }

    id v8 = v68;
    char v10 = v67;
  }

  return v10 ^ 1;
}

BOOL __82__HMDBulletinBoard__updateDoorbellPressNotificationsWithSignificantEventBulletin___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reason] == 2;
}

- (BOOL)_shouldPostBulletinOnCurrentValueChangeForCharacteristic:(id)a3 includeChangeFromNil:(BOOL)a4
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  id v7 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v7);

  if ([(HMDBulletinBoard *)self _shouldSkipBulletinForChangedCharacteristic:v6])
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    char v9 = self;
    char v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v79 = v11;
      __int16 v80 = 2112;
      long long v81 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Skipping bulletin for characteristic: %@", buf, 0x16u);
    }
    goto LABEL_9;
  }
  if (a4)
  {
    LODWORD(v12) = 0;
  }
  else
  {
    id v13 = [(__CFString *)v6 previousValue];
    LODWORD(v12) = v13 == 0;
  }
  int v14 = +[HMDBulletinCategory targetCurrentCharacteristicTypeMap];
  double v15 = [(__CFString *)v6 type];
  BOOL v16 = [v14 objectForKeyedSubscript:v15];

  if (!v16)
  {
    id v19 = [(__CFString *)v6 service];
    uint64_t v20 = [v19 contextID];
    v21 = [(__CFString *)v6 type];
    uint64_t v22 = +[HMDBulletinBoard characteristicTupleKeyFromServiceContextID:v20 currentType:v21];

    id v23 = [(HMDBulletinBoard *)self characteristicTuples];
    v75 = (void *)v22;
    id v24 = [v23 objectForKeyedSubscript:v22];

    if (!v24)
    {
      v28 = (void *)MEMORY[0x1D9452090]();
      id v29 = self;
      id v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = HMFGetLogIdentifier();
        if (v12) {
          v32 = @"not post";
        }
        else {
          v32 = @"post";
        }
        __int16 v33 = [(__CFString *)v6 instanceID];
        id v34 = [(__CFString *)v6 value];
        __int16 v35 = HMFBooleanToString();
        HMFBooleanToString();
        uint64_t v12 = v73 = v12;
        *(_DWORD *)buf = 138544642;
        long long v79 = v31;
        __int16 v80 = 2112;
        long long v81 = v32;
        __int16 v82 = 2112;
        v83 = v33;
        __int16 v84 = 2112;
        v85 = v34;
        __int16 v86 = 2112;
        id v87 = v35;
        __int16 v88 = 2112;
        uint64_t v89 = v12;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Should %@ bulletin for characteristic instanceId: %@ value:%@ includeChangeFromNil: %@ because tuple not present and initial update is %@", buf, 0x3Eu);

        LOBYTE(v12) = v73;
      }

      LOBYTE(v17) = v12 ^ 1;
      id v24 = 0;
      goto LABEL_51;
    }
    v25 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v26 = [v24 targetValue];
    if (v26)
    {
      v27 = [v25 arrayWithObject:v26];
    }
    else
    {
      id v36 = [MEMORY[0x1E4F1CA98] null];
      v27 = [v25 arrayWithObject:v36];
    }
    __int16 v37 = [(__CFString *)v6 type];
    int v38 = [v37 isEqualToString:*MEMORY[0x1E4F5B830]];

    if (v38)
    {
      uint64_t v39 = [v27 arrayByAddingObject:&unk_1F2DC78B8];

      v27 = (void *)v39;
    }
    char v40 = [v24 targetStateNumber];
    id v41 = [(__CFString *)v6 stateNumber];
    uint64_t v42 = HAPCompareStateNumberWithRollover();

    uint64_t v72 = v27;
    if (v42 == 1)
    {
      LOBYTE(v17) = 0;
LABEL_46:
      v58 = (void *)MEMORY[0x1D9452090]();
      uint64_t v59 = self;
      v60 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        uint64_t v71 = HMFGetLogIdentifier();
        v61 = @"same/newer";
        if (v42 == 1) {
          v61 = @"older";
        }
        v69 = v61;
        v68 = [v24 targetValue];
        char v67 = [v24 targetStateNumber];
        v62 = HMFBooleanToString();
        [v24 changedByThisDevice];
        v63 = HMFBooleanToString();
        HMFBooleanToString();
        v64 = v70 = v59;
        v65 = HMFBooleanToString();
        v66 = HMFBooleanToString();
        *(_DWORD *)buf = 138545410;
        long long v79 = v71;
        __int16 v80 = 2112;
        long long v81 = v69;
        __int16 v82 = 2112;
        v83 = v68;
        __int16 v84 = 2112;
        v85 = v67;
        __int16 v86 = 2112;
        id v87 = v62;
        __int16 v88 = 2112;
        uint64_t v89 = (uint64_t)v63;
        __int16 v90 = 2112;
        v91 = v64;
        __int16 v92 = 2112;
        uint64_t v93 = v65;
        __int16 v94 = 2112;
        v95 = v66;
        _os_log_impl(&dword_1D49D5000, v60, OS_LOG_TYPE_INFO, "%{public}@Should post bulletin: Target/Current - Current is: %@, Cached Target Value: %@ Cached Target State: %@ waitForTargetMatch: %@ changedByThisDevice: %@ initialUpdate: %@, shouldPostBulletin: %@, includeChangeFromNil: %@", buf, 0x5Cu);

        uint64_t v59 = v70;
      }

LABEL_51:

      goto LABEL_10;
    }
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __98__HMDBulletinBoard__shouldPostBulletinOnCurrentValueChangeForCharacteristic_includeChangeFromNil___block_invoke;
    v76[3] = &unk_1E6A17240;
    v43 = v6;
    id v77 = v43;
    if (objc_msgSend(v27, "na_any:", v76))
    {
      int v17 = ([v24 changedByThisDevice] | v12) ^ 1;
      __int16 v44 = [(__CFString *)v43 type];
      if ([v44 isEqualToString:*MEMORY[0x1E4F5B810]])
      {
        id v45 = [(__CFString *)v43 value];
        if ([v45 integerValue] == 2)
        {
          uint64_t v74 = v24;
          __int16 v46 = [v24 targetValue];
          uint64_t v47 = [v46 integerValue];

          if (!v47)
          {
            id v24 = v74;
            goto LABEL_45;
          }
          id v24 = v74;
          goto LABEL_44;
        }
      }
LABEL_44:
      __int16 v57 = [(HMDBulletinBoard *)self characteristicTuples];
      [v57 removeObjectForKey:v75];

      goto LABEL_45;
    }
    uint64_t v48 = v42;
    uint64_t v49 = [v24 targetStateNumber];
    if (v49)
    {
      __int16 v50 = (void *)v49;
      id v51 = [(__CFString *)v43 stateNumber];
      uint64_t v52 = v51;
      if (!v51 || v42)
      {
      }
      else
      {
        int v53 = [v24 changedByThisDevice];

        if (!v53) {
          goto LABEL_40;
        }
      }
    }
    uint64_t v54 = [v24 targetValue];
    if (!v54 || (__int16 v55 = (void *)v54, v56 = [v24 changedByThisDevice], v55, v56))
    {
      uint64_t v42 = v48;
      if (([v24 changedByThisDevice] & 1) == 0)
      {
        LOBYTE(v17) = 1;
        goto LABEL_44;
      }
      LOBYTE(v17) = 0;
LABEL_45:

      goto LABEL_46;
    }
LABEL_40:
    LOBYTE(v17) = 0;
    uint64_t v42 = v48;
    goto LABEL_45;
  }
LABEL_9:
  LOBYTE(v17) = 0;
LABEL_10:

  return v17;
}

BOOL __98__HMDBulletinBoard__shouldPostBulletinOnCurrentValueChangeForCharacteristic_includeChangeFromNil___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA98] null];

  if (v4 == v3)
  {

    id v3 = 0;
  }
  BOOL v5 = +[HMDBulletinBoard presentationValueOfCharacteristic:*(void *)(a1 + 32) equalTo:v3];

  return v5;
}

- (BOOL)_shouldSkipBulletinForChangedCharacteristic:(id)a3
{
  id v3 = a3;
  id v4 = [v3 service];
  BOOL v5 = [v3 type];
  if ([v5 isEqualToString:*MEMORY[0x1E4F5B8A0]])
  {
    id v6 = [v4 bulletinBoardNotification];
    id v7 = [v6 notificationServiceGroup];
    id v8 = [v7 cameraProfiles];
    uint64_t v9 = [v8 count];

    if (v9)
    {
LABEL_19:
      BOOL v23 = 1;
      goto LABEL_31;
    }
  }
  else
  {
  }
  char v10 = [v3 type];
  if (![v10 isEqualToString:*MEMORY[0x1E4F5B888]])
  {
LABEL_10:

    goto LABEL_11;
  }
  id v11 = [v4 type];
  if (([v11 isEqualToString:*MEMORY[0x1E4F5BA78]] & 1) == 0)
  {

    goto LABEL_10;
  }
  uint64_t v12 = [v4 bulletinBoardNotification];
  id v13 = [v12 notificationServiceGroup];
  int v14 = [v13 cameraProfiles];
  uint64_t v15 = [v14 count];

  if (v15) {
    goto LABEL_19;
  }
LABEL_11:
  BOOL v16 = [v3 type];
  if (![v16 isEqualToString:*MEMORY[0x1E4F5B7D8]])
  {
LABEL_16:

    goto LABEL_17;
  }
  int v17 = [v4 type];
  if (([v17 isEqualToString:@"00000260-0000-1000-8000-0026BB765291"] & 1) == 0)
  {

    goto LABEL_16;
  }
  id v18 = [v3 value];
  int v19 = [v18 intValue];

  if (v19) {
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v20 = [v3 type];
  if ([v20 isEqualToString:*MEMORY[0x1E4F5B810]])
  {
    v21 = [v3 value];
    uint64_t v22 = [v21 integerValue];

    if (v22 == 3) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  id v24 = [v3 type];
  if ([v24 isEqualToString:*MEMORY[0x1E4F5B830]])
  {
    v25 = [v3 value];
    if ([v25 integerValue])
    {
      uint64_t v26 = [v3 value];
      if ([v26 integerValue] == 1)
      {
        BOOL v23 = 0;
      }
      else
      {
        v27 = [v3 value];
        BOOL v23 = [v27 integerValue] != 2;
      }
    }
    else
    {
      BOOL v23 = 0;
    }
  }
  else
  {
    BOOL v23 = 0;
  }

LABEL_31:
  return v23;
}

- (void)_updateCharacteristicTupleFor:(id)a3 withCurrentType:(id)a4 changedByThisDevice:(BOOL)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v9);

  char v10 = [v7 service];
  id v11 = [v10 findCharacteristicWithType:v8];
  uint64_t v12 = [v7 stateNumber];
  if (!v12) {
    goto LABEL_7;
  }
  id v13 = (void *)v12;
  int v14 = [v11 stateNumber];

  if (!v14) {
    goto LABEL_7;
  }
  uint64_t v15 = [v11 stateNumber];
  BOOL v16 = [v7 stateNumber];
  uint64_t v17 = HAPCompareStateNumberWithRollover();

  if (v17 == 1)
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    int v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      uint64_t v22 = [v7 stateNumber];
      BOOL v23 = [v11 stateNumber];
      *(_DWORD *)buf = 138543874;
      uint64_t v39 = v21;
      __int16 v40 = 2112;
      id v41 = v22;
      __int16 v42 = 2112;
      v43 = v23;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Not creating tuple because target state number is stale: %@:%@", buf, 0x20u);
    }
  }
  else
  {
LABEL_7:
    __int16 v37 = v11;
    id v24 = [v10 contextID];
    v25 = +[HMDBulletinBoard characteristicTupleKeyFromServiceContextID:v24 currentType:v8];

    uint64_t v26 = [(HMDBulletinBoard *)self characteristicTuples];
    v27 = [v26 objectForKeyedSubscript:v25];

    if (v27)
    {
      v28 = [v27 targetValue];
      BOOL v29 = +[HMDBulletinBoard presentationValueOfCharacteristic:v7 equalTo:v28];

      if (v29) {
        [v27 changedByThisDevice];
      }
    }
    id v30 = [v7 value];
    v31 = [v7 type];
    v32 = +[HMDBulletinCategory presentationValueForValue:v30 type:v31];

    if (!v32)
    {
      v32 = [v7 value];
    }
    __int16 v33 = [v10 contextID];
    id v34 = [v7 stateNumber];
    __int16 v35 = +[HMDBulletinCharacteristicTuple tupleWithServiceContextID:currentType:targetValue:targetStateNumber:changedByThisDevice:](HMDBulletinCharacteristicTuple, "tupleWithServiceContextID:currentType:targetValue:targetStateNumber:changedByThisDevice:", v33);
    id v36 = [(HMDBulletinBoard *)self characteristicTuples];
    [v36 setObject:v35 forKeyedSubscript:v25];

    id v11 = v37;
  }
}

- (BOOL)_hasDuplicateBulletinForSnapshotCharacteristic:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDBulletinBoard *)self notificationRequestsSortedByDate];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__HMDBulletinBoard__hasDuplicateBulletinForSnapshotCharacteristic___block_invoke;
  v20[3] = &unk_1E6A08C80;
  id v7 = v4;
  id v21 = v7;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v20);

  if (!v8) {
    goto LABEL_8;
  }
  uint64_t v9 = [v7 type];
  if (![v9 isEqualToString:*MEMORY[0x1E4F5B888]]) {
    goto LABEL_7;
  }
  char v10 = [v7 service];
  id v11 = [v10 type];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F5BA78]];

  if (!v12) {
    goto LABEL_8;
  }
  id v13 = [v8 content];
  int v14 = [v13 userInfo];
  uint64_t v9 = [v14 objectForKeyedSubscript:@"characteristicValueUpdatedTime"];

  if (!v9) {
    goto LABEL_8;
  }
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] distantPast];
  if ([v9 isEqualToDate:v15])
  {

LABEL_7:
    goto LABEL_8;
  }
  id v18 = [v7 lastKnownValueUpdateTime];
  char v19 = [v9 isEqualToDate:v18];

  if (v19)
  {
    BOOL v16 = 1;
    goto LABEL_9;
  }
LABEL_8:
  BOOL v16 = 0;
LABEL_9:

  return v16;
}

uint64_t __67__HMDBulletinBoard__hasDuplicateBulletinForSnapshotCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 content];
  id v4 = [v3 userInfo];
  BOOL v5 = [v4 objectForKeyedSubscript:@"characteristic"];
  id v6 = [*(id *)(a1 + 32) contextID];
  uint64_t v7 = [v5 isEqualToString:v6];

  return v7;
}

- (BOOL)_hasDuplicateBulletinForCharacteristic:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDBulletinBoard *)self notificationRequestsSortedByDate];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __59__HMDBulletinBoard__hasDuplicateBulletinForCharacteristic___block_invoke;
  v40[3] = &unk_1E6A08C80;
  id v7 = v4;
  id v41 = v7;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v40);

  if (v8)
  {
    uint64_t v9 = [v7 value];
    char v10 = [v7 type];
    id v11 = +[HMDBulletinCategory presentationValueForValue:v9 type:v10];

    int v12 = [v8 content];
    id v13 = [v12 userInfo];
    int v14 = [v13 objectForKeyedSubscript:@"characteristicValue"];
    uint64_t v15 = [v8 content];
    BOOL v16 = [v15 userInfo];
    uint64_t v17 = [v16 objectForKeyedSubscript:@"characteristicType"];
    id v18 = +[HMDBulletinCategory presentationValueForValue:v14 type:v17];

    char v19 = [v7 metadata];
    uint64_t v20 = [v19 stepValue];
    if (!compareCharacteristicValue(v11, v18, (void *)4, v20))
    {
      BOOL v29 = 0;
LABEL_13:

      goto LABEL_14;
    }
    uint64_t v21 = [v7 stateNumber];
    uint64_t v22 = [v8 content];
    BOOL v23 = [v22 userInfo];
    uint64_t v24 = [v23 objectForKeyedSubscript:@"stateNumber"];

    if (v21 | v24)
    {
      if (!HMFEqualObjects()) {
        goto LABEL_11;
      }
      v25 = [MEMORY[0x1E4F1C9C8] date];
      int v38 = [v8 content];
      uint64_t v26 = [v38 date];
      [v25 timeIntervalSinceDate:v26];
      double v28 = v27;
    }
    else
    {
      id v30 = [MEMORY[0x1E4F1C9C8] date];
      v31 = [v8 content];
      [v31 date];
      uint64_t v39 = v18;
      uint64_t v32 = v24;
      uint64_t v33 = v21;
      v35 = id v34 = v11;
      [v30 timeIntervalSinceDate:v35];
      double v28 = v36;

      id v11 = v34;
      uint64_t v21 = v33;
      uint64_t v24 = v32;
      id v18 = v39;
    }
    if (v28 < 60.0)
    {
      BOOL v29 = 1;
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    BOOL v29 = 0;
    goto LABEL_12;
  }
  BOOL v29 = 0;
LABEL_14:

  return v29;
}

uint64_t __59__HMDBulletinBoard__hasDuplicateBulletinForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 content];
  id v4 = [v3 userInfo];
  BOOL v5 = [v4 objectForKeyedSubscript:@"characteristic"];
  id v6 = [*(id *)(a1 + 32) contextID];
  uint64_t v7 = [v5 isEqualToString:v6];

  return v7;
}

- (id)_insertRequestWithTitle:(id)a3 snapshotData:(id)a4 message:(id)a5 requestIdentifier:(id)a6 date:(id)a7 bulletinType:(unint64_t)a8 actionURL:(id)a9 bulletinContext:(id)a10 actionContext:(id)a11 interruptionLevel:(unint64_t)a12 logEventTopic:(int64_t)a13
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a4;
  id v68 = a5;
  id v67 = a6;
  id v66 = a7;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  uint64_t v24 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v24);

  v64 = objc_msgSend(v22, "hmf_stringForKey:", *MEMORY[0x1E4F2CAB0]);
  v65 = v22;
  v25 = (void *)[v22 mutableCopy];
  v69 = v23;
  v70 = v21;
  uint64_t v71 = v19;
  if (!v20)
  {
    v62 = 0;
    if (!v21) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  uint64_t v26 = *MEMORY[0x1E4F2EE88];
  double v27 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F2EE88]];
  [v25 setValue:v27 forKey:v26];

  double v28 = [v20 objectForKeyedSubscript:@"kCameraSessionID"];
  [v25 setValue:v28 forKey:@"kCameraSessionID"];

  uint64_t v29 = *MEMORY[0x1E4F2EE80];
  id v30 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F2EE80]];
  [v25 setValue:v30 forKey:v29];

  v31 = [v20 objectForKeyedSubscript:v26];
  if (v31)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v31];
    uint64_t v33 = [(HMDBulletinBoard *)self fileManager];
    uint64_t v34 = +[HMDBulletinBoard createImageAttachmentByHardLinkingFile:v32 fileManager:v33];

    __int16 v35 = (void *)MEMORY[0x1D9452090]();
    double v36 = self;
    __int16 v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      int v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      char v73 = v38;
      __int16 v74 = 2112;
      uint64_t v75 = v34;
      _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Adding attachments: %@", buf, 0x16u);

      id v23 = v69;
    }
    v62 = (void *)v34;
  }
  else
  {
    v62 = 0;
  }
  id v21 = v70;

  id v19 = v71;
  if (v70)
  {
LABEL_10:
    uint64_t v39 = (void *)MEMORY[0x1D9452090]();
    __int16 v40 = self;
    id v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      __int16 v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      char v73 = v42;
      __int16 v74 = 2112;
      uint64_t v75 = (uint64_t)v21;
      _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@Setting default action with URL: %@", buf, 0x16u);

      id v23 = v69;
    }

    v43 = [v21 absoluteString];
    [v25 setObject:v43 forKey:*MEMORY[0x1E4F2E308]];
  }
LABEL_13:
  char v44 = 0;
  v63 = v20;
  if (a8)
  {
    if (a8 != 2)
    {
      if (a8 == 1)
      {
        id v45 = [v23 objectForKeyedSubscript:@"categoryID"];

        if (v45)
        {
          __int16 v46 = [v23 objectForKeyedSubscript:@"categoryID"];
          uint64_t v47 = [v23 objectForKeyedSubscript:@"bulletinActionButtonDescription"];
          [v25 setObject:v47 forKeyedSubscript:@"bulletinActionButtonDescription"];

          uint64_t v48 = *MEMORY[0x1E4F2CA78];
          uint64_t v49 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F2CA78]];
          [v25 setObject:v49 forKeyedSubscript:v48];
        }
        else
        {
          __int16 v46 = 0;
        }
        char v44 = 0;
        goto LABEL_31;
      }
      goto LABEL_25;
    }
    id v51 = [v23 objectForKeyedSubscript:@"buttonCategory"];
    int v52 = [v51 isEqualToNumber:&unk_1F2DC78A0];

    if (!v52)
    {
      char v44 = 0;
LABEL_25:
      __int16 v46 = 0;
      goto LABEL_26;
    }
    uint64_t v53 = [v23 objectForKeyedSubscript:@"buttonCategory"];
    if (!v53
      || (uint64_t v54 = (void *)v53,
          [v23 objectForKeyedSubscript:@"bulletinActionButtonDescription"],
          __int16 v55 = objc_claimAutoreleasedReturnValue(),
          v55,
          v54,
          !v55))
    {
      __int16 v46 = 0;
      char v44 = 1;
      goto LABEL_26;
    }
    int v56 = [v23 objectForKeyedSubscript:@"bulletinActionButtonDescription"];
    [v25 setValue:v56 forKey:@"bulletinActionButtonDescription"];

    __int16 v57 = [v23 objectForKeyedSubscript:@"buttonCategory"];
    [v25 setValue:v57 forKey:@"buttonCategory"];

    char v44 = 1;
    __int16 v50 = HMDBulletinCategorySecureTrigger;
  }
  else
  {
    __int16 v50 = &HMDBulletinCategoryNormalType;
  }
  __int16 v46 = *v50;
LABEL_26:
  if (legacyWatchOSCategoryMap_onceToken != -1) {
    dispatch_once(&legacyWatchOSCategoryMap_onceToken, &__block_literal_global_570);
  }
  [v25 addEntriesFromDictionary:legacyWatchOSCategoryMap_legacyWatchOSCategoryMap];
LABEL_31:
  v58 = [(HMDBulletinBoard *)self notificationCenter];
  LOBYTE(v61) = v44;
  uint64_t v59 = [v58 showNotificationWithTitle:v19 body:v68 threadIdentifier:v64 categoryIdentifier:v46 requestIdentifier:v67 date:v66 attachments:v62 userInfo:v25 shouldIgnoreDoNotDisturb:v61 interruptionLevel:a12 logEventTopic:a13];

  [(HMDBulletinBoard *)self addNotificationRequest:v59 forIdentifier:v67];
  return v59;
}

- (void)removeImageFilesForNotificationRequests:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v5);

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v29;
    uint64_t v10 = *MEMORY[0x1E4F2EE88];
    *(void *)&long long v7 = 138543874;
    long long v24 = v7;
    do
    {
      uint64_t v11 = 0;
      uint64_t v25 = v8;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        int v12 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v11), "content", v24);
        id v13 = [v12 userInfo];
        int v14 = [v13 objectForKeyedSubscript:v10];

        if (v14)
        {
          uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v27 = 0;
          [v15 removeItemAtPath:v14 error:&v27];
          id v16 = v27;

          uint64_t v17 = (void *)MEMORY[0x1D9452090]();
          id v18 = self;
          id v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            uint64_t v20 = v10;
            uint64_t v21 = v9;
            v23 = id v22 = self;
            *(_DWORD *)buf = v24;
            uint64_t v33 = v23;
            __int16 v34 = 2112;
            __int16 v35 = v14;
            __int16 v36 = 2112;
            id v37 = v16;
            _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Removed the bulletin snapshot file at %@ with result %@", buf, 0x20u);

            self = v22;
            uint64_t v9 = v21;
            uint64_t v10 = v20;
            uint64_t v8 = v25;
          }
        }

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v8);
  }
}

- (id)messageForWindowCharacteristic:(id)a3 personName:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v6 service];
  uint64_t v10 = [v9 name];
  uint64_t v11 = [v6 accessory];
  int v12 = [v11 room];
  id v13 = [v12 name];
  int v14 = HMDLocalizedStringForKey(@"BULLETIN_ACTION_ROOM_SERVICE");
  uint64_t v15 = +[HMDServiceNameComponents componentsWithRawServiceName:v10 rawRoomName:v13 localizedFormat:v14];

  id v16 = [v6 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  id v18 = v17;

  if (!v18) {
    goto LABEL_12;
  }
  if ([v18 integerValue] > 0)
  {
    id v19 = @"BULLETIN_WINDOW_ACTION_OPENED";
    goto LABEL_7;
  }
  if ([v18 integerValue])
  {
LABEL_12:
    long long v30 = 0;
    goto LABEL_26;
  }
  id v19 = @"BULLETIN_WINDOW_ACTION_CLOSED";
LABEL_7:
  uint64_t v47 = v15;
  if (v7)
  {
    uint64_t v20 = [(__CFString *)v19 stringByAppendingString:@"_WITH_PERSON"];
    uint64_t v21 = NSString;
    uint64_t v48 = v20;
    id v22 = HMDLocalizedStringForKey(v20);
    id v51 = 0;
    id v23 = [v15 composedName];
    long long v24 = [v21 localizedStringWithValidatedFormat:v22, @"%@ %@", &v51, v23, v7 validFormatSpecifiers error];
    id v25 = v51;

    if (!v24)
    {
      uint64_t v26 = (void *)MEMORY[0x1D9452090]();
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        long long v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        uint64_t v53 = v28;
        __int16 v54 = 2112;
        long long v29 = v48;
        __int16 v55 = v48;
        __int16 v56 = 2112;
        __int16 v57 = @"%@ %@";
        __int16 v58 = 2112;
        id v59 = v25;
LABEL_18:
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

LABEL_20:
        __int16 v35 = 0;
        uint64_t v48 = v29;
        long long v24 = v29;
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    long long v31 = [(__CFString *)v19 stringByAppendingString:@"_WITHOUT_PERSON"];
    uint64_t v32 = NSString;
    uint64_t v48 = v31;
    uint64_t v33 = HMDLocalizedStringForKey(v31);
    id v50 = 0;
    __int16 v34 = [v15 composedName];
    long long v24 = [v32 localizedStringWithValidatedFormat:v33, @"%@", &v50, v34 validFormatSpecifiers error];
    id v25 = v50;

    if (!v24)
    {
      uint64_t v26 = (void *)MEMORY[0x1D9452090]();
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        long long v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        uint64_t v53 = v28;
        __int16 v54 = 2112;
        long long v29 = v48;
        __int16 v55 = v48;
        __int16 v56 = 2112;
        __int16 v57 = @"%@";
        __int16 v58 = 2112;
        id v59 = v25;
        goto LABEL_18;
      }
LABEL_19:
      long long v29 = v48;
      goto LABEL_20;
    }
  }
  __int16 v35 = v24;
LABEL_21:
  id v36 = v24;

  id v37 = NSString;
  int v38 = HMDLocalizedStringForKey(@"BULLETIN_WINDOW_MESSAGE");
  id v49 = 0;
  uint64_t v39 = [v37 localizedStringWithValidatedFormat:v38, @"%@", &v49, v36 validFormatSpecifiers error];
  id v40 = v49;

  id v41 = v39;
  if (!v39)
  {
    __int16 v42 = (void *)MEMORY[0x1D9452090]();
    v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      char v44 = v46 = v42;
      *(_DWORD *)buf = 138544130;
      uint64_t v53 = v44;
      __int16 v54 = 2112;
      __int16 v55 = @"BULLETIN_WINDOW_MESSAGE";
      __int16 v56 = 2112;
      __int16 v57 = @"%@";
      __int16 v58 = 2112;
      id v59 = v40;
      _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      __int16 v42 = v46;
    }

    id v41 = @"BULLETIN_WINDOW_MESSAGE";
  }
  long long v30 = v41;

  uint64_t v15 = v47;
LABEL_26:

  return v30;
}

- (id)messageForSecuritySystemCharacteristic:(id)a3 personName:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v6 service];
  uint64_t v10 = [v9 name];
  uint64_t v11 = [v6 accessory];
  int v12 = [v11 room];
  id v13 = [v12 name];
  int v14 = HMDLocalizedStringForKey(@"BULLETIN_ACTION_ROOM_SERVICE");
  uint64_t v15 = +[HMDServiceNameComponents componentsWithRawServiceName:v10 rawRoomName:v13 localizedFormat:v14];

  id v16 = [v6 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  id v18 = v17;

  if (!v18) {
    goto LABEL_19;
  }
  if (![v18 integerValue])
  {
    id v19 = @"BULLETIN_SECURITY_SYSTEM_ACTION_ARMED_STAY";
    goto LABEL_15;
  }
  if ([v18 integerValue] == 1)
  {
    id v19 = @"BULLETIN_SECURITY_SYSTEM_ACTION_ARMED_AWAY";
    goto LABEL_15;
  }
  if ([v18 integerValue] == 2)
  {
    id v19 = @"BULLETIN_SECURITY_SYSTEM_ACTION_ARMED_NIGHT";
    goto LABEL_15;
  }
  if ([v18 integerValue] == 3)
  {
    id v19 = @"BULLETIN_SECURITY_SYSTEM_ACTION_DISARMED";
    goto LABEL_15;
  }
  if ([v18 integerValue] != 4)
  {
LABEL_19:
    long long v29 = 0;
    goto LABEL_32;
  }
  id v19 = @"BULLETIN_SECURITY_SYSTEM_ACTION_TRIGGERED";
LABEL_15:
  if (v7)
  {
    uint64_t v20 = [(__CFString *)v19 stringByAppendingString:@"_WITH_PERSON"];
    uint64_t v21 = NSString;
    id v45 = v20;
    id v22 = HMDLocalizedStringForKey(v20);
    id v48 = 0;
    id v23 = [v15 composedName];
    long long v24 = [v21 localizedStringWithValidatedFormat:v22, @"%@ %@", &v48, v23, v7 validFormatSpecifiers error];
    id v25 = v48;

    if (!v24)
    {
      uint64_t v26 = (void *)MEMORY[0x1D9452090]();
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        long long v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        id v50 = v28;
        __int16 v51 = 2112;
        long long v24 = v45;
        int v52 = v45;
        __int16 v53 = 2112;
        __int16 v54 = @"%@ %@";
        __int16 v55 = 2112;
        id v56 = v25;
LABEL_24:
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

LABEL_26:
        __int16 v34 = 0;
        id v45 = v24;
        goto LABEL_27;
      }
      goto LABEL_25;
    }
  }
  else
  {
    long long v30 = [(__CFString *)v19 stringByAppendingString:@"_WITHOUT_PERSON"];
    long long v31 = NSString;
    id v45 = v30;
    uint64_t v32 = HMDLocalizedStringForKey(v30);
    id v47 = 0;
    uint64_t v33 = [v15 composedName];
    long long v24 = [v31 localizedStringWithValidatedFormat:v32, @"%@", &v47, v33 validFormatSpecifiers error];
    id v25 = v47;

    if (!v24)
    {
      uint64_t v26 = (void *)MEMORY[0x1D9452090]();
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        long long v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        id v50 = v28;
        __int16 v51 = 2112;
        long long v24 = v45;
        int v52 = v45;
        __int16 v53 = 2112;
        __int16 v54 = @"%@";
        __int16 v55 = 2112;
        id v56 = v25;
        goto LABEL_24;
      }
LABEL_25:
      long long v24 = v45;
      goto LABEL_26;
    }
  }
  __int16 v34 = v24;
LABEL_27:
  __int16 v35 = v24;

  id v36 = NSString;
  id v37 = HMDLocalizedStringForKey(@"BULLETIN_SECURITY_SYSTEM_MESSAGE");
  id v46 = 0;
  int v38 = [v36 localizedStringWithValidatedFormat:v37, @"%@", &v46, v35 validFormatSpecifiers error];
  id v39 = v46;

  id v40 = v38;
  if (!v38)
  {
    id v41 = (void *)MEMORY[0x1D9452090]();
    __int16 v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      id v50 = v43;
      __int16 v51 = 2112;
      int v52 = @"BULLETIN_SECURITY_SYSTEM_MESSAGE";
      __int16 v53 = 2112;
      __int16 v54 = @"%@";
      __int16 v55 = 2112;
      id v56 = v39;
      _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
    }
    id v40 = @"BULLETIN_SECURITY_SYSTEM_MESSAGE";
  }
  long long v29 = v40;

LABEL_32:
  return v29;
}

- (id)messageForGarageDoorCharacteristic:(id)a3 personName:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v6 service];
  uint64_t v10 = [v9 name];
  uint64_t v11 = [v6 accessory];
  int v12 = [v11 room];
  id v13 = [v12 name];
  int v14 = HMDLocalizedStringForKey(@"BULLETIN_ACTION_ROOM_SERVICE");
  uint64_t v15 = +[HMDServiceNameComponents componentsWithRawServiceName:v10 rawRoomName:v13 localizedFormat:v14];

  id v16 = [v6 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  id v18 = v17;

  if (!v18) {
    goto LABEL_8;
  }
  if ([v18 integerValue])
  {
    if ([v18 integerValue] == 1)
    {
      id v19 = @"BULLETIN_DOOR_ACTION_CLOSED";
      goto LABEL_10;
    }
LABEL_8:
    uint64_t v20 = 0;
    goto LABEL_26;
  }
  id v19 = @"BULLETIN_DOOR_ACTION_OPENED";
LABEL_10:
  id v47 = v15;
  if (v7)
  {
    uint64_t v21 = [(__CFString *)v19 stringByAppendingString:@"_WITH_PERSON"];
    id v22 = NSString;
    id v48 = v21;
    id v23 = HMDLocalizedStringForKey(v21);
    id v51 = 0;
    long long v24 = [v15 composedName];
    id v25 = [v22 localizedStringWithValidatedFormat:v23, @"%@ %@", &v51, v24, v7 validFormatSpecifiers error];
    id v26 = v51;

    if (!v25)
    {
      id v27 = (void *)MEMORY[0x1D9452090]();
      long long v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        long long v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        __int16 v53 = v29;
        __int16 v54 = 2112;
        long long v30 = v48;
        __int16 v55 = v48;
        __int16 v56 = 2112;
        uint64_t v57 = @"%@ %@";
        __int16 v58 = 2112;
        id v59 = v26;
LABEL_18:
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

LABEL_20:
        __int16 v35 = 0;
        id v48 = v30;
        id v25 = v30;
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    long long v31 = [(__CFString *)v19 stringByAppendingString:@"_WITHOUT_PERSON"];
    uint64_t v32 = NSString;
    id v48 = v31;
    uint64_t v33 = HMDLocalizedStringForKey(v31);
    id v50 = 0;
    __int16 v34 = [v15 composedName];
    id v25 = [v32 localizedStringWithValidatedFormat:v33, @"%@", &v50, v34 validFormatSpecifiers error];
    id v26 = v50;

    if (!v25)
    {
      id v27 = (void *)MEMORY[0x1D9452090]();
      long long v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        long long v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        __int16 v53 = v29;
        __int16 v54 = 2112;
        long long v30 = v48;
        __int16 v55 = v48;
        __int16 v56 = 2112;
        uint64_t v57 = @"%@";
        __int16 v58 = 2112;
        id v59 = v26;
        goto LABEL_18;
      }
LABEL_19:
      long long v30 = v48;
      goto LABEL_20;
    }
  }
  __int16 v35 = v25;
LABEL_21:
  id v36 = v25;

  id v37 = NSString;
  int v38 = HMDLocalizedStringForKey(@"BULLETIN_DOOR_MESSAGE");
  id v49 = 0;
  id v39 = [v37 localizedStringWithValidatedFormat:v38, @"%@", &v49, v36 validFormatSpecifiers error];
  id v40 = v49;

  id v41 = v39;
  if (!v39)
  {
    __int16 v42 = (void *)MEMORY[0x1D9452090]();
    v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      char v44 = v46 = v42;
      *(_DWORD *)buf = 138544130;
      __int16 v53 = v44;
      __int16 v54 = 2112;
      __int16 v55 = @"BULLETIN_DOOR_MESSAGE";
      __int16 v56 = 2112;
      uint64_t v57 = @"%@";
      __int16 v58 = 2112;
      id v59 = v40;
      _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      __int16 v42 = v46;
    }

    id v41 = @"BULLETIN_DOOR_MESSAGE";
  }
  uint64_t v20 = v41;

  uint64_t v15 = v47;
LABEL_26:

  return v20;
}

- (void)resolveDisplayNameForChangedCharacteristic:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 accessory];
  uint64_t v9 = [v8 home];
  uint64_t v10 = [v9 lockNotificationManager];
  if ([v10 shouldResolveNotificationContextForCharacteristic:v6])
  {
    uint64_t v11 = [v6 notificationContext];
    int v12 = [v8 uuid];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__HMDBulletinBoard_resolveDisplayNameForChangedCharacteristic_completion___block_invoke;
    v13[3] = &unk_1E6A08D58;
    v13[4] = self;
    id v16 = v7;
    id v14 = v8;
    id v15 = v10;
    [v15 resolveEncodedCharacteristicNotificationContext:v11 accessoryUUID:v12 completion:v13];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __74__HMDBulletinBoard_resolveDisplayNameForChangedCharacteristic_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v10)
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Resolved notification context to result: %@", buf, 0x16u);
    }
    int v12 = [v5 userUUID];

    if (v12)
    {
      id v13 = [*(id *)(a1 + 40) home];
      id v14 = [v13 users];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __74__HMDBulletinBoard_resolveDisplayNameForChangedCharacteristic_completion___block_invoke_242;
      v18[3] = &unk_1E6A12608;
      id v19 = v5;
      id v15 = objc_msgSend(v14, "na_firstObjectPassingTest:", v18);

      [v15 isCurrentUser];
    }
    id v16 = [*(id *)(a1 + 48) displayNameForNotificationContextResolutionResult:v5];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (v10)
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to resolve notification context with error: %@, creating bulletin without display name", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __74__HMDBulletinBoard_resolveDisplayNameForChangedCharacteristic_completion___block_invoke_242(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  id v4 = [*(id *)(a1 + 32) userUUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)insertBulletinForChangedSecureClassCharacteristic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDBulletinBoard *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__HMDBulletinBoard_insertBulletinForChangedSecureClassCharacteristic___block_invoke;
  v8[3] = &unk_1E6A197C8;
  id v9 = v4;
  BOOL v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __70__HMDBulletinBoard_insertBulletinForChangedSecureClassCharacteristic___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) accessory];
  id v3 = [v2 home];
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) bulletinContext];
    uint64_t v5 = (void *)[v4 mutableCopy];

    id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2CA98]];
    id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2CAB0]];
    uint64_t v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2CA90]];
    id v9 = (void *)v8;
    if (v6) {
      BOOL v10 = v7 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10 || v8 == 0)
    {
      int v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = *(id *)(a1 + 40);
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        __int16 v54 = v15;
        __int16 v55 = 2112;
        __int16 v56 = v6;
        __int16 v57 = 2112;
        __int16 v58 = v7;
        __int16 v59 = 2112;
        uint64_t v60 = v9;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot generate action URL with homeUUID: %@ serviceUUID: %@ characteristicUUID: %@", buf, 0x2Au);
      }
    }
    else
    {
      id v40 = [MEMORY[0x1E4F2E690] tupleWithQueryType:0 uuidString:v6];
      int v38 = [MEMORY[0x1E4F2E690] tupleWithQueryType:2 uuidString:v7];
      id v39 = [MEMORY[0x1E4F2E690] tupleWithQueryType:3 uuidString:v9];
      uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
      v52[0] = v40;
      v52[1] = v39;
      __int16 v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
      id v23 = [v21 setWithArray:v22];
      uint64_t v24 = generateURLForHomeKitObject();

      id v25 = [v3 name];
      [MEMORY[0x1E4F1C9C8] date];
      id v26 = v41 = v9;
      [MEMORY[0x1E4F29128] UUID];
      id v27 = v43 = v6;
      long long v28 = [v27 UUIDString];

      unint64_t v29 = +[HMDBulletinBoard interruptionLevelForChangedCharacteristic:*(void *)(a1 + 32)];
      __int16 v42 = v7;
      long long v30 = *(void **)(a1 + 32);
      long long v31 = *(void **)(a1 + 40);
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __70__HMDBulletinBoard_insertBulletinForChangedSecureClassCharacteristic___block_invoke_237;
      v44[3] = &unk_1E6A08D30;
      v44[4] = v31;
      id v45 = v30;
      id v46 = v5;
      id v47 = v25;
      id v48 = v28;
      id v49 = v26;
      id v50 = v24;
      unint64_t v51 = v29;
      id v37 = v24;
      id v32 = v26;
      id v9 = v41;
      id v33 = v32;
      id v34 = v28;
      id v35 = v25;
      id v36 = v31;
      id v7 = v42;
      [v36 resolveDisplayNameForChangedCharacteristic:v45 completion:v44];

      id v6 = v43;
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = *(id *)(a1 + 40);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      uint64_t v20 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      __int16 v54 = v19;
      __int16 v55 = 2112;
      __int16 v56 = v20;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Not creating a bulletin for characteristic because home is nil: %@", buf, 0x16u);
    }
  }
}

void __70__HMDBulletinBoard_insertBulletinForChangedSecureClassCharacteristic___block_invoke_237(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) workQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__HMDBulletinBoard_insertBulletinForChangedSecureClassCharacteristic___block_invoke_2;
  v12[3] = &unk_1E6A08D08;
  char v22 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v7;
  id v15 = v8;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 64);
  id v19 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  uint64_t v10 = *(void *)(a1 + 88);
  id v20 = v9;
  uint64_t v21 = v10;
  id v11 = v5;
  dispatch_async(v6, v12);
}

void __70__HMDBulletinBoard_insertBulletinForChangedSecureClassCharacteristic___block_invoke_2(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (!*(unsigned char *)(a1 + 104))
  {
    uint64_t v7 = [*(id *)(a1 + 48) type];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F2CEB0]];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 40) messageForLockCharacteristic:*(void *)(a1 + 48) personName:v2];
      uint64_t v10 = v9;
      if (v2)
      {
        id v11 = [*(id *)(a1 + 40) messageForLockCharacteristic:*(void *)(a1 + 48) personName:@"<redacted>"];
        uint64_t v12 = 12;
        if (!v10) {
          goto LABEL_27;
        }
LABEL_23:
        uint64_t v21 = (void *)MEMORY[0x1D9452090]();
        id v22 = *(id *)(a1 + 40);
        id v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          uint64_t v24 = HMFGetLogIdentifier();
          uint64_t v25 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 138543874;
          id v33 = v24;
          __int16 v34 = 2112;
          id v35 = v11;
          __int16 v36 = 2112;
          uint64_t v37 = v25;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Inserting new bulletin with message: %@, userInfo: %@", buf, 0x20u);
        }
        id v26 = (id)[*(id *)(a1 + 40) _insertRequestWithTitle:*(void *)(a1 + 64) snapshotData:0 message:v10 requestIdentifier:*(void *)(a1 + 72) date:*(void *)(a1 + 80) bulletinType:0 actionURL:*(void *)(a1 + 88) bulletinContext:*(void *)(a1 + 56) actionContext:0 interruptionLevel:*(void *)(a1 + 96) logEventTopic:v12];
        goto LABEL_30;
      }
      id v18 = v9;
      id v11 = v18;
      uint64_t v12 = 12;
      goto LABEL_22;
    }
    id v13 = [*(id *)(a1 + 48) type];
    int v14 = [v13 isEqualToString:*MEMORY[0x1E4F2CE90]];

    if (v14)
    {
      uint64_t v10 = [*(id *)(a1 + 40) messageForGarageDoorCharacteristic:*(void *)(a1 + 48) personName:v2];
      if (v2)
      {
        uint64_t v15 = [*(id *)(a1 + 40) messageForGarageDoorCharacteristic:*(void *)(a1 + 48) personName:@"<redacted>"];
        goto LABEL_19;
      }
LABEL_21:
      id v18 = v10;
      id v11 = v18;
      uint64_t v12 = 8;
LABEL_22:
      uint64_t v10 = v18;
      if (v18) {
        goto LABEL_23;
      }
LABEL_27:
      id v27 = (void *)MEMORY[0x1D9452090]();
      id v28 = *(id *)(a1 + 40);
      unint64_t v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        long long v30 = HMFGetLogIdentifier();
        long long v31 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        id v33 = v30;
        __int16 v34 = 2112;
        id v35 = v31;
        _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Characteristic value does not require bulletin: %@", buf, 0x16u);
      }
      uint64_t v10 = 0;
LABEL_30:

      goto LABEL_31;
    }
    id v16 = [*(id *)(a1 + 48) type];
    int v17 = [v16 isEqualToString:*MEMORY[0x1E4F2CED0]];

    if (v17)
    {
      uint64_t v10 = [*(id *)(a1 + 40) messageForSecuritySystemCharacteristic:*(void *)(a1 + 48) personName:v2];
      if (!v2) {
        goto LABEL_21;
      }
      uint64_t v15 = [*(id *)(a1 + 40) messageForSecuritySystemCharacteristic:*(void *)(a1 + 48) personName:@"<redacted>"];
    }
    else
    {
      id v19 = [*(id *)(a1 + 48) type];
      int v20 = [v19 isEqualToString:*MEMORY[0x1E4F2CEC0]];

      if (!v20)
      {
        id v11 = 0;
        goto LABEL_27;
      }
      uint64_t v10 = [*(id *)(a1 + 40) messageForWindowCharacteristic:*(void *)(a1 + 48) personName:v2];
      if (!v2) {
        goto LABEL_21;
      }
      uint64_t v15 = [*(id *)(a1 + 40) messageForWindowCharacteristic:*(void *)(a1 + 48) personName:@"<redacted>"];
    }
LABEL_19:
    id v11 = (void *)v15;
    uint64_t v12 = 8;
    if (!v10) {
      goto LABEL_27;
    }
    goto LABEL_23;
  }
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 40);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v33 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Resolved notification context to current user, skipping bulletin", buf, 0xCu);
  }
LABEL_31:
}

- (void)_insertImageBulletinsForChangedCharacteristics:(id)a3 snapshotData:(id)a4 completion:(id)a5
{
  uint64_t v190 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v133 = (void (**)(id, void *))a5;
  v168 = self;
  uint64_t v10 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v10);

  v140 = [MEMORY[0x1E4F1CA48] array];
  long long v174 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  id v11 = v8;
  uint64_t v169 = [v11 countByEnumeratingWithState:&v174 objects:v189 count:16];
  if (v169)
  {
    uint64_t v166 = *MEMORY[0x1E4F5B888];
    uint64_t v167 = *(void *)v175;
    uint64_t v165 = *MEMORY[0x1E4F5BAB8];
    uint64_t v153 = *MEMORY[0x1E4F2EE88];
    uint64_t v152 = *MEMORY[0x1E4F2CA78];
    uint64_t v148 = *MEMORY[0x1E4F2CA98];
    uint64_t v137 = *MEMORY[0x1E4F2CA90];
    uint64_t v138 = *MEMORY[0x1E4F2CAB0];
    uint64_t v136 = *MEMORY[0x1E4F5BA78];
    uint64_t v139 = *MEMORY[0x1E4F2CAC8];
    id v159 = v11;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v175 != v167) {
          objc_enumerationMutation(v11);
        }
        id v13 = *(void **)(*((void *)&v174 + 1) + 8 * v12);
        int v14 = [v13 value];
        if (v14)
        {

LABEL_9:
          int v17 = [v13 service];
          id v18 = v17;
          if (!v17
            || ([v17 name], id v19 = objc_claimAutoreleasedReturnValue(), v19, !v19))
          {
            id v22 = (void *)MEMORY[0x1D9452090]();
            id v23 = v168;
            uint64_t v24 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v25 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v182 = v25;
              __int16 v183 = 2112;
              uint64_t v184 = (uint64_t)v13;
              _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Bulletin board changed characteristic's service or service name is nil: %@", buf, 0x16u);
            }
            goto LABEL_16;
          }
          int v20 = [v18 type];
          int v21 = [v20 isEqual:v165];

          if (v21)
          {
            [(HMDBulletinBoard *)v168 insertBulletinForChangedSecureClassCharacteristic:v13];
LABEL_16:

            goto LABEL_17;
          }
          long long v30 = [v18 bulletinBoardNotification];
          int v31 = [v30 isEnabled];

          id v32 = (void *)MEMORY[0x1D9452090]();
          id v33 = v168;
          __int16 v34 = HMFGetOSLogHandle();
          BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
          if (!v31)
          {
            if (v35)
            {
              int v52 = HMFGetLogIdentifier();
              __int16 v53 = [v13 service];
              [v53 bulletinBoardNotification];
              __int16 v55 = v54 = v9;
              *(_DWORD *)buf = 138543874;
              v182 = v52;
              __int16 v183 = 2112;
              uint64_t v184 = (uint64_t)v13;
              __int16 v185 = 2112;
              id v186 = v55;
              _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Not posting bulletin for %@ as it is not enabled: %@", buf, 0x20u);

              id v9 = v54;
            }

            __int16 v56 = [v9 objectForKeyedSubscript:v153];

            if (v56)
            {
              __int16 v57 = [MEMORY[0x1E4F28CB8] defaultManager];
              __int16 v58 = [v9 objectForKeyedSubscript:v153];
              id v170 = 0;
              [v57 removeItemAtPath:v58 error:&v170];
              id v59 = v170;

              uint64_t v60 = (void *)MEMORY[0x1D9452090]();
              uint64_t v61 = v33;
              v62 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
              {
                v63 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                v182 = v63;
                __int16 v183 = 2112;
                uint64_t v184 = (uint64_t)v9;
                __int16 v185 = 2112;
                id v186 = v59;
                _os_log_impl(&dword_1D49D5000, v62, OS_LOG_TYPE_INFO, "%{public}@Removed the bulletin snapshot file at %@ as it not being posted with result %@", buf, 0x20u);
              }
            }
            id v11 = v159;
            goto LABEL_16;
          }
          uint64_t v163 = (uint64_t)v9;
          if (v35)
          {
            __int16 v36 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v182 = v36;
            __int16 v183 = 2112;
            uint64_t v184 = (uint64_t)v13;
            _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Posting bulletin for changed characteristic: %@", buf, 0x16u);
          }
          uint64_t v158 = [MEMORY[0x1E4F1C9C8] date];
          uint64_t v37 = [v18 bulletinBoardNotification];
          uint64_t v38 = [v37 notificationServiceGroup];

          id v39 = [v38 cameraProfiles];
          id v40 = [v39 firstObject];

          id v41 = [v13 bulletinContext];
          __int16 v42 = (void *)[v41 mutableCopy];

          v160 = +[HMDBulletinCategory bulletinReasonForChangedCharacteristic:v13];
          objc_msgSend(v42, "setObject:forKeyedSubscript:");
          v43 = [v40 contextSPIUniqueIdentifier];
          char v44 = [v43 UUIDString];
          [v42 setObject:v44 forKeyedSubscript:v152];

          v156 = v33;
          uint64_t v154 = [(HMDBulletinBoard *)v33 titleNameForChangedCharacteristic:v13];
          id v45 = [v18 bulletinBoardNotification];
          id v46 = [v45 notificationServiceGroup];
          v161 = v40;
          id v47 = [v40 uniqueIdentifier];
          id v48 = [v46 actionContextForCameraProfileID:v47];

          id v49 = [v48 objectForKey:@"categoryID"];

          v155 = v38;
          v162 = v42;
          if (v49)
          {
            if (v163)
            {
              id v50 = [MEMORY[0x1E4F65548] productInfo];
              BOOL v51 = [v50 productPlatform] != 1;
            }
            else
            {
              BOOL v51 = 0;
            }
            uint64_t v72 = objc_msgSend(v162, "hmf_stringForKey:", v148);
            if (v72)
            {
              v64 = (void *)v72;
              uint64_t v73 = objc_msgSend(v48, "hmf_stringForKey:", v152);
              if (v73)
              {
                v65 = (void *)v73;
                v151 = +[HMDCameraClipSignificantEventBulletin actionURLForHomeUUID:v64 cameraUUID:v73];
LABEL_43:

                __int16 v74 = [MEMORY[0x1E4F29128] UUID];
                v147 = [v74 UUIDString];

                uint64_t v75 = [MEMORY[0x1E4F1CAD0] set];
                uint64_t v76 = [v161 clipManager];

                uint64_t v77 = v153;
                v150 = v48;
                BOOL v145 = v51;
                if (v76)
                {
                  long long v78 = [v13 type];
                  if (![v78 isEqualToString:v166])
                  {
                    __int16 v82 = v156;
                    goto LABEL_73;
                  }
                  long long v79 = v75;
                  __int16 v80 = [v18 type];
                  int v81 = [v80 isEqualToString:v136];

                  if (v81)
                  {
                    __int16 v82 = v156;
                    v83 = [(HMDBulletinBoard *)v156 doorbellBulletinUtilities];
                    uint64_t v84 = v158;
                    uint64_t v75 = [v83 significantEventsRelevantToDoorbellPress:v158 forCameraProfile:v161];

                    v135 = v75;
                    if (objc_msgSend(v75, "hmf_isEmpty"))
                    {
                      v85 = (void *)MEMORY[0x1D9452090]();
                      __int16 v86 = v156;
                      id v87 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
                      {
                        __int16 v88 = HMFGetLogIdentifier();
                        *(_DWORD *)buf = 138543362;
                        v182 = v88;
                        _os_log_impl(&dword_1D49D5000, v87, OS_LOG_TYPE_INFO, "%{public}@Did not find significant events, attempting cloud pull", buf, 0xCu);
                      }
                      uint64_t v89 = [v161 clipManager];
                      __int16 v90 = [v89 performCloudPull];
                      v91 = (void *)MEMORY[0x1E4F7A0F0];
                      __int16 v92 = [(HMDBulletinBoard *)v86 workQueue];
                      uint64_t v93 = [v91 schedulerWithDispatchQueue:v92];
                      __int16 v94 = [v90 reschedule:v93];
                      v171[0] = MEMORY[0x1E4F143A8];
                      v171[1] = 3221225472;
                      v171[2] = __91__HMDBulletinBoard__insertImageBulletinsForChangedCharacteristics_snapshotData_completion___block_invoke;
                      v171[3] = &unk_1E6A0F290;
                      v171[4] = v86;
                      id v172 = v147;
                      id v173 = v161;
                      id v95 = (id)[v94 addSuccessBlock:v171];

                      uint64_t v77 = v153;
                      __int16 v82 = v156;
                      uint64_t v84 = v158;
                      uint64_t v75 = v135;
                    }
                    [(HMDBulletinBoard *)v82 _submitDoorbellEventDetailsFromBulletinWithDate:v84 significantEvents:v75];
                    long long v78 = [(HMDBulletinBoard *)v82 removeRedundantSignificantEventNotificationsForSignificantEvents:v75];
                    uint64_t v142 = [v78 mutableCopy];
                    uint64_t v96 = [v78 sortedArrayUsingComparator:&__block_literal_global_234];
                    v97 = objc_msgSend(v96, "na_firstObjectPassingTest:", &__block_literal_global_236);

                    if (v97)
                    {
                      v98 = [v97 content];
                      v99 = [v98 userInfo];
                      [(HMDBulletinBoard *)v82 _updateDoorbellUserInfo:v162 withSignificantEventUserInfo:v99];

                      v100 = [v97 content];
                      v101 = [v100 userInfo];
                      v102 = [v101 objectForKeyedSubscript:v77];

                      if (v163)
                      {
                        __int16 v82 = v156;
                        v103 = (void *)v142;
                      }
                      else
                      {
                        __int16 v82 = v156;
                        v103 = (void *)v142;
                        if (v102)
                        {
                          context = (void *)MEMORY[0x1D9452090]();
                          v164 = v156;
                          v104 = HMFGetOSLogHandle();
                          if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
                          {
                            v105 = HMFGetLogIdentifier();
                            *(_DWORD *)buf = 138543362;
                            v182 = v105;
                            _os_log_impl(&dword_1D49D5000, v104, OS_LOG_TYPE_INFO, "%{public}@No snapshotData was provided, so using whatever we had in the mostRecentCoalescedPersonNotification", buf, 0xCu);

                            v103 = (void *)v142;
                            __int16 v82 = v156;
                          }

                          uint64_t v178 = v153;
                          v179 = v102;
                          uint64_t v163 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v179 forKeys:&v178 count:1];
                          [v103 removeObject:v97];
                        }
                      }

                      uint64_t v75 = v135;
                    }
                    else
                    {
                      v103 = (void *)v142;
                    }
                    [(HMDBulletinBoard *)v82 removeImageFilesForNotificationRequests:v103];

LABEL_73:
                  }
                  else
                  {
                    __int16 v82 = v156;
                    uint64_t v75 = v79;
                  }
                }
                else
                {
                  __int16 v82 = v156;
                }
                if ([v160 isEqualToString:v139]) {
                  uint64_t v121 = 9;
                }
                else {
                  uint64_t v121 = 8;
                }
                uint64_t v122 = [(HMDBulletinBoard *)v82 messageForChangedCharacteristic:v13 withSignificantEvents:v75];
                unint64_t v123 = +[HMDBulletinBoard interruptionLevelForChangedCharacteristic:v13];
                v124 = (void *)MEMORY[0x1D9452090]();
                v125 = v82;
                v126 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
                {
                  v127 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138544130;
                  v182 = v127;
                  __int16 v183 = 2112;
                  uint64_t v184 = v122;
                  __int16 v185 = 2112;
                  id v186 = v162;
                  __int16 v187 = 2112;
                  uint64_t v188 = v163;
                  _os_log_impl(&dword_1D49D5000, v126, OS_LOG_TYPE_INFO, "%{public}@Inserting new bulletin with message: %@, userInfo: %@, snapshotData: %@", buf, 0x2Au);
                }
                uint64_t v132 = v121;
                id v48 = v150;
                v109 = v162;
                v115 = (void *)v154;
                uint64_t v128 = v122;
                v143 = (void *)v122;
                v116 = (void *)v158;
                v129 = [(HMDBulletinBoard *)v125 _insertRequestWithTitle:v154 snapshotData:v163 message:v128 requestIdentifier:v147 date:v158 bulletinType:v145 actionURL:v151 bulletinContext:v162 actionContext:v150 interruptionLevel:v123 logEventTopic:v132];
                v130 = [v129 identifier];
                [v140 addObject:v130];

                id v9 = (id)v163;
                id v11 = v159;
LABEL_80:

                goto LABEL_16;
              }
              v117 = (void *)MEMORY[0x1D9452090]();
              v118 = v156;
              v119 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
              {
                v120 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v182 = v120;
                __int16 v183 = 2112;
                uint64_t v184 = (uint64_t)v48;
                _os_log_impl(&dword_1D49D5000, v119, OS_LOG_TYPE_ERROR, "%{public}@Camera UUID is absent in action context: %@", buf, 0x16u);
              }

              v109 = v162;
              id v9 = (id)v163;
            }
            else
            {
              v106 = (void *)MEMORY[0x1D9452090]();
              v107 = v156;
              v108 = HMFGetOSLogHandle();
              v109 = v162;
              if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
              {
                v110 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v182 = v110;
                __int16 v183 = 2112;
                uint64_t v184 = (uint64_t)v162;
                _os_log_impl(&dword_1D49D5000, v108, OS_LOG_TYPE_ERROR, "%{public}@Home UUID is absent in bulletin context: %@", buf, 0x16u);
              }
              id v9 = (id)v163;
            }
            v115 = (void *)v154;
            v116 = (void *)v158;
            id v11 = v159;
            goto LABEL_80;
          }
          v64 = [v42 objectForKeyedSubscript:v148];
          v65 = [v42 objectForKeyedSubscript:v138];
          uint64_t v66 = [v42 objectForKeyedSubscript:v137];
          id v67 = (void *)v66;
          id v11 = v159;
          if (v64 && v65 && v66)
          {
            v144 = [MEMORY[0x1E4F2E690] tupleWithQueryType:0 uuidString:v64];
            v141 = [MEMORY[0x1E4F2E690] tupleWithQueryType:2 uuidString:v65];
            id v68 = [MEMORY[0x1E4F2E690] tupleWithQueryType:3 uuidString:v67];
            v146 = v67;
            v69 = (void *)MEMORY[0x1E4F1CAD0];
            v180[0] = v144;
            v180[1] = v68;
            [MEMORY[0x1E4F1C978] arrayWithObjects:v180 count:2];
            v70 = v149 = v48;
            uint64_t v71 = [v69 setWithArray:v70];
            v151 = generateURLForHomeKitObject();

            id v48 = v149;
            BOOL v51 = 0;
            goto LABEL_43;
          }
          v111 = (void *)MEMORY[0x1D9452090]();
          v112 = v156;
          v113 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v114 = v157 = v111;
            *(_DWORD *)buf = 138544130;
            v182 = v114;
            __int16 v183 = 2112;
            uint64_t v184 = (uint64_t)v64;
            __int16 v185 = 2112;
            id v186 = v65;
            __int16 v187 = 2112;
            uint64_t v188 = (uint64_t)v67;
            _os_log_impl(&dword_1D49D5000, v113, OS_LOG_TYPE_ERROR, "%{public}@Cannot generate action URL with homeUUID: %@ serviceUUID: %@ characteristicUUID: %@", buf, 0x2Au);

            v111 = v157;
          }

          v109 = v162;
          id v9 = (id)v163;
          v115 = (void *)v154;
          v116 = (void *)v158;
          goto LABEL_80;
        }
        uint64_t v15 = [v13 type];
        char v16 = [v15 isEqualToString:v166];

        if (v16) {
          goto LABEL_9;
        }
        id v26 = (void *)MEMORY[0x1D9452090]();
        id v27 = v168;
        id v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v182 = v29;
          __int16 v183 = 2112;
          uint64_t v184 = (uint64_t)v13;
          _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Bulletin board changed characteristic value is nil: %@", buf, 0x16u);
        }
LABEL_17:
        ++v12;
      }
      while (v169 != v12);
      uint64_t v131 = [v11 countByEnumeratingWithState:&v174 objects:v189 count:16];
      uint64_t v169 = v131;
    }
    while (v131);
  }

  if (v133) {
    v133[2](v133, v140);
  }
}

void __91__HMDBulletinBoard__insertImageBulletinsForChangedCharacteristics_snapshotData_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Cloud pull succeeded, updating notification", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 32) updateMessageForDoorbellPressNotificationRequestWithIdentifier:*(void *)(a1 + 40) cameraProfile:*(void *)(a1 + 48)];
}

uint64_t __91__HMDBulletinBoard__insertImageBulletinsForChangedCharacteristics_snapshotData_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 content];
  id v3 = [v2 userInfo];
  id v4 = objc_msgSend(v3, "hmf_numberForKey:", @"HMDBulletinContextDidDetectedPerson");
  uint64_t v5 = [v4 BOOLValue];

  return v5;
}

uint64_t __91__HMDBulletinBoard__insertImageBulletinsForChangedCharacteristics_snapshotData_completion___block_invoke_231(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 content];
  id v6 = [v5 date];
  uint64_t v7 = [v4 content];

  int v8 = [v7 date];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (id)removeRedundantSignificantEventNotificationsForSignificantEvents:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDBulletinBoard *)self doorbellBulletinUtilities];
  uint64_t v7 = [v6 clipUUIDsForCoalesceableSignificantEvents:v4];

  int v8 = [(HMDBulletinBoard *)self notificationRequestsForCameraClipUUIDs:v7];
  uint64_t v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v17 = 138543618;
    id v18 = v12;
    __int16 v19 = 2112;
    int v20 = v8;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Removing significant event notifications (due to doorbell notification): %@", (uint8_t *)&v17, 0x16u);
  }
  id v13 = [v8 allObjects];
  int v14 = objc_msgSend(v13, "na_map:", &__block_literal_global_228_27026);

  [(HMDBulletinBoard *)v10 removeNotificationRequestsWithIdentifiers:v14 shouldDeleteAttachments:0];
  uint64_t v15 = [v8 allObjects];

  return v15;
}

uint64_t __85__HMDBulletinBoard_removeRedundantSignificantEventNotificationsForSignificantEvents___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (id)titleNameForChangedCharacteristic:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 accessory];
  uint64_t v5 = [v3 type];
  if (([v5 isEqualToString:*MEMORY[0x1E4F5B7D8]] & 1) == 0)
  {

    goto LABEL_9;
  }
  id v6 = [v3 service];
  uint64_t v7 = [v6 type];
  int v8 = [v7 isEqualToString:@"00000260-0000-1000-8000-0026BB765291"];

  if (!v8)
  {
LABEL_9:
    __int16 v19 = [v4 home];
    id v18 = [v19 name];

    goto LABEL_10;
  }
  uint64_t v9 = NSString;
  uint64_t v10 = HMDLocalizedStringForKey(@"BULLETIN_KEYPAD_DISABLED_TITLE");
  id v21 = 0;
  id v11 = [v4 name];
  uint64_t v12 = [v9 localizedStringWithValidatedFormat:v10, @"%@", &v21, v11 validFormatSpecifiers error];
  id v13 = v21;

  int v14 = v12;
  if (!v12)
  {
    uint64_t v15 = (void *)MEMORY[0x1D9452090]();
    char v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      id v23 = v17;
      __int16 v24 = 2112;
      uint64_t v25 = @"BULLETIN_KEYPAD_DISABLED_TITLE";
      __int16 v26 = 2112;
      id v27 = @"%@";
      __int16 v28 = 2112;
      id v29 = v13;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
    }
    int v14 = @"BULLETIN_KEYPAD_DISABLED_TITLE";
  }
  id v18 = v14;

LABEL_10:
  return v18;
}

- (id)messageForLockCharacteristic:(id)a3 personName:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v6 service];
  uint64_t v10 = [v9 name];
  id v11 = [v6 accessory];
  uint64_t v12 = [v11 room];
  id v13 = [v12 name];
  int v14 = HMDLocalizedStringForKey(@"BULLETIN_ACTION_ROOM_SERVICE");
  uint64_t v15 = +[HMDServiceNameComponents componentsWithRawServiceName:v10 rawRoomName:v13 localizedFormat:v14];

  char v16 = [v6 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v17 = v16;
  }
  else {
    int v17 = 0;
  }
  id v18 = v17;

  if (!v18) {
    goto LABEL_19;
  }
  if (![v18 integerValue])
  {
    __int16 v19 = @"BULLETIN_LOCK_ACTION_UNLOCKED";
    goto LABEL_11;
  }
  if ([v18 integerValue] == 1)
  {
    __int16 v19 = @"BULLETIN_LOCK_ACTION_LOCKED";
    goto LABEL_11;
  }
  if ([v18 integerValue] != 2)
  {
LABEL_19:
    uint64_t v37 = 0;
    goto LABEL_27;
  }
  __int16 v19 = @"BULLETIN_LOCK_ACTION_JAMMED";
LABEL_11:
  int v20 = NSString;
  id v21 = HMDLocalizedStringForKey(v19);
  id v45 = 0;
  __int16 v42 = v15;
  id v22 = [v15 composedName];
  id v23 = [v20 localizedStringWithValidatedFormat:v21, @"%@", &v45, v22 validFormatSpecifiers error];
  id v24 = v45;

  uint64_t v25 = v23;
  if (!v23)
  {
    __int16 v26 = (void *)MEMORY[0x1D9452090]();
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = id v41 = v26;
      *(_DWORD *)buf = 138544130;
      id v47 = v28;
      __int16 v48 = 2112;
      id v49 = v19;
      __int16 v50 = 2112;
      BOOL v51 = @"%@";
      __int16 v52 = 2112;
      id v53 = v24;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      __int16 v26 = v41;
    }

    uint64_t v25 = v19;
  }
  id v29 = v25;

  uint64_t v30 = NSString;
  if (v7)
  {
    int v31 = HMDLocalizedStringForKey(@"BULLETIN_LOCK_MESSAGE_WITH_PERSON");
    id v44 = 0;
    id v32 = [v30 localizedStringWithValidatedFormat:v31, @"%@ %@", &v44, v29, v7 validFormatSpecifiers error];
    id v33 = v44;

    if (!v32)
    {
      __int16 v34 = (void *)MEMORY[0x1D9452090]();
      BOOL v35 = HMFGetOSLogHandle();
      id v32 = @"BULLETIN_LOCK_MESSAGE_WITH_PERSON";
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        __int16 v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        id v47 = v36;
        __int16 v48 = 2112;
        id v49 = @"BULLETIN_LOCK_MESSAGE_WITH_PERSON";
        __int16 v50 = 2112;
        BOOL v51 = @"%@ %@";
        __int16 v52 = 2112;
        id v53 = v33;
LABEL_24:
        _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        goto LABEL_25;
      }
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v38 = HMDLocalizedStringForKey(@"BULLETIN_LOCK_MESSAGE_WITHOUT_PERSON");
    id v43 = 0;
    id v32 = [v30 localizedStringWithValidatedFormat:v38, @"%@", &v43, v29 validFormatSpecifiers error];
    id v33 = v43;

    if (!v32)
    {
      __int16 v34 = (void *)MEMORY[0x1D9452090]();
      BOOL v35 = HMFGetOSLogHandle();
      id v32 = @"BULLETIN_LOCK_MESSAGE_WITHOUT_PERSON";
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        __int16 v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        id v47 = v36;
        __int16 v48 = 2112;
        id v49 = @"BULLETIN_LOCK_MESSAGE_WITHOUT_PERSON";
        __int16 v50 = 2112;
        BOOL v51 = @"%@";
        __int16 v52 = 2112;
        id v53 = v33;
        goto LABEL_24;
      }
LABEL_25:
      uint64_t v15 = v42;

      id v39 = 0;
      goto LABEL_26;
    }
  }
  id v39 = v32;
  uint64_t v15 = v42;
LABEL_26:
  uint64_t v37 = v32;

LABEL_27:
  return v37;
}

- (id)messageForChangedCharacteristic:(id)a3 withSignificantEvents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v6 service];
  uint64_t v10 = [v9 bulletinBoardNotification];
  id v11 = [v10 notificationServiceGroup];

  uint64_t v12 = [v11 cameraProfiles];
  id v13 = [v12 firstObject];

  if (!v13) {
    goto LABEL_8;
  }
  int v14 = [v6 type];
  int v15 = [v14 isEqualToString:*MEMORY[0x1E4F5B8A0]];

  if (v15)
  {
    char v16 = [v11 cameraProfiles];
    int v17 = [v16 firstObject];

    id v18 = objc_alloc(MEMORY[0x1E4F2E738]);
    __int16 v19 = [MEMORY[0x1E4F29128] UUID];
    [MEMORY[0x1E4F1C9C8] date];
    int v20 = v31 = v7;
    id v21 = [v17 uniqueIdentifier];
    id v22 = (void *)[v18 initWithUniqueIdentifier:v19 reason:1 dateOfOccurrence:v20 confidenceLevel:100 cameraProfileUUID:v21 faceClassification:0];

    id v23 = [MEMORY[0x1E4F1CAD0] setWithObject:v22];
    id v24 = [v17 hapAccessory];
    uint64_t v25 = +[HMDCameraClipSignificantEventBulletin localizedMessageForSignificantEvents:v23 cameraAccessory:v24];

    id v7 = v31;
    goto LABEL_10;
  }
  __int16 v26 = [v6 type];
  if (([v26 isEqualToString:*MEMORY[0x1E4F5B888]] & 1) == 0)
  {

    goto LABEL_8;
  }
  id v27 = [v9 type];
  int v28 = [v27 isEqualToString:*MEMORY[0x1E4F5BA78]];

  if (!v28)
  {
LABEL_8:
    int v17 = [(HMDBulletinBoard *)self doorbellBulletinUtilities];
    uint64_t v29 = +[HMDBulletinCategory localizedStateForCharacteristic:v6 doorbellBulletinUtilities:v17];
    goto LABEL_9;
  }
  int v17 = [(HMDBulletinBoard *)self doorbellBulletinUtilities];
  uint64_t v29 = [v17 localizedDoorbellMessageForSignificantEvents:v7];
LABEL_9:
  uint64_t v25 = (void *)v29;
LABEL_10:

  return v25;
}

- (void)addNotificationRequest:(id)a3 forIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v14 = 138543874;
    int v15 = v12;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Adding Notification Request: %@ requestIdentifier:%@", (uint8_t *)&v14, 0x20u);
  }
  id v13 = [(HMDBulletinBoard *)v10 notificationRequests];
  [v13 setObject:v6 forKeyedSubscript:v7];

  [(HMDBulletinBoard *)v10 cullBulletinsToCount:20];
  [(HMDBulletinBoard *)v10 archive];
}

- (void)removeNotificationRequestsWithIdentifiers:(id)a3 shouldDeleteAttachments:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v7);

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v6;
  uint64_t v41 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v41)
  {
    uint64_t v9 = *(void *)v44;
    uint64_t v40 = *MEMORY[0x1E4F2EE88];
    *(void *)&long long v8 = 138543874;
    long long v37 = v8;
    uint64_t v38 = self;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v12 = [(HMDBulletinBoard *)self notificationRequests];
        id v13 = [v12 objectForKeyedSubscript:v11];

        if (v13)
        {
          int v14 = (void *)MEMORY[0x1D9452090]();
          int v15 = self;
          __int16 v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            id v17 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            __int16 v48 = v17;
            __int16 v49 = 2112;
            __int16 v50 = v11;
            _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Removing notification request with identifier: %@", buf, 0x16u);
          }
          __int16 v18 = [(HMDBulletinBoard *)v15 notificationRequests];
          [v18 setObject:0 forKeyedSubscript:v11];

          id v19 = [v13 content];
          uint64_t v20 = [v19 userInfo];
          id v21 = [v20 objectForKeyedSubscript:v40];

          if (v4 && v21)
          {
            uint64_t v22 = v9;
            BOOL v23 = v4;
            id v24 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v42 = 0;
            int v25 = [v24 removeItemAtPath:v21 error:&v42];
            id v26 = v42;

            id v27 = (void *)MEMORY[0x1D9452090]();
            int v28 = v15;
            uint64_t v29 = HMFGetOSLogHandle();
            uint64_t v30 = v29;
            if (v25)
            {
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                id v31 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                __int16 v48 = v31;
                __int16 v49 = 2112;
                __int16 v50 = v21;
                id v32 = v30;
                os_log_type_t v33 = OS_LOG_TYPE_INFO;
                __int16 v34 = "%{public}@Removed the bulletin snapshot file at %@";
                uint32_t v35 = 22;
                goto LABEL_16;
              }
            }
            else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              id v31 = HMFGetLogIdentifier();
              *(_DWORD *)buf = v37;
              __int16 v48 = v31;
              __int16 v49 = 2112;
              __int16 v50 = v21;
              __int16 v51 = 2112;
              id v52 = v26;
              id v32 = v30;
              os_log_type_t v33 = OS_LOG_TYPE_ERROR;
              __int16 v34 = "%{public}@Failed to remove the bulletin snapshot file at %@: %@";
              uint32_t v35 = 32;
LABEL_16:
              _os_log_impl(&dword_1D49D5000, v32, v33, v34, buf, v35);
            }

            BOOL v4 = v23;
            uint64_t v9 = v22;
            self = v38;
          }
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v41);
  }

  __int16 v36 = [(HMDBulletinBoard *)self notificationCenter];
  [v36 removeNotificationRequestsWithIdentifiers:obj];

  [(HMDBulletinBoard *)self archive];
}

- (void)removeBulletinsUsingPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDBulletinBoard *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDBulletinBoard *)self notificationRequests];
  id v7 = [v6 allValues];
  id v9 = [v7 filteredArrayUsingPredicate:v4];

  long long v8 = objc_msgSend(v9, "na_map:", &__block_literal_global_201);
  [(HMDBulletinBoard *)self removeNotificationRequestsWithIdentifiers:v8 shouldDeleteAttachments:1];
}

uint64_t __50__HMDBulletinBoard_removeBulletinsUsingPredicate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)cullBulletinsToCount:(unint64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HMDBulletinBoard *)self notificationRequests];
  unint64_t v6 = [v5 count];

  BOOL v7 = v6 > a3;
  unint64_t v8 = v6 - a3;
  if (v7)
  {
    id v9 = [(HMDBulletinBoard *)self notificationRequestsSortedByDate];
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", a3, v8);
    id v11 = [v9 objectsAtIndexes:v10];
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          __int16 v18 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v17), "identifier", (void)v23);
          [v12 addObject:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v15);
    }

    id v19 = (void *)MEMORY[0x1D9452090]();
    uint64_t v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v28 = v22;
      __int16 v29 = 2112;
      uint64_t v30 = v12;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Culling bulletin with identifiers: %@", buf, 0x16u);
    }
    [(HMDBulletinBoard *)v20 removeNotificationRequestsWithIdentifiers:v12 shouldDeleteAttachments:1];
  }
}

- (void)updateContent:(id)a3 forNotificationWithRequestIdentifier:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v21 = 138543874;
    uint64_t v22 = v11;
    __int16 v23 = 2112;
    id v24 = v7;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating notification with request identifier %@ with content: %@", (uint8_t *)&v21, 0x20u);
  }
  uint64_t v12 = [(HMDBulletinBoard *)v9 notificationRequests];
  id v13 = [v12 objectForKeyedSubscript:v7];

  uint64_t v14 = (void *)MEMORY[0x1E4F44628];
  uint64_t v15 = [v13 identifier];
  uint64_t v16 = [v13 trigger];
  uint64_t v17 = [v14 requestWithIdentifier:v15 content:v6 trigger:v16];
  __int16 v18 = [(HMDBulletinBoard *)v9 notificationRequests];
  [v18 setObject:v17 forKeyedSubscript:v7];

  id v19 = [(HMDBulletinBoard *)v9 notificationCenter];
  uint64_t v20 = [v13 identifier];
  [v19 updateContent:v6 forNotificationWithRequestIdentifier:v20];
}

- (id)threadIdentifierForNotificationGroupWithHomeContextID:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDBulletinBoard *)self notificationRequestsSortedByDate];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __74__HMDBulletinBoard_threadIdentifierForNotificationGroupWithHomeContextID___block_invoke;
  v33[3] = &unk_1E6A08C80;
  id v6 = v4;
  id v34 = v6;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v33);

  if (v7)
  {
    unint64_t v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = [v7 content];
      id v13 = [v12 date];
      *(_DWORD *)buf = 138543874;
      __int16 v36 = v11;
      __int16 v37 = 2112;
      uint64_t v38 = v7;
      __int16 v39 = 2112;
      uint64_t v40 = v13;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Found last notification posted for this home: %@ with date: %@", buf, 0x20u);
    }
    uint64_t v14 = [(HMDBulletinBoard *)v9 bulletinNotificationsGroupTimeInterval];
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-(double)v14];
    uint64_t v16 = [v7 content];
    uint64_t v17 = [v16 date];

    uint64_t v18 = [v17 compare:v15];
    if (v14 && v18 == 1)
    {
      id v19 = (void *)MEMORY[0x1D9452090]();
      uint64_t v20 = v9;
      int v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        __int16 v23 = [v7 content];
        id v24 = [v23 threadIdentifier];
        *(_DWORD *)buf = 138543618;
        __int16 v36 = v22;
        __int16 v37 = 2112;
        uint64_t v38 = v24;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Returning thread identifier of last notification: %@ because it was posted in allowed window", buf, 0x16u);
      }
      __int16 v25 = [v7 content];
      id v26 = [v25 threadIdentifier];

      goto LABEL_13;
    }
  }
  uint64_t v27 = [MEMORY[0x1E4F29128] UUID];
  id v26 = [v27 UUIDString];

  int v28 = (void *)MEMORY[0x1D9452090]();
  __int16 v29 = self;
  uint64_t v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    id v31 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v36 = v31;
    __int16 v37 = 2112;
    uint64_t v38 = v26;
    _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Returning a new threadIdentifier: %@", buf, 0x16u);
  }
LABEL_13:

  return v26;
}

uint64_t __74__HMDBulletinBoard_threadIdentifierForNotificationGroupWithHomeContextID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 content];
  id v4 = [v3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"home"];
  uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  return v6;
}

- (id)notificationRequestsSortedByDate
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(HMDBulletinBoard *)self notificationRequests];
  id v3 = [v2 allValues];
  id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"content.date" ascending:0];
  v8[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v6 = [v3 sortedArrayUsingDescriptors:v5];

  return v6;
}

- (void)removeAllBulletins
{
  id v3 = [(HMDBulletinBoard *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__HMDBulletinBoard_removeAllBulletins__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __38__HMDBulletinBoard_removeAllBulletins__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cullBulletinsToCount:0];
}

- (void)removeBulletinWithRecordID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDBulletinBoard *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__HMDBulletinBoard_removeBulletinWithRecordID___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__HMDBulletinBoard_removeBulletinWithRecordID___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(void *)(a1 + 40);
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 removeNotificationRequestsWithIdentifiers:v2 shouldDeleteAttachments:1];
}

- (void)removeCameraClipBulletinsForCameraProfile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDBulletinBoard *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HMDBulletinBoard_removeCameraClipBulletinsForCameraProfile___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__HMDBulletinBoard_removeCameraClipBulletinsForCameraProfile___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F28F60];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__HMDBulletinBoard_removeCameraClipBulletinsForCameraProfile___block_invoke_2;
  v4[3] = &unk_1E6A08C58;
  id v5 = *(id *)(a1 + 32);
  id v3 = [v2 predicateWithBlock:v4];
  [*(id *)(a1 + 40) removeBulletinsUsingPredicate:v3];
}

uint64_t __62__HMDBulletinBoard_removeCameraClipBulletinsForCameraProfile___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 content];
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2CA80]];

  id v7 = [v3 content];

  id v8 = [v7 userInfo];
  id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2CA78]];

  if (v6)
  {
    uint64_t v10 = [*(id *)(a1 + 32) contextSPIUniqueIdentifier];
    id v11 = [v10 UUIDString];
    uint64_t v12 = [v9 isEqualToString:v11];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)removeBulletinsForTrigger:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBulletinBoard *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__HMDBulletinBoard_removeBulletinsForTrigger___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__HMDBulletinBoard_removeBulletinsForTrigger___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F28F60];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__HMDBulletinBoard_removeBulletinsForTrigger___block_invoke_2;
  v4[3] = &unk_1E6A08C58;
  id v5 = *(id *)(a1 + 32);
  id v3 = [v2 predicateWithBlock:v4];
  [*(id *)(a1 + 40) removeBulletinsUsingPredicate:v3];
}

uint64_t __46__HMDBulletinBoard_removeBulletinsForTrigger___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 content];
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"trigger"];

  uint64_t v6 = [*(id *)(a1 + 32) isEqualToString:v5];
  return v6;
}

- (void)removeBulletinsForService:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBulletinBoard *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__HMDBulletinBoard_removeBulletinsForService___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__HMDBulletinBoard_removeBulletinsForService___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F28F60];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__HMDBulletinBoard_removeBulletinsForService___block_invoke_2;
  v4[3] = &unk_1E6A08C58;
  id v5 = *(id *)(a1 + 32);
  id v3 = [v2 predicateWithBlock:v4];
  [*(id *)(a1 + 40) removeBulletinsUsingPredicate:v3];
}

uint64_t __46__HMDBulletinBoard_removeBulletinsForService___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 content];
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"service"];

  id v6 = [*(id *)(a1 + 32) contextID];
  uint64_t v7 = [v6 isEqualToString:v5];

  return v7;
}

- (void)removeBulletinsForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBulletinBoard *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HMDBulletinBoard_removeBulletinsForAccessory___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__HMDBulletinBoard_removeBulletinsForAccessory___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F28F60];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__HMDBulletinBoard_removeBulletinsForAccessory___block_invoke_2;
  v4[3] = &unk_1E6A08C58;
  id v5 = *(id *)(a1 + 32);
  id v3 = [v2 predicateWithBlock:v4];
  [*(id *)(a1 + 40) removeBulletinsUsingPredicate:v3];
}

uint64_t __48__HMDBulletinBoard_removeBulletinsForAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 content];
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"accessory"];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) contextID];
    uint64_t v7 = [v6 isEqualToString:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)removeBulletinsForHome:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBulletinBoard *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__HMDBulletinBoard_removeBulletinsForHome___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__HMDBulletinBoard_removeBulletinsForHome___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F28F60];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__HMDBulletinBoard_removeBulletinsForHome___block_invoke_2;
  v4[3] = &unk_1E6A08C58;
  id v5 = *(id *)(a1 + 32);
  id v3 = [v2 predicateWithBlock:v4];
  [*(id *)(a1 + 40) removeBulletinsUsingPredicate:v3];
}

uint64_t __43__HMDBulletinBoard_removeBulletinsForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 content];
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"home"];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) contextID];
    uint64_t v7 = [v6 isEqualToString:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)refreshHomeBadgeNumber
{
  id v3 = [(HMDBulletinBoard *)self isConfiguredFuture];
  id v4 = (void *)MEMORY[0x1E4F7A0F0];
  id v5 = [(HMDBulletinBoard *)self workQueue];
  id v6 = [v4 schedulerWithDispatchQueue:v5];
  uint64_t v7 = [v3 reschedule:v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__HMDBulletinBoard_refreshHomeBadgeNumber__block_invoke;
  v9[3] = &unk_1E6A17A30;
  v9[4] = self;
  id v8 = (id)[v7 addCompletionBlock:v9];
}

void __42__HMDBulletinBoard_refreshHomeBadgeNumber__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) homeManager];
  id v8 = v7;
  if (v7)
  {
    id v23 = v6;
    id v9 = v5;
    uint64_t v10 = [v7 numberOfPendingIncomingInvitation];
    uint64_t v11 = [v8 numberOfAccessoryWithNewFirmwareAvailable];
    uint64_t v12 = v11 + v10;
    id v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v25 = v16;
      __int16 v26 = 2048;
      uint64_t v27 = v10;
      __int16 v28 = 2048;
      uint64_t v29 = v11;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Refreshing home badge number to %lu (invitation) + %lu (firmware update).", buf, 0x20u);
    }
    id v5 = v9;
    id v6 = v23;
    if ((v12 & 0x8000000000000000) == 0)
    {
      uint64_t v17 = [*(id *)(a1 + 32) notificationCenter];

      if (v17)
      {
        uint64_t v18 = [*(id *)(a1 + 32) notificationCenter];
        [v18 setBadgeNumber:v12];
      }
    }
  }
  else
  {
    id v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = *(id *)(a1 + 32);
    int v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v25 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Home manager is not yet configured, bailing refreshHomeBadgeNumber.", buf, 0xCu);
    }
  }
}

- (void)insertNewRMVLanguageBulletinForHome:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDBulletinBoard *)self isConfiguredFuture];
  id v9 = (void *)MEMORY[0x1E4F7A0F0];
  uint64_t v10 = [(HMDBulletinBoard *)self workQueue];
  uint64_t v11 = [v9 schedulerWithDispatchQueue:v10];
  uint64_t v12 = [v8 reschedule:v11];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__HMDBulletinBoard_insertNewRMVLanguageBulletinForHome_language___block_invoke;
  v16[3] = &unk_1E6A17908;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v13 = v7;
  id v14 = v6;
  id v15 = (id)[v12 addCompletionBlock:v16];
}

void __65__HMDBulletinBoard_insertNewRMVLanguageBulletinForHome_language___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) homeManager];

  if (v7)
  {
    id v57 = v6;
    id v58 = v5;
    id v8 = [*(id *)(a1 + 40) homeBulletinContext];
    uint64_t v9 = objc_msgSend(v8, "hmf_stringForKey:", *MEMORY[0x1E4F2CA98]);

    uint64_t v10 = NSString;
    uint64_t v11 = HMDLocalizedStringForKey(@"BULLETIN_NEW_RMV_LANGUAGE_TITLE");
    id v60 = 0;
    uint64_t v12 = [v10 localizedStringWithValidatedFormat:v11, @"%@", &v60, *(void *)(a1 + 48) validFormatSpecifiers error];
    id v13 = v60;

    id v14 = v12;
    if (!v12)
    {
      id v15 = (void *)MEMORY[0x1D9452090]();
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v62 = v17;
        __int16 v63 = 2112;
        v64 = @"BULLETIN_NEW_RMV_LANGUAGE_TITLE";
        __int16 v65 = 2112;
        uint64_t v66 = @"%@";
        __int16 v67 = 2112;
        id v68 = v13;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
      }
      id v14 = @"BULLETIN_NEW_RMV_LANGUAGE_TITLE";
    }
    __int16 v55 = v14;

    id v18 = NSString;
    id v19 = HMDLocalizedStringForKey(@"BULLETIN_NEW_RMV_LANGUAGE_MESSAGE");
    id v59 = 0;
    id v20 = [v18 localizedStringWithValidatedFormat:v19, @"%@", &v59, *(void *)(a1 + 48) validFormatSpecifiers error];
    id v21 = v59;

    uint64_t v22 = v20;
    if (!v20)
    {
      uint64_t v23 = v9;
      id v24 = (void *)MEMORY[0x1D9452090]();
      __int16 v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        __int16 v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v62 = v26;
        __int16 v63 = 2112;
        v64 = @"BULLETIN_NEW_RMV_LANGUAGE_MESSAGE";
        __int16 v65 = 2112;
        uint64_t v66 = @"%@";
        __int16 v67 = 2112;
        id v68 = v21;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
      }
      uint64_t v22 = @"BULLETIN_NEW_RMV_LANGUAGE_MESSAGE";
      uint64_t v9 = v23;
    }
    uint64_t v27 = v22;

    id v28 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v28 setScheme:@"com.apple.Home-private"];
    [v28 setHost:@"recognizeMyVoiceOptIn"];
    __int16 v56 = (void *)v9;
    uint64_t v29 = [NSString stringWithFormat:@"showEnablementSheet=YES&homeId=%@", v9];
    [v28 setQuery:v29];

    id v53 = v28;
    uint64_t v30 = [v28 URL];
    id v31 = [*(id *)(a1 + 40) homeBulletinContext];
    uint64_t v32 = (void *)[v31 mutableCopy];

    uint64_t v54 = v30;
    os_log_type_t v33 = [v30 absoluteString];
    [v32 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F2E308]];

    id v34 = [*(id *)(a1 + 40) contextID];
    [v32 setObject:v34 forKeyedSubscript:@"home"];

    uint32_t v35 = [*(id *)(a1 + 40) uuid];
    __int16 v36 = [v35 UUIDString];

    __int16 v37 = (void *)MEMORY[0x1D9452090]();
    id v38 = *(id *)(a1 + 32);
    __int16 v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      uint64_t v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v62 = v40;
      __int16 v63 = 2112;
      v64 = v27;
      _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_INFO, "%{public}@Inserting new RMV language bulletin with message: %@", buf, 0x16u);
    }
    uint64_t v41 = [MEMORY[0x1E4F29128] UUID];
    id v42 = [v41 UUIDString];

    long long v43 = [*(id *)(a1 + 32) notificationCenter];
    long long v44 = [MEMORY[0x1E4F1C9C8] date];
    long long v45 = (void *)[v32 copy];
    LOBYTE(v52) = 0;
    [v43 showNotificationWithTitle:v55 body:v27 threadIdentifier:v36 categoryIdentifier:@"HMDBBNormalType" requestIdentifier:v42 date:v44 attachments:0 userInfo:v45 shouldIgnoreDoNotDisturb:v52 interruptionLevel:1 logEventTopic:16];
    v47 = long long v46 = v27;

    [*(id *)(a1 + 32) addNotificationRequest:v47 forIdentifier:v42];
    id v6 = v57;
    id v5 = v58;
  }
  else
  {
    __int16 v48 = (void *)MEMORY[0x1D9452090]();
    id v49 = *(id *)(a1 + 32);
    __int16 v50 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      __int16 v51 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v62 = v51;
      _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, can not insert new RMV language bulletin", buf, 0xCu);
    }
  }
}

- (void)fetchAreUserNotificationsEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBulletinBoard *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HMDBulletinBoard_fetchAreUserNotificationsEnabledWithCompletion___block_invoke;
  v7[3] = &unk_1E6A19530;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__HMDBulletinBoard_fetchAreUserNotificationsEnabledWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) notificationCenter];
  [v2 fetchAreUserNotificationsEnabledWithCompletion:*(void *)(a1 + 40)];
}

- (void)updateDoorbellPressNotificationsWithSignificantEventBulletin:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDBulletinBoard *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__HMDBulletinBoard_updateDoorbellPressNotificationsWithSignificantEventBulletin_completion___block_invoke;
  block[3] = &unk_1E6A193D0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __92__HMDBulletinBoard_updateDoorbellPressNotificationsWithSignificantEventBulletin_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateDoorbellPressNotificationsWithSignificantEventBulletin:*(void *)(a1 + 40)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)insertBulletinsForMatterFirmwareUpdateInstalledInHome:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 shouldPostBulletin])
  {
    objc_initWeak((id *)location, v4);
    id v5 = [(HMDBulletinBoard *)self isConfiguredFuture];
    id v6 = (void *)MEMORY[0x1E4F7A0F0];
    id v7 = [(HMDBulletinBoard *)self workQueue];
    id v8 = [v6 schedulerWithDispatchQueue:v7];
    id v9 = [v5 reschedule:v8];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__HMDBulletinBoard_insertBulletinsForMatterFirmwareUpdateInstalledInHome___block_invoke;
    v16[3] = &unk_1E6A10B10;
    objc_copyWeak(&v17, (id *)location);
    v16[4] = self;
    id v10 = (id)[v9 addCompletionBlock:v16];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)location);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = [v4 name];
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v14;
      __int16 v19 = 2112;
      id v20 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Not allowed to post bulletin for matter firmware update for home: %@", location, 0x16u);
    }
  }
}

void __74__HMDBulletinBoard_insertBulletinsForMatterFirmwareUpdateInstalledInHome___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v71 = a2;
  id v70 = a3;
  id WeakRetained = (__CFString *)objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (!WeakRetained)
  {
    if (v9)
    {
      v64 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v90 = v64;
      __int16 v65 = "%{public}@Update bulletin for stale home object; returning early.";
LABEL_37:
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, v65, buf, 0xCu);
    }
LABEL_38:

    goto LABEL_43;
  }
  if (v9)
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v90 = v10;
    __int16 v91 = 2112;
    __int16 v92 = WeakRetained;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating bulletin for firmware update installed in home: %@", buf, 0x16u);
  }
  uint64_t v11 = [*(id *)(a1 + 32) homeManager];

  if (!v11)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v64 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v90 = v64;
      __int16 v65 = "%{public}@Home manager is not yet configured, bailing updateBulletinForFirmwareUpdateInHome.";
      goto LABEL_37;
    }
    goto LABEL_38;
  }
  [(__CFString *)WeakRetained matterAccessoriesWithNewFirmwareInstalledInHome];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v76 = [obj countByEnumeratingWithState:&v85 objects:v98 count:16];
  if (!v76) {
    goto LABEL_42;
  }
  uint64_t v75 = *(void *)v86;
  uint64_t v74 = a1;
  while (2)
  {
    for (uint64_t i = 0; i != v76; ++i)
    {
      if (*(void *)v86 != v75) {
        objc_enumerationMutation(obj);
      }
      id v13 = (__CFString *)*(id *)(*((void *)&v85 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v14 = v13;
      }
      else {
        id v14 = 0;
      }
      id v15 = v14;

      if (v15)
      {
        if (([(__CFString *)v15 supportsCHIP] & 1) == 0)
        {
          uint64_t v21 = (void *)MEMORY[0x1D9452090]();
          id v22 = *(id *)(a1 + 32);
          uint64_t v23 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            id v24 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            __int16 v90 = v24;
            __int16 v91 = 2112;
            __int16 v92 = v13;
            _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@During update of bulletins for firmware updaes, found non-Matter accessory while processing Matter accessories: %@", buf, 0x16u);
          }
          goto LABEL_30;
        }
        uint64_t v16 = [(__CFString *)v13 softwareUpdate];
        id v17 = v16;
        if (v16 && [v16 state] == 4)
        {
          uint64_t v18 = [v17 displayableVersion];
          __int16 v19 = [v17 version];
        }
        else
        {
          uint64_t v18 = [(__CFString *)v15 displayableFirmwareVersion];
          __int16 v19 = [(__CFString *)v15 firmwareVersion];
        }
        __int16 v25 = v19;
        v83 = (__CFString *)v18;
        uint64_t v20 = [v19 shortVersionString];
      }
      else
      {
        v83 = [(__CFString *)v13 displayableFirmwareVersion];
        id v17 = [(__CFString *)v13 firmwareVersion];
        uint64_t v20 = [v17 shortVersionString];
      }

      __int16 v26 = [(__CFString *)v13 name];
      uint64_t v27 = [(__CFString *)v13 uuid];
      id v28 = [v27 UUIDString];
      uint64_t v29 = [v28 stringByAppendingPathComponent:@"firmwareInstalled"];
      __int16 v82 = (void *)v20;
      uint64_t v30 = [v29 stringByAppendingPathComponent:v20];

      id v31 = [*(id *)(a1 + 32) notificationRequests];
      uint64_t v32 = [v31 objectForKey:v30];

      if (v32)
      {
        uint64_t v66 = (void *)MEMORY[0x1D9452090]();
        id v67 = *(id *)(a1 + 32);
        id v68 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          uint64_t v69 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          __int16 v90 = v69;
          __int16 v91 = 2112;
          __int16 v92 = v30;
          _os_log_impl(&dword_1D49D5000, v68, OS_LOG_TYPE_INFO, "%{public}@Firmware update completed bulletin with recordID (%@) already exists, ignoring bulletin.", buf, 0x16u);
        }

        goto LABEL_42;
      }
      uint64_t v78 = i;
      __int16 v80 = v30;
      int v81 = v15;
      os_log_type_t v33 = v26;
      id v34 = (void *)MEMORY[0x1E4F2E690];
      uint32_t v35 = [(__CFString *)WeakRetained contextSPIUniqueIdentifier];
      __int16 v36 = [v35 UUIDString];
      [v34 tupleWithQueryType:0 uuidString:v36];
      v38 = __int16 v37 = WeakRetained;

      __int16 v39 = (void *)MEMORY[0x1E4F2E690];
      uint64_t v40 = [(__CFString *)v13 contextSPIUniqueIdentifier];
      uint64_t v41 = [v40 UUIDString];
      id v42 = [v39 tupleWithQueryType:1 uuidString:v41];

      long long v43 = (void *)MEMORY[0x1E4F1CAD0];
      long long v79 = (void *)v38;
      uint64_t v97 = v38;
      long long v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
      long long v45 = [v43 setWithArray:v44];
      long long v46 = generateURLForHomeKitObject();

      id v47 = NSString;
      __int16 v48 = HMDLocalizedStringForKey(@"ACCESSORY_FIRMWARE_UPDATE_INSTALLED_BODY_SINGLE");
      id v84 = 0;
      id v49 = v83;
      [v47 localizedStringWithValidatedFormat:v48, @"%@ %@", &v84, v26, v83 validFormatSpecifiers error];
      __int16 v50 = v37;
      __int16 v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v52 = v84;

      id v53 = v51;
      if (!v51)
      {
        uint64_t v72 = v42;
        uint64_t v54 = v33;
        __int16 v55 = (void *)MEMORY[0x1D9452090]();
        __int16 v56 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          id v57 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          __int16 v90 = v57;
          __int16 v91 = 2112;
          __int16 v92 = @"ACCESSORY_FIRMWARE_UPDATE_INSTALLED_BODY_SINGLE";
          __int16 v93 = 2112;
          __int16 v94 = @"%@ %@";
          __int16 v95 = 2112;
          id v96 = v52;
          _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
        }
        id v53 = @"ACCESSORY_FIRMWARE_UPDATE_INSTALLED_BODY_SINGLE";
        id v49 = v83;
        os_log_type_t v33 = v54;
        id v42 = v72;
      }
      uint64_t v77 = v33;
      id v58 = v53;

      id v59 = *(void **)(v74 + 32);
      id v60 = HMDLocalizedStringForKey(@"ACCESSORY_FIRMWARE_UPDATE_INSTALLED_TITLE");
      uint64_t v61 = [MEMORY[0x1E4F1C9C8] date];
      v62 = [(__CFString *)v37 homeBulletinContext];
      id v63 = (id)[v59 _insertRequestWithTitle:v60 snapshotData:0 message:v58 requestIdentifier:v80 date:v61 bulletinType:0 actionURL:v46 bulletinContext:v62 actionContext:0 interruptionLevel:1 logEventTopic:19];

      a1 = v74;
      id v15 = v49;
      id WeakRetained = v50;
      uint64_t i = v78;
LABEL_30:
    }
    uint64_t v76 = [obj countByEnumeratingWithState:&v85 objects:v98 count:16];
    if (v76) {
      continue;
    }
    break;
  }
LABEL_42:

LABEL_43:
}

- (id)updateBulletinForFirmwareUpdateInHome:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 shouldPostBulletin])
  {
    id v5 = [v4 uuid];
    id v6 = [v5 UUIDString];
    id v7 = [v6 stringByAppendingPathComponent:@"firmware"];

    objc_initWeak((id *)location, v4);
    id v8 = [(HMDBulletinBoard *)self isConfiguredFuture];
    BOOL v9 = (void *)MEMORY[0x1E4F7A0F0];
    id v10 = [(HMDBulletinBoard *)self workQueue];
    uint64_t v11 = [v9 schedulerWithDispatchQueue:v10];
    id v12 = [v8 reschedule:v11];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __58__HMDBulletinBoard_updateBulletinForFirmwareUpdateInHome___block_invoke;
    v23[3] = &unk_1E6A08C30;
    objc_copyWeak(&v25, (id *)location);
    v23[4] = self;
    id v13 = v7;
    id v24 = v13;
    id v14 = (id)[v12 addCompletionBlock:v23];

    id v15 = v24;
    id v16 = v13;

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v17 = (void *)MEMORY[0x1D9452090]();
    uint64_t v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      uint64_t v21 = [v4 name];
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v20;
      __int16 v27 = 2112;
      id v28 = v21;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Not allowed to post bulletin for firmware update for home: %@", location, 0x16u);
    }
    id v16 = 0;
  }

  return v16;
}

void __58__HMDBulletinBoard_updateBulletinForFirmwareUpdateInHome___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v8 = [*(id *)(a1 + 32) homeManager];

    if (v8)
    {
      BOOL v9 = [WeakRetained namesOfServicesWithNewFirmwareAvailableInHome];
      if ([v9 count] == 1)
      {
        id v10 = NSString;
        uint64_t v11 = HMDLocalizedStringForKey(@"ACCESSORY_FIRMWARE_UPDATE_AVAILABLE_BODY_SINGLE");
        id v59 = 0;
        id v12 = [v9 firstObject];
        id v13 = [v10 localizedStringWithValidatedFormat:v11, @"%@", &v59, v12 validFormatSpecifiers error];
        id v14 = v59;

        id v57 = v5;
        if (!v13)
        {
          id v15 = (void *)MEMORY[0x1D9452090]();
          id v16 = HMFGetOSLogHandle();
          id v13 = @"ACCESSORY_FIRMWARE_UPDATE_AVAILABLE_BODY_SINGLE";
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v18 = v17 = v15;
            *(_DWORD *)buf = 138544130;
            v62 = v18;
            __int16 v63 = 2112;
            v64 = @"ACCESSORY_FIRMWARE_UPDATE_AVAILABLE_BODY_SINGLE";
            __int16 v65 = 2112;
            uint64_t v66 = @"%@";
            __int16 v67 = 2112;
            id v68 = v14;
LABEL_21:
            _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

            id v15 = v17;
            goto LABEL_22;
          }
          goto LABEL_22;
        }
      }
      else
      {
        if ((unint64_t)[v9 count] < 2)
        {
          __int16 v27 = (void *)MEMORY[0x1D9452090]();
          id v28 = *(id *)(a1 + 32);
          uint64_t v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            uint64_t v30 = HMFGetLogIdentifier();
            id v31 = [WeakRetained name];
            *(_DWORD *)buf = 138543618;
            v62 = v30;
            __int16 v63 = 2112;
            v64 = v31;
            _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@No accessory in home %@ has firmware update. Cleaning the bulletin.", buf, 0x16u);
          }
          uint64_t v32 = *(void **)(a1 + 32);
          uint64_t v60 = *(void *)(a1 + 40);
          os_log_type_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
          [v32 removeNotificationRequestsWithIdentifiers:v33 shouldDeleteAttachments:1];
          goto LABEL_29;
        }
        id v24 = NSString;
        id v25 = HMDLocalizedStringForKey(@"ACCESSORY_FIRMWARE_UPDATE_AVAILABLE_BODY_MULTIPLE");
        id v58 = 0;
        objc_msgSend(v24, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v25, @"%d", &v58, objc_msgSend(v9, "count"));
        id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        id v14 = v58;

        id v57 = v5;
        if (!v13)
        {
          id v15 = (void *)MEMORY[0x1D9452090]();
          id v16 = HMFGetOSLogHandle();
          id v13 = @"ACCESSORY_FIRMWARE_UPDATE_AVAILABLE_BODY_MULTIPLE";
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v18 = v17 = v15;
            *(_DWORD *)buf = 138544130;
            v62 = v18;
            __int16 v63 = 2112;
            v64 = @"ACCESSORY_FIRMWARE_UPDATE_AVAILABLE_BODY_MULTIPLE";
            __int16 v65 = 2112;
            uint64_t v66 = @"%d";
            __int16 v67 = 2112;
            id v68 = v14;
            goto LABEL_21;
          }
LABEL_22:

          __int16 v26 = 0;
          goto LABEL_23;
        }
      }
      __int16 v26 = v13;
LABEL_23:
      os_log_type_t v33 = v13;

      id v34 = [*(id *)(a1 + 32) notificationRequests];
      uint32_t v35 = [v34 objectForKey:*(void *)(a1 + 40)];

      if (v35)
      {
        __int16 v36 = (void *)MEMORY[0x1D9452090]();
        id v37 = *(id *)(a1 + 32);
        uint64_t v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          __int16 v39 = HMFGetLogIdentifier();
          uint64_t v40 = *(__CFString **)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v62 = v39;
          __int16 v63 = 2112;
          v64 = v40;
          _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@Bulletin with recordID (%@) already exists. Updating bulletin.", buf, 0x16u);
        }
        uint64_t v41 = [v35 content];
        id v42 = (void *)[v41 mutableCopy];

        [v42 setBody:v33];
        long long v43 = *(void **)(a1 + 32);
        long long v44 = [v35 identifier];
        [v43 updateContent:v42 forNotificationWithRequestIdentifier:v44];
      }
      else
      {
        id v42 = [WeakRetained name];
        long long v45 = (void *)MEMORY[0x1E4F2E690];
        long long v46 = [WeakRetained contextSPIUniqueIdentifier];
        [v46 UUIDString];
        v47 = id v56 = v6;
        long long v44 = [v45 tupleWithQueryType:8 uuidString:v47];

        __int16 v48 = generateURLForHomeKitObject();
        id v49 = *(void **)(a1 + 32);
        uint64_t v55 = *(void *)(a1 + 40);
        __int16 v50 = [MEMORY[0x1E4F1C9C8] date];
        [WeakRetained homeBulletinContext];
        v52 = __int16 v51 = v9;
        id v53 = v49;
        id v6 = v56;
        id v54 = (id)[v53 _insertRequestWithTitle:v42 snapshotData:0 message:v33 requestIdentifier:v55 date:v50 bulletinType:0 actionURL:v48 bulletinContext:v52 actionContext:0 interruptionLevel:1 logEventTopic:2];

        BOOL v9 = v51;
      }

      id v5 = v57;
LABEL_29:

      goto LABEL_30;
    }
    __int16 v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = *(id *)(a1 + 32);
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v62 = v22;
      uint64_t v23 = "%{public}@Home manager is not yet configured, bailing updateBulletinForFirmwareUpdateInHome.";
      goto LABEL_11;
    }
  }
  else
  {
    __int16 v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = *(id *)(a1 + 32);
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v62 = v22;
      uint64_t v23 = "%{public}@Update bulletin for stale home object; returning early.";
LABEL_11:
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, v23, buf, 0xCu);
    }
  }

LABEL_30:
}

- (void)insertConnectedCHIPEcosystemsChangedBulletin:(id)a3
{
  id v4 = a3;
  id v5 = [v4 threadIdentifier];
  id v6 = [(HMDBulletinBoard *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HMDBulletinBoard_insertConnectedCHIPEcosystemsChangedBulletin___block_invoke;
  block[3] = &unk_1E6A19668;
  id v10 = v4;
  uint64_t v11 = self;
  id v12 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

void __65__HMDBulletinBoard_insertConnectedCHIPEcosystemsChangedBulletin___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isTimeSensitive]) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  id v3 = [MEMORY[0x1E4F29128] UUID];
  id v12 = [v3 UUIDString];

  id v4 = [*(id *)(a1 + 40) notificationCenter];
  id v5 = [*(id *)(a1 + 32) title];
  id v6 = [*(id *)(a1 + 32) body];
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = [*(id *)(a1 + 32) dateOfOccurrence];
  BOOL v9 = [*(id *)(a1 + 32) userInfo];
  LOBYTE(v11) = 0;
  id v10 = [v4 showNotificationWithTitle:v5 body:v6 threadIdentifier:v7 categoryIdentifier:@"HMDBBNormalType" requestIdentifier:v12 date:v8 attachments:0 userInfo:v9 shouldIgnoreDoNotDisturb:v11 interruptionLevel:v2 logEventTopic:14];

  [*(id *)(a1 + 40) addNotificationRequest:v10 forIdentifier:v12];
}

- (void)insertCameraAccessModeChangedBulletin:(id)a3
{
  id v4 = a3;
  id v5 = [v4 threadIdentifier];
  id v6 = [(HMDBulletinBoard *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__HMDBulletinBoard_insertCameraAccessModeChangedBulletin___block_invoke;
  block[3] = &unk_1E6A19668;
  id v10 = v4;
  uint64_t v11 = self;
  id v12 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

void __58__HMDBulletinBoard_insertCameraAccessModeChangedBulletin___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isTimeSensitive]) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  id v3 = [MEMORY[0x1E4F29128] UUID];
  id v12 = [v3 UUIDString];

  id v4 = [*(id *)(a1 + 40) notificationCenter];
  id v5 = [*(id *)(a1 + 32) title];
  id v6 = [*(id *)(a1 + 32) body];
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = [*(id *)(a1 + 32) dateOfOccurrence];
  BOOL v9 = [*(id *)(a1 + 32) userInfo];
  LOBYTE(v11) = 0;
  id v10 = [v4 showNotificationWithTitle:v5 body:v6 threadIdentifier:v7 categoryIdentifier:0 requestIdentifier:v12 date:v8 attachments:0 userInfo:v9 shouldIgnoreDoNotDisturb:v11 interruptionLevel:v2 logEventTopic:5];

  [*(id *)(a1 + 40) addNotificationRequest:v10 forIdentifier:v12];
}

- (void)insertCameraClipSignificantEventBulletin:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBulletinBoard *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__HMDBulletinBoard_insertCameraClipSignificantEventBulletin___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__HMDBulletinBoard_insertCameraClipSignificantEventBulletin___block_invoke(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) previewImageFilePathURL];
  id v3 = [*(id *)(a1 + 40) notificationRequests];
  id v4 = [*(id *)(a1 + 32) requestIdentifier];
  id v5 = [v3 objectForKey:v4];

  id v6 = [v5 content];
  uint64_t v7 = [v6 body];
  id v8 = [*(id *)(a1 + 32) body];
  int v9 = [v7 isEqualToString:v8];

  id v10 = [v5 content];
  uint64_t v11 = [v10 attachments];
  uint64_t v12 = [v11 count];

  if (v12) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v2 == 0;
  }
  char v14 = !v13;
  if (!v9 || (v14 & 1) != 0)
  {
    if (v2)
    {
      __int16 v19 = *(void **)(a1 + 40);
      id v20 = [v19 fileManager];
      uint64_t v21 = [v20 heroFrameStoreDirectoryURL];
      id v22 = (void *)[v19 _copyItemAtURL:v2 toDirectory:v21];
    }
    else
    {
      id v22 = 0;
    }
    uint64_t v23 = [v22 filePathURL];
    id v24 = [*(id *)(a1 + 40) fileManager];
    id v25 = +[HMDBulletinBoard createImageAttachmentByHardLinkingFile:v23 fileManager:v24];

    __int16 v26 = [*(id *)(a1 + 32) userInfo];
    __int16 v27 = (void *)[v26 mutableCopy];

    id v28 = [v22 filePathURL];
    uint64_t v29 = [v28 path];
    [v27 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F2EE88]];

    if (v9)
    {
      uint64_t v30 = (void *)MEMORY[0x1D9452090]();
      id v31 = *(id *)(a1 + 40);
      uint64_t v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        os_log_type_t v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v64 = v33;
        __int16 v65 = 2112;
        uint64_t v66 = v22;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@Silently updating existing significant event bulletin with preview image file path URL: %@", buf, 0x16u);
      }
      id v34 = [v5 content];
      uint32_t v35 = (__CFString *)[v34 mutableCopy];

      [(__CFString *)v35 setAttachments:v25];
      [(__CFString *)v35 setUserInfo:v27];
      __int16 v36 = *(void **)(a1 + 40);
      id v37 = [v5 identifier];
      [v36 updateContent:v35 forNotificationWithRequestIdentifier:v37];
    }
    else
    {
      uint64_t v60 = v5;
      uint64_t v61 = v22;
      uint64_t v38 = v27;
      __int16 v39 = v25;
      v62 = v2;
      int v40 = [*(id *)(a1 + 32) shouldShowProvideFeedbackButton];
      uint64_t v41 = @"HomeAppBulletinCategory";
      if (v40) {
        uint64_t v41 = @"HMDBulletinCategoryProvideCameraRecordingFeedback";
      }
      id v42 = v41;
      long long v43 = (void *)MEMORY[0x1D9452090]();
      id v44 = *(id *)(a1 + 40);
      long long v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        long long v46 = HMFGetLogIdentifier();
        id v47 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v64 = v46;
        __int16 v65 = 2112;
        uint64_t v66 = v47;
        __int16 v67 = 2112;
        id v68 = v38;
        _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_INFO, "%{public}@Showing new significant event bulletin: %@, with user info: %@", buf, 0x20u);
      }
      [*(id *)(a1 + 40) _submitCameraClipSignificantEventDetailsFromBulletin:*(void *)(a1 + 32)];
      __int16 v48 = [*(id *)(a1 + 32) home];
      id v49 = [v48 contextID];
      [v38 setObject:v49 forKeyedSubscript:@"home"];

      id v37 = [*(id *)(a1 + 32) threadIdentifier];
      __int16 v50 = [*(id *)(a1 + 40) notificationCenter];
      __int16 v51 = [*(id *)(a1 + 32) title];
      id v52 = [*(id *)(a1 + 32) body];
      id v53 = [*(id *)(a1 + 32) requestIdentifier];
      id v54 = [*(id *)(a1 + 32) dateOfOccurrence];
      LOBYTE(v58) = 0;
      [v50 showNotificationWithTitle:v51 body:v52 threadIdentifier:v37 categoryIdentifier:v42 requestIdentifier:v53 date:v54 attachments:v39 userInfo:v38 shouldIgnoreDoNotDisturb:v58 interruptionLevel:1 logEventTopic:6];
      uint64_t v55 = v59 = v42;

      id v25 = v39;
      __int16 v27 = v38;

      id v56 = *(void **)(a1 + 40);
      id v57 = [*(id *)(a1 + 32) requestIdentifier];
      [v56 addNotificationRequest:v55 forIdentifier:v57];

      uint32_t v35 = v59;
      id v5 = v60;
      id v22 = v61;
      uint64_t v2 = v62;
    }
  }
  else
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = *(id *)(a1 + 40);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v64 = v18;
      __int16 v65 = 2112;
      uint64_t v66 = v5;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Not inserting camera clip significant event bulletin because a bulletin already exists with the same body and an attachment: %@", buf, 0x16u);
    }
  }
}

- (void)removeWalletKeyOnboardingBulletinForHome:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBulletinBoard *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__HMDBulletinBoard_removeWalletKeyOnboardingBulletinForHome___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__HMDBulletinBoard_removeWalletKeyOnboardingBulletinForHome___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) homeManager];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) uuid];
    id v4 = [v3 UUIDString];
    id v5 = [v4 stringByAppendingPathComponent:@"lockOnboarding"];

    id v6 = [*(id *)(a1 + 32) notificationRequests];
    uint64_t v7 = [v6 objectForKey:v5];

    if (!v7)
    {
      __int16 v36 = (void *)MEMORY[0x1D9452090]();
      id v37 = *(id *)(a1 + 32);
      uint64_t v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        __int16 v39 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v49 = v39;
        _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@Did not find any existing lock onboarding bulletin.", buf, 0xCu);
      }
      goto LABEL_17;
    }
    long long v46 = v5;
    id v8 = [v7 content];
    int v9 = (void *)[v8 mutableCopy];

    long long v45 = v9;
    id v10 = [v9 userInfo];
    uint64_t v11 = (void *)[v10 mutableCopy];

    uint64_t v43 = *MEMORY[0x1E4F2E308];
    uint64_t v12 = objc_msgSend(v11, "objectForKeyedSubscript:");
    BOOL v13 = NSString;
    char v14 = [*(id *)(a1 + 40) contextSPIUniqueIdentifier];
    uint64_t v15 = [v13 stringWithValidatedFormat:@"com.apple.Home-private://locksFirmwareUpdateSetup/%@?type=%@", @"%@ %@", 0, v14, @"all" validFormatSpecifiers error];

    id v16 = NSString;
    id v17 = [*(id *)(a1 + 40) contextSPIUniqueIdentifier];
    uint64_t v18 = [v16 stringWithValidatedFormat:@"com.apple.Home-private://locksFirmwareUpdateSetup/%@?type=%@", @"%@ %@", 0, v17, @"walletkey" validFormatSpecifiers error];

    id v44 = (void *)v15;
    if ([v12 isEqualToString:v15])
    {
      id v42 = v18;
      __int16 v19 = NSString;
      id v20 = [*(id *)(a1 + 40) contextSPIUniqueIdentifier];
      uint64_t v21 = [v19 stringWithValidatedFormat:@"com.apple.Home-private://locksFirmwareUpdateSetup/%@?type=%@", @"%@ %@", 0, v20, @"pincode" validFormatSpecifiers error];

      id v22 = [MEMORY[0x1E4F1CB10] URLWithString:v21];
      uint64_t v23 = (void *)MEMORY[0x1D9452090]();
      id v24 = *(id *)(a1 + 32);
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        uint64_t v41 = v23;
        v27 = __int16 v26 = v12;
        id v28 = [v11 objectForKeyedSubscript:v43];
        *(_DWORD *)buf = 138543874;
        id v49 = v27;
        __int16 v50 = 2112;
        __int16 v51 = v28;
        __int16 v52 = 2112;
        id v53 = v22;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Lock onboarding bulletin already exists, updating bulletin actionURL: %@ to %@.", buf, 0x20u);

        uint64_t v12 = v26;
        uint64_t v23 = v41;
      }

      uint64_t v29 = [v22 absoluteString];
      [v11 setObject:v29 forKeyedSubscript:v43];

      int v9 = v45;
      [v45 setUserInfo:v11];
      uint64_t v30 = *(void **)(a1 + 32);
      id v31 = [v7 identifier];
      [v30 updateContent:v45 forNotificationWithRequestIdentifier:v31];

      id v5 = v46;
    }
    else
    {
      if (![v12 isEqualToString:v18])
      {
LABEL_16:

LABEL_17:
        return;
      }
      id v42 = v18;
      int v40 = *(void **)(a1 + 32);
      id v47 = v5;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      [v40 removeNotificationRequestsWithIdentifiers:v21 shouldDeleteAttachments:1];
    }

    uint64_t v18 = v42;
    goto LABEL_16;
  }
  uint64_t v32 = (void *)MEMORY[0x1D9452090]();
  id v33 = *(id *)(a1 + 32);
  id v34 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    uint32_t v35 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v49 = v35;
    _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, can not remove wallet key onboarding bulletin", buf, 0xCu);
  }
}

- (void)insertWalletKeyExpressModeSetUpBulletinForHome:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBulletinBoard *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HMDBulletinBoard_insertWalletKeyExpressModeSetUpBulletinForHome___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__HMDBulletinBoard_insertWalletKeyExpressModeSetUpBulletinForHome___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) homeManager];

  if (v2)
  {
    __int16 v39 = HMDLocalizedStringForKey(@"BULLETIN_WALLET_KEY_EXPRESS_MODE_TITLE");
    id v3 = NSString;
    id v4 = HMDLocalizedStringForKey(@"BULLETIN_WALLET_KEY_EXPRESS_MODE_MESSAGE");
    id v40 = 0;
    id v5 = [*(id *)(a1 + 40) name];
    id v6 = [v3 localizedStringWithValidatedFormat:v4, @"%@", &v40, v5 validFormatSpecifiers error];
    id v7 = v40;

    id v8 = v6;
    if (!v6)
    {
      int v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        id v42 = v11;
        __int16 v43 = 2112;
        id v44 = @"BULLETIN_WALLET_KEY_EXPRESS_MODE_MESSAGE";
        __int16 v45 = 2112;
        long long v46 = @"%@";
        __int16 v47 = 2112;
        id v48 = v7;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
      }
      id v8 = @"BULLETIN_WALLET_KEY_EXPRESS_MODE_MESSAGE";
    }
    uint64_t v12 = v8;

    BOOL v13 = NSString;
    char v14 = [*(id *)(a1 + 40) contextSPIUniqueIdentifier];
    uint64_t v15 = [v13 stringWithValidatedFormat:@"com.apple.Home-private://locksOnboarding/%@?type=%@", @"%@ %@", 0, v14, @"walletkey" validFormatSpecifiers error];

    uint64_t v38 = (void *)v15;
    id v16 = [MEMORY[0x1E4F1CB10] URLWithString:v15];
    id v17 = [*(id *)(a1 + 40) homeBulletinContext];
    uint64_t v18 = (void *)[v17 mutableCopy];

    __int16 v19 = [(__CFString *)v16 absoluteString];
    [v18 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F2E308]];

    id v20 = [*(id *)(a1 + 40) contextID];
    [v18 setObject:v20 forKeyedSubscript:@"home"];

    uint64_t v21 = [*(id *)(a1 + 40) uuid];
    id v22 = [v21 UUIDString];

    uint64_t v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = *(id *)(a1 + 32);
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v42 = v26;
      __int16 v43 = 2112;
      id v44 = v12;
      __int16 v45 = 2112;
      long long v46 = v16;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Inserting wallet key express mode setup bulletin with message: %@ actionURL:%@", buf, 0x20u);
    }
    __int16 v27 = [MEMORY[0x1E4F29128] UUID];
    id v28 = [v27 UUIDString];

    uint64_t v29 = [*(id *)(a1 + 32) notificationCenter];
    uint64_t v30 = [MEMORY[0x1E4F1C9C8] date];
    id v31 = (void *)[v18 copy];
    LOBYTE(v37) = 0;
    uint64_t v32 = [v29 showNotificationWithTitle:v39 body:v12 threadIdentifier:v22 categoryIdentifier:@"HMDBulletinCategorySuppressNotificationOnWatch" requestIdentifier:v28 date:v30 attachments:0 userInfo:v31 shouldIgnoreDoNotDisturb:v37 interruptionLevel:1 logEventTopic:17];

    [*(id *)(a1 + 32) addNotificationRequest:v32 forIdentifier:v28];
  }
  else
  {
    id v33 = (void *)MEMORY[0x1D9452090]();
    id v34 = *(id *)(a1 + 32);
    uint32_t v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      __int16 v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v42 = v36;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, can not insert wallet key express mode setup bulletin", buf, 0xCu);
    }
  }
}

- (void)insertWalletKeySupportAddedBulletinForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBulletinBoard *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__HMDBulletinBoard_insertWalletKeySupportAddedBulletinForAccessory___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __68__HMDBulletinBoard_insertWalletKeySupportAddedBulletinForAccessory___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) homeManager];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) home];
    id v48 = [*(id *)(a1 + 40) name];
    id v4 = NSString;
    id v5 = HMDLocalizedStringForKey(@"BULLETIN_WALLET_KEY_SUPPORT_ADDED_MESSAGE");
    id v51 = 0;
    id v6 = [*(id *)(a1 + 40) name];
    id v7 = [v4 localizedStringWithValidatedFormat:v5, @"%@", &v51, v6 validFormatSpecifiers error];
    id v8 = v51;

    int v9 = v7;
    if (!v7)
    {
      id v10 = (void *)MEMORY[0x1D9452090]();
      uint64_t v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        uint64_t v54 = v12;
        __int16 v55 = 2112;
        id v56 = @"BULLETIN_WALLET_KEY_SUPPORT_ADDED_MESSAGE";
        __int16 v57 = 2112;
        uint64_t v58 = @"%@";
        __int16 v59 = 2112;
        id v60 = v8;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
      }
      int v9 = @"BULLETIN_WALLET_KEY_SUPPORT_ADDED_MESSAGE";
    }
    __int16 v50 = v9;

    BOOL v13 = (void *)MEMORY[0x1E4F2E690];
    char v14 = [*(id *)(a1 + 40) contextSPIUniqueIdentifier];
    uint64_t v15 = [v14 UUIDString];
    uint64_t v16 = [v13 tupleWithQueryType:1 uuidString:v15];

    id v17 = (void *)MEMORY[0x1E4F2E690];
    uint64_t v18 = [v3 contextSPIUniqueIdentifier];
    __int16 v19 = [v18 UUIDString];
    uint64_t v20 = [v17 tupleWithQueryType:0 uuidString:v19];

    uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
    long long v46 = (void *)v20;
    uint64_t v52 = v20;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
    uint64_t v23 = [v21 setWithArray:v22];
    __int16 v47 = (void *)v16;
    generateURLForHomeKitObject();
    id v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

    id v25 = [*(id *)(a1 + 40) accessoryBulletinContext];
    __int16 v26 = (void *)[v25 mutableCopy];

    __int16 v27 = [(__CFString *)v24 absoluteString];
    [v26 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F2E308]];

    id v28 = [v3 contextID];
    [v26 setObject:v28 forKeyedSubscript:@"home"];

    uint64_t v49 = v3;
    uint64_t v29 = [v3 uuid];
    uint64_t v30 = [v29 UUIDString];

    id v31 = (void *)MEMORY[0x1D9452090]();
    id v32 = *(id *)(a1 + 32);
    id v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v54 = v34;
      __int16 v55 = 2112;
      id v56 = v50;
      __int16 v57 = 2112;
      uint64_t v58 = v24;
      _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Inserting wallet key support added bulletin with message: %@ actionURL:%@", buf, 0x20u);
    }
    uint32_t v35 = [MEMORY[0x1E4F29128] UUID];
    __int16 v36 = [v35 UUIDString];

    uint64_t v37 = [*(id *)(a1 + 32) notificationCenter];
    uint64_t v38 = [MEMORY[0x1E4F1C9C8] date];
    __int16 v39 = (void *)[v26 copy];
    LOBYTE(v45) = 0;
    id v40 = [v37 showNotificationWithTitle:v48 body:v50 threadIdentifier:v30 categoryIdentifier:@"HMDBBNormalType" requestIdentifier:v36 date:v38 attachments:0 userInfo:v39 shouldIgnoreDoNotDisturb:v45 interruptionLevel:1 logEventTopic:17];

    [*(id *)(a1 + 32) addNotificationRequest:v40 forIdentifier:v36];
  }
  else
  {
    uint64_t v41 = (void *)MEMORY[0x1D9452090]();
    id v42 = *(id *)(a1 + 32);
    __int16 v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      id v44 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v54 = v44;
      _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, can not insert wallet key support added bulletin", buf, 0xCu);
    }
  }
}

- (void)insertLockOnboardingBulletinForHome:(id)a3 serviceType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDBulletinBoard *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HMDBulletinBoard_insertLockOnboardingBulletinForHome_serviceType___block_invoke;
  block[3] = &unk_1E6A19668;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __68__HMDBulletinBoard_insertLockOnboardingBulletinForHome_serviceType___block_invoke(uint64_t a1)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) homeManager];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) uuid];
    id v4 = [v3 UUIDString];
    id v5 = [v4 stringByAppendingPathComponent:@"lockOnboarding"];

    id v6 = [*(id *)(a1 + 32) notificationRequests];
    id v7 = [v6 objectForKey:v5];

    if (v7)
    {
      id v8 = NSString;
      id v9 = [*(id *)(a1 + 40) contextSPIUniqueIdentifier];
      uint64_t v10 = [v8 stringWithValidatedFormat:@"com.apple.Home-private://locksFirmwareUpdateSetup/%@?type=%@", @"%@ %@", 0, v9, @"all" validFormatSpecifiers error];

      uint64_t v58 = (void *)v10;
      uint64_t v11 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
      id v12 = [v7 content];
      id v13 = (__CFString *)[v12 mutableCopy];

      id v56 = v13;
      char v14 = [(__CFString *)v13 userInfo];
      uint64_t v15 = (void *)[v14 mutableCopy];

      uint64_t v16 = (void *)MEMORY[0x1D9452090]();
      id v17 = *(id *)(a1 + 32);
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        __int16 v19 = v53 = v16;
        uint64_t v20 = *MEMORY[0x1E4F2E308];
        [v15 objectForKeyedSubscript:*MEMORY[0x1E4F2E308]];
        id v22 = v21 = v5;
        *(_DWORD *)buf = 138543874;
        id v60 = v19;
        __int16 v61 = 2112;
        v62 = v22;
        __int16 v63 = 2112;
        v64 = v11;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Lock onboarding bulletin already exists, updating bulletin actionURL: %@ to %@.", buf, 0x20u);

        id v5 = v21;
        uint64_t v16 = v53;
      }
      else
      {
        uint64_t v20 = *MEMORY[0x1E4F2E308];
      }

      uint64_t v49 = [v11 absoluteString];
      [v15 setObject:v49 forKeyedSubscript:v20];

      id v48 = v56;
      [(__CFString *)v56 setUserInfo:v15];
      __int16 v50 = *(void **)(a1 + 32);
      [v7 identifier];
      v32 = __int16 v47 = v15;
      [v50 updateContent:v56 forNotificationWithRequestIdentifier:v32];
    }
    else
    {
      uint64_t v54 = v5;
      uint64_t v58 = HMDLocalizedStringForKey(@"BULLETIN_LOCK_ONBOARDING_TITLE");
      uint64_t v11 = HMDLocalizedStringForKey(@"BULLETIN_LOCK_ONBOARDING_MESSAGE");
      if (*(__CFString **)(a1 + 48) == @"00000266-0000-1000-8000-0026BB765291") {
        __int16 v27 = @"walletkey";
      }
      else {
        __int16 v27 = @"pincode";
      }
      id v28 = v27;
      uint64_t v29 = NSString;
      uint64_t v30 = [*(id *)(a1 + 40) contextSPIUniqueIdentifier];
      __int16 v57 = v28;
      uint64_t v31 = [v29 stringWithValidatedFormat:@"com.apple.Home-private://locksFirmwareUpdateSetup/%@?type=%@", @"%@ %@", 0, v30, v28 validFormatSpecifiers error];

      __int16 v55 = (void *)v31;
      id v32 = [MEMORY[0x1E4F1CB10] URLWithString:v31];
      id v33 = [*(id *)(a1 + 40) homeBulletinContext];
      id v34 = (void *)[v33 mutableCopy];

      uint32_t v35 = [v32 absoluteString];
      [v34 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F2E308]];

      __int16 v36 = [*(id *)(a1 + 40) contextID];
      [v34 setObject:v36 forKeyedSubscript:@"home"];

      uint64_t v37 = [*(id *)(a1 + 40) uuid];
      uint64_t v52 = [v37 UUIDString];

      uint64_t v38 = (void *)MEMORY[0x1D9452090]();
      id v39 = *(id *)(a1 + 32);
      id v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v41 = HMFGetLogIdentifier();
        uint64_t v42 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138544130;
        id v60 = v41;
        __int16 v61 = 2112;
        v62 = v11;
        __int16 v63 = 2112;
        v64 = v32;
        __int16 v65 = 2112;
        uint64_t v66 = v42;
        _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Inserting lock onboarding bulletin with message: %@ actionURL:%@ for service: %@", buf, 0x2Au);
      }
      __int16 v43 = [*(id *)(a1 + 32) notificationCenter];
      id v44 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v45 = (void *)[v34 copy];
      LOBYTE(v51) = 0;
      id v5 = v54;
      long long v46 = [v43 showNotificationWithTitle:v58 body:v11 threadIdentifier:v52 categoryIdentifier:@"HMDBulletinCategorySuppressNotificationOnWatch" requestIdentifier:v54 date:v44 attachments:0 userInfo:v45 shouldIgnoreDoNotDisturb:v51 interruptionLevel:1 logEventTopic:13];

      [*(id *)(a1 + 32) addNotificationRequest:v46 forIdentifier:v54];
      id v7 = 0;
      __int16 v47 = v55;
      id v48 = v57;
    }
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = *(id *)(a1 + 32);
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v60 = v26;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, can not insert access code onboarding bulletin", buf, 0xCu);
    }
  }
}

- (void)insertAccessCodeRemovedBulletinForHome:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBulletinBoard *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HMDBulletinBoard_insertAccessCodeRemovedBulletinForHome___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__HMDBulletinBoard_insertAccessCodeRemovedBulletinForHome___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) homeManager];

  if (v2)
  {
    id v40 = HMDLocalizedStringForKey(@"BULLETIN_ACCESS_CODE_REMOVED_TITLE");
    id v3 = NSString;
    id v4 = HMDLocalizedStringForKey(@"BULLETIN_ACCESS_CODE_REMOVED_MESSAGE");
    id v41 = 0;
    id v5 = [*(id *)(a1 + 40) name];
    id v6 = [v3 localizedStringWithValidatedFormat:v4, @"%@", &v41, v5 validFormatSpecifiers error];
    id v7 = v41;

    id v8 = v6;
    if (!v6)
    {
      id v9 = (void *)MEMORY[0x1D9452090]();
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        __int16 v43 = v11;
        __int16 v44 = 2112;
        uint64_t v45 = @"BULLETIN_ACCESS_CODE_REMOVED_MESSAGE";
        __int16 v46 = 2112;
        __int16 v47 = @"%@";
        __int16 v48 = 2112;
        id v49 = v7;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
      }
      id v8 = @"BULLETIN_ACCESS_CODE_REMOVED_MESSAGE";
    }
    id v12 = v8;

    id v13 = NSString;
    char v14 = [*(id *)(a1 + 40) contextSPIUniqueIdentifier];
    uint64_t v15 = [v13 stringWithValidatedFormat:@"com.apple.Home-private://userLockSettings/%@", @"%@", 0, v14 validFormatSpecifiers error];

    id v39 = (void *)v15;
    uint64_t v16 = [MEMORY[0x1E4F1CB10] URLWithString:v15];
    id v17 = [*(id *)(a1 + 40) homeBulletinContext];
    uint64_t v18 = (void *)[v17 mutableCopy];

    uint64_t v38 = v16;
    __int16 v19 = [v16 absoluteString];
    [v18 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F2E308]];

    uint64_t v20 = [*(id *)(a1 + 40) contextID];
    [v18 setObject:v20 forKeyedSubscript:@"home"];

    uint64_t v21 = [*(id *)(a1 + 40) uuid];
    id v22 = [v21 UUIDString];

    uint64_t v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = *(id *)(a1 + 32);
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v43 = v26;
      __int16 v44 = 2112;
      uint64_t v45 = v12;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Inserting access code removed bulletin with message: %@", buf, 0x16u);
    }
    __int16 v27 = [MEMORY[0x1E4F29128] UUID];
    id v28 = [v27 UUIDString];

    uint64_t v29 = [*(id *)(a1 + 32) notificationCenter];
    uint64_t v30 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v31 = (void *)[v18 copy];
    LOBYTE(v37) = 0;
    id v32 = [v29 showNotificationWithTitle:v40 body:v12 threadIdentifier:v22 categoryIdentifier:@"HMDBBNormalType" requestIdentifier:v28 date:v30 attachments:0 userInfo:v31 shouldIgnoreDoNotDisturb:v37 interruptionLevel:1 logEventTopic:1];

    [*(id *)(a1 + 32) addNotificationRequest:v32 forIdentifier:v28];
  }
  else
  {
    id v33 = (void *)MEMORY[0x1D9452090]();
    id v34 = *(id *)(a1 + 32);
    uint32_t v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      __int16 v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v43 = v36;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, can not insert access code removed bulletin", buf, 0xCu);
    }
  }
}

- (void)insertAccessCodeChangedBulletinForHome:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBulletinBoard *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HMDBulletinBoard_insertAccessCodeChangedBulletinForHome___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__HMDBulletinBoard_insertAccessCodeChangedBulletinForHome___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) homeManager];

  if (v2)
  {
    id v40 = HMDLocalizedStringForKey(@"BULLETIN_ACCESS_CODE_CHANGED_TITLE");
    id v3 = NSString;
    id v4 = HMDLocalizedStringForKey(@"BULLETIN_ACCESS_CODE_CHANGED_MESSAGE");
    id v41 = 0;
    id v5 = [*(id *)(a1 + 40) name];
    id v6 = [v3 localizedStringWithValidatedFormat:v4, @"%@", &v41, v5 validFormatSpecifiers error];
    id v7 = v41;

    id v8 = v6;
    if (!v6)
    {
      id v9 = (void *)MEMORY[0x1D9452090]();
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        __int16 v43 = v11;
        __int16 v44 = 2112;
        uint64_t v45 = @"BULLETIN_ACCESS_CODE_CHANGED_MESSAGE";
        __int16 v46 = 2112;
        __int16 v47 = @"%@";
        __int16 v48 = 2112;
        id v49 = v7;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
      }
      id v8 = @"BULLETIN_ACCESS_CODE_CHANGED_MESSAGE";
    }
    id v12 = v8;

    id v13 = NSString;
    char v14 = [*(id *)(a1 + 40) contextSPIUniqueIdentifier];
    uint64_t v15 = [v13 stringWithValidatedFormat:@"com.apple.Home-private://userLockSettings/%@", @"%@", 0, v14 validFormatSpecifiers error];

    id v39 = (void *)v15;
    uint64_t v16 = [MEMORY[0x1E4F1CB10] URLWithString:v15];
    id v17 = [*(id *)(a1 + 40) homeBulletinContext];
    uint64_t v18 = (void *)[v17 mutableCopy];

    uint64_t v38 = v16;
    __int16 v19 = [v16 absoluteString];
    [v18 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F2E308]];

    uint64_t v20 = [*(id *)(a1 + 40) contextID];
    [v18 setObject:v20 forKeyedSubscript:@"home"];

    uint64_t v21 = [*(id *)(a1 + 40) uuid];
    id v22 = [v21 UUIDString];

    uint64_t v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = *(id *)(a1 + 32);
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v43 = v26;
      __int16 v44 = 2112;
      uint64_t v45 = v12;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Inserting access code changed bulletin with message: %@", buf, 0x16u);
    }
    __int16 v27 = [MEMORY[0x1E4F29128] UUID];
    id v28 = [v27 UUIDString];

    uint64_t v29 = [*(id *)(a1 + 32) notificationCenter];
    uint64_t v30 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v31 = (void *)[v18 copy];
    LOBYTE(v37) = 0;
    id v32 = [v29 showNotificationWithTitle:v40 body:v12 threadIdentifier:v22 categoryIdentifier:@"HMDBBNormalType" requestIdentifier:v28 date:v30 attachments:0 userInfo:v31 shouldIgnoreDoNotDisturb:v37 interruptionLevel:1 logEventTopic:1];

    [*(id *)(a1 + 32) addNotificationRequest:v32 forIdentifier:v28];
  }
  else
  {
    id v33 = (void *)MEMORY[0x1D9452090]();
    id v34 = *(id *)(a1 + 32);
    uint32_t v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      __int16 v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v43 = v36;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, can not insert access code changed bulletin", buf, 0xCu);
    }
  }
}

- (void)insertAccessCodeAddedBulletinForHome:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBulletinBoard *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__HMDBulletinBoard_insertAccessCodeAddedBulletinForHome___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__HMDBulletinBoard_insertAccessCodeAddedBulletinForHome___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) homeManager];

  if (v2)
  {
    id v40 = HMDLocalizedStringForKey(@"BULLETIN_ACCESS_CODE_ADDED_TITLE");
    id v3 = NSString;
    id v4 = HMDLocalizedStringForKey(@"BULLETIN_ACCESS_CODE_ADDED_MESSAGE");
    id v41 = 0;
    id v5 = [*(id *)(a1 + 40) name];
    id v6 = [v3 localizedStringWithValidatedFormat:v4, @"%@", &v41, v5 validFormatSpecifiers error];
    id v7 = v41;

    id v8 = v6;
    if (!v6)
    {
      id v9 = (void *)MEMORY[0x1D9452090]();
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        __int16 v43 = v11;
        __int16 v44 = 2112;
        uint64_t v45 = @"BULLETIN_ACCESS_CODE_ADDED_MESSAGE";
        __int16 v46 = 2112;
        __int16 v47 = @"%@";
        __int16 v48 = 2112;
        id v49 = v7;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
      }
      id v8 = @"BULLETIN_ACCESS_CODE_ADDED_MESSAGE";
    }
    id v12 = v8;

    id v13 = NSString;
    char v14 = [*(id *)(a1 + 40) contextSPIUniqueIdentifier];
    uint64_t v15 = [v13 stringWithValidatedFormat:@"com.apple.Home-private://userLockSettings/%@", @"%@", 0, v14 validFormatSpecifiers error];

    id v39 = (void *)v15;
    uint64_t v16 = [MEMORY[0x1E4F1CB10] URLWithString:v15];
    id v17 = [*(id *)(a1 + 40) homeBulletinContext];
    uint64_t v18 = (void *)[v17 mutableCopy];

    uint64_t v38 = v16;
    __int16 v19 = [v16 absoluteString];
    [v18 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F2E308]];

    uint64_t v20 = [*(id *)(a1 + 40) contextID];
    [v18 setObject:v20 forKeyedSubscript:@"home"];

    uint64_t v21 = [*(id *)(a1 + 40) uuid];
    id v22 = [v21 UUIDString];

    uint64_t v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = *(id *)(a1 + 32);
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v43 = v26;
      __int16 v44 = 2112;
      uint64_t v45 = v12;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Inserting access code added bulletin with message: %@", buf, 0x16u);
    }
    __int16 v27 = [MEMORY[0x1E4F29128] UUID];
    id v28 = [v27 UUIDString];

    uint64_t v29 = [*(id *)(a1 + 32) notificationCenter];
    uint64_t v30 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v31 = (void *)[v18 copy];
    LOBYTE(v37) = 0;
    id v32 = [v29 showNotificationWithTitle:v40 body:v12 threadIdentifier:v22 categoryIdentifier:@"HMDBBNormalType" requestIdentifier:v28 date:v30 attachments:0 userInfo:v31 shouldIgnoreDoNotDisturb:v37 interruptionLevel:1 logEventTopic:1];

    [*(id *)(a1 + 32) addNotificationRequest:v32 forIdentifier:v28];
  }
  else
  {
    id v33 = (void *)MEMORY[0x1D9452090]();
    id v34 = *(id *)(a1 + 32);
    uint32_t v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      __int16 v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v43 = v36;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, can not insert access code added bulletin", buf, 0xCu);
    }
  }
}

- (void)insertHomeHubReachabilityBulletinForHome:(id)a3 reachable:(BOOL)a4 hasMultipleResidents:(BOOL)a5
{
  id v8 = a3;
  id v9 = [(HMDBulletinBoard *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__HMDBulletinBoard_insertHomeHubReachabilityBulletinForHome_reachable_hasMultipleResidents___block_invoke;
  block[3] = &unk_1E6A12C78;
  void block[4] = self;
  id v12 = v8;
  BOOL v13 = a4;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_async(v9, block);
}

void __92__HMDBulletinBoard_insertHomeHubReachabilityBulletinForHome_reachable_hasMultipleResidents___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) homeManager];

  if (!v2)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = (uint64_t)v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, bailing insertBulletinsForUnreachableRecordingCamera", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if (([*(id *)(a1 + 40) shouldPostBulletin] & 1) == 0)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) name];
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = (uint64_t)v11;
      __int16 v43 = 2112;
      __int16 v44 = v12;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Not allowed to post home hub reachability bulletin for home: %@", buf, 0x16u);
    }
LABEL_11:
    return;
  }
  uint64_t v3 = [*(id *)(a1 + 40) name];
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = @"HOME_REACHABLE_HOME_HUB";
  }
  else if (*(unsigned char *)(a1 + 49))
  {
    id v4 = @"HOME_NO_REACHABLE_HOME_HUBS";
  }
  else
  {
    id v4 = @"HOME_NO_REACHABLE_HOME_HUB";
  }
  id v40 = HMDLocalizedStringForKey(v4);
  BOOL v13 = (void *)MEMORY[0x1E4F2E690];
  BOOL v14 = [*(id *)(a1 + 40) contextSPIUniqueIdentifier];
  uint64_t v15 = [v14 UUIDString];
  uint64_t v16 = [v13 tupleWithQueryType:0 uuidString:v15];

  id v39 = (void *)v16;
  id v17 = generateURLForHomeKitObject();
  uint64_t v18 = [*(id *)(a1 + 40) homeBulletinContext];
  __int16 v19 = (void *)[v18 mutableCopy];

  uint64_t v38 = v17;
  uint64_t v20 = [v17 absoluteString];
  [v19 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F2E308]];

  uint64_t v21 = [*(id *)(a1 + 40) contextID];
  [v19 setObject:v21 forKeyedSubscript:@"home"];

  id v22 = [*(id *)(a1 + 40) uuid];
  uint64_t v23 = [v22 UUIDString];

  id v24 = (void *)MEMORY[0x1D9452090]();
  id v25 = *(id *)(a1 + 32);
  __int16 v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = HMFGetLogIdentifier();
    id v28 = (void *)v27;
    uint64_t v29 = @"Reachable";
    if (!*(unsigned char *)(a1 + 48)) {
      uint64_t v29 = @"Unreachable";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v42 = v27;
    __int16 v43 = 2114;
    __int16 v44 = v29;
    _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Posting %{public}@ Home Bulletin", buf, 0x16u);
  }
  uint64_t v30 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v31 = [v30 UUIDString];

  id v32 = [*(id *)(a1 + 32) notificationCenter];
  id v33 = [MEMORY[0x1E4F1C9C8] date];
  id v34 = (void *)[v19 copy];
  LOBYTE(v37) = 0;
  [v32 showNotificationWithTitle:v3 body:v40 threadIdentifier:v23 categoryIdentifier:@"HMDBBNormalType" requestIdentifier:v31 date:v33 attachments:0 userInfo:v34 shouldIgnoreDoNotDisturb:v37 interruptionLevel:1 logEventTopic:10];
  v36 = uint32_t v35 = (void *)v3;

  [*(id *)(a1 + 32) addNotificationRequest:v36 forIdentifier:v31];
}

- (void)insertReachabilityEventBulletinForAccessory:(id)a3 reachable:(BOOL)a4 date:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HMDBulletinBoard *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__HMDBulletinBoard_insertReachabilityEventBulletinForAccessory_reachable_date___block_invoke;
  v13[3] = &unk_1E6A15B38;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __79__HMDBulletinBoard_insertReachabilityEventBulletinForAccessory_reachable_date___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) homeManager];

  if (!v2)
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = *(id *)(a1 + 32);
    BOOL v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v54 = v17;
      uint64_t v18 = "%{public}@Home manager is not yet configured, bailing insertReachabilityEventBulletinForAccessory";
LABEL_11:
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);
    }
LABEL_12:

    return;
  }
  uint64_t v3 = [*(id *)(a1 + 40) cameraProfiles];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = *(id *)(a1 + 32);
    BOOL v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v54 = v17;
      uint64_t v18 = "%{public}@Accessory without cameraProfiles is not supported for reachability event bulletin";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v5 = [*(id *)(a1 + 40) home];
  id v49 = [v5 name];
  id v6 = NSString;
  if (*(unsigned char *)(a1 + 56))
  {
    id v7 = HMDLocalizedStringForKey(@"CAMERA_IS_REACHABLE");
    id v51 = 0;
    id v8 = [*(id *)(a1 + 40) name];
    id v9 = [v6 localizedStringWithValidatedFormat:v7, @"%@", &v51, v8 validFormatSpecifiers error];
    id v10 = v51;

    if (!v9)
    {
      id v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = HMFGetOSLogHandle();
      id v9 = @"CAMERA_IS_REACHABLE";
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        BOOL v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        uint64_t v54 = v13;
        __int16 v55 = 2112;
        id v56 = @"CAMERA_IS_REACHABLE";
        __int16 v57 = 2112;
        uint64_t v58 = @"%@";
        __int16 v59 = 2112;
        id v60 = v10;
LABEL_17:
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        goto LABEL_18;
      }
      goto LABEL_18;
    }
  }
  else
  {
    __int16 v19 = HMDLocalizedStringForKey(@"CAMERA_IS_UNREACHABLE");
    id v50 = 0;
    uint64_t v20 = [*(id *)(a1 + 40) name];
    id v9 = [v6 localizedStringWithValidatedFormat:v19, @"%@", &v50, v20 validFormatSpecifiers error];
    id v10 = v50;

    if (!v9)
    {
      id v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = HMFGetOSLogHandle();
      id v9 = @"CAMERA_IS_UNREACHABLE";
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        BOOL v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        uint64_t v54 = v13;
        __int16 v55 = 2112;
        id v56 = @"CAMERA_IS_UNREACHABLE";
        __int16 v57 = 2112;
        uint64_t v58 = @"%@";
        __int16 v59 = 2112;
        id v60 = v10;
        goto LABEL_17;
      }
LABEL_18:

      uint64_t v21 = 0;
      goto LABEL_19;
    }
  }
  uint64_t v21 = v9;
LABEL_19:
  __int16 v48 = v9;

  id v22 = (void *)MEMORY[0x1E4F2E690];
  uint64_t v23 = [*(id *)(a1 + 40) contextSPIUniqueIdentifier];
  id v24 = [v23 UUIDString];
  __int16 v46 = [v22 tupleWithQueryType:1 uuidString:v24];

  id v25 = (void *)MEMORY[0x1E4F2E690];
  __int16 v26 = [v5 contextSPIUniqueIdentifier];
  uint64_t v27 = [v26 UUIDString];
  __int16 v47 = [v25 tupleWithQueryType:0 uuidString:v27];

  id v28 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v52 = v47;
  uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
  uint64_t v30 = [v28 setWithArray:v29];
  uint64_t v31 = generateURLForHomeKitObject();

  id v32 = [*(id *)(a1 + 40) accessoryBulletinContext];
  id v33 = (void *)[v32 mutableCopy];

  id v34 = [v31 absoluteString];
  [v33 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F2E308]];

  uint32_t v35 = [v5 contextID];
  [v33 setObject:v35 forKeyedSubscript:@"home"];

  __int16 v36 = [v5 uuid];
  uint64_t v37 = [v36 UUIDString];

  [MEMORY[0x1E4F29128] UUID];
  uint64_t v38 = v45 = v5;
  id v39 = [v38 UUIDString];

  id v40 = [*(id *)(a1 + 32) notificationCenter];
  uint64_t v41 = *(void *)(a1 + 48);
  uint64_t v42 = (void *)[v33 copy];
  LOBYTE(v44) = 0;
  __int16 v43 = [v40 showNotificationWithTitle:v49 body:v48 threadIdentifier:v37 categoryIdentifier:@"HMDBBNormalType" requestIdentifier:v39 date:v41 attachments:0 userInfo:v42 shouldIgnoreDoNotDisturb:v44 interruptionLevel:1 logEventTopic:7];

  [*(id *)(a1 + 32) addNotificationRequest:v43 forIdentifier:v39];
}

- (id)insertBulletinForSecureTrigger:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uuid];
  id v6 = [v5 UUIDString];

  id v7 = [(HMDBulletinBoard *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HMDBulletinBoard_insertBulletinForSecureTrigger___block_invoke;
  block[3] = &unk_1E6A19668;
  void block[4] = self;
  id v14 = v4;
  id v8 = v6;
  id v15 = v8;
  id v9 = v4;
  dispatch_async(v7, block);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

void __51__HMDBulletinBoard_insertBulletinForSecureTrigger___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) homeManager];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) home];
    uint64_t v37 = HMDLocalizedStringForKey(@"CONFIRM_EXECUTE_SECURE_TRIGGER_TITLE");
    id v4 = NSString;
    id v5 = HMDLocalizedStringForKey(@"CONFIRM_EXECUTE_SECURE_TRIGGER_BODY");
    id v38 = 0;
    id v6 = [v3 name];
    id v7 = [*(id *)(a1 + 40) name];
    id v8 = [v4 localizedStringWithValidatedFormat:v5, @"%@ %@", &v38, v6, v7 validFormatSpecifiers error];
    id v9 = v38;

    id v10 = v8;
    if (!v8)
    {
      id v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        BOOL v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        uint64_t v41 = v13;
        __int16 v42 = 2112;
        __int16 v43 = @"CONFIRM_EXECUTE_SECURE_TRIGGER_BODY";
        __int16 v44 = 2112;
        uint64_t v45 = @"%@ %@";
        __int16 v46 = 2112;
        id v47 = v9;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
      }
      id v10 = @"CONFIRM_EXECUTE_SECURE_TRIGGER_BODY";
    }
    id v14 = v10;

    id v15 = (void *)MEMORY[0x1E4F2E690];
    BOOL v16 = [*(id *)(a1 + 40) contextSPIUniqueIdentifier];
    id v17 = [v16 UUIDString];
    uint64_t v18 = [v15 tupleWithQueryType:6 uuidString:v17];

    __int16 v19 = (void *)MEMORY[0x1E4F2E690];
    uint64_t v20 = [v3 contextSPIUniqueIdentifier];
    uint64_t v21 = [v20 UUIDString];
    id v22 = [v19 tupleWithQueryType:0 uuidString:v21];

    uint64_t v23 = (void *)MEMORY[0x1E4F1CAD0];
    id v39 = v22;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    id v25 = [v23 setWithArray:v24];
    __int16 v26 = generateURLForHomeKitObject();

    uint64_t v27 = *(void **)(a1 + 32);
    uint64_t v28 = *(void *)(a1 + 48);
    uint64_t v29 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v30 = [*(id *)(a1 + 40) bulletinContext];
    uint64_t v31 = [*(id *)(a1 + 40) actionContext];
    id v32 = (id)[v27 _insertRequestWithTitle:v37 snapshotData:0 message:v14 requestIdentifier:v28 date:v29 bulletinType:2 actionURL:v26 bulletinContext:v30 actionContext:v31 interruptionLevel:2 logEventTopic:4];
  }
  else
  {
    id v33 = (void *)MEMORY[0x1D9452090]();
    id v34 = *(id *)(a1 + 32);
    uint32_t v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      __int16 v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v36;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, bailing insertBulletinForSecureTrigger.", buf, 0xCu);
    }
  }
}

- (void)insertBulletinForIncompatibleInvitationFromInviterName:(id)a3 homeName:(id)a4 ownedHomeIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDBulletinBoard *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __104__HMDBulletinBoard_insertBulletinForIncompatibleInvitationFromInviterName_homeName_ownedHomeIdentifier___block_invoke;
  v15[3] = &unk_1E6A18668;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __104__HMDBulletinBoard_insertBulletinForIncompatibleInvitationFromInviterName_homeName_ownedHomeIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) homeManager];

  if (v2)
  {
    uint64_t v3 = HMDLocalizedStringForKey(@"INVITE_REQUEST_TITLE");
    id v4 = NSString;
    if (*(void *)(a1 + 40))
    {
      id v5 = HMDLocalizedStringForKey(@"INVITE_INCOMPATIBLE_HH1_BODY");
      id v31 = 0;
      id v6 = [v4 localizedStringWithValidatedFormat:v5, @"%@ %@", &v31, *(void *)(a1 + 48), *(void *)(a1 + 40) validFormatSpecifiers error];
      id v7 = v31;

      if (!v6)
      {
        id v8 = (void *)MEMORY[0x1D9452090]();
        id v9 = HMFGetOSLogHandle();
        id v6 = @"INVITE_INCOMPATIBLE_HH1_BODY";
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          uint32_t v35 = v10;
          __int16 v36 = 2112;
          uint64_t v37 = @"INVITE_INCOMPATIBLE_HH1_BODY";
          __int16 v38 = 2112;
          id v39 = @"%@ %@";
          __int16 v40 = 2112;
          id v41 = v7;
LABEL_13:
          _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else
    {
      id v15 = HMDLocalizedStringForKey(@"INVITE_INCOMPATIBLE_HH1_NO_HOME_NAME_BODY");
      id v30 = 0;
      id v6 = [v4 localizedStringWithValidatedFormat:v15, @"%@", &v30, *(void *)(a1 + 48) validFormatSpecifiers error];
      id v7 = v30;

      if (!v6)
      {
        id v8 = (void *)MEMORY[0x1D9452090]();
        id v9 = HMFGetOSLogHandle();
        id v6 = @"INVITE_INCOMPATIBLE_HH1_NO_HOME_NAME_BODY";
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          uint32_t v35 = v10;
          __int16 v36 = 2112;
          uint64_t v37 = @"INVITE_INCOMPATIBLE_HH1_NO_HOME_NAME_BODY";
          __int16 v38 = 2112;
          id v39 = @"%@";
          __int16 v40 = 2112;
          id v41 = v7;
          goto LABEL_13;
        }
LABEL_14:

        id v16 = 0;
        goto LABEL_15;
      }
    }
    id v16 = v6;
LABEL_15:
    id v17 = v6;

    if (*(void *)(a1 + 56))
    {
      id v18 = [MEMORY[0x1E4F29088] componentsWithString:@"com.apple.Home-private://"];
      [v18 setHost:@"homepodSoftwareUpdate"];
      __int16 v19 = [*(id *)(a1 + 56) UUIDString];
      uint64_t v20 = [@"homeId=" stringByAppendingString:v19];
      [v18 setQuery:v20];

      uint64_t v21 = [v18 URL];

      if (v21)
      {
        uint64_t v32 = *MEMORY[0x1E4F2E308];
        id v22 = [v21 absoluteString];
        id v33 = v22;
        uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      }
      else
      {
        uint64_t v23 = 0;
      }
    }
    else
    {
      uint64_t v23 = 0;
      uint64_t v21 = 0;
    }
    id v24 = [MEMORY[0x1E4F29128] UUID];
    id v25 = [v24 UUIDString];

    __int16 v26 = [*(id *)(a1 + 32) notificationCenter];
    uint64_t v27 = [MEMORY[0x1E4F1C9C8] date];
    LOBYTE(v29) = 0;
    uint64_t v28 = [v26 showNotificationWithTitle:v3 body:v17 threadIdentifier:0 categoryIdentifier:@"HMDBBNormalType" requestIdentifier:v25 date:v27 attachments:0 userInfo:v23 shouldIgnoreDoNotDisturb:v29 interruptionLevel:1 logEventTopic:22];

    [*(id *)(a1 + 32) addNotificationRequest:v28 forIdentifier:v25];
    return;
  }
  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = *(id *)(a1 + 32);
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint32_t v35 = v14;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Home manager is not yet configured, bailing insertBulletinForIncomingInvitation.", buf, 0xCu);
  }
}

- (id)insertBulletinForIncomingInvitation:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [v5 UUIDString];

  uint64_t v7 = [v4 bulletinContext];
  if (!v7) {
    goto LABEL_4;
  }
  id v8 = (void *)v7;
  id v9 = [v4 bulletinContext];
  id v10 = [v9 objectForKeyedSubscript:@"homeIncomingInvitation"];

  if (v10)
  {
    id v11 = [(HMDBulletinBoard *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__HMDBulletinBoard_insertBulletinForIncomingInvitation___block_invoke;
    block[3] = &unk_1E6A19668;
    void block[4] = self;
    id v20 = v4;
    id v12 = v6;
    id v21 = v12;
    dispatch_async(v11, block);

    id v13 = v12;
  }
  else
  {
LABEL_4:
    id v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Invalid incoming invitation bulletinContext!", buf, 0xCu);
    }
    id v13 = 0;
  }

  return v13;
}

void __56__HMDBulletinBoard_insertBulletinForIncomingInvitation___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) homeManager];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) invitationData];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;

    id v6 = HMDLocalizedStringForKey(@"INVITE_REQUEST_TITLE");
    uint64_t v7 = NSString;
    id v8 = HMDLocalizedStringForKey(@"CONFIRM_INVITE_TO_HOME");
    id v31 = 0;
    id v9 = [v5 inviterName];
    id v10 = [*(id *)(a1 + 40) homeName];
    id v11 = [v7 localizedStringWithValidatedFormat:v8, @"%@ %@", &v31, v9, v10 validFormatSpecifiers error];
    id v12 = v31;

    id v13 = v11;
    if (!v11)
    {
      id v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        id v33 = v16;
        __int16 v34 = 2112;
        uint32_t v35 = @"CONFIRM_INVITE_TO_HOME";
        __int16 v36 = 2112;
        uint64_t v37 = @"%@ %@";
        __int16 v38 = 2112;
        id v39 = v12;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
      }
      id v13 = @"CONFIRM_INVITE_TO_HOME";
    }
    id v17 = v13;

    id v18 = [*(id *)(a1 + 40) bulletinContext];
    __int16 v19 = [v18 objectForKeyedSubscript:@"homeIncomingInvitation"];

    id v20 = [MEMORY[0x1E4F2E690] tupleWithQueryType:4 uuidString:v19];
    id v21 = generateURLForHomeKitObject();
    id v22 = *(void **)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 48);
    uint64_t v24 = [MEMORY[0x1E4F1C9C8] date];
    id v25 = [*(id *)(a1 + 40) bulletinContext];
    id v26 = (id)[v22 _insertRequestWithTitle:v6 snapshotData:0 message:v17 requestIdentifier:v23 date:v24 bulletinType:0 actionURL:v21 bulletinContext:v25 actionContext:0 interruptionLevel:1 logEventTopic:11];
  }
  else
  {
    uint64_t v27 = (void *)MEMORY[0x1D9452090]();
    id v28 = *(id *)(a1 + 32);
    uint64_t v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      id v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v33 = v30;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Home manager is not yet configured, bailing insertBulletinForIncomingInvitation.", buf, 0xCu);
    }
  }
}

- (void)insertBulletinsForChangedCharacteristics:(id)a3 modifiedCharacteristics:(id)a4 changedByThisDevice:(BOOL)a5 changeNotificationFromPrimary:(BOOL)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = +[HMDHome filterAllowedToPostBulletinFromCharacteristics:a3];
  if ([v12 count])
  {
    id v13 = [(HMDBulletinBoard *)self workQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __146__HMDBulletinBoard_insertBulletinsForChangedCharacteristics_modifiedCharacteristics_changedByThisDevice_changeNotificationFromPrimary_completion___block_invoke;
    v14[3] = &unk_1E6A0F878;
    v14[4] = self;
    id v16 = v11;
    id v15 = v12;
    BOOL v17 = a5;
    BOOL v18 = a6;
    dispatch_async(v13, v14);
  }
}

void __146__HMDBulletinBoard_insertBulletinsForChangedCharacteristics_modifiedCharacteristics_changedByThisDevice_changeNotificationFromPrimary_completion___block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) homeManager];

  if (v2)
  {
    id v41 = [MEMORY[0x1E4F1CA48] array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v52 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          id v9 = +[HMDBulletinCategory targetCurrentCharacteristicTypeMap];
          id v10 = [v8 type];
          id v11 = [v9 objectForKeyedSubscript:v10];

          if (v11) {
            [*(id *)(a1 + 32) _updateCharacteristicTupleFor:v8 withCurrentType:v11 changedByThisDevice:*(unsigned __int8 *)(a1 + 56)];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v51 objects:v61 count:16];
      }
      while (v5);
    }

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = *(id *)(a1 + 40);
    uint64_t v12 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v48 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v47 + 1) + 8 * j);
          BOOL v17 = objc_msgSend(v16, "type", v41);
          BOOL v18 = [v16 service];
          __int16 v19 = [v18 type];
          if (+[HMDBulletinBoard isBulletinSupportedForCharacteristicType:v17 serviceType:v19])
          {
            int v20 = [*(id *)(a1 + 32) _shouldPostBulletinOnCurrentValueChangeForCharacteristic:v16 includeChangeFromNil:*(unsigned __int8 *)(a1 + 57)];

            if (v20) {
              [v41 addObject:v16];
            }
          }
          else
          {
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
      }
      while (v13);
    }

    id v21 = [MEMORY[0x1E4F1CA48] array];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v22 = v41;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v59 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v44;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v44 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void **)(*((void *)&v43 + 1) + 8 * v26);
          if (+[HMDBulletinCategory isSensorDetectedCharacteristic:](HMDBulletinCategory, "isSensorDetectedCharacteristic:", v27, v41))
          {
            id v28 = [v27 value];
            int v29 = [v28 intValue];

            if (!v29) {
              goto LABEL_30;
            }
LABEL_29:
            [v21 addObject:v27];
            goto LABEL_30;
          }
          if (([*(id *)(a1 + 32) _hasDuplicateBulletinForCharacteristic:v27] & 1) == 0) {
            goto LABEL_29;
          }
LABEL_30:
          ++v26;
        }
        while (v24 != v26);
        uint64_t v30 = [v22 countByEnumeratingWithState:&v43 objects:v59 count:16];
        uint64_t v24 = v30;
      }
      while (v30);
    }

    id v31 = (void *)MEMORY[0x1D9452090]();
    id v32 = *(id *)(a1 + 32);
    id v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      __int16 v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v56 = v34;
      __int16 v57 = 2112;
      uint64_t v58 = v21;
      _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@After filtering, actually posting notifications for characteristics: %@", buf, 0x16u);
    }
    if ([v21 count])
    {
      [*(id *)(a1 + 32) _insertImageBulletinsForChangedCharacteristics:v21 snapshotData:0 completion:0];
      uint64_t v35 = *(void *)(a1 + 48);
      if (v35) {
        (*(void (**)(void))(v35 + 16))();
      }
    }
  }
  else
  {
    __int16 v36 = (void *)MEMORY[0x1D9452090]();
    id v37 = *(id *)(a1 + 32);
    __int16 v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      id v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v56 = v39;
      _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, bailing insertBulletinsForChangedCharacteristics.", buf, 0xCu);
    }
    uint64_t v40 = *(void *)(a1 + 48);
    if (v40) {
      (*(void (**)(void))(v40 + 16))();
    }
  }
}

- (void)insertImageBulletinsForChangedCharacteristics:(id)a3 snapshotData:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = +[HMDHome filterAllowedToPostBulletinFromCharacteristics:a3];
  if ([v10 count])
  {
    id v11 = [(HMDBulletinBoard *)self workQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __90__HMDBulletinBoard_insertImageBulletinsForChangedCharacteristics_snapshotData_completion___block_invoke;
    v12[3] = &unk_1E6A18398;
    void v12[4] = self;
    id v15 = v9;
    id v13 = v10;
    id v14 = v8;
    dispatch_async(v11, v12);
  }
}

void __90__HMDBulletinBoard_insertImageBulletinsForChangedCharacteristics_snapshotData_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) homeManager];

  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v4 = *(id *)(v1 + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v27;
      *(void *)&long long v6 = 138543618;
      long long v24 = v6;
      do
      {
        uint64_t v9 = 0;
        uint64_t v25 = v7;
        do
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * v9);
          if (objc_msgSend(*(id *)(v1 + 32), "_hasDuplicateBulletinForSnapshotCharacteristic:", v10, v24))
          {
            id v11 = (void *)MEMORY[0x1D9452090]();
            id v12 = *(id *)(v1 + 32);
            id v13 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              uint64_t v14 = v8;
              uint64_t v15 = v1;
              id v16 = v4;
              BOOL v18 = v17 = v3;
              *(_DWORD *)buf = v24;
              id v31 = v18;
              __int16 v32 = 2112;
              uint64_t v33 = v10;
              _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Not creating bulletin because it already exists with the same characteristic update: %@", buf, 0x16u);

              id v3 = v17;
              id v4 = v16;
              uint64_t v1 = v15;
              uint64_t v8 = v14;
              uint64_t v7 = v25;
            }
          }
          else
          {
            [v3 addObject:v10];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v7);
    }

    [*(id *)(v1 + 32) _insertImageBulletinsForChangedCharacteristics:v3 snapshotData:*(void *)(v1 + 48) completion:*(void *)(v1 + 56)];
  }
  else
  {
    __int16 v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = *(id *)(v1 + 32);
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v31 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Home manager is not yet configured, bailing insertImageBulletinsForChangedCharacteristics.", buf, 0xCu);
    }
    uint64_t v23 = *(void *)(v1 + 56);
    if (v23) {
      (*(void (**)(uint64_t, void))(v23 + 16))(v23, MEMORY[0x1E4F1CBF0]);
    }
  }
}

- (void)archive
{
  id v3 = [(HMDBulletinBoard *)self persistentStoreClass];
  [(objc_class *)v3 archiveBulletinBoard:self];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBulletinBoard *)self notificationRequests];
  [v4 encodeObject:v5 forKey:@"HMD.bulletinRequests"];
}

- (HMDBulletinBoard)initWithCoder:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDBulletinBoard *)self init];
  if (v5)
  {
    long long v6 = (void *)MEMORY[0x1E4F1CAD0];
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    v11[2] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
    uint64_t v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HMD.bulletinRequests"];

    if (v9) {
      [(HMDBulletinBoard *)v5 setNotificationRequests:v9];
    }
  }
  return v5;
}

- (int64_t)bulletinNotificationsGroupTimeInterval
{
  uint64_t v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  id v3 = [v2 preferenceForKey:@"HMDBulletinNotificationsGroupTimeInterval"];
  id v4 = [v3 numberValue];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (void)configureWithHomeManager:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = (void *)MEMORY[0x1D9452090]();
  long long v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring with home manager: %@", buf, 0x16u);
  }
  uint64_t v9 = [(HMDBulletinBoard *)v6 workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__HMDBulletinBoard_configureWithHomeManager___block_invoke;
  v11[3] = &unk_1E6A197C8;
  void v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

void __45__HMDBulletinBoard_configureWithHomeManager___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHomeManager:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 notificationCenter];
  [v3 setDelegate:v2];

  id v4 = [*(id *)(a1 + 32) notificationCenter];
  int64_t v5 = +[HMDBulletinBoard notificationCategories];
  long long v6 = [v4 configureWithNotificationCategories:v5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __45__HMDBulletinBoard_configureWithHomeManager___block_invoke_2;
  v8[3] = &unk_1E6A17A30;
  void v8[4] = *(void *)(a1 + 32);
  id v7 = (id)[v6 addCompletionBlock:v8];
}

void __45__HMDBulletinBoard_configureWithHomeManager___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) isConfiguredFuture];
  [v1 finishWithNoResult];
}

- (HMDBulletinBoard)initWithNotificationCenter:(id)a3 fileManager:(id)a4 workQueue:(id)a5 doorbellBulletinUtilities:(id)a6 logEventSubmitter:(id)a7
{
  id v28 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HMDBulletinBoard;
  uint64_t v17 = [(HMDBulletinBoard *)&v29 init];
  BOOL v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_notificationCenter, a3);
    objc_storeStrong((id *)&v18->_fileManager, a4);
    objc_storeStrong((id *)&v18->_workQueue, a5);
    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    characteristicTuples = v18->_characteristicTuples;
    v18->_characteristicTuples = (NSMutableDictionary *)v19;

    uint64_t v21 = objc_opt_class();
    Class persistentStoreClass = v18->_persistentStoreClass;
    v18->_Class persistentStoreClass = (Class)v21;

    objc_storeStrong((id *)&v18->_doorbellBulletinUtilities, a6);
    objc_storeStrong((id *)&v18->_logEventSubmitter, a7);
    uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
    notificationRequests = v18->_notificationRequests;
    v18->_notificationRequests = (NSMutableDictionary *)v23;

    uint64_t v25 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    isConfiguredFuture = v18->_isConfiguredFuture;
    v18->_isConfiguredFuture = v25;
  }
  return v18;
}

- (HMDBulletinBoard)init
{
  HMDispatchQueueNameString();
  id v3 = objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)[v3 UTF8String];
  int64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create(v4, v5);

  id v7 = +[HMDMetricsManager sharedLogEventSubmitter];
  uint64_t v8 = [HMDUserNotificationCenter alloc];
  id v9 = (id)*MEMORY[0x1E4F2D1C8];
  id v10 = [(HMDUserNotificationCenter *)v8 initWithBundleIdentifier:v9 logEventSubmitter:v7];

  id v11 = objc_alloc_init(HMDFileManager);
  id v12 = objc_alloc_init(HMDDoorbellBulletinUtilities);
  id v13 = [(HMDBulletinBoard *)self initWithNotificationCenter:v10 fileManager:v11 workQueue:v6 doorbellBulletinUtilities:v12 logEventSubmitter:v7];

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t138 != -1) {
    dispatch_once(&logCategory__hmf_once_t138, &__block_literal_global_332);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v139;
  return v2;
}

uint64_t __31__HMDBulletinBoard_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v139;
  logCategory__hmf_once_uint64_t v139 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)presentationValueOfCharacteristic:(id)a3 equalTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 metadata];
  uint64_t v8 = [v7 stepValue];
  id v9 = [v5 value];
  id v10 = [v5 type];
  id v11 = +[HMDBulletinCategory presentationValueForValue:v9 type:v10];

  if (!v11)
  {
    id v11 = [v5 value];
  }
  BOOL v12 = compareCharacteristicValue(v11, v6, (void *)4, v8);

  return v12;
}

+ (id)characteristicTupleKeyFromServiceContextID:(id)a3 currentType:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@:%@", a3, a4];
}

+ (unint64_t)interruptionLevelForChangedCharacteristic:(id)a3
{
  id v3 = a3;
  if (interruptionLevelForChangedCharacteristic__onceToken != -1) {
    dispatch_once(&interruptionLevelForChangedCharacteristic__onceToken, &__block_literal_global_53_27287);
  }
  id v4 = [v3 service];
  id v5 = (void *)interruptionLevelForChangedCharacteristic__criticalCharacteristicsByService;
  id v6 = [v4 type];
  id v7 = [v5 objectForKeyedSubscript:v6];

  uint64_t v8 = (void *)interruptionLevelForChangedCharacteristic__timeSensitiveCharacteristicsByService;
  id v9 = [v4 type];
  id v10 = [v8 objectForKeyedSubscript:v9];

  if (v7
    && ([v3 type],
        id v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v7 containsObject:v11],
        v11,
        v12))
  {
    id v13 = [v3 type];
    int v14 = [v13 isEqualToString:*MEMORY[0x1E4F5B848]];

    if (v14)
    {
      id v15 = [v3 value];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v16 = v15;
      }
      else {
        id v16 = 0;
      }
      id v17 = v16;

      int v18 = [v17 intValue];
      if (v18 == 4) {
        unint64_t v19 = 3;
      }
      else {
        unint64_t v19 = 1;
      }
    }
    else
    {
      unint64_t v19 = 3;
    }
  }
  else if (v10)
  {
    id v20 = [v3 type];
    int v21 = [v10 containsObject:v20];

    if (v21) {
      unint64_t v19 = 2;
    }
    else {
      unint64_t v19 = 1;
    }
  }
  else
  {
    unint64_t v19 = 1;
  }

  return v19;
}

void __62__HMDBulletinBoard_interruptionLevelForChangedCharacteristic___block_invoke()
{
  v19[4] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F5BAD0];
  uint64_t v17 = *MEMORY[0x1E4F5B848];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v19[0] = v0;
  v18[1] = *MEMORY[0x1E4F5BAE8];
  uint64_t v16 = *MEMORY[0x1E4F5B7F8];
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v19[1] = v1;
  v18[2] = *MEMORY[0x1E4F5BB00];
  uint64_t v15 = *MEMORY[0x1E4F5B890];
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v19[2] = v2;
  v18[3] = *MEMORY[0x1E4F5BB20];
  uint64_t v14 = *MEMORY[0x1E4F5B910];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v19[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
  id v5 = (void *)interruptionLevelForChangedCharacteristic__criticalCharacteristicsByService;
  interruptionLevelForChangedCharacteristic__criticalCharacteristicsByService = v4;

  v12[0] = *MEMORY[0x1E4F5BAE0];
  uint64_t v11 = *MEMORY[0x1E4F5B7F0];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v13[0] = v6;
  v12[1] = *MEMORY[0x1E4F5BA78];
  uint64_t v10 = *MEMORY[0x1E4F5B888];
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v13[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v9 = (void *)interruptionLevelForChangedCharacteristic__timeSensitiveCharacteristicsByService;
  interruptionLevelForChangedCharacteristic__timeSensitiveCharacteristicsByService = v8;
}

+ (id)createImageAttachmentByHardLinkingFile:(id)a3 fileManager:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    id v9 = [v7 heroFrameStoreDirectoryURL];
    id v36 = 0;
    char v10 = [v8 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v36];
    id v11 = v36;
    if (v10)
    {
      int v12 = [v6 URLByDeletingPathExtension];
      id v13 = [v12 lastPathComponent];

      uint64_t v14 = NSString;
      uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v16 = [v14 stringWithFormat:@"link_%@_%@.%@", v15, v13, @"jpg"];

      uint64_t v17 = [v9 URLByAppendingPathComponent:v16];
      id v35 = v11;
      char v18 = [v8 linkItemAtURL:v6 toURL:v17 error:&v35];
      id v19 = v35;

      if (v18)
      {
        id v20 = +[HMDBulletinBoard attachmentsWithFileURL:v17];
      }
      else
      {
        objc_super v29 = (void *)MEMORY[0x1D9452090]();
        id v30 = a1;
        id v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v32 = __int16 v34 = v29;
          *(_DWORD *)buf = 138544130;
          __int16 v38 = v32;
          __int16 v39 = 2112;
          id v40 = v17;
          __int16 v41 = 2112;
          id v42 = v6;
          __int16 v43 = 2112;
          id v44 = v19;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to create hard link: %@ to file: %@ with error %@", buf, 0x2Au);

          objc_super v29 = v34;
        }

        id v20 = (void *)MEMORY[0x1E4F1CBF0];
      }

      id v11 = v19;
    }
    else
    {
      uint64_t v25 = (void *)MEMORY[0x1D9452090]();
      id v26 = a1;
      long long v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        __int16 v38 = v28;
        __int16 v39 = 2112;
        id v40 = v6;
        __int16 v41 = 2112;
        id v42 = v9;
        __int16 v43 = 2112;
        id v44 = v11;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create attachment for file: %@, because failed to create directory at URL %@: %@", buf, 0x2Au);
      }
      id v20 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    int v21 = (void *)MEMORY[0x1D9452090]();
    id v22 = a1;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      long long v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v38 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Returning empty attachments because nil fileURL was passed", buf, 0xCu);
    }
    id v20 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v20;
}

+ (id)attachmentsWithFileURL:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F445F0];
    id v6 = [MEMORY[0x1E4F29128] UUID];
    id v7 = [v6 UUIDString];
    id v16 = 0;
    uint64_t v8 = [v5 attachmentWithIdentifier:v7 URL:v4 options:0 error:&v16];
    id v9 = v16;

    if (v8)
    {
      uint64_t v17 = v8;
      char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    }
    else
    {
      id v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = a1;
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v19 = v14;
        __int16 v20 = 2112;
        id v21 = v4;
        __int16 v22 = 2112;
        id v23 = v9;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to create attachment with URL %@: %@", buf, 0x20u);
      }
      char v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    char v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

+ (id)bulletinSupportedCharacteristicsForService:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[HMDBulletinBoard _supportedSecureServices];
  id v5 = [v3 type];
  id v6 = [v4 objectForKeyedSubscript:v5];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = +[HMDBulletinBoard _supportedNonSecureServices];
    char v10 = [v3 type];
    id v8 = [v9 objectForKeyedSubscript:v10];
  }
  if (!v8)
  {
    uint64_t v14 = 0;
    goto LABEL_21;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = [v3 characteristics];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v12)
  {

LABEL_20:
    uint64_t v14 = [MEMORY[0x1E4F1CAD0] set];
    goto LABEL_21;
  }
  uint64_t v13 = v12;
  id v21 = v3;
  uint64_t v14 = 0;
  uint64_t v15 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v23 != v15) {
        objc_enumerationMutation(v11);
      }
      uint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      char v18 = [v17 type];
      int v19 = [v8 containsObject:v18];

      if (v19)
      {
        if (!v14)
        {
          uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
        }
        [v14 addObject:v17];
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v13);

  id v3 = v21;
  if (!v14) {
    goto LABEL_20;
  }
LABEL_21:

  return v14;
}

+ (BOOL)isCriticalNonSecureServiceType:(id)a3
{
  uint64_t v3 = isCriticalNonSecureServiceType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isCriticalNonSecureServiceType__onceToken, &__block_literal_global_46);
  }
  char v5 = [(id)isCriticalNonSecureServiceType__criticalServices containsObject:v4];

  return v5;
}

void __51__HMDBulletinBoard_isCriticalNonSecureServiceType___block_invoke()
{
  v4[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F5BAE0];
  v4[0] = *MEMORY[0x1E4F5BA78];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F5BB00];
  v4[2] = *MEMORY[0x1E4F5BAE8];
  v4[3] = v1;
  void v4[4] = *MEMORY[0x1E4F5BB20];
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  uint64_t v3 = (void *)isCriticalNonSecureServiceType__criticalServices;
  isCriticalNonSecureServiceType__criticalServices = v2;
}

void __47__HMDBulletinBoard__supportedNonSecureServices__block_invoke()
{
  v22[9] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F5BA78];
  uint64_t v20 = *MEMORY[0x1E4F5B888];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v22[0] = v0;
  v21[1] = *MEMORY[0x1E4F5BAE0];
  uint64_t v19 = *MEMORY[0x1E4F5B7F0];
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v22[1] = v1;
  v21[2] = *MEMORY[0x1E4F5BAE8];
  uint64_t v18 = *MEMORY[0x1E4F5B7F8];
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v22[2] = v2;
  v21[3] = *MEMORY[0x1E4F5BAF0];
  uint64_t v17 = *MEMORY[0x1E4F5B800];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v22[3] = v3;
  v21[4] = *MEMORY[0x1E4F5BB00];
  uint64_t v16 = *MEMORY[0x1E4F5B890];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v22[4] = v4;
  v21[5] = *MEMORY[0x1E4F5BB10];
  uint64_t v15 = *MEMORY[0x1E4F5B8A0];
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v22[5] = v5;
  v21[6] = *MEMORY[0x1E4F5BB18];
  uint64_t v14 = *MEMORY[0x1E4F5B8B8];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v22[6] = v6;
  v21[7] = *MEMORY[0x1E4F5BB20];
  uint64_t v13 = *MEMORY[0x1E4F5B910];
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v22[7] = v7;
  v21[8] = *MEMORY[0x1E4F5BB60];
  uint64_t v8 = *MEMORY[0x1E4F5B960];
  v12[0] = *MEMORY[0x1E4F5B838];
  v12[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v22[8] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:9];
  id v11 = (void *)_supportedNonSecureServices_supportedNonSecureServices;
  _supportedNonSecureServices_supportedNonSecureServices = v10;
}

void __44__HMDBulletinBoard__supportedSecureServices__block_invoke()
{
  v19[6] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F5BA70];
  uint64_t v1 = *MEMORY[0x1E4F5B960];
  v17[0] = *MEMORY[0x1E4F5B838];
  uint64_t v0 = v17[0];
  v17[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v19[0] = v2;
  v18[1] = *MEMORY[0x1E4F5BA90];
  uint64_t v3 = *MEMORY[0x1E4F5B830];
  v16[0] = *MEMORY[0x1E4F5B810];
  v16[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v19[1] = v4;
  v18[2] = *MEMORY[0x1E4F5BAB8];
  uint64_t v5 = *MEMORY[0x1E4F5B958];
  v15[0] = v3;
  v15[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v19[2] = v6;
  v18[3] = *MEMORY[0x1E4F5BAD0];
  uint64_t v14 = *MEMORY[0x1E4F5B848];
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v19[3] = v7;
  void v18[4] = *MEMORY[0x1E4F5BB58];
  v13[0] = v0;
  v13[1] = v1;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v19[4] = v8;
  v18[5] = @"00000260-0000-1000-8000-0026BB765291";
  uint64_t v12 = *MEMORY[0x1E4F5B7D8];
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  void v19[5] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];
  id v11 = (void *)_supportedSecureServices_supportedSecureServices;
  _supportedSecureServices_supportedSecureServices = v10;
}

+ (id)notificationCategories
{
  v31[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  if (_os_feature_enabled_impl())
  {
    uint64_t v3 = [MEMORY[0x1E4F445E8] iconWithSystemImageName:@"checkmark.circle"];
    id v4 = [MEMORY[0x1E4F445E8] iconWithSystemImageName:@"xmark.circle"];
    uint64_t v5 = [MEMORY[0x1E4F445E8] iconWithSystemImageName:@"apple.bubble.middle.bottom"];
  }
  else
  {
    uint64_t v5 = 0;
    id v4 = 0;
    uint64_t v3 = 0;
  }
  id v26 = (void *)v5;
  objc_super v29 = (void *)v3;
  id v6 = (void *)MEMORY[0x1E4F445D8];
  id v7 = HMDLocalizedStringForKey(@"CONFIRM_EXECUTE_SECURE_TRIGGER_ACTION_YES");
  id v28 = [v6 actionWithIdentifier:@"trigger_execute" title:v7 options:0 icon:v3];

  uint64_t v8 = (void *)MEMORY[0x1E4F445D8];
  id v9 = HMDLocalizedStringForKey(@"CONFIRM_EXECUTE_SECURE_TRIGGER_ACTION_NO");
  uint64_t v27 = [v8 actionWithIdentifier:@"trigger_doNotExecute" title:v9 options:0 icon:v4];

  uint64_t v10 = (void *)MEMORY[0x1E4F44600];
  v31[0] = v28;
  v31[1] = v27;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  uint64_t v12 = MEMORY[0x1E4F1CBF0];
  uint64_t v13 = [v10 categoryWithIdentifier:@"HMDBBSecureTrigger" actions:v11 intentIdentifiers:MEMORY[0x1E4F1CBF0] options:0x20000000];

  [v2 addObject:v13];
  uint64_t v14 = [MEMORY[0x1E4F44600] categoryWithIdentifier:@"HMDBBNormalType" actions:v12 intentIdentifiers:v12 options:0x20000000];
  [v2 addObject:v14];
  uint64_t v15 = (void *)MEMORY[0x1E4F445D8];
  uint64_t v16 = HMDLocalizedStringForKey(@"CAMERA_PROVIDE_RECORDING_FEEDBACK");
  uint64_t v17 = [v15 actionWithIdentifier:@"provide_cameraRecordingFeedback" title:v16 options:0 icon:v5];

  uint64_t v18 = (void *)MEMORY[0x1E4F44600];
  id v30 = v17;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  uint64_t v20 = [v18 categoryWithIdentifier:@"HMDBulletinCategoryProvideCameraRecordingFeedback" actions:v19 intentIdentifiers:v12 options:0x20000000];

  [v2 addObject:v20];
  id v21 = [MEMORY[0x1E4F44600] categoryWithIdentifier:@"HomeAppBulletinCategory" actions:v12 intentIdentifiers:v12 options:536870913];
  [v2 addObject:v21];
  long long v22 = [MEMORY[0x1E4F44600] categoryWithIdentifier:@"HomeAppBulletinAudioNotificationCategory" actions:v12 intentIdentifiers:v12 options:536870913];
  [v2 addObject:v22];
  long long v23 = [MEMORY[0x1E4F44600] categoryWithIdentifier:@"HMDBulletinCategorySuppressNotificationOnWatch" actions:v12 intentIdentifiers:v12 options:0x20000000];
  [v2 addObject:v23];
  long long v24 = (void *)[v2 copy];

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sharedBulletinBoard
{
  if (sharedBulletinBoard_onceToken != -1) {
    dispatch_once(&sharedBulletinBoard_onceToken, &__block_literal_global_27316);
  }
  uint64_t v2 = (void *)sharedBulletinBoard__bulletinBoard;
  return v2;
}

void __39__HMDBulletinBoard_sharedBulletinBoard__block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (+[HMDDeviceCapabilities supportsUserNotifications])
  {
    uint64_t v0 = +[HMDPersistentStore unarchiveBulletinBoard];
    uint64_t v1 = (void *)sharedBulletinBoard__bulletinBoard;
    sharedBulletinBoard__bulletinBoard = v0;

    if (!sharedBulletinBoard__bulletinBoard)
    {
      uint64_t v2 = (void *)MEMORY[0x1D9452090]();
      uint64_t v3 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        id v4 = HMFGetLogIdentifier();
        int v7 = 138543362;
        uint64_t v8 = v4;
        _os_log_impl(&dword_1D49D5000, v3, OS_LOG_TYPE_INFO, "%{public}@Failed to unarchive HMDBulletinBoard", (uint8_t *)&v7, 0xCu);
      }
      uint64_t v5 = objc_alloc_init(HMDBulletinBoard);
      id v6 = (void *)sharedBulletinBoard__bulletinBoard;
      sharedBulletinBoard__bulletinBoard = (uint64_t)v5;
    }
  }
}

@end