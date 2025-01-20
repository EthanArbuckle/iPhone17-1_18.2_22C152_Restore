uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  uint64_t v7;

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

uint64_t sub_100002C2C()
{
  if (qword_10000D038[0] != -1) {
    dispatch_once(qword_10000D038, &stru_100008618);
  }
  return qword_10000D030;
}

void sub_100002C70(id a1)
{
  qword_10000D030 = (uint64_t)os_log_create("com.apple.BarcodeScanner.LifeCycle", "BarcodeScannerLifeCycle");

  _objc_release_x1();
}

unint64_t sub_1000031A0()
{
  unint64_t result = qword_10000CEA8;
  if (!qword_10000CEA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CEA8);
  }
  return result;
}

unint64_t sub_1000031F8()
{
  unint64_t result = qword_10000CEB0;
  if (!qword_10000CEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CEB0);
  }
  return result;
}

uint64_t sub_10000324C()
{
  uint64_t v0 = type metadata accessor for LocalizedStringResource.BundleDescription();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Locale();
  __chkstk_darwin();
  type metadata accessor for String.LocalizationValue();
  __chkstk_darwin();
  uint64_t v4 = type metadata accessor for LocalizedStringResource();
  sub_10000528C(v4, qword_10000D940);
  sub_100005254(v4, (uint64_t)qword_10000D940);
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_10000343C(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = type metadata accessor for Logger();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  type metadata accessor for MainActor();
  v1[6] = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100003530, v4, v3);
}

uint64_t sub_100003530()
{
  swift_release();
  static Logger.intent.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "BarcodeScannerIntent performed successfully", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = v0[3];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  id v7 = [self defaultCenter];
  [v7 postNotificationName:BCSDidLaunchFromControlNotification object:0];

  static IntentResult.result<>()();
  swift_task_dealloc();
  v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_10000368C()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_1000036B0()
{
  return IntentParameter.wrappedValue.setter();
}

void (*sub_1000036D4(void *a1))(void *a1)
{
  os_log_type_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100003730;
}

void sub_100003730(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100003780()
{
  unint64_t result = qword_10000CEB8;
  if (!qword_10000CEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CEB8);
  }
  return result;
}

unint64_t sub_1000037D8()
{
  unint64_t result = qword_10000CEC0;
  if (!qword_10000CEC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CEC0);
  }
  return result;
}

uint64_t sub_10000382C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003848(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000047CC(a1, a2, a3, (void (*)(void))sub_100003874);
}

unint64_t sub_100003874()
{
  unint64_t result = qword_10000CEC8;
  if (!qword_10000CEC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CEC8);
  }
  return result;
}

uint64_t sub_1000038C8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000046FC(&qword_10000CE90, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000D940, a1);
}

uint64_t sub_100003900()
{
  return 1;
}

uint64_t sub_10000390C()
{
  return 0;
}

uint64_t sub_10000391C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_1000039B4;
  return sub_10000343C(a1);
}

uint64_t sub_1000039B4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100003AA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100004CFC();
  *a1 = result;
  return result;
}

void *sub_100003AD0()
{
  return &protocol witness table for Never;
}

void *sub_100003ADC()
{
  return &protocol witness table for Never;
}

uint64_t sub_100003AEC(uint64_t a1)
{
  unint64_t v2 = sub_100003874();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100003B28()
{
  uint64_t v0 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100004CB8(&qword_10000CF58);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = type metadata accessor for LocalizedStringResource.BundleDescription();
  uint64_t v4 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Locale();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = type metadata accessor for LocalizedStringResource();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = type metadata accessor for TypeDisplayRepresentation();
  sub_10000528C(v10, qword_10000D958);
  sub_100005254(v10, (uint64_t)qword_10000D958);
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  (*(void (**)(char *, void, void))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v3, 1, 1, v8);
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

unint64_t sub_100003E0C()
{
  uint64_t v0 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100004CB8(&qword_10000CF50);
  __chkstk_darwin(v1 - 8);
  v17 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100004CB8(&qword_10000CF58);
  __chkstk_darwin(v3 - 8);
  v16 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for LocalizedStringResource.BundleDescription();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Locale();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = type metadata accessor for LocalizedStringResource();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  sub_100004CB8(&qword_10000CF60);
  sub_100004CB8(&qword_10000CF68);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100005D10;
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v16, 1, 1, v10);
  uint64_t v13 = type metadata accessor for DisplayRepresentation.Image();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v17, 1, 1, v13);
  DisplayRepresentation.init(title:subtitle:image:)();
  unint64_t result = sub_1000041FC(v12);
  qword_10000D970 = result;
  return result;
}

