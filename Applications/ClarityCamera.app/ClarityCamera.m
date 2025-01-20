void type metadata accessor for UIInterfaceOrientation(uint64_t a1)
{
  sub_1000063B8(a1, &qword_1000313A8);
}

uint64_t sub_100004770@<X0>(uint64_t a1@<X8>)
{
  v2 = v1;
  uint64_t v30 = a1;
  uint64_t v27 = sub_1000068B8(&qword_100031418);
  __chkstk_darwin(v27);
  v4 = (uint64_t *)((char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_1000068B8(&qword_100031420);
  uint64_t v28 = *(void *)(v5 - 8);
  uint64_t v29 = v5;
  __chkstk_darwin(v5);
  v26 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000068B8(&qword_100031428);
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t *v4 = static Alignment.bottom.getter();
  v4[1] = v11;
  uint64_t v12 = sub_1000068B8(&qword_100031430);
  sub_100004B4C(v2, (uint64_t)v4 + *(int *)(v12 + 44));
  LocalizedStringKey.init(stringLiteral:)();
  *(void *)&long long v35 = Image.init(systemName:)();
  sub_100006D24(&qword_100031438, &qword_100031418);
  v13 = v26;
  View.navigationTitle<A>(_:icon:)();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000070C4((uint64_t)v4, &qword_100031418);
  long long v14 = *v2;
  long long v34 = v2[1];
  long long v35 = v14;
  long long v31 = v2[2];
  sub_100006E14((uint64_t)&v31, (uint64_t)v33, &qword_100031440);
  sub_100006E14((uint64_t)&v31 + 8, (uint64_t)v32, &qword_100031448);
  v15 = (uint64_t (*)())swift_allocObject();
  long long v16 = v2[1];
  *((_OWORD *)v15 + 1) = *v2;
  *((_OWORD *)v15 + 2) = v16;
  *((_OWORD *)v15 + 3) = v2[2];
  uint64_t v18 = v28;
  uint64_t v17 = v29;
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v10, v13, v29);
  v19 = (uint64_t (**)())&v10[*(int *)(v8 + 44)];
  *v19 = sub_100006948;
  v19[1] = v15;
  v19[2] = 0;
  v19[3] = 0;
  sub_100006950((uint64_t)&v35);
  sub_10000697C((uint64_t)&v34);
  sub_1000069A8((uint64_t)v33);
  sub_1000069A8((uint64_t)v32);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v13, v17);
  v20 = (_OWORD *)swift_allocObject();
  long long v21 = v2[1];
  v20[1] = *v2;
  v20[2] = v21;
  v20[3] = v2[2];
  uint64_t v22 = v30;
  sub_100006E78((uint64_t)v10, v30, &qword_100031428);
  v23 = (void *)(v22 + *(int *)(sub_1000068B8(&qword_100031450) + 36));
  void *v23 = 0;
  v23[1] = 0;
  v23[2] = sub_1000069D8;
  v23[3] = v20;
  sub_100006950((uint64_t)&v35);
  sub_10000697C((uint64_t)&v34);
  sub_1000069A8((uint64_t)v33);
  sub_1000069A8((uint64_t)v32);
  return sub_1000070C4((uint64_t)v10, &qword_100031428);
}

void sub_100004B4C(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for BorderedProminentButtonStyle();
  uint64_t v68 = *(void *)(v4 - 8);
  uint64_t v69 = v4;
  ((void (*)(void))__chkstk_darwin)();
  v67 = (char *)&KeyPath - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_1000068B8(&qword_100031460);
  uint64_t v6 = *(void *)(v61 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)&KeyPath - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000068B8(&qword_100031468);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v11 = (char *)&KeyPath - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_1000068B8(&qword_100031470);
  ((void (*)(void))__chkstk_darwin)();
  v13 = (char *)&KeyPath - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_1000068B8(&qword_100031478);
  uint64_t v63 = *(void *)(v64 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v59 = (char *)&KeyPath - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_1000068B8(&qword_100031480);
  uint64_t v15 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v66 = (uint64_t)&KeyPath - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  v19 = (char *)&KeyPath - v18;
  __chkstk_darwin(v17);
  uint64_t v65 = (uint64_t)&KeyPath - v20;
  uint64_t v57 = static Alignment.topTrailing.getter();
  uint64_t v56 = v21;
  long long v80 = *a1;
  id v60 = *((id *)&v80 + 1);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v54 = v70;
  int v53 = v71;
  uint64_t v52 = v72;
  int v51 = v73;
  uint64_t v50 = v74;
  uint64_t v49 = v75;
  uint64_t v48 = static Alignment.center.getter();
  uint64_t v47 = v22;
  long long v79 = a1[1];
  long long v76 = a1[1];
  sub_1000068B8(&qword_100031488);
  State.wrappedValue.getter();
  if (v78[0] == 1) {
    uint64_t v23 = static Color.black.getter();
  }
  else {
    uint64_t v23 = static Color.clear.getter();
  }
  uint64_t v55 = v23;
  uint64_t KeyPath = swift_getKeyPath();
  long long v76 = a1[2];
  sub_100006E14((uint64_t)&v76, (uint64_t)v78, &qword_100031440);
  sub_100006E14((uint64_t)&v76 + 8, (uint64_t)v77, &qword_100031448);
  v24 = (_OWORD *)swift_allocObject();
  long long v25 = a1[1];
  v24[1] = *a1;
  v24[2] = v25;
  v24[3] = a1[2];
  sub_100006950((uint64_t)&v80);
  sub_10000697C((uint64_t)&v79);
  sub_1000069A8((uint64_t)v78);
  sub_1000069A8((uint64_t)v77);
  sub_1000068B8(&qword_100031490);
  sub_100006D24(&qword_100031498, &qword_100031490);
  Button.init(action:label:)();
  uint64_t v26 = static Color.yellow.getter();
  uint64_t v27 = swift_getKeyPath();
  uint64_t v28 = v61;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v11, v8, v61);
  uint64_t v29 = (uint64_t *)&v11[*(int *)(v9 + 36)];
  *uint64_t v29 = v27;
  v29[1] = v26;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v28);
  sub_100006C60();
  View.accessibilityIdentifier(_:)();
  sub_1000070C4((uint64_t)v11, &qword_100031468);
  uint64_t v30 = v67;
  BorderedProminentButtonStyle.init()();
  sub_100006D68();
  sub_100006490(&qword_1000314D0, (void (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle);
  long long v31 = v59;
  uint64_t v32 = v69;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v30, v32);
  sub_1000070C4((uint64_t)v13, &qword_100031470);
  LOBYTE(v26) = static Edge.Set.all.getter();
  uint64_t v33 = v63;
  uint64_t v34 = v64;
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v19, v31, v64);
  long long v35 = &v19[*(int *)(v58 + 36)];
  *long long v35 = v26;
  *(_OWORD *)(v35 + 8) = 0u;
  *(_OWORD *)(v35 + 24) = 0u;
  v35[40] = 1;
  (*(void (**)(char *, uint64_t))(v33 + 8))(v31, v34);
  uint64_t v36 = v65;
  sub_100006E14((uint64_t)v19, v65, &qword_100031480);
  uint64_t v37 = v66;
  sub_100006E78(v36, v66, &qword_100031480);
  uint64_t v38 = v56;
  *(void *)a2 = v57;
  *(void *)(a2 + 8) = v38;
  v39 = v60;
  uint64_t v40 = v54;
  *(void *)(a2 + 16) = v60;
  *(void *)(a2 + 24) = v40;
  *(unsigned char *)(a2 + 32) = v53;
  *(void *)(a2 + 40) = v52;
  *(unsigned char *)(a2 + 48) = v51;
  uint64_t v41 = v49;
  *(void *)(a2 + 56) = v50;
  *(void *)(a2 + 64) = v41;
  uint64_t v42 = v55;
  *(void *)(a2 + 72) = KeyPath;
  *(void *)(a2 + 80) = v42;
  uint64_t v43 = v47;
  *(void *)(a2 + 88) = v48;
  *(void *)(a2 + 96) = v43;
  uint64_t v44 = sub_1000068B8(&qword_1000314D8);
  sub_100006E78(v37, a2 + *(int *)(v44 + 48), &qword_100031480);
  id v45 = v39;
  swift_retain();
  swift_retain();
  sub_1000070C4(v36, &qword_100031480);
  sub_1000070C4(v37, &qword_100031480);
  swift_release();
  swift_release();
}

uint64_t sub_100005330(long long *a1)
{
  sub_1000068B8(&qword_1000316D0);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v16 = a1[2];
  long long v17 = v16;
  sub_1000068B8(&qword_1000314F0);
  State.wrappedValue.getter();
  if ((void)v15)
  {
    sub_1000068B8(&qword_1000314F8);
    Task.cancel()();
    swift_release();
  }
  sub_100006E14((uint64_t)&v17, (uint64_t)v19, &qword_100031440);
  sub_100006E14((uint64_t)&v17 + 8, (uint64_t)v18, &qword_100031448);
  long long v16 = *a1;
  id v4 = *((id *)&v16 + 1);
  sub_10000B674();
  sub_100006BC8((uint64_t)&v16);
  long long v14 = a1[1];
  long long v15 = v14;
  LOBYTE(v13) = 1;
  sub_1000068B8(&qword_100031488);
  State.wrappedValue.setter();
  id v5 = [objc_allocWithZone((Class)UIImpactFeedbackGenerator) initWithStyle:1];
  [v5 impactOccurred];
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v3, 1, 1, v6);
  type metadata accessor for MainActor();
  sub_100006950((uint64_t)&v16);
  sub_10000697C((uint64_t)&v15);
  sub_1000069A8((uint64_t)v19);
  sub_1000069A8((uint64_t)v18);
  uint64_t v7 = static MainActor.shared.getter();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = &protocol witness table for MainActor;
  long long v9 = a1[1];
  *(_OWORD *)(v8 + 32) = *a1;
  *(_OWORD *)(v8 + 48) = v9;
  *(_OWORD *)(v8 + 64) = a1[2];
  uint64_t v10 = sub_100005924((uint64_t)v3, (uint64_t)&unk_100031508, v8);
  long long v14 = v17;
  uint64_t v13 = v10;
  sub_1000069A8((uint64_t)v19);
  sub_1000069A8((uint64_t)v18);
  swift_retain();
  State.wrappedValue.setter();
  swift_release();

  sub_100007098((uint64_t)v19);
  return sub_100007098((uint64_t)v18);
}

uint64_t sub_1000055D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  v4[3] = type metadata accessor for MainActor();
  v4[4] = static MainActor.shared.getter();
  id v5 = (void *)swift_task_alloc();
  v4[5] = v5;
  *id v5 = v4;
  v5[1] = sub_100005688;
  return static Task<>.sleep(nanoseconds:)(50000000);
}

uint64_t sub_100005688()
{
  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  if (v0) {
    id v4 = sub_1000058C0;
  }
  else {
    id v4 = sub_1000057E4;
  }
  return _swift_task_switch(v4, v3, v2);
}

uint64_t sub_1000057E4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_release();
  static Animation.spring(response:dampingFraction:blendDuration:)();
  *(void *)(swift_task_alloc() + 16) = v1;
  withAnimation<A>(_:_:)();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000058C0()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100005924(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for TaskPriority();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_1000070C4(a1, &qword_1000316D0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_100005AAC()
{
  sub_1000068B8(&qword_1000314E0);
  sub_100006EDC();

  return Label.init(title:icon:)();
}

uint64_t sub_100005B3C@<X0>(uint64_t a1@<X8>)
{
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v2 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  static Color.black.getter();
  uint64_t v7 = Text.foregroundColor(_:)();
  uint64_t v9 = v8;
  char v11 = v10;
  uint64_t v13 = v12;
  swift_release();
  sub_100006F7C(v2, v4, v6);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v9;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v13;
  return result;
}

uint64_t sub_100005C30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = Image.init(systemName:)();
  uint64_t v3 = static Color.black.getter();
  uint64_t result = swift_getKeyPath();
  *a1 = v2;
  a1[1] = result;
  a1[2] = v3;
  return result;
}

uint64_t sub_100005C98(long long *a1)
{
  long long v3 = *a1;
  id v1 = *((id *)&v3 + 1);
  sub_10000A17C();
  return sub_100006BC8((uint64_t)&v3);
}

uint64_t sub_100005CDC(long long *a1)
{
  uint64_t v2 = sub_1000068B8(&qword_1000316D0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v11 = *a1;
  char v5 = (void *)*((void *)&v11 + 1);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  type metadata accessor for MainActor();
  id v7 = v5;
  uint64_t v8 = static MainActor.shared.getter();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  sub_1000090D4((uint64_t)v4, (uint64_t)&unk_100031458, (uint64_t)v9);
  swift_release();
  return sub_100006BC8((uint64_t)&v11);
}

uint64_t sub_100005E18()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100005E34@<X0>(uint64_t a1@<X8>)
{
  return sub_100004770(a1);
}

uint64_t sub_100005E70(uint64_t a1, uint64_t a2)
{
  return sub_1000061E4(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100005E94(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100005F0C(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100005F8C@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100005FD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100006004@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10000604C(uint64_t a1)
{
  uint64_t v2 = sub_100006490(&qword_1000313F8, type metadata accessor for DeviceType);
  uint64_t v3 = sub_100006490(&qword_100031400, type metadata accessor for DeviceType);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100006108(uint64_t a1)
{
  uint64_t v2 = sub_100006490(&qword_100031408, type metadata accessor for AVVideoCodecType);
  uint64_t v3 = sub_100006490(&qword_100031410, type metadata accessor for AVVideoCodecType);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000061CC(uint64_t a1, uint64_t a2)
{
  return sub_1000061E4(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000061E4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100006228()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000627C()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000062F0()
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

void type metadata accessor for UIDeviceOrientation(uint64_t a1)
{
}

void type metadata accessor for DeviceType(uint64_t a1)
{
}

void type metadata accessor for AVVideoCodecType(uint64_t a1)
{
}

void sub_1000063B8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100006400()
{
  return sub_100006490(&qword_1000313C8, type metadata accessor for AVVideoCodecType);
}

uint64_t sub_100006448()
{
  return sub_100006490(&qword_1000313D0, type metadata accessor for AVVideoCodecType);
}

uint64_t sub_100006490(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000064D8()
{
  return sub_100006490(&qword_1000313D8, type metadata accessor for AVVideoCodecType);
}

uint64_t sub_100006520()
{
  return sub_100006490(&qword_1000313E0, type metadata accessor for DeviceType);
}

uint64_t sub_100006568()
{
  return sub_100006490(&qword_1000313E8, type metadata accessor for DeviceType);
}

uint64_t sub_1000065B0()
{
  return sub_100006490(&qword_1000313F0, type metadata accessor for DeviceType);
}

uint64_t initializeBufferWithCopyOfBuffer for CameraPhotoView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CameraPhotoView(uint64_t a1)
{
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for CameraPhotoView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  id v5 = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CameraPhotoView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  id v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for CameraPhotoView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CameraPhotoView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  id v5 = *(void **)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CameraPhotoView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CameraPhotoView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CameraPhotoView()
{
  return &type metadata for CameraPhotoView;
}

uint64_t sub_10000689C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000068B8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000068FC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006948()
{
  return sub_100005C98((long long *)(v0 + 16));
}

uint64_t sub_100006950(uint64_t a1)
{
  id v2 = *(id *)(a1 + 8);
  return a1;
}

uint64_t sub_10000697C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000069A8(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000069D8()
{
  return sub_100005CDC((long long *)(v0 + 16));
}

uint64_t sub_1000069E0()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100006A20(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *id v7 = v2;
  v7[1] = sub_100006AD4;
  return sub_10000C0D0(a1, v4, v5, v6);
}

uint64_t sub_100006AD4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006BC8(uint64_t a1)
{
  return a1;
}

uint64_t sub_100006C00()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100006C50()
{
  return sub_100005330((long long *)(v0 + 16));
}

unint64_t sub_100006C60()
{
  unint64_t result = qword_1000314A0;
  if (!qword_1000314A0)
  {
    sub_1000068FC(&qword_100031468);
    sub_100006D24(&qword_1000314A8, &qword_100031460);
    sub_100006D24(&qword_1000314B0, &qword_1000314B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000314A0);
  }
  return result;
}

uint64_t sub_100006D24(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000068FC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100006D68()
{
  unint64_t result = qword_1000314C0;
  if (!qword_1000314C0)
  {
    sub_1000068FC(&qword_100031470);
    sub_100006C60();
    sub_100006490((unint64_t *)&qword_1000314C8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000314C0);
  }
  return result;
}

uint64_t sub_100006E14(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000068B8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006E78(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000068B8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_100006EDC()
{
  unint64_t result = qword_1000314E8;
  if (!qword_1000314E8)
  {
    sub_1000068FC(&qword_1000314E0);
    sub_100006D24(&qword_1000314B0, &qword_1000314B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000314E8);
  }
  return result;
}

uint64_t sub_100006F7C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100006F8C()
{
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_100006FE4(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100006AD4;
  return sub_1000055D4(a1, v4, v5, v1 + 32);
}

uint64_t sub_100007098(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000070C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000068B8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100007120()
{
  return State.wrappedValue.setter();
}

unint64_t sub_10000717C()
{
  unint64_t result = qword_100031510;
  if (!qword_100031510)
  {
    sub_1000068FC(&qword_100031450);
    sub_1000071F8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031510);
  }
  return result;
}

unint64_t sub_1000071F8()
{
  unint64_t result = qword_100031518;
  if (!qword_100031518)
  {
    sub_1000068FC(&qword_100031428);
    sub_1000068FC(&qword_100031418);
    sub_100006D24(&qword_100031438, &qword_100031418);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031518);
  }
  return result;
}

char *sub_1000072F0()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for CameraModel());
  return sub_10000967C(2);
}

__n128 sub_100007324@<Q0>(__n128 *a1@<X8>)
{
  type metadata accessor for CameraModel();
  sub_1000075E4();
  StateObject.wrappedValue.getter();
  uint64_t v2 = ObservedObject.init(wrappedValue:)();
  unint64_t v4 = v3;
  State.init(wrappedValue:)();
  sub_1000068B8(&qword_100031440);
  State.init(wrappedValue:)();
  __n128 result = v6;
  a1->n128_u64[0] = v2;
  a1->n128_u64[1] = v4;
  a1[1].n128_u8[0] = v6.n128_u8[0];
  a1[1].n128_u64[1] = v6.n128_u64[1];
  a1[2] = v6;
  return result;
}

uint64_t sub_1000073FC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return _objc_retain_x1();
  }
  else {
    return swift_retain();
  }
}

uint64_t destroy for FrontCameraPhotoView(uint64_t a1)
{
  return sub_10000741C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_10000741C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return _objc_release_x1();
  }
  else {
    return swift_release();
  }
}

uint64_t _s13ClarityCamera20FrontCameraPhotoViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1000073FC(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for FrontCameraPhotoView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1000073FC(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_10000741C(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for FrontCameraPhotoView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for FrontCameraPhotoView(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_10000741C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for FrontCameraPhotoView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FrontCameraPhotoView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FrontCameraPhotoView()
{
  return &type metadata for FrontCameraPhotoView;
}

uint64_t sub_1000075C8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000075E4()
{
  unint64_t result = qword_100031520;
  if (!qword_100031520)
  {
    type metadata accessor for CameraModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031520);
  }
  return result;
}

unint64_t sub_100007640()
{
  unint64_t result = qword_100031528;
  if (!qword_100031528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031528);
  }
  return result;
}

char *sub_100007694()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for CameraModel());
  return sub_10000967C(0);
}

ValueMetadata *type metadata accessor for BackCameraPhotoView()
{
  return &type metadata for BackCameraPhotoView;
}

uint64_t sub_1000076D8()
{
  return swift_getOpaqueTypeConformance2();
}

char *sub_1000076F4()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for CameraModel());
  return sub_10000967C(3);
}

uint64_t sub_100007728@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CameraModel();
  sub_1000075E4();
  StateObject.wrappedValue.getter();
  uint64_t result = ObservedObject.init(wrappedValue:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

ValueMetadata *type metadata accessor for FrontCameraVideoView()
{
  return &type metadata for FrontCameraVideoView;
}

uint64_t sub_1000077AC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000077CC()
{
  unint64_t result = qword_100031530;
  if (!qword_100031530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031530);
  }
  return result;
}

uint64_t sub_100007820@<X0>(uint64_t a1@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v30 = sub_1000068B8(&qword_100031540);
  __chkstk_darwin(v30);
  uint64_t v28 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_1000068B8(&qword_100031548);
  uint64_t v25 = *(void *)(v29 - 8);
  uint64_t v2 = v25;
  uint64_t v3 = __chkstk_darwin(v29);
  uint64_t v27 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  char v6 = (char *)&v24 - v5;
  uint64_t v7 = sub_1000068B8(&qword_100031550);
  uint64_t v26 = *(void *)(v7 - 8);
  uint64_t v8 = v26;
  uint64_t v9 = __chkstk_darwin(v7);
  long long v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v24 - v12;
  sub_1000068B8(&qword_100031558);
  sub_100007E94();
  WindowGroup.init(id:title:lazyContent:)();
  v24 = v6;
  ClarityUIScene.init(content:)();
  long long v14 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v15 = v7;
  v14(v11, v13, v7);
  long long v16 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  long long v17 = v27;
  uint64_t v18 = v6;
  uint64_t v19 = v29;
  v16(v27, v18, v29);
  uint64_t v20 = v28;
  v14(v28, v11, v15);
  v16(&v20[*(int *)(v30 + 48)], v17, v19);
  _TupleScene.init(_:)();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v25 + 8);
  v21(v24, v19);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v26 + 8);
  v22(v13, v15);
  v21(v17, v19);
  return ((uint64_t (*)(char *, uint64_t))v22)(v11, v15);
}

uint64_t sub_100007B80(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ColorScheme();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_100007C48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000068B8(&qword_100031578);
  uint64_t v3 = v2 - 8;
  __chkstk_darwin(v2);
  uint64_t v5 = (uint64_t *)((char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for ColorScheme();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for ColorScheme.dark(_:), v6);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v5 + *(int *)(v3 + 36), v9, v6);
  *uint64_t v5 = KeyPath;
  sub_100007FB0((uint64_t)v5, a1);
  sub_100008018((uint64_t)v5);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100007E14()
{
  unint64_t result = qword_100031538;
  if (!qword_100031538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031538);
  }
  return result;
}

ValueMetadata *type metadata accessor for ClarityCameraApp()
{
  return &type metadata for ClarityCameraApp;
}

uint64_t sub_100007E78()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100007E94()
{
  unint64_t result = qword_100031560;
  if (!qword_100031560)
  {
    sub_1000068FC(&qword_100031558);
    sub_100007F34();
    sub_100006D24(&qword_100031570, &qword_100031578);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031560);
  }
  return result;
}

unint64_t sub_100007F34()
{
  unint64_t result = qword_100031568;
  if (!qword_100031568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031568);
  }
  return result;
}

uint64_t sub_100007F88()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100007FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068B8(&qword_100031578);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008018(uint64_t a1)
{
  uint64_t v2 = sub_1000068B8(&qword_100031578);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100008078()
{
  return sub_100006D24(&qword_100031580, &qword_100031588);
}

unint64_t sub_1000080B4(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 2:
    case 3:
      return result;
    default:
      unint64_t result = 0x656D61436B636162;
      break;
  }
  return result;
}

unint64_t sub_10000814C(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 2:
    case 3:
      return result;
    default:
      unint64_t result = 0x656D61436B636162;
      break;
  }
  return result;
}

uint64_t sub_1000081E4(char a1)
{
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
      char v2 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v2) {
        goto LABEL_9;
      }
      if (a1 != 1 && (a1 == 2 || 0x8000000100024DE0 == 0x8000000100024DC0)) {
        goto LABEL_8;
      }
      char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      uint64_t result = v5 & 1;
      break;
    default:
LABEL_8:
      swift_bridgeObjectRelease();
LABEL_9:
      uint64_t result = 1;
      break;
  }
  return result;
}

uint64_t sub_100008380(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x8000000100024DC0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000010;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x656D61436B636162;
      unint64_t v3 = 0xEF6F656469566172;
      break;
    case 2:
      break;
    case 3:
      unint64_t v3 = 0x8000000100024DE0;
      break;
    default:
      unint64_t v5 = 0x656D61436B636162;
      unint64_t v3 = 0xEF6F746F68506172;
      break;
  }
  unint64_t v6 = 0x8000000100024DC0;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x656D61436B636162;
      unint64_t v6 = 0xEF6F656469566172;
      goto LABEL_9;
    case 2:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0x8000000100024DE0;
      if (v5 == 0xD000000000000010) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
      unint64_t v6 = 0xEF6F746F68506172;
      if (v5 != 0x656D61436B636162) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_100008534(char a1)
{
  switch(a1)
  {
    case 1:
LABEL_6:
      swift_bridgeObjectRelease();
      return 1;
    default:
      char v2 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v2) {
        return 1;
      }
      BOOL v3 = 0x8000000100024DC0 == 0x8000000100024DE0;
      switch(a1)
      {
        case 2:
          goto LABEL_5;
        case 3:
          BOOL v3 = 1;
LABEL_5:
          if (v3) {
            goto LABEL_6;
          }
          goto LABEL_8;
        default:
LABEL_8:
          char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          uint64_t result = v5 & 1;
          break;
      }
      return result;
  }
}

uint64_t sub_100008710(char a1)
{
  BOOL v1 = 1;
  switch(a1)
  {
    case 2:
      goto LABEL_3;
    case 3:
      BOOL v1 = 0x8000000100024DE0 == 0x8000000100024DC0;
LABEL_3:
      if (!v1) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRelease();
      return 1;
    default:
LABEL_4:
      char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v3) {
        return 1;
      }
      BOOL v4 = 0x8000000100024DC0 == 0x8000000100024DE0;
      switch(a1)
      {
        case 2:
          goto LABEL_7;
        case 3:
          BOOL v4 = 1;
LABEL_7:
          if (v4) {
            goto LABEL_8;
          }
          goto LABEL_10;
        default:
LABEL_10:
          char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          uint64_t result = v6 & 1;
          break;
      }
      return result;
  }
}

uint64_t sub_1000088EC(unsigned __int8 *a1, char *a2)
{
  return sub_100008380(*a1, *a2);
}

Swift::Int sub_1000088F8()
{
  return sub_100008900();
}

Swift::Int sub_100008900()
{
  return Hasher._finalize()();
}

uint64_t sub_1000089EC()
{
  return sub_1000089F4();
}

uint64_t sub_1000089F4()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100008AC0()
{
  return sub_100008AC8();
}

Swift::Int sub_100008AC8()
{
  return Hasher._finalize()();
}

unint64_t sub_100008BB0@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10000D84C(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_100008BE0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10000814C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100008C0C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1000080B4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100008C38()
{
  return sub_100009610();
}

void sub_100008C4C(char a1)
{
  int v2 = a1 & 1;
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (LOBYTE(v6[0]) != v2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v6[0]) = 0;
    char v3 = v1;
    static Published.subscript.setter();
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    [*(id *)&v3[OBJC_IVAR____TtC13ClarityCamera11CameraModel_videoOutput] stopRecording];
    uint64_t v4 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v6[4] = sub_10000DC78;
    v6[5] = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_100009280;
    v6[3] = &unk_10002DE28;
    char v5 = _Block_copy(v6);
    swift_release();
    AudioServicesPlaySystemSoundWithCompletion(0x45Eu, v5);
    _Block_release(v5);
  }
}

uint64_t sub_100008EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a4;
  type metadata accessor for MainActor();
  *(void *)(v4 + 48) = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100008F44, v6, v5);
}

