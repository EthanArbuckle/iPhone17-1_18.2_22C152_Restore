@interface CAFTirePressureObservable
- (NSString)description;
- (_TtC10CAFCombine25CAFTirePressureObservable)init;
- (void)dealloc;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)tirePressureService:(id)a3 didUpdateName:(id)a4;
- (void)tirePressureService:(id)a3 didUpdatePressure:(id)a4;
- (void)tirePressureService:(id)a3 didUpdatePressureState:(unsigned __int8)a4;
- (void)tirePressureService:(id)a3 didUpdateSensorState:(unsigned __int8)a4;
- (void)tirePressureService:(id)a3 didUpdateVehicleLayoutKey:(id)a4;
@end

@implementation CAFTirePressureObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFTirePressureObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFTirePressureObservable.__deallocating_deinit();
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

- (_TtC10CAFCombine25CAFTirePressureObservable)init
{
}

- (void)tirePressureService:(id)a3 didUpdateSensorState:(unsigned __int8)a4
{
  id v6 = a3;
  v7 = self;
  CAFTirePressureObservable.tirePressureService(_:didUpdateSensorState:)((uint64_t)v7, a4);
}

- (void)tirePressureService:(id)a3 didUpdatePressure:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitPressure>);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CAFTemperature(0, (unint64_t *)&lazy cache variable for type metadata for NSUnitPressure);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  CAFTirePressureObservable.tirePressureService(_:didUpdatePressure:)((uint64_t)v11, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)tirePressureService:(id)a3 didUpdatePressureState:(unsigned __int8)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  CAFTirePressureObservable.tirePressureService(_:didUpdatePressureState:)((uint64_t)v7, a4);
}

- (void)tirePressureService:(id)a3 didUpdateVehicleLayoutKey:(id)a4
{
}

- (void)tirePressureService:(id)a3 didUpdateName:(id)a4
{
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFTirePressureObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  CAFTirePressureObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  CAFTirePressureObservable.serviceDidFinishGroupUpdate(_:)();
}

@end