@interface CAFCarObservable
- (_TtC10CAFCombine16CAFCarObservable)init;
- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)carDidUpdateAccessories:(id)a3;
- (void)dealloc;
@end

@implementation CAFCarObservable

- (void)dealloc
{
  v2 = self;
  CAFCarObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Bool>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v3 = OUTLINED_FUNCTION_4_3();
  v4(v3);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFAudioSettings?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v5 = OUTLINED_FUNCTION_4_3();
  v6(v5);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFAutomakerExteriorCamera?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v7 = OUTLINED_FUNCTION_4_3();
  v8(v7);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[CAFAutomakerInputStreams]>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v9 = OUTLINED_FUNCTION_4_3();
  v10(v9);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFAutomakerNotificationHistory?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v11 = OUTLINED_FUNCTION_4_3();
  v12(v11);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[CAFAutomakerNotifications]>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v13 = OUTLINED_FUNCTION_4_3();
  v14(v13);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[CAFAutomakerRequestContent]>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v15 = OUTLINED_FUNCTION_4_3();
  v16(v15);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFAutomakerSettings?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v17 = OUTLINED_FUNCTION_4_3();
  v18(v17);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFCharging?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v19 = OUTLINED_FUNCTION_4_3();
  v20(v19);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFClimate?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v21 = OUTLINED_FUNCTION_4_3();
  v22(v21);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFClosure?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v23 = OUTLINED_FUNCTION_4_3();
  v24(v23);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFDriveState?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v25 = OUTLINED_FUNCTION_4_3();
  v26(v25);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFDriverAssistance?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v27 = OUTLINED_FUNCTION_4_3();
  v28(v27);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFElectricEngine?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v29 = OUTLINED_FUNCTION_4_3();
  v30(v29);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFEnvironmentalConditions?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v31 = OUTLINED_FUNCTION_4_3();
  v32(v31);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFFuel?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v33 = OUTLINED_FUNCTION_4_3();
  v34(v33);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFHighVoltageBattery?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v35 = OUTLINED_FUNCTION_4_3();
  v36(v35);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFInternalCombustionEngine?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v37 = OUTLINED_FUNCTION_4_3();
  v38(v37);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFMedia?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v39 = OUTLINED_FUNCTION_4_3();
  v40(v39);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFNowPlayingInformation?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v41 = OUTLINED_FUNCTION_4_3();
  v42(v41);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFPairedDevices?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v43 = OUTLINED_FUNCTION_4_3();
  v44(v43);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFSeat?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v45 = OUTLINED_FUNCTION_4_3();
  v46(v45);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[CAFTestingUseOnly]>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v47 = OUTLINED_FUNCTION_4_3();
  v48(v47);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFTire?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v49 = OUTLINED_FUNCTION_4_3();
  v50(v49);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFTripComputer?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v51 = OUTLINED_FUNCTION_4_3();
  v52(v51);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[CAFUIControl]>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v53 = OUTLINED_FUNCTION_4_3();
  v54(v53);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFVehicleMotion?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v55 = OUTLINED_FUNCTION_4_3();
  v56(v55);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFVehicleResources?>);
  OUTLINED_FUNCTION_1_2();
  uint64_t v57 = OUTLINED_FUNCTION_4_3();
  v58(v57);
  v59 = (char *)self + OBJC_IVAR____TtC10CAFCombine16CAFCarObservable__vehicleUnits;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFVehicleUnits?>);
  v61 = *(void (**)(char *, uint64_t))(*(void *)(v60 - 8) + 8);

  v61(v59, v60);
}

- (_TtC10CAFCombine16CAFCarObservable)init
{
}

- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  CAFCarObservable.carDidUpdate(_:receivedAllValues:)((uint64_t)v6, a4);
}

- (void)carDidUpdateAccessories:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  CAFCarObservable.carDidUpdateAccessories(_:)();
}

@end