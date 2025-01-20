@interface PFUbiquityExportContext
- (PFUbiquityExportContext)initWithLocalPeerID:(id)a3 andUbiquityRootLocation:(id)a4;
- (PFUbiquityStoreExportContext)storeExportContextForStore:(uint64_t)a1;
- (id)description;
- (void)dealloc;
@end

@implementation PFUbiquityExportContext

- (PFUbiquityExportContext)initWithLocalPeerID:(id)a3 andUbiquityRootLocation:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PFUbiquityExportContext;
  v6 = [(PFUbiquityExportContext *)&v8 init];
  if (v6)
  {
    v6->_storeNameToStoreExportContext = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v6->_ubiquityRootPathToStack = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v6->_localPeerID = (NSString *)a3;
    v6->_ubiquityRootLocation = (PFUbiquityLocation *)a4;
    v6->_useLocalStorage = 0;
  }
  return v6;
}

- (void)dealloc
{
  self->_storeNameToStoreExportContext = 0;
  self->_ubiquityRootPathToStack = 0;

  self->_localPeerID = 0;
  self->_ubiquityRootLocation = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityExportContext;
  [(PFUbiquityExportContext *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PFUbiquityExportContext;
  id v4 = [(PFUbiquityExportContext *)&v7 description];
  if (self) {
    localPeerID = self->_localPeerID;
  }
  else {
    localPeerID = 0;
  }
  return (id)[v3 stringWithFormat:@"%@\n\tlocalPeerID: %@\n\tstoreNameToStoreExportContext: %@\n", v4, localPeerID, self->_storeNameToStoreExportContext];
}

- (PFUbiquityStoreExportContext)storeExportContextForStore:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey");
  v5 = (PFUbiquityStoreExportContext *)[*(id *)(a1 + 8) objectForKey:v4];
  if (!v5)
  {
    v5 = [[PFUbiquityStoreExportContext alloc] initWithStoreName:v4 andUbiquityRootLocation:*(void *)(a1 + 32) forLocalPeerID:*(void *)(a1 + 24)];
    [*(id *)(a1 + 8) setObject:v5 forKey:v4];
    self;
    v6 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, v4, *(void *)(a1 + 24));
    objc_super v8 = v6;
    if (v5)
    {
      if (v6 && (uint64_t v9 = v6[11]) != 0) {
        v10 = *(void **)(v9 + 88);
      }
      else {
        v10 = 0;
      }
      objc_setProperty_nonatomic(v5, v7, v10, 48);

      objc_setProperty_nonatomic(v5, v11, a2, 40);
    }
    else
    {
    }
  }
  return v5;
}

@end