uint64_t sub_100008F44()
{
  swift_release();
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    AudioServicesDisposeSystemSoundID(0x45Du);
    sub_10000BBF4();
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 56) = 1;
    static Published.subscript.setter();
  }
  else
  {
    if (qword_1000313A0 != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    sub_10000D898(v1, (uint64_t)qword_100033BA8);
    int v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Unable to play begin recording system sound", v4, 2u);
      swift_slowDealloc();
    }
  }
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1000090D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000070C4(a1, &qword_1000316D0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100009280(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1000092C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1000068B8(&qword_1000316D0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  type metadata accessor for MainActor();
  swift_retain();
  uint64_t v9 = static MainActor.shared.getter();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v9;
  v10[3] = &protocol witness table for MainActor;
  v10[4] = a1;
  sub_1000090D4((uint64_t)v7, a3, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_1000093D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a4;
  type metadata accessor for MainActor();
  *(void *)(v4 + 48) = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100009470, v6, v5);
}

uint64_t sub_100009470()
{
  swift_release();
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    AudioServicesDisposeSystemSoundID(0x45Eu);
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 56) = 1;
    static Published.subscript.setter();
  }
  else
  {
    if (qword_1000313A0 != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    sub_10000D898(v1, (uint64_t)qword_100033BA8);
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Unable to play end recording system sound", v4, 2u);
      swift_slowDealloc();
    }
  }
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1000095FC()
{
  return sub_100009610();
}

uint64_t sub_100009610()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

char *sub_10000967C(char a1)
{
  uint64_t v3 = sub_1000068B8(&qword_1000317B0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_DWORD *)&v1[OBJC_IVAR____TtC13ClarityCamera11CameraModel_beginRecordingSoundID] = 1117;
  *(_DWORD *)&v1[OBJC_IVAR____TtC13ClarityCamera11CameraModel_endRecordingSoundID] = 1118;
  uint64_t v7 = &v1[OBJC_IVAR____TtC13ClarityCamera11CameraModel__recordButtonEnabled];
  LOBYTE(v45) = 1;
  uint64_t v8 = v1;
  Published.init(initialValue:)();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  v9(v7, v6, v3);
  uint64_t v10 = &v8[OBJC_IVAR____TtC13ClarityCamera11CameraModel__isRecordingVideo];
  LOBYTE(v45) = 0;
  Published.init(initialValue:)();
  v9(v10, v6, v3);
  long long v11 = &v8[OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSessionRuntimeErrorSubscription];
  *(_OWORD *)long long v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  *((void *)v11 + 4) = 0;
  uint64_t v12 = OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSession;
  *(void *)&v8[v12] = [objc_allocWithZone((Class)AVCaptureSession) init];
  uint64_t v13 = OBJC_IVAR____TtC13ClarityCamera11CameraModel_photoOutput;
  *(void *)&v8[v13] = [objc_allocWithZone((Class)AVCapturePhotoOutput) init];
  uint64_t v14 = OBJC_IVAR____TtC13ClarityCamera11CameraModel_videoOutput;
  *(void *)&v8[v14] = [objc_allocWithZone((Class)AVCaptureMovieFileOutput) init];
  *(void *)&v8[OBJC_IVAR____TtC13ClarityCamera11CameraModel_videoDeviceInput] = 0;
  *(void *)&v8[OBJC_IVAR____TtC13ClarityCamera11CameraModel_audioDeviceInput] = 0;
  *(void *)&v8[OBJC_IVAR____TtC13ClarityCamera11CameraModel_currentPhoto] = 0;
  v8[OBJC_IVAR____TtC13ClarityCamera11CameraModel_mode] = a1;
  uint64_t v15 = self;
  long long v16 = &CameraModel;
  id v17 = [v15 currentDevice];
  id v18 = [v17 orientation];

  uint64_t v19 = static UIInterfaceOrientation.fromDeviceOrientation(_:)((uint64_t)v18);
  if (v20)
  {
    uint64_t v30 = static UIInterfaceOrientation.window.getter();
    *(void *)&v8[OBJC_IVAR____TtC13ClarityCamera11CameraModel_lastSeenValidOrientation] = v30;

    if (qword_1000313A0 != -1) {
      swift_once();
    }
    uint64_t v31 = type metadata accessor for Logger();
    sub_10000D898(v31, (uint64_t)qword_100033BA8);
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v44 = v30;
      uint64_t v45 = v32;
      *(_DWORD *)uint64_t v25 = 136315138;
      type metadata accessor for UIInterfaceOrientation(0);
      uint64_t v33 = String.init<A>(describing:)();
      uint64_t v44 = sub_10001413C(v33, v34, &v45);
      long long v16 = &CameraModel;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v29 = "Initial orientation from window: %s";
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v21 = v19;
    *(void *)&v8[OBJC_IVAR____TtC13ClarityCamera11CameraModel_lastSeenValidOrientation] = v19;

    if (qword_1000313A0 != -1) {
      swift_once();
    }
    uint64_t v22 = type metadata accessor for Logger();
    sub_10000D898(v22, (uint64_t)qword_100033BA8);
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v44 = v21;
      uint64_t v45 = v26;
      *(_DWORD *)uint64_t v25 = 136315138;
      type metadata accessor for UIInterfaceOrientation(0);
      uint64_t v27 = String.init<A>(describing:)();
      uint64_t v44 = sub_10001413C(v27, v28, &v45);
      long long v16 = &CameraModel;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v29 = "Initial orientation from device: %s";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v23, v24, v29, v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
  }

  long long v35 = (objc_class *)type metadata accessor for CameraModel();
  v46.receiver = v8;
  v46.super_class = v35;
  uint64_t v36 = (char *)[super init];
  id v37 = [v15 (SEL)v16[378].count];
  [v37 beginGeneratingDeviceOrientationNotifications];

  uint64_t v38 = self;
  id v39 = [v38 defaultCenter];
  [v39 addObserver:v36 selector:"orientationChangedWithNotification:" name:UIDeviceOrientationDidChangeNotification object:0];

  id v40 = [v38 defaultCenter];
  uint64_t v41 = OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSession;
  [v40 addObserver:v36 selector:"sessionWasInterruptedWithNotification:" name:AVCaptureSessionWasInterruptedNotification object:*(void *)&v36[OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSession]];

  id v42 = [v38 defaultCenter];
  [v42 addObserver:v36 selector:"sessionInterruptionEndedWithNotification:" name:AVCaptureSessionInterruptionEndedNotification object:*(void *)&v36[v41]];

  return v36;
}

id sub_100009C84()
{
  unsigned __int8 v1 = v0;
  uint64_t v2 = sub_1000068B8(&qword_1000316D0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  type metadata accessor for MainActor();
  uint64_t v6 = static MainActor.shared.getter();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = &protocol witness table for MainActor;
  sub_1000090D4((uint64_t)v4, (uint64_t)&unk_1000317B8, v7);
  swift_release();
  uint64_t v8 = (objc_class *)type metadata accessor for CameraModel();
  v10.receiver = v1;
  v10.super_class = v8;
  return [super dealloc];
}

uint64_t sub_100009DB0()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 16) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100009E44, v2, v1);
}

uint64_t sub_100009E44()
{
  swift_release();
  id v1 = [self currentDevice];
  [v1 endGeneratingDeviceOrientationNotifications];

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000A128()
{
  return type metadata accessor for CameraModel();
}

uint64_t type metadata accessor for CameraModel()
{
  uint64_t result = qword_100031698;
  if (!qword_100031698) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000A17C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000068B8(&qword_100031700);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = &v39[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = type metadata accessor for NSNotificationCenter.Publisher();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v39[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_1000068B8(&qword_100031708);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = &v39[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v13 = [self defaultCenter];
  NSNotificationCenter.publisher(for:object:)();

  v40[0] = [self mainRunLoop];
  uint64_t v14 = type metadata accessor for NSRunLoop.SchedulerOptions();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 1, 1, v14);
  sub_10000DB64(0, &qword_100031710);
  sub_10000DBA0(&qword_100031718, (void (*)(uint64_t))&type metadata accessor for NSNotificationCenter.Publisher);
  sub_10000DA38();
  Publisher.receive<A>(on:options:)();
  sub_1000070C4((uint64_t)v4, &qword_100031700);

  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  sub_10000DAA0();
  uint64_t v15 = (void *)Publisher<>.sink(receiveValue:)();
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
  v40[3] = (id)type metadata accessor for AnyCancellable();
  v40[4] = &protocol witness table for AnyCancellable;
  v40[0] = v15;
  uint64_t v16 = v1 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSessionRuntimeErrorSubscription;
  swift_beginAccess();
  sub_10000DAFC((uint64_t)v40, v16);
  swift_endAccess();
  sub_1000068B8(&qword_100031738);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_100023E70;
  *(void *)(v17 + 32) = AVCaptureDeviceTypeBuiltInTrueDepthCamera;
  *(void *)(v17 + 40) = AVCaptureDeviceTypeBuiltInDualCamera;
  *(void *)(v17 + 48) = AVCaptureDeviceTypeBuiltInWideAngleCamera;
  LOBYTE(v1) = *(unsigned char *)(v1 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_mode);
  id v18 = AVCaptureDeviceTypeBuiltInTrueDepthCamera;
  uint64_t v19 = AVCaptureDeviceTypeBuiltInDualCamera;
  char v20 = AVCaptureDeviceTypeBuiltInWideAngleCamera;
  uint64_t v21 = AVMediaTypeVideo;
  if (sub_100008710(v1)) {
    uint64_t v22 = 2;
  }
  else {
    uint64_t v22 = 1;
  }
  type metadata accessor for DeviceType(0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  os_log_type_t v24 = [self discoverySessionWithDeviceTypes:isa mediaType:v21 position:v22];

  id v25 = [v24 devices];
  sub_10000DB64(0, &qword_100031740);
  unint64_t v26 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v26 >> 62))
  {
    if (*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_6;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    if (qword_1000313A0 == -1) {
      goto LABEL_18;
    }
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  uint64_t v35 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v35) {
    goto LABEL_17;
  }
LABEL_6:
  if ((v26 & 0xC000000000000001) == 0)
  {
    if (*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v27 = *(id *)(v26 + 32);
      goto LABEL_9;
    }
    __break(1u);
LABEL_24:
    swift_once();
LABEL_18:
    uint64_t v36 = type metadata accessor for Logger();
    sub_10000D898(v36, (uint64_t)qword_100033BA8);
    uint64_t v32 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v37, "Could not find appropriate AVCaptureDevice", v38, 2u);
      swift_slowDealloc();
    }
    goto LABEL_20;
  }
  uint64_t v27 = specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_9:
  unint64_t v28 = v27;
  swift_bridgeObjectRelease();
  id v29 = [self defaultDeviceWithDeviceType:AVCaptureDeviceTypeMicrophone mediaType:AVMediaTypeAudio position:0];
  if (!v29)
  {
    if (qword_1000313A0 != -1) {
      swift_once();
    }
    uint64_t v31 = type metadata accessor for Logger();
    sub_10000D898(v31, (uint64_t)qword_100033BA8);
    uint64_t v32 = Logger.logObject.getter();
    os_log_type_t v33 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v33))
    {
      unint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Could not create microphone capture device", v34, 2u);
      swift_slowDealloc();
    }

LABEL_20:
    unint64_t v28 = v24;
    os_log_type_t v24 = v32;
    goto LABEL_21;
  }
  uint64_t v30 = v29;
  sub_10000AB04(v28, v29);

LABEL_21:
}

void sub_10000A874(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Notification();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000313A0 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_10000D898(v6, (uint64_t)qword_100033BA8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    sub_10000DBA0(&qword_100031748, (void (*)(uint64_t))&type metadata accessor for Notification);
    uint64_t v10 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v12 = sub_10001413C(v10, v11, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Capture session runtime error: %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

void sub_10000AB04(void *a1, void *a2)
{
  uint64_t v5 = sub_1000068B8(&qword_1000316D0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v8 = *(void **)&v2[OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSession];
  [v8 beginConfiguration];
  id v9 = objc_allocWithZone((Class)AVCaptureDeviceInput);
  id v72 = 0;
  id v10 = a1;
  id v11 = [v9 initWithDevice:v10 error:&v72];
  if (!v11)
  {
    id v30 = v72;
    _convertNSErrorToError(_:)();

    swift_willThrow();
LABEL_12:

    if (qword_1000313A0 != -1) {
      swift_once();
    }
    uint64_t v31 = type metadata accessor for Logger();
    sub_10000D898(v31, (uint64_t)qword_100033BA8);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v32 = Logger.logObject.getter();
    os_log_type_t v33 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v33))
    {
      unint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v34 = 138412290;
      swift_errorRetain();
      uint64_t v36 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v72 = v36;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v35 = v36;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Error setting up capture session: %@", v34, 0xCu);
      sub_1000068B8(&qword_1000316D8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return;
    }
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
    goto LABEL_35;
  }
  uint64_t v12 = v11;
  id v13 = v72;

  if (([v8 canAddInput:v12] & 1) == 0)
  {
    if (qword_1000313A0 != -1) {
      swift_once();
    }
    uint64_t v37 = type metadata accessor for Logger();
    sub_10000D898(v37, (uint64_t)qword_100033BA8);
    id v38 = v12;
    id v39 = v2;
    id v40 = v38;
    uint64_t v41 = v39;
    uint64_t v32 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v44 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v43 = 138412546;
      id v72 = v40;
      unsigned __int8 v71 = v32;
      id v45 = v40;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v44 = v12;

      *(_WORD *)(v43 + 12) = 2112;
      id v72 = v8;
      id v46 = v8;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v44[1] = v8;

      uint64_t v47 = v71;
      _os_log_impl((void *)&_mh_execute_header, v71, v42, "Unable to add input %@ to session %@", (uint8_t *)v43, 0x16u);
      sub_1000068B8(&qword_1000316D8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }

    goto LABEL_34;
  }
  uint64_t v14 = *(void **)&v2[OBJC_IVAR____TtC13ClarityCamera11CameraModel_videoDeviceInput];
  *(void *)&v2[OBJC_IVAR____TtC13ClarityCamera11CameraModel_videoDeviceInput] = v12;
  uint64_t v15 = v12;

  unsigned __int8 v71 = v15;
  [v8 addInput:v15];
  char v16 = v2[OBJC_IVAR____TtC13ClarityCamera11CameraModel_mode];
  if ((sub_100008534(v16) & 1) == 0)
  {
LABEL_7:
    char v23 = sub_1000081E4(v16);
    os_log_type_t v24 = &OBJC_IVAR____TtC13ClarityCamera11CameraModel_photoOutput;
    if ((v23 & 1) == 0) {
      os_log_type_t v24 = &OBJC_IVAR____TtC13ClarityCamera11CameraModel_videoOutput;
    }
    id v25 = *(id *)&v2[*v24];
    if ([v8 canAddOutput:v25])
    {
      [v8 setSessionPreset:*(void *)*(&off_10002E030 + v16)];
      [v8 addOutput:v25];
      [v8 commitConfiguration];
      static TaskPriority.userInitiated.getter();
      uint64_t v26 = type metadata accessor for TaskPriority();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v7, 0, 1, v26);
      type metadata accessor for MainActor();
      uint64_t v27 = v2;
      uint64_t v28 = static MainActor.shared.getter();
      id v29 = (void *)swift_allocObject();
      v29[2] = v28;
      v29[3] = &protocol witness table for MainActor;
      v29[4] = v27;
      sub_1000090D4((uint64_t)v7, (uint64_t)&unk_1000316E8, (uint64_t)v29);
      swift_release();

LABEL_32:
      return;
    }
    if (qword_1000313A0 != -1) {
      swift_once();
    }
    uint64_t v48 = type metadata accessor for Logger();
    sub_10000D898(v48, (uint64_t)qword_100033BA8);
    uint64_t v49 = v2;
    id v50 = v25;
    uint64_t v41 = v49;
    id v51 = v50;
    uint64_t v32 = Logger.logObject.getter();
    os_log_type_t v52 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v52))
    {
      uint64_t v53 = swift_slowAlloc();
      uint64_t v54 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v53 = 138412546;
      os_log_t v70 = v32;
      id v72 = v51;
      id v55 = v51;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v54 = v51;

      *(_WORD *)(v53 + 12) = 2112;
      id v72 = v8;
      id v56 = v8;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v54[1] = v8;

      os_log_t v57 = v70;
      _os_log_impl((void *)&_mh_execute_header, v70, v52, "Unable to add output %@ to session %@", (uint8_t *)v53, 0x16u);
      sub_1000068B8(&qword_1000316D8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_32;
    }

    goto LABEL_34;
  }
  id v17 = objc_allocWithZone((Class)AVCaptureDeviceInput);
  id v72 = 0;
  id v10 = a2;
  id v18 = [v17 initWithDevice:v10 error:&v72];
  if (!v18)
  {
    id v58 = v72;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    goto LABEL_12;
  }
  uint64_t v19 = v18;
  id v20 = v72;

  if ([v8 canAddInput:v19])
  {
    uint64_t v21 = *(void **)&v2[OBJC_IVAR____TtC13ClarityCamera11CameraModel_audioDeviceInput];
    *(void *)&v2[OBJC_IVAR____TtC13ClarityCamera11CameraModel_audioDeviceInput] = v19;
    id v22 = v19;

    [v8 addInput:v22];
    goto LABEL_7;
  }
  if (qword_1000313A0 != -1) {
    swift_once();
  }
  uint64_t v59 = type metadata accessor for Logger();
  sub_10000D898(v59, (uint64_t)qword_100033BA8);
  id v60 = v19;
  uint64_t v61 = v2;
  id v62 = v60;
  uint64_t v41 = v61;
  uint64_t v32 = Logger.logObject.getter();
  os_log_type_t v63 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v32, v63))
  {
    uint64_t v64 = swift_slowAlloc();
    uint64_t v65 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v64 = 138412546;
    id v72 = v62;
    os_log_t v70 = v32;
    id v66 = v62;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v65 = v19;

    *(_WORD *)(v64 + 12) = 2112;
    id v72 = v8;
    id v67 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v65[1] = v8;

    os_log_t v68 = v70;
    _os_log_impl((void *)&_mh_execute_header, v70, v63, "Unable to add input %@ to session %@", (uint8_t *)v64, 0x16u);
    sub_1000068B8(&qword_1000316D8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    goto LABEL_32;
  }

LABEL_34:
LABEL_35:
}

uint64_t sub_10000B564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  type metadata accessor for MainActor();
  *(void *)(v4 + 24) = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000B5FC, v6, v5);
}

uint64_t sub_10000B5FC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_release();
  [*(id *)(v1 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSession) startRunning];
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

void sub_10000B674()
{
  uint64_t v1 = v0;
  id v2 = [objc_allocWithZone((Class)AVCapturePhotoSettings) init];
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_photoOutput);
  id v4 = [v3 availablePhotoCodecTypes];
  type metadata accessor for AVVideoCodecType(0);
  uint64_t v6 = v5;
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v8 = AVVideoCodecTypeHEVC;
  char v9 = sub_10000B970((uint64_t)v8, v7);
  swift_bridgeObjectRelease();

  if (v9)
  {
    sub_1000068B8(&qword_1000316B8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100023E80;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 40) = v11;
    *(void *)(inited + 72) = v6;
    *(void *)(inited + 48) = v8;
    uint64_t v12 = v8;
    sub_10000BAC8(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v14 = [self photoSettingsWithFormat:isa];

    id v2 = v14;
  }
  uint64_t v15 = *(void **)(v1 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_videoDeviceInput);
  if (v15)
  {
    id v16 = [v15 device];
    unsigned int v17 = [v16 isFlashAvailable];

    if (v17) {
      [v2 setFlashMode:2];
    }
  }
  uint64_t v18 = AVCapturePhotoSettings.availablePreviewPhotoPixelFormatTypes.getter();
  if (*(void *)(v18 + 16))
  {
    int v19 = *(_DWORD *)(v18 + 32);
    swift_bridgeObjectRelease();
    sub_1000068B8(&qword_1000316B8);
    uint64_t v20 = swift_initStackObject();
    *(_OWORD *)(v20 + 16) = xmmword_100023E80;
    *(void *)(v20 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(v20 + 40) = v21;
    *(void *)(v20 + 72) = &type metadata for UInt32;
    *(_DWORD *)(v20 + 48) = v19;
    sub_10000BAC8(v20);
    Class v22 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v2 setPreviewPhotoFormat:v22];
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  id v23 = [v3 connectionWithMediaType:AVMediaTypeVideo];
  if (v23)
  {
    os_log_type_t v24 = v23;
    [v23 setVideoRotationAngle:sub_10000CD24(*(void *)(v1 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_lastSeenValidOrientation), 0)];
  }
  [v3 capturePhotoWithSettings:v2 delegate:v1];
}

uint64_t sub_10000B970(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  if (v3 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v5 == v6)
  {
LABEL_20:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v2 == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v10 = 5;
  while (1)
  {
    uint64_t v11 = v10 - 3;
    if (__OFADD__(v10 - 4, 1)) {
      break;
    }
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = v13;
    if (v12 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v14 == v15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_7;
    }
    ++v10;
    if (v11 == v2) {
      goto LABEL_17;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_10000BAC8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000068B8(&qword_1000316C0);
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
    sub_10000D8D0(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10000D6F0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000D938(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

void sub_10000BBF4()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  char v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = ((char *)&v39 - v10);
  if ([*(id *)(v0 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSession) isRunning])
  {
    uint64_t v39 = v0;
    os_log_t v40 = v11;
    id v12 = [self defaultManager];
    id v13 = [v12 URLsForDirectory:9 inDomains:1];
    uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (*(void *)(v14 + 16))
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v9, v14 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)), v5);
      swift_bridgeObjectRelease();
      id v41 = 0;
      unint64_t v42 = 0xE000000000000000;
      UUID.init()();
      uint64_t v15 = (void *)UUID.uuidString.getter();
      unint64_t v17 = v16;
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      swift_bridgeObjectRelease();
      id v41 = v15;
      unint64_t v42 = v17;
      v18._countAndFlagsBits = 1987013934;
      v18._object = (void *)0xE400000000000000;
      String.append(_:)(v18);
      URL.appendingPathComponent(_:)();
      swift_bridgeObjectRelease();
      int v19 = *(void (**)(char *, uint64_t))(v6 + 8);
      v19(v9, v5);
      URL._bridgeToObjectiveC()(v20);
      Class v22 = v21;
      id v41 = 0;
      unsigned int v23 = [v12 removeItemAtURL:v21 error:&v41];

      os_log_type_t v24 = v12;
      if (v23)
      {
        id v25 = v41;
      }
      else
      {
        id v30 = v41;
        _convertNSErrorToError(_:)();

        swift_willThrow();
        swift_errorRelease();
      }
      uint64_t v31 = v39;
      uint64_t v32 = *(void **)(v39 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_videoOutput);
      id v33 = [v32 connectionWithMediaType:AVMediaTypeVideo];
      os_log_t v35 = v40;
      if (v33)
      {
        uint64_t v36 = v33;
        [v33 setVideoRotationAngle:sub_10000CD24(*(void *)(v31 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_lastSeenValidOrientation), 0)];
      }
      URL._bridgeToObjectiveC()(v34);
      id v38 = v37;
      [v32 startRecordingToOutputFileURL:v37 recordingDelegate:v31];

      v19((char *)v35, v5);
      return;
    }
    __break(1u);
    goto LABEL_16;
  }
  if (qword_1000313A0 != -1) {
LABEL_16:
  }
    swift_once();
  uint64_t v26 = type metadata accessor for Logger();
  sub_10000D898(v26, (uint64_t)qword_100033BA8);
  os_log_t v40 = (os_log_t)Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v40, v27))
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v40, v27, "Capture session is not running on record video request", v28, 2u);
    swift_slowDealloc();
  }
  os_log_t v29 = v40;
}

uint64_t sub_10000C0D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  type metadata accessor for MainActor();
  *(void *)(v4 + 24) = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000C168, v6, v5);
}

uint64_t sub_10000C168()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_release();
  [*(id *)(v1 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSession) stopRunning];
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000C1E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  type metadata accessor for MainActor();
  v5[4] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000C278, v7, v6);
}

uint64_t sub_10000C278()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = v0[2];
  swift_release();
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_currentPhoto);
  *(void *)(v2 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_currentPhoto) = v1;
  id v4 = v1;

  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_10000C380(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  sub_1000068B8(&qword_1000316D0);
  v4[3] = swift_task_alloc();
  v4[4] = type metadata accessor for MainActor();
  v4[5] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000C44C, v6, v5);
}

uint64_t sub_10000C44C()
{
  uint64_t v1 = v0[2];
  swift_release();
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_currentPhoto);
  if (v2 && (id v3 = [v2 fileDataRepresentation]) != 0)
  {
    id v4 = v3;
    uint64_t v5 = v0[3];
    uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v8 = v7;

    static TaskPriority.userInitiated.getter();
    uint64_t v9 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v5, 0, 1, v9);
    sub_10000ECE0(v6, v8);
    uint64_t v10 = static MainActor.shared.getter();
    uint64_t v11 = (void *)swift_allocObject();
    v11[2] = v10;
    v11[3] = &protocol witness table for MainActor;
    v11[4] = v6;
    v11[5] = v8;
    sub_1000090D4(v5, (uint64_t)&unk_100031788, (uint64_t)v11);
    sub_10000ED78(v6, v8);
    swift_release();
  }
  else
  {
    if (qword_1000313A0 != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    sub_10000D898(v12, (uint64_t)qword_100033BA8);
    id v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Could not get photo data representation", v15, 2u);
      swift_slowDealloc();
    }
  }
  swift_task_dealloc();
  unint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_10000C678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[8] = a4;
  v5[9] = a5;
  type metadata accessor for MainActor();
  v5[10] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000C710, v7, v6);
}

