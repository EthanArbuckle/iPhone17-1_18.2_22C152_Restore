@interface CKUploadRequestManager
+ (BOOL)ignoreUploadRequestPushNotifications;
+ (id)activityIdentifierForSchedulingRepairsInContainer:(id)a3;
+ (void)setIgnoreUploadRequestPushNotifications:(BOOL)a3;
- (CKContainer)repairContainer;
- (CKSyncEngine)repairZoneSyncEngine;
- (CKUploadRequestManager)initWithContainer:(id)a3 repairContainerOverrides:(id)a4;
- (CKUploadRequestManager)initWithContainer:(id)a3 repairContainerOverrides:(id)a4 ignoringSystemConditions:(BOOL)a5;
- (CKUploadRequestManagerInternals)internals;
- (CKUploadRequestManagerResponseActionThrottler)responseActionThrottler;
- (CKUploadRequestPersistentStore)database;
- (NSString)activityIdentifierForSchedulingRepairs;
- (NSString)machServiceName;
- (double)assetRepairSchedulerDefaultSuspensionTime;
- (double)cancelledErrorRetryTime;
- (double)notificationDebouncePeriod;
- (double)recurringFetchPeriod;
- (double)retryableErrorMaxRetryCount;
- (double)retryableErrorRetryTime;
- (double)tryAgainLaterRetryTime;
- (id)assetRequestCallback;
- (id)packageRequestCallback;
- (int64_t)assetRepairSchedulerRepairBatchCountLimit;
- (int64_t)assetRepairSchedulerRepairRetryCount;
- (void)cancelAllOperations;
- (void)dealloc;
- (void)fetchServerChanges:(id)a3;
- (void)manuallyTriggerUploadRequests;
- (void)registerForItemRequests;
- (void)scheduleOrInvokeRepairsNow;
- (void)setAssetRepairSchedulerDefaultSuspensionTime:(double)a3;
- (void)setAssetRepairSchedulerRepairBatchCountLimit:(int64_t)a3;
- (void)setAssetRepairSchedulerRepairRetryCount:(int64_t)a3;
- (void)setAssetRequestCallback:(id)a3;
- (void)setCallback:(id)a3 forOverridePoint:(int64_t)a4;
- (void)setCancelledErrorRetryTime:(double)a3;
- (void)setMachServiceName:(id)a3;
- (void)setNotificationDebouncePeriod:(double)a3;
- (void)setPackageRequestCallback:(id)a3;
- (void)setRecurringFetchPeriod:(double)a3;
- (void)setRetryableErrorMaxRetryCount:(double)a3;
- (void)setRetryableErrorRetryTime:(double)a3;
- (void)setTryAgainLaterRetryTime:(double)a3;
- (void)unregister;
@end

@implementation CKUploadRequestManager

+ (BOOL)ignoreUploadRequestPushNotifications
{
  return byte_1E912FDE0;
}

+ (void)setIgnoreUploadRequestPushNotifications:(BOOL)a3
{
  byte_1E912FDE0 = a3;
}

- (double)recurringFetchPeriod
{
  v8 = objc_msgSend_internals(self, a2, v2, v3);
  if (v8)
  {
    v9 = objc_msgSend_internals(self, v5, v6, v7);
    objc_msgSend_recurringFetchPeriod(v9, v10, v11, v12);
    double v14 = v13;
  }
  else
  {
    double v14 = -1.0;
  }

  return v14;
}

- (double)tryAgainLaterRetryTime
{
  v8 = objc_msgSend_internals(self, a2, v2, v3);
  if (v8)
  {
    v9 = objc_msgSend_internals(self, v5, v6, v7);
    objc_msgSend_tryAgainLaterRetryTime(v9, v10, v11, v12);
    double v14 = v13;
  }
  else
  {
    double v14 = -1.0;
  }

  return v14;
}

