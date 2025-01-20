@interface EntityResolutionXPC.Delegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtCC24IntelligencePlatformCore19EntityResolutionXPC8Delegate)init;
@end

@implementation EntityResolutionXPC.Delegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1C705C930((uint64_t)v8, v7);

  return v9 & 1;
}

- (_TtCC24IntelligencePlatformCore19EntityResolutionXPC8Delegate)init
{
  return (_TtCC24IntelligencePlatformCore19EntityResolutionXPC8Delegate *)_s24IntelligencePlatformCore15CoordinationXPCCACycfc_0();
}

@end