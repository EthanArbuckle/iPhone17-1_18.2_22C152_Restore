@interface CKDatabase
+ (void)initialize;
- (CKContainer)container;
- (CKDatabase)init;
- (CKDatabaseImplementation)implementation;
- (CKDatabaseScope)databaseScope;
- (NSOperationQueue)operationQueue;
- (id)CKPropertiesDescription;
- (id)_initWithContainer:(id)a3 scope:(int64_t)a4;
- (id)description;
- (id)initInternalWithImplementation:(id)a3 container:(id)a4;
- (int64_t)scope;
- (void)addOperation:(CKDatabaseOperation *)operation;
- (void)checkSupportedDeviceCapabilities:(id)a3 inZone:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)clearRecordCache;
- (void)deleteRecordWithID:(CKRecordID *)recordID completionHandler:(void *)completionHandler;
- (void)deleteRecordZoneWithID:(CKRecordZoneID *)zoneID completionHandler:(void *)completionHandler;
- (void)deleteSubscriptionWithID:(CKSubscriptionID)subscriptionID completionHandler:(void *)completionHandler;
- (void)fetchAllRecordZonesWithCompletionHandler:(void *)completionHandler;
- (void)fetchAllSubscriptionsWithCompletionHandler:(void *)completionHandler;
- (void)fetchRecordWithID:(CKRecordID *)recordID completionHandler:(void *)completionHandler;
- (void)fetchRecordZoneWithID:(CKRecordZoneID *)zoneID completionHandler:(void *)completionHandler;
- (void)fetchSubscriptionWithID:(CKSubscriptionID)subscriptionID completionHandler:(void *)completionHandler;
- (void)performQuery:(CKQuery *)query inZoneWithID:(CKRecordZoneID *)zoneID completionHandler:(void *)completionHandler;
- (void)saveRecord:(CKRecord *)record completionHandler:(void *)completionHandler;
- (void)saveRecordZone:(CKRecordZone *)zone completionHandler:(void *)completionHandler;
- (void)saveSubscription:(CKSubscription *)subscription completionHandler:(void *)completionHandler;
@end

@implementation CKDatabase

- (CKContainer)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);

  return (CKContainer *)WeakRetained;
}

- (id)initInternalWithImplementation:(id)a3 container:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKDatabase;
  v9 = [(CKDatabase *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_implementation, a3);
    objc_storeWeak(p_isa + 1, v8);
  }

  return p_isa;
}

- (CKDatabaseImplementation)implementation
{
  return self->_implementation;
}

- (CKDatabaseScope)databaseScope
{
  v4 = objc_msgSend_implementation(self, a2, v2, v3);
  CKDatabaseScope v8 = objc_msgSend_databaseScope(v4, v5, v6, v7);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implementation, 0);

  objc_destroyWeak((id *)&self->_container);
}

+ (void)initialize
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (CKDatabase)init
{
  uint64_t v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, (uint64_t)self, @"CKDatabase.m", 477, @"Use +[CKContainer privateCloudDatabase] or +[CKContainer publicCloudDatabase] instead of creating your own");

  return 0;
}

- (id)_initWithContainer:(id)a3 scope:(int64_t)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKDatabase;
  uint64_t v7 = [(CKDatabase *)&v17 init];
  if (v7)
  {
    CKDatabaseScope v8 = [CKDatabaseImplementation alloc];
    objc_super v12 = objc_msgSend_implementation(v6, v9, v10, v11);
    uint64_t inited = objc_msgSend_initInternalWithContainerImplementation_scope_(v8, v13, (uint64_t)v12, a4);
    implementation = v7->_implementation;
    v7->_implementation = (CKDatabaseImplementation *)inited;

    objc_storeWeak((id *)&v7->_container, v6);
  }

  return v7;
}

- (id)CKPropertiesDescription
{
  v4 = objc_msgSend_implementation(self, a2, v2, v3);
  CKDatabaseScope v8 = objc_msgSend_CKPropertiesDescription(v4, v5, v6, v7);

  return v8;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDatabase *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (int64_t)scope
{
  v4 = objc_msgSend_implementation(self, a2, v2, v3);
  int64_t v8 = objc_msgSend_scope(v4, v5, v6, v7);

  return v8;
}

- (NSOperationQueue)operationQueue
{
  v4 = objc_msgSend_implementation(self, a2, v2, v3);
  int64_t v8 = objc_msgSend_operationQueue(v4, v5, v6, v7);

  return (NSOperationQueue *)v8;
}

- (void)addOperation:(CKDatabaseOperation *)operation
{
  v4 = operation;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_container(self, v8, v9, v10);
  v15 = objc_msgSend_convenienceConfiguration(v11, v12, v13, v14);
  objc_msgSend_addOperation_wrappingDatabase_convenienceConfiguration_(v17, v16, (uint64_t)v4, (uint64_t)self, v15);
}

- (void)fetchRecordWithID:(CKRecordID *)recordID completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  uint64_t v7 = recordID;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_container(self, v11, v12, v13);
  v18 = objc_msgSend_convenienceConfiguration(v14, v15, v16, v17);
  objc_msgSend_fetchRecordWithID_wrappingDatabase_convenienceConfiguration_completionHandler_(v20, v19, (uint64_t)v7, (uint64_t)self, v18, v6);
}

