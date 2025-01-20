@interface ICCameraDeviceBrowser
+ (BOOL)exists;
+ (id)defaultBrowser;
- (BOOL)startMSCameraBrowser;
- (BOOL)startPTPCameraBrowser;
- (BOOL)startPXCameraBrowser;
- (ICCameraDeviceBrowser)init;
- (MSCameraDeviceManager)msDevManager;
- (NSMutableArray)browsers;
- (NSMutableArray)devices;
- (OS_dispatch_queue)suspensionTimerQueue;
- (OS_dispatch_source)suspensionTimer;
- (PTPCameraDeviceManager)ptpDevManager;
- (id)deviceWithDelegate:(id)a3;
- (void)addBrowser:(id)a3;
- (void)dealloc;
- (void)handleCommandCompletionNotification:(id)a3;
- (void)handleImageCaptureEventNotification:(id)a3;
- (void)notifySuspension:(unint64_t)a3;
- (void)removeBrowser:(id)a3;
- (void)runSuspensionTimer:(BOOL)a3;
- (void)setMsDevManager:(id)a3;
- (void)setPtpDevManager:(id)a3;
- (void)setSuspensionTimer:(id)a3;
- (void)setSuspensionTimerQueue:(id)a3;
- (void)start:(id)a3;
- (void)stop:(id)a3;
@end

@implementation ICCameraDeviceBrowser

- (void)start:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(ICCameraDeviceBrowser *)self addBrowser:v4];
  if (self->_numberOfBrowsingBrowsers)
  {
    v5 = [(ICCameraDeviceBrowser *)self devices];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v7 = [(ICCameraDeviceBrowser *)self devices];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            [v4 addDevice:*(void *)(*((void *)&v18 + 1) + 8 * i) moreComing:v6 - 1 != i];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
          v6 -= i;
        }
        while (v9);
      }
    }
  }
  else
  {
    __ICOSLogCreate();
    v12 = @"CameraBrowser";
    if ((unint64_t)[@"CameraBrowser" length] >= 0x15)
    {
      v13 = objc_msgSend(@"CameraBrowser", "substringWithRange:", 0, 18);
      v12 = [v13 stringByAppendingString:@".."];
    }
    v14 = [NSString stringWithFormat:@"Start Browsing"];
    v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v12;
      v17 = v15;
      *(_DWORD *)buf = 136446466;
      uint64_t v24 = [(__CFString *)v16 UTF8String];
      __int16 v25 = 2114;
      v26 = v14;
      _os_log_impl(&dword_1BEEFF000, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    [(ICCameraDeviceBrowser *)self startPXCameraBrowser];
    [(ICCameraDeviceBrowser *)self startMSCameraBrowser];
    [(ICCameraDeviceBrowser *)self startPTPCameraBrowser];
  }
  ++self->_numberOfBrowsingBrowsers;
}

- (BOOL)startMSCameraBrowser
{
  msDevManager = self->_msDevManager;
  if (!msDevManager)
  {
    id v4 = objc_alloc_init(MSCameraDeviceManager);
    v5 = self->_msDevManager;
    self->_msDevManager = v4;

    [(ICDeviceManager *)self->_msDevManager startRunning];
    msDevManager = self->_msDevManager;
  }
  return msDevManager != 0;
}

- (BOOL)startPTPCameraBrowser
{
  ptpDevManager = self->_ptpDevManager;
  if (!ptpDevManager)
  {
    id v4 = objc_alloc_init(PTPCameraDeviceManager);
    v5 = self->_ptpDevManager;
    self->_ptpDevManager = v4;

    [(ICDeviceManager *)self->_ptpDevManager startRunning];
    ptpDevManager = self->_ptpDevManager;
  }
  return ptpDevManager != 0;
}

+ (id)defaultBrowser
{
  v2 = (void *)_sCameraDeviceBrowser;
  if (!_sCameraDeviceBrowser)
  {
    v3 = objc_alloc_init(ICCameraDeviceBrowser);
    id v4 = (void *)_sCameraDeviceBrowser;
    _sCameraDeviceBrowser = (uint64_t)v3;

    v2 = (void *)_sCameraDeviceBrowser;
  }

  return v2;
}

