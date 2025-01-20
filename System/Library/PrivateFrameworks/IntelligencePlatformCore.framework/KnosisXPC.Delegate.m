@interface KnosisXPC.Delegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtCC24IntelligencePlatformCore9KnosisXPC8Delegate)init;
@end

@implementation KnosisXPC.Delegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1C736AD70((uint64_t)v8, v7);
  char v10 = v9;

  return v10 & 1;
}

- (_TtCC24IntelligencePlatformCore9KnosisXPC8Delegate)init
{
  return (_TtCC24IntelligencePlatformCore9KnosisXPC8Delegate *)_s24IntelligencePlatformCore15CoordinationXPCCACycfc_0();
}

@end