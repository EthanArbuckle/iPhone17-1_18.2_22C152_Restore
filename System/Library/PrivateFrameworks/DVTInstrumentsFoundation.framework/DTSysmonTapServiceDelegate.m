@interface DTSysmonTapServiceDelegate
+ (void)registerCapabilities:(id)a3;
- (BOOL)requiresExpiredPIDCacheForConfig:(id)a3;
- (DTSysmonTapServiceDelegate)initWithMessageSender:(id)a3;
- (id)createConfigWithPlist:(id)a3;
- (id)willStartWithConfig:(id)a3;
@end

@implementation DTSysmonTapServiceDelegate

+ (void)registerCapabilities:(id)a3
{
  id v6 = a3;
  v4 = objc_opt_new();
  v5 = v4;
  if (MEMORY[0x263F8C7F0])
  {
    [v4 setObject:&unk_26E533FC8 forKeyedSubscript:@"com.apple.instruments.server.services.sysmontap"];
    [v5 setObject:&unk_26E533FE0 forKeyedSubscript:@"com.apple.instruments.server.services.sysmontap.deferred"];
    [v5 setObject:&unk_26E533FE0 forKeyedSubscript:@"com.apple.instruments.server.services.sysmontap.immediate"];
    [v5 setObject:&unk_26E533FE0 forKeyedSubscript:@"com.apple.instruments.server.services.sysmontap.windowed"];
    [v5 setObject:&unk_26E533FE0 forKeyedSubscript:@"com.apple.instruments.server.services.sysmontap.processes"];
    [v5 setObject:&unk_26E533FE0 forKeyedSubscript:@"com.apple.instruments.server.services.sysmontap.system"];
  }
  +[DTTapService registerCapabilities:v5 forDelegateClass:a1 forConnection:v6];
}

- (DTSysmonTapServiceDelegate)initWithMessageSender:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTSysmonTapServiceDelegate;
  id v6 = [(DTSysmonTapServiceDelegate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_messageSender, a3);
  }

  return v7;
}

- (id)createConfigWithPlist:(id)a3
{
  id v4 = a3;
  id v5 = [(DTTapConfig *)[DTSysmonTapConfig alloc] initWithPlist:v4];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2308D33F8;
  v7[3] = &unk_264B8F538;
  v7[4] = self;
  [(DTTapConfig *)v5 setRunningMetadataChangedHandler:v7];
  return v5;
}

- (BOOL)requiresExpiredPIDCacheForConfig:(id)a3
{
  return 1;
}

- (id)willStartWithConfig:(id)a3
{
  v3 = objc_opt_new();
  [v3 setKind:0];
  [v3 setTapVersion:0x10000];
  return v3;
}

- (void).cxx_destruct
{
}

@end