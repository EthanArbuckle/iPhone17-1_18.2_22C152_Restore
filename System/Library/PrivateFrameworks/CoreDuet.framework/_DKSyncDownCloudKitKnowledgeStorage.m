@interface _DKSyncDownCloudKitKnowledgeStorage
+ (id)sharedInstance;
- (BOOL)hasAdditionsFlagForPeer:(id)a3;
- (BOOL)hasDeletionsFlagForPeer:(id)a3;
- (BOOL)isAvailable;
- (_DKSyncCloudKitKnowledgeStorage)common;
- (_DKSyncDownCloudKitKnowledgeStorage)init;
- (_DKSyncRemoteKnowledgeStorageFetchDelegate)delegate;
- (id)name;
- (int64_t)transportType;
- (void)cancelOutstandingOperations;
- (void)clearPrewarmedFlag;
- (void)fetchAdditionsHighWaterMarkWithPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5;
- (void)fetchDeletedEventIDsFromPeer:(id)a3 sinceDate:(id)a4 streamNames:(id)a5 limit:(unint64_t)a6 highPriority:(BOOL)a7 completion:(id)a8;
- (void)fetchDeletionsHighWaterMarkWithPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5;
- (void)fetchEventsFromPeer:(id)a3 windows:(id)a4 streamNames:(id)a5 limit:(unint64_t)a6 fetchOrder:(int64_t)a7 highPriority:(BOOL)a8 completion:(id)a9;
- (void)fetchSourceDeviceIDFromPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5;
- (void)prewarmFetchWithCompletion:(id)a3;
- (void)setAvailable:(BOOL)a3;
- (void)setCommon:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFetchDelegate:(id)a3;
- (void)setHasAdditionsFlag:(BOOL)a3 forPeer:(id)a4;
- (void)setHasDeletionsFlag:(BOOL)a3 forPeer:(id)a4;
- (void)start;
- (void)updateStorageWithAddedEvents:(id)a3 deletedEventIDs:(id)a4 highPriority:(BOOL)a5 completion:(id)a6;
@end

@implementation _DKSyncDownCloudKitKnowledgeStorage

+ (id)sharedInstance
{
  if (sharedInstance_initialized_414 != -1) {
    dispatch_once(&sharedInstance_initialized_414, &__block_literal_global_417);
  }
  v2 = (void *)sharedInstance_sharedInstance_415;
  return v2;
}

- (_DKSyncDownCloudKitKnowledgeStorage)init
{
  v3.receiver = self;
  v3.super_class = (Class)_DKSyncDownCloudKitKnowledgeStorage;
  return [(_DKSyncDownCloudKitKnowledgeStorage *)&v3 init];
}

- (BOOL)isAvailable
{
  common = self->_common;
  return common && common->_available;
}

- (void)setAvailable:(BOOL)a3
{
  common = self->_common;
  if (common) {
    common->_available = a3;
  }
}

- (void)start
{
  +[_DKSyncCloudKitKnowledgeStorage sharedInstance]();
  objc_super v3 = (_DKSyncCloudKitKnowledgeStorage *)objc_claimAutoreleasedReturnValue();
  common = self->_common;
  self->_common = v3;

  v6 = self->_common;
  if (v6)
  {
    objc_setProperty_atomic(v6, v5, self->_delegate, 160);
    v6 = self->_common;
  }
  [(_DKSyncCloudKitKnowledgeStorage *)v6 start];
}

- (void)cancelOutstandingOperations
{
  common = self->_common;
  if (common)
  {
    objc_setProperty_atomic(common, a2, self->_delegate, 160);
    common = self->_common;
  }
  [(_DKSyncCloudKitKnowledgeStorage *)common cancelOutstandingOperations];
}

- (void)prewarmFetchWithCompletion:(id)a3
{
  id v6 = a3;
  common = self->_common;
  if (common)
  {
    objc_setProperty_atomic(common, v4, self->_delegate, 160);
    common = self->_common;
  }
  [(_DKSyncCloudKitKnowledgeStorage *)common prewarmFetchWithCompletion:v6];
}

