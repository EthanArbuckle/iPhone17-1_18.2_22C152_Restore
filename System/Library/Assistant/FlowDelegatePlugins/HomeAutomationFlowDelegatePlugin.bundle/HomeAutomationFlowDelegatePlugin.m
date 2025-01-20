uint64_t HomeAutomationFlowDelegatePlugin.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  HomeAutomationFlowDelegatePlugin.init()();
  return v0;
}

uint64_t HomeAutomationFlowDelegatePlugin.init()()
{
  uint64_t v1 = v0;
  sub_3960();
  sub_3A50();
  sub_3990();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = [self bundleForClass:ObjCClassFromMetadata];
  id v4 = [v3 bundlePath];

  sub_3B00();
  swift_bridgeObjectRetain();
  v6._countAndFlagsBits = 0x74616C706D65542FLL;
  v6._object = (void *)0xEA00000000007365;
  sub_3B10(v6);
  swift_bridgeObjectRelease();
  sub_3950();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t HomeAutomationFlowDelegatePlugin.findFlowForX(parse:)(uint64_t a1)
{
  uint64_t v3 = sub_3940();
  sub_388C();
  uint64_t v5 = v4;
  __chkstk_darwin();
  sub_38D0();
  sub_3AE0();
  __chkstk_darwin();
  sub_38A8();
  sub_39E0();
  v7[3] = sub_3A00();
  v7[4] = (uint64_t)&protocol witness table for LocationService;
  sub_2F34(v7);
  sub_39F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v1, a1, v3);
  sub_39D0();
  swift_allocObject();
  sub_39C0();
  sub_39B0();
  return swift_release();
}

uint64_t *sub_2F34(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

Swift::Void __swiftcall HomeAutomationFlowDelegatePlugin.warmup(refId:)(Swift::String refId)
{
  object = refId._object;
  uint64_t countAndFlagsBits = refId._countAndFlagsBits;
  uint64_t v4 = sub_3AF0();
  sub_388C();
  uint64_t v6 = v5;
  __chkstk_darwin();
  sub_38E8();
  uint64_t v7 = sub_3AD0();
  sub_388C();
  uint64_t v9 = v8;
  __chkstk_darwin();
  sub_38B8();
  uint64_t v10 = swift_allocObject();
  *(unsigned char *)(v10 + 16) = 0;
  sub_3A40();
  sub_3B20(52);
  v13._object = (void *)0x8000000000003D40;
  v13._uint64_t countAndFlagsBits = 0xD000000000000032;
  sub_3B10(v13);
  v14._uint64_t countAndFlagsBits = countAndFlagsBits;
  v14._object = object;
  sub_3B10(v14);
  v15._uint64_t countAndFlagsBits = 0;
  v16._uint64_t countAndFlagsBits = 0xD000000000000080;
  v16._object = (void *)0x8000000000003D80;
  v15._object = (void *)0xE000000000000000;
  sub_3AC0(v15, 0, 0, v16);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v7);
  sub_3374(&qword_80A0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_3C50;
  *(void *)(v11 + 32) = sub_3708;
  *(void *)(v11 + 40) = v10;
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v1, enum case for DispatchQoS.QoSClass.userInteractive(_:), v4);
  swift_retain_n();
  sub_39A0();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  swift_release();
}

uint64_t sub_31E4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_31F4(uint64_t a1)
{
  uint64_t v3 = sub_3AD0();
  sub_388C();
  uint64_t v5 = v4;
  __chkstk_darwin();
  sub_38E8();
  sub_3A40();
  sub_3B20(62);
  v8._object = (void *)0x8000000000003E80;
  v8._uint64_t countAndFlagsBits = 0xD00000000000003ALL;
  sub_3B10(v8);
  swift_beginAccess();
  if (*(unsigned char *)(a1 + 16)) {
    v6._uint64_t countAndFlagsBits = 0x73736563637573;
  }
  else {
    v6._uint64_t countAndFlagsBits = 0x6572756C696166;
  }
  v6._object = (void *)0xE700000000000000;
  sub_3B10(v6);
  swift_bridgeObjectRelease();
  v9._uint64_t countAndFlagsBits = 32010;
  v9._object = (void *)0xE200000000000000;
  sub_3B10(v9);
  v10._uint64_t countAndFlagsBits = 0;
  v11._uint64_t countAndFlagsBits = 0xD000000000000080;
  v11._object = (void *)0x8000000000003D80;
  v10._object = (void *)0xE000000000000000;
  sub_3AC0(v10, 0, 0, v11);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
}

uint64_t sub_336C()
{
  return sub_31F4(v0);
}