- (double)retryableErrorRetryTime
{
  v8 = objc_msgSend_internals(self, a2, v2, v3);
  if (v8)
  {
    v9 = objc_msgSend_internals(self, v5, v6, v7);
    objc_msgSend_retryableErrorRetryTime(v9, v10, v11, v12);
    double v14 = v13;
  }
  else
  {
    double v14 = -1.0;
  }

  return v14;
}

- (double)cancelledErrorRetryTime
{
  v8 = objc_msgSend_internals(self, a2, v2, v3);
  if (v8)
  {
    v9 = objc_msgSend_internals(self, v5, v6, v7);
    objc_msgSend_cancelledErrorRetryTime(v9, v10, v11, v12);
    double v14 = v13;
  }
  else
  {
    double v14 = -1.0;
  }

  return v14;
}

- (double)retryableErrorMaxRetryCount
{
  v8 = objc_msgSend_internals(self, a2, v2, v3);
  if (v8)
  {
    v9 = objc_msgSend_internals(self, v5, v6, v7);
    objc_msgSend_retryableErrorMaxRetryCount(v9, v10, v11, v12);
    double v14 = v13;
  }
  else
  {
    double v14 = -1.0;
  }

  return v14;
}

- (double)notificationDebouncePeriod
{
  v8 = objc_msgSend_internals(self, a2, v2, v3);
  if (v8)
  {
    v9 = objc_msgSend_internals(self, v5, v6, v7);
    objc_msgSend_notificationDebouncePeriod(v9, v10, v11, v12);
    double v14 = v13;
  }
  else
  {
    double v14 = -1.0;
  }

  return v14;
}

- (int64_t)assetRepairSchedulerRepairBatchCountLimit
{
  internals = self->_internals;
  if (internals) {
    return objc_msgSend_assetRepairSchedulerRepairBatchCountLimit(internals, a2, v2, v3);
  }
  else {
    return -1;
  }
}

- (double)assetRepairSchedulerDefaultSuspensionTime
{
  v8 = objc_msgSend_internals(self, a2, v2, v3);
  if (v8)
  {
    v9 = objc_msgSend_internals(self, v5, v6, v7);
    objc_msgSend_assetRepairSchedulerDefaultSuspensionTime(v9, v10, v11, v12);
    double v14 = v13;
  }
  else
  {
    double v14 = -1.0;
  }

  return v14;
}

- (int64_t)assetRepairSchedulerRepairRetryCount
{
  v8 = objc_msgSend_internals(self, a2, v2, v3);
  if (v8)
  {
    v9 = objc_msgSend_internals(self, v5, v6, v7);
    int64_t v13 = objc_msgSend_assetRepairSchedulerRepairRetryCount(v9, v10, v11, v12);
  }
  else
  {
    int64_t v13 = -1;
  }

  return v13;
}

