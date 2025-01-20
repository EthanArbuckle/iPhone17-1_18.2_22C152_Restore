@interface PKPencilTouchDetectionService
+ (id)sharedInstance;
+ (void)beginObservingTouchesForDetection;
- (BOOL)isListening;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)timestampIndicatesRecentUsage:(id)a3;
- (BOOL)wereFrontBoardOverlaysEnabled;
- (FBSDisplayLayoutMonitor)displayLayoutMonitor;
- (NSDictionary)userInfoForNotification;
- (NSMutableDictionary)timestamps;
- (NSUserDefaults)pencilDefaults;
- (NSXPCListener)listener;
- (PKPencilTouchDetectionGestureRecognizer)detectionGesture;
- (PKPencilTouchDetectionService)init;
- (double)activePencilUsageTimestamp;
- (id)stringForTouchDetectionPencilType:(int64_t)a3;
- (void)_updateActivePencilUsageForTouchType:(int64_t)a3;
- (void)dealloc;
- (void)loadDefaultsIfNecessary;
- (void)loadTimestampsIfNecessary;
- (void)pencilType:(int64_t)a3 hasRecentlyBeenUsedWithCompletionHandler:(id)a4;
- (void)persistTimestamps;
- (void)postUpdateNotificationIfNecessary;
- (void)reset:(id)a3;
- (void)resumeConnectionIfIdle;
- (void)setActivePencilUsageTimestamp:(double)a3;
- (void)setDetectionGesture:(id)a3;
- (void)setDisplayLayoutMonitor:(id)a3;
- (void)setIsListening:(BOOL)a3;
- (void)setListener:(id)a3;
- (void)setPencilDefaults:(id)a3;
- (void)setTimestamps:(id)a3;
- (void)setUserInfoForNotification:(id)a3;
- (void)setWereFrontBoardOverlaysEnabled:(BOOL)a3;
- (void)updateTimestampForType:(int64_t)a3;
@end

@implementation PKPencilTouchDetectionService

+ (void)beginObservingTouchesForDetection
{
  id v2 = [a1 sharedInstance];
  [v2 resumeConnectionIfIdle];
}

+ (id)sharedInstance
{
  if (qword_1EB3C6028 != -1) {
    dispatch_once(&qword_1EB3C6028, &__block_literal_global_55);
  }
  id v2 = (void *)_MergedGlobals_142;

  return v2;
}

void __47__PKPencilTouchDetectionService_sharedInstance__block_invoke()
{
  if (PK_UIApplicationIsSystemShell_onceToken != -1) {
    dispatch_once(&PK_UIApplicationIsSystemShell_onceToken, &__block_literal_global_72);
  }
  if (PK_UIApplicationIsSystemShell___result)
  {
    v0 = objc_alloc_init(PKPencilTouchDetectionService);
    v1 = (void *)_MergedGlobals_142;
    _MergedGlobals_142 = (uint64_t)v0;
  }
}

- (PKPencilTouchDetectionService)init
{
  v23.receiver = self;
  v23.super_class = (Class)PKPencilTouchDetectionService;
  id v2 = [(PKPencilTouchDetectionService *)&v23 init];
  if (v2)
  {
    v3 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "Starting Touch Detection Service", buf, 2u);
    }

    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.pencilkit.pktouchdetection"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    v2->_isListening = 0;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2050000000;
    v6 = (void *)qword_1EB3C6030;
    uint64_t v32 = qword_1EB3C6030;
    if (!qword_1EB3C6030)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      v26 = __getFBSDisplayLayoutMonitorConfigurationClass_block_invoke;
      v27 = &unk_1E64C5478;
      v28 = &v29;
      __getFBSDisplayLayoutMonitorConfigurationClass_block_invoke((uint64_t)buf);
      v6 = (void *)v30[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v29, 8);
    v8 = [v7 configurationForDefaultMainDisplayMonitor];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __37__PKPencilTouchDetectionService_init__block_invoke;
    v21[3] = &unk_1E64C9348;
    v9 = v2;
    v22 = v9;
    [v8 setTransitionHandler:v21];
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2050000000;
    v10 = (void *)qword_1EB3C6038;
    uint64_t v32 = qword_1EB3C6038;
    if (!qword_1EB3C6038)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      v26 = __getFBSDisplayLayoutMonitorClass_block_invoke;
      v27 = &unk_1E64C5478;
      v28 = &v29;
      __getFBSDisplayLayoutMonitorClass_block_invoke((uint64_t)buf);
      v10 = (void *)v30[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v29, 8);
    uint64_t v12 = [v11 monitorWithConfiguration:v8];
    displayLayoutMonitor = v9->_displayLayoutMonitor;
    v9->_displayLayoutMonitor = (FBSDisplayLayoutMonitor *)v12;

    v14 = [[PKPencilTouchDetectionGestureRecognizer alloc] initWithTarget:v9 action:sel__nop_];
    detectionGesture = v9->_detectionGesture;
    v9->_detectionGesture = v14;

    [(PKPencilTouchDetectionGestureRecognizer *)v9->_detectionGesture setDelegate:v9];
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2050000000;
    v16 = (void *)qword_1EB3C6040;
    uint64_t v32 = qword_1EB3C6040;
    if (!qword_1EB3C6040)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      v26 = __getFBDisplayManagerClass_block_invoke;
      v27 = &unk_1E64C5478;
      v28 = &v29;
      __getFBDisplayManagerClass_block_invoke((uint64_t)buf);
      v16 = (void *)v30[3];
    }
    id v17 = v16;
    _Block_object_dispose(&v29, 8);
    v18 = [v17 mainIdentity];
    v19 = [MEMORY[0x1E4FB2390] sharedInstance];
    [v19 addGestureRecognizer:v9->_detectionGesture recognitionEvent:2 toDisplayWithIdentity:v18];
  }
  return v2;
}