uint64_t sub_10000C710()
{
  unint64_t v1 = v0[9];
  uint64_t v2 = v0[8];
  swift_release();
  id v3 = self;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v1;
  v0[6] = sub_10000EE94;
  v0[7] = v4;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_10000CADC;
  v0[5] = &unk_10002DF40;
  uint64_t v5 = _Block_copy(v0 + 2);
  sub_10000ECE0(v2, v1);
  swift_release();
  [v3 requestAuthorization:v5];
  _Block_release(v5);
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

void sub_10000C844(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a1 == 3)
  {
    id v5 = [self sharedPhotoLibrary];
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = a2;
    *(void *)(v6 + 24) = a3;
    aBlock[4] = sub_10000EED8;
    aBlock[5] = v6;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100009280;
    aBlock[3] = &unk_10002DF90;
    uint64_t v7 = _Block_copy(aBlock);
    sub_10000ECE0(a2, a3);
    swift_release();
    [v5 performChanges:v7 completionHandler:0];
    _Block_release(v7);
  }
  else
  {
    if (qword_1000313A0 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_10000D898(v8, (uint64_t)qword_100033BA8);
    oslog = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v9, "Library status is not authorized", v10, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_10000CA40()
{
  id v0 = [self creationRequestForAsset];
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  [v0 addResourceWithType:1 data:isa options:0];
}

uint64_t sub_10000CADC(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

double sub_10000CD24(uint64_t a1, char a2)
{
  char v5 = sub_100008710(*(unsigned char *)(v2 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_mode));
  if (a2)
  {
LABEL_4:
    if (qword_1000313A0 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_10000D898(v7, (uint64_t)qword_100033BA8);
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Unable to get valid video rotation angle.", v10, 2u);
      swift_slowDealloc();
    }

    return 0.0;
  }
  else
  {
    double result = 90.0;
    switch(a1)
    {
      case 1:
        return result;
      case 2:
        double result = 270.0;
        break;
      case 3:
        double result = 180.0;
        if ((v5 & 1) == 0) {
          double result = 0.0;
        }
        break;
      case 4:
        double result = 180.0;
        if (v5) {
          double result = 0.0;
        }
        break;
      default:
        goto LABEL_4;
    }
  }
  return result;
}

void sub_10000CF9C()
{
  sub_10000D07C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10000D07C()
{
  if (!qword_1000316A8)
  {
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000316A8);
    }
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for CameraModel.Mode(unsigned char *result, unsigned char *a2)
{
  *double result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CameraModel.Mode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CameraModel.Mode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000D240);
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

uint64_t sub_10000D268(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000D270(unsigned char *result, char a2)
{
  *double result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CameraModel.Mode()
{
  return &type metadata for CameraModel.Mode;
}

void *sub_10000D288()
{
  return &protocol witness table for String;
}

unint64_t sub_10000D298()
{
  unint64_t result = qword_1000316B0;
  if (!qword_1000316B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000316B0);
  }
  return result;
}

void *sub_10000D2EC()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10000D2F8@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CameraModel();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000D338@<X0>(unsigned char *a1@<X8>)
{
  return sub_10000D3D0(a1);
}

uint64_t sub_10000D34C(uint64_t a1, void **a2)
{
  int v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return static Published.subscript.setter();
}

uint64_t sub_10000D3BC@<X0>(unsigned char *a1@<X8>)
{
  return sub_10000D3D0(a1);
}

uint64_t sub_10000D3D0@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

void sub_10000D44C(uint64_t a1, void **a2)
{
  int v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  v2;
  static Published.subscript.setter();
  sub_100008C4C(v3);
}

uint64_t sub_10000D51C(uint64_t a1, int *a2)
{
  unsigned int v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10000D5F8;
  return v6(a1);
}

uint64_t sub_10000D5F8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_10000D6F0(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10000D768(a1, a2, v4);
}

unint64_t sub_10000D768(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10000D84C(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10002D920, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 4) {
    return 4;
  }
  else {
    return v3;
  }
}

uint64_t sub_10000D898(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000D8D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068B8(&qword_1000316C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10000D938(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000D94C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000F0E8;
  return sub_10000B564(a1, v4, v5, v6);
}

uint64_t sub_10000DA00()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_10000DA38()
{
  unint64_t result = qword_100031720;
  if (!qword_100031720)
  {
    sub_10000DB64(255, &qword_100031710);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031720);
  }
  return result;
}

unint64_t sub_10000DAA0()
{
  unint64_t result = qword_100031728;
  if (!qword_100031728)
  {
    sub_1000068FC(&qword_100031708);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031728);
  }
  return result;
}

uint64_t sub_10000DAFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068B8(&qword_100031730);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000DB64(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000DBA0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000DBE8@<X0>(unsigned char *a1@<X8>)
{
  return sub_10000D3D0(a1);
}

uint64_t sub_10000DC14@<X0>(unsigned char *a1@<X8>)
{
  return sub_10000D3D0(a1);
}

uint64_t sub_10000DC40()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000DC78()
{
  return sub_1000092C4(v0, (uint64_t)&unk_10002DEB0, (uint64_t)&unk_100031768);
}

uint64_t sub_10000DCB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000DCC0()
{
  return swift_release();
}

uint64_t sub_10000DCC8()
{
  return sub_1000092C4(v0, (uint64_t)&unk_10002DE88, (uint64_t)&unk_100031758);
}

uint64_t sub_10000DD04(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000F0E8;
  return sub_100008EAC(a1, v4, v5, v6);
}

uint64_t sub_10000DDBC()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000DDFC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000F0E8;
  return sub_1000093D8(a1, v4, v5, v6);
}

void sub_10000DEB0(void *a1, uint64_t a2)
{
  uint64_t v5 = sub_1000068B8(&qword_1000316D0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain();
    if (qword_1000313A0 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_10000D898(v8, (uint64_t)qword_100033BA8);
    swift_errorRetain();
    swift_errorRetain();
    v19[0] = (id)Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled((os_log_t)v19[0], v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      BOOL v11 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 138412290;
      swift_errorRetain();
      uint64_t v12 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v19[1] = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *BOOL v11 = v12;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v19[0], v9, "Error processing photo: %@", v10, 0xCu);
      sub_1000068B8(&qword_1000316D8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
      id v18 = v19[0];
    }
  }
  else
  {
    uint64_t v13 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 1, 1, v13);
    type metadata accessor for MainActor();
    id v14 = v2;
    id v15 = a1;
    uint64_t v16 = static MainActor.shared.getter();
    unint64_t v17 = (void *)swift_allocObject();
    v17[2] = v16;
    v17[3] = &protocol witness table for MainActor;
    v17[4] = v14;
    v17[5] = v15;
    sub_1000090D4((uint64_t)v7, (uint64_t)&unk_100031798, (uint64_t)v17);
    swift_release();
  }
}

void sub_10000E1A8(uint64_t a1)
{
  uint64_t v3 = sub_1000068B8(&qword_1000316D0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_errorRetain();
    if (qword_1000313A0 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_10000D898(v6, (uint64_t)qword_100033BA8);
    swift_errorRetain();
    swift_errorRetain();
    v16[0] = (id)Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled((os_log_t)v16[0], v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v9 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 138412290;
      swift_errorRetain();
      uint64_t v10 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v16[1] = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *os_log_type_t v9 = v10;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16[0], v7, "Error capturing photo: %@", v8, 0xCu);
      sub_1000068B8(&qword_1000316D8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
      id v15 = v16[0];
    }
  }
  else
  {
    uint64_t v11 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v5, 1, 1, v11);
    type metadata accessor for MainActor();
    id v12 = v1;
    uint64_t v13 = static MainActor.shared.getter();
    id v14 = (void *)swift_allocObject();
    v14[2] = v13;
    v14[3] = &protocol witness table for MainActor;
    v14[4] = v12;
    sub_1000090D4((uint64_t)v5, (uint64_t)&unk_100031778, (uint64_t)v14);
    swift_release();
  }
}

void sub_10000E494(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (qword_1000313A0 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_10000D898(v2, (uint64_t)qword_100033BA8);
    swift_errorRetain();
    swift_errorRetain();
    oslog = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 138412290;
      swift_errorRetain();
      uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v5 = v7;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v3, "Error recording video: %@", v4, 0xCu);
      sub_1000068B8(&qword_1000316D8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    URL.path(percentEncoded:)(1);
    oslog = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    UISaveVideoAtPathToSavedPhotosAlbum((NSString *)&oslog->isa, 0, 0, 0);
  }
}

void sub_10000E6AC()
{
  uint64_t v1 = v0;
  id v2 = [self currentDevice];
  id v3 = [v2 orientation];

  uint64_t v4 = static UIInterfaceOrientation.fromDeviceOrientation(_:)((uint64_t)v3);
  if (v5)
  {
    if (qword_1000313A0 != -1) {
      swift_once();
    }
    uint64_t v13 = type metadata accessor for Logger();
    sub_10000D898(v13, (uint64_t)qword_100033BA8);
    oslog = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)id v15 = 136315138;
      type metadata accessor for UIDeviceOrientation(0);
      uint64_t v16 = String.init<A>(describing:)();
      sub_10001413C(v16, v17, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v14, "Not updating for non-interface orientation: %s", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
  }
  else
  {
    uint64_t v6 = v4;
    if (qword_1000313A0 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_10000D898(v7, (uint64_t)qword_100033BA8);
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315138;
      type metadata accessor for UIInterfaceOrientation(0);
      uint64_t v11 = String.init<A>(describing:)();
      sub_10001413C(v11, v12, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Updated orientation: %s", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    *(void *)(v1 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_lastSeenValidOrientation) = v6;
  }
}

void sub_10000EA0C(void *a1, const char *a2)
{
  if (qword_1000313A0 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10000D898(v4, (uint64_t)qword_100033BA8);
  id v10 = a1;
  char v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v8 = v10;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, a2, v7, 0xCu);
    sub_1000068B8(&qword_1000316D8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

uint64_t sub_10000EBEC()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000EC2C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100006AD4;
  return sub_10000C380(a1, v4, v5, v6);
}

uint64_t sub_10000ECE0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_10000ED38()
{
  swift_unknownObjectRelease();
  sub_10000ED78(*(void *)(v0 + 32), *(void *)(v0 + 40));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000ED78(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_10000EDD0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10000F0E8;
  return sub_10000C678(a1, v4, v5, v7, v6);
}

void sub_10000EE94(uint64_t a1)
{
  sub_10000C844(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10000EEA0()
{
  sub_10000ED78(*(void *)(v0 + 16), *(void *)(v0 + 24));

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000EED8()
{
}

uint64_t sub_10000EEE0()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000EF28(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10000F0E8;
  return sub_10000C1E0(a1, v4, v5, v7, v6);
}

uint64_t sub_10000EFE8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10000F0E8;
  return sub_100009DB0();
}

uint64_t sub_10000F094()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000F0EC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v28 = a1;
  os_log_t v29 = a2;
  uint64_t v32 = a3;
  uint64_t v30 = sub_1000068B8(&qword_100031830);
  __chkstk_darwin(v30);
  uint64_t v6 = (uint64_t *)((char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v31 = sub_1000068B8(&qword_100031838);
  uint64_t v7 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000068B8(&qword_100031840);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v6 = static Alignment.bottom.getter();
  v6[1] = v14;
  uint64_t v15 = sub_1000068B8(&qword_100031848);
  sub_10000F44C(a1, a2, (uint64_t)v6 + *(int *)(v15 + 44));
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v33 = Image.init(systemName:)();
  sub_100006D24(&qword_100031850, &qword_100031830);
  View.navigationTitle<A>(_:icon:)();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000070C4((uint64_t)v6, &qword_100031830);
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = v28;
  id v18 = v29;
  *(void *)(v16 + 16) = v28;
  *(void *)(v16 + 24) = v18;
  uint64_t v19 = v31;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v9, v31);
  uint64_t v20 = (void (**)())&v13[*(int *)(v11 + 44)];
  NSURL *v20 = sub_1000102A8;
  v20[1] = (void (*)())v16;
  v20[2] = 0;
  v20[3] = 0;
  uint64_t v21 = *(void (**)(char *, uint64_t))(v7 + 8);
  id v22 = v18;
  v21(v9, v19);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v17;
  *(void *)(v23 + 24) = v22;
  uint64_t v24 = v32;
  sub_100006E78((uint64_t)v13, v32, &qword_100031840);
  id v25 = (void *)(v24 + *(int *)(sub_1000068B8(&qword_100031858) + 36));
  *id v25 = 0;
  v25[1] = 0;
  v25[2] = sub_1000102F4;
  v25[3] = v23;
  id v26 = v22;
  return sub_1000070C4((uint64_t)v13, &qword_100031840);
}

void sub_10000F44C(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for BorderedProminentButtonStyle();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v66 = v6;
  uint64_t v67 = v7;
  __chkstk_darwin(v6);
  id v56 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_1000068B8(&qword_100031860);
  uint64_t v9 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_1000068B8(&qword_100031868);
  __chkstk_darwin(v53);
  uint64_t v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_1000068B8(&qword_100031870);
  __chkstk_darwin(v55);
  uint64_t v15 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000068B8(&qword_100031878);
  uint64_t v72 = *(void *)(v16 - 8);
  uint64_t v73 = v16;
  __chkstk_darwin(v16);
  id v18 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_1000068B8(&qword_100031880);
  __chkstk_darwin(v68);
  os_log_t v70 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_1000068B8(&qword_100031888);
  uint64_t v20 = __chkstk_darwin(v69);
  uint64_t v74 = (uint64_t)&v53 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v65 = (uint64_t)&v53 - v23;
  __chkstk_darwin(v22);
  uint64_t v71 = (uint64_t)&v53 - v24;
  uint64_t v64 = static Alignment.topTrailing.getter();
  uint64_t v63 = v25;
  id v26 = a2;
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v62 = v78;
  int v61 = v79;
  uint64_t v60 = v80;
  int v59 = v81;
  uint64_t v58 = v82;
  uint64_t v57 = v83;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = a1;
  *(void *)(v27 + 24) = v26;
  uint64_t v75 = a1;
  id v76 = v26;
  id v28 = v26;
  sub_1000068B8(&qword_100031890);
  os_log_t v29 = v18;
  sub_100006D24(&qword_100031898, &qword_100031890);
  Button.init(action:label:)();
  swift_getKeyPath();
  swift_getKeyPath();
  id v30 = v28;
  static Published.subscript.getter();

  swift_release();
  swift_release();
  LOBYTE(a2) = v77;
  uint64_t v31 = v54;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v11, v54);
  v13[*(int *)(v53 + 36)] = (char)a2;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v31);
  sub_1000103C8();
  View.accessibilityIdentifier(_:)();
  sub_1000070C4((uint64_t)v13, &qword_100031868);
  uint64_t v32 = v56;
  BorderedProminentButtonStyle.init()();
  sub_1000104BC();
  sub_100010568(&qword_1000314D0, (void (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle);
  uint64_t v33 = v66;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v32, v33);
  sub_1000070C4((uint64_t)v15, &qword_100031870);
  swift_getKeyPath();
  swift_getKeyPath();
  id v34 = v30;
  static Published.subscript.getter();

  swift_release();
  swift_release();
  if (v77 == 1) {
    uint64_t v35 = static Color.red.getter();
  }
  else {
    uint64_t v35 = static Color.green.getter();
  }
  uint64_t v36 = v35;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v77 = v36;
  swift_retain();
  uint64_t v38 = AnyShapeStyle.init<A>(_:)();
  uint64_t v40 = v72;
  uint64_t v39 = v73;
  uint64_t v41 = (uint64_t)v70;
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v70, v29, v73);
  swift_release();
  unint64_t v42 = (uint64_t *)(v41 + *(int *)(v68 + 36));
  *unint64_t v42 = KeyPath;
  v42[1] = v38;
  (*(void (**)(char *, uint64_t))(v40 + 8))(v29, v39);
  LOBYTE(v36) = static Edge.Set.all.getter();
  uint64_t v43 = v65;
  sub_100006E78(v41, v65, &qword_100031880);
  uint64_t v44 = v43 + *(int *)(v69 + 36);
  *(unsigned char *)uint64_t v44 = v36;
  *(_OWORD *)(v44 + 8) = 0u;
  *(_OWORD *)(v44 + 24) = 0u;
  *(unsigned char *)(v44 + 40) = 1;
  sub_1000070C4(v41, &qword_100031880);
  uint64_t v45 = v43;
  uint64_t v46 = v71;
  sub_1000105C0(v45, v71);
  uint64_t v47 = v74;
  sub_100006E78(v46, v74, &qword_100031888);
  uint64_t v48 = v63;
  *(void *)a3 = v64;
  *(void *)(a3 + 8) = v48;
  uint64_t v49 = v62;
  *(void *)(a3 + 16) = v34;
  *(void *)(a3 + 24) = v49;
  *(unsigned char *)(a3 + 32) = v61;
  *(void *)(a3 + 40) = v60;
  *(unsigned char *)(a3 + 48) = v59;
  uint64_t v50 = v57;
  *(void *)(a3 + 56) = v58;
  *(void *)(a3 + 64) = v50;
  uint64_t v51 = sub_1000068B8(&qword_1000318C0);
  sub_100006E78(v47, a3 + *(int *)(v51 + 48), &qword_100031888);
  id v52 = v34;
  sub_1000070C4(v46, &qword_100031888);
  sub_1000070C4(v47, &qword_100031888);
}

void sub_10000FC6C()
{
  withAnimation<A>(_:_:)();
  id v0 = [objc_allocWithZone((Class)UIImpactFeedbackGenerator) initWithStyle:1];
  [v0 impactOccurred];
}

void sub_10000FCFC(uint64_t a1, void *a2)
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = a2;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v3;
  static Published.subscript.setter();
  sub_100008C4C(v5);
}

uint64_t sub_10000FE20@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = a1;
  static Published.subscript.getter();

  swift_release();
  swift_release();
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t result = Text.init(_:tableName:bundle:comment:)();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v6;
  *(unsigned char *)(a2 + 16) = v7 & 1;
  *(void *)(a2 + 24) = v8;
  return result;
}

uint64_t sub_10000FF0C@<X0>(void *a1@<X1>, uint64_t *a2@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = a1;
  static Published.subscript.getter();

  swift_release();
  swift_release();
  uint64_t result = Image.init(systemName:)();
  *a2 = result;
  return result;
}

uint64_t sub_10000FFD4(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_1000068B8(&qword_1000316D0);
  __chkstk_darwin(v3 - 8);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor();
  id v7 = a2;
  uint64_t v8 = static MainActor.shared.getter();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  sub_1000090D4((uint64_t)v5, (uint64_t)&unk_100031458, (uint64_t)v9);

  return swift_release();
}

uint64_t sub_100010100@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F0EC(*(void *)v1, *(void **)(v1 + 8), a1);
}

void *initializeBufferWithCopyOfBuffer for CameraVideoView(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = v3;
  return a1;
}

void destroy for CameraVideoView(uint64_t a1)
{
}

void *assignWithCopy for CameraVideoView(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = (void *)a2[1];
  id v4 = (void *)a1[1];
  a1[1] = v3;
  id v5 = v3;

  return a1;
}

__n128 initializeWithTake for CameraVideoView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for CameraVideoView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  id v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for CameraVideoView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CameraVideoView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CameraVideoView()
{
  return &type metadata for CameraVideoView;
}

uint64_t sub_100010254()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100010270()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000102A8()
{
  id v1 = *(id *)(v0 + 24);
  sub_10000A17C();
}

uint64_t sub_1000102F4()
{
  return sub_10000FFD4(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1000102FC()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10001033C()
{
}

uint64_t sub_100010344()
{
  return Label.init(title:icon:)();
}

unint64_t sub_1000103C8()
{
  unint64_t result = qword_1000318A0;
  if (!qword_1000318A0)
  {
    sub_1000068FC(&qword_100031868);
    sub_100006D24(&qword_1000318A8, &qword_100031860);
    sub_100010468();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000318A0);
  }
  return result;
}

unint64_t sub_100010468()
{
  unint64_t result = qword_1000318B0;
  if (!qword_1000318B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000318B0);
  }
  return result;
}

unint64_t sub_1000104BC()
{
  unint64_t result = qword_1000318B8;
  if (!qword_1000318B8)
  {
    sub_1000068FC(&qword_100031870);
    sub_1000103C8();
    sub_100010568((unint64_t *)&qword_1000314C8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000318B8);
  }
  return result;
}

uint64_t sub_100010568(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000105C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068B8(&qword_100031888);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010628@<X0>(uint64_t a1@<X8>)
{
  return sub_10000FE20(*(void **)(v1 + 24), a1);
}

uint64_t sub_100010630@<X0>(uint64_t *a1@<X8>)
{
  return sub_10000FF0C(*(void **)(v1 + 24), a1);
}

void sub_100010638()
{
  sub_10000FCFC(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_100010658()
{
  unint64_t result = qword_1000318C8;
  if (!qword_1000318C8)
  {
    sub_1000068FC(&qword_100031858);
    sub_1000106D4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000318C8);
  }
  return result;
}

unint64_t sub_1000106D4()
{
  unint64_t result = qword_1000318D0;
  if (!qword_1000318D0)
  {
    sub_1000068FC(&qword_100031840);
    sub_1000068FC(&qword_100031830);
    sub_100006D24(&qword_100031850, &qword_100031830);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000318D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ContentView()
{
  return &type metadata for ContentView;
}

uint64_t sub_1000107E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000107FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v62 = a1;
  uint64_t v58 = type metadata accessor for MultimodalListStyle.IconStyle();
  uint64_t v1 = *(void *)(v58 - 8);
  uint64_t v2 = __chkstk_darwin(v58);
  id v56 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v55 = (char *)&v50 - v4;
  uint64_t v5 = sub_1000068B8(&qword_1000319A0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v50 - v9;
  *((void *)&v60 + 1) = type metadata accessor for MultimodalListStyle();
  uint64_t v54 = *(void *)(*((void *)&v60 + 1) - 8);
  __chkstk_darwin(*((void *)&v60 + 1));
  uint64_t v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v60 = sub_1000068B8(&qword_100031950);
  uint64_t v53 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  uint64_t v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_1000068B8(&qword_1000319A8);
  uint64_t v52 = *(void *)(v61 - 8);
  uint64_t v15 = __chkstk_darwin(v61);
  uint64_t v51 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v57 = (char *)&v50 - v17;
  uint64_t v59 = sub_1000068B8(&qword_1000319B0);
  __chkstk_darwin(v59);
  uint64_t v19 = (char *)&v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000DB64(0, &qword_1000319B8);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id v21 = [ObjCClassFromMetadata sharedInstance];
  uint64_t v22 = sub_1000148A4();

  uint64_t v23 = *((void *)v22 + 2);
  swift_bridgeObjectRelease();
  if (v23 == 1)
  {
    id v24 = [ObjCClassFromMetadata sharedInstance];
    uint64_t v25 = sub_1000148A4();

    if (*((void *)v25 + 2))
    {
      char v26 = v25[32];
      swift_bridgeObjectRelease();
      sub_1000110A8(v26, (uint64_t)&v63);
      __int16 v27 = v64;
      char v28 = BYTE2(v64);
      *(_OWORD *)uint64_t v19 = v63;
      *((_WORD *)v19 + 8) = v27;
      v19[18] = v28;
      swift_storeEnumTagMultiPayload();
      sub_1000068B8(&qword_100031908);
      sub_100012904(&qword_100031900, &qword_100031908, (void (*)(void))sub_1000128C8, (void (*)(void))sub_100012A34);
      uint64_t v29 = sub_100006D24(&qword_100031958, &qword_100031950);
      long long v63 = v60;
      uint64_t v64 = v29;
      uint64_t v65 = &protocol witness table for MultimodalListStyle;
      swift_getOpaqueTypeConformance2();
      return _ConditionalContent<>.init(storage:)();
    }
    swift_bridgeObjectRelease();
  }
  sub_1000068B8(&qword_1000319C0);
  sub_100012D78();
  List<>.init(content:)();
  sub_10000DB64(0, &qword_1000319F0);
  id v31 = [(id)swift_getObjCClassFromMetadata() sharedInstance];
  id v32 = [v31 listLayout];

  uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v35 = v34;
  if (v33 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v35 == v36)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v37 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v37 & 1) == 0)
    {
      uint64_t v38 = (unsigned int *)&enum case for MultimodalListStyle.Layout.grid(_:);
      goto LABEL_11;
    }
  }
  uint64_t v38 = (unsigned int *)&enum case for MultimodalListStyle.Layout.stack(_:);
LABEL_11:
  uint64_t v39 = *v38;
  uint64_t v40 = type metadata accessor for MultimodalListStyle.Layout();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v40 - 8) + 104))(v10, v39, v40);
  type metadata accessor for MultimodalListStyle.Layout();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v10, 0, 1, v40);
  uint64_t v41 = v55;
  uint64_t v42 = v58;
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v55, enum case for MultimodalListStyle.IconStyle.circle(_:), v58);
  sub_100006E78((uint64_t)v10, (uint64_t)v8, &qword_1000319A0);
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v56, v41, v42);
  MultimodalListStyle.init(layout:iconStyle:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v41, v42);
  sub_1000070C4((uint64_t)v10, &qword_1000319A0);
  uint64_t v43 = sub_100006D24(&qword_100031958, &qword_100031950);
  uint64_t v44 = v51;
  long long v45 = v60;
  View.listStyle<A>(_:)();
  (*(void (**)(char *, void))(v54 + 8))(v12, *((void *)&v45 + 1));
  (*(void (**)(char *, void))(v53 + 8))(v14, v45);
  uint64_t v46 = v52;
  uint64_t v47 = v57;
  uint64_t v48 = v44;
  uint64_t v49 = v61;
  (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v57, v48, v61);
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v19, v47, v49);
  swift_storeEnumTagMultiPayload();
  sub_1000068B8(&qword_100031908);
  sub_100012904(&qword_100031900, &qword_100031908, (void (*)(void))sub_1000128C8, (void (*)(void))sub_100012A34);
  long long v63 = v45;
  uint64_t v64 = v43;
  uint64_t v65 = &protocol witness table for MultimodalListStyle;
  swift_getOpaqueTypeConformance2();
  _ConditionalContent<>.init(storage:)();
  return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v47, v49);
}

double sub_1000110A8@<D0>(char a1@<W0>, uint64_t a2@<X8>)
{
  switch(a1)
  {
    case 2:
    case 3:
      sub_100012A70();
      sub_100012AC4();
      _ConditionalContent<>.init(storage:)();
      break;
    default:
      sub_10001298C();
      sub_1000129E0();
      _ConditionalContent<>.init(storage:)();
      break;
  }
  sub_1000068B8(&qword_100031918);
  sub_1000068B8(&qword_100031938);
  sub_1000128C8();
  sub_100012A34();
  _ConditionalContent<>.init(storage:)();
  double result = *(double *)&v4;
  *(_OWORD *)a2 = v4;
  *(_WORD *)(a2 + 16) = v5;
  *(unsigned char *)(a2 + 18) = v6;
  return result;
}

uint64_t sub_100011314()
{
  sub_10000DB64(0, &qword_1000319B8);
  id v0 = [(id)swift_getObjCClassFromMetadata() sharedInstance];
  sub_1000148A4();

  sub_1000068B8(&qword_1000319F8);
  sub_1000068B8(&qword_1000319D8);
  sub_100006D24(&qword_100031A00, &qword_1000319F8);
  sub_100012DEC();
  sub_100012EE8();
  return ForEach<>.init(_:content:)();
}

uint64_t sub_100011428@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000068B8(&qword_1000319E8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_1000068B8(&qword_1000319D8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = &v12[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  char v13 = *a1;
  v12[16] = v13;
  sub_1000068B8(&qword_100031A10);
  sub_100012F44();
  sub_100012B18();
  NavigationLink<>.init<A>(value:label:)();
  sub_100006D24(&qword_1000319E0, &qword_1000319E8);
  View.accessibilityIdentifier(_:)();
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_100006E14((uint64_t)v10, a2, &qword_1000319D8);
}

uint64_t sub_1000116A8@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000068B8(&qword_100031A28);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_1000068B8(&qword_100031A10);
  __chkstk_darwin(v8);
  uint64_t v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17[48] = a1;
  v17[16] = a1;
  sub_1000068B8(&qword_100031A40);
  sub_1000068B8(&qword_1000314E0);
  sub_10001305C(&qword_100031A48, &qword_100031A40, (void (*)(void))sub_1000130D4);
  sub_100006EDC();
  Label.init(title:icon:)();
  switch(a1)
  {
    case 1:
    case 3:
      uint64_t v11 = static Color.green.getter();
      break;
    default:
      uint64_t v11 = static Color.yellow.getter();
      break;
  }
  uint64_t v12 = v11;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v18 = v12;
  swift_retain();
  uint64_t v14 = AnyShapeStyle.init<A>(_:)();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16))(v10, v7, v4);
  swift_release();
  uint64_t v15 = (uint64_t *)&v10[*(int *)(v8 + 36)];
  *uint64_t v15 = KeyPath;
  v15[1] = v14;
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_100006E14((uint64_t)v10, a2, &qword_100031A10);
}

double sub_10001193C@<D0>(uint64_t a1@<X8>)
{
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v2 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_1000132A0(v2, v3, v5 & 1);
  swift_bridgeObjectRetain();
  _ConditionalContent<>.init(storage:)();
  sub_1000068B8(&qword_100031A58);
  sub_1000130D4();
  _ConditionalContent<>.init(storage:)();
  sub_100006F7C(v2, v4, v6);
  swift_bridgeObjectRelease();
  double result = *(double *)&v8;
  *(_OWORD *)a1 = v8;
  *(_OWORD *)(a1 + 16) = v9;
  *(unsigned char *)(a1 + 32) = v10;
  *(unsigned char *)(a1 + 33) = v11;
  return result;
}

