@interface PFCloudKitImporterZonePurgedWorkItem
- (PFCloudKitImporterZonePurgedWorkItem)initWithPurgedRecordZoneID:(id)a3 options:(id)a4 request:(id)a5;
- (id)description;
- (void)dealloc;
- (void)doWorkForStore:(id)a3 inMonitor:(id)a4 completion:(id)a5;
@end

@implementation PFCloudKitImporterZonePurgedWorkItem

- (PFCloudKitImporterZonePurgedWorkItem)initWithPurgedRecordZoneID:(id)a3 options:(id)a4 request:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)PFCloudKitImporterZonePurgedWorkItem;
  v6 = [(PFCloudKitImporterWorkItem *)&v8 initWithOptions:a4 request:a5];
  if (v6) {
    v6->_purgedRecordZoneID = (CKRecordZoneID *)a3;
  }
  return v6;
}

- (void)dealloc
{
  self->_purgedRecordZoneID = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitImporterZonePurgedWorkItem;
  [(PFCloudKitImporterWorkItem *)&v3 dealloc];
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self) {
    request = self->super._request;
  }
  else {
    request = 0;
  }
  v7 = (void *)[v3 initWithFormat:@"<%@: %p - %@>", v5, self, request];
  [v7 appendFormat:@" { %@ }", self->_purgedRecordZoneID];

  return v7;
}

- (void)doWorkForStore:(id)a3 inMonitor:(id)a4 completion:(id)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  uint64_t v31 = 0;
  id v9 = (id)[a3 mirroringDelegate];
  id v10 = objc_alloc(MEMORY[0x1E4F28EA0]);
  v35 = @"NSCloudKitMirroringDelegateResetSyncReasonKey";
  v36[0] = &unk_1ED7E2A70;
  v11 = objc_msgSend(v10, "initWithName:object:userInfo:", @"NSCloudKitMirroringDelegateWillResetSyncNotificationName", v9, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1));
  [v9 logResetSyncNotification:v11];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v11);

  if (self && (options = self->super._options) != 0 && (v13 = options->_options) != 0) {
    uint64_t metadataPurger = (uint64_t)v13->_metadataPurger;
  }
  else {
    uint64_t metadataPurger = 0;
  }
  purgedRecordZoneID = self->_purgedRecordZoneID;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&purgedRecordZoneID count:1];
  v16 = self->super._options;
  if (v16) {
    v17 = v16->_options;
  }
  else {
    v17 = 0;
  }
  if (-[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabaseWithScope:andTransactionAuthor:error:](metadataPurger, (uint64_t)a3, (uint64_t)a4, 9, v15, [(NSCloudKitMirroringDelegateOptions *)v17 databaseScope], @"NSCloudKitMirroringDelegate.reset", &v31))
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28EA0]);
    v32 = @"NSCloudKitMirroringDelegateResetSyncReasonKey";
    v33 = &unk_1ED7E2A70;
    v19 = objc_msgSend(v18, "initWithName:object:userInfo:", @"NSCloudKitMirroringDelegateDidResetSyncNotificationName", v9, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    [v9 logResetSyncNotification:v19];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v19);

    v20 = [NSCloudKitMirroringResult alloc];
    request = self->super._request;
    uint64_t v22 = [a3 identifier];
    v23 = v20;
    v24 = request;
    uint64_t v25 = 1;
    uint64_t v26 = 1;
    uint64_t v27 = 0;
  }
  else
  {
    v28 = [NSCloudKitMirroringResult alloc];
    v29 = self->super._request;
    uint64_t v22 = [a3 identifier];
    uint64_t v27 = v31;
    v23 = v28;
    v24 = v29;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
  }
  v30 = [(NSCloudKitMirroringResult *)v23 initWithRequest:v24 storeIdentifier:v22 success:v25 madeChanges:v26 error:v27];
  if (a5) {
    (*((void (**)(id, NSCloudKitMirroringResult *))a5 + 2))(a5, v30);
  }
}

@end