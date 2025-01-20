uint64_t sub_100004EF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_1000050A0(&qword_10000C168);
  v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000050E4();
  sub_100007008();
  sub_100005138();
  sub_100006FD8();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100005020()
{
  unint64_t result = qword_10000C160;
  if (!qword_10000C160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C160);
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlCenterExtensionBundle()
{
  return &type metadata for ControlCenterExtensionBundle;
}

uint64_t sub_100005084()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000050A0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000050E4()
{
  unint64_t result = qword_10000C170;
  if (!qword_10000C170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C170);
  }
  return result;
}

unint64_t sub_100005138()
{
  unint64_t result = qword_10000C178;
  if (!qword_10000C178)
  {
    sub_100005194(&qword_10000C168);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C178);
  }
  return result;
}

uint64_t sub_100005194(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000051DC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000523C()
{
  unint64_t result = qword_10000C190;
  if (!qword_10000C190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C190);
  }
  return result;
}

unint64_t sub_100005294()
{
  unint64_t result = qword_10000C198;
  if (!qword_10000C198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C198);
  }
  return result;
}

uint64_t sub_1000052E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v41 = sub_100006FA8();
  uint64_t v38 = *(void *)(v41 - 8);
  __chkstk_darwin();
  v2 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000050A0(&qword_10000C2E0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v35 = v3;
  uint64_t v36 = v4;
  __chkstk_darwin();
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_1000050A0(&qword_10000C2E8);
  uint64_t v39 = *(void *)(v37 - 8);
  __chkstk_darwin();
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_1000050A0(&qword_10000C2F0);
  uint64_t v42 = *(void *)(v40 - 8);
  __chkstk_darwin();
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000050A0(&qword_10000C2F8);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v43 = v11;
  uint64_t v44 = v12;
  __chkstk_darwin();
  v34 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = qword_10000C180;
  type metadata accessor for ToggleCellularDataStateProvider();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  swift_bridgeObjectRetain();
  NSString v15 = sub_100007098();
  uint64_t v16 = _CTServerConnectionCreateWithIdentifier();

  *(void *)(v14 + 16) = v16;
  uint64_t v48 = v14;
  sub_1000050A0(&qword_10000C300);
  uint64_t v17 = sub_100005194(&qword_10000C308);
  uint64_t v18 = sub_100005194(&qword_10000C310);
  uint64_t v19 = sub_100006CDC(&qword_10000C318, &qword_10000C310);
  uint64_t v46 = v18;
  uint64_t v47 = v19;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v46 = v17;
  uint64_t v47 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_100006C88();
  sub_100007088();
  sub_100006F98();
  uint64_t v21 = sub_100006CDC(&qword_10000C328, &qword_10000C2E0);
  uint64_t v22 = v35;
  sub_100007028();
  v23 = *(void (**)(char *, uint64_t))(v38 + 8);
  uint64_t v24 = v41;
  v23(v2, v41);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v22);
  sub_100006F98();
  uint64_t v46 = v22;
  uint64_t v47 = v21;
  uint64_t v25 = swift_getOpaqueTypeConformance2();
  uint64_t v26 = v37;
  sub_100007018();
  v23(v2, v24);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v8, v26);
  uint64_t v46 = v26;
  uint64_t v47 = v25;
  uint64_t v27 = swift_getOpaqueTypeConformance2();
  v28 = v34;
  uint64_t v29 = v40;
  sub_100007038();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v10, v29);
  NSString v30 = sub_100007098();
  MGGetBoolAnswer();

  uint64_t v46 = v29;
  uint64_t v47 = v27;
  swift_getOpaqueTypeConformance2();
  uint64_t v31 = v43;
  sub_100007048();
  return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v28, v31);
}

uint64_t sub_100005938@<X0>(uint64_t a1@<X8>)
{
  uint64_t v19 = a1;
  uint64_t v1 = sub_1000050A0(&qword_10000C310);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000050A0(&qword_10000C308);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  uint64_t v18 = v6;
  __chkstk_darwin();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000050A0(&qword_10000C300);
  uint64_t v9 = *(void *)(v16 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100006840();
  uint64_t v21 = v12;
  sub_1000050A0(&qword_10000C330);
  sub_100006CDC(&qword_10000C338, &qword_10000C330);
  sub_100006D20();
  sub_100007078();
  sub_100007058();
  uint64_t v13 = sub_100006CDC(&qword_10000C318, &qword_10000C310);
  sub_100006FE8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v20 = v1;
  uint64_t v21 = v13;
  swift_getOpaqueTypeConformance2();
  uint64_t v14 = v17;
  sub_100006FF8();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v14);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v19, v11, v16);
}

