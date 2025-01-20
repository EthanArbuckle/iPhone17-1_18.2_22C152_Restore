uint64_t protocol witness for IntentExtensionCommunicatingAsync.makeIntentExecutionBehavior(app:intent:) in conformance TrafficIncidentBaseRCHStrategy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v8;
  uint64_t v9;
  uint64_t v11;

  v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  v9 = type metadata accessor for TrafficIncidentBaseRCHStrategy();
  *v8 = v4;
  v8[1] = protocol witness for IntentExtensionCommunicatingAsync.makeIntentExecutionBehavior(app:intent:) in conformance TrafficIncidentHandleIntentStrategy;
  return IntentExtensionCommunicatingAsync.makeIntentExecutionBehavior(app:intent:)(a1, a2, v9, a4);
}

uint64_t base witness table accessor for ResolveConfirmFlowStrategyAsync in TrafficIncidentBaseRCHStrategy(uint64_t a1, uint64_t a2)
{
  return _s21GeoFlowDelegatePlugin12RuntimeErrorCACs0F0AAWlTm_5(&lazy protocol witness table cache variable for type TrafficIncidentBaseRCHStrategy and conformance TrafficIncidentBaseRCHStrategy, a2, (void (*)(uint64_t))type metadata accessor for TrafficIncidentBaseRCHStrategy);
}

uint64_t type metadata accessor for TrafficIncidentBaseRCHStrategy()
{
  return self;
}

uint64_t base witness table accessor for IntentExtensionCommunicatingAsync in TrafficIncidentBaseRCHStrategy(uint64_t a1, uint64_t a2)
{
  return _s21GeoFlowDelegatePlugin12RuntimeErrorCACs0F0AAWlTm_5(&lazy protocol witness table cache variable for type TrafficIncidentBaseRCHStrategy and conformance TrafficIncidentBaseRCHStrategy, a2, (void (*)(uint64_t))type metadata accessor for TrafficIncidentBaseRCHStrategy);
}

uint64_t base witness table accessor for RouteConfirmIntentResponseFlowStrategyAsync in TrafficIncidentBaseRCHStrategy(uint64_t a1, uint64_t a2)
{
  return _s21GeoFlowDelegatePlugin12RuntimeErrorCACs0F0AAWlTm_5(&lazy protocol witness table cache variable for type TrafficIncidentBaseRCHStrategy and conformance TrafficIncidentBaseRCHStrategy, a2, (void (*)(uint64_t))type metadata accessor for TrafficIncidentBaseRCHStrategy);
}

uint64_t _s21GeoFlowDelegatePlugin12RuntimeErrorCACs0F0AAWlTm_5(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t WhereAmIFlow.__allocating_init()()
{
  v2[3] = &type metadata for FlowHelperImpl;
  v2[4] = &protocol witness table for FlowHelperImpl;
  v2[0] = swift_allocObject();
  FlowHelperImpl.init()((void *)(v2[0] + 16));
  return (*(uint64_t (**)(void *))(v0 + 160))(v2);
}

uint64_t sub_B72E4()
{
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 56);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 104);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 144);
  swift_release();

  return _swift_deallocObject(v0, 192, 7);
}

uint64_t CLPlacemark.makeDialogLocation()()
{
  v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  v47 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  v7 = (char *)&v46 - v6;
  uint64_t v8 = __chkstk_darwin(v5);
  v10 = (char *)&v46 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  v13 = (char *)&v46 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  v16 = (char *)&v46 - v15;
  __chkstk_darwin(v14);
  v18 = (char *)&v46 - v17;
  type metadata accessor for DialogLocationAddress.Builder();
  swift_allocObject();
  DialogLocationAddress.Builder.init()();
  id v19 = [v0 fullThoroughfare];
  if (v19)
  {
    v20 = v19;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    String.toSpeakableString.getter();
    swift_bridgeObjectRelease();
    uint64_t v21 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 0, 1, v21);
  }
  else
  {
    uint64_t v22 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v18, 1, 1, v22);
  }
  dispatch thunk of DialogLocationAddress.Builder.withFullThoroughfare(_:)();
  swift_release();
  outlined destroy of SpeakableString?((uint64_t)v18);
  id v23 = [v1 locality];
  if (v23)
  {
    v24 = v23;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    String.toSpeakableString.getter();
    swift_bridgeObjectRelease();
    uint64_t v25 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v16, 0, 1, v25);
  }
  else
  {
    uint64_t v26 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v16, 1, 1, v26);
  }
  dispatch thunk of DialogLocationAddress.Builder.withLocality(_:)();
  swift_release();
  outlined destroy of SpeakableString?((uint64_t)v16);
  id v27 = [v1 country];
  if (v27)
  {
    v28 = v27;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    String.toSpeakableString.getter();
    swift_bridgeObjectRelease();
    uint64_t v29 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v13, 0, 1, v29);
  }
  else
  {
    uint64_t v30 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v13, 1, 1, v30);
  }
  dispatch thunk of DialogLocationAddress.Builder.withCountry(_:)();
  swift_release();
  outlined destroy of SpeakableString?((uint64_t)v13);
  id v31 = [v1 administrativeArea];
  if (v31)
  {
    v32 = v31;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    String.toSpeakableString.getter();
    swift_bridgeObjectRelease();
    uint64_t v33 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v10, 0, 1, v33);
  }
  else
  {
    uint64_t v34 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v10, 1, 1, v34);
  }
  dispatch thunk of DialogLocationAddress.Builder.withAdministrativeArea(_:)();
  swift_release();
  outlined destroy of SpeakableString?((uint64_t)v10);
  id v35 = [v1 subLocality];
  if (v35)
  {
    v36 = v35;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    String.toSpeakableString.getter();
    swift_bridgeObjectRelease();
    uint64_t v37 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v7, 0, 1, v37);
  }
  else
  {
    uint64_t v38 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v7, 1, 1, v38);
  }
  dispatch thunk of DialogLocationAddress.Builder.withSubLocality(_:)();
  swift_release();
  outlined destroy of SpeakableString?((uint64_t)v7);
  id v39 = [v1 postalCode];
  if (v39)
  {
    v40 = v39;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v41 = (uint64_t)v47;
    String.toSpeakableString.getter();
    swift_bridgeObjectRelease();
    uint64_t v42 = type metadata accessor for SpeakableString();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v41, 0, 1, v42);
  }
  else
  {
    uint64_t v43 = type metadata accessor for SpeakableString();
    uint64_t v41 = (uint64_t)v47;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v47, 1, 1, v43);
  }
  dispatch thunk of DialogLocationAddress.Builder.withPostCode(_:)();
  swift_release();
  outlined destroy of SpeakableString?(v41);
  uint64_t v44 = dispatch thunk of DialogLocationAddress.Builder.build()();
  swift_release();
  return v44;
}

void *WhereAmIFlow.flowState.getter()
{
  swift_beginAccess();
  v1 = *(void **)(v0 + 24);
  outlined copy of TrafficIncidentRequestSupportedCheckFlow.RequestSupportedExitValue(v1, *(unsigned char *)(v0 + 32));
  return v1;
}

void WhereAmIFlow.flowState.setter(uint64_t a1, char a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = a1;
  char v6 = *(unsigned char *)(v2 + 32);
  *(unsigned char *)(v2 + 32) = a2;
  outlined consume of TrafficIncidentRequestSupportedCheckFlow.RequestSupportedExitValue(v5, v6);
}

uint64_t WhereAmIFlow.catService.getter()
{
  return swift_retain();
}

uint64_t WhereAmIFlow.__allocating_init(with:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  __chkstk_darwin(v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  uint64_t v9 = specialized WhereAmIFlow.init(with:)((uint64_t)v7, v2, v3, v4);
  __swift_destroy_boxed_opaque_existential_0Tm(a1);
  return v9;
}

uint64_t WhereAmIFlow.init(with:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  __chkstk_darwin(v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  uint64_t v9 = specialized WhereAmIFlow.init(with:)((uint64_t)v7, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_0Tm(a1);
  return v9;
}

uint64_t WhereAmIFlow.executeState()(uint64_t a1)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = v1;
  return _swift_task_switch(WhereAmIFlow.executeState(), 0, 0);
}

uint64_t WhereAmIFlow.executeState()()
{
  uint64_t v23 = v0;
  uint64_t v1 = (*(uint64_t (**)(void))(**(void **)(v0 + 48) + 112))();
  uint64_t v3 = (void *)v1;
  *(void *)(v0 + 56) = v1;
  if (v2)
  {
    if (v2 == 1)
    {
      uint64_t v4 = *(void *)(v0 + 48);
      os_log_type_t v5 = static os_log_type_t.default.getter();
      uint64_t v6 = *(NSObject **)(v4 + 16);
      os_log_type_t v7 = v5;
      if (os_log_type_enabled(v6, v5))
      {
        outlined copy of TrafficIncidentRequestSupportedCheckFlow.RequestSupportedExitValue(v3, 1);
        outlined copy of TrafficIncidentRequestSupportedCheckFlow.RequestSupportedExitValue(v3, 1);
        uint64_t v8 = (uint8_t *)swift_slowAlloc();
        uint64_t v22 = swift_slowAlloc();
        *(_DWORD *)uint64_t v8 = 136315138;
        *(void *)(v0 + 16) = v3;
        swift_errorRetain();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
        uint64_t v9 = String.init<A>(describing:)();
        *(void *)(v0 + 24) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v22);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        outlined consume of TrafficIncidentRequestSupportedCheckFlow.RequestSupportedExitValue(v3, 1);
        outlined consume of TrafficIncidentRequestSupportedCheckFlow.RequestSupportedExitValue(v3, 1);
        _os_log_impl(&dword_0, v6, v7, "WhereAmIFlow execute request unsupported with err: %s", v8, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      static ExecuteResponse.complete()();
      outlined consume of TrafficIncidentRequestSupportedCheckFlow.RequestSupportedExitValue(v3, 1);
      goto LABEL_14;
    }
    if (v1)
    {
      if (v1 != 1)
      {
        static os_log_type_t.default.getter();
        os_log(_:dso:log:_:_:)();
        static ExecuteResponse.complete()();
LABEL_14:
        v16 = *(uint64_t (**)(void))(v0 + 8);
        return v16();
      }
    }
    else
    {
      static os_log_type_t.default.getter();
      os_log(_:dso:log:_:_:)();
      if ([self isSiriLocationServicesPromptingEnabled])
      {
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CommonFlowGuard>);
        type metadata accessor for CommonFlowGuard();
        *(_OWORD *)(swift_allocObject() + 16) = xmmword_C0600;
        static CommonFlowGuard.ensuringSiriLocationAccess(needsPreciseLocation:)();
        uint64_t v15 = static CommonGuardFlowUtils.makeGuardFlow(withGuards:)();
        swift_bridgeObjectRelease();
        *(void *)(v0 + 32) = v15;
        type metadata accessor for GuardFlow();
        swift_retain();
        static ExecuteResponse.ongoing<A>(next:childCompletion:)();
        swift_release();
        swift_release();
        goto LABEL_14;
      }
      (*(void (**)(uint64_t, uint64_t))(**(void **)(v0 + 48) + 120))(1, 2);
    }
    uint64_t v17 = *(void *)(v0 + 48);
    static os_log_type_t.default.getter();
    os_log(_:dso:log:_:_:)();
    uint64_t v21 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v17 + 184) + **(int **)(*(void *)v17 + 184));
    v18 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v18;
    void *v18 = v0;
    v18[1] = AnswerETAFlow.executeState();
    uint64_t v19 = *(void *)(v0 + 40);
    return v21(v19);
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 48);
    static os_log_type_t.info.getter();
    os_log(_:dso:log:_:_:)();
    v20 = (uint64_t (*)(uint64_t, void *))(*(void *)(*(void *)v11 + 192)
                                                  + **(int **)(*(void *)v11 + 192));
    uint64_t v12 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v12;
    *uint64_t v12 = v0;
    v12[1] = WhereAmIFlow.executeState();
    uint64_t v13 = *(void *)(v0 + 40);
    return v20(v13, v3);
  }
}

