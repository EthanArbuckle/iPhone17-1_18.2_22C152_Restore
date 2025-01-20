@interface CAFTripObservable
- (NSString)description;
- (_TtC10CAFCombine17CAFTripObservable)init;
- (void)dealloc;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)tripService:(id)a3 didUpdateAverageSpeed:(id)a4;
- (void)tripService:(id)a3 didUpdateDistance:(id)a4;
- (void)tripService:(id)a3 didUpdateDuration:(id)a4;
- (void)tripService:(id)a3 didUpdateEnergy:(id)a4;
- (void)tripService:(id)a3 didUpdateEnergyEfficiency:(id)a4;
- (void)tripService:(id)a3 didUpdateFuelEfficiency:(id)a4;
- (void)tripService:(id)a3 didUpdateName:(id)a4;
- (void)tripService:(id)a3 didUpdateShowOdometer:(BOOL)a4;
- (void)tripService:(id)a3 didUpdateSortOrder:(unsigned __int8)a4;
- (void)tripService:(id)a3 didUpdateUserVisibleLabel:(id)a4;
@end

@implementation CAFTripObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFTripObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFTripObservable.__deallocating_deinit();
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
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtC10CAFCombine17CAFTripObservable)init
{
}

- (void)tripService:(id)a3 didUpdateUserVisibleLabel:(id)a4
{
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  CAFTripObservable.tripService(_:didUpdateUserVisibleLabel:)();

  swift_bridgeObjectRelease();
}

- (void)tripService:(id)a3 didUpdateSortOrder:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = self;
  CAFTripObservable.tripService(_:didUpdateSortOrder:)();
}

- (void)tripService:(id)a3 didUpdateAverageSpeed:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Measurement<NSUnitSpeed>?);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    type metadata accessor for CAFTemperature(0, &lazy cache variable for type metadata for NSUnitSpeed);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitSpeed>);
    uint64_t v11 = (uint64_t)v9;
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitSpeed>);
    uint64_t v11 = (uint64_t)v9;
    uint64_t v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v11, v12, 1, v10);
  id v13 = a3;
  v14 = self;
  CAFTripObservable.tripService(_:didUpdateAverageSpeed:)((uint64_t)v14, (uint64_t)v9);

  outlined destroy of Measurement<NSUnitTemperature>?((uint64_t)v9, (uint64_t *)&demangling cache variable for type metadata for Measurement<NSUnitSpeed>?);
}

- (void)tripService:(id)a3 didUpdateDistance:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Measurement<NSUnitLength>?);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    type metadata accessor for CAFTemperature(0, &lazy cache variable for type metadata for NSUnitLength);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Measurement<NSUnitLength>);
    uint64_t v11 = (uint64_t)v9;
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Measurement<NSUnitLength>);
    uint64_t v11 = (uint64_t)v9;
    uint64_t v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v11, v12, 1, v10);
  id v13 = a3;
  v14 = self;
  CAFTripObservable.tripService(_:didUpdateDistance:)((uint64_t)v14, (uint64_t)v9);

  outlined destroy of Measurement<NSUnitTemperature>?((uint64_t)v9, (uint64_t *)&demangling cache variable for type metadata for Measurement<NSUnitLength>?);
}

- (void)tripService:(id)a3 didUpdateDuration:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitDuration>?);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    type metadata accessor for CAFTemperature(0, (unint64_t *)&lazy cache variable for type metadata for NSUnitDuration);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitDuration>);
    uint64_t v11 = (uint64_t)v9;
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitDuration>);
    uint64_t v11 = (uint64_t)v9;
    uint64_t v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v11, v12, 1, v10);
  id v13 = a3;
  v14 = self;
  CAFTripObservable.tripService(_:didUpdateDuration:)((uint64_t)v14, (uint64_t)v9);

  outlined destroy of Measurement<NSUnitTemperature>?((uint64_t)v9, &demangling cache variable for type metadata for Measurement<NSUnitDuration>?);
}

- (void)tripService:(id)a3 didUpdateEnergy:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitEnergy>?);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    type metadata accessor for CAFTemperature(0, &lazy cache variable for type metadata for NSUnitEnergy);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitEnergy>);
    uint64_t v11 = (uint64_t)v9;
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitEnergy>);
    uint64_t v11 = (uint64_t)v9;
    uint64_t v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v11, v12, 1, v10);
  id v13 = a3;
  v14 = self;
  CAFTripObservable.tripService(_:didUpdateEnergy:)((uint64_t)v14, (uint64_t)v9);

  outlined destroy of Measurement<NSUnitTemperature>?((uint64_t)v9, &demangling cache variable for type metadata for Measurement<NSUnitEnergy>?);
}

- (void)tripService:(id)a3 didUpdateEnergyEfficiency:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitEnergyEfficiency>?);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    type metadata accessor for CAFTemperature(0, (unint64_t *)&lazy cache variable for type metadata for CAFUnitEnergyEfficiency);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitEnergyEfficiency>);
    uint64_t v11 = (uint64_t)v9;
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitEnergyEfficiency>);
    uint64_t v11 = (uint64_t)v9;
    uint64_t v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v11, v12, 1, v10);
  id v13 = a3;
  v14 = self;
  CAFTripObservable.tripService(_:didUpdateEnergyEfficiency:)((uint64_t)v14, (uint64_t)v9);

  outlined destroy of Measurement<NSUnitTemperature>?((uint64_t)v9, &demangling cache variable for type metadata for Measurement<CAFUnitEnergyEfficiency>?);
}

- (void)tripService:(id)a3 didUpdateFuelEfficiency:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Measurement<NSUnitFuelEfficiency>?);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    type metadata accessor for CAFTemperature(0, &lazy cache variable for type metadata for NSUnitFuelEfficiency);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitFuelEfficiency>);
    uint64_t v11 = (uint64_t)v9;
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitFuelEfficiency>);
    uint64_t v11 = (uint64_t)v9;
    uint64_t v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v11, v12, 1, v10);
  id v13 = a3;
  v14 = self;
  CAFTripObservable.tripService(_:didUpdateFuelEfficiency:)((uint64_t)v14, (uint64_t)v9);

  outlined destroy of Measurement<NSUnitTemperature>?((uint64_t)v9, (uint64_t *)&demangling cache variable for type metadata for Measurement<NSUnitFuelEfficiency>?);
}

- (void)tripService:(id)a3 didUpdateShowOdometer:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  CAFTripObservable.tripService(_:didUpdateShowOdometer:)();
}

- (void)tripService:(id)a3 didUpdateName:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  uint64_t v7 = self;
  CAFTripObservable.tripService(_:didUpdateName:)();

  swift_bridgeObjectRelease();
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = self;
  CAFTripObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  CAFTripObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CAFTripObservable.serviceDidFinishGroupUpdate(_:)();
}

@end