- (BOOL)hasAdditionsFlagForPeer:(id)a3
{
  return [(_DKSyncCloudKitKnowledgeStorage *)self->_common hasAdditionsFlagForPeer:a3];
}

- (void)setHasAdditionsFlag:(BOOL)a3 forPeer:(id)a4
{
}

- (BOOL)hasDeletionsFlagForPeer:(id)a3
{
  return [(_DKSyncCloudKitKnowledgeStorage *)self->_common hasDeletionsFlagForPeer:a3];
}

- (void)setHasDeletionsFlag:(BOOL)a3 forPeer:(id)a4
{
}

- (void)clearPrewarmedFlag
{
}

- (void)fetchEventsFromPeer:(id)a3 windows:(id)a4 streamNames:(id)a5 limit:(unint64_t)a6 fetchOrder:(int64_t)a7 highPriority:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  id v20 = a3;
  id v15 = a4;
  id v16 = a5;
  id v18 = a9;
  common = self->_common;
  if (common)
  {
    objc_setProperty_atomic(common, v17, self->_delegate, 160);
    common = self->_common;
  }
  [(_DKSyncCloudKitKnowledgeStorage *)common fetchEventsFromPeer:v20 windows:v15 streamNames:v16 limit:a6 fetchOrder:a7 highPriority:v9 completion:v18];
}

- (void)fetchAdditionsHighWaterMarkWithPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v9 = a5;
  common = self->_common;
  if (common)
  {
    objc_setProperty_atomic(common, v8, self->_delegate, 160);
    common = self->_common;
  }
  [(_DKSyncCloudKitKnowledgeStorage *)common fetchAdditionsHighWaterMarkWithPeer:v11 highPriority:v6 completion:v9];
}

- (void)fetchDeletedEventIDsFromPeer:(id)a3 sinceDate:(id)a4 streamNames:(id)a5 limit:(unint64_t)a6 highPriority:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v19 = a3;
  id v14 = a4;
  id v15 = a5;
  id v17 = a8;
  common = self->_common;
  if (common)
  {
    objc_setProperty_atomic(common, v16, self->_delegate, 160);
    common = self->_common;
  }
  [(_DKSyncCloudKitKnowledgeStorage *)common fetchDeletedEventIDsFromPeer:v19 sinceDate:v14 streamNames:v15 limit:a6 highPriority:v9 completion:v17];
}

- (void)fetchDeletionsHighWaterMarkWithPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v9 = a5;
  common = self->_common;
  if (common)
  {
    objc_setProperty_atomic(common, v8, self->_delegate, 160);
    common = self->_common;
  }
  [(_DKSyncCloudKitKnowledgeStorage *)common fetchDeletionsHighWaterMarkWithPeer:v11 highPriority:v6 completion:v9];
}

- (void)fetchSourceDeviceIDFromPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v9 = a5;
  common = self->_common;
  if (common)
  {
    objc_setProperty_atomic(common, v8, self->_delegate, 160);
    common = self->_common;
  }
  [(_DKSyncCloudKitKnowledgeStorage *)common fetchSourceDeviceIDFromPeer:v11 highPriority:v6 completion:v9];
}

- (void)setFetchDelegate:(id)a3
{
}

- (void)updateStorageWithAddedEvents:(id)a3 deletedEventIDs:(id)a4 highPriority:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v14 = a3;
  id v10 = a4;
  id v12 = a6;
  common = self->_common;
  if (common)
  {
    objc_setProperty_atomic(common, v11, self->_delegate, 160);
    common = self->_common;
  }
  [(_DKSyncCloudKitKnowledgeStorage *)common updateStorageWithAddedEvents:v14 deletedEventIDs:v10 highPriority:v7 completion:v12];
}

- (id)name
{
  return @"Cloud(Down)";
}

- (int64_t)transportType
{
  return 4;
}

- (_DKSyncCloudKitKnowledgeStorage)common
{
  return (_DKSyncCloudKitKnowledgeStorage *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCommon:(id)a3
{
}

- (_DKSyncRemoteKnowledgeStorageFetchDelegate)delegate
{
  return (_DKSyncRemoteKnowledgeStorageFetchDelegate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_common, 0);
}

@end