{
  uint64_t v1;

  swift_task_dealloc();
  return _swift_task_switch(WhereAmIFlow.executeState(), 0, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  outlined consume of TrafficIncidentRequestSupportedCheckFlow.RequestSupportedExitValue(*(id *)(v0 + 56), 0);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t closure #1 in WhereAmIFlow.executeState()(unsigned __int8 *a1, uint64_t a2)
{
  int v3 = *a1;
  static os_log_type_t.info.getter();
  os_log(_:dso:log:_:_:)();
  if (v3 == 1)
  {
    static os_log_type_t.error.getter();
    uint64_t v4 = 2;
    os_log(_:dso:log:_:_:)();
  }
  else
  {
    static os_log_type_t.info.getter();
    os_log(_:dso:log:_:_:)();
    uint64_t v4 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 120))(v4, 2);
}

uint64_t WhereAmIFlow.preChecks()(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return _swift_task_switch(WhereAmIFlow.preChecks(), 0, 0);
}

uint64_t WhereAmIFlow.preChecks()()
{
  uint64_t v4 = v0;
  (*(void (**)(long long *__return_ptr))(**(void **)(v0 + 32) + 136))(v3);
  type metadata accessor for LocationFetchFlow();
  swift_allocObject();
  *(void *)(v0 + 16) = LocationFetchFlow.init(flowHelper:requiredAccess:)(v3, 3);
  _s21GeoFlowDelegatePlugin013LocationFetchB0CAC07SiriKitB00B0AAWlTm_0(&lazy protocol witness table cache variable for type LocationFetchFlow and conformance LocationFetchFlow, 255, (void (*)(uint64_t))type metadata accessor for LocationFetchFlow);
  swift_retain();
  static ExecuteResponse.ongoing<A>(next:childCompletion:)();
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void closure #1 in WhereAmIFlow.preChecks()(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)a1;
  switch(*(unsigned char *)(a1 + 8))
  {
    case 1:
    case 2:
    case 3:
      static os_log_type_t.info.getter();
      os_log(_:dso:log:_:_:)();
      (*(void (**)(uint64_t, uint64_t))(*a2 + 120))(2, 2);
      break;
    default:
      uint64_t v4 = self;
      id v5 = v2;
      id v6 = [v4 placemarkWithLocation:v5 name:0 postalAddress:0];
      os_log_type_t v7 = static os_log_type_t.info.getter();
      uint64_t v8 = a2[2];
      os_log_type_t v9 = v7;
      if (os_log_type_enabled(v8, v7))
      {
        outlined copy of LocationFetchFlow.ExitValue(v2, 0);
        outlined copy of LocationFetchFlow.ExitValue(v2, 0);
        id v17 = v6;
        unint64_t v10 = (uint8_t *)swift_slowAlloc();
        uint64_t v18 = swift_slowAlloc();
        *(_DWORD *)unint64_t v10 = 136315138;
        id v11 = [v5 debugDescription];
        uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v14 = v13;

        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v14, &v18);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        outlined consume of LocationFetchFlow.ExitValue(v2, 0);
        outlined consume of LocationFetchFlow.ExitValue(v2, 0);
        _os_log_impl(&dword_0, v8, v9, "WhereAmIFlow continuing with location %s", v10, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        id v6 = v17;
        swift_slowDealloc();
      }
      uint64_t v15 = *(void (**)(id, void))(*a2 + 120);
      id v16 = v6;
      v15(v6, 0);

      outlined consume of LocationFetchFlow.ExitValue(v2, 0);
      break;
  }
}

uint64_t WhereAmIFlow.handle(location:)(uint64_t a1, uint64_t a2)
{
  v3[52] = a2;
  v3[53] = v2;
  v3[51] = a1;
  type metadata accessor for DialogPhase();
  v3[54] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for OutputGenerationManifest();
  v3[55] = v4;
  v3[56] = *(void *)(v4 - 8);
  v3[57] = swift_task_alloc();
  return _swift_task_switch(WhereAmIFlow.handle(location:), 0, 0);
}

uint64_t WhereAmIFlow.handle(location:)()
{
  uint64_t v14 = v0;
  uint64_t v1 = *(void *)(v0 + 424);
  os_log_type_t v2 = static os_log_type_t.info.getter();
  int v3 = *(NSObject **)(v1 + 16);
  *(void *)(v0 + 464) = v3;
  os_log_type_t v4 = v2;
  if (os_log_type_enabled(v3, v2))
  {
    id v5 = *(id *)(v0 + 416);
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    id v7 = [v5 debugDescription];
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;

    *(void *)(v0 + 400) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v8, v10, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_0, v3, v4, "RevGeocode location to get address: %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  id v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 472) = v11;
  *id v11 = v0;
  v11[1] = WhereAmIFlow.handle(location:);
  v11[17] = *(void *)(v0 + 416);
  return _swift_task_switch(CLPlacemark.withRevGeo(), 0, 0);
}

{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  void (*v3)(void *, void);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void *, void);
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *log;
  uint64_t v16[4];
  void *v17;
  uint64_t v18;

  id v17 = v0;
  uint64_t v1 = v0[58];
  os_log_type_t v2 = v0[53];
  static DialogPhase.summary.getter();
  OutputGenerationManifest.init(dialogPhase:_:)();
  OutputGenerationManifest.listenAfterSpeaking.setter();
  OutputGenerationManifest.responseViewId.setter();
  v16[3] = (uint64_t)&type metadata for String;
  v16[0] = 0;
  v16[1] = 0xE000000000000000;
  int v3 = (void (*)(void *, void))(*(uint64_t (**)(void *))(*(void *)v2 + 152))(v0 + 32);
  id v5 = *(void *)(v4 + 24);
  uint64_t v6 = *(void *)(v4 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v4, v5);
  id v7 = (void (*)(void *, void))(*(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 96))(v0 + 36, v5, v6);
  specialized Dictionary.subscript.setter((uint64_t)v16, 0x65736E6F70736572, 0xEC00000065646F4DLL);
  v7(v0 + 36, 0);
  v3(v0 + 32, 0);
  uint64_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v8))
  {
    log = v0[58];
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    v16[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v9 = 136315138;
    swift_beginAccess();
    _s21GeoFlowDelegatePlugin013LocationFetchB0CAC07SiriKitB00B0AAWlTm_0(&lazy protocol witness table cache variable for type OutputGenerationManifest and conformance OutputGenerationManifest, 255, (void (*)(uint64_t))&type metadata accessor for OutputGenerationManifest);
    unint64_t v10 = dispatch thunk of CustomStringConvertible.description.getter();
    v0[49] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, log, v8, "outputManifest: %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  v0[48] = _swiftEmptyArrayStorage;
  uint64_t v12 = (void *)swift_task_alloc();
  v0[61] = v12;
  *uint64_t v12 = v0;
  v12[1] = WhereAmIFlow.handle(location:);
  uint64_t v13 = v0[53];
  v12[23] = v0[60];
  v12[24] = v13;
  return _swift_task_switch(WhereAmIFlow.makeDialog(placemark:), 0, 0);
}

{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;

  uint64_t v1 = *(void **)(v0 + 496);
  static os_log_type_t.default.getter();
  os_log(_:dso:log:_:_:)();
  os_log_type_t v2 = v1;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((char *)&dword_10 + (*(void *)(v0 + 384) & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + (*(void *)(v0 + 384) & 0xFFFFFFFFFFFFFF8)) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  int v3 = *(void **)(v0 + 496);
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();

  id v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(**(void **)(v0 + 424) + 208)
                                                + **(int **)(**(void **)(v0 + 424) + 208));
  os_log_type_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 504) = v4;
  *os_log_type_t v4 = v0;
  v4[1] = WhereAmIFlow.handle(location:);
  id v5 = *(void *)(v0 + 480);
  return v7(v0 + 136, v5);
}

{
  uint64_t v1;

  swift_task_dealloc();
  return _swift_task_switch(WhereAmIFlow.handle(location:), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  char *v5;
  uint64_t v6;

  type metadata accessor for ResponseFactory();
  swift_allocObject();
  v0[64] = ResponseFactory.init()();
  uint64_t v1 = v0[48];
  v0[65] = v1;
  swift_beginAccess();
  id v5 = (char *)&async function pointer to dispatch thunk of ResponseFactory.makeResponseOutput(resultModel:dialog:outputGenerationManifest:)
     + async function pointer to dispatch thunk of ResponseFactory.makeResponseOutput(resultModel:dialog:outputGenerationManifest:);
  os_log_type_t v2 = (void *)swift_task_alloc();
  v0[66] = v2;
  *os_log_type_t v2 = v0;
  v2[1] = WhereAmIFlow.handle(location:);
  int v3 = v0[57];
  return ((uint64_t (*)(void *, void *, uint64_t, uint64_t))v5)(v0 + 22, v0 + 17, v1, v3);
}

{
  uint64_t v1;

  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  return _swift_task_switch(WhereAmIFlow.handle(location:), 0, 0);
}

{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);
  void *v14;
  uint64_t v15;
  NSObject *log;
  uint64_t v17;
  uint64_t v18[5];
  uint64_t v19;
  uint64_t v20;

  uint64_t v19 = v0;
  uint64_t v1 = *(NSObject **)(v0 + 464);
  os_log_type_t v2 = static os_log_type_t.default.getter();
  id v17 = v0 + 176;
  outlined init with copy of DeviceState(v0 + 176, v0 + 216);
  if (os_log_type_enabled(v1, v2))
  {
    log = *(NSObject **)(v0 + 464);
    int v3 = (uint8_t *)swift_slowAlloc();
    v18[0] = swift_slowAlloc();
    *(_DWORD *)int v3 = 136315138;
    outlined init with copy of DeviceState(v0 + 216, v0 + 56);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Output);
    os_log_type_t v4 = String.init<A>(describing:)();
    *(void *)(v0 + 376) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v5, v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 216);
    _os_log_impl(&dword_0, log, v2, "WhereAmIFlow completing with output: %s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = swift_slowDealloc();
  }
  else
  {
    uint64_t v6 = __swift_destroy_boxed_opaque_existential_0Tm(v0 + 216);
  }
  uint64_t v14 = *(void **)(v0 + 480);
  id v7 = *(void *)(v0 + 448);
  uint64_t v8 = *(void *)(v0 + 456);
  uint64_t v15 = *(void *)(v0 + 440);
  (*(void (**)(uint64_t))(**(void **)(v0 + 424) + 136))(v6);
  unint64_t v9 = *(void *)(v0 + 40);
  unint64_t v10 = *(void *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v9);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v10 + 104))(v18, v9, v10);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
  outlined init with copy of DeviceState(v17, v0 + 96);
  id v11 = swift_allocObject();
  outlined init with take of CATType((long long *)(v0 + 96), v11 + 16);
  type metadata accessor for SimpleOutputFlowAsync();
  swift_allocObject();
  *(void *)(v0 + 368) = SimpleOutputFlowAsync.init(outputPublisher:outputGenerator:)();
  static ExecuteResponse.complete<A>(next:)();

  swift_release();
  __swift_destroy_boxed_opaque_existential_0Tm(v17);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 136);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12();
}

uint64_t WhereAmIFlow.handle(location:)(uint64_t a1)
{
  *(void *)(*(void *)v1 + 480) = a1;
  swift_task_dealloc();
  return _swift_task_switch(WhereAmIFlow.handle(location:), 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;

  uint64_t v3 = *v2;
  *(void *)(v3 + 496) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_errorRelease();
    id v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(**(void **)(v3 + 424) + 208)
                                                  + **(int **)(**(void **)(v3 + 424) + 208));
    os_log_type_t v4 = (void *)swift_task_alloc();
    *(void *)(v3 + 504) = v4;
    *os_log_type_t v4 = v3;
    v4[1] = WhereAmIFlow.handle(location:);
    id v5 = *(void *)(v3 + 480);
    return v7(v3 + 136, v5);
  }
  else
  {
    return _swift_task_switch(WhereAmIFlow.handle(location:), 0, 0);
  }
}

uint64_t CLPlacemark.withRevGeo()()
{
  *(void *)(v1 + 136) = v0;
  return _swift_task_switch(CLPlacemark.withRevGeo(), 0, 0);
}

{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t (*v7)(id);
  uint64_t v8;

  uint64_t v1 = [*(id *)(v0 + 136) location];
  *(void *)(v0 + 144) = v1;
  if (v1)
  {
    os_log_type_t v2 = v1;
    *(void *)(v0 + 120) = 0;
    uint64_t v3 = specialized getter of coder #1 in CLPlacemark.withRevGeo()((void **)(v0 + 120));
    *(void *)(v0 + 152) = v3;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 128;
    *(void *)(v0 + 24) = CLPlacemark.withRevGeo();
    os_log_type_t v4 = swift_continuation_init();
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSArray?, @unowned NSError?) -> () with result type [CLPlacemark];
    *(void *)(v0 + 104) = &block_descriptor_3;
    *(void *)(v0 + 112) = v4;
    [v3 reverseGeocodeLocation:v2 completionHandler:v0 + 80];
    return _swift_continuation_await(v0 + 16);
  }
  else
  {
    id v7 = *(uint64_t (**)(id))(v0 + 8);
    id v5 = *(id *)(v0 + 136);
    return v7(v5);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v4;

  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 160) = v1;
  if (v1) {
    os_log_type_t v2 = CLPlacemark.withRevGeo();
  }
  else {
    os_log_type_t v2 = CLPlacemark.withRevGeo();
  }
  return _swift_task_switch(v2, 0, 0);
}

{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v9;

  uint64_t v1 = (void *)v0[19];
  uint64_t v3 = (void *)v0[17];
  os_log_type_t v2 = (void *)v0[18];
  swift_willThrow();

  os_log_type_t v4 = (void *)v0[15];
  id v5 = v3;
  swift_errorRelease();
  uint64_t v6 = v0[17];
  id v7 = (uint64_t (*)(uint64_t))v0[1];
  return v7(v6);
}

void CLPlacemark.withRevGeo()()
{
  unint64_t v1 = *(void *)(v0 + 128);

  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_3;
    }
LABEL_8:
    id v7 = *(void **)(v0 + 144);
    swift_bridgeObjectRelease();
    id v3 = [self placemarkWithLocation:v7 name:0 postalAddress:0];

    id v5 = *(void **)(v0 + 120);
    goto LABEL_9;
  }
  if (!*(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8))) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    id v2 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      return;
    }
    id v2 = *(id *)(v1 + 32);
  }
  id v3 = v2;
  os_log_type_t v4 = *(void **)(v0 + 144);
  swift_bridgeObjectRelease();
  id v5 = *(void **)(v0 + 120);

LABEL_9:
  uint64_t v8 = *(void (**)(id))(v0 + 8);
  v8(v3);
}

uint64_t closure #1 in WhereAmIFlow.handle(location:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(closure #1 in WhereAmIFlow.handle(location:), 0, 0);
}

uint64_t closure #1 in WhereAmIFlow.handle(location:)()
{
  outlined init with copy of DeviceState(v0[3], v0[2]);
  unint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t WhereAmIFlow.makeDialog(placemark:)(uint64_t a1)
{
  *(void *)(v2 + 184) = a1;
  *(void *)(v2 + 192) = v1;
  return _swift_task_switch(WhereAmIFlow.makeDialog(placemark:), 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  os_log_type_t v4 = *v2;
  *(void *)(*v2 + 240) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_release();
    id v5 = WhereAmIFlow.makeDialog(placemark:);
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    *(void *)(v4 + 248) = a1;
    __swift_destroy_boxed_opaque_existential_0Tm(v4 + 56);
    id v5 = WhereAmIFlow.makeDialog(placemark:);
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t WhereAmIFlow.makeDialog(placemark:)()
{
  id v27 = v0;
  uint64_t v1 = v0[24];
  uint64_t v2 = CLPlacemark.makeDialogLocation()();
  v0[25] = v2;
  swift_retain_n();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  os_log_type_t v4 = *(NSObject **)(v1 + 16);
  v0[26] = v4;
  os_log_type_t v5 = v3;
  uint64_t v6 = os_log_type_enabled(v4, v3);
  if (v6)
  {
    uint64_t v7 = v0[24];
    swift_retain_n();
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    buf = v8;
    (*(void (**)(void))(*(void *)v7 + 136))();
    uint64_t v9 = v0[20];
    uint64_t v10 = v0[21];
    __swift_project_boxed_opaque_existential_1(v0 + 17, v9);
    (*(void (**)(uint64_t, uint64_t))(v10 + 80))(v9, v10);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)(v0 + 17));
    uint64_t v11 = Dictionary.description.getter();
    unint64_t v13 = v12;
    swift_bridgeObjectRelease();
    v0[22] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v13, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_0, v4, v5, "catGlobals: %s", buf, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = swift_slowDealloc();
  }
  uint64_t v14 = *(void (**)(uint64_t))(*(void *)v0[24] + 136);
  v14(v6);
  uint64_t v15 = v0[5];
  uint64_t v16 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v15);
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 128))(v15, v16);
  v0[27] = v17;
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)(v0 + 2));
  v0[10] = &type metadata for LocationSearch;
  v0[11] = &protocol witness table for LocationSearch;
  v0[7] = v2;
  v0[8] = v2;
  uint64_t v18 = swift_retain_n();
  v14(v18);
  uint64_t v19 = v0[15];
  uint64_t v20 = v0[16];
  __swift_project_boxed_opaque_existential_1(v0 + 12, v19);
  uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 80))(v19, v20);
  v0[28] = v21;
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)(v0 + 12));
  uint64_t v25 = (uint64_t (*)(void *, uint64_t))(*(void *)(*(void *)v17 + 152)
                                                  + **(int **)(*(void *)v17 + 152));
  uint64_t v22 = (void *)swift_task_alloc();
  v0[29] = v22;
  *uint64_t v22 = v0;
  v22[1] = WhereAmIFlow.makeDialog(placemark:);
  return v25(v0 + 7, v21);
}

