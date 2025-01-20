@interface CAFFuelLevelObservable
- (NSString)description;
- (_TtC10CAFCombine22CAFFuelLevelObservable)init;
- (void)dealloc;
- (void)fuelLevelService:(id)a3 didUpdateFillLevelLabel:(unsigned __int8)a4;
- (void)fuelLevelService:(id)a3 didUpdateFuelLevel:(id)a4;
- (void)fuelLevelService:(id)a3 didUpdateFuelLevelMarkerLow:(id)a4;
- (void)fuelLevelService:(id)a3 didUpdateFuelLevelState:(unsigned __int8)a4;
- (void)fuelLevelService:(id)a3 didUpdatePortSideIndicator:(unsigned __int8)a4;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
@end

@implementation CAFFuelLevelObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFFuelLevelObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFFuelLevelObservable.__deallocating_deinit();
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

- (_TtC10CAFCombine22CAFFuelLevelObservable)init
{
}

- (void)fuelLevelService:(id)a3 didUpdateFuelLevel:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitPercent>);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CAFTemperature(0, &lazy cache variable for type metadata for CAFUnitPercent);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  CAFFuelLevelObservable.fuelLevelService(_:didUpdateFuelLevel:)((uint64_t)v11, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)fuelLevelService:(id)a3 didUpdateFuelLevelState:(unsigned __int8)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  CAFFuelLevelObservable.fuelLevelService(_:didUpdateFuelLevelState:)((uint64_t)v7, a4);
}

- (void)fuelLevelService:(id)a3 didUpdateFuelLevelMarkerLow:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Measurement<CAFUnitPercent>?);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    type metadata accessor for CAFTemperature(0, &lazy cache variable for type metadata for CAFUnitPercent);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitPercent>);
    uint64_t v11 = (uint64_t)v9;
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitPercent>);
    uint64_t v11 = (uint64_t)v9;
    uint64_t v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v11, v12, 1, v10);
  id v13 = a3;
  v14 = self;
  CAFFuelLevelObservable.fuelLevelService(_:didUpdateFuelLevelMarkerLow:)((uint64_t)v14, (uint64_t)v9);

  outlined destroy of Measurement<CAFUnitPercent>?((uint64_t)v9);
}

- (void)fuelLevelService:(id)a3 didUpdateFillLevelLabel:(unsigned __int8)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  CAFFuelLevelObservable.fuelLevelService(_:didUpdateFillLevelLabel:)((uint64_t)v7, a4);
}

- (void)fuelLevelService:(id)a3 didUpdatePortSideIndicator:(unsigned __int8)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  CAFFuelLevelObservable.fuelLevelService(_:didUpdatePortSideIndicator:)((uint64_t)v7, a4);
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = self;
  CAFFuelLevelObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  CAFFuelLevelObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  CAFFuelLevelObservable.serviceDidFinishGroupUpdate(_:)();
}

@end