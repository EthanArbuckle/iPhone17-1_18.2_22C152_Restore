@interface MRUVirtualHearingAidRoute
+ (void)disconnect;
- (BOOL)isConnecting;
- (MRUVirtualHearingAidRoute)initWithHearingDeviceName:(id)a3;
- (MRUVirtualHearingAidRouteObserver)hearingAidDelegate;
- (void)connect;
- (void)disconnect;
- (void)hearingAidConnectionDidChange:(BOOL)a3;
- (void)setHearingAidDelegate:(id)a3;
@end

@implementation MRUVirtualHearingAidRoute

- (MRUVirtualHearingAidRoute)initWithHearingDeviceName:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v4 = NSString;
  v5 = (void *)MEMORY[0x1E4F29128];
  id v6 = a3;
  v7 = [v5 UUID];
  v8 = [v7 UUIDString];
  v9 = [v4 stringWithFormat:@"%@-tlea", v8];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F76FC8]) initWithDeviceType:2 deviceSubtype:9 uid:v9 name:v6];
  v11 = [[MRUVirtualHearingAidDevice alloc] initWithDeviceDescription:v10];
  v12 = [MEMORY[0x1E4F67CD0] sharedInstance];
  [v12 setDelegate:self];

  v17[0] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v16.receiver = self;
  v16.super_class = (Class)MRUVirtualHearingAidRoute;
  v14 = [(MPAVOutputDeviceRoute *)&v16 initWithOutputDevices:v13];

  return v14;
}

- (void)connect
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = MCLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MPAVOutputDeviceRoute *)self outputDevice];
    v5 = [v4 name];
    int v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "MRUVirtualHearingAidRoute connect Hearing Aid device: %@", (uint8_t *)&v7, 0xCu);
  }
  self->_isConnecting = 1;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E4F67CC8], 0, 0, 1u);
}

- (void)disconnect
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = MCLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MPAVOutputDeviceRoute *)self outputDevice];
    v5 = [v4 name];
    int v6 = 138412290;
    int v7 = v5;
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "MRUVirtualHearingAidRoute disconnect Hearing Aid device: %@", (uint8_t *)&v6, 0xCu);
  }
  self->_isConnecting = 0;
  [(id)objc_opt_class() disconnect];
}

+ (void)disconnect
{
  v2 = MCLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AE7DF000, v2, OS_LOG_TYPE_DEFAULT, "MRUVirtualHearingAidRoute disconnect Hearing Aid", v4, 2u);
  }

  v3 = [MEMORY[0x1E4F67CD0] sharedInstance];
  [v3 cancelHearingAidConnectionRequest];
}

- (void)hearingAidConnectionDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  self->_isConnecting = 0;
  v5 = MCLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [NSNumber numberWithBool:v3];
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "MRUVirtualHearingAidRoute hearingAidConnectionDidChange connected: %@", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MRUVirtualHearingAidRoute_hearingAidConnectionDidChange___block_invoke;
  block[3] = &unk_1E5F0D7F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __59__MRUVirtualHearingAidRoute_hearingAidConnectionDidChange___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) hearingAidDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) hearingAidDelegate];
    [v4 hearingAidConnectionDidChange];
  }
}

- (BOOL)isConnecting
{
  return self->_isConnecting;
}

- (MRUVirtualHearingAidRouteObserver)hearingAidDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hearingAidDelegate);

  return (MRUVirtualHearingAidRouteObserver *)WeakRetained;
}

- (void)setHearingAidDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end