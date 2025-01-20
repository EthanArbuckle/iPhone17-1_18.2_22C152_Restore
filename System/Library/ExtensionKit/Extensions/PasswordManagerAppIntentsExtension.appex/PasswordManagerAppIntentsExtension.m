uint64_t sub_100003104()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v0 = sub_100005B64(&qword_10000C120);
  sub_100005CDC(v0, qword_10000C188);
  sub_100005CA4(v0, (uint64_t)qword_10000C188);
  sub_100005B64(&qword_10000C128);
  v1 = *(void *)(sub_100005B64(&qword_10000C130) - 8);
  v2 = *(void *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100006AE0;
  v5 = v4 + v3;
  *(unsigned char *)(v4 + v3) = 0;
  sub_100003DD8();
  sub_1000068A0();
  *(unsigned char *)(v5 + v2) = 1;
  sub_1000068A0();
  *(unsigned char *)(v5 + 2 * v2) = 2;
  sub_1000068A0();
  *(unsigned char *)(v5 + 3 * v2) = 3;
  sub_1000068A0();
  sub_100003308(v4);
  return sub_1000068B0();
}

unint64_t sub_100003308(uint64_t a1)
{
  uint64_t v2 = sub_100005B64(&qword_10000C130);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005B64(&qword_10000C138);
  uint64_t v6 = sub_100006970();
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
    sub_100005D54(v12, (uint64_t)v5, &qword_10000C130);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_100004E48(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100005B64(&qword_10000C140);
    unint64_t result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
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

unint64_t sub_100003508(uint64_t a1)
{
  uint64_t v2 = sub_100005B64(&qword_10000C108);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005B64(&qword_10000C118);
  uint64_t v6 = sub_100006970();
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
    sub_100005D54(v12, (uint64_t)v5, &qword_10000C108);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_100004E48(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100006890();
    unint64_t result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
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

uint64_t sub_100003700()
{
  sub_100005B64(&qword_10000C0D0);
  __chkstk_darwin();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100006940();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v4 = sub_100006920();
  sub_100005CDC(v4, qword_10000C1A0);
  sub_100005CA4(v4, (uint64_t)qword_10000C1A0);
  sub_100006930();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  return sub_100006910();
}

unint64_t sub_10000386C(char a1)
{
  unint64_t result = 1953460082;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    case 3:
      unint64_t result = 0xD00000000000001DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100003904(unsigned __int8 *a1, char *a2)
{
  return sub_100003968(*a1, *a2);
}

unint64_t sub_100003914()
{
  unint64_t result = qword_10000C018;
  if (!qword_10000C018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }
  return result;
}

uint64_t sub_100003968(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 1953460082;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 1953460082;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD00000000000001ALL;
      uint64_t v6 = "detectCompromisedPasswords";
      goto LABEL_5;
    case 2:
      unint64_t v3 = 0x8000000100007170;
      unint64_t v5 = 0xD000000000000016;
      break;
    case 3:
      unint64_t v5 = 0xD00000000000001DLL;
      uint64_t v6 = "allowAutomaticPasskeyUpgrades";
LABEL_5:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD00000000000001ALL;
      uint64_t v8 = "detectCompromisedPasswords";
      goto LABEL_10;
    case 2:
      unint64_t v7 = 0x8000000100007170;
      unint64_t v2 = 0xD000000000000016;
      break;
    case 3:
      unint64_t v2 = 0xD00000000000001DLL;
      uint64_t v8 = "allowAutomaticPasskeyUpgrades";
LABEL_10:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_100006990();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

Swift::Int sub_100003AD8()
{
  return sub_100003AE0();
}

Swift::Int sub_100003AE0()
{
  return sub_1000069B0();
}

uint64_t sub_100003BC0()
{
  return sub_100003BC8();
}

uint64_t sub_100003BC8()
{
  sub_100006960();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100003C94()
{
  return sub_100003C9C();
}

Swift::Int sub_100003C9C()
{
  return sub_1000069B0();
}

uint64_t sub_100003D78@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100005828(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_100003DA8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10000386C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100003DD8()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

unint64_t sub_100003E30()
{
  unint64_t result = qword_10000C028;
  if (!qword_10000C028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C028);
  }
  return result;
}

uint64_t sub_100003E84@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C000 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005B64(&qword_10000C120);
  uint64_t v3 = sub_100005CA4(v2, (uint64_t)qword_10000C188);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100003F34()
{
  unint64_t result = qword_10000C030;
  if (!qword_10000C030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }
  return result;
}

unint64_t sub_100003F8C()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

unint64_t sub_100003FE4()
{
  unint64_t result = qword_10000C040;
  if (!qword_10000C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

void *sub_100004038()
{
  return &protocol witness table for String;
}

uint64_t sub_100004044()
{
  sub_100005C50();
  uint64_t v2 = sub_100006850();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100005D40(v3, v0, v2, v1);
}

unint64_t sub_1000040DC()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

unint64_t sub_100004134()
{
  unint64_t result = qword_10000C058;
  if (!qword_10000C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

unint64_t sub_10000418C()
{
  unint64_t result = qword_10000C060;
  if (!qword_10000C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

unint64_t sub_1000041E4()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

uint64_t sub_10000423C@<X0>(uint64_t a1@<X8>)
{
  return sub_100004988(&qword_10000C008, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000C1A0, a1);
}

uint64_t sub_100004274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100004908(a1, a2, a3, (void (*)(void))sub_100003DD8);
}

uint64_t sub_1000042A0(uint64_t a1)
{
  unint64_t v2 = sub_100003DD8();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000042F0()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

unint64_t sub_100004348()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

unint64_t sub_1000043A0()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

uint64_t sub_1000043F8(uint64_t a1)
{
  unint64_t v2 = sub_1000041E4();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100004448()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    sub_1000044A4(&qword_10000C090);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

uint64_t sub_1000044A4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_1000044EC(void *a1@<X8>)
{
  *a1 = &off_100008798;
}

unint64_t sub_100004500()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

uint64_t sub_100004554()
{
  uint64_t v0 = sub_100006940();
  sub_100005CDC(v0, qword_10000C1B8);
  sub_100005CA4(v0, (uint64_t)qword_10000C1B8);
  return sub_100006930();
}

uint64_t sub_1000045B8()
{
  sub_100006700();
  return v1;
}

uint64_t sub_1000045EC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006700();
  *a1 = v3;
  return result;
}

uint64_t sub_100004628()
{
  return sub_100006710();
}

void (*sub_100004660(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1000066F0();
  return sub_1000046BC;
}

void sub_1000046BC(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_10000470C()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

uint64_t sub_100004760(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100005BA8();
  unint64_t v5 = sub_100005C50();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_1000047D8()
{
  unint64_t result = qword_10000C0A8;
  if (!qword_10000C0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A8);
  }
  return result;
}

unint64_t sub_100004830()
{
  unint64_t result = qword_10000C0B0;
  if (!qword_10000C0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B0);
  }
  return result;
}

unint64_t sub_100004888()
{
  unint64_t result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }
  return result;
}

uint64_t sub_1000048DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100004908(a1, a2, a3, (void (*)(void))sub_10000470C);
}

uint64_t sub_100004908(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004950@<X0>(uint64_t a1@<X8>)
{
  return sub_100004988(&qword_10000C010, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000C1B8, a1);
}

uint64_t sub_100004988@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100005CA4(v7, a3);
  char v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100004A2C()
{
  return 0;
}

uint64_t sub_100004A38()
{
  return 1;
}

uint64_t sub_100004A48(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100005BA8();
  unint64_t v6 = sub_100005BFC();
  unint64_t v7 = sub_100005C50();
  *unint64_t v4 = v2;
  v4[1] = sub_100004B14;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100004B14()
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

uint64_t sub_100004C1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100005874();
  *a1 = result;
  return result;
}

uint64_t sub_100004C44(uint64_t a1)
{
  unint64_t v2 = sub_10000470C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenPasswordManagerDeepLinks()
{
  return &type metadata for OpenPasswordManagerDeepLinks;
}

unsigned char *initializeBufferWithCopyOfBuffer for PasswordManagerDeepLinks(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PasswordManagerDeepLinks(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PasswordManagerDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x100004DFCLL);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_100004E24(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100004E30(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PasswordManagerDeepLinks()
{
  return &type metadata for PasswordManagerDeepLinks;
}

unint64_t sub_100004E48(unsigned __int8 a1)
{
  sub_1000069A0();
  sub_100006960();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_1000069B0();

  return sub_100004F4C(a1, v2);
}

unint64_t sub_100004F4C(unsigned __int8 a1, uint64_t a2)
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
          unint64_t v8 = 0xD00000000000001ALL;
          unint64_t v7 = 0x8000000100007150;
          break;
        case 2:
          unint64_t v7 = 0x8000000100007170;
          unint64_t v8 = 0xD000000000000016;
          break;
        case 3:
          unint64_t v8 = 0xD00000000000001DLL;
          unint64_t v7 = 0x8000000100007190;
          break;
        default:
          break;
      }
      unint64_t v9 = 0xE400000000000000;
      unint64_t v10 = 1953460082;
      switch(v6)
      {
        case 1:
          unint64_t v9 = 0x8000000100007150;
          if (v8 == 0xD00000000000001ALL) {
            goto LABEL_14;
          }
          goto LABEL_15;
        case 2:
          unint64_t v9 = 0x8000000100007170;
          unint64_t v10 = 0xD000000000000016;
          goto LABEL_11;
        case 3:
          unint64_t v9 = 0x8000000100007190;
          if (v8 == 0xD00000000000001DLL) {
            goto LABEL_14;
          }
          goto LABEL_15;
        default:
LABEL_11:
          if (v8 != v10) {
            goto LABEL_15;
          }
LABEL_14:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_15:
          char v11 = sub_100006990();
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

unint64_t sub_100005164()
{
  uint64_t v0 = sub_100005B64(&qword_10000C0F8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005B64(&qword_10000C0D0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006940();
  uint64_t v35 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  unint64_t v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  sub_100005B64(&qword_10000C100);
  char v11 = (int *)(sub_100005B64(&qword_10000C108) - 8);
  uint64_t v12 = *(void *)v11;
  uint64_t v39 = *(void *)(*(void *)v11 + 72);
  unint64_t v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v14 = swift_allocObject();
  uint64_t v30 = v14;
  *(_OWORD *)(v14 + 16) = xmmword_100006AE0;
  unint64_t v38 = v14 + v13;
  uint64_t v15 = v11[14];
  v32 = v11;
  unint64_t v36 = v14 + v13 + v15;
  *(unsigned char *)(v14 + v13) = 0;
  sub_100006930();
  sub_100006930();
  v29 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
  v29(v5, 0, 1, v6);
  unint64_t v34 = 0x80000001000071F0;
  sub_100006860();
  uint64_t v33 = sub_100006870();
  uint64_t v16 = *(void *)(v33 - 8);
  v37 = *(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56);
  uint64_t v28 = v16 + 56;
  v37(v2, 0, 1, v33);
  sub_100005B64(&qword_10000C110);
  uint64_t v27 = v7 + 56;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100006AF0;
  sub_100006930();
  sub_100006930();
  v31 = v10;
  sub_100006930();
  sub_100006880();
  uint64_t v26 = v38 + v39 + v11[14];
  *(unsigned char *)(v38 + v39) = 1;
  sub_100006930();
  unint64_t v36 = 0x8000000100007280;
  sub_100006930();
  uint64_t v17 = v35;
  uint64_t v18 = v29;
  v29(v5, 0, 1, v35);
  uint64_t v19 = v2;
  sub_100006860();
  uint64_t v20 = v2;
  uint64_t v21 = v33;
  v37(v20, 0, 1, v33);
  sub_100006930();
  sub_100006880();
  uint64_t v26 = 2 * v39;
  uint64_t v22 = (unsigned char *)(v38 + 2 * v39);
  v25[1] = &v22[v32[14]];
  *uint64_t v22 = 2;
  sub_100006930();
  sub_100006930();
  v18(v5, 0, 1, v17);
  sub_100006860();
  v23 = v37;
  v37(v19, 0, 1, v21);
  sub_100006930();
  sub_100006880();
  *(unsigned char *)(v38 + v26 + v39) = 3;
  sub_100006930();
  sub_100006930();
  v18(v5, 0, 1, v35);
  sub_100006860();
  v23(v19, 0, 1, v33);
  sub_100006930();
  sub_100006880();
  return sub_100003508(v30);
}

uint64_t sub_100005828(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100008718;
  v6._object = a2;
  unint64_t v4 = sub_100006980(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t sub_100005874()
{
  uint64_t v16 = sub_1000068E0();
  uint64_t v0 = *(void *)(v16 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B64(&qword_10000C0C8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = sub_100005B64(&qword_10000C0D0);
  __chkstk_darwin(v8 - 8);
  unint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100006940();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_100005B64(&qword_10000C0D8);
  sub_100006930();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  char v17 = 4;
  uint64_t v13 = sub_1000066E0();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v16);
  sub_100003DD8();
  return sub_100006720();
}

uint64_t sub_100005B64(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005BA8()
{
  unint64_t result = qword_10000C0E0;
  if (!qword_10000C0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E0);
  }
  return result;
}

unint64_t sub_100005BFC()
{
  unint64_t result = qword_10000C0E8;
  if (!qword_10000C0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E8);
  }
  return result;
}

unint64_t sub_100005C50()
{
  unint64_t result = qword_10000C0F0;
  if (!qword_10000C0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0F0);
  }
  return result;
}

uint64_t sub_100005CA4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100005CDC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100005D40(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100005D54(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005B64(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100005DB8(uint64_t a1)
{
  unint64_t v2 = sub_100005F08();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100005E60()
{
  unint64_t result = qword_10000C148;
  if (!qword_10000C148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C148);
  }
  return result;
}

uint64_t sub_100005EB8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100005F08()
{
  unint64_t result = qword_10000C150;
  if (!qword_10000C150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C150);
  }
  return result;
}

ValueMetadata *type metadata accessor for PasswordManagerAppIntentsExtension()
{
  return &type metadata for PasswordManagerAppIntentsExtension;
}

uint64_t sub_100005F6C()
{
  uint64_t v0 = sub_100005B64(&qword_10000C178);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000470C();
  sub_100006800();
  uint64_t v4 = sub_100006790();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_100006800();
  uint64_t v6 = sub_100006790();
  v5(v3, v0);
  sub_100005B64(&qword_10000C180);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100006AF0;
  *(void *)(v7 + 32) = v4;
  *(void *)(v7 + 40) = v6;
  uint64_t v8 = sub_100006780();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_100006120()
{
  uint64_t v0 = sub_1000067F0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10000418C();
  sub_100006770();
  swift_release();
  sub_10000470C();
  sub_1000067E0();
  uint64_t v4 = sub_1000067D0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005B64(&qword_10000C170);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000070C0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_1000067C0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100006288()
{
  return sub_1000062C0();
}

uint64_t sub_1000062A4()
{
  return sub_1000062C0();
}

uint64_t sub_1000062C0()
{
  uint64_t v0 = sub_1000067B0();
  sub_100005B64(&qword_10000C160);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1000070C0;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_1000067A0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_100006324()
{
  uint64_t v0 = sub_100006830();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_100005874();
  sub_10000470C();
  sub_100006840();
  uint64_t v4 = sub_100006820();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005B64(&qword_10000C168);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000070C0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100006810();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100006484()
{
  uint64_t v0 = sub_100006760();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000470C();
  sub_100006750();
  uint64_t v4 = sub_100006740();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005B64(&qword_10000C158);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000070C0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100006730();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for PasswordManagerAssistantIntents()
{
  return &type metadata for PasswordManagerAssistantIntents;
}

uint64_t sub_1000065CC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006700();
  *a1 = v3;
  return result;
}

uint64_t sub_100006608()
{
  return sub_100006710();
}

uint64_t sub_100006640()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100006650()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100006660()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100006670()
{
  return static AppIntentInternal.attributionBundleIdentifier.getter();
}

uint64_t sub_100006690()
{
  return static AppIntent.description.getter();
}

uint64_t sub_1000066A0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000066B0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000066E0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_1000066F0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100006700()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006710()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100006720()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100006730()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
}

uint64_t sub_100006740()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)();
}

uint64_t sub_100006750()
{
  return _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)();
}

uint64_t sub_100006760()
{
  return type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases();
}

uint64_t sub_100006770()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_100006780()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100006790()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_1000067A0()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_1000067B0()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_1000067C0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_1000067D0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_1000067E0()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_1000067F0()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_100006800()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t sub_100006810()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_100006820()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_100006830()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_100006840()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_100006850()
{
  return URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100006860()
{
  return DisplayRepresentation.Image.init(appBundleIdentifier:)();
}

uint64_t sub_100006870()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100006880()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100006890()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_1000068A0()
{
  return EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_1000068B0()
{
  return EnumURLRepresentation.init(_:)();
}

uint64_t sub_1000068E0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100006900()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100006910()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100006920()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100006930()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100006940()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006950()
{
  return static AppExtension.main()();
}

uint64_t sub_100006960()
{
  return String.hash(into:)();
}

uint64_t sub_100006970()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100006980(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006990()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000069A0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1000069B0()
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