uint64_t __37__PKPencilTouchDetectionService_init__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) wereFrontBoardOverlaysEnabled];
  v3 = (id *)MEMORY[0x1E4FB2608];
  if ((v2 & 1) == 0 && [(id)*MEMORY[0x1E4FB2608] _areFrontBoardInputOverlaysEnabled])
  {
    [*(id *)(a1 + 32) persistTimestamps];
    [*(id *)(a1 + 32) postUpdateNotificationIfNecessary];
  }
  uint64_t v4 = [*v3 _areFrontBoardInputOverlaysEnabled];
  v5 = *(void **)(a1 + 32);

  return [v5 setWereFrontBoardOverlaysEnabled:v4];
}

- (void)dealloc
{
  [(PKPencilTouchDetectionService *)self persistTimestamps];
  [(FBSDisplayLayoutMonitor *)self->_displayLayoutMonitor invalidate];
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKPencilTouchDetectionService;
  [(PKPencilTouchDetectionService *)&v3 dealloc];
}

- (void)reset:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  [(PKPencilTouchDetectionService *)self setTimestamps:v4];

  [(PKPencilTouchDetectionService *)self setUserInfoForNotification:0];
}

- (void)resumeConnectionIfIdle
{
  if (![(PKPencilTouchDetectionService *)self isListening])
  {
    objc_super v3 = [(PKPencilTouchDetectionService *)self listener];
    [v3 resume];

    [(PKPencilTouchDetectionService *)self setIsListening:1];
  }
}

- (void)loadDefaultsIfNecessary
{
  objc_super v3 = [(PKPencilTouchDetectionService *)self pencilDefaults];

  if (!v3)
  {
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.PencilKit"];
    [(PKPencilTouchDetectionService *)self setPencilDefaults:v4];
  }
}

- (void)loadTimestampsIfNecessary
{
  objc_super v3 = [(PKPencilTouchDetectionService *)self timestamps];

  if (!v3)
  {
    [(PKPencilTouchDetectionService *)self loadDefaultsIfNecessary];
    id v4 = [(PKPencilTouchDetectionService *)self pencilDefaults];
    id v7 = [v4 objectForKey:@"TouchTimestamps"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v7 mutableCopy];
    }
    else
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    }
    v6 = (void *)v5;
    [(PKPencilTouchDetectionService *)self setTimestamps:v5];
  }
}

- (void)persistTimestamps
{
  objc_super v3 = [(PKPencilTouchDetectionService *)self timestamps];

  if (v3)
  {
    [(PKPencilTouchDetectionService *)self loadDefaultsIfNecessary];
    id v5 = [(PKPencilTouchDetectionService *)self pencilDefaults];
    id v4 = [(PKPencilTouchDetectionService *)self timestamps];
    [v5 setObject:v4 forKey:@"TouchTimestamps"];
  }
}

- (BOOL)timestampIndicatesRecentUsage:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_super v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  id v5 = [v3 now];
  v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v7 = [v6 dateByAddingUnit:8 value:1 toDate:v4 options:0];

  BOOL v8 = [v5 compare:v7] == -1;
  return v8;
}

- (void)postUpdateNotificationIfNecessary
{
  objc_super v3 = [(PKPencilTouchDetectionService *)self userInfoForNotification];

  if (v3)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFDictionaryRef v5 = [(PKPencilTouchDetectionService *)self userInfoForNotification];
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.pencilkit.pktouchdetectionupdate", 0, v5, 1u);

    [(PKPencilTouchDetectionService *)self setUserInfoForNotification:0];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  listener = self->_listener;
  if (listener == a3)
  {
    BOOL v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F205BBC8];
    [v6 setExportedInterface:v8];
  }
  [v6 setExportedObject:self];
  [v6 resume];

  return listener == a3;
}