uint64_t sub_100005C68()
{
  uint64_t v0 = sub_100006FC8();

  return Label<>.init(_:systemImage:)(v0);
}

uint64_t sub_100005CE8()
{
  if (*(void *)(v0 + 16))
  {
    _CTServerConnectionGetCellularDataIsEnabled();
    if (sub_100005D88()) {
      return 256;
    }
    else {
      return 0;
    }
  }
  else
  {
    return 0;
  }
}

uint64_t sub_100005D88()
{
  if (*(void *)(v0 + 16)) {
    _CTServerConnectionGetCellularDataSettings();
  }
  return 1;
}

uint64_t sub_100005E68()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t sub_100005E78@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100005CE8();
  *a1 = result & 1;
  a1[1] = (unsigned __int16)result > 0xFFu;
  return result;
}

uint64_t sub_100005EB8(unsigned char *a1)
{
  unsigned __int16 v3 = sub_100005CE8();
  *a1 = v3 & 1;
  a1[1] = v3 > 0xFFu;
  uint64_t v4 = *(uint64_t (**)(void))(v1 + 8);
  return sub_100006834(v4);
}

uint64_t sub_100005F58()
{
  uint64_t v0 = sub_100006FA8();
  sub_100006BF8(v0, qword_10000C760);
  sub_100006BC0(v0, (uint64_t)qword_10000C760);
  return sub_100006F98();
}

uint64_t sub_100005FC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return _swift_task_switch(sub_100005FE8, 0, 0);
}

uint64_t sub_100005FE8()
{
  if (*(void *)(v0 + 32))
  {
    sub_100006F58();
    _CTServerConnectionSetCellularDataIsEnabled();
    sub_1000050A0(&qword_10000C2D8);
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_100007370;
    sub_1000070C8(28);
    swift_bridgeObjectRelease();
    sub_100006F58();
    if (*(unsigned char *)(v0 + 40)) {
      v2._countAndFlagsBits = 1702195828;
    }
    else {
      v2._countAndFlagsBits = 0x65736C6166;
    }
    if (*(unsigned char *)(v0 + 40)) {
      unsigned __int16 v3 = (void *)0xE400000000000000;
    }
    else {
      unsigned __int16 v3 = (void *)0xE500000000000000;
    }
    v2._object = v3;
    sub_1000070A8(v2);
    swift_bridgeObjectRelease();
    *(void *)(v1 + 56) = &type metadata for String;
    *(void *)(v1 + 32) = 0xD00000000000001ALL;
    *(void *)(v1 + 40) = 0x8000000100007D30;
    sub_1000070D8();
    swift_bridgeObjectRelease();
  }
  sub_100006F38();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100006164@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006F58();
  *a1 = v3;
  return result;
}

uint64_t sub_1000061A0()
{
  return sub_100006F68();
}

void (*sub_1000061D8(void *a1))(void *a1)
{
  Swift::String v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100006F48();
  return sub_100006234;
}

void sub_100006234(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100006284()
{
  unint64_t result = qword_10000C1A0;
  if (!qword_10000C1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1A0);
  }
  return result;
}

unint64_t sub_1000062DC()
{
  unint64_t result = qword_10000C1A8;
  if (!qword_10000C1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1A8);
  }
  return result;
}

uint64_t sub_100006330()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000634C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000639C@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C158 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006FA8();
  uint64_t v3 = sub_100006BC0(v2, (uint64_t)qword_10000C760);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000644C()
{
  return 0;
}

uint64_t sub_10000645C(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[3] = v5;
  v6[4] = v4;
  v6[1] = sub_100006514;
  v6[2] = a1;
  return _swift_task_switch(sub_100005FE8, 0, 0);
}

