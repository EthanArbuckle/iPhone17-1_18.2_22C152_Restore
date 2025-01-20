@interface PFUbiquityImportOperation
- (NSObject)delegate;
- (PFUbiquityImportOperation)init;
- (PFUbiquityImportOperation)initWithPersistentStore:(id)a3 localPeerID:(id)a4 andUbiquityRootLocation:(id)a5;
- (PFUbiquityImportOperation)initWithStoreName:(id)a3 localPeerID:(id)a4 andUbiquityRootLocation:(id)a5;
- (id)description;
- (id)retainedDelegate;
- (void)cancel;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)storeWillBeRemoved:(id)a3;
@end

@implementation PFUbiquityImportOperation

- (PFUbiquityImportOperation)init
{
  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityImportOperation;
  v2 = [(PFUbiquityImportOperation *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_localPeerID = 0;
    v2->_storeName = 0;
    v2->_store = 0;
    v2->_ubiquityRootLocation = 0;
    v2->_lockedDelegateLock = 0;
    v2->_delegateLock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
  }
  return v3;
}

- (PFUbiquityImportOperation)initWithPersistentStore:(id)a3 localPeerID:(id)a4 andUbiquityRootLocation:(id)a5
{
  v8 = [(PFUbiquityImportOperation *)self init];
  if (v8)
  {
    v8->_localPeerID = (NSString *)a4;
    v8->_storeName = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey");
    v8->_ubiquityRootLocation = (PFUbiquityLocation *)a5;
    v8->_store = (NSPersistentStore *)a3;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v8, sel_storeWillBeRemoved_, @"NSPersistentStoreCoordinatorWillRemoveStoreNotification", a3);
  }
  return v8;
}

- (PFUbiquityImportOperation)initWithStoreName:(id)a3 localPeerID:(id)a4 andUbiquityRootLocation:(id)a5
{
  v8 = [(PFUbiquityImportOperation *)self init];
  if (v8)
  {
    v8->_storeName = (NSString *)a3;
    v8->_localPeerID = (NSString *)a4;
    v8->_ubiquityRootLocation = (PFUbiquityLocation *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);

  self->_localPeerID = 0;
  self->_store = 0;

  self->_storeName = 0;
  self->_ubiquityRootLocation = 0;
  [(PFUbiquityImportOperation *)self setDelegate:0];

  self->_delegateLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityImportOperation;
  [(PFUbiquityImportOperation *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PFUbiquityImportOperation;
  id v4 = [(PFUbiquityImportOperation *)&v9 description];
  if (self)
  {
    localPeerID = self->_localPeerID;
    storeName = self->_storeName;
    ubiquityRootLocation = self->_ubiquityRootLocation;
  }
  else
  {
    storeName = 0;
    localPeerID = 0;
    ubiquityRootLocation = 0;
  }
  return (id)[v3 stringWithFormat:@"%@\n\tlocalPeerID: %@\n\tstoreName: %@\n\tubiquityRootLocation: %@", v4, localPeerID, storeName, ubiquityRootLocation];
}

- (void)storeWillBeRemoved:(id)a3
{
  if ((NSPersistentStore *)[a3 object] == self->_store)
  {
    [(PFUbiquityImportOperation *)self cancel];
  }
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityImportOperation;
  [(PFUbiquityImportOperation *)&v3 cancel];
  if ([(NSLock *)self->_delegateLock tryLock])
  {
    self->_delegate = 0;
    [(NSLock *)self->_delegateLock unlock];
  }
}

- (id)retainedDelegate
{
  if (self)
  {
    [(NSLock *)self->_delegateLock lock];
    self->_lockedDelegateLock = 1;
  }
  objc_super v3 = self->_delegate;
  if (self->_lockedDelegateLock)
  {
    [(NSLock *)self->_delegateLock unlock];
    self->_lockedDelegateLock = 0;
  }
  return v3;
}

- (NSObject)delegate
{
  if (self)
  {
    [(NSLock *)self->_delegateLock lock];
    self->_lockedDelegateLock = 1;
  }
  delegate = self->_delegate;
  if (self->_lockedDelegateLock)
  {
    [(NSLock *)self->_delegateLock unlock];
    self->_lockedDelegateLock = 0;
  }
  return delegate;
}

- (void)setDelegate:(id)a3
{
  if (self)
  {
    [(NSLock *)self->_delegateLock lock];
    self->_lockedDelegateLock = 1;
  }
  self->_delegate = a3;
  if (self->_lockedDelegateLock)
  {
    [(NSLock *)self->_delegateLock unlock];
    self->_lockedDelegateLock = 0;
  }
}

@end