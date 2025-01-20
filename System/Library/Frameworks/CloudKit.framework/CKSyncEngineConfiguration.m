@interface CKSyncEngineConfiguration
- (BOOL)allowFetchAndModifyConcurrently;
- (BOOL)automaticSyncingEnabled;
- (BOOL)automaticallySync;
- (BOOL)continueSendingChangesAfterFailure;
- (BOOL)isImmediatePushSyncEnabled;
- (BOOL)useOpportunisticPushTopic;
- (BOOL)useUniqueActivityIdentifiers;
- (CKAssetDownloadStagingManager)assetDownloadStagingManager;
- (CKDatabase)database;
- (CKSubscriptionID)subscriptionID;
- (CKSyncEngineAsyncDelegate)asyncDelegate;
- (CKSyncEngineConfiguration)init;
- (CKSyncEngineConfiguration)initWithDatabase:(CKDatabase *)database stateSerialization:(CKSyncEngineStateSerialization *)stateSerialization delegate:(id)delegate;
- (CKSyncEngineConfiguration)initWithDatabase:(id)a3 dataSource:(id)a4 metadata:(id)a5;
- (CKSyncEngineConfiguration)initWithDatabase:(id)a3 stateSerialization:(id)a4;
- (CKSyncEngineConfiguration)initWithDatabase:(id)a3 stateSerialization:(id)a4 asyncDelegate:(id)a5;
- (CKSyncEngineDataSource)dataSource;
- (CKSyncEngineStateSerialization)stateSerialization;
- (NSData)metadata;
- (NSString)apsMachServiceName;
- (NSString)description;
- (OS_xpc_object)xpcActivityCriteriaOverrides;
- (id)delegate;
- (id)redactedDescription;
- (int64_t)priority;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)setAllowFetchAndModifyConcurrently:(BOOL)a3;
- (void)setApsMachServiceName:(id)a3;
- (void)setAssetDownloadStagingManager:(id)a3;
- (void)setAsyncDelegate:(id)a3;
- (void)setAutomaticSyncingEnabled:(BOOL)a3;
- (void)setAutomaticallySync:(BOOL)automaticallySync;
- (void)setContinueSendingChangesAfterFailure:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDatabase:(CKDatabase *)database;
- (void)setDelegate:(id)delegate;
- (void)setImmediatePushSyncEnabled:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setStateSerialization:(CKSyncEngineStateSerialization *)stateSerialization;
- (void)setSubscriptionID:(CKSubscriptionID)subscriptionID;
- (void)setUseOpportunisticPushTopic:(BOOL)a3;
- (void)setUseUniqueActivityIdentifiers:(BOOL)a3;
- (void)setXpcActivityCriteriaOverrides:(id)a3;
@end

@implementation CKSyncEngineConfiguration

- (CKSyncEngineConfiguration)init
{
  v2 = [CKException alloc];
  id v4 = (id)objc_msgSend_initWithName_format_(v2, v3, *MEMORY[0x1E4F1C3C8], @"%s is unavailable", "-[CKSyncEngineConfiguration init]");
  objc_exception_throw(v4);
}

- (CKSyncEngineConfiguration)initWithDatabase:(id)a3 stateSerialization:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v33 = 0;
  char v9 = _CKCheckArgument((uint64_t)"database", v7, 0, 0, 0, &v33);
  id v10 = v33;
  if ((v9 & 1) == 0)
  {
    v20 = v10;
    v21 = [CKException alloc];
    uint64_t v25 = objc_msgSend_code(v20, v22, v23, v24);
    v29 = objc_msgSend_localizedDescription(v20, v26, v27, v28);
    id v31 = (id)objc_msgSend_initWithCode_format_(v21, v30, v25, @"%@", v29);

    objc_exception_throw(v31);
  }

  v32.receiver = self;
  v32.super_class = (Class)CKSyncEngineConfiguration;
  v11 = [(CKSyncEngineConfiguration *)&v32 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_database, a3);
    uint64_t v16 = objc_msgSend_copy(v8, v13, v14, v15);
    stateSerialization = v12->_stateSerialization;
    v12->_stateSerialization = (CKSyncEngineStateSerialization *)v16;

    v12->_automaticallySync = 1;
    v12->_priority = 2;
    v12->_continueSendingChangesAfterFailure = 0;
    assetDownloadStagingManager = v12->_assetDownloadStagingManager;
    v12->_assetDownloadStagingManager = 0;

    v12->_useOpportunisticPushTopic = 0;
    v12->_immediatePushSyncEnabled = CKCurrentProcessIsDaemon() ^ 1;
  }

  return v12;
}

