uint64_t sub_100003ABC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_100005520(&qword_10000C0D8);
  sub_10000559C(v0, qword_10000C188);
  sub_100005564(v0, (uint64_t)qword_10000C188);
  sub_100005520(&qword_10000C0E0);
  v1 = *(void *)(sub_100005520(&qword_10000C0E8) - 8);
  v2 = *(void *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100006F00;
  *(unsigned char *)(v4 + v3) = 0;
  sub_1000044B0();
  sub_100006CB0();
  *(unsigned char *)(v4 + v3 + v2) = 1;
  sub_100006CB0();
  sub_100003C50(v4);
  return sub_100006CC0();
}

unint64_t sub_100003C50(uint64_t a1)
{
  uint64_t v2 = sub_100005520(&qword_10000C0E8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005520(&qword_10000C0F0);
  uint64_t v6 = sub_100006D80();
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
    sub_100005668(v12, (uint64_t)v5, &qword_10000C0E8);
    char v14 = *v5;
    unint64_t result = sub_100004E24(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100005520(&qword_10000C0F8);
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

unint64_t sub_100003E50(uint64_t a1)
{
  uint64_t v2 = sub_100005520(&qword_10000C0B8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005520(&qword_10000C0C8);
  uint64_t v6 = sub_100006D80();
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
    sub_100005668(v12, (uint64_t)v5, &qword_10000C0B8);
    char v14 = *v5;
    unint64_t result = sub_100004E24(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100006C90();
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

uint64_t sub_100004048()
{
  sub_100005520(&qword_10000C0A8);
  __chkstk_darwin();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100006D50();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v4 = sub_100006D30();
  sub_10000559C(v4, qword_10000C1A0);
  sub_100005564(v4, (uint64_t)qword_10000C1A0);
  sub_100006D40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  return sub_100006D20();
}

uint64_t sub_1000041B4(char *a1, char *a2)
{
  return sub_100004218(*a1, *a2);
}

unint64_t sub_1000041C4()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

uint64_t sub_100004218(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x64726143646461;
  }
  else {
    uint64_t v3 = 1953460082;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE700000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x64726143646461;
  }
  else {
    uint64_t v5 = 1953460082;
  }
  if (a2) {
    unint64_t v6 = 0xE700000000000000;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_100006DA0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int sub_1000042B8()
{
  return sub_100006DC0();
}

uint64_t sub_100004334()
{
  sub_100006D70();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000439C()
{
  return sub_100006DC0();
}

uint64_t sub_100004414@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100008700;
  v8._object = v3;
  Swift::Int v5 = sub_100006D90(v4, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_100004474(uint64_t *a1@<X8>)
{
  uint64_t v2 = 1953460082;
  if (*v1) {
    uint64_t v2 = 0x64726143646461;
  }
  unint64_t v3 = 0xE400000000000000;
  if (*v1) {
    unint64_t v3 = 0xE700000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

unint64_t sub_1000044B0()
{
  unint64_t result = qword_10000C028;
  if (!qword_10000C028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C028);
  }
  return result;
}

unint64_t sub_100004508()
{
  unint64_t result = qword_10000C030;
  if (!qword_10000C030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }
  return result;
}

uint64_t sub_10000455C@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C000 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005520(&qword_10000C0D8);
  uint64_t v3 = sub_100005564(v2, (uint64_t)qword_10000C188);
  Swift::OpaquePointer v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_10000460C()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

unint64_t sub_100004664()
{
  unint64_t result = qword_10000C040;
  if (!qword_10000C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

unint64_t sub_1000046BC()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

void *sub_100004710()
{
  return &protocol witness table for String;
}

uint64_t sub_10000471C()
{
  sub_100005600();
  uint64_t v2 = sub_100006CA0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100005654(v3, v0, v2, v1);
}

unint64_t sub_1000047B4()
{
  unint64_t result = qword_10000C058;
  if (!qword_10000C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

unint64_t sub_10000480C()
{
  unint64_t result = qword_10000C060;
  if (!qword_10000C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

unint64_t sub_100004864()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

unint64_t sub_1000048BC()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

uint64_t sub_100004914@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C008 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006D30();
  uint64_t v3 = sub_100005564(v2, (uint64_t)qword_10000C1A0);
  Swift::OpaquePointer v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1000049BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004A0C(uint64_t a1)
{
  unint64_t v2 = sub_1000044B0();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100004A5C()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

unint64_t sub_100004AB4()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

unint64_t sub_100004B0C()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

uint64_t sub_100004B64(uint64_t a1)
{
  unint64_t v2 = sub_1000048BC();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100004BB4()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    sub_100004C10(&qword_10000C098);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

uint64_t sub_100004C10(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100004C58(void *a1@<X8>)
{
  *a1 = &off_100008750;
}

unsigned char *initializeBufferWithCopyOfBuffer for WalletDeepLinks(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WalletDeepLinks(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for WalletDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100004DD4);
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

uint64_t sub_100004DFC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100004E08(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for WalletDeepLinks()
{
  return &type metadata for WalletDeepLinks;
}

unint64_t sub_100004E24(char a1)
{
  sub_100006DB0();
  sub_100006D70();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_100006DC0();

  return sub_100004EC4(a1 & 1, v2);
}

unint64_t sub_100004EC4(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    if (a1) {
      uint64_t v6 = 0x64726143646461;
    }
    else {
      uint64_t v6 = 1953460082;
    }
    if (a1) {
      unint64_t v7 = 0xE700000000000000;
    }
    else {
      unint64_t v7 = 0xE400000000000000;
    }
    while (1)
    {
      uint64_t v8 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0x64726143646461 : 1953460082;
      unint64_t v9 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0xE700000000000000 : 0xE400000000000000;
      if (v8 == v6 && v9 == v7) {
        break;
      }
      char v11 = sub_100006DA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease_n();
  }
  return v4;
}

unint64_t sub_100004FFC()
{
  sub_100005520(&qword_10000C0A0);
  __chkstk_darwin();
  uint64_t v1 = (char *)v14 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005520(&qword_10000C0A8);
  __chkstk_darwin();
  uint64_t v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006D50();
  uint64_t v22 = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v14[3] = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005520(&qword_10000C0B0);
  unint64_t v7 = (int *)(sub_100005520(&qword_10000C0B8) - 8);
  uint64_t v8 = *(void *)v7;
  uint64_t v23 = *(void *)(*(void *)v7 + 72);
  unint64_t v9 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = swift_allocObject();
  uint64_t v24 = v10;
  *(_OWORD *)(v10 + 16) = xmmword_100006F00;
  unint64_t v18 = v10 + v9 + v7[14];
  unint64_t v19 = v10 + v9;
  *(unsigned char *)(v10 + v9) = 0;
  sub_100006D40();
  BOOL v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v21(v3, 1, 1, v4);
  unint64_t v20 = 0x80000001000075A0;
  sub_100006C60();
  uint64_t v16 = sub_100006C70();
  uint64_t v11 = *(void *)(v16 - 8);
  v15 = *(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56);
  uint64_t v17 = v11 + 56;
  v15(v1, 0, 1, v16);
  uint64_t v12 = sub_100005520(&qword_10000C0C0);
  v14[1] = *(unsigned __int8 *)(v5 + 80) | 7;
  v14[2] = v12;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100006F10;
  sub_100006D40();
  sub_100006D40();
  sub_100006D40();
  sub_100006D40();
  sub_100006D40();
  sub_100006D40();
  sub_100006D40();
  sub_100006D40();
  sub_100006C80();
  *(unsigned char *)(v19 + v23) = 1;
  sub_100006D40();
  sub_100006D40();
  v21(v3, 0, 1, v22);
  sub_100006C60();
  v15(v1, 0, 1, v16);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100006F20;
  sub_100006D40();
  sub_100006C80();
  return sub_100003E50(v24);
}

uint64_t sub_100005520(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005564(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_10000559C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100005600()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

uint64_t sub_100005654(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100005668(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005520(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_1000056D0()
{
  unint64_t result = qword_10000C100;
  if (!qword_10000C100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C100);
  }
  return result;
}

uint64_t sub_100005724()
{
  uint64_t v0 = sub_100006D50();
  sub_10000559C(v0, qword_10000C1B8);
  sub_100005564(v0, (uint64_t)qword_10000C1B8);
  return sub_100006D40();
}

uint64_t sub_100005788()
{
  sub_100006B50();
  return v1;
}

uint64_t sub_1000057BC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006B50();
  *a1 = v3;
  return result;
}

uint64_t sub_1000057F8()
{
  return sub_100006B60();
}

void (*sub_100005830(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100006B40();
  return sub_10000588C;
}

void sub_10000588C(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_1000058DC()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

unint64_t sub_100005934()
{
  unint64_t result = qword_10000C110;
  if (!qword_10000C110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C110);
  }
  return result;
}

uint64_t sub_100005988(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100006118();
  unint64_t v5 = sub_100005600();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_1000059F4()
{
  return 0xD000000000000015;
}

unint64_t sub_100005A18()
{
  unint64_t result = qword_10000C118;
  if (!qword_10000C118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C118);
  }
  return result;
}

unint64_t sub_100005A70()
{
  unint64_t result = qword_10000C120;
  if (!qword_10000C120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C120);
  }
  return result;
}

uint64_t sub_100005AC4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005B14@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C010 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006D50();
  uint64_t v3 = sub_100005564(v2, (uint64_t)qword_10000C1B8);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100005BBC()
{
  return 0;
}

uint64_t sub_100005BC8()
{
  return 1;
}

uint64_t sub_100005BD8(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100006118();
  unint64_t v7 = sub_10000616C();
  unint64_t v8 = sub_100005600();
  void *v5 = v2;
  v5[1] = sub_100005CAC;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100005CAC()
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

uint64_t sub_100005DB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100005E28();
  *a1 = result;
  return result;
}

uint64_t sub_100005DDC(uint64_t a1)
{
  unint64_t v2 = sub_1000058DC();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenWalletDeepLinksIntent()
{
  return &type metadata for OpenWalletDeepLinksIntent;
}

uint64_t sub_100005E28()
{
  uint64_t v16 = sub_100006CD0();
  uint64_t v0 = *(void *)(v16 - 8);
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005520(&qword_10000C130);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unint64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = sub_100005520(&qword_10000C0A8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100006D50();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_100005520(&qword_10000C138);
  sub_100006D40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  char v17 = 2;
  uint64_t v13 = sub_100006B30();
  char v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v16);
  sub_1000044B0();
  return sub_100006B70();
}

unint64_t sub_100006118()
{
  unint64_t result = qword_10000C140;
  if (!qword_10000C140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C140);
  }
  return result;
}

unint64_t sub_10000616C()
{
  unint64_t result = qword_10000C148;
  if (!qword_10000C148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C148);
  }
  return result;
}

uint64_t sub_1000061C0()
{
  uint64_t v0 = sub_100005520(&qword_10000C168);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000058DC();
  sub_100006C10();
  uint64_t v13 = sub_100006BA0();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_100006C10();
  uint64_t v5 = sub_100006BA0();
  v4(v3, v0);
  sub_100006C10();
  uint64_t v6 = sub_100006BA0();
  v4(v3, v0);
  sub_100006C10();
  uint64_t v7 = sub_100006BA0();
  v4(v3, v0);
  sub_100006C10();
  uint64_t v8 = sub_100006BA0();
  v4(v3, v0);
  sub_100005520(&qword_10000C170);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100007450;
  *(void *)(v9 + 32) = v13;
  *(void *)(v9 + 40) = v5;
  *(void *)(v9 + 48) = v6;
  *(void *)(v9 + 56) = v7;
  *(void *)(v9 + 64) = v8;
  uint64_t v10 = sub_100006B90();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100006474()
{
  uint64_t v0 = sub_100006C00();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100004864();
  sub_100006B80();
  swift_release();
  sub_1000058DC();
  sub_100006BF0();
  uint64_t v4 = sub_100006BE0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005520(&qword_10000C158);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100006F20;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100006BD0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1000065DC()
{
  uint64_t v0 = sub_100006BC0();
  uint64_t v1 = sub_100006BC0();
  uint64_t v2 = sub_100006BC0();
  sub_100005520(&qword_10000C160);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100007460;
  *(void *)(v3 + 32) = v0;
  *(void *)(v3 + 40) = v1;
  *(void *)(v3 + 48) = v2;
  uint64_t v4 = sub_100006BB0();
  swift_bridgeObjectRelease();
  return v4;
}

void sub_100006698()
{
  qword_10000C1D0 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_1000066AC()
{
  uint64_t v0 = sub_100006C40();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_100005E28();
  sub_1000058DC();
  sub_100006C50();
  uint64_t v4 = sub_100006C30();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005520(&qword_10000C150);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100006F20;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100006C20();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10000680C()
{
  if (qword_10000C018 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_10000C1D0;

  return _swift_bridgeObjectRetain(v0);
}

ValueMetadata *type metadata accessor for PassbookAssistantIntents()
{
  return &type metadata for PassbookAssistantIntents;
}

uint64_t sub_100006878@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006B50();
  *a1 = v3;
  return result;
}

uint64_t sub_1000068B4()
{
  return sub_100006B60();
}

uint64_t sub_1000068EC(uint64_t a1)
{
  unint64_t v2 = sub_100006A3C();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100006994()
{
  unint64_t result = qword_10000C178;
  if (!qword_10000C178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C178);
  }
  return result;
}

uint64_t sub_1000069EC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100006A3C()
{
  unint64_t result = qword_10000C180;
  if (!qword_10000C180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C180);
  }
  return result;
}

ValueMetadata *type metadata accessor for PassbookSettingsIntentExtension()
{
  return &type metadata for PassbookSettingsIntentExtension;
}

uint64_t sub_100006AA0()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100006AB0()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100006AC0()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100006AE0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100006AF0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100006B00()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100006B30()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100006B40()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100006B50()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006B60()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100006B70()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100006B80()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_100006B90()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100006BA0()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_100006BB0()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_100006BC0()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_100006BD0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_100006BE0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_100006BF0()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_100006C00()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_100006C10()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t sub_100006C20()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_100006C30()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_100006C40()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_100006C50()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_100006C60()
{
  return DisplayRepresentation.Image.init(appBundleIdentifier:)();
}

uint64_t sub_100006C70()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100006C80()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:)();
}

uint64_t sub_100006C90()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100006CA0()
{
  return _URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100006CB0()
{
  return _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_100006CC0()
{
  return _EnumURLRepresentation.init(_:)();
}

uint64_t sub_100006CD0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100006D10()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100006D20()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100006D30()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100006D40()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100006D50()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006D60()
{
  return static AppExtension.main()();
}

uint64_t sub_100006D70()
{
  return String.hash(into:)();
}

uint64_t sub_100006D80()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100006D90(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006DA0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006DB0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006DC0()
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