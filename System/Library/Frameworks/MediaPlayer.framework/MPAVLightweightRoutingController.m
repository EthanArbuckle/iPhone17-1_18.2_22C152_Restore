@interface MPAVLightweightRoutingController
- (BOOL)isDevicePresenceDetected;
- (MPAVLightweightRoutingController)initWithName:(id)a3;
- (MPAVLightweightRoutingControllerDelegate)delegate;
- (NSArray)pickedRoutes;
- (NSString)name;
- (id)description;
- (int64_t)discoveryMode;
- (void)_availableOutputDevicesDidChangeNotification:(id)a3;
- (void)_onSyncSelf_schedulePickedRoutesChangedNotification;
- (void)_outputContextDevicesDidChangeNotification:(id)a3;
- (void)_postPickedRoutesChangedNotification;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDiscoveryMode:(int64_t)a3;
@end

@implementation MPAVLightweightRoutingController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lastOutputContextNotificationDate, 0);
  objc_storeStrong((id *)&self->_avOutputContext, 0);

  objc_storeStrong((id *)&self->_avDiscoverySession, 0);
}

- (void)setDelegate:(id)a3
{
}

- (MPAVLightweightRoutingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPAVLightweightRoutingControllerDelegate *)WeakRetained;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)discoveryMode
{
  return self->_discoveryMode;
}

- (void)_postPickedRoutesChangedNotification
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v4 = [(MPAVLightweightRoutingController *)self delegate];
  v3 = [(MPAVLightweightRoutingController *)self pickedRoutes];
  [v4 lightweightRoutingController:self didChangePickedRoutes:v3];
}

- (void)_onSyncSelf_schedulePickedRoutesChangedNotification
{
  if (!self->_notificationScheduled)
  {
    self->_notificationScheduled = 1;
    dispatch_time_t v3 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__MPAVLightweightRoutingController__onSyncSelf_schedulePickedRoutesChangedNotification__block_invoke;
    block[3] = &unk_1E57F9EA8;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __87__MPAVLightweightRoutingController__onSyncSelf_schedulePickedRoutesChangedNotification__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  objc_sync_exit(v2);

  dispatch_time_t v3 = *(void **)(a1 + 32);

  return [v3 _postPickedRoutesChangedNotification];
}

- (void)_outputContextDevicesDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = [(MPAVLightweightRoutingController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    v8 = self;
    objc_sync_enter(v8);
    [(NSDate *)v8->_lastOutputContextNotificationDate timeIntervalSinceNow];
    if (v8->_lastOutputContextNotificationDate && v9 >= -2.0)
    {
      [(MPAVLightweightRoutingController *)v8 _onSyncSelf_schedulePickedRoutesChangedNotification];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __79__MPAVLightweightRoutingController__outputContextDevicesDidChangeNotification___block_invoke;
      block[3] = &unk_1E57F9EA8;
      block[4] = v8;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    lastOutputContextNotificationDate = v8->_lastOutputContextNotificationDate;
    v8->_lastOutputContextNotificationDate = (NSDate *)v7;

    objc_sync_exit(v8);
  }
}

uint64_t __79__MPAVLightweightRoutingController__outputContextDevicesDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postPickedRoutesChangedNotification];
}

- (void)_availableOutputDevicesDidChangeNotification:(id)a3
{
  id v4 = [(MPAVLightweightRoutingController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__MPAVLightweightRoutingController__availableOutputDevicesDidChangeNotification___block_invoke;
    block[3] = &unk_1E57F9EA8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __81__MPAVLightweightRoutingController__availableOutputDevicesDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v2, "lightweightRoutingController:didChangeDevicePresenceDetected:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isDevicePresenceDetected"));
}

- (NSArray)pickedRoutes
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [(AVOutputContext *)self->_avOutputContext outputDevices];
  dispatch_time_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = (const void *)MRAVOutputDeviceCreateFromAVOutputDevice();
        v10 = [MPAVOutputDeviceRoute alloc];
        v19 = v9;
        v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v19, 1, v15);
        v12 = [(MPAVOutputDeviceRoute *)v10 initWithOutputDevices:v11];

        CFRelease(v9);
        [(MPAVRoute *)v12 setPicked:1];
        [v3 addObject:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v6);
  }

  v13 = (void *)[v3 copy];

  return (NSArray *)v13;
}

- (void)setDiscoveryMode:(int64_t)a3
{
  int64_t v3 = a3;
  if (a3)
  {
    if (a3 == 1)
    {
      a3 = 1;
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"MPAVLightweightRoutingController.m" lineNumber:75 description:@"The lightweight routing controller only supports disabled and presence discovery modes. If detailed is needed please use MPAVRoutingController."];

      a3 = 0;
    }
  }
  self->_discoveryMode = v3;
  [(AVOutputDeviceDiscoverySession *)self->_avDiscoverySession setDiscoveryMode:a3];

  MRMediaRemoteSetWantsVolumeControlNotifications();
}

- (BOOL)isDevicePresenceDetected
{
  return [(AVOutputDeviceDiscoverySession *)self->_avDiscoverySession devicePresenceDetected];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p \"%@\"", objc_opt_class(), self, self->_name];
}

- (void)dealloc
{
  int64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MPAVLightweightRoutingController;
  [(MPAVLightweightRoutingController *)&v4 dealloc];
}

- (MPAVLightweightRoutingController)initWithName:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MPAVLightweightRoutingController;
  uint64_t v5 = [(MPAVLightweightRoutingController *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F165E8]) initWithDeviceFeatures:1];
    avDiscoverySession = v5->_avDiscoverySession;
    v5->_avDiscoverySession = (AVOutputDeviceDiscoverySession *)v8;

    [(AVOutputDeviceDiscoverySession *)v5->_avDiscoverySession setDiscoveryMode:0];
    v10 = (void *)MEMORY[0x1E4F165D0];
    v11 = [MEMORY[0x1E4F153E0] sharedInstance];
    v12 = [v11 routingContextUID];
    uint64_t v13 = [v10 outputContextForID:v12];
    avOutputContext = v5->_avOutputContext;
    v5->_avOutputContext = (AVOutputContext *)v13;

    long long v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v5 selector:sel__availableOutputDevicesDidChangeNotification_ name:*MEMORY[0x1E4F15F60] object:v5->_avDiscoverySession];
    [v15 addObserver:v5 selector:sel__outputContextDevicesDidChangeNotification_ name:*MEMORY[0x1E4F15F08] object:v5->_avOutputContext];
    [v15 addObserver:v5 selector:sel__outputContextDevicesDidChangeNotification_ name:*MEMORY[0x1E4F15F10] object:v5->_avOutputContext];
  }
  return v5;
}

@end