unint64_t sub_1000041FC(uint64_t a1)
{
  uint64_t v2 = sub_100004CB8(&qword_10000CF68);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004CB8(&qword_10000CF70);
  uint64_t v6 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = v6 + 64;
  uint64_t v10 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v11 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_1000051EC(v10, (uint64_t)v5);
    unint64_t result = sub_100005188();
    if (v13) {
      break;
    }
    unint64_t v14 = result;
    *(void *)(v9 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v15 = v7[7];
    uint64_t v16 = type metadata accessor for DisplayRepresentation();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, v5, v16);
    uint64_t v17 = v7[2];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_11;
    }
    v7[2] = v19;
    v10 += v11;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1000043C8()
{
  unint64_t result = qword_10000CED8;
  if (!qword_10000CED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CED8);
  }
  return result;
}

uint64_t sub_100004428@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100008738, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

uint64_t sub_10000447C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000052F0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000044A8()
{
  unint64_t result = qword_10000CEE0;
  if (!qword_10000CEE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CEE0);
  }
  return result;
}

unint64_t sub_100004500()
{
  unint64_t result = qword_10000CEE8;
  if (!qword_10000CEE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CEE8);
  }
  return result;
}

void *sub_100004554()
{
  return &protocol witness table for String;
}

unint64_t sub_100004564()
{
  unint64_t result = qword_10000CEF0;
  if (!qword_10000CEF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CEF0);
  }
  return result;
}

unint64_t sub_1000045BC()
{
  unint64_t result = qword_10000CEF8;
  if (!qword_10000CEF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CEF8);
  }
  return result;
}

unint64_t sub_100004614()
{
  unint64_t result = qword_10000CF00;
  if (!qword_10000CF00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CF00);
  }
  return result;
}

unint64_t sub_10000466C()
{
  unint64_t result = qword_10000CF08;
  if (!qword_10000CF08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CF08);
  }
  return result;
}

uint64_t sub_1000046C4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000046FC(&qword_10000CE98, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000D958, a1);
}

uint64_t sub_1000046FC@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100005254(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_1000047A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000047CC(a1, a2, a3, (void (*)(void))sub_100004814);
}

uint64_t sub_1000047CC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100004814()
{
  unint64_t result = qword_10000CF10;
  if (!qword_10000CF10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CF10);
  }
  return result;
}

uint64_t sub_100004868(uint64_t a1)
{
  unint64_t v2 = sub_100004814();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000048B8()
{
  unint64_t result = qword_10000CF18;
  if (!qword_10000CF18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CF18);
  }
  return result;
}

unint64_t sub_100004910()
{
  unint64_t result = qword_10000CF20;
  if (!qword_10000CF20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CF20);
  }
  return result;
}

unint64_t sub_100004968()
{
  unint64_t result = qword_10000CF28;
  if (!qword_10000CF28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CF28);
  }
  return result;
}