uint64_t sub_100011C60@<X0>(char a1@<W0>, uint64_t *a2@<X8>)
{
  switch(a1)
  {
    case 1:
      uint64_t v6 = Image.init(systemName:)();
      goto LABEL_7;
    case 2:
      uint64_t v3 = Image.init(_:bundle:)();
      goto LABEL_4;
    case 3:
      uint64_t v6 = Image.init(_:bundle:)();
LABEL_7:
      uint64_t v4 = v6;
      uint64_t v5 = static Color.white.getter();
      goto LABEL_8;
    default:
      uint64_t v3 = Image.init(systemName:)();
LABEL_4:
      uint64_t v4 = v3;
      uint64_t v5 = static Color.black.getter();
LABEL_8:
      uint64_t v7 = v5;
      uint64_t result = swift_getKeyPath();
      *a2 = v4;
      a2[1] = result;
      a2[2] = v7;
      return result;
  }
}

uint64_t sub_100011D70()
{
  uint64_t v0 = sub_1000068B8(&qword_1000318E8);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000107FC((uint64_t)v2);
  sub_1000068B8(&qword_1000318F0);
  sub_100012794();
  sub_100012B18();
  sub_100012904(&qword_100031968, &qword_1000318F0, (void (*)(void))sub_100012B6C, (void (*)(void))sub_100012C40);
  View.navigationDestination<A, B>(for:destination:)();
  return sub_1000070C4((uint64_t)v2, &qword_1000318E8);
}

double sub_100011EB8@<D0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  switch(*a1)
  {
    case 2:
    case 3:
      sub_100012A70();
      sub_100012AC4();
      _ConditionalContent<>.init(storage:)();
      goto LABEL_4;
    case 4:
      PhotoLibraryView.init()();
      sub_1000068B8(&qword_100031978);
      sub_100012B6C();
      sub_100012C40();
      _ConditionalContent<>.init(storage:)();
      break;
    default:
      sub_10001298C();
      sub_1000129E0();
      _ConditionalContent<>.init(storage:)();
LABEL_4:
      sub_1000068B8(&qword_100031918);
      sub_1000068B8(&qword_100031938);
      sub_1000128C8();
      sub_100012A34();
      _ConditionalContent<>.init(storage:)();
      sub_100012D50(v4, *((uint64_t *)&v4 + 1), (unsigned __int16)v5, SBYTE2(v5), (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))sub_100012D48, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))sub_1000133EC);
      sub_1000068B8(&qword_100031908);
      sub_100012904(&qword_100031900, &qword_100031908, (void (*)(void))sub_1000128C8, (void (*)(void))sub_100012A34);
      _ConditionalContent<>.init(storage:)();
      sub_1000068B8(&qword_100031988);
      sub_100012B94();
      _ConditionalContent<>.init(storage:)();
      sub_1000068B8(&qword_100031978);
      sub_100012B6C();
      sub_100012C40();
      _ConditionalContent<>.init(storage:)();
      sub_100012D50(v4, *((uint64_t *)&v4 + 1), (unsigned __int16)v5, SBYTE2(v5), (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))sub_100012D6C, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))sub_1000133F0);
      break;
  }
  double result = *(double *)&v4;
  *(_OWORD *)a2 = v4;
  *(_DWORD *)(a2 + 16) = v5;
  *(unsigned char *)(a2 + 20) = v6;
  *(unsigned char *)(a2 + 21) = v7;
  return result;
}

uint64_t sub_1000125D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000068B8(&qword_1000318D8);
  __chkstk_darwin(v2 - 8);
  long long v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000068B8(&qword_1000318E0);
  uint64_t v5 = sub_1000068FC(&qword_1000318E8);
  uint64_t v6 = sub_1000068FC(&qword_1000318F0);
  unint64_t v7 = sub_100012794();
  unint64_t v8 = sub_100012B18();
  uint64_t v9 = sub_100012904(&qword_100031968, &qword_1000318F0, (void (*)(void))sub_100012B6C, (void (*)(void))sub_100012C40);
  v14[0] = v5;
  v14[1] = &type metadata for NavigationStage;
  v14[2] = v6;
  v14[3] = v7;
  v14[4] = v8;
  v14[5] = v9;
  swift_getOpaqueTypeConformance2();
  NavigationStack.init<>(root:)();
  uint64_t v10 = static Color.black.getter();
  uint64_t KeyPath = swift_getKeyPath();
  sub_100006E78((uint64_t)v4, a1, &qword_1000318D8);
  uint64_t v12 = (uint64_t *)(a1 + *(int *)(sub_1000068B8(&qword_100031998) + 36));
  *uint64_t v12 = KeyPath;
  v12[1] = v10;
  return sub_1000070C4((uint64_t)v4, &qword_1000318D8);
}

unint64_t sub_100012794()
{
  unint64_t result = qword_1000318F8;
  if (!qword_1000318F8)
  {
    sub_1000068FC(&qword_1000318E8);
    sub_100012904(&qword_100031900, &qword_100031908, (void (*)(void))sub_1000128C8, (void (*)(void))sub_100012A34);
    sub_1000068FC(&qword_100031950);
    type metadata accessor for MultimodalListStyle();
    sub_100006D24(&qword_100031958, &qword_100031950);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000318F8);
  }
  return result;
}

uint64_t sub_1000128C8()
{
  return sub_100012904(&qword_100031910, &qword_100031918, (void (*)(void))sub_10001298C, (void (*)(void))sub_1000129E0);
}

uint64_t sub_100012904(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000068FC(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001298C()
{
  unint64_t result = qword_100031920;
  if (!qword_100031920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031920);
  }
  return result;
}

unint64_t sub_1000129E0()
{
  unint64_t result = qword_100031928;
  if (!qword_100031928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031928);
  }
  return result;
}

uint64_t sub_100012A34()
{
  return sub_100012904(&qword_100031930, &qword_100031938, (void (*)(void))sub_100012A70, (void (*)(void))sub_100012AC4);
}

unint64_t sub_100012A70()
{
  unint64_t result = qword_100031940;
  if (!qword_100031940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031940);
  }
  return result;
}

unint64_t sub_100012AC4()
{
  unint64_t result = qword_100031948;
  if (!qword_100031948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031948);
  }
  return result;
}

unint64_t sub_100012B18()
{
  unint64_t result = qword_100031960;
  if (!qword_100031960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031960);
  }
  return result;
}

uint64_t sub_100012B6C()
{
  return sub_10001305C(&qword_100031970, &qword_100031978, (void (*)(void))sub_100012B94);
}

unint64_t sub_100012B94()
{
  unint64_t result = qword_100031980;
  if (!qword_100031980)
  {
    sub_1000068FC(&qword_100031988);
    sub_100012904(&qword_100031900, &qword_100031908, (void (*)(void))sub_1000128C8, (void (*)(void))sub_100012A34);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031980);
  }
  return result;
}

unint64_t sub_100012C40()
{
  unint64_t result = qword_100031990;
  if (!qword_100031990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031990);
  }
  return result;
}

uint64_t sub_100012C94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.tintColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100012CC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.tintColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100012CEC()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t sub_100012D18()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t sub_100012D48(uint64_t a1, uint64_t a2, char a3)
{
  return sub_1000073FC(a1, a2, a3 & 1);
}

uint64_t sub_100012D50(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, void), uint64_t (*a6)(uint64_t, uint64_t, uint64_t, void))
{
  if (a4) {
    return a6(a1, a2, a3, (a3 >> 8) & 1);
  }
  else {
    return a5(a1, a2, a3, (a3 >> 8) & 1);
  }
}

uint64_t sub_100012D6C(uint64_t a1, uint64_t a2, char a3)
{
  return sub_10000741C(a1, a2, a3 & 1);
}

unint64_t sub_100012D78()
{
  unint64_t result = qword_1000319C8;
  if (!qword_1000319C8)
  {
    sub_1000068FC(&qword_1000319C0);
    sub_100012DEC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000319C8);
  }
  return result;
}

unint64_t sub_100012DEC()
{
  unint64_t result = qword_1000319D0;
  if (!qword_1000319D0)
  {
    sub_1000068FC(&qword_1000319D8);
    sub_100006D24(&qword_1000319E0, &qword_1000319E8);
    sub_100012E8C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000319D0);
  }
  return result;
}

unint64_t sub_100012E8C()
{
  unint64_t result = qword_1000314C8;
  if (!qword_1000314C8)
  {
    type metadata accessor for AccessibilityAttachmentModifier();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000314C8);
  }
  return result;
}

unint64_t sub_100012EE8()
{
  unint64_t result = qword_100031A08;
  if (!qword_100031A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031A08);
  }
  return result;
}

uint64_t sub_100012F3C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000116A8(*(unsigned char *)(v1 + 16), a1);
}

unint64_t sub_100012F44()
{
  unint64_t result = qword_100031A18;
  if (!qword_100031A18)
  {
    sub_1000068FC(&qword_100031A10);
    sub_100006D24(&qword_100031A20, &qword_100031A28);
    sub_100006D24(&qword_100031A30, &qword_100031A38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031A18);
  }
  return result;
}

double sub_100013008@<D0>(uint64_t a1@<X8>)
{
  sub_10001193C((uint64_t)v6);
  char v2 = v7;
  char v3 = v8;
  double result = *(double *)v6;
  long long v5 = v6[1];
  *(_OWORD *)a1 = v6[0];
  *(_OWORD *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 32) = v2;
  *(unsigned char *)(a1 + 33) = v3;
  return result;
}

uint64_t sub_100013054@<X0>(uint64_t *a1@<X8>)
{
  return sub_100011C60(*(unsigned char *)(v1 + 16), a1);
}

uint64_t sub_10001305C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000068FC(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000130D4()
{
  unint64_t result = qword_100031A50;
  if (!qword_100031A50)
  {
    sub_1000068FC(&qword_100031A58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031A50);
  }
  return result;
}

uint64_t sub_100013140@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10001316C()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_100013198@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.tint.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000131C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.tint.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000131F0()
{
  return EnvironmentValues.tint.setter();
}

uint64_t sub_10001321C()
{
  return EnvironmentValues.tint.setter();
}

uint64_t sub_100013248@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100013274()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_1000132A0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

unint64_t sub_1000132B4()
{
  unint64_t result = qword_100031A60;
  if (!qword_100031A60)
  {
    sub_1000068FC(&qword_100031998);
    sub_100013354();
    sub_100006D24(&qword_1000314B0, &qword_1000314B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031A60);
  }
  return result;
}

unint64_t sub_100013354()
{
  unint64_t result = qword_100031A68;
  if (!qword_100031A68)
  {
    sub_1000068FC(&qword_1000318D8);
    sub_100006D24(&qword_100031A70, &qword_100031A78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031A68);
  }
  return result;
}

id sub_1000134E8()
{
  return sub_100014094(type metadata accessor for PreviewView);
}

uint64_t type metadata accessor for PreviewView()
{
  return self;
}

void sub_100013524()
{
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_previewView);
  id v6 = [v1 layer];
  self;
  char v2 = (void *)swift_dynamicCastObjCClass();

  if (v2)
  {
    uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_cameraModel);
    if (v3) {
      id v4 = *(id *)(v3 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSession);
    }
    else {
      id v4 = 0;
    }
    id v5 = v6;
    [v2 setSession:v4];

    [v2 setVideoGravity:AVLayerVideoGravityResizeAspectFill];
  }
}

id sub_100013728()
{
  id v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_previewView;
  [*(id *)&v0[OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_previewView] setTranslatesAutoresizingMaskIntoConstraints:0];
  id result = [v0 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  id v4 = result;
  [result addSubview:*(void *)&v1[v2]];

  sub_1000068B8(&qword_100031AE8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000242C0;
  id v6 = [*(id *)&v1[v2] widthAnchor];
  id result = [v1 view];
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  char v7 = result;
  id v8 = [result widthAnchor];

  id v9 = [v6 constraintEqualToAnchor:v8];
  *(void *)(v5 + 32) = v9;
  id v10 = [*(id *)&v1[v2] heightAnchor];
  id result = [v1 view];
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  char v11 = result;
  id v12 = [result heightAnchor];

  id v13 = [v10 constraintEqualToAnchor:v12];
  *(void *)(v5 + 40) = v13;
  id v14 = [*(id *)&v1[v2] centerXAnchor];
  id result = [v1 view];
  if (!result)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v15 = result;
  id v16 = [result centerXAnchor];

  id v17 = [v14 constraintEqualToAnchor:v16];
  *(void *)(v5 + 48) = v17;
  id v18 = [*(id *)&v1[v2] centerYAnchor];
  id result = [v1 view];
  if (!result)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t v19 = result;
  uint64_t v20 = self;
  id v21 = [v19 centerYAnchor];

  id v22 = [v18 constraintEqualToAnchor:v21];
  *(void *)(v5 + 56) = v22;
  specialized Array._endMutation()();
  sub_10000DB64(0, &qword_100031AF0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v20 activateConstraints:isa];

  id v24 = *(void **)&v1[v2];

  return [v24 setAccessibilityIgnoresInvertColors:1];
}

void sub_100013B40()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_cameraModel);
  if (!v1)
  {
    if (qword_1000313A0 != -1) {
      swift_once();
    }
    uint64_t v13 = type metadata accessor for Logger();
    sub_10000D898(v13, (uint64_t)qword_100033BA8);
    id v16 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v14, "Attempted to update preview rotation angle, but no camera model was set.", v15, 2u);
      swift_slowDealloc();
    }
    goto LABEL_15;
  }
  id v16 = v1;
  uint64_t v2 = static UIInterfaceOrientation.window.getter();
  id v3 = *(id *)(v0 + OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_previewView);
  id v4 = [v3 layer];
  self;
  uint64_t v5 = (void *)swift_dynamicCastObjCClass();

  if (!v5) {
    goto LABEL_5;
  }
  id v6 = [v5 connection];

  if (v6)
  {
    [v6 setVideoRotationAngle:sub_10000CD24(v2, 0)];
    id v4 = v6;
LABEL_5:
  }
  if (qword_1000313A0 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_10000D898(v7, (uint64_t)qword_100033BA8);
  id v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    id v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)id v10 = 136315138;
    type metadata accessor for UIInterfaceOrientation(0);
    uint64_t v11 = String.init<A>(describing:)();
    sub_10001413C(v11, v12, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Updating AVCaptureVideoPreviewLayer orientation to %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return;
  }

LABEL_15:
}

id sub_100013E70(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_previewView;
  type metadata accessor for PreviewView();
  id v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v8 = v3;
  *(void *)&v3[v6] = [v7 init];
  *(void *)&v8[OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_cameraModel] = 0;

  if (a2)
  {
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for PreviewViewController();
  [super initWithNibName:v9 bundle:a3];

  return v10;
}

id sub_100013FB0(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_previewView;
  type metadata accessor for PreviewView();
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  *(void *)&v5[OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_cameraModel] = 0;

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for PreviewViewController();
  [super initWithCoder:a1];

  return v6;
}

id sub_10001407C()
{
  return sub_100014094(type metadata accessor for PreviewViewController);
}

id sub_100014094(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for PreviewViewController()
{
  return self;
}

uint64_t sub_10001413C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100014210(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001441C((uint64_t)v12, *a3);
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
      sub_10001441C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000143CC((uint64_t)v12);
  return v7;
}

uint64_t sub_100014210(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100014478(a5, a6);
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

uint64_t sub_1000143CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10001441C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100014478(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100014510(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000146F0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000146F0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100014510(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100014688(v2, 0);
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

void *sub_100014688(uint64_t a1, uint64_t a2)
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
  sub_1000068B8(&qword_100031AE0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000146F0(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000068B8(&qword_100031AE0);
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

char *sub_100014844()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for CameraModel());
  return sub_10000967C(1);
}

ValueMetadata *type metadata accessor for BackCameraVideoView()
{
  return &type metadata for BackCameraVideoView;
}

uint64_t sub_100014888()
{
  return swift_getOpaqueTypeConformance2();
}

char *sub_1000148A4()
{
  if ([v0 allowPhotoCapture])
  {
    uint64_t v1 = sub_100014AC4(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
    unint64_t v3 = *((void *)v1 + 2);
    unint64_t v2 = *((void *)v1 + 3);
    if (v3 >= v2 >> 1) {
      uint64_t v1 = sub_100014AC4((char *)(v2 > 1), v3 + 1, 1, v1);
    }
    *((void *)v1 + 2) = v3 + 1;
    v1[v3 + 32] = 0;
  }
  else
  {
    uint64_t v1 = (char *)&_swiftEmptyArrayStorage;
  }
  if ([v0 allowSelfieCapture])
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v1 = sub_100014AC4(0, *((void *)v1 + 2) + 1, 1, v1);
    }
    unint64_t v5 = *((void *)v1 + 2);
    unint64_t v4 = *((void *)v1 + 3);
    if (v5 >= v4 >> 1) {
      uint64_t v1 = sub_100014AC4((char *)(v4 > 1), v5 + 1, 1, v1);
    }
    *((void *)v1 + 2) = v5 + 1;
    v1[v5 + 32] = 2;
  }
  if ([v0 allowVideoCapture])
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v1 = sub_100014AC4(0, *((void *)v1 + 2) + 1, 1, v1);
    }
    unint64_t v7 = *((void *)v1 + 2);
    unint64_t v6 = *((void *)v1 + 3);
    if (v7 >= v6 >> 1) {
      uint64_t v1 = sub_100014AC4((char *)(v6 > 1), v7 + 1, 1, v1);
    }
    *((void *)v1 + 2) = v7 + 1;
    v1[v7 + 32] = 1;
  }
  if ([v0 allowSelfieVideoCapture])
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v1 = sub_100014AC4(0, *((void *)v1 + 2) + 1, 1, v1);
    }
    unint64_t v9 = *((void *)v1 + 2);
    unint64_t v8 = *((void *)v1 + 3);
    if (v9 >= v8 >> 1) {
      uint64_t v1 = sub_100014AC4((char *)(v8 > 1), v9 + 1, 1, v1);
    }
    *((void *)v1 + 2) = v9 + 1;
    v1[v9 + 32] = 3;
  }
  return v1;
}

char *sub_100014AC4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      sub_1000068B8(&qword_100031B00);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_100014BC0(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_100014BC0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for PreviewViewRepresentable()
{
  return &type metadata for PreviewViewRepresentable;
}

void *sub_100014CB8()
{
  return &protocol witness table for Never;
}

char *sub_100014CC4()
{
  uint64_t v1 = *v0;
  type metadata accessor for PreviewViewController();
  unint64_t v2 = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  unint64_t v3 = *(void **)&v2[OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_cameraModel];
  *(void *)&v2[OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_cameraModel] = v1;
  id v4 = v1;

  sub_100013524();
  return v2;
}

void sub_100014D3C(uint64_t a1)
{
  unint64_t v2 = *v1;
  unint64_t v3 = *(void **)(a1 + OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_cameraModel);
  *(void *)(a1 + OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_cameraModel) = v2;
  id v4 = v2;

  sub_100013524();
}

uint64_t sub_100014DB4()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_100014DF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100014F38();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100014E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100014F38();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_100014EB8()
{
}

unint64_t sub_100014EE4()
{
  unint64_t result = qword_100031B08;
  if (!qword_100031B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031B08);
  }
  return result;
}

unint64_t sub_100014F38()
{
  unint64_t result = qword_100031B10;
  if (!qword_100031B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031B10);
  }
  return result;
}

uint64_t sub_100014F8C()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100015010(v0, qword_100033BA8);
  sub_10000D898(v0, (uint64_t)qword_100033BA8);
  return Logger.init(subsystem:category:)();
}

uint64_t *sub_100015010(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100015074()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t static UIInterfaceOrientation.window.getter()
{
  id v0 = [self sharedApplication];
  id v1 = [v0 connectedScenes];

  sub_10000DB64(0, &qword_100031BD0);
  sub_100015420();
  uint64_t v2 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  if ((v2 & 0xC000000000000001) != 0) {
    uint64_t v3 = __CocoaSet.count.getter();
  }
  else {
    uint64_t v3 = *(void *)(v2 + 16);
  }
  if (v3 >= 2)
  {
    if (qword_100031BB0 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_10000D898(v4, (uint64_t)qword_100033BC0);
    swift_bridgeObjectRetain_n();
    char v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v5, v6))
    {
      int64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)int64_t v7 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v8 = Set.description.getter();
      unint64_t v10 = v9;
      swift_bridgeObjectRelease();
      sub_10001413C(v8, v10, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Unexpectedly had multiple scenes: %s", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  sub_100015488(v2);
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  if (v12)
  {
    self;
    uint64_t v13 = (void *)swift_dynamicCastObjCClass();
    if (v13)
    {
      uint64_t v14 = (uint64_t)[v13 interfaceOrientation];
      goto LABEL_19;
    }
  }
  if (qword_100031BB0 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  sub_10000D898(v15, (uint64_t)qword_100033BC0);
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v16, "Unexpectedly had no window scene.", v17, 2u);
    swift_slowDealloc();
  }
  uint64_t v14 = 1;
LABEL_19:

  return v14;
}

unint64_t sub_100015420()
{
  unint64_t result = qword_100031BD8;
  if (!qword_100031BD8)
  {
    sub_10000DB64(255, &qword_100031BD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031BD8);
  }
  return result;
}

void sub_100015488(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_10000DB64(0, &qword_100031BD0);
    sub_100015420();
    Set.Iterator.init(_cocoa:)();
    uint64_t v1 = v17;
    uint64_t v16 = v18;
    uint64_t v2 = v19;
    uint64_t v3 = v20;
    unint64_t v4 = v21;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v16 = a1 + 56;
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
  }
  int64_t v15 = (unint64_t)(v2 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_10;
  }
LABEL_8:
  if (v4)
  {
    uint64_t v8 = (v4 - 1) & v4;
    unint64_t v9 = __clz(__rbit64(v4)) | (v3 << 6);
    uint64_t v10 = v3;
    goto LABEL_29;
  }
  int64_t v12 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v12 < v15)
    {
      unint64_t v13 = *(void *)(v16 + 8 * v12);
      uint64_t v10 = v3 + 1;
      if (v13) {
        goto LABEL_28;
      }
      uint64_t v10 = v3 + 2;
      if (v3 + 2 >= v15) {
        goto LABEL_33;
      }
      unint64_t v13 = *(void *)(v16 + 8 * v10);
      if (v13) {
        goto LABEL_28;
      }
      uint64_t v10 = v3 + 3;
      if (v3 + 3 >= v15) {
        goto LABEL_33;
      }
      unint64_t v13 = *(void *)(v16 + 8 * v10);
      if (v13) {
        goto LABEL_28;
      }
      uint64_t v10 = v3 + 4;
      if (v3 + 4 >= v15) {
        goto LABEL_33;
      }
      unint64_t v13 = *(void *)(v16 + 8 * v10);
      if (v13)
      {
LABEL_28:
        uint64_t v8 = (v13 - 1) & v13;
        unint64_t v9 = __clz(__rbit64(v13)) + (v10 << 6);
LABEL_29:
        id v11 = *(id *)(*(void *)(v1 + 48) + 8 * v9);
        if (v11)
        {
          do
          {
            sub_10000DB64(0, &qword_100031BE8);
            if ([v11 isKindOfClass:swift_getObjCClassFromMetadata()]) {
              break;
            }

            uint64_t v3 = v10;
            unint64_t v4 = v8;
            if ((v1 & 0x8000000000000000) == 0) {
              goto LABEL_8;
            }
LABEL_10:
            if (!__CocoaSet.Iterator.next()()) {
              break;
            }
            sub_10000DB64(0, &qword_100031BD0);
            swift_unknownObjectRetain();
            swift_dynamicCast();
            id v11 = v22;
            swift_unknownObjectRelease();
            uint64_t v10 = v3;
            uint64_t v8 = v4;
          }
          while (v22);
        }
        goto LABEL_33;
      }
      uint64_t v10 = v3 + 5;
      if (v3 + 5 < v15)
      {
        unint64_t v13 = *(void *)(v16 + 8 * v10);
        if (!v13)
        {
          uint64_t v14 = v3 + 6;
          while (v15 != v14)
          {
            unint64_t v13 = *(void *)(v16 + 8 * v14++);
            if (v13)
            {
              uint64_t v10 = v14 - 1;
              goto LABEL_28;
            }
          }
          goto LABEL_33;
        }
        goto LABEL_28;
      }
    }
LABEL_33:
    sub_100015898();
    return;
  }
  __break(1u);
}

uint64_t static UIInterfaceOrientation.fromDeviceOrientation(_:)(uint64_t result)
{
  if ((unint64_t)(result - 5) < 0xFFFFFFFFFFFFFFFCLL) {
    return 0;
  }
  return result;
}

BOOL variable initialization expression of PhotoLibraryView.isPad()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  return v1 == (id)1;
}

uint64_t sub_1000157F8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100015818(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
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

void type metadata accessor for CGSize()
{
  if (!qword_100031BE0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100031BE0);
    }
  }
}

uint64_t sub_100015898()
{
  return swift_release();
}

uint64_t sub_1000158A4()
{
  return swift_retain();
}

uint64_t destroy for VideoDetailView()
{
  return sub_1000158BC();
}

uint64_t sub_1000158BC()
{
  return swift_release();
}

uint64_t _s15ClarityPhotosUI15VideoDetailViewVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_1000158A4();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for VideoDetailView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_1000158A4();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_1000158BC();
  return a1;
}

uint64_t assignWithTake for VideoDetailView(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_1000158BC();
  return a1;
}

ValueMetadata *type metadata accessor for VideoDetailView()
{
  return &type metadata for VideoDetailView;
}

uint64_t sub_1000159C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000159DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v44 = a4;
  uint64_t v42 = sub_1000068B8(&qword_100031BF8);
  uint64_t v7 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  unint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000068B8(&qword_100031C00);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  uint64_t v36 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_1000068B8(&qword_100031C08) - 8;
  __chkstk_darwin(v41);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_1000068B8(&qword_100031C10);
  __chkstk_darwin(v43);
  uint64_t v37 = (uint64_t)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000068B8(&qword_100031C18);
  __chkstk_darwin(v16 - 8);
  uint64_t v40 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = type metadata accessor for PlayerViewModel();
  unint64_t v38 = sub_100015F40();
  a3 &= 1u;
  id v18 = *(id *)(StateObject.wrappedValue.getter() + 16);
  swift_release();
  VideoPlayer<>.init(player:)();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a1;
  *(void *)(v19 + 24) = a2;
  uint64_t v20 = a2;
  *(unsigned char *)(v19 + 32) = a3;
  uint64_t v21 = (uint64_t)v36;
  uint64_t v22 = v42;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v36, v9, v42);
  uint64_t v23 = (uint64_t (**)())(v21 + *(int *)(v11 + 44));
  NSObject *v23 = sub_100015F9C;
  v23[1] = (uint64_t (*)())v19;
  v23[2] = 0;
  v23[3] = 0;
  sub_1000158A4();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v22);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = a1;
  *(void *)(v24 + 24) = v20;
  *(unsigned char *)(v24 + 32) = a3;
  sub_100006E78(v21, (uint64_t)v14, &qword_100031C00);
  uint64_t v25 = &v14[*(int *)(v41 + 44)];
  *(void *)uint64_t v25 = 0;
  *((void *)v25 + 1) = 0;
  *((void *)v25 + 2) = sub_100016004;
  *((void *)v25 + 3) = v24;
  sub_1000158A4();
  sub_1000070C4(v21, &qword_100031C00);
  uint64_t v26 = v37;
  sub_100006E78((uint64_t)v14, v37, &qword_100031C08);
  *(unsigned char *)(v26 + *(int *)(v43 + 36)) = 1;
  sub_1000070C4((uint64_t)v14, &qword_100031C08);
  sub_10001602C();
  __int16 v27 = v40;
  View.accessibilityIdentifier(_:)();
  sub_1000070C4(v26, &qword_100031C10);
  double v28 = *(double *)(StateObject.wrappedValue.getter() + 24);
  swift_release();
  double v29 = *(double *)(StateObject.wrappedValue.getter() + 32);
  swift_release();
  uint64_t v30 = (uint64_t)v27;
  uint64_t v31 = (uint64_t)v27;
  uint64_t v32 = v44;
  sub_100006E78(v30, v44, &qword_100031C18);
  uint64_t v33 = v32 + *(int *)(sub_1000068B8(&qword_100031C50) + 36);
  *(double *)uint64_t v33 = v28 / v29;
  *(_WORD *)(v33 + 8) = 0;
  return sub_1000070C4(v31, &qword_100031C18);
}