- (void)pencilType:(int64_t)a3 hasRecentlyBeenUsedWithCompletionHandler:(id)a4
{
  v10 = (void (**)(id, BOOL))a4;
  if (v10)
  {
    [(PKPencilTouchDetectionService *)self loadTimestampsIfNecessary];
    id v6 = @"Unknown";
    if (a3 == 1) {
      id v6 = @"Crayon";
    }
    if (!a3) {
      id v6 = @"Pencil";
    }
    id v7 = v6;
    BOOL v8 = [(PKPencilTouchDetectionService *)self timestamps];
    v9 = [v8 objectForKey:v7];

    v10[2](v10, [(PKPencilTouchDetectionService *)self timestampIndicatesRecentUsage:v9]);
  }
}

- (void)_updateActivePencilUsageForTouchType:(int64_t)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v5 = [MEMORY[0x1E4F28F80] processInfo];
  [v5 systemUptime];
  double v7 = v6;

  [(PKPencilTouchDetectionService *)self activePencilUsageTimestamp];
  if (v7 - v8 > 60.0)
  {
    [(PKPencilTouchDetectionService *)self setActivePencilUsageTimestamp:v7];
    v12[0] = @"com.apple.pencilkit.pkactivepencilusage.type";
    v9 = [NSNumber numberWithInteger:a3];
    v12[1] = @"com.apple.pencilkit.pkactivepencilusage.interval";
    v13[0] = v9;
    v13[1] = &unk_1F200F0E0;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"com.apple.pencilkit.pkactivepencilusage" object:self userInfo:v10];
  }
}

- (void)updateTimestampForType:(int64_t)a3
{
  [(PKPencilTouchDetectionService *)self loadTimestampsIfNecessary];
  CFDictionaryRef v5 = @"Unknown";
  if (a3 == 1) {
    CFDictionaryRef v5 = @"Crayon";
  }
  if (!a3) {
    CFDictionaryRef v5 = @"Pencil";
  }
  v14 = v5;
  double v6 = [(PKPencilTouchDetectionService *)self timestamps];
  double v7 = [v6 objectForKey:v14];

  if (v7) {
    int v8 = ![(PKPencilTouchDetectionService *)self timestampIndicatesRecentUsage:v7];
  }
  else {
    int v8 = 0;
  }
  v9 = [(PKPencilTouchDetectionService *)self timestamps];
  v10 = [MEMORY[0x1E4F1C9C8] now];
  [v9 setObject:v10 forKey:v14];

  if (a3)
  {
    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v7)
    {
      if (!v8)
      {
LABEL_12:
        if ([v11 count]) {
          [(PKPencilTouchDetectionService *)self setUserInfoForNotification:v11];
        }

        goto LABEL_15;
      }
    }
    else
    {
      v13 = [NSNumber numberWithInteger:a3];
      [v11 setObject:v13 forKey:@"com.apple.pencilkit.pktouchdetectionupdate.firstUse"];

      if (!v8) {
        goto LABEL_12;
      }
    }
    uint64_t v12 = [NSNumber numberWithInteger:a3];
    [v11 setObject:v12 forKey:@"com.apple.pencilkit.pktouchdetectionupdate.reactivation"];

    goto LABEL_12;
  }
LABEL_15:
  [(PKPencilTouchDetectionService *)self _updateActivePencilUsageForTouchType:a3];
}

- (id)stringForTouchDetectionPencilType:(int64_t)a3
{
  objc_super v3 = @"Crayon";
  if (a3 != 1) {
    objc_super v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"Pencil";
  }
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
}

- (BOOL)wereFrontBoardOverlaysEnabled
{
  return self->_wereFrontBoardOverlaysEnabled;
}

- (void)setWereFrontBoardOverlaysEnabled:(BOOL)a3
{
  self->_wereFrontBoardOverlaysEnabled = a3;
}

- (PKPencilTouchDetectionGestureRecognizer)detectionGesture
{
  return self->_detectionGesture;
}

- (void)setDetectionGesture:(id)a3
{
}

- (NSUserDefaults)pencilDefaults
{
  return self->_pencilDefaults;
}

- (void)setPencilDefaults:(id)a3
{
}

- (NSMutableDictionary)timestamps
{
  return self->_timestamps;
}

- (void)setTimestamps:(id)a3
{
}

- (NSDictionary)userInfoForNotification
{
  return self->_userInfoForNotification;
}

- (void)setUserInfoForNotification:(id)a3
{
}

- (double)activePencilUsageTimestamp
{
  return self->_activePencilUsageTimestamp;
}

- (void)setActivePencilUsageTimestamp:(double)a3
{
  self->_activePencilUsageTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoForNotification, 0);
  objc_storeStrong((id *)&self->_timestamps, 0);
  objc_storeStrong((id *)&self->_pencilDefaults, 0);
  objc_storeStrong((id *)&self->_detectionGesture, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end