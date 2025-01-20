@interface ICDeviceManager
- (BOOL)controlAuthorizedOnce;
- (BOOL)deviceOperationQueueSuspended;
- (BOOL)managerIsRunning;
- (BOOL)openRemoteDeviceManager;
- (ICDeviceManager)init;
- (NSDictionary)deviceMatchingInfo;
- (NSMutableArray)deviceHandles;
- (NSMutableDictionary)devices;
- (NSOperationQueue)deviceOperationQueue;
- (NSXPCConnection)managerConnection;
- (id)deviceForConnection:(id)a3;
- (id)deviceForUUID:(id)a3;
- (id)deviceManagerConnection;
- (id)remoteManager;
- (int64_t)closeDevice:(id)a3 contextInfo:(void *)a4;
- (int64_t)closeSession:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (int64_t)deleteFile:(id)a3 fromDevice:(id)a4 completion:(id)a5;
- (int64_t)downloadFile:(id)a3 fromDevice:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (int64_t)ejectDevice:(id)a3 completion:(id)a4;
- (int64_t)enumerateContent:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (int64_t)getFileData:(id)a3 fromDevice:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (int64_t)getFileMetadata:(id)a3 fromDevice:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (int64_t)getFileThumbnail:(id)a3 fromDevice:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (int64_t)getFingerprint:(id)a3 fromDevice:(id)a4 completion:(id)a5;
- (int64_t)getSecurityScopedURL:(id)a3 fromDevice:(id)a4 completion:(id)a5;
- (int64_t)openDevice:(id)a3 contextInfo:(void *)a4;
- (int64_t)openSession:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (int64_t)refreshObjectHandleInfo:(id)a3 fromDevice:(id)a4 completion:(id)a5;
- (int64_t)registerDevice:(id)a3 forImageCaptureEventNotifications:(id)a4;
- (int64_t)sendDevice:(id)a3 ptpCommand:(id)a4 andPayload:(id)a5 completion:(id)a6;
- (int64_t)syncClock:(id)a3 completion:(id)a4;
- (int64_t)unregisterDevice:(id)a3 forImageCaptureEventNotifications:(id)a4;
- (os_unfair_lock_s)deviceHandlesLock;
- (os_unfair_lock_s)deviceOperationQueueLock;
- (unsigned)managerInvalidationCount;
- (void)addInitiatedOperation:(id)a3;
- (void)addInteractiveOperation:(id)a3;
- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5;
- (void)closeDeviceHandle:(id)a3;
- (void)closeDeviceImp:(id)a3;
- (void)closeSessionImp:(id)a3;
- (void)dealloc;
- (void)enumerateContentImp:(id)a3;
- (void)getDeviceList;
- (void)notifyAddedDevice:(id)a3;
- (void)notifyRemovedDevice:(id)a3;
- (void)openDeviceHandle:(id)a3;
- (void)openSessionImp:(id)a3;
- (void)postCommandCompletionNotification:(id)a3;
- (void)postNotification:(id)a3;
- (void)restartRunning;
- (void)resumeOperations;
- (void)setControlAuthorizedOnce:(BOOL)a3;
- (void)setDeviceHandles:(id)a3;
- (void)setDeviceHandlesLock:(os_unfair_lock_s)a3;
- (void)setDeviceMatchingInfo:(id)a3;
- (void)setDeviceOperationQueue:(id)a3;
- (void)setDeviceOperationQueueLock:(os_unfair_lock_s)a3;
- (void)setDeviceOperationQueueMaxConcurrentOperationCount:(unint64_t)a3;
- (void)setDeviceOperationQueueName:(id)a3;
- (void)setDeviceOperationQueueSuspended:(BOOL)a3;
- (void)setDevices:(id)a3;
- (void)setManagerConnection:(id)a3;
- (void)setManagerInvalidationCount:(unsigned int)a3;
- (void)setManagerIsRunning:(BOOL)a3;
- (void)startRunning;
- (void)stopRunning;
- (void)suspendOperations;
@end

@implementation ICDeviceManager

- (void)startRunning
{
  if (!self->_managerIsRunning)
  {
    self->_managerIsRunning = 1;
    if ([(ICDeviceManager *)self openRemoteDeviceManager])
    {
      [(ICDeviceManager *)self getDeviceList];
    }
  }
}

- (void)getDeviceList
{
  v3 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__ICDeviceManager_getDeviceList__block_invoke;
  block[3] = &unk_1E63D72A8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (ICDeviceManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)ICDeviceManager;
  v2 = [(ICDeviceManager *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    devices = v2->_devices;
    v2->_devices = (NSMutableDictionary *)v3;

    v2->_managerIsRunning = 0;
    v2->_managerInvalidationCount = 0;
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:@"/System/Library/Frameworks/ImageCaptureCore.framework/DeviceMatchingInfo.plist"];
    deviceMatchingInfo = v2->_deviceMatchingInfo;
    v2->_deviceMatchingInfo = (NSDictionary *)v5;

    v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    deviceOperationQueue = v2->_deviceOperationQueue;
    v2->_deviceOperationQueue = v7;

    [(NSOperationQueue *)v2->_deviceOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_deviceOperationQueue setQualityOfService:25];
    [(NSOperationQueue *)v2->_deviceOperationQueue setName:@"ICDeviceOperationQueue"];
    v2->_deviceOperationQueueSuspended = 0;
    v2->_deviceOperationQueueLock._os_unfair_lock_opaque = 0;
    v2->_deviceHandlesLock._os_unfair_lock_opaque = 0;
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deviceHandles = v2->_deviceHandles;
    v2->_deviceHandles = v9;

    v2->_controlAuthorizedOnce = 0;
    if (!_gImageIOSupportedFileExtensions)
    {
      v11 = (void *)CGImageSourceCopyTypeExtensions();
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v11];
      v13 = (void *)_gImageIOSupportedFileExtensions;
      _gImageIOSupportedFileExtensions = v12;
    }
    if (!_gKnownRawExtensions)
    {
      v14 = (void *)CGImageSourceCopyTypeExtensions();
      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v14];
      v16 = (void *)_gKnownRawExtensions;
      _gKnownRawExtensions = v15;

      [(id)_gKnownRawExtensions removeObject:@"tif"];
    }
  }
  return v2;
}

- (BOOL)openRemoteDeviceManager
{
  uint64_t v3 = [(ICDeviceManager *)self deviceManagerConnection];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A36FD0];
    uint64_t v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A36FD0];
    [(ICDeviceManager *)self addSelectorToInterface:v4 selectorString:@"notifyAddedDevice:" origin:0];
    [(ICDeviceManager *)self addSelectorToInterface:v4 selectorString:@"notifyRemovedDevice:" origin:0];
    [(ICDeviceManager *)self addSelectorToInterface:v5 selectorString:@"requestDeviceListWithOptions:reply:" origin:1];
    [(ICDeviceManager *)self addSelectorToInterface:v5 selectorString:@"openDevice:withReply:" origin:1];
    [(ICDeviceManager *)self addSelectorToInterface:v5 selectorString:@"closeDevice:withReply:" origin:1];
    [v3 setExportedInterface:v4];
    [v3 setRemoteObjectInterface:v5];
    [v3 setExportedObject:self];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __42__ICDeviceManager_openRemoteDeviceManager__block_invoke;
    uint64_t v12 = &unk_1E63D72D0;
    v13 = self;
    v14 = self;
    v6 = self;
    [v3 setInvalidationHandler:&v9];
    v7 = objc_msgSend(v3, "invalidationHandler", v9, v10, v11, v12, v13, v14);
    [v3 setInterruptionHandler:v7];

    [(ICDeviceManager *)v6 setManagerConnection:v3];
    [v3 resume];
  }
  return v3 != 0;
}

- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = addSelectorToInterface_selectorString_origin__onceToken_0;
  v8 = (NSString *)a4;
  id v11 = a3;
  if (v7 != -1) {
    dispatch_once(&addSelectorToInterface_selectorString_origin__onceToken_0, &__block_literal_global_6);
  }
  uint64_t v9 = addSelectorToInterface_selectorString_origin__incomingClasses_0;
  SEL v10 = NSSelectorFromString(v8);

  [v11 setClasses:v9 forSelector:v10 argumentIndex:0 ofReply:v5];
}

- (void)setManagerConnection:(id)a3
{
}

void __32__ICDeviceManager_getDeviceList__block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = [*(id *)(a1 + 32) remoteManager];
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __32__ICDeviceManager_getDeviceList__block_invoke_2;
    v5[3] = &unk_1E63D7370;
    v5[4] = *(void *)(a1 + 32);
    v6 = v2;
    [v3 requestDeviceListWithOptions:&unk_1F1A2BE98 reply:v5];
  }
  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v2, v4);
}

- (id)remoteManager
{
  uint64_t v3 = [(ICDeviceManager *)self managerConnection];
  if (v3
    && (dispatch_time_t v4 = (void *)v3,
        unsigned int v5 = [(ICDeviceManager *)self managerInvalidationCount],
        v4,
        v5 <= 4))
  {
    v6 = [(ICDeviceManager *)self managerConnection];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __32__ICDeviceManager_remoteManager__block_invoke;
    v9[3] = &unk_1E63D7280;
    v9[4] = self;
    uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v9];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSXPCConnection)managerConnection
{
  return self->_managerConnection;
}

- (unsigned)managerInvalidationCount
{
  return self->_managerInvalidationCount;
}

uint64_t __64__ICDeviceManager_addSelectorToInterface_selectorString_origin___block_invoke()
{
  id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v11 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  addSelectorToInterface_selectorString_origin__incomingClasses_0 = objc_msgSend(v12, "initWithObjects:", v11, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);

  return MEMORY[0x1F41817F8]();
}

- (void)stopRunning
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_managerIsRunning)
  {
    self->_managerIsRunning = 0;
    uint64_t v3 = (void *)[(NSMutableDictionary *)self->_devices copy];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = objc_msgSend(v3, "allKeys", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * i)];
          SEL v10 = [v9 internalUUID];
          [(ICDeviceManager *)self closeDeviceHandle:v10];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (void)restartRunning
{
  [(ICDeviceManager *)self stopRunning];

  [(ICDeviceManager *)self startRunning];
}

- (void)openDeviceHandle:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__ICDeviceManager_openDeviceHandle___block_invoke;
  v11[3] = &unk_1E63D72D0;
  id v5 = v4;
  id v12 = v5;
  long long v13 = self;
  uint64_t v6 = (void (**)(void))MEMORY[0x1C18A01C0](v11);
  uint64_t v7 = +[ICPrefManager defaultAuthManager];
  uint64_t v8 = [v7 getContentsAuthorizationStatus];
  if (v8 == @"ICAuthorizationStatusAuthorized")
  {
    v6[2](v6);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__ICDeviceManager_openDeviceHandle___block_invoke_2;
    v9[3] = &unk_1E63D7B78;
    SEL v10 = v6;
    [v7 requestContentsAuthorizationShouldPrompt:1 completion:v9];
  }
}

