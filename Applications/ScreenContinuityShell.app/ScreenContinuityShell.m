uint64_t sub_1000054C0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100005504()
{
  return 1;
}

uint64_t sub_10000550C()
{
  return 1;
}

uint64_t sub_100005514(uint64_t a1)
{
  v2 = v1;
  id v4 = objc_allocWithZone(v1);
  uint64_t v5 = sub_100005D70(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)((char *)v2 + qword_100022770) - 8) + 8))(a1);
  return v5;
}

void *sub_100005594(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_1000055D8(a1, a2);
}

void *sub_1000055D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)((swift_isaMask & *v2) + qword_100022770);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(a1, a2);
  (*(void (**)(char *))(v5 + 16))((char *)&v11 - v6);
  v7 = (void *)UIHostingController.init(coder:rootView:)();
  v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  id v9 = v7;
  v8(a2, v4);
  if (v7) {

  }
  return v7;
}

id sub_100005710(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SecureHostingController();
  [super initWithCoder:a1];

  return v3;
}

id sub_1000057A8(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_100005710(a3);
}

id sub_1000057D0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecureHostingController();
  return [super dealloc];
}

uint64_t type metadata accessor for SecureHostingController()
{
  return sub_100005E58();
}

uint64_t sub_100005864(uint64_t a1, uint64_t a2)
{
  return sub_100005C64(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100005894(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_10000590C(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_10000598C@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000059D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100005A00()
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

uint64_t sub_100005A8C(uint64_t a1)
{
  uint64_t v2 = sub_100005F40(&qword_100021CB0, type metadata accessor for Role);
  uint64_t v3 = sub_100005F40(&qword_100021CB8, type metadata accessor for Role);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005B48@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100005B90(uint64_t a1)
{
  uint64_t v2 = sub_100005F40(&qword_100021CC0, type metadata accessor for LaunchOptionsKey);
  uint64_t v3 = sub_100005F40(&qword_100021CC8, type metadata accessor for LaunchOptionsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005C4C(uint64_t a1, uint64_t a2)
{
  return sub_100005C64(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100005C64(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100005CA8()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100005CFC()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100005D70(uint64_t a1)
{
  __chkstk_darwin(a1, a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - v1);
  return UIHostingController.init(rootView:)();
}

uint64_t sub_100005E58()
{
  return swift_getGenericMetadata();
}

void type metadata accessor for Role(uint64_t a1)
{
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

uint64_t sub_100005EB0()
{
  return sub_100005F40(&qword_100021C80, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_100005EF8()
{
  return sub_100005F40(&qword_100021C88, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_100005F40(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100005F88()
{
  return sub_100005F40(&qword_100021C90, type metadata accessor for Role);
}

uint64_t sub_100005FD0()
{
  return sub_100005F40(&qword_100021C98, type metadata accessor for Role);
}

uint64_t sub_100006018()
{
  return sub_100005F40(&qword_100021CA0, type metadata accessor for Role);
}

uint64_t sub_100006060()
{
  return sub_100005F40(&qword_100021CA8, type metadata accessor for LaunchOptionsKey);
}

__n128 initializeWithTake for FullAmbientActivityView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000060B8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000060D8(uint64_t result, int a2, int a3)
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

void sub_100006114(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

ValueMetadata *type metadata accessor for FullAmbientActivityView()
{
  return &type metadata for FullAmbientActivityView;
}

uint64_t destroy for MinimalLiveActivity()
{
  swift_release();

  return swift_release();
}

void *_s21ScreenContinuityShell23FullAmbientActivityViewVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *_s21ScreenContinuityShell23FullAmbientActivityViewVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *_s21ScreenContinuityShell23FullAmbientActivityViewVwta_0(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t _s21ScreenContinuityShell23FullAmbientActivityViewVwet_0(uint64_t *a1, int a2)
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

uint64_t sub_1000062E4(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MinimalLiveActivity()
{
  return &type metadata for MinimalLiveActivity;
}

uint64_t sub_100006330()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000634C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v27 = a3;
  uint64_t v5 = sub_100007DA0(&qword_100021CD8);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100007DA0(&qword_100021CE0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100007DA0(&qword_100021CE8);
  __chkstk_darwin(v14 - 8, v15);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)v8 = static HorizontalAlignment.center.getter();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v18 = sub_100007DA0(&qword_100021CF0);
  sub_1000065F4(a1, a2, (uint64_t)&v8[*(int *)(v18 + 44)]);
  sub_100008648(&qword_100021CF8, &qword_100021CD8);
  View.allowsSecureDrawing()();
  sub_1000081F8((uint64_t)v8, &qword_100021CD8);
  uint64_t v19 = static Alignment.center.getter();
  __n128 v21 = sub_1000074BC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v17, 0.0, 1, INFINITY, 0, v19, v20, &qword_100021CE0, &qword_100021CE8);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v13, v9, v21);
  char v22 = static Edge.Set.all.getter();
  uint64_t v23 = v27;
  sub_100008194((uint64_t)v17, v27, &qword_100021CE8);
  uint64_t v24 = v23 + *(int *)(sub_100007DA0(&qword_100021D00) + 36);
  *(unsigned char *)uint64_t v24 = v22;
  *(_OWORD *)(v24 + 8) = 0u;
  *(_OWORD *)(v24 + 24) = 0u;
  *(unsigned char *)(v24 + 40) = 1;
  return sub_1000081F8((uint64_t)v17, &qword_100021CE8);
}

uint64_t sub_1000065F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100007DA0(&qword_100021D08);
  uint64_t v8 = __chkstk_darwin(v6 - 8, v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v11);
  v13 = (char *)&v19 - v12;
  if (qword_100021BC8 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_1000227C0;
  *(void *)v13 = static HorizontalAlignment.center.getter();
  *((void *)v13 + 1) = v14;
  v13[16] = 0;
  uint64_t v15 = sub_100007DA0(&qword_100021D10);
  sub_10000676C(a1, a2, (uint64_t *)&v13[*(int *)(v15 + 44)]);
  sub_100008194((uint64_t)v13, (uint64_t)v10, &qword_100021D08);
  *(void *)a3 = 0;
  *(unsigned char *)(a3 + 8) = 1;
  uint64_t v16 = sub_100007DA0(&qword_100021D18);
  sub_100008194((uint64_t)v10, a3 + *(int *)(v16 + 48), &qword_100021D08);
  uint64_t v17 = a3 + *(int *)(v16 + 64);
  *(void *)uint64_t v17 = 0;
  *(unsigned char *)(v17 + 8) = 1;
  sub_1000081F8((uint64_t)v13, &qword_100021D08);
  return sub_1000081F8((uint64_t)v10, &qword_100021D08);
}

uint64_t sub_10000676C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  v76 = a3;
  uint64_t v96 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v96, v5);
  v97 = (uint64_t *)((char *)&v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v88 = type metadata accessor for PlainButtonStyle();
  uint64_t v90 = *(void *)(v88 - 8);
  __chkstk_darwin(v88, v7);
  v83 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_100007DA0(&qword_100021D20);
  uint64_t v86 = *(void *)(v85 - 8);
  __chkstk_darwin(v85, v9);
  v80 = (char *)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_100007DA0(&qword_100021D28);
  uint64_t v89 = *(void *)(v91 - 8);
  __chkstk_darwin(v91, v11);
  v81 = (char *)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_100007DA0(&qword_100021D30) - 8;
  __chkstk_darwin(v87, v13);
  v77 = (char *)&v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_100007DA0(&qword_100021D38);
  uint64_t v16 = __chkstk_darwin(v93, v15);
  v95 = (char *)&v74 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v18);
  uint64_t v94 = (uint64_t)&v74 - v19;
  uint64_t v20 = sub_100007DA0(&qword_100021D40);
  __chkstk_darwin(v20 - 8, v21);
  uint64_t v23 = (char *)&v74 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100007DA0(&qword_100021D48);
  __chkstk_darwin(v24 - 8, v25);
  uint64_t v27 = (char *)&v74 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = a1;
  uint64_t v101 = a2;
  uint64_t v74 = a1;
  sub_100007DA0(&qword_100021D50);
  State.wrappedValue.getter();
  swift_bridgeObjectRetain();
  swift_release();
  Image.init(_internalSystemName:)();
  static SymbolRenderingMode.monochrome.getter();
  uint64_t v28 = type metadata accessor for SymbolRenderingMode();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v27, 0, 1, v28);
  uint64_t v92 = Image.symbolRenderingMode(_:)();
  swift_release();
  sub_1000081F8((uint64_t)v27, &qword_100021D48);
  int v79 = static HierarchicalShapeStyle.secondary.getter();
  uint64_t v29 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v23, 1, 1, v29);
  uint64_t v84 = static Font.system(size:weight:design:)();
  sub_1000081F8((uint64_t)v23, &qword_100021D40);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v100 = a1;
  uint64_t v101 = a2;
  State.wrappedValue.getter();
  uint64_t v31 = *(void *)(v102 + 32);
  uint64_t v30 = *(void *)(v102 + 40);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v100 = v31;
  uint64_t v101 = v30;
  sub_100007EDC();
  uint64_t v32 = Text.init<A>(_:)();
  uint64_t v34 = v33;
  LOBYTE(v27) = v35 & 1;
  static Font.title.getter();
  uint64_t v36 = Text.font(_:)();
  uint64_t v38 = v37;
  char v40 = v39;
  swift_release();
  sub_100007F30(v32, v34, (char)v27);
  swift_bridgeObjectRelease();
  LODWORD(v100) = static HierarchicalShapeStyle.tertiary.getter();
  uint64_t v41 = Text.foregroundStyle<A>(_:)();
  uint64_t v43 = v42;
  int v75 = v44;
  uint64_t v78 = v45;
  LOBYTE(v44) = v40 & 1;
  uint64_t v46 = (uint64_t)v77;
  sub_100007F30(v36, v38, v44);
  swift_bridgeObjectRelease();
  uint64_t v47 = swift_allocObject();
  uint64_t v48 = v74;
  *(void *)(v47 + 16) = v74;
  *(void *)(v47 + 24) = a2;
  uint64_t v98 = v48;
  uint64_t v99 = a2;
  swift_retain();
  swift_retain();
  sub_100007DA0(&qword_100021D60);
  sub_10000836C(&qword_100021D68, &qword_100021D60, (void (*)(void))sub_100007F90);
  v49 = v80;
  Button.init(action:label:)();
  v50 = v83;
  PlainButtonStyle.init()();
  sub_100008648(&qword_100021D80, &qword_100021D20);
  sub_100008004();
  v51 = v81;
  uint64_t v52 = v85;
  uint64_t v53 = v88;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v90 + 8))(v50, v53);
  (*(void (**)(char *, uint64_t))(v86 + 8))(v49, v52);
  id v54 = [self darkGrayColor];
  uint64_t v55 = Color.init(_:)();
  LOBYTE(v53) = static Edge.Set.all.getter();
  uint64_t v56 = v89;
  v57 = v51;
  v58 = v51;
  uint64_t v59 = v91;
  (*(void (**)(uint64_t, char *, uint64_t))(v89 + 16))(v46, v57, v91);
  uint64_t v60 = v46 + *(int *)(v87 + 44);
  *(void *)uint64_t v60 = v55;
  *(unsigned char *)(v60 + 8) = v53;
  (*(void (**)(char *, uint64_t))(v56 + 8))(v58, v59);
  if (qword_100021BE0 != -1) {
    swift_once();
  }
  char v61 = v75 & 1;
  uint64_t v62 = qword_1000227D8;
  v63 = v97;
  v64 = (char *)v97 + *(int *)(v96 + 20);
  uint64_t v65 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v66 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v66 - 8) + 104))(v64, v65, v66);
  uint64_t *v63 = v62;
  v63[1] = v62;
  uint64_t v67 = (uint64_t)v95;
  uint64_t v68 = (uint64_t)&v95[*(int *)(v93 + 36)];
  sub_10000805C((uint64_t)v63, v68);
  *(_WORD *)(v68 + *(int *)(sub_100007DA0(&qword_100021D90) + 36)) = 256;
  sub_100008194(v46, v67, &qword_100021D30);
  sub_1000080C0((uint64_t)v63);
  sub_1000081F8(v46, &qword_100021D30);
  uint64_t v69 = v94;
  sub_10000811C(v67, v94);
  sub_100008194(v69, v67, &qword_100021D38);
  v70 = v76;
  uint64_t *v76 = v92;
  *((_DWORD *)v70 + 2) = v79;
  uint64_t v71 = v84;
  v70[2] = KeyPath;
  v70[3] = v71;
  v70[4] = v41;
  v70[5] = v43;
  *((unsigned char *)v70 + 48) = v61;
  v70[7] = v78;
  uint64_t v72 = sub_100007DA0(&qword_100021D98);
  sub_100008194(v67, (uint64_t)v70 + *(int *)(v72 + 64), &qword_100021D38);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100008184(v41, v43, v61);
  swift_bridgeObjectRetain();
  sub_1000081F8(v69, &qword_100021D38);
  sub_1000081F8(v67, &qword_100021D38);
  sub_100007F30(v41, v43, v61);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100007178()
{
  return swift_release();
}

uint64_t sub_1000071C8@<X0>(uint64_t a1@<X8>)
{
  sub_100007DA0(&qword_100021D50);
  State.wrappedValue.getter();
  swift_bridgeObjectRetain();
  swift_release();
  sub_100007EDC();
  uint64_t v2 = Text.init<A>(_:)();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  static Font.title.getter();
  uint64_t v7 = Text.font(_:)();
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  sub_100007F30(v2, v4, v6);
  swift_bridgeObjectRelease();
  static HierarchicalShapeStyle.primary.getter();
  uint64_t v12 = Text.foregroundStyle<A>(_:)();
  uint64_t v14 = v13;
  char v16 = v15;
  uint64_t v18 = v17;
  sub_100007F30(v7, v9, v11 & 1);
  swift_bridgeObjectRelease();
  LOBYTE(v9) = static Edge.Set.top.getter();
  unsigned __int8 v19 = static Edge.Set.bottom.getter();
  char v20 = Edge.Set.init(rawValue:)();
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v9) {
    char v20 = Edge.Set.init(rawValue:)();
  }
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v19) {
    char v20 = Edge.Set.init(rawValue:)();
  }
  if (qword_100021BD0 != -1) {
    swift_once();
  }
  EdgeInsets.init(_all:)();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  unsigned __int8 v29 = static Edge.Set.leading.getter();
  unsigned __int8 v30 = static Edge.Set.trailing.getter();
  char v31 = Edge.Set.init(rawValue:)();
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v29) {
    char v31 = Edge.Set.init(rawValue:)();
  }
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v30) {
    char v31 = Edge.Set.init(rawValue:)();
  }
  if (qword_100021BD8 != -1) {
    swift_once();
  }
  uint64_t result = EdgeInsets.init(_all:)();
  *(void *)a1 = v12;
  *(void *)(a1 + 8) = v14;
  *(unsigned char *)(a1 + 16) = v16 & 1;
  *(void *)(a1 + 24) = v18;
  *(unsigned char *)(a1 + 32) = v20;
  *(void *)(a1 + 40) = v22;
  *(void *)(a1 + 48) = v24;
  *(void *)(a1 + 56) = v26;
  *(void *)(a1 + 64) = v28;
  *(unsigned char *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 80) = v31;
  *(void *)(a1 + 88) = v33;
  *(void *)(a1 + 96) = v34;
  *(void *)(a1 + 104) = v35;
  *(void *)(a1 + 112) = v36;
  *(unsigned char *)(a1 + 120) = 0;
  return result;
}

__n128 sub_1000074BC@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  unsigned __int8 v19 = a16;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    uint64_t v28 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

    unsigned __int8 v19 = a16;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  uint64_t v29 = sub_100007DA0(v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 16))(a9, v17, v29);
  unsigned __int8 v30 = (_OWORD *)(a9 + *(int *)(sub_100007DA0(a17) + 36));
  v30[4] = v36;
  v30[5] = v37;
  v30[6] = v38;
  *unsigned __int8 v30 = v32;
  v30[1] = v33;
  __n128 result = v35;
  v30[2] = v34;
  v30[3] = v35;
  return result;
}

uint64_t sub_1000076B8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    uint64_t v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  memcpy(a9, v13, 0x129uLL);
  a9[23] = v29;
  a9[24] = v30;
  a9[25] = v31;
  a9[19] = v25;
  a9[20] = v26;
  a9[21] = v27;
  a9[22] = v28;

  return sub_100008254((uint64_t)v13);
}

uint64_t sub_10000787C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000634C(*v1, v1[1], a1);
}