{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v4;

  swift_release_n();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 248);
  return v1(v2);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 56);
  static os_log_type_t.error.getter();
  os_log(_:dso:log:_:_:)();
  lazy protocol witness table accessor for type Errors and conformance Errors();
  swift_allocError();
  *(_OWORD *)uint64_t v1 = xmmword_C1370;
  *(unsigned char *)(v1 + 16) = 3;
  swift_willThrow();
  swift_errorRelease();
  swift_release_n();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t WhereAmIFlow.makeRFView(placemark:)(uint64_t a1, uint64_t a2)
{
  v3[54] = a2;
  v3[55] = v2;
  v3[53] = a1;
  uint64_t v4 = type metadata accessor for Google_Protobuf_DoubleValue();
  v3[56] = v4;
  v3[57] = *(void *)(v4 - 8);
  v3[58] = swift_task_alloc();
  v3[59] = swift_task_alloc();
  return _swift_task_switch(WhereAmIFlow.makeRFView(placemark:), 0, 0);
}

uint64_t WhereAmIFlow.makeRFView(placemark:)()
{
  uint64_t v68 = v0;
  v63 = *(void (**)(void))(**(void **)(v0 + 440) + 136);
  v63();
  uint64_t v1 = *(void *)(v0 + 400);
  uint64_t v2 = *(void *)(v0 + 408);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 376), v1);
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 128))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 376);
  *(_OWORD *)(v0 + 96) = xmmword_C6190;
  uint64_t v59 = v0 + 176;
  v65 = (void *)(v0 + 256);
  *(void *)(v0 + 120) = &type metadata for GeoLabel;
  *(void *)(v0 + 128) = &protocol witness table for GeoLabel;
  *(unsigned char *)(v0 + 112) = 2;
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 136))(v0 + 96);
  uint64_t v6 = v5;
  LOBYTE(v1) = v7;
  swift_release();
  uint64_t v8 = __swift_destroy_boxed_opaque_existential_0Tm(v0 + 96);
  uint64_t v57 = v0 + 336;
  v58 = (void *)(v0 + 296);
  if (v1)
  {
    uint64_t v8 = outlined consume of Result<String, Error>(v4, v6, 1);
    uint64_t v61 = 0;
    unint64_t v62 = 0xE000000000000000;
  }
  else
  {
    uint64_t v61 = v4;
    unint64_t v62 = v6;
  }
  ((void (*)(uint64_t))v63)(v8);
  uint64_t v9 = *(void *)(v0 + 160);
  uint64_t v10 = *(void *)(v0 + 168);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 136), v9);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 128))(v9, v10);
  uint64_t v12 = __swift_destroy_boxed_opaque_existential_0Tm(v0 + 136);
  ((void (*)(uint64_t))v63)(v12);
  uint64_t v13 = *(void *)(v0 + 240);
  uint64_t v14 = *(void *)(v0 + 248);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 216), v13);
  (*(void (**)(uint64_t, uint64_t))(v14 + 32))(v13, v14);
  uint64_t v15 = *(void *)(v0 + 280);
  uint64_t v16 = __swift_project_boxed_opaque_existential_1(v65, v15);
  uint64_t v17 = *(void *)(v15 - 8);
  uint64_t v18 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v17 + 16))(v18, v16, v15);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 216);
  LOBYTE(v16) = dispatch thunk of DeviceState.isWatch.getter();
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v18, v15);
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v65);
  uint64_t v19 = 4;
  if (v16) {
    uint64_t v19 = 5;
  }
  *(void *)(v0 + 200) = &type metadata for GeoLabel;
  *(void *)(v0 + 208) = &protocol witness table for GeoLabel;
  *(void *)(v0 + 176) = v19;
  *(void *)(v0 + 184) = 0;
  *(unsigned char *)(v0 + 192) = 2;
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 136))(v59);
  uint64_t v66 = v21;
  char v23 = v22;
  swift_release();
  uint64_t v24 = __swift_destroy_boxed_opaque_existential_0Tm(v59);
  if (v23)
  {
    uint64_t v24 = outlined consume of Result<String, Error>(v20, v66, 1);
    uint64_t v60 = 0;
    uint64_t v66 = 0xE000000000000000;
  }
  else
  {
    uint64_t v60 = v20;
  }
  ((void (*)(uint64_t))v63)(v24);
  uint64_t v25 = *(void *)(v0 + 320);
  uint64_t v26 = *(void *)(v0 + 328);
  __swift_project_boxed_opaque_existential_1(v58, v25);
  uint64_t v27 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 128))(v25, v26);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v58);
  uint64_t v28 = CLPlacemark.makeDialogLocation()();
  *(void *)(v0 + 360) = &type metadata for GeoLabel;
  *(void *)(v0 + 368) = &protocol witness table for GeoLabel;
  *(void *)(v0 + 336) = v28;
  *(void *)(v0 + 344) = 0;
  *(unsigned char *)(v0 + 352) = 1;
  uint64_t v29 = (*(uint64_t (**)(uint64_t))(*(void *)v27 + 136))(v57);
  uint64_t v31 = v30;
  char v33 = v32;
  swift_release();
  __swift_destroy_boxed_opaque_existential_0Tm(v57);
  if (v33)
  {
    outlined consume of Result<String, Error>(v29, v31, 1);
    uint64_t v29 = 0;
    uint64_t v31 = 0xE000000000000000;
  }
  uint64_t v64 = v29;
  id v34 = objc_msgSend(*(id *)(v0 + 432), "location", v57);
  if (v34)
  {
    id v35 = v34;
    uint64_t v37 = *(void *)(v0 + 464);
    uint64_t v36 = *(void *)(v0 + 472);
    uint64_t v38 = *(void *)(v0 + 448);
    uint64_t v39 = *(void *)(v0 + 456);
    [v34 coordinate];

    Double.toProtobufDoubleValue()();
    Google_Protobuf_DoubleValue.value.getter();
    uint64_t v41 = v40;
    uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
    v42(v36, v38);
    Double.toProtobufDoubleValue()();
    Google_Protobuf_DoubleValue.value.getter();
    uint64_t v44 = v43;
    v42(v37, v38);
  }
  else
  {
    uint64_t v41 = 0;
    uint64_t v44 = 0;
  }
  uint64_t v45 = *(void *)(v0 + 440);
  os_log_type_t v46 = static os_log_type_t.default.getter();
  v47 = *(NSObject **)(v45 + 16);
  os_log_type_t v48 = v46;
  if (os_log_type_enabled(v47, v46))
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v49 = (uint8_t *)swift_slowAlloc();
    uint64_t v50 = swift_slowAlloc();
    *(_DWORD *)v49 = 136315138;
    uint64_t v67 = v50;
    *(void *)(v0 + 16) = 0;
    *(void *)(v0 + 24) = 0;
    *(void *)(v0 + 32) = v60;
    *(void *)(v0 + 40) = v66;
    *(void *)(v0 + 48) = v64;
    *(void *)(v0 + 56) = v31;
    *(void *)(v0 + 64) = v61;
    *(void *)(v0 + 72) = v62;
    *(void *)(v0 + 80) = v41;
    *(void *)(v0 + 88) = v44;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v51 = String.init<A>(describing:)();
    *(void *)(v0 + 416) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v51, v52, &v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v47, v48, "RF: WhereAmI view %s", v49, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  v53 = *(uint64_t **)(v0 + 424);
  v53[3] = (uint64_t)&type metadata for GeoDataModels;
  v53[4] = lazy protocol witness table accessor for type GeoDataModels and conformance GeoDataModels();
  uint64_t v54 = swift_allocObject();
  uint64_t *v53 = v54;
  *(void *)(v54 + 16) = 0;
  *(void *)(v54 + 24) = 0;
  *(void *)(v54 + 32) = v60;
  *(void *)(v54 + 40) = v66;
  *(void *)(v54 + 48) = v64;
  *(void *)(v54 + 56) = v31;
  *(void *)(v54 + 64) = v61;
  *(void *)(v54 + 72) = v62;
  *(void *)(v54 + 80) = v41;
  *(void *)(v54 + 88) = v44;
  *(unsigned char *)(v54 + 96) = 3;
  swift_task_dealloc();
  swift_task_dealloc();
  v55 = *(uint64_t (**)(void))(v0 + 8);
  return v55();
}

uint64_t WhereAmIFlow.deinit()
{
  outlined consume of TrafficIncidentRequestSupportedCheckFlow.RequestSupportedExitValue(*(id *)(v0 + 24), *(unsigned char *)(v0 + 32));
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 40);
  swift_release();
  return v0;
}

uint64_t WhereAmIFlow.__deallocating_deinit()
{
  outlined consume of TrafficIncidentRequestSupportedCheckFlow.RequestSupportedExitValue(*(id *)(v0 + 24), *(unsigned char *)(v0 + 32));
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 40);
  swift_release();

  return _swift_deallocClassInstance(v0, 88, 7);
}

uint64_t protocol witness for FSMFlow.flowState.getter in conformance WhereAmIFlow@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)v1 + 112))();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v4;
  return result;
}

uint64_t protocol witness for FSMFlow.onInput(input:) in conformance WhereAmIFlow()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 168))() & 1;
}

uint64_t protocol witness for FSMFlow.executeState() in conformance WhereAmIFlow(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(**(void **)v1 + 176) + **(int **)(**(void **)v1 + 176));
  char v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *char v4 = v2;
  v4[1] = protocol witness for PromptForValueFlowStrategyAsync.makeRepromptOnEmptyParse() in conformance ShareETAPromptForContactStrategy;
  return v6(a1);
}

uint64_t protocol witness for Flow.on(input:) in conformance WhereAmIFlow(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return FSMFlow.on(input:)(a1, a2, WitnessTable);
}

uint64_t protocol witness for Flow.execute(completion:) in conformance WhereAmIFlow(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_getWitnessTable();

  return FSMFlow.execute(completion:)(a1, a2, a3);
}

uint64_t protocol witness for Flow.execute() in conformance WhereAmIFlow(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  uint64_t WitnessTable = swift_getWitnessTable();
  *uint64_t v5 = v2;
  v5[1] = protocol witness for PromptForValueFlowStrategyAsync.makeFlowCancelledResponse() in conformance ShareETAPromptForContactStrategy;
  return FSMFlow.execute()(a1, a2, WitnessTable);
}

uint64_t protocol witness for Flow.exitValue.getter in conformance WhereAmIFlow(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for WhereAmIFlow();

  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance WhereAmIFlow(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return FSMFlow.description.getter(a1, WitnessTable);
}

id specialized getter of coder #1 in CLPlacemark.withRevGeo()(void **a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    id v2 = *a1;
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)CLGeocoder) init];
    swift_beginAccess();
    uint64_t v5 = *a1;
    *a1 = v4;
    id v2 = v4;

    uint64_t v1 = 0;
  }
  id v6 = v1;
  return v2;
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSArray?, @unowned NSError?) -> () with result type [CLPlacemark](uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v5 = swift_allocError();
    *id v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for CLPlacemark);
    **(void **)(*(void *)(v3 + 64) + 40) = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t specialized WhereAmIFlow.init(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v11[3] = a3;
  v11[4] = a4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v11);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(boxed_opaque_existential_0, a1, a3);
  type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  *(void *)(a2 + 16) = OS_os_log.init(subsystem:category:)();
  *(void *)(a2 + 24) = 0;
  *(unsigned char *)(a2 + 32) = 2;
  outlined init with copy of DeviceState((uint64_t)v11, a2 + 40);
  *(void *)(a2 + 80) = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 128))(a3, a4);
  static os_log_type_t.default.getter();
  id v9 = *(id *)(a2 + 16);
  os_log(_:dso:log:_:_:)();

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v11);
  return a2;
}

uint64_t partial apply for closure #1 in WhereAmIFlow.executeState()(unsigned __int8 *a1)
{
  return closure #1 in WhereAmIFlow.executeState()(a1, v1);
}

void partial apply for closure #1 in WhereAmIFlow.preChecks()(uint64_t a1)
{
  closure #1 in WhereAmIFlow.preChecks()(a1, v1);
}

uint64_t sub_BB5F8()
{
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t partial apply for closure #1 in WhereAmIFlow.handle(location:)(uint64_t a1)
{
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *id v4 = v2;
  v4[2] = a1;
  v4[3] = v1 + 16;
  v4[1] = protocol witness for PromptForValueFlowStrategyAsync.makeFlowCancelledResponse() in conformance ShareETAPromptForContactStrategy;
  return _swift_task_switch(closure #1 in WhereAmIFlow.handle(location:), 0, 0);
}

uint64_t sub_BB6E0()
{
  outlined consume of GeoDataModels(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), *(void *)(v0 + 88), *(unsigned char *)(v0 + 96));

  return _swift_deallocObject(v0, 97, 7);
}

uint64_t instantiation function for generic protocol witness table for WhereAmIFlow(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = _s21GeoFlowDelegatePlugin013LocationFetchB0CAC07SiriKitB00B0AAWlTm_0(&lazy protocol witness table cache variable for type WhereAmIFlow and conformance WhereAmIFlow, a2, (void (*)(uint64_t))type metadata accessor for WhereAmIFlow);
  uint64_t result = _s21GeoFlowDelegatePlugin013LocationFetchB0CAC07SiriKitB00B0AAWlTm_0(&lazy protocol witness table cache variable for type WhereAmIFlow and conformance WhereAmIFlow, v3, (void (*)(uint64_t))type metadata accessor for WhereAmIFlow);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t type metadata accessor for WhereAmIFlow()
{
  return self;
}

uint64_t _s21GeoFlowDelegatePlugin013LocationFetchB0CAC07SiriKitB00B0AAWlTm_0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_BB82C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 112))();
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4;
  return result;
}

uint64_t sub_BB87C(uint64_t a1, uint64_t a2)
{
  id v2 = *(id *)a1;
  uint64_t v3 = *(uint64_t (**)(id, uint64_t))(**(void **)a2 + 120);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 8);
  outlined copy of TrafficIncidentRequestSupportedCheckFlow.RequestSupportedExitValue(*(id *)a1, v4);
  return v3(v2, v4);
}

uint64_t sub_BB8EC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 136))();
}

uint64_t sub_BB930(uint64_t a1, uint64_t a2)
{
  outlined init with copy of DeviceState(a1, (uint64_t)v4);
  return (*(uint64_t (**)(unsigned char *))(**(void **)a2 + 144))(v4);
}

ValueMetadata *type metadata accessor for WhereAmIFlow.State()
{
  return &type metadata for WhereAmIFlow.State;
}

id AnswerETAIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id AnswerETAIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnswerETAIntent();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for AnswerETAIntent()
{
  return self;
}

id AnswerETAIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id AnswerETAIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for AnswerETAIntent();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id AnswerETAIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithIdentifier:v6 backingStore:a3];

  return v7;
}

id AnswerETAIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for AnswerETAIntent();
  id v6 = objc_msgSendSuper2(&v8, "initWithIdentifier:backingStore:", v5, a3);

  return v6;
}

id AnswerETAIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  id v10 = [objc_allocWithZone(v5) initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id AnswerETAIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for AnswerETAIntent();
  id v10 = objc_msgSendSuper2(&v12, "initWithDomain:verb:parametersByName:", v7, v8, v9.super.isa);

  return v10;
}

id AnswerETAIntent.__deallocating_deinit()
{
  return AnswerETAIntent.__deallocating_deinit(type metadata accessor for AnswerETAIntent);
}

unint64_t AnswerETAIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return specialized AnswerETAIntentResponseCode.init(rawValue:)(a1);
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance AnswerETAIntentResponseCode@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = specialized AnswerETAIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t AnswerETAIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___AnswerETAIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *AnswerETAIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[objc_allocWithZone(v2) init];
  id v6 = &v5[OBJC_IVAR___AnswerETAIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

char *AnswerETAIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[v2 init];
  id v6 = &v5[OBJC_IVAR___AnswerETAIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

id AnswerETAIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___AnswerETAIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnswerETAIntentResponse();
  return objc_msgSendSuper2(&v2, "init");
}

id AnswerETAIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___AnswerETAIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for AnswerETAIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id AnswerETAIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithBackingStore:a1];

  return v3;
}

id AnswerETAIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___AnswerETAIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for AnswerETAIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, "initWithBackingStore:", a1);

  return v3;
}

id @objc AnswerETAIntentResponse.init(coder:)(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___AnswerETAIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for AnswerETAIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id AnswerETAIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }
  id v3 = [objc_allocWithZone(v1) initWithPropertiesByName:v2.super.isa];

  return v3;
}

id AnswerETAIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___AnswerETAIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for AnswerETAIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, "initWithPropertiesByName:", v2.super.isa);

  if (v3) {
  return v3;
  }
}

id AnswerETAIntentResponse.__deallocating_deinit()
{
  return AnswerETAIntent.__deallocating_deinit(type metadata accessor for AnswerETAIntentResponse);
}

id AnswerETAIntent.__deallocating_deinit(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

unint64_t specialized AnswerETAIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for AnswerETAIntentResponse()
{
  return self;
}

unint64_t lazy protocol witness table accessor for type AnswerETAIntentResponseCode and conformance AnswerETAIntentResponseCode()
{
  unint64_t result = lazy protocol witness table cache variable for type AnswerETAIntentResponseCode and conformance AnswerETAIntentResponseCode;
  if (!lazy protocol witness table cache variable for type AnswerETAIntentResponseCode and conformance AnswerETAIntentResponseCode)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnswerETAIntentResponseCode and conformance AnswerETAIntentResponseCode);
  }
  return result;
}

uint64_t sub_BC724@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((char *)&stru_20.maxprot + (swift_isaMask & **a1)))();
  *a2 = result;
  return result;
}

