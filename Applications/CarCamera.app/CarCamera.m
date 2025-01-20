__n128 initializeWithTake for ButtonBarExpandableViewV(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000040D4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000040F4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)result = (a2 - 1);
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

unsigned char *initializeBufferWithCopyOfBuffer for LayoutConfig(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_100004144(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100004150(unsigned char *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LayoutConfig()
{
  return &type metadata for LayoutConfig;
}

unint64_t sub_100004170()
{
  unint64_t result = qword_10003EAF8;
  if (!qword_10003EAF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003EAF8);
  }
  return result;
}

BOOL sub_1000041C4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_1000041DC()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100004224()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100004250()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100004294(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_10000429C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_100004170();

  return static EnvironmentKey<>._valuesEqual(_:_:)(a1, a2, a3, a4, v8);
}

uint64_t sub_100004300()
{
  sub_10000433C();
  EnvironmentValues.subscript.getter();
  return v1;
}

unint64_t sub_10000433C()
{
  unint64_t result = qword_10003EB00;
  if (!qword_10003EB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003EB00);
  }
  return result;
}

uint64_t sub_100004390@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v56 = a1;
  uint64_t v58 = a3;
  uint64_t v57 = sub_100005214(&qword_10003EB30);
  ((void (*)(void))__chkstk_darwin)();
  v5 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005214(&qword_10003EB38);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v9 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v55 - v10;
  uint64_t v12 = sub_100005214(&qword_10003EB40);
  uint64_t v13 = __chkstk_darwin(v12);
  v15 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  v18 = (char *)&v55 - v17;
  uint64_t v19 = __chkstk_darwin(v16);
  v21 = (char *)&v55 - v20;
  __chkstk_darwin(v19);
  v23 = (char *)&v55 - v22;
  static Alignment.center.getter();
  if (a2)
  {
    _FrameLayout.init(width:height:alignment:)();
    uint64_t v39 = sub_100005214(&qword_10003EB48);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v39 - 8) + 16))(v9, v56, v39);
    v40 = &v9[*(int *)(v6 + 36)];
    long long v41 = v60;
    *(_OWORD *)v40 = v59;
    *((_OWORD *)v40 + 1) = v41;
    *((_OWORD *)v40 + 2) = v61;
    unsigned __int8 v42 = static Edge.Set.top.getter();
    unsigned __int8 v43 = static Edge.Set.bottom.getter();
    char v44 = Edge.Set.init(rawValue:)();
    Edge.Set.init(rawValue:)();
    if (Edge.Set.init(rawValue:)() != v42) {
      char v44 = Edge.Set.init(rawValue:)();
    }
    Edge.Set.init(rawValue:)();
    if (Edge.Set.init(rawValue:)() != v43) {
      char v44 = Edge.Set.init(rawValue:)();
    }
    EdgeInsets.init(_all:)();
    uint64_t v46 = v45;
    uint64_t v48 = v47;
    uint64_t v50 = v49;
    uint64_t v52 = v51;
    sub_1000052C0((uint64_t)v9, (uint64_t)v15, &qword_10003EB38);
    v53 = &v15[*(int *)(v12 + 36)];
    char *v53 = v44;
    *((void *)v53 + 1) = v46;
    *((void *)v53 + 2) = v48;
    *((void *)v53 + 3) = v50;
    *((void *)v53 + 4) = v52;
    v53[40] = 0;
    sub_100005474((uint64_t)v9, &qword_10003EB38);
    sub_100005258((uint64_t)v15, (uint64_t)v18);
    sub_1000052C0((uint64_t)v18, (uint64_t)v5, &qword_10003EB40);
    swift_storeEnumTagMultiPayload();
    sub_10000539C(&qword_10003EB50, &qword_10003EB40, (void (*)(void))sub_10000536C);
    _ConditionalContent<>.init(storage:)();
    v23 = v18;
  }
  else
  {
    _FrameLayout.init(width:height:alignment:)();
    uint64_t v24 = sub_100005214(&qword_10003EB48);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v11, v56, v24);
    v25 = &v11[*(int *)(v6 + 36)];
    long long v26 = v60;
    *(_OWORD *)v25 = v59;
    *((_OWORD *)v25 + 1) = v26;
    *((_OWORD *)v25 + 2) = v61;
    unsigned __int8 v27 = static Edge.Set.leading.getter();
    unsigned __int8 v28 = static Edge.Set.trailing.getter();
    char v29 = Edge.Set.init(rawValue:)();
    Edge.Set.init(rawValue:)();
    if (Edge.Set.init(rawValue:)() != v27) {
      char v29 = Edge.Set.init(rawValue:)();
    }
    Edge.Set.init(rawValue:)();
    if (Edge.Set.init(rawValue:)() != v28) {
      char v29 = Edge.Set.init(rawValue:)();
    }
    EdgeInsets.init(_all:)();
    uint64_t v31 = v30;
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    sub_1000052C0((uint64_t)v11, (uint64_t)v21, &qword_10003EB38);
    v38 = &v21[*(int *)(v12 + 36)];
    char *v38 = v29;
    *((void *)v38 + 1) = v31;
    *((void *)v38 + 2) = v33;
    *((void *)v38 + 3) = v35;
    *((void *)v38 + 4) = v37;
    v38[40] = 0;
    sub_100005474((uint64_t)v11, &qword_10003EB38);
    sub_100005258((uint64_t)v21, (uint64_t)v23);
    sub_1000052C0((uint64_t)v23, (uint64_t)v5, &qword_10003EB40);
    swift_storeEnumTagMultiPayload();
    sub_10000539C(&qword_10003EB50, &qword_10003EB40, (void (*)(void))sub_10000536C);
    _ConditionalContent<>.init(storage:)();
  }
  return sub_100005474((uint64_t)v23, &qword_10003EB40);
}

uint64_t sub_1000048DC()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_1000048F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100004390(a1, *v2, a2);
}

uint64_t sub_100004900@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000492C(uint64_t a1, uint64_t a2)
{
  return sub_100004A24(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100004944()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100004998()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100004A0C(uint64_t a1, uint64_t a2)
{
  return sub_100004A24(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100004A24(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100004A68(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100004AE0(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100004B60@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100004BA4()
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

uint64_t sub_100004C30@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100004C78(uint64_t a1)
{
  uint64_t v2 = sub_100004DE4((unint64_t *)&qword_10003F290);
  uint64_t v3 = sub_100004DE4(&qword_10003EB28);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

void sub_100004D24(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

ValueMetadata *type metadata accessor for LayoutConfigKey()
{
  return &type metadata for LayoutConfigKey;
}

uint64_t sub_100004D7C()
{
  return sub_100004DE4(&qword_10003EB10);
}

uint64_t sub_100004DB0()
{
  return sub_100004DE4(&qword_10003EB18);
}

uint64_t sub_100004DE4(unint64_t *a1)
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

uint64_t sub_100004E28()
{
  return sub_100004DE4(&qword_10003EB20);
}

uint64_t getEnumTagSinglePayload for SystemButtonType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x7E) {
    goto LABEL_17;
  }
  if (a2 + 130 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 130) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 130;
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
      return (*a1 | (v4 << 8)) - 130;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 130;
    }
  }
LABEL_17:
  unsigned int v6 = ((*a1 >> 6) & 0xFFFFFF83 | (4 * ((*a1 >> 1) & 0x1F))) ^ 0x7F;
  if (v6 >= 0x7D) {
    unsigned int v6 = -1;
  }
  return v6 + 1;
}

unsigned char *storeEnumTagSinglePayload for SystemButtonType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 130 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 130) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x7E) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x7D)
  {
    unsigned int v6 = ((a2 - 126) >> 8) + 1;
    *uint64_t result = a2 - 126;
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
        JUMPOUT(0x100004FD4);
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
          *uint64_t result = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
        break;
    }
  }
  return result;
}

uint64_t sub_100004FFC(unsigned char *a1)
{
  int v1 = (char)*a1;
  if (v1 >= 0) {
    return *a1 >> 6;
  }
  else {
    return v1 & 1 | 2u;
  }
}

unsigned char *sub_100005018(unsigned char *result)
{
  *result &= 0x3Fu;
  return result;
}

unsigned char *sub_100005028(unsigned char *result, unsigned int a2)
{
  if (a2 < 2) {
    *uint64_t result = *result & 1 | ((_BYTE)a2 << 6);
  }
  else {
    *uint64_t result = a2 & 1 | 0x80;
  }
  return result;
}

ValueMetadata *type metadata accessor for SystemButtonType()
{
  return &type metadata for SystemButtonType;
}

uint64_t getEnumTagSinglePayload for CameraButtonShapeType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s9CarCamera12LayoutConfigOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000051C0);
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

ValueMetadata *type metadata accessor for CameraLayout()
{
  return &type metadata for CameraLayout;
}

uint64_t sub_1000051F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005214(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005258(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005214(&qword_10003EB40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000052C0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005214(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100005324(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000536C()
{
  return sub_10000539C(&qword_10003EB58, &qword_10003EB38, (void (*)(void))sub_100005418);
}

uint64_t sub_10000539C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005324(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100005418()
{
  unint64_t result = qword_10003EB60;
  if (!qword_10003EB60)
  {
    sub_100005324(&qword_10003EB48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003EB60);
  }
  return result;
}

uint64_t sub_100005474(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005214(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1000054D4()
{
  unint64_t result = qword_10003EB68;
  if (!qword_10003EB68)
  {
    sub_100005324(&qword_10003EB70);
    sub_10000539C(&qword_10003EB50, &qword_10003EB40, (void (*)(void))sub_10000536C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003EB68);
  }
  return result;
}

void *sub_100005578()
{
  uint64_t v1 = v0[5];
  if (v1 && *(void *)(v1 + 16))
  {
    int v2 = v0;
    uint64_t v3 = v0[4];
    v0[3] &= ~((uint64_t)v0[3] >> 63);
    uint64_t v4 = *(void *)(v1 + 16) - 1;
    if (v4 >= v3) {
      uint64_t v4 = v3;
    }
    v0[4] = v4;
    uint64_t v5 = qword_10003EAB8;
    swift_bridgeObjectRetain();
    if (v5 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_1000062F4(v6, (uint64_t)qword_100041A08);
    swift_bridgeObjectRetain();
    swift_retain();
    BOOL v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.debug.getter();
    uint64_t v9 = v8;
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v10 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 134218496;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v10 + 12) = 2048;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      *(_WORD *)(v10 + 22) = 2048;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, (os_log_type_t)v9, "[safeItems] index [%ld...%ld] from total %ld", (uint8_t *)v10, 0x20u);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease();
      swift_release();
    }
    uint64_t v17 = v2[3];
    uint64_t v16 = v2[4];
    if (v16 < v17)
    {
      __break(1u);
    }
    else
    {
      uint64_t v9 = v16 + 1;
      if (!__OFADD__(v16, 1))
      {
        if ((v17 & 0x8000000000000000) == 0)
        {
          unint64_t v18 = *(void *)(v1 + 16);
          if (v18 >= v17 && (uint64_t)v18 >= v9)
          {
            if ((v9 & 0x8000000000000000) == 0)
            {
              type metadata accessor for __ContiguousArrayStorageBase();
              swift_unknownObjectRetain_n();
              uint64_t v19 = (void *)swift_dynamicCastClass();
              if (!v19)
              {
                swift_bridgeObjectRelease();
                uint64_t v19 = _swiftEmptyArrayStorage;
              }
              uint64_t v20 = v19[2];
              swift_release();
              if (v20 == v9 - v17)
              {
                v15 = (void *)swift_dynamicCastClass();
                if (!v15)
                {
                  swift_bridgeObjectRelease();
                  v15 = _swiftEmptyArrayStorage;
                }
                goto LABEL_26;
              }
LABEL_33:
              swift_bridgeObjectRelease();
              v15 = sub_10000632C(v1, v1 + 32, v17, (2 * v9) | 1);
LABEL_26:
              swift_bridgeObjectRelease();
              return v15;
            }
LABEL_32:
            __break(1u);
            goto LABEL_33;
          }
LABEL_31:
          __break(1u);
          goto LABEL_32;
        }
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
    }
    __break(1u);
    goto LABEL_30;
  }
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_1000062F4(v11, (uint64_t)qword_100041A08);
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "no items", v14, 2u);
    swift_slowDealloc();
  }

  return _swiftEmptyArrayStorage;
}

uint64_t sub_1000058F0()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 49, 7);
}

uint64_t type metadata accessor for PagerState()
{
  return self;
}

uint64_t sub_10000594C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5, uint64_t a6, unint64_t a7)
{
  uint64_t v8 = v7;
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  sub_1000062F4(v15, (uint64_t)qword_100041A08);
  swift_bridgeObjectRetain_n();
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = a6;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 136315394;
    char v31 = a5;
    sub_10000E6A0(0xD000000000000024, 0x800000010002DBB0, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v19 + 12) = 2080;
    if (a7) {
      uint64_t v20 = v18;
    }
    else {
      uint64_t v20 = 0;
    }
    uint64_t v32 = a4;
    if (a7) {
      unint64_t v21 = a7;
    }
    else {
      unint64_t v21 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v22 = v20;
    a5 = v31;
    sub_10000E6A0(v22, v21, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    a4 = v32;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s: %s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(void *)(v8 + 24) = a1;
  swift_retain();
  swift_release();
  *(void *)(v8 + 32) = a1;
  swift_retain();
  swift_release();
  if (*(unsigned char *)(a1 + 48) == 1)
  {
    v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Close button hidden will be hidden in submenu", v25, 2u);
      swift_slowDealloc();
    }

    uint64_t v26 = *(void *)(v8 + 32);
    if (v26) {
      *(unsigned char *)(v26 + 16) = 0;
    }
  }
  if (a3)
  {
    if (a5)
    {
      unsigned __int8 v27 = Logger.logObject.getter();
      os_log_type_t v28 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v27, v28))
      {
        char v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v29 = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "Missing parameters for update", v29, 2u);
        swift_slowDealloc();
      }
    }
    else
    {
      sub_100005FCC(a4);
    }
  }
  else
  {
    sub_100005CF8(a2);
  }
  *(void *)(v8 + 24) = *(void *)(v8 + 32);
  swift_retain();
  return swift_release();
}

void sub_100005CF8(uint64_t a1)
{
  uint64_t v2 = v1[3];
  if (!v2 || (uint64_t v3 = v1[4]) == 0)
  {
LABEL_18:
    if (qword_10003EAB8 != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    sub_1000062F4(v12, (uint64_t)qword_100041A08);
    oslog = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v13, "ERROR: Pager bad state inputs (head)", v14, 2u);
      swift_slowDealloc();
    }
    goto LABEL_22;
  }
  uint64_t v4 = *(void *)(v2 + 40);
  if (!v4)
  {
    uint64_t v15 = qword_10003EAB8;
    swift_retain();
    swift_retain();
    if (v15 == -1) {
      goto LABEL_26;
    }
    goto LABEL_41;
  }
  if (!a1) {
    *(unsigned char *)(v3 + 17) = 0;
  }
  *(void *)(v3 + 24) = a1;
  uint64_t v5 = v1[2];
  BOOL v6 = __OFSUB__(v5, 1);
  uint64_t v7 = v5 - 1;
  if (v6)
  {
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if ((*(unsigned char *)(v2 + 48) & 1) == 0 && *(unsigned char *)(v2 + 16) == 1)
  {
    BOOL v6 = __OFSUB__(v7--, 1);
    if (v6)
    {
      __break(1u);
      return;
    }
  }
  uint64_t v8 = *(void *)(v4 + 16);
  if (a1 < 1)
  {
    *(unsigned char *)(v3 + 17) = 0;
    BOOL v6 = __OFADD__(a1, v7);
    uint64_t v10 = a1 + v7;
    if (!v6)
    {
LABEL_13:
      BOOL v6 = __OFSUB__(v8, 1);
      uint64_t v11 = v8 - 1;
      if (!v6)
      {
        if (v10 >= v11)
        {
          *(unsigned char *)(v3 + 18) = 0;
LABEL_29:
          if (v11 < v10) {
            uint64_t v10 = v11;
          }
          *(void *)(v3 + 32) = v10;
          return;
        }
        *(unsigned char *)(v3 + 18) = 1;
        BOOL v6 = __OFSUB__(v10--, 1);
        if (!v6) {
          goto LABEL_29;
        }
        __break(1u);
        goto LABEL_18;
      }
      goto LABEL_39;
    }
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  *(unsigned char *)(v3 + 17) = 1;
  BOOL v6 = __OFSUB__(v7, 1);
  uint64_t v9 = v7 - 1;
  if (!v6)
  {
    BOOL v6 = __OFADD__(a1, v9);
    uint64_t v10 = a1 + v9;
    if (!v6) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_40:
  __break(1u);
LABEL_41:
  swift_once();
LABEL_26:
  uint64_t v16 = type metadata accessor for Logger();
  sub_1000062F4(v16, (uint64_t)qword_100041A08);
  oslog = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v17, "ERROR: missing items", v18, 2u);
    swift_slowDealloc();
    swift_release();
    swift_release();
LABEL_22:

    return;
  }
LABEL_35:

  swift_release();

  swift_release();
}

void sub_100005FCC(uint64_t a1)
{
  uint64_t v2 = v1[3];
  if (!v2) {
    goto LABEL_14;
  }
  uint64_t v3 = v1[4];
  if (!v3) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)(v2 + 40);
  if (!v4)
  {
    uint64_t v12 = qword_10003EAB8;
    swift_retain();
    swift_retain();
    if (v12 == -1) {
      goto LABEL_22;
    }
    goto LABEL_37;
  }
  uint64_t v5 = *(void *)(v4 + 16) - 1;
  if (v5 == a1) {
    *(unsigned char *)(v3 + 18) = 0;
  }
  *(void *)(v3 + 32) = a1;
  uint64_t v6 = v1[2];
  BOOL v7 = __OFSUB__(v6, 1);
  uint64_t v8 = v6 - 1;
  if (!v7)
  {
    if ((*(unsigned char *)(v2 + 48) & 1) == 0 && *(unsigned char *)(v2 + 16) == 1)
    {
      BOOL v7 = __OFSUB__(v8--, 1);
      if (v7)
      {
        __break(1u);
        return;
      }
    }
    if (v5 <= a1)
    {
      *(unsigned char *)(v3 + 18) = 0;
      goto LABEL_25;
    }
    *(unsigned char *)(v3 + 18) = 1;
    BOOL v7 = __OFSUB__(v8--, 1);
    if (!v7)
    {
LABEL_25:
      BOOL v7 = __OFSUB__(a1, v8);
      uint64_t v16 = a1 - v8;
      if (!v7)
      {
        if (v16 >= 1)
        {
          *(unsigned char *)(v3 + 17) = 1;
          BOOL v7 = __OFADD__(v16++, 1);
          if (!v7) {
            goto LABEL_31;
          }
          __break(1u);
        }
        *(unsigned char *)(v3 + 17) = 0;
LABEL_31:
        *(void *)(v3 + 24) = v16 & ~(v16 >> 63);
        return;
      }
      goto LABEL_36;
    }
    __break(1u);
LABEL_14:
    if (qword_10003EAB8 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_1000062F4(v9, (uint64_t)qword_100041A08);
    oslog = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v10, "ERROR: Pager bad state inputs (tail)", v11, 2u);
      swift_slowDealloc();
    }
    goto LABEL_18;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  swift_once();
LABEL_22:
  uint64_t v13 = type metadata accessor for Logger();
  sub_1000062F4(v13, (uint64_t)qword_100041A08);
  oslog = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v14, "ERROR: missing items", v15, 2u);
    swift_slowDealloc();
    swift_release();
    swift_release();
LABEL_18:

    return;
  }

  swift_release();

  swift_release();
}

uint64_t sub_100006290()
{
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for Pager()
{
  return self;
}

uint64_t sub_1000062F4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void *sub_10000632C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return _swiftEmptyArrayStorage;
    }
    if (v5 <= 0)
    {
      uint64_t v8 = _swiftEmptyArrayStorage;
      if (v4 != a3)
      {
LABEL_5:
        if (v5 < 0) {
          goto LABEL_17;
        }
        unint64_t v10 = a2 + 96 * a3;
        if (v10 < (unint64_t)&v8[12 * v5 + 4] && (unint64_t)(v8 + 4) < v10 + 96 * v5) {
          goto LABEL_17;
        }
        swift_arrayInitWithCopy();
        return v8;
      }
    }
    else
    {
      sub_100005214(&qword_10003EDF0);
      uint64_t v8 = (void *)swift_allocObject();
      size_t v9 = j__malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 96);
      if (v4 != a3) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_17:
  unint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for CameraActionButton(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_1000064F4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

void destroy for ButtonBarContentView(uint64_t a1)
{
  sub_100006550(*(void *)a1, *(unsigned char *)(a1 + 8));
  swift_release();
  swift_release();
  uint64_t v2 = *(void **)(a1 + 48);
}

uint64_t sub_100006550(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for ButtonBarContentView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1000064F4(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v8;
  swift_retain();
  swift_retain();
  id v9 = v8;
  return a1;
}

uint64_t assignWithCopy for ButtonBarContentView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1000064F4(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_100006550(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v8 = *(void **)(a2 + 48);
  id v9 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v8;
  id v10 = v8;

  return a1;
}

__n128 initializeWithTake for ButtonBarContentView(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ButtonBarContentView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_100006550(v6, v7);
  *(void *)(a1 + 16) = a2[2];
  swift_release();
  uint64_t v8 = a2[4];
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = v8;
  swift_release();
  uint64_t v9 = a2[6];
  id v10 = *(void **)(a1 + 48);
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = v9;

  return a1;
}

uint64_t getEnumTagSinglePayload for ButtonBarContentView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ButtonBarContentView(uint64_t result, int a2, int a3)
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ButtonBarContentView()
{
  return &type metadata for ButtonBarContentView;
}

uint64_t sub_1000067B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000067CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  sub_1000069E0(v1, (uint64_t)v24);
  uint64_t v4 = v24[0];
  uint64_t v5 = v24[1];
  uint64_t v6 = v24[2];
  uint64_t v7 = v24[3];
  uint64_t v22 = v24[5];
  uint64_t v23 = v24[4];
  uint64_t v21 = v24[6];
  char v19 = v26;
  char v20 = v25;
  uint64_t v8 = *(void *)v1;
  char v9 = *(unsigned char *)(v1 + 8);
  id v10 = *(id *)(v1 + 48);
  sub_1000064F4(v8, v9);
  char v11 = sub_10000E010(v8, v9);
  sub_100006550(v8, v9);
  uint64_t v12 = *(void *)(v2 + 32);
  if (v11)
  {
    if (v12)
    {
      uint64_t v13 = (double *)(v12 + 24);
      goto LABEL_6;
    }
  }
  else if (v12)
  {
    uint64_t v13 = (double *)(v12 + 16);
LABEL_6:
    double v14 = *v13;
    type metadata accessor for ButtonBarLayout(0);
    swift_allocObject();
    uint64_t v15 = sub_10002427C(v10, v14);
    sub_1000092E0((unint64_t *)&qword_10003EE00, (void (*)(uint64_t))type metadata accessor for ButtonBarLayout);
    uint64_t v16 = static ObservableObject.environmentStore.getter();
    sub_1000064F4(v8, v9);
    char v17 = sub_10000E010(v8, v9) & 1;
    uint64_t result = sub_100006550(v8, v9);
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = v6;
    *(void *)(a1 + 24) = v7;
    *(void *)(a1 + 32) = v23;
    *(void *)(a1 + 40) = v22;
    *(void *)(a1 + 48) = v21;
    *(unsigned char *)(a1 + 56) = v20;
    *(unsigned char *)(a1 + 57) = v19;
    *(void *)(a1 + 64) = v16;
    *(void *)(a1 + 72) = v15;
    *(unsigned char *)(a1 + 80) = v17;
    return result;
  }
  type metadata accessor for LayoutSize();
  sub_1000092E0(&qword_10003EDF8, (void (*)(uint64_t))type metadata accessor for LayoutSize);
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

double sub_1000069E0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)a1;
  char v4 = *(unsigned char *)(a1 + 8);
  sub_1000064F4(*(void *)a1, v4);
  char v5 = sub_10000E010(v3, v4);
  sub_100006550(v3, v4);
  type metadata accessor for ButtonBarLayout(0);
  sub_1000092E0((unint64_t *)&qword_10003EE00, (void (*)(uint64_t))type metadata accessor for ButtonBarLayout);
  EnvironmentObject.init()();
  if (v5)
  {
    static Edge.Set.top.getter();
    EdgeInsets.init(_all:)();
  }
  sub_100005214(&qword_10003EE08);
  sub_10000889C();
  sub_10000896C();
  _ConditionalContent<>.init(storage:)();
  double result = *(double *)&v7;
  *(_OWORD *)a2 = v7;
  *(_OWORD *)(a2 + 16) = v8;
  *(_OWORD *)(a2 + 32) = v9;
  *(void *)(a2 + 48) = v10;
  *(unsigned char *)(a2 + 56) = v11;
  *(unsigned char *)(a2 + 57) = v12;
  return result;
}

uint64_t sub_100006B5C()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100006B78@<X0>(uint64_t a1@<X8>)
{
  return sub_1000067CC(a1);
}

id sub_100006BBC()
{
  if (qword_10003EAE8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_100041A68;

  return v0;
}

uint64_t sub_100006C18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v23 = a1;
  uint64_t v3 = type metadata accessor for LayoutDirection();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&KeyPath - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005214(&qword_10003EEE0);
  __chkstk_darwin(v7 - 8);
  long long v9 = (char *)&KeyPath - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005214(&qword_10003EEE8);
  __chkstk_darwin(v10);
  char v12 = (char *)&KeyPath - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)long long v9 = static VerticalAlignment.center.getter();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  uint64_t v13 = sub_100005214(&qword_10003EEF0);
  sub_100006F40(v2, (uint64_t)&v9[*(int *)(v13 + 44)]);
  uint64_t KeyPath = swift_getKeyPath();
  type metadata accessor for CameraCAFManager();
  sub_1000092E0(&qword_10003EEF8, (void (*)(uint64_t))type metadata accessor for CameraCAFManager);
  double v14 = (char *)StateObject.wrappedValue.getter();
  id v15 = [*(id *)&v14[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_sessionStatus] currentSession];
  if (!v15)
  {

    goto LABEL_5;
  }
  uint64_t v16 = v15;
  id v17 = [v15 configuration];

  LOBYTE(v16) = [v17 rightHandDrive];
  if ((v16 & 1) == 0)
  {
LABEL_5:
    uint64_t v18 = (unsigned int *)&enum case for LayoutDirection.leftToRight(_:);
    goto LABEL_6;
  }
  uint64_t v18 = (unsigned int *)&enum case for LayoutDirection.rightToLeft(_:);
LABEL_6:
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *v18, v3);
  char v19 = (uint64_t *)&v12[*(int *)(v10 + 36)];
  uint64_t v20 = sub_100005214(&qword_10003EF00);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v19 + *(int *)(v20 + 28), v6, v3);
  *char v19 = KeyPath;
  sub_1000052C0((uint64_t)v9, (uint64_t)v12, &qword_10003EEE0);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_100005474((uint64_t)v9, &qword_10003EEE0);
  return sub_100009328((uint64_t)v12, v23, &qword_10003EEE8);
}

uint64_t sub_100006F40@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a2;
  uint64_t v3 = sub_100005214(&qword_10003EF08);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v51 = (uint64_t)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v50 = (uint64_t *)((char *)&v47 - v6);
  uint64_t v48 = sub_100005214(&qword_10003EE90);
  uint64_t v7 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  long long v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005214(&qword_10003F500);
  __chkstk_darwin(v10 - 8);
  char v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for CameraCloseButton(0);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100005214(&qword_10003EE98);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v53 = (uint64_t)&v47 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v49 = a1;
  if (*a1)
  {
    uint64_t v21 = (char *)&v47 - v20;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
    {
      sub_100005474((uint64_t)v12, &qword_10003F500);
      uint64_t v22 = 1;
      uint64_t v23 = (uint64_t)v21;
      uint64_t v24 = v48;
    }
    else
    {
      sub_1000090E8((uint64_t)v12, (uint64_t)v16);
      sub_10000B2F0(0);
      sub_10000B2F0(128);
      uint64_t v25 = static AnyTransition.asymmetric(insertion:removal:)();
      swift_release();
      swift_release();
      sub_10000914C((uint64_t)v16, (uint64_t)v9);
      uint64_t v24 = v48;
      *(void *)&v9[*(int *)(v48 + 36)] = v25;
      sub_1000091B0((uint64_t)v16);
      uint64_t v23 = (uint64_t)v21;
      sub_100009328((uint64_t)v9, (uint64_t)v21, &qword_10003EE90);
      uint64_t v22 = 0;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v23, v22, 1, v24);
    swift_getKeyPath();
    uint64_t v26 = v23;
    uint64_t v47 = v23;
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v27 = v54;
    uint64_t v28 = v55;
    char v29 = v56;
    uint64_t v30 = static VerticalAlignment.center.getter();
    uint64_t v31 = (uint64_t)v50;
    *uint64_t v50 = v30;
    *(void *)(v31 + 8) = 0;
    *(unsigned char *)(v31 + 16) = 1;
    uint64_t v32 = sub_100005214(&qword_10003EF10);
    sub_100007570(v49, v31 + *(int *)(v32 + 44));
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v33 = v54;
    uint64_t v34 = v55;
    uint64_t v49 = v56;
    uint64_t v35 = v53;
    sub_1000052C0(v26, v53, &qword_10003EE98);
    uint64_t v36 = v51;
    sub_1000052C0(v31, v51, &qword_10003EF08);
    uint64_t v37 = v35;
    uint64_t v38 = v52;
    sub_1000052C0(v37, v52, &qword_10003EE98);
    uint64_t v39 = (int *)sub_100005214(&qword_10003EF18);
    v40 = (uint64_t *)(v38 + v39[12]);
    uint64_t *v40 = v27;
    v40[1] = v28;
    v40[2] = (uint64_t)v29;
    uint64_t v41 = (uint64_t)v29;
    uint64_t v42 = v38 + v39[16];
    *(void *)uint64_t v42 = 0;
    *(unsigned char *)(v42 + 8) = 1;
    sub_1000052C0(v36, v38 + v39[20], &qword_10003EF08);
    uint64_t v43 = v38 + v39[24];
    *(void *)uint64_t v43 = 0;
    *(unsigned char *)(v43 + 8) = 1;
    char v44 = (uint64_t *)(v38 + v39[28]);
    *char v44 = v33;
    v44[1] = v34;
    uint64_t v45 = v49;
    v44[2] = (uint64_t)v49;
    sub_100009060(v27, v28, v41);
    sub_100009060(v33, v34, (uint64_t)v45);
    sub_100005474(v31, &qword_10003EF08);
    sub_100005474(v47, &qword_10003EE98);
    sub_1000090A4(v33, v34, (uint64_t)v45);
    sub_100005474(v36, &qword_10003EF08);
    sub_1000090A4(v27, v28, v41);
    return sub_100005474(v53, &qword_10003EE98);
  }
  else
  {
    type metadata accessor for ButtonBarLayout(0);
    sub_1000092E0((unint64_t *)&qword_10003EE00, (void (*)(uint64_t))type metadata accessor for ButtonBarLayout);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_100007570@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100005214(&qword_10003EF20);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005214(&qword_10003EF28);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v22 - v12;
  uint64_t v14 = *a1;
  char v15 = sub_100008400(*a1);
  if (v14)
  {
    char v16 = v15;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v17 = v23;
    if (v23)
    {
      *(void *)uint64_t v7 = static VerticalAlignment.center.getter();
      *((void *)v7 + 1) = 0x4010000000000000;
      v7[16] = 0;
      uint64_t v22 = &v7[*(int *)(sub_100005214(&qword_10003EF38) + 44)];
      uint64_t v23 = v17;
      swift_getKeyPath();
      sub_100005214(&qword_10003F510);
      sub_100009490(&qword_10003EED0, &qword_10003F510);
      sub_10000925C();
      ForEach<>.init(_:id:content:)();
      sub_100009328((uint64_t)v7, (uint64_t)v13, &qword_10003EF20);
      uint64_t v18 = 0;
    }
    else
    {
      uint64_t v18 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v13, v18, 1, v4);
    sub_1000052C0((uint64_t)v13, (uint64_t)v11, &qword_10003EF28);
    *(void *)a2 = 0;
    *(unsigned char *)(a2 + 8) = v16 & 1;
    *(unsigned char *)(a2 + 9) = (v16 & 1) == 0;
    uint64_t v19 = sub_100005214(&qword_10003EF30);
    sub_1000052C0((uint64_t)v11, a2 + *(int *)(v19 + 48), &qword_10003EF28);
    uint64_t v20 = a2 + *(int *)(v19 + 64);
    *(void *)uint64_t v20 = 0;
    *(unsigned char *)(v20 + 8) = 1;
    sub_100005474((uint64_t)v13, &qword_10003EF28);
    return sub_100005474((uint64_t)v11, &qword_10003EF28);
  }
  else
  {
    type metadata accessor for ButtonBarLayout(0);
    sub_1000092E0((unint64_t *)&qword_10003EE00, (void (*)(uint64_t))type metadata accessor for ButtonBarLayout);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

void sub_1000078FC(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *(id *)(a1 + 8);
  uint64_t v4 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
  uint64_t v6 = v5;

  *a2 = v4;
  a2[1] = v6;
}

uint64_t sub_100007948(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LayoutDirection();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.layoutDirection.setter();
}

uint64_t sub_100007A10@<X0>(uint64_t a1@<X8>)
{
  return sub_100006C18(a1);
}

uint64_t sub_100007A4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v50 = a2;
  uint64_t v53 = a3;
  uint64_t v4 = sub_100005214(&qword_10003EE88);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v52 = (uint64_t)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v51 = (uint64_t *)((char *)&v48 - v7);
  uint64_t v49 = sub_100005214(&qword_10003EE90);
  uint64_t v8 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005214(&qword_10003F500);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for CameraCloseButton(0);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100005214(&qword_10003EE98);
  uint64_t v19 = __chkstk_darwin(v18 - 8);
  uint64_t v54 = (uint64_t)&v48 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  if (a1)
  {
    uint64_t v22 = (char *)&v48 - v21;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
    {
      sub_100005474((uint64_t)v13, &qword_10003F500);
      uint64_t v23 = 1;
      uint64_t v24 = (uint64_t)v22;
      uint64_t v25 = v49;
    }
    else
    {
      sub_1000090E8((uint64_t)v13, (uint64_t)v17);
      sub_10000B2F0(0);
      sub_10000B2F0(128);
      uint64_t v26 = static AnyTransition.asymmetric(insertion:removal:)();
      swift_release();
      swift_release();
      sub_10000914C((uint64_t)v17, (uint64_t)v10);
      uint64_t v25 = v49;
      *(void *)&v10[*(int *)(v49 + 36)] = v26;
      sub_1000091B0((uint64_t)v17);
      uint64_t v24 = (uint64_t)v22;
      sub_100009328((uint64_t)v10, (uint64_t)v22, &qword_10003EE90);
      uint64_t v23 = 0;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v24, v23, 1, v25);
    swift_getKeyPath();
    uint64_t v27 = v24;
    uint64_t v48 = v24;
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v28 = v55;
    uint64_t v29 = v56;
    uint64_t v30 = v57;
    uint64_t v31 = static HorizontalAlignment.center.getter();
    uint64_t v32 = (uint64_t)v51;
    *uint64_t v51 = v31;
    *(void *)(v32 + 8) = 0;
    *(unsigned char *)(v32 + 16) = 1;
    uint64_t v33 = sub_100005214(&qword_10003EEA0);
    sub_100008074(a1, v32 + *(int *)(v33 + 44));
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v34 = v56;
    uint64_t v50 = v55;
    uint64_t v35 = v57;
    uint64_t v36 = v54;
    sub_1000052C0(v27, v54, &qword_10003EE98);
    uint64_t v37 = v52;
    sub_1000052C0(v32, v52, &qword_10003EE88);
    uint64_t v38 = v36;
    uint64_t v39 = v53;
    sub_1000052C0(v38, v53, &qword_10003EE98);
    v40 = (int *)sub_100005214(&qword_10003EEA8);
    uint64_t v41 = (uint64_t *)(v39 + v40[12]);
    *uint64_t v41 = v28;
    v41[1] = v29;
    v41[2] = v30;
    uint64_t v42 = v30;
    uint64_t v43 = v39 + v40[16];
    *(void *)uint64_t v43 = 0;
    *(unsigned char *)(v43 + 8) = 1;
    sub_1000052C0(v37, v39 + v40[20], &qword_10003EE88);
    uint64_t v44 = v39 + v40[24];
    *(void *)uint64_t v44 = 0;
    *(unsigned char *)(v44 + 8) = 1;
    uint64_t v45 = (uint64_t *)(v39 + v40[28]);
    uint64_t v46 = v50;
    *uint64_t v45 = v50;
    v45[1] = v34;
    v45[2] = v35;
    sub_100009060(v28, v29, v42);
    sub_100009060(v46, v34, v35);
    sub_100005474(v32, &qword_10003EE88);
    sub_100005474(v48, &qword_10003EE98);
    sub_1000090A4(v46, v34, v35);
    sub_100005474(v37, &qword_10003EE88);
    sub_1000090A4(v28, v29, v42);
    return sub_100005474(v54, &qword_10003EE98);
  }
  else
  {
    type metadata accessor for ButtonBarLayout(0);
    sub_1000092E0((unint64_t *)&qword_10003EE00, (void (*)(uint64_t))type metadata accessor for ButtonBarLayout);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_100008074@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100005214(&qword_10003EEB0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005214(&qword_10003EEB8);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v21 - v12;
  char v14 = sub_100008400(a1);
  if (a1)
  {
    char v15 = v14;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v16 = v22;
    if (v22)
    {
      *(void *)uint64_t v7 = static HorizontalAlignment.center.getter();
      *((void *)v7 + 1) = 0x4010000000000000;
      v7[16] = 0;
      uint64_t v21 = &v7[*(int *)(sub_100005214(&qword_10003EEC8) + 44)];
      uint64_t v22 = v16;
      swift_getKeyPath();
      sub_100005214(&qword_10003F510);
      sub_100009490(&qword_10003EED0, &qword_10003F510);
      sub_10000925C();
      ForEach<>.init(_:id:content:)();
      sub_100009328((uint64_t)v7, (uint64_t)v13, &qword_10003EEB0);
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v13, v17, 1, v4);
    sub_1000052C0((uint64_t)v13, (uint64_t)v11, &qword_10003EEB8);
    *(void *)a2 = 0;
    *(unsigned char *)(a2 + 8) = v15 & 1;
    *(unsigned char *)(a2 + 9) = (v15 & 1) == 0;
    uint64_t v18 = sub_100005214(&qword_10003EEC0);
    sub_1000052C0((uint64_t)v11, a2 + *(int *)(v18 + 48), &qword_10003EEB8);
    uint64_t v19 = a2 + *(int *)(v18 + 64);
    *(void *)uint64_t v19 = 0;
    *(unsigned char *)(v19 + 8) = 1;
    sub_100005474((uint64_t)v13, &qword_10003EEB8);
    return sub_100005474((uint64_t)v11, &qword_10003EEB8);
  }
  else
  {
    type metadata accessor for ButtonBarLayout(0);
    sub_1000092E0((unint64_t *)&qword_10003EE00, (void (*)(uint64_t))type metadata accessor for ButtonBarLayout);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_100008400(uint64_t a1)
{
  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    sub_1000090A4(v2, v3, v4);
    if (v4)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      sub_1000090A4(v2, v3, v4);
    }
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    sub_1000090A4(v2, v3, v4);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if (v4)
    {
      sub_1000090A4(v2, v3, v4);
    }
    else
    {
      sub_1000090A4(v2, v3, 0);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
    }
    return 1;
  }
  else
  {
    type metadata accessor for ButtonBarLayout(0);
    sub_1000092E0((unint64_t *)&qword_10003EE00, (void (*)(uint64_t))type metadata accessor for ButtonBarLayout);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_1000086EC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  char v3 = (void *)a1[1];
  uint64_t v4 = a1[2];
  uint64_t v19 = a1[3];
  uint64_t v20 = *a1;
  uint64_t v5 = a1[4];
  char v6 = *((unsigned char *)a1 + 40);
  uint64_t v7 = (void *)a1[6];
  uint64_t v18 = a1[7];
  uint64_t v8 = (void *)a1[8];
  uint64_t v9 = a1[10];
  char v16 = *((unsigned char *)a1 + 88);
  char v17 = *((unsigned char *)a1 + 72);
  uint64_t KeyPath = swift_getKeyPath();
  swift_retain();
  id v10 = v3;
  sub_1000064F4(v5, v6);
  type metadata accessor for ButtonBarLayout(0);
  sub_1000092E0((unint64_t *)&qword_10003EE00, (void (*)(uint64_t))type metadata accessor for ButtonBarLayout);
  id v11 = v7;
  id v12 = v8;
  swift_retain();
  uint64_t result = EnvironmentObject.init()();
  *(void *)a2 = KeyPath;
  *(unsigned char *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = result;
  *(void *)(a2 + 24) = v14;
  *(void *)(a2 + 32) = v20;
  *(void *)(a2 + 40) = v10;
  *(void *)(a2 + 48) = v4;
  *(void *)(a2 + 56) = v19;
  *(void *)(a2 + 64) = v5;
  *(unsigned char *)(a2 + 72) = v6;
  *(void *)(a2 + 80) = v7;
  *(void *)(a2 + 88) = v18;
  *(void *)(a2 + 96) = v8;
  *(unsigned char *)(a2 + 104) = v17;
  *(void *)(a2 + 112) = v9;
  *(unsigned char *)(a2 + 120) = v16;
  return result;
}

uint64_t sub_100008840@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  *(void *)a1 = static HorizontalAlignment.center.getter();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v5 = sub_100005214(&qword_10003EE80);
  return sub_100007A4C(v4, v3, a1 + *(int *)(v5 + 44));
}

unint64_t sub_10000889C()
{
  unint64_t result = qword_10003EE10;
  if (!qword_10003EE10)
  {
    sub_100005324(&qword_10003EE08);
    sub_100008918();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003EE10);
  }
  return result;
}

unint64_t sub_100008918()
{
  unint64_t result = qword_10003EE18;
  if (!qword_10003EE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003EE18);
  }
  return result;
}

unint64_t sub_10000896C()
{
  unint64_t result = qword_10003EE20;
  if (!qword_10003EE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003EE20);
  }
  return result;
}

uint64_t sub_1000089C0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return _objc_retain_x1();
  }
  else {
    return swift_retain();
  }
}

void destroy for ButtonBarExpandableViewH(uint64_t a1)
{
  swift_release();
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)(a1 + 24);
  char v4 = *(unsigned char *)(a1 + 32);

  sub_100008A10(v2, v3, v4);
}

void sub_100008A10(uint64_t a1, void *a2, char a3)
{
  if (a3) {

  }
  else {
    swift_release();
  }
}

uint64_t initializeWithCopy for ButtonBarExpandableViewH(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  char v6 = *(unsigned char *)(a2 + 32);
  swift_retain();
  sub_1000089C0(v4, v5, v6);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  return a1;
}

uint64_t assignWithCopy for ButtonBarExpandableViewH(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = v2[1];
  uint64_t v4 = v2[2];
  uint64_t v5 = v2[3];
  LOBYTE(v2) = *((unsigned char *)v2 + 32);
  sub_1000089C0(v4, v5, (char)v2);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void **)(a1 + 24);
  char v8 = *(unsigned char *)(a1 + 32);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = (_BYTE)v2;
  sub_100008A10(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for ButtonBarExpandableViewH(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ButtonBarExpandableViewH(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 24);
  char v5 = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void **)(a1 + 24);
  char v8 = *(unsigned char *)(a1 + 32);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  sub_100008A10(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ButtonBarExpandableViewH(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 33)) {
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

uint64_t storeEnumTagSinglePayload for ButtonBarExpandableViewH(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ButtonBarExpandableViewH()
{
  return &type metadata for ButtonBarExpandableViewH;
}

void *initializeBufferWithCopyOfBuffer for ButtonBarExpandableViewV(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for ButtonBarExpandableViewV()
{
  return swift_release();
}

void *assignWithCopy for ButtonBarExpandableViewV(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  return a1;
}

void *assignWithTake for ButtonBarExpandableViewV(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for ButtonBarExpandableViewV(uint64_t *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ButtonBarExpandableViewV(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ButtonBarExpandableViewV()
{
  return &type metadata for ButtonBarExpandableViewV;
}

unint64_t sub_100008DB0()
{
  unint64_t result = qword_10003EE28;
  if (!qword_10003EE28)
  {
    sub_100005324(&qword_10003EE30);
    sub_100008E2C();
    sub_100008FBC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003EE28);
  }
  return result;
}

unint64_t sub_100008E2C()
{
  unint64_t result = qword_10003EE38;
  if (!qword_10003EE38)
  {
    sub_100005324(&qword_10003EE40);
    sub_100008ECC();
    sub_100009490(&qword_10003EE68, &qword_10003EE70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003EE38);
  }
  return result;
}

unint64_t sub_100008ECC()
{
  unint64_t result = qword_10003EE48;
  if (!qword_10003EE48)
  {
    sub_100005324(&qword_10003EE50);
    sub_100008F40();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003EE48);
  }
  return result;
}

unint64_t sub_100008F40()
{
  unint64_t result = qword_10003EE58;
  if (!qword_10003EE58)
  {
    sub_100005324(&qword_10003EE60);
    sub_10000889C();
    sub_10000896C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003EE58);
  }
  return result;
}

unint64_t sub_100008FBC()
{
  unint64_t result = qword_10003EE78;
  if (!qword_10003EE78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003EE78);
  }
  return result;
}

uint64_t sub_100009010()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000902C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100009060(uint64_t result, char a2, uint64_t a3)
{
  if (a3)
  {
    sub_1000064F4(result, a2 & 1);
    return swift_retain();
  }
  return result;
}

uint64_t sub_1000090A4(uint64_t result, char a2, uint64_t a3)
{
  if (a3)
  {
    sub_100006550(result, a2 & 1);
    return swift_release();
  }
  return result;
}

uint64_t sub_1000090E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CameraCloseButton(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000914C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CameraCloseButton(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000091B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CameraCloseButton(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100009214(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *(id *)(a1 + 8);
  uint64_t v4 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
  uint64_t v6 = v5;

  *a2 = v4;
  a2[1] = v6;
}

unint64_t sub_10000925C()
{
  unint64_t result = qword_10003EED8;
  if (!qword_10003EED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003EED8);
  }
  return result;
}

uint64_t sub_1000092B8()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_1000092E0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100009328(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005214(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000938C()
{
  return sub_100009490(&qword_10003EF40, &qword_10003EF48);
}

unint64_t sub_1000093CC()
{
  unint64_t result = qword_10003EF50;
  if (!qword_10003EF50)
  {
    sub_100005324(&qword_10003EEE8);
    sub_100009490(&qword_10003EF58, &qword_10003EEE0);
    sub_100009490(&qword_10003EF60, &qword_10003EF00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003EF50);
  }
  return result;
}

uint64_t sub_100009490(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005324(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t destroy for CameraSpinnerView(uint64_t a1)
{
  sub_100006550(*(void *)a1, *(unsigned char *)(a1 + 8));
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CameraSpinnerView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1000064F4(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CameraSpinnerView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1000064F4(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_100006550(v6, v7);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for CameraSpinnerView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CameraSpinnerView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_100006550(v6, v7);
  *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
  *(void *)(a1 + 24) = a2[3];
  swift_release();
  uint64_t v8 = a2[5];
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CameraSpinnerView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CameraSpinnerView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraSpinnerView()
{
  return &type metadata for CameraSpinnerView;
}

uint64_t sub_10000977C()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_100009798@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  char v4 = *(unsigned char *)(v1 + 8);
  sub_1000064F4(*(void *)v1, v4);
  char v5 = sub_10000E010(v3, v4);
  sub_100006550(v3, v4);
  if (v5)
  {
    uint64_t v7 = static HorizontalAlignment.center.getter();
    uint64_t v8 = static Alignment.center.getter();
    uint64_t v10 = v9;
    sub_100009A90((uint64_t *)v1, (uint64_t)&v18[23]);
    v13[0] = 1;
    uint64_t v15 = v7;
    uint64_t v16 = 0;
    char v17 = 1;
    *(void *)&v18[7] = v8;
    *(void *)&v18[15] = v10;
    sub_10000A0A4((uint64_t)&v15);
  }
  else
  {
    uint64_t v6 = static VerticalAlignment.center.getter();
    sub_100009960((uint64_t *)v1, __src);
    v13[336] = 1;
    memcpy(&v13[7], __src, 0x148uLL);
    uint64_t v15 = v6;
    uint64_t v16 = 0;
    char v17 = 1;
    memcpy(v18, v13, 0x14FuLL);
    sub_10000A0B0((uint64_t)&v15);
  }
  sub_100009328((uint64_t)&v15, (uint64_t)v14, &qword_10003EF68);
  sub_100005214(&qword_10003EF70);
  sub_100005214(&qword_10003EF78);
  sub_100009490(&qword_10003EF80, &qword_10003EF70);
  sub_100009490(&qword_10003EF88, &qword_10003EF78);
  _ConditionalContent<>.init(storage:)();
  return memcpy(a1, v19, 0x161uLL);
}

uint64_t sub_100009960@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = static Alignment.center.getter();
  uint64_t v6 = v5;
  sub_100009A90(a1, (uint64_t)__src);
  uint64_t v7 = a1[5];
  if (v7)
  {
    uint64_t v16 = a1[4];
    uint64_t v17 = v7;
    sub_10000A2B4();
    swift_bridgeObjectRetain();
    uint64_t v8 = Text.init<A>(_:)();
    uint64_t v7 = v9;
    uint64_t v11 = v10;
    uint64_t v13 = v12 & 1;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v13 = 0;
    uint64_t v11 = 0;
  }
  v15[0] = v4;
  v15[1] = v6;
  memcpy(&v15[2], __src, 0x118uLL);
  memcpy(a2, v15, 0x128uLL);
  a2[37] = v8;
  a2[38] = v7;
  a2[39] = v13;
  a2[40] = v11;
  sub_10000A0B8((uint64_t)v15);
  sub_10000A160(v8, v7, v13, v11);
  sub_10000A1B4(v8, v7, v13, v11);
  uint64_t v16 = v4;
  uint64_t v17 = v6;
  memcpy(v18, __src, sizeof(v18));
  return sub_10000A208((uint64_t)&v16);
}

uint64_t sub_100009A90@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Color.RGBColorSpace();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  uint64_t v62 = v105;
  uint64_t v63 = v106;
  uint64_t v64 = v104;
  uint64_t v8 = *(void (**)(char *, void, uint64_t))(v5 + 104);
  uint64_t v53 = a1 + 4;
  uint64_t v61 = a2 + 104;
  uint64_t v9 = v102;
  uint64_t v10 = v103;
  v8(v7, enum case for Color.RGBColorSpace.sRGB(_:), v4);
  uint64_t v60 = Color.init(_:red:green:blue:opacity:)();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v58 = v109;
  uint64_t v59 = v107;
  int v54 = v110;
  int v55 = v108;
  uint64_t v56 = v112;
  uint64_t v57 = v111;
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  uint64_t v11 = v113;
  unsigned int v51 = v115;
  unsigned int v52 = v114;
  uint64_t v12 = v116;
  uint64_t v50 = v117;
  uint64_t v13 = v118;
  uint64_t v49 = static Color.blue.getter();
  uint64_t KeyPath = swift_getKeyPath();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v14 = v119;
  char v15 = v120;
  uint64_t v16 = v121;
  char v17 = v122;
  uint64_t v18 = v123;
  uint64_t v19 = v124;
  long long v128 = *((_OWORD *)a1 + 1);
  long long v80 = *((_OWORD *)a1 + 1);
  sub_100005214(&qword_10003EF98);
  State.wrappedValue.getter();
  if ((_BYTE)v67) {
    double v20 = -6.28318531;
  }
  else {
    double v20 = 0.0;
  }
  static UnitPoint.center.getter();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  char v66 = v15;
  char v65 = v17;
  uint64_t v126 = *a1;
  char v127 = *((unsigned char *)a1 + 8);
  sub_100009328((uint64_t)v53, (uint64_t)v125, &qword_10003F520);
  uint64_t v25 = (_OWORD *)swift_allocObject();
  long long v26 = *((_OWORD *)a1 + 1);
  v25[1] = *(_OWORD *)a1;
  v25[2] = v26;
  v25[3] = *((_OWORD *)a1 + 2);
  char v27 = v66;
  char v28 = v65;
  long long v67 = xmmword_10002EE80;
  *(void *)&long long v68 = v11;
  unsigned int v30 = v51;
  unsigned int v29 = v52;
  *((void *)&v68 + 1) = __PAIR64__(v51, v52);
  *(void *)&long long v69 = v12;
  uint64_t v32 = v49;
  uint64_t v31 = v50;
  *((void *)&v69 + 1) = v50;
  *(void *)&long long v70 = v13;
  uint64_t v33 = KeyPath;
  *((void *)&v70 + 1) = KeyPath;
  *(void *)&long long v71 = v49;
  *((void *)&v71 + 1) = v14;
  LOBYTE(v72) = v66;
  *((void *)&v72 + 1) = v16;
  LOBYTE(v73) = v65;
  *((void *)&v73 + 1) = v18;
  *(void *)&long long v74 = v19;
  *((double *)&v74 + 1) = v20;
  *(void *)&long long v75 = v22;
  *((void *)&v75 + 1) = v24;
  *(void *)&long long v76 = sub_10000A35C;
  *((void *)&v76 + 1) = v25;
  long long v77 = 0uLL;
  char v79 = v55;
  char v78 = v54;
  long long v34 = v71;
  long long v35 = v72;
  long long v36 = v74;
  *(_OWORD *)(a2 + 200) = v73;
  *(_OWORD *)(a2 + 184) = v35;
  *(_OWORD *)(a2 + 168) = v34;
  long long v37 = v69;
  *(_OWORD *)(a2 + 152) = v70;
  long long v38 = v76;
  uint64_t v39 = v62;
  *(_OWORD *)(v61 + 160) = v77;
  long long v40 = v75;
  *(_OWORD *)(a2 + 248) = v38;
  *(_OWORD *)(a2 + 232) = v40;
  *(_OWORD *)(a2 + 216) = v36;
  long long v41 = v67;
  long long v42 = v68;
  *(_OWORD *)(a2 + 136) = v37;
  *(_OWORD *)(a2 + 120) = v42;
  *(_OWORD *)(a2 + 104) = v41;
  char v43 = v79;
  char v44 = v78;
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v10;
  *(void *)(a2 + 16) = v64;
  *(void *)(a2 + 24) = v39;
  *(void *)(a2 + 32) = v63;
  *(void *)(a2 + 40) = v60;
  *(_WORD *)(a2 + 48) = 256;
  *(void *)(a2 + 56) = v59;
  *(unsigned char *)(a2 + 64) = v43;
  *(void *)(a2 + 72) = v58;
  *(unsigned char *)(a2 + 80) = v44;
  uint64_t v45 = v56;
  *(void *)(a2 + 88) = v57;
  *(void *)(a2 + 96) = v45;
  long long v80 = xmmword_10002EE80;
  uint64_t v81 = v11;
  unsigned int v82 = v29;
  unsigned int v83 = v30;
  uint64_t v84 = v12;
  uint64_t v85 = v31;
  uint64_t v86 = v13;
  uint64_t v87 = v33;
  uint64_t v88 = v32;
  uint64_t v89 = v14;
  char v90 = v27;
  uint64_t v91 = v16;
  char v92 = v28;
  uint64_t v93 = v18;
  uint64_t v94 = v19;
  double v95 = v20;
  uint64_t v96 = v22;
  uint64_t v97 = v24;
  v98 = sub_10000A35C;
  v99 = v25;
  uint64_t v100 = 0;
  uint64_t v101 = 0;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10000A364((uint64_t)&v67);
  sub_10000A3DC((uint64_t)&v126);
  sub_10000A40C((uint64_t)&v128);
  sub_10000A438((uint64_t)v125);
  sub_10000A464((uint64_t)&v80);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100009F28()
{
  return swift_release();
}

uint64_t sub_100009FB8(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  sub_100009328((uint64_t)&v2 + 8, (uint64_t)v3, &qword_10003EFA0);
  sub_10000A4FC((uint64_t)v3);
  sub_100005214(&qword_10003EF98);
  State.wrappedValue.getter();
  State.wrappedValue.setter();
  return sub_10000A528((uint64_t)&v2);
}

void *sub_10000A068@<X0>(void *a1@<X8>)
{
  return sub_100009798(a1);
}

uint64_t sub_10000A0A4(uint64_t result)
{
  *(unsigned char *)(result + 352) = 1;
  return result;
}

uint64_t sub_10000A0B0(uint64_t result)
{
  *(unsigned char *)(result + 352) = 0;
  return result;
}

uint64_t sub_10000A0B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 264);
  uint64_t v3 = *(void *)(a1 + 280);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10000A150(v2);
  sub_10000A150(v3);
  return a1;
}

uint64_t sub_10000A150(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000A160(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000A1A4(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10000A1A4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10000A1B4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000A1F8(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000A1F8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000A208(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 264);
  uint64_t v3 = *(void *)(a1 + 280);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_10000A2A4(v2);
  sub_10000A2A4(v3);
  return a1;
}

uint64_t sub_10000A2A4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t sub_10000A2B4()
{
  unint64_t result = qword_10003EF90;
  if (!qword_10003EF90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003EF90);
  }
  return result;
}

uint64_t sub_10000A310()
{
  sub_100006550(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10000A35C()
{
  return sub_100009F28();
}

uint64_t sub_10000A364(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 144);
  uint64_t v3 = *(void *)(a1 + 160);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10000A150(v2);
  sub_10000A150(v3);
  return a1;
}

uint64_t sub_10000A3DC(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000A40C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000A438(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000A464(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 144);
  uint64_t v3 = *(void *)(a1 + 160);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_10000A2A4(v2);
  sub_10000A2A4(v3);
  return a1;
}

uint64_t sub_10000A4E0()
{
  return sub_100009FB8(*(void *)(v0 + 16));
}

uint64_t sub_10000A4FC(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000A528(uint64_t a1)
{
  return a1;
}

unint64_t sub_10000A558()
{
  unint64_t result = qword_10003EFA8;
  if (!qword_10003EFA8)
  {
    sub_100005324(&qword_10003EFB0);
    sub_100009490(&qword_10003EF80, &qword_10003EF70);
    sub_100009490(&qword_10003EF88, &qword_10003EF78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003EFA8);
  }
  return result;
}

char *sub_10000A61C(void *a1, char a2)
{
  id v5 = objc_allocWithZone((Class)UIWindow);
  uint64_t v6 = v2;
  id v7 = [v5 initWithWindowScene:a1];
  uint64_t v8 = OBJC_IVAR____TtC9CarCamera19CameraWindowManager_window;
  *(void *)&v6[OBJC_IVAR____TtC9CarCamera19CameraWindowManager_window] = v7;
  [v7 setAutoresizesSubviews:1];
  [*(id *)&v6[v8] setHidden:0];
  id v9 = *(id *)&v6[v8];
  [v9 makeKeyAndVisible];

  v19.receiver = v6;
  v19.super_class = (Class)type metadata accessor for CameraWindowManager();
  uint64_t v10 = (char *)[super init];
  uint64_t v11 = *(void **)&v10[OBJC_IVAR____TtC9CarCamera19CameraWindowManager_window];
  uint64_t v12 = (objc_class *)type metadata accessor for CameraViewController();
  uint64_t v13 = objc_allocWithZone(v12);
  v13[OBJC_IVAR____TtC9CarCamera20CameraViewController_presentationMode] = a2;
  v18.receiver = v13;
  v18.super_class = v12;
  uint64_t v14 = v10;
  id v15 = v11;
  id v16 = [super initWithNibName:0 bundle:0];
  [v15 setRootViewController:v16];

  return v14;
}

id sub_10000A7A0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CameraWindowManager();
  return [super dealloc];
}

uint64_t type metadata accessor for CameraWindowManager()
{
  return self;
}

uint64_t getEnumTagSinglePayload for CameraPresentationMode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE)
  {
    unsigned int v2 = a2 + 2;
    if (a2 + 2 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 2;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 2;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x10000A8B4);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 2;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  BOOL v8 = v7 >= 2;
  unsigned int v9 = v7 - 2;
  if (!v8) {
    unsigned int v9 = -1;
  }
  if (v9 + 1 >= 2) {
    return v9;
  }
  else {
    return 0;
  }
}

unsigned char *storeEnumTagSinglePayload for CameraPresentationMode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 2;
  if (a3 + 2 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xFE) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v7 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x10000A99CLL);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_10000A9C4(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 >= 2) {
    return v1 - 1;
  }
  else {
    return 0;
  }
}

unsigned char *sub_10000A9D8(unsigned char *result, int a2)
{
  if (a2) {
    *unint64_t result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraPresentationMode()
{
  return &type metadata for CameraPresentationMode;
}

void sub_10000AA8C(void *a1)
{
  self;
  uint64_t v3 = swift_dynamicCastObjCClass();
  if (v3)
  {
    int v4 = (void *)v3;
    id v5 = a1;
    id v6 = [v4 _FBSScene];
    id v7 = [v6 settings];

    self;
    uint64_t v8 = swift_dynamicCastObjCClass();

    if (v8) {
      uint64_t v9 = OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_clusterWindowManager;
    }
    else {
      uint64_t v9 = OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_consoleWindowManager;
    }
    oslog = *(NSObject **)(v1 + v9);
    *(void *)(v1 + v9) = 0;
  }
  else
  {
    if (qword_10003EAB8 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    sub_1000062F4(v10, (uint64_t)qword_100041A08);
    oslog = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v11, "[CameraSceneDelegate] Received an unknown scene, ignoring.", v12, 2u);
      swift_slowDealloc();
    }
  }
}

id sub_10000ACEC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CameraSceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for CameraSceneDelegate()
{
  return self;
}

void sub_10000AD90(void *a1, id a2)
{
  uint64_t v3 = v2;
  id v6 = [a2 role];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  CAFSignpostEmit_Scene();

  self;
  uint64_t v8 = swift_dynamicCastObjCClass();
  if (!v8) {
    goto LABEL_8;
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

LABEL_8:
      if (qword_10003EAB8 != -1) {
        swift_once();
      }
      uint64_t v18 = type metadata accessor for Logger();
      sub_1000062F4(v18, (uint64_t)qword_100041A08);
      oslog = Logger.logObject.getter();
      os_log_type_t v19 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(oslog, v19))
      {
        double v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)double v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, oslog, v19, "[CameraSceneDelegate] Received an unknown scene, ignoring.", v20, 2u);
        swift_slowDealloc();
      }
      goto LABEL_15;
    }
  }
  id v21 = [v9 _FBSScene];
  id v22 = [v21 settings];

  self;
  uint64_t v23 = swift_dynamicCastObjCClass();

  if (v23)
  {
    id v24 = objc_allocWithZone((Class)type metadata accessor for CameraWindowManager());
    id v25 = v10;
    long long v26 = sub_10000A61C(v9, 2);
    oslog = *(NSObject **)(v3 + OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_clusterWindowManager);
    *(void *)(v3 + OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_clusterWindowManager) = v26;

LABEL_15:

    return;
  }
  id v27 = [v9 _FBSScene];
  id v28 = [v27 settings];

  uint64_t v47 = (uint64_t)v28;
  sub_10000B2B0();
  sub_100005214((uint64_t *)&unk_10003F090);
  if (swift_dynamicCast())
  {

    [v9 _safeAreaInsetsForInterfaceOrientation:1];
    if (qword_10003EAB8 != -1)
    {
      *(double *)&os_log_t osloga = v29;
      double v43 = v30;
      swift_once();
      double v30 = v43;
      double v29 = *(double *)&osloga;
    }
    double v31 = v29 + v30;
    uint64_t v32 = type metadata accessor for Logger();
    sub_1000062F4(v32, (uint64_t)qword_100041A08);
    uint64_t v33 = Logger.logObject.getter();
    os_log_type_t v34 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v33, v34))
    {
      long long v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      *(_DWORD *)long long v35 = 136315138;
      uint64_t v36 = String.init<A>(describing:)();
      sub_10000E6A0(v36, v37, &v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "[CameraSceneDelegate] received UICarPlayApplicationSceneSettings - orientation %s", v35, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      char v38 = v31 != 0.0;
      swift_slowDealloc();
    }
    else
    {
      char v38 = v31 != 0.0;
    }

    id v39 = objc_allocWithZone((Class)type metadata accessor for CameraWindowManager());
    id v40 = v10;
    long long v41 = sub_10000A61C(v9, v38);
    long long v42 = *(void **)(v3 + OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_consoleWindowManager);
    *(void *)(v3 + OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_consoleWindowManager) = v41;
  }
  else
  {
  }
}

unint64_t sub_10000B2B0()
{
  unint64_t result = qword_10003F088;
  if (!qword_10003F088)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003F088);
  }
  return result;
}

uint64_t sub_10000B2F0(char a1)
{
  if ((a1 & 0x80) == 0)
  {
    if (a1 == 1)
    {
      static AnyTransition.scale.getter();
      static Animation.spring(response:dampingFraction:blendDuration:)();
      Animation.delay(_:)();
      swift_release();
      AnyTransition.animation(_:)();
      swift_release();
      swift_release();
      static AnyTransition.opacity.getter();
      static Animation.spring(response:dampingFraction:blendDuration:)();
      Animation.delay(_:)();
      swift_release();
LABEL_10:
      AnyTransition.animation(_:)();
      swift_release();
      swift_release();
      uint64_t v1 = AnyTransition.combined(with:)();
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  if ((a1 & 0x7F) == 0)
  {
LABEL_7:
    static AnyTransition.scale.getter();
    static Animation.spring(response:dampingFraction:blendDuration:)();
    Animation.delay(_:)();
    swift_release();
    goto LABEL_8;
  }
  if ((a1 & 0x7F) != 1)
  {
    static AnyTransition.opacity.getter();
    static Animation.spring(response:dampingFraction:blendDuration:)();
    AnyTransition.animation(_:)();
    swift_release();
    swift_release();
    static AnyTransition.scale.getter();
    static Animation.spring(response:dampingFraction:blendDuration:)();
    goto LABEL_10;
  }
  static AnyTransition.opacity.getter();
  static Animation.spring(response:dampingFraction:blendDuration:)();
LABEL_8:
  uint64_t v1 = AnyTransition.animation(_:)();
LABEL_11:
  uint64_t v2 = v1;
  swift_release();
  swift_release();
  return v2;
}

uint64_t sub_10000B508@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    swift_beginAccess();
    int v4 = *(void **)(v3 + 24);
    swift_getKeyPath();
    swift_getKeyPath();
    id v5 = v4;
    static Published.subscript.getter();
    swift_release();
    swift_release();
    if (!*((void *)&v44 + 1))
    {

      uint64_t v14 = *(void **)(v1 + 40);
      uint64_t v15 = *(void *)(v1 + 64);
      char v16 = *(unsigned char *)(v1 + 72);
      char v17 = *(void **)(v1 + 80);
      uint64_t v18 = *(void **)(v1 + 96);
      swift_retain();
      v14;
      sub_1000064F4(v15, v16);
      swift_retain();
      id v19 = v17;
      id v20 = v18;
      sub_10000B2F0(1);
      sub_10000B2F0(129);
      static AnyTransition.asymmetric(insertion:removal:)();
      swift_release();
      swift_release();
      sub_100005214(&qword_10003F160);
      sub_100005214(&qword_10003F168);
      sub_10000C700();
      sub_10000C85C(&qword_10003F1C8, &qword_10003F168, (void (*)(void))sub_10000C900);
      uint64_t result = _ConditionalContent<>.init(storage:)();
      long long v22 = (unint64_t)v44;
      long long v23 = v45;
      long long v24 = v46;
      long long v25 = v47;
      long long v26 = v48;
      long long v27 = v49;
      long long v28 = v50;
      char v29 = v51;
      uint64_t v30 = a1;
LABEL_10:
      *(_OWORD *)uint64_t v30 = v22;
      *(_OWORD *)(v30 + 16) = v23;
      *(_OWORD *)(v30 + 32) = v24;
      *(_OWORD *)(v30 + 48) = v25;
      *(_OWORD *)(v30 + 64) = v26;
      *(_OWORD *)(v30 + 80) = v27;
      *(_OWORD *)(v30 + 96) = v28;
      *(unsigned char *)(v30 + 112) = v29;
      return result;
    }
    id v6 = *((id *)&v44 + 1);
    sub_10000C67C(v44, *((void **)&v44 + 1), v45, *((uint64_t *)&v45 + 1), v46, SBYTE8(v46), (void *)v47, *((uint64_t *)&v47 + 1), (void *)v48);
    uint64_t v7 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
    uint64_t v9 = v8;

    long long v52 = *(_OWORD *)(v1 + 32);
    id v10 = *((id *)&v52 + 1);
    uint64_t v11 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
    uint64_t v13 = v12;
    sub_10000C008((uint64_t)&v52);
    if (v7 == v11 && v9 == v13)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v31 & 1) == 0)
      {
LABEL_9:
        uint64_t v30 = a1;
        sub_100005214(&qword_10003F160);
        sub_100005214(&qword_10003F168);
        sub_10000C700();
        sub_10000C85C(&qword_10003F1C8, &qword_10003F168, (void (*)(void))sub_10000C900);
        uint64_t result = _ConditionalContent<>.init(storage:)();
        long long v22 = v44;
        long long v23 = v45;
        long long v24 = v46;
        long long v25 = v47;
        long long v26 = v48;
        long long v27 = v49;
        long long v28 = v50;
        char v29 = v51;
        goto LABEL_10;
      }
    }
    uint64_t v32 = *(void *)v2;
    char v33 = *(unsigned char *)(v2 + 8);
    sub_1000064F4(*(void *)v2, v33);
    sub_10000E010(v32, v33);
    sub_100006550(v32, v33);
    os_log_type_t v34 = (_OWORD *)swift_allocObject();
    long long v35 = *(_OWORD *)(v2 + 80);
    v34[5] = *(_OWORD *)(v2 + 64);
    v34[6] = v35;
    v34[7] = *(_OWORD *)(v2 + 96);
    *(_OWORD *)((char *)v34 + 121) = *(_OWORD *)(v2 + 105);
    long long v36 = *(_OWORD *)(v2 + 16);
    v34[1] = *(_OWORD *)v2;
    v34[2] = v36;
    long long v37 = *(_OWORD *)(v2 + 48);
    v34[3] = *(_OWORD *)(v2 + 32);
    v34[4] = v37;
    sub_10000CA74(v2);
    static HorizontalAlignment.center.getter();
    static VerticalAlignment.center.getter();
    sub_10000B2F0(2);
    sub_10000B2F0(130);
    static AnyTransition.asymmetric(insertion:removal:)();
    swift_release();
    swift_release();
    __asm { FMOV            V0.2D, #2.0 }
    goto LABEL_9;
  }
  type metadata accessor for ButtonBarLayout(0);
  sub_10000C61C();
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

uint64_t sub_10000BA04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if (v6)
    {
      swift_getKeyPath();
      sub_100005214(&qword_10003F510);
      sub_100009490(&qword_10003EED0, &qword_10003F510);
      sub_10000C9A0();
      ForEach<>.init(_:id:content:)();
      uint64_t v3 = sub_100005214(&qword_10003F1E8);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(a2, 0, 1, v3);
    }
    else
    {
      uint64_t v5 = sub_100005214(&qword_10003F1E8);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(a2, 1, 1, v5);
    }
  }
  else
  {
    type metadata accessor for ButtonBarLayout(0);
    sub_10000C61C();
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

id sub_10000BBD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 40);
  id v12 = *(id *)(a1 + 64);
  char v5 = *(unsigned char *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 80);
  char v7 = *(unsigned char *)(a1 + 88);
  *(void *)a2 = *(void *)a1;
  *(void *)(a2 + 8) = v2;
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(void *)(a2 + 32) = v3;
  *(unsigned char *)(a2 + 40) = v4;
  long long v11 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 48) = v11;
  *(void *)(a2 + 64) = v12;
  *(unsigned char *)(a2 + 72) = v5;
  *(void *)(a2 + 80) = v6;
  *(unsigned char *)(a2 + 88) = v7;
  swift_retain();
  id v8 = v2;
  sub_1000064F4(v3, v4);
  swift_retain();
  id v9 = (id)v11;

  return v12;
}

uint64_t sub_10000BC90@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B508(a1);
}

void *sub_10000BCE4()
{
  uint64_t v1 = *(void **)(v0 + 64);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = (long long *)v0;
  uint64_t v3 = qword_10003EAB8;
  id v4 = v1;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_1000062F4(v5, (uint64_t)qword_100041A08);
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "subItems", v8, 2u);
    swift_slowDealloc();
  }

  long long v42 = *v2;
  id v9 = *((id *)&v42 + 1);
  uint64_t v10 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
  unint64_t v12 = v11;
  sub_10000C008((uint64_t)&v42);
  uint64_t v32 = v4;
  uint64_t v13 = sub_100017EC0(v10, v12);
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(v13 + 16);
  if (v14)
  {
    uint64_t v15 = v13 + 64;
    char v16 = _swiftEmptyArrayStorage;
    do
    {
      char v17 = *(void **)(v15 - 24);
      uint64_t v40 = *(void *)(v15 - 32);
      long long v41 = v16;
      uint64_t v18 = *(void *)(v15 - 16);
      uint64_t v39 = *(void *)(v15 - 8);
      uint64_t v19 = *(void *)v15;
      char v20 = *(unsigned char *)(v15 + 8);
      id v21 = *(void **)(v15 + 16);
      uint64_t v36 = *(void *)(v15 + 24);
      long long v22 = *(void **)(v15 + 32);
      uint64_t v23 = *(void *)(v15 + 48);
      char v34 = *(unsigned char *)(v15 + 56);
      char v35 = *(unsigned char *)(v15 + 40);
      swift_retain();
      id v24 = v17;
      sub_1000064F4(v19, v20);
      swift_retain();
      id v25 = v24;
      char v38 = v21;
      id v33 = v21;
      long long v37 = v22;
      id v26 = v22;
      long long v27 = (void *)CAFCameraButtonObservable.observed.getter();

      LOBYTE(v22) = [v27 hidden];
      if (v22)
      {
        swift_release();

        sub_100006550(v19, v20);
        swift_release();

        char v16 = v41;
      }
      else
      {
        char v16 = v41;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_10000C034(0, v41[2] + 1, 1);
          char v16 = v41;
        }
        unint64_t v29 = v16[2];
        unint64_t v28 = v16[3];
        if (v29 >= v28 >> 1)
        {
          sub_10000C034(v28 > 1, v29 + 1, 1);
          char v16 = v41;
        }
        v16[2] = v29 + 1;
        uint64_t v30 = &v16[12 * v29];
        v30[4] = v40;
        v30[5] = v25;
        v30[6] = v18;
        v30[7] = v39;
        v30[8] = v19;
        *((unsigned char *)v30 + 72) = v20;
        v30[10] = v38;
        v30[11] = v36;
        v30[12] = v37;
        *((unsigned char *)v30 + 104) = v35;
        v30[14] = v23;
        *((unsigned char *)v30 + 120) = v34;
      }
      v15 += 96;
      --v14;
    }
    while (v14);
  }
  else
  {
    char v16 = _swiftEmptyArrayStorage;
  }

  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_10000C008(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000C034(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000C054(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10000C054(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100005214(&qword_10003EDF0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 96);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  size_t v14 = 96 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t destroy for CameraActionButtonAnimatable(uint64_t a1)
{
  sub_100006550(*(void *)a1, *(unsigned char *)(a1 + 8));
  swift_release();

  swift_release();
  sub_100006550(*(void *)(a1 + 64), *(unsigned char *)(a1 + 72));

  return swift_release();
}

uint64_t initializeWithCopy for CameraActionButtonAnimatable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1000064F4(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  int64_t v7 = *(void **)(a2 + 40);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v6;
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  char v9 = *(unsigned char *)(a2 + 72);
  swift_retain();
  id v10 = v7;
  swift_retain();
  sub_1000064F4(v8, v9);
  *(void *)(a1 + 64) = v8;
  *(unsigned char *)(a1 + 72) = v9;
  size_t v11 = *(void **)(a2 + 80);
  uint64_t v12 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = v11;
  *(void *)(a1 + 88) = v12;
  uint64_t v13 = *(void **)(a2 + 96);
  *(void *)(a1 + 96) = v13;
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  id v14 = v11;
  id v15 = v13;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CameraActionButtonAnimatable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1000064F4(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_100006550(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v8 = *(void **)(a2 + 40);
  char v9 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v8;
  id v10 = v8;

  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  char v12 = *(unsigned char *)(a2 + 72);
  sub_1000064F4(v11, v12);
  uint64_t v13 = *(void *)(a1 + 64);
  char v14 = *(unsigned char *)(a1 + 72);
  *(void *)(a1 + 64) = v11;
  *(unsigned char *)(a1 + 72) = v12;
  sub_100006550(v13, v14);
  id v15 = *(void **)(a1 + 80);
  char v16 = *(void **)(a2 + 80);
  *(void *)(a1 + 80) = v16;
  id v17 = v16;

  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v18 = *(void **)(a1 + 96);
  uint64_t v19 = *(void **)(a2 + 96);
  *(void *)(a1 + 96) = v19;
  id v20 = v19;

  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  return a1;
}

__n128 initializeWithTake for CameraActionButtonAnimatable(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(_OWORD *)(a1 + 105) = *(long long *)((char *)a2 + 105);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for CameraActionButtonAnimatable(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_100006550(v6, v7);
  *(void *)(a1 + 16) = a2[2];
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);

  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
  swift_release();
  char v8 = *((unsigned char *)a2 + 72);
  uint64_t v9 = *(void *)(a1 + 64);
  char v10 = *(unsigned char *)(a1 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 7);
  *(unsigned char *)(a1 + 72) = v8;
  sub_100006550(v9, v10);
  uint64_t v11 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = a2[10];

  char v12 = *(void **)(a1 + 96);
  uint64_t v13 = a2[12];
  *(void *)(a1 + 88) = a2[11];
  *(void *)(a1 + 96) = v13;

  *(unsigned char *)(a1 + 104) = *((unsigned char *)a2 + 104);
  *(void *)(a1 + 112) = a2[14];
  swift_release();
  *(unsigned char *)(a1 + 120) = *((unsigned char *)a2 + 120);
  return a1;
}

uint64_t getEnumTagSinglePayload for CameraActionButtonAnimatable(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 121)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CameraActionButtonAnimatable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 120) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 121) = 1;
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
    *(unsigned char *)(result + 121) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraActionButtonAnimatable()
{
  return &type metadata for CameraActionButtonAnimatable;
}

uint64_t sub_10000C600()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000C61C()
{
  unint64_t result = qword_10003EE00;
  if (!qword_10003EE00)
  {
    type metadata accessor for ButtonBarLayout(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003EE00);
  }
  return result;
}

uint64_t sub_10000C67C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, void *a7, uint64_t a8, void *a9)
{
  if (a2)
  {

    swift_release();
    sub_100006550(a5, a6 & 1);

    return swift_release();
  }
  return result;
}

unint64_t sub_10000C700()
{
  unint64_t result = qword_10003F170;
  if (!qword_10003F170)
  {
    sub_100005324(&qword_10003F160);
    sub_10000C85C(&qword_10003F178, &qword_10003F180, (void (*)(void))sub_10000C798);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F170);
  }
  return result;
}

unint64_t sub_10000C798()
{
  unint64_t result = qword_10003F188;
  if (!qword_10003F188)
  {
    sub_100005324(&qword_10003F190);
    sub_100009490(&qword_10003F198, &qword_10003F1A0);
    sub_100009490(&qword_10003F1A8, &qword_10003F1B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F188);
  }
  return result;
}

uint64_t sub_10000C85C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005324(a2);
    a3();
    sub_100009490(&qword_10003F1B8, &qword_10003F1C0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000C900()
{
  unint64_t result = qword_10003F1D0;
  if (!qword_10003F1D0)
  {
    sub_100005324(&qword_10003F1D8);
    sub_10000C9A0();
    sub_100009490(&qword_10003F1A8, &qword_10003F1B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F1D0);
  }
  return result;
}

unint64_t sub_10000C9A0()
{
  unint64_t result = qword_10003F1E0;
  if (!qword_10003F1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F1E0);
  }
  return result;
}

uint64_t sub_10000C9F4()
{
  sub_100006550(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
  swift_release();

  swift_release();
  sub_100006550(*(void *)(v0 + 80), *(unsigned char *)(v0 + 88));

  swift_release();

  return _swift_deallocObject(v0, 137, 7);
}

uint64_t sub_10000CA6C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000BA04(v1 + 16, a1);
}

uint64_t sub_10000CA74(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 64);
  char v4 = *(unsigned char *)(a1 + 72);
  char v5 = *(void **)(a1 + 80);
  uint64_t v6 = *(void **)(a1 + 96);
  sub_1000064F4(*(void *)a1, *(unsigned char *)(a1 + 8));
  swift_retain();
  swift_retain();
  id v7 = v2;
  sub_1000064F4(v3, v4);
  swift_retain();
  id v8 = v5;
  id v9 = v6;
  return a1;
}

unint64_t sub_10000CB20()
{
  unint64_t result = qword_10003F1F0;
  if (!qword_10003F1F0)
  {
    sub_100005324(&qword_10003F1F8);
    sub_10000C700();
    sub_10000C85C(&qword_10003F1C8, &qword_10003F168, (void (*)(void))sub_10000C900);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F1F0);
  }
  return result;
}

id sub_10000CCA4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CameraAppDelegate();
  return [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for CameraAppDelegate();
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

uint64_t type metadata accessor for CameraAppDelegate()
{
  return self;
}

unint64_t sub_10000CD8C()
{
  unint64_t result = qword_10003F290;
  if (!qword_10003F290)
  {
    type metadata accessor for LaunchOptionsKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F290);
  }
  return result;
}

void sub_10000CDE4()
{
  id v0 = [self mainBundle];
  id v1 = [v0 bundleIdentifier];

  if (v1)
  {
    uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v4 = v3;

    qword_1000419E8 = v2;
    unk_1000419F0 = v4;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10000CE70(uint64_t a1)
{
  return sub_10000CF68(a1, 0x72656D6143726143, 0xEF73746E65764561, &static OS_os_log.carevents);
}

uint64_t *OS_os_log.carevents.unsafeMutableAddressor()
{
  if (qword_10003EAA8 != -1) {
    swift_once();
  }
  return &static OS_os_log.carevents;
}

id static OS_os_log.carevents.getter()
{
  if (qword_10003EAA8 != -1) {
    swift_once();
  }
  id v0 = (void *)static OS_os_log.carevents;

  return v0;
}

uint64_t sub_10000CF44(uint64_t a1)
{
  return sub_10000CF68(a1, 0xD000000000000012, 0x800000010002DDB0, &qword_100041A00);
}

uint64_t sub_10000CF68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_10000D154();
  if (qword_10003EAA0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  *a4 = result;
  return result;
}

uint64_t sub_10000D00C(uint64_t a1)
{
  return sub_10000D064(a1, qword_100041A08, &qword_10003EAA8, (id *)&static OS_os_log.carevents);
}

uint64_t sub_10000D038(uint64_t a1)
{
  return sub_10000D064(a1, qword_100041A20, &qword_10003EAB0, (id *)&qword_100041A00);
}

uint64_t sub_10000D064(uint64_t a1, uint64_t *a2, void *a3, id *a4)
{
  uint64_t v7 = type metadata accessor for Logger();
  sub_10000D0F0(v7, a2);
  sub_1000062F4(v7, (uint64_t)a2);
  if (*a3 != -1) {
    swift_once();
  }
  id v8 = *a4;
  return Logger.init(_:)();
}

uint64_t *sub_10000D0F0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_10000D154()
{
  unint64_t result = qword_10003F2A0;
  if (!qword_10003F2A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003F2A0);
  }
  return result;
}

uint64_t destroy for ButtonBarView(uint64_t a1)
{
  sub_100006550(*(void *)a1, *(unsigned char *)(a1 + 8));

  return swift_release();
}

uint64_t _s9CarCamera13ButtonBarViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1000064F4(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ButtonBarView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1000064F4(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_100006550(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for ButtonBarView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ButtonBarView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_100006550(v6, v7);
  *(void *)(a1 + 16) = a2[2];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ButtonBarView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ButtonBarView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ButtonBarView()
{
  return &type metadata for ButtonBarView;
}

uint64_t sub_10000D3A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000D3BC@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v32 = a3;
  uint64_t v41 = a4;
  uint64_t v35 = type metadata accessor for TapGesture();
  uint64_t v36 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  id v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_100005214(&qword_10003F2A8);
  uint64_t v39 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  id v33 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_100005214(&qword_10003F2B0);
  uint64_t v37 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  char v34 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000DEB0(a3 + 32, (uint64_t)v42);
  uint64_t v11 = v45;
  sub_10000DF14(v42, v44);
  uint64_t v12 = type metadata accessor for ModifiedContent();
  v50[3] = v12;
  unint64_t v13 = sub_10000DF58();
  uint64_t v48 = v11;
  unint64_t v49 = v13;
  v50[4] = swift_getWitnessTable();
  char v14 = sub_10000DFAC(v50);
  uint64_t v15 = View.allowsHitTesting(_:)();
  __n128 v16 = __chkstk_darwin(v15);
  (*(void (**)(char *, uint64_t *, uint64_t, __n128))(v18 + 16))((char *)&v31 - v17, v14, v12, v16);
  uint64_t v19 = AnyView.init<A>(_:)();
  LOBYTE(v11) = a2 & 1;
  sub_1000064F4(a1, a2 & 1);
  sub_10000E010(a1, a2 & 1);
  sub_100006550(a1, a2 & 1);
  sub_1000064F4(a1, a2 & 1);
  sub_10000E010(a1, a2 & 1);
  sub_100006550(a1, a2 & 1);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v20 = v50[5];
  LOBYTE(v12) = v51;
  uint64_t v21 = v52;
  LOBYTE(v14) = v53;
  uint64_t v23 = v54;
  uint64_t v22 = v55;
  sub_10000E930((uint64_t)v50);
  sub_10000E930((uint64_t)v42);
  v42[0] = v19;
  v42[1] = v20;
  char v43 = v12;
  uint64_t v44 = v21;
  LOBYTE(v45) = (_BYTE)v14;
  uint64_t v46 = v23;
  uint64_t v47 = v22;
  TapGesture.init(count:)();
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = a1;
  *(unsigned char *)(v24 + 24) = v11;
  *(void *)(v24 + 32) = v32;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = sub_10000E268;
  *(void *)(v25 + 24) = v24;
  sub_1000064F4(a1, v11);
  swift_retain();
  id v26 = v33;
  uint64_t v27 = v35;
  Gesture.onEnded(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v27);
  static GestureMask.all.getter();
  sub_100005214(&qword_10003F2C0);
  sub_10000E2E0();
  sub_10000E354();
  unint64_t v28 = v34;
  uint64_t v29 = v40;
  View.simultaneousGesture<A>(_:including:)();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v26, v29);
  swift_release();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v37 + 32))(v41, v28, v38);
}

uint64_t sub_10000D928()
{
  return swift_release();
}

void sub_10000D9A0(uint64_t a1, char a2, Swift::String *a3)
{
  object = (void (*)(Swift::String *))a3[5]._object;
  if (object)
  {
    uint64_t v7 = qword_10003EAC0;
    swift_retain();
    if (v7 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_1000062F4(v8, (uint64_t)qword_100041A20);
    char v9 = a2 & 1;
    sub_1000064F4(a1, a2 & 1);
    swift_retain();
    sub_1000064F4(a1, a2 & 1);
    swift_retain();
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315138;
      uint64_t v22 = v21;
      swift_retain();
      _StringGuts.grow(_:)(21);
      swift_bridgeObjectRelease();
      String.append(_:)(a3[1]);
      v13._countAndFlagsBits = 62;
      v13._object = (void *)0xE100000000000000;
      String.append(_:)(v13);
      swift_release();
      sub_10000E6A0(0xD000000000000012, 0x800000010002DDD0, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100006550(a1, v9);
      swift_release();
      sub_100006550(a1, v9);
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[ButtonBarView] performing action [%s]", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_100006550(a1, v9);
      swift_release();
      sub_100006550(a1, v9);

      swift_release();
    }
    object(a3);
    sub_10000A2A4((uint64_t)object);
  }
  else
  {
    if (qword_10003EAC0 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    sub_1000062F4(v14, (uint64_t)qword_100041A20);
    swift_retain();
    char v15 = a2 & 1;
    sub_1000064F4(a1, a2 & 1);
    swift_retain();
    sub_1000064F4(a1, a2 & 1);
    __n128 v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136315138;
      uint64_t v22 = v19;
      swift_retain();
      _StringGuts.grow(_:)(21);
      swift_bridgeObjectRelease();
      String.append(_:)(a3[1]);
      v20._countAndFlagsBits = 62;
      v20._object = (void *)0xE100000000000000;
      String.append(_:)(v20);
      swift_release();
      sub_10000E6A0(0xD000000000000012, 0x800000010002DDD0, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100006550(a1, v15);
      swift_release();
      sub_100006550(a1, v15);
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "[ButtonBarView ] performing action false ❌ [%s]", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_100006550(a1, v15);
      swift_release();
      sub_100006550(a1, v15);

      swift_release();
    }
  }
}

uint64_t sub_10000DE98@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D3BC(*(void *)v1, *(unsigned char *)(v1 + 8), *(void *)(v1 + 16), a1);
}

uint64_t sub_10000DEB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_10000DF14(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000DF58()
{
  unint64_t result = qword_10003F2B8;
  if (!qword_10003F2B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F2B8);
  }
  return result;
}

uint64_t *sub_10000DFAC(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10000E010(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = static os_log_type_t.fault.getter();
  char v9 = static Log.runtimeIssuesLog.getter();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v11 = 136315138;
    uint64_t v13 = sub_10000E6A0(0x6F4374756F79614CLL, 0xEC0000006769666ELL, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath();
  sub_100006550(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_10000E224()
{
  sub_100006550(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000E268()
{
  return sub_10000D928();
}

uint64_t sub_10000E280()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000E2B8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_10000E2E0()
{
  unint64_t result = qword_10003F2C8;
  if (!qword_10003F2C8)
  {
    sub_100005324(&qword_10003F2C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F2C8);
  }
  return result;
}

unint64_t sub_10000E354()
{
  unint64_t result = qword_10003F2D0;
  if (!qword_10003F2D0)
  {
    sub_100005324(&qword_10003F2A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F2D0);
  }
  return result;
}

void sub_10000E3B0()
{
  sub_10000D9A0(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24), *(Swift::String **)(v0 + 32));
}

uint64_t sub_10000E3EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005214((uint64_t *)&unk_10003F2E0);
  __chkstk_darwin(v8);
  os_log_type_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000EE24(v2, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = type metadata accessor for ColorScheme();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = static os_log_type_t.fault.getter();
    uint64_t v14 = static Log.runtimeIssuesLog.getter();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      __n128 v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v18[1] = a1;
      uint64_t v19 = v17;
      *(_DWORD *)__n128 v16 = 136315138;
      v18[2] = sub_10000E6A0(0x686353726F6C6F43, 0xEB00000000656D65, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_10000E6A0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000E774(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000E980((uint64_t)v12, *a3);
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
      sub_10000E980((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000E930((uint64_t)v12);
  return v7;
}

uint64_t sub_10000E774(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000E9DC(a5, a6);
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

uint64_t sub_10000E930(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000E980(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000E9DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000EA74(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000EC54(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000EC54(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000EA74(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000EBEC(v2, 0);
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

void *sub_10000EBEC(uint64_t a1, uint64_t a2)
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
  sub_100005214(&qword_10003F2D8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000EC54(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005214(&qword_10003F2D8);
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
  os_log_type_t v13 = a4 + 32;
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

uint64_t sub_10000EDA4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000EE24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005214((uint64_t *)&unk_10003F2E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000EE8C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();

  return swift_release();
}

uint64_t sub_10000EF04()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10000EF78()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

double sub_10000EFEC@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 64) = v7;
  *(void *)(a1 + 80) = v8;
  *(unsigned char *)(a1 + 88) = v9;
  return result;
}

unint64_t sub_10000F088(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    long long v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005214(&qword_10003F568);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  long long v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v26 = v2 + 64;
  swift_retain();
  long long v5 = (uint64_t *)(a1 + 72);
  uint64_t v27 = v3;
  while (1)
  {
    uint64_t v28 = v4;
    uint64_t v6 = *(v5 - 4);
    long long v7 = (void *)*(v5 - 2);
    uint64_t v32 = *v5;
    uint64_t v33 = *(v5 - 3);
    uint64_t v8 = v5[1];
    char v9 = *((unsigned char *)v5 + 16);
    uint64_t v10 = (void *)v5[3];
    uint64_t v31 = v5[4];
    size_t v11 = (void *)v5[5];
    uint64_t v12 = v5[7];
    char v29 = *((unsigned char *)v5 + 64);
    char v30 = *((unsigned char *)v5 + 48);
    uint64_t v34 = *(v5 - 1);
    uint64_t v35 = *(v5 - 5);
    swift_retain();
    swift_bridgeObjectRetain();
    id v13 = v7;
    char v14 = v9;
    char v15 = v9;
    uint64_t v16 = v12;
    sub_1000064F4(v8, v15);
    swift_retain();
    id v17 = v10;
    id v18 = v11;
    long long v3 = v27;
    unint64_t result = sub_10001301C(v35, v6);
    if (v20) {
      break;
    }
    *(void *)(v26 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v21 = (uint64_t *)(v27[6] + 16 * result);
    uint64_t *v21 = v35;
    v21[1] = v6;
    uint64_t v22 = v27[7] + 96 * result;
    *(void *)uint64_t v22 = v33;
    *(void *)(v22 + 8) = v13;
    *(void *)(v22 + 16) = v34;
    *(void *)(v22 + 24) = v32;
    *(void *)(v22 + 32) = v8;
    *(unsigned char *)(v22 + 40) = v14;
    *(void *)(v22 + 48) = v10;
    *(void *)(v22 + 56) = v31;
    *(void *)(v22 + 64) = v11;
    *(unsigned char *)(v22 + 72) = v30;
    *(void *)(v22 + 80) = v16;
    *(unsigned char *)(v22 + 88) = v29;
    uint64_t v23 = v27[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_11;
    }
    v27[2] = v25;
    v5 += 14;
    uint64_t v4 = v28 - 1;
    if (v28 == 1)
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

unint64_t sub_10000F274(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005214(&qword_10003F560);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    long long v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_10001301C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    size_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
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

id sub_10000F390(void *a1)
{
  uint64_t v2 = v1;
  id v50 = a1;
  uint64_t v3 = sub_100005214(&qword_10003F538);
  uint64_t v48 = *(void *)(v3 - 8);
  uint64_t v49 = v3;
  __chkstk_darwin(v3);
  uint64_t v47 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005214(&qword_10003F540);
  uint64_t v45 = *(void *)(v5 - 8);
  uint64_t v46 = v5;
  __chkstk_darwin(v5);
  uint64_t v44 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_100005214(&qword_10003F548);
  uint64_t v7 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  char v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005214(&qword_10003F550);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  BOOL v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100005214(&qword_10003F500);
  uint64_t v15 = __chkstk_darwin(v14);
  id v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v43 - v18;
  char v20 = &v2[OBJC_IVAR____TtC9CarCamera11CameraModel__cameraCloseButton];
  uint64_t v21 = type metadata accessor for CameraCloseButton(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v19, 1, 1, v21);
  sub_10001467C((uint64_t)v19, (uint64_t)v17);
  uint64_t v22 = v2;
  Published.init(initialValue:)();
  sub_1000146E4((uint64_t)v19);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v20, v13, v10);
  uint64_t v23 = &v22[OBJC_IVAR____TtC9CarCamera11CameraModel__visibleButtons];
  *(void *)&long long v52 = _swiftEmptyArrayStorage;
  sub_100005214(&qword_10003F510);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v23, v9, v43);
  BOOL v24 = &v22[OBJC_IVAR____TtC9CarCamera11CameraModel__identifierChanged];
  long long v52 = 0uLL;
  sub_100005214(&qword_10003F520);
  uint64_t v25 = v44;
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v24, v25, v46);
  uint64_t v26 = &v22[OBJC_IVAR____TtC9CarCamera11CameraModel__submenuParent];
  long long v55 = 0u;
  memset(v56, 0, sizeof(v56));
  long long v53 = 0u;
  long long v54 = 0u;
  long long v52 = 0u;
  sub_100005214(&qword_10003F530);
  uint64_t v27 = v47;
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v26, v27, v49);
  *(void *)&v22[OBJC_IVAR____TtC9CarCamera11CameraModel_camera] = 0;
  uint64_t v28 = OBJC_IVAR____TtC9CarCamera11CameraModel_buttonDict;
  *(void *)&v22[v28] = sub_10000F088((uint64_t)_swiftEmptyArrayStorage);
  *(void *)&v22[OBJC_IVAR____TtC9CarCamera11CameraModel_topButtons] = _swiftEmptyArrayStorage;
  uint64_t v29 = OBJC_IVAR____TtC9CarCamera11CameraModel_serviceDict;
  *(void *)&v22[v29] = sub_10000F274((uint64_t)_swiftEmptyArrayStorage);
  *(void *)&v22[OBJC_IVAR____TtC9CarCamera11CameraModel_menuGroups] = _swiftEmptyArrayStorage;
  v22[OBJC_IVAR____TtC9CarCamera11CameraModel_hasEmittedFinalizedSignpost] = 0;
  v22[OBJC_IVAR____TtC9CarCamera11CameraModel_hasEmittedInstantOnSignpost] = 0;
  char v30 = (uint64_t *)&v22[OBJC_IVAR____TtC9CarCamera11CameraModel__carObservable];
  swift_beginAccess();
  type metadata accessor for CAFCarObservable();
  sub_100014C14(&qword_10003F558, (void (*)(uint64_t))&type metadata accessor for CAFCarObservable);
  id v31 = v50;
  *char v30 = ObservedObject.init(wrappedValue:)();
  v30[1] = v32;
  swift_endAccess();

  uint64_t v33 = (objc_class *)type metadata accessor for CameraModel();
  v51.receiver = v22;
  v51.super_class = v33;
  id v34 = [super init];
  uint64_t v35 = (void *)CAFCarObservable.observed.getter();
  [v35 registerObserver:v34];

  uint64_t v36 = (void *)dispatch thunk of CAFCarObservable.automakerExteriorCamera.getter();
  if (v36)
  {
    uint64_t v37 = v36;
    sub_100010D44(v36);
  }
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v38 = type metadata accessor for Logger();
  sub_1000062F4(v38, (uint64_t)qword_100041A08);
  uint64_t v39 = Logger.logObject.getter();
  os_log_type_t v40 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v41 = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, v40, "[CAMERAMODEL] CameraModel did init", v41, 2u);
    swift_slowDealloc();
  }

  return v34;
}

uint64_t sub_10000FAB8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_100005214(&qword_10003F500);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = &v24[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  uint64_t v10 = &v24[-v9];
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_1000062F4(v11, (uint64_t)qword_100041A08);
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 67109120;
    int v25 = a2 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "[CAMERAMODEL] CAFCameraGeneral didUpdateUserDismissible %{BOOL}d", v14, 8u);
    swift_slowDealloc();
  }

  if (a2)
  {
    sub_100014B70(0, &qword_10003F578);
    sub_100014BAC();
    CAFObserved<>.observable.getter();
    type metadata accessor for LayoutSize();
    sub_100014C14(&qword_10003EDF8, (void (*)(uint64_t))type metadata accessor for LayoutSize);
    uint64_t v15 = EnvironmentObject.init()();
    uint64_t v17 = v16;
    type metadata accessor for CAFCameraGeneralObservable();
    sub_100014C14((unint64_t *)&unk_10003F590, (void (*)(uint64_t))&type metadata accessor for CAFCameraGeneralObservable);
    *(void *)uint64_t v10 = ObservedObject.init(wrappedValue:)();
    *((void *)v10 + 1) = v18;
    *((void *)v10 + 2) = v15;
    *((void *)v10 + 3) = v17;
    v24[15] = 0;
    State.init(wrappedValue:)();
    uint64_t v19 = v26;
    v10[32] = v25;
    *((void *)v10 + 5) = v19;
    char v20 = (int *)type metadata accessor for CameraCloseButton(0);
    UUID.init()();
    v10[v20[8]] = 0;
    v10[v20[9]] = 0;
    v10[v20[10]] = 0;
    (*(void (**)(unsigned char *, void, uint64_t, int *))(*((void *)v20 - 1) + 56))(v10, 0, 1, v20);
  }
  else
  {
    uint64_t v21 = type metadata accessor for CameraCloseButton(0);
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v10, 1, 1, v21);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10001467C((uint64_t)v10, (uint64_t)v7);
  id v22 = v3;
  static Published.subscript.setter();
  return sub_1000146E4((uint64_t)v10);
}

uint64_t sub_10000FF3C(void *a1)
{
  uint64_t v2 = v1;
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_1000062F4(v4, (uint64_t)qword_100041A08);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "[CAMERAMODEL] CAFCameraButtonObserver didUpdateHidden %{BOOL}d", v7, 8u);
    swift_slowDealloc();
  }

  sub_1000122C8();
  id v8 = [a1 identifier];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  swift_getKeyPath();
  swift_getKeyPath();
  id v9 = v2;
  return static Published.subscript.setter();
}

uint64_t sub_100010148(void *a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = qword_10003EAB8;
    swift_bridgeObjectRetain();
    if (v3 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_1000062F4(v4, (uint64_t)qword_100041A08);
    id v5 = a1;
    swift_bridgeObjectRetain();
    id v6 = v5;
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315394;
      id v10 = [v6 identifier];
      uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v13 = v12;

      sub_10000E6A0(v11, v13, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v9 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v14 = Array.description.getter();
      unint64_t v16 = v15;
      swift_bridgeObjectRelease();
      sub_10000E6A0(v14, v16, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[CAMERAMODEL] CAFCameraButtonObserver %s didUpdateChildrenIdentifiers %s", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  return sub_1000103C0();
}

uint64_t sub_1000103C0()
{
  uint64_t v1 = v0;
  if (qword_10003EAB8 != -1) {
    goto LABEL_40;
  }
  while (1)
  {
    uint64_t v2 = type metadata accessor for Logger();
    sub_1000062F4(v2, (uint64_t)qword_100041A08);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v3, v4))
    {
      id v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[CAMERAMODEL] updateArrangment", v5, 2u);
      swift_slowDealloc();
    }

    id v6 = (unint64_t *)(v1 + OBJC_IVAR____TtC9CarCamera11CameraModel_menuGroups);
    swift_beginAccess();
    unint64_t v7 = *v6;
    if (v7 >> 62) {
      break;
    }
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    uint64_t v59 = v1;
    if (!v8) {
      goto LABEL_42;
    }
LABEL_6:
    char v78 = _swiftEmptyArrayStorage;
    uint64_t v64 = v8;
    uint64_t result = sub_10000C034(0, v8 & ~(v8 >> 63), 0);
    uint64_t v10 = v8;
    if (v8 < 0)
    {
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
      return result;
    }
    uint64_t v11 = 0;
    unint64_t v12 = v78;
    unint64_t v62 = v7 + 32;
    unint64_t v63 = v7 & 0xC000000000000001;
    while (v11 != v10)
    {
      char v65 = v12;
      uint64_t v66 = v11;
      if (v63) {
        unint64_t v13 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        unint64_t v13 = (char *)*(id *)(v62 + 8 * v11);
      }
      uint64_t v14 = v13;
      unint64_t v15 = &v13[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent];
      sub_1000189FC(*(void *)&v13[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent], *(void *)&v13[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent + 8], (uint64_t)v79);
      sub_100014C5C((uint64_t)v79, (uint64_t)&v103);
      if (*((void *)&v103 + 1)
        && (long long v104 = v103,
            sub_100014CC4((uint64_t)&v104),
            sub_100014CF0((uint64_t)v79),
            __int16 v16 = dispatch thunk of CAFCameraButtonObservable.selectedEntryIndex.getter(),
            sub_10000C008((uint64_t)&v104),
            (v16 & 0x100) == 0)
        && (_BYTE)v16)
      {
        uint64_t v17 = *(void *)&v14[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_childrenIdents];
        uint64_t v1 = *(void *)(v17 + 16);
        if (v1)
        {
          uint64_t v60 = v15;
          uint64_t v61 = v14;
          long long v67 = v14;
          swift_bridgeObjectRetain();
          uint64_t v18 = (unint64_t *)(v17 + 40);
          uint64_t v19 = _swiftEmptyArrayStorage;
          do
          {
            uint64_t v22 = *(v18 - 1);
            unint64_t v21 = *v18;
            swift_bridgeObjectRetain();
            sub_1000189FC(v22, v21, (uint64_t)v82);
            uint64_t v24 = v82[0];
            uint64_t v23 = v82[1];
            uint64_t v25 = v82[2];
            uint64_t v26 = v82[3];
            uint64_t v27 = v82[4];
            uint64_t v70 = v85;
            uint64_t v71 = v84;
            char v68 = v83;
            uint64_t v69 = v86;
            char v74 = v87;
            uint64_t v76 = v88;
            char v28 = v89;
            swift_bridgeObjectRelease();
            sub_100014C5C((uint64_t)v82, (uint64_t)v101);
            if (v102)
            {
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v19 = sub_100019510(0, v19[2] + 1, 1, v19);
              }
              uint64_t v29 = v19;
              unint64_t v30 = v19[2];
              id v31 = v29;
              unint64_t v32 = v29[3];
              if (v30 >= v32 >> 1) {
                id v31 = sub_100019510((void *)(v32 > 1), v30 + 1, 1, v31);
              }
              v31[2] = v30 + 1;
              char v20 = &v31[12 * v30];
              uint64_t v19 = v31;
              v20[4] = v24;
              v20[5] = v23;
              v20[6] = v25;
              v20[7] = v26;
              v20[8] = v27;
              *((unsigned char *)v20 + 72) = v68 & 1;
              v20[10] = v71;
              v20[11] = v70;
              v20[12] = v69;
              *((unsigned char *)v20 + 104) = v74 & 1;
              v20[14] = v76;
              *((unsigned char *)v20 + 120) = v28 & 1;
            }
            v18 += 2;
            --v1;
          }
          while (v1);
          swift_bridgeObjectRelease();

          unint64_t v15 = v60;
          uint64_t v14 = v61;
        }
        else
        {
          uint64_t v19 = _swiftEmptyArrayStorage;
        }
        sub_1000189FC(*(void *)v15, *((void *)v15 + 1), (uint64_t)v81);
        uint64_t result = sub_100014C5C((uint64_t)v81, (uint64_t)&v100);
        if (!*((void *)&v100 + 1)) {
          goto LABEL_48;
        }
        v105[0] = v100;
        sub_100014CC4((uint64_t)v105);
        sub_100014CF0((uint64_t)v81);
        __int16 v43 = dispatch thunk of CAFCameraButtonObservable.selectedEntryIndex.getter();
        uint64_t result = sub_10000C008((uint64_t)v105);
        unint64_t v44 = v43 - 1;
        if ((v43 & 0x100) != 0) {
          unint64_t v44 = -1;
        }
        if ((v44 & 0x8000000000000000) != 0) {
          goto LABEL_48;
        }
        if (v44 >= v19[2]) {
          goto LABEL_39;
        }
        uint64_t v45 = &v19[12 * v44];
        uint64_t v46 = (void *)v45[5];
        uint64_t v72 = v45[4];
        uint64_t v35 = v45[8];
        char v42 = *((unsigned char *)v45 + 72);
        long long v75 = *((_OWORD *)v45 + 3);
        long long v77 = *((_OWORD *)v45 + 5);
        uint64_t v37 = (void *)v45[12];
        uint64_t v1 = *((unsigned __int8 *)v45 + 104);
        uint64_t v39 = v45[14];
        char v47 = *((unsigned char *)v45 + 120);
        swift_retain();
        id v33 = v46;
        sub_1000064F4(v35, v42);
        swift_retain();
        id v48 = (id)v77;
        id v49 = v37;

        uint64_t v34 = v72;
        swift_bridgeObjectRelease();
        char v41 = v47;
      }
      else
      {
        sub_1000189FC(*(void *)v15, *((void *)v15 + 1), (uint64_t)v80);
        uint64_t result = sub_100014C5C((uint64_t)v80, (uint64_t)&v90);
        id v33 = v91;
        if (!v91) {
          goto LABEL_47;
        }
        uint64_t v34 = v90;
        uint64_t v35 = v93;
        char v36 = v94;
        long long v75 = v92;
        long long v77 = v95;
        uint64_t v37 = v96;
        char v38 = v97;
        uint64_t v39 = v98;
        char v40 = v99;

        char v41 = v40 & 1;
        uint64_t v1 = v38 & 1;
        char v42 = v36 & 1;
      }
      uint64_t v10 = v64;
      unint64_t v12 = v65;
      char v78 = v65;
      unint64_t v51 = v65[2];
      unint64_t v50 = v65[3];
      uint64_t v52 = v66;
      if (v51 >= v50 >> 1)
      {
        uint64_t v73 = v34;
        char v54 = v41;
        sub_10000C034(v50 > 1, v51 + 1, 1);
        char v41 = v54;
        uint64_t v52 = v66;
        uint64_t v34 = v73;
        uint64_t v10 = v64;
        unint64_t v12 = v78;
      }
      uint64_t v11 = v52 + 1;
      v12[2] = v51 + 1;
      long long v53 = &v12[12 * v51];
      v53[4] = v34;
      v53[5] = v33;
      *((_OWORD *)v53 + 3) = v75;
      v53[8] = v35;
      *((unsigned char *)v53 + 72) = v42;
      *((_OWORD *)v53 + 5) = v77;
      v53[12] = v37;
      *((unsigned char *)v53 + 104) = v1;
      v53[14] = v39;
      *((unsigned char *)v53 + 120) = v41;
      if (v11 == v10)
      {
        swift_bridgeObjectRelease();
        goto LABEL_43;
      }
    }
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v59 = v1;
  if (v8) {
    goto LABEL_6;
  }
LABEL_42:
  swift_bridgeObjectRelease();
  unint64_t v12 = _swiftEmptyArrayStorage;
LABEL_43:
  char v78 = v12;
  sub_100012258(&v78);
  uint64_t v55 = OBJC_IVAR____TtC9CarCamera11CameraModel_topButtons;
  uint64_t v56 = *(void *)(v59 + OBJC_IVAR____TtC9CarCamera11CameraModel_topButtons);
  uint64_t v57 = v78;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v58 = sub_100012DC4(v56, (uint64_t)v57);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v58) {
    return swift_bridgeObjectRelease();
  }
  *(void *)(v59 + v55) = v57;
  swift_bridgeObjectRelease();
  sub_1000122C8();
  return sub_1000120C8();
}

uint64_t sub_100010ACC(void *a1)
{
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000062F4(v2, (uint64_t)qword_100041A08);
  id v3 = a1;
  os_log_type_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    id v7 = [v3 identifier];
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;

    sub_10000E6A0(v8, v10, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 256;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "[CAMERAMODEL] CAFCameraButtonObserver %s didUpdateSelectedEntryIndex %hhu", (uint8_t *)v6, 0xFu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return sub_1000103C0();
}

void sub_100010D44(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = OBJC_IVAR____TtC9CarCamera11CameraModel_camera;
  if (*(void *)(v1 + OBJC_IVAR____TtC9CarCamera11CameraModel_camera))
  {
    if (qword_10003EAB8 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_1000062F4(v4, (uint64_t)qword_100041A08);
    os_log_t osloga = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(osloga, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, osloga, v5, "[CAMERAMODEL] already connected", v6, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    uint64_t v8 = OBJC_IVAR____TtC9CarCamera11CameraModel_hasEmittedInstantOnSignpost;
    if ((*(unsigned char *)(v2 + OBJC_IVAR____TtC9CarCamera11CameraModel_hasEmittedInstantOnSignpost) & 1) == 0)
    {
      CAFSignpostEmit_InstantOn();
      *(unsigned char *)(v2 + v8) = 1;
    }
    if (qword_10003EAB8 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_1000062F4(v9, (uint64_t)qword_100041A08);
    id v10 = a1;
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      unint64_t v13 = (uint8_t *)swift_slowAlloc();
      os_log_t oslog = (os_log_t)swift_slowAlloc();
      id v20 = v10;
      *(_DWORD *)unint64_t v13 = 138412290;
      id v14 = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      oslog->isa = (Class)v10;

      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[CAMERAMODEL] connecting to %@", v13, 0xCu);
      sub_100005214(&qword_1000401B0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    [v10 registerObserver:v2 oslog:v20];
    id v15 = [v10 cameraGeneral];
    [v15 registerObserver:v2];

    __int16 v16 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v10;
    id v17 = v10;

    sub_100011054();
  }
}

void sub_100011054()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_100005214(&qword_10003F500);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (unint64_t)v87 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (uint64_t)v87 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = ((char *)v87 - v10);
  os_log_type_t v12 = *(Class *)((char *)&v0->isa + OBJC_IVAR____TtC9CarCamera11CameraModel_camera);
  if (!v12)
  {
    if (qword_10003EAB8 != -1) {
LABEL_58:
    }
      swift_once();
    uint64_t v18 = type metadata accessor for Logger();
    sub_1000062F4(v18, (uint64_t)qword_100041A08);
    os_log_t v92 = (os_log_t)Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v92, v19))
    {
      id v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v92, v19, "[CAMERAMODEL] update missing accessory", v20, 2u);
      swift_slowDealloc();
    }
    goto LABEL_16;
  }
  os_log_t v92 = v12;
  if (![v92 receivedAllValues])
  {
    if (qword_10003EAB8 != -1) {
      swift_once();
    }
    uint64_t v21 = type metadata accessor for Logger();
    sub_1000062F4(v21, (uint64_t)qword_100041A08);
    os_log_t v91 = (os_log_t)Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v91, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v91, v22, "[CAMERAMODEL] camera has not receivedAllValues", v23, 2u);
      swift_slowDealloc();

      os_log_t v24 = v91;
LABEL_17:

      return;
    }

LABEL_16:
    os_log_t v24 = v92;
    goto LABEL_17;
  }
  unint64_t v13 = (char *)v0 + OBJC_IVAR____TtC9CarCamera11CameraModel_buttonDict;
  swift_beginAccess();
  if (*(void *)(*(void *)v13 + 16))
  {
    if (qword_10003EAB8 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    sub_1000062F4(v14, (uint64_t)qword_100041A08);
    id v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      id v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[CAMERAMODEL] already updated", v17, 2u);
      swift_slowDealloc();
    }
    else
    {
    }
    return;
  }
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v25 = type metadata accessor for Logger();
  uint64_t v26 = sub_1000062F4(v25, (uint64_t)qword_100041A08);
  uint64_t v27 = v92;
  v87[1] = v26;
  char v28 = Logger.logObject.getter();
  int v29 = static os_log_type_t.default.getter();
  os_log_t v92 = v28;
  BOOL v30 = os_log_type_enabled(v28, (os_log_type_t)v29);
  uint64_t v88 = v27;
  if (!v30)
  {

    os_log_t v92 = v27;
    goto LABEL_30;
  }
  LODWORD(v90) = v29;
  os_log_t v91 = v2;
  uint64_t v1 = swift_slowAlloc();
  id v31 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v1 = 138412546;
  v94[0] = v27;
  uint64_t v32 = v27;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *id v31 = v12;

  *(_WORD *)(v1 + 12) = 2048;
  id v33 = [(id)v32 cameraButtons];
  if (v33)
  {
    sub_100014B70(0, (unint64_t *)&qword_10003F570);
    unint64_t v34 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v34 >> 62) {
      goto LABEL_77;
    }
    id v33 = *(id *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10);

    swift_bridgeObjectRelease();
  }
  else
  {
  }
  while (1)
  {
    uint64_t v2 = v91;
    v94[0] = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl((void *)&_mh_execute_header, v92, (os_log_type_t)v90, "[CAMERAMODEL] updating %@ buttons.count=%ld", (uint8_t *)v1, 0x16u);
    sub_100005214(&qword_1000401B0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    uint64_t v27 = v88;
LABEL_30:

    id v35 = [v27 cameraGeneral];
    unsigned int v36 = [v35 userDismissible];

    if (v36)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      uint64_t v1 = type metadata accessor for CameraCloseButton(0);
      uint64_t v37 = *(void *)(v1 - 8);
      int v38 = (*(uint64_t (**)(NSObject *, uint64_t, uint64_t))(v37 + 48))(v11, 1, v1);
      sub_1000146E4((uint64_t)v11);
      if (v38 == 1)
      {
        id v39 = [v27 cameraGeneral];
        sub_100014B70(0, &qword_10003F578);
        sub_100014BAC();
        CAFObserved<>.observable.getter();

        type metadata accessor for LayoutSize();
        sub_100014C14(&qword_10003EDF8, (void (*)(uint64_t))type metadata accessor for LayoutSize);
        uint64_t v40 = EnvironmentObject.init()();
        uint64_t v42 = v41;
        type metadata accessor for CAFCameraGeneralObservable();
        sub_100014C14((unint64_t *)&unk_10003F590, (void (*)(uint64_t))&type metadata accessor for CAFCameraGeneralObservable);
        *(void *)uint64_t v9 = ObservedObject.init(wrappedValue:)();
        *(void *)(v9 + 8) = v43;
        *(void *)(v9 + 16) = v40;
        *(void *)(v9 + 24) = v42;
        LOBYTE(v95) = 0;
        State.init(wrappedValue:)();
        id v44 = v94[1];
        *(unsigned char *)(v9 + 32) = v94[0];
        *(void *)(v9 + 40) = v44;
        UUID.init()();
        *(unsigned char *)(v9 + *(int *)(v1 + 32)) = 0;
        *(unsigned char *)(v9 + *(int *)(v1 + 36)) = 0;
        *(unsigned char *)(v9 + *(int *)(v1 + 40)) = 0;
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v37 + 56))(v9, 0, 1, v1);
        swift_getKeyPath();
        swift_getKeyPath();
        sub_10001467C(v9, v6);
        uint64_t v45 = v2;
        static Published.subscript.setter();
        sub_1000146E4(v9);
      }
    }
    long long v95 = _swiftEmptyArrayStorage;
    id v46 = [v27 cameraButtons];
    uint64_t v11 = v27;
    if (v46)
    {
      char v47 = v46;
      sub_100014B70(0, (unint64_t *)&qword_10003F570);
      unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (!(v6 >> 62))
      {
        uint64_t v48 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v48) {
          goto LABEL_36;
        }
        goto LABEL_60;
      }
      swift_bridgeObjectRetain_n();
      uint64_t v48 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v48)
      {
LABEL_60:
        swift_bridgeObjectRelease_n();
        uint64_t v11 = v88;
        goto LABEL_61;
      }
LABEL_36:
      id v49 = (Class *)((char *)&v2->isa + OBJC_IVAR____TtC9CarCamera11CameraModel_serviceDict);
      unint64_t v90 = v6;
      os_log_t v91 = (os_log_t)(v6 & 0xC000000000000001);
      uint64_t v9 = 4;
      char v89 = v48;
      while (1)
      {
        if (v91) {
          id v50 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v50 = *(id *)(v6 + 8 * v9);
        }
        unint64_t v51 = v50;
        if (__OFADD__(v9 - 4, 1))
        {
          __break(1u);
LABEL_56:
          __break(1u);
LABEL_57:
          __break(1u);
          goto LABEL_58;
        }
        os_log_t v92 = (os_log_t)(v9 - 3);
        uint64_t v52 = v2;
        [v50 registerObserver:v2];
        id v53 = [v51 identifier];
        uint64_t v54 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v56 = v55;

        swift_beginAccess();
        id v57 = v51;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v93 = (void *)*v49;
        uint64_t v59 = v93;
        *id v49 = 0x8000000000000000;
        unint64_t v61 = sub_10001301C(v54, v56);
        uint64_t v62 = v59[2];
        BOOL v63 = (v60 & 1) == 0;
        uint64_t v64 = v62 + v63;
        if (__OFADD__(v62, v63)) {
          goto LABEL_56;
        }
        uint64_t v1 = v60;
        if (v59[3] >= v64)
        {
          if (isUniquelyReferenced_nonNull_native)
          {
            long long v67 = v93;
            if (v60) {
              goto LABEL_49;
            }
          }
          else
          {
            sub_10001A784();
            long long v67 = v93;
            if (v1) {
              goto LABEL_49;
            }
          }
        }
        else
        {
          sub_10001A020(v64, isUniquelyReferenced_nonNull_native);
          unint64_t v65 = sub_10001301C(v54, v56);
          if ((v1 & 1) != (v66 & 1))
          {
            KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
            __break(1u);
            return;
          }
          unint64_t v61 = v65;
          long long v67 = v93;
          if (v1)
          {
LABEL_49:
            uint64_t v68 = v67[7];
            uint64_t v69 = 8 * v61;

            *(void *)(v68 + v69) = v57;
            goto LABEL_53;
          }
        }
        v67[(v61 >> 6) + 8] |= 1 << v61;
        uint64_t v70 = (uint64_t *)(v67[6] + 16 * v61);
        *uint64_t v70 = v54;
        v70[1] = v56;
        *(void *)(v67[7] + 8 * v61) = v57;
        uint64_t v71 = v67[2];
        BOOL v72 = __OFADD__(v71, 1);
        uint64_t v73 = v71 + 1;
        if (v72) {
          goto LABEL_57;
        }
        v67[2] = v73;
        swift_bridgeObjectRetain();
LABEL_53:
        *id v49 = v67;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        id v74 = [v57 childrenIdentifiers];
        if (v74)
        {
          long long v75 = v74;
          uint64_t v76 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

          sub_100019B0C(v76);
        }

        ++v9;
        uint64_t v2 = v52;
        unint64_t v6 = v90;
        if (v92 == v89) {
          goto LABEL_60;
        }
      }
    }
LABEL_61:
    id v77 = [v11 cameraButtons];
    if (!v77) {
      goto LABEL_72;
    }
    char v78 = v77;
    sub_100014B70(0, (unint64_t *)&qword_10003F570);
    unint64_t v79 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v79 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v32 = _CocoaArrayWrapper.endIndex.getter();
      if (!v32) {
        goto LABEL_71;
      }
    }
    else
    {
      uint64_t v32 = *(void *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v32) {
        goto LABEL_71;
      }
    }
    if (v32 >= 1) {
      break;
    }
    __break(1u);
LABEL_77:
    swift_bridgeObjectRetain();
    id v33 = (id)_CocoaArrayWrapper.endIndex.getter();

    swift_bridgeObjectRelease_n();
  }
  uint64_t v80 = 0;
  do
  {
    if ((v79 & 0xC000000000000001) != 0) {
      id v81 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v81 = *(id *)(v79 + 8 * v80 + 32);
    }
    unsigned int v82 = v81;
    ++v80;
    v94[0] = v81;
    sub_100011DC0(v94, v2, &v95);
  }
  while (v32 != v80);
LABEL_71:
  swift_bridgeObjectRelease_n();
LABEL_72:
  sub_1000103C0();
  uint64_t v83 = v2;
  uint64_t v84 = Logger.logObject.getter();
  os_log_type_t v85 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v84, v85))
  {
    uint64_t v86 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v86 = 134217984;
    v94[0] = (*(id **)((char *)&v83->isa + OBJC_IVAR____TtC9CarCamera11CameraModel_topButtons))[2];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl((void *)&_mh_execute_header, v84, v85, "[CAMERAMODEL] showing %ld buttons", v86, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    uint64_t v84 = v83;
  }

  sub_1000124E0();
  swift_bridgeObjectRelease();
}

void sub_100011DC0(id *a1, void *a2, void **a3)
{
  id v5 = *a1;
  id v6 = [*a1 childrenIdentifiers];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (*(void *)(v8 + 16))
    {
      id v9 = [v5 identifier];
      uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v12 = v11;

      id v13 = objc_allocWithZone((Class)type metadata accessor for CameraButtonGroup());
      uint64_t v14 = a2;
      id v15 = sub_10001AD0C(v10, v12, v8, v14);

      os_log_type_t v16 = &v14[OBJC_IVAR____TtC9CarCamera11CameraModel_menuGroups];
      goto LABEL_7;
    }
    swift_bridgeObjectRelease();
  }
  id v17 = *a3;
  swift_bridgeObjectRetain();
  id v18 = [v5 identifier];
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v21 = v20;

  LOBYTE(v18) = sub_100012000(v19, v21, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v18) {
    return;
  }
  id v22 = [v5 identifier];
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v25 = v24;

  id v26 = objc_allocWithZone((Class)type metadata accessor for CameraButtonGroup());
  uint64_t v27 = a2;
  id v15 = sub_10001AD0C(v23, v25, (uint64_t)_swiftEmptyArrayStorage, v27);

  os_log_type_t v16 = &v27[OBJC_IVAR____TtC9CarCamera11CameraModel_menuGroups];
LABEL_7:
  swift_beginAccess();
  id v28 = v15;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((*(void *)v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v16 & 0xFFFFFFFFFFFFFF8)
                                                                               + 0x18) >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
}

uint64_t sub_100012000(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  id v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1000120C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC9CarCamera11CameraModel_topButtons;
  uint64_t v11 = *(void **)(v0 + OBJC_IVAR____TtC9CarCamera11CameraModel_topButtons);
  swift_bridgeObjectRetain();
  sub_100012258(&v11);
  uint64_t v3 = v11;
  uint64_t v4 = *(void *)(v0 + v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v5 = sub_100012DC4((uint64_t)v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v5)
  {
    return swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_10003EAB8 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_1000062F4(v7, (uint64_t)qword_100041A08);
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[CAMERAMODEL] sort order updated", v10, 2u);
      swift_slowDealloc();
    }

    *(void *)(v1 + v2) = v3;
    swift_bridgeObjectRelease();
    return sub_1000122C8();
  }
}

void sub_100012258(void **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001A938(v2);
  }
  uint64_t v3 = v2[2];
  v4[0] = (uint64_t)(v2 + 4);
  v4[1] = v3;
  sub_100013178(v4);
  *a1 = v2;
}

uint64_t sub_1000122C8()
{
  id v1 = v0;
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_100014744(v2);
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();

  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  char v5 = sub_100012DC4(v4, v12);
  swift_bridgeObjectRelease();
  if (v5) {
    return swift_bridgeObjectRelease();
  }
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_1000062F4(v7, (uint64_t)qword_100041A08);
  swift_bridgeObjectRetain();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 134217984;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[CAMERAMODEL] visibility updated - %ld", v10, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v11 = v1;
  return static Published.subscript.setter();
}

void sub_1000124E0()
{
  uint64_t v1 = OBJC_IVAR____TtC9CarCamera11CameraModel_hasEmittedFinalizedSignpost;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC9CarCamera11CameraModel_hasEmittedFinalizedSignpost)) {
    return;
  }
  uint64_t v2 = v0;
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC9CarCamera11CameraModel_camera);
  if (v3)
  {
    id v4 = v3;
    if ([v4 receivedAllValues])
    {
      if (qword_10003EAE8 != -1) {
        swift_once();
      }
      id v5 = *(id *)(qword_100041A68 + OBJC_IVAR____TtC9CarCamera16CameraCAFManager_carManager);
      id v6 = (void *)dispatch thunk of CAFCarManagerObservable.currentCar.getter();

      CAFSignpostEmit_Finalized();
      *(unsigned char *)(v2 + v1) = 1;
      return;
    }
  }
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_1000062F4(v7, (uint64_t)qword_100041A08);
  os_log_t oslog = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v8))
  {
    os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v8, "camera.receivedAllValues false", v9, 2u);
    swift_slowDealloc();
  }
}

id sub_1000126D4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CameraModel();
  [super dealloc];
}

uint64_t sub_1000128BC()
{
  return type metadata accessor for CameraModel();
}

uint64_t type metadata accessor for CameraModel()
{
  uint64_t result = qword_10003F4E8;
  if (!qword_10003F4E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100012910()
{
  sub_100012AC4(319, &qword_10003F4F8, &qword_10003F500);
  if (v0 <= 0x3F)
  {
    sub_100012AC4(319, &qword_10003F508, &qword_10003F510);
    if (v1 <= 0x3F)
    {
      sub_100012AC4(319, &qword_10003F518, &qword_10003F520);
      if (v2 <= 0x3F)
      {
        sub_100012AC4(319, &qword_10003F528, &qword_10003F530);
        if (v3 <= 0x3F) {
          swift_updateClassMetadata2();
        }
      }
    }
  }
}

void sub_100012AC4(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    sub_100005324(a3);
    unint64_t v4 = type metadata accessor for Published();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_100012B14@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CameraModel();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100012B54(long long *a1, long long *a2)
{
  long long v2 = a1[3];
  v7[2] = a1[2];
  v7[3] = v2;
  v8[0] = a1[4];
  *(_OWORD *)((char *)v8 + 9) = *(long long *)((char *)a1 + 73);
  long long v3 = a1[1];
  v7[0] = *a1;
  v7[1] = v3;
  long long v4 = a2[3];
  v9[2] = a2[2];
  v9[3] = v4;
  v10[0] = a2[4];
  *(_OWORD *)((char *)v10 + 9) = *(long long *)((char *)a2 + 73);
  long long v5 = a2[1];
  v9[0] = *a2;
  v9[1] = v5;
  return sub_1000145B4(v7, v9) & 1;
}

void *sub_100012BC0()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100012BCC@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100012C4C(uint64_t a1, void **a2)
{
  long long v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return static Published.subscript.setter();
}

double sub_100012CC4@<D0>(_OWORD *a1@<X8>)
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

uint64_t sub_100012D44(uint64_t a1, void **a2)
{
  long long v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return static Published.subscript.setter();
}

uint64_t sub_100012DC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      char v23 = 1;
    }
    else
    {
      uint64_t v3 = v2 - 1;
      uint64_t v4 = a1 + 64;
      uint64_t v5 = a2 + 64;
      do
      {
        uint64_t v25 = v3;
        uint64_t v6 = *(void *)v4;
        char v7 = *(unsigned char *)(v4 + 8);
        os_log_type_t v8 = *(void **)(v4 - 24);
        unint64_t v34 = *(void **)(v5 - 24);
        id v35 = *(void **)(v4 + 16);
        uint64_t v9 = *(void *)v5;
        char v10 = *(unsigned char *)(v5 + 8);
        uint64_t v27 = *(void **)(v5 + 32);
        int v29 = *(void **)(v5 + 16);
        uint64_t v32 = *(void **)(v4 + 32);
        swift_retain();
        id v11 = v8;
        uint64_t v26 = v6;
        char v36 = v7;
        sub_1000064F4(v6, v7);
        swift_retain();
        id v12 = v35;
        id v33 = v32;
        swift_retain();
        id v13 = v34;
        uint64_t v31 = v9;
        char v30 = v10;
        sub_1000064F4(v9, v10);
        swift_retain();
        id v14 = v11;
        id v15 = v29;
        id v28 = v27;
        uint64_t v16 = dispatch thunk of CAFCameraButtonObservable.symbolName.getter();
        uint64_t v18 = v17;

        id v19 = v13;
        uint64_t v20 = dispatch thunk of CAFCameraButtonObservable.symbolName.getter();
        uint64_t v22 = v21;

        if (v16 == v20 && v18 == v22) {
          char v23 = 1;
        }
        else {
          char v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();

        sub_100006550(v31, v30);
        swift_release();

        swift_release();
        sub_100006550(v26, v36);
        swift_release();

        uint64_t v3 = v25 - 1;
        if ((v23 & 1) == 0) {
          break;
        }
        v4 += 96;
        v5 += 96;
      }
      while (v25);
    }
  }
  else
  {
    char v23 = 0;
  }
  return v23 & 1;
}

unint64_t sub_10001301C(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100013094(a1, a2, v4);
}

unint64_t sub_100013094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
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

void sub_100013178(uint64_t *a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = a1[1];
  Swift::Int v5 = _minimumMergeRunLength(_:)(v4);
  if (v5 >= v4)
  {
    if (v4 < 0) {
      goto LABEL_133;
    }
    if (v4) {
      sub_100013D54(0, v4, 1, a1);
    }
    return;
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_141;
  }
  Swift::Int v151 = v5;
  v148 = a1;
  if (v4 < 2)
  {
    char v10 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v9 = (char *)&_swiftEmptyArrayStorage + 32;
    v150 = &_swiftEmptyArrayStorage;
    if (v4 != 1)
    {
      unint64_t v13 = *((void *)&_swiftEmptyArrayStorage + 2);
LABEL_99:
      if (v13 >= 2)
      {
        uint64_t v138 = *v148;
        do
        {
          unint64_t v139 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_128;
          }
          if (!v138) {
            goto LABEL_140;
          }
          v140 = v10;
          v141 = v10 + 32;
          uint64_t v142 = *(void *)&v10[16 * v139 + 32];
          uint64_t v143 = *(void *)&v10[16 * v13 + 24];
          v144 = v9;
          sub_100013FE0((char *)(v138 + 96 * v142), (char *)(v138 + 96 * *(void *)&v141[16 * v13 - 16]), v138 + 96 * v143, v9);
          if (v2) {
            break;
          }
          if (v143 < v142) {
            goto LABEL_129;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v140 = sub_10001999C((uint64_t)v140);
          }
          if (v139 >= *((void *)v140 + 2)) {
            goto LABEL_130;
          }
          v145 = &v140[16 * v139 + 32];
          *(void *)v145 = v142;
          *((void *)v145 + 1) = v143;
          unint64_t v146 = *((void *)v140 + 2);
          if (v13 > v146) {
            goto LABEL_131;
          }
          char v10 = v140;
          memmove(&v140[16 * v13 + 16], &v140[16 * v13 + 32], 16 * (v146 - v13));
          *((void *)v140 + 2) = v146 - 1;
          unint64_t v13 = v146 - 1;
          uint64_t v9 = v144;
        }
        while (v146 > 2);
      }
LABEL_110:
      swift_bridgeObjectRelease();
      v150[2] = 0;
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v7 = v6 >> 1;
    uint64_t v8 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v8 + 16) = v7;
    v150 = (void *)v8;
    uint64_t v9 = (char *)(v8 + 32);
  }
  Swift::Int v11 = 0;
  uint64_t v12 = *a1;
  uint64_t v149 = *a1 + 136;
  uint64_t v147 = *a1 - 96;
  char v10 = (char *)&_swiftEmptyArrayStorage;
  v160 = v9;
  uint64_t v161 = *a1;
  Swift::Int v156 = v4;
  while (1)
  {
    Swift::Int v14 = v11;
    Swift::Int v15 = v11 + 1;
    v153 = v10;
    Swift::Int v157 = v11;
    if (v11 + 1 < v4)
    {
      uint64_t v152 = v2;
      uint64_t v16 = v12 + 96 * v15;
      uint64_t v17 = *(void **)(v16 + 8);
      uint64_t v18 = *(void *)(v16 + 32);
      uint64_t v192 = v18;
      char v19 = *(unsigned char *)(v16 + 40);
      uint64_t v20 = *(void **)(v16 + 48);
      uint64_t v21 = *(void **)(v16 + 64);
      uint64_t v22 = v12 + 96 * v11;
      v170 = *(void **)(v22 + 8);
      uint64_t v23 = *(void *)(v22 + 32);
      char v24 = *(unsigned char *)(v22 + 40);
      v173 = *(void **)(v22 + 48);
      v176 = *(void **)(v22 + 64);
      swift_retain();
      id v25 = v17;
      sub_1000064F4(v18, v19);
      swift_retain();
      id v187 = v20;
      id v183 = v21;
      swift_retain();
      Swift::Int v14 = v157;
      id v26 = v170;
      sub_1000064F4(v23, v24);
      swift_retain();
      id v27 = v25;
      id v28 = v173;
      id v29 = v176;
      unsigned __int8 v158 = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();

      id v30 = v26;
      Swift::Int v4 = v156;
      id v31 = v30;
      unsigned __int8 v154 = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();
      swift_release();

      sub_100006550(v23, v24);
      swift_release();

      swift_release();
      sub_100006550(v192, v19);
      swift_release();

      Swift::Int v15 = v157 + 2;
      if (v157 + 2 < v156)
      {
        uint64_t v32 = v149 + 96 * v157;
        while (1)
        {
          Swift::Int v162 = v15;
          id v33 = *(void **)(v32 + 64);
          uint64_t v34 = *(void *)(v32 + 88);
          char v35 = *(unsigned char *)(v32 + 96);
          char v181 = v35;
          char v36 = *(void **)(v32 + 104);
          uint64_t v37 = *(void **)(v32 + 120);
          v166 = *(void **)(v32 - 32);
          uint64_t v168 = *(void *)(v32 - 8);
          char v38 = *(unsigned char *)v32;
          v172 = *(void **)(v32 + 8);
          v177 = *(void **)(v32 + 24);
          swift_retain();
          id v39 = v33;
          sub_1000064F4(v34, v35);
          swift_retain();
          id v190 = v36;
          id v184 = v37;
          swift_retain();
          id v40 = v166;
          sub_1000064F4(v168, v38);
          swift_retain();
          id v41 = v39;
          id v42 = v172;
          id v43 = v177;
          LODWORD(v177) = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();

          id v44 = v40;
          LOBYTE(v40) = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();
          swift_release();

          sub_100006550(v168, v38);
          swift_release();

          swift_release();
          sub_100006550(v34, v181);
          swift_release();

          if (v158 < v154 == v177 >= v40) {
            break;
          }
          Swift::Int v15 = v162 + 1;
          v32 += 96;
          Swift::Int v4 = v156;
          if (v156 == v162 + 1)
          {
            Swift::Int v15 = v156;
            goto LABEL_23;
          }
        }
        Swift::Int v4 = v156;
        Swift::Int v15 = v162;
LABEL_23:
        Swift::Int v14 = v157;
      }
      uint64_t v2 = v152;
      char v10 = v153;
      uint64_t v45 = v161;
      if (v158 < v154)
      {
        if (v15 < v14) {
          goto LABEL_134;
        }
        if (v14 < v15)
        {
          uint64_t v46 = 96 * v15;
          uint64_t v47 = 3 * v14;
          Swift::Int v48 = v14;
          Swift::Int v49 = v15;
          uint64_t v50 = 32 * v47;
          Swift::Int v163 = v49;
          do
          {
            if (v48 != --v49)
            {
              if (!v45) {
                goto LABEL_139;
              }
              uint64_t v51 = v45 + v46;
              uint64_t v52 = *(void *)(v45 + v50);
              uint64_t v53 = *(void *)(v45 + v50 + 8);
              uint64_t v182 = *(void *)(v45 + v50 + 32);
              char v54 = *(unsigned char *)(v45 + v50 + 40);
              uint64_t v193 = *(void *)(v45 + v50 + 64);
              char v191 = *(unsigned char *)(v45 + v50 + 72);
              uint64_t v188 = *(void *)(v45 + v50 + 80);
              char v185 = *(unsigned char *)(v45 + v50 + 88);
              long long v179 = *(_OWORD *)(v45 + v50 + 16);
              long long v180 = *(_OWORD *)(v45 + v50 + 48);
              memmove((void *)(v45 + v50), (const void *)(v45 + v46 - 96), 0x60uLL);
              uint64_t v45 = v161;
              *(void *)(v51 - 96) = v52;
              *(void *)(v51 - 88) = v53;
              *(_OWORD *)(v51 - 80) = v179;
              *(void *)(v51 - 64) = v182;
              *(unsigned char *)(v51 - 56) = v54;
              *(_OWORD *)(v51 - 48) = v180;
              *(void *)(v51 - 32) = v193;
              *(unsigned char *)(v51 - 24) = v191;
              *(void *)(v51 - 16) = v188;
              *(unsigned char *)(v51 - 8) = v185;
              char v10 = v153;
            }
            ++v48;
            v46 -= 96;
            v50 += 96;
          }
          while (v48 < v49);
          Swift::Int v4 = v156;
          Swift::Int v14 = v157;
          Swift::Int v15 = v163;
        }
      }
    }
    if (v15 < v4)
    {
      if (__OFSUB__(v15, v14)) {
        goto LABEL_132;
      }
      if (v15 - v14 < v151) {
        break;
      }
    }
LABEL_51:
    if (v15 < v14) {
      goto LABEL_127;
    }
    Swift::Int v165 = v15;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      char v10 = sub_1000197D4(0, *((void *)v10 + 2) + 1, 1, v10);
    }
    unint64_t v88 = *((void *)v10 + 2);
    unint64_t v87 = *((void *)v10 + 3);
    unint64_t v13 = v88 + 1;
    uint64_t v9 = v160;
    uint64_t v12 = v161;
    if (v88 >= v87 >> 1)
    {
      v137 = sub_1000197D4((char *)(v87 > 1), v88 + 1, 1, v10);
      uint64_t v9 = v160;
      uint64_t v12 = v161;
      char v10 = v137;
    }
    *((void *)v10 + 2) = v13;
    char v89 = v10 + 32;
    unint64_t v90 = &v10[16 * v88 + 32];
    *(void *)unint64_t v90 = v157;
    *((void *)v90 + 1) = v165;
    if (v88)
    {
      while (1)
      {
        unint64_t v91 = v13 - 1;
        if (v13 >= 4)
        {
          uint64_t v96 = &v89[16 * v13];
          uint64_t v97 = *((void *)v96 - 8);
          uint64_t v98 = *((void *)v96 - 7);
          BOOL v102 = __OFSUB__(v98, v97);
          uint64_t v99 = v98 - v97;
          if (v102) {
            goto LABEL_116;
          }
          uint64_t v101 = *((void *)v96 - 6);
          uint64_t v100 = *((void *)v96 - 5);
          BOOL v102 = __OFSUB__(v100, v101);
          uint64_t v94 = v100 - v101;
          char v95 = v102;
          if (v102) {
            goto LABEL_117;
          }
          unint64_t v103 = v13 - 2;
          long long v104 = &v89[16 * v13 - 32];
          uint64_t v106 = *(void *)v104;
          uint64_t v105 = *((void *)v104 + 1);
          BOOL v102 = __OFSUB__(v105, v106);
          uint64_t v107 = v105 - v106;
          if (v102) {
            goto LABEL_119;
          }
          BOOL v102 = __OFADD__(v94, v107);
          uint64_t v108 = v94 + v107;
          if (v102) {
            goto LABEL_122;
          }
          if (v108 >= v99)
          {
            uint64_t v126 = &v89[16 * v91];
            uint64_t v128 = *(void *)v126;
            uint64_t v127 = *((void *)v126 + 1);
            BOOL v102 = __OFSUB__(v127, v128);
            uint64_t v129 = v127 - v128;
            if (v102) {
              goto LABEL_126;
            }
            BOOL v119 = v94 < v129;
            goto LABEL_88;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v120 = *((void *)v10 + 4);
            uint64_t v121 = *((void *)v10 + 5);
            BOOL v102 = __OFSUB__(v121, v120);
            uint64_t v113 = v121 - v120;
            char v114 = v102;
            goto LABEL_82;
          }
          uint64_t v93 = *((void *)v10 + 4);
          uint64_t v92 = *((void *)v10 + 5);
          BOOL v102 = __OFSUB__(v92, v93);
          uint64_t v94 = v92 - v93;
          char v95 = v102;
        }
        if (v95) {
          goto LABEL_118;
        }
        unint64_t v103 = v13 - 2;
        uint64_t v109 = &v89[16 * v13 - 32];
        uint64_t v111 = *(void *)v109;
        uint64_t v110 = *((void *)v109 + 1);
        BOOL v112 = __OFSUB__(v110, v111);
        uint64_t v113 = v110 - v111;
        char v114 = v112;
        if (v112) {
          goto LABEL_121;
        }
        unsigned int v115 = &v89[16 * v91];
        uint64_t v117 = *(void *)v115;
        uint64_t v116 = *((void *)v115 + 1);
        BOOL v102 = __OFSUB__(v116, v117);
        uint64_t v118 = v116 - v117;
        if (v102) {
          goto LABEL_124;
        }
        if (__OFADD__(v113, v118)) {
          goto LABEL_125;
        }
        if (v113 + v118 >= v94)
        {
          BOOL v119 = v94 < v118;
LABEL_88:
          if (v119) {
            unint64_t v91 = v103;
          }
          goto LABEL_90;
        }
LABEL_82:
        if (v114) {
          goto LABEL_120;
        }
        char v122 = &v89[16 * v91];
        uint64_t v124 = *(void *)v122;
        uint64_t v123 = *((void *)v122 + 1);
        BOOL v102 = __OFSUB__(v123, v124);
        uint64_t v125 = v123 - v124;
        if (v102) {
          goto LABEL_123;
        }
        if (v125 < v113) {
          goto LABEL_14;
        }
LABEL_90:
        unint64_t v130 = v91 - 1;
        if (v91 - 1 >= v13)
        {
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
LABEL_135:
          __break(1u);
          goto LABEL_136;
        }
        if (!v12) {
          goto LABEL_138;
        }
        v131 = v10;
        v132 = &v89[16 * v130];
        uint64_t v133 = *(void *)v132;
        v134 = &v89[16 * v91];
        uint64_t v135 = *((void *)v134 + 1);
        sub_100013FE0((char *)(v12 + 96 * *(void *)v132), (char *)(v12 + 96 * *(void *)v134), v12 + 96 * v135, v9);
        if (v2) {
          goto LABEL_110;
        }
        if (v135 < v133) {
          goto LABEL_113;
        }
        if (v91 > *((void *)v131 + 2)) {
          goto LABEL_114;
        }
        *(void *)v132 = v133;
        *(void *)&v89[16 * v130 + 8] = v135;
        unint64_t v136 = *((void *)v131 + 2);
        if (v91 >= v136) {
          goto LABEL_115;
        }
        char v10 = v131;
        unint64_t v13 = v136 - 1;
        memmove(&v89[16 * v91], v134 + 16, 16 * (v136 - 1 - v91));
        *((void *)v131 + 2) = v136 - 1;
        uint64_t v9 = v160;
        uint64_t v12 = v161;
        if (v136 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_14:
    Swift::Int v4 = v156;
    Swift::Int v11 = v165;
    if (v165 >= v156) {
      goto LABEL_99;
    }
  }
  if (__OFADD__(v14, v151)) {
    goto LABEL_135;
  }
  if (v14 + v151 >= v4) {
    Swift::Int v55 = v4;
  }
  else {
    Swift::Int v55 = v14 + v151;
  }
  if (v55 >= v14)
  {
    if (v15 != v55)
    {
      uint64_t v56 = v147 + 96 * v15;
      Swift::Int v155 = v55;
      do
      {
        Swift::Int v58 = v14;
        uint64_t v159 = v56;
        uint64_t v59 = v56;
        Swift::Int v164 = v15;
        while (1)
        {
          Swift::Int v167 = v58;
          uint64_t v60 = *(void **)(v59 + 104);
          uint64_t v61 = *(void *)(v59 + 128);
          uint64_t v194 = v61;
          char v62 = *(unsigned char *)(v59 + 136);
          BOOL v63 = *(void **)(v59 + 144);
          uint64_t v64 = *(void **)(v59 + 160);
          unint64_t v65 = *(void **)(v59 + 8);
          uint64_t v171 = *(void *)(v59 + 32);
          char v169 = *(unsigned char *)(v59 + 40);
          v174 = *(void **)(v59 + 48);
          v178 = *(void **)(v59 + 64);
          swift_retain();
          id v66 = v60;
          sub_1000064F4(v61, v62);
          swift_retain();
          id v186 = v63;
          id v189 = v64;
          swift_retain();
          id v67 = v65;
          sub_1000064F4(v171, v169);
          swift_retain();
          id v68 = v66;
          id v175 = v174;
          id v69 = v178;
          unsigned int v70 = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();

          id v71 = v67;
          LOBYTE(v67) = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();
          swift_release();

          sub_100006550(v171, v169);
          swift_release();

          swift_release();
          sub_100006550(v194, v62);
          swift_release();

          if (v70 >= v67) {
            break;
          }
          Swift::Int v57 = v164;
          if (!v161) {
            goto LABEL_137;
          }
          BOOL v72 = (_OWORD *)(v59 + 96);
          uint64_t v73 = *(void *)(v59 + 96);
          uint64_t v74 = *(void *)(v59 + 104);
          uint64_t v75 = *(void *)(v59 + 128);
          char v76 = *(unsigned char *)(v59 + 136);
          uint64_t v77 = *(void *)(v59 + 160);
          char v78 = *(unsigned char *)(v59 + 168);
          uint64_t v79 = *(void *)(v59 + 176);
          char v80 = *(unsigned char *)(v59 + 184);
          long long v81 = *(_OWORD *)(v59 + 112);
          long long v82 = *(_OWORD *)(v59 + 144);
          long long v83 = *(_OWORD *)(v59 + 48);
          *(_OWORD *)(v59 + 128) = *(_OWORD *)(v59 + 32);
          *(_OWORD *)(v59 + 144) = v83;
          long long v84 = *(_OWORD *)(v59 + 80);
          *(_OWORD *)(v59 + 160) = *(_OWORD *)(v59 + 64);
          *(_OWORD *)(v59 + 176) = v84;
          long long v85 = *(_OWORD *)v59;
          long long v86 = *(_OWORD *)(v59 + 16);
          *(_OWORD *)(v59 + 16) = v81;
          *(void *)uint64_t v59 = v73;
          *(void *)(v59 + 8) = v74;
          *(void *)(v59 + 32) = v75;
          *(unsigned char *)(v59 + 40) = v76;
          *(_OWORD *)(v59 + 48) = v82;
          *(void *)(v59 + 64) = v77;
          *(unsigned char *)(v59 + 72) = v78;
          *(void *)(v59 + 80) = v79;
          *(unsigned char *)(v59 + 88) = v80;
          v59 -= 96;
          Swift::Int v58 = v167 + 1;
          *BOOL v72 = v85;
          v72[1] = v86;
          if (v164 == v167 + 1) {
            goto LABEL_44;
          }
        }
        Swift::Int v57 = v164;
LABEL_44:
        Swift::Int v15 = v57 + 1;
        Swift::Int v14 = v157;
        uint64_t v56 = v159 + 96;
      }
      while (v15 != v155);
      Swift::Int v15 = v155;
      char v10 = v153;
    }
    goto LABEL_51;
  }
LABEL_136:
  __break(1u);
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_100013D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v35 = a3;
  if (a3 != a2)
  {
    uint64_t v34 = *a4;
    uint64_t v4 = *a4 + 96 * a3 - 96;
LABEL_5:
    uint64_t v5 = a1;
    uint64_t v33 = v4;
    while (1)
    {
      uint64_t v6 = *(void **)(v4 + 104);
      uint64_t v7 = *(void *)(v4 + 128);
      uint64_t v44 = v7;
      char v8 = *(unsigned char *)(v4 + 136);
      uint64_t v9 = *(void **)(v4 + 144);
      char v10 = *(void **)(v4 + 160);
      char v36 = *(void **)(v4 + 8);
      char v37 = *(unsigned char *)(v4 + 40);
      id v39 = *(void **)(v4 + 48);
      id v41 = *(void **)(v4 + 64);
      uint64_t v38 = *(void *)(v4 + 32);
      swift_retain();
      id v11 = v6;
      sub_1000064F4(v7, v8);
      swift_retain();
      id v42 = v9;
      id v43 = v10;
      swift_retain();
      id v12 = v36;
      sub_1000064F4(v38, v37);
      swift_retain();
      id v13 = v11;
      id v40 = v39;
      id v14 = v41;
      LODWORD(v41) = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();

      id v15 = v12;
      LOBYTE(v12) = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();
      swift_release();

      sub_100006550(v38, v37);
      swift_release();

      swift_release();
      sub_100006550(v44, v8);
      swift_release();

      if (v41 >= v12)
      {
LABEL_4:
        uint64_t v4 = v33 + 96;
        if (++v35 == a2) {
          return;
        }
        goto LABEL_5;
      }
      if (!v34) {
        break;
      }
      uint64_t v16 = (_OWORD *)(v4 + 96);
      uint64_t v17 = *(void *)(v4 + 96);
      uint64_t v18 = *(void *)(v4 + 104);
      uint64_t v19 = *(void *)(v4 + 128);
      char v20 = *(unsigned char *)(v4 + 136);
      uint64_t v21 = *(void *)(v4 + 160);
      char v22 = *(unsigned char *)(v4 + 168);
      uint64_t v23 = *(void *)(v4 + 176);
      char v24 = *(unsigned char *)(v4 + 184);
      long long v25 = *(_OWORD *)(v4 + 112);
      long long v26 = *(_OWORD *)(v4 + 144);
      long long v27 = *(_OWORD *)(v4 + 48);
      *(_OWORD *)(v4 + 128) = *(_OWORD *)(v4 + 32);
      *(_OWORD *)(v4 + 144) = v27;
      long long v28 = *(_OWORD *)(v4 + 80);
      *(_OWORD *)(v4 + 160) = *(_OWORD *)(v4 + 64);
      *(_OWORD *)(v4 + 176) = v28;
      long long v29 = *(_OWORD *)v4;
      long long v30 = *(_OWORD *)(v4 + 16);
      *(_OWORD *)(v4 + 16) = v25;
      *(void *)uint64_t v4 = v17;
      *(void *)(v4 + 8) = v18;
      *(void *)(v4 + 32) = v19;
      *(unsigned char *)(v4 + 40) = v20;
      *(_OWORD *)(v4 + 48) = v26;
      *(void *)(v4 + 64) = v21;
      *(unsigned char *)(v4 + 72) = v22;
      *(void *)(v4 + 80) = v23;
      *(unsigned char *)(v4 + 88) = v24;
      v4 -= 96;
      ++v5;
      *uint64_t v16 = v29;
      v16[1] = v30;
      if (v35 == v5) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t sub_100013FE0(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v5 = a2;
  uint64_t v6 = __src;
  int64_t v7 = a2 - __src;
  int64_t v8 = (a2 - __src) / 96;
  uint64_t v9 = a3 - (void)a2;
  uint64_t v10 = (uint64_t)(a3 - (void)a2) / 96;
  uint64_t v73 = __src;
  BOOL v72 = __dst;
  if (v8 >= v10)
  {
    if (v9 < -95) {
      goto LABEL_44;
    }
    uint64_t v26 = 96 * v10;
    if (__dst != a2 || &a2[v26] <= __dst) {
      memmove(__dst, a2, 96 * v10);
    }
    long long v27 = &v4[v26];
    id v71 = &v4[v26];
    uint64_t v73 = v5;
    if (v6 >= v5 || v9 < 96)
    {
LABEL_43:
      sub_1000198D0((void **)&v73, &v72, &v71);
      return 1;
    }
    long long v28 = (char *)(a3 - 96);
    unsigned int v70 = v6;
    uint64_t v46 = v4;
    while (1)
    {
      __dsta = v28;
      id v68 = v28 + 96;
      long long v29 = (void *)*((void *)v27 - 11);
      uint64_t v30 = *((void *)v27 - 8);
      char v31 = *(v27 - 56);
      uint64_t v32 = (void *)*((void *)v27 - 6);
      uint64_t v33 = (void *)*((void *)v27 - 4);
      Swift::Int v49 = (void *)*((void *)v5 - 11);
      uint64_t v51 = *((void *)v5 - 8);
      char v34 = *(v5 - 56);
      char v54 = v34;
      uint64_t v56 = (void *)*((void *)v5 - 6);
      Swift::Int v58 = (void *)*((void *)v5 - 4);
      swift_retain();
      id v47 = v29;
      sub_1000064F4(v30, v31);
      swift_retain();
      id v66 = v32;
      id v64 = v33;
      swift_retain();
      id v35 = v49;
      sub_1000064F4(v51, v34);
      swift_retain();
      id v36 = v47;
      id v57 = v56;
      id v37 = v58;
      unsigned int v38 = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();

      id v39 = v35;
      LOBYTE(v35) = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();
      swift_release();

      sub_100006550(v51, v54);
      swift_release();

      swift_release();
      sub_100006550(v30, v31);
      swift_release();

      if (v38 < v35) {
        break;
      }
      id v42 = v27 - 96;
      id v71 = v27 - 96;
      id v41 = __dsta;
      if (v68 < v27 || __dsta >= v27)
      {
        memmove(__dsta, v27 - 96, 0x60uLL);
        id v40 = v5;
        v27 -= 96;
        goto LABEL_41;
      }
      id v43 = v70;
      if (v68 != v27) {
        memmove(__dsta, v27 - 96, 0x60uLL);
      }
      id v40 = v5;
      v27 -= 96;
      if (v42 <= v46) {
        goto LABEL_43;
      }
LABEL_42:
      long long v28 = v41 - 96;
      uint64_t v5 = v40;
      if (v40 <= v43) {
        goto LABEL_43;
      }
    }
    id v40 = v5 - 96;
    id v41 = __dsta;
    if (v68 != v5 || __dsta >= v5) {
      memmove(__dsta, v5 - 96, 0x60uLL);
    }
    uint64_t v73 = v5 - 96;
LABEL_41:
    id v43 = v70;
    if (v27 <= v46) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  if (v7 >= -95)
  {
    size_t v11 = 96 * v8;
    if (__dst != __src || &__src[v11] <= __dst) {
      memmove(__dst, __src, v11);
    }
    Swift::Int v48 = &v4[v11];
    id v71 = &v4[v11];
    if ((unint64_t)v5 < a3 && v7 >= 96)
    {
      id v12 = v4;
      while (1)
      {
        uint64_t v45 = v4;
        id v69 = v6;
        id v13 = (void *)*((void *)v5 + 1);
        uint64_t v14 = *((void *)v5 + 4);
        uint64_t v67 = v14;
        char v15 = v5[40];
        uint64_t v16 = (void *)*((void *)v5 + 6);
        uint64_t v17 = (void *)*((void *)v5 + 8);
        uint64_t v52 = (void *)*((void *)v12 + 1);
        char v53 = v12[40];
        uint64_t v59 = (void *)*((void *)v12 + 6);
        char v62 = (void *)*((void *)v12 + 8);
        uint64_t v55 = *((void *)v12 + 4);
        swift_retain();
        id v18 = v13;
        sub_1000064F4(v14, v15);
        swift_retain();
        id v63 = v16;
        id v65 = v17;
        swift_retain();
        id v19 = v52;
        sub_1000064F4(v55, v53);
        swift_retain();
        id v20 = v18;
        id v60 = v59;
        id v21 = v62;
        LODWORD(v62) = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();

        id v22 = v19;
        LOBYTE(v19) = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();
        swift_release();

        sub_100006550(v55, v53);
        swift_release();

        swift_release();
        sub_100006550(v67, v15);
        swift_release();

        if (v62 >= v19)
        {
          uint64_t v4 = v12 + 96;
          char v24 = v69;
          long long v25 = v12;
          uint64_t v23 = v5;
          if (v69 == v12)
          {
            v12 += 96;
            if (v69 < v4) {
              goto LABEL_19;
            }
          }
          else
          {
            v12 += 96;
          }
        }
        else
        {
          uint64_t v23 = v5 + 96;
          char v24 = v69;
          long long v25 = v5;
          if (v69 == v5)
          {
            uint64_t v4 = v45;
            if (v69 < v23) {
              goto LABEL_19;
            }
          }
          else
          {
            uint64_t v4 = v45;
          }
        }
        memmove(v24, v25, 0x60uLL);
LABEL_19:
        uint64_t v6 = v24 + 96;
        if (v12 < v48)
        {
          uint64_t v5 = v23;
          if ((unint64_t)v23 < a3) {
            continue;
          }
        }
        BOOL v72 = v4;
        uint64_t v73 = v6;
        goto LABEL_43;
      }
    }
    goto LABEL_43;
  }
LABEL_44:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000145B4(long long *a1, long long *a2)
{
  long long v15 = *a1;
  id v3 = *((id *)&v15 + 1);
  uint64_t v4 = dispatch thunk of CAFCameraButtonObservable.symbolName.getter();
  uint64_t v6 = v5;
  sub_10000C008((uint64_t)&v15);
  long long v14 = *a2;
  id v7 = *((id *)&v14 + 1);
  uint64_t v8 = dispatch thunk of CAFCameraButtonObservable.symbolName.getter();
  uint64_t v10 = v9;
  sub_10000C008((uint64_t)&v14);
  if (v4 == v8 && v6 == v10) {
    char v12 = 1;
  }
  else {
    char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

uint64_t sub_10001467C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005214(&qword_10003F500);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000146E4(uint64_t a1)
{
  uint64_t v2 = sub_100005214(&qword_10003F500);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100014744(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return;
  }
  unint64_t v2 = 0;
  uint64_t v39 = -(uint64_t)v1;
  uint64_t v37 = a1 + 64;
  id v3 = _swiftEmptyArrayStorage;
  unint64_t v36 = *(void *)(a1 + 16);
  do
  {
    unsigned int v38 = v3;
    if (v2 <= v1) {
      unint64_t v4 = v1;
    }
    else {
      unint64_t v4 = v2;
    }
    uint64_t v47 = -(uint64_t)v4;
    uint64_t v5 = v37 + 96 * v2;
    unint64_t v6 = v2 + 1;
    while (1)
    {
      if (v47 + v6 == 1)
      {
        __break(1u);
        return;
      }
      unint64_t v51 = v6;
      id v7 = *(void **)(v5 - 24);
      uint64_t v8 = *(void *)(v5 - 16);
      uint64_t v45 = *(void *)(v5 - 8);
      uint64_t v46 = *(void *)(v5 - 32);
      uint64_t v9 = *(void *)v5;
      char v10 = *(unsigned char *)(v5 + 8);
      size_t v11 = *(void **)(v5 + 16);
      uint64_t v43 = *(void *)(v5 + 24);
      char v12 = *(void **)(v5 + 32);
      uint64_t v13 = *(void *)(v5 + 48);
      char v40 = *(unsigned char *)(v5 + 56);
      char v41 = *(unsigned char *)(v5 + 40);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      id v14 = v7;
      uint64_t v53 = v9;
      char v52 = v10;
      char v15 = v10;
      uint64_t v16 = v8;
      sub_1000064F4(v9, v15);
      swift_retain();
      uint64_t v44 = v11;
      id v17 = v11;
      id v42 = v12;
      id v18 = v12;
      id v19 = v14;
      id v20 = v18;
      static Published.subscript.getter();
      swift_release();
      swift_release();
      if (!v55) {
        goto LABEL_12;
      }
      id v48 = v20;
      id v49 = v17;
      uint64_t v50 = v8;
      id v21 = v14;
      uint64_t v22 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
      uint64_t v24 = v23;

      id v25 = v55;
      uint64_t v26 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
      uint64_t v28 = v27;

      if (v22 == v26 && v24 == v28) {
        break;
      }
      char v29 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10000C67C(v54, v55, v56, v57, v58, v59, v60, v61, v62);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v16 = v50;
      id v20 = v48;
      id v17 = v49;
      if (v29) {
        goto LABEL_16;
      }
LABEL_12:
      id v30 = v14;
      char v31 = (void *)CAFCameraButtonObservable.observed.getter();

      unsigned __int8 v32 = [v31 hidden];
      if ((v32 & 1) == 0) {
        goto LABEL_16;
      }
      swift_release();

      sub_100006550(v53, v52);
      swift_release();

      unint64_t v6 = v51 + 1;
      v5 += 96;
      if (v39 + v51 + 1 == 1) {
        return;
      }
    }
    sub_10000C67C(v54, v55, v56, v57, v58, v59, v60, v61, v62);
    swift_bridgeObjectRelease_n();
    uint64_t v16 = v50;
LABEL_16:
    id v3 = v38;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_10000C034(0, v38[2] + 1, 1);
      id v3 = v38;
    }
    unint64_t v1 = v36;
    unint64_t v34 = v3[2];
    unint64_t v33 = v3[3];
    if (v34 >= v33 >> 1)
    {
      sub_10000C034(v33 > 1, v34 + 1, 1);
      id v3 = v38;
    }
    v3[2] = v34 + 1;
    id v35 = &v3[12 * v34];
    v35[4] = v46;
    v35[5] = v19;
    v35[6] = v16;
    v35[7] = v45;
    v35[8] = v53;
    *((unsigned char *)v35 + 72) = v52;
    v35[10] = v44;
    v35[11] = v43;
    v35[12] = v42;
    *((unsigned char *)v35 + 104) = v41;
    v35[14] = v13;
    *((unsigned char *)v35 + 120) = v40;
    unint64_t v2 = v51;
  }
  while (v39 + v51);
}

uint64_t sub_100014B70(uint64_t a1, unint64_t *a2)
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

unint64_t sub_100014BAC()
{
  unint64_t result = qword_10003F580;
  if (!qword_10003F580)
  {
    sub_100014B70(255, &qword_10003F578);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F580);
  }
  return result;
}

uint64_t sub_100014C14(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100014C5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005214(&qword_10003F530);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100014CC4(uint64_t a1)
{
  id v2 = *(id *)(a1 + 8);
  return a1;
}

uint64_t sub_100014CF0(uint64_t a1)
{
  return a1;
}

void sub_100014D54()
{
  uint64_t v1 = v0;
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000062F4(v2, (uint64_t)qword_100041A08);
  id v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    v10[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_10000E6A0(0xD00000000000001BLL, 0x800000010002E1D0, v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "[CAMERAMODEL] %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v6 = v1 + OBJC_IVAR____TtC9CarCamera11CameraModel__carObservable;
  swift_beginAccess();
  id v7 = *(id *)(v6 + 8);
  uint64_t v8 = (void *)CAFCarObservable.observed.getter();

  id v9 = [v8 automakerExteriorCamera];
  if (v9)
  {
    sub_100010D44(v9);
  }
}

void sub_100014F40(void *a1)
{
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000062F4(v2, (uint64_t)qword_100041A08);
  id v8 = a1;
  id v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 67109378;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v5 + 8) = 2112;
    id v7 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v6 = v8;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "[CAMERAMODEL] CAFCameraGeneral didUpdateOn %{BOOL}d %@", (uint8_t *)v5, 0x12u);
    sub_100005214(&qword_1000401B0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

uint64_t sub_100015134()
{
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000062F4(v0, (uint64_t)qword_100041A08);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v3 = 16777472;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "[CAMERAMODEL] CAFCameraButtonObserver didUpdateSortOrder %hhu", v3, 5u);
    swift_slowDealloc();
  }

  return sub_1000120C8();
}

uint64_t sub_100015250@<X0>(uint64_t a1@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v24 = sub_100005214(&qword_10003F660) - 8;
  __chkstk_darwin(v24);
  id v3 = (uint64_t *)((char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v26 = type metadata accessor for ColorScheme();
  uint64_t v4 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  id v25 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005214(&qword_10003F668);
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  id v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = static Alignment.center.getter();
  uint64_t v12 = v11;
  sub_1000155AC(v1, v29);
  type metadata accessor for LayoutSize();
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = *(_OWORD *)(v1 + 40);
  sub_1000172FC(&qword_10003EDF8, (void (*)(uint64_t))type metadata accessor for LayoutSize);
  uint64_t v14 = static ObservableObject.environmentStore.getter();
  *(void *)&long long v28 = v10;
  *((void *)&v28 + 1) = v12;
  *(void *)&long long v30 = v14;
  *((void *)&v30 + 1) = v13;
  uint64_t v15 = static SafeAreaRegions.all.getter();
  char v16 = static Edge.Set.all.getter();
  v31[12] = v29[11];
  v31[13] = v29[12];
  v31[14] = v29[13];
  v31[15] = v30;
  v31[8] = v29[7];
  v31[9] = v29[8];
  v31[10] = v29[9];
  v31[11] = v29[10];
  v31[4] = v29[3];
  v31[5] = v29[4];
  v31[6] = v29[5];
  v31[7] = v29[6];
  v31[0] = v28;
  v31[1] = v29[0];
  v31[2] = v29[1];
  v31[3] = v29[2];
  *(void *)&v31[16] = v15;
  BYTE8(v31[16]) = v16;
  uint64_t KeyPath = swift_getKeyPath();
  id v19 = v25;
  uint64_t v18 = v26;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v25, enum case for ColorScheme.dark(_:), v26);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v3 + *(int *)(v24 + 36), v19, v18);
  *id v3 = KeyPath;
  sub_1000052C0((uint64_t)v3, (uint64_t)&v9[*(int *)(v7 + 44)], &qword_10003F660);
  memcpy(v9, v31, 0x109uLL);
  sub_100016C68((uint64_t)v31);
  sub_100005474((uint64_t)v3, &qword_10003F660);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v19, v18);
  sub_100016E24((uint64_t)&v28);
  uint64_t v20 = static Color.black.getter();
  LOBYTE(v18) = static Edge.Set.all.getter();
  uint64_t v21 = v27;
  sub_1000052C0((uint64_t)v9, v27, &qword_10003F668);
  uint64_t v22 = v21 + *(int *)(sub_100005214(&qword_10003F670) + 36);
  *(void *)uint64_t v22 = v20;
  *(unsigned char *)(v22 + 8) = v18;
  return sub_100005474((uint64_t)v9, &qword_10003F668);
}

double sub_1000155AC@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4 = *(void *)a1;
  char v5 = *(unsigned char *)(a1 + 8);
  sub_1000064F4(*(void *)a1, v5);
  char v6 = sub_10000E010(v4, v5);
  sub_100006550(v4, v5);
  uint64_t v7 = static VerticalAlignment.center.getter();
  if (v6)
  {
    sub_100016170(a1, (uint64_t)&v24);
    *(_OWORD *)&v27[151] = v25[8];
    *(_OWORD *)&v27[167] = v25[9];
    *(_OWORD *)&v27[183] = v25[10];
    *(_WORD *)&v27[199] = v26;
    *(_OWORD *)&v27[87] = v25[4];
    *(_OWORD *)&v27[103] = v25[5];
    *(_OWORD *)&v27[119] = v25[6];
    *(_OWORD *)&v27[135] = v25[7];
    *(_OWORD *)&v27[23] = v25[0];
    *(_OWORD *)&v27[39] = v25[1];
    *(_OWORD *)&v27[55] = v25[2];
    *(_OWORD *)&v27[71] = v25[3];
    *(_OWORD *)&v27[7] = v24;
    *(_OWORD *)&v29[153] = *(_OWORD *)&v27[144];
    long long v30 = *(_OWORD *)&v27[160];
    *(_OWORD *)char v31 = *(_OWORD *)&v27[176];
    *(_OWORD *)&v31[9] = *(_OWORD *)&v27[185];
    *(_OWORD *)&v29[89] = *(_OWORD *)&v27[80];
    *(_OWORD *)&v29[105] = *(_OWORD *)&v27[96];
    *(_OWORD *)&v29[121] = *(_OWORD *)&v27[112];
    *(_OWORD *)&v29[137] = *(_OWORD *)&v27[128];
    *(_OWORD *)&v29[25] = *(_OWORD *)&v27[16];
    *(_OWORD *)&v29[41] = *(_OWORD *)&v27[32];
    *(_OWORD *)&v29[57] = *(_OWORD *)&v27[48];
    *(_OWORD *)&v29[73] = *(_OWORD *)&v27[64];
    LOBYTE(v19) = 1;
    uint64_t v28 = v7;
    *(void *)char v29 = 0;
    v29[8] = 1;
    *(_OWORD *)&v29[9] = *(_OWORD *)v27;
    sub_1000170EC((uint64_t)&v28);
    sub_100009328((uint64_t)&v28, (uint64_t)v22, &qword_10003F678);
    sub_100005214(&qword_10003F680);
    sub_100005214(&qword_10003F688);
    sub_100009490(&qword_10003F690, &qword_10003F680);
    sub_100009490(&qword_10003F698, &qword_10003F688);
    _ConditionalContent<>.init(storage:)();
  }
  else
  {
    sub_100015AF0(a1, (uint64_t)v15);
    char v18 = 1;
    *(_OWORD *)((char *)&v17[2] + 7) = v15[2];
    *(_OWORD *)((char *)&v17[1] + 7) = v15[1];
    *(_OWORD *)((char *)&v17[6] + 7) = v15[6];
    *(_OWORD *)((char *)&v17[5] + 7) = v15[5];
    *(_OWORD *)((char *)&v17[7] + 7) = v15[7];
    *(_WORD *)((char *)&v17[8] + 7) = v16;
    *(_OWORD *)((char *)&v17[3] + 7) = v15[3];
    *(_OWORD *)((char *)&v17[4] + 7) = v15[4];
    *(_OWORD *)((char *)v17 + 7) = v15[0];
    long long v19 = (unint64_t)v7;
    v20[0] = 1;
    *(_OWORD *)&v20[33] = v17[2];
    *(_OWORD *)&v20[17] = v17[1];
    *(_OWORD *)&v20[81] = v17[5];
    *(_OWORD *)&v20[97] = v17[6];
    *(_OWORD *)&v20[113] = v17[7];
    *(_OWORD *)&v20[122] = *(_OWORD *)((char *)&v17[7] + 9);
    *(_OWORD *)&v20[49] = v17[3];
    *(_OWORD *)&v20[65] = v17[4];
    *(_OWORD *)&v20[1] = v17[0];
    *(_OWORD *)&v27[103] = *(_OWORD *)&v20[80];
    *(_OWORD *)&v27[119] = *(_OWORD *)&v20[96];
    *(_OWORD *)&v27[135] = *(_OWORD *)&v20[112];
    *(_OWORD *)&v27[145] = *(_OWORD *)((char *)&v17[7] + 9);
    *(_OWORD *)&v27[39] = *(_OWORD *)&v20[16];
    *(_OWORD *)&v27[55] = *(_OWORD *)&v20[32];
    *(_OWORD *)&v27[71] = *(_OWORD *)&v20[48];
    *(_OWORD *)&v27[87] = *(_OWORD *)&v20[64];
    *(_OWORD *)&v27[7] = (unint64_t)v7;
    *(_OWORD *)&v27[23] = *(_OWORD *)v20;
    *(_OWORD *)((char *)&v25[5] + 1) = v17[5];
    *(_OWORD *)((char *)&v25[6] + 1) = v17[6];
    *(_OWORD *)((char *)&v25[7] + 1) = v17[7];
    *(_OWORD *)((char *)&v25[7] + 10) = *(_OWORD *)((char *)&v17[7] + 9);
    *(_OWORD *)((char *)&v25[1] + 1) = v17[1];
    *(_OWORD *)((char *)&v25[2] + 1) = v17[2];
    *(_OWORD *)((char *)&v25[3] + 1) = v17[3];
    *(_OWORD *)((char *)&v25[4] + 1) = v17[4];
    char v21 = 1;
    long long v24 = (unint64_t)v7;
    LOBYTE(v25[0]) = 1;
    *(_OWORD *)((char *)v25 + 1) = v17[0];
    sub_1000170F8((uint64_t)&v19, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))sub_100016D30);
    sub_100017178((uint64_t)v15, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))sub_100016D30);
    sub_1000170F8((uint64_t)&v24, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))sub_100016FA8);
    *(_OWORD *)&v29[113] = *(_OWORD *)&v27[112];
    *(_OWORD *)&v29[129] = *(_OWORD *)&v27[128];
    *(_OWORD *)&v29[145] = *(_OWORD *)&v27[144];
    *(_OWORD *)&v29[49] = *(_OWORD *)&v27[48];
    *(_OWORD *)&v29[65] = *(_OWORD *)&v27[64];
    *(_OWORD *)&v29[81] = *(_OWORD *)&v27[80];
    *(_OWORD *)&v29[97] = *(_OWORD *)&v27[96];
    *(_OWORD *)&v29[1] = *(_OWORD *)v27;
    *(_OWORD *)&v29[17] = *(_OWORD *)&v27[16];
    uint64_t v28 = 0;
    v29[0] = 1;
    v29[161] = v27[160];
    *(_OWORD *)&v29[33] = *(_OWORD *)&v27[32];
    sub_100017170((uint64_t)&v28);
    sub_100009328((uint64_t)&v28, (uint64_t)&v32, &qword_10003F678);
    sub_100005214(&qword_10003F680);
    sub_100005214(&qword_10003F688);
    sub_100009490(&qword_10003F690, &qword_10003F680);
    sub_100009490(&qword_10003F698, &qword_10003F688);
    _ConditionalContent<>.init(storage:)();
    sub_100017178((uint64_t)v15, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))sub_100016FA8);
    long long v42 = v22[10];
    long long v43 = v22[11];
    v44[0] = v23[0];
    *(_OWORD *)((char *)v44 + 11) = *(_OWORD *)((char *)v23 + 11);
    long long v38 = v22[6];
    long long v39 = v22[7];
    long long v40 = v22[8];
    long long v41 = v22[9];
    long long v34 = v22[2];
    long long v35 = v22[3];
    long long v36 = v22[4];
    long long v37 = v22[5];
    long long v32 = v22[0];
    long long v33 = v22[1];
  }
  long long v8 = v43;
  a2[10] = v42;
  a2[11] = v8;
  a2[12] = v44[0];
  *(_OWORD *)((char *)a2 + 203) = *(_OWORD *)((char *)v44 + 11);
  long long v9 = v39;
  a2[6] = v38;
  a2[7] = v9;
  long long v10 = v41;
  a2[8] = v40;
  a2[9] = v10;
  long long v11 = v35;
  a2[2] = v34;
  a2[3] = v11;
  long long v12 = v37;
  a2[4] = v36;
  a2[5] = v12;
  double result = *(double *)&v32;
  long long v14 = v33;
  *a2 = v32;
  a2[1] = v14;
  return result;
}

__n128 sub_100015AF0@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for CameraCAFManager();
  sub_1000172FC(&qword_10003EEF8, (void (*)(uint64_t))type metadata accessor for CameraCAFManager);
  uint64_t v4 = (void *)StateObject.wrappedValue.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();

  swift_release();
  swift_release();
  if ((void)v45)
  {
    uint64_t KeyPath = swift_getKeyPath();
    type metadata accessor for CameraModel();
    sub_1000172FC(&qword_10003F6F0, (void (*)(uint64_t))type metadata accessor for CameraModel);
    uint64_t v5 = EnvironmentObject.init()();
    uint64_t v7 = v6;
    uint64_t v8 = static ObservableObject.environmentStore.getter();
    id v9 = (id)v45;
    unsigned __int8 v10 = static Edge.Set.bottom.getter();
    unsigned __int8 v11 = static Edge.Set.top.getter();
    unsigned __int8 v12 = Edge.Set.init(rawValue:)();
    Edge.Set.init(rawValue:)();
    if (Edge.Set.init(rawValue:)() != v10) {
      unsigned __int8 v12 = Edge.Set.init(rawValue:)();
    }
    Edge.Set.init(rawValue:)();
    if (Edge.Set.init(rawValue:)() != v11) {
      unsigned __int8 v12 = Edge.Set.init(rawValue:)();
    }
    uint64_t v13 = *(void *)a1;
    char v14 = *(unsigned char *)(a1 + 8);
    sub_1000064F4(v13, v14);
    sub_10000E010(v13, v14);
    sub_100006550(v13, v14);
    EdgeInsets.init(_all:)();
    uint64_t v31 = KeyPath;
    LOBYTE(v32) = 0;
    uint64_t v33 = v5;
    uint64_t v34 = v7;
    uint64_t v35 = v8;
    unint64_t v36 = v45;
    unsigned __int8 v37 = v12;
    uint64_t v38 = v15;
    *(void *)&long long v39 = v16;
    *((void *)&v39 + 1) = v17;
    uint64_t v40 = v18;
    char v41 = 0;
    sub_100017344((uint64_t)&v31);
    sub_100009328((uint64_t)&v31, (uint64_t)&v45, &qword_10003F6A0);
    sub_100005214(&qword_10003F6A8);
    sub_100005214(&qword_10003F6B0);
    sub_10001757C(&qword_10003F6B8, &qword_10003F6A8, (void (*)(void))sub_100017200);
    sub_100009490(&qword_10003F6E8, &qword_10003F6B0);
    _ConditionalContent<>.init(storage:)();

    *(_OWORD *)&v48[32] = v25[6];
    long long v49 = v25[7];
    __int16 v50 = v26;
    *(_OWORD *)uint64_t v47 = v25[2];
    *(_OWORD *)&v47[16] = v25[3];
    *(_OWORD *)id v48 = v25[4];
    *(_OWORD *)&v48[16] = v25[5];
    long long v45 = v25[0];
    __n128 v46 = (__n128)v25[1];
  }
  else
  {
    uint64_t v19 = static HorizontalAlignment.center.getter();
    sub_100015F74(a1, (uint64_t)&v45);
    char v30 = 1;
    char v29 = BYTE8(v45);
    unsigned __int8 v28 = v46.n128_u8[8];
    char v27 = v48[40];
    uint64_t v31 = v19;
    uint64_t v32 = 0;
    LOBYTE(v33) = 1;
    uint64_t v34 = v45;
    LOBYTE(v35) = BYTE8(v45);
    unint64_t v36 = v46.n128_u64[0];
    unsigned __int8 v37 = v46.n128_u8[8];
    LOBYTE(v38) = v47[0];
    long long v39 = *(_OWORD *)&v47[8];
    uint64_t v40 = *(void *)&v47[24];
    char v41 = v48[0];
    long long v42 = *(_OWORD *)&v48[8];
    long long v43 = *(_OWORD *)&v48[24];
    char v44 = v48[40];
    sub_1000171F4((uint64_t)&v31);
    sub_100009328((uint64_t)&v31, (uint64_t)v25, &qword_10003F6A0);
    sub_100005214(&qword_10003F6A8);
    sub_100005214(&qword_10003F6B0);
    sub_10001757C(&qword_10003F6B8, &qword_10003F6A8, (void (*)(void))sub_100017200);
    sub_100009490(&qword_10003F6E8, &qword_10003F6B0);
    _ConditionalContent<>.init(storage:)();
  }
  long long v20 = v49;
  *(_OWORD *)(a2 + 96) = *(_OWORD *)&v48[32];
  *(_OWORD *)(a2 + 112) = v20;
  *(_WORD *)(a2 + 128) = v50;
  long long v21 = *(_OWORD *)&v47[16];
  *(_OWORD *)(a2 + 32) = *(_OWORD *)v47;
  *(_OWORD *)(a2 + 48) = v21;
  long long v22 = *(_OWORD *)&v48[16];
  *(_OWORD *)(a2 + 64) = *(_OWORD *)v48;
  *(_OWORD *)(a2 + 80) = v22;
  __n128 result = v46;
  *(_OWORD *)a2 = v45;
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t sub_100015F74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = [self mainBundle];
  v22._object = (void *)0xE000000000000000;
  v5._countAndFlagsBits = 0x494C414954494E49;
  v5._object = (void *)0xEC000000474E495ALL;
  v6.value._countAndFlagsBits = 0x6172656D6143;
  v6.value._object = (void *)0xE600000000000000;
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  v22._countAndFlagsBits = 0;
  Swift::String v8 = NSLocalizedString(_:tableName:bundle:value:comment:)(v5, v6, (NSBundle)v4, v7, v22);

  uint64_t KeyPath = swift_getKeyPath();
  State.init(wrappedValue:)();
  unsigned __int8 v10 = static Edge.Set.bottom.getter();
  unsigned __int8 v11 = static Edge.Set.top.getter();
  char v12 = Edge.Set.init(rawValue:)();
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v10) {
    char v12 = Edge.Set.init(rawValue:)();
  }
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v11) {
    char v12 = Edge.Set.init(rawValue:)();
  }
  uint64_t v13 = *(void *)a1;
  char v14 = *(unsigned char *)(a1 + 8);
  sub_1000064F4(v13, v14);
  sub_10000E010(v13, v14);
  sub_100006550(v13, v14);
  EdgeInsets.init(_all:)();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  *(void *)(a2 + 16) = KeyPath;
  *(unsigned char *)(a2 + 24) = 0;
  *(unsigned char *)(a2 + 32) = v20;
  *(void *)(a2 + 40) = v21;
  *(Swift::String *)(a2 + 48) = v8;
  *(unsigned char *)(a2 + 64) = v12;
  *(void *)(a2 + 72) = v15;
  *(void *)(a2 + 80) = v16;
  *(void *)(a2 + 88) = v17;
  *(void *)(a2 + 96) = v18;
  *(unsigned char *)(a2 + 104) = 0;
  sub_1000064F4(KeyPath, 0);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100006550(KeyPath, 0);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_100016170@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for CameraCAFManager();
  sub_1000172FC(&qword_10003EEF8, (void (*)(uint64_t))type metadata accessor for CameraCAFManager);
  id v4 = (char *)StateObject.wrappedValue.getter();
  id v5 = [*(id *)&v4[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_sessionStatus] currentSession];
  if (v5)
  {
    Swift::String_optional v6 = v5;
    id v7 = [v5 configuration];

    LOBYTE(v6) = [v7 rightHandDrive];
    if (v6)
    {
      char v26 = 0;
      char v43 = 1;
      goto LABEL_6;
    }
  }
  else
  {
  }
  char v43 = 0;
  char v26 = 1;
LABEL_6:
  uint64_t v42 = static VerticalAlignment.center.getter();
  sub_100016604(a1, (uint64_t)v56);
  uint64_t v40 = *(void *)&v56[8];
  uint64_t v41 = *(void *)v56;
  uint64_t v38 = *(void *)&v56[24];
  uint64_t v39 = *(void *)&v56[16];
  uint64_t v36 = *(void *)&v56[40];
  uint64_t v37 = *(void *)&v56[32];
  uint64_t v34 = *(void *)&v56[56];
  uint64_t v35 = *(void *)&v56[48];
  uint64_t v32 = *(void *)&v56[72];
  uint64_t v33 = *(void *)&v56[64];
  uint64_t v31 = *(void *)&v56[80];
  char v30 = v56[88];
  char v8 = v56[89];
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v28 = v85;
  uint64_t v29 = v83;
  uint64_t v9 = v88;
  uint64_t v27 = v87;
  char v82 = 1;
  char v81 = v8;
  char v80 = v84;
  char v79 = v86;
  unsigned __int8 v10 = (char *)StateObject.wrappedValue.getter();
  id v11 = [*(id *)&v10[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_sessionStatus] currentSession];
  char v12 = v11;
  if (v11)
  {
    id v13 = [v11 configuration];

    LOBYTE(v12) = [v13 rightHandDrive];
    char v14 = v12 ^ 1;
  }
  else
  {

    char v14 = 1;
  }
  char v15 = v82;
  char v16 = v81;
  char v17 = v80;
  char v18 = v79;
  long long v44 = (unint64_t)v42;
  LOBYTE(v45) = v82;
  *((void *)&v45 + 1) = v41;
  *(void *)&long long v46 = v40;
  *((void *)&v46 + 1) = v39;
  *(void *)&long long v47 = v38;
  *((void *)&v47 + 1) = v37;
  *(void *)&long long v48 = v36;
  *((void *)&v48 + 1) = v35;
  *(void *)&long long v49 = v34;
  *((void *)&v49 + 1) = v33;
  *(void *)&long long v50 = v32;
  *((void *)&v50 + 1) = v31;
  LOBYTE(v51) = v30;
  BYTE1(v51) = v81;
  *((void *)&v51 + 1) = v29;
  LOBYTE(v52) = v80;
  *((void *)&v52 + 1) = v28;
  LOBYTE(v53) = v79;
  *((void *)&v53 + 1) = v27;
  uint64_t v54 = v9;
  char v57 = v26;
  *(void *)&v56[166] = v9;
  *(_OWORD *)&v56[38] = v46;
  *(_OWORD *)&v56[22] = v45;
  *(_OWORD *)&v56[118] = v51;
  *(_OWORD *)&v56[6] = (unint64_t)v42;
  *(_OWORD *)&v56[102] = v50;
  *(_OWORD *)&v56[86] = v49;
  *(_OWORD *)&v56[70] = v48;
  *(_OWORD *)&v56[54] = v47;
  *(_OWORD *)&v56[150] = v53;
  *(_OWORD *)&v56[134] = v52;
  char v55 = (char)v12;
  long long v19 = *(_OWORD *)&v56[96];
  *(_OWORD *)(a2 + 122) = *(_OWORD *)&v56[112];
  long long v20 = *(_OWORD *)&v56[144];
  *(_OWORD *)(a2 + 138) = *(_OWORD *)&v56[128];
  *(_OWORD *)(a2 + 154) = v20;
  *(_OWORD *)(a2 + 168) = *(_OWORD *)&v56[158];
  long long v21 = *(_OWORD *)&v56[32];
  *(_OWORD *)(a2 + 58) = *(_OWORD *)&v56[48];
  long long v22 = *(_OWORD *)&v56[80];
  *(_OWORD *)(a2 + 74) = *(_OWORD *)&v56[64];
  *(_OWORD *)(a2 + 90) = v22;
  *(_OWORD *)(a2 + 106) = v19;
  long long v23 = *(_OWORD *)&v56[16];
  *(_OWORD *)(a2 + 10) = *(_OWORD *)v56;
  *(_OWORD *)(a2 + 26) = v23;
  *(_OWORD *)(a2 + 42) = v21;
  char v24 = v55;
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = v43;
  *(unsigned char *)(a2 + 9) = v26;
  *(void *)(a2 + 184) = 0;
  *(unsigned char *)(a2 + 192) = v14;
  *(unsigned char *)(a2 + 193) = v24;
  v58[0] = v42;
  v58[1] = 0;
  char v59 = v15;
  uint64_t v60 = v41;
  uint64_t v61 = v40;
  uint64_t v62 = v39;
  uint64_t v63 = v38;
  uint64_t v64 = v37;
  uint64_t v65 = v36;
  uint64_t v66 = v35;
  uint64_t v67 = v34;
  uint64_t v68 = v33;
  uint64_t v69 = v32;
  uint64_t v70 = v31;
  char v71 = v30;
  char v72 = v16;
  uint64_t v73 = v29;
  char v74 = v17;
  uint64_t v75 = v28;
  char v76 = v18;
  uint64_t v77 = v27;
  uint64_t v78 = v9;
  sub_10001734C((uint64_t)&v44, (void (*)(void, void, void, void, void, void, void, void, void, void, void, _WORD))sub_100016DAC);
  return sub_10001734C((uint64_t)v58, (void (*)(void, void, void, void, void, void, void, void, void, void, void, _WORD))sub_100017048);
}

double sub_100016604@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for CameraCAFManager();
  sub_1000172FC(&qword_10003EEF8, (void (*)(uint64_t))type metadata accessor for CameraCAFManager);
  id v4 = (void *)StateObject.wrappedValue.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();

  swift_release();
  swift_release();
  swift_getKeyPath();
  if ((void)v11)
  {
    type metadata accessor for CameraModel();
    sub_1000172FC(&qword_10003F6F0, (void (*)(uint64_t))type metadata accessor for CameraModel);
    EnvironmentObject.init()();
    static ObservableObject.environmentStore.getter();
    id v5 = (id)v11;
    unsigned __int8 v6 = static Edge.Set.leading.getter();
    unsigned __int8 v7 = static Edge.Set.trailing.getter();
    Edge.Set.init(rawValue:)();
    Edge.Set.init(rawValue:)();
    if (Edge.Set.init(rawValue:)() != v6) {
      Edge.Set.init(rawValue:)();
    }
    Edge.Set.init(rawValue:)();
    if (Edge.Set.init(rawValue:)() != v7) {
      Edge.Set.init(rawValue:)();
    }
    uint64_t v8 = *(void *)a1;
    char v9 = *(unsigned char *)(a1 + 8);
    sub_1000064F4(v8, v9);
    sub_10000E010(v8, v9);
    sub_100006550(v8, v9);
    EdgeInsets.init(_all:)();
    sub_100005214(&qword_10003F6A8);
    sub_10001757C(&qword_10003F6B8, &qword_10003F6A8, (void (*)(void))sub_100017200);
    sub_1000173B8();
    _ConditionalContent<>.init(storage:)();
  }
  else
  {
    State.init(wrappedValue:)();
    sub_100005214(&qword_10003F6A8);
    sub_10001757C(&qword_10003F6B8, &qword_10003F6A8, (void (*)(void))sub_100017200);
    sub_1000173B8();
    _ConditionalContent<>.init(storage:)();
  }
  double result = *(double *)&v11;
  *(_OWORD *)a2 = v11;
  *(_OWORD *)(a2 + 16) = v12;
  *(_OWORD *)(a2 + 32) = v13;
  *(_OWORD *)(a2 + 48) = v14;
  *(_OWORD *)(a2 + 64) = v15;
  *(void *)(a2 + 80) = v16;
  *(unsigned char *)(a2 + 88) = v17;
  *(unsigned char *)(a2 + 89) = v18;
  return result;
}

uint64_t sub_100016994@<X0>(uint64_t a1@<X8>)
{
  return sub_100015250(a1);
}

void destroy for ContentView(uint64_t a1)
{
  sub_100006550(*(void *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v2 = *(void *)(a1 + 16);
  id v3 = *(void **)(a1 + 24);
  char v4 = *(unsigned char *)(a1 + 32);

  sub_100008A10(v2, v3, v4);
}

uint64_t initializeWithCopy for ContentView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1000064F4(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  char v8 = *(unsigned char *)(a2 + 32);
  sub_1000089C0(v6, v7, v8);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  return a1;
}

uint64_t assignWithCopy for ContentView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1000064F4(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_100006550(v6, v7);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 24);
  char v10 = *(unsigned char *)(a2 + 32);
  sub_1000089C0(v8, v9, v10);
  uint64_t v11 = *(void *)(a1 + 16);
  long long v12 = *(void **)(a1 + 24);
  char v13 = *(unsigned char *)(a1 + 32);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v9;
  *(unsigned char *)(a1 + 32) = v10;
  sub_100008A10(v11, v12, v13);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t assignWithTake for ContentView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_100006550(v6, v7);
  char v8 = *((unsigned char *)a2 + 32);
  uint64_t v9 = *(void *)(a1 + 16);
  char v10 = *(void **)(a1 + 24);
  char v11 = *(unsigned char *)(a1 + 32);
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  *(unsigned char *)(a1 + 32) = v8;
  sub_100008A10(v9, v10, v11);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContentView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ContentView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)double result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContentView()
{
  return &type metadata for ContentView;
}

uint64_t sub_100016C44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100016C68(uint64_t a1)
{
  sub_100016EEC(*(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    *(void *)(a1 + 224),
    *(_WORD *)(a1 + 232),
    *(unsigned char *)(a1 + 234),
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100016D30,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100016DAC);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_100016D30(uint64_t a1, char a2, void *a3, uint64_t a4, uint64_t a5, void *a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, char a18)
{
  if (a18)
  {
    sub_1000064F4((uint64_t)a6, a7 & 1);
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_1000064F4(a1, a2 & 1);
    id v20 = a6;
    id v21 = a3;
  }

  return swift_retain();
}

uint64_t sub_100016DAC(uint64_t a1, char a2, void *a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, char a13)
{
  sub_1000064F4(a1, a2 & 1);
  if (a13)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    id v15 = a6;
    id v16 = a3;
  }

  return swift_retain();
}

uint64_t sub_100016E24(uint64_t a1)
{
  sub_100016EEC(*(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    *(void *)(a1 + 224),
    *(_WORD *)(a1 + 232),
    *(unsigned char *)(a1 + 234),
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100016FA8,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100017048);
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_100016EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,__int16 a28,char a29,uint64_t (*a30)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t),uint64_t (*a31)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (a29)
  {
    return a31(a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19);
  }
  else
  {
    return a30(a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21);
  }
}

void sub_100016FA8(uint64_t a1, char a2, void *a3, uint64_t a4, uint64_t a5, void *a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, char a18)
{
  if (a18)
  {
    sub_100006550((uint64_t)a6, a7 & 1);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100006550(a1, a2 & 1);
    swift_release();
  }
}

void sub_100017048(uint64_t a1, char a2, void *a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, char a13)
{
  if (a13)
  {
    sub_100006550(a1, a2 & 1);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100006550(a1, a2 & 1);
    swift_release();
  }
}

uint64_t sub_1000170EC(uint64_t result)
{
  *(unsigned char *)(result + 218) = 1;
  return result;
}

uint64_t sub_1000170F8(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))
{
  return a1;
}

uint64_t sub_100017170(uint64_t result)
{
  *(unsigned char *)(result + 218) = 0;
  return result;
}

uint64_t sub_100017178(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))
{
  return a1;
}

uint64_t sub_1000171F4(uint64_t result)
{
  *(unsigned char *)(result + 129) = 1;
  return result;
}

unint64_t sub_100017200()
{
  unint64_t result = qword_10003F6C0;
  if (!qword_10003F6C0)
  {
    sub_100005324(&qword_10003F6C8);
    sub_1000172A0();
    sub_100009490(&qword_10003F6D8, &qword_10003F6E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F6C0);
  }
  return result;
}

unint64_t sub_1000172A0()
{
  unint64_t result = qword_10003F6D0;
  if (!qword_10003F6D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F6D0);
  }
  return result;
}

uint64_t sub_1000172FC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100017344(uint64_t result)
{
  *(unsigned char *)(result + 129) = 0;
  return result;
}

uint64_t sub_10001734C(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, _WORD))
{
  return a1;
}

unint64_t sub_1000173B8()
{
  unint64_t result = qword_10003F6F8;
  if (!qword_10003F6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F6F8);
  }
  return result;
}

unint64_t sub_100017410()
{
  unint64_t result = qword_10003F700;
  if (!qword_10003F700)
  {
    sub_100005324(&qword_10003F670);
    sub_1000174B0();
    sub_100009490(&qword_10003F758, &qword_10003F760);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F700);
  }
  return result;
}

unint64_t sub_1000174B0()
{
  unint64_t result = qword_10003F708;
  if (!qword_10003F708)
  {
    sub_100005324(&qword_10003F668);
    sub_10001757C(&qword_10003F710, &qword_10003F718, (void (*)(void))sub_1000175F8);
    sub_100009490(&qword_10003F750, &qword_10003F660);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F708);
  }
  return result;
}

uint64_t sub_10001757C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005324(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000175F8()
{
  unint64_t result = qword_10003F720;
  if (!qword_10003F720)
  {
    sub_100005324(&qword_10003F728);
    sub_100009490(&qword_10003F730, &qword_10003F738);
    sub_100009490(&qword_10003F740, &qword_10003F748);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F720);
  }
  return result;
}

void destroy for CameraView(uint64_t a1)
{
  sub_100006550(*(void *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v2 = *(void **)(a1 + 16);
}

uint64_t initializeWithCopy for CameraView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1000064F4(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  id v8 = v6;
  return a1;
}

uint64_t assignWithCopy for CameraView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1000064F4(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_100006550(v6, v7);
  id v8 = *(void **)(a1 + 16);
  uint64_t v9 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v9;
  id v10 = v9;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

__n128 initializeWithTake for CameraView(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for CameraView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_100006550(v6, v7);
  id v8 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = a2[2];

  *(void *)(a1 + 24) = a2[3];
  return a1;
}

uint64_t getEnumTagSinglePayload for CameraView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CameraView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraView()
{
  return &type metadata for CameraView;
}

uint64_t sub_1000178F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001790C@<X0>(void *a1@<X2>, uint64_t a2@<X8>)
{
  if (a1)
  {
    uint64_t KeyPath = swift_getKeyPath();
    type metadata accessor for ButtonBarLayout(0);
    sub_100017BB0((unint64_t *)&qword_10003EE00, (void (*)(uint64_t))type metadata accessor for ButtonBarLayout);
    id v5 = a1;
    uint64_t v6 = EnvironmentObject.init()();
    uint64_t v8 = v7;
    type metadata accessor for LayoutSize();
    sub_100017BB0(&qword_10003EDF8, (void (*)(uint64_t))type metadata accessor for LayoutSize);
    uint64_t result = EnvironmentObject.init()();
    *(void *)a2 = KeyPath;
    *(unsigned char *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = v6;
    *(void *)(a2 + 24) = v8;
    *(void *)(a2 + 32) = result;
    *(void *)(a2 + 40) = v10;
    *(void *)(a2 + 48) = v5;
  }
  else
  {
    type metadata accessor for CameraModel();
    sub_100017BB0(&qword_10003F6F0, (void (*)(uint64_t))type metadata accessor for CameraModel);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

__n128 sub_100017A70@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  char v4 = *(unsigned char *)(v1 + 8);
  id v5 = *(void **)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  sub_1000064F4(*(void *)v1, v4);
  char v7 = sub_10000E010(v3, v4) & 1;
  sub_100006550(v3, v4);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v3;
  *(unsigned char *)(v8 + 24) = v4;
  *(void *)(v8 + 32) = v5;
  *(void *)(v8 + 40) = v6;
  sub_1000064F4(v3, v4);
  id v9 = v5;
  uint64_t v10 = static HorizontalAlignment.center.getter();
  uint64_t v11 = static VerticalAlignment.center.getter();
  *(unsigned char *)a1 = v7;
  *(void *)(a1 + 8) = v10;
  *(void *)(a1 + 16) = v11;
  __asm { FMOV            V0.2D, #4.0 }
  *(__n128 *)(a1 + 24) = result;
  *(void *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 48) = 1;
  *(void *)(a1 + 56) = sub_100017B90;
  *(void *)(a1 + 64) = v8;
  return result;
}

uint64_t sub_100017B4C()
{
  sub_100006550(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100017B90@<X0>(uint64_t a1@<X8>)
{
  return sub_10001790C(*(void **)(v1 + 32), a1);
}

uint64_t sub_100017BB0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100017BFC()
{
  unint64_t result = qword_10003F768;
  if (!qword_10003F768)
  {
    sub_100005324(&qword_10003F770);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F768);
  }
  return result;
}

uint64_t sub_100017C58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)&v1[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent];
  unint64_t v5 = *(void *)&v1[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent + 8];
  sub_1000189FC(v4, v5, (uint64_t)v29);
  sub_100014C5C((uint64_t)v29, (uint64_t)&v39);
  if (*((void *)&v39 + 1)
    && (long long v40 = v39,
        sub_100014CC4((uint64_t)&v40),
        sub_100014CF0((uint64_t)v29),
        __int16 v6 = dispatch thunk of CAFCameraButtonObservable.selectedEntryIndex.getter(),
        sub_10000C008((uint64_t)&v40),
        (v6 & 0x100) == 0)
    && (_BYTE)v6)
  {
    id v7 = v2;
    uint64_t v8 = swift_bridgeObjectRetain();
    id v9 = sub_10001AB4C(v8);
    swift_bridgeObjectRelease();

    sub_1000189FC(v4, v5, (uint64_t)v30);
    uint64_t result = sub_100014C5C((uint64_t)v30, (uint64_t)v31);
    if (*((void *)&v31[0] + 1)
      && (v41[0] = v31[0],
          sub_100014CC4((uint64_t)v41),
          sub_100014CF0((uint64_t)v30),
          __int16 v11 = dispatch thunk of CAFCameraButtonObservable.selectedEntryIndex.getter(),
          uint64_t result = sub_10000C008((uint64_t)v41),
          (v11 & 0x100) == 0)
      && (_BYTE)v11)
    {
      unint64_t v12 = v11 - 1;
      if (v12 < v9[2])
      {
        char v13 = &v9[12 * (int)v12];
        uint64_t v15 = v13[4];
        long long v14 = (void *)v13[5];
        uint64_t v16 = v13[8];
        char v17 = *((unsigned char *)v13 + 72);
        long long v27 = *((_OWORD *)v13 + 3);
        long long v28 = *((_OWORD *)v13 + 5);
        char v18 = (void *)v13[12];
        char v19 = *((unsigned char *)v13 + 104);
        uint64_t v20 = v13[14];
        char v21 = *((unsigned char *)v13 + 120);
        swift_retain();
        id v22 = v14;
        sub_1000064F4(v16, v17);
        swift_retain();
        id v23 = (id)v28;
        id v24 = v18;
        uint64_t result = swift_bridgeObjectRelease();
        long long v25 = v27;
        long long v26 = v28;
LABEL_11:
        *(void *)a1 = v15;
        *(void *)(a1 + 8) = v22;
        *(_OWORD *)(a1 + 16) = v25;
        *(void *)(a1 + 32) = v16;
        *(unsigned char *)(a1 + 40) = v17;
        *(_OWORD *)(a1 + 48) = v26;
        *(void *)(a1 + 64) = v18;
        *(unsigned char *)(a1 + 72) = v19;
        *(void *)(a1 + 80) = v20;
        *(unsigned char *)(a1 + 88) = v21;
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    sub_1000189FC(v4, v5, (uint64_t)v30);
    uint64_t result = sub_100014C5C((uint64_t)v30, (uint64_t)v31);
    id v22 = (id)*((void *)&v31[0] + 1);
    if (*((void *)&v31[0] + 1))
    {
      long long v25 = v31[1];
      uint64_t v15 = *(void *)&v31[0];
      uint64_t v16 = v32;
      long long v26 = v34;
      char v18 = v35;
      uint64_t v20 = v37;
      char v21 = v38 & 1;
      char v19 = v36 & 1;
      char v17 = v33 & 1;
      goto LABEL_11;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100017EC0(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_1000062F4(v6, (uint64_t)qword_100041A08);
  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "submenuButtons(for:)", v9, 2u);
    swift_slowDealloc();
  }

  sub_1000189FC(a1, a2, (uint64_t)v45);
  uint64_t v10 = v46;
  uint64_t v12 = v47;
  char v11 = v48;
  char v13 = v49;
  long long v14 = v50;
  sub_100014C5C((uint64_t)v45, (uint64_t)v55);
  if (!*((void *)&v55[0] + 1)) {
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  long long v59 = v55[2];
  long long v60 = v55[3];
  v61[0] = v56[0];
  *(_OWORD *)((char *)v61 + 9) = *(_OWORD *)((char *)v56 + 9);
  long long v57 = v55[0];
  long long v58 = v55[1];
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.debug.getter();
  char v43 = v11;
  if (os_log_type_enabled(v15, v16))
  {
    char v17 = (uint8_t *)swift_slowAlloc();
    v54[0] = swift_slowAlloc();
    *(_DWORD *)char v17 = 136315138;
    *(void *)&long long v53 = sub_10000E6A0(0xD000000000000014, 0x800000010002E2D0, v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "[are these buttons correct] %s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v18 = *(void *)&v3[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent];
  unint64_t v19 = *(void *)&v3[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent + 8];
  sub_1000189FC(v18, v19, (uint64_t)v51);
  sub_100014C5C((uint64_t)v51, (uint64_t)v54);
  if (v54[1])
  {
    long long v62 = *(_OWORD *)v54;
    sub_100014CC4((uint64_t)&v62);
    sub_100014CF0((uint64_t)v51);
    __int16 v20 = dispatch thunk of CAFCameraButtonObservable.selectedEntryIndex.getter();
    sub_10000C008((uint64_t)&v62);
    if ((v20 & 0x100) == 0)
    {
      if ((_BYTE)v20)
      {
        uint64_t v42 = v10;
        char v21 = *(void **)&v3[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_childrenIdents];
        swift_bridgeObjectRetain();
        sub_1000189FC(v18, v19, (uint64_t)v52);
        sub_100014C5C((uint64_t)v52, (uint64_t)&v53);
        if (!*((void *)&v53 + 1)
          || (v63[0] = v53,
              sub_100014CC4((uint64_t)v63),
              sub_100014CF0((uint64_t)v52),
              __int16 v22 = dispatch thunk of CAFCameraButtonObservable.selectedEntryIndex.getter(),
              sub_10000C008((uint64_t)v63),
              (v22 & 0x100) != 0))
        {
          unint64_t v23 = -1;
        }
        else
        {
          unint64_t v23 = v22 - 1;
        }
        swift_bridgeObjectRetain();
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if (result)
        {
          if ((v23 & 0x8000000000000000) == 0) {
            goto LABEL_19;
          }
        }
        else
        {
          uint64_t result = (uint64_t)sub_10001A94C(v21);
          char v21 = (void *)result;
          if ((v23 & 0x8000000000000000) == 0)
          {
LABEL_19:
            if (v23 < v21[2])
            {
              long long v28 = &v21[2 * v23];
              v28[4] = v18;
              v28[5] = v19;
              swift_bridgeObjectRelease();
              uint64_t v29 = v3;
              uint64_t v30 = swift_bridgeObjectRetain();
              long long v26 = sub_10001AB4C(v30);
              swift_bridgeObjectRelease_n();
              uint64_t v10 = v42;
              goto LABEL_21;
            }
LABEL_26:
            __break(1u);
            return result;
          }
        }
        __break(1u);
        goto LABEL_26;
      }
    }
  }
  id v24 = v3;
  uint64_t v25 = swift_bridgeObjectRetain();
  long long v26 = sub_10001AB4C(v25);
  swift_bridgeObjectRelease();
LABEL_21:

  uint64_t v31 = Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v31, v32))
  {
    char v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v33 = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "submenuButtons update: static sort (active not at front)", v33, 2u);
    swift_slowDealloc();
  }

  sub_100005214(&qword_10003EDF0);
  uint64_t v34 = swift_allocObject();
  long long v35 = v59;
  long long v36 = v61[0];
  *(_OWORD *)(v34 + 80) = v60;
  *(_OWORD *)(v34 + 96) = v36;
  *(_OWORD *)(v34 + 105) = *(_OWORD *)((char *)v61 + 9);
  long long v37 = v57;
  long long v38 = v58;
  *(_OWORD *)(v34 + 16) = xmmword_10002F4E0;
  *(_OWORD *)(v34 + 32) = v37;
  *(_OWORD *)(v34 + 48) = v38;
  *(_OWORD *)(v34 + 64) = v35;
  long long v44 = (void *)v34;
  swift_retain();
  id v39 = v10;
  sub_1000064F4(v12, v43 & 1);
  swift_retain();
  id v40 = v13;
  id v41 = v14;
  sub_1000199B0((uint64_t)v26);
  sub_100012258(&v44);
  sub_100014CF0((uint64_t)v45);
  return (uint64_t)v44;
}

void sub_100018418(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  os_log_type_t v8 = &v24[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_100018914(a1, a2, *(void **)&v2[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_identFlatList]);
  if ((v10 & 1) == 0)
  {
    unint64_t v11 = v9;
    sub_1000189FC(*(void *)&v2[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent], *(void *)&v2[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent + 8], (uint64_t)v25);
    sub_100014C5C((uint64_t)v25, (uint64_t)v26);
    if (v26[1])
    {
      v27[0] = *(_OWORD *)v26;
      sub_100014CC4((uint64_t)v27);
      sub_100014CF0((uint64_t)v25);
      if ((v11 & 0x8000000000000000) != 0 || v11 >= 0x100)
      {
LABEL_20:
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        return;
      }
      dispatch thunk of CAFCameraButtonObservable.selectedEntryIndex.setter();
      sub_10000C008((uint64_t)v27);
    }
    if (qword_10003EAB8 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1000062F4(v5, (uint64_t)qword_100041A08);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16))(v8, v12, v5);
    char v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v13, v14)) {
      goto LABEL_13;
    }
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 16777472;
    if ((v11 & 0x8000000000000000) == 0 && v11 < 0x100)
    {
      if ((((v11 + 1) >> 8) & 1) == 0)
      {
        os_log_type_t v16 = v15;
        v24[15] = v11 + 1;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "[CameraButtonGroup] promoteChild updating selectedEntryIndex %hhu", v16, 5u);
        swift_slowDealloc();
LABEL_13:

        (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
        return;
      }
      __break(1u);
    }
    goto LABEL_20;
  }
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  sub_1000062F4(v5, (uint64_t)qword_100041A08);
  swift_bridgeObjectRetain_n();
  char v17 = v2;
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    v26[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 136315394;
    swift_bridgeObjectRetain();
    v25[0] = sub_10000E6A0(a1, a2, v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v20 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v21 = Array.description.getter();
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    v25[0] = sub_10000E6A0(v21, v23, v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "[CameraButtonGroup] promoteChild failed finding child %s in parent child list %s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_100018914(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  BOOL v7 = a3[4] == a1 && a3[5] == a2;
  if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
    return 0;
  }
  uint64_t v9 = 0;
  char v10 = a3 + 7;
  uint64_t v11 = 1;
  while (1)
  {
    if (v3 == v11) {
      return 0;
    }
    ++v9;
    if (*(v10 - 1) == a1 && *v10 == a2) {
      break;
    }
    char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = v11++;
    v10 += 2;
    if (v13) {
      return result;
    }
  }
  return v9;
}

void sub_1000189FC(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = *(void *)&v3[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_model];
  uint64_t v9 = (uint64_t *)(v8 + OBJC_IVAR____TtC9CarCamera11CameraModel_buttonDict);
  swift_beginAccess();
  uint64_t v10 = *v9;
  if (!*(void *)(*v9 + 16))
  {
LABEL_5:
    uint64_t v31 = (uint64_t *)(v8 + OBJC_IVAR____TtC9CarCamera11CameraModel_serviceDict);
    swift_beginAccess();
    uint64_t v32 = *v31;
    if (*(void *)(v32 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v33 = sub_10001301C(a1, a2);
      if (v34)
      {
        id v55 = *(id *)(*(void *)(v32 + 56) + 8 * v33);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_100019744();
        sub_10001978C(&qword_10003F7C0, (void (*)(uint64_t))sub_100019744);
        CAFObserved<>.observable.getter();
        type metadata accessor for ButtonBarLayout(0);
        sub_10001978C((unint64_t *)&qword_10003EE00, (void (*)(uint64_t))type metadata accessor for ButtonBarLayout);
        uint64_t v35 = EnvironmentObject.init()();
        uint64_t v37 = v36;
        uint64_t v61 = v36;
        uint64_t KeyPath = swift_getKeyPath();
        type metadata accessor for CameraModel();
        sub_10001978C(&qword_10003F6F0, (void (*)(uint64_t))type metadata accessor for CameraModel);
        long long v50 = (void *)EnvironmentObject.init()();
        uint64_t v53 = a1;
        uint64_t v39 = v38;
        uint64_t v59 = v38;
        type metadata accessor for CAFCameraButtonObservable();
        sub_10001978C(&qword_10003F7C8, (void (*)(uint64_t))&type metadata accessor for CAFCameraButtonObservable);
        id v51 = v4;
        uint64_t v63 = ObservedObject.init(wrappedValue:)();
        id v41 = v40;
        State.init(wrappedValue:)();
        int v42 = v65;
        uint64_t v19 = *((void *)&v65 + 1);
        *(void *)&long long v65 = v63;
        *((void *)&v65 + 1) = v41;
        uint64_t v57 = v35;
        uint64_t v66 = v35;
        uint64_t v67 = v37;
        uint64_t v15 = KeyPath;
        uint64_t v68 = KeyPath;
        char v69 = 0;
        uint64_t v70 = v50;
        uint64_t v71 = v39;
        char v72 = v4;
        char v73 = v42;
        LODWORD(v39) = v42;
        uint64_t v74 = v19;
        char v75 = 0;
        swift_beginAccess();
        swift_retain();
        swift_bridgeObjectRetain();
        id v28 = v41;
        sub_1000064F4(KeyPath, 0);
        swift_retain();
        id v43 = v50;
        id v44 = v51;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v64 = *v9;
        uint64_t *v9 = 0x8000000000000000;
        sub_10001A330(&v65, v53, a2, isUniquelyReferenced_nonNull_native);
        uint64_t *v9 = v64;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();

        unsigned int v24 = v39;
        uint64_t v26 = v61;
        uint64_t v25 = v63;
        long long v27 = v50;
        uint64_t v18 = v4;
        uint64_t v30 = v57;
        uint64_t v29 = v59;
        uint64_t v16 = 0;
LABEL_15:
        char v20 = 0;
        goto LABEL_16;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    if (qword_10003EAB8 != -1) {
      swift_once();
    }
    uint64_t v46 = type metadata accessor for Logger();
    sub_1000062F4(v46, (uint64_t)qword_100041A08);
    swift_bridgeObjectRetain_n();
    uint64_t v47 = Logger.logObject.getter();
    os_log_type_t v48 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v47, v48))
    {
      long long v49 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v65 = swift_slowAlloc();
      *(_DWORD *)long long v49 = 136315138;
      swift_bridgeObjectRetain();
      sub_10000E6A0(a1, a2, (uint64_t *)&v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "[CameraButtonGroup] button failed  %s", v49, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v25 = 0;
    id v28 = 0;
    uint64_t v30 = 0;
    uint64_t v26 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    long long v27 = 0;
    uint64_t v29 = 0;
    uint64_t v18 = 0;
    unsigned int v24 = 0;
    uint64_t v19 = 0;
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_10001301C(a1, a2);
  if ((v12 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  uint64_t v13 = *(void *)(v10 + 56) + 96 * v11;
  os_log_type_t v14 = *(void **)(v13 + 8);
  uint64_t v60 = *(void *)(v13 + 24);
  uint64_t v62 = *(void *)v13;
  uint64_t v15 = *(void *)(v13 + 32);
  uint64_t v16 = *(unsigned __int8 *)(v13 + 40);
  char v17 = *(void **)(v13 + 48);
  uint64_t v56 = *(void *)(v13 + 16);
  uint64_t v58 = *(void *)(v13 + 56);
  uint64_t v18 = *(void **)(v13 + 64);
  unsigned int v54 = *(unsigned __int8 *)(v13 + 72);
  uint64_t v19 = *(void *)(v13 + 80);
  char v20 = *(unsigned char *)(v13 + 88);
  swift_retain();
  id v21 = v14;
  sub_1000064F4(v15, v16);
  swift_retain();
  id v22 = v17;
  id v23 = v18;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unsigned int v24 = v54;
  uint64_t v26 = v60;
  uint64_t v25 = v62;
  long long v27 = v17;
  id v28 = v14;
  uint64_t v30 = v56;
  uint64_t v29 = v58;
LABEL_16:
  *(void *)a3 = v25;
  *(void *)(a3 + 8) = v28;
  *(void *)(a3 + 16) = v30;
  *(void *)(a3 + 24) = v26;
  *(void *)(a3 + 32) = v15;
  *(void *)(a3 + 40) = v16;
  *(void *)(a3 + 48) = v27;
  *(void *)(a3 + 56) = v29;
  *(void *)(a3 + 64) = v18;
  *(void *)(a3 + 72) = v24;
  *(void *)(a3 + 80) = v19;
  *(unsigned char *)(a3 + 88) = v20;
}

uint64_t sub_100019018(uint64_t a1, unint64_t a2)
{
  if (*(void *)(*(void *)(v2 + OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_childrenIdents) + 16))
  {
    sub_100017C58((uint64_t)v19);
    long long v20 = *(_OWORD *)v19;
    id v5 = v19[1];
    uint64_t v6 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
    uint64_t v8 = v7;
    sub_10000C008((uint64_t)&v20);
    sub_100019494((uint64_t)v19);
    if (v6 == a1 && v8 == a2)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v10) {
      return 1;
    }
    if (qword_10003EAB8 != -1) {
      swift_once();
    }
    uint64_t v17 = type metadata accessor for Logger();
    sub_1000062F4(v17, (uint64_t)qword_100041A08);
    swift_bridgeObjectRetain_n();
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      swift_bridgeObjectRetain();
      sub_10000E6A0(a1, a2, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      uint64_t v16 = "[CameraButtonGroup] already showing children of %s";
      goto LABEL_17;
    }
LABEL_18:

    swift_bridgeObjectRelease_n();
    return 0;
  }
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_1000062F4(v12, (uint64_t)qword_100041A08);
  swift_bridgeObjectRetain_n();
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v13, v14)) {
    goto LABEL_18;
  }
  uint64_t v15 = (uint8_t *)swift_slowAlloc();
  v19[0] = (id)swift_slowAlloc();
  *(_DWORD *)uint64_t v15 = 136315138;
  swift_bridgeObjectRetain();
  *(void *)&long long v20 = sub_10000E6A0(a1, a2, (uint64_t *)v19);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  uint64_t v16 = "[CameraButtonGroup] menu group has no children %s";
LABEL_17:
  _os_log_impl((void *)&_mh_execute_header, v13, v14, v16, v15, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  return 0;
}

id sub_100019390()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CameraButtonGroup();
  return [super dealloc];
}

uint64_t type metadata accessor for CameraButtonGroup()
{
  return self;
}

uint64_t sub_100019458@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CameraButtonGroup();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100019494(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  id v5 = *(void **)(a1 + 64);

  swift_release();
  sub_100006550(v2, v3);

  swift_release();
  return a1;
}

void *sub_100019510(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100005214(&qword_10003EDF0);
      char v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      _OWORD v10[2] = v8;
      uint64_t v10[3] = 2 * ((uint64_t)(v11 - 32) / 96);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[12 * v8 + 4]) {
          memmove(v12, a4 + 4, 96 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      char v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10001AA54(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_100019634(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100005214(&qword_10003F7D0);
      char v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      _OWORD v10[2] = v8;
      uint64_t v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      char v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_10001A960(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_100019744()
{
  unint64_t result = qword_10003F570;
  if (!qword_10003F570)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003F570);
  }
  return result;
}

uint64_t sub_10001978C(unint64_t *a1, void (*a2)(uint64_t))
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

char *sub_1000197D4(char *result, int64_t a2, char a3, char *a4)
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
    sub_100005214(&qword_10003F7D8);
    char v10 = (char *)swift_allocObject();
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
    char v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  os_log_type_t v14 = a4 + 32;
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

char *sub_1000198D0(void **a1, const void **a2, void *a3)
{
  char v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -96)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    size_t v6 = 96 * (v4 / 96);
    if (result != v3 || result >= &v3[v6])
    {
      return (char *)memmove(result, v3, v6);
    }
  }
  return result;
}

char *sub_10001999C(uint64_t a1)
{
  return sub_1000197D4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1000199B0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  char v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  char v3 = sub_100019510(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[12 * v8 + 4];
  if (a1 + 32 < v9 + 96 * v2 && v9 < a1 + 32 + 96 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100019B0C(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  char v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  char v3 = sub_100019634(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100019C64(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  sub_100005214(&qword_10003F568);
  char v45 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    id v43 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v42 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v46 = v13;
        unint64_t v21 = v20 | (v13 << 6);
      }
      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v42) {
          goto LABEL_33;
        }
        unint64_t v23 = v43[v22];
        int64_t v24 = v13 + 1;
        if (!v23)
        {
          int64_t v24 = v13 + 2;
          if (v13 + 2 >= v42) {
            goto LABEL_33;
          }
          unint64_t v23 = v43[v24];
          if (!v23)
          {
            uint64_t v25 = v13 + 3;
            if (v13 + 3 >= v42)
            {
LABEL_33:
              swift_release();
              char v3 = v2;
              if (v45)
              {
                uint64_t v41 = 1 << *(unsigned char *)(v5 + 32);
                if (v41 >= 64) {
                  bzero(v43, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *id v43 = -1 << v41;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v43[v25];
            if (!v23)
            {
              while (1)
              {
                int64_t v24 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_40;
                }
                if (v24 >= v42) {
                  goto LABEL_33;
                }
                unint64_t v23 = v43[v24];
                ++v25;
                if (v23) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v24 = v13 + 3;
          }
        }
LABEL_30:
        unint64_t v10 = (v23 - 1) & v23;
        int64_t v46 = v24;
        unint64_t v21 = __clz(__rbit64(v23)) + (v24 << 6);
      }
      uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
      uint64_t v31 = *v30;
      uint64_t v32 = v30[1];
      uint64_t v33 = *(void *)(v5 + 56) + 96 * v21;
      char v34 = *(void **)(v33 + 8);
      uint64_t v47 = *(void *)v33;
      uint64_t v35 = *(void *)(v33 + 32);
      char v36 = *(unsigned char *)(v33 + 40);
      long long v51 = *(_OWORD *)(v33 + 48);
      long long v52 = *(_OWORD *)(v33 + 16);
      long long v50 = *(void **)(v33 + 64);
      uint64_t v37 = *(void *)(v33 + 80);
      char v48 = *(unsigned char *)(v33 + 88);
      char v49 = *(unsigned char *)(v33 + 72);
      if ((v45 & 1) == 0)
      {
        swift_retain();
        swift_bridgeObjectRetain();
        id v38 = v34;
        sub_1000064F4(v35, v36);
        swift_retain();
        id v39 = (id)v51;
        id v40 = v50;
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v16 == v27;
          if (v16 == v27) {
            unint64_t v16 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v11 + 8 * v16);
        }
        while (v29 == -1);
        unint64_t v17 = __clz(__rbit64(~v29)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
      void *v18 = v31;
      v18[1] = v32;
      uint64_t v19 = *(void *)(v7 + 56) + 96 * v17;
      int64_t v13 = v46;
      *(void *)uint64_t v19 = v47;
      *(void *)(v19 + 8) = v34;
      *(_OWORD *)(v19 + 16) = v52;
      *(void *)(v19 + 32) = v35;
      *(unsigned char *)(v19 + 40) = v36;
      *(_OWORD *)(v19 + 48) = v51;
      *(void *)(v19 + 64) = v50;
      *(unsigned char *)(v19 + 72) = v49;
      *(void *)(v19 + 80) = v37;
      *(unsigned char *)(v19 + 88) = v48;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

uint64_t sub_10001A020(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  sub_100005214(&qword_10003F560);
  char v38 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          char v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v3 = v35;
  int64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

uint64_t sub_10001A330(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10001301C(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_18;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_10001A4D0();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7] + 96 * v12;
      return sub_10001A728((uint64_t)a1, v19);
    }
    goto LABEL_13;
  }
  sub_100019C64(v15, a4 & 1);
  unint64_t v21 = sub_10001301C(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_19:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_13:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v23 = a2;
  v23[1] = a3;
  int64_t v24 = (_OWORD *)(v18[7] + 96 * v12);
  long long v25 = a1[1];
  *int64_t v24 = *a1;
  v24[1] = v25;
  long long v26 = a1[2];
  long long v27 = a1[3];
  long long v28 = a1[4];
  *(_OWORD *)((char *)v24 + 73) = *(_OWORD *)((char *)a1 + 73);
  v24[3] = v27;
  v24[4] = v28;
  v24[2] = v26;
  uint64_t v29 = v18[2];
  BOOL v30 = __OFADD__(v29, 1);
  uint64_t v31 = v29 + 1;
  if (v30)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v18[2] = v31;

  return swift_bridgeObjectRetain();
}

id sub_10001A4D0()
{
  sub_100005214(&qword_10003F568);
  uint64_t v35 = v0;
  uint64_t v1 = *v0;
  uint64_t v2 = static _DictionaryStorage.copy(original:)();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v35 = v3;
    return result;
  }
  id result = (id)(v2 + 64);
  unint64_t v5 = (unint64_t)((1 << *(unsigned char *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v5) {
    id result = memmove(result, (const void *)(v1 + 64), 8 * v5);
  }
  uint64_t v37 = v1 + 64;
  int64_t v7 = 0;
  *(void *)(v3 + 16) = *(void *)(v1 + 16);
  uint64_t v8 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(v1 + 64);
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      unint64_t v11 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v12 = v11 | (v7 << 6);
      goto LABEL_12;
    }
    int64_t v32 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v32 >= v36) {
      goto LABEL_26;
    }
    unint64_t v33 = *(void *)(v37 + 8 * v32);
    ++v7;
    if (!v33)
    {
      int64_t v7 = v32 + 1;
      if (v32 + 1 >= v36) {
        goto LABEL_26;
      }
      unint64_t v33 = *(void *)(v37 + 8 * v7);
      if (!v33) {
        break;
      }
    }
LABEL_25:
    unint64_t v10 = (v33 - 1) & v33;
    unint64_t v12 = __clz(__rbit64(v33)) + (v7 << 6);
LABEL_12:
    uint64_t v13 = 16 * v12;
    BOOL v14 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v12);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = 96 * v12;
    uint64_t v18 = *(void *)(v1 + 56) + v17;
    uint64_t v19 = *(void *)v18;
    unint64_t v20 = *(void **)(v18 + 8);
    uint64_t v21 = *(void *)(v18 + 32);
    char v22 = *(unsigned char *)(v18 + 40);
    unint64_t v23 = *(void **)(v18 + 64);
    char v24 = *(unsigned char *)(v18 + 72);
    uint64_t v25 = *(void *)(v18 + 80);
    char v26 = *(unsigned char *)(v18 + 88);
    long long v27 = (void *)(*(void *)(v3 + 48) + v13);
    long long v28 = *(_OWORD *)(v18 + 16);
    long long v38 = *(_OWORD *)(v18 + 48);
    *long long v27 = v15;
    v27[1] = v16;
    uint64_t v29 = *(void *)(v3 + 56) + v17;
    *(void *)uint64_t v29 = v19;
    *(void *)(v29 + 8) = v20;
    *(_OWORD *)(v29 + 16) = v28;
    *(void *)(v29 + 32) = v21;
    *(unsigned char *)(v29 + 40) = v22;
    *(_OWORD *)(v29 + 48) = v38;
    *(void *)(v29 + 64) = v23;
    *(unsigned char *)(v29 + 72) = v24;
    *(void *)(v29 + 80) = v25;
    *(unsigned char *)(v29 + 88) = v26;
    swift_retain();
    swift_bridgeObjectRetain();
    id v30 = v20;
    sub_1000064F4(v21, v22);
    swift_retain();
    id v31 = (id)v38;
    id result = v23;
  }
  int64_t v34 = v32 + 2;
  if (v34 >= v36) {
    goto LABEL_26;
  }
  unint64_t v33 = *(void *)(v37 + 8 * v34);
  if (v33)
  {
    int64_t v7 = v34;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v7 = v34 + 1;
    if (__OFADD__(v34, 1)) {
      break;
    }
    if (v7 >= v36) {
      goto LABEL_26;
    }
    unint64_t v33 = *(void *)(v37 + 8 * v7);
    ++v34;
    if (v33) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10001A728(uint64_t a1, uint64_t a2)
{
  return a2;
}

id sub_10001A784()
{
  uint64_t v1 = v0;
  sub_100005214(&qword_10003F560);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10001A938(void *a1)
{
  return sub_100019510(0, a1[2], 0, a1);
}

void *sub_10001A94C(void *a1)
{
  return sub_100019634(0, a1[2], 0, a1);
}

uint64_t sub_10001A960(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10001AA54(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 96 * a1 + 32;
    unint64_t v6 = a3 + 96 * v4;
    if (v5 >= v6 || v5 + 96 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_10001AB4C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v2 = (unint64_t *)(swift_bridgeObjectRetain() + 40);
  uint64_t v3 = _swiftEmptyArrayStorage;
  do
  {
    uint64_t v5 = *(v2 - 1);
    unint64_t v6 = *v2;
    swift_bridgeObjectRetain();
    sub_1000189FC(v5, v6, (uint64_t)v22);
    uint64_t v7 = v22[1];
    uint64_t v8 = v22[2];
    uint64_t v9 = v22[3];
    uint64_t v16 = v22[4];
    uint64_t v17 = v22[0];
    uint64_t v20 = v25;
    uint64_t v21 = v24;
    char v18 = v23;
    uint64_t v19 = v26;
    uint64_t v10 = v28;
    uint64_t v32 = v27;
    char v11 = v29;
    swift_bridgeObjectRelease();
    sub_100014C5C((uint64_t)v22, (uint64_t)v30);
    if (v31)
    {
      uint64_t v15 = v10;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = sub_100019510(0, v3[2] + 1, 1, v3);
      }
      unint64_t v13 = v3[2];
      unint64_t v12 = v3[3];
      if (v13 >= v12 >> 1) {
        uint64_t v3 = sub_100019510((void *)(v12 > 1), v13 + 1, 1, v3);
      }
      v3[2] = v13 + 1;
      uint64_t v4 = &v3[12 * v13];
      v4[4] = v17;
      v4[5] = v7;
      v4[6] = v8;
      v4[7] = v9;
      v4[8] = v16;
      *((unsigned char *)v4 + 72) = v18 & 1;
      v4[10] = v21;
      v4[11] = v20;
      v4[12] = v19;
      *((unsigned char *)v4 + 104) = v32 & 1;
      v4[14] = v15;
      *((unsigned char *)v4 + 120) = v11 & 1;
    }
    v2 += 2;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

id sub_10001AD0C(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v9 = qword_10003EAB8;
  uint64_t v10 = v4;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_1000062F4(v11, (uint64_t)qword_100041A08);
  swift_bridgeObjectRetain_n();
  unint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v20 = a4;
    unint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)unint64_t v14 = 136315138;
    swift_bridgeObjectRetain();
    sub_10000E6A0(a1, a2, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "[CameraButtonGroup] init %s", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a4 = v20;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(void *)&v10[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_model] = a4;
  uint64_t v15 = (uint64_t *)&v10[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent];
  uint64_t *v15 = a1;
  v15[1] = a2;
  *(void *)&v10[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_childrenIdents] = a3;
  sub_100005214(&qword_10003F7D0);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_10002F4E0;
  *(void *)(v16 + 32) = a1;
  *(void *)(v16 + 40) = a2;
  uint64_t v22 = v16;
  swift_bridgeObjectRetain();
  id v17 = a4;
  uint64_t v18 = swift_bridgeObjectRetain();
  sub_100019B0C(v18);
  *(void *)&v10[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_identFlatList] = v22;

  v21.receiver = v10;
  v21.super_class = (Class)type metadata accessor for CameraButtonGroup();
  return [super init];
}

void *sub_10001AF70(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = (void *)a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    uint64_t v9 = a3[7];
    uint64_t v17 = a1 + v9;
    uint64_t v10 = (uint64_t)a2 + v9;
    *(void *)(a1 + 40) = a2[5];
    uint64_t v11 = type metadata accessor for UUID();
    unint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    id v13 = v7;
    swift_retain();
    swift_retain();
    v12(v17, v10, v11);
    uint64_t v14 = a3[9];
    *((unsigned char *)v4 + a3[8]) = *((unsigned char *)a2 + a3[8]);
    *((unsigned char *)v4 + v14) = *((unsigned char *)a2 + v14);
    *((unsigned char *)v4 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  }
  return v4;
}

uint64_t sub_10001B0B8(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for UUID();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_10001B140(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v6 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v8 = a3[7];
  uint64_t v15 = a1 + v8;
  uint64_t v9 = a2 + v8;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  id v12 = v6;
  swift_retain();
  swift_retain();
  v11(v15, v9, v10);
  uint64_t v13 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(a2 + v13);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_10001B238(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  unint64_t v6 = *(void **)(a2 + 8);
  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v6;
  id v8 = v6;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  uint64_t v9 = a3[7];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  return a1;
}

_OWORD *sub_10001B33C(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = a3[7];
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[9];
  *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  *((unsigned char *)a1 + v11) = *((unsigned char *)a2 + v11);
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  return a1;
}

uint64_t sub_10001B3F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v12) = *(unsigned char *)(a2 + v12);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_10001B4D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001B4E8);
}

uint64_t sub_10001B4E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for UUID();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10001B598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001B5AC);
}

uint64_t sub_10001B5AC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for UUID();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for CameraCloseButton(uint64_t a1)
{
  return sub_10001ED3C(a1, qword_10003F838);
}

uint64_t sub_10001B674()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for CameraActionButton(uint64_t a1)
{
  swift_release();
  sub_100006550(*(void *)(a1 + 32), *(unsigned char *)(a1 + 40));

  return swift_release();
}

uint64_t initializeWithCopy for CameraActionButton(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 32);
  char v7 = *(unsigned char *)(a2 + 40);
  id v8 = v4;
  swift_retain();
  sub_1000064F4(v6, v7);
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 40) = v7;
  uint64_t v9 = *(void **)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  uint64_t v11 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v11;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  id v12 = v9;
  id v13 = v11;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CameraActionButton(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  unint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_1000064F4(v7, v8);
  uint64_t v9 = *(void *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 40);
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  sub_100006550(v9, v10);
  uint64_t v11 = *(void **)(a1 + 48);
  id v12 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v12;
  id v13 = v12;

  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  uint64_t v14 = *(void **)(a1 + 64);
  uint64_t v15 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v15;
  id v16 = v15;

  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  return a1;
}

__n128 initializeWithTake for CameraActionButton(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for CameraActionButton(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  char v4 = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  char v6 = *(unsigned char *)(a1 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = v4;
  sub_100006550(v5, v6);
  uint64_t v7 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);

  char v8 = *(void **)(a1 + 64);
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v9;

  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_release();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  return a1;
}

uint64_t getEnumTagSinglePayload for CameraActionButton(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 89)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CameraActionButton(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 88) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 89) = 1;
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
    *(unsigned char *)(result + 89) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraActionButton()
{
  return &type metadata for CameraActionButton;
}

uint64_t sub_10001BA90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001BAAC@<X0>(unsigned char *a1@<X8>)
{
  sub_10000433C();
  uint64_t result = EnvironmentValues.subscript.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_10001BAFC()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_10001BB48()
{
  long long v4 = *v0;
  id v1 = *((id *)&v4 + 1);
  uint64_t v2 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
  sub_10000C008((uint64_t)&v4);
  return v2;
}

uint64_t sub_10001BB9C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000011;
  }
  else {
    unint64_t v3 = 0x656C63726943;
  }
  if (v2) {
    unint64_t v4 = 0xE600000000000000;
  }
  else {
    unint64_t v4 = 0x800000010002DB00;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000011;
  }
  else {
    unint64_t v5 = 0x656C63726943;
  }
  if (a2) {
    unint64_t v6 = 0x800000010002DB00;
  }
  else {
    unint64_t v6 = 0xE600000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_10001BC44()
{
  id v1 = v0;
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000062F4(v2, (uint64_t)qword_100041A08);
  sub_100020F24((uint64_t)v0);
  sub_100020F24((uint64_t)v0);
  unint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)unint64_t v5 = 136315138;
    *(void *)&long long v44 = v6;
    long long v45 = *v0;
    id v7 = *((id *)&v45 + 1);
    uint64_t v8 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
    unint64_t v10 = v9;
    sub_10000C008((uint64_t)&v45);
    uint64_t v43 = sub_10000E6A0(v8, v10, (uint64_t *)&v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_100019494((uint64_t)v1);
    sub_100019494((uint64_t)v1);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "[CameraActionButton] %s sending action", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_100019494((uint64_t)v0);
    sub_100019494((uint64_t)v0);
  }

  long long v44 = *v1;
  id v11 = *((id *)&v44 + 1);
  id v12 = (void *)CAFCameraButtonObservable.observed.getter();
  sub_10000C008((uint64_t)&v44);
  unsigned int v13 = [v12 hasButtonAction];

  if (v13)
  {
    uint64_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "[CameraActionButton] sendAction to vehicle with .performAction", v16, 2u);
      swift_slowDealloc();
    }

    id v17 = v11;
    dispatch thunk of CAFCameraButtonObservable.buttonAction.setter();
    sub_10000C008((uint64_t)&v44);
    return;
  }
  id v18 = v11;
  uint64_t v19 = dispatch thunk of CAFCameraButtonObservable.contentURLAction.getter();
  unint64_t v21 = v20;
  sub_10000C008((uint64_t)&v44);
  if (!v21)
  {
LABEL_17:
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      char v29 = "[CameraActionButton] nothing to do";
LABEL_30:
      _os_log_impl((void *)&_mh_execute_header, v26, v27, v29, v28, 2u);
      swift_slowDealloc();
    }
LABEL_31:

    return;
  }
  uint64_t v22 = HIBYTE(v21) & 0xF;
  if ((v21 & 0x2000000000000000) == 0) {
    uint64_t v22 = v19 & 0xFFFFFFFFFFFFLL;
  }
  if (!v22)
  {
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v23 = Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 136315138;
    swift_bridgeObjectRetain();
    sub_10000E6A0(v19, v21, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "[CameraActionButton] RequestContent URL button pressed (URL: %s)", v25, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v30 = [self sharedApplication];
  id v31 = [v30 connectedScenes];

  sub_10002119C();
  sub_100021064(&qword_10003F8F0, (void (*)(uint64_t))sub_10002119C);
  uint64_t v32 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v33 = (void *)sub_10001DCA0(v32);
  swift_bridgeObjectRelease();
  if (!v33)
  {
LABEL_28:
    swift_bridgeObjectRelease();
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      char v29 = "[CameraActionButton] RequestContent failed, missing window scene.";
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  self;
  uint64_t v34 = swift_dynamicCastObjCClass();
  if (!v34)
  {

    goto LABEL_28;
  }
  uint64_t v35 = v34;
  uint64_t v36 = qword_10003EAE8;
  id v37 = v33;
  if (v36 != -1) {
    swift_once();
  }
  uint64_t v38 = *(void *)(qword_100041A68 + OBJC_IVAR____TtC9CarCamera16CameraCAFManager_requestContentManager);
  if (v38)
  {
    uint64_t v39 = swift_allocObject();
    *(void *)(v39 + 16) = v19;
    *(void *)(v39 + 24) = v21;
    long long v40 = v1[3];
    *(_OWORD *)(v39 + 64) = v1[2];
    *(_OWORD *)(v39 + 80) = v40;
    *(_OWORD *)(v39 + 96) = v1[4];
    *(_OWORD *)(v39 + 105) = *(long long *)((char *)v1 + 73);
    long long v41 = v1[1];
    *(_OWORD *)(v39 + 32) = *v1;
    *(_OWORD *)(v39 + 48) = v41;
    int64_t v42 = *(void (**)(uint64_t, unint64_t, uint64_t, void (*)(char), uint64_t))(*(void *)v38 + 104);
    sub_100020F24((uint64_t)v1);
    swift_bridgeObjectRetain();
    swift_retain();
    v42(v19, v21, v35, sub_100021248, v39);
    swift_release();
    swift_release();
  }
  swift_bridgeObjectRelease();
}

uint64_t sub_10001C300()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_10001C324(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ColorScheme();
  __n128 v3 = __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, __n128))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_10001C3EC(char *a1, char *a2)
{
  return sub_10001BB9C(*a1, *a2);
}

Swift::Int sub_10001C3F8()
{
  return Hasher._finalize()();
}

uint64_t sub_10001C47C()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10001C4EC()
{
  return Hasher._finalize()();
}

uint64_t sub_10001C56C@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100039560, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

void sub_10001C5CC(unint64_t *a1@<X8>)
{
  unint64_t v2 = 0x656C63726943;
  if (*v1) {
    unint64_t v2 = 0xD000000000000011;
  }
  unint64_t v3 = 0x800000010002DB00;
  if (!*v1) {
    unint64_t v3 = 0xE600000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_10001C60C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v3);
  uint64_t v6 = (_OWORD *)((char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (*v1)
  {
    uint64_t v7 = (char *)v6 + *(int *)(v4 + 20);
    uint64_t v8 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v9 = type metadata accessor for RoundedCornerStyle();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104))(v7, v8, v9);
    __asm { FMOV            V0.2D, #8.0 }
    *uint64_t v6 = _Q0;
    RoundedRectangle.path(in:)();
    uint64_t v15 = v22;
    uint64_t v16 = v23;
    uint64_t v17 = v24;
    uint64_t v18 = v25;
    char v19 = v26;
    uint64_t result = sub_100020E94((uint64_t)v6, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  }
  else
  {
    uint64_t result = Circle.path(in:)();
    uint64_t v15 = v22;
    uint64_t v16 = v23;
    uint64_t v17 = v24;
    uint64_t v18 = v25;
    char v19 = v26;
  }
  *(void *)a1 = v15;
  *(void *)(a1 + 8) = v16;
  *(void *)(a1 + 16) = v17;
  *(void *)(a1 + 24) = v18;
  *(unsigned char *)(a1 + 32) = v19;
  return result;
}

uint64_t sub_10001C794()
{
  return Shape.sizeThatFits(_:)();
}

void (*sub_10001C7AC(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = Animatable<>.animatableData.modify();
  return sub_10001C81C;
}

void sub_10001C81C(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t sub_10001C868(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100022BE4();

  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10001C8CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100022BE4();

  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10001C930(uint64_t a1)
{
  unint64_t v2 = sub_100022BE4();

  return Shape.body.getter(a1, v2);
}

uint64_t sub_10001C97C@<X0>(uint64_t a1@<X8>)
{
  unint64_t v2 = v1;
  uint64_t v32 = a1;
  uint64_t v3 = sub_100005214(&qword_10003F888);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100005214(&qword_10003F890);
  uint64_t v7 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005214(&qword_10003F898);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  unsigned int v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (_OWORD *)swift_allocObject();
  long long v15 = v1[3];
  v14[3] = v1[2];
  v14[4] = v15;
  v14[5] = v1[4];
  *(_OWORD *)((char *)v14 + 89) = *(_OWORD *)((char *)v1 + 73);
  long long v16 = v1[1];
  v14[1] = *v1;
  v14[2] = v16;
  unint64_t v33 = v1;
  sub_100020F24((uint64_t)v1);
  sub_100005214(&qword_10003F8A0);
  sub_10001EBFC();
  Button.init(action:label:)();
  unint64_t v17 = sub_10001D774();
  char v34 = v17 & 1;
  uint64x2_t v18 = (uint64x2_t)vdupq_n_s64(v17);
  int16x8_t v19 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v18, (uint64x2_t)xmmword_10002F590), (int32x4_t)vshlq_u64(v18, (uint64x2_t)xmmword_10002F580));
  *(int8x8_t *)v19.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v19), (int8x8_t)0x1000100010001);
  unsigned __int32 v35 = vmovn_s16(v19).u32[0];
  char v36 = BYTE5(v17) & 1;
  sub_100009490(&qword_10003F8C8, &qword_10003F888);
  sub_10001ED74();
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  char v20 = sub_10001D774();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v22 = swift_allocObject();
  *(unsigned char *)(v22 + 16) = v20 & 1;
  uint64_t v23 = v31;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v9, v31);
  uint64_t v24 = (uint64_t *)&v13[*(int *)(v11 + 44)];
  *uint64_t v24 = KeyPath;
  v24[1] = (uint64_t)sub_100023090;
  v24[2] = v22;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v23);
  uint64_t v25 = (_OWORD *)swift_allocObject();
  long long v26 = v2[3];
  v25[3] = v2[2];
  v25[4] = v26;
  v25[5] = v2[4];
  *(_OWORD *)((char *)v25 + 89) = *(_OWORD *)((char *)v2 + 73);
  long long v27 = v2[1];
  v25[1] = *v2;
  v25[2] = v27;
  uint64_t v28 = v32;
  sub_1000052C0((uint64_t)v13, v32, &qword_10003F898);
  char v29 = (uint64_t (**)())(v28 + *(int *)(sub_100005214(&qword_10003F8D8) + 36));
  *char v29 = sub_100021014;
  v29[1] = (uint64_t (*)())v25;
  sub_100020F24((uint64_t)v2);
  return sub_100005474((uint64_t)v13, &qword_10003F898);
}

void sub_10001CD84()
{
  uint64_t v1 = v0;
  uint64_t v48 = *(void *)(v0 + 8);
  uint64_t v49 = *(void *)v0;
  uint64_t v46 = *(void *)(v0 + 24);
  uint64_t v47 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 40);
  uint64_t v44 = *(void *)(v0 + 48);
  uint64_t v45 = *(void *)(v0 + 32);
  uint64_t v3 = v0 + 64;
  uint64_t v42 = *(void *)(v0 + 64);
  uint64_t v43 = *(void *)(v0 + 56);
  char v40 = *(unsigned char *)(v0 + 72);
  uint64_t v41 = *(void *)(v0 + 80);
  char v39 = *(unsigned char *)(v0 + 88);
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_1000062F4(v4, (uint64_t)qword_100041A08);
  sub_100020F24(v0);
  sub_100020F24(v0);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)&long long v50 = v8;
    long long v58 = *(_OWORD *)v0;
    id v9 = *((id *)&v58 + 1);
    uint64_t v10 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
    unint64_t v12 = v11;
    sub_10000C008((uint64_t)&v58);
    uint64_t v55 = sub_10000E6A0(v10, v12, (uint64_t *)&v50);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_100019494(v1);
    sub_100019494(v1);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "[CameraActionButton] performCameraAction entry [%s]", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_100019494(v0);
    sub_100019494(v0);
  }

  uint64_t v13 = *(void *)(v1 + 16);
  if (!v13)
  {
    type metadata accessor for ButtonBarLayout(0);
    sub_100021064((unint64_t *)&qword_10003EE00, (void (*)(uint64_t))type metadata accessor for ButtonBarLayout);
    EnvironmentObject.error()();
    __break(1u);
    return;
  }
  swift_beginAccess();
  uint64_t v14 = *(void **)(v13 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  id v15 = v14;
  static Published.subscript.getter();

  swift_release();
  swift_release();
  if (!*((void *)&v50 + 1))
  {
    sub_100009328(v3, (uint64_t)&v57, &qword_10003F8E0);
    sub_100009328((uint64_t)&v57, (uint64_t)v59, &qword_10003F8E0);
    if (v59[0])
    {
      long long v56 = *(_OWORD *)v1;
      uint64_t v25 = (void *)*((void *)&v56 + 1);
      sub_100021144(&v57);
      sub_100014CC4((uint64_t)&v56);
      uint64_t v26 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
      unint64_t v28 = v27;
      sub_10000C008((uint64_t)&v56);
      LOBYTE(v26) = sub_100019018(v26, v28);
      swift_bridgeObjectRelease();
      if (v26)
      {
        char v29 = v39 & 1;
        sub_100020F24(v1);
        sub_100020F24(v1);
        id v30 = Logger.logObject.getter();
        os_log_type_t v31 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v30, v31))
        {
          uint64_t v32 = (uint8_t *)swift_slowAlloc();
          *(void *)&long long v50 = swift_slowAlloc();
          *(_DWORD *)uint64_t v32 = 136315138;
          id v33 = v25;
          uint64_t v34 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
          unint64_t v36 = v35;
          sub_10000C008((uint64_t)&v56);
          sub_10000E6A0(v34, v36, (uint64_t *)&v50);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          sub_100019494(v1);
          sub_100019494(v1);
          _os_log_impl((void *)&_mh_execute_header, v30, v31, "[CameraActionButton] performCameraAction service %s will reveal children", v32, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          char v29 = v39 & 1;
          swift_slowDealloc();
        }
        else
        {
          sub_100019494(v1);
          sub_100019494(v1);
        }

        swift_beginAccess();
        id v37 = *(void **)(v13 + 24);
        swift_getKeyPath();
        swift_getKeyPath();
        *(void *)&long long v50 = v49;
        *((void *)&v50 + 1) = v48;
        *(void *)&long long v51 = v47;
        *((void *)&v51 + 1) = v46;
        *(void *)&long long v52 = v45;
        *((void *)&v52 + 1) = v2 & 1;
        *(void *)&long long v53 = v44;
        *((void *)&v53 + 1) = v43;
        *(void *)&v54[0] = v42;
        *((void *)&v54[0] + 1) = v40 & 1;
        *(void *)&v54[1] = v41;
        BYTE8(v54[1]) = v29;
        sub_100020F24(v1);
        id v38 = v37;
        static Published.subscript.setter();
        sub_100021170(&v57);
        return;
      }
      sub_100021170(&v57);
    }
    sub_10001BC44();
    return;
  }
  sub_10000C67C(v50, *((void **)&v50 + 1), v51, *((uint64_t *)&v51 + 1), v52, SBYTE8(v52), (void *)v53, *((uint64_t *)&v53 + 1), *(void **)&v54[0]);
  long long v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64x2_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64x2_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "[CameraActionButton] performCameraAction exiting submenu, and sending action", v18, 2u);
    swift_slowDealloc();
  }

  sub_10001BC44();
  swift_beginAccess();
  int16x8_t v19 = *(void **)(v13 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  long long v53 = 0u;
  memset(v54, 0, 25);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v50 = 0u;
  id v20 = v19;
  static Published.subscript.setter();
  sub_100009328(v3, (uint64_t)v59, &qword_10003F8E0);
  sub_100009328((uint64_t)v59, (uint64_t)&v56, &qword_10003F8E0);
  if ((void)v56)
  {
    long long v50 = *(_OWORD *)v1;
    id v21 = *((id *)&v50 + 1);
    uint64_t v22 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
    unint64_t v24 = v23;
    sub_10000C008((uint64_t)&v50);
    sub_100018418(v22, v24);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_10001D4D0@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for CameraShapeImage(0);
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Image.ResizingMode();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v21 = *a1;
  id v12 = *((id *)&v21 + 1);
  dispatch thunk of CAFCameraButtonObservable.symbolName.getter();
  sub_10000C008((uint64_t)&v21);
  Image.init(automakerSymbolName:)();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for Image.ResizingMode.stretch(_:), v8);
  uint64_t v13 = Image.resizable(capInsets:resizingMode:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  unint64_t v14 = sub_10001D774();
  *(void *)uint64_t v7 = swift_getKeyPath();
  v7[8] = 0;
  id v15 = (uint64_t *)&v7[*(int *)(v5 + 28)];
  uint64_t *v15 = swift_getKeyPath();
  sub_100005214((uint64_t *)&unk_10003F2E0);
  swift_storeEnumTagMultiPayload();
  long long v16 = &v7[*(int *)(v5 + 32)];
  *long long v16 = v14 & 1;
  uint64x2_t v17 = (uint64x2_t)vdupq_n_s64(v14);
  int16x8_t v18 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v17, (uint64x2_t)xmmword_10002F590), (int32x4_t)vshlq_u64(v17, (uint64x2_t)xmmword_10002F580));
  *(int8x8_t *)v18.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v18), (int8x8_t)0x1000100010001);
  *(_DWORD *)(v16 + 1) = vmovn_s16(v18).u32[0];
  v16[5] = BYTE5(v14) & 1;
  uint64_t v19 = sub_100005214(&qword_10003F8A0);
  sub_100020E2C((uint64_t)v7, a2 + *(int *)(v19 + 36), type metadata accessor for CameraShapeImage);
  *(void *)a2 = v13;
  *(void *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  return sub_100020E94((uint64_t)v7, type metadata accessor for CameraShapeImage);
}

uint64_t sub_10001D774()
{
  uint64_t v1 = v0;
  v54[0] = *v0;
  id v2 = *((id *)&v54[0] + 1);
  __int16 v3 = dispatch thunk of CAFCameraButtonObservable.buttonAction.getter();
  sub_10000C008((uint64_t)v54);
  if ((v3 & 0x100) != 0)
  {
    BOOL v6 = 0;
  }
  else
  {
    id v4 = v2;
    char v5 = dispatch thunk of CAFCameraButtonObservable.disabled.getter();
    sub_10000C008((uint64_t)v54);
    BOOL v6 = (v5 & 1) != 0 || v3 != 0;
  }
  id v7 = v2;
  uint64_t v8 = (void *)CAFCameraButtonObservable.observed.getter();
  sub_10000C008((uint64_t)v54);
  unsigned __int8 v9 = [v8 selected];

  if (v9)
  {
    uint64_t v10 = 256;
  }
  else
  {
    unint64_t v11 = (void *)*((void *)v1 + 6);
    if (!v11)
    {
      type metadata accessor for CameraModel();
      char v40 = &qword_10003F6F0;
      uint64_t v41 = (void (*)(uint64_t))type metadata accessor for CameraModel;
      goto LABEL_38;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    id v12 = v11;
    static Published.subscript.getter();
    swift_release();
    swift_release();
    if (v46)
    {
      id v13 = v46;
      sub_10000C67C(v44, v46, v47, v48, v49, v50, v51, v52, v53);
      uint64_t v14 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
      uint64_t v16 = v15;
    }
    else
    {

      uint64_t v14 = 0;
      uint64_t v16 = 0;
    }
    id v17 = v7;
    int16x8_t v18 = (void *)CAFCameraButtonObservable.observed.getter();
    sub_10000C008((uint64_t)v54);
    id v19 = [v18 identifier];

    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v22 = v21;

    if (v16)
    {
      if (v14 == v20 && v16 == v22)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v10 = 256;
      }
      else
      {
        char v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v23) {
          uint64_t v10 = 256;
        }
        else {
          uint64_t v10 = 0;
        }
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v10 = 0;
    }
  }
  long long v45 = *(_OWORD *)((char *)v1 + 72);
  sub_100005214(&qword_10003EF98);
  State.wrappedValue.getter();
  uint64_t v24 = *((void *)v1 + 2);
  if (!v24)
  {
    type metadata accessor for ButtonBarLayout(0);
    char v40 = (unint64_t *)&qword_10003EE00;
    uint64_t v41 = (void (*)(uint64_t))type metadata accessor for ButtonBarLayout;
LABEL_38:
    sub_100021064(v40, v41);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
    return result;
  }
  swift_beginAccess();
  uint64_t v25 = *(void **)(v24 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  id v26 = v25;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (*((void *)&v45 + 1))
  {
    uint64_t v42 = v10;
    id v27 = *((id *)&v45 + 1);
    sub_10000C67C(v45, *((void **)&v45 + 1), v47, v48, v49, v50, v51, v52, v53);
    uint64_t v28 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
    uint64_t v30 = v29;

    uint64_t v10 = v42;
  }
  else
  {

    uint64_t v28 = 0;
    uint64_t v30 = 0;
  }
  id v31 = v7;
  uint64_t v32 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
  uint64_t v34 = v33;
  sub_10000C008((uint64_t)v54);
  if (v30)
  {
    if (v28 == v32 && v30 == v34)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v35 = 0x10000000000;
    }
    else
    {
      char v36 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v35 = 0x10000000000;
      if ((v36 & 1) == 0) {
        uint64_t v35 = 0;
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v35 = 0;
  }
  id v37 = &_mh_execute_header;
  if (!*((unsigned char *)v1 + 88)) {
    id v37 = 0;
  }
  uint64_t v38 = 0x10000;
  if (!v43) {
    uint64_t v38 = 0;
  }
  return v10 | v6 | v35 | v38 | (unint64_t)v37;
}

uint64_t sub_10001DCA0(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = __CocoaSet.startIndex.getter();
    uint64_t v5 = v4;
    __CocoaSet.endIndex.getter();
    char v6 = static __CocoaSet.Index.== infix(_:_:)();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_1000214AC(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_100021254(v3, v5, v2 != 0, a1);
    uint64_t v7 = v11;
    sub_1000214AC(v3, v5, v2 != 0);
    return v7;
  }
  uint64_t result = sub_1000214B8(a1);
  if ((v10 & 1) == 0)
  {
    uint64_t v5 = v9;
    if (*(_DWORD *)(a1 + 36) == v9)
    {
      uint64_t v3 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_10001DDB0(char a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a1)
  {
    if (qword_10003EAB8 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_1000062F4(v7, (uint64_t)qword_100041A08);
    swift_bridgeObjectRetain_n();
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v8, v9))
    {
      char v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)char v10 = 136315138;
      swift_bridgeObjectRetain();
      sub_10000E6A0(a2, a3, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "RequestContent opened url %s successfully", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v15 = *(void *)(a4 + 48);
    if (v15)
    {
      uint64_t v16 = *(void **)(v15 + OBJC_IVAR____TtC9CarCamera11CameraModel_camera);
      if (v16)
      {
        id v17 = [v16 cameraGeneral];
        [v17 setOn:0];
      }
    }
    else
    {
      type metadata accessor for CameraModel();
      sub_100021064(&qword_10003F6F0, (void (*)(uint64_t))type metadata accessor for CameraModel);
      EnvironmentObject.error()();
      __break(1u);
    }
  }
  else
  {
    if (qword_10003EAB8 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_1000062F4(v11, (uint64_t)qword_100041A08);
    swift_bridgeObjectRetain_n();
    id v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315138;
      swift_bridgeObjectRetain();
      sub_10000E6A0(a2, a3, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[CameraActionButton] equestContent opening url %s was not successful", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_10001E16C@<X0>(uint64_t a1@<X8>)
{
  return sub_10001C97C(a1);
}

uint64_t sub_10001E1B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001E1D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v47 = a1;
  uint64_t v3 = type metadata accessor for CameraCloseButton(0);
  uint64_t v4 = (int *)(v3 - 8);
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v3);
  uint64_t v39 = sub_100005214(&qword_10003F888);
  uint64_t v43 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005214(&qword_10003F890);
  uint64_t v45 = *(void *)(v9 - 8);
  uint64_t v46 = v9;
  __chkstk_darwin(v9);
  id v37 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005214(&qword_10003F898);
  uint64_t v12 = v11 - 8;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = type metadata accessor for CameraCloseButton;
  uint64_t v38 = (uint64_t)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020E2C(v2, v38, type metadata accessor for CameraCloseButton);
  uint64_t v15 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v41 = ((v15 + 16) & ~v15) + v6;
  uint64_t v42 = (v15 + 16) & ~v15;
  uint64_t v16 = v42;
  uint64_t v40 = v15 | 7;
  uint64_t v17 = swift_allocObject();
  sub_1000090E8((uint64_t)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16);
  uint64_t v48 = v2;
  sub_100005214(&qword_10003F8A0);
  sub_10001EBFC();
  Button.init(action:label:)();
  uint64_t v18 = v4[10];
  char v19 = *(unsigned char *)(v2 + v18);
  char v20 = *(unsigned char *)(v2 + v4[11]);
  uint64_t v21 = *(void *)(v2 + 40);
  char v49 = *(unsigned char *)(v2 + 32);
  uint64_t v54 = v21;
  sub_100005214(&qword_10003EF98);
  State.wrappedValue.getter();
  unsigned __int8 v22 = *(unsigned char *)(v2 + v4[12]);
  char v49 = v19;
  char v50 = v20;
  char v51 = v55;
  char v52 = 1;
  __int16 v53 = v22;
  sub_100009490(&qword_10003F8C8, &qword_10003F888);
  sub_10001ED74();
  char v23 = v37;
  uint64_t v24 = v39;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v8, v24);
  LOBYTE(v18) = *(unsigned char *)(v2 + v18);
  uint64_t v25 = *(void *)(v2 + 40);
  char v49 = *(unsigned char *)(v2 + 32);
  uint64_t v54 = v25;
  State.wrappedValue.getter();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v27 = swift_allocObject();
  *(unsigned char *)(v27 + 16) = v18;
  uint64_t v29 = v45;
  uint64_t v28 = v46;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v14, v23, v46);
  uint64_t v30 = (uint64_t *)&v14[*(int *)(v12 + 44)];
  *uint64_t v30 = KeyPath;
  v30[1] = (uint64_t)sub_100020BD8;
  v30[2] = v27;
  (*(void (**)(char *, uint64_t))(v29 + 8))(v23, v28);
  uint64_t v31 = v38;
  sub_100020E2C(v2, v38, v44);
  uint64_t v32 = swift_allocObject();
  sub_1000090E8(v31, v32 + v42);
  uint64_t v33 = v47;
  sub_1000052C0((uint64_t)v14, v47, &qword_10003F898);
  uint64_t v34 = (uint64_t (**)())(v33 + *(int *)(sub_100005214(&qword_10003F8D8) + 36));
  *uint64_t v34 = sub_100020CF8;
  v34[1] = (uint64_t (*)())v32;
  return sub_100005474((uint64_t)v14, &qword_10003F898);
}

void sub_10001E6A8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for CameraCloseButton(0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (id *)((char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v5 = *(id *)(v0 + 8);
  dispatch thunk of CAFCameraGeneralObservable.on.setter();

  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_1000062F4(v6, (uint64_t)qword_100041A08);
  sub_100020E2C(v1, (uint64_t)v4, type metadata accessor for CameraCloseButton);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 67109120;
    id v10 = v4[1];
    char v11 = dispatch thunk of CAFCameraGeneralObservable.on.getter();

    sub_100020E94((uint64_t)v4, type metadata accessor for CameraCloseButton);
    uint64_t v12[3] = v11 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "[CAMERA] camera.On visiblity button button pressed: %{BOOL}d", v9, 8u);
    swift_slowDealloc();
  }
  else
  {
    sub_100020E94((uint64_t)v4, type metadata accessor for CameraCloseButton);
  }
}

uint64_t sub_10001E8A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for CameraShapeImage(0);
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  uint64_t v7 = &v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = type metadata accessor for Image.ResizingMode();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  char v11 = &v21[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  Image.init(systemName:)();
  (*(void (**)(unsigned char *, void, uint64_t))(v9 + 104))(v11, enum case for Image.ResizingMode.stretch(_:), v8);
  uint64_t v12 = Image.resizable(capInsets:resizingMode:)();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v13 = (int *)type metadata accessor for CameraCloseButton(0);
  char v14 = *(unsigned char *)(a1 + v13[8]);
  LOBYTE(v9) = *(unsigned char *)(a1 + v13[9]);
  uint64_t v15 = *(void *)(a1 + 40);
  v21[8] = *(unsigned char *)(a1 + 32);
  uint64_t v22 = v15;
  sub_100005214(&qword_10003EF98);
  State.wrappedValue.getter();
  char v16 = v23;
  LOBYTE(a1) = *(unsigned char *)(a1 + v13[10]);
  *(void *)uint64_t v7 = swift_getKeyPath();
  v7[8] = 0;
  uint64_t v17 = (uint64_t *)&v7[*(int *)(v5 + 28)];
  *uint64_t v17 = swift_getKeyPath();
  sub_100005214((uint64_t *)&unk_10003F2E0);
  swift_storeEnumTagMultiPayload();
  uint64_t v18 = &v7[*(int *)(v5 + 32)];
  unsigned char *v18 = v14;
  v18[1] = v9;
  v18[2] = v16;
  void v18[3] = 1;
  v18[4] = a1;
  v18[5] = 0;
  uint64_t v19 = sub_100005214(&qword_10003F8A0);
  sub_100020E2C((uint64_t)v7, a2 + *(int *)(v19 + 36), type metadata accessor for CameraShapeImage);
  *(void *)a2 = v12;
  *(void *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  return sub_100020E94((uint64_t)v7, type metadata accessor for CameraShapeImage);
}

uint64_t sub_10001EB38()
{
  return State.wrappedValue.setter();
}

void sub_10001EB98()
{
}

uint64_t sub_10001EBF4@<X0>(uint64_t a1@<X8>)
{
  return sub_10001E8A0(*(void *)(v1 + 16), a1);
}

unint64_t sub_10001EBFC()
{
  unint64_t result = qword_10003F8A8;
  if (!qword_10003F8A8)
  {
    sub_100005324(&qword_10003F8A0);
    sub_10001ECA8();
    sub_100021064(&qword_10003F8C0, (void (*)(uint64_t))type metadata accessor for CameraShapeImage);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F8A8);
  }
  return result;
}

unint64_t sub_10001ECA8()
{
  unint64_t result = qword_10003F8B0;
  if (!qword_10003F8B0)
  {
    sub_100005324(&qword_10003F8B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F8B0);
  }
  return result;
}

uint64_t type metadata accessor for CameraShapeImage(uint64_t a1)
{
  return sub_10001ED3C(a1, (uint64_t *)&unk_10003F958);
}

uint64_t sub_10001ED3C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_10001ED74()
{
  unint64_t result = qword_10003F8D0;
  if (!qword_10003F8D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F8D0);
  }
  return result;
}

uint64_t sub_10001EDC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (_OWORD *)v1;
  uint64_t v32 = a1;
  uint64_t v3 = sub_100005214(&qword_10003F888);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v29 = v3;
  uint64_t v30 = v4;
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100005214(&qword_10003F890);
  uint64_t v7 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005214(&qword_10003F898);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v14 = (_OWORD *)swift_allocObject();
  long long v15 = *(_OWORD *)(v1 + 16);
  v14[1] = *(_OWORD *)v1;
  v14[2] = v15;
  v14[3] = *(_OWORD *)(v1 + 32);
  *(_OWORD *)((char *)v14 + 57) = *(_OWORD *)(v1 + 41);
  uint64_t v33 = v1;
  sub_100022A88(v1);
  sub_100005214(&qword_10003F8A0);
  sub_10001EBFC();
  Button.init(action:label:)();
  char v16 = *(unsigned char *)(v1 + 33);
  char v17 = *(unsigned char *)(v1 + 34);
  long long v36 = *(_OWORD *)(v1 + 40);
  long long v34 = *(_OWORD *)(v1 + 40);
  sub_100005214(&qword_10003EF98);
  State.wrappedValue.getter();
  unsigned __int8 v18 = *(unsigned char *)(v1 + 56);
  LOBYTE(v34) = v16;
  BYTE1(v34) = v17;
  BYTE2(v34) = v35;
  BYTE3(v34) = 1;
  WORD2(v34) = v18;
  sub_100009490(&qword_10003F8C8, &qword_10003F888);
  sub_10001ED74();
  uint64_t v19 = v29;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v19);
  long long v34 = v36;
  State.wrappedValue.getter();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v21 = swift_allocObject();
  *(unsigned char *)(v21 + 16) = v16;
  uint64_t v22 = v31;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v9, v31);
  char v23 = (uint64_t *)&v13[*(int *)(v11 + 44)];
  uint64_t *v23 = KeyPath;
  v23[1] = (uint64_t)sub_100023090;
  _OWORD v23[2] = v21;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v22);
  uint64_t v24 = (_OWORD *)swift_allocObject();
  long long v25 = v2[1];
  v24[1] = *v2;
  v24[2] = v25;
  v24[3] = v2[2];
  *(_OWORD *)((char *)v24 + 57) = *(_OWORD *)((char *)v2 + 41);
  uint64_t v26 = v32;
  sub_1000052C0((uint64_t)v13, v32, &qword_10003F898);
  uint64_t v27 = (uint64_t (**)())(v26 + *(int *)(sub_100005214(&qword_10003F8D8) + 36));
  *uint64_t v27 = sub_100022B38;
  v27[1] = (uint64_t (*)())v24;
  sub_100022A88((uint64_t)v2);
  return sub_100005474((uint64_t)v13, &qword_10003F898);
}

void sub_10001F1D8()
{
  uint64_t v1 = v0;
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000062F4(v2, (uint64_t)qword_100041A08);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "[CAMERA] NavigationButton action", v5, 2u);
    swift_slowDealloc();
  }

  sub_100022B88((unsigned char *)(v0 + 32), &v13);
  sub_100022B88(&v13, &v14);
  LOBYTE(v6) = v14;
  int v7 = v14 >> 6;
  if (!v7) {
    goto LABEL_11;
  }
  if (v7 == 1)
  {
    v14 &= 0x3Fu;
    uint64_t v8 = *(void *)(v0 + 16);
    if (!v8)
    {
LABEL_18:
      type metadata accessor for ButtonBarLayout(0);
      sub_100021064((unint64_t *)&qword_10003EE00, (void (*)(uint64_t))type metadata accessor for ButtonBarLayout);
      EnvironmentObject.error()();
      __break(1u);
      return;
    }
    uint64_t v6 = OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_pageNumber;
    uint64_t v1 = *(void *)(v8 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_pageNumber);
    uint64_t v9 = v1 - 1;
    if (!__OFSUB__(v1, 1)) {
      goto LABEL_13;
    }
    __break(1u);
LABEL_11:
    unsigned __int8 v14 = v6 & 0x3F;
    uint64_t v8 = *(void *)(v1 + 16);
    if (v8)
    {
      uint64_t v6 = OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_pageNumber;
      uint64_t v1 = *(void *)(v8 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_pageNumber);
      uint64_t v9 = v1 + 1;
      if (!__OFADD__(v1, 1))
      {
LABEL_13:
        *(void *)(v8 + v6) = v9;
        swift_retain();
        sub_100024160(v1);
        swift_release();
        return;
      }
      __break(1u);
    }
    goto LABEL_18;
  }
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "[CAMERA] NavigationButton action - close action not used here", v12, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_10001F428@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v3 = type metadata accessor for CameraShapeImage(0);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Image.ResizingMode();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100005214(&qword_10003F8A0);
  __chkstk_darwin(v23);
  os_log_type_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100022B88((unsigned char *)(a1 + 32), &v27);
  uint64_t v12 = *(void *)a1;
  char v13 = *(unsigned char *)(a1 + 8);
  sub_1000064F4(*(void *)a1, v13);
  sub_10000E010(v12, v13);
  sub_100006550(v12, v13);
  sub_100022B88(&v27, &v28);
  int v14 = v28 >> 6;
  if (v14)
  {
    if (v14 == 1) {
      v28 &= 0x3Fu;
    }
  }
  else
  {
    v28 &= 0x3Fu;
  }
  Image.init(systemName:)();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Image.ResizingMode.stretch(_:), v6);
  uint64_t v15 = Image.resizable(capInsets:resizingMode:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  char v16 = *(unsigned char *)(a1 + 33);
  char v17 = *(unsigned char *)(a1 + 34);
  long long v25 = *(_OWORD *)(a1 + 40);
  sub_100005214(&qword_10003EF98);
  State.wrappedValue.getter();
  char v18 = v26;
  char v19 = *(unsigned char *)(a1 + 56);
  *(void *)uint64_t v5 = swift_getKeyPath();
  v5[8] = 0;
  char v20 = (uint64_t *)&v5[*(int *)(v3 + 20)];
  *char v20 = swift_getKeyPath();
  sub_100005214((uint64_t *)&unk_10003F2E0);
  swift_storeEnumTagMultiPayload();
  uint64_t v21 = &v5[*(int *)(v3 + 24)];
  char *v21 = v16;
  v21[1] = v17;
  v21[2] = v18;
  v21[3] = 1;
  v21[4] = v19;
  v21[5] = 0;
  sub_100020E2C((uint64_t)v5, (uint64_t)&v11[*(int *)(v23 + 36)], type metadata accessor for CameraShapeImage);
  *(void *)os_log_type_t v11 = v15;
  *((void *)v11 + 1) = 0;
  *((_WORD *)v11 + 8) = 1;
  sub_100020E94((uint64_t)v5, type metadata accessor for CameraShapeImage);
  return sub_100009328((uint64_t)v11, v24, &qword_10003F8A0);
}

uint64_t sub_10001F7D4@<X0>(uint64_t a1@<X8>)
{
  return sub_10001EDC8(a1);
}

uint64_t sub_10001F818()
{
  uint64_t result = static Color.primary.getter();
  qword_100041A48 = result;
  return result;
}

uint64_t sub_10001F838()
{
  uint64_t result = static Color.clear.getter();
  qword_100041A50 = result;
  return result;
}

uint64_t sub_10001F858()
{
  static Color.secondary.getter();
  uint64_t v0 = Color.opacity(_:)();
  uint64_t result = swift_release();
  qword_100041A58 = v0;
  return result;
}

uint64_t sub_10001F89C()
{
  id v0 = [self _carSystemFocusColor];
  uint64_t result = Color.init(_:)();
  qword_100041A60 = result;
  return result;
}

uint64_t sub_10001F8DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = a2 & 1;
  uint64_t v40 = type metadata accessor for ButtonStyleConfiguration.Label();
  uint64_t v7 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_100005214(&qword_10003FA98);
  __chkstk_darwin(v36);
  os_log_type_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_100005214(&qword_10003FAA0);
  __chkstk_darwin(v38);
  char v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_100005214(&qword_10003FAA8);
  __chkstk_darwin(v37);
  uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_100005214(&qword_10003FAB0);
  __chkstk_darwin(v39);
  char v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_100005214(&qword_10003FAB8);
  __chkstk_darwin(v43);
  uint64_t v42 = (uint64_t)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v19 = ButtonStyleConfiguration.isPressed.getter();
  uint64_t v46 = a3;
  uint64_t v44 = a2;
  if ((v19 & 1) == 0 || (a2 & 0x100) != 0)
  {
    if ((a2 & 0x1000000) != 0)
    {
      if (qword_10003EAE0 != -1) {
        swift_once();
      }
      char v20 = &qword_100041A60;
    }
    else
    {
      if (qword_10003EAD8 != -1) {
        swift_once();
      }
      char v20 = &qword_100041A58;
    }
  }
  else
  {
    if (qword_10003EAC8 != -1) {
      swift_once();
    }
    char v20 = &qword_100041A48;
  }
  uint64_t v21 = *v20;
  swift_retain();
  uint64_t v45 = a1;
  ButtonStyleConfiguration.label.getter();
  uint64_t v22 = v21;
  uint64_t v41 = v6;
  if (v6)
  {
    if (qword_10003EAD0 != -1) {
      swift_once();
    }
    uint64_t v22 = qword_100041A50;
  }
  swift_retain();
  char v23 = static Edge.Set.all.getter();
  uint64_t v24 = v40;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v9, v40);
  long long v25 = &v11[*(int *)(v36 + 36)];
  *(void *)long long v25 = v22;
  _OWORD v25[8] = v23;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v24);
  uint64_t v26 = static Color.primary.getter();
  uint64_t KeyPath = swift_getKeyPath();
  sub_1000052C0((uint64_t)v11, (uint64_t)v13, &qword_10003FA98);
  unsigned __int8 v28 = (uint64_t *)&v13[*(int *)(v38 + 36)];
  *unsigned __int8 v28 = KeyPath;
  v28[1] = v26;
  sub_100005474((uint64_t)v11, &qword_10003FA98);
  sub_1000052C0((uint64_t)v13, (uint64_t)v15, &qword_10003FAA0);
  uint64_t v29 = &v15[*(int *)(v37 + 36)];
  *uint64_t v29 = BYTE4(v44) & 1;
  *(_WORD *)(v29 + 1) = 256;
  sub_100005474((uint64_t)v13, &qword_10003FAA0);
  uint64_t v30 = swift_getKeyPath();
  uint64_t v31 = swift_allocObject();
  *(unsigned char *)(v31 + 16) = v41;
  sub_1000052C0((uint64_t)v15, (uint64_t)v17, &qword_10003FAA8);
  uint64_t v32 = (uint64_t *)&v17[*(int *)(v39 + 36)];
  *uint64_t v32 = v30;
  v32[1] = (uint64_t)sub_100023090;
  v32[2] = v31;
  sub_100005474((uint64_t)v15, &qword_10003FAA8);
  LOBYTE(v30) = ButtonStyleConfiguration.isPressed.getter();
  swift_release();
  uint64_t v33 = v42;
  sub_1000052C0((uint64_t)v17, v42, &qword_10003FAB0);
  *(unsigned char *)(v33 + *(int *)(v43 + 36)) = v30 & 1;
  sub_100005474((uint64_t)v17, &qword_10003FAB0);
  return sub_100009328(v33, v46, &qword_10003FAB8);
}

uint64_t sub_10001FE28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = 0x10000000000;
  if (!v2[5]) {
    uint64_t v3 = 0;
  }
  uint64_t v4 = &_mh_execute_header;
  if (!v2[4]) {
    uint64_t v4 = 0;
  }
  uint64_t v5 = 0x1000000;
  if (!v2[3]) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = 0x10000;
  if (!v2[2]) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = 256;
  if (!v2[1]) {
    uint64_t v7 = 0;
  }
  return sub_10001F8DC(a1, v7 | *v2 | v6 | v5 | (unint64_t)v4 | v3, a2);
}

uint64_t sub_10001FE94()
{
  uint64_t v1 = (unsigned char *)(v0 + *(int *)(type metadata accessor for CameraShapeImage(0) + 24));
  if (v1[1] == 1)
  {
    if (qword_10003EAC8 != -1) {
      swift_once();
    }
    uint64_t v2 = &qword_100041A48;
  }
  else if (v1[3] == 1)
  {
    if (qword_10003EAE0 != -1) {
      swift_once();
    }
    uint64_t v2 = &qword_100041A60;
  }
  else
  {
    if (qword_10003EAD8 != -1) {
      swift_once();
    }
    uint64_t v2 = &qword_100041A58;
  }
  uint64_t v3 = *v2;
  swift_retain();
  if (v1[5] != 1) {
    return v3;
  }
  uint64_t v4 = static Color.gray.getter();
  swift_release();
  return v4;
}

uint64_t sub_10001FFBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v48 = a1;
  uint64_t v56 = a2;
  uint64_t v3 = sub_100005214(&qword_10003FA00);
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005214(&qword_10003FA08);
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_100005214(&qword_10003FA10) - 8;
  __chkstk_darwin(v50);
  uint64_t v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_100005214(&qword_10003FA18) - 8;
  __chkstk_darwin(v51);
  uint64_t v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_100005214(&qword_10003FA20) - 8;
  __chkstk_darwin(v52);
  uint64_t v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_100005214(&qword_10003FA28);
  __chkstk_darwin(v49);
  uint64_t v18 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100005214(&qword_10003FA30);
  uint64_t v54 = *(void *)(v19 - 8);
  uint64_t v55 = v19;
  __chkstk_darwin(v19);
  __int16 v53 = (char *)&v46 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020518();
  uint64_t v47 = v2 + *(int *)(type metadata accessor for CameraShapeImage(0) + 24);
  char v21 = static Edge.Set.all.getter();
  EdgeInsets.init(_all:)();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v30 = sub_100005214(&qword_10003FA38);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 16))(v6, v48, v30);
  uint64_t v31 = &v6[*(int *)(v4 + 44)];
  *uint64_t v31 = v21;
  *((void *)v31 + 1) = v23;
  *((void *)v31 + 2) = v25;
  *((void *)v31 + 3) = v27;
  *((void *)v31 + 4) = v29;
  v31[40] = 0;
  sub_100020518();
  sub_100020518();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_1000052C0((uint64_t)v6, (uint64_t)v10, &qword_10003FA00);
  uint64_t v32 = &v10[*(int *)(v8 + 44)];
  long long v33 = v58;
  *(_OWORD *)uint64_t v32 = v57;
  *((_OWORD *)v32 + 1) = v33;
  *((_OWORD *)v32 + 2) = v59;
  sub_100005474((uint64_t)v6, &qword_10003FA00);
  uint64_t v34 = sub_10001FE94();
  LOBYTE(v6) = static Edge.Set.all.getter();
  sub_1000052C0((uint64_t)v10, (uint64_t)v12, &qword_10003FA08);
  uint64_t v35 = &v12[*(int *)(v50 + 44)];
  *(void *)uint64_t v35 = v34;
  v35[8] = (char)v6;
  sub_100005474((uint64_t)v10, &qword_10003FA08);
  uint64_t v36 = sub_10001FE94();
  LOBYTE(v6) = static Edge.Set.all.getter();
  sub_1000052C0((uint64_t)v12, (uint64_t)v14, &qword_10003FA10);
  uint64_t v37 = &v14[*(int *)(v51 + 44)];
  *(void *)uint64_t v37 = v36;
  v37[8] = (char)v6;
  sub_100005474((uint64_t)v12, &qword_10003FA10);
  uint64_t v38 = sub_100020624();
  uint64_t KeyPath = swift_getKeyPath();
  sub_1000052C0((uint64_t)v14, (uint64_t)v16, &qword_10003FA18);
  uint64_t v40 = (uint64_t *)&v16[*(int *)(v52 + 44)];
  uint64_t *v40 = KeyPath;
  v40[1] = v38;
  uint64_t v41 = v49;
  sub_100005474((uint64_t)v14, &qword_10003FA18);
  uint64_t v42 = v47;
  LOBYTE(v14) = *(unsigned char *)(v47 + 4);
  sub_1000052C0((uint64_t)v16, (uint64_t)v18, &qword_10003FA20);
  uint64_t v43 = &v18[*(int *)(v41 + 36)];
  *uint64_t v43 = (char)v14;
  *(_WORD *)(v43 + 1) = 256;
  sub_100005474((uint64_t)v16, &qword_10003FA20);
  if (*(unsigned char *)(v42 + 3) == 1) {
    static Font.Weight.heavy.getter();
  }
  else {
    static Font.Weight.regular.getter();
  }
  sub_1000226AC();
  uint64_t v44 = v53;
  View.fontWeight(_:)();
  sub_100005474((uint64_t)v18, &qword_10003FA28);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v54 + 32))(v56, v44, v55);
}

double sub_100020518()
{
  int v1 = *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for CameraShapeImage(0) + 24) + 3);
  uint64_t v2 = *(void *)v0;
  char v3 = *(unsigned char *)(v0 + 8);
  sub_1000064F4(v2, v3);
  char v4 = sub_10000E010(v2, v3);
  sub_100006550(v2, v3);
  if (v1 == 1)
  {
    sub_1000064F4(v2, v3);
    sub_10000E010(v2, v3);
    sub_100006550(v2, v3);
    if (v4) {
      return 21.0;
    }
    else {
      return 24.0;
    }
  }
  else
  {
    if (v4) {
      double v5 = 28.0;
    }
    else {
      double v5 = 32.0;
    }
    sub_1000064F4(v2, v3);
    sub_10000E010(v2, v3);
    sub_100006550(v2, v3);
  }
  return v5;
}

uint64_t sub_100020624()
{
  uint64_t v1 = type metadata accessor for ColorScheme();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v28 - v6;
  uint64_t v8 = type metadata accessor for CameraShapeImage(0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v28 - v12;
  uint64_t v15 = (unsigned char *)(v0 + *(int *)(v14 + 24));
  if (v15[3])
  {
    int v16 = v15[2];
    sub_100020E2C(v0, (uint64_t)v10, type metadata accessor for CameraShapeImage);
    if (v16 == 1)
    {
      sub_100020E94((uint64_t)v10, type metadata accessor for CameraShapeImage);
      return static Color.secondary.getter();
    }
    else
    {
      int v19 = v10[*(int *)(v8 + 24) + 1];
      sub_100020E94((uint64_t)v10, type metadata accessor for CameraShapeImage);
      if (v19 == 1) {
        return static Color.secondary.getter();
      }
      else {
        return static Color.black.getter();
      }
    }
  }
  else
  {
    if (*v15 == 1) {
      uint64_t v18 = static Color.secondary.getter();
    }
    else {
      uint64_t v18 = static Color.primary.getter();
    }
    uint64_t v20 = v18;
    int v21 = v15[2];
    sub_100020E2C(v0, (uint64_t)v13, type metadata accessor for CameraShapeImage);
    if (v21 == 1)
    {
      sub_100020E94((uint64_t)v13, type metadata accessor for CameraShapeImage);
    }
    else
    {
      int v22 = v13[*(int *)(v8 + 24) + 1];
      sub_100020E94((uint64_t)v13, type metadata accessor for CameraShapeImage);
      if (v22 != 1) {
        return v20;
      }
    }
    sub_10000E3EC((uint64_t)v7);
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for ColorScheme.dark(_:), v1);
    char v23 = static ColorScheme.== infix(_:_:)();
    uint64_t v24 = *(void (**)(char *, uint64_t))(v2 + 8);
    v24(v4, v1);
    v24(v7, v1);
    if (v23) {
      uint64_t v25 = static Color.black.getter();
    }
    else {
      uint64_t v25 = static Color.white.getter();
    }
    uint64_t v26 = v25;
    swift_release();
    return v26;
  }
}

void *sub_100020940(unsigned char *a1, void *(*a2)(uint64_t *__return_ptr))
{
  uint64_t result = a2(&v4);
  *a1 = v4;
  return result;
}

double sub_100020988@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 64) = v7;
  *(void *)(a1 + 80) = v8;
  *(unsigned char *)(a1 + 88) = v9;
  return result;
}

uint64_t sub_100020A28(uint64_t *a1, void **a2)
{
  uint64_t v2 = a1[2];
  uint64_t v11 = (void *)a1[1];
  uint64_t v12 = *a1;
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  long long v6 = (void *)a1[6];
  uint64_t v7 = a1[7];
  uint64_t v8 = (void *)a1[8];
  uint64_t v13 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000210B4(v12, v11, v2, v3, v4, v5, v6, v7, v8);
  id v9 = v13;
  return static Published.subscript.setter();
}

uint64_t sub_100020B18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100020B44()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_100020B70@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.isEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100020BA0()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_100020BC8()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_100020BD8(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_100020BF4()
{
  uint64_t v1 = (int *)(type metadata accessor for CameraCloseButton(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;

  swift_release();
  swift_release();
  uint64_t v7 = v6 + v1[9];
  uint64_t v8 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_100020CF8()
{
  type metadata accessor for CameraCloseButton(0);

  return sub_10001EB38();
}

uint64_t sub_100020D68@<X0>(unsigned char *a1@<X8>)
{
  sub_10000433C();
  uint64_t result = EnvironmentValues.subscript.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_100020DB8()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_100020E04()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100020E2C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100020E94(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_100020EF8()
{
}

uint64_t sub_100020F1C@<X0>(uint64_t a1@<X8>)
{
  return sub_10001D4D0(*(long long **)(v1 + 16), a1);
}

uint64_t sub_100020F24(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 64);
  swift_retain();
  id v7 = v2;
  sub_1000064F4(v3, v4);
  swift_retain();
  id v8 = v5;
  id v9 = v6;
  return a1;
}

uint64_t sub_100020F9C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100020FB0()
{
  swift_release();
  sub_100006550(*(void *)(v0 + 48), *(unsigned char *)(v0 + 56));

  swift_release();

  return _swift_deallocObject(v0, 105, 7);
}

uint64_t sub_100021014()
{
  return State.wrappedValue.setter();
}

uint64_t sub_100021064(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1000210B4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, void *a7, uint64_t a8, void *a9)
{
  if (a2)
  {
    char v12 = a6 & 1;
    swift_retain();
    id v13 = a2;
    sub_1000064F4(a5, v12);
    swift_retain();
    id v14 = a7;
    id v15 = a9;
  }
}

id *sub_100021144(id *a1)
{
  id v2 = *a1;
  return a1;
}

id *sub_100021170(id *a1)
{
  return a1;
}

unint64_t sub_10002119C()
{
  unint64_t result = qword_10003F8E8;
  if (!qword_10003F8E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003F8E8);
  }
  return result;
}

uint64_t sub_1000211DC()
{
  swift_bridgeObjectRelease();

  swift_release();
  sub_100006550(*(void *)(v0 + 64), *(unsigned char *)(v0 + 72));

  swift_release();

  return _swift_deallocObject(v0, 121, 7);
}

void sub_100021248(char a1)
{
  sub_10001DDB0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), v1 + 32);
}

void sub_100021254(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      __CocoaSet.element(at:)();
      sub_10002119C();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (a3) {
    goto LABEL_10;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_17;
  }
  __break(1u);
LABEL_10:
  if (__CocoaSet.Index.age.getter() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  __CocoaSet.Index.element.getter();
  sub_10002119C();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  char v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
  uint64_t v8 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v7 & ~v8;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v9 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v10 = static NSObject.== infix(_:_:)();

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v6 = (v6 + 1) & v11;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_23;
      }
      id v12 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v13 = static NSObject.== infix(_:_:)();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  id v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_1000214AC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000214B8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  id v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t destroy for NavigationButton(uint64_t a1)
{
  sub_100006550(*(void *)a1, *(unsigned char *)(a1 + 8));
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for NavigationButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1000064F4(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_WORD *)(a1 + 33) = *(_WORD *)(a2 + 33);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for NavigationButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1000064F4(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_100006550(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

__n128 initializeWithTake for NavigationButton(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for NavigationButton(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_100006550(v6, v7);
  *(void *)(a1 + 16) = a2[2];
  swift_release();
  *(void *)(a1 + 24) = a2[3];
  *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  *(unsigned char *)(a1 + 33) = *((unsigned char *)a2 + 33);
  *(unsigned char *)(a1 + 34) = *((unsigned char *)a2 + 34);
  *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
  *(void *)(a1 + 48) = a2[6];
  swift_release();
  *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for NavigationButton(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 57)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NavigationButton(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 57) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 57) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NavigationButton()
{
  return &type metadata for NavigationButton;
}

ValueMetadata *type metadata accessor for IsPressedButtonStyleKey()
{
  return &type metadata for IsPressedButtonStyleKey;
}

uint64_t initializeBufferWithCopyOfBuffer for CameraButtonConfiguration(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(_WORD *)(result + 4) = *((_WORD *)a2 + 2);
  *(_DWORD *)__n128 result = v2;
  return result;
}

ValueMetadata *type metadata accessor for CustomButtonStyle()
{
  return &type metadata for CustomButtonStyle;
}

unint64_t sub_100021884(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v13 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    char v8 = *(unsigned char *)(a2 + 8);
    sub_1000064F4(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(unsigned char *)(a1 + 8) = v8;
    uint64_t v9 = *(int *)(a3 + 20);
    unint64_t v10 = (void *)(a1 + v9);
    uint64_t v11 = (void *)(a2 + v9);
    sub_100005214((uint64_t *)&unk_10003F2E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *unint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = *(int *)(a3 + 24);
    uint64_t v15 = a1 + v14;
    uint64_t v16 = a2 + v14;
    *(_DWORD *)uint64_t v15 = *(_DWORD *)v16;
    *(_WORD *)(v15 + 4) = *(_WORD *)(v16 + 4);
  }
  return a1;
}

uint64_t sub_1000219D8(uint64_t a1, uint64_t a2)
{
  sub_100006550(*(void *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_100005214((uint64_t *)&unk_10003F2E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for ColorScheme();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_100021A94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_1000064F4(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  unint64_t v10 = (void *)(a2 + v8);
  sub_100005214((uint64_t *)&unk_10003F2E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = type metadata accessor for ColorScheme();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    void *v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(_DWORD *)uint64_t v13 = *(_DWORD *)v14;
  *(_WORD *)(v13 + 4) = *(_WORD *)(v14 + 4);
  return a1;
}

uint64_t sub_100021B98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_1000064F4(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_100006550(v8, v9);
  if (a1 != a2)
  {
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_100005474(a1 + v10, (uint64_t *)&unk_10003F2E0);
    sub_100005214((uint64_t *)&unk_10003F2E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      void *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = (unsigned char *)(a1 + v14);
  uint64_t v16 = (unsigned char *)(a2 + v14);
  unsigned char *v15 = *v16;
  v15[1] = v16[1];
  v15[2] = v16[2];
  v15[3] = v16[3];
  v15[4] = v16[4];
  v15[5] = v16[5];
  return a1;
}

uint64_t sub_100021CE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = *(int *)(a3 + 20);
  char v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_100005214((uint64_t *)&unk_10003F2E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = type metadata accessor for ColorScheme();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(_DWORD *)uint64_t v12 = *(_DWORD *)v13;
  *(_WORD *)(v12 + 4) = *(_WORD *)(v13 + 4);
  return a1;
}

uint64_t sub_100021DE8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_100006550(v8, v9);
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (char *)a2 + v10;
    sub_100005474(a1 + v10, (uint64_t *)&unk_10003F2E0);
    uint64_t v13 = sub_100005214((uint64_t *)&unk_10003F2E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
  }
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (unsigned char *)(a1 + v15);
  uint64_t v17 = (char *)a2 + v15;
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  v16[2] = v17[2];
  v16[3] = v17[3];
  v16[4] = v17[4];
  v16[5] = v17[5];
  return a1;
}

uint64_t sub_100021F34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100021F48);
}

uint64_t sub_100021F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 8);
    if (v4 > 1) {
      return (v4 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = sub_100005214(&qword_10003F8F8);
    char v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100021FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100022008);
}

uint64_t sub_100022008(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 254)
  {
    *(unsigned char *)(result + 8) = -(char)a2;
  }
  else
  {
    uint64_t v7 = sub_100005214(&qword_10003F8F8);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1000220B0()
{
  sub_100022150();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100022150()
{
  if (!qword_10003F968)
  {
    type metadata accessor for ColorScheme();
    unint64_t v0 = type metadata accessor for Environment.Content();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10003F968);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for CameraButtonShapeType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x100022274);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraButtonShapeType()
{
  return &type metadata for CameraButtonShapeType;
}

unint64_t sub_1000222B0()
{
  unint64_t result = qword_10003F9A0;
  if (!qword_10003F9A0)
  {
    sub_100005324(&qword_10003F8D8);
    sub_100022350();
    sub_100009490(&qword_10003F9C0, &qword_10003F9C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F9A0);
  }
  return result;
}

unint64_t sub_100022350()
{
  unint64_t result = qword_10003F9A8;
  if (!qword_10003F9A8)
  {
    sub_100005324(&qword_10003F898);
    sub_100005324(&qword_10003F888);
    sub_100009490(&qword_10003F8C8, &qword_10003F888);
    sub_10001ED74();
    swift_getOpaqueTypeConformance2();
    sub_100009490(&qword_10003F9B0, &qword_10003F9B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F9A8);
  }
  return result;
}

uint64_t sub_100022464()
{
  return sub_100009490(&qword_10003F9D0, &qword_10003F9D8);
}

unint64_t sub_1000224A4()
{
  unint64_t result = qword_10003F9E0;
  if (!qword_10003F9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F9E0);
  }
  return result;
}

unint64_t sub_1000224FC()
{
  unint64_t result = qword_10003F9E8;
  if (!qword_10003F9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F9E8);
  }
  return result;
}

unint64_t sub_100022554()
{
  unint64_t result = qword_10003F9F0;
  if (!qword_10003F9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F9F0);
  }
  return result;
}

unint64_t sub_1000225AC()
{
  unint64_t result = qword_10003F9F8;
  if (!qword_10003F9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003F9F8);
  }
  return result;
}

uint64_t sub_100022600()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002261C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100022638()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100022654@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100022680()
{
  return EnvironmentValues.foregroundColor.setter();
}

unint64_t sub_1000226AC()
{
  unint64_t result = qword_10003FA40;
  if (!qword_10003FA40)
  {
    sub_100005324(&qword_10003FA28);
    sub_10002274C();
    sub_100009490(&qword_10003FA88, &qword_10003FA90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003FA40);
  }
  return result;
}

unint64_t sub_10002274C()
{
  unint64_t result = qword_10003FA48;
  if (!qword_10003FA48)
  {
    sub_100005324(&qword_10003FA20);
    sub_1000227EC();
    sub_100009490(&qword_10003FA78, &qword_10003FA80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003FA48);
  }
  return result;
}

unint64_t sub_1000227EC()
{
  unint64_t result = qword_10003FA50;
  if (!qword_10003FA50)
  {
    sub_100005324(&qword_10003FA18);
    sub_10002288C();
    sub_100009490(&qword_10003F758, &qword_10003F760);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003FA50);
  }
  return result;
}

unint64_t sub_10002288C()
{
  unint64_t result = qword_10003FA58;
  if (!qword_10003FA58)
  {
    sub_100005324(&qword_10003FA10);
    sub_10002292C();
    sub_100009490(&qword_10003F758, &qword_10003F760);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003FA58);
  }
  return result;
}

unint64_t sub_10002292C()
{
  unint64_t result = qword_10003FA60;
  if (!qword_10003FA60)
  {
    sub_100005324(&qword_10003FA08);
    sub_1000229A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003FA60);
  }
  return result;
}

unint64_t sub_1000229A8()
{
  unint64_t result = qword_10003FA68;
  if (!qword_10003FA68)
  {
    sub_100005324(&qword_10003FA00);
    sub_100009490(&qword_10003FA70, &qword_10003FA38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003FA68);
  }
  return result;
}

uint64_t sub_100022A48()
{
  return _swift_deallocObject(v0, 17, 7);
}

void sub_100022A5C()
{
}

uint64_t sub_100022A80@<X0>(uint64_t a1@<X8>)
{
  return sub_10001F428(*(void *)(v1 + 16), a1);
}

uint64_t sub_100022A88(uint64_t a1)
{
  return a1;
}

uint64_t sub_100022AD8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100022AEC()
{
  sub_100006550(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 73, 7);
}

uint64_t sub_100022B38()
{
  return State.wrappedValue.setter();
}

unsigned char *sub_100022B88(unsigned char *a1, unsigned char *a2)
{
  return a2;
}

unint64_t sub_100022BE4()
{
  unint64_t result = qword_10003FAC0;
  if (!qword_10003FAC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003FAC0);
  }
  return result;
}

uint64_t _s9CarCamera25CameraButtonConfigurationVwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[6]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t _s9CarCamera25CameraButtonConfigurationVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 6) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 6) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraButtonConfiguration()
{
  return &type metadata for CameraButtonConfiguration;
}

uint64_t sub_100022CE0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100022D40()
{
  unint64_t result = qword_10003FAC8;
  if (!qword_10003FAC8)
  {
    sub_100005324(&qword_10003FAB8);
    sub_100022DE0();
    sub_100009490(&qword_10003FAF8, &qword_10003FB00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003FAC8);
  }
  return result;
}

unint64_t sub_100022DE0()
{
  unint64_t result = qword_10003FAD0;
  if (!qword_10003FAD0)
  {
    sub_100005324(&qword_10003FAB0);
    sub_100022E80();
    sub_100009490(&qword_10003F9B0, &qword_10003F9B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003FAD0);
  }
  return result;
}

unint64_t sub_100022E80()
{
  unint64_t result = qword_10003FAD8;
  if (!qword_10003FAD8)
  {
    sub_100005324(&qword_10003FAA8);
    sub_100022F20();
    sub_100009490(&qword_10003FA88, &qword_10003FA90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003FAD8);
  }
  return result;
}

unint64_t sub_100022F20()
{
  unint64_t result = qword_10003FAE0;
  if (!qword_10003FAE0)
  {
    sub_100005324(&qword_10003FAA0);
    sub_100022FC0();
    sub_100009490(&qword_10003FA78, &qword_10003FA80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003FAE0);
  }
  return result;
}

unint64_t sub_100022FC0()
{
  unint64_t result = qword_10003FAE8;
  if (!qword_10003FAE8)
  {
    sub_100005324(&qword_10003FA98);
    sub_100021064(&qword_10003FAF0, (void (*)(uint64_t))&type metadata accessor for ButtonStyleConfiguration.Label);
    sub_100009490(&qword_10003F758, &qword_10003F760);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003FAE8);
  }
  return result;
}

uint64_t sub_100023094()
{
  return sub_1000230BC();
}

uint64_t sub_1000230A8()
{
  return sub_1000230BC();
}

uint64_t sub_1000230BC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10002312C()
{
  return sub_100023154();
}

uint64_t sub_100023140()
{
  return sub_100023154();
}

uint64_t sub_100023154()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1000231C0()
{
  uint64_t v1 = v0;
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000062F4(v2, (uint64_t)qword_100041A08);
  unsigned int v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    int v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Close changed", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = sub_100023304();
  sub_10000594C(v6, *(void *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_headIndex), 0, 0, 1, 0xD000000000000014, 0x800000010002E470);
  uint64_t v7 = swift_retain();
  sub_10002371C(v7);
  return swift_release_n();
}

uint64_t sub_100023304()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100005214(&qword_10003F500);
  __chkstk_darwin(v2 - 8);
  os_log_type_t v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_1000062F4(v5, (uint64_t)qword_100041A08);
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "takePagerState()", v8, 2u);
    swift_slowDealloc();
  }

  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v9 = type metadata accessor for CameraCloseButton(0);
  int v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v4, 1, v9);
  sub_100005474((uint64_t)v4, &qword_10003F500);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v11 = v46;
  if (v46) {
    sub_1000090A4(v44, (char)v45, v46);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v12 = v46;
  if (v46) {
    sub_1000090A4(v44, (char)v45, v46);
  }
  uint64_t v13 = *(void *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_headIndex);
  uint64_t v43 = *(void *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_tailIndex);
  uint64_t v14 = v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_submenuParent;
  uint64_t v15 = *(void **)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_submenuParent + 8);
  if (v15)
  {
    int v36 = *(unsigned __int8 *)(v14 + 88);
    uint64_t v40 = v13;
    uint64_t v41 = v11;
    uint64_t v16 = *(void *)(v14 + 80);
    uint64_t v35 = *(void *)(v14 + 72);
    uint64_t v17 = *(void *)(v14 + 56);
    uint64_t v18 = *(void **)(v14 + 64);
    int v42 = v10;
    int v19 = *(void **)(v14 + 48);
    uint64_t v39 = *(void *)(v14 + 40);
    uint64_t v20 = *(void *)(v14 + 24);
    uint64_t v21 = *(void *)(v14 + 32);
    uint64_t v37 = v17;
    uint64_t v38 = v20;
    uint64_t v22 = *(void *)(v14 + 16);
    char v24 = v39 & 1;
    uint64_t v44 = *(void *)v14;
    uint64_t v23 = v44;
    uint64_t v45 = v15;
    uint64_t v46 = v22;
    uint64_t v47 = v20;
    uint64_t v48 = v21;
    char v49 = v39 & 1;
    uint64_t v50 = v19;
    uint64_t v51 = v17;
    uint64_t v52 = v18;
    char v53 = v35 & 1;
    uint64_t v54 = v16;
    char v55 = v36 & 1;
    swift_retain();
    id v25 = v15;
    sub_1000064F4(v21, v24);
    swift_retain();
    id v26 = v19;
    id v27 = v18;
    uint64_t v28 = sub_10000BCE4();
    uint64_t v13 = v40;
    uint64_t v29 = v21;
    uint64_t v11 = v41;
    uint64_t v30 = v19;
    int v10 = v42;
    sub_10000C67C(v23, v15, v22, v38, v29, v39, v30, v37, v18);
    BOOL v31 = *(void *)(v14 + 8) != 0;
  }
  else
  {
    uint64_t v28 = *(void **)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_topLevelActionButtons);
    swift_bridgeObjectRetain();
    BOOL v31 = 0;
  }
  type metadata accessor for PagerState();
  uint64_t v32 = swift_allocObject();
  *(unsigned char *)(v32 + 16) = v10 != 1;
  *(unsigned char *)(v32 + 17) = v11 != 0;
  *(unsigned char *)(v32 + 18) = v12 != 0;
  uint64_t v33 = v43;
  *(void *)(v32 + 24) = v13;
  *(void *)(v32 + 32) = v33;
  *(void *)(v32 + 40) = v28;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v32 + 48) = v31;
  return v32;
}

void sub_10002371C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100005214(&qword_10003F500);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  os_log_type_t v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  int v10 = (char *)&v58 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v58 - v11;
  if (!a1) {
    return;
  }
  uint64_t v13 = OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_isUpdating;
  if ((*(unsigned char *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_isUpdating) & 1) == 0)
  {
    *(unsigned char *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_isUpdating) = 1;
    uint64_t v19 = qword_10003EAB8;
    swift_retain();
    if (v19 != -1) {
      swift_once();
    }
    uint64_t v20 = type metadata accessor for Logger();
    sub_1000062F4(v20, (uint64_t)qword_100041A08);
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "applyPagerState(_:)", v23, 2u);
      swift_slowDealloc();
    }

    if (*(unsigned char *)(a1 + 48) == 1
      && (swift_getKeyPath(),
          swift_getKeyPath(),
          static Published.subscript.getter(),
          swift_release(),
          swift_release(),
          uint64_t v24 = v71,
          uint64_t v25 = swift_bridgeObjectRelease(),
          v24))
    {
      __chkstk_darwin(v25);
      *(&v58 - 2) = v2;
      *(&v58 - 1) = a1;
      static Animation.default.getter();
      withAnimation<A>(_:_:)();
      swift_release();
    }
    else
    {
      id v26 = sub_100005578();
      swift_getKeyPath();
      swift_getKeyPath();
      *(void *)&long long v71 = v26;
      swift_retain();
      static Published.subscript.setter();
    }
    if (*(unsigned char *)(a1 + 16) == 1)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      uint64_t v27 = type metadata accessor for CameraCloseButton(0);
      int v28 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 48))(v12, 1, v27);
      sub_100005474((uint64_t)v12, &qword_10003F500);
      if (v28 != 1) {
        goto LABEL_25;
      }
      swift_beginAccess();
      uint64_t v29 = *(void **)(v2 + 24);
      swift_getKeyPath();
      swift_getKeyPath();
      id v30 = v29;
      static Published.subscript.getter();

      swift_release();
      swift_release();
    }
    else
    {
      uint64_t v31 = type metadata accessor for CameraCloseButton(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v10, 1, 1, v31);
    }
    swift_getKeyPath();
    swift_getKeyPath();
    sub_1000052C0((uint64_t)v10, (uint64_t)v7, &qword_10003F500);
    swift_retain();
    uint64_t v32 = static Published.subscript.setter();
    sub_1000231C0(v32);
    sub_100005474((uint64_t)v10, &qword_10003F500);
LABEL_25:
    int v33 = *(unsigned __int8 *)(a1 + 17);
    swift_getKeyPath();
    swift_getKeyPath();
    if (v33 == 1)
    {
      static Published.subscript.getter();
      swift_release();
      swift_release();
      uint64_t v34 = v72;
      sub_1000090A4(v71, SBYTE8(v71), v72);
      if (v34) {
        goto LABEL_30;
      }
      char v35 = *(unsigned char *)(v2 + 32) | 0x40;
      uint64_t KeyPath = swift_getKeyPath();
      type metadata accessor for ButtonBarLayout(0);
      sub_1000288D4((unint64_t *)&qword_10003EE00, (void (*)(uint64_t))type metadata accessor for ButtonBarLayout);
      uint64_t v37 = EnvironmentObject.init()();
      uint64_t v39 = v38;
      LOBYTE(v63) = 0;
      State.init(wrappedValue:)();
      char v40 = v71;
      uint64_t v41 = *((void *)&v71 + 1);
      *(void *)&long long v71 = KeyPath;
      BYTE8(v71) = 0;
      uint64_t v72 = v37;
      uint64_t v73 = v39;
      char v74 = v35;
      __int16 v75 = 0;
      char v76 = v40;
      uint64_t v77 = v41;
      char v78 = 0;
      type metadata accessor for ButtonBarEntity();
      uint64_t v42 = swift_allocObject();
      uint64_t v43 = sub_1000285D8(&v71, 0xD000000000000019, 0x800000010002E4B0, (uint64_t)sub_10002AE3C, 0, v42);
      uint64_t v44 = swift_getKeyPath();
      swift_getKeyPath();
      swift_getKeyPath();
      long long v63 = (unint64_t)v44;
      uint64_t v64 = v43;
      swift_retain();
    }
    else
    {
      long long v71 = 0uLL;
      uint64_t v72 = 0;
      swift_retain();
    }
    static Published.subscript.setter();
LABEL_30:
    int v45 = *(unsigned __int8 *)(a1 + 18);
    swift_getKeyPath();
    swift_getKeyPath();
    if (v45 == 1)
    {
      static Published.subscript.getter();
      swift_release();
      swift_release();
      uint64_t v46 = v64;
      sub_1000090A4(v63, SBYTE8(v63), v64);
      if (v46)
      {
LABEL_35:
        *(void *)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_headIndex) = *(void *)(a1 + 24);
        uint64_t v57 = *(void *)(a1 + 32);
        swift_release();
        *(void *)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_tailIndex) = v57;
        *(unsigned char *)(v2 + v13) = 0;
        return;
      }
      char v47 = *(unsigned char *)(v2 + 32);
      uint64_t v48 = swift_getKeyPath();
      type metadata accessor for ButtonBarLayout(0);
      sub_1000288D4((unint64_t *)&qword_10003EE00, (void (*)(uint64_t))type metadata accessor for ButtonBarLayout);
      uint64_t v49 = EnvironmentObject.init()();
      uint64_t v51 = v50;
      LOBYTE(v60) = 0;
      State.init(wrappedValue:)();
      char v52 = v63;
      uint64_t v53 = *((void *)&v63 + 1);
      *(void *)&long long v63 = v48;
      BYTE8(v63) = 0;
      uint64_t v64 = v49;
      uint64_t v65 = v51;
      char v66 = v47;
      __int16 v67 = 0;
      char v68 = v52;
      uint64_t v69 = v53;
      char v70 = 0;
      type metadata accessor for ButtonBarEntity();
      uint64_t v54 = swift_allocObject();
      uint64_t v55 = sub_1000285D8(&v63, 0xD000000000000015, 0x800000010002E490, (uint64_t)sub_10002AE3C, 0, v54);
      uint64_t v56 = swift_getKeyPath();
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v60 = v56;
      uint64_t v61 = 0;
      uint64_t v62 = v55;
      swift_retain();
    }
    else
    {
      long long v63 = 0uLL;
      uint64_t v64 = 0;
      swift_retain();
    }
    static Published.subscript.setter();
    goto LABEL_35;
  }
  uint64_t v14 = qword_10003EAB8;
  swift_retain();
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  sub_1000062F4(v15, (uint64_t)qword_100041A08);
  os_log_t v59 = (os_log_t)Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v59, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v59, v16, "applyPagerState skipped, already in update pass", v17, 2u);
    swift_slowDealloc();
    swift_release();
    os_log_t v18 = v59;
  }
  else
  {

    swift_release();
  }
}

uint64_t sub_1000240E8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();

  return swift_release();
}

uint64_t sub_100024160(uint64_t result)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_pageNumber);
  if (v2 != result && v2 != -1)
  {
    uint64_t v4 = result;
    unint64_t result = sub_100023304();
    if (v2 <= v4)
    {
      uint64_t v12 = *(void *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_headIndex);
      uint64_t v9 = v12 - 1;
      if (!__OFSUB__(v12, 1))
      {
        uint64_t v11 = 0xD00000000000001BLL;
        unint64_t v7 = 0x800000010002E4D0;
        uint64_t v6 = 0;
        char v8 = 1;
        char v10 = 0;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_tailIndex);
      uint64_t v6 = v5 + 1;
      if (!__OFADD__(v5, 1))
      {
        unint64_t v7 = 0x800000010002E4F0;
        char v8 = 0;
        uint64_t v9 = 0;
        char v10 = 1;
        uint64_t v11 = 0xD000000000000017;
LABEL_10:
        sub_10000594C(result, v6, v8, v9, v10, v11, v7);
        uint64_t v13 = swift_retain();
        sub_10002371C(v13);
        return swift_release_n();
      }
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_10002427C(void *a1, double a2)
{
  uint64_t v3 = v2;
  id v81 = a1;
  uint64_t v5 = sub_100005214(&qword_100040008);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  char v76 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005214(&qword_100040010);
  uint64_t v74 = *(void *)(v8 - 8);
  uint64_t v75 = v8;
  __chkstk_darwin(v8);
  uint64_t v73 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005214(&qword_100040018);
  uint64_t v71 = *(void *)(v10 - 8);
  uint64_t v72 = v10;
  __chkstk_darwin(v10);
  char v70 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005214(&qword_100040020);
  uint64_t v68 = *(void *)(v12 - 8);
  uint64_t v69 = v12;
  __chkstk_darwin(v12);
  __int16 v67 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100005214(&qword_10003F550);
  uint64_t v80 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  char v79 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_100005214(&qword_10003F500);
  uint64_t v16 = __chkstk_darwin(v78);
  uint64_t v82 = (uint64_t)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v83 = (char *)&v64 - v18;
  uint64_t v19 = sub_100005214(&qword_10003FFF8);
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  os_log_type_t v22 = (char *)&v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100005214(&qword_10003FFF0);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t result = __chkstk_darwin(v23);
  uint64_t v27 = (char *)&v64 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!qword_1000419E0) {
    goto LABEL_20;
  }
  uint64_t v77 = v14;
  uint64_t v65 = v6;
  uint64_t v66 = v5;
  int v28 = *(unsigned __int8 *)(qword_1000419E0 + OBJC_IVAR____TtC9CarCamera17CameraAppDelegate_layoutConfig);
  if (v28 != 2)
  {
    *(unsigned char *)(v3 + 32) = v28 & 1;
    uint64_t v29 = v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout__previousButtonItem;
    uint64_t v84 = 0;
    uint64_t v85 = 0;
    uint64_t v86 = 0;
    sub_100005214(&qword_10003FBB8);
    Published.init(initialValue:)();
    id v30 = *(void (**)(uint64_t, char *, uint64_t))(v24 + 32);
    v30(v29, v27, v23);
    uint64_t v31 = v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout__nextButtonItem;
    uint64_t v84 = 0;
    uint64_t v85 = 0;
    uint64_t v86 = 0;
    Published.init(initialValue:)();
    v30(v31, v27, v23);
    uint64_t v32 = v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout__visibleSubItems;
    uint64_t v84 = 0;
    sub_100005214(&qword_10003FBC8);
    Published.init(initialValue:)();
    int v33 = *(void (**)(uint64_t, char *, uint64_t))(v20 + 32);
    v33(v32, v22, v19);
    uint64_t v34 = v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout__visibleTopItems;
    uint64_t v84 = 0;
    Published.init(initialValue:)();
    v33(v34, v22, v19);
    uint64_t v35 = v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout__closeButtonItem;
    uint64_t v36 = type metadata accessor for CameraCloseButton(0);
    uint64_t v37 = (uint64_t)v83;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v83, 1, 1, v36);
    uint64_t v38 = v82;
    sub_1000052C0(v37, v82, &qword_10003F500);
    uint64_t v39 = v79;
    Published.init(initialValue:)();
    sub_100005474(v37, &qword_10003F500);
    (*(void (**)(uint64_t, char *, uint64_t))(v80 + 32))(v35, v39, v77);
    if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
      char v40 = (void *)sub_1000289C4((unint64_t)_swiftEmptyArrayStorage);
    }
    else {
      char v40 = &_swiftEmptySetSingleton;
    }
    *(void *)(v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_cancellables) = v40;
    uint64_t v41 = v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_snapshot;
    uint64_t v42 = type metadata accessor for StateSnapShot(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v41, 1, 1, v42);
    *(unsigned char *)(v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_isUpdating) = 0;
    *(void *)(v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_pageNumber) = 0;
    uint64_t v43 = (_OWORD *)(v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_submenuParent);
    *uint64_t v43 = 0u;
    v43[1] = 0u;
    v43[2] = 0u;
    v43[3] = 0u;
    v43[4] = 0u;
    *(_OWORD *)((char *)v43 + 73) = 0u;
    *(void *)(v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_headIndex) = 0;
    *(void *)(v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_tailIndex) = 0;
    *(void *)(v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_topLevelActionButtons) = _swiftEmptyArrayStorage;
    if (qword_10003EAB8 != -1) {
      swift_once();
    }
    uint64_t v44 = type metadata accessor for Logger();
    sub_1000062F4(v44, (uint64_t)qword_100041A08);
    int v45 = Logger.logObject.getter();
    os_log_type_t v46 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v45, v46))
    {
      char v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v47 = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, v46, "ButtonBarLayout init", v47, 2u);
      swift_slowDealloc();
    }

    swift_beginAccess();
    type metadata accessor for CameraModel();
    sub_1000288D4(&qword_10003F6F0, (void (*)(uint64_t))type metadata accessor for CameraModel);
    id v48 = v81;
    *(void *)(v3 + 16) = ObservedObject.init(wrappedValue:)();
    *(void *)(v3 + 24) = v49;
    uint64_t result = swift_endAccess();
    double v50 = 36.0;
    if (*(unsigned char *)(v3 + 32)) {
      double v50 = 32.0;
    }
    double v51 = a2 / v50;
    if ((~*(void *)&v51 & 0x7FF0000000000000) != 0)
    {
      if (v51 > -9.22337204e18)
      {
        if (v51 < 9.22337204e18)
        {
          uint64_t v52 = (uint64_t)v51;
          type metadata accessor for Pager();
          uint64_t v53 = (void *)swift_allocObject();
          v53[3] = 0;
          v53[4] = 0;
          v53[2] = v52;
          *(void *)(v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_pager) = v53;
          swift_getKeyPath();
          swift_getKeyPath();
          static Published.subscript.getter();
          swift_release();
          swift_release();
          swift_getKeyPath();
          swift_getKeyPath();
          sub_1000052C0(v37, v38, &qword_10003F500);
          swift_retain();
          static Published.subscript.setter();
          sub_1000231C0();
          sub_100005474(v37, &qword_10003F500);
          swift_beginAccess();
          uint64_t v54 = v67;
          Published.projectedValue.getter();
          swift_endAccess();
          swift_allocObject();
          swift_weakInit();
          sub_100028974(&qword_100040028, &qword_100040020);
          uint64_t v55 = v69;
          Publisher<>.sink(receiveValue:)();
          swift_release();
          (*(void (**)(char *, uint64_t))(v68 + 8))(v54, v55);
          swift_beginAccess();
          AnyCancellable.store(in:)();
          swift_endAccess();
          swift_release();
          swift_beginAccess();
          sub_100005214(&qword_10003F548);
          uint64_t v56 = v70;
          Published.projectedValue.getter();
          swift_endAccess();
          swift_allocObject();
          swift_weakInit();
          sub_100028974(&qword_100040030, &qword_100040018);
          uint64_t v57 = v72;
          Publisher<>.sink(receiveValue:)();
          swift_release();
          (*(void (**)(char *, uint64_t))(v71 + 8))(v56, v57);
          swift_beginAccess();
          AnyCancellable.store(in:)();
          swift_endAccess();
          swift_release();
          swift_beginAccess();
          sub_100005214(&qword_10003F540);
          uint64_t v58 = v73;
          Published.projectedValue.getter();
          swift_endAccess();
          swift_allocObject();
          swift_weakInit();
          sub_100028974(&qword_100040038, &qword_100040010);
          uint64_t v59 = v75;
          Publisher<>.sink(receiveValue:)();
          swift_release();
          (*(void (**)(char *, uint64_t))(v74 + 8))(v58, v59);
          swift_beginAccess();
          AnyCancellable.store(in:)();
          swift_endAccess();
          swift_release();
          swift_beginAccess();
          sub_100005214(&qword_10003F538);
          uint64_t v60 = v76;
          Published.projectedValue.getter();
          swift_endAccess();
          swift_allocObject();
          swift_weakInit();
          sub_100028974(&qword_100040040, &qword_100040008);
          uint64_t v61 = v66;
          Publisher<>.sink(receiveValue:)();
          swift_release();
          (*(void (**)(char *, uint64_t))(v65 + 8))(v60, v61);
          swift_beginAccess();
          AnyCancellable.store(in:)();
          swift_endAccess();
          swift_release();
          uint64_t v62 = sub_100023304();
          swift_retain();
          sub_10000594C(v62, 0, 0, 0, 1, 0x692074756F79616CLL, 0xEB0000000074696ELL);
          swift_release();
          uint64_t v63 = swift_retain();
          sub_10002371C(v63);
          swift_release_n();

          return v3;
        }
        goto LABEL_19;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10002506C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005214(&qword_10003F500);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v22 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v22 - v11;
  uint64_t v13 = a2 + 16;
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  sub_1000062F4(v14, (uint64_t)qword_100041A08);
  sub_1000052C0(a1, (uint64_t)v12, &qword_10003F500);
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v22 = v13;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v23 = a1;
    uint64_t v18 = (uint8_t *)v17;
    v25[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315138;
    sub_1000052C0((uint64_t)v12, (uint64_t)v10, &qword_10003F500);
    uint64_t v19 = String.init<A>(describing:)();
    uint64_t v24 = sub_10000E6A0(v19, v20, v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_100005474((uint64_t)v12, &qword_10003F500);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "sink %s", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v23;
    swift_slowDealloc();
  }
  else
  {
    sub_100005474((uint64_t)v12, &qword_10003F500);
  }

  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1000052C0(a1, (uint64_t)v10, &qword_10003F500);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_1000052C0((uint64_t)v10, (uint64_t)v7, &qword_10003F500);
    swift_retain();
    static Published.subscript.setter();
    sub_1000231C0();
    sub_100005474((uint64_t)v10, &qword_10003F500);
    return swift_release();
  }
  return result;
}

uint64_t sub_100025390(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000062F4(v2, (uint64_t)qword_100041A08);
  swift_bridgeObjectRetain();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 134217984;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "sink visibleButtons - %ld", v5, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(void *)(Strong + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_topLevelActionButtons) = v1;
    swift_bridgeObjectRetain();
    swift_release();
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v8 = sub_100023304();
    swift_release();
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      swift_retain();
      swift_release();
      sub_10000594C(v8, 0, 0, 0, 1, 0xD000000000000019, 0x800000010002E560);
      swift_release();
    }
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      uint64_t v9 = swift_retain();
      sub_10002371C(v9);
      swift_release();
      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_100025610(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unint64_t v1 = a1[1];
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_1000062F4(v3, (uint64_t)qword_100041A08);
  swift_bridgeObjectRetain_n();
  os_log_type_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    v13[0] = v7;
    if (v1)
    {
      unint64_t v8 = v1;
    }
    else
    {
      uint64_t v2 = 0;
      unint64_t v8 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    sub_10000E6A0(v2, v8, v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "sink identifierChanged - %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v10 = *(void *)(result + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_submenuParent + 8);
    uint64_t result = swift_release();
    if (v10)
    {
      swift_beginAccess();
      uint64_t result = swift_weakLoadStrong();
      if (result)
      {
        uint64_t v11 = sub_100023304();
        swift_release();
        swift_beginAccess();
        if (swift_weakLoadStrong())
        {
          swift_retain();
          swift_release();
          sub_10000594C(v11, 0, 0, 0, 1, 0xD000000000000024, 0x800000010002E530);
          swift_release();
        }
        swift_beginAccess();
        if (swift_weakLoadStrong())
        {
          uint64_t v12 = swift_retain();
          sub_10002371C(v12);
          swift_release();
          swift_release();
        }
        return swift_release();
      }
    }
  }
  return result;
}

uint64_t sub_100025908(uint64_t a1)
{
  uint64_t v2 = sub_100005214(&qword_100040000);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v57 = (uint64_t)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v50 - v6;
  __chkstk_darwin(v5);
  uint64_t v51 = (uint64_t)&v50 - v8;
  uint64_t v10 = *(void *)a1;
  uint64_t v9 = *(void **)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v63 = *(void **)(a1 + 48);
  uint64_t v64 = v13;
  uint64_t v62 = *(void *)(a1 + 56);
  uint64_t v61 = *(void **)(a1 + 64);
  uint64_t v60 = *(void *)(a1 + 72);
  uint64_t v59 = *(void *)(a1 + 80);
  int v58 = *(unsigned __int8 *)(a1 + 88);
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  sub_1000062F4(v15, (uint64_t)qword_100041A08);
  os_log_type_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "sink submenuParent", v18, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v20 = Strong + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_submenuParent;
    uint64_t v55 = *(void *)(Strong + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_submenuParent);
    uint64_t v54 = *(void **)(Strong + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_submenuParent + 8);
    uint64_t v53 = *(void *)(Strong + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_submenuParent + 16);
    uint64_t v21 = v10;
    uint64_t v22 = v11;
    uint64_t v23 = *(void *)(v20 + 24);
    uint64_t v24 = *(void *)(v20 + 32);
    uint64_t v25 = v12;
    uint64_t v26 = v14;
    uint64_t v27 = *(void *)(v20 + 40);
    int v28 = *(void **)(v20 + 48);
    uint64_t v56 = v7;
    uint64_t v29 = *(void *)(v20 + 56);
    long long v52 = *(_OWORD *)(v20 + 64);
    *(void *)uint64_t v20 = v21;
    *(void *)(v20 + 8) = v9;
    *(void *)(v20 + 16) = v22;
    *(void *)(v20 + 24) = v25;
    uint64_t v31 = v63;
    uint64_t v30 = v64;
    *(void *)(v20 + 32) = v26;
    *(void *)(v20 + 40) = v30;
    uint64_t v32 = v62;
    *(void *)(v20 + 48) = v31;
    *(void *)(v20 + 56) = v32;
    int v33 = v61;
    uint64_t v34 = v60;
    *(void *)(v20 + 64) = v61;
    *(void *)(v20 + 72) = v34;
    *(void *)(v20 + 80) = v59;
    *(unsigned char *)(v20 + 88) = v58;
    sub_1000210B4(v21, v9, v22, v25, v26, v30, v31, v32, v33);
    uint64_t v35 = v29;
    uint64_t v7 = v56;
    sub_10000C67C(v55, v54, v53, v23, v24, v27, v28, v35, (void *)v52);
    swift_release();
  }
  if (v9)
  {
    swift_beginAccess();
    uint64_t v36 = swift_weakLoadStrong();
    if (v36)
    {
      uint64_t v37 = v36;
      swift_beginAccess();
      if (swift_weakLoadStrong())
      {
        sub_1000263C0((uint64_t)v7);
        swift_release();
        uint64_t v38 = type metadata accessor for StateSnapShot(0);
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v7, 0, 1, v38);
      }
      else
      {
        uint64_t v44 = type metadata accessor for StateSnapShot(0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v7, 1, 1, v44);
      }
      uint64_t v45 = v57;
      sub_100009328((uint64_t)v7, v57, &qword_100040000);
      uint64_t v46 = v37 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_snapshot;
      swift_beginAccess();
      sub_100028C78(v45, v46);
      swift_endAccess();
      swift_release();
    }
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      uint64_t v47 = sub_100023304();
      swift_release();
      swift_beginAccess();
      if (swift_weakLoadStrong())
      {
        swift_retain();
        swift_release();
        sub_10000594C(v47, 0, 0, 0, 1, 0xD00000000000001FLL, 0x800000010002E510);
        swift_release();
      }
      swift_beginAccess();
      if (swift_weakLoadStrong())
      {
        uint64_t v48 = swift_retain();
        sub_10002371C(v48);
        swift_release();
        return swift_release_n();
      }
      else
      {
        return swift_release();
      }
    }
  }
  else
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      swift_beginAccess();
      uint64_t v40 = swift_weakLoadStrong();
      if (v40)
      {
        uint64_t v41 = v40 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_snapshot;
        swift_beginAccess();
        uint64_t v42 = v41;
        uint64_t v43 = v51;
        sub_1000052C0(v42, v51, &qword_100040000);
        swift_release();
      }
      else
      {
        uint64_t v49 = type metadata accessor for StateSnapShot(0);
        uint64_t v43 = v51;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v51, 1, 1, v49);
      }
      sub_100025F44(v43);
      swift_release();
      return sub_100005474(v43, &qword_100040000);
    }
  }
  return result;
}

uint64_t sub_100025F44(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100005214(&qword_10003F500);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v35 - v8;
  uint64_t v10 = sub_100005214(&qword_100040000);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v35 - v14;
  os_log_type_t v16 = (int *)type metadata accessor for StateSnapShot(0);
  uint64_t v17 = *((void *)v16 - 1);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000052C0(a1, (uint64_t)v15, &qword_100040000);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v17 + 48))(v15, 1, v16) == 1) {
    return sub_100005474((uint64_t)v15, &qword_100040000);
  }
  sub_100028CE0((uint64_t)v15, (uint64_t)v19);
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v21 = type metadata accessor for Logger();
  sub_1000062F4(v21, (uint64_t)qword_100041A08);
  uint64_t v22 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "applySnapshot(_:)", v24, 2u);
    swift_slowDealloc();
  }

  sub_1000052C0((uint64_t)v19, (uint64_t)v9, &qword_10003F500);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000052C0((uint64_t)v9, (uint64_t)v7, &qword_10003F500);
  swift_retain();
  static Published.subscript.setter();
  sub_1000231C0();
  sub_100005474((uint64_t)v9, &qword_10003F500);
  uint64_t v25 = (uint64_t *)&v19[v16[5]];
  uint64_t v26 = *v25;
  uint64_t v27 = v25[1];
  uint64_t v28 = v25[2];
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v36 = v26;
  uint64_t v37 = v27;
  uint64_t v38 = v28;
  swift_retain();
  sub_100009060(v26, v27, v28);
  static Published.subscript.setter();
  uint64_t v29 = (uint64_t *)&v19[v16[6]];
  uint64_t v30 = *v29;
  uint64_t v31 = v29[1];
  uint64_t v32 = v29[2];
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v36 = v30;
  uint64_t v37 = v31;
  uint64_t v38 = v32;
  swift_retain();
  sub_100009060(v30, v31, v32);
  static Published.subscript.setter();
  *(void *)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_headIndex) = *(void *)&v19[v16[8]];
  uint64_t v33 = *(void *)&v19[v16[9]];
  sub_100028D44((uint64_t)v19, type metadata accessor for StateSnapShot);
  *(void *)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_tailIndex) = v33;
  (*(void (**)(char *, uint64_t, uint64_t, int *))(v17 + 56))(v13, 1, 1, v16);
  uint64_t v34 = v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_snapshot;
  swift_beginAccess();
  sub_100028C78((uint64_t)v13, v34);
  return swift_endAccess();
}

double sub_1000263C0@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100005214(&qword_10003F500);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_1000062F4(v7, (uint64_t)qword_100041A08);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "takeSnapshot()", v10, 2u);
    swift_slowDealloc();
  }

  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  long long v20 = v21;
  uint64_t v11 = v22;
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  long long v19 = v21;
  uint64_t v12 = v22;
  uint64_t v13 = *(void *)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_headIndex);
  uint64_t v14 = *(void *)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_tailIndex);
  sub_100009328((uint64_t)v6, a1, &qword_10003F500);
  uint64_t v15 = (int *)type metadata accessor for StateSnapShot(0);
  uint64_t v16 = a1 + v15[5];
  *(_OWORD *)uint64_t v16 = v20;
  *(void *)(v16 + 16) = v11;
  uint64_t v17 = a1 + v15[6];
  double result = *(double *)&v19;
  *(_OWORD *)uint64_t v17 = v19;
  *(void *)(v17 + 16) = v12;
  *(void *)(a1 + v15[7]) = 0;
  *(void *)(a1 + v15[8]) = v13;
  *(void *)(a1 + v15[9]) = v14;
  return result;
}

uint64_t sub_100026650()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout__previousButtonItem;
  uint64_t v2 = sub_100005214(&qword_10003FFF0);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout__nextButtonItem, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout__visibleSubItems;
  uint64_t v5 = sub_100005214(&qword_10003FFF8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout__visibleTopItems, v5);
  uint64_t v7 = v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout__closeButtonItem;
  uint64_t v8 = sub_100005214(&qword_10003F550);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  sub_100005474(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_snapshot, &qword_100040000);
  swift_release();
  sub_10000C67C(*(void *)(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_submenuParent), *(void **)(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_submenuParent + 8), *(void *)(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_submenuParent + 16), *(void *)(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_submenuParent + 24), *(void *)(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_submenuParent + 32), *(void *)(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_submenuParent + 40), *(void **)(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_submenuParent + 48), *(void *)(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_submenuParent + 56), *(void **)(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_submenuParent + 64));
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100026828()
{
  sub_100026650();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_100026880()
{
  return type metadata accessor for ButtonBarLayout(0);
}

uint64_t type metadata accessor for ButtonBarLayout(uint64_t a1)
{
  return sub_10001ED3C(a1, (uint64_t *)&unk_10003FBA0);
}

void sub_1000268A8()
{
  sub_100012AC4(319, &qword_10003FBB0, &qword_10003FBB8);
  if (v0 <= 0x3F)
  {
    sub_100012AC4(319, &qword_10003FBC0, &qword_10003FBC8);
    if (v1 <= 0x3F)
    {
      sub_100012AC4(319, &qword_10003F4F8, &qword_10003F500);
      if (v2 <= 0x3F)
      {
        sub_100027EBC(319, (unint64_t *)&unk_10003FBD0, (void (*)(uint64_t))type metadata accessor for StateSnapShot);
        if (v3 <= 0x3F) {
          swift_updateClassMetadata2();
        }
      }
    }
  }
}

uint64_t type metadata accessor for StateSnapShot(uint64_t a1)
{
  return sub_10001ED3C(a1, (uint64_t *)&unk_10003FF98);
}

uint64_t sub_100026AA8@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ButtonBarLayout(0);
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100026AE8()
{
  return static Published.subscript.setter();
}

uint64_t sub_100026B6C()
{
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for LayoutSize()
{
  return self;
}

uint64_t *sub_100026BA0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = (int *)type metadata accessor for CameraCloseButton(0);
    uint64_t v8 = *((void *)v7 - 1);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_100005214(&qword_10003F500);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      uint64_t v11 = (void *)a2[1];
      *a1 = *a2;
      a1[1] = (uint64_t)v11;
      uint64_t v12 = a2[3];
      a1[2] = a2[2];
      a1[3] = v12;
      *((unsigned char *)a1 + 32) = *((unsigned char *)a2 + 32);
      a1[5] = a2[5];
      uint64_t v13 = v7[7];
      uint64_t v29 = (char *)a2 + v13;
      uint64_t v30 = (char *)a1 + v13;
      uint64_t v14 = type metadata accessor for UUID();
      uint64_t v28 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
      id v15 = v11;
      swift_retain();
      swift_retain();
      v28(v30, v29, v14);
      *((unsigned char *)a1 + v7[8]) = *((unsigned char *)a2 + v7[8]);
      *((unsigned char *)a1 + v7[9]) = *((unsigned char *)a2 + v7[9]);
      *((unsigned char *)a1 + v7[10]) = *((unsigned char *)a2 + v7[10]);
      (*(void (**)(uint64_t *, void, uint64_t, int *))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v16 = a3[5];
    uint64_t v17 = (char *)a1 + v16;
    uint64_t v18 = (char *)a2 + v16;
    if (*(uint64_t *)((char *)a2 + v16 + 16))
    {
      uint64_t v19 = *(void *)v18;
      char v20 = v18[8];
      sub_1000064F4(*(void *)v18, v20);
      *(void *)uint64_t v17 = v19;
      v17[8] = v20;
      *((void *)v17 + 2) = *((void *)v18 + 2);
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
      *((void *)v17 + 2) = *((void *)v18 + 2);
    }
    uint64_t v21 = a3[6];
    uint64_t v22 = (char *)a1 + v21;
    os_log_type_t v23 = (char *)a2 + v21;
    if (*(uint64_t *)((char *)a2 + v21 + 16))
    {
      uint64_t v24 = *(void *)v23;
      char v25 = v23[8];
      sub_1000064F4(*(void *)v23, v25);
      *(void *)uint64_t v22 = v24;
      v22[8] = v25;
      *((void *)v22 + 2) = *((void *)v23 + 2);
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
      *((void *)v22 + 2) = *((void *)v23 + 2);
    }
    uint64_t v26 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)a1 + v26) = *(uint64_t *)((char *)a2 + v26);
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100026E74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CameraCloseButton(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1, v4))
  {

    swift_release();
    swift_release();
    uint64_t v5 = a1 + *(int *)(v4 + 28);
    uint64_t v6 = type metadata accessor for UUID();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 20);
  if (*(void *)(v7 + 16))
  {
    sub_100006550(*(void *)v7, *(unsigned char *)(v7 + 8));
    swift_release();
  }
  uint64_t v8 = a1 + *(int *)(a2 + 24);
  if (*(void *)(v8 + 16))
  {
    sub_100006550(*(void *)v8, *(unsigned char *)(v8 + 8));
    swift_release();
  }

  return swift_bridgeObjectRelease();
}

void *sub_100026F9C(void *a1, void *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for CameraCloseButton(0);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100005214(&qword_10003F500);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v9 = (void *)a2[1];
    *a1 = *a2;
    a1[1] = v9;
    uint64_t v10 = a2[3];
    a1[2] = a2[2];
    a1[3] = v10;
    *((unsigned char *)a1 + 32) = *((unsigned char *)a2 + 32);
    a1[5] = a2[5];
    uint64_t v11 = v6[7];
    uint64_t v27 = (char *)a2 + v11;
    uint64_t v28 = (char *)a1 + v11;
    uint64_t v12 = type metadata accessor for UUID();
    uint64_t v26 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    id v13 = v9;
    swift_retain();
    swift_retain();
    v26(v28, v27, v12);
    *((unsigned char *)a1 + v6[8]) = *((unsigned char *)a2 + v6[8]);
    *((unsigned char *)a1 + v6[9]) = *((unsigned char *)a2 + v6[9]);
    *((unsigned char *)a1 + v6[10]) = *((unsigned char *)a2 + v6[10]);
    (*(void (**)(void *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v14 = a3[5];
  id v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  if (*(void *)((char *)a2 + v14 + 16))
  {
    uint64_t v17 = *(void *)v16;
    char v18 = v16[8];
    sub_1000064F4(*(void *)v16, v18);
    *(void *)id v15 = v17;
    _OWORD v15[8] = v18;
    *((void *)v15 + 2) = *((void *)v16 + 2);
    swift_retain();
  }
  else
  {
    *(_OWORD *)id v15 = *(_OWORD *)v16;
    *((void *)v15 + 2) = *((void *)v16 + 2);
  }
  uint64_t v19 = a3[6];
  char v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  if (*(void *)((char *)a2 + v19 + 16))
  {
    uint64_t v22 = *(void *)v21;
    char v23 = v21[8];
    sub_1000064F4(*(void *)v21, v23);
    *(void *)char v20 = v22;
    v20[8] = v23;
    *((void *)v20 + 2) = *((void *)v21 + 2);
    swift_retain();
  }
  else
  {
    *(_OWORD *)char v20 = *(_OWORD *)v21;
    *((void *)v20 + 2) = *((void *)v21 + 2);
  }
  uint64_t v24 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v24) = *(void *)((char *)a2 + v24);
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100027220(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for CameraCloseButton(0);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      *(void *)a1 = *(void *)a2;
      uint64_t v11 = *(void **)(a2 + 8);
      *(void *)(a1 + 8) = v11;
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      uint64_t v12 = v6[7];
      uint64_t v51 = a2 + v12;
      uint64_t v52 = a1 + v12;
      uint64_t v13 = type metadata accessor for UUID();
      uint64_t v50 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
      id v14 = v11;
      swift_retain();
      swift_retain();
      v50(v52, v51, v13);
      *(unsigned char *)(a1 + v6[8]) = *(unsigned char *)(a2 + v6[8]);
      *(unsigned char *)(a1 + v6[9]) = *(unsigned char *)(a2 + v6[9]);
      *(unsigned char *)(a1 + v6[10]) = *(unsigned char *)(a2 + v6[10]);
      (*(void (**)(uint64_t, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    sub_100028D44(a1, type metadata accessor for CameraCloseButton);
LABEL_6:
    uint64_t v15 = sub_100005214(&qword_10003F500);
    memcpy((void *)a1, (const void *)a2, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  *(void *)a1 = *(void *)a2;
  uint64_t v28 = *(void **)(a2 + 8);
  uint64_t v29 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v28;
  id v30 = v28;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  uint64_t v31 = v6[7];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  uint64_t v34 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 24))(v32, v33, v34);
  *(unsigned char *)(a1 + v6[8]) = *(unsigned char *)(a2 + v6[8]);
  *(unsigned char *)(a1 + v6[9]) = *(unsigned char *)(a2 + v6[9]);
  *(unsigned char *)(a1 + v6[10]) = *(unsigned char *)(a2 + v6[10]);
LABEL_7:
  uint64_t v16 = a3[5];
  uint64_t v17 = a1 + v16;
  char v18 = (long long *)(a2 + v16);
  uint64_t v19 = *(void *)(a1 + v16 + 16);
  uint64_t v20 = *(void *)(a2 + v16 + 16);
  if (v19)
  {
    if (v20)
    {
      uint64_t v21 = *(void *)v18;
      char v22 = *((unsigned char *)v18 + 8);
      sub_1000064F4(*(void *)v18, v22);
      uint64_t v23 = *(void *)v17;
      char v24 = *(unsigned char *)(v17 + 8);
      *(void *)uint64_t v17 = v21;
      *(unsigned char *)(v17 + 8) = v22;
      sub_100006550(v23, v24);
      *(void *)(v17 + 16) = *((void *)v18 + 2);
      swift_retain();
      swift_release();
    }
    else
    {
      sub_1000276A8(v17);
      uint64_t v27 = *((void *)v18 + 2);
      *(_OWORD *)uint64_t v17 = *v18;
      *(void *)(v17 + 16) = v27;
    }
  }
  else if (v20)
  {
    uint64_t v25 = *(void *)v18;
    char v26 = *((unsigned char *)v18 + 8);
    sub_1000064F4(*(void *)v18, v26);
    *(void *)uint64_t v17 = v25;
    *(unsigned char *)(v17 + 8) = v26;
    *(void *)(v17 + 16) = *((void *)v18 + 2);
    swift_retain();
  }
  else
  {
    long long v35 = *v18;
    *(void *)(v17 + 16) = *((void *)v18 + 2);
    *(_OWORD *)uint64_t v17 = v35;
  }
  uint64_t v36 = a3[6];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = (long long *)(a2 + v36);
  uint64_t v39 = *(void *)(a1 + v36 + 16);
  uint64_t v40 = *(void *)(a2 + v36 + 16);
  if (v39)
  {
    if (v40)
    {
      uint64_t v41 = *(void *)v38;
      char v42 = *((unsigned char *)v38 + 8);
      sub_1000064F4(*(void *)v38, v42);
      uint64_t v43 = *(void *)v37;
      char v44 = *(unsigned char *)(v37 + 8);
      *(void *)uint64_t v37 = v41;
      *(unsigned char *)(v37 + 8) = v42;
      sub_100006550(v43, v44);
      *(void *)(v37 + 16) = *((void *)v38 + 2);
      swift_retain();
      swift_release();
    }
    else
    {
      sub_1000276A8(v37);
      uint64_t v47 = *((void *)v38 + 2);
      *(_OWORD *)uint64_t v37 = *v38;
      *(void *)(v37 + 16) = v47;
    }
  }
  else if (v40)
  {
    uint64_t v45 = *(void *)v38;
    char v46 = *((unsigned char *)v38 + 8);
    sub_1000064F4(*(void *)v38, v46);
    *(void *)uint64_t v37 = v45;
    *(unsigned char *)(v37 + 8) = v46;
    *(void *)(v37 + 16) = *((void *)v38 + 2);
    swift_retain();
  }
  else
  {
    long long v48 = *v38;
    *(void *)(v37 + 16) = *((void *)v38 + 2);
    *(_OWORD *)uint64_t v37 = v48;
  }
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  return a1;
}

uint64_t sub_1000276A8(uint64_t a1)
{
  return a1;
}

_OWORD *sub_1000276FC(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for CameraCloseButton(0);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100005214(&qword_10003F500);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    long long v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    a1[2] = a2[2];
    uint64_t v10 = v6[7];
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = type metadata accessor for UUID();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
    *((unsigned char *)a1 + v6[8]) = *((unsigned char *)a2 + v6[8]);
    *((unsigned char *)a1 + v6[9]) = *((unsigned char *)a2 + v6[9]);
    *((unsigned char *)a1 + v6[10]) = *((unsigned char *)a2 + v6[10]);
    (*(void (**)(_OWORD *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v14 = a3[5];
  uint64_t v15 = a3[6];
  uint64_t v16 = (char *)a1 + v14;
  uint64_t v17 = (char *)a2 + v14;
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  *((void *)v16 + 2) = *((void *)v17 + 2);
  char v18 = (char *)a1 + v15;
  uint64_t v19 = (char *)a2 + v15;
  *(_OWORD *)char v18 = *(_OWORD *)v19;
  *((void *)v18 + 2) = *((void *)v19 + 2);
  uint64_t v20 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v20) = *(void *)((char *)a2 + v20);
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  return a1;
}

_OWORD *sub_1000278D0(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for CameraCloseButton(0);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(_OWORD *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      long long v11 = a2[1];
      *a1 = *a2;
      a1[1] = v11;
      a1[2] = a2[2];
      uint64_t v12 = v6[7];
      uint64_t v13 = (char *)a1 + v12;
      uint64_t v14 = (char *)a2 + v12;
      uint64_t v15 = type metadata accessor for UUID();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
      *((unsigned char *)a1 + v6[8]) = *((unsigned char *)a2 + v6[8]);
      *((unsigned char *)a1 + v6[9]) = *((unsigned char *)a2 + v6[9]);
      *((unsigned char *)a1 + v6[10]) = *((unsigned char *)a2 + v6[10]);
      (*(void (**)(_OWORD *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    sub_100028D44((uint64_t)a1, type metadata accessor for CameraCloseButton);
LABEL_6:
    uint64_t v16 = sub_100005214(&qword_10003F500);
    memcpy(a1, a2, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v31 = *((void *)a2 + 1);
  uint64_t v32 = (void *)*((void *)a1 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v31;

  *((void *)a1 + 2) = *((void *)a2 + 2);
  swift_release();
  *((void *)a1 + 3) = *((void *)a2 + 3);
  *((unsigned char *)a1 + 32) = *((unsigned char *)a2 + 32);
  *((void *)a1 + 5) = *((void *)a2 + 5);
  swift_release();
  uint64_t v33 = v6[7];
  uint64_t v34 = (char *)a1 + v33;
  long long v35 = (char *)a2 + v33;
  uint64_t v36 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 40))(v34, v35, v36);
  *((unsigned char *)a1 + v6[8]) = *((unsigned char *)a2 + v6[8]);
  *((unsigned char *)a1 + v6[9]) = *((unsigned char *)a2 + v6[9]);
  *((unsigned char *)a1 + v6[10]) = *((unsigned char *)a2 + v6[10]);
LABEL_7:
  uint64_t v17 = a3[5];
  uint64_t v18 = (uint64_t)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  if (*(void *)((char *)a1 + v17 + 16))
  {
    if (*((void *)v19 + 2))
    {
      char v20 = v19[8];
      uint64_t v21 = *(void *)v18;
      char v22 = *(unsigned char *)(v18 + 8);
      *(void *)uint64_t v18 = *(void *)v19;
      *(unsigned char *)(v18 + 8) = v20;
      sub_100006550(v21, v22);
      *(void *)(v18 + 16) = *((void *)v19 + 2);
      swift_release();
      goto LABEL_12;
    }
    sub_1000276A8(v18);
  }
  *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  *(void *)(v18 + 16) = *((void *)v19 + 2);
LABEL_12:
  uint64_t v23 = a3[6];
  uint64_t v24 = (uint64_t)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  if (!*(void *)((char *)a1 + v23 + 16))
  {
LABEL_16:
    *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
    *(void *)(v24 + 16) = *((void *)v25 + 2);
    goto LABEL_17;
  }
  if (!*((void *)v25 + 2))
  {
    sub_1000276A8(v24);
    goto LABEL_16;
  }
  char v26 = v25[8];
  uint64_t v27 = *(void *)v24;
  char v28 = *(unsigned char *)(v24 + 8);
  *(void *)uint64_t v24 = *(void *)v25;
  *(unsigned char *)(v24 + 8) = v26;
  sub_100006550(v27, v28);
  *(void *)(v24 + 16) = *((void *)v25 + 2);
  swift_release();
LABEL_17:
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRelease();
  uint64_t v29 = a3[9];
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  *(void *)((char *)a1 + v29) = *(void *)((char *)a2 + v29);
  return a1;
}

uint64_t sub_100027C30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100027C44);
}

uint64_t sub_100027C44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005214(&qword_10003F500);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 16);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_100027D18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100027D2C);
}

uint64_t sub_100027D2C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100005214(&qword_10003F500);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 16) = a2;
  }
  return result;
}

void sub_100027DF0()
{
  sub_100027EBC(319, (unint64_t *)&unk_10003FFA8, (void (*)(uint64_t))type metadata accessor for CameraCloseButton);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100027EBC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = type metadata accessor for Optional();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_100027F10@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for LayoutSize();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100027F4C()
{
  return sub_100028080();
}

uint64_t sub_100027F60(uint64_t a1, void **a2)
{
  uint64_t v4 = sub_100005214(&qword_10003F500);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v13 - v8;
  sub_1000052C0(a1, (uint64_t)&v13 - v8, &qword_10003F500);
  unint64_t v10 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000052C0((uint64_t)v9, (uint64_t)v6, &qword_10003F500);
  id v11 = v10;
  static Published.subscript.setter();
  return sub_100005474((uint64_t)v9, &qword_10003F500);
}

uint64_t sub_10002806C()
{
  return sub_100028080();
}

uint64_t sub_100028080()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();

  return swift_release();
}

uint64_t sub_1000280F8()
{
  return sub_100028080();
}

uint64_t sub_100028120(uint64_t a1)
{
  uint64_t v2 = sub_100005214(&qword_10003F500);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v9 - v6;
  sub_1000052C0(a1, (uint64_t)&v9 - v6, &qword_10003F500);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000052C0((uint64_t)v7, (uint64_t)v4, &qword_10003F500);
  swift_retain();
  static Published.subscript.setter();
  sub_1000231C0();
  return sub_100005474((uint64_t)v7, &qword_10003F500);
}

double sub_100028238@<D0>(uint64_t a1@<X8>)
{
  return sub_100028274(a1);
}

uint64_t sub_10002824C(uint64_t *a1)
{
  return sub_10002830C(a1);
}

double sub_100028260@<D0>(uint64_t a1@<X8>)
{
  return sub_100028274(a1);
}

double sub_100028274@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_1000282F8(uint64_t *a1)
{
  return sub_10002830C(a1);
}

uint64_t sub_10002830C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100009060(v1, v2, v3);
  swift_retain();
  return static Published.subscript.setter();
}

uint64_t sub_10002839C@<X0>(void *a1@<X8>)
{
  return sub_1000283D8(a1);
}

uint64_t sub_1000283B0()
{
  return sub_100028468();
}

uint64_t sub_1000283C4@<X0>(void *a1@<X8>)
{
  return sub_1000283D8(a1);
}

uint64_t sub_1000283D8@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100028454()
{
  return sub_100028468();
}

uint64_t sub_100028468()
{
  return static Published.subscript.setter();
}

uint64_t sub_1000284E0@<X0>(void *a1@<X8>)
{
  return sub_1000283D8(a1);
}

uint64_t sub_100028508()
{
  return sub_100028468();
}

double sub_100028530@<D0>(uint64_t a1@<X8>)
{
  return sub_100028274(a1);
}

uint64_t sub_100028558(uint64_t *a1)
{
  return sub_10002830C(a1);
}

double sub_100028580@<D0>(uint64_t a1@<X8>)
{
  return sub_100028274(a1);
}

uint64_t sub_1000285A8(uint64_t *a1)
{
  return sub_10002830C(a1);
}

uint64_t sub_1000285D8(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = type metadata accessor for UUID();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v22[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22[3] = &type metadata for NavigationButton;
  v22[4] = sub_100028834();
  uint64_t v16 = (_OWORD *)swift_allocObject();
  v22[0] = v16;
  long long v17 = a1[1];
  v16[1] = *a1;
  v16[2] = v17;
  v16[3] = a1[2];
  *(_OWORD *)((char *)v16 + 57) = *(_OWORD *)((char *)a1 + 41);
  *(_OWORD *)(a6 + 72) = 0u;
  *(_OWORD *)(a6 + 88) = 0u;
  sub_10000DEB0((uint64_t)v22, a6 + 32);
  *(void *)(a6 + 72) = a2;
  *(void *)(a6 + 80) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(a6 + 88);
  *(void *)(a6 + 88) = a4;
  *(void *)(a6 + 96) = a5;
  swift_retain();
  sub_10000A2A4(v18);
  if (a3)
  {
    swift_release();
    sub_10000E930((uint64_t)v22);
  }
  else
  {
    UUID.init()();
    a2 = UUID.uuidString.getter();
    a3 = v19;
    swift_release();
    sub_10000E930((uint64_t)v22);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  *(void *)(a6 + 16) = a2;
  *(void *)(a6 + 24) = a3;
  return a6;
}

uint64_t sub_10002879C()
{
  return sub_100028080();
}

uint64_t sub_1000287C8@<X0>(void *a1@<X8>)
{
  return sub_1000283D8(a1);
}

uint64_t sub_1000287F0()
{
  return sub_100028468();
}

uint64_t sub_100028818()
{
  return sub_100026AE8();
}

unint64_t sub_100028834()
{
  unint64_t result = qword_10003FFE8;
  if (!qword_10003FFE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003FFE8);
  }
  return result;
}

uint64_t sub_100028888()
{
  sub_100006550(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 73, 7);
}

uint64_t sub_1000288D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002891C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100028954(uint64_t a1)
{
  return sub_10002506C(a1, v1);
}

uint64_t sub_10002895C(uint64_t *a1)
{
  return sub_100025390(a1);
}

uint64_t sub_100028964(uint64_t *a1)
{
  return sub_100025610(a1);
}

uint64_t sub_10002896C(uint64_t a1)
{
  return sub_100025908(a1);
}

uint64_t sub_100028974(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005324(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000289C4(unint64_t result)
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
      sub_100005214(&qword_100040048);
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
    sub_1000288D4(&qword_100040050, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v11 = -1 << v3[32];
    unint64_t v12 = result & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
    uint64_t v15 = 1 << v12;
    if (((1 << v12) & v14) != 0)
    {
      uint64_t v16 = ~v11;
      sub_1000288D4(&qword_100040058, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
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

uint64_t sub_100028C78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005214(&qword_100040000);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100028CE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StateSnapShot(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100028D44(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_100028E00()
{
  unint64_t v1 = v0;
  v77.receiver = v0;
  v77.super_class = (Class)type metadata accessor for CameraViewController();
  [super viewDidLoad];
  if (!qword_1000419E0)
  {
    __break(1u);
    goto LABEL_28;
  }
  int v2 = v0[OBJC_IVAR____TtC9CarCamera20CameraViewController_presentationMode];
  *(unsigned char *)(qword_1000419E0 + OBJC_IVAR____TtC9CarCamera17CameraAppDelegate_layoutConfig) = v2 & 1;
  id v3 = [v0 view];
  if (!v3)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v4 = v3;
  [v3 frame];

  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = objc_allocWithZone((Class)sub_100005214(&qword_100040090));
  uint64_t v6 = (void *)UIHostingController.init(rootView:)();
  id v7 = [v6 view];
  if (!v7)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v8 = v7;
  id v9 = [self blackColor];
  [v8 setBackgroundColor:v9];

  [v1 addChildViewController:v6];
  id v10 = [v6 view];
  if (!v10)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v11 = v10;
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v12 = [v1 view];
  if (!v12)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  unint64_t v13 = v12;
  id v14 = [v6 view];
  if (!v14)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v15 = v14;
  [v13 addSubview:v14];

  [v6 didMoveToParentViewController:v1];
  sub_100005214(&qword_100040098);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_10002FE70;
  id v17 = [v6 view];
  uint64_t v18 = v17;
  if (v2 == 2)
  {
    if (v17)
    {
      id v19 = [v17 topAnchor];

      id v20 = [v1 view];
      if (v20)
      {
        unint64_t v21 = v20;
        id v22 = [v20 safeAreaLayoutGuide];

        id v23 = [v22 topAnchor];
        id v24 = [v19 constraintEqualToAnchor:v23];

        *(void *)(v16 + 32) = v24;
        id v25 = [v6 view];
        if (v25)
        {
          char v26 = v25;
          id v27 = [v25 bottomAnchor];

          id v28 = [v1 view];
          if (v28)
          {
            uint64_t v29 = v28;
            id v30 = [v28 safeAreaLayoutGuide];

            id v31 = [v30 bottomAnchor];
            id v32 = [v27 constraintEqualToAnchor:v31];

            *(void *)(v16 + 40) = v32;
            id v33 = [v6 view];
            if (v33)
            {
              uint64_t v34 = v33;
              id v35 = [v33 leadingAnchor];

              id v36 = [v1 view];
              if (v36)
              {
                uint64_t v37 = v36;
                id v38 = [v36 safeAreaLayoutGuide];

                id v39 = [v38 leadingAnchor];
                id v40 = [v35 constraintEqualToAnchor:v39];

                *(void *)(v16 + 48) = v40;
                id v41 = [v6 view];
                if (v41)
                {
                  char v42 = v41;
                  id v43 = [v41 trailingAnchor];

                  id v44 = [v1 view];
                  if (v44)
                  {
                    uint64_t v45 = v44;
                    char v46 = self;
                    id v47 = [v45 safeAreaLayoutGuide];

                    id v48 = [v47 trailingAnchor];
                    id v49 = [v43 constraintEqualToAnchor:v48];

                    *(void *)(v16 + 56) = v49;
LABEL_26:
                    specialized Array._endMutation()();
                    sub_100029724();
                    Class isa = Array._bridgeToObjectiveC()().super.isa;
                    swift_bridgeObjectRelease();
                    [v46 activateConstraints:isa];

                    CAFSignpostEmit_Rendered();
                    return;
                  }
                  goto LABEL_40;
                }
LABEL_39:
                __break(1u);
LABEL_40:
                __break(1u);
                goto LABEL_41;
              }
LABEL_38:
              __break(1u);
              goto LABEL_39;
            }
LABEL_37:
            __break(1u);
            goto LABEL_38;
          }
LABEL_36:
          __break(1u);
          goto LABEL_37;
        }
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (!v17)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  id v50 = [v17 topAnchor];

  id v51 = [v1 view];
  if (!v51)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  uint64_t v52 = v51;
  id v53 = [v51 topAnchor];

  id v54 = [v50 constraintEqualToAnchor:v53];
  *(void *)(v16 + 32) = v54;
  id v55 = [v6 view];
  if (!v55)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  uint64_t v56 = v55;
  id v57 = [v55 bottomAnchor];

  id v58 = [v1 view];
  if (!v58)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  uint64_t v59 = v58;
  id v60 = [v58 bottomAnchor];

  id v61 = [v57 constraintEqualToAnchor:v60];
  *(void *)(v16 + 40) = v61;
  id v62 = [v6 view];
  if (!v62)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  uint64_t v63 = v62;
  id v64 = [v62 leadingAnchor];

  id v65 = [v1 view];
  if (!v65)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  uint64_t v66 = v65;
  id v67 = [v65 leadingAnchor];

  id v68 = [v64 constraintEqualToAnchor:v67];
  *(void *)(v16 + 48) = v68;
  id v69 = [v6 view];
  if (!v69)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  char v70 = v69;
  id v71 = [v69 trailingAnchor];

  id v72 = [v1 view];
  if (v72)
  {
    uint64_t v73 = v72;
    char v46 = self;
    id v74 = [v73 trailingAnchor];

    id v75 = [v71 constraintEqualToAnchor:v74];
    *(void *)(v16 + 56) = v75;
    goto LABEL_26;
  }
LABEL_48:
  __break(1u);
}

id sub_1000296C4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CameraViewController();
  [super dealloc];
}

uint64_t type metadata accessor for CameraViewController()
{
  return self;
}

unint64_t sub_100029724()
{
  unint64_t result = qword_1000400A0;
  if (!qword_1000400A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000400A0);
  }
  return result;
}

uint64_t sub_100029764()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

void sub_1000297D8()
{
  uint64_t v0 = sub_100005214(&qword_100040178);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005214(&qword_100040180);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [objc_allocWithZone((Class)CAFCarManager) init];
  sub_100014B70(0, &qword_100040188);
  sub_10002A8E8(&qword_100040190, &qword_100040188);
  id v9 = (void *)CAFObserved<>.observable.getter();

  id v10 = (objc_class *)type metadata accessor for CameraCAFManager();
  uint64_t v11 = (char *)objc_allocWithZone(v10);
  id v12 = &v11[OBJC_IVAR____TtC9CarCamera16CameraCAFManager__model];
  v20[1] = 0;
  unint64_t v13 = v11;
  sub_100005214(&qword_100040170);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v12, v7, v4);
  *(void *)&v13[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_currentSession] = 0;
  *(void *)&v13[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_requestContentManager] = 0;
  *(void *)&v13[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_cancellables] = &_swiftEmptySetSingleton;
  uint64_t v14 = OBJC_IVAR____TtC9CarCamera16CameraCAFManager_sessionStatus;
  *(void *)&v13[v14] = [objc_allocWithZone((Class)CARSessionStatus) initWithOptions:1];
  id v15 = [objc_allocWithZone((Class)CARSessionStatus) init];
  *(void *)&v13[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_carSessionStatus] = v15;
  *(void *)&v13[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_carManager] = v9;
  id v16 = v9;

  v21.receiver = v13;
  v21.super_class = v10;
  id v17 = [super init];
  uint64_t v18 = *(void **)&v17[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_carSessionStatus];
  id v19 = v17;
  [v18 addSessionObserver:v19];
  dispatch thunk of CAFCarManagerObservable.$currentCar.getter();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_100009490(&qword_100040198, &qword_100040178);
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();
  sub_100029E64();

  qword_100041A68 = (uint64_t)v19;
}

uint64_t sub_100029BA0(void **a1)
{
  uint64_t v1 = *a1;
  if (qword_10003EAB8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000062F4(v2, (uint64_t)qword_100041A08);
  id v3 = v1;
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    id v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    if (v1) {
      id v8 = v3;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v7 = v1;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "[CAMERA] currentCar %@", v6, 0xCu);
    sub_100005214(&qword_1000401B0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    if (v1)
    {
      sub_100014B70(0, &qword_1000401A0);
      sub_10002A8E8(&qword_1000401A8, &qword_1000401A0);
      id v10 = (void *)CAFObserved<>.observable.getter();
      id v11 = objc_allocWithZone((Class)type metadata accessor for CameraModel());
      sub_10000F390(v10);
    }
    swift_getKeyPath();
    swift_getKeyPath();
    return static Published.subscript.setter();
  }
  return result;
}

id sub_100029E64()
{
  uint64_t v1 = v0;
  id result = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                                 + OBJC_IVAR____TtC9CarCamera16CameraCAFManager_carSessionStatus), "currentSession"));
  if (result)
  {
    id v3 = result;
    if (qword_10003EAB8 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_1000062F4(v4, (uint64_t)qword_100041A08);
    os_log_type_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[CAMERA] Created Request Content Manager", v7, 2u);
      swift_slowDealloc();
    }

    type metadata accessor for CAFUIRequestContentManager();
    swift_allocObject();
    id v8 = v3;
    *(void *)(v1 + OBJC_IVAR____TtC9CarCamera16CameraCAFManager_requestContentManager) = CAFUIRequestContentManager.init(session:)();

    return (id)swift_release();
  }
  return result;
}

uint64_t sub_100029FD0(void *a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v15 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for DispatchQoS();
  uint64_t v5 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_100014B70(0, &qword_1000401B8);
  id v9 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  *(void *)(v10 + 24) = a1;
  aBlock[4] = sub_10002A96C;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10002A358;
  aBlock[3] = &unk_10003A2D8;
  id v11 = _Block_copy(aBlock);
  swift_retain();
  id v12 = a1;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_10002A98C();
  sub_100005214(&qword_1000401C8);
  sub_100009490((unint64_t *)&unk_1000401D0, &qword_1000401C8);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v15 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v14);
  return swift_release();
}

void sub_10002A2B8(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    uint64_t v5 = *(void **)(Strong + OBJC_IVAR____TtC9CarCamera16CameraCAFManager_currentSession);
    *(void *)(Strong + OBJC_IVAR____TtC9CarCamera16CameraCAFManager_currentSession) = a2;
    id v6 = a2;
  }
  swift_beginAccess();
  uint64_t v7 = swift_unknownObjectWeakLoadStrong();
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    sub_100029E64();
  }
}

uint64_t sub_10002A358(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_10002A404()
{
  swift_beginAccess();
  uint64_t Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = *(void **)&Strong[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_currentSession];
    *(void *)&Strong[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_currentSession] = 0;
  }
}

id sub_10002A4F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CameraCAFManager();
  return [super dealloc];
}

uint64_t sub_10002A600()
{
  return type metadata accessor for CameraCAFManager();
}

uint64_t type metadata accessor for CameraCAFManager()
{
  uint64_t result = qword_100040158;
  if (!qword_100040158) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10002A654()
{
  sub_10002A710();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10002A710()
{
  if (!qword_100040168)
  {
    sub_100005324(&qword_100040170);
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100040168);
    }
  }
}

uint64_t sub_10002A76C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CameraCAFManager();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10002A7AC@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10002A82C(void **a1, void **a2)
{
  objc_super v2 = *a1;
  uint64_t v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v2;
  id v5 = v3;
  return static Published.subscript.setter();
}

uint64_t sub_10002A8A0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002A8D8(void **a1)
{
  return sub_100029BA0(a1);
}

uint64_t sub_10002A8E8(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100014B70(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10002A92C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10002A96C()
{
  sub_10002A2B8(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_10002A974(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002A984()
{
  return swift_release();
}

unint64_t sub_10002A98C()
{
  unint64_t result = qword_1000401C0;
  if (!qword_1000401C0)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000401C0);
  }
  return result;
}

uint64_t sub_10002A9E4()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v11 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DispatchQoS();
  uint64_t v3 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_100014B70(0, &qword_1000401B8);
  uint64_t v7 = (void *)static OS_dispatch_queue.main.getter();
  aBlock[4] = sub_10002ACAC;
  aBlock[5] = v6;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10002A358;
  aBlock[3] = &unk_10003A300;
  uint64_t v8 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_10002A98C();
  sub_100005214(&qword_1000401C8);
  sub_100009490((unint64_t *)&unk_1000401D0, &qword_1000401C8);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v8);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v2, v0);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v10);
  return swift_release();
}

void sub_10002ACAC()
{
}

uint64_t sub_10002ACBC()
{
  swift_bridgeObjectRelease();
  sub_10000E930(v0 + 32);
  swift_bridgeObjectRelease();
  sub_10000A2A4(*(void *)(v0 + 88));

  return _swift_deallocClassInstance(v0, 104, 7);
}

uint64_t type metadata accessor for ButtonBarEntity()
{
  return self;
}

uint64_t sub_10002AD30@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24);
  *a1 = *(void *)(*(void *)v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

unint64_t sub_10002AD40()
{
  _StringGuts.grow(_:)(21);
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void **)(v0 + 24);
  swift_bridgeObjectRetain();
  v3._countAndFlagsBits = v2;
  v3._object = v1;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 62;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);
  return 0xD000000000000012;
}

unint64_t sub_10002ADE0()
{
  return sub_10002AD40();
}

uint64_t sub_10002AE04(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)a1 + 16) == *(void *)(*(void *)a2 + 16)
    && *(void *)(*(void *)a1 + 24) == *(void *)(*(void *)a2 + 24))
  {
    return 1;
  }
  else
  {
    return _stringCompareWithSmolCheck(_:_:expecting:)();
  }
}

void *sub_10002AE30()
{
  return &protocol witness table for String;
}

void sub_10002AE3C(Swift::String *a1)
{
  if (qword_10003EAC0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000062F4(v2, (uint64_t)qword_100041A20);
  swift_retain_n();
  Swift::String v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)id v5 = 136315138;
    uint64_t v8 = v6;
    swift_retain();
    _StringGuts.grow(_:)(21);
    swift_bridgeObjectRelease();
    String.append(_:)(a1[1]);
    v7._countAndFlagsBits = 62;
    v7._object = (void *)0xE100000000000000;
    String.append(_:)(v7);
    swift_release();
    sub_10000E6A0(0xD000000000000012, 0x800000010002DDD0, &v8);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "[ButtonBarEntity] NavigationButton action %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
}

uint64_t sub_10002B04C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 48);
}

uint64_t sub_10002B054()
{
  return swift_release();
}

uint64_t sub_10002B05C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v3 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v3;
  swift_retain();
  return a1;
}

uint64_t sub_10002B0B4(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v3 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 40) = v3;
  uint64_t v4 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 sub_10002B128(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t sub_10002B14C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  return a1;
}

uint64_t sub_10002B1A8(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_10002B1F0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
      *(void *)(result + 56) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for DynamicStack()
{
  return sub_10002C23C();
}

uint64_t sub_10002B258()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002B29C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for _ConditionalContent.Storage();
  __n128 v5 = __chkstk_darwin(v4);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(*(void *)(a2 - 8) + 16))((char *)&v8 - v6, a1, a2, v5);
  swift_storeEnumTagMultiPayload();
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_10002B394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for _ConditionalContent.Storage();
  __n128 v6 = __chkstk_darwin(v5);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(*(void *)(a3 - 8) + 16))((char *)&v9 - v7, a1, a3, v6);
  swift_storeEnumTagMultiPayload();
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_10002B48C(uint64_t TupleTypeMetadata, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t *)TupleTypeMetadata;
  uint64_t v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t v6 = *v5;
  }
  else
  {
    __chkstk_darwin(TupleTypeMetadata);
    uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      unint64_t v9 = 0;
      if (a2 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)(v8 - (char *)v5) < 0x20) {
        goto LABEL_9;
      }
      unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v10 = (long long *)(v5 + 2);
      uint64_t v11 = v8 + 16;
      unint64_t v12 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v13 = *v10;
        *(v11 - 1) = *(v10 - 1);
        _OWORD *v11 = v13;
        v10 += 2;
        v11 += 2;
        v12 -= 4;
      }
      while (v12);
      if (v9 != a2)
      {
LABEL_9:
        unint64_t v14 = a2 - v9;
        uint64_t v15 = v9;
        id v16 = &v8[8 * v9];
        id v17 = &v5[v15];
        do
        {
          uint64_t v18 = *v17++;
          *(void *)id v16 = v18;
          v16 += 8;
          --v14;
        }
        while (v14);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v6 = TupleTypeMetadata;
  }
  __chkstk_darwin(TupleTypeMetadata);
  id v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    objc_super v21 = (int *)(v6 + 32);
    unint64_t v22 = a2;
    do
    {
      if (a2 == 1) {
        int v23 = 0;
      }
      else {
        int v23 = *v21;
      }
      uint64_t v25 = *v5++;
      uint64_t v24 = v25;
      uint64_t v26 = *v4++;
      (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 16))(&v20[v23], v26);
      v21 += 4;
      --v22;
    }
    while (v22);
  }
  return TupleView.init(_:)();
}

uint64_t sub_10002B650@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3 = v2;
  id v32 = a2;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  type metadata accessor for HStack();
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  swift_getWitnessTable();
  v27[1] = type metadata accessor for VStack();
  _OWORD v27[2] = type metadata accessor for VStack();
  type metadata accessor for _ConditionalContent();
  uint64_t v6 = type metadata accessor for Group();
  uint64_t v30 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v27 - v7;
  uint64_t v9 = type metadata accessor for ModifiedContent();
  uint64_t v31 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)v27 - v10;
  uint64_t v12 = type metadata accessor for ModifiedContent();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v28 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v29 = (char *)v27 - v16;
  uint64_t v33 = v4;
  uint64_t v34 = v5;
  uint64_t v35 = v3;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v18 = swift_getWitnessTable();
  uint64_t v41 = WitnessTable;
  uint64_t v42 = v18;
  uint64_t v19 = swift_getWitnessTable();
  Group<A>.init(content:)();
  static Edge.Set.horizontal.getter();
  uint64_t v40 = v19;
  uint64_t v20 = swift_getWitnessTable();
  View.padding(_:_:)();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v6);
  static Edge.Set.vertical.getter();
  uint64_t v38 = v20;
  id v39 = &protocol witness table for _PaddingLayout;
  uint64_t v21 = swift_getWitnessTable();
  unint64_t v22 = v28;
  View.padding(_:_:)();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v9);
  uint64_t v36 = v21;
  uint64_t v37 = &protocol witness table for _PaddingLayout;
  swift_getWitnessTable();
  int v23 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  uint64_t v24 = v29;
  v23(v29, v22, v12);
  uint64_t v25 = *(void (**)(char *, uint64_t))(v13 + 8);
  v25(v22, v12);
  v23(v32, v24, v12);
  return ((uint64_t (*)(char *, uint64_t))v25)(v24, v12);
}

uint64_t sub_10002BACC@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v41 = a4;
  uint64_t v7 = type metadata accessor for VStack();
  uint64_t v37 = *(uint64_t **)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v36 = (char *)&v34 - v11;
  type metadata accessor for HStack();
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v12 = type metadata accessor for VStack();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v34 - v17;
  uint64_t v19 = type metadata accessor for _ConditionalContent();
  uint64_t v39 = *(void *)(v19 - 8);
  uint64_t v40 = v19;
  __chkstk_darwin(v19);
  uint64_t v38 = (char *)&v34 - v21;
  if (*a1)
  {
    VStack.init(alignment:spacing:content:)();
    uint64_t WitnessTable = swift_getWitnessTable();
    unint64_t v22 = v36;
    int v23 = v37;
    uint64_t v24 = (void (*)(char *, char *, uint64_t))v37[2];
    v24(v36, v9, v7);
    uint64_t v25 = (void (*)(char *, uint64_t))v23[1];
    v25(v9, v7);
    v24(v9, v22, v7);
    swift_getWitnessTable();
    uint64_t v26 = v38;
    sub_10002B394((uint64_t)v9, v12, v7);
    v25(v9, v7);
    v25(v22, v7);
  }
  else
  {
    uint64_t v37 = &v34;
    __chkstk_darwin(v20);
    *(&v34 - 4) = a2;
    *(&v34 - 3) = a3;
    *(&v34 - 2) = (uint64_t)a1;
    static HorizontalAlignment.center.getter();
    VStack.init(alignment:spacing:content:)();
    swift_getWitnessTable();
    id v27 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    v27(v18, v15, v12);
    uint64_t v28 = *(void (**)(char *, uint64_t))(v13 + 8);
    v28(v15, v12);
    v27(v15, v18, v12);
    swift_getWitnessTable();
    uint64_t v26 = v38;
    sub_10002B29C((uint64_t)v15, v12);
    v28(v15, v12);
    v28(v18, v12);
  }
  uint64_t v29 = swift_getWitnessTable();
  uint64_t v30 = swift_getWitnessTable();
  uint64_t v42 = v29;
  uint64_t v43 = v30;
  uint64_t v31 = v40;
  swift_getWitnessTable();
  uint64_t v32 = v39;
  (*(void (**)(uint64_t, char *, uint64_t))(v39 + 16))(v41, v26, v31);
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v26, v31);
}

uint64_t sub_10002BFF4()
{
  uint64_t v0 = type metadata accessor for HStack();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v11 - v5;
  HStack.init(alignment:spacing:content:)();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v8 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
  v8(v6, v3, v0);
  uint64_t v9 = *(void (**)(char *, uint64_t))(v1 + 8);
  v9(v3, v0);
  uint64_t v13 = 0;
  char v14 = 1;
  v15[0] = &v13;
  v8(v3, v6, v0);
  v15[1] = v3;
  v12[0] = &type metadata for Spacer;
  v12[1] = v0;
  v11[0] = &protocol witness table for Spacer;
  v11[1] = WitnessTable;
  sub_10002B48C((uint64_t)v15, 2uLL, (uint64_t)v12);
  v9(v6, v0);
  return ((uint64_t (*)(char *, uint64_t))v9)(v3, v0);
}

uint64_t sub_10002C1E0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_10002B650(a1, a2);
}

uint64_t sub_10002C224@<X0>(uint64_t a1@<X8>)
{
  return sub_10002BACC(*(unsigned char **)(v1 + 32), *(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_10002C230()
{
  return sub_10002BFF4();
}

uint64_t sub_10002C23C()
{
  return swift_getGenericMetadata();
}

uint64_t sub_10002C26C()
{
  return swift_getWitnessTable();
}

uint64_t sub_10002C43C()
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

uint64_t dispatch thunk of CAFCarObservable.automakerExteriorCamera.getter()
{
  return dispatch thunk of CAFCarObservable.automakerExteriorCamera.getter();
}

uint64_t CAFCarObservable.observed.getter()
{
  return CAFCarObservable.observed.getter();
}

uint64_t type metadata accessor for CAFCarObservable()
{
  return type metadata accessor for CAFCarObservable();
}

uint64_t dispatch thunk of CAFCarManagerObservable.currentCar.getter()
{
  return dispatch thunk of CAFCarManagerObservable.currentCar.getter();
}

uint64_t dispatch thunk of CAFCarManagerObservable.$currentCar.getter()
{
  return dispatch thunk of CAFCarManagerObservable.$currentCar.getter();
}

uint64_t dispatch thunk of CAFCameraButtonObservable.identifier.getter()
{
  return dispatch thunk of CAFCameraButtonObservable.identifier.getter();
}

uint64_t dispatch thunk of CAFCameraButtonObservable.symbolName.getter()
{
  return dispatch thunk of CAFCameraButtonObservable.symbolName.getter();
}

uint64_t dispatch thunk of CAFCameraButtonObservable.buttonAction.getter()
{
  return dispatch thunk of CAFCameraButtonObservable.buttonAction.getter();
}

uint64_t dispatch thunk of CAFCameraButtonObservable.buttonAction.setter()
{
  return dispatch thunk of CAFCameraButtonObservable.buttonAction.setter();
}

uint64_t dispatch thunk of CAFCameraButtonObservable.contentURLAction.getter()
{
  return dispatch thunk of CAFCameraButtonObservable.contentURLAction.getter();
}

uint64_t dispatch thunk of CAFCameraButtonObservable.selectedEntryIndex.getter()
{
  return dispatch thunk of CAFCameraButtonObservable.selectedEntryIndex.getter();
}

uint64_t dispatch thunk of CAFCameraButtonObservable.selectedEntryIndex.setter()
{
  return dispatch thunk of CAFCameraButtonObservable.selectedEntryIndex.setter();
}

uint64_t dispatch thunk of CAFCameraButtonObservable.disabled.getter()
{
  return dispatch thunk of CAFCameraButtonObservable.disabled.getter();
}

uint64_t CAFCameraButtonObservable.observed.getter()
{
  return CAFCameraButtonObservable.observed.getter();
}

uint64_t dispatch thunk of CAFCameraButtonObservable.sortOrder.getter()
{
  return dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();
}

uint64_t type metadata accessor for CAFCameraButtonObservable()
{
  return type metadata accessor for CAFCameraButtonObservable();
}

uint64_t dispatch thunk of CAFCameraGeneralObservable.on.getter()
{
  return dispatch thunk of CAFCameraGeneralObservable.on.getter();
}

uint64_t dispatch thunk of CAFCameraGeneralObservable.on.setter()
{
  return dispatch thunk of CAFCameraGeneralObservable.on.setter();
}

uint64_t type metadata accessor for CAFCameraGeneralObservable()
{
  return type metadata accessor for CAFCameraGeneralObservable();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
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

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t Logger.init(_:)()
{
  return Logger.init(_:)();
}

uint64_t CAFUIRequestContentManager.init(session:)()
{
  return CAFUIRequestContentManager.init(session:)();
}

uint64_t type metadata accessor for CAFUIRequestContentManager()
{
  return type metadata accessor for CAFUIRequestContentManager();
}

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

uint64_t type metadata accessor for AnyCancellable()
{
  return type metadata accessor for AnyCancellable();
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

uint64_t Published.projectedValue.getter()
{
  return Published.projectedValue.getter();
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

uint64_t Animatable<>.animatableData.modify()
{
  return Animatable<>.animatableData.modify();
}

uint64_t static Animatable<>._makeAnimatable(value:inputs:)()
{
  return static Animatable<>._makeAnimatable(value:inputs:)();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t TapGesture.init(count:)()
{
  return TapGesture.init(count:)();
}

uint64_t type metadata accessor for TapGesture()
{
  return type metadata accessor for TapGesture();
}

uint64_t static ColorScheme.== infix(_:_:)()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t type metadata accessor for ColorScheme()
{
  return type metadata accessor for ColorScheme();
}

uint64_t type metadata accessor for Environment.Content()
{
  return type metadata accessor for Environment.Content();
}

uint64_t static GestureMask.all.getter()
{
  return static GestureMask.all.getter();
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

uint64_t static AnyTransition.asymmetric(insertion:removal:)()
{
  return static AnyTransition.asymmetric(insertion:removal:)();
}

uint64_t static AnyTransition.scale.getter()
{
  return static AnyTransition.scale.getter();
}

uint64_t static AnyTransition.opacity.getter()
{
  return static AnyTransition.opacity.getter();
}

uint64_t AnyTransition.combined(with:)()
{
  return AnyTransition.combined(with:)();
}

uint64_t AnyTransition.animation(_:)()
{
  return AnyTransition.animation(_:)();
}

uint64_t static PreferenceKey._isReadableByHost.getter()
{
  return static PreferenceKey._isReadableByHost.getter();
}

uint64_t static PreferenceKey._includesRemovedValues.getter()
{
  return static PreferenceKey._includesRemovedValues.getter();
}

uint64_t withAnimation<A>(_:_:)()
{
  return withAnimation<A>(_:_:)();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t type metadata accessor for LayoutDirection()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t static SafeAreaRegions.all.getter()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t RoundedRectangle.path(in:)()
{
  return RoundedRectangle.path(in:)();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t EnvironmentObject.error()()
{
  return EnvironmentObject.error()();
}

uint64_t EnvironmentObject.init()()
{
  return EnvironmentObject.init()();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t EnvironmentValues.colorScheme.setter()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.layoutDirection.getter()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t EnvironmentValues.layoutDirection.setter()
{
  return EnvironmentValues.layoutDirection.setter();
}

uint64_t EnvironmentValues.isEnabled.getter()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t EnvironmentValues.isEnabled.setter()
{
  return EnvironmentValues.isEnabled.setter();
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

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t type metadata accessor for _ConditionalContent.Storage()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t type metadata accessor for _ConditionalContent()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t type metadata accessor for ButtonStyleConfiguration.Label()
{
  return type metadata accessor for ButtonStyleConfiguration.Label();
}

uint64_t ButtonStyleConfiguration.label.getter()
{
  return ButtonStyleConfiguration.label.getter();
}

uint64_t ButtonStyleConfiguration.isPressed.getter()
{
  return ButtonStyleConfiguration.isPressed.getter();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Edge.Set.horizontal.getter()
{
  return static Edge.Set.horizontal.getter();
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

uint64_t static Edge.Set.vertical.getter()
{
  return static Edge.Set.vertical.getter();
}

uint64_t static Font.Weight.heavy.getter()
{
  return static Font.Weight.heavy.getter();
}

uint64_t static Font.Weight.regular.getter()
{
  return static Font.Weight.regular.getter();
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

uint64_t View.fontWeight(_:)()
{
  return View.fontWeight(_:)();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.allowsHitTesting(_:)()
{
  return View.allowsHitTesting(_:)();
}

uint64_t View.simultaneousGesture<A>(_:including:)()
{
  return View.simultaneousGesture<A>(_:including:)();
}

uint64_t View.padding(_:_:)()
{
  return View.padding(_:_:)();
}

uint64_t type metadata accessor for Color.RGBColorSpace()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t static Color.blue.getter()
{
  return static Color.blue.getter();
}

uint64_t static Color.gray.getter()
{
  return static Color.gray.getter();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t Color.opacity(_:)()
{
  return Color.opacity(_:)();
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

uint64_t Color.init(_:)()
{
  return Color.init(_:)();
}

uint64_t Group<A>.init(content:)()
{
  return Group<A>.init(content:)();
}

uint64_t type metadata accessor for Group()
{
  return type metadata accessor for Group();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t Image.init(automakerSymbolName:)()
{
  return Image.init(automakerSymbolName:)();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t Shape.layoutDirectionBehavior.getter()
{
  return Shape.layoutDirectionBehavior.getter();
}

uint64_t static Shape.role.getter()
{
  return static Shape.role.getter();
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

uint64_t Circle.path(in:)()
{
  return Circle.path(in:)();
}

uint64_t HStack.init(alignment:spacing:content:)()
{
  return HStack.init(alignment:spacing:content:)();
}

uint64_t type metadata accessor for HStack()
{
  return type metadata accessor for HStack();
}

uint64_t VStack.init(alignment:spacing:content:)()
{
  return VStack.init(alignment:spacing:content:)();
}

uint64_t type metadata accessor for VStack()
{
  return type metadata accessor for VStack();
}

uint64_t AnyView.init<A>(_:)()
{
  return AnyView.init<A>(_:)();
}

uint64_t ForEach<>.init(_:id:content:)()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t Gesture.onEnded(_:)()
{
  return Gesture.onEnded(_:)();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t Animation.repeatForever(autoreverses:)()
{
  return Animation.repeatForever(autoreverses:)();
}

uint64_t Animation.delay(_:)()
{
  return Animation.delay(_:)();
}

uint64_t static Animation.linear(duration:)()
{
  return static Animation.linear(duration:)();
}

uint64_t static Animation.spring(response:dampingFraction:blendDuration:)()
{
  return static Animation.spring(response:dampingFraction:blendDuration:)();
}

uint64_t static Animation.default.getter()
{
  return static Animation.default.getter();
}

uint64_t type metadata accessor for TupleView()
{
  return type metadata accessor for TupleView();
}

uint64_t TupleView.init(_:)()
{
  return TupleView.init(_:)();
}

uint64_t static UnitPoint.center.getter()
{
  return static UnitPoint.center.getter();
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

uint64_t Array.description.getter()
{
  return Array.description.getter();
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

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
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

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return __CocoaSet.endIndex.getter();
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

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
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

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
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

uint64_t CAFSignpostEmit_InstantOn()
{
  return _CAFSignpostEmit_InstantOn();
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

void bzero(void *a1, size_t a2)
{
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

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
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

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
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