uint64_t sub_100015E54(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  type metadata accessor for PlayerViewModel();
  sub_100015F40();
  [*(id *)(StateObject.wrappedValue.getter() + 16) *a4];

  return swift_release();
}

uint64_t sub_100015EDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  char v5 = *(unsigned char *)(v1 + 16);
  *(void *)a1 = static HorizontalAlignment.center.getter();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v6 = sub_1000068B8(&qword_100031BF0);
  return sub_1000159DC(v3, v4, v5, a1 + *(int *)(v6 + 44));
}

unint64_t sub_100015F40()
{
  unint64_t result = qword_100031C20;
  if (!qword_100031C20)
  {
    type metadata accessor for PlayerViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031C20);
  }
  return result;
}

uint64_t sub_100015F9C()
{
  return sub_100015E54(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned __int8 *)(v0 + 32), (SEL *)&selRef_play);
}

uint64_t sub_100015FC8()
{
  sub_1000158BC();

  return _swift_deallocObject(v0, 33, 7);
}

uint64_t sub_100016004()
{
  return sub_100015E54(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned __int8 *)(v0 + 32), (SEL *)&selRef_pause);
}

unint64_t sub_10001602C()
{
  unint64_t result = qword_100031C28;
  if (!qword_100031C28)
  {
    sub_1000068FC(&qword_100031C10);
    sub_1000160A8();
    sub_1000161C4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031C28);
  }
  return result;
}

unint64_t sub_1000160A8()
{
  unint64_t result = qword_100031C30;
  if (!qword_100031C30)
  {
    sub_1000068FC(&qword_100031C08);
    sub_100016124();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031C30);
  }
  return result;
}

unint64_t sub_100016124()
{
  unint64_t result = qword_100031C38;
  if (!qword_100031C38)
  {
    sub_1000068FC(&qword_100031C00);
    sub_100006D24(&qword_100031C40, &qword_100031BF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031C38);
  }
  return result;
}

unint64_t sub_1000161C4()
{
  unint64_t result = qword_100031C48;
  if (!qword_100031C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031C48);
  }
  return result;
}

uint64_t sub_100016218()
{
  return sub_100006D24(&qword_100031C58, &qword_100031C60);
}

char *sub_100016254(char *a1, char **a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  char v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    a1[8] = *((unsigned char *)a2 + 8);
    unint64_t v9 = a2[2];
    uint64_t v8 = a2[3];
    *((void *)a1 + 2) = v9;
    *((void *)a1 + 3) = v8;
    *((_DWORD *)a1 + 8) = *((_DWORD *)a2 + 8);
    a1[36] = *((unsigned char *)a2 + 36);
    uint64_t v10 = (uint64_t)a2[6];
    *((void *)a1 + 5) = a2[5];
    char v11 = *((unsigned char *)a2 + 56);
    uint64_t v12 = v5;
    uint64_t v13 = v9;
    swift_retain();
    swift_retain();
    sub_1000163A4(v10, v11);
    *((void *)a1 + 6) = v10;
    a1[56] = v11;
    uint64_t v14 = *(int *)(a3 + 36);
    uint64_t v15 = &a1[v14];
    uint64_t v16 = (uint64_t)a2 + v14;
    *(_OWORD *)&a1[v14] = *(_OWORD *)((char *)a2 + v14);
    uint64_t v17 = *(int *)(type metadata accessor for RoundedRectangle() + 20);
    id v18 = &v15[v17];
    uint64_t v19 = v16 + v17;
    uint64_t v20 = type metadata accessor for RoundedCornerStyle();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  }
  return a1;
}

uint64_t sub_1000163A4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1000163B0(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  sub_10001645C(*(void *)(a1 + 48), *(unsigned char *)(a1 + 56));
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = v4 + *(int *)(type metadata accessor for RoundedRectangle() + 20);
  uint64_t v6 = type metadata accessor for RoundedCornerStyle();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_10001645C(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100016468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v8 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v7;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  char v10 = *(unsigned char *)(a2 + 56);
  id v11 = v6;
  id v12 = v8;
  swift_retain();
  swift_retain();
  sub_1000163A4(v9, v10);
  *(void *)(a1 + 48) = v9;
  *(unsigned char *)(a1 + 56) = v10;
  uint64_t v13 = *(int *)(a3 + 36);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = (_OWORD *)(a2 + v13);
  *(_OWORD *)(a1 + v13) = *v15;
  uint64_t v16 = *(int *)(type metadata accessor for RoundedRectangle() + 20);
  uint64_t v17 = v14 + v16;
  id v18 = (char *)v15 + v16;
  uint64_t v19 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  return a1;
}

uint64_t sub_100016570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v9 = *(void **)(a1 + 16);
  char v10 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v10;
  id v11 = v10;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  int v12 = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v12;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  uint64_t v13 = *(void *)(a2 + 48);
  char v14 = *(unsigned char *)(a2 + 56);
  sub_1000163A4(v13, v14);
  uint64_t v15 = *(void *)(a1 + 48);
  char v16 = *(unsigned char *)(a1 + 56);
  *(void *)(a1 + 48) = v13;
  *(unsigned char *)(a1 + 56) = v14;
  sub_10001645C(v15, v16);
  uint64_t v17 = *(int *)(a3 + 36);
  id v18 = (void *)(a1 + v17);
  uint64_t v19 = a2 + v17;
  *id v18 = *(void *)(a2 + v17);
  v18[1] = *(void *)(a2 + v17 + 8);
  uint64_t v20 = *(int *)(type metadata accessor for RoundedRectangle() + 20);
  uint64_t v21 = (char *)v18 + v20;
  uint64_t v22 = v19 + v20;
  uint64_t v23 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  return a1;
}

uint64_t sub_1000166B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v5 = *(int *)(a3 + 36);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  *(_OWORD *)(a1 + v5) = *(_OWORD *)(a2 + v5);
  uint64_t v8 = *(int *)(type metadata accessor for RoundedRectangle() + 20);
  uint64_t v9 = v6 + v8;
  uint64_t v10 = v7 + v8;
  uint64_t v11 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t sub_100016768(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v7 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  char v8 = *(unsigned char *)(a2 + 56);
  uint64_t v9 = *(void *)(a1 + 48);
  char v10 = *(unsigned char *)(a1 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = v8;
  sub_10001645C(v9, v10);
  uint64_t v11 = *(int *)(a3 + 36);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (_OWORD *)(a2 + v11);
  *(_OWORD *)(a1 + v11) = *v13;
  uint64_t v14 = *(int *)(type metadata accessor for RoundedRectangle() + 20);
  uint64_t v15 = v12 + v14;
  char v16 = (char *)v13 + v14;
  uint64_t v17 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v17 - 8) + 40))(v15, v16, v17);
  return a1;
}

uint64_t sub_100016874(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100016888);
}

uint64_t sub_100016888(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for RoundedRectangle();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100016938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001694C);
}

void *sub_10001694C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for RoundedRectangle();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 36);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for PhotoViewInternal()
{
  uint64_t result = qword_100031CC0;
  if (!qword_100031CC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100016A40()
{
  uint64_t result = type metadata accessor for RoundedRectangle();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100016AFC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100016B18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v53 = sub_1000068B8(&qword_100031D08);
  __chkstk_darwin(v53);
  uint64_t v54 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))((char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v47 = type metadata accessor for PhotoViewInternal();
  uint64_t v49 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  uint64_t v50 = v4;
  uint64_t v51 = (uint64_t)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_1000068B8(&qword_100031D10);
  __chkstk_darwin(v46);
  uint64_t v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Image.ResizingMode();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_1000068B8(&qword_100031D18);
  __chkstk_darwin(v44);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_1000068B8(&qword_100031D20);
  __chkstk_darwin(v45);
  uint64_t v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_1000068B8(&qword_100031D28);
  uint64_t v15 = __chkstk_darwin(v52);
  uint64_t v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v48 = (uint64_t)&v39 - v18;
  uint64_t v19 = v1;
  long long v55 = *(_OWORD *)(v1 + 16);
  sub_1000068B8(&qword_100031D30);
  State.wrappedValue.getter();
  uint64_t v20 = v56;
  if (v56)
  {
    uint64_t v39 = static Color.clear.getter();
    uint64_t v21 = static Alignment.center.getter();
    uint64_t v40 = v22;
    uint64_t v41 = v21;
    id v43 = v20;
    Image.init(uiImage:)();
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for Image.ResizingMode.stretch(_:), v7);
    uint64_t v23 = Image.resizable(capInsets:resizingMode:)();
    uint64_t v42 = a1;
    uint64_t v24 = v23;
    swift_release();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v25 = v19 + *(int *)(v47 + 36);
    sub_100017CFC(v25, (uint64_t)v6, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    *(_WORD *)&v6[*(int *)(v46 + 36)] = 256;
    sub_100006E78((uint64_t)v6, (uint64_t)&v12[*(int *)(v44 + 36)], &qword_100031D10);
    *(void *)uint64_t v12 = v39;
    *((void *)v12 + 1) = 0x3FF0000000000000;
    *((_WORD *)v12 + 8) = 0;
    *((void *)v12 + 3) = v24;
    *((void *)v12 + 4) = 0;
    *((_WORD *)v12 + 20) = 257;
    uint64_t v26 = v40;
    *((void *)v12 + 6) = v41;
    *((void *)v12 + 7) = v26;
    sub_1000070C4((uint64_t)v6, &qword_100031D10);
    uint64_t v27 = (uint64_t)&v14[*(int *)(v45 + 36)];
    sub_100017CFC(v25, v27, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    *(unsigned char *)(v27 + *(int *)(sub_1000068B8(&qword_100031D98) + 36)) = 0;
    sub_100006E14((uint64_t)v12, (uint64_t)v14, &qword_100031D18);
    uint64_t v28 = v51;
    sub_100017CFC(v19, v51, (uint64_t (*)(void))type metadata accessor for PhotoViewInternal);
    unint64_t v29 = (*(unsigned __int8 *)(v49 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
    uint64_t v30 = swift_allocObject();
    sub_1000178A8(v28, v30 + v29);
    sub_100006E78((uint64_t)v14, (uint64_t)v17, &qword_100031D20);
    uint64_t v31 = &v17[*(int *)(v52 + 36)];
    *(void *)uint64_t v31 = 0;
    *((void *)v31 + 1) = 0;
    *((void *)v31 + 2) = sub_100017D68;
    *((void *)v31 + 3) = v30;
    sub_1000070C4((uint64_t)v14, &qword_100031D20);
    uint64_t v32 = (uint64_t)v17;
    uint64_t v33 = v48;
    sub_100006E14(v32, v48, &qword_100031D28);
    sub_100006E78(v33, (uint64_t)v54, &qword_100031D28);
    swift_storeEnumTagMultiPayload();
    sub_1000068B8(&qword_100031D38);
    sub_10001798C();
    sub_100017C5C();
    _ConditionalContent<>.init(storage:)();

    return sub_1000070C4(v33, &qword_100031D28);
  }
  else
  {
    uint64_t v35 = v51;
    sub_100017CFC(v19, v51, (uint64_t (*)(void))type metadata accessor for PhotoViewInternal);
    unint64_t v36 = (*(unsigned __int8 *)(v49 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
    uint64_t v37 = swift_allocObject();
    sub_1000178A8(v35, v37 + v36);
    unint64_t v38 = v54;
    *uint64_t v54 = sub_10001790C;
    v38[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v37;
    v38[2] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))0x3FF0000000000000;
    *((_WORD *)v38 + 12) = 0;
    swift_storeEnumTagMultiPayload();
    sub_1000068B8(&qword_100031D38);
    sub_10001798C();
    sub_100017C5C();
    return _ConditionalContent<>.init(storage:)();
  }
}

uint64_t sub_100017194()
{
  sub_1000068B8(&qword_100031D30);
  State.wrappedValue.setter();
  sub_1000068B8(&qword_100031DB8);
  State.wrappedValue.getter();
  id v0 = [self defaultManager];
  [v0 cancelImageRequest:0];

  return State.wrappedValue.setter();
}

uint64_t sub_100017294@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  uint64_t v4 = type metadata accessor for GeometryProxy();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  uint64_t v7 = type metadata accessor for PhotoViewInternal();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_1000068B8(&qword_100031DC0);
  uint64_t v11 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  ProgressView<>.init<>()();
  sub_100017CFC(v25, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for PhotoViewInternal);
  uint64_t v14 = a1;
  uint64_t v15 = v4;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v14, v4);
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v17 = (v9 + *(unsigned __int8 *)(v5 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v18 = swift_allocObject();
  sub_1000178A8((uint64_t)v10, v18 + v16);
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v18 + v17, (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
  uint64_t v19 = v26;
  uint64_t v20 = v24;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(v26, v13, v24);
  uint64_t v21 = (uint64_t (**)())(v19 + *(int *)(sub_1000068B8(&qword_100031DC8) + 36));
  *uint64_t v21 = sub_100017F74;
  v21[1] = (uint64_t (*)())v18;
  v21[2] = 0;
  v21[3] = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v20);
}

uint64_t sub_10001755C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PhotoViewInternal();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [self defaultManager];
  uint64_t v7 = *(void *)a1;
  GeometryProxy.size.getter();
  double v9 = v8;
  uint64_t v10 = *(void *)(a1 + 48);
  char v11 = *(unsigned char *)(a1 + 56);
  sub_1000163A4(v10, v11);
  double v12 = sub_10001A2E8(v10, v11);
  sub_10001645C(v10, v11);
  double v13 = v9 * v12;
  GeometryProxy.size.getter();
  double v15 = v14;
  sub_1000163A4(v10, v11);
  double v16 = sub_10001A2E8(v10, v11);
  sub_10001645C(v10, v11);
  id v17 = [objc_allocWithZone((Class)PHImageRequestOptions) init];
  [v17 setDeliveryMode:0];
  [v17 setNetworkAccessAllowed:1];
  [v17 setAllowSecondaryDegradedImage:1];
  sub_100017CFC(a1, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for PhotoViewInternal);
  unint64_t v18 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v19 = swift_allocObject();
  sub_1000178A8((uint64_t)v5, v19 + v18);
  uint64_t v30 = sub_10001816C;
  uint64_t v31 = v19;
  aBlock = _NSConcreteStackBlock;
  uint64_t v27 = 1107296256;
  uint64_t v28 = sub_10001859C;
  unint64_t v29 = &unk_10002E5B8;
  uint64_t v20 = _Block_copy(&aBlock);
  swift_release();
  LODWORD(v7) = [v6 requestImageForAsset:v7 targetSize:1 contentMode:v17 options:v20 resultHandler:v13 v15 * v16];
  _Block_release(v20);

  char v21 = *(unsigned char *)(a1 + 36);
  uint64_t v22 = *(void *)(a1 + 40);
  LODWORD(aBlock) = *(_DWORD *)(a1 + 32);
  BYTE4(aBlock) = v21;
  uint64_t v27 = v22;
  v24[2] = v7;
  char v25 = 0;
  sub_1000068B8(&qword_100031DB8);
  return State.wrappedValue.setter();
}

void *sub_100017848(void *result)
{
  if (result)
  {
    id v1 = result;
    sub_1000068B8(&qword_100031D30);
    return (void *)State.wrappedValue.setter();
  }
  return result;
}

uint64_t sub_1000178A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PhotoViewInternal();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001790C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for PhotoViewInternal() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_100017294(a1, v6, a2);
}

unint64_t sub_10001798C()
{
  unint64_t result = qword_100031D40;
  if (!qword_100031D40)
  {
    sub_1000068FC(&qword_100031D28);
    sub_100017A08();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031D40);
  }
  return result;
}

unint64_t sub_100017A08()
{
  unint64_t result = qword_100031D48;
  if (!qword_100031D48)
  {
    sub_1000068FC(&qword_100031D20);
    sub_100017AA8();
    sub_100006D24(&qword_100031D90, &qword_100031D98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031D48);
  }
  return result;
}

unint64_t sub_100017AA8()
{
  unint64_t result = qword_100031D50;
  if (!qword_100031D50)
  {
    sub_1000068FC(&qword_100031D18);
    sub_100017B48();
    sub_100006D24(&qword_100031D88, &qword_100031D10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031D50);
  }
  return result;
}

unint64_t sub_100017B48()
{
  unint64_t result = qword_100031D58;
  if (!qword_100031D58)
  {
    sub_1000068FC(&qword_100031D60);
    sub_100017BE8();
    sub_100006D24(&qword_100031D78, &qword_100031D80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031D58);
  }
  return result;
}

unint64_t sub_100017BE8()
{
  unint64_t result = qword_100031D68;
  if (!qword_100031D68)
  {
    sub_1000068FC(&qword_100031D70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031D68);
  }
  return result;
}

unint64_t sub_100017C5C()
{
  unint64_t result = qword_100031DA0;
  if (!qword_100031DA0)
  {
    sub_1000068FC(&qword_100031D38);
    sub_100006D24(&qword_100031DA8, &qword_100031DB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031DA0);
  }
  return result;
}

uint64_t sub_100017CFC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100017D68()
{
  type metadata accessor for PhotoViewInternal();

  return sub_100017194();
}

uint64_t sub_100017DC8()
{
  id v1 = (int *)(type metadata accessor for PhotoViewInternal() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = type metadata accessor for GeometryProxy();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v3 + v4 + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v2 | v7 | 7;
  uint64_t v11 = v0 + v3;

  swift_release();
  swift_release();
  sub_10001645C(*(void *)(v11 + 48), *(unsigned char *)(v11 + 56));
  uint64_t v12 = v1[11];
  uint64_t v13 = v11 + v12 + *(int *)(type metadata accessor for RoundedRectangle() + 20);
  uint64_t v14 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v5);

  return _swift_deallocObject(v0, v9, v10);
}

uint64_t sub_100017F74()
{
  uint64_t v1 = *(void *)(type metadata accessor for PhotoViewInternal() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  type metadata accessor for GeometryProxy();

  return sub_10001755C(v0 + v2);
}

uint64_t sub_100018044()
{
  uint64_t v1 = (int *)(type metadata accessor for PhotoViewInternal() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;

  swift_release();
  swift_release();
  sub_10001645C(*(void *)(v6 + 48), *(unsigned char *)(v6 + 56));
  uint64_t v7 = v1[11];
  uint64_t v8 = v6 + v7 + *(int *)(type metadata accessor for RoundedRectangle() + 20);
  uint64_t v9 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);

  return _swift_deallocObject(v0, v4, v5);
}

void *sub_10001816C(void *a1)
{
  type metadata accessor for PhotoViewInternal();

  return sub_100017848(a1);
}

uint64_t sub_1000181EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000181FC()
{
  return swift_release();
}

unint64_t sub_100018208()
{
  unint64_t result = qword_100031DD0;
  if (!qword_100031DD0)
  {
    sub_1000068FC(&qword_100031DD8);
    sub_10001798C();
    sub_100017C5C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031DD0);
  }
  return result;
}

uint64_t destroy for PhotoDetailView(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v2 = *(void *)(a1 + 40);
  char v3 = *(unsigned char *)(a1 + 48);

  return sub_10001645C(v2, v3);
}

uint64_t initializeWithCopy for PhotoDetailView(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  char v7 = *(unsigned char *)(a2 + 48);
  id v8 = v3;
  id v9 = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000163A4(v6, v7);
  *(void *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 48) = v7;
  return a1;
}

uint64_t assignWithCopy for PhotoDetailView(uint64_t a1, void **a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *a2;
  id v6 = v4;

  char v7 = *(void **)(a1 + 8);
  id v8 = v2[1];
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  *(void *)(a1 + 16) = v2[2];
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = v2[3];
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = v2[4];
  swift_retain();
  swift_release();
  uint64_t v10 = (uint64_t)v2[5];
  LOBYTE(v2) = *((unsigned char *)v2 + 48);
  sub_1000163A4(v10, (char)v2);
  uint64_t v11 = *(void *)(a1 + 40);
  char v12 = *(unsigned char *)(a1 + 48);
  *(void *)(a1 + 40) = v10;
  *(unsigned char *)(a1 + 48) = (_BYTE)v2;
  sub_10001645C(v11, v12);
  return a1;
}

__n128 initializeWithTake for PhotoDetailView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PhotoDetailView(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  char v5 = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = v5;
  sub_10001645C(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoDetailView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotoDetailView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotoDetailView()
{
  return &type metadata for PhotoDetailView;
}

uint64_t sub_100018580()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000185A0()
{
  return sub_10001AE98(*v0);
}

uint64_t sub_1000185B0(uint64_t a1)
{
  return sub_10001AF34(a1);
}

uint64_t sub_1000185C8()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t sub_10001860C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, WitnessTable);
}

uint64_t sub_100018688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, WitnessTable);
}

void sub_100018704()
{
}

uint64_t sub_100018744()
{
  id v12 = *(id *)v0;
  long long v9 = *(_OWORD *)(v0 + 8);
  sub_100006E14((uint64_t)&v9, (uint64_t)&v11, &qword_100031DE0);
  sub_100006E14((uint64_t)&v9 + 8, (uint64_t)v10, &qword_100031DE8);
  long long v6 = *(_OWORD *)(v0 + 24);
  sub_100006E14((uint64_t)&v6, (uint64_t)v8, &qword_100031DF0);
  sub_100006E14((uint64_t)&v6 + 8, (uint64_t)v7, &qword_100031DF8);
  uint64_t v4 = *(void *)(v0 + 40);
  char v5 = *(unsigned char *)(v0 + 48);
  uint64_t v1 = swift_allocObject();
  long long v2 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)v0;
  *(_OWORD *)(v1 + 32) = v2;
  *(_OWORD *)(v1 + 48) = *(_OWORD *)(v0 + 32);
  *(unsigned char *)(v1 + 64) = *(unsigned char *)(v0 + 48);
  sub_10001A28C(&v12);
  sub_10001A28C(&v11);
  sub_1000069A8((uint64_t)v10);
  sub_1000069A8((uint64_t)v8);
  sub_1000069A8((uint64_t)v7);
  sub_10001A2B8((uint64_t)&v4);
  LocalizedStringKey.init(stringLiteral:)();
  Image.init(systemName:)();
  sub_1000068B8(&qword_100031E00);
  sub_100006D24(&qword_100031E08, &qword_100031E00);
  View.navigationTitle<A>(_:icon:)();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

double sub_100018944@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v21 = *(id *)a1;
  if ([v21 mediaType] == (id)2)
  {
    sub_100018B4C((uint64_t)v10);
  }
  else
  {
    long long v18 = *(_OWORD *)(a1 + 8);
    sub_100006E14((uint64_t)&v18, (uint64_t)&v20, &qword_100031DE0);
    sub_100006E14((uint64_t)&v18 + 8, (uint64_t)v19, &qword_100031DE8);
    long long v15 = *(_OWORD *)(a1 + 24);
    sub_100006E14((uint64_t)&v15, (uint64_t)v17, &qword_100031DF0);
    sub_100006E14((uint64_t)&v15 + 8, (uint64_t)v16, &qword_100031DF8);
    uint64_t v13 = *(void *)(a1 + 40);
    char v14 = *(unsigned char *)(a1 + 48);
    uint64_t v4 = swift_allocObject();
    long long v5 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v4 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v4 + 32) = v5;
    *(_OWORD *)(v4 + 48) = *(_OWORD *)(a1 + 32);
    *(unsigned char *)(v4 + 64) = *(unsigned char *)(a1 + 48);
    sub_10001A28C(&v21);
    sub_10001A28C(&v20);
    sub_1000069A8((uint64_t)v19);
    sub_1000069A8((uint64_t)v17);
    sub_1000069A8((uint64_t)v16);
    sub_10001A2B8((uint64_t)&v13);
  }
  sub_1000068B8(&qword_100031E10);
  sub_1000068B8(&qword_100031E18);
  sub_10001A500();
  sub_100006D24(&qword_100031E50, &qword_100031E18);
  _ConditionalContent<>.init(storage:)();
  double result = *(double *)v10;
  long long v7 = v10[1];
  __int16 v8 = v11;
  char v9 = v12;
  *(_OWORD *)a2 = v10[0];
  *(_OWORD *)(a2 + 16) = v7;
  *(_WORD *)(a2 + 32) = v8;
  *(unsigned char *)(a2 + 34) = v9;
  return result;
}

double sub_100018B4C@<D0>(uint64_t a1@<X8>)
{
  long long v17 = *(_OWORD *)(v1 + 24);
  long long v7 = *(_OWORD *)(v1 + 24);
  sub_1000068B8(&qword_100031E58);
  State.wrappedValue.getter();
  if (v6)
  {
    static Alignment.bottom.getter();
  }
  else
  {
    sub_100006E14((uint64_t)&v17 + 8, (uint64_t)v19, &qword_100031DF8);
    sub_100006E14((uint64_t)&v17, (uint64_t)v18, &qword_100031DF0);
    id v16 = *(id *)v1;
    long long v13 = *(_OWORD *)(v1 + 8);
    sub_100006E14((uint64_t)&v13, (uint64_t)&v15, &qword_100031DE0);
    sub_100006E14((uint64_t)&v13 + 8, (uint64_t)v14, &qword_100031DE8);
    uint64_t v11 = *(void *)(v1 + 40);
    char v12 = *(unsigned char *)(v1 + 48);
    uint64_t v3 = swift_allocObject();
    long long v4 = *(_OWORD *)(v1 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)v1;
    *(_OWORD *)(v3 + 32) = v4;
    *(_OWORD *)(v3 + 48) = *(_OWORD *)(v1 + 32);
    *(unsigned char *)(v3 + 64) = *(unsigned char *)(v1 + 48);
    sub_10001A28C(&v16);
    sub_10001A28C(&v15);
    sub_1000069A8((uint64_t)v14);
    sub_1000069A8((uint64_t)v18);
    sub_1000069A8((uint64_t)v19);
    sub_10001A2B8((uint64_t)&v11);
  }
  sub_1000068B8(&qword_100031E30);
  sub_1000068B8(&qword_100031E40);
  sub_100006D24(&qword_100031E28, &qword_100031E30);
  sub_10001A810(&qword_100031E38, &qword_100031E40, (void (*)(void))sub_10001A5CC);
  _ConditionalContent<>.init(storage:)();
  double result = *(double *)&v7;
  *(_OWORD *)a1 = v7;
  *(_OWORD *)(a1 + 16) = v8;
  *(unsigned char *)(a1 + 32) = v9;
  *(unsigned char *)(a1 + 33) = v10;
  return result;
}

