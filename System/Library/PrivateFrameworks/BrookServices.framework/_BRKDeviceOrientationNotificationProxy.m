@interface _BRKDeviceOrientationNotificationProxy
+ (id)sharedInstance;
- (BOOL)crownOrientationIsRight;
- (BOOL)wristOrientationIsRight;
- (_BRKDeviceOrientationNotificationProxy)init;
- (void)_logCurrentState;
- (void)_postChangeNotification:(id)a3;
- (void)_postNotification;
@end

@implementation _BRKDeviceOrientationNotificationProxy

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_67);
  }
  v2 = (void *)sharedInstance_Proxy;
  return v2;
}

- (_BRKDeviceOrientationNotificationProxy)init
{
  v5.receiver = self;
  v5.super_class = (Class)_BRKDeviceOrientationNotificationProxy;
  v2 = [(_BRKDeviceOrientationNotificationProxy *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_BRKDeviceOrientationNotificationProxy *)v2 _logCurrentState];
  }
  return v3;
}

- (void)_postNotification
{
}

- (void)_postChangeNotification:(id)a3
{
  v4 = BRKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2399EB000, v4, OS_LOG_TYPE_DEFAULT, "Posting device orientation changed notification", v6, 2u);
  }

  [(_BRKDeviceOrientationNotificationProxy *)self _logCurrentState];
  objc_super v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"BRKDeviceOrientationDidChangeNotification" object:0];
}

- (void)_logCurrentState
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = BRKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if ([(_BRKDeviceOrientationNotificationProxy *)self wristOrientationIsRight]) {
      v4 = @"right";
    }
    else {
      v4 = @"left";
    }
    if ([(_BRKDeviceOrientationNotificationProxy *)self crownOrientationIsRight]) {
      objc_super v5 = @"right";
    }
    else {
      objc_super v5 = @"left";
    }
    int v6 = 138412546;
    v7 = v4;
    __int16 v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_2399EB000, v3, OS_LOG_TYPE_DEFAULT, "Current device orientation: wrist=%@ crown=%@", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)wristOrientationIsRight
{
  return 0;
}

- (BOOL)crownOrientationIsRight
{
  return 0;
}

@end