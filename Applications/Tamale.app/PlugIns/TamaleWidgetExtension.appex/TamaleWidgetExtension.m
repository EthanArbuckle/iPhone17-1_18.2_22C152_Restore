unint64_t sub_1000019DC()
{
  unint64_t result;

  result = qword_1000080B8;
  if (!qword_1000080B8)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080B8);
  }
  return result;
}

unint64_t sub_100001A34()
{
  unint64_t result = qword_1000080C0;
  if (!qword_1000080C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080C0);
  }
  return result;
}

uint64_t sub_100001A88()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100001AA4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100001AF4()
{
  unint64_t result = qword_1000080C8;
  if (!qword_1000080C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080C8);
  }
  return result;
}

uint64_t sub_100001B48()
{
  uint64_t v0 = sub_100003384();
  sub_100001EDC(v0, qword_100008220);
  sub_100001EA4(v0, (uint64_t)qword_100008220);
  return sub_100003374();
}

uint64_t sub_100001BAC@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000080A8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100003384();
  uint64_t v3 = sub_100001EA4(v2, (uint64_t)qword_100008220);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100001C68(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_1000034D4();
  *(void *)(v1 + 24) = sub_1000034C4();
  uint64_t v3 = sub_1000034B4();
  return _swift_task_switch(sub_100001D00, v3, v2);
}

uint64_t sub_100001D00()
{
  swift_release();
  id v1 = [objc_allocWithZone((Class)SiriSimpleActivationSource) init];
  [v1 activateFromSource:53];
  [v1 invalidate];
  sub_100003344();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100001DB0(uint64_t a1)
{
  unint64_t v2 = sub_100001AF4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for VisualIntelligenceCameraLaunch()
{
  return &type metadata for VisualIntelligenceCameraLaunch;
}

unint64_t sub_100001E00()
{
  unint64_t result = qword_1000080D8;
  if (!qword_1000080D8)
  {
    sub_100001E5C(&qword_1000080E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080D8);
  }
  return result;
}

uint64_t sub_100001E5C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100001EA4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100001EDC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100001F40()
{
  uint64_t v0 = sub_1000020E8(&qword_1000080F0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000212C();
  sub_1000033F4();
  sub_100002180();
  sub_1000033E4();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100002068()
{
  unint64_t result = qword_1000080E8;
  if (!qword_1000080E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for Bundle()
{
  return &type metadata for Bundle;
}

uint64_t sub_1000020CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000020E8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000212C()
{
  unint64_t result = qword_1000080F8;
  if (!qword_1000080F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080F8);
  }
  return result;
}

unint64_t sub_100002180()
{
  unint64_t result = qword_100008100;
  if (!qword_100008100)
  {
    sub_100001E5C(&qword_1000080F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008100);
  }
  return result;
}

uint64_t sub_1000021DC()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for WidgetControl()
{
  return &type metadata for WidgetControl;
}

uint64_t sub_100002248()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100002264@<X0>(uint64_t a1@<X8>)
{
  uint64_t v44 = a1;
  sub_1000020E8(&qword_100008108);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v2 = (char *)&v31 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100003384();
  uint64_t v43 = *(void *)(v3 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v42 = (char *)&v31 - v7;
  uint64_t v8 = sub_1000020E8(&qword_100008110);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_1000020E8(&qword_100008118);
  uint64_t v35 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_1000020E8(&qword_100008120);
  uint64_t v37 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_1000020E8(&qword_100008128);
  uint64_t v39 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  v32 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_1000020E8(&qword_100008130);
  uint64_t v34 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  v33 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000020E8(&qword_100008138);
  sub_100002F8C(&qword_100008140, &qword_100008138);
  sub_1000034A4();
  if (qword_1000080B0 != -1) {
    swift_once();
  }
  if (qword_1000080A8 != -1) {
    swift_once();
  }
  sub_100001EA4(v3, (uint64_t)qword_100008220);
  uint64_t v18 = sub_100002F8C(&qword_100008148, &qword_100008110);
  sub_100003414();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_100001AF4();
  sub_1000032F4();
  uint64_t v19 = sub_100003364();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v2, 1, v19) == 1)
  {
    sub_100003128((uint64_t)v2, &qword_100008108);
    v21 = v42;
    sub_100003374();
    uint64_t v22 = v43;
  }
  else
  {
    sub_100003354();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v2, v19);
    v21 = v42;
    uint64_t v22 = v43;
    (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v42, v6, v3);
  }
  uint64_t v45 = v8;
  uint64_t v46 = v18;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v24 = v38;
  sub_100003404();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v21, v3);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v13, v24);
  uint64_t v45 = v24;
  uint64_t v46 = OpaqueTypeConformance2;
  uint64_t v25 = swift_getOpaqueTypeConformance2();
  v26 = v32;
  uint64_t v27 = v40;
  sub_100003424();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v15, v27);
  AFIsInternalInstall();
  uint64_t v45 = v27;
  uint64_t v46 = v25;
  swift_getOpaqueTypeConformance2();
  v28 = v33;
  uint64_t v29 = v41;
  sub_100003434();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v26, v29);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v34 + 32))(v44, v28, v36);
}