- (void)setRecurringFetchPeriod:(double)a3
{
  objc_msgSend_internals(self, a2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecurringFetchPeriod_(v9, v6, v7, v8, a3);
}

- (void)setTryAgainLaterRetryTime:(double)a3
{
  objc_msgSend_internals(self, a2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTryAgainLaterRetryTime_(v9, v6, v7, v8, a3);
}

- (void)setRetryableErrorRetryTime:(double)a3
{
  objc_msgSend_internals(self, a2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRetryableErrorRetryTime_(v9, v6, v7, v8, a3);
}

- (void)setCancelledErrorRetryTime:(double)a3
{
  objc_msgSend_internals(self, a2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCancelledErrorRetryTime_(v9, v6, v7, v8, a3);
}

- (void)setRetryableErrorMaxRetryCount:(double)a3
{
  objc_msgSend_internals(self, a2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRetryableErrorMaxRetryCount_(v9, v6, v7, v8, a3);
}

- (void)setNotificationDebouncePeriod:(double)a3
{
  objc_msgSend_internals(self, a2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNotificationDebouncePeriod_(v9, v6, v7, v8, a3);
}

- (void)setAssetRepairSchedulerRepairBatchCountLimit:(int64_t)a3
{
}

- (void)setAssetRepairSchedulerDefaultSuspensionTime:(double)a3
{
  objc_msgSend_internals(self, a2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssetRepairSchedulerDefaultSuspensionTime_(v9, v6, v7, v8, a3);
}

- (void)setAssetRepairSchedulerRepairRetryCount:(int64_t)a3
{
  objc_msgSend_internals(self, a2, a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssetRepairSchedulerRepairRetryCount_(v7, v5, a3, v6);
}

+ (id)activityIdentifierForSchedulingRepairsInContainer:(id)a3
{
  uint64_t v4 = objc_msgSend_containerID(a3, a2, (uint64_t)a3, v3);
  v5 = NSString;
  id v9 = objc_msgSend_containerIdentifier(v4, v6, v7, v8);
  uint64_t v13 = objc_msgSend_environment(v4, v10, v11, v12);
  double v14 = CKContainerEnvironmentString(v13);
  v17 = objc_msgSend_stringWithFormat_(v5, v15, @"%@.%@.%@", v16, @"com.apple.cloudkit.uploadrequest.repair", v9, v14);

  return v17;
}

- (void)dealloc
{
  objc_msgSend_setAssetRequestCallback_(self->_internals, a2, 0, v2);
  objc_msgSend_setPackageRequestCallback_(self->_internals, v4, 0, v5);
  objc_msgSend_dispatchEvent_synchronously_(self->_internals, v6, 1, 1);
  v7.receiver = self;
  v7.super_class = (Class)CKUploadRequestManager;
  [(CKUploadRequestManager *)&v7 dealloc];
}

- (CKUploadRequestManager)initWithContainer:(id)a3 repairContainerOverrides:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKUploadRequestManager;
  uint64_t v8 = [(CKUploadRequestManager *)&v14 init];
  if (v8)
  {
    id v9 = [CKUploadRequestManagerInternals alloc];
    uint64_t v11 = objc_msgSend_initWithContainer_repairContainerOverrides_(v9, v10, (uint64_t)v6, (uint64_t)v7);
    internals = v8->_internals;
    v8->_internals = (CKUploadRequestManagerInternals *)v11;
  }
  return v8;
}

- (CKUploadRequestManager)initWithContainer:(id)a3 repairContainerOverrides:(id)a4 ignoringSystemConditions:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKUploadRequestManager;
  v10 = [(CKUploadRequestManager *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [CKUploadRequestManagerInternals alloc];
    uint64_t v13 = objc_msgSend_initWithContainer_repairContainerOverrides_ignoringSystemConditions_(v11, v12, (uint64_t)v8, (uint64_t)v9, v5);
    internals = v10->_internals;
    v10->_internals = (CKUploadRequestManagerInternals *)v13;
  }
  return v10;
}

- (id)assetRequestCallback
{
  uint64_t v4 = objc_msgSend_internals(self, a2, v2, v3);
  id v8 = objc_msgSend_assetRequestCallback(v4, v5, v6, v7);

  return v8;
}

- (void)setAssetRequestCallback:(id)a3
{
  id v4 = a3;
  objc_msgSend_internals(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssetRequestCallback_(v10, v8, (uint64_t)v4, v9);
}

- (id)packageRequestCallback
{
  id v4 = objc_msgSend_internals(self, a2, v2, v3);
  id v8 = objc_msgSend_packageRequestCallback(v4, v5, v6, v7);

  return v8;
}

- (void)setPackageRequestCallback:(id)a3
{
  id v4 = a3;
  objc_msgSend_internals(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPackageRequestCallback_(v10, v8, (uint64_t)v4, v9);
}

- (NSString)machServiceName
{
  id v4 = objc_msgSend_internals(self, a2, v2, v3);
  id v8 = objc_msgSend_machServiceName(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (void)setMachServiceName:(id)a3
{
  id v4 = a3;
  objc_msgSend_internals(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMachServiceName_(v10, v8, (uint64_t)v4, v9);
}

- (NSString)activityIdentifierForSchedulingRepairs
{
  id v4 = objc_msgSend_internals(self, a2, v2, v3);
  id v8 = objc_msgSend_activityIdentifierForSchedulingRepairs(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (CKSyncEngine)repairZoneSyncEngine
{
  id v4 = objc_msgSend_internals(self, a2, v2, v3);
  id v8 = objc_msgSend_repairZoneSyncEngine(v4, v5, v6, v7);

  return (CKSyncEngine *)v8;
}

- (CKContainer)repairContainer
{
  id v4 = objc_msgSend_internals(self, a2, v2, v3);
  id v8 = objc_msgSend_repairContainer(v4, v5, v6, v7);

  return (CKContainer *)v8;
}

- (CKUploadRequestPersistentStore)database
{
  id v4 = objc_msgSend_internals(self, a2, v2, v3);
  id v8 = objc_msgSend_database(v4, v5, v6, v7);

  return (CKUploadRequestPersistentStore *)v8;
}

- (void)registerForItemRequests
{
  uint64_t v3 = _os_activity_create(&dword_18AF10000, "client/data-repair-register", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v3, &v9);
  uint64_t v7 = objc_msgSend_internals(self, v4, v5, v6);
  objc_msgSend_dispatchEvent_synchronously_(v7, v8, 0, 0);

  os_activity_scope_leave(&v9);
}

- (void)unregister
{
  uint64_t v3 = _os_activity_create(&dword_18AF10000, "client/data-repair-unregister", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v3, &v9);
  uint64_t v7 = objc_msgSend_internals(self, v4, v5, v6);
  objc_msgSend_dispatchEvent_synchronously_(v7, v8, 2, 1);

  os_activity_scope_leave(&v9);
}

- (void)manuallyTriggerUploadRequests
{
  uint64_t v3 = _os_activity_create(&dword_18AF10000, "client/data-repair-manually-trigger", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v3, &v11);
  uint64_t v7 = objc_msgSend_internals(self, v4, v5, v6);
  objc_msgSend_manuallyTriggerUploadRequests(v7, v8, v9, v10);

  os_activity_scope_leave(&v11);
}

- (void)fetchServerChanges:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_18AF10000, "client/data-repair-fetch-changes", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v5, &v12);
  uint64_t v9 = objc_msgSend_internals(self, v6, v7, v8);
  objc_msgSend_fetchServerChanges_(v9, v10, (uint64_t)v4, v11);

  os_activity_scope_leave(&v12);
}

- (void)scheduleOrInvokeRepairsNow
{
  objc_msgSend_internals(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scheduleOrInvokeRepairsNow(v7, v4, v5, v6);
}

- (void)cancelAllOperations
{
  uint64_t v3 = _os_activity_create(&dword_18AF10000, "client/data-repair-cancel", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v3, &v9);
  id v7 = objc_msgSend_internals(self, v4, v5, v6);
  objc_msgSend_dispatchEvent_synchronously_(v7, v8, 3, 0);

  os_activity_scope_leave(&v9);
}

- (void)setCallback:(id)a3 forOverridePoint:(int64_t)a4
{
  id v6 = a3;
  objc_msgSend_internals(self, v7, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCallback_forOverridePoint_(v11, v10, (uint64_t)v6, a4);
}

- (CKUploadRequestManagerResponseActionThrottler)responseActionThrottler
{
  id v4 = objc_msgSend_internals(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_responseActionThrottler(v4, v5, v6, v7);

  return (CKUploadRequestManagerResponseActionThrottler *)v8;
}

- (CKUploadRequestManagerInternals)internals
{
  return self->_internals;
}

- (void).cxx_destruct
{
}

@end