uint64_t sub_100006514()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006608@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006840();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100006630(uint64_t a1)
{
  unint64_t v2 = sub_10000523C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t type metadata accessor for ToggleCellularDataStateProvider()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for ToggleCellularDataIntent(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for ToggleCellularDataIntent()
{
  return swift_release();
}

void *assignWithCopy for ToggleCellularDataIntent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  return a1;
}

__n128 initializeWithTake for ToggleCellularDataIntent(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for ToggleCellularDataIntent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for ToggleCellularDataIntent(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ToggleCellularDataIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ToggleCellularDataIntent()
{
  return &type metadata for ToggleCellularDataIntent;
}

uint64_t sub_1000067F8()
{
  return sub_100006CDC(&qword_10000C298, (uint64_t *)&unk_10000C2A0);
}

uint64_t sub_100006834(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100006840()
{
  uint64_t v0 = sub_100006F88();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = &v17[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000050A0(&qword_10000C2B0);
  __chkstk_darwin();
  uint64_t v5 = &v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000050A0(&qword_10000C2B8);
  __chkstk_darwin();
  uint64_t v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000050A0(&qword_10000C2C0);
  __chkstk_darwin();
  uint64_t v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_100006FA8();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  sub_1000050A0(&qword_10000C2C8);
  sub_100006F98();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  v17[15] = 2;
  uint64_t v12 = sub_1000070B8();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  uint64_t v13 = sub_100006F28();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v5, 1, 1, v13);
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  uint64_t v14 = sub_100006F78();
  NSString v15 = sub_100007098();
  _CTServerConnectionCreateWithIdentifier();

  return v14;
}

uint64_t sub_100006BC0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100006BF8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

ValueMetadata *type metadata accessor for CellularDataToggle()
{
  return &type metadata for CellularDataToggle;
}

uint64_t sub_100006C6C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100006C88()
{
  unint64_t result = qword_10000C320;
  if (!qword_10000C320)
  {
    type metadata accessor for ToggleCellularDataStateProvider();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C320);
  }
  return result;
}

uint64_t sub_100006CDC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005194(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100006D20()
{
  unint64_t result = qword_10000C340;
  if (!qword_10000C340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C340);
  }
  return result;
}

uint64_t sub_100006D74()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006EA4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100006ED8()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100006EE8()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100006EF8()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100006F08()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100006F28()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100006F38()
{
  return static IntentResult.result<>()();
}

uint64_t sub_100006F48()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100006F58()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006F68()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100006F78()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_100006F88()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100006F98()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100006FA8()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006FB8()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100006FC8()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100006FD8()
{
  return static WidgetBundleBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100006FE8()
{
  return ControlWidgetTemplate.tint(_:)();
}

uint64_t sub_100006FF8()
{
  return ControlWidgetTemplate.disabled(_:)();
}

uint64_t sub_100007008()
{
  return _ControlWidgetAdaptor.init(_:)();
}

uint64_t sub_100007018()
{
  return ControlWidgetConfiguration.description(_:)();
}

uint64_t sub_100007028()
{
  return ControlWidgetConfiguration.displayName(_:)();
}

uint64_t sub_100007038()
{
  return ControlWidgetConfiguration.showsInSystemSpaces()();
}

uint64_t sub_100007048()
{
  return ControlWidgetConfiguration.enabled(_:)();
}

uint64_t sub_100007058()
{
  return static Color.green.getter();
}

uint64_t sub_100007078()
{
  return ControlWidgetToggle.init<>(isOn:action:label:)();
}

uint64_t sub_100007088()
{
  return StaticControlConfiguration.init<A>(kind:provider:content:)();
}

NSString sub_100007098()
{
  return String._bridgeToObjectiveC()();
}

void sub_1000070A8(Swift::String a1)
{
}

uint64_t sub_1000070B8()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

void sub_1000070C8(Swift::Int a1)
{
}

uint64_t sub_1000070D8()
{
  return print(_:separator:terminator:)();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return __CTServerConnectionCreateWithIdentifier();
}

uint64_t _CTServerConnectionGetCellularDataIsEnabled()
{
  return __CTServerConnectionGetCellularDataIsEnabled();
}

uint64_t _CTServerConnectionGetCellularDataSettings()
{
  return __CTServerConnectionGetCellularDataSettings();
}

uint64_t _CTServerConnectionSetCellularDataIsEnabled()
{
  return __CTServerConnectionSetCellularDataIsEnabled();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}