- (CKSyncEngineConfiguration)initWithDatabase:(id)a3 stateSerialization:(id)a4 asyncDelegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v29 = 0;
  char v11 = _CKCheckArgument((uint64_t)"asyncDelegate", v10, 0, 0, 0, &v29);
  id v12 = v29;
  if ((v11 & 1) == 0)
  {
    v17 = v12;
    v18 = [CKException alloc];
    uint64_t v22 = objc_msgSend_code(v17, v19, v20, v21);
    v26 = objc_msgSend_localizedDescription(v17, v23, v24, v25);
    id v28 = (id)objc_msgSend_initWithCode_format_(v18, v27, v22, @"%@", v26);

    objc_exception_throw(v28);
  }

  uint64_t v14 = objc_msgSend_initWithDatabase_stateSerialization_(self, v13, (uint64_t)v8, (uint64_t)v9);
  uint64_t v15 = (CKSyncEngineConfiguration *)v14;
  if (v14) {
    objc_storeWeak((id *)(v14 + 48), v10);
  }

  return v15;
}

- (CKSyncEngineConfiguration)initWithDatabase:(CKDatabase *)database stateSerialization:(CKSyncEngineStateSerialization *)stateSerialization delegate:(id)delegate
{
  id v8 = database;
  id v9 = stateSerialization;
  id v10 = delegate;
  id v29 = 0;
  char v11 = _CKCheckArgument((uint64_t)"delegate", v10, 0, 0, 0, &v29);
  id v12 = v29;
  if ((v11 & 1) == 0)
  {
    v17 = v12;
    v18 = [CKException alloc];
    uint64_t v22 = objc_msgSend_code(v17, v19, v20, v21);
    v26 = objc_msgSend_localizedDescription(v17, v23, v24, v25);
    id v28 = (id)objc_msgSend_initWithCode_format_(v18, v27, v22, @"%@", v26);

    objc_exception_throw(v28);
  }

  uint64_t v14 = objc_msgSend_initWithDatabase_stateSerialization_(self, v13, (uint64_t)v8, (uint64_t)v9);
  uint64_t v15 = (CKSyncEngineConfiguration *)v14;
  if (v14) {
    objc_storeWeak((id *)(v14 + 32), v10);
  }

  return v15;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v57 = a3;
  id v7 = objc_msgSend_database(self, v4, v5, v6);
  objc_msgSend_addProperty_value_shouldRedact_(v57, v8, @"database", (uint64_t)v7, 0);

  id v9 = NSNumber;
  uint64_t v13 = objc_msgSend_priority(self, v10, v11, v12);
  uint64_t v16 = objc_msgSend_numberWithInteger_(v9, v14, v13, v15);
  objc_msgSend_addProperty_value_shouldRedact_(v57, v17, @"priority", (uint64_t)v16, 0);

  uint64_t v21 = objc_msgSend_stateSerialization(self, v18, v19, v20);

  if (v21)
  {
    uint64_t v25 = objc_msgSend_stateSerialization(self, v22, v23, v24);
    objc_msgSend_addProperty_value_shouldRedact_(v57, v26, @"state", (uint64_t)v25, 0);
  }
  if ((objc_msgSend_automaticSyncingEnabled(self, v22, v23, v24) & 1) == 0) {
    objc_msgSend_addProperty_value_shouldRedact_(v57, v27, @"automaticSyncingEnabled", MEMORY[0x1E4F1CC28], 0);
  }
  v30 = objc_msgSend_xpcActivityCriteriaOverrides(self, v27, v28, v29);

  if (v30)
  {
    v34 = objc_msgSend_xpcActivityCriteriaOverrides(self, v31, v32, v33);
    objc_msgSend_addProperty_value_shouldRedact_(v57, v35, @"xpcActivityCriteriaOverrides", (uint64_t)v34, 0);
  }
  v36 = objc_msgSend_apsMachServiceName(self, v31, v32, v33);

  if (v36)
  {
    v40 = objc_msgSend_apsMachServiceName(self, v37, v38, v39);
    objc_msgSend_addProperty_value_shouldRedact_(v57, v41, @"apsMachServiceName", (uint64_t)v40, 0);
  }
  v42 = objc_msgSend_subscriptionID(self, v37, v38, v39);

  if (v42)
  {
    v46 = objc_msgSend_subscriptionID(self, v43, v44, v45);
    objc_msgSend_addProperty_value_shouldRedact_(v57, v47, @"subscriptionID", (uint64_t)v46, 0);
  }
  if (objc_msgSend_useOpportunisticPushTopic(self, v43, v44, v45))
  {
    v51 = NSNumber;
    uint64_t v52 = objc_msgSend_useOpportunisticPushTopic(self, v48, v49, v50);
    v55 = objc_msgSend_numberWithBool_(v51, v53, v52, v54);
    objc_msgSend_addProperty_value_shouldRedact_(v57, v56, @"useOpportunisticPushTopic", (uint64_t)v55, 0);
  }
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineConfiguration *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineConfiguration *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (BOOL)automaticSyncingEnabled
{
  return ((uint64_t (*)(CKSyncEngineConfiguration *, char *))MEMORY[0x1F4181798])(self, sel_automaticallySync);
}

- (void)setAutomaticSyncingEnabled:(BOOL)a3
{
}

- (CKSyncEngineConfiguration)initWithDatabase:(id)a3 dataSource:(id)a4 metadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v33 = 0;
  char v11 = _CKCheckArgument((uint64_t)"dataSource", v9, 0, 0, 0, &v33);
  id v12 = v33;
  if ((v11 & 1) == 0)
  {
    uint64_t v21 = v12;
    uint64_t v22 = [CKException alloc];
    uint64_t v26 = objc_msgSend_code(v21, v23, v24, v25);
    v30 = objc_msgSend_localizedDescription(v21, v27, v28, v29);
    id v32 = (id)objc_msgSend_initWithCode_format_(v22, v31, v26, @"%@", v30);

    objc_exception_throw(v32);
  }

  if (!v10)
  {
    uint64_t v19 = (CKSyncEngineConfiguration *)objc_msgSend_initWithDatabase_stateSerialization_(self, v13, (uint64_t)v8, 0);
    if (!v19) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v14 = [CKSyncEngineStateSerialization alloc];
  v17 = objc_msgSend_initWithData_(v14, v15, (uint64_t)v10, v16);
  uint64_t v19 = (CKSyncEngineConfiguration *)objc_msgSend_initWithDatabase_stateSerialization_(self, v18, (uint64_t)v8, (uint64_t)v17);

  if (v19) {
LABEL_4:
  }
    objc_storeWeak((id *)&v19->_dataSource, v9);
LABEL_5:

  return v19;
}

- (NSData)metadata
{
  id v4 = objc_msgSend_stateSerialization(self, a2, v2, v3);
  id v8 = objc_msgSend_data(v4, v5, v6, v7);

  return (NSData *)v8;
}

- (void)setMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [CKSyncEngineStateSerialization alloc];
  id v10 = (id)objc_msgSend_initWithData_(v5, v6, (uint64_t)v4, v7);

  objc_msgSend_setStateSerialization_(self, v8, (uint64_t)v10, v9);
}

