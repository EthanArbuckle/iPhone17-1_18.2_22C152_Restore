@interface PFUbiquityStoreExportContext
- (PFUbiquityStoreExportContext)initWithStoreName:(id)a3 andUbiquityRootLocation:(id)a4 forLocalPeerID:(id)a5;
- (PFUbiquityTransactionEntryLight)addTransactionEntryForGlobalID:(int)a3 andTransactionType:;
- (id)description;
- (void)dealloc;
@end

@implementation PFUbiquityStoreExportContext

- (PFUbiquityStoreExportContext)initWithStoreName:(id)a3 andUbiquityRootLocation:(id)a4 forLocalPeerID:(id)a5
{
  v8 = [(PFUbiquityStoreExportContext *)self init];
  if (v8)
  {
    v8->_ubiquityRootLocation = (PFUbiquityLocation *)a4;
    v8->_localPeerID = (NSString *)a5;
    v8->_storeName = (NSString *)a3;
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v8->_store = 0;
    v8->_cacheWrapper = 0;
    v8->_transactionEntries = v9;
  }
  return v8;
}

- (void)dealloc
{
  self->_ubiquityRootLocation = 0;
  self->_localPeerID = 0;

  self->_storeName = 0;
  self->_transactionEntries = 0;

  self->_store = 0;
  self->_cacheWrapper = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityStoreExportContext;
  [(PFUbiquityStoreExportContext *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PFUbiquityStoreExportContext;
  id v4 = [(PFUbiquityStoreExportContext *)&v7 description];
  if (self) {
    ubiquityRootLocation = self->_ubiquityRootLocation;
  }
  else {
    ubiquityRootLocation = 0;
  }
  return (id)[v3 stringWithFormat:@"%@\n\tubiquityRootLocation: %@\n\tlocalPeerID: %@\n\tstoreName: %@\n\ttransactionEntries: %@\n", v4, ubiquityRootLocation, self->_localPeerID, self->_storeName, self->_transactionEntries];
}

- (PFUbiquityTransactionEntryLight)addTransactionEntryForGlobalID:(int)a3 andTransactionType:
{
  if (!a1) {
    return 0;
  }
  v6 = objc_alloc_init(PFUbiquityTransactionEntryLight);
  v8 = v6;
  if (v6)
  {
    objc_setProperty_nonatomic(v6, v7, a1[2], 24);
    v8->_transactionType = a3;
    objc_setProperty_nonatomic(v8, v9, a2, 8);
    objc_setProperty_nonatomic(v8, v10, a1[3], 32);
  }
  [a1[4] addObject:v8];

  return v8;
}

@end