uint64_t sub_BC780(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___AnswerETAIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for AnswerETAIntentResponseCode()
{
  return &type metadata for AnswerETAIntentResponseCode;
}

uint64_t Measurement.init(value:unit:)()
{
  return Measurement.init(value:unit:)();
}

uint64_t Measurement.value.getter()
{
  return Measurement.value.getter();
}

uint64_t Measurement.value.setter()
{
  return Measurement.value.setter();
}

uint64_t Measurement<>.convert(to:)()
{
  return Measurement<>.convert(to:)();
}

uint64_t static CharacterSet.whitespaces.getter()
{
  return static CharacterSet.whitespaces.getter();
}

uint64_t static CharacterSet.urlQueryAllowed.getter()
{
  return static CharacterSet.urlQueryAllowed.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t PersonNameComponents.givenName.getter()
{
  return PersonNameComponents.givenName.getter();
}

uint64_t PersonNameComponents.givenName.setter()
{
  return PersonNameComponents.givenName.setter();
}

uint64_t PersonNameComponents.familyName.getter()
{
  return PersonNameComponents.familyName.getter();
}

uint64_t PersonNameComponents.familyName.setter()
{
  return PersonNameComponents.familyName.setter();
}

uint64_t PersonNameComponents.namePrefix.setter()
{
  return PersonNameComponents.namePrefix.setter();
}

uint64_t PersonNameComponents.nameSuffix.setter()
{
  return PersonNameComponents.nameSuffix.setter();
}

NSPersonNameComponents __swiftcall PersonNameComponents._bridgeToObjectiveC()()
{
  uint64_t v0 = (objc_class *)PersonNameComponents._bridgeToObjectiveC()();
  result._private = v1;
  result.super.isa = v0;
  return result;
}

uint64_t static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t PersonNameComponents.nickname.setter()
{
  return PersonNameComponents.nickname.setter();
}

uint64_t PersonNameComponents.init()()
{
  return PersonNameComponents.init()();
}

uint64_t type metadata accessor for PersonNameComponents()
{
  return type metadata accessor for PersonNameComponents();
}

uint64_t _BridgedStoredNSError.code.getter()
{
  return _BridgedStoredNSError.code.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.init(base64Encoded:options:)()
{
  return Data.init(base64Encoded:options:)();
}

uint64_t Locale.identifier.getter()
{
  return Locale.identifier.getter();
}

uint64_t Locale.languageCode.getter()
{
  return Locale.languageCode.getter();
}

uint64_t static Locale.MeasurementSystem.uk.getter()
{
  return static Locale.MeasurementSystem.uk.getter();
}

uint64_t static Locale.MeasurementSystem.us.getter()
{
  return static Locale.MeasurementSystem.us.getter();
}

uint64_t type metadata accessor for Locale.MeasurementSystem()
{
  return type metadata accessor for Locale.MeasurementSystem();
}

uint64_t Locale.measurementSystem.getter()
{
  return Locale.measurementSystem.getter();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.clientDrivenExperience.getter()
{
  return Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.clientDrivenExperience.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.siriInstruction.getter()
{
  return Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.siriInstruction.getter();
}

uint64_t Apple_Parsec_Siri_V2alpha_ClientComponent.domainComponent.getter()
{
  return Apple_Parsec_Siri_V2alpha_ClientComponent.domainComponent.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ClientComponent()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_ClientComponent();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_GeoExperienceType()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_GeoExperienceType();
}

uint64_t Apple_Parsec_Siri_V2alpha_GeoClientComponent.experienceType.getter()
{
  return Apple_Parsec_Siri_V2alpha_GeoClientComponent.experienceType.getter();
}

uint64_t Apple_Parsec_Siri_V2alpha_GeoClientComponent.locationSearchNode.getter()
{
  return Apple_Parsec_Siri_V2alpha_GeoClientComponent.locationSearchNode.getter();
}

uint64_t Apple_Parsec_Siri_V2alpha_GeoClientComponent.hasLocationSearchNode.getter()
{
  return Apple_Parsec_Siri_V2alpha_GeoClientComponent.hasLocationSearchNode.getter();
}

uint64_t Apple_Parsec_Siri_V2alpha_GeoClientComponent.parkingLocationAction.getter()
{
  return Apple_Parsec_Siri_V2alpha_GeoClientComponent.parkingLocationAction.getter();
}

uint64_t Apple_Parsec_Siri_V2alpha_GeoClientComponent.hasParkingLocationAction.getter()
{
  return Apple_Parsec_Siri_V2alpha_GeoClientComponent.hasParkingLocationAction.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_GeoClientComponent()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_GeoClientComponent();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationSearchNode.locationSearchConfirmation.getter()
{
  return Apple_Parsec_Siri_V2alpha_LocationSearchNode.locationSearchConfirmation.getter();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationSearchNode.locationSearchIncidentType.getter()
{
  return Apple_Parsec_Siri_V2alpha_LocationSearchNode.locationSearchIncidentType.getter();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationSearchNode.locationSearchNoun.getter()
{
  return Apple_Parsec_Siri_V2alpha_LocationSearchNode.locationSearchNoun.getter();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationSearchNode.locationSearchVerb.getter()
{
  return Apple_Parsec_Siri_V2alpha_LocationSearchNode.locationSearchVerb.getter();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationSearchNode.personPlaceID.getter()
{
  return Apple_Parsec_Siri_V2alpha_LocationSearchNode.personPlaceID.getter();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationSearchNode.occupantFullName.getter()
{
  return Apple_Parsec_Siri_V2alpha_LocationSearchNode.occupantFullName.getter();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationSearchNode.personRelationship.getter()
{
  return Apple_Parsec_Siri_V2alpha_LocationSearchNode.personRelationship.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_LocationSearchNode()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_LocationSearchNode();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_LocationSearchNoun()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_LocationSearchNoun();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_LocationSearchVerb()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_LocationSearchVerb();
}

uint64_t Apple_Parsec_Siri_V2alpha_DomainClientComponent.geoClientComponent.getter()
{
  return Apple_Parsec_Siri_V2alpha_DomainClientComponent.geoClientComponent.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_DomainClientComponent()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_DomainClientComponent();
}

uint64_t Apple_Parsec_Siri_V2alpha_ParkingLocationAction.parkingLocationActionType.getter()
{
  return Apple_Parsec_Siri_V2alpha_ParkingLocationAction.parkingLocationActionType.getter();
}

uint64_t Apple_Parsec_Siri_V2alpha_ParkingLocationAction.note.getter()
{
  return Apple_Parsec_Siri_V2alpha_ParkingLocationAction.note.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ParkingLocationAction()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_ParkingLocationAction();
}

uint64_t Apple_Parsec_Siri_V2alpha_ClientDrivenExperience.components.getter()
{
  return Apple_Parsec_Siri_V2alpha_ClientDrivenExperience.components.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ClientDrivenExperience()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_ClientDrivenExperience();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ParkingLocationActionType()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_ParkingLocationActionType();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_LocationSearchConfirmation()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_LocationSearchConfirmation();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_LocationSearchIncidentType()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_LocationSearchIncidentType();
}

uint64_t type metadata accessor for ImageElement.ImageStyle()
{
  return type metadata accessor for ImageElement.ImageStyle();
}

uint64_t ImageElement.Contact.Avatar.init(contactIds:)()
{
  return ImageElement.Contact.Avatar.init(contactIds:)();
}

uint64_t type metadata accessor for ImageElement.Contact.Content()
{
  return type metadata accessor for ImageElement.Contact.Content();
}

uint64_t ImageElement.Contact.Monogram.init(letters:)()
{
  return ImageElement.Contact.Monogram.init(letters:)();
}

uint64_t ImageElement.Contact.init(_:imageStyle:)()
{
  return ImageElement.Contact.init(_:imageStyle:)();
}

uint64_t static CommonGuardFlowUtils.makeGuardFlow(withGuards:)()
{
  return static CommonGuardFlowUtils.makeGuardFlow(withGuards:)();
}

uint64_t SimpleOutputFlowAsync.init(outputPublisher:outputGenerator:)()
{
  return SimpleOutputFlowAsync.init(outputPublisher:outputGenerator:)();
}

uint64_t type metadata accessor for SimpleOutputFlowAsync()
{
  return type metadata accessor for SimpleOutputFlowAsync();
}

uint64_t PromptForValueFlowAsync.init<A>(strategy:outputPublisher:)()
{
  return PromptForValueFlowAsync.init<A>(strategy:outputPublisher:)();
}

uint64_t PromptForConfirmationFlowAsync.__allocating_init<A>(itemToConfirm:strategy:outputPublisher:)()
{
  return PromptForConfirmationFlowAsync.__allocating_init<A>(itemToConfirm:strategy:outputPublisher:)();
}

uint64_t type metadata accessor for PromptForConfirmationFlowAsync()
{
  return type metadata accessor for PromptForConfirmationFlowAsync();
}

uint64_t PromptForDisambiguationFlowAsync.__allocating_init<A>(items:strategy:outputPublisher:)()
{
  return PromptForDisambiguationFlowAsync.__allocating_init<A>(items:strategy:outputPublisher:)();
}

uint64_t type metadata accessor for AnyFlow()
{
  return type metadata accessor for AnyFlow();
}

uint64_t type metadata accessor for GuardFlow()
{
  return type metadata accessor for GuardFlow();
}

uint64_t static CommonFlowGuard.ensuringSiriLocationAccess(needsPreciseLocation:)()
{
  return static CommonFlowGuard.ensuringSiriLocationAccess(needsPreciseLocation:)();
}

uint64_t static CommonFlowGuard.ensuringDeviceIsAuthenticated(using:)()
{
  return static CommonFlowGuard.ensuringDeviceIsAuthenticated(using:)();
}

uint64_t type metadata accessor for CommonFlowGuard()
{
  return type metadata accessor for CommonFlowGuard();
}

uint64_t static RCHChildFlowFactoryHelper.makeHandleIntentFlowProducer<A>(strategy:)()
{
  return static RCHChildFlowFactoryHelper.makeHandleIntentFlowProducer<A>(strategy:)();
}

uint64_t static RCHChildFlowFactoryHelper.makeAppResolutionFlowProducer<A, B>(app:)()
{
  return static RCHChildFlowFactoryHelper.makeAppResolutionFlowProducer<A, B>(app:)();
}

uint64_t static RCHChildFlowFactoryHelper.makeContinueInAppFlowWithAutomaticPunchOutProducer<A>(strategy:)()
{
  return static RCHChildFlowFactoryHelper.makeContinueInAppFlowWithAutomaticPunchOutProducer<A>(strategy:)();
}

uint64_t static RCHChildFlowFactoryHelper.makeNeedsDisambiguationFlowProducer<A>(strategy:)()
{
  return static RCHChildFlowFactoryHelper.makeNeedsDisambiguationFlowProducer<A>(strategy:)();
}

uint64_t static RCHChildFlowFactoryHelper.makeUnsupportedValueAndCancelFlowProducer<A>(strategy:)()
{
  return static RCHChildFlowFactoryHelper.makeUnsupportedValueAndCancelFlowProducer<A>(strategy:)();
}

uint64_t RCHChildFlowProducersAsync.handleIntentFlowProducer.setter()
{
  return RCHChildFlowProducersAsync.handleIntentFlowProducer.setter();
}

uint64_t RCHChildFlowProducersAsync.appResolutionFlowProducer.setter()
{
  return RCHChildFlowProducersAsync.appResolutionFlowProducer.setter();
}

uint64_t RCHChildFlowProducersAsync.continueInAppFlowProducer.setter()
{
  return RCHChildFlowProducersAsync.continueInAppFlowProducer.setter();
}

uint64_t RCHChildFlowProducersAsync.unsupportedValueFlowProducer.setter()
{
  return RCHChildFlowProducersAsync.unsupportedValueFlowProducer.setter();
}

uint64_t RCHChildFlowProducersAsync.needsDisambiguationFlowProducer.setter()
{
  return RCHChildFlowProducersAsync.needsDisambiguationFlowProducer.setter();
}

uint64_t RCHChildFlowProducersAsync.init()()
{
  return RCHChildFlowProducersAsync.init()();
}

uint64_t type metadata accessor for RCHChildFlowProducersAsync()
{
  return type metadata accessor for RCHChildFlowProducersAsync();
}

uint64_t RCHChildFlowFactory.__allocating_init(producers:)()
{
  return RCHChildFlowFactory.__allocating_init(producers:)();
}

uint64_t type metadata accessor for RCHChildFlowFactory()
{
  return type metadata accessor for RCHChildFlowFactory();
}

uint64_t dispatch thunk of Flow.exitValue.getter()
{
  return dispatch thunk of Flow.exitValue.getter();
}

uint64_t Flow.eraseToAnyFlow()()
{
  return Flow.eraseToAnyFlow()();
}

uint64_t Flow.deferToExecuteAsync(_:)()
{
  return Flow.deferToExecuteAsync(_:)();
}

uint64_t static FlowSearchResult.noFlow.getter()
{
  return static FlowSearchResult.noFlow.getter();
}

uint64_t static FlowSearchResult.flow(_:)()
{
  return static FlowSearchResult.flow(_:)();
}

uint64_t type metadata accessor for FlowUnhandledReason()
{
  return type metadata accessor for FlowUnhandledReason();
}

Swift::Void __swiftcall FlowPlugin.warmup(refId:)(Swift::String refId)
{
}

Swift::Void __swiftcall FlowPlugin.warmup()()
{
}

uint64_t static SiriKitEventSender.current.getter()
{
  return static SiriKitEventSender.current.getter();
}

uint64_t dispatch thunk of SiriKitEventSending.send(_:)()
{
  return dispatch thunk of SiriKitEventSending.send(_:)();
}

uint64_t dispatch thunk of static SiriKitAceViewBuilder.makeBuilder(deviceState:)()
{
  return dispatch thunk of static SiriKitAceViewBuilder.makeBuilder(deviceState:)();
}

uint64_t dispatch thunk of SiriKitAceViewBuilder.addSnippet(snippet:)()
{
  return dispatch thunk of SiriKitAceViewBuilder.addSnippet(snippet:)();
}

uint64_t dispatch thunk of SiriKitAceViewBuilder.withUtteranceViews(utteranceViews:)()
{
  return dispatch thunk of SiriKitAceViewBuilder.withUtteranceViews(utteranceViews:)();
}

uint64_t dispatch thunk of SiriKitAceViewBuilder.build()()
{
  return dispatch thunk of SiriKitAceViewBuilder.build()();
}

uint64_t type metadata accessor for SiriKitAceViewBuilder()
{
  return type metadata accessor for SiriKitAceViewBuilder();
}

uint64_t type metadata accessor for SiriKitReliabilityCodes()
{
  return type metadata accessor for SiriKitReliabilityCodes();
}

uint64_t type metadata accessor for SiriKitConfirmationState()
{
  return type metadata accessor for SiriKitConfirmationState();
}

uint64_t SiriKitDisambiguationItem.init(components:directInvocation:allowLineWrapForDisplayText:)()
{
  return SiriKitDisambiguationItem.init(components:directInvocation:allowLineWrapForDisplayText:)();
}

uint64_t SiriKitDisambiguationItem.init(components:utterance:allowLineWrapForDisplayText:)()
{
  return SiriKitDisambiguationItem.init(components:utterance:allowLineWrapForDisplayText:)();
}

uint64_t type metadata accessor for SiriKitDisambiguationItem()
{
  return type metadata accessor for SiriKitDisambiguationItem();
}

uint64_t SiriKitDisambiguationList.disambiguationItems.getter()
{
  return SiriKitDisambiguationList.disambiguationItems.getter();
}

uint64_t SiriKitDisambiguationList.init(rawItems:disambiguationItems:shouldReadItemsInVox:requestUnlockForEmptyOrDuplicateItems:)()
{
  return SiriKitDisambiguationList.init(rawItems:disambiguationItems:shouldReadItemsInVox:requestUnlockForEmptyOrDuplicateItems:)();
}

uint64_t type metadata accessor for SiriKitDisambiguationList()
{
  return type metadata accessor for SiriKitDisambiguationList();
}

uint64_t dispatch thunk of static SiriKitDisambiguationItemComponent.makeBuilder(_:)()
{
  return dispatch thunk of static SiriKitDisambiguationItemComponent.makeBuilder(_:)();
}

uint64_t dispatch thunk of SiriKitDisambiguationItemComponent.Builder.withSpeakOnLockScreen(_:)()
{
  return dispatch thunk of SiriKitDisambiguationItemComponent.Builder.withSpeakOnLockScreen(_:)();
}

uint64_t dispatch thunk of SiriKitDisambiguationItemComponent.Builder.withAllowedOnLockScreen(_:)()
{
  return dispatch thunk of SiriKitDisambiguationItemComponent.Builder.withAllowedOnLockScreen(_:)();
}

uint64_t dispatch thunk of SiriKitDisambiguationItemComponent.Builder.build()()
{
  return dispatch thunk of SiriKitDisambiguationItemComponent.Builder.build()();
}

uint64_t dispatch thunk of SiriKitDisambiguationItemComponent.Builder.withSpeak(_:)()
{
  return dispatch thunk of SiriKitDisambiguationItemComponent.Builder.withSpeak(_:)();
}

uint64_t type metadata accessor for SiriKitDisambiguationItemComponent()
{
  return type metadata accessor for SiriKitDisambiguationItemComponent();
}

uint64_t static SiriKitDisambiguationSnippetFactory.makeDisambiguationSnippetForCarPlay(disambiguationItems:deviceIsLocked:)()
{
  return static SiriKitDisambiguationSnippetFactory.makeDisambiguationSnippetForCarPlay(disambiguationItems:deviceIsLocked:)();
}

uint64_t static SiriKitDisambiguationSnippetFactory.makeDisambiguationSnippetPad(disambiguationItems:deviceIsLocked:imageSize:)()
{
  return static SiriKitDisambiguationSnippetFactory.makeDisambiguationSnippetPad(disambiguationItems:deviceIsLocked:imageSize:)();
}

uint64_t static SiriKitDisambiguationSnippetFactory.makeDisambiguationSnippetPhone(disambiguationItems:deviceIsLocked:imageSize:)()
{
  return static SiriKitDisambiguationSnippetFactory.makeDisambiguationSnippetPhone(disambiguationItems:deviceIsLocked:imageSize:)();
}

uint64_t dispatch thunk of SiriKitEvent.SiriKitEventBuilder.responseId.setter()
{
  return dispatch thunk of SiriKitEvent.SiriKitEventBuilder.responseId.setter();
}

uint64_t dispatch thunk of SiriKitEvent.SiriKitEventBuilder.parameterName.setter()
{
  return dispatch thunk of SiriKitEvent.SiriKitEventBuilder.parameterName.setter();
}

uint64_t dispatch thunk of SiriKitEvent.SiriKitEventBuilder.statusReasonDescription.setter()
{
  return dispatch thunk of SiriKitEvent.SiriKitEventBuilder.statusReasonDescription.setter();
}

uint64_t dispatch thunk of SiriKitEvent.SiriKitEventBuilder.app.setter()
{
  return dispatch thunk of SiriKitEvent.SiriKitEventBuilder.app.setter();
}

uint64_t SiriKitEvent.__allocating_init(activityType:taskType:statusReason:_:)()
{
  return SiriKitEvent.__allocating_init(activityType:taskType:statusReason:_:)();
}

uint64_t type metadata accessor for SiriKitEvent()
{
  return type metadata accessor for SiriKitEvent();
}

uint64_t static AceService.currentAsync.getter()
{
  return static AceService.currentAsync.getter();
}

uint64_t static AceService.current.getter()
{
  return static AceService.current.getter();
}

uint64_t dispatch thunk of DeviceState.isXRDevice.getter()
{
  return dispatch thunk of DeviceState.isXRDevice.getter();
}

uint64_t dispatch thunk of DeviceState.siriLocale.getter()
{
  return dispatch thunk of DeviceState.siriLocale.getter();
}

uint64_t dispatch thunk of DeviceState.isAuthenticated(for:)()
{
  return dispatch thunk of DeviceState.isAuthenticated(for:)();
}

uint64_t dispatch thunk of DeviceState.isTextToSpeechEnabled.getter()
{
  return dispatch thunk of DeviceState.isTextToSpeechEnabled.getter();
}

uint64_t dispatch thunk of DeviceState.isMac.getter()
{
  return dispatch thunk of DeviceState.isMac.getter();
}

uint64_t dispatch thunk of DeviceState.isPad.getter()
{
  return dispatch thunk of DeviceState.isPad.getter();
}

uint64_t dispatch thunk of DeviceState.isPod.getter()
{
  return dispatch thunk of DeviceState.isPod.getter();
}

uint64_t dispatch thunk of DeviceState.isPhone.getter()
{
  return dispatch thunk of DeviceState.isPhone.getter();
}

uint64_t dispatch thunk of DeviceState.isWatch.getter()
{
  return dispatch thunk of DeviceState.isWatch.getter();
}

uint64_t dispatch thunk of DeviceState.isCarPlay.getter()
{
  return dispatch thunk of DeviceState.isCarPlay.getter();
}

uint64_t dispatch thunk of DeviceState.isHomePod.getter()
{
  return dispatch thunk of DeviceState.isHomePod.getter();
}

uint64_t static DialogPhase.clarification.getter()
{
  return static DialogPhase.clarification.getter();
}

uint64_t static DialogPhase.summary.getter()
{
  return static DialogPhase.summary.getter();
}

uint64_t type metadata accessor for DialogPhase()
{
  return type metadata accessor for DialogPhase();
}

uint64_t DisplayHint.init(idValue:displayValue:)()
{
  return DisplayHint.init(idValue:displayValue:)();
}

uint64_t type metadata accessor for DisplayHint()
{
  return type metadata accessor for DisplayHint();
}

uint64_t static EmptyOutput.instance.getter()
{
  return static EmptyOutput.instance.getter();
}

uint64_t type metadata accessor for EmptyOutput()
{
  return type metadata accessor for EmptyOutput();
}

uint64_t type metadata accessor for ActivityType()
{
  return type metadata accessor for ActivityType();
}

uint64_t static DialogHelper.globals.getter()
{
  return static DialogHelper.globals.getter();
}

uint64_t type metadata accessor for PromptResult()
{
  return type metadata accessor for PromptResult();
}

uint64_t type metadata accessor for ResponseType()
{
  return type metadata accessor for ResponseType();
}

uint64_t type metadata accessor for RCHFlowResult()
{
  return type metadata accessor for RCHFlowResult();
}

uint64_t SemanticValue.init(string:label:nodeClass:)()
{
  return SemanticValue.init(string:label:nodeClass:)();
}

uint64_t SemanticValue.init(string:label:)()
{
  return SemanticValue.init(string:label:)();
}

uint64_t type metadata accessor for SemanticValue()
{
  return type metadata accessor for SemanticValue();
}

uint64_t static ActionForInput.cancel()()
{
  return static ActionForInput.cancel()();
}

uint64_t static ActionForInput.handle()()
{
  return static ActionForInput.handle()();
}

uint64_t static ActionForInput.ignore()()
{
  return static ActionForInput.ignore()();
}

uint64_t RCHFlowFactory.makeRCHFlowWithResolvedApp(_:intent:)()
{
  return RCHFlowFactory.makeRCHFlowWithResolvedApp(_:intent:)();
}

uint64_t RCHFlowFactory.init(strategy:childFlowFactory:)()
{
  return RCHFlowFactory.init(strategy:childFlowFactory:)();
}

uint64_t type metadata accessor for RCHFlowFactory()
{
  return type metadata accessor for RCHFlowFactory();
}

uint64_t static AceOutputHelper.makeSummaryViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)()
{
  return static AceOutputHelper.makeSummaryViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)();
}

uint64_t static AceOutputHelper.makeCompletionViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:requestEndBehavior:)()
{
  return static AceOutputHelper.makeCompletionViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:requestEndBehavior:)();
}

uint64_t static AceOutputHelper.makeCompletionViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)()
{
  return static AceOutputHelper.makeCompletionViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)();
}

uint64_t static AceOutputHelper.makeCancellationViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:canUseServerTTS:flowActivity:)()
{
  return static AceOutputHelper.makeCancellationViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:canUseServerTTS:flowActivity:)();
}

uint64_t static AceOutputHelper.makeAceOutput(allAddViews:nlContextUpdate:additionalCommands:flowActivity:)()
{
  return static AceOutputHelper.makeAceOutput(allAddViews:nlContextUpdate:additionalCommands:flowActivity:)();
}

uint64_t static AceOutputHelper.makeErrorOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)()
{
  return static AceOutputHelper.makeErrorOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)();
}

uint64_t static ExecuteResponse.ongoing(requireInput:)()
{
  return static ExecuteResponse.ongoing(requireInput:)();
}

uint64_t static ExecuteResponse.ongoing<A>(next:childCompletion:)()
{
  return static ExecuteResponse.ongoing<A>(next:childCompletion:)();
}

{
  return static ExecuteResponse.ongoing<A>(next:childCompletion:)();
}

uint64_t static ExecuteResponse.complete<A>(next:childCompletion:)()
{
  return static ExecuteResponse.complete<A>(next:childCompletion:)();
}

uint64_t static ExecuteResponse.complete<A>(next:)()
{
  return static ExecuteResponse.complete<A>(next:)();
}

uint64_t static ExecuteResponse.complete()()
{
  return static ExecuteResponse.complete()();
}

uint64_t static ExecuteResponse.unhandled(reason:isComplete:)()
{
  return static ExecuteResponse.unhandled(reason:isComplete:)();
}

uint64_t NLContextUpdate.displayHints.setter()
{
  return NLContextUpdate.displayHints.setter();
}

uint64_t NLContextUpdate.pommesContext.getter()
{
  return NLContextUpdate.pommesContext.getter();
}

uint64_t NLContextUpdate.pommesContext.setter()
{
  return NLContextUpdate.pommesContext.setter();
}

uint64_t NLContextUpdate.currentDomainName.setter()
{
  return NLContextUpdate.currentDomainName.setter();
}

uint64_t NLContextUpdate.nluSystemDialogActs.setter()
{
  return NLContextUpdate.nluSystemDialogActs.setter();
}

uint64_t NLContextUpdate.weightedPromptStrict.setter()
{
  return NLContextUpdate.weightedPromptStrict.setter();
}

uint64_t NLContextUpdate.weightedPromptAbortValues.setter()
{
  return NLContextUpdate.weightedPromptAbortValues.setter();
}

uint64_t NLContextUpdate.weightedPromptTargetDomain.setter()
{
  return NLContextUpdate.weightedPromptTargetDomain.setter();
}

uint64_t NLContextUpdate.conversationStateAttachments.setter()
{
  return NLContextUpdate.conversationStateAttachments.setter();
}

uint64_t NLContextUpdate.weightedPromptResponseOptions.setter()
{
  return NLContextUpdate.weightedPromptResponseOptions.setter();
}

uint64_t NLContextUpdate.weightedPromptResponseTargets.setter()
{
  return NLContextUpdate.weightedPromptResponseTargets.setter();
}

uint64_t NLContextUpdate.disambiguationPromptAbortValues.setter()
{
  return NLContextUpdate.disambiguationPromptAbortValues.setter();
}

uint64_t NLContextUpdate.disambiguationPromptTargetDomain.setter()
{
  return NLContextUpdate.disambiguationPromptTargetDomain.setter();
}

uint64_t NLContextUpdate.disambiguationPromptResponseTargets.setter()
{
  return NLContextUpdate.disambiguationPromptResponseTargets.setter();
}

uint64_t NLContextUpdate.nlInput.setter()
{
  return NLContextUpdate.nlInput.setter();
}

uint64_t NLContextUpdate.init()()
{
  return NLContextUpdate.init()();
}

uint64_t type metadata accessor for NLContextUpdate()
{
  return type metadata accessor for NLContextUpdate();
}

uint64_t RCHFlowDelegate.makeRCHFlow(app:intent:producers:)()
{
  return RCHFlowDelegate.makeRCHFlow(app:intent:producers:)();
}

uint64_t ResponseFactory.init()()
{
  return ResponseFactory.init()();
}

uint64_t type metadata accessor for ResponseFactory()
{
  return type metadata accessor for ResponseFactory();
}

uint64_t static LabelMappingUtil.translateINPersonHandleLabel(_:languageCode:)()
{
  return static LabelMappingUtil.translateINPersonHandleLabel(_:languageCode:)();
}

uint64_t TemplatingResult.withBehaviorAfterSpeaking(_:)()
{
  return TemplatingResult.withBehaviorAfterSpeaking(_:)();
}

Swift::Bool __swiftcall TemplatingResult.shouldListenAfterSpeaking(defaultBehavior:)(Swift::Bool defaultBehavior)
{
  return TemplatingResult.shouldListenAfterSpeaking(defaultBehavior:)(defaultBehavior);
}

uint64_t TemplatingResult.print.getter()
{
  return TemplatingResult.print.getter();
}

uint64_t type metadata accessor for TemplatingResult()
{
  return type metadata accessor for TemplatingResult();
}

uint64_t IntentPromptAnswer.init(answeredValue:updatedIntent:)()
{
  return IntentPromptAnswer.init(answeredValue:updatedIntent:)();
}

uint64_t static UnlockDevicePolicy.requiringDeviceUnlock.getter()
{
  return static UnlockDevicePolicy.requiringDeviceUnlock.getter();
}

uint64_t static UnlockDevicePolicy.default.getter()
{
  return static UnlockDevicePolicy.default.getter();
}

uint64_t type metadata accessor for UnlockDevicePolicy()
{
  return type metadata accessor for UnlockDevicePolicy();
}

uint64_t BaseRCHFlowDelegate.init()()
{
  return BaseRCHFlowDelegate.init()();
}

uint64_t BaseRCHFlowDelegate.deinit()
{
  return BaseRCHFlowDelegate.deinit();
}

uint64_t ParameterIdentifier.multicardinalIndex.getter()
{
  return ParameterIdentifier.multicardinalIndex.getter();
}

uint64_t ParameterIdentifier.name.getter()
{
  return ParameterIdentifier.name.getter();
}

uint64_t type metadata accessor for ParameterIdentifier()
{
  return type metadata accessor for ParameterIdentifier();
}

uint64_t type metadata accessor for ConfirmationResponse()
{
  return type metadata accessor for ConfirmationResponse();
}

uint64_t static DisambiguationResult.chosenItem(_:)()
{
  return static DisambiguationResult.chosenItem(_:)();
}

uint64_t DucTemplatingService.init(ducFamily:locale:extensionValueTypeNamesByValueType:aceServiceInvoker:deviceState:localContext:)()
{
  return DucTemplatingService.init(ducFamily:locale:extensionValueTypeNamesByValueType:aceServiceInvoker:deviceState:localContext:)();
}

uint64_t DucTemplatingService.deinit()
{
  return DucTemplatingService.deinit();
}

uint64_t type metadata accessor for BehaviorAfterSpeaking()
{
  return type metadata accessor for BehaviorAfterSpeaking();
}

uint64_t DefaultAceViewProvider.init()()
{
  return DefaultAceViewProvider.init()();
}

uint64_t DefaultAceViewProvider.deinit()
{
  return DefaultAceViewProvider.deinit();
}

uint64_t IntentResolutionRecord.intentResponse.getter()
{
  return IntentResolutionRecord.intentResponse.getter();
}

uint64_t IntentResolutionRecord.app.getter()
{
  return IntentResolutionRecord.app.getter();
}

uint64_t IntentResolutionRecord.intent.getter()
{
  return IntentResolutionRecord.intent.getter();
}

uint64_t static OutputPublisherFactory.makeOutputPublisherAsync()()
{
  return static OutputPublisherFactory.makeOutputPublisherAsync()();
}

uint64_t PaginatedItemContainer.items.getter()
{
  return PaginatedItemContainer.items.getter();
}

uint64_t dispatch thunk of MachineUtteranceBuilder.addMapping(node:value:)()
{
  return dispatch thunk of MachineUtteranceBuilder.addMapping(node:value:)();
}

uint64_t dispatch thunk of MachineUtteranceBuilder.build()()
{
  return dispatch thunk of MachineUtteranceBuilder.build()();
}

uint64_t MachineUtteranceBuilder.init()()
{
  return MachineUtteranceBuilder.init()();
}

uint64_t type metadata accessor for MachineUtteranceBuilder()
{
  return type metadata accessor for MachineUtteranceBuilder();
}

uint64_t DefaultNLContextProvider.init()()
{
  return DefaultNLContextProvider.init()();
}

uint64_t DefaultNLContextProvider.deinit()
{
  return DefaultNLContextProvider.deinit();
}

uint64_t OutputGenerationManifest.init(dialogPhase:_:)()
{
  return OutputGenerationManifest.init(dialogPhase:_:)();
}

uint64_t OutputGenerationManifest.responseType.setter()
{
  return OutputGenerationManifest.responseType.setter();
}

uint64_t OutputGenerationManifest.responseViewId.setter()
{
  return OutputGenerationManifest.responseViewId.setter();
}

uint64_t OutputGenerationManifest.nlContextUpdate.setter()
{
  return OutputGenerationManifest.nlContextUpdate.setter();
}

uint64_t OutputGenerationManifest.listenAfterSpeaking.setter()
{
  return OutputGenerationManifest.listenAfterSpeaking.setter();
}

uint64_t type metadata accessor for OutputGenerationManifest()
{
  return type metadata accessor for OutputGenerationManifest();
}

uint64_t type metadata accessor for UnsupportedValueBehavior()
{
  return type metadata accessor for UnsupportedValueBehavior();
}

uint64_t type metadata accessor for DucTemplatingLocalContext()
{
  return type metadata accessor for DucTemplatingLocalContext();
}

uint64_t ParameterResolutionRecord.intent.getter()
{
  return ParameterResolutionRecord.intent.getter();
}

uint64_t ParameterResolutionRecord.result.getter()
{
  return ParameterResolutionRecord.result.getter();
}

uint64_t ParameterResolutionRecord.parameter.getter()
{
  return ParameterResolutionRecord.parameter.getter();
}

uint64_t OrdinalDisplayHintsBuilder.init(referenceNode:)()
{
  return OrdinalDisplayHintsBuilder.init(referenceNode:)();
}

uint64_t OrdinalDisplayHintsBuilder.build(for:)()
{
  return OrdinalDisplayHintsBuilder.build(for:)();
}

uint64_t type metadata accessor for OrdinalDisplayHintsBuilder()
{
  return type metadata accessor for OrdinalDisplayHintsBuilder();
}

uint64_t dispatch thunk of ConfirmationResponseProviding.confirmationResponse.getter()
{
  return dispatch thunk of ConfirmationResponseProviding.confirmationResponse.getter();
}

uint64_t BasicDisambiguationItemContainer.init(_:_:)()
{
  return BasicDisambiguationItemContainer.init(_:_:)();
}

uint64_t static ConversationStateAttachmentUtils.makeAttachmentToClearSlotResolutionState<A>(intent:)()
{
  return static ConversationStateAttachmentUtils.makeAttachmentToClearSlotResolutionState<A>(intent:)();
}

uint64_t SimpleConfirmationResponseProvider.init(_:)()
{
  return SimpleConfirmationResponseProvider.init(_:)();
}

uint64_t Input.description.getter()
{
  return Input.description.getter();
}

uint64_t Input.parse.getter()
{
  return Input.parse.getter();
}

uint64_t Input.init(parse:)()
{
  return Input.init(parse:)();
}

uint64_t type metadata accessor for Input()
{
  return type metadata accessor for Input();
}

uint64_t Parse.DirectInvocation.identifier.getter()
{
  return Parse.DirectInvocation.identifier.getter();
}

uint64_t Parse.DirectInvocation.userData.getter()
{
  return Parse.DirectInvocation.userData.getter();
}

uint64_t type metadata accessor for Parse.DirectInvocation()
{
  return type metadata accessor for Parse.DirectInvocation();
}

uint64_t Parse.ServerConversion.siriKitIntent.getter()
{
  return Parse.ServerConversion.siriKitIntent.getter();
}

uint64_t type metadata accessor for Parse.ServerConversion()
{
  return type metadata accessor for Parse.ServerConversion();
}

uint64_t type metadata accessor for Parse()
{
  return type metadata accessor for Parse();
}

uint64_t static Device.current.getter()
{
  return static Device.current.getter();
}

uint64_t USOParse.debugDescription.getter()
{
  return USOParse.debugDescription.getter();
}

uint64_t USOParse.userParse.getter()
{
  return USOParse.userParse.getter();
}

uint64_t type metadata accessor for USOParse()
{
  return type metadata accessor for USOParse();
}

uint64_t type metadata accessor for AceOutput()
{
  return type metadata accessor for AceOutput();
}

uint64_t type metadata accessor for ImageSize()
{
  return type metadata accessor for ImageSize();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t Siri_Nlu_External_UsoGraph.identifiers.getter()
{
  return Siri_Nlu_External_UsoGraph.identifiers.getter();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoGraph()
{
  return type metadata accessor for Siri_Nlu_External_UsoGraph();
}

uint64_t Siri_Nlu_External_UserParse.userDialogActs.getter()
{
  return Siri_Nlu_External_UserParse.userDialogActs.getter();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserParse()
{
  return type metadata accessor for Siri_Nlu_External_UserParse();
}

uint64_t Siri_Nlu_External_UserAccepted.init()()
{
  return Siri_Nlu_External_UserAccepted.init()();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserAccepted()
{
  return type metadata accessor for Siri_Nlu_External_UserAccepted();
}

uint64_t Siri_Nlu_External_SystemOffered.offeredAct.setter()
{
  return Siri_Nlu_External_SystemOffered.offeredAct.setter();
}

uint64_t Siri_Nlu_External_SystemOffered.init()()
{
  return Siri_Nlu_External_SystemOffered.init()();
}

uint64_t type metadata accessor for Siri_Nlu_External_SystemOffered()
{
  return type metadata accessor for Siri_Nlu_External_SystemOffered();
}

uint64_t Siri_Nlu_External_UserCancelled.init()()
{
  return Siri_Nlu_External_UserCancelled.init()();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserCancelled()
{
  return type metadata accessor for Siri_Nlu_External_UserCancelled();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasAccepted.getter()
{
  return Siri_Nlu_External_UserDialogAct.hasAccepted.getter();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasRejected.getter()
{
  return Siri_Nlu_External_UserDialogAct.hasRejected.getter();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasCancelled.getter()
{
  return Siri_Nlu_External_UserDialogAct.hasCancelled.getter();
}

uint64_t Siri_Nlu_External_UserDialogAct.userStatedTask.getter()
{
  return Siri_Nlu_External_UserDialogAct.userStatedTask.getter();
}

uint64_t Siri_Nlu_External_UserDialogAct.userStatedTask.setter()
{
  return Siri_Nlu_External_UserDialogAct.userStatedTask.setter();
}

uint64_t Siri_Nlu_External_UserDialogAct.wantedToProceed.setter()
{
  return Siri_Nlu_External_UserDialogAct.wantedToProceed.setter();
}

uint64_t Siri_Nlu_External_UserDialogAct.accepted.setter()
{
  return Siri_Nlu_External_UserDialogAct.accepted.setter();
}

uint64_t Siri_Nlu_External_UserDialogAct.getTasks()()
{
  return Siri_Nlu_External_UserDialogAct.getTasks()();
}

uint64_t Siri_Nlu_External_UserDialogAct.cancelled.setter()
{
  return Siri_Nlu_External_UserDialogAct.cancelled.setter();
}

uint64_t Siri_Nlu_External_UserDialogAct.init()()
{
  return Siri_Nlu_External_UserDialogAct.init()();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserDialogAct()
{
  return type metadata accessor for Siri_Nlu_External_UserDialogAct();
}

uint64_t type metadata accessor for Siri_Nlu_External_SystemPrompted()
{
  return type metadata accessor for Siri_Nlu_External_SystemPrompted();
}

uint64_t Siri_Nlu_External_UserStatedTask.task.getter()
{
  return Siri_Nlu_External_UserStatedTask.task.getter();
}

uint64_t Siri_Nlu_External_UserStatedTask.task.setter()
{
  return Siri_Nlu_External_UserStatedTask.task.setter();
}

uint64_t Siri_Nlu_External_UserStatedTask.init()()
{
  return Siri_Nlu_External_UserStatedTask.init()();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserStatedTask()
{
  return type metadata accessor for Siri_Nlu_External_UserStatedTask();
}

uint64_t Siri_Nlu_External_SystemDialogAct.offered.setter()
{
  return Siri_Nlu_External_SystemDialogAct.offered.setter();
}

uint64_t Siri_Nlu_External_SystemDialogAct.prompted.setter()
{
  return Siri_Nlu_External_SystemDialogAct.prompted.setter();
}

uint64_t Siri_Nlu_External_SystemDialogAct.init()()
{
  return Siri_Nlu_External_SystemDialogAct.init()();
}

uint64_t type metadata accessor for Siri_Nlu_External_SystemDialogAct()
{
  return type metadata accessor for Siri_Nlu_External_SystemDialogAct();
}

uint64_t Siri_Nlu_External_SystemGaveOptions.choices.setter()
{
  return Siri_Nlu_External_SystemGaveOptions.choices.setter();
}

uint64_t Siri_Nlu_External_SystemGaveOptions.init()()
{
  return Siri_Nlu_External_SystemGaveOptions.init()();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserWantedToProceed()
{
  return type metadata accessor for Siri_Nlu_External_UserWantedToProceed();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.backingAppBundleID.getter()
{
  return Siri_Nlu_External_UsoEntityIdentifier.backingAppBundleID.getter();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.value.getter()
{
  return Siri_Nlu_External_UsoEntityIdentifier.value.getter();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.namespace.getter()
{
  return Siri_Nlu_External_UsoEntityIdentifier.namespace.getter();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoEntityIdentifier()
{
  return type metadata accessor for Siri_Nlu_External_UsoEntityIdentifier();
}

uint64_t static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)()
{
  return static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)();
}

uint64_t static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)()
{
  return static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.strictPrompt.setter()
{
  return Com_Apple_Siri_Product_Proto_PromptContext.strictPrompt.setter();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.previousDomainName.setter()
{
  return Com_Apple_Siri_Product_Proto_PromptContext.previousDomainName.setter();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.listenAfterSpeaking.setter()
{
  return Com_Apple_Siri_Product_Proto_PromptContext.listenAfterSpeaking.setter();
}

uint64_t type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext()
{
  return type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext();
}

uint64_t NonTerminalOntologyNode.init(name:multicardinal:childNodes:)()
{
  return NonTerminalOntologyNode.init(name:multicardinal:childNodes:)();
}

uint64_t NonTerminalOntologyNode.name.getter()
{
  return NonTerminalOntologyNode.name.getter();
}

uint64_t type metadata accessor for NonTerminalOntologyNode()
{
  return type metadata accessor for NonTerminalOntologyNode();
}

uint64_t dispatch thunk of Uso_VerbTemplate_NoVerb.entity.getter()
{
  return dispatch thunk of Uso_VerbTemplate_NoVerb.entity.getter();
}

uint64_t dispatch thunk of Uso_VerbTemplateBuilder_NoVerb.setEntity(value:)()
{
  return dispatch thunk of Uso_VerbTemplateBuilder_NoVerb.setEntity(value:)();
}

uint64_t DomainOntologyNode.init(name:childNodes:isInEventTree:)()
{
  return DomainOntologyNode.init(name:childNodes:isInEventTree:)();
}

uint64_t type metadata accessor for DomainOntologyNode()
{
  return type metadata accessor for DomainOntologyNode();
}

uint64_t static PersonOntologyNode.personFullNameNode.getter()
{
  return static PersonOntologyNode.personFullNameNode.getter();
}

uint64_t PersonOntologyNode.PersonNamePrefix.rawValue.getter()
{
  return PersonOntologyNode.PersonNamePrefix.rawValue.getter();
}

uint64_t type metadata accessor for PersonOntologyNode.PersonNamePrefix()
{
  return type metadata accessor for PersonOntologyNode.PersonNamePrefix();
}

uint64_t PersonOntologyNode.PersonNamePostfix.rawValue.getter()
{
  return PersonOntologyNode.PersonNamePostfix.rawValue.getter();
}

uint64_t type metadata accessor for PersonOntologyNode.PersonNamePostfix()
{
  return type metadata accessor for PersonOntologyNode.PersonNamePostfix();
}

uint64_t type metadata accessor for PersonOntologyNode()
{
  return type metadata accessor for PersonOntologyNode();
}

uint64_t static AddressOntologyNode.PersonPlaceNode.personPlaceIdNode.getter()
{
  return static AddressOntologyNode.PersonPlaceNode.personPlaceIdNode.getter();
}

uint64_t AddressOntologyNode.PersonPlaceNode.init(name:multicardinal:)()
{
  return AddressOntologyNode.PersonPlaceNode.init(name:multicardinal:)();
}

uint64_t type metadata accessor for AddressOntologyNode.PersonPlaceNode()
{
  return type metadata accessor for AddressOntologyNode.PersonPlaceNode();
}

uint64_t static AddressOntologyNode.OccupantNode.occupantFullNameNode.getter()
{
  return static AddressOntologyNode.OccupantNode.occupantFullNameNode.getter();
}

uint64_t static AddressOntologyNode.OccupantNode.occupantLastNameNode.getter()
{
  return static AddressOntologyNode.OccupantNode.occupantLastNameNode.getter();
}

uint64_t AddressOntologyNode.OccupantNode.init(name:multicardinal:)()
{
  return AddressOntologyNode.OccupantNode.init(name:multicardinal:)();
}

uint64_t type metadata accessor for AddressOntologyNode.OccupantNode()
{
  return type metadata accessor for AddressOntologyNode.OccupantNode();
}

uint64_t AddressOntologyNode.init(name:multicardinal:)()
{
  return AddressOntologyNode.init(name:multicardinal:)();
}

uint64_t type metadata accessor for AddressOntologyNode()
{
  return type metadata accessor for AddressOntologyNode();
}

uint64_t TerminalOntologyNode.init(name:multicardinal:)()
{
  return TerminalOntologyNode.init(name:multicardinal:)();
}

uint64_t TerminalOntologyNode.name.getter()
{
  return TerminalOntologyNode.name.getter();
}

uint64_t dispatch thunk of OntologyNode.name.getter()
{
  return dispatch thunk of OntologyNode.name.getter();
}

uint64_t NLIntentWrapper.description.getter()
{
  return NLIntentWrapper.description.getter();
}

uint64_t TerminalElement.SemanticValue.init(_:javaPojoName:)()
{
  return TerminalElement.SemanticValue.init(_:javaPojoName:)();
}

uint64_t type metadata accessor for TerminalElement.Value()
{
  return type metadata accessor for TerminalElement.Value();
}

uint64_t static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)()
{
  return static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)();
}

uint64_t type metadata accessor for MetaDomainAction()
{
  return type metadata accessor for MetaDomainAction();
}

uint64_t AddressIntentNode.init(intentNode:ontologyNode:)()
{
  return AddressIntentNode.init(intentNode:ontologyNode:)();
}

uint64_t type metadata accessor for AddressIntentNode()
{
  return type metadata accessor for AddressIntentNode();
}

uint64_t type metadata accessor for UsoBuilderOptions()
{
  return type metadata accessor for UsoBuilderOptions();
}

uint64_t OccupantIntentNode.init(intentNode:ontologyNode:)()
{
  return OccupantIntentNode.init(intentNode:ontologyNode:)();
}

uint64_t OccupantIntentNode.namePrefix.getter()
{
  return OccupantIntentNode.namePrefix.getter();
}

uint64_t OccupantIntentNode.namePostfix.getter()
{
  return OccupantIntentNode.namePostfix.getter();
}

uint64_t OccupantIntentNode.relationship.getter()
{
  return OccupantIntentNode.relationship.getter();
}

uint64_t OccupantIntentNode.company.getter()
{
  return OccupantIntentNode.company.getter();
}

uint64_t OccupantIntentNode.fullName.getter()
{
  return OccupantIntentNode.fullName.getter();
}

uint64_t OccupantIntentNode.lastName.getter()
{
  return OccupantIntentNode.lastName.getter();
}

uint64_t OccupantIntentNode.nickname.getter()
{
  return OccupantIntentNode.nickname.getter();
}

uint64_t OccupantIntentNode.firstName.getter()
{
  return OccupantIntentNode.firstName.getter();
}

uint64_t type metadata accessor for OccupantIntentNode()
{
  return type metadata accessor for OccupantIntentNode();
}

uint64_t TerminalIntentNode.init(name:value:semanticTags:)()
{
  return TerminalIntentNode.init(name:value:semanticTags:)();
}

uint64_t type metadata accessor for TerminalIntentNode()
{
  return type metadata accessor for TerminalIntentNode();
}

uint64_t IntentNodeTraversable.intentNode(forOntologyNode:)()
{
  return IntentNodeTraversable.intentNode(forOntologyNode:)();
}

uint64_t IntentNodeTraversable.value<A>(forNode:)()
{
  return IntentNodeTraversable.value<A>(forNode:)();
}

uint64_t NonTerminalIntentNode.ontologyNodeName.getter()
{
  return NonTerminalIntentNode.ontologyNodeName.getter();
}

uint64_t NonTerminalIntentNode.init(name:childNodes:resultIDs:)()
{
  return NonTerminalIntentNode.init(name:childNodes:resultIDs:)();
}

uint64_t type metadata accessor for NonTerminalIntentNode()
{
  return type metadata accessor for NonTerminalIntentNode();
}

uint64_t type metadata accessor for MitigatorClassification()
{
  return type metadata accessor for MitigatorClassification();
}

uint64_t dispatch thunk of UsoEntity_common_Person.identifyingRelationship.getter()
{
  return dispatch thunk of UsoEntity_common_Person.identifyingRelationship.getter();
}

uint64_t dispatch thunk of UsoEntity_common_Person.name.getter()
{
  return dispatch thunk of UsoEntity_common_Person.name.getter();
}

uint64_t dispatch thunk of UsoEntity_common_Journey.dateTimeRange.getter()
{
  return dispatch thunk of UsoEntity_common_Journey.dateTimeRange.getter();
}

uint64_t static UsoTask_CodegenConverter.convert(task:)()
{
  return static UsoTask_CodegenConverter.convert(task:)();
}

uint64_t type metadata accessor for UsoTask_noVerb_common_Person()
{
  return type metadata accessor for UsoTask_noVerb_common_Person();
}

uint64_t UsoEntityBuilder_common_Person.init()()
{
  return UsoEntityBuilder_common_Person.init()();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_Person()
{
  return type metadata accessor for UsoEntityBuilder_common_Person();
}

uint64_t dispatch thunk of UsoEntity_common_DateTimeRange.end.getter()
{
  return dispatch thunk of UsoEntity_common_DateTimeRange.end.getter();
}

uint64_t type metadata accessor for UsoTask_request_common_Journey()
{
  return type metadata accessor for UsoTask_request_common_Journey();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceSelect.select.getter()
{
  return dispatch thunk of Uso_VerbTemplate_ReferenceSelect.select.getter();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceSelect.reference.getter()
{
  return dispatch thunk of Uso_VerbTemplate_ReferenceSelect.reference.getter();
}

uint64_t dispatch thunk of UsoEntity_common_PersonRelationship.relationshipType.getter()
{
  return dispatch thunk of UsoEntity_common_PersonRelationship.relationshipType.getter();
}

uint64_t UsoTaskBuilder_noVerb_common_Person.init()()
{
  return UsoTaskBuilder_noVerb_common_Person.init()();
}

uint64_t type metadata accessor for UsoTaskBuilder_noVerb_common_Person()
{
  return type metadata accessor for UsoTaskBuilder_noVerb_common_Person();
}

uint64_t type metadata accessor for UsoTask_noVerb_common_PersonRelationship()
{
  return type metadata accessor for UsoTask_noVerb_common_PersonRelationship();
}

uint64_t type metadata accessor for NLState()
{
  return type metadata accessor for NLState();
}

uint64_t UsoTask.verbString.getter()
{
  return UsoTask.verbString.getter();
}

uint64_t UsoTask.baseEntityAsString.getter()
{
  return UsoTask.baseEntityAsString.getter();
}

uint64_t NLIntent.domainNode.getter()
{
  return NLIntent.domainNode.getter();
}

uint64_t NLIntent.init(rootNode:score:originalInput:allWordsMatched:primary:usingExplicitInput:intentRank:isNERBasedParse:intentID:nlState:mitigatorClassification:strippedVoiceTrigger:isInvalidVoiceTrigger:isSuggested:metaDomainActions:)()
{
  return NLIntent.init(rootNode:score:originalInput:allWordsMatched:primary:usingExplicitInput:intentRank:isNERBasedParse:intentID:nlState:mitigatorClassification:strippedVoiceTrigger:isInvalidVoiceTrigger:isSuggested:metaDomainActions:)();
}

uint64_t type metadata accessor for NLIntent()
{
  return type metadata accessor for NLIntent();
}

uint64_t SiriKitContactResolver.resolve(queries:config:)()
{
  return SiriKitContactResolver.resolve(queries:config:)();
}

uint64_t SiriKitContactResolver.init()()
{
  return SiriKitContactResolver.init()();
}

uint64_t type metadata accessor for SiriKitContactResolver()
{
  return type metadata accessor for SiriKitContactResolver();
}

uint64_t ContactQuery.familyName.setter()
{
  return ContactQuery.familyName.setter();
}

uint64_t ContactQuery.namePrefix.setter()
{
  return ContactQuery.namePrefix.setter();
}

uint64_t ContactQuery.nameSuffix.setter()
{
  return ContactQuery.nameSuffix.setter();
}

uint64_t ContactQuery.relationship.setter()
{
  return ContactQuery.relationship.setter();
}

uint64_t ContactQuery.organizationName.setter()
{
  return ContactQuery.organizationName.setter();
}

uint64_t ContactQuery.id.getter()
{
  return ContactQuery.id.getter();
}

uint64_t ContactQuery.fullName.setter()
{
  return ContactQuery.fullName.setter();
}

uint64_t ContactQuery.nickname.setter()
{
  return ContactQuery.nickname.setter();
}

uint64_t ContactQuery.givenName.getter()
{
  return ContactQuery.givenName.getter();
}

uint64_t ContactQuery.givenName.setter()
{
  return ContactQuery.givenName.setter();
}

uint64_t ContactQuery.init()()
{
  return ContactQuery.init()();
}

uint64_t type metadata accessor for ContactQuery()
{
  return type metadata accessor for ContactQuery();
}

uint64_t type metadata accessor for RecommenderType()
{
  return type metadata accessor for RecommenderType();
}

uint64_t ContactResolverConfig.init(intentId:intentTypeName:locale:logRunTimeData:processNLv3SpeechAlternatives:bundleIds:domainsToSearchForHistory:searchSuggestedContacts:recommender:customGenerator:)()
{
  return ContactResolverConfig.init(intentId:intentTypeName:locale:logRunTimeData:processNLv3SpeechAlternatives:bundleIds:domainsToSearchForHistory:searchSuggestedContacts:recommender:customGenerator:)();
}

uint64_t type metadata accessor for ContactResolverConfig()
{
  return type metadata accessor for ContactResolverConfig();
}

uint64_t static ContactResolverDomain.all.getter()
{
  return static ContactResolverDomain.all.getter();
}

uint64_t type metadata accessor for ContactResolverDomain()
{
  return type metadata accessor for ContactResolverDomain();
}

uint64_t type metadata accessor for SearchSuggestedContacts()
{
  return type metadata accessor for SearchSuggestedContacts();
}

uint64_t ContactRelationshipQuery.init(label:fromContact:)()
{
  return ContactRelationshipQuery.init(label:fromContact:)();
}

uint64_t type metadata accessor for ContactRelationshipQuery()
{
  return type metadata accessor for ContactRelationshipQuery();
}

uint64_t SiriEnvironmentLocating<>.siriEnvironment.modify()
{
  return SiriEnvironmentLocating<>.siriEnvironment.modify();
}

uint64_t SiriEnvironmentLocating<>.siriEnvironment.getter()
{
  return SiriEnvironmentLocating<>.siriEnvironment.getter();
}

uint64_t SiriEnvironmentLocating<>.siriEnvironment.setter()
{
  return SiriEnvironmentLocating<>.siriEnvironment.setter();
}

uint64_t static DeviceIdiom.== infix(_:_:)()
{
  return static DeviceIdiom.== infix(_:_:)();
}

uint64_t type metadata accessor for DeviceIdiom()
{
  return type metadata accessor for DeviceIdiom();
}

uint64_t dispatch thunk of DialogLocationValue.Builder.withAddress(_:)()
{
  return dispatch thunk of DialogLocationValue.Builder.withAddress(_:)();
}

uint64_t dispatch thunk of DialogLocationValue.Builder.build()()
{
  return dispatch thunk of DialogLocationValue.Builder.build()();
}

uint64_t DialogLocationValue.Builder.init()()
{
  return DialogLocationValue.Builder.init()();
}

uint64_t type metadata accessor for DialogLocationValue.Builder()
{
  return type metadata accessor for DialogLocationValue.Builder();
}

uint64_t dispatch thunk of DialogLocationAddress.Builder.withCountry(_:)()
{
  return dispatch thunk of DialogLocationAddress.Builder.withCountry(_:)();
}

uint64_t dispatch thunk of DialogLocationAddress.Builder.withLocality(_:)()
{
  return dispatch thunk of DialogLocationAddress.Builder.withLocality(_:)();
}

uint64_t dispatch thunk of DialogLocationAddress.Builder.withPostCode(_:)()
{
  return dispatch thunk of DialogLocationAddress.Builder.withPostCode(_:)();
}

uint64_t dispatch thunk of DialogLocationAddress.Builder.withSubLocality(_:)()
{
  return dispatch thunk of DialogLocationAddress.Builder.withSubLocality(_:)();
}

uint64_t dispatch thunk of DialogLocationAddress.Builder.withFullThoroughfare(_:)()
{
  return dispatch thunk of DialogLocationAddress.Builder.withFullThoroughfare(_:)();
}

uint64_t dispatch thunk of DialogLocationAddress.Builder.withAdministrativeArea(_:)()
{
  return dispatch thunk of DialogLocationAddress.Builder.withAdministrativeArea(_:)();
}

uint64_t dispatch thunk of DialogLocationAddress.Builder.build()()
{
  return dispatch thunk of DialogLocationAddress.Builder.build()();
}

uint64_t DialogLocationAddress.Builder.init()()
{
  return DialogLocationAddress.Builder.init()();
}

uint64_t type metadata accessor for DialogLocationAddress.Builder()
{
  return type metadata accessor for DialogLocationAddress.Builder();
}

uint64_t dispatch thunk of DialogAbstractMeasurement.Builder.build()()
{
  return dispatch thunk of DialogAbstractMeasurement.Builder.build()();
}

uint64_t dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)()
{
  return dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
}

uint64_t dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)()
{
  return dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
}

uint64_t DialogLength.Builder.init()()
{
  return DialogLength.Builder.init()();
}

uint64_t type metadata accessor for DialogLength.Builder()
{
  return type metadata accessor for DialogLength.Builder();
}

uint64_t DialogPerson.__allocating_init(namedPerson:locale:useConversationalName:)()
{
  return DialogPerson.__allocating_init(namedPerson:locale:useConversationalName:)();
}

uint64_t DialogPerson.__allocating_init(person:locale:useConversationalName:)()
{
  return DialogPerson.__allocating_init(person:locale:useConversationalName:)();
}

uint64_t dispatch thunk of DialogPerson.Builder.withRelated(_:)()
{
  return dispatch thunk of DialogPerson.Builder.withRelated(_:)();
}

uint64_t dispatch thunk of DialogPerson.Builder.withGivenName(print:speak:)()
{
  return dispatch thunk of DialogPerson.Builder.withGivenName(print:speak:)();
}

uint64_t dispatch thunk of DialogPerson.Builder.withUseConversationalName(_:)()
{
  return dispatch thunk of DialogPerson.Builder.withUseConversationalName(_:)();
}

uint64_t dispatch thunk of DialogPerson.Builder.build()()
{
  return dispatch thunk of DialogPerson.Builder.build()();
}

uint64_t DialogPerson.Builder.init()()
{
  return DialogPerson.Builder.init()();
}

uint64_t type metadata accessor for DialogPerson.Builder()
{
  return type metadata accessor for DialogPerson.Builder();
}

uint64_t type metadata accessor for DialogPerson()
{
  return type metadata accessor for DialogPerson();
}

uint64_t dispatch thunk of DialogDuration.Builder.build()()
{
  return dispatch thunk of DialogDuration.Builder.build()();
}

uint64_t dispatch thunk of DialogDuration.Builder.withSecs(_:)()
{
  return dispatch thunk of DialogDuration.Builder.withSecs(_:)();
}

uint64_t DialogDuration.Builder.init()()
{
  return DialogDuration.Builder.init()();
}

uint64_t type metadata accessor for DialogDuration.Builder()
{
  return type metadata accessor for DialogDuration.Builder();
}

uint64_t dispatch thunk of DialogLocation.Builder.withValues(_:)()
{
  return dispatch thunk of DialogLocation.Builder.withValues(_:)();
}

uint64_t dispatch thunk of DialogLocation.Builder.build()()
{
  return dispatch thunk of DialogLocation.Builder.build()();
}

uint64_t DialogLocation.Builder.init()()
{
  return DialogLocation.Builder.init()();
}

uint64_t type metadata accessor for DialogLocation.Builder()
{
  return type metadata accessor for DialogLocation.Builder();
}

uint64_t CATGlobals.__allocating_init(dictionary:)()
{
  return CATGlobals.__allocating_init(dictionary:)();
}

uint64_t dispatch thunk of CATGlobals.toDictionary.getter()
{
  return dispatch thunk of CATGlobals.toDictionary.getter();
}

uint64_t CATGlobals.Builder.__allocating_init(siriLocale:)()
{
  return CATGlobals.Builder.__allocating_init(siriLocale:)();
}

uint64_t dispatch thunk of CATGlobals.Builder.withRandomSeed(_:)()
{
  return dispatch thunk of CATGlobals.Builder.withRandomSeed(_:)();
}

uint64_t dispatch thunk of CATGlobals.Builder.build()()
{
  return dispatch thunk of CATGlobals.Builder.build()();
}

uint64_t type metadata accessor for CATGlobals.Builder()
{
  return type metadata accessor for CATGlobals.Builder();
}

uint64_t CATGlobals.__allocating_init()()
{
  return CATGlobals.__allocating_init()();
}

uint64_t type metadata accessor for CATGlobals()
{
  return type metadata accessor for CATGlobals();
}

uint64_t static CATExecutor.registerBundle(bundle:)()
{
  return static CATExecutor.registerBundle(bundle:)();
}

uint64_t static CATExecutor.execute(bundle:catId:parameters:globals:callback:options:_:)()
{
  return static CATExecutor.execute(bundle:catId:parameters:globals:callback:options:_:)();
}

uint64_t static CATExecutor.execute(bundle:catId:parameters:globals:callback:options:)()
{
  return static CATExecutor.execute(bundle:catId:parameters:globals:callback:options:)();
}

uint64_t type metadata accessor for CATExecutor()
{
  return type metadata accessor for CATExecutor();
}

uint64_t SpeakableString.init(print:speak:)()
{
  return SpeakableString.init(print:speak:)();
}

uint64_t SpeakableString.print.getter()
{
  return SpeakableString.print.getter();
}

uint64_t SpeakableString.speak.getter()
{
  return SpeakableString.speak.getter();
}

uint64_t type metadata accessor for SpeakableString()
{
  return type metadata accessor for SpeakableString();
}

uint64_t dispatch thunk of CATType.toDictionary.getter()
{
  return dispatch thunk of CATType.toDictionary.getter();
}

uint64_t static CATOption.resetState.getter()
{
  return static CATOption.resetState.getter();
}

uint64_t static CATOption.defaultMode.getter()
{
  return static CATOption.defaultMode.getter();
}

uint64_t static CATOption.testMode.getter()
{
  return static CATOption.testMode.getter();
}

uint64_t static CATOption.debugMode.getter()
{
  return static CATOption.debugMode.getter();
}

uint64_t type metadata accessor for CATOption()
{
  return type metadata accessor for CATOption();
}

uint64_t App.init(appIdentifier:systemExtensionBundleId:systemUIExtensionBundleId:pluginIdentifier:)()
{
  return App.init(appIdentifier:systemExtensionBundleId:systemUIExtensionBundleId:pluginIdentifier:)();
}

uint64_t App.__allocating_init(appIdentifier:)()
{
  return App.__allocating_init(appIdentifier:)();
}

uint64_t type metadata accessor for App()
{
  return type metadata accessor for App();
}

uint64_t type metadata accessor for AppResolutionResult()
{
  return type metadata accessor for AppResolutionResult();
}

uint64_t AppResolutionService.init()()
{
  return AppResolutionService.init()();
}

uint64_t AppResolutionService.deinit()
{
  return AppResolutionService.deinit();
}

uint64_t ContactResolutionSnippetGenerator.init(appBundleId:globals:)()
{
  return ContactResolutionSnippetGenerator.init(appBundleId:globals:)();
}

uint64_t type metadata accessor for ContactResolutionSnippetGenerator()
{
  return type metadata accessor for ContactResolutionSnippetGenerator();
}

uint64_t Google_Protobuf_DoubleValue.value.getter()
{
  return Google_Protobuf_DoubleValue.value.getter();
}

uint64_t type metadata accessor for Google_Protobuf_DoubleValue()
{
  return type metadata accessor for Google_Protobuf_DoubleValue();
}

uint64_t Google_Protobuf_StringValue.value.getter()
{
  return Google_Protobuf_StringValue.value.getter();
}

uint64_t type metadata accessor for Google_Protobuf_StringValue()
{
  return type metadata accessor for Google_Protobuf_StringValue();
}

uint64_t GeoExperience.geoClientComponent.getter()
{
  return GeoExperience.geoClientComponent.getter();
}

uint64_t type metadata accessor for GeoExperience()
{
  return type metadata accessor for GeoExperience();
}

uint64_t PommesContext.exportPromptContext()()
{
  return PommesContext.exportPromptContext()();
}

uint64_t type metadata accessor for PommesContext.Source()
{
  return type metadata accessor for PommesContext.Source();
}

uint64_t PommesContext.init(source:domain:listenAfterSpeaking:)()
{
  return PommesContext.init(source:domain:listenAfterSpeaking:)();
}

uint64_t PommesContext.update(with:)()
{
  return PommesContext.update(with:)();
}

uint64_t type metadata accessor for PommesContext()
{
  return type metadata accessor for PommesContext();
}

uint64_t dispatch thunk of PommesResponse.experiences.getter()
{
  return dispatch thunk of PommesResponse.experiences.getter();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t static MapsService.shareETAConfigurationCheck(_:)()
{
  return static MapsService.shareETAConfigurationCheck(_:)();
}

uint64_t type metadata accessor for MapsService()
{
  return type metadata accessor for MapsService();
}

uint64_t ContactService.init()()
{
  return ContactService.init()();
}

uint64_t type metadata accessor for ContactService()
{
  return type metadata accessor for ContactService();
}

Swift::Bool __swiftcall EnhancedMSPSharedTripContact.isPhoneNumber()()
{
  return EnhancedMSPSharedTripContact.isPhoneNumber()();
}

INPersonHandle __swiftcall EnhancedMSPSharedTripContact.getPersonHandle()()
{
  return (INPersonHandle)EnhancedMSPSharedTripContact.getPersonHandle()();
}

Swift::UInt __swiftcall EnhancedMSPSharedTripContact.getCapabilityType()()
{
  return EnhancedMSPSharedTripContact.getCapabilityType()();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

Swift::String __swiftcall Character.uppercased()()
{
  uint64_t v0 = Character.uppercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::String __swiftcall String.uppercased()()
{
  uint64_t v0 = String.uppercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.toSpeakableString.getter()
{
  return String.toSpeakableString.getter();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return String.index(_:offsetBy:limitedBy:)();
}

uint64_t String.append<A>(contentsOf:)()
{
  return String.append<A>(contentsOf:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

{
  String.append(_:)(a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t Array.debugDescription.getter()
{
  return Array.debugDescription.getter();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)Bool._bridgeToObjectiveC()();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t Double.description.getter()
{
  return Double.description.getter();
}

uint64_t Double.toProtobufDoubleValue()()
{
  return Double.toProtobufDoubleValue()();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static SAIntentGroupLaunchAppWithIntent.launchAppWithIntent(app:intent:intentResponse:)()
{
  return static SAIntentGroupLaunchAppWithIntent.launchAppWithIntent(app:intent:intentResponse:)();
}

uint64_t INPerson.toContactQuery()()
{
  return INPerson.toContactQuery()();
}

uint64_t INPerson.toContactQueryGeo()()
{
  return INPerson.toContactQueryGeo()();
}

uint64_t INPerson.encodeBase64.getter()
{
  return INPerson.encodeBase64.getter();
}

uint64_t INPerson.hasHandleLabel.getter()
{
  return INPerson.hasHandleLabel.getter();
}

uint64_t INPerson.hasHandleValue.getter()
{
  return INPerson.hasHandleValue.getter();
}

uint64_t INPerson.hasUsefulHandleValue.getter()
{
  return INPerson.hasUsefulHandleValue.getter();
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSObject.hashValue.getter()
{
  return NSObject.hashValue.getter();
}

uint64_t VRXIdiom.isWatchOS.getter()
{
  return VRXIdiom.isWatchOS.getter();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t Substring.subscript.getter()
{
  return Substring.subscript.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t StringProtocol.addingPercentEncoding(withAllowedCharacters:)()
{
  return StringProtocol.addingPercentEncoding(withAllowedCharacters:)();
}

uint64_t StringProtocol.caseInsensitiveCompare<A>(_:)()
{
  return StringProtocol.caseInsensitiveCompare<A>(_:)();
}

uint64_t StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return _StringGuts._slowWithCString<A>(_:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t dispatch thunk of _AnyIndexBox._typeID.getter()
{
  return dispatch thunk of _AnyIndexBox._typeID.getter();
}

uint64_t dispatch thunk of _AnyIndexBox._isEqual(to:)()
{
  return dispatch thunk of _AnyIndexBox._isEqual(to:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t type metadata accessor for DecodingError()
{
  return type metadata accessor for DecodingError();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t dispatch thunk of _AnySequenceBox._makeIterator()()
{
  return dispatch thunk of _AnySequenceBox._makeIterator()();
}

uint64_t dispatch thunk of _AnyCollectionBox.subscript.getter()
{
  return dispatch thunk of _AnyCollectionBox.subscript.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of _AnyIteratorBoxBase.next()()
{
  return dispatch thunk of _AnyIteratorBoxBase.next()();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t Mirror.init(reflecting:)()
{
  return Mirror.init(reflecting:)();
}

uint64_t type metadata accessor for Mirror.DisplayStyle()
{
  return type metadata accessor for Mirror.DisplayStyle();
}

uint64_t Mirror.displayStyle.getter()
{
  return Mirror.displayStyle.getter();
}

uint64_t Mirror.children.getter()
{
  return Mirror.children.getter();
}

uint64_t type metadata accessor for Mirror()
{
  return type metadata accessor for Mirror();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t AFNavigationStateIsNavigating()
{
  return _AFNavigationStateIsNavigating();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return __swift_stdlib_strtod_clocale();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return _swift_initEnumMetadataSingleCase();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}