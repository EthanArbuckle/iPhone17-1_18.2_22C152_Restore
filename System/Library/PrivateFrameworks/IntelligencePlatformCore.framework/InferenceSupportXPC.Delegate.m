@interface InferenceSupportXPC.Delegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtCC24IntelligencePlatformCore19InferenceSupportXPC8Delegate)init;
@end

@implementation InferenceSupportXPC.Delegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1C72E3A54((uint64_t)v8, v7);

  return v9 & 1;
}

- (_TtCC24IntelligencePlatformCore19InferenceSupportXPC8Delegate)init
{
  return (_TtCC24IntelligencePlatformCore19InferenceSupportXPC8Delegate *)_s24IntelligencePlatformCore15CoordinationXPCCACycfc_0();
}

@end