@interface PFUbiquityContainerMonitor
- (PFUbiquityContainerMonitor)init;
- (PFUbiquityContainerMonitor)initWithProcessingQueue:(id)a3 localPeerID:(id)a4 storeName:(id)a5 andUbiquityRootLocation:(id)a6;
- (id)description;
- (uint64_t)startMonitor:(uint64_t)a1;
- (uint64_t)stopMonitor;
- (void)_applicationResumed:(id)a3;
- (void)containerDeleteDetected:(id)a3;
- (void)dealloc;
- (void)scheduleCheckBlock:(uint64_t)a1;
- (void)setContainerIdentifier:(uint64_t)a3 transitionType:;
- (void)setContainerState:(uint64_t)a1;
- (void)setMonitorState:(uint64_t)a1;
- (void)ubiquityIdentityChanged:(id)a3;
@end

@implementation PFUbiquityContainerMonitor

- (PFUbiquityContainerMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityContainerMonitor;
  result = [(PFUbiquityContainerMonitor *)&v3 init];
  if (result)
  {
    result->_hasScheduledCheckBlock = 0;
    *(_OWORD *)&result->_storeName = 0u;
    *(_OWORD *)&result->_ubiquityRootLocation = 0u;
    result->_currentIdentityToken = 0;
    result->_containerIdentifier = 0;
    result->_processingQueue = 0;
  }
  return result;
}

- (PFUbiquityContainerMonitor)initWithProcessingQueue:(id)a3 localPeerID:(id)a4 storeName:(id)a5 andUbiquityRootLocation:(id)a6
{
  v10 = [(PFUbiquityContainerMonitor *)self init];
  v11 = v10;
  if (v10)
  {
    v10->_processingQueue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    v11->_localPeerID = (NSString *)a4;
    v11->_ubiquityRootLocation = (PFUbiquityLocation *)a6;
    v11->_storeName = (NSString *)a5;
    v11->_containerIdentifier = [[PFUbiquityContainerIdentifier alloc] initWithLocalPeerID:v11->_localPeerID storeName:v11->_storeName andUbiquityRootLocation:v11->_ubiquityRootLocation];
  }
  return v11;
}

- (void)dealloc
{
  self->_containerIdentifier = 0;
  self->_currentIdentityToken = 0;
  dispatch_release((dispatch_object_t)self->_processingQueue);

  self->_ubiquityRootLocation = 0;
  self->_localPeerID = 0;

  self->_storeName = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityContainerMonitor;
  [(PFUbiquityContainerMonitor *)&v3 dealloc];
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityContainerMonitor;
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", -[PFUbiquityContainerMonitor description](&v5, sel_description));
  [v3 appendFormat:@"\n\tcontainerIdentifier: %@", self->_containerIdentifier];
  [v3 appendFormat:@"\n\tcurrentIdentityToken: %@", self->_currentIdentityToken];
  [v3 appendFormat:@"\n\tlocalPeerID: %@", self->_localPeerID];
  [v3 appendFormat:@"\n\tstoreName: %@", self->_storeName];
  [v3 appendFormat:@"\n\tubiquityRootLocation: %@", self->_ubiquityRootLocation];
  return v3;
}

- (void)setContainerState:(uint64_t)a1
{
  if (*(_DWORD *)(a1 + 32) != a2)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F28EA0]) initWithName:@"com.apple.coredata.ubiquity.container.state.willChange" object:a1 userInfo:0];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v4);

    *(_DWORD *)(a1 + 32) = a2;
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F28EA0]) initWithName:@"com.apple.coredata.ubiquity.container.state.didChange" object:a1 userInfo:0];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v5);
  }
}

- (void)setMonitorState:(uint64_t)a1
{
  if (a1 && *(_DWORD *)(a1 + 36) != a2)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F28EA0]) initWithName:@"com.apple.coredata.ubiquity.monitor.state.willChange" object:a1 userInfo:0];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v4);

    *(_DWORD *)(a1 + 36) = a2;
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F28EA0]) initWithName:@"com.apple.coredata.ubiquity.container.state.didChange" object:a1 userInfo:0];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v5);
  }
}

- (void)setContainerIdentifier:(uint64_t)a3 transitionType:
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a1 && *(void **)(a1 + 64) != a2)
  {
    id v5 = (id)a1;
    id v6 = objc_alloc(MEMORY[0x1E4F28EA0]);
    v13 = @"NSPersistentStoreUbiquitousTransitionTypeKey";
    v14[0] = [NSNumber numberWithInt:a3];
    v7 = objc_msgSend(v6, "initWithName:object:userInfo:", @"PFUbiquityContainerMonitorWillChangeContainerIdentifierNotification", a1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v7);

    v8 = *(void **)(a1 + 64);
    if (v8)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", a1, @"PFUbiquityContainerIdentifierDeleteNotificaton", *(void *)(a1 + 64));
      [MEMORY[0x1E4F28CA0] removeFilePresenter:*(void *)(a1 + 64)];
      v8 = *(void **)(a1 + 64);
    }

    id v9 = a2;
    *(void *)(a1 + 64) = v9;
    if (v9)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", a1, sel_containerDeleteDetected_, @"PFUbiquityContainerIdentifierDeleteNotificaton", *(void *)(a1 + 64));
      if (*(_DWORD *)(a1 + 36) == 1) {
        [MEMORY[0x1E4F28CA0] addFilePresenter:*(void *)(a1 + 64)];
      }
    }
    id v10 = objc_alloc(MEMORY[0x1E4F28EA0]);
    v13 = @"NSPersistentStoreUbiquitousTransitionTypeKey";
    v14[0] = [NSNumber numberWithInt:a3];
    v11 = objc_msgSend(v10, "initWithName:object:userInfo:", @"PFUbiquityContainerMonitorDidChangeContainerIdentifierNotification", a1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v11);
  }
}