uint64_t sub_100007884@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v44 = a3;
  uint64_t v5 = type metadata accessor for Material();
  uint64_t v42 = *(void *)(v5 - 8);
  uint64_t v43 = v5;
  __chkstk_darwin(v5, v6);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100007DA0(&qword_100021D40);
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100007DA0(&qword_100021D48);
  __chkstk_darwin(v13 - 8, v14);
  char v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_100007DA0(&qword_100021DA0);
  uint64_t v17 = *(void *)(v41 - 8);
  __chkstk_darwin(v41, v18);
  char v20 = (char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100007DA0(&qword_100021DA8);
  __chkstk_darwin(v21 - 8, v22);
  uint64_t v24 = (char *)&v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = static VerticalAlignment.center.getter();
  uint64_t v45 = a1;
  uint64_t v46 = a2;
  sub_100007DA0(&qword_100021D50);
  State.wrappedValue.getter();
  swift_bridgeObjectRetain();
  swift_release();
  Image.init(_internalSystemName:)();
  static SymbolRenderingMode.monochrome.getter();
  uint64_t v26 = type metadata accessor for SymbolRenderingMode();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v16, 0, 1, v26);
  uint64_t v27 = Image.symbolRenderingMode(_:)();
  swift_release();
  sub_1000081F8((uint64_t)v16, &qword_100021D48);
  uint64_t v28 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v12, 1, 1, v28);
  uint64_t v29 = static Font.system(size:weight:design:)();
  sub_1000081F8((uint64_t)v12, &qword_100021D40);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v45 = v25;
  uint64_t v46 = 0;
  char v47 = 1;
  uint64_t v48 = v27;
  uint64_t v49 = KeyPath;
  uint64_t v50 = v29;
  sub_100007DA0(&qword_100021DB0);
  sub_100008648(&qword_100021DB8, &qword_100021DB0);
  View.allowsSecureDrawing()();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v31 = static Alignment.center.getter();
  __n128 v33 = sub_1000074BC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v24, 0.0, 1, INFINITY, 0, v31, v32, &qword_100021DA0, &qword_100021DA8);
  (*(void (**)(char *, uint64_t, __n128))(v17 + 8))(v20, v41, v33);
  static Material.thin.getter();
  LOBYTE(v29) = static Edge.Set.all.getter();
  uint64_t v34 = sub_100007DA0(&qword_100021DC0);
  uint64_t v35 = v43;
  uint64_t v36 = v44;
  uint64_t v37 = v44 + *(int *)(v34 + 36);
  uint64_t v38 = v42;
  (*(void (**)(uint64_t, char *, uint64_t))(v42 + 16))(v37, v8, v43);
  *(unsigned char *)(v37 + *(int *)(sub_100007DA0(&qword_100021DC8) + 36)) = v29;
  sub_100008194((uint64_t)v24, v36, &qword_100021DA8);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v35);
  return sub_1000081F8((uint64_t)v24, &qword_100021DA8);
}

uint64_t sub_100007D60()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100007D7C@<X0>(uint64_t a1@<X8>)
{
  return sub_100007884(*v1, v1[1], a1);
}

uint64_t sub_100007D84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100007DA0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007DE4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007E2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100007E58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100007E84()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_100007EB0()
{
  return EnvironmentValues.font.setter();
}

unint64_t sub_100007EDC()
{
  unint64_t result = qword_100021D58;
  if (!qword_100021D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021D58);
  }
  return result;
}

uint64_t sub_100007F30(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100007F40()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007F80()
{
  return sub_100007178();
}

uint64_t sub_100007F88@<X0>(uint64_t a1@<X8>)
{
  return sub_1000071C8(a1);
}

unint64_t sub_100007F90()
{
  unint64_t result = qword_100021D70;
  if (!qword_100021D70)
  {
    sub_100007DE4(&qword_100021D78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021D70);
  }
  return result;
}

unint64_t sub_100008004()
{
  unint64_t result = qword_100021D88;
  if (!qword_100021D88)
  {
    type metadata accessor for PlainButtonStyle();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021D88);
  }
  return result;
}

uint64_t sub_10000805C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RoundedRectangle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000080C0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RoundedRectangle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000811C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007DA0(&qword_100021D38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008184(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100008194(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100007DA0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000081F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100007DA0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100008254(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 80);
  char v4 = *(unsigned char *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 120);
  uint64_t v6 = *(void *)(a1 + 128);
  char v8 = *(unsigned char *)(a1 + 136);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100008184(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100008184(v5, v6, v8);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_100008330()
{
  return sub_10000836C(&qword_100021DD0, &qword_100021D00, (void (*)(void))sub_1000083EC);
}

uint64_t sub_10000836C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007DE4(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000083EC()
{
  unint64_t result = qword_100021DD8;
  if (!qword_100021DD8)
  {
    sub_100007DE4(&qword_100021CE8);
    sub_100007DE4(&qword_100021CD8);
    sub_100008648(&qword_100021CF8, &qword_100021CD8);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021DD8);
  }
  return result;
}

unint64_t sub_1000084CC()
{
  unint64_t result = qword_100021DE0;
  if (!qword_100021DE0)
  {
    sub_100007DE4(&qword_100021DC0);
    sub_10000856C();
    sub_100008648(&qword_100021DF0, &qword_100021DC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021DE0);
  }
  return result;
}

unint64_t sub_10000856C()
{
  unint64_t result = qword_100021DE8;
  if (!qword_100021DE8)
  {
    sub_100007DE4(&qword_100021DA8);
    sub_100007DE4(&qword_100021DB0);
    sub_100008648(&qword_100021DB8, &qword_100021DB0);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021DE8);
  }
  return result;
}

uint64_t sub_100008648(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007DE4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100008694()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ScreenContinuityShellBundleMarkerClass()
{
  return self;
}

id sub_1000086C8()
{
  type metadata accessor for ScreenContinuityShellBundleMarkerClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_100022780 = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for LiveActivityDisplayingVendor()
{
  return self;
}

unint64_t sub_100008744@<X0>(void *a1@<X8>)
{
  uint64_t v2 = (objc_class *)type metadata accessor for ScreenContinuityActivity();
  id v3 = [objc_allocWithZone(v2) init];
  a1[3] = v2;
  unint64_t result = sub_10000879C();
  a1[4] = result;
  *a1 = v3;
  return result;
}

unint64_t sub_10000879C()
{
  unint64_t result = qword_100021F30;
  if (!qword_100021F30)
  {
    type metadata accessor for ScreenContinuityActivity();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021F30);
  }
  return result;
}

uint64_t sub_1000087F4()
{
  return 0;
}

uint64_t sub_100008800()
{
  return 0;
}

void sub_10000880C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100008818(uint64_t a1)
{
  unint64_t v2 = sub_10000BE4C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100008854(uint64_t a1)
{
  unint64_t v2 = sub_10000BE4C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100008890(uint64_t a1)
{
  return sub_10000BDB8(a1);
}

uint64_t sub_1000088B8(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100008A50(a1, a2, a3, &qword_100022008, (void (*)(void))sub_10000BE4C);
}

Swift::Int sub_1000088F4()
{
  return Hasher._finalize()();
}

Swift::Int sub_100008930()
{
  return Hasher._finalize()();
}

uint64_t sub_100008964()
{
  return 1;
}

uint64_t sub_10000896C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_10000899C(uint64_t a1)
{
  unint64_t v2 = sub_10000BEA0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000089D8(uint64_t a1)
{
  unint64_t v2 = sub_10000BEA0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100008A14(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100008A50(a1, a2, a3, &qword_100022018, (void (*)(void))sub_10000BEA0);
}

uint64_t sub_100008A50(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  uint64_t v7 = sub_100007DA0(a4);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000BE08(a1, a1[3]);
  a5();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

BOOL sub_100008B70(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100008B84()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100008BCC()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100008BF8()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

id sub_100008CA4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScreenContinuityActivity();
  return [super dealloc];
}

uint64_t type metadata accessor for ScreenContinuityActivity()
{
  return self;
}

ValueMetadata *type metadata accessor for ScreenContinuityAttributes()
{
  return &type metadata for ScreenContinuityAttributes;
}

unint64_t sub_100008D5C()
{
  unint64_t result = qword_100021F70;
  if (!qword_100021F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021F70);
  }
  return result;
}

unint64_t sub_100008DB4()
{
  unint64_t result = qword_100021F78;
  if (!qword_100021F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021F78);
  }
  return result;
}

unint64_t sub_100008E0C()
{
  unint64_t result = qword_100021F80;
  if (!qword_100021F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021F80);
  }
  return result;
}

unint64_t sub_100008E64()
{
  unint64_t result = qword_100021F88;
  if (!qword_100021F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021F88);
  }
  return result;
}

unint64_t sub_100008EBC()
{
  unint64_t result = qword_100021F90;
  if (!qword_100021F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021F90);
  }
  return result;
}

unint64_t sub_100008F14()
{
  unint64_t result = qword_100021F98[0];
  if (!qword_100021F98[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100021F98);
  }
  return result;
}

uint64_t sub_100008F68()
{
  v1[6] = v0;
  uint64_t v2 = type metadata accessor for ActivityPresentationOptions();
  v1[7] = v2;
  v1[8] = *(void *)(v2 - 8);
  v1[9] = swift_task_alloc();
  sub_100007DA0(&qword_100021FE0);
  v1[10] = swift_task_alloc();
  uint64_t v3 = sub_100007DA0(&qword_100021FC0);
  v1[11] = v3;
  v1[12] = *(void *)(v3 - 8);
  v1[13] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Logger();
  v1[14] = v4;
  v1[15] = *(void *)(v4 - 8);
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  v1[19] = swift_task_alloc();
  v1[20] = swift_task_alloc();
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  type metadata accessor for MainActor();
  v1[23] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100009194, v6, v5);
}

uint64_t sub_100009194()
{
  uint64_t v62 = v0;
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[15];
  swift_release();
  static Logger.angel.getter();
  v4._countAndFlagsBits = 0xD000000000000077;
  v4._object = (void *)0x8000000100019480;
  v5._object = (void *)0x8000000100019760;
  v5._countAndFlagsBits = 0xD000000000000012;
  Logger.debugMarker(_:line:function:message:)(v4, 36, v5, (Swift::String_optional)0);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v6(v1, v2);
  sub_100007DA0(&qword_100021FC8);
  unint64_t v7 = static Activity.activities.getter();
  if (v7 >> 62) {
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
  }
  else {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v8)
  {
    static Logger.angel.getter();
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "We already have an activity running", v11, 2u);
      swift_slowDealloc();
    }
    uint64_t v12 = v0[18];
LABEL_7:
    uint64_t v13 = v0[14];

    v6(v12, v13);
    goto LABEL_8;
  }
  id v16 = [self mainBundle];
  id v17 = [v16 bundleIdentifier];

  if (!v17)
  {
    static Logger.angel.getter();
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v9, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v27, "Bundle identifier is nil", v28, 2u);
      swift_slowDealloc();
    }
    uint64_t v12 = v0[19];
    goto LABEL_7;
  }
  uint64_t v56 = v6;
  uint64_t v18 = v0[10];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v19 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  sub_100008E0C();
  sub_100008E64();
  sub_100008EBC();
  ActivityContent.init(state:staleDate:relevanceScore:)();
  sub_100007DA0(&qword_100021FE8);
  uint64_t v20 = type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(void *)(v21 + 72);
  unint64_t v23 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_100016DD0;
  unint64_t v25 = v24 + v23;
  uint64_t v26 = *(void (**)(unint64_t, void, uint64_t))(v21 + 104);
  v26(v25, enum case for ActivityPresentationOptions.ActivityPresentationDestination.lockscreen(_:), v20);
  v26(v25 + v22, enum case for ActivityPresentationOptions.ActivityPresentationDestination.ambient(_:), v20);
  ActivityPresentationOptions.init(destinations:)();
  ActivityPresentationOptions.isUserDismissalAllowedOnLockScreen.setter();
  uint64_t v29 = static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)();
  uint64_t v30 = v0[6];
  swift_bridgeObjectRelease();
  uint64_t v31 = OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_activity;
  *(void *)(v30 + OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_activity) = v29;
  swift_release();
  if (*(void *)(v30 + v31))
  {
    swift_retain();
    uint64_t v32 = Activity.id.getter();
    sub_100009CC8(v32, v33);
    swift_bridgeObjectRelease();
    static Logger.angel.getter();
    swift_retain_n();
    uint64_t v44 = Logger.logObject.getter();
    os_log_type_t type = static os_log_type_t.info.getter();
    BOOL v45 = os_log_type_enabled(v44, type);
    uint64_t v46 = v0[13];
    uint64_t v57 = v0[14];
    uint64_t v58 = v0[21];
    uint64_t v48 = v0[11];
    uint64_t v47 = v0[12];
    uint64_t v49 = v0[8];
    uint64_t v50 = v0[9];
    os_log_t log = (os_log_t)v0[7];
    if (v45)
    {
      uint64_t v54 = v0[9];
      v51 = (uint8_t *)swift_slowAlloc();
      uint64_t v61 = swift_slowAlloc();
      *(_DWORD *)v51 = 136446210;
      uint64_t v52 = Activity.id.getter();
      v0[5] = sub_10000B648(v52, v53, &v61);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl((void *)&_mh_execute_header, v44, type, "Successfully requested activity with id %{public}s", v51, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_release();
      v56(v58, v57);
      (*(void (**)(uint64_t, os_log_t))(v49 + 8))(v54, log);
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v46, v48);
    }
    else
    {

      swift_release_n();
      v56(v58, v57);
      (*(void (**)(uint64_t, os_log_t))(v49 + 8))(v50, log);
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v46, v48);
    }
  }
  else
  {
    static Logger.angel.getter();
    uint64_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "No activity was returned", v36, 2u);
      swift_slowDealloc();
    }
    uint64_t v37 = v0[20];
    uint64_t v38 = v0[14];
    os_log_t loga = (os_log_t)v0[13];
    uint64_t v39 = v0[11];
    uint64_t v40 = v0[12];
    uint64_t v41 = v0[8];
    uint64_t v42 = v0[9];
    uint64_t v43 = v0[7];

    v56(v37, v38);
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v42, v43);
    (*(void (**)(os_log_t, uint64_t))(v40 + 8))(loga, v39);
  }
