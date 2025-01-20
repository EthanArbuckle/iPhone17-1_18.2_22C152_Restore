@interface AXSBHearingAidDeviceController
+ (id)sharedController;
- (AXSBHearingAidDeviceController)init;
- (BOOL)hearingAidIsConnected;
- (BOOL)holdingMediaForConnection;
- (BOOL)holdingPhoneForConnection;
- (BOOL)isScreenLocked;
- (BOOL)isShowingHearingAidControl;
- (BOOL)shouldIgnoreRouteChanges;
- (NSDictionary)preferredRoute;
- (NSTimer)preferredRouteTimer;
- (OS_dispatch_queue)mediaUpdateQueue;
- (id)hearingUIClient;
- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(unint64_t)a5 error:(id *)a6;
- (void)_lockStateChanged;
- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3;
- (void)dealloc;
- (void)hearingServerDidDie:(id)a3;
- (void)liveListenStatusBarActivated:(id)a3;
- (void)setHearingAidIsConnected:(BOOL)a3;
- (void)setHoldingMediaForConnection:(BOOL)a3;
- (void)setHoldingPhoneForConnection:(BOOL)a3;
- (void)setIsShowingHearingAidControl:(BOOL)a3;
- (void)setMediaUpdateQueue:(id)a3;
- (void)setPreferredRoute:(id)a3;
- (void)setPreferredRouteTimer:(id)a3;
- (void)setShouldIgnoreRouteChanges:(BOOL)a3;
- (void)showHearingAidControl:(BOOL)a3;
- (void)startServer;
@end

@implementation AXSBHearingAidDeviceController

+ (id)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedController_SharedController;
  return v2;
}

uint64_t __50__AXSBHearingAidDeviceController_sharedController__block_invoke()
{
  sharedController_SharedController = objc_alloc_init(AXSBHearingAidDeviceController);
  return MEMORY[0x270F9A758]();
}

- (AXSBHearingAidDeviceController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXSBHearingAidDeviceController;
  v2 = [(AXSBHearingAidDeviceController *)&v6 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)screenDidDim, @"com.apple.springboardservices.eventobserver.internalSBSEventObserverEventDimmed", 0, (CFNotificationSuspensionBehavior)0);
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_liveListenStatusBarActivated_ name:@"SBStatusBarReturnToHearingAidNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.springboardservices.eventobserver.internalSBSEventObserverEventDimmed", 0);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, @"SBFaceTimeStateChangedNotification", 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, (CFNotificationName)*MEMORY[0x263F22708], 0);
  objc_super v6 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v6, self, (CFNotificationName)*MEMORY[0x263F796D0], 0);
  v7 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v7, self, (CFNotificationName)*MEMORY[0x263F796C8], 0);
  v8 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v8, self, (CFNotificationName)*MEMORY[0x263F7E308], 0);
  v9 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v9, self, (CFNotificationName)*MEMORY[0x263F7E2F8], 0);
  v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 removeObserver:self];

  v11.receiver = self;
  v11.super_class = (Class)AXSBHearingAidDeviceController;
  [(AXSBHearingAidDeviceController *)&v11 dealloc];
}

- (void)startServer
{
  id v3 = [MEMORY[0x263F47528] sharedInstance];
  [v3 startServerWithDelegate:self];
}

- (id)hearingUIClient
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__AXSBHearingAidDeviceController_hearingUIClient__block_invoke;
  block[3] = &unk_2647F0648;
  block[4] = self;
  if (hearingUIClient_onceToken != -1) {
    dispatch_once(&hearingUIClient_onceToken, block);
  }
  return (id)hearingUIClient_HearingUIClient;
}

uint64_t __49__AXSBHearingAidDeviceController_hearingUIClient__block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x263F22198]) initWithIdentifier:@"HearingAidUIClient" serviceBundleName:@"HearingAidUIServer"];
  id v3 = (void *)hearingUIClient_HearingUIClient;
  hearingUIClient_HearingUIClient = v2;

  v4 = (void *)hearingUIClient_HearingUIClient;
  uint64_t v5 = *(void *)(a1 + 32);
  return [v4 setDelegate:v5];
}

- (void)_lockStateChanged
{
  if ([(AXSBHearingAidDeviceController *)self isScreenLocked])
  {
    [(AXSBHearingAidDeviceController *)self showHearingAidControl:0];
  }
}

- (BOOL)isScreenLocked
{
  uint64_t v2 = [MEMORY[0x263F22968] server];
  char v3 = [v2 isScreenLockedWithPasscode:0];

  return v3;
}