+ (BOOL)exists
{
  return _sCameraDeviceBrowser != 0;
}

- (ICCameraDeviceBrowser)init
{
  v31.receiver = self;
  v31.super_class = (Class)ICCameraDeviceBrowser;
  v2 = [(ICCameraDeviceBrowser *)&v31 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    devices = v2->_devices;
    v2->_devices = (NSMutableArray *)v3;

    v2->_numberOfBrowsingBrowsers = 0;
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    browsers = v2->_browsers;
    v2->_browsers = (NSMutableArray *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    suspendedBrowsers = v2->_suspendedBrowsers;
    v2->_suspendedBrowsers = (NSMutableArray *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("ic.suspensionQueue", 0);
    [(ICCameraDeviceBrowser *)v2 setSuspensionTimerQueue:v9];

    [(ICCameraDeviceBrowser *)v2 setSuspensionTimer:0];
    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v2 selector:sel_handleCommandCompletionNotification_ name:@"ICCommandCompletionNotification" object:0];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v2 selector:sel_handleImageCaptureEventNotification_ name:@"ICEventNotification" object:0];

    v12 = [MEMORY[0x1E4F28B50] mainBundle];
    v13 = [v12 bundleIdentifier];

    if (([v13 isEqualToString:@"com.apple.mobileslideshow"] & 1) == 0
      && ([v13 isEqualToString:@"com.apple.camera"] & 1) == 0)
    {
      v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __29__ICCameraDeviceBrowser_init__block_invoke;
      v29[3] = &unk_1E63D7AD8;
      v15 = v2;
      v30 = v15;
      id v16 = (id)[v14 addObserverForName:@"UIApplicationDidEnterBackgroundNotification" object:0 queue:0 usingBlock:v29];

      v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __29__ICCameraDeviceBrowser_init__block_invoke_2;
      v27[3] = &unk_1E63D7AD8;
      v28 = v15;
      id v18 = (id)[v17 addObserverForName:@"UIApplicationDidBecomeActiveNotification" object:0 queue:0 usingBlock:v27];
    }
    long long v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __29__ICCameraDeviceBrowser_init__block_invoke_3;
    v25[3] = &unk_1E63D7AD8;
    v26 = v2;
    id v20 = (id)[v19 addObserverForName:@"UIApplicationWillTerminateNotification" object:0 queue:0 usingBlock:v25];

    __ICReadPrefs();
    long long v21 = [MEMORY[0x1E4F1C9C8] date];
    [v21 timeIntervalSince1970];
    double v23 = v22;

    srand48((uint64_t)v23);
  }
  return v2;
}

uint64_t __29__ICCameraDeviceBrowser_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) runSuspensionTimer:1];
}

uint64_t __29__ICCameraDeviceBrowser_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) runSuspensionTimer:0];
}

void __29__ICCameraDeviceBrowser_init__block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) msDevManager];
  [v2 stopRunning];

  uint64_t v3 = [*(id *)(a1 + 32) ptpDevManager];
  [v3 stopRunning];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "browsers", 0);
  uint64_t v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(a1 + 32) stop:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)runSuspensionTimer:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__ICCameraDeviceBrowser_runSuspensionTimer___block_invoke;
  v3[3] = &unk_1E63D7B00;
  BOOL v4 = a3;
  v3[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __44__ICCameraDeviceBrowser_runSuspensionTimer___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    BOOL v4 = [v3 suspensionTimer];

    if (!v4)
    {
      [*(id *)(a1 + 32) notifySuspension:2];
      __ICOSLogCreate();
      uint64_t v5 = @"[**-> Notify]";
      if ((unint64_t)[@"[**-> Notify]" length] >= 0x15)
      {
        uint64_t v6 = objc_msgSend(@"[**-> Notify]", "substringWithRange:", 0, 18);
        uint64_t v5 = [v6 stringByAppendingString:@".."];
      }
      uint64_t v7 = [NSString stringWithFormat:@"Cleanup timer start, notify suspension pending."];
      uint64_t v8 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = v5;
        long long v10 = v8;
        *(_DWORD *)buf = 136446466;
        uint64_t v20 = [(__CFString *)v9 UTF8String];
        __int16 v21 = 2114;
        double v22 = v7;
        _os_log_impl(&dword_1BEEFF000, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      long long v11 = [*(id *)(a1 + 32) suspensionTimerQueue];
      dispatch_source_t v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v11);
      [*(id *)(a1 + 32) setSuspensionTimer:v12];
    }
    long long v13 = [*(id *)(a1 + 32) suspensionTimer];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __44__ICCameraDeviceBrowser_runSuspensionTimer___block_invoke_39;
    handler[3] = &unk_1E63D72A8;
    handler[4] = *(void *)(a1 + 32);
    dispatch_source_set_event_handler(v13, handler);

    v14 = [*(id *)(a1 + 32) suspensionTimer];
    dispatch_time_t v15 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);

    id v16 = [*(id *)(a1 + 32) suspensionTimer];
    dispatch_activate(v16);
  }
  else
  {
    id v16 = [v3 suspensionTimerQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __44__ICCameraDeviceBrowser_runSuspensionTimer___block_invoke_47;
    v17[3] = &unk_1E63D72A8;
    v17[4] = *(void *)(a1 + 32);
    dispatch_sync(v16, v17);
  }
}

