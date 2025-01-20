@interface AUHSXPCSharedListenerManager
- (void)builtForPlatform:(unsigned int)a3 againstMinimumSDK:(unsigned int)a4 reply:(id)a5;
- (void)getProgramSDKVersion:(id)a3;
- (void)warmUpClassNamed:(id)a3 withReply:(id)a4;
@end

@implementation AUHSXPCSharedListenerManager

- (void)warmUpClassNamed:(id)a3 withReply:(id)a4
{
  aClassName = (NSString *)a3;
  v5 = (void (**)(id, id))a4;
  id v6 = [NSClassFromString(aClassName) remoteWarmUp];
  v5[2](v5, v6);
}

- (void)getProgramSDKVersion:(id)a3
{
  id v5 = a3;
  uint64_t program_sdk_version = dyld_get_program_sdk_version();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, program_sdk_version);
}

- (void)builtForPlatform:(unsigned int)a3 againstMinimumSDK:(unsigned int)a4 reply:(id)a5
{
  v8 = (void (**)(id, void, uint64_t))a5;
  if (a3 <= 7 && ((1 << a3) & 0xC6) != 0)
  {
    uint64_t v6 = dyld_program_sdk_at_least();
    v8[2](v8, 0, v6);
  }
  else
  {
    v7 = sub_100005020(1, @"unsupported platform");
    ((void (**)(id, void *, uint64_t))v8)[2](v8, v7, 0);
  }
}

@end