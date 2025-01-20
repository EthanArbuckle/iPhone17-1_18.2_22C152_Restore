@interface CAFClimateControlsLockedObservable
- (NSString)description;
- (_TtC10CAFCombine34CAFClimateControlsLockedObservable)init;
- (void)climateControlsLockedService:(id)a3 didUpdateLockState:(unsigned __int8)a4;
- (void)climateControlsLockedService:(id)a3 didUpdateName:(id)a4;
- (void)climateControlsLockedService:(id)a3 didUpdateVehicleLayoutKey:(id)a4;
- (void)dealloc;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
@end

@implementation CAFClimateControlsLockedObservable

- (NSString)description
{
  v2 = self;
  uint64_t locked = CAFClimateControlsLockedObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](locked, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFClimateControlsLockedObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10CAFCombine34CAFClimateControlsLockedObservable_observed));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtC10CAFCombine34CAFClimateControlsLockedObservable)init
{
}

- (void)climateControlsLockedService:(id)a3 didUpdateLockState:(unsigned __int8)a4
{
  id v5 = a3;
  v6 = self;
  CAFClimateControlsLockedObservable.climateControlsLockedService(_:didUpdateLockState:)();
}

- (void)climateControlsLockedService:(id)a3 didUpdateVehicleLayoutKey:(id)a4
{
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  CAFClimateControlsLockedObservable.climateControlsLockedService(_:didUpdateVehicleLayoutKey:)();

  swift_bridgeObjectRelease();
}

- (void)climateControlsLockedService:(id)a3 didUpdateName:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  v7 = self;
  CAFClimateControlsLockedObservable.climateControlsLockedService(_:didUpdateName:)();

  swift_bridgeObjectRelease();
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFClimateControlsLockedObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  CAFClimateControlsLockedObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CAFClimateControlsLockedObservable.serviceDidFinishGroupUpdate(_:)();
}

@end