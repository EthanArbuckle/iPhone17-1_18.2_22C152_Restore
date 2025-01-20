unint64_t sub_100002508()
{
  unint64_t result;

  result = qword_100010040;
  if (!qword_100010040)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010040);
  }
  return result;
}

unint64_t sub_100002560()
{
  unint64_t result = qword_100010048;
  if (!qword_100010048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010048);
  }
  return result;
}

unint64_t sub_1000025B8()
{
  unint64_t result = qword_100010050[0];
  if (!qword_100010050[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100010050);
  }
  return result;
}

uint64_t sub_10000260C@<X0>(uint64_t a1@<X8>)
{
  v14[2] = a1;
  v14[0] = sub_100008610();
  uint64_t v1 = *(void *)(v14[0] - 8);
  ((void (*)(void))__chkstk_darwin)();
  v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008650();
  ((void (*)(void))__chkstk_darwin)();
  sub_100008680();
  ((void (*)(void))__chkstk_darwin)();
  sub_1000067E8(&qword_100010128);
  ((void (*)(void))__chkstk_darwin)();
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000067E8(&qword_100010130);
  ((void (*)(void))__chkstk_darwin)();
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100008620();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  v14[1] = (char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  sub_100008600();
  sub_100008600();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  sub_1000084F0();
  uint64_t v12 = sub_100008500();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v5, 0, 1, v12);
  sub_100008670();
  sub_100008640();
  (*(void (**)(char *, void, void))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v14[0]);
  sub_100008630();
  return sub_100008510();
}

uint64_t sub_1000044AC()
{
  sub_1000067E8(&qword_100010130);
  __chkstk_darwin();
  uint64_t v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100008620();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v4 = sub_1000085E0();
  sub_100006864(v4, qword_100010218);
  sub_10000682C(v4, (uint64_t)qword_100010218);
  sub_100008600();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  return sub_1000085D0();
}

uint64_t sub_10000461C(uint64_t a1)
{
  v5 = (uint64_t (*)(uint64_t))((char *)&dword_100010178 + dword_100010178);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_1000046C4;
  return v5(a1);
}

uint64_t sub_1000046C4(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_1000047C4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100010170 + dword_100010170);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100006934;
  return v4();
}

unint64_t sub_10000486C()
{
  unint64_t result = qword_100010068;
  if (!qword_100010068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010068);
  }
  return result;
}

uint64_t sub_1000048C0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100010160 + dword_100010160);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100004964;
  return v4();
}

uint64_t sub_100004964(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

unint64_t sub_100004A7C()
{
  unint64_t result = qword_100010078;
  if (!qword_100010078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010078);
  }
  return result;
}

unint64_t sub_100004AD4()
{
  unint64_t result = qword_100010080;
  if (!qword_100010080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010080);
  }
  return result;
}

unint64_t sub_100004B2C()
{
  unint64_t result = qword_100010088;
  if (!qword_100010088)
  {
    sub_100004BA0(qword_100010090);
    sub_100004AD4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010088);
  }
  return result;
}

uint64_t sub_100004BA0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004BE8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000486C();
  void *v5 = v2;
  v5[1] = sub_100004C9C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100004C9C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100004D90(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100010150 + dword_100010150);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100004E34;
  return v4();
}

uint64_t sub_100004E34(char a1)
{
  uint64_t v3 = *(unsigned char **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  unsigned char *v3 = a1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

unint64_t sub_100004F50()
{
  unint64_t result = qword_1000100A8;
  if (!qword_1000100A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100A8);
  }
  return result;
}

uint64_t sub_100004FA4()
{
  uint64_t v0 = sub_1000067E8(&qword_100010140);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000067E8(&qword_100010148);
  __chkstk_darwin();
  sub_1000025B8();
  sub_100008590();
  v6._object = (void *)0x800000010000A4F0;
  v6._countAndFlagsBits = 0xD000000000000039;
  sub_100008580(v6);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_100008570();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  sub_100008580(v7);
  return sub_1000085A0();
}

uint64_t sub_100005160()
{
  uint64_t v0 = qword_100010010;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10000519C()
{
  unint64_t result = qword_1000100B0;
  if (!qword_1000100B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100B0);
  }
  return result;
}

unint64_t sub_1000051F4()
{
  unint64_t result = qword_1000100B8;
  if (!qword_1000100B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100B8);
  }
  return result;
}