void sub_100018D80(uint64_t a1)
{
  if (qword_100031BB0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10000D898(v2, (uint64_t)qword_100033BC0);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    long long v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Requesting asset for video", v5, 2u);
    swift_slowDealloc();
  }

  id v6 = [objc_allocWithZone((Class)PHVideoRequestOptions) init];
  [v6 setNetworkAccessAllowed:1];
  id v7 = [self defaultManager];
  id v22 = *(id *)a1;
  id v8 = v22;
  long long v19 = *(_OWORD *)(a1 + 8);
  sub_100006E14((uint64_t)&v19, (uint64_t)&v21, &qword_100031DE0);
  sub_100006E14((uint64_t)&v19 + 8, (uint64_t)v20, &qword_100031DE8);
  long long v16 = *(_OWORD *)(a1 + 24);
  sub_100006E14((uint64_t)&v16, (uint64_t)v18, &qword_100031DF0);
  sub_100006E14((uint64_t)&v16 + 8, (uint64_t)v17, &qword_100031DF8);
  uint64_t v14 = *(void *)(a1 + 40);
  char v15 = *(unsigned char *)(a1 + 48);
  uint64_t v9 = swift_allocObject();
  long long v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v9 + 32) = v10;
  *(_OWORD *)(v9 + 48) = *(_OWORD *)(a1 + 32);
  *(unsigned char *)(v9 + 64) = *(unsigned char *)(a1 + 48);
  v13[4] = sub_10001A638;
  v13[5] = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_10001859C;
  v13[3] = &unk_10002E708;
  uint64_t v11 = _Block_copy(v13);
  id v12 = v6;
  sub_10001A28C(&v22);
  sub_10001A28C(&v21);
  sub_1000069A8((uint64_t)v20);
  sub_1000069A8((uint64_t)v18);
  sub_1000069A8((uint64_t)v17);
  sub_10001A2B8((uint64_t)&v14);
  swift_release();
  [v7 requestPlayerItemForVideo:v8 options:v12 resultHandler:v11];
  _Block_release(v11);
}

void sub_100019040(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v4 = qword_100031BB0;
    id v5 = a1;
    if (v4 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_10000D898(v6, (uint64_t)qword_100033BC0);
    id v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Got player item", v9, 2u);
      swift_slowDealloc();
    }

    id v10 = *(id *)a3;
    id v11 = v5;
    double v12 = (double)(uint64_t)[v10 pixelWidth];
    double v13 = (double)(uint64_t)[v10 pixelHeight];
    type metadata accessor for PlayerViewModel();
    uint64_t v14 = swift_allocObject();
    id v15 = [objc_allocWithZone((Class)AVPlayer) initWithPlayerItem:v11];

    *(void *)(v14 + 16) = v15;
    *(double *)(v14 + 24) = v12;
    *(double *)(v14 + 32) = v13;
    long long v31 = *(_OWORD *)(a3 + 24);
    *(void *)&long long v28 = v14;
    sub_1000068B8(&qword_100031E58);
    State.wrappedValue.setter();
  }
  else
  {
    if (qword_100031BB0 != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    sub_10000D898(v16, (uint64_t)qword_100033BC0);
    id v34 = *(id *)a3;
    long long v31 = *(_OWORD *)(a3 + 8);
    sub_100006E14((uint64_t)&v31, (uint64_t)&v33, &qword_100031DE0);
    sub_100006E14((uint64_t)&v31 + 8, (uint64_t)v32, &qword_100031DE8);
    long long v28 = *(_OWORD *)(a3 + 24);
    sub_100006E14((uint64_t)&v28, (uint64_t)v30, &qword_100031DF0);
    sub_100006E14((uint64_t)&v28 + 8, (uint64_t)v29, &qword_100031DF8);
    uint64_t v26 = *(void *)(a3 + 40);
    char v27 = *(unsigned char *)(a3 + 48);
    sub_10001A28C(&v34);
    sub_10001A28C(&v33);
    sub_1000069A8((uint64_t)v32);
    sub_1000069A8((uint64_t)v30);
    sub_1000069A8((uint64_t)v29);
    sub_10001A2B8((uint64_t)&v26);
    swift_bridgeObjectRetain();
    sub_10001A28C(&v34);
    sub_10001A28C(&v33);
    sub_1000069A8((uint64_t)v32);
    sub_1000069A8((uint64_t)v30);
    sub_1000069A8((uint64_t)v29);
    sub_10001A2B8((uint64_t)&v26);
    swift_bridgeObjectRetain();
    long long v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      id v19 = v34;
      uint64_t v20 = swift_slowAlloc();
      id v21 = (void *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 138412546;
      id v22 = v19;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v21 = v19;
      sub_10001A658(&v34);
      sub_10001A658(&v33);
      sub_100007098((uint64_t)v32);
      sub_100007098((uint64_t)v30);
      sub_100007098((uint64_t)v29);
      sub_10001A684((uint64_t)&v26);
      sub_10001A658(&v34);
      sub_10001A658(&v33);
      sub_100007098((uint64_t)v32);
      sub_100007098((uint64_t)v30);
      sub_100007098((uint64_t)v29);
      sub_10001A684((uint64_t)&v26);
      *(_WORD *)(v20 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_1000068B8(&qword_100031E60);
      uint64_t v23 = String.init<A>(describing:)();
      sub_10001413C(v23, v24, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Could not get playerItem for %@. Info: %s", (uint8_t *)v20, 0x16u);
      sub_1000068B8(&qword_1000316D8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_10001A658(&v34);
      sub_10001A658(&v33);
      sub_100007098((uint64_t)v32);
      sub_100007098((uint64_t)v30);
      sub_100007098((uint64_t)v29);
      sub_10001A684((uint64_t)&v26);
      sub_10001A658(&v34);
      sub_10001A658(&v33);
      sub_100007098((uint64_t)v32);
      sub_100007098((uint64_t)v30);
      sub_100007098((uint64_t)v29);
      sub_10001A684((uint64_t)&v26);

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_100019594(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void (**)(void *, uint64_t))(a1 + 32);
  if (a3) {
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a2;
  v4(a2, v5);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100019640@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v23[1] = a3;
  v23[0] = type metadata accessor for GeometryProxy();
  uint64_t v5 = *(void *)(v23[0] - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v23[0]);
  uint64_t v7 = sub_1000068B8(&qword_100031E68);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000068B8(&qword_100031E70);
  __chkstk_darwin(v10);
  double v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019A18(a2, (uint64_t)v9);
  GeometryProxy.size.getter();
  GeometryProxy.size.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_100006E78((uint64_t)v9, (uint64_t)v12, &qword_100031E68);
  double v13 = &v12[*(int *)(v10 + 36)];
  long long v14 = v25;
  *(_OWORD *)double v13 = v24;
  *((_OWORD *)v13 + 1) = v14;
  *((_OWORD *)v13 + 2) = v26;
  sub_1000070C4((uint64_t)v9, &qword_100031E68);
  GeometryProxy.size.getter();
  v23[2] = v15;
  v23[3] = v16;
  id v35 = *(id *)a2;
  long long v32 = *(_OWORD *)(a2 + 8);
  sub_100006E14((uint64_t)&v32, (uint64_t)&v34, &qword_100031DE0);
  sub_100006E14((uint64_t)&v32 + 8, (uint64_t)v33, &qword_100031DE8);
  long long v29 = *(_OWORD *)(a2 + 24);
  sub_100006E14((uint64_t)&v29, (uint64_t)v31, &qword_100031DF0);
  sub_100006E14((uint64_t)&v29 + 8, (uint64_t)v30, &qword_100031DF8);
  uint64_t v27 = *(void *)(a2 + 40);
  char v28 = *(unsigned char *)(a2 + 48);
  uint64_t v17 = a1;
  uint64_t v18 = v23[0];
  (*(void (**)(char *, uint64_t, void))(v5 + 16))((char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v17, v23[0]);
  unint64_t v19 = (*(unsigned __int8 *)(v5 + 80) + 65) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v20 = swift_allocObject();
  long long v21 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v20 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v20 + 32) = v21;
  *(_OWORD *)(v20 + 48) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(v20 + 64) = *(unsigned char *)(a2 + 48);
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v20 + v19, (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v18);
  sub_10001A28C(&v35);
  sub_10001A28C(&v34);
  sub_1000069A8((uint64_t)v33);
  sub_1000069A8((uint64_t)v31);
  sub_1000069A8((uint64_t)v30);
  sub_10001A2B8((uint64_t)&v27);
  type metadata accessor for CGSize();
  sub_10001A810(&qword_100031E78, &qword_100031E70, (void (*)(void))sub_10001A88C);
  sub_10001AA9C(&qword_100031EB8, (void (*)(uint64_t))type metadata accessor for CGSize);
  View.onChange<A>(of:initial:_:)();
  swift_release();
  return sub_1000070C4((uint64_t)v12, &qword_100031E70);
}

uint64_t sub_100019A18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Image.ResizingMode();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000068B8(&qword_100031EA0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000068B8(qword_100031EC0);
  __chkstk_darwin(v11);
  double v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v19 = *(_OWORD *)(a1 + 8);
  sub_1000068B8(&qword_100031D30);
  State.wrappedValue.getter();
  if (v21)
  {
    id v14 = v21;
    v18[1] = a2;
    id v15 = v14;
    Image.init(uiImage:)();
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Image.ResizingMode.stretch(_:), v4);
    uint64_t v16 = Image.resizable(capInsets:resizingMode:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    long long v19 = (unint64_t)v16;
    __int16 v20 = 1;
    sub_1000068B8(&qword_100031EB0);
    sub_10001AA28();
    View.accessibilityIdentifier(_:)();
    swift_release();
    sub_100006E78((uint64_t)v10, (uint64_t)v13, &qword_100031EA0);
    swift_storeEnumTagMultiPayload();
    sub_10001A97C();
    sub_10001A5CC();
    _ConditionalContent<>.init(storage:)();

    return sub_1000070C4((uint64_t)v10, &qword_100031EA0);
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    sub_10001A97C();
    sub_10001A5CC();
    return _ConditionalContent<>.init(storage:)();
  }
}

void sub_100019D10(uint64_t a1)
{
  id v2 = [self defaultManager];
  id v24 = *(id *)a1;
  id v3 = v24;
  GeometryProxy.size.getter();
  double v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 48);
  sub_1000163A4(v6, v7);
  double v8 = sub_10001A2E8(v6, v7);
  sub_10001645C(v6, v7);
  double v9 = v5 * v8;
  GeometryProxy.size.getter();
  double v11 = v10;
  sub_1000163A4(v6, v7);
  double v12 = sub_10001A2E8(v6, v7);
  sub_10001645C(v6, v7);
  id v13 = [objc_allocWithZone((Class)PHImageRequestOptions) init];
  [v13 setDeliveryMode:0];
  [v13 setNetworkAccessAllowed:1];
  [v13 setAllowSecondaryDegradedImage:1];
  long long v21 = *(_OWORD *)(a1 + 8);
  sub_100006E14((uint64_t)&v21, (uint64_t)&v23, &qword_100031DE0);
  sub_100006E14((uint64_t)&v21 + 8, (uint64_t)v22, &qword_100031DE8);
  long long v18 = *(_OWORD *)(a1 + 24);
  sub_100006E14((uint64_t)&v18, (uint64_t)v20, &qword_100031DF0);
  sub_100006E14((uint64_t)&v18 + 8, (uint64_t)v19, &qword_100031DF8);
  uint64_t v14 = swift_allocObject();
  long long v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v14 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v14 + 32) = v15;
  *(_OWORD *)(v14 + 48) = *(_OWORD *)(a1 + 32);
  *(unsigned char *)(v14 + 64) = *(unsigned char *)(a1 + 48);
  v17[4] = sub_10001AB4C;
  v17[5] = v14;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_10001859C;
  v17[3] = &unk_10002E780;
  uint64_t v16 = _Block_copy(v17);
  sub_1000163A4(v6, v7);
  sub_10001A28C(&v24);
  sub_10001A28C(&v23);
  sub_1000069A8((uint64_t)v22);
  sub_1000069A8((uint64_t)v20);
  sub_1000069A8((uint64_t)v19);
  swift_release();
  [v2 requestImageForAsset:v3 targetSize:0 contentMode:v13 options:v16 resultHandler:v9, v11 * v12];
  _Block_release(v16);
}

uint64_t sub_100019FC4(void *a1)
{
  id v1 = a1;
  sub_1000068B8(&qword_100031D30);
  return State.wrappedValue.setter();
}

uint64_t sub_10001A014@<X0>(uint64_t a1@<X8>)
{
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t result = Text.init(_:tableName:bundle:comment:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_10001A088@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000068B8(&qword_100031DC0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  ProgressView<>.init<>()();
  uint64_t v6 = static Color.white.getter();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  double v8 = (uint64_t *)(a1 + *(int *)(sub_1000068B8(&qword_100031F48) + 36));
  *double v8 = KeyPath;
  v8[1] = v6;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_10001A1A8()
{
  sub_1000068B8(&qword_100031F48);
  sub_10001AD7C();

  return Label.init(title:icon:)();
}

double sub_10001A240@<D0>(uint64_t a1@<X8>)
{
  sub_100018944(v1 + 16, (uint64_t)v7);
  __int16 v3 = v8;
  char v4 = v9;
  double result = *(double *)v7;
  long long v6 = v7[1];
  *(_OWORD *)a1 = v7[0];
  *(_OWORD *)(a1 + 16) = v6;
  *(_WORD *)(a1 + 32) = v3;
  *(unsigned char *)(a1 + 34) = v4;
  return result;
}

id *sub_10001A28C(id *a1)
{
  id v2 = *a1;
  return a1;
}

uint64_t sub_10001A2B8(uint64_t a1)
{
  return a1;
}

double sub_10001A2E8(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = static os_log_type_t.fault.getter();
  char v9 = static Log.runtimeIssuesLog.getter();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    double v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)double v11 = 136315138;
    uint64_t v13 = sub_10001413C(0x74616F6C464743, 0xE700000000000000, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath();
  sub_10001645C(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return *(double *)&v14;
}

uint64_t sub_10001A4F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100019640(a1, v2 + 16, a2);
}

unint64_t sub_10001A500()
{
  unint64_t result = qword_100031E20;
  if (!qword_100031E20)
  {
    sub_1000068FC(&qword_100031E10);
    sub_100006D24(&qword_100031E28, &qword_100031E30);
    sub_10001A810(&qword_100031E38, &qword_100031E40, (void (*)(void))sub_10001A5CC);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031E20);
  }
  return result;
}

unint64_t sub_10001A5CC()
{
  unint64_t result = qword_100031E48;
  if (!qword_100031E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031E48);
  }
  return result;
}

void sub_10001A624()
{
  sub_100018D80(v0 + 16);
}

uint64_t sub_10001A62C()
{
  return swift_retain();
}

void sub_10001A638(void *a1, uint64_t a2)
{
  sub_100019040(a1, a2, v2 + 16);
}

uint64_t sub_10001A640(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001A650()
{
  return swift_release();
}

id *sub_10001A658(id *a1)
{
  return a1;
}

uint64_t sub_10001A684(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001A6B4()
{
  uint64_t v1 = type metadata accessor for GeometryProxy();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 65) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  swift_release();
  swift_release();
  swift_release();
  sub_10001645C(*(void *)(v0 + 56), *(unsigned char *)(v0 + 64));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_10001A7AC()
{
  type metadata accessor for GeometryProxy();

  sub_100019D10(v0 + 16);
}

uint64_t sub_10001A810(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000068FC(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001A88C()
{
  unint64_t result = qword_100031E80;
  if (!qword_100031E80)
  {
    sub_1000068FC(&qword_100031E68);
    sub_10001A900();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031E80);
  }
  return result;
}

unint64_t sub_10001A900()
{
  unint64_t result = qword_100031E88;
  if (!qword_100031E88)
  {
    sub_1000068FC(&qword_100031E90);
    sub_10001A97C();
    sub_10001A5CC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031E88);
  }
  return result;
}

unint64_t sub_10001A97C()
{
  unint64_t result = qword_100031E98;
  if (!qword_100031E98)
  {
    sub_1000068FC(&qword_100031EA0);
    sub_10001AA28();
    sub_10001AA9C((unint64_t *)&qword_1000314C8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031E98);
  }
  return result;
}

unint64_t sub_10001AA28()
{
  unint64_t result = qword_100031EA8;
  if (!qword_100031EA8)
  {
    sub_1000068FC(&qword_100031EB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031EA8);
  }
  return result;
}

uint64_t sub_10001AA9C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001AAE8()
{
  swift_release();
  swift_release();
  swift_release();
  sub_10001645C(*(void *)(v0 + 56), *(unsigned char *)(v0 + 64));

  return _swift_deallocObject(v0, 65, 7);
}

uint64_t sub_10001AB4C(void *a1)
{
  return sub_100019FC4(a1);
}

ValueMetadata *type metadata accessor for PhotoDetailView.LoadingView()
{
  return &type metadata for PhotoDetailView.LoadingView;
}

uint64_t sub_10001AB64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

void *sub_10001AB6C(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_10001AB9C()
{
  return swift_release();
}

void *sub_10001ABA4(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_10001ABE0(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_10001AC14(uint64_t *a1, int a2)
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

uint64_t sub_10001AC5C(uint64_t result, int a2, int a3)
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for PhotoViewHost()
{
  return sub_10001AFF8();
}

uint64_t sub_10001ACB0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001AD44()
{
  return swift_getWitnessTable();
}

uint64_t sub_10001AD60()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10001AD7C()
{
  unint64_t result = qword_100031F50;
  if (!qword_100031F50)
  {
    sub_1000068FC(&qword_100031F48);
    sub_100006D24(&qword_100031F58, &qword_100031DC0);
    sub_100006D24(&qword_1000314B0, &qword_1000314B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031F50);
  }
  return result;
}

uint64_t sub_10001AE40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.tintColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10001AE6C()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t sub_10001AE98(void (*a1)(void))
{
  return _UIHostingView.__allocating_init(rootView:)();
}

uint64_t sub_10001AF34(uint64_t a1)
{
  uint64_t v1 = __chkstk_darwin(a1);
  v2(v1);
  return dispatch thunk of _UIHostingView.rootView.setter();
}

uint64_t sub_10001AFF8()
{
  return swift_getGenericMetadata();
}

uint64_t sub_10001B028()
{
  return sub_100006D24(&qword_100031F60, &qword_100031F68);
}

uint64_t sub_10001B074()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100015010(v0, qword_100033BC0);
  sub_10000D898(v0, (uint64_t)qword_100033BC0);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10001B0F8()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OSSignposter();
  sub_100015010(v4, qword_100033BD8);
  sub_10000D898(v4, (uint64_t)qword_100033BD8);
  if (qword_100031BB0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10000D898(v0, (uint64_t)qword_100033BC0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return OSSignposter.init(logger:)();
}

ValueMetadata *type metadata accessor for PhotoCollection()
{
  return &type metadata for PhotoCollection;
}

uint64_t sub_10001B244()
{
  return sub_100006D24(&qword_100031F70, &qword_100031F78);
}

id sub_10001B288(int64_t a1, uint64_t a2, int64_t a3, id a4)
{
  id result = [a4 count];
  if (a1 < 0 || (uint64_t)result < a1)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id result = [a4 count];
  if (a3 < 0 || (uint64_t)result < a3) {
    goto LABEL_17;
  }
  uint64_t v9 = a3 - a1;
  if (a2 >= 1)
  {
    if (v9 < 0 || v9 >= a2) {
      goto LABEL_12;
    }
    return 0;
  }
  if (v9 <= 0 && v9 > a2) {
    return 0;
  }
LABEL_12:
  BOOL v11 = __OFADD__(a1, a2);
  int64_t v10 = a1 + a2;
  if (v11)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id result = [a4 count];
  if ((v10 & 0x8000000000000000) == 0 && (uint64_t)result >= v10) {
    return (id)v10;
  }
LABEL_19:
  __break(1u);
  return result;
}

void *sub_10001B36C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFSUB__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result - 1;
  }
  return result;
}

void *sub_10001B384(void *result)
{
  if (__OFSUB__(*result, 1)) {
    __break(1u);
  }
  else {
    --*result;
  }
  return result;
}

void sub_10001B39C(void *a1@<X8>)
{
  *a1 = 0;
}

id sub_10001B3A4@<X0>(void *a1@<X8>)
{
  id result = [*v1 count];
  *a1 = result;
  return result;
}

void (*sub_10001B3D8(void *a1, void *a2))(uint64_t a1)
{
  id v4 = [*v2 objectAtIndexedSubscript:*a2];
  *a1 = v4;
  a1[1] = v4;
  return destroy for CameraVideoView;
}

uint64_t sub_10001B434@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  id v7 = *v2;
  uint64_t result = (uint64_t)[*v2 count];
  if (result < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v5 < 0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (result < v4)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  *a2 = v5;
  a2[1] = v4;
  a2[2] = v7;

  return (uint64_t)v7;
}

unint64_t sub_10001B4B4@<X0>(void *a1@<X8>)
{
  unint64_t result = (unint64_t)[*v1 count];
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    *a1 = 0;
    a1[1] = result;
  }
  return result;
}

BOOL sub_10001B4F0()
{
  return [*v0 count] == 0;
}

void sub_10001B520(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

void *sub_10001B530@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else
  {
    unint64_t result = [*v3 count];
    if ((v5 & 0x8000000000000000) == 0 && (uint64_t)result >= v5)
    {
      *a3 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

id sub_10001B58C@<X0>(int64_t *a1@<X0>, uint64_t a2@<X1>, int64_t *a3@<X2>, uint64_t a4@<X8>)
{
  id result = sub_10001B288(*a1, a2, *a3, *v4);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v7 & 1;
  return result;
}

id sub_10001B5C8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  id v5 = *v2;
  id result = [*v2 count];
  if (v3 < 0 || (uint64_t)result < v3)
  {
    __break(1u);
  }
  else
  {
    id result = [v5 count];
    if ((v4 & 0x8000000000000000) == 0 && (uint64_t)result >= v4) {
      return (id)(v4 - v3);
    }
  }
  __break(1u);
  return result;
}

uint64_t *sub_10001B638(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = a2[1];
  if (*result >= *a2)
  {
    BOOL v5 = __OFSUB__(v2, v3);
    BOOL v4 = v2 - v3 < 0;
  }
  else
  {
    BOOL v5 = 0;
    BOOL v4 = 0;
  }
  if (v4 == v5) {
    __break(1u);
  }
  return result;
}

void *sub_10001B654(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < *result) {
    __break(1u);
  }
  return result;
}

void *sub_10001B670(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < result[1]) {
    __break(1u);
  }
  return result;
}

void *sub_10001B68C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result + 1;
  }
  return result;
}

void *sub_10001B6A4(void *result)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    ++*result;
  }
  return result;
}

void sub_10001B6BC(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0;
}

int64_t sub_10001B6C8()
{
  uint64_t v1 = *v0;
  int64_t v2 = (int64_t)[v1 count];
  int64_t result = (int64_t)[v1 count];
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    int64_t result = (int64_t)[v1 count];
    if ((v2 & 0x8000000000000000) == 0 && result >= v2) {
      return v2;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10001B738()
{
  return 2;
}

uint64_t sub_10001B740()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_10001BC90(*v0);

  return v2;
}

void *sub_10001B774(void *a1, void *a2, uint64_t a3)
{
  return sub_10001B77C(a1, a2, a3, *v3);
}

void *sub_10001B77C(void *result, void *a2, uint64_t a3, id a4)
{
  BOOL v5 = result;
  if (!a2)
  {
LABEL_10:
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = a3;
  if (!a3)
  {
LABEL_11:
    *BOOL v5 = a4;
    v5[1] = v6;
    return (void *)v6;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if ([a4 count])
    {
      *a2 = [a4 objectAtIndexedSubscript:0];
      if (v6 != 1)
      {
        uint64_t v8 = 1;
        while ((id)v8 != [a4 count])
        {
          a2[v8] = [a4 objectAtIndexedSubscript:v8];
          if (v6 == ++v8) {
            goto LABEL_11;
          }
        }
        uint64_t v6 = v8;
      }
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001B868()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

unint64_t sub_10001B890()
{
  unint64_t result = qword_100031F80;
  if (!qword_100031F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031F80);
  }
  return result;
}

void *sub_10001B8E4()
{
  return &protocol witness table for Int;
}

uint64_t sub_10001B8F0()
{
  return sub_10001BB14(&qword_100031F88);
}

unint64_t sub_10001B924()
{
  unint64_t result = qword_100031F98;
  if (!qword_100031F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031F98);
  }
  return result;
}

uint64_t sub_10001B978()
{
  return sub_100006D24(&qword_100031FA0, &qword_100031FA8);
}

unint64_t sub_10001B9B8()
{
  unint64_t result = qword_100031FB0;
  if (!qword_100031FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031FB0);
  }
  return result;
}

uint64_t sub_10001BA0C()
{
  return sub_10001BB14(&qword_100031FB8);
}

uint64_t sub_10001BA40()
{
  return sub_10001BBCC(&qword_100031FC0, (void (*)(void))sub_10001BA88);
}

unint64_t sub_10001BA88()
{
  unint64_t result = qword_100031FC8;
  if (!qword_100031FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031FC8);
  }
  return result;
}

uint64_t sub_10001BAE0()
{
  return sub_10001BB14(&qword_100031FD0);
}

uint64_t sub_10001BB14(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000068FC(&qword_100031F90);
    sub_10001B924();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001BB84()
{
  return sub_10001BBCC(&qword_100031FD8, (void (*)(void))sub_10001BC3C);
}

uint64_t sub_10001BBCC(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000068FC(&qword_100031FA8);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001BC3C()
{
  unint64_t result = qword_100031FE0;
  if (!qword_100031FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100031FE0);
  }
  return result;
}

uint64_t sub_10001BC90(void *a1)
{
  uint64_t v2 = (uint64_t)[a1 count];
  uint64_t result = (uint64_t)[a1 count];
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t result = (uint64_t)[a1 count];
    if ((v2 & 0x8000000000000000) == 0 && result >= v2)
    {
      if (v2)
      {
        sub_1000068B8(&qword_100031FE8);
        BOOL v4 = (void *)swift_allocObject();
        int64_t v5 = j__malloc_size(v4);
        uint64_t v6 = v5 - 32;
        if (v5 < 32) {
          uint64_t v6 = v5 - 25;
        }
        v4[2] = v2;
        v4[3] = 2 * (v6 >> 3);
        char v7 = sub_10001B77C(v8, v4 + 4, v2, a1);

        if (v7 == (void *)v2) {
          return (uint64_t)v4;
        }
        __break(1u);
      }
      return (uint64_t)&_swiftEmptyArrayStorage;
    }
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for PhotoView()
{
  return &type metadata for PhotoView;
}

uint64_t sub_10001BD94()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001BDB0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v3 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v38 = *(void *)(v3 - 8);
  uint64_t v39 = v3;
  __chkstk_darwin(v3);
  int64_t v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PhotoViewInternal();
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000068B8(&qword_100031FF0);
  __chkstk_darwin(v10);
  double v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_1000068B8(&qword_100031FF8);
  uint64_t v13 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  long long v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = 0;
  id v16 = a1;
  sub_1000068B8(&qword_100031DE0);
  State.init(wrappedValue:)();
  *((_OWORD *)v9 + 1) = v43;
  LODWORD(v41) = 0;
  BYTE4(v41) = 1;
  sub_1000068B8(&qword_100032000);
  State.init(wrappedValue:)();
  char v17 = BYTE4(v43);
  uint64_t v18 = *((void *)&v43 + 1);
  *((_DWORD *)v9 + 8) = v43;
  v9[36] = v17;
  *((void *)v9 + 5) = v18;
  *((void *)v9 + 6) = swift_getKeyPath();
  v9[56] = 0;
  long long v19 = &v9[*(int *)(v7 + 44)];
  __int16 v20 = &v19[*(int *)(type metadata accessor for RoundedRectangle() + 20)];
  uint64_t v21 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v22 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 104))(v20, v21, v22);
  __asm { FMOV            V0.2D, #10.0 }
  *(_OWORD *)long long v19 = _Q0;
  *(void *)uint64_t v9 = v16;
  v9[8] = 0;
  id v28 = [v16 localIdentifier];
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v31 = v30;

  sub_10001C23C((uint64_t)v9, (uint64_t)v12);
  long long v32 = (uint64_t *)&v12[*(int *)(v10 + 52)];
  *long long v32 = v29;
  v32[1] = v31;
  sub_10001C2A0((uint64_t)v9);
  static AccessibilityChildBehavior.ignore.getter();
  unint64_t v33 = sub_10001C2FC();
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v5, v39);
  sub_10001C358((uint64_t)v12);
  *(void *)&long long v43 = sub_10001C4C0(v16);
  *((void *)&v43 + 1) = v34;
  uint64_t v41 = v10;
  unint64_t v42 = v33;
  swift_getOpaqueTypeConformance2();
  sub_10001C3B8();
  uint64_t v35 = v37;
  View.accessibilityLabel<A>(_:)();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v35);
}

uint64_t sub_10001C18C@<X0>(uint64_t a1@<X8>)
{
  return sub_10001BDB0(*v1, a1);
}

uint64_t sub_10001C194@<X0>(void *a1@<X8>)
{
  uint64_t result = EnvironmentValues.displayScale.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_10001C1C0@<X0>(void *a1@<X8>)
{
  uint64_t result = EnvironmentValues.displayScale.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_10001C1EC()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t sub_10001C214()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t sub_10001C23C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PhotoViewInternal();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001C2A0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PhotoViewInternal();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10001C2FC()
{
  unint64_t result = qword_100032008;
  if (!qword_100032008)
  {
    sub_1000068FC(&qword_100031FF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032008);
  }
  return result;
}

uint64_t sub_10001C358(uint64_t a1)
{
  uint64_t v2 = sub_1000068B8(&qword_100031FF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10001C3B8()
{
  unint64_t result = qword_100032010;
  if (!qword_100032010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032010);
  }
  return result;
}

unint64_t sub_10001C410()
{
  unint64_t result = qword_100032018;
  if (!qword_100032018)
  {
    sub_1000068FC(&qword_100032020);
    sub_1000068FC(&qword_100031FF0);
    sub_10001C2FC();
    swift_getOpaqueTypeConformance2();
    sub_100012E8C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032018);
  }
  return result;
}

uint64_t sub_10001C4C0(void *a1)
{
  uint64_t v5 = sub_10001C520(a1);
  v2._countAndFlagsBits = 8236;
  v2._object = (void *)0xE200000000000000;
  String.append(_:)(v2);
  v3._countAndFlagsBits = sub_10001C634(a1);
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10001C520(void *a1)
{
  id v1 = [a1 mediaType];
  if (v1 == (id)2)
  {
    id v2 = [self mainBundle];
    unint64_t v9 = 0x80000001000254F0;
    uint64_t v3 = 1162103126;
  }
  else
  {
    if (v1 != (id)1) {
      return 0;
    }
    id v2 = [self mainBundle];
    unint64_t v9 = 0x80000001000254F0;
    uint64_t v3 = 1414482000;
  }
  v4._uint64_t countAndFlagsBits = v3 & 0xFFFF0000FFFFFFFFLL | 0x4F00000000;
  v4._object = (void *)0xE500000000000000;
  v5._uint64_t countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  unint64_t v6 = 0xD00000000000001ELL;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v4, (Swift::String_optional)0, (NSBundle)v2, v5, *(Swift::String *)(&v9 - 1))._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_10001C634(void *a1)
{
  uint64_t v2 = sub_1000068B8(&qword_100032028);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  Swift::String v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v19 - v6;
  uint64_t v8 = type metadata accessor for Date();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = [a1 creationDate];
  if (v12)
  {
    uint64_t v13 = v12;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5, 1, 1, v8);
  }
  sub_10001C8AC((uint64_t)v5, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_10001C914((uint64_t)v7);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    if (qword_100031BC0 != -1) {
      swift_once();
    }
    long long v15 = (void *)qword_100033BF0;
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    id v17 = [v15 stringFromDate:isa];

    uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return v14;
}

uint64_t sub_10001C8AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068B8(&qword_100032028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001C914(uint64_t a1)
{
  uint64_t v2 = sub_1000068B8(&qword_100032028);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10001C974(uint64_t *a1@<X8>)
{
  id v3 = [*v1 localIdentifier];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

Swift::Int sub_10001C9CC()
{
  id v1 = *v0;
  Hasher.init(_seed:)();
  id v2 = v1;
  NSObject.hash(into:)();

  return Hasher._finalize()();
}

void sub_10001CA1C()
{
  id v1 = *v0;
  NSObject.hash(into:)();
}

Swift::Int sub_10001CA74()
{
  id v1 = *v0;
  Hasher.init(_seed:)();
  id v2 = v1;
  NSObject.hash(into:)();

  return Hasher._finalize()();
}

uint64_t sub_10001CAC0()
{
  return static NSObject.== infix(_:_:)() & 1;
}

void sub_10001CB04()
{
  id v0 = [objc_allocWithZone((Class)NSDateFormatter) init];
  NSString v1 = String._bridgeToObjectiveC()();
  [v0 setDateFormat:v1];

  qword_100033BF0 = (uint64_t)v0;
}

ValueMetadata *type metadata accessor for Photo()
{
  return &type metadata for Photo;
}

unint64_t sub_10001CB8C()
{
  unint64_t result = qword_100032030;
  if (!qword_100032030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032030);
  }
  return result;
}

unint64_t sub_10001CBE0()
{
  unint64_t result = qword_100032038;
  if (!qword_100032038)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100032038);
  }
  return result;
}

uint64_t sub_10001CC20()
{
  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for PlayerViewModel()
{
  return self;
}

uint64_t sub_10001CC7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10001CCCC(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x8000000100025470;
  uint64_t v4 = a1;
  uint64_t v5 = 0xD000000000000011;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xEB00000000617265;
      unsigned int v6 = 1701079414;
      goto LABEL_4;
    case 2:
      unint64_t v3 = 0xEC0000006172656DLL;
      uint64_t v5 = 0x61436569666C6573;
      break;
    case 3:
      break;
    case 4:
      unint64_t v3 = 0xEC00000079726172;
      uint64_t v5 = 0x62694C6F746F6870;
      break;
    default:
      unint64_t v3 = 0xEB00000000617265;
      unsigned int v6 = 1953458288;
LABEL_4:
      uint64_t v5 = v6 | 0x6D61436F00000000;
      break;
  }
  unint64_t v7 = 0x8000000100025470;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xEB00000000617265;
      unsigned int v8 = 1701079414;
      goto LABEL_10;
    case 2:
      unint64_t v7 = 0xEC0000006172656DLL;
      unint64_t v2 = 0x61436569666C6573;
      goto LABEL_13;
    case 3:
LABEL_13:
      if (v5 == v2) {
        goto LABEL_14;
      }
      goto LABEL_17;
    case 4:
      unint64_t v7 = 0xEC00000079726172;
      if (v5 != 0x62694C6F746F6870) {
        goto LABEL_17;
      }
      goto LABEL_14;
    default:
      unint64_t v7 = 0xEB00000000617265;
      unsigned int v8 = 1953458288;
LABEL_10:
      if (v5 != (v8 | 0x6D61436F00000000)) {
        goto LABEL_17;
      }
LABEL_14:
      if (v3 == v7) {
        char v9 = 1;
      }
      else {
LABEL_17:
      }
        char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9 & 1;
  }
}

uint64_t NavigationStage.rawValue.getter(char a1)
{
  uint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unsigned int v3 = 1701079414;
      goto LABEL_4;
    case 2:
      uint64_t result = 0x61436569666C6573;
      break;
    case 3:
      return result;
    case 4:
      uint64_t result = 0x62694C6F746F6870;
      break;
    default:
      unsigned int v3 = 1953458288;
LABEL_4:
      uint64_t result = v3 | 0x6D61436F00000000;
      break;
  }
  return result;
}

uint64_t sub_10001CF7C(unsigned __int8 *a1, char *a2)
{
  return sub_10001CCCC(*a1, *a2);
}

unint64_t sub_10001CF88@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = _s15ClarityPhotosUI15NavigationStageO8rawValueACSgSS_tcfC_0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10001CFB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = NavigationStage.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

Swift::Int sub_10001CFE4()
{
  return sub_10001CFEC();
}

Swift::Int sub_10001CFEC()
{
  return Hasher._finalize()();
}

uint64_t sub_10001D0F4()
{
  return sub_10001D0FC();
}

uint64_t sub_10001D0FC()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10001D1F0()
{
  return sub_10001D1F8();
}

Swift::Int sub_10001D1F8()
{
  return Hasher._finalize()();
}

unint64_t _s15ClarityPhotosUI15NavigationStageO8rawValueACSgSS_tcfC_0(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10002E330, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 5) {
    return 5;
  }
  else {
    return v3;
  }
}

unint64_t sub_10001D34C()
{
  unint64_t result = qword_1000320E8;
  if (!qword_1000320E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000320E8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for NavigationStage(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for NavigationStage(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x10001D4FCLL);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NavigationStage()
{
  return &type metadata for NavigationStage;
}

id (*variable initialization expression of PhotoLibraryView._photoLibrary())()
{
  return sub_10001D558;
}

id sub_10001D558()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for PhotoLibrary());

  return [v0 init];
}

uint64_t PhotoLibraryView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, void *a4@<X8>)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  *(unsigned char *)(v8 + 32) = a3 & 1;
  *(unsigned char *)(v8 + 33) = HIBYTE(a3) & 1;
  *a4 = sub_10001DCC8;
  a4[1] = v8;

  return sub_1000073FC(a1, a2, a3 & 1);
}

uint64_t sub_10001D618@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __int16 a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v53 = a5;
  uint64_t v45 = type metadata accessor for ScrollAnchorRole();
  uint64_t v44 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  char v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000068B8(&qword_100032108);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_1000068B8(&qword_100032110);
  uint64_t v14 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  id v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000068B8(&qword_100032118);
  uint64_t v46 = *(void *)(v17 - 8);
  uint64_t v47 = v17;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_1000068B8(&qword_100032120);
  __chkstk_darwin(v49);
  uint64_t v52 = (char *)&v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_1000068B8(&qword_100032128);
  uint64_t v50 = *(void *)(v21 - 8);
  uint64_t v51 = v21;
  __chkstk_darwin(v21);
  uint64_t v48 = (char *)&v42 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = a2;
  uint64_t v55 = a3;
  __int16 v56 = a4 & 0x101;
  uint64_t v57 = v42;
  static Axis.Set.vertical.getter();
  sub_1000068B8(&qword_100032130);
  sub_100006D24(&qword_100032138, &qword_100032130);
  ScrollView.init(_:showsIndicators:content:)();
  static UnitPoint.bottom.getter();
  uint64_t v23 = sub_100006D24(&qword_100032140, &qword_100032108);
  View.defaultScrollAnchor(_:)();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  static UnitPoint.top.getter();
  static ScrollAnchorRole.alignment.getter();
  uint64_t v58 = v10;
  uint64_t v59 = v23;
  id v24 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v25 = v43;
  View.defaultScrollAnchor(_:for:)();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v9, v45);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v25);
  LOBYTE(v10) = static Edge.Set.leading.getter();
  unsigned __int8 v26 = static Edge.Set.trailing.getter();
  char v27 = Edge.Set.init(rawValue:)();
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v10) {
    char v27 = Edge.Set.init(rawValue:)();
  }
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v26) {
    char v27 = Edge.Set.init(rawValue:)();
  }
  if (qword_100031BC8 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v46;
  uint64_t v36 = v47;
  uint64_t v38 = (uint64_t)v52;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v52, v24, v47);
  uint64_t v39 = v38 + *(int *)(v49 + 36);
  *(unsigned char *)uint64_t v39 = v27;
  *(void *)(v39 + 8) = v29;
  *(void *)(v39 + 16) = v31;
  *(void *)(v39 + 24) = v33;
  *(void *)(v39 + 32) = v35;
  *(unsigned char *)(v39 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v24, v36);
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v58 = Image.init(systemName:)();
  sub_10001EA54();
  uint64_t v40 = v48;
  View.navigationTitle<A>(_:icon:)();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10001EB64(v38);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v50 + 32))(v53, v40, v51);
}