uint64_t sub_3374(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_33B8(void (**a1)(uint64_t), uint64_t a2)
{
  sub_3374(&qword_8158);
  __chkstk_darwin();
  sub_38A8();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_3A10();
  sub_388C();
  uint64_t v11 = v10;
  __chkstk_darwin();
  sub_38B8();
  sub_3AB0();
  sub_388C();
  uint64_t v26 = v13;
  uint64_t v27 = v12;
  __chkstk_darwin();
  sub_38A8();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = sub_3AD0();
  sub_388C();
  uint64_t v19 = v18;
  __chkstk_darwin();
  sub_38D0();
  v25 = *a1;
  sub_3A40();
  v29._uint64_t countAndFlagsBits = 0xD000000000000080;
  v28._object = (void *)0x8000000000003E60;
  v29._object = (void *)0x8000000000003D80;
  v28._uint64_t countAndFlagsBits = 0xD000000000000014;
  sub_3AC0(v28, 0, 0, v29);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v2, v17);
  v20 = (void *)sub_3A30();
  sub_3A70();
  sub_3A80();

  (*(void (**)(uint64_t, void, uint64_t))(v11 + 104))(v3, enum case for AFAnalyticsEvent.homeKitWarmUpStart(_:), v9);
  sub_3A20();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v3, v9);
  sub_3980();

  swift_beginAccess();
  *(unsigned char *)(a2 + 16) = 1;
  v21 = (void *)sub_3A30();
  sub_3A70();
  sub_3A90();
  uint64_t v22 = sub_3AA0();
  sub_3804(v8, 0, 1, v22);
  sub_3A60();

  uint64_t v23 = sub_382C(v8);
  v25(v23);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8))(v16, v27);
}

uint64_t sub_3708(void (**a1)(uint64_t))
{
  return sub_33B8(a1, v1);
}

uint64_t HomeAutomationFlowDelegatePlugin.deinit()
{
  return v0;
}

uint64_t HomeAutomationFlowDelegatePlugin.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

unint64_t sub_372C()
{
  unint64_t result = qword_80A8;
  if (!qword_80A8)
  {
    type metadata accessor for HomeAutomationFlowDelegatePlugin();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_80A8);
  }
  return result;
}

uint64_t type metadata accessor for HomeAutomationFlowDelegatePlugin()
{
  return self;
}

uint64_t sub_379C(uint64_t a1)
{
  return HomeAutomationFlowDelegatePlugin.findFlowForX(parse:)(a1);
}

uint64_t sub_37B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HomeAutomationFlowDelegatePlugin.__allocating_init()();
  *a1 = result;
  return result;
}

void sub_37E0(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_3804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_382C(uint64_t a1)
{
  uint64_t v2 = sub_3374(&qword_8158);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_3900()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_3910()
{
  return FlowPlugin.makeFlowFor(parse:)();
}

uint64_t sub_3920()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_3930()
{
}

uint64_t sub_3940()
{
  return type metadata accessor for Parse();
}

uint64_t sub_3950()
{
  return static CATExecutor.registerBundle(bundleId:templateDir:)();
}

uint64_t sub_3960()
{
  return type metadata accessor for CATExecutor();
}

uint64_t sub_3970()
{
  return static HomeStore.shared.getter();
}

uint64_t sub_3980()
{
  return type metadata accessor for HomeStore();
}

uint64_t sub_3990()
{
  return type metadata accessor for HomeAutomationCATs();
}

uint64_t sub_39A0()
{
  return parallelize(qos:tasks:completion:)();
}

uint64_t sub_39B0()
{
  return dispatch thunk of FlowProvider.findFlow()();
}

uint64_t sub_39C0()
{
  return FlowProvider.init(locationService:parse:)();
}

uint64_t sub_39D0()
{
  return type metadata accessor for FlowProvider();
}

uint64_t sub_39E0()
{
  return static LocationService.defaultTimeout.getter();
}

uint64_t sub_39F0()
{
  return LocationService.init(timeout:)();
}

uint64_t sub_3A00()
{
  return type metadata accessor for LocationService();
}

uint64_t sub_3A10()
{
  return type metadata accessor for AFAnalyticsEvent();
}

uint64_t sub_3A20()
{
  return static Log.AFAnalytics(event:with:)();
}

uint64_t sub_3A30()
{
  return static Log.OSLogs.warmUp.getter();
}

uint64_t sub_3A40()
{
  return static Log.warmUp.getter();
}

uint64_t sub_3A50()
{
  return static Log.subsystem.getter();
}

uint64_t sub_3A60()
{
  return static Signpost.end(logging:_:_:_:)();
}

uint64_t sub_3A70()
{
  return static Signpost.Name.homeKitWarmUp.getter();
}

uint64_t sub_3A80()
{
  return static Signpost.begin(logging:_:)();
}

uint64_t sub_3A90()
{
  return Signpost.Context.init(numberOfTargetedEntities:serviceTypes:targetedContainer:handleDelegateName:responseHandler:entitiesInitialized:homeStoreLoadSucceeded:intentHandlerName:useCase:retrievedEntitiesFromHomeStoreCache:intentSelectionStep:numberOfInitialCandidates:)();
}

uint64_t sub_3AA0()
{
  return type metadata accessor for Signpost.Context();
}

uint64_t sub_3AB0()
{
  return type metadata accessor for OSSignpostID();
}

void sub_3AC0(Swift::String output, Swift::Bool addToSummary, Swift::Bool test, Swift::String caller)
{
}

uint64_t sub_3AD0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_3AE0()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_3AF0()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_3B00()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

void sub_3B10(Swift::String a1)
{
}

void sub_3B20(Swift::Int a1)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}