void __44__ICCameraDeviceBrowser_runSuspensionTimer___block_invoke_39(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) suspensionTimer];
  dispatch_source_cancel(v2);

  [*(id *)(a1 + 32) setSuspensionTimer:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__ICCameraDeviceBrowser_runSuspensionTimer___block_invoke_2;
  block[3] = &unk_1E63D72A8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __44__ICCameraDeviceBrowser_runSuspensionTimer___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  __ICOSLogCreate();
  int v2 = @"[**-> Suspend]";
  if ((unint64_t)[@"[**-> Suspend]" length] >= 0x15)
  {
    uint64_t v3 = objc_msgSend(@"[**-> Suspend]", "substringWithRange:", 0, 18);
    int v2 = [v3 stringByAppendingString:@".."];
  }
  BOOL v4 = [NSString stringWithFormat:@"Cleanup time limit reached, hard suspending queues."];
  uint64_t v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v2;
    uint64_t v7 = v5;
    int v10 = 136446466;
    uint64_t v11 = [(__CFString *)v6 UTF8String];
    __int16 v12 = 2114;
    long long v13 = v4;
    _os_log_impl(&dword_1BEEFF000, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v10, 0x16u);
  }
  [*(id *)(a1 + 32) notifySuspension:3];
  uint64_t v8 = [*(id *)(a1 + 32) msDevManager];
  [v8 suspendOperations];

  uint64_t v9 = [*(id *)(a1 + 32) ptpDevManager];
  [v9 suspendOperations];
}

uint64_t __44__ICCameraDeviceBrowser_runSuspensionTimer___block_invoke_47(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) suspensionTimer];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) suspensionTimer];
    dispatch_source_cancel(v3);

    [*(id *)(a1 + 32) setSuspensionTimer:0];
    __ICOSLogCreate();
    BOOL v4 = @"[**-> Cancel]";
    if ((unint64_t)[@"[**-> Cancel]" length] >= 0x15)
    {
      uint64_t v5 = objc_msgSend(@"[**-> Cancel]", "substringWithRange:", 0, 18);
      BOOL v4 = [v5 stringByAppendingString:@".."];
    }
    uint64_t v6 = [NSString stringWithFormat:@"Foregrounded before time limit reached, cancel suspension."];
    uint64_t v7 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v4;
      uint64_t v9 = v7;
      int v19 = 136446466;
      uint64_t v20 = [(__CFString *)v8 UTF8String];
      __int16 v21 = 2114;
      double v22 = v6;
      _os_log_impl(&dword_1BEEFF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v10 = 1;
  }
  else
  {
    __ICOSLogCreate();
    uint64_t v11 = @"[**-> Resume]";
    if ((unint64_t)[@"[**-> Resume]" length] >= 0x15)
    {
      __int16 v12 = objc_msgSend(@"[**-> Resume]", "substringWithRange:", 0, 18);
      uint64_t v11 = [v12 stringByAppendingString:@".."];
    }
    long long v13 = [NSString stringWithFormat:@"Foregrounded application, resuming queues."];
    uint64_t v14 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v15 = v11;
      id v16 = v14;
      int v19 = 136446466;
      uint64_t v20 = [(__CFString *)v15 UTF8String];
      __int16 v21 = 2114;
      double v22 = v13;
      _os_log_impl(&dword_1BEEFF000, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v19, 0x16u);
    }
    v17 = [*(id *)(a1 + 32) ptpDevManager];
    [v17 resumeOperations];

    BOOL v4 = [*(id *)(a1 + 32) msDevManager];
    [(__CFString *)v4 resumeOperations];
    uint64_t v10 = 4;
  }

  return [*(id *)(a1 + 32) notifySuspension:v10];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICCameraDeviceBrowser;
  [(ICCameraDeviceBrowser *)&v4 dealloc];
}