LABEL_8:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

void sub_100009CC8(uint64_t a1, unint64_t a2)
{
  unint64_t v86 = a2;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = __chkstk_darwin(v4, v6);
  uint64_t v9 = (char *)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v7, v10);
  uint64_t v13 = (char *)&v73 - v12;
  uint64_t v15 = __chkstk_darwin(v11, v14);
  id v17 = (char *)&v73 - v16;
  __chkstk_darwin(v15, v18);
  uint64_t v20 = (char *)&v73 - v19;
  uint64_t v21 = type metadata accessor for ActivityState();
  uint64_t v23 = __chkstk_darwin(v21, v22);
  uint64_t v25 = __chkstk_darwin(v23, v24);
  uint64_t v29 = OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_prominenceAssertion;
  if (*(void *)&v2[OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_prominenceAssertion])
  {
    static Logger.angel.getter();
    uint64_t v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "We already have an assertion running", v32, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
    sub_10000BD00();
    swift_allocError();
    *unint64_t v33 = 0;
    swift_willThrow();
    return;
  }
  v77 = (char *)&v73 - v26;
  uint64_t v78 = v28;
  v80 = v17;
  uint64_t v81 = v27;
  uint64_t v79 = v25;
  v83 = v13;
  uint64_t v84 = v4;
  v76 = v20;
  uint64_t v85 = v5;
  uint64_t v34 = (void *)swift_allocObject();
  unint64_t v35 = v86;
  v34[2] = a1;
  v34[3] = v35;
  v34[4] = v2;
  id v36 = objc_allocWithZone((Class)SNAProminentPresentationAssertion);
  swift_bridgeObjectRetain_n();
  uint64_t v37 = v2;
  NSString v38 = String._bridgeToObjectiveC()();
  uint64_t v82 = a1;
  NSString v39 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = (uint64_t)sub_10000BD94;
  aBlock[5] = (uint64_t)v34;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10000B5BC;
  aBlock[3] = (uint64_t)&unk_10001D298;
  uint64_t v40 = _Block_copy(aBlock);
  swift_release();
  id v41 = [v36 initWithExplanation:v38 sessionIdentifier:v39 invalidationHandler:v40];
  _Block_release(v40);

  if ([v41 state] == (id)1)
  {
    uint64_t v42 = *(void **)&v2[v29];
    *(void *)&v2[v29] = v41;
    id v43 = v41;

    uint64_t v44 = v83;
    static Logger.angel.getter();
    swift_bridgeObjectRetain_n();
    BOOL v45 = Logger.logObject.getter();
    os_log_type_t v46 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v47 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v88 = sub_10000B648(v82, v35, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v45, v46, "Assertion acquired [id: %{public}s", v47, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v85 + 8))(v83, v84);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v85 + 8))(v44, v84);
    }
    return;
  }
  if (!*(void *)&v37[OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_activity]) {
    goto LABEL_20;
  }
  uint64_t v75 = OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_activity;
  v83 = v37;
  swift_retain();
  if (Activity.id.getter() == v82 && v48 == v86)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v49 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v49 & 1) == 0)
    {
LABEL_19:
      swift_release();
LABEL_20:
      v64 = v80;
      static Logger.angel.getter();
      unint64_t v65 = v86;
      swift_bridgeObjectRetain_n();
      id v66 = v41;
      uint64_t v67 = Logger.logObject.getter();
      os_log_type_t v68 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v67, v68))
      {
        unint64_t v69 = v65;
        uint64_t v70 = swift_slowAlloc();
        aBlock[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v70 = 136446466;
        swift_bridgeObjectRetain();
        uint64_t v88 = sub_10000B648(v82, v69, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v70 + 12) = 2050;
        id v71 = [v66 state];

        uint64_t v88 = (uint64_t)v71;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        _os_log_impl((void *)&_mh_execute_header, v67, v68, "Acquire assertion failed [id:%{public}s, \nstate: %{public}lu]", (uint8_t *)v70, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v85 + 8))(v80, v84);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v85 + 8))(v64, v84);
      }
      sub_10000BD00();
      swift_allocError();
      *uint64_t v72 = 2;
      swift_willThrow();

      return;
    }
  }
  uint64_t v50 = v77;
  dispatch thunk of Activity.activityState.getter();
  uint64_t v51 = v81;
  uint64_t v53 = v78;
  uint64_t v52 = v79;
  uint64_t v74 = *(void (**)(uint64_t, void, uint64_t))(v81 + 104);
  v74(v78, enum case for ActivityState.dismissed(_:), v79);
  char v54 = static ActivityState.== infix(_:_:)();
  uint64_t v55 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
  v55(v53, v52);
  uint64_t v81 = v51 + 8;
  v55((uint64_t)v50, v52);
  if ((v54 & 1) == 0)
  {
    uint64_t v56 = v77;
    dispatch thunk of Activity.activityState.getter();
    uint64_t v58 = v78;
    uint64_t v57 = v79;
    v74(v78, enum case for ActivityState.ended(_:), v79);
    char v59 = static ActivityState.== infix(_:_:)();
    v55(v58, v57);
    v55((uint64_t)v56, v57);
    if ((v59 & 1) == 0) {
      goto LABEL_19;
    }
  }
  uint64_t v60 = v76;
  static Logger.angel.getter();
  uint64_t v61 = Logger.logObject.getter();
  os_log_type_t v62 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v61, v62))
  {
    uint64_t v63 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v63 = 0;
    _os_log_impl((void *)&_mh_execute_header, v61, v62, "Assertion acquisition failed due to activity having already ended", v63, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v85 + 8))(v60, v84);
  *(void *)&v83[v75] = 0;

  swift_release();
  swift_release();
}

uint64_t sub_10000A664()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t result = __chkstk_darwin(v1, v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_prominenceAssertion;
  uint64_t v8 = *(void **)(v0 + OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_prominenceAssertion);
  if (v8)
  {
    id v9 = v8;
    [v9 invalidate];
    uint64_t v10 = *(void **)(v0 + v7);
    *(void *)(v0 + v7) = 0;

    static Logger.angel.getter();
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Assertion Released", v13, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v6, v1);
  }
  return result;
}

uint64_t sub_10000A7D8()
{
  v1[4] = v0;
  uint64_t v2 = type metadata accessor for ActivityUIDismissalPolicy();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  sub_100007DA0(&qword_100021FB8);
  v1[8] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for Logger();
  v1[9] = v3;
  v1[10] = *(void *)(v3 - 8);
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  type metadata accessor for MainActor();
  v1[13] = static MainActor.shared.getter();
  uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter();
  v1[14] = v5;
  v1[15] = v4;
  return _swift_task_switch(sub_10000A968, v5, v4);
}

uint64_t sub_10000A968()
{
  uint64_t v27 = v0;
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[10];
  static Logger.angel.getter();
  v5._countAndFlagsBits = 0xD000000000000077;
  v5._object = (void *)0x8000000100019480;
  v6._object = (void *)0x8000000100019500;
  v6._countAndFlagsBits = 0xD000000000000015;
  Logger.debugMarker(_:line:function:message:)(v5, 92, v6, (Swift::String_optional)0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v7(v2, v3);
  uint64_t v8 = *(void *)(v1 + OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_activity);
  v0[16] = v8;
  if (v8)
  {
    swift_retain();
    static Logger.angel.getter();
    swift_retain_n();
    id v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.info.getter();
    BOOL v11 = os_log_type_enabled(v9, v10);
    uint64_t v12 = v0[11];
    uint64_t v13 = v0[9];
    if (v11)
    {
      uint64_t v24 = v0[11];
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136446210;
      v0[2] = v8;
      swift_retain();
      sub_100007DA0(&qword_100021FC8);
      uint64_t v15 = String.init<A>(describing:)();
      v0[3] = sub_10000B648(v15, v16, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Ending activity %{public}s", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v7(v24, v13);
    }
    else
    {
      swift_release_n();

      v7(v12, v13);
    }
    uint64_t v19 = v0[8];
    sub_10000A664();
    dispatch thunk of Activity.content.getter();
    uint64_t v20 = sub_100007DA0(&qword_100021FC0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 0, 1, v20);
    static ActivityUIDismissalPolicy.immediate.getter();
    uint64_t v25 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:)
                                                   + async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:));
    uint64_t v21 = (void *)swift_task_alloc();
    v0[17] = v21;
    *uint64_t v21 = v0;
    v21[1] = sub_10000AD24;
    uint64_t v22 = v0[7];
    uint64_t v23 = v0[8];
    return v25(v23, v22);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v17 = (uint64_t (*)(void))v0[1];
    return v17();
  }
}

uint64_t sub_10000AD24()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 64);
  uint64_t v3 = *(void *)(*v0 + 56);
  uint64_t v4 = *(void *)(*v0 + 48);
  uint64_t v5 = *(void *)(*v0 + 40);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  sub_10000B55C(v2);
  uint64_t v6 = *(void *)(v1 + 120);
  uint64_t v7 = *(void *)(v1 + 112);
  return _swift_task_switch(sub_10000AEC4, v7, v6);
}

uint64_t sub_10000AEC4()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_10000AF5C(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.angel.getter();
  id v15 = a1;
  swift_bridgeObjectRetain();
  swift_errorRetain();
  id v16 = v15;
  swift_bridgeObjectRetain();
  swift_errorRetain();
  id v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v28 = v11;
    uint64_t v29 = v10;
    uint64_t v30 = a5;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v26 = (void *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v32 = v27;
    *(_DWORD *)uint64_t v19 = 136446978;
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_10000B648(a3, a4, &v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v19 + 12) = 2050;
    id v20 = [v16 state];

    uint64_t v31 = (uint64_t)v20;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    *(_WORD *)(v19 + 22) = 2050;
    id v21 = [v16 invalidationReason];

    uint64_t v31 = (uint64_t)v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    *(_WORD *)(v19 + 32) = 2112;
    if (a2)
    {
      swift_errorRetain();
      uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v31 = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
    }
    else
    {
      uint64_t v31 = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v22 = 0;
    }
    uint64_t v24 = v28;
    uint64_t v23 = v29;
    *uint64_t v26 = v22;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Assertion invalidated [id: %{public}s, \nstate: %{public}lu, \ninvalidationReason: %{public}lu, \nerror: %@],", (uint8_t *)v19, 0x2Au);
    sub_100007DA0(&qword_100021FF8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v24 + 8))(v14, v23);
    a5 = v30;
  }
  else
  {
    swift_bridgeObjectRelease_n();

    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  }
  uint64_t v25 = *(void **)(a5 + OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_prominenceAssertion);
  *(void *)(a5 + OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_prominenceAssertion) = 0;
}

uint64_t sub_10000B348()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10000B3D8;
  return sub_100008F68();
}

uint64_t sub_10000B3D8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000B4CC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10000C290;
  return sub_10000A7D8();
}

uint64_t sub_10000B55C(uint64_t a1)
{
  uint64_t v2 = sub_100007DA0(&qword_100021FB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10000B5BC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, a3);
  swift_release();
}

uint64_t sub_10000B648(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000B71C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000BCA0((uint64_t)v12, *a3);
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
      sub_10000BCA0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000BDB8((uint64_t)v12);
  return v7;
}

uint64_t sub_10000B71C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000B8D8(a5, a6);
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

