@interface CAFEngineRPMObservable
- (NSString)description;
- (_TtC10CAFCombine22CAFEngineRPMObservable)init;
- (void)dealloc;
- (void)engineRPMService:(id)a3 didUpdateRotationalSpeed:(id)a4;
- (void)engineRPMService:(id)a3 didUpdateRotationalSpeedMarkerRedline:(id)a4;
- (void)engineRPMService:(id)a3 didUpdateRotationalSpeedMax:(id)a4;
- (void)engineRPMService:(id)a3 didUpdateRotationalSpeedState:(unsigned __int8)a4;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
@end

@implementation CAFEngineRPMObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFEngineRPMObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFEngineRPMObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtC10CAFCombine22CAFEngineRPMObservable)init
{
}

- (void)engineRPMService:(id)a3 didUpdateRotationalSpeed:(id)a4
{
}

- (void)engineRPMService:(id)a3 didUpdateRotationalSpeedState:(unsigned __int8)a4
{
  id v5 = a3;
  v6 = self;
  CAFEngineRPMObservable.engineRPMService(_:didUpdateRotationalSpeedState:)();
}

- (void)engineRPMService:(id)a3 didUpdateRotationalSpeedMarkerRedline:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitRotationalSpeed>?);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    type metadata accessor for CAFTemperature(0, (unint64_t *)&lazy cache variable for type metadata for CAFUnitRotationalSpeed);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitRotationalSpeed>);
    uint64_t v11 = (uint64_t)v9;
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitRotationalSpeed>);
    uint64_t v11 = (uint64_t)v9;
    uint64_t v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v11, v12, 1, v10);
  id v13 = a3;
  v14 = self;
  CAFEngineRPMObservable.engineRPMService(_:didUpdateRotationalSpeedMarkerRedline:)((uint64_t)v14, (uint64_t)v9);

  outlined destroy of Measurement<CAFUnitRotationalSpeed>?((uint64_t)v9);
}

- (void)engineRPMService:(id)a3 didUpdateRotationalSpeedMax:(id)a4
{
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = self;
  CAFEngineRPMObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  CAFEngineRPMObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CAFEngineRPMObservable.serviceDidFinishGroupUpdate(_:)();
}

@end