- (void)addBrowser:(id)a3
{
}

- (void)removeBrowser:(id)a3
{
}

- (BOOL)startPXCameraBrowser
{
  return 0;
}

- (void)notifySuspension:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 0;
  uint64_t v5 = &selRef_deviceBrowserDidResumeOperations_;
  switch(a3)
  {
    case 1uLL:
      uint64_t v4 = 0;
      uint64_t v5 = &selRef_deviceBrowserDidCancelSuspendOperations_;
      goto LABEL_5;
    case 2uLL:
      uint64_t v4 = 0;
      uint64_t v5 = &selRef_deviceBrowserWillSuspendOperations_;
      goto LABEL_5;
    case 3uLL:
      uint64_t v5 = &selRef_deviceBrowserDidSuspendOperations_;
      uint64_t v4 = 1;
      goto LABEL_5;
    case 4uLL:
LABEL_5:
      uint64_t v6 = *v5;
      if (*v5)
      {
        long long v16 = 0u;
        long long v17 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        uint64_t v7 = [(ICCameraDeviceBrowser *)self browsers];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v15;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v15 != v10) {
                objc_enumerationMutation(v7);
              }
              __int16 v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
              [v12 setSuspended:v4];
              long long v13 = [v12 delegate];
              if (v13)
              {
                if (objc_opt_respondsToSelector()) {
                  [v13 performSelector:v6 withObject:self];
                }
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          }
          while (v9);
        }
      }
      break;
    default:
      return;
  }
}

- (void)stop:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableArray *)self->_browsers containsObject:v4])
  {
    int64_t numberOfBrowsingBrowsers = self->_numberOfBrowsingBrowsers;
    if (numberOfBrowsingBrowsers)
    {
      self->_int64_t numberOfBrowsingBrowsers = numberOfBrowsingBrowsers - 1;
      uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v7 = [v4 devices];
      uint64_t v8 = [v6 arrayWithArray:v7];

      uint64_t v9 = [v8 count];
      if (v9)
      {
        uint64_t v10 = v9;
        v26 = v8;
        uint64_t v27 = self;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v11 = v8;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v33 != v14) {
                objc_enumerationMutation(v11);
              }
              long long v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              objc_msgSend(v16, "willChangeValueForKey:", @"hasOpenSession", v26, v27);
              [v16 didChangeValueForKey:@"hasOpenSession"];
              long long v17 = [v16 delegate];

              if (v17)
              {
                id v18 = [v16 delegate];
                [v18 didRemoveDevice:v16];
              }
              [v4 removeDevice:v16 moreGoing:v10 - 1 != i];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
            v10 -= i;
          }
          while (v13);
        }

        uint64_t v8 = v26;
        self = v27;
      }
      if (!self->_numberOfBrowsingBrowsers)
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v19 = self->_devices;
        uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v29;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v29 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void **)(*((void *)&v28 + 1) + 8 * j);
              __int16 v25 = objc_msgSend(v24, "deviceManager", v26, v27, (void)v28);
              [v25 closeDevice:v24 contextInfo:0];
            }
            uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v21);
        }

        [(NSMutableArray *)self->_devices removeAllObjects];
      }
      -[ICCameraDeviceBrowser removeBrowser:](self, "removeBrowser:", v4, v26, v27);
    }
  }
}

- (NSMutableArray)devices
{
  return self->_devices;
}