uint64_t sub_10000B8D8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000B970(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000BB50(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000BB50(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000B970(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000BAE8(v2, 0);
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

void *sub_10000BAE8(uint64_t a1, uint64_t a2)
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
  sub_100007DA0(&qword_100021FD0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000BB50(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007DA0(&qword_100021FD0);
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

uint64_t sub_10000BCA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10000BD00()
{
  unint64_t result = qword_100022000;
  if (!qword_100022000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022000);
  }
  return result;
}

uint64_t sub_10000BD54()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10000BD94(void *a1, uint64_t a2)
{
  sub_10000AF5C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_10000BDA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000BDB0()
{
  return swift_release();
}

uint64_t sub_10000BDB8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *sub_10000BE08(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000BE4C()
{
  unint64_t result = qword_100022010;
  if (!qword_100022010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022010);
  }
  return result;
}

unint64_t sub_10000BEA0()
{
  unint64_t result = qword_100022020;
  if (!qword_100022020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022020);
  }
  return result;
}

ValueMetadata *type metadata accessor for ScreenContinuityAttributes.CodingKeys()
{
  return &type metadata for ScreenContinuityAttributes.CodingKeys;
}

ValueMetadata *type metadata accessor for ScreenContinuityAttributes.ContentState.CodingKeys()
{
  return &type metadata for ScreenContinuityAttributes.ContentState.CodingKeys;
}

unsigned char *initializeBufferWithCopyOfBuffer for ScreenContinuityActivity.ProminenceAssertionError(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ScreenContinuityActivity.ProminenceAssertionError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ScreenContinuityActivity.ProminenceAssertionError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x10000C07CLL);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_10000C0A4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000C0AC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ScreenContinuityActivity.ProminenceAssertionError()
{
  return &type metadata for ScreenContinuityActivity.ProminenceAssertionError;
}

ValueMetadata *type metadata accessor for ScreenContinuityAttributes.ContentState()
{
  return &type metadata for ScreenContinuityAttributes.ContentState;
}

unint64_t sub_10000C0D8()
{
  unint64_t result = qword_100022028;
  if (!qword_100022028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022028);
  }
  return result;
}

unint64_t sub_10000C130()
{
  unint64_t result = qword_100022030;
  if (!qword_100022030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022030);
  }
  return result;
}

unint64_t sub_10000C188()
{
  unint64_t result = qword_100022038;
  if (!qword_100022038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022038);
  }
  return result;
}

unint64_t sub_10000C1E0()
{
  unint64_t result = qword_100022040;
  if (!qword_100022040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022040);
  }
  return result;
}

unint64_t sub_10000C238()
{
  unint64_t result = qword_100022048;
  if (!qword_100022048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022048);
  }
  return result;
}

id sub_10000C3CC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivitySceneDelegate();
  [super dealloc];
}

uint64_t type metadata accessor for ActivitySceneDelegate()
{
  return self;
}

void *sub_10000C434(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = type metadata accessor for Locale();
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v10 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v10 - 8, v11);
  v29[3] = type metadata accessor for LSAppWorkspaceBackedApplicationLaunchPrimitives();
  v29[4] = &protocol witness table for LSAppWorkspaceBackedApplicationLaunchPrimitives;
  v29[0] = a3;
  String.LocalizationValue.init(stringLiteral:)();
  if (qword_100021BB0 != -1) {
    swift_once();
  }
  id v12 = (id)qword_100022780;
  static Locale.current.getter();
  a4[6] = String.init(localized:table:bundle:locale:comment:)();
  a4[7] = v13;
  String.LocalizationValue.init(stringLiteral:)();
  id v14 = v12;
  static Locale.current.getter();
  a4[8] = String.init(localized:table:bundle:locale:comment:)();
  a4[9] = v15;
  a4[10] = 0xD00000000000001BLL;
  a4[11] = 0x8000000100019A00;
  ObservationRegistrar.init()();
  a4[12] = a1;
  a4[13] = a2;
  sub_10000D840((uint64_t)v29, (uint64_t)(a4 + 14));
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v17 = dispatch thunk of LiveActivityDelegate.clientName.getter();
  a4[2] = v17;
  a4[3] = v16;
  if (v16)
  {
    uint64_t v18 = v16;
    v19.super.isa = (Class)qword_100022780;
    swift_bridgeObjectRetain();
    v30._countAndFlagsBits = 0xD00000000000001CLL;
    v30._object = (void *)0x8000000100019AC0;
    v20._object = (void *)0x8000000100019A90;
    v20._countAndFlagsBits = 0x1000000000000028;
    v21._countAndFlagsBits = 0;
    v21._object = (void *)0xE000000000000000;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v20, (Swift::String_optional)0, v19, v21, v30);
    sub_100007DA0(&qword_100022130);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_1000171F0;
    *(void *)(v22 + 56) = &type metadata for String;
    *(void *)(v22 + 64) = sub_10000D8A4();
    *(void *)(v22 + 32) = v17;
    *(void *)(v22 + 40) = v18;
    uint64_t v23 = static String.localizedStringWithFormat(_:_:)();
    uint64_t v25 = v24;
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    String.LocalizationValue.init(stringLiteral:)();
    id v26 = (id)qword_100022780;
    static Locale.current.getter();
    uint64_t v23 = String.init(localized:table:bundle:locale:comment:)();
    uint64_t v25 = v27;
    swift_unknownObjectRelease();
  }
  sub_10000BDB8((uint64_t)v29);
  a4[4] = v23;
  a4[5] = v25;
  return a4;
}

char *sub_10000C7D4(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v8 = type metadata accessor for UIHostingControllerSizingOptions();
  __chkstk_darwin(v8, v9);
  objc_allocWithZone((Class)sub_100007DA0(&qword_1000220F8));
  double v50 = a4;
  uint64_t v51 = a1;
  uint64_t v52 = a2;
  swift_retain();
  swift_retain();
  uint64_t v10 = v4;
  uint64_t v11 = (void *)UIHostingController.init(rootView:)();
  sub_100007DA0(&qword_100022100);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1000171F0;
  static UIHostingControllerSizingOptions.preferredContentSize.getter();
  uint64_t v49 = v12;
  sub_10000D74C();
  sub_100007DA0(&qword_100022110);
  sub_10000D7A4();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  dispatch thunk of UIHostingController.sizingOptions.setter();
  *(void *)&v10[qword_100022518] = v11;
  id v13 = v11;

  v48.receiver = v10;
  v48.super_class = (Class)sub_100007DA0(&qword_1000220E0);
  id v14 = [super initWithNibName:0 bundle:0];
  unint64_t result = (char *)[v14 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v16 = result;
  uint64_t v17 = qword_100022518;
  unint64_t result = (char *)[*(id *)&v14[qword_100022518] view];
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v18 = result;
  [v16 addSubview:result];

  [v14 addChildViewController:*(void *)&v14[v17]];
  unint64_t result = (char *)[v14 view];
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  NSBundle v19 = result;
  Swift::String v20 = self;
  id v21 = [v20 clearColor];
  [v19 setBackgroundColor:v21];

  unint64_t result = (char *)[v13 view];
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v22 = result;
  id v23 = [v20 clearColor];
  [v22 setBackgroundColor:v23];

  unint64_t result = (char *)[v13 view];
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v24 = result;
  [result setTranslatesAutoresizingMaskIntoConstraints:0];

  sub_100007DA0(&qword_100022120);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_100017200;
  unint64_t result = (char *)[v13 view];
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v26 = result;
  id v27 = [result topAnchor];

  unint64_t result = (char *)[v14 view];
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v28 = result;
  id v29 = [result topAnchor];

  id v30 = [v27 constraintEqualToAnchor:v29];
  *(void *)(v25 + 32) = v30;
  unint64_t result = (char *)[v13 view];
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v31 = result;
  id v32 = [result leadingAnchor];

  unint64_t result = (char *)[v14 view];
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  unint64_t v33 = result;
  id v34 = [result leadingAnchor];

  id v35 = [v32 constraintEqualToAnchor:v34];
  *(void *)(v25 + 40) = v35;
  unint64_t result = (char *)[v13 view];
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  id v36 = result;
  id v37 = [result trailingAnchor];

  unint64_t result = (char *)[v14 view];
  if (!result)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  NSString v38 = result;
  id v39 = [result trailingAnchor];

  id v40 = [v37 constraintEqualToAnchor:v39];
  *(void *)(v25 + 48) = v40;
  unint64_t result = (char *)[v13 view];
  if (!result)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  id v41 = result;
  id v42 = [result bottomAnchor];

  unint64_t result = (char *)[v14 view];
  if (result)
  {
    id v43 = result;
    uint64_t v44 = self;
    id v45 = [v43 bottomAnchor];

    id v46 = [v42 constraintEqualToAnchor:v45];
    *(void *)(v25 + 56) = v46;
    uint64_t v49 = v25;
    specialized Array._endMutation()();
    sub_10000D800();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v44 activateConstraints:isa];

    return v14;
  }
LABEL_27:
  __break(1u);
  return result;
}

void sub_10000CE30(void *a1, void *a2)
{
  uint64_t v3 = v2;
  id v93 = a2;
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = __chkstk_darwin(v5, v7);
  uint64_t v10 = &v83[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = __chkstk_darwin(v8, v11);
  id v14 = &v83[-v13];
  __chkstk_darwin(v12, v15);
  uint64_t v17 = &v83[-v16];
  static Logger.angel.getter();
  v18._countAndFlagsBits = 0xD00000000000001FLL;
  v19._countAndFlagsBits = 0xD000000000000079;
  v19._object = (void *)0x80000001000198A0;
  v18._object = (void *)0x8000000100019920;
  Logger.debugMarker(_:line:function:message:)(v19, 18, v18, (Swift::String_optional)0);
  Swift::String v20 = *(void (**)(unsigned char *, uint64_t))(v6 + 8);
  v20(v17, v5);
  type metadata accessor for ActivityScene();
  uint64_t v21 = swift_dynamicCastClass();
  if (v21)
  {
    uint64_t v22 = v21;
    unint64_t v86 = v14;
    uint64_t v87 = v20;
    type metadata accessor for AngelServer();
    id v23 = a1;
    uint64_t v24 = (void *)static AngelServer.sharedInstance.getter();
    uint64_t v25 = AngelServer.liveActivityDelegate.getter();
    uint64_t v27 = v26;

    id v28 = [objc_allocWithZone((Class)type metadata accessor for ActivitySecureWindow()) initWithWindowScene:v22];
    uint64_t v29 = OBJC_IVAR____TtC21ScreenContinuityShell21ActivitySceneDelegate_window;
    id v30 = *(void **)(v3 + OBJC_IVAR____TtC21ScreenContinuityShell21ActivitySceneDelegate_window);
    *(void *)(v3 + OBJC_IVAR____TtC21ScreenContinuityShell21ActivitySceneDelegate_window) = v28;
    id v31 = v28;

    id v32 = *(void **)(v3 + v29);
    if (!v32)
    {

      swift_unknownObjectRelease();
      return;
    }
    id v89 = v31;
    id v91 = v23;
    type metadata accessor for LSAppWorkspaceBackedApplicationLaunchPrimitives();
    swift_allocObject();
    id v88 = v32;
    uint64_t v33 = LSAppWorkspaceBackedApplicationLaunchPrimitives.init()();
    type metadata accessor for LiveActivityViewModel();
    id v34 = (void *)swift_allocObject();
    swift_unknownObjectRetain();
    swift_retain();
    uint64_t v90 = v25;
    uint64_t v92 = sub_10000C434(v25, v27, v33, v34);
    id v35 = [v93 role];
    id v36 = (void *)static UISceneSessionRole.activityAmbient.getter();
    uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v39 = v38;
    if (v37 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v39 == v40)
    {

      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v44 = _stringCompareWithSmolCheck(_:_:expecting:)();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v44 & 1) == 0)
      {
        id v85 = v35;
        uint64_t v52 = (void *)static UISceneSessionRole.activityAmbientCompact.getter();
        uint64_t v53 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v55 = v54;
        if (v53 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v55 == v56)
        {
          id v57 = v85;

          swift_bridgeObjectRelease_n();
        }
        else
        {
          int v84 = _stringCompareWithSmolCheck(_:_:expecting:)();
          id v57 = v85;

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v84 & 1) == 0)
          {
            v64 = (void *)static UISceneSessionRole.activityListItem.getter();
            uint64_t v65 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v67 = v66;
            if (v65 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v67 == v68)
            {

              swift_bridgeObjectRelease_n();
            }
            else
            {
              char v69 = _stringCompareWithSmolCheck(_:_:expecting:)();

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v69 & 1) == 0)
              {
LABEL_28:
                static Logger.angel.getter();
                id v77 = v93;
                uint64_t v78 = Logger.logObject.getter();
                os_log_type_t v79 = static os_log_type_t.error.getter();
                if (os_log_type_enabled(v78, v79))
                {
                  v80 = (uint8_t *)swift_slowAlloc();
                  uint64_t v94 = swift_slowAlloc();
                  *(_DWORD *)v80 = 136446210;
                  id v96 = [v77 role];
                  type metadata accessor for Role(0);
                  uint64_t v81 = String.init<A>(describing:)();
                  id v96 = (id)sub_10000B648(v81, v82, &v94);
                  UnsafeMutableRawBufferPointer.copyMemory(from:)();

                  swift_bridgeObjectRelease();
                  _os_log_impl((void *)&_mh_execute_header, v78, v79, "Session role %{public}s not supported", v80, 0xCu);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();
                }
                else
                {
                }
                v87(v86, v5);
                _assertionFailure(_:_:file:line:flags:)();
                __break(1u);
                return;
              }
            }
            id v63 = v88;
            [v88 frame];
            double Width = CGRectGetWidth(v97);
            [v63 frame];
            double Height = CGRectGetHeight(v98);
            uint64_t v61 = v91;
            if (qword_100021BC0 != -1) {
              swift_once();
            }
            id v72 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics());
            ActivitySceneMetrics.init(size:cornerRadius:)();
            dispatch thunk of ActivityScene.resolvedMetrics.setter();
            id v73 = [self clearColor];
            dispatch thunk of ActivityScene.backgroundTintColor.setter();
            id v96 = v92;
            swift_retain();
            State.init(wrappedValue:)();
            uint64_t v74 = v94;
            uint64_t v75 = v95;
            id v76 = objc_allocWithZone((Class)sub_100007DA0(&qword_1000220E0));
            objc_super v48 = sub_10000C7D4(v74, v75, Width, Height);
            swift_release();
            swift_release();
            os_log_type_t v62 = v89;
            goto LABEL_19;
          }
        }

        id v96 = v92;
        swift_retain();
        State.init(wrappedValue:)();
        uint64_t v58 = v94;
        uint64_t v59 = v95;
        id v60 = objc_allocWithZone((Class)sub_100007DA0(&qword_1000220E8));
        uint64_t v94 = v58;
        uint64_t v95 = v59;
        objc_super v48 = (void *)UIHostingController.init(rootView:)();
        goto LABEL_18;
      }
    }

    id v96 = v92;
    swift_retain();
    State.init(wrappedValue:)();
    uint64_t v45 = v94;
    uint64_t v46 = v95;
    id v47 = objc_allocWithZone((Class)sub_100007DA0(&qword_1000220F0));
    uint64_t v94 = v45;
    uint64_t v95 = v46;
    objc_super v48 = (void *)UIHostingController.init(rootView:)();
    id v49 = [v48 view];
    if (v49)
    {
      double v50 = v49;
      id v51 = [self blackColor];
      [v50 setBackgroundColor:v51];

LABEL_18:
      uint64_t v61 = v91;
      id v63 = v88;
      os_log_type_t v62 = v89;
LABEL_19:
      [v63 setRootViewController:v48];
      [v63 makeKeyAndVisible];

      swift_release();
      swift_release();
      swift_unknownObjectRelease();

      return;
    }
    __break(1u);
    goto LABEL_28;
  }
  static Logger.angel.getter();
  id v41 = Logger.logObject.getter();
  os_log_type_t v42 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v41, v42))
  {
    id v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v43 = 0;
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "ActivityScene is missing", v43, 2u);
    swift_slowDealloc();
  }

  v20(v10, v5);
}

