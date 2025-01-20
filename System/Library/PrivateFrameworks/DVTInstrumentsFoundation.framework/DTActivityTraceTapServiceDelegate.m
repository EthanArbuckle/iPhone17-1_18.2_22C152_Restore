@interface DTActivityTraceTapServiceDelegate
+ (void)registerCapabilities:(id)a3;
- (BOOL)requiresExpiredPIDCacheForConfig:(id)a3;
- (BOOL)validateConfig:(id)a3;
- (DTActivityTraceTapServiceDelegate)initWithMessageSender:(id)a3;
- (id)createConfigWithPlist:(id)a3;
- (id)willStartWithConfig:(id)a3;
@end

@implementation DTActivityTraceTapServiceDelegate

+ (void)registerCapabilities:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setObject:&unk_26E533F80 forKeyedSubscript:@"com.apple.instruments.server.services.activitytracetap"];
  [v5 setObject:&unk_26E533F98 forKeyedSubscript:@"com.apple.instruments.server.services.activitytracetap.deferred"];
  [v5 setObject:&unk_26E533F98 forKeyedSubscript:@"com.apple.instruments.server.services.activitytracetap.immediate"];
  [v5 setObject:&unk_26E533F98 forKeyedSubscript:@"com.apple.instruments.server.services.activitytracetap.windowed"];
  [v5 setObject:&unk_26E533FB0 forKeyedSubscript:@"com.apple.instruments.server.services.httparchiverecording"];
  +[DTTapService registerCapabilities:v5 forDelegateClass:a1 forConnection:v4];
}

- (DTActivityTraceTapServiceDelegate)initWithMessageSender:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTActivityTraceTapServiceDelegate;
  v6 = [(DTActivityTraceTapServiceDelegate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_messageSender, a3);
  }

  return v7;
}

- (id)createConfigWithPlist:(id)a3
{
  id v3 = a3;
  id v4 = [(DTTapConfig *)[DTActivityTraceTapConfig alloc] initWithPlist:v3];

  [(DTTapConfig *)v4 setRunningMetadataChangedHandler:&unk_26E5156E8];
  return v4;
}

- (BOOL)validateConfig:(id)a3
{
  return 1;
}

- (BOOL)requiresExpiredPIDCacheForConfig:(id)a3
{
  return MEMORY[0x270F9A6D0](a3, sel_trackExpiredPIDs);
}

- (id)willStartWithConfig:(id)a3
{
  id v3 = objc_opt_new();
  [v3 setKind:0];
  return v3;
}

- (void).cxx_destruct
{
}

@end