uint64_t sub_1000049BC()
{
  if (qword_10000CEA0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_10000D970;

  return _swift_bridgeObjectRetain(v0);
}

uint64_t sub_100004A18(uint64_t a1)
{
  unint64_t v2 = sub_10000466C();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100004A64()
{
  return sub_100004C74(&qword_10000CF30, &qword_10000CF38);
}

uint64_t sub_100004AA0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100004AE8(void *a1@<X8>)
{
  *a1 = &off_100008770;
}

uint64_t getEnumTagSinglePayload for LaunchCodeScannerAppEnum(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for LaunchCodeScannerAppEnum(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100004BECLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchCodeScannerAppEnum()
{
  return &type metadata for LaunchCodeScannerAppEnum;
}

ValueMetadata *type metadata accessor for BarcodeScannerIntent()
{
  return &type metadata for BarcodeScannerIntent;
}

uint64_t sub_100004C38()
{
  return sub_100004C74(&qword_10000CF40, &qword_10000CF48);
}

uint64_t sub_100004C74(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100004AA0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100004CB8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004CFC()
{
  type metadata accessor for String.LocalizationValue();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v0 = type metadata accessor for InputConnectionBehavior();
  uint64_t v22 = *(void *)(v0 - 8);
  uint64_t v23 = v0;
  ((void (*)(void))__chkstk_darwin)();
  v21 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004CB8(&qword_10000CF78);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v20 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v19 - v4;
  uint64_t v6 = sub_100004CB8(&qword_10000CF58);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for LocalizedStringResource.BundleDescription();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Locale();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = type metadata accessor for LocalizedStringResource();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  String.LocalizationValue.init(stringLiteral:)();
  uint64_t v19 = sub_100004CB8(&qword_10000CF80);
  static Locale.current.getter();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for LocalizedStringResource.BundleDescription.main(_:), v9);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v8, 1, 1, v14);
  char v24 = 1;
  uint64_t v16 = type metadata accessor for IntentDialog();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v5, 1, 1, v16);
  v17(v20, 1, 1, v16);
  (*(void (**)(char *, void, uint64_t))(v22 + 104))(v21, enum case for InputConnectionBehavior.default(_:), v23);
  sub_100004814();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_10000515C(uint64_t a1)
{
  return a1 & ~(-1 << *(unsigned char *)(v1 + 32));
}

uint64_t sub_100005188()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();

  return sub_10000515C(v0);
}

uint64_t sub_1000051EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004CB8(&qword_10000CF68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005254(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_10000528C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000052F0()
{
  return 0x68636E75616CLL;
}

Swift::Int sub_100005304()
{
  return Hasher._finalize()();
}

uint64_t sub_100005354()
{
  return String.hash(into:)();
}

Swift::Int sub_100005368()
{
  return Hasher._finalize()();
}

uint64_t sub_1000053B4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_1000053E8(void *a1)
{
  uint64_t v1 = [a1 _bcs_privacyPreservingDescription];
  int v2 = 138543362;
  uint64_t v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "BarcodeScanner: Failed to continue user activity %{public}@", (uint8_t *)&v2, 0xCu);
}

uint64_t static AppIntent.description.getter()
{
  return static AppIntent.description.getter();
}

uint64_t static AppIntent.parameterSummary.getter()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t static AppIntent.authenticationPolicy.getter()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t type metadata accessor for IntentDialog()
{
  return type metadata accessor for IntentDialog();
}

uint64_t static IntentResult.result<>()()
{
  return static IntentResult.result<>()();
}

uint64_t IntentParameter.wrappedValue.modify()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t IntentParameter.wrappedValue.getter()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t IntentParameter.wrappedValue.setter()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t type metadata accessor for DisplayRepresentation.Image()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t DisplayRepresentation.init(title:subtitle:image:)()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t type metadata accessor for DisplayRepresentation()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t type metadata accessor for InputConnectionBehavior()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t static PersistentlyIdentifiable.persistentIdentifier.getter()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t TypeDisplayRepresentation.init(name:numericFormat:)()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t type metadata accessor for TypeDisplayRepresentation()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t type metadata accessor for LocalizedStringResource.BundleDescription()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t LocalizedStringResource.init(_:table:locale:bundle:comment:)()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t static Logger.intent.getter()
{
  return static Logger.intent.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
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

id objc_msgSend__bcs_privacyPreservingDescription(void *a1, const char *a2, ...)
{
  return [a1 _bcs_privacyPreservingDescription];
}

id objc_msgSend_applicationDidEnterBackground(void *a1, const char *a2, ...)
{
  return _[a1 applicationDidEnterBackground];
}

id objc_msgSend_applicationWillEnterForeground(void *a1, const char *a2, ...)
{
  return _[a1 applicationWillEnterForeground];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_continueUserActivity_(void *a1, const char *a2, ...)
{
  return [a1 continueUserActivity:];
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyAndVisible];
}

id objc_msgSend_resumeCapturing(void *a1, const char *a2, ...)
{
  return _[a1 resumeCapturing];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 setRootViewController:];
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return [a1 setWindow:];
}

id objc_msgSend_suspendCapturing(void *a1, const char *a2, ...)
{
  return _[a1 suspendCapturing];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}