unint64_t sub_10000D74C()
{
  unint64_t result = qword_100022108;
  if (!qword_100022108)
  {
    type metadata accessor for UIHostingControllerSizingOptions();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022108);
  }
  return result;
}

unint64_t sub_10000D7A4()
{
  unint64_t result = qword_100022118;
  if (!qword_100022118)
  {
    sub_100007DE4(&qword_100022110);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022118);
  }
  return result;
}

unint64_t sub_10000D800()
{
  unint64_t result = qword_100022128;
  if (!qword_100022128)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100022128);
  }
  return result;
}

uint64_t sub_10000D840(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10000D8A4()
{
  unint64_t result = qword_100022138;
  if (!qword_100022138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022138);
  }
  return result;
}

uint64_t sub_10000D8F8()
{
  uint64_t v0 = sub_100007DA0((uint64_t *)&unk_100022200);
  __chkstk_darwin(v0 - 8, v1);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for URL();
  sub_10000DA28(v4, qword_100022790);
  uint64_t v5 = sub_10000DA8C(v4, (uint64_t)qword_100022790);
  URL.init(string:)();
  uint64_t v6 = *(void *)(v4 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v3, 1, v4);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(v5, v3, v4);
  }
  __break(1u);
  return result;
}

uint64_t *sub_10000DA28(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000DA8C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

double sub_10000DAC4()
{
  double result = 0.0;
  xmmword_1000227B0 = xmmword_100017230;
  return result;
}

void sub_10000DAD8()
{
  qword_1000227C0 = 0x4024000000000000;
}

void sub_10000DAE8()
{
  qword_1000227C8 = 0x4024000000000000;
}

void sub_10000DAF8()
{
  qword_1000227D0 = 0x4034000000000000;
}

void sub_10000DB08()
{
  qword_1000227D8 = 0x4039000000000000;
}

void sub_10000DB18()
{
  qword_100022210 = 0x7265536C6C656853;
  *(void *)algn_100022218 = 0xEB00000000726576;
}

id sub_10000DB64()
{
  return sub_10000F9E0(type metadata accessor for Application);
}

uint64_t sub_10000DB7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC21ScreenContinuityShell11AppDelegate____lazy_storage___displayRegistrarVendor;
  swift_beginAccess();
  if (*(void *)(v3 + 24))
  {
    sub_10000D840(v3, (uint64_t)&v13);
    if (!*((void *)&v14 + 1))
    {
LABEL_5:
      uint64_t v5 = type metadata accessor for ShellSceneKitBackedConnectedDisplayRegistryVendor();
      uint64_t v6 = swift_allocObject();
      *((void *)&v14 + 1) = v5;
      uint64_t v15 = sub_100010CD0(&qword_1000223B0, (void (*)(uint64_t))type metadata accessor for ShellSceneKitBackedConnectedDisplayRegistryVendor);
      *(void *)&long long v13 = v6;
      sub_10000D840((uint64_t)&v13, (uint64_t)&v10);
      swift_beginAccess();
      uint64_t v7 = *((void *)&v11 + 1);
      if (*(void *)(v3 + 24))
      {
        sub_10000BDB8(v3);
        if (v7)
        {
LABEL_7:
          sub_100010C20(&v10, v3);
LABEL_10:
          swift_endAccess();
          return sub_100010C20(&v13, a1);
        }
      }
      else if (*((void *)&v11 + 1))
      {
        goto LABEL_7;
      }
      long long v8 = v11;
      *(_OWORD *)uint64_t v3 = v10;
      *(_OWORD *)(v3 + 16) = v8;
      *(void *)(v3 + 32) = v12;
      goto LABEL_10;
    }
  }
  else
  {
    long long v4 = *(_OWORD *)(v3 + 16);
    long long v13 = *(_OWORD *)v3;
    long long v14 = v4;
    uint64_t v15 = *(void *)(v3 + 32);
    if (!*((void *)&v4 + 1)) {
      goto LABEL_5;
    }
  }
  return sub_100010C20(&v13, a1);
}

id sub_10000DCD4()
{
  uint64_t v15 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(void *)(v15 - 8);
  __chkstk_darwin(v15, v2);
  long long v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v5, v6);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v14 = OBJC_IVAR____TtC21ScreenContinuityShell11AppDelegate_xpcEventQueue;
  sub_100010C38(0, &qword_1000223B8);
  uint64_t v9 = v0;
  static DispatchQoS.unspecified.getter();
  uint64_t v17 = &_swiftEmptyArrayStorage;
  sub_100010CD0(&qword_1000223C0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100007DA0(&qword_1000223C8);
  sub_100010C74();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v15);
  *(void *)(v13 + v14) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  long long v10 = &v9[OBJC_IVAR____TtC21ScreenContinuityShell11AppDelegate____lazy_storage___displayRegistrarVendor];
  *((void *)v10 + 4) = 0;
  *(_OWORD *)long long v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;

  long long v11 = (objc_class *)type metadata accessor for AppDelegate();
  v16.receiver = v9;
  v16.super_class = v11;
  return [super init];
}

id sub_10000DF88()
{
  return sub_10000F9E0(type metadata accessor for AppDelegate);
}

uint64_t sub_10000E004(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100007DA0(&qword_100022328);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = __chkstk_darwin(v8, v10);
  uint64_t v13 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v11, v14);
  uint64_t v17 = (char *)&v57 - v16;
  uint64_t v19 = __chkstk_darwin(v15, v18);
  uint64_t v21 = (char *)&v57 - v20;
  __chkstk_darwin(v19, v22);
  uint64_t v24 = (char *)&v57 - v23;
  uint64_t v25 = (const char *)XPC_EVENT_KEY_NAME.getter();
  v64 = a1;
  if (xpc_dictionary_get_string(a1, v25))
  {
    uint64_t v60 = a2;
    uint64_t v26 = String.init(cString:)();
    unint64_t v28 = v27;
    static Logger.angel.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.info.getter();
    BOOL v31 = os_log_type_enabled(v29, v30);
    uint64_t v61 = v7;
    uint64_t v62 = v8;
    id v63 = (void (*)(char *, uint64_t))v26;
    if (v31)
    {
      uint64_t v58 = v17;
      uint64_t v59 = v9;
      uint64_t v32 = v26;
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v66 = swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v65 = sub_10000B648(v32, v28, &v66);
      uint64_t v8 = v62;
      uint64_t v34 = v59;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Received %s event from rapport", v33, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v9 = v34;
      uint64_t v35 = v34;
      uint64_t v17 = v58;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v35 = v9;
    }
    uint64_t v40 = *(void (**)(char *, uint64_t))(v35 + 8);
    v40(v21, v8);
    if (qword_100021BE8 != -1) {
      swift_once();
    }
    uint64_t v41 = (uint64_t)v63;
    if (v63 == (void (*)(char *, uint64_t))qword_100022210 && v28 == *(void *)algn_100022218
      || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      static Logger.angel.getter();
      os_log_type_t v42 = Logger.logObject.getter();
      os_log_type_t v43 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v42, v43))
      {
        char v44 = (uint8_t *)swift_slowAlloc();
        uint64_t v45 = swift_slowAlloc();
        id v63 = v40;
        uint64_t v66 = v45;
        *(_DWORD *)char v44 = 136446210;
        uint64_t v46 = v17;
        uint64_t v47 = qword_100022210;
        unint64_t v48 = *(void *)algn_100022218;
        swift_bridgeObjectRetain();
        uint64_t v65 = sub_10000B648(v47, v48, &v66);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v42, v43, "Received %{public}s event from rapport, starting session bootstrap", v44, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v63(v46, v62);
      }
      else
      {

        v40(v17, v8);
      }
      uint64_t v49 = (uint64_t)v61;
      static TaskPriority.userInitiated.getter();
      uint64_t v50 = type metadata accessor for TaskPriority();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v49, 0, 1, v50);
      uint64_t v51 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v52 = (void *)swift_allocObject();
      v52[2] = 0;
      v52[3] = 0;
      v52[4] = v51;
      v52[5] = v64;
      swift_unknownObjectRetain();
      sub_10000F55C(v49, (uint64_t)&unk_100022398, (uint64_t)v52);
      swift_release();
      return sub_100010A68(v49);
    }
    else
    {
      static Logger.angel.getter();
      swift_bridgeObjectRetain();
      uint64_t v53 = Logger.logObject.getter();
      os_log_type_t v54 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v53, v54))
      {
        uint64_t v55 = swift_slowAlloc();
        uint64_t v59 = v9;
        uint64_t v56 = (uint8_t *)v55;
        uint64_t v66 = swift_slowAlloc();
        *(_DWORD *)uint64_t v56 = 136446210;
        swift_bridgeObjectRetain();
        uint64_t v65 = sub_10000B648(v41, v28, &v66);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v53, v54, "%{public}s is unknown, ignoring and replying if needed", v56, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v40(v13, v62);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v40(v13, v8);
      }
      return sub_10000E788(v64);
    }
  }
  else
  {
    static Logger.angel.getter();
    id v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Unable to parse XPC event name, event malformed, returning without replying", v38, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v24, v8);
  }
}

uint64_t sub_10000E788(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = xpc_dictionary_get_BOOL(a1, "replyRequired");
  if (result)
  {
    if (xpc_dictionary_create_reply(a1))
    {
      xpc_dictionary_send_reply();
      return swift_unknownObjectRelease();
    }
    else
    {
      static Logger.angel.getter();
      uint64_t v8 = Logger.logObject.getter();
      os_log_type_t v9 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Failed to create reply, a RunningBoardAssertion has probably leaked", v10, 2u);
        swift_slowDealloc();
      }

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
  }
  return result;
}

uint64_t sub_10000E914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[12] = a4;
  v5[13] = a5;
  uint64_t v6 = type metadata accessor for Logger();
  v5[14] = v6;
  v5[15] = *(void *)(v6 - 8);
  v5[16] = swift_task_alloc();
  v5[17] = swift_task_alloc();
  v5[18] = swift_task_alloc();
  return _swift_task_switch(sub_10000E9F0, 0, 0);
}

uint64_t sub_10000E9F0()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  v0[19] = Strong;
  if (Strong)
  {
    static Logger.angel.getter();
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Starting Bootstrap", v4, 2u);
      swift_slowDealloc();
    }
    uint64_t v5 = v0[18];
    uint64_t v6 = v0[14];
    uint64_t v7 = v0[15];

    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v0[20] = v8;
    v0[21] = (v7 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v8(v5, v6);
    v0[22] = type metadata accessor for AngelServer();
    v0[23] = type metadata accessor for MainActor();
    v0[24] = static MainActor.shared.getter();
    uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
    return _swift_task_switch(sub_10000EBBC, v10, v9);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
}

uint64_t sub_10000EBBC()
{
  swift_release();
  *(void *)(v0 + 200) = static AngelServer.sharedInstance.getter();
  return _swift_task_switch(sub_10000EC30, 0, 0);
}

uint64_t sub_10000EC30()
{
  *(void *)(v0 + 208) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000ECBC, v2, v1);
}

uint64_t sub_10000ECBC()
{
  swift_release();
  sub_10000DB7C(v0 + 16);
  return _swift_task_switch(sub_10000ED34, 0, 0);
}

uint64_t sub_10000ED34()
{
  *(void *)(v0 + 216) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000EDC0, v2, v1);
}

uint64_t sub_10000EDC0()
{
  swift_release();
  AngelServer.provideDisplayRegistrarVendorIfNeeded(_:)();
  sub_10000BDB8(v0 + 16);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 224) = v1;
  void *v1 = v0;
  v1[1] = sub_10000EE74;
  return AngelServer.bootstrapSession()();
}

uint64_t sub_10000EE74()
{
  *(void *)(*(void *)v1 + 232) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10000F300;
  }
  else {
    uint64_t v2 = sub_10000EF88;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000EF88()
{
  static Logger.angel.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Bootstrap complete, replying to Rapport", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = (void *)v0[25];
  uint64_t v5 = (void (*)(uint64_t, uint64_t))v0[20];
  uint64_t v6 = (void *)v0[19];
  uint64_t v7 = v0[17];
  uint64_t v9 = (void *)v0[13];
  uint64_t v8 = v0[14];

  v5(v7, v8);
  sub_10000E788(v9);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_10000F0BC()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10000F1B8, 0, 0);
}

uint64_t sub_10000F1B8()
{
  sub_10000E788(*(void **)(v0 + 104));
  swift_errorRelease();
  static Logger.angel.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Bootstrap complete, replying to Rapport", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = *(void **)(v0 + 200);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v0 + 160);
  uint64_t v6 = *(void **)(v0 + 152);
  uint64_t v7 = *(void *)(v0 + 136);
  uint64_t v9 = *(void **)(v0 + 104);
  uint64_t v8 = *(void *)(v0 + 112);

  v5(v7, v8);
  sub_10000E788(v9);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_10000F300()
{
  uint64_t v17 = v0;
  static Logger.angel.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[29];
    uint64_t v15 = (void (*)(uint64_t, uint64_t))v0[20];
    uint64_t v14 = v0[16];
    uint64_t v4 = v0[14];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446210;
    uint64_t v16 = v6;
    v0[10] = v3;
    swift_errorRetain();
    sub_100007DA0(&qword_100021FF0);
    uint64_t v7 = String.init<A>(describing:)();
    v0[11] = sub_10000B648(v7, v8, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Failed to bootstrap session, tearing down session: %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v15(v14, v4);
  }
  else
  {
    uint64_t v9 = (void (*)(uint64_t, uint64_t))v0[20];
    uint64_t v10 = v0[16];
    uint64_t v11 = v0[14];
    swift_errorRelease();
    swift_errorRelease();

    v9(v10, v11);
  }
  uint64_t v12 = (void *)swift_task_alloc();
  v0[30] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_10000F0BC;
  return AngelServer.tearDown()();
}

uint64_t sub_10000F55C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100007DA0(&qword_100022328);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010AC8(a1, (uint64_t)v9);
  uint64_t v10 = type metadata accessor for TaskPriority();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_100010A68((uint64_t)v9);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v14 = v13;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
  uint64_t v14 = 0;
LABEL_6:
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = a3;
  if (v14 | v12)
  {
    v17[0] = 0;
    v17[1] = 0;
    v17[2] = v12;
    v17[3] = v14;
  }
  return swift_task_create();
}