- (void)handleCommandCompletionNotification:(id)a3
{
  id v6 = a3;
  uint64_t v3 = [v6 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"device"];
  uint64_t v5 = v4;
  if (v4) {
    [v4 performSelector:sel_handleCommandCompletionNotification_ withObject:v6];
  }
}

- (void)handleImageCaptureEventNotification:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"type"];
  if ([v6 isEqualToString:@"ICDeviceAdded"])
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"device"];
    if (v7)
    {
      [(NSMutableArray *)self->_devices addObject:v7];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v8 = self->_browsers;
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v39 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v33 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            if ([v13 isBrowsing]) {
              [v13 addDevice:v7 moreComing:0];
            }
          }
          uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v39 count:16];
        }
        while (v10);
      }
LABEL_31:
    }
  }
  else
  {
    int v14 = [v6 isEqualToString:@"ICDeviceRemoved"];
    long long v15 = [v5 objectForKeyedSubscript:@"device"];
    uint64_t v7 = v15;
    if (v14)
    {
      if (v15)
      {
        [v15 willChangeValueForKey:@"hasOpenSession"];
        [v7 didChangeValueForKey:@"hasOpenSession"];
        [(NSMutableArray *)self->_devices removeObject:v7];
        __ICOSLogCreate();
        long long v16 = NSString;
        long long v17 = [v7 name];
        id v18 = [v16 stringWithFormat:@" ------ [1]didRemoveDevice: %@\n", v17];
        uint64_t v19 = [v16 stringWithFormat:@"%@", v18];

        uint64_t v20 = __ICLogTypeEnabled(2);
        uint64_t v21 = _gICOSLog;
        if (v20)
        {
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v38 = v19;
            _os_log_impl(&dword_1BEEFF000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEBUG))
        {
          -[ICCameraDeviceBrowser handleImageCaptureEventNotification:]((uint64_t)v19, v21);
        }

        uint64_t v22 = [v7 delegate];

        if (v22)
        {
          uint64_t v23 = [v7 delegate];
          [v23 didRemoveDevice:v7];
        }
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v8 = self->_browsers;
        uint64_t v24 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v29;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v29 != v26) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*((void *)&v28 + 1) + 8 * j) removeDevice:v7 moreGoing:0];
            }
            uint64_t v25 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v25);
        }
        goto LABEL_31;
      }
    }
    else if (v15)
    {
      [v15 performSelector:sel_handleImageCaptureEventNotification_ withObject:v4];
    }
  }
}

- (id)deviceWithDelegate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = self->_devices;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0;
    uint64_t v11 = v8;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v5);
      }
      id v8 = *(id *)(*((void *)&v14 + 1) + 8 * v10);

      objc_msgSend(v8, "delegate", (void)v14);
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12 == v4) {
        break;
      }
      ++v10;
      uint64_t v11 = v8;
      if (v7 == v10)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }

        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    id v8 = 0;
  }

  return v8;
}

- (NSMutableArray)browsers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (PTPCameraDeviceManager)ptpDevManager
{
  return self->_ptpDevManager;
}

- (void)setPtpDevManager:(id)a3
{
}

- (MSCameraDeviceManager)msDevManager
{
  return self->_msDevManager;
}

- (void)setMsDevManager:(id)a3
{
}

- (OS_dispatch_source)suspensionTimer
{
  return self->_suspensionTimer;
}

- (void)setSuspensionTimer:(id)a3
{
}

- (OS_dispatch_queue)suspensionTimerQueue
{
  return self->_suspensionTimerQueue;
}

- (void)setSuspensionTimerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suspensionTimerQueue, 0);
  objc_storeStrong((id *)&self->_suspensionTimer, 0);
  objc_storeStrong((id *)&self->_msDevManager, 0);
  objc_storeStrong((id *)&self->_ptpDevManager, 0);
  objc_storeStrong((id *)&self->_suspendedBrowsers, 0);
  objc_storeStrong((id *)&self->_browsers, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

- (void)handleImageCaptureEventNotification:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BEEFF000, a2, OS_LOG_TYPE_DEBUG, "%{public}@", (uint8_t *)&v2, 0xCu);
}

@end