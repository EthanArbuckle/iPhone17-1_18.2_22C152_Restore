@interface PFUbiquitySaveSnapshot
- (PFUbiquitySaveSnapshot)initWithSaveNotification:(id)a3 withLocalPeerID:(id)a4;
- (PFUbiquitySaveSnapshot)initWithTransactionLog:(id)a3;
- (id)description;
- (void)dealloc;
- (void)storeSaveSnapshotForStore:(uint64_t)a1;
@end

@implementation PFUbiquitySaveSnapshot

- (PFUbiquitySaveSnapshot)initWithTransactionLog:(id)a3
{
  v4 = [(PFUbiquitySaveSnapshot *)self init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  if (a3)
  {
    v6 = (void *)*((void *)a3 + 3);
    if (v6) {
      v6 = (void *)v6[6];
    }
    v4->_modelVersionHash = (NSString *)v6;
    v7 = (void *)*((void *)a3 + 3);
    if (v7) {
      v7 = (void *)v7[4];
    }
    v5->_exportingPeerID = (NSString *)v7;
    v8 = (void *)*((void *)a3 + 10);
  }
  else
  {
    v4->_modelVersionHash = 0;
    v8 = 0;
    v4->_exportingPeerID = 0;
  }
  v5->_localPeerID = (NSString *)v8;
  v5->_storeNameToStoreSaveSnapshots = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v9 = [[PFUbiquityStoreSaveSnapshot alloc] initWithExportingPeerID:v5->_exportingPeerID];
  v11 = v9;
  if (a3)
  {
    v12 = (void *)*((void *)a3 + 10);
    if (!v9) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v12 = 0;
  if (v9) {
LABEL_10:
  }
    objc_setProperty_nonatomic(v9, v10, v12, 136);
LABEL_11:
  if (a3 && (uint64_t v13 = *((void *)a3 + 3)) != 0) {
    uint64_t v14 = *(void *)(v13 + 40);
  }
  else {
    uint64_t v14 = 0;
  }
  [(NSMutableDictionary *)v5->_storeNameToStoreSaveSnapshots setObject:v11 forKey:v14];

  return v5;
}

- (PFUbiquitySaveSnapshot)initWithSaveNotification:(id)a3 withLocalPeerID:(id)a4
{
  v6 = [(PFUbiquitySaveSnapshot *)self init];
  if (v6)
  {
    v6->_transactionDate = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    v6->_exportingPeerID = (NSString *)a4;
    v6->_localPeerID = (NSString *)a4;
    v6->_modelVersionHash = (NSString *)+[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)PFUbiquityLocation, objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "object"), "persistentStoreCoordinator"), "managedObjectModel"));
    v6->_storeNameToStoreSaveSnapshots = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v6;
}

- (void)dealloc
{
  self->_transactionDate = 0;
  self->_modelVersionHash = 0;

  self->_exportingPeerID = 0;
  self->_storeNameToStoreSaveSnapshots = 0;

  self->_localPeerID = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquitySaveSnapshot;
  [(PFUbiquitySaveSnapshot *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PFUbiquitySaveSnapshot;
  id v4 = [(PFUbiquitySaveSnapshot *)&v9 description];
  if (self)
  {
    transactionDate = self->_transactionDate;
    modelVersionHash = self->_modelVersionHash;
    exportingPeerID = self->_exportingPeerID;
  }
  else
  {
    modelVersionHash = 0;
    transactionDate = 0;
    exportingPeerID = 0;
  }
  return (id)[v3 stringWithFormat:@"%@\n\ttransactionDate: %@\n\tmodelVersionHash: %@\n\texportingPeerID: %@\n\tstoreNameToSaveSnapshots: %@\n", v4, transactionDate, modelVersionHash, exportingPeerID, self->_storeNameToStoreSaveSnapshots];
}

- (void)storeSaveSnapshotForStore:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = objc_msgSend((id)objc_msgSend(a2, "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey");
  id v4 = (void *)[*(id *)(a1 + 40) objectForKey:v3];
  if (!v4)
  {
    id v5 = [[PFUbiquityStoreSaveSnapshot alloc] initForExport:*(void *)(a1 + 24)];
    id v4 = v5;
    if (v5) {
      objc_setProperty_nonatomic(v5, v6, *(id *)(a1 + 32), 136);
    }
    [*(id *)(a1 + 40) setObject:v4 forKey:v3];
  }
  return v4;
}

@end