uint64_t sub_10000F740(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

id sub_10000F984(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return [super init];
}

id sub_10000F9C8()
{
  return sub_10000F9E0(type metadata accessor for DragAndDropSceneDelegate);
}

id sub_10000F9E0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for Application()
{
  return self;
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

uint64_t type metadata accessor for DragAndDropSceneDelegate()
{
  return self;
}

uint64_t sub_10000FF7C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.angel.getter();
  v7._countAndFlagsBits = 0xD000000000000062;
  v7._object = (void *)0x8000000100019C40;
  v8._object = (void *)0x8000000100019D20;
  v8._countAndFlagsBits = 0xD00000000000002DLL;
  Logger.debugMarker(_:line:function:message:)(v7, 78, v8, (Swift::String_optional)0);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  uint64_t v9 = type metadata accessor for OnenessFeatureFlags();
  uint64_t v17 = (void *)v9;
  uint64_t v18 = sub_100010CD0(&qword_100022320, (void (*)(uint64_t))&type metadata accessor for OnenessFeatureFlags);
  uint64_t v10 = sub_10001086C(aBlock);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v9 - 8) + 104))(v10, enum case for OnenessFeatureFlags.Shell(_:), v9);
  LOBYTE(v9) = isFeatureEnabled(_:)();
  sub_10000BDB8((uint64_t)aBlock);
  if (v9)
  {
    uint64_t v11 = *(NSObject **)&v1[OBJC_IVAR____TtC21ScreenContinuityShell11AppDelegate_xpcEventQueue];
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v1;
    uint64_t v18 = (uint64_t)sub_100010908;
    uint64_t v19 = v12;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10000F740;
    uint64_t v17 = &unk_10001D3D8;
    uint64_t v13 = _Block_copy(aBlock);
    uint64_t v14 = v1;
    swift_release();
    xpc_set_event_stream_handler("com.apple.rapport.matching", v11, v13);
    _Block_release(v13);
  }
  return 1;
}

id sub_1000101E0(void *a1)
{
  id v2 = [a1 role];
  NSString v3 = String._bridgeToObjectiveC()();
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  if (v4 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v6 == v7)
  {

    swift_bridgeObjectRelease_n();
LABEL_10:
    id v12 = [a1 configuration];
    [v12 copy];

    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_100010C38(0, &qword_100022308);
    if (swift_dynamicCast())
    {
      sub_100010C38(0, (unint64_t *)&unk_100022310);
      [v13 setSceneClass:swift_getObjCClassFromMetadata()];
      type metadata accessor for DragAndDropSceneDelegate();
      [v13 setDelegateClass:swift_getObjCClassFromMetadata()];
      return v13;
    }
    else
    {
      id result = (id)_assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    return result;
  }
  char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9) {
    goto LABEL_10;
  }
  id v10 = [a1 configuration];

  return v10;
}

