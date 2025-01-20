@interface CAFDimensionObservable
- (_TtC10CAFCombine22CAFDimensionObservable)init;
- (void)dealloc;
- (void)dimensionManager:(id)a3 didUpdateLocale:(id)a4;
- (void)dimensionManager:(id)a3 didUpdateMeasurementSystem:(unint64_t)a4;
- (void)dimensionManager:(id)a3 didUpdateTemperatureUnit:(id)a4;
- (void)dimensionManager:(id)a3 didUpdateTirePressureUnit:(id)a4;
- (void)dimensionManager:(id)a3 didUpdateVehicleChargePowerUnit:(id)a4;
- (void)dimensionManager:(id)a3 didUpdateVehicleFuelEfficiencyUnit:(id)a4;
- (void)dimensionManager:(id)a3 didUpdateVehicleRangeUnit:(id)a4;
- (void)dimensionManager:(id)a3 didUpdateVehicleSpeedUnit:(id)a4;
@end

@implementation CAFDimensionObservable

- (void)dealloc
{
  v2 = self;
  CAFDimensionObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Locale>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v3 = OUTLINED_FUNCTION_4_3();
  v4(v3);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFMeasurementSystem>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v5 = OUTLINED_FUNCTION_4_3();
  v6(v5);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<NSUnitTemperature>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v7 = OUTLINED_FUNCTION_4_3();
  v8(v7);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<NSUnitPressure>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v9 = OUTLINED_FUNCTION_4_3();
  v10(v9);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<NSUnitSpeed>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v11 = OUTLINED_FUNCTION_4_3();
  v12(v11);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<NSUnitLength>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v13 = OUTLINED_FUNCTION_4_3();
  v14(v13);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<NSUnitFuelEfficiency>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v15 = OUTLINED_FUNCTION_4_3();
  v16(v15);
  v17 = (char *)self + OBJC_IVAR____TtC10CAFCombine22CAFDimensionObservable__vehicleChargePowerUnit;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<NSUnitPower>);
  v19 = *(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8);

  v19(v17, v18);
}

- (_TtC10CAFCombine22CAFDimensionObservable)init
{
}

- (void)dimensionManager:(id)a3 didUpdateLocale:(id)a4
{
  uint64_t v6 = type metadata accessor for Locale();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Locale._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  CAFDimensionObservable.dimensionManager(_:didUpdate:)((uint64_t)v11, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)dimensionManager:(id)a3 didUpdateMeasurementSystem:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  CAFDimensionObservable.dimensionManager(_:didUpdate:)();
}

- (void)dimensionManager:(id)a3 didUpdateTemperatureUnit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  CAFDimensionObservable.dimensionManager(_:didUpdateTemperatureUnit:)((uint64_t)v8, v7);
}

- (void)dimensionManager:(id)a3 didUpdateTirePressureUnit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  CAFDimensionObservable.dimensionManager(_:didUpdateTirePressureUnit:)((uint64_t)v8, v7);
}

- (void)dimensionManager:(id)a3 didUpdateVehicleSpeedUnit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  CAFDimensionObservable.dimensionManager(_:didUpdateVehicleSpeedUnit:)((uint64_t)v8, v7);
}

- (void)dimensionManager:(id)a3 didUpdateVehicleRangeUnit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  CAFDimensionObservable.dimensionManager(_:didUpdateVehicleRangeUnit:)((uint64_t)v8, v7);
}

- (void)dimensionManager:(id)a3 didUpdateVehicleFuelEfficiencyUnit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  CAFDimensionObservable.dimensionManager(_:didUpdateVehicleFuelEfficiencyUnit:)((uint64_t)v8, v7);
}

- (void)dimensionManager:(id)a3 didUpdateVehicleChargePowerUnit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  CAFDimensionObservable.dimensionManager(_:didUpdateVehicleChargePowerUnit:)((uint64_t)v8, v7);
}

@end