void __36__ICDeviceManager_openDeviceHandle___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  __ICOSLogCreate();
  uint64_t v2 = @"device";
  if ((unint64_t)[@"device" length] >= 0x15)
  {
    uint64_t v3 = objc_msgSend(@"device", "substringWithRange:", 0, 18);
    uint64_t v2 = [v3 stringByAppendingString:@".."];
  }
  id v4 = [NSString stringWithFormat:@"%12s : %@", "authorized", *(void *)(a1 + 32)];
  id v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v2;
    uint64_t v7 = v5;
    *(_DWORD *)buf = 136446466;
    uint64_t v21 = [(__CFString *)v6 UTF8String];
    __int16 v22 = 2114;
    v23 = v4;
    _os_log_impl(&dword_1BEEFF000, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  uint64_t v8 = [*(id *)(a1 + 40) devices];
  uint64_t v9 = [v8 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (!v9)
  {
    SEL v10 = [*(id *)(a1 + 40) remoteManager];
    if (v10)
    {
      __ICOSLogCreate();
      long long v11 = @"device";
      if ((unint64_t)[@"device" length] >= 0x15)
      {
        id v12 = objc_msgSend(@"device", "substringWithRange:", 0, 18);
        long long v11 = [v12 stringByAppendingString:@".."];
      }
      long long v13 = [NSString stringWithFormat:@"%12s : %@", "opening", *(void *)(a1 + 32)];
      long long v14 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = v11;
        uint64_t v16 = v14;
        uint64_t v17 = [(__CFString *)v15 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v21 = v17;
        __int16 v22 = 2114;
        v23 = v13;
        _os_log_impl(&dword_1BEEFF000, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __36__ICDeviceManager_openDeviceHandle___block_invoke_43;
      v19[3] = &unk_1E63D7B50;
      uint64_t v18 = *(void *)(a1 + 32);
      v19[4] = *(void *)(a1 + 40);
      [v10 openDevice:v18 withReply:v19];
    }
  }
}

void __36__ICDeviceManager_openDeviceHandle___block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"ICDeviceEndpoint"];
  if (v4)
  {
    __ICOSLogCreate();
    id v5 = @"devEndpoint";
    if ((unint64_t)[@"devEndpoint" length] >= 0x15)
    {
      uint64_t v6 = objc_msgSend(@"devEndpoint", "substringWithRange:", 0, 18);
      id v5 = [v6 stringByAppendingString:@".."];
    }
    uint64_t v7 = [NSString stringWithFormat:@"%@", v4];
    uint64_t v8 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v5;
      SEL v10 = v8;
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = [(__CFString *)v9 UTF8String];
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_1BEEFF000, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v35 = __Block_byref_object_copy__2;
    v36 = __Block_byref_object_dispose__2;
    id v37 = (id)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v4];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      __ICOSLogCreate();
      if ((unint64_t)[@"devConnection" length] < 0x15)
      {
        id v12 = @"devConnection";
      }
      else
      {
        long long v11 = objc_msgSend(@"devConnection", "substringWithRange:", 0, 18);
        id v12 = [v11 stringByAppendingString:@".."];
      }
      long long v13 = [NSString stringWithFormat:@"%@", *(void *)(*(void *)&buf[8] + 40)];
      long long v14 = (id)_gICOSLog;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v30 = 136446466;
        uint64_t v31 = [(__CFString *)v12 UTF8String];
        __int16 v32 = 2114;
        v33 = v13;
        _os_log_impl(&dword_1BEEFF000, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v30, 0x16u);
      }

      uint64_t v15 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A36F70];
      uint64_t v16 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A36F70];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"imageCaptureEventNotification:completion:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"openDeviceSessionWithReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"postNotification:" origin:0];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"notifyAddedItems:" origin:0];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"notifyRemovedItems:" origin:0];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"notifyUpdatedItems:" origin:0];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"notifyStatus:" origin:0];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"notifyPtpEvent:" origin:0];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"registerInterestedEventNotifications:" origin:0];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"unregisterInterestedEventNotifications:" origin:0];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"requestReadDataFromObjectHandle:options:withReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"requestThumbnailDataForObjectHandle:options:withReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"requestMetadataForObjectHandle:options:withReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"requestStartUsingDeviceWithReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"requestDownloadObjectHandle:options:withReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"requestDeleteObjectHandle:options:withReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"sendPTPCommand:andPayload:withReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"requestSecurityScopedURLForObjectHandle:withReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"requestFingerprintForObjectHandle:withReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v15 selectorString:@"requestRefreshObjectHandleInfo:withReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"imageCaptureEventNotification:completion:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"openDeviceSessionWithReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"postNotification:" origin:0];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"notifyAddedItems:" origin:0];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"notifyRemovedItems:" origin:0];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"notifyUpdatedItems:" origin:0];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"notifyStatus:" origin:0];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"notifyPtpEvent:" origin:0];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"registerInterestedEventNotifications:" origin:0];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"unregisterInterestedEventNotifications:" origin:0];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"requestThumbnailDataForObjectHandle:options:withReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"requestMetadataForObjectHandle:options:withReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"requestDownloadObjectHandle:options:withReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"requestStartUsingDeviceWithReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"requestDeleteObjectHandle:options:withReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"requestReadDataFromObjectHandle:options:withReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"sendPTPCommand:andPayload:withReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"requestSecurityScopedURLForObjectHandle:withReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"requestFingerprintForObjectHandle:withReply:" origin:1];
      [*(id *)(a1 + 32) addSelectorToInterface:v16 selectorString:@"requestRefreshObjectHandleInfo:withReply:" origin:1];
      uint64_t v17 = [v3 objectForKeyedSubscript:@"ICInternalDeviceUUID"];
      uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
      atomic_fetch_add(NextDeviceHandle__sLastDeviceHandle, 1u);
      uint64_t v19 = atomic_load((unsigned int *)NextDeviceHandle__sLastDeviceHandle);
      v20 = [NSNumber numberWithUnsignedInt:v19];
      [v18 setObject:v20 forKeyedSubscript:@"ICADeviceBrowserDeviceRefKey"];

      uint64_t v21 = [NSNumber numberWithUnsignedInt:v19];
      [v18 setObject:v21 forKeyedSubscript:@"ICAConnectionIDKey"];

      __int16 v22 = [NSNumber numberWithUnsignedInt:v19];
      [v18 setObject:v22 forKeyedSubscript:@"objectID"];

      [v18 setObject:v17 forKeyedSubscript:@"UUIDString"];
      [v18 setObject:v17 forKeyedSubscript:@"persistentIDString"];
      v23 = [[ICCameraDevice alloc] initWithDictionary:v18];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __36__ICDeviceManager_openDeviceHandle___block_invoke_173;
      v29[3] = &unk_1E63D7B28;
      v29[4] = buf;
      [*(id *)(*(void *)&buf[8] + 40) setInvalidationHandler:v29];
      uint64_t v24 = [*(id *)(*(void *)&buf[8] + 40) invalidationHandler];
      [*(id *)(*(void *)&buf[8] + 40) setInterruptionHandler:v24];

      [*(id *)(*(void *)&buf[8] + 40) setExportedInterface:v15];
      [*(id *)(*(void *)&buf[8] + 40) setRemoteObjectInterface:v16];
      [*(id *)(*(void *)&buf[8] + 40) setExportedObject:*(void *)(a1 + 32)];
      [(ICCameraDevice *)v23 setDevConnection:*(void *)(*(void *)&buf[8] + 40)];
      [(ICCameraDevice *)v23 setDevEndpoint:v4];
      [(ICDevice *)v23 setDeviceManager:*(void *)(a1 + 32)];
      [(ICDevice *)v23 setInternalUUID:v17];
      v25 = [*(id *)(a1 + 32) devices];
      [v25 setObject:v23 forKeyedSubscript:v17];

      v26 = [(ICCameraDevice *)v23 devConnection];
      [v26 resume];

      v27 = *(void **)(a1 + 32);
      v28 = [(ICDevice *)v23 internalUUID];
      [v27 startDeviceWithHandle:v28];
    }
    _Block_object_dispose(buf, 8);
  }
}

void __36__ICDeviceManager_openDeviceHandle___block_invoke_173(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setInvalidationHandler:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setInterruptionHandler:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) invalidate];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __36__ICDeviceManager_openDeviceHandle___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"ICAuthorizationStatus"];
  if ([v3 isEqualToString:@"ICAuthorizationStatusAuthorized"]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

intptr_t __32__ICDeviceManager_getDeviceList__block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 objectForKeyedSubscript:@"ICDeviceContexts"];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __32__ICDeviceManager_getDeviceList__block_invoke_3;
    v7[3] = &unk_1E63D72D0;
    uint64_t v4 = *(void *)(a1 + 32);
    id v8 = v3;
    uint64_t v9 = v4;
    id v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __32__ICDeviceManager_getDeviceList__block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "notifyAddedDevice:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)notifyAddedDevice:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __ICOSLogCreate();
  uint64_t v5 = @"notifyAddedDevice";
  if ((unint64_t)[@"notifyAddedDevice" length] >= 0x15)
  {
    uint64_t v6 = objc_msgSend(@"notifyAddedDevice", "substringWithRange:", 0, 18);
    uint64_t v5 = [v6 stringByAppendingString:@".."];
  }
  long long v7 = [NSString stringWithFormat:@"%@", v4];
  long long v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    long long v9 = v5;
    long long v10 = v8;
    *(_DWORD *)buf = 136446466;
    uint64_t v30 = [(__CFString *)v9 UTF8String];
    __int16 v31 = 2114;
    __int16 v32 = v7;
    _os_log_impl(&dword_1BEEFF000, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  p_deviceHandlesLock = &self->_deviceHandlesLock;
  os_unfair_lock_lock(&self->_deviceHandlesLock);
  v23 = self;
  uint64_t v12 = (void *)[(NSMutableArray *)self->_deviceHandles copy];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    while (2)
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [*(id *)(*((void *)&v24 + 1) + 8 * v17) objectForKeyedSubscript:@"ICDeviceHandle"];
        uint64_t v19 = [v4 objectForKeyedSubscript:@"ICDeviceHandle"];
        char v20 = [v18 isEqualToString:v19];

        if (v20)
        {
          uint64_t v21 = v13;
          goto LABEL_15;
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  [(NSMutableArray *)v23->_deviceHandles addObject:v4];
  uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v4];
  [v21 setObject:v23 forKeyedSubscript:@"ICDeviceDelegate"];
  __int16 v22 = SharedICDeviceHardwareHandler();
  [v22 addDeviceContext:v21];

LABEL_15:
  os_unfair_lock_unlock(p_deviceHandlesLock);
}

