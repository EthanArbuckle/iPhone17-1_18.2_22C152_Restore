uint64_t sub_100002188()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  sub_100005054(&qword_10000C0A0);
  __chkstk_darwin();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_100006080();
  v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v4 = sub_100006050();
  sub_1000050D0(v4, qword_10000C158);
  sub_100005098(v4, (uint64_t)qword_10000C158);
  sub_100006060();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  return sub_100006040();
}

unint64_t sub_1000022F4(uint64_t a1)
{
  uint64_t v2 = sub_100005054(&qword_10000C0B0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005054(&qword_10000C0C0);
  uint64_t v6 = sub_100006100();
  v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_10000519C(v12, (uint64_t)v5, &qword_10000C0B0);
    char v14 = *v5;
    unint64_t result = sub_1000037C8(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100005FC0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
    v12 += v13;
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

unint64_t sub_1000024EC(uint64_t a1)
{
  uint64_t v2 = sub_100005054(&qword_10000C0E0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005054(&qword_10000C0E8);
  uint64_t v6 = sub_100006100();
  v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_10000519C(v12, (uint64_t)v5, &qword_10000C0E0);
    char v14 = *v5;
    unint64_t result = sub_1000037C8(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100005054(&qword_10000C0F0);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
    v12 += v13;
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

uint64_t sub_1000026EC()
{
  uint64_t v0 = sub_100005054(&qword_10000C0D0);
  sub_1000050D0(v0, qword_10000C170);
  sub_100005098(v0, (uint64_t)qword_10000C170);
  sub_100005054(&qword_10000C0D8);
  uint64_t v1 = *(void *)(sub_100005054(&qword_10000C0E0) - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100006260;
  unint64_t v5 = v4 + v3;
  *(unsigned char *)(v4 + v3) = 0;
  sub_100002E58();
  sub_100005FD0();
  *(unsigned char *)(v5 + v2) = 1;
  sub_100005FD0();
  *(unsigned char *)(v5 + 2 * v2) = 2;
  sub_100005FD0();
  *(unsigned char *)(v5 + 3 * v2) = 3;
  sub_100005FD0();
  *(unsigned char *)(v5 + 4 * v2) = 4;
  sub_100005FD0();
  *(unsigned char *)(v5 + 5 * v2) = 5;
  sub_100005FD0();
  *(unsigned char *)(v5 + 6 * v2) = 6;
  sub_100005FD0();
  *(unsigned char *)(v5 + 7 * v2) = 7;
  sub_100005FD0();
  *(unsigned char *)(v5 + 8 * v2) = 8;
  sub_100005FD0();
  *(unsigned char *)(v5 + 9 * v2) = 9;
  sub_100005FD0();
  *(unsigned char *)(v5 + 10 * v2) = 10;
  sub_100005FD0();
  sub_1000024EC(v4);
  return sub_100005FE0();
}

unint64_t sub_100002A78(char a1)
{
  unint64_t result = 1953460082;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0x75676E614C646461;
      break;
    case 3:
      unint64_t result = 0x6E6F69676572;
      break;
    case 4:
      unint64_t result = 0x7261646E656C6163;
      break;
    case 5:
      unint64_t result = 0x74617265706D6574;
      break;
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    case 7:
      unint64_t result = 0x7961447473726966;
      break;
    case 8:
      unint64_t result = 0x6D726F4665746164;
      break;
    case 9:
      unint64_t result = 0x6F467265626D756ELL;
      break;
    case 10:
      unint64_t result = 0x747865546576696CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100002BFC(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_100002A78(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_100002A78(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100006120();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_100002C8C()
{
  unint64_t result = qword_10000C018;
  if (!qword_10000C018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }
  return result;
}

Swift::Int sub_100002CE0()
{
  char v1 = *v0;
  sub_100006130();
  sub_100002A78(v1);
  sub_1000060F0();
  swift_bridgeObjectRelease();
  return sub_100006140();
}

uint64_t sub_100002D44()
{
  sub_100002A78(*v0);
  sub_1000060F0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100002D98()
{
  char v1 = *v0;
  sub_100006130();
  sub_100002A78(v1);
  sub_1000060F0();
  swift_bridgeObjectRelease();
  return sub_100006140();
}

uint64_t sub_100002DF8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100005200(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_100002E28@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100002A78(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100002E58()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

unint64_t sub_100002EB0()
{
  unint64_t result = qword_10000C028;
  if (!qword_10000C028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C028);
  }
  return result;
}

uint64_t sub_100002F04@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C008 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005054(&qword_10000C0D0);
  uint64_t v3 = sub_100005098(v2, (uint64_t)qword_10000C170);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100002FB4()
{
  unint64_t result = qword_10000C030;
  if (!qword_10000C030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }
  return result;
}

unint64_t sub_10000300C()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

unint64_t sub_100003064()
{
  unint64_t result = qword_10000C040;
  if (!qword_10000C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

void *sub_1000030B8()
{
  return &protocol witness table for String;
}

uint64_t sub_1000030C4()
{
  sub_100005134();
  uint64_t v2 = sub_100005F80();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100005188(v3, v0, v2, v1);
}

unint64_t sub_10000315C()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

unint64_t sub_1000031B4()
{
  unint64_t result = qword_10000C058;
  if (!qword_10000C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

unint64_t sub_10000320C()
{
  unint64_t result = qword_10000C060;
  if (!qword_10000C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

unint64_t sub_100003264()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

uint64_t sub_1000032BC@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C000 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006050();
  uint64_t v3 = sub_100005098(v2, (uint64_t)qword_10000C158);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100003364()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000033B4(uint64_t a1)
{
  unint64_t v2 = sub_100002E58();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100003404()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

unint64_t sub_10000345C()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

unint64_t sub_1000034B4()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

uint64_t sub_10000350C(uint64_t a1)
{
  unint64_t v2 = sub_100003264();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000355C()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    sub_1000035B8(&qword_10000C090);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

uint64_t sub_1000035B8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100003600(void *a1@<X8>)
{
  *a1 = &off_100008780;
}

unsigned char *initializeBufferWithCopyOfBuffer for InternationalSettingsDeepLink(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for InternationalSettingsDeepLink(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
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
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for InternationalSettingsDeepLink(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *uint64_t result = a2 + 10;
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
        JUMPOUT(0x10000377CLL);
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
          *uint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

uint64_t sub_1000037A4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000037B0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for InternationalSettingsDeepLink()
{
  return &type metadata for InternationalSettingsDeepLink;
}

unint64_t sub_1000037C8(char a1)
{
  sub_100006130();
  sub_100002A78(a1);
  sub_1000060F0();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_100006140();

  return sub_100003850(a1, v2);
}

unint64_t sub_100003850(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xE400000000000000;
      unint64_t v8 = 1953460082;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v8 = 0xD000000000000012;
          unint64_t v7 = 0x8000000100006830;
          break;
        case 2:
          unint64_t v8 = 0x75676E614C646461;
          unint64_t v7 = 0xEB00000000656761;
          break;
        case 3:
          unint64_t v7 = 0xE600000000000000;
          unint64_t v8 = 0x6E6F69676572;
          break;
        case 4:
          unint64_t v7 = 0xE800000000000000;
          unint64_t v8 = 0x7261646E656C6163;
          break;
        case 5:
          unint64_t v7 = 0xEB00000000657275;
          unint64_t v8 = 0x74617265706D6574;
          break;
        case 6:
          unint64_t v7 = 0x8000000100006870;
          unint64_t v8 = 0xD000000000000011;
          break;
        case 7:
          unint64_t v8 = 0x7961447473726966;
          unint64_t v7 = 0xEE006B656557664FLL;
          break;
        case 8:
          unint64_t v8 = 0x6D726F4665746164;
          unint64_t v7 = 0xEA00000000007461;
          break;
        case 9:
          unint64_t v8 = 0x6F467265626D756ELL;
          unint64_t v7 = 0xEC00000074616D72;
          break;
        case 0xA:
          unint64_t v7 = 0xE800000000000000;
          unint64_t v8 = 0x747865546576696CLL;
          break;
        default:
          break;
      }
      unint64_t v9 = 0xE400000000000000;
      uint64_t v10 = 1953460082;
      switch(v6)
      {
        case 1:
          unint64_t v9 = 0x8000000100006830;
          if (v8 == 0xD000000000000012) {
            goto LABEL_33;
          }
          goto LABEL_34;
        case 2:
          unint64_t v9 = 0xEB00000000656761;
          if (v8 != 0x75676E614C646461) {
            goto LABEL_34;
          }
          goto LABEL_33;
        case 3:
          unint64_t v9 = 0xE600000000000000;
          if (v8 != 0x6E6F69676572) {
            goto LABEL_34;
          }
          goto LABEL_33;
        case 4:
          unint64_t v9 = 0xE800000000000000;
          if (v8 != 0x7261646E656C6163) {
            goto LABEL_34;
          }
          goto LABEL_33;
        case 5:
          unint64_t v9 = 0xEB00000000657275;
          if (v8 != 0x74617265706D6574) {
            goto LABEL_34;
          }
          goto LABEL_33;
        case 6:
          unint64_t v9 = 0x8000000100006870;
          if (v8 != 0xD000000000000011) {
            goto LABEL_34;
          }
          goto LABEL_33;
        case 7:
          unint64_t v9 = 0xEE006B656557664FLL;
          if (v8 != 0x7961447473726966) {
            goto LABEL_34;
          }
          goto LABEL_33;
        case 8:
          unint64_t v9 = 0xEA00000000007461;
          if (v8 != 0x6D726F4665746164) {
            goto LABEL_34;
          }
          goto LABEL_33;
        case 9:
          uint64_t v10 = 0x6F467265626D756ELL;
          unint64_t v9 = 0xEC00000074616D72;
          goto LABEL_32;
        case 10:
          unint64_t v9 = 0xE800000000000000;
          if (v8 != 0x747865546576696CLL) {
            goto LABEL_34;
          }
          goto LABEL_33;
        default:
LABEL_32:
          if (v8 != v10) {
            goto LABEL_34;
          }
LABEL_33:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_34:
          char v11 = sub_100006120();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v11) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_100003C60()
{
  uint64_t v90 = sub_100006070();
  uint64_t v98 = *(void *)(v90 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v95 = (char *)&v72 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000060B0();
  ((void (*)(void))__chkstk_darwin)();
  v84 = (char *)&v72 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000060E0();
  ((void (*)(void))__chkstk_darwin)();
  v97 = (char *)&v72 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005054(&qword_10000C098);
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v4 = (char *)&v72 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005054(&qword_10000C0A0);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = v6;
  uint64_t v7 = sub_100006080();
  uint64_t v96 = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  v88 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v72 - v11;
  sub_100005054(&qword_10000C0A8);
  uint64_t v13 = sub_100005054(&qword_10000C0B0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v91 = *(void *)(v14 + 72);
  uint64_t v15 = v13 - 8;
  unint64_t v16 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = swift_allocObject();
  uint64_t v75 = v17;
  *(_OWORD *)(v17 + 16) = xmmword_100006260;
  unint64_t v85 = v17 + v16;
  uint64_t v18 = *(int *)(v15 + 56);
  uint64_t v19 = v15;
  uint64_t v80 = v15;
  unint64_t v93 = v17 + v16 + v18;
  *(unsigned char *)(v17 + v16) = 0;
  uint64_t v20 = v12;
  sub_100006060();
  v79 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  uint64_t v83 = v8 + 56;
  v79(v6, 1, 1, v7);
  unint64_t v89 = 0x80000001000068E0;
  BOOL v21 = v4;
  sub_100005F90();
  uint64_t v78 = sub_100005FA0();
  uint64_t v22 = *(void *)(v78 - 8);
  v23 = *(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56);
  uint64_t v86 = v22 + 56;
  v23(v4, 0, 1, v78);
  v81 = v23;
  sub_1000060D0();
  sub_1000060A0();
  unsigned int v92 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v94 = *(void (**)(char *))(v98 + 104);
  v98 += 104;
  uint64_t v24 = v90;
  v94(v95);
  sub_100006090();
  v87 = v20;
  v25 = v82;
  sub_100005FB0();
  uint64_t v76 = v85 + v91 + *(int *)(v19 + 56);
  *(unsigned char *)(v85 + v91) = 1;
  sub_100006060();
  unint64_t v93 = 0x8000000100006A10;
  sub_100006060();
  v26 = v79;
  v79(v25, 0, 1, v96);
  v77 = v21;
  sub_100005F90();
  uint64_t v27 = v78;
  v23(v21, 0, 1, v78);
  sub_1000060D0();
  sub_1000060A0();
  uint64_t v28 = v24;
  v29 = v94;
  ((void (*)(char *, void, uint64_t))v94)(v95, v92, v28);
  sub_100006090();
  v30 = v77;
  sub_100005FB0();
  uint64_t v31 = v91;
  uint64_t v76 = 2 * v91;
  v32 = (unsigned char *)(v85 + 2 * v91);
  unint64_t v74 = (unint64_t)&v32[*(int *)(v80 + 56)];
  unsigned char *v32 = 2;
  sub_100006060();
  sub_100006060();
  v26(v25, 0, 1, v96);
  sub_100005F90();
  v81(v30, 0, 1, v27);
  sub_1000060D0();
  sub_1000060A0();
  uint64_t v33 = v90;
  ((void (*)(char *, void, uint64_t))v29)(v95, v92, v90);
  sub_100006090();
  v34 = v82;
  sub_100005FB0();
  unint64_t v35 = v85;
  v36 = (unsigned char *)(v85 + v76 + v31);
  uint64_t v37 = v80;
  uint64_t v76 = (uint64_t)&v36[*(int *)(v80 + 56)];
  unsigned char *v36 = 3;
  sub_100006060();
  sub_100006060();
  uint64_t v38 = v96;
  v79(v34, 0, 1, v96);
  sub_100005F90();
  v39 = v30;
  uint64_t v40 = v27;
  v81(v39, 0, 1, v27);
  sub_1000060D0();
  sub_1000060A0();
  ((void (*)(char *, void, uint64_t))v94)(v95, v92, v33);
  sub_100006090();
  v41 = v82;
  v42 = v77;
  sub_100005FB0();
  uint64_t v73 = 4 * v91;
  v43 = (unsigned char *)(v35 + 4 * v91);
  unint64_t v72 = (unint64_t)&v43[*(int *)(v37 + 56)];
  unsigned char *v43 = 4;
  sub_100006060();
  sub_100006060();
  v44 = v79;
  v79(v41, 0, 1, v38);
  sub_100005F90();
  v45 = v81;
  v81(v42, 0, 1, v40);
  uint64_t v76 = 0xD0000000000000A3;
  unint64_t v74 = 0x8000000100006D10;
  sub_1000060D0();
  sub_1000060A0();
  v46 = v95;
  ((void (*)(char *, void, uint64_t))v94)(v95, v92, v90);
  sub_100006090();
  v47 = v82;
  sub_100005FB0();
  v48 = (unsigned char *)(v85 + v73 + v91);
  uint64_t v73 = (uint64_t)&v48[*(int *)(v80 + 56)];
  unsigned char *v48 = 5;
  sub_100006060();
  sub_100006060();
  v44(v47, 0, 1, v96);
  sub_100005F90();
  v45(v42, 0, 1, v78);
  sub_100005054(&qword_10000C0B8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100006270;
  unint64_t v72 = 0xD000000000000012;
  sub_100006060();
  sub_100006060();
  sub_1000060D0();
  sub_1000060A0();
  uint64_t v49 = v90;
  ((void (*)(char *, void, uint64_t))v94)(v46, v92, v90);
  sub_100006090();
  sub_100005FB0();
  unint64_t v50 = v85;
  v51 = (unsigned char *)(v85 + 6 * v91);
  uint64_t v52 = v80;
  uint64_t v76 = (uint64_t)&v51[*(int *)(v80 + 56)];
  unsigned char *v51 = 6;
  sub_100006060();
  sub_100006060();
  v53 = v47;
  v54 = v79;
  v79(v53, 0, 1, v96);
  sub_100005F90();
  v81(v42, 0, 1, v78);
  sub_1000060D0();
  sub_1000060A0();
  uint64_t v55 = v92;
  ((void (*)(char *, void, uint64_t))v94)(v95, v92, v49);
  sub_100006090();
  v56 = v82;
  v57 = v77;
  sub_100005FB0();
  uint64_t v76 = 8 * v91;
  v58 = (unsigned char *)(v50 + 7 * v91);
  unint64_t v74 = (unint64_t)&v58[*(int *)(v52 + 56)];
  unsigned char *v58 = 7;
  sub_100006060();
  sub_100006060();
  v54(v56, 0, 1, v96);
  sub_100005F90();
  uint64_t v59 = v78;
  v60 = v81;
  v81(v57, 0, 1, v78);
  sub_1000060D0();
  sub_1000060A0();
  ((void (*)(char *, uint64_t, uint64_t))v94)(v95, v55, v90);
  sub_100006090();
  v61 = v82;
  v62 = v77;
  sub_100005FB0();
  unint64_t v63 = v85;
  unint64_t v74 = v85 + v76 + *(int *)(v80 + 56);
  *(unsigned char *)(v85 + v76) = 8;
  sub_100006060();
  sub_100006060();
  v64 = v61;
  v65 = v79;
  v79(v64, 0, 1, v96);
  v66 = v62;
  sub_100005F90();
  v60(v62, 0, 1, v59);
  sub_1000060D0();
  sub_1000060A0();
  uint64_t v67 = v92;
  ((void (*)(char *, void, uint64_t))v94)(v95, v92, v90);
  sub_100006090();
  v68 = v82;
  sub_100005FB0();
  *(unsigned char *)(v63 + v76 + v91) = 9;
  sub_100006060();
  sub_100006060();
  v65(v68, 0, 1, v96);
  sub_100005F90();
  uint64_t v69 = v78;
  v60(v66, 0, 1, v78);
  sub_1000060D0();
  sub_1000060A0();
  v70 = v95;
  ((void (*)(char *, uint64_t, uint64_t))v94)(v95, v67, v90);
  sub_100006090();
  sub_100005FB0();
  *(unsigned char *)(v85 + 10 * v91) = 10;
  sub_100006060();
  sub_100006060();
  v79(v68, 0, 1, v96);
  sub_100005F90();
  v81(v66, 0, 1, v69);
  sub_1000060D0();
  sub_1000060A0();
  ((void (*)(char *, void, uint64_t))v94)(v70, v92, v90);
  sub_100006090();
  sub_100005FB0();
  return sub_1000022F4(v75);
}

uint64_t sub_100005054(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005098(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000050D0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100005134()
{
  unint64_t result = qword_10000C0C8;
  if (!qword_10000C0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C8);
  }
  return result;
}

uint64_t sub_100005188(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_10000519C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005054(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100005200(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100008658;
  v6._object = a2;
  unint64_t v4 = sub_100006110(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xB) {
    return 11;
  }
  else {
    return v4;
  }
}

uint64_t sub_10000524C(uint64_t a1)
{
  unint64_t v2 = sub_10000539C();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000052F4()
{
  unint64_t result = qword_10000C0F8;
  if (!qword_10000C0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0F8);
  }
  return result;
}

uint64_t sub_10000534C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000539C()
{
  unint64_t result = qword_10000C100;
  if (!qword_10000C100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C100);
  }
  return result;
}

ValueMetadata *type metadata accessor for InternationalSettingsExtensionExtension()
{
  return &type metadata for InternationalSettingsExtensionExtension;
}

unint64_t sub_100005404()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

uint64_t sub_100005458()
{
  uint64_t v0 = sub_100006080();
  sub_1000050D0(v0, qword_10000C188);
  sub_100005098(v0, (uint64_t)qword_10000C188);
  return sub_100006060();
}

uint64_t sub_1000054BC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100005F50();
  *a1 = v3;
  return result;
}

uint64_t sub_1000054F8()
{
  return sub_100005F60();
}

void (*sub_100005530(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100005F40();
  return sub_10000558C;
}

void sub_10000558C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_1000055DC()
{
  unint64_t result = qword_10000C110;
  if (!qword_10000C110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C110);
  }
  return result;
}

uint64_t sub_100005630(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100005DF8();
  unint64_t v5 = sub_100005134();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_1000056A8()
{
  unint64_t result = qword_10000C118;
  if (!qword_10000C118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C118);
  }
  return result;
}

unint64_t sub_100005700()
{
  unint64_t result = qword_10000C120;
  if (!qword_10000C120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C120);
  }
  return result;
}

unint64_t sub_100005758()
{
  unint64_t result = qword_10000C128;
  if (!qword_10000C128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C128);
  }
  return result;
}

uint64_t sub_1000057AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000057FC@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C010 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006080();
  uint64_t v3 = sub_100005098(v2, (uint64_t)qword_10000C188);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1000058A4()
{
  return 0;
}

uint64_t sub_1000058B0()
{
  return 1;
}

uint64_t sub_1000058C0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100005DF8();
  unint64_t v6 = sub_100005E4C();
  unint64_t v7 = sub_100005134();
  *unint64_t v4 = v2;
  v4[1] = sub_10000598C;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10000598C()
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

uint64_t sub_100005A94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100005B08();
  *a1 = result;
  return result;
}

uint64_t sub_100005ABC(uint64_t a1)
{
  unint64_t v2 = sub_1000055DC();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenInternationalSettingsDeepLink()
{
  return &type metadata for OpenInternationalSettingsDeepLink;
}

uint64_t sub_100005B08()
{
  uint64_t v17 = sub_100006010();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  unint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005054(&qword_10000C138);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_100005054(&qword_10000C0A0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006080();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100005054(&qword_10000C140);
  sub_100006060();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 11;
  uint64_t v14 = sub_100005F30();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_100002E58();
  return sub_100005F70();
}

unint64_t sub_100005DF8()
{
  unint64_t result = qword_10000C148;
  if (!qword_10000C148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C148);
  }
  return result;
}

unint64_t sub_100005E4C()
{
  unint64_t result = qword_10000C150;
  if (!qword_10000C150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C150);
  }
  return result;
}

uint64_t sub_100005EA0()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100005EB0()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100005EC0()
{
  return static AppIntentInternal.attributionBundleIdentifier.getter();
}

uint64_t sub_100005EE0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100005EF0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100005F00()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100005F30()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100005F40()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100005F50()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100005F60()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100005F70()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100005F80()
{
  return URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100005F90()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100005FA0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100005FB0()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100005FC0()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100005FD0()
{
  return EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_100005FE0()
{
  return EnumURLRepresentation.init(_:)();
}

uint64_t sub_100006010()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100006030()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100006040()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100006050()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100006060()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100006070()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100006080()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006090()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_1000060A0()
{
  return static Locale.current.getter();
}

uint64_t sub_1000060B0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_1000060C0()
{
  return static AppExtension.main()();
}

uint64_t sub_1000060D0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_1000060E0()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_1000060F0()
{
  return String.hash(into:)();
}

uint64_t sub_100006100()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100006110(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006120()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006130()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006140()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
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