uint64_t sub_100010428(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = __chkstk_darwin(v4, v6);
  char v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v7, v10);
  uint64_t v13 = (char *)&v37 - v12;
  __chkstk_darwin(v11, v14);
  uint64_t v16 = (char *)&v37 - v15;
  static Logger.dnd.getter();
  v17._countAndFlagsBits = 0xD000000000000062;
  v17._object = (void *)0x8000000100019C40;
  v18._object = (void *)0x8000000100019920;
  v18._countAndFlagsBits = 0xD00000000000001FLL;
  Logger.debugMarker(_:line:function:message:)(v17, 166, v18, (Swift::String_optional)0);
  uint64_t v38 = *(void (**)(char *, uint64_t))(v5 + 8);
  v38(v16, v4);
  id v19 = [a2 role];
  NSString v20 = String._bridgeToObjectiveC()();
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v23 = v22;
  if (v21 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v23 == v24)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v25 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v25 & 1) == 0) {
      return result;
    }
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    id v27 = a1;
    static Logger.dnd.getter();
    unint64_t v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v28, v29))
    {
      os_log_type_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Drag-and-drop shield window scene connected", v30, 2u);
      swift_slowDealloc();
    }

    v38(v13, v4);
    type metadata accessor for AngelServer();
    BOOL v31 = (void *)static AngelServer.sharedInstance.getter();
    AngelServer.dragAndDropShieldWindowSceneContainer.getter();

    dispatch thunk of DragAndDropSceneContainer.populate(with:)();
    return swift_release();
  }
  else
  {
    static Logger.dnd.getter();
    uint64_t v32 = Logger.logObject.getter();
    os_log_type_t v33 = static os_log_type_t.error.getter();
    BOOL v34 = os_log_type_enabled(v32, v33);
    uint64_t v35 = (uint64_t (*)(char *, uint64_t))v38;
    if (v34)
    {
      id v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      *(_DWORD *)id v36 = 136315138;
      uint64_t v39 = sub_10000B648(0x646E615F67617264, 0xED0000706F72645FLL, &v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Scene with role %s not of class UIWindowScene. Drag and drop will not work.", v36, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    return v35(v9, v4);
  }
}

uint64_t *sub_10001086C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1000108D0()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100010908(void *a1)
{
  return sub_10000E004(a1, *(void *)(v1 + 16));
}

uint64_t sub_100010910(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100010920()
{
  return swift_release();
}

uint64_t sub_100010928()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100010960()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000109A8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_10000B3D8;
  return sub_10000E914(a1, v4, v5, v7, v6);
}

uint64_t sub_100010A68(uint64_t a1)
{
  uint64_t v2 = sub_100007DA0(&qword_100022328);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100010AC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007DA0(&qword_100022328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010B30()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100010B68(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000B3D8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100022768 + dword_100022768);
  return v6(a1, v4);
}

uint64_t sub_100010C20(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100010C38(uint64_t a1, unint64_t *a2)
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

unint64_t sub_100010C74()
{
  unint64_t result = qword_1000223D0;
  if (!qword_1000223D0)
  {
    sub_100007DE4(&qword_1000223C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000223D0);
  }
  return result;
}

uint64_t sub_100010CD0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t initializeBufferWithCopyOfBuffer for LockscreenActivityView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for LockscreenActivityView()
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for LockscreenActivityView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for LockscreenActivityView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for LockscreenActivityView(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for LockscreenActivityView(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for LockscreenActivityView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LockscreenActivityView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LockscreenActivityView()
{
  return &type metadata for LockscreenActivityView;
}

uint64_t sub_100010F24()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100010F40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v5 = a2;
  uint64_t v42 = a1;
  uint64_t v43 = a2;
  uint64_t v47 = a3;
  uint64_t v44 = sub_100007DA0(&qword_100021DC8) - 8;
  __chkstk_darwin(v44, v9);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = type metadata accessor for Material();
  uint64_t v38 = *(void *)(v40 - 8);
  __chkstk_darwin(v40, v12);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100007DA0(&qword_1000223E0);
  uint64_t v16 = v15 - 8;
  __chkstk_darwin(v15, v17);
  id v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_100007DA0(&qword_1000223E8);
  __chkstk_darwin(v41, v20);
  uint64_t v22 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100007DA0(&qword_1000223F0);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v45 = v23;
  uint64_t v46 = v24;
  __chkstk_darwin(v23, v25);
  uint64_t v39 = (char *)&v37 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = static VerticalAlignment.center.getter();
  sub_100011564(a1, v5, (uint64_t)v72);
  *(_OWORD *)&v74[183] = v72[11];
  *(_OWORD *)&v74[199] = v72[12];
  *(_OWORD *)&v74[215] = v72[13];
  *(_OWORD *)&v74[119] = v72[7];
  *(_OWORD *)&v74[135] = v72[8];
  *(_OWORD *)&v74[151] = v72[9];
  *(_OWORD *)&v74[167] = v72[10];
  *(_OWORD *)&v74[55] = v72[3];
  *(_OWORD *)&v74[71] = v72[4];
  *(_OWORD *)&v74[87] = v72[5];
  *(_OWORD *)&v74[103] = v72[6];
  *(_OWORD *)&v74[7] = v72[0];
  *(_OWORD *)&v74[23] = v72[1];
  char v75 = 1;
  v74[231] = v73;
  *(_OWORD *)&v74[39] = v72[2];
  char v27 = static Edge.Set.all.getter();
  long long v63 = *(_OWORD *)&v74[176];
  long long v64 = *(_OWORD *)&v74[192];
  long long v65 = *(_OWORD *)&v74[208];
  long long v59 = *(_OWORD *)&v74[112];
  long long v60 = *(_OWORD *)&v74[128];
  long long v61 = *(_OWORD *)&v74[144];
  long long v62 = *(_OWORD *)&v74[160];
  long long v55 = *(_OWORD *)&v74[48];
  long long v56 = *(_OWORD *)&v74[64];
  long long v57 = *(_OWORD *)&v74[80];
  long long v58 = *(_OWORD *)&v74[96];
  long long v52 = *(_OWORD *)v74;
  long long v53 = *(_OWORD *)&v74[16];
  char v76 = 1;
  uint64_t v49 = v37;
  uint64_t v50 = 0;
  char v51 = 1;
  uint64_t v66 = *(void *)&v74[224];
  long long v54 = *(_OWORD *)&v74[32];
  __int16 v67 = 256;
  char v68 = v27;
  long long v69 = 0u;
  long long v70 = 0u;
  char v71 = 1;
  static Alignment.center.getter();
  sub_1000076B8(0.0, 1, 0.0, 1, a4, 0, 0.0, 1, v48, 0.0, 1, INFINITY, 0);
  sub_100011E94((uint64_t)v72);
  memcpy(v77, v48, 0x1A0uLL);
  static Material.thin.getter();
  LOBYTE(v5) = static Edge.Set.all.getter();
  uint64_t v28 = v38;
  uint64_t v29 = v40;
  (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v11, v14, v40);
  v11[*(int *)(v44 + 44)] = v5;
  sub_100008194((uint64_t)v11, (uint64_t)&v19[*(int *)(v16 + 44)], &qword_100021DC8);
  memcpy(v19, v77, 0x1A0uLL);
  sub_100008254((uint64_t)v77);
  sub_1000081F8((uint64_t)v11, &qword_100021DC8);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v29);
  sub_100011F70((uint64_t)v77);
  sub_100008194((uint64_t)v19, (uint64_t)v22, &qword_1000223E0);
  uint64_t v30 = v41;
  BOOL v31 = (uint64_t (**)())&v22[*(int *)(v41 + 36)];
  *BOOL v31 = sub_100011E10;
  v31[1] = 0;
  sub_1000081F8((uint64_t)v19, &qword_1000223E0);
  uint64_t v32 = sub_100012118(&qword_1000223F8, &qword_1000223E8, (void (*)(void))sub_10001204C);
  os_log_type_t v33 = v39;
  View.allowsSecureDrawing()();
  sub_1000081F8((uint64_t)v22, &qword_1000223E8);
  uint64_t v34 = swift_allocObject();
  *(double *)(v34 + 16) = a4;
  *(double *)(v34 + 24) = a5;
  *(void *)(v34 + 32) = v42;
  *(void *)(v34 + 40) = v43;
  swift_retain();
  swift_retain();
  *(void *)&v48[0] = v30;
  *((void *)&v48[0] + 1) = v32;
  swift_getOpaqueTypeConformance2();
  uint64_t v35 = v45;
  View.onTapGesture(count:perform:)();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v33, v35);
}

uint64_t sub_100011564@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100007DA0(&qword_100021D40);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100007DA0(&qword_100021D48);
  __chkstk_darwin(v10 - 8, v11);
  uint64_t v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = a1;
  uint64_t v89 = a2;
  sub_100007DA0(&qword_100021D50);
  State.wrappedValue.getter();
  swift_bridgeObjectRetain();
  swift_release();
  Image.init(_internalSystemName:)();
  static SymbolRenderingMode.monochrome.getter();
  uint64_t v14 = type metadata accessor for SymbolRenderingMode();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
  uint64_t v62 = Image.symbolRenderingMode(_:)();
  swift_release();
  sub_1000081F8((uint64_t)v13, &qword_100021D48);
  uint64_t v15 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 1, 1, v15);
  uint64_t v16 = static Font.system(size:weight:design:)();
  sub_1000081F8((uint64_t)v9, &qword_100021D40);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v61 = static HorizontalAlignment.leading.getter();
  sub_100011A70((uint64_t)&v88);
  uint64_t v59 = v89;
  uint64_t v60 = v88;
  char v18 = v90;
  uint64_t v57 = v93;
  uint64_t v58 = v92;
  LOBYTE(v9) = v94;
  uint64_t v55 = v97;
  uint64_t v56 = v96;
  uint64_t v53 = v101;
  uint64_t v54 = v100;
  LOBYTE(a1) = v102;
  uint64_t v51 = v105;
  uint64_t v52 = v104;
  LOBYTE(v13) = v106;
  char v71 = 1;
  char v69 = v90;
  char v66 = v98;
  char v63 = v106;
  char v19 = v98;
  LOBYTE(a2) = static Edge.Set.leading.getter();
  EdgeInsets.init(_all:)();
  *(_DWORD *)v111 = *(_DWORD *)v74;
  *(_DWORD *)&v111[3] = *(_DWORD *)&v74[3];
  *(_DWORD *)v113 = *(_DWORD *)v73;
  *(_DWORD *)&v113[3] = *(_DWORD *)&v73[3];
  DWORD1(v76) = *(_DWORD *)&v70[3];
  int v20 = *(_DWORD *)v70;
  *(_DWORD *)((char *)&v76 + 1) = *(_DWORD *)v70;
  HIDWORD(v77) = *(_DWORD *)&v68[3];
  int v21 = *(_DWORD *)v68;
  *(_DWORD *)((char *)&v77 + 9) = *(_DWORD *)v68;
  DWORD1(v79) = *(_DWORD *)&v67[3];
  int v22 = *(_DWORD *)v67;
  *(_DWORD *)((char *)&v79 + 1) = *(_DWORD *)v67;
  HIDWORD(v80) = *(_DWORD *)&v65[3];
  int v23 = *(_DWORD *)v65;
  *(_DWORD *)((char *)&v80 + 9) = *(_DWORD *)v65;
  DWORD1(v82) = *(_DWORD *)&v64[3];
  int v24 = *(_DWORD *)v64;
  *(_DWORD *)((char *)&v82 + 1) = *(_DWORD *)v64;
  HIDWORD(v83) = *(_DWORD *)&v74[3];
  *(_DWORD *)((char *)&v83 + 9) = *(_DWORD *)v74;
  DWORD1(v84) = *(_DWORD *)&v73[3];
  *(_DWORD *)((char *)&v84 + 1) = *(_DWORD *)v73;
  *(_DWORD *)(a3 + 209) = *(_DWORD *)v87;
  uint64_t v26 = v60;
  uint64_t v25 = v61;
  long long v75 = (unint64_t)v61;
  LOBYTE(v76) = 1;
  uint64_t v28 = v58;
  uint64_t v27 = v59;
  *((void *)&v76 + 1) = v60;
  *(void *)&long long v77 = v59;
  BYTE8(v77) = v18;
  uint64_t v29 = v56;
  uint64_t v30 = v57;
  *(void *)&long long v78 = v58;
  *((void *)&v78 + 1) = v57;
  LOBYTE(v79) = (_BYTE)v9;
  uint64_t v31 = v54;
  uint64_t v32 = v55;
  *((void *)&v79 + 1) = v56;
  *(void *)&long long v80 = v55;
  BYTE8(v80) = v19;
  uint64_t v33 = v52;
  uint64_t v34 = v53;
  *(void *)&long long v81 = v54;
  *((void *)&v81 + 1) = v53;
  LOBYTE(v82) = a1;
  uint64_t v35 = v51;
  *((void *)&v82 + 1) = v52;
  *(void *)&long long v83 = v51;
  BYTE8(v83) = (_BYTE)v13;
  LOBYTE(v84) = a2;
  *((void *)&v84 + 1) = v36;
  *(void *)&v85[0] = v37;
  *((void *)&v85[0] + 1) = v38;
  *(void *)&v85[1] = v39;
  BYTE8(v85[1]) = 0;
  long long v40 = *(_OWORD *)((char *)v85 + 9);
  *(_DWORD *)(a3 + 212) = *(_DWORD *)&v87[3];
  long long v41 = v77;
  *(_OWORD *)(a3 + 72) = v78;
  long long v42 = v75;
  long long v43 = v76;
  *(_OWORD *)(a3 + 56) = v41;
  *(_OWORD *)(a3 + 40) = v43;
  *(_OWORD *)(a3 + 24) = v42;
  long long v44 = v81;
  *(_OWORD *)(a3 + 136) = v82;
  long long v45 = v79;
  long long v46 = v80;
  *(_OWORD *)(a3 + 120) = v44;
  *(_OWORD *)(a3 + 104) = v46;
  *(_OWORD *)(a3 + 88) = v45;
  long long v47 = v83;
  long long v48 = v84;
  long long v49 = v85[0];
  *(_OWORD *)(a3 + 193) = v40;
  *(_OWORD *)(a3 + 184) = v49;
  *(_OWORD *)(a3 + 168) = v48;
  *(_OWORD *)(a3 + 152) = v47;
  *(void *)a3 = v62;
  *(void *)(a3 + 8) = KeyPath;
  *(void *)(a3 + 16) = v16;
  *(void *)(a3 + 216) = 0;
  *(unsigned char *)(a3 + 224) = 1;
  char v72 = 0;
  char v86 = 1;
  uint64_t v88 = v25;
  uint64_t v89 = 0;
  char v90 = 1;
  *(_DWORD *)id v91 = v20;
  *(_DWORD *)&v91[3] = *(_DWORD *)&v70[3];
  uint64_t v92 = v26;
  uint64_t v93 = v27;
  char v94 = v18;
  *(_DWORD *)uint64_t v95 = v21;
  *(_DWORD *)&v95[3] = *(_DWORD *)&v68[3];
  uint64_t v96 = v28;
  uint64_t v97 = v30;
  char v98 = (char)v9;
  *(_DWORD *)uint64_t v99 = v22;
  *(_DWORD *)&v99[3] = *(_DWORD *)&v67[3];
  uint64_t v100 = v29;
  uint64_t v101 = v32;
  char v102 = v19;
  *(_DWORD *)&v103[3] = *(_DWORD *)&v65[3];
  *(_DWORD *)v103 = v23;
  uint64_t v104 = v31;
  uint64_t v105 = v34;
  char v106 = a1;
  *(_DWORD *)&v107[3] = *(_DWORD *)&v64[3];
  *(_DWORD *)v107 = v24;
  uint64_t v108 = v33;
  uint64_t v109 = v35;
  char v110 = (char)v13;
  char v112 = a2;
  uint64_t v114 = v36;
  uint64_t v115 = v37;
  uint64_t v116 = v38;
  uint64_t v117 = v39;
  char v118 = 0;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000122B8((uint64_t)&v75);
  sub_100012358((uint64_t)&v88);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_100011A70@<X0>(uint64_t a1@<X8>)
{
  sub_100007DA0(&qword_100021D50);
  State.wrappedValue.getter();
  swift_bridgeObjectRetain();
  swift_release();
  sub_100007EDC();
  uint64_t v2 = Text.init<A>(_:)();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  static Font.Weight.semibold.getter();
  uint64_t v7 = Text.fontWeight(_:)();
  uint64_t v9 = v8;
  char v11 = v10 & 1;
  sub_100007F30(v2, v4, v6);
  swift_bridgeObjectRelease();
  static Font.subheadline.getter();
  uint64_t v12 = Text.font(_:)();
  uint64_t v14 = v13;
  char v16 = v15;
  swift_release();
  sub_100007F30(v7, v9, v11);
  swift_bridgeObjectRelease();
  static HierarchicalShapeStyle.primary.getter();
  uint64_t v17 = Text.foregroundStyle<A>(_:)();
  uint64_t v44 = v18;
  uint64_t v45 = v17;
  uint64_t v46 = v19;
  char v43 = v20 & 1;
  sub_100007F30(v12, v14, v16 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  State.wrappedValue.getter();
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v21 = Text.init<A>(_:)();
  uint64_t v23 = v22;
  char v25 = v24 & 1;
  static Font.subheadline.getter();
  uint64_t v26 = Text.font(_:)();
  uint64_t v28 = v27;
  char v30 = v29;
  swift_release();
  char v31 = v30 & 1;
  sub_100007F30(v21, v23, v25);
  swift_bridgeObjectRelease();
  static HierarchicalShapeStyle.primary.getter();
  uint64_t v32 = Text.foregroundStyle<A>(_:)();
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  char v38 = v37 & 1;
  sub_100007F30(v26, v28, v31);
  swift_bridgeObjectRelease();
  uint64_t v39 = swift_getKeyPath();
  uint64_t v40 = swift_getKeyPath();
  *(void *)a1 = v45;
  *(void *)(a1 + 8) = v44;
  *(unsigned char *)(a1 + 16) = v43;
  *(void *)(a1 + 24) = v46;
  *(void *)(a1 + 32) = KeyPath;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = v32;
  *(void *)(a1 + 56) = v34;
  *(unsigned char *)(a1 + 64) = v38;
  *(void *)(a1 + 72) = v36;
  *(void *)(a1 + 80) = v39;
  *(unsigned char *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = v40;
  *(void *)(a1 + 104) = 2;
  *(unsigned char *)(a1 + 112) = 0;
  sub_100008184(v45, v44, v43);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100008184(v32, v34, v38);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_100007F30(v32, v34, v38);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_100007F30(v45, v44, v43);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100011E10()
{
  return Transaction.animation.setter();
}

uint64_t sub_100011E38()
{
  return swift_release();
}

uint64_t sub_100011E88@<X0>(uint64_t a1@<X8>)
{
  return sub_100010F40(*(void *)(v1 + 16), *(void *)(v1 + 24), a1, *(double *)v1, *(double *)(v1 + 8));
}

uint64_t sub_100011E94(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  char v4 = *(unsigned char *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 96);
  uint64_t v6 = *(void *)(a1 + 104);
  char v8 = *(unsigned char *)(a1 + 112);
  swift_release();
  swift_release();
  swift_release();
  sub_100007F30(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  sub_100007F30(v5, v6, v8);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100011F70(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 80);
  char v4 = *(unsigned char *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 120);
  uint64_t v6 = *(void *)(a1 + 128);
  char v8 = *(unsigned char *)(a1 + 136);
  swift_release();
  swift_release();
  swift_release();
  sub_100007F30(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  sub_100007F30(v5, v6, v8);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_10001204C()
{
  unint64_t result = qword_100022400;
  if (!qword_100022400)
  {
    sub_100007DE4(&qword_1000223E0);
    sub_100012118(&qword_100022408, &qword_100022410, (void (*)(void))sub_100012194);
    sub_100008648(&qword_100021DF0, &qword_100021DC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022400);
  }
  return result;
}

uint64_t sub_100012118(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007DE4(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100012194()
{
  return sub_100012118(&qword_100022418, &qword_100022420, (void (*)(void))sub_1000121C4);
}

unint64_t sub_1000121C4()
{
  unint64_t result = qword_100022428;
  if (!qword_100022428)
  {
    sub_100007DE4(&qword_100022430);
    sub_100008648(&qword_100022438, (uint64_t *)&unk_100022440);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022428);
  }
  return result;
}

uint64_t sub_100012264()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000122A4()
{
  return sub_100011E38();
}

uint64_t sub_1000122B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 80);
  char v4 = *(unsigned char *)(a1 + 88);
  sub_100008184(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100008184(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_100012358(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 80);
  char v4 = *(unsigned char *)(a1 + 88);
  sub_100007F30(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_release();
  swift_bridgeObjectRelease();
  sub_100007F30(v2, v3, v4);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000123F8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100012424()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_10001244C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = EnvironmentValues.lineLimit.getter();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100012480()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_1000124B0()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_1000125A4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShellSceneKitBackedConnectedDisplayRegistry();
  return [super dealloc];
}

uint64_t type metadata accessor for ShellSceneKitBackedConnectedDisplayRegistry()
{
  return self;
}

uint64_t sub_100012648()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void **)(v1
                + OBJC_IVAR____TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry_displayProfile);
  [v7 setDelegate:v1];
  [*(id *)(v1 + OBJC_IVAR____TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry_profileRegsitry) registerDisplayProfile:v7];
  static Logger.angel.getter();
  char v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    char v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Registered displayProfile with displayProfileRegistry", v10, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_1000127BC()
{
  return sub_100012648();
}

id sub_1000127E0()
{
  return [*(id *)(*v0+ OBJC_IVAR____TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry_profileRegsitry) activate];
}

id sub_1000127FC(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = __chkstk_darwin(v4, v6);
  os_log_type_t v9 = &v44[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = __chkstk_darwin(v7, v10);
  uint64_t v13 = &v44[-v12];
  __chkstk_darwin(v11, v14);
  char v16 = &v44[-v15];
  static Logger.angel.getter();
  v17._countAndFlagsBits = 0xD000000000000094;
  v17._object = (void *)0x8000000100019E40;
  v18._object = (void *)0x8000000100019EE0;
  v18._countAndFlagsBits = 0xD000000000000029;
  Logger.debugMarker(_:line:function:message:)(v17, 54, v18, (Swift::String_optional)0);
  uint64_t v21 = *(void (**)(void, void))(v5 + 8);
  uint64_t v19 = v5 + 8;
  char v20 = v21;
  v21(v16, v4);
  static Logger.angel.getter();
  id v22 = a2;
  uint64_t v23 = Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.debug.getter();
  int v25 = v24;
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v26 = swift_slowAlloc();
    long long v49 = v9;
    uint64_t v27 = v26;
    uint64_t v46 = swift_slowAlloc();
    uint64_t v53 = v46;
    *(_DWORD *)uint64_t v27 = 136315394;
    uint64_t v50 = v19;
    id v28 = v22;
    id v47 = v22;
    id v29 = v28;
    id v30 = [v28 description];
    uint64_t v51 = v4;
    id v31 = v30;
    uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v48 = a1;
    uint64_t v33 = v32;
    int v45 = v25;
    uint64_t v34 = v20;
    unint64_t v36 = v35;

    uint64_t v52 = sub_10000B648(v33, v36, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    char v20 = v34;
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 1024;
    id v37 = [v29 identity];
    LODWORD(v31) = [v37 isContinuityDisplay];

    LODWORD(v52) = v31;
    uint64_t v4 = v51;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    id v22 = v47;
    _os_log_impl((void *)&_mh_execute_header, v23, (os_log_type_t)v45, "rootDisplayConfiguration: %s, isContinuityDisplay: %{BOOL}d", (uint8_t *)v27, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    os_log_type_t v9 = v49;
    swift_slowDealloc();
  }
  else
  {
  }
  v20(v13, v4);
  sub_100012CBC();
  if (static NSObject.== infix(_:_:)())
  {
    id v38 = [v22 identity];
    id v39 = [v38 isContinuityDisplay];
  }
  else
  {
    static Logger.angel.getter();
    uint64_t v40 = Logger.logObject.getter();
    os_log_type_t v41 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v40, v41))
    {
      long long v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "Display profile did not match, returning false", v42, 2u);
      swift_slowDealloc();
    }

    v20(v9, v4);
    return 0;
  }
  return v39;
}

unint64_t sub_100012CBC()
{
  unint64_t result = qword_1000224E8;
  if (!qword_1000224E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000224E8);
  }
  return result;
}

id sub_100012E74()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivitySecureWindow();
  return [super dealloc];
}

uint64_t type metadata accessor for ActivitySecureWindow()
{
  return self;
}

uint64_t sub_100012ECC()
{
  return swift_initClassMetadata2();
}

double sub_100012F14(void *a1)
{
  id v1 = a1;
  sub_100012F58();
  double v3 = v2;

  return v3;
}

id sub_100012F58()
{
  return [*(id *)(v0 + qword_100022518) preferredContentSize];
}

void sub_100012F70(void *a1)
{
  id v1 = a1;
  sub_100012FD0();
}

id sub_100012FD0()
{
  return [*(id *)(v0 + qword_100022518) setPreferredContentSize:];
}

void sub_100012FE8()
{
}

uint64_t sub_100013040(uint64_t a1)
{
  id v3 = v1;
  return a1;
}

uint64_t sub_100013058()
{
  return 1;
}

uint64_t sub_100013060()
{
  return 1;
}

void sub_100013068(char a1)
{
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for LiveActivityHostingController();
  [super viewIsAppearing:a1 & 1];
  sub_1000131A4();
}

void sub_1000130F0(void *a1, uint64_t a2, char a3)
{
  id v4 = a1;
  sub_100013068(a3);
}

void sub_100013144(void *a1)
{
  swift_unknownObjectRetain();
  id v2 = a1;
  sub_100013454();
  swift_unknownObjectRelease();
}

void sub_1000131A4()
{
  id v1 = [v0 view];
  if (v1)
  {
    id v2 = v1;
    id v7 = [v1 window];

    if (v7)
    {
      id v3 = [v7 windowScene];
      if (v3)
      {
        id v4 = v3;
        type metadata accessor for ActivityScene();
        if (swift_dynamicCastClass())
        {
          [v0 preferredContentSize];
          [v0 preferredContentSize];
          id v5 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics());
          ActivitySceneMetrics.init(size:cornerRadius:)();
          dispatch thunk of ActivityScene.resolvedMetrics.setter();
          uint64_t v6 = v7;
          id v7 = v4;
        }
        else
        {
          uint64_t v6 = v4;
        }
      }
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_1000132E8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = a4;

  sub_100013458();
}

id sub_10001335C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LiveActivityHostingController();
  return [super dealloc];
}

void sub_1000133D0(uint64_t a1)
{
}

uint64_t type metadata accessor for LiveActivityHostingController()
{
  return sub_100005E58();
}

void sub_1000133F8()
{
}

void sub_100013458()
{
}

void sub_100013488(void *a1@<X8>)
{
  objc_super v2 = (void *)static ContinuityDisplayProfile.profile.getter();
  type metadata accessor for DefaultDisplayTransformer();
  id v3 = [objc_allocWithZone((Class)SSKDisplayProfileRegistry) initWithDisplayTransformerRegistry:static DefaultDisplayTransformer.defaultRegistry.getter()];
  id v4 = (objc_class *)type metadata accessor for ShellSceneKitBackedConnectedDisplayRegistry();
  id v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry_displayProfile] = v2;
  *(void *)&v5[OBJC_IVAR____TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry_profileRegsitry] = v3;
  v9.receiver = v5;
  v9.super_class = v4;
  id v6 = v2;
  id v7 = v3;
  [super init];
  a1[3] = v4;
  a1[4] = sub_1000135AC();

  swift_unknownObjectRelease();
  *a1 = v8;
}

uint64_t type metadata accessor for ShellSceneKitBackedConnectedDisplayRegistryVendor()
{
  return self;
}

void sub_100013594(void *a1@<X8>)
{
}

unint64_t sub_1000135AC()
{
  unint64_t result = qword_100022640;
  if (!qword_100022640)
  {
    type metadata accessor for ShellSceneKitBackedConnectedDisplayRegistry();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022640);
  }
  return result;
}

uint64_t sub_100013604()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100007DA0(&qword_100022328);
  __chkstk_darwin(v2 - 8, v3);
  id v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.angel.getter();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Tear down remote session from live activity button", v13, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v5, 1, 1, v14);
  type metadata accessor for MainActor();
  swift_retain();
  uint64_t v15 = static MainActor.shared.getter();
  char v16 = (void *)swift_allocObject();
  v16[2] = v15;
  v16[3] = &protocol witness table for MainActor;
  v16[4] = v1;
  sub_100013AFC((uint64_t)v5, (uint64_t)&unk_100022760, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_100013830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  type metadata accessor for MainActor();
  v4[3] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[4] = v6;
  v4[5] = v5;
  return _swift_task_switch(sub_1000138C8, v6, v5);
}

uint64_t sub_1000138C8()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 104);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10001397C;
  return dispatch thunk of LiveActivityDelegate.tearDownFromLiveActivity()(ObjectType, v1);
}

uint64_t sub_10001397C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v3 = *(void *)(v1 + 32);
  return _swift_task_switch(sub_100013A9C, v3, v2);
}

