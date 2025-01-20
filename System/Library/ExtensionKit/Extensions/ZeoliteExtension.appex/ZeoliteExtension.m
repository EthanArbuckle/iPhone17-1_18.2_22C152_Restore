uint64_t sub_100003B98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  long long v24;
  void v25[4];

  v4 = sub_100003F3C(&qword_1000440F0);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100038220();
  v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100038140();
  sub_100003F80();
  sub_100038150();
  sub_1000044F0(&v24, (uint64_t)v25);
  v11 = *(void *)(a1 + 16);
  if (v11)
  {
    v12 = *(void *)(sub_100037DF0() - 8);
    v13 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    v14 = *(void *)(v12 + 72);
    v22 = a2;
    v23 = v14;
    v21 = a1;
    swift_bridgeObjectRetain();
    v15 = v7;
    v20 = v11;
    v16 = v11;
    do
    {
      sub_100038210();
      sub_100037DD0();
      sub_1000381A0();
      sub_100037C10();
      v17 = sub_100037C20();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v6, 0, 1, v17);
      sub_1000381D0();
      swift_bridgeObjectRetain();
      sub_1000381E0();
      sub_100037DE0();
      sub_100038200();
      sub_100037DB0();
      sub_1000381C0();
      sub_100037DA0();
      sub_100038180();
      sub_100004508(v25, v25[3]);
      sub_100038230();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v15);
      v13 += v23;
      --v16;
    }
    while (v16);
    swift_bridgeObjectRelease();
    v11 = v20;
  }
  sub_100003FD8((uint64_t)v25);
  return v11;
}

uint64_t sub_100003F3C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003F80()
{
  unint64_t result = qword_1000440F8;
  if (!qword_1000440F8)
  {
    sub_100038140();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000440F8);
  }
  return result;
}

uint64_t sub_100003FD8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100004028(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = sub_100003F3C(&qword_1000440F0);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  v11 = &v18[-v10];
  sub_10000454C();
  sub_10000458C(a1, (uint64_t)v11);
  sub_10000458C(a2, (uint64_t)v9);
  id v12 = sub_100030B50((uint64_t)v11, (uint64_t)v9, 0, 0, a3);
  sub_100038140();
  sub_100003F80();
  id v13 = v12;
  sub_100038160();

  sub_1000044F0(&v19, (uint64_t)v20);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = &_swiftEmptyArrayStorage;
  v15 = (uint64_t *)(v14 + 16);
  sub_100004508(v20, v20[3]);
  swift_retain();
  sub_1000382A0();
  swift_release();
  swift_release();

  swift_beginAccess();
  uint64_t v16 = *v15;
  swift_bridgeObjectRetain();
  swift_release();
  sub_100003FD8((uint64_t)v20);
  return v16;
}

uint64_t sub_10000431C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100038220();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (unint64_t *)(a2 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  swift_beginAccess();
  unint64_t v9 = *(void *)(a2 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a2 + 16) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v9 = sub_10001B330(0, *(void *)(v9 + 16) + 1, 1, v9);
    *uint64_t v8 = v9;
  }
  unint64_t v12 = *(void *)(v9 + 16);
  unint64_t v11 = *(void *)(v9 + 24);
  if (v12 >= v11 >> 1)
  {
    unint64_t v9 = sub_10001B330(v11 > 1, v12 + 1, 1, v9);
    *uint64_t v8 = v9;
  }
  *(void *)(v9 + 16) = v12 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v12, v7, v4);
  return swift_endAccess();
}

uint64_t sub_1000044B8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000044F0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_100004508(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000454C()
{
  unint64_t result = qword_100044100;
  if (!qword_100044100)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100044100);
  }
  return result;
}

uint64_t sub_10000458C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003F3C(&qword_1000440F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000045F4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000462C(uint64_t a1)
{
  return sub_10000431C(a1, v1);
}

uint64_t sub_100004634()
{
  if (qword_1000440D8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100038260();

  return sub_1000044B8(v0, (uint64_t)qword_100044AF0);
}

uint64_t sub_100004698()
{
  uint64_t v0 = sub_100038260();
  sub_100020AF0(v0, qword_100044AF0);
  sub_1000044B8(v0, (uint64_t)qword_100044AF0);
  return sub_100038250();
}

unint64_t ZeoliteExtensionError.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7075727265746E69;
      break;
    case 2:
    case 3:
      unint64_t result = 0x6F4E656369766564;
      break;
    case 4:
      return result;
    case 5:
    case 9:
    case 13:
    case 16:
      unint64_t result = 0xD000000000000013;
      break;
    case 6:
      unint64_t result = 0xD000000000000016;
      break;
    case 7:
      unint64_t result = 0xD000000000000012;
      break;
    case 8:
    case 10:
    case 12:
      unint64_t result = 0x6F5464656C696166;
      break;
    case 11:
      unint64_t result = 0xD000000000000016;
      break;
    case 14:
      unint64_t result = 0xD000000000000011;
      break;
    case 15:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      unint64_t result = 0x656C6C65636E6163;
      break;
  }
  return result;
}

uint64_t sub_1000048F8(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = ZeoliteExtensionError.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == ZeoliteExtensionError.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100038700();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_100004984(char a1, char a2)
{
  if (qword_10003B1D8[a1] == qword_10003B1D8[a2]) {
    char v2 = 1;
  }
  else {
    char v2 = sub_100038700();
  }
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

uint64_t sub_1000049EC(char a1, char a2)
{
  if (*(void *)&aContexticonfig[8 * a1] == *(void *)&aContexticonfig[8 * a2]
    && *(void *)&aD[8 * a1] == *(void *)&aD[8 * a2])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_100038700();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_100004A74(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x726170736E617274;
  }
  else {
    uint64_t v3 = 0x6C69616D65;
  }
  if (v2) {
    unint64_t v4 = 0xE500000000000000;
  }
  else {
    unint64_t v4 = 0xEC00000079636E65;
  }
  if (a2) {
    uint64_t v5 = 0x726170736E617274;
  }
  else {
    uint64_t v5 = 0x6C69616D65;
  }
  if (a2) {
    unint64_t v6 = 0xEC00000079636E65;
  }
  else {
    unint64_t v6 = 0xE500000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_100038700();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_100004B1C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x656D6F6962;
  }
  else {
    uint64_t v3 = 0x79726F6D654D6E69;
  }
  if (v2) {
    unint64_t v4 = 0xE800000000000000;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x656D6F6962;
  }
  else {
    uint64_t v5 = 0x79726F6D654D6E69;
  }
  if (a2) {
    unint64_t v6 = 0xE500000000000000;
  }
  else {
    unint64_t v6 = 0xE800000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_100038700();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_100004BBC(char a1, char a2)
{
  if (*(void *)&aStart_1[8 * a1] == *(void *)&aStart_1[8 * a2]
    && *(void *)&aFinished_1[8 * a1 + 8] == *(void *)&aFinished_1[8 * a2 + 8])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_100038700();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_100004C44(char a1, char a2)
{
  if (*(void *)&aExtract_1[8 * a1] == *(void *)&aExtract_1[8 * a2]
    && *(void *)&aAnalysisinfere[8 * a1 + 16] == *(void *)&aAnalysisinfere[8 * a2 + 16])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_100038700();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Int sub_100004CCC()
{
  char v1 = *v0;
  sub_100038780();
  ZeoliteExtensionError.rawValue.getter(v1);
  sub_100038330();
  swift_bridgeObjectRelease();
  return sub_1000387A0();
}

Swift::Int sub_100004D30()
{
  return sub_1000387A0();
}

Swift::Int sub_100004D9C()
{
  return sub_1000387A0();
}

Swift::Int sub_100004E08()
{
  return sub_1000387A0();
}

Swift::Int sub_100004E88()
{
  return sub_1000387A0();
}

Swift::Int sub_100004EF4()
{
  return sub_1000387A0();
}

uint64_t sub_100004F7C()
{
  ZeoliteExtensionError.rawValue.getter(*v0);
  sub_100038330();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100004FD0()
{
  sub_100038330();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100005010()
{
  sub_100038330();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100005064()
{
  sub_100038330();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000050D4()
{
  sub_100038330();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000513C()
{
  sub_100038330();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100005190()
{
  sub_100038330();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000051E4()
{
  char v1 = *v0;
  sub_100038780();
  ZeoliteExtensionError.rawValue.getter(v1);
  sub_100038330();
  swift_bridgeObjectRelease();
  return sub_1000387A0();
}

Swift::Int sub_100005244()
{
  return sub_1000387A0();
}

Swift::Int sub_1000052AC()
{
  return sub_1000387A0();
}

Swift::Int sub_100005314()
{
  return sub_1000387A0();
}

Swift::Int sub_100005390()
{
  return sub_1000387A0();
}

Swift::Int sub_100005414()
{
  return sub_1000387A0();
}

Swift::Int sub_10000547C()
{
  return sub_1000387A0();
}

uint64_t sub_1000054D8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s16ZeoliteExtension0aB5ErrorO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_100005508@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ZeoliteExtensionError.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

_UNKNOWN **static ZeoliteExtensionStates.allCases.getter()
{
  return &off_1000411A8;
}

uint64_t ZeoliteExtensionStates.rawValue.getter(char a1)
{
  return *(void *)&aStart_1[8 * a1];
}

uint64_t sub_100005574(char *a1, char *a2)
{
  return sub_100004BBC(*a1, *a2);
}

Swift::Int sub_100005580()
{
  return sub_100004D30();
}

uint64_t sub_100005588()
{
  return sub_10000513C();
}

Swift::Int sub_100005590()
{
  return sub_1000052AC();
}

uint64_t sub_100005598@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s16ZeoliteExtension0aB6StatesO8rawValueACSgSS_tcfC_0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_1000055C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ZeoliteExtensionStates.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_1000055F4(void *a1@<X8>)
{
  *a1 = &off_1000411D0;
}

uint64_t sub_100005604(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  v2[5] = type metadata accessor for ZeoliteExtensionConfig(0);
  v2[6] = swift_task_alloc();
  uint64_t v3 = sub_100038260();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  sub_100003F3C(&qword_100044270);
  v2[11] = swift_task_alloc();
  uint64_t v4 = sub_100003F3C(&qword_100044158);
  v2[12] = v4;
  v2[13] = *(void *)(v4 - 8);
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  return _swift_task_switch(sub_1000057A4, 0, 0);
}

uint64_t sub_1000057A4()
{
  id v1 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v2 = sub_100038300();
  id v3 = [v1 initWithSuiteName:v2];
  v0[16] = v3;

  if (v3)
  {
    uint64_t v4 = (void *)swift_task_alloc();
    v0[17] = v4;
    uint64_t v5 = type metadata accessor for ZeoliteExtension();
    uint64_t v6 = sub_100020584(&qword_100044220, (void (*)(uint64_t))type metadata accessor for ZeoliteExtension);
    uint64_t v7 = sub_100020584(&qword_1000441D0, (void (*)(uint64_t))type metadata accessor for ZeoliteExtensionConfig);
    uint64_t v8 = sub_100020584((unint64_t *)&unk_1000441D8, (void (*)(uint64_t))type metadata accessor for ZeoliteExtensionConfig);
    *uint64_t v4 = v0;
    v4[1] = sub_1000059F4;
    uint64_t v9 = v0[11];
    uint64_t v10 = v0[5];
    uint64_t v11 = v0[3];
    return MLHostExtension.loadConfig<A>(context:)(v9, v11, v5, v10, v6, v7, v8);
  }
  else
  {
    id v12 = objc_allocWithZone((Class)sub_100038060());
    uint64_t v13 = sub_100038050();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
    return v14(v13);
  }
}

uint64_t sub_1000059F4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100005AF0, 0, 0);
}

id sub_100005AF0()
{
  uint64_t v65 = v0;
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 88);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) != 1)
  {
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(*(void *)(v0 + 120), v3, v1);
    if (qword_1000440D8 != -1) {
      swift_once();
    }
    uint64_t v8 = *(void *)(v0 + 112);
    uint64_t v7 = *(void *)(v0 + 120);
    uint64_t v10 = *(void *)(v0 + 96);
    uint64_t v9 = *(void *)(v0 + 104);
    uint64_t v11 = sub_1000044B8(*(void *)(v0 + 56), (uint64_t)qword_100044AF0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v7, v10);
    id v12 = sub_100038240();
    os_log_type_t v13 = sub_100038460();
    BOOL v14 = os_log_type_enabled(v12, v13);
    uint64_t v15 = *(void *)(v0 + 104);
    uint64_t v16 = *(void *)(v0 + 112);
    uint64_t v17 = *(void *)(v0 + 96);
    if (v14)
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v62[0] = swift_slowAlloc();
      *(_DWORD *)v18 = 136315138;
      sub_100020698(&qword_1000442C0, &qword_100044158);
      uint64_t v19 = sub_1000386E0();
      *(void *)(v0 + 16) = sub_10001B980(v19, v20, v62);
      sub_1000384B0();
      swift_bridgeObjectRelease();
      v60 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
      v60(v16, v17);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Configuration: %s", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v60 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
      v60(v16, v17);
    }

    v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 64) + 16);
    v21(*(void *)(v0 + 80), v11, *(void *)(v0 + 56));
    v22 = sub_100038240();
    os_log_type_t v23 = sub_100038460();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = v11;
      v25 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v25 = 67109120;
      id result = [self sharedConnection];
      if (!result)
      {
        __break(1u);
        goto LABEL_30;
      }
      v27 = result;
      unsigned int v28 = [result effectiveBoolValueForSetting:MCFeatureDiagnosticsSubmissionAllowed];

      *(_DWORD *)(v0 + 148) = v28 == 1;
      sub_1000384B0();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "D&U enabled: %{BOOL}d", v25, 8u);
      swift_slowDealloc();
      uint64_t v11 = v24;
    }
    v29 = *(void **)(v0 + 128);
    uint64_t v31 = *(void *)(v0 + 72);
    uint64_t v30 = *(void *)(v0 + 80);
    uint64_t v32 = *(void *)(v0 + 56);
    uint64_t v33 = *(void *)(v0 + 64);

    v61 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    v61(v30, v32);
    v21(v31, v11, v32);
    id v34 = v29;
    v35 = sub_100038240();
    os_log_type_t v36 = sub_100038470();
    BOOL v37 = os_log_type_enabled(v35, v36);
    v38 = *(void **)(v0 + 128);
    if (v37)
    {
      v39 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v39 = 67109120;
      NSString v40 = sub_100038300();
      unsigned int v41 = [v38 BOOLForKey:v40];

      *(_DWORD *)(v0 + 144) = v41;
      sub_1000384B0();

      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Opt-In enabled: %{BOOL}d", v39, 8u);
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v42 = *(void *)(v0 + 48);
    v61(*(void *)(v0 + 72), *(void *)(v0 + 56));
    sub_1000380A0();
    char v43 = sub_10001D058(v42);
    sub_1000207F4(v42, type metadata accessor for ZeoliteExtensionConfig);
    if ((v43 & 1) == 0)
    {
      v51 = sub_100038240();
      os_log_type_t v52 = sub_100038460();
      if (os_log_type_enabled(v51, v52))
      {
        v53 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v53 = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, v52, "Skip the execution based on the retrieved state.", v53, 2u);
        swift_slowDealloc();
      }
      uint64_t v46 = *(void *)(v0 + 120);
      v47 = *(void **)(v0 + 128);
      uint64_t v48 = *(void *)(v0 + 96);

      v63 = &type metadata for ZeoliteExtensionError;
      unint64_t v64 = sub_10001E124();
      char v54 = 4;
      goto LABEL_24;
    }
    id result = [self sharedConnection];
    if (result)
    {
      v44 = result;
      unsigned int v45 = [result effectiveBoolValueForSetting:MCFeatureDiagnosticsSubmissionAllowed];

      if (v45 == 1)
      {
        uint64_t v46 = *(void *)(v0 + 120);
        v47 = *(void **)(v0 + 128);
        uint64_t v48 = *(void *)(v0 + 96);
        id v49 = objc_allocWithZone((Class)sub_100038060());
        uint64_t v50 = sub_100038050();
LABEL_25:
        uint64_t v6 = v50;

        v60(v46, v48);
        goto LABEL_26;
      }
      v55 = sub_100038240();
      os_log_type_t v56 = sub_100038460();
      if (os_log_type_enabled(v55, v56))
      {
        v57 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v57 = 0;
        _os_log_impl((void *)&_mh_execute_header, v55, v56, "Device is not DNU enabled. Skipping execution.", v57, 2u);
        swift_slowDealloc();
      }
      uint64_t v46 = *(void *)(v0 + 120);
      v47 = *(void **)(v0 + 128);
      uint64_t v48 = *(void *)(v0 + 96);

      v63 = &type metadata for ZeoliteExtensionError;
      unint64_t v64 = sub_10001E124();
      char v54 = 2;
LABEL_24:
      LOBYTE(v62[0]) = v54;
      id v58 = objc_allocWithZone((Class)sub_100038060());
      uint64_t v50 = sub_100038040();
      goto LABEL_25;
    }
LABEL_30:
    __break(1u);
    return result;
  }
  uint64_t v4 = *(void **)(v0 + 128);
  sub_100020974(v3, &qword_100044270);
  v63 = &type metadata for ZeoliteExtensionError;
  unint64_t v64 = sub_10001E124();
  LOBYTE(v62[0]) = 5;
  id v5 = objc_allocWithZone((Class)sub_100038060());
  uint64_t v6 = sub_100038040();

LABEL_26:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v59 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return (id)v59(v6);
}

uint64_t sub_1000062B4(uint64_t a1)
{
  v2[179] = v1;
  v2[178] = a1;
  uint64_t v3 = type metadata accessor for ExecutionState(0);
  v2[180] = v3;
  v2[181] = *(void *)(v3 - 8);
  v2[182] = swift_task_alloc();
  uint64_t v4 = sub_100037DF0();
  v2[183] = v4;
  v2[184] = *(void *)(v4 - 8);
  v2[185] = swift_task_alloc();
  uint64_t v5 = sub_100038220();
  v2[186] = v5;
  v2[187] = *(void *)(v5 - 8);
  v2[188] = swift_task_alloc();
  v2[189] = swift_task_alloc();
  uint64_t v6 = sub_100037C20();
  v2[190] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[191] = v7;
  v2[192] = *(void *)(v7 + 64);
  v2[193] = swift_task_alloc();
  v2[194] = swift_task_alloc();
  uint64_t v8 = sub_100037E30();
  v2[195] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[196] = v9;
  v2[197] = *(void *)(v9 + 64);
  v2[198] = swift_task_alloc();
  v2[199] = swift_task_alloc();
  sub_100003F3C(&qword_1000440F0);
  v2[200] = swift_task_alloc();
  v2[201] = swift_task_alloc();
  v2[202] = swift_task_alloc();
  v2[203] = swift_task_alloc();
  v2[204] = swift_task_alloc();
  v2[205] = swift_task_alloc();
  v2[206] = swift_task_alloc();
  sub_100003F3C(&qword_100044258);
  v2[207] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for EmbedParameters(0);
  v2[208] = v10;
  v2[209] = *(void *)(v10 - 8);
  v2[210] = swift_task_alloc();
  uint64_t v11 = sub_100038530();
  v2[211] = v11;
  v2[212] = *(void *)(v11 - 8);
  v2[213] = swift_task_alloc();
  v2[214] = swift_task_alloc();
  uint64_t v12 = sub_100037BC0();
  v2[215] = v12;
  v2[216] = *(void *)(v12 - 8);
  v2[217] = swift_task_alloc();
  v2[218] = swift_task_alloc();
  sub_100003F3C(&qword_100044260);
  v2[219] = swift_task_alloc();
  uint64_t v13 = sub_100038130();
  v2[220] = v13;
  v2[221] = *(void *)(v13 - 8);
  v2[222] = swift_task_alloc();
  uint64_t v14 = sub_1000380F0();
  v2[223] = v14;
  v2[224] = *(void *)(v14 - 8);
  v2[225] = swift_task_alloc();
  uint64_t v15 = sub_100038260();
  v2[226] = v15;
  v2[227] = *(void *)(v15 - 8);
  v2[228] = swift_task_alloc();
  v2[229] = swift_task_alloc();
  v2[230] = swift_task_alloc();
  v2[231] = swift_task_alloc();
  v2[232] = swift_task_alloc();
  v2[233] = swift_task_alloc();
  v2[234] = swift_task_alloc();
  v2[235] = swift_task_alloc();
  v2[236] = swift_task_alloc();
  v2[237] = swift_task_alloc();
  v2[238] = swift_task_alloc();
  v2[239] = sub_100003F3C(&qword_100044268);
  v2[240] = swift_task_alloc();
  v2[241] = type metadata accessor for ZeoliteExtensionConfig(0);
  v2[242] = swift_task_alloc();
  v2[243] = swift_task_alloc();
  v2[244] = swift_task_alloc();
  v2[245] = swift_task_alloc();
  v2[246] = swift_task_alloc();
  v2[247] = swift_task_alloc();
  v2[248] = swift_task_alloc();
  v2[249] = swift_task_alloc();
  v2[250] = swift_task_alloc();
  v2[251] = swift_task_alloc();
  v2[252] = swift_task_alloc();
  v2[253] = swift_task_alloc();
  v2[254] = swift_task_alloc();
  v2[255] = type metadata accessor for ZeoliteExtension();
  v2[256] = swift_task_alloc();
  sub_100003F3C(&qword_100044270);
  v2[257] = swift_task_alloc();
  uint64_t v16 = sub_100003F3C(&qword_100044158);
  v2[258] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v2[259] = v17;
  v2[260] = *(void *)(v17 + 64);
  v2[261] = swift_task_alloc();
  v2[262] = swift_task_alloc();
  v2[263] = swift_task_alloc();
  v2[264] = swift_task_alloc();
  v2[265] = swift_task_alloc();
  return _swift_task_switch(sub_100006ABC, 0, 0);
}

uint64_t sub_100006ABC()
{
  *(void *)(v0 + 2128) = **(void **)(v0 + 1432);
  *(unsigned char *)(v0 + 2737) = 0;
  *(void *)(v0 + 2136) = sub_100038030();
  *(void *)(v0 + 2144) = sub_100020584(&qword_100044278, (void (*)(uint64_t))&type metadata accessor for LedgerClient);
  uint64_t v2 = sub_1000383E0();
  return _swift_task_switch(sub_100006B88, v2, v1);
}

uint64_t sub_100006B88()
{
  *(void *)(v0 + 2152) = sub_10001DD24();
  sub_100038010();
  return _swift_task_switch(sub_100006C1C, 0, 0);
}

uint64_t sub_100006C1C()
{
  if (qword_1000440D8 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[178];
  v0[270] = sub_1000044B8(v0[226], (uint64_t)qword_100044AF0);
  id v2 = v1;
  uint64_t v3 = sub_100038240();
  os_log_type_t v4 = sub_100038460();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = (void *)v0[178];
  if (v5)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    v0[172] = v6;
    id v9 = v6;
    sub_1000384B0();
    *uint64_t v8 = v6;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Context: %@", v7, 0xCu);
    sub_100003F3C(&qword_1000442C8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v3 = v0[178];
  }

  uint64_t v10 = (void *)swift_task_alloc();
  v0[271] = v10;
  uint64_t v11 = sub_100020584(&qword_100044220, (void (*)(uint64_t))type metadata accessor for ZeoliteExtension);
  uint64_t v12 = sub_100020584(&qword_1000441D0, (void (*)(uint64_t))type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v13 = sub_100020584((unint64_t *)&unk_1000441D8, (void (*)(uint64_t))type metadata accessor for ZeoliteExtensionConfig);
  *uint64_t v10 = v0;
  v10[1] = sub_100006EE4;
  uint64_t v14 = v0[257];
  uint64_t v15 = v0[255];
  uint64_t v16 = v0[241];
  uint64_t v17 = v0[178];
  return MLHostExtension.loadConfig<A>(context:)(v14, v17, v15, v16, v11, v12, v13);
}

uint64_t sub_100006EE4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100006FE0, 0, 0);
}

uint64_t sub_100006FE0()
{
  uint64_t v311 = v0;
  uint64_t v1 = *(void *)(v0 + 2072);
  uint64_t v2 = *(void *)(v0 + 2064);
  uint64_t v3 = *(void *)(v0 + 2056);
  sub_100020854(*(void *)(v0 + 1432), *(void *)(v0 + 2048), (uint64_t (*)(void))type metadata accessor for ZeoliteExtension);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v2);
  uint64_t v5 = *(void *)(v0 + 2120);
  uint64_t v6 = *(void *)(v0 + 2072);
  uint64_t v7 = *(void *)(v0 + 2064);
  uint64_t v8 = *(void *)(v0 + 2056);
  uint64_t v9 = *(void *)(v0 + 2048);
  if (v4 == 1)
  {
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    v10(*(void *)(v0 + 2120), v9 + *(int *)(*(void *)(v0 + 2040) + 20), *(void *)(v0 + 2064));
    sub_1000207F4(v9, (uint64_t (*)(void))type metadata accessor for ZeoliteExtension);
    sub_100020974(v8, &qword_100044270);
  }
  else
  {
    sub_1000207F4(*(void *)(v0 + 2048), (uint64_t (*)(void))type metadata accessor for ZeoliteExtension);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v5, v8, v7);
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  }
  *(void *)(v0 + 2176) = v10;
  uint64_t v11 = *(void *)(v0 + 2120);
  uint64_t v12 = *(void *)(v0 + 2112);
  uint64_t v13 = *(void *)(v0 + 2064);
  *(void *)(v0 + 2184) = (v6 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v10(v12, v11, v13);
  uint64_t v14 = sub_100038240();
  os_log_type_t v15 = sub_100038460();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v17 = *(void *)(v0 + 2112);
  uint64_t v18 = *(void *)(v0 + 2072);
  uint64_t v19 = *(void *)(v0 + 2064);
  if (v16)
  {
    unint64_t v20 = (uint8_t *)swift_slowAlloc();
    v310[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v20 = 136315138;
    sub_100020698(&qword_1000442C0, &qword_100044158);
    uint64_t v21 = sub_1000386E0();
    *(void *)(v0 + 1328) = sub_10001B980(v21, v22, v310);
    sub_1000384B0();
    swift_bridgeObjectRelease();
    os_log_type_t v23 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v23(v17, v19);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Configuration: %s", v20, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    os_log_type_t v23 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v23(v17, v19);
  }

  *(void *)(v0 + 2192) = v23;
  id v24 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v25 = sub_100038300();
  id v26 = [v24 initWithSuiteName:v25];
  *(void *)(v0 + 2200) = v26;

  if (!v26)
  {
    os_log_type_t v56 = sub_100038240();
    os_log_type_t v57 = sub_100038480();
    uint64_t v58 = swift_allocObject();
    *(unsigned char *)(v58 + 16) = 32;
    uint64_t v59 = swift_allocObject();
    *(unsigned char *)(v59 + 16) = 8;
    sub_100003F3C(&qword_100044288);
    uint64_t v60 = swift_allocObject();
    *(_OWORD *)(v60 + 16) = xmmword_10003ADC0;
    *(void *)(v60 + 32) = sub_10001DD88;
    *(void *)(v60 + 40) = v58;
    *(void *)(v60 + 48) = sub_100020C40;
    *(void *)(v60 + 56) = v59;
    *(void *)(v60 + 64) = sub_10001B8A0;
    *(void *)(v60 + 72) = 0;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v61 = v57;
    if (os_log_type_enabled(v56, v57))
    {
      v62 = (uint8_t *)swift_slowAlloc();
      v310[0] = swift_slowAlloc();
      *(_WORD *)v62 = 258;
      v62[2] = 32;
      swift_release();
      uint64_t v62[3] = 8;
      swift_release();
      *(void *)(v0 + 1320) = sub_10001B980(0xD000000000000011, 0x80000001000390C0, v310);
      sub_1000384B0();
      _os_log_impl((void *)&_mh_execute_header, v56, v61, "Failed to fetch suite %s from user defaults.", v62, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release();
      swift_release();
    }

    uint64_t v94 = *(void *)(v0 + 2120);
    uint64_t v95 = *(void *)(v0 + 2064);
    id v96 = objc_allocWithZone((Class)sub_100038060());
    uint64_t v307 = sub_100038050();
    v23(v94, v95);
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v97 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v97(v307);
  }
  v27 = *(void **)(v0 + 2032);
  uint64_t v28 = *(void *)(v0 + 1448);
  uint64_t v29 = *(void *)(v0 + 1440);
  uint64_t v30 = swift_allocBox();
  uint64_t v32 = v31;
  *(void *)(v0 + 2208) = v30;
  *(void *)(v0 + 2216) = v31;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 56))(v31, 1, 1, v29);
  sub_1000380A0();
  v310[0] = 0x6769666E6F63;
  v310[1] = 0xE600000000000000;
  *(void *)(v0 + 1312) = *v27;
  v313._countAndFlagsBits = sub_1000386E0();
  sub_100038340(v313);
  swift_bridgeObjectRelease();
  sub_1000207F4((uint64_t)v27, type metadata accessor for ZeoliteExtensionConfig);
  NSString v33 = sub_100038300();
  swift_bridgeObjectRelease();
  id v34 = [v26 dictionaryForKey:v33];

  if (v34)
  {
    uint64_t v35 = *(void *)(v0 + 1920);
    uint64_t v36 = sub_1000382C0();

    sub_1000265C8(v36, v35);
    sub_100020630(v35, v32);
  }
  uint64_t v301 = v32;
  uint64_t v37 = *(void *)(v0 + 2160);
  uint64_t v38 = *(void *)(v0 + 1904);
  uint64_t v39 = *(void *)(v0 + 1816);
  uint64_t v40 = *(void *)(v0 + 1808);
  unsigned int v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16);
  *(void *)(v0 + 2224) = v41;
  *(void *)(v0 + 2232) = (v39 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v41(v38, v37, v40);
  swift_retain_n();
  uint64_t v42 = sub_100038240();
  os_log_type_t v43 = sub_100038470();
  uint64_t v44 = swift_allocObject();
  *(unsigned char *)(v44 + 16) = 32;
  uint64_t v45 = swift_allocObject();
  *(unsigned char *)(v45 + 16) = 8;
  uint64_t v46 = swift_allocObject();
  *(void *)(v46 + 16) = sub_10001DDAC;
  *(void *)(v46 + 24) = v30;
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = sub_10001DDD4;
  *(void *)(v47 + 24) = v46;
  *(void *)(v0 + 2240) = sub_100003F3C(&qword_100044288);
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_10003ADC0;
  *(void *)(v48 + 32) = sub_100020C40;
  *(void *)(v48 + 40) = v44;
  *(void *)(v48 + 48) = sub_100020C40;
  *(void *)(v48 + 56) = v45;
  *(void *)(v48 + 64) = sub_10001DDFC;
  *(void *)(v48 + 72) = v47;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  os_log_type_t v49 = v43;
  if (os_log_type_enabled(v42, v43))
  {
    v289 = v42;
    uint64_t v50 = *(void *)(v0 + 1920);
    uint64_t v290 = *(void *)(v0 + 1816);
    uint64_t v293 = *(void *)(v0 + 1808);
    uint64_t v297 = *(void *)(v0 + 1904);
    v51 = (uint8_t *)swift_slowAlloc();
    v310[0] = swift_slowAlloc();
    *(_WORD *)v51 = 258;
    v51[2] = 32;
    swift_release();
    v51[3] = 8;
    swift_release();
    swift_beginAccess();
    sub_1000205CC(v301, v50, &qword_100044268);
    uint64_t v52 = sub_100038490();
    unint64_t v54 = v53;
    sub_100020974(v50, &qword_100044268);
    *(void *)(v0 + 1336) = sub_10001B980(v52, v54, v310);
    sub_1000384B0();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v289, v49, "Execution state: %s", v51, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v55 = *(void (**)(uint64_t, uint64_t))(v290 + 8);
    v55(v297, v293);
  }
  else
  {
    uint64_t v63 = *(void *)(v0 + 1904);
    uint64_t v64 = *(void *)(v0 + 1816);
    uint64_t v65 = v42;
    uint64_t v66 = *(void *)(v0 + 1808);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release_n();

    v55 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
    v55(v63, v66);
  }
  *(void *)(v0 + 2248) = v55;
  uint64_t v67 = *(void *)(v0 + 1792);
  uint64_t v68 = *(void *)(v0 + 1784);
  uint64_t v69 = *(void *)(v0 + 1776);
  uint64_t v70 = *(void *)(v0 + 1768);
  uint64_t v71 = *(void *)(v0 + 1760);
  uint64_t v72 = *(void *)(v0 + 1752);
  uint64_t v306 = sub_100038100();
  *(void *)(v0 + 2256) = v306;
  uint64_t v302 = v73;
  *(void *)(v0 + 2264) = v73;
  sub_1000380B0();
  sub_100038120();
  (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v69, v71);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v67 + 48))(v72, 1, v68) != 1)
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 1792) + 32))(*(void *)(v0 + 1800), *(void *)(v0 + 1752), *(void *)(v0 + 1784));
    sub_100038000();
    uint64_t v86 = sub_1000380E0();
    uint64_t v88 = v87;
    *(void *)(v0 + 2272) = v87;
    uint64_t v89 = sub_1000380D0();
    uint64_t v91 = v90;
    *(void *)(v0 + 2280) = v90;
    v92 = (void *)swift_task_alloc();
    *(void *)(v0 + 2288) = v92;
    void *v92 = v0;
    v92[1] = sub_100009C4C;
    uint64_t v93 = *(void *)(v0 + 1424);
    return static MLHostAsset.getRemoteAsset(context:assetType:assetSpecifier:)(v93, v86, v88, v89, v91);
  }
  sub_100020974(*(void *)(v0 + 1752), &qword_100044260);
  *(void *)(v0 + 2320) = 0;
  *(void *)(v0 + 2312) = v302;
  *(void *)(v0 + 2304) = v306;
  uint64_t v74 = *(void *)(v0 + 2024);
  sub_100038510();
  sub_1000380A0();
  sub_1000206DC(v74 + 40, v0 + 776, &qword_100044228);
  sub_100020400((uint64_t *)(v0 + 776), (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))sub_10001DE04, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10001DE34);
  sub_1000207F4(v74, type metadata accessor for ZeoliteExtensionConfig);
  sub_1000206DC(v0 + 776, v0 + 624, &qword_100044228);
  if (sub_10001DE88(v0 + 624) == 1)
  {
    char v75 = 0;
    uint64_t v76 = 0;
    long long v77 = xmmword_10003ADD0;
    long long v78 = xmmword_10003ADE0;
    long long v79 = 0uLL;
    char v80 = 2;
    long long v81 = 0uLL;
    long long v82 = 0uLL;
    long long v83 = 0uLL;
    long long v84 = 0uLL;
    long long v85 = 0uLL;
  }
  else
  {
    sub_1000206DC(v0 + 776, v0 + 168, &qword_100044228);
    long long v84 = *(_OWORD *)(v0 + 264);
    long long v77 = *(_OWORD *)(v0 + 280);
    long long v85 = *(_OWORD *)(v0 + 296);
    uint64_t v76 = *(void *)(v0 + 312);
    long long v79 = *(_OWORD *)(v0 + 176);
    long long v81 = *(_OWORD *)(v0 + 192);
    long long v82 = *(_OWORD *)(v0 + 208);
    long long v78 = *(_OWORD *)(v0 + 224);
    long long v83 = *(_OWORD *)(v0 + 240);
    char v75 = *(unsigned char *)(v0 + 256);
    char v80 = *(unsigned char *)(v0 + 168);
  }
  uint64_t v98 = *(void *)(v0 + 2016);
  uint64_t v99 = *(void *)(v0 + 1928);
  uint64_t v100 = *(void *)(v0 + 1672);
  uint64_t v101 = *(void *)(v0 + 1664);
  uint64_t v102 = *(void *)(v0 + 1656);
  *(unsigned char *)(v0 + 928) = v80;
  *(_OWORD *)(v0 + 936) = v79;
  *(_OWORD *)(v0 + 952) = v81;
  *(_OWORD *)(v0 + 968) = v82;
  *(_OWORD *)(v0 + 984) = v78;
  *(_OWORD *)(v0 + 1000) = v83;
  *(unsigned char *)(v0 + 1016) = v75;
  *(_OWORD *)(v0 + 1024) = v84;
  *(_OWORD *)(v0 + 1040) = v77;
  *(_OWORD *)(v0 + 1056) = v85;
  *(void *)(v0 + 1072) = v76;
  long long v103 = *(_OWORD *)(v0 + 944);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 928);
  *(_OWORD *)(v0 + 32) = v103;
  long long v104 = *(_OWORD *)(v0 + 960);
  long long v105 = *(_OWORD *)(v0 + 976);
  long long v106 = *(_OWORD *)(v0 + 1008);
  *(_OWORD *)(v0 + 80) = *(_OWORD *)(v0 + 992);
  *(_OWORD *)(v0 + 96) = v106;
  *(_OWORD *)(v0 + 48) = v104;
  *(_OWORD *)(v0 + 64) = v105;
  long long v107 = *(_OWORD *)(v0 + 1024);
  long long v108 = *(_OWORD *)(v0 + 1040);
  long long v109 = *(_OWORD *)(v0 + 1056);
  *(void *)(v0 + 160) = *(void *)(v0 + 1072);
  *(_OWORD *)(v0 + 128) = v108;
  *(_OWORD *)(v0 + 144) = v109;
  *(_OWORD *)(v0 + 112) = v107;
  sub_1000380A0();
  sub_1000205CC(v98 + *(int *)(v99 + 40), v102, &qword_100044258);
  sub_1000207F4(v98, type metadata accessor for ZeoliteExtensionConfig);
  int v110 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v100 + 48))(v102, 1, v101);
  v111 = *(unsigned char **)(v0 + 1680);
  if (v110 == 1)
  {
    uint64_t v112 = *(void *)(v0 + 1664);
    uint64_t v113 = *(void *)(v0 + 1656);
    unsigned char *v111 = 0;
    v114 = &v111[*(int *)(v112 + 20)];
    uint64_t v115 = enum case for EmbedderName.MADTextEmbedder(_:);
    uint64_t v116 = sub_100037D90();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v116 - 8) + 104))(v114, v115, v116);
    v117 = &v111[*(int *)(v112 + 24)];
    void *v117 = 0;
    v117[1] = 0;
    sub_100020974(v113, &qword_100044258);
  }
  else
  {
    sub_100020B54(*(void *)(v0 + 1656), (uint64_t)v111, type metadata accessor for EmbedParameters);
  }
  uint64_t v118 = *(void *)(v0 + 2008);
  uint64_t v119 = *(void *)(v0 + 1928);
  sub_1000380A0();
  v120 = (uint64_t *)(v118 + *(int *)(v119 + 44));
  uint64_t v122 = *v120;
  uint64_t v121 = v120[1];
  uint64_t v123 = v120[2];
  uint64_t v124 = v120[3];
  uint64_t v125 = v120[4];
  uint64_t v126 = v120[5];
  sub_10001DEA4(*v120, v121, v123, v124);
  sub_1000207F4(v118, type metadata accessor for ZeoliteExtensionConfig);
  if (v124 == 1)
  {
    char v127 = 0;
    uint64_t v123 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v121 = 10;
  }
  else
  {
    char v127 = v122 & 1;
  }
  *(void *)(v0 + 2360) = v126;
  *(void *)(v0 + 2352) = v125;
  *(void *)(v0 + 2344) = v124;
  *(void *)(v0 + 2336) = v123;
  *(void *)(v0 + 2328) = v121;
  *(unsigned char *)(v0 + 2743) = v127;
  uint64_t v128 = *(void *)(v0 + 2000);
  uint64_t v129 = *(void *)(v0 + 1992);
  uint64_t v130 = *(void *)(v0 + 1928);
  sub_1000380A0();
  *(_WORD *)(v0 + 2732) = *(_WORD *)(v128 + *(int *)(v130 + 48));
  sub_1000207F4(v128, type metadata accessor for ZeoliteExtensionConfig);
  sub_1000380A0();
  v131 = (uint64_t *)(v129 + *(int *)(v130 + 52));
  unint64_t v132 = *v131;
  uint64_t v133 = v131[1];
  unint64_t v134 = v131[2];
  unint64_t v135 = v131[3];
  sub_10001DEEC(*v131, v133);
  sub_1000207F4(v129, type metadata accessor for ZeoliteExtensionConfig);
  if (!v133)
  {
    unint64_t v134 = 0xD000000000000028;
    unint64_t v132 = 0xD00000000000002FLL;
    unint64_t v135 = 0x8000000100039110;
    uint64_t v133 = 0x80000001000390E0;
  }
  *(void *)(v0 + 2392) = v135;
  *(void *)(v0 + 2384) = v134;
  *(void *)(v0 + 2376) = v133;
  *(void *)(v0 + 2368) = v132;
  uint64_t v136 = *(void *)(v0 + 1984);
  uint64_t v137 = *(void *)(v0 + 1648);
  uint64_t v138 = *(void *)(v0 + 1528);
  uint64_t v139 = *(void *)(v0 + 1520);
  *(unsigned char *)(v0 + 2744) = **(unsigned char **)(v0 + 1680);
  v140 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v138 + 56);
  *(void *)(v0 + 2400) = v140;
  *(void *)(v0 + 2408) = (v138 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v140(v137, 1, 1, v139);
  *(void *)(v0 + 1296) = 0;
  *(void *)(v0 + 1304) = 0;
  sub_1000380A0();
  sub_1000206DC(v136 + 40, v0 + 320, &qword_100044228);
  sub_100020400((uint64_t *)(v0 + 320), (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))sub_10001DE04, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10001DE34);
  sub_1000207F4(v136, type metadata accessor for ZeoliteExtensionConfig);
  sub_1000206DC(v0 + 320, v0 + 472, &qword_100044228);
  if (sub_10001DE88(v0 + 472) != 1)
  {
    sub_100020400((uint64_t *)(v0 + 320), (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))sub_10001DF94, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10001DFC4);
    int v141 = *(unsigned __int8 *)(v0 + 472);
    if (v141 != 2)
    {
      v142 = *(uint64_t **)(v0 + 1976);
      char v143 = v141 & 1;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 1280) = 0;
      *(void *)(v0 + 1288) = 0xE000000000000000;
      *(unsigned char *)(v0 + 2735) = v143;
      sub_100038550();
      v314._countAndFlagsBits = 0x6769666E6F632ELL;
      v314._object = (void *)0xE700000000000000;
      sub_100038340(v314);
      sub_1000380A0();
      uint64_t v144 = *v142;
      sub_1000207F4((uint64_t)v142, type metadata accessor for ZeoliteExtensionConfig);
      *(void *)(v0 + 1368) = v144;
      v315._countAndFlagsBits = sub_1000386E0();
      sub_100038340(v315);
      swift_bridgeObjectRelease();
      uint64_t v145 = *(void *)(v0 + 1288);
      *(void *)(v0 + 1296) = *(void *)(v0 + 1280);
      *(void *)(v0 + 1304) = v145;
    }
  }
  (*(void (**)(void, void, void))(v0 + 2224))(*(void *)(v0 + 1888), *(void *)(v0 + 2160), *(void *)(v0 + 1808));
  uint64_t v146 = *(void *)(v0 + 1296);
  unint64_t v147 = *(void *)(v0 + 1304);
  uint64_t v148 = swift_allocObject();
  uint64_t v286 = v146;
  *(void *)(v148 + 16) = v146;
  *(void *)(v148 + 24) = v147;
  swift_bridgeObjectRetain_n();
  v149 = sub_100038240();
  os_log_type_t v150 = sub_100038460();
  uint64_t v151 = swift_allocObject();
  *(unsigned char *)(v151 + 16) = 32;
  uint64_t v152 = swift_allocObject();
  *(unsigned char *)(v152 + 16) = 8;
  uint64_t v153 = swift_allocObject();
  *(void *)(v153 + 16) = sub_10001DF30;
  *(void *)(v153 + 24) = v148;
  uint64_t v154 = swift_allocObject();
  *(void *)(v154 + 16) = sub_100020BC0;
  *(void *)(v154 + 24) = v153;
  uint64_t v155 = swift_allocObject();
  *(_OWORD *)(v155 + 16) = xmmword_10003ADC0;
  *(void *)(v155 + 32) = sub_100020C40;
  *(void *)(v155 + 40) = v151;
  *(void *)(v155 + 48) = sub_100020C40;
  *(void *)(v155 + 56) = v152;
  *(void *)(v155 + 64) = sub_100020BC8;
  *(void *)(v155 + 72) = v154;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  v303 = v149;
  BOOL v156 = os_log_type_enabled(v149, v150);
  v157 = *(void (**)(uint64_t, uint64_t))(v0 + 2248);
  uint64_t v158 = *(void *)(v0 + 1888);
  uint64_t v294 = *(void *)(v0 + 1808);
  if (v156)
  {
    uint64_t v284 = *(void *)(v0 + 1888);
    v159 = (uint8_t *)swift_slowAlloc();
    v310[0] = swift_slowAlloc();
    *(_WORD *)v159 = 258;
    v159[2] = 32;
    swift_release();
    v159[3] = 8;
    swift_release();
    if (v147) {
      uint64_t v160 = v286;
    }
    else {
      uint64_t v160 = 7104878;
    }
    v287 = v157;
    if (v147) {
      unint64_t v161 = v147;
    }
    else {
      unint64_t v161 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    *(void *)(v0 + 1416) = sub_10001B980(v160, v161, v310);
    sub_1000384B0();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v303, v150, "Source type: %s", v159, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v287(v284, v294);
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();

    v157(v158, v294);
  }
  uint64_t v162 = *(void *)(v0 + 1968);
  sub_1000380A0();
  uint64_t v163 = *(void *)(v162 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v162, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v164 = *(void *)(v163 + 16);
  if (v164)
  {
    swift_bridgeObjectRetain();
    uint64_t v165 = 0;
    while (2)
    {
      uint64_t v166 = v163 + v165++;
      switch(*(unsigned char *)(v166 + 32))
      {
        case 1:
        case 2:
        case 3:
        case 4:
          char v167 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v167) {
            goto LABEL_83;
          }
          if (v164 != v165) {
            continue;
          }
          swift_bridgeObjectRelease();
          break;
        default:
          swift_bridgeObjectRelease();
LABEL_83:
          swift_bridgeObjectRelease_n();
          *(void *)(v0 + 2416) = **(void **)(v0 + 1432);
          *(unsigned char *)(v0 + 2734) = 1;
          uint64_t v192 = sub_1000383E0();
          uint64_t v194 = v193;
          v195 = sub_10000BFD0;
          goto LABEL_113;
      }
      break;
    }
  }
  swift_bridgeObjectRelease();
  sub_100020740(v0 + 928, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_10001DF94, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10001DFC4);
  *(void *)(v0 + 2440) = 0;
  uint64_t v168 = *(void *)(v0 + 1960);
  sub_1000380A0();
  uint64_t v169 = *(void *)(v168 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v168, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v170 = *(void *)(v169 + 16);
  if (v170)
  {
    swift_bridgeObjectRetain();
    uint64_t v171 = 0;
    while (2)
    {
      uint64_t v172 = v169 + v171++;
      switch(*(unsigned char *)(v172 + 32))
      {
        case 4:
          swift_bridgeObjectRelease();
          goto LABEL_89;
        default:
          char v173 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v173)
          {
LABEL_89:
            swift_bridgeObjectRelease();
            v201 = *(void **)(v0 + 1432);
            swift_bridgeObjectRelease();
            *(void *)(v0 + 2448) = *v201;
            *(unsigned char *)(v0 + 2736) = 2;
            uint64_t v192 = sub_1000383E0();
            uint64_t v194 = v202;
            v195 = sub_10000DBE4;
            goto LABEL_113;
          }
          if (v170 != v171) {
            continue;
          }
          swift_bridgeObjectRelease_n();
          break;
      }
      break;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 2552) = 0;
  uint64_t v174 = *(void *)(v0 + 1952);
  sub_1000380A0();
  uint64_t v175 = *(void *)(v174 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v174, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v176 = *(void *)(v175 + 16);
  if (v176)
  {
    swift_bridgeObjectRetain();
    uint64_t v177 = 0;
    while (2)
    {
      uint64_t v178 = v175 + v177++;
      switch(*(unsigned char *)(v178 + 32))
      {
        case 1:
          swift_bridgeObjectRelease();
          goto LABEL_99;
        default:
          char v179 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v179)
          {
LABEL_99:
            swift_bridgeObjectRelease();
            v261 = *(void **)(v0 + 1432);
            swift_bridgeObjectRelease();
            *(void *)(v0 + 2560) = *v261;
            *(unsigned char *)(v0 + 2739) = 2;
            uint64_t v192 = sub_1000383E0();
            uint64_t v194 = v262;
            v195 = sub_100011A3C;
            goto LABEL_113;
          }
          if (v176 != v177) {
            continue;
          }
          swift_bridgeObjectRelease_n();
          break;
      }
      break;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  *(void *)(v0 + 2592) = 0;
  uint64_t v180 = *(void *)(v0 + 1944);
  (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 2400))(*(void *)(v0 + 1624), 1, 1, *(void *)(v0 + 1520));
  sub_1000380A0();
  uint64_t v181 = *(void *)(v180 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v180, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v182 = *(void *)(v181 + 16);
  if (v182)
  {
    swift_bridgeObjectRetain();
    uint64_t v183 = 0;
    while (1)
    {
      uint64_t v184 = v181 + v183++;
      switch(*(unsigned char *)(v184 + 32))
      {
        case 2:
          swift_bridgeObjectRelease();
          goto LABEL_101;
        default:
          char v185 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v185)
          {
LABEL_101:
            swift_bridgeObjectRelease();
            char v263 = *(unsigned char *)(v0 + 2743);
            swift_bridgeObjectRelease();
            if (v263)
            {
              swift_bridgeObjectRelease();
            }
            else
            {
              char v264 = sub_100038700();
              swift_bridgeObjectRelease();
              if ((v264 & 1) == 0)
              {
                *(void *)(v0 + 2640) = 0;
                *(void *)(v0 + 2648) = **(void **)(v0 + 1432);
                *(unsigned char *)(v0 + 2740) = 2;
                uint64_t v192 = sub_1000383E0();
                uint64_t v194 = v276;
                v195 = sub_100015360;
                goto LABEL_113;
              }
            }
            uint64_t v265 = *(void *)(v0 + 2216);
            uint64_t v266 = *(void *)(v0 + 1448);
            uint64_t v267 = *(void *)(v0 + 1440);
            sub_100020974(*(void *)(v0 + 1624), &qword_1000440F0);
            swift_beginAccess();
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v266 + 48))(v265, 1, v267)) {
              (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 2400))(*(void *)(v0 + 1616), 1, 1, *(void *)(v0 + 1520));
            }
            else {
              sub_1000205CC(*(void *)(v0 + 2216) + *(int *)(*(void *)(v0 + 1440) + 20), *(void *)(v0 + 1616), &qword_1000440F0);
            }
            uint64_t v268 = *(void *)(v0 + 1680);
            uint64_t v269 = *(void *)(v0 + 1664);
            sub_1000206DC(*(void *)(v0 + 1616), *(void *)(v0 + 1624), &qword_1000440F0);
            uint64_t v270 = *(int *)(v269 + 24);
            uint64_t v271 = v268 + *(int *)(v269 + 20);
            uint64_t v272 = v268 + v270;
            uint64_t v273 = *(void *)(v268 + v270);
            uint64_t v274 = *(void *)(v272 + 8);
            *(void *)(v0 + 2600) = v274;
            swift_bridgeObjectRetain();
            v275 = (void *)swift_task_alloc();
            *(void *)(v0 + 2608) = v275;
            void *v275 = v0;
            v275[1] = sub_1000135FC;
            return sub_100022514(v0 + 1120, v271, v273, v274);
          }
          if (v182 == v183)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_75;
          }
          break;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_75:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(v0 + 2672) = 0u;
  uint64_t v186 = *(void *)(v0 + 1936);
  sub_1000380A0();
  uint64_t v187 = *(void *)(v186 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v186, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v188 = *(void *)(v187 + 16);
  if (v188)
  {
    swift_bridgeObjectRetain();
    uint64_t v189 = 0;
    while (1)
    {
      uint64_t v190 = v187 + v189++;
      switch(*(unsigned char *)(v190 + 32))
      {
        case 3:
          swift_bridgeObjectRelease();
          goto LABEL_112;
        default:
          char v191 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v191)
          {
LABEL_112:
            swift_bridgeObjectRelease();
            v277 = *(void **)(v0 + 1432);
            swift_bridgeObjectRelease();
            *(void *)(v0 + 2688) = *v277;
            *(unsigned char *)(v0 + 2738) = 2;
            uint64_t v192 = sub_1000383E0();
            uint64_t v194 = v278;
            v195 = sub_100016664;
            goto LABEL_113;
          }
          if (v188 == v189)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_85;
          }
          break;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_85:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v196 = *(void *)(v0 + 1648);
  uint64_t v197 = *(void *)(v0 + 1624);
  uint64_t v198 = *(void *)(v0 + 1456);
  uint64_t v199 = *(void *)(v0 + 1440);
  sub_100037C10();
  sub_1000205CC(v197, v198 + *(int *)(v199 + 20), &qword_1000440F0);
  sub_1000205CC(v196, v198 + *(int *)(v199 + 24), &qword_1000440F0);
  if (sub_100026EE0())
  {
    v200.super.isa = sub_1000382B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v200.super.isa = 0;
  }
  v203 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2176);
  uint64_t v285 = *(void *)(v0 + 2160);
  v288 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2224);
  uint64_t v204 = *(void *)(v0 + 2120);
  uint64_t v205 = *(void *)(v0 + 2096);
  uint64_t v295 = *(void *)(v0 + 2088);
  uint64_t v206 = *(void *)(v0 + 2072);
  uint64_t v207 = *(void *)(v0 + 2064);
  uint64_t v208 = *(void *)(v0 + 1976);
  v280 = *(void **)(v0 + 2200);
  uint64_t v281 = *(void *)(v0 + 1832);
  uint64_t v282 = *(void *)(v0 + 1808);
  sub_1000380A0();
  sub_100026558();
  sub_1000207F4(v208, type metadata accessor for ZeoliteExtensionConfig);
  NSString v209 = sub_100038300();
  swift_bridgeObjectRelease();
  [v280 setValue:v200.super.isa forKey:v209];

  swift_unknownObjectRelease();
  v288(v281, v285, v282);
  v203(v205, v204, v207);
  v203(v295, v205, v207);
  unint64_t v210 = (*(unsigned __int8 *)(v206 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v206 + 80);
  uint64_t v211 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v206 + 32))(v211 + v210, v205, v207);
  v212 = sub_100038240();
  os_log_type_t v213 = sub_100038460();
  uint64_t v214 = swift_allocObject();
  *(unsigned char *)(v214 + 16) = 32;
  uint64_t v215 = swift_allocObject();
  *(unsigned char *)(v215 + 16) = 8;
  uint64_t v216 = swift_allocObject();
  *(void *)(v216 + 16) = sub_10001E01C;
  *(void *)(v216 + 24) = v211;
  uint64_t v217 = swift_allocObject();
  *(void *)(v217 + 16) = sub_100020BC0;
  *(void *)(v217 + 24) = v216;
  uint64_t v218 = swift_allocObject();
  *(_OWORD *)(v218 + 16) = xmmword_10003ADC0;
  *(void *)(v218 + 32) = sub_100020C40;
  *(void *)(v218 + 40) = v214;
  *(void *)(v218 + 48) = sub_100020C40;
  *(void *)(v218 + 56) = v215;
  *(void *)(v218 + 64) = sub_100020BC8;
  *(void *)(v218 + 72) = v217;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  BOOL v219 = os_log_type_enabled(v212, v213);
  uint64_t v220 = *(void *)(v0 + 2088);
  uint64_t v221 = *(void *)(v0 + 2072);
  v304 = v212;
  if (v219)
  {
    os_log_type_t v291 = v213;
    uint64_t v222 = *(void *)(v0 + 1976);
    uint64_t v308 = *(void *)(v0 + 1832);
    uint64_t v296 = *(void *)(v0 + 1816);
    uint64_t v298 = *(void *)(v0 + 1808);
    uint64_t v223 = *(void *)(v0 + 2064);
    v224 = (uint8_t *)swift_slowAlloc();
    v310[0] = swift_slowAlloc();
    *(_WORD *)v224 = 258;
    v224[2] = 32;
    swift_release();
    v224[3] = 8;
    swift_release();
    sub_1000380A0();
    uint64_t v225 = sub_100026558();
    uint64_t v283 = v220;
    unint64_t v227 = v226;
    sub_1000207F4(v222, type metadata accessor for ZeoliteExtensionConfig);
    *(void *)(v0 + 1408) = sub_10001B980(v225, v227, v310);
    sub_1000384B0();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    v228 = *(void (**)(uint64_t, uint64_t))(v221 + 8);
    v228(v283, v223);
    _os_log_impl((void *)&_mh_execute_header, v304, v291, "Execution state saved for %s.", v224, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v229 = v298;
    v299 = *(void (**)(uint64_t, uint64_t))(v296 + 8);
  }
  else
  {
    uint64_t v308 = *(void *)(v0 + 1832);
    uint64_t v230 = *(void *)(v0 + 1816);
    uint64_t v300 = *(void *)(v0 + 1808);
    uint64_t v231 = *(void *)(v0 + 2064);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v228 = *(void (**)(uint64_t, uint64_t))(v221 + 8);
    v228(v220, v231);

    uint64_t v229 = v300;
    v299 = *(void (**)(uint64_t, uint64_t))(v230 + 8);
  }
  v299(v308, v229);
  *(void *)(v0 + 2696) = v228;
  v232 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2224);
  uint64_t v233 = *(void *)(v0 + 2160);
  uint64_t v234 = *(void *)(v0 + 1824);
  uint64_t v235 = *(void *)(v0 + 1808);
  uint64_t v236 = *(void *)(v0 + 1704);
  uint64_t v237 = *(void *)(v0 + 1696);
  uint64_t v238 = *(void *)(v0 + 1688);
  sub_100038510();
  uint64_t v239 = sub_100038520();
  uint64_t v241 = v240;
  v242 = *(void (**)(uint64_t, uint64_t))(v237 + 8);
  *(void *)(v0 + 2704) = v242;
  *(void *)(v0 + 2712) = (v237 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v242(v236, v238);
  v232(v234, v233, v235);
  uint64_t v243 = swift_allocObject();
  *(void *)(v243 + 16) = v239;
  *(void *)(v243 + 24) = v241;
  uint64_t v244 = swift_allocObject();
  *(void *)(v244 + 16) = sub_10001E0B0;
  *(void *)(v244 + 24) = v243;
  swift_retain();
  v245 = sub_100038240();
  os_log_type_t v246 = sub_100038460();
  uint64_t v247 = swift_allocObject();
  *(unsigned char *)(v247 + 16) = 32;
  uint64_t v248 = swift_allocObject();
  *(unsigned char *)(v248 + 16) = 8;
  uint64_t v249 = swift_allocObject();
  *(void *)(v249 + 16) = sub_10001E0BC;
  *(void *)(v249 + 24) = v244;
  uint64_t v250 = swift_allocObject();
  *(void *)(v250 + 16) = sub_100020BC0;
  *(void *)(v250 + 24) = v249;
  uint64_t v251 = swift_allocObject();
  *(_OWORD *)(v251 + 16) = xmmword_10003ADC0;
  *(void *)(v251 + 32) = sub_100020C40;
  *(void *)(v251 + 40) = v247;
  *(void *)(v251 + 48) = sub_100020C40;
  *(void *)(v251 + 56) = v248;
  *(void *)(v251 + 64) = sub_100020BC8;
  *(void *)(v251 + 72) = v250;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  v309 = v245;
  BOOL v252 = os_log_type_enabled(v245, v246);
  uint64_t v253 = *(void *)(v0 + 1824);
  uint64_t v254 = *(void *)(v0 + 1808);
  if (v252)
  {
    uint64_t v305 = *(void *)(v0 + 1824);
    uint64_t v292 = *(void *)(v0 + 1808);
    v255 = (uint8_t *)swift_slowAlloc();
    v310[0] = swift_slowAlloc();
    *(_WORD *)v255 = 258;
    v255[2] = 32;
    swift_release();
    v255[3] = 8;
    swift_release();
    uint64_t v256 = sub_100038800();
    *(void *)(v0 + 1400) = sub_10001B980(v256, v257, v310);
    sub_1000384B0();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v309, v246, "Time elapsed: %s.", v255, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v258 = v292;
    uint64_t v259 = v305;
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();

    uint64_t v259 = v253;
    uint64_t v258 = v254;
  }
  v299(v259, v258);
  *(void *)(v0 + 2720) = **(void **)(v0 + 1432);
  *(unsigned char *)(v0 + 2742) = 4;
  uint64_t v192 = sub_1000383E0();
  uint64_t v194 = v260;
  v195 = sub_10001775C;
LABEL_113:
  return _swift_task_switch(v195, v192, v194);
}

uint64_t sub_100009C4C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 2296) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_100009D88, 0, 0);
}

uint64_t sub_100009D88()
{
  uint64_t v259 = v0;
  uint64_t v1 = v0 + 624;
  uint64_t v2 = (uint64_t *)(v0 + 776);
  uint64_t v3 = *(void *)(v0 + 2296);
  (*(void (**)(void, void))(*(void *)(v0 + 1792) + 8))(*(void *)(v0 + 1800), *(void *)(v0 + 1784));
  if (v3)
  {
    uint64_t v4 = *(void *)(v0 + 2296);
    uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2224);
    uint64_t v6 = *(void *)(v0 + 2160);
    uint64_t v7 = *(void *)(v0 + 1896);
    uint64_t v8 = *(void *)(v0 + 1808);
    swift_retain();
    swift_bridgeObjectRelease();
    v5(v7, v6, v8);
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = sub_100020558;
    *(void *)(v9 + 24) = v4;
    swift_retain_n();
    uint64_t v10 = sub_100038240();
    LOBYTE(v6) = sub_100038460();
    uint64_t v11 = swift_allocObject();
    *(unsigned char *)(v11 + 16) = 32;
    uint64_t v12 = swift_allocObject();
    *(unsigned char *)(v12 + 16) = 8;
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = sub_10002055C;
    *(void *)(v13 + 24) = v9;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_100020BC0;
    *(void *)(v14 + 24) = v13;
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_10003ADC0;
    *(void *)(v15 + 32) = sub_100020C40;
    *(void *)(v15 + 40) = v11;
    *(void *)(v15 + 48) = sub_100020C40;
    *(void *)(v15 + 56) = v12;
    *(void *)(v15 + 64) = sub_100020BC8;
    *(void *)(v15 + 72) = v14;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t type = v6;
    BOOL v16 = os_log_type_enabled(v10, (os_log_type_t)v6);
    uint64_t v17 = *(void (**)(uint64_t, void))(v0 + 2248);
    uint64_t v18 = *(void *)(v0 + 1896);
    *(void *)uint64_t v244 = *(void *)(v0 + 1808);
    if (v16)
    {
      uint64_t v233 = *(void *)(v0 + 1896);
      uint64_t v236 = *(void (**)(uint64_t, void))(v0 + 2248);
      uint64_t v19 = *(void *)(v0 + 1744);
      uint64_t v20 = *(void *)(v0 + 1728);
      uint64_t v21 = *(void *)(v0 + 1720);
      log = v10;
      unint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v258 = swift_slowAlloc();
      *(_WORD *)unint64_t v22 = 258;
      v22[2] = 32;
      swift_release();
      v22[3] = 8;
      swift_release();
      sub_100037FF0();
      sub_100020584(&qword_1000442B8, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v23 = sub_1000386E0();
      unint64_t v25 = v24;
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
      *(void *)(v0 + 1360) = sub_10001B980(v23, v25, &v258);
      sub_1000384B0();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      swift_release_n();
      _os_log_impl((void *)&_mh_execute_header, log, type, "autoAsset available: %s", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v236(v233, *(void *)v244);
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release_n();

      v17(v18, *(void *)v244);
    }
    uint64_t v29 = *(void *)(v0 + 1744);
    uint64_t v30 = *(void *)(v0 + 1736);
    uint64_t v31 = *(void *)(v0 + 1728);
    uint64_t v32 = *(void *)(v0 + 1720);
    sub_100037FF0();
    sub_100037B70();
    NSString v33 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
    v33(v29, v32);
    uint64_t v28 = sub_100037B90(1);
    uint64_t v27 = v34;
    swift_release();
    v33(v30, v32);
    uint64_t v26 = *(void *)(v0 + 2296);
    uint64_t v2 = (uint64_t *)(v0 + 776);
    uint64_t v1 = v0 + 624;
  }
  else
  {
    uint64_t v26 = 0;
    uint64_t v27 = *(void *)(v0 + 2264);
    uint64_t v28 = *(void *)(v0 + 2256);
  }
  *(void *)(v0 + 2320) = v26;
  *(void *)(v0 + 2312) = v27;
  *(void *)(v0 + 2304) = v28;
  uint64_t v35 = *(void *)(v0 + 2024);
  sub_100038510();
  sub_1000380A0();
  sub_1000206DC(v35 + 40, (uint64_t)v2, &qword_100044228);
  sub_100020400(v2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))sub_10001DE04, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10001DE34);
  sub_1000207F4(v35, type metadata accessor for ZeoliteExtensionConfig);
  sub_1000206DC((uint64_t)v2, v1, &qword_100044228);
  if (sub_10001DE88(v1) == 1)
  {
    char v36 = 0;
    uint64_t v37 = 0;
    long long v38 = xmmword_10003ADD0;
    long long v39 = xmmword_10003ADE0;
    long long v40 = 0uLL;
    char v41 = 2;
    long long v42 = 0uLL;
    long long v43 = 0uLL;
    long long v44 = 0uLL;
    long long v45 = 0uLL;
    long long v46 = 0uLL;
    uint64_t v47 = (_OWORD *)(v0 + 264);
  }
  else
  {
    sub_1000206DC((uint64_t)v2, v0 + 168, &qword_100044228);
    uint64_t v47 = (_OWORD *)(v0 + 264);
    long long v45 = *(_OWORD *)(v0 + 264);
    long long v38 = *(_OWORD *)(v0 + 280);
    long long v46 = *(_OWORD *)(v0 + 296);
    uint64_t v37 = *(void *)(v0 + 312);
    long long v40 = *(_OWORD *)(v0 + 176);
    long long v42 = *(_OWORD *)(v0 + 192);
    long long v43 = *(_OWORD *)(v0 + 208);
    long long v39 = *(_OWORD *)(v0 + 224);
    long long v44 = *(_OWORD *)(v0 + 240);
    char v36 = *(unsigned char *)(v0 + 256);
    char v41 = *(unsigned char *)(v0 + 168);
  }
  uint64_t v48 = *(void *)(v0 + 2016);
  uint64_t v49 = *(void *)(v0 + 1928);
  uint64_t v50 = *(void *)(v0 + 1672);
  uint64_t v51 = *(void *)(v0 + 1664);
  uint64_t v52 = *(void *)(v0 + 1656);
  *(unsigned char *)(v0 + 928) = v41;
  v47[42] = v40;
  v47[43] = v42;
  v47[44] = v43;
  v47[45] = v39;
  v47[46] = v44;
  *(unsigned char *)(v0 + 1016) = v36;
  *(_OWORD *)(v0 + 1024) = v45;
  *(_OWORD *)(v0 + 1040) = v38;
  *(_OWORD *)(v0 + 1056) = v46;
  *(void *)(v0 + 1072) = v37;
  long long v53 = *(_OWORD *)(v0 + 944);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 928);
  *(_OWORD *)(v0 + 32) = v53;
  long long v54 = *(_OWORD *)(v0 + 960);
  long long v55 = *(_OWORD *)(v0 + 976);
  long long v56 = *(_OWORD *)(v0 + 1008);
  *(_OWORD *)(v0 + 80) = *(_OWORD *)(v0 + 992);
  *(_OWORD *)(v0 + 96) = v56;
  *(_OWORD *)(v0 + 48) = v54;
  *(_OWORD *)(v0 + 64) = v55;
  long long v57 = *(_OWORD *)(v0 + 1024);
  long long v58 = *(_OWORD *)(v0 + 1040);
  long long v59 = *(_OWORD *)(v0 + 1056);
  *(void *)(v0 + 160) = *(void *)(v0 + 1072);
  *(_OWORD *)(v0 + 128) = v58;
  *(_OWORD *)(v0 + 144) = v59;
  *(_OWORD *)(v0 + 112) = v57;
  sub_1000380A0();
  sub_1000205CC(v48 + *(int *)(v49 + 40), v52, &qword_100044258);
  sub_1000207F4(v48, type metadata accessor for ZeoliteExtensionConfig);
  int v60 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v50 + 48))(v52, 1, v51);
  os_log_type_t v61 = *(unsigned char **)(v0 + 1680);
  if (v60 == 1)
  {
    uint64_t v62 = *(void *)(v0 + 1664);
    uint64_t v63 = *(void *)(v0 + 1656);
    *os_log_type_t v61 = 0;
    uint64_t v64 = &v61[*(int *)(v62 + 20)];
    uint64_t v65 = enum case for EmbedderName.MADTextEmbedder(_:);
    uint64_t v66 = sub_100037D90();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v66 - 8) + 104))(v64, v65, v66);
    uint64_t v67 = &v61[*(int *)(v62 + 24)];
    *uint64_t v67 = 0;
    v67[1] = 0;
    sub_100020974(v63, &qword_100044258);
  }
  else
  {
    sub_100020B54(*(void *)(v0 + 1656), (uint64_t)v61, type metadata accessor for EmbedParameters);
  }
  uint64_t v68 = *(void *)(v0 + 2008);
  uint64_t v69 = *(void *)(v0 + 1928);
  sub_1000380A0();
  uint64_t v70 = (uint64_t *)(v68 + *(int *)(v69 + 44));
  uint64_t v72 = *v70;
  uint64_t v71 = v70[1];
  uint64_t v73 = v70[2];
  uint64_t v74 = v70[3];
  uint64_t v75 = v70[4];
  uint64_t v76 = v70[5];
  sub_10001DEA4(*v70, v71, v73, v74);
  sub_1000207F4(v68, type metadata accessor for ZeoliteExtensionConfig);
  if (v74 == 1)
  {
    char v77 = 0;
    uint64_t v73 = 0;
    uint64_t v74 = 0;
    uint64_t v75 = 0;
    uint64_t v76 = 0;
    uint64_t v71 = 10;
  }
  else
  {
    char v77 = v72 & 1;
  }
  *(void *)(v0 + 2360) = v76;
  *(void *)(v0 + 2352) = v75;
  *(void *)(v0 + 2344) = v74;
  *(void *)(v0 + 2336) = v73;
  *(void *)(v0 + 2328) = v71;
  *(unsigned char *)(v0 + 2743) = v77;
  uint64_t v78 = *(void *)(v0 + 2000);
  uint64_t v79 = *(void *)(v0 + 1992);
  uint64_t v80 = *(void *)(v0 + 1928);
  sub_1000380A0();
  *(_WORD *)(v0 + 2732) = *(_WORD *)(v78 + *(int *)(v80 + 48));
  sub_1000207F4(v78, type metadata accessor for ZeoliteExtensionConfig);
  sub_1000380A0();
  long long v81 = (uint64_t *)(v79 + *(int *)(v80 + 52));
  unint64_t v82 = *v81;
  uint64_t v83 = v81[1];
  unint64_t v84 = v81[2];
  unint64_t v85 = v81[3];
  sub_10001DEEC(*v81, v83);
  sub_1000207F4(v79, type metadata accessor for ZeoliteExtensionConfig);
  if (!v83)
  {
    unint64_t v84 = 0xD000000000000028;
    unint64_t v82 = 0xD00000000000002FLL;
    unint64_t v85 = 0x8000000100039110;
    uint64_t v83 = 0x80000001000390E0;
  }
  *(void *)(v0 + 2392) = v85;
  *(void *)(v0 + 2384) = v84;
  *(void *)(v0 + 2376) = v83;
  *(void *)(v0 + 2368) = v82;
  uint64_t v86 = *(void *)(v0 + 1984);
  uint64_t v87 = *(void *)(v0 + 1648);
  uint64_t v88 = *(void *)(v0 + 1528);
  uint64_t v89 = *(void *)(v0 + 1520);
  *(unsigned char *)(v0 + 2744) = **(unsigned char **)(v0 + 1680);
  uint64_t v90 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v88 + 56);
  *(void *)(v0 + 2400) = v90;
  *(void *)(v0 + 2408) = (v88 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v90(v87, 1, 1, v89);
  *(void *)(v0 + 1296) = 0;
  *(void *)(v0 + 1304) = 0;
  sub_1000380A0();
  sub_1000206DC(v86 + 40, v0 + 320, &qword_100044228);
  sub_100020400((uint64_t *)(v0 + 320), (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))sub_10001DE04, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10001DE34);
  sub_1000207F4(v86, type metadata accessor for ZeoliteExtensionConfig);
  sub_1000206DC(v0 + 320, v0 + 472, &qword_100044228);
  if (sub_10001DE88(v0 + 472) != 1)
  {
    sub_100020400((uint64_t *)(v0 + 320), (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))sub_10001DF94, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10001DFC4);
    int v91 = *(unsigned __int8 *)(v0 + 472);
    if (v91 != 2)
    {
      v92 = *(uint64_t **)(v0 + 1976);
      char v93 = v91 & 1;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 1280) = 0;
      *(void *)(v0 + 1288) = 0xE000000000000000;
      *(unsigned char *)(v0 + 2735) = v93;
      sub_100038550();
      v261._countAndFlagsBits = 0x6769666E6F632ELL;
      v261._object = (void *)0xE700000000000000;
      sub_100038340(v261);
      sub_1000380A0();
      uint64_t v94 = *v92;
      sub_1000207F4((uint64_t)v92, type metadata accessor for ZeoliteExtensionConfig);
      *(void *)(v0 + 1368) = v94;
      v262._countAndFlagsBits = sub_1000386E0();
      sub_100038340(v262);
      swift_bridgeObjectRelease();
      uint64_t v95 = *(void *)(v0 + 1288);
      *(void *)(v0 + 1296) = *(void *)(v0 + 1280);
      *(void *)(v0 + 1304) = v95;
    }
  }
  (*(void (**)(void, void, void))(v0 + 2224))(*(void *)(v0 + 1888), *(void *)(v0 + 2160), *(void *)(v0 + 1808));
  uint64_t v96 = *(void *)(v0 + 1296);
  unint64_t v97 = *(void *)(v0 + 1304);
  uint64_t v98 = swift_allocObject();
  *(void *)typea = v96;
  *(void *)(v98 + 16) = v96;
  *(void *)(v98 + 24) = v97;
  swift_bridgeObjectRetain_n();
  uint64_t v99 = sub_100038240();
  os_log_type_t v250 = sub_100038460();
  uint64_t v100 = swift_allocObject();
  *(unsigned char *)(v100 + 16) = 32;
  uint64_t v101 = swift_allocObject();
  *(unsigned char *)(v101 + 16) = 8;
  uint64_t v102 = swift_allocObject();
  *(void *)(v102 + 16) = sub_10001DF30;
  *(void *)(v102 + 24) = v98;
  uint64_t v103 = swift_allocObject();
  *(void *)(v103 + 16) = sub_100020BC0;
  *(void *)(v103 + 24) = v102;
  uint64_t v104 = swift_allocObject();
  *(_OWORD *)(v104 + 16) = xmmword_10003ADC0;
  *(void *)(v104 + 32) = sub_100020C40;
  *(void *)(v104 + 40) = v100;
  *(void *)(v104 + 48) = sub_100020C40;
  *(void *)(v104 + 56) = v101;
  *(void *)(v104 + 64) = sub_100020BC8;
  *(void *)(v104 + 72) = v103;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  os_log_type_t v105 = v250;
  uint64_t v251 = v99;
  BOOL v106 = os_log_type_enabled(v99, v105);
  long long v107 = *(void (**)(uint64_t, uint64_t))(v0 + 2248);
  uint64_t v108 = *(void *)(v0 + 1888);
  uint64_t v247 = *(void *)(v0 + 1808);
  if (v106)
  {
    uint64_t v237 = *(void *)(v0 + 1888);
    long long v109 = (uint8_t *)swift_slowAlloc();
    uint64_t v258 = swift_slowAlloc();
    *(_WORD *)long long v109 = 258;
    v109[2] = 32;
    swift_release();
    v109[3] = 8;
    swift_release();
    if (v97) {
      uint64_t v110 = *(void *)typea;
    }
    else {
      uint64_t v110 = 7104878;
    }
    typeb = v107;
    if (v97) {
      unint64_t v111 = v97;
    }
    else {
      unint64_t v111 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    *(void *)(v0 + 1416) = sub_10001B980(v110, v111, &v258);
    sub_1000384B0();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v251, v105, "Source type: %s", v109, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    typeb(v237, v247);
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();

    v107(v108, v247);
  }
  uint64_t v112 = *(void *)(v0 + 1968);
  sub_1000380A0();
  uint64_t v113 = *(void *)(v112 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v112, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v114 = *(void *)(v113 + 16);
  if (v114)
  {
    swift_bridgeObjectRetain();
    uint64_t v115 = 0;
    while (2)
    {
      uint64_t v116 = v113 + v115++;
      switch(*(unsigned char *)(v116 + 32))
      {
        case 1:
        case 2:
        case 3:
        case 4:
          char v117 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v117) {
            goto LABEL_67;
          }
          if (v114 != v115) {
            continue;
          }
          swift_bridgeObjectRelease();
          break;
        default:
          swift_bridgeObjectRelease();
LABEL_67:
          swift_bridgeObjectRelease_n();
          *(void *)(v0 + 2416) = **(void **)(v0 + 1432);
          *(unsigned char *)(v0 + 2734) = 1;
          uint64_t v142 = sub_1000383E0();
          uint64_t v144 = v143;
          uint64_t v145 = sub_10000BFD0;
          goto LABEL_97;
      }
      break;
    }
  }
  swift_bridgeObjectRelease();
  sub_100020740(v0 + 928, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_10001DF94, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10001DFC4);
  *(void *)(v0 + 2440) = 0;
  uint64_t v118 = *(void *)(v0 + 1960);
  sub_1000380A0();
  uint64_t v119 = *(void *)(v118 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v118, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v120 = *(void *)(v119 + 16);
  if (v120)
  {
    swift_bridgeObjectRetain();
    uint64_t v121 = 0;
    while (2)
    {
      uint64_t v122 = v119 + v121++;
      switch(*(unsigned char *)(v122 + 32))
      {
        case 4:
          swift_bridgeObjectRelease();
          goto LABEL_73;
        default:
          char v123 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v123)
          {
LABEL_73:
            swift_bridgeObjectRelease();
            uint64_t v151 = *(void **)(v0 + 1432);
            swift_bridgeObjectRelease();
            *(void *)(v0 + 2448) = *v151;
            *(unsigned char *)(v0 + 2736) = 2;
            uint64_t v142 = sub_1000383E0();
            uint64_t v144 = v152;
            uint64_t v145 = sub_10000DBE4;
            goto LABEL_97;
          }
          if (v120 != v121) {
            continue;
          }
          swift_bridgeObjectRelease_n();
          break;
      }
      break;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 2552) = 0;
  uint64_t v124 = *(void *)(v0 + 1952);
  sub_1000380A0();
  uint64_t v125 = *(void *)(v124 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v124, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v126 = *(void *)(v125 + 16);
  if (v126)
  {
    swift_bridgeObjectRetain();
    uint64_t v127 = 0;
    while (2)
    {
      uint64_t v128 = v125 + v127++;
      switch(*(unsigned char *)(v128 + 32))
      {
        case 1:
          swift_bridgeObjectRelease();
          goto LABEL_83;
        default:
          char v129 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v129)
          {
LABEL_83:
            swift_bridgeObjectRelease();
            uint64_t v211 = *(void **)(v0 + 1432);
            swift_bridgeObjectRelease();
            *(void *)(v0 + 2560) = *v211;
            *(unsigned char *)(v0 + 2739) = 2;
            uint64_t v142 = sub_1000383E0();
            uint64_t v144 = v212;
            uint64_t v145 = sub_100011A3C;
            goto LABEL_97;
          }
          if (v126 != v127) {
            continue;
          }
          swift_bridgeObjectRelease_n();
          break;
      }
      break;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  *(void *)(v0 + 2592) = 0;
  uint64_t v130 = *(void *)(v0 + 1944);
  (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 2400))(*(void *)(v0 + 1624), 1, 1, *(void *)(v0 + 1520));
  sub_1000380A0();
  uint64_t v131 = *(void *)(v130 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v130, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v132 = *(void *)(v131 + 16);
  if (v132)
  {
    swift_bridgeObjectRetain();
    uint64_t v133 = 0;
    while (1)
    {
      uint64_t v134 = v131 + v133++;
      switch(*(unsigned char *)(v134 + 32))
      {
        case 2:
          swift_bridgeObjectRelease();
          goto LABEL_85;
        default:
          char v135 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v135)
          {
LABEL_85:
            swift_bridgeObjectRelease();
            char v213 = *(unsigned char *)(v0 + 2743);
            swift_bridgeObjectRelease();
            if (v213)
            {
              swift_bridgeObjectRelease();
            }
            else
            {
              char v214 = sub_100038700();
              swift_bridgeObjectRelease();
              if ((v214 & 1) == 0)
              {
                *(void *)(v0 + 2640) = 0;
                *(void *)(v0 + 2648) = **(void **)(v0 + 1432);
                *(unsigned char *)(v0 + 2740) = 2;
                uint64_t v142 = sub_1000383E0();
                uint64_t v144 = v227;
                uint64_t v145 = sub_100015360;
                goto LABEL_97;
              }
            }
            uint64_t v215 = *(void *)(v0 + 2216);
            uint64_t v216 = *(void *)(v0 + 1448);
            uint64_t v217 = *(void *)(v0 + 1440);
            sub_100020974(*(void *)(v0 + 1624), &qword_1000440F0);
            swift_beginAccess();
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v216 + 48))(v215, 1, v217)) {
              (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 2400))(*(void *)(v0 + 1616), 1, 1, *(void *)(v0 + 1520));
            }
            else {
              sub_1000205CC(*(void *)(v0 + 2216) + *(int *)(*(void *)(v0 + 1440) + 20), *(void *)(v0 + 1616), &qword_1000440F0);
            }
            uint64_t v218 = *(void *)(v0 + 1680);
            uint64_t v219 = *(void *)(v0 + 1664);
            sub_1000206DC(*(void *)(v0 + 1616), *(void *)(v0 + 1624), &qword_1000440F0);
            uint64_t v220 = *(int *)(v219 + 24);
            uint64_t v221 = v218 + *(int *)(v219 + 20);
            uint64_t v222 = v218 + v220;
            uint64_t v223 = *(void *)(v218 + v220);
            uint64_t v224 = *(void *)(v222 + 8);
            *(void *)(v0 + 2600) = v224;
            swift_bridgeObjectRetain();
            uint64_t v225 = (void *)swift_task_alloc();
            *(void *)(v0 + 2608) = v225;
            *uint64_t v225 = v0;
            v225[1] = sub_1000135FC;
            return sub_100022514(v0 + 1120, v221, v223, v224);
          }
          if (v132 == v133)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_59;
          }
          break;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_59:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(v0 + 2672) = 0u;
  uint64_t v136 = *(void *)(v0 + 1936);
  sub_1000380A0();
  uint64_t v137 = *(void *)(v136 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v136, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v138 = *(void *)(v137 + 16);
  if (v138)
  {
    swift_bridgeObjectRetain();
    uint64_t v139 = 0;
    while (1)
    {
      uint64_t v140 = v137 + v139++;
      switch(*(unsigned char *)(v140 + 32))
      {
        case 3:
          swift_bridgeObjectRelease();
          goto LABEL_96;
        default:
          char v141 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v141)
          {
LABEL_96:
            swift_bridgeObjectRelease();
            v228 = *(void **)(v0 + 1432);
            swift_bridgeObjectRelease();
            *(void *)(v0 + 2688) = *v228;
            *(unsigned char *)(v0 + 2738) = 2;
            uint64_t v142 = sub_1000383E0();
            uint64_t v144 = v229;
            uint64_t v145 = sub_100016664;
            goto LABEL_97;
          }
          if (v138 == v139)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_69;
          }
          break;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_69:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v146 = *(void *)(v0 + 1648);
  uint64_t v147 = *(void *)(v0 + 1624);
  uint64_t v148 = *(void *)(v0 + 1456);
  uint64_t v149 = *(void *)(v0 + 1440);
  sub_100037C10();
  sub_1000205CC(v147, v148 + *(int *)(v149 + 20), &qword_1000440F0);
  sub_1000205CC(v146, v148 + *(int *)(v149 + 24), &qword_1000440F0);
  if (sub_100026EE0())
  {
    v150.super.isa = sub_1000382B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v150.super.isa = 0;
  }
  typec = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2224);
  os_log_t loga = *(os_log_t *)(v0 + 2200);
  uint64_t v153 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2176);
  uint64_t v238 = *(void *)(v0 + 2160);
  uint64_t v154 = *(void *)(v0 + 2120);
  uint64_t v155 = *(void *)(v0 + 2096);
  uint64_t v248 = *(void *)(v0 + 2088);
  uint64_t v156 = *(void *)(v0 + 2072);
  uint64_t v157 = *(void *)(v0 + 2064);
  uint64_t v158 = *(void *)(v0 + 1976);
  uint64_t v232 = *(void *)(v0 + 1832);
  uint64_t v234 = *(void *)(v0 + 1808);
  sub_1000380A0();
  sub_100026558();
  sub_1000207F4(v158, type metadata accessor for ZeoliteExtensionConfig);
  NSString v159 = sub_100038300();
  swift_bridgeObjectRelease();
  [loga setValue:v150.super.isa forKey:v159];

  swift_unknownObjectRelease();
  typec(v232, v238, v234);
  v153(v155, v154, v157);
  v153(v248, v155, v157);
  unint64_t v160 = (*(unsigned __int8 *)(v156 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v156 + 80);
  uint64_t v161 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v156 + 32))(v161 + v160, v155, v157);
  uint64_t v162 = sub_100038240();
  os_log_type_t v163 = sub_100038460();
  uint64_t v164 = swift_allocObject();
  *(unsigned char *)(v164 + 16) = 32;
  uint64_t v165 = swift_allocObject();
  *(unsigned char *)(v165 + 16) = 8;
  uint64_t v166 = swift_allocObject();
  *(void *)(v166 + 16) = sub_10001E01C;
  *(void *)(v166 + 24) = v161;
  uint64_t v167 = swift_allocObject();
  *(void *)(v167 + 16) = sub_100020BC0;
  *(void *)(v167 + 24) = v166;
  uint64_t v168 = swift_allocObject();
  *(_OWORD *)(v168 + 16) = xmmword_10003ADC0;
  *(void *)(v168 + 32) = sub_100020C40;
  *(void *)(v168 + 40) = v164;
  *(void *)(v168 + 48) = sub_100020C40;
  *(void *)(v168 + 56) = v165;
  *(void *)(v168 + 64) = sub_100020BC8;
  *(void *)(v168 + 72) = v167;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  BOOL v169 = os_log_type_enabled(v162, v163);
  uint64_t v170 = *(void *)(v0 + 2088);
  uint64_t v171 = *(void *)(v0 + 2072);
  v255 = v162;
  if (v169)
  {
    os_log_type_t v245 = v163;
    uint64_t v172 = *(void *)(v0 + 1976);
    uint64_t v256 = *(void *)(v0 + 1832);
    uint64_t v249 = *(void *)(v0 + 1816);
    os_log_t v252 = *(os_log_t *)(v0 + 1808);
    uint64_t v173 = *(void *)(v0 + 2064);
    uint64_t v174 = (uint8_t *)swift_slowAlloc();
    uint64_t v258 = swift_slowAlloc();
    *(_WORD *)uint64_t v174 = 258;
    v174[2] = 32;
    swift_release();
    v174[3] = 8;
    swift_release();
    sub_1000380A0();
    uint64_t v175 = sub_100026558();
    uint64_t v235 = v170;
    unint64_t v177 = v176;
    sub_1000207F4(v172, type metadata accessor for ZeoliteExtensionConfig);
    *(void *)(v0 + 1408) = sub_10001B980(v175, v177, &v258);
    sub_1000384B0();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v178 = *(void (**)(uint64_t, uint64_t))(v171 + 8);
    v178(v235, v173);
    _os_log_impl((void *)&_mh_execute_header, v255, v245, "Execution state saved for %s.", v174, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    os_log_t v179 = v252;
    os_log_t v253 = *(os_log_t *)(v249 + 8);
  }
  else
  {
    uint64_t v256 = *(void *)(v0 + 1832);
    uint64_t v180 = *(void *)(v0 + 1816);
    os_log_t v254 = *(os_log_t *)(v0 + 1808);
    uint64_t v181 = *(void *)(v0 + 2064);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v178 = *(void (**)(uint64_t, uint64_t))(v171 + 8);
    v178(v170, v181);

    os_log_t v179 = v254;
    os_log_t v253 = *(os_log_t *)(v180 + 8);
  }
  ((void (*)(uint64_t, os_log_t))v253)(v256, v179);
  *(void *)(v0 + 2696) = v178;
  uint64_t v182 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2224);
  uint64_t v183 = *(void *)(v0 + 2160);
  uint64_t v184 = *(void *)(v0 + 1824);
  uint64_t v185 = *(void *)(v0 + 1808);
  uint64_t v186 = *(void *)(v0 + 1704);
  uint64_t v187 = *(void *)(v0 + 1696);
  uint64_t v188 = *(void *)(v0 + 1688);
  sub_100038510();
  uint64_t v189 = sub_100038520();
  uint64_t v191 = v190;
  uint64_t v192 = *(void (**)(uint64_t, uint64_t))(v187 + 8);
  *(void *)(v0 + 2704) = v192;
  *(void *)(v0 + 2712) = (v187 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v192(v186, v188);
  v182(v184, v183, v185);
  uint64_t v193 = swift_allocObject();
  *(void *)(v193 + 16) = v189;
  *(void *)(v193 + 24) = v191;
  uint64_t v194 = swift_allocObject();
  *(void *)(v194 + 16) = sub_10001E0B0;
  *(void *)(v194 + 24) = v193;
  swift_retain();
  v195 = sub_100038240();
  os_log_type_t v196 = sub_100038460();
  uint64_t v197 = swift_allocObject();
  *(unsigned char *)(v197 + 16) = 32;
  uint64_t v198 = swift_allocObject();
  *(unsigned char *)(v198 + 16) = 8;
  uint64_t v199 = swift_allocObject();
  *(void *)(v199 + 16) = sub_10001E0BC;
  *(void *)(v199 + 24) = v194;
  uint64_t v200 = swift_allocObject();
  *(void *)(v200 + 16) = sub_100020BC0;
  *(void *)(v200 + 24) = v199;
  uint64_t v201 = swift_allocObject();
  *(_OWORD *)(v201 + 16) = xmmword_10003ADC0;
  *(void *)(v201 + 32) = sub_100020C40;
  *(void *)(v201 + 40) = v197;
  *(void *)(v201 + 48) = sub_100020C40;
  *(void *)(v201 + 56) = v198;
  *(void *)(v201 + 64) = sub_100020BC8;
  *(void *)(v201 + 72) = v200;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  unint64_t v257 = v195;
  BOOL v202 = os_log_type_enabled(v195, v196);
  uint64_t v203 = *(void *)(v0 + 1824);
  uint64_t v204 = *(void *)(v0 + 1808);
  if (v202)
  {
    *(void *)os_log_type_t v246 = *(void *)(v0 + 1824);
    uint64_t v243 = *(void *)(v0 + 1808);
    uint64_t v205 = (uint8_t *)swift_slowAlloc();
    uint64_t v258 = swift_slowAlloc();
    *(_WORD *)uint64_t v205 = 258;
    v205[2] = 32;
    swift_release();
    v205[3] = 8;
    swift_release();
    uint64_t v206 = sub_100038800();
    *(void *)(v0 + 1400) = sub_10001B980(v206, v207, &v258);
    sub_1000384B0();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v257, v196, "Time elapsed: %s.", v205, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v208 = v243;
    uint64_t v209 = *(void *)v246;
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();

    uint64_t v209 = v203;
    uint64_t v208 = v204;
  }
  ((void (*)(uint64_t, uint64_t))v253)(v209, v208);
  *(void *)(v0 + 2720) = **(void **)(v0 + 1432);
  *(unsigned char *)(v0 + 2742) = 4;
  uint64_t v142 = sub_1000383E0();
  uint64_t v144 = v210;
  uint64_t v145 = sub_10001775C;
LABEL_97:
  return _swift_task_switch(v145, v142, v144);
}

uint64_t sub_10000BFD0()
{
  sub_100038010();
  return _swift_task_switch(sub_10000C04C, 0, 0);
}

uint64_t sub_10000C04C()
{
  uint64_t v1 = *(void *)(v0 + 2216);
  uint64_t v2 = *(void *)(v0 + 1448);
  uint64_t v3 = *(void *)(v0 + 1440);
  swift_beginAccess();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3)) {
    (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 2400))(*(void *)(v0 + 1640), 1, 1, *(void *)(v0 + 1520));
  }
  else {
    sub_1000205CC(*(void *)(v0 + 2216) + *(int *)(*(void *)(v0 + 1440) + 24), *(void *)(v0 + 1640), &qword_1000440F0);
  }
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 2424) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_10000C174;
  uint64_t v5 = *(void *)(v0 + 1640);
  uint64_t v6 = *(void *)(v0 + 1632);
  return sub_100017D3C(v6, v0 + 16, v5);
}

uint64_t sub_10000C174(uint64_t a1, char a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2 + 928;
  *(void *)(v3 + 2432) = a1;
  *(unsigned char *)(v3 + 2745) = a2;
  swift_task_dealloc();
  sub_100020740(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_10001DF94, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10001DFC4);
  return _swift_task_switch(sub_10000C2AC, 0, 0);
}

uint64_t sub_10000C2AC()
{
  uint64_t v166 = v0;
  int v1 = *(unsigned __int8 *)(v0 + 2745);
  uint64_t v2 = *(void *)(v0 + 1648);
  uint64_t v3 = *(void *)(v0 + 1632);
  sub_100020974(v2, &qword_1000440F0);
  sub_1000206DC(v3, v2, &qword_1000440F0);
  uint64_t v4 = *(void *)(v0 + 2432);
  if (v1 != 17)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v11 = sub_100038240();
    os_log_type_t v12 = sub_100038480();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Failed to run extract step.", v13, 2u);
      swift_slowDealloc();
    }
    char v14 = *(unsigned char *)(v0 + 2745);
    uint64_t v15 = *(void **)(v0 + 2200);
    NSString v159 = *(void (**)(uint64_t, uint64_t))(v0 + 2192);
    uint64_t v151 = *(void *)(v0 + 2064);
    uint64_t v156 = *(void *)(v0 + 2120);
    uint64_t v146 = *(void *)(v0 + 1712);
    uint64_t v16 = *(void *)(v0 + 1696);
    uint64_t v17 = *(void *)(v0 + 1688);
    uint64_t v18 = *(void *)(v0 + 1680);
    uint64_t v19 = *(void *)(v0 + 1648);
    uint64_t v20 = *(void *)(v0 + 1640);

    uint64_t v164 = &type metadata for ZeoliteExtensionError;
    unint64_t v165 = sub_10001E124();
    LOBYTE(v163[0]) = v14;
    id v21 = objc_allocWithZone((Class)sub_100038060());
    uint64_t v140 = sub_100038040();

    swift_release();
    sub_100020974(v20, &qword_1000440F0);
    sub_100020974(v19, &qword_1000440F0);
    sub_1000207F4(v18, type metadata accessor for EmbedParameters);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v146, v17);
    goto LABEL_13;
  }
  if (v4 && !*(void *)(v4 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v30 = sub_100038240();
    os_log_type_t v31 = sub_100038460();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Extracted empty data.", v32, 2u);
      swift_slowDealloc();
    }
    NSString v33 = *(void **)(v0 + 2200);
    NSString v159 = *(void (**)(uint64_t, uint64_t))(v0 + 2192);
    uint64_t v151 = *(void *)(v0 + 2064);
    uint64_t v156 = *(void *)(v0 + 2120);
    uint64_t v34 = *(void *)(v0 + 1712);
    uint64_t v35 = *(void *)(v0 + 1696);
    uint64_t v36 = *(void *)(v0 + 1688);
    uint64_t v37 = *(void *)(v0 + 1680);
    uint64_t v38 = *(void *)(v0 + 1648);
    uint64_t v39 = *(void *)(v0 + 1640);

    uint64_t v164 = &type metadata for ZeoliteExtensionError;
    unint64_t v165 = sub_10001E124();
    LOBYTE(v163[0]) = 7;
    id v40 = objc_allocWithZone((Class)sub_100038060());
    uint64_t v140 = sub_100038040();

    swift_release();
    sub_100020974(v39, &qword_1000440F0);
    sub_100020974(v38, &qword_1000440F0);
    sub_1000207F4(v37, type metadata accessor for EmbedParameters);
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
LABEL_13:
    v159(v156, v151);
    swift_release();
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v22 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v22(v140);
  }
  sub_100020974(*(void *)(v0 + 1640), &qword_1000440F0);
  *(void *)(v0 + 2440) = *(void *)(v0 + 2432);
  uint64_t v5 = *(void *)(v0 + 1960);
  sub_1000380A0();
  uint64_t v6 = *(void *)(v5 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v5, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = 0;
    while (2)
    {
      uint64_t v9 = v6 + v8++;
      switch(*(unsigned char *)(v9 + 32))
      {
        case 4:
          swift_bridgeObjectRelease();
          goto LABEL_48;
        default:
          char v10 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v10)
          {
LABEL_48:
            swift_bridgeObjectRelease();
            long long v58 = *(void **)(v0 + 1432);
            swift_bridgeObjectRelease();
            *(void *)(v0 + 2448) = *v58;
            *(unsigned char *)(v0 + 2736) = 2;
            uint64_t v59 = sub_1000383E0();
            uint64_t v61 = v60;
            uint64_t v62 = sub_10000DBE4;
            goto LABEL_72;
          }
          if (v7 != v8) {
            continue;
          }
          swift_bridgeObjectRelease_n();
          break;
      }
      break;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 2552) = 0;
  uint64_t v24 = *(void *)(v0 + 1952);
  sub_1000380A0();
  uint64_t v25 = *(void *)(v24 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v24, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v26 = *(void *)(v25 + 16);
  if (v26)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = 0;
    while (2)
    {
      uint64_t v28 = v25 + v27++;
      switch(*(unsigned char *)(v28 + 32))
      {
        case 1:
          swift_bridgeObjectRelease();
          goto LABEL_58;
        default:
          char v29 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v29)
          {
LABEL_58:
            swift_bridgeObjectRelease();
            uint64_t v122 = *(void **)(v0 + 1432);
            swift_bridgeObjectRelease();
            *(void *)(v0 + 2560) = *v122;
            *(unsigned char *)(v0 + 2739) = 2;
            uint64_t v59 = sub_1000383E0();
            uint64_t v61 = v123;
            uint64_t v62 = sub_100011A3C;
            goto LABEL_72;
          }
          if (v26 != v27) {
            continue;
          }
          swift_bridgeObjectRelease_n();
          break;
      }
      break;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  *(void *)(v0 + 2592) = 0;
  uint64_t v41 = *(void *)(v0 + 1944);
  (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 2400))(*(void *)(v0 + 1624), 1, 1, *(void *)(v0 + 1520));
  sub_1000380A0();
  uint64_t v42 = *(void *)(v41 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v41, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v43 = *(void *)(v42 + 16);
  if (v43)
  {
    swift_bridgeObjectRetain();
    uint64_t v44 = 0;
    while (1)
    {
      uint64_t v45 = v42 + v44++;
      switch(*(unsigned char *)(v45 + 32))
      {
        case 2:
          swift_bridgeObjectRelease();
          goto LABEL_60;
        default:
          char v46 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v46)
          {
LABEL_60:
            swift_bridgeObjectRelease();
            char v124 = *(unsigned char *)(v0 + 2743);
            swift_bridgeObjectRelease();
            if (v124)
            {
              swift_bridgeObjectRelease();
            }
            else
            {
              char v125 = sub_100038700();
              swift_bridgeObjectRelease();
              if ((v125 & 1) == 0)
              {
                *(void *)(v0 + 2640) = 0;
                *(void *)(v0 + 2648) = **(void **)(v0 + 1432);
                *(unsigned char *)(v0 + 2740) = 2;
                uint64_t v59 = sub_1000383E0();
                uint64_t v61 = v137;
                uint64_t v62 = sub_100015360;
                goto LABEL_72;
              }
            }
            uint64_t v126 = *(void *)(v0 + 2216);
            uint64_t v127 = *(void *)(v0 + 1448);
            uint64_t v128 = *(void *)(v0 + 1440);
            sub_100020974(*(void *)(v0 + 1624), &qword_1000440F0);
            swift_beginAccess();
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v127 + 48))(v126, 1, v128)) {
              (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 2400))(*(void *)(v0 + 1616), 1, 1, *(void *)(v0 + 1520));
            }
            else {
              sub_1000205CC(*(void *)(v0 + 2216) + *(int *)(*(void *)(v0 + 1440) + 20), *(void *)(v0 + 1616), &qword_1000440F0);
            }
            uint64_t v129 = *(void *)(v0 + 1680);
            uint64_t v130 = *(void *)(v0 + 1664);
            sub_1000206DC(*(void *)(v0 + 1616), *(void *)(v0 + 1624), &qword_1000440F0);
            uint64_t v131 = *(int *)(v130 + 24);
            uint64_t v132 = v129 + *(int *)(v130 + 20);
            uint64_t v133 = v129 + v131;
            uint64_t v134 = *(void *)(v129 + v131);
            uint64_t v135 = *(void *)(v133 + 8);
            *(void *)(v0 + 2600) = v135;
            swift_bridgeObjectRetain();
            uint64_t v136 = (void *)swift_task_alloc();
            *(void *)(v0 + 2608) = v136;
            *uint64_t v136 = v0;
            v136[1] = sub_1000135FC;
            return sub_100022514(v0 + 1120, v132, v134, v135);
          }
          if (v43 == v44)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_36;
          }
          break;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_36:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(v0 + 2672) = 0u;
  uint64_t v47 = *(void *)(v0 + 1936);
  sub_1000380A0();
  uint64_t v48 = *(void *)(v47 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v47, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v49 = *(void *)(v48 + 16);
  if (v49)
  {
    swift_bridgeObjectRetain();
    uint64_t v50 = 0;
    while (1)
    {
      uint64_t v51 = v48 + v50++;
      switch(*(unsigned char *)(v51 + 32))
      {
        case 3:
          swift_bridgeObjectRelease();
          goto LABEL_71;
        default:
          char v52 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v52)
          {
LABEL_71:
            swift_bridgeObjectRelease();
            uint64_t v138 = *(void **)(v0 + 1432);
            swift_bridgeObjectRelease();
            *(void *)(v0 + 2688) = *v138;
            *(unsigned char *)(v0 + 2738) = 2;
            uint64_t v59 = sub_1000383E0();
            uint64_t v61 = v139;
            uint64_t v62 = sub_100016664;
            goto LABEL_72;
          }
          if (v49 == v50)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_44;
          }
          break;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_44:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v53 = *(void *)(v0 + 1648);
  uint64_t v54 = *(void *)(v0 + 1624);
  uint64_t v55 = *(void *)(v0 + 1456);
  uint64_t v56 = *(void *)(v0 + 1440);
  sub_100037C10();
  sub_1000205CC(v54, v55 + *(int *)(v56 + 20), &qword_1000440F0);
  sub_1000205CC(v53, v55 + *(int *)(v56 + 24), &qword_1000440F0);
  if (sub_100026EE0())
  {
    v57.super.isa = sub_1000382B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v57.super.isa = 0;
  }
  uint64_t v147 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2224);
  uint64_t v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2176);
  uint64_t v145 = *(void *)(v0 + 2160);
  uint64_t v64 = *(void *)(v0 + 2120);
  uint64_t v65 = *(void *)(v0 + 2096);
  uint64_t v152 = *(void *)(v0 + 2088);
  uint64_t v66 = *(void *)(v0 + 2072);
  uint64_t v67 = *(void *)(v0 + 2064);
  uint64_t v68 = *(void *)(v0 + 1976);
  char v141 = *(void **)(v0 + 2200);
  uint64_t v142 = *(void *)(v0 + 1832);
  uint64_t v144 = *(void *)(v0 + 1808);
  sub_1000380A0();
  sub_100026558();
  sub_1000207F4(v68, type metadata accessor for ZeoliteExtensionConfig);
  NSString v69 = sub_100038300();
  swift_bridgeObjectRelease();
  [v141 setValue:v57.super.isa forKey:v69];

  swift_unknownObjectRelease();
  v147(v142, v145, v144);
  v63(v65, v64, v67);
  v63(v152, v65, v67);
  unint64_t v70 = (*(unsigned __int8 *)(v66 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80);
  uint64_t v71 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v66 + 32))(v71 + v70, v65, v67);
  uint64_t v72 = sub_100038240();
  os_log_type_t v73 = sub_100038460();
  uint64_t v74 = swift_allocObject();
  *(unsigned char *)(v74 + 16) = 32;
  uint64_t v75 = swift_allocObject();
  *(unsigned char *)(v75 + 16) = 8;
  uint64_t v76 = swift_allocObject();
  *(void *)(v76 + 16) = sub_10001E01C;
  *(void *)(v76 + 24) = v71;
  uint64_t v77 = swift_allocObject();
  *(void *)(v77 + 16) = sub_100020BC0;
  *(void *)(v77 + 24) = v76;
  uint64_t v78 = swift_allocObject();
  *(_OWORD *)(v78 + 16) = xmmword_10003ADC0;
  *(void *)(v78 + 32) = sub_100020C40;
  *(void *)(v78 + 40) = v74;
  *(void *)(v78 + 48) = sub_100020C40;
  *(void *)(v78 + 56) = v75;
  *(void *)(v78 + 64) = sub_100020BC8;
  *(void *)(v78 + 72) = v77;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  os_log_type_t v157 = v73;
  BOOL v79 = os_log_type_enabled(v72, v73);
  uint64_t v80 = *(void *)(v0 + 2088);
  uint64_t v81 = *(void *)(v0 + 2072);
  uint64_t v82 = *(void *)(v0 + 2064);
  unint64_t v160 = v72;
  if (v79)
  {
    uint64_t v83 = *(void *)(v0 + 1976);
    uint64_t v148 = *(void *)(v0 + 1816);
    uint64_t v150 = *(void *)(v0 + 1808);
    uint64_t v153 = *(void *)(v0 + 1832);
    uint64_t v84 = *(void *)(v0 + 2064);
    unint64_t v85 = (uint8_t *)swift_slowAlloc();
    v163[0] = swift_slowAlloc();
    *(_WORD *)unint64_t v85 = 258;
    v85[2] = 32;
    swift_release();
    v85[3] = 8;
    swift_release();
    sub_1000380A0();
    uint64_t v86 = sub_100026558();
    uint64_t v143 = v80;
    unint64_t v88 = v87;
    sub_1000207F4(v83, type metadata accessor for ZeoliteExtensionConfig);
    *(void *)(v0 + 1408) = sub_10001B980(v86, v88, v163);
    sub_1000384B0();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v89 = *(void (**)(uint64_t, uint64_t))(v81 + 8);
    v89(v143, v84);
    _os_log_impl((void *)&_mh_execute_header, v160, v157, "Execution state saved for %s.", v85, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v90 = v153;
    uint64_t v154 = *(void (**)(uint64_t, uint64_t))(v148 + 8);
    v154(v90, v150);
  }
  else
  {
    uint64_t v91 = *(void *)(v0 + 1816);
    uint64_t v155 = *(void *)(v0 + 1808);
    uint64_t v158 = *(void *)(v0 + 1832);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v89 = *(void (**)(uint64_t, uint64_t))(v81 + 8);
    v89(v80, v82);

    uint64_t v92 = v155;
    uint64_t v154 = *(void (**)(uint64_t, uint64_t))(v91 + 8);
    v154(v158, v92);
  }
  *(void *)(v0 + 2696) = v89;
  char v93 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2224);
  uint64_t v94 = *(void *)(v0 + 2160);
  uint64_t v95 = *(void *)(v0 + 1824);
  uint64_t v96 = *(void *)(v0 + 1808);
  uint64_t v97 = *(void *)(v0 + 1704);
  uint64_t v98 = *(void *)(v0 + 1696);
  uint64_t v99 = *(void *)(v0 + 1688);
  sub_100038510();
  uint64_t v100 = sub_100038520();
  uint64_t v102 = v101;
  uint64_t v103 = *(void (**)(uint64_t, uint64_t))(v98 + 8);
  *(void *)(v0 + 2704) = v103;
  *(void *)(v0 + 2712) = (v98 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v103(v97, v99);
  v93(v95, v94, v96);
  uint64_t v104 = swift_allocObject();
  *(void *)(v104 + 16) = v100;
  *(void *)(v104 + 24) = v102;
  uint64_t v105 = swift_allocObject();
  *(void *)(v105 + 16) = sub_10001E0B0;
  *(void *)(v105 + 24) = v104;
  swift_retain();
  BOOL v106 = sub_100038240();
  os_log_type_t v107 = sub_100038460();
  uint64_t v108 = swift_allocObject();
  *(unsigned char *)(v108 + 16) = 32;
  uint64_t v109 = swift_allocObject();
  *(unsigned char *)(v109 + 16) = 8;
  uint64_t v110 = swift_allocObject();
  *(void *)(v110 + 16) = sub_10001E0BC;
  *(void *)(v110 + 24) = v105;
  uint64_t v111 = swift_allocObject();
  *(void *)(v111 + 16) = sub_100020BC0;
  *(void *)(v111 + 24) = v110;
  uint64_t v112 = swift_allocObject();
  *(_OWORD *)(v112 + 16) = xmmword_10003ADC0;
  *(void *)(v112 + 32) = sub_100020C40;
  *(void *)(v112 + 40) = v108;
  *(void *)(v112 + 48) = sub_100020C40;
  *(void *)(v112 + 56) = v109;
  *(void *)(v112 + 64) = sub_100020BC8;
  *(void *)(v112 + 72) = v111;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  uint64_t v162 = v106;
  BOOL v113 = os_log_type_enabled(v106, v107);
  uint64_t v114 = *(void *)(v0 + 1824);
  uint64_t v115 = *(void *)(v0 + 1808);
  if (v113)
  {
    uint64_t v161 = *(void *)(v0 + 1824);
    uint64_t v149 = *(void *)(v0 + 1808);
    uint64_t v116 = (uint8_t *)swift_slowAlloc();
    v163[0] = swift_slowAlloc();
    *(_WORD *)uint64_t v116 = 258;
    v116[2] = 32;
    swift_release();
    v116[3] = 8;
    swift_release();
    uint64_t v117 = sub_100038800();
    *(void *)(v0 + 1400) = sub_10001B980(v117, v118, v163);
    sub_1000384B0();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v162, v107, "Time elapsed: %s.", v116, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v119 = v149;
    uint64_t v120 = v161;
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();

    uint64_t v120 = v114;
    uint64_t v119 = v115;
  }
  v154(v120, v119);
  *(void *)(v0 + 2720) = **(void **)(v0 + 1432);
  *(unsigned char *)(v0 + 2742) = 4;
  uint64_t v59 = sub_1000383E0();
  uint64_t v61 = v121;
  uint64_t v62 = sub_10001775C;
LABEL_72:
  return _swift_task_switch(v62, v59, v61);
}

uint64_t sub_10000DBE4()
{
  sub_100038010();
  return _swift_task_switch(sub_10000DC60, 0, 0);
}

uint64_t sub_10000DC60()
{
  uint64_t v141 = v0;
  uint64_t v1 = *(void *)(v0 + 2440);
  sub_100037D30();
  swift_allocObject();
  swift_bridgeObjectRetain();
  *(void *)(v0 + 2456) = sub_100037D20();
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 2440);
    uint64_t v3 = *(void *)(v2 + 16);
    *(void *)(v0 + 2464) = v3;
    if (v3)
    {
      uint64_t v4 = *(void *)(v0 + 1568);
      uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
      v4 += 16;
      int v6 = *(_DWORD *)(v4 + 64);
      *(_DWORD *)(v0 + 2728) = v6;
      *(void *)(v0 + 2472) = *(void *)(v4 + 56);
      *(void *)(v0 + 2480) = v5;
      uint64_t v7 = *(void *)(v0 + 2248);
      *(void *)(v0 + 2496) = 0;
      *(void *)(v0 + 2488) = v7;
      uint64_t v8 = *(void *)(v0 + 2392);
      uint64_t v9 = *(void *)(v0 + 1592);
      uint64_t v10 = *(void *)(v0 + 1560);
      uint64_t v11 = v2 + ((v6 + 32) & ~(unint64_t)v6);
      *(void *)(v0 + 2504) = v4 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      swift_bridgeObjectRetain();
      v5(v9, v11, v10);
      uint64_t v12 = sub_100037E00();
      uint64_t v14 = v13;
      *(void *)(v0 + 2512) = v13;
      uint64_t v138 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of TokenGeneratorBase.process(system:user:)
                                                                        + async function pointer to dispatch thunk of TokenGeneratorBase.process(system:user:));
      uint64_t v15 = (void *)swift_task_alloc();
      *(void *)(v0 + 2520) = v15;
      void *v15 = v0;
      v15[1] = sub_10000EE84;
      uint64_t v16 = *(void *)(v0 + 2384);
      return v138(v16, v8, v12, v14);
    }
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 2552) = 0;
  uint64_t v18 = *(void *)(v0 + 1952);
  sub_1000380A0();
  uint64_t v19 = *(void *)(v18 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v18, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v20 = *(void *)(v19 + 16);
  if (v20)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = 0;
    while (2)
    {
      uint64_t v22 = v19 + v21++;
      switch(*(unsigned char *)(v22 + 32))
      {
        case 1:
          swift_bridgeObjectRelease();
          goto LABEL_41;
        default:
          char v23 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v23)
          {
LABEL_41:
            swift_bridgeObjectRelease();
            uint64_t v103 = *(void **)(v0 + 1432);
            swift_bridgeObjectRelease();
            *(void *)(v0 + 2560) = *v103;
            *(unsigned char *)(v0 + 2739) = 2;
            uint64_t v99 = sub_1000383E0();
            uint64_t v101 = v104;
            uint64_t v102 = sub_100011A3C;
            goto LABEL_55;
          }
          if (v20 != v21) {
            continue;
          }
          swift_bridgeObjectRelease_n();
          break;
      }
      break;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  *(void *)(v0 + 2592) = 0;
  uint64_t v24 = *(void *)(v0 + 1944);
  (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 2400))(*(void *)(v0 + 1624), 1, 1, *(void *)(v0 + 1520));
  sub_1000380A0();
  uint64_t v25 = *(void *)(v24 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v24, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v26 = *(void *)(v25 + 16);
  if (v26)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = 0;
    while (1)
    {
      uint64_t v28 = v25 + v27++;
      switch(*(unsigned char *)(v28 + 32))
      {
        case 2:
          swift_bridgeObjectRelease();
          goto LABEL_43;
        default:
          char v29 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v29)
          {
LABEL_43:
            swift_bridgeObjectRelease();
            char v105 = *(unsigned char *)(v0 + 2743);
            swift_bridgeObjectRelease();
            if (v105)
            {
              swift_bridgeObjectRelease();
            }
            else
            {
              char v106 = sub_100038700();
              swift_bridgeObjectRelease();
              if ((v106 & 1) == 0)
              {
                *(void *)(v0 + 2640) = 0;
                *(void *)(v0 + 2648) = **(void **)(v0 + 1432);
                *(unsigned char *)(v0 + 2740) = 2;
                uint64_t v99 = sub_1000383E0();
                uint64_t v101 = v118;
                uint64_t v102 = sub_100015360;
                goto LABEL_55;
              }
            }
            uint64_t v107 = *(void *)(v0 + 2216);
            uint64_t v108 = *(void *)(v0 + 1448);
            uint64_t v109 = *(void *)(v0 + 1440);
            sub_100020974(*(void *)(v0 + 1624), &qword_1000440F0);
            swift_beginAccess();
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v108 + 48))(v107, 1, v109)) {
              (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 2400))(*(void *)(v0 + 1616), 1, 1, *(void *)(v0 + 1520));
            }
            else {
              sub_1000205CC(*(void *)(v0 + 2216) + *(int *)(*(void *)(v0 + 1440) + 20), *(void *)(v0 + 1616), &qword_1000440F0);
            }
            uint64_t v110 = *(void *)(v0 + 1680);
            uint64_t v111 = *(void *)(v0 + 1664);
            sub_1000206DC(*(void *)(v0 + 1616), *(void *)(v0 + 1624), &qword_1000440F0);
            uint64_t v112 = *(int *)(v111 + 24);
            uint64_t v113 = v110 + *(int *)(v111 + 20);
            uint64_t v114 = v110 + v112;
            uint64_t v115 = *(void *)(v110 + v112);
            uint64_t v116 = *(void *)(v114 + 8);
            *(void *)(v0 + 2600) = v116;
            swift_bridgeObjectRetain();
            uint64_t v117 = (void *)swift_task_alloc();
            *(void *)(v0 + 2608) = v117;
            void *v117 = v0;
            v117[1] = sub_1000135FC;
            return sub_100022514(v0 + 1120, v113, v115, v116);
          }
          if (v26 == v27)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_21;
          }
          break;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_21:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(v0 + 2672) = 0u;
  uint64_t v30 = *(void *)(v0 + 1936);
  sub_1000380A0();
  uint64_t v31 = *(void *)(v30 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v30, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v32 = *(void *)(v31 + 16);
  if (v32)
  {
    swift_bridgeObjectRetain();
    uint64_t v33 = 0;
    while (1)
    {
      uint64_t v34 = v31 + v33++;
      switch(*(unsigned char *)(v34 + 32))
      {
        case 3:
          swift_bridgeObjectRelease();
          goto LABEL_54;
        default:
          char v35 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v35)
          {
LABEL_54:
            swift_bridgeObjectRelease();
            uint64_t v119 = *(void **)(v0 + 1432);
            swift_bridgeObjectRelease();
            *(void *)(v0 + 2688) = *v119;
            *(unsigned char *)(v0 + 2738) = 2;
            uint64_t v99 = sub_1000383E0();
            uint64_t v101 = v120;
            uint64_t v102 = sub_100016664;
            goto LABEL_55;
          }
          if (v32 == v33)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_29;
          }
          break;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_29:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v36 = *(void *)(v0 + 1648);
  uint64_t v37 = *(void *)(v0 + 1624);
  uint64_t v38 = *(void *)(v0 + 1456);
  uint64_t v39 = *(void *)(v0 + 1440);
  sub_100037C10();
  sub_1000205CC(v37, v38 + *(int *)(v39 + 20), &qword_1000440F0);
  sub_1000205CC(v36, v38 + *(int *)(v39 + 24), &qword_1000440F0);
  if (sub_100026EE0())
  {
    v40.super.isa = sub_1000382B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v40.super.isa = 0;
  }
  uint64_t v126 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2224);
  uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2176);
  uint64_t v125 = *(void *)(v0 + 2160);
  uint64_t v42 = *(void *)(v0 + 2120);
  uint64_t v43 = *(void *)(v0 + 2096);
  uint64_t v130 = *(void *)(v0 + 2088);
  uint64_t v44 = *(void *)(v0 + 2072);
  uint64_t v45 = *(void *)(v0 + 2064);
  uint64_t v46 = *(void *)(v0 + 1976);
  id v121 = *(id *)(v0 + 2200);
  uint64_t v122 = *(void *)(v0 + 1832);
  uint64_t v124 = *(void *)(v0 + 1808);
  sub_1000380A0();
  sub_100026558();
  sub_1000207F4(v46, type metadata accessor for ZeoliteExtensionConfig);
  NSString v47 = sub_100038300();
  swift_bridgeObjectRelease();
  [v121 setValue:v40.super.isa forKey:v47];

  swift_unknownObjectRelease();
  v126(v122, v125, v124);
  v41(v43, v42, v45);
  v41(v130, v43, v45);
  unint64_t v48 = (*(unsigned __int8 *)(v44 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
  uint64_t v49 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v44 + 32))(v49 + v48, v43, v45);
  uint64_t v50 = sub_100038240();
  os_log_type_t v51 = sub_100038460();
  uint64_t v52 = swift_allocObject();
  *(unsigned char *)(v52 + 16) = 32;
  uint64_t v53 = swift_allocObject();
  *(unsigned char *)(v53 + 16) = 8;
  uint64_t v54 = swift_allocObject();
  *(void *)(v54 + 16) = sub_10001E01C;
  *(void *)(v54 + 24) = v49;
  uint64_t v55 = swift_allocObject();
  *(void *)(v55 + 16) = sub_100020BC0;
  *(void *)(v55 + 24) = v54;
  uint64_t v56 = swift_allocObject();
  *(_OWORD *)(v56 + 16) = xmmword_10003ADC0;
  *(void *)(v56 + 32) = sub_100020C40;
  *(void *)(v56 + 40) = v52;
  *(void *)(v56 + 48) = sub_100020C40;
  *(void *)(v56 + 56) = v53;
  *(void *)(v56 + 64) = sub_100020BC8;
  *(void *)(v56 + 72) = v55;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  os_log_type_t type = v51;
  BOOL v57 = os_log_type_enabled(v50, v51);
  uint64_t v58 = *(void *)(v0 + 2088);
  uint64_t v59 = *(void *)(v0 + 2072);
  uint64_t v60 = *(void *)(v0 + 2064);
  log = v50;
  if (v57)
  {
    uint64_t v61 = *(void *)(v0 + 1976);
    uint64_t v127 = *(void *)(v0 + 1816);
    uint64_t v129 = *(void *)(v0 + 1808);
    uint64_t v131 = *(void *)(v0 + 1832);
    uint64_t v62 = *(void *)(v0 + 2064);
    uint64_t v63 = (uint8_t *)swift_slowAlloc();
    uint64_t v140 = swift_slowAlloc();
    *(_WORD *)uint64_t v63 = 258;
    v63[2] = 32;
    swift_release();
    v63[3] = 8;
    swift_release();
    sub_1000380A0();
    uint64_t v64 = sub_100026558();
    uint64_t v123 = v58;
    unint64_t v66 = v65;
    sub_1000207F4(v61, type metadata accessor for ZeoliteExtensionConfig);
    *(void *)(v0 + 1408) = sub_10001B980(v64, v66, &v140);
    sub_1000384B0();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v67 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
    v67(v123, v62);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Execution state saved for %s.", v63, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v68 = v131;
    uint64_t v132 = *(void (**)(uint64_t, uint64_t))(v127 + 8);
    v132(v68, v129);
  }
  else
  {
    uint64_t v69 = *(void *)(v0 + 1816);
    uint64_t v133 = *(void *)(v0 + 1808);
    *(void *)typea = *(void *)(v0 + 1832);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v67 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
    v67(v58, v60);

    uint64_t v70 = v133;
    uint64_t v132 = *(void (**)(uint64_t, uint64_t))(v69 + 8);
    v132(*(void *)typea, v70);
  }
  *(void *)(v0 + 2696) = v67;
  uint64_t v71 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2224);
  uint64_t v72 = *(void *)(v0 + 2160);
  uint64_t v73 = *(void *)(v0 + 1824);
  uint64_t v74 = *(void *)(v0 + 1808);
  uint64_t v75 = *(void *)(v0 + 1704);
  uint64_t v76 = *(void *)(v0 + 1696);
  uint64_t v77 = *(void *)(v0 + 1688);
  sub_100038510();
  uint64_t v78 = sub_100038520();
  uint64_t v80 = v79;
  uint64_t v81 = *(void (**)(uint64_t, uint64_t))(v76 + 8);
  *(void *)(v0 + 2704) = v81;
  *(void *)(v0 + 2712) = (v76 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v81(v75, v77);
  v71(v73, v72, v74);
  uint64_t v82 = swift_allocObject();
  *(void *)(v82 + 16) = v78;
  *(void *)(v82 + 24) = v80;
  uint64_t v83 = swift_allocObject();
  *(void *)(v83 + 16) = sub_10001E0B0;
  *(void *)(v83 + 24) = v82;
  swift_retain();
  uint64_t v84 = sub_100038240();
  os_log_type_t v85 = sub_100038460();
  uint64_t v86 = swift_allocObject();
  *(unsigned char *)(v86 + 16) = 32;
  uint64_t v87 = swift_allocObject();
  *(unsigned char *)(v87 + 16) = 8;
  uint64_t v88 = swift_allocObject();
  *(void *)(v88 + 16) = sub_10001E0BC;
  *(void *)(v88 + 24) = v83;
  uint64_t v89 = swift_allocObject();
  *(void *)(v89 + 16) = sub_100020BC0;
  *(void *)(v89 + 24) = v88;
  uint64_t v90 = swift_allocObject();
  *(_OWORD *)(v90 + 16) = xmmword_10003ADC0;
  *(void *)(v90 + 32) = sub_100020C40;
  *(void *)(v90 + 40) = v86;
  *(void *)(v90 + 48) = sub_100020C40;
  *(void *)(v90 + 56) = v87;
  *(void *)(v90 + 64) = sub_100020BC8;
  *(void *)(v90 + 72) = v89;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  uint64_t v139 = v84;
  BOOL v91 = os_log_type_enabled(v84, v85);
  uint64_t v92 = *(NSObject **)(v0 + 1824);
  uint64_t v93 = *(void *)(v0 + 1808);
  if (v91)
  {
    os_log_t loga = *(os_log_t *)(v0 + 1824);
    uint64_t v128 = *(void *)(v0 + 1808);
    uint64_t v94 = (uint8_t *)swift_slowAlloc();
    uint64_t v140 = swift_slowAlloc();
    *(_WORD *)uint64_t v94 = 258;
    v94[2] = 32;
    swift_release();
    v94[3] = 8;
    swift_release();
    uint64_t v95 = sub_100038800();
    *(void *)(v0 + 1400) = sub_10001B980(v95, v96, &v140);
    sub_1000384B0();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v139, v85, "Time elapsed: %s.", v94, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v97 = v128;
    os_log_t v98 = loga;
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();

    os_log_t v98 = v92;
    uint64_t v97 = v93;
  }
  v132((uint64_t)v98, v97);
  *(void *)(v0 + 2720) = **(void **)(v0 + 1432);
  *(unsigned char *)(v0 + 2742) = 4;
  uint64_t v99 = sub_1000383E0();
  uint64_t v101 = v100;
  uint64_t v102 = sub_10001775C;
LABEL_55:
  return _swift_task_switch(v102, v99, v101);
}

uint64_t sub_10000EE84(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 2528) = v2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_errorRelease();
    uint64_t v7 = sub_100010770;
  }
  else
  {
    *(void *)(v6 + 2536) = a2;
    *(void *)(v6 + 2544) = a1;
    uint64_t v7 = sub_10000EFD8;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_10000EFD8()
{
  uint64_t v185 = v0;
  os_log_t logb = *(os_log_t *)(v0 + 2536);
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2480);
  uint64_t v179 = *(void *)(v0 + 2544);
  uint64_t v2 = *(void *)(v0 + 1592);
  uint64_t v3 = *(void *)(v0 + 1584);
  uint64_t v4 = *(void *)(v0 + 1568);
  uint64_t v5 = *(void *)(v0 + 1560);
  unint64_t v6 = (*(unsigned __int8 *)(v0 + 2728) + 16) & ~(unint64_t)*(unsigned __int8 *)(v0 + 2728);
  (*(void (**)(void, void, void))(v0 + 2224))(*(void *)(v0 + 1880), *(void *)(v0 + 2160), *(void *)(v0 + 1808));
  v1(v3, v2, v5);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v7 + v6, v3, v5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v179;
  *(void *)(v8 + 24) = logb;
  uint64_t v9 = sub_100038240();
  os_log_type_t v180 = sub_100038460();
  uint64_t v10 = swift_allocObject();
  *(unsigned char *)(v10 + 16) = 32;
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = 8;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_1000202F8;
  *(void *)(v12 + 24) = v7;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_100020BC0;
  *(void *)(v13 + 24) = v12;
  uint64_t v14 = swift_allocObject();
  *(unsigned char *)(v14 + 16) = 32;
  uint64_t v15 = swift_allocObject();
  *(unsigned char *)(v15 + 16) = 8;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_100020390;
  *(void *)(v16 + 24) = v8;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_100020BC0;
  *(void *)(v17 + 24) = v16;
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_10003ADF0;
  *(void *)(v18 + 32) = sub_100020C40;
  *(void *)(v18 + 40) = v10;
  *(void *)(v18 + 48) = sub_100020C40;
  *(void *)(v18 + 56) = v11;
  *(void *)(v18 + 64) = sub_100020BC8;
  *(void *)(v18 + 72) = v13;
  *(void *)(v18 + 80) = sub_100020C40;
  *(void *)(v18 + 88) = v14;
  *(void *)(v18 + 96) = sub_100020C40;
  *(void *)(v18 + 104) = v15;
  *(void *)(v18 + 112) = sub_100020BC8;
  *(void *)(v18 + 120) = v17;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v9, v180))
  {
    log = v9;
    uint64_t v19 = *(void *)(v0 + 2528);
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(void *)(v0 + 1384) = 0;
    *(void *)(v0 + 1392) = v21;
    *(_WORD *)uint64_t v20 = 514;
    v20[2] = *(unsigned char *)(v10 + 16);
    *(void *)(v0 + 1352) = v20 + 3;
    if (v19)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      return swift_errorRelease();
    }
    os_log_t v176 = (os_log_t)(v0 + 2248);
    uint64_t v151 = *(void *)(v0 + 1808);
    uint64_t v154 = *(void *)(v0 + 1880);
    os_log_type_t v163 = *(void (**)(uint64_t, uint64_t))(v0 + 2248);
    uint64_t v166 = *(void *)(v0 + 1592);
    uint64_t v156 = *(void *)(v0 + 1568);
    uint64_t v158 = *(void *)(v0 + 1560);
    swift_release();
    uint64_t v26 = *(unsigned char **)(v0 + 1352);
    *uint64_t v26 = *(unsigned char *)(v11 + 16);
    *(void *)(v0 + 1352) = v26 + 1;
    swift_release();
    sub_10001B908((uint64_t *)(v0 + 1352), v0 + 1384, (uint64_t *)(v0 + 1392), *(uint64_t (**)(void))(v13 + 16));
    swift_release();
    uint64_t v27 = *(unsigned char **)(v0 + 1352);
    unsigned char *v27 = *(unsigned char *)(v14 + 16);
    *(void *)(v0 + 1352) = v27 + 1;
    swift_release();
    uint64_t v28 = *(unsigned char **)(v0 + 1352);
    *uint64_t v28 = *(unsigned char *)(v15 + 16);
    *(void *)(v0 + 1352) = v28 + 1;
    swift_release();
    sub_10001B908((uint64_t *)(v0 + 1352), v0 + 1384, (uint64_t *)(v0 + 1392), *(uint64_t (**)(void))(v17 + 16));
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, log, v180, "input text:%s \n generated text: %s", v20, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v163(v154, v151);
    (*(void (**)(uint64_t, uint64_t))(v156 + 8))(v166, v158);
  }
  else
  {
    os_log_t logc = *(os_log_t *)(v0 + 2488);
    os_log_t v176 = (os_log_t)(v0 + 2488);
    uint64_t v23 = *(void *)(v0 + 1808);
    uint64_t v181 = *(void *)(v0 + 1592);
    uint64_t v24 = v9;
    uint64_t v25 = *(void *)(v0 + 1568);
    uint64_t v162 = *(void *)(v0 + 1880);
    uint64_t v165 = *(void *)(v0 + 1560);

    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    ((void (*)(uint64_t, uint64_t))logc)(v162, v23);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v181, v165);
  }
  uint64_t v29 = v0;
  uint64_t v30 = *(void *)(v0 + 2496) + 1;
  if (v30 == *(void *)(v0 + 2464))
  {
    uint64_t v31 = *(void *)(v0 + 2528);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v29 + 2552) = v31;
    uint64_t v32 = *(void *)(v29 + 1952);
    sub_1000380A0();
    uint64_t v33 = *(void *)(v32 + 32);
    swift_bridgeObjectRetain();
    sub_1000207F4(v32, type metadata accessor for ZeoliteExtensionConfig);
    uint64_t v34 = *(void *)(v33 + 16);
    if (v34)
    {
      swift_bridgeObjectRetain();
      uint64_t v35 = 0;
      while (2)
      {
        uint64_t v36 = v33 + v35++;
        switch(*(unsigned char *)(v36 + 32))
        {
          case 1:
            swift_bridgeObjectRelease();
            goto LABEL_47;
          default:
            char v37 = sub_100038700();
            swift_bridgeObjectRelease();
            if (v37)
            {
LABEL_47:
              swift_bridgeObjectRelease();
              uint64_t v135 = *(void **)(v29 + 1432);
              swift_bridgeObjectRelease();
              *(void *)(v29 + 2560) = *v135;
              *(unsigned char *)(v29 + 2739) = 2;
              uint64_t v67 = sub_1000383E0();
              uint64_t v69 = v136;
              uint64_t v70 = sub_100011A3C;
              goto LABEL_48;
            }
            if (v34 != v35) {
              continue;
            }
            swift_bridgeObjectRelease_n();
            break;
        }
        break;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    *(void *)(v29 + 2592) = 0;
    uint64_t v49 = *(void *)(v29 + 1944);
    (*(void (**)(void, uint64_t, uint64_t, void))(v29 + 2400))(*(void *)(v29 + 1624), 1, 1, *(void *)(v29 + 1520));
    sub_1000380A0();
    uint64_t v50 = *(void *)(v49 + 32);
    swift_bridgeObjectRetain();
    sub_1000207F4(v49, type metadata accessor for ZeoliteExtensionConfig);
    uint64_t v51 = *(void *)(v50 + 16);
    if (v51)
    {
      swift_bridgeObjectRetain();
      uint64_t v52 = 0;
      while (1)
      {
        uint64_t v53 = v50 + v52++;
        switch(*(unsigned char *)(v53 + 32))
        {
          case 2:
            swift_bridgeObjectRelease();
            goto LABEL_53;
          default:
            char v54 = sub_100038700();
            swift_bridgeObjectRelease();
            if (v54)
            {
LABEL_53:
              swift_bridgeObjectRelease();
              char v137 = *(unsigned char *)(v29 + 2743);
              swift_bridgeObjectRelease();
              if (v137)
              {
                swift_bridgeObjectRelease();
                goto LABEL_56;
              }
              char v138 = sub_100038700();
              swift_bridgeObjectRelease();
              if (v138)
              {
LABEL_56:
                uint64_t v139 = *(void *)(v29 + 2216);
                uint64_t v140 = *(void *)(v29 + 1448);
                uint64_t v141 = *(void *)(v29 + 1440);
                sub_100020974(*(void *)(v29 + 1624), &qword_1000440F0);
                swift_beginAccess();
                if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v140 + 48))(v139, 1, v141)) {
                  (*(void (**)(void, uint64_t, uint64_t, void))(v29 + 2400))(*(void *)(v29 + 1616), 1, 1, *(void *)(v29 + 1520));
                }
                else {
                  sub_1000205CC(*(void *)(v29 + 2216) + *(int *)(*(void *)(v29 + 1440) + 20), *(void *)(v29 + 1616), &qword_1000440F0);
                }
                uint64_t v142 = *(void *)(v29 + 1680);
                uint64_t v143 = *(void *)(v29 + 1664);
                sub_1000206DC(*(void *)(v29 + 1616), *(void *)(v29 + 1624), &qword_1000440F0);
                uint64_t v144 = *(int *)(v143 + 24);
                uint64_t v145 = v142 + *(int *)(v143 + 20);
                uint64_t v146 = *(void *)(v142 + v144);
                uint64_t v147 = *(void *)(v142 + v144 + 8);
                *(void *)(v29 + 2600) = v147;
                swift_bridgeObjectRetain();
                uint64_t v148 = (void *)swift_task_alloc();
                *(void *)(v29 + 2608) = v148;
                *uint64_t v148 = v29;
                v148[1] = sub_1000135FC;
                return sub_100022514(v29 + 1120, v145, v146, v147);
              }
              *(void *)(v29 + 2640) = 0;
              *(void *)(v29 + 2648) = **(void **)(v29 + 1432);
              *(unsigned char *)(v29 + 2740) = 2;
              uint64_t v67 = sub_1000383E0();
              uint64_t v69 = v149;
              uint64_t v70 = sub_100015360;
LABEL_48:
              uint64_t v134 = v70;
LABEL_49:
              return _swift_task_switch(v134, v67, v69);
            }
            if (v51 == v52)
            {
              swift_bridgeObjectRelease_n();
              goto LABEL_27;
            }
            break;
        }
      }
    }
    swift_bridgeObjectRelease();
LABEL_27:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_OWORD *)(v29 + 2672) = 0u;
    uint64_t v55 = *(void *)(v29 + 1936);
    sub_1000380A0();
    uint64_t v56 = *(void *)(v55 + 32);
    swift_bridgeObjectRetain();
    sub_1000207F4(v55, type metadata accessor for ZeoliteExtensionConfig);
    uint64_t v57 = *(void *)(v56 + 16);
    if (v57)
    {
      swift_bridgeObjectRetain();
      uint64_t v58 = 0;
      while (1)
      {
        uint64_t v59 = v56 + v58++;
        switch(*(unsigned char *)(v59 + 32))
        {
          case 3:
            swift_bridgeObjectRelease();
            goto LABEL_37;
          default:
            char v60 = sub_100038700();
            swift_bridgeObjectRelease();
            if (v60)
            {
LABEL_37:
              swift_bridgeObjectRelease();
              unint64_t v66 = *(void **)(v29 + 1432);
              swift_bridgeObjectRelease();
              *(void *)(v29 + 2688) = *v66;
              *(unsigned char *)(v29 + 2738) = 2;
              uint64_t v67 = sub_1000383E0();
              uint64_t v69 = v68;
              uint64_t v70 = sub_100016664;
              goto LABEL_48;
            }
            if (v57 == v58)
            {
              swift_bridgeObjectRelease_n();
              goto LABEL_35;
            }
            break;
        }
      }
    }
    swift_bridgeObjectRelease();
LABEL_35:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v61 = *(void *)(v29 + 1648);
    uint64_t v62 = *(void *)(v29 + 1624);
    uint64_t v63 = *(void *)(v29 + 1456);
    uint64_t v64 = *(void *)(v29 + 1440);
    sub_100037C10();
    sub_1000205CC(v62, v63 + *(int *)(v64 + 20), &qword_1000440F0);
    sub_1000205CC(v61, v63 + *(int *)(v64 + 24), &qword_1000440F0);
    if (sub_100026EE0())
    {
      v65.super.Class isa = sub_1000382B0().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      v65.super.Class isa = 0;
    }
    NSString v159 = *(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 2224);
    uint64_t v71 = *(void **)(v29 + 2200);
    uint64_t v72 = *(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 2176);
    uint64_t v157 = *(void *)(v29 + 2160);
    uint64_t v73 = *(void *)(v29 + 2120);
    uint64_t v74 = *(void *)(v29 + 2096);
    uint64_t v167 = *(void *)(v29 + 2088);
    uint64_t v75 = *(void *)(v29 + 2072);
    uint64_t v76 = *(void *)(v29 + 2064);
    uint64_t v77 = (void *)v29;
    uint64_t v78 = *(void *)(v29 + 1976);
    id v150 = v71;
    uint64_t v152 = v77[229];
    uint64_t v155 = v77[226];
    sub_1000380A0();
    sub_100026558();
    sub_1000207F4(v78, type metadata accessor for ZeoliteExtensionConfig);
    NSString v79 = sub_100038300();
    swift_bridgeObjectRelease();
    [v150 setValue:v65.super.isa forKey:v79];

    swift_unknownObjectRelease();
    v159(v152, v157, v155);
    v72(v74, v73, v76);
    v72(v167, v74, v76);
    uint64_t v80 = v77;
    unint64_t v81 = (*(unsigned __int8 *)(v75 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80);
    uint64_t v82 = swift_allocObject();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v75 + 32))(v82 + v81, v74, v76);
    uint64_t v83 = sub_100038240();
    os_log_type_t v84 = sub_100038460();
    uint64_t v85 = swift_allocObject();
    *(unsigned char *)(v85 + 16) = 32;
    uint64_t v86 = swift_allocObject();
    *(unsigned char *)(v86 + 16) = 8;
    uint64_t v87 = swift_allocObject();
    *(void *)(v87 + 16) = sub_10001E01C;
    *(void *)(v87 + 24) = v82;
    uint64_t v88 = swift_allocObject();
    *(void *)(v88 + 16) = sub_100020BC0;
    *(void *)(v88 + 24) = v87;
    uint64_t v89 = swift_allocObject();
    *(_OWORD *)(v89 + 16) = xmmword_10003ADC0;
    *(void *)(v89 + 32) = sub_100020C40;
    *(void *)(v89 + 40) = v85;
    *(void *)(v89 + 48) = sub_100020C40;
    *(void *)(v89 + 56) = v86;
    *(void *)(v89 + 64) = sub_100020BC8;
    *(void *)(v89 + 72) = v88;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t loga = v84;
    BOOL v90 = os_log_type_enabled(v83, v84);
    uint64_t v91 = v80[261];
    uint64_t v92 = v80[259];
    uint64_t v93 = v80[258];
    unint64_t v177 = v83;
    if (v90)
    {
      uint64_t v94 = v80;
      uint64_t v95 = v80[247];
      uint64_t v160 = v94[227];
      uint64_t v164 = v94[226];
      uint64_t v168 = v94[229];
      uint64_t v96 = v93;
      uint64_t v97 = (uint8_t *)swift_slowAlloc();
      uint64_t v184 = swift_slowAlloc();
      *(_WORD *)uint64_t v97 = 258;
      v97[2] = 32;
      swift_release();
      v97[3] = 8;
      swift_release();
      sub_1000380A0();
      uint64_t v98 = sub_100026558();
      uint64_t v153 = v91;
      unint64_t v100 = v99;
      sub_1000207F4(v95, type metadata accessor for ZeoliteExtensionConfig);
      v94[176] = sub_10001B980(v98, v100, &v184);
      sub_1000384B0();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v101 = *(void (**)(uint64_t, uint64_t))(v92 + 8);
      v101(v153, v96);
      _os_log_impl((void *)&_mh_execute_header, v177, loga, "Execution state saved for %s.", v97, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v102 = v168;
      BOOL v169 = *(void (**)(uint64_t, uint64_t))(v160 + 8);
      v169(v102, v164);
    }
    else
    {
      uint64_t v103 = v80[227];
      uint64_t v170 = v80[226];
      os_log_t logd = (os_log_t)v80[229];
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v101 = *(void (**)(uint64_t, uint64_t))(v92 + 8);
      v101(v91, v93);

      uint64_t v104 = v170;
      BOOL v169 = *(void (**)(uint64_t, uint64_t))(v103 + 8);
      v169((uint64_t)logd, v104);
      uint64_t v94 = v80;
    }
    v94[337] = v101;
    char v105 = (void (*)(uint64_t, uint64_t, uint64_t))v94[278];
    uint64_t v106 = v94[270];
    uint64_t v107 = v94[228];
    uint64_t v108 = v94[226];
    uint64_t v109 = v94[213];
    uint64_t v110 = v94[212];
    uint64_t v111 = v94[211];
    sub_100038510();
    uint64_t v112 = sub_100038520();
    uint64_t v114 = v113;
    uint64_t v115 = *(void (**)(uint64_t, uint64_t))(v110 + 8);
    v94[338] = v115;
    v94[339] = (v110 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v115(v109, v111);
    v105(v107, v106, v108);
    uint64_t v116 = swift_allocObject();
    *(void *)(v116 + 16) = v112;
    *(void *)(v116 + 24) = v114;
    uint64_t v117 = swift_allocObject();
    *(void *)(v117 + 16) = sub_10001E0B0;
    *(void *)(v117 + 24) = v116;
    swift_retain();
    uint64_t v118 = sub_100038240();
    os_log_type_t v119 = sub_100038460();
    uint64_t v120 = swift_allocObject();
    *(unsigned char *)(v120 + 16) = 32;
    uint64_t v121 = swift_allocObject();
    *(unsigned char *)(v121 + 16) = 8;
    uint64_t v122 = swift_allocObject();
    *(void *)(v122 + 16) = sub_10001E0BC;
    *(void *)(v122 + 24) = v117;
    uint64_t v123 = swift_allocObject();
    *(void *)(v123 + 16) = sub_100020BC0;
    *(void *)(v123 + 24) = v122;
    uint64_t v124 = swift_allocObject();
    *(_OWORD *)(v124 + 16) = xmmword_10003ADC0;
    *(void *)(v124 + 32) = sub_100020C40;
    *(void *)(v124 + 40) = v120;
    *(void *)(v124 + 48) = sub_100020C40;
    *(void *)(v124 + 56) = v121;
    *(void *)(v124 + 64) = sub_100020BC8;
    *(void *)(v124 + 72) = v123;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    uint64_t v183 = v118;
    BOOL v125 = os_log_type_enabled(v118, v119);
    uint64_t v126 = v94[228];
    uint64_t v127 = v94[226];
    if (v125)
    {
      os_log_t v178 = (os_log_t)v94[228];
      uint64_t v161 = v94[226];
      uint64_t v128 = (uint8_t *)swift_slowAlloc();
      uint64_t v184 = swift_slowAlloc();
      *(_WORD *)uint64_t v128 = 258;
      v128[2] = 32;
      swift_release();
      v128[3] = 8;
      swift_release();
      uint64_t v129 = sub_100038800();
      v94[175] = sub_10001B980(v129, v130, &v184);
      sub_1000384B0();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v183, v119, "Time elapsed: %s.", v128, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v131 = v161;
      os_log_t v132 = v178;
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();

      os_log_t v132 = v126;
      uint64_t v131 = v127;
    }
    v169((uint64_t)v132, v131);
    v94[340] = *(void *)v94[179];
    *((unsigned char *)v94 + 2742) = 4;
    uint64_t v67 = sub_1000383E0();
    uint64_t v69 = v133;
    uint64_t v134 = sub_10001775C;
    goto LABEL_49;
  }
  Class isa = v176->isa;
  *(void *)(v0 + 2496) = v30;
  *(void *)(v0 + 2488) = isa;
  uint64_t v39 = *(void (**)(uint64_t, unint64_t, uint64_t))(v0 + 2480);
  uint64_t v40 = *(void *)(v0 + 2392);
  uint64_t v41 = *(void *)(v0 + 1592);
  uint64_t v42 = *(void *)(v0 + 1560);
  unint64_t v43 = *(void *)(v0 + 2440)
      + ((*(unsigned __int8 *)(v0 + 2728) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 2728))
      + *(void *)(v0 + 2472) * v30;
  *(void *)(v0 + 2504) = (*(void *)(v0 + 1568) + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v39(v41, v43, v42);
  uint64_t v44 = sub_100037E00();
  uint64_t v46 = v45;
  *(void *)(v0 + 2512) = v45;
  uint64_t v182 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of TokenGeneratorBase.process(system:user:)
                                                                    + async function pointer to dispatch thunk of TokenGeneratorBase.process(system:user:));
  NSString v47 = (void *)swift_task_alloc();
  *(void *)(v0 + 2520) = v47;
  void *v47 = v0;
  v47[1] = sub_10000EE84;
  uint64_t v48 = *(void *)(v0 + 2384);
  return v182(v48, v40, v44, v46);
}

uint64_t sub_100010770()
{
  uint64_t v145 = v0;
  uint64_t v1 = sub_100038240();
  os_log_type_t v2 = sub_100038480();
  BOOL v3 = os_log_type_enabled(v1, v2);
  uint64_t v4 = *(void *)(v0 + 1592);
  uint64_t v5 = *(void *)(v0 + 1568);
  uint64_t v6 = *(void *)(v0 + 1560);
  if (v3)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v143 = 0;
    v144[0] = 0;
    *(_WORD *)uint64_t v7 = 0;
    uint64_t v142 = v7 + 2;
    sub_10001AFE4((uint64_t)_swiftEmptyArrayStorage, (uint64_t)&v142, (uint64_t)&v143, (uint64_t)v144);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "failed token generation!", v7, 2u);
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  }
  else
  {
    swift_bridgeObjectRelease();

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  }
  uint64_t v8 = *(void *)(v0 + 2496) + 1;
  if (v8 != *(void *)(v0 + 2464))
  {
    *(void *)(v0 + 2496) = v8;
    uint64_t v15 = *(void (**)(uint64_t, unint64_t, uint64_t))(v0 + 2480);
    uint64_t v16 = *(void *)(v0 + 2392);
    uint64_t v17 = *(void *)(v0 + 1592);
    uint64_t v18 = *(void *)(v0 + 1560);
    unint64_t v19 = *(void *)(v0 + 2440)
        + ((*(unsigned __int8 *)(v0 + 2728) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 2728))
        + *(void *)(v0 + 2472) * v8;
    *(void *)(v0 + 2504) = (*(void *)(v0 + 1568) + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v15(v17, v19, v18);
    uint64_t v20 = sub_100037E00();
    uint64_t v22 = v21;
    *(void *)(v0 + 2512) = v21;
    uint64_t v140 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of TokenGeneratorBase.process(system:user:)
                                                                      + async function pointer to dispatch thunk of TokenGeneratorBase.process(system:user:));
    uint64_t v23 = (void *)swift_task_alloc();
    *(void *)(v0 + 2520) = v23;
    *uint64_t v23 = v0;
    v23[1] = sub_10000EE84;
    uint64_t v24 = *(void *)(v0 + 2384);
    return v140(v24, v16, v20, v22);
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 2552) = 0;
  uint64_t v9 = *(void *)(v0 + 1952);
  sub_1000380A0();
  uint64_t v10 = *(void *)(v9 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v9, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v11 = *(void *)(v10 + 16);
  if (v11)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = 0;
    while (2)
    {
      uint64_t v13 = v10 + v12++;
      switch(*(unsigned char *)(v13 + 32))
      {
        case 1:
          swift_bridgeObjectRelease();
          goto LABEL_43;
        default:
          char v14 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v14)
          {
LABEL_43:
            swift_bridgeObjectRelease();
            char v105 = *(void **)(v0 + 1432);
            swift_bridgeObjectRelease();
            *(void *)(v0 + 2560) = *v105;
            *(unsigned char *)(v0 + 2739) = 2;
            uint64_t v101 = sub_1000383E0();
            uint64_t v103 = v106;
            uint64_t v104 = sub_100011A3C;
            goto LABEL_57;
          }
          if (v11 != v12) {
            continue;
          }
          swift_bridgeObjectRelease_n();
          break;
      }
      break;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  *(void *)(v0 + 2592) = 0;
  uint64_t v26 = *(void *)(v0 + 1944);
  (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 2400))(*(void *)(v0 + 1624), 1, 1, *(void *)(v0 + 1520));
  sub_1000380A0();
  uint64_t v27 = *(void *)(v26 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v26, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v28 = *(void *)(v27 + 16);
  if (v28)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = 0;
    while (1)
    {
      uint64_t v30 = v27 + v29++;
      switch(*(unsigned char *)(v30 + 32))
      {
        case 2:
          swift_bridgeObjectRelease();
          goto LABEL_45;
        default:
          char v31 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v31)
          {
LABEL_45:
            swift_bridgeObjectRelease();
            char v107 = *(unsigned char *)(v0 + 2743);
            swift_bridgeObjectRelease();
            if (v107)
            {
              swift_bridgeObjectRelease();
            }
            else
            {
              char v108 = sub_100038700();
              swift_bridgeObjectRelease();
              if ((v108 & 1) == 0)
              {
                *(void *)(v0 + 2640) = 0;
                *(void *)(v0 + 2648) = **(void **)(v0 + 1432);
                *(unsigned char *)(v0 + 2740) = 2;
                uint64_t v101 = sub_1000383E0();
                uint64_t v103 = v120;
                uint64_t v104 = sub_100015360;
                goto LABEL_57;
              }
            }
            uint64_t v109 = *(void *)(v0 + 2216);
            uint64_t v110 = *(void *)(v0 + 1448);
            uint64_t v111 = *(void *)(v0 + 1440);
            sub_100020974(*(void *)(v0 + 1624), &qword_1000440F0);
            swift_beginAccess();
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v110 + 48))(v109, 1, v111)) {
              (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 2400))(*(void *)(v0 + 1616), 1, 1, *(void *)(v0 + 1520));
            }
            else {
              sub_1000205CC(*(void *)(v0 + 2216) + *(int *)(*(void *)(v0 + 1440) + 20), *(void *)(v0 + 1616), &qword_1000440F0);
            }
            uint64_t v112 = *(void *)(v0 + 1680);
            uint64_t v113 = *(void *)(v0 + 1664);
            sub_1000206DC(*(void *)(v0 + 1616), *(void *)(v0 + 1624), &qword_1000440F0);
            uint64_t v114 = *(int *)(v113 + 24);
            uint64_t v115 = v112 + *(int *)(v113 + 20);
            uint64_t v116 = v112 + v114;
            uint64_t v117 = *(void *)(v112 + v114);
            uint64_t v118 = *(void *)(v116 + 8);
            *(void *)(v0 + 2600) = v118;
            swift_bridgeObjectRetain();
            os_log_type_t v119 = (void *)swift_task_alloc();
            *(void *)(v0 + 2608) = v119;
            *os_log_type_t v119 = v0;
            v119[1] = sub_1000135FC;
            return sub_100022514(v0 + 1120, v115, v117, v118);
          }
          if (v28 == v29)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_23;
          }
          break;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_23:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(v0 + 2672) = 0u;
  uint64_t v32 = *(void *)(v0 + 1936);
  sub_1000380A0();
  uint64_t v33 = *(void *)(v32 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v32, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v34 = *(void *)(v33 + 16);
  if (v34)
  {
    swift_bridgeObjectRetain();
    uint64_t v35 = 0;
    while (1)
    {
      uint64_t v36 = v33 + v35++;
      switch(*(unsigned char *)(v36 + 32))
      {
        case 3:
          swift_bridgeObjectRelease();
          goto LABEL_56;
        default:
          char v37 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v37)
          {
LABEL_56:
            swift_bridgeObjectRelease();
            uint64_t v121 = *(void **)(v0 + 1432);
            swift_bridgeObjectRelease();
            *(void *)(v0 + 2688) = *v121;
            *(unsigned char *)(v0 + 2738) = 2;
            uint64_t v101 = sub_1000383E0();
            uint64_t v103 = v122;
            uint64_t v104 = sub_100016664;
            goto LABEL_57;
          }
          if (v34 == v35)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_31;
          }
          break;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_31:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v38 = *(void *)(v0 + 1648);
  uint64_t v39 = *(void *)(v0 + 1624);
  uint64_t v40 = *(void *)(v0 + 1456);
  uint64_t v41 = *(void *)(v0 + 1440);
  sub_100037C10();
  sub_1000205CC(v39, v40 + *(int *)(v41 + 20), &qword_1000440F0);
  sub_1000205CC(v38, v40 + *(int *)(v41 + 24), &qword_1000440F0);
  if (sub_100026EE0())
  {
    v42.super.Class isa = sub_1000382B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v42.super.Class isa = 0;
  }
  uint64_t v128 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2224);
  unint64_t v43 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2176);
  uint64_t v127 = *(void *)(v0 + 2160);
  uint64_t v44 = *(void *)(v0 + 2120);
  uint64_t v45 = *(void *)(v0 + 2096);
  uint64_t v132 = *(void *)(v0 + 2088);
  uint64_t v46 = *(void *)(v0 + 2072);
  uint64_t v47 = *(void *)(v0 + 2064);
  uint64_t v48 = *(void *)(v0 + 1976);
  id v123 = *(id *)(v0 + 2200);
  uint64_t v124 = *(void *)(v0 + 1832);
  uint64_t v126 = *(void *)(v0 + 1808);
  sub_1000380A0();
  sub_100026558();
  sub_1000207F4(v48, type metadata accessor for ZeoliteExtensionConfig);
  NSString v49 = sub_100038300();
  swift_bridgeObjectRelease();
  [v123 setValue:v42.super.isa forKey:v49];

  swift_unknownObjectRelease();
  v128(v124, v127, v126);
  v43(v45, v44, v47);
  v43(v132, v45, v47);
  unint64_t v50 = (*(unsigned __int8 *)(v46 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
  uint64_t v51 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v46 + 32))(v51 + v50, v45, v47);
  uint64_t v52 = sub_100038240();
  os_log_type_t v53 = sub_100038460();
  uint64_t v54 = swift_allocObject();
  *(unsigned char *)(v54 + 16) = 32;
  uint64_t v55 = swift_allocObject();
  *(unsigned char *)(v55 + 16) = 8;
  uint64_t v56 = swift_allocObject();
  *(void *)(v56 + 16) = sub_10001E01C;
  *(void *)(v56 + 24) = v51;
  uint64_t v57 = swift_allocObject();
  *(void *)(v57 + 16) = sub_100020BC0;
  *(void *)(v57 + 24) = v56;
  uint64_t v58 = swift_allocObject();
  *(_OWORD *)(v58 + 16) = xmmword_10003ADC0;
  *(void *)(v58 + 32) = sub_100020C40;
  *(void *)(v58 + 40) = v54;
  *(void *)(v58 + 48) = sub_100020C40;
  *(void *)(v58 + 56) = v55;
  *(void *)(v58 + 64) = sub_100020BC8;
  *(void *)(v58 + 72) = v57;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  os_log_type_t type = v53;
  BOOL v59 = os_log_type_enabled(v52, v53);
  uint64_t v60 = *(void *)(v0 + 2088);
  uint64_t v61 = *(void *)(v0 + 2072);
  uint64_t v62 = *(void *)(v0 + 2064);
  log = v52;
  if (v59)
  {
    uint64_t v63 = *(void *)(v0 + 1976);
    uint64_t v129 = *(void *)(v0 + 1816);
    uint64_t v131 = *(void *)(v0 + 1808);
    uint64_t v133 = *(void *)(v0 + 1832);
    uint64_t v64 = *(void *)(v0 + 2064);
    NSDictionary v65 = (uint8_t *)swift_slowAlloc();
    v144[0] = swift_slowAlloc();
    *(_WORD *)NSDictionary v65 = 258;
    v65[2] = 32;
    swift_release();
    v65[3] = 8;
    swift_release();
    sub_1000380A0();
    uint64_t v66 = sub_100026558();
    uint64_t v125 = v60;
    unint64_t v68 = v67;
    sub_1000207F4(v63, type metadata accessor for ZeoliteExtensionConfig);
    *(void *)(v0 + 1408) = sub_10001B980(v66, v68, v144);
    sub_1000384B0();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v69 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
    v69(v125, v64);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Execution state saved for %s.", v65, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v70 = v133;
    uint64_t v134 = *(void (**)(uint64_t, uint64_t))(v129 + 8);
    v134(v70, v131);
  }
  else
  {
    uint64_t v71 = *(void *)(v0 + 1816);
    uint64_t v135 = *(void *)(v0 + 1808);
    *(void *)typea = *(void *)(v0 + 1832);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v69 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
    v69(v60, v62);

    uint64_t v72 = v135;
    uint64_t v134 = *(void (**)(uint64_t, uint64_t))(v71 + 8);
    v134(*(void *)typea, v72);
  }
  *(void *)(v0 + 2696) = v69;
  uint64_t v73 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2224);
  uint64_t v74 = *(void *)(v0 + 2160);
  uint64_t v75 = *(void *)(v0 + 1824);
  uint64_t v76 = *(void *)(v0 + 1808);
  uint64_t v77 = *(void *)(v0 + 1704);
  uint64_t v78 = *(void *)(v0 + 1696);
  uint64_t v79 = *(void *)(v0 + 1688);
  sub_100038510();
  uint64_t v80 = sub_100038520();
  uint64_t v82 = v81;
  uint64_t v83 = *(void (**)(uint64_t, uint64_t))(v78 + 8);
  *(void *)(v0 + 2704) = v83;
  *(void *)(v0 + 2712) = (v78 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v83(v77, v79);
  v73(v75, v74, v76);
  uint64_t v84 = swift_allocObject();
  *(void *)(v84 + 16) = v80;
  *(void *)(v84 + 24) = v82;
  uint64_t v85 = swift_allocObject();
  *(void *)(v85 + 16) = sub_10001E0B0;
  *(void *)(v85 + 24) = v84;
  swift_retain();
  uint64_t v86 = sub_100038240();
  os_log_type_t v87 = sub_100038460();
  uint64_t v88 = swift_allocObject();
  *(unsigned char *)(v88 + 16) = 32;
  uint64_t v89 = swift_allocObject();
  *(unsigned char *)(v89 + 16) = 8;
  uint64_t v90 = swift_allocObject();
  *(void *)(v90 + 16) = sub_10001E0BC;
  *(void *)(v90 + 24) = v85;
  uint64_t v91 = swift_allocObject();
  *(void *)(v91 + 16) = sub_100020BC0;
  *(void *)(v91 + 24) = v90;
  uint64_t v92 = swift_allocObject();
  *(_OWORD *)(v92 + 16) = xmmword_10003ADC0;
  *(void *)(v92 + 32) = sub_100020C40;
  *(void *)(v92 + 40) = v88;
  *(void *)(v92 + 48) = sub_100020C40;
  *(void *)(v92 + 56) = v89;
  *(void *)(v92 + 64) = sub_100020BC8;
  *(void *)(v92 + 72) = v91;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  uint64_t v141 = v86;
  BOOL v93 = os_log_type_enabled(v86, v87);
  uint64_t v94 = *(NSObject **)(v0 + 1824);
  uint64_t v95 = *(void *)(v0 + 1808);
  if (v93)
  {
    os_log_t loga = *(os_log_t *)(v0 + 1824);
    uint64_t v130 = *(void *)(v0 + 1808);
    uint64_t v96 = (uint8_t *)swift_slowAlloc();
    v144[0] = swift_slowAlloc();
    *(_WORD *)uint64_t v96 = 258;
    v96[2] = 32;
    swift_release();
    v96[3] = 8;
    swift_release();
    uint64_t v97 = sub_100038800();
    *(void *)(v0 + 1400) = sub_10001B980(v97, v98, v144);
    sub_1000384B0();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v141, v87, "Time elapsed: %s.", v96, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v99 = v130;
    os_log_t v100 = loga;
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();

    os_log_t v100 = v94;
    uint64_t v99 = v95;
  }
  v134((uint64_t)v100, v99);
  *(void *)(v0 + 2720) = **(void **)(v0 + 1432);
  *(unsigned char *)(v0 + 2742) = 4;
  uint64_t v101 = sub_1000383E0();
  uint64_t v103 = v102;
  uint64_t v104 = sub_10001775C;
LABEL_57:
  return _swift_task_switch(v104, v101, v103);
}

uint64_t sub_100011A3C()
{
  sub_100038010();
  return _swift_task_switch(sub_100011AB8, 0, 0);
}

uint64_t sub_100011AB8()
{
  swift_beginAccess();
  uint64_t v1 = v0[162];
  uint64_t v2 = v0[163];
  v0[321] = v2;
  swift_bridgeObjectRetain();
  BOOL v3 = (void *)swift_task_alloc();
  v0[322] = v3;
  *BOOL v3 = v0;
  v3[1] = sub_100011B8C;
  uint64_t v4 = v0[305];
  uint64_t v5 = v0[210];
  return sub_100018834(v4, v5, v1, v2);
}

uint64_t sub_100011B8C(uint64_t a1, char a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 2584) = a1;
  *(unsigned char *)(v3 + 2746) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_100011CCC, 0, 0);
}

uint64_t sub_100011CCC()
{
  uint64_t v176 = v0;
  if (*(unsigned char *)(v0 + 2746) != 17)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_100038240();
    os_log_type_t v4 = sub_100038480();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed to complete embed step.", v5, 2u);
      swift_slowDealloc();
    }
    char v6 = *(unsigned char *)(v0 + 2746);
    uint64_t v7 = *(void **)(v0 + 2200);
    uint64_t v153 = *(void *)(v0 + 2120);
    uint64_t v156 = *(void (**)(uint64_t, uint64_t))(v0 + 2192);
    uint64_t v149 = *(void *)(v0 + 2064);
    uint64_t v8 = *(void *)(v0 + 1712);
    uint64_t v9 = *(void *)(v0 + 1696);
    uint64_t v10 = *(void *)(v0 + 1688);
    uint64_t v11 = *(void *)(v0 + 1680);
    uint64_t v12 = *(void *)(v0 + 1648);

    uint64_t v174 = &type metadata for ZeoliteExtensionError;
    unint64_t v175 = sub_10001E124();
    LOBYTE(v173[0]) = v6;
    id v13 = objc_allocWithZone((Class)sub_100038060());
    uint64_t v168 = sub_100038040();

    swift_release();
    sub_100020974(v12, &qword_1000440F0);
    sub_1000207F4(v11, type metadata accessor for EmbedParameters);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    v156(v153, v149);
    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  uint64_t v1 = *(void *)(v0 + 2584);
  if ((*(unsigned char *)(v0 + 2744) & 1) == 0)
  {
    char v2 = sub_100038700();
    swift_bridgeObjectRelease();
    if ((v2 & 1) == 0 || !v1)
    {
LABEL_26:
      uint64_t v34 = *(void *)(v0 + 2584);
      goto LABEL_27;
    }
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();
  if (v1)
  {
LABEL_10:
    uint64_t v14 = *(void *)(v0 + 2584);
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_100038110();
    uint64_t v16 = sub_100003B98(v14, v15);
    unsigned __int8 v18 = v17;
    int v19 = v17;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v19 == 17)
    {
      (*(void (**)(void, void, void))(v0 + 2224))(*(void *)(v0 + 1872), *(void *)(v0 + 2160), *(void *)(v0 + 1808));
      uint64_t v20 = swift_allocObject();
      *(void *)(v20 + 16) = v16;
      uint64_t v21 = sub_100038240();
      os_log_type_t v22 = sub_100038460();
      uint64_t v23 = swift_allocObject();
      *(unsigned char *)(v23 + 16) = 0;
      uint64_t v24 = swift_allocObject();
      *(unsigned char *)(v24 + 16) = 8;
      uint64_t v25 = swift_allocObject();
      *(void *)(v25 + 16) = sub_1000201C0;
      *(void *)(v25 + 24) = v20;
      uint64_t v26 = swift_allocObject();
      *(void *)(v26 + 16) = sub_100020BC4;
      *(void *)(v26 + 24) = v25;
      uint64_t v27 = swift_allocObject();
      *(_OWORD *)(v27 + 16) = xmmword_10003ADC0;
      *(void *)(v27 + 32) = sub_100020C40;
      *(void *)(v27 + 40) = v23;
      *(void *)(v27 + 48) = sub_100020C40;
      *(void *)(v27 + 56) = v24;
      *(void *)(v27 + 64) = sub_1000200F8;
      *(void *)(v27 + 72) = v26;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v28 = *(void *)(v0 + 2552);
        uint64_t v29 = swift_slowAlloc();
        *(_WORD *)uint64_t v29 = 256;
        *(unsigned char *)(v29 + 2) = *(unsigned char *)(v23 + 16);
        if (v28)
        {
          swift_bridgeObjectRelease();
          swift_release();
          return swift_errorRelease();
        }
        uint64_t v45 = (uint8_t *)v29;
        uint64_t v165 = *(void *)(v0 + 1872);
        BOOL v169 = *(void (**)(uint64_t, uint64_t))(v0 + 2248);
        uint64_t v46 = *(void *)(v0 + 1808);
        swift_release();
        v45[3] = *(unsigned char *)(v24 + 16);
        uint64_t v47 = swift_release();
        (*(void (**)(uint64_t *__return_ptr, uint64_t))(v26 + 16))(v173, v47);
        sub_1000384B0();
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Sent %ld events to Biome.", v45, 0xCu);
        swift_slowDealloc();

        v169(v165, v46);
      }
      else
      {
        uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v0 + 2248);
        uint64_t v36 = *(void *)(v0 + 1872);
        uint64_t v37 = *(void *)(v0 + 1808);
        swift_release();
        swift_release();
        swift_release();

        v35(v36, v37);
      }
      goto LABEL_26;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v31 = sub_100038240();
    os_log_type_t v32 = sub_100038480();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v172 = 0;
      v173[0] = 0;
      *(_WORD *)uint64_t v33 = 0;
      uint64_t v171 = v33 + 2;
      sub_10001AFE4((uint64_t)&_swiftEmptyArrayStorage, (uint64_t)&v171, (uint64_t)&v172, (uint64_t)v173);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Failed to send events to Biome", v33, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    uint64_t v38 = *(void **)(v0 + 2200);
    uint64_t v162 = *(void (**)(uint64_t, uint64_t))(v0 + 2192);
    uint64_t v154 = *(void *)(v0 + 2064);
    uint64_t v157 = *(void *)(v0 + 2120);
    uint64_t v147 = *(void *)(v0 + 1712);
    uint64_t v39 = *(void *)(v0 + 1696);
    uint64_t v40 = *(void *)(v0 + 1688);
    uint64_t v41 = *(void *)(v0 + 1680);
    uint64_t v42 = *(void *)(v0 + 1648);
    uint64_t v174 = &type metadata for ZeoliteExtensionError;
    unint64_t v175 = sub_10001E124();
    LOBYTE(v173[0]) = v18;
    id v43 = objc_allocWithZone((Class)sub_100038060());
    uint64_t v168 = sub_100038040();

    swift_release();
    sub_100020974(v42, &qword_1000440F0);
    sub_1000207F4(v41, type metadata accessor for EmbedParameters);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v147, v40);
    v162(v157, v154);
    swift_bridgeObjectRelease();
    swift_release();
LABEL_22:
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v44 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v44(v168);
  }
  uint64_t v34 = 0;
LABEL_27:
  *(void *)(v0 + 2592) = v34;
  uint64_t v48 = *(void *)(v0 + 1944);
  (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 2400))(*(void *)(v0 + 1624), 1, 1, *(void *)(v0 + 1520));
  sub_1000380A0();
  uint64_t v49 = *(void *)(v48 + 32);
  swift_bridgeObjectRetain();
  sub_1000207F4(v48, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v50 = *(void *)(v49 + 16);
  if (!v50)
  {
    swift_bridgeObjectRelease();
LABEL_34:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 2680) = v34;
    *(void *)(v0 + 2672) = 0;
    uint64_t v54 = *(void *)(v0 + 1936);
    sub_1000380A0();
    uint64_t v55 = *(void *)(v54 + 32);
    swift_bridgeObjectRetain();
    sub_1000207F4(v54, type metadata accessor for ZeoliteExtensionConfig);
    uint64_t v56 = *(void *)(v55 + 16);
    if (v56)
    {
      swift_bridgeObjectRetain();
      uint64_t v57 = 0;
      while (1)
      {
        uint64_t v58 = v55 + v57++;
        switch(*(unsigned char *)(v58 + 32))
        {
          case 3:
            swift_bridgeObjectRelease();
            goto LABEL_44;
          default:
            char v59 = sub_100038700();
            swift_bridgeObjectRelease();
            if (v59)
            {
LABEL_44:
              swift_bridgeObjectRelease();
              NSDictionary v65 = *(void **)(v0 + 1432);
              swift_bridgeObjectRelease();
              *(void *)(v0 + 2688) = *v65;
              *(unsigned char *)(v0 + 2738) = 2;
              uint64_t v66 = sub_1000383E0();
              uint64_t v68 = v67;
              uint64_t v69 = sub_100016664;
              goto LABEL_53;
            }
            if (v56 == v57)
            {
              swift_bridgeObjectRelease_n();
              goto LABEL_42;
            }
            break;
        }
      }
    }
    swift_bridgeObjectRelease();
LABEL_42:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v60 = *(void *)(v0 + 1648);
    uint64_t v61 = *(void *)(v0 + 1624);
    uint64_t v62 = *(void *)(v0 + 1456);
    uint64_t v63 = *(void *)(v0 + 1440);
    sub_100037C10();
    sub_1000205CC(v61, v62 + *(int *)(v63 + 20), &qword_1000440F0);
    sub_1000205CC(v60, v62 + *(int *)(v63 + 24), &qword_1000440F0);
    if (sub_100026EE0())
    {
      v64.super.Class isa = sub_1000382B0().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      v64.super.Class isa = 0;
    }
    id v150 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2224);
    uint64_t v70 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2176);
    uint64_t v148 = *(void *)(v0 + 2160);
    uint64_t v71 = *(void *)(v0 + 2120);
    uint64_t v72 = *(void *)(v0 + 2096);
    uint64_t v158 = *(void *)(v0 + 2088);
    uint64_t v73 = *(void *)(v0 + 2072);
    uint64_t v74 = *(void *)(v0 + 2064);
    uint64_t v75 = *(void *)(v0 + 1976);
    uint64_t v143 = *(void **)(v0 + 2200);
    uint64_t v144 = *(void *)(v0 + 1832);
    uint64_t v146 = *(void *)(v0 + 1808);
    sub_1000380A0();
    sub_100026558();
    sub_1000207F4(v75, type metadata accessor for ZeoliteExtensionConfig);
    NSString v76 = sub_100038300();
    swift_bridgeObjectRelease();
    [v143 setValue:v64.super.isa forKey:v76];

    swift_unknownObjectRelease();
    v150(v144, v148, v146);
    v70(v72, v71, v74);
    v70(v158, v72, v74);
    unint64_t v77 = (*(unsigned __int8 *)(v73 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80);
    uint64_t v78 = swift_allocObject();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v73 + 32))(v78 + v77, v72, v74);
    uint64_t v79 = sub_100038240();
    os_log_type_t v80 = sub_100038460();
    uint64_t v81 = swift_allocObject();
    *(unsigned char *)(v81 + 16) = 32;
    uint64_t v82 = swift_allocObject();
    *(unsigned char *)(v82 + 16) = 8;
    uint64_t v83 = swift_allocObject();
    *(void *)(v83 + 16) = sub_10001E01C;
    *(void *)(v83 + 24) = v78;
    uint64_t v84 = swift_allocObject();
    *(void *)(v84 + 16) = sub_100020BC0;
    *(void *)(v84 + 24) = v83;
    uint64_t v85 = swift_allocObject();
    *(_OWORD *)(v85 + 16) = xmmword_10003ADC0;
    *(void *)(v85 + 32) = sub_100020C40;
    *(void *)(v85 + 40) = v81;
    *(void *)(v85 + 48) = sub_100020C40;
    *(void *)(v85 + 56) = v82;
    *(void *)(v85 + 64) = sub_100020BC8;
    *(void *)(v85 + 72) = v84;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v163 = v80;
    BOOL v86 = os_log_type_enabled(v79, v80);
    uint64_t v87 = *(void *)(v0 + 2088);
    uint64_t v88 = *(void *)(v0 + 2072);
    uint64_t v89 = *(void *)(v0 + 2064);
    uint64_t v166 = v79;
    if (v86)
    {
      uint64_t v90 = *(void *)(v0 + 1976);
      uint64_t v151 = *(void *)(v0 + 1816);
      uint64_t v155 = *(void *)(v0 + 1808);
      uint64_t v159 = *(void *)(v0 + 1832);
      uint64_t v91 = *(void *)(v0 + 2064);
      uint64_t v92 = (uint8_t *)swift_slowAlloc();
      v173[0] = swift_slowAlloc();
      *(_WORD *)uint64_t v92 = 258;
      v92[2] = 32;
      swift_release();
      v92[3] = 8;
      swift_release();
      sub_1000380A0();
      uint64_t v93 = sub_100026558();
      uint64_t v145 = v87;
      unint64_t v95 = v94;
      sub_1000207F4(v90, type metadata accessor for ZeoliteExtensionConfig);
      *(void *)(v0 + 1408) = sub_10001B980(v93, v95, v173);
      sub_1000384B0();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v96 = *(void (**)(uint64_t, uint64_t))(v88 + 8);
      v96(v145, v91);
      _os_log_impl((void *)&_mh_execute_header, v166, v163, "Execution state saved for %s.", v92, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v97 = v159;
      uint64_t v160 = *(void (**)(uint64_t, uint64_t))(v151 + 8);
      v160(v97, v155);
    }
    else
    {
      uint64_t v98 = *(void *)(v0 + 1816);
      uint64_t v161 = *(void *)(v0 + 1808);
      uint64_t v164 = *(void *)(v0 + 1832);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v96 = *(void (**)(uint64_t, uint64_t))(v88 + 8);
      v96(v87, v89);

      uint64_t v99 = v161;
      uint64_t v160 = *(void (**)(uint64_t, uint64_t))(v98 + 8);
      v160(v164, v99);
    }
    *(void *)(v0 + 2696) = v96;
    os_log_t v100 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2224);
    uint64_t v101 = *(void *)(v0 + 2160);
    uint64_t v102 = *(void *)(v0 + 1824);
    uint64_t v103 = *(void *)(v0 + 1808);
    uint64_t v104 = *(void *)(v0 + 1704);
    uint64_t v105 = *(void *)(v0 + 1696);
    uint64_t v106 = *(void *)(v0 + 1688);
    sub_100038510();
    uint64_t v107 = sub_100038520();
    uint64_t v109 = v108;
    uint64_t v110 = *(void (**)(uint64_t, uint64_t))(v105 + 8);
    *(void *)(v0 + 2704) = v110;
    *(void *)(v0 + 2712) = (v105 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v110(v104, v106);
    v100(v102, v101, v103);
    uint64_t v111 = swift_allocObject();
    *(void *)(v111 + 16) = v107;
    *(void *)(v111 + 24) = v109;
    uint64_t v112 = swift_allocObject();
    *(void *)(v112 + 16) = sub_10001E0B0;
    *(void *)(v112 + 24) = v111;
    swift_retain();
    uint64_t v113 = sub_100038240();
    os_log_type_t v114 = sub_100038460();
    uint64_t v115 = swift_allocObject();
    *(unsigned char *)(v115 + 16) = 32;
    uint64_t v116 = swift_allocObject();
    *(unsigned char *)(v116 + 16) = 8;
    uint64_t v117 = swift_allocObject();
    *(void *)(v117 + 16) = sub_10001E0BC;
    *(void *)(v117 + 24) = v112;
    uint64_t v118 = swift_allocObject();
    *(void *)(v118 + 16) = sub_100020BC0;
    *(void *)(v118 + 24) = v117;
    uint64_t v119 = swift_allocObject();
    *(_OWORD *)(v119 + 16) = xmmword_10003ADC0;
    *(void *)(v119 + 32) = sub_100020C40;
    *(void *)(v119 + 40) = v115;
    *(void *)(v119 + 48) = sub_100020C40;
    *(void *)(v119 + 56) = v116;
    *(void *)(v119 + 64) = sub_100020BC8;
    *(void *)(v119 + 72) = v118;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    uint64_t v170 = v113;
    BOOL v120 = os_log_type_enabled(v113, v114);
    uint64_t v121 = *(void *)(v0 + 1824);
    uint64_t v122 = *(void *)(v0 + 1808);
    if (v120)
    {
      uint64_t v167 = *(void *)(v0 + 1824);
      uint64_t v152 = *(void *)(v0 + 1808);
      id v123 = (uint8_t *)swift_slowAlloc();
      v173[0] = swift_slowAlloc();
      *(_WORD *)id v123 = 258;
      v123[2] = 32;
      swift_release();
      v123[3] = 8;
      swift_release();
      uint64_t v124 = sub_100038800();
      *(void *)(v0 + 1400) = sub_10001B980(v124, v125, v173);
      sub_1000384B0();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v170, v114, "Time elapsed: %s.", v123, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v126 = v152;
      uint64_t v127 = v167;
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();

      uint64_t v127 = v121;
      uint64_t v126 = v122;
    }
    v160(v127, v126);
    *(void *)(v0 + 2720) = **(void **)(v0 + 1432);
    *(unsigned char *)(v0 + 2742) = 4;
    uint64_t v66 = sub_1000383E0();
    uint64_t v68 = v128;
    uint64_t v69 = sub_10001775C;
    goto LABEL_53;
  }
  swift_bridgeObjectRetain();
  uint64_t v51 = 0;
  while (2)
  {
    uint64_t v52 = v49 + v51++;
    switch(*(unsigned char *)(v52 + 32))
    {
      case 2:
        swift_bridgeObjectRelease();
        goto LABEL_57;
      default:
        char v53 = sub_100038700();
        swift_bridgeObjectRelease();
        if ((v53 & 1) == 0)
        {
          if (v50 == v51)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_34;
          }
          continue;
        }
LABEL_57:
        swift_bridgeObjectRelease();
        char v129 = *(unsigned char *)(v0 + 2743);
        swift_bridgeObjectRelease();
        if (v129)
        {
          swift_bridgeObjectRelease();
          goto LABEL_60;
        }
        char v130 = sub_100038700();
        swift_bridgeObjectRelease();
        if (v130)
        {
LABEL_60:
          uint64_t v131 = *(void *)(v0 + 2216);
          uint64_t v132 = *(void *)(v0 + 1448);
          uint64_t v133 = *(void *)(v0 + 1440);
          sub_100020974(*(void *)(v0 + 1624), &qword_1000440F0);
          swift_beginAccess();
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v132 + 48))(v131, 1, v133)) {
            (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 2400))(*(void *)(v0 + 1616), 1, 1, *(void *)(v0 + 1520));
          }
          else {
            sub_1000205CC(*(void *)(v0 + 2216) + *(int *)(*(void *)(v0 + 1440) + 20), *(void *)(v0 + 1616), &qword_1000440F0);
          }
          uint64_t v134 = *(void *)(v0 + 1680);
          uint64_t v135 = *(void *)(v0 + 1664);
          sub_1000206DC(*(void *)(v0 + 1616), *(void *)(v0 + 1624), &qword_1000440F0);
          uint64_t v136 = *(int *)(v135 + 24);
          uint64_t v137 = v134 + *(int *)(v135 + 20);
          uint64_t v138 = v134 + v136;
          uint64_t v139 = *(void *)(v134 + v136);
          uint64_t v140 = *(void *)(v138 + 8);
          *(void *)(v0 + 2600) = v140;
          swift_bridgeObjectRetain();
          uint64_t v141 = (void *)swift_task_alloc();
          *(void *)(v0 + 2608) = v141;
          *uint64_t v141 = v0;
          v141[1] = sub_1000135FC;
          return sub_100022514(v0 + 1120, v137, v139, v140);
        }
        *(void *)(v0 + 2640) = v34;
        *(void *)(v0 + 2648) = **(void **)(v0 + 1432);
        *(unsigned char *)(v0 + 2740) = 2;
        uint64_t v66 = sub_1000383E0();
        uint64_t v68 = v142;
        uint64_t v69 = sub_100015360;
LABEL_53:
        return _swift_task_switch(v69, v66, v68);
    }
  }
}

uint64_t sub_1000135FC()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_100013714, 0, 0);
}

uint64_t sub_100013714()
{
  uint64_t v95 = v0;
  if (*(void *)(v0 + 1144))
  {
    uint64_t v1 = *(void *)(v0 + 1624);
    uint64_t v2 = *(void *)(v0 + 1608);
    uint64_t v3 = *(void *)(v0 + 1528);
    uint64_t v4 = *(void *)(v0 + 1520);
    sub_1000044F0((long long *)(v0 + 1120), v0 + 1080);
    sub_100004508((void *)(v0 + 1080), *(void *)(v0 + 1104));
    uint64_t v5 = sub_100037FB0();
    uint64_t v7 = v6;
    *(void *)(v0 + 2616) = v5;
    *(void *)(v0 + 2624) = v6;
    sub_1000205CC(v1, v2, &qword_1000440F0);
    int v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v2, 1, v4);
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2224);
    if (v8 == 1)
    {
      uint64_t v73 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2176);
      uint64_t v71 = *(void *)(v0 + 2120);
      uint64_t v10 = *(void *)(v0 + 2104);
      uint64_t v11 = *(void *)(v0 + 2072);
      uint64_t v12 = *(void *)(v0 + 2064);
      uint64_t v13 = *(void *)(v0 + 1856);
      uint64_t v14 = *(void *)(v0 + 1808);
      sub_100020974(*(void *)(v0 + 1608), &qword_1000440F0);
      uint64_t v15 = sub_100004634();
      v9(v13, v15, v14);
      v73(v10, v71, v12);
      unint64_t v16 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
      uint64_t v17 = swift_allocObject();
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v11 + 32))(v17 + v16, v10, v12);
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = v5;
      *(void *)(v18 + 24) = v7;
      swift_bridgeObjectRetain();
      uint64_t v85 = sub_100038240();
      os_log_type_t v19 = sub_100038460();
      uint64_t v20 = swift_allocObject();
      *(unsigned char *)(v20 + 16) = 0;
      uint64_t v21 = swift_allocObject();
      *(unsigned char *)(v21 + 16) = 8;
      uint64_t v22 = swift_allocObject();
      *(void *)(v22 + 16) = sub_10001FFD4;
      *(void *)(v22 + 24) = v17;
      uint64_t v23 = swift_allocObject();
      *(void *)(v23 + 16) = sub_1000200C8;
      *(void *)(v23 + 24) = v22;
      uint64_t v24 = swift_allocObject();
      *(unsigned char *)(v24 + 16) = 32;
      uint64_t v25 = swift_allocObject();
      *(unsigned char *)(v25 + 16) = 8;
      uint64_t v26 = swift_allocObject();
      *(void *)(v26 + 16) = sub_100020C48;
      *(void *)(v26 + 24) = v18;
      uint64_t v27 = swift_allocObject();
      *(void *)(v27 + 16) = sub_100020BC0;
      *(void *)(v27 + 24) = v26;
      uint64_t v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = xmmword_10003ADF0;
      *(void *)(v28 + 32) = sub_100020C40;
      *(void *)(v28 + 40) = v20;
      *(void *)(v28 + 48) = sub_100020C40;
      *(void *)(v28 + 56) = v21;
      *(void *)(v28 + 64) = sub_1000200F8;
      *(void *)(v28 + 72) = v23;
      *(void *)(v28 + 80) = sub_100020C40;
      *(void *)(v28 + 88) = v24;
      *(void *)(v28 + 96) = sub_100020C40;
      *(void *)(v28 + 104) = v25;
      *(void *)(v28 + 112) = sub_100020BC8;
      *(void *)(v28 + 120) = v27;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      if (!os_log_type_enabled(v85, v19))
      {
        uint64_t v89 = *(void (**)(uint64_t, uint64_t))(v0 + 2248);
        uint64_t v83 = *(void *)(v0 + 1856);
        uint64_t v62 = *(void *)(v0 + 1808);
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();

        v89(v83, v62);
        goto LABEL_21;
      }
      os_log_type_t v87 = v19;
      uint64_t v29 = *(void *)(v0 + 2552);
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v93 = 0;
      v94[0] = swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 514;
      v30[2] = *(unsigned char *)(v20 + 16);
      if (!v29)
      {
        uint64_t v78 = *(void *)(v0 + 1856);
        uint64_t v82 = *(void (**)(uint64_t, uint64_t))(v0 + 2248);
        uint64_t v74 = *(void *)(v0 + 1808);
        swift_release();
        v30[3] = *(unsigned char *)(v21 + 16);
        uint64_t v31 = swift_release();
        (*(void (**)(uint64_t *__return_ptr, uint64_t))(v23 + 16))(v92, v31);
        sub_1000384B0();
        swift_release();
        v30[12] = *(unsigned char *)(v24 + 16);
        swift_release();
        v30[13] = *(unsigned char *)(v25 + 16);
        v92[0] = (uint64_t)(v30 + 14);
        swift_release();
        sub_10001B908(v92, (uint64_t)&v93, v94, *(uint64_t (**)(void))(v27 + 16));
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v85, v87, "Unable to extract state for config %ld. Query for all available embeddings with model %s.", v30, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v82(v78, v74);
LABEL_21:
        *(void *)(v0 + 2632) = **(void **)(v0 + 1432);
        *(unsigned char *)(v0 + 2741) = 1;
        uint64_t v70 = sub_1000383E0();
        return _swift_task_switch(sub_100014644, v70, v69);
      }
    }
    else
    {
      uint64_t v35 = *(void *)(v0 + 1864);
      uint64_t v75 = *(void *)(v0 + 1808);
      uint64_t v79 = *(void *)(v0 + 2160);
      uint64_t v36 = *(void *)(v0 + 1552);
      uint64_t v37 = *(void *)(v0 + 1544);
      uint64_t v38 = *(void *)(v0 + 1528);
      uint64_t v39 = *(void *)(v0 + 1520);
      uint64_t v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 32);
      v40(v36, *(void *)(v0 + 1608), v39);
      v9(v35, v79, v75);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v37, v36, v39);
      unint64_t v41 = (*(unsigned __int8 *)(v38 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
      uint64_t v42 = swift_allocObject();
      v40(v42 + v41, v37, v39);
      id v43 = sub_100038240();
      os_log_type_t v44 = sub_100038470();
      uint64_t v45 = swift_allocObject();
      *(unsigned char *)(v45 + 16) = 32;
      uint64_t v46 = swift_allocObject();
      *(unsigned char *)(v46 + 16) = 8;
      uint64_t v47 = swift_allocObject();
      *(void *)(v47 + 16) = sub_100020164;
      *(void *)(v47 + 24) = v42;
      uint64_t v48 = swift_allocObject();
      *(void *)(v48 + 16) = sub_100020BC0;
      *(void *)(v48 + 24) = v47;
      uint64_t v49 = swift_allocObject();
      *(_OWORD *)(v49 + 16) = xmmword_10003ADC0;
      *(void *)(v49 + 32) = sub_100020C40;
      *(void *)(v49 + 40) = v45;
      *(void *)(v49 + 48) = sub_100020C40;
      *(void *)(v49 + 56) = v46;
      *(void *)(v49 + 64) = sub_100020BC8;
      *(void *)(v49 + 72) = v48;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      if (!os_log_type_enabled(v43, v44))
      {
        uint64_t v63 = *(void (**)(uint64_t, uint64_t))(v0 + 2248);
        uint64_t v64 = *(void *)(v0 + 1864);
        uint64_t v65 = *(void *)(v0 + 1808);
        uint64_t v90 = *(void *)(v0 + 1552);
        uint64_t v66 = *(void *)(v0 + 1528);
        uint64_t v67 = *(void *)(v0 + 1520);

        swift_release();
        swift_release();
        swift_release();
        v63(v64, v65);
        (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v90, v67);
        goto LABEL_21;
      }
      uint64_t v50 = *(void *)(v0 + 2552);
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      v94[0] = 0;
      v92[0] = swift_slowAlloc();
      *(_WORD *)uint64_t v51 = 258;
      v51[2] = *(unsigned char *)(v45 + 16);
      if (!v50)
      {
        uint64_t v77 = *(void *)(v0 + 1808);
        uint64_t v81 = *(void *)(v0 + 1864);
        BOOL v86 = *(void (**)(uint64_t, uint64_t))(v0 + 2248);
        uint64_t v91 = *(void *)(v0 + 1552);
        uint64_t v68 = *(void *)(v0 + 1528);
        uint64_t v84 = *(void *)(v0 + 1520);
        swift_release();
        v51[3] = *(unsigned char *)(v46 + 16);
        uint64_t v93 = v51 + 4;
        swift_release();
        sub_10001B908((uint64_t *)&v93, (uint64_t)v94, v92, *(uint64_t (**)(void))(v48 + 16));
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v43, v44, "Last queried: %s", v51, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v86(v81, v77);
        (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v91, v84);
        goto LABEL_21;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    return swift_errorRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100020974(v0 + 1120, &qword_1000442A0);
    os_log_type_t v32 = sub_100038240();
    os_log_type_t v33 = sub_100038480();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      v92[0] = 0;
      *(_WORD *)uint64_t v34 = 0;
      uint64_t v93 = v34 + 2;
      v94[0] = 0;
      sub_10001AFE4((uint64_t)&_swiftEmptyArrayStorage, (uint64_t)&v93, (uint64_t)v94, (uint64_t)v92);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Failed to create embedder from embedParameters.", v34, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    char v53 = *(void **)(v0 + 2200);
    uint64_t v76 = *(void *)(v0 + 2120);
    os_log_type_t v80 = *(void (**)(uint64_t, uint64_t))(v0 + 2192);
    uint64_t v72 = *(void *)(v0 + 2064);
    uint64_t v54 = *(void *)(v0 + 1712);
    uint64_t v55 = *(void *)(v0 + 1696);
    uint64_t v56 = *(void *)(v0 + 1688);
    uint64_t v57 = *(void *)(v0 + 1680);
    uint64_t v58 = *(void *)(v0 + 1648);
    uint64_t v59 = *(void *)(v0 + 1624);
    v92[3] = (uint64_t)&type metadata for ZeoliteExtensionError;
    v92[4] = sub_10001E124();
    LOBYTE(v92[0]) = 11;
    id v60 = objc_allocWithZone((Class)sub_100038060());
    uint64_t v88 = sub_100038040();

    swift_release();
    sub_100020974(v59, &qword_1000440F0);
    sub_100020974(v58, &qword_1000440F0);
    sub_1000207F4(v57, type metadata accessor for EmbedParameters);
    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v54, v56);
    v80(v76, v72);
    swift_release();
    swift_bridgeObjectRelease();
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v61 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v61(v88);
  }
}

uint64_t sub_100014644()
{
  sub_100038010();
  return _swift_task_switch(sub_1000146C0, 0, 0);
}

uint64_t sub_1000146C0()
{
  uint64_t v93 = v0;
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 2400);
  uint64_t v2 = *(void *)(v0 + 1624);
  uint64_t v3 = *(void *)(v0 + 1600);
  uint64_t v4 = *(void *)(v0 + 1520);
  swift_beginAccess();
  uint64_t v84 = *(void *)(v0 + 1296);
  uint64_t v5 = *(void *)(v0 + 1304);
  v1(v3, 1, 1, v4);
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_100004028(v2, v3, 0);
  uint64_t v83 = v0 + 1080;
  if (v7 == 17)
  {
    uint64_t v81 = v6;
    sub_100038220();
    v90[0] = (unint64_t)&_swiftEmptyArrayStorage;
    uint64_t v8 = *(void *)(v81 + 16);
    if (v8)
    {
      BOOL v86 = *(unint64_t **)(v0 + 2624);
      uint64_t v9 = *(void *)(v0 + 1496);
      uint64_t v12 = *(void (**)(void, unint64_t, void))(v9 + 16);
      uint64_t v11 = v9 + 16;
      uint64_t v10 = v12;
      unint64_t v13 = v81 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
      uint64_t v14 = *(void *)(v11 + 56);
      v12(*(void *)(v0 + 1512), v13, *(void *)(v0 + 1488));
      while (1)
      {
        uint64_t v17 = sub_1000381B0();
        if (!v18) {
          goto LABEL_8;
        }
        if (*(void *)(v0 + 2616) == v17 && v18 == v86)
        {
          swift_bridgeObjectRelease();
          if (!v5) {
            goto LABEL_5;
          }
        }
        else
        {
          char v20 = sub_100038700();
          swift_bridgeObjectRelease();
          if ((v20 & 1) == 0) {
            goto LABEL_8;
          }
          if (!v5) {
            goto LABEL_5;
          }
        }
        uint64_t v21 = sub_100038170();
        if (!v22) {
          goto LABEL_8;
        }
        if (v84 == v21 && v5 == v22)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v23 = sub_100038700();
          swift_bridgeObjectRelease();
          if ((v23 & 1) == 0) {
            goto LABEL_8;
          }
        }
LABEL_5:
        v10(*(void *)(v0 + 1504), *(void *)(v0 + 1512), *(void *)(v0 + 1488));
        sub_10001B21C();
        unint64_t v16 = *(void *)(v90[0] + 16);
        unint64_t v15 = *(void *)(v90[0] + 24);
        if (v16 >= v15 >> 1) {
          v90[0] = sub_10001B4A8(v15 > 1, v16 + 1, 1, v90[0], &qword_1000442F8, (uint64_t (*)(void))&type metadata accessor for ZeoliteEmbedding, (uint64_t (*)(void))&type metadata accessor for ZeoliteEmbedding);
        }
        sub_10001B298(v16, *(void *)(v0 + 1504));
LABEL_8:
        (*(void (**)(void, void))(v11 - 8))(*(void *)(v0 + 1512), *(void *)(v0 + 1488));
        v13 += v14;
        if (!--v8)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v35 = (void *)v90[0];
          goto LABEL_32;
        }
        v10(*(void *)(v0 + 1512), v13, *(void *)(v0 + 1488));
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v35 = &_swiftEmptyArrayStorage;
LABEL_32:
    uint64_t v49 = *(void *)(v0 + 2552);
    uint64_t v50 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2224);
    uint64_t v51 = *(void *)(v0 + 1840);
    uint64_t v52 = *(void *)(v0 + 1808);
    uint64_t v53 = *(void *)(v0 + 1600);
    swift_bridgeObjectRelease();
    sub_100020974(v53, &qword_1000440F0);
    uint64_t v54 = sub_100019A94((uint64_t)v35);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v89 = v54;
    unint64_t v55 = v54[2];
    uint64_t v56 = sub_100004634();
    v50(v51, v56, v52);
    uint64_t v57 = swift_allocObject();
    *(void *)(v57 + 16) = v55;
    uint64_t v58 = sub_100038240();
    os_log_type_t v59 = sub_100038460();
    uint64_t v60 = swift_allocObject();
    *(unsigned char *)(v60 + 16) = 0;
    uint64_t v61 = swift_allocObject();
    *(unsigned char *)(v61 + 16) = 8;
    uint64_t v62 = swift_allocObject();
    *(void *)(v62 + 16) = sub_100020BD0;
    *(void *)(v62 + 24) = v57;
    uint64_t v63 = swift_allocObject();
    *(void *)(v63 + 16) = sub_100020BC4;
    *(void *)(v63 + 24) = v62;
    uint64_t v64 = swift_allocObject();
    *(_OWORD *)(v64 + 16) = xmmword_10003ADC0;
    *(void *)(v64 + 32) = sub_100020C40;
    *(void *)(v64 + 40) = v60;
    *(void *)(v64 + 48) = sub_100020C40;
    *(void *)(v64 + 56) = v61;
    *(void *)(v64 + 64) = sub_1000200F8;
    *(void *)(v64 + 72) = v63;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v58, v59))
    {
      uint64_t v65 = swift_slowAlloc();
      *(_WORD *)uint64_t v65 = 256;
      *(unsigned char *)(v65 + 2) = *(unsigned char *)(v60 + 16);
      if (v49)
      {
        swift_bridgeObjectRelease();
        swift_release();
        return swift_errorRelease();
      }
      uint64_t v69 = (uint8_t *)v65;
      uint64_t v85 = *(void (**)(uint64_t, uint64_t))(v0 + 2248);
      uint64_t v82 = *(void *)(v0 + 1840);
      uint64_t v70 = *(void *)(v0 + 1808);
      swift_release();
      v69[3] = *(unsigned char *)(v61 + 16);
      uint64_t v71 = swift_release();
      (*(void (**)(unint64_t *__return_ptr, uint64_t))(v63 + 16))(v90, v71);
      sub_1000384B0();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v58, v59, "Queried %ld events from Biome.", v69, 0xCu);
      swift_slowDealloc();

      v85(v82, v70);
    }
    else
    {
      uint64_t v66 = *(void (**)(uint64_t, uint64_t))(v0 + 2248);
      uint64_t v67 = *(void *)(v0 + 1840);
      uint64_t v68 = *(void *)(v0 + 1808);
      swift_release();
      swift_release();
      swift_release();

      v66(v67, v68);
    }
    uint64_t v72 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v0 + 2400);
    uint64_t v73 = *(void *)(v0 + 1632);
    uint64_t v74 = *(void *)(v0 + 1624);
    uint64_t v75 = *(void *)(v0 + 1520);
    sub_100037C10();
    sub_100020974(v74, &qword_1000440F0);
    v72(v73, 0, 1, v75);
    sub_1000206DC(v73, v74, &qword_1000440F0);
    sub_100003FD8(v83);
    *(void *)(v0 + 2640) = v89;
    *(void *)(v0 + 2648) = **(void **)(v0 + 1432);
    *(unsigned char *)(v0 + 2740) = 2;
    uint64_t v77 = sub_1000383E0();
    return _swift_task_switch(sub_100015360, v77, v76);
  }
  else
  {
    char v87 = v7;
    uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2224);
    uint64_t v25 = *(void *)(v0 + 1848);
    uint64_t v26 = *(void *)(v0 + 1808);
    uint64_t v27 = *(void *)(v0 + 1600);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100020974(v27, &qword_1000440F0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v28 = sub_100004634();
    v24(v25, v28, v26);
    uint64_t v29 = sub_100038240();
    os_log_type_t v30 = sub_100038480();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v0 + 2248);
      uint64_t v32 = *(void *)(v0 + 1848);
      uint64_t v33 = *(void *)(v0 + 1808);
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      v90[0] = 0;
      *(_WORD *)uint64_t v34 = 0;
      uint64_t v91 = v34 + 2;
      v92[0] = 0;
      sub_10001AFE4((uint64_t)&_swiftEmptyArrayStorage, (uint64_t)&v91, (uint64_t)v92, (uint64_t)v90);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Failed to query from Biome", v34, 2u);
      swift_slowDealloc();

      v31(v32, v33);
    }
    else
    {
      uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v0 + 2248);
      uint64_t v37 = *(void *)(v0 + 1848);
      uint64_t v38 = *(void *)(v0 + 1808);
      swift_bridgeObjectRelease();

      v36(v37, v38);
    }
    uint64_t v39 = *(void **)(v0 + 2200);
    os_log_type_t v80 = *(void (**)(uint64_t, uint64_t))(v0 + 2192);
    uint64_t v78 = *(void *)(v0 + 2064);
    uint64_t v79 = *(void *)(v0 + 2120);
    uint64_t v40 = *(void *)(v0 + 1712);
    uint64_t v41 = *(void *)(v0 + 1696);
    uint64_t v42 = *(void *)(v0 + 1688);
    uint64_t v43 = *(void *)(v0 + 1680);
    uint64_t v44 = *(void *)(v0 + 1648);
    uint64_t v45 = *(void *)(v0 + 1624);
    v90[3] = (unint64_t)&type metadata for ZeoliteExtensionError;
    v90[4] = sub_10001E124();
    LOBYTE(v90[0]) = v87;
    id v46 = objc_allocWithZone((Class)sub_100038060());
    uint64_t v88 = sub_100038040();

    swift_release();
    sub_100020974(v45, &qword_1000440F0);
    sub_100020974(v44, &qword_1000440F0);
    sub_1000207F4(v43, type metadata accessor for EmbedParameters);
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
    v80(v79, v78);
    sub_100003FD8(v83);
    swift_release();
    swift_bridgeObjectRelease();
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v47 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v47(v88);
  }
}

uint64_t sub_100015360()
{
  sub_100038010();
  return _swift_task_switch(sub_1000153DC, 0, 0);
}

uint64_t sub_1000153DC()
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_100044298 + dword_100044298);
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[332] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000154AC;
  uint64_t v2 = v0[295];
  uint64_t v3 = v0[294];
  uint64_t v4 = v0[293];
  uint64_t v5 = v0[292];
  uint64_t v6 = v0[291];
  uint64_t v7 = v0[289];
  uint64_t v8 = v0[288];
  uint64_t v9 = v0[330];
  return v11(v9, v6, v5, v4, v3, v2, v8, v7);
}

uint64_t sub_1000154AC(uint64_t a1, char a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 2664) = a1;
  *(unsigned char *)(v3 + 2747) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10001562C, 0, 0);
}

uint64_t sub_10001562C()
{
  uint64_t v114 = v0;
  uint64_t v1 = *(void *)(v0 + 2664);
  if (*(unsigned char *)(v0 + 2747) == 17)
  {
    *(void *)(v0 + 2680) = *(void *)(v0 + 2640);
    *(void *)(v0 + 2672) = v1;
    uint64_t v2 = *(void *)(v0 + 1936);
    sub_1000380A0();
    uint64_t v3 = *(void *)(v2 + 32);
    swift_bridgeObjectRetain();
    sub_1000207F4(v2, type metadata accessor for ZeoliteExtensionConfig);
    uint64_t v4 = *(void *)(v3 + 16);
    if (v4)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = 0;
      while (1)
      {
        uint64_t v6 = v3 + v5++;
        switch(*(unsigned char *)(v6 + 32))
        {
          case 3:
            swift_bridgeObjectRelease();
            goto LABEL_26;
          default:
            char v7 = sub_100038700();
            swift_bridgeObjectRelease();
            if (v7)
            {
LABEL_26:
              swift_bridgeObjectRelease();
              uint64_t v88 = *(void **)(v0 + 1432);
              swift_bridgeObjectRelease();
              *(void *)(v0 + 2688) = *v88;
              *(unsigned char *)(v0 + 2738) = 2;
              uint64_t v84 = sub_1000383E0();
              uint64_t v86 = v89;
              char v87 = sub_100016664;
              goto LABEL_27;
            }
            if (v4 == v5)
            {
              swift_bridgeObjectRelease_n();
              goto LABEL_14;
            }
            break;
        }
      }
    }
    swift_bridgeObjectRelease();
LABEL_14:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v21 = *(void *)(v0 + 1648);
    uint64_t v22 = *(void *)(v0 + 1624);
    uint64_t v23 = *(void *)(v0 + 1456);
    uint64_t v24 = *(void *)(v0 + 1440);
    sub_100037C10();
    sub_1000205CC(v22, v23 + *(int *)(v24 + 20), &qword_1000440F0);
    sub_1000205CC(v21, v23 + *(int *)(v24 + 24), &qword_1000440F0);
    if (sub_100026EE0())
    {
      v25.super.Class isa = sub_1000382B0().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      v25.super.Class isa = 0;
    }
    uint64_t v97 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2224);
    uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2176);
    uint64_t v95 = *(void *)(v0 + 2160);
    uint64_t v27 = *(void *)(v0 + 2120);
    uint64_t v28 = *(void *)(v0 + 2096);
    uint64_t v103 = *(void *)(v0 + 2088);
    uint64_t v29 = *(void *)(v0 + 2072);
    uint64_t v30 = *(void *)(v0 + 2064);
    uint64_t v31 = *(void *)(v0 + 1976);
    uint64_t v90 = *(void **)(v0 + 2200);
    uint64_t v91 = *(void *)(v0 + 1832);
    uint64_t v93 = *(void *)(v0 + 1808);
    sub_1000380A0();
    sub_100026558();
    sub_1000207F4(v31, type metadata accessor for ZeoliteExtensionConfig);
    NSString v32 = sub_100038300();
    swift_bridgeObjectRelease();
    [v90 setValue:v25.super.isa forKey:v32];

    swift_unknownObjectRelease();
    v97(v91, v95, v93);
    v26(v28, v27, v30);
    v26(v103, v28, v30);
    unint64_t v33 = (*(unsigned __int8 *)(v29 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
    uint64_t v34 = swift_allocObject();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v29 + 32))(v34 + v33, v28, v30);
    uint64_t v35 = sub_100038240();
    os_log_type_t v36 = sub_100038460();
    uint64_t v37 = swift_allocObject();
    *(unsigned char *)(v37 + 16) = 32;
    uint64_t v38 = swift_allocObject();
    *(unsigned char *)(v38 + 16) = 8;
    uint64_t v39 = swift_allocObject();
    *(void *)(v39 + 16) = sub_10001E01C;
    *(void *)(v39 + 24) = v34;
    uint64_t v40 = swift_allocObject();
    *(void *)(v40 + 16) = sub_100020BC0;
    *(void *)(v40 + 24) = v39;
    uint64_t v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = xmmword_10003ADC0;
    *(void *)(v41 + 32) = sub_100020C40;
    *(void *)(v41 + 40) = v37;
    *(void *)(v41 + 48) = sub_100020C40;
    *(void *)(v41 + 56) = v38;
    *(void *)(v41 + 64) = sub_100020BC8;
    *(void *)(v41 + 72) = v40;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v107 = v36;
    BOOL v42 = os_log_type_enabled(v35, v36);
    uint64_t v43 = *(void *)(v0 + 2088);
    uint64_t v44 = *(void *)(v0 + 2072);
    uint64_t v45 = *(void *)(v0 + 2064);
    uint64_t v109 = v35;
    if (v42)
    {
      uint64_t v46 = *(void *)(v0 + 1976);
      uint64_t v98 = *(void *)(v0 + 1816);
      uint64_t v101 = *(void *)(v0 + 1808);
      uint64_t v104 = *(void *)(v0 + 1832);
      uint64_t v47 = *(void *)(v0 + 2064);
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      v113[0] = swift_slowAlloc();
      *(_WORD *)uint64_t v48 = 258;
      v48[2] = 32;
      swift_release();
      v48[3] = 8;
      swift_release();
      sub_1000380A0();
      uint64_t v49 = sub_100026558();
      uint64_t v92 = v43;
      unint64_t v51 = v50;
      sub_1000207F4(v46, type metadata accessor for ZeoliteExtensionConfig);
      *(void *)(v0 + 1408) = sub_10001B980(v49, v51, v113);
      sub_1000384B0();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v52 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
      v52(v92, v47);
      _os_log_impl((void *)&_mh_execute_header, v109, v107, "Execution state saved for %s.", v48, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v53 = v104;
      uint64_t v105 = *(void (**)(uint64_t, uint64_t))(v98 + 8);
      v105(v53, v101);
    }
    else
    {
      uint64_t v54 = *(void *)(v0 + 1816);
      uint64_t v106 = *(void *)(v0 + 1808);
      uint64_t v108 = *(void *)(v0 + 1832);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v52 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
      v52(v43, v45);

      uint64_t v55 = v106;
      uint64_t v105 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
      v105(v108, v55);
    }
    *(void *)(v0 + 2696) = v52;
    uint64_t v56 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2224);
    uint64_t v57 = *(void *)(v0 + 2160);
    uint64_t v58 = *(void *)(v0 + 1824);
    uint64_t v59 = *(void *)(v0 + 1808);
    uint64_t v60 = *(void *)(v0 + 1704);
    uint64_t v61 = *(void *)(v0 + 1696);
    uint64_t v62 = *(void *)(v0 + 1688);
    sub_100038510();
    uint64_t v63 = sub_100038520();
    uint64_t v65 = v64;
    uint64_t v66 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
    *(void *)(v0 + 2704) = v66;
    *(void *)(v0 + 2712) = (v61 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v66(v60, v62);
    v56(v58, v57, v59);
    uint64_t v67 = swift_allocObject();
    *(void *)(v67 + 16) = v63;
    *(void *)(v67 + 24) = v65;
    uint64_t v68 = swift_allocObject();
    *(void *)(v68 + 16) = sub_10001E0B0;
    *(void *)(v68 + 24) = v67;
    swift_retain();
    uint64_t v69 = sub_100038240();
    os_log_type_t v70 = sub_100038460();
    uint64_t v71 = swift_allocObject();
    *(unsigned char *)(v71 + 16) = 32;
    uint64_t v72 = swift_allocObject();
    *(unsigned char *)(v72 + 16) = 8;
    uint64_t v73 = swift_allocObject();
    *(void *)(v73 + 16) = sub_10001E0BC;
    *(void *)(v73 + 24) = v68;
    uint64_t v74 = swift_allocObject();
    *(void *)(v74 + 16) = sub_100020BC0;
    *(void *)(v74 + 24) = v73;
    uint64_t v75 = swift_allocObject();
    *(_OWORD *)(v75 + 16) = xmmword_10003ADC0;
    *(void *)(v75 + 32) = sub_100020C40;
    *(void *)(v75 + 40) = v71;
    *(void *)(v75 + 48) = sub_100020C40;
    *(void *)(v75 + 56) = v72;
    *(void *)(v75 + 64) = sub_100020BC8;
    *(void *)(v75 + 72) = v74;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    uint64_t v112 = v69;
    BOOL v76 = os_log_type_enabled(v69, v70);
    uint64_t v77 = *(void *)(v0 + 1824);
    uint64_t v78 = *(void *)(v0 + 1808);
    if (v76)
    {
      uint64_t v110 = *(void *)(v0 + 1824);
      uint64_t v99 = *(void *)(v0 + 1808);
      uint64_t v79 = (uint8_t *)swift_slowAlloc();
      v113[0] = swift_slowAlloc();
      *(_WORD *)uint64_t v79 = 258;
      v79[2] = 32;
      swift_release();
      v79[3] = 8;
      swift_release();
      uint64_t v80 = sub_100038800();
      *(void *)(v0 + 1400) = sub_10001B980(v80, v81, v113);
      sub_1000384B0();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v112, v70, "Time elapsed: %s.", v79, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v82 = v99;
      uint64_t v83 = v110;
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();

      uint64_t v83 = v77;
      uint64_t v82 = v78;
    }
    v105(v83, v82);
    *(void *)(v0 + 2720) = **(void **)(v0 + 1432);
    *(unsigned char *)(v0 + 2742) = 4;
    uint64_t v84 = sub_1000383E0();
    uint64_t v86 = v85;
    char v87 = sub_10001775C;
LABEL_27:
    return _swift_task_switch(v87, v84, v86);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_100038240();
    os_log_type_t v9 = sub_100038480();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Failed to complete score step.", v10, 2u);
      swift_slowDealloc();
    }
    char v11 = *(unsigned char *)(v0 + 2747);
    uint64_t v12 = *(void **)(v0 + 2200);
    uint64_t v13 = *(void *)(v0 + 2072);
    uint64_t v100 = *(void *)(v0 + 2064);
    uint64_t v102 = *(void *)(v0 + 2120);
    uint64_t v14 = *(void *)(v0 + 1696);
    uint64_t v94 = *(void *)(v0 + 1688);
    uint64_t v96 = *(void *)(v0 + 1712);
    uint64_t v15 = *(void *)(v0 + 1680);
    uint64_t v16 = *(void *)(v0 + 1648);
    uint64_t v17 = *(void *)(v0 + 1624);

    v113[3] = (uint64_t)&type metadata for ZeoliteExtensionError;
    v113[4] = sub_10001E124();
    LOBYTE(v113[0]) = v11;
    id v18 = objc_allocWithZone((Class)sub_100038060());
    uint64_t v111 = sub_100038040();

    swift_release();
    sub_100020974(v17, &qword_1000440F0);
    sub_100020974(v16, &qword_1000440F0);
    sub_1000207F4(v15, type metadata accessor for EmbedParameters);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v96, v94);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v102, v100);
    swift_bridgeObjectRelease();
    swift_release();
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    os_log_type_t v19 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v19(v111);
  }
}

uint64_t sub_100016664()
{
  sub_100038010();
  return _swift_task_switch(sub_1000166E0, 0, 0);
}

uint64_t sub_1000166E0()
{
  uint64_t v128 = v0;
  uint64_t v1 = v0[335];
  if (v1)
  {
    int64_t v2 = *(void *)(v1 + 16);
    uint64_t v3 = &_swiftEmptyArrayStorage;
    if (v2)
    {
      uint64_t v4 = v0[184];
      v127[0] = (uint64_t)&_swiftEmptyArrayStorage;
      swift_bridgeObjectRetain();
      sub_10001B1A4(v2);
      uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
      uint64_t v5 = v4 + 16;
      uint64_t v124 = v6;
      uint64_t v7 = v1 + ((*(unsigned __int8 *)(v5 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 64));
      uint64_t v8 = *(void *)(v5 + 56);
      do
      {
        uint64_t v9 = v125[185];
        uint64_t v10 = v125[183];
        v124(v9, v7, v10);
        uint64_t v11 = sub_100037DD0();
        (*(void (**)(uint64_t, uint64_t))(v5 - 8))(v9, v10);
        sub_10001BFD8();
        uint64_t v3 = (void *)v127[0];
        unint64_t v13 = *(void *)(v127[0] + 16);
        unint64_t v12 = *(void *)(v127[0] + 24);
        if (v13 >= v12 >> 1)
        {
          sub_1000359E0(v12 > 1, v13 + 1, 1);
          uint64_t v3 = (void *)v127[0];
        }
        v3[2] = v13 + 1;
        v3[v13 + 4] = v11;
        v7 += v8;
        --v2;
      }
      while (v2);
      swift_bridgeObjectRelease();
      uint64_t v0 = v125;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = 0;
  }
  uint64_t v14 = v0[334];
  unsigned int v15 = *((unsigned __int16 *)v0 + 1366);
  uint64_t v16 = (uint64_t *)v0[247];
  if (*((_WORD *)v0 + 1366) == 2) {
    int v17 = 1;
  }
  else {
    int v17 = (v15 >> 8) & 1;
  }
  char v18 = (*((_WORD *)v0 + 1366) == 2) | v15;
  sub_1000380A0();
  uint64_t v19 = *v16;
  sub_1000207F4((uint64_t)v16, type metadata accessor for ZeoliteExtensionConfig);
  uint64_t v21 = sub_100038110();
  if (v17) {
    int v22 = 256;
  }
  else {
    int v22 = 0;
  }
  char v23 = sub_100019CC0(v14, (uint64_t)v3, v22 & 0xFFFFFFFE | v18 & 1, v19, v21, v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v23 == 17)
  {
    uint64_t v24 = v0[206];
    uint64_t v25 = v0[203];
    uint64_t v26 = v0[182];
    uint64_t v27 = v0[180];
    sub_100037C10();
    sub_1000205CC(v25, v26 + *(int *)(v27 + 20), &qword_1000440F0);
    sub_1000205CC(v24, v26 + *(int *)(v27 + 24), &qword_1000440F0);
    if (sub_100026EE0())
    {
      v28.super.Class isa = sub_1000382B0().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      v28.super.Class isa = 0;
    }
    uint64_t v109 = (void (*)(uint64_t, uint64_t, uint64_t))v0[278];
    uint64_t v104 = (void *)v0[275];
    uint64_t v41 = (void (*)(uint64_t, uint64_t, uint64_t))v125[272];
    uint64_t v107 = v125[270];
    uint64_t v42 = v125[265];
    uint64_t v43 = v125[262];
    uint64_t v114 = v125[261];
    uint64_t v44 = v125[259];
    uint64_t v45 = v125[258];
    uint64_t v46 = v125[247];
    uint64_t v47 = v125[229];
    uint64_t v105 = v125[226];
    sub_1000380A0();
    sub_100026558();
    sub_1000207F4(v46, type metadata accessor for ZeoliteExtensionConfig);
    NSString v48 = sub_100038300();
    swift_bridgeObjectRelease();
    [v104 setValue:v28.super.isa forKey:v48];

    swift_unknownObjectRelease();
    v109(v47, v107, v105);
    v41(v43, v42, v45);
    v41(v114, v43, v45);
    uint64_t v49 = v125;
    unint64_t v50 = (*(unsigned __int8 *)(v44 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
    uint64_t v51 = swift_allocObject();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v44 + 32))(v51 + v50, v43, v45);
    uint64_t v52 = sub_100038240();
    os_log_type_t v53 = sub_100038460();
    uint64_t v54 = swift_allocObject();
    *(unsigned char *)(v54 + 16) = 32;
    uint64_t v55 = swift_allocObject();
    *(unsigned char *)(v55 + 16) = 8;
    uint64_t v56 = swift_allocObject();
    *(void *)(v56 + 16) = sub_10001E01C;
    *(void *)(v56 + 24) = v51;
    uint64_t v57 = swift_allocObject();
    *(void *)(v57 + 16) = sub_100020BC0;
    *(void *)(v57 + 24) = v56;
    uint64_t v58 = swift_allocObject();
    *(_OWORD *)(v58 + 16) = xmmword_10003ADC0;
    *(void *)(v58 + 32) = sub_100020C40;
    *(void *)(v58 + 40) = v54;
    *(void *)(v58 + 48) = sub_100020C40;
    *(void *)(v58 + 56) = v55;
    *(void *)(v58 + 64) = sub_100020BC8;
    *(void *)(v58 + 72) = v57;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    uint64_t v121 = v52;
    os_log_type_t v118 = v53;
    BOOL v59 = os_log_type_enabled(v52, v53);
    uint64_t v60 = v125[261];
    uint64_t v61 = v125[259];
    uint64_t v62 = v125[258];
    if (v59)
    {
      uint64_t v63 = v125[247];
      uint64_t v110 = v125[227];
      uint64_t v112 = v125[226];
      uint64_t v115 = v125[229];
      uint64_t v64 = v125[258];
      uint64_t v65 = (uint8_t *)swift_slowAlloc();
      v127[0] = swift_slowAlloc();
      *(_WORD *)uint64_t v65 = 258;
      v65[2] = 32;
      swift_release();
      v65[3] = 8;
      swift_release();
      sub_1000380A0();
      uint64_t v66 = sub_100026558();
      uint64_t v106 = v60;
      unint64_t v68 = v67;
      uint64_t v69 = v63;
      uint64_t v49 = v125;
      sub_1000207F4(v69, type metadata accessor for ZeoliteExtensionConfig);
      v125[176] = sub_10001B980(v66, v68, v127);
      sub_1000384B0();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      os_log_type_t v70 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
      v70(v106, v64);
      _os_log_impl((void *)&_mh_execute_header, v121, v118, "Execution state saved for %s.", v65, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v122 = *(void (**)(uint64_t, uint64_t))(v110 + 8);
      v122(v115, v112);
    }
    else
    {
      uint64_t v71 = v125[227];
      uint64_t v116 = v125[226];
      uint64_t v119 = v125[229];
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      os_log_type_t v70 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
      v70(v60, v62);

      uint64_t v122 = *(void (**)(uint64_t, uint64_t))(v71 + 8);
      v122(v119, v116);
    }
    v49[337] = v70;
    uint64_t v72 = (void (*)(uint64_t, uint64_t, uint64_t))v49[278];
    uint64_t v73 = v49[270];
    uint64_t v74 = v49[228];
    uint64_t v75 = v49[226];
    uint64_t v76 = v49[213];
    uint64_t v77 = v125[212];
    uint64_t v78 = v125[211];
    sub_100038510();
    uint64_t v79 = sub_100038520();
    uint64_t v81 = v80;
    uint64_t v82 = *(void (**)(uint64_t, uint64_t))(v77 + 8);
    v125[338] = v82;
    v125[339] = (v77 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v82(v76, v78);
    v72(v74, v73, v75);
    uint64_t v83 = swift_allocObject();
    *(void *)(v83 + 16) = v79;
    *(void *)(v83 + 24) = v81;
    uint64_t v84 = swift_allocObject();
    *(void *)(v84 + 16) = sub_10001E0B0;
    *(void *)(v84 + 24) = v83;
    swift_retain();
    uint64_t v85 = sub_100038240();
    os_log_type_t v86 = sub_100038460();
    uint64_t v87 = swift_allocObject();
    *(unsigned char *)(v87 + 16) = 32;
    uint64_t v88 = swift_allocObject();
    *(unsigned char *)(v88 + 16) = 8;
    uint64_t v89 = swift_allocObject();
    *(void *)(v89 + 16) = sub_10001E0BC;
    *(void *)(v89 + 24) = v84;
    uint64_t v90 = swift_allocObject();
    *(void *)(v90 + 16) = sub_100020BC0;
    *(void *)(v90 + 24) = v89;
    uint64_t v91 = swift_allocObject();
    *(_OWORD *)(v91 + 16) = xmmword_10003ADC0;
    *(void *)(v91 + 32) = sub_100020C40;
    *(void *)(v91 + 40) = v87;
    *(void *)(v91 + 48) = sub_100020C40;
    *(void *)(v91 + 56) = v88;
    *(void *)(v91 + 64) = sub_100020BC8;
    *(void *)(v91 + 72) = v90;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v92 = v86;
    uint64_t v93 = v125;
    id v123 = v85;
    BOOL v94 = os_log_type_enabled(v85, v92);
    uint64_t v95 = v125[228];
    uint64_t v96 = v125[226];
    if (v94)
    {
      uint64_t v108 = v125[226];
      uint64_t v97 = (uint8_t *)swift_slowAlloc();
      v127[0] = swift_slowAlloc();
      *(_WORD *)uint64_t v97 = 258;
      v97[2] = 32;
      swift_release();
      v97[3] = 8;
      swift_release();
      uint64_t v98 = sub_100038800();
      v125[175] = sub_10001B980(v98, v99, v127);
      sub_1000384B0();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v123, v92, "Time elapsed: %s.", v97, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v93 = v125;
      swift_slowDealloc();

      uint64_t v101 = v108;
      uint64_t v100 = v95;
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();

      uint64_t v100 = v95;
      uint64_t v101 = v96;
    }
    v122(v100, v101);
    v93[340] = *(void *)v93[179];
    *((unsigned char *)v93 + 2742) = 4;
    uint64_t v103 = sub_1000383E0();
    return _swift_task_switch(sub_10001775C, v103, v102);
  }
  else
  {
    uint64_t v29 = sub_100038240();
    os_log_type_t v30 = sub_100038480();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Failed to run analysis step.", v31, 2u);
      swift_slowDealloc();
    }
    NSString v32 = (void *)v0[275];
    uint64_t v120 = v0[265];
    uint64_t v33 = v0[259];
    uint64_t v113 = v0[214];
    uint64_t v117 = v0[258];
    uint64_t v34 = v0[212];
    uint64_t v111 = v0[211];
    uint64_t v35 = v0[210];
    uint64_t v36 = v0[206];
    uint64_t v37 = v0[203];

    v127[3] = (uint64_t)&type metadata for ZeoliteExtensionError;
    v127[4] = sub_10001E124();
    LOBYTE(v127[0]) = v23;
    id v38 = objc_allocWithZone((Class)sub_100038060());
    uint64_t v126 = sub_100038040();

    swift_release();
    sub_100020974(v37, &qword_1000440F0);
    sub_100020974(v36, &qword_1000440F0);
    sub_1000207F4(v35, type metadata accessor for EmbedParameters);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v113, v111);
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v120, v117);
    swift_release();
    swift_bridgeObjectRelease();
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v39 = (uint64_t (*)(uint64_t))v0[1];
    return v39(v126);
  }
}

uint64_t sub_10001775C()
{
  sub_100038010();
  return _swift_task_switch(sub_1000177D8, 0, 0);
}

uint64_t sub_1000177D8()
{
  unint64_t v13 = (void (*)(uint64_t, uint64_t))v0[338];
  uint64_t v14 = (void (*)(uint64_t, uint64_t))v0[337];
  uint64_t v1 = (void *)v0[275];
  uint64_t v11 = v0[258];
  uint64_t v12 = v0[265];
  uint64_t v2 = v0[214];
  uint64_t v3 = v0[211];
  uint64_t v4 = v0[210];
  uint64_t v5 = v0[206];
  uint64_t v6 = v0[203];
  uint64_t v7 = v0[182];
  id v8 = objc_allocWithZone((Class)sub_100038060());
  uint64_t v15 = sub_100038050();

  swift_release();
  sub_1000207F4(v7, type metadata accessor for ExecutionState);
  sub_100020974(v6, &qword_1000440F0);
  sub_100020974(v5, &qword_1000440F0);
  sub_1000207F4(v4, type metadata accessor for EmbedParameters);
  v13(v2, v3);
  v14(v12, v11);
  swift_release();
  swift_bridgeObjectRelease();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
  return v9(v15);
}

uint64_t sub_100017C64()
{
  uint64_t v0 = sub_100003F3C(&qword_100044268);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = swift_projectBox();
  swift_beginAccess();
  sub_1000205CC(v3, (uint64_t)v2, &qword_100044268);
  uint64_t v4 = sub_100038490();
  sub_100020974((uint64_t)v2, &qword_100044268);
  return v4;
}

uint64_t sub_100017D3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  uint64_t v4 = sub_100038260();
  v3[6] = v4;
  v3[7] = *(void *)(v4 - 8);
  v3[8] = swift_task_alloc();
  v3[9] = type metadata accessor for TransparencyExtractor(0);
  v3[10] = swift_task_alloc();
  v3[11] = type metadata accessor for EmailExtractor(0);
  v3[12] = swift_task_alloc();
  return _swift_task_switch(sub_100017E60, 0, 0);
}

uint64_t sub_100017E60()
{
  uint64_t v54 = v0;
  if (qword_1000440D8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1000044B8(*(void *)(v0 + 48), (uint64_t)qword_100044AF0);
  uint64_t v2 = sub_100038240();
  os_log_type_t v3 = sub_100038460();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Running extract step.", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = *(void *)(v0 + 32);

  sub_1000206DC(v5, v0 + 121, &qword_1000442D0);
  sub_1000206DC(v0 + 121, v0 + 120, &qword_1000442D0);
  int v6 = *(unsigned __int8 *)(v0 + 120);
  if (v6 == 2)
  {
    uint64_t v7 = *(void *)(v0 + 32);
    (*(void (**)(void, uint64_t, void))(*(void *)(v0 + 56) + 16))(*(void *)(v0 + 64), v1, *(void *)(v0 + 48));
    sub_100020740(v7, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_10001DE04, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10001DE34);
    id v8 = sub_100038240();
    os_log_type_t v9 = sub_100038480();
    BOOL v10 = os_log_type_enabled(v8, v9);
    uint64_t v12 = *(void *)(v0 + 56);
    uint64_t v11 = *(void *)(v0 + 64);
    uint64_t v13 = *(void *)(v0 + 48);
    uint64_t v14 = *(void *)(v0 + 32);
    if (v10)
    {
      uint64_t v51 = *(void *)(v0 + 64);
      uint64_t v49 = *(void *)(v0 + 48);
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v0 + 16) = sub_10001B980(7104878, 0xE300000000000000, &v53);
      sub_1000384B0();
      sub_100020740(v14, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_10001DF94, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10001DFC4);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Invalid source type %s.", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v51, v49);
    }
    else
    {
      sub_100020740(*(void *)(v0 + 32), (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_10001DF94, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10001DFC4);

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    }
    uint64_t v22 = *(void *)(v0 + 24);
    uint64_t v23 = sub_100037C20();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
    uint64_t v24 = 14;
    goto LABEL_19;
  }
  uint64_t v16 = *(void *)(v0 + 32);
  if (v6)
  {
    uint64_t v25 = *(void *)(v16 + 112);
    if (v25 == 1)
    {
      char v18 = sub_100038240();
      os_log_type_t v19 = sub_100038480();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v20 = 0;
        uint64_t v21 = "Missing transparencty extract parameters.";
        goto LABEL_17;
      }
LABEL_18:
      uint64_t v26 = *(void *)(v0 + 24);

      uint64_t v27 = sub_100037C20();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v26, 1, 1, v27);
      uint64_t v24 = 5;
LABEL_19:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      NSDictionary v28 = *(uint64_t (**)(void, uint64_t))(v0 + 8);
      return v28(0, v24);
    }
    id v38 = *(void **)(v0 + 80);
    uint64_t v40 = *(void *)(v16 + 136);
    uint64_t v39 = *(void *)(v16 + 144);
    uint64_t v42 = *(void *)(v16 + 120);
    uint64_t v41 = *(void *)(v16 + 128);
    uint64_t v44 = *(void *)(v16 + 96);
    uint64_t v43 = *(void *)(v16 + 104);
    sub_1000205CC(*(void *)(v0 + 40), (uint64_t)v38 + *(int *)(*(void *)(v0 + 72) + 20), &qword_1000440F0);
    void *v38 = v44;
    v38[1] = v43;
    v38[2] = v25;
    v38[3] = v42;
    v38[4] = v41;
    v38[5] = v40;
    v38[6] = v39;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v45 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v45;
    *uint64_t v45 = v0;
    v45[1] = sub_1000186B0;
    uint64_t v46 = *(void *)(v0 + 24);
    return sub_100033018(v46);
  }
  else
  {
    uint64_t v17 = *(void *)(v16 + 56);
    if (v17 == 2)
    {
      char v18 = sub_100038240();
      os_log_type_t v19 = sub_100038480();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v20 = 0;
        uint64_t v21 = "Missing email extract parameters.";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v18, v19, v21, v20, 2u);
        swift_slowDealloc();
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    uint64_t v30 = *(void *)(v0 + 96);
    uint64_t v31 = *(void *)(v16 + 72);
    uint64_t v52 = *(void *)(v16 + 80);
    uint64_t v32 = *(void *)(v16 + 64);
    int v50 = *(_DWORD *)(v16 + 48);
    uint64_t v33 = *(void *)(v16 + 32);
    uint64_t v48 = *(void *)(v16 + 40);
    uint64_t v34 = *(void *)(v16 + 24);
    long long v47 = *(_OWORD *)(v16 + 8);
    char v35 = *(unsigned char *)(v16 + 88);
    sub_1000205CC(*(void *)(v0 + 40), v30 + *(int *)(*(void *)(v0 + 88) + 20), &qword_1000440F0);
    *(_OWORD *)uint64_t v30 = v47;
    *(void *)(v30 + 16) = v34;
    *(_WORD *)(v30 + 24) = v33;
    *(unsigned char *)(v30 + 26) = BYTE2(v33);
    *(void *)(v30 + 32) = v48;
    *(unsigned char *)(v30 + 40) = v50 & 1;
    *(void *)(v30 + 48) = v17;
    *(void *)(v30 + 56) = v32;
    *(void *)(v30 + 64) = v31;
    *(void *)(v30 + 72) = v52;
    *(unsigned char *)(v30 + 80) = v35;
    sub_10001DE24(v17);
    uint64_t v36 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v36;
    *uint64_t v36 = v0;
    v36[1] = sub_10001852C;
    uint64_t v37 = *(void *)(v0 + 24);
    return sub_100030DA4(v37);
  }
}

uint64_t sub_10001852C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(*v2 + 96);
  uint64_t v6 = *v2;
  swift_task_dealloc();
  sub_1000207F4(v5, type metadata accessor for EmailExtractor);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  return v7(a1, a2);
}

uint64_t sub_1000186B0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(*v2 + 80);
  uint64_t v6 = *v2;
  swift_task_dealloc();
  sub_1000207F4(v5, type metadata accessor for TransparencyExtractor);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  return v7(a1, a2);
}

uint64_t sub_100018834(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[27] = a3;
  v4[28] = a4;
  v4[25] = a1;
  v4[26] = a2;
  v4[29] = type metadata accessor for EmbedParameters(0);
  v4[30] = swift_task_alloc();
  uint64_t v5 = sub_100037DF0();
  v4[31] = v5;
  v4[32] = *(void *)(v5 - 8);
  v4[33] = swift_task_alloc();
  uint64_t v6 = sub_100037E30();
  v4[34] = v6;
  v4[35] = *(void *)(v6 - 8);
  v4[36] = swift_task_alloc();
  return _swift_task_switch(sub_100018984, 0, 0);
}

uint64_t sub_100018984()
{
  if (qword_1000440D8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0 + 25;
  uint64_t v1 = v0[25];
  uint64_t v3 = sub_100038260();
  v0[37] = sub_1000044B8(v3, (uint64_t)qword_100044AF0);
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_100038240();
  os_log_type_t v5 = sub_100038460();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *v2;
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 134217984;
    if (v6) {
      uint64_t v8 = *(void *)(v1 + 16);
    }
    else {
      uint64_t v8 = 0;
    }
    v0[24] = v8;
    sub_1000384B0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Running embed step on %ld items.", v7, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  if (*v2)
  {
    uint64_t v9 = v0[29];
    uint64_t v10 = v0[26];
    uint64_t v11 = v10 + *(int *)(v9 + 20);
    uint64_t v12 = (uint64_t *)(v10 + *(int *)(v9 + 24));
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    swift_bridgeObjectRetain();
    uint64_t v15 = (void *)swift_task_alloc();
    v0[38] = v15;
    void *v15 = v0;
    v15[1] = sub_100018C50;
    return sub_100022514((uint64_t)(v0 + 7), v11, v13, v14);
  }
  else
  {
    uint64_t v17 = sub_100038240();
    os_log_type_t v18 = sub_100038480();
    if (os_log_type_enabled(v17, v18))
    {
      os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Extracted items must not be nil.", v19, 2u);
      swift_slowDealloc();
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v20 = (uint64_t (*)(void, uint64_t))v0[1];
    return v20(0, 10);
  }
}

uint64_t sub_100018C50()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100018D4C, 0, 0);
}

uint64_t sub_100018D4C()
{
  uint64_t v43 = v0;
  uint64_t v1 = (void *)(v0 + 176);
  if (!*(void *)(v0 + 80))
  {
    uint64_t v8 = *(void *)(v0 + 240);
    uint64_t v9 = *(void *)(v0 + 208);
    swift_bridgeObjectRelease();
    sub_100020974(v0 + 56, &qword_1000442A0);
    sub_100020854(v9, v8, type metadata accessor for EmbedParameters);
    uint64_t v10 = sub_100038240();
    os_log_type_t v11 = sub_100038480();
    BOOL v12 = os_log_type_enabled(v10, v11);
    uint64_t v13 = *(void *)(v0 + 240);
    if (v12)
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315138;
      uint64_t v15 = sub_100037D80();
      *(void *)(v0 + 168) = sub_10001B980(v15, v16, &v42);
      sub_1000384B0();
      swift_bridgeObjectRelease();
      sub_1000207F4(v13, type metadata accessor for EmbedParameters);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Failed to create embedder %s.", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_1000207F4(*(void *)(v0 + 240), type metadata accessor for EmbedParameters);
    }

    uint64_t v29 = 0;
    uint64_t v30 = 11;
    goto LABEL_21;
  }
  uint64_t v2 = (void *)(v0 + 16);
  sub_1000044F0((long long *)(v0 + 56), v0 + 16);
  sub_1000208BC(v0 + 16, v0 + 96);
  uint64_t v3 = sub_100038240();
  os_log_type_t v4 = sub_100038460();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v5 = 136315138;
    sub_100004508((void *)(v0 + 96), *(void *)(v0 + 120));
    uint64_t v1 = (void *)(v0 + 176);
    uint64_t v6 = sub_100037FB0();
    *(void *)(v0 + 184) = sub_10001B980(v6, v7, &v42);
    sub_1000384B0();
    swift_bridgeObjectRelease();
    sub_100003FD8(v0 + 96);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Embedding model: %s", v5, 0xCu);
    swift_arrayDestroy();
    uint64_t v2 = (void *)(v0 + 16);
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_100003FD8(v0 + 96);
  }

  uint64_t v17 = *(void *)(v0 + 200);
  *(void *)(v0 + 160) = _swiftEmptyArrayStorage;
  uint64_t v18 = *(void *)(v17 + 16);
  *(void *)(v0 + 312) = v18;
  if (!v18)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_100038240();
    os_log_type_t v32 = sub_100038460();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 134217984;
      *uint64_t v1 = _swiftEmptyArrayStorage[2];
      sub_1000384B0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Finished embed step. Generated %ld embedding vectors.", v33, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    swift_beginAccess();
    uint64_t v29 = *(void *)(v0 + 160);
    sub_100003FD8((uint64_t)v2);
    uint64_t v30 = 17;
LABEL_21:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v40 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    return v40(v29, v30);
  }
  uint64_t v19 = *(void *)(v0 + 272);
  uint64_t v20 = *(void *)(v0 + 280);
  uint64_t v21 = *(void (**)(void, unint64_t, uint64_t))(v20 + 16);
  v20 += 16;
  int v22 = *(_DWORD *)(v20 + 64);
  *(_DWORD *)(v0 + 368) = v22;
  *(void *)(v0 + 320) = *(void *)(v20 + 56);
  *(void *)(v0 + 328) = v21;
  *(void *)(v0 + 336) = 0;
  v21(*(void *)(v0 + 288), v17 + ((v22 + 32) & ~(unint64_t)v22), v19);
  if (sub_100038430())
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v23 = sub_100038240();
    os_log_type_t v24 = sub_100038460();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Task canceled at embedding loop.", v25, 2u);
      swift_slowDealloc();
    }
    uint64_t v27 = *(void *)(v0 + 280);
    uint64_t v26 = *(void *)(v0 + 288);
    uint64_t v28 = *(void *)(v0 + 272);

    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
    sub_100003FD8((uint64_t)v2);
    uint64_t v29 = 0;
    uint64_t v30 = 10;
    goto LABEL_21;
  }
  uint64_t v34 = *(void *)(v0 + 40);
  uint64_t v35 = *(void *)(v0 + 48);
  sub_100004508(v2, v34);
  uint64_t v36 = sub_100037E00();
  uint64_t v38 = v37;
  *(void *)(v0 + 344) = v37;
  uint64_t v39 = (void *)swift_task_alloc();
  *(void *)(v0 + 352) = v39;
  void *v39 = v0;
  v39[1] = sub_1000193A8;
  return dispatch thunk of Embedder.embed(text:)(v36, v38, v34, v35);
}

uint64_t sub_1000193A8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 360) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_1000194C8, 0, 0);
}

uint64_t sub_1000194C8()
{
  if (!*(void *)(v0 + 360))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v16 = sub_100038240();
    os_log_type_t v17 = sub_100038480();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      uint64_t v19 = "Failed to generate embedding.";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v16, v17, v19, v18, 2u);
      swift_slowDealloc();
    }
LABEL_15:
    uint64_t v23 = *(void *)(v0 + 280);
    uint64_t v22 = *(void *)(v0 + 288);
    uint64_t v24 = *(void *)(v0 + 272);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    uint64_t v25 = 0;
    uint64_t v26 = 10;
LABEL_18:
    sub_100003FD8(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v27 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    return v27(v25, v26);
  }
  sub_100037E20();
  sub_100004508((void *)(v0 + 16), *(void *)(v0 + 40));
  sub_100037FB0();
  swift_bridgeObjectRetain();
  sub_100037DC0();
  unint64_t v1 = *(void *)(v0 + 160);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v1 = sub_10001B4A8(0, *(void *)(v1 + 16) + 1, 1, v1, &qword_1000442F0, (uint64_t (*)(void))&type metadata accessor for EmbeddingItem, (uint64_t (*)(void))&type metadata accessor for EmbeddingItem);
  }
  unint64_t v3 = *(void *)(v1 + 16);
  unint64_t v2 = *(void *)(v1 + 24);
  if (v3 >= v2 >> 1) {
    unint64_t v1 = sub_10001B4A8(v2 > 1, v3 + 1, 1, v1, &qword_1000442F0, (uint64_t (*)(void))&type metadata accessor for EmbeddingItem, (uint64_t (*)(void))&type metadata accessor for EmbeddingItem);
  }
  uint64_t v4 = *(void *)(v0 + 312);
  uint64_t v6 = *(void *)(v0 + 280);
  uint64_t v5 = *(void *)(v0 + 288);
  uint64_t v7 = *(void *)(v0 + 264);
  uint64_t v8 = *(void *)(v0 + 272);
  uint64_t v9 = *(void *)(v0 + 248);
  uint64_t v10 = *(void *)(v0 + 256);
  uint64_t v11 = *(void *)(v0 + 336) + 1;
  *(void *)(v1 + 16) = v3 + 1;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v10 + 32))(v1+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(void *)(v10 + 72) * v3, v7, v9);
  *(void *)(v0 + 160) = v1;
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v8);
  if (v11 == v4)
  {
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v0 + 160);
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_100038240();
    os_log_type_t v14 = sub_100038460();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 134217984;
      *(void *)(v0 + 176) = *(void *)(v12 + 16);
      sub_1000384B0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Finished embed step. Generated %ld embedding vectors.", v15, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    swift_beginAccess();
    uint64_t v25 = *(void *)(v0 + 160);
    uint64_t v26 = 17;
    goto LABEL_18;
  }
  uint64_t v20 = *(void (**)(void, unint64_t, void))(v0 + 328);
  uint64_t v21 = *(void *)(v0 + 336) + 1;
  *(void *)(v0 + 336) = v21;
  v20(*(void *)(v0 + 288), *(void *)(v0 + 200)+ ((*(unsigned __int8 *)(v0 + 368) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 368))+ *(void *)(v0 + 320) * v21, *(void *)(v0 + 272));
  if (sub_100038430())
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v16 = sub_100038240();
    os_log_type_t v17 = sub_100038460();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      uint64_t v19 = "Task canceled at embedding loop.";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  uint64_t v29 = *(void *)(v0 + 40);
  uint64_t v30 = *(void *)(v0 + 48);
  sub_100004508((void *)(v0 + 16), v29);
  uint64_t v31 = sub_100037E00();
  uint64_t v33 = v32;
  *(void *)(v0 + 344) = v32;
  uint64_t v34 = (void *)swift_task_alloc();
  *(void *)(v0 + 352) = v34;
  *uint64_t v34 = v0;
  v34[1] = sub_1000193A8;
  return dispatch thunk of Embedder.embed(text:)(v31, v33, v29, v30);
}

uint64_t sub_1000199F4()
{
  uint64_t v0 = type metadata accessor for ZeoliteExtensionConfig(0);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (uint64_t *)((char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100003F3C(&qword_100044158);
  sub_1000380A0();
  uint64_t v3 = *v2;
  sub_1000207F4((uint64_t)v2, type metadata accessor for ZeoliteExtensionConfig);
  return v3;
}

unint64_t *sub_100019A94(uint64_t a1)
{
  uint64_t v16 = sub_100037DF0();
  uint64_t v3 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v6)
  {
    v13[1] = v1;
    os_log_type_t v17 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_100035A00(0, v6, 0);
    uint64_t v7 = v17;
    uint64_t v8 = *(void *)(sub_100038220() - 8);
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v14 = *(void *)(v8 + 72);
    uint64_t v15 = v3;
    v13[2] = v3 + 32;
    do
    {
      sub_100038190();
      sub_1000381F0();
      sub_1000381B0();
      sub_100038170();
      sub_100037DC0();
      os_log_type_t v17 = v7;
      unint64_t v11 = v7[2];
      unint64_t v10 = v7[3];
      if (v11 >= v10 >> 1)
      {
        sub_100035A00(v10 > 1, v11 + 1, 1);
        uint64_t v7 = v17;
      }
      v7[2] = v11 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))((unint64_t)v7+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(void *)(v15 + 72) * v11, v5, v16);
      v9 += v14;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_100019CC0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v63 = a5;
  uint64_t v64 = a6;
  uint64_t v62 = a4;
  LODWORD(v6) = a3;
  uint64_t v66 = a2;
  uint64_t v65 = sub_100037FA0();
  uint64_t v8 = *(void *)(v65 - 8);
  uint64_t v9 = __chkstk_darwin(v65);
  unint64_t v11 = &v48[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v9);
  uint64_t v13 = &v48[-v12];
  uint64_t v61 = sub_100003F3C(&qword_100044348);
  __chkstk_darwin(v61);
  uint64_t v60 = &v48[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_1000440D8 != -1) {
    goto LABEL_27;
  }
  while (1)
  {
    uint64_t v15 = sub_100038260();
    uint64_t v16 = sub_1000044B8(v15, (uint64_t)qword_100044AF0);
    os_log_type_t v17 = sub_100038240();
    os_log_type_t v18 = sub_100038460();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Running analysis step.", v19, 2u);
      swift_slowDealloc();
    }

    if (!v66 || !a1) {
      break;
    }
    if ((v6 & 1) == 0) {
      goto LABEL_21;
    }
    uint64_t v50 = v16;
    int v49 = v6;
    uint64_t v20 = *(void *)(a1 + 16);
    uint64_t v51 = a1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a1 = v65;
    uint64_t v59 = v20;
    if (!v20)
    {
LABEL_17:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v39 = sub_100038240();
      os_log_type_t v40 = sub_100038460();
      if (os_log_type_enabled(v39, v40))
      {
        uint64_t v41 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v41 = 134217984;
        aBlock[0] = v59;
        sub_1000384B0();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v39, v40, "Finished sending %ld events to CoreAnalytics.", v41, 0xCu);
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease();
      }
      LOWORD(v6) = v49;
LABEL_21:
      if ((v6 & 0x100) != 0)
      {
        sub_100037F70();
        swift_bridgeObjectRetain();
        uint64_t v42 = sub_100038240();
        os_log_type_t v43 = sub_100038460();
        if (os_log_type_enabled(v42, v43))
        {
          uint64_t v44 = (uint8_t *)swift_slowAlloc();
          aBlock[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v44 = 136315138;
          sub_100037E70();
          swift_bridgeObjectRetain();
          uint64_t v45 = sub_1000383A0();
          unint64_t v47 = v46;
          swift_bridgeObjectRelease();
          v68[4] = sub_10001B980(v45, v47, aBlock);
          sub_1000384B0();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v42, v43, "Mean top-k percentiles: %s", v44, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
      }
      return 17;
    }
    unint64_t v6 = 0;
    uint64_t v21 = *(void (**)(unsigned char *, unint64_t, uint64_t))(v8 + 16);
    v8 += 16;
    uint64_t v57 = v21;
    unint64_t v22 = v51 + ((*(unsigned __int8 *)(v8 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64));
    uint64_t v55 = *(void *)(v8 + 56);
    uint64_t v54 = v66 + 32;
    uint64_t v23 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16);
    uint64_t v53 = v68;
    uint64_t v58 = v8;
    uint64_t v56 = (void (**)(unsigned char *, uint64_t))(v8 - 8);
    unint64_t v52 = 0x80000001000391A0;
    while (1)
    {
      v57(v13, v22, a1);
      unint64_t v24 = *(void *)(v66 + 16);
      if (v6 == v24)
      {
        (*v56)(v13, a1);
        goto LABEL_17;
      }
      if (v6 >= v24) {
        break;
      }
      unint64_t v25 = v6 + 1;
      uint64_t v26 = *(void *)(v54 + 8 * v6);
      uint64_t v27 = v60;
      uint64_t v28 = *(int *)(v61 + 48);
      uint64_t v29 = *v23;
      (*v23)(v60, v13, a1);
      *(void *)&v27[v28] = v26;
      v29(v11, v27, a1);
      uint64_t v8 = v64;
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_100037F90();
      uint64_t v31 = sub_100037F80();
      NSString v32 = sub_100038300();
      uint64_t v33 = (void *)swift_allocObject();
      v33[2] = v63;
      v33[3] = v8;
      v33[4] = v62;
      v33[5] = v26;
      v33[6] = v30;
      v33[7] = v31;
      a1 = v65;
      v68[2] = sub_100020A18;
      v68[3] = v33;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      v68[0] = sub_10001AAFC;
      v68[1] = &unk_1000420A0;
      uint64_t v34 = _Block_copy(aBlock);
      swift_release();
      AnalyticsSendEventLazy();
      _Block_release(v34);

      (*v56)(v11, a1);
      v22 += v55;
      unint64_t v6 = v25;
      if (v59 == v25) {
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_27:
    swift_once();
  }
  uint64_t v35 = sub_100038240();
  os_log_type_t v36 = sub_100038480();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v37 = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, v36, "Scores and item IDs must not be nil.", v37, 2u);
    swift_slowDealloc();
  }

  return 13;
}

uint64_t sub_10001A3F0()
{
  uint64_t v0 = type metadata accessor for ZeoliteExtensionConfig(0);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003F3C(&qword_100044158);
  sub_1000380A0();
  uint64_t v3 = sub_100026558();
  sub_1000207F4((uint64_t)v2, type metadata accessor for ZeoliteExtensionConfig);
  return v3;
}

uint64_t sub_10001A4A8@<X0>(uint64_t *a1@<X8>)
{
  unint64_t v2 = (int *)type metadata accessor for ZeoliteExtensionConfig(0);
  __chkstk_darwin();
  uint64_t v4 = &v11[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_100038030();
  *a1 = sub_100038020();
  type metadata accessor for ZeoliteExtension();
  *(void *)uint64_t v4 = 0;
  *((_WORD *)v4 + 4) = 0;
  *((void *)v4 + 2) = 0;
  v4[24] = 1;
  *((void *)v4 + 4) = &off_1000412C0;
  sub_10001CFCC((uint64_t)v11);
  sub_1000206DC((uint64_t)v11, (uint64_t)(v4 + 40), &qword_100044228);
  uint64_t v5 = &v4[v2[10]];
  uint64_t v6 = type metadata accessor for EmbedParameters(0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = &v4[v2[11]];
  *uint64_t v7 = 0;
  v7[1] = 0;
  v7[2] = 0;
  v7[3] = 1;
  v7[4] = 0;
  v7[5] = 0;
  *(_WORD *)&v4[v2[12]] = 2;
  uint64_t v8 = &v4[v2[13]];
  sub_100020584(&qword_1000441D0, (void (*)(uint64_t))type metadata accessor for ZeoliteExtensionConfig);
  sub_100020584((unint64_t *)&unk_1000441D8, (void (*)(uint64_t))type metadata accessor for ZeoliteExtensionConfig);
  *uint64_t v8 = 0u;
  v8[1] = 0u;
  return sub_100038090();
}

uint64_t sub_10001A680(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100020BCC;
  return sub_100005604(a1);
}

uint64_t sub_10001A714(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10001A7A8;
  return sub_1000062B4(a1);
}

uint64_t sub_10001A7A8(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_10001A8A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  void *v15 = v7;
  v15[1] = sub_10001A988;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_10001A988()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001AA7C(uint64_t a1)
{
  uint64_t v2 = sub_100020584(&qword_100044220, (void (*)(uint64_t))type metadata accessor for ZeoliteExtension);

  return MLHostExtension.configuration.getter(a1, v2);
}

Class sub_10001AAFC(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_100020A54();
    v4.super.Class isa = sub_1000382B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return v4.super.isa;
}

uint64_t sub_10001AB88()
{
  uint64_t v1 = sub_1000387D0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  NSDictionary v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[3] = type metadata accessor for ZeoliteExtensionConfig(0);
  uint64_t v5 = sub_10001CFF4(v12);
  sub_100020854(v0, (uint64_t)v5, type metadata accessor for ZeoliteExtensionConfig);
  sub_1000387B0();
  sub_1000387C0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v6 = sub_10001AD50();
  swift_release();
  v12[0] = 0xD000000000000017;
  v12[1] = 0x8000000100039000;
  unint64_t v11 = v6;
  sub_100003F3C(&qword_100044230);
  sub_100020698(&qword_100044238, &qword_100044230);
  uint64_t v7 = sub_1000382E0();
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = v7;
  v13._object = v9;
  sub_100038340(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 41;
  v14._object = (void *)0xE100000000000000;
  sub_100038340(v14);
  return v12[0];
}

void *sub_10001AD50()
{
  swift_retain();
  sub_100038540();
  swift_release();
  sub_1000385C0();
  if (*((void *)&v11 + 1))
  {
    uint64_t v0 = _swiftEmptyArrayStorage;
    do
    {
      long long v6 = v9;
      long long v7 = v10;
      long long v8 = v11;
      v1._object = (void *)*((void *)&v9 + 1);
      if (*((void *)&v9 + 1))
      {
        v1._countAndFlagsBits = v6;
        sub_100038340(v1);
        v12._countAndFlagsBits = 8250;
        v12._object = (void *)0xE200000000000000;
        sub_100038340(v12);
        sub_100004508(&v7, *((uint64_t *)&v8 + 1));
        sub_1000386F0();
        sub_100020974((uint64_t)&v6, &qword_100044240);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v0 = sub_10001B364(0, v0[2] + 1, 1, v0);
        }
        unint64_t v3 = v0[2];
        unint64_t v2 = v0[3];
        if (v3 >= v2 >> 1) {
          uint64_t v0 = sub_10001B364((void *)(v2 > 1), v3 + 1, 1, v0);
        }
        v0[2] = v3 + 1;
        NSDictionary v4 = &v0[2 * v3];
        v4[4] = 0;
        v4[5] = 0xE000000000000000;
      }
      else
      {
        sub_100020974((uint64_t)&v6, &qword_100044240);
      }
      sub_1000385C0();
    }
    while (*((void *)&v11 + 1));
  }
  else
  {
    uint64_t v0 = _swiftEmptyArrayStorage;
  }
  swift_release();
  return v0;
}

int main(int argc, const char **argv, const char **envp)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  type metadata accessor for ZeoliteExtension();
  sub_100020584(&qword_100044108, (void (*)(uint64_t))type metadata accessor for ZeoliteExtension);
  sub_100037FD0();
  swift_release();
  return 0;
}

uint64_t sub_10001AFE4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(result + 16);
  if (v4)
  {
    uint64_t v8 = swift_bridgeObjectRetain() + 40;
    do
    {
      long long v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 - 8);
      swift_retain();
      v9(a2, a3, a4);
      swift_release();
      v8 += 16;
      --v4;
    }
    while (v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10001B07C(void (*a1)(uint64_t))
{
  uint64_t v2 = sub_100037BC0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  long long v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1(v4);
  sub_100020584(&qword_1000442B8, (void (*)(uint64_t))&type metadata accessor for URL);
  uint64_t v7 = sub_1000386E0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return v7;
}

uint64_t sub_10001B1A4(int64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *Swift::String v1 = v3;
  if (!result || a1 > *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v3 + 16) <= a1) {
      int64_t v5 = a1;
    }
    else {
      int64_t v5 = *(void *)(v3 + 16);
    }
    return sub_1000359E0(result, v5, 0);
  }
  return result;
}

uint64_t sub_10001B21C()
{
  unint64_t v1 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if (!result)
  {
    uint64_t result = sub_10001B4A8(0, *(void *)(v1 + 16) + 1, 1, v1, &qword_1000442F8, (uint64_t (*)(void))&type metadata accessor for ZeoliteEmbedding, (uint64_t (*)(void))&type metadata accessor for ZeoliteEmbedding);
    *uint64_t v0 = result;
  }
  return result;
}

uint64_t sub_10001B298(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  *(void *)(v5 + 16) = a1 + 1;
  uint64_t v6 = sub_100038220();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32);
  uint64_t v9 = v6;
  unint64_t v10 = v5
      + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))
      + *(void *)(v7 + 72) * a1;

  return v8(v10, a2, v9);
}

uint64_t sub_10001B330(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10001B4A8(a1, a2, a3, a4, &qword_1000442F8, (uint64_t (*)(void))&type metadata accessor for ZeoliteEmbedding, (uint64_t (*)(void))&type metadata accessor for ZeoliteEmbedding);
}

void *sub_10001B364(void *result, int64_t a2, char a3, void *a4)
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
      sub_100003F3C(&qword_100044248);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      Swift::String v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = _swiftEmptyArrayStorage;
      Swift::String v13 = &_swiftEmptyArrayStorage[4];
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
    sub_10001DC2C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001B474(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10001B4A8(a1, a2, a3, a4, &qword_1000442E0, (uint64_t (*)(void))&type metadata accessor for ExtractedConversation, (uint64_t (*)(void))&type metadata accessor for ExtractedConversation);
}

uint64_t sub_10001B4A8(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    os_log_type_t v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100003F3C(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  os_log_type_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_100038560();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001E178(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_10001B728(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10001B4A8(a1, a2, a3, a4, &qword_1000442D8, (uint64_t (*)(void))&type metadata accessor for ExtractedMessage, (uint64_t (*)(void))&type metadata accessor for ExtractedMessage);
}

uint64_t sub_10001B75C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10001B4A8(a1, a2, a3, a4, &qword_1000442E8, (uint64_t (*)(void))&type metadata accessor for ExtractedItem, (uint64_t (*)(void))&type metadata accessor for ExtractedItem);
}

char *sub_10001B790(char *result, int64_t a2, char a3, char *a4)
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
      sub_100003F3C(&qword_100044340);
      unint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10001E2D4(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001B8A0(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  sub_10001B980(0xD000000000000011, 0x80000001000390C0, a3);
  uint64_t v4 = *a1 + 8;
  uint64_t result = sub_1000384B0();
  *a1 = v4;
  return result;
}

uint64_t sub_10001B908(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10001B980(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_1000384B0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10001B980(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001BA54(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100020A94((uint64_t)v12, *a3);
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
      sub_100020A94((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100003FD8((uint64_t)v12);
  return v7;
}

uint64_t sub_10001BA54(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000384C0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10001BC10(a5, a6);
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
  uint64_t v8 = sub_100038500();
  if (!v8)
  {
    sub_100038560();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000385B0();
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

uint64_t sub_10001BC10(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001BCA8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001BE88(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001BE88(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001BCA8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001BE20(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000384E0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100038560();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100038350();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000385B0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100038560();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001BE20(uint64_t a1, uint64_t a2)
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
  sub_100003F3C(&qword_100044358);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001BE88(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003F3C(&qword_100044358);
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
  uint64_t result = sub_1000385B0();
  __break(1u);
  return result;
}

uint64_t sub_10001BFD8()
{
  uint64_t v1 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if ((result & 1) == 0)
  {
    int64_t v3 = *(void *)(v1 + 16) + 1;
    return sub_1000359E0(0, v3, 1);
  }
  return result;
}

uint64_t sub_10001C034(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  int64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
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
  int64_t v3 = sub_10001B790(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  int64_t v9 = &v3[4 * v8 + 32];
  if (a1 + 32 < (unint64_t)&v9[4 * v2] && (unint64_t)v9 < a1 + 32 + 4 * v2) {
    goto LABEL_24;
  }
  memcpy(v9, (const void *)(a1 + 32), 4 * v2);
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = *((void *)v3 + 2);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *((void *)v3 + 2) = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1000385B0();
  __break(1u);
  return result;
}

uint64_t _s16ZeoliteExtension0aB5ErrorO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_100038720();
  swift_bridgeObjectRelease();
  if (v0 >= 0x11) {
    return 17;
  }
  else {
    return v0;
  }
}

uint64_t _s16ZeoliteExtension0aB6StatesO8rawValueACSgSS_tcfC_0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100041110;
  v6._object = a2;
  unint64_t v4 = sub_1000385D0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

uint64_t type metadata accessor for ZeoliteExtension()
{
  uint64_t result = qword_1000441B8;
  if (!qword_1000441B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_10001C26C()
{
  unint64_t result = qword_100044110;
  if (!qword_100044110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044110);
  }
  return result;
}

unint64_t sub_10001C2C4()
{
  unint64_t result = qword_100044118;
  if (!qword_100044118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044118);
  }
  return result;
}

unint64_t sub_10001C31C()
{
  unint64_t result = qword_100044120;
  if (!qword_100044120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044120);
  }
  return result;
}

unint64_t sub_10001C374()
{
  unint64_t result = qword_100044128;
  if (!qword_100044128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044128);
  }
  return result;
}

unint64_t sub_10001C3CC()
{
  unint64_t result = qword_100044130;
  if (!qword_100044130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044130);
  }
  return result;
}

unint64_t sub_10001C424()
{
  unint64_t result = qword_100044138;
  if (!qword_100044138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044138);
  }
  return result;
}

unint64_t sub_10001C47C()
{
  unint64_t result = qword_100044140;
  if (!qword_100044140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044140);
  }
  return result;
}

uint64_t sub_10001C4D0()
{
  return sub_100020698(&qword_100044148, &qword_100044150);
}

uint64_t sub_10001C50C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for ZeoliteExtensionError(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ZeoliteExtensionError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF0) {
    goto LABEL_17;
  }
  if (a2 + 16 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 16) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 16;
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
      return (*a1 | (v4 << 8)) - 16;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 16;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x11;
  int v8 = v6 - 17;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ZeoliteExtensionError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 16 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 16) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEF)
  {
    unsigned int v6 = ((a2 - 240) >> 8) + 1;
    *uint64_t result = a2 + 16;
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
        JUMPOUT(0x10001C6C0);
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
          *uint64_t result = a2 + 16;
        break;
    }
  }
  return result;
}

uint64_t sub_10001C6E8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10001C6F0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ZeoliteExtensionError()
{
  return &type metadata for ZeoliteExtensionError;
}

uint64_t getEnumTagSinglePayload for ZeoliteExtensionStates(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ZeoliteExtensionStates(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001C864);
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

ValueMetadata *type metadata accessor for ZeoliteExtensionStates()
{
  return &type metadata for ZeoliteExtensionStates;
}

uint64_t *sub_10001C89C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(int *)(a3 + 20);
    BOOL v7 = (char *)a1 + v6;
    int v8 = (char *)a2 + v6;
    swift_retain();
    uint64_t v9 = sub_100003F3C(&qword_100044158);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  }
  return a1;
}

uint64_t sub_10001C968(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_100003F3C(&qword_100044158);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_10001C9E4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  swift_retain();
  uint64_t v7 = sub_100003F3C(&qword_100044158);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

void *sub_10001CA68(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  int v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100003F3C(&qword_100044158);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

void *sub_10001CB00(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_100003F3C(&qword_100044158);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_10001CB80(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  int v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100003F3C(&qword_100044158);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_10001CC10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001CC24);
}

uint64_t sub_10001CC24(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100003F3C(&qword_100044158);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10001CCD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001CCEC);
}

void *sub_10001CCEC(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100003F3C(&qword_100044158);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_10001CD98()
{
  sub_10001CE34();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10001CE34()
{
  if (!qword_1000441C8)
  {
    type metadata accessor for ZeoliteExtensionConfig(255);
    sub_100020584(&qword_1000441D0, (void (*)(uint64_t))type metadata accessor for ZeoliteExtensionConfig);
    sub_100020584((unint64_t *)&unk_1000441D8, (void (*)(uint64_t))type metadata accessor for ZeoliteExtensionConfig);
    unint64_t v0 = sub_1000380C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000441C8);
    }
  }
}

uint64_t sub_10001CF00()
{
  return sub_100020584(&qword_100044108, (void (*)(uint64_t))type metadata accessor for ZeoliteExtension);
}

uint64_t sub_10001CF48()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

double sub_10001CFCC(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(void *)(a1 + 112) = 2;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  return result;
}

uint64_t *sub_10001CFF4(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10001D058(uint64_t a1)
{
  uint64_t v2 = sub_100037C20();
  uint64_t v59 = *(void *)(v2 - 8);
  uint64_t v60 = v2;
  __chkstk_darwin(v2);
  uint64_t v58 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100003F3C(&qword_100044268);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ExecutionState(0);
  id v62 = *(id *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ZeoliteExtensionConfig(0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (uint64_t *)((char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v61 = (uint64_t *)((char *)&v58 - v15);
  __chkstk_darwin(v14);
  uint64_t v63 = (uint64_t *)((char *)&v58 - v16);
  uint64_t v17 = sub_100038260();
  uint64_t v65 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v64 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v20 = sub_100038300();
  id v21 = [v19 initWithSuiteName:v20];

  if (!v21)
  {
    if (qword_1000440D8 != -1) {
      swift_once();
    }
    sub_1000044B8(v17, (uint64_t)qword_100044AF0);
    os_log_type_t v36 = sub_100038240();
    os_log_type_t v37 = sub_100038480();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v67 = swift_slowAlloc();
      *(_DWORD *)uint64_t v38 = 136315138;
      uint64_t v69 = sub_10001B980(0xD000000000000011, 0x80000001000390C0, &v67);
      sub_1000384B0();
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Failed to fetch suite %s from user defaults.", v38, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    return 0;
  }
  sub_100026558();
  NSString v22 = sub_100038300();
  swift_bridgeObjectRelease();
  id v23 = [v21 dictionaryForKey:v22];

  uint64_t v24 = a1;
  if (!v23)
  {
    if (qword_1000440D8 != -1) {
      swift_once();
    }
    sub_1000044B8(v17, (uint64_t)qword_100044AF0);
    sub_100020854(a1, (uint64_t)v13, type metadata accessor for ZeoliteExtensionConfig);
    os_log_type_t v40 = sub_100038240();
    os_log_type_t v41 = sub_100038460();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v42 = 134217984;
      uint64_t v43 = *v13;
      sub_1000207F4((uint64_t)v13, type metadata accessor for ZeoliteExtensionConfig);
      uint64_t v67 = v43;
      sub_1000384B0();
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "No execution state has been tracked for config %ld. Allow the extension to run.", v42, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      sub_1000207F4((uint64_t)v13, type metadata accessor for ZeoliteExtensionConfig);
    }

    return 1;
  }
  sub_1000382C0();

  if (*(unsigned char *)(a1 + 9))
  {
    swift_bridgeObjectRelease();
    sub_100026558();
    NSString v44 = sub_100038300();
    swift_bridgeObjectRelease();
    [v21 removeObjectForKey:v44];

    if (qword_1000440D8 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_1000044B8(v17, (uint64_t)qword_100044AF0);
    unint64_t v47 = v64;
    uint64_t v46 = v65;
    (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v64, v45, v17);
    uint64_t v48 = v63;
    sub_100020854(v24, (uint64_t)v63, type metadata accessor for ZeoliteExtensionConfig);
    int v49 = sub_100038240();
    os_log_type_t v50 = sub_100038460();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      id v62 = v21;
      *(_DWORD *)uint64_t v51 = 136315138;
      uint64_t v67 = 0x6769666E6F63;
      unint64_t v68 = 0xE600000000000000;
      uint64_t v69 = v52;
      uint64_t v66 = *v48;
      v70._countAndFlagsBits = sub_1000386E0();
      sub_100038340(v70);
      swift_bridgeObjectRelease();
      uint64_t v67 = sub_10001B980(v67, v68, &v69);
      sub_1000384B0();
      swift_bridgeObjectRelease();
      sub_1000207F4((uint64_t)v48, type metadata accessor for ZeoliteExtensionConfig);
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "Reset values for %s in UserDefaults. Allow the extension to run.", v51, 0xCu);
      uint64_t v39 = 1;
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v65 + 8))(v64, v17);
      return v39;
    }
    sub_1000207F4((uint64_t)v48, type metadata accessor for ZeoliteExtensionConfig);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v17);
    return 1;
  }
  uint64_t v25 = swift_bridgeObjectRetain();
  sub_1000265C8(v25, (uint64_t)v6);
  if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v62 + 6))(v6, 1, v7) == 1)
  {
    sub_100020974((uint64_t)v6, &qword_100044268);
    if (qword_1000440D8 != -1) {
      swift_once();
    }
    sub_1000044B8(v17, (uint64_t)qword_100044AF0);
    uint64_t v26 = a1;
    uint64_t v27 = v61;
    sub_100020854(v26, (uint64_t)v61, type metadata accessor for ZeoliteExtensionConfig);
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_100038240();
    os_log_type_t v29 = sub_100038480();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v67 = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 134218242;
      uint64_t v31 = *v27;
      sub_1000207F4((uint64_t)v27, type metadata accessor for ZeoliteExtensionConfig);
      uint64_t v69 = v31;
      sub_1000384B0();
      *(_WORD *)(v30 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_1000382D0();
      id v62 = v21;
      uint64_t v33 = v32;
      unint64_t v35 = v34;
      swift_bridgeObjectRelease();
      uint64_t v69 = sub_10001B980(v33, v35, &v67);
      sub_1000384B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Failed to parse execution state for config %ld: %s", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_1000207F4((uint64_t)v27, type metadata accessor for ZeoliteExtensionConfig);

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  swift_bridgeObjectRelease();
  sub_100020B54((uint64_t)v6, (uint64_t)v9, type metadata accessor for ExecutionState);
  if (*(unsigned char *)(a1 + 24) == 1)
  {
    sub_1000207F4((uint64_t)v9, type metadata accessor for ExecutionState);

    return *(unsigned __int8 *)(a1 + 8);
  }
  uint64_t v54 = *(void *)(a1 + 16);
  uint64_t v55 = v58;
  sub_100037C10();
  sub_100037BE0();
  double v57 = v56;

  (*(void (**)(char *, uint64_t))(v59 + 8))(v55, v60);
  uint64_t result = sub_1000207F4((uint64_t)v9, type metadata accessor for ExecutionState);
  if ((~*(void *)&v57 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v57 <= -9.22337204e18)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if (v57 < 9.22337204e18)
  {
    if (v54 > (uint64_t)v57) {
      return *(unsigned __int8 *)(a1 + 8);
    }
    return 1;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_10001DC2C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_1000385B0();
  __break(1u);
  return result;
}

unint64_t sub_10001DD24()
{
  unint64_t result = qword_100044280;
  if (!qword_100044280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044280);
  }
  return result;
}

uint64_t sub_10001DD78()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char **sub_10001DD88(unsigned char **result)
{
  uint64_t v2 = *result;
  *uint64_t v2 = *(unsigned char *)(v1 + 16);
  *unint64_t result = v2 + 1;
  return result;
}

uint64_t sub_10001DD9C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001DDAC()
{
  return sub_100017C64();
}

uint64_t sub_10001DDB4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001DDC4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001DDD4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10001DDFC(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  return sub_10001B908(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

void sub_10001DE04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a7 != 2) {
    sub_10001DE24(a7);
  }
}

uint64_t sub_10001DE24(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10001DE34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10001DE88(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 112);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 - 1) & ~(((int)v1 - 1) >> 31);
}

uint64_t sub_10001DEA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 != 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10001DEEC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10001DF30()
{
  if (*(void *)(v0 + 24)) {
    uint64_t v1 = *(void *)(v0 + 16);
  }
  else {
    uint64_t v1 = 7104878;
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10001DF74()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001DF84()
{
  return _swift_deallocObject(v0, 17, 7);
}

void sub_10001DF94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a7 != 2) {
    sub_10001DFB4(a7);
  }
}

uint64_t sub_10001DFB4(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10001DFC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10001E01C()
{
  sub_100003F3C(&qword_100044158);

  return sub_10001A3F0();
}

uint64_t sub_10001E080()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001E090()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001E0A0()
{
  return _swift_deallocObject(v0, 32, 7);
}

__n128 sub_10001E0B0@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = v1[1];
  *a1 = result;
  return result;
}

uint64_t sub_10001E0BC()
{
  (*(void (**)(uint64_t *__return_ptr))(v0 + 16))(&v2);

  return sub_100038800();
}

uint64_t sub_10001E104()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001E114()
{
  return _swift_deallocObject(v0, 17, 7);
}

unint64_t sub_10001E124()
{
  unint64_t result = qword_100044290;
  if (!qword_100044290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044290);
  }
  return result;
}

uint64_t sub_10001E178(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_1000385B0();
  __break(1u);
  return result;
}

char *sub_10001E2D4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_1000385B0();
  __break(1u);
  return result;
}

uint64_t sub_10001E3C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[20] = a7;
  v8[21] = a8;
  v8[18] = a5;
  v8[19] = a6;
  v8[16] = a3;
  v8[17] = a4;
  v8[14] = a1;
  v8[15] = a2;
  uint64_t v9 = sub_100037EE0();
  v8[22] = v9;
  v8[23] = *(void *)(v9 - 8);
  v8[24] = swift_task_alloc();
  v8[25] = swift_task_alloc();
  sub_100003F3C(&qword_100044300);
  v8[26] = swift_task_alloc();
  uint64_t v10 = sub_100037ED0();
  v8[27] = v10;
  v8[28] = *(void *)(v10 - 8);
  v8[29] = swift_task_alloc();
  v8[30] = swift_task_alloc();
  sub_100003F3C(&qword_100044308);
  v8[31] = swift_task_alloc();
  uint64_t v11 = sub_100003F3C(&qword_100044310);
  v8[32] = v11;
  v8[33] = *(void *)(v11 - 8);
  v8[34] = swift_task_alloc();
  v8[35] = swift_task_alloc();
  uint64_t v12 = sub_100037B80();
  v8[36] = v12;
  v8[37] = *(void *)(v12 - 8);
  v8[38] = swift_task_alloc();
  sub_100003F3C(&qword_100044318);
  v8[39] = swift_task_alloc();
  uint64_t v13 = sub_100037BC0();
  v8[40] = v13;
  v8[41] = *(void *)(v13 - 8);
  v8[42] = swift_task_alloc();
  v8[43] = swift_task_alloc();
  return _swift_task_switch(sub_10001E6D0, 0, 0);
}

void sub_10001E6D0()
{
  uint64_t v84 = v0;
  uint64_t v1 = v0[14];
  if (!v1 || (uint64_t v2 = *(void *)(v1 + 16)) == 0)
  {
    if (qword_1000440D8 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_100038260();
    sub_1000044B8(v7, (uint64_t)qword_100044AF0);
    uint64_t v8 = sub_100038240();
    os_log_type_t v9 = sub_100038480();
    if (!os_log_type_enabled(v8, v9)) {
      goto LABEL_13;
    }
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    uint64_t v11 = "Embeddings data must not be empty.";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v8, v9, v11, v10, 2u);
LABEL_12:
    swift_slowDealloc();
LABEL_13:

LABEL_14:
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
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = (void (*)(void, uint64_t))v0[1];
    v12(0, 12);
    return;
  }
  if (qword_1000440D8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_100038260();
  v0[44] = sub_1000044B8(v3, (uint64_t)qword_100044AF0);
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_100038240();
  os_log_type_t v5 = sub_100038460();
  if (os_log_type_enabled(v4, v5))
  {
    size_t v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)size_t v6 = 134217984;
    v0[13] = v2;
    sub_1000384B0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Running score step for %ld embeddings.", v6, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  uint64_t v83 = &_swiftEmptyArrayStorage;
  uint64_t v13 = *(void *)(sub_100037DF0() - 8);
  uint64_t v14 = v1 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  uint64_t v15 = *(void *)(v13 + 72);
  swift_bridgeObjectRetain();
  uint64_t v16 = v14;
  do
  {
    uint64_t v17 = sub_100037DE0();
    sub_10001C034(v17);
    v16 += v15;
    --v2;
  }
  while (v2);
  uint64_t v18 = v0[17];
  swift_bridgeObjectRelease();
  id v19 = v83;
  v0[45] = v83;
  uint64_t v20 = *(void *)(sub_100037DE0() + 16);
  swift_bridgeObjectRelease();
  if (!v18)
  {
    uint64_t v26 = sub_100038240();
    uint64_t v27 = sub_100038460();
    if (os_log_type_enabled(v26, (os_log_type_t)v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, (os_log_type_t)v27, "Scoring against personal data.", v28, 2u);
      swift_slowDealloc();
    }

    if (!v20)
    {
      __break(1u);
      return;
    }
    uint64_t v29 = v0[24];
    uint64_t v30 = v0[25];
    uint64_t v31 = v0[22];
    uint64_t v32 = v0[23];
    swift_bridgeObjectRetain();
    sub_100037EF0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v29, v30, v31);
    sub_100003F3C(&qword_100044320);
    swift_allocObject();
    v0[51] = sub_100037E40();
    uint64_t v82 = (void (*)(void *, uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of MatrixNNScorer.score(_:topK:skipFirst:)
                                                        + async function pointer to dispatch thunk of MatrixNNScorer.score(_:topK:skipFirst:));
    uint64_t v33 = (void *)swift_task_alloc();
    v0[52] = v33;
    *uint64_t v33 = v0;
    v33[1] = sub_10001FBC0;
    uint64_t v34 = v0[15];
    unint64_t v35 = v19;
    uint64_t v36 = 1;
    goto LABEL_27;
  }
  unint64_t v21 = v0[17];
  swift_bridgeObjectRetain_n();
  NSString v22 = sub_100038240();
  os_log_type_t v23 = sub_100038460();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = v0[16];
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v83 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 136315138;
    swift_bridgeObjectRetain();
    v0[12] = sub_10001B980(v24, v21, (uint64_t *)&v83);
    sub_1000384B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Scoring against reference file %s", v25, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  if (!v0[21])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_100038240();
    os_log_type_t v9 = sub_100038480();
    if (!os_log_type_enabled(v8, v9)) {
      goto LABEL_13;
    }
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    uint64_t v11 = "DataFolder missing.";
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v86._countAndFlagsBits = 0x736B6E616C702ELL;
  v86._object = (void *)0xE700000000000000;
  if (!sub_100038360(v86))
  {
    swift_bridgeObjectRelease();
    goto LABEL_43;
  }
  if (!v0[19])
  {
LABEL_43:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_100038240();
    os_log_type_t v9 = sub_100038480();
    if (!os_log_type_enabled(v8, v9)) {
      goto LABEL_13;
    }
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    uint64_t v11 = "Data file must be in Planks format and label must be set.";
    goto LABEL_11;
  }
  uint64_t v81 = v19;
  uint64_t v37 = v0[42];
  uint64_t v80 = v0[41];
  uint64_t v78 = v0[43];
  uint64_t v79 = v0[40];
  uint64_t v38 = v0[38];
  uint64_t v39 = v0[36];
  uint64_t v40 = v0[37];
  uint64_t v77 = v0[16];
  (*(void (**)(void))(v80 + 56))();
  uint64_t v41 = enum case for URL.DirectoryHint.inferFromPath(_:);
  uint64_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 104);
  v42(v38, enum case for URL.DirectoryHint.inferFromPath(_:), v39);
  sub_100037BA0();
  v0[2] = v77;
  v0[3] = v21;
  v42(v38, v41, v39);
  sub_10001C374();
  sub_100037BB0();
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v38, v39);
  uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v80 + 8);
  v43(v37, v79);
  sub_100037B90(0);
  v43(v78, v79);
  sub_100038290();
  swift_allocObject();
  uint64_t v44 = sub_100038280();
  v0[46] = v44;
  if (!v44)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_100038240();
    os_log_type_t v57 = sub_100038480();
    if (!os_log_type_enabled(v8, v57))
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_13;
    }
    uint64_t v58 = v0[16];
    uint64_t v59 = (uint8_t *)swift_slowAlloc();
    uint64_t v83 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v59 = 136315138;
    swift_bridgeObjectRetain();
    v0[11] = sub_10001B980(v58, v21, (uint64_t *)&v83);
    sub_1000384B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v8, v57, "Failed at opening %s", v59, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    goto LABEL_12;
  }
  uint64_t v45 = v0;
  swift_bridgeObjectRelease();
  char v46 = sub_100038270();
  unint64_t v47 = sub_100038240();
  os_log_type_t v48 = sub_100038460();
  BOOL v49 = os_log_type_enabled(v47, v48);
  if (v46)
  {
    if (v49)
    {
      uint64_t v60 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v60 = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "Scoring against quantized reference data.", v60, 2u);
      swift_slowDealloc();
    }
    uint64_t v51 = v0;
    uint64_t v61 = v0[32];
    uint64_t v62 = v0[33];
    uint64_t v63 = v45[31];

    sub_100020920();
    swift_retain();
    sub_100037F60();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v63, 1, v61) == 1)
    {
      uint64_t v55 = v45[31];
      swift_bridgeObjectRelease();
      double v56 = (uint64_t *)&unk_100044308;
      goto LABEL_51;
    }
    uint64_t v73 = v45[34];
    uint64_t v74 = v45[35];
    uint64_t v75 = v45[32];
    uint64_t v76 = v45[33];
    (*(void (**)(uint64_t, void, uint64_t))(v76 + 32))(v74, v45[31], v75);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v76 + 16))(v73, v74, v75);
    sub_100003F3C(&qword_100044338);
    swift_allocObject();
    v45[47] = sub_100037E40();
    uint64_t v82 = (void (*)(void *, uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of MatrixNNScorer.score(_:topK:skipFirst:)
                                                        + async function pointer to dispatch thunk of MatrixNNScorer.score(_:topK:skipFirst:));
    uint64_t v71 = (void *)swift_task_alloc();
    v45[48] = v71;
    *uint64_t v71 = v45;
    uint64_t v72 = sub_10001F4B4;
  }
  else
  {
    if (v49)
    {
      os_log_type_t v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v50 = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "Scoring against un-quantized reference data.", v50, 2u);
      swift_slowDealloc();
    }
    uint64_t v51 = v0;
    uint64_t v52 = v0[27];
    uint64_t v53 = v0[28];
    uint64_t v54 = v45[26];

    swift_retain();
    sub_100037EC0();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v54, 1, v52) == 1)
    {
      uint64_t v55 = v45[26];
      swift_bridgeObjectRelease();
      double v56 = (uint64_t *)&unk_100044300;
LABEL_51:
      sub_100020974(v55, v56);
      uint64_t v64 = sub_100038240();
      os_log_type_t v65 = sub_100038480();
      if (os_log_type_enabled(v64, v65))
      {
        uint64_t v66 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v66 = 0;
        _os_log_impl((void *)&_mh_execute_header, v64, v65, "Failed to create loader.", v66, 2u);
        swift_slowDealloc();

        swift_release();
      }
      else
      {
        swift_release();
      }
      uint64_t v0 = v45;
      goto LABEL_14;
    }
    uint64_t v67 = v45[29];
    uint64_t v68 = v45[30];
    uint64_t v69 = v45[27];
    uint64_t v70 = v45[28];
    (*(void (**)(uint64_t, void, uint64_t))(v70 + 32))(v68, v45[26], v69);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 16))(v67, v68, v69);
    sub_100003F3C(&qword_100044328);
    swift_allocObject();
    v45[49] = sub_100037E40();
    uint64_t v82 = (void (*)(void *, uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of MatrixNNScorer.score(_:topK:skipFirst:)
                                                        + async function pointer to dispatch thunk of MatrixNNScorer.score(_:topK:skipFirst:));
    uint64_t v71 = (void *)swift_task_alloc();
    v45[50] = v71;
    *uint64_t v71 = v45;
    uint64_t v72 = sub_10001F838;
  }
  v71[1] = v72;
  uint64_t v34 = v51[15];
  unint64_t v35 = v81;
  uint64_t v36 = 0;
LABEL_27:
  v82(v35, v34, v36);
}

uint64_t sub_10001F4B4(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 32) = v1;
  *(void *)(v2 + 40) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10001F5D0, 0, 0);
}

uint64_t sub_10001F5D0()
{
  uint64_t v1 = v0[35];
  uint64_t v2 = v0[32];
  uint64_t v3 = v0[33];
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  uint64_t v4 = v0[5];
  if (v4)
  {
    swift_bridgeObjectRetain();
    os_log_type_t v5 = sub_100038240();
    os_log_type_t v6 = sub_100038460();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 134217984;
      v0[10] = *(void *)(v4 + 16);
      sub_1000384B0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Finished score step. Scored %ld embeddings.", v7, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    int v10 = 17;
  }
  else
  {
    os_log_type_t v5 = sub_100038240();
    os_log_type_t v8 = sub_100038480();
    if (os_log_type_enabled(v5, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v8, "Failed to generate scores.", v9, 2u);
      swift_slowDealloc();
    }
    int v10 = 12;
  }
  unsigned int v13 = v10;

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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(uint64_t, void))v0[1];
  return v11(v4, v13);
}

uint64_t sub_10001F838(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 48) = v1;
  *(void *)(v2 + 56) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10001F954, 0, 0);
}

uint64_t sub_10001F954()
{
  uint64_t v1 = v0[30];
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[28];
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  uint64_t v4 = v0[7];
  if (v4)
  {
    swift_bridgeObjectRetain();
    os_log_type_t v5 = sub_100038240();
    os_log_type_t v6 = sub_100038460();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 134217984;
      v0[10] = *(void *)(v4 + 16);
      sub_1000384B0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Finished score step. Scored %ld embeddings.", v7, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    int v10 = 17;
  }
  else
  {
    os_log_type_t v5 = sub_100038240();
    os_log_type_t v8 = sub_100038480();
    if (os_log_type_enabled(v5, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v8, "Failed to generate scores.", v9, 2u);
      swift_slowDealloc();
    }
    int v10 = 12;
  }
  unsigned int v13 = v10;

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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(uint64_t, void))v0[1];
  return v11(v4, v13);
}

uint64_t sub_10001FBC0(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v1;
  *(void *)(v2 + 72) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10001FCDC, 0, 0);
}

uint64_t sub_10001FCDC()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[23];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  uint64_t v4 = v0[9];
  if (v4)
  {
    swift_bridgeObjectRetain();
    os_log_type_t v5 = sub_100038240();
    os_log_type_t v6 = sub_100038460();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 134217984;
      v0[10] = *(void *)(v4 + 16);
      sub_1000384B0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Finished score step. Scored %ld embeddings.", v7, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    int v10 = 17;
  }
  else
  {
    os_log_type_t v5 = sub_100038240();
    os_log_type_t v8 = sub_100038480();
    if (os_log_type_enabled(v5, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v8, "Failed to generate scores.", v9, 2u);
      swift_slowDealloc();
    }
    int v10 = 12;
  }
  unsigned int v13 = v10;

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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(uint64_t, void))v0[1];
  return v11(v4, v13);
}

uint64_t sub_10001FF40()
{
  uint64_t v1 = sub_100003F3C(&qword_100044158);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001FFD4()
{
  sub_100003F3C(&qword_100044158);

  return sub_1000199F4();
}

uint64_t sub_100020038()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100020070()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100020080()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100020090()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000200C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_1000200FC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002010C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002011C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002012C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002013C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002014C()
{
  return sub_100020260((uint64_t (*)(void))&type metadata accessor for Date);
}

uint64_t sub_100020164()
{
  return sub_100020324((void (*)(void))&type metadata accessor for Date, (uint64_t (*)(void))&Date.description.getter);
}

uint64_t sub_100020190()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000201A0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000201B0()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000201C0()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_1000201C8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000201D8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000201E8(uint64_t *a1)
{
  (*(void (**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  uint64_t v3 = *a1 + 8;
  uint64_t result = sub_1000384B0();
  *a1 = v3;
  return result;
}

uint64_t sub_100020248()
{
  return sub_100020260((uint64_t (*)(void))&type metadata accessor for ExtractedItem);
}

uint64_t sub_100020260(uint64_t (*a1)(void))
{
  uint64_t v2 = a1(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return _swift_deallocObject(v1, v6, v7);
}

uint64_t sub_1000202F8()
{
  return sub_100020324((void (*)(void))&type metadata accessor for ExtractedItem, (uint64_t (*)(void))&ExtractedItem.text.getter);
}

uint64_t sub_100020324(void (*a1)(void), uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_100020390()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1000203C0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000203D0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000203E0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000203F0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t *sub_100020400(uint64_t *a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char), void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_100020470(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18],
    a2,
    a3);
  return a1;
}

void sub_100020470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void (*a20)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char),void (*a21)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (a15 != 2)
  {
    a20(a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
    a21(a13, a14, a15, a16, a17, a18, a19);
  }
}

uint64_t sub_10002055C()
{
  return sub_10001B07C(*(void (**)(uint64_t))(v0 + 16));
}

uint64_t sub_100020564()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100020574()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100020584(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000205CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100003F3C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100020630(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003F3C(&qword_100044268);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100020698(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001C50C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000206DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100003F3C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100020740(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, char), void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a1 + 96);
  uint64_t v6 = *(void *)(a1 + 104);
  uint64_t v7 = *(void *)(a1 + 112);
  uint64_t v8 = *(void *)(a1 + 120);
  uint64_t v9 = *(void *)(a1 + 128);
  uint64_t v10 = *(void *)(a1 + 136);
  uint64_t v11 = *(void *)(a1 + 144);
  char v13 = *(unsigned char *)(a1 + 88);
  a2(*(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), v13);
  a3(v5, v6, v7, v8, v9, v10, v11);
  return a1;
}

uint64_t sub_1000207F4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100020854(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000208BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100020920()
{
  unint64_t result = qword_100044330;
  if (!qword_100044330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044330);
  }
  return result;
}

uint64_t sub_100020974(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100003F3C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000209D0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

unint64_t sub_100020A18()
{
  return sub_100020C4C();
}

uint64_t sub_100020A3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100020A4C()
{
  return swift_release();
}

unint64_t sub_100020A54()
{
  unint64_t result = qword_100044350;
  if (!qword_100044350)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100044350);
  }
  return result;
}

uint64_t sub_100020A94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100020AF0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100020B54(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_100020C4C()
{
  sub_100003F3C(&qword_100044368);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10003ADC0;
  *(void *)(inited + 32) = 0x49747865746E6F63;
  *(void *)(inited + 40) = 0xE900000000000064;
  *(void *)(inited + 48) = sub_100038300();
  *(void *)(inited + 56) = 0x64496769666E6F63;
  *(void *)(inited + 64) = 0xE800000000000000;
  *(NSNumber *)(inited + 72) = sub_100038450();
  *(void *)(inited + 80) = 0x49746E656D656C65;
  *(void *)(inited + 88) = 0xE900000000000064;
  *(NSNumber *)(inited + 96) = sub_100038450();
  unint64_t v2 = sub_10002130C(inited);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v13 = v4;
  v14[0] = v3;
  uint64_t v5 = *(void *)(v3 + 16);
  if (v5)
  {
    uint64_t v6 = *(void *)(v4 + 16);
    if (v6)
    {
      sub_100021A08((uint64_t)v14);
      sub_100021A08((uint64_t)&v13);
      for (uint64_t i = 0; i != 10; ++i)
      {
        v15._countAndFlagsBits = sub_1000386E0();
        sub_100038340(v15);
        swift_bridgeObjectRelease();
        Class isa = sub_100038440().super.super.isa;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_100021898((uint64_t)isa, 0x7865646E69, 0xE500000000000000, isUniquelyReferenced_nonNull_native);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v16._countAndFlagsBits = sub_1000386E0();
        sub_100038340(v16);
        swift_bridgeObjectRelease();
        Class v10 = sub_100038440().super.super.isa;
        char v11 = swift_isUniquelyReferenced_nonNull_native();
        sub_100021898((uint64_t)v10, 0x65756C6176, 0xE500000000000000, v11);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v5 - 1 == i) {
          break;
        }
        if (v6 - 1 == i) {
          break;
        }
      }
      sub_100021A34((uint64_t)v14);
      sub_100021A34((uint64_t)&v13);
    }
  }
  return v2;
}

uint64_t sub_100020ED8(char a1)
{
  return *(void *)&aContexticonfig_0[8 * a1];
}

uint64_t sub_100020EF8(char *a1, char *a2)
{
  return sub_1000049EC(*a1, *a2);
}

Swift::Int sub_100020F04()
{
  return sub_100004D9C();
}

uint64_t sub_100020F0C()
{
  return sub_100005010();
}

Swift::Int sub_100020F14()
{
  return sub_100005414();
}

uint64_t sub_100020F1C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100021E84(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_100020F4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100020ED8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100020F78()
{
  return sub_100020ED8(*v0);
}

uint64_t sub_100020F80@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100021E84(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100020FA8()
{
  return 0;
}

void sub_100020FB4(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_100020FC0(uint64_t a1)
{
  unint64_t v2 = sub_100022254();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100020FFC(uint64_t a1)
{
  unint64_t v2 = sub_100022254();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100021038(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100003F3C(&qword_1000443A8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004508(a1, a1[3]);
  sub_100022254();
  sub_1000387F0();
  LOBYTE(v11) = 0;
  sub_1000386A0();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_1000386C0();
    LOBYTE(v11) = 2;
    sub_1000386C0();
    uint64_t v11 = *(void *)(v3 + 32);
    HIBYTE(v10) = 3;
    sub_100003F3C(&qword_100044388);
    sub_1000222A8(&qword_1000443B0, &qword_100044388);
    sub_1000386D0();
    uint64_t v11 = *(void *)(v3 + 40);
    HIBYTE(v10) = 4;
    sub_100003F3C(&qword_100044398);
    sub_1000222A8(&qword_1000443B8, &qword_100044398);
    sub_1000386D0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

double sub_1000212B0@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_100021ED0(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    double result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_1000212F4(void *a1)
{
  return sub_100021038(a1);
}

unint64_t sub_10002130C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003F3C(&qword_100044370);
  uint64_t v2 = (void *)sub_1000385A0();
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
    unint64_t result = sub_10002142C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
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

unint64_t sub_10002142C(uint64_t a1, uint64_t a2)
{
  sub_100038780();
  sub_100038330();
  Swift::Int v4 = sub_1000387A0();

  return sub_1000214A4(a1, a2, v4);
}

unint64_t sub_1000214A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100038700() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100038700() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100021588(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100003F3C(&qword_100044370);
  char v38 = a2;
  uint64_t v6 = sub_100038590();
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
  unint64_t v35 = v2;
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
    NSString v22 = (void *)(v5 + 64);
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
          uint64_t v3 = v35;
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
    sub_100038780();
    sub_100038330();
    uint64_t result = sub_1000387A0();
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
  uint64_t v3 = v35;
  NSString v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void sub_100021898(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10002142C(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_100021A60();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_100021588(v15, a4 & 1);
  unint64_t v20 = sub_10002142C(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_100038730();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  NSString v22 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

uint64_t sub_100021A08(uint64_t a1)
{
  return a1;
}

uint64_t sub_100021A34(uint64_t a1)
{
  return a1;
}

id sub_100021A60()
{
  uint64_t v1 = v0;
  sub_100003F3C(&qword_100044370);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100038580();
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
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
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

uint64_t initializeBufferWithCopyOfBuffer for FilterCriteria(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for VectorTelemetryEvent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for VectorTelemetryEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for VectorTelemetryEvent(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for ScoreParameters(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for VectorTelemetryEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for VectorTelemetryEvent(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for VectorTelemetryEvent(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for VectorTelemetryEvent()
{
  return &type metadata for VectorTelemetryEvent;
}

uint64_t sub_100021E84(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000412E8;
  v6._object = a2;
  unint64_t v4 = sub_1000385D0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

uint64_t sub_100021ED0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100003F3C(&qword_100044378);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004508(a1, a1[3]);
  sub_100022254();
  sub_1000387E0();
  if (v2) {
    return sub_100003FD8((uint64_t)a1);
  }
  LOBYTE(v22) = 0;
  uint64_t v9 = sub_100038620();
  uint64_t v11 = v10;
  LOBYTE(v22) = 1;
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_100038640();
  LOBYTE(v22) = 2;
  uint64_t v19 = sub_100038640();
  sub_100003F3C(&qword_100044388);
  char v21 = 3;
  sub_1000222A8(&qword_100044390, &qword_100044388);
  sub_100038650();
  uint64_t v12 = v22;
  v17[1] = sub_100003F3C(&qword_100044398);
  char v21 = 4;
  sub_1000222A8(&qword_1000443A0, &qword_100044398);
  uint64_t v18 = v12;
  swift_bridgeObjectRetain();
  sub_100038650();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v13 = v22;
  swift_bridgeObjectRetain();
  sub_100003FD8((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t v14 = v18;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v9;
  a2[1] = v11;
  uint64_t v16 = v19;
  a2[2] = v20;
  a2[3] = v16;
  a2[4] = v14;
  a2[5] = v13;
  return result;
}

unint64_t sub_100022254()
{
  unint64_t result = qword_100044380;
  if (!qword_100044380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044380);
  }
  return result;
}

uint64_t sub_1000222A8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001C50C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for VectorTelemetryEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000223D4);
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

ValueMetadata *type metadata accessor for VectorTelemetryEvent.CodingKeys()
{
  return &type metadata for VectorTelemetryEvent.CodingKeys;
}

unint64_t sub_100022410()
{
  unint64_t result = qword_1000443C0;
  if (!qword_1000443C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000443C0);
  }
  return result;
}

unint64_t sub_100022468()
{
  unint64_t result = qword_1000443C8;
  if (!qword_1000443C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000443C8);
  }
  return result;
}

unint64_t sub_1000224C0()
{
  unint64_t result = qword_1000443D0;
  if (!qword_1000443D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1000443D0);
  }
  return result;
}

uint64_t sub_100022514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a3;
  v4[6] = a4;
  v4[3] = a1;
  v4[4] = a2;
  sub_100003F3C(&qword_1000443E0);
  v4[7] = swift_task_alloc();
  sub_100003F3C(&qword_1000443E8);
  v4[8] = swift_task_alloc();
  uint64_t v5 = sub_100037D90();
  v4[9] = v5;
  v4[10] = *(void *)(v5 - 8);
  v4[11] = swift_task_alloc();
  v4[12] = swift_task_alloc();
  return _swift_task_switch(sub_100022648, 0, 0);
}

uint64_t sub_100022648()
{
  id v33 = v0;
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  unsigned int v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v4(v1, v0[4], v2);
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v1, v2);
  if (v5 == enum case for EmbedderName.NLEmbedder(_:))
  {
    unsigned int v6 = (uint64_t *)v0[3];
    v6[3] = sub_100037D70();
    v6[4] = (uint64_t)&protocol witness table for NLEmbedder;
    sub_10001CFF4(v6);
    sub_100037D60();
LABEL_17:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v29 = (uint64_t (*)(void))v0[1];
    return v29();
  }
  if (v5 == enum case for EmbedderName.NLContextualEmbedder(_:))
  {
    uint64_t v7 = (void *)swift_task_alloc();
    v0[13] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_100022A70;
    uint64_t v8 = v0[8];
    return NLContextualEmbedder.init(useRecognizer:xpcCall:)(v8, 0, 0);
  }
  else
  {
    if (v5 != enum case for EmbedderName.MADTextEmbedder(_:))
    {
      if (qword_1000440D8 != -1) {
        swift_once();
      }
      uint64_t v13 = v0[11];
      uint64_t v14 = v0[9];
      uint64_t v15 = v0[4];
      uint64_t v16 = sub_100038260();
      sub_1000044B8(v16, (uint64_t)qword_100044AF0);
      v4(v13, v15, v14);
      uint64_t v17 = sub_100038240();
      os_log_type_t v18 = sub_100038480();
      BOOL v19 = os_log_type_enabled(v17, v18);
      uint64_t v21 = v0[10];
      uint64_t v20 = v0[11];
      if (v19)
      {
        uint64_t v31 = v0[9];
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v32 = swift_slowAlloc();
        *(_DWORD *)uint64_t v22 = 136315138;
        uint64_t v23 = sub_100037D80();
        v0[2] = sub_10001B980(v23, v24, &v32);
        sub_1000384B0();
        swift_bridgeObjectRelease();
        uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
        v25(v20, v31);
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Embedder: %s is not available on this platform.", v22, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
        v25(v0[11], v0[9]);
      }

      uint64_t v26 = v0[12];
      uint64_t v27 = v0[9];
      uint64_t v28 = v0[3];
      *(void *)(v28 + 32) = 0;
      *(_OWORD *)uint64_t v28 = 0u;
      *(_OWORD *)(v28 + 16) = 0u;
      v25(v26, v27);
      goto LABEL_17;
    }
    swift_bridgeObjectRetain();
    uint64_t v9 = (void *)swift_task_alloc();
    v0[14] = v9;
    void *v9 = v0;
    v9[1] = sub_100022CB8;
    uint64_t v11 = v0[6];
    uint64_t v10 = v0[7];
    uint64_t v12 = v0[5];
    return MADTextEmbedder.init(version:)(v10, v12, v11);
  }
}

uint64_t sub_100022A70()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100022B6C, 0, 0);
}

uint64_t sub_100022B6C()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = sub_100037F10();
  uint64_t v3 = *(void *)(v2 - 8);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  uint64_t v5 = v0[3];
  if (v4 == 1)
  {
    sub_100020974(v1, &qword_1000443E8);
    *(_OWORD *)uint64_t v5 = 0u;
    *(_OWORD *)(v5 + 16) = 0u;
    *(void *)(v5 + 32) = 0;
  }
  else
  {
    *(void *)(v5 + 24) = v2;
    *(void *)(v5 + 32) = &protocol witness table for NLContextualEmbedder;
    unsigned int v6 = sub_10001CFF4((uint64_t *)v5);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 32))(v6, v1, v2);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_100022CB8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100022DB4, 0, 0);
}

uint64_t sub_100022DB4()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = sub_100037E60();
  uint64_t v3 = *(void *)(v2 - 8);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  uint64_t v5 = v0[3];
  if (v4 == 1)
  {
    sub_100020974(v1, &qword_1000443E0);
    *(_OWORD *)uint64_t v5 = 0u;
    *(_OWORD *)(v5 + 16) = 0u;
    *(void *)(v5 + 32) = 0;
  }
  else
  {
    *(void *)(v5 + 24) = v2;
    *(void *)(v5 + 32) = &protocol witness table for MADTextEmbedder;
    unsigned int v6 = sub_10001CFF4((uint64_t *)v5);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 32))(v6, v1, v2);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_100022F00(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = v12 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
    return v4;
  }
  *(void *)a1 = *a2;
  *(_WORD *)(a1 + 8) = *((_WORD *)a2 + 4);
  *(void *)(a1 + 16) = a2[2];
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  *(void *)(a1 + 32) = a2[4];
  uint64_t v7 = a2[19];
  swift_bridgeObjectRetain();
  if (v7 != 2)
  {
    uint64_t v13 = a2[12];
    *(unsigned char *)(v4 + 40) = *((unsigned char *)a2 + 40);
    if (v13 == 2)
    {
      long long v14 = *((_OWORD *)a2 + 6);
      *(_OWORD *)(v4 + 80) = *((_OWORD *)a2 + 5);
      *(_OWORD *)(v4 + 96) = v14;
      *(_OWORD *)(v4 + 112) = *((_OWORD *)a2 + 7);
      *(unsigned char *)(v4 + 128) = *((unsigned char *)a2 + 128);
      long long v15 = *((_OWORD *)a2 + 4);
      *(_OWORD *)(v4 + 48) = *((_OWORD *)a2 + 3);
      *(_OWORD *)(v4 + 64) = v15;
      if (v7 == 1) {
        goto LABEL_12;
      }
LABEL_10:
      *(_OWORD *)(v4 + 136) = *(_OWORD *)(a2 + 17);
      uint64_t v17 = a2[20];
      uint64_t v18 = a2[21];
      *(void *)(v4 + 152) = v7;
      *(void *)(v4 + 160) = v17;
      uint64_t v19 = a2[22];
      uint64_t v20 = a2[23];
      *(void *)(v4 + 168) = v18;
      *(void *)(v4 + 176) = v19;
      *(void *)(v4 + 184) = v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_13;
    }
    *(_OWORD *)(v4 + 48) = *((_OWORD *)a2 + 3);
    *(void *)(v4 + 64) = a2[8];
    *(unsigned char *)(v4 + 72) = *((unsigned char *)a2 + 72);
    *(_WORD *)(v4 + 73) = *(_WORD *)((char *)a2 + 73);
    *(void *)(v4 + 80) = a2[10];
    *(unsigned char *)(v4 + 88) = *((unsigned char *)a2 + 88);
    if (v13 == 1)
    {
      long long v16 = *((_OWORD *)a2 + 7);
      *(_OWORD *)(v4 + 96) = *((_OWORD *)a2 + 6);
      *(_OWORD *)(v4 + 112) = v16;
      *(unsigned char *)(v4 + 128) = *((unsigned char *)a2 + 128);
      if (v7 != 1) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v21 = a2[13];
      *(void *)(v4 + 96) = v13;
      *(void *)(v4 + 104) = v21;
      *(unsigned char *)(v4 + 112) = *((unsigned char *)a2 + 112);
      *(void *)(v4 + 120) = a2[15];
      *(unsigned char *)(v4 + 128) = *((unsigned char *)a2 + 128);
      swift_bridgeObjectRetain();
      if (v7 != 1) {
        goto LABEL_10;
      }
    }
LABEL_12:
    long long v22 = *(_OWORD *)(a2 + 19);
    *(_OWORD *)(v4 + 136) = *(_OWORD *)(a2 + 17);
    *(_OWORD *)(v4 + 152) = v22;
    *(_OWORD *)(v4 + 168) = *(_OWORD *)(a2 + 21);
    *(void *)(v4 + 184) = a2[23];
    goto LABEL_13;
  }
  long long v8 = *(_OWORD *)(a2 + 19);
  *(_OWORD *)(v4 + 136) = *(_OWORD *)(a2 + 17);
  *(_OWORD *)(v4 + 152) = v8;
  *(_OWORD *)(v4 + 168) = *(_OWORD *)(a2 + 21);
  *(void *)(v4 + 184) = a2[23];
  long long v9 = *(_OWORD *)(a2 + 11);
  *(_OWORD *)(v4 + 72) = *(_OWORD *)(a2 + 9);
  *(_OWORD *)(v4 + 88) = v9;
  long long v10 = *(_OWORD *)(a2 + 15);
  *(_OWORD *)(v4 + 104) = *(_OWORD *)(a2 + 13);
  *(_OWORD *)(v4 + 120) = v10;
  long long v11 = *(_OWORD *)(a2 + 7);
  *(_OWORD *)(v4 + 40) = *(_OWORD *)(a2 + 5);
  *(_OWORD *)(v4 + 56) = v11;
LABEL_13:
  uint64_t v23 = a3[10];
  unint64_t v24 = (unsigned char *)(v4 + v23);
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = type metadata accessor for EmbedParameters(0);
  uint64_t v27 = *(void *)(v26 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
  {
    uint64_t v28 = sub_100003F3C(&qword_100044258);
    memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    *unint64_t v24 = *v25;
    uint64_t v29 = *(int *)(v26 + 20);
    uint64_t v30 = &v24[v29];
    uint64_t v31 = &v25[v29];
    uint64_t v32 = sub_100037D90();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
    uint64_t v33 = *(int *)(v26 + 24);
    uint64_t v34 = &v24[v33];
    unint64_t v35 = &v25[v33];
    uint64_t v36 = v35[1];
    *uint64_t v34 = *v35;
    v34[1] = v36;
    uint64_t v37 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v27 + 56);
    swift_bridgeObjectRetain();
    v37(v24, 0, 1, v26);
  }
  uint64_t v38 = a3[11];
  uint64_t v39 = v4 + v38;
  uint64_t v40 = (uint64_t)a2 + v38;
  uint64_t v41 = *(void *)(v40 + 24);
  if (v41 == 1)
  {
    long long v42 = *(_OWORD *)(v40 + 16);
    *(_OWORD *)uint64_t v39 = *(_OWORD *)v40;
    *(_OWORD *)(v39 + 16) = v42;
    *(_OWORD *)(v39 + 32) = *(_OWORD *)(v40 + 32);
  }
  else
  {
    *(unsigned char *)uint64_t v39 = *(unsigned char *)v40;
    *(_OWORD *)(v39 + 8) = *(_OWORD *)(v40 + 8);
    uint64_t v43 = *(void *)(v40 + 32);
    uint64_t v44 = *(void *)(v40 + 40);
    *(void *)(v39 + 24) = v41;
    *(void *)(v39 + 32) = v43;
    *(void *)(v39 + 40) = v44;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v45 = a3[13];
  *(_WORD *)(v4 + a3[12]) = *(_WORD *)((char *)a2 + a3[12]);
  char v46 = (void *)(v4 + v45);
  unint64_t v47 = (uint64_t *)((char *)a2 + v45);
  uint64_t v48 = v47[1];
  if (v48)
  {
    *char v46 = *v47;
    v46[1] = v48;
    uint64_t v49 = v47[3];
    v46[2] = v47[2];
    v46[3] = v49;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v50 = *((_OWORD *)v47 + 1);
    *(_OWORD *)char v46 = *(_OWORD *)v47;
    *((_OWORD *)v46 + 1) = v50;
  }
  return v4;
}

uint64_t type metadata accessor for EmbedParameters(uint64_t a1)
{
  return sub_10002A834(a1, qword_100044500);
}

uint64_t sub_100023320(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a1 + 152);
  if (v4 != 2)
  {
    if ((unint64_t)(*(void *)(a1 + 96) - 1) >= 2) {
      swift_bridgeObjectRelease();
    }
    if (v4 != 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v5 = a1 + a2[10];
  uint64_t v6 = type metadata accessor for EmbedParameters(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6))
  {
    uint64_t v7 = v5 + *(int *)(v6 + 20);
    uint64_t v8 = sub_100037D90();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
    swift_bridgeObjectRelease();
  }
  if (*(void *)(a1 + a2[11] + 24) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t result = *(void *)(a1 + a2[13] + 8);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100023494(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  if (v6 == 2)
  {
    long long v7 = *(_OWORD *)(a2 + 152);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 152) = v7;
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    long long v8 = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 88) = v8;
    long long v9 = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v9;
    long long v10 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = v10;
    goto LABEL_11;
  }
  uint64_t v11 = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  if (v11 == 2)
  {
    long long v12 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = v12;
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
    *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
    long long v13 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v13;
    if (v6 == 1) {
      goto LABEL_10;
    }
LABEL_8:
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
    uint64_t v15 = *(void *)(a2 + 160);
    uint64_t v16 = *(void *)(a2 + 168);
    *(void *)(a1 + 152) = v6;
    *(void *)(a1 + 160) = v15;
    uint64_t v17 = *(void *)(a2 + 176);
    uint64_t v18 = *(void *)(a2 + 184);
    *(void *)(a1 + 168) = v16;
    *(void *)(a1 + 176) = v17;
    *(void *)(a1 + 184) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_11;
  }
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_WORD *)(a1 + 73) = *(_WORD *)(a2 + 73);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  if (v11 == 1)
  {
    long long v14 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 112) = v14;
    *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
    if (v6 != 1) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v19 = *(void *)(a2 + 104);
    *(void *)(a1 + 96) = v11;
    *(void *)(a1 + 104) = v19;
    *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
    *(void *)(a1 + 120) = *(void *)(a2 + 120);
    *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
    swift_bridgeObjectRetain();
    if (v6 != 1) {
      goto LABEL_8;
    }
  }
LABEL_10:
  long long v20 = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = v20;
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
LABEL_11:
  uint64_t v21 = a3[10];
  long long v22 = (unsigned char *)(a1 + v21);
  uint64_t v23 = (unsigned char *)(a2 + v21);
  uint64_t v24 = type metadata accessor for EmbedParameters(0);
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    uint64_t v26 = sub_100003F3C(&qword_100044258);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    unsigned char *v22 = *v23;
    uint64_t v27 = *(int *)(v24 + 20);
    uint64_t v28 = &v22[v27];
    uint64_t v29 = &v23[v27];
    uint64_t v30 = sub_100037D90();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
    uint64_t v31 = *(int *)(v24 + 24);
    uint64_t v32 = &v22[v31];
    uint64_t v33 = &v23[v31];
    uint64_t v34 = v33[1];
    *uint64_t v32 = *v33;
    v32[1] = v34;
    unint64_t v35 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v25 + 56);
    swift_bridgeObjectRetain();
    v35(v22, 0, 1, v24);
  }
  uint64_t v36 = a3[11];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = a2 + v36;
  uint64_t v39 = *(void *)(v38 + 24);
  if (v39 == 1)
  {
    long long v40 = *(_OWORD *)(v38 + 16);
    *(_OWORD *)uint64_t v37 = *(_OWORD *)v38;
    *(_OWORD *)(v37 + 16) = v40;
    *(_OWORD *)(v37 + 32) = *(_OWORD *)(v38 + 32);
  }
  else
  {
    *(unsigned char *)uint64_t v37 = *(unsigned char *)v38;
    *(_OWORD *)(v37 + 8) = *(_OWORD *)(v38 + 8);
    uint64_t v41 = *(void *)(v38 + 32);
    uint64_t v42 = *(void *)(v38 + 40);
    *(void *)(v37 + 24) = v39;
    *(void *)(v37 + 32) = v41;
    *(void *)(v37 + 40) = v42;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v43 = a3[13];
  *(_WORD *)(a1 + a3[12]) = *(_WORD *)(a2 + a3[12]);
  uint64_t v44 = (void *)(a1 + v43);
  uint64_t v45 = (void *)(a2 + v43);
  uint64_t v46 = v45[1];
  if (v46)
  {
    void *v44 = *v45;
    v44[1] = v46;
    uint64_t v47 = v45[3];
    v44[2] = v45[2];
    v44[3] = v47;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v48 = *((_OWORD *)v45 + 1);
    *(_OWORD *)uint64_t v44 = *(_OWORD *)v45;
    *((_OWORD *)v44 + 1) = v48;
  }
  return a1;
}

uint64_t sub_100023844(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  uint64_t v6 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v7 = (_OWORD *)(a1 + 40);
  long long v8 = (_OWORD *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 152);
  if (*(void *)(a1 + 152) == 2)
  {
    if (v9 == 2)
    {
      long long v10 = *(_OWORD *)(a2 + 56);
      *long long v7 = *v8;
      *(_OWORD *)(a1 + 56) = v10;
      long long v11 = *(_OWORD *)(a2 + 72);
      long long v12 = *(_OWORD *)(a2 + 88);
      long long v13 = *(_OWORD *)(a2 + 120);
      *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
      *(_OWORD *)(a1 + 120) = v13;
      *(_OWORD *)(a1 + 72) = v11;
      *(_OWORD *)(a1 + 88) = v12;
      long long v14 = *(_OWORD *)(a2 + 136);
      long long v15 = *(_OWORD *)(a2 + 152);
      long long v16 = *(_OWORD *)(a2 + 168);
      *(void *)(a1 + 184) = *(void *)(a2 + 184);
      *(_OWORD *)(a1 + 152) = v15;
      *(_OWORD *)(a1 + 168) = v16;
      *(_OWORD *)(a1 + 136) = v14;
      goto LABEL_33;
    }
    *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
    if (*(void *)(a2 + 96) == 2)
    {
      long long v24 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 64) = v24;
      long long v25 = *(_OWORD *)(a2 + 80);
      long long v26 = *(_OWORD *)(a2 + 96);
      long long v27 = *(_OWORD *)(a2 + 112);
      *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
      *(_OWORD *)(a1 + 96) = v26;
      *(_OWORD *)(a1 + 112) = v27;
      *(_OWORD *)(a1 + 80) = v25;
    }
    else
    {
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
      *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
      *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
      uint64_t v38 = *(void *)(a2 + 80);
      *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
      *(void *)(a1 + 80) = v38;
      uint64_t v39 = *(void *)(a2 + 96);
      if (v39 == 1)
      {
        long long v40 = *(_OWORD *)(a2 + 96);
        long long v41 = *(_OWORD *)(a2 + 112);
        *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
        *(_OWORD *)(a1 + 96) = v40;
        *(_OWORD *)(a1 + 112) = v41;
      }
      else
      {
        *(void *)(a1 + 96) = v39;
        uint64_t v48 = *(void *)(a2 + 104);
        *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
        *(void *)(a1 + 104) = v48;
        uint64_t v49 = *(void *)(a2 + 120);
        *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
        *(void *)(a1 + 120) = v49;
        swift_bridgeObjectRetain();
      }
    }
    if (*(void *)(a2 + 152) == 1)
    {
      long long v50 = *(_OWORD *)(a2 + 136);
      long long v51 = *(_OWORD *)(a2 + 152);
      long long v52 = *(_OWORD *)(a2 + 168);
      *(void *)(a1 + 184) = *(void *)(a2 + 184);
      *(_OWORD *)(a1 + 152) = v51;
      *(_OWORD *)(a1 + 168) = v52;
      *(_OWORD *)(a1 + 136) = v50;
      goto LABEL_33;
    }
LABEL_29:
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
    *(void *)(a1 + 160) = *(void *)(a2 + 160);
    *(void *)(a1 + 168) = *(void *)(a2 + 168);
    *(void *)(a1 + 176) = *(void *)(a2 + 176);
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_33;
  }
  if (v9 == 2)
  {
    sub_100024138(a1 + 40);
    long long v17 = *(_OWORD *)(a2 + 56);
    *long long v7 = *v8;
    *(_OWORD *)(a1 + 56) = v17;
    long long v18 = *(_OWORD *)(a2 + 120);
    long long v20 = *(_OWORD *)(a2 + 72);
    long long v19 = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v18;
    *(_OWORD *)(a1 + 72) = v20;
    *(_OWORD *)(a1 + 88) = v19;
    long long v22 = *(_OWORD *)(a2 + 152);
    long long v21 = *(_OWORD *)(a2 + 168);
    long long v23 = *(_OWORD *)(a2 + 136);
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    *(_OWORD *)(a1 + 152) = v22;
    *(_OWORD *)(a1 + 168) = v21;
    *(_OWORD *)(a1 + 136) = v23;
    goto LABEL_33;
  }
  uint64_t v28 = (long long *)(a1 + 96);
  uint64_t v29 = *(void *)(a1 + 96);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v30 = (_OWORD *)(a1 + 48);
  uint64_t v32 = (long long *)(a2 + 96);
  uint64_t v31 = *(void *)(a2 + 96);
  uint64_t v33 = (_OWORD *)(a2 + 48);
  if (v29 == 2)
  {
    if (v31 == 2)
    {
      long long v34 = *(_OWORD *)(a2 + 64);
      *uint64_t v30 = *v33;
      *(_OWORD *)(a1 + 64) = v34;
      long long v35 = *(_OWORD *)(a2 + 80);
      long long v36 = *(_OWORD *)(a2 + 96);
      long long v37 = *(_OWORD *)(a2 + 112);
      *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
      *(_OWORD *)(a1 + 96) = v36;
      *(_OWORD *)(a1 + 112) = v37;
      *(_OWORD *)(a1 + 80) = v35;
      goto LABEL_26;
    }
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
    *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
    *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
    uint64_t v46 = *(void *)(a2 + 80);
    *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
    *(void *)(a1 + 80) = v46;
    uint64_t v47 = *(void *)(a2 + 96);
LABEL_20:
    if (v47 == 1)
    {
      long long v54 = *v32;
      long long v55 = *(_OWORD *)(a2 + 112);
      *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
      *uint64_t v28 = v54;
      *(_OWORD *)(a1 + 112) = v55;
    }
    else
    {
      *(void *)(a1 + 96) = v47;
      uint64_t v56 = *(void *)(a2 + 104);
      *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
      *(void *)(a1 + 104) = v56;
      uint64_t v57 = *(void *)(a2 + 120);
      *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
      *(void *)(a1 + 120) = v57;
      swift_bridgeObjectRetain();
    }
    goto LABEL_26;
  }
  if (v31 == 2)
  {
    sub_1000240D4(a1 + 48);
    long long v42 = *(_OWORD *)(a2 + 64);
    *uint64_t v30 = *v33;
    *(_OWORD *)(a1 + 64) = v42;
    long long v44 = *(_OWORD *)(a2 + 96);
    long long v43 = *(_OWORD *)(a2 + 112);
    long long v45 = *(_OWORD *)(a2 + 80);
    *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
    *(_OWORD *)(a1 + 96) = v44;
    *(_OWORD *)(a1 + 112) = v43;
    *(_OWORD *)(a1 + 80) = v45;
    goto LABEL_26;
  }
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  uint64_t v53 = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 80) = v53;
  uint64_t v47 = *(void *)(a2 + 96);
  if (v29 == 1) {
    goto LABEL_20;
  }
  if (v47 == 1)
  {
    sub_100021A34(a1 + 96);
    char v58 = *(unsigned char *)(a2 + 128);
    long long v59 = *(_OWORD *)(a2 + 112);
    *uint64_t v28 = *v32;
    *(_OWORD *)(a1 + 112) = v59;
    *(unsigned char *)(a1 + 128) = v58;
  }
  else
  {
    *(void *)(a1 + 96) = v47;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v60 = *(void *)(a2 + 104);
    *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
    *(void *)(a1 + 104) = v60;
    uint64_t v61 = *(void *)(a2 + 120);
    *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
    *(void *)(a1 + 120) = v61;
  }
LABEL_26:
  uint64_t v62 = (_OWORD *)(a1 + 136);
  uint64_t v63 = (long long *)(a2 + 136);
  uint64_t v64 = *(void *)(a2 + 152);
  if (*(void *)(a1 + 152) == 1)
  {
    if (v64 == 1)
    {
      long long v65 = *v63;
      long long v66 = *(_OWORD *)(a2 + 152);
      long long v67 = *(_OWORD *)(a2 + 168);
      *(void *)(a1 + 184) = *(void *)(a2 + 184);
      *(_OWORD *)(a1 + 152) = v66;
      *(_OWORD *)(a1 + 168) = v67;
      _OWORD *v62 = v65;
      goto LABEL_33;
    }
    goto LABEL_29;
  }
  if (v64 == 1)
  {
    sub_100024108(a1 + 136);
    long long v69 = *(_OWORD *)(a2 + 152);
    long long v68 = *(_OWORD *)(a2 + 168);
    long long v70 = *v63;
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    *(_OWORD *)(a1 + 152) = v69;
    *(_OWORD *)(a1 + 168) = v68;
    _OWORD *v62 = v70;
  }
  else
  {
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 160) = *(void *)(a2 + 160);
    *(void *)(a1 + 168) = *(void *)(a2 + 168);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 176) = *(void *)(a2 + 176);
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
LABEL_33:
  uint64_t v71 = a3[10];
  uint64_t v72 = (unsigned char *)(a1 + v71);
  uint64_t v73 = (unsigned char *)(a2 + v71);
  uint64_t v74 = type metadata accessor for EmbedParameters(0);
  uint64_t v75 = *(void *)(v74 - 8);
  uint64_t v76 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v75 + 48);
  int v77 = v76(v72, 1, v74);
  int v78 = v76(v73, 1, v74);
  if (v77)
  {
    if (!v78)
    {
      *uint64_t v72 = *v73;
      uint64_t v79 = *(int *)(v74 + 20);
      uint64_t v80 = &v72[v79];
      uint64_t v81 = &v73[v79];
      uint64_t v82 = sub_100037D90();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v82 - 8) + 16))(v80, v81, v82);
      uint64_t v83 = *(int *)(v74 + 24);
      uint64_t v84 = &v72[v83];
      uint64_t v85 = &v73[v83];
      *uint64_t v84 = *v85;
      v84[1] = v85[1];
      Swift::String v86 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v75 + 56);
      swift_bridgeObjectRetain();
      v86(v72, 0, 1, v74);
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  if (v78)
  {
    sub_10002A330((uint64_t)v72, type metadata accessor for EmbedParameters);
LABEL_38:
    uint64_t v87 = sub_100003F3C(&qword_100044258);
    memcpy(v72, v73, *(void *)(*(void *)(v87 - 8) + 64));
    goto LABEL_39;
  }
  *uint64_t v72 = *v73;
  uint64_t v103 = *(int *)(v74 + 20);
  uint64_t v104 = &v72[v103];
  uint64_t v105 = &v73[v103];
  uint64_t v106 = sub_100037D90();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v106 - 8) + 24))(v104, v105, v106);
  uint64_t v107 = *(int *)(v74 + 24);
  uint64_t v108 = &v72[v107];
  uint64_t v109 = &v73[v107];
  *uint64_t v108 = *v109;
  v108[1] = v109[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_39:
  uint64_t v88 = a3[11];
  uint64_t v89 = a1 + v88;
  uint64_t v90 = (long long *)(a2 + v88);
  uint64_t v91 = *(void *)(a1 + v88 + 24);
  uint64_t v92 = *(void *)(a2 + v88 + 24);
  if (v91 == 1)
  {
    if (v92 == 1)
    {
      long long v93 = *v90;
      long long v94 = v90[2];
      *(_OWORD *)(v89 + 16) = v90[1];
      *(_OWORD *)(v89 + 32) = v94;
      *(_OWORD *)uint64_t v89 = v93;
    }
    else
    {
      *(unsigned char *)uint64_t v89 = *(unsigned char *)v90;
      *(void *)(v89 + 8) = *((void *)v90 + 1);
      *(void *)(v89 + 16) = *((void *)v90 + 2);
      *(void *)(v89 + 24) = *((void *)v90 + 3);
      *(void *)(v89 + 32) = *((void *)v90 + 4);
      *(void *)(v89 + 40) = *((void *)v90 + 5);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v92 == 1)
  {
    sub_100024168(v89);
    long long v96 = v90[1];
    long long v95 = v90[2];
    *(_OWORD *)uint64_t v89 = *v90;
    *(_OWORD *)(v89 + 16) = v96;
    *(_OWORD *)(v89 + 32) = v95;
  }
  else
  {
    *(unsigned char *)uint64_t v89 = *(unsigned char *)v90;
    *(void *)(v89 + 8) = *((void *)v90 + 1);
    *(void *)(v89 + 16) = *((void *)v90 + 2);
    *(void *)(v89 + 24) = *((void *)v90 + 3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v89 + 32) = *((void *)v90 + 4);
    *(void *)(v89 + 40) = *((void *)v90 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  *(_WORD *)(a1 + a3[12]) = *(_WORD *)(a2 + a3[12]);
  uint64_t v97 = a3[13];
  uint64_t v98 = (void *)(a1 + v97);
  unint64_t v99 = (void *)(a2 + v97);
  uint64_t v100 = *(void *)(a1 + v97 + 8);
  uint64_t v101 = v99[1];
  if (v100)
  {
    if (v101)
    {
      *uint64_t v98 = *v99;
      v98[1] = v99[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v98[2] = v99[2];
      v98[3] = v99[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_10002419C((uint64_t)v98);
      long long v102 = *((_OWORD *)v99 + 1);
      *(_OWORD *)uint64_t v98 = *(_OWORD *)v99;
      *((_OWORD *)v98 + 1) = v102;
    }
  }
  else if (v101)
  {
    *uint64_t v98 = *v99;
    v98[1] = v99[1];
    v98[2] = v99[2];
    v98[3] = v99[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v110 = *((_OWORD *)v99 + 1);
    *(_OWORD *)uint64_t v98 = *(_OWORD *)v99;
    *((_OWORD *)v98 + 1) = v110;
  }
  return a1;
}

uint64_t sub_1000240D4(uint64_t a1)
{
  if (*(void *)(a1 + 48) != 1) {
    swift_bridgeObjectRelease();
  }
  return a1;
}

uint64_t sub_100024108(uint64_t a1)
{
  return a1;
}

uint64_t sub_100024138(uint64_t a1)
{
  return a1;
}

uint64_t sub_100024168(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002419C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000241D0(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v6 = a3[10];
  long long v7 = (unsigned char *)(a1 + v6);
  long long v8 = (unsigned char *)(a2 + v6);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v9 = type metadata accessor for EmbedParameters(0);
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_100003F3C(&qword_100044258);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    *long long v7 = *v8;
    uint64_t v12 = *(int *)(v9 + 20);
    long long v13 = &v7[v12];
    long long v14 = &v8[v12];
    uint64_t v15 = sub_100037D90();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
    *(_OWORD *)&v7[*(int *)(v9 + 24)] = *(_OWORD *)&v8[*(int *)(v9 + 24)];
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v16 = a3[11];
  uint64_t v17 = a3[12];
  long long v18 = *(_OWORD *)(a2 + v16);
  long long v19 = *(_OWORD *)(a2 + v16 + 16);
  long long v20 = *(_OWORD *)(a2 + v16 + 32);
  long long v21 = (_OWORD *)(a1 + v16);
  *long long v21 = v18;
  v21[1] = v19;
  v21[2] = v20;
  *(_WORD *)(a1 + v17) = *(_WORD *)(a2 + v17);
  uint64_t v22 = a3[13];
  long long v23 = (_OWORD *)(a1 + v22);
  long long v24 = (_OWORD *)(a2 + v22);
  long long v25 = v24[1];
  *long long v23 = *v24;
  v23[1] = v25;
  return a1;
}

uint64_t sub_1000243E0(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 152) == 2) {
    goto LABEL_4;
  }
  if (*(void *)(a2 + 152) == 2)
  {
    sub_100024138(a1 + 40);
LABEL_4:
    long long v6 = *(_OWORD *)(a2 + 152);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 152) = v6;
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    long long v7 = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 88) = v7;
    long long v8 = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v8;
    long long v9 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = v9;
    goto LABEL_19;
  }
  uint64_t v10 = *(void *)(a2 + 96);
  uint64_t v11 = *(void *)(a1 + 96);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  if (v11 == 2) {
    goto LABEL_8;
  }
  if (v10 == 2)
  {
    sub_1000240D4(a1 + 48);
LABEL_8:
    long long v12 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = v12;
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
    *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
    long long v13 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v13;
    goto LABEL_14;
  }
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_WORD *)(a1 + 73) = *(_WORD *)(a2 + 73);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  if (v11 == 1) {
    goto LABEL_12;
  }
  if (v10 == 1)
  {
    sub_100021A34(a1 + 96);
LABEL_12:
    long long v14 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 112) = v14;
    *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
    goto LABEL_14;
  }
  *(void *)(a1 + 96) = v10;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
LABEL_14:
  if (*(void *)(a1 + 152) == 1)
  {
LABEL_17:
    long long v16 = *(_OWORD *)(a2 + 152);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 152) = v16;
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    goto LABEL_19;
  }
  uint64_t v15 = *(void *)(a2 + 152);
  if (v15 == 1)
  {
    sub_100024108(a1 + 136);
    goto LABEL_17;
  }
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v18;
  swift_bridgeObjectRelease();
LABEL_19:
  uint64_t v19 = a3[10];
  long long v20 = (unsigned char *)(a1 + v19);
  long long v21 = (unsigned char *)(a2 + v19);
  uint64_t v22 = type metadata accessor for EmbedParameters(0);
  uint64_t v23 = *(void *)(v22 - 8);
  long long v24 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v23 + 48);
  int v25 = v24(v20, 1, v22);
  int v26 = v24(v21, 1, v22);
  if (v25)
  {
    if (!v26)
    {
      *long long v20 = *v21;
      uint64_t v27 = *(int *)(v22 + 20);
      uint64_t v28 = &v20[v27];
      uint64_t v29 = &v21[v27];
      uint64_t v30 = sub_100037D90();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v30 - 8) + 32))(v28, v29, v30);
      *(_OWORD *)&v20[*(int *)(v22 + 24)] = *(_OWORD *)&v21[*(int *)(v22 + 24)];
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v26)
  {
    sub_10002A330((uint64_t)v20, type metadata accessor for EmbedParameters);
LABEL_24:
    uint64_t v31 = sub_100003F3C(&qword_100044258);
    memcpy(v20, v21, *(void *)(*(void *)(v31 - 8) + 64));
    goto LABEL_25;
  }
  *long long v20 = *v21;
  uint64_t v45 = *(int *)(v22 + 20);
  uint64_t v46 = &v20[v45];
  uint64_t v47 = &v21[v45];
  uint64_t v48 = sub_100037D90();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v48 - 8) + 40))(v46, v47, v48);
  uint64_t v49 = *(int *)(v22 + 24);
  long long v50 = &v20[v49];
  long long v51 = (uint64_t *)&v21[v49];
  uint64_t v53 = *v51;
  uint64_t v52 = v51[1];
  *long long v50 = v53;
  v50[1] = v52;
  swift_bridgeObjectRelease();
LABEL_25:
  uint64_t v32 = a3[11];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = a2 + v32;
  if (*(void *)(a1 + v32 + 24) == 1)
  {
LABEL_28:
    long long v36 = *(_OWORD *)(v34 + 16);
    *(_OWORD *)uint64_t v33 = *(_OWORD *)v34;
    *(_OWORD *)(v33 + 16) = v36;
    *(_OWORD *)(v33 + 32) = *(_OWORD *)(v34 + 32);
    goto LABEL_30;
  }
  uint64_t v35 = *(void *)(v34 + 24);
  if (v35 == 1)
  {
    sub_100024168(v33);
    goto LABEL_28;
  }
  *(unsigned char *)uint64_t v33 = *(unsigned char *)v34;
  *(_OWORD *)(v33 + 8) = *(_OWORD *)(v34 + 8);
  *(void *)(v33 + 24) = v35;
  swift_bridgeObjectRelease();
  uint64_t v37 = *(void *)(v34 + 40);
  *(void *)(v33 + 32) = *(void *)(v34 + 32);
  *(void *)(v33 + 40) = v37;
  swift_bridgeObjectRelease();
LABEL_30:
  uint64_t v38 = a3[13];
  *(_WORD *)(a1 + a3[12]) = *(_WORD *)(a2 + a3[12]);
  uint64_t v39 = a1 + v38;
  uint64_t v40 = a2 + v38;
  if (!*(void *)(a1 + v38 + 8))
  {
LABEL_34:
    long long v43 = *(_OWORD *)(v40 + 16);
    *(_OWORD *)uint64_t v39 = *(_OWORD *)v40;
    *(_OWORD *)(v39 + 16) = v43;
    return a1;
  }
  uint64_t v41 = *(void *)(v40 + 8);
  if (!v41)
  {
    sub_10002419C(a1 + v38);
    goto LABEL_34;
  }
  *(void *)uint64_t v39 = *(void *)v40;
  *(void *)(v39 + 8) = v41;
  swift_bridgeObjectRelease();
  uint64_t v42 = *(void *)(v40 + 24);
  *(void *)(v39 + 16) = *(void *)(v40 + 16);
  *(void *)(v39 + 24) = v42;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000248A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000248BC);
}

uint64_t sub_1000248BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100003F3C(&qword_100044258);
    long long v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 40);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100024970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100024984);
}

uint64_t sub_100024984(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 32) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100003F3C(&qword_100044258);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 40);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for ZeoliteExtensionConfig(uint64_t a1)
{
  return sub_10002A834(a1, (uint64_t *)&unk_100044448);
}

void sub_100024A50()
{
  sub_10002EDB0(319, (unint64_t *)&unk_100044458, (void (*)(uint64_t))type metadata accessor for EmbedParameters);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t destroy for InferenceParameters()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for InferenceParameters(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for InferenceParameters(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for InferenceParameters(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for InferenceParameters(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InferenceParameters(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InferenceParameters(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InferenceParameters()
{
  return &type metadata for InferenceParameters;
}

uint64_t destroy for ScoreParameters()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ScoreParameters(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ScoreParameters(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ScoreParameters(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ScoreParameters(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ScoreParameters(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for ScoreParameters()
{
  return &type metadata for ScoreParameters;
}

uint64_t destroy for ExtractParameters(uint64_t a1)
{
  if ((unint64_t)(*(void *)(a1 + 56) - 1) >= 2) {
    swift_bridgeObjectRelease();
  }
  uint64_t result = *(void *)(a1 + 112);
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for ExtractParameters(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = a1 + 8;
  uint64_t v5 = *(void *)(a2 + 56);
  if (v5 == 2)
  {
    long long v6 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(v4 + 32) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(v4 + 48) = v6;
    *(_OWORD *)(v4 + 64) = *(_OWORD *)(a2 + 72);
    *(unsigned char *)(v4 + 80) = *(unsigned char *)(a2 + 88);
    long long v7 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)uint64_t v4 = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(v4 + 16) = v7;
  }
  else
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    *(_WORD *)(a1 + 33) = *(_WORD *)(a2 + 33);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    if (v5 == 1)
    {
      long long v8 = *(_OWORD *)(a2 + 72);
      *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a1 + 72) = v8;
      *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
    }
    else
    {
      uint64_t v9 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v5;
      *(void *)(a1 + 64) = v9;
      *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
      swift_bridgeObjectRetain();
    }
  }
  uint64_t v10 = *(void *)(a2 + 112);
  if (v10 == 1)
  {
    long long v11 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 112) = v11;
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
  }
  else
  {
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    uint64_t v12 = *(void *)(a2 + 120);
    uint64_t v13 = *(void *)(a2 + 128);
    *(void *)(a1 + 112) = v10;
    *(void *)(a1 + 120) = v12;
    uint64_t v14 = *(void *)(a2 + 136);
    uint64_t v15 = *(void *)(a2 + 144);
    *(void *)(a1 + 128) = v13;
    *(void *)(a1 + 136) = v14;
    *(void *)(a1 + 144) = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for ExtractParameters(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v5 = (long long *)(a2 + 56);
  uint64_t v4 = *(void *)(a2 + 56);
  uint64_t v6 = a1 + 8;
  uint64_t v7 = a2 + 8;
  uint64_t v8 = a1 + 56;
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9 == 2)
  {
    if (v4 == 2)
    {
      long long v10 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)uint64_t v6 = *(_OWORD *)v7;
      *(_OWORD *)(a1 + 24) = v10;
      long long v11 = *(_OWORD *)(a2 + 40);
      long long v12 = *(_OWORD *)(a2 + 56);
      long long v13 = *(_OWORD *)(a2 + 72);
      *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
      *(_OWORD *)(a1 + 56) = v12;
      *(_OWORD *)(a1 + 72) = v13;
      *(_OWORD *)(a1 + 40) = v11;
      goto LABEL_14;
    }
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
    *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
    uint64_t v18 = *(void *)(a2 + 40);
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    *(void *)(a1 + 40) = v18;
    uint64_t v19 = *(void *)(a2 + 56);
LABEL_8:
    if (v19 == 1)
    {
      long long v21 = *v5;
      long long v22 = *(_OWORD *)(a2 + 72);
      *(unsigned char *)(v8 + 32) = *(unsigned char *)(a2 + 88);
      *(_OWORD *)uint64_t v8 = v21;
      *(_OWORD *)(v8 + 16) = v22;
    }
    else
    {
      *(void *)(a1 + 56) = v19;
      uint64_t v23 = *(void *)(a2 + 64);
      *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
      *(void *)(a1 + 64) = v23;
      uint64_t v24 = *(void *)(a2 + 80);
      *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
      *(void *)(a1 + 80) = v24;
      swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  if (v4 != 2)
  {
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
    *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
    uint64_t v20 = *(void *)(a2 + 40);
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    *(void *)(a1 + 40) = v20;
    uint64_t v19 = *(void *)(a2 + 56);
    if (v9 != 1)
    {
      if (v19 == 1)
      {
        sub_100021A34(v8);
        char v25 = *((unsigned char *)v5 + 32);
        long long v26 = v5[1];
        *(_OWORD *)uint64_t v8 = *v5;
        *(_OWORD *)(v8 + 16) = v26;
        *(unsigned char *)(v8 + 32) = v25;
      }
      else
      {
        *(void *)(a1 + 56) = v19;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v27 = *(void *)(a2 + 64);
        *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
        *(void *)(a1 + 64) = v27;
        uint64_t v28 = *(void *)(a2 + 80);
        *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
        *(void *)(a1 + 80) = v28;
      }
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  sub_1000240D4(a1 + 8);
  long long v14 = *(_OWORD *)(v7 + 16);
  *(_OWORD *)uint64_t v6 = *(_OWORD *)v7;
  *(_OWORD *)(v6 + 16) = v14;
  long long v16 = *(_OWORD *)(v7 + 48);
  long long v15 = *(_OWORD *)(v7 + 64);
  long long v17 = *(_OWORD *)(v7 + 32);
  *(unsigned char *)(v6 + 80) = *(unsigned char *)(v7 + 80);
  *(_OWORD *)(v6 + 48) = v16;
  *(_OWORD *)(v6 + 64) = v15;
  *(_OWORD *)(v6 + 32) = v17;
LABEL_14:
  uint64_t v29 = (_OWORD *)(a1 + 96);
  uint64_t v30 = (long long *)(a2 + 96);
  uint64_t v31 = *(void *)(a2 + 112);
  if (*(void *)(a1 + 112) == 1)
  {
    if (v31 == 1)
    {
      long long v32 = *v30;
      long long v33 = *(_OWORD *)(a2 + 112);
      long long v34 = *(_OWORD *)(a2 + 128);
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      *(_OWORD *)(a1 + 112) = v33;
      *(_OWORD *)(a1 + 128) = v34;
      _OWORD *v29 = v32;
    }
    else
    {
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v31 == 1)
  {
    sub_100024108(a1 + 96);
    long long v36 = *(_OWORD *)(a2 + 112);
    long long v35 = *(_OWORD *)(a2 + 128);
    long long v37 = *v30;
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    *(_OWORD *)(a1 + 112) = v36;
    *(_OWORD *)(a1 + 128) = v35;
    _OWORD *v29 = v37;
  }
  else
  {
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 120) = *(void *)(a2 + 120);
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

__n128 initializeWithTake for ExtractParameters(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 128);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for ExtractParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2 + 8;
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v5 = a1 + 8;
  uint64_t v7 = a1 + 56;
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6 == 2) {
    goto LABEL_4;
  }
  uint64_t v9 = (_OWORD *)(a2 + 56);
  uint64_t v8 = *(void *)(a2 + 56);
  if (v8 == 2)
  {
    sub_1000240D4(v5);
LABEL_4:
    long long v10 = *(_OWORD *)(v4 + 48);
    *(_OWORD *)(v5 + 32) = *(_OWORD *)(v4 + 32);
    *(_OWORD *)(v5 + 48) = v10;
    *(_OWORD *)(v5 + 64) = *(_OWORD *)(v4 + 64);
    *(unsigned char *)(v5 + 80) = *(unsigned char *)(v4 + 80);
    long long v11 = *(_OWORD *)(v4 + 16);
    *(_OWORD *)uint64_t v5 = *(_OWORD *)v4;
    *(_OWORD *)(v5 + 16) = v11;
    goto LABEL_10;
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_WORD *)(a1 + 33) = *(_WORD *)(a2 + 33);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  if (v6 == 1) {
    goto LABEL_8;
  }
  if (v8 == 1)
  {
    sub_100021A34(v7);
LABEL_8:
    long long v12 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)uint64_t v7 = *v9;
    *(_OWORD *)(v7 + 16) = v12;
    *(unsigned char *)(v7 + 32) = *(unsigned char *)(a2 + 88);
    goto LABEL_10;
  }
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
LABEL_10:
  if (*(void *)(a1 + 112) != 1)
  {
    uint64_t v13 = *(void *)(a2 + 112);
    if (v13 != 1)
    {
      *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
      *(void *)(a1 + 112) = v13;
      swift_bridgeObjectRelease();
      uint64_t v15 = *(void *)(a2 + 128);
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      *(void *)(a1 + 128) = v15;
      swift_bridgeObjectRelease();
      uint64_t v16 = *(void *)(a2 + 144);
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      *(void *)(a1 + 144) = v16;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_100024108(a1 + 96);
  }
  long long v14 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v14;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExtractParameters(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFFD && *(unsigned char *)(a1 + 152)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 112);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  BOOL v5 = __OFSUB__(v4, 1);
  int v6 = v4 - 1;
  if (v6 < 0 != v5) {
    int v6 = -1;
  }
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for ExtractParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 2147483646;
    if (a3 > 0x7FFFFFFD) {
      *(unsigned char *)(result + 152) = 1;
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFD) {
      *(unsigned char *)(result + 152) = 0;
    }
    if (a2) {
      *(void *)(result + 112) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtractParameters()
{
  return &type metadata for ExtractParameters;
}

uint64_t destroy for ExtractTransparencyParameters()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ExtractTransparencyParameters(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ExtractTransparencyParameters(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for ExtractTransparencyParameters(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ExtractTransparencyParameters(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ExtractTransparencyParameters(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 56)) {
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

uint64_t storeEnumTagSinglePayload for ExtractTransparencyParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtractTransparencyParameters()
{
  return &type metadata for ExtractTransparencyParameters;
}

uint64_t destroy for ExtractEmailParameters(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for ExtractEmailParameters(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_WORD *)(a1 + 25) = *(_WORD *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v3 = *(void *)(a2 + 48);
  if (v3 == 1)
  {
    long long v4 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v4;
    *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  }
  else
  {
    uint64_t v5 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = v3;
    *(void *)(a1 + 56) = v5;
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for ExtractEmailParameters(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(unsigned char *)(a1 + 26) = *(unsigned char *)(a2 + 26);
  uint64_t v4 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = a1 + 48;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v8 = (long long *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 48);
  if (v6 == 1)
  {
    if (v7 == 1)
    {
      long long v9 = *v8;
      long long v10 = *(_OWORD *)(a2 + 64);
      *(unsigned char *)(v5 + 32) = *(unsigned char *)(a2 + 80);
      *(_OWORD *)uint64_t v5 = v9;
      *(_OWORD *)(v5 + 16) = v10;
    }
    else
    {
      *(void *)(a1 + 48) = v7;
      uint64_t v13 = *(void *)(a2 + 56);
      *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
      *(void *)(a1 + 56) = v13;
      uint64_t v14 = *(void *)(a2 + 72);
      *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
      *(void *)(a1 + 72) = v14;
      swift_bridgeObjectRetain();
    }
  }
  else if (v7 == 1)
  {
    sub_100021A34(v5);
    char v11 = *((unsigned char *)v8 + 32);
    long long v12 = v8[1];
    *(_OWORD *)uint64_t v5 = *v8;
    *(_OWORD *)(v5 + 16) = v12;
    *(unsigned char *)(v5 + 32) = v11;
  }
  else
  {
    *(void *)(a1 + 48) = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v15 = *(void *)(a2 + 56);
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
    *(void *)(a1 + 56) = v15;
    uint64_t v16 = *(void *)(a2 + 72);
    *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
    *(void *)(a1 + 72) = v16;
  }
  return a1;
}

__n128 initializeWithTake for ExtractEmailParameters(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for ExtractEmailParameters(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_WORD *)(a1 + 25) = *(_WORD *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v3 = a1 + 48;
  uint64_t v5 = a2 + 48;
  uint64_t v4 = *(void *)(a2 + 48);
  if (*(void *)(a1 + 48) != 1)
  {
    if (v4 != 1)
    {
      *(void *)(a1 + 48) = v4;
      swift_bridgeObjectRelease();
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
      return a1;
    }
    sub_100021A34(v3);
  }
  long long v6 = *(_OWORD *)(v5 + 16);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)v5;
  *(_OWORD *)(v3 + 16) = v6;
  *(unsigned char *)(v3 + 32) = *(unsigned char *)(v5 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExtractEmailParameters(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFFD && *(unsigned char *)(a1 + 81)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 48);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  BOOL v5 = __OFSUB__(v4, 1);
  int v6 = v4 - 1;
  if (v6 < 0 != v5) {
    int v6 = -1;
  }
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for ExtractEmailParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)__n128 result = a2 - 2147483646;
    if (a3 > 0x7FFFFFFD) {
      *(unsigned char *)(result + 81) = 1;
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFD) {
      *(unsigned char *)(result + 81) = 0;
    }
    if (a2) {
      *(void *)(result + 48) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtractEmailParameters()
{
  return &type metadata for ExtractEmailParameters;
}

uint64_t destroy for FilterCriteria()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FilterCriteria(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FilterCriteria(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v5;
  return a1;
}

__n128 initializeWithTake for FilterCriteria(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for FilterCriteria(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for FilterCriteria(uint64_t *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FilterCriteria(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for FilterCriteria()
{
  return &type metadata for FilterCriteria;
}

uint64_t *sub_100025EE0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *int v4 = *a2;
    int v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (char *)a1 + v7;
    long long v9 = (char *)a2 + v7;
    uint64_t v10 = sub_100037D90();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = *(int *)(a3 + 24);
    long long v12 = (uint64_t *)((char *)v4 + v11);
    uint64_t v13 = (uint64_t *)((char *)a2 + v11);
    uint64_t v14 = v13[1];
    *long long v12 = *v13;
    v12[1] = v14;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_100025FD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_100037D90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  return swift_bridgeObjectRelease();
}

unsigned char *sub_10002605C(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_100037D90();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = &a1[v10];
  long long v12 = &a2[v10];
  uint64_t v13 = v12[1];
  void *v11 = *v12;
  v11[1] = v13;
  swift_bridgeObjectRetain();
  return a1;
}

unsigned char *sub_100026100(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_100037D90();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = &a1[v10];
  long long v12 = &a2[v10];
  void *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

unsigned char *sub_1000261B8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_100037D90();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)&a1[*(int *)(a3 + 24)] = *(_OWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

unsigned char *sub_100026250(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_100037D90();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = &a1[v10];
  long long v12 = (uint64_t *)&a2[v10];
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  void *v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000262F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002630C);
}

uint64_t sub_10002630C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100037D90();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    int v13 = v12 - 1;
    if (v13 < 0) {
      int v13 = -1;
    }
    return (v13 + 1);
  }
}

uint64_t sub_1000263E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000263F4);
}

uint64_t sub_1000263F4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100037D90();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  }
  return result;
}

uint64_t sub_1000264B8()
{
  uint64_t result = sub_100037D90();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100026558()
{
  v1._countAndFlagsBits = sub_1000386E0();
  sub_100038340(v1);
  swift_bridgeObjectRelease();
  return 0x6769666E6F63;
}

uint64_t sub_1000265C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_100003F3C(&qword_1000440F0);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v80 = (char *)v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v67 - v7;
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v67 - v9;
  uint64_t v11 = sub_100037C20();
  uint64_t v83 = *(void *)(v11 - 8);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v79 = (char *)v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)v67 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)v67 - v18;
  __chkstk_darwin(v17);
  uint64_t v82 = (char *)v67 - v20;
  uint64_t v21 = type metadata accessor for ExecutionState(0);
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v81 = (char *)v67 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v24 = [objc_allocWithZone((Class)NSISO8601DateFormatter) init];
  if (*(void *)(a1 + 16)
    && (unint64_t v25 = sub_10002142C(0x706D6F437473616CLL, 0xEE006E6F6974656CLL), (v26 & 1) != 0)
    && (sub_100020A94(*(void *)(a1 + 56) + 32 * v25, (uint64_t)&v84), (swift_dynamicCast() & 1) != 0))
  {
    uint64_t v78 = v11;
    uint64_t v75 = a2;
    NSString v27 = sub_100038300();
    swift_bridgeObjectRelease();
    id v28 = [v24 dateFromString:v27];

    uint64_t v76 = v21;
    id v77 = v24;
    if (v28)
    {
      uint64_t v71 = v8;
      sub_100037C00();

      uint64_t v29 = v83;
      uint64_t v31 = v83 + 32;
      uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v83 + 32);
      uint64_t v72 = v19;
      uint64_t v73 = v30;
      uint64_t v32 = v78;
      v30(v10, v19, v78);
      uint64_t v74 = *(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56);
      v74(v10, 0, 1, v32);
      long long v33 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 48);
      if (v33((uint64_t)v10, 1, v32) != 1)
      {
        long long v68 = v33;
        uint64_t v69 = v29 + 48;
        uint64_t v70 = v29 + 56;
        long long v34 = v82;
        long long v35 = v73;
        v73(v82, v10, v32);
        uint64_t v36 = (uint64_t)v81;
        (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v81, v34, v32);
        uint64_t v37 = *(void *)(a1 + 16);
        v67[1] = v31;
        if (v37 && (uint64_t v38 = v35, v39 = sub_10002142C(0x726575517473616CLL, 0xEB00000000646569), (v40 & 1) != 0))
        {
          sub_100020A94(*(void *)(a1 + 56) + 32 * v39, (uint64_t)&v84);
          char v41 = swift_dynamicCast();
          uint64_t v42 = v72;
          long long v43 = (void (*)(uint64_t, void, uint64_t, uint64_t))v74;
          if (v41)
          {
            NSString v44 = sub_100038300();
            swift_bridgeObjectRelease();
            id v45 = [v77 dateFromString:v44];

            if (v45)
            {
              sub_100037C00();

              uint64_t v46 = (uint64_t)v71;
              uint64_t v47 = v78;
              v38(v71, v42, v78);
              v74((char *)v46, 0, 1, v47);
              uint64_t v48 = v47;
              long long v43 = (void (*)(uint64_t, void, uint64_t, uint64_t))v74;
              int v49 = v68(v46, 1, v48);
              uint64_t v36 = (uint64_t)v81;
              if (v49 != 1)
              {
                uint64_t v50 = v78;
                v38(v16, (char *)v46, v78);
                uint64_t v51 = v76;
                uint64_t v52 = v36 + *(int *)(v76 + 20);
                v38((char *)v52, v16, v50);
                uint64_t v21 = v51;
                uint64_t v53 = v50;
                long long v43 = (void (*)(uint64_t, void, uint64_t, uint64_t))v74;
                v74((char *)v52, 0, 1, v53);
                uint64_t v54 = v83;
LABEL_21:
                id v57 = v77;
                if (*(void *)(a1 + 16)
                  && (unint64_t v58 = sub_10002142C(0x6D6574497473616CLL, 0xEC00000065746144), (v59 & 1) != 0))
                {
                  sub_100020A94(*(void *)(a1 + 56) + 32 * v58, (uint64_t)&v84);
                }
                else
                {
                  long long v84 = 0u;
                  long long v85 = 0u;
                }
                swift_bridgeObjectRelease();
                if (*((void *)&v85 + 1))
                {
                  if (swift_dynamicCast())
                  {
                    NSString v60 = sub_100038300();
                    swift_bridgeObjectRelease();
                    id v61 = [v57 dateFromString:v60];

                    if (v61)
                    {
                      sub_100037C00();

                      uint64_t v62 = v78;
                      (*(void (**)(char *, uint64_t))(v54 + 8))(v82, v78);
                      uint64_t v63 = (uint64_t)v80;
                      uint64_t v64 = (void (*)(char *, uint64_t, uint64_t))v73;
                      v73(v80, v42, v62);
                      v43(v63, 0, 1, v62);
                      if (v68(v63, 1, v62) != 1)
                      {
                        long long v65 = v79;
                        v64(v79, v63, v62);
                        uint64_t v66 = v36 + *(int *)(v21 + 24);
                        v64((char *)v66, (uint64_t)v65, v62);
                        v43(v66, 0, 1, v62);
                        a2 = v75;
LABEL_36:
                        sub_10002B000(v36, a2);
                        uint64_t v55 = 0;
                        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56))(a2, v55, 1, v21);
                      }
                    }
                    else
                    {

                      uint64_t v62 = v78;
                      (*(void (**)(char *, uint64_t))(v54 + 8))(v82, v78);
                      uint64_t v63 = (uint64_t)v80;
                      v43((uint64_t)v80, 1, 1, v62);
                    }
                    sub_100020974(v63, &qword_1000440F0);
LABEL_35:
                    a2 = v75;
                    v43(v36 + *(int *)(v21 + 24), 1, 1, v62);
                    goto LABEL_36;
                  }
                }
                else
                {

                  sub_100020974((uint64_t)&v84, &qword_1000445D0);
                }
                uint64_t v62 = v78;
                (*(void (**)(char *, uint64_t))(v54 + 8))(v82, v78);
                goto LABEL_35;
              }
            }
            else
            {
              uint64_t v46 = (uint64_t)v71;
              v43((uint64_t)v71, 1, 1, v78);
              uint64_t v36 = (uint64_t)v81;
            }
            sub_100020974(v46, &qword_1000440F0);
          }
          uint64_t v54 = v83;
        }
        else
        {
          uint64_t v54 = v83;
          uint64_t v42 = v72;
          long long v43 = (void (*)(uint64_t, void, uint64_t, uint64_t))v74;
        }
        uint64_t v21 = v76;
        v43(v36 + *(int *)(v76 + 20), 1, 1, v78);
        goto LABEL_21;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v83 + 56))(v10, 1, 1, v78);
    }
    swift_bridgeObjectRelease();

    sub_100020974((uint64_t)v10, &qword_1000440F0);
    uint64_t v55 = 1;
    a2 = v75;
    uint64_t v21 = v76;
  }
  else
  {
    swift_bridgeObjectRelease();

    uint64_t v55 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56))(a2, v55, 1, v21);
}

uint64_t sub_100026EE0()
{
  uint64_t v0 = sub_100037B10();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100037B50();
  swift_allocObject();
  sub_100037B40();
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, enum case for JSONEncoder.DateEncodingStrategy.iso8601(_:), v0);
  sub_100037B20();
  type metadata accessor for ExecutionState(0);
  sub_10002A6D0(&qword_1000445D8, (void (*)(uint64_t))type metadata accessor for ExecutionState);
  uint64_t v4 = sub_100037B30();
  unint64_t v6 = v5;
  uint64_t v7 = self;
  Class isa = sub_100037BD0().super.isa;
  sub_10002B0B0(v4, v6);
  *(void *)&v16[0] = 0;
  id v9 = [v7 JSONObjectWithData:isa options:0 error:v16];

  id v10 = *(id *)&v16[0];
  if (v9)
  {
    sub_1000384D0();
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v12 = v10;
    sub_100037B60();

    swift_willThrow();
    swift_errorRelease();
    swift_release();
    memset(v16, 0, sizeof(v16));
  }
  sub_1000206DC((uint64_t)v16, (uint64_t)v14, &qword_1000445D0);
  if (v15)
  {
    sub_100003F3C(&qword_1000445E0);
    if (swift_dynamicCast()) {
      return v13;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_100020974((uint64_t)v14, &qword_1000445D0);
    return 0;
  }
}

uint64_t sub_100027194(char a1)
{
  if (a1) {
    return 0x726170736E617274;
  }
  else {
    return 0x6C69616D65;
  }
}

uint64_t sub_1000271D0(char a1)
{
  if (a1) {
    return 0x656D6F6962;
  }
  else {
    return 0x79726F6D654D6E69;
  }
}

uint64_t sub_100027204(char *a1, char *a2)
{
  return sub_100004B1C(*a1, *a2);
}

Swift::Int sub_100027210()
{
  return sub_100004E08();
}

uint64_t sub_100027218()
{
  return sub_1000050D4();
}

Swift::Int sub_100027220()
{
  return sub_100005314();
}

uint64_t sub_100027228@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  return sub_1000274C8(a1, (Swift::OpaquePointer)&off_100041380, a2);
}

uint64_t sub_100027234@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000271D0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_100027260(void *a1@<X8>)
{
  *a1 = &off_1000413D0;
}

uint64_t sub_100027270()
{
  return sub_100038380();
}

uint64_t sub_1000272D0()
{
  return sub_100038370();
}

uint64_t sub_100027320(char a1)
{
  return *(void *)&aExtract_2[8 * a1];
}

uint64_t sub_100027340(char a1)
{
  return qword_10003C8E8[a1];
}

uint64_t sub_100027358(char *a1, char *a2)
{
  return sub_100004C44(*a1, *a2);
}

Swift::Int sub_100027364()
{
  return sub_100004E88();
}

uint64_t sub_10002736C()
{
  return sub_100005190();
}

Swift::Int sub_100027374()
{
  return sub_100005244();
}

uint64_t sub_10002737C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10002B108(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_1000273AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100027320(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_1000273D8(void *a1@<X8>)
{
  *a1 = &off_100041508;
}

uint64_t sub_1000273E8()
{
  return sub_100038380();
}

uint64_t sub_100027448()
{
  return sub_100038370();
}

uint64_t sub_100027498(char *a1, char *a2)
{
  return sub_100004A74(*a1, *a2);
}

Swift::Int sub_1000274A4()
{
  return sub_100004EF4();
}

uint64_t sub_1000274AC()
{
  return sub_100005064();
}

Swift::Int sub_1000274B4()
{
  return sub_100005390();
}

uint64_t sub_1000274BC@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  return sub_1000274C8(a1, (Swift::OpaquePointer)&off_100041490, a2);
}

uint64_t sub_1000274C8@<X0>(uint64_t *a1@<X0>, Swift::OpaquePointer a2@<X3>, char *a3@<X8>)
{
  v9._countAndFlagsBits = *a1;
  uint64_t v4 = (void *)a1[1];
  v9._object = v4;
  Swift::Int v6 = sub_1000385D0(a2, v9);
  uint64_t result = swift_bridgeObjectRelease();
  if (v6 == 1) {
    char v8 = 1;
  }
  else {
    char v8 = 2;
  }
  if (!v6) {
    char v8 = 0;
  }
  *a3 = v8;
  return result;
}

uint64_t sub_100027524@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100027194(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_100027550(void *a1@<X8>)
{
  *a1 = &off_100041530;
}

uint64_t sub_100027560()
{
  return sub_100038380();
}

uint64_t sub_1000275C0()
{
  return sub_100038370();
}

uint64_t sub_100027610(char *a1, char *a2)
{
  return sub_100004984(*a1, *a2);
}

Swift::Int sub_10002761C()
{
  return sub_10000547C();
}

uint64_t sub_100027628()
{
  return sub_100004FD0();
}

Swift::Int sub_100027630()
{
  return sub_10000547C();
}

uint64_t sub_100027638@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10002B064(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_100027668@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100027340(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_100027694(void *a1@<X8>)
{
  *a1 = &off_1000414E0;
}

uint64_t sub_1000276A4()
{
  return sub_100038380();
}

uint64_t sub_100027704()
{
  return sub_100038370();
}

uint64_t sub_100027754(char a1)
{
  return *(void *)&aSourcetyemail[8 * a1];
}

uint64_t sub_10002777C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100003F3C(&qword_100044658);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  char v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_100004508(a1, a1[3]);
  sub_10002D45C();
  sub_1000387F0();
  sub_1000206DC(v3, (uint64_t)&v15, &qword_1000442D0);
  sub_1000206DC((uint64_t)&v15, (uint64_t)v11, &qword_1000442D0);
  char v14 = 0;
  sub_10002D5AC();
  sub_100038690();
  if (!v2)
  {
    sub_1000206DC(v3 + 8, (uint64_t)v13, &qword_100044668);
    sub_1000206DC((uint64_t)v13, (uint64_t)v11, &qword_100044668);
    char v14 = 1;
    sub_10002D600();
    sub_100038690();
    sub_1000206DC(v3 + 96, (uint64_t)v12, &qword_100044678);
    sub_1000206DC((uint64_t)v12, (uint64_t)v11, &qword_100044678);
    char v14 = 2;
    sub_10002D654();
    sub_100038690();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000279B4()
{
  return sub_100027754(*v0);
}

uint64_t sub_1000279BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002B154(a1, a2);
  *a3 = result;
  return result;
}

void sub_1000279E4(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1000279F0(uint64_t a1)
{
  unint64_t v2 = sub_10002D45C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100027A2C(uint64_t a1)
{
  unint64_t v2 = sub_10002D45C();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_100027A68@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10002B2AC(a1, (uint64_t)v9);
  if (!v2)
  {
    long long v5 = v9[7];
    *(_OWORD *)(a2 + 96) = v9[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(_OWORD *)(a2 + 128) = v9[8];
    *(void *)(a2 + 144) = v10;
    long long v6 = v9[3];
    *(_OWORD *)(a2 + 32) = v9[2];
    *(_OWORD *)(a2 + 48) = v6;
    long long v7 = v9[5];
    *(_OWORD *)(a2 + 64) = v9[4];
    *(_OWORD *)(a2 + 80) = v7;
    double result = *(double *)v9;
    long long v8 = v9[1];
    *(_OWORD *)a2 = v9[0];
    *(_OWORD *)(a2 + 16) = v8;
  }
  return result;
}

uint64_t sub_100027ADC(void *a1)
{
  return sub_10002777C(a1);
}

uint64_t sub_100027B38(char a1)
{
  return *(void *)&aWeekdaysstarth[8 * a1];
}

uint64_t sub_100027B58(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100003F3C(&qword_1000446F8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  long long v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100004508(a1, a1[3]);
  sub_10002D7F8();
  sub_1000387F0();
  sub_1000206DC(v3, (uint64_t)v12, &qword_100044700);
  sub_1000206DC((uint64_t)v12, (uint64_t)v11, &qword_100044700);
  v10[15] = 0;
  sub_100003F3C(&qword_1000446E0);
  sub_10002D8A0(&qword_100044708, &qword_1000446E0, (void (*)(void))sub_10002D90C);
  sub_100038690();
  if (!v2)
  {
    v11[0] = 1;
    sub_100038680();
    v11[0] = 2;
    sub_100038680();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100027D64()
{
  return sub_100027B38(*v0);
}

uint64_t sub_100027D6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002B8C0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100027D94(uint64_t a1)
{
  unint64_t v2 = sub_10002D7F8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100027DD0(uint64_t a1)
{
  unint64_t v2 = sub_10002D7F8();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_100027E0C@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10002BA10(a1, (uint64_t)v6);
  if (!v2)
  {
    double result = *(double *)v6;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(unsigned char *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_100027E54(void *a1)
{
  return sub_100027B58(a1);
}

uint64_t sub_100027E90(char a1)
{
  return *(void *)&aLastdaysmaxmes[8 * a1];
}

uint64_t sub_100027EB0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100003F3C(&qword_1000446B8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  long long v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100004508(a1, a1[3]);
  sub_10002D6FC();
  sub_1000387F0();
  v11[0] = 0;
  sub_1000386C0();
  if (!v2)
  {
    v11[0] = 1;
    sub_1000386C0();
    v11[0] = 2;
    sub_1000386C0();
    v11[0] = 3;
    sub_100038670();
    v11[0] = 4;
    sub_100038670();
    v11[0] = 5;
    sub_100038670();
    v11[0] = 6;
    sub_100038680();
    sub_1000206DC(v3 + 48, (uint64_t)v12, &qword_1000446C0);
    sub_1000206DC((uint64_t)v12, (uint64_t)v11, &qword_1000446C0);
    v10[15] = 7;
    sub_10002D7A4();
    sub_100038690();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10002813C()
{
  return sub_100027E90(*v0);
}

uint64_t sub_100028144@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002BC8C(a1, a2);
  *a3 = result;
  return result;
}

void sub_10002816C(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_100028178(uint64_t a1)
{
  unint64_t v2 = sub_10002D6FC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000281B4(uint64_t a1)
{
  unint64_t v2 = sub_10002D6FC();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_1000281F0@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10002C018(a1, (uint64_t)v7);
  if (!v2)
  {
    long long v5 = v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v7[4];
    *(unsigned char *)(a2 + 80) = v8;
    double result = *(double *)v7;
    long long v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_10002824C(void *a1)
{
  return sub_100027EB0(a1);
}

uint64_t sub_100028298(char a1)
{
  return *(void *)&aMaxeventusecas[8 * a1];
}

uint64_t sub_1000282B8(void *a1)
{
  uint64_t v3 = sub_100003F3C(&qword_100044698);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  long long v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100004508(a1, a1[3]);
  sub_10002D6A8();
  sub_1000387F0();
  v8[15] = 0;
  sub_1000386C0();
  if (!v1)
  {
    v8[14] = 1;
    sub_100038660();
    v8[13] = 2;
    sub_100038660();
    v8[12] = 3;
    sub_100038660();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_100028468()
{
  return sub_100028298(*v0);
}

uint64_t sub_100028470@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002C378(a1, a2);
  *a3 = result;
  return result;
}

void sub_100028498(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1000284A4(uint64_t a1)
{
  unint64_t v2 = sub_10002D6A8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000284E0(uint64_t a1)
{
  unint64_t v2 = sub_10002D6A8();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_10002851C@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10002C52C(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(void *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_10002856C(void *a1)
{
  return sub_1000282B8(a1);
}

uint64_t sub_100028584(char a1)
{
  return *(void *)&aOutputstembedd[8 * a1];
}

uint64_t sub_1000285A4(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100003F3C(&qword_100044730);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100004508(a1, a1[3]);
  sub_10002D960();
  sub_1000387F0();
  v10[15] = *v3;
  v10[14] = 0;
  sub_10002D408();
  sub_100038690();
  if (!v2)
  {
    type metadata accessor for EmbedParameters(0);
    v10[13] = 1;
    sub_100037D90();
    sub_10002A6D0(&qword_100044738, (void (*)(uint64_t))&type metadata accessor for EmbedderName);
    sub_1000386D0();
    v10[12] = 2;
    sub_100038660();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000287A8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v3 = sub_100037D90();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v30 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_100003F3C(&qword_100044718);
  uint64_t v29 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for EmbedParameters(0);
  uint64_t v9 = v8 - 8;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned char *v11 = 0;
  uint64_t v12 = &v11[*(int *)(v9 + 28)];
  uint64_t v28 = v4;
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v12, enum case for EmbedderName.MADTextEmbedder(_:), v3);
  uint64_t v13 = (uint64_t *)&v11[*(int *)(v9 + 32)];
  *uint64_t v13 = 0;
  v13[1] = 0;
  sub_100004508(a1, a1[3]);
  sub_10002D960();
  uint64_t v31 = v7;
  char v14 = v33;
  sub_1000387E0();
  if (v14)
  {
    uint64_t v23 = (uint64_t)a1;
  }
  else
  {
    unint64_t v25 = v13;
    char v26 = v12;
    uint64_t v16 = v29;
    char v15 = v30;
    long long v33 = a1;
    char v36 = 0;
    sub_10002D3B4();
    uint64_t v17 = v31;
    sub_100038610();
    unsigned char *v11 = v37;
    char v35 = 1;
    sub_10002A6D0(&qword_100044728, (void (*)(uint64_t))&type metadata accessor for EmbedderName);
    sub_100038650();
    (*(void (**)(unsigned char *, char *, uint64_t))(v28 + 40))(v26, v15, v3);
    char v34 = 2;
    uint64_t v19 = sub_1000385E0();
    uint64_t v21 = v20;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v17, v32);
    uint64_t v22 = v25;
    swift_bridgeObjectRelease();
    uint64_t *v22 = v19;
    v22[1] = v21;
    sub_10002D9B4((uint64_t)v11, v27, type metadata accessor for EmbedParameters);
    uint64_t v23 = (uint64_t)v33;
  }
  sub_100003FD8(v23);
  return sub_10002A330((uint64_t)v11, type metadata accessor for EmbedParameters);
}

uint64_t sub_100028B60()
{
  return sub_100028584(*v0);
}

uint64_t sub_100028B68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002C7F8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100028B90(uint64_t a1)
{
  unint64_t v2 = sub_10002D960();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100028BCC(uint64_t a1)
{
  unint64_t v2 = sub_10002D960();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100028C08@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000287A8(a1, a2);
}

uint64_t sub_100028C20(void *a1)
{
  return sub_1000285A4(a1);
}

unint64_t sub_100028C38(char a1)
{
  unint64_t result = 107;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000011;
      break;
    case 3:
      unint64_t result = 0x6562614C61746164;
      break;
    default:
      unint64_t result = 0x7274537475706E69;
      break;
  }
  return result;
}

uint64_t sub_100028CD4(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100003F3C(&qword_100044618);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100004508(a1, a1[3]);
  sub_10002D360();
  sub_1000387F0();
  sub_1000206DC(v3, (uint64_t)&v12, &qword_100044620);
  sub_1000206DC((uint64_t)&v12, (uint64_t)&v11, &qword_100044620);
  v10[13] = 0;
  sub_10002D408();
  sub_100038690();
  if (!v2)
  {
    v10[12] = 1;
    sub_1000386C0();
    v10[11] = 2;
    sub_100038660();
    v10[10] = 3;
    sub_100038660();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_100028EBC()
{
  return sub_100028C38(*v0);
}

uint64_t sub_100028EC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002C958(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100028EEC(uint64_t a1)
{
  unint64_t v2 = sub_10002D360();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100028F28(uint64_t a1)
{
  unint64_t v2 = sub_10002D360();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_100028F64@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_10002CB08(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    double result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_100028FA8(void *a1)
{
  return sub_100028CD4(a1);
}

uint64_t sub_100028FE4(char a1)
{
  if (a1) {
    return 0x637265506E61656DLL;
  }
  else {
    return 0x6C616E4165726F63;
  }
}

uint64_t sub_100029034(void *a1)
{
  uint64_t v3 = sub_100003F3C(&qword_100044908);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004508(a1, a1[3]);
  sub_1000302E0();
  sub_1000387F0();
  char v10 = 0;
  sub_1000386B0();
  if (!v1)
  {
    char v9 = 1;
    sub_1000386B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

BOOL sub_1000291A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void sub_1000291B8()
{
  sub_100038790(*v0);
}

uint64_t sub_1000291E4()
{
  return sub_100028FE4(*v0);
}

uint64_t sub_1000291EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002CD60(a1, a2);
  *a3 = result;
  return result;
}

void sub_100029214(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100029220(uint64_t a1)
{
  unint64_t v2 = sub_1000302E0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10002925C(uint64_t a1)
{
  unint64_t v2 = sub_1000302E0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100029298@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10002CE7C(a1);
  if (!v2)
  {
    *a2 = result & 1;
    a2[1] = BYTE1(result) & 1;
  }
  return result;
}

uint64_t sub_1000292D0(void *a1)
{
  return sub_100029034(a1);
}

uint64_t sub_100029300(char a1)
{
  if (a1) {
    return 0x72506D6574737973;
  }
  else {
    return 0x64496C65646F6DLL;
  }
}

uint64_t sub_100029340(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v12[0] = a4;
  v12[1] = a5;
  uint64_t v7 = sub_100003F3C(&qword_1000445F8);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  char v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004508(a1, a1[3]);
  sub_10002D30C();
  sub_1000387F0();
  char v14 = 0;
  sub_1000386A0();
  if (!v5)
  {
    char v13 = 1;
    sub_1000386A0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

Swift::Int sub_1000294B4()
{
  Swift::UInt v1 = *v0;
  sub_100038780();
  sub_100038790(v1);
  return sub_1000387A0();
}

Swift::Int sub_1000294FC()
{
  Swift::UInt v1 = *v0;
  sub_100038780();
  sub_100038790(v1);
  return sub_1000387A0();
}

uint64_t sub_100029540()
{
  return sub_100029300(*v0);
}

uint64_t sub_100029548@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002D028(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100029570(uint64_t a1)
{
  unint64_t v2 = sub_10002D30C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000295AC(uint64_t a1)
{
  unint64_t v2 = sub_10002D30C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000295E8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10002D124(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_100029618(void *a1)
{
  return sub_100029340(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_100029638(char a1)
{
  uint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6E75526563726F66;
      break;
    case 2:
      uint64_t result = 0x7365526563726F66;
      break;
    case 3:
    case 8:
      return result;
    case 4:
      uint64_t result = 0x736567617473;
      break;
    case 5:
      uint64_t result = 0xD000000000000011;
      break;
    case 6:
      uint64_t v3 = 0x506465626D65;
      goto LABEL_9;
    case 7:
      uint64_t v3 = 0x5065726F6373;
LABEL_9:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x7261000000000000;
      break;
    case 9:
      uint64_t result = 0xD000000000000013;
      break;
    default:
      uint64_t result = 0x64496769666E6F63;
      break;
  }
  return result;
}

uint64_t sub_100029768(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100003F3C(&qword_100044590);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004508(a1, a1[3]);
  sub_10002A2DC();
  sub_1000387F0();
  v20[0] = 0;
  sub_1000386C0();
  if (!v2)
  {
    v20[0] = 1;
    sub_1000386B0();
    v20[0] = 2;
    sub_100038670();
    v20[0] = 3;
    sub_100038680();
    uint64_t v21 = *(void *)(v3 + 32);
    v20[159] = 4;
    sub_100003F3C(&qword_100044550);
    sub_10002D8A0(&qword_100044598, &qword_100044550, (void (*)(void))sub_10002A628);
    sub_1000386D0();
    sub_1000206DC(v3 + 40, (uint64_t)v20, &qword_100044228);
    sub_1000206DC((uint64_t)v20, (uint64_t)&v17, &qword_100044228);
    char v16 = 5;
    sub_10002A67C();
    sub_100038690();
    uint64_t v9 = (int *)type metadata accessor for ZeoliteExtensionConfig(0);
    LOBYTE(v17) = 6;
    type metadata accessor for EmbedParameters(0);
    sub_10002A6D0(&qword_1000445B0, (void (*)(uint64_t))type metadata accessor for EmbedParameters);
    sub_100038690();
    char v10 = (long long *)(v3 + v9[11]);
    long long v11 = v10[1];
    long long v17 = *v10;
    long long v18 = v11;
    long long v19 = v10[2];
    char v16 = 7;
    sub_10002A718();
    sub_100038690();
    LOWORD(v17) = *(_WORD *)(v3 + v9[12]);
    char v16 = 8;
    sub_10002A76C();
    sub_100038690();
    char v12 = (long long *)(v3 + v9[13]);
    long long v13 = v12[1];
    long long v17 = *v12;
    long long v18 = v13;
    char v16 = 9;
    sub_10002A7C0();
    sub_100038690();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100029B6C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v39 = a2;
  uint64_t v3 = sub_100003F3C(&qword_100044258);
  __chkstk_darwin(v3 - 8);
  *(void *)&long long v42 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100003F3C(&qword_100044540);
  uint64_t v43 = *(void *)(v5 - 8);
  uint64_t v44 = v5;
  __chkstk_darwin(v5);
  uint64_t v46 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ZeoliteExtensionConfig(0);
  uint64_t v8 = (int *)(v7 - 8);
  __chkstk_darwin(v7);
  char v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)char v10 = 0;
  *((_WORD *)v10 + 4) = 0;
  *((void *)v10 + 2) = 0;
  v10[24] = 1;
  *((void *)v10 + 4) = &off_100041558;
  sub_10001CFCC((uint64_t)v55);
  char v41 = v10 + 40;
  sub_1000206DC((uint64_t)v55, (uint64_t)(v10 + 40), &qword_100044228);
  uint64_t v11 = (uint64_t)&v10[v8[12]];
  uint64_t v12 = type metadata accessor for EmbedParameters(0);
  long long v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
  uint64_t v40 = v11;
  v13(v11, 1, 1, v12);
  char v14 = (uint64_t *)&v10[v8[13]];
  *char v14 = 0;
  v14[1] = 0;
  void v14[2] = 0;
  v14[3] = 1;
  v14[4] = 0;
  v14[5] = 0;
  uint64_t v15 = v8[14];
  *(_WORD *)&v10[v15] = 2;
  uint64_t v16 = v8[15];
  uint64_t v48 = (uint64_t *)v10;
  long long v17 = &v10[v16];
  *(_OWORD *)long long v17 = 0u;
  *((_OWORD *)v17 + 1) = 0u;
  uint64_t v18 = a1[3];
  id v45 = a1;
  sub_100004508(a1, v18);
  sub_10002A2DC();
  uint64_t v19 = v47;
  uint64_t v20 = v46;
  sub_1000387E0();
  if (v19)
  {
    uint64_t v24 = v48;
    sub_100003FD8((uint64_t)v45);
    uint64_t v35 = (uint64_t)v24;
  }
  else
  {
    *(void *)&long long v47 = v12;
    uint64_t v37 = v15;
    uint64_t v38 = v14;
    uint64_t v21 = v43;
    uint64_t v22 = v44;
    LOBYTE(v54[0]) = 0;
    uint64_t v23 = sub_100038640();
    char v26 = v48;
    *uint64_t v48 = v23;
    LOBYTE(v54[0]) = 1;
    *((unsigned char *)v26 + 8) = sub_100038630() & 1;
    LOBYTE(v54[0]) = 2;
    *((unsigned char *)v26 + 9) = sub_1000385F0();
    LOBYTE(v54[0]) = 3;
    v26[2] = sub_100038600();
    *((unsigned char *)v26 + 24) = v27 & 1;
    sub_100003F3C(&qword_100044550);
    v53[0] = 4;
    sub_10002D8A0(&qword_100044558, &qword_100044550, (void (*)(void))sub_10002A390);
    sub_100038650();
    v26[4] = v54[0];
    char v57 = 5;
    sub_10002A3E4();
    sub_100038610();
    sub_1000206DC((uint64_t)v54, (uint64_t)v53, &qword_100044228);
    sub_1000206DC((uint64_t)v53, (uint64_t)v41, &qword_100044228);
    LOBYTE(v49) = 6;
    sub_10002A6D0(&qword_100044570, (void (*)(uint64_t))type metadata accessor for EmbedParameters);
    uint64_t v28 = v42;
    sub_100038610();
    sub_10002A438(v28, v40);
    char v56 = 7;
    sub_10002A4A0();
    sub_100038610();
    long long v47 = v49;
    long long v42 = v50;
    uint64_t v29 = v51;
    char v41 = (char *)v52;
    uint64_t v30 = v38;
    sub_10002A4F4(*v38, v38[1], v38[2], v38[3]);
    long long v31 = v42;
    *(_OWORD *)uint64_t v30 = v47;
    *((_OWORD *)v30 + 1) = v31;
    uint64_t v32 = (uint64_t)v41;
    v30[4] = v29;
    v30[5] = v32;
    char v56 = 8;
    sub_10002A53C();
    sub_100038610();
    *(_WORD *)((char *)v26 + v37) = v49;
    char v56 = 9;
    sub_10002A590();
    sub_100038610();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v20, v22);
    long long v47 = v49;
    long long v33 = v50;
    sub_10002A5E4(*(void *)v17, *((void *)v17 + 1));
    *(_OWORD *)long long v17 = v47;
    *((_OWORD *)v17 + 1) = v33;
    char v34 = v48;
    sub_10002D9B4((uint64_t)v48, v39, type metadata accessor for ZeoliteExtensionConfig);
    sub_100003FD8((uint64_t)v45);
    uint64_t v35 = (uint64_t)v34;
  }
  return sub_10002A330(v35, type metadata accessor for ZeoliteExtensionConfig);
}

BOOL sub_10002A1E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10002A1F8()
{
  return sub_100029638(*v0);
}

uint64_t sub_10002A200@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002FEA0(a1, a2);
  *a3 = result;
  return result;
}

void sub_10002A228(unsigned char *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_10002A234(uint64_t a1)
{
  unint64_t v2 = sub_10002A2DC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10002A270(uint64_t a1)
{
  unint64_t v2 = sub_10002A2DC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10002A2AC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100029B6C(a1, a2);
}

uint64_t sub_10002A2C4(void *a1)
{
  return sub_100029768(a1);
}

unint64_t sub_10002A2DC()
{
  unint64_t result = qword_100044548;
  if (!qword_100044548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044548);
  }
  return result;
}

uint64_t sub_10002A330(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10002A390()
{
  unint64_t result = qword_100044560;
  if (!qword_100044560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044560);
  }
  return result;
}

unint64_t sub_10002A3E4()
{
  unint64_t result = qword_100044568;
  if (!qword_100044568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044568);
  }
  return result;
}

uint64_t sub_10002A438(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003F3C(&qword_100044258);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_10002A4A0()
{
  unint64_t result = qword_100044578;
  if (!qword_100044578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044578);
  }
  return result;
}

uint64_t sub_10002A4F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 != 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_10002A53C()
{
  unint64_t result = qword_100044580;
  if (!qword_100044580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044580);
  }
  return result;
}

unint64_t sub_10002A590()
{
  unint64_t result = qword_100044588;
  if (!qword_100044588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044588);
  }
  return result;
}

uint64_t sub_10002A5E4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_10002A628()
{
  unint64_t result = qword_1000445A0;
  if (!qword_1000445A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000445A0);
  }
  return result;
}

unint64_t sub_10002A67C()
{
  unint64_t result = qword_1000445A8;
  if (!qword_1000445A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000445A8);
  }
  return result;
}

uint64_t sub_10002A6D0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10002A718()
{
  unint64_t result = qword_1000445B8;
  if (!qword_1000445B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000445B8);
  }
  return result;
}

unint64_t sub_10002A76C()
{
  unint64_t result = qword_1000445C0;
  if (!qword_1000445C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000445C0);
  }
  return result;
}

unint64_t sub_10002A7C0()
{
  unint64_t result = qword_1000445C8;
  if (!qword_1000445C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000445C8);
  }
  return result;
}

uint64_t type metadata accessor for ExecutionState(uint64_t a1)
{
  return sub_10002A834(a1, (uint64_t *)&unk_100044798);
}

uint64_t sub_10002A834(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10002A86C(char a1)
{
  return *(void *)&aLastcomplastqu[8 * a1];
}

uint64_t sub_10002A88C(void *a1)
{
  uint64_t v3 = sub_100003F3C(&qword_100044910);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004508(a1, a1[3]);
  sub_100030334();
  sub_1000387F0();
  char v11 = 0;
  sub_100037C20();
  sub_10002A6D0(&qword_100044920, (void (*)(uint64_t))&type metadata accessor for Date);
  sub_1000386D0();
  if (!v1)
  {
    type metadata accessor for ExecutionState(0);
    char v10 = 1;
    sub_100038690();
    char v9 = 2;
    sub_100038690();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_10002AA88@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v4 = sub_100003F3C(&qword_1000440F0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v23 = (uint64_t)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v24 = (char *)&v19 - v7;
  uint64_t v8 = sub_100037C20();
  uint64_t v26 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  char v27 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_100003F3C(&qword_100044940);
  uint64_t v25 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  char v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for ExecutionState(0);
  __chkstk_darwin(v12);
  char v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004508(a1, a1[3]);
  sub_100030334();
  sub_1000387E0();
  if (v2) {
    return sub_100003FD8((uint64_t)a1);
  }
  uint64_t v20 = v12;
  uint64_t v21 = v14;
  uint64_t v15 = v26;
  char v31 = 0;
  sub_10002A6D0(&qword_100044948, (void (*)(uint64_t))&type metadata accessor for Date);
  sub_100038650();
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v21, v27, v8);
  char v30 = 1;
  uint64_t v16 = (uint64_t)v24;
  sub_100038610();
  sub_1000206DC(v16, (uint64_t)&v21[*(int *)(v20 + 20)], &qword_1000440F0);
  char v29 = 2;
  sub_100038610();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v28);
  uint64_t v17 = (uint64_t)v21;
  sub_1000206DC(v23, (uint64_t)&v21[*(int *)(v20 + 24)], &qword_1000440F0);
  sub_10002D9B4(v17, v22, type metadata accessor for ExecutionState);
  sub_100003FD8((uint64_t)a1);
  return sub_10002A330(v17, type metadata accessor for ExecutionState);
}

uint64_t sub_10002AF28()
{
  return sub_10002A86C(*v0);
}

uint64_t sub_10002AF30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000309BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10002AF58(uint64_t a1)
{
  unint64_t v2 = sub_100030334();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10002AF94(uint64_t a1)
{
  unint64_t v2 = sub_100030334();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10002AFD0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10002AA88(a1, a2);
}

uint64_t sub_10002AFE8(void *a1)
{
  return sub_10002A88C(a1);
}

uint64_t sub_10002B000(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ExecutionState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002B064(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000411F8;
  v6._object = a2;
  unint64_t v4 = sub_1000385D0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 7) {
    return 7;
  }
  else {
    return v4;
  }
}

uint64_t sub_10002B0B0(uint64_t a1, unint64_t a2)
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

uint64_t sub_10002B108(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000413F8;
  v6._object = a2;
  unint64_t v4 = sub_1000385D0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

uint64_t sub_10002B154(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7954656372756F73 && a2 == 0xEA00000000006570;
  if (v3 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C69616D65 && a2 == 0xE500000000000000 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x726170736E617274 && a2 == 0xEC00000079636E65)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_100038700();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_10002B2AC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = sub_100003F3C(&qword_100044630);
  uint64_t v5 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004508(a1, a1[3]);
  sub_10002D45C();
  sub_1000387E0();
  uint64_t v40 = a1;
  if (v2)
  {
    uint64_t v39 = v2;
    int v78 = 0;
    uint64_t v43 = 0;
    uint64_t v41 = 2;
    long long v42 = 0uLL;
    sub_100003FD8((uint64_t)v40);
    LOBYTE(v62) = 2;
    uint64_t v63 = 0;
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    uint64_t v66 = 0;
    uint64_t v67 = 0;
    uint64_t v68 = 0;
    *(void *)uint64_t v69 = v41;
    *(_OWORD *)&v69[8] = v42;
    uint64_t v70 = v43;
    char v71 = v78;
    uint64_t v72 = 0;
    uint64_t v73 = 0;
    uint64_t v74 = 1;
    long long v75 = 0u;
    long long v76 = 0u;
    return sub_100020740((uint64_t)&v62, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_10001DF94, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10001DFC4);
  }
  else
  {
    uint64_t v8 = v5;
    LOBYTE(v44) = 0;
    sub_10002D4B0();
    uint64_t v9 = v38;
    sub_100038610();
    int v77 = v62;
    LOBYTE(v44) = 1;
    sub_10002D504();
    sub_100038610();
    uint64_t v11 = v66;
    char v54 = 2;
    int v78 = v70;
    uint64_t v43 = *(void *)&v69[16];
    uint64_t v36 = v63;
    uint64_t v37 = v62;
    uint64_t v34 = v67;
    uint64_t v35 = v64;
    uint64_t v33 = v65;
    uint64_t v41 = v68;
    long long v42 = *(_OWORD *)v69;
    sub_10001DE04(v62, v63, v64, v65, v66, v67, v68);
    sub_10002D558();
    sub_100038610();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v7, v9);
    uint64_t v12 = v56;
    uint64_t v38 = v55;
    uint64_t v39 = v57;
    uint64_t v13 = v59;
    uint64_t v31 = v58;
    uint64_t v32 = v61;
    uint64_t v14 = v58;
    uint64_t v15 = v60;
    sub_10001DE34(v55, v56, v57);
    sub_10001DFC4(0, 0, 1);
    LOBYTE(v44) = v77;
    *((void *)&v44 + 1) = v37;
    *(void *)&long long v45 = v36;
    *((void *)&v45 + 1) = v35;
    *(void *)&long long v46 = v33;
    *((void *)&v46 + 1) = v11;
    *(void *)&long long v47 = v34;
    uint64_t v30 = v11;
    *((void *)&v47 + 1) = v41;
    long long v48 = v42;
    *(void *)&long long v49 = v43;
    BYTE8(v49) = v78;
    uint64_t v16 = v38;
    *(void *)&long long v50 = v38;
    *((void *)&v50 + 1) = v12;
    uint64_t v28 = v13;
    uint64_t v29 = v12;
    *(void *)&long long v51 = v39;
    *((void *)&v51 + 1) = v14;
    *(void *)&long long v52 = v13;
    *((void *)&v52 + 1) = v15;
    uint64_t v53 = v32;
    sub_100020740((uint64_t)&v44, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_10001DE04, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10001DE34);
    uint64_t v27 = v15;
    sub_10001DFC4(v16, v12, v39);
    uint64_t v17 = v34;
    uint64_t v18 = v33;
    uint64_t v19 = v30;
    uint64_t v20 = v41;
    unint64_t v21 = v42;
    sub_10001DF94(v37, v36, v35, v33, v30, v34, v41);
    sub_100003FD8((uint64_t)a1);
    LOBYTE(v62) = v77;
    uint64_t v63 = v37;
    uint64_t v64 = v36;
    uint64_t v65 = v35;
    uint64_t v66 = v18;
    uint64_t v67 = v19;
    uint64_t v68 = v17;
    *(void *)uint64_t v69 = v20;
    *(_OWORD *)&v69[8] = __PAIR128__(*((unint64_t *)&v42 + 1), v21);
    uint64_t v70 = v43;
    char v71 = v78;
    uint64_t v72 = v38;
    uint64_t v73 = v29;
    uint64_t v74 = v39;
    *(void *)&long long v75 = v31;
    *((void *)&v75 + 1) = v28;
    *(void *)&long long v76 = v27;
    *((void *)&v76 + 1) = v32;
    uint64_t result = sub_100020740((uint64_t)&v62, (void (*)(void, void, void, void, void, void, void, void, void, void, char))sub_10001DF94, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10001DFC4);
    long long v22 = v51;
    *(_OWORD *)(a2 + 96) = v50;
    *(_OWORD *)(a2 + 112) = v22;
    *(_OWORD *)(a2 + 128) = v52;
    *(void *)(a2 + 144) = v53;
    long long v23 = v47;
    *(_OWORD *)(a2 + 32) = v46;
    *(_OWORD *)(a2 + 48) = v23;
    long long v24 = v49;
    *(_OWORD *)(a2 + 64) = v48;
    *(_OWORD *)(a2 + 80) = v24;
    long long v25 = v45;
    *(_OWORD *)a2 = v44;
    *(_OWORD *)(a2 + 16) = v25;
  }
  return result;
}

uint64_t sub_10002B8C0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x737961446B656577 && a2 == 0xE800000000000000;
  if (v3 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x756F487472617473 && a2 == 0xE900000000000072 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x72756F48646E65 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_100038700();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_10002BA10@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100003F3C(&qword_1000446D0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004508(a1, a1[3]);
  sub_10002D7F8();
  sub_1000387E0();
  if (v2)
  {
    sub_100003FD8((uint64_t)a1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_100003F3C(&qword_1000446E0);
    char v21 = 0;
    sub_10002D8A0(&qword_1000446E8, &qword_1000446E0, (void (*)(void))sub_10002D84C);
    sub_100038610();
    uint64_t v9 = v22;
    char v20 = 1;
    uint64_t v10 = sub_100038600();
    int v18 = v11;
    char v19 = 2;
    uint64_t v12 = sub_100038600();
    uint64_t v13 = v8;
    char v15 = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v13, v5);
    uint64_t result = sub_100003FD8((uint64_t)a1);
    *(void *)a2 = v9;
    *(void *)(a2 + 8) = v10;
    *(unsigned char *)(a2 + 16) = v18 & 1;
    *(void *)(a2 + 24) = v12;
    *(unsigned char *)(a2 + 32) = v15 & 1;
  }
  return result;
}

uint64_t sub_10002BC8C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x737961447473616CLL && a2 == 0xE800000000000000;
  if (v3 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x617373654D78616DLL && a2 == 0xEB00000000736567 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74676E654C78616DLL && a2 == 0xE900000000000068 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x654D7265746C6966 && a2 == 0xEE00736567617373 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x654D656C676E6973 && a2 == 0xEE00736567617373 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x5470756E61656C63 && a2 == 0xEB00000000747865 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x676E696C706D6173 && a2 == 0xEC000000657A6953 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x72437265746C6966 && a2 == 0xEE00616972657469)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v6 = sub_100038700();
    swift_bridgeObjectRelease();
    if (v6) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

uint64_t sub_10002C018@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100003F3C(&qword_1000446A0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004508(a1, a1[3]);
  sub_10002D6FC();
  sub_1000387E0();
  if (v2)
  {
    sub_100003FD8((uint64_t)a1);
    return sub_10001DFB4(1);
  }
  else
  {
    LOBYTE(v26) = 0;
    uint64_t v9 = sub_100038640();
    LOBYTE(v26) = 1;
    uint64_t v10 = sub_100038640();
    LOBYTE(v26) = 2;
    uint64_t v25 = sub_100038640();
    LOBYTE(v26) = 3;
    int v31 = sub_1000385F0();
    LOBYTE(v26) = 4;
    int v24 = sub_1000385F0();
    LOBYTE(v26) = 5;
    int v23 = sub_1000385F0();
    LOBYTE(v26) = 6;
    uint64_t v11 = sub_100038600();
    int v21 = v12;
    uint64_t v22 = v11;
    char v32 = 7;
    sub_10002D750();
    sub_100038610();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v13 = v26;
    uint64_t v14 = v27;
    uint64_t v15 = v28;
    uint64_t v16 = v29;
    int v20 = v30;
    sub_10001DE24(v26);
    sub_10001DFB4(1);
    sub_100003FD8((uint64_t)a1);
    char v17 = v20;
    uint64_t result = sub_10001DFB4(v13);
    *(void *)a2 = v9;
    *(void *)(a2 + 8) = v10;
    *(void *)(a2 + 16) = v25;
    *(unsigned char *)(a2 + 24) = v31;
    *(unsigned char *)(a2 + 25) = v24;
    *(unsigned char *)(a2 + 26) = v23;
    *(void *)(a2 + 32) = v22;
    *(unsigned char *)(a2 + 40) = v21 & 1;
    *(void *)(a2 + 48) = v13;
    *(void *)(a2 + 56) = v14;
    *(void *)(a2 + 64) = v15;
    *(void *)(a2 + 72) = v16;
    *(unsigned char *)(a2 + 80) = v17;
  }
  return result;
}

uint64_t sub_10002C378(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x746E65764578616DLL && a2 == 0xE900000000000073;
  if (v3 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65736143657375 && a2 == 0xE700000000000000 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C65646F6DLL && a2 == 0xE500000000000000 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7265566C65646F6DLL && a2 == 0xEC0000006E6F6973)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_100038700();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_10002C52C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100003F3C(&qword_100044688);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004508(a1, a1[3]);
  sub_10002D6A8();
  sub_1000387E0();
  if (v2)
  {
    sub_100003FD8((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    char v31 = 0;
    uint64_t v9 = sub_100038640();
    char v30 = 1;
    uint64_t v10 = sub_1000385E0();
    uint64_t v12 = v11;
    uint64_t v26 = v10;
    uint64_t v27 = v9;
    char v29 = 2;
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_1000385E0();
    uint64_t v15 = v14;
    uint64_t v25 = v13;
    char v28 = 3;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_1000385E0();
    uint64_t v18 = v17;
    uint64_t v19 = *(void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v24 = v16;
    v19(v8, v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_100003FD8((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v21 = v26;
    *a2 = v27;
    a2[1] = v21;
    uint64_t v22 = v25;
    a2[2] = v12;
    a2[3] = v22;
    uint64_t v23 = v24;
    a2[4] = v15;
    a2[5] = v23;
    a2[6] = v18;
  }
  return result;
}

uint64_t sub_10002C7F8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x745374757074756FLL && a2 == 0xEE00796765746172;
  if (v3 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7265646465626D65 && a2 == 0xE800000000000000 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_100038700();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_10002C958(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7274537475706E69 && a2 == 0xED00007967657461;
  if (v3 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 107 && a2 == 0xE100000000000000 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000100039470 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6562614C61746164 && a2 == 0xE90000000000006CLL)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_100038700();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_10002CB08@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100003F3C(&qword_100044600);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004508(a1, a1[3]);
  sub_10002D360();
  sub_1000387E0();
  if (v2)
  {
    sub_100003FD8((uint64_t)a1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    char v25 = 0;
    sub_10002D3B4();
    sub_100038610();
    int v9 = v26;
    char v24 = 1;
    uint64_t v10 = sub_100038640();
    int v21 = v9;
    char v23 = 2;
    uint64_t v11 = sub_1000385E0();
    uint64_t v13 = v12;
    uint64_t v20 = v11;
    char v22 = 3;
    uint64_t v14 = sub_1000385E0();
    uint64_t v15 = v8;
    uint64_t v17 = v16;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v15, v5);
    uint64_t result = sub_100003FD8((uint64_t)a1);
    *(unsigned char *)a2 = v21;
    uint64_t v19 = v20;
    *(void *)(a2 + 8) = v10;
    *(void *)(a2 + 16) = v19;
    *(void *)(a2 + 24) = v13;
    *(void *)(a2 + 32) = v14;
    *(void *)(a2 + 40) = v17;
  }
  return result;
}

uint64_t sub_10002CD60(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6C616E4165726F63 && a2 == 0xED00007363697479;
  if (v3 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x637265506E61656DLL && a2 == 0xEF73656C69746E65)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_100038700();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_10002CE7C(void *a1)
{
  uint64_t v3 = sub_100003F3C(&qword_1000448F8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100004508(a1, a1[3]);
  sub_1000302E0();
  sub_1000387E0();
  if (v1) {
    return sub_100003FD8((uint64_t)a1);
  }
  v11[15] = 0;
  char v7 = sub_100038630();
  v11[14] = 1;
  char v8 = sub_100038630();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  sub_100003FD8((uint64_t)a1);
  if (v8) {
    int v10 = 256;
  }
  else {
    int v10 = 0;
  }
  return v10 & 0xFFFFFFFE | v7 & 1;
}

uint64_t sub_10002D028(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x64496C65646F6DLL && a2 == 0xE700000000000000;
  if (v3 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x72506D6574737973 && a2 == 0xEC00000074706D6FLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_100038700();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_10002D124(void *a1)
{
  uint64_t v3 = sub_100003F3C(&qword_1000445E8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[4];
  sub_100004508(a1, a1[3]);
  sub_10002D30C();
  sub_1000387E0();
  if (v1)
  {
    sub_100003FD8((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v11 = 0;
    uint64_t v7 = sub_100038620();
    char v10 = 1;
    sub_100038620();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_100003FD8((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_10002D30C()
{
  unint64_t result = qword_1000445F0;
  if (!qword_1000445F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000445F0);
  }
  return result;
}

unint64_t sub_10002D360()
{
  unint64_t result = qword_100044608;
  if (!qword_100044608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044608);
  }
  return result;
}

unint64_t sub_10002D3B4()
{
  unint64_t result = qword_100044610;
  if (!qword_100044610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044610);
  }
  return result;
}

unint64_t sub_10002D408()
{
  unint64_t result = qword_100044628;
  if (!qword_100044628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044628);
  }
  return result;
}

unint64_t sub_10002D45C()
{
  unint64_t result = qword_100044638;
  if (!qword_100044638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044638);
  }
  return result;
}

unint64_t sub_10002D4B0()
{
  unint64_t result = qword_100044640;
  if (!qword_100044640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044640);
  }
  return result;
}

unint64_t sub_10002D504()
{
  unint64_t result = qword_100044648;
  if (!qword_100044648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044648);
  }
  return result;
}

unint64_t sub_10002D558()
{
  unint64_t result = qword_100044650;
  if (!qword_100044650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044650);
  }
  return result;
}

unint64_t sub_10002D5AC()
{
  unint64_t result = qword_100044660;
  if (!qword_100044660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044660);
  }
  return result;
}

unint64_t sub_10002D600()
{
  unint64_t result = qword_100044670;
  if (!qword_100044670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044670);
  }
  return result;
}

unint64_t sub_10002D654()
{
  unint64_t result = qword_100044680;
  if (!qword_100044680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044680);
  }
  return result;
}

unint64_t sub_10002D6A8()
{
  unint64_t result = qword_100044690;
  if (!qword_100044690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044690);
  }
  return result;
}

unint64_t sub_10002D6FC()
{
  unint64_t result = qword_1000446A8;
  if (!qword_1000446A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000446A8);
  }
  return result;
}

unint64_t sub_10002D750()
{
  unint64_t result = qword_1000446B0;
  if (!qword_1000446B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000446B0);
  }
  return result;
}

unint64_t sub_10002D7A4()
{
  unint64_t result = qword_1000446C8;
  if (!qword_1000446C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000446C8);
  }
  return result;
}

unint64_t sub_10002D7F8()
{
  unint64_t result = qword_1000446D8;
  if (!qword_1000446D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000446D8);
  }
  return result;
}

unint64_t sub_10002D84C()
{
  unint64_t result = qword_1000446F0;
  if (!qword_1000446F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000446F0);
  }
  return result;
}

uint64_t sub_10002D8A0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001C50C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10002D90C()
{
  unint64_t result = qword_100044710;
  if (!qword_100044710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044710);
  }
  return result;
}

unint64_t sub_10002D960()
{
  unint64_t result = qword_100044720;
  if (!qword_100044720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044720);
  }
  return result;
}

uint64_t sub_10002D9B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

ValueMetadata *type metadata accessor for EmbedParameters.CodingKeys()
{
  return &type metadata for EmbedParameters.CodingKeys;
}

ValueMetadata *type metadata accessor for FilterCriteria.CodingKeys()
{
  return &type metadata for FilterCriteria.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ExtractEmailParameters.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ExtractEmailParameters.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x10002DBA0);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtractEmailParameters.CodingKeys()
{
  return &type metadata for ExtractEmailParameters.CodingKeys;
}

ValueMetadata *type metadata accessor for ExtractTransparencyParameters.CodingKeys()
{
  return &type metadata for ExtractTransparencyParameters.CodingKeys;
}

ValueMetadata *type metadata accessor for ExtractParameters.CodingKeys()
{
  return &type metadata for ExtractParameters.CodingKeys;
}

uint64_t _s16ZeoliteExtension29ExtractTransparencyParametersV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s16ZeoliteExtension29ExtractTransparencyParametersV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x10002DD5CLL);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ScoreParameters.CodingKeys()
{
  return &type metadata for ScoreParameters.CodingKeys;
}

ValueMetadata *type metadata accessor for InferenceParameters.CodingKeys()
{
  return &type metadata for InferenceParameters.CodingKeys;
}

uint64_t *sub_10002DDAC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100037C20();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    uint64_t v10 = *(int *)(a3 + 20);
    char v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    if (v20((char *)a2 + v10, 1, v7))
    {
      uint64_t v13 = sub_100003F3C(&qword_1000440F0);
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      v9((uint64_t *)v11, (uint64_t *)v12, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v11, 0, 1, v7);
    }
    uint64_t v15 = *(int *)(a3 + 24);
    uint64_t v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    if (v20(v17, 1, v7))
    {
      uint64_t v18 = sub_100003F3C(&qword_1000440F0);
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      v9((uint64_t *)v16, (uint64_t *)v17, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v16, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_10002DFF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100037C20();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v10(a1, v4);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v7(v6, 1, v4)) {
    v10(v6, v4);
  }
  uint64_t v8 = a1 + *(int *)(a2 + 24);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(v8, 1, v4);
  if (!result)
  {
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v8, v4);
  }
  return result;
}

char *sub_10002E138(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100037C20();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  uint64_t v19 = a3;
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  char v11 = &a2[v9];
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  if (v12(&a2[v9], 1, v6))
  {
    uint64_t v13 = sub_100003F3C(&qword_1000440F0);
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  uint64_t v14 = *(int *)(v19 + 24);
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  if (v12(v16, 1, v6))
  {
    uint64_t v17 = sub_100003F3C(&qword_1000440F0);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    v8(v15, v16, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v15, 0, 1, v6);
  }
  return a1;
}

char *sub_10002E330(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100037C20();
  uint64_t v7 = *(void *)(v6 - 8);
  char v22 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v22(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  char v11 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  int v12 = v11(&a1[v8], 1, v6);
  int v13 = v11(v10, 1, v6);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v10, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
LABEL_6:
    uint64_t v14 = sub_100003F3C(&qword_1000440F0);
    memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  v22(v9, v10, v6);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  int v18 = v11(&a1[v15], 1, v6);
  int v19 = v11(v17, 1, v6);
  if (!v18)
  {
    if (!v19)
    {
      v22(v16, v17, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v16, v6);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v20 = sub_100003F3C(&qword_1000440F0);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v16, v17, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v16, 0, 1, v6);
  return a1;
}

char *sub_10002E5EC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100037C20();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  uint64_t v19 = a3;
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  char v11 = &a2[v9];
  int v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  if (v12(&a2[v9], 1, v6))
  {
    uint64_t v13 = sub_100003F3C(&qword_1000440F0);
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  uint64_t v14 = *(int *)(v19 + 24);
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  if (v12(v16, 1, v6))
  {
    uint64_t v17 = sub_100003F3C(&qword_1000440F0);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    v8(v15, v16, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v15, 0, 1, v6);
  }
  return a1;
}

char *sub_10002E7E4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100037C20();
  uint64_t v7 = *(void *)(v6 - 8);
  char v22 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v22(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  char v11 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  int v12 = v11(&a1[v8], 1, v6);
  int v13 = v11(v10, 1, v6);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v10, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
LABEL_6:
    uint64_t v14 = sub_100003F3C(&qword_1000440F0);
    memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  v22(v9, v10, v6);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  int v18 = v11(&a1[v15], 1, v6);
  int v19 = v11(v17, 1, v6);
  if (!v18)
  {
    if (!v19)
    {
      v22(v16, v17, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v16, v6);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v20 = sub_100003F3C(&qword_1000440F0);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v16, v17, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v16, 0, 1, v6);
  return a1;
}

uint64_t sub_10002EAA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002EAB4);
}

uint64_t sub_10002EAB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100037C20();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_100003F3C(&qword_1000440F0);
    char v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_10002EBB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002EBC4);
}

uint64_t sub_10002EBC4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100037C20();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_100003F3C(&qword_1000440F0);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_10002ECCC()
{
  sub_100037C20();
  if (v0 <= 0x3F)
  {
    sub_10002EDB0(319, (unint64_t *)&qword_1000447A8, (void (*)(uint64_t))&type metadata accessor for Date);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10002EDB0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1000384A0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for ZeoliteExtensionConfig.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ZeoliteExtensionConfig.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *uint64_t result = a2 + 9;
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
        JUMPOUT(0x10002EF60);
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
          *uint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ZeoliteExtensionConfig.CodingKeys()
{
  return &type metadata for ZeoliteExtensionConfig.CodingKeys;
}

_WORD *initializeBufferWithCopyOfBuffer for AnalysisParameters(_WORD *result, _WORD *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AnalysisParameters(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 65281 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65281 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65281;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
LABEL_17:
  unsigned int v6 = *(unsigned __int8 *)a1;
  BOOL v7 = v6 >= 2;
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AnalysisParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)uint64_t result = a2 - 255;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10002F114);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalysisParameters()
{
  return &type metadata for AnalysisParameters;
}

unsigned char *storeEnumTagSinglePayload for ZeoliteStage(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10002F218);
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

ValueMetadata *type metadata accessor for ZeoliteStage()
{
  return &type metadata for ZeoliteStage;
}

ValueMetadata *type metadata accessor for SourceType()
{
  return &type metadata for SourceType;
}

uint64_t getEnumTagSinglePayload for WeekDay(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for WeekDay(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x10002F3BCLL);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WeekDay()
{
  return &type metadata for WeekDay;
}

unsigned char *sub_10002F3F4(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for IOStrategy()
{
  return &type metadata for IOStrategy;
}

uint64_t sub_10002F410()
{
  return sub_10002F5B8(&qword_1000447E0, &qword_1000447E8);
}

unint64_t sub_10002F43C()
{
  unint64_t result = qword_1000447F0;
  if (!qword_1000447F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000447F0);
  }
  return result;
}

uint64_t sub_10002F490()
{
  return sub_10002F5B8(&qword_1000447F8, &qword_1000446E0);
}

unint64_t sub_10002F4BC()
{
  unint64_t result = qword_100044800;
  if (!qword_100044800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044800);
  }
  return result;
}

uint64_t sub_10002F510()
{
  return sub_10002F5B8(&qword_100044808, &qword_100044810);
}

unint64_t sub_10002F53C()
{
  unint64_t result = qword_100044818;
  if (!qword_100044818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044818);
  }
  return result;
}

uint64_t sub_10002F590()
{
  return sub_10002F5B8(&qword_100044820, &qword_100044550);
}

uint64_t sub_10002F5B8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001C50C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10002F60C()
{
  unint64_t result = qword_100044828;
  if (!qword_100044828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044828);
  }
  return result;
}

unint64_t sub_10002F664()
{
  unint64_t result = qword_100044830;
  if (!qword_100044830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044830);
  }
  return result;
}

unint64_t sub_10002F6BC()
{
  unint64_t result = qword_100044838;
  if (!qword_100044838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044838);
  }
  return result;
}

unint64_t sub_10002F714()
{
  unint64_t result = qword_100044840;
  if (!qword_100044840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044840);
  }
  return result;
}

unint64_t sub_10002F76C()
{
  unint64_t result = qword_100044848;
  if (!qword_100044848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044848);
  }
  return result;
}

unint64_t sub_10002F7C4()
{
  unint64_t result = qword_100044850;
  if (!qword_100044850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044850);
  }
  return result;
}

unint64_t sub_10002F81C()
{
  unint64_t result = qword_100044858;
  if (!qword_100044858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044858);
  }
  return result;
}

unint64_t sub_10002F874()
{
  unint64_t result = qword_100044860;
  if (!qword_100044860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044860);
  }
  return result;
}

unint64_t sub_10002F8CC()
{
  unint64_t result = qword_100044868;
  if (!qword_100044868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044868);
  }
  return result;
}

unint64_t sub_10002F924()
{
  unint64_t result = qword_100044870;
  if (!qword_100044870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044870);
  }
  return result;
}

unint64_t sub_10002F97C()
{
  unint64_t result = qword_100044878;
  if (!qword_100044878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044878);
  }
  return result;
}

unint64_t sub_10002F9D4()
{
  unint64_t result = qword_100044880;
  if (!qword_100044880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044880);
  }
  return result;
}

unint64_t sub_10002FA2C()
{
  unint64_t result = qword_100044888;
  if (!qword_100044888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044888);
  }
  return result;
}

unint64_t sub_10002FA84()
{
  unint64_t result = qword_100044890;
  if (!qword_100044890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044890);
  }
  return result;
}

unint64_t sub_10002FADC()
{
  unint64_t result = qword_100044898;
  if (!qword_100044898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044898);
  }
  return result;
}

unint64_t sub_10002FB34()
{
  unint64_t result = qword_1000448A0;
  if (!qword_1000448A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000448A0);
  }
  return result;
}

unint64_t sub_10002FB8C()
{
  unint64_t result = qword_1000448A8;
  if (!qword_1000448A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000448A8);
  }
  return result;
}

unint64_t sub_10002FBE4()
{
  unint64_t result = qword_1000448B0;
  if (!qword_1000448B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000448B0);
  }
  return result;
}

unint64_t sub_10002FC3C()
{
  unint64_t result = qword_1000448B8;
  if (!qword_1000448B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000448B8);
  }
  return result;
}

unint64_t sub_10002FC94()
{
  unint64_t result = qword_1000448C0;
  if (!qword_1000448C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000448C0);
  }
  return result;
}

unint64_t sub_10002FCEC()
{
  unint64_t result = qword_1000448C8;
  if (!qword_1000448C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000448C8);
  }
  return result;
}

unint64_t sub_10002FD44()
{
  unint64_t result = qword_1000448D0;
  if (!qword_1000448D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000448D0);
  }
  return result;
}

unint64_t sub_10002FD9C()
{
  unint64_t result = qword_1000448D8;
  if (!qword_1000448D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000448D8);
  }
  return result;
}

unint64_t sub_10002FDF4()
{
  unint64_t result = qword_1000448E0;
  if (!qword_1000448E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000448E0);
  }
  return result;
}

unint64_t sub_10002FE4C()
{
  unint64_t result = qword_1000448E8;
  if (!qword_1000448E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000448E8);
  }
  return result;
}

uint64_t sub_10002FEA0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x64496769666E6F63 && a2 == 0xE800000000000000;
  if (v3 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E75526563726F66 && a2 == 0xE800000000000000 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7365526563726F66 && a2 == 0xEA00000000007465 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001000393F0 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x736567617473 && a2 == 0xE600000000000000 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000100039410 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x7261506465626D65 && a2 == 0xEF73726574656D61 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x72615065726F6373 && a2 == 0xEF73726574656D61 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000100039430 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000100039450)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    char v6 = sub_100038700();
    swift_bridgeObjectRelease();
    if (v6) {
      return 9;
    }
    else {
      return 10;
    }
  }
}

unint64_t sub_10003028C()
{
  unint64_t result = qword_1000448F0;
  if (!qword_1000448F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000448F0);
  }
  return result;
}

unint64_t sub_1000302E0()
{
  unint64_t result = qword_100044900;
  if (!qword_100044900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044900);
  }
  return result;
}

unint64_t sub_100030334()
{
  unint64_t result = qword_100044918;
  if (!qword_100044918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044918);
  }
  return result;
}

unint64_t sub_100030388()
{
  unint64_t result = qword_100044928;
  if (!qword_100044928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044928);
  }
  return result;
}

unint64_t sub_1000303DC()
{
  unint64_t result = qword_100044930;
  if (!qword_100044930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044930);
  }
  return result;
}

unint64_t sub_100030430()
{
  unint64_t result = qword_100044938;
  if (!qword_100044938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044938);
  }
  return result;
}

uint64_t _s16ZeoliteExtension15EmbedParametersV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s16ZeoliteExtension15EmbedParametersV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000305E0);
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

ValueMetadata *type metadata accessor for ExecutionState.CodingKeys()
{
  return &type metadata for ExecutionState.CodingKeys;
}

uint64_t _s16ZeoliteExtension10SourceTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s16ZeoliteExtension10SourceTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x100030774);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalysisParameters.CodingKeys()
{
  return &type metadata for AnalysisParameters.CodingKeys;
}

unint64_t sub_1000307B0()
{
  unint64_t result = qword_100044950;
  if (!qword_100044950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044950);
  }
  return result;
}

unint64_t sub_100030808()
{
  unint64_t result = qword_100044958;
  if (!qword_100044958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044958);
  }
  return result;
}

unint64_t sub_100030860()
{
  unint64_t result = qword_100044960;
  if (!qword_100044960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044960);
  }
  return result;
}

unint64_t sub_1000308B8()
{
  unint64_t result = qword_100044968;
  if (!qword_100044968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044968);
  }
  return result;
}

unint64_t sub_100030910()
{
  unint64_t result = qword_100044970;
  if (!qword_100044970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044970);
  }
  return result;
}

unint64_t sub_100030968()
{
  unint64_t result = qword_100044978;
  if (!qword_100044978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100044978);
  }
  return result;
}

uint64_t sub_1000309BC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x706D6F437473616CLL && a2 == 0xEE006E6F6974656CLL;
  if (v3 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726575517473616CLL && a2 == 0xEB00000000646569 || (sub_100038700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6D6574497473616CLL && a2 == 0xEC00000065746144)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_100038700();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

id sub_100030B50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v9 = sub_100037C20();
  uint64_t v10 = *(void *)(v9 - 8);
  char v11 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  Class isa = 0;
  if (v11(a1, 1, v9) != 1)
  {
    Class isa = sub_100037BF0().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  }
  if (v11(a2, 1, v9) == 1)
  {
    Class v13 = 0;
  }
  else
  {
    Class v13 = sub_100037BF0().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a2, v9);
  }
  id v14 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithStartDate:isa endDate:v13 maxEvents:a3 lastN:a4 reversed:a5 & 1];

  return v14;
}

uint64_t sub_100030CD0(char a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = 0;
  uint64_t v6 = qword_10003CB78[a1];
  while (1)
  {
    if (qword_10003CB78[*(char *)(a2 + v5 + 32)] == v6)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      return 1;
    }
    char v7 = sub_100038700();
    swift_bridgeObjectRelease_n();
    if (v7) {
      break;
    }
    if (v2 == ++v5)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_100030DA4(uint64_t a1)
{
  v2[21] = a1;
  v2[22] = v1;
  uint64_t v3 = sub_100037E30();
  v2[23] = v3;
  v2[24] = *(void *)(v3 - 8);
  v2[25] = swift_task_alloc();
  uint64_t v4 = sub_100037F50();
  v2[26] = v4;
  v2[27] = *(void *)(v4 - 8);
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  uint64_t v5 = sub_100037C20();
  v2[31] = v5;
  v2[32] = *(void *)(v5 - 8);
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  uint64_t v6 = sub_100037EB0();
  v2[35] = v6;
  v2[36] = *(void *)(v6 - 8);
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  uint64_t v7 = sub_1000383F0();
  v2[39] = v7;
  v2[40] = *(void *)(v7 - 8);
  v2[41] = swift_task_alloc();
  sub_100003F3C(&qword_100044988);
  v2[42] = swift_task_alloc();
  sub_100003F3C(&qword_1000440F0);
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  v2[45] = swift_task_alloc();
  v2[46] = swift_task_alloc();
  uint64_t v8 = sub_100037D10();
  v2[47] = v8;
  v2[48] = *(void *)(v8 - 8);
  v2[49] = swift_task_alloc();
  v2[50] = swift_task_alloc();
  return _swift_task_switch(sub_100031104, 0, 0);
}

uint64_t sub_100031104()
{
  uint64_t v1 = v0[46];
  uint64_t v2 = v0[22];
  uint64_t v3 = type metadata accessor for EmailExtractor(0);
  sub_10000458C(v2 + *(int *)(v3 + 20), v1);
  sub_100037D00();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[51] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100031200;
  return MessageExtractor.isDataAccessible()();
}

uint64_t sub_100031200(char a1)
{
  *(unsigned char *)(*(void *)v1 + 504) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100031300, 0, 0);
}

uint64_t sub_100031300()
{
  if (*(unsigned char *)(v0 + 504) == 1)
  {
    uint64_t v1 = *(void *)(v0 + 360);
    uint64_t v2 = *(void *)(v0 + 248);
    uint64_t v3 = *(void *)(v0 + 256);
    uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56);
    *(void *)(v0 + 416) = v4;
    *(void *)(v0 + 424) = (v3 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    v4(v1, 1, 1, v2);
    sub_100037CF0();
    *(_OWORD *)(v0 + 432) = 0u;
    *(_OWORD *)(v0 + 448) = 0u;
    *(void *)(v0 + 464) = 0;
    *(void *)(v0 + 472) = _swiftEmptyArrayStorage;
    uint64_t v5 = sub_100036320(&qword_100044990, (void (*)(uint64_t))&type metadata accessor for MessageExtractor);
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 480) = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_10003164C;
    uint64_t v7 = *(void *)(v0 + 376);
    uint64_t v8 = *(void *)(v0 + 336);
    return dispatch thunk of AsyncIteratorProtocol.next()(v8, v7, v5);
  }
  else
  {
    if (qword_1000440D8 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_100038260();
    sub_1000044B8(v9, (uint64_t)qword_100044AF0);
    uint64_t v10 = sub_100038240();
    os_log_type_t v11 = sub_100038460();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Email interface: data not accessible.", v12, 2u);
      swift_slowDealloc();
    }
    uint64_t v13 = *(void *)(v0 + 400);
    uint64_t v14 = *(void *)(v0 + 376);
    uint64_t v15 = *(void *)(v0 + 384);
    uint64_t v16 = *(void *)(v0 + 248);
    uint64_t v17 = *(void *)(v0 + 256);
    uint64_t v18 = *(void *)(v0 + 168);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(v18, 1, 1, v16);
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    int v19 = *(uint64_t (**)(void, uint64_t))(v0 + 8);
    return v19(0, 6);
  }
}

uint64_t sub_10003164C()
{
  *(void *)(*(void *)v1 + 488) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100032A6C;
  }
  else {
    uint64_t v2 = sub_100031760;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100031760()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[42];
  uint64_t v3 = v0[35];
  uint64_t v4 = v0[36];
  BOOL v169 = v0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) != 1)
  {
    long long v47 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
    v47(v0[38], v2, v3);
    uint64_t v48 = sub_100037E90();
    unint64_t v50 = v49;
    swift_bridgeObjectRelease();
    uint64_t v51 = HIBYTE(v50) & 0xF;
    if ((v50 & 0x2000000000000000) == 0) {
      uint64_t v51 = v48 & 0xFFFFFFFFFFFFLL;
    }
    if (!v51)
    {
      uint64_t v58 = v0[58];
      (*(void (**)(uint64_t, uint64_t))(v0[36] + 8))(v0[38], v0[35]);
      uint64_t v59 = v58 + 1;
      if (!__OFADD__(v58, 1))
      {
        unint64_t v50 = v0[59];
        goto LABEL_114;
      }
      __break(1u);
      goto LABEL_120;
    }
    uint64_t v52 = v0[22];
    if (*(unsigned char *)(v52 + 24))
    {
      sub_100037E80();
      if (v53)
      {
        uint64_t v54 = sub_100038320();
        uint64_t v56 = v55;
        swift_bridgeObjectRelease();
        if (v56)
        {
          if (v54 == 0x6E65672D6F747561 && v56 == 0xEE00646574617265)
          {
            swift_bridgeObjectRelease();
            goto LABEL_85;
          }
          char v119 = sub_100038700();
          swift_bridgeObjectRelease();
          if (v119)
          {
LABEL_85:
            uint64_t v120 = v0[56];
            uint64_t v121 = (*(uint64_t (**)(uint64_t, uint64_t))(v0[36] + 8))(v0[38], v0[35]);
            uint64_t v124 = v120 + 1;
            if (!__OFADD__(v120, 1))
            {
              uint64_t v59 = v0[58];
              unint64_t v50 = v0[59];
              uint64_t v125 = v0[57];
LABEL_112:
              v1[56] = v124;
              goto LABEL_113;
            }
            goto LABEL_124;
          }
        }
      }
      if (sub_100037CD0())
      {
        uint64_t v126 = v0[57];
        uint64_t v121 = (*(uint64_t (**)(uint64_t, uint64_t))(v0[36] + 8))(v0[38], v0[35]);
        uint64_t v125 = v126 + 1;
        if (!__OFADD__(v126, 1))
        {
          uint64_t v59 = v0[58];
          unint64_t v50 = v0[59];
LABEL_113:
          v1[57] = v125;
LABEL_114:
          v1[58] = v59;
          v1[59] = v50;
          uint64_t v158 = sub_100036320(&qword_100044990, (void (*)(uint64_t))&type metadata accessor for MessageExtractor);
          uint64_t v159 = (void *)swift_task_alloc();
          v1[60] = (uint64_t)v159;
          void *v159 = v1;
          v159[1] = sub_10003164C;
          uint64_t v122 = v1[47];
          uint64_t v121 = v1[42];
          uint64_t v123 = v158;
          return dispatch thunk of AsyncIteratorProtocol.next()(v121, v122, v123);
        }
        __break(1u);
LABEL_124:
        __break(1u);
        goto LABEL_125;
      }
      uint64_t v52 = v0[22];
    }
    uint64_t v127 = *(void *)(v52 + 48);
    uint64_t v128 = *(void *)(v52 + 56);
    uint64_t v130 = *(void *)(v52 + 64);
    uint64_t v129 = *(void *)(v52 + 72);
    char v131 = *(unsigned char *)(v52 + 80);
    if (!v127) {
      goto LABEL_96;
    }
    if (v127 == 1) {
      goto LABEL_97;
    }
    if ((sub_100034728(v1[38], v127) & 1) == 0)
    {
      uint64_t v155 = v1[55];
      uint64_t v121 = (*(uint64_t (**)(uint64_t, uint64_t))(v1[36] + 8))(v1[38], v1[35]);
      uint64_t v156 = v155 + 1;
      if (__OFADD__(v155, 1))
      {
LABEL_125:
        __break(1u);
        goto LABEL_126;
      }
      uint64_t v59 = v1[58];
      unint64_t v50 = v1[59];
      uint64_t v124 = v1[56];
      uint64_t v125 = v1[57];
    }
    else
    {
LABEL_96:
      if ((v130 & 1) != 0 || (v131 & 1) != 0 || sub_100035114(v1[38], v128, v129))
      {
LABEL_97:
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v1[36] + 16))(v1[37], v1[38], v1[35]);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v50 = v1[59];
        if (isUniquelyReferenced_nonNull_native)
        {
LABEL_98:
          unint64_t v134 = *(void *)(v50 + 16);
          unint64_t v133 = *(void *)(v50 + 24);
          if (v134 >= v133 >> 1) {
            unint64_t v50 = sub_10001B728(v133 > 1, v134 + 1, 1, v50);
          }
          uint64_t v136 = v1[44];
          uint64_t v135 = v1[45];
          uint64_t v138 = v1[36];
          uint64_t v137 = v1[37];
          uint64_t v139 = v1[35];
          uint64_t v140 = v169[32];
          uint64_t v141 = v169[31];
          *(void *)(v50 + 16) = v134 + 1;
          v47(v50+ ((*(unsigned __int8 *)(v138 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v138 + 80))+ *(void *)(v138 + 72) * v134, v137, v139);
          sub_10000458C(v135, v136);
          int v142 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v140 + 48))(v136, 1, v141);
          uint64_t v1 = v169;
          if (v142 == 1)
          {
            uint64_t v143 = v169 + 46;
            sub_100020974(v169[44], &qword_1000440F0);
            sub_100037EA0();
          }
          else
          {
            uint64_t v143 = v169 + 43;
            uint64_t v144 = v169[43];
            uint64_t v146 = v169[33];
            uint64_t v145 = v169[34];
            uint64_t v147 = v169[31];
            uint64_t v148 = v169[32];
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v148 + 32))(v145, v169[44], v147);
            sub_100037EA0();
            sub_100036320(&qword_1000449A0, (void (*)(uint64_t))&type metadata accessor for Date);
            if (sub_1000382F0()) {
              uint64_t v149 = v146;
            }
            else {
              uint64_t v149 = v145;
            }
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v148 + 16))(v144, v149, v147);
            id v150 = *(void (**)(uint64_t, uint64_t))(v148 + 8);
            v150(v146, v147);
            v150(v145, v147);
          }
          uint64_t v151 = *v143;
          uint64_t v152 = (void (*)(uint64_t, void, uint64_t, uint64_t))v169[52];
          uint64_t v153 = v169[45];
          uint64_t v154 = v169[31];
          (*(void (**)(uint64_t, uint64_t))(v169[36] + 8))(v169[38], v169[35]);
          sub_100020974(v153, &qword_1000440F0);
          v152(v151, 0, 1, v154);
          sub_100035978(v151, v153);
          uint64_t v59 = v169[58];
          goto LABEL_114;
        }
LABEL_120:
        unint64_t v50 = sub_10001B728(0, *(void *)(v50 + 16) + 1, 1, v50);
        goto LABEL_98;
      }
      uint64_t v157 = v1[54];
      uint64_t v121 = (*(uint64_t (**)(uint64_t, uint64_t))(v1[36] + 8))(v1[38], v1[35]);
      if (__OFADD__(v157, 1))
      {
LABEL_126:
        __break(1u);
        return dispatch thunk of AsyncIteratorProtocol.next()(v121, v122, v123);
      }
      uint64_t v59 = v1[58];
      unint64_t v50 = v1[59];
      uint64_t v124 = v1[56];
      uint64_t v125 = v1[57];
      uint64_t v156 = v1[55];
      v1[54] = v157 + 1;
    }
    v1[55] = v156;
    goto LABEL_112;
  }
  uint64_t v162 = *(void (**)(uint64_t, uint64_t))(v0[48] + 8);
  v162(v0[49], v0[47]);
  if (qword_1000440D8 != -1) {
    goto LABEL_118;
  }
  while (1)
  {
    uint64_t v5 = sub_100038260();
    sub_1000044B8(v5, (uint64_t)qword_100044AF0);
    uint64_t v6 = sub_100038240();
    os_log_type_t v7 = sub_100038460();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = v1[58];
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 134217984;
      v1[20] = v8;
      sub_1000384B0();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Filtered %ld empty body messages.", v9, 0xCu);
      swift_slowDealloc();
    }

    if (*(unsigned char *)(v1[22] + 24))
    {
      uint64_t v10 = sub_100038240();
      os_log_type_t v11 = sub_100038460();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = v1[56];
        uint64_t v13 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v13 = 134217984;
        v169[19] = v12;
        sub_1000384B0();
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Filtered %ld auto-generated messages", v13, 0xCu);
        uint64_t v1 = v169;
        swift_slowDealloc();
      }

      uint64_t v14 = sub_100038240();
      os_log_type_t v15 = sub_100038460();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = v1[57];
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v17 = 134217984;
        v1[18] = v16;
        sub_1000384B0();
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Filtered %ld group or no-reply apple messages", v17, 0xCu);
        swift_slowDealloc();
      }
    }
    if (v1[55] >= 1)
    {
      uint64_t v18 = sub_100038240();
      os_log_type_t v19 = sub_100038460();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = v1[55];
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v21 = 134217984;
        v1[17] = v20;
        sub_1000384B0();
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Filtered %ld messages by week days.", v21, 0xCu);
        swift_slowDealloc();
      }
    }
    if (v1[54] >= 1)
    {
      char v22 = sub_100038240();
      os_log_type_t v23 = sub_100038460();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = v1[54];
        char v25 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)char v25 = 134217984;
        v1[16] = v24;
        sub_1000384B0();
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "Filtered %ld messages by hours.", v25, 0xCu);
        swift_slowDealloc();
      }
    }
    unsigned __int8 v26 = v1 + 8;
    uint64_t v27 = v1 + 15;
    uint64_t v28 = v1[22];
    v1[8] = (uint64_t)_swiftEmptyArrayStorage;
    char v29 = *(unsigned char *)(v28 + 25);
    swift_bridgeObjectRetain();
    uint64_t v161 = v1 + 8;
    if (v29)
    {
      uint64_t v57 = sub_100037D50();
      swift_bridgeObjectRelease();
      *unsigned __int8 v26 = v57;
      goto LABEL_50;
    }
    uint64_t v30 = sub_100037D40();
    swift_bridgeObjectRelease();
    uint64_t v31 = *(void *)(v30 + 16);
    if (!v31) {
      break;
    }
    uint64_t v160 = v1 + 15;
    uint64_t v32 = v1[27];
    uint64_t v35 = *(void (**)(void, void, void))(v32 + 16);
    uint64_t v33 = v32 + 16;
    uint64_t v34 = v35;
    unint64_t v166 = (*(unsigned __int8 *)(v33 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 64);
    uint64_t v168 = v35;
    unint64_t v36 = v30 + v166;
    uint64_t v37 = *(void *)(v33 + 56);
    uint64_t v38 = (void (**)(uint64_t, uint64_t))(v33 - 8);
    uint64_t v164 = 0;
    while (1)
    {
      uint64_t v42 = v1[22];
      v34(v1[30], v36, v1[26]);
      if ((*(unsigned char *)(v42 + 24) & 1) == 0
        || (unint64_t v43 = *(void *)(sub_100037F40() + 16), swift_bridgeObjectRelease(), v43 > 1))
      {
        v34(v1[29], v1[30], v1[26]);
        unint64_t v44 = v1[8];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v44 = sub_10001B474(0, *(void *)(v44 + 16) + 1, 1, v44);
        }
        unint64_t v46 = *(void *)(v44 + 16);
        unint64_t v45 = *(void *)(v44 + 24);
        if (v46 >= v45 >> 1) {
          unint64_t v44 = sub_10001B474(v45 > 1, v46 + 1, 1, v44);
        }
        uint64_t v39 = v169[29];
        uint64_t v40 = v169[30];
        uint64_t v41 = v169[26];
        *(void *)(v44 + 16) = v46 + 1;
        uint64_t v1 = v169;
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v33 + 16))(v44 + v166 + v46 * v37, v39, v41);
        v169[8] = v44;
        (*v38)(v40, v41);
        uint64_t v34 = v168;
        goto LABEL_23;
      }
      (*v38)(v1[30], v1[26]);
      if (__OFADD__(v164, 1)) {
        break;
      }
      ++v164;
LABEL_23:
      v36 += v37;
      if (!--v31)
      {
        swift_bridgeObjectRelease();
        unsigned __int8 v26 = v161;
        uint64_t v27 = v160;
        goto LABEL_46;
      }
    }
    __break(1u);
LABEL_118:
    swift_once();
  }
  swift_bridgeObjectRelease();
  uint64_t v164 = 0;
LABEL_46:
  if (*(unsigned char *)(v1[22] + 24))
  {
    uint64_t v60 = sub_100038240();
    os_log_type_t v61 = sub_100038460();
    if (os_log_type_enabled(v60, v61))
    {
      uint64_t v62 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v62 = 134217984;
      void *v27 = v164;
      sub_1000384B0();
      _os_log_impl((void *)&_mh_execute_header, v60, v61, "Filtered %ld conversations with a single message.", v62, 0xCu);
      swift_slowDealloc();
    }
  }
LABEL_50:
  uint64_t v63 = v1 + 14;
  uint64_t v64 = *v26;
  swift_bridgeObjectRetain();
  uint64_t v65 = sub_100038240();
  os_log_type_t v66 = sub_100038460();
  if (os_log_type_enabled(v65, v66))
  {
    uint64_t v67 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v67 = 134217984;
    void *v63 = *(void *)(v64 + 16);
    sub_1000384B0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v65, v66, "Finished extract step. Extracted %ld conversations.", v67, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  swift_beginAccess();
  uint64_t v68 = *v26;
  int64_t v69 = *(void *)(*v26 + 16);
  uint64_t v70 = _swiftEmptyArrayStorage;
  char v71 = v169;
  if (v69)
  {
    uint64_t v72 = v169[27];
    uint64_t v73 = v169[24];
    uint64_t v170 = _swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    sub_10003593C(0, v69, 0);
    uint64_t v74 = *(void (**)(void, void, void))(v72 + 16);
    v72 += 16;
    long long v75 = v169;
    uint64_t v76 = v68 + ((*(unsigned __int8 *)(v72 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v72 + 64));
    uint64_t v165 = *(void *)(v72 + 56);
    uint64_t v167 = v74;
    int v77 = (void (**)(uint64_t, uint64_t))(v72 - 8);
    uint64_t v70 = _swiftEmptyArrayStorage;
    do
    {
      uint64_t v78 = v75[28];
      uint64_t v79 = v75[26];
      v167(v78, v76, v79);
      sub_100037F20();
      sub_100037F30();
      sub_100037E10();
      (*v77)(v78, v79);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10003593C(0, v70[2] + 1, 1);
        uint64_t v70 = v170;
      }
      unint64_t v81 = v70[2];
      unint64_t v80 = v70[3];
      if (v81 >= v80 >> 1)
      {
        sub_10003593C(v80 > 1, v81 + 1, 1);
        uint64_t v70 = v170;
      }
      long long v75 = v169;
      uint64_t v82 = v169[25];
      uint64_t v83 = v169[23];
      v70[2] = v81 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v73 + 32))((unint64_t)v70+ ((*(unsigned __int8 *)(v73 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80))+ *(void *)(v73 + 72) * v81, v82, v83);
      uint64_t v170 = v70;
      v76 += v165;
      --v69;
    }
    while (v69);
    swift_bridgeObjectRelease();
    char v71 = v169;
  }
  uint64_t v84 = v71[22];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v84 + 40))
  {
    uint64_t v85 = v71[45];
    uint64_t v86 = v71[21];
    v162(v71[50], v71[47]);
    uint64_t v87 = v85;
    uint64_t v88 = v86;
    goto LABEL_80;
  }
  uint64_t v89 = *(void *)(v84 + 32);
  uint64_t v90 = v70[2];
  swift_bridgeObjectRetain();
  uint64_t v91 = sub_100038240();
  if (v90 < v89)
  {
    os_log_type_t v92 = sub_100038480();
    if (os_log_type_enabled(v91, v92))
    {
      uint64_t v93 = swift_slowAlloc();
      *(_DWORD *)uint64_t v93 = 134218240;
      v71[12] = v89;
      sub_1000384B0();
      *(_WORD *)(v93 + 12) = 2048;
      swift_bridgeObjectRelease();
      v71[13] = v90;
      sub_1000384B0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v91, v92, "Not enough data to sample with sampling size %ld. Only %ld items were extract extracted.", (uint8_t *)v93, 0x16u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v98 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v71[52];
    uint64_t v99 = v71[50];
    uint64_t v100 = v71[47];
    uint64_t v101 = v71[31];
    uint64_t v102 = v71[21];
    sub_100020974(v71[45], &qword_1000440F0);
    v162(v99, v100);
    v98(v102, 1, 1, v101);
    uint64_t v70 = 0;
    int v103 = 15;
    goto LABEL_81;
  }
  os_log_type_t v94 = sub_100038460();
  if (os_log_type_enabled(v91, v94))
  {
    long long v95 = v71 + 10;
    long long v96 = v71 + 11;
    uint64_t v97 = swift_slowAlloc();
    *(_DWORD *)uint64_t v97 = 134218240;
    *long long v95 = v90;
    sub_1000384B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v97 + 12) = 2048;
    *long long v96 = v89;
    sub_1000384B0();
    _os_log_impl((void *)&_mh_execute_header, v91, v94, "Subsampling from %ld to %ld items.", (uint8_t *)v97, 0x16u);
    char v71 = v169;
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  sub_100035DE4();
  uint64_t v104 = sub_100035888(v89, (uint64_t)v70);
  uint64_t v106 = v105;
  uint64_t v108 = v107;
  unint64_t v110 = v109;
  if ((v109 & 1) == 0)
  {
LABEL_72:
    uint64_t v70 = sub_10003609C(v104, v106, v108, v110);
    goto LABEL_79;
  }
  sub_100038710();
  swift_unknownObjectRetain_n();
  uint64_t v111 = (void *)swift_dynamicCastClass();
  if (!v111)
  {
    swift_unknownObjectRelease();
    uint64_t v111 = _swiftEmptyArrayStorage;
  }
  uint64_t v112 = v111[2];
  swift_release();
  if (__OFSUB__(v110 >> 1, v108))
  {
    __break(1u);
    goto LABEL_122;
  }
  if (v112 != (v110 >> 1) - v108)
  {
LABEL_122:
    swift_unknownObjectRelease();
    goto LABEL_72;
  }
  uint64_t v70 = (void *)swift_dynamicCastClass();
  if (!v70)
  {
    swift_unknownObjectRelease();
    uint64_t v70 = _swiftEmptyArrayStorage;
  }
LABEL_79:
  uint64_t v113 = v71[50];
  uint64_t v114 = v71[47];
  uint64_t v115 = v71[45];
  uint64_t v116 = v71[21];
  swift_unknownObjectRelease();
  v162(v113, v114);
  uint64_t v87 = v115;
  uint64_t v88 = v116;
LABEL_80:
  sub_100035978(v87, v88);
  int v103 = 17;
LABEL_81:
  unsigned int v163 = v103;
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v117 = (uint64_t (*)(void *, void))v71[1];
  return v117(v70, v163);
}

uint64_t sub_100032A6C()
{
  v0[9] = v0[61];
  v0[62] = sub_100003F3C(&qword_100044998);
  swift_willThrowTypedImpl();
  return _swift_task_switch(sub_100032AFC, 0, 0);
}

uint64_t sub_100032AFC()
{
  uint64_t v1 = v0[61];
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0[48] + 8);
  v2(v0[49], v0[47]);
  v0[5] = v1;
  swift_errorRetain();
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    if (qword_1000440D8 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_100038260();
    sub_1000044B8(v3, (uint64_t)qword_100044AF0);
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100038240();
    os_log_type_t v5 = sub_100038460();
    BOOL v6 = os_log_type_enabled(v4, v5);
    uint64_t v7 = v0[59];
    uint64_t v32 = v2;
    if (v6)
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 134217984;
      uint64_t v9 = *(void *)(v7 + 16);
      swift_bridgeObjectRelease();
      v0[7] = v9;
      sub_1000384B0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Task canceled at extraction loop. Extracted %ld messages.", v8, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v16 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[52];
    uint64_t v17 = v0[50];
    uint64_t v18 = v0[47];
    uint64_t v20 = v0[40];
    uint64_t v19 = v0[41];
    uint64_t v21 = v0[39];
    uint64_t v22 = v0[31];
    uint64_t v23 = v0[21];
    sub_100020974(v0[45], &qword_1000440F0);
    v32(v17, v18);
    v16(v23, 1, 1, v22);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    swift_errorRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_errorRelease();
    if (qword_1000440D8 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_100038260();
    sub_1000044B8(v10, (uint64_t)qword_100044AF0);
    swift_errorRetain();
    swift_errorRetain();
    os_log_type_t v11 = sub_100038240();
    os_log_type_t v12 = sub_100038480();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 138412290;
      swift_errorRetain();
      uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
      v0[6] = v15;
      sub_1000384B0();
      *uint64_t v14 = v15;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Error at extraction loop: %@.", v13, 0xCu);
      sub_100003F3C(&qword_1000442C8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }
    uint64_t v24 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[52];
    uint64_t v25 = v0[50];
    uint64_t v26 = v0[47];
    uint64_t v27 = v0[45];
    uint64_t v28 = v0[31];
    uint64_t v29 = v0[21];
    swift_errorRelease();
    sub_100020974(v27, &qword_1000440F0);
    v2(v25, v26);
    v24(v29, 1, 1, v28);
  }
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v30 = (uint64_t (*)(void, uint64_t))v0[1];
  return v30(0, 8);
}

uint64_t sub_100033018(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_100037C20();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  sub_100003F3C(&qword_1000440F0);
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  return _swift_task_switch(sub_10003314C, 0, 0);
}

uint64_t sub_10003314C()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = (uint64_t *)v0[3];
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 56);
  uint64_t v4 = v1 + 56;
  uint64_t v3 = v5;
  v5(v0[12], 1, 1, v0[4]);
  uint64_t v6 = *v2;
  if (v6 < 0) {
    return sub_100038560();
  }
  uint64_t v7 = v0[12];
  uint64_t v56 = v3;
  uint64_t v8 = v0[3];
  uint64_t v9 = v0[4];
  uint64_t v10 = v0[2];
  uint64_t v11 = type metadata accessor for TransparencyExtractor(0);
  unint64_t v12 = sub_100033A58(v8 + *(int *)(v11 + 20), v7, v6, 0);
  sub_100020974(v7, &qword_1000440F0);
  v56(v10, 1, 1, v9);
  if (v12 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v13 = sub_100038570();
    swift_bridgeObjectRelease();
    if (v13) {
      goto LABEL_4;
    }
LABEL_24:
    uint64_t v44 = v0[3];
    swift_bridgeObjectRelease();
    uint64_t v45 = swift_task_alloc();
    *(void *)(v45 + 16) = v44;
    sub_1000336E0((void (*)(id *))sub_100036388, v45, v12);
    uint64_t v47 = v46;
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v48 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
    return v48(v47, 17);
  }
  uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v13) {
    goto LABEL_24;
  }
LABEL_4:
  uint64_t v14 = 0;
  unint64_t v55 = v12 & 0xC000000000000001;
  uint64_t v15 = v0[5];
  uint64_t v57 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
  unint64_t v52 = v12;
  uint64_t v53 = (void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32);
  unint64_t v49 = (void (**)(uint64_t, uint64_t))(v15 + 8);
  unint64_t v50 = (void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
  uint64_t v16 = v0 + 8;
  uint64_t v51 = v13;
  while (1)
  {
    if (v55) {
      id v24 = (id)sub_1000384F0();
    }
    else {
      id v24 = *(id *)(v12 + 8 * v14 + 32);
    }
    uint64_t v59 = v24;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      return sub_100038560();
    }
    uint64_t v25 = v0[11];
    uint64_t v26 = v0[4];
    sub_10000458C(v0[2], v25);
    uint64_t v27 = *v57;
    int v28 = (*v57)(v25, 1, v26);
    uint64_t v29 = v0[11];
    uint64_t v58 = v14 + 1;
    if (v28 == 1)
    {
      sub_100020974(v29, &qword_1000440F0);
      id v17 = [v59 timestamp];
      if (v17)
      {
        uint64_t v18 = v17;
        sub_100037C00();

        uint64_t v19 = 0;
      }
      else
      {
        uint64_t v19 = 1;
      }
      uint64_t v20 = v0[8];
      uint64_t v21 = v0[4];
      uint64_t v22 = v0[2];

      sub_100020974(v22, &qword_1000440F0);
      v56(v20, v19, 1, v21);
      uint64_t v23 = v16;
      goto LABEL_8;
    }
    uint64_t v30 = v4;
    uint64_t v31 = *v53;
    (*v53)(v0[7], v29, v0[4]);
    id v32 = [v59 timestamp];
    uint64_t v33 = v0[9];
    if (!v32) {
      break;
    }
    uint64_t v34 = v32;
    uint64_t v35 = v0[6];
    uint64_t v36 = v0[4];
    sub_100037C00();

    v31(v33, v35, v36);
    v56(v33, 0, 1, v36);
    uint64_t result = v27(v33, 1, v36);
    if (result == 1) {
      goto LABEL_28;
    }
    uint64_t v39 = v0[9];
    uint64_t v38 = v0[10];
    uint64_t v40 = v0[7];
    uint64_t v41 = v0[4];
    uint64_t v54 = v0[2];
    sub_100036320(&qword_1000449A0, (void (*)(uint64_t))&type metadata accessor for Date);
    if (sub_1000382F0()) {
      uint64_t v42 = v39;
    }
    else {
      uint64_t v42 = v40;
    }
    (*v50)(v38, v42, v41);

    unint64_t v43 = *v49;
    (*v49)(v40, v41);
    sub_100020974(v54, &qword_1000440F0);
    v43(v39, v41);
    v56(v38, 0, 1, v41);
    uint64_t v16 = v0 + 8;
    uint64_t v23 = v0 + 10;
    uint64_t v4 = v30;
    uint64_t v13 = v51;
    unint64_t v12 = v52;
LABEL_8:
    sub_100035978(*v23, v0[2]);
    ++v14;
    if (v58 == v13) {
      goto LABEL_24;
    }
  }
  uint64_t result = ((uint64_t (*)(void, uint64_t, uint64_t, void))v56)(v0[9], 1, 1, v0[4]);
LABEL_28:
  __break(1u);
  return result;
}

void sub_1000336E0(void (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v33 = a1;
  uint64_t v34 = a2;
  uint64_t v5 = sub_100003F3C(&qword_1000449C0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void *)sub_100037E30();
  uint64_t v28 = *(v8 - 1);
  uint64_t v9 = __chkstk_darwin(v8);
  id v32 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v27 = (char *)&v25 - v11;
  if (a3 >> 62) {
    goto LABEL_20;
  }
  uint64_t v12 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v12; uint64_t v12 = sub_100038570())
  {
    uint64_t v30 = (unsigned int (**)(char *, uint64_t, void *))(v28 + 48);
    unint64_t v31 = a3 & 0xC000000000000001;
    uint64_t v29 = v28 + 32;
    uint64_t v35 = v8;
    uint64_t v36 = (char *)_swiftEmptyArrayStorage;
    uint64_t v13 = 4;
    unint64_t v26 = a3;
    uint64_t v14 = (void (**)(char *, char *, void *))(v28 + 32);
    while (1)
    {
      uint64_t v15 = v31 ? (void *)sub_1000384F0() : *(id *)(a3 + 8 * v13);
      uint64_t v8 = v15;
      uint64_t v16 = v13 - 3;
      if (__OFADD__(v13 - 4, 1)) {
        break;
      }
      id v37 = v15;
      v33(&v37);
      if (v3)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return;
      }

      id v17 = v35;
      if ((*v30)(v7, 1, v35) == 1)
      {
        sub_100020974((uint64_t)v7, &qword_1000449C0);
      }
      else
      {
        uint64_t v18 = *v14;
        uint64_t v19 = v27;
        (*v14)(v27, v7, v17);
        v18(v32, v19, v17);
        unint64_t v20 = (unint64_t)v36;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v20 = sub_10001B75C(0, *(void *)(v20 + 16) + 1, 1, v20);
        }
        unint64_t v22 = *(void *)(v20 + 16);
        unint64_t v21 = *(void *)(v20 + 24);
        uint64_t v36 = (char *)v20;
        if (v22 >= v21 >> 1) {
          uint64_t v36 = (char *)sub_10001B75C(v21 > 1, v22 + 1, 1, (unint64_t)v36);
        }
        uint64_t v23 = v35;
        id v24 = v36;
        *((void *)v36 + 2) = v22 + 1;
        v18(&v24[((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80))+ *(void *)(v28 + 72) * v22], v32, v23);
        a3 = v26;
      }
      ++v13;
      if (v16 == v12) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
}

uint64_t sub_100033A58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_100003F3C(&qword_1000440F0);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&aBlock - v12;
  sub_10000454C();
  sub_10000458C(a1, (uint64_t)v13);
  uint64_t result = sub_10000458C(a2, (uint64_t)v11);
  if ((a4 | a3) < 0)
  {
    __break(1u);
  }
  else
  {
    id v15 = sub_100030B50((uint64_t)v13, (uint64_t)v11, a3, a4, 0);
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = _swiftEmptyArrayStorage;
    id v17 = [(id)BiomeLibrary() GenerativeExperiences];
    swift_unknownObjectRelease();
    id v18 = [v17 TransparencyLog];
    swift_unknownObjectRelease();
    NSString v19 = sub_100038300();
    id v20 = [v18 publisherWithUseCase:v19 options:v15];

    uint64_t v29 = sub_1000363DC;
    uint64_t v30 = v16;
    aBlock = _NSConcreteStackBlock;
    uint64_t v26 = 1107296256;
    uint64_t v27 = sub_1000345BC;
    uint64_t v28 = &unk_100042DA8;
    unint64_t v21 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    uint64_t v29 = sub_1000363FC;
    uint64_t v30 = v16;
    aBlock = _NSConcreteStackBlock;
    uint64_t v26 = 1107296256;
    uint64_t v27 = sub_1000345BC;
    uint64_t v28 = &unk_100042DD0;
    unint64_t v22 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    id v23 = [v20 sinkWithCompletion:v21 receiveInput:v22];

    _Block_release(v22);
    _Block_release(v21);

    swift_beginAccess();
    uint64_t v24 = *(void *)(v16 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    return v24;
  }
  return result;
}

uint64_t sub_100033D84@<X0>(id *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5 = *a1;
  id v6 = [*a1 prompt];
  if (!v6)
  {
    uint64_t v15 = sub_100037E30();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(a3, 1, 1, v15);
  }
  uint64_t v7 = v6;
  sub_100038310();

  uint64_t v8 = a2[2];
  if (v8)
  {
    uint64_t v9 = a2[1];
    swift_bridgeObjectRetain();
    id v10 = [v5 useCase];
    if (!v10) {
      goto LABEL_20;
    }
    uint64_t v11 = v10;
    uint64_t v12 = sub_100038310();
    uint64_t v14 = v13;

    if (v9 == v12 && v8 == v14)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v17 = sub_100038700();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v17 & 1) == 0) {
        goto LABEL_21;
      }
    }
  }
  uint64_t v18 = a2[4];
  if (v18)
  {
    uint64_t v19 = a2[3];
    swift_bridgeObjectRetain();
    id v20 = [v5 model];
    if (!v20) {
      goto LABEL_20;
    }
    unint64_t v21 = v20;
    uint64_t v22 = sub_100038310();
    uint64_t v24 = v23;

    if (v19 == v22 && v18 == v24)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v25 = sub_100038700();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v25 & 1) == 0) {
        goto LABEL_21;
      }
    }
  }
  uint64_t v26 = a2[6];
  if (v26)
  {
    uint64_t v27 = a2[5];
    swift_bridgeObjectRetain();
    id v28 = [v5 modelVersion];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = sub_100038310();
      uint64_t v32 = v31;

      if (v27 == v30 && v26 == v32)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_23;
      }
      char v34 = sub_100038700();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v34) {
        goto LABEL_23;
      }
LABEL_21:
      uint64_t v33 = sub_100037E30();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(a3, 1, 1, v33);
      return swift_bridgeObjectRelease();
    }
LABEL_20:
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
LABEL_23:
  sub_100037E10();
  uint64_t v35 = sub_100037E30();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(a3, 0, 1, v35);
}

void sub_1000340F4(void *a1, uint64_t a2)
{
  id v4 = [a1 state];
  if (v4 == (id)1)
  {
    if (qword_1000440D8 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_100038260();
    sub_1000044B8(v11, (uint64_t)qword_100044AF0);
    id v20 = a1;
    uint64_t v12 = sub_100038240();
    os_log_type_t v13 = sub_100038460();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 138412290;
      if ([v20 error])
      {
        uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
        sub_1000384B0();
      }
      else
      {
        sub_1000384B0();
        uint64_t v16 = 0;
      }
      void *v15 = v16;

      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Error reading data: %@", v14, 0xCu);
      sub_100003F3C(&qword_1000442C8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
  else
  {
    if (!v4)
    {
      if (qword_1000440D8 != -1) {
        swift_once();
      }
      uint64_t v5 = sub_100038260();
      sub_1000044B8(v5, (uint64_t)qword_100044AF0);
      swift_retain_n();
      id v6 = sub_100038240();
      os_log_type_t v7 = sub_100038460();
      if (os_log_type_enabled(v6, v7))
      {
        uint64_t v8 = (uint8_t *)swift_slowAlloc();
        uint64_t v21 = swift_slowAlloc();
        *(_DWORD *)uint64_t v8 = 136315138;
        swift_beginAccess();
        if (*(void *)(a2 + 16) >> 62)
        {
          swift_bridgeObjectRetain();
          sub_100038570();
          swift_bridgeObjectRelease();
        }
        uint64_t v9 = sub_1000386E0();
        sub_10001B980(v9, v10, &v21);
        sub_1000384B0();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "Data reading completed. %s", v8, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_release_n();
      }
      return;
    }
    if (qword_1000440D8 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_100038260();
    sub_1000044B8(v17, (uint64_t)qword_100044AF0);
    id v20 = sub_100038240();
    os_log_type_t v18 = sub_100038480();
    if (os_log_type_enabled(v20, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v18, "Data reading ends with unknown reason.", v19, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_1000345C0(void *a1, uint64_t a2)
{
  id v3 = [a1 eventBody];
  if (v3)
  {
    id v7 = v3;
    id v4 = [v3 prompt];
    if (v4)
    {
      uint64_t v5 = (void *)(a2 + 16);

      swift_beginAccess();
      id v6 = v7;
      sub_100038390();
      if (*(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1000383C0();
      }
      sub_1000383D0();
      sub_1000383B0();
      swift_endAccess();
    }
    else
    {
    }
  }
}

void sub_1000346C0(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_100034728(uint64_t a1, uint64_t a2)
{
  uint64_t v79 = a2;
  uint64_t v84 = a1;
  uint64_t v86 = (void *)sub_100037EB0();
  uint64_t v80 = *(v86 - 1);
  __chkstk_darwin(v86);
  uint64_t v85 = (char *)v68 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_100038260();
  uint64_t v88 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  uint64_t v87 = (char *)v68 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_100037C20();
  uint64_t v91 = *(char **)(v83 - 8);
  __chkstk_darwin(v83);
  uint64_t v5 = (char *)v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100037CC0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100037C50();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  os_log_type_t v13 = (char *)v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100037CA0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v89 = v14;
  uint64_t v90 = v15;
  uint64_t v16 = __chkstk_darwin(v14);
  unint64_t v81 = (char *)v68 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)v68 - v18;
  sub_100037C60();
  id v20 = [objc_allocWithZone((Class)NSDateFormatter) init];
  sub_100037C30();
  Class isa = sub_100037C40().super.isa;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  [v20 setLocale:isa];

  sub_100037C70();
  Class v22 = sub_100037CB0().super.isa;
  uint64_t v23 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v76 = v9;
  uint64_t v77 = v7 + 8;
  uint64_t v24 = v9;
  uint64_t v25 = v83;
  uint64_t v78 = v6;
  v23(v24, v6);
  uint64_t v26 = v84;
  [v20 setTimeZone:v22];

  NSString v27 = sub_100038300();
  [v20 setDateFormat:v27];

  sub_100037EA0();
  Class v28 = sub_100037BF0().super.isa;
  uint64_t v29 = (void (*)(char *, uint64_t))*((void *)v91 + 1);
  long long v75 = v5;
  v91 += 8;
  v29(v5, v25);
  id v30 = [v20 stringFromDate:v28];

  uint64_t v31 = sub_100038310();
  uint64_t v33 = v32;

  uint64_t v34 = sub_10002B064(v31, v33);
  if (v34 == 7)
  {
    (*(void (**)(char *, uint64_t))(v90 + 8))(v19, v89);

    char v35 = 0;
  }
  else
  {
    char v71 = v29;
    uint64_t v73 = v23;
    uint64_t v37 = v89;
    uint64_t v36 = v90;
    uint64_t v72 = v34;
    int v74 = sub_100030CD0(v34, v79);
    if (qword_1000440D8 != -1) {
      swift_once();
    }
    uint64_t v38 = v82;
    uint64_t v39 = sub_1000044B8(v82, (uint64_t)qword_100044AF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v88 + 16))(v87, v39, v38);
    uint64_t v40 = v80;
    (*(void (**)(char *, uint64_t, void *))(v80 + 16))(v85, v26, v86);
    uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
    uint64_t v42 = v81;
    unint64_t v43 = v19;
    v41(v81, v19, v37);
    swift_bridgeObjectRetain_n();
    uint64_t v44 = sub_100038240();
    os_log_type_t v45 = sub_100038470();
    int v46 = v45;
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v47 = swift_slowAlloc();
      uint64_t v84 = swift_slowAlloc();
      v93[0] = v84;
      *(_DWORD *)uint64_t v47 = 136316162;
      v68[1] = v47 + 4;
      int v70 = v46;
      uint64_t v48 = v75;
      os_log_t v69 = v44;
      unint64_t v49 = v85;
      sub_100037EA0();
      sub_100036320(&qword_1000449A8, (void (*)(uint64_t))&type metadata accessor for Date);
      uint64_t v50 = sub_1000386E0();
      unint64_t v52 = v51;
      v71(v48, v25);
      uint64_t v53 = sub_10001B980(v50, v52, v93);
      uint64_t v91 = v43;
      uint64_t v92 = v53;
      sub_1000384B0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, void *))(v40 + 8))(v49, v86);
      *(_WORD *)(v47 + 12) = 2080;
      uint64_t v54 = v76;
      unint64_t v55 = v81;
      sub_100037C70();
      sub_100036320(&qword_1000449B0, (void (*)(uint64_t))&type metadata accessor for TimeZone);
      uint64_t v86 = v20;
      uint64_t v56 = v78;
      uint64_t v57 = sub_1000386E0();
      unint64_t v59 = v58;
      v73(v54, v56);
      uint64_t v92 = sub_10001B980(v57, v59, v93);
      sub_1000384B0();
      swift_bridgeObjectRelease();
      uint64_t v60 = v89;
      os_log_type_t v61 = *(void (**)(char *, uint64_t))(v90 + 8);
      v61(v55, v89);
      *(_WORD *)(v47 + 22) = 2080;
      uint64_t v92 = sub_10001B980(qword_10003CB78[(char)v72], 0xE300000000000000, v93);
      sub_1000384B0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v47 + 32) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v62 = sub_1000383A0();
      unint64_t v64 = v63;
      swift_bridgeObjectRelease();
      uint64_t v92 = sub_10001B980(v62, v64, v93);
      sub_1000384B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v47 + 42) = 1024;
      char v35 = v74;
      LODWORD(v92) = v74 & 1;
      sub_1000384B0();
      os_log_t v65 = v69;
      _os_log_impl((void *)&_mh_execute_header, v69, (os_log_type_t)v70, "WeekDays filter | message date: %s, timezone: %s, local week day: %s, weekDays: %s, isIn: %{BOOL}d", (uint8_t *)v47, 0x30u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v88 + 8))(v87, v82);
      v61(v91, v60);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      os_log_type_t v66 = *(void (**)(char *, uint64_t))(v90 + 8);
      v66(v42, v37);
      (*(void (**)(char *, void *))(v40 + 8))(v85, v86);
      (*(void (**)(char *, uint64_t))(v88 + 8))(v87, v38);
      v66(v43, v37);
      char v35 = v74;
    }
  }
  return v35 & 1;
}

BOOL sub_100035114(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v75 = a2;
  uint64_t v76 = a3;
  uint64_t v4 = sub_100037CC0();
  uint64_t v67 = *(void *)(v4 - 8);
  uint64_t v68 = v4;
  __chkstk_darwin(v4);
  os_log_type_t v66 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100037EB0();
  uint64_t v71 = *(void *)(v6 - 8);
  uint64_t v72 = v6;
  __chkstk_darwin(v6);
  int v70 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100037C20();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100037C80();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100037CA0();
  uint64_t v69 = *(void *)(v16 - 8);
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v56 - v20;
  sub_100037C60();
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, enum case for Calendar.Component.hour(_:), v12);
  os_log_t v73 = a1;
  sub_100037EA0();
  uint64_t v22 = sub_100037C90();
  uint64_t v23 = *(void (**)(char *, uint64_t))(v9 + 8);
  uint64_t v63 = v9 + 8;
  uint64_t v64 = v8;
  os_log_type_t v61 = v23;
  v23(v11, v8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v65 = v22;
  BOOL v25 = v22 >= v75 && v22 < v76;
  BOOL v74 = v25;
  if (qword_1000440D8 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_100038260();
  sub_1000044B8(v26, (uint64_t)qword_100044AF0);
  NSString v27 = v70;
  uint64_t v28 = v71;
  uint64_t v29 = v72;
  (*(void (**)(char *, os_log_t, uint64_t))(v71 + 16))(v70, v73, v72);
  uint64_t v30 = v69;
  (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v19, v21, v16);
  uint64_t v31 = sub_100038240();
  os_log_type_t v32 = sub_100038470();
  os_log_t v73 = v31;
  int v62 = v32;
  uint64_t v33 = v16;
  uint64_t v34 = v30;
  char v35 = v21;
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v36 = swift_slowAlloc();
    uint64_t v37 = v29;
    uint64_t v38 = v28;
    uint64_t v57 = v19;
    uint64_t v58 = v33;
    uint64_t v39 = v36;
    uint64_t v60 = swift_slowAlloc();
    v78[0] = v60;
    *(_DWORD *)uint64_t v39 = 136316418;
    sub_100037EA0();
    sub_100036320(&qword_1000449A8, (void (*)(uint64_t))&type metadata accessor for Date);
    uint64_t v40 = v64;
    uint64_t v41 = sub_1000386E0();
    unint64_t v59 = v35;
    unint64_t v43 = v42;
    v61(v11, v40);
    uint64_t v77 = sub_10001B980(v41, v43, v78);
    BOOL v44 = v74;
    sub_1000384B0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v27, v37);
    *(_WORD *)(v39 + 12) = 2080;
    os_log_type_t v45 = v66;
    int v46 = v57;
    sub_100037C70();
    sub_100036320(&qword_1000449B0, (void (*)(uint64_t))&type metadata accessor for TimeZone);
    uint64_t v47 = v68;
    uint64_t v48 = sub_1000386E0();
    unint64_t v50 = v49;
    (*(void (**)(char *, uint64_t))(v67 + 8))(v45, v47);
    uint64_t v77 = sub_10001B980(v48, v50, v78);
    sub_1000384B0();
    swift_bridgeObjectRelease();
    unint64_t v51 = *(void (**)(char *, uint64_t))(v34 + 8);
    uint64_t v52 = v58;
    v51(v46, v58);
    *(_WORD *)(v39 + 22) = 2048;
    uint64_t v77 = v65;
    sub_1000384B0();
    *(_WORD *)(v39 + 32) = 2048;
    uint64_t v77 = v75;
    sub_1000384B0();
    *(_WORD *)(v39 + 42) = 2048;
    uint64_t v77 = v76;
    sub_1000384B0();
    *(_WORD *)(v39 + 52) = 1024;
    LODWORD(v77) = v44;
    sub_1000384B0();
    os_log_t v53 = v73;
    _os_log_impl((void *)&_mh_execute_header, v73, (os_log_type_t)v62, "BetweenHours filter | message date: %s, timezone: %s, local hour: %ld,  startHour: %ld, endHour: %ld, isIn: %{BOOL}d", (uint8_t *)v39, 0x3Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v51(v59, v52);
  }
  else
  {

    uint64_t v54 = *(void (**)(char *, uint64_t))(v34 + 8);
    v54(v19, v33);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v27, v29);
    v54(v21, v33);
  }
  return v74;
}

uint64_t sub_100035888(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v3 = *(void *)(a2 + 16);
    if ((uint64_t)v3 >= result) {
      unint64_t v4 = result;
    }
    else {
      unint64_t v4 = *(void *)(a2 + 16);
    }
    if (result) {
      unint64_t v5 = v4;
    }
    else {
      unint64_t v5 = 0;
    }
    if (v3 >= v5)
    {
      sub_100037E30();
      return a2;
    }
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for EmailExtractor(uint64_t a1)
{
  return sub_10002A834(a1, qword_100044A28);
}

uint64_t sub_10003593C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100035B9C(a1, a2, a3, (void *)*v3, &qword_1000442E8, (uint64_t (*)(void))&type metadata accessor for ExtractedItem);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_100035978(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003F3C(&qword_1000440F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000359E0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100035A3C(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100035A00(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100035B9C(a1, a2, a3, (void *)*v3, &qword_1000442F0, (uint64_t (*)(void))&type metadata accessor for EmbeddingItem);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_100035A3C(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_100003F3C(&qword_1000449C8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1000385B0();
  __break(1u);
  return result;
}

uint64_t sub_100035B9C(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100003F3C(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  _OWORD v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v16 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_1000385B0();
  __break(1u);
  return result;
}

uint64_t sub_100035DE4()
{
  uint64_t v1 = sub_100037E30();
  uint64_t v29 = *(void *)(v1 - 8);
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v33 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v2);
  os_log_type_t v32 = (char *)&v25 - v5;
  unint64_t v6 = (char *)*v0;
  unint64_t v7 = *(void *)(*v0 + 16);
  unint64_t v8 = v7 - 2;
  if (v7 >= 2)
  {
    unint64_t v9 = 0;
    unint64_t v26 = v7 - 2;
    NSString v27 = v0;
    uint64_t v28 = (uint64_t (**)(unint64_t, char *, uint64_t))(v29 + 40);
    while (1)
    {
      unint64_t v34 = 0;
      uint64_t result = swift_stdlib_random();
      uint64_t v11 = (v34 * (unsigned __int128)v7) >> 64;
      if (v7 > v34 * v7)
      {
        unint64_t v12 = -(uint64_t)v7 % v7;
        if (v12 > v34 * v7)
        {
          do
          {
            unint64_t v34 = 0;
            uint64_t result = swift_stdlib_random();
          }
          while (v12 > v34 * v7);
          uint64_t v11 = (v34 * (unsigned __int128)v7) >> 64;
        }
      }
      unint64_t v13 = v9 + v11;
      if (__OFADD__(v9, v11)) {
        break;
      }
      if (v9 != v13)
      {
        unint64_t v14 = *((void *)v6 + 2);
        if (v9 >= v14) {
          goto LABEL_20;
        }
        uint64_t v15 = v1;
        unint64_t v31 = (*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
        uint64_t v16 = &v6[v31];
        uint64_t v17 = *(void *)(v29 + 72);
        uint64_t v30 = v17 * v9;
        uint64_t v18 = *(uint64_t (**)(char *, char *, uint64_t))(v29 + 16);
        uint64_t result = v18(v32, &v6[v31 + v17 * v9], v15);
        if (v13 >= v14) {
          goto LABEL_21;
        }
        uint64_t v19 = v17 * v13;
        v18(v33, &v16[v17 * v13], v15);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v21 = v27;
        uint64_t *v27 = (uint64_t)v6;
        uint64_t v1 = v15;
        if (isUniquelyReferenced_nonNull_native)
        {
          uint64_t v22 = v28;
          uint64_t result = (uint64_t)v6;
        }
        else
        {
          uint64_t result = sub_1000362DC(v6);
          *uint64_t v21 = result;
          uint64_t v22 = v28;
        }
        unint64_t v23 = v31;
        if (v9 >= *(void *)(result + 16)) {
          goto LABEL_22;
        }
        uint64_t v24 = *v22;
        uint64_t result = (*v22)(result + v31 + v30, v33, v1);
        if (v13 >= *(void *)(*v21 + 16)) {
          goto LABEL_23;
        }
        uint64_t result = v24(*v21 + v23 + v19, v32, v1);
        unint64_t v6 = (char *)*v21;
        unint64_t v8 = v26;
      }
      --v7;
      if (v9++ == v8) {
        return result;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
  }
  return result;
}

void *sub_10003609C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3)) {
    goto LABEL_21;
  }
  if (!v5) {
    return _swiftEmptyArrayStorage;
  }
  if (v5 <= 0)
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
    if (v4 != a3)
    {
LABEL_10:
      if (v5 < 0) {
        goto LABEL_24;
      }
      uint64_t v14 = *(void *)(sub_100037E30() - 8);
      uint64_t v15 = (char *)v11 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
      uint64_t v16 = *(void *)(v14 + 72);
      unint64_t v17 = a2 + v16 * a3;
      uint64_t v18 = v16 * v5;
      uint64_t v19 = &v15[v18];
      unint64_t v20 = v17 + v18;
      if (v17 < (unint64_t)v19 && (unint64_t)v15 < v20) {
        goto LABEL_24;
      }
      swift_arrayInitWithCopy();
      return v11;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  sub_100003F3C(&qword_1000442E8);
  uint64_t v8 = *(void *)(sub_100037E30() - 8);
  uint64_t v9 = *(void *)(v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = (void *)swift_allocObject();
  size_t v12 = j__malloc_size(v11);
  if (v9)
  {
    if (v12 - v10 == 0x8000000000000000 && v9 == -1) {
      goto LABEL_23;
    }
    v11[2] = v5;
    v11[3] = 2 * ((uint64_t)(v12 - v10) / v9);
    if (v4 != a3) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = (void *)sub_1000385B0();
  __break(1u);
  return result;
}

uint64_t sub_1000362DC(void *a1)
{
  return sub_100035B9C(0, a1[2], 0, a1, &qword_1000442E8, (uint64_t (*)(void))&type metadata accessor for ExtractedItem);
}

uint64_t sub_100036320(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for TransparencyExtractor(uint64_t a1)
{
  return sub_10002A834(a1, qword_100044AB8);
}

uint64_t sub_100036388@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100033D84(a1, *(void **)(v2 + 16), a2);
}

uint64_t sub_1000363A4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000363DC(void *a1)
{
  sub_1000340F4(a1, v1);
}

uint64_t sub_1000363E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000363F4()
{
  return swift_release();
}

void sub_1000363FC(void *a1)
{
  sub_1000345C0(a1, v1);
}

uint64_t sub_100036404(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = v9 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = a2[2];
    *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
    *(_WORD *)(a1 + 25) = *(_WORD *)((char *)a2 + 25);
    *(void *)(a1 + 32) = a2[4];
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    uint64_t v7 = a2[6];
    if (v7 == 1)
    {
      long long v8 = *((_OWORD *)a2 + 4);
      *(_OWORD *)(v4 + 48) = *((_OWORD *)a2 + 3);
      *(_OWORD *)(v4 + 64) = v8;
      *(unsigned char *)(v4 + 80) = *((unsigned char *)a2 + 80);
    }
    else
    {
      uint64_t v10 = a2[7];
      *(void *)(v4 + 48) = v7;
      *(void *)(v4 + 56) = v10;
      *(unsigned char *)(v4 + 64) = *((unsigned char *)a2 + 64);
      *(void *)(v4 + 72) = a2[9];
      *(unsigned char *)(v4 + 80) = *((unsigned char *)a2 + 80);
      swift_bridgeObjectRetain();
    }
    uint64_t v11 = *(int *)(a3 + 20);
    size_t v12 = (void *)(v4 + v11);
    unint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_100037C20();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      uint64_t v16 = sub_100003F3C(&qword_1000440F0);
      memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
  }
  return v4;
}

uint64_t sub_1000365F8(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 48) != 1) {
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_100037C20();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t sub_1000366E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_WORD *)(a1 + 25) = *(_WORD *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(void *)(a2 + 48);
  if (v6 == 1)
  {
    long long v7 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v7;
    *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  }
  else
  {
    uint64_t v8 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = v6;
    *(void *)(a1 + 56) = v8;
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
    swift_bridgeObjectRetain();
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = sub_100037C20();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = sub_100003F3C(&qword_1000440F0);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v10, v11, v12);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  return a1;
}

uint64_t sub_100036888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(unsigned char *)(a1 + 26) = *(unsigned char *)(a2 + 26);
  uint64_t v6 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = a1 + 48;
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v10 = (long long *)(a2 + 48);
  uint64_t v9 = *(void *)(a2 + 48);
  if (v8 == 1)
  {
    if (v9 == 1)
    {
      long long v11 = *v10;
      long long v12 = *(_OWORD *)(a2 + 64);
      *(unsigned char *)(v7 + 32) = *(unsigned char *)(a2 + 80);
      *(_OWORD *)uint64_t v7 = v11;
      *(_OWORD *)(v7 + 16) = v12;
    }
    else
    {
      *(void *)(a1 + 48) = v9;
      uint64_t v15 = *(void *)(a2 + 56);
      *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
      *(void *)(a1 + 56) = v15;
      uint64_t v16 = *(void *)(a2 + 72);
      *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
      *(void *)(a1 + 72) = v16;
      swift_bridgeObjectRetain();
    }
  }
  else if (v9 == 1)
  {
    sub_100021A34(v7);
    char v13 = *((unsigned char *)v10 + 32);
    long long v14 = v10[1];
    *(_OWORD *)uint64_t v7 = *v10;
    *(_OWORD *)(v7 + 16) = v14;
    *(unsigned char *)(v7 + 32) = v13;
  }
  else
  {
    *(void *)(a1 + 48) = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v17 = *(void *)(a2 + 56);
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
    *(void *)(a1 + 56) = v17;
    uint64_t v18 = *(void *)(a2 + 72);
    *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
    *(void *)(a1 + 72) = v18;
  }
  uint64_t v19 = *(int *)(a3 + 20);
  unint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  uint64_t v22 = sub_100037C20();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v23 + 48);
  int v25 = v24(v20, 1, v22);
  int v26 = v24(v21, 1, v22);
  if (!v25)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v23 + 24))(v20, v21, v22);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v23 + 8))(v20, v22);
    goto LABEL_13;
  }
  if (v26)
  {
LABEL_13:
    uint64_t v27 = sub_100003F3C(&qword_1000440F0);
    memcpy(v20, v21, *(void *)(*(void *)(v27 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v23 + 16))(v20, v21, v22);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  return a1;
}

uint64_t sub_100036B08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  long long v5 = *(_OWORD *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  uint64_t v9 = sub_100037C20();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_100003F3C(&qword_1000440F0);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  return a1;
}

uint64_t sub_100036C34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_WORD *)(a1 + 25) = *(_WORD *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v6 = a1 + 48;
  uint64_t v8 = a2 + 48;
  uint64_t v7 = *(void *)(a2 + 48);
  if (*(void *)(a1 + 48) == 1) {
    goto LABEL_4;
  }
  if (v7 == 1)
  {
    sub_100021A34(v6);
LABEL_4:
    long long v9 = *(_OWORD *)(v8 + 16);
    *(_OWORD *)uint64_t v6 = *(_OWORD *)v8;
    *(_OWORD *)(v6 + 16) = v9;
    *(unsigned char *)(v6 + 32) = *(unsigned char *)(v8 + 32);
    goto LABEL_6;
  }
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
LABEL_6:
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = (void *)(a1 + v10);
  long long v12 = (void *)(a2 + v10);
  uint64_t v13 = sub_100037C20();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 40))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_11;
  }
  if (v17)
  {
LABEL_11:
    uint64_t v18 = sub_100003F3C(&qword_1000440F0);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 32))(v11, v12, v13);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

uint64_t sub_100036E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100036E68);
}

uint64_t sub_100036E68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483645)
  {
    unint64_t v4 = *(void *)(a1 + 48);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 - 1) & ~(((int)v4 - 1) >> 31);
  }
  else
  {
    uint64_t v8 = sub_100003F3C(&qword_1000440F0);
    long long v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100036F24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100036F38);
}

uint64_t sub_100036F38(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483645)
  {
    *(void *)(result + 48) = (a2 + 1);
  }
  else
  {
    uint64_t v7 = sub_100003F3C(&qword_1000440F0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_100036FE8()
{
}

void sub_100036FF4()
{
  if (!qword_1000447A8)
  {
    sub_100037C20();
    unint64_t v0 = sub_1000384A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000447A8);
    }
  }
}

uint64_t *sub_10003704C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v5 = a2[3];
    a1[2] = a2[2];
    a1[3] = v5;
    uint64_t v6 = a2[5];
    a1[4] = a2[4];
    a1[5] = v6;
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    a1[6] = a2[6];
    uint64_t v10 = sub_100037C20();
    uint64_t v11 = *(void *)(v10 - 8);
    long long v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12(v9, 1, v10))
    {
      uint64_t v13 = sub_100003F3C(&qword_1000440F0);
      memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
  }
  return v3;
}

uint64_t sub_1000371F0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_100037C20();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t sub_1000372D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v9 = sub_100037C20();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = sub_100003F3C(&qword_1000440F0);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  return a1;
}

void *sub_100037424(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100037C20();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = sub_100003F3C(&qword_1000440F0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t sub_100037604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (const void *)(a2 + v5);
  uint64_t v8 = sub_100037C20();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    uint64_t v10 = sub_100003F3C(&qword_1000440F0);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t sub_100037728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = sub_100037C20();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = sub_100003F3C(&qword_1000440F0);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t sub_1000378D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000378EC);
}

uint64_t sub_1000378EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_100003F3C(&qword_1000440F0);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_1000379AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000379C0);
}

uint64_t sub_1000379C0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = sub_100003F3C(&qword_1000440F0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_100037A6C()
{
}

void sub_100037A78()
{
  sub_100036FF4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_100037B10()
{
  return type metadata accessor for JSONEncoder.DateEncodingStrategy();
}

uint64_t sub_100037B20()
{
  return dispatch thunk of JSONEncoder.dateEncodingStrategy.setter();
}

uint64_t sub_100037B30()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_100037B40()
{
  return JSONEncoder.init()();
}

uint64_t sub_100037B50()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_100037B60()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100037B70()
{
  return URL.absoluteURL.getter();
}

uint64_t sub_100037B80()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_100037B90(Swift::Bool percentEncoded)
{
  return URL.path(percentEncoded:)(percentEncoded)._countAndFlagsBits;
}

uint64_t sub_100037BA0()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t sub_100037BB0()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_100037BC0()
{
  return type metadata accessor for URL();
}

NSData sub_100037BD0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100037BE0()
{
  return Date.timeIntervalSince(_:)();
}

NSDate sub_100037BF0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100037C00()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100037C10()
{
  return static Date.now.getter();
}

uint64_t sub_100037C20()
{
  return type metadata accessor for Date();
}

uint64_t sub_100037C30()
{
  return Locale.init(identifier:)();
}

NSLocale sub_100037C40()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_100037C50()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100037C60()
{
  return static Calendar.current.getter();
}

uint64_t sub_100037C70()
{
  return Calendar.timeZone.getter();
}

uint64_t sub_100037C80()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_100037C90()
{
  return Calendar.component(_:from:)();
}

uint64_t sub_100037CA0()
{
  return type metadata accessor for Calendar();
}

NSTimeZone sub_100037CB0()
{
  return TimeZone._bridgeToObjectiveC()();
}

uint64_t sub_100037CC0()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_100037CD0()
{
  return filterBySender(_:)();
}

uint64_t sub_100037CF0()
{
  return MessageExtractor.makeAsyncIterator()();
}

uint64_t sub_100037D00()
{
  return MessageExtractor.init(lastDays:maxMessages:maxLength:cleanupText:lastMessageDate:)();
}

uint64_t sub_100037D10()
{
  return type metadata accessor for MessageExtractor();
}

uint64_t sub_100037D20()
{
  return TokenGeneratorBase.init(modelIdentifier:)();
}

uint64_t sub_100037D30()
{
  return type metadata accessor for TokenGeneratorBase();
}

uint64_t sub_100037D40()
{
  return groupAndSortMessages(_:)();
}

uint64_t sub_100037D50()
{
  return convertSingleMessagesToConversations(_:)();
}

uint64_t sub_100037D60()
{
  return NLEmbedder.init(useRecognizer:)();
}

uint64_t sub_100037D70()
{
  return type metadata accessor for NLEmbedder();
}

uint64_t sub_100037D80()
{
  return EmbedderName.rawValue.getter();
}

uint64_t sub_100037D90()
{
  return type metadata accessor for EmbedderName();
}

uint64_t sub_100037DA0()
{
  return EmbeddingItem.sourceType.getter();
}

uint64_t sub_100037DB0()
{
  return EmbeddingItem.embeddingModel.getter();
}

uint64_t sub_100037DC0()
{
  return EmbeddingItem.init(itemId:embedding:embeddingModel:sourceType:)();
}

uint64_t sub_100037DD0()
{
  return EmbeddingItem.itemId.getter();
}

uint64_t sub_100037DE0()
{
  return EmbeddingItem.embedding.getter();
}

uint64_t sub_100037DF0()
{
  return type metadata accessor for EmbeddingItem();
}

uint64_t sub_100037E00()
{
  return ExtractedItem.text.getter();
}

uint64_t sub_100037E10()
{
  return ExtractedItem.init(itemId:text:)();
}

uint64_t sub_100037E20()
{
  return ExtractedItem.itemId.getter();
}

uint64_t sub_100037E30()
{
  return type metadata accessor for ExtractedItem();
}

uint64_t sub_100037E40()
{
  return MatrixNNScorer.init(_:)();
}

uint64_t sub_100037E60()
{
  return type metadata accessor for MADTextEmbedder();
}

uint64_t sub_100037E70()
{
  return type metadata accessor for PercentileScore();
}

uint64_t sub_100037E80()
{
  return ExtractedMessage.autoSubmitted.getter();
}

uint64_t sub_100037E90()
{
  return ExtractedMessage.body.getter();
}

uint64_t sub_100037EA0()
{
  return ExtractedMessage.date.getter();
}

uint64_t sub_100037EB0()
{
  return type metadata accessor for ExtractedMessage();
}

uint64_t sub_100037EC0()
{
  return AsyncMatrixSequence.init(reader:label:columnCount:)();
}

uint64_t sub_100037ED0()
{
  return type metadata accessor for AsyncMatrixSequence();
}

uint64_t sub_100037EE0()
{
  return type metadata accessor for InMemoryMatrixLoader();
}

uint64_t sub_100037EF0()
{
  return InMemoryMatrixLoader.init(_:columnCount:maxRows:)();
}

uint64_t sub_100037F10()
{
  return type metadata accessor for NLContextualEmbedder();
}

uint64_t sub_100037F20()
{
  return ExtractedConversation.conversationId.getter();
}

uint64_t sub_100037F30()
{
  return ExtractedConversation.conversationText.getter();
}

uint64_t sub_100037F40()
{
  return ExtractedConversation.messages.getter();
}

uint64_t sub_100037F50()
{
  return type metadata accessor for ExtractedConversation();
}

uint64_t sub_100037F60()
{
  return AsyncTransformedMatrixSequence.init(reader:label:columnCount:quantization:)();
}

uint64_t sub_100037F70()
{
  return calculatePercentilesOfMeanTopK(_:percentiles:)();
}

uint64_t sub_100037F80()
{
  return NNScore.topKScores.getter();
}

uint64_t sub_100037F90()
{
  return NNScore.topKIndices.getter();
}

uint64_t sub_100037FA0()
{
  return type metadata accessor for NNScore();
}

uint64_t sub_100037FB0()
{
  return dispatch thunk of Embedder.embeddingModel.getter();
}

uint64_t sub_100037FD0()
{
  return static AppExtension.main()();
}

uint64_t sub_100037FF0()
{
  return MLHostAsset.url.getter();
}

uint64_t sub_100038000()
{
  return type metadata accessor for MLHostAsset();
}

uint64_t sub_100038010()
{
  return dispatch thunk of LedgerClient.sendCustomTaskEvent<A>(state:context:)();
}

uint64_t sub_100038020()
{
  return LedgerClient.__allocating_init()();
}

uint64_t sub_100038030()
{
  return type metadata accessor for LedgerClient();
}

uint64_t sub_100038040()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t sub_100038050()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100038060()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100038090()
{
  return MLHostParameters.init(taskParameters:)();
}

uint64_t sub_1000380A0()
{
  return MLHostParameters.taskParameters.getter();
}

uint64_t sub_1000380B0()
{
  return MLHostParameters.systemParameters.getter();
}

uint64_t sub_1000380C0()
{
  return type metadata accessor for MLHostParameters();
}

uint64_t sub_1000380D0()
{
  return MLHostAssetParameters.assetSpecifier.getter();
}

uint64_t sub_1000380E0()
{
  return MLHostAssetParameters.assetType.getter();
}

uint64_t sub_1000380F0()
{
  return type metadata accessor for MLHostAssetParameters();
}

uint64_t sub_100038100()
{
  return MLHostExtensionContext.taskFolder.getter();
}

uint64_t sub_100038110()
{
  return MLHostExtensionContext.taskId.getter();
}

uint64_t sub_100038120()
{
  return MLHostSystemParameters.mobileAsset.getter();
}

uint64_t sub_100038130()
{
  return type metadata accessor for MLHostSystemParameters();
}

uint64_t sub_100038140()
{
  return type metadata accessor for Library.Streams.Zeolite.Ledger.Embedding();
}

uint64_t sub_100038150()
{
  return static StreamResource.source()();
}

uint64_t sub_100038160()
{
  return static StreamResource.publisher(useCase:bmOptions:)();
}

uint64_t sub_100038170()
{
  return ZeoliteEmbedding.sourceType.getter();
}

uint64_t sub_100038180()
{
  return ZeoliteEmbedding.sourceType.setter();
}

uint64_t sub_100038190()
{
  return ZeoliteEmbedding.itemID.getter();
}

uint64_t sub_1000381A0()
{
  return ZeoliteEmbedding.itemID.setter();
}

uint64_t sub_1000381B0()
{
  return ZeoliteEmbedding.modelID.getter();
}

uint64_t sub_1000381C0()
{
  return ZeoliteEmbedding.modelID.setter();
}

uint64_t sub_1000381D0()
{
  return ZeoliteEmbedding.itemDate.setter();
}

uint64_t sub_1000381E0()
{
  return ZeoliteEmbedding.contextID.setter();
}

uint64_t sub_1000381F0()
{
  return ZeoliteEmbedding.embedding.getter();
}

uint64_t sub_100038200()
{
  return ZeoliteEmbedding.embedding.setter();
}

uint64_t sub_100038210()
{
  return ZeoliteEmbedding.init()();
}

uint64_t sub_100038220()
{
  return type metadata accessor for ZeoliteEmbedding();
}

uint64_t sub_100038230()
{
  return dispatch thunk of Source.sendEvent(_:)();
}

uint64_t sub_100038240()
{
  return Logger.logObject.getter();
}

uint64_t sub_100038250()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100038260()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100038270()
{
  return dispatch thunk of PlanksReader.isCompressed(for:)();
}

uint64_t sub_100038280()
{
  return PlanksReader.init(filePath:)();
}

uint64_t sub_100038290()
{
  return type metadata accessor for PlanksReader();
}

uint64_t sub_1000382A0()
{
  return Publisher.sink(receiveCompletion:receiveValue:)();
}

NSDictionary sub_1000382B0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000382C0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000382D0()
{
  return Dictionary.description.getter();
}

uint64_t sub_1000382E0()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_1000382F0()
{
  return dispatch thunk of static Comparable.>= infix(_:_:)();
}

NSString sub_100038300()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100038310()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100038320()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_100038330()
{
  return String.hash(into:)();
}

void sub_100038340(Swift::String a1)
{
}

Swift::Int sub_100038350()
{
  return String.UTF8View._foreignCount()();
}

BOOL sub_100038360(Swift::String a1)
{
  return String.hasSuffix(_:)(a1);
}

uint64_t sub_100038370()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_100038380()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_100038390()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000383A0()
{
  return Array.description.getter();
}

uint64_t sub_1000383B0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000383C0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000383D0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000383E0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1000383F0()
{
  return type metadata accessor for CancellationError();
}

uint64_t sub_100038410()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100038420()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100038430()
{
  return static Task<>.isCancelled.getter();
}

NSNumber sub_100038440()
{
  return Float._bridgeToObjectiveC()();
}

NSNumber sub_100038450()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_100038460()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100038470()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100038480()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100038490()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_1000384A0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1000384B0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000384C0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000384D0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1000384E0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000384F0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100038500()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100038510()
{
  return static ContinuousClock.now.getter();
}

uint64_t sub_100038520()
{
  return ContinuousClock.Instant.duration(to:)();
}

uint64_t sub_100038530()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t sub_100038540()
{
  return dispatch thunk of _AnySequenceBox._makeIterator()();
}

uint64_t sub_100038550()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100038560()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100038570()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100038580()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100038590()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000385A0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000385B0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000385C0()
{
  return dispatch thunk of _AnyIteratorBoxBase.next()();
}

Swift::Int sub_1000385D0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_1000385E0()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_1000385F0()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_100038600()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_100038610()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_100038620()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100038630()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100038640()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100038650()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_100038660()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_100038670()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_100038680()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_100038690()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_1000386A0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000386B0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000386C0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000386D0()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_1000386E0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000386F0()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t sub_100038700()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100038710()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_100038720()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_100038730()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100038740()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100038750()
{
  return Error._code.getter();
}

uint64_t sub_100038760()
{
  return Error._domain.getter();
}

uint64_t sub_100038770()
{
  return Error._userInfo.getter();
}

uint64_t sub_100038780()
{
  return Hasher.init(_seed:)();
}

void sub_100038790(Swift::UInt a1)
{
}

Swift::Int sub_1000387A0()
{
  return Hasher._finalize()();
}

uint64_t sub_1000387B0()
{
  return Mirror.init(reflecting:)();
}

uint64_t sub_1000387C0()
{
  return Mirror.children.getter();
}

uint64_t sub_1000387D0()
{
  return type metadata accessor for Mirror();
}

uint64_t sub_1000387E0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_1000387F0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t sub_100038800()
{
  return Duration.description.getter();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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

uint64_t swift_projectBox()
{
  return _swift_projectBox();
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

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_task_isCurrentExecutor()
{
  return _swift_task_isCurrentExecutor();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return _swift_task_reportUnexpectedExecutor();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}