- (void)notifyRemovedDevice:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_t lock = &self->_deviceHandlesLock;
  os_unfair_lock_lock(&self->_deviceHandlesLock);
  uint64_t v16 = self;
  uint64_t v5 = (void *)[(NSMutableArray *)self->_deviceHandles copy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [v11 objectForKeyedSubscript:@"ICDeviceHandle"];
        id v13 = [v4 objectForKeyedSubscript:@"ICDeviceHandle"];
        int v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          [(NSMutableArray *)v16->_deviceHandles removeObject:v11];

          os_unfair_lock_unlock(lock);
          uint64_t v15 = SharedICDeviceHardwareHandler();
          [v15 removeDeviceContext:v4];

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  os_unfair_lock_unlock(lock);
LABEL_11:
}

- (void)closeDeviceHandle:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1C189FFC0]();
  id v6 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v4];
  if (v6)
  {
    __ICOSLogCreate();
    uint64_t v7 = @"device";
    if ((unint64_t)[@"device" length] >= 0x15)
    {
      uint64_t v8 = objc_msgSend(@"device", "substringWithRange:", 0, 18);
      uint64_t v7 = [v8 stringByAppendingString:@".."];
    }
    uint64_t v9 = [NSString stringWithFormat:@"removing device: %@", v4];
    long long v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = v7;
      uint64_t v12 = v10;
      *(_DWORD *)buf = 136446466;
      uint64_t v17 = [(__CFString *)v11 UTF8String];
      __int16 v18 = 2114;
      long long v19 = v9;
      _os_log_impl(&dword_1BEEFF000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    [(NSMutableDictionary *)self->_devices removeObjectForKey:v4];
    v14[0] = @"device";
    v14[1] = @"type";
    v15[0] = v6;
    v15[1] = @"ICDeviceRemoved";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    [(ICDeviceManager *)self performSelectorOnMainThread:sel_postNotification_ withObject:v13 waitUntilDone:0];
  }
}

- (void)closeDeviceImp:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"device"];
  if (v4)
  {
    id v6 = v4;
    uint64_t v5 = [v4 internalUUID];
    [(ICDeviceManager *)self closeDeviceHandle:v5];

    id v4 = v6;
  }
}

- (void)openSessionImp:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"device"];
  id v6 = [v4 objectForKeyedSubscript:@"options"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"info"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"cbBlock"];

  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"device", 0);
  if ([v5 isAccessRestrictedAppleDevice]) {
    uint64_t v10 = -9943;
  }
  else {
    uint64_t v10 = 0;
  }
  if ([v5 hasOpenSession])
  {
    uint64_t v10 = -21347;
  }
  else
  {
    uint64_t v11 = [v6 objectForKeyedSubscript:@"ICEnumerationPrioritizeTethering"];
    if (!v11
      || (uint64_t v12 = (void *)v11,
          [v6 objectForKeyedSubscript:@"ICEnumerationPrioritizeTethering"],
          id v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v13 BOOLValue],
          v13,
          v12,
          (v14 & 1) == 0))
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F28B48];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __34__ICDeviceManager_openSessionImp___block_invoke;
      v18[3] = &unk_1E63D72D0;
      id v19 = v5;
      id v20 = v6;
      uint64_t v16 = [v15 blockOperationWithBlock:v18];
      [(ICDeviceManager *)self addInteractiveOperation:v16];
    }
  }
  if (v7) {
    [v9 setObject:v7 forKeyedSubscript:@"info"];
  }
  uint64_t v17 = [NSNumber numberWithInteger:v10];
  [v9 setObject:v17 forKeyedSubscript:@"errCode"];

  if (v8) {
    ((void (**)(void, void *, void *))v8)[2](v8, v5, v9);
  }
}

void __34__ICDeviceManager_openSessionImp___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteCamera];
  [v2 enumerateContentWithOptions:*(void *)(a1 + 40)];
}

- (void)enumerateContentImp:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"device"];
  id v6 = [v4 objectForKeyedSubscript:@"options"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"info"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"cbBlock"];

  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"device", 0);
  if (![v5 hasOpenSession])
  {
    uint64_t v12 = -9927;
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F28B48];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __39__ICDeviceManager_enumerateContentImp___block_invoke;
  v14[3] = &unk_1E63D72D0;
  id v15 = v5;
  id v16 = v6;
  uint64_t v11 = [v10 blockOperationWithBlock:v14];
  [(ICDeviceManager *)self addInteractiveOperation:v11];

  uint64_t v12 = 0;
  if (v7) {
LABEL_5:
  }
    [v9 setObject:v7 forKeyedSubscript:@"info"];
LABEL_6:
  id v13 = [NSNumber numberWithInteger:v12];
  [v9 setObject:v13 forKeyedSubscript:@"errCode"];

  if (v8) {
    ((void (**)(void, void *, void *))v8)[2](v8, v5, v9);
  }
}

void __39__ICDeviceManager_enumerateContentImp___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteCamera];
  [v2 enumerateContentWithOptions:*(void *)(a1 + 40)];
}

- (void)closeSessionImp:(id)a3
{
  id v3 = a3;
  id v9 = [v3 objectForKeyedSubscript:@"device"];
  id v4 = [v3 objectForKeyedSubscript:@"info"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"cbBlock"];

  id v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v9, @"device", 0);
  if ([v9 hasOpenSession]) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = -9928;
  }
  if (v4) {
    [v6 setObject:v4 forKeyedSubscript:@"info"];
  }
  uint64_t v8 = [NSNumber numberWithInteger:v7];
  [v6 setObject:v8 forKeyedSubscript:@"errCode"];

  if (v5) {
    ((void (**)(void, id, void *))v5)[2](v5, v9, v6);
  }
}

- (id)deviceManagerConnection
{
  return 0;
}