- (CKDatabase)database
{
  return (CKDatabase *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDatabase:(CKDatabase *)database
{
}

- (CKSyncEngineStateSerialization)stateSerialization
{
  return (CKSyncEngineStateSerialization *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStateSerialization:(CKSyncEngineStateSerialization *)stateSerialization
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (BOOL)automaticallySync
{
  return self->_automaticallySync;
}

- (void)setAutomaticallySync:(BOOL)automaticallySync
{
  self->_automaticallySync = automaticallySync;
}

- (CKSubscriptionID)subscriptionID
{
  return (CKSubscriptionID)objc_getProperty(self, a2, 40, 1);
}

- (void)setSubscriptionID:(CKSubscriptionID)subscriptionID
{
}

- (BOOL)useUniqueActivityIdentifiers
{
  return self->_useUniqueActivityIdentifiers;
}

- (void)setUseUniqueActivityIdentifiers:(BOOL)a3
{
  self->_useUniqueActivityIdentifiers = a3;
}

- (BOOL)isImmediatePushSyncEnabled
{
  return self->_immediatePushSyncEnabled;
}

- (void)setImmediatePushSyncEnabled:(BOOL)a3
{
  self->_immediatePushSyncEnabled = a3;
}

- (CKSyncEngineAsyncDelegate)asyncDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_asyncDelegate);

  return (CKSyncEngineAsyncDelegate *)WeakRetained;
}

- (void)setAsyncDelegate:(id)a3
{
}

- (CKSyncEngineDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (CKSyncEngineDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (NSString)apsMachServiceName
{
  return self->_apsMachServiceName;
}

- (void)setApsMachServiceName:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (BOOL)continueSendingChangesAfterFailure
{
  return self->_continueSendingChangesAfterFailure;
}

- (void)setContinueSendingChangesAfterFailure:(BOOL)a3
{
  self->_continueSendingChangesAfterFailure = a3;
}

- (BOOL)allowFetchAndModifyConcurrently
{
  return self->_allowFetchAndModifyConcurrently;
}

- (void)setAllowFetchAndModifyConcurrently:(BOOL)a3
{
  self->_allowFetchAndModifyConcurrently = a3;
}

- (OS_xpc_object)xpcActivityCriteriaOverrides
{
  return self->_xpcActivityCriteriaOverrides;
}

- (void)setXpcActivityCriteriaOverrides:(id)a3
{
}

- (BOOL)useOpportunisticPushTopic
{
  return self->_useOpportunisticPushTopic;
}

- (void)setUseOpportunisticPushTopic:(BOOL)a3
{
  self->_useOpportunisticPushTopic = a3;
}

- (CKAssetDownloadStagingManager)assetDownloadStagingManager
{
  return (CKAssetDownloadStagingManager *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAssetDownloadStagingManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDownloadStagingManager, 0);
  objc_storeStrong((id *)&self->_xpcActivityCriteriaOverrides, 0);
  objc_storeStrong((id *)&self->_apsMachServiceName, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_asyncDelegate);
  objc_storeStrong((id *)&self->_subscriptionID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateSerialization, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

@end