- (uint64_t)startMonitor:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id v4 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "ubiquityIdentityToken");
  *(void *)(a1 + 56) = v4;
  if (v4) {
    int v5 = 1;
  }
  else {
    int v5 = 2;
  }
  *(_DWORD *)(a1 + 32) = v5;
  uint64_t v6 = -[PFUbiquityContainerIdentifier identifyContainer:](*(void *)(a1 + 64), a2);
  if (v6)
  {
    *(_DWORD *)(a1 + 36) = 1;
    [MEMORY[0x1E4F28CA0] addFilePresenter:*(void *)(a1 + 64)];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", a1, sel_containerDeleteDetected_, @"PFUbiquityContainerIdentifierDeleteNotificaton", *(void *)(a1 + 64));
  }
  if (objc_getClass("UIApplication"))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nRegistering for application resumed notification.", "-[PFUbiquityContainerMonitor startMonitor:]", 245, a1);
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", a1, sel__applicationResumed_, @"UIApplicationResumedNotification", 0);
  }
  v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:a1 selector:sel_ubiquityIdentityChanged_ name:*MEMORY[0x1E4F28A38] object:0];
  return v6;
}

- (uint64_t)stopMonitor
{
  if (result)
  {
    uint64_t v1 = result;
    result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", result);
    if (*(void *)(v1 + 64)) {
      result = objc_msgSend(MEMORY[0x1E4F28CA0], "removeFilePresenter:");
    }
    *(void *)(v1 + 32) = 0;
  }
  return result;
}

- (void)containerDeleteDetected:(id)a3
{
  id v4 = (void *)[a3 object];
  if (v4) {
    id v4 = (void *)v4[5];
  }
  containerIdentifier = self->_containerIdentifier;
  if (containerIdentifier) {
    uuidFileLocation = containerIdentifier->_uuidFileLocation;
  }
  else {
    uuidFileLocation = 0;
  }
  if ([v4 isEqual:uuidFileLocation])
  {
    v7 = self;
    -[PFUbiquityContainerMonitor setMonitorState:]((uint64_t)self, 2);
    uint64_t v9 = 0;
    v8 = [[PFUbiquityContainerIdentifier alloc] initWithLocalPeerID:self->_localPeerID storeName:self->_storeName andUbiquityRootLocation:self->_ubiquityRootLocation];
    if (-[PFUbiquityContainerIdentifier identifyContainer:]((uint64_t)v8, &v9))
    {
      -[PFUbiquityContainerMonitor setContainerIdentifier:transitionType:]((uint64_t)self, v8, 3);
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Trouble identifying container: %@", "-[PFUbiquityContainerMonitor containerDeleteDetected:]", 287, v9);
    }
  }
}

- (void)_applicationResumed:(id)a3
{
  if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nApplication resumed, scheduling check.", "-[PFUbiquityContainerMonitor _applicationResumed:]", 297, self);
  }

  -[PFUbiquityContainerMonitor scheduleCheckBlock:]((uint64_t)self, (uint64_t)a3);
}

- (void)scheduleCheckBlock:(uint64_t)a1
{
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 44);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 44));
    if (!*(unsigned char *)(a1 + 40))
    {
      int v5 = *(NSObject **)(a1 + 48);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __49__PFUbiquityContainerMonitor_scheduleCheckBlock___block_invoke;
      v6[3] = &unk_1E544B778;
      v6[4] = a1;
      v6[5] = a2;
      dispatch_async(v5, v6);
      *(unsigned char *)(a1 + 40) = 1;
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)ubiquityIdentityChanged:(id)a3
{
}

uint64_t __49__PFUbiquityContainerMonitor_scheduleCheckBlock___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3) {
    goto LABEL_15;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 44));
  *(unsigned char *)(v3 + 40) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 44));
  if (*(_DWORD *)(v3 + 36) != 1) {
    goto LABEL_15;
  }
  uint64_t v10 = 0;
  id v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "ubiquityIdentityToken");
  int v5 = *(void **)(v3 + 56);
  if (v5 != v4)
  {
    int v6 = [v5 isEqual:v4];
    if ((v6 & 1) == 0)
    {

      *(void *)(v3 + 56) = v4;
      -[PFUbiquityContainerMonitor setMonitorState:](v3, 0);
    }
    int v7 = v6 ^ 1;
    if (*(void *)(v3 + 56)) {
      goto LABEL_7;
    }
LABEL_14:
    -[PFUbiquityContainerMonitor setContainerIdentifier:transitionType:](v3, 0, 2);
    -[PFUbiquityContainerMonitor setContainerState:](v3, 2);
    goto LABEL_15;
  }
  int v7 = 0;
  if (!v4) {
    goto LABEL_14;
  }
LABEL_7:
  v8 = [[PFUbiquityContainerIdentifier alloc] initWithLocalPeerID:*(void *)(v3 + 16) storeName:*(void *)(v3 + 24) andUbiquityRootLocation:*(void *)(v3 + 8)];
  if ((-[PFUbiquityContainerIdentifier identifyContainer:]((uint64_t)v8, &v10) & 1) == 0
    && +[PFUbiquityLogging canLogMessageAtLevel:0])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Trouble identifying container: %@", "-[PFUbiquityContainerMonitor checkStoresAndContainer:]", 383, v10);
  }
  -[PFUbiquityContainerMonitor setContainerState:](v3, 1);
  if (v7) {
    -[PFUbiquityContainerMonitor setContainerIdentifier:transitionType:](v3, v8, 1);
  }

LABEL_15:

  return [v2 drain];
}

@end