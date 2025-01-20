id sub_100005038()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ChargeAppDelegate();
  return [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for ChargeAppDelegate();
  static CommandLine.unsafeArgv.getter();
  static CommandLine.argc.getter();
  static CommandLine.argc.getter();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  v4 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v4) = UIApplicationMain(_:_:_:_:)();
  swift_bridgeObjectRelease();
  exit((int)v4);
}

uint64_t type metadata accessor for ChargeAppDelegate()
{
  return self;
}

uint64_t variable initialization expression of ConfigurationIntentResponse.code()
{
  return 0;
}

uint64_t initializeBufferWithCopyOfBuffer for ChargeBarChart(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 initializeWithTake for ChargeView(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100005168(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100005188(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
}

__n128 initializeWithTake for ChargeChart(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000051D4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000051F4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t sub_100005230(uint64_t a1, uint64_t a2)
{
  return sub_1000053B0(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000525C(uint64_t a1, uint64_t a2)
{
  return sub_1000053B0(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100005274(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_1000052EC(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_10000536C@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000053B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1000053F4()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100005448()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000054BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000054EC()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

uint64_t sub_100005590(uint64_t a1)
{
  uint64_t v2 = sub_100005694(&qword_10002A930, type metadata accessor for LaunchOptionsKey);
  uint64_t v3 = sub_100005694(&qword_10002A958, type metadata accessor for LaunchOptionsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000564C()
{
  return sub_100005694(&qword_10002A940, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_100005694(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000056DC()
{
  return sub_100005694(&qword_10002A948, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_100005724()
{
  return sub_100005694(&qword_10002A950, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_10000576C@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000057B4(uint64_t a1)
{
  uint64_t v2 = sub_100005694(&qword_10002A980, type metadata accessor for Key);
  uint64_t v3 = sub_100005694(&qword_10002A988, type metadata accessor for Key);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void type metadata accessor for Key(uint64_t a1)
{
}

void sub_100005884(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000058CC()
{
  return sub_100005694(&qword_10002A968, type metadata accessor for Key);
}

uint64_t sub_100005914()
{
  return sub_100005694(&qword_10002A970, type metadata accessor for Key);
}

uint64_t sub_10000595C()
{
  return sub_100005694(&qword_10002A978, type metadata accessor for Key);
}

void *initializeBufferWithCopyOfBuffer for ChargeChart(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = v3;
  return a1;
}

void destroy for ChargeChart(uint64_t a1)
{
}

void *assignWithCopy for ChargeChart(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = (void *)a2[1];
  id v4 = (void *)a1[1];
  a1[1] = v3;
  id v5 = v3;

  return a1;
}

void *assignWithTake for ChargeChart(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  id v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for ChargeChart(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ChargeChart(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ChargeChart()
{
  return &type metadata for ChargeChart;
}

uint64_t sub_100005AEC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005B08@<X0>(char *a1@<X1>, uint64_t a2@<X8>)
{
  id v4 = &a1[OBJC_IVAR____TtC6Charge11ChargeModel__carObservable];
  swift_beginAccess();
  id v5 = (void *)*((void *)v4 + 1);
  v6 = a1;
  id v7 = v5;
  v8 = (void *)dispatch thunk of CAFCarObservable.highVoltageBattery.getter();

  if (!v8) {
    goto LABEL_8;
  }
  id v9 = [v8 batteryLevel];

  if (!v9)
  {
LABEL_9:
    type metadata accessor for LayoutConfiguration();
    sub_100006064((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
    EnvironmentObject.init()();
    sub_100005F78();
    sub_100005FCC();
    uint64_t result = _ConditionalContent<>.init(storage:)();
    long long v26 = v27;
    long long v24 = v28;
    long long v25 = v29;
    char v22 = v30;
    goto LABEL_10;
  }
  v10 = (void *)*((void *)v4 + 1);
  v6 = v6;
  id v11 = v10;
  v12 = (void *)dispatch thunk of CAFCarObservable.charging.getter();

  if (!v12)
  {

LABEL_8:
    goto LABEL_9;
  }
  id v13 = [v12 chargingTime];

  if (!v13)
  {
    v6 = (char *)v9;
    goto LABEL_8;
  }
  sub_100009C7C(0, &qword_10002AA08);
  sub_100006020(&qword_10002AA10, &qword_10002AA08);
  CAFObserved<>.observable.getter();
  sub_100009C7C(0, &qword_10002AA18);
  sub_100006020(&qword_10002AA20, &qword_10002AA18);
  CAFObserved<>.observable.getter();
  type metadata accessor for LayoutConfiguration();
  sub_100006064((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
  EnvironmentObject.init()();
  type metadata accessor for CAFBatteryLevelObservable();
  sub_100006064(&qword_10002AA28, (void (*)(uint64_t))&type metadata accessor for CAFBatteryLevelObservable);
  ObservedObject.init(wrappedValue:)();
  v15 = v14;
  type metadata accessor for CAFChargingTimeObservable();
  sub_100006064(&qword_10002AA30, (void (*)(uint64_t))&type metadata accessor for CAFChargingTimeObservable);
  ObservedObject.init(wrappedValue:)();
  v17 = v16;
  sub_100005F78();
  sub_100005FCC();
  id v18 = v15;
  id v19 = v17;
  swift_retain_n();
  id v20 = v18;
  id v21 = v19;
  _ConditionalContent<>.init(storage:)();
  swift_release();

  char v22 = v30;
  uint64_t result = swift_release();
  long long v25 = v29;
  long long v24 = v28;
  long long v26 = v27;
LABEL_10:
  *(_OWORD *)a2 = v26;
  *(_OWORD *)(a2 + 16) = v24;
  *(_OWORD *)(a2 + 32) = v25;
  *(unsigned char *)(a2 + 48) = v22;
  return result;
}

uint64_t sub_100005F54()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100005F70@<X0>(uint64_t a1@<X8>)
{
  return sub_100005B08(*(char **)(v1 + 8), a1);
}

unint64_t sub_100005F78()
{
  unint64_t result = qword_10002A9F8;
  if (!qword_10002A9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002A9F8);
  }
  return result;
}

unint64_t sub_100005FCC()
{
  unint64_t result = qword_10002AA00;
  if (!qword_10002AA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AA00);
  }
  return result;
}

uint64_t sub_100006020(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100009C7C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006064(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t destroy for ChargeBarChart(uint64_t a1)
{
  return swift_release();
}

void *initializeWithCopy for ChargeBarChart(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  id v6 = v3;
  id v7 = v4;
  swift_retain();
  return a1;
}

void *assignWithCopy for ChargeBarChart(void *a1, void *a2)
{
  *a1 = *a2;
  id v4 = (void *)a2[1];
  uint64_t v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  a1[2] = a2[2];
  id v7 = (void *)a2[3];
  v8 = (void *)a1[3];
  a1[3] = v7;
  id v9 = v7;

  a1[4] = a2[4];
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  return a1;
}

__n128 initializeWithTake for ChargeBarChart(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ChargeBarChart(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for ChargeBarChart(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ChargeBarChart(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ChargeBarChart()
{
  return &type metadata for ChargeBarChart;
}

unint64_t sub_1000062E8()
{
  unint64_t result = qword_10002AA38;
  if (!qword_10002AA38)
  {
    sub_100006364(&qword_10002AA40);
    sub_100005F78();
    sub_100005FCC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AA38);
  }
  return result;
}

uint64_t sub_100006364(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000063AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000063C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v104 = a1;
  uint64_t v102 = a2;
  uint64_t v3 = sub_100009768(&qword_10002AA50);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v91 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100009768(&qword_10002AA58);
  uint64_t v103 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v91 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = sub_100009768(&qword_10002AA60);
  uint64_t v107 = *(void *)(v105 - 8);
  __chkstk_darwin(v105);
  v10 = (char *)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_100009768(&qword_10002AA68);
  uint64_t v106 = *(void *)(v108 - 8);
  __chkstk_darwin(v108);
  v101 = (char *)&v91 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100009768(&qword_10002AA70);
  uint64_t v13 = v12 - 8;
  uint64_t v14 = __chkstk_darwin(v12);
  v16 = (char *)&v91 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v110 = (uint64_t)&v91 - v17;
  uint64_t v111 = a1;
  sub_100009768(&qword_10002AA78);
  sub_1000097B4();
  Chart.init(content:)();
  long long v156 = xmmword_10001DFC0;
  uint64_t v18 = type metadata accessor for ScaleType();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v5, 1, 1, v18);
  uint64_t v19 = sub_100009768(&qword_10002AA98);
  uint64_t v20 = sub_10000A08C(&qword_10002AAA0, &qword_10002AA58);
  unint64_t v21 = sub_100009930();
  View.chartYScale<A>(domain:type:)();
  sub_100009BB4((uint64_t)v5, &qword_10002AA50);
  (*(void (**)(char *, uint64_t))(v103 + 8))(v8, v6);
  sub_100009768(&qword_10002AAB0);
  uint64_t v132 = v6;
  uint64_t v133 = v19;
  uint64_t v134 = v20;
  unint64_t v135 = v21;
  swift_getOpaqueTypeConformance2();
  sub_10000A08C(&qword_10002AAB8, &qword_10002AAB0);
  char v22 = v101;
  uint64_t v23 = v105;
  View.chartYAxis<A>(content:)();
  (*(void (**)(char *, uint64_t))(v107 + 8))(v10, v23);
  LOBYTE(v8) = static Edge.Set.all.getter();
  EdgeInsets.init(_all:)();
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v32 = v106;
  uint64_t v33 = v108;
  (*(void (**)(char *, char *, uint64_t))(v106 + 16))(v16, v22, v108);
  v34 = &v16[*(int *)(v13 + 44)];
  char *v34 = (char)v8;
  *((void *)v34 + 1) = v25;
  *((void *)v34 + 2) = v27;
  *((void *)v34 + 3) = v29;
  *((void *)v34 + 4) = v31;
  v34[40] = 0;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v22, v33);
  v109 = v16;
  sub_10000999C((uint64_t)v16, v110);
  uint64_t v35 = v104;
  v36 = (void *)sub_100006D48();
  id v37 = [v36 string];

  uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v40 = v39;

  uint64_t v132 = v38;
  uint64_t v133 = v40;
  sub_100009A04();
  uint64_t v41 = Text.init<A>(_:)();
  uint64_t v44 = *(void *)(v35 + 32);
  if (v44)
  {
    uint64_t v45 = v41;
    uint64_t v46 = v42;
    char v47 = v43;
    if (*(unsigned char *)(v44 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      if (*(unsigned char *)(v44 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain();
        uint64_t v48 = sub_10000A254();
        uint64_t v49 = type metadata accessor for ClusterMetrics();
        uint64_t v50 = v49;
        v51 = &off_100025610;
      }
      else
      {
        swift_retain();
        uint64_t v48 = sub_10000A288();
        uint64_t v49 = type metadata accessor for WidgetMetrics();
        uint64_t v50 = v49;
        v51 = &off_1000255B0;
      }
    }
    else
    {
      swift_retain();
      uint64_t v48 = sub_10000A220();
      uint64_t v49 = type metadata accessor for ConsoleMetrics();
      uint64_t v50 = v49;
      v51 = &off_100025670;
    }
    unint64_t v135 = v49;
    v136 = v51;
    swift_release();
    uint64_t v132 = v48;
    sub_100009A58(&v132, v50);
    ((void (__cdecl *)())v51[3])();
    v101 = (char *)Text.font(_:)();
    uint64_t v105 = v53;
    uint64_t v106 = v52;
    char v55 = v54;
    sub_100009A9C(v45, v46, v47 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    sub_100009AAC((uint64_t)&v132);
    LODWORD(v104) = static Edge.Set.all.getter();
    EdgeInsets.init(_all:)();
    uint64_t v57 = v56;
    uint64_t v59 = v58;
    uint64_t v61 = v60;
    uint64_t v63 = v62;
    static Alignment.center.getter();
    _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
    uint64_t v103 = v157;
    uint64_t v96 = v161;
    uint64_t v97 = v159;
    uint64_t v95 = v163;
    uint64_t v93 = v167;
    uint64_t v94 = v165;
    uint64_t v107 = v170;
    uint64_t v108 = v169;
    unsigned __int8 v119 = v55 & 1;
    unsigned __int8 v118 = 0;
    unsigned __int8 v117 = v158;
    unsigned __int8 v116 = v160;
    unsigned __int8 v115 = v162;
    char v114 = v164;
    char v113 = v166;
    char v112 = v168;
    uint64_t v64 = (uint64_t)v109;
    sub_100009AFC(v110, (uint64_t)v109);
    unsigned __int8 v65 = v119;
    unsigned __int8 v66 = v118;
    int v91 = v119;
    int v92 = v118;
    unsigned __int8 v67 = v117;
    unsigned __int8 v68 = v116;
    int v98 = v117;
    int v99 = v116;
    unsigned __int8 v69 = v115;
    int v100 = v115;
    char v70 = v114;
    char v71 = v113;
    char v72 = v112;
    uint64_t v73 = v64;
    uint64_t v74 = v102;
    sub_100009AFC(v73, v102);
    v75 = (_OWORD *)(v74 + *(int *)(sub_100009768(&qword_10002AAC8) + 48));
    v76 = v101;
    *(void *)&long long v120 = v101;
    *((void *)&v120 + 1) = v106;
    LOBYTE(v121) = v65;
    *((void *)&v121 + 1) = v105;
    LOBYTE(v122) = v104;
    *((void *)&v122 + 1) = v57;
    *(void *)&long long v123 = v59;
    *((void *)&v123 + 1) = v61;
    *(void *)&long long v124 = v63;
    BYTE8(v124) = v66;
    *(void *)&long long v125 = v103;
    BYTE8(v125) = v67;
    uint64_t v78 = v96;
    uint64_t v77 = v97;
    *(void *)&long long v126 = v97;
    BYTE8(v126) = v68;
    *(void *)&long long v127 = v96;
    BYTE8(v127) = v69;
    uint64_t v79 = v94;
    uint64_t v80 = v95;
    *(void *)&long long v128 = v95;
    BYTE8(v128) = v70;
    *(void *)&long long v129 = v94;
    BYTE8(v129) = v71;
    uint64_t v81 = v93;
    *(void *)&long long v130 = v93;
    BYTE8(v130) = v72;
    *(void *)&long long v131 = v108;
    *((void *)&v131 + 1) = v107;
    long long v82 = v125;
    long long v83 = v127;
    long long v84 = v128;
    v75[6] = v126;
    v75[7] = v83;
    long long v85 = v123;
    v75[4] = v124;
    v75[5] = v82;
    long long v86 = v120;
    long long v87 = v121;
    v75[2] = v122;
    v75[3] = v85;
    _OWORD *v75 = v86;
    v75[1] = v87;
    long long v88 = v129;
    long long v89 = v131;
    v75[10] = v130;
    v75[11] = v89;
    v75[8] = v84;
    v75[9] = v88;
    sub_100009B64((uint64_t)&v120);
    sub_100009BB4(v110, &qword_10002AA70);
    uint64_t v132 = (uint64_t)v76;
    uint64_t v133 = v106;
    LOBYTE(v134) = v91;
    unint64_t v135 = v105;
    LOBYTE(v136) = v104;
    uint64_t v137 = v57;
    uint64_t v138 = v59;
    uint64_t v139 = v61;
    uint64_t v140 = v63;
    char v141 = v92;
    uint64_t v142 = v103;
    char v143 = v98;
    uint64_t v144 = v77;
    char v145 = v99;
    uint64_t v146 = v78;
    char v147 = v100;
    uint64_t v148 = v80;
    char v149 = v70;
    uint64_t v150 = v79;
    char v151 = v71;
    uint64_t v152 = v81;
    char v153 = v72;
    uint64_t v154 = v108;
    uint64_t v155 = v107;
    sub_100009C10((uint64_t)&v132);
    return sub_100009BB4((uint64_t)v109, &qword_10002AA70);
  }
  else
  {
    type metadata accessor for LayoutConfiguration();
    sub_100006064((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_100006D48()
{
  uint64_t v1 = (long long *)v0;
  uint64_t v2 = sub_100009768(&qword_10002AAD0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_100009768(&qword_10002AAD8);
  uint64_t v6 = *(void *)(v80 - 8);
  __chkstk_darwin();
  v8 = (char *)&v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [objc_allocWithZone((Class)NSMutableAttributedString) init];
  sub_100009768(&qword_10002AAE0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001DFD0;
  NSAttributedStringKey v11 = NSFontAttributeName;
  *(void *)(inited + 32) = NSFontAttributeName;
  uint64_t v12 = *(void *)(v0 + 32);
  if (v12)
  {
    uint64_t v13 = inited;
    int v14 = *(unsigned __int8 *)(v12 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode);
    uint64_t v76 = v6;
    uint64_t v74 = v2;
    uint64_t v73 = v3;
    char v72 = v5;
    if (v14)
    {
      if (v14 == 1)
      {
        uint64_t v15 = NSFontAttributeName;
        swift_retain();
        uint64_t v16 = sub_10000A254();
        uint64_t v17 = type metadata accessor for ClusterMetrics();
        uint64_t v18 = v17;
        uint64_t v19 = &off_100025610;
      }
      else
      {
        unint64_t v21 = NSFontAttributeName;
        swift_retain();
        uint64_t v16 = sub_10000A288();
        uint64_t v17 = type metadata accessor for WidgetMetrics();
        uint64_t v18 = v17;
        uint64_t v19 = &off_1000255B0;
      }
    }
    else
    {
      uint64_t v20 = NSFontAttributeName;
      swift_retain();
      uint64_t v16 = sub_10000A220();
      uint64_t v17 = type metadata accessor for ConsoleMetrics();
      uint64_t v18 = v17;
      uint64_t v19 = &off_100025670;
    }
    uint64_t v82 = v17;
    long long v83 = v19;
    swift_release();
    *(void *)&long long v81 = v16;
    sub_100009A58(&v81, v18);
    *(void *)(v13 + 40) = ((uint64_t (__cdecl *)())v19[3])();
    sub_100009AAC((uint64_t)&v81);
    char v22 = (void *)sub_100009258(v13);
    char v71 = v1;
    long long v81 = v1[1];
    id v23 = *((id *)&v81 + 1);
    dispatch thunk of CAFChargingTimeObservable.remainingTime.getter();
    sub_100009C50((uint64_t)&v81);
    id v77 = self;
    id v24 = [v77 mainBundle];
    v85._object = (void *)0xE000000000000000;
    v25._countAndFlagsBits = 0x4D45525F454D4954;
    v25._object = (void *)0xEE00474E494E4941;
    v26.value._countAndFlagsBits = 0x656772616843;
    v26.value._object = (void *)0xE600000000000000;
    v27._countAndFlagsBits = 0;
    v27._object = (void *)0xE000000000000000;
    v85._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v25, v26, (NSBundle)v24, v27, v85);

    String.init(format:_:)();
    swift_bridgeObjectRelease();
    sub_100009364((uint64_t)v22);
    id v28 = objc_allocWithZone((Class)NSAttributedString);
    NSString v29 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    uint64_t v31 = v30;
    uint64_t v78 = sub_100006064(&qword_10002A980, type metadata accessor for Key);
    uint64_t v79 = v31;
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v33 = [v28 initWithString:v29 attributes:isa];

    [v9 appendAttributedString:v33];
    NSAttributedStringKey v11 = (NSAttributedStringKey)&_s10CAFCombine11CAFObservedPAASo18CAFObservableCacheRz10ObservableAC_8ObservedQZRszrlE10observableAeCQzvg_ptr;
    id v34 = objc_allocWithZone((Class)NSAttributedString);
    NSString v35 = String._bridgeToObjectiveC()();
    id v36 = [v34 initWithString:v35];

    [v9 appendAttributedString:v36];
    id v37 = [objc_allocWithZone((Class)NSDateComponentsFormatter) init];
    [v37 setUnitsStyle:1];
    v75 = v8;
    Measurement.value.getter();
    id v70 = v37;
    id v38 = [v37 stringFromTimeInterval:];
    if (v38)
    {
      uint64_t v39 = v38;
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      sub_100009364((uint64_t)v22);
      id v40 = objc_allocWithZone((Class)NSAttributedString);
      NSString v41 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      Class v42 = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      id v43 = [v40 initWithString:v41 attributes:v42];

      [v9 appendAttributedString:v43];
      id v44 = objc_allocWithZone((Class)NSAttributedString);
      NSString v45 = String._bridgeToObjectiveC()();
      id v46 = [v44 initWithString:v45];

      [v9 appendAttributedString:v46];
      id v47 = [v77 mainBundle];
      v86._object = (void *)0xE000000000000000;
      v48._countAndFlagsBits = 0x5F59524554544142;
      v48._object = (void *)0xED00004C4556454CLL;
      v49.value._countAndFlagsBits = 0x656772616843;
      v49.value._object = (void *)0xE600000000000000;
      v50._countAndFlagsBits = 0;
      v50._object = (void *)0xE000000000000000;
      v86._countAndFlagsBits = 0;
      NSLocalizedString(_:tableName:bundle:value:comment:)(v48, v49, (NSBundle)v47, v50, v86);

      String.init(format:_:)();
      swift_bridgeObjectRelease();
      id v77 = v22;
      sub_100009364((uint64_t)v22);
      NSAttributedStringKey v11 = (NSAttributedStringKey)objc_allocWithZone((Class)NSAttributedString);
      NSString v51 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      Class v52 = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      uint64_t v53 = [(NSString *)v11 initWithString:v51 attributes:v52];

      [v9 appendAttributedString:v53];
      id v54 = objc_allocWithZone((Class)NSAttributedString);
      NSString v55 = String._bridgeToObjectiveC()();
      id v56 = [v54 initWithString:v55];

      [v9 appendAttributedString:v56];
      id v57 = [objc_allocWithZone((Class)NSMeasurementFormatter) init];
      id v58 = [v57 numberFormatter];
      if (v58)
      {
        uint64_t v59 = v58;
        long long v84 = *v71;
        uint64_t v60 = (void *)*((void *)&v84 + 1);
        [v58 setMaximumFractionDigits:1];

        [v57 setUnitOptions:1];
        id v61 = v60;
        uint64_t v62 = v72;
        dispatch thunk of CAFBatteryLevelObservable.batteryLevel.getter();
        sub_100009C50((uint64_t)&v84);
        sub_100009C7C(0, &qword_10002AAE8);
        NSMeasurementFormatter.string<A>(from:)();

        (*(void (**)(char *, uint64_t))(v73 + 8))(v62, v74);
        sub_100009364((uint64_t)v77);
        swift_bridgeObjectRelease();
        id v63 = objc_allocWithZone((Class)NSAttributedString);
        NSString v64 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        Class v65 = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        id v66 = [v63 initWithString:v64 attributes:v65];

        [v9 appendAttributedString:v66];
        (*(void (**)(char *, uint64_t))(v76 + 8))(v75, v80);
        return (uint64_t)v9;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  type metadata accessor for LayoutConfiguration();
  sub_100006064((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
  unsigned __int8 v68 = v11;
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

uint64_t sub_1000076DC@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v119 = a2;
  uint64_t v118 = sub_100009768(&qword_10002AB30);
  __chkstk_darwin(v118);
  unsigned __int8 v117 = (char *)&v95 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = type metadata accessor for AnnotationPosition();
  uint64_t v100 = *(void *)(v116 - 8);
  __chkstk_darwin(v116);
  int v99 = (char *)&v95 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = type metadata accessor for RuleMark();
  uint64_t v96 = *(void *)(v97 - 8);
  __chkstk_darwin(v97);
  long long v122 = (char *)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_100009768(&qword_10002AA90);
  uint64_t v98 = *(void *)(v108 - 8);
  __chkstk_darwin(v108);
  uint64_t v106 = (char *)&v95 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = sub_100009768(&qword_10002AA88);
  uint64_t v110 = *(void *)(v111 - 8);
  __chkstk_darwin(v111);
  v109 = (char *)&v95 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = sub_100009768(&qword_10002AB38);
  uint64_t v114 = *(void *)(v115 - 8);
  uint64_t v8 = __chkstk_darwin(v115);
  char v112 = (char *)&v95 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v107 = (char *)&v95 - v11;
  __chkstk_darwin(v10);
  long long v125 = (char *)&v95 - v12;
  uint64_t v13 = sub_100009768(&qword_10002AAD0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  long long v120 = (char *)&v95 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  long long v124 = (char *)&v95 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  unint64_t v21 = (char *)&v95 - v20;
  __chkstk_darwin(v19);
  id v23 = (char *)&v95 - v22;
  uint64_t v24 = sub_100009768(&qword_10002AB40);
  uint64_t v25 = __chkstk_darwin(v24 - 8);
  uint64_t v105 = (char *)&v95 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  uint64_t v104 = type metadata accessor for BarMark();
  uint64_t v103 = *(void (***)(char *, uint64_t))(v104 - 8);
  __chkstk_darwin(v104);
  id v28 = (char *)&v95 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = sub_100009768(&qword_10002AB48);
  long long v128 = *(void **)(v123 - 8);
  uint64_t v29 = __chkstk_darwin(v123);
  long long v121 = (char *)&v95 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __chkstk_darwin(v29);
  uint64_t v102 = (char *)&v95 - v32;
  __chkstk_darwin(v31);
  long long v127 = (char *)&v95 - v33;
  id v34 = [self mainBundle];
  v136._object = (void *)0xE000000000000000;
  v35._countAndFlagsBits = 0x5F59524554544142;
  v35._object = (void *)0xED00004C4556454CLL;
  v36.value._countAndFlagsBits = 0x656772616843;
  v36.value._object = (void *)0xE600000000000000;
  v37._countAndFlagsBits = 0;
  v37._object = (void *)0xE000000000000000;
  v136._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v35, v36, (NSBundle)v34, v37, v136);

  uint64_t v38 = String.init(format:_:)();
  uint64_t v40 = v39;
  swift_bridgeObjectRelease();
  v134[0] = v38;
  v134[1] = v40;
  char v113 = a1;
  long long v135 = *a1;
  id v41 = *((id *)&v135 + 1);
  dispatch thunk of CAFBatteryLevelObservable.batteryLevel.getter();
  sub_100009C50((uint64_t)&v135);
  Measurement.value.getter();
  uint64_t v43 = v42;
  id v44 = *(void (**)(char *, uint64_t))(v14 + 8);
  v44(v23, v13);
  uint64_t v130 = v43;
  sub_100009A04();
  static PlottableValue.value<A>(_:_:)();
  swift_bridgeObjectRelease();
  BarMark.init<A>(xStart:xEnd:y:height:stacking:)();
  id v45 = v41;
  dispatch thunk of CAFBatteryLevelObservable.batteryLevel.getter();
  sub_100009C50((uint64_t)&v135);
  Measurement.value.getter();
  double v47 = v46;
  Swift::String v48 = v21;
  uint64_t v49 = v13;
  uint64_t v129 = v14 + 8;
  long long v126 = v44;
  v44(v48, v13);
  if (v47 < 0.0 || v47 >= 25.0)
  {
    if (v47 < 25.0 || v47 >= 75.0) {
      uint64_t v50 = static Color.green.getter();
    }
    else {
      uint64_t v50 = static Color.yellow.getter();
    }
  }
  else
  {
    uint64_t v50 = static Color.red.getter();
  }
  v134[0] = v50;
  NSString v51 = v102;
  uint64_t v52 = v104;
  ChartContent.foregroundStyle<A>(_:)();
  swift_release();
  v103[1](v28, v52);
  uint64_t v53 = (void (**)(char *, uint64_t))v128[4];
  uint64_t v104 = (uint64_t)(v128 + 4);
  uint64_t v103 = v53;
  ((void (*)(char *, char *, uint64_t))v53)(v127, v51, v123);
  id v54 = v45;
  dispatch thunk of CAFBatteryLevelObservable.batteryTargetChargeLevel.getter();
  sub_100009C50((uint64_t)&v135);
  LocalizedStringKey.init(stringLiteral:)();
  Measurement.value.getter();
  v134[0] = v55;
  static PlottableValue.value(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  RuleMark.init<A>(xStart:xEnd:y:)();
  id v56 = v54;
  dispatch thunk of CAFBatteryLevelObservable.batteryTargetChargeLevel.getter();
  sub_100009C50((uint64_t)&v135);
  Measurement.value.getter();
  double v58 = v57 + 10.0;
  id v59 = v56;
  dispatch thunk of CAFBatteryLevelObservable.batteryLevel.getter();
  sub_100009C50((uint64_t)&v135);
  Measurement.value.getter();
  double v61 = v60;
  v126(v23, v13);
  if (v61 >= v58)
  {
    id v63 = [self systemBackgroundColor];
    uint64_t v62 = Color.init(_:)();
  }
  else
  {
    uint64_t v62 = static Color.primary.getter();
  }
  uint64_t v64 = v62;
  uint64_t v65 = v100;
  id v66 = v99;
  uint64_t v67 = v98;
  uint64_t v68 = v97;
  uint64_t v69 = v96;
  uint64_t v101 = v49;
  v126(v120, v49);
  v134[0] = v64;
  id v70 = v106;
  char v71 = v122;
  ChartContent.foregroundStyle<A>(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v69 + 8))(v71, v68);
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  uint64_t v130 = v68;
  long long v131 = &type metadata for Color;
  uint64_t v132 = &protocol witness table for RuleMark;
  uint64_t v133 = &protocol witness table for Color;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v73 = v109;
  uint64_t v74 = v108;
  ChartContent.lineStyle(_:)();
  sub_100009FC8((uint64_t)v134);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v70, v74);
  static AnnotationPosition.top.getter();
  uint64_t v75 = static Alignment.center.getter();
  __chkstk_darwin(v75);
  uint64_t v130 = v74;
  long long v131 = (void *)OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v76 = v107;
  uint64_t v77 = v111;
  ChartContent.annotation<A>(position:alignment:spacing:content:)();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v66, v116);
  (*(void (**)(char *, uint64_t))(v110 + 8))(v73, v77);
  uint64_t v78 = v114;
  uint64_t v79 = *(char **)(v114 + 32);
  long long v120 = (char *)(v114 + 32);
  long long v122 = v79;
  uint64_t v80 = v125;
  long long v81 = v76;
  uint64_t v82 = v115;
  ((void (*)(char *, char *, uint64_t))v79)(v125, v81, v115);
  long long v83 = (void (*)(char *, char *, uint64_t))v128[2];
  long long v84 = v121;
  uint64_t v85 = v123;
  v83(v121, v127, v123);
  Swift::String v86 = *(void (**)(char *, char *, uint64_t))(v78 + 16);
  long long v87 = v112;
  v86(v112, v80, v82);
  long long v88 = v117;
  v83(v117, v84, v85);
  uint64_t v89 = v118;
  v90 = &v88[*(int *)(v118 + 48)];
  v86(v90, v87, v82);
  uint64_t v91 = v119;
  ((void (*)(uint64_t, char *, uint64_t))v103)(v119, v88, v85);
  ((void (*)(uint64_t, char *, uint64_t))v122)(v91 + *(int *)(v89 + 48), v90, v82);
  int v92 = *(void (**)(char *, uint64_t))(v78 + 8);
  v92(v125, v82);
  v126(v124, v101);
  uint64_t v93 = (void (*)(char *, uint64_t))v128[1];
  v93(v127, v85);
  v92(v87, v82);
  return ((uint64_t (*)(char *, uint64_t))v93)(v121, v85);
}

uint64_t sub_100008580@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v69 = a2;
  uint64_t v3 = sub_100009768(&qword_10002AAD0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v68 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v64 - v7;
  sub_100009768(&qword_10002AB50);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10001DFD0;
  id v10 = [objc_allocWithZone((Class)NSMeasurementFormatter) init];
  id v11 = [v10 numberFormatter];
  if (!v11)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v12 = v11;
  long long v72 = *a1;
  uint64_t v13 = (void *)*((void *)&v72 + 1);
  [v11 setMaximumFractionDigits:1];

  [v10 setUnitOptions:1];
  id v14 = v13;
  dispatch thunk of CAFBatteryLevelObservable.batteryTargetChargeLevel.getter();
  sub_100009C50((uint64_t)&v72);
  sub_100009C7C(0, &qword_10002AAE8);
  uint64_t v15 = NSMeasurementFormatter.string<A>(from:)();
  uint64_t v17 = v16;

  uint64_t v18 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v66 = v4 + 8;
  uint64_t v67 = v3;
  id v70 = v18;
  v18(v8, v3);
  *(void *)(v9 + 56) = &type metadata for String;
  *(void *)(v9 + 64) = sub_100009FFC();
  *(void *)(v9 + 32) = v15;
  *(void *)(v9 + 40) = v17;
  id v19 = [self mainBundle];
  v73._object = (void *)0x800000010001B9A0;
  v20._countAndFlagsBits = 0x4C5F454752414843;
  v20._object = (void *)0xEF40255F54494D49;
  v21.value._countAndFlagsBits = 0x656772616843;
  v21.value._object = (void *)0xE600000000000000;
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  v73._countAndFlagsBits = 0xD000000000000046;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v20, v21, (NSBundle)v19, v22, v73);

  swift_bridgeObjectRetain();
  uint64_t v23 = String.init(format:_:)();
  uint64_t v25 = v24;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v71[0] = v23;
  v71[1] = v25;
  sub_100009A04();
  uint64_t v26 = Text.init<A>(_:)();
  uint64_t v29 = *((void *)a1 + 4);
  id v65 = v14;
  if (!v29)
  {
LABEL_13:
    type metadata accessor for LayoutConfiguration();
    sub_100006064((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
    return result;
  }
  uint64_t v30 = v26;
  uint64_t v31 = v27;
  char v32 = v28;
  if (*(unsigned char *)(v29 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
  {
    if (*(unsigned char *)(v29 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
    {
      swift_retain();
      uint64_t v33 = sub_10000A254();
      uint64_t v34 = type metadata accessor for ClusterMetrics();
      uint64_t v35 = v34;
      Swift::String_optional v36 = &off_100025610;
    }
    else
    {
      swift_retain();
      uint64_t v33 = sub_10000A288();
      uint64_t v34 = type metadata accessor for WidgetMetrics();
      uint64_t v35 = v34;
      Swift::String_optional v36 = &off_1000255B0;
    }
  }
  else
  {
    swift_retain();
    uint64_t v33 = sub_10000A220();
    uint64_t v34 = type metadata accessor for ConsoleMetrics();
    uint64_t v35 = v34;
    Swift::String_optional v36 = &off_100025670;
  }
  v71[3] = v34;
  v71[4] = v36;
  swift_release();
  v71[0] = v33;
  sub_100009A58(v71, v35);
  ((void (__cdecl *)())v36[4])();
  char v37 = v32 & 1;
  uint64_t v38 = Text.font(_:)();
  uint64_t v40 = v39;
  char v42 = v41;
  sub_100009A9C(v30, v31, v37);
  swift_release();
  swift_bridgeObjectRelease();
  sub_100009AAC((uint64_t)v71);
  id v43 = v65;
  id v44 = v68;
  dispatch thunk of CAFBatteryLevelObservable.batteryTargetChargeLevel.getter();
  sub_100009C50((uint64_t)&v72);
  uint64_t v45 = v67;
  Measurement.value.getter();
  double v47 = v46 + 10.0;
  id v48 = v43;
  dispatch thunk of CAFBatteryLevelObservable.batteryLevel.getter();
  sub_100009C50((uint64_t)&v72);
  Measurement.value.getter();
  double v50 = v49;
  v70(v8, v45);
  if (v50 >= v47)
  {
    id v52 = [self systemBackgroundColor];
    uint64_t v51 = Color.init(_:)();
  }
  else
  {
    uint64_t v51 = static Color.primary.getter();
  }
  uint64_t v53 = v51;
  uint64_t v54 = v69;
  char v55 = v42 & 1;
  v70(v44, v45);
  v71[0] = v53;
  uint64_t v56 = Text.foregroundStyle<A>(_:)();
  uint64_t v58 = v57;
  char v60 = v59;
  uint64_t v62 = v61;
  sub_100009A9C(v38, v40, v55);
  swift_release();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)uint64_t v54 = v56;
  *(void *)(v54 + 8) = v58;
  *(unsigned char *)(v54 + 16) = v60 & 1;
  *(void *)(v54 + 24) = v62;
  return result;
}

uint64_t sub_100008B40()
{
  uint64_t v0 = type metadata accessor for AxisMarkPosition();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = type metadata accessor for AxisMarkPreset();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = type metadata accessor for AxisMarkValues();
  __chkstk_darwin(v2 - 8);
  static AxisMarkValues.automatic.getter();
  static AxisMarkPreset.automatic.getter();
  static AxisMarkPosition.automatic.getter();
  sub_100009768(&qword_10002AB00);
  sub_100009EDC();
  return AxisMarks.init(preset:position:values:content:)();
}

uint64_t sub_100008CA0@<X0>(char *a1@<X8>)
{
  id v44 = a1;
  uint64_t v43 = sub_100009768(&qword_10002AB20) - 8;
  ((void (*)(void))__chkstk_darwin)();
  char v42 = (char *)&v36 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AxisValueLabelOrientation();
  ((void (*)(void))__chkstk_darwin)();
  type metadata accessor for AxisValueLabelCollisionResolution();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v41 = sub_100009768(&qword_10002AB18);
  uint64_t v46 = *(void *)(v41 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v40 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v45 = (char *)&v36 - v4;
  uint64_t v5 = type metadata accessor for AxisGridLine();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100009768(&qword_10002AB28);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v39 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v36 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v36 - v16;
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  long long v51 = v48;
  long long v52 = v49;
  uint64_t v53 = v50;
  AxisGridLine.init(centered:stroke:)();
  uint64_t v47 = Color.init(_:bundle:)();
  AxisMark.foregroundStyle<A>(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v18 = v10;
  uint64_t v37 = v10;
  uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  Swift::String_optional v36 = v17;
  uint64_t v19 = v9;
  v38(v17, v15, v9);
  static AxisValueLabelCollisionResolution.automatic.getter();
  static AxisValueLabelOrientation.automatic.getter();
  Swift::String v20 = v45;
  AxisValueLabel.init<>(centered:anchor:multiLabelAlignment:collisionResolution:offsetsMarks:orientation:horizontalSpacing:verticalSpacing:)();
  Swift::String_optional v21 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
  Swift::String v22 = v39;
  v21(v39, v17, v19);
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v46 + 16);
  uint64_t v24 = v40;
  uint64_t v25 = v20;
  uint64_t v26 = v41;
  v23(v40, v25, v41);
  uint64_t v27 = v42;
  v21(v42, v22, v19);
  sub_10000A08C(&qword_10002AB10, &qword_10002AB18);
  uint64_t v28 = v43;
  uint64_t v29 = &v27[*(int *)(v43 + 56)];
  v23(v29, v24, v26);
  uint64_t v30 = v44;
  v38(v44, v27, v19);
  uint64_t v31 = &v30[*(int *)(v28 + 56)];
  uint64_t v32 = v46;
  (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v31, v29, v26);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v32 + 8);
  v33(v45, v26);
  uint64_t v34 = *(void (**)(char *, uint64_t))(v37 + 8);
  v34(v36, v19);
  v33(v24, v26);
  return ((uint64_t (*)(char *, uint64_t))v34)(v22, v19);
}

unint64_t sub_100009258(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100009768(&qword_10002AAF8);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    swift_retain();
    unint64_t result = sub_100009CD0((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
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

uint64_t sub_100009364(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100009768(&qword_10002AAF0);
    uint64_t v2 = (unsigned char *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  id v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v28 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v28 << 6);
      goto LABEL_28;
    }
    int64_t v11 = v28 + 1;
    if (__OFADD__(v28, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v11 >= v26) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v11);
    int64_t v13 = v28 + 1;
    if (!v12)
    {
      int64_t v13 = v28 + 2;
      if (v28 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v12 = *(void *)(v27 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v28 + 3;
        if (v28 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v12 = *(void *)(v27 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v28 + 4;
          if (v28 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v12 = *(void *)(v27 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v28 = v13;
LABEL_28:
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8 * v10);
    *(void *)&v31[0] = *(void *)(*(void *)(a1 + 48) + 8 * v10);
    *(void *)&v30[0] = v15;
    id v16 = *(id *)&v31[0];
    swift_retain();
    swift_dynamicCast();
    uint64_t v17 = *(void *)&v31[0];
    sub_100009CB8((_OWORD *)((char *)v31 + 8), v29);
    sub_100009CB8(v29, v31);
    sub_100009CB8(v31, v30);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v18 = Hasher._finalize()();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v19 = -1 << v2[32];
    unint64_t v20 = v18 & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)]) != 0)
    {
      unint64_t v8 = __clz(__rbit64((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)])) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)&v6[8 * v21];
      }
      while (v25 == -1);
      unint64_t v8 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)&v6[(v8 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v8;
    *(void *)(*((void *)v2 + 6) + 8 * v8) = v17;
    uint64_t result = (uint64_t)sub_100009CB8(v30, (_OWORD *)(*((void *)v2 + 7) + 32 * v8));
    ++*((void *)v2 + 2);
  }
  int64_t v14 = v28 + 5;
  if (v28 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_100009CC8();
    return (uint64_t)v2;
  }
  unint64_t v12 = *(void *)(v27 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v28 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_100009704@<X0>(uint64_t a1@<X8>)
{
  long long v3 = v1[1];
  v6[0] = *v1;
  v6[1] = v3;
  v6[2] = v1[2];
  *(void *)a1 = static VerticalAlignment.center.getter();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v4 = sub_100009768(&qword_10002AA48);
  return sub_1000063C8((uint64_t)v6, a1 + *(int *)(v4 + 44));
}

uint64_t sub_100009768(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000097AC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000076DC(*(_OWORD **)(v1 + 16), a1);
}

unint64_t sub_1000097B4()
{
  unint64_t result = qword_10002AA80;
  if (!qword_10002AA80)
  {
    sub_100006364(&qword_10002AA78);
    type metadata accessor for BarMark();
    swift_getOpaqueTypeConformance2();
    sub_100006364(&qword_10002AA88);
    sub_100006364(&qword_10002AA90);
    type metadata accessor for RuleMark();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AA80);
  }
  return result;
}

unint64_t sub_100009930()
{
  unint64_t result = qword_10002AAA8;
  if (!qword_10002AAA8)
  {
    sub_100006364(&qword_10002AA98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AAA8);
  }
  return result;
}

uint64_t sub_10000999C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009768(&qword_10002AA70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100009A04()
{
  unint64_t result = qword_10002AAC0;
  if (!qword_10002AAC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AAC0);
  }
  return result;
}

void *sub_100009A58(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100009A9C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100009AAC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100009AFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009768(&qword_10002AA70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009B64(uint64_t a1)
{
  return a1;
}

uint64_t sub_100009BA4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100009BB4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100009768(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100009C10(uint64_t a1)
{
  return a1;
}

uint64_t sub_100009C50(uint64_t a1)
{
  return a1;
}

uint64_t sub_100009C7C(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

_OWORD *sub_100009CB8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100009CC8()
{
  return swift_release();
}

unint64_t sub_100009CD0(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();

  return sub_100009D64(a1, v2);
}

unint64_t sub_100009D64(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16) {
            break;
          }
          char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_100009EDC()
{
  unint64_t result = qword_10002AB08;
  if (!qword_10002AB08)
  {
    sub_100006364(&qword_10002AB00);
    type metadata accessor for AxisGridLine();
    swift_getOpaqueTypeConformance2();
    sub_10000A08C(&qword_10002AB10, &qword_10002AB18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AB08);
  }
  return result;
}

uint64_t sub_100009FC8(uint64_t a1)
{
  return a1;
}

uint64_t sub_100009FF4@<X0>(uint64_t a1@<X8>)
{
  return sub_100008580(*(long long **)(v1 + 16), a1);
}

unint64_t sub_100009FFC()
{
  unint64_t result = qword_10002AB58;
  if (!qword_10002AB58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AB58);
  }
  return result;
}

uint64_t sub_10000A050()
{
  return sub_10000A08C(&qword_10002AB60, &qword_10002AB68);
}

uint64_t sub_10000A08C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006364(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

double sub_10000A0E0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

BOOL sub_10000A154(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000A168()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000A1B0()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000A1DC()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_10000A220()
{
  return sub_10000A2BC(&OBJC_IVAR____TtC6Charge19LayoutConfiguration____lazy_storage___consoleMetrics, (void (*)(void))type metadata accessor for ConsoleMetrics, sub_100013688);
}

uint64_t sub_10000A254()
{
  return sub_10000A2BC(&OBJC_IVAR____TtC6Charge19LayoutConfiguration____lazy_storage___clusterMetrics, (void (*)(void))type metadata accessor for ClusterMetrics, sub_100013C40);
}

uint64_t sub_10000A288()
{
  return sub_10000A2BC(&OBJC_IVAR____TtC6Charge19LayoutConfiguration____lazy_storage___widgetMetrics, (void (*)(void))type metadata accessor for WidgetMetrics, sub_100014294);
}

uint64_t sub_10000A2BC(uint64_t *a1, void (*a2)(void), uint64_t (*a3)(void))
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)(v3 + *a1);
  if (v5)
  {
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v8 = v3;
    a2();
    swift_allocObject();
    uint64_t v6 = a3();
    *(void *)(v8 + v4) = v6;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v6;
}

uint64_t sub_10000A340()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC6Charge19LayoutConfiguration__size;
  uint64_t v2 = sub_100009768(&qword_10002ACF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_10000A414()
{
  return type metadata accessor for LayoutConfiguration();
}

uint64_t type metadata accessor for LayoutConfiguration()
{
  uint64_t result = qword_10002ABB8;
  if (!qword_10002ABB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000A468()
{
  sub_10000A510();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10000A510()
{
  if (!qword_10002ABC8)
  {
    type metadata accessor for CGSize(255);
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10002ABC8);
    }
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for ChargePresentationMode(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ChargePresentationMode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ChargePresentationMode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10000A6D0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ChargePresentationMode()
{
  return &type metadata for ChargePresentationMode;
}

unint64_t sub_10000A710()
{
  unint64_t result = qword_10002ACE8;
  if (!qword_10002ACE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002ACE8);
  }
  return result;
}

void *sub_10000A764()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10000A770@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for LayoutConfiguration();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

double sub_10000A7B0@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_10000A834()
{
  return static Published.subscript.setter();
}

uint64_t getEnumTagSinglePayload for ChargeTemplateType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ChargeTemplateType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *double result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10000AA10);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *double result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_10000AA38(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000AA40(unsigned char *result, char a2)
{
  *double result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ChargeTemplateType()
{
  return &type metadata for ChargeTemplateType;
}

unint64_t sub_10000AA5C()
{
  unint64_t result = qword_10002ACF8;
  if (!qword_10002ACF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002ACF8);
  }
  return result;
}

void sub_10000AB54(void *a1)
{
  self;
  uint64_t v3 = swift_dynamicCastObjCClass();
  if (v3)
  {
    unsigned int v4 = (void *)v3;
    id v5 = a1;
    id v6 = [v4 _FBSScene];
    id v7 = [v6 settings];

    self;
    uint64_t v8 = swift_dynamicCastObjCClass();

    uint64_t v9 = &OBJC_IVAR____TtC6Charge19ChargeSceneDelegate_consoleWindowManager;
    if (v8) {
      uint64_t v9 = &OBJC_IVAR____TtC6Charge19ChargeSceneDelegate_clusterWindowManager;
    }
    uint64_t v10 = *v9;
    id v11 = *(id *)(v1 + v10);
    *(void *)(v1 + v10) = 0;
  }
}

id sub_10000AD18()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ChargeSceneDelegate();
  [super dealloc];
}

uint64_t type metadata accessor for ChargeSceneDelegate()
{
  return self;
}

void sub_10000ADBC(void *a1, id a2)
{
  uint64_t v3 = v2;
  id v6 = [a2 role];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  CAFSignpostEmit_Scene();

  self;
  uint64_t v8 = swift_dynamicCastObjCClass();
  if (!v8)
  {
LABEL_8:
    os_log_type_t v18 = static os_log_type_t.info.getter();
    sub_10000B7A0(v18, 0xD000000000000024, 0x800000010001BB60, 0xD00000000000001FLL, 0x800000010001BB90);
    return;
  }
  uint64_t v9 = (void *)v8;
  id v10 = a1;
  id v11 = [a2 role];
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  if (v12 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v14 == v15)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
    {

      goto LABEL_8;
    }
  }
  id v19 = [v9 _FBSScene];
  id v20 = [v19 settings];

  self;
  uint64_t v21 = swift_dynamicCastObjCClass();

  id v22 = objc_allocWithZone((Class)type metadata accessor for ChargeWindowManager());
  id v23 = v10;
  if (v21)
  {
    BOOL v24 = sub_100013478(v9, 1);
    uint64_t v25 = OBJC_IVAR____TtC6Charge19ChargeSceneDelegate_clusterWindowManager;
  }
  else
  {
    BOOL v24 = sub_100013478(v9, 0);
    uint64_t v25 = OBJC_IVAR____TtC6Charge19ChargeSceneDelegate_consoleWindowManager;
  }
  id v26 = *(id *)(v3 + v25);
  *(void *)(v3 + v25) = v24;
}

uint64_t sub_10000B034()
{
  id v0 = [self mainBundle];
  id v1 = [v0 bundleIdentifier];

  if (v1)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  sub_10000B9FC();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  qword_10002CCD8 = result;
  return result;
}

void sub_10000B0F0()
{
  qword_10002CCE0 = 0x6C69662E746C6F62;
  *(void *)algn_10002CCE8 = 0xE90000000000006CLL;
}

void sub_10000B118()
{
  qword_10002CCF0 = 0x616C732E746C6F62;
  *(void *)algn_10002CCF8 = 0xEF6C6C69662E6873;
}

uint64_t sub_10000B148(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000B21C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000B99C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000B99C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100009AAC((uint64_t)v12);
  return v7;
}

uint64_t sub_10000B21C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000B3D8(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10000B3D8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000B470(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000B650(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000B650(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000B470(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_10000B5E8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000B5E8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100009768(&qword_10002AE00);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000B650(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100009768(&qword_10002AE00);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000B7A0(os_log_type_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  if (qword_10002A870 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_10002CCD8;
  uint64_t result = os_log_type_enabled((os_log_t)qword_10002CCD8, a1);
  if (result)
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315650;
    swift_bridgeObjectRetain();
    sub_10000B148(a4, a5, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v12 + 12) = 2048;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v12 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_10000B148(a2, a3, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v10, a1, "%s: %ld  %s", (uint8_t *)v12, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    return swift_slowDealloc();
  }
  return result;
}

uint64_t sub_10000B99C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10000B9FC()
{
  unint64_t result = qword_10002AE08;
  if (!qword_10002AE08)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10002AE08);
  }
  return result;
}

ValueMetadata *type metadata accessor for AlignTopLeft()
{
  return &type metadata for AlignTopLeft;
}

uint64_t sub_10000BA4C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000BA68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  uint64_t v2 = sub_100009768(&qword_10002AE18);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  int64_t v8 = (char *)&v22 - v7;
  uint64_t v9 = sub_100009768(&qword_10002AE20);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v22 - v13;
  *(void *)uint64_t v14 = static HorizontalAlignment.leading.getter();
  *((void *)v14 + 1) = 0;
  v14[16] = 1;
  uint64_t v15 = &v14[*(int *)(sub_100009768(&qword_10002AE28) + 44)];
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v16(v8, v22, v2);
  v16(v6, (uint64_t)v8, v2);
  v16(v15, (uint64_t)v6, v2);
  char v17 = &v15[*(int *)(sub_100009768(&qword_10002AE30) + 48)];
  *(void *)char v17 = 0;
  v17[8] = 1;
  os_log_type_t v18 = *(void (**)(char *, uint64_t))(v3 + 8);
  v18(v8, v2);
  v18(v6, v2);
  sub_10000BD2C((uint64_t)v14, (uint64_t)v12);
  uint64_t v19 = v23;
  sub_10000BD2C((uint64_t)v12, v23);
  uint64_t v20 = v19 + *(int *)(sub_100009768(&qword_10002AE38) + 48);
  *(void *)uint64_t v20 = 0;
  *(unsigned char *)(v20 + 8) = 1;
  sub_10000BD94((uint64_t)v14);
  return sub_10000BD94((uint64_t)v12);
}

uint64_t sub_10000BCC0()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_10000BCDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = static VerticalAlignment.center.getter();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  uint64_t v4 = sub_100009768(&qword_10002AE10);
  return sub_10000BA68(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_10000BD2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009768(&qword_10002AE20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000BD94(uint64_t a1)
{
  uint64_t v2 = sub_100009768(&qword_10002AE20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000BDF8()
{
  unint64_t result = qword_10002AE40;
  if (!qword_10002AE40)
  {
    sub_100006364(&qword_10002AE48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AE40);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ChargeGaugeView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for ChargeGaugeView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  id v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for ChargeGaugeView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ChargeGaugeView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for ChargeGaugeView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ChargeGaugeView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ChargeGaugeView()
{
  return &type metadata for ChargeGaugeView;
}

uint64_t sub_10000BFCC()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_10000BFE8@<D0>(char *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = &a1[OBJC_IVAR____TtC6Charge11ChargeModel__carObservable];
  swift_beginAccess();
  uint64_t v5 = (void *)*((void *)v4 + 1);
  id v6 = a1;
  id v7 = v5;
  int64_t v8 = (void *)dispatch thunk of CAFCarObservable.highVoltageBattery.getter();

  if (!v8) {
    goto LABEL_8;
  }
  id v9 = [v8 batteryLevel];

  if (!v9)
  {
LABEL_9:
    type metadata accessor for LayoutConfiguration();
    sub_10000C508((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
    EnvironmentObject.init()();
    sub_10000C4B4();
    sub_100005FCC();
    _ConditionalContent<>.init(storage:)();
    goto LABEL_10;
  }
  uint64_t v10 = (void *)*((void *)v4 + 1);
  id v6 = v6;
  id v11 = v10;
  uint64_t v12 = (void *)dispatch thunk of CAFCarObservable.charging.getter();

  if (!v12)
  {

LABEL_8:
    goto LABEL_9;
  }
  id v13 = [v12 chargingTime];

  if (!v13)
  {
    id v6 = (char *)v9;
    goto LABEL_8;
  }
  sub_100009C7C(0, &qword_10002AA08);
  sub_100006020(&qword_10002AA10, &qword_10002AA08);
  CAFObserved<>.observable.getter();
  sub_100009C7C(0, &qword_10002AA18);
  sub_100006020(&qword_10002AA20, &qword_10002AA18);
  CAFObserved<>.observable.getter();
  type metadata accessor for LayoutConfiguration();
  sub_10000C508((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
  uint64_t v14 = v6;
  EnvironmentObject.init()();
  type metadata accessor for CAFBatteryLevelObservable();
  sub_10000C508(&qword_10002AA28, (void (*)(uint64_t))&type metadata accessor for CAFBatteryLevelObservable);
  ObservedObject.init(wrappedValue:)();
  uint64_t v16 = v15;
  type metadata accessor for CAFChargingTimeObservable();
  sub_10000C508(&qword_10002AA30, (void (*)(uint64_t))&type metadata accessor for CAFChargingTimeObservable);
  ObservedObject.init(wrappedValue:)();
  os_log_type_t v18 = v17;
  type metadata accessor for ChargeModel();
  sub_10000C508(&qword_10002AE58, (void (*)(uint64_t))type metadata accessor for ChargeModel);
  ObservedObject.init(wrappedValue:)();
  uint64_t v20 = v19;
  sub_10000C4B4();
  sub_100005FCC();
  id v21 = v16;
  id v22 = v18;
  id v23 = v20;
  swift_retain_n();
  id v24 = v21;
  id v25 = v22;
  id v26 = v23;
  _ConditionalContent<>.init(storage:)();
  swift_release_n();

LABEL_10:
  double result = *(double *)&v28;
  *(_OWORD *)a2 = v28;
  *(_OWORD *)(a2 + 16) = v29;
  *(_OWORD *)(a2 + 32) = v30;
  *(_OWORD *)(a2 + 48) = v31;
  *(unsigned char *)(a2 + 64) = v32;
  *(unsigned char *)(a2 + 65) = v33;
  return result;
}

double sub_10000C4A8@<D0>(uint64_t a1@<X8>)
{
  return sub_10000BFE8(*(char **)(v1 + 8), a1);
}

unint64_t sub_10000C4B4()
{
  unint64_t result = qword_10002AE50;
  if (!qword_10002AE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AE50);
  }
  return result;
}

uint64_t sub_10000C508(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t destroy for CircularCapacityGauge(id *a1)
{
  return swift_release();
}

uint64_t initializeWithCopy for CircularCapacityGauge(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  id v7 = v3;
  id v8 = v4;
  id v9 = v5;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CircularCapacityGauge(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  id v7 = *(void **)(a2 + 24);
  id v8 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v7;
  id v9 = v7;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v10 = *(void **)(a2 + 40);
  id v11 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v10;
  id v12 = v10;

  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

__n128 initializeWithTake for CircularCapacityGauge(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for CircularCapacityGauge(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;

  uint64_t v6 = *(void *)(a2 + 24);
  id v7 = *(void **)(a1 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for CircularCapacityGauge(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 65)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CircularCapacityGauge(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 65) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 65) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CircularCapacityGauge()
{
  return &type metadata for CircularCapacityGauge;
}

uint64_t sub_10000C7F8()
{
  return sub_1000129B0(&qword_10002AE60, &qword_10002AE68, (void (*)(void))sub_10000C4B4, (void (*)(void))sub_100005FCC);
}

uint64_t sub_10000C848()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000C864@<X0>(uint64_t a1@<X8>)
{
  uint64_t v101 = a1;
  uint64_t v2 = sub_100009768(&qword_10002AE70);
  __chkstk_darwin(v2 - 8);
  uint64_t v84 = (uint64_t)&v81 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_100009768(&qword_10002AE78);
  __chkstk_darwin(v82);
  uint64_t v85 = (uint64_t)&v81 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_100009768(&qword_10002AE80);
  uint64_t v5 = __chkstk_darwin(v91);
  uint64_t v83 = (uint64_t)&v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v86 = (uint64_t)&v81 - v7;
  uint64_t v88 = sub_100009768(&qword_10002AE88);
  __chkstk_darwin(v88);
  uint64_t v89 = (uint64_t)&v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100009768(&qword_10002AE90);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_100009768(&qword_10002AE98);
  uint64_t v12 = __chkstk_darwin(v87);
  uint64_t v14 = (char *)&v81 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v81 = (uint64_t)&v81 - v15;
  uint64_t v95 = sub_100009768(&qword_10002AEA0);
  __chkstk_darwin(v95);
  v90 = (char *)&v81 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_100009768(&qword_10002AEA8);
  __chkstk_darwin(v92);
  uint64_t v94 = (uint64_t)&v81 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = sub_100009768(&qword_10002AEB0);
  __chkstk_darwin(v100);
  uint64_t v96 = (char *)&v81 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_100009768(&qword_10002AEB8);
  __chkstk_darwin(v93);
  uint64_t v20 = (char *)&v81 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100009768(&qword_10002AEC0);
  __chkstk_darwin(v21);
  id v23 = (char *)&v81 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = sub_100009768(&qword_10002AEC8);
  __chkstk_darwin(v98);
  uint64_t v97 = (uint64_t)&v81 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100009768(&qword_10002AED0);
  __chkstk_darwin(v25);
  uint64_t v27 = (char *)&v81 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = sub_100009768(&qword_10002AED8);
  __chkstk_darwin(v99);
  long long v29 = (char *)&v81 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(*(unsigned char *)(v1 + 64))
  {
    case 1:
      *(void *)id v23 = static HorizontalAlignment.center.getter();
      *((void *)v23 + 1) = 0;
      v23[16] = 1;
      uint64_t v66 = sub_100009768(&qword_10002AF48);
      sub_10000D820(v1, &v23[*(int *)(v66 + 44)]);
      sub_100012164((uint64_t)v23, (uint64_t)v27, &qword_10002AEC0);
      swift_storeEnumTagMultiPayload();
      sub_10000A08C(&qword_10002AF30, &qword_10002AEC0);
      _ConditionalContent<>.init(storage:)();
      sub_100012164((uint64_t)v29, v97, &qword_10002AED8);
      swift_storeEnumTagMultiPayload();
      sub_100011A20();
      sub_100011AC0();
      _ConditionalContent<>.init(storage:)();
      sub_100009BB4((uint64_t)v29, &qword_10002AED8);
      uint64_t v33 = (uint64_t)v23;
      uint64_t v67 = &qword_10002AEC0;
      return sub_100009BB4(v33, v67);
    case 2:
      *(void *)uint64_t v20 = static HorizontalAlignment.center.getter();
      *((void *)v20 + 1) = 0;
      v20[16] = 1;
      uint64_t v31 = sub_100009768(&qword_10002AF40);
      sub_10000EA34((long long *)v1, (uint64_t *)&v20[*(int *)(v31 + 44)]);
      long long v30 = &qword_10002AEB8;
      sub_100012164((uint64_t)v20, v94, &qword_10002AEB8);
      swift_storeEnumTagMultiPayload();
      sub_10000A08C(&qword_10002AF18, &qword_10002AEB8);
      sub_1000129B0(&qword_10002AF20, &qword_10002AEA0, (void (*)(void))sub_10001183C, (void (*)(void))sub_1000118DC);
      uint64_t v32 = (uint64_t)v96;
      _ConditionalContent<>.init(storage:)();
      sub_100012164(v32, v97, &qword_10002AEB0);
      swift_storeEnumTagMultiPayload();
      sub_100011A20();
      sub_100011AC0();
      _ConditionalContent<>.init(storage:)();
      sub_100009BB4(v32, &qword_10002AEB0);
      uint64_t v33 = (uint64_t)v20;
      goto LABEL_15;
    case 3:
      uint64_t v34 = *(void *)(v1 + 48);
      if (!v34)
      {
        type metadata accessor for LayoutConfiguration();
        sub_10000C508((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
        EnvironmentObject.error()();
        __break(1u);
        JUMPOUT(0x10000D500);
      }
      int v35 = *(unsigned __int8 *)(v34 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode);
      *(void *)id v11 = static HorizontalAlignment.leading.getter();
      *((void *)v11 + 1) = 0;
      v11[16] = 1;
      uint64_t v36 = sub_100009768(&qword_10002AEE0);
      sub_10000F4D0(v1, &v11[*(int *)(v36 + 44)]);
      long long v29 = v90;
      if (v35)
      {
        uint64_t v37 = v84;
        sub_100012164((uint64_t)v11, v84, &qword_10002AE90);
        sub_100009BB4((uint64_t)v11, &qword_10002AE90);
        unsigned __int8 v38 = static Edge.Set.leading.getter();
        unsigned __int8 v39 = static Edge.Set.top.getter();
        char v40 = Edge.Set.init(rawValue:)();
        Edge.Set.init(rawValue:)();
        if (Edge.Set.init(rawValue:)() != v38) {
          char v40 = Edge.Set.init(rawValue:)();
        }
        Edge.Set.init(rawValue:)();
        if (Edge.Set.init(rawValue:)() != v39) {
          char v40 = Edge.Set.init(rawValue:)();
        }
        EdgeInsets.init(_all:)();
        uint64_t v42 = v41;
        uint64_t v44 = v43;
        uint64_t v46 = v45;
        uint64_t v48 = v47;
        uint64_t v49 = v85;
        sub_100012164(v37, v85, &qword_10002AE70);
        uint64_t v50 = v49 + *(int *)(v82 + 36);
        *(unsigned char *)uint64_t v50 = v40;
        *(void *)(v50 + 8) = v42;
        *(void *)(v50 + 16) = v44;
        *(void *)(v50 + 24) = v46;
        *(void *)(v50 + 32) = v48;
        *(unsigned char *)(v50 + 40) = 0;
        sub_100009BB4(v37, &qword_10002AE70);
        char v51 = static Edge.Set.bottom.getter();
        EdgeInsets.init(_all:)();
        uint64_t v53 = v52;
        uint64_t v55 = v54;
        uint64_t v57 = v56;
        uint64_t v59 = v58;
        uint64_t v60 = v83;
        sub_100012164(v49, v83, &qword_10002AE78);
        uint64_t v61 = v60 + *(int *)(v91 + 36);
        *(unsigned char *)uint64_t v61 = v51;
        *(void *)(v61 + 8) = v53;
        *(void *)(v61 + 16) = v55;
        *(void *)(v61 + 24) = v57;
        *(void *)(v61 + 32) = v59;
        *(unsigned char *)(v61 + 40) = 0;
        sub_100009BB4(v49, &qword_10002AE78);
        uint64_t v62 = &qword_10002AE80;
        uint64_t v63 = v60;
        uint64_t v64 = v86;
        sub_100012698(v63, v86, &qword_10002AE80);
        sub_100012164(v64, v89, &qword_10002AE80);
        swift_storeEnumTagMultiPayload();
        sub_10001183C();
        sub_1000118DC();
        _ConditionalContent<>.init(storage:)();
        uint64_t v65 = v64;
      }
      else
      {
        char v68 = static Edge.Set.all.getter();
        EdgeInsets.init(_all:)();
        uint64_t v70 = v69;
        uint64_t v72 = v71;
        uint64_t v74 = v73;
        uint64_t v76 = v75;
        sub_100012164((uint64_t)v11, (uint64_t)v14, &qword_10002AE90);
        uint64_t v77 = &v14[*(int *)(v87 + 36)];
        *uint64_t v77 = v68;
        *((void *)v77 + 1) = v70;
        *((void *)v77 + 2) = v72;
        *((void *)v77 + 3) = v74;
        *((void *)v77 + 4) = v76;
        v77[40] = 0;
        sub_100009BB4((uint64_t)v11, &qword_10002AE90);
        uint64_t v62 = &qword_10002AE98;
        uint64_t v78 = v81;
        sub_100012698((uint64_t)v14, v81, &qword_10002AE98);
        sub_100012164(v78, v89, &qword_10002AE98);
        swift_storeEnumTagMultiPayload();
        sub_10001183C();
        sub_1000118DC();
        _ConditionalContent<>.init(storage:)();
        uint64_t v65 = v78;
      }
      sub_100009BB4(v65, v62);
      long long v30 = &qword_10002AEA0;
      sub_100012164((uint64_t)v29, v94, &qword_10002AEA0);
      swift_storeEnumTagMultiPayload();
      sub_10000A08C(&qword_10002AF18, &qword_10002AEB8);
      sub_1000129B0(&qword_10002AF20, &qword_10002AEA0, (void (*)(void))sub_10001183C, (void (*)(void))sub_1000118DC);
      uint64_t v79 = (uint64_t)v96;
      _ConditionalContent<>.init(storage:)();
      sub_100012164(v79, v97, &qword_10002AEB0);
      swift_storeEnumTagMultiPayload();
      sub_100011A20();
      sub_100011AC0();
      _ConditionalContent<>.init(storage:)();
      sub_100009BB4(v79, &qword_10002AEB0);
      goto LABEL_14;
    default:
      swift_storeEnumTagMultiPayload();
      sub_10000A08C(&qword_10002AF30, &qword_10002AEC0);
      _ConditionalContent<>.init(storage:)();
      long long v30 = &qword_10002AED8;
      sub_100012164((uint64_t)v29, v97, &qword_10002AED8);
      swift_storeEnumTagMultiPayload();
      sub_100011A20();
      sub_100011AC0();
      _ConditionalContent<>.init(storage:)();
LABEL_14:
      uint64_t v33 = (uint64_t)v29;
LABEL_15:
      uint64_t v67 = v30;
      return sub_100009BB4(v33, v67);
  }
}

uint64_t sub_10000D510()
{
  uint64_t v1 = *(void *)(v0 + 48);
  if (v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    int v2 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode);
    if (*(unsigned char *)(v1 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      swift_retain();
      if (v2 == 1)
      {
        uint64_t v3 = sub_10000A254();
        uint64_t v4 = type metadata accessor for ClusterMetrics();
        uint64_t v5 = v4;
        uint64_t v6 = &off_100025610;
      }
      else
      {
        uint64_t v3 = sub_10000A288();
        uint64_t v4 = type metadata accessor for WidgetMetrics();
        uint64_t v5 = v4;
        uint64_t v6 = &off_1000255B0;
      }
    }
    else
    {
      swift_retain();
      uint64_t v3 = sub_10000A220();
      uint64_t v4 = type metadata accessor for ConsoleMetrics();
      uint64_t v5 = v4;
      uint64_t v6 = &off_100025670;
    }
    uint64_t v13 = v4;
    uint64_t v14 = v6;
    swift_release();
    uint64_t v12 = v3;
    sub_100009A58(&v12, v5);
    ((void (__cdecl *)())v6[9])();
    sub_100009AAC((uint64_t)&v12);
    if (v2)
    {
      swift_retain();
      if (v2 == 1)
      {
        uint64_t v7 = sub_10000A254();
        uint64_t v8 = type metadata accessor for ClusterMetrics();
        uint64_t v9 = v8;
        uint64_t v10 = &off_100025610;
      }
      else
      {
        uint64_t v7 = sub_10000A288();
        uint64_t v8 = type metadata accessor for WidgetMetrics();
        uint64_t v9 = v8;
        uint64_t v10 = &off_1000255B0;
      }
    }
    else
    {
      swift_retain();
      uint64_t v7 = sub_10000A220();
      uint64_t v8 = type metadata accessor for ConsoleMetrics();
      uint64_t v9 = v8;
      uint64_t v10 = &off_100025670;
    }
    uint64_t v13 = v8;
    uint64_t v14 = v10;
    swift_release();
    uint64_t v12 = v7;
    sub_100009A58(&v12, v9);
    ((void (__cdecl *)())v10[9])();
    return sub_100009AAC((uint64_t)&v12);
  }
  else
  {
    type metadata accessor for LayoutConfiguration();
    sub_10000C508((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_10000D820@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for AccessoryCircularCapacityGaugeStyle();
  uint64_t v84 = *(void *)(v4 - 8);
  uint64_t v85 = v4;
  __chkstk_darwin(v4);
  uint64_t v83 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_100009768(&qword_10002AF50);
  __chkstk_darwin(v82);
  uint64_t v7 = (char *)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100009768(&qword_10002AF58);
  uint64_t v88 = *(void *)(v8 - 8);
  uint64_t v89 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v91 = (char *)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v90 = (char *)&v76 - v11;
  id v12 = [self mainBundle];
  v119._object = (void *)0xE000000000000000;
  v13._countAndFlagsBits = 0x474E494752414843;
  v13._object = (void *)0xE800000000000000;
  v14.value._countAndFlagsBits = 0x656772616843;
  v14.value._object = (void *)0xE600000000000000;
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  v119._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v13, v14, (NSBundle)v12, v15, v119);

  uint64_t v16 = String.init(format:_:)();
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  uint64_t v111 = v16;
  uint64_t v112 = v18;
  sub_100009A04();
  uint64_t v19 = Text.init<A>(_:)();
  uint64_t v22 = *(void *)(a1 + 48);
  if (v22)
  {
    uint64_t v23 = v19;
    uint64_t v24 = v20;
    uint64_t v78 = v7;
    int v25 = *(unsigned __int8 *)(v22 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode);
    *(void *)&long long v86 = a1;
    char v26 = v21;
    if (v25)
    {
      if (v25 == 1)
      {
        swift_retain();
        uint64_t v27 = sub_10000A254();
        uint64_t v28 = type metadata accessor for ClusterMetrics();
        uint64_t v29 = v28;
        long long v30 = &off_100025610;
      }
      else
      {
        swift_retain();
        uint64_t v27 = sub_10000A288();
        uint64_t v28 = type metadata accessor for WidgetMetrics();
        uint64_t v29 = v28;
        long long v30 = &off_1000255B0;
      }
    }
    else
    {
      swift_retain();
      uint64_t v27 = sub_10000A220();
      uint64_t v28 = type metadata accessor for ConsoleMetrics();
      uint64_t v29 = v28;
      long long v30 = &off_100025670;
    }
    v118[3] = v28;
    v118[4] = v30;
    swift_release();
    v118[0] = v27;
    sub_100009A58(v118, v29);
    ((void (__cdecl *)())v30[5])();
    uint64_t v87 = Text.font(_:)();
    uint64_t v80 = v31;
    uint64_t v81 = v32;
    char v34 = v33;
    sub_100009A9C(v23, v24, v26 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    sub_100009AAC((uint64_t)v118);
    int v79 = static Edge.Set.top.getter();
    EdgeInsets.init(_all:)();
    uint64_t v36 = v35;
    uint64_t v38 = v37;
    uint64_t v40 = v39;
    uint64_t v42 = v41;
    uint64_t v43 = (uint64_t)v78;
    uint64_t v44 = v86;
    sub_10000DF8C((uint64_t)v78);
    uint64_t v45 = v83;
    AccessoryCircularCapacityGaugeStyle.init()();
    sub_100011B98();
    sub_10000C508(&qword_10002AFB8, (void (*)(uint64_t))&type metadata accessor for AccessoryCircularCapacityGaugeStyle);
    uint64_t v46 = v91;
    uint64_t v47 = v85;
    View.gaugeStyle<A>(_:)();
    (*(void (**)(char *, uint64_t))(v84 + 8))(v45, v47);
    sub_100009BB4(v43, &qword_10002AF50);
    (*(void (**)(char *, char *, uint64_t))(v88 + 32))(v90, v46, v89);
    uint64_t v48 = sub_10000E7D4();
    uint64_t v77 = a2;
    if (v49)
    {
      uint64_t v50 = v48;
      uint64_t v51 = v49;
      uint64_t v52 = static HorizontalAlignment.center.getter();
      sub_10000FBB4(v50, v51, v44, (uint64_t)&v111);
      swift_bridgeObjectRelease();
      uint64_t v53 = v111;
      uint64_t v54 = v112;
      char v55 = v113;
      long long v86 = v114;
      uint64_t v56 = v115;
      char v57 = v34;
      char v58 = v116;
      uint64_t v59 = v117;
      LOBYTE(v51) = static Edge.Set.bottom.getter();
      EdgeInsets.init(_all:)();
      v95[0] = 1;
      v94[0] = v55;
      char v93 = v58;
      char v92 = 0;
      v96[0] = v52;
      v96[1] = 0;
      char v97 = 1;
      uint64_t v98 = v53;
      uint64_t v99 = v54;
      char v100 = v55;
      long long v101 = v86;
      uint64_t v102 = v56;
      char v103 = v58;
      char v34 = v57;
      uint64_t v104 = v59;
      char v105 = v51;
      uint64_t v106 = v60;
      uint64_t v107 = v61;
      uint64_t v108 = v62;
      uint64_t v109 = v63;
      char v110 = 0;
      ConfigurationIntentResponseCode.rawValue.getter(v96);
    }
    else
    {
      sub_100011DE0((uint64_t)v96);
    }
    sub_100012698((uint64_t)v96, (uint64_t)&v111, &qword_10002AFC0);
    char v64 = v34 & 1;
    LODWORD(v86) = v34 & 1;
    uint64_t v66 = v88;
    uint64_t v65 = v89;
    uint64_t v67 = *(void (**)(char *, char *, uint64_t))(v88 + 16);
    char v68 = v91;
    v67(v91, v90, v89);
    sub_100012698((uint64_t)&v111, (uint64_t)v94, &qword_10002AFC0);
    uint64_t v69 = v77;
    uint64_t v70 = v80;
    *uint64_t v77 = v87;
    v69[1] = v70;
    *((unsigned char *)v69 + 16) = v64;
    v69[3] = v81;
    *((unsigned char *)v69 + 32) = v79;
    v69[5] = v36;
    v69[6] = v38;
    v69[7] = v40;
    v69[8] = v42;
    *((unsigned char *)v69 + 72) = 0;
    uint64_t v71 = sub_100009768(&qword_10002AFC8);
    v67((char *)v69 + *(int *)(v71 + 48), v68, v65);
    uint64_t v72 = (uint64_t)v69 + *(int *)(v71 + 64);
    sub_100012698((uint64_t)v94, (uint64_t)v95, &qword_10002AFC0);
    sub_100012698((uint64_t)v95, v72, &qword_10002AFC0);
    uint64_t v73 = v87;
    LOBYTE(v69) = v86;
    sub_100009BA4(v87, v70, v86);
    swift_bridgeObjectRetain();
    sub_100011E80((uint64_t)v95, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_100011DFC);
    uint64_t v74 = *(void (**)(char *, uint64_t))(v66 + 8);
    v74(v90, v65);
    sub_100012698((uint64_t)v94, (uint64_t)v96, &qword_10002AFC0);
    sub_100011E80((uint64_t)v96, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_100011EEC);
    v74(v91, v65);
    sub_100009A9C(v73, v70, (char)v69);
    return swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for LayoutConfiguration();
    sub_10000C508((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_10000DF8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v74 = a1;
  uint64_t v2 = sub_100009768(&qword_10002AAD0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100009768(&qword_10002AFA0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100009768(&qword_10002AF90);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  Swift::String v13 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_100009768(&qword_10002AF80);
  __chkstk_darwin(v67);
  char v68 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_100009768(&qword_10002AF68);
  __chkstk_darwin(v70);
  uint64_t v69 = (uint64_t)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100009768(&qword_10002AFD0);
  uint64_t v72 = *(void *)(v16 - 8);
  uint64_t v73 = v16;
  __chkstk_darwin(v16);
  uint64_t v71 = (char *)&v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v80 = *v1;
  id v18 = *((id *)&v80 + 1);
  dispatch thunk of CAFBatteryLevelObservable.batteryLevel.getter();
  sub_100009C50((uint64_t)&v80);
  Measurement.value.getter();
  uint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  char v21 = v1;
  uint64_t v76 = v20;
  long long v77 = xmmword_10001E2F0;
  uint64_t v75 = v1;
  sub_100009768(&qword_10002AFD8);
  sub_100011F78();
  sub_1000120B8();
  Gauge.init<A>(value:in:label:)();
  sub_100009768(&qword_10002B020);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_10001DFD0;
  *(void *)(v22 + 32) = static Color.green.getter();
  *(void *)&long long v77 = v22;
  specialized Array._endMutation()();
  uint64_t v23 = Gradient.init(colors:)();
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)&long long v77 = v23;
  swift_bridgeObjectRetain();
  uint64_t v25 = AnyShapeStyle.init<A>(_:)();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v9, v6);
  swift_bridgeObjectRelease();
  char v26 = (uint64_t *)&v13[*(int *)(v11 + 44)];
  *char v26 = KeyPath;
  v26[1] = v25;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  char v27 = static Edge.Set.top.getter();
  uint64_t v28 = *((void *)v21 + 6);
  if (v28)
  {
    char v29 = v27;
    uint64_t v30 = (uint64_t)v68;
    if (*(unsigned char *)(v28 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      if (*(unsigned char *)(v28 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain();
        uint64_t v31 = sub_10000A254();
        uint64_t v32 = type metadata accessor for ClusterMetrics();
        uint64_t v33 = v32;
        char v34 = &off_100025610;
      }
      else
      {
        swift_retain();
        uint64_t v31 = sub_10000A288();
        uint64_t v32 = type metadata accessor for WidgetMetrics();
        uint64_t v33 = v32;
        char v34 = &off_1000255B0;
      }
    }
    else
    {
      swift_retain();
      uint64_t v31 = sub_10000A220();
      uint64_t v32 = type metadata accessor for ConsoleMetrics();
      uint64_t v33 = v32;
      char v34 = &off_100025670;
    }
    *((void *)&v78 + 1) = v32;
    *(void *)&long long v79 = v34;
    swift_release();
    *(void *)&long long v77 = v31;
    sub_100009A58(&v77, v33);
    ((void (__cdecl *)())v34[10])();
    EdgeInsets.init(_all:)();
    uint64_t v36 = v35;
    uint64_t v38 = v37;
    uint64_t v40 = v39;
    uint64_t v42 = v41;
    sub_100012164((uint64_t)v13, v30, &qword_10002AF90);
    uint64_t v43 = v30 + *(int *)(v67 + 36);
    *(unsigned char *)uint64_t v43 = v29;
    *(void *)(v43 + 8) = v36;
    *(void *)(v43 + 16) = v38;
    *(void *)(v43 + 24) = v40;
    *(void *)(v43 + 32) = v42;
    *(unsigned char *)(v43 + 40) = 0;
    sub_100009BB4((uint64_t)v13, &qword_10002AF90);
    sub_100009AAC((uint64_t)&v77);
    char v44 = static Edge.Set.bottom.getter();
    if (*(unsigned char *)(v28 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      uint64_t v46 = v73;
      uint64_t v45 = v74;
      uint64_t v47 = v72;
      if (*(unsigned char *)(v28 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain();
        uint64_t v48 = sub_10000A254();
        uint64_t v49 = type metadata accessor for ClusterMetrics();
        uint64_t v50 = v49;
        uint64_t v51 = &off_100025610;
      }
      else
      {
        swift_retain();
        uint64_t v48 = sub_10000A288();
        uint64_t v49 = type metadata accessor for WidgetMetrics();
        uint64_t v50 = v49;
        uint64_t v51 = &off_1000255B0;
      }
      *((void *)&v78 + 1) = v49;
      *(void *)&long long v79 = v51;
      swift_release();
      *(void *)&long long v77 = v48;
    }
    else
    {
      swift_retain();
      uint64_t v52 = sub_10000A220();
      uint64_t v50 = type metadata accessor for ConsoleMetrics();
      uint64_t v51 = &off_100025670;
      *((void *)&v78 + 1) = v50;
      *(void *)&long long v79 = &off_100025670;
      swift_release();
      *(void *)&long long v77 = v52;
      uint64_t v46 = v73;
      uint64_t v45 = v74;
      uint64_t v47 = v72;
    }
    sub_100009A58(&v77, v50);
    ((void (__cdecl *)())v51[10])();
    EdgeInsets.init(_all:)();
    uint64_t v54 = v53;
    uint64_t v56 = v55;
    uint64_t v58 = v57;
    uint64_t v60 = v59;
    uint64_t v61 = v69;
    sub_100012164(v30, v69, &qword_10002AF80);
    uint64_t v62 = v61 + *(int *)(v70 + 36);
    *(unsigned char *)uint64_t v62 = v44;
    *(void *)(v62 + 8) = v54;
    *(void *)(v62 + 16) = v56;
    *(void *)(v62 + 24) = v58;
    *(void *)(v62 + 32) = v60;
    *(unsigned char *)(v62 + 40) = 0;
    sub_100009BB4(v30, &qword_10002AF80);
    sub_100009AAC((uint64_t)&v77);
    sub_100011C74(&qword_10002AF70, &qword_10002AF68, (void (*)(void))sub_100011CF4);
    uint64_t v63 = v71;
    View.allowsGaugeResizing(_:)();
    sub_100009BB4(v61, &qword_10002AF68);
    sub_10000D510();
    sub_10000D510();
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    (*(void (**)(uint64_t, char *, uint64_t))(v47 + 16))(v45, v63, v46);
    char v64 = (long long *)(v45 + *(int *)(sub_100009768(&qword_10002AF50) + 36));
    long long v65 = v78;
    *char v64 = v77;
    v64[1] = v65;
    v64[2] = v79;
    return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v63, v46);
  }
  else
  {
    type metadata accessor for LayoutConfiguration();
    sub_10000C508((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_10000E7D4()
{
  uint64_t v1 = sub_100009768(&qword_10002AAD8);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v23 = *(_OWORD *)(v0 + 16);
  id v5 = *((id *)&v23 + 1);
  uint64_t v6 = (void *)CAFChargingTimeObservable.observed.getter();
  sub_100009C50((uint64_t)&v23);
  unsigned __int8 v7 = [v6 remainingTimeInvalid];

  if (v7)
  {
    v22[0] = 2108717;
    v22[1] = 0xE300000000000000;
    id v8 = [self minutes];
    id v9 = [v8 symbol];

    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;

    v13._countAndFlagsBits = v10;
    v13._object = v12;
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
    return v22[0];
  }
  else
  {
    id v15 = [objc_allocWithZone((Class)NSDateComponentsFormatter) init];
    [v15 setUnitsStyle:1];
    [v15 setAllowedUnits:96];
    [v15 setZeroFormattingBehavior:1];
    id v16 = v5;
    dispatch thunk of CAFChargingTimeObservable.remainingTime.getter();
    sub_100009C50((uint64_t)&v23);
    Measurement.value.getter();
    double v18 = v17;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    id v19 = [v15 stringFromTimeInterval:v18];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
    else
    {

      return 0;
    }
  }
  return v14;
}

uint64_t sub_10000EA34@<X0>(long long *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for AccessoryCircularCapacityGaugeStyle();
  uint64_t v92 = *(void *)(v4 - 8);
  uint64_t v93 = v4;
  __chkstk_darwin(v4);
  uint64_t v91 = (char *)&v86 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_100009768(&qword_10002AF50);
  __chkstk_darwin(v90);
  unsigned __int8 v7 = (char *)&v86 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = sub_100009768(&qword_10002AF58);
  uint64_t v8 = *(void *)(v98 - 8);
  uint64_t v9 = __chkstk_darwin(v98);
  long long v101 = (char *)&v86 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  char v100 = (char *)&v86 - v11;
  id v12 = [self mainBundle];
  v117._object = (void *)0xE000000000000000;
  v13._countAndFlagsBits = 0x474E494752414843;
  v13._object = (void *)0xE800000000000000;
  v14.value._countAndFlagsBits = 0x656772616843;
  v14.value._object = (void *)0xE600000000000000;
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  v117._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v13, v14, (NSBundle)v12, v15, v117);

  uint64_t v16 = String.init(format:_:)();
  double v18 = v17;
  swift_bridgeObjectRelease();
  uint64_t v114 = v16;
  double v115 = v18;
  sub_100009A04();
  uint64_t v19 = Text.init<A>(_:)();
  uint64_t v96 = a1;
  uint64_t v22 = *((void *)a1 + 6);
  if (v22)
  {
    uint64_t v23 = v19;
    uint64_t v24 = v20;
    uint64_t v87 = v7;
    int v25 = *(unsigned __int8 *)(v22 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode);
    uint64_t v97 = v8;
    char v26 = v21;
    if (v25)
    {
      if (v25 == 1)
      {
        swift_retain();
        uint64_t v27 = sub_10000A254();
        uint64_t v28 = type metadata accessor for ClusterMetrics();
        uint64_t v29 = v28;
        uint64_t v30 = &off_100025610;
      }
      else
      {
        swift_retain();
        uint64_t v27 = sub_10000A288();
        uint64_t v28 = type metadata accessor for WidgetMetrics();
        uint64_t v29 = v28;
        uint64_t v30 = &off_1000255B0;
      }
    }
    else
    {
      swift_retain();
      uint64_t v27 = sub_10000A220();
      uint64_t v28 = type metadata accessor for ConsoleMetrics();
      uint64_t v29 = v28;
      uint64_t v30 = &off_100025670;
    }
    v116[3] = v28;
    v116[4] = v30;
    swift_release();
    v116[0] = v27;
    sub_100009A58(v116, v29);
    ((void (__cdecl *)())v30[5])();
    uint64_t v94 = Text.font(_:)();
    uint64_t v95 = v31;
    uint64_t v33 = v32;
    int v89 = v34;
    sub_100009A9C(v23, v24, v26 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    sub_100009AAC((uint64_t)v116);
    int v88 = static Edge.Set.top.getter();
    EdgeInsets.init(_all:)();
    uint64_t v36 = v35;
    uint64_t v38 = v37;
    uint64_t v40 = v39;
    uint64_t v42 = v41;
    uint64_t v43 = (uint64_t)v87;
    char v44 = v96;
    sub_10000DF8C((uint64_t)v87);
    uint64_t v45 = v91;
    AccessoryCircularCapacityGaugeStyle.init()();
    sub_100011B98();
    sub_10000C508(&qword_10002AFB8, (void (*)(uint64_t))&type metadata accessor for AccessoryCircularCapacityGaugeStyle);
    uint64_t v46 = v101;
    uint64_t v47 = v93;
    View.gaugeStyle<A>(_:)();
    (*(void (**)(char *, uint64_t))(v92 + 8))(v45, v47);
    sub_100009BB4(v43, &qword_10002AF50);
    uint64_t v48 = v97;
    uint64_t v49 = v98;
    (*(void (**)(char *, char *, uint64_t))(v97 + 32))(v100, v46, v98);
    uint64_t v50 = sub_10000E7D4();
    uint64_t v99 = v33;
    long long v86 = a2;
    if (v51)
    {
      uint64_t v52 = v50;
      uint64_t v53 = v51;
      id v54 = sub_10000F28C();
      if (v55)
      {
        uint64_t v56 = v55;
        uint64_t v57 = (uint64_t)v54;
        swift_getKeyPath();
        swift_getKeyPath();
        uint64_t v58 = v44;
        uint64_t v59 = v48;
        swift_retain();
        static Published.subscript.getter();
        swift_release();
        swift_release();
        swift_release();
        uint64_t v93 = v42;
        uint64_t v60 = v40;
        uint64_t v61 = v38;
        uint64_t v62 = v36;
        double v63 = v115 * 0.5 * 0.3;
        uint64_t v64 = static VerticalAlignment.center.getter();
        long long v65 = v58;
        uint64_t v49 = v98;
        sub_10001013C(v57, v56, v65, v52, v53, v104);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v102 = 0;
        memcpy(&v105[7], v104, 0x130uLL);
        LOBYTE(v56) = static Edge.Set.bottom.getter();
        EdgeInsets.init(_all:)();
        uint64_t v67 = v66;
        uint64_t v69 = v68;
        uint64_t v71 = v70;
        uint64_t v73 = v72;
        char v103 = 0;
        v106[0] = v64;
        uint64_t v48 = v59;
        *(double *)&v106[1] = v63;
        uint64_t v36 = v62;
        uint64_t v38 = v61;
        uint64_t v40 = v60;
        uint64_t v42 = v93;
        char v107 = 0;
        memcpy(v108, v105, 0x137uLL);
        v108[311] = v56;
        uint64_t v109 = v67;
        uint64_t v110 = v69;
        uint64_t v111 = v71;
        uint64_t v112 = v73;
        char v113 = 0;
        ConfigurationIntentResponseCode.rawValue.getter(v106);
LABEL_12:
        sub_100012698((uint64_t)v106, (uint64_t)&v114, &qword_10002B028);
        char v74 = v89 & 1;
        LODWORD(v96) = v89 & 1;
        uint64_t v75 = v48;
        uint64_t v76 = *(void (**)(char *, char *, uint64_t))(v48 + 16);
        long long v77 = v101;
        v76(v101, v100, v49);
        sub_100012698((uint64_t)&v114, (uint64_t)v104, &qword_10002B028);
        uint64_t v78 = v94;
        long long v79 = v86;
        uint64_t v80 = v99;
        *long long v86 = v94;
        v79[1] = v80;
        *((unsigned char *)v79 + 16) = v74;
        v79[3] = v95;
        *((unsigned char *)v79 + 32) = v88;
        v79[5] = v36;
        v79[6] = v38;
        v79[7] = v40;
        v79[8] = v42;
        *((unsigned char *)v79 + 72) = 0;
        uint64_t v81 = sub_100009768(&qword_10002B030);
        v76((char *)v79 + *(int *)(v81 + 48), v77, v49);
        uint64_t v82 = (uint64_t)v79 + *(int *)(v81 + 64);
        sub_100012698((uint64_t)v104, (uint64_t)v105, &qword_10002B028);
        sub_100012698((uint64_t)v105, v82, &qword_10002B028);
        uint64_t v83 = v99;
        LOBYTE(v79) = (_BYTE)v96;
        sub_100009BA4(v78, v99, (char)v96);
        swift_bridgeObjectRetain();
        sub_100012368((uint64_t)v105, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_10001221C);
        uint64_t v84 = *(void (**)(char *, uint64_t))(v75 + 8);
        v84(v100, v49);
        sub_100012698((uint64_t)v104, (uint64_t)v106, &qword_10002B028);
        sub_100012368((uint64_t)v106, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_10001240C);
        v84(v101, v49);
        sub_100009A9C(v78, v83, (char)v79);
        return swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
    }
    sub_1000121E0((uint64_t)v106);
    goto LABEL_12;
  }
  type metadata accessor for LayoutConfiguration();
  sub_10000C508((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

id sub_10000F28C()
{
  uint64_t v1 = sub_100009768(&qword_10002AAD0);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v20 = *v0;
  id v5 = *((id *)&v20 + 1);
  uint64_t v6 = (void *)CAFBatteryLevelObservable.observed.getter();
  sub_100009C50((uint64_t)&v20);
  unsigned __int8 v7 = [v6 batteryLevelInvalid];

  if (v7)
  {
    v19[0] = 2108717;
    v19[1] = 0xE300000000000000;
    id v8 = [self percent];
    id v9 = [v8 symbol];

    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v12 = v11;

    v13._countAndFlagsBits = v10;
    v13._object = v12;
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
    return (id)v19[0];
  }
  id v15 = [objc_allocWithZone((Class)NSMeasurementFormatter) init];
  id result = [v15 numberFormatter];
  if (result)
  {
    double v17 = result;
    [result setMaximumFractionDigits:2];

    [v15 setUnitOptions:1];
    id v18 = v5;
    dispatch thunk of CAFBatteryLevelObservable.batteryLevel.getter();
    sub_100009C50((uint64_t)&v20);
    sub_100009C7C(0, &qword_10002AAE8);
    uint64_t v14 = NSMeasurementFormatter.string<A>(from:)();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return (id)v14;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000F4D0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v48 = a2;
  uint64_t v3 = type metadata accessor for AccessoryCircularCapacityGaugeStyle();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_100009768(&qword_10002AF50);
  __chkstk_darwin(v50);
  id v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100009768(&qword_10002AF58);
  uint64_t v49 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  id v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v42 - v13;
  sub_10000DF8C((uint64_t)v8);
  AccessoryCircularCapacityGaugeStyle.init()();
  sub_100011B98();
  sub_10000C508(&qword_10002AFB8, (void (*)(uint64_t))&type metadata accessor for AccessoryCircularCapacityGaugeStyle);
  View.gaugeStyle<A>(_:)();
  id v15 = v6;
  uint64_t v16 = v9;
  uint64_t v17 = v49;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v15, v3);
  uint64_t v18 = a1;
  sub_100009BB4((uint64_t)v8, &qword_10002AF50);
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v14, v12, v16);
  uint64_t v19 = sub_10000E7D4();
  if (!v20) {
    goto LABEL_5;
  }
  uint64_t v21 = v19;
  unint64_t v22 = v20;
  id v23 = sub_10000F28C();
  if (!v24)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    sub_100012678((uint64_t)v55);
    goto LABEL_6;
  }
  uint64_t v25 = (uint64_t)v23;
  unint64_t v26 = v24;
  uint64_t v47 = static HorizontalAlignment.leading.getter();
  sub_100011020(v21, v22, v18, v25, v26, (uint64_t)v72);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v27 = v72[0];
  uint64_t v28 = v72[1];
  LOBYTE(v25) = v73;
  uint64_t v50 = (uint64_t)v14;
  uint64_t v29 = v75;
  LOBYTE(v26) = v76;
  long long v45 = v77;
  long long v46 = v74;
  long long v44 = v78;
  uint64_t v43 = v79;
  char v30 = static Edge.Set.bottom.getter();
  EdgeInsets.init(_all:)();
  v54[0] = 0;
  v53[0] = v25;
  char v52 = v26;
  char v51 = 0;
  v55[0] = v47;
  v55[1] = 0x3FF0000000000000;
  char v56 = 0;
  uint64_t v57 = v27;
  uint64_t v58 = v28;
  char v59 = v25;
  long long v60 = v46;
  uint64_t v61 = v29;
  uint64_t v14 = (char *)v50;
  char v62 = v26;
  long long v63 = v45;
  long long v64 = v44;
  uint64_t v65 = v43;
  char v66 = v30;
  uint64_t v67 = v31;
  uint64_t v68 = v32;
  uint64_t v69 = v33;
  uint64_t v70 = v34;
  char v71 = 0;
  ConfigurationIntentResponseCode.rawValue.getter(v55);
LABEL_6:
  sub_100012698((uint64_t)v55, (uint64_t)v72, &qword_10002B038);
  uint64_t v35 = v48;
  uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  v36(v12, v14, v16);
  sub_100012698((uint64_t)v72, (uint64_t)v53, &qword_10002B038);
  v36(v35, v12, v16);
  uint64_t v37 = sub_100009768(&qword_10002B040);
  uint64_t v38 = &v35[*(int *)(v37 + 48)];
  *(void *)uint64_t v38 = 0;
  v38[8] = 1;
  uint64_t v39 = (uint64_t)&v35[*(int *)(v37 + 64)];
  sub_100012698((uint64_t)v53, (uint64_t)v54, &qword_10002B038);
  sub_100012698((uint64_t)v54, v39, &qword_10002B038);
  sub_1000127F0((uint64_t)v54, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1000126FC);
  uint64_t v40 = *(void (**)(char *, uint64_t))(v17 + 8);
  v40(v14, v16);
  sub_100012698((uint64_t)v53, (uint64_t)v55, &qword_10002B038);
  sub_1000127F0((uint64_t)v55, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_100012864);
  return ((uint64_t (*)(char *, uint64_t))v40)(v12, v16);
}

uint64_t sub_10000F99C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  if (qword_10002A878 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = Image.init(systemName:)();
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    uint64_t v6 = v4;
    if (*(unsigned char *)(v5 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      if (*(unsigned char *)(v5 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain();
        uint64_t v7 = sub_10000A254();
        uint64_t v8 = type metadata accessor for ClusterMetrics();
        uint64_t v9 = v8;
        uint64_t v10 = &off_100025610;
      }
      else
      {
        swift_retain();
        uint64_t v7 = sub_10000A288();
        uint64_t v8 = type metadata accessor for WidgetMetrics();
        uint64_t v9 = v8;
        uint64_t v10 = &off_1000255B0;
      }
    }
    else
    {
      swift_retain();
      uint64_t v7 = sub_10000A220();
      uint64_t v8 = type metadata accessor for ConsoleMetrics();
      uint64_t v9 = v8;
      uint64_t v10 = &off_100025670;
    }
    v16[3] = v8;
    v16[4] = v10;
    swift_release();
    v16[0] = v7;
    sub_100009A58(v16, v9);
    sub_10000D510();
    uint64_t v12 = ((uint64_t (*)(uint64_t, _UNKNOWN **, double))v10[11])(v9, v10, v11 * 0.4);
    uint64_t KeyPath = swift_getKeyPath();
    sub_100009AAC((uint64_t)v16);
    uint64_t v14 = static Color.green.getter();
    uint64_t result = swift_getKeyPath();
    *a2 = v6;
    a2[1] = KeyPath;
    a2[2] = v12;
    a2[3] = result;
    a2[4] = v14;
  }
  else
  {
    type metadata accessor for LayoutConfiguration();
    sub_10000C508((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_10000FBB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v66 = a1;
  uint64_t v67 = a2;
  sub_100009A04();
  swift_bridgeObjectRetain();
  uint64_t v6 = Text.init<A>(_:)();
  uint64_t v9 = *(void *)(a3 + 48);
  if (v9)
  {
    uint64_t v10 = v6;
    uint64_t v11 = v7;
    char v12 = v8;
    uint64_t v63 = a3;
    uint64_t v65 = a4;
    if (*(unsigned char *)(v9 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      if (*(unsigned char *)(v9 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain();
        uint64_t v13 = sub_10000A254();
        uint64_t v14 = type metadata accessor for ClusterMetrics();
        uint64_t v15 = v14;
        uint64_t v16 = &off_100025610;
      }
      else
      {
        swift_retain();
        uint64_t v13 = sub_10000A288();
        uint64_t v14 = type metadata accessor for WidgetMetrics();
        uint64_t v15 = v14;
        uint64_t v16 = &off_1000255B0;
      }
    }
    else
    {
      swift_retain();
      uint64_t v13 = sub_10000A220();
      uint64_t v14 = type metadata accessor for ConsoleMetrics();
      uint64_t v15 = v14;
      uint64_t v16 = &off_100025670;
    }
    uint64_t v68 = v14;
    uint64_t v69 = v16;
    swift_release();
    uint64_t v66 = v13;
    sub_100009A58(&v66, v15);
    ((void (__cdecl *)())v16[6])();
    uint64_t v17 = Text.font(_:)();
    uint64_t v19 = v18;
    char v21 = v20;
    sub_100009A9C(v10, v11, v12 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    sub_100009AAC((uint64_t)&v66);
    long long v70 = *(_OWORD *)(v63 + 16);
    id v22 = *((id *)&v70 + 1);
    id v23 = (void *)CAFChargingTimeObservable.observed.getter();
    sub_100009C50((uint64_t)&v70);
    unsigned int v24 = [v23 remainingTimeInvalid];

    if (v24) {
      static Color.secondary.getter();
    }
    else {
      static Color.primary.getter();
    }
    uint64_t v25 = Text.foregroundColor(_:)();
    uint64_t v61 = v26;
    char v60 = v27;
    uint64_t v29 = v28;
    swift_release();
    sub_100009A9C(v17, v19, v21 & 1);
    swift_bridgeObjectRelease();
    id v30 = [self mainBundle];
    v71._object = (void *)0xE000000000000000;
    v31._countAndFlagsBits = 0x4D45525F454D4954;
    v31._object = (void *)0xEE00474E494E4941;
    v32.value._countAndFlagsBits = 0x656772616843;
    v32.value._object = (void *)0xE600000000000000;
    v33._countAndFlagsBits = 0;
    v33._object = (void *)0xE000000000000000;
    v71._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v31, v32, (NSBundle)v30, v33, v71);

    uint64_t v34 = String.init(format:_:)();
    uint64_t v36 = v35;
    swift_bridgeObjectRelease();
    uint64_t v66 = v34;
    uint64_t v67 = v36;
    uint64_t v37 = Text.init<A>(_:)();
    uint64_t v39 = v38;
    char v41 = v40;
    int v42 = *(unsigned __int8 *)(v9 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode);
    uint64_t v64 = v29;
    uint64_t v62 = v25;
    if (v42 == 2)
    {
      swift_retain();
      uint64_t v43 = sub_10000A288();
      uint64_t v44 = type metadata accessor for WidgetMetrics();
      uint64_t v45 = v44;
      long long v46 = &off_1000255B0;
    }
    else if (v42 == 1)
    {
      swift_retain();
      uint64_t v43 = sub_10000A254();
      uint64_t v44 = type metadata accessor for ClusterMetrics();
      uint64_t v45 = v44;
      long long v46 = &off_100025610;
    }
    else
    {
      swift_retain();
      uint64_t v43 = sub_10000A220();
      uint64_t v44 = type metadata accessor for ConsoleMetrics();
      uint64_t v45 = v44;
      long long v46 = &off_100025670;
    }
    uint64_t v68 = v44;
    uint64_t v69 = v46;
    swift_release();
    uint64_t v66 = v43;
    sub_100009A58(&v66, v45);
    ((void (__cdecl *)())v46[7])();
    uint64_t v47 = Text.font(_:)();
    uint64_t v49 = v48;
    char v51 = v50 & 1;
    sub_100009A9C(v37, v39, v41 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    sub_100009AAC((uint64_t)&v66);
    static Color.secondary.getter();
    uint64_t v52 = Text.foregroundColor(_:)();
    uint64_t v54 = v53;
    char v56 = v55;
    uint64_t v58 = v57;
    swift_release();
    sub_100009A9C(v47, v49, v51);
    swift_bridgeObjectRelease();
    LOBYTE(v66) = v60 & 1;
    *(void *)uint64_t v65 = v62;
    *(void *)(v65 + 8) = v61;
    *(unsigned char *)(v65 + 16) = v60 & 1;
    *(void *)(v65 + 24) = v64;
    *(void *)(v65 + 32) = v52;
    *(void *)(v65 + 40) = v54;
    *(unsigned char *)(v65 + 48) = v56 & 1;
    *(void *)(v65 + 56) = v58;
    sub_100009BA4(v62, v61, v60 & 1);
    swift_bridgeObjectRetain();
    sub_100009BA4(v52, v54, v56 & 1);
    swift_bridgeObjectRetain();
    sub_100009A9C(v52, v54, v56 & 1);
    swift_bridgeObjectRelease();
    sub_100009A9C(v62, v61, v66);
    return swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for LayoutConfiguration();
    sub_10000C508((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001013C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v13 = static HorizontalAlignment.center.getter();
  sub_100010410(a1, a2, a3, (uint64_t)v15);
  *(_OWORD *)&v16[71] = v15[4];
  *(_OWORD *)&v16[87] = v15[5];
  *(_OWORD *)&v16[103] = v15[6];
  *(_OWORD *)&v16[119] = v15[7];
  *(_OWORD *)&v16[7] = v15[0];
  *(_OWORD *)&v16[23] = v15[1];
  *(_OWORD *)&v16[39] = v15[2];
  char v17 = 1;
  *(_OWORD *)&v16[55] = v15[3];
  uint64_t v11 = static HorizontalAlignment.center.getter();
  sub_100010A10(a4, a5, (uint64_t)a3, (uint64_t)v18);
  *(_OWORD *)&v20[71] = v18[4];
  *(_OWORD *)&v20[87] = v18[5];
  *(_OWORD *)&v20[103] = v18[6];
  *(_OWORD *)&v20[119] = v19;
  *(_OWORD *)&v20[7] = v18[0];
  *(_OWORD *)&v20[23] = v18[1];
  *(_OWORD *)&v20[39] = v18[2];
  *(_OWORD *)&v20[55] = v18[3];
  *(_OWORD *)&v23[81] = *(_OWORD *)&v16[80];
  *(_OWORD *)&v23[97] = *(_OWORD *)&v16[96];
  *(_OWORD *)&v23[113] = *(_OWORD *)&v16[112];
  *(_OWORD *)&v23[17] = *(_OWORD *)&v16[16];
  *(_OWORD *)&v23[33] = *(_OWORD *)&v16[32];
  *(_OWORD *)&v23[49] = *(_OWORD *)&v16[48];
  *(_OWORD *)&v23[65] = *(_OWORD *)&v16[64];
  *(_OWORD *)&v23[1] = *(_OWORD *)v16;
  *(_OWORD *)&v25[81] = *(_OWORD *)&v20[80];
  *(_OWORD *)&v25[97] = *(_OWORD *)&v20[96];
  *(_OWORD *)&v25[113] = *(_OWORD *)&v20[112];
  *(_OWORD *)&v25[17] = *(_OWORD *)&v20[16];
  *(_OWORD *)&v25[33] = *(_OWORD *)&v20[32];
  long long v22 = (unint64_t)v13;
  v23[0] = 1;
  v24[0] = v11;
  v24[1] = 0;
  v25[0] = 1;
  *(_OWORD *)&v25[49] = *(_OWORD *)&v20[48];
  *(_OWORD *)&v25[65] = *(_OWORD *)&v20[64];
  *(_OWORD *)&v25[1] = *(_OWORD *)v20;
  __src[6] = *(_OWORD *)&v23[80];
  __src[7] = *(_OWORD *)&v23[96];
  __src[8] = *(_OWORD *)&v23[112];
  void __src[2] = *(_OWORD *)&v23[16];
  __src[3] = *(_OWORD *)&v23[32];
  __src[4] = *(_OWORD *)&v23[48];
  __src[5] = *(_OWORD *)&v23[64];
  __src[0] = (unint64_t)v13;
  __src[1] = *(_OWORD *)v23;
  *(_OWORD *)((char *)&__src[16] + 8) = *(_OWORD *)&v25[96];
  *(_OWORD *)((char *)&__src[17] + 8) = *(_OWORD *)&v25[112];
  *(_OWORD *)((char *)&__src[15] + 8) = *(_OWORD *)&v25[80];
  *(_OWORD *)((char *)&__src[11] + 8) = *(_OWORD *)&v25[16];
  *(_OWORD *)((char *)&__src[12] + 8) = *(_OWORD *)&v25[32];
  *(_OWORD *)((char *)&__src[13] + 8) = *(_OWORD *)&v25[48];
  *(_OWORD *)((char *)&__src[14] + 8) = *(_OWORD *)&v25[64];
  *(_OWORD *)((char *)&__src[9] + 8) = (unint64_t)v11;
  char v21 = 1;
  *(void *)&v23[128] = *(void *)&v16[127];
  *(void *)&v25[128] = *((void *)&v19 + 1);
  *(void *)&__src[9] = *(void *)&v16[127];
  *((void *)&__src[18] + 1) = *((void *)&v19 + 1);
  *(_OWORD *)((char *)&__src[10] + 8) = *(_OWORD *)v25;
  memcpy(a6, __src, 0x130uLL);
  long long v34 = *(_OWORD *)&v20[80];
  long long v35 = *(_OWORD *)&v20[96];
  *(_OWORD *)uint64_t v36 = *(_OWORD *)&v20[112];
  long long v30 = *(_OWORD *)&v20[16];
  long long v31 = *(_OWORD *)&v20[32];
  long long v32 = *(_OWORD *)&v20[48];
  long long v33 = *(_OWORD *)&v20[64];
  v27[0] = v11;
  v27[1] = 0;
  char v28 = 1;
  *(void *)&v36[15] = *(void *)&v20[127];
  long long v29 = *(_OWORD *)v20;
  sub_100012558((uint64_t)&v22);
  sub_100012558((uint64_t)v24);
  sub_1000125E8((uint64_t)v27);
  long long v44 = *(_OWORD *)&v16[80];
  long long v45 = *(_OWORD *)&v16[96];
  *(_OWORD *)long long v46 = *(_OWORD *)&v16[112];
  long long v40 = *(_OWORD *)&v16[16];
  long long v41 = *(_OWORD *)&v16[32];
  long long v42 = *(_OWORD *)&v16[48];
  long long v43 = *(_OWORD *)&v16[64];
  v37[0] = v13;
  v37[1] = 0;
  char v38 = 1;
  *(void *)&v46[15] = *(void *)&v16[127];
  long long v39 = *(_OWORD *)v16;
  return sub_1000125E8((uint64_t)v37);
}

uint64_t sub_100010410@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v76 = a1;
  uint64_t v77 = a2;
  sub_100009A04();
  swift_bridgeObjectRetain();
  uint64_t v6 = Text.init<A>(_:)();
  uint64_t v9 = *((void *)a3 + 6);
  if (v9)
  {
    uint64_t v10 = v6;
    uint64_t v11 = v7;
    char v12 = v8;
    if (*(unsigned char *)(v9 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      if (*(unsigned char *)(v9 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain();
        uint64_t v13 = sub_10000A254();
        uint64_t v14 = type metadata accessor for ClusterMetrics();
        uint64_t v15 = v14;
        uint64_t v16 = &off_100025610;
      }
      else
      {
        swift_retain();
        uint64_t v13 = sub_10000A288();
        uint64_t v14 = type metadata accessor for WidgetMetrics();
        uint64_t v15 = v14;
        uint64_t v16 = &off_1000255B0;
      }
    }
    else
    {
      swift_retain();
      uint64_t v13 = sub_10000A220();
      uint64_t v14 = type metadata accessor for ConsoleMetrics();
      uint64_t v15 = v14;
      uint64_t v16 = &off_100025670;
    }
    uint64_t v78 = v14;
    uint64_t v79 = v16;
    swift_release();
    uint64_t v76 = v13;
    sub_100009A58(&v76, v15);
    ((void (__cdecl *)())v16[6])();
    uint64_t v17 = Text.font(_:)();
    uint64_t v69 = v18;
    char v66 = v19;
    uint64_t v21 = v20;
    sub_100009A9C(v10, v11, v12 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    sub_100009AAC((uint64_t)&v76);
    char v22 = static Edge.Set.bottom.getter();
    EdgeInsets.init(_all:)();
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    long long v80 = *a3;
    id v31 = *((id *)&v80 + 1);
    long long v32 = (void *)CAFBatteryLevelObservable.observed.getter();
    sub_100009C50((uint64_t)&v80);
    unsigned int v33 = [v32 batteryLevelInvalid];

    if (v33) {
      uint64_t v34 = static Color.secondary.getter();
    }
    else {
      uint64_t v34 = static Color.primary.getter();
    }
    uint64_t v35 = v34;
    uint64_t KeyPath = swift_getKeyPath();
    id v36 = [self mainBundle];
    v81._object = (void *)0xE000000000000000;
    v37._countAndFlagsBits = 0x454752414843;
    v37._object = (void *)0xE600000000000000;
    v38.value._countAndFlagsBits = 0x656772616843;
    v38.value._object = (void *)0xE600000000000000;
    v39._countAndFlagsBits = 0;
    v39._object = (void *)0xE000000000000000;
    v81._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v37, v38, (NSBundle)v36, v39, v81);

    uint64_t v40 = String.init(format:_:)();
    uint64_t v42 = v41;
    swift_bridgeObjectRelease();
    uint64_t v76 = v40;
    uint64_t v77 = v42;
    uint64_t v43 = Text.init<A>(_:)();
    uint64_t v45 = v44;
    char v47 = v46;
    int v48 = *(unsigned __int8 *)(v9 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode);
    uint64_t v70 = v17;
    uint64_t v71 = v21;
    uint64_t v68 = v35;
    if (v48 == 2)
    {
      swift_retain();
      uint64_t v49 = sub_10000A288();
      uint64_t v50 = type metadata accessor for WidgetMetrics();
      uint64_t v51 = v50;
      uint64_t v52 = &off_1000255B0;
    }
    else if (v48 == 1)
    {
      swift_retain();
      uint64_t v49 = sub_10000A254();
      uint64_t v50 = type metadata accessor for ClusterMetrics();
      uint64_t v51 = v50;
      uint64_t v52 = &off_100025610;
    }
    else
    {
      swift_retain();
      uint64_t v49 = sub_10000A220();
      uint64_t v50 = type metadata accessor for ConsoleMetrics();
      uint64_t v51 = v50;
      uint64_t v52 = &off_100025670;
    }
    uint64_t v78 = v50;
    uint64_t v79 = v52;
    swift_release();
    uint64_t v76 = v49;
    sub_100009A58(&v76, v51);
    ((void (__cdecl *)())v52[7])();
    uint64_t v53 = Text.font(_:)();
    uint64_t v55 = v54;
    char v57 = v56 & 1;
    sub_100009A9C(v43, v45, v47 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    sub_100009AAC((uint64_t)&v76);
    static Color.secondary.getter();
    uint64_t v58 = Text.foregroundColor(_:)();
    uint64_t v60 = v59;
    char v62 = v61;
    uint64_t v64 = v63;
    swift_release();
    sub_100009A9C(v53, v55, v57);
    swift_bridgeObjectRelease();
    *(_DWORD *)(a4 + 17) = *(_DWORD *)v75;
    *(_DWORD *)(a4 + 20) = *(_DWORD *)&v75[3];
    *(_DWORD *)(a4 + 33) = *(_DWORD *)v74;
    *(_DWORD *)(a4 + 36) = *(_DWORD *)&v74[3];
    *(_DWORD *)(a4 + 73) = *(_DWORD *)v73;
    *(_DWORD *)(a4 + 76) = *(_DWORD *)&v73[3];
    *(_DWORD *)(a4 + 116) = *(_DWORD *)&v72[3];
    *(_DWORD *)(a4 + 113) = *(_DWORD *)v72;
    *(void *)a4 = v70;
    *(void *)(a4 + 8) = v69;
    *(unsigned char *)(a4 + 16) = v66 & 1;
    *(void *)(a4 + 24) = v71;
    *(unsigned char *)(a4 + 32) = v22;
    *(void *)(a4 + 40) = v24;
    *(void *)(a4 + 48) = v26;
    *(void *)(a4 + 56) = v28;
    *(void *)(a4 + 64) = v30;
    *(unsigned char *)(a4 + 72) = 0;
    *(void *)(a4 + 80) = KeyPath;
    *(void *)(a4 + 88) = v68;
    *(void *)(a4 + 96) = v58;
    *(void *)(a4 + 104) = v60;
    *(unsigned char *)(a4 + 112) = v62 & 1;
    *(void *)(a4 + 120) = v64;
    sub_100009BA4(v70, v69, v66 & 1);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_100009BA4(v58, v60, v62 & 1);
    swift_bridgeObjectRetain();
    sub_100009A9C(v58, v60, v62 & 1);
    swift_bridgeObjectRelease();
    sub_100009A9C(v70, v69, v66 & 1);
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for LayoutConfiguration();
    sub_10000C508((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_100010A10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v76 = a1;
  uint64_t v77 = a2;
  sub_100009A04();
  swift_bridgeObjectRetain();
  uint64_t v6 = Text.init<A>(_:)();
  uint64_t v9 = *(void *)(a3 + 48);
  if (v9)
  {
    uint64_t v10 = v6;
    uint64_t v11 = v7;
    char v12 = v8;
    if (*(unsigned char *)(v9 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      if (*(unsigned char *)(v9 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain();
        uint64_t v13 = sub_10000A254();
        uint64_t v14 = type metadata accessor for ClusterMetrics();
        uint64_t v15 = v14;
        uint64_t v16 = &off_100025610;
      }
      else
      {
        swift_retain();
        uint64_t v13 = sub_10000A288();
        uint64_t v14 = type metadata accessor for WidgetMetrics();
        uint64_t v15 = v14;
        uint64_t v16 = &off_1000255B0;
      }
    }
    else
    {
      swift_retain();
      uint64_t v13 = sub_10000A220();
      uint64_t v14 = type metadata accessor for ConsoleMetrics();
      uint64_t v15 = v14;
      uint64_t v16 = &off_100025670;
    }
    uint64_t v78 = v14;
    uint64_t v79 = v16;
    swift_release();
    uint64_t v76 = v13;
    sub_100009A58(&v76, v15);
    ((void (__cdecl *)())v16[6])();
    uint64_t v17 = Text.font(_:)();
    uint64_t v69 = v18;
    char v66 = v19;
    uint64_t v21 = v20;
    sub_100009A9C(v10, v11, v12 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    sub_100009AAC((uint64_t)&v76);
    char v22 = static Edge.Set.bottom.getter();
    EdgeInsets.init(_all:)();
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    long long v80 = *(_OWORD *)(a3 + 16);
    id v31 = *((id *)&v80 + 1);
    long long v32 = (void *)CAFChargingTimeObservable.observed.getter();
    sub_100009C50((uint64_t)&v80);
    unsigned int v33 = [v32 remainingTimeInvalid];

    if (v33) {
      uint64_t v34 = static Color.secondary.getter();
    }
    else {
      uint64_t v34 = static Color.primary.getter();
    }
    uint64_t v35 = v34;
    uint64_t KeyPath = swift_getKeyPath();
    id v36 = [self mainBundle];
    v81._object = (void *)0xE000000000000000;
    v37._countAndFlagsBits = 0x4D45525F454D4954;
    v37._object = (void *)0xEE00474E494E4941;
    v38.value._countAndFlagsBits = 0x656772616843;
    v38.value._object = (void *)0xE600000000000000;
    v39._countAndFlagsBits = 0;
    v39._object = (void *)0xE000000000000000;
    v81._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v37, v38, (NSBundle)v36, v39, v81);

    uint64_t v40 = String.init(format:_:)();
    uint64_t v42 = v41;
    swift_bridgeObjectRelease();
    uint64_t v76 = v40;
    uint64_t v77 = v42;
    uint64_t v43 = Text.init<A>(_:)();
    uint64_t v45 = v44;
    char v47 = v46;
    int v48 = *(unsigned __int8 *)(v9 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode);
    uint64_t v70 = v17;
    uint64_t v71 = v21;
    uint64_t v68 = v35;
    if (v48 == 2)
    {
      swift_retain();
      uint64_t v49 = sub_10000A288();
      uint64_t v50 = type metadata accessor for WidgetMetrics();
      uint64_t v51 = v50;
      uint64_t v52 = &off_1000255B0;
    }
    else if (v48 == 1)
    {
      swift_retain();
      uint64_t v49 = sub_10000A254();
      uint64_t v50 = type metadata accessor for ClusterMetrics();
      uint64_t v51 = v50;
      uint64_t v52 = &off_100025610;
    }
    else
    {
      swift_retain();
      uint64_t v49 = sub_10000A220();
      uint64_t v50 = type metadata accessor for ConsoleMetrics();
      uint64_t v51 = v50;
      uint64_t v52 = &off_100025670;
    }
    uint64_t v78 = v50;
    uint64_t v79 = v52;
    swift_release();
    uint64_t v76 = v49;
    sub_100009A58(&v76, v51);
    ((void (__cdecl *)())v52[7])();
    uint64_t v53 = Text.font(_:)();
    uint64_t v55 = v54;
    char v57 = v56 & 1;
    sub_100009A9C(v43, v45, v47 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    sub_100009AAC((uint64_t)&v76);
    static Color.secondary.getter();
    uint64_t v58 = Text.foregroundColor(_:)();
    uint64_t v60 = v59;
    char v62 = v61;
    uint64_t v64 = v63;
    swift_release();
    sub_100009A9C(v53, v55, v57);
    swift_bridgeObjectRelease();
    *(_DWORD *)(a4 + 17) = *(_DWORD *)v75;
    *(_DWORD *)(a4 + 20) = *(_DWORD *)&v75[3];
    *(_DWORD *)(a4 + 33) = *(_DWORD *)v74;
    *(_DWORD *)(a4 + 36) = *(_DWORD *)&v74[3];
    *(_DWORD *)(a4 + 73) = *(_DWORD *)v73;
    *(_DWORD *)(a4 + 76) = *(_DWORD *)&v73[3];
    *(_DWORD *)(a4 + 116) = *(_DWORD *)&v72[3];
    *(_DWORD *)(a4 + 113) = *(_DWORD *)v72;
    *(void *)a4 = v70;
    *(void *)(a4 + 8) = v69;
    *(unsigned char *)(a4 + 16) = v66 & 1;
    *(void *)(a4 + 24) = v71;
    *(unsigned char *)(a4 + 32) = v22;
    *(void *)(a4 + 40) = v24;
    *(void *)(a4 + 48) = v26;
    *(void *)(a4 + 56) = v28;
    *(void *)(a4 + 64) = v30;
    *(unsigned char *)(a4 + 72) = 0;
    *(void *)(a4 + 80) = KeyPath;
    *(void *)(a4 + 88) = v68;
    *(void *)(a4 + 96) = v58;
    *(void *)(a4 + 104) = v60;
    *(unsigned char *)(a4 + 112) = v62 & 1;
    *(void *)(a4 + 120) = v64;
    sub_100009BA4(v70, v69, v66 & 1);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_100009BA4(v58, v60, v62 & 1);
    swift_bridgeObjectRetain();
    sub_100009A9C(v58, v60, v62 & 1);
    swift_bridgeObjectRelease();
    sub_100009A9C(v70, v69, v66 & 1);
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for LayoutConfiguration();
    sub_10000C508((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_100011020@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v101 = a1;
  unint64_t v102 = a2;
  sub_100009A04();
  swift_bridgeObjectRetain();
  uint64_t v9 = Text.init<A>(_:)();
  uint64_t v12 = *(void *)(a3 + 48);
  if (v12)
  {
    uint64_t v13 = v9;
    uint64_t v14 = v10;
    char v15 = v11;
    uint64_t v98 = a6;
    unint64_t v91 = a5;
    uint64_t v93 = (long long *)a3;
    if (*(unsigned char *)(v12 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      if (*(unsigned char *)(v12 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain();
        uint64_t v16 = sub_10000A254();
        uint64_t v17 = type metadata accessor for ClusterMetrics();
        uint64_t v18 = v17;
        char v19 = &off_100025610;
      }
      else
      {
        swift_retain();
        uint64_t v16 = sub_10000A288();
        uint64_t v17 = type metadata accessor for WidgetMetrics();
        uint64_t v18 = v17;
        char v19 = &off_1000255B0;
      }
    }
    else
    {
      swift_retain();
      uint64_t v16 = sub_10000A220();
      uint64_t v17 = type metadata accessor for ConsoleMetrics();
      uint64_t v18 = v17;
      char v19 = &off_100025670;
    }
    uint64_t v103 = v17;
    uint64_t v104 = v19;
    swift_release();
    uint64_t v101 = v16;
    sub_100009A58(&v101, v18);
    ((void (__cdecl *)())v19[6])();
    char v20 = v15 & 1;
    uint64_t v21 = Text.font(_:)();
    uint64_t v23 = v22;
    char v25 = v24 & 1;
    sub_100009A9C(v13, v14, v20);
    swift_release();
    swift_bridgeObjectRelease();
    sub_100009AAC((uint64_t)&v101);
    static Color.secondary.getter();
    uint64_t v26 = Text.foregroundColor(_:)();
    uint64_t v100 = v27;
    char v95 = v28;
    uint64_t v97 = v29;
    swift_release();
    sub_100009A9C(v21, v23, v25);
    swift_bridgeObjectRelease();
    uint64_t v101 = a4;
    unint64_t v102 = v91;
    swift_bridgeObjectRetain();
    uint64_t v30 = Text.init<A>(_:)();
    uint64_t v32 = v31;
    char v34 = v33;
    uint64_t v96 = v26;
    int v88 = *(unsigned __int8 *)(v12 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode);
    if (*(unsigned char *)(v12 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      if (*(unsigned char *)(v12 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain();
        uint64_t v35 = sub_10000A254();
        uint64_t v36 = type metadata accessor for ClusterMetrics();
        uint64_t v37 = v36;
        Swift::String_optional v38 = &off_100025610;
      }
      else
      {
        swift_retain();
        uint64_t v35 = sub_10000A288();
        uint64_t v36 = type metadata accessor for WidgetMetrics();
        uint64_t v37 = v36;
        Swift::String_optional v38 = &off_1000255B0;
      }
    }
    else
    {
      swift_retain();
      uint64_t v35 = sub_10000A220();
      uint64_t v36 = type metadata accessor for ConsoleMetrics();
      uint64_t v37 = v36;
      Swift::String_optional v38 = &off_100025670;
    }
    uint64_t v103 = v36;
    uint64_t v104 = v38;
    swift_release();
    uint64_t v101 = v35;
    sub_100009A58(&v101, v37);
    ((void (__cdecl *)())v38[8])();
    uint64_t v39 = Text.font(_:)();
    uint64_t v41 = v40;
    char v43 = v42;
    sub_100009A9C(v30, v32, v34 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    sub_100009AAC((uint64_t)&v101);
    long long v106 = *v93;
    id v44 = *((id *)&v106 + 1);
    uint64_t v45 = (void *)CAFBatteryLevelObservable.observed.getter();
    sub_100009C50((uint64_t)&v106);
    unsigned int v46 = [v45 batteryLevelInvalid];

    if (v46) {
      static Color.secondary.getter();
    }
    else {
      static Color.primary.getter();
    }
    char v47 = v43 & 1;
    uint64_t v48 = Text.foregroundColor(_:)();
    uint64_t v50 = v49;
    char v52 = v51;
    uint64_t v92 = v53;
    swift_release();
    sub_100009A9C(v39, v41, v47);
    swift_bridgeObjectRelease();
    long long v105 = v93[2];
    uint64_t v54 = (void *)*((void *)&v105 + 1);
    swift_getKeyPath();
    swift_getKeyPath();
    id v55 = v54;
    static Published.subscript.getter();
    swift_release();
    swift_release();
    sub_100009C50((uint64_t)&v105);
    uint64_t v57 = v101;
    unint64_t v56 = v102;
    swift_bridgeObjectRelease();
    uint64_t v58 = HIBYTE(v56) & 0xF;
    if ((v56 & 0x2000000000000000) == 0) {
      uint64_t v58 = v57 & 0xFFFFFFFFFFFFLL;
    }
    if (v58)
    {
      uint64_t v87 = v48;
      swift_getKeyPath();
      swift_getKeyPath();
      id v59 = v55;
      static Published.subscript.getter();
      swift_release();
      swift_release();
      sub_100009C50((uint64_t)&v105);
      uint64_t v60 = Text.init<A>(_:)();
      uint64_t v62 = v61;
      char v64 = v63;
      char v86 = v52;
      if (v88)
      {
        swift_retain();
        if (v88 == 1)
        {
          uint64_t v65 = sub_10000A254();
          uint64_t v66 = type metadata accessor for ClusterMetrics();
          uint64_t v67 = v66;
          uint64_t v68 = &off_100025610;
        }
        else
        {
          uint64_t v65 = sub_10000A288();
          uint64_t v66 = type metadata accessor for WidgetMetrics();
          uint64_t v67 = v66;
          uint64_t v68 = &off_1000255B0;
        }
      }
      else
      {
        swift_retain();
        uint64_t v65 = sub_10000A220();
        uint64_t v66 = type metadata accessor for ConsoleMetrics();
        uint64_t v67 = v66;
        uint64_t v68 = &off_100025670;
      }
      uint64_t v103 = v66;
      uint64_t v104 = v68;
      swift_release();
      uint64_t v101 = v65;
      sub_100009A58(&v101, v67);
      ((void (__cdecl *)())v68[7])();
      char v75 = v64 & 1;
      uint64_t v76 = Text.font(_:)();
      uint64_t v78 = v77;
      char v80 = v79 & 1;
      sub_100009A9C(v60, v62, v75);
      swift_release();
      swift_bridgeObjectRelease();
      sub_100009AAC((uint64_t)&v101);
      static Color.secondary.getter();
      uint64_t v99 = Text.foregroundColor(_:)();
      uint64_t v94 = v81;
      char v83 = v82;
      uint64_t v89 = v84;
      swift_release();
      uint64_t v69 = v83 & 1;
      sub_100009A9C(v76, v78, v80);
      swift_bridgeObjectRelease();
      uint64_t v71 = v97;
      uint64_t v70 = v98;
      uint64_t v72 = v100;
      uint64_t v74 = v92;
      uint64_t v73 = v87;
      char v52 = v86;
    }
    else
    {
      uint64_t v99 = 0;
      uint64_t v94 = 0;
      uint64_t v69 = 0;
      uint64_t v89 = 0;
      uint64_t v71 = v97;
      uint64_t v70 = v98;
      uint64_t v72 = v100;
      uint64_t v73 = v48;
      uint64_t v74 = v92;
    }
    LOBYTE(v101) = v95 & 1;
    *(void *)uint64_t v70 = v96;
    *(void *)(v70 + 8) = v72;
    *(unsigned char *)(v70 + 16) = v95 & 1;
    *(void *)(v70 + 24) = v71;
    *(void *)(v70 + 32) = v73;
    *(void *)(v70 + 40) = v50;
    *(unsigned char *)(v70 + 48) = v52 & 1;
    *(void *)(v70 + 56) = v74;
    *(void *)(v70 + 64) = v99;
    *(void *)(v70 + 72) = v94;
    *(void *)(v70 + 80) = v69;
    *(void *)(v70 + 88) = v89;
    sub_100009BA4(v96, v72, v95 & 1);
    swift_bridgeObjectRetain();
    sub_100009BA4(v73, v50, v52 & 1);
    swift_bridgeObjectRetain();
    sub_1000127AC(v99, v94, v69, v89);
    sub_100012914(v99, v94, v69, v89);
    sub_100009A9C(v73, v50, v52 & 1);
    swift_bridgeObjectRelease();
    sub_100009A9C(v96, v100, v101);
    return swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for LayoutConfiguration();
    sub_10000C508((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_1000117F8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C864(a1);
}

unint64_t sub_10001183C()
{
  unint64_t result = qword_10002AEE8;
  if (!qword_10002AEE8)
  {
    sub_100006364(&qword_10002AE98);
    sub_10000A08C(&qword_10002AEF0, &qword_10002AE90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AEE8);
  }
  return result;
}

uint64_t sub_1000118DC()
{
  return sub_100011C74(&qword_10002AEF8, &qword_10002AE80, (void (*)(void))sub_100011904);
}

uint64_t sub_100011904()
{
  return sub_100011C74(&qword_10002AF00, &qword_10002AE78, (void (*)(void))sub_10001192C);
}

unint64_t sub_10001192C()
{
  unint64_t result = qword_10002AF08;
  if (!qword_10002AF08)
  {
    sub_100006364(&qword_10002AE70);
    sub_10000A08C(&qword_10002AEF0, &qword_10002AE90);
    sub_1000119CC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AF08);
  }
  return result;
}

unint64_t sub_1000119CC()
{
  unint64_t result = qword_10002AF10;
  if (!qword_10002AF10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AF10);
  }
  return result;
}

unint64_t sub_100011A20()
{
  unint64_t result = qword_10002AF28;
  if (!qword_10002AF28)
  {
    sub_100006364(&qword_10002AED8);
    sub_10000A08C(&qword_10002AF30, &qword_10002AEC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AF28);
  }
  return result;
}

unint64_t sub_100011AC0()
{
  unint64_t result = qword_10002AF38;
  if (!qword_10002AF38)
  {
    sub_100006364(&qword_10002AEB0);
    sub_10000A08C(&qword_10002AF18, &qword_10002AEB8);
    sub_1000129B0(&qword_10002AF20, &qword_10002AEA0, (void (*)(void))sub_10001183C, (void (*)(void))sub_1000118DC);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AF38);
  }
  return result;
}

unint64_t sub_100011B98()
{
  unint64_t result = qword_10002AF60;
  if (!qword_10002AF60)
  {
    sub_100006364(&qword_10002AF50);
    sub_100006364(&qword_10002AF68);
    sub_100011C74(&qword_10002AF70, &qword_10002AF68, (void (*)(void))sub_100011CF4);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AF60);
  }
  return result;
}

uint64_t sub_100011C74(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006364(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100011CF4()
{
  return sub_100011C74(&qword_10002AF78, &qword_10002AF80, (void (*)(void))sub_100011D1C);
}

unint64_t sub_100011D1C()
{
  unint64_t result = qword_10002AF88;
  if (!qword_10002AF88)
  {
    sub_100006364(&qword_10002AF90);
    sub_10000A08C(&qword_10002AF98, &qword_10002AFA0);
    sub_10000A08C(&qword_10002AFA8, &qword_10002AFB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AF88);
  }
  return result;
}

double sub_100011DE0(uint64_t a1)
{
  *(unsigned char *)(a1 + 128) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_100011DFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  if (a7)
  {
    sub_100009BA4(a4, a5, a6 & 1);
    swift_bridgeObjectRetain();
    sub_100009BA4(a8, a9, a10 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_100011E80(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 128);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), v4);
  return a1;
}

uint64_t sub_100011EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  if (a7)
  {
    sub_100009A9C(a4, a5, a6 & 1);
    swift_bridgeObjectRelease();
    sub_100009A9C(a8, a9, a10 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100011F70@<X0>(uint64_t *a1@<X8>)
{
  return sub_10000F99C(*(void *)(v1 + 16), a1);
}

unint64_t sub_100011F78()
{
  unint64_t result = qword_10002AFE0;
  if (!qword_10002AFE0)
  {
    sub_100006364(&qword_10002AFD8);
    sub_100012018();
    sub_10000A08C(&qword_10002B008, &qword_10002B010);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AFE0);
  }
  return result;
}

unint64_t sub_100012018()
{
  unint64_t result = qword_10002AFE8;
  if (!qword_10002AFE8)
  {
    sub_100006364(&qword_10002AFF0);
    sub_10000A08C(&qword_10002AFF8, &qword_10002B000);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AFE8);
  }
  return result;
}

unint64_t sub_1000120B8()
{
  unint64_t result = qword_10002B018;
  if (!qword_10002B018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002B018);
  }
  return result;
}

uint64_t sub_10001210C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.tint.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100012138()
{
  return EnvironmentValues.tint.setter();
}

uint64_t sub_100012164(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100009768(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

double sub_1000121E0(uint64_t a1)
{
  *(unsigned char *)(a1 + 368) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_10001221C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  if (a10)
  {
    sub_100009BA4(a7, a8, a9 & 1);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_100009BA4(a19, a20, a21 & 1);
    swift_bridgeObjectRetain();
    sub_100009BA4(a26, a27, a28 & 1);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_100009BA4(a38, a39, a40 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_100012368(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v12 = *(unsigned char *)(a1 + 368);
  long long v10 = *(_OWORD *)(a1 + 320);
  long long v11 = *(_OWORD *)(a1 + 336);
  long long v8 = *(_OWORD *)(a1 + 288);
  long long v9 = *(_OWORD *)(a1 + 304);
  long long v6 = *(_OWORD *)(a1 + 256);
  long long v7 = *(_OWORD *)(a1 + 272);
  long long v4 = *(_OWORD *)(a1 + 224);
  long long v5 = *(_OWORD *)(a1 + 240);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    v4,
    *((void *)&v4 + 1),
    v5,
    *((void *)&v5 + 1),
    v6,
    *((void *)&v6 + 1),
    v7,
    *((void *)&v7 + 1),
    v8,
    *((void *)&v8 + 1),
    v9,
    *((void *)&v9 + 1),
    v10,
    *((void *)&v10 + 1),
    v11,
    *((void *)&v11 + 1),
    *(void *)(a1 + 352),
    *(void *)(a1 + 360),
    v12);
  return a1;
}

uint64_t sub_10001240C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  if (a10)
  {
    sub_100009A9C(a7, a8, a9 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    sub_100009A9C(a19, a20, a21 & 1);
    swift_bridgeObjectRelease();
    sub_100009A9C(a26, a27, a28 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    sub_100009A9C(a38, a39, a40 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100012558(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 120);
  uint64_t v3 = *(void *)(a1 + 128);
  char v4 = *(unsigned char *)(a1 + 136);
  sub_100009BA4(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100009BA4(v2, v3, v4);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000125E8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 120);
  uint64_t v3 = *(void *)(a1 + 128);
  char v4 = *(unsigned char *)(a1 + 136);
  sub_100009A9C(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_100009A9C(v2, v3, v4);
  swift_bridgeObjectRelease();
  return a1;
}

double sub_100012678(uint64_t a1)
{
  *(unsigned char *)(a1 + 160) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_100012698(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100009768(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_1000126FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15)
{
  if (a7)
  {
    sub_100009BA4(a4, a5, a6 & 1);
    swift_bridgeObjectRetain();
    sub_100009BA4(a8, a9, a10 & 1);
    swift_bridgeObjectRetain();
    sub_1000127AC(a12, a13, a14, a15);
  }
}

uint64_t sub_1000127AC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100009BA4(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1000127F0(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 160);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    v4);
  return a1;
}

void sub_100012864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15)
{
  if (a7)
  {
    sub_100009A9C(a4, a5, a6 & 1);
    swift_bridgeObjectRelease();
    sub_100009A9C(a8, a9, a10 & 1);
    swift_bridgeObjectRelease();
    sub_100012914(a12, a13, a14, a15);
  }
}

uint64_t sub_100012914(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100009A9C(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100012960()
{
  return sub_1000129B0(&qword_10002B048, &qword_10002B050, (void (*)(void))sub_100011A20, (void (*)(void))sub_100011AC0);
}

uint64_t sub_1000129B0(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006364(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100012A3C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

id sub_100012AB0()
{
  id result = [objc_allocWithZone((Class)CAFCarManager) init];
  qword_10002B058 = (uint64_t)result;
  return result;
}

uint64_t sub_100012AE4()
{
  if (qword_10002A888 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_10002B058;
  sub_100009C7C(0, &qword_10002B1A8);
  sub_100006020(&qword_10002B1B0, &qword_10002B1A8);
  id v1 = v0;
  uint64_t v2 = (void *)CAFObserved<>.observable.getter();

  type metadata accessor for ChargeCAFManager();
  uint64_t v3 = swift_allocObject();
  uint64_t result = sub_100012BD4(v2);
  qword_10002CD00 = v3;
  return result;
}

uint64_t sub_100012BD4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100009768(&qword_10002B1B8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  long long v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100009768(&qword_10002B1C0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  long long v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v2 + OBJC_IVAR____TtC6Charge16ChargeCAFManager__model;
  v16[1] = 0;
  sub_100009768((uint64_t *)&unk_10002B0B8);
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  *(void *)(v2 + OBJC_IVAR____TtC6Charge16ChargeCAFManager_cancellables) = &_swiftEmptySetSingleton;
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  sub_10000B7A0(v13, 0xD000000000000020, 0x800000010001BE40, 0xD000000000000011, 0x800000010001BE70);
  *(void *)(v2 + OBJC_IVAR____TtC6Charge16ChargeCAFManager_carManager) = a1;
  id v14 = a1;
  dispatch thunk of CAFCarManagerObservable.$currentCar.getter();
  swift_allocObject();
  swift_weakInit();
  sub_100013414();
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();

  return v2;
}

uint64_t sub_100012E80(void **a1)
{
  uint64_t v1 = *a1;
  _StringGuts.grow(_:)(22);
  swift_bridgeObjectRelease();
  v1;
  sub_100009768(&qword_10002B1D0);
  v2._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  sub_10000B7A0(v3, 0xD000000000000014, 0x800000010001BE90, 0xD000000000000011, 0x800000010001BE70);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (v1)
    {
      sub_100009C7C(0, &qword_10002B1D8);
      sub_100006020(&qword_10002B1E0, &qword_10002B1D8);
      uint64_t v5 = (void *)CAFObserved<>.observable.getter();
      id v6 = objc_allocWithZone((Class)type metadata accessor for ChargeModel());
      sub_1000183CC(v5);
    }
    swift_getKeyPath();
    swift_getKeyPath();
    return static Published.subscript.setter();
  }
  return result;
}

uint64_t sub_100013048()
{
  os_log_type_t v1 = static os_log_type_t.debug.getter();
  sub_10000B7A0(v1, 0xD000000000000025, 0x800000010001BEB0, 0x74696E696564, 0xE600000000000000);
  uint64_t v2 = v0 + OBJC_IVAR____TtC6Charge16ChargeCAFManager__model;
  uint64_t v3 = sub_100009768(&qword_10002B1C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_bridgeObjectRelease();
  uint64_t v4 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v5 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v4, v5);
}

uint64_t sub_100013140()
{
  return type metadata accessor for ChargeCAFManager();
}

uint64_t type metadata accessor for ChargeCAFManager()
{
  uint64_t result = qword_10002B0A0;
  if (!qword_10002B0A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100013194()
{
  sub_100013240();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100013240()
{
  if (!qword_10002B0B0)
  {
    sub_100006364((uint64_t *)&unk_10002B0B8);
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10002B0B0);
    }
  }
}

uint64_t sub_10001329C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ChargeCAFManager();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000132DC@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10001335C(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return static Published.subscript.setter();
}

uint64_t sub_1000133D4()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001340C(void **a1)
{
  return sub_100012E80(a1);
}

unint64_t sub_100013414()
{
  unint64_t result = qword_10002B1C8;
  if (!qword_10002B1C8)
  {
    sub_100006364(&qword_10002B1B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002B1C8);
  }
  return result;
}

char *sub_100013478(void *a1, char a2)
{
  id v5 = objc_allocWithZone((Class)UIWindow);
  id v6 = v2;
  id v7 = [v5 initWithWindowScene:a1];
  uint64_t v8 = OBJC_IVAR____TtC6Charge19ChargeWindowManager_window;
  *(void *)&v6[OBJC_IVAR____TtC6Charge19ChargeWindowManager_window] = v7;
  [v7 setAutoresizesSubviews:1];
  [*(id *)&v6[v8] setHidden:0];
  id v9 = *(id *)&v6[v8];
  [v9 makeKeyAndVisible];

  v19.receiver = v6;
  v19.super_class = (Class)type metadata accessor for ChargeWindowManager();
  uint64_t v10 = (char *)[super init];
  long long v11 = *(void **)&v10[OBJC_IVAR____TtC6Charge19ChargeWindowManager_window];
  uint64_t v12 = (objc_class *)type metadata accessor for ChargeViewController();
  os_log_type_t v13 = objc_allocWithZone(v12);
  v13[OBJC_IVAR____TtC6Charge20ChargeViewController_presentationMode] = a2;
  v18.receiver = v13;
  v18.super_class = v12;
  id v14 = v10;
  id v15 = v11;
  id v16 = [super initWithNibName:0 bundle:0];
  [v15 setRootViewController:v16];

  return v14;
}

id sub_1000135FC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ChargeWindowManager();
  return [super dealloc];
}

uint64_t type metadata accessor for ChargeWindowManager()
{
  return self;
}

uint64_t type metadata accessor for ConsoleMetrics()
{
  return self;
}

uint64_t sub_100013688()
{
  id v1 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  objc_super v2 = self;
  id v3 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
  uint64_t v4 = self;
  id v5 = [v4 systemFontOfSize:34.0 weight:UIFontWeightMedium];
  id v6 = [v1 scaledFontForFont:v5];

  *(void *)(v0 + 16) = Font.init(_:)();
  id v7 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v8 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
  id v9 = [v4 systemFontOfSize:64.0 weight:UIFontWeightMedium];
  id v10 = [v7 scaledFontForFont:v9];

  *(void *)(v0 + 24) = Font.init(_:)();
  id v11 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v12 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
  id v13 = [v4 systemFontOfSize:22.0 weight:UIFontWeightMedium];
  id v14 = [v11 scaledFontForFont:v13];

  *(void *)(v0 + 32) = Font.init(_:)();
  id v15 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v16 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
  id v17 = [v4 systemFontOfSize:18.0 weight:UIFontWeightMedium];
  id v18 = [v15 scaledFontForFont:v17];

  Font.init(_:)();
  uint64_t v19 = Font.monospaced()();
  swift_release();
  *(void *)(v0 + 40) = v19;
  id v20 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleTitle1];
  id v21 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle1];
  id v22 = [v4 systemFontOfSize:20.0 weight:UIFontWeightMedium];
  id v23 = [v20 scaledFontForFont:v22];

  *(void *)(v0 + 48) = Font.init(_:)();
  id v24 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleTitle2];
  id v25 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle2];
  id v26 = [v4 systemFontOfSize:24.0 weight:UIFontWeightMedium];
  id v27 = [v24 scaledFontForFont:v26];

  *(void *)(v0 + 56) = Font.init(_:)();
  id v28 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleFootnote];
  id v29 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote];
  id v30 = [v4 systemFontOfSize:14.0 weight:UIFontWeightMedium];
  id v31 = [v28 scaledFontForFont:v30];

  *(void *)(v0 + 64) = Font.init(_:)();
  id v32 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v33 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
  id v34 = [v4 systemFontOfSize:55.0 weight:UIFontWeightMedium];
  id v35 = [v32 scaledFontForFont:v34];

  *(void *)(v0 + 72) = Font.init(_:)();
  *(_OWORD *)(v0 + 80) = xmmword_10001E5D0;
  *(_OWORD *)(v0 + 96) = xmmword_10001E5E0;
  *(void *)(v0 + 112) = 0;
  return v0;
}

double sub_100013C0C()
{
  return 0.55;
}

uint64_t type metadata accessor for ClusterMetrics()
{
  return self;
}

uint64_t sub_100013C40()
{
  id v1 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  objc_super v2 = self;
  id v3 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
  uint64_t v4 = self;
  id v5 = [v4 systemFontOfSize:74.0 weight:UIFontWeightMedium];
  id v6 = [v1 scaledFontForFont:v5];

  *(void *)(v0 + 16) = Font.init(_:)();
  id v7 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v8 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
  id v9 = [v4 systemFontOfSize:118.0 weight:UIFontWeightMedium];
  id v10 = [v7 scaledFontForFont:v9];

  *(void *)(v0 + 24) = Font.init(_:)();
  id v11 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v12 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
  id v13 = [v4 systemFontOfSize:28.0 weight:UIFontWeightMedium];
  id v14 = [v11 scaledFontForFont:v13];

  *(void *)(v0 + 32) = Font.init(_:)();
  id v15 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v16 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
  id v17 = [v4 systemFontOfSize:22.0 weight:UIFontWeightMedium];
  id v18 = [v15 scaledFontForFont:v17];

  Font.init(_:)();
  uint64_t v19 = Font.monospaced()();
  swift_release();
  *(void *)(v0 + 40) = v19;
  id v20 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleTitle1];
  id v21 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle1];
  id v22 = [v4 systemFontOfSize:36.0 weight:UIFontWeightMedium];
  id v23 = [v20 scaledFontForFont:v22];

  *(void *)(v0 + 48) = Font.init(_:)();
  id v24 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleTitle2];
  id v25 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle2];
  id v26 = [v4 systemFontOfSize:40.0 weight:UIFontWeightMedium];
  id v27 = [v24 scaledFontForFont:v26];

  *(void *)(v0 + 56) = Font.init(_:)();
  id v28 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleFootnote];
  id v29 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote];
  id v30 = [v4 systemFontOfSize:30.0 weight:UIFontWeightMedium];
  id v31 = [v28 scaledFontForFont:v30];

  *(void *)(v0 + 64) = Font.init(_:)();
  id v32 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v33 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
  id v34 = [v4 systemFontOfSize:140.0 weight:UIFontWeightMedium];
  id v35 = [v32 scaledFontForFont:v34];

  *(void *)(v0 + 72) = Font.init(_:)();
  __asm { FMOV            V1.2D, #16.0 }
  *(_OWORD *)(v0 + 80) = xmmword_10001E5F0;
  *(_OWORD *)(v0 + 96) = _Q1;
  *(void *)(v0 + 112) = 0x4030000000000000;
  return v0;
}

double sub_1000141D8()
{
  return 0.52;
}

uint64_t sub_1000141E4()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_10001423C()
{
  sub_1000141E4();

  return _swift_deallocClassInstance(v0, 120, 7);
}

uint64_t type metadata accessor for WidgetMetrics()
{
  return self;
}

uint64_t sub_100014294()
{
  id v1 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  objc_super v2 = self;
  id v3 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
  uint64_t v4 = self;
  id v5 = [v4 systemFontOfSize:34.0 weight:UIFontWeightMedium];
  id v6 = [v1 scaledFontForFont:v5];

  *(void *)(v0 + 16) = Font.init(_:)();
  id v7 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v8 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
  id v9 = [v4 systemFontOfSize:34.0 weight:UIFontWeightMedium];
  id v10 = [v7 scaledFontForFont:v9];

  *(void *)(v0 + 24) = Font.init(_:)();
  id v11 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v12 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
  id v13 = [v4 systemFontOfSize:18.0 weight:UIFontWeightMedium];
  id v14 = [v11 scaledFontForFont:v13];

  *(void *)(v0 + 32) = Font.init(_:)();
  id v15 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v16 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
  id v17 = [v4 systemFontOfSize:24.0 weight:UIFontWeightMedium];
  id v18 = [v15 scaledFontForFont:v17];

  Font.init(_:)();
  uint64_t v19 = Font.monospaced()();
  swift_release();
  *(void *)(v0 + 40) = v19;
  id v20 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleTitle1];
  id v21 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle1];
  id v22 = [v4 systemFontOfSize:34.0 weight:UIFontWeightMedium];
  id v23 = [v20 scaledFontForFont:v22];

  *(void *)(v0 + 48) = Font.init(_:)();
  id v24 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleTitle2];
  id v25 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle2];
  id v26 = [v4 systemFontOfSize:40.0 weight:UIFontWeightMedium];
  id v27 = [v24 scaledFontForFont:v26];

  *(void *)(v0 + 56) = Font.init(_:)();
  id v28 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleFootnote];
  id v29 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote];
  id v30 = [v4 systemFontOfSize:24.0 weight:UIFontWeightMedium];
  id v31 = [v28 scaledFontForFont:v30];

  *(void *)(v0 + 64) = Font.init(_:)();
  id v32 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v33 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
  id v34 = [v4 systemFontOfSize:45.0 weight:UIFontWeightMedium];
  id v35 = [v32 scaledFontForFont:v34];

  *(void *)(v0 + 72) = Font.init(_:)();
  *(_OWORD *)(v0 + 80) = xmmword_10001E600;
  *(_OWORD *)(v0 + 96) = xmmword_10001E610;
  *(void *)(v0 + 112) = 0;
  return v0;
}

uint64_t sub_100014820()
{
  return swift_retain();
}

uint64_t sub_10001482C()
{
  return swift_retain();
}

uint64_t sub_100014838()
{
  return swift_retain();
}

uint64_t sub_100014844()
{
  return swift_retain();
}

uint64_t sub_100014850()
{
  return swift_retain();
}

uint64_t sub_10001485C()
{
  return swift_retain();
}

uint64_t sub_100014868()
{
  return swift_retain();
}

uint64_t sub_100014874()
{
  return swift_retain();
}

double sub_100014880()
{
  return 0.5;
}

double sub_100014888()
{
  return *(double *)(*(void *)v0 + 88);
}

uint64_t sub_100014898(double a1)
{
  id v2 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v3 = [self preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
  id v4 = [self systemFontOfSize:a1 weight:UIFontWeightMedium];
  id v5 = [v2 scaledFontForFont:v4];

  return Font.init(_:)();
}

void destroy for ChargeView(uint64_t a1)
{
  swift_release();
  id v2 = *(void **)(a1 + 24);
}

uint64_t initializeWithCopy for ChargeView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  id v3 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  id v4 = v3;
  return a1;
}

void *assignWithCopy for ChargeView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  id v4 = (void *)a2[3];
  id v5 = (void *)a1[3];
  a1[3] = v4;
  id v6 = v4;

  return a1;
}

uint64_t assignWithTake for ChargeView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  id v4 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for ChargeView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ChargeView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ChargeView()
{
  return &type metadata for ChargeView;
}

uint64_t sub_100014B90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100014BAC@<X0>(uint64_t a1@<X0>, void *a2@<X3>, uint64_t a3@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v6 = a2;
  static Published.subscript.getter();

  swift_release();
  swift_release();
  if (v9 != 1)
  {
    type metadata accessor for LayoutConfiguration();
    sub_100014F24((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
    EnvironmentObject.init()();
    goto LABEL_5;
  }
  if (a1)
  {
    type metadata accessor for ChargeModel();
    sub_100014F24(&qword_10002AE58, (void (*)(uint64_t))type metadata accessor for ChargeModel);
    id v7 = v6;
    ObservedObject.init(wrappedValue:)();
    sub_100014E7C();
    sub_100014ED0();
    _ConditionalContent<>.init(storage:)();
LABEL_5:
    sub_100009768(&qword_10002B680);
    sub_100014E40();
    sub_100005FCC();
    uint64_t result = _ConditionalContent<>.init(storage:)();
    *(_OWORD *)a3 = v9;
    *(_WORD *)(a3 + 16) = v10;
    *(unsigned char *)(a3 + 18) = v11;
    return result;
  }
  type metadata accessor for LayoutConfiguration();
  sub_100014F24((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

uint64_t sub_100014E2C@<X0>(uint64_t a1@<X8>)
{
  return sub_100014BAC(*(void *)v1, *(void **)(v1 + 24), a1);
}

uint64_t sub_100014E40()
{
  return sub_100014FBC(&qword_10002B688, &qword_10002B680, (void (*)(void))sub_100014E7C, (void (*)(void))sub_100014ED0);
}

unint64_t sub_100014E7C()
{
  unint64_t result = qword_10002B690;
  if (!qword_10002B690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002B690);
  }
  return result;
}

unint64_t sub_100014ED0()
{
  unint64_t result = qword_10002B698;
  if (!qword_10002B698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002B698);
  }
  return result;
}

uint64_t sub_100014F24(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100014F6C()
{
  return sub_100014FBC(&qword_10002B6A0, &qword_10002B6A8, (void (*)(void))sub_100014E40, (void (*)(void))sub_100005FCC);
}

uint64_t sub_100014FBC(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006364(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1000150A0()
{
  uint64_t v1 = v0;
  v52.receiver = v0;
  v52.super_class = (Class)type metadata accessor for ChargeViewController();
  [super viewDidLoad];
  char v2 = *((unsigned char *)v0 + OBJC_IVAR____TtC6Charge20ChargeViewController_presentationMode);
  type metadata accessor for LayoutConfiguration();
  uint64_t v3 = swift_allocObject();
  type metadata accessor for CGSize(0);
  Published.init(initialValue:)();
  *(void *)(v3 + OBJC_IVAR____TtC6Charge19LayoutConfiguration____lazy_storage___consoleMetrics) = 0;
  *(void *)(v3 + OBJC_IVAR____TtC6Charge19LayoutConfiguration____lazy_storage___clusterMetrics) = 0;
  *(void *)(v3 + OBJC_IVAR____TtC6Charge19LayoutConfiguration____lazy_storage___widgetMetrics) = 0;
  *(unsigned char *)(v3 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) = v2;
  LOBYTE(v50) = 0;
  uint64_t v51 = v3;
  id v4 = objc_allocWithZone((Class)sub_100009768(&qword_10002B6E0));
  id v5 = (void *)UIHostingController.init(rootView:)();
  [v0 addChildViewController:v5 sub_100015760 0 v50 v51];
  id v6 = [v5 view];
  if (!v6)
  {
    __break(1u);
    goto LABEL_15;
  }
  id v7 = v6;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v8 = [v5 view];
  if (!v8)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  long long v9 = v8;
  id v10 = [self clearColor];
  [v9 setBackgroundColor:v10];

  id v11 = [v1 view];
  if (!v11)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  id v12 = v11;
  id v13 = [v5 view];
  if (!v13)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v14 = v13;
  [v12 addSubview:v13];

  [v5 didMoveToParentViewController:v1];
  sub_100009768(&qword_10002B6E8);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_10001E850;
  id v16 = [v5 view];
  if (!v16)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id v17 = v16;
  id v18 = [v16 topAnchor];

  id v19 = [v1 view];
  if (!v19)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  id v20 = v19;
  id v21 = [v19 safeAreaLayoutGuide];

  id v22 = [v21 topAnchor];
  id v23 = [v18 constraintEqualToAnchor:v22];

  *(void *)(v15 + 32) = v23;
  id v24 = [v5 view];
  if (!v24)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v25 = v24;
  id v26 = [v24 bottomAnchor];

  id v27 = [v1 view];
  if (!v27)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  id v28 = v27;
  id v29 = [v27 safeAreaLayoutGuide];

  id v30 = [v29 bottomAnchor];
  id v31 = [v26 constraintEqualToAnchor:v30];

  *(void *)(v15 + 40) = v31;
  id v32 = [v5 view];
  if (!v32)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  id v33 = v32;
  id v34 = [v32 leadingAnchor];

  id v35 = [v1 view];
  if (!v35)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v36 = v35;
  id v37 = [v35 safeAreaLayoutGuide];

  id v38 = [v37 leadingAnchor];
  id v39 = [v34 constraintEqualToAnchor:v38];

  *(void *)(v15 + 48) = v39;
  id v40 = [v5 view];
  if (!v40)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v41 = v40;
  id v42 = [v40 trailingAnchor];

  id v43 = [v1 view];
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = self;
    id v46 = [v44 safeAreaLayoutGuide];

    id v47 = [v46 trailingAnchor];
    id v48 = [v42 constraintEqualToAnchor:v47];

    *(void *)(v15 + 56) = v48;
    specialized Array._endMutation()();
    sub_100015720();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v45 activateConstraints:isa, v15];

    CAFSignpostEmit_Rendered();
    return;
  }
LABEL_25:
  __break(1u);
}

id sub_1000156C8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ChargeViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for ChargeViewController()
{
  return self;
}

unint64_t sub_100015720()
{
  unint64_t result = qword_10002B6F0;
  if (!qword_10002B6F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10002B6F0);
  }
  return result;
}

uint64_t sub_100015760()
{
  if (qword_10002A890 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_1000157BC()
{
  return swift_retain();
}

uint64_t destroy for ChargeContentView()
{
  sub_100015808();

  return swift_release();
}

uint64_t sub_100015808()
{
  return swift_release();
}

uint64_t initializeWithCopy for ChargeContentView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_1000157BC();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = a2[3];
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ChargeContentView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_1000157BC();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_100015808();
  *(void *)(a1 + 24) = a2[3];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for ChargeContentView(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_100015808();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for ChargeContentView()
{
  return &type metadata for ChargeContentView;
}

uint64_t sub_100015958()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100015974@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  int v7 = a3 & 1;
  type metadata accessor for ChargeCAFManager();
  sub_1000164C0(&qword_10002B6F8, (void (*)(uint64_t))type metadata accessor for ChargeCAFManager);
  uint64_t v18 = a1;
  StateObject.wrappedValue.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (v21)
  {
    type metadata accessor for LayoutConfiguration();
    sub_1000164C0((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
    id v8 = v21;
    EnvironmentObject.init()();
    type metadata accessor for ChargeModel();
    sub_1000164C0(&qword_10002AE58, (void (*)(uint64_t))type metadata accessor for ChargeModel);
    ObservedObject.init(wrappedValue:)();
    id v20 = v9;
    static ObservableObject.environmentStore.getter();
    swift_retain();
    id v10 = v20;
    swift_retain();
    swift_retain_n();
    sub_100009768(&qword_10002B700);
    sub_100009768(&qword_10002B708);
    sub_10001623C(&qword_10002B710, &qword_10002B700, (void (*)(void))sub_1000161E8);
    sub_10001623C(&qword_10002B730, &qword_10002B708, (void (*)(void))sub_1000162E0);
    _ConditionalContent<>.init(storage:)();
    swift_release();
    swift_release();

    swift_release();
  }
  else
  {
    id v11 = [self mainBundle];
    v31._object = (void *)0xE000000000000000;
    v12._countAndFlagsBits = 0x494C414954494E49;
    v12._object = (void *)0xEC000000474E495ALL;
    v13.value._countAndFlagsBits = 0x656772616843;
    v13.value._object = (void *)0xE600000000000000;
    v14._countAndFlagsBits = 0;
    v14._object = (void *)0xE000000000000000;
    v31._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v12, v13, (NSBundle)v11, v14, v31);

    String.init(format:_:)();
    swift_bridgeObjectRelease();
    type metadata accessor for LayoutConfiguration();
    sub_1000164C0((unint64_t *)&qword_10002A9F0, (void (*)(uint64_t))type metadata accessor for LayoutConfiguration);
    EnvironmentObject.init()();
    State.init(wrappedValue:)();
    static ObservableObject.environmentStore.getter();
    swift_retain();
    sub_100009768(&qword_10002B700);
    sub_100009768(&qword_10002B708);
    sub_10001623C(&qword_10002B710, &qword_10002B700, (void (*)(void))sub_1000161E8);
    sub_10001623C(&qword_10002B730, &qword_10002B708, (void (*)(void))sub_1000162E0);
    _ConditionalContent<>.init(storage:)();
  }
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v18;
  *(void *)(v15 + 24) = a2;
  *(unsigned char *)(v15 + 32) = v7 != 0;
  *(void *)(v15 + 40) = a4;
  *(void *)a5 = v21;
  *(void *)(a5 + 8) = v22;
  *(void *)(a5 + 16) = v23;
  *(void *)(a5 + 24) = v24;
  *(void *)(a5 + 32) = v25;
  *(void *)(a5 + 40) = v26;
  *(void *)(a5 + 48) = v27;
  *(void *)(a5 + 56) = v28;
  *(void *)(a5 + 64) = v29;
  *(unsigned char *)(a5 + 72) = v30;
  *(void *)(a5 + 80) = sub_100016378;
  *(void *)(a5 + 88) = v15;
  sub_100016390((uint64_t)v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);
  swift_retain();
  sub_1000157BC();
  swift_retain();
  swift_release();
  return sub_100016428((uint64_t)v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);
}

uint64_t sub_100015F2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v19 = a5;
  int v18 = a4;
  uint64_t v10 = type metadata accessor for GeometryProxy();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  uint64_t v17 = static Color.clear.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  *(unsigned char *)(v14 + 32) = v18 & 1;
  *(void *)(v14 + 40) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v14 + v13, (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  *a6 = v17;
  a6[1] = (uint64_t)sub_1000165E0;
  a6[2] = v14;
  a6[3] = 0;
  a6[4] = 0;
  sub_1000157BC();
  return swift_retain();
}

uint64_t sub_1000160BC()
{
  return static Published.subscript.setter();
}

__n128 sub_100016144@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  char v5 = *(unsigned char *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = static Alignment.center.getter();
  uint64_t v9 = v8;
  sub_100015974(v3, v4, v5, v6, (uint64_t)v17);
  uint64_t v10 = v18;
  char v11 = v19;
  __n128 result = v20;
  long long v13 = v17[0];
  long long v14 = v17[1];
  long long v15 = v17[2];
  long long v16 = v17[3];
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v9;
  *(_OWORD *)(a1 + 16) = v13;
  *(_OWORD *)(a1 + 32) = v14;
  *(_OWORD *)(a1 + 48) = v15;
  *(_OWORD *)(a1 + 64) = v16;
  *(void *)(a1 + 80) = v10;
  *(unsigned char *)(a1 + 88) = v11;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

unint64_t sub_1000161E8()
{
  unint64_t result = qword_10002B718;
  if (!qword_10002B718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002B718);
  }
  return result;
}

uint64_t sub_10001623C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006364(a2);
    a3();
    sub_10000A08C(&qword_10002B720, &qword_10002B728);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000162E0()
{
  unint64_t result = qword_10002B738;
  if (!qword_10002B738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002B738);
  }
  return result;
}

uint64_t sub_100016334()
{
  sub_100015808();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100016378@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100015F2C(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(unsigned __int8 *)(v2 + 32), *(void *)(v2 + 40), a2);
}

uint64_t sub_100016390(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  swift_retain();
  swift_retain();
  if (a10)
  {
    swift_retain();
    swift_bridgeObjectRetain();
  }
  else
  {
    id v11 = a4;
  }

  return swift_retain();
}

uint64_t sub_100016428(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  if (a10)
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
  }
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_1000164C0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100016508()
{
  uint64_t v1 = type metadata accessor for GeometryProxy();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  sub_100015808();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000165E0()
{
  type metadata accessor for GeometryProxy();

  return sub_1000160BC();
}

uint64_t sub_10001665C()
{
  return sub_10000A08C(&qword_10002B740, &qword_10002B748);
}

void *initializeBufferWithCopyOfBuffer for NotChargingView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for NotChargingView()
{
  return swift_release();
}

void *assignWithCopy for NotChargingView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  return a1;
}

void *assignWithTake for NotChargingView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for NotChargingView(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NotChargingView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
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
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NotChargingView()
{
  return &type metadata for NotChargingView;
}

uint64_t sub_10001681C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100016838@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (qword_10002A880 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = Image.init(systemName:)();
  uint64_t v5 = static Color.secondary.getter();
  uint64_t KeyPath = swift_getKeyPath();
  if (a1)
  {
    uint64_t v43 = v5;
    uint64_t v44 = v4;
    uint64_t v42 = KeyPath;
    if (*(unsigned char *)(a1 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      if (*(unsigned char *)(a1 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain();
        uint64_t v7 = sub_10000A254();
        uint64_t v8 = type metadata accessor for ClusterMetrics();
        uint64_t v9 = v8;
        uint64_t v10 = &off_100025610;
      }
      else
      {
        swift_retain();
        uint64_t v7 = sub_10000A288();
        uint64_t v8 = type metadata accessor for WidgetMetrics();
        uint64_t v9 = v8;
        uint64_t v10 = &off_1000255B0;
      }
    }
    else
    {
      swift_retain();
      uint64_t v7 = sub_10000A220();
      uint64_t v8 = type metadata accessor for ConsoleMetrics();
      uint64_t v9 = v8;
      uint64_t v10 = &off_100025670;
    }
    uint64_t v46 = v8;
    id v47 = v10;
    swift_release();
    v45[0] = v7;
    sub_100009A58(v45, v9);
    uint64_t v41 = ((uint64_t (__cdecl *)())v10[2])();
    uint64_t v40 = swift_getKeyPath();
    sub_100009AAC((uint64_t)v45);
    id v11 = [self mainBundle];
    v48._object = (void *)0xE000000000000000;
    v12._countAndFlagsBits = 0x524148435F544F4ELL;
    v12._object = (void *)0xEC000000474E4947;
    v13.value._countAndFlagsBits = 0x656772616843;
    v13.value._object = (void *)0xE600000000000000;
    v14._countAndFlagsBits = 0;
    v14._object = (void *)0xE000000000000000;
    v48._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v12, v13, (NSBundle)v11, v14, v48);

    uint64_t v15 = String.init(format:_:)();
    uint64_t v17 = v16;
    swift_bridgeObjectRelease();
    v45[0] = v15;
    v45[1] = v17;
    sub_100009A04();
    uint64_t v18 = Text.init<A>(_:)();
    uint64_t v20 = v19;
    char v22 = v21 & 1;
    static Color.secondary.getter();
    uint64_t v23 = Text.foregroundColor(_:)();
    uint64_t v25 = v24;
    char v39 = v26;
    swift_release();
    sub_100009A9C(v18, v20, v22);
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(a1 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      if (*(unsigned char *)(a1 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain();
        uint64_t v27 = sub_10000A254();
        uint64_t v28 = type metadata accessor for ClusterMetrics();
        uint64_t v29 = v28;
        char v30 = &off_100025610;
      }
      else
      {
        swift_retain();
        uint64_t v27 = sub_10000A288();
        uint64_t v28 = type metadata accessor for WidgetMetrics();
        uint64_t v29 = v28;
        char v30 = &off_1000255B0;
      }
    }
    else
    {
      swift_retain();
      uint64_t v27 = sub_10000A220();
      uint64_t v28 = type metadata accessor for ConsoleMetrics();
      uint64_t v29 = v28;
      char v30 = &off_100025670;
    }
    uint64_t v46 = v28;
    id v47 = v30;
    swift_release();
    v45[0] = v27;
    sub_100009A58(v45, v29);
    ((void (__cdecl *)())v30[1])();
    uint64_t v31 = Text.font(_:)();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    char v37 = v36 & 1;
    sub_100009A9C(v23, v25, v39 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    sub_100009AAC((uint64_t)v45);
    *(void *)a2 = v44;
    *(void *)(a2 + 8) = v42;
    *(void *)(a2 + 16) = v43;
    *(void *)(a2 + 24) = v40;
    *(void *)(a2 + 32) = v41;
    *(void *)(a2 + 40) = v31;
    *(void *)(a2 + 48) = v33;
    *(unsigned char *)(a2 + 56) = v37;
    *(void *)(a2 + 64) = v35;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_100009BA4(v31, v33, v37);
    swift_bridgeObjectRetain();
    sub_100009A9C(v31, v33, v37);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for LayoutConfiguration();
    sub_100016D84();
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

__n128 sub_100016CF4@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = static HorizontalAlignment.center.getter();
  sub_100016838(v3, (uint64_t)&v12);
  uint64_t v5 = v13;
  uint64_t v6 = v14;
  uint64_t v7 = v16;
  char v8 = v17;
  uint64_t v9 = v18;
  __n128 result = v15;
  long long v11 = v12;
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 24) = v11;
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = v6;
  *(__n128 *)(a1 + 56) = result;
  *(void *)(a1 + 72) = v7;
  *(unsigned char *)(a1 + 80) = v8;
  *(void *)(a1 + 88) = v9;
  return result;
}

unint64_t sub_100016D84()
{
  unint64_t result = qword_10002A9F0;
  if (!qword_10002A9F0)
  {
    type metadata accessor for LayoutConfiguration();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002A9F0);
  }
  return result;
}

unint64_t sub_100016DE8()
{
  unint64_t result = qword_10002B750;
  if (!qword_10002B750)
  {
    sub_100006364(&qword_10002B758);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002B750);
  }
  return result;
}

uint64_t destroy for ChargeSpinnerView()
{
  swift_release();
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ChargeSpinnerView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ChargeSpinnerView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

__n128 initializeWithTake for ChargeSpinnerView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ChargeSpinnerView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for ChargeSpinnerView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ChargeSpinnerView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ChargeSpinnerView()
{
  return &type metadata for ChargeSpinnerView;
}

uint64_t sub_1000170B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000170D0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100009768(&qword_10002B760);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[5];
  v46[0] = a1[4];
  v46[1] = v7;
  sub_100009A04();
  swift_bridgeObjectRetain();
  uint64_t v8 = Text.init<A>(_:)();
  uint64_t v11 = *a1;
  if (*a1)
  {
    uint64_t v12 = v8;
    uint64_t v13 = v9;
    int v14 = *(unsigned __int8 *)(v11 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode);
    uint64_t v41 = v6;
    LODWORD(v44) = v10;
    if (v14)
    {
      if (v14 == 1)
      {
        swift_retain();
        uint64_t v15 = sub_10000A254();
        uint64_t v16 = type metadata accessor for ClusterMetrics();
        uint64_t v17 = v16;
        uint64_t v18 = &off_100025610;
      }
      else
      {
        swift_retain();
        uint64_t v15 = sub_10000A288();
        uint64_t v16 = type metadata accessor for WidgetMetrics();
        uint64_t v17 = v16;
        uint64_t v18 = &off_1000255B0;
      }
    }
    else
    {
      swift_retain();
      uint64_t v15 = sub_10000A220();
      uint64_t v16 = type metadata accessor for ConsoleMetrics();
      uint64_t v17 = v16;
      uint64_t v18 = &off_100025670;
    }
    v51[3] = v16;
    v51[4] = v18;
    swift_release();
    v51[0] = v15;
    sub_100009A58(v51, v17);
    ((void (__cdecl *)())v18[1])();
    char v19 = v44 & 1;
    uint64_t v43 = Text.font(_:)();
    uint64_t v44 = v20;
    uint64_t v22 = v21;
    int v42 = v23;
    sub_100009A9C(v12, v13, v19);
    swift_release();
    swift_bridgeObjectRelease();
    sub_100009AAC((uint64_t)v51);
    char v24 = static Edge.Set.top.getter();
    if (*(unsigned char *)(v11 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 2)
    {
      uint64_t v25 = Image.init(systemName:)();
      uint64_t v26 = type metadata accessor for Font.Design();
      uint64_t v27 = (uint64_t)v41;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v41, 1, 1, v26);
      uint64_t v28 = static Font.system(size:weight:design:)();
      sub_100017EDC(v27);
      uint64_t KeyPath = swift_getKeyPath();
      char v30 = static Edge.Set.all.getter();
      v46[0] = v25;
      v46[1] = KeyPath;
      v46[2] = v28;
      LOBYTE(v46[3]) = v30;
      memset(&v46[4], 0, 32);
      LOBYTE(v46[8]) = 1;
      sub_100017FEC((uint64_t)v46);
    }
    else
    {
      uint64_t v31 = static HorizontalAlignment.center.getter();
      uint64_t v32 = static Alignment.center.getter();
      uint64_t v34 = v33;
      sub_100017594((uint64_t)a1, (uint64_t)&v46[5]);
      v45[0] = 1;
      v46[0] = v31;
      v46[1] = 0;
      LOBYTE(v46[2]) = 1;
      v46[3] = v32;
      v46[4] = v34;
      sub_100017BC4((uint64_t)v46);
    }
    sub_100012698((uint64_t)v46, (uint64_t)v49, &qword_10002B768);
    sub_100009768(&qword_10002B770);
    sub_100009768(&qword_10002B778);
    sub_100017BD0();
    sub_10000A08C(&qword_10002B788, &qword_10002B778);
    _ConditionalContent<>.init(storage:)();
    char v35 = v42 & 1;
    memcpy(v49, v50, 0x141uLL);
    memcpy(v45, v50, 0x141uLL);
    char v48 = v42 & 1;
    char v47 = 1;
    memcpy((char *)v46 + 7, v50, 0x141uLL);
    char v36 = v42 & 1;
    uint64_t v38 = v43;
    uint64_t v37 = v44;
    *(void *)a2 = v43;
    *(void *)(a2 + 8) = v22;
    *(unsigned char *)(a2 + 16) = v36;
    *(void *)(a2 + 24) = v37;
    *(unsigned char *)(a2 + 32) = v24;
    *(_OWORD *)(a2 + 40) = 0u;
    *(_OWORD *)(a2 + 56) = 0u;
    *(unsigned char *)(a2 + 72) = 1;
    memcpy((void *)(a2 + 73), v46, 0x148uLL);
    sub_100009BA4(v38, v22, v35);
    swift_bridgeObjectRetain();
    sub_100017D48((uint64_t)v45, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_100017C4C);
    sub_100017D48((uint64_t)v49, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_100017DE4);
    sub_100009A9C(v38, v22, v35);
    return swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for LayoutConfiguration();
    sub_100016D84();
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_100017594@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Color.RGBColorSpace();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&KeyPath - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  uint64_t v60 = v103;
  uint64_t v61 = v104;
  uint64_t v62 = v102;
  uint64_t v8 = *(void (**)(char *, void, uint64_t))(v5 + 104);
  uint64_t v59 = a2 + 104;
  uint64_t v9 = v100;
  uint64_t v10 = v101;
  v8(v7, enum case for Color.RGBColorSpace.sRGB(_:), v4);
  uint64_t v58 = Color.init(_:red:green:blue:opacity:)();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v56 = v107;
  uint64_t v57 = v105;
  int v52 = v108;
  int v53 = v106;
  uint64_t v54 = v110;
  uint64_t v55 = v109;
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  uint64_t v11 = v111;
  unsigned int v50 = v113;
  unsigned int v51 = v112;
  uint64_t v12 = v114;
  uint64_t v49 = v115;
  uint64_t v13 = v116;
  uint64_t v48 = static Color.blue.getter();
  uint64_t KeyPath = swift_getKeyPath();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v14 = v117;
  char v15 = v118;
  uint64_t v16 = v119;
  char v17 = v120;
  uint64_t v18 = v121;
  uint64_t v19 = v122;
  long long v78 = *(_OWORD *)(a1 + 16);
  sub_100009768(&qword_10002B790);
  State.wrappedValue.getter();
  if ((_BYTE)v65) {
    double v20 = -6.28318531;
  }
  else {
    double v20 = 0.0;
  }
  static UnitPoint.center.getter();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  char v64 = v15;
  char v63 = v17;
  uint64_t v25 = swift_allocObject();
  long long v26 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v25 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v25 + 32) = v26;
  *(_OWORD *)(v25 + 48) = *(_OWORD *)(a1 + 32);
  *(void *)(v25 + 64) = *(void *)(a1 + 48);
  char v27 = v64;
  char v28 = v63;
  long long v65 = xmmword_10001EA50;
  *(void *)&long long v66 = v11;
  unsigned int v30 = v50;
  unsigned int v29 = v51;
  *((void *)&v66 + 1) = __PAIR64__(v50, v51);
  *(void *)&long long v67 = v12;
  uint64_t v32 = v48;
  uint64_t v31 = v49;
  *((void *)&v67 + 1) = v49;
  *(void *)&long long v68 = v13;
  uint64_t v33 = KeyPath;
  *((void *)&v68 + 1) = KeyPath;
  *(void *)&long long v69 = v48;
  *((void *)&v69 + 1) = v14;
  LOBYTE(v70) = v64;
  *((void *)&v70 + 1) = v16;
  LOBYTE(v71) = v63;
  *((void *)&v71 + 1) = v18;
  *(void *)&long long v72 = v19;
  *((double *)&v72 + 1) = v20;
  *(void *)&long long v73 = v22;
  *((void *)&v73 + 1) = v24;
  *(void *)&long long v74 = sub_1000180EC;
  *((void *)&v74 + 1) = v25;
  long long v75 = 0uLL;
  char v77 = v53;
  char v76 = v52;
  long long v34 = v69;
  long long v35 = v70;
  long long v36 = v72;
  *(_OWORD *)(a2 + 200) = v71;
  *(_OWORD *)(a2 + 184) = v35;
  *(_OWORD *)(a2 + 168) = v34;
  long long v37 = v67;
  *(_OWORD *)(a2 + 152) = v68;
  long long v38 = v74;
  uint64_t v39 = v60;
  *(_OWORD *)(v59 + 160) = v75;
  long long v40 = v73;
  *(_OWORD *)(a2 + 248) = v38;
  *(_OWORD *)(a2 + 232) = v40;
  *(_OWORD *)(a2 + 216) = v36;
  long long v41 = v65;
  long long v42 = v66;
  *(_OWORD *)(a2 + 136) = v37;
  *(_OWORD *)(a2 + 120) = v42;
  *(_OWORD *)(a2 + 104) = v41;
  char v43 = v77;
  char v44 = v76;
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v10;
  *(void *)(a2 + 16) = v62;
  *(void *)(a2 + 24) = v39;
  *(void *)(a2 + 32) = v61;
  *(void *)(a2 + 40) = v58;
  *(_WORD *)(a2 + 48) = 256;
  *(void *)(a2 + 56) = v57;
  *(unsigned char *)(a2 + 64) = v43;
  *(void *)(a2 + 72) = v56;
  *(unsigned char *)(a2 + 80) = v44;
  uint64_t v45 = v54;
  *(void *)(a2 + 88) = v55;
  *(void *)(a2 + 96) = v45;
  long long v78 = xmmword_10001EA50;
  uint64_t v79 = v11;
  unsigned int v80 = v29;
  unsigned int v81 = v30;
  uint64_t v82 = v12;
  uint64_t v83 = v31;
  uint64_t v84 = v13;
  uint64_t v85 = v33;
  uint64_t v86 = v32;
  uint64_t v87 = v14;
  char v88 = v27;
  uint64_t v89 = v16;
  char v90 = v28;
  uint64_t v91 = v18;
  uint64_t v92 = v19;
  double v93 = v20;
  uint64_t v94 = v22;
  uint64_t v95 = v24;
  uint64_t v96 = sub_1000180EC;
  uint64_t v97 = v25;
  uint64_t v98 = 0;
  uint64_t v99 = 0;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1000180F4((uint64_t)&v65);
  sub_10001816C(a1);
  sub_1000181B8((uint64_t)&v78);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000179F0()
{
  return swift_release();
}

uint64_t sub_100017A80(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  sub_100012698((uint64_t)&v2 + 8, (uint64_t)v3, &qword_10002B798);
  sub_100018250((uint64_t)v3);
  sub_100009768(&qword_10002B790);
  State.wrappedValue.getter();
  State.wrappedValue.setter();
  return sub_10001827C((uint64_t)&v2);
}

void *sub_100017B30@<X0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v6[0] = *(_OWORD *)v1;
  v6[1] = v3;
  v6[2] = *(_OWORD *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 48);
  uint64_t v4 = static HorizontalAlignment.center.getter();
  sub_1000170D0((uint64_t *)v6, (uint64_t)__src);
  memcpy(&v9[7], __src, 0x191uLL);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  return memcpy((void *)(a1 + 17), v9, 0x198uLL);
}

uint64_t sub_100017BC4(uint64_t result)
{
  *(unsigned char *)(result + 320) = 1;
  return result;
}

unint64_t sub_100017BD0()
{
  unint64_t result = qword_10002B780;
  if (!qword_10002B780)
  {
    sub_100006364(&qword_10002B770);
    sub_100012018();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002B780);
  }
  return result;
}

uint64_t sub_100017C4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  if (a41)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_100017D38(a37);
    return sub_100017D38(a39);
  }
  else
  {
    swift_retain();
    swift_retain();
    return swift_retain();
  }
}

uint64_t sub_100017D38(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100017D48(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v9 = *(unsigned char *)(a1 + 320);
  long long v7 = *(_OWORD *)(a1 + 272);
  long long v8 = *(_OWORD *)(a1 + 288);
  long long v5 = *(_OWORD *)(a1 + 240);
  long long v6 = *(_OWORD *)(a1 + 256);
  long long v4 = *(_OWORD *)(a1 + 208);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    v4,
    *((void *)&v4 + 1),
    *(void *)(a1 + 224),
    *(void *)(a1 + 232),
    v5,
    *((void *)&v5 + 1),
    v6,
    *((void *)&v6 + 1),
    v7,
    *((void *)&v7 + 1),
    v8,
    *((void *)&v8 + 1),
    *(void *)(a1 + 304),
    *(void *)(a1 + 312),
    v9);
  return a1;
}

uint64_t sub_100017DE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  if (a41)
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    sub_100017ECC(a37);
    return sub_100017ECC(a39);
  }
  else
  {
    swift_release();
    swift_release();
    return swift_release();
  }
}

uint64_t sub_100017ECC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100017EDC(uint64_t a1)
{
  uint64_t v2 = sub_100009768(&qword_10002B760);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100017F3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100017F68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100017F94()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_100017FC0()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_100017FEC(uint64_t result)
{
  *(unsigned char *)(result + 320) = 0;
  return result;
}

uint64_t sub_100017FF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100018020@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10001804C()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_100018078()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_1000180A4()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_1000180EC()
{
  return sub_1000179F0();
}

uint64_t sub_1000180F4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 144);
  uint64_t v3 = *(void *)(a1 + 160);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100017D38(v2);
  sub_100017D38(v3);
  return a1;
}

uint64_t sub_10001816C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000181B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 144);
  uint64_t v3 = *(void *)(a1 + 160);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_100017ECC(v2);
  sub_100017ECC(v3);
  return a1;
}

uint64_t sub_100018234()
{
  return sub_100017A80(*(void *)(v0 + 16));
}

uint64_t sub_100018250(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001827C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000182A8()
{
  return sub_10000A08C(&qword_10002B7A0, &qword_10002B7A8);
}

uint64_t sub_1000182E4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100018358()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

id sub_1000183CC(void *a1)
{
  uint64_t v3 = sub_100009768(&qword_10002BB10);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  long long v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100009768(&qword_10002BB08);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = &v1[OBJC_IVAR____TtC6Charge11ChargeModel__isCharging];
  LOBYTE(v26) = 0;
  uint64_t v12 = v1;
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v10, v7);
  uint64_t v13 = &v12[OBJC_IVAR____TtC6Charge11ChargeModel__supplementaryStatusText];
  uint64_t v26 = 0;
  unint64_t v27 = 0xE000000000000000;
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v13, v6, v3);
  v12[OBJC_IVAR____TtC6Charge11ChargeModel_hasEmittedFinalizedSignpost] = 0;
  os_log_type_t v14 = static os_log_type_t.info.getter();
  sub_10000B7A0(v14, 0xD00000000000001BLL, 0x800000010001C400, 0xD000000000000014, 0x800000010001C420);
  char v15 = (uint64_t *)&v12[OBJC_IVAR____TtC6Charge11ChargeModel__carObservable];
  swift_beginAccess();
  type metadata accessor for CAFCarObservable();
  sub_100019F34();
  id v16 = a1;
  uint64_t *v15 = ObservedObject.init(wrappedValue:)();
  v15[1] = v17;
  swift_endAccess();

  uint64_t v18 = (objc_class *)type metadata accessor for ChargeModel();
  v25.receiver = v12;
  v25.super_class = v18;
  id v19 = [super init];
  double v20 = (void *)CAFCarObservable.observed.getter();
  [v20 registerObserver:v19];

  uint64_t v21 = (void *)CAFCarObservable.observed.getter();
  id v22 = [v21 dimensionManager];

  [v22 registerObserver:v19];
  sub_1000187DC();

  return v19;
}

void sub_1000187DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC6Charge11ChargeModel__carObservable;
  swift_beginAccess();
  id v3 = *(id *)(v2 + 8);
  uint64_t v4 = (void *)dispatch thunk of CAFCarObservable.charging.getter();

  if (v4)
  {
    os_log_type_t v5 = static os_log_type_t.debug.getter();
    sub_10000B7A0(v5, 0xD000000000000023, 0x800000010001C2E0, 0xD000000000000011, 0x800000010001C2C0);
    id v6 = [v4 chargingStatus];
    [v6 registerObserver:v1];

    id v7 = [v4 chargingTime];
    [v7 registerObserver:v1];

    id v8 = [v4 chargingRate];
    [v8 registerObserver:v1];
  }
  id v9 = *(id *)(v2 + 8);
  uint64_t v10 = (void *)dispatch thunk of CAFCarObservable.tripComputer.getter();

  if (v10 && (id v11 = [v10 remainingRange], v10, v11))
  {
    os_log_type_t v12 = static os_log_type_t.debug.getter();
    sub_10000B7A0(v12, 0xD00000000000002ALL, 0x800000010001C290, 0xD000000000000011, 0x800000010001C2C0);
    [v11 registerObserver:v1];
  }
  else if (!v4)
  {
    return;
  }
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  sub_10000B7A0(v13, 0x5D4547524148435BLL, 0xE800000000000000, 0x2928657461647075, 0xE800000000000000);
  sub_100018F74();
  sub_100019100();
}

uint64_t sub_100018C90(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5, unint64_t *a6)
{
  uint64_t v9 = sub_100009768(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  os_log_type_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009C7C(0, a6);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = a3;
  id v14 = a1;
  sub_100019100();

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

void sub_100018F74()
{
  uint64_t v1 = v0;
  uint64_t v2 = (id *)&v0[OBJC_IVAR____TtC6Charge11ChargeModel__carObservable];
  swift_beginAccess();
  id v3 = v2[1];
  uint64_t v4 = (void *)dispatch thunk of CAFCarObservable.charging.getter();

  if (v4)
  {
    id v5 = [v4 chargingStatus];

    if (v5)
    {
      if (sub_1000190A0((BOOL)[v5 chargingState], (uint64_t)&off_100025088)) {
        sub_1000190A0((BOOL)[v5 cableState], (uint64_t)&off_1000250B0);
      }
      swift_getKeyPath();
      swift_getKeyPath();
      id v6 = v1;
      static Published.subscript.setter();
    }
  }
  sub_100019730();
}

BOOL sub_1000190A0(BOOL result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  int v3 = result;
  if (*(unsigned char *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 33; ; ++i)
  {
    uint64_t v5 = i - 31;
    if (__OFADD__(i - 32, 1)) {
      break;
    }
    int v6 = *(unsigned __int8 *)(a2 + i);
    uint64_t result = v6 == v3;
    if (v6 == v3 || v5 == v2) {
      return result;
    }
  }
  __break(1u);
  return result;
}

void sub_100019100()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100009768(&qword_10002BAC0);
  uint64_t v64 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v63 = (char *)&v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100009768(&qword_10002BAC8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  id v8 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v62 - v9;
  uint64_t v67 = 0;
  unint64_t v68 = 0xE000000000000000;
  uint64_t v11 = (id *)&v0[OBJC_IVAR____TtC6Charge11ChargeModel__carObservable];
  swift_beginAccess();
  id v12 = v11[1];
  id v13 = (void *)dispatch thunk of CAFCarObservable.charging.getter();

  if (v13)
  {
    id v14 = [v13 chargingRate];

    if (v14)
    {
      if ([v14 powerInvalid])
      {
        uint64_t v65 = 2108717;
        unint64_t v66 = 0xE300000000000000;
        id v15 = v11[1];
        uint64_t v16 = (void *)CAFCarObservable.observed.getter();

        uint64_t v17 = (void *)CAFCar.dimesionObservable.getter();
        uint64_t v18 = (void *)dispatch thunk of CAFDimensionObservable.vehicleChargePowerUnit.getter();

        id v19 = [v18 symbol];
        uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        id v22 = v21;

        v23._countAndFlagsBits = v20;
        v23._object = v22;
        String.append(_:)(v23);
        swift_bridgeObjectRelease();
        uint64_t v24 = v65;
        unint64_t v25 = v66;
      }
      else
      {
        id v26 = [v14 power];
        sub_100009C7C(0, &qword_10002BAD8);
        static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

        id v27 = v11[1];
        uint64_t v28 = CAFCarObservable.observed.getter();
        uint64_t v62 = v2;
        unsigned int v29 = v1;
        unsigned int v30 = (void *)v28;

        uint64_t v31 = (void *)CAFCar.dimesionObservable.getter();
        Measurement<>.vehicleChargePowerUnit(using:)();

        uint64_t v32 = *(void (**)(char *, uint64_t))(v5 + 8);
        v32(v8, v4);
        uint64_t v33 = Measurement<>.formattedString(maximumFractionDigits:)();
        unint64_t v25 = v34;
        v32(v10, v4);
        uint64_t v1 = v29;
        uint64_t v2 = v62;
        uint64_t v24 = v33;
      }
      unint64_t v35 = v25;
      String.append(_:)(*(Swift::String *)&v24);
      swift_bridgeObjectRelease();
    }
  }
  id v36 = v11[1];
  long long v37 = (void *)dispatch thunk of CAFCarObservable.tripComputer.getter();

  if (v37)
  {
    id v38 = [v37 remainingRange];

    if (v38)
    {
      uint64_t v39 = v67 & 0xFFFFFFFFFFFFLL;
      if ((v68 & 0x2000000000000000) != 0) {
        uint64_t v39 = HIBYTE(v68) & 0xF;
      }
      if (v39)
      {
        v40._countAndFlagsBits = 0x20A280E220;
        v40._object = (void *)0xA500000000000000;
        String.append(_:)(v40);
      }
      id v41 = v11[1];
      long long v42 = (void *)CAFCarObservable.observed.getter();

      id v43 = [v42 dimensionManager];
      id v44 = [v43 measurementSystem];

      if (v44)
      {
        if ([v38 distanceMilesInvalid])
        {
          uint64_t v65 = 2108717;
          unint64_t v66 = 0xE300000000000000;
          id v45 = [self miles];
          id v46 = [v45 symbol];
LABEL_18:
          id v47 = v46;

          uint64_t v48 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          unsigned int v50 = v49;

          v51._countAndFlagsBits = v48;
          v51._object = v50;
          String.append(_:)(v51);
          swift_bridgeObjectRelease();
          uint64_t v52 = v65;
          unint64_t v53 = v66;
LABEL_22:
          unint64_t v59 = v53;
          String.append(_:)(*(Swift::String *)&v52);
          swift_bridgeObjectRelease();

          goto LABEL_23;
        }
        id v54 = [v38 distanceMiles];
      }
      else
      {
        if ([v38 distanceKMInvalid])
        {
          uint64_t v65 = 2108717;
          unint64_t v66 = 0xE300000000000000;
          id v45 = [self kilometers];
          id v46 = [v45 symbol];
          goto LABEL_18;
        }
        id v54 = [v38 distanceKM];
      }
      id v55 = v54;
      sub_100009C7C(0, &qword_10002BAD0);
      uint64_t v56 = v63;
      static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v57 = Measurement<>.formattedString(maximumFractionDigits:)();
      unint64_t v53 = v58;
      (*(void (**)(char *, uint64_t))(v64 + 8))(v56, v2);
      uint64_t v52 = v57;
      goto LABEL_22;
    }
  }
LABEL_23:
  uint64_t v60 = v67;
  unint64_t v61 = v68;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v65 = v60;
  unint64_t v66 = v61;
  v1;
  static Published.subscript.setter();
  sub_100019730();
}

void sub_100019730()
{
  uint64_t v1 = OBJC_IVAR____TtC6Charge11ChargeModel_hasEmittedFinalizedSignpost;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC6Charge11ChargeModel_hasEmittedFinalizedSignpost)) {
    return;
  }
  uint64_t v2 = v0;
  uint64_t v3 = v0 + OBJC_IVAR____TtC6Charge11ChargeModel__carObservable;
  swift_beginAccess();
  id v4 = *(id *)(v3 + 8);
  uint64_t v5 = (void *)CAFCarObservable.observed.getter();

  id v6 = [v5 charging];
  if (!v6)
  {
LABEL_8:
    os_log_type_t v12 = static os_log_type_t.info.getter();
    sub_10000B7A0(v12, 0xD000000000000020, 0x800000010001C210, 0xD000000000000017, 0x800000010001C240);
    return;
  }
  if (![v6 receivedAllValues])
  {

    goto LABEL_8;
  }
  id v7 = *(id *)(v3 + 8);
  id v8 = (void *)CAFCarObservable.observed.getter();

  id v9 = [v8 highVoltageBattery];
  if (v9)
  {
    if ([v9 receivedAllValues])
    {
      id v10 = *(id *)(v3 + 8);
      uint64_t v11 = (void *)CAFCarObservable.observed.getter();

      CAFSignpostEmit_Finalized();
      *(unsigned char *)(v2 + v1) = 1;
      return;
    }
  }
  os_log_type_t v13 = static os_log_type_t.info.getter();
  sub_10000B7A0(v13, 0xD00000000000002ALL, 0x800000010001C260, 0xD000000000000017, 0x800000010001C240);
}

id sub_100019934()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ChargeModel();
  return [super dealloc];
}

uint64_t sub_100019A3C()
{
  return type metadata accessor for ChargeModel();
}

uint64_t type metadata accessor for ChargeModel()
{
  uint64_t result = qword_10002BAA0;
  if (!qword_10002BAA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100019A90()
{
  sub_100019B8C(319, &qword_10002BAB0);
  if (v0 <= 0x3F)
  {
    sub_100019B8C(319, &qword_10002BAB8);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_100019B8C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = type metadata accessor for Published();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_100019BD4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ChargeModel();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100019C14@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100019C94(uint64_t a1, void **a2)
{
  objc_super v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return static Published.subscript.setter();
}

uint64_t sub_100019D04@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_100019D84(uint64_t a1, void **a2)
{
  objc_super v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return static Published.subscript.setter();
}

uint64_t sub_100019E14(uint64_t a1)
{
  uint64_t v2 = sub_100009768(&qword_10002BAE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100019E74(char a1)
{
  if (a1)
  {
    os_log_type_t v1 = static os_log_type_t.debug.getter();
    sub_10000B7A0(v1, 0xD00000000000001FLL, 0x800000010001C390, 0xD000000000000022, 0x800000010001C360);
    sub_1000187DC();
  }
  else
  {
    os_log_type_t v2 = static os_log_type_t.info.getter();
    sub_10000B7A0(v2, 0xD000000000000020, 0x800000010001C330, 0xD000000000000022, 0x800000010001C360);
  }
}

unint64_t sub_100019F34()
{
  unint64_t result = qword_10002BB18;
  if (!qword_10002BB18)
  {
    type metadata accessor for CAFCarObservable();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002BB18);
  }
  return result;
}

id ConfigurationIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id ConfigurationIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfigurationIntent();
  return [super init];
}

uint64_t type metadata accessor for ConfigurationIntent()
{
  return self;
}

id ConfigurationIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id ConfigurationIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ConfigurationIntent();
  [super initWithCoder:a1];

  return v3;
}

id ConfigurationIntent.__deallocating_deinit()
{
  return sub_10001A66C(type metadata accessor for ConfigurationIntent);
}

unint64_t ConfigurationIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_10001A6A4(a1);
}

BOOL sub_10001A16C(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10001A180()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10001A1C8()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10001A1F4()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t sub_10001A238@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_10001A6A4(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_10001A26C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t ConfigurationIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___ConfigurationIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *ConfigurationIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)[objc_allocWithZone(v2) init];
  id v6 = &v5[OBJC_IVAR___ConfigurationIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  id v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

char *ConfigurationIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)[v2 init];
  id v6 = &v5[OBJC_IVAR___ConfigurationIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  id v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

id ConfigurationIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  return [super init];
}

id ConfigurationIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  id v3 = [super initWithCoder:a1];

  return v3;
}

id ConfigurationIntentResponse.__deallocating_deinit()
{
  return sub_10001A66C(type metadata accessor for ConfigurationIntentResponse);
}

id sub_10001A66C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

unint64_t sub_10001A6A4(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for ConfigurationIntentResponse()
{
  return self;
}

unint64_t sub_10001A6DC()
{
  unint64_t result = qword_10002BB88;
  if (!qword_10002BB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002BB88);
  }
  return result;
}

uint64_t sub_10001A730@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___ConfigurationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_10001A784(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___ConfigurationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for ConfigurationIntentResponseCode()
{
  return &type metadata for ConfigurationIntentResponseCode;
}

uint64_t sub_10001A7EC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t CAFObserved<>.observable.getter()
{
  return CAFObserved<>.observable.getter();
}

uint64_t dispatch thunk of CAFCarObservable.tripComputer.getter()
{
  return dispatch thunk of CAFCarObservable.tripComputer.getter();
}

uint64_t dispatch thunk of CAFCarObservable.highVoltageBattery.getter()
{
  return dispatch thunk of CAFCarObservable.highVoltageBattery.getter();
}

uint64_t dispatch thunk of CAFCarObservable.charging.getter()
{
  return dispatch thunk of CAFCarObservable.charging.getter();
}

uint64_t CAFCarObservable.observed.getter()
{
  return CAFCarObservable.observed.getter();
}

uint64_t type metadata accessor for CAFCarObservable()
{
  return type metadata accessor for CAFCarObservable();
}

uint64_t dispatch thunk of CAFDimensionObservable.vehicleChargePowerUnit.getter()
{
  return dispatch thunk of CAFDimensionObservable.vehicleChargePowerUnit.getter();
}

uint64_t dispatch thunk of CAFCarManagerObservable.$currentCar.getter()
{
  return dispatch thunk of CAFCarManagerObservable.$currentCar.getter();
}

uint64_t dispatch thunk of CAFBatteryLevelObservable.batteryTargetChargeLevel.getter()
{
  return dispatch thunk of CAFBatteryLevelObservable.batteryTargetChargeLevel.getter();
}

uint64_t dispatch thunk of CAFBatteryLevelObservable.batteryLevel.getter()
{
  return dispatch thunk of CAFBatteryLevelObservable.batteryLevel.getter();
}

uint64_t CAFBatteryLevelObservable.observed.getter()
{
  return CAFBatteryLevelObservable.observed.getter();
}

uint64_t type metadata accessor for CAFBatteryLevelObservable()
{
  return type metadata accessor for CAFBatteryLevelObservable();
}

uint64_t dispatch thunk of CAFChargingTimeObservable.remainingTime.getter()
{
  return dispatch thunk of CAFChargingTimeObservable.remainingTime.getter();
}

uint64_t CAFChargingTimeObservable.observed.getter()
{
  return CAFChargingTimeObservable.observed.getter();
}

uint64_t type metadata accessor for CAFChargingTimeObservable()
{
  return type metadata accessor for CAFChargingTimeObservable();
}

uint64_t Measurement<>.formattedString(maximumFractionDigits:)()
{
  return Measurement<>.formattedString(maximumFractionDigits:)();
}

uint64_t Measurement<>.vehicleChargePowerUnit(using:)()
{
  return Measurement<>.vehicleChargePowerUnit(using:)();
}

uint64_t static Measurement._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Measurement.value.getter()
{
  return Measurement.value.getter();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t static Locale._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Locale._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
}

uint64_t AxisGridLine.init(centered:stroke:)()
{
  return AxisGridLine.init(centered:stroke:)();
}

uint64_t type metadata accessor for AxisGridLine()
{
  return type metadata accessor for AxisGridLine();
}

uint64_t ChartContent.annotation<A>(position:alignment:spacing:content:)()
{
  return ChartContent.annotation<A>(position:alignment:spacing:content:)();
}

uint64_t ChartContent.foregroundStyle<A>(_:)()
{
  return ChartContent.foregroundStyle<A>(_:)();
}

uint64_t ChartContent.lineStyle(_:)()
{
  return ChartContent.lineStyle(_:)();
}

uint64_t static AxisMarkPreset.automatic.getter()
{
  return static AxisMarkPreset.automatic.getter();
}

uint64_t type metadata accessor for AxisMarkPreset()
{
  return type metadata accessor for AxisMarkPreset();
}

uint64_t static AxisMarkValues.automatic.getter()
{
  return static AxisMarkValues.automatic.getter();
}

uint64_t type metadata accessor for AxisMarkValues()
{
  return type metadata accessor for AxisMarkValues();
}

uint64_t AxisValueLabel.init<>(centered:anchor:multiLabelAlignment:collisionResolution:offsetsMarks:orientation:horizontalSpacing:verticalSpacing:)()
{
  return AxisValueLabel.init<>(centered:anchor:multiLabelAlignment:collisionResolution:offsetsMarks:orientation:horizontalSpacing:verticalSpacing:)();
}

uint64_t static PlottableValue.value(_:_:)()
{
  return static PlottableValue.value(_:_:)();
}

uint64_t static PlottableValue.value<A>(_:_:)()
{
  return static PlottableValue.value<A>(_:_:)();
}

uint64_t static AxisMarkPosition.automatic.getter()
{
  return static AxisMarkPosition.automatic.getter();
}

uint64_t type metadata accessor for AxisMarkPosition()
{
  return type metadata accessor for AxisMarkPosition();
}

uint64_t static AnnotationPosition.top.getter()
{
  return static AnnotationPosition.top.getter();
}

uint64_t type metadata accessor for AnnotationPosition()
{
  return type metadata accessor for AnnotationPosition();
}

uint64_t static AxisValueLabelOrientation.automatic.getter()
{
  return static AxisValueLabelOrientation.automatic.getter();
}

uint64_t type metadata accessor for AxisValueLabelOrientation()
{
  return type metadata accessor for AxisValueLabelOrientation();
}

uint64_t static AxisValueLabelCollisionResolution.automatic.getter()
{
  return static AxisValueLabelCollisionResolution.automatic.getter();
}

uint64_t type metadata accessor for AxisValueLabelCollisionResolution()
{
  return type metadata accessor for AxisValueLabelCollisionResolution();
}

uint64_t Chart.init(content:)()
{
  return Chart.init(content:)();
}

uint64_t BarMark.init<A>(xStart:xEnd:y:height:stacking:)()
{
  return BarMark.init<A>(xStart:xEnd:y:height:stacking:)();
}

uint64_t type metadata accessor for BarMark()
{
  return type metadata accessor for BarMark();
}

uint64_t AxisMark.foregroundStyle<A>(_:)()
{
  return AxisMark.foregroundStyle<A>(_:)();
}

uint64_t RuleMark.init<A>(xStart:xEnd:y:)()
{
  return RuleMark.init<A>(xStart:xEnd:y:)();
}

uint64_t type metadata accessor for RuleMark()
{
  return type metadata accessor for RuleMark();
}

uint64_t AxisMarks.init(preset:position:values:content:)()
{
  return AxisMarks.init(preset:position:values:content:)();
}

uint64_t type metadata accessor for ScaleType()
{
  return type metadata accessor for ScaleType();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

uint64_t static ObservableObject.environmentStore.getter()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t static Published.subscript.getter()
{
  return static Published.subscript.getter();
}

uint64_t static Published.subscript.setter()
{
  return static Published.subscript.setter();
}

uint64_t type metadata accessor for Published()
{
  return type metadata accessor for Published();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t StateObject.wrappedValue.getter()
{
  return StateObject.wrappedValue.getter();
}

uint64_t StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t static ViewModifier._makeView(modifier:inputs:body:)()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t static ViewModifier._makeViewList(modifier:inputs:body:)()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t static ViewModifier._viewListCount(inputs:body:)()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t AnyShapeStyle.init<A>(_:)()
{
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t GeometryProxy.size.getter()
{
  return GeometryProxy.size.getter();
}

uint64_t type metadata accessor for GeometryProxy()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t withAnimation<A>(_:_:)()
{
  return withAnimation<A>(_:_:)();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t EnvironmentObject.error()()
{
  return EnvironmentObject.error()();
}

uint64_t EnvironmentObject.init()()
{
  return EnvironmentObject.init()();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.tint.getter()
{
  return EnvironmentValues.tint.getter();
}

uint64_t EnvironmentValues.tint.setter()
{
  return EnvironmentValues.tint.setter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t AccessoryCircularCapacityGaugeStyle.init()()
{
  return AccessoryCircularCapacityGaugeStyle.init()();
}

uint64_t type metadata accessor for AccessoryCircularCapacityGaugeStyle()
{
  return type metadata accessor for AccessoryCircularCapacityGaugeStyle();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.top.getter()
{
  return static Edge.Set.top.getter();
}

uint64_t static Edge.Set.bottom.getter()
{
  return static Edge.Set.bottom.getter();
}

uint64_t static Edge.Set.leading.getter()
{
  return static Edge.Set.leading.getter();
}

uint64_t Edge.Set.init(rawValue:)()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t Font.monospaced()()
{
  return Font.monospaced()();
}

uint64_t type metadata accessor for Font.Design()
{
  return type metadata accessor for Font.Design();
}

uint64_t static Font.system(size:weight:design:)()
{
  return static Font.system(size:weight:design:)();
}

uint64_t Font.init(_:)()
{
  return Font.init(_:)();
}

uint64_t Text.foregroundColor(_:)()
{
  return Text.foregroundColor(_:)();
}

uint64_t Text.foregroundStyle<A>(_:)()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t View.chartYAxis<A>(content:)()
{
  return View.chartYAxis<A>(content:)();
}

uint64_t View.chartYScale<A>(domain:type:)()
{
  return View.chartYScale<A>(domain:type:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.gaugeStyle<A>(_:)()
{
  return View.gaugeStyle<A>(_:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.allowsGaugeResizing(_:)()
{
  return View.allowsGaugeResizing(_:)();
}

uint64_t type metadata accessor for Color.RGBColorSpace()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t static Color.red.getter()
{
  return static Color.red.getter();
}

uint64_t static Color.blue.getter()
{
  return static Color.blue.getter();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t static Color.green.getter()
{
  return static Color.green.getter();
}

uint64_t static Color.yellow.getter()
{
  return static Color.yellow.getter();
}

uint64_t static Color.primary.getter()
{
  return static Color.primary.getter();
}

uint64_t static Color.secondary.getter()
{
  return static Color.secondary.getter();
}

uint64_t Color.init(_:red:green:blue:opacity:)()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t Color.init(_:bundle:)()
{
  return Color.init(_:bundle:)();
}

uint64_t Color.init(_:)()
{
  return Color.init(_:)();
}

uint64_t Gauge.init<A>(value:in:label:)()
{
  return Gauge.init<A>(value:in:label:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

uint64_t State.wrappedValue.setter()
{
  return State.wrappedValue.setter();
}

uint64_t Gradient.init(colors:)()
{
  return Gradient.init(colors:)();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t Animation.repeatForever(autoreverses:)()
{
  return Animation.repeatForever(autoreverses:)();
}

uint64_t static Animation.linear(duration:)()
{
  return static Animation.linear(duration:)();
}

uint64_t static UnitPoint.center.getter()
{
  return static UnitPoint.center.getter();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t NSMeasurementFormatter.string<A>(from:)()
{
  return NSMeasurementFormatter.string<A>(from:)();
}

uint64_t CAFCar.dimesionObservable.getter()
{
  return CAFCar.dimesionObservable.getter();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t CAFSignpostEmit_Finalized()
{
  return _CAFSignpostEmit_Finalized();
}

uint64_t CAFSignpostEmit_Launched()
{
  return _CAFSignpostEmit_Launched();
}

uint64_t CAFSignpostEmit_Rendered()
{
  return _CAFSignpostEmit_Rendered();
}

uint64_t CAFSignpostEmit_Scene()
{
  return _CAFSignpostEmit_Scene();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void exit(int a1)
{
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
  return [super a2];
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}