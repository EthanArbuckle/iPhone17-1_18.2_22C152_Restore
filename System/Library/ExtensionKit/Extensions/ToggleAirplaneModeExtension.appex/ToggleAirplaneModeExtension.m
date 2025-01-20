uint64_t sub_100001B94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t OpaqueTypeConformance2;
  uint64_t v20;
  uint64_t v21;
  void v23[2];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;

  v30 = a1;
  sub_100003330();
  __chkstk_darwin();
  v23[1] = (char *)v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003250();
  __chkstk_darwin();
  sub_100003370();
  __chkstk_darwin();
  v2 = sub_100002D34(&qword_100008290);
  v3 = *(void *)(v2 - 8);
  v24 = v2;
  v25 = v3;
  __chkstk_darwin();
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100002D34(&qword_100008298);
  v7 = *(void *)(v6 - 8);
  v26 = v6;
  v27 = v7;
  __chkstk_darwin();
  v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100002D34(&qword_1000082A0);
  v11 = *(void *)(v10 - 8);
  v28 = v10;
  v29 = v11;
  __chkstk_darwin();
  v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23[0] = qword_100008168;
  swift_bridgeObjectRetain();
  sub_100003360();
  sub_100003240();
  sub_100003380();
  type metadata accessor for ToggleAirplaneModeStateProvider();
  v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  *(void *)(v14 + 16) = [objc_allocWithZone((Class)RadiosPreferences) init];
  v31 = v14;
  sub_100003320();
  sub_100002D78();
  sub_100003340();
  sub_100003360();
  sub_100003240();
  v31 = sub_100003380();
  v32 = v15;
  v16 = sub_100002DCC(&qword_1000082B0, &qword_100008290);
  v17 = sub_100002E10();
  v18 = v24;
  sub_1000032C0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v18);
  v31 = v18;
  v32 = &type metadata for String;
  v33 = v16;
  v34 = v17;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v20 = v26;
  sub_1000032E0();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v20);
  v31 = v20;
  v32 = (void *)OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v21 = v28;
  sub_1000032D0();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v13, v21);
}

uint64_t sub_1000020FC@<X0>(uint64_t a1@<X8>)
{
  sub_1000032A0();
  uint64_t result = sub_1000032F0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_10000217C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100003310();
  *a1 = result;
  return result;
}

uint64_t sub_1000021B8()
{
  return sub_100003350();
}

uint64_t sub_100002214()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for ToggleAirplaneModeStateProvider()
{
  return self;
}

unint64_t sub_100002274()
{
  unint64_t result = qword_100008248;
  if (!qword_100008248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008248);
  }
  return result;
}

uint64_t sub_1000022C8()
{
  v2 = *(void **)(*(void *)v0 + 16);
  if (v2)
  {
    id v3 = v2;
    [v3 refresh];
    id v4 = [v3 airplaneMode];
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v1 + 8);
  return sub_100002AEC(v5, v1, (uint64_t)v4);
}

unint64_t sub_10000238C()
{
  unint64_t result = qword_100008258;
  if (!qword_100008258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008258);
  }
  return result;
}

uint64_t sub_1000023E0()
{
  uint64_t v0 = sub_100003230();
  sub_100002A88(v0, qword_100008368);
  sub_100002A50(v0, (uint64_t)qword_100008368);
  return sub_100003220();
}

uint64_t sub_10000244C(uint64_t a1, char a2, uint64_t a3)
{
  *(unsigned char *)(v3 + 36) = a2;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a3;
  return _swift_task_switch(sub_100002470, 0, 0);
}

uint64_t sub_100002470()
{
  uint64_t v1 = *(void **)(v0 + 24);
  if (v1)
  {
    char v2 = *(unsigned char *)(v0 + 36) ^ 1;
    id v3 = v1;
    [v3 setAirplaneModeWithoutMirroring:v2 & 1];
    if (qword_100008180 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_100003280();
    sub_100002A50(v4, (uint64_t)qword_100008380);
    id v5 = v3;
    v6 = sub_100003260();
    os_log_type_t v7 = sub_100003390();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v8 = 67109120;
      *(_DWORD *)(v0 + 32) = v2 & 1;
      sub_1000033A0();

      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Toggled airplane mode to: %{BOOL}d", v8, 8u);
      swift_slowDealloc();
    }
    else
    {
    }
  }
  sub_100003210();
  v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_100002614()
{
  return *v0;
}

uint64_t sub_10000261C(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*sub_100002624())()
{
  return nullsub_1;
}

unint64_t sub_100002648()
{
  unint64_t result = qword_100008260;
  if (!qword_100008260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008260);
  }
  return result;
}

unint64_t sub_1000026A0()
{
  unint64_t result = qword_100008268;
  if (!qword_100008268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008268);
  }
  return result;
}