uint64_t sub_100013A9C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100013AFC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_100010A68(a1);
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

uint64_t sub_100013CA0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.angel.getter();
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Unlock and open settings URL from live activty", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  if (qword_100021BB8 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for URL();
  sub_10000DA8C(v10, (uint64_t)qword_100022790);
  sub_10000BE08((void *)(v1 + 112), *(void *)(v1 + 136));
  return dispatch thunk of ApplicationLaunchPrimitives.openApplication(at:)();
}

uint64_t sub_100013E50()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_10000BDB8(v0 + 112);
  uint64_t v1 = v0 + OBJC_IVAR____TtC21ScreenContinuityShell21LiveActivityViewModel___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_100013EEC()
{
  sub_100013E50();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_100013F44()
{
  return type metadata accessor for LiveActivityViewModel();
}

uint64_t type metadata accessor for LiveActivityViewModel()
{
  uint64_t result = qword_100022678;
  if (!qword_100022678) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100013F98()
{
  uint64_t result = type metadata accessor for ObservationRegistrar();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100014050()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100014090(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_10000B3D8;
  return sub_100013830(a1, v4, v5, v6);
}

uint64_t sub_100014144(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100014220;
  return v6(a1);
}

uint64_t sub_100014220()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100014318()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t static Activity.activities.getter()
{
  return static Activity.activities.getter();
}

uint64_t dispatch thunk of Activity.activityState.getter()
{
  return dispatch thunk of Activity.activityState.getter();
}

uint64_t Activity.id.getter()
{
  return Activity.id.getter();
}

uint64_t dispatch thunk of Activity.content.getter()
{
  return dispatch thunk of Activity.content.getter();
}

uint64_t static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)()
{
  return static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)();
}

uint64_t static ActivityUIDismissalPolicy.immediate.getter()
{
  return static ActivityUIDismissalPolicy.immediate.getter();
}

uint64_t type metadata accessor for ActivityUIDismissalPolicy()
{
  return type metadata accessor for ActivityUIDismissalPolicy();
}

uint64_t type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination()
{
  return type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination();
}

uint64_t ActivityPresentationOptions.init(destinations:)()
{
  return ActivityPresentationOptions.init(destinations:)();
}

uint64_t ActivityPresentationOptions.isUserDismissalAllowedOnLockScreen.setter()
{
  return ActivityPresentationOptions.isUserDismissalAllowedOnLockScreen.setter();
}

uint64_t type metadata accessor for ActivityPresentationOptions()
{
  return type metadata accessor for ActivityPresentationOptions();
}

uint64_t static ActivityState.== infix(_:_:)()
{
  return static ActivityState.== infix(_:_:)();
}

uint64_t type metadata accessor for ActivityState()
{
  return type metadata accessor for ActivityState();
}

uint64_t ActivityContent.init(state:staleDate:relevanceScore:)()
{
  return ActivityContent.init(state:staleDate:relevanceScore:)();
}

uint64_t ObservationRegistrar.init()()
{
  return ObservationRegistrar.init()();
}

uint64_t type metadata accessor for ObservationRegistrar()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t static DefaultDisplayTransformer.defaultRegistry.getter()
{
  return static DefaultDisplayTransformer.defaultRegistry.getter();
}

uint64_t type metadata accessor for DefaultDisplayTransformer()
{
  return type metadata accessor for DefaultDisplayTransformer();
}

uint64_t static AngelServer.sharedInstance.getter()
{
  return static AngelServer.sharedInstance.getter();
}

uint64_t AngelServer.liveActivityDelegate.getter()
{
  return AngelServer.liveActivityDelegate.getter();
}

uint64_t AngelServer.provideLiveActivityVendor(_:)()
{
  return AngelServer.provideLiveActivityVendor(_:)();
}

uint64_t AngelServer.dragAndDropShieldWindowSceneContainer.getter()
{
  return AngelServer.dragAndDropShieldWindowSceneContainer.getter();
}

uint64_t AngelServer.provideDisplayRegistrarVendorIfNeeded(_:)()
{
  return AngelServer.provideDisplayRegistrarVendorIfNeeded(_:)();
}

Swift::Void __swiftcall AngelServer.startUp()()
{
}

uint64_t type metadata accessor for AngelServer()
{
  return type metadata accessor for AngelServer();
}

uint64_t type metadata accessor for OnenessFeatureFlags()
{
  return type metadata accessor for OnenessFeatureFlags();
}

uint64_t dispatch thunk of LiveActivityDelegate.clientName.getter()
{
  return dispatch thunk of LiveActivityDelegate.clientName.getter();
}

uint64_t dispatch thunk of DragAndDropSceneContainer.populate(with:)()
{
  return dispatch thunk of DragAndDropSceneContainer.populate(with:)();
}

uint64_t dispatch thunk of ApplicationLaunchPrimitives.openApplication(at:)()
{
  return dispatch thunk of ApplicationLaunchPrimitives.openApplication(at:)();
}

uint64_t static RunningBoardServiceSpecification.serviceDomain.getter()
{
  return static RunningBoardServiceSpecification.serviceDomain.getter();
}

uint64_t LSAppWorkspaceBackedApplicationLaunchPrimitives.init()()
{
  return LSAppWorkspaceBackedApplicationLaunchPrimitives.init()();
}

uint64_t type metadata accessor for LSAppWorkspaceBackedApplicationLaunchPrimitives()
{
  return type metadata accessor for LSAppWorkspaceBackedApplicationLaunchPrimitives();
}

uint64_t ActivitySceneMetrics.init(size:cornerRadius:)()
{
  return ActivitySceneMetrics.init(size:cornerRadius:)();
}

uint64_t type metadata accessor for ActivitySceneMetrics()
{
  return type metadata accessor for ActivitySceneMetrics();
}

uint64_t dispatch thunk of ActivityScene.resolvedMetrics.setter()
{
  return dispatch thunk of ActivityScene.resolvedMetrics.setter();
}

uint64_t dispatch thunk of ActivityScene.backgroundTintColor.setter()
{
  return dispatch thunk of ActivityScene.backgroundTintColor.setter();
}

uint64_t type metadata accessor for ActivityScene()
{
  return type metadata accessor for ActivityScene();
}

uint64_t static ContinuityDisplayProfile.profile.getter()
{
  return static ContinuityDisplayProfile.profile.getter();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

Swift::Void __swiftcall Logger.debugMarker(_:line:function:message:)(Swift::String _, Swift::Int line, Swift::String function, Swift::String_optional message)
{
}

uint64_t static Logger.dnd.getter()
{
  return static Logger.dnd.getter();
}

uint64_t static Logger.angel.getter()
{
  return static Logger.angel.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t XPC_EVENT_KEY_NAME.getter()
{
  return XPC_EVENT_KEY_NAME.getter();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t Transaction.animation.setter()
{
  return Transaction.animation.setter();
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

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
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

uint64_t EnvironmentValues.lineLimit.getter()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t EnvironmentValues.lineLimit.setter()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t static SymbolRenderingMode.monochrome.getter()
{
  return static SymbolRenderingMode.monochrome.getter();
}

uint64_t type metadata accessor for SymbolRenderingMode()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t dispatch thunk of UIHostingController.sizingOptions.setter()
{
  return dispatch thunk of UIHostingController.sizingOptions.setter();
}

uint64_t UIHostingController.init(coder:rootView:)()
{
  return UIHostingController.init(coder:rootView:)();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t static HierarchicalShapeStyle.primary.getter()
{
  return static HierarchicalShapeStyle.primary.getter();
}

uint64_t static HierarchicalShapeStyle.tertiary.getter()
{
  return static HierarchicalShapeStyle.tertiary.getter();
}

uint64_t static HierarchicalShapeStyle.secondary.getter()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t static UIHostingControllerSizingOptions.preferredContentSize.getter()
{
  return static UIHostingControllerSizingOptions.preferredContentSize.getter();
}

uint64_t type metadata accessor for UIHostingControllerSizingOptions()
{
  return type metadata accessor for UIHostingControllerSizingOptions();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
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

uint64_t static Edge.Set.trailing.getter()
{
  return static Edge.Set.trailing.getter();
}

uint64_t static Font.subheadline.getter()
{
  return static Font.subheadline.getter();
}

uint64_t static Font.title.getter()
{
  return static Font.title.getter();
}

uint64_t type metadata accessor for Font.Design()
{
  return type metadata accessor for Font.Design();
}

uint64_t static Font.Weight.semibold.getter()
{
  return static Font.Weight.semibold.getter();
}

uint64_t static Font.system(size:weight:design:)()
{
  return static Font.system(size:weight:design:)();
}

uint64_t Text.fontWeight(_:)()
{
  return Text.fontWeight(_:)();
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

uint64_t View.onTapGesture(count:perform:)()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.allowsSecureDrawing()()
{
  return View.allowsSecureDrawing()();
}

uint64_t Color.init(_:)()
{
  return Color.init(_:)();
}

uint64_t Image.init(_internalSystemName:)()
{
  return Image.init(_internalSystemName:)();
}

uint64_t Image.symbolRenderingMode(_:)()
{
  return Image.symbolRenderingMode(_:)();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t static Material.thin.getter()
{
  return static Material.thin.getter();
}

uint64_t type metadata accessor for Material()
{
  return type metadata accessor for Material();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String.localizedStringWithFormat(_:_:)()
{
  return static String.localizedStringWithFormat(_:_:)();
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

uint64_t String.init(localized:table:bundle:locale:comment:)()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
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

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static UISceneSessionRole.activityAmbient.getter()
{
  return static UISceneSessionRole.activityAmbient.getter();
}

uint64_t static UISceneSessionRole.activityListItem.getter()
{
  return static UISceneSessionRole.activityListItem.getter();
}

uint64_t static UISceneSessionRole.activityAmbientCompact.getter()
{
  return static UISceneSessionRole.activityAmbientCompact.getter();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
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

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
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

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
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

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return _xpc_dictionary_send_reply();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}