void __32__ICDeviceManager_remoteManager__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    __ICOSLogCreate();
    id v4 = @"remoteManager";
    if ((unint64_t)[@"remoteManager" length] >= 0x15)
    {
      uint64_t v5 = objc_msgSend(@"remoteManager", "substringWithRange:", 0, 18);
      id v4 = [v5 stringByAppendingString:@".."];
    }
    id v6 = [NSString stringWithFormat:@"%@", v3];
    uint64_t v7 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v4;
      id v9 = v7;
      *(_DWORD *)buf = 136446466;
      uint64_t v11 = [(__CFString *)v8 UTF8String];
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_1BEEFF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    if ([v3 code] == 4099) {
      objc_msgSend(*(id *)(a1 + 32), "setManagerInvalidationCount:", objc_msgSend(*(id *)(a1 + 32), "managerInvalidationCount") + 1);
    }
  }
}

void __42__ICDeviceManager_openRemoteDeviceManager__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  id v3 = [*(id *)(v1 + 40) devices];
  id v4 = [v3 allKeys];
  uint64_t v5 = (void *)[v4 copy];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = @"Device ▼";
    uint64_t v9 = *(void *)v36;
    unint64_t v10 = 0x1E4F29000uLL;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        __ICOSLogCreate();
        id v32 = v8;
        if ((unint64_t)[(__CFString *)v8 length] >= 0x15)
        {
          __int16 v12 = -[__CFString substringWithRange:](v8, "substringWithRange:", 0, 18);
          id v32 = [v12 stringByAppendingString:@".."];
        }
        id v13 = *(void **)(v10 + 24);
        uint64_t v14 = (objc_class *)objc_opt_class();
        id v15 = NSStringFromClass(v14);
        id v16 = [v13 stringWithFormat:@"%@ - %@", v15, v33];

        uint64_t v17 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v18 = v10;
          id v19 = v8;
          uint64_t v20 = v7;
          uint64_t v21 = v9;
          uint64_t v22 = v1;
          id v23 = v2;
          id v24 = v32;
          long long v25 = v17;
          long long v26 = v24;
          id v2 = v23;
          uint64_t v1 = v22;
          uint64_t v9 = v21;
          uint64_t v7 = v20;
          uint64_t v8 = v19;
          unint64_t v10 = v18;
          uint64_t v27 = [v26 UTF8String];
          *(_DWORD *)buf = 136446466;
          uint64_t v42 = v27;
          __int16 v43 = 2114;
          v44 = v16;
          _os_log_impl(&dword_1BEEFF000, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
        v39 = @"ICDeviceHandle";
        uint64_t v40 = v33;
        v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        [v2 notifyRemovedDevice:v28];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v7);
  }

  [v2 setManagerConnection:0];
  double v29 = drand48();
  dispatch_time_t v30 = dispatch_time(0, (uint64_t)(v29 + 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__ICDeviceManager_openRemoteDeviceManager__block_invoke_256;
  block[3] = &unk_1E63D72A8;
  block[4] = *(void *)(v1 + 40);
  dispatch_after(v30, MEMORY[0x1E4F14428], block);
}

uint64_t __42__ICDeviceManager_openRemoteDeviceManager__block_invoke_256(uint64_t a1)
{
  return [*(id *)(a1 + 32) restartRunning];
}

- (void)dealloc
{
  [(ICDeviceManager *)self resumeOperations];
  [(NSOperationQueue *)self->_deviceOperationQueue cancelAllOperations];
  [(NSOperationQueue *)self->_deviceOperationQueue waitUntilAllOperationsAreFinished];
  v3.receiver = self;
  v3.super_class = (Class)ICDeviceManager;
  [(ICDeviceManager *)&v3 dealloc];
}

- (id)deviceForConnection:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_devices allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v10];
        __int16 v12 = [v11 devConnection];
        int v13 = [v12 isEqual:v4];

        if (v13)
        {
          uint64_t v14 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 0;
LABEL_11:

  return v14;
}

- (id)deviceForUUID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_devices allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v10];
        __int16 v12 = [v11 internalUUID];
        int v13 = [v12 isEqual:v4];

        if (v13)
        {
          uint64_t v14 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 0;
LABEL_11:

  return v14;
}

- (int64_t)openDevice:(id)a3 contextInfo:(void *)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v17[0] = a3;
  v16[0] = @"params";
  v16[1] = @"info";
  uint64_t v6 = NSNumber;
  id v7 = a3;
  uint64_t v8 = [v6 numberWithUnsignedLong:a4];
  v17[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  uint64_t v10 = (void *)MEMORY[0x1E4F28B48];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __42__ICDeviceManager_openDevice_contextInfo___block_invoke;
  v14[3] = &unk_1E63D72D0;
  void v14[4] = self;
  id v15 = v9;
  id v11 = v9;
  __int16 v12 = [v10 blockOperationWithBlock:v14];
  [(ICDeviceManager *)self addInteractiveOperation:v12];

  return 0;
}

uint64_t __42__ICDeviceManager_openDevice_contextInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) openDeviceImp:*(void *)(a1 + 40)];
}

- (int64_t)closeDevice:(id)a3 contextInfo:(void *)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v17[0] = a3;
  v16[0] = @"device";
  v16[1] = @"info";
  uint64_t v6 = NSNumber;
  id v7 = a3;
  uint64_t v8 = [v6 numberWithUnsignedLong:a4];
  v17[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  uint64_t v10 = (void *)MEMORY[0x1E4F28B48];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __43__ICDeviceManager_closeDevice_contextInfo___block_invoke;
  v14[3] = &unk_1E63D72D0;
  void v14[4] = self;
  id v15 = v9;
  id v11 = v9;
  __int16 v12 = [v10 blockOperationWithBlock:v14];
  [(ICDeviceManager *)self addInteractiveOperation:v12];

  return 0;
}

uint64_t __43__ICDeviceManager_closeDevice_contextInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeDeviceImp:*(void *)(a1 + 40)];
}

- (int64_t)getFileThumbnail:(id)a3 fromDevice:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  v22[4] = *MEMORY[0x1E4F143B8];
  v21[0] = @"file";
  v21[1] = @"device";
  v22[0] = a3;
  v22[1] = a4;
  v21[2] = @"cbBlock";
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  int v13 = (void *)[a6 copy];
  v21[3] = @"options";
  v22[2] = v13;
  v22[3] = v10;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];

  id v15 = (void *)MEMORY[0x1E4F28B48];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__ICDeviceManager_getFileThumbnail_fromDevice_withOptions_completion___block_invoke;
  v19[3] = &unk_1E63D72D0;
  v19[4] = self;
  id v20 = v14;
  id v16 = v14;
  long long v17 = [v15 blockOperationWithBlock:v19];
  [(ICDeviceManager *)self addInteractiveOperation:v17];

  return 0;
}

uint64_t __70__ICDeviceManager_getFileThumbnail_fromDevice_withOptions_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) getFileThumbnailImp:*(void *)(a1 + 40)];
}