uint64_t sub_1000026F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100002710()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100002760@<X0>(uint64_t a1@<X8>)
{
  if (qword_100008178 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100003230();
  uint64_t v3 = sub_100002A50(v2, (uint64_t)qword_100008368);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100002810()
{
  return 0;
}

uint64_t sub_100002820(uint64_t a1)
{
  char v4 = *v1;
  uint64_t v5 = *((void *)v1 + 1);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = v5;
  *(unsigned char *)(v6 + 36) = v4;
  *(void *)(v6 + 8) = sub_1000028E0;
  return _swift_task_switch(sub_100002470, 0, 0);
}

uint64_t sub_1000028E0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id sub_1000029D4@<X0>(uint64_t a1@<X8>)
{
  id result = [objc_allocWithZone((Class)RadiosPreferences) init];
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_100002A14(uint64_t a1)
{
  unint64_t v2 = sub_10000238C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100002A50(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100002A88(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100002AEC(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

ValueMetadata *type metadata accessor for AirplaneModeToggle()
{
  return &type metadata for AirplaneModeToggle;
}

uint64_t initializeBufferWithCopyOfBuffer for ToggleAirplaneModeIntent(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v3;
  id v4 = v3;
  return a1;
}

void destroy for ToggleAirplaneModeIntent(uint64_t a1)
{
}

uint64_t assignWithCopy for ToggleAirplaneModeIntent(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void **)(a1 + 8);
  id v4 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v4;
  id v5 = v4;

  return a1;
}

__n128 initializeWithTake for ToggleAirplaneModeIntent(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for ToggleAirplaneModeIntent(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for ToggleAirplaneModeIntent(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ToggleAirplaneModeIntent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ToggleAirplaneModeIntent()
{
  return &type metadata for ToggleAirplaneModeIntent;
}

uint64_t sub_100002C94()
{
  return sub_100002DCC(&qword_100008280, &qword_100008288);
}

uint64_t sub_100002CD0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100002D18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100002D34(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100002D78()
{
  unint64_t result = qword_1000082A8;
  if (!qword_1000082A8)
  {
    type metadata accessor for ToggleAirplaneModeStateProvider();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000082A8);
  }
  return result;
}

uint64_t sub_100002DCC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100002CD0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100002E10()
{
  unint64_t result = qword_1000082B8;
  if (!qword_1000082B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000082B8);
  }
  return result;
}

uint64_t sub_100002E64()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100002F6C()
{
  unint64_t v0 = sub_1000030EC();

  return static WidgetBundleBuilder.buildBlock<A>(_:)(v0, &type metadata for AirplaneModeToggle, v0);
}

uint64_t sub_100002FB0()
{
  uint64_t v0 = sub_100003280();
  sub_100002A88(v0, qword_100008380);
  sub_100002A50(v0, (uint64_t)qword_100008380);
  return sub_100003270();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000306C()
{
  unint64_t result = qword_1000082C0;
  if (!qword_1000082C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000082C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlCenterExtensionBundle()
{
  return &type metadata for ControlCenterExtensionBundle;
}

uint64_t sub_1000030D0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000030EC()
{
  unint64_t result = qword_1000082C8;
  if (!qword_1000082C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000082C8);
  }
  return result;
}

uint64_t sub_100003140()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000318C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1000031C0()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_1000031D0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_1000031E0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000031F0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100003210()
{
  return static IntentResult.result<>()();
}

uint64_t sub_100003220()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100003230()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100003240()
{
  return static Locale.current.getter();
}

uint64_t sub_100003250()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100003260()
{
  return Logger.logObject.getter();
}

uint64_t sub_100003270()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100003280()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100003290()
{
  return static WidgetBundle.main()();
}

uint64_t sub_1000032A0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_1000032C0()
{
  return WidgetConfiguration.description<A>(_:)();
}

uint64_t sub_1000032D0()
{
  return WidgetConfiguration.showsInControlCenter()();
}

uint64_t sub_1000032E0()
{
  return WidgetConfiguration.disablesControlStateCaching()();
}

uint64_t sub_1000032F0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_100003300()
{
  return static Color.orange.getter();
}

uint64_t sub_100003310()
{
  return Image.init(systemName:)();
}

uint64_t sub_100003320()
{
  return static ControlSize._1x1.getter();
}

uint64_t sub_100003330()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_100003340()
{
  return ControlToggle.init<A, B, C>(kind:intent:displayName:preferredSize:stateProvider:title:value:affordances:)();
}

uint64_t sub_100003350()
{
  return ControlAffordances.init(tint:status:actionHint:)();
}

uint64_t sub_100003360()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100003370()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_100003380()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_100003390()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000033A0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}