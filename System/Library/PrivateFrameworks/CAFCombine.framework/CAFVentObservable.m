@interface CAFVentObservable
- (NSString)description;
- (_TtC10CAFCombine17CAFVentObservable)init;
- (void)dealloc;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)ventService:(id)a3 didUpdateAutoMode:(BOOL)a4;
- (void)ventService:(id)a3 didUpdateCombinations:(id)a4;
- (void)ventService:(id)a3 didUpdateCurrentIndex:(unsigned int)a4;
- (void)ventService:(id)a3 didUpdateName:(id)a4;
- (void)ventService:(id)a3 didUpdateOn:(BOOL)a4;
- (void)ventService:(id)a3 didUpdateVehicleLayoutKey:(id)a4;
@end

@implementation CAFVentObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFVentObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFVentObservable.__deallocating_deinit();
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

  swift_release();
}

- (_TtC10CAFCombine17CAFVentObservable)init
{
}

- (void)ventService:(id)a3 didUpdateCombinations:(id)a4
{
  type metadata accessor for CAFTemperature(0, &lazy cache variable for type metadata for NSNumber);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  CAFVentObservable.ventService(_:didUpdateCombinations:)((uint64_t)v8, v6);

  swift_bridgeObjectRelease();
}

- (void)ventService:(id)a3 didUpdateCurrentIndex:(unsigned int)a4
{
  id v5 = a3;
  unint64_t v6 = self;
  CAFVentObservable.ventService(_:didUpdateCurrentIndex:)();
}

- (void)ventService:(id)a3 didUpdateAutoMode:(BOOL)a4
{
  id v5 = a3;
  unint64_t v6 = self;
  CAFVentObservable.ventService(_:didUpdateAutoMode:)();
}

- (void)ventService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5 = a3;
  unint64_t v6 = self;
  CAFVentObservable.ventService(_:didUpdateOn:)();
}

- (void)ventService:(id)a3 didUpdateVehicleLayoutKey:(id)a4
{
}

- (void)ventService:(id)a3 didUpdateName:(id)a4
{
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFVentObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  CAFVentObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CAFVentObservable.serviceDidFinishGroupUpdate(_:)();
}

@end