- (int64_t)getFileMetadata:(id)a3 fromDevice:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  v20[3] = *MEMORY[0x1E4F143B8];
  v19[0] = @"file";
  v19[1] = @"device";
  v20[0] = a3;
  v20[1] = a4;
  v19[2] = @"cbBlock";
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[a6 copy];
  v20[2] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  int v13 = (void *)MEMORY[0x1E4F28B48];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__ICDeviceManager_getFileMetadata_fromDevice_withOptions_completion___block_invoke;
  void v17[3] = &unk_1E63D72D0;
  v17[4] = self;
  id v18 = v12;
  id v14 = v12;
  id v15 = [v13 blockOperationWithBlock:v17];
  [(ICDeviceManager *)self addInteractiveOperation:v15];

  return 0;
}

uint64_t __69__ICDeviceManager_getFileMetadata_fromDevice_withOptions_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) getFileMetadataImp:*(void *)(a1 + 40)];
}

- (int64_t)getFileData:(id)a3 fromDevice:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  v22[4] = *MEMORY[0x1E4F143B8];
  v21[0] = @"file";
  v21[1] = @"device";
  v22[0] = a3;
  v22[1] = a4;
  v21[2] = @"cbBlock";
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  int v13 = (void *)[a6 copy];
  v21[3] = @"options";
  v22[2] = v13;
  v22[3] = v10;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];

  id v15 = (void *)MEMORY[0x1E4F28B48];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__ICDeviceManager_getFileData_fromDevice_withOptions_completion___block_invoke;
  void v19[3] = &unk_1E63D72D0;
  v19[4] = self;
  id v20 = v14;
  id v16 = v14;
  long long v17 = [v15 blockOperationWithBlock:v19];
  [(ICDeviceManager *)self addInteractiveOperation:v17];

  return 0;
}

uint64_t __65__ICDeviceManager_getFileData_fromDevice_withOptions_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) getFileDataImp:*(void *)(a1 + 40)];
}

- (int64_t)openSession:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v9 = (id)MEMORY[0x1E4F1CC08];
  if (a4) {
    id v9 = a4;
  }
  v21[0] = @"device";
  v21[1] = @"options";
  v22[0] = a3;
  v22[1] = v9;
  v21[2] = @"cbBlock";
  id v10 = v9;
  id v11 = a4;
  id v12 = a3;
  int v13 = (void *)[a5 copy];
  v22[2] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  id v15 = (void *)MEMORY[0x1E4F28B48];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__ICDeviceManager_openSession_withOptions_completion___block_invoke;
  void v19[3] = &unk_1E63D72D0;
  v19[4] = self;
  id v20 = v14;
  id v16 = v14;
  long long v17 = [v15 blockOperationWithBlock:v19];
  [(ICDeviceManager *)self addInteractiveOperation:v17];

  return 0;
}

uint64_t __54__ICDeviceManager_openSession_withOptions_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) openSessionImp:*(void *)(a1 + 40)];
}

- (int64_t)enumerateContent:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v9 = (id)MEMORY[0x1E4F1CC08];
  if (a4) {
    id v9 = a4;
  }
  v21[0] = @"device";
  v21[1] = @"options";
  v22[0] = a3;
  v22[1] = v9;
  v21[2] = @"cbBlock";
  id v10 = v9;
  id v11 = a4;
  id v12 = a3;
  int v13 = (void *)[a5 copy];
  v22[2] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  id v15 = (void *)MEMORY[0x1E4F28B48];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59__ICDeviceManager_enumerateContent_withOptions_completion___block_invoke;
  void v19[3] = &unk_1E63D72D0;
  v19[4] = self;
  id v20 = v14;
  id v16 = v14;
  long long v17 = [v15 blockOperationWithBlock:v19];
  [(ICDeviceManager *)self addInteractiveOperation:v17];

  return 0;
}

uint64_t __59__ICDeviceManager_enumerateContent_withOptions_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateContentImp:*(void *)(a1 + 40)];
}

- (int64_t)closeSession:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v17[0] = a3;
  v16[0] = @"device";
  v16[1] = @"cbBlock";
  id v7 = a3;
  uint64_t v8 = (void *)[a5 copy];
  v17[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  id v10 = (void *)MEMORY[0x1E4F28B48];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __55__ICDeviceManager_closeSession_withOptions_completion___block_invoke;
  v14[3] = &unk_1E63D72D0;
  void v14[4] = self;
  id v15 = v9;
  id v11 = v9;
  id v12 = [v10 blockOperationWithBlock:v14];
  [(ICDeviceManager *)self addInteractiveOperation:v12];

  return 0;
}

uint64_t __55__ICDeviceManager_closeSession_withOptions_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeSessionImp:*(void *)(a1 + 40)];
}

- (int64_t)syncClock:(id)a3 completion:(id)a4
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v16[0] = a3;
  v15[0] = @"device";
  v15[1] = @"cbBlock";
  id v6 = a3;
  id v7 = (void *)[a4 copy];
  v16[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  id v9 = (void *)MEMORY[0x1E4F28B48];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__ICDeviceManager_syncClock_completion___block_invoke;
  v13[3] = &unk_1E63D72D0;
  v13[4] = self;
  id v14 = v8;
  id v10 = v8;
  id v11 = [v9 blockOperationWithBlock:v13];
  [(ICDeviceManager *)self addInitiatedOperation:v11];

  return 0;
}

uint64_t __40__ICDeviceManager_syncClock_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncClockImp:*(void *)(a1 + 40)];
}

- (int64_t)deleteFile:(id)a3 fromDevice:(id)a4 completion:(id)a5
{
  void v19[3] = *MEMORY[0x1E4F143B8];
  v18[0] = @"file";
  v18[1] = @"device";
  v19[0] = a3;
  v19[1] = a4;
  v18[2] = @"cbBlock";
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[a5 copy];
  v19[2] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

  id v12 = (void *)MEMORY[0x1E4F28B48];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __52__ICDeviceManager_deleteFile_fromDevice_completion___block_invoke;
  void v16[3] = &unk_1E63D72D0;
  v16[4] = self;
  id v17 = v11;
  id v13 = v11;
  id v14 = [v12 blockOperationWithBlock:v16];
  [(ICDeviceManager *)self addInteractiveOperation:v14];

  return 0;
}

uint64_t __52__ICDeviceManager_deleteFile_fromDevice_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteFileImp:*(void *)(a1 + 40)];
}

- (int64_t)downloadFile:(id)a3 fromDevice:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  void v22[4] = *MEMORY[0x1E4F143B8];
  v21[0] = @"file";
  v21[1] = @"device";
  v22[0] = a3;
  v22[1] = a4;
  v22[2] = a5;
  v21[2] = @"opts";
  void v21[3] = @"cbBlock";
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)[a6 copy];
  v22[3] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];

  id v15 = (void *)MEMORY[0x1E4F28B48];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__ICDeviceManager_downloadFile_fromDevice_withOptions_completion___block_invoke;
  void v19[3] = &unk_1E63D72D0;
  void v19[4] = self;
  id v20 = v14;
  id v16 = v14;
  id v17 = [v15 blockOperationWithBlock:v19];
  [(ICDeviceManager *)self addInteractiveOperation:v17];

  return 0;
}

uint64_t __66__ICDeviceManager_downloadFile_fromDevice_withOptions_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) downloadFileImp:*(void *)(a1 + 40)];
}

