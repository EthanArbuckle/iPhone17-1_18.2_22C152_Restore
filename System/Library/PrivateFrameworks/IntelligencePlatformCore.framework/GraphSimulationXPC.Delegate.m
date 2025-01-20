@interface GraphSimulationXPC.Delegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtCC24IntelligencePlatformCore18GraphSimulationXPC8Delegate)init;
@end

@implementation GraphSimulationXPC.Delegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1C72007C4((uint64_t)v8, v7);

  return v9 & 1;
}

- (_TtCC24IntelligencePlatformCore18GraphSimulationXPC8Delegate)init
{
  return (_TtCC24IntelligencePlatformCore18GraphSimulationXPC8Delegate *)_s24IntelligencePlatformCore15CoordinationXPCCACycfc_0();
}

@end