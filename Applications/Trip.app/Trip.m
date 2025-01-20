void sub_100004340()
{
  void *v0;
  void *v1;
  char v2;
  os_log_type_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  Class isa;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  objc_super v55;

  v1 = v0;
  v55.receiver = v0;
  v55.super_class = (Class)type metadata accessor for TripViewController();
  [super viewDidLoad];
  v2 = *((unsigned char *)v0 + OBJC_IVAR____TtC4Trip18TripViewController_presentationMode);
  v3 = static os_log_type_t.debug.getter();
  sub_10001B638(v3, 0xD000000000000020, 0x80000001000275A0, 0xD000000000000017, 0x8000000100027580);
  HIBYTE(v54) = 0;
  State.init(wrappedValue:)();
  LOBYTE(v52) = 0;
  LOBYTE(v53) = v50;
  LOBYTE(v54) = v2;
  v4 = objc_allocWithZone((Class)sub_100004E64((uint64_t *)&unk_1000368B0));
  v5 = (void *)UIHostingController.init(rootView:)();
  v6 = [v5 view:sub_10000503C, 0, v52, v53, v51, v54];
  if (!v6)
  {
    __break(1u);
    goto LABEL_15;
  }
  v7 = v6;
  v8 = [self clearColor];
  [v7 setBackgroundColor:v8];

  [v1 addChildViewController:v5];
  v9 = [v5 view];
  if (!v9)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v10 = v9;
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [v1 view];
  if (!v11)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v12 = v11;
  v13 = [v5 view];
  if (!v13)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v14 = v13;
  [v12 addSubview:v13];

  [v5 didMoveToParentViewController:v1];
  sub_100004E64(&qword_100036D60);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_100026280;
  v16 = [v5 view];
  if (!v16)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v17 = v16;
  v18 = [v16 topAnchor];

  v19 = [v1 view];
  if (!v19)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v20 = v19;
  v21 = [v19 safeAreaLayoutGuide];

  v22 = [v21 topAnchor];
  v23 = [v18 constraintEqualToAnchor:v22];

  *(void *)(v15 + 32) = v23;
  v24 = [v5 view];
  if (!v24)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v25 = v24;
  v26 = [v24 bottomAnchor];

  v27 = [v1 view];
  if (!v27)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v28 = v27;
  v29 = [v27 safeAreaLayoutGuide];

  v30 = [v29 bottomAnchor];
  v31 = [v26 constraintEqualToAnchor:v30];

  *(void *)(v15 + 40) = v31;
  v32 = [v5 view];
  if (!v32)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v33 = v32;
  v34 = [v32 leadingAnchor];

  v35 = [v1 view];
  if (!v35)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v36 = v35;
  v37 = [v35 safeAreaLayoutGuide];

  v38 = [v37 leadingAnchor];
  v39 = [v34 constraintEqualToAnchor:v38];

  *(void *)(v15 + 48) = v39;
  v40 = [v5 view];
  if (!v40)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v41 = v40;
  v42 = [v40 trailingAnchor];

  v43 = [v1 view];
  if (v43)
  {
    v44 = v43;
    v45 = self;
    v46 = [v44 safeAreaLayoutGuide];

    v47 = [v46 trailingAnchor];
    v48 = [v42 constraintEqualToAnchor:v47];

    *(void *)(v15 + 56) = v48;
    specialized Array._endMutation()();
    sub_100004EA8();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v45 activateConstraints:isa v15];

    CAFSignpostEmit_Rendered();
    return;
  }
LABEL_25:
  __break(1u);
}

id sub_100004958()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TripViewController();
  [super dealloc];
}

uint64_t type metadata accessor for TripViewController()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for TripsContentView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_1000049E8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000049F4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100004A14(uint64_t result, int a2, int a3)
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

uint64_t sub_100004A54(uint64_t a1, uint64_t a2)
{
  return sub_100004B4C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100004A6C()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100004AC0()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100004B34(uint64_t a1, uint64_t a2)
{
  return sub_100004B4C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100004B4C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100004B90(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100004C08(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100004C88@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100004CCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100004CF8()
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

uint64_t sub_100004D84@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100004DCC(uint64_t a1)
{
  uint64_t v2 = sub_100004FC0((unint64_t *)&qword_1000368F0);
  uint64_t v3 = sub_100004FC0(&qword_1000368F8);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100004E64(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100004EA8()
{
  unint64_t result = qword_1000368C0;
  if (!qword_1000368C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000368C0);
  }
  return result;
}

void type metadata accessor for CAFMeasurementSystem(uint64_t a1)
{
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

void sub_100004F10(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100004F58()
{
  return sub_100004FC0(&qword_1000368D8);
}

uint64_t sub_100004F8C()
{
  return sub_100004FC0(&qword_1000368E0);
}

uint64_t sub_100004FC0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for LaunchOptionsKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005004()
{
  return sub_100004FC0(&qword_1000368E8);
}

uint64_t sub_10000503C()
{
  if (qword_1000367C8 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_100005098@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (_OWORD *)v1;
  type metadata accessor for TripCAFManager();
  sub_100005AD8(&qword_100036A20, (void (*)(uint64_t))type metadata accessor for TripCAFManager);
  StateObject.wrappedValue.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (v51[0])
  {
    uint64_t KeyPath = swift_getKeyPath();
    type metadata accessor for TripModel();
    sub_100005AD8(&qword_100036A30, (void (*)(uint64_t))type metadata accessor for TripModel);
    id v4 = v51[0];
    uint64_t v5 = ObservedObject.init(wrappedValue:)();
    uint64_t v19 = v6;
    uint64_t v20 = v5;
    char v21 = *(unsigned char *)(v1 + 40);
    long long v50 = *(_OWORD *)(v1 + 24);
    *(_OWORD *)v27 = *(_OWORD *)(v1 + 24);
    sub_100004E64(&qword_100036A38);
    State.projectedValue.getter();
    id v17 = v51[1];
    id v18 = v51[0];
    char v16 = v52;
    type metadata accessor for ConsoleMetrics();
    swift_allocObject();
    uint64_t v15 = sub_10001FE9C();
    type metadata accessor for ClusterMetrics();
    swift_allocObject();
    uint64_t v14 = sub_1000201AC();
    type metadata accessor for WidgetMetrics();
    swift_allocObject();
    uint64_t v7 = sub_100020538();
    uint64_t v8 = a1;
    uint64_t v9 = swift_getKeyPath();
    uint64_t v10 = swift_allocObject();
    long long v11 = v2[1];
    *(_OWORD *)(v10 + 16) = *v2;
    *(_OWORD *)(v10 + 32) = v11;
    *(_OWORD *)(v10 + 41) = *(_OWORD *)((char *)v2 + 25);
    *(void *)(v10 + 64) = v4;
    sub_100005664();
    sub_100005B78((uint64_t)&v50);
    *(_DWORD *)v29 = *(_DWORD *)v26;
    *(_DWORD *)&v29[3] = *(_DWORD *)&v26[3];
    *(_DWORD *)v35 = *(_DWORD *)v25;
    *(_DWORD *)&v35[3] = *(_DWORD *)&v25[3];
    *(_DWORD *)v38 = *(_DWORD *)v24;
    *(_DWORD *)&v38[3] = *(_DWORD *)&v24[3];
    *(_DWORD *)v42 = *(_DWORD *)v23;
    *(_DWORD *)&v42[3] = *(_DWORD *)&v23[3];
    *(void *)v27 = KeyPath;
    memset(&v27[8], 0, 48);
    char v28 = 0;
    uint64_t v30 = v20;
    uint64_t v31 = v19;
    v32 = sub_100020910;
    uint64_t v33 = 0;
    char v34 = 0;
    uint64_t v36 = v9;
    a1 = v8;
    char v37 = v21;
    id v39 = v18;
    id v40 = v17;
    char v41 = v16;
    uint64_t v43 = v15;
    uint64_t v44 = v14;
    uint64_t v45 = v7;
    v46 = sub_100005B6C;
    uint64_t v47 = v10;
    uint64_t v48 = static Alignment.center.getter();
    uint64_t v49 = v12;
    nullsub_1(v27);
  }
  else
  {
    sub_100005A44((uint64_t)v27);
  }
  sub_100005A68((uint64_t)v27, (uint64_t)v51);
  return sub_100005A68((uint64_t)v51, a1);
}

id sub_100005414@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  id v18 = a3;
  uint64_t v7 = type metadata accessor for GeometryProxy();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = static Color.clear.getter();
  long long v11 = *a2;
  char v21 = *((unsigned char *)a2 + 16);
  long long v19 = *(long long *)((char *)a2 + 24);
  long long v20 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 57) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v13 = (_OWORD *)swift_allocObject();
  long long v14 = a2[1];
  v13[1] = *a2;
  v13[2] = v14;
  *(_OWORD *)((char *)v13 + 41) = *(long long *)((char *)a2 + 25);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))((char *)v13 + v12, (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  *(void *)((char *)v13 + ((v9 + v12 + 7) & 0xFFFFFFFFFFFFFFF8)) = v18;
  *a4 = v10;
  a4[1] = (uint64_t)sub_100005C9C;
  a4[2] = (uint64_t)v13;
  a4[3] = 0;
  a4[4] = 0;
  sub_100005D2C((uint64_t)&v20);
  sub_100005B78((uint64_t)&v19);
  uint64_t v15 = v18;

  return v15;
}

void sub_1000055C0()
{
}

uint64_t sub_100005644()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100005664()
{
  return swift_retain();
}

uint64_t destroy for TripsContentView()
{
  sub_1000056B0();

  return swift_release();
}

uint64_t sub_1000056B0()
{
  return swift_release();
}

uint64_t initializeWithCopy for TripsContentView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_100005664();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  *(void *)(a1 + 32) = a2[4];
  *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for TripsContentView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_100005664();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_1000056B0();
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  *(void *)(a1 + 32) = a2[4];
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
  return a1;
}

__n128 initializeWithTake for TripsContentView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for TripsContentView(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_1000056B0();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for TripsContentView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 32);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TripsContentView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(void *)(result + 32) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TripsContentView()
{
  return &type metadata for TripsContentView;
}

uint64_t sub_100005900()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 sub_10000591C@<Q0>(__n128 *a1@<X8>)
{
  sub_100005D60();
  EnvironmentValues.subscript.getter();
  __n128 result = v7;
  a1->n128_u8[0] = v3;
  a1->n128_u64[1] = v4;
  a1[1].n128_u64[0] = v5;
  a1[1].n128_u8[8] = v6;
  a1[2] = v7;
  a1[3].n128_u64[0] = v8;
  return result;
}

uint64_t sub_10000598C()
{
  return EnvironmentValues.subscript.setter();
}

double sub_100005A44(uint64_t a1)
{
  *(void *)(a1 + 192) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
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

uint64_t sub_100005A68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004E64(&qword_100036A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005AD8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100005B20()
{
  sub_1000056B0();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

id sub_100005B6C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100005414(a1, (long long *)(v2 + 16), *(void **)(v2 + 64), a2);
}

uint64_t sub_100005B78(uint64_t a1)
{
  return a1;
}

uint64_t sub_100005BA8()
{
  uint64_t v1 = type metadata accessor for GeometryProxy();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 57) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_1000056B0();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6 + 8, v5);
}

void sub_100005C9C()
{
  type metadata accessor for GeometryProxy();

  sub_1000055C0();
}

uint64_t sub_100005D2C(uint64_t a1)
{
  return a1;
}

unint64_t sub_100005D60()
{
  unint64_t result = qword_100036A40;
  if (!qword_100036A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100036A40);
  }
  return result;
}

unint64_t sub_100005DB8()
{
  unint64_t result = qword_100036A48;
  if (!qword_100036A48)
  {
    sub_100005E2C(&qword_100036A28);
    sub_100005E74();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100036A48);
  }
  return result;
}

uint64_t sub_100005E2C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005E74()
{
  unint64_t result = qword_100036A50;
  if (!qword_100036A50)
  {
    sub_100005E2C(&qword_100036A58);
    sub_100005F14();
    sub_100006008(&qword_100036A88, &qword_100036A90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100036A50);
  }
  return result;
}

unint64_t sub_100005F14()
{
  unint64_t result = qword_100036A60;
  if (!qword_100036A60)
  {
    sub_100005E2C(&qword_100036A68);
    sub_100005FB4();
    sub_100006008(&qword_100036A78, &qword_100036A80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100036A60);
  }
  return result;
}

unint64_t sub_100005FB4()
{
  unint64_t result = qword_100036A70;
  if (!qword_100036A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100036A70);
  }
  return result;
}

uint64_t sub_100006008(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005E2C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

char *sub_10000604C(void *a1, char a2)
{
  id v5 = objc_allocWithZone((Class)UIWindow);
  unint64_t v6 = v2;
  id v7 = [v5 initWithWindowScene:a1];
  uint64_t v8 = OBJC_IVAR____TtC4Trip17TripWindowManager_window;
  *(void *)&v6[OBJC_IVAR____TtC4Trip17TripWindowManager_window] = v7;
  [v7 setAutoresizesSubviews:1];
  [*(id *)&v6[v8] setHidden:0];
  id v9 = *(id *)&v6[v8];
  [v9 makeKeyAndVisible];

  v19.receiver = v6;
  v19.super_class = (Class)type metadata accessor for TripWindowManager();
  uint64_t v10 = (char *)[super init];
  long long v11 = *(void **)&v10[OBJC_IVAR____TtC4Trip17TripWindowManager_window];
  unint64_t v12 = (objc_class *)type metadata accessor for TripViewController();
  v13 = objc_allocWithZone(v12);
  v13[OBJC_IVAR____TtC4Trip18TripViewController_presentationMode] = a2;
  v18.receiver = v13;
  v18.super_class = v12;
  long long v14 = v10;
  id v15 = v11;
  [super initWithNibName:0 bundle:0];
  [v15 setRootViewController:v16];

  return v14;
}

id sub_1000061D0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TripWindowManager();
  return [super dealloc];
}

uint64_t type metadata accessor for TripWindowManager()
{
  return self;
}

uint64_t sub_100006238()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

id sub_1000062AC()
{
  id result = [objc_allocWithZone((Class)CAFCarManager) init];
  qword_100036AC8 = (uint64_t)result;
  return result;
}

uint64_t sub_1000062E0()
{
  if (qword_1000367C0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_100036AC8;
  sub_100006CB8(0, &qword_100036C20);
  sub_100006C74(&qword_100036C28, &qword_100036C20);
  id v1 = v0;
  objc_super v2 = (void *)CAFObserved<>.observable.getter();

  type metadata accessor for TripCAFManager();
  uint64_t v3 = swift_allocObject();
  uint64_t result = sub_1000063D0(v2);
  qword_1000393A0 = v3;
  return result;
}

uint64_t sub_1000063D0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100004E64(&qword_100036C30);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004E64(&qword_100036C18);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  long long v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v2 + OBJC_IVAR____TtC4Trip14TripCAFManager__model;
  v16[1] = 0;
  sub_100004E64((uint64_t *)&unk_100036B28);
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  *(void *)(v2 + OBJC_IVAR____TtC4Trip14TripCAFManager_cancellables) = &_swiftEmptySetSingleton;
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  sub_10001B638(v13, 0xD00000000000001CLL, 0x80000001000276B0, 0xD000000000000011, 0x80000001000276D0);
  *(void *)(v2 + OBJC_IVAR____TtC4Trip14TripCAFManager_carManager) = a1;
  id v14 = a1;
  dispatch thunk of CAFCarManagerObservable.$currentCar.getter();
  swift_allocObject();
  swift_weakInit();
  sub_100006C18();
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();

  return v2;
}

uint64_t sub_10000667C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  _StringGuts.grow(_:)(20);
  swift_bridgeObjectRelease();
  sub_100004E64(&qword_100036C40);
  sub_100006C74(&qword_100036C48, &qword_100036C50);
  v2._countAndFlagsBits = Optional<A>.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  os_log_type_t v3 = static os_log_type_t.info.getter();
  sub_10001B638(v3, 0xD000000000000012, 0x80000001000276F0, 0xD000000000000011, 0x80000001000276D0);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (v1)
    {
      sub_100006CB8(0, &qword_100036C50);
      sub_100006C74(&qword_100036C58, &qword_100036C50);
      uint64_t v5 = (void *)CAFObserved<>.observable.getter();
      id v6 = objc_allocWithZone((Class)type metadata accessor for TripModel());
      sub_100008E58(v5);
    }
    swift_getKeyPath();
    swift_getKeyPath();
    return static Published.subscript.setter();
  }
  return result;
}

uint64_t sub_10000686C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC4Trip14TripCAFManager__model;
  uint64_t v2 = sub_100004E64(&qword_100036C18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_100006930()
{
  return type metadata accessor for TripCAFManager();
}

uint64_t type metadata accessor for TripCAFManager()
{
  uint64_t result = qword_100036B10;
  if (!qword_100036B10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100006984()
{
  sub_100006A30();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100006A30()
{
  if (!qword_100036B20)
  {
    sub_100005E2C((uint64_t *)&unk_100036B28);
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100036B20);
    }
  }
}

void *sub_100006A8C()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100006A98@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for TripCAFManager();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100006AD8@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100006B5C(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return static Published.subscript.setter();
}

uint64_t sub_100006BD8()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006C10(uint64_t *a1)
{
  return sub_10000667C(a1);
}

unint64_t sub_100006C18()
{
  unint64_t result = qword_100036C38;
  if (!qword_100036C38)
  {
    sub_100005E2C(&qword_100036C30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100036C38);
  }
  return result;
}

uint64_t sub_100006C74(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006CB8(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006CB8(uint64_t a1, unint64_t *a2)
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

void *sub_100006CF4()
{
  uint64_t v1 = v0;
  sub_100004E64(&qword_100036D78);
  ((void (*)(void))__chkstk_darwin)();
  v182 = (char *)&v173 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v192 = sub_100004E64(&qword_100036D68);
  uint64_t v196 = *(void *)(v192 - 8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v173 = (char *)&v173 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  v174 = (char *)&v173 - v6;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v173 - v7;
  uint64_t v9 = sub_100004E64(&qword_100036D80);
  __chkstk_darwin(v9 - 8);
  v189 = (char *)&v173 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100004E64(&qword_100036D88);
  uint64_t v190 = *(void *)(v11 - 8);
  uint64_t v191 = v11;
  __chkstk_darwin(v11);
  v195 = (char *)&v173 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100004E64(&qword_100036D90);
  __chkstk_darwin(v13 - 8);
  v194 = (char *)&v173 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100004E64(&qword_100036D98);
  uint64_t v187 = *(void *)(v15 - 8);
  uint64_t v188 = v15;
  __chkstk_darwin(v15);
  v181 = (char *)&v173 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100004E64(&qword_100036DA0);
  __chkstk_darwin(v17 - 8);
  v179 = (char *)&v173 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100004E64(&qword_100036DA8);
  uint64_t v185 = *(void *)(v19 - 8);
  uint64_t v186 = v19;
  uint64_t v20 = __chkstk_darwin(v19);
  v175 = (char *)&v173 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v180 = (char *)&v173 - v22;
  uint64_t v23 = sub_100004E64(&qword_100036DB0);
  __chkstk_darwin(v23 - 8);
  v25 = (char *)&v173 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_100004E64(&qword_100036DB8);
  uint64_t v183 = *(void *)(v26 - 8);
  uint64_t v184 = v26;
  __chkstk_darwin(v26);
  v178 = (char *)&v173 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_100004E64(&qword_100036DC0);
  __chkstk_darwin(v28 - 8);
  uint64_t v30 = (char *)&v173 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100004E64(&qword_100036D50);
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = __chkstk_darwin(v31);
  v35 = (char *)&v173 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  char v37 = (char *)&v173 - v36;
  v38 = (void *)CAFTripObservable.observed.getter();
  id v39 = [v38 car];

  if (v39)
  {
    id v193 = (id)CAFCar.dimesionObservable.getter();

    unint64_t v199 = (unint64_t)_swiftEmptyArrayStorage;
    dispatch thunk of CAFTripObservable.distance.getter();
    int v40 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31);
    v177 = v8;
    uint64_t v176 = v1;
    if (v40 == 1)
    {
      sub_10000CF9C((uint64_t)v30, &qword_100036DC0);
      uint64_t v41 = v191;
      uint64_t v42 = (uint64_t)v194;
      uint64_t v43 = v185;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v37, v30, v31);
      v46 = (void *)CAFTripObservable.observed.getter();
      unsigned int v47 = [v46 distanceInvalid];

      uint64_t v43 = v185;
      if (v47)
      {
        uint64_t v197 = 2108717;
        unint64_t v198 = 0xE300000000000000;
        uint64_t v48 = (void *)dispatch thunk of CAFDimensionObservable.vehicleRangeUnit.getter();
        id v49 = [v48 symbol];

        uint64_t v50 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        char v52 = v51;

        v53._countAndFlagsBits = v50;
        v53._object = v52;
        String.append(_:)(v53);
        swift_bridgeObjectRelease();
        uint64_t v54 = v197;
        uint64_t v55 = v198;
      }
      else
      {
        Measurement<>.toVehicleRangeUnit(using:)();
        uint64_t v54 = Measurement<>.formattedString(maximumFractionDigits:)();
        uint64_t v55 = v56;
        (*(void (**)(char *, uint64_t))(v32 + 8))(v35, v31);
      }
      id v57 = [self mainBundle];
      v200._object = (void *)0xE000000000000000;
      v58._countAndFlagsBits = 0x45434E4154534944;
      v58._object = (void *)0xE800000000000000;
      v59.value._countAndFlagsBits = 1885958740;
      v59.value._object = (void *)0xE400000000000000;
      v60._countAndFlagsBits = 0;
      v60._object = (void *)0xE000000000000000;
      v200._countAndFlagsBits = 0;
      Swift::String v61 = NSLocalizedString(_:tableName:bundle:value:comment:)(v58, v59, (NSBundle)v57, v60, v200);

      type metadata accessor for CardCellConfiguration(0);
      swift_allocObject();
      sub_100014EF8(v54, v55, v61._countAndFlagsBits, (uint64_t)v61._object, 0xD000000000000038, 0x8000000100027890, 0);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((v199 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v199 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v37, v31);
      uint64_t v41 = v191;
      uint64_t v42 = (uint64_t)v194;
    }
    dispatch thunk of CAFTripObservable.duration.getter();
    uint64_t v63 = v183;
    uint64_t v62 = v184;
    int v64 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v183 + 48))(v25, 1, v184);
    uint64_t v65 = v192;
    uint64_t v66 = v196;
    if (v64 == 1)
    {
      sub_10000CF9C((uint64_t)v25, &qword_100036DB0);
      uint64_t v67 = (uint64_t)v182;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v63 + 32))(v178, v25, v62);
      uint64_t v197 = 0x202D2D3A2D2DLL;
      unint64_t v198 = 0xE600000000000000;
      id v68 = [self hours];
      id v69 = [v68 symbol];

      uint64_t v70 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v72 = v71;

      v73._countAndFlagsBits = v70;
      v73._object = v72;
      String.append(_:)(v73);
      swift_bridgeObjectRelease();
      uint64_t v75 = v197;
      uint64_t v74 = v198;
      v76 = (void *)CAFTripObservable.observed.getter();
      LOBYTE(v72) = [v76 durationInvalid];

      if ((v72 & 1) == 0)
      {
        id v77 = [objc_allocWithZone((Class)NSDateComponentsFormatter) init];
        [v77 setUnitsStyle:2];
        [v77 setAllowedUnits:224];
        Measurement.value.getter();
        id v78 = [v77 stringFromTimeInterval:];
        if (v78)
        {
          v79 = v78;
          swift_bridgeObjectRelease();
          uint64_t v75 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v74 = v80;
        }
      }
      id v81 = [self mainBundle];
      v201._object = (void *)0xE000000000000000;
      v82._countAndFlagsBits = 0x4E4F495441525544;
      v82._object = (void *)0xE800000000000000;
      v83.value._countAndFlagsBits = 1885958740;
      v83.value._object = (void *)0xE400000000000000;
      v84._countAndFlagsBits = 0;
      v84._object = (void *)0xE000000000000000;
      v201._countAndFlagsBits = 0;
      Swift::String v85 = NSLocalizedString(_:tableName:bundle:value:comment:)(v82, v83, (NSBundle)v81, v84, v201);

      if (qword_1000367D8 != -1) {
        swift_once();
      }
      uint64_t v86 = qword_100039418;
      uint64_t v87 = unk_100039420;
      type metadata accessor for CardCellConfiguration(0);
      swift_allocObject();
      swift_bridgeObjectRetain();
      sub_100014EF8(v75, v74, v85._countAndFlagsBits, (uint64_t)v85._object, v86, v87, 0);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((v199 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v199 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      (*(void (**)(char *, uint64_t))(v183 + 8))(v178, v184);
      uint64_t v67 = (uint64_t)v182;
      uint64_t v41 = v191;
      uint64_t v42 = (uint64_t)v194;
    }
    uint64_t v88 = v186;
    uint64_t v89 = (uint64_t)v179;
    dispatch thunk of CAFTripObservable.averageSpeed.getter();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v89, 1, v88) == 1)
    {
      sub_10000CF9C(v89, &qword_100036DA0);
      v90 = v195;
      uint64_t v91 = v188;
      uint64_t v92 = (uint64_t)v189;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v43 + 32))(v180, v89, v88);
      v93 = (void *)CAFTripObservable.observed.getter();
      unsigned int v94 = [v93 averageSpeedInvalid];

      if (v94)
      {
        uint64_t v197 = 2108717;
        unint64_t v198 = 0xE300000000000000;
        v95 = (void *)dispatch thunk of CAFDimensionObservable.vehicleSpeedUnit.getter();
        id v96 = [v95 symbol];

        uint64_t v97 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v99 = v98;

        v100._countAndFlagsBits = v97;
        v100._object = v99;
        String.append(_:)(v100);
        swift_bridgeObjectRelease();
        uint64_t v101 = v197;
        uint64_t v102 = v198;
      }
      else
      {
        v103 = v175;
        Measurement<>.toVehicleSpeedUnit(using:)();
        uint64_t v101 = Measurement<>.formattedString(maximumFractionDigits:)();
        uint64_t v102 = v104;
        (*(void (**)(char *, uint64_t))(v43 + 8))(v103, v88);
      }
      id v105 = [self mainBundle];
      v202._object = (void *)0xE000000000000000;
      v106._countAndFlagsBits = 0x4445455053;
      v106._object = (void *)0xE500000000000000;
      v107.value._countAndFlagsBits = 1885958740;
      v107.value._object = (void *)0xE400000000000000;
      v108._countAndFlagsBits = 0;
      v108._object = (void *)0xE000000000000000;
      v202._countAndFlagsBits = 0;
      Swift::String v109 = NSLocalizedString(_:tableName:bundle:value:comment:)(v106, v107, (NSBundle)v105, v108, v202);

      type metadata accessor for CardCellConfiguration(0);
      swift_allocObject();
      sub_100014EF8(v101, v102, v109._countAndFlagsBits, (uint64_t)v109._object, 0xD000000000000026, 0x8000000100027860, 0);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((v199 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v199 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      (*(void (**)(char *, uint64_t))(v185 + 8))(v180, v186);
      v90 = v195;
      uint64_t v66 = v196;
      uint64_t v91 = v188;
      uint64_t v92 = (uint64_t)v189;
      uint64_t v65 = v192;
      uint64_t v42 = (uint64_t)v194;
    }
    dispatch thunk of CAFTripObservable.energy.getter();
    uint64_t v110 = v187;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v187 + 48))(v42, 1, v91) == 1)
    {
      sub_10000CF9C(v42, &qword_100036D90);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v110 + 32))(v181, v42, v91);
      v111 = (void *)CAFTripObservable.observed.getter();
      unsigned int v112 = [v111 energyInvalid];

      if (v112)
      {
        uint64_t v197 = 2108717;
        unint64_t v198 = 0xE300000000000000;
        v113 = (void *)Measurement.unit.getter();
        id v114 = [v113 symbol];

        uint64_t v115 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v117 = v116;

        v118._countAndFlagsBits = v115;
        v118._object = v117;
        String.append(_:)(v118);
        swift_bridgeObjectRelease();
        uint64_t v119 = v197;
        uint64_t v120 = v198;
      }
      else
      {
        uint64_t v119 = Measurement<>.formattedString(maximumFractionDigits:)();
        uint64_t v120 = v121;
      }
      id v122 = [self mainBundle];
      v203._object = (void *)0xE000000000000000;
      v123._countAndFlagsBits = 0x594752454E45;
      v123._object = (void *)0xE600000000000000;
      v124.value._countAndFlagsBits = 1885958740;
      v124.value._object = (void *)0xE400000000000000;
      v125._countAndFlagsBits = 0;
      v125._object = (void *)0xE000000000000000;
      v203._countAndFlagsBits = 0;
      Swift::String v126 = NSLocalizedString(_:tableName:bundle:value:comment:)(v123, v124, (NSBundle)v122, v125, v203);

      type metadata accessor for CardCellConfiguration(0);
      swift_allocObject();
      sub_100014EF8(v119, v120, v126._countAndFlagsBits, (uint64_t)v126._object, 0xD000000000000017, 0x8000000100027840, 0);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((v199 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v199 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      (*(void (**)(char *, uint64_t))(v187 + 8))(v181, v188);
      uint64_t v92 = (uint64_t)v189;
      v90 = v195;
      uint64_t v66 = v196;
    }
    dispatch thunk of CAFTripObservable.energyEfficiency.getter();
    uint64_t v127 = v190;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v190 + 48))(v92, 1, v41) == 1)
    {
      sub_10000CF9C(v92, &qword_100036D80);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v127 + 32))(v90, v92, v41);
      v128 = (void *)CAFTripObservable.observed.getter();
      unsigned int v129 = [v128 energyEfficiencyInvalid];

      if (v129)
      {
        uint64_t v197 = 2108717;
        unint64_t v198 = 0xE300000000000000;
        v130 = (void *)Measurement.unit.getter();
        id v131 = [v130 symbol];

        uint64_t v132 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v134 = v133;

        v135._countAndFlagsBits = v132;
        v135._object = v134;
        String.append(_:)(v135);
        swift_bridgeObjectRelease();
        uint64_t v136 = v197;
        uint64_t v137 = v198;
      }
      else
      {
        uint64_t v136 = Measurement<>.formattedString(maximumFractionDigits:)();
        uint64_t v137 = v138;
      }
      id v139 = [self mainBundle];
      v204._object = (void *)0xE000000000000000;
      v140._object = (void *)0x8000000100027800;
      v140._countAndFlagsBits = 0xD000000000000011;
      v141.value._countAndFlagsBits = 1885958740;
      v141.value._object = (void *)0xE400000000000000;
      v142._countAndFlagsBits = 0;
      v142._object = (void *)0xE000000000000000;
      v204._countAndFlagsBits = 0;
      Swift::String v143 = NSLocalizedString(_:tableName:bundle:value:comment:)(v140, v141, (NSBundle)v139, v142, v204);

      type metadata accessor for CardCellConfiguration(0);
      swift_allocObject();
      sub_100014EF8(v136, v137, v143._countAndFlagsBits, (uint64_t)v143._object, 0xD000000000000011, 0x8000000100027820, 0);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((v199 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v199 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      (*(void (**)(char *, uint64_t))(v190 + 8))(v195, v41);
    }
    v144 = v177;
    dispatch thunk of CAFTripObservable.fuelEfficiency.getter();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v66 + 48))(v67, 1, v65) == 1)
    {

      sub_10000CF9C(v67, &qword_100036D78);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v66 + 32))(v144, v67, v65);
      v145 = (void *)CAFTripObservable.observed.getter();
      unsigned int v146 = [v145 fuelEfficiencyInvalid];

      if (v146)
      {
        uint64_t v197 = 2108717;
        unint64_t v198 = 0xE300000000000000;
        v147 = (void *)dispatch thunk of CAFDimensionObservable.vehicleFuelEfficiencyUnit.getter();
        id v148 = [v147 symbol];

        uint64_t v149 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v151 = v150;

        v152._countAndFlagsBits = v149;
        v152._object = v151;
        String.append(_:)(v152);
        swift_bridgeObjectRelease();
        uint64_t v153 = v197;
        uint64_t v154 = v198;
      }
      else
      {
        Measurement.value.getter();
        double v156 = v155;
        v157 = (void *)CAFTripObservable.observed.getter();
        id v158 = [v157 fuelEfficiencyRange];

        LODWORD(v157) = [v158 maximumValue];
        if (v156 == (double)v157)
        {
          id v159 = [self millilitersPer100Kilometers];
          sub_100006CB8(0, &qword_100036D70);
          v160 = v174;
          Measurement.init(value:unit:)();
          v161 = v173;
          Measurement<>.toVehicleFuelEfficiencyUnit(using:)();
          uint64_t v153 = Measurement<>.formattedString(maximumFractionDigits:)();
          uint64_t v154 = v162;
          v163 = *(void (**)(char *, uint64_t))(v66 + 8);
          v163(v161, v65);
          v163(v160, v65);
        }
        else
        {
          v164 = v174;
          Measurement<>.toVehicleFuelEfficiencyUnit(using:)();
          uint64_t v153 = Measurement<>.formattedString(maximumFractionDigits:)();
          uint64_t v154 = v165;
          (*(void (**)(char *, uint64_t))(v66 + 8))(v164, v65);
        }
      }
      id v166 = [self mainBundle];
      v205._object = (void *)0xE000000000000000;
      v167._countAndFlagsBits = 0x4646455F4C455546;
      v167._object = (void *)0xEF59434E45494349;
      v168.value._countAndFlagsBits = 1885958740;
      v168.value._object = (void *)0xE400000000000000;
      v169._countAndFlagsBits = 0;
      v169._object = (void *)0xE000000000000000;
      v205._countAndFlagsBits = 0;
      Swift::String v170 = NSLocalizedString(_:tableName:bundle:value:comment:)(v167, v168, (NSBundle)v166, v169, v205);

      if (qword_1000367E0 != -1) {
        swift_once();
      }
      uint64_t v171 = qword_100039428;
      uint64_t v172 = unk_100039430;
      type metadata accessor for CardCellConfiguration(0);
      swift_allocObject();
      swift_bridgeObjectRetain();
      sub_100014EF8(v153, v154, v170._countAndFlagsBits, (uint64_t)v170._object, v171, v172, 0);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((v199 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v199 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();

      (*(void (**)(char *, uint64_t))(v66 + 8))(v177, v65);
    }
    return (void *)v199;
  }
  else
  {
    os_log_type_t v44 = static os_log_type_t.error.getter();
    sub_10001B638(v44, 0xD00000000000001CLL, 0x80000001000277C0, 0xD000000000000012, 0x80000001000277E0);
    return _swiftEmptyArrayStorage;
  }
}

void *sub_1000083B8()
{
  uint64_t v0 = sub_100004E64(&qword_100036D50);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (void *)CAFOdometerObservable.observed.getter();
  id v5 = [v4 car];

  if (!v5)
  {
    os_log_type_t v16 = static os_log_type_t.error.getter();
    sub_10001B638(v16, 0xD00000000000001CLL, 0x80000001000277C0, 0xD000000000000012, 0x80000001000277E0);
    return _swiftEmptyArrayStorage;
  }
  uint64_t v6 = (void *)CAFCar.dimesionObservable.getter();

  sub_100006CB8(0, &qword_100036D58);
  id v37 = v6;
  uint64_t v7 = (void *)dispatch thunk of CAFDimensionObservable.vehicleRangeUnit.getter();
  uint64_t v8 = self;
  id v9 = [v8 kilometers];
  char v10 = static NSObject.== infix(_:_:)();

  uint64_t v11 = (void *)CAFOdometerObservable.observed.getter();
  uint64_t v12 = v11;
  if ((v10 & 1) == 0)
  {
    unsigned int v18 = [v11 distanceMilesInvalid];

    if (v18)
    {
      uint64_t v38 = 2108717;
      unint64_t v39 = 0xE300000000000000;
      id v14 = [v8 miles];
      id v15 = [v14 symbol];
      goto LABEL_8;
    }
    dispatch thunk of CAFOdometerObservable.distanceMiles.getter();
LABEL_11:
    uint64_t v24 = Measurement<>.formattedString(maximumFractionDigits:)();
    uint64_t v25 = v26;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    goto LABEL_12;
  }
  unsigned int v13 = [v11 distanceKMInvalid];

  if (!v13)
  {
    dispatch thunk of CAFOdometerObservable.distanceKM.getter();
    goto LABEL_11;
  }
  uint64_t v38 = 2108717;
  unint64_t v39 = 0xE300000000000000;
  id v14 = [v8 kilometers];
  id v15 = [v14 symbol];
LABEL_8:
  id v19 = v15;

  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v22 = v21;

  v23._countAndFlagsBits = v20;
  v23._object = v22;
  String.append(_:)(v23);
  swift_bridgeObjectRelease();
  uint64_t v24 = v38;
  uint64_t v25 = v39;
LABEL_12:
  sub_100004E64(&qword_100036D60);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_100026620;
  id v28 = [self mainBundle];
  v40._object = (void *)0xE000000000000000;
  v29._countAndFlagsBits = 0x524554454D4F444FLL;
  v29._object = (void *)0xE800000000000000;
  v30.value._countAndFlagsBits = 1885958740;
  v30.value._object = (void *)0xE400000000000000;
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  v40._countAndFlagsBits = 0;
  Swift::String v32 = NSLocalizedString(_:tableName:bundle:value:comment:)(v29, v30, (NSBundle)v28, v31, v40);

  if (qword_1000367E8 != -1) {
    swift_once();
  }
  uint64_t v33 = qword_100039438;
  uint64_t v34 = unk_100039440;
  type metadata accessor for CardCellConfiguration(0);
  swift_allocObject();
  swift_bridgeObjectRetain();
  *(void *)(v27 + 32) = sub_100014EF8(v24, v25, v32._countAndFlagsBits, (uint64_t)v32._object, v33, v34, 1);
  uint64_t v38 = v27;
  specialized Array._endMutation()();
  uint64_t v17 = v38;

  return (void *)v17;
}

void *sub_1000087EC()
{
  uint64_t v0 = sub_100004E64(&qword_100036D68);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v39 - v5;
  uint64_t v7 = (void *)CAFFuelConsumptionObservable.observed.getter();
  id v8 = [v7 car];

  if (v8)
  {
    id v9 = (void *)CAFCar.dimesionObservable.getter();

    char v10 = (void *)CAFFuelConsumptionObservable.observed.getter();
    unsigned int v11 = [v10 fuelEfficiencyInvalid];

    if (v11)
    {
      uint64_t v39 = 2108717;
      unint64_t v40 = 0xE300000000000000;
      uint64_t v12 = (void *)dispatch thunk of CAFDimensionObservable.vehicleFuelEfficiencyUnit.getter();
      id v13 = [v12 symbol];

      uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      os_log_type_t v16 = v15;

      v17._countAndFlagsBits = v14;
      v17._object = v16;
      String.append(_:)(v17);
      swift_bridgeObjectRelease();
      uint64_t v18 = v39;
      uint64_t v19 = v40;
    }
    else
    {
      dispatch thunk of CAFFuelConsumptionObservable.fuelEfficiency.getter();
      Measurement.value.getter();
      double v23 = v22;
      uint64_t v24 = *(void (**)(char *, uint64_t))(v1 + 8);
      v24(v6, v0);
      uint64_t v25 = (void *)CAFFuelConsumptionObservable.observed.getter();
      id v26 = [v25 fuelEfficiencyRange];

      LODWORD(v25) = [v26 maximumValue];
      if (v23 == (double)v25)
      {
        id v27 = [self millilitersPer100Kilometers];
        sub_100006CB8(0, &qword_100036D70);
        Measurement.init(value:unit:)();
        Measurement<>.toVehicleFuelEfficiencyUnit(using:)();
        uint64_t v18 = Measurement<>.formattedString(maximumFractionDigits:)();
        uint64_t v19 = v28;
        v24(v4, v0);
      }
      else
      {
        dispatch thunk of CAFFuelConsumptionObservable.fuelEfficiency.getter();
        Measurement<>.toVehicleFuelEfficiencyUnit(using:)();
        v24(v4, v0);
        uint64_t v18 = Measurement<>.formattedString(maximumFractionDigits:)();
        uint64_t v19 = v29;
      }
      v24(v6, v0);
    }
    sub_100004E64(&qword_100036D60);
    uint64_t v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = xmmword_100026620;
    id v31 = [self mainBundle];
    v41._object = (void *)0xE000000000000000;
    v32._countAndFlagsBits = 0x4646455F4C455546;
    v32._object = (void *)0xEF59434E45494349;
    v33.value._countAndFlagsBits = 1885958740;
    v33.value._object = (void *)0xE400000000000000;
    v34._countAndFlagsBits = 0;
    v34._object = (void *)0xE000000000000000;
    v41._countAndFlagsBits = 0;
    Swift::String v35 = NSLocalizedString(_:tableName:bundle:value:comment:)(v32, v33, (NSBundle)v31, v34, v41);

    if (qword_1000367E0 != -1) {
      swift_once();
    }
    uint64_t v36 = qword_100039428;
    uint64_t v37 = unk_100039430;
    type metadata accessor for CardCellConfiguration(0);
    swift_allocObject();
    swift_bridgeObjectRetain();
    *(void *)(v30 + 32) = sub_100014EF8(v18, v19, v35._countAndFlagsBits, (uint64_t)v35._object, v36, v37, 0);
    uint64_t v39 = v30;
    specialized Array._endMutation()();
    uint64_t v21 = v39;
  }
  else
  {
    os_log_type_t v20 = static os_log_type_t.error.getter();
    sub_10001B638(v20, 0xD00000000000001CLL, 0x80000001000277C0, 0xD000000000000012, 0x80000001000277E0);
    return _swiftEmptyArrayStorage;
  }
  return (void *)v21;
}

uint64_t sub_100008C98()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100008D0C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (v3)
  {
    dispatch thunk of CarouselModel.items.getter();
    swift_release();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return static Published.subscript.setter();
}

uint64_t sub_100008DE4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

id sub_100008E58(void *a1)
{
  uint64_t v3 = sub_100004E64(&qword_100036E40);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____TtC4Trip9TripModel_tripComputer] = 0;
  *(void *)&v1[OBJC_IVAR____TtC4Trip9TripModel_odometer] = 0;
  *(void *)&v1[OBJC_IVAR____TtC4Trip9TripModel_consumption] = 0;
  v1[OBJC_IVAR____TtC4Trip9TripModel_hasEmittedFinalizedSignpost] = 0;
  uint64_t v7 = &v1[OBJC_IVAR____TtC4Trip9TripModel__carouselModel];
  aBlock[0] = 0;
  id v8 = v1;
  sub_100004E64(&qword_100036D48);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v6, v3);
  os_log_type_t v9 = static os_log_type_t.info.getter();
  sub_10001B638(v9, 0xD000000000000018, 0x8000000100027D20, 0xD000000000000014, 0x8000000100027D40);
  char v10 = (uint64_t *)&v8[OBJC_IVAR____TtC4Trip9TripModel__carObservable];
  swift_beginAccess();
  type metadata accessor for CAFCarObservable();
  sub_10000CEF8(&qword_100036E48, (void (*)(uint64_t))&type metadata accessor for CAFCarObservable);
  id v11 = a1;
  *char v10 = ObservedObject.init(wrappedValue:)();
  v10[1] = v12;
  swift_endAccess();
  swift_beginAccess();
  id v26 = _swiftEmptyArrayStorage;
  sub_100004E64(&qword_100036D38);
  Published.init(initialValue:)();
  swift_endAccess();

  id v13 = (objc_class *)type metadata accessor for TripModel();
  v25.receiver = v8;
  v25.super_class = v13;
  id v14 = [super init];
  id v15 = (void *)CAFCarObservable.observed.getter();
  [v15 registerObserver:v14];

  sub_100009908();
  id v16 = [self defaultCenter];
  if (qword_100036808 != -1) {
    swift_once();
  }
  uint64_t v17 = static NSNotificationName.ClusterEvent;
  id v18 = [self mainQueue];
  uint64_t v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_10000CF40;
  aBlock[5] = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000093B4;
  aBlock[3] = &unk_100031608;
  os_log_type_t v20 = _Block_copy(aBlock);
  swift_release();
  id v21 = [v16 addObserverForName:v17 object:0 queue:v18 usingBlock:v20];

  _Block_release(v20);
  swift_unknownObjectRelease();

  return v14;
}

void sub_10000925C()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t v2 = Notification.userInfo.getter();
    if (v2)
    {
      uint64_t v3 = v2;
      strcpy((char *)&v6, "ClusterEvent");
      BYTE13(v6) = 0;
      HIWORD(v6) = -5120;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v3 + 16) && (unint64_t v4 = sub_100024164((uint64_t)v8), (v5 & 1) != 0))
      {
        sub_10000D008(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v6);
      }
      else
      {
        long long v6 = 0u;
        long long v7 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_10000CF48((uint64_t)v8);
      if (*((void *)&v7 + 1))
      {
        sub_10000CFF8(&v6, v9);
        sub_10000D008((uint64_t)v9, (uint64_t)v8);
        if (swift_dynamicCast()) {
          sub_10000A7CC(v6);
        }

        sub_10000D064((uint64_t)v9);
      }
      else
      {

        sub_10000CF9C((uint64_t)&v6, (uint64_t *)&unk_100036E50);
      }
    }
    else
    {
    }
  }
}

uint64_t sub_1000093B4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Notification();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  char v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = *(void (**)(char *))(a1 + 32);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

id sub_1000094A8()
{
  id v1 = [self defaultCenter];
  if (qword_100036808 != -1) {
    swift_once();
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 removeObserver:v2];

  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for TripModel();
  [super dealloc];
}

uint64_t sub_100009774()
{
  return type metadata accessor for TripModel();
}

uint64_t type metadata accessor for TripModel()
{
  uint64_t result = qword_100036D20;
  if (!qword_100036D20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100009908()
{
  uint64_t v1 = v0;
  _StringGuts.grow(_:)(99);
  v2._countAndFlagsBits = 0x646F4D706972545BLL;
  v2._object = (void *)0xEC000000205D6C65;
  String.append(_:)(v2);
  uint64_t v3 = OBJC_IVAR____TtC4Trip9TripModel_tripComputer;
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC4Trip9TripModel_tripComputer);
  if (v4) {
    uint64_t v5 = 0x612065766168;
  }
  else {
    uint64_t v5 = 28526;
  }
  if (v4) {
    unint64_t v6 = 0xE600000000000000;
  }
  else {
    unint64_t v6 = 0xE200000000000000;
  }
  unint64_t v7 = v6;
  String.append(_:)(*(Swift::String *)&v5);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0x6D6F437069727420;
  v8._object = (void *)0xEF202C7265747570;
  String.append(_:)(v8);
  uint64_t v9 = OBJC_IVAR____TtC4Trip9TripModel_consumption;
  uint64_t v10 = *(void *)(v0 + OBJC_IVAR____TtC4Trip9TripModel_consumption);
  if (v10) {
    uint64_t v11 = 0x612065766168;
  }
  else {
    uint64_t v11 = 28526;
  }
  if (v10) {
    unint64_t v12 = 0xE600000000000000;
  }
  else {
    unint64_t v12 = 0xE200000000000000;
  }
  unint64_t v13 = v12;
  String.append(_:)(*(Swift::String *)&v11);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 0x706D75736E6F6320;
  v14._object = (void *)0xEF20202E6E6F6974;
  String.append(_:)(v14);
  uint64_t v15 = v0 + OBJC_IVAR____TtC4Trip9TripModel__carObservable;
  swift_beginAccess();
  id v16 = *(id *)(v15 + 8);
  uint64_t v17 = (void *)dispatch thunk of CAFCarObservable.tripComputer.getter();

  if (v17) {
    uint64_t v18 = 0x612065766168;
  }
  else {
    uint64_t v18 = 28526;
  }
  if (v17) {
    unint64_t v19 = 0xE600000000000000;
  }
  else {
    unint64_t v19 = 0xE200000000000000;
  }
  unint64_t v20 = v19;
  String.append(_:)(*(Swift::String *)&v18);
  swift_bridgeObjectRelease();
  v21._countAndFlagsBits = 0xD00000000000001DLL;
  v21._object = (void *)0x8000000100027B90;
  String.append(_:)(v21);
  id v22 = *(id *)(v15 + 8);
  double v23 = (void *)dispatch thunk of CAFCarObservable.fuel.getter();

  if (v23) {
    uint64_t v24 = 0x612065766168;
  }
  else {
    uint64_t v24 = 28526;
  }
  if (v23) {
    unint64_t v25 = 0xE600000000000000;
  }
  else {
    unint64_t v25 = 0xE200000000000000;
  }
  unint64_t v26 = v25;
  String.append(_:)(*(Swift::String *)&v24);
  swift_bridgeObjectRelease();
  v27._countAndFlagsBits = 0xD000000000000014;
  v27._object = (void *)0x8000000100027BB0;
  String.append(_:)(v27);
  os_log_type_t v28 = static os_log_type_t.info.getter();
  sub_10001B638(v28, 0, 0xE000000000000000, 0xD000000000000011, 0x8000000100027BD0);
  swift_bridgeObjectRelease();
  if (!*(void *)(v1 + v3))
  {
    id v29 = *(id *)(v15 + 8);
    uint64_t v30 = (void *)dispatch thunk of CAFCarObservable.tripComputer.getter();

    if (v30)
    {
      os_log_type_t v31 = static os_log_type_t.info.getter();
      sub_10001B638(v31, 0xD000000000000033, 0x8000000100027C20, 0xD000000000000011, 0x8000000100027BD0);
      Swift::String v32 = *(void **)(v1 + v3);
      *(void *)(v1 + v3) = v30;
      id v33 = v30;

      id v34 = [v33 odometer];
      Swift::String v35 = *(void **)(v1 + OBJC_IVAR____TtC4Trip9TripModel_odometer);
      *(void *)(v1 + OBJC_IVAR____TtC4Trip9TripModel_odometer) = v34;
    }
  }
  if (!*(void *)(v1 + v9))
  {
    id v36 = *(id *)(v15 + 8);
    uint64_t v37 = (void *)dispatch thunk of CAFCarObservable.fuel.getter();

    if (v37)
    {
      os_log_type_t v38 = static os_log_type_t.info.getter();
      sub_10001B638(v38, 0xD00000000000002DLL, 0x8000000100027BF0, 0xD000000000000011, 0x8000000100027BD0);
      id v39 = [v37 fuelConsumption];
      unint64_t v40 = *(void **)(v1 + v9);
      *(void *)(v1 + v9) = v39;
    }
  }
  return sub_100009C84();
}

uint64_t sub_100009C84()
{
  uint64_t v1 = v0;
  _StringGuts.grow(_:)(36);
  swift_bridgeObjectRelease();
  uint64_t v47 = 0xD000000000000013;
  unint64_t v48 = 0x8000000100027A20;
  uint64_t v2 = OBJC_IVAR____TtC4Trip9TripModel_tripComputer;
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC4Trip9TripModel_tripComputer];
  if (v3)
  {
    id v4 = [v3 trips];
    if (v4)
    {
      uint64_t v5 = v4;
      sub_100006CB8(0, &qword_100036E20);
      unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (v6 >> 62)
      {
        swift_bridgeObjectRetain();
        _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
    }
  }
  v7._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0x706D75736E6F6320;
  v8._object = (void *)0xED00003D6E6F6974;
  String.append(_:)(v8);
  uint64_t v9 = OBJC_IVAR____TtC4Trip9TripModel_consumption;
  if (*(void *)&v1[OBJC_IVAR____TtC4Trip9TripModel_consumption]) {
    uint64_t v10 = 5457241;
  }
  else {
    uint64_t v10 = 20302;
  }
  if (*(void *)&v1[OBJC_IVAR____TtC4Trip9TripModel_consumption]) {
    unint64_t v11 = 0xE300000000000000;
  }
  else {
    unint64_t v11 = 0xE200000000000000;
  }
  unint64_t v12 = v11;
  String.append(_:)(*(Swift::String *)&v10);
  swift_bridgeObjectRelease();
  os_log_type_t v13 = static os_log_type_t.info.getter();
  sub_10001B638(v13, v47, v48, 0xD000000000000011, 0x8000000100027A40);
  swift_bridgeObjectRelease();
  unint64_t v46 = (unint64_t)_swiftEmptyArrayStorage;
  Swift::String v14 = *(void **)&v1[v2];
  if (v14)
  {
    id v15 = v14;
    id v16 = [v15 trips];
    if (v16)
    {
      uint64_t v17 = v16;
      sub_100006CB8(0, &qword_100036E20);
      unint64_t v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (v18 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v44 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v44)
        {
          unint64_t v45 = swift_bridgeObjectRetain();
          uint64_t v19 = (uint64_t)sub_10000BC74(v45);
          swift_bridgeObjectRelease();
LABEL_17:
          uint64_t v47 = v19;
          sub_10000BD6C(&v47);
          swift_bridgeObjectRelease();
          unint64_t v20 = v47;
          id v21 = v15;
          id v22 = sub_10000CCA0(v20, v21);
          swift_release();

          swift_bridgeObjectRelease();
          unint64_t v46 = (unint64_t)v22;
          double v23 = *(void **)&v1[v9];
          if (!v23) {
            goto LABEL_27;
          }
          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v19 = v18 & 0xFFFFFFFFFFFFFF8;
        if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          swift_bridgeObjectRetain();
          goto LABEL_17;
        }
      }

      swift_bridgeObjectRelease();
      double v23 = *(void **)&v1[v9];
      if (!v23) {
        goto LABEL_27;
      }
      goto LABEL_21;
    }
  }
  double v23 = *(void **)&v1[v9];
  if (!v23) {
    goto LABEL_27;
  }
LABEL_21:
  id v24 = v23;
  os_log_type_t v25 = static os_log_type_t.debug.getter();
  sub_10001B638(v25, 0xD000000000000029, 0x8000000100027A90, 0xD000000000000011, 0x8000000100027A40);
  sub_100006CB8(0, &qword_100036E00);
  sub_100006C74(&qword_100036E08, &qword_100036E00);
  unint64_t v26 = (void *)CAFObserved<>.observable.getter();
  Swift::String v27 = *(void **)&v1[OBJC_IVAR____TtC4Trip9TripModel_odometer];
  if (v27)
  {
    sub_100006CB8(0, &qword_100036E10);
    sub_100006C74(&qword_100036E18, &qword_100036E10);
    id v28 = v27;
    id v29 = (void *)CAFObserved<>.observable.getter();
  }
  else
  {
    id v29 = 0;
  }
  type metadata accessor for InfoCard(0);
  swift_allocObject();
  sub_1000160A8(v26, v29, 1, 0);
  swift_retain();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();

  swift_release();
LABEL_27:
  uint64_t v47 = 0;
  unint64_t v48 = 0xE000000000000000;
  _StringGuts.grow(_:)(24);
  swift_bridgeObjectRelease();
  uint64_t v47 = 0x75205D706972545BLL;
  unint64_t v48 = 0xEF20646574616470;
  if (v46 >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  v30._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v30);
  swift_bridgeObjectRelease();
  v31._countAndFlagsBits = 0x2E736472616320;
  v31._object = (void *)0xE700000000000000;
  String.append(_:)(v31);
  uint64_t v32 = v47;
  unint64_t v33 = v48;
  os_log_type_t v34 = static os_log_type_t.info.getter();
  sub_10001B638(v34, v32, v33, 0xD000000000000011, 0x8000000100027A40);
  swift_bridgeObjectRelease();
  if (v46 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v38 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v38)
    {
LABEL_31:
      uint64_t v47 = 0;
      sub_100004E64(&qword_100036DF8);
      swift_allocObject();
      uint64_t v35 = CarouselModel.init(items:activeItem:alwaysHidesPlatter:platterVisibilityDuration:)();
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v47 = v35;
      id v36 = v1;
      swift_retain();
      static Published.subscript.setter();
      sub_100008D0C();
      swift_release();
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      uint64_t result = swift_release();
      if (v47)
      {
        swift_allocObject();
        swift_unknownObjectWeakInit();
        dispatch thunk of CarouselModel.itemWillAppear.setter();
        return swift_release();
      }
      return result;
    }
  }
  else if (*(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_31;
  }
  uint64_t v47 = 0;
  unint64_t v48 = 0xE000000000000000;
  _StringGuts.grow(_:)(41);
  swift_bridgeObjectRelease();
  uint64_t v47 = 0xD000000000000020;
  unint64_t v48 = 0x8000000100027A60;
  if (v46 >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v39._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v39);
  swift_bridgeObjectRelease();
  v40._countAndFlagsBits = 0x2E736472616320;
  v40._object = (void *)0xE700000000000000;
  String.append(_:)(v40);
  uint64_t v41 = v47;
  unint64_t v42 = v48;
  os_log_type_t v43 = static os_log_type_t.error.getter();
  sub_10001B638(v43, v41, v42, 0xD000000000000011, 0x8000000100027A40);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000A4CC()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();

    swift_release();
    swift_release();
    if (v4)
    {
      dispatch thunk of CarouselModel.activeIndex.getter();
      swift_release();
    }
  }
  _StringGuts.grow(_:)(21);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  sub_10001B638(v2, 0xD000000000000013, 0x8000000100027B70, 0xD000000000000011, 0x8000000100027A40);
  swift_bridgeObjectRelease();
  if (qword_1000367F0 != -1) {
    swift_once();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return static Published.subscript.setter();
}

void sub_10000A6A4()
{
  uint64_t v1 = OBJC_IVAR____TtC4Trip9TripModel_hasEmittedFinalizedSignpost;
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC4Trip9TripModel_hasEmittedFinalizedSignpost) & 1) == 0)
  {
    uint64_t v2 = v0;
    uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC4Trip9TripModel_tripComputer);
    if (v3)
    {
      id v4 = v3;
      if ([v4 receivedAllValues])
      {
        uint64_t v5 = v0 + OBJC_IVAR____TtC4Trip9TripModel__carObservable;
        swift_beginAccess();
        id v6 = *(id *)(v5 + 8);
        Swift::String v7 = (void *)CAFCarObservable.observed.getter();

        CAFSignpostEmit_Finalized();
        *(unsigned char *)(v2 + v1) = 1;
        return;
      }
    }
    os_log_type_t v8 = static os_log_type_t.info.getter();
    sub_10001B638(v8, 0xD000000000000024, 0x80000001000279D0, 0xD000000000000017, 0x8000000100027A00);
  }
}

uint64_t sub_10000A7CC(char a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006CB8(0, &qword_100036DD8);
  uint64_t v10 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = v11;
  aBlock[4] = sub_10000CC30;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000ABE8;
  aBlock[3] = &unk_1000315E0;
  os_log_type_t v13 = _Block_copy(aBlock);
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_10000CEF8(&qword_100036DE0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004E64(&qword_100036DE8);
  sub_10000CC3C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_10000AAAC(char a1)
{
  switch(a1)
  {
    case 1:
      swift_beginAccess();
      uint64_t Strong = swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        uint64_t v2 = (void *)Strong;
        sub_10000B0D4();
        goto LABEL_12;
      }
      break;
    case 2:
      swift_beginAccess();
      uint64_t v4 = swift_unknownObjectWeakLoadStrong();
      if (v4)
      {
        uint64_t v2 = (void *)v4;
        sub_10000ACF4();
        goto LABEL_12;
      }
      break;
    case 3:
      swift_beginAccess();
      uint64_t v5 = swift_unknownObjectWeakLoadStrong();
      if (v5)
      {
        uint64_t v2 = (void *)v5;
        sub_10000AE80();
        goto LABEL_12;
      }
      break;
    case 4:
      swift_beginAccess();
      uint64_t v6 = swift_unknownObjectWeakLoadStrong();
      if (v6)
      {
        uint64_t v2 = (void *)v6;
        sub_10000B010();
        goto LABEL_12;
      }
      break;
    default:
      swift_beginAccess();
      uint64_t v1 = swift_unknownObjectWeakLoadStrong();
      if (v1)
      {
        uint64_t v2 = (void *)v1;
        sub_10000AC2C();
LABEL_12:
      }
      break;
  }
}

uint64_t sub_10000ABE8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10000AC2C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  if (v2)
  {
    os_log_type_t v1 = static os_log_type_t.info.getter();
    sub_10001B638(v1, 0xD000000000000013, 0x80000001000279B0, 0x72507463656C6573, 0xEF29286465737365);
    dispatch thunk of CarouselModel.showDecorations()();
    return swift_release();
  }
  return result;
}

uint64_t sub_10000ACF4()
{
  uint64_t v0 = sub_100004E64(&qword_100036DD0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  if (v6[1])
  {
    os_log_type_t v5 = static os_log_type_t.info.getter();
    sub_10001B638(v5, 0xD000000000000014, 0x8000000100027990, 0x7055657461746F72, 0xEA00000000002928);
    (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for CarouselModel.Direction.up<A>(_:), v0);
    dispatch thunk of CarouselModel.rotate(_:animated:)();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return result;
}

uint64_t sub_10000AE80()
{
  uint64_t v0 = sub_100004E64(&qword_100036DD0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  if (v6[1])
  {
    os_log_type_t v5 = static os_log_type_t.info.getter();
    sub_10001B638(v5, 0xD000000000000016, 0x8000000100027970, 0x6F44657461746F72, 0xEC00000029286E77);
    (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for CarouselModel.Direction.down<A>(_:), v0);
    dispatch thunk of CarouselModel.rotate(_:animated:)();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return result;
}

uint64_t sub_10000B010()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  if (v2)
  {
    os_log_type_t v1 = static os_log_type_t.info.getter();
    sub_10001B638(v1, 0xD000000000000012, 0x8000000100027950, 0x7463656C65736564, 0xEA00000000002928);
    dispatch thunk of CarouselModel.hideDecorations(after:)();
    return swift_release();
  }
  return result;
}

void sub_10000B0D4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if ((void)aBlock)
  {
    dispatch thunk of CarouselModel.activeItem.getter();
    type metadata accessor for TripCard(0);
    uint64_t v0 = swift_dynamicCastClass();
    if (v0)
    {
      uint64_t v1 = qword_1000367F0;
      id v2 = *(id *)(v0 + OBJC_IVAR____TtC4Trip8TripCard_trip);
      if (v1 != -1) {
        swift_once();
      }
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      uint64_t v3 = aBlock;
      uint64_t v4 = (void *)CAFTripObservable.observed.getter();
      unsigned int v5 = [v4 hasReset];

      if (v5)
      {
        _StringGuts.grow(_:)(28);
        swift_bridgeObjectRelease();
        strcpy((char *)&aBlock, "reseting trip ");
        HIBYTE(aBlock) = -18;
        id v6 = [v2 description];
        uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v9 = v8;

        v10._countAndFlagsBits = v7;
        v10._object = v9;
        String.append(_:)(v10);
        swift_bridgeObjectRelease();
        v11._countAndFlagsBits = 0x65646E6920746120;
        v11._object = (void *)0xEA00000000002078;
        String.append(_:)(v11);
        uint64_t v32 = v3;
        v12._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
        String.append(_:)(v12);
        swift_bridgeObjectRelease();
        os_log_type_t v13 = static os_log_type_t.info.getter();
        sub_10001B638(v13, aBlock, *((unint64_t *)&aBlock + 1), 0xD000000000000013, 0x80000001000278F0);
        swift_bridgeObjectRelease();
        Swift::String v14 = (void *)CAFTripObservable.observed.getter();
        uint64_t v15 = swift_allocObject();
        *(void *)(v15 + 16) = v2;
        *(void *)(v15 + 24) = v3;
        Swift::String v30 = sub_10000CB98;
        uint64_t v31 = v15;
        *(void *)&long long aBlock = _NSConcreteStackBlock;
        *((void *)&aBlock + 1) = 1107296256;
        id v28 = sub_10000B840;
        id v29 = &unk_100031568;
        id v16 = _Block_copy(&aBlock);
        id v17 = v2;
        swift_release();
        [v14 resetWithCompletion:v16];
        swift_release();

        swift_release();
        _Block_release(v16);

        return;
      }
      _StringGuts.grow(_:)(45);
      swift_bridgeObjectRelease();
      strcpy((char *)&aBlock, "reseting trip ");
      HIBYTE(aBlock) = -18;
      id v18 = [v2 description];
      uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v21 = v20;

      v22._countAndFlagsBits = v19;
      v22._object = v21;
      String.append(_:)(v22);
      swift_bridgeObjectRelease();
      v23._countAndFlagsBits = 0x65646E6920746120;
      v23._object = (void *)0xEA00000000002078;
      String.append(_:)(v23);
      uint64_t v32 = v3;
      v24._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v24);
      swift_bridgeObjectRelease();
      v25._countAndFlagsBits = 0xD000000000000011;
      v25._object = (void *)0x80000001000278D0;
      String.append(_:)(v25);
      os_log_type_t v26 = static os_log_type_t.error.getter();
      sub_10001B638(v26, aBlock, *((unint64_t *)&aBlock + 1), 0xD000000000000013, 0x80000001000278F0);
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
      swift_release();
    }
    swift_release();
  }
}

uint64_t sub_10000B554(uint64_t a1, void *a2)
{
  if (a1)
  {
    swift_errorRetain();
    _StringGuts.grow(_:)(50);
    v3._countAndFlagsBits = 0x676E697465736572;
    v3._object = (void *)0xEE00207069727420;
    String.append(_:)(v3);
    id v4 = [a2 description];
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;

    v8._countAndFlagsBits = v5;
    v8._object = v7;
    String.append(_:)(v8);
    swift_bridgeObjectRelease();
    v9._countAndFlagsBits = 0x65646E6920746120;
    v9._object = (void *)0xEA00000000002078;
    String.append(_:)(v9);
    v10._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    v11._countAndFlagsBits = 0xD000000000000014;
    v11._object = (void *)0x8000000100027930;
    String.append(_:)(v11);
    sub_100004E64(&qword_100036DC8);
    _print_unlocked<A, B>(_:_:)();
    os_log_type_t v12 = static os_log_type_t.error.getter();
    sub_10001B638(v12, 0, 0xE000000000000000, 0xD000000000000013, 0x80000001000278F0);
    swift_bridgeObjectRelease();
    return swift_errorRelease();
  }
  else
  {
    _StringGuts.grow(_:)(38);
    swift_bridgeObjectRelease();
    strcpy((char *)v23, "reseting trip ");
    HIBYTE(v23[1]) = -18;
    id v14 = [a2 description];
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v17 = v16;

    v18._countAndFlagsBits = v15;
    v18._object = v17;
    String.append(_:)(v18);
    swift_bridgeObjectRelease();
    v19._countAndFlagsBits = 0x65646E6920746120;
    v19._object = (void *)0xEA00000000002078;
    String.append(_:)(v19);
    v20._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v20);
    swift_bridgeObjectRelease();
    v21._countAndFlagsBits = 0x6465656363757320;
    v21._object = (void *)0xEA00000000006465;
    String.append(_:)(v21);
    os_log_type_t v22 = static os_log_type_t.info.getter();
    sub_10001B638(v22, v23[0], v23[1], 0xD000000000000013, 0x80000001000278F0);
    return swift_bridgeObjectRelease();
  }
}

void sub_10000B840(uint64_t a1, void *a2)
{
  Swift::String v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_10000B8DC()
{
  sub_10000B9E8(319, &qword_100036D30, &qword_100036D38);
  if (v0 <= 0x3F)
  {
    sub_10000B9E8(319, &qword_100036D40, &qword_100036D48);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_10000B9E8(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    sub_100005E2C(a3);
    unint64_t v4 = type metadata accessor for Published();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_10000BA38@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for TripModel();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000BA78@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10000BAF8(uint64_t a1, void **a2)
{
  id v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return static Published.subscript.setter();
}

uint64_t sub_10000BB70@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10000BBF0(uint64_t a1, void **a2)
{
  id v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  v2;
  static Published.subscript.setter();
  return sub_100008D0C();
}

void *sub_10000BC74(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = &_swiftEmptyArrayStorage;
    }
    else
    {
      sub_100004E64(&qword_100036D60);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_100017DD0((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v2) {
      return &_swiftEmptyArrayStorage;
    }
  }
  return v3;
}

uint64_t sub_10000BD6C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_10000CB3C(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_10000BDE8(v6);
  return specialized ContiguousArray._endMutation()();
}

void sub_10000BDE8(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int v4 = _minimumMergeRunLength(_:)(v3);
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_132;
    }
    if (v3) {
      sub_10000C55C(0, v3, 1, a1);
    }
    return;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_140;
  }
  Swift::Int v103 = v4;
  v98 = a1;
  if (v3 < 2)
  {
    Swift::String v8 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v110 = (uint64_t)&_swiftEmptyArrayStorage;
    Swift::String v109 = (void **)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      unint64_t v11 = *((void *)&_swiftEmptyArrayStorage + 2);
LABEL_98:
      if (v11 >= 2)
      {
        uint64_t v92 = *v98;
        do
        {
          unint64_t v93 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_127;
          }
          if (!v92) {
            goto LABEL_139;
          }
          uint64_t v94 = *(void *)&v8[16 * v93 + 32];
          uint64_t v95 = *(void *)&v8[16 * v11 + 24];
          sub_10000C650((id *)(v92 + 8 * v94), (id *)(v92 + 8 * *(void *)&v8[16 * v11 + 16]), v92 + 8 * v95, v109);
          if (v1) {
            break;
          }
          if (v95 < v94) {
            goto LABEL_128;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            Swift::String v8 = sub_10000CB28((uint64_t)v8);
          }
          if (v93 >= *((void *)v8 + 2)) {
            goto LABEL_129;
          }
          id v96 = &v8[16 * v93 + 32];
          *(void *)id v96 = v94;
          *((void *)v96 + 1) = v95;
          unint64_t v97 = *((void *)v8 + 2);
          if (v11 > v97) {
            goto LABEL_130;
          }
          memmove(&v8[16 * v11 + 16], &v8[16 * v11 + 32], 16 * (v97 - v11));
          *((void *)v8 + 2) = v97 - 1;
          unint64_t v11 = v97 - 1;
        }
        while (v97 > 2);
      }
LABEL_109:
      swift_bridgeObjectRelease();
      *(void *)((v110 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      specialized Array._endMutation()();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    sub_100006CB8(0, &qword_100036E20);
    uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
    Swift::String v109 = (void **)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v110 = v7;
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v99 = *a1 - 8;
  uint64_t v100 = *a1 + 16;
  Swift::String v8 = (char *)&_swiftEmptyArrayStorage;
  Swift::Int v106 = v3;
  while (1)
  {
    Swift::Int v12 = v9++;
    Swift::Int v107 = v12;
    if (v9 < v3)
    {
      os_log_type_t v13 = *(void **)(v10 + 8 * v12);
      id v14 = *(id *)(v10 + 8 * v9);
      id v15 = v13;
      unsigned int v104 = [v14 sortOrder];
      unsigned int v16 = [v15 sortOrder];

      Swift::Int v3 = v106;
      Swift::Int v9 = v12 + 2;
      if (v12 + 2 < v106)
      {
        uint64_t v101 = v8;
        id v17 = (id *)(v100 + 8 * v12);
        while (1)
        {
          Swift::String v18 = *(v17 - 1);
          id v19 = *v17;
          id v20 = v18;
          unsigned int v21 = [v19 sortOrder];
          LODWORD(v18) = [v20 sortOrder];

          if (v104 < v16 == v21 >= v18) {
            break;
          }
          ++v9;
          ++v17;
          Swift::Int v3 = v106;
          if (v106 == v9)
          {
            Swift::Int v9 = v106;
            Swift::String v8 = v101;
            goto LABEL_22;
          }
        }
        Swift::String v8 = v101;
        Swift::Int v3 = v106;
LABEL_22:
        Swift::Int v12 = v107;
      }
      if (v104 < v16)
      {
        if (v9 < v12) {
          goto LABEL_133;
        }
        if (v12 < v9)
        {
          os_log_type_t v22 = (uint64_t *)(v99 + 8 * v9);
          Swift::Int v23 = v9;
          Swift::Int v24 = v12;
          Swift::String v25 = (uint64_t *)(v10 + 8 * v12);
          do
          {
            if (v24 != --v23)
            {
              if (!v10) {
                goto LABEL_138;
              }
              uint64_t v26 = *v25;
              uint64_t *v25 = *v22;
              *os_log_type_t v22 = v26;
            }
            ++v24;
            --v22;
            ++v25;
          }
          while (v24 < v23);
        }
      }
    }
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v12)) {
        goto LABEL_131;
      }
      if (v9 - v12 < v103) {
        break;
      }
    }
LABEL_48:
    if (v9 < v12) {
      goto LABEL_126;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      Swift::String v8 = sub_10000C970(0, *((void *)v8 + 2) + 1, 1, v8);
    }
    unint64_t v39 = *((void *)v8 + 2);
    unint64_t v38 = *((void *)v8 + 3);
    unint64_t v11 = v39 + 1;
    if (v39 >= v38 >> 1) {
      Swift::String v8 = sub_10000C970((char *)(v38 > 1), v39 + 1, 1, v8);
    }
    *((void *)v8 + 2) = v11;
    Swift::String v40 = v8 + 32;
    uint64_t v41 = &v8[16 * v39 + 32];
    *(void *)uint64_t v41 = v12;
    *((void *)v41 + 1) = v9;
    if (v39)
    {
      Swift::Int v108 = v9;
      while (1)
      {
        unint64_t v42 = v11 - 1;
        if (v11 >= 4)
        {
          uint64_t v47 = &v40[16 * v11];
          uint64_t v48 = *((void *)v47 - 8);
          uint64_t v49 = *((void *)v47 - 7);
          BOOL v53 = __OFSUB__(v49, v48);
          uint64_t v50 = v49 - v48;
          if (v53) {
            goto LABEL_115;
          }
          uint64_t v52 = *((void *)v47 - 6);
          uint64_t v51 = *((void *)v47 - 5);
          BOOL v53 = __OFSUB__(v51, v52);
          uint64_t v45 = v51 - v52;
          char v46 = v53;
          if (v53) {
            goto LABEL_116;
          }
          unint64_t v54 = v11 - 2;
          uint64_t v55 = &v40[16 * v11 - 32];
          uint64_t v57 = *(void *)v55;
          uint64_t v56 = *((void *)v55 + 1);
          BOOL v53 = __OFSUB__(v56, v57);
          uint64_t v58 = v56 - v57;
          if (v53) {
            goto LABEL_118;
          }
          BOOL v53 = __OFADD__(v45, v58);
          uint64_t v59 = v45 + v58;
          if (v53) {
            goto LABEL_121;
          }
          if (v59 >= v50)
          {
            id v77 = &v40[16 * v42];
            uint64_t v79 = *(void *)v77;
            uint64_t v78 = *((void *)v77 + 1);
            BOOL v53 = __OFSUB__(v78, v79);
            uint64_t v80 = v78 - v79;
            if (v53) {
              goto LABEL_125;
            }
            BOOL v70 = v45 < v80;
            goto LABEL_86;
          }
        }
        else
        {
          if (v11 != 3)
          {
            uint64_t v71 = *((void *)v8 + 4);
            uint64_t v72 = *((void *)v8 + 5);
            BOOL v53 = __OFSUB__(v72, v71);
            uint64_t v64 = v72 - v71;
            char v65 = v53;
            goto LABEL_80;
          }
          uint64_t v44 = *((void *)v8 + 4);
          uint64_t v43 = *((void *)v8 + 5);
          BOOL v53 = __OFSUB__(v43, v44);
          uint64_t v45 = v43 - v44;
          char v46 = v53;
        }
        if (v46) {
          goto LABEL_117;
        }
        unint64_t v54 = v11 - 2;
        Swift::String v60 = &v40[16 * v11 - 32];
        uint64_t v62 = *(void *)v60;
        uint64_t v61 = *((void *)v60 + 1);
        BOOL v63 = __OFSUB__(v61, v62);
        uint64_t v64 = v61 - v62;
        char v65 = v63;
        if (v63) {
          goto LABEL_120;
        }
        uint64_t v66 = &v40[16 * v42];
        uint64_t v68 = *(void *)v66;
        uint64_t v67 = *((void *)v66 + 1);
        BOOL v53 = __OFSUB__(v67, v68);
        uint64_t v69 = v67 - v68;
        if (v53) {
          goto LABEL_123;
        }
        if (__OFADD__(v64, v69)) {
          goto LABEL_124;
        }
        if (v64 + v69 >= v45)
        {
          BOOL v70 = v45 < v69;
LABEL_86:
          if (v70) {
            unint64_t v42 = v54;
          }
          goto LABEL_88;
        }
LABEL_80:
        if (v65) {
          goto LABEL_119;
        }
        Swift::String v73 = &v40[16 * v42];
        uint64_t v75 = *(void *)v73;
        uint64_t v74 = *((void *)v73 + 1);
        BOOL v53 = __OFSUB__(v74, v75);
        uint64_t v76 = v74 - v75;
        if (v53) {
          goto LABEL_122;
        }
        if (v76 < v64) {
          goto LABEL_14;
        }
LABEL_88:
        unint64_t v81 = v42 - 1;
        if (v42 - 1 >= v11)
        {
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
          goto LABEL_135;
        }
        uint64_t v82 = v10;
        if (!v10) {
          goto LABEL_137;
        }
        Swift::String_optional v83 = v8;
        Swift::String v84 = &v40[16 * v81];
        uint64_t v85 = *(void *)v84;
        uint64_t v86 = v40;
        unint64_t v87 = v42;
        uint64_t v88 = &v40[16 * v42];
        uint64_t v89 = *((void *)v88 + 1);
        uint64_t v90 = v82;
        sub_10000C650((id *)(v82 + 8 * *(void *)v84), (id *)(v82 + 8 * *(void *)v88), v82 + 8 * v89, v109);
        if (v1) {
          goto LABEL_109;
        }
        if (v89 < v85) {
          goto LABEL_112;
        }
        if (v87 > *((void *)v83 + 2)) {
          goto LABEL_113;
        }
        *(void *)Swift::String v84 = v85;
        *(void *)&v86[16 * v81 + 8] = v89;
        unint64_t v91 = *((void *)v83 + 2);
        if (v87 >= v91) {
          goto LABEL_114;
        }
        Swift::String v8 = v83;
        unint64_t v11 = v91 - 1;
        memmove(v88, v88 + 16, 16 * (v91 - 1 - v87));
        Swift::String v40 = v86;
        *((void *)v83 + 2) = v91 - 1;
        uint64_t v10 = v90;
        Swift::Int v9 = v108;
        if (v91 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v11 = 1;
LABEL_14:
    Swift::Int v3 = v106;
    if (v9 >= v106) {
      goto LABEL_98;
    }
  }
  if (__OFADD__(v12, v103)) {
    goto LABEL_134;
  }
  if (v12 + v103 >= v3) {
    Swift::Int v27 = v3;
  }
  else {
    Swift::Int v27 = v12 + v103;
  }
  if (v27 >= v12)
  {
    if (v9 != v27)
    {
      uint64_t v102 = v8;
      uint64_t v28 = v99 + 8 * v9;
      Swift::Int v105 = v27;
      do
      {
        id v29 = *(void **)(v10 + 8 * v9);
        Swift::Int v30 = v12;
        uint64_t v31 = v28;
        do
        {
          uint64_t v32 = *(void **)v31;
          id v33 = v29;
          id v34 = v32;
          unsigned int v35 = [v33 sortOrder];
          unsigned int v36 = [v34 sortOrder];

          if (v35 >= v36) {
            break;
          }
          if (!v10) {
            goto LABEL_136;
          }
          uint64_t v37 = *(void **)v31;
          id v29 = *(void **)(v31 + 8);
          *(void *)uint64_t v31 = v29;
          *(void *)(v31 + 8) = v37;
          v31 -= 8;
          ++v30;
        }
        while (v9 != v30);
        ++v9;
        v28 += 8;
        Swift::Int v12 = v107;
      }
      while (v9 != v105);
      Swift::Int v9 = v105;
      Swift::String v8 = v102;
    }
    goto LABEL_48;
  }
LABEL_135:
  __break(1u);
LABEL_136:
  __break(1u);
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_10000C55C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v5 = *a4;
    uint64_t v6 = *a4 + 8 * a3 - 8;
LABEL_5:
    uint64_t v7 = *(void **)(v5 + 8 * v4);
    uint64_t v8 = a1;
    uint64_t v17 = v6;
    while (1)
    {
      Swift::Int v9 = *(void **)v6;
      id v10 = v7;
      id v11 = v9;
      unsigned int v12 = [v10 sortOrder];
      unsigned int v13 = [v11 sortOrder];

      if (v12 >= v13)
      {
LABEL_4:
        ++v4;
        uint64_t v6 = v17 + 8;
        if (v4 == a2) {
          return;
        }
        goto LABEL_5;
      }
      if (!v5) {
        break;
      }
      id v14 = *(void **)v6;
      uint64_t v7 = *(void **)(v6 + 8);
      *(void *)uint64_t v6 = v7;
      *(void *)(v6 + 8) = v14;
      v6 -= 8;
      if (v4 == ++v8) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t sub_10000C650(id *__src, id *a2, unint64_t a3, void **a4)
{
  uint64_t v4 = a2;
  uint64_t v5 = __src;
  int64_t v6 = (char *)a2 - (char *)__src;
  int64_t v7 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v7 = (char *)a2 - (char *)__src;
  }
  uint64_t v8 = v7 >> 3;
  uint64_t v9 = a3 - (void)a2;
  uint64_t v10 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v10 = a3 - (void)a2;
  }
  uint64_t v11 = v10 >> 3;
  unint64_t v38 = __src;
  uint64_t v37 = a4;
  if (v8 >= v10 >> 3)
  {
    if (v9 >= -7)
    {
      if (a4 != a2 || &a2[v11] <= a4) {
        memmove(a4, a2, 8 * v11);
      }
      os_log_type_t v22 = &a4[v11];
      unsigned int v36 = (char *)v22;
      unint64_t v38 = v4;
      if (v5 < v4 && v9 >= 8)
      {
        Swift::Int v23 = (id *)(a3 - 8);
        Swift::Int v24 = v4;
        uint64_t v32 = v5;
        do
        {
          unsigned int v35 = v4;
          Swift::String v25 = v23 + 1;
          uint64_t v26 = *--v24;
          id v27 = *(v22 - 1);
          id v28 = v26;
          unsigned int v29 = [v27 sortOrder];
          unsigned int v30 = [v28 sortOrder];

          if (v29 >= v30)
          {
            unsigned int v36 = (char *)(v22 - 1);
            if (v25 < v22 || v23 >= v22 || v25 != v22) {
              *Swift::Int v23 = *(v22 - 1);
            }
            Swift::Int v24 = v35;
            --v22;
          }
          else
          {
            if (v25 != v35 || v23 >= v35) {
              *Swift::Int v23 = *v24;
            }
            unint64_t v38 = v24;
          }
          if (v24 <= v32) {
            break;
          }
          --v23;
          uint64_t v4 = v24;
        }
        while (v22 > a4);
      }
      goto LABEL_43;
    }
  }
  else if (v6 >= -7)
  {
    if (a4 != __src || &__src[v8] <= a4) {
      memmove(a4, __src, 8 * v8);
    }
    unsigned int v12 = &a4[v8];
    unsigned int v36 = (char *)v12;
    if ((unint64_t)v4 < a3 && v6 >= 8)
    {
      unsigned int v13 = a4;
      do
      {
        id v14 = v5;
        id v15 = *v13;
        id v16 = *v4;
        id v17 = v15;
        unsigned int v18 = [v16 sortOrder];
        unsigned int v19 = [v17 sortOrder];

        if (v18 >= v19)
        {
          unsigned int v21 = v14;
          if (v14 != v13) {
            *id v14 = *v13;
          }
          uint64_t v37 = ++v13;
          id v20 = v4;
        }
        else
        {
          id v20 = v4 + 1;
          unsigned int v21 = v14;
          if (v14 < v4 || v14 >= v20 || v14 != v4) {
            *id v14 = *v4;
          }
        }
        uint64_t v5 = v21 + 1;
        if (v13 >= v12) {
          break;
        }
        uint64_t v4 = v20;
      }
      while ((unint64_t)v20 < a3);
      unint64_t v38 = v5;
    }
LABEL_43:
    sub_10000CA6C((void **)&v38, (const void **)&v37, &v36);
    return 1;
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_10000C970(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004E64(&qword_100036E30);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unsigned int v13 = v10 + 32;
  id v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_10000CA6C(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_10000CB28(uint64_t a1)
{
  return sub_10000C970(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10000CB3C(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_10000CB60()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000CB98(uint64_t a1)
{
  return sub_10000B554(a1, *(void **)(v1 + 16));
}

uint64_t sub_10000CBA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000CBB0()
{
  return swift_release();
}

uint64_t sub_10000CBC0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000CBF8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000CC30()
{
  sub_10000AAAC(*(unsigned char *)(v0 + 16));
}

unint64_t sub_10000CC3C()
{
  unint64_t result = qword_100036DF0;
  if (!qword_100036DF0)
  {
    sub_100005E2C(&qword_100036DE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100036DF0);
  }
  return result;
}

uint64_t sub_10000CC98()
{
  return sub_10000A4CC();
}

void *sub_10000CCA0(unint64_t a1, void *a2)
{
  unint64_t v2 = a1;
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    unint64_t result = _swiftEmptyArrayStorage;
    if (!v3) {
      break;
    }
    unint64_t result = (void *)specialized ContiguousArray.reserveCapacity(_:)();
    if (v3 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v5 = 0;
    unint64_t v12 = v2 & 0xC000000000000001;
    unint64_t v6 = v2;
    while (v3 != v5)
    {
      if (v12) {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v7 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v8 = v7;
      ++v5;
      sub_100006CB8(0, &qword_100036E20);
      sub_100006C74(&qword_100036E28, &qword_100036E20);
      uint64_t v9 = (void *)CAFObserved<>.observable.getter();
      id v10 = [a2 odometer];
      sub_100006CB8(0, &qword_100036E10);
      sub_100006C74(&qword_100036E18, &qword_100036E10);
      int64_t v11 = (void *)CAFObserved<>.observable.getter();

      type metadata accessor for TripCard(0);
      swift_allocObject();
      sub_100018550(v9, v11);

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      unint64_t v2 = v6;
      if (v3 == v5) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000CEF8(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_10000CF40()
{
}

uint64_t sub_10000CF48(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000CF9C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004E64(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *sub_10000CFF8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000D008(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000D064(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for TripPresentationMode(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TripMeasurementStyle(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TripMeasurementStyle(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x10000D22CLL);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_10000D254(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000D25C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TripMeasurementStyle()
{
  return &type metadata for TripMeasurementStyle;
}

unint64_t sub_10000D278()
{
  unint64_t result = qword_100036E60;
  if (!qword_100036E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100036E60);
  }
  return result;
}

BOOL sub_10000D2CC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000D2E0()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000D328()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000D354()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_10000D398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (a8)
  {
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v8 = vars8;
  }
  return swift_retain();
}

uint64_t destroy for TripMeasurementView(uint64_t a1)
{
  sub_10000D450(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned char *)(a1 + 56));

  return swift_release();
}

uint64_t sub_10000D450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (a8)
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v8 = vars8;
  }
  return swift_release();
}

uint64_t initializeWithCopy for TripMeasurementView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  char v11 = *(unsigned char *)(a2 + 56);
  sub_10000D398(*(void *)a2, v5, v6, v7, v8, v9, v10, v11);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(unsigned char *)(a1 + 56) = v11;
  uint64_t v12 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v12;
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for TripMeasurementView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  char v11 = *(unsigned char *)(a2 + 56);
  sub_10000D398(*(void *)a2, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  char v19 = *(unsigned char *)(a1 + 56);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(unsigned char *)(a1 + 56) = v11;
  sub_10000D450(v12, v13, v14, v15, v16, v17, v18, v19);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  return a1;
}

__n128 initializeWithTake for TripMeasurementView(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for TripMeasurementView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 48);
  char v5 = *(unsigned char *)(a2 + 56);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  char v13 = *(unsigned char *)(a1 + 56);
  long long v14 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v14;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = v4;
  *(unsigned char *)(a1 + 56) = v5;
  sub_10000D450(v6, v7, v8, v9, v10, v11, v12, v13);
  uint64_t v15 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v15;
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  return a1;
}

uint64_t getEnumTagSinglePayload for TripMeasurementView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TripMeasurementView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
      *(void *)(result + 72) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TripMeasurementView()
{
  return &type metadata for TripMeasurementView;
}

uint64_t sub_10000D794()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000D7B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v87 = a1;
  uint64_t v2 = sub_100004E64(&qword_100036E68);
  __chkstk_darwin(v2 - 8);
  uint64_t v68 = (uint64_t)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_100004E64(&qword_100036E70);
  uint64_t v4 = __chkstk_darwin(v77);
  uint64_t v67 = (uint64_t)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v70 = (uint64_t)&v63 - v6;
  uint64_t v75 = sub_100004E64(&qword_100036E78);
  __chkstk_darwin(v75);
  uint64_t v76 = (uint64_t)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_100004E64(&qword_100036E80);
  __chkstk_darwin(v83);
  uint64_t v78 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100004E64(&qword_100036E88);
  __chkstk_darwin(v9 - 8);
  uint64_t v65 = (uint64_t)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_100004E64(&qword_100036E90);
  uint64_t v11 = __chkstk_darwin(v74);
  uint64_t v64 = (uint64_t)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v69 = (uint64_t)&v63 - v13;
  uint64_t v14 = sub_100004E64(&qword_100036E98);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_100004E64(&qword_100036EA0);
  uint64_t v17 = __chkstk_darwin(v73);
  char v19 = (char *)&v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v66 = (uint64_t)&v63 - v20;
  uint64_t v84 = sub_100004E64(&qword_100036EA8);
  __chkstk_darwin(v84);
  uint64_t v86 = (uint64_t)&v63 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_100004E64(&qword_100036EB0);
  __chkstk_darwin(v79);
  uint64_t v81 = (uint64_t)&v63 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_100004E64(&qword_100036EB8);
  __chkstk_darwin(v71);
  Swift::Int v24 = (char *)&v63 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_100004E64(&qword_100036EC0);
  __chkstk_darwin(v80);
  uint64_t v72 = (char *)&v63 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_100004E64(&qword_100036EC8);
  __chkstk_darwin(v85);
  uint64_t v82 = (char *)&v63 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100004E64(&qword_100036ED0);
  __chkstk_darwin(v27 - 8);
  unsigned int v29 = (char *)&v63 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100004E64(&qword_100036ED8);
  uint64_t v31 = __chkstk_darwin(v30);
  id v33 = (char *)&v63 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  unsigned int v35 = (char *)&v63 - v34;
  v92[0] = *(_OWORD *)(v1 + 64);
  int v36 = *(unsigned __int8 *)(*((void *)&v92[0] + 1) + OBJC_IVAR____TtC4Trip21CardCellConfiguration_preferredCellStyle);
  if (v36 == 5) {
    int v36 = *(unsigned __int8 *)(v1 + 80);
  }
  switch(v36)
  {
    case 1:
      sub_10000E988((uint64_t)v16);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      sub_100013D9C((uint64_t)v92);
      if (v88[0]) {
        double v42 = 0.0;
      }
      else {
        double v42 = 1.0;
      }
      sub_100014934((uint64_t)v16, (uint64_t)v19, &qword_100036E98);
      *(double *)&v19[*(int *)(v73 + 36)] = v42;
      sub_10000CF9C((uint64_t)v16, &qword_100036E98);
      unint64_t v38 = &qword_100036EA0;
      uint64_t v43 = v66;
      sub_100014564((uint64_t)v19, v66, &qword_100036EA0);
      sub_100014934(v43, (uint64_t)v24, &qword_100036EA0);
      swift_storeEnumTagMultiPayload();
      sub_100013F54(&qword_100036EF8, &qword_100036ED8, (void (*)(void))sub_100013EC8);
      sub_100013F54(&qword_100036F18, &qword_100036EA0, (void (*)(void))sub_100013FD4);
      uint64_t v44 = (uint64_t)v72;
      _ConditionalContent<>.init(storage:)();
      uint64_t v45 = &qword_100036EC0;
      sub_100014934(v44, v81, &qword_100036EC0);
      goto LABEL_21;
    case 2:
      uint64_t v46 = v65;
      sub_10000EBE8(&qword_100036F58, &qword_100036FE0, (void (*)(_OWORD *))sub_100010CA0, &qword_100036E88, v65);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      sub_100013D9C((uint64_t)v92);
      if (v88[0]) {
        double v47 = 0.0;
      }
      else {
        double v47 = 1.0;
      }
      uint64_t v48 = v64;
      sub_100014934(v46, v64, &qword_100036E88);
      *(double *)(v48 + *(int *)(v74 + 36)) = v47;
      sub_10000CF9C(v46, &qword_100036E88);
      unint64_t v38 = &qword_100036E90;
      uint64_t v43 = v69;
      sub_100014564(v48, v69, &qword_100036E90);
      sub_100014934(v43, v76, &qword_100036E90);
      swift_storeEnumTagMultiPayload();
      sub_100013F54(&qword_100036F40, &qword_100036E90, (void (*)(void))sub_100014124);
      sub_100013F54(&qword_100036F60, &qword_100036E70, (void (*)(void))sub_1000141B0);
      uint64_t v44 = (uint64_t)v78;
      goto LABEL_20;
    case 3:
      uint64_t v49 = v68;
      sub_10000EBE8(&qword_100036F78, &qword_100036FF0, (void (*)(_OWORD *))sub_1000121A0, &qword_100036E68, v68);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      sub_100013D9C((uint64_t)v92);
      if (v88[0]) {
        double v50 = 0.0;
      }
      else {
        double v50 = 1.0;
      }
      uint64_t v51 = v67;
      sub_100014934(v49, v67, &qword_100036E68);
      *(double *)(v51 + *(int *)(v77 + 36)) = v50;
      sub_10000CF9C(v49, &qword_100036E68);
      unint64_t v38 = &qword_100036E70;
      uint64_t v43 = v70;
      sub_100014564(v51, v70, &qword_100036E70);
      sub_100014934(v43, v76, &qword_100036E70);
      swift_storeEnumTagMultiPayload();
      sub_100013F54(&qword_100036F40, &qword_100036E90, (void (*)(void))sub_100014124);
      sub_100013F54(&qword_100036F60, &qword_100036E70, (void (*)(void))sub_1000141B0);
      uint64_t v44 = (uint64_t)v78;
LABEL_20:
      _ConditionalContent<>.init(storage:)();
      uint64_t v45 = &qword_100036E80;
      sub_100014934(v44, v81, &qword_100036E80);
LABEL_21:
      swift_storeEnumTagMultiPayload();
      sub_100013E04();
      sub_100014060();
      uint64_t v52 = (uint64_t)v82;
      _ConditionalContent<>.init(storage:)();
      sub_10000CF9C(v44, v45);
      sub_100014934(v52, v86, &qword_100036EC8);
      swift_storeEnumTagMultiPayload();
      sub_100004E64(&qword_100036EE0);
      sub_100013DC8();
      sub_10001423C();
      _ConditionalContent<>.init(storage:)();
      sub_10000CF9C(v52, &qword_100036EC8);
      uint64_t v41 = v43;
      return sub_10000CF9C(v41, v38);
    case 4:
      uint64_t v54 = static HorizontalAlignment.center.getter();
      sub_100012F5C(v1, (uint64_t)v90);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      sub_100013D9C((uint64_t)v92);
      double v55 = 1.0;
      if (v88[0]) {
        double v55 = 0.0;
      }
      *(_OWORD *)&v88[167] = v90[10];
      *(_OWORD *)&v88[183] = v90[11];
      *(_OWORD *)&v88[199] = v90[12];
      *(_OWORD *)&v88[103] = v90[6];
      *(_OWORD *)&v88[119] = v90[7];
      *(_OWORD *)&v88[135] = v90[8];
      *(_OWORD *)&v88[151] = v90[9];
      *(_OWORD *)&v88[39] = v90[2];
      *(_OWORD *)&v88[55] = v90[3];
      *(_OWORD *)&v88[71] = v90[4];
      *(_OWORD *)&v88[87] = v90[5];
      *(_OWORD *)&v88[7] = v90[0];
      *(_OWORD *)&v88[23] = v90[1];
      long long v56 = *(_OWORD *)&v88[176];
      uint64_t v57 = v86;
      *(_OWORD *)(v86 + 177) = *(_OWORD *)&v88[160];
      *(_OWORD *)(v57 + 193) = v56;
      *(_OWORD *)(v57 + 209) = *(_OWORD *)&v88[192];
      long long v58 = *(_OWORD *)&v88[112];
      *(_OWORD *)(v57 + 113) = *(_OWORD *)&v88[96];
      *(_OWORD *)(v57 + 129) = v58;
      long long v59 = *(_OWORD *)&v88[144];
      *(_OWORD *)(v57 + 145) = *(_OWORD *)&v88[128];
      *(_OWORD *)(v57 + 161) = v59;
      long long v60 = *(_OWORD *)&v88[48];
      *(_OWORD *)(v57 + 49) = *(_OWORD *)&v88[32];
      *(_OWORD *)(v57 + 65) = v60;
      long long v61 = *(_OWORD *)&v88[80];
      *(_OWORD *)(v57 + 81) = *(_OWORD *)&v88[64];
      *(_OWORD *)(v57 + 97) = v61;
      long long v62 = *(_OWORD *)&v88[16];
      *(_OWORD *)(v57 + 17) = *(_OWORD *)v88;
      char v89 = 0;
      v88[215] = v91;
      *(void *)uint64_t v57 = v54;
      *(void *)(v57 + 8) = 0x4020000000000000;
      *(unsigned char *)(v57 + 16) = 0;
      *(void *)(v57 + 225) = *(void *)&v88[208];
      *(_OWORD *)(v57 + 33) = v62;
      *(double *)(v57 + 240) = v55;
      swift_storeEnumTagMultiPayload();
      sub_100004E64(&qword_100036EE0);
      sub_100013DC8();
      sub_10001423C();
      return _ConditionalContent<>.init(storage:)();
    default:
      sub_10000E728((uint64_t)v29);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      sub_100013D9C((uint64_t)v92);
      if (v88[0]) {
        double v37 = 0.0;
      }
      else {
        double v37 = 1.0;
      }
      sub_100014934((uint64_t)v29, (uint64_t)v33, &qword_100036ED0);
      *(double *)&v33[*(int *)(v30 + 36)] = v37;
      sub_10000CF9C((uint64_t)v29, &qword_100036ED0);
      unint64_t v38 = &qword_100036ED8;
      sub_100014564((uint64_t)v33, (uint64_t)v35, &qword_100036ED8);
      sub_100014934((uint64_t)v35, (uint64_t)v24, &qword_100036ED8);
      swift_storeEnumTagMultiPayload();
      sub_100013F54(&qword_100036EF8, &qword_100036ED8, (void (*)(void))sub_100013EC8);
      sub_100013F54(&qword_100036F18, &qword_100036EA0, (void (*)(void))sub_100013FD4);
      uint64_t v39 = (uint64_t)v72;
      _ConditionalContent<>.init(storage:)();
      sub_100014934(v39, v81, &qword_100036EC0);
      swift_storeEnumTagMultiPayload();
      sub_100013E04();
      sub_100014060();
      uint64_t v40 = (uint64_t)v82;
      _ConditionalContent<>.init(storage:)();
      sub_10000CF9C(v39, &qword_100036EC0);
      sub_100014934(v40, v86, &qword_100036EC8);
      swift_storeEnumTagMultiPayload();
      sub_100004E64(&qword_100036EE0);
      sub_100013DC8();
      sub_10001423C();
      _ConditionalContent<>.init(storage:)();
      sub_10000CF9C(v40, &qword_100036EC8);
      uint64_t v41 = (uint64_t)v35;
      return sub_10000CF9C(v41, v38);
  }
}

uint64_t sub_10000E728@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100004E64(&qword_100036F10);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v5 = static HorizontalAlignment.center.getter();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v6 = sub_100004E64(&qword_100036F98);
  sub_10000EE4C((uint64_t)v1, (uint64_t)&v5[*(int *)(v6 + 44)]);
  long long v7 = v1[1];
  v21[0] = *v1;
  v21[1] = v7;
  v22[0] = v1[2];
  *(_OWORD *)((char *)v22 + 9) = *(_OWORD *)((char *)v1 + 41);
  sub_100014318((uint64_t)v21, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v18);
  sub_100014318((uint64_t)v21, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v8 = v19;
  uint64_t v9 = v20;
  if (LOBYTE(v18[0]))
  {
    if (LOBYTE(v18[0]) == 1)
    {
      uint64_t v10 = type metadata accessor for ClusterMetrics();
      uint64_t v11 = &off_100031A98;
      uint64_t v16 = v10;
      uint64_t v17 = &off_100031A98;
      v15[0] = *((void *)&v8 + 1);
    }
    else
    {
      uint64_t v10 = type metadata accessor for WidgetMetrics();
      uint64_t v11 = &off_100031A08;
      uint64_t v16 = v10;
      uint64_t v17 = &off_100031A08;
      v15[0] = v9;
    }
  }
  else
  {
    uint64_t v10 = type metadata accessor for ConsoleMetrics();
    uint64_t v11 = &off_100031B28;
    uint64_t v16 = v10;
    uint64_t v17 = &off_100031B28;
    v15[0] = v8;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v15, v10);
  ((void (__cdecl *)())v11[3])();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_100014934((uint64_t)v5, a1, &qword_100036F10);
  uint64_t v12 = (_OWORD *)(a1 + *(int *)(sub_100004E64(&qword_100036ED0) + 36));
  long long v13 = v18[1];
  *uint64_t v12 = v18[0];
  v12[1] = v13;
  v12[2] = v19;
  sub_10000CF9C((uint64_t)v5, &qword_100036F10);
  return sub_10000D064((uint64_t)v15);
}

uint64_t sub_10000E988@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100004E64(&qword_100036F30);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v5 = static HorizontalAlignment.leading.getter();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v6 = sub_100004E64(&qword_100036FD0);
  sub_10000FE40((uint64_t)v1, &v5[*(int *)(v6 + 44)]);
  long long v7 = v1[1];
  v21[0] = *v1;
  v21[1] = v7;
  v22[0] = v1[2];
  *(_OWORD *)((char *)v22 + 9) = *(_OWORD *)((char *)v1 + 41);
  sub_100014318((uint64_t)v21, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v18);
  sub_100014318((uint64_t)v21, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v8 = v19;
  uint64_t v9 = v20;
  if (LOBYTE(v18[0]))
  {
    if (LOBYTE(v18[0]) == 1)
    {
      uint64_t v10 = type metadata accessor for ClusterMetrics();
      uint64_t v11 = &off_100031A98;
      uint64_t v16 = v10;
      uint64_t v17 = &off_100031A98;
      v15[0] = *((void *)&v8 + 1);
    }
    else
    {
      uint64_t v10 = type metadata accessor for WidgetMetrics();
      uint64_t v11 = &off_100031A08;
      uint64_t v16 = v10;
      uint64_t v17 = &off_100031A08;
      v15[0] = v9;
    }
  }
  else
  {
    uint64_t v10 = type metadata accessor for ConsoleMetrics();
    uint64_t v11 = &off_100031B28;
    uint64_t v16 = v10;
    uint64_t v17 = &off_100031B28;
    v15[0] = v8;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v15, v10);
  ((void (__cdecl *)())v11[3])();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_100014934((uint64_t)v5, a1, &qword_100036F30);
  uint64_t v12 = (_OWORD *)(a1 + *(int *)(sub_100004E64(&qword_100036E98) + 36));
  long long v13 = v18[1];
  *uint64_t v12 = v18[0];
  v12[1] = v13;
  v12[2] = v19;
  sub_10000CF9C((uint64_t)v5, &qword_100036F30);
  return sub_10000D064((uint64_t)v15);
}

uint64_t sub_10000EBE8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, void (*a3)(_OWORD *)@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v22 = a4;
  uint64_t v10 = sub_100004E64(a1);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v12 = static HorizontalAlignment.leading.getter();
  *((void *)v12 + 1) = 0;
  v12[16] = 1;
  sub_100004E64(a2);
  a3(v5);
  long long v13 = v5[1];
  v29[0] = *v5;
  v29[1] = v13;
  v30[0] = v5[2];
  *(_OWORD *)((char *)v30 + 9) = *(_OWORD *)((char *)v5 + 41);
  sub_100014318((uint64_t)v29, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v26);
  sub_100014318((uint64_t)v29, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v14 = v27;
  uint64_t v15 = v28;
  if (LOBYTE(v26[0]))
  {
    if (LOBYTE(v26[0]) == 1)
    {
      uint64_t v16 = type metadata accessor for ClusterMetrics();
      uint64_t v17 = &off_100031A98;
      uint64_t v24 = v16;
      uint64_t v25 = &off_100031A98;
      v23[0] = *((void *)&v14 + 1);
    }
    else
    {
      uint64_t v16 = type metadata accessor for WidgetMetrics();
      uint64_t v17 = &off_100031A08;
      uint64_t v24 = v16;
      uint64_t v25 = &off_100031A08;
      v23[0] = v15;
    }
  }
  else
  {
    uint64_t v16 = type metadata accessor for ConsoleMetrics();
    uint64_t v17 = &off_100031B28;
    uint64_t v24 = v16;
    uint64_t v25 = &off_100031B28;
    v23[0] = v14;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v23, v16);
  ((void (__cdecl *)())v17[2])();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_100014934((uint64_t)v12, a5, a1);
  uint64_t v18 = (_OWORD *)(a5 + *(int *)(sub_100004E64(v22) + 36));
  long long v19 = v26[1];
  *uint64_t v18 = v26[0];
  v18[1] = v19;
  _OWORD v18[2] = v27;
  sub_10000CF9C((uint64_t)v12, a1);
  return sub_10000D064((uint64_t)v23);
}

uint64_t sub_10000EE4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Divider();
  uint64_t v43 = *(void *)(v4 - 8);
  uint64_t v44 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004E64(&qword_100036FA0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100004E64(&qword_100036FA8);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v46 = (uint64_t)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v45 = (uint64_t)&v40 - v14;
  uint64_t v15 = sub_100004E64(&qword_100036FB0);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v47 = (uint64_t)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  long long v19 = (char *)&v40 - v18;
  if (*(unsigned char *)(*(void *)(a1 + 72) + OBJC_IVAR____TtC4Trip21CardCellConfiguration_dataType) == 1)
  {
    uint64_t v40 = (char *)&v40 - v18;
    uint64_t v41 = v11;
    uint64_t v42 = a2;
    Divider.init()();
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    uint64_t v21 = v43;
    uint64_t v20 = v44;
    (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v9, v6, v44);
    uint64_t v22 = &v9[*(int *)(v7 + 36)];
    long long v23 = *(_OWORD *)&v67[47];
    *(_OWORD *)uint64_t v22 = *(_OWORD *)&v67[31];
    *((_OWORD *)v22 + 1) = v23;
    *((_OWORD *)v22 + 2) = *(_OWORD *)&v67[63];
    (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v20);
    long long v24 = *(_OWORD *)(a1 + 16);
    v68[0] = *(_OWORD *)a1;
    v68[1] = v24;
    v69[0] = *(_OWORD *)(a1 + 32);
    *(_OWORD *)((char *)v69 + 9) = *(_OWORD *)(a1 + 41);
    sub_100014318((uint64_t)v68, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
    sub_1000225D4((uint64_t)&v53);
    sub_100014318((uint64_t)v68, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
    uint64_t v43 = *(void *)v55;
    uint64_t v44 = v54;
    uint64_t v25 = *(void *)&v55[16];
    uint64_t v26 = *(void *)&v55[24];
    uint64_t v27 = *(void *)&v55[32];
    if ((_BYTE)v53)
    {
      if (v53 == 1)
      {
        uint64_t v28 = type metadata accessor for ClusterMetrics();
        unsigned int v29 = &off_100031A98;
        *(void *)&v55[16] = &off_100031A98;
        *(void *)&v55[8] = v28;
        uint64_t v53 = v26;
      }
      else
      {
        uint64_t v28 = type metadata accessor for WidgetMetrics();
        unsigned int v29 = &off_100031A08;
        *(void *)&v55[16] = &off_100031A08;
        *(void *)&v55[8] = v28;
        uint64_t v53 = v27;
      }
    }
    else
    {
      uint64_t v28 = type metadata accessor for ConsoleMetrics();
      unsigned int v29 = &off_100031B28;
      *(void *)&v55[16] = &off_100031B28;
      *(void *)&v55[8] = v28;
      uint64_t v53 = v25;
    }
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    sub_10001435C(&v53, v28);
    uint64_t v30 = ((uint64_t (__cdecl *)())v29[13])();
    char v31 = static Edge.Set.all.getter();
    uint64_t v32 = v46;
    sub_100014934((uint64_t)v9, v46, &qword_100036FA0);
    uint64_t v33 = v32 + *(int *)(v10 + 36);
    *(void *)uint64_t v33 = v30;
    *(unsigned char *)(v33 + 8) = v31;
    sub_10000CF9C((uint64_t)v9, &qword_100036FA0);
    sub_10000D064((uint64_t)&v53);
    uint64_t v34 = v45;
    sub_100014564(v32, v45, &qword_100036FA8);
    long long v19 = v40;
    sub_100014564(v34, (uint64_t)v40, &qword_100036FA8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(v19, 0, 1, v10);
    a2 = v42;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))((char *)&v40 - v18, 1, 1, v10);
  }
  uint64_t v35 = static VerticalAlignment.center.getter();
  sub_10000F514((_OWORD *)a1, (uint64_t)v48);
  *(_OWORD *)((char *)&v50[12] + 7) = v48[12];
  *(_OWORD *)((char *)&v50[13] + 7) = v48[13];
  *(_OWORD *)((char *)&v50[14] + 7) = v48[14];
  *(_OWORD *)((char *)&v50[8] + 7) = v48[8];
  *(_OWORD *)((char *)&v50[9] + 7) = v48[9];
  *(_OWORD *)((char *)&v50[10] + 7) = v48[10];
  *(_OWORD *)((char *)&v50[11] + 7) = v48[11];
  *(_OWORD *)((char *)&v50[4] + 7) = v48[4];
  *(_OWORD *)((char *)&v50[5] + 7) = v48[5];
  *(_OWORD *)((char *)&v50[6] + 7) = v48[6];
  *(_OWORD *)((char *)&v50[7] + 7) = v48[7];
  *(_OWORD *)((char *)v50 + 7) = v48[0];
  *(_OWORD *)((char *)&v50[1] + 7) = v48[1];
  *(_OWORD *)((char *)&v50[2] + 7) = v48[2];
  char v51 = 1;
  *(void *)((char *)&v50[15] + 7) = v49;
  *(_OWORD *)((char *)&v50[3] + 7) = v48[3];
  uint64_t v36 = v47;
  sub_100014934((uint64_t)v19, v47, &qword_100036FB0);
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  uint64_t v37 = sub_100004E64(&qword_100036FB8);
  sub_100014934(v36, a2 + *(int *)(v37 + 48), &qword_100036FB0);
  uint64_t v38 = *(int *)(v37 + 64);
  *(_OWORD *)((char *)&v52[13] + 1) = v50[12];
  *(_OWORD *)((char *)&v52[14] + 1) = v50[13];
  *(_OWORD *)((char *)&v52[15] + 1) = v50[14];
  v52[16] = *(_OWORD *)((char *)&v50[14] + 15);
  *(_OWORD *)((char *)&v52[9] + 1) = v50[8];
  *(_OWORD *)((char *)&v52[10] + 1) = v50[9];
  *(_OWORD *)((char *)&v52[11] + 1) = v50[10];
  *(_OWORD *)((char *)&v52[12] + 1) = v50[11];
  *(_OWORD *)((char *)&v52[5] + 1) = v50[4];
  *(_OWORD *)((char *)&v52[6] + 1) = v50[5];
  *(_OWORD *)((char *)&v52[7] + 1) = v50[6];
  *(_OWORD *)((char *)&v52[8] + 1) = v50[7];
  *(_OWORD *)((char *)&v52[3] + 1) = v50[2];
  *(_OWORD *)((char *)&v52[4] + 1) = v50[3];
  *(_OWORD *)((char *)&v52[1] + 1) = v50[0];
  v52[0] = (unint64_t)v35;
  LOBYTE(v52[1]) = 1;
  *(_OWORD *)((char *)&v52[2] + 1) = v50[1];
  memcpy((void *)(a2 + v38), v52, 0x110uLL);
  sub_1000143A0((uint64_t)v52);
  sub_10000CF9C((uint64_t)v19, &qword_100036FB0);
  long long v65 = v50[12];
  long long v66 = v50[13];
  *(_OWORD *)uint64_t v67 = v50[14];
  *(_OWORD *)&v67[15] = *(_OWORD *)((char *)&v50[14] + 15);
  long long v61 = v50[8];
  long long v62 = v50[9];
  long long v63 = v50[10];
  long long v64 = v50[11];
  long long v57 = v50[4];
  long long v58 = v50[5];
  long long v59 = v50[6];
  long long v60 = v50[7];
  *(_OWORD *)&v55[1] = v50[0];
  *(_OWORD *)&v55[17] = v50[1];
  *(_OWORD *)&v55[33] = v50[2];
  uint64_t v53 = v35;
  uint64_t v54 = 0;
  v55[0] = 1;
  long long v56 = v50[3];
  sub_100014480((uint64_t)&v53);
  return sub_10000CF9C(v36, &qword_100036FB0);
}

uint64_t sub_10000F514@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100004E64(&qword_100036FC0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  uint64_t v49 = Image.init(automakerSymbolName:)();
  long long v7 = a1[1];
  v84[0] = *a1;
  v84[1] = v7;
  v85[0] = a1[2];
  uint64_t v43 = a1;
  *(_OWORD *)((char *)v85 + 9) = *(_OWORD *)((char *)a1 + 41);
  sub_100014318((uint64_t)v84, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v67);
  sub_100014318((uint64_t)v84, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v8 = v70;
  unint64_t v9 = v71;
  if (v67.n128_u8[0])
  {
    if (v67.n128_u8[0] == 1)
    {
      uint64_t v10 = type metadata accessor for ClusterMetrics();
      uint64_t v11 = &off_100031A98;
      uint64_t v69 = v10;
      *(void *)&long long v70 = &off_100031A98;
      v67.n128_u64[0] = *((void *)&v8 + 1);
    }
    else
    {
      uint64_t v10 = type metadata accessor for WidgetMetrics();
      uint64_t v11 = &off_100031A08;
      uint64_t v69 = v10;
      *(void *)&long long v70 = &off_100031A08;
      v67.n128_u64[0] = v9;
    }
  }
  else
  {
    uint64_t v10 = type metadata accessor for ConsoleMetrics();
    uint64_t v11 = &off_100031B28;
    uint64_t v69 = v10;
    *(void *)&long long v70 = &off_100031B28;
    v67.n128_u64[0] = v8;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(&v67, v10);
  ((void (__cdecl *)())v11[7])();
  uint64_t v12 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v6, 1, 1, v12);
  uint64_t v48 = static Font.system(size:weight:design:)();
  sub_10000CF9C((uint64_t)v6, &qword_100036FC0);
  sub_10000D064((uint64_t)&v67);
  uint64_t KeyPath = swift_getKeyPath();
  int v46 = static Edge.Set.trailing.getter();
  sub_100014318((uint64_t)v84, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v67);
  sub_100014318((uint64_t)v84, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v13 = v70;
  unint64_t v14 = v71;
  if (v67.n128_u8[0])
  {
    if (v67.n128_u8[0] == 1)
    {
      uint64_t v15 = type metadata accessor for ClusterMetrics();
      uint64_t v16 = &off_100031A98;
      uint64_t v69 = v15;
      *(void *)&long long v70 = &off_100031A98;
      v67.n128_u64[0] = *((void *)&v13 + 1);
    }
    else
    {
      uint64_t v15 = type metadata accessor for WidgetMetrics();
      uint64_t v16 = &off_100031A08;
      uint64_t v69 = v15;
      *(void *)&long long v70 = &off_100031A08;
      v67.n128_u64[0] = v14;
    }
  }
  else
  {
    uint64_t v15 = type metadata accessor for ConsoleMetrics();
    uint64_t v16 = &off_100031B28;
    uint64_t v69 = v15;
    *(void *)&long long v70 = &off_100031B28;
    v67.n128_u64[0] = v13;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(&v67, v15);
  uint64_t v45 = ((uint64_t (__cdecl *)())v16[6])();
  uint64_t v44 = swift_getKeyPath();
  sub_10000D064((uint64_t)&v67);
  sub_100014318((uint64_t)v84, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v67);
  sub_100014318((uint64_t)v84, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v17 = v70;
  uint64_t v18 = v71;
  if (v67.n128_u8[0])
  {
    if (v67.n128_u8[0] == 1)
    {
      uint64_t v19 = type metadata accessor for ClusterMetrics();
      uint64_t v20 = &off_100031A98;
      uint64_t v79 = v19;
      uint64_t v80 = &off_100031A98;
      v78[0] = *((void *)&v17 + 1);
    }
    else
    {
      uint64_t v19 = type metadata accessor for WidgetMetrics();
      uint64_t v20 = &off_100031A08;
      uint64_t v79 = v19;
      uint64_t v80 = &off_100031A08;
      v78[0] = v18;
    }
  }
  else
  {
    uint64_t v19 = type metadata accessor for ConsoleMetrics();
    uint64_t v20 = &off_100031B28;
    uint64_t v79 = v19;
    uint64_t v80 = &off_100031B28;
    v78[0] = v17;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v78, v19);
  ((void (__cdecl *)())v20[5])();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  unsigned __int8 v82 = 1;
  sub_10000D064((uint64_t)v78);
  unsigned __int8 v21 = v82;
  int v42 = v82;
  uint64_t v41 = static HorizontalAlignment.leading.getter();
  sub_10000FC5C(v43, &v67);
  char v22 = v68;
  uint64_t v23 = v69;
  uint64_t v24 = v70;
  char v25 = BYTE8(v70);
  long long v26 = v71;
  uint64_t v27 = v72;
  char v28 = v73;
  LODWORD(v43) = v73;
  uint64_t v29 = v74;
  __n128 v30 = v67;
  *(void *)&long long v53 = v49;
  *((void *)&v53 + 1) = KeyPath;
  *(void *)&long long v54 = v48;
  BYTE8(v54) = v46;
  *(_DWORD *)((char *)&v54 + 9) = *(_DWORD *)v83;
  HIDWORD(v54) = *(_DWORD *)&v83[3];
  long long v55 = 0u;
  long long v56 = 0u;
  LOBYTE(v57) = v21;
  DWORD1(v57) = *(_DWORD *)&v81[3];
  *(_DWORD *)((char *)&v57 + 1) = *(_DWORD *)v81;
  *((void *)&v57 + 1) = v44;
  *(void *)long long v58 = v45;
  *(_OWORD *)&v58[40] = v52;
  *(_OWORD *)&v58[24] = v51;
  *(_OWORD *)&v58[8] = v50;
  long long v31 = v53;
  long long v32 = v54;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = v31;
  *(_OWORD *)(a2 + 16) = v32;
  long long v33 = v57;
  long long v34 = *(_OWORD *)v58;
  long long v35 = *(_OWORD *)&v58[32];
  uint64_t v36 = *(void *)&v58[48];
  *(_OWORD *)(a2 + 96) = *(_OWORD *)&v58[16];
  *(_OWORD *)(a2 + 112) = v35;
  *(_OWORD *)(a2 + 64) = v33;
  *(_OWORD *)(a2 + 80) = v34;
  char v66 = 1;
  char v64 = v22;
  char v62 = v25;
  char v60 = v28;
  *(_DWORD *)(a2 + 153) = *(_DWORD *)v65;
  *(_DWORD *)(a2 + 156) = *(_DWORD *)&v65[3];
  char v37 = v64;
  *(_DWORD *)(a2 + 177) = *(_DWORD *)v63;
  *(_DWORD *)(a2 + 180) = *(_DWORD *)&v63[3];
  *(_DWORD *)(a2 + 204) = *(_DWORD *)&v61[3];
  *(_DWORD *)(a2 + 201) = *(_DWORD *)v61;
  *(_DWORD *)(a2 + 236) = *(_DWORD *)&v59[3];
  *(_DWORD *)(a2 + 233) = *(_DWORD *)v59;
  *(void *)(a2 + 128) = v36;
  *(void *)(a2 + 136) = v41;
  *(void *)(a2 + 144) = 0;
  *(unsigned char *)(a2 + 152) = 1;
  *(__n128 *)(a2 + 160) = v30;
  *(unsigned char *)(a2 + 176) = v37;
  *(void *)(a2 + 184) = v23;
  *(void *)(a2 + 192) = v24;
  *(unsigned char *)(a2 + 200) = v25;
  *(_OWORD *)(a2 + 208) = v26;
  *(void *)(a2 + 224) = v27;
  *(unsigned char *)(a2 + 232) = v28;
  *(void *)(a2 + 240) = v29;
  sub_100014678((uint64_t)&v53);
  sub_100014470(v23, v24, v25);
  swift_bridgeObjectRetain();
  char v38 = (char)v43;
  sub_100014470(*((uint64_t *)&v26 + 1), v27, (char)v43);
  swift_bridgeObjectRetain();
  sub_100014554(v23, v24, v25);
  swift_bridgeObjectRelease();
  sub_100014554(*((uint64_t *)&v26 + 1), v27, v38);
  swift_bridgeObjectRelease();
  v67.n128_u64[0] = v49;
  v67.n128_u64[1] = KeyPath;
  uint64_t v68 = v48;
  LOBYTE(v69) = v46;
  *(_DWORD *)((char *)&v69 + 1) = *(_DWORD *)v83;
  HIDWORD(v69) = *(_DWORD *)&v83[3];
  long long v70 = 0u;
  long long v71 = 0u;
  LOBYTE(v72) = v42;
  *(_DWORD *)((char *)&v72 + 1) = *(_DWORD *)v81;
  HIDWORD(v72) = *(_DWORD *)&v81[3];
  uint64_t v73 = v44;
  uint64_t v74 = v45;
  long long v77 = v52;
  long long v76 = v51;
  long long v75 = v50;
  return sub_1000146DC((uint64_t)&v67);
}

__n128 sub_10000FC5C@<Q0>(_OWORD *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v4 = static HorizontalAlignment.leading.getter();
  long long v5 = a1[1];
  v29[0] = *a1;
  v29[1] = v5;
  v30[0] = a1[2];
  *(_OWORD *)((char *)v30 + 9) = *(_OWORD *)((char *)a1 + 41);
  sub_100014318((uint64_t)v29, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v20);
  sub_100014318((uint64_t)v29, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  unint64_t v7 = v22.n128_u64[1];
  unint64_t v6 = v23;
  uint64_t v8 = v24;
  if (LOBYTE(v20[0]))
  {
    if (LOBYTE(v20[0]) == 1)
    {
      uint64_t v9 = type metadata accessor for ClusterMetrics();
      uint64_t v10 = &off_100031A98;
      uint64_t v27 = v9;
      char v28 = &off_100031A98;
      v26[0] = v6;
    }
    else
    {
      uint64_t v9 = type metadata accessor for WidgetMetrics();
      uint64_t v10 = &off_100031A08;
      uint64_t v27 = v9;
      char v28 = &off_100031A08;
      v26[0] = v8;
    }
  }
  else
  {
    uint64_t v9 = type metadata accessor for ConsoleMetrics();
    uint64_t v10 = &off_100031B28;
    uint64_t v27 = v9;
    char v28 = &off_100031B28;
    v26[0] = v7;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v26, v9);
  double v11 = ((double (__cdecl *)())v10[14])();
  sub_100010578((uint64_t)a1, (uint64_t)v20);
  unint64_t v12 = v20[0];
  unint64_t v13 = v20[1];
  unsigned __int8 v14 = v21;
  __n128 v19 = v22;
  unint64_t v15 = v23;
  unsigned __int8 v16 = v24;
  unint64_t v17 = v25;
  sub_10000D064((uint64_t)v26);
  a2->n128_u64[0] = v4;
  a2->n128_f64[1] = v11;
  a2[1].n128_u8[0] = 0;
  a2[1].n128_u64[1] = v12;
  a2[2].n128_u64[0] = v13;
  a2[2].n128_u8[8] = v14;
  __n128 result = v19;
  a2[3] = v19;
  a2[4].n128_u64[0] = v15;
  a2[4].n128_u8[8] = v16;
  a2[5].n128_u64[0] = v17;
  return result;
}

uint64_t sub_10000FE40@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v60 = a2;
  uint64_t v3 = type metadata accessor for Divider();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004E64(&qword_100036FA0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100004E64(&qword_100036FA8);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v58 = (uint64_t)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v57 = (uint64_t)&v55 - v14;
  uint64_t v15 = sub_100004E64(&qword_100036FB0);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v59 = (uint64_t)&v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  int v19 = *(unsigned __int8 *)(*(void *)(a1 + 72) + OBJC_IVAR____TtC4Trip21CardCellConfiguration_dataType);
  uint64_t v61 = (uint64_t)&v55 - v18;
  if (v19 == 1)
  {
    long long v56 = (_UNKNOWN **)v11;
    Divider.init()();
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v6, v3);
    uint64_t v20 = &v9[*(int *)(v7 + 36)];
    long long v21 = v73;
    *(_OWORD *)uint64_t v20 = v72;
    *((_OWORD *)v20 + 1) = v21;
    *((_OWORD *)v20 + 2) = v74;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    long long v22 = *(_OWORD *)(a1 + 16);
    v77[0] = *(_OWORD *)a1;
    v77[1] = v22;
    v78[0] = *(_OWORD *)(a1 + 32);
    *(_OWORD *)((char *)v78 + 9) = *(_OWORD *)(a1 + 41);
    sub_100014318((uint64_t)v77, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
    sub_1000225D4((uint64_t)v62);
    sub_100014318((uint64_t)v77, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
    uint64_t v55 = v63;
    uint64_t v24 = v65;
    uint64_t v23 = v66;
    uint64_t v25 = v67;
    if (LOBYTE(v62[0]))
    {
      if (LOBYTE(v62[0]) == 1)
      {
        uint64_t v26 = type metadata accessor for ClusterMetrics();
        uint64_t v27 = &off_100031A98;
        uint64_t v64 = v26;
        long long v65 = &off_100031A98;
        v62[0] = v23;
      }
      else
      {
        uint64_t v26 = type metadata accessor for WidgetMetrics();
        uint64_t v27 = &off_100031A08;
        uint64_t v64 = v26;
        long long v65 = &off_100031A08;
        v62[0] = v25;
      }
    }
    else
    {
      uint64_t v26 = type metadata accessor for ConsoleMetrics();
      uint64_t v27 = &off_100031B28;
      uint64_t v64 = v26;
      long long v65 = &off_100031B28;
      v62[0] = v24;
    }
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    sub_10001435C(v62, v26);
    uint64_t v28 = ((uint64_t (__cdecl *)())v27[13])();
    char v29 = static Edge.Set.all.getter();
    uint64_t v30 = v58;
    sub_100014934((uint64_t)v9, v58, &qword_100036FA0);
    uint64_t v31 = v30 + *(int *)(v10 + 36);
    *(void *)uint64_t v31 = v28;
    *(unsigned char *)(v31 + 8) = v29;
    sub_10000CF9C((uint64_t)v9, &qword_100036FA0);
    sub_10000D064((uint64_t)v62);
    uint64_t v32 = v57;
    sub_100014564(v30, v57, &qword_100036FA8);
    uint64_t v33 = v61;
    sub_100014564(v32, v61, &qword_100036FA8);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v56[7])(v33, 0, 1, v10);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))((char *)&v55 - v18, 1, 1, v10);
  }
  uint64_t v34 = static HorizontalAlignment.leading.getter();
  long long v35 = *(_OWORD *)(a1 + 16);
  v75[0] = *(_OWORD *)a1;
  v75[1] = v35;
  v76[0] = *(_OWORD *)(a1 + 32);
  *(_OWORD *)((char *)v76 + 9) = *(_OWORD *)(a1 + 41);
  sub_100014318((uint64_t)v75, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v62);
  sub_100014318((uint64_t)v75, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  char v37 = v65;
  uint64_t v36 = v66;
  uint64_t v38 = v67;
  uint64_t v58 = v34;
  if (LOBYTE(v62[0]))
  {
    if (LOBYTE(v62[0]) == 1)
    {
      uint64_t v39 = type metadata accessor for ClusterMetrics();
      uint64_t v40 = &off_100031A98;
      uint64_t v70 = v39;
      long long v71 = &off_100031A98;
      v69[0] = v36;
    }
    else
    {
      uint64_t v39 = type metadata accessor for WidgetMetrics();
      uint64_t v40 = &off_100031A08;
      uint64_t v70 = v39;
      long long v71 = &off_100031A08;
      v69[0] = v38;
    }
  }
  else
  {
    uint64_t v39 = type metadata accessor for ConsoleMetrics();
    uint64_t v40 = &off_100031B28;
    uint64_t v70 = v39;
    long long v71 = &off_100031B28;
    v69[0] = v37;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v69, v39);
  double v41 = ((double (__cdecl *)())v40[14])();
  sub_100010578(a1, (uint64_t)v62);
  uint64_t v43 = v62[0];
  uint64_t v42 = v62[1];
  char v44 = v63;
  uint64_t v45 = v64;
  uint64_t v46 = v66;
  char v47 = v67;
  long long v56 = v65;
  uint64_t v57 = v68;
  sub_10000D064((uint64_t)v69);
  uint64_t v48 = v59;
  sub_100014934(v61, v59, &qword_100036FB0);
  uint64_t v49 = v60;
  *char v60 = 0;
  *((unsigned char *)v49 + 8) = 1;
  uint64_t v50 = sub_100004E64(&qword_100036FD8);
  sub_100014934(v48, (uint64_t)v49 + *(int *)(v50 + 48), &qword_100036FB0);
  long long v51 = (double *)((char *)v49 + *(int *)(v50 + 64));
  uint64_t v52 = v57;
  *(void *)long long v51 = v58;
  v51[1] = v41;
  *((unsigned char *)v51 + 16) = 0;
  *((void *)v51 + 3) = v43;
  *((void *)v51 + 4) = v42;
  *((unsigned char *)v51 + 40) = v44;
  uint64_t v53 = (uint64_t)v56;
  *((void *)v51 + 6) = v45;
  *((void *)v51 + 7) = v53;
  *((void *)v51 + 8) = v46;
  *((unsigned char *)v51 + 72) = v47;
  *((void *)v51 + 10) = v52;
  sub_100014470(v43, v42, v44);
  swift_bridgeObjectRetain();
  sub_100014470(v53, v46, v47);
  swift_bridgeObjectRetain();
  sub_10000CF9C(v61, &qword_100036FB0);
  sub_100014554(v43, v42, v44);
  swift_bridgeObjectRelease();
  sub_100014554(v53, v46, v47);
  swift_bridgeObjectRelease();
  return sub_10000CF9C(v48, &qword_100036FB0);
}

uint64_t sub_100010578@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v58 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(v58 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_title + 8);
  *(void *)&v72[0] = *(void *)(v58 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_title);
  *((void *)&v72[0] + 1) = v3;
  sub_100014744();
  swift_bridgeObjectRetain();
  uint64_t v4 = Text.init<A>(_:)();
  uint64_t v6 = v5;
  char v63 = v7;
  long long v8 = *(_OWORD *)(a1 + 16);
  v72[0] = *(_OWORD *)a1;
  v72[1] = v8;
  v73[0] = *(_OWORD *)(a1 + 32);
  *(_OWORD *)((char *)v73 + 9) = *(_OWORD *)(a1 + 41);
  sub_100014318((uint64_t)v72, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v67);
  sub_100014318((uint64_t)v72, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  uint64_t v9 = v69;
  uint64_t v10 = v70;
  uint64_t v11 = v71;
  if (LOBYTE(v67[0]))
  {
    if (LOBYTE(v67[0]) == 1)
    {
      uint64_t v12 = type metadata accessor for ClusterMetrics();
      uint64_t v13 = &off_100031A98;
      uint64_t v68 = v12;
      uint64_t v69 = &off_100031A98;
      v67[0] = v10;
    }
    else
    {
      uint64_t v12 = type metadata accessor for WidgetMetrics();
      uint64_t v13 = &off_100031A08;
      uint64_t v68 = v12;
      uint64_t v69 = &off_100031A08;
      v67[0] = v11;
    }
  }
  else
  {
    uint64_t v12 = type metadata accessor for ConsoleMetrics();
    uint64_t v13 = &off_100031B28;
    uint64_t v68 = v12;
    uint64_t v69 = &off_100031B28;
    v67[0] = v9;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v67, v12);
  ((void (__cdecl *)())v13[10])();
  char v14 = v63 & 1;
  uint64_t v15 = Text.font(_:)();
  uint64_t v17 = v16;
  char v64 = v18;
  sub_100014554(v4, v6, v14);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000D064((uint64_t)v67);
  sub_100014318((uint64_t)v72, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v67);
  sub_100014318((uint64_t)v72, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  uint64_t v20 = v69;
  uint64_t v19 = v70;
  uint64_t v21 = v71;
  if (LOBYTE(v67[0]))
  {
    if (LOBYTE(v67[0]) == 1)
    {
      uint64_t v22 = type metadata accessor for ClusterMetrics();
      uint64_t v23 = &off_100031A98;
      uint64_t v68 = v22;
      uint64_t v69 = &off_100031A98;
      v67[0] = v19;
    }
    else
    {
      uint64_t v22 = type metadata accessor for WidgetMetrics();
      uint64_t v23 = &off_100031A08;
      uint64_t v68 = v22;
      uint64_t v69 = &off_100031A08;
      v67[0] = v21;
    }
  }
  else
  {
    uint64_t v22 = type metadata accessor for ConsoleMetrics();
    uint64_t v23 = &off_100031B28;
    uint64_t v68 = v22;
    uint64_t v69 = &off_100031B28;
    v67[0] = v20;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v67, v22);
  ((void (__cdecl *)())v23[11])();
  char v24 = v64 & 1;
  uint64_t v25 = Text.foregroundColor(_:)();
  uint64_t v61 = v26;
  uint64_t v62 = v25;
  char v57 = v27;
  uint64_t v65 = v28;
  sub_100014554(v15, v17, v24);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000D064((uint64_t)v67);
  uint64_t v29 = *(void *)(v58 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle + 8);
  v67[0] = *(void *)(v58 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle);
  v67[1] = v29;
  swift_bridgeObjectRetain();
  uint64_t v30 = Text.init<A>(_:)();
  uint64_t v32 = v31;
  char v59 = v33;
  sub_100014318((uint64_t)v72, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v67);
  sub_100014318((uint64_t)v72, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  uint64_t v34 = v69;
  uint64_t v35 = v70;
  uint64_t v36 = v71;
  if (LOBYTE(v67[0]))
  {
    if (LOBYTE(v67[0]) == 1)
    {
      uint64_t v37 = type metadata accessor for ClusterMetrics();
      uint64_t v38 = &off_100031A98;
      uint64_t v68 = v37;
      uint64_t v69 = &off_100031A98;
      v67[0] = v35;
    }
    else
    {
      uint64_t v37 = type metadata accessor for WidgetMetrics();
      uint64_t v38 = &off_100031A08;
      uint64_t v68 = v37;
      uint64_t v69 = &off_100031A08;
      v67[0] = v36;
    }
  }
  else
  {
    uint64_t v37 = type metadata accessor for ConsoleMetrics();
    uint64_t v38 = &off_100031B28;
    uint64_t v68 = v37;
    uint64_t v69 = &off_100031B28;
    v67[0] = v34;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v67, v37);
  ((void (__cdecl *)())v38[12])();
  char v39 = v59 & 1;
  uint64_t v40 = Text.font(_:)();
  uint64_t v42 = v41;
  char v60 = v43;
  sub_100014554(v30, v32, v39);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000D064((uint64_t)v67);
  sub_100014318((uint64_t)v72, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v67);
  sub_100014318((uint64_t)v72, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  char v44 = v69;
  uint64_t v45 = v70;
  uint64_t v46 = v71;
  if (LOBYTE(v67[0]))
  {
    if (LOBYTE(v67[0]) == 1)
    {
      uint64_t v47 = type metadata accessor for ClusterMetrics();
      uint64_t v48 = &off_100031A98;
      uint64_t v68 = v47;
      uint64_t v69 = &off_100031A98;
      v67[0] = v45;
    }
    else
    {
      uint64_t v47 = type metadata accessor for WidgetMetrics();
      uint64_t v48 = &off_100031A08;
      uint64_t v68 = v47;
      uint64_t v69 = &off_100031A08;
      v67[0] = v46;
    }
  }
  else
  {
    uint64_t v47 = type metadata accessor for ConsoleMetrics();
    uint64_t v48 = &off_100031B28;
    uint64_t v68 = v47;
    uint64_t v69 = &off_100031B28;
    v67[0] = v44;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v67, v47);
  ((void (__cdecl *)())v48[13])();
  uint64_t v49 = Text.foregroundColor(_:)();
  uint64_t v51 = v50;
  uint64_t v53 = v52;
  char v55 = v54 & 1;
  sub_100014554(v40, v42, v60 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000D064((uint64_t)v67);
  LOBYTE(v67[0]) = v57 & 1;
  *(void *)a2 = v62;
  *(void *)(a2 + 8) = v61;
  *(unsigned char *)(a2 + 16) = v57 & 1;
  *(void *)(a2 + 24) = v65;
  *(void *)(a2 + 32) = v49;
  *(void *)(a2 + 40) = v51;
  *(unsigned char *)(a2 + 48) = v55;
  *(void *)(a2 + 56) = v53;
  sub_100014470(v62, v61, v57 & 1);
  swift_bridgeObjectRetain();
  sub_100014470(v49, v51, v55);
  swift_bridgeObjectRetain();
  sub_100014554(v49, v51, v55);
  swift_bridgeObjectRelease();
  sub_100014554(v62, v61, v67[0]);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100010CA0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v57 = a2;
  uint64_t v3 = type metadata accessor for Divider();
  uint64_t v53 = *(void *)(v3 - 8);
  uint64_t v54 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004E64(&qword_100036FA0);
  __chkstk_darwin(v6);
  long long v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100004E64(&qword_100036FA8);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v56 = (uint64_t)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v55 = (uint64_t)&v51 - v13;
  uint64_t v14 = sub_100004E64(&qword_100036FB0);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v58 = (uint64_t)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  char v18 = (char *)&v51 - v17;
  if (*(unsigned char *)(*(void *)(a1 + 72) + OBJC_IVAR____TtC4Trip21CardCellConfiguration_dataType) == 1)
  {
    uint64_t v51 = v9;
    uint64_t v52 = v10;
    Divider.init()();
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    uint64_t v20 = v53;
    uint64_t v19 = v54;
    (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v8, v5, v54);
    uint64_t v21 = &v8[*(int *)(v6 + 36)];
    long long v22 = *(_OWORD *)&v77[47];
    *(_OWORD *)uint64_t v21 = *(_OWORD *)&v77[31];
    *((_OWORD *)v21 + 1) = v22;
    *((_OWORD *)v21 + 2) = *(_OWORD *)&v77[63];
    (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v19);
    long long v23 = *(_OWORD *)(a1 + 16);
    v78[0] = *(_OWORD *)a1;
    v78[1] = v23;
    v79[0] = *(_OWORD *)(a1 + 32);
    *(_OWORD *)((char *)v79 + 9) = *(_OWORD *)(a1 + 41);
    sub_100014318((uint64_t)v78, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
    sub_1000225D4((uint64_t)&v65);
    sub_100014318((uint64_t)v78, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
    uint64_t v53 = *(void *)v67;
    uint64_t v54 = v66;
    uint64_t v24 = *(void *)&v67[16];
    uint64_t v25 = *(void *)&v67[24];
    uint64_t v26 = *(void *)&v67[32];
    uint64_t v27 = a1;
    uint64_t v28 = (uint64_t)v8;
    if ((_BYTE)v65)
    {
      if (v65 == 1)
      {
        uint64_t v29 = type metadata accessor for ClusterMetrics();
        uint64_t v30 = &off_100031A98;
        *(void *)&v67[16] = &off_100031A98;
        *(void *)&v67[8] = v29;
        uint64_t v65 = v25;
      }
      else
      {
        uint64_t v29 = type metadata accessor for WidgetMetrics();
        uint64_t v30 = &off_100031A08;
        *(void *)&v67[16] = &off_100031A08;
        *(void *)&v67[8] = v29;
        uint64_t v65 = v26;
      }
    }
    else
    {
      uint64_t v29 = type metadata accessor for ConsoleMetrics();
      uint64_t v30 = &off_100031B28;
      *(void *)&v67[16] = &off_100031B28;
      *(void *)&v67[8] = v29;
      uint64_t v65 = v24;
    }
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    sub_10001435C(&v65, v29);
    uint64_t v31 = ((uint64_t (__cdecl *)())v30[13])();
    char v32 = static Edge.Set.all.getter();
    uint64_t v33 = v28;
    uint64_t v34 = v56;
    sub_100014934(v28, v56, &qword_100036FA0);
    uint64_t v35 = v51;
    uint64_t v36 = v34 + *(int *)(v51 + 36);
    *(void *)uint64_t v36 = v31;
    *(unsigned char *)(v36 + 8) = v32;
    sub_10000CF9C(v33, &qword_100036FA0);
    sub_10000D064((uint64_t)&v65);
    uint64_t v37 = v55;
    sub_100014564(v34, v55, &qword_100036FA8);
    sub_100014564(v37, (uint64_t)v18, &qword_100036FA8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v52 + 56))(v18, 0, 1, v35);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))((char *)&v51 - v17, 1, 1, v9);
    uint64_t v27 = a1;
  }
  uint64_t v38 = static VerticalAlignment.center.getter();
  sub_100011388(v27, (uint64_t)v59);
  *(_OWORD *)((char *)&v61[10] + 7) = v59[10];
  *(_OWORD *)((char *)&v61[11] + 7) = v59[11];
  *(_OWORD *)((char *)&v61[12] + 7) = v59[12];
  *(_OWORD *)((char *)&v61[6] + 7) = v59[6];
  *(_OWORD *)((char *)&v61[7] + 7) = v59[7];
  *(_OWORD *)((char *)&v61[8] + 7) = v59[8];
  *(_OWORD *)((char *)&v61[9] + 7) = v59[9];
  *(_OWORD *)((char *)&v61[2] + 7) = v59[2];
  *(_OWORD *)((char *)&v61[3] + 7) = v59[3];
  *(_OWORD *)((char *)&v61[4] + 7) = v59[4];
  *(_OWORD *)((char *)&v61[5] + 7) = v59[5];
  *(_OWORD *)((char *)v61 + 7) = v59[0];
  char v62 = 1;
  *(void *)((char *)&v61[13] + 7) = v60;
  *(_OWORD *)((char *)&v61[1] + 7) = v59[1];
  uint64_t v39 = v58;
  sub_100014934((uint64_t)v18, v58, &qword_100036FB0);
  uint64_t v40 = v57;
  *char v57 = 0;
  *((unsigned char *)v40 + 8) = 1;
  uint64_t v41 = sub_100004E64(&qword_100036FE8);
  sub_100014934(v39, (uint64_t)v40 + *(int *)(v41 + 48), &qword_100036FB0);
  uint64_t v42 = (_OWORD *)((char *)v40 + *(int *)(v41 + 64));
  long long v63 = (unint64_t)v38;
  LOBYTE(v64[0]) = 1;
  *(_OWORD *)((char *)&v64[10] + 1) = v61[10];
  *(_OWORD *)((char *)&v64[11] + 1) = v61[11];
  *(_OWORD *)((char *)&v64[12] + 1) = v61[12];
  v64[13] = *(_OWORD *)((char *)&v61[12] + 15);
  *(_OWORD *)((char *)&v64[6] + 1) = v61[6];
  *(_OWORD *)((char *)&v64[7] + 1) = v61[7];
  *(_OWORD *)((char *)&v64[8] + 1) = v61[8];
  *(_OWORD *)((char *)&v64[9] + 1) = v61[9];
  *(_OWORD *)((char *)&v64[2] + 1) = v61[2];
  *(_OWORD *)((char *)&v64[3] + 1) = v61[3];
  *(_OWORD *)((char *)&v64[4] + 1) = v61[4];
  *(_OWORD *)((char *)&v64[5] + 1) = v61[5];
  *(_OWORD *)((char *)v64 + 1) = v61[0];
  *(_OWORD *)((char *)&v64[1] + 1) = v61[1];
  long long v43 = v64[12];
  v42[12] = v64[11];
  v42[13] = v43;
  v42[14] = v64[13];
  long long v44 = v64[8];
  v42[8] = v64[7];
  v42[9] = v44;
  long long v45 = v64[10];
  v42[10] = v64[9];
  v42[11] = v45;
  long long v46 = v64[4];
  v42[4] = v64[3];
  v42[5] = v46;
  long long v47 = v64[6];
  v42[6] = v64[5];
  unsigned char v42[7] = v47;
  long long v48 = v64[0];
  *uint64_t v42 = v63;
  v42[1] = v48;
  long long v49 = v64[2];
  v42[2] = v64[1];
  v42[3] = v49;
  sub_100014798((uint64_t)&v63);
  sub_10000CF9C((uint64_t)v18, &qword_100036FB0);
  long long v75 = v61[10];
  long long v76 = v61[11];
  *(_OWORD *)long long v77 = v61[12];
  *(_OWORD *)&v77[15] = *(_OWORD *)((char *)&v61[12] + 15);
  long long v71 = v61[6];
  long long v72 = v61[7];
  long long v73 = v61[8];
  long long v74 = v61[9];
  *(_OWORD *)&v67[33] = v61[2];
  long long v68 = v61[3];
  long long v69 = v61[4];
  long long v70 = v61[5];
  *(_OWORD *)&v67[1] = v61[0];
  uint64_t v65 = v38;
  uint64_t v66 = 0;
  v67[0] = 1;
  *(_OWORD *)&v67[17] = v61[1];
  sub_100014864((uint64_t)&v65);
  return sub_10000CF9C(v39, &qword_100036FB0);
}

uint64_t sub_100011388@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v92 = a2;
  uint64_t v3 = sub_100004E64(&qword_100036FC0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = *(void *)(a1 + 72);
  swift_bridgeObjectRetain();
  uint64_t v100 = Image.init(automakerSymbolName:)();
  long long v6 = *(_OWORD *)(a1 + 16);
  v146[0] = *(_OWORD *)a1;
  v146[1] = v6;
  v147[0] = *(_OWORD *)(a1 + 32);
  *(_OWORD *)((char *)v147 + 9) = *(_OWORD *)(a1 + 41);
  sub_100014318((uint64_t)v146, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v119);
  sub_100014318((uint64_t)v146, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v7 = v123;
  uint64_t v8 = v124;
  if ((_BYTE)v119)
  {
    if (v119 == 1)
    {
      uint64_t v9 = type metadata accessor for ClusterMetrics();
      uint64_t v10 = &off_100031A98;
      uint64_t v122 = v9;
      *(void *)&long long v123 = &off_100031A98;
      uint64_t v119 = *((void *)&v7 + 1);
    }
    else
    {
      uint64_t v9 = type metadata accessor for WidgetMetrics();
      uint64_t v10 = &off_100031A08;
      uint64_t v122 = v9;
      *(void *)&long long v123 = &off_100031A08;
      uint64_t v119 = v8;
    }
  }
  else
  {
    uint64_t v9 = type metadata accessor for ConsoleMetrics();
    uint64_t v10 = &off_100031B28;
    uint64_t v122 = v9;
    *(void *)&long long v123 = &off_100031B28;
    uint64_t v119 = v7;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(&v119, v9);
  ((void (__cdecl *)())v10[7])();
  uint64_t v11 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v5, 1, 1, v11);
  uint64_t v99 = static Font.system(size:weight:design:)();
  sub_10000CF9C((uint64_t)v5, &qword_100036FC0);
  sub_10000D064((uint64_t)&v119);
  uint64_t KeyPath = swift_getKeyPath();
  int v97 = static Edge.Set.trailing.getter();
  sub_100014318((uint64_t)v146, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v119);
  sub_100014318((uint64_t)v146, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v12 = v123;
  uint64_t v13 = v124;
  if ((_BYTE)v119)
  {
    if (v119 == 1)
    {
      uint64_t v14 = type metadata accessor for ClusterMetrics();
      uint64_t v15 = &off_100031A98;
      uint64_t v122 = v14;
      *(void *)&long long v123 = &off_100031A98;
      uint64_t v119 = *((void *)&v12 + 1);
    }
    else
    {
      uint64_t v14 = type metadata accessor for WidgetMetrics();
      uint64_t v15 = &off_100031A08;
      uint64_t v122 = v14;
      *(void *)&long long v123 = &off_100031A08;
      uint64_t v119 = v13;
    }
  }
  else
  {
    uint64_t v14 = type metadata accessor for ConsoleMetrics();
    uint64_t v15 = &off_100031B28;
    uint64_t v122 = v14;
    *(void *)&long long v123 = &off_100031B28;
    uint64_t v119 = v12;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(&v119, v14);
  uint64_t v96 = ((uint64_t (__cdecl *)())v15[6])();
  uint64_t v95 = swift_getKeyPath();
  sub_10000D064((uint64_t)&v119);
  sub_100014318((uint64_t)v146, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v119);
  sub_100014318((uint64_t)v146, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v16 = v123;
  uint64_t v17 = v124;
  if ((_BYTE)v119)
  {
    if (v119 == 1)
    {
      uint64_t v18 = type metadata accessor for ClusterMetrics();
      uint64_t v19 = &off_100031A98;
      uint64_t v141 = v18;
      Swift::String v142 = &off_100031A98;
      v140[0] = *((void *)&v16 + 1);
    }
    else
    {
      uint64_t v18 = type metadata accessor for WidgetMetrics();
      uint64_t v19 = &off_100031A08;
      uint64_t v141 = v18;
      Swift::String v142 = &off_100031A08;
      v140[0] = v17;
    }
  }
  else
  {
    uint64_t v18 = type metadata accessor for ConsoleMetrics();
    uint64_t v19 = &off_100031B28;
    uint64_t v141 = v18;
    Swift::String v142 = &off_100031B28;
    v140[0] = v16;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v140, v18);
  ((void (__cdecl *)())v19[5])();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  unsigned __int8 v144 = 1;
  sub_10000D064((uint64_t)v140);
  v139[0] = *(_DWORD *)v145;
  *(_DWORD *)((char *)v139 + 3) = *(_DWORD *)&v145[3];
  int v94 = v144;
  v138[0] = *(_DWORD *)v143;
  *(_DWORD *)((char *)v138 + 3) = *(_DWORD *)&v143[3];
  uint64_t v20 = *(void *)(v93 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle + 8);
  uint64_t v119 = *(void *)(v93 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle);
  uint64_t v120 = v20;
  unint64_t v21 = sub_100014744();
  swift_bridgeObjectRetain();
  unint64_t v87 = v21;
  uint64_t v91 = Text.init<A>(_:)();
  uint64_t v23 = v22;
  LODWORD(v90) = v24;
  sub_100014318((uint64_t)v146, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v119);
  sub_100014318((uint64_t)v146, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v25 = v123;
  uint64_t v26 = v124;
  if ((_BYTE)v119)
  {
    if (v119 == 1)
    {
      uint64_t v27 = type metadata accessor for ClusterMetrics();
      uint64_t v28 = &off_100031A98;
      uint64_t v122 = v27;
      *(void *)&long long v123 = &off_100031A98;
      uint64_t v119 = *((void *)&v25 + 1);
    }
    else
    {
      uint64_t v27 = type metadata accessor for WidgetMetrics();
      uint64_t v28 = &off_100031A08;
      uint64_t v122 = v27;
      *(void *)&long long v123 = &off_100031A08;
      uint64_t v119 = v26;
    }
  }
  else
  {
    uint64_t v27 = type metadata accessor for ConsoleMetrics();
    uint64_t v28 = &off_100031B28;
    uint64_t v122 = v27;
    *(void *)&long long v123 = &off_100031B28;
    uint64_t v119 = v25;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(&v119, v27);
  ((void (__cdecl *)())v28[10])();
  char v29 = v90 & 1;
  uint64_t v30 = v91;
  uint64_t v86 = Text.font(_:)();
  uint64_t v32 = v31;
  LODWORD(v90) = v33;
  sub_100014554(v30, v23, v29);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000D064((uint64_t)&v119);
  sub_100014318((uint64_t)v146, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v119);
  sub_100014318((uint64_t)v146, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v34 = v123;
  uint64_t v35 = v124;
  if ((_BYTE)v119)
  {
    if (v119 == 1)
    {
      uint64_t v36 = type metadata accessor for ClusterMetrics();
      uint64_t v37 = &off_100031A98;
      uint64_t v122 = v36;
      *(void *)&long long v123 = &off_100031A98;
      uint64_t v119 = *((void *)&v34 + 1);
    }
    else
    {
      uint64_t v36 = type metadata accessor for WidgetMetrics();
      uint64_t v37 = &off_100031A08;
      uint64_t v122 = v36;
      *(void *)&long long v123 = &off_100031A08;
      uint64_t v119 = v35;
    }
  }
  else
  {
    uint64_t v36 = type metadata accessor for ConsoleMetrics();
    uint64_t v37 = &off_100031B28;
    uint64_t v122 = v36;
    *(void *)&long long v123 = &off_100031B28;
    uint64_t v119 = v34;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(&v119, v36);
  ((void (__cdecl *)())v37[11])();
  char v38 = v90 & 1;
  uint64_t v39 = v86;
  uint64_t v40 = Text.foregroundColor(_:)();
  uint64_t v89 = v41;
  uint64_t v90 = v40;
  LODWORD(v88) = v42;
  uint64_t v91 = v43;
  sub_100014554(v39, v32, v38);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000D064((uint64_t)&v119);
  uint64_t v44 = *(void *)(v93 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_title + 8);
  uint64_t v119 = *(void *)(v93 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_title);
  uint64_t v120 = v44;
  swift_bridgeObjectRetain();
  uint64_t v45 = Text.init<A>(_:)();
  uint64_t v47 = v46;
  LODWORD(v93) = v48;
  unint64_t v87 = v49;
  sub_100014318((uint64_t)v146, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v119);
  sub_100014318((uint64_t)v146, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v50 = v123;
  uint64_t v51 = v124;
  if ((_BYTE)v119)
  {
    if (v119 == 1)
    {
      uint64_t v52 = type metadata accessor for ClusterMetrics();
      uint64_t v53 = &off_100031A98;
      uint64_t v122 = v52;
      *(void *)&long long v123 = &off_100031A98;
      uint64_t v119 = *((void *)&v50 + 1);
    }
    else
    {
      uint64_t v52 = type metadata accessor for WidgetMetrics();
      uint64_t v53 = &off_100031A08;
      uint64_t v122 = v52;
      *(void *)&long long v123 = &off_100031A08;
      uint64_t v119 = v51;
    }
  }
  else
  {
    uint64_t v52 = type metadata accessor for ConsoleMetrics();
    uint64_t v53 = &off_100031B28;
    uint64_t v122 = v52;
    *(void *)&long long v123 = &off_100031B28;
    uint64_t v119 = v50;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(&v119, v52);
  ((void (__cdecl *)())v53[12])();
  char v54 = v93 & 1;
  uint64_t v55 = Text.font(_:)();
  uint64_t v86 = v56;
  int v85 = v57;
  uint64_t v93 = v58;
  sub_100014554(v45, v47, v54);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000D064((uint64_t)&v119);
  sub_100014318((uint64_t)v146, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v119);
  sub_100014318((uint64_t)v146, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v59 = v123;
  uint64_t v60 = v124;
  if ((_BYTE)v119)
  {
    if (v119 == 1)
    {
      uint64_t v61 = type metadata accessor for ClusterMetrics();
      char v62 = &off_100031A98;
      v134 = &off_100031A98;
      uint64_t v133 = v61;
      v132[0] = *((void *)&v59 + 1);
    }
    else
    {
      uint64_t v61 = type metadata accessor for WidgetMetrics();
      char v62 = &off_100031A08;
      v134 = &off_100031A08;
      uint64_t v133 = v61;
      v132[0] = v60;
    }
  }
  else
  {
    uint64_t v61 = type metadata accessor for ConsoleMetrics();
    char v62 = &off_100031B28;
    v134 = &off_100031B28;
    uint64_t v133 = v61;
    v132[0] = v59;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  char v63 = v85 & 1;
  char v64 = v88 & 1;
  sub_10001435C(v132, v61);
  ((void (__cdecl *)())v62[13])();
  uint64_t v65 = v55;
  uint64_t v66 = v86;
  uint64_t v67 = Text.foregroundColor(_:)();
  uint64_t v69 = v68;
  uint64_t v88 = v70;
  char v72 = v71 & 1;
  sub_100014554(v65, v66, v63);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000D064((uint64_t)v132);
  v106[0] = v139[0];
  *(_DWORD *)((char *)v106 + 3) = *(_DWORD *)((char *)v139 + 3);
  v105[0] = v138[0];
  *(_DWORD *)((char *)v105 + 3) = *(_DWORD *)((char *)v138 + 3);
  long long v102 = v135;
  long long v103 = v136;
  long long v104 = v137;
  char v101 = v64;
  *(void *)&long long v107 = v100;
  *((void *)&v107 + 1) = KeyPath;
  *(void *)&long long v108 = v99;
  BYTE8(v108) = v97;
  HIDWORD(v108) = *(_DWORD *)((char *)v139 + 3);
  *(_DWORD *)((char *)&v108 + 9) = v139[0];
  long long v110 = 0u;
  long long v109 = 0u;
  LOBYTE(v111) = v94;
  DWORD1(v111) = *(_DWORD *)((char *)v138 + 3);
  *(_DWORD *)((char *)&v111 + 1) = v138[0];
  *((void *)&v111 + 1) = v95;
  *(void *)unsigned int v112 = v96;
  *(_OWORD *)&v112[40] = v137;
  *(_OWORD *)&v112[24] = v136;
  *(_OWORD *)&v112[8] = v135;
  long long v73 = v107;
  long long v74 = v108;
  uint64_t v75 = v92;
  *(_OWORD *)(v92 + 32) = 0u;
  *(_OWORD *)(v75 + 48) = 0u;
  *(_OWORD *)uint64_t v75 = v73;
  *(_OWORD *)(v75 + 16) = v74;
  long long v76 = v111;
  long long v77 = *(_OWORD *)v112;
  long long v78 = *(_OWORD *)&v112[32];
  uint64_t v79 = *(void *)&v112[48];
  *(_OWORD *)(v75 + 96) = *(_OWORD *)&v112[16];
  *(_OWORD *)(v75 + 112) = v78;
  *(_OWORD *)(v75 + 64) = v76;
  *(_OWORD *)(v75 + 80) = v77;
  char v118 = v64;
  char v116 = 1;
  char v114 = v72;
  *(_DWORD *)(v75 + 153) = *(_DWORD *)v117;
  *(_DWORD *)(v75 + 156) = *(_DWORD *)&v117[3];
  char v80 = v116;
  *(_DWORD *)(v75 + 177) = *(_DWORD *)v115;
  *(_DWORD *)(v75 + 180) = *(_DWORD *)&v115[3];
  *(_DWORD *)(v75 + 201) = *(_DWORD *)v113;
  *(_DWORD *)(v75 + 204) = *(_DWORD *)&v113[3];
  uint64_t v82 = v89;
  uint64_t v81 = v90;
  *(void *)(v75 + 128) = v79;
  *(void *)(v75 + 136) = v81;
  *(void *)(v75 + 144) = v82;
  *(unsigned char *)(v75 + 152) = v64;
  *(void *)(v75 + 160) = v91;
  *(void *)(v75 + 168) = 0;
  *(unsigned char *)(v75 + 176) = v80;
  *(void *)(v75 + 184) = v67;
  *(void *)(v75 + 192) = v69;
  *(unsigned char *)(v75 + 200) = v72;
  *(void *)(v75 + 208) = v88;
  sub_100014678((uint64_t)&v107);
  sub_100014470(v81, v82, v64);
  swift_bridgeObjectRetain();
  sub_100014470(v67, v69, v72);
  swift_bridgeObjectRetain();
  sub_100014554(v67, v69, v72);
  swift_bridgeObjectRelease();
  sub_100014554(v81, v82, v101);
  swift_bridgeObjectRelease();
  uint64_t v119 = v100;
  uint64_t v120 = KeyPath;
  uint64_t v121 = v99;
  LOBYTE(v122) = v97;
  *(_DWORD *)((char *)&v122 + 1) = v106[0];
  HIDWORD(v122) = *(_DWORD *)((char *)v106 + 3);
  long long v123 = 0u;
  long long v124 = 0u;
  char v125 = v94;
  *(_DWORD *)Swift::String v126 = v105[0];
  *(_DWORD *)&v126[3] = *(_DWORD *)((char *)v105 + 3);
  uint64_t v127 = v95;
  uint64_t v128 = v96;
  long long v131 = v104;
  long long v130 = v103;
  long long v129 = v102;
  return sub_1000146DC((uint64_t)&v119);
}

uint64_t sub_1000121A0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v54 = a2;
  uint64_t v3 = type metadata accessor for Divider();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  long long v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004E64(&qword_100036FA0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100004E64(&qword_100036FA8);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  long long v16 = (char *)&v49 - v15;
  uint64_t v17 = sub_100004E64(&qword_100036FB0);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v56 = (uint64_t)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  BOOL v21 = *(unsigned char *)(*(void *)(a1 + 72) + OBJC_IVAR____TtC4Trip21CardCellConfiguration_dataType) == 1;
  uint64_t v55 = (char *)&v49 - v20;
  if (v21)
  {
    uint64_t v53 = v16;
    Divider.init()();
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v6, v3);
    uint64_t v22 = &v9[*(int *)(v7 + 36)];
    long long v23 = v68;
    *(_OWORD *)uint64_t v22 = v67;
    *((_OWORD *)v22 + 1) = v23;
    *((_OWORD *)v22 + 2) = v69;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    long long v24 = *(_OWORD *)(a1 + 16);
    v70[0] = *(_OWORD *)a1;
    v70[1] = v24;
    v71[0] = *(_OWORD *)(a1 + 32);
    *(_OWORD *)((char *)v71 + 9) = *(_OWORD *)(a1 + 41);
    sub_100014318((uint64_t)v70, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
    sub_1000225D4((uint64_t)&v57);
    sub_100014318((uint64_t)v70, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
    uint64_t v52 = (_UNKNOWN **)v58;
    uint64_t v51 = v59;
    uint64_t v26 = v61;
    uint64_t v25 = v62;
    uint64_t v27 = v63;
    if ((_BYTE)v57)
    {
      if (v57 == 1)
      {
        uint64_t v28 = type metadata accessor for ClusterMetrics();
        char v29 = &off_100031A98;
        uint64_t v61 = &off_100031A98;
        uint64_t v60 = v28;
        uint64_t v57 = v25;
      }
      else
      {
        uint64_t v28 = type metadata accessor for WidgetMetrics();
        char v29 = &off_100031A08;
        uint64_t v61 = &off_100031A08;
        uint64_t v60 = v28;
        uint64_t v57 = v27;
      }
    }
    else
    {
      uint64_t v28 = type metadata accessor for ConsoleMetrics();
      char v29 = &off_100031B28;
      uint64_t v61 = &off_100031B28;
      uint64_t v60 = v28;
      uint64_t v57 = (uint64_t)v26;
    }
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    sub_10001435C(&v57, v28);
    uint64_t v31 = ((uint64_t (__cdecl *)())v29[13])();
    char v32 = static Edge.Set.all.getter();
    sub_100014934((uint64_t)v9, (uint64_t)v14, &qword_100036FA0);
    int v33 = &v14[*(int *)(v10 + 36)];
    *(void *)int v33 = v31;
    v33[8] = v32;
    sub_10000CF9C((uint64_t)v9, &qword_100036FA0);
    sub_10000D064((uint64_t)&v57);
    uint64_t v34 = (uint64_t)v53;
    sub_100014564((uint64_t)v14, (uint64_t)v53, &qword_100036FA8);
    uint64_t v35 = v34;
    uint64_t v30 = v55;
    sub_100014564(v35, (uint64_t)v55, &qword_100036FA8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v30, 0, 1, v10);
  }
  else
  {
    uint64_t v30 = (char *)&v49 - v20;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))((char *)&v49 - v20, 1, 1, v10);
  }
  uint64_t v53 = (char *)static VerticalAlignment.center.getter();
  sub_10001282C(a1, (uint64_t)&v57);
  uint64_t v36 = v57;
  uint64_t v37 = v58;
  char v38 = v59;
  uint64_t v39 = v60;
  uint64_t v52 = v61;
  LODWORD(v51) = v62;
  uint64_t v40 = v63;
  uint64_t v41 = v64;
  char v42 = v65;
  uint64_t v50 = v66;
  uint64_t v43 = v56;
  sub_100014934((uint64_t)v30, v56, &qword_100036FB0);
  uint64_t v44 = v54;
  *char v54 = 0;
  *((unsigned char *)v44 + 8) = 1;
  uint64_t v45 = sub_100004E64(&qword_100036FF8);
  sub_100014934(v43, (uint64_t)v44 + *(int *)(v45 + 48), &qword_100036FB0);
  uint64_t v46 = (char *)v44 + *(int *)(v45 + 64);
  *(void *)uint64_t v46 = v53;
  *((void *)v46 + 1) = 0;
  v46[16] = 1;
  *((void *)v46 + 3) = v36;
  *((void *)v46 + 4) = v37;
  v46[40] = v38;
  uint64_t v47 = v52;
  *((void *)v46 + 6) = v39;
  *((void *)v46 + 7) = v47;
  v46[64] = v51;
  *((void *)v46 + 9) = v40;
  *((void *)v46 + 10) = v41;
  v46[88] = v42;
  *((void *)v46 + 12) = v50;
  sub_100014470(v36, v37, v38);
  swift_bridgeObjectRetain();
  sub_100014470(v40, v41, v42);
  swift_bridgeObjectRetain();
  sub_10000CF9C((uint64_t)v55, &qword_100036FB0);
  sub_100014554(v36, v37, v38);
  swift_bridgeObjectRelease();
  sub_100014554(v40, v41, v42);
  swift_bridgeObjectRelease();
  return sub_10000CF9C(v56, &qword_100036FB0);
}

uint64_t sub_10001282C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v58 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(v58 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle + 8);
  *(void *)&v72[0] = *(void *)(v58 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle);
  *((void *)&v72[0] + 1) = v3;
  sub_100014744();
  swift_bridgeObjectRetain();
  uint64_t v4 = Text.init<A>(_:)();
  uint64_t v6 = v5;
  char v63 = v7;
  long long v8 = *(_OWORD *)(a1 + 16);
  v72[0] = *(_OWORD *)a1;
  v72[1] = v8;
  v73[0] = *(_OWORD *)(a1 + 32);
  *(_OWORD *)((char *)v73 + 9) = *(_OWORD *)(a1 + 41);
  sub_100014318((uint64_t)v72, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v67);
  sub_100014318((uint64_t)v72, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  uint64_t v9 = v69;
  uint64_t v10 = v70;
  uint64_t v11 = v71;
  if (LOBYTE(v67[0]))
  {
    if (LOBYTE(v67[0]) == 1)
    {
      uint64_t v12 = type metadata accessor for ClusterMetrics();
      uint64_t v13 = &off_100031A98;
      uint64_t v68 = v12;
      long long v69 = &off_100031A98;
      v67[0] = v10;
    }
    else
    {
      uint64_t v12 = type metadata accessor for WidgetMetrics();
      uint64_t v13 = &off_100031A08;
      uint64_t v68 = v12;
      long long v69 = &off_100031A08;
      v67[0] = v11;
    }
  }
  else
  {
    uint64_t v12 = type metadata accessor for ConsoleMetrics();
    uint64_t v13 = &off_100031B28;
    uint64_t v68 = v12;
    long long v69 = &off_100031B28;
    v67[0] = v9;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v67, v12);
  ((void (__cdecl *)())v13[10])();
  char v14 = v63 & 1;
  uint64_t v15 = Text.font(_:)();
  uint64_t v17 = v16;
  char v64 = v18;
  sub_100014554(v4, v6, v14);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000D064((uint64_t)v67);
  sub_100014318((uint64_t)v72, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v67);
  sub_100014318((uint64_t)v72, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  uint64_t v19 = v69;
  uint64_t v20 = v70;
  uint64_t v21 = v71;
  if (LOBYTE(v67[0]))
  {
    if (LOBYTE(v67[0]) == 1)
    {
      uint64_t v22 = type metadata accessor for ClusterMetrics();
      long long v23 = &off_100031A98;
      uint64_t v68 = v22;
      long long v69 = &off_100031A98;
      v67[0] = v20;
    }
    else
    {
      uint64_t v22 = type metadata accessor for WidgetMetrics();
      long long v23 = &off_100031A08;
      uint64_t v68 = v22;
      long long v69 = &off_100031A08;
      v67[0] = v21;
    }
  }
  else
  {
    uint64_t v22 = type metadata accessor for ConsoleMetrics();
    long long v23 = &off_100031B28;
    uint64_t v68 = v22;
    long long v69 = &off_100031B28;
    v67[0] = v19;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v67, v22);
  ((void (__cdecl *)())v23[11])();
  char v24 = v64 & 1;
  uint64_t v25 = Text.foregroundColor(_:)();
  uint64_t v61 = v26;
  uint64_t v62 = v25;
  char v57 = v27;
  uint64_t v65 = v28;
  sub_100014554(v15, v17, v24);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000D064((uint64_t)v67);
  uint64_t v29 = *(void *)(v58 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_title + 8);
  v67[0] = *(void *)(v58 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_title);
  v67[1] = v29;
  swift_bridgeObjectRetain();
  uint64_t v30 = Text.init<A>(_:)();
  uint64_t v32 = v31;
  char v59 = v33;
  sub_100014318((uint64_t)v72, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v67);
  sub_100014318((uint64_t)v72, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  uint64_t v34 = v69;
  uint64_t v35 = v70;
  uint64_t v36 = v71;
  if (LOBYTE(v67[0]))
  {
    if (LOBYTE(v67[0]) == 1)
    {
      uint64_t v37 = type metadata accessor for ClusterMetrics();
      char v38 = &off_100031A98;
      uint64_t v68 = v37;
      long long v69 = &off_100031A98;
      v67[0] = v35;
    }
    else
    {
      uint64_t v37 = type metadata accessor for WidgetMetrics();
      char v38 = &off_100031A08;
      uint64_t v68 = v37;
      long long v69 = &off_100031A08;
      v67[0] = v36;
    }
  }
  else
  {
    uint64_t v37 = type metadata accessor for ConsoleMetrics();
    char v38 = &off_100031B28;
    uint64_t v68 = v37;
    long long v69 = &off_100031B28;
    v67[0] = v34;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v67, v37);
  ((void (__cdecl *)())v38[12])();
  char v39 = v59 & 1;
  uint64_t v40 = Text.font(_:)();
  uint64_t v42 = v41;
  char v60 = v43;
  sub_100014554(v30, v32, v39);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000D064((uint64_t)v67);
  sub_100014318((uint64_t)v72, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v67);
  sub_100014318((uint64_t)v72, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  uint64_t v44 = v69;
  uint64_t v45 = v70;
  uint64_t v46 = v71;
  if (LOBYTE(v67[0]))
  {
    if (LOBYTE(v67[0]) == 1)
    {
      uint64_t v47 = type metadata accessor for ClusterMetrics();
      int v48 = &off_100031A98;
      uint64_t v68 = v47;
      long long v69 = &off_100031A98;
      v67[0] = v45;
    }
    else
    {
      uint64_t v47 = type metadata accessor for WidgetMetrics();
      int v48 = &off_100031A08;
      uint64_t v68 = v47;
      long long v69 = &off_100031A08;
      v67[0] = v46;
    }
  }
  else
  {
    uint64_t v47 = type metadata accessor for ConsoleMetrics();
    int v48 = &off_100031B28;
    uint64_t v68 = v47;
    long long v69 = &off_100031B28;
    v67[0] = v44;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v67, v47);
  ((void (__cdecl *)())v48[13])();
  uint64_t v49 = Text.foregroundColor(_:)();
  uint64_t v51 = v50;
  uint64_t v53 = v52;
  char v55 = v54 & 1;
  sub_100014554(v40, v42, v60 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000D064((uint64_t)v67);
  LOBYTE(v67[0]) = v57 & 1;
  *(void *)a2 = v62;
  *(void *)(a2 + 8) = v61;
  *(unsigned char *)(a2 + 16) = v57 & 1;
  *(void *)(a2 + 24) = v65;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = v49;
  *(void *)(a2 + 56) = v51;
  *(unsigned char *)(a2 + 64) = v55;
  *(void *)(a2 + 72) = v53;
  sub_100014470(v62, v61, v57 & 1);
  swift_bridgeObjectRetain();
  sub_100014470(v49, v51, v55);
  swift_bridgeObjectRetain();
  sub_100014554(v49, v51, v55);
  swift_bridgeObjectRelease();
  sub_100014554(v62, v61, v67[0]);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100012F5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v92 = a2;
  uint64_t v3 = sub_100004E64(&qword_100036FC0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v86 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = *(void *)(a1 + 72);
  swift_bridgeObjectRetain();
  uint64_t v100 = Image.init(systemName:)();
  long long v6 = *(_OWORD *)(a1 + 16);
  v144[0] = *(_OWORD *)a1;
  v144[1] = v6;
  v145[0] = *(_OWORD *)(a1 + 32);
  *(_OWORD *)((char *)v145 + 9) = *(_OWORD *)(a1 + 41);
  sub_100014318((uint64_t)v144, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v117);
  sub_100014318((uint64_t)v144, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v7 = v121;
  uint64_t v8 = v122;
  if ((_BYTE)v117)
  {
    if (v117 == 1)
    {
      uint64_t v9 = type metadata accessor for ClusterMetrics();
      uint64_t v10 = &off_100031A98;
      uint64_t v120 = v9;
      *(void *)&long long v121 = &off_100031A98;
      uint64_t v117 = *((void *)&v7 + 1);
    }
    else
    {
      uint64_t v9 = type metadata accessor for WidgetMetrics();
      uint64_t v10 = &off_100031A08;
      uint64_t v120 = v9;
      *(void *)&long long v121 = &off_100031A08;
      uint64_t v117 = v8;
    }
  }
  else
  {
    uint64_t v9 = type metadata accessor for ConsoleMetrics();
    uint64_t v10 = &off_100031B28;
    uint64_t v120 = v9;
    *(void *)&long long v121 = &off_100031B28;
    uint64_t v117 = v7;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(&v117, v9);
  ((void (__cdecl *)())v10[17])();
  uint64_t v11 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v5, 1, 1, v11);
  uint64_t v99 = static Font.system(size:weight:design:)();
  sub_10000CF9C((uint64_t)v5, &qword_100036FC0);
  sub_10000D064((uint64_t)&v117);
  uint64_t KeyPath = swift_getKeyPath();
  int v97 = static Edge.Set.trailing.getter();
  sub_100014318((uint64_t)v144, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v117);
  sub_100014318((uint64_t)v144, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v12 = v121;
  uint64_t v13 = v122;
  if ((_BYTE)v117)
  {
    if (v117 == 1)
    {
      uint64_t v14 = type metadata accessor for ClusterMetrics();
      uint64_t v15 = &off_100031A98;
      uint64_t v120 = v14;
      *(void *)&long long v121 = &off_100031A98;
      uint64_t v117 = *((void *)&v12 + 1);
    }
    else
    {
      uint64_t v14 = type metadata accessor for WidgetMetrics();
      uint64_t v15 = &off_100031A08;
      uint64_t v120 = v14;
      *(void *)&long long v121 = &off_100031A08;
      uint64_t v117 = v13;
    }
  }
  else
  {
    uint64_t v14 = type metadata accessor for ConsoleMetrics();
    uint64_t v15 = &off_100031B28;
    uint64_t v120 = v14;
    *(void *)&long long v121 = &off_100031B28;
    uint64_t v117 = v12;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(&v117, v14);
  uint64_t v96 = ((uint64_t (__cdecl *)())v15[6])();
  uint64_t v95 = swift_getKeyPath();
  sub_10000D064((uint64_t)&v117);
  sub_100014318((uint64_t)v144, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v117);
  sub_100014318((uint64_t)v144, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v16 = v121;
  uint64_t v17 = v122;
  if ((_BYTE)v117)
  {
    if (v117 == 1)
    {
      uint64_t v18 = type metadata accessor for ClusterMetrics();
      uint64_t v19 = &off_100031A98;
      uint64_t v139 = v18;
      Swift::String v140 = &off_100031A98;
      v138[0] = *((void *)&v16 + 1);
    }
    else
    {
      uint64_t v18 = type metadata accessor for WidgetMetrics();
      uint64_t v19 = &off_100031A08;
      uint64_t v139 = v18;
      Swift::String v140 = &off_100031A08;
      v138[0] = v17;
    }
  }
  else
  {
    uint64_t v18 = type metadata accessor for ConsoleMetrics();
    uint64_t v19 = &off_100031B28;
    uint64_t v139 = v18;
    Swift::String v140 = &off_100031B28;
    v138[0] = v16;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v138, v18);
  ((void (__cdecl *)())v19[5])();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  unsigned __int8 v142 = 1;
  sub_10000D064((uint64_t)v138);
  v137[0] = *(_DWORD *)v143;
  *(_DWORD *)((char *)v137 + 3) = *(_DWORD *)&v143[3];
  int v94 = v142;
  v136[0] = *(_DWORD *)v141;
  *(_DWORD *)((char *)v136 + 3) = *(_DWORD *)&v141[3];
  uint64_t v20 = *(void *)(v93 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_title + 8);
  uint64_t v117 = *(void *)(v93 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_title);
  uint64_t v118 = v20;
  unint64_t v21 = sub_100014744();
  swift_bridgeObjectRetain();
  uint64_t v88 = v21;
  uint64_t v22 = Text.init<A>(_:)();
  uint64_t v24 = v23;
  LODWORD(v90) = v25;
  uint64_t v91 = v26;
  sub_100014318((uint64_t)v144, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v117);
  sub_100014318((uint64_t)v144, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v27 = v121;
  uint64_t v28 = v122;
  if ((_BYTE)v117)
  {
    if (v117 == 1)
    {
      uint64_t v29 = type metadata accessor for ClusterMetrics();
      uint64_t v30 = &off_100031A98;
      uint64_t v120 = v29;
      *(void *)&long long v121 = &off_100031A98;
      uint64_t v117 = *((void *)&v27 + 1);
    }
    else
    {
      uint64_t v29 = type metadata accessor for WidgetMetrics();
      uint64_t v30 = &off_100031A08;
      uint64_t v120 = v29;
      *(void *)&long long v121 = &off_100031A08;
      uint64_t v117 = v28;
    }
  }
  else
  {
    uint64_t v29 = type metadata accessor for ConsoleMetrics();
    uint64_t v30 = &off_100031B28;
    uint64_t v120 = v29;
    *(void *)&long long v121 = &off_100031B28;
    uint64_t v117 = v27;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(&v117, v29);
  ((void (*)(uint64_t, uint64_t))v30[15])(v29, (uint64_t)v30);
  char v31 = v90 & 1;
  uint64_t v32 = Text.font(_:)();
  uint64_t v34 = v33;
  LODWORD(v90) = v35;
  uint64_t v86 = v36;
  sub_100014554(v22, v24, v31);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000D064((uint64_t)&v117);
  sub_100014318((uint64_t)v144, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v117);
  sub_100014318((uint64_t)v144, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v37 = v121;
  uint64_t v38 = v122;
  if ((_BYTE)v117)
  {
    if (v117 == 1)
    {
      uint64_t v39 = type metadata accessor for ClusterMetrics();
      uint64_t v40 = &off_100031A98;
      uint64_t v120 = v39;
      *(void *)&long long v121 = &off_100031A98;
      uint64_t v117 = *((void *)&v37 + 1);
    }
    else
    {
      uint64_t v39 = type metadata accessor for WidgetMetrics();
      uint64_t v40 = &off_100031A08;
      uint64_t v120 = v39;
      *(void *)&long long v121 = &off_100031A08;
      uint64_t v117 = v38;
    }
  }
  else
  {
    uint64_t v39 = type metadata accessor for ConsoleMetrics();
    uint64_t v40 = &off_100031B28;
    uint64_t v120 = v39;
    *(void *)&long long v121 = &off_100031B28;
    uint64_t v117 = v37;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(&v117, v39);
  ((void (__cdecl *)())v40[11])();
  char v41 = v90 & 1;
  uint64_t v42 = Text.foregroundColor(_:)();
  uint64_t v89 = v43;
  uint64_t v90 = v42;
  LODWORD(v87) = v44;
  uint64_t v91 = v45;
  sub_100014554(v32, v34, v41);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000D064((uint64_t)&v117);
  uint64_t v46 = *(void *)(v93 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle + 8);
  uint64_t v117 = *(void *)(v93 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle);
  uint64_t v118 = v46;
  swift_bridgeObjectRetain();
  uint64_t v47 = Text.init<A>(_:)();
  uint64_t v49 = v48;
  LODWORD(v88) = v50;
  uint64_t v93 = v51;
  sub_100014318((uint64_t)v144, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v117);
  sub_100014318((uint64_t)v144, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v52 = v121;
  uint64_t v53 = v122;
  if ((_BYTE)v117)
  {
    if (v117 == 1)
    {
      uint64_t v54 = type metadata accessor for ClusterMetrics();
      char v55 = &off_100031A98;
      uint64_t v120 = v54;
      *(void *)&long long v121 = &off_100031A98;
      uint64_t v117 = *((void *)&v52 + 1);
    }
    else
    {
      uint64_t v54 = type metadata accessor for WidgetMetrics();
      char v55 = &off_100031A08;
      uint64_t v120 = v54;
      *(void *)&long long v121 = &off_100031A08;
      uint64_t v117 = v53;
    }
  }
  else
  {
    uint64_t v54 = type metadata accessor for ConsoleMetrics();
    char v55 = &off_100031B28;
    uint64_t v120 = v54;
    *(void *)&long long v121 = &off_100031B28;
    uint64_t v117 = v52;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(&v117, v54);
  ((void (*)(uint64_t, uint64_t))v55[16])(v54, (uint64_t)v55);
  char v56 = v88 & 1;
  uint64_t v57 = Text.font(_:)();
  uint64_t v88 = v58;
  LODWORD(v86) = v59;
  sub_100014554(v47, v49, v56);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000D064((uint64_t)&v117);
  sub_100014318((uint64_t)v144, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v117);
  sub_100014318((uint64_t)v144, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v60 = v121;
  uint64_t v61 = v122;
  if ((_BYTE)v117)
  {
    if (v117 == 1)
    {
      uint64_t v62 = type metadata accessor for ClusterMetrics();
      char v63 = &off_100031A98;
      uint64_t v132 = &off_100031A98;
      uint64_t v131 = v62;
      v130[0] = *((void *)&v60 + 1);
    }
    else
    {
      uint64_t v62 = type metadata accessor for WidgetMetrics();
      char v63 = &off_100031A08;
      uint64_t v132 = &off_100031A08;
      uint64_t v131 = v62;
      v130[0] = v61;
    }
  }
  else
  {
    uint64_t v62 = type metadata accessor for ConsoleMetrics();
    char v63 = &off_100031B28;
    uint64_t v132 = &off_100031B28;
    uint64_t v131 = v62;
    v130[0] = v60;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  char v64 = v86 & 1;
  char v65 = v87 & 1;
  sub_10001435C(v130, v62);
  ((void (__cdecl *)())v63[13])();
  uint64_t v66 = v88;
  uint64_t v67 = Text.foregroundColor(_:)();
  uint64_t v87 = v68;
  uint64_t v93 = v69;
  char v71 = v70 & 1;
  sub_100014554(v57, v66, v64);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000D064((uint64_t)v130);
  uint64_t v72 = swift_getKeyPath();
  uint64_t v88 = v72;
  v106[0] = v137[0];
  *(_DWORD *)((char *)v106 + 3) = *(_DWORD *)((char *)v137 + 3);
  v105[0] = v136[0];
  *(_DWORD *)((char *)v105 + 3) = *(_DWORD *)((char *)v136 + 3);
  HIDWORD(v108) = *(_DWORD *)((char *)v137 + 3);
  long long v102 = v133;
  long long v103 = v134;
  long long v104 = v135;
  char v101 = v65;
  *(void *)&long long v107 = v100;
  *((void *)&v107 + 1) = KeyPath;
  *(void *)&long long v108 = v99;
  BYTE8(v108) = v97;
  *(_DWORD *)((char *)&v108 + 9) = v137[0];
  long long v110 = 0u;
  long long v109 = 0u;
  LOBYTE(v111) = v94;
  DWORD1(v111) = *(_DWORD *)((char *)v136 + 3);
  *(_DWORD *)((char *)&v111 + 1) = v136[0];
  *((void *)&v111 + 1) = v95;
  *(void *)unsigned int v112 = v96;
  *(_OWORD *)&v112[40] = v135;
  *(_OWORD *)&v112[24] = v134;
  *(_OWORD *)&v112[8] = v133;
  long long v73 = v107;
  long long v74 = v108;
  long long v75 = v111;
  uint64_t v76 = v92;
  *(_OWORD *)(v92 + 32) = 0u;
  *(_OWORD *)(v76 + 48) = 0u;
  *(_OWORD *)uint64_t v76 = v73;
  *(_OWORD *)(v76 + 16) = v74;
  long long v77 = *(_OWORD *)v112;
  long long v78 = *(_OWORD *)&v112[32];
  uint64_t v79 = *(void *)&v112[48];
  *(_OWORD *)(v76 + 96) = *(_OWORD *)&v112[16];
  *(_OWORD *)(v76 + 112) = v78;
  *(_OWORD *)(v76 + 64) = v75;
  *(_OWORD *)(v76 + 80) = v77;
  char v116 = v65;
  char v80 = v71;
  char v114 = v71;
  *(_DWORD *)(v76 + 153) = *(_DWORD *)v115;
  *(_DWORD *)(v76 + 156) = *(_DWORD *)&v115[3];
  *(_DWORD *)(v76 + 185) = *(_DWORD *)v113;
  *(_DWORD *)(v76 + 188) = *(_DWORD *)&v113[3];
  char v81 = v71;
  uint64_t v83 = v89;
  uint64_t v82 = v90;
  *(void *)(v76 + 128) = v79;
  *(void *)(v76 + 136) = v82;
  *(void *)(v76 + 144) = v83;
  *(unsigned char *)(v76 + 152) = v65;
  *(void *)(v76 + 160) = v91;
  *(void *)(v76 + 168) = v67;
  uint64_t v84 = v87;
  *(void *)(v76 + 176) = v87;
  *(unsigned char *)(v76 + 184) = v81;
  *(void *)(v76 + 192) = v93;
  *(void *)(v76 + 200) = v72;
  *(unsigned char *)(v76 + 208) = 1;
  sub_100014678((uint64_t)&v107);
  sub_100014470(v82, v83, v65);
  swift_bridgeObjectRetain();
  sub_100014470(v67, v84, v80);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100014554(v67, v84, v80);
  swift_release();
  swift_bridgeObjectRelease();
  sub_100014554(v82, v83, v101);
  swift_bridgeObjectRelease();
  uint64_t v117 = v100;
  uint64_t v118 = KeyPath;
  uint64_t v119 = v99;
  LOBYTE(v120) = v97;
  *(_DWORD *)((char *)&v120 + 1) = v106[0];
  HIDWORD(v120) = *(_DWORD *)((char *)v106 + 3);
  long long v121 = 0u;
  long long v122 = 0u;
  char v123 = v94;
  *(_DWORD *)long long v124 = v105[0];
  *(_DWORD *)&v124[3] = *(_DWORD *)((char *)v105 + 3);
  uint64_t v125 = v95;
  uint64_t v126 = v96;
  long long v129 = v104;
  long long v128 = v103;
  long long v127 = v102;
  return sub_1000146DC((uint64_t)&v117);
}

uint64_t sub_100013D50@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D7B0(a1);
}

uint64_t sub_100013D9C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100013DC8()
{
  return sub_100014A3C(&qword_100036EE8, &qword_100036EC8, (void (*)(void))sub_100013E04, (void (*)(void))sub_100014060);
}

unint64_t sub_100013E04()
{
  unint64_t result = qword_100036EF0;
  if (!qword_100036EF0)
  {
    sub_100005E2C(&qword_100036EC0);
    sub_100013F54(&qword_100036EF8, &qword_100036ED8, (void (*)(void))sub_100013EC8);
    sub_100013F54(&qword_100036F18, &qword_100036EA0, (void (*)(void))sub_100013FD4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100036EF0);
  }
  return result;
}

unint64_t sub_100013EC8()
{
  unint64_t result = qword_100036F00;
  if (!qword_100036F00)
  {
    sub_100005E2C(&qword_100036ED0);
    sub_1000142C8(&qword_100036F08, &qword_100036F10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100036F00);
  }
  return result;
}

uint64_t sub_100013F54(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005E2C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100013FD4()
{
  unint64_t result = qword_100036F20;
  if (!qword_100036F20)
  {
    sub_100005E2C(&qword_100036E98);
    sub_1000142C8(&qword_100036F28, &qword_100036F30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100036F20);
  }
  return result;
}

unint64_t sub_100014060()
{
  unint64_t result = qword_100036F38;
  if (!qword_100036F38)
  {
    sub_100005E2C(&qword_100036E80);
    sub_100013F54(&qword_100036F40, &qword_100036E90, (void (*)(void))sub_100014124);
    sub_100013F54(&qword_100036F60, &qword_100036E70, (void (*)(void))sub_1000141B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100036F38);
  }
  return result;
}

unint64_t sub_100014124()
{
  unint64_t result = qword_100036F48;
  if (!qword_100036F48)
  {
    sub_100005E2C(&qword_100036E88);
    sub_1000142C8(&qword_100036F50, &qword_100036F58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100036F48);
  }
  return result;
}

unint64_t sub_1000141B0()
{
  unint64_t result = qword_100036F68;
  if (!qword_100036F68)
  {
    sub_100005E2C(&qword_100036E68);
    sub_1000142C8(&qword_100036F70, &qword_100036F78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100036F68);
  }
  return result;
}

unint64_t sub_10001423C()
{
  unint64_t result = qword_100036F80;
  if (!qword_100036F80)
  {
    sub_100005E2C(&qword_100036EE0);
    sub_1000142C8(&qword_100036F88, &qword_100036F90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100036F80);
  }
  return result;
}

uint64_t sub_1000142C8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005E2C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100014318(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void))
{
  return a1;
}

void *sub_10001435C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000143A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 208);
  uint64_t v3 = *(void *)(a1 + 216);
  char v4 = *(unsigned char *)(a1 + 224);
  uint64_t v5 = *(void *)(a1 + 240);
  char v7 = *(unsigned char *)(a1 + 256);
  uint64_t v8 = *(void *)(a1 + 248);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100014470(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_100014470(v5, v8, v7);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100014470(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100014480(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 208);
  uint64_t v3 = *(void *)(a1 + 216);
  char v4 = *(unsigned char *)(a1 + 224);
  uint64_t v5 = *(void *)(a1 + 240);
  char v7 = *(unsigned char *)(a1 + 256);
  uint64_t v8 = *(void *)(a1 + 248);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_100014554(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_100014554(v5, v8, v7);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100014554(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100014564(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004E64(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000145C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000145F4()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_100014620@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10001464C()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_100014678(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000146DC(uint64_t a1)
{
  return a1;
}

unint64_t sub_100014744()
{
  unint64_t result = qword_100036FC8;
  if (!qword_100036FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100036FC8);
  }
  return result;
}

uint64_t sub_100014798(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 160);
  uint64_t v3 = *(void *)(a1 + 168);
  char v4 = *(unsigned char *)(a1 + 176);
  uint64_t v5 = *(void *)(a1 + 208);
  char v7 = *(unsigned char *)(a1 + 224);
  uint64_t v8 = *(void *)(a1 + 216);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100014470(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_100014470(v5, v8, v7);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100014864(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 160);
  uint64_t v3 = *(void *)(a1 + 168);
  char v4 = *(unsigned char *)(a1 + 176);
  uint64_t v5 = *(void *)(a1 + 208);
  char v7 = *(unsigned char *)(a1 + 224);
  uint64_t v8 = *(void *)(a1 + 216);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_100014554(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_100014554(v5, v8, v7);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100014934(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004E64(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100014998@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000149C4()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_1000149EC()
{
  return sub_100014A3C(&qword_100037000, &qword_100037008, (void (*)(void))sub_100013DC8, (void (*)(void))sub_10001423C);
}

uint64_t sub_100014A3C(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005E2C(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_100014B90()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TripAppDelegate();
  return [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for TripAppDelegate();
  static CommandLine.unsafeArgv.getter();
  static CommandLine.argc.getter();
  static CommandLine.argc.getter();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  char v4 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v4) = UIApplicationMain(_:_:_:_:)();
  swift_bridgeObjectRelease();
  exit((int)v4);
}

uint64_t type metadata accessor for TripAppDelegate()
{
  return self;
}

unint64_t sub_100014C74()
{
  unint64_t result = qword_1000368F0;
  if (!qword_1000368F0)
  {
    type metadata accessor for LaunchOptionsKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000368F0);
  }
  return result;
}

uint64_t sub_100014CCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100004E64(&qword_100036D50);
  uint64_t v7 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a2, a1, v4);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56);

  return v5(a2, 0, 1, v4);
}

uint64_t sub_100014DA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100014DB8(a1, &qword_100036D78, a2);
}

uint64_t sub_100014DAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100014DB8(a1, &qword_100036D80, a2);
}

uint64_t sub_100014DB8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  sub_100014934(a1, a3, a2);
  uint64_t v5 = sub_100004E64(a2);
  long long v6 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);

  return v6(a3, 0, 1, v5);
}

uint64_t sub_100014E34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100014DB8(a1, &qword_100036D90, a2);
}

uint64_t sub_100014E40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100014DB8(a1, &qword_100036DB0, a2);
}

uint64_t sub_100014E4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100014DB8(a1, &qword_100036DC0, a2);
}

uint64_t sub_100014E58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100014DB8(a1, &qword_100036DA0, a2);
}

uint64_t sub_100014E64()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

BOOL sub_100014EE0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_100014EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v26 = a7;
  uint64_t v27 = a1;
  uint64_t v13 = sub_100004E64(&qword_100037778);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin();
  long long v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = v7 + OBJC_IVAR____TtC4Trip21CardCellConfiguration__isClipped;
  char v28 = 0;
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v17, v16, v13);
  UUID.init()();
  *(unsigned char *)(v7 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_preferredCellStyle) = 5;
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    uint64_t v18 = (void *)sub_100018244((unint64_t)_swiftEmptyArrayStorage);
  }
  else {
    uint64_t v18 = &_swiftEmptySetSingleton;
  }
  uint64_t v19 = v27;
  char v20 = v26 & 1;
  *(void *)(v7 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_cancellables) = v18;
  unint64_t v21 = (void *)(v7 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_title);
  *unint64_t v21 = v19;
  v21[1] = a2;
  uint64_t v22 = (void *)(v7 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle);
  *uint64_t v22 = a3;
  v22[1] = a4;
  uint64_t v23 = (void *)(v7 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_symbolImageName);
  *uint64_t v23 = a5;
  v23[1] = a6;
  *(unsigned char *)(v7 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_dataType) = v20;
  return v7;
}

uint64_t sub_1000150C4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC4Trip21CardCellConfiguration__isClipped;
  uint64_t v2 = sub_100004E64(&qword_100037778);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_id;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v5, v6);
}

uint64_t sub_1000151F8()
{
  return type metadata accessor for CardCellConfiguration(0);
}

uint64_t type metadata accessor for CardCellConfiguration(uint64_t a1)
{
  return sub_100017398(a1, (uint64_t *)&unk_1000370D0);
}

void sub_100015220()
{
  sub_1000158D8(319, (unint64_t *)&unk_1000370E0);
  if (v0 <= 0x3F)
  {
    type metadata accessor for UUID();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_100015328@<X0>(uint64_t a1@<X8>)
{
  return sub_1000159C8(&OBJC_IVAR____TtC4Trip21CardCellConfiguration_id, a1);
}

uint64_t sub_100015334@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CardCellConfiguration(0);
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100015374()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1000153E8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10001545C(char a1, char a2)
{
  char v4 = a1 & 1;
  uint64_t v5 = sub_100004E64(&qword_1000377A0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100004E64(&qword_100037798);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  long long v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  UUID.init()();
  uint64_t v13 = v2 + OBJC_IVAR____TtC4Trip9CardModel__name;
  v16[0] = 0;
  v16[1] = 0xE000000000000000;
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v13, v12, v9);
  uint64_t v14 = v2 + OBJC_IVAR____TtC4Trip9CardModel__cells;
  v16[0] = _swiftEmptyArrayStorage;
  sub_100004E64((uint64_t *)&unk_100037270);
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v14, v8, v5);
  *(unsigned char *)(v2 + OBJC_IVAR____TtC4Trip9CardModel_cardLayoutType) = v4;
  *(unsigned char *)(v2 + OBJC_IVAR____TtC4Trip9CardModel_showsTitle) = a2;
  return v2;
}

uint64_t sub_100015660()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC4Trip9CardModel_id;
  uint64_t v2 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC4Trip9CardModel__name;
  uint64_t v4 = sub_100004E64(&qword_100037798);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC4Trip9CardModel__cells;
  uint64_t v6 = sub_100004E64(&qword_1000377A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v8 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v7, v8);
}

uint64_t sub_100015790()
{
  return type metadata accessor for CardModel(0);
}

uint64_t type metadata accessor for CardModel(uint64_t a1)
{
  return sub_100017398(a1, (uint64_t *)&unk_100037250);
}

void sub_1000157B8()
{
  type metadata accessor for UUID();
  if (v0 <= 0x3F)
  {
    sub_1000158D8(319, &qword_100037260);
    if (v1 <= 0x3F)
    {
      sub_100015920();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_1000158D8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = type metadata accessor for Published();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_100015920()
{
  if (!qword_100037268)
  {
    sub_100005E2C((uint64_t *)&unk_100037270);
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100037268);
    }
  }
}

uint64_t sub_10001597C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CardModel(0);
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000159BC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000159C8(&OBJC_IVAR____TtC4Trip9CardModel_id, a1);
}

uint64_t sub_1000159C8@<X0>(void *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = *v2 + *a1;
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_100015A3C()
{
  return static UUID.== infix(_:_:)();
}

uint64_t *sub_100015A58(uint64_t *result)
{
  uint64_t v1 = (void *)result[1];
  if (v1)
  {
    uint64_t v2 = *result;
    strcpy((char *)v7, "[TripCard] - ");
    HIWORD(v7[1]) = -4864;
    v3._countAndFlagsBits = v2;
    v3._object = v1;
    String.append(_:)(v3);
    os_log_type_t v4 = static os_log_type_t.debug.getter();
    sub_10001B638(v4, v7[0], v7[1], 0xD000000000000014, 0x8000000100027FA0);
    swift_bridgeObjectRelease();
    NSString v5 = String._bridgeToObjectiveC()();
    id v6 = sub_10001AE20(v5);

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    return (uint64_t *)static Published.subscript.setter();
  }
  return result;
}

uint64_t sub_100015B80()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_100015BD8();
    return swift_release();
  }
  return result;
}

uint64_t sub_100015BD8()
{
  uint64_t v0 = sub_100004E64(&qword_100036D50);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  Swift::String v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((dispatch thunk of CAFTripObservable.showOdometer.getter() & 1) == 0) {
    goto LABEL_4;
  }
  dispatch thunk of CAFOdometerObservable.distanceKM.getter();
  Measurement.value.getter();
  double v5 = v4;
  id v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  if (v5 == 0.0
    || (dispatch thunk of CAFOdometerObservable.distanceMiles.getter(),
        Measurement.value.getter(),
        double v8 = v7,
        v6(v3, v0),
        v8 == 0.0))
  {
LABEL_4:
    unint64_t v9 = (unint64_t)sub_100006CF4();
  }
  else
  {
    uint64_t v17 = sub_100006CF4();
    uint64_t v18 = sub_1000083B8();
    unint64_t v20 = (unint64_t)v17;
    sub_1000179E0((unint64_t)v18);
    unint64_t v9 = v20;
  }
  unint64_t v20 = 0;
  unint64_t v21 = 0xE000000000000000;
  _StringGuts.grow(_:)(29);
  swift_bridgeObjectRelease();
  unint64_t v20 = 0xD000000000000015;
  unint64_t v21 = 0x8000000100027F60;
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v19[1] = v10;
  v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 0x736C6C656320;
  v12._object = (void *)0xE600000000000000;
  String.append(_:)(v12);
  uint64_t v13 = v20;
  unint64_t v14 = v21;
  os_log_type_t v15 = static os_log_type_t.debug.getter();
  sub_10001B638(v15, v13, v14, 0x6543657461647075, 0xED00002928736C6CLL);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  unint64_t v20 = v9;
  swift_retain();
  return static Published.subscript.setter();
}

void sub_100015EA0()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC4Trip8TripCard_dimesionObservable);
}

uint64_t sub_100015F00()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC4Trip9CardModel_id;
  uint64_t v2 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC4Trip9CardModel__name;
  uint64_t v4 = sub_100004E64(&qword_100037798);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC4Trip9CardModel__cells;
  uint64_t v6 = sub_100004E64(&qword_1000377A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  swift_bridgeObjectRelease();
  uint64_t v7 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v8 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v7, v8);
}

uint64_t sub_100016070()
{
  return type metadata accessor for TripCard(0);
}

uint64_t type metadata accessor for TripCard(uint64_t a1)
{
  return sub_100017398(a1, qword_1000373E0);
}

uint64_t sub_100016098()
{
  return sub_1000173DC();
}

uint64_t sub_1000160A8(void *a1, void *a2, char a3, int a4)
{
  uint64_t v5 = v4;
  LODWORD(v68) = a4;
  LODWORD(v67) = a3 & 1;
  uint64_t v60 = sub_100004E64(&qword_1000377C0);
  __chkstk_darwin(v60);
  int v59 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_100004E64(&qword_1000377C8);
  __chkstk_darwin(v58);
  uint64_t v57 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100004E64(&qword_1000377D0);
  uint64_t v62 = *(void *)(v10 - 8);
  uint64_t v63 = v10;
  __chkstk_darwin(v10);
  uint64_t v61 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004E64(&qword_1000377D8);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  char v64 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v15 = (void *)sub_100004E64(&qword_100037AC0);
  uint64_t v69 = *(v15 - 1);
  id v70 = v15;
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100004E64(&qword_1000377B8);
  __chkstk_darwin(v18 - 8);
  unint64_t v20 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100004E64(&qword_100037AC8);
  uint64_t v54 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v54 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_100004E64(&qword_100037AD0);
  uint64_t v55 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v25 = (char *)&v54 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  uint64_t v65 = v13;
  uint64_t v66 = v12;
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    int v26 = (void *)sub_100018244((unint64_t)_swiftEmptyArrayStorage);
  }
  else {
    int v26 = &_swiftEmptySetSingleton;
  }
  *(void *)(v5 + OBJC_IVAR____TtC4Trip8InfoCard_cancellables) = v26;
  uint64_t v27 = OBJC_IVAR____TtC4Trip8InfoCard_dimesionObservable;
  *(void *)(v5 + OBJC_IVAR____TtC4Trip8InfoCard_dimesionObservable) = 0;
  *(void *)(v5 + OBJC_IVAR____TtC4Trip8InfoCard_consumption) = a1;
  *(void *)(v5 + OBJC_IVAR____TtC4Trip8InfoCard_odometer) = a2;
  id v71 = a2;
  id v72 = a1;
  char v28 = (void *)CAFFuelConsumptionObservable.observed.getter();
  id v29 = [v28 car];

  if (v29)
  {
    uint64_t v30 = CAFCar.dimesionObservable.getter();
  }
  else
  {
    uint64_t v30 = 0;
  }
  char v31 = *(void **)(v5 + v27);
  *(void *)(v5 + v27) = v30;
  swift_release();

  sub_10001545C(v67, v68 & 1);
  uint64_t v32 = self;
  swift_retain_n();
  id v33 = [v32 mainBundle];
  v75._object = (void *)0xE000000000000000;
  v34._countAndFlagsBits = 0x5F454C4349484556;
  v34._object = (void *)0xEC0000004F464E49;
  v35.value._countAndFlagsBits = 1885958740;
  v35.value._object = (void *)0xE400000000000000;
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  v75._countAndFlagsBits = 0;
  Swift::String v37 = NSLocalizedString(_:tableName:bundle:value:comment:)(v34, v35, (NSBundle)v33, v36, v75);

  swift_getKeyPath();
  swift_getKeyPath();
  Swift::String v73 = v37;
  static Published.subscript.setter();
  if (a2)
  {
    id v38 = v71;
    v73._countAndFlagsBits = dispatch thunk of CAFOdometerObservable.$distanceMiles.getter();
    id v74 = (id)dispatch thunk of CAFOdometerObservable.$distanceKM.getter();
    sub_100004E64(&qword_100037A00);
    sub_100006008(&qword_100037A08, &qword_100037A00);
    Publishers.CombineLatest.init(_:_:)();
    v73._countAndFlagsBits = (uint64_t)[self mainRunLoop];
    uint64_t v39 = type metadata accessor for NSRunLoop.SchedulerOptions();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v20, 1, 1, v39);
    sub_100006CB8(0, &qword_100037A48);
    sub_100006008(&qword_100037AF0, &qword_100037AC8);
    sub_10001ACB8();
    Publisher.receive<A>(on:options:)();
    sub_10001AD90((uint64_t)v20);

    (*(void (**)(char *, uint64_t))(v54 + 8))(v23, v21);
    swift_allocObject();
    swift_weakInit();
    sub_100006008(&qword_100037AF8, &qword_100037AD0);
    uint64_t v40 = v56;
    Publisher<>.sink(receiveValue:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v25, v40);
    swift_beginAccess();
    AnyCancellable.store(in:)();
    swift_endAccess();

    swift_release();
  }
  v73._countAndFlagsBits = dispatch thunk of CAFFuelConsumptionObservable.$fuelEfficiency.getter();
  char v41 = self;
  id v74 = [v41 mainRunLoop];
  uint64_t v42 = type metadata accessor for NSRunLoop.SchedulerOptions();
  uint64_t v43 = *(void *)(v42 - 8);
  int v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v43 + 56);
  uint64_t v68 = v43 + 56;
  v44(v20, 1, 1, v42);
  sub_100004E64(&qword_100037AD8);
  uint64_t v45 = sub_100006CB8(0, &qword_100037A48);
  sub_100006008(&qword_100037AE0, &qword_100037AD8);
  unint64_t v46 = sub_10001ACB8();
  uint64_t v67 = v45;
  uint64_t v56 = v46;
  Publisher.receive<A>(on:options:)();
  sub_10001AD90((uint64_t)v20);

  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_100006008(&qword_100037AE8, &qword_100037AC0);
  id v47 = v70;
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, id))(v69 + 8))(v17, v47);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();
  uint64_t v48 = *(void **)(v5 + OBJC_IVAR____TtC4Trip8InfoCard_dimesionObservable);
  if (v48)
  {
    id v70 = v48;
    dispatch thunk of CAFDimensionObservable.$measurementSystem.getter();
    dispatch thunk of CAFDimensionObservable.$currentLocale.getter();
    sub_100006008(&qword_100037AA0, &qword_1000377C8);
    sub_100006008(&qword_100037AA8, &qword_1000377C0);
    uint64_t v49 = v61;
    Publishers.CombineLatest.init(_:_:)();
    v73._countAndFlagsBits = (uint64_t)[v41 mainRunLoop];
    v44(v20, 1, 1, v42);
    sub_100006008(&qword_100037AB0, &qword_1000377D0);
    uint64_t v50 = v63;
    uint64_t v51 = v64;
    Publisher.receive<A>(on:options:)();
    sub_10001AD90((uint64_t)v20);

    (*(void (**)(char *, uint64_t))(v62 + 8))(v49, v50);
    swift_allocObject();
    swift_weakInit();
    sub_100006008(&qword_100037AB8, &qword_1000377D8);
    uint64_t v52 = v66;
    Publisher<>.sink(receiveValue:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v51, v52);
    swift_beginAccess();
    AnyCancellable.store(in:)();
    swift_endAccess();

    swift_release();
  }
  sub_100016D74();
  swift_release();

  return v5;
}

uint64_t sub_100016CB4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    a3();
    return swift_release();
  }
  return result;
}

uint64_t sub_100016D14(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    a3();
    return swift_release();
  }
  return result;
}

uint64_t sub_100016D74()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100004E64(&qword_100036D50);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v34 = (unint64_t)_swiftEmptyArrayStorage;
  unint64_t v6 = (unint64_t)sub_1000087EC();
  unint64_t v7 = v6;
  if (v6 >> 62) {
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
  }
  else {
    uint64_t v8 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8)
  {
    if ((v7 & 0xC000000000000001) != 0)
    {
      uint64_t v9 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else
    {
      if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_22;
      }
      uint64_t v9 = *(void *)(v7 + 32);
      swift_retain();
    }
    swift_bridgeObjectRelease();
    *(unsigned char *)(v9 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_preferredCellStyle) = 4;
    id v10 = [self mainBundle];
    v11._countAndFlagsBits = 0xD000000000000017;
    v35._object = (void *)0xE000000000000000;
    v11._object = (void *)0x8000000100027EE0;
    v12.value._countAndFlagsBits = 1885958740;
    v12.value._object = (void *)0xE400000000000000;
    v13._countAndFlagsBits = 0;
    v13._object = (void *)0xE000000000000000;
    v35._countAndFlagsBits = 0;
    Swift::String v14 = NSLocalizedString(_:tableName:bundle:value:comment:)(v11, v12, (NSBundle)v10, v13, v35);

    *(Swift::String *)(v9 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle) = v14;
    swift_bridgeObjectRelease();
    swift_retain();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    {
LABEL_8:
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      swift_release();
      goto LABEL_10;
    }
LABEL_22:
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
LABEL_10:
  os_log_type_t v15 = *(void **)(v1 + OBJC_IVAR____TtC4Trip8InfoCard_odometer);
  if (v15)
  {
    id v16 = v15;
    dispatch thunk of CAFOdometerObservable.distanceKM.getter();
    Measurement.value.getter();
    double v18 = v17;
    uint64_t v19 = *(void (**)(char *, uint64_t))(v3 + 8);
    v19(v5, v2);
    if (v18 != 0.0)
    {
      dispatch thunk of CAFOdometerObservable.distanceMiles.getter();
      Measurement.value.getter();
      double v21 = v20;
      v19(v5, v2);
      if (v21 != 0.0)
      {
        uint64_t v22 = sub_1000083B8();
        sub_1000179E0((unint64_t)v22);
      }
    }
  }
  unint64_t v32 = 0;
  unint64_t v33 = 0xE000000000000000;
  _StringGuts.grow(_:)(29);
  swift_bridgeObjectRelease();
  unint64_t v32 = 0xD000000000000015;
  unint64_t v33 = 0x8000000100027F00;
  if (v34 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v23 = *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v31 = v23;
  v24._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  v25._countAndFlagsBits = 0x736C6C656320;
  v25._object = (void *)0xE600000000000000;
  String.append(_:)(v25);
  uint64_t v26 = v32;
  unint64_t v27 = v33;
  os_log_type_t v28 = static os_log_type_t.debug.getter();
  sub_10001B638(v28, v26, v27, 0x6543657461647075, 0xED00002928736C6CLL);
  swift_bridgeObjectRelease();
  id v29 = (void *)v34;
  swift_getKeyPath();
  swift_getKeyPath();
  unint64_t v32 = (unint64_t)v29;
  swift_retain();
  return static Published.subscript.setter();
}

void sub_1000171A0()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC4Trip8InfoCard_dimesionObservable);
}

uint64_t sub_100017200()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC4Trip9CardModel_id;
  uint64_t v2 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC4Trip9CardModel__name;
  uint64_t v4 = sub_100004E64(&qword_100037798);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC4Trip9CardModel__cells;
  uint64_t v6 = sub_100004E64(&qword_1000377A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  swift_bridgeObjectRelease();
  uint64_t v7 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v8 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v7, v8);
}

uint64_t sub_100017370()
{
  return type metadata accessor for InfoCard(0);
}

uint64_t type metadata accessor for InfoCard(uint64_t a1)
{
  return sub_100017398(a1, qword_1000375B8);
}

uint64_t sub_100017398(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000173D0()
{
  return sub_1000173DC();
}

uint64_t sub_1000173DC()
{
  return swift_updateClassMetadata2();
}

unsigned char *sub_100017444(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CardLayoutType()
{
  return &type metadata for CardLayoutType;
}

uint64_t _s4Trip14CardLayoutTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s4Trip14CardLayoutTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x1000175BCLL);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CardCellDataType()
{
  return &type metadata for CardCellDataType;
}

unint64_t sub_1000175F8()
{
  unint64_t result = qword_100037758;
  if (!qword_100037758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100037758);
  }
  return result;
}

unint64_t sub_100017650()
{
  unint64_t result = qword_100037760;
  if (!qword_100037760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100037760);
  }
  return result;
}

uint64_t sub_1000176A4()
{
  return sub_1000184F8(&qword_100037768, (void (*)(uint64_t))&type metadata accessor for UUID);
}

uint64_t sub_1000176EC@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10001776C()
{
  return static Published.subscript.setter();
}

uint64_t sub_1000177E0@<X0>(void *a1@<X8>)
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

uint64_t sub_100017860()
{
  return static Published.subscript.setter();
}

uint64_t sub_1000178E4@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100017964()
{
  return static Published.subscript.setter();
}

uint64_t sub_1000179E0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_100017BAC(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return specialized Array._endMutation()();
}

uint64_t sub_100017BAC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100006008(&qword_100037770, (uint64_t *)&unk_100037270);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100004E64((uint64_t *)&unk_100037270);
          uint64_t v12 = sub_100018004(v16, i, a3);
          uint64_t v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for CardCellConfiguration(0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100017DD0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100006008(&qword_1000377B0, &qword_1000377A8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100004E64(&qword_1000377A8);
          uint64_t v12 = sub_100018070(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_100006CB8(0, &qword_100036E20);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t (*sub_100018004(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100018120(v6, a2, a3);
  return sub_10001806C;
}

uint64_t (*sub_100018070(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1000181A8(v6, a2, a3);
  return sub_10001806C;
}

void sub_1000180D8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_100018120(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *uint64_t v3 = v4;
    return sub_1000181A0;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000181A0()
{
  return swift_release();
}

void (*sub_1000181A8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_100018228;
  }
  __break(1u);
  return result;
}

void sub_100018228(id *a1)
{
}

unsigned char *sub_100018230@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

unint64_t sub_100018244(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_100004E64(&qword_100037780);
      uint64_t result = static _SetStorage.allocate(capacity:)();
      uint64_t v3 = (unsigned char *)result;
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t result = swift_bridgeObjectRelease();
      if (!v5) {
        return (unint64_t)v3;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return (unint64_t)v3;
  }
LABEL_9:
  unint64_t v7 = 0;
  uint64_t v8 = v3 + 56;
  unint64_t v21 = v1 & 0xC000000000000001;
  unint64_t v19 = v1 + 32;
  uint64_t v20 = v1 & 0xFFFFFFFFFFFFFF8;
  while (v21)
  {
    uint64_t result = specialized _ArrayBuffer._getElementSlowPath(_:)();
    unint64_t v9 = result;
    BOOL v10 = __OFADD__(v7++, 1);
    if (v10) {
      goto LABEL_25;
    }
LABEL_18:
    type metadata accessor for AnyCancellable();
    sub_1000184F8(&qword_100037788, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v11 = -1 << v3[32];
    unint64_t v12 = result & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
    uint64_t v15 = 1 << v12;
    if (((1 << v12) & v14) != 0)
    {
      uint64_t v16 = ~v11;
      sub_1000184F8(&qword_100037790, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
      while (1)
      {
        uint64_t result = dispatch thunk of static Equatable.== infix(_:_:)();
        if (result) {
          break;
        }
        unint64_t v12 = (v12 + 1) & v16;
        unint64_t v13 = v12 >> 6;
        uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
        uint64_t v15 = 1 << v12;
        if ((v14 & (1 << v12)) == 0) {
          goto LABEL_22;
        }
      }
      uint64_t result = swift_release();
    }
    else
    {
LABEL_22:
      *(void *)&v8[8 * v13] = v15 | v14;
      *(void *)(*((void *)v3 + 6) + 8 * v12) = v9;
      uint64_t v17 = *((void *)v3 + 2);
      BOOL v10 = __OFADD__(v17, 1);
      uint64_t v18 = v17 + 1;
      if (v10) {
        goto LABEL_26;
      }
      *((void *)v3 + 2) = v18;
    }
    if (v7 == v5) {
      return (unint64_t)v3;
    }
  }
  if (v7 >= *(void *)(v20 + 16)) {
    goto LABEL_27;
  }
  unint64_t v9 = *(void *)(v19 + 8 * v7);
  uint64_t result = swift_retain();
  BOOL v10 = __OFADD__(v7++, 1);
  if (!v10) {
    goto LABEL_18;
  }
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1000184F8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100018550(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100004E64(&qword_1000377B8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v158 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = sub_100004E64(&qword_1000377C0);
  __chkstk_darwin(v161);
  v160 = (char *)v158 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = sub_100004E64(&qword_1000377C8);
  __chkstk_darwin(v159);
  v158[1] = (char *)v158 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = sub_100004E64(&qword_1000377D0);
  uint64_t v163 = *(void *)(v164 - 8);
  __chkstk_darwin(v164);
  uint64_t v162 = (char *)v158 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004E64(&qword_1000377D8);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v165 = (char *)v158 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v212 = sub_100004E64(&qword_1000377E0);
  uint64_t v211 = *(void *)(v212 - 8);
  __chkstk_darwin(v212);
  v210 = (char *)v158 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v215 = sub_100004E64(&qword_1000377E8);
  uint64_t v214 = *(void *)(v215 - 8);
  __chkstk_darwin(v215);
  v213 = (char *)v158 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v206 = type metadata accessor for NSRunLoop.SchedulerTimeType.Stride();
  uint64_t v204 = *(void *)(v206 - 8);
  __chkstk_darwin(v206);
  Swift::String v203 = (char *)v158 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v202 = sub_100004E64(&qword_1000377F0);
  uint64_t v201 = *(void *)(v202 - 8);
  __chkstk_darwin(v202);
  Swift::String v200 = (char *)v158 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v208 = sub_100004E64(&qword_1000377F8);
  uint64_t v207 = *(void *)(v208 - 8);
  __chkstk_darwin(v208);
  Swift::String v205 = (char *)v158 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v196 = sub_100004E64(&qword_100037800);
  uint64_t v195 = *(void *)(v196 - 8);
  __chkstk_darwin(v196);
  v194 = (char *)v158 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v199 = sub_100004E64(&qword_100037808);
  uint64_t v21 = __chkstk_darwin(v199);
  unint64_t v198 = (char *)v158 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v226 = (char *)v158 - v23;
  uint64_t v192 = sub_100004E64(&qword_100037810);
  uint64_t v191 = *(void *)(v192 - 8);
  __chkstk_darwin(v192);
  uint64_t v190 = (char *)v158 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v197 = sub_100004E64(&qword_100037818);
  __chkstk_darwin(v197);
  v225 = (char *)v158 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v189 = sub_100004E64(&qword_100037820);
  uint64_t v188 = *(void *)(v189 - 8);
  __chkstk_darwin(v189);
  unint64_t v27 = (char *)v158 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_100004E64(&qword_100037828);
  __chkstk_darwin(v28);
  v224 = (char *)v158 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v229 = sub_100004E64(&qword_100037830);
  uint64_t v216 = *(void *)(v229 - 8);
  __chkstk_darwin(v229);
  v228 = (char *)v158 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v217 = (void *)sub_100004E64(&qword_100037838);
  uint64_t v180 = *(v217 - 1);
  __chkstk_darwin(v217);
  v178 = (char *)v158 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v185 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_100004E64(&qword_100037840);
  __chkstk_darwin(v185);
  uint64_t v184 = (char *)v158 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v176 = sub_100004E64(&qword_100037848);
  uint64_t v175 = *(void *)(v176 - 8);
  __chkstk_darwin(v176);
  v174 = (char *)v158 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v183 = sub_100004E64(&qword_100037850);
  __chkstk_darwin(v183);
  v182 = (char *)v158 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v218 = sub_100004E64(&qword_100037858);
  uint64_t v173 = *(void *)(v218 - 8);
  __chkstk_darwin(v218);
  uint64_t v172 = (char *)v158 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v181 = sub_100004E64(&qword_100037860);
  __chkstk_darwin(v181);
  v222 = (char *)v158 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_100004E64(&qword_100037868);
  *(void *)&long long v231 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v39 = (char *)v158 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v179 = sub_100004E64(&qword_100037870);
  __chkstk_darwin(v179);
  v221 = (char *)v158 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v227 = sub_100004E64(&qword_100037878);
  uint64_t v209 = *(void *)(v227 - 8);
  __chkstk_darwin(v227);
  v230 = (char *)v158 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  Swift::String_optional v168 = v8;
  uint64_t v167 = v12;
  uint64_t v166 = v13;
  uint64_t v193 = v28;
  uint64_t v187 = v27;
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    uint64_t v42 = (void *)sub_100018244((unint64_t)_swiftEmptyArrayStorage);
  }
  else {
    uint64_t v42 = &_swiftEmptySetSingleton;
  }
  *(void *)(v3 + OBJC_IVAR____TtC4Trip8TripCard_cancellables) = v42;
  *(void *)(v3 + OBJC_IVAR____TtC4Trip8TripCard_dimesionObservable) = 0;
  *(void *)(v3 + OBJC_IVAR____TtC4Trip8TripCard_trip) = a1;
  *(void *)(v3 + OBJC_IVAR____TtC4Trip8TripCard_odometer) = a2;
  id v43 = a1;
  id v44 = a2;
  swift_release();
  sub_10001545C(0, 1);
  uint64_t v45 = v3;
  id v232 = 0;
  unint64_t v233 = 0xE000000000000000;
  swift_retain();
  _StringGuts.grow(_:)(37);
  swift_bridgeObjectRelease();
  id v232 = (id)0xD000000000000017;
  unint64_t v233 = 0x8000000100027F80;
  id v46 = [v43 description];
  uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v49 = v48;

  v50._uint64_t countAndFlagsBits = v47;
  v50._object = v49;
  String.append(_:)(v50);
  swift_bridgeObjectRelease();
  v51._uint64_t countAndFlagsBits = 0x6574656D6F646F20;
  v51._object = (void *)0xEA00000000003D72;
  String.append(_:)(v51);
  id v223 = v44;
  id v52 = [v44 description];
  uint64_t v53 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v55 = v54;

  v56._uint64_t countAndFlagsBits = v53;
  v56._object = v55;
  String.append(_:)(v56);
  swift_bridgeObjectRelease();
  uint64_t v57 = (uint64_t)v232;
  unint64_t v58 = v233;
  os_log_type_t v59 = static os_log_type_t.debug.getter();
  sub_10001B638(v59, v57, v58, 0xD000000000000014, 0x8000000100027FA0);
  swift_bridgeObjectRelease();
  swift_retain();
  dispatch thunk of CAFTripObservable.userVisibleLabel.getter();
  if (v60)
  {
    NSString v61 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v62 = sub_10001AE20(v61);

    uint64_t countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    id v62 = [self mainBundle];
    v234._object = (void *)0xE000000000000000;
    v65._uint64_t countAndFlagsBits = 0x4241545F50495254;
    v65._object = (void *)0xE800000000000000;
    v66.value._uint64_t countAndFlagsBits = 1885958740;
    v66.value._object = (void *)0xE400000000000000;
    v67._uint64_t countAndFlagsBits = 0;
    v67._object = (void *)0xE000000000000000;
    v234._uint64_t countAndFlagsBits = 0;
    Swift::String v68 = NSLocalizedString(_:tableName:bundle:value:comment:)(v65, v66, (NSBundle)v62, v67, v234);
    object = v68._object;
    uint64_t countAndFlagsBits = v68._countAndFlagsBits;
  }
  uint64_t v69 = (void *)countAndFlagsBits;
  unint64_t v70 = (unint64_t)object;

  swift_getKeyPath();
  swift_getKeyPath();
  id v232 = v69;
  unint64_t v233 = v70;
  static Published.subscript.setter();
  id v232 = (id)dispatch thunk of CAFTripObservable.$userVisibleLabel.getter();
  uint64_t v177 = v45;
  swift_retain();
  sub_100004E64(&qword_100037880);
  sub_100006008(&qword_100037888, &qword_100037880);
  Publisher<>.sink(receiveValue:)();
  swift_release();
  swift_release();
  uint64_t v186 = v45 + OBJC_IVAR____TtC4Trip8TripCard_cancellables;
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();
  id v232 = (id)dispatch thunk of CAFTripObservable.$averageSpeed.getter();
  sub_100004E64(&qword_100037890);
  uint64_t v71 = sub_100004E64(&qword_100037898);
  sub_100006008(&qword_1000378A0, &qword_100037890);
  Publisher.map<A>(_:)();
  sub_100006008(&qword_1000378A8, &qword_100037868);
  id v72 = (void *)Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v231 + 8))(v39, v37);
  swift_release();
  id v232 = v72;
  sub_100004E64(&qword_1000378B0);
  unint64_t v73 = (*(unsigned __int8 *)(*(void *)(v71 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v71 - 8) + 80);
  uint64_t v74 = swift_allocObject();
  long long v231 = xmmword_100026980;
  *(_OWORD *)(v74 + 16) = xmmword_100026980;
  unint64_t v75 = v74 + v73;
  uint64_t v76 = sub_100004E64(&qword_100036DA0);
  (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v76 - 8) + 56))(v75, 1, 1, v76);
  sub_100004E64(&qword_1000378B8);
  sub_100006008(&qword_1000378C0, &qword_1000378B8);
  Publisher.prepend(_:)();
  swift_release();
  swift_bridgeObjectRelease();
  id v232 = (id)dispatch thunk of CAFTripObservable.$distance.getter();
  uint64_t v220 = sub_100004E64(&qword_1000378C8);
  uint64_t v77 = sub_100004E64(&qword_1000378D0);
  uint64_t v219 = sub_100006008(&qword_1000378D8, &qword_1000378C8);
  long long v78 = v172;
  Publisher.map<A>(_:)();
  sub_100006008(&qword_1000378E0, &qword_100037858);
  uint64_t v79 = v218;
  char v80 = (void *)Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v173 + 8))(v78, v79);
  swift_release();
  id v232 = v80;
  sub_100004E64(&qword_1000378E8);
  unint64_t v81 = (*(unsigned __int8 *)(*(void *)(v77 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v77 - 8) + 80);
  uint64_t v82 = swift_allocObject();
  *(_OWORD *)(v82 + 16) = v231;
  unint64_t v83 = v82 + v81;
  uint64_t v218 = sub_100004E64(&qword_100036DC0);
  uint64_t v84 = *(void *)(v218 - 8);
  int v85 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v84 + 56);
  uint64_t v173 = v84 + 56;
  v85(v83, 1, 1, v218);
  sub_100004E64(&qword_1000378F0);
  sub_100006008(&qword_1000378F8, &qword_1000378F0);
  Publisher.prepend(_:)();
  swift_release();
  swift_bridgeObjectRelease();
  id v232 = (id)dispatch thunk of CAFTripObservable.$duration.getter();
  sub_100004E64(&qword_100037900);
  uint64_t v86 = sub_100004E64(&qword_100037908);
  sub_100006008(&qword_100037910, &qword_100037900);
  uint64_t v87 = v174;
  Publisher.map<A>(_:)();
  sub_100006008(&qword_100037918, &qword_100037848);
  uint64_t v88 = v176;
  uint64_t v89 = (void *)Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v175 + 8))(v87, v88);
  swift_release();
  id v232 = v89;
  sub_100004E64(&qword_100037920);
  unint64_t v90 = (*(unsigned __int8 *)(*(void *)(v86 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v86 - 8) + 80);
  uint64_t v91 = swift_allocObject();
  *(_OWORD *)(v91 + 16) = v231;
  unint64_t v92 = v91 + v90;
  uint64_t v93 = sub_100004E64(&qword_100036DB0);
  (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v93 - 8) + 56))(v92, 1, 1, v93);
  sub_100004E64(&qword_100037928);
  sub_100006008(&qword_100037930, &qword_100037928);
  Publisher.prepend(_:)();
  swift_release();
  swift_bridgeObjectRelease();
  id v94 = v43;
  id v232 = (id)dispatch thunk of CAFTripObservable.$energy.getter();
  sub_100004E64(&qword_100037938);
  uint64_t v95 = sub_100004E64(&qword_100037940);
  sub_100006008(&qword_100037948, &qword_100037938);
  uint64_t v96 = v178;
  Publisher.map<A>(_:)();
  sub_100006008(&qword_100037950, &qword_100037838);
  int v97 = v217;
  v98 = (void *)Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, void *))(v180 + 8))(v96, v97);
  swift_release();
  id v232 = v98;
  sub_100004E64(&qword_100037958);
  unint64_t v99 = (*(unsigned __int8 *)(*(void *)(v95 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v95 - 8) + 80);
  uint64_t v100 = swift_allocObject();
  *(_OWORD *)(v100 + 16) = v231;
  unint64_t v101 = v100 + v99;
  uint64_t v102 = sub_100004E64(&qword_100036D90);
  (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v102 - 8) + 56))(v101, 1, 1, v102);
  sub_100004E64(&qword_100037960);
  sub_100006008(&qword_100037968, &qword_100037960);
  Publisher.prepend(_:)();
  swift_release();
  swift_bridgeObjectRelease();
  v217 = &protocol conformance descriptor for Publishers.Concatenate<A, B>;
  sub_100006008(&qword_100037970, &qword_100037870);
  sub_100006008(&qword_100037978, &qword_100037860);
  sub_100006008(&qword_100037980, &qword_100037850);
  sub_100006008(&qword_100037988, &qword_100037840);
  Publishers.CombineLatest4.init(_:_:_:_:)();
  id v171 = v94;
  id v232 = (id)dispatch thunk of CAFTripObservable.$energyEfficiency.getter();
  sub_100004E64(&qword_100037990);
  uint64_t v103 = sub_100004E64(&qword_100037998);
  sub_100006008(&qword_1000379A0, &qword_100037990);
  long long v104 = v187;
  Publisher.map<A>(_:)();
  sub_100006008(&qword_1000379A8, &qword_100037820);
  uint64_t v105 = v189;
  Swift::Int v106 = (void *)Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v188 + 8))(v104, v105);
  swift_release();
  id v232 = v106;
  sub_100004E64(&qword_1000379B0);
  unint64_t v107 = (*(unsigned __int8 *)(*(void *)(v103 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v103 - 8) + 80);
  uint64_t v108 = swift_allocObject();
  *(_OWORD *)(v108 + 16) = v231;
  unint64_t v109 = v108 + v107;
  uint64_t v110 = sub_100004E64(&qword_100036D80);
  (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v110 - 8) + 56))(v109, 1, 1, v110);
  sub_100004E64(&qword_1000379B8);
  sub_100006008(&qword_1000379C0, &qword_1000379B8);
  Publisher.prepend(_:)();
  swift_release();
  swift_bridgeObjectRelease();
  id v232 = (id)dispatch thunk of CAFTripObservable.$fuelEfficiency.getter();
  sub_100004E64(&qword_1000379C8);
  uint64_t v111 = sub_100004E64(&qword_1000379D0);
  sub_100006008(&qword_1000379D8, &qword_1000379C8);
  unsigned int v112 = v190;
  Publisher.map<A>(_:)();
  Swift::String v170 = &protocol conformance descriptor for Publishers.Map<A, B>;
  sub_100006008(&qword_1000379E0, &qword_100037810);
  uint64_t v113 = v192;
  char v114 = (void *)Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v191 + 8))(v112, v113);
  swift_release();
  id v232 = v114;
  sub_100004E64(&qword_1000379E8);
  unint64_t v115 = (*(unsigned __int8 *)(*(void *)(v111 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v111 - 8) + 80);
  uint64_t v116 = swift_allocObject();
  *(_OWORD *)(v116 + 16) = v231;
  unint64_t v117 = v116 + v115;
  uint64_t v118 = sub_100004E64(&qword_100036D78);
  (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v118 - 8) + 56))(v117, 1, 1, v118);
  sub_100004E64(&qword_1000379F0);
  Swift::String v169 = &protocol conformance descriptor for AnyPublisher<A, B>;
  sub_100006008(&qword_1000379F8, &qword_1000379F0);
  Publisher.prepend(_:)();
  swift_release();
  swift_bridgeObjectRelease();
  id v232 = (id)dispatch thunk of CAFOdometerObservable.$distanceMiles.getter();
  v222 = (char *)sub_100004E64(&qword_100037A00);
  v221 = (char *)sub_100006008(&qword_100037A08, &qword_100037A00);
  uint64_t v192 = (uint64_t)sub_100014CCC;
  uint64_t v119 = v194;
  Publisher.map<A>(_:)();
  uint64_t v189 = sub_100006008(&qword_100037A10, &qword_100037800);
  uint64_t v120 = v196;
  long long v121 = (void *)Publisher.eraseToAnyPublisher()();
  uint64_t v195 = *(void *)(v195 + 8);
  ((void (*)(char *, uint64_t))v195)(v119, v120);
  swift_release();
  id v232 = v121;
  uint64_t v191 = sub_100004E64(&qword_100037A18);
  uint64_t v122 = *(unsigned __int8 *)(v173 + 24);
  uint64_t v123 = (v122 + 32) & ~v122;
  uint64_t v190 = (char *)(v123 + *(void *)(v173 + 16));
  uint64_t v188 = v122 | 7;
  uint64_t v124 = swift_allocObject();
  *(_OWORD *)(v124 + 16) = v231;
  uint64_t v125 = v124 + v123;
  uint64_t v126 = sub_100004E64(&qword_100036D50);
  uint64_t v127 = *(void *)(v126 - 8);
  uint64_t v185 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v127 + 56);
  uint64_t v187 = (char *)(v127 + 56);
  v185(v125, 1, 1, v126);
  Publisher.prepend(_:)();
  swift_release();
  swift_bridgeObjectRelease();
  id v232 = (id)dispatch thunk of CAFOdometerObservable.$distanceKM.getter();
  Publisher.map<A>(_:)();
  long long v128 = (void *)Publisher.eraseToAnyPublisher()();
  ((void (*)(char *, uint64_t))v195)(v119, v120);
  swift_release();
  id v232 = v128;
  uint64_t v129 = swift_allocObject();
  *(_OWORD *)(v129 + 16) = v231;
  v185(v129 + v123, 1, 1, v126);
  uint64_t v130 = v177;
  Publisher.prepend(_:)();
  swift_release();
  swift_bridgeObjectRelease();
  sub_100006008(&qword_100037A20, &qword_100037828);
  sub_100006008(&qword_100037A28, &qword_100037818);
  sub_100006008(&qword_100037A30, &qword_100037808);
  Publishers.CombineLatest4.init(_:_:_:_:)();
  sub_100006008(&qword_100037A38, &qword_100037878);
  sub_100006008(&qword_100037A40, &qword_100037830);
  uint64_t v131 = v200;
  Publisher.combineLatest<A>(_:)();
  uint64_t v132 = v203;
  static NSRunLoop.SchedulerTimeType.Stride.milliseconds(_:)();
  v225 = (char *)self;
  id v133 = [v225 mainRunLoop];
  id v232 = v133;
  uint64_t v134 = sub_100006CB8(0, &qword_100037A48);
  sub_100006008(&qword_100037A50, &qword_1000377F0);
  unint64_t v135 = sub_10001ACB8();
  long long v136 = v205;
  uint64_t v137 = v202;
  *(void *)&long long v231 = v134;
  v226 = (char *)v135;
  Publisher.throttle<A>(for:scheduler:latest:)();

  (*(void (**)(char *, uint64_t))(v204 + 8))(v132, v206);
  (*(void (**)(char *, uint64_t))(v201 + 8))(v131, v137);
  swift_allocObject();
  swift_weakInit();
  sub_100006008(&qword_100037A60, &qword_1000377F8);
  uint64_t v138 = v208;
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v207 + 8))(v136, v138);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();
  id v232 = (id)dispatch thunk of CAFTripObservable.$showOdometer.getter();
  sub_100004E64(&qword_100037A68);
  sub_100004E64(&qword_100037A70);
  sub_100006008(&qword_100037A78, &qword_100037A68);
  uint64_t v139 = v210;
  Publisher.map<A>(_:)();
  sub_100006008(&qword_100037A80, &qword_1000377E0);
  uint64_t v140 = v212;
  uint64_t v141 = (void *)Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v211 + 8))(v139, v140);
  swift_release();
  id v232 = v141;
  sub_100004E64(&qword_100037A88);
  sub_100006008(&qword_100037A90, &qword_100037A88);
  unsigned __int8 v142 = v213;
  Publisher.prepend(_:)();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_100006008(&qword_100037A98, &qword_1000377E8);
  uint64_t v143 = v215;
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v214 + 8))(v142, v143);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();
  unsigned __int8 v144 = (void *)CAFTripObservable.observed.getter();
  id v145 = [v144 car];

  if (v145)
  {
    uint64_t v146 = CAFCar.dimesionObservable.getter();
  }
  else
  {
    uint64_t v146 = 0;
  }
  uint64_t v147 = OBJC_IVAR____TtC4Trip8TripCard_dimesionObservable;
  id v148 = *(void **)(v130 + OBJC_IVAR____TtC4Trip8TripCard_dimesionObservable);
  *(void *)(v130 + OBJC_IVAR____TtC4Trip8TripCard_dimesionObservable) = v146;

  uint64_t v149 = *(void **)(v130 + v147);
  if (v149)
  {
    id v150 = v149;
    dispatch thunk of CAFDimensionObservable.$measurementSystem.getter();
    dispatch thunk of CAFDimensionObservable.$currentLocale.getter();
    sub_100006008(&qword_100037AA0, &qword_1000377C8);
    sub_100006008(&qword_100037AA8, &qword_1000377C0);
    v151 = v162;
    Publishers.CombineLatest.init(_:_:)();
    id v232 = [v225 mainRunLoop];
    uint64_t v152 = type metadata accessor for NSRunLoop.SchedulerOptions();
    uint64_t v153 = (uint64_t)v168;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v152 - 8) + 56))(v168, 1, 1, v152);
    sub_100006008(&qword_100037AB0, &qword_1000377D0);
    uint64_t v154 = v165;
    uint64_t v155 = v164;
    Publisher.receive<A>(on:options:)();
    sub_10001AD90(v153);

    (*(void (**)(char *, uint64_t))(v163 + 8))(v151, v155);
    swift_allocObject();
    swift_weakInit();
    sub_100006008(&qword_100037AB8, &qword_1000377D8);
    uint64_t v156 = v167;
    Publisher<>.sink(receiveValue:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v166 + 8))(v154, v156);
    swift_beginAccess();
    AnyCancellable.store(in:)();
    swift_endAccess();

    swift_release();
  }
  sub_100015BD8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v216 + 8))(v228, v229);
  (*(void (**)(char *, uint64_t))(v209 + 8))(v230, v227);
  return v130;
}

uint64_t *sub_10001ACB0(uint64_t *result)
{
  return sub_100015A58(result);
}

unint64_t sub_10001ACB8()
{
  unint64_t result = qword_100037A58;
  if (!qword_100037A58)
  {
    sub_100006CB8(255, &qword_100037A48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100037A58);
  }
  return result;
}

uint64_t sub_10001AD20()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001AD58(uint64_t a1)
{
  return sub_100016CB4(a1, v1, (void (*)(void))sub_100015BD8);
}

uint64_t sub_10001AD88()
{
  return sub_100015B80();
}

uint64_t sub_10001AD90(uint64_t a1)
{
  uint64_t v2 = sub_100004E64(&qword_1000377B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001ADF0(uint64_t a1)
{
  return sub_100016D14(a1, v1, (void (*)(void))sub_100015BD8);
}

id sub_10001AE20(void *a1)
{
  id v1 = a1;
  uint64_t v2 = CAFFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_100031E88 table:@"Localizable"];

  return v3;
}

uint64_t sub_10001AE94(uint64_t a1)
{
  return sub_100016CB4(a1, v1, (void (*)(void))sub_100016D74);
}

uint64_t sub_10001AEC4(uint64_t a1)
{
  return sub_100016D14(a1, v1, (void (*)(void))sub_100016D74);
}

uint64_t sub_10001AF08()
{
  sub_10001B834();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  qword_100039410 = result;
  return result;
}

void sub_10001AF60()
{
  qword_100039418 = 0x63746177706F7473;
  unk_100039420 = 0xE900000000000068;
}

void sub_10001AF88()
{
  unk_100039436 = -4864;
}

void sub_10001AFB8()
{
  qword_100039438 = 0x6E616C2E64616F72;
  unk_100039440 = 0xEA00000000007365;
}

uint64_t sub_10001AFE0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001B0B4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000D008((uint64_t)v12, *a3);
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
      sub_10000D008((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000D064((uint64_t)v12);
  return v7;
}

uint64_t sub_10001B0B4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10001B270(a5, a6);
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

uint64_t sub_10001B270(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001B308(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001B4E8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001B4E8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001B308(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001B480(v2, 0);
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
        return _swiftEmptyArrayStorage;
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
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001B480(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  sub_100004E64(&qword_100037B00);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001B4E8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004E64(&qword_100037B00);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
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

uint64_t sub_10001B638(os_log_type_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  if (qword_1000367D0 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_100039410;
  uint64_t result = os_log_type_enabled((os_log_t)qword_100039410, a1);
  if (result)
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315650;
    swift_bridgeObjectRetain();
    sub_10001AFE0(a4, a5, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v12 + 12) = 2048;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v12 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_10001AFE0(a2, a3, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v10, a1, "%s: %ld  %s", (uint8_t *)v12, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    return swift_slowDealloc();
  }
  return result;
}

unint64_t sub_10001B834()
{
  unint64_t result = qword_100037B08;
  if (!qword_100037B08)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100037B08);
  }
  return result;
}

uint64_t destroy for TripView(uint64_t a1)
{
  sub_10000D450(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned char *)(a1 + 56));
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for TripView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  char v11 = *(unsigned char *)(a2 + 56);
  sub_10000D398(*(void *)a2, v5, v6, v7, v8, v9, v10, v11);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(unsigned char *)(a1 + 56) = v11;
  uint64_t v12 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v12;
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for TripView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  char v11 = *(unsigned char *)(a2 + 56);
  sub_10000D398(*(void *)a2, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  char v19 = *(unsigned char *)(a1 + 56);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(unsigned char *)(a1 + 56) = v11;
  sub_10000D450(v12, v13, v14, v15, v16, v17, v18, v19);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  return a1;
}

__n128 initializeWithTake for TripView(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(unsigned char *)(a1 + 96) = *((unsigned char *)a2 + 96);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for TripView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 48);
  char v5 = *(unsigned char *)(a2 + 56);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  char v13 = *(unsigned char *)(a1 + 56);
  long long v14 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v14;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = v4;
  *(unsigned char *)(a1 + 56) = v5;
  sub_10000D450(v6, v7, v8, v9, v10, v11, v12, v13);
  uint64_t v15 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v15;
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  return a1;
}

uint64_t getEnumTagSinglePayload for TripView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 97)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TripView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 96) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 97) = 1;
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
      *(void *)(result + 72) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 97) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TripView()
{
  return &type metadata for TripView;
}

uint64_t sub_10001BBEC()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_10001BC08()
{
  long long v6 = *(_OWORD *)(v0 + 64);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  __n128 result = (void *)sub_100013D9C((uint64_t)&v6);
  if (!(v5 >> 62))
  {
    uint64_t v2 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
  __n128 result = (void *)swift_bridgeObjectRelease();
  if (!v2) {
    goto LABEL_14;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((v5 & 0xC000000000000001) != 0)
      {
        uint64_t v4 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        uint64_t v4 = *(void *)(v5 + 8 * i + 32);
        swift_retain();
      }
      if (*(unsigned char *)(v4 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_dataType))
      {
        swift_release();
      }
      else
      {
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
      }
    }
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_10001BDB0()
{
  long long v9 = *(_OWORD *)(v0 + 64);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_100013D9C((uint64_t)&v9);
  if (!(v8 >> 62))
  {
    uint64_t v1 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v1) {
      goto LABEL_3;
    }
LABEL_16:
    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_19:
  swift_bridgeObjectRetain();
  uint64_t v1 = _CocoaArrayWrapper.endIndex.getter();
  if (!v1) {
    goto LABEL_16;
  }
LABEL_3:
  if ((v8 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    uint64_t v2 = *(void *)(v8 + 32);
    swift_retain();
  }
  if ((*(unsigned char *)(v2 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_dataType) & 1) == 0)
  {
    swift_release();
    if (v1 != 1)
    {
      uint64_t v3 = 5;
      while (1)
      {
        uint64_t v4 = v3 - 4;
        if ((v8 & 0xC000000000000001) != 0)
        {
          uint64_t v2 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          BOOL v5 = __OFADD__(v4, 1);
          uint64_t v6 = v3 - 3;
          if (v5) {
            goto LABEL_18;
          }
        }
        else
        {
          uint64_t v2 = *(void *)(v8 + 8 * v3);
          swift_retain();
          BOOL v5 = __OFADD__(v4, 1);
          uint64_t v6 = v3 - 3;
          if (v5)
          {
LABEL_18:
            __break(1u);
            goto LABEL_19;
          }
        }
        if (*(unsigned char *)(v2 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_dataType)) {
          goto LABEL_6;
        }
        swift_release();
        ++v3;
        if (v6 == v1) {
          goto LABEL_16;
        }
      }
    }
    goto LABEL_16;
  }
LABEL_6:
  swift_bridgeObjectRelease_n();
  return v2;
}

uint64_t sub_10001BF60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100004E64(&qword_100037B10);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)unint64_t v8 = static HorizontalAlignment.center.getter();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v9 = sub_100004E64(&qword_100037B18);
  sub_10001C060(a2, a1, (uint64_t)&v8[*(int *)(v9 + 44)]);
  sub_100014934((uint64_t)v8, a3, &qword_100037B10);
  uint64_t v10 = (void *)(a3 + *(int *)(sub_100004E64(&qword_100037B20) + 36));
  *uint64_t v10 = 0x7765695670697254;
  v10[1] = 0xE800000000000000;
  return sub_10000CF9C((uint64_t)v8, &qword_100037B10);
}

uint64_t sub_10001C060@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v74 = a2;
  uint64_t v84 = a3;
  uint64_t v78 = sub_100004E64(&qword_100037B28);
  uint64_t v4 = *(void *)(v78 - 8);
  __chkstk_darwin(v78);
  uint64_t v6 = (char *)&v74 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_100004E64(&qword_100037B30);
  __chkstk_darwin(v75);
  uint64_t v76 = (char *)&v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_100004E64(&qword_100037B38);
  __chkstk_darwin(v82);
  uint64_t v77 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_100004E64(&qword_100037B40);
  __chkstk_darwin(v79);
  uint64_t v81 = (uint64_t)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_100004E64(&qword_100037B48);
  __chkstk_darwin(v80);
  uint64_t v11 = (char *)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004E64(&qword_100037B50);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v83 = (uint64_t)&v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v85 = (uint64_t)&v74 - v15;
  long long v16 = *(_OWORD *)(a1 + 16);
  v120[0] = *(_OWORD *)a1;
  v120[1] = v16;
  v121[0] = *(_OWORD *)(a1 + 32);
  *(_OWORD *)((char *)v121 + 9) = *(_OWORD *)(a1 + 41);
  sub_100014318((uint64_t)v120, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v110);
  sub_100014318((uint64_t)v120, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  int v17 = LOBYTE(v110[0]);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (v17 && *(unsigned char *)(*(void *)(a1 + 72) + OBJC_IVAR____TtC4Trip9CardModel_showsTitle) == 1)
  {
    uint64_t v18 = static VerticalAlignment.center.getter();
    sub_10001D3C4((_OWORD *)a1, (uint64_t)v92);
    *(_OWORD *)&v109[119] = *(_OWORD *)&v92[112];
    *(_OWORD *)&v109[103] = *(_OWORD *)&v92[96];
    *(_OWORD *)&v109[55] = *(_OWORD *)&v92[48];
    *(_OWORD *)&v109[39] = *(_OWORD *)&v92[32];
    *(_OWORD *)&v109[135] = *(_OWORD *)&v92[128];
    *(_OWORD *)&v109[144] = *(_OWORD *)&v92[137];
    *(_OWORD *)&v109[71] = *(_OWORD *)&v92[64];
    *(_OWORD *)&v109[87] = *(_OWORD *)&v92[80];
    *(_OWORD *)&v109[7] = *(_OWORD *)v92;
    *(_OWORD *)&v109[23] = *(_OWORD *)&v92[16];
    *(_OWORD *)((char *)&v110[14] + 1) = *(_OWORD *)&v109[96];
    *(_OWORD *)((char *)&v110[16] + 1) = *(_OWORD *)&v109[112];
    *(_OWORD *)((char *)&v110[18] + 1) = *(_OWORD *)&v109[128];
    *(_OWORD *)((char *)&v110[20] + 1) = *(_OWORD *)&v92[137];
    *(_OWORD *)((char *)&v110[6] + 1) = *(_OWORD *)&v109[32];
    *(_OWORD *)((char *)&v110[8] + 1) = *(_OWORD *)&v109[48];
    *(_OWORD *)((char *)&v110[10] + 1) = *(_OWORD *)&v109[64];
    *(_OWORD *)((char *)&v110[12] + 1) = *(_OWORD *)&v109[80];
    *(_OWORD *)((char *)&v110[2] + 1) = *(_OWORD *)v109;
    v91[0] = 1;
    v110[0] = v18;
    v110[1] = 0;
    LOBYTE(v110[2]) = 1;
    *(_OWORD *)((char *)&v110[4] + 1) = *(_OWORD *)&v109[16];
    nullsub_1(v110);
  }
  else
  {
    sub_10001F1A4((uint64_t)v110);
  }
  sub_100014564((uint64_t)v110, (uint64_t)v122, &qword_100037B58);
  sub_100014318((uint64_t)v120, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v110);
  sub_100014318((uint64_t)v120, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  int v19 = LOBYTE(v110[0]);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v20 = swift_release();
  if (v19 != 2)
  {
    long long v119 = *(_OWORD *)(a1 + 64);
    if (*(unsigned char *)(*((void *)&v119 + 1) + OBJC_IVAR____TtC4Trip9CardModel_cardLayoutType) == 1)
    {
      unint64_t v27 = (unint64_t)sub_10001BC08();
      uint64_t v28 = v27 >> 62 ? _CocoaArrayWrapper.endIndex.getter() : *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v20 = swift_bridgeObjectRelease();
      if (v28 == 1)
      {
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        static Published.subscript.getter();
        swift_release();
        swift_release();
        uint64_t result = sub_100013D9C((uint64_t)&v119);
        uint64_t v30 = v110[0];
        if (v110[0] >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v34 = _CocoaArrayWrapper.endIndex.getter();
          uint64_t result = swift_bridgeObjectRelease();
          if (v34) {
            goto LABEL_13;
          }
        }
        else if (*(void *)((v110[0] & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_13:
          if ((v30 & 0xC000000000000001) != 0)
          {
            specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            if (!*(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              return result;
            }
            swift_retain();
          }
          swift_bridgeObjectRelease();
          uint64_t v31 = static VerticalAlignment.center.getter();
          uint64_t v32 = static HorizontalAlignment.center.getter();
          sub_10001DD54(a1, (uint64_t)v86);
          LOBYTE(v112[0]) = 1;
          *(_OWORD *)((char *)&v88[10] + 7) = v86[10];
          *(_OWORD *)((char *)&v88[11] + 7) = v86[11];
          *(_OWORD *)((char *)&v88[12] + 7) = v87[0];
          v88[13] = *(_OWORD *)((char *)v87 + 9);
          *(_OWORD *)((char *)&v88[6] + 7) = v86[6];
          *(_OWORD *)((char *)&v88[7] + 7) = v86[7];
          *(_OWORD *)((char *)&v88[8] + 7) = v86[8];
          *(_OWORD *)((char *)&v88[9] + 7) = v86[9];
          *(_OWORD *)((char *)&v88[2] + 7) = v86[2];
          *(_OWORD *)((char *)&v88[3] + 7) = v86[3];
          *(_OWORD *)((char *)&v88[4] + 7) = v86[4];
          *(_OWORD *)((char *)&v88[5] + 7) = v86[5];
          *(_OWORD *)((char *)v88 + 7) = v86[0];
          *(_OWORD *)((char *)&v88[1] + 7) = v86[1];
          v89[0] = v32;
          v89[1] = 0;
          v90[0] = 1;
          *(_OWORD *)&v90[161] = v88[10];
          *(_OWORD *)&v90[177] = v88[11];
          *(_OWORD *)&v90[193] = v88[12];
          *(_OWORD *)&v90[209] = *(_OWORD *)((char *)v87 + 9);
          *(_OWORD *)&v90[97] = v88[6];
          *(_OWORD *)&v90[113] = v88[7];
          *(_OWORD *)&v90[129] = v88[8];
          *(_OWORD *)&v90[145] = v88[9];
          *(_OWORD *)&v90[33] = v88[2];
          *(_OWORD *)&v90[49] = v88[3];
          *(_OWORD *)&v90[65] = v88[4];
          *(_OWORD *)&v90[81] = v88[5];
          *(_OWORD *)&v90[1] = v88[0];
          *(_OWORD *)&v90[17] = v88[1];
          *(_OWORD *)&v91[199] = *(_OWORD *)&v90[176];
          *(_OWORD *)&v91[215] = *(_OWORD *)&v90[192];
          *(_OWORD *)&v91[231] = *(_OWORD *)&v90[208];
          *(_OWORD *)&v91[135] = *(_OWORD *)&v90[112];
          *(_OWORD *)&v91[151] = *(_OWORD *)&v90[128];
          *(_OWORD *)&v91[167] = *(_OWORD *)&v90[144];
          *(_OWORD *)&v91[183] = *(_OWORD *)&v90[160];
          *(_OWORD *)&v91[71] = *(_OWORD *)&v90[48];
          *(_OWORD *)&v91[87] = *(_OWORD *)&v90[64];
          *(_OWORD *)&v91[103] = *(_OWORD *)&v90[80];
          *(_OWORD *)&v91[119] = *(_OWORD *)&v90[96];
          *(_OWORD *)&v91[7] = (unint64_t)v32;
          *(_OWORD *)&v91[23] = *(_OWORD *)v90;
          *(_OWORD *)&v91[39] = *(_OWORD *)&v90[16];
          *(_OWORD *)&v91[55] = *(_OWORD *)&v90[32];
          *(_OWORD *)&v92[201] = *(_OWORD *)&v91[192];
          *(_OWORD *)&v92[217] = *(_OWORD *)&v91[208];
          *(_OWORD *)&v92[233] = *(_OWORD *)&v91[224];
          *(_OWORD *)&v92[137] = *(_OWORD *)&v91[128];
          *(_OWORD *)&v92[153] = *(_OWORD *)&v91[144];
          *(_OWORD *)&v92[169] = *(_OWORD *)&v91[160];
          *(_OWORD *)&v92[185] = *(_OWORD *)&v91[176];
          *(_OWORD *)&v92[73] = *(_OWORD *)&v91[64];
          *(_OWORD *)&v92[89] = *(_OWORD *)&v91[80];
          *(_OWORD *)&v92[105] = *(_OWORD *)&v91[96];
          *(_OWORD *)&v92[121] = *(_OWORD *)&v91[112];
          *(_OWORD *)&v92[9] = *(_OWORD *)v91;
          *(_OWORD *)&v92[25] = *(_OWORD *)&v91[16];
          *(_OWORD *)&v92[41] = *(_OWORD *)&v91[32];
          *(_OWORD *)&v92[57] = *(_OWORD *)&v91[48];
          long long v105 = v88[10];
          long long v106 = v88[11];
          long long v107 = v88[12];
          long long v108 = *(_OWORD *)((char *)v87 + 9);
          long long v101 = v88[6];
          long long v102 = v88[7];
          long long v103 = v88[8];
          long long v104 = v88[9];
          long long v97 = v88[2];
          long long v98 = v88[3];
          long long v99 = v88[4];
          long long v100 = v88[5];
          long long v95 = v88[0];
          LOBYTE(v115[0]) = 1;
          v91[247] = BYTE8(v87[1]);
          LOBYTE(v113[0]) = 1;
          *(void *)unint64_t v92 = 0;
          v92[8] = 1;
          *(void *)&v92[249] = *(void *)&v91[240];
          *(void *)&v92[264] = 0;
          v92[272] = 1;
          v93[0] = v32;
          v93[1] = 0;
          char v94 = 1;
          long long v96 = v88[1];
          sub_10001F4F8((uint64_t)v89);
          sub_10001F540((uint64_t)v93);
          LOBYTE(v116[0]) = 1;
          memcpy(&v109[7], v92, 0x111uLL);
          v110[0] = v31;
          v110[1] = 0;
          LOBYTE(v110[2]) = 1;
          memcpy((char *)&v110[2] + 1, v109, 0x118uLL);
          memcpy(v76, v110, 0x129uLL);
          swift_storeEnumTagMultiPayload();
          sub_10001F588((uint64_t)v92);
          sub_10001F5D0((uint64_t)v110);
          sub_100004E64(&qword_100037B70);
          sub_100006008(&qword_100037B78, &qword_100037B70);
          sub_100006008(&qword_100037B80, &qword_100037B28);
          uint64_t v33 = (uint64_t)v77;
          _ConditionalContent<>.init(storage:)();
          swift_release();
          sub_10001F540((uint64_t)v89);
          sub_10001F540((uint64_t)v89);
          goto LABEL_21;
        }
        uint64_t v20 = swift_bridgeObjectRelease();
      }
    }
    __chkstk_darwin(v20);
    static Axis.Set.vertical.getter();
    sub_100004E64(&qword_100037B60);
    sub_100006008(&qword_100037B68, &qword_100037B60);
    ScrollView.init(_:showsIndicators:content:)();
    uint64_t v35 = v78;
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v76, v6, v78);
    swift_storeEnumTagMultiPayload();
    sub_100004E64(&qword_100037B70);
    sub_100006008(&qword_100037B78, &qword_100037B70);
    sub_100006008(&qword_100037B80, &qword_100037B28);
    uint64_t v33 = (uint64_t)v77;
    _ConditionalContent<>.init(storage:)();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v35);
LABEL_21:
    uint64_t v25 = &qword_100037B38;
    sub_100014934(v33, v81, &qword_100037B38);
    swift_storeEnumTagMultiPayload();
    sub_100006008(&qword_100037B88, &qword_100037B48);
    sub_10001F1D0();
    _ConditionalContent<>.init(storage:)();
    uint64_t v26 = v33;
    goto LABEL_22;
  }
  *(void *)uint64_t v11 = static HorizontalAlignment.leading.getter();
  *((void *)v11 + 1) = 0;
  v11[16] = 0;
  sub_100004E64(&qword_100037BB0);
  v86[0] = *(_OWORD *)(a1 + 64);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_100013D9C((uint64_t)v86);
  uint64_t v21 = swift_allocObject();
  long long v22 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v21 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v21 + 96) = v22;
  *(unsigned char *)(v21 + 112) = *(unsigned char *)(a1 + 96);
  long long v23 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v21 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v21 + 32) = v23;
  long long v24 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v21 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v21 + 64) = v24;
  sub_10001F148(a1);
  sub_100004E64((uint64_t *)&unk_100037270);
  type metadata accessor for UUID();
  sub_100004E64(&qword_100037BB8);
  sub_100006008(&qword_100037BC0, (uint64_t *)&unk_100037270);
  sub_10001F6A4(&qword_100037BC8, &qword_100037BB8, (void (*)(void))sub_10001F67C);
  sub_10001F778(&qword_100037BE8);
  ForEach<>.init(_:content:)();
  uint64_t v25 = &qword_100037B48;
  sub_100014934((uint64_t)v11, v81, &qword_100037B48);
  swift_storeEnumTagMultiPayload();
  sub_100006008(&qword_100037B88, &qword_100037B48);
  sub_10001F1D0();
  _ConditionalContent<>.init(storage:)();
  uint64_t v26 = (uint64_t)v11;
LABEL_22:
  sub_10000CF9C(v26, v25);
  if (sub_10001BDB0())
  {
    uint64_t KeyPath = swift_getKeyPath();
    type metadata accessor for CardCellConfiguration(0);
    sub_10001F778(&qword_100037BA8);
    swift_retain();
    uint64_t v37 = ObservedObject.init(wrappedValue:)();
    uint64_t v79 = v38;
    uint64_t v80 = v37;
    int v39 = static Edge.Set.leading.getter();
    sub_100014318((uint64_t)v120, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
    sub_1000225D4((uint64_t)v110);
    sub_100014318((uint64_t)v120, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
    uint64_t v40 = v110[4];
    uint64_t v41 = v110[5];
    uint64_t v42 = v110[6];
    uint64_t v82 = KeyPath;
    LODWORD(v81) = v39;
    if (LOBYTE(v110[0]))
    {
      if (LOBYTE(v110[0]) == 1)
      {
        uint64_t v43 = type metadata accessor for ClusterMetrics();
        id v44 = &off_100031A98;
        *(void *)&v92[32] = &off_100031A98;
        *(void *)&v92[24] = v43;
        *(void *)unint64_t v92 = v41;
      }
      else
      {
        uint64_t v43 = type metadata accessor for WidgetMetrics();
        id v44 = &off_100031A08;
        *(void *)&v92[32] = &off_100031A08;
        *(void *)&v92[24] = v43;
        *(void *)unint64_t v92 = v42;
      }
    }
    else
    {
      uint64_t v43 = type metadata accessor for ConsoleMetrics();
      id v44 = &off_100031B28;
      *(void *)&v92[32] = &off_100031B28;
      *(void *)&v92[24] = v43;
      *(void *)unint64_t v92 = v40;
    }
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    LODWORD(v78) = *(unsigned __int8 *)(a1 + 96);
    sub_10001435C(v92, v43);
    ((void (__cdecl *)())v44[4])();
    EdgeInsets.init(_all:)();
    uint64_t v46 = v45;
    uint64_t v48 = v47;
    uint64_t v50 = v49;
    uint64_t v52 = v51;
    unsigned __int8 v117 = 0;
    char v114 = 0;
    sub_10000D064((uint64_t)v92);
    int v53 = v117;
    v113[0] = v88[0];
    *(_DWORD *)((char *)v113 + 3) = *(_DWORD *)((char *)v88 + 3);
    v112[0] = v116[0];
    *(_DWORD *)((char *)v112 + 3) = *(_DWORD *)((char *)v116 + 3);
    v111[0] = v115[0];
    *(_DWORD *)((char *)v111 + 3) = *(_DWORD *)((char *)v115 + 3);
    char v54 = v114;
    int v55 = static Edge.Set.trailing.getter();
    sub_100014318((uint64_t)v120, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
    sub_1000225D4((uint64_t)v110);
    sub_100014318((uint64_t)v120, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
    uint64_t v56 = v110[4];
    uint64_t v57 = v110[5];
    uint64_t v58 = v110[6];
    LODWORD(v77) = v55;
    LODWORD(v76) = v53;
    if (LOBYTE(v110[0]))
    {
      if (LOBYTE(v110[0]) == 1)
      {
        uint64_t v59 = type metadata accessor for ClusterMetrics();
        uint64_t v60 = &off_100031A98;
        *(void *)&v91[32] = &off_100031A98;
        *(void *)&v91[24] = v59;
        *(void *)uint64_t v91 = v57;
      }
      else
      {
        uint64_t v59 = type metadata accessor for WidgetMetrics();
        uint64_t v60 = &off_100031A08;
        *(void *)&v91[32] = &off_100031A08;
        *(void *)&v91[24] = v59;
        *(void *)uint64_t v91 = v58;
      }
    }
    else
    {
      uint64_t v59 = type metadata accessor for ConsoleMetrics();
      uint64_t v60 = &off_100031B28;
      *(void *)&v91[32] = &off_100031B28;
      *(void *)&v91[24] = v59;
      *(void *)uint64_t v91 = v56;
    }
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    sub_10001435C(v91, v59);
    ((void (__cdecl *)())v60[4])();
    EdgeInsets.init(_all:)();
    uint64_t v62 = v61;
    uint64_t v64 = v63;
    uint64_t v66 = v65;
    uint64_t v68 = v67;
    swift_release();
    char v118 = 0;
    sub_10000D064((uint64_t)v91);
    *(_DWORD *)&v109[137] = v93[0];
    *(_DWORD *)&v109[140] = *(_DWORD *)((char *)v93 + 3);
    *(_DWORD *)&v109[145] = v89[0];
    *(_DWORD *)&v109[148] = *(_DWORD *)((char *)v89 + 3);
    *(void *)unint64_t v109 = v82;
    memset(&v109[8], 0, 48);
    v109[56] = (_BYTE)v76;
    *(_DWORD *)&v109[57] = v113[0];
    *(_DWORD *)&v109[60] = *(_DWORD *)((char *)v113 + 3);
    *(void *)&v109[64] = v80;
    *(void *)&v109[72] = v79;
    v109[80] = v78;
    *(_DWORD *)&v109[84] = *(_DWORD *)((char *)v112 + 3);
    *(_DWORD *)&v109[81] = v112[0];
    *(void *)&v109[88] = 0x3FF8000000000000;
    v109[96] = v81;
    *(_DWORD *)&v109[100] = *(_DWORD *)((char *)v111 + 3);
    *(_DWORD *)&v109[97] = v111[0];
    *(void *)&v109[104] = v46;
    *(void *)&v109[112] = v48;
    *(void *)&v109[120] = v50;
    *(void *)&v109[128] = v52;
    v109[136] = v54;
    v109[144] = (_BYTE)v77;
    *(void *)&v109[152] = v62;
    *(void *)&v109[160] = v64;
    *(void *)&v109[168] = v66;
    *(void *)&v109[176] = v68;
    v109[184] = v118;
    nullsub_1(v109);
  }
  else
  {
    sub_10001F294(v109);
  }
  sub_100014564((uint64_t)v109, (uint64_t)v110, &qword_100037B98);
  sub_100014564((uint64_t)v122, (uint64_t)v88, &qword_100037B58);
  uint64_t v69 = v85;
  uint64_t v70 = v83;
  sub_100014934(v85, v83, &qword_100037B50);
  sub_100014564((uint64_t)v110, (uint64_t)v91, &qword_100037B98);
  sub_100014564((uint64_t)v88, (uint64_t)v89, &qword_100037B58);
  uint64_t v71 = v84;
  sub_100014564((uint64_t)v89, v84, &qword_100037B58);
  uint64_t v72 = sub_100004E64(&qword_100037BA0);
  sub_100014934(v70, v71 + *(int *)(v72 + 48), &qword_100037B50);
  uint64_t v73 = v71 + *(int *)(v72 + 64);
  sub_100014564((uint64_t)v91, (uint64_t)v92, &qword_100037B98);
  sub_100014564((uint64_t)v92, v73, &qword_100037B98);
  sub_10001F420((uint64_t)v89, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_10001F2B8);
  sub_10001F358((uint64_t)v92, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_10001F30C);
  sub_10000CF9C(v69, &qword_100037B50);
  sub_100014564((uint64_t)v91, (uint64_t)v109, &qword_100037B98);
  sub_10001F358((uint64_t)v109, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_10001F3D4);
  sub_10000CF9C(v70, &qword_100037B50);
  sub_100014564((uint64_t)v88, (uint64_t)v93, &qword_100037B58);
  return sub_10001F420((uint64_t)v93, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_10001F494);
}

uint64_t sub_10001D3C4@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  long long v81 = a1[4];
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_100013D9C((uint64_t)&v81);
  sub_100014744();
  uint64_t v4 = Text.init<A>(_:)();
  uint64_t v6 = v5;
  char v45 = v7;
  long long v8 = a1[1];
  v79[0] = *a1;
  v79[1] = v8;
  v80[0] = a1[2];
  uint64_t v47 = a1;
  *(_OWORD *)((char *)v80 + 9) = *(_OWORD *)((char *)a1 + 41);
  sub_100014318((uint64_t)v79, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v56);
  sub_100014318((uint64_t)v79, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  uint64_t v9 = *(void *)&v56[32];
  uint64_t v10 = *(void *)&v56[40];
  uint64_t v11 = *(void *)&v56[48];
  if (v56[0])
  {
    if (v56[0] == 1)
    {
      uint64_t v12 = type metadata accessor for ClusterMetrics();
      uint64_t v13 = &off_100031A98;
      *(void *)&v56[24] = v12;
      *(void *)&v56[32] = &off_100031A98;
      *(void *)uint64_t v56 = v10;
    }
    else
    {
      uint64_t v12 = type metadata accessor for WidgetMetrics();
      uint64_t v13 = &off_100031A08;
      *(void *)&v56[24] = v12;
      *(void *)&v56[32] = &off_100031A08;
      *(void *)uint64_t v56 = v11;
    }
  }
  else
  {
    uint64_t v12 = type metadata accessor for ConsoleMetrics();
    uint64_t v13 = &off_100031B28;
    *(void *)&v56[24] = v12;
    *(void *)&v56[32] = &off_100031B28;
    *(void *)uint64_t v56 = v9;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v56, v12);
  ((void (__cdecl *)())v13[9])();
  char v14 = v45 & 1;
  uint64_t v15 = Text.font(_:)();
  uint64_t v44 = v16;
  uint64_t v46 = v15;
  char v42 = v17;
  uint64_t v43 = v18;
  sub_100014554(v4, v6, v14);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000D064((uint64_t)v56);
  sub_100014318((uint64_t)v79, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v56);
  sub_100014318((uint64_t)v79, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  uint64_t v19 = *(void *)&v56[32];
  uint64_t v20 = *(void *)&v56[40];
  uint64_t v21 = *(void *)&v56[48];
  if (v56[0])
  {
    if (v56[0] == 1)
    {
      uint64_t v22 = type metadata accessor for ClusterMetrics();
      long long v23 = &off_100031A98;
      *(void *)&v56[24] = v22;
      *(void *)&v56[32] = &off_100031A98;
      *(void *)uint64_t v56 = v20;
    }
    else
    {
      uint64_t v22 = type metadata accessor for WidgetMetrics();
      long long v23 = &off_100031A08;
      *(void *)&v56[24] = v22;
      *(void *)&v56[32] = &off_100031A08;
      *(void *)uint64_t v56 = v21;
    }
  }
  else
  {
    uint64_t v22 = type metadata accessor for ConsoleMetrics();
    long long v23 = &off_100031B28;
    *(void *)&v56[24] = v22;
    *(void *)&v56[32] = &off_100031B28;
    *(void *)uint64_t v56 = v19;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v56, v22);
  ((void (__cdecl *)())v23[1])();
  static Alignment.bottom.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v24 = v73;
  char v25 = v74;
  uint64_t v26 = v75;
  char v27 = v76;
  uint64_t v29 = v77;
  uint64_t v28 = v78;
  sub_10000D064((uint64_t)v56);
  char v30 = static Edge.Set.bottom.getter();
  *(_OWORD *)uint64_t v56 = v47[5];
  sub_100004E64(&qword_100036A38);
  State.wrappedValue.getter();
  EdgeInsets.init(_all:)();
  *(void *)&long long v48 = v46;
  *((void *)&v48 + 1) = v44;
  LOBYTE(v49) = v42 & 1;
  *((void *)&v49 + 1) = v43;
  *(void *)&long long v50 = v24;
  BYTE8(v50) = v25 & 1;
  *(void *)&long long v51 = v26;
  BYTE8(v51) = v27 & 1;
  *(void *)&long long v52 = v29;
  *((void *)&v52 + 1) = v28;
  LOBYTE(v53) = v30;
  *((void *)&v53 + 1) = v31;
  *(void *)char v54 = v32;
  *(void *)&v54[8] = v33;
  *(void *)&v54[16] = v34;
  v54[24] = 0;
  char v57 = 1;
  *(_OWORD *)&v56[55] = v51;
  *(_OWORD *)&v56[39] = v50;
  *(_OWORD *)&v56[23] = v49;
  *(_OWORD *)&v56[7] = v48;
  *(_OWORD *)&v56[112] = *(_OWORD *)&v54[9];
  *(_OWORD *)&v56[103] = *(_OWORD *)v54;
  *(_OWORD *)&v56[87] = v53;
  *(_OWORD *)&v56[71] = v52;
  char v55 = 1;
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  long long v35 = *(_OWORD *)v56;
  long long v36 = *(_OWORD *)&v56[16];
  long long v37 = *(_OWORD *)&v56[32];
  *(_OWORD *)(a2 + 57) = *(_OWORD *)&v56[48];
  *(_OWORD *)(a2 + 41) = v37;
  *(_OWORD *)(a2 + 25) = v36;
  *(_OWORD *)(a2 + 9) = v35;
  long long v38 = *(_OWORD *)&v56[64];
  long long v39 = *(_OWORD *)&v56[80];
  long long v40 = *(_OWORD *)&v56[96];
  *(_OWORD *)(a2 + 121) = *(_OWORD *)&v56[112];
  *(_OWORD *)(a2 + 105) = v40;
  *(_OWORD *)(a2 + 89) = v39;
  *(_OWORD *)(a2 + 73) = v38;
  *(void *)(a2 + 144) = 0;
  *(unsigned char *)(a2 + 152) = 1;
  v58[0] = v46;
  v58[1] = v44;
  char v59 = v42 & 1;
  uint64_t v60 = v43;
  uint64_t v61 = v24;
  char v62 = v25 & 1;
  uint64_t v63 = v26;
  char v64 = v27 & 1;
  uint64_t v65 = v29;
  uint64_t v66 = v28;
  char v67 = v30;
  uint64_t v68 = v31;
  uint64_t v69 = v32;
  uint64_t v70 = v33;
  uint64_t v71 = v34;
  char v72 = 0;
  sub_10001F7C4((uint64_t)&v48);
  return sub_10001F804((uint64_t)v58);
}

double sub_10001D8F4@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  type metadata accessor for CardCellConfiguration(0);
  sub_10001F778(&qword_100037BA8);
  swift_retain();
  uint64_t v4 = ObservedObject.init(wrappedValue:)();
  uint64_t v40 = v5;
  uint64_t v41 = v4;
  char v39 = static Edge.Set.leading.getter();
  long long v6 = *(_OWORD *)(a1 + 16);
  v62[0] = *(_OWORD *)a1;
  v62[1] = v6;
  v63[0] = *(_OWORD *)(a1 + 32);
  *(_OWORD *)((char *)v63 + 9) = *(_OWORD *)(a1 + 41);
  sub_100014318((uint64_t)v62, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v49);
  sub_100014318((uint64_t)v62, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  char v7 = v51;
  long long v8 = v52;
  uint64_t v9 = v53;
  if ((_BYTE)v49)
  {
    if (v49 == 1)
    {
      uint64_t v10 = type metadata accessor for ClusterMetrics();
      uint64_t v11 = &off_100031A98;
      uint64_t v47 = v10;
      long long v48 = &off_100031A98;
      v46[0] = v8;
    }
    else
    {
      uint64_t v10 = type metadata accessor for WidgetMetrics();
      uint64_t v11 = &off_100031A08;
      uint64_t v47 = v10;
      long long v48 = &off_100031A08;
      v46[0] = v9;
    }
  }
  else
  {
    uint64_t v10 = type metadata accessor for ConsoleMetrics();
    uint64_t v11 = &off_100031B28;
    uint64_t v47 = v10;
    long long v48 = &off_100031B28;
    v46[0] = v7;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  char v38 = *(unsigned char *)(a1 + 96);
  sub_10001435C(v46, v10);
  ((void (__cdecl *)())v11[4])();
  EdgeInsets.init(_all:)();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  char v58 = 0;
  char v54 = 0;
  sub_10000D064((uint64_t)v46);
  *(_DWORD *)char v45 = *(_DWORD *)v57;
  *(_DWORD *)&v45[3] = *(_DWORD *)&v57[3];
  *(_DWORD *)uint64_t v44 = *(_DWORD *)v56;
  *(_DWORD *)&v44[3] = *(_DWORD *)&v56[3];
  *(_DWORD *)uint64_t v43 = *(_DWORD *)v55;
  *(_DWORD *)&v43[3] = *(_DWORD *)&v55[3];
  char v36 = v54;
  char v37 = v58;
  char v20 = static Edge.Set.trailing.getter();
  sub_100014318((uint64_t)v62, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v49);
  sub_100014318((uint64_t)v62, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  uint64_t v22 = v51;
  uint64_t v21 = v52;
  long long v23 = v53;
  if ((_BYTE)v49)
  {
    if (v49 == 1)
    {
      uint64_t v24 = type metadata accessor for ClusterMetrics();
      char v25 = &off_100031A98;
      uint64_t v50 = v24;
      long long v51 = &off_100031A98;
      long long v49 = v21;
    }
    else
    {
      uint64_t v24 = type metadata accessor for WidgetMetrics();
      char v25 = &off_100031A08;
      uint64_t v50 = v24;
      long long v51 = &off_100031A08;
      long long v49 = v23;
    }
  }
  else
  {
    uint64_t v24 = type metadata accessor for ConsoleMetrics();
    char v25 = &off_100031B28;
    uint64_t v50 = v24;
    long long v51 = &off_100031B28;
    long long v49 = v22;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(&v49, v24);
  ((void (__cdecl *)())v25[4])();
  EdgeInsets.init(_all:)();
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  *(_DWORD *)(a2 + 57) = *(_DWORD *)v45;
  *(_DWORD *)(a2 + 60) = *(_DWORD *)&v45[3];
  *(_DWORD *)(a2 + 81) = *(_DWORD *)v44;
  *(_DWORD *)(a2 + 84) = *(_DWORD *)&v44[3];
  *(_DWORD *)(a2 + 97) = *(_DWORD *)v43;
  *(_DWORD *)(a2 + 100) = *(_DWORD *)&v43[3];
  char v59 = 0;
  sub_10000D064((uint64_t)&v49);
  *(_DWORD *)(a2 + 137) = *(_DWORD *)v61;
  *(_DWORD *)(a2 + 140) = *(_DWORD *)&v61[3];
  *(_DWORD *)(a2 + 145) = *(_DWORD *)v60;
  *(_DWORD *)(a2 + 148) = *(_DWORD *)&v60[3];
  char v34 = v59;
  *(void *)a2 = KeyPath;
  double result = 0.0;
  *(_OWORD *)(a2 + 8) = 0u;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(unsigned char *)(a2 + 56) = v37;
  *(void *)(a2 + 64) = v41;
  *(void *)(a2 + 72) = v40;
  *(unsigned char *)(a2 + 80) = v38;
  *(void *)(a2 + 88) = 0x3FF8000000000000;
  *(unsigned char *)(a2 + 96) = v39;
  *(void *)(a2 + 104) = v13;
  *(void *)(a2 + 112) = v15;
  *(void *)(a2 + 120) = v17;
  *(void *)(a2 + 128) = v19;
  *(unsigned char *)(a2 + 136) = v36;
  *(unsigned char *)(a2 + 144) = v20;
  *(void *)(a2 + 152) = v27;
  *(void *)(a2 + 160) = v29;
  *(void *)(a2 + 168) = v31;
  *(void *)(a2 + 176) = v33;
  *(unsigned char *)(a2 + 184) = v34;
  return result;
}

uint64_t sub_10001DD54@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  type metadata accessor for CardCellConfiguration(0);
  sub_10001F778(&qword_100037BA8);
  swift_retain();
  uint64_t v4 = ObservedObject.init(wrappedValue:)();
  uint64_t v50 = v5;
  uint64_t v51 = v4;
  char v49 = static Edge.Set.leading.getter();
  long long v6 = *(_OWORD *)(a1 + 16);
  v108[0] = *(_OWORD *)a1;
  v108[1] = v6;
  v109[0] = *(_OWORD *)(a1 + 32);
  *(_OWORD *)((char *)v109 + 9) = *(_OWORD *)(a1 + 41);
  sub_100014318((uint64_t)v108, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v63);
  sub_100014318((uint64_t)v108, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  uint64_t v7 = *(void *)&v63[32];
  uint64_t v8 = *(void *)&v63[40];
  uint64_t v9 = *(void *)&v63[48];
  if (v63[0])
  {
    if (v63[0] == 1)
    {
      uint64_t v10 = type metadata accessor for ClusterMetrics();
      uint64_t v11 = &off_100031A98;
      long long v99 = &off_100031A98;
      uint64_t v98 = v10;
      v97[0] = v8;
    }
    else
    {
      uint64_t v10 = type metadata accessor for WidgetMetrics();
      uint64_t v11 = &off_100031A08;
      long long v99 = &off_100031A08;
      uint64_t v98 = v10;
      v97[0] = v9;
    }
  }
  else
  {
    uint64_t v10 = type metadata accessor for ConsoleMetrics();
    uint64_t v11 = &off_100031B28;
    long long v99 = &off_100031B28;
    uint64_t v98 = v10;
    v97[0] = v7;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  char v48 = *(unsigned char *)(a1 + 96);
  sub_10001435C(v97, v10);
  ((void (__cdecl *)())v11[4])();
  EdgeInsets.init(_all:)();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  char v104 = 0;
  char v100 = 0;
  sub_10000D064((uint64_t)v97);
  v96[0] = *(_DWORD *)v103;
  *(_DWORD *)((char *)v96 + 3) = *(_DWORD *)&v103[3];
  v95[0] = *(_DWORD *)v102;
  *(_DWORD *)((char *)v95 + 3) = *(_DWORD *)&v102[3];
  v94[0] = *(_DWORD *)v101;
  *(_DWORD *)((char *)v94 + 3) = *(_DWORD *)&v101[3];
  char v46 = v100;
  char v47 = v104;
  char v45 = static Edge.Set.trailing.getter();
  sub_100014318((uint64_t)v108, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v63);
  sub_100014318((uint64_t)v108, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  uint64_t v21 = *(void *)&v63[32];
  uint64_t v20 = *(void *)&v63[40];
  uint64_t v22 = *(void *)&v63[48];
  if (v63[0])
  {
    if (v63[0] == 1)
    {
      uint64_t v23 = type metadata accessor for ClusterMetrics();
      uint64_t v24 = &off_100031A98;
      uint64_t v93 = &off_100031A98;
      uint64_t v92 = v23;
      v91[0] = v20;
    }
    else
    {
      uint64_t v23 = type metadata accessor for WidgetMetrics();
      uint64_t v24 = &off_100031A08;
      uint64_t v93 = &off_100031A08;
      uint64_t v92 = v23;
      v91[0] = v22;
    }
  }
  else
  {
    uint64_t v23 = type metadata accessor for ConsoleMetrics();
    uint64_t v24 = &off_100031B28;
    uint64_t v93 = &off_100031B28;
    uint64_t v92 = v23;
    v91[0] = v21;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v91, v23);
  ((void (__cdecl *)())v24[4])();
  EdgeInsets.init(_all:)();
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  char v105 = 0;
  sub_10000D064((uint64_t)v91);
  *(_DWORD *)uint64_t v83 = *(_DWORD *)v107;
  *(_DWORD *)&v83[3] = *(_DWORD *)&v107[3];
  *(_DWORD *)uint64_t v85 = *(_DWORD *)v106;
  *(_DWORD *)&_OWORD v85[3] = *(_DWORD *)&v106[3];
  char v33 = v105;
  *(void *)long long v53 = KeyPath;
  memset(&v53[8], 0, 48);
  v53[56] = v47;
  int v34 = v96[0];
  *(_DWORD *)&v53[57] = v96[0];
  *(_DWORD *)&v53[60] = *(_DWORD *)((char *)v96 + 3);
  *(void *)&long long v54 = v51;
  *((void *)&v54 + 1) = v50;
  LOBYTE(v55) = v48;
  DWORD1(v55) = *(_DWORD *)((char *)v95 + 3);
  int v35 = v95[0];
  *(_DWORD *)((char *)&v55 + 1) = v95[0];
  DWORD1(v56) = *(_DWORD *)((char *)v94 + 3);
  int v36 = v94[0];
  *(_DWORD *)((char *)&v56 + 1) = v94[0];
  *(_DWORD *)((char *)&v58 + 9) = *(_DWORD *)v107;
  HIDWORD(v58) = *(_DWORD *)&v107[3];
  *(_DWORD *)((char *)&v59 + 1) = *(_DWORD *)v106;
  *((void *)&v55 + 1) = 0x3FF8000000000000;
  LOBYTE(v56) = v49;
  *((void *)&v56 + 1) = v13;
  *(void *)&long long v57 = v15;
  *((void *)&v57 + 1) = v17;
  *(void *)&long long v58 = v19;
  BYTE8(v58) = v46;
  LOBYTE(v59) = v45;
  DWORD1(v59) = *(_DWORD *)&v106[3];
  *((void *)&v59 + 1) = v26;
  *(void *)uint64_t v60 = v28;
  *(void *)&v60[8] = v30;
  *(void *)&v60[16] = v32;
  v60[24] = v105;
  *(_DWORD *)(a2 + 201) = *(_DWORD *)v62;
  char v64 = 1;
  *(_OWORD *)&v63[55] = *(_OWORD *)&v53[48];
  *(_OWORD *)&v63[39] = *(_OWORD *)&v53[32];
  *(_OWORD *)&v63[23] = *(_OWORD *)&v53[16];
  *(_OWORD *)&unsigned char v63[7] = *(_OWORD *)v53;
  long long v37 = *(_OWORD *)&v60[9];
  *(_DWORD *)(a2 + 204) = *(_DWORD *)&v62[3];
  *(unsigned char *)(a2 + 8) = 1;
  *(_OWORD *)&v63[119] = v57;
  *(_OWORD *)&v63[103] = v56;
  *(_OWORD *)&v63[87] = v55;
  *(_OWORD *)&v63[71] = v54;
  *(_OWORD *)&v63[176] = v37;
  *(_OWORD *)&v63[167] = *(_OWORD *)v60;
  *(_OWORD *)&v63[151] = v59;
  *(_OWORD *)&v63[135] = v58;
  char v61 = 1;
  *(void *)a2 = 0;
  long long v38 = *(_OWORD *)&v63[144];
  *(_OWORD *)(a2 + 137) = *(_OWORD *)&v63[128];
  *(_OWORD *)(a2 + 153) = v38;
  long long v39 = *(_OWORD *)&v63[176];
  *(_OWORD *)(a2 + 169) = *(_OWORD *)&v63[160];
  *(_OWORD *)(a2 + 185) = v39;
  long long v40 = *(_OWORD *)&v63[80];
  *(_OWORD *)(a2 + 73) = *(_OWORD *)&v63[64];
  *(_OWORD *)(a2 + 89) = v40;
  long long v41 = *(_OWORD *)&v63[112];
  *(_OWORD *)(a2 + 105) = *(_OWORD *)&v63[96];
  *(_OWORD *)(a2 + 121) = v41;
  long long v42 = *(_OWORD *)&v63[16];
  *(_OWORD *)(a2 + 9) = *(_OWORD *)v63;
  *(_OWORD *)(a2 + 25) = v42;
  long long v43 = *(_OWORD *)&v63[48];
  *(_OWORD *)(a2 + 41) = *(_OWORD *)&v63[32];
  *(_OWORD *)(a2 + 57) = v43;
  *(void *)(a2 + 208) = 0;
  *(unsigned char *)(a2 + 216) = 1;
  uint64_t v65 = KeyPath;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  char v69 = v47;
  *(_DWORD *)uint64_t v70 = v34;
  *(_DWORD *)&v70[3] = *(_DWORD *)((char *)v96 + 3);
  uint64_t v71 = v51;
  uint64_t v72 = v50;
  char v73 = v48;
  *(_DWORD *)char v74 = v35;
  *(_DWORD *)&v74[3] = *(_DWORD *)((char *)v95 + 3);
  uint64_t v75 = 0x3FF8000000000000;
  char v76 = v49;
  *(_DWORD *)&v77[3] = *(_DWORD *)((char *)v94 + 3);
  *(_DWORD *)uint64_t v77 = v36;
  uint64_t v78 = v13;
  uint64_t v79 = v15;
  uint64_t v80 = v17;
  uint64_t v81 = v19;
  char v82 = v46;
  char v84 = v45;
  uint64_t v86 = v26;
  uint64_t v87 = v28;
  uint64_t v88 = v30;
  uint64_t v89 = v32;
  char v90 = v33;
  sub_10001F844((uint64_t)v53);
  return sub_10001F88C((uint64_t)&v65);
}

uint64_t sub_10001E35C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for GeometryProxy();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  *(void *)a3 = static HorizontalAlignment.leading.getter();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 0;
  sub_100004E64(&qword_100037BF0);
  v15[1] = sub_10001BC08();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 113) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  long long v11 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v10 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v10 + 96) = v11;
  *(unsigned char *)(v10 + 112) = *(unsigned char *)(a1 + 96);
  long long v12 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v10 + 32) = v12;
  long long v13 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v10 + 64) = v13;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  sub_10001F148(a1);
  sub_100004E64((uint64_t *)&unk_100037270);
  type metadata accessor for UUID();
  sub_100004E64(&qword_100037BF8);
  sub_100006008(&qword_100037BC0, (uint64_t *)&unk_100037270);
  sub_10001FA44();
  sub_10001F778(&qword_100037BE8);
  return ForEach<>.init(_:content:)();
}

uint64_t sub_10001E58C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v61 = a3;
  uint64_t v68 = type metadata accessor for GeometryProxy();
  uint64_t v66 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  uint64_t v60 = v7;
  uint64_t v65 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  uint64_t KeyPath = swift_getKeyPath();
  type metadata accessor for CardCellConfiguration(0);
  sub_10001F778(&qword_100037BA8);
  swift_retain();
  uint64_t v69 = v8;
  uint64_t v9 = ObservedObject.init(wrappedValue:)();
  uint64_t v63 = v10;
  uint64_t v64 = v9;
  int v62 = static Edge.Set.leading.getter();
  long long v11 = *(_OWORD *)(a2 + 16);
  v95[0] = *(_OWORD *)a2;
  v95[1] = v11;
  v96[0] = *(_OWORD *)(a2 + 32);
  *(_OWORD *)((char *)v96 + 9) = *(_OWORD *)(a2 + 41);
  sub_100014318((uint64_t)v95, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v82);
  sub_100014318((uint64_t)v95, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  long long v12 = v84;
  uint64_t v13 = v85;
  uint64_t v14 = v86;
  if (LOBYTE(v82[0]))
  {
    if (LOBYTE(v82[0]) == 1)
    {
      uint64_t v15 = type metadata accessor for ClusterMetrics();
      uint64_t v16 = &off_100031A98;
      uint64_t v80 = v15;
      uint64_t v81 = &off_100031A98;
      v79[0] = v13;
    }
    else
    {
      uint64_t v15 = type metadata accessor for WidgetMetrics();
      uint64_t v16 = &off_100031A08;
      uint64_t v80 = v15;
      uint64_t v81 = &off_100031A08;
      v79[0] = v14;
    }
  }
  else
  {
    uint64_t v15 = type metadata accessor for ConsoleMetrics();
    uint64_t v16 = &off_100031B28;
    uint64_t v80 = v15;
    uint64_t v81 = &off_100031B28;
    v79[0] = v12;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  int v59 = *(unsigned __int8 *)(a2 + 96);
  sub_10001435C(v79, v15);
  ((void (__cdecl *)())v16[4])();
  EdgeInsets.init(_all:)();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  unsigned __int8 v91 = 0;
  unsigned __int8 v87 = 0;
  sub_10000D064((uint64_t)v79);
  v78[0] = *(_DWORD *)v90;
  *(_DWORD *)((char *)v78 + 3) = *(_DWORD *)&v90[3];
  v77[0] = *(_DWORD *)v89;
  *(_DWORD *)((char *)v77 + 3) = *(_DWORD *)&v89[3];
  v76[0] = *(_DWORD *)v88;
  *(_DWORD *)((char *)v76 + 3) = *(_DWORD *)&v88[3];
  int v57 = v87;
  int v58 = v91;
  int v56 = static Edge.Set.trailing.getter();
  sub_100014318((uint64_t)v95, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)v82);
  sub_100014318((uint64_t)v95, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  uint64_t v25 = v84;
  uint64_t v26 = v85;
  uint64_t v27 = v86;
  if (LOBYTE(v82[0]))
  {
    if (LOBYTE(v82[0]) == 1)
    {
      uint64_t v28 = type metadata accessor for ClusterMetrics();
      uint64_t v29 = &off_100031A98;
      uint64_t v83 = v28;
      char v84 = &off_100031A98;
      v82[0] = v26;
    }
    else
    {
      uint64_t v28 = type metadata accessor for WidgetMetrics();
      uint64_t v29 = &off_100031A08;
      uint64_t v83 = v28;
      char v84 = &off_100031A08;
      v82[0] = v27;
    }
  }
  else
  {
    uint64_t v28 = type metadata accessor for ConsoleMetrics();
    uint64_t v29 = &off_100031B28;
    uint64_t v83 = v28;
    char v84 = &off_100031B28;
    v82[0] = v25;
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10001435C(v82, v28);
  ((void (__cdecl *)())v29[4])();
  EdgeInsets.init(_all:)();
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  v74[0] = v78[0];
  *(_DWORD *)((char *)v74 + 3) = *(_DWORD *)((char *)v78 + 3);
  v73[0] = v77[0];
  *(_DWORD *)((char *)v73 + 3) = *(_DWORD *)((char *)v77 + 3);
  v72[0] = v76[0];
  *(_DWORD *)((char *)v72 + 3) = *(_DWORD *)((char *)v76 + 3);
  char v92 = 0;
  sub_10000D064((uint64_t)v82);
  v71[0] = *(_DWORD *)v94;
  *(_DWORD *)((char *)v71 + 3) = *(_DWORD *)&v94[3];
  v70[0] = *(_DWORD *)v93;
  *(_DWORD *)((char *)v70 + 3) = *(_DWORD *)&v93[3];
  char v38 = v92;
  uint64_t v39 = static Alignment.center.getter();
  uint64_t v54 = v40;
  uint64_t v55 = v39;
  long long v42 = v65;
  uint64_t v41 = v66;
  uint64_t v43 = v68;
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v65, v61, v68);
  unint64_t v44 = (*(unsigned __int8 *)(v41 + 80) + 128) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  uint64_t v45 = swift_allocObject();
  long long v46 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v45 + 80) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v45 + 96) = v46;
  *(unsigned char *)(v45 + 112) = *(unsigned char *)(a2 + 96);
  long long v47 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v45 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v45 + 32) = v47;
  long long v48 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v45 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v45 + 64) = v48;
  *(void *)(v45 + 120) = v69;
  (*(void (**)(unint64_t, char *, uint64_t))(v41 + 32))(v45 + v44, v42, v43);
  *(_DWORD *)(a4 + 57) = v74[0];
  *(_DWORD *)(a4 + 60) = *(_DWORD *)((char *)v74 + 3);
  *(_DWORD *)(a4 + 81) = v73[0];
  *(_DWORD *)(a4 + 84) = *(_DWORD *)((char *)v73 + 3);
  *(_DWORD *)(a4 + 97) = v72[0];
  *(_DWORD *)(a4 + 100) = *(_DWORD *)((char *)v72 + 3);
  *(_DWORD *)(a4 + 140) = *(_DWORD *)((char *)v71 + 3);
  *(_DWORD *)(a4 + 137) = v71[0];
  int v49 = v70[0];
  *(_DWORD *)(a4 + 148) = *(_DWORD *)((char *)v70 + 3);
  *(_DWORD *)(a4 + 145) = v49;
  *(void *)a4 = KeyPath;
  *(_OWORD *)(a4 + 40) = 0u;
  *(_OWORD *)(a4 + 24) = 0u;
  *(_OWORD *)(a4 + 8) = 0u;
  *(unsigned char *)(a4 + 56) = v58;
  uint64_t v50 = v63;
  *(void *)(a4 + 64) = v64;
  *(void *)(a4 + 72) = v50;
  *(unsigned char *)(a4 + 80) = v59;
  *(void *)(a4 + 88) = 0x3FF8000000000000;
  *(unsigned char *)(a4 + 96) = v62;
  *(void *)(a4 + 104) = v18;
  *(void *)(a4 + 112) = v20;
  *(void *)(a4 + 120) = v22;
  *(void *)(a4 + 128) = v24;
  *(unsigned char *)(a4 + 136) = v57;
  *(unsigned char *)(a4 + 144) = v56;
  *(void *)(a4 + 152) = v31;
  *(void *)(a4 + 160) = v33;
  *(void *)(a4 + 168) = v35;
  *(void *)(a4 + 176) = v37;
  *(unsigned char *)(a4 + 184) = v38;
  *(_DWORD *)(a4 + 188) = *(_DWORD *)&v75[3];
  *(_DWORD *)(a4 + 185) = *(_DWORD *)v75;
  *(void *)(a4 + 192) = sub_10001FBFC;
  *(void *)(a4 + 200) = v45;
  uint64_t v51 = v54;
  *(void *)(a4 + 208) = v55;
  *(void *)(a4 + 216) = v51;
  swift_retain();
  return sub_10001F148(a2);
}

uint64_t sub_10001EBB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v26 = a4;
  uint64_t v28 = a3;
  uint64_t v8 = type metadata accessor for GeometryProxy();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = __chkstk_darwin(v8);
  long long v12 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v25 - v13;
  uint64_t v27 = static Color.clear.getter();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v15(v14, a1, v8);
  v15(v12, v26, v8);
  uint64_t v16 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v17 = (v16 + 128) & ~v16;
  uint64_t v18 = (v10 + v16 + v17) & ~v16;
  uint64_t v19 = swift_allocObject();
  long long v20 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v19 + 80) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v19 + 96) = v20;
  *(unsigned char *)(v19 + 112) = *(unsigned char *)(a2 + 96);
  long long v21 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v19 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v19 + 32) = v21;
  long long v22 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v19 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v19 + 64) = v22;
  *(void *)(v19 + 120) = v28;
  uint64_t v23 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
  v23(v19 + v17, v14, v8);
  v23(v19 + v18, v12, v8);
  *a5 = v27;
  a5[1] = (uint64_t)sub_10001FDA0;
  a5[2] = v19;
  a5[3] = 0;
  a5[4] = 0;
  sub_10001F148(a2);
  return swift_retain();
}

uint64_t sub_10001EDA0(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v24[1] = a4;
  v24[2] = a2;
  uint64_t v5 = type metadata accessor for NamedCoordinateSpace();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v9 = a1[1];
  v27[0] = *a1;
  v27[1] = v9;
  v28[0] = a1[2];
  *(_OWORD *)((char *)v28 + 9) = *(_OWORD *)((char *)a1 + 41);
  sub_100014318((uint64_t)v27, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v26);
  sub_100014318((uint64_t)v27, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  int v10 = v26;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if (v10)
  {
    *(void *)&long long v26 = 0x7765695670697254;
    *((void *)&v26 + 1) = 0xE800000000000000;
    static CoordinateSpaceProtocol<>.named<A>(_:)();
    GeometryProxy.frame<A>(in:)();
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v29.origin.x = v13;
    v29.origin.y = v15;
    v29.size.width = v17;
    v29.size.height = v19;
    double MaxY = CGRectGetMaxY(v29);
    GeometryProxy.size.getter();
    BOOL v22 = v21 < MaxY;
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v26) = v22;
    swift_retain();
    static Published.subscript.setter();
    long long v26 = a1[5];
    sub_100004E64(&qword_100036A38);
    State.wrappedValue.getter();
    if (v25)
    {
      char v23 = 1;
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      char v23 = v26;
    }
    long long v26 = a1[5];
    char v25 = v23;
    return State.wrappedValue.setter();
  }
  return result;
}

uint64_t sub_10001F0A4@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 80);
  v11[4] = *(_OWORD *)(v1 + 64);
  v11[5] = v3;
  char v12 = *(unsigned char *)(v1 + 96);
  long long v4 = *(_OWORD *)(v1 + 16);
  v11[0] = *(_OWORD *)v1;
  v11[1] = v4;
  long long v5 = *(_OWORD *)(v1 + 48);
  v11[2] = *(_OWORD *)(v1 + 32);
  v11[3] = v5;
  uint64_t v6 = swift_allocObject();
  long long v7 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v6 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v6 + 96) = v7;
  *(unsigned char *)(v6 + 112) = *(unsigned char *)(v1 + 96);
  long long v8 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v6 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v6 + 32) = v8;
  long long v9 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v6 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v6 + 64) = v9;
  *a1 = sub_10001F140;
  a1[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v6;
  return sub_10001F148((uint64_t)v11);
}

uint64_t sub_10001F140@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10001BF60(a1, v2 + 16, a2);
}

uint64_t sub_10001F148(uint64_t a1)
{
  return a1;
}

double sub_10001F1A4(uint64_t a1)
{
  *(unsigned char *)(a1 + 176) = 0;
  double result = 0.0;
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

uint64_t sub_10001F1C8@<X0>(uint64_t a1@<X8>)
{
  return sub_10001E35C(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_10001F1D0()
{
  unint64_t result = qword_100037B90;
  if (!qword_100037B90)
  {
    sub_100005E2C(&qword_100037B38);
    sub_100006008(&qword_100037B78, &qword_100037B70);
    sub_100006008(&qword_100037B80, &qword_100037B28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100037B90);
  }
  return result;
}

double sub_10001F294(_OWORD *a1)
{
  double result = 0.0;
  *(_OWORD *)((char *)a1 + 169) = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_10001F2B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  if (a9)
  {
    sub_100014470(a6, a7, a8 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10001F30C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10)
{
  if (a10)
  {
    sub_10000D398(result, a2, a3, a4, a5, a6, a7, a8 & 1);
    return swift_retain();
  }
  return result;
}

uint64_t sub_10001F358(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 184);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    v4);
  return a1;
}

uint64_t sub_10001F3D4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10)
{
  if (a10)
  {
    sub_10000D450(result, a2, a3, a4, a5, a6, a7, a8 & 1);
    return swift_release();
  }
  return result;
}

uint64_t sub_10001F420(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 176);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    v4);
  return a1;
}

uint64_t sub_10001F494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  if (a9)
  {
    sub_100014554(a6, a7, a8 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10001F4F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001F540(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001F588(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001F5D0(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001F61C()
{
  sub_10000D450(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(unsigned char *)(v0 + 72));
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 113, 7);
}

double sub_10001F674@<D0>(uint64_t a1@<X8>)
{
  return sub_10001D8F4(v1 + 16, a1);
}

uint64_t sub_10001F67C()
{
  return sub_10001F6A4(&qword_100037BD0, &qword_100037BD8, (void (*)(void))sub_10001F724);
}

uint64_t sub_10001F6A4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005E2C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001F724()
{
  unint64_t result = qword_100037BE0;
  if (!qword_100037BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100037BE0);
  }
  return result;
}

uint64_t sub_10001F778(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CardCellConfiguration(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001F7C4(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001F804(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001F844(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001F88C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001F8D4()
{
  uint64_t v1 = type metadata accessor for GeometryProxy();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 113) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  sub_10000D450(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(unsigned char *)(v0 + 72));
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001F9C0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for GeometryProxy() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 113) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_10001E58C(a1, v2 + 16, v6, a2);
}

unint64_t sub_10001FA44()
{
  unint64_t result = qword_100037C00;
  if (!qword_100037C00)
  {
    sub_100005E2C(&qword_100037BF8);
    sub_10001F6A4(&qword_100037BC8, &qword_100037BB8, (void (*)(void))sub_10001F67C);
    sub_100006008(&qword_100036A88, &qword_100036A90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100037C00);
  }
  return result;
}

uint64_t sub_10001FB08()
{
  uint64_t v1 = type metadata accessor for GeometryProxy();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 128) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  sub_10000D450(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(unsigned char *)(v0 + 72));
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001FBFC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for GeometryProxy() - 8);
  uint64_t v6 = *(void *)(v2 + 120);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 128) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_10001EBB4(a1, v2 + 16, v6, v7, a2);
}

uint64_t sub_10001FC84()
{
  uint64_t v1 = type metadata accessor for GeometryProxy();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 128) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = (v5 + v3 + v4) & ~v3;
  uint64_t v8 = v7 + v5;
  sub_10000D450(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(unsigned char *)(v0 + 72));
  swift_release();
  swift_release();
  swift_release();
  uint64_t v9 = v0 + v4;
  int v10 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v10(v9, v1);
  v10(v0 + v7, v1);

  return _swift_deallocObject(v0, v8, v6);
}

uint64_t sub_10001FDA0()
{
  uint64_t v1 = *(void *)(type metadata accessor for GeometryProxy() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 128) & ~v2;
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v5 = v0 + ((*(void *)(v1 + 64) + v2 + v3) & ~v2);

  return sub_10001EDA0((_OWORD *)(v0 + 16), v4, v0 + v3, v5);
}

uint64_t sub_10001FE3C()
{
  return sub_100006008(&qword_100037C08, &qword_100037C10);
}

uint64_t type metadata accessor for ConsoleMetrics()
{
  return self;
}

uint64_t sub_10001FE9C()
{
  *(_OWORD *)(v0 + 16) = xmmword_100026E70;
  *(_OWORD *)(v0 + 32) = xmmword_100026E80;
  *(_OWORD *)(v0 + 48) = xmmword_100026E90;
  *(_OWORD *)(v0 + 64) = xmmword_100026EA0;
  *(void *)(v0 + 80) = static Color.primary.getter();
  *(void *)(v0 + 88) = 0x4038000000000000;
  uint64_t v1 = self;
  id v2 = [v1 systemFontOfSize:34.0 weight:UIFontWeightMedium];
  id v3 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v4 = [v3 scaledFontForFont:v2];

  *(void *)(v0 + 96) = Font.init(_:)();
  id v5 = [v1 systemFontOfSize:34.0 weight:UIFontWeightMedium];
  id v6 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v7 = [v6 scaledFontForFont:v5];

  *(void *)(v0 + 104) = Font.init(_:)();
  id v8 = [v1 systemFontOfSize:20.0 weight:UIFontWeightMedium];
  id v9 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v10 = [v9 scaledFontForFont:v8];

  *(void *)(v0 + 112) = Font.init(_:)();
  *(void *)(v0 + 120) = static Color.primary.getter();
  id v11 = [v1 systemFontOfSize:14.0 weight:UIFontWeightRegular];
  id v12 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCaption1];
  id v13 = [v12 scaledFontForFont:v11];

  *(void *)(v0 + 128) = Font.init(_:)();
  id v14 = [self systemGrayColor];
  *(void *)(v0 + 136) = Color.init(uiColor:)();
  *(void *)(v0 + 144) = 0x4000000000000000;
  return v0;
}

double sub_10002012C()
{
  return 50.0;
}

double sub_100020138()
{
  return 44.0;
}

double sub_100020144()
{
  return 56.0;
}

double sub_100020150()
{
  return 24.0;
}

double sub_100020158()
{
  return 2.0;
}

uint64_t sub_100020160(uint64_t a1, uint64_t a2)
{
  return sub_10002082C(50.0, a1, a2, (double *)&UIFontWeightBold);
}

uint64_t sub_100020174(uint64_t a1, uint64_t a2)
{
  return sub_10002082C(34.0, a1, a2, (double *)&UIFontWeightSemibold);
}

uint64_t type metadata accessor for ClusterMetrics()
{
  return self;
}

uint64_t sub_1000201AC()
{
  *(_OWORD *)(v0 + 16) = xmmword_100026EB0;
  *(_OWORD *)(v0 + 32) = xmmword_100026EC0;
  *(_OWORD *)(v0 + 48) = xmmword_100026E90;
  *(_OWORD *)(v0 + 64) = xmmword_100026ED0;
  *(void *)(v0 + 80) = static Color.primary.getter();
  *(void *)(v0 + 88) = 0x4044000000000000;
  uint64_t v1 = self;
  id v2 = [v1 systemFontOfSize:74.0 weight:UIFontWeightBold];
  id v3 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v4 = [v3 scaledFontForFont:v2];

  *(void *)(v0 + 96) = Font.init(_:)();
  id v5 = [v1 systemFontOfSize:32.0 weight:UIFontWeightBold];
  id v6 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v7 = [v6 scaledFontForFont:v5];

  *(void *)(v0 + 104) = Font.init(_:)();
  id v8 = [v1 systemFontOfSize:32.0 weight:UIFontWeightBold];
  id v9 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v10 = [v9 scaledFontForFont:v8];

  *(void *)(v0 + 112) = Font.init(_:)();
  *(void *)(v0 + 120) = static Color.primary.getter();
  id v11 = [v1 systemFontOfSize:32.0 weight:UIFontWeightRegular];
  id v12 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCaption1];
  id v13 = [v12 scaledFontForFont:v11];

  *(void *)(v0 + 128) = Font.init(_:)();
  id v14 = [self systemGrayColor];
  *(void *)(v0 + 136) = Color.init(uiColor:)();
  *(void *)(v0 + 144) = 0x4010000000000000;
  return v0;
}

double sub_100020444()
{
  return 65.0;
}

double sub_100020454()
{
  return 88.0;
}

double sub_100020460()
{
  return 95.0;
}

double sub_100020470()
{
  return 84.0;
}

double sub_10002047C()
{
  return 40.0;
}

double sub_100020488()
{
  return 4.0;
}

uint64_t sub_100020490()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1000204E0()
{
  sub_100020490();

  return _swift_deallocClassInstance(v0, 152, 7);
}

uint64_t type metadata accessor for WidgetMetrics()
{
  return self;
}

uint64_t sub_100020538()
{
  *(_OWORD *)(v0 + 16) = xmmword_100026EE0;
  *(_OWORD *)(v0 + 32) = xmmword_100026E80;
  *(_OWORD *)(v0 + 48) = xmmword_100026EF0;
  *(_OWORD *)(v0 + 64) = xmmword_100026EE0;
  *(void *)(v0 + 80) = static Color.primary.getter();
  *(void *)(v0 + 88) = 0x4038000000000000;
  uint64_t v1 = self;
  id v2 = [v1 systemFontOfSize:34.0 weight:UIFontWeightMedium];
  id v3 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v4 = [v3 scaledFontForFont:v2];

  *(void *)(v0 + 96) = Font.init(_:)();
  id v5 = [v1 systemFontOfSize:16.0 weight:UIFontWeightSemibold];
  id v6 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleTitle1];
  id v7 = [v6 scaledFontForFont:v5];

  *(void *)(v0 + 104) = Font.init(_:)();
  id v8 = [v1 systemFontOfSize:16.0 weight:UIFontWeightSemibold];
  id v9 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v10 = [v9 scaledFontForFont:v8];

  *(void *)(v0 + 112) = Font.init(_:)();
  *(void *)(v0 + 120) = static Color.primary.getter();
  id v11 = [v1 systemFontOfSize:16.0 weight:UIFontWeightSemibold];
  id v12 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCaption1];
  id v13 = [v12 scaledFontForFont:v11];

  *(void *)(v0 + 128) = Font.init(_:)();
  id v14 = [self systemGrayColor];
  *(void *)(v0 + 136) = Color.init(uiColor:)();
  *(void *)(v0 + 144) = 0x4010000000000000;
  return v0;
}

double sub_1000207CC()
{
  return 20.0;
}

double sub_1000207D4()
{
  return *(double *)(*(void *)v0 + 40);
}

uint64_t sub_1000207E4()
{
  return swift_retain();
}

uint64_t sub_1000207F0()
{
  return swift_retain();
}

uint64_t sub_1000207FC()
{
  return swift_retain();
}

uint64_t sub_100020808()
{
  return swift_retain();
}

uint64_t sub_100020814()
{
  return swift_retain();
}

uint64_t sub_100020820()
{
  return swift_retain();
}

uint64_t sub_10002082C(double a1, uint64_t a2, uint64_t a3, double *a4)
{
  id v4 = [self systemFontOfSize:a1 weight:*a4];
  id v5 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleCallout];
  id v6 = [v5 scaledFontForFont:v4];

  return Font.init(_:)();
}

uint64_t sub_100020910()
{
  if (qword_1000367F0 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_10002096C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v38 = type metadata accessor for CarouselStyle();
  uint64_t v37 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  id v4 = (uint64_t *)((char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_100004E64(&qword_100037F30);
  __chkstk_darwin(v5);
  id v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_100004E64(&qword_100037F38);
  __chkstk_darwin(v43);
  uint64_t v41 = (uint64_t)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_100004E64(&qword_100037F40);
  uint64_t v36 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  id v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_100004E64(&qword_100037F48);
  uint64_t v45 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  unint64_t v44 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v53 = *(_OWORD *)(v1 + 64);
  id v12 = (void *)*((void *)&v53 + 1);
  swift_getKeyPath();
  swift_getKeyPath();
  id v13 = v12;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_1000225A8((uint64_t)&v53);
  if (*(void *)&v51[0] >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = *(void *)((*(void *)&v51[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v14)
  {
    uint64_t v40 = v5;
    uint64_t v39 = a1;
    long long v15 = *(_OWORD *)(v1 + 16);
    v51[0] = *(_OWORD *)v1;
    v51[1] = v15;
    v52[0] = *(_OWORD *)(v1 + 32);
    *(_OWORD *)((char *)v52 + 9) = *(_OWORD *)(v1 + 41);
    sub_100014318((uint64_t)v51, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
    sub_1000225D4((uint64_t)&v49);
    sub_100014318((uint64_t)v51, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
    int v16 = v49;
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    if (v16)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      id v17 = v13;
      static Published.subscript.getter();
      swift_release();
      swift_release();
      sub_1000225A8((uint64_t)&v53);
      if ((void)v49)
      {
        double v18 = (char *)v4 + *(int *)(sub_100004E64(&qword_100037F70) + 48);
        *id v4 = 0x4024000000000000;
        *(_OWORD *)double v18 = xmmword_1000270D0;
        *((void *)v18 + 2) = 0x3FFCCCCCCCCCCCCDLL;
        uint64_t v19 = enum case for PageControlPosition.innerTrailing(_:);
        uint64_t v20 = type metadata accessor for PageControlPosition();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104))(v18, v19, v20);
        (*(void (**)(void *, void, uint64_t))(v37 + 104))(v4, enum case for CarouselStyle.rectangular(_:), v38);
        uint64_t v21 = swift_allocObject();
        long long v22 = *(_OWORD *)(v1 + 80);
        *(_OWORD *)(v21 + 80) = *(_OWORD *)(v1 + 64);
        *(_OWORD *)(v21 + 96) = v22;
        *(unsigned char *)(v21 + 112) = *(unsigned char *)(v1 + 96);
        long long v23 = *(_OWORD *)(v1 + 16);
        *(_OWORD *)(v21 + 16) = *(_OWORD *)v1;
        *(_OWORD *)(v21 + 32) = v23;
        long long v24 = *(_OWORD *)(v1 + 48);
        *(_OWORD *)(v21 + 48) = *(_OWORD *)(v1 + 32);
        *(_OWORD *)(v21 + 64) = v24;
        sub_100022904(v1);
        sub_100022970();
        Carousel.init(model:style:content:)();
        uint64_t v25 = sub_100004E64(&qword_100037F50);
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v7, 0, 1, v25);
      }
      else
      {
        uint64_t v33 = sub_100004E64(&qword_100037F50);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v7, 1, 1, v33);
      }
      a1 = v39;
      uint64_t v27 = v46;
      uint64_t v28 = v45;
      sub_100014934((uint64_t)v7, v41, &qword_100037F30);
      swift_storeEnumTagMultiPayload();
      sub_100006008(&qword_100037F58, &qword_100037F40);
      sub_100022860();
      uint64_t v32 = (uint64_t)v44;
      _ConditionalContent<>.init(storage:)();
      sub_10000CF9C((uint64_t)v7, &qword_100037F30);
    }
    else
    {
      type metadata accessor for TripEnvironment();
      sub_100022D6C(&qword_100037F80, (void (*)(uint64_t))type metadata accessor for TripEnvironment);
      StateObject.projectedValue.getter();
      swift_getKeyPath();
      ObservedObject.Wrapper.subscript.getter();
      swift_release();
      uint64_t v29 = swift_release();
      long long v47 = v49;
      uint64_t v48 = v50;
      __chkstk_darwin(v29);
      *(&v35 - 2) = v1;
      sub_100004E64(&qword_100037F88);
      sub_1000229D4(&qword_100037F90, &qword_100037F88, (void (*)(void))sub_100022A40);
      TabView.init(selection:content:)();
      uint64_t v30 = v36;
      uint64_t v31 = v42;
      (*(void (**)(uint64_t, char *, uint64_t))(v36 + 16))(v41, v10, v42);
      swift_storeEnumTagMultiPayload();
      sub_100006008(&qword_100037F58, &qword_100037F40);
      sub_100022860();
      uint64_t v32 = (uint64_t)v44;
      _ConditionalContent<>.init(storage:)();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v31);
      a1 = v39;
      uint64_t v27 = v46;
      uint64_t v28 = v45;
    }
    sub_100014564(v32, a1, &qword_100037F48);
    uint64_t v26 = 0;
  }
  else
  {
    uint64_t v26 = 1;
    uint64_t v27 = v46;
    uint64_t v28 = v45;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 56))(a1, v26, 1, v27);
}

uint64_t sub_100021274(uint64_t a1)
{
  long long v8 = *(_OWORD *)(a1 + 64);
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = *((id *)&v8 + 1);
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_1000225A8((uint64_t)&v8);
  uint64_t v3 = swift_allocObject();
  long long v4 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v3 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v3 + 96) = v4;
  *(unsigned char *)(v3 + 112) = *(unsigned char *)(a1 + 96);
  long long v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v3 + 32) = v5;
  long long v6 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v3 + 64) = v6;
  sub_100022904(a1);
  sub_100004E64(&qword_100036D38);
  type metadata accessor for UUID();
  sub_100004E64(&qword_100037FA0);
  sub_100006008(&qword_100038010, &qword_100036D38);
  sub_100022A40();
  sub_100022D6C(&qword_100038018, (void (*)(uint64_t))type metadata accessor for CardModel);
  return ForEach<>.init(_:content:)();
}

uint64_t sub_100021428@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v57 = a3;
  uint64_t v56 = sub_100004E64(&qword_100037FC0) - 8;
  __chkstk_darwin(v56);
  uint64_t v55 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_100004E64(&qword_100037FC8);
  uint64_t v49 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  id v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_100004E64(&qword_100038020);
  uint64_t v51 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  long long v47 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_100004E64(&qword_100037FB0) - 8;
  __chkstk_darwin(v50);
  id v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_100004E64(&qword_100037FA0);
  __chkstk_darwin(v54);
  uint64_t v53 = (uint64_t)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *a1;
  long long v71 = *(_OWORD *)(a2 + 64);
  id v46 = (id)*((void *)&v71 + 1);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100022D38((uint64_t)&v71);
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_1000225A8((uint64_t)&v71);
  sub_100021C3C(v12, (unint64_t)v58);
  swift_bridgeObjectRelease();
  long long v13 = *(_OWORD *)(a2 + 16);
  v69[0] = *(_OWORD *)a2;
  v69[1] = v13;
  *(_OWORD *)uint64_t v70 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)&v70[9] = *(_OWORD *)(a2 + 41);
  sub_100014318((uint64_t)v69, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v58);
  sub_100014318((uint64_t)v69, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  int v58 = (ValueMetadata *)v59;
  *(void *)&long long v59 = *((void *)&v59 + 1);
  BYTE8(v59) = v60;
  sub_100004E64(&qword_100038028);
  Binding.wrappedValue.getter();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (v68) {
    char v14 = 0;
  }
  else {
    char v14 = 2;
  }
  uint64_t KeyPath = (ValueMetadata *)swift_getKeyPath();
  type metadata accessor for CardModel(0);
  sub_100022D6C(&qword_100038030, (void (*)(uint64_t))type metadata accessor for CardModel);
  uint64_t v16 = ObservedObject.init(wrappedValue:)();
  uint64_t v18 = v17;
  char v68 = 0;
  State.init(wrappedValue:)();
  char v19 = (char)v58;
  uint64_t v20 = v59;
  int v58 = KeyPath;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  char v62 = 0;
  uint64_t v63 = v16;
  uint64_t v64 = v18;
  char v65 = v19;
  uint64_t v66 = v20;
  char v67 = v14;
  uint64_t v21 = sub_100004E64(&qword_100037FD0);
  unint64_t v22 = sub_100022970();
  uint64_t v23 = sub_100006008(&qword_100037FD8, &qword_100037FD0);
  View.tabItem<A>(_:)();
  sub_10000D450((uint64_t)v58, v59, *((uint64_t *)&v59 + 1), v60, *((uint64_t *)&v60 + 1), v61, *((uint64_t *)&v61 + 1), v62);
  swift_release();
  swift_release();
  uint64_t v24 = swift_allocObject();
  long long v25 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v24 + 80) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v24 + 96) = v25;
  *(unsigned char *)(v24 + 112) = *(unsigned char *)(a2 + 96);
  long long v26 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v24 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v24 + 32) = v26;
  long long v27 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v24 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v24 + 64) = v27;
  *(void *)(v24 + 120) = v12;
  swift_retain();
  sub_100022904(a2);
  int v58 = &type metadata for TripView;
  *(void *)&long long v59 = v21;
  *((void *)&v59 + 1) = v22;
  *(void *)&long long v60 = v23;
  swift_getOpaqueTypeConformance2();
  uint64_t v28 = v47;
  uint64_t v29 = v48;
  View.onTapGesture(count:perform:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v7, v29);
  swift_getKeyPath();
  swift_getKeyPath();
  id v30 = v46;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_1000225A8((uint64_t)&v71);
  uint64_t v31 = sub_100021C3C(v12, (unint64_t)v58);
  char v33 = v32;
  swift_bridgeObjectRelease();
  if (v33) {
    uint64_t v34 = 0;
  }
  else {
    uint64_t v34 = v31;
  }
  uint64_t v35 = v51;
  uint64_t v36 = (uint64_t)v55;
  uint64_t v37 = v52;
  (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v55, v28, v52);
  uint64_t v38 = v36 + *(int *)(v56 + 44);
  *(void *)uint64_t v38 = v34;
  *(unsigned char *)(v38 + 8) = 0;
  sub_100014934(v36, (uint64_t)v10, &qword_100037FC0);
  uint64_t v39 = &v10[*(int *)(v50 + 44)];
  *(void *)uint64_t v39 = v34;
  *((_WORD *)v39 + 4) = 0;
  sub_10000CF9C(v36, &qword_100037FC0);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v28, v37);
  if (qword_1000367F8 != -1) {
    swift_once();
  }
  uint64_t v40 = qword_100039450;
  swift_retain();
  char v41 = static Edge.Set.all.getter();
  uint64_t v42 = v53;
  sub_100014934((uint64_t)v10, v53, &qword_100037FB0);
  uint64_t v43 = v42 + *(int *)(v54 + 36);
  *(void *)uint64_t v43 = v40;
  *(unsigned char *)(v43 + 8) = v41;
  sub_10000CF9C((uint64_t)v10, &qword_100037FB0);
  return sub_100014564(v42, v57, &qword_100037FA0);
}

uint64_t sub_100021C3C(uint64_t result, unint64_t a2)
{
  uint64_t v3 = result;
  if (a2 >> 62) {
    goto LABEL_21;
  }
  for (i = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10); i; unint64_t result = swift_bridgeObjectRelease())
  {
    if ((a2 & 0xC000000000000001) != 0)
    {
      specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else
    {
      if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return result;
      }
      swift_retain();
    }
    v3 += OBJC_IVAR____TtC4Trip9CardModel_id;
    char v5 = static UUID.== infix(_:_:)();
    swift_release();
    if (v5) {
      return 0;
    }
    for (uint64_t j = 0; ; ++j)
    {
      unint64_t v6 = j + 1;
      if (__OFADD__(j, 1)) {
        break;
      }
      if (v6 == i) {
        return 0;
      }
      if ((a2 & 0xC000000000000001) != 0)
      {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        if ((v6 & 0x8000000000000000) != 0) {
          goto LABEL_19;
        }
        if (v6 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_20;
        }
        swift_retain();
      }
      char v8 = static UUID.== infix(_:_:)();
      swift_release();
      if (v8) {
        return v6;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    swift_bridgeObjectRetain();
    uint64_t i = _CocoaArrayWrapper.endIndex.getter();
  }
  return 0;
}

uint64_t sub_100021DE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = Image.init(systemName:)();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_100014744();
  uint64_t v3 = Text.init<A>(_:)();
  uint64_t v5 = v4;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  char v7 = v6 & 1;
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = v6 & 1;
  *(void *)(a1 + 32) = v8;
  swift_retain();
  sub_100014470(v3, v5, v7);
  swift_bridgeObjectRetain();
  sub_100014554(v3, v5, v7);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100021F00(uint64_t a1, uint64_t a2)
{
  type metadata accessor for TripEnvironment();
  sub_100022D6C(&qword_100037F80, (void (*)(uint64_t))type metadata accessor for TripEnvironment);
  StateObject.wrappedValue.getter();
  long long v7 = *(_OWORD *)(a1 + 64);
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = *((id *)&v7 + 1);
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_1000225A8((uint64_t)&v7);
  sub_100021C3C(a2, v6);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  return static Published.subscript.setter();
}

double sub_100022054@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  long long v22 = a2[4];
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100022D38((uint64_t)&v22);
  static Published.subscript.getter();
  swift_release();
  swift_release();
  sub_1000225A8((uint64_t)&v22);
  sub_100021C3C(v5, *(unint64_t *)&v20[0]);
  swift_bridgeObjectRelease();
  long long v6 = a2[1];
  v20[0] = *a2;
  v20[1] = v6;
  v21[0] = a2[2];
  *(_OWORD *)((char *)v21 + 9) = *(_OWORD *)((char *)a2 + 41);
  sub_100014318((uint64_t)v20, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  sub_1000225D4((uint64_t)&v16);
  sub_100014318((uint64_t)v20, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
  uint64_t v16 = v17;
  uint64_t v17 = v18;
  LOBYTE(v18) = v19;
  sub_100004E64(&qword_100038028);
  Binding.wrappedValue.getter();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (v15) {
    char v7 = 0;
  }
  else {
    char v7 = 2;
  }
  uint64_t KeyPath = swift_getKeyPath();
  type metadata accessor for CardModel(0);
  sub_100022D6C(&qword_100038030, (void (*)(uint64_t))type metadata accessor for CardModel);
  uint64_t v9 = ObservedObject.init(wrappedValue:)();
  uint64_t v11 = v10;
  State.init(wrappedValue:)();
  char v12 = v16;
  uint64_t v13 = v17;
  *(void *)a3 = KeyPath;
  double result = 0.0;
  *(_OWORD *)(a3 + 8) = 0u;
  *(_OWORD *)(a3 + 24) = 0u;
  *(_OWORD *)(a3 + 40) = 0u;
  *(unsigned char *)(a3 + 56) = 0;
  *(void *)(a3 + 64) = v9;
  *(void *)(a3 + 72) = v11;
  *(unsigned char *)(a3 + 80) = v12;
  *(void *)(a3 + 88) = v13;
  *(unsigned char *)(a3 + 96) = v7;
  return result;
}

uint64_t sub_100022290@<X0>(uint64_t a1@<X8>)
{
  return sub_10002096C(a1);
}

uint64_t destroy for TripsTabView(uint64_t a1)
{
  sub_10000D450(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned char *)(a1 + 56));

  return sub_1000056B0();
}

uint64_t initializeWithCopy for TripsTabView(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  char v11 = *(unsigned char *)(a2 + 56);
  sub_10000D398(*(void *)a2, v5, v6, v7, v8, v9, v10, v11);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(unsigned char *)(a1 + 56) = v11;
  char v12 = *(void **)(v2 + 72);
  *(void *)(a1 + 64) = *(void *)(v2 + 64);
  *(void *)(a1 + 72) = v12;
  uint64_t v13 = *(void *)(v2 + 80);
  uint64_t v14 = *(void *)(v2 + 88);
  LOBYTE(v2) = *(unsigned char *)(v2 + 96);
  id v15 = v12;
  sub_100005664();
  *(void *)(a1 + 80) = v13;
  *(void *)(a1 + 88) = v14;
  *(unsigned char *)(a1 + 96) = v2;
  return a1;
}

uint64_t assignWithCopy for TripsTabView(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  char v11 = *(unsigned char *)(a2 + 56);
  sub_10000D398(*(void *)a2, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  char v19 = *(unsigned char *)(a1 + 56);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(unsigned char *)(a1 + 56) = v11;
  sub_10000D450(v12, v13, v14, v15, v16, v17, v18, v19);
  *(void *)(a1 + 64) = *(void *)(v2 + 64);
  uint64_t v20 = *(void **)(v2 + 72);
  uint64_t v21 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = v20;
  id v22 = v20;

  uint64_t v23 = *(void *)(v2 + 80);
  uint64_t v24 = *(void *)(v2 + 88);
  LOBYTE(v2) = *(unsigned char *)(v2 + 96);
  sub_100005664();
  *(void *)(a1 + 80) = v23;
  *(void *)(a1 + 88) = v24;
  *(unsigned char *)(a1 + 96) = v2;
  sub_1000056B0();
  return a1;
}

uint64_t assignWithTake for TripsTabView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 48);
  char v5 = *(unsigned char *)(a2 + 56);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  char v13 = *(unsigned char *)(a1 + 56);
  long long v14 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v14;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = v4;
  *(unsigned char *)(a1 + 56) = v5;
  sub_10000D450(v6, v7, v8, v9, v10, v11, v12, v13);
  uint64_t v15 = *(void *)(a2 + 72);
  uint64_t v16 = *(void **)(a1 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v15;

  char v17 = *(unsigned char *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(unsigned char *)(a1 + 96) = v17;
  sub_1000056B0();
  return a1;
}

ValueMetadata *type metadata accessor for TripsTabView()
{
  return &type metadata for TripsTabView;
}

uint64_t sub_100022584()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000225A8(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000225D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for EnvironmentValues();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)v1;
  if (*(unsigned char *)(v1 + 56) == 1)
  {
    uint64_t v8 = *(void *)(v1 + 48);
    char v9 = *(unsigned char *)(v1 + 24);
    uint64_t v11 = *(void *)(v1 + 8);
    uint64_t v10 = *(void *)(v1 + 16);
    *(unsigned char *)a1 = v7;
    *(void *)(a1 + 8) = v11;
    *(void *)(a1 + 16) = v10;
    *(unsigned char *)(a1 + 24) = v9 & 1;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 32);
    *(void *)(a1 + 48) = v8;
    return sub_100014318(v1, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
  }
  else
  {
    sub_100014318(v1, (void (*)(void, void, void, void, void, void, void, void))sub_10000D398);
    os_log_type_t v13 = static os_log_type_t.fault.getter();
    long long v14 = static Log.runtimeIssuesLog.getter();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v18[1] = v7;
      uint64_t v19 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v18[0] = v16 + 4;
      _OWORD v18[2] = sub_10001AFE0(0xD000000000000013, 0x80000001000283A0, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    sub_100014318(v1, (void (*)(void, void, void, void, void, void, void, void))sub_10000D450);
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

unint64_t sub_100022860()
{
  unint64_t result = qword_100037F60;
  if (!qword_100037F60)
  {
    sub_100005E2C(&qword_100037F30);
    sub_100006008(&qword_100037F68, &qword_100037F50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100037F60);
  }
  return result;
}

double sub_1000228FC@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100022054(a1, (_OWORD *)(v2 + 16), a2);
}

uint64_t sub_100022904(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 72);
  sub_10000D398(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned char *)(a1 + 56));
  id v3 = v2;
  sub_100005664();
  return a1;
}

unint64_t sub_100022970()
{
  unint64_t result = qword_100037F78;
  if (!qword_100037F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100037F78);
  }
  return result;
}

uint64_t sub_1000229CC()
{
  return sub_100021274(*(void *)(v0 + 16));
}

uint64_t sub_1000229D4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005E2C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100022A40()
{
  unint64_t result = qword_100037F98;
  if (!qword_100037F98)
  {
    sub_100005E2C(&qword_100037FA0);
    sub_100022AE0();
    sub_100006008(&qword_100038000, &qword_100038008);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100037F98);
  }
  return result;
}

unint64_t sub_100022AE0()
{
  unint64_t result = qword_100037FA8;
  if (!qword_100037FA8)
  {
    sub_100005E2C(&qword_100037FB0);
    sub_100022B80();
    sub_100006008(&qword_100037FF0, &qword_100037FF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100037FA8);
  }
  return result;
}

unint64_t sub_100022B80()
{
  unint64_t result = qword_100037FB8;
  if (!qword_100037FB8)
  {
    sub_100005E2C(&qword_100037FC0);
    sub_100005E2C(&qword_100037FC8);
    sub_100005E2C(&qword_100037FD0);
    sub_100022970();
    sub_100006008(&qword_100037FD8, &qword_100037FD0);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_100006008(&qword_100037FE0, &qword_100037FE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100037FB8);
  }
  return result;
}

uint64_t sub_100022CD4()
{
  sub_10000D450(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(unsigned char *)(v0 + 72));

  sub_1000056B0();

  return _swift_deallocObject(v0, 113, 7);
}

uint64_t sub_100022D30@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100021428(a1, v2 + 16, a2);
}

uint64_t sub_100022D38(uint64_t a1)
{
  id v2 = *(id *)(a1 + 8);
  return a1;
}

uint64_t sub_100022D6C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100022DB4@<X0>(uint64_t a1@<X8>)
{
  return sub_100021DE4(a1);
}

uint64_t sub_100022DBC()
{
  sub_10000D450(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(unsigned char *)(v0 + 72));

  sub_1000056B0();
  swift_release();

  return _swift_deallocObject(v0, 128, 7);
}

uint64_t sub_100022E20()
{
  return sub_100021F00(v0 + 16, *(void *)(v0 + 120));
}

uint64_t sub_100022E34()
{
  return sub_1000229D4(&qword_100038038, &qword_100038040, (void (*)(void))sub_100022E84);
}

unint64_t sub_100022E84()
{
  unint64_t result = qword_100038048;
  if (!qword_100038048)
  {
    sub_100005E2C(&qword_100037F48);
    sub_100006008(&qword_100037F58, &qword_100037F40);
    sub_100022860();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100038048);
  }
  return result;
}

uint64_t sub_100022F24@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100022FA4()
{
  return static Published.subscript.setter();
}

uint64_t sub_100023018()
{
  type metadata accessor for TripEnvironment();
  uint64_t v0 = swift_allocObject();
  uint64_t result = Published.init(initialValue:)();
  qword_100039448 = v0;
  return result;
}

uint64_t sub_10002307C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1000230F0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC4Trip15TripEnvironment__selectedTripIndex;
  uint64_t v2 = sub_100004E64(&qword_100038148);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_100023194()
{
  return type metadata accessor for TripEnvironment();
}

uint64_t type metadata accessor for TripEnvironment()
{
  uint64_t result = qword_100038080;
  if (!qword_100038080) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000231E8()
{
  sub_100023278();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100023278()
{
  if (!qword_100038090)
  {
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100038090);
    }
  }
}

uint64_t getEnumTagSinglePayload for TripPresentationMode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TripPresentationMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10002342CLL);
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

ValueMetadata *type metadata accessor for TripPresentationMode()
{
  return &type metadata for TripPresentationMode;
}

unint64_t sub_100023468()
{
  unint64_t result = qword_100038140;
  if (!qword_100038140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100038140);
  }
  return result;
}

uint64_t sub_1000234BC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for TripEnvironment();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t destroy for LayoutConfiguration()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for LayoutConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for LayoutConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for LayoutConfiguration(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for LayoutConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for LayoutConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LayoutConfiguration(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LayoutConfiguration()
{
  return &type metadata for LayoutConfiguration;
}

uint64_t *NSNotificationName.ClusterEvent.unsafeMutableAddressor()
{
  if (qword_100036808 != -1) {
    swift_once();
  }
  return &static NSNotificationName.ClusterEvent;
}

uint64_t sub_100023814()
{
  id v0 = [self secondarySystemGroupedBackgroundColor];
  uint64_t result = Color.init(_:)();
  qword_100039450 = result;
  return result;
}

uint64_t sub_100023854()
{
  static Binding.constant(_:)();
  type metadata accessor for ConsoleMetrics();
  swift_allocObject();
  uint64_t v0 = sub_10001FE9C();
  type metadata accessor for ClusterMetrics();
  swift_allocObject();
  uint64_t v1 = sub_1000201AC();
  type metadata accessor for WidgetMetrics();
  swift_allocObject();
  uint64_t result = sub_100020538();
  byte_100038150 = 1;
  qword_100038158 = v3;
  unk_100038160 = v4;
  byte_100038168 = v5;
  qword_100038170 = v0;
  unk_100038178 = v1;
  qword_100038180 = result;
  return result;
}

uint64_t sub_100023924@<X0>(uint64_t a1@<X8>)
{
  if (qword_100036800 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_100038158;
  uint64_t v3 = unk_100038160;
  char v4 = byte_100038168;
  uint64_t v5 = qword_100038170;
  uint64_t v6 = unk_100038178;
  uint64_t v7 = qword_100038180;
  *(unsigned char *)a1 = byte_100038150;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v7;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();

  return swift_retain();
}

__n128 sub_1000239E8@<Q0>(__n128 *a1@<X8>)
{
  sub_100005D60();
  EnvironmentValues.subscript.getter();
  __n128 result = v7;
  a1->n128_u8[0] = v3;
  a1->n128_u64[1] = v4;
  a1[1].n128_u64[0] = v5;
  a1[1].n128_u8[8] = v6;
  a1[2] = v7;
  a1[3].n128_u64[0] = v8;
  return result;
}

NSString sub_100023A54()
{
  NSString result = String._bridgeToObjectiveC()();
  static NSNotificationName.ClusterEvent = (uint64_t)result;
  return result;
}

id static NSNotificationName.ClusterEvent.getter()
{
  if (qword_100036808 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static NSNotificationName.ClusterEvent;

  return v0;
}

unsigned char *storeEnumTagSinglePayload for ClusterEventType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *NSString result = a2 + 4;
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
        JUMPOUT(0x100023BB8);
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
          *NSString result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ClusterEventType()
{
  return &type metadata for ClusterEventType;
}

unint64_t sub_100023BF4()
{
  unint64_t result = qword_100038188;
  if (!qword_100038188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100038188);
  }
  return result;
}

ValueMetadata *type metadata accessor for LayoutConfigurationKey()
{
  return &type metadata for LayoutConfigurationKey;
}

uint64_t sub_100023C58()
{
  sub_100024DBC();
  uint64_t result = NSString.init(stringLiteral:)();
  qword_100039460 = result;
  return result;
}

void sub_100023D30(void *a1)
{
  self;
  uint64_t v3 = swift_dynamicCastObjCClass();
  if (v3)
  {
    unsigned int v4 = (void *)v3;
    id v10 = a1;
    id v5 = [v4 _FBSScene];
    id v6 = [v5 settings];

    self;
    uint64_t v7 = swift_dynamicCastObjCClass();

    if (v7)
    {
      unint64_t v8 = *(void **)(v1 + OBJC_IVAR____TtC4Trip17TripSceneDelegate_clusterWindowManager);
      *(void *)(v1 + OBJC_IVAR____TtC4Trip17TripSceneDelegate_clusterWindowManager) = 0;

      if (qword_100036810 != -1) {
        swift_once();
      }
      [v4 _unregisterSceneActionsHandlerArray:qword_100039460];
    }
    else
    {
      char v9 = *(void **)(v1 + OBJC_IVAR____TtC4Trip17TripSceneDelegate_consoleWindowManager);
      *(void *)(v1 + OBJC_IVAR____TtC4Trip17TripSceneDelegate_consoleWindowManager) = 0;
    }
    if (qword_100036810 != -1) {
      swift_once();
    }
    [v10 _unregisterSceneActionsHandlerArray:qword_100039460];
  }
}

id sub_100023F88()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TripSceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for TripSceneDelegate()
{
  return self;
}

unint64_t sub_10002402C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004E64(&qword_100038290);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_100024CF8(v6, (uint64_t)v15);
    unint64_t result = sub_100024164((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_10000CFF8(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
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

unint64_t sub_100024164(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_1000241A8(a1, v4);
}

unint64_t sub_1000241A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100024D60(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10000CF48((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void sub_100024270(void *a1, id a2)
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
    sub_10001B638(v18, 0xD000000000000024, 0x80000001000285C0, 0xD00000000000001FLL, 0x80000001000285F0);
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

  objc_allocWithZone((Class)type metadata accessor for TripWindowManager());
  id v28 = v10;
  if (v21)
  {
    id v22 = sub_10000604C(v9, 1);
    uint64_t v23 = *(void **)(v3 + OBJC_IVAR____TtC4Trip17TripSceneDelegate_clusterWindowManager);
    *(void *)(v3 + OBJC_IVAR____TtC4Trip17TripSceneDelegate_clusterWindowManager) = v22;

    sub_100004E64(&qword_100036D60);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_100026620;
    *(void *)(v24 + 32) = [objc_allocWithZone((Class)CRSUIClusterPressBSActionsHandler) initWithDelegate:v3];
    specialized Array._endMutation()();
    sub_100004E64((uint64_t *)&unk_1000382B0);
    v25.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    if (qword_100036810 != -1) {
      swift_once();
    }
    [v9 _registerSceneActionsHandlerArray:v25.super.isa forKey:qword_100039460];
  }
  else
  {
    long long v26 = sub_10000604C(v9, 0);
    v25.super.Class isa = *(Class *)(v3 + OBJC_IVAR____TtC4Trip17TripSceneDelegate_consoleWindowManager);
    *(void *)(v3 + OBJC_IVAR____TtC4Trip17TripSceneDelegate_consoleWindowManager) = v26;
  }

  sub_100004E64(&qword_100036D60);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_100026620;
  *(void *)(v27 + 32) = [objc_allocWithZone((Class)CRSUIClusterPressBSActionsHandler) initWithDelegate:v3];
  specialized Array._endMutation()();
  sub_100004E64((uint64_t *)&unk_1000382B0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (qword_100036810 != -1) {
    swift_once();
  }
  [v28 _registerSceneActionsHandlerArray:isa forKey:qword_100039460];
}

void sub_100024688(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      os_log_type_t v1 = static os_log_type_t.info.getter();
      sub_10001B638(v1, 0xD000000000000020, 0x8000000100028590, 0xD00000000000001ALL, 0x80000001000284C0);
      id v2 = [self defaultCenter];
      if (qword_100036808 != -1) {
        swift_once();
      }
      uint64_t v3 = static NSNotificationName.ClusterEvent;
      sub_100004E64(&qword_100038288);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100026980;
      AnyHashable.init<A>(_:)();
      *(void *)(inited + 96) = &type metadata for ClusterEventType;
      *(unsigned char *)(inited + 72) = 0;
      goto LABEL_21;
    case 2:
      os_log_type_t v6 = static os_log_type_t.info.getter();
      sub_10001B638(v6, 0xD00000000000001ELL, 0x8000000100028570, 0xD00000000000001ALL, 0x80000001000284C0);
      id v2 = [self defaultCenter];
      if (qword_100036808 != -1) {
        swift_once();
      }
      uint64_t v3 = static NSNotificationName.ClusterEvent;
      sub_100004E64(&qword_100038288);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100026980;
      AnyHashable.init<A>(_:)();
      *(void *)(inited + 96) = &type metadata for ClusterEventType;
      char v7 = 1;
      goto LABEL_20;
    case 3:
      os_log_type_t v8 = static os_log_type_t.info.getter();
      sub_10001B638(v8, 0xD000000000000022, 0x8000000100028540, 0xD00000000000001ALL, 0x80000001000284C0);
      id v2 = [self defaultCenter];
      if (qword_100036808 != -1) {
        swift_once();
      }
      uint64_t v3 = static NSNotificationName.ClusterEvent;
      sub_100004E64(&qword_100038288);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100026980;
      AnyHashable.init<A>(_:)();
      *(void *)(inited + 96) = &type metadata for ClusterEventType;
      char v7 = 2;
      goto LABEL_20;
    case 4:
      os_log_type_t v9 = static os_log_type_t.info.getter();
      sub_10001B638(v9, 0xD000000000000024, 0x8000000100028510, 0xD00000000000001ALL, 0x80000001000284C0);
      id v2 = [self defaultCenter];
      if (qword_100036808 != -1) {
        swift_once();
      }
      uint64_t v3 = static NSNotificationName.ClusterEvent;
      sub_100004E64(&qword_100038288);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100026980;
      AnyHashable.init<A>(_:)();
      *(void *)(inited + 96) = &type metadata for ClusterEventType;
      char v7 = 3;
      goto LABEL_20;
    case 5:
      os_log_type_t v10 = static os_log_type_t.info.getter();
      sub_10001B638(v10, 0xD000000000000022, 0x80000001000284E0, 0xD00000000000001ALL, 0x80000001000284C0);
      id v2 = [self defaultCenter];
      if (qword_100036808 != -1) {
        swift_once();
      }
      uint64_t v3 = static NSNotificationName.ClusterEvent;
      sub_100004E64(&qword_100038288);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100026980;
      AnyHashable.init<A>(_:)();
      *(void *)(inited + 96) = &type metadata for ClusterEventType;
      char v7 = 4;
LABEL_20:
      *(unsigned char *)(inited + 72) = v7;
LABEL_21:
      sub_10002402C(inited);
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v2 postNotificationName:v3 object:0 userInfo:isa];

      break;
    default:
      os_log_type_t v5 = static os_log_type_t.info.getter();
      sub_10001B638(v5, 0xD000000000000021, 0x8000000100028490, 0xD00000000000001ALL, 0x80000001000284C0);
      break;
  }
}

uint64_t sub_100024CF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004E64(&qword_100038298);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100024D60(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_100024DBC()
{
  unint64_t result = qword_1000382A0;
  if (!qword_1000382A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000382A0);
  }
  return result;
}

uint64_t sub_100024DFC()
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

uint64_t dispatch thunk of CAFCarObservable.fuel.getter()
{
  return dispatch thunk of CAFCarObservable.fuel.getter();
}

uint64_t CAFCarObservable.observed.getter()
{
  return CAFCarObservable.observed.getter();
}

uint64_t type metadata accessor for CAFCarObservable()
{
  return type metadata accessor for CAFCarObservable();
}

uint64_t dispatch thunk of CAFTripObservable.averageSpeed.getter()
{
  return dispatch thunk of CAFTripObservable.averageSpeed.getter();
}

uint64_t dispatch thunk of CAFTripObservable.showOdometer.getter()
{
  return dispatch thunk of CAFTripObservable.showOdometer.getter();
}

uint64_t dispatch thunk of CAFTripObservable.$averageSpeed.getter()
{
  return dispatch thunk of CAFTripObservable.$averageSpeed.getter();
}

uint64_t dispatch thunk of CAFTripObservable.$showOdometer.getter()
{
  return dispatch thunk of CAFTripObservable.$showOdometer.getter();
}

uint64_t dispatch thunk of CAFTripObservable.fuelEfficiency.getter()
{
  return dispatch thunk of CAFTripObservable.fuelEfficiency.getter();
}

uint64_t dispatch thunk of CAFTripObservable.$fuelEfficiency.getter()
{
  return dispatch thunk of CAFTripObservable.$fuelEfficiency.getter();
}

uint64_t dispatch thunk of CAFTripObservable.energyEfficiency.getter()
{
  return dispatch thunk of CAFTripObservable.energyEfficiency.getter();
}

uint64_t dispatch thunk of CAFTripObservable.userVisibleLabel.getter()
{
  return dispatch thunk of CAFTripObservable.userVisibleLabel.getter();
}

uint64_t dispatch thunk of CAFTripObservable.$energyEfficiency.getter()
{
  return dispatch thunk of CAFTripObservable.$energyEfficiency.getter();
}

uint64_t dispatch thunk of CAFTripObservable.$userVisibleLabel.getter()
{
  return dispatch thunk of CAFTripObservable.$userVisibleLabel.getter();
}

uint64_t dispatch thunk of CAFTripObservable.energy.getter()
{
  return dispatch thunk of CAFTripObservable.energy.getter();
}

uint64_t dispatch thunk of CAFTripObservable.$energy.getter()
{
  return dispatch thunk of CAFTripObservable.$energy.getter();
}

uint64_t dispatch thunk of CAFTripObservable.distance.getter()
{
  return dispatch thunk of CAFTripObservable.distance.getter();
}

uint64_t dispatch thunk of CAFTripObservable.duration.getter()
{
  return dispatch thunk of CAFTripObservable.duration.getter();
}

uint64_t CAFTripObservable.observed.getter()
{
  return CAFTripObservable.observed.getter();
}

uint64_t dispatch thunk of CAFTripObservable.$distance.getter()
{
  return dispatch thunk of CAFTripObservable.$distance.getter();
}

uint64_t dispatch thunk of CAFTripObservable.$duration.getter()
{
  return dispatch thunk of CAFTripObservable.$duration.getter();
}

uint64_t dispatch thunk of CAFOdometerObservable.distanceKM.getter()
{
  return dispatch thunk of CAFOdometerObservable.distanceKM.getter();
}

uint64_t dispatch thunk of CAFOdometerObservable.$distanceKM.getter()
{
  return dispatch thunk of CAFOdometerObservable.$distanceKM.getter();
}

uint64_t dispatch thunk of CAFOdometerObservable.distanceMiles.getter()
{
  return dispatch thunk of CAFOdometerObservable.distanceMiles.getter();
}

uint64_t dispatch thunk of CAFOdometerObservable.$distanceMiles.getter()
{
  return dispatch thunk of CAFOdometerObservable.$distanceMiles.getter();
}

uint64_t CAFOdometerObservable.observed.getter()
{
  return CAFOdometerObservable.observed.getter();
}

uint64_t dispatch thunk of CAFDimensionObservable.$currentLocale.getter()
{
  return dispatch thunk of CAFDimensionObservable.$currentLocale.getter();
}

uint64_t dispatch thunk of CAFDimensionObservable.vehicleRangeUnit.getter()
{
  return dispatch thunk of CAFDimensionObservable.vehicleRangeUnit.getter();
}

uint64_t dispatch thunk of CAFDimensionObservable.vehicleSpeedUnit.getter()
{
  return dispatch thunk of CAFDimensionObservable.vehicleSpeedUnit.getter();
}

uint64_t dispatch thunk of CAFDimensionObservable.$measurementSystem.getter()
{
  return dispatch thunk of CAFDimensionObservable.$measurementSystem.getter();
}

uint64_t dispatch thunk of CAFDimensionObservable.vehicleFuelEfficiencyUnit.getter()
{
  return dispatch thunk of CAFDimensionObservable.vehicleFuelEfficiencyUnit.getter();
}

uint64_t dispatch thunk of CAFCarManagerObservable.$currentCar.getter()
{
  return dispatch thunk of CAFCarManagerObservable.$currentCar.getter();
}

uint64_t dispatch thunk of CAFFuelConsumptionObservable.fuelEfficiency.getter()
{
  return dispatch thunk of CAFFuelConsumptionObservable.fuelEfficiency.getter();
}

uint64_t dispatch thunk of CAFFuelConsumptionObservable.$fuelEfficiency.getter()
{
  return dispatch thunk of CAFFuelConsumptionObservable.$fuelEfficiency.getter();
}

uint64_t CAFFuelConsumptionObservable.observed.getter()
{
  return CAFFuelConsumptionObservable.observed.getter();
}

uint64_t Measurement<>.formattedString(maximumFractionDigits:)()
{
  return Measurement<>.formattedString(maximumFractionDigits:)();
}

uint64_t Measurement<>.toVehicleSpeedUnit(using:)()
{
  return Measurement<>.toVehicleSpeedUnit(using:)();
}

uint64_t Measurement<>.toVehicleRangeUnit(using:)()
{
  return Measurement<>.toVehicleRangeUnit(using:)();
}

uint64_t Measurement<>.toVehicleFuelEfficiencyUnit(using:)()
{
  return Measurement<>.toVehicleFuelEfficiencyUnit(using:)();
}

uint64_t Measurement.unit.getter()
{
  return Measurement.unit.getter();
}

uint64_t Measurement.init(value:unit:)()
{
  return Measurement.init(value:unit:)();
}

uint64_t Measurement.value.getter()
{
  return Measurement.value.getter();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Notification.userInfo.getter()
{
  return Notification.userInfo.getter();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t dispatch thunk of CarouselModel.activeItem.getter()
{
  return dispatch thunk of CarouselModel.activeItem.getter();
}

uint64_t dispatch thunk of CarouselModel.activeIndex.getter()
{
  return dispatch thunk of CarouselModel.activeIndex.getter();
}

uint64_t dispatch thunk of CarouselModel.itemWillAppear.setter()
{
  return dispatch thunk of CarouselModel.itemWillAppear.setter();
}

uint64_t dispatch thunk of CarouselModel.hideDecorations(after:)()
{
  return dispatch thunk of CarouselModel.hideDecorations(after:)();
}

uint64_t dispatch thunk of CarouselModel.showDecorations()()
{
  return dispatch thunk of CarouselModel.showDecorations()();
}

uint64_t CarouselModel.init(items:activeItem:alwaysHidesPlatter:platterVisibilityDuration:)()
{
  return CarouselModel.init(items:activeItem:alwaysHidesPlatter:platterVisibilityDuration:)();
}

uint64_t dispatch thunk of CarouselModel.items.getter()
{
  return dispatch thunk of CarouselModel.items.getter();
}

uint64_t dispatch thunk of CarouselModel.rotate(_:animated:)()
{
  return dispatch thunk of CarouselModel.rotate(_:animated:)();
}

uint64_t type metadata accessor for CarouselStyle()
{
  return type metadata accessor for CarouselStyle();
}

uint64_t type metadata accessor for PageControlPosition()
{
  return type metadata accessor for PageControlPosition();
}

uint64_t Carousel.init(model:style:content:)()
{
  return Carousel.init(model:style:content:)();
}

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
}

uint64_t Publishers.CombineLatest.init(_:_:)()
{
  return Publishers.CombineLatest.init(_:_:)();
}

uint64_t Publishers.CombineLatest4.init(_:_:_:_:)()
{
  return Publishers.CombineLatest4.init(_:_:_:_:)();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

uint64_t type metadata accessor for AnyCancellable()
{
  return type metadata accessor for AnyCancellable();
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

uint64_t Publisher.eraseToAnyPublisher()()
{
  return Publisher.eraseToAnyPublisher()();
}

uint64_t Publisher.combineLatest<A>(_:)()
{
  return Publisher.combineLatest<A>(_:)();
}

uint64_t Publisher.map<A>(_:)()
{
  return Publisher.map<A>(_:)();
}

uint64_t Publisher.prepend(_:)()
{
  return Publisher.prepend(_:)();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t Publisher.throttle<A>(for:scheduler:latest:)()
{
  return Publisher.throttle<A>(for:scheduler:latest:)();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t ScrollView.init(_:showsIndicators:content:)()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t StateObject.wrappedValue.getter()
{
  return StateObject.wrappedValue.getter();
}

uint64_t StateObject.projectedValue.getter()
{
  return StateObject.projectedValue.getter();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t GeometryProxy.size.getter()
{
  return GeometryProxy.size.getter();
}

uint64_t GeometryProxy.frame<A>(in:)()
{
  return GeometryProxy.frame<A>(in:)();
}

uint64_t type metadata accessor for GeometryProxy()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t static EnvironmentKey._valuesEqual(_:_:)()
{
  return static EnvironmentKey._valuesEqual(_:_:)();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t ObservedObject.Wrapper.subscript.getter()
{
  return ObservedObject.Wrapper.subscript.getter();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.multilineTextAlignment.getter()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t EnvironmentValues.multilineTextAlignment.setter()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t EnvironmentValues.subscript.getter()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t EnvironmentValues.subscript.setter()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
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

uint64_t type metadata accessor for NamedCoordinateSpace()
{
  return type metadata accessor for NamedCoordinateSpace();
}

uint64_t static CoordinateSpaceProtocol<>.named<A>(_:)()
{
  return static CoordinateSpaceProtocol<>.named<A>(_:)();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Axis.Set.vertical.getter()
{
  return static Axis.Set.vertical.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.bottom.getter()
{
  return static Edge.Set.bottom.getter();
}

uint64_t static Edge.Set.leading.getter()
{
  return static Edge.Set.leading.getter();
}

uint64_t static Edge.Set.trailing.getter()
{
  return static Edge.Set.trailing.getter();
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

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.onTapGesture(count:perform:)()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.tabItem<A>(_:)()
{
  return View.tabItem<A>(_:)();
}

uint64_t Color.init(uiColor:)()
{
  return Color.init(uiColor:)();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t static Color.primary.getter()
{
  return static Color.primary.getter();
}

uint64_t Color.init(_:)()
{
  return Color.init(_:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t Image.init(automakerSymbolName:)()
{
  return Image.init(automakerSymbolName:)();
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

uint64_t State.projectedValue.getter()
{
  return State.projectedValue.getter();
}

uint64_t Binding.wrappedValue.getter()
{
  return Binding.wrappedValue.getter();
}

uint64_t static Binding.constant(_:)()
{
  return static Binding.constant(_:)();
}

uint64_t Divider.init()()
{
  return Divider.init()();
}

uint64_t type metadata accessor for Divider()
{
  return type metadata accessor for Divider();
}

uint64_t ForEach<>.init(_:content:)()
{
  return ForEach<>.init(_:content:)();
}

uint64_t TabView.init(selection:content:)()
{
  return TabView.init(selection:content:)();
}

uint64_t static Alignment.bottom.getter()
{
  return static Alignment.bottom.getter();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
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

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
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

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t CAFCar.dimesionObservable.getter()
{
  return CAFCar.dimesionObservable.getter();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSString.init(stringLiteral:)()
{
  return NSString.init(stringLiteral:)();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerOptions()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t static NSRunLoop.SchedulerTimeType.Stride.milliseconds(_:)()
{
  return static NSRunLoop.SchedulerTimeType.Stride.milliseconds(_:)();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerTimeType.Stride()
{
  return type metadata accessor for NSRunLoop.SchedulerTimeType.Stride();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t Optional<A>.description.getter()
{
  return Optional<A>.description.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
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

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
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

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
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

uint64_t CAFFrameworkBundle()
{
  return _CAFFrameworkBundle();
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

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void exit(int a1)
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
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

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
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

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}