uint64_t sub_10001DCCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v25 = a2;
  uint64_t v27 = a4;
  uint64_t v5 = type metadata accessor for PinnedScrollableViews();
  __chkstk_darwin(v5);
  unsigned __int8 v26 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for GridItem.Size();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (_OWORD *)((char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = type metadata accessor for GridItem();
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1000068B8(&qword_100032130);
  uint64_t v14 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  id v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  GeometryProxy.size.getter();
  uint64_t v17 = 3;
  if (v19 < v18) {
    uint64_t v17 = 4;
  }
  if ((a3 & 0x100) != 0) {
    uint64_t v20 = v17;
  }
  else {
    uint64_t v20 = 2;
  }
  _OWORD *v10 = xmmword_100024C10;
  (*(void (**)(_OWORD *, void, uint64_t))(v8 + 104))(v10, enum case for GridItem.Size.flexible(_:), v7);
  GridItem.init(_:spacing:alignment:)();
  sub_10001E544((uint64_t)v13, v20);
  uint64_t v28 = v24;
  uint64_t v29 = v25;
  __int16 v30 = a3 & 0x101;
  static HorizontalAlignment.center.getter();
  int v31 = 0;
  sub_10001ED08(&qword_100032150, (void (*)(uint64_t))&type metadata accessor for PinnedScrollableViews);
  dispatch thunk of OptionSet.init(rawValue:)();
  sub_1000068B8(&qword_100032158);
  sub_10001EBEC();
  LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v27, v16, v23);
}

uint64_t sub_10001E018()
{
  type metadata accessor for PhotoLibrary();
  sub_10001ED08(&qword_100032180, (void (*)(uint64_t))type metadata accessor for PhotoLibrary);
  id v0 = (void *)StateObject.wrappedValue.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();

  swift_release();
  swift_release();
  sub_1000068B8(&qword_100032188);
  sub_10001BC3C();
  sub_1000068FC(&qword_100032168);
  type metadata accessor for PlainButtonStyle();
  sub_100006D24(&qword_100032170, &qword_100032168);
  sub_10001ED08(&qword_100032178, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
  swift_getOpaqueTypeConformance2();
  sub_10001ED58();
  return ForEach<>.init(_:content:)();
}

uint64_t sub_10001E210@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  v19[1] = a2;
  v19[0] = type metadata accessor for PlainButtonStyle();
  uint64_t v3 = *(void *)(v19[0] - 8);
  __chkstk_darwin(v19[0]);
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000068B8(&qword_100032168);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  uint64_t v27 = 0;
  id v11 = v10;
  sub_1000068B8(&qword_100031DE0);
  State.init(wrappedValue:)();
  id v13 = v20;
  id v12 = v21;
  uint64_t v27 = 0;
  sub_1000068B8(&qword_100031DF0);
  State.init(wrappedValue:)();
  id v15 = v20;
  id v14 = v21;
  uint64_t KeyPath = swift_getKeyPath();
  id v20 = v11;
  id v21 = v13;
  id v22 = v12;
  id v23 = v15;
  id v24 = v14;
  uint64_t v25 = KeyPath;
  char v26 = 0;
  v19[4] = v11;
  sub_10001EDC0();
  sub_10001EE14();
  NavigationLink.init(destination:label:)();
  PlainButtonStyle.init()();
  sub_100006D24(&qword_100032170, &qword_100032168);
  sub_10001ED08(&qword_100032178, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
  uint64_t v17 = v19[0];
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

id (*PhotoLibraryView.init()())()
{
  id v0 = [self currentDevice];
  [v0 userInterfaceIdiom];

  return sub_10001D558;
}

uint64_t sub_10001E544(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      uint64_t v4 = type metadata accessor for GridItem();
      uint64_t v5 = (char *)static Array._allocateBufferUninitialized(minimumCapacity:)();
      *((void *)v5 + 2) = a2;
      uint64_t v6 = *(void *)(v4 - 8);
      unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
      v8(&v5[v7], a1, v4);
      uint64_t v9 = a2 - 1;
      if (a2 != 1)
      {
        uint64_t v10 = *(void *)(v6 + 72);
        id v11 = &v5[v10 + v7];
        do
        {
          v8(v11, a1, v4);
          v11 += v10;
          --v9;
        }
        while (v9);
      }
    }
    else
    {
      uint64_t v5 = (char *)&_swiftEmptyArrayStorage;
    }
    uint64_t v12 = type metadata accessor for GridItem();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
    return (uint64_t)v5;
  }
  return result;
}

uint64_t sub_10001E6EC()
{
  uint64_t result = static ClarityUIMetrics.titleHorizontalPadding.getter();
  qword_1000320F0 = v1;
  return result;
}

uint64_t sub_10001E70C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  char v5 = *(unsigned char *)(v1 + 16);
  char v6 = *(unsigned char *)(v1 + 17);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v3;
  *(void *)(v7 + 24) = v4;
  *(unsigned char *)(v7 + 32) = v5;
  *(unsigned char *)(v7 + 33) = v6;
  *a1 = sub_10001DCC8;
  a1[1] = v7;

  return sub_1000073FC(v3, v4, v5);
}

uint64_t sub_10001E798()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001E7B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(unsigned char *)(a2 + 16);
  sub_1000073FC(*(void *)a2, v5, v6);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

uint64_t assignWithCopy for PhotoLibraryView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(unsigned char *)(a2 + 16);
  sub_1000073FC(*(void *)a2, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  char v9 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_10000741C(v7, v8, v9);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

__n128 initializeWithTake for PhotoLibraryView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PhotoLibraryView(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  char v7 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_10000741C(v5, v6, v7);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoLibraryView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 18)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotoLibraryView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 18) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 18) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotoLibraryView()
{
  return &type metadata for PhotoLibraryView;
}

uint64_t sub_10001E984()
{
  return sub_100006D24(&qword_1000320F8, &qword_100032100);
}

uint64_t sub_10001E9C4()
{
  sub_10000741C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));

  return _swift_deallocObject(v0, 34, 7);
}

uint64_t sub_10001EA00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(unsigned char *)(v2 + 33)) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  return sub_10001D618(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), v3 | *(unsigned __int8 *)(v2 + 32), a2);
}

uint64_t sub_10001EA28@<X0>(uint64_t a1@<X8>)
{
  if (*(unsigned char *)(v1 + 33)) {
    __int16 v2 = 256;
  }
  else {
    __int16 v2 = 0;
  }
  return sub_10001DCCC(*(void *)(v1 + 16), *(void *)(v1 + 24), v2 | *(unsigned __int8 *)(v1 + 32), a1);
}

unint64_t sub_10001EA54()
{
  unint64_t result = qword_100032148;
  if (!qword_100032148)
  {
    sub_1000068FC(&qword_100032120);
    sub_1000068FC(&qword_100032110);
    sub_1000068FC(&qword_100032108);
    sub_100006D24(&qword_100032140, &qword_100032108);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032148);
  }
  return result;
}

uint64_t sub_10001EB64(uint64_t a1)
{
  uint64_t v2 = sub_1000068B8(&qword_100032120);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001EBC4()
{
  return sub_10001E018();
}

unint64_t sub_10001EBEC()
{
  unint64_t result = qword_100032160;
  if (!qword_100032160)
  {
    sub_1000068FC(&qword_100032158);
    sub_1000068FC(&qword_100032168);
    type metadata accessor for PlainButtonStyle();
    sub_100006D24(&qword_100032170, &qword_100032168);
    sub_10001ED08(&qword_100032178, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032160);
  }
  return result;
}

uint64_t sub_10001ED08(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10001ED58()
{
  unint64_t result = qword_100032190;
  if (!qword_100032190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032190);
  }
  return result;
}

id sub_10001EDB4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void **)(v1 + 16);
  *a1 = v2;
  return v2;
}

unint64_t sub_10001EDC0()
{
  unint64_t result = qword_100032198;
  if (!qword_100032198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032198);
  }
  return result;
}

unint64_t sub_10001EE14()
{
  unint64_t result = qword_1000321A0;
  if (!qword_1000321A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000321A0);
  }
  return result;
}

uint64_t sub_10001EE68()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

char *sub_10001EEDC()
{
  uint64_t v1 = OBJC_IVAR____TtC15ClarityPhotosUI12PhotoLibrary_photoLibrary;
  uint64_t v2 = self;
  __int16 v3 = v0;
  id v4 = [v2 sharedPhotoLibrary];
  *(void *)&v0[v1] = v4;
  id v5 = v4;
  id v6 = sub_100020E68((unint64_t)v5);

  swift_beginAccess();
  id v12 = v6;
  Published.init(initialValue:)();
  swift_endAccess();

  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for PhotoLibrary();
  char v7 = [super init];
  uint64_t v8 = *(void **)&v7[OBJC_IVAR____TtC15ClarityPhotosUI12PhotoLibrary_photoLibrary];
  char v9 = v7;
  [v8 registerChangeObserver:v9];
  sub_100021D94();

  return v9;
}

id sub_10001F014()
{
  [*(id *)&v0[OBJC_IVAR____TtC15ClarityPhotosUI12PhotoLibrary_photoLibrary] unregisterChangeObserver:v0];
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotoLibrary();
  [super dealloc];
}

uint64_t sub_10001F154()
{
  return type metadata accessor for PhotoLibrary();
}

uint64_t type metadata accessor for PhotoLibrary()
{
  uint64_t result = qword_100032240;
  if (!qword_100032240) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001F1A8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = (char **)(a4 + 16);
  id v6 = [a1 localIdentifier];
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  swift_beginAccess();
  uint64_t v10 = *(char **)(a4 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a4 + 16) = v10;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v10 = sub_1000202C8(0, *((void *)v10 + 2) + 1, 1, v10);
    *id v5 = v10;
  }
  unint64_t v13 = *((void *)v10 + 2);
  unint64_t v12 = *((void *)v10 + 3);
  if (v13 >= v12 >> 1)
  {
    uint64_t v10 = sub_1000202C8((char *)(v12 > 1), v13 + 1, 1, v10);
    *id v5 = v10;
  }
  *((void *)v10 + 2) = v13 + 1;
  id v14 = &v10[16 * v13];
  *((void *)v14 + 4) = v7;
  *((void *)v14 + 5) = v9;
  return swift_endAccess();
}

void sub_10001F2A0(uint64_t a1, void *a2)
{
  __int16 v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_10001F324()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000068B8(&qword_1000316D0);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  id v5 = (void *)v12[1];
  sub_10000DB64(0, &qword_100032260);
  id v6 = (void *)PHChange.changeDetails<A>(for:)();

  if (v6)
  {
    uint64_t v7 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
    type metadata accessor for MainActor();
    id v8 = v6;
    id v9 = v1;
    uint64_t v10 = static MainActor.shared.getter();
    objc_super v11 = (void *)swift_allocObject();
    v11[2] = v10;
    v11[3] = &protocol witness table for MainActor;
    v11[4] = v8;
    v11[5] = v9;
    sub_1000090D4((uint64_t)v4, (uint64_t)&unk_100032270, (uint64_t)v11);

    swift_release();
  }
}

uint64_t sub_10001F4DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[7] = a4;
  v5[8] = a5;
  uint64_t v6 = type metadata accessor for IndexSet.Index();
  v5[9] = v6;
  v5[10] = *(void *)(v6 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  v5[13] = sub_1000068B8(&qword_100032288);
  v5[14] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for IndexSet();
  v5[15] = v7;
  v5[16] = *(void *)(v7 - 8);
  v5[17] = swift_task_alloc();
  v5[18] = swift_task_alloc();
  sub_1000068B8(&qword_100032290);
  v5[19] = swift_task_alloc();
  v5[20] = swift_task_alloc();
  v5[21] = swift_task_alloc();
  type metadata accessor for MainActor();
  v5[22] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10001F6CC, v9, v8);
}

uint64_t sub_10001F6CC()
{
  uint64_t v1 = *(void **)(v0 + 56);
  swift_release();
  if (![v1 hasIncrementalChanges]) {
    goto LABEL_10;
  }
  id v2 = [*(id *)(v0 + 56) insertedIndexes];
  uint64_t v3 = *(void *)(v0 + 168);
  if (v2)
  {
    id v4 = v2;
    uint64_t v5 = *(void *)(v0 + 144);
    uint64_t v6 = *(void *)(v0 + 120);
    uint64_t v7 = *(void *)(v0 + 128);
    static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v3, v5, v6);
    uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
    v8(v3, 0, 1, v6);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v3, 1, v6) != 1)
    {
      uint64_t v9 = *(void *)(v0 + 168);
LABEL_9:
      sub_1000070C4(v9, &qword_100032290);
LABEL_10:
      if (qword_100031BB0 != -1) {
        swift_once();
      }
      uint64_t v17 = type metadata accessor for Logger();
      sub_10000D898(v17, (uint64_t)qword_100033BC0);
      double v18 = Logger.logObject.getter();
      os_log_type_t v19 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v18, v19))
      {
        id v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Updating photo collection for photo library change.", v20, 2u);
        swift_slowDealloc();
      }
      id v21 = *(void **)(v0 + 56);
      id v22 = *(void **)(v0 + 64);

      id v23 = [v21 fetchResultAfterChanges];
      swift_getKeyPath();
      swift_getKeyPath();
      *(void *)(v0 + 48) = v23;
      id v24 = v22;
      static Published.subscript.setter();
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 128) + 56);
    v8(*(void *)(v0 + 168), 1, 1, *(void *)(v0 + 120));
  }
  uint64_t v10 = *(void **)(v0 + 56);
  sub_1000070C4(*(void *)(v0 + 168), &qword_100032290);
  id v11 = [v10 removedIndexes];
  uint64_t v12 = *(void *)(v0 + 160);
  if (v11)
  {
    unint64_t v13 = v11;
    uint64_t v14 = *(void *)(v0 + 144);
    uint64_t v15 = *(void *)(v0 + 120);
    uint64_t v16 = *(void *)(v0 + 128);
    static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v12, v14, v15);
    v8(v12, 0, 1, v15);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v12, 1, v15) != 1)
    {
      uint64_t v9 = *(void *)(v0 + 160);
      goto LABEL_9;
    }
  }
  else
  {
    v8(*(void *)(v0 + 160), 1, 1, *(void *)(v0 + 120));
  }
  uint64_t v27 = *(void **)(v0 + 56);
  sub_1000070C4(*(void *)(v0 + 160), &qword_100032290);
  id v28 = [v27 changedIndexes];
  uint64_t v29 = *(void *)(v0 + 152);
  if (!v28)
  {
    v8(*(void *)(v0 + 152), 1, 1, *(void *)(v0 + 120));
    goto LABEL_26;
  }
  __int16 v30 = v28;
  uint64_t v31 = *(void *)(v0 + 144);
  uint64_t v32 = *(void *)(v0 + 120);
  uint64_t v33 = *(void *)(v0 + 128);
  static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 32);
  v34(v29, v31, v32);
  v8(v29, 0, 1, v32);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v29, 1, v32) == 1)
  {
LABEL_26:
    sub_1000070C4(*(void *)(v0 + 152), &qword_100032290);
    goto LABEL_15;
  }
  uint64_t v35 = *(void *)(v0 + 128);
  uint64_t v36 = *(void *)(v0 + 112);
  uint64_t v37 = *(void *)(v0 + 104);
  uint64_t v38 = *(void *)(v0 + 80);
  v34(*(void *)(v0 + 136), *(void *)(v0 + 152), *(void *)(v0 + 120));
  IndexSet.makeIterator()();
  uint64_t v39 = v36 + *(int *)(v37 + 36);
  uint64_t v62 = *(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16);
  uint64_t v40 = (void (**)(uint64_t, uint64_t))(v38 + 8);
  uint64_t v61 = (void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16);
  long long v63 = (void (**)(uint64_t, uint64_t))(v35 + 8);
  while (1)
  {
    uint64_t v42 = *(void *)(v0 + 88);
    uint64_t v41 = *(void *)(v0 + 96);
    uint64_t v43 = *(void *)(v0 + 72);
    v62(v41, v39, v43);
    sub_100020280(&qword_100032298, (void (*)(uint64_t))&type metadata accessor for IndexSet);
    dispatch thunk of Collection.endIndex.getter();
    sub_100020280((unint64_t *)&unk_1000322A0, (void (*)(uint64_t))&type metadata accessor for IndexSet.Index);
    char v44 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v45 = *v40;
    (*v40)(v42, v43);
    v45(v41, v43);
    uint64_t v46 = *(void *)(v0 + 112);
    uint64_t v47 = *(void *)(v0 + 120);
    if (v44) {
      break;
    }
    uint64_t v48 = *(void *)(v0 + 144);
    uint64_t v49 = *(void **)(v0 + 56);
    uint64_t v50 = (void (*)(uint64_t, void))dispatch thunk of Collection.subscript.read();
    uint64_t v52 = *v51;
    v50(v0 + 16, 0);
    (*v61)(v48, v46, v47);
    dispatch thunk of Collection.formIndex(after:)();
    uint64_t v53 = *v63;
    (*v63)(v48, v47);
    id v54 = [v49 fetchResultBeforeChanges];
    id v55 = [v54 objectAtIndexedSubscript:v52];

    id v56 = [v49 fetchResultAfterChanges];
    id v57 = [v56 objectAtIndexedSubscript:v52];

    sub_10000DB64(0, &qword_100032260);
    LOBYTE(v56) = static NSObject.== infix(_:_:)();

    if ((v56 & 1) == 0)
    {
      uint64_t v58 = *(void *)(v0 + 136);
      uint64_t v59 = *(void *)(v0 + 120);
      sub_1000070C4(*(void *)(v0 + 112), &qword_100032288);
      v53(v58, v59);
      goto LABEL_10;
    }
  }
  uint64_t v60 = *(void *)(v0 + 136);
  sub_1000070C4(*(void *)(v0 + 112), &qword_100032288);
  (*v63)(v60, v47);
