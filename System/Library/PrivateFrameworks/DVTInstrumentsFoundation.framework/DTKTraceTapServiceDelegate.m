@interface DTKTraceTapServiceDelegate
+ (void)registerCapabilities:(id)a3;
- (BOOL)requiresExpiredPIDCacheForConfig:(id)a3;
- (DTKTraceTapServiceDelegate)initWithMessageSender:(id)a3;
- (id)createConfigWithPlist:(id)a3;
- (id)willStartWithConfig:(id)a3;
@end

@implementation DTKTraceTapServiceDelegate

+ (void)registerCapabilities:(id)a3
{
  id v4 = a3;
  id v5 = +[DTDeviceKTraceSupport capabilities];
  +[DTTapService registerCapabilities:v5 forDelegateClass:a1 forConnection:v4];
}

- (DTKTraceTapServiceDelegate)initWithMessageSender:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTKTraceTapServiceDelegate;
  v6 = [(DTKTraceTapServiceDelegate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_messageSender, a3);
  }

  return v7;
}

- (id)createConfigWithPlist:(id)a3
{
  id v4 = a3;
  id v5 = [(DTTapConfig *)[DTKTraceTapConfig alloc] initWithPlist:v4];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2308F9F68;
  v7[3] = &unk_264B8F538;
  v7[4] = self;
  [(DTTapConfig *)v5 setRunningMetadataChangedHandler:v7];
  return v5;
}

- (BOOL)requiresExpiredPIDCacheForConfig:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2308FA0D8;
  v6[3] = &unk_264B8EBB0;
  v6[4] = &v7;
  [v3 enumerateTriggerConfigs:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)willStartWithConfig:(id)a3
{
  id v3 = a3;
  char v4 = objc_opt_new();
  [v4 setKind:0];
  uint64_t v5 = [v3 triggerConfigCount];

  [v4 setTriggerCount:v5];
  [v4 setCoreCount:DTGetCoreCount()];
  [v4 setTapVersion:0x10000];
  return v4;
}

- (void).cxx_destruct
{
}

@end