uint64_t sub_10000299C()
{
  if (qword_1000080B0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1000020E8(&qword_100008150);
  uint64_t v1 = sub_100002F8C(&qword_100008158, &qword_100008150);
  unint64_t v2 = sub_100001AF4();

  return ControlWidgetButton.init<>(action:label:)(v2, sub_100002A74, 0, v0, &type metadata for VisualIntelligenceCameraLaunch, v1, v2);
}

uint64_t sub_100002A74()
{
  uint64_t v0 = sub_1000020E8(&qword_100008160);
  unint64_t v1 = sub_100002EEC();

  return Label.init(title:icon:)(sub_100002B04, 0, sub_100002C4C, 0, &type metadata for Text, v0, &protocol witness table for Text, v1);
}

uint64_t sub_100002B04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100003384();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000080B0 != -1) {
    swift_once();
  }
  if (qword_1000080A8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100001EA4(v2, (uint64_t)qword_100008220);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t result = sub_100003444();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v8;
  *(unsigned char *)(a1 + 16) = v9 & 1;
  *(void *)(a1 + 24) = v10;
  return result;
}

uint64_t sub_100002C4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1000020E8(&qword_100008178) - 8;
  __chkstk_darwin();
  uint64_t v4 = (uint64_t *)((char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_100003464();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000020E8(&qword_100008180);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003474();
  sub_1000033C4();
  uint64_t v11 = sub_1000033D4();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  uint64_t v12 = sub_100003454();
  swift_release();
  sub_100003128((uint64_t)v10, &qword_100008180);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for Image.Scale.large(_:), v5);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)v4 + *(int *)(v2 + 36), v8, v5);
  *uint64_t v4 = KeyPath;
  uint64_t v14 = sub_1000020E8(&qword_100008160);
  sub_1000030C0((uint64_t)v4, (uint64_t)a1 + *(int *)(v14 + 36));
  *a1 = v12;
  swift_retain();
  sub_100003128((uint64_t)v4, &qword_100008178);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return swift_release();
}

unint64_t sub_100002EEC()
{
  unint64_t result = qword_100008168;
  if (!qword_100008168)
  {
    sub_100001E5C(&qword_100008160);
    sub_100002F8C(&qword_100008170, &qword_100008178);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008168);
  }
  return result;
}

uint64_t sub_100002F8C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100001E5C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100002FD0()
{
  return sub_1000033A4();
}

uint64_t sub_100002FF4(uint64_t a1)
{
  uint64_t v2 = sub_100003464();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1000033B4();
}

uint64_t sub_1000030C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000020E8(&qword_100008178);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100003128(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000020E8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100003184()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000032B0()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1000032E4()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_1000032F4()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100003304()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_100003314()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100003324()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100003344()
{
  return static IntentResult.result<>()();
}

uint64_t sub_100003354()
{
  return IntentDescription.descriptionText.getter();
}

uint64_t sub_100003364()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_100003374()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100003384()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100003394()
{
  return static WidgetBundle.main()();
}

uint64_t sub_1000033A4()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_1000033B4()
{
  return EnvironmentValues.imageScale.setter();
}

uint64_t sub_1000033C4()
{
  return static SymbolRenderingMode.hierarchical.getter();
}

uint64_t sub_1000033D4()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t sub_1000033E4()
{
  return static WidgetBundleBuilder.buildBlock<A>(_:)();
}

uint64_t sub_1000033F4()
{
  return _ControlWidgetAdaptor.init(_:)();
}

uint64_t sub_100003404()
{
  return ControlWidgetConfiguration.description(_:)();
}

uint64_t sub_100003414()
{
  return ControlWidgetConfiguration.displayName(_:)();
}

uint64_t sub_100003424()
{
  return ControlWidgetConfiguration.showsInSystemSpaces()();
}

uint64_t sub_100003434()
{
  return ControlWidgetConfiguration.enabled(_:)();
}

uint64_t sub_100003444()
{
  return Text.init(_:)();
}

uint64_t sub_100003454()
{
  return Image.symbolRenderingMode(_:)();
}

uint64_t sub_100003464()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_100003474()
{
  return Image.init(_:bundle:)();
}

uint64_t sub_1000034A4()
{
  return StaticControlConfiguration.init(kind:content:)();
}

uint64_t sub_1000034B4()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1000034C4()
{
  return static MainActor.shared.getter();
}

uint64_t sub_1000034D4()
{
  return type metadata accessor for MainActor();
}

uint64_t AFIsInternalInstall()
{
  return _AFIsInternalInstall();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}