@interface CAFTypeTestIndexByUnitObservable
- (NSString)description;
- (_TtC10CAFCombine32CAFTypeTestIndexByUnitObservable)init;
- (void)dealloc;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)typeTestIndexByUnitService:(id)a3 didUpdateDistanceUnitRawValue:(unsigned __int16)a4;
- (void)typeTestIndexByUnitService:(id)a3 didUpdateName:(id)a4;
- (void)typeTestIndexByUnitService:(id)a3 didUpdateTestInt32:(int)a4;
@end

@implementation CAFTypeTestIndexByUnitObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFTypeTestIndexByUnitObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFTypeTestIndexByUnitObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtC10CAFCombine32CAFTypeTestIndexByUnitObservable)init
{
}

- (void)typeTestIndexByUnitService:(id)a3 didUpdateDistanceUnitRawValue:(unsigned __int16)a4
{
  id v5 = a3;
  v6 = self;
  CAFTypeTestIndexByUnitObservable.typeTestIndexByUnitService(_:didUpdateDistanceUnitRawValue:)();
}

- (void)typeTestIndexByUnitService:(id)a3 didUpdateTestInt32:(int)a4
{
  id v5 = a3;
  v6 = self;
  CAFTypeTestIndexByUnitObservable.typeTestIndexByUnitService(_:didUpdateTestInt32:)();
}

- (void)typeTestIndexByUnitService:(id)a3 didUpdateName:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  v7 = self;
  CAFTypeTestIndexByUnitObservable.typeTestIndexByUnitService(_:didUpdateName:)();

  swift_bridgeObjectRelease();
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFTypeTestIndexByUnitObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  CAFTypeTestIndexByUnitObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CAFTypeTestIndexByUnitObservable.serviceDidFinishGroupUpdate(_:)();
}

@end