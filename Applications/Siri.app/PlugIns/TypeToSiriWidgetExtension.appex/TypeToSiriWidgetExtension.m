uint64_t sub_100002210@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  uint64_t OpaqueTypeConformance2;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v34 = a1;
  v1 = sub_1000034E0();
  v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100002FC4(&qword_1000080E0);
  v28 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100002FC4(&qword_1000080E8);
  v29 = *(void *)(v8 - 8);
  __chkstk_darwin();
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100002FC4(&qword_1000080F0);
  v12 = *(void *)(v11 - 8);
  v30 = v11;
  v31 = v12;
  __chkstk_darwin();
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100002FC4(&qword_1000080F8);
  v16 = *(void *)(v15 - 8);
  v32 = v15;
  v33 = v16;
  __chkstk_darwin();
  v27 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002FC4(&qword_100008100);
  sub_100003008(&qword_100008108, &qword_100008100);
  sub_100003610();
  sub_1000034D0();
  v18 = sub_100003008(&qword_100008110, &qword_1000080E0);
  sub_1000035A0();
  v19 = *(void (**)(char *, uint64_t))(v2 + 8);
  v19(v4, v1);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
  sub_1000034D0();
  v35 = v5;
  v36 = v18;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_100003590();
  v19(v4, v1);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
  v35 = v8;
  v36 = OpaqueTypeConformance2;
  v21 = swift_getOpaqueTypeConformance2();
  v22 = v27;
  v23 = v30;
  sub_1000035B0();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v14, v23);
  sub_100003510();
  v24 = (void *)sub_100003500();
  sub_1000034F0();

  v35 = v23;
  v36 = v21;
  swift_getOpaqueTypeConformance2();
  v25 = v32;
  sub_1000035C0();
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v22, v25);
}

uint64_t sub_100002740()
{
  uint64_t v0 = sub_100002FC4(&qword_100008118);
  uint64_t v1 = sub_100003008(&qword_100008120, &qword_100008118);
  unint64_t v2 = sub_100002EB0();

  return ControlWidgetButton.init<>(action:label:)(v2, sub_1000027EC, 0, v0, &type metadata for LaunchTypeToSiriIntent, v1, v2);
}

uint64_t sub_1000027EC()
{
  return Label.init(title:icon:)(sub_100002840, 0, sub_1000028C4, 0, &type metadata for Text, &type metadata for Image, &protocol witness table for Text, &protocol witness table for Image);
}

uint64_t sub_100002840@<X0>(uint64_t a1@<X8>)
{
  sub_100003560();
  uint64_t result = sub_1000035D0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_1000028C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000035E0();
  *a1 = result;
  return result;
}

uint64_t static LaunchTypeToSiriIntent.title.getter()
{
  return sub_1000034D0();
}

uint64_t LaunchTypeToSiriIntent.perform()(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_100003530();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return _swift_task_switch(sub_1000029E8, 0, 0);
}

uint64_t sub_1000029E8()
{
  sub_100002B74();
  sub_100003630();
  sub_100003540();
  uint64_t v1 = sub_100003520();
  os_log_type_t v2 = sub_100003620();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "#TypeToSiriControlWidget - perform", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = v0[3];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  id v7 = [objc_allocWithZone((Class)SiriSimpleActivationSource) init];
  [v7 activateFromSource:54];
  sub_1000034C0();

  swift_task_dealloc();
  v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

unint64_t sub_100002B74()
{
  unint64_t result = qword_1000080A8;
  if (!qword_1000080A8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000080A8);
  }
  return result;
}

uint64_t sub_100002BCC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100002C64;
  return LaunchTypeToSiriIntent.perform()(a1);
}

uint64_t sub_100002C64()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100002D58(uint64_t a1)
{
  unint64_t v2 = sub_100002EB0();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100002D98()
{
  unint64_t result = qword_1000080B0;
  if (!qword_1000080B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080B0);
  }
  return result;
}

unint64_t sub_100002DF0()
{
  unint64_t result = qword_1000080B8;
  if (!qword_1000080B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080B8);
  }
  return result;
}

uint64_t sub_100002E44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100002E60()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100002EB0()
{
  unint64_t result = qword_1000080C0;
  if (!qword_1000080C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchTypeToSiriIntent()
{
  return &type metadata for LaunchTypeToSiriIntent;
}

uint64_t sub_100002F14()
{
  return sub_100003008(&qword_1000080D0, &qword_1000080D8);
}

uint64_t sub_100002F50(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TypeToSiriControlWidget()
{
  return &type metadata for TypeToSiriControlWidget;
}

uint64_t sub_100002FA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100002FC4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003008(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100002F50(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000304C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003178()
{
  uint64_t v0 = sub_100002FC4(&qword_100008130);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003320();
  sub_100003580();
  sub_100003374();
  sub_100003570();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000032A0()
{
  unint64_t result = qword_100008128;
  if (!qword_100008128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008128);
  }
  return result;
}

ValueMetadata *type metadata accessor for TypeToSiriWidgetBundle()
{
  return &type metadata for TypeToSiriWidgetBundle;
}

uint64_t sub_100003304()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100003320()
{
  unint64_t result = qword_100008138;
  if (!qword_100008138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008138);
  }
  return result;
}

unint64_t sub_100003374()
{
  unint64_t result = qword_100008140;
  if (!qword_100008140)
  {
    sub_100002F50(&qword_100008130);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008140);
  }
  return result;
}

uint64_t sub_1000033D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000342C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100003460()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100003470()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100003480()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_100003490()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000034A0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000034C0()
{
  return static IntentResult.result<>()();
}

uint64_t sub_1000034D0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_1000034E0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_1000034F0()
{
  return dispatch thunk of GMEligibilityProvider.deviceSupported.getter();
}

uint64_t sub_100003500()
{
  return static GMEligibilityProvider.shared.getter();
}

uint64_t sub_100003510()
{
  return type metadata accessor for GMEligibilityProvider();
}

uint64_t sub_100003520()
{
  return Logger.logObject.getter();
}

uint64_t sub_100003530()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100003540()
{
  return Logger.init(_:)();
}

uint64_t sub_100003550()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100003560()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100003570()
{
  return static WidgetBundleBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100003580()
{
  return _ControlWidgetAdaptor.init(_:)();
}

uint64_t sub_100003590()
{
  return ControlWidgetConfiguration.description(_:)();
}

uint64_t sub_1000035A0()
{
  return ControlWidgetConfiguration.displayName(_:)();
}

uint64_t sub_1000035B0()
{
  return ControlWidgetConfiguration.showsInSystemSpaces()();
}

uint64_t sub_1000035C0()
{
  return ControlWidgetConfiguration.enabled(_:)();
}

uint64_t sub_1000035D0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_1000035E0()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_100003610()
{
  return StaticControlConfiguration.init(kind:content:)();
}

uint64_t sub_100003620()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100003630()
{
  return OS_os_log.init(subsystem:category:)();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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