- (void)saveRecord:(CKRecord *)record completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  uint64_t v7 = record;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_container(self, v11, v12, v13);
  v18 = objc_msgSend_convenienceConfiguration(v14, v15, v16, v17);
  objc_msgSend_saveRecord_wrappingDatabase_convenienceConfiguration_completionHandler_(v20, v19, (uint64_t)v7, (uint64_t)self, v18, v6);
}

- (void)deleteRecordWithID:(CKRecordID *)recordID completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  uint64_t v7 = recordID;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_container(self, v11, v12, v13);
  v18 = objc_msgSend_convenienceConfiguration(v14, v15, v16, v17);
  objc_msgSend_deleteRecordWithID_wrappingDatabase_convenienceConfiguration_completionHandler_(v20, v19, (uint64_t)v7, (uint64_t)self, v18, v6);
}

- (void)performQuery:(CKQuery *)query inZoneWithID:(CKRecordZoneID *)zoneID completionHandler:(void *)completionHandler
{
  int64_t v8 = completionHandler;
  uint64_t v9 = zoneID;
  uint64_t v10 = query;
  objc_msgSend_implementation(self, v11, v12, v13);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = objc_msgSend_container(self, v14, v15, v16);
  v21 = objc_msgSend_convenienceConfiguration(v17, v18, v19, v20);
  objc_msgSend_performQuery_inZoneWithID_wrappingDatabase_convenienceConfiguration_completionHandler_(v23, v22, (uint64_t)v10, (uint64_t)v9, self, v21, v8);
}

- (void)fetchAllRecordZonesWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_container(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend_convenienceConfiguration(v11, v12, v13, v14);
  objc_msgSend_fetchAllRecordZonesWithWrappingDatabase_convenienceConfiguration_completionHandler_(v17, v16, (uint64_t)self, (uint64_t)v15, v4);
}

- (void)fetchRecordZoneWithID:(CKRecordZoneID *)zoneID completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  uint64_t v7 = zoneID;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_container(self, v11, v12, v13);
  v18 = objc_msgSend_convenienceConfiguration(v14, v15, v16, v17);
  objc_msgSend_fetchRecordZoneWithID_wrappingDatabase_convenienceConfiguration_completionHandler_(v20, v19, (uint64_t)v7, (uint64_t)self, v18, v6);
}

- (void)saveRecordZone:(CKRecordZone *)zone completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  uint64_t v7 = zone;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_container(self, v11, v12, v13);
  v18 = objc_msgSend_convenienceConfiguration(v14, v15, v16, v17);
  objc_msgSend_saveRecordZone_wrappingDatabase_convenienceConfiguration_completionHandler_(v20, v19, (uint64_t)v7, (uint64_t)self, v18, v6);
}

- (void)deleteRecordZoneWithID:(CKRecordZoneID *)zoneID completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  uint64_t v7 = zoneID;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_container(self, v11, v12, v13);
  v18 = objc_msgSend_convenienceConfiguration(v14, v15, v16, v17);
  objc_msgSend_deleteRecordZoneWithID_wrappingDatabase_convenienceConfiguration_completionHandler_(v20, v19, (uint64_t)v7, (uint64_t)self, v18, v6);
}

- (void)checkSupportedDeviceCapabilities:(id)a3 inZone:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  objc_msgSend_implementation(self, v14, v15, v16);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = objc_msgSend_container(self, v17, v18, v19);
  v24 = objc_msgSend_convenienceConfiguration(v20, v21, v22, v23);
  objc_msgSend_checkSupportedDeviceCapabilitiesInZone_desiredCapabilities_options_wrappingDatabase_convenienceConfiguration_completionHandler_(v26, v25, (uint64_t)v12, (uint64_t)v13, v11, self, v24, v10);
}

- (void)saveSubscription:(CKSubscription *)subscription completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  uint64_t v7 = subscription;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_container(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_convenienceConfiguration(v14, v15, v16, v17);
  objc_msgSend_saveSubscription_wrappingDatabase_convenienceConfiguration_completionHandler_(v20, v19, (uint64_t)v7, (uint64_t)self, v18, v6);
}

- (void)deleteSubscriptionWithID:(CKSubscriptionID)subscriptionID completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  uint64_t v7 = subscriptionID;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_container(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_convenienceConfiguration(v14, v15, v16, v17);
  objc_msgSend_deleteSubscriptionWithID_wrappingDatabase_convenienceConfiguration_completionHandler_(v20, v19, (uint64_t)v7, (uint64_t)self, v18, v6);
}

- (void)fetchSubscriptionWithID:(CKSubscriptionID)subscriptionID completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  uint64_t v7 = subscriptionID;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_container(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_convenienceConfiguration(v14, v15, v16, v17);
  objc_msgSend_fetchSubscriptionWithID_wrappingDatabase_convenienceConfiguration_completionHandler_(v20, v19, (uint64_t)v7, (uint64_t)self, v18, v6);
}

- (void)fetchAllSubscriptionsWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = objc_msgSend_container(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend_convenienceConfiguration(v11, v12, v13, v14);
  objc_msgSend_fetchAllSubscriptionsWithWrappingDatabase_convenienceConfiguration_completionHandler_(v17, v16, (uint64_t)self, (uint64_t)v15, v4);
}

- (void)clearRecordCache
{
  objc_msgSend_implementation(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearRecordCache(v7, v4, v5, v6);
}

@end