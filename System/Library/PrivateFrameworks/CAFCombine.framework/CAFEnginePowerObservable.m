@interface CAFEnginePowerObservable
- (NSString)description;
- (_TtC10CAFCombine24CAFEnginePowerObservable)init;
- (void)dealloc;
- (void)enginePowerService:(id)a3 didUpdatePower:(id)a4;
- (void)enginePowerService:(id)a3 didUpdatePowerMarkerAvailableMax:(id)a4;
- (void)enginePowerService:(id)a3 didUpdatePowerMarkerAvailableMin:(id)a4;
- (void)enginePowerService:(id)a3 didUpdatePowerMax:(id)a4;
- (void)enginePowerService:(id)a3 didUpdatePowerMin:(id)a4;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
@end

@implementation CAFEnginePowerObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFEnginePowerObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFEnginePowerObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtC10CAFCombine24CAFEnginePowerObservable)init
{
}

- (void)enginePowerService:(id)a3 didUpdatePower:(id)a4
{
}

- (void)enginePowerService:(id)a3 didUpdatePowerMin:(id)a4
{
}

- (void)enginePowerService:(id)a3 didUpdatePowerMax:(id)a4
{
}

- (void)enginePowerService:(id)a3 didUpdatePowerMarkerAvailableMin:(id)a4
{
}

- (void)enginePowerService:(id)a3 didUpdatePowerMarkerAvailableMax:(id)a4
{
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFEnginePowerObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  CAFEnginePowerObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  CAFEnginePowerObservable.serviceDidFinishGroupUpdate(_:)();
}

@end