LABEL_15:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
  return v25();
}

void sub_10001FE90()
{
  sub_10001FF2C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10001FF2C()
{
  if (!qword_100032250)
  {
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100032250);
    }
  }
}

uint64_t sub_10001FF84@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PhotoLibrary();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10001FFC4@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100020048(void **a1, void **a2)
{
  id v2 = *a1;
  uint64_t v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v2;
  id v5 = v3;
  return static Published.subscript.setter();
}

uint64_t sub_1000200C0()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100020108(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100006AD4;
  return sub_10001F4DC(a1, v4, v5, v7, v6);
}

uint64_t sub_1000201C8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100006AD4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000316F0 + dword_1000316F0);
  return v6(a1, v4);
}

uint64_t sub_100020280(unint64_t *a1, void (*a2)(uint64_t))
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

char *sub_1000202C8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1000068B8(&qword_1000322F0);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100022114(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000203D8(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      double v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100020868(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100020588()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000068B8(&qword_1000322E8);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    __int16 v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *__int16 v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

Swift::Int sub_100020868(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_100020588();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100020A04();
      goto LABEL_22;
    }
    sub_100020BB8();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  uint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_100020A04()
{
  uint64_t v1 = v0;
  sub_1000068B8(&qword_1000322E8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100020BB8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000068B8(&qword_1000322E8);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

id sub_100020E68(unint64_t a1)
{
  uint64_t v106 = type metadata accessor for OSSignpostError();
  uint64_t v105 = *(void *)(v106 - 8);
  __chkstk_darwin(v106);
  unint64_t v3 = (unint64_t)&v96 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = type metadata accessor for OSSignpostID();
  uint64_t v4 = *(void *)(v111 - 8);
  uint64_t v5 = __chkstk_darwin(v111);
  v109 = (char *)&v96 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  v110 = (char *)&v96 - v8;
  __chkstk_darwin(v7);
  int64_t v10 = (int64_t)&v96 - v9;
  if (qword_100031BB8 != -1) {
LABEL_77:
  }
    swift_once();
  uint64_t v11 = type metadata accessor for OSSignposter();
  uint64_t v12 = sub_10000D898(v11, (uint64_t)qword_100033BD8);
  static OSSignpostID.exclusive.getter();
  int64_t v13 = OSSignposter.logHandle.getter();
  os_signpost_type_t v14 = static os_signpost_type_t.begin.getter();
  char v15 = OS_os_log.signpostsEnabled.getter();
  unint64_t v115 = v3;
  uint64_t v108 = v12;
  unint64_t v119 = a1;
  if (v15)
  {
    int64_t v16 = *(void (**)(char *, int64_t, uint64_t))(v4 + 16);
    unint64_t v17 = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    BOOL v19 = v110;
    uint64_t v18 = v111;
    v16(v110, v10, v111);
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    os_signpost_id_t v21 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, v14, v21, "makePhotoCollection", "", v20, 2u);
    unint64_t v3 = v115;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v19, v18);
  }
  else
  {

    int64_t v16 = *(void (**)(char *, int64_t, uint64_t))(v4 + 16);
    unint64_t v17 = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    BOOL v19 = v110;
    uint64_t v18 = v111;
  }
  v104 = (void (*)(char *, char *, uint64_t))v16;
  unint64_t v103 = v17;
  v16(v19, v10, v18);
  type metadata accessor for OSSignpostIntervalState();
  swift_allocObject();
  uint64_t v22 = OSSignpostIntervalState.init(id:isOpen:)();
  unint64_t v24 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v23 = v4 + 8;
  v107 = v24;
  v24((char *)v10, v18);
  id v25 = [objc_allocWithZone((Class)PHFetchOptions) init];
  [v25 setIncludeAssetSourceTypes:5];
  sub_10000DB64(0, (unint64_t *)&unk_1000322B0);
  id v26 = [(id)swift_getObjCClassFromMetadata() sharedInstance];
  if (![v26 includeSharedAlbums]) {
    goto LABEL_67;
  }
  id v102 = v26;
  id v27 = [v26 selectedSharedAlbumCloudIdentifiers];
  uint64_t v28 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v112 = *(void *)(v28 + 16);
  if (!v112)
  {
    swift_bridgeObjectRelease();
    goto LABEL_66;
  }
  uint64_t v100 = v22;
  uint64_t v101 = v23;
  uint64_t v4 = v28;
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = &_swiftEmptyArrayStorage;
  __int16 v30 = self;
  a1 = 1;
  id v99 = v25;
  id v31 = [v30 fetchAssetCollectionsWithType:1 subtype:101 options:v25];
  aBlock[4] = sub_100022080;
  aBlock[5] = v29;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001F2A0;
  aBlock[3] = &unk_10002EA48;
  uint64_t v32 = _Block_copy(aBlock);
  uint64_t v98 = v29;
  swift_retain();
  swift_release();
  [v31 enumerateObjectsUsingBlock:v32];
  _Block_release(v32);

  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v33 = PHPhotoLibrary.cloudIdentifierMappings(forLocalIdentifiers:)();
  swift_bridgeObjectRelease();
  int64_t v10 = 0;
  v120[2] = (uint64_t)&_swiftEmptySetSingleton;
  uint64_t v35 = *(void *)(v33 + 64);
  v116 = (void *)v4;
  uint64_t v117 = v33 + 64;
  uint64_t v36 = 1 << *(unsigned char *)(v33 + 32);
  uint64_t v37 = -1;
  if (v36 < 64) {
    uint64_t v37 = ~(-1 << v36);
  }
  unint64_t v3 = v37 & v35;
  int64_t v118 = (unint64_t)(v36 + 63) >> 6;
  unint64_t v119 = v33;
  v97 = (void *)(v4 + 72);
  *(void *)&long long v34 = 136315394;
  long long v114 = v34;
  v113 = (char *)&type metadata for Any + 8;
  while (v3)
  {
    unint64_t v38 = __clz(__rbit64(v3));
    v3 &= v3 - 1;
    unint64_t v39 = v38 | (v10 << 6);
LABEL_27:
    uint64_t v43 = 16 * v39;
    char v44 = (uint64_t *)(*(void *)(v119 + 48) + v43);
    uint64_t v45 = *v44;
    a1 = v44[1];
    uint64_t v46 = *(void *)(v119 + 56) + v43;
    uint64_t v47 = *(void **)v46;
    if (*(unsigned char *)(v46 + 8))
    {
      sub_1000220A0(v47, 1);
      sub_1000220A0(v47, 1);
      uint64_t v48 = qword_100031BB0;
      swift_bridgeObjectRetain();
      if (v48 != -1) {
        swift_once();
      }
      uint64_t v49 = type metadata accessor for Logger();
      sub_10000D898(v49, (uint64_t)qword_100033BC0);
      sub_1000220A0(v47, 1);
      sub_1000220A0(v47, 1);
      swift_bridgeObjectRetain();
      uint64_t v50 = Logger.logObject.getter();
      os_log_type_t v51 = static os_log_type_t.error.getter();
      uint64_t v4 = v51;
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v52 = swift_slowAlloc();
        uint64_t v53 = (void *)swift_slowAlloc();
        v120[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v52 = v114;
        swift_bridgeObjectRetain();
        *(void *)(v52 + 4) = sub_10001413C(v45, a1, v120);
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v52 + 12) = 2112;
        swift_errorRetain();
        uint64_t v54 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v52 + 14) = v54;
        *uint64_t v53 = v54;
        sub_1000220AC(v47, 1);
        sub_1000220AC(v47, 1);
        _os_log_impl((void *)&_mh_execute_header, v50, (os_log_type_t)v4, "Error fetching album cloud identifier for local identifier: %s. Error: %@.", (uint8_t *)v52, 0x16u);
        sub_1000068B8(&qword_1000316D8);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        sub_1000220AC(v47, 1);
      }
      else
      {
        sub_1000220AC(v47, 1);
        swift_bridgeObjectRelease_n();
        sub_1000220AC(v47, 1);
        sub_1000220AC(v47, 1);
      }
      sub_1000220AC(v47, 1);
    }
    else
    {
      sub_1000220A0(v47, 0);
      sub_1000220A0(v47, 0);
      swift_bridgeObjectRetain();
      id v55 = [v47 stringValue];
      uint64_t v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v58 = v57;

      BOOL v59 = v116[4] == v56 && v116[5] == v58;
      if (v59 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_10;
      }
      if (v112 == 1) {
        goto LABEL_38;
      }
      BOOL v60 = v116[6] == v56 && v116[7] == v58;
      if (v60 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
LABEL_10:
        swift_bridgeObjectRelease();
        sub_1000203D8(v120, v45, a1);
        sub_1000220AC(v47, 0);
        sub_1000220AC(v47, 0);
        swift_bridgeObjectRelease();
      }
      else
      {
        if (v112 != 2)
        {
          uint64_t v61 = v97;
          uint64_t v62 = 2;
          do
          {
            uint64_t v4 = v62 + 1;
            if (__OFADD__(v62, 1)) {
              goto LABEL_76;
            }
            BOOL v63 = *(v61 - 1) == v56 && *v61 == v58;
            if (v63 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
              goto LABEL_10;
            }
            v61 += 2;
            ++v62;
          }
          while (v4 != v112);
        }
LABEL_38:
        swift_bridgeObjectRelease();
        sub_1000220AC(v47, 0);
        swift_bridgeObjectRelease();
        sub_1000220AC(v47, 0);
      }
    }
  }
  int64_t v40 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  if (v40 >= v118)
  {
    swift_bridgeObjectRelease();
    swift_release();
    unint64_t v3 = v115;
    goto LABEL_59;
  }
  unint64_t v41 = *(void *)(v117 + 8 * v40);
  ++v10;
  unint64_t v3 = v115;
  if (v41) {
    goto LABEL_26;
  }
  int64_t v10 = v40 + 1;
  if (v40 + 1 >= v118) {
    goto LABEL_58;
  }
  unint64_t v41 = *(void *)(v117 + 8 * v10);
  if (v41) {
    goto LABEL_26;
  }
  int64_t v10 = v40 + 2;
  if (v40 + 2 >= v118) {
    goto LABEL_58;
  }
  unint64_t v41 = *(void *)(v117 + 8 * v10);
  if (v41)
  {
LABEL_26:
    unint64_t v3 = (v41 - 1) & v41;
    unint64_t v39 = __clz(__rbit64(v41)) + (v10 << 6);
    goto LABEL_27;
  }
  int64_t v42 = v40 + 3;
  if (v42 < v118)
  {
    unint64_t v41 = *(void *)(v117 + 8 * v42);
    if (!v41)
    {
      while (1)
      {
        int64_t v10 = v42 + 1;
        if (__OFADD__(v42, 1)) {
          goto LABEL_75;
        }
        if (v10 >= v118) {
          goto LABEL_58;
        }
        unint64_t v41 = *(void *)(v117 + 8 * v10);
        ++v42;
        if (v41) {
          goto LABEL_26;
        }
      }
    }
    int64_t v10 = v42;
    goto LABEL_26;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  swift_release();
LABEL_59:
  uint64_t v64 = self;
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v66 = [v64 uuidsFromLocalIdentifiers:isa];

  id v25 = v99;
  if (v66)
  {
    uint64_t v67 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    sub_10000DB64(0, &qword_1000322C8);
    sub_1000068B8(&qword_1000322D0);
    uint64_t v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_100023E80;
    *(void *)(v68 + 56) = sub_1000068B8(&qword_1000322D8);
    *(void *)(v68 + 64) = sub_1000220B8();
    *(void *)(v68 + 32) = v67;
    uint64_t v69 = NSPredicate.init(format:_:)();
    [v25 setInternalInclusionPredicate:v69];
  }
  else
  {
    if (qword_100031BB0 != -1) {
      swift_once();
    }
    uint64_t v70 = type metadata accessor for Logger();
    sub_10000D898(v70, (uint64_t)qword_100033BC0);
    uint64_t v69 = Logger.logObject.getter();
    os_log_type_t v71 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v69, v71))
    {
      uint64_t v72 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v72 = 0;
      _os_log_impl((void *)&_mh_execute_header, v69, v71, "Unable to get UUIDs from shared album local identifiers.", v72, 2u);
      swift_slowDealloc();
    }
  }
  swift_release();

LABEL_66:
  id v26 = v102;
LABEL_67:
  sub_1000068B8(&qword_100031AE8);
  uint64_t v73 = v26;
  uint64_t v74 = swift_allocObject();
  *(_OWORD *)(v74 + 16) = xmmword_100024D20;
  id v75 = objc_allocWithZone((Class)NSSortDescriptor);
  NSString v76 = String._bridgeToObjectiveC()();
  id v77 = [v75 initWithKey:v76 ascending:1];

  *(void *)(v74 + 32) = v77;
  v120[0] = v74;
  specialized Array._endMutation()();
  sub_10000DB64(0, &qword_1000322C0);
  Class v78 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v25 setSortDescriptors:v78];

  unsigned __int8 v79 = self;
  id v80 = v25;
  id v81 = [v79 fetchAssetsWithOptions:v80];

  uint64_t v82 = OSSignposter.logHandle.getter();
  uint64_t v83 = v109;
  OSSignpostIntervalState.signpostID.getter();
  os_signpost_type_t v84 = static os_signpost_type_t.end.getter();
  if (OS_os_log.signpostsEnabled.getter())
  {
    swift_retain();
    checkForErrorAndConsumeState(state:)();
    swift_release();
    uint64_t v85 = v105;
    uint64_t v86 = v106;
    if ((*(unsigned int (**)(unint64_t, uint64_t))(v105 + 88))(v3, v106) == enum case for OSSignpostError.doubleEnd(_:))
    {
      v87 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(unint64_t, uint64_t))(v85 + 8))(v3, v86);
      v87 = "";
    }
    v88 = v110;
    uint64_t v89 = v111;
    v90 = v109;
    v104(v110, v109, v111);
    v91 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v91 = 0;
    os_signpost_id_t v92 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v82, v84, v92, "makePhotoCollection", v87, v91, 2u);
    swift_slowDealloc();

    v93 = v88;
    v94 = v107;
    v107(v90, v89);
    v94(v93, v89);
  }
  else
  {

    v107(v83, v111);
  }
  swift_release();
  return v81;
}

void sub_100021D94()
{
  id v0 = [self sharedInstance];
  id v11 = 0;
  unsigned int v1 = [v0 setCategory:AVAudioSessionCategoryPlayback mode:AVAudioSessionModeDefault options:0 error:&v11];

  id v2 = v11;
  if (v1)
  {
    id v3 = v2;
  }
  else
  {
    id v4 = v11;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (qword_100031BB0 != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    sub_10000D898(v5, (uint64_t)qword_100033BC0);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 138412290;
      swift_errorRetain();
      int64_t v10 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v11 = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v9 = v10;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Error setting AVAudioSession playback category. Error: %@.", v8, 0xCu);
      sub_1000068B8(&qword_1000316D8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
  }
}

uint64_t sub_100022048()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100022080(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10001F1A8(a1, a2, a3, v3);
}

uint64_t sub_100022088(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100022098()
{
  return swift_release();
}

id sub_1000220A0(void *a1, char a2)
{
  if (a2) {
    return (id)swift_errorRetain();
  }
  else {
    return a1;
  }
}

void sub_1000220AC(void *a1, char a2)
{
  if (a2) {
    swift_errorRelease();
  }
  else {
}
  }

unint64_t sub_1000220B8()
{
  unint64_t result = qword_1000322E0;
  if (!qword_1000322E0)
  {
    sub_1000068FC(&qword_1000322D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000322E0);
  }
  return result;
}

uint64_t sub_100022114(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return type metadata accessor for Notification();
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

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.path(percentEncoded:)(percentEncoded);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t type metadata accessor for IndexSet.Index()
{
  return type metadata accessor for IndexSet.Index();
}

uint64_t IndexSet.makeIterator()()
{
  return IndexSet.makeIterator()();
}

uint64_t static IndexSet._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for IndexSet()
{
  return type metadata accessor for IndexSet();
}

uint64_t VideoPlayer<>.init(player:)()
{
  return VideoPlayer<>.init(player:)();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t OSSignposter.init(logger:)()
{
  return OSSignposter.init(logger:)();
}

uint64_t OSSignposter.logHandle.getter()
{
  return OSSignposter.logHandle.getter();
}

uint64_t type metadata accessor for OSSignposter()
{
  return type metadata accessor for OSSignposter();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
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

uint64_t Publisher.receive<A>(on:options:)()
{
  return Publisher.receive<A>(on:options:)();
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

uint64_t type metadata accessor for ColorScheme()
{
  return type metadata accessor for ColorScheme();
}

uint64_t StateObject.wrappedValue.getter()
{
  return StateObject.wrappedValue.getter();
}

uint64_t WindowGroup.init(id:title:lazyContent:)()
{
  return WindowGroup.init(id:title:lazyContent:)();
}

uint64_t _TupleScene.init(_:)()
{
  return _TupleScene.init(_:)();
}

uint64_t ProgressView<>.init<>()()
{
  return ProgressView<>.init<>()();
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

uint64_t ClarityUIScene.init(content:)()
{
  return ClarityUIScene.init(content:)();
}

uint64_t NavigationLink.init(destination:label:)()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t NavigationLink<>.init<A>(value:label:)()
{
  return NavigationLink<>.init<A>(value:label:)();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t _UIHostingView.__allocating_init(rootView:)()
{
  return _UIHostingView.__allocating_init(rootView:)();
}

uint64_t dispatch thunk of _UIHostingView.rootView.setter()
{
  return dispatch thunk of _UIHostingView.rootView.setter();
}

uint64_t type metadata accessor for _UIHostingView()
{
  return type metadata accessor for _UIHostingView();
}

uint64_t NavigationStack.init<>(root:)()
{
  return NavigationStack.init<>(root:)();
}

uint64_t static ClarityUIMetrics.titleHorizontalPadding.getter()
{
  return static ClarityUIMetrics.titleHorizontalPadding.getter();
}

uint64_t PlainButtonStyle.init()()
{
  return PlainButtonStyle.init()();
}

uint64_t type metadata accessor for PlainButtonStyle()
{
  return type metadata accessor for PlainButtonStyle();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t static ScrollAnchorRole.alignment.getter()
{
  return static ScrollAnchorRole.alignment.getter();
}

uint64_t type metadata accessor for ScrollAnchorRole()
{
  return type metadata accessor for ScrollAnchorRole();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t EnvironmentValues.colorScheme.setter()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t EnvironmentValues.displayScale.getter()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t EnvironmentValues.displayScale.setter()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.tint.getter()
{
  return EnvironmentValues.tint.getter();
}

uint64_t EnvironmentValues.tint.setter()
{
  return EnvironmentValues.tint.setter();
}

uint64_t EnvironmentValues.tintColor.getter()
{
  return EnvironmentValues.tintColor.getter();
}

uint64_t EnvironmentValues.tintColor.setter()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t type metadata accessor for MultimodalListStyle.IconStyle()
{
  return type metadata accessor for MultimodalListStyle.IconStyle();
}

uint64_t type metadata accessor for MultimodalListStyle.Layout()
{
  return type metadata accessor for MultimodalListStyle.Layout();
}

uint64_t MultimodalListStyle.init(layout:iconStyle:)()
{
  return MultimodalListStyle.init(layout:iconStyle:)();
}

uint64_t type metadata accessor for MultimodalListStyle()
{
  return type metadata accessor for MultimodalListStyle();
}

uint64_t UIViewRepresentable._resetUIView(_:coordinator:destroy:)()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t static UIViewRepresentable.dismantleUIView(_:coordinator:)()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t static UIViewRepresentable._layoutOptions(_:)()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t UIViewRepresentable._identifiedViewTree(in:)()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewRepresentable._overrideLayoutTraits(_:for:)()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t static UIViewRepresentable._modifyBridgedViewInputs(_:)()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t UIViewRepresentable.body.getter()
{
  return UIViewRepresentable.body.getter();
}

uint64_t UIViewRepresentable<>.makeCoordinator()()
{
  return UIViewRepresentable<>.makeCoordinator()();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t type metadata accessor for PinnedScrollableViews()
{
  return type metadata accessor for PinnedScrollableViews();
}

uint64_t static AccessibilityChildBehavior.ignore.getter()
{
  return static AccessibilityChildBehavior.ignore.getter();
}

uint64_t type metadata accessor for AccessibilityChildBehavior()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t BorderedProminentButtonStyle.init()()
{
  return BorderedProminentButtonStyle.init()();
}

uint64_t type metadata accessor for BorderedProminentButtonStyle()
{
  return type metadata accessor for BorderedProminentButtonStyle();
}

uint64_t UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t static UIViewControllerRepresentable._layoutOptions(_:)()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t UIViewControllerRepresentable._identifiedViewTree(in:)()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewControllerRepresentable.body.getter()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t UIViewControllerRepresentable<>.makeCoordinator()()
{
  return UIViewControllerRepresentable<>.makeCoordinator()();
}

uint64_t type metadata accessor for AccessibilityAttachmentModifier()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t static App.main()()
{
  return static App.main()();
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

uint64_t static Edge.Set.leading.getter()
{
  return static Edge.Set.leading.getter();
}

uint64_t Edge.Set.init(rawValue:)()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t static Edge.Set.trailing.getter()
{
  return static Edge.Set.trailing.getter();
}

uint64_t List<>.init(content:)()
{
  return List<>.init(content:)();
}

uint64_t Text.foregroundColor(_:)()
{
  return Text.foregroundColor(_:)();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.navigationTitle<A>(_:icon:)()
{
  return View.navigationTitle<A>(_:icon:)();
}

uint64_t View.accessibilityLabel<A>(_:)()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t View.defaultScrollAnchor(_:for:)()
{
  return View.defaultScrollAnchor(_:for:)();
}

uint64_t View.defaultScrollAnchor(_:)()
{
  return View.defaultScrollAnchor(_:)();
}

uint64_t View.accessibilityElement(children:)()
{
  return View.accessibilityElement(children:)();
}

uint64_t View.navigationDestination<A, B>(for:destination:)()
{
  return View.navigationDestination<A, B>(for:destination:)();
}

uint64_t View.accessibilityIdentifier(_:)()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t View.onChange<A>(of:initial:_:)()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t View.listStyle<A>(_:)()
{
  return View.listStyle<A>(_:)();
}

uint64_t static Color.red.getter()
{
  return static Color.red.getter();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t static Color.green.getter()
{
  return static Color.green.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t static Color.yellow.getter()
{
  return static Color.yellow.getter();
}

uint64_t Image.init(uiImage:)()
{
  return Image.init(uiImage:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t Image.init(_:bundle:)()
{
  return Image.init(_:bundle:)();
}

uint64_t Label.init(title:icon:)()
{
  return Label.init(title:icon:)();
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

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t ForEach<>.init(_:content:)()
{
  return ForEach<>.init(_:content:)();
}

uint64_t type metadata accessor for GridItem.Size()
{
  return type metadata accessor for GridItem.Size();
}

uint64_t type metadata accessor for GridItem()
{
  return type metadata accessor for GridItem();
}

uint64_t GridItem.init(_:spacing:alignment:)()
{
  return GridItem.init(_:spacing:alignment:)();
}

uint64_t static Alignment.topTrailing.getter()
{
  return static Alignment.topTrailing.getter();
}

uint64_t static Alignment.bottom.getter()
{
  return static Alignment.bottom.getter();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Animation.spring(response:dampingFraction:blendDuration:)()
{
  return static Animation.spring(response:dampingFraction:blendDuration:)();
}

uint64_t LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)()
{
  return LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)();
}

uint64_t static UnitPoint.top.getter()
{
  return static UnitPoint.top.getter();
}

uint64_t static UnitPoint.bottom.getter()
{
  return static UnitPoint.bottom.getter();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
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

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
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

uint64_t static TaskPriority.userInitiated.getter()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

Swift::Void __swiftcall Task.cancel()()
{
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t NSPredicate.init(format:_:)()
{
  return NSPredicate.init(format:_:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t PHPhotoLibrary.cloudIdentifierMappings(forLocalIdentifiers:)()
{
  return PHPhotoLibrary.cloudIdentifierMappings(forLocalIdentifiers:)();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t type metadata accessor for NSNotificationCenter.Publisher()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t NSNotificationCenter.publisher(for:object:)()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t AVCapturePhotoSettings.availablePreviewPhotoPixelFormatTypes.getter()
{
  return AVCapturePhotoSettings.availablePreviewPhotoPixelFormatTypes.getter();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSObject.hash(into:)()
{
  return NSObject.hash(into:)();
}

uint64_t PHChange.changeDetails<A>(for:)()
{
  return PHChange.changeDetails<A>(for:)();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerOptions()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
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

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of OptionSet.init(rawValue:)()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
}

OSStatus AudioServicesDisposeSystemSoundID(SystemSoundID inSystemSoundID)
{
  return _AudioServicesDisposeSystemSoundID(inSystemSoundID);
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
}

void UISaveVideoAtPathToSavedPhotosAlbum(NSString *videoPath, id completionTarget, SEL completionSelector, void *contextInfo)
{
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

void bzero(void *a1, size_t a2)
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

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}