- (void)showHearingAidControl:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    uint64_t v5 = [MEMORY[0x263F22938] sharedInstance];
    if ([v5 allowHearingAidControlOnLockScreen])
    {
    }
    else
    {
      BOOL v6 = [(AXSBHearingAidDeviceController *)self isScreenLocked];

      if (v6) {
        return;
      }
    }
    v7 = [MEMORY[0x263F22968] server];
    int v8 = [v7 isControlCenterVisible];

    if (v8)
    {
      v9 = [MEMORY[0x263F22968] server];
      [v9 showControlCenter:0];
    }
  }
  v10 = [(AXSBHearingAidDeviceController *)self hearingUIClient];
  objc_super v11 = NSDictionary;
  v12 = [NSNumber numberWithBool:v3];
  v13 = [v11 dictionaryWithObject:v12 forKey:@"shouldShow"];
  v14 = [MEMORY[0x263F21380] backgroundAccessQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __56__AXSBHearingAidDeviceController_showHearingAidControl___block_invoke;
  v15[3] = &unk_2647F0670;
  v15[4] = self;
  [v10 sendAsynchronousMessage:v13 withIdentifier:1 targetAccessQueue:v14 completion:v15];
}

void __56__AXSBHearingAidDeviceController_showHearingAidControl___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 valueForKey:@"result"];
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "setIsShowingHearingAidControl:", objc_msgSend(v3, "BOOLValue"));
    BOOL v3 = v4;
  }
}

- (void)hearingServerDidDie:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F47550], "sharedInstance", a3);
  uint64_t v5 = [v4 pairedHearingAids];

  if (v5)
  {
    BOOL v6 = [MEMORY[0x263F47528] sharedInstance];
    [v6 startServerWithDelegate:self];
  }
  dispatch_time_t v7 = dispatch_time(0, 3000000000);
  int v8 = dispatch_get_global_queue(0, 0);
  dispatch_after(v7, v8, &__block_literal_global_299);
}

void __54__AXSBHearingAidDeviceController_hearingServerDidDie___block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v1 = (const __CFString *)*MEMORY[0x263F47520];
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v1, 0, 0, 1u);
}

- (void)liveListenStatusBarActivated:(id)a3
{
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  [(AXSBHearingAidDeviceController *)self setIsShowingHearingAidControl:0];
  id v3 = [MEMORY[0x263F22838] server];
  [v3 setHearingAidControlIsVisible:0];
}

- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(unint64_t)a5 error:(id *)a6
{
  if (a5 == 1)
  {
    dispatch_time_t v7 = [a4 valueForKey:@"result"];
    int v8 = v7;
    if (v7) {
      -[AXSBHearingAidDeviceController setIsShowingHearingAidControl:](self, "setIsShowingHearingAidControl:", [v7 BOOLValue]);
    }
  }
  return 0;
}

- (BOOL)isShowingHearingAidControl
{
  return self->isShowingHearingAidControl;
}

- (void)setIsShowingHearingAidControl:(BOOL)a3
{
  self->isShowingHearingAidControl = a3;
}

- (BOOL)shouldIgnoreRouteChanges
{
  return self->_shouldIgnoreRouteChanges;
}

- (void)setShouldIgnoreRouteChanges:(BOOL)a3
{
  self->_shouldIgnoreRouteChanges = a3;
}

- (BOOL)hearingAidIsConnected
{
  return self->_hearingAidIsConnected;
}

- (void)setHearingAidIsConnected:(BOOL)a3
{
  self->_hearingAidIsConnected = a3;
}

- (BOOL)holdingMediaForConnection
{
  return self->_holdingMediaForConnection;
}

- (void)setHoldingMediaForConnection:(BOOL)a3
{
  self->_holdingMediaForConnection = a3;
}

- (BOOL)holdingPhoneForConnection
{
  return self->_holdingPhoneForConnection;
}

- (void)setHoldingPhoneForConnection:(BOOL)a3
{
  self->_holdingPhoneForConnection = a3;
}

- (NSDictionary)preferredRoute
{
  return self->_preferredRoute;
}

- (void)setPreferredRoute:(id)a3
{
}

- (NSTimer)preferredRouteTimer
{
  return self->_preferredRouteTimer;
}

- (void)setPreferredRouteTimer:(id)a3
{
}

- (OS_dispatch_queue)mediaUpdateQueue
{
  return self->_mediaUpdateQueue;
}

- (void)setMediaUpdateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaUpdateQueue, 0);
  objc_storeStrong((id *)&self->_preferredRouteTimer, 0);
  objc_storeStrong((id *)&self->_preferredRoute, 0);
}

@end