- (int64_t)sendDevice:(id)a3 ptpCommand:(id)a4 andPayload:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __63__ICDeviceManager_sendDevice_ptpCommand_andPayload_completion___block_invoke;
  v26[3] = &unk_1E63D7BA0;
  id v14 = v10;
  id v27 = v14;
  id v15 = v11;
  id v28 = v15;
  id v16 = v13;
  id v31 = v16;
  id v17 = v12;
  id v29 = v17;
  dispatch_time_t v30 = self;
  uint64_t v18 = MEMORY[0x1C18A01C0](v26);
  long long v19 = (void (**)(void))v18;
  if (self->_controlAuthorizedOnce)
  {
    (*(void (**)(uint64_t))(v18 + 16))(v18);
  }
  else
  {
    id v20 = +[ICPrefManager defaultAuthManager];
    uint64_t v21 = [v20 getControlAuthorizationStatus];
    int v22 = [v21 isEqualToString:@"ICAuthorizationStatusAuthorized"];

    if (v22)
    {
      v19[2](v19);
      [(ICDeviceManager *)self setControlAuthorizedOnce:1];
    }
    else
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __63__ICDeviceManager_sendDevice_ptpCommand_andPayload_completion___block_invoke_3;
      v24[3] = &unk_1E63D7BC8;
      v24[4] = self;
      long long v25 = v19;
      [v20 requestControlAuthorizationShouldPrompt:1 completion:v24];
    }
  }

  return 0;
}

void __63__ICDeviceManager_sendDevice_ptpCommand_andPayload_completion___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = (void *)[*(id *)(a1 + 64) copy];
  id v6 = objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"device", v4, @"ICPTPCommandBuffer", v5, @"cbBlock", 0);

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    [v6 setObject:v7 forKeyedSubscript:@"ICPTPDataBuffer"];
  }
  id v8 = *(void **)(a1 + 56);
  id v9 = (void *)MEMORY[0x1E4F28B48];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__ICDeviceManager_sendDevice_ptpCommand_andPayload_completion___block_invoke_2;
  v12[3] = &unk_1E63D72D0;
  v12[4] = v8;
  id v13 = v6;
  id v10 = v6;
  id v11 = [v9 blockOperationWithBlock:v12];
  [v8 addInteractiveOperation:v11];
}

uint64_t __63__ICDeviceManager_sendDevice_ptpCommand_andPayload_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendDevicePTPCommandImp:*(void *)(a1 + 40)];
}

void __63__ICDeviceManager_sendDevice_ptpCommand_andPayload_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"ICAuthorizationStatus"];
  if ([v3 isEqualToString:@"ICAuthorizationStatusAuthorized"])
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) setControlAuthorizedOnce:1];
  }
}

- (int64_t)registerDevice:(id)a3 forImageCaptureEventNotifications:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F28B48];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__ICDeviceManager_registerDevice_forImageCaptureEventNotifications___block_invoke;
  v13[3] = &unk_1E63D7700;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 blockOperationWithBlock:v13];
  [(ICDeviceManager *)self addInteractiveOperation:v11];

  return 0;
}

uint64_t __68__ICDeviceManager_registerDevice_forImageCaptureEventNotifications___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerDevice:*(void *)(a1 + 40) forImageCaptureEventNotificationsImp:*(void *)(a1 + 48)];
}

- (int64_t)unregisterDevice:(id)a3 forImageCaptureEventNotifications:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F28B48];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__ICDeviceManager_unregisterDevice_forImageCaptureEventNotifications___block_invoke;
  v13[3] = &unk_1E63D7700;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 blockOperationWithBlock:v13];
  [(ICDeviceManager *)self addInteractiveOperation:v11];

  return 0;
}

uint64_t __70__ICDeviceManager_unregisterDevice_forImageCaptureEventNotifications___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unregisterDevice:*(void *)(a1 + 40) forImageCaptureEventNotificationsImp:*(void *)(a1 + 48)];
}

- (int64_t)ejectDevice:(id)a3 completion:(id)a4
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v16[0] = a3;
  v15[0] = @"device";
  v15[1] = @"cbBlock";
  id v6 = a3;
  id v7 = (void *)[a4 copy];
  v16[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  id v9 = (void *)MEMORY[0x1E4F28B48];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__ICDeviceManager_ejectDevice_completion___block_invoke;
  v13[3] = &unk_1E63D72D0;
  v13[4] = self;
  id v14 = v8;
  id v10 = v8;
  id v11 = [v9 blockOperationWithBlock:v13];
  [(ICDeviceManager *)self addInteractiveOperation:v11];

  return 0;
}

uint64_t __42__ICDeviceManager_ejectDevice_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) ejectImp:*(void *)(a1 + 40)];
}

- (int64_t)getSecurityScopedURL:(id)a3 fromDevice:(id)a4 completion:(id)a5
{
  void v19[3] = *MEMORY[0x1E4F143B8];
  v18[0] = @"file";
  v18[1] = @"device";
  v19[0] = a3;
  v19[1] = a4;
  v18[2] = @"cbBlock";
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[a5 copy];
  v19[2] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

  id v12 = (void *)MEMORY[0x1E4F28B48];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __62__ICDeviceManager_getSecurityScopedURL_fromDevice_completion___block_invoke;
  void v16[3] = &unk_1E63D72D0;
  v16[4] = self;
  id v17 = v11;
  id v13 = v11;
  id v14 = [v12 blockOperationWithBlock:v16];
  [(ICDeviceManager *)self addInteractiveOperation:v14];

  return 0;
}

uint64_t __62__ICDeviceManager_getSecurityScopedURL_fromDevice_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) getSecurityScopedURLImp:*(void *)(a1 + 40)];
}

- (int64_t)refreshObjectHandleInfo:(id)a3 fromDevice:(id)a4 completion:(id)a5
{
  void v19[3] = *MEMORY[0x1E4F143B8];
  v18[0] = @"file";
  v18[1] = @"device";
  v19[0] = a3;
  v19[1] = a4;
  v18[2] = @"cbBlock";
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[a5 copy];
  v19[2] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

  id v12 = (void *)MEMORY[0x1E4F28B48];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __65__ICDeviceManager_refreshObjectHandleInfo_fromDevice_completion___block_invoke;
  void v16[3] = &unk_1E63D72D0;
  v16[4] = self;
  id v17 = v11;
  id v13 = v11;
  id v14 = [v12 blockOperationWithBlock:v16];
  [(ICDeviceManager *)self addInteractiveOperation:v14];

  return 0;
}

uint64_t __65__ICDeviceManager_refreshObjectHandleInfo_fromDevice_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshObjectHandleInfoImp:*(void *)(a1 + 40)];
}