unint64_t sub_10000524C()
{
  unint64_t result = qword_1000100C0;
  if (!qword_1000100C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100C0);
  }
  return result;
}

unint64_t sub_1000052A4()
{
  unint64_t result = qword_1000100C8;
  if (!qword_1000100C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100C8);
  }
  return result;
}

uint64_t sub_1000052F8()
{
  sub_1000068C8();
  uint64_t v2 = sub_100008540();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000691C(v3, v0, v2, v1);
}

unint64_t sub_100005390()
{
  unint64_t result = qword_1000100D8;
  if (!qword_1000100D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100D8);
  }
  return result;
}

unint64_t sub_1000053E8()
{
  unint64_t result = qword_1000100E0;
  if (!qword_1000100E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100E0);
  }
  return result;
}

unint64_t sub_100005440()
{
  unint64_t result = qword_1000100E8;
  if (!qword_1000100E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100E8);
  }
  return result;
}

unint64_t sub_100005498()
{
  unint64_t result = qword_1000100F0;
  if (!qword_1000100F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100F0);
  }
  return result;
}

void sub_1000054EC(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000054F8@<X0>(uint64_t a1@<X8>)
{
  if (qword_100010020 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000085E0();
  uint64_t v3 = sub_10000682C(v2, (uint64_t)qword_100010218);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1000055A0()
{
  return sub_100005C30(&qword_1000100F8, &qword_100010100);
}

uint64_t sub_1000055DC(uint64_t a1)
{
  unint64_t v2 = sub_1000025B8();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000562C()
{
  unint64_t result = qword_100010108;
  if (!qword_100010108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010108);
  }
  return result;
}

uint64_t sub_100005680@<X0>(uint64_t a1@<X8>)
{
  return sub_10000260C(a1);
}

uint64_t sub_100005688(uint64_t a1)
{
  unint64_t v2 = sub_100005440();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000056D4(char a1)
{
  unint64_t result = 47;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x52414F4259454B2FLL;
      break;
    case 2:
      unint64_t result = 0xD000000000000011;
      break;
    case 3:
    case 5:
    case 16:
      unint64_t result = 0xD000000000000012;
      break;
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    case 6:
      unint64_t result = 0xD000000000000017;
      break;
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    case 8:
      unint64_t result = 0x79547472616D5323;
      break;
    case 9:
      unint64_t result = 0xD000000000000010;
      break;
    case 10:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 11:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 12:
      unint64_t result = 0xD000000000000014;
      break;
    case 13:
      unint64_t result = 0x654B6E6576695223;
      break;
    case 14:
      unint64_t result = 0xD000000000000017;
      break;
    case 15:
      unint64_t result = 0x6974617463694423;
      break;
    case 17:
      unint64_t result = 0xD000000000000017;
      break;
    case 18:
      unint64_t result = 0xD000000000000013;
      break;
    case 19:
      unint64_t result = 0xD000000000000019;
      break;
    case 20:
      unint64_t result = 0xD000000000000016;
      break;
    case 21:
      unint64_t result = 0xD000000000000026;
      break;
    case 22:
      unint64_t result = 0x697453776F685323;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000599C(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_1000056D4(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_1000056D4(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_1000086A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_100005A2C()
{
  unint64_t result = qword_100010110;
  if (!qword_100010110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010110);
  }
  return result;
}

Swift::Int sub_100005A80()
{
  char v1 = *v0;
  sub_1000086C0();
  sub_1000056D4(v1);
  sub_100008690();
  swift_bridgeObjectRelease();
  return sub_1000086D0();
}

uint64_t sub_100005AE4()
{
  sub_1000056D4(*v0);
  sub_100008690();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100005B38()
{
  char v1 = *v0;
  sub_1000086C0();
  sub_1000056D4(v1);
  sub_100008690();
  swift_bridgeObjectRelease();
  return sub_1000086D0();
}

uint64_t sub_100005B98@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006794();
  *a1 = result;
  return result;
}

unint64_t sub_100005BC8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1000056D4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100005BF4()
{
  return sub_100005C30(&qword_100010118, &qword_100010120);
}

uint64_t sub_100005C30(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100004BA0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100005C74(void *a1@<X8>)
{
  *a1 = &off_10000C930;
}

unint64_t sub_100005C84()
{
  return sub_1000056D4(*v0);
}

uint64_t sub_100005C8C@<X0>(unsigned char *a1@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_100006794();
  *a1 = result;
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for KeyboardSettingsDestination(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_100005CEC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100005CF4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for KeyboardSettingsDestination()
{
  return &type metadata for KeyboardSettingsDestination;
}

uint64_t _s25KeyboardSettingsExtension27KeyboardSettingsDestinationOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEA) {
    goto LABEL_17;
  }
  if (a2 + 22 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 22) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 22;
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
      return (*a1 | (v4 << 8)) - 22;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 22;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x17;
  int v8 = v6 - 23;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s25KeyboardSettingsExtension27KeyboardSettingsDestinationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 22 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 22) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE9)
  {
    unsigned int v6 = ((a2 - 234) >> 8) + 1;
    *uint64_t result = a2 + 22;
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
        JUMPOUT(0x100005E68);
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
          *uint64_t result = a2 + 22;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for KeyboardSettingsDeepLink()
{
  return &type metadata for KeyboardSettingsDeepLink;
}

ValueMetadata *type metadata accessor for KeyboardSettingsDeepLink.AvailableKeyboardDestinationQuery()
{
  return &type metadata for KeyboardSettingsDeepLink.AvailableKeyboardDestinationQuery;
}

char *sub_100005EB0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100005EF0(a1, a2, a3, *v3);
  char *v3 = result;
  return result;
}

char *sub_100005ED0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100005FDC(a1, a2, a3, *v3);
  char *v3 = result;
  return result;
}

char *sub_100005EF0(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000067E8(&qword_100010168);
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
  v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

char *sub_100005FDC(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000067E8(&qword_100010158);
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
  v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_1000060C8()
{
  return _swift_task_switch(sub_1000060E4, 0, 0);
}

uint64_t sub_1000060E4()
{
  char v1 = sub_100006224((uint64_t)&off_10000C930);
  int64_t v2 = v1[2];
  if (v2)
  {
    sub_100005EB0(0, v2, 0);
    uint64_t v3 = 0;
    uint64_t v4 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v5 = *((unsigned char *)v1 + v3 + 32);
      unint64_t v6 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v4 + v3 >= v6 >> 1) {
        sub_100005EB0((char *)(v6 > 1), v4 + v3 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v4 + v3 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v4 + v3++ + 32) = v5;
    }
    while (v2 != v3);
  }
  swift_bridgeObjectRelease();
  int64_t v7 = *(uint64_t (**)(void *))(v0 + 8);
  return v7(&_swiftEmptyArrayStorage);
}

void *sub_100006224(uint64_t a1)
{
  unint64_t v17 = *(void *)(a1 + 16);
  if (v17)
  {
    unint64_t v1 = 0;
    uint64_t v16 = a1 + 32;
LABEL_3:
    uint64_t v2 = 0;
    uint64_t v3 = v16;
    unint64_t v4 = v17;
    if (v1 <= v17) {
      unint64_t v5 = v17;
    }
    else {
      unint64_t v5 = v1;
    }
    unint64_t v6 = v1 - v5;
    while (2)
    {
      if (v6 + v2)
      {
        char v7 = *(unsigned char *)(v3 + v1);
        switch(v7)
        {
          case 2:
          case 3:
          case 9:
            id v8 = [self currentDevice];
            id v9 = [v8 userInterfaceIdiom];

            if (v9 == (id)1) {
              goto LABEL_14;
            }
            goto LABEL_8;
          case 12:
            id v10 = [self currentDevice];
            id v11 = [v10 userInterfaceIdiom];

            if (!v11) {
              goto LABEL_14;
            }
            goto LABEL_8;
          case 13:
            if (UIKeyboardDeviceSupportsSplit()) {
              goto LABEL_14;
            }
LABEL_8:
            ++v2;
            ++v3;
            if (v1 != --v4) {
              continue;
            }
            return &_swiftEmptyArrayStorage;
          default:
LABEL_14:
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              sub_100005ED0(0, *((void *)&_swiftEmptyArrayStorage + 2) + 1, 1);
            }
            unint64_t v13 = *((void *)&_swiftEmptyArrayStorage + 2);
            unint64_t v12 = *((void *)&_swiftEmptyArrayStorage + 3);
            if (v13 >= v12 >> 1) {
              sub_100005ED0((char *)(v12 > 1), v13 + 1, 1);
            }
            unint64_t v14 = v1 + 1;
            v1 += 1 + v2;
            *((void *)&_swiftEmptyArrayStorage + 2) = v13 + 1;
            *((unsigned char *)&_swiftEmptyArrayStorage + v13 + 32) = v7;
            if (v14 == v4) {
              return &_swiftEmptyArrayStorage;
            }
            goto LABEL_3;
        }
      }
      break;
    }
    __break(1u);
    JUMPOUT(0x1000063FCLL);
  }
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100006458(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100006478, 0, 0);
}

uint64_t sub_100006478()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  uint64_t v2 = sub_100006224(v1);
  swift_bridgeObjectRelease();
  int64_t v3 = v2[2];
  if (v3)
  {
    sub_100005EB0(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v6 = *((unsigned char *)v2 + v4 + 32);
      unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v5 + v4 >= v7 >> 1) {
        sub_100005EB0((char *)(v7 > 1), v5 + v4 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v5 + v4 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v5 + v4++ + 32) = v6;
    }
    while (v3 != v4);
  }
  swift_bridgeObjectRelease();
  id v8 = *(uint64_t (**)(void *))(v0 + 8);
  return v8(&_swiftEmptyArrayStorage);
}

uint64_t sub_1000065C4()
{
  return _swift_task_switch(sub_1000065E0, 0, 0);
}

uint64_t sub_1000065E0()
{
  uint64_t v1 = sub_100006224((uint64_t)&off_10000C930);
  if (v1[2]) {
    uint64_t v2 = *((unsigned __int8 *)v1 + 32);
  }
  else {
    uint64_t v2 = 23;
  }
  swift_bridgeObjectRelease();
  int64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_10000666C()
{
  return _swift_task_switch(sub_100006688, 0, 0);
}

uint64_t sub_100006688()
{
  sub_100005EB0(0, 23, 0);
  uint64_t v1 = 0;
  uint64_t v2 = &_swiftEmptyArrayStorage;
  uint64_t v3 = *((void *)&_swiftEmptyArrayStorage + 2);
  do
  {
    char v4 = *((unsigned char *)&off_10000C930 + v1 + 32);
    id v8 = v2;
    unint64_t v5 = v2[3];
    if (v3 + v1 >= v5 >> 1)
    {
      sub_100005EB0((char *)(v5 > 1), v3 + v1 + 1, 1);
      uint64_t v2 = v8;
    }
    v2[2] = v3 + v1 + 1;
    *((unsigned char *)v2 + v3 + v1++ + 32) = v4;
  }
  while (v1 != 23);
  char v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100006794()
{
  unint64_t v0 = sub_1000086B0();
  swift_bridgeObjectRelease();
  if (v0 >= 0x17) {
    return 23;
  }
  else {
    return v0;
  }
}

uint64_t sub_1000067E8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000682C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100006864(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_1000068C8()
{
  unint64_t result = qword_100010138;
  if (!qword_100010138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010138);
  }
  return result;
}

uint64_t sub_10000691C(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100006938(uint64_t a1)
{
  unint64_t v2 = sub_100006A88();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000069E0()
{
  unint64_t result = qword_100010180;
  if (!qword_100010180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010180);
  }
  return result;
}

uint64_t sub_100006A38()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100006A88()
{
  unint64_t result = qword_100010188;
  if (!qword_100010188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010188);
  }
  return result;
}

ValueMetadata *type metadata accessor for KeyboardSettingsExtensionExtension()
{
  return &type metadata for KeyboardSettingsExtensionExtension;
}

uint64_t sub_100006AEC()
{
  uint64_t v0 = sub_1000067E8(&qword_1000101B8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000067E8(&qword_1000101C0);
  __chkstk_darwin(v4);
  sub_1000075C8();
  sub_100008470();
  v10._countAndFlagsBits = 0x206E65704FLL;
  v10._object = (void *)0xE500000000000000;
  sub_100008460(v10);
  swift_getKeyPath();
  sub_100004AD4();
  sub_1000083C0();
  swift_release();
  sub_100008450();
  swift_release();
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  sub_100008460(v11);
  sub_100008480();
  uint64_t v5 = sub_1000083E0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_1000067E8(&qword_1000101C8);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10000B580;
  *(void *)(v6 + 32) = v5;
  uint64_t v7 = sub_1000083D0();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_100006D20()
{
  uint64_t v0 = sub_100008440();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100004AD4();
  sub_1000083C0();
  swift_release();
  sub_1000075C8();
  sub_100008430();
  uint64_t v4 = sub_100008420();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_1000067E8(&qword_1000101B0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10000B580;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100008410();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100006E88()
{
  uint64_t v25 = sub_100008400();
  uint64_t v24 = sub_100008400();
  uint64_t v23 = sub_100008400();
  uint64_t v22 = sub_100008400();
  uint64_t v21 = sub_100008400();
  uint64_t v20 = sub_100008400();
  uint64_t v19 = sub_100008400();
  uint64_t v18 = sub_100008400();
  uint64_t v17 = sub_100008400();
  uint64_t v16 = sub_100008400();
  uint64_t v15 = sub_100008400();
  uint64_t v14 = sub_100008400();
  uint64_t v13 = sub_100008400();
  uint64_t v12 = sub_100008400();
  uint64_t v0 = sub_100008400();
  uint64_t v1 = sub_100008400();
  uint64_t v2 = sub_100008400();
  uint64_t v3 = sub_100008400();
  uint64_t v4 = sub_100008400();
  uint64_t v5 = sub_100008400();
  uint64_t v6 = sub_100008400();
  uint64_t v7 = sub_100008400();
  uint64_t v8 = sub_100008400();
  sub_1000067E8(&qword_1000101A0);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10000B590;
  *(void *)(v9 + 32) = v25;
  *(void *)(v9 + 40) = v24;
  *(void *)(v9 + 48) = v23;
  *(void *)(v9 + 56) = v22;
  *(void *)(v9 + 64) = v21;
  *(void *)(v9 + 72) = v20;
  *(void *)(v9 + 80) = v19;
  *(void *)(v9 + 88) = v18;
  *(void *)(v9 + 96) = v17;
  *(void *)(v9 + 104) = v16;
  *(void *)(v9 + 112) = v15;
  *(void *)(v9 + 120) = v14;
  *(void *)(v9 + 128) = v13;
  *(void *)(v9 + 136) = v12;
  *(void *)(v9 + 144) = v0;
  *(void *)(v9 + 152) = v1;
  *(void *)(v9 + 160) = v2;
  *(void *)(v9 + 168) = v3;
  *(void *)(v9 + 176) = v4;
  *(void *)(v9 + 184) = v5;
  *(void *)(v9 + 192) = v6;
  *(void *)(v9 + 200) = v7;
  *(void *)(v9 + 208) = v8;
  uint64_t v10 = sub_1000083F0();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10000721C()
{
  uint64_t v0 = sub_100008400();
  uint64_t v1 = sub_100008400();
  uint64_t v2 = sub_100008400();
  uint64_t v3 = sub_100008400();
  sub_1000067E8(&qword_1000101A0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10000B5A0;
  *(void *)(v4 + 32) = v0;
  *(void *)(v4 + 40) = v1;
  *(void *)(v4 + 48) = v2;
  *(void *)(v4 + 56) = v3;
  uint64_t v5 = sub_1000083F0();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100007320()
{
  uint64_t v0 = sub_1000084B0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_100007F00();
  sub_1000075C8();
  sub_1000084C0();
  uint64_t v4 = sub_1000084A0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_1000067E8(&qword_1000101A8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10000B580;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100008490();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100007480()
{
  uint64_t v0 = sub_1000083B0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000075C8();
  sub_1000083A0();
  uint64_t v4 = sub_100008390();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_1000067E8(&qword_100010198);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10000B580;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100008380();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for KeyboardSettingsAssistantIntents()
{
  return &type metadata for KeyboardSettingsAssistantIntents;
}

unint64_t sub_1000075C8()
{
  unint64_t result = qword_100010190;
  if (!qword_100010190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010190);
  }
  return result;
}

uint64_t sub_10000761C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100008350();
  *a1 = v3;
  return result;
}

uint64_t sub_100007658()
{
  return sub_100008360();
}

unint64_t sub_100007694()
{
  unint64_t result = qword_1000101D0;
  if (!qword_1000101D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101D0);
  }
  return result;
}

uint64_t sub_1000076E8()
{
  sub_100008350();
  return v1;
}

uint64_t sub_10000771C()
{
  uint64_t v0 = sub_100008620();
  sub_100006864(v0, qword_100010230);
  sub_10000682C(v0, (uint64_t)qword_100010230);
  return sub_100008600();
}

uint64_t sub_100007780@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100008350();
  *a1 = v3;
  return result;
}

uint64_t sub_1000077BC()
{
  return sub_100008360();
}

void (*sub_1000077F4(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100008340();
  return sub_100007850;
}

void sub_100007850(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_1000078A0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000081E8();
  unint64_t v5 = sub_1000068C8();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100007918()
{
  unint64_t result = qword_1000101D8;
  if (!qword_1000101D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101D8);
  }
  return result;
}

unint64_t sub_100007970()
{
  unint64_t result = qword_1000101E0;
  if (!qword_1000101E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101E0);
  }
  return result;
}

unint64_t sub_1000079C8()
{
  unint64_t result = qword_1000101E8;
  if (!qword_1000101E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101E8);
  }
  return result;
}

uint64_t sub_100007A1C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100007A6C@<X0>(uint64_t a1@<X8>)
{
  if (qword_100010028 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008620();
  uint64_t v3 = sub_10000682C(v2, (uint64_t)qword_100010230);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100007B14()
{
  return 0;
}

uint64_t sub_100007B20()
{
  return 1;
}

uint64_t sub_100007B2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000067E8(&qword_100010130);
  __chkstk_darwin(v2 - 8);
  unint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100008620();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_100008600();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  sub_1000084E0();
  uint64_t v7 = sub_1000084D0();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a1, 0, 1, v7);
}

uint64_t sub_100007CB8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_1000081E8();
  unint64_t v6 = sub_10000823C();
  unint64_t v7 = sub_1000068C8();
  *unint64_t v4 = v2;
  v4[1] = sub_100007D84;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100007D84()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    unint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_100007E8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100007F00();
  *a1 = result;
  return result;
}

uint64_t sub_100007EB4(uint64_t a1)
{
  unint64_t v2 = sub_1000075C8();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenKeyboardSettingsDeepLink()
{
  return &type metadata for OpenKeyboardSettingsDeepLink;
}

uint64_t sub_100007F00()
{
  uint64_t v17 = sub_1000085B0();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  unint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000067E8(&qword_1000101F8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_1000067E8(&qword_100010130);
  __chkstk_darwin(v9 - 8);
  Swift::String v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100008620();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_1000067E8(&qword_100010200);
  sub_100008600();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 23;
  uint64_t v14 = sub_100008330();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_1000025B8();
  return sub_100008370();
}

unint64_t sub_1000081E8()
{
  unint64_t result = qword_100010208;
  if (!qword_100010208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010208);
  }
  return result;
}

unint64_t sub_10000823C()
{
  unint64_t result = qword_100010210;
  if (!qword_100010210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010210);
  }
  return result;
}

uint64_t sub_100008290()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_1000082A0()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_1000082B0()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_1000082C0()
{
  return static AppIntentInternal.attributionBundleIdentifier.getter();
}

uint64_t sub_1000082E0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000082F0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100008330()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100008340()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100008350()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100008360()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100008370()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100008380()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
}

uint64_t sub_100008390()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)();
}

uint64_t sub_1000083A0()
{
  return _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)();
}

uint64_t sub_1000083B0()
{
  return type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases();
}

uint64_t sub_1000083C0()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_1000083D0()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_1000083E0()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_1000083F0()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_100008400()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_100008410()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_100008420()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_100008430()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_100008440()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_100008450()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_100008460(Swift::String a1)
{
}

uint64_t sub_100008470()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100008480()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t sub_100008490()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_1000084A0()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_1000084B0()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_1000084C0()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_1000084D0()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_1000084E0()
{
  return IntentDescription.init(_:categoryName:searchKeywords:)();
}

uint64_t sub_1000084F0()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100008500()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100008510()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100008520()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_100008530()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_100008540()
{
  return URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_100008570()
{
  return EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_100008580(Swift::String a1)
{
}

uint64_t sub_100008590()
{
  return EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000085A0()
{
  return EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_1000085B0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_1000085C0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_1000085D0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_1000085E0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100008600()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100008610()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100008620()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100008630()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100008640()
{
  return static Locale.current.getter();
}

uint64_t sub_100008650()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100008660()
{
  return static AppExtension.main()();
}

uint64_t sub_100008670()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100008680()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_100008690()
{
  return String.hash(into:)();
}

uint64_t sub_1000086A0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000086B0()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_1000086C0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1000086D0()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t UIKeyboardDeviceSupportsSplit()
{
  return _UIKeyboardDeviceSupportsSplit();
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

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
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