- (int64_t)getFingerprint:(id)a3 fromDevice:(id)a4 completion:(id)a5
{
  void v19[3] = *MEMORY[0x1E4F143B8];
  v18[0] = @"file";
  v18[1] = @"device";
  v19[0] = a3;
  v19[1] = a4;
  v18[2] = @"cbBlock";
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[a5 copy];
  v19[2] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

  id v12 = (void *)MEMORY[0x1E4F28B48];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __56__ICDeviceManager_getFingerprint_fromDevice_completion___block_invoke;
  void v16[3] = &unk_1E63D72D0;
  v16[4] = self;
  id v17 = v11;
  id v13 = v11;
  id v14 = [v12 blockOperationWithBlock:v16];
  [(ICDeviceManager *)self addInteractiveOperation:v14];

  return 0;
}

uint64_t __56__ICDeviceManager_getFingerprint_fromDevice_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) getFingerprintImp:*(void *)(a1 + 40)];
}

- (void)postCommandCompletionNotification:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ICDeviceManager_postCommandCompletionNotification___block_invoke;
  block[3] = &unk_1E63D72A8;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __53__ICDeviceManager_postCommandCompletionNotification___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICCommandCompletionNotification" object:0 userInfo:*(void *)(a1 + 32)];
}

- (void)postNotification:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __ICOSLogCreate();
  uint64_t v5 = @"post";
  if ((unint64_t)[@"post" length] >= 0x15)
  {
    id v6 = objc_msgSend(@"post", "substringWithRange:", 0, 18);
    uint64_t v5 = [v6 stringByAppendingString:@".."];
  }
  id v7 = [NSString stringWithFormat:@"Device Posted: %@", v4];
  id v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v5;
    id v10 = v8;
    *(_DWORD *)buf = 136446466;
    uint64_t v19 = [(__CFString *)v9 UTF8String];
    __int16 v20 = 2114;
    uint64_t v21 = v7;
    _os_log_impl(&dword_1BEEFF000, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  id v11 = (void *)[v4 mutableCopy];
  id v12 = [v11 objectForKeyedSubscript:@"ICInternalDeviceUUID"];
  if (v12)
  {
    id v13 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v12];

    if (v13)
    {
      id v14 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v12];
      [v11 setObject:v14 forKeyedSubscript:@"device"];
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ICDeviceManager_postNotification___block_invoke;
  block[3] = &unk_1E63D72A8;
  id v17 = v11;
  id v15 = v11;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __36__ICDeviceManager_postNotification___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICEventNotification" object:0 userInfo:*(void *)(a1 + 32)];
}

- (void)addInitiatedOperation:(id)a3
{
  id v4 = a3;
  [v4 setQueuePriority:0];
  [v4 setQualityOfService:25];
  [(NSOperationQueue *)self->_deviceOperationQueue addOperation:v4];
}

- (void)addInteractiveOperation:(id)a3
{
  id v4 = a3;
  [v4 setQueuePriority:4];
  [v4 setQualityOfService:33];
  [(NSOperationQueue *)self->_deviceOperationQueue addOperation:v4];
}

- (void)suspendOperations
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_deviceOperationQueueLock = &self->_deviceOperationQueueLock;
  os_unfair_lock_lock(&self->_deviceOperationQueueLock);
  if (!self->_deviceOperationQueueSuspended)
  {
    __ICOSLogCreate();
    id v4 = @"Restriction";
    if ((unint64_t)[@"Restriction" length] >= 0x15)
    {
      uint64_t v5 = objc_msgSend(@"Restriction", "substringWithRange:", 0, 18);
      id v4 = [v5 stringByAppendingString:@".."];
    }
    id v6 = [NSString stringWithFormat:@"Removing device access: backgrounded"];
    id v7 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v4;
      id v9 = v7;
      int v10 = 136446466;
      uint64_t v11 = [(__CFString *)v8 UTF8String];
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_1BEEFF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v10, 0x16u);
    }
    self->_deviceOperationQueueSuspended = 1;
    [(NSOperationQueue *)self->_deviceOperationQueue setSuspended:1];
  }
  os_unfair_lock_unlock(p_deviceOperationQueueLock);
}

- (void)resumeOperations
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_deviceOperationQueueLock = &self->_deviceOperationQueueLock;
  os_unfair_lock_lock(&self->_deviceOperationQueueLock);
  if (self->_deviceOperationQueueSuspended)
  {
    __ICOSLogCreate();
    id v4 = @"Restriction";
    if ((unint64_t)[@"Restriction" length] >= 0x15)
    {
      uint64_t v5 = objc_msgSend(@"Restriction", "substringWithRange:", 0, 18);
      id v4 = [v5 stringByAppendingString:@".."];
    }
    id v6 = [NSString stringWithFormat:@"Device access allowed: foreground"];
    id v7 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v4;
      id v9 = v7;
      int v10 = 136446466;
      uint64_t v11 = [(__CFString *)v8 UTF8String];
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_1BEEFF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v10, 0x16u);
    }
    self->_deviceOperationQueueSuspended = 0;
    [(NSOperationQueue *)self->_deviceOperationQueue setSuspended:0];
  }
  os_unfair_lock_unlock(p_deviceOperationQueueLock);
}

- (void)setDeviceOperationQueueName:(id)a3
{
}

- (void)setDeviceOperationQueueMaxConcurrentOperationCount:(unint64_t)a3
{
}

- (NSDictionary)deviceMatchingInfo
{
  return self->_deviceMatchingInfo;
}

- (void)setDeviceMatchingInfo:(id)a3
{
}

- (NSOperationQueue)deviceOperationQueue
{
  return self->_deviceOperationQueue;
}

- (void)setDeviceOperationQueue:(id)a3
{
}

- (os_unfair_lock_s)deviceOperationQueueLock
{
  return self->_deviceOperationQueueLock;
}

- (void)setDeviceOperationQueueLock:(os_unfair_lock_s)a3
{
  self->_deviceOperationQueueLock = a3;
}

- (BOOL)deviceOperationQueueSuspended
{
  return self->_deviceOperationQueueSuspended;
}

- (void)setDeviceOperationQueueSuspended:(BOOL)a3
{
  self->_deviceOperationQueueSuspended = a3;
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (NSMutableArray)deviceHandles
{
  return self->_deviceHandles;
}

- (void)setDeviceHandles:(id)a3
{
}

- (os_unfair_lock_s)deviceHandlesLock
{
  return self->_deviceHandlesLock;
}

- (void)setDeviceHandlesLock:(os_unfair_lock_s)a3
{
  self->_deviceHandlesLock = a3;
}

- (BOOL)managerIsRunning
{
  return self->_managerIsRunning;
}

- (void)setManagerIsRunning:(BOOL)a3
{
  self->_managerIsRunning = a3;
}

- (void)setManagerInvalidationCount:(unsigned int)a3
{
  self->_managerInvalidationCount = a3;
}

- (BOOL)controlAuthorizedOnce
{
  return self->_controlAuthorizedOnce;
}

- (void)setControlAuthorizedOnce:(BOOL)a3
{
  self->_controlAuthorizedOnce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceHandles, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_managerConnection, 0);
  objc_storeStrong((id *)&self->_deviceOperationQueue, 0);

  objc_storeStrong((id *)&self->_deviceMatchingInfo, 0);
}

@end