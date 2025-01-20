uint64_t sub_1000040A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;

  v0 = sub_100008550(&qword_10003C380);
  sub_1000086C8(v0, qword_10003D470);
  sub_100008690(v0, (uint64_t)qword_10003D470);
  sub_100008550(&qword_10003C388);
  v1 = *(void *)(sub_100008550(&qword_10003C390) - 8);
  v2 = *(void *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100029BB0;
  v4 = v6 + v3;
  *(unsigned char *)(v6 + v3) = 0;
  sub_10000500C();
  sub_1000296A0();
  *(unsigned char *)(v4 + v2) = 1;
  sub_1000296A0();
  *(unsigned char *)(v4 + 2 * v2) = 2;
  sub_1000296A0();
  *(unsigned char *)(v4 + 3 * v2) = 3;
  sub_1000296A0();
  *(unsigned char *)(v4 + 4 * v2) = 4;
  sub_1000296A0();
  *(unsigned char *)(v4 + 5 * v2) = 5;
  sub_1000296A0();
  *(unsigned char *)(v4 + 6 * v2) = 6;
  sub_1000296A0();
  *(unsigned char *)(v4 + 7 * v2) = 7;
  sub_1000296A0();
  *(unsigned char *)(v4 + 8 * v2) = 8;
  sub_1000296A0();
  *(unsigned char *)(v4 + 9 * v2) = 9;
  sub_1000296A0();
  *(unsigned char *)(v4 + 10 * v2) = 10;
  sub_1000296A0();
  *(unsigned char *)(v4 + 11 * v2) = 11;
  sub_1000296A0();
  *(unsigned char *)(v4 + 12 * v2) = 12;
  sub_1000296A0();
  *(unsigned char *)(v4 + 13 * v2) = 13;
  sub_1000296A0();
  *(unsigned char *)(v4 + 14 * v2) = 14;
  sub_1000296A0();
  *(unsigned char *)(v4 + 15 * v2) = 15;
  sub_1000296A0();
  *(unsigned char *)(v4 + 16 * v2) = 16;
  sub_1000296A0();
  *(unsigned char *)(v4 + 17 * v2) = 17;
  sub_1000296A0();
  *(unsigned char *)(v4 + 18 * v2) = 18;
  sub_1000296A0();
  sub_1000045FC(v6);
  return sub_1000296B0();
}

unint64_t sub_1000045FC(uint64_t a1)
{
  uint64_t v2 = sub_100008550(&qword_10003C390);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008550(&qword_10003C398);
  uint64_t v6 = sub_100029930();
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
    sub_100008740(v12, (uint64_t)v5, &qword_10003C390);
    char v14 = *v5;
    unint64_t result = sub_1000060B8(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100008550(&qword_10003C3A0);
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

unint64_t sub_1000047FC(uint64_t a1)
{
  uint64_t v2 = sub_100008550(&qword_10003C368);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008550(&qword_10003C378);
  uint64_t v6 = sub_100029930();
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
    sub_100008740(v12, (uint64_t)v5, &qword_10003C368);
    char v14 = *v5;
    unint64_t result = sub_1000060B8(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100029650();
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

uint64_t sub_1000049F4()
{
  sub_100008550(&qword_10003C330);
  __chkstk_darwin();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000297E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v4 = sub_100029770();
  sub_1000086C8(v4, qword_10003D488);
  sub_100008690(v4, (uint64_t)qword_10003D488);
  sub_1000297C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  return sub_100029760();
}

unint64_t sub_100004B5C(char a1)
{
  unint64_t result = 1953460082;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6567617373654D69;
      break;
    case 2:
    case 9:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0xD000000000000017;
      break;
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    case 6:
      unint64_t result = 0xD000000000000017;
      break;
    case 7:
      unint64_t result = 0xD000000000000016;
      break;
    case 8:
      unint64_t result = 0xD000000000000018;
      break;
    case 10:
      unint64_t result = 0x654D796669746F6ELL;
      break;
    case 11:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 12:
      unint64_t result = 0xD000000000000013;
      break;
    case 13:
      unint64_t result = 0xD000000000000019;
      break;
    case 14:
      unint64_t result = 0xD000000000000015;
      break;
    case 15:
      unint64_t result = 0x4364656B636F6C62;
      break;
    case 16:
      unint64_t result = 0xD000000000000011;
      break;
    case 17:
      unint64_t result = 0x6C67676F54736D6DLL;
      break;
    case 18:
      unint64_t result = 0x6C67676F54736372;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100004DB0(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_100004B5C(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_100004B5C(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100029940();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_100004E40()
{
  unint64_t result = qword_10003C278;
  if (!qword_10003C278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C278);
  }
  return result;
}

Swift::Int sub_100004E94()
{
  char v1 = *v0;
  sub_100029960();
  sub_100004B5C(v1);
  sub_100029900();
  swift_bridgeObjectRelease();
  return sub_100029970();
}

uint64_t sub_100004EF8()
{
  sub_100004B5C(*v0);
  sub_100029900();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100004F4C()
{
  char v1 = *v0;
  sub_100029960();
  sub_100004B5C(v1);
  sub_100029900();
  swift_bridgeObjectRelease();
  return sub_100029970();
}

uint64_t sub_100004FAC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100008210();
  *a1 = result;
  return result;
}

unint64_t sub_100004FDC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100004B5C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10000500C()
{
  unint64_t result = qword_10003C280;
  if (!qword_10003C280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C280);
  }
  return result;
}

unint64_t sub_100005064()
{
  unint64_t result = qword_10003C288;
  if (!qword_10003C288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C288);
  }
  return result;
}

uint64_t sub_1000050B8@<X0>(uint64_t a1@<X8>)
{
  if (qword_10003C0D0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008550(&qword_10003C380);
  uint64_t v3 = sub_100008690(v2, (uint64_t)qword_10003D470);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100005168()
{
  unint64_t result = qword_10003C290;
  if (!qword_10003C290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C290);
  }
  return result;
}

unint64_t sub_1000051C0()
{
  unint64_t result = qword_10003C298;
  if (!qword_10003C298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C298);
  }
  return result;
}

unint64_t sub_100005218()
{
  unint64_t result = qword_10003C2A0;
  if (!qword_10003C2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C2A0);
  }
  return result;
}

void *sub_10000526C()
{
  return &protocol witness table for String;
}

uint64_t sub_100005278()
{
  sub_10000863C();
  uint64_t v2 = sub_100029670();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000872C(v3, v0, v2, v1);
}

unint64_t sub_100005310()
{
  unint64_t result = qword_10003C2B0;
  if (!qword_10003C2B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C2B0);
  }
  return result;
}

unint64_t sub_100005368()
{
  unint64_t result = qword_10003C2B8;
  if (!qword_10003C2B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C2B8);
  }
  return result;
}

unint64_t sub_1000053C0()
{
  unint64_t result = qword_10003C2C0;
  if (!qword_10003C2C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C2C0);
  }
  return result;
}

unint64_t sub_100005418()
{
  unint64_t result = qword_10003C2C8;
  if (!qword_10003C2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C2C8);
  }
  return result;
}

uint64_t sub_100005470@<X0>(uint64_t a1@<X8>)
{
  return sub_100005BF0(&qword_10003C0D8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10003D488, a1);
}

uint64_t sub_1000054A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005B70(a1, a2, a3, (void (*)(void))sub_10000500C);
}

uint64_t sub_1000054D4(uint64_t a1)
{
  unint64_t v2 = sub_10000500C();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100005524()
{
  unint64_t result = qword_10003C2D0;
  if (!qword_10003C2D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C2D0);
  }
  return result;
}

unint64_t sub_10000557C()
{
  unint64_t result = qword_10003C2D8;
  if (!qword_10003C2D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C2D8);
  }
  return result;
}

unint64_t sub_1000055D4()
{
  unint64_t result = qword_10003C2E0;
  if (!qword_10003C2E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C2E0);
  }
  return result;
}

uint64_t sub_10000562C(uint64_t a1)
{
  unint64_t v2 = sub_100005418();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000567C()
{
  unint64_t result = qword_10003C2E8;
  if (!qword_10003C2E8)
  {
    sub_1000056D8(&qword_10003C2F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C2E8);
  }
  return result;
}

uint64_t sub_1000056D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100005720(void *a1@<X8>)
{
  *a1 = &off_1000390D8;
}

unint64_t sub_100005734()
{
  unint64_t result = qword_10003C2F8;
  if (!qword_10003C2F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C2F8);
  }
  return result;
}

uint64_t sub_100005788()
{
  uint64_t v0 = sub_1000297E0();
  sub_1000086C8(v0, qword_10003D4A0);
  sub_100008690(v0, (uint64_t)qword_10003D4A0);
  return sub_1000297C0();
}

uint64_t sub_1000057EC()
{
  sub_100029430();
  return v1;
}

uint64_t sub_100005820@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100029430();
  *a1 = v3;
  return result;
}

uint64_t sub_10000585C()
{
  return sub_100029440();
}

void (*sub_100005894(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100029420();
  return sub_1000058F0;
}

void sub_1000058F0(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100005940()
{
  unint64_t result = qword_10003C300;
  if (!qword_10003C300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C300);
  }
  return result;
}

unint64_t sub_100005998()
{
  unint64_t result = qword_10003C308;
  if (!qword_10003C308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C308);
  }
  return result;
}

uint64_t sub_1000059EC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100008594();
  unint64_t v5 = sub_10000863C();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100005A58()
{
  uint64_t v0 = qword_10003C0E8;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100005A98()
{
  unint64_t result = qword_10003C310;
  if (!qword_10003C310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C310);
  }
  return result;
}

unint64_t sub_100005AF0()
{
  unint64_t result = qword_10003C318;
  if (!qword_10003C318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C318);
  }
  return result;
}

uint64_t sub_100005B44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005B70(a1, a2, a3, (void (*)(void))sub_100005940);
}

uint64_t sub_100005B70(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005BB8@<X0>(uint64_t a1@<X8>)
{
  return sub_100005BF0(&qword_10003C0E0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D4A0, a1);
}

uint64_t sub_100005BF0@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100008690(v7, a3);
  v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100005C94()
{
  return 0;
}

uint64_t sub_100005CA0()
{
  return 1;
}

uint64_t sub_100005CB0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100008594();
  unint64_t v7 = sub_1000085E8();
  unint64_t v8 = sub_10000863C();
  void *v5 = v2;
  v5[1] = sub_100005D84;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100005D84()
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

uint64_t sub_100005E8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100008264();
  *a1 = result;
  return result;
}

uint64_t sub_100005EB4(uint64_t a1)
{
  unint64_t v2 = sub_100005940();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenMessagesSettingsDeepLinks()
{
  return &type metadata for OpenMessagesSettingsDeepLinks;
}

unsigned char *initializeBufferWithCopyOfBuffer for MessagesSettingsDeepLinks(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MessagesSettingsDeepLinks(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEE) {
    goto LABEL_17;
  }
  if (a2 + 18 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 18) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 18;
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
      return (*a1 | (v4 << 8)) - 18;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 18;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x13;
  int v8 = v6 - 19;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MessagesSettingsDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 18 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 18) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xED)
  {
    unsigned int v6 = ((a2 - 238) >> 8) + 1;
    *uint64_t result = a2 + 18;
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
        JUMPOUT(0x10000606CLL);
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
          *uint64_t result = a2 + 18;
        break;
    }
  }
  return result;
}

uint64_t sub_100006094(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000060A0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MessagesSettingsDeepLinks()
{
  return &type metadata for MessagesSettingsDeepLinks;
}

unint64_t sub_1000060B8(char a1)
{
  sub_100029960();
  sub_100004B5C(a1);
  sub_100029900();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_100029970();

  return sub_100006140(a1, v2);
}

unint64_t sub_100006140(unsigned __int8 a1, uint64_t a2)
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
          unint64_t v8 = 0x6567617373654D69;
          goto LABEL_15;
        case 2:
          v9 = "ences";
          goto LABEL_13;
        case 3:
          unint64_t v8 = 0xD000000000000011;
          unint64_t v7 = 0x800000010002EEA0;
          break;
        case 4:
          unint64_t v8 = 0xD000000000000017;
          unint64_t v7 = 0x800000010002EEC0;
          break;
        case 5:
          unint64_t v8 = 0xD000000000000012;
          unint64_t v7 = 0x800000010002EEE0;
          break;
        case 6:
          unint64_t v8 = 0xD000000000000017;
          unint64_t v7 = 0x800000010002EF00;
          break;
        case 7:
          unint64_t v8 = 0xD000000000000016;
          unint64_t v7 = 0x800000010002EF20;
          break;
        case 8:
          unint64_t v8 = 0xD000000000000018;
          unint64_t v7 = 0x800000010002EF40;
          break;
        case 9:
          v9 = "showCharacterCountToggle";
LABEL_13:
          unint64_t v7 = (unint64_t)v9 | 0x8000000000000000;
          unint64_t v8 = 0xD000000000000010;
          break;
        case 0xA:
          unint64_t v8 = 0x654D796669746F6ELL;
LABEL_15:
          unint64_t v7 = 0xEE00656C67676F54;
          break;
        case 0xB:
          unint64_t v8 = 0xD00000000000001ALL;
          unint64_t v7 = 0x800000010002EF80;
          break;
        case 0xC:
          unint64_t v8 = 0xD000000000000013;
          unint64_t v7 = 0x800000010002EFA0;
          break;
        case 0xD:
          unint64_t v8 = 0xD000000000000019;
          unint64_t v7 = 0x800000010002EFC0;
          break;
        case 0xE:
          unint64_t v8 = 0xD000000000000015;
          unint64_t v7 = 0x800000010002EFE0;
          break;
        case 0xF:
          unint64_t v8 = 0x4364656B636F6C62;
          unint64_t v7 = 0xEF73746361746E6FLL;
          break;
        case 0x10:
          unint64_t v8 = 0xD000000000000011;
          unint64_t v7 = 0x800000010002F010;
          break;
        case 0x11:
          unint64_t v8 = 0x6C67676F54736D6DLL;
          goto LABEL_24;
        case 0x12:
          unint64_t v8 = 0x6C67676F54736372;
LABEL_24:
          unint64_t v7 = 0xE900000000000065;
          break;
        default:
          break;
      }
      unint64_t v10 = 0xE400000000000000;
      switch(v6)
      {
        case 1:
          uint64_t v11 = 0x6567617373654D69;
          goto LABEL_40;
        case 2:
          uint64_t v12 = "ences";
          goto LABEL_37;
        case 3:
          unint64_t v13 = 0xD000000000000011;
          char v14 = "iMessageAppsPane";
          goto LABEL_46;
        case 4:
          unint64_t v13 = 0xD000000000000017;
          char v14 = "sharedWithYouPane";
          goto LABEL_46;
        case 5:
          unint64_t v13 = 0xD000000000000012;
          char v14 = "showContactPhotosToggle";
          goto LABEL_46;
        case 6:
          unint64_t v13 = 0xD000000000000017;
          char v14 = "readReceiptsToggle";
          goto LABEL_46;
        case 7:
          unint64_t v13 = 0xD000000000000016;
          char v14 = "sendAsTextMessageToggle";
          goto LABEL_46;
        case 8:
          unint64_t v13 = 0xD000000000000018;
          char v14 = "showSubjectFieldToggle";
          goto LABEL_46;
        case 9:
          uint64_t v12 = "showCharacterCountToggle";
LABEL_37:
          unint64_t v10 = (unint64_t)v12 | 0x8000000000000000;
          if (v8 != 0xD000000000000010) {
            goto LABEL_48;
          }
          goto LABEL_47;
        case 10:
          uint64_t v11 = 0x654D796669746F6ELL;
LABEL_40:
          unint64_t v10 = 0xEE00656C67676F54;
          if (v8 != v11) {
            goto LABEL_48;
          }
          goto LABEL_47;
        case 11:
          unint64_t v13 = 0xD00000000000001ALL;
          char v14 = "keepMessagesPane";
          goto LABEL_46;
        case 12:
          unint64_t v13 = 0xD000000000000013;
          char v14 = "filterUnknownSendersToggle";
          goto LABEL_46;
        case 13:
          unint64_t v13 = 0xD000000000000019;
          char v14 = "raiseToListenToggle";
          goto LABEL_46;
        case 14:
          unint64_t v13 = 0xD000000000000015;
          char v14 = "lowQualityImageModeToggle";
LABEL_46:
          unint64_t v10 = (unint64_t)v14 | 0x8000000000000000;
          if (v8 == v13) {
            goto LABEL_47;
          }
          goto LABEL_48;
        case 15:
          unint64_t v10 = 0xEF73746361746E6FLL;
          if (v8 != 0x4364656B636F6C62) {
            goto LABEL_48;
          }
          goto LABEL_47;
        case 16:
          unint64_t v10 = 0x800000010002F010;
          if (v8 != 0xD000000000000011) {
            goto LABEL_48;
          }
          goto LABEL_47;
        case 17:
          uint64_t v16 = 0x6C67676F54736D6DLL;
          goto LABEL_57;
        case 18:
          uint64_t v16 = 0x6C67676F54736372;
LABEL_57:
          unint64_t v10 = 0xE900000000000065;
          if (v8 != v16) {
            goto LABEL_48;
          }
          goto LABEL_47;
        default:
          if (v8 != 1953460082) {
            goto LABEL_48;
          }
LABEL_47:
          if (v7 == v10)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_48:
          char v15 = sub_100029940();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v15) {
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

unint64_t sub_10000669C()
{
  uint64_t v0 = sub_100008550(&qword_10003C358);
  __chkstk_darwin(v0 - 8);
  v136 = (char *)&v129 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v2 - 8);
  unint64_t v4 = (char *)&v129 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000297D0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v129 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100029810();
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v129 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000298E0();
  __chkstk_darwin(v12 - 8);
  char v14 = (char *)&v129 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v158 = sub_1000297E0();
  uint64_t v143 = *(void *)(v158 - 8);
  uint64_t v15 = __chkstk_darwin(v158);
  v157 = (char *)&v129 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v129 - v17;
  sub_100008550(&qword_10003C360);
  uint64_t v19 = sub_100008550(&qword_10003C368);
  unint64_t v20 = (*(unsigned __int8 *)(*(void *)(v19 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v19 - 8) + 80);
  uint64_t v152 = *(void *)(*(void *)(v19 - 8) + 72);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_100029BB0;
  uint64_t v134 = v21;
  uint64_t v22 = (unsigned char *)(v21 + v20);
  uint64_t v153 = v19;
  uint64_t v156 = *(int *)(v19 + 48);
  *uint64_t v22 = 0;
  sub_1000298D0();
  sub_100029800();
  uint64_t v23 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v24 = *(void (**)(void, void, void))(v6 + 104);
  v24(v8, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  v149 = v18;
  sub_1000297F0();
  sub_1000298D0();
  sub_100029800();
  uint64_t v25 = v23;
  uint64_t v141 = v5;
  uint64_t v142 = v6 + 104;
  v140 = v24;
  v24(v8, v23, v5);
  v138 = v11;
  uint64_t v26 = v143;
  v139 = v8;
  sub_1000297F0();
  v27 = *(void (**)(void, void, void, void))(v26 + 56);
  v133 = v4;
  v150 = v27;
  uint64_t v151 = v26 + 56;
  v27(v4, 0, 1, v158);
  if (qword_10003C1C0 != -1) {
    swift_once();
  }
  unint64_t v145 = (unint64_t)&v22[v156];
  uint64_t v28 = sub_100029620();
  uint64_t v29 = sub_100008690(v28, (uint64_t)qword_10003D6C0);
  uint64_t v144 = v28;
  uint64_t v30 = *(void *)(v28 - 8);
  v31 = *(void (**)(void, void, void))(v30 + 16);
  uint64_t v146 = v29;
  v147 = v31;
  uint64_t v148 = v30 + 16;
  v32 = v136;
  v31(v136, v29, v28);
  v155 = *(void (**)(void, void, void, void))(v30 + 56);
  uint64_t v156 = v30 + 56;
  v155(v32, 0, 1, v28);
  sub_100008550(&qword_10003C370);
  v154 = v22;
  uint64_t v33 = *(void *)(v26 + 72);
  unint64_t v34 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  uint64_t v35 = swift_allocObject();
  uint64_t v143 = v35;
  *(_OWORD *)(v35 + 16) = xmmword_100029BC0;
  unint64_t v36 = v35 + v34;
  v37 = v14;
  sub_1000298D0();
  sub_100029800();
  v38 = v139;
  unsigned int v137 = v25;
  uint64_t v39 = v141;
  v40 = v140;
  v140(v139, v25, v141);
  unint64_t v131 = v36;
  sub_1000297F0();
  uint64_t v135 = v33;
  sub_1000298D0();
  sub_100029800();
  v40(v38, v25, v39);
  sub_1000297F0();
  sub_1000298D0();
  sub_100029800();
  v40(v38, v25, v39);
  sub_1000297F0();
  v132 = v37;
  sub_1000298D0();
  sub_100029800();
  v40(v38, v25, v39);
  sub_1000297F0();
  sub_1000297C0();
  v41 = v133;
  v42 = v136;
  sub_100029630();
  v43 = v154;
  uint64_t v135 = (uint64_t)&v154[v152 + *(int *)(v153 + 48)];
  v154[v152] = 1;
  sub_1000297C0();
  unint64_t v145 = 0x800000010002F120;
  sub_1000297C0();
  v150(v41, 0, 1, v158);
  uint64_t v45 = v146;
  v44 = v147;
  uint64_t v46 = v144;
  v147(v42, v146, v144);
  v47 = v155;
  v155(v42, 0, 1, v46);
  uint64_t v143 = 0x800000010002F140;
  sub_1000297C0();
  v48 = v42;
  sub_100029630();
  uint64_t v49 = v152;
  uint64_t v135 = 2 * v152;
  v50 = &v43[2 * v152];
  unint64_t v131 = (unint64_t)&v50[*(int *)(v153 + 48)];
  unsigned char *v50 = 2;
  sub_1000297C0();
  sub_1000297C0();
  v51 = v150;
  v150(v41, 0, 1, v158);
  v52 = v48;
  v53 = v48;
  uint64_t v54 = v144;
  v44(v53, v45, v144);
  v47(v52, 0, 1, v54);
  sub_1000297C0();
  sub_100029630();
  v55 = v154;
  v154[v135 + v49] = 3;
  sub_1000297C0();
  sub_1000297C0();
  v51(v41, 0, 1, v158);
  v147(v52, v146, v54);
  v56 = v52;
  v155(v52, 0, 1, v54);
  sub_1000297C0();
  sub_100029630();
  uint64_t v57 = v152;
  uint64_t v135 = 4 * v152;
  v58 = &v55[4 * v152];
  uint64_t v59 = v153;
  unint64_t v131 = (unint64_t)&v58[*(int *)(v153 + 48)];
  unsigned char *v58 = 4;
  sub_1000297C0();
  sub_1000297C0();
  uint64_t v60 = v158;
  v150(v41, 0, 1, v158);
  v147(v56, v146, v54);
  v155(v56, 0, 1, v54);
  sub_1000297C0();
  sub_100029630();
  v61 = &v154[v135 + v57];
  uint64_t v135 = (uint64_t)&v61[*(int *)(v59 + 48)];
  unsigned char *v61 = 5;
  unint64_t v130 = 0xD000000000000012;
  sub_1000297C0();
  sub_1000297C0();
  v62 = v150;
  v150(v41, 0, 1, v60);
  uint64_t v64 = v146;
  v63 = v147;
  uint64_t v65 = v144;
  v147(v56, v146, v144);
  v155(v56, 0, 1, v65);
  sub_1000297C0();
  sub_100029630();
  uint64_t v66 = v153;
  v67 = &v154[6 * v152];
  uint64_t v135 = (uint64_t)&v67[*(int *)(v153 + 48)];
  unsigned char *v67 = 6;
  unint64_t v131 = 0xD000000000000014;
  sub_1000297C0();
  sub_1000297C0();
  v62(v41, 0, 1, v158);
  v68 = v56;
  uint64_t v69 = v144;
  v63(v56, v64, v144);
  v155(v56, 0, 1, v69);
  sub_1000297C0();
  sub_100029630();
  uint64_t v135 = 8 * v152;
  v70 = &v154[7 * v152];
  v129 = &v70[*(int *)(v66 + 48)];
  unsigned char *v70 = 7;
  sub_1000297C0();
  sub_1000297C0();
  uint64_t v71 = v158;
  v72 = v150;
  v150(v41, 0, 1, v158);
  uint64_t v73 = v146;
  v63(v68, v146, v69);
  v74 = v155;
  v155(v68, 0, 1, v69);
  sub_1000297C0();
  v75 = v68;
  sub_100029630();
  v76 = v154;
  unint64_t v130 = (unint64_t)&v154[v135 + *(int *)(v153 + 48)];
  v154[v135] = 8;
  sub_1000297C0();
  sub_1000297C0();
  v72(v41, 0, 1, v71);
  v77 = v75;
  v78 = v75;
  uint64_t v79 = v144;
  v147(v78, v73, v144);
  v74(v77, 0, 1, v79);
  sub_1000297C0();
  sub_100029630();
  uint64_t v80 = v152;
  v81 = &v76[v135 + v152];
  uint64_t v135 = (uint64_t)&v81[*(int *)(v153 + 48)];
  unsigned char *v81 = 9;
  sub_1000297C0();
  sub_1000297C0();
  v150(v41, 0, 1, v158);
  v82 = v77;
  v83 = v77;
  uint64_t v84 = v146;
  v147(v83, v146, v79);
  v155(v82, 0, 1, v79);
  sub_1000297C0();
  sub_100029630();
  uint64_t v85 = v153;
  v86 = v154;
  v87 = &v154[10 * v80];
  uint64_t v135 = (uint64_t)&v87[*(int *)(v153 + 48)];
  unsigned char *v87 = 10;
  sub_1000297C0();
  sub_1000297C0();
  v88 = v150;
  v150(v41, 0, 1, v158);
  uint64_t v89 = v144;
  v90 = v147;
  v147(v82, v84, v144);
  v155(v82, 0, 1, v89);
  sub_1000297C0();
  sub_100029630();
  v91 = &v86[11 * v152];
  unint64_t v130 = (unint64_t)&v91[*(int *)(v85 + 48)];
  unsigned char *v91 = 11;
  uint64_t v135 = 0xD000000000000016;
  sub_1000297C0();
  sub_1000297C0();
  uint64_t v92 = v158;
  v88(v41, 0, 1, v158);
  uint64_t v93 = v146;
  v90(v82, v146, v89);
  v94 = v155;
  v155(v82, 0, 1, v89);
  sub_1000297C0();
  sub_100029630();
  uint64_t v95 = v152;
  v96 = &v154[12 * v152];
  unint64_t v130 = (unint64_t)&v96[*(int *)(v153 + 48)];
  unsigned char *v96 = 12;
  sub_1000297C0();
  sub_1000297C0();
  v150(v41, 0, 1, v92);
  v147(v82, v93, v89);
  v94(v82, 0, 1, v89);
  sub_1000297C0();
  sub_100029630();
  uint64_t v97 = v153;
  v98 = &v154[13 * v95];
  unint64_t v130 = (unint64_t)&v98[*(int *)(v153 + 48)];
  unsigned char *v98 = 13;
  sub_1000297C0();
  sub_1000297C0();
  uint64_t v99 = v158;
  v150(v41, 0, 1, v158);
  uint64_t v100 = v146;
  v101 = v147;
  uint64_t v102 = v144;
  v147(v82, v146, v144);
  uint64_t v103 = v102;
  v104 = v155;
  v155(v82, 0, 1, v103);
  sub_1000297C0();
  sub_100029630();
  v105 = &v154[14 * v152];
  uint64_t v143 = (uint64_t)&v105[*(int *)(v97 + 48)];
  unsigned char *v105 = 14;
  sub_1000297C0();
  sub_1000297C0();
  uint64_t v106 = v99;
  v107 = v150;
  v150(v41, 0, 1, v106);
  uint64_t v108 = v100;
  uint64_t v109 = v144;
  v101(v82, v108, v144);
  v104(v82, 0, 1, v109);
  sub_1000297C0();
  sub_100029630();
  uint64_t v143 = 16 * v152;
  v110 = &v154[15 * v152];
  uint64_t v135 = (uint64_t)&v110[*(int *)(v153 + 48)];
  unsigned char *v110 = 15;
  sub_1000297C0();
  sub_1000297C0();
  uint64_t v111 = v158;
  v107(v41, 0, 1, v158);
  v112 = v147;
  uint64_t v113 = v144;
  v147(v82, v146, v144);
  v155(v82, 0, 1, v113);
  sub_1000297C0();
  sub_100029630();
  uint64_t v115 = v153;
  v114 = v154;
  uint64_t v135 = (uint64_t)&v154[v143 + *(int *)(v153 + 48)];
  v154[v143] = 16;
  sub_1000297C0();
  sub_1000297C0();
  v150(v41, 0, 1, v111);
  uint64_t v116 = v146;
  uint64_t v117 = v144;
  v112(v82, v146, v144);
  uint64_t v118 = v117;
  v119 = v155;
  v155(v82, 0, 1, v117);
  sub_1000297C0();
  sub_100029630();
  v120 = &v114[v143 + v152];
  uint64_t v135 = (uint64_t)&v120[*(int *)(v115 + 48)];
  unsigned char *v120 = 17;
  sub_1000298D0();
  sub_100029800();
  v121 = v139;
  v140(v139, v137, v141);
  sub_1000297F0();
  sub_1000297C0();
  v122 = v150;
  v150(v41, 0, 1, v158);
  uint64_t v123 = v116;
  uint64_t v124 = v118;
  uint64_t v125 = v118;
  v126 = v147;
  v147(v82, v123, v125);
  v119(v82, 0, 1, v124);
  uint64_t v143 = 0xD000000000000028;
  sub_1000297C0();
  sub_100029630();
  v127 = &v154[18 * v152];
  v154 = &v127[*(int *)(v153 + 48)];
  unsigned char *v127 = 18;
  sub_1000298D0();
  sub_100029800();
  v140(v121, v137, v141);
  sub_1000297F0();
  sub_1000297C0();
  v122(v41, 0, 1, v158);
  v126(v82, v146, v124);
  v155(v82, 0, 1, v124);
  sub_1000297C0();
  sub_100029630();
  return sub_1000047FC(v134);
}

uint64_t sub_100008210()
{
  unint64_t v0 = sub_100029950();
  swift_bridgeObjectRelease();
  if (v0 >= 0x13) {
    return 19;
  }
  else {
    return v0;
  }
}

uint64_t sub_100008264()
{
  uint64_t v16 = sub_1000296C0();
  uint64_t v0 = *(void *)(v16 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008550(&qword_10003C328);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000297E0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_100008550(&qword_10003C338);
  sub_1000297C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  char v17 = 19;
  uint64_t v13 = sub_1000293F0();
  char v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v16);
  sub_10000500C();
  return sub_100029450();
}

uint64_t sub_100008550(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100008594()
{
  unint64_t result = qword_10003C340;
  if (!qword_10003C340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C340);
  }
  return result;
}

unint64_t sub_1000085E8()
{
  unint64_t result = qword_10003C348;
  if (!qword_10003C348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C348);
  }
  return result;
}

unint64_t sub_10000863C()
{
  unint64_t result = qword_10003C350;
  if (!qword_10003C350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C350);
  }
  return result;
}

uint64_t sub_100008690(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000086C8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000872C(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100008740(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100008550(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000087A4()
{
  uint64_t v0 = sub_100008550(&qword_10003C3C8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005940();
  sub_100029550();
  uint64_t v4 = sub_1000294E0();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_100029550();
  uint64_t v6 = sub_1000294E0();
  v5(v3, v0);
  sub_100029550();
  uint64_t v7 = sub_1000294E0();
  v5(v3, v0);
  sub_100029550();
  uint64_t v8 = sub_1000294E0();
  v5(v3, v0);
  sub_100008550(&qword_10003C3D0);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100029BC0;
  *(void *)(v9 + 32) = v4;
  *(void *)(v9 + 40) = v6;
  *(void *)(v9 + 48) = v7;
  *(void *)(v9 + 56) = v8;
  uint64_t v10 = sub_1000294D0();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100008A00()
{
  return sub_100008D00();
}

uint64_t sub_100008A18()
{
  return sub_100008E78();
}

uint64_t sub_100008A30()
{
  return sub_100008B40();
}

uint64_t sub_100008A68()
{
  return sub_100008D00();
}

uint64_t sub_100008A80()
{
  return sub_100008E78();
}

uint64_t sub_100008A9C()
{
  return sub_100008B40();
}

uint64_t sub_100008AD4()
{
  return sub_100008D00();
}

uint64_t sub_100008AEC()
{
  return sub_100008E78();
}

uint64_t sub_100008B08()
{
  return sub_100008B40();
}

uint64_t sub_100008B40()
{
  uint64_t v0 = sub_100008550(&qword_10003C3C8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005940();
  sub_100029550();
  uint64_t v4 = sub_1000294E0();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_100029550();
  uint64_t v6 = sub_1000294E0();
  v5(v3, v0);
  sub_100008550(&qword_10003C3D0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10002A100;
  *(void *)(v7 + 32) = v4;
  *(void *)(v7 + 40) = v6;
  uint64_t v8 = sub_1000294D0();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_100008CE8()
{
  return sub_100008D00();
}

uint64_t sub_100008D00()
{
  uint64_t v0 = sub_100029540();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_1000053C0();
  sub_1000294C0();
  swift_release();
  sub_100005940();
  sub_100029530();
  uint64_t v4 = sub_100029520();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100008550(&qword_10003C3C0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10002A110;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100029510();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100008E5C()
{
  return sub_100008E78();
}

uint64_t sub_100008E78()
{
  uint64_t v0 = sub_100029500();
  sub_100008550(&qword_10003C3B0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10002A110;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_1000294F0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_100008EDC()
{
  uint64_t v0 = sub_100029500();
  uint64_t v1 = sub_100029500();
  sub_100008550(&qword_10003C3B0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10002A100;
  *(void *)(v2 + 32) = v0;
  *(void *)(v2 + 40) = v1;
  uint64_t v3 = sub_1000294F0();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_100008F8C()
{
  uint64_t v0 = sub_1000294B0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005940();
  sub_1000294A0();
  uint64_t v4 = sub_100029490();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100008550(&qword_10003C3A8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10002A110;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100029480();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for MessagesSettingsAssistantIntents()
{
  return &type metadata for MessagesSettingsAssistantIntents;
}

uint64_t sub_1000090D4()
{
  uint64_t v0 = sub_100029580();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100008264();
  sub_100005940();
  sub_100029590();
  uint64_t v4 = sub_100029570();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  uint64_t v13 = sub_100008264();
  sub_100029590();
  uint64_t v6 = sub_100029570();
  v5(v3, v0);
  uint64_t v13 = sub_100008264();
  sub_100029590();
  uint64_t v7 = sub_100029570();
  v5(v3, v0);
  uint64_t v13 = sub_100008264();
  sub_100029590();
  uint64_t v8 = sub_100029570();
  v5(v3, v0);
  sub_100008550(&qword_10003C3B8);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100029BC0;
  *(void *)(v9 + 32) = v4;
  *(void *)(v9 + 40) = v6;
  *(void *)(v9 + 48) = v7;
  *(void *)(v9 + 56) = v8;
  uint64_t v10 = sub_100029560();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100009398@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100029430();
  *a1 = v3;
  return result;
}

uint64_t sub_1000093D4()
{
  return sub_100029440();
}

ValueMetadata *type metadata accessor for SubjectFieldToggle()
{
  return &type metadata for SubjectFieldToggle;
}

ValueMetadata *type metadata accessor for ContactPhotosToggle()
{
  return &type metadata for ContactPhotosToggle;
}

ValueMetadata *type metadata accessor for ReadReceiptsToggle()
{
  return &type metadata for ReadReceiptsToggle;
}

ValueMetadata *type metadata accessor for SendAsTextMessageToggle()
{
  return &type metadata for SendAsTextMessageToggle;
}

ValueMetadata *type metadata accessor for RaiseToListenToggle()
{
  return &type metadata for RaiseToListenToggle;
}

ValueMetadata *type metadata accessor for NotifyMeToggle()
{
  return &type metadata for NotifyMeToggle;
}

ValueMetadata *type metadata accessor for LowQualityImageModeToggle()
{
  return &type metadata for LowQualityImageModeToggle;
}

ValueMetadata *type metadata accessor for FilterUnknownSendersToggle()
{
  return &type metadata for FilterUnknownSendersToggle;
}

ValueMetadata *type metadata accessor for CharacterCountToggle()
{
  return &type metadata for CharacterCountToggle;
}

uint64_t sub_10000949C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000094B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100008550(&qword_10003C3D8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100008550(&qword_10003C3E0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100008550(&qword_10003C3E8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100008550(&qword_10003C3F0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100008550(&qword_10003C3F8);
  sub_10000C9E4();
  sub_10000C5A8(&qword_10003C408, &qword_10003C3F8);
  sub_1000298C0();
  sub_100029840();
  uint64_t v16 = sub_10000C5A8(&qword_10003C410, &qword_10003C3D8);
  sub_100029870();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_100029840();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_100029850();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_100029880();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_100029860();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_1000099CC()
{
  return sub_10000C474();
}

uint64_t sub_1000099F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100009A14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100008550(&qword_10003C3D8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100008550(&qword_10003C3E0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100008550(&qword_10003C3E8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100008550(&qword_10003C3F0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100008550(&qword_10003C3F8);
  sub_10000C98C();
  sub_10000C5A8(&qword_10003C408, &qword_10003C3F8);
  sub_1000298C0();
  sub_100029840();
  uint64_t v16 = sub_10000C5A8(&qword_10003C410, &qword_10003C3D8);
  sub_100029870();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_100029840();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_100029850();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_100029880();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_100029860();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_100009F28()
{
  return sub_10000C474();
}

uint64_t sub_100009F48()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100009F64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100008550(&qword_10003C3D8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100008550(&qword_10003C3E0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100008550(&qword_10003C3E8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100008550(&qword_10003C3F0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100008550(&qword_10003C3F8);
  sub_10000C934();
  sub_10000C5A8(&qword_10003C408, &qword_10003C3F8);
  sub_1000298C0();
  sub_100029840();
  uint64_t v16 = sub_10000C5A8(&qword_10003C410, &qword_10003C3D8);
  sub_100029870();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_100029840();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_100029850();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_100029880();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_100029860();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10000A478()
{
  return sub_10000C474();
}

uint64_t sub_10000A498()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000A4B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100008550(&qword_10003C3D8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100008550(&qword_10003C3E0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100008550(&qword_10003C3E8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100008550(&qword_10003C3F0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100008550(&qword_10003C3F8);
  sub_10000C8DC();
  sub_10000C5A8(&qword_10003C408, &qword_10003C3F8);
  sub_1000298C0();
  sub_100029840();
  uint64_t v16 = sub_10000C5A8(&qword_10003C410, &qword_10003C3D8);
  sub_100029870();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_100029840();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_100029850();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_100029880();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_100029860();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10000A9C0()
{
  return sub_10000C474();
}

uint64_t sub_10000A9E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000A9FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100008550(&qword_10003C3D8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100008550(&qword_10003C3E0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100008550(&qword_10003C3E8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100008550(&qword_10003C3F0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100008550(&qword_10003C3F8);
  sub_10000C884();
  sub_10000C5A8(&qword_10003C408, &qword_10003C3F8);
  sub_1000298C0();
  sub_100029840();
  uint64_t v16 = sub_10000C5A8(&qword_10003C410, &qword_10003C3D8);
  sub_100029870();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_100029840();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_100029850();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_100029880();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_100029860();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10000AF10()
{
  return sub_10000C474();
}

uint64_t sub_10000AF38()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000AF54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100008550(&qword_10003C3D8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100008550(&qword_10003C3E0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100008550(&qword_10003C3E8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100008550(&qword_10003C3F0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100008550(&qword_10003C3F8);
  sub_10000C82C();
  sub_10000C5A8(&qword_10003C408, &qword_10003C3F8);
  sub_1000298C0();
  sub_100029840();
  uint64_t v16 = sub_10000C5A8(&qword_10003C410, &qword_10003C3D8);
  sub_100029870();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_100029840();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_100029850();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_100029880();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_100029860();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10000B468()
{
  return sub_10000C474();
}

uint64_t sub_10000B488()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000B4A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100008550(&qword_10003C3D8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100008550(&qword_10003C3E0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100008550(&qword_10003C3E8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100008550(&qword_10003C3F0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100008550(&qword_10003C3F8);
  sub_10000C7D4();
  sub_10000C5A8(&qword_10003C408, &qword_10003C3F8);
  sub_1000298C0();
  sub_100029840();
  uint64_t v16 = sub_10000C5A8(&qword_10003C410, &qword_10003C3D8);
  sub_100029870();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_100029840();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_100029850();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_100029880();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_100029860();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10000B9B8()
{
  return sub_10000C474();
}

uint64_t sub_10000B9D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000B9F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100008550(&qword_10003C3D8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100008550(&qword_10003C3E0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100008550(&qword_10003C3E8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100008550(&qword_10003C3F0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100008550(&qword_10003C3F8);
  sub_10000C77C();
  sub_10000C5A8(&qword_10003C408, &qword_10003C3F8);
  sub_1000298C0();
  sub_100029840();
  uint64_t v16 = sub_10000C5A8(&qword_10003C410, &qword_10003C3D8);
  sub_100029870();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_100029840();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_100029850();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_100029880();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_100029860();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10000BF08()
{
  return sub_10000C474();
}

uint64_t sub_10000BF28()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000BF44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100008550(&qword_10003C3D8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100008550(&qword_10003C3E0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100008550(&qword_10003C3E8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100008550(&qword_10003C3F0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100008550(&qword_10003C3F8);
  sub_10000C554();
  sub_10000C5A8(&qword_10003C408, &qword_10003C3F8);
  sub_1000298C0();
  sub_100029840();
  uint64_t v16 = sub_10000C5A8(&qword_10003C410, &qword_10003C3D8);
  sub_100029870();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_100029840();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_100029850();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_100029880();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_100029860();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10000C458()
{
  return sub_10000C474();
}

uint64_t sub_10000C474()
{
  uint64_t v0 = sub_100029840();

  return Label<>.init(_:systemImage:)(v0);
}

uint64_t sub_10000C4D4@<X0>(uint64_t a1@<X8>)
{
  sub_100029840();
  uint64_t result = sub_100029890();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

unint64_t sub_10000C554()
{
  unint64_t result = qword_10003C400;
  if (!qword_10003C400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C400);
  }
  return result;
}

uint64_t sub_10000C5A8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000056D8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000C5EC(char a1)
{
  uint64_t v2 = (objc_class *)[self mainBundle];
  if (a1)
  {
    v6._countAndFlagsBits = 0x800000010002FE40;
    v3._countAndFlagsBits = 28239;
    v3._object = (void *)0xE200000000000000;
  }
  else
  {
    v6._countAndFlagsBits = 0x800000010002FE20;
    v3._countAndFlagsBits = 6710863;
    v3._object = (void *)0xE300000000000000;
  }
  v7.value._countAndFlagsBits = 0;
  v7.value._object = 0;
  v4.super.isa = v2;
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_1000297B0(v3, v7, v4, v8, v6);

  sub_10000C6F0();
  return sub_1000298A0();
}

unint64_t sub_10000C6F0()
{
  unint64_t result = qword_10003C418;
  if (!qword_10003C418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C418);
  }
  return result;
}

uint64_t sub_10000C748@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10000C5EC(a1);
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5 & 1;
  *(void *)(a2 + 24) = v6;
  return result;
}

unint64_t sub_10000C77C()
{
  unint64_t result = qword_10003C420;
  if (!qword_10003C420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C420);
  }
  return result;
}

unint64_t sub_10000C7D4()
{
  unint64_t result = qword_10003C428;
  if (!qword_10003C428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C428);
  }
  return result;
}

unint64_t sub_10000C82C()
{
  unint64_t result = qword_10003C430;
  if (!qword_10003C430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C430);
  }
  return result;
}

unint64_t sub_10000C884()
{
  unint64_t result = qword_10003C438;
  if (!qword_10003C438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C438);
  }
  return result;
}

unint64_t sub_10000C8DC()
{
  unint64_t result = qword_10003C440;
  if (!qword_10003C440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C440);
  }
  return result;
}

unint64_t sub_10000C934()
{
  unint64_t result = qword_10003C448;
  if (!qword_10003C448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C448);
  }
  return result;
}

unint64_t sub_10000C98C()
{
  unint64_t result = qword_10003C450;
  if (!qword_10003C450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C450);
  }
  return result;
}

unint64_t sub_10000C9E4()
{
  unint64_t result = qword_10003C458;
  if (!qword_10003C458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C458);
  }
  return result;
}

uint64_t sub_10000CA38()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000CB68()
{
  unint64_t result = qword_10003C460;
  if (!qword_10003C460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C460);
  }
  return result;
}

unint64_t sub_10000CBC0()
{
  unint64_t result = qword_10003C468;
  if (!qword_10003C468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C468);
  }
  return result;
}

uint64_t sub_10000CC18@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_10000CC24()
{
  uint64_t v0 = sub_1000297D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  Swift::String v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100029810();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_1000298E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_1000297E0();
  sub_1000086C8(v6, qword_10003D4B8);
  sub_100008690(v6, (uint64_t)qword_10003D4B8);
  sub_1000298D0();
  sub_100029800();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_1000297F0();
}

uint64_t sub_10000CE04@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100029430();
  *a1 = v3;
  return result;
}

uint64_t sub_10000CE40()
{
  return swift_release();
}

void (*sub_10000CE88(void *a1))(void *)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100029420();
  return sub_10000CEE4;
}

unint64_t sub_10000CEEC()
{
  unint64_t result = qword_10003C470;
  if (!qword_10003C470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C470);
  }
  return result;
}

uint64_t sub_10000CF40(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10001049C();
  unint64_t v5 = sub_10000FCB0();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10000CFAC()
{
  unint64_t result = qword_10003C478;
  if (!qword_10003C478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C478);
  }
  return result;
}

unint64_t sub_10000D004()
{
  unint64_t result = qword_10003C480;
  if (!qword_10003C480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C480);
  }
  return result;
}

uint64_t sub_10000D058(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000F108(a1, a2, a3, (void (*)(void))sub_10000CEEC);
}

uint64_t sub_10000D070@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C0F8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D4B8, a1);
}

uint64_t sub_10000D0A8(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001049C();
  unint64_t v7 = sub_1000104F0();
  unint64_t v8 = sub_10000FCB0();
  void *v5 = v2;
  v5[1] = sub_100005D84;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_10000D17C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000FD04();
  *a1 = result;
  return result;
}

uint64_t sub_10000D1A4(uint64_t a1)
{
  unint64_t v2 = sub_10000CEEC();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10000D1E4()
{
  unint64_t result = qword_10003C490;
  if (!qword_10003C490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C490);
  }
  return result;
}

uint64_t sub_10000D23C()
{
  uint64_t v0 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1000297D0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100029810();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_1000298E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_1000297E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_100029770();
  sub_1000086C8(v10, qword_10003D4D0);
  sub_100008690(v10, (uint64_t)qword_10003D4D0);
  sub_1000298D0();
  sub_100029800();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_1000297F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_100029760();
}

uint64_t sub_10000D51C()
{
  uint64_t v0 = sub_100008550(&qword_10003C358);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000297E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_1000297C0();
  sub_1000297C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  if (qword_10003C1C0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100029620();
  uint64_t v9 = sub_100008690(v8, (uint64_t)qword_10003D6C0);
  uint64_t v10 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v2, v9, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v2, 0, 1, v8);
  return sub_100029640();
}

uint64_t sub_10000D790(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_1000297E0();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_10000D820, 0, 0);
}

uint64_t sub_10000D820()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100008550(&qword_10003C518);
  sub_1000297C0();
  sub_10000C5A8(&qword_10003C5F0, &qword_10003C5F8);
  uint64_t *v1 = sub_1000297A0();
  swift_task_dealloc();
  unint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_10000D93C()
{
  unint64_t result = qword_10003C4A0;
  if (!qword_10003C4A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C4A0);
  }
  return result;
}

uint64_t sub_10000D990(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000F534();
  *uint64_t v4 = v2;
  v4[1] = sub_10000DA40;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_10000DA40(uint64_t a1)
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

unint64_t sub_10000DB58()
{
  unint64_t result = qword_10003C4B0;
  if (!qword_10003C4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C4B0);
  }
  return result;
}

unint64_t sub_10000DBB0()
{
  unint64_t result = qword_10003C4B8;
  if (!qword_10003C4B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C4B8);
  }
  return result;
}

unint64_t sub_10000DC08()
{
  unint64_t result = qword_10003C4C0[0];
  if (!qword_10003C4C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10003C4C0);
  }
  return result;
}

uint64_t sub_10000DC5C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000F534();
  void *v5 = v2;
  v5[1] = sub_10000DD10;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10000DD10(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_10000DE10(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000F534();
  *uint64_t v4 = v2;
  v4[1] = sub_100010544;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10000DEC4()
{
  unint64_t result = qword_10003C4D8;
  if (!qword_10003C4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C4D8);
  }
  return result;
}

unint64_t sub_10000DF1C()
{
  unint64_t result = qword_10003C4E0;
  if (!qword_10003C4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C4E0);
  }
  return result;
}

unint64_t sub_10000DF74()
{
  unint64_t result = qword_10003C4E8;
  if (!qword_10003C4E8)
  {
    sub_1000056D8(qword_10003C4F0);
    sub_10000DF1C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C4E8);
  }
  return result;
}

uint64_t sub_10000DFE8(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000D93C();
  void *v5 = v2;
  v5[1] = sub_10000E09C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10000E09C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000E190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_10000E09C;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

unint64_t sub_10000E24C()
{
  unint64_t result = qword_10003C508;
  if (!qword_10003C508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C508);
  }
  return result;
}

uint64_t sub_10000E2A0()
{
  return sub_10000C5A8(&qword_10003C510, &qword_10003C518);
}

uint64_t sub_10000E2DC()
{
  uint64_t v0 = sub_1000297E0();
  sub_1000086C8(v0, qword_10003D4E8);
  sub_100008690(v0, (uint64_t)qword_10003D4E8);
  return sub_1000297C0();
}

uint64_t sub_10000E340()
{
  uint64_t v0 = sub_100008550(&qword_10003C610);
  sub_1000086C8(v0, qword_10003D500);
  uint64_t v1 = sub_100008690(v0, (uint64_t)qword_10003D500);
  sub_1000295A0();
  uint64_t v2 = sub_1000295B0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10000E3F8()
{
  uint64_t result = swift_getKeyPath();
  qword_10003D518 = result;
  return result;
}

uint64_t sub_10000E420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100008550(&qword_10003C5D0);
  v3[9] = swift_task_alloc();
  sub_100008550(&qword_10003C5D8);
  v3[10] = swift_task_alloc();
  sub_100008550(&qword_10003C5E0);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_1000293F0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100008550(&qword_10003C5E8);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_10000E5E4, 0, 0);
}

uint64_t sub_10000E5E4()
{
  sub_100029430();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_10000DC08();
  void *v1 = v0;
  v1[1] = sub_10000E6B8;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_10000ED74, 0, &type metadata for CharacterCountEntity, v2);
}

uint64_t sub_10000E6B8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10000E7B4, 0, 0);
}

uint64_t sub_10000E7B4()
{
  sub_100029430();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_100029430();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_10003C118 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10003D518;
  *(void *)(v0 + 168) = qword_10003D518;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_10000C5A8(&qword_10003C5F0, &qword_10003C5F8);
  *uint64_t v3 = v0;
  v3[1] = sub_10000E90C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_10000E90C()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10000ECB0;
  }
  else {
    uint64_t v2 = sub_10000EA60;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000EA60()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_100029430();
  uint64_t v7 = sub_100029750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_100029780();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_10000E24C();
  sub_10000DF1C();
  sub_1000293C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_1000293E0();
  sub_100029400();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10000ECB0()
{
  (*(void (**)(void, void))(v0[16] + 8))(v0[18], v0[15]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10000ED78()
{
  uint64_t v0 = sub_100008550(&qword_10003C600);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003C118 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100029600();
  swift_release();
  sub_10000DF1C();
  sub_10000C5A8(&qword_10003C608, &qword_10003C600);
  sub_1000295F0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10000EEE0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100029430();
  *a1 = v3;
  return result;
}

uint64_t sub_10000EF1C()
{
  return sub_100029440();
}

void (*sub_10000EF54(void *a1))(void *)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100029420();
  return sub_10000CEE4;
}

uint64_t sub_10000EFB0()
{
  if (qword_10003C118 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10000F010()
{
  unint64_t result = qword_10003C520;
  if (!qword_10003C520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C520);
  }
  return result;
}

unint64_t sub_10000F068()
{
  unint64_t result = qword_10003C528;
  if (!qword_10003C528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C528);
  }
  return result;
}

uint64_t sub_10000F0BC()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10000F0F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000F108(a1, a2, a3, (void (*)(void))sub_10000E24C);
}

uint64_t sub_10000F108(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000F15C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C108, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D4E8, a1);
}

uint64_t sub_10000F19C@<X0>(uint64_t a1@<X8>)
{
  if (qword_10003C110 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008550(&qword_10003C610);
  uint64_t v3 = sub_100008690(v2, (uint64_t)qword_10003D500);

  return sub_100010434(v3, a1);
}

uint64_t sub_10000F218(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100010548;
  return sub_10000E420(a1, v5, v4);
}

uint64_t sub_10000F2C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000FFE8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10000F2EC()
{
  return 0xD000000000000025;
}

unint64_t sub_10000F30C()
{
  unint64_t result = qword_10003C538;
  if (!qword_10003C538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C538);
  }
  return result;
}

unint64_t sub_10000F364()
{
  unint64_t result = qword_10003C540;
  if (!qword_10003C540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C540);
  }
  return result;
}

void *sub_10000F3B8()
{
  return &protocol witness table for String;
}

uint64_t sub_10000F3C4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000F3E4, 0, 0);
}

uint64_t sub_10000F3E4()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  unsigned char *v1 = sub_10001C958(0, 0xD000000000000015, 0x8000000100030390, 0) & 1;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000F470(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_10000F494, 0, 0);
}

uint64_t sub_10000F494()
{
  sub_10001CAD8(0, 0xD000000000000015, 0x8000000100030390, *(unsigned char *)(v0 + 16), 0xD000000000000031, 0x80000001000303B0);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_10000F534()
{
  unint64_t result = qword_10003C548;
  if (!qword_10003C548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C548);
  }
  return result;
}

unint64_t sub_10000F588()
{
  return 0xD000000000000015;
}

unint64_t sub_10000F5A8()
{
  unint64_t result = qword_10003C550;
  if (!qword_10003C550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C550);
  }
  return result;
}

uint64_t sub_10000F5FC(uint64_t a1)
{
  unint64_t v2 = sub_10000DC08();

  return _EntityURLRepresentation.init(stringLiteral:)(0xD000000000000058, 0x8000000100030250, a1, v2);
}

unint64_t sub_10000F65C()
{
  unint64_t result = qword_10003C558;
  if (!qword_10003C558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C558);
  }
  return result;
}

unint64_t sub_10000F6B4()
{
  unint64_t result = qword_10003C560;
  if (!qword_10003C560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C560);
  }
  return result;
}

unint64_t sub_10000F710()
{
  unint64_t result = qword_10003C568;
  if (!qword_10003C568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C568);
  }
  return result;
}

void *sub_10000F764()
{
  return &protocol witness table for String;
}

uint64_t sub_10000F770@<X0>(uint64_t *a1@<X8>)
{
  sub_10000C9E4();
  uint64_t result = sub_100029410();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000F7B0()
{
  sub_10000FCB0();
  uint64_t v2 = sub_1000296D0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000872C(v3, v0, v2, v1);
}

uint64_t sub_10000F844@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C100, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10003D4D0, a1);
}

uint64_t sub_10000F87C@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100008690(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_10000F920()
{
  return sub_10000C5A8(&qword_10003C578, &qword_10003C580);
}

uint64_t sub_10000F95C(uint64_t a1)
{
  unint64_t v2 = sub_10000DC08();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000F9AC()
{
  unint64_t result = qword_10003C588;
  if (!qword_10003C588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C588);
  }
  return result;
}

uint64_t sub_10000FA04(uint64_t a1)
{
  unint64_t v2 = sub_10000F710();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t destroy for CharacterCountEntity.UpdateIntent_value()
{
  swift_release();

  return swift_release();
}

void *_s34MessagesSettingsWidgetKitExtension20CharacterCountEntityV18UpdateIntent_valueVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for CharacterCountEntity.UpdateIntent_value(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for CharacterCountEntity.UpdateIntent_value(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for CharacterCountEntity.UpdateIntent_value(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CharacterCountEntity.UpdateIntent_value(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CharacterCountEntity.UpdateIntent_value(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CharacterCountEntity.UpdateIntent_value()
{
  return &type metadata for CharacterCountEntity.UpdateIntent_value;
}

ValueMetadata *type metadata accessor for CharacterCountEntity.CharacterCountEntityQuery()
{
  return &type metadata for CharacterCountEntity.CharacterCountEntityQuery;
}

ValueMetadata *type metadata accessor for CharacterCountEntity()
{
  return &type metadata for CharacterCountEntity;
}

ValueMetadata *type metadata accessor for OpenCharacterCountEntity()
{
  return &type metadata for OpenCharacterCountEntity;
}

uint64_t sub_10000FC38()
{
  return sub_10000C5A8(&qword_10003C590, &qword_10003C598);
}

uint64_t sub_10000FC74()
{
  return sub_10000C5A8(&qword_10003C5A0, &qword_10003C598);
}

unint64_t sub_10000FCB0()
{
  unint64_t result = qword_10003C5A8;
  if (!qword_10003C5A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C5A8);
  }
  return result;
}

uint64_t sub_10000FD04()
{
  v17[0] = sub_1000296C0();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  uint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008550(&qword_10003C328);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000297E0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100008550(&qword_10003C5B8);
  sub_1000297C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v17[1] = 0;
  uint64_t v14 = sub_1000293F0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_10000DC08();
  return sub_100029460();
}

uint64_t sub_10000FFE8()
{
  uint64_t v0 = sub_100008550(&qword_10003C5B0);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1000296C0();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100008550(&qword_10003C328);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_1000297E0();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100008550(&qword_10003C5B8);
  sub_1000297C0();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_1000293F0();
  char v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_10000DC08();
  uint64_t v19 = v23;
  uint64_t v24 = sub_100029460();
  sub_100008550(&qword_10003C5C0);
  sub_1000297C0();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100029910();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_100029470();
  return v24;
}

uint64_t sub_100010428@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_100010434(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008550(&qword_10003C610);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001049C()
{
  unint64_t result = qword_10003C628;
  if (!qword_10003C628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C628);
  }
  return result;
}

unint64_t sub_1000104F0()
{
  unint64_t result = qword_10003C630;
  if (!qword_10003C630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C630);
  }
  return result;
}

unint64_t sub_100010550()
{
  unint64_t result = qword_10003C638;
  if (!qword_10003C638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C638);
  }
  return result;
}

unint64_t sub_1000105A8()
{
  unint64_t result = qword_10003C640;
  if (!qword_10003C640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C640);
  }
  return result;
}

uint64_t sub_1000105FC()
{
  uint64_t v0 = sub_1000297D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100029810();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_1000298E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_1000297E0();
  sub_1000086C8(v6, qword_10003D520);
  sub_100008690(v6, (uint64_t)qword_10003D520);
  sub_1000298D0();
  sub_100029800();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_1000297F0();
}

unint64_t sub_1000107E0()
{
  unint64_t result = qword_10003C648;
  if (!qword_10003C648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C648);
  }
  return result;
}

uint64_t sub_100010834(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100013538();
  unint64_t v5 = sub_100012DA0();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_1000108A0()
{
  unint64_t result = qword_10003C650;
  if (!qword_10003C650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C650);
  }
  return result;
}

unint64_t sub_1000108F8()
{
  unint64_t result = qword_10003C658;
  if (!qword_10003C658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C658);
  }
  return result;
}

uint64_t sub_10001094C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100012490(a1, a2, a3, (void (*)(void))sub_1000107E0);
}

uint64_t sub_100010964@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C120, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D520, a1);
}

uint64_t sub_10001099C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100013538();
  unint64_t v7 = sub_10001358C();
  unint64_t v8 = sub_100012DA0();
  void *v5 = v2;
  v5[1] = sub_100005D84;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100010A70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100012DF4();
  *a1 = result;
  return result;
}

uint64_t sub_100010A98(uint64_t a1)
{
  unint64_t v2 = sub_1000107E0();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100010AD8()
{
  unint64_t result = qword_10003C668;
  if (!qword_10003C668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C668);
  }
  return result;
}

uint64_t sub_100010B30()
{
  uint64_t v0 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1000297D0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100029810();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_1000298E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_1000297E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_100029770();
  sub_1000086C8(v10, qword_10003D538);
  sub_100008690(v10, (uint64_t)qword_10003D538);
  sub_1000298D0();
  sub_100029800();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_1000297F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_100029760();
}

uint64_t sub_100010E08()
{
  uint64_t v0 = sub_100008550(&qword_10003C358);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000297E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_1000297C0();
  sub_1000297C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  if (qword_10003C1C0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100029620();
  uint64_t v9 = sub_100008690(v8, (uint64_t)qword_10003D6C0);
  uint64_t v10 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v2, v9, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v2, 0, 1, v8);
  return sub_100029640();
}

uint64_t sub_100011074(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_1000297E0();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100011104, 0, 0);
}

uint64_t sub_100011104()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100008550(&qword_10003C6F0);
  sub_1000297C0();
  sub_10000C5A8(&qword_10003C7A8, &qword_10003C7B0);
  uint64_t *v1 = sub_1000297A0();
  swift_task_dealloc();
  unint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_100011218()
{
  unint64_t result = qword_10003C678;
  if (!qword_10003C678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C678);
  }
  return result;
}

uint64_t sub_10001126C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10001289C();
  *uint64_t v4 = v2;
  v4[1] = sub_10000DA40;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100011320()
{
  unint64_t result = qword_10003C688;
  if (!qword_10003C688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C688);
  }
  return result;
}

unint64_t sub_100011378()
{
  unint64_t result = qword_10003C690;
  if (!qword_10003C690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C690);
  }
  return result;
}

unint64_t sub_1000113D0()
{
  unint64_t result = qword_10003C698[0];
  if (!qword_10003C698[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10003C698);
  }
  return result;
}

uint64_t sub_100011424(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001289C();
  void *v5 = v2;
  v5[1] = sub_10000DD10;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000114D8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10001289C();
  *uint64_t v4 = v2;
  v4[1] = sub_100010544;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10001158C()
{
  unint64_t result = qword_10003C6B0;
  if (!qword_10003C6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C6B0);
  }
  return result;
}

unint64_t sub_1000115E4()
{
  unint64_t result = qword_10003C6B8;
  if (!qword_10003C6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C6B8);
  }
  return result;
}

unint64_t sub_10001163C()
{
  unint64_t result = qword_10003C6C0;
  if (!qword_10003C6C0)
  {
    sub_1000056D8(qword_10003C6C8);
    sub_1000115E4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C6C0);
  }
  return result;
}

uint64_t sub_1000116B0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100011218();
  void *v5 = v2;
  v5[1] = sub_10000E09C;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100011768()
{
  unint64_t result = qword_10003C6E0;
  if (!qword_10003C6E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C6E0);
  }
  return result;
}

uint64_t sub_1000117BC()
{
  return sub_10000C5A8(&qword_10003C6E8, &qword_10003C6F0);
}

uint64_t sub_1000117F8()
{
  uint64_t v0 = sub_1000297E0();
  sub_1000086C8(v0, qword_10003D550);
  sub_100008690(v0, (uint64_t)qword_10003D550);
  return sub_1000297C0();
}

uint64_t sub_10001185C()
{
  uint64_t v0 = sub_100008550(&qword_10003C610);
  sub_1000086C8(v0, qword_10003D568);
  uint64_t v1 = sub_100008690(v0, (uint64_t)qword_10003D568);
  sub_1000295A0();
  uint64_t v2 = sub_1000295B0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100011914()
{
  uint64_t result = swift_getKeyPath();
  qword_10003D580 = result;
  return result;
}

uint64_t sub_10001193C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100008550(&qword_10003C5D0);
  v3[9] = swift_task_alloc();
  sub_100008550(&qword_10003C5D8);
  v3[10] = swift_task_alloc();
  sub_100008550(&qword_10003C798);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_1000293F0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100008550(&qword_10003C7A0);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_100011B00, 0, 0);
}

uint64_t sub_100011B00()
{
  sub_100029430();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_1000113D0();
  void *v1 = v0;
  v1[1] = sub_100011BD4;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_1000121CC, 0, &type metadata for FilterUnknownSendersEntity, v2);
}

uint64_t sub_100011BD4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100011CD0, 0, 0);
}

uint64_t sub_100011CD0()
{
  sub_100029430();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_100029430();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_10003C140 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10003D580;
  *(void *)(v0 + 168) = qword_10003D580;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_10000C5A8(&qword_10003C7A8, &qword_10003C7B0);
  *uint64_t v3 = v0;
  v3[1] = sub_100011E28;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_100011E28()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10000ECB0;
  }
  else {
    uint64_t v2 = sub_100011F7C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100011F7C()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_100029430();
  uint64_t v7 = sub_100029750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_100029780();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100011768();
  sub_1000115E4();
  sub_1000293C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_1000293E0();
  sub_100029400();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_1000121D0()
{
  uint64_t v0 = sub_100008550(&qword_10003C7B8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003C140 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100029600();
  swift_release();
  sub_1000115E4();
  sub_10000C5A8(&qword_10003C7C0, &qword_10003C7B8);
  sub_1000295F0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100012338()
{
  if (qword_10003C140 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100012398()
{
  unint64_t result = qword_10003C6F8;
  if (!qword_10003C6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C6F8);
  }
  return result;
}

unint64_t sub_1000123F0()
{
  unint64_t result = qword_10003C700;
  if (!qword_10003C700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C700);
  }
  return result;
}

uint64_t sub_100012444()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100012478(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100012490(a1, a2, a3, (void (*)(void))sub_100011768);
}

uint64_t sub_100012490(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000124E4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C130, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D550, a1);
}

uint64_t sub_10001251C@<X0>(uint64_t a1@<X8>)
{
  if (qword_10003C138 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008550(&qword_10003C610);
  uint64_t v3 = sub_100008690(v2, (uint64_t)qword_10003D568);

  return sub_100010434(v3, a1);
}

uint64_t sub_100012598(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100010548;
  return sub_10001193C(a1, v5, v4);
}

uint64_t sub_100012644@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000130D8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10001266C()
{
  return 0xD00000000000002BLL;
}

unint64_t sub_10001268C()
{
  unint64_t result = qword_10003C710;
  if (!qword_10003C710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C710);
  }
  return result;
}

unint64_t sub_1000126E4()
{
  unint64_t result = qword_10003C718;
  if (!qword_10003C718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C718);
  }
  return result;
}

uint64_t sub_100012738(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100012758, 0, 0);
}

uint64_t sub_100012758()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  unsigned char *v1 = sub_10001C958(0, 0xD00000000000001ELL, 0x80000001000305C0, 0) & 1;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000127E4(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100012808, 0, 0);
}

uint64_t sub_100012808()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)CKSharedSettingsHelper) init];
  [v2 setConversationListFilteringEnabled:v1];

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

unint64_t sub_10001289C()
{
  unint64_t result = qword_10003C720;
  if (!qword_10003C720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C720);
  }
  return result;
}

unint64_t sub_1000128F4()
{
  unint64_t result = qword_10003C728;
  if (!qword_10003C728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C728);
  }
  return result;
}

uint64_t sub_100012948(uint64_t a1)
{
  unint64_t v2 = sub_1000113D0();

  return _EntityURLRepresentation.init(stringLiteral:)(0xD000000000000056, 0x800000010002F890, a1, v2);
}

unint64_t sub_1000129A8()
{
  unint64_t result = qword_10003C730;
  if (!qword_10003C730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C730);
  }
  return result;
}

unint64_t sub_100012A00()
{
  unint64_t result = qword_10003C738;
  if (!qword_10003C738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C738);
  }
  return result;
}

unint64_t sub_100012A58()
{
  unint64_t result = qword_10003C740;
  if (!qword_10003C740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C740);
  }
  return result;
}

uint64_t sub_100012AAC@<X0>(uint64_t *a1@<X8>)
{
  sub_10000C98C();
  uint64_t result = sub_100029410();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100012AEC()
{
  sub_100012DA0();
  uint64_t v2 = sub_1000296D0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000872C(v3, v0, v2, v1);
}

uint64_t sub_100012B80@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C128, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10003D538, a1);
}

uint64_t sub_100012BB8()
{
  return sub_10000C5A8(&qword_10003C750, &qword_10003C758);
}

uint64_t sub_100012BF4(uint64_t a1)
{
  unint64_t v2 = sub_1000113D0();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100012C44()
{
  unint64_t result = qword_10003C760;
  if (!qword_10003C760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C760);
  }
  return result;
}

uint64_t sub_100012C9C(uint64_t a1)
{
  unint64_t v2 = sub_100012A58();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for FilterUnknownSendersEntity.UpdateIntent_value()
{
  return &type metadata for FilterUnknownSendersEntity.UpdateIntent_value;
}

ValueMetadata *type metadata accessor for FilterUnknownSendersEntity.FilterUnknownSendersEntityQuery()
{
  return &type metadata for FilterUnknownSendersEntity.FilterUnknownSendersEntityQuery;
}

ValueMetadata *type metadata accessor for FilterUnknownSendersEntity()
{
  return &type metadata for FilterUnknownSendersEntity;
}

ValueMetadata *type metadata accessor for OpenFilterUnknownSendersEntity()
{
  return &type metadata for OpenFilterUnknownSendersEntity;
}

uint64_t sub_100012D28()
{
  return sub_10000C5A8(&qword_10003C768, &qword_10003C770);
}

uint64_t sub_100012D64()
{
  return sub_10000C5A8(&qword_10003C778, &qword_10003C770);
}

unint64_t sub_100012DA0()
{
  unint64_t result = qword_10003C780;
  if (!qword_10003C780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C780);
  }
  return result;
}

uint64_t sub_100012DF4()
{
  v17[0] = sub_1000296C0();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  unint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008550(&qword_10003C328);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000297E0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100008550(&qword_10003C788);
  sub_1000297C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v17[1] = 0;
  uint64_t v14 = sub_1000293F0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_1000113D0();
  return sub_100029460();
}

uint64_t sub_1000130D8()
{
  uint64_t v0 = sub_100008550(&qword_10003C5B0);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1000296C0();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100008550(&qword_10003C328);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v13;
  uint64_t v14 = sub_1000297E0();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100008550(&qword_10003C788);
  sub_1000297C0();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_1000293F0();
  char v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v23 = v10;
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_1000113D0();
  uint64_t v19 = v22;
  uint64_t v24 = sub_100029460();
  sub_100008550(&qword_10003C5C0);
  sub_1000297C0();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100029910();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v23, 1, 1, v16);
  v26(v4, v27, v31);
  sub_100029470();
  return v24;
}

uint64_t sub_10001352C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

unint64_t sub_100013538()
{
  unint64_t result = qword_10003C7D8;
  if (!qword_10003C7D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C7D8);
  }
  return result;
}

unint64_t sub_10001358C()
{
  unint64_t result = qword_10003C7E0;
  if (!qword_10003C7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C7E0);
  }
  return result;
}

unint64_t sub_1000135E4()
{
  unint64_t result = qword_10003C7E8;
  if (!qword_10003C7E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C7E8);
  }
  return result;
}

unint64_t sub_10001363C()
{
  unint64_t result = qword_10003C7F0;
  if (!qword_10003C7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C7F0);
  }
  return result;
}

uint64_t sub_100013690()
{
  uint64_t v0 = sub_1000297D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100029810();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_1000298E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_1000297E0();
  sub_1000086C8(v6, qword_10003D588);
  sub_100008690(v6, (uint64_t)qword_10003D588);
  sub_1000298D0();
  sub_100029800();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_1000297F0();
}

unint64_t sub_100013874()
{
  unint64_t result = qword_10003C7F8;
  if (!qword_10003C7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C7F8);
  }
  return result;
}

uint64_t sub_1000138C8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000165DC();
  unint64_t v5 = sub_100015E58();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100013934()
{
  unint64_t result = qword_10003C800;
  if (!qword_10003C800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C800);
  }
  return result;
}

unint64_t sub_10001398C()
{
  unint64_t result = qword_10003C808;
  if (!qword_10003C808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C808);
  }
  return result;
}

uint64_t sub_1000139E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001553C(a1, a2, a3, (void (*)(void))sub_100013874);
}

uint64_t sub_1000139F8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C148, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D588, a1);
}

uint64_t sub_100013A30(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000165DC();
  unint64_t v7 = sub_100016630();
  unint64_t v8 = sub_100015E58();
  void *v5 = v2;
  v5[1] = sub_100005D84;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100013B04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100015EAC();
  *a1 = result;
  return result;
}

uint64_t sub_100013B2C(uint64_t a1)
{
  unint64_t v2 = sub_100013874();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100013B6C()
{
  unint64_t result = qword_10003C818;
  if (!qword_10003C818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C818);
  }
  return result;
}

uint64_t sub_100013BC4()
{
  uint64_t v0 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1000297D0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100029810();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_1000298E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_1000297E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_100029770();
  sub_1000086C8(v10, qword_10003D5A0);
  sub_100008690(v10, (uint64_t)qword_10003D5A0);
  sub_1000298D0();
  sub_100029800();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_1000297F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_100029760();
}

uint64_t sub_100013EA4()
{
  uint64_t v0 = sub_100008550(&qword_10003C358);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000297E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_1000297C0();
  sub_1000297C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  if (qword_10003C1C0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100029620();
  uint64_t v9 = sub_100008690(v8, (uint64_t)qword_10003D6C0);
  uint64_t v10 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v2, v9, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v2, 0, 1, v8);
  return sub_100029640();
}

uint64_t sub_100014118(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_1000297E0();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_1000141A8, 0, 0);
}

uint64_t sub_1000141A8()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100008550(&qword_10003C8A0);
  sub_1000297C0();
  sub_10000C5A8(&qword_10003C958, &qword_10003C960);
  uint64_t *v1 = sub_1000297A0();
  swift_task_dealloc();
  unint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_1000142C4()
{
  unint64_t result = qword_10003C828;
  if (!qword_10003C828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C828);
  }
  return result;
}

uint64_t sub_100014318(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100015954();
  *uint64_t v4 = v2;
  v4[1] = sub_10000DA40;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_1000143CC()
{
  unint64_t result = qword_10003C838;
  if (!qword_10003C838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C838);
  }
  return result;
}

unint64_t sub_100014424()
{
  unint64_t result = qword_10003C840;
  if (!qword_10003C840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C840);
  }
  return result;
}

unint64_t sub_10001447C()
{
  unint64_t result = qword_10003C848[0];
  if (!qword_10003C848[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10003C848);
  }
  return result;
}

uint64_t sub_1000144D0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100015954();
  void *v5 = v2;
  v5[1] = sub_10000DD10;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100014584(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100015954();
  *uint64_t v4 = v2;
  v4[1] = sub_100010544;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100014638()
{
  unint64_t result = qword_10003C860;
  if (!qword_10003C860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C860);
  }
  return result;
}

unint64_t sub_100014690()
{
  unint64_t result = qword_10003C868;
  if (!qword_10003C868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C868);
  }
  return result;
}

unint64_t sub_1000146E8()
{
  unint64_t result = qword_10003C870;
  if (!qword_10003C870)
  {
    sub_1000056D8(qword_10003C878);
    sub_100014690();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C870);
  }
  return result;
}

uint64_t sub_10001475C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000142C4();
  void *v5 = v2;
  v5[1] = sub_10000E09C;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100014814()
{
  unint64_t result = qword_10003C890;
  if (!qword_10003C890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C890);
  }
  return result;
}

uint64_t sub_100014868()
{
  return sub_10000C5A8(&qword_10003C898, &qword_10003C8A0);
}

uint64_t sub_1000148A4()
{
  uint64_t v0 = sub_1000297E0();
  sub_1000086C8(v0, qword_10003D5B8);
  sub_100008690(v0, (uint64_t)qword_10003D5B8);
  return sub_1000297C0();
}

uint64_t sub_100014908()
{
  uint64_t v0 = sub_100008550(&qword_10003C610);
  sub_1000086C8(v0, qword_10003D5D0);
  uint64_t v1 = sub_100008690(v0, (uint64_t)qword_10003D5D0);
  sub_1000295A0();
  uint64_t v2 = sub_1000295B0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_1000149C0()
{
  uint64_t result = swift_getKeyPath();
  qword_10003D5E8 = result;
  return result;
}

uint64_t sub_1000149E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100008550(&qword_10003C5D0);
  v3[9] = swift_task_alloc();
  sub_100008550(&qword_10003C5D8);
  v3[10] = swift_task_alloc();
  sub_100008550(&qword_10003C948);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_1000293F0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100008550(&qword_10003C950);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_100014BAC, 0, 0);
}

uint64_t sub_100014BAC()
{
  sub_100029430();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_10001447C();
  void *v1 = v0;
  v1[1] = sub_100014C80;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100015278, 0, &type metadata for RaiseToListenEntity, v2);
}

uint64_t sub_100014C80()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100014D7C, 0, 0);
}

uint64_t sub_100014D7C()
{
  sub_100029430();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_100029430();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_10003C168 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10003D5E8;
  *(void *)(v0 + 168) = qword_10003D5E8;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_10000C5A8(&qword_10003C958, &qword_10003C960);
  *uint64_t v3 = v0;
  v3[1] = sub_100014ED4;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_100014ED4()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10000ECB0;
  }
  else {
    uint64_t v2 = sub_100015028;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100015028()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_100029430();
  uint64_t v7 = sub_100029750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_100029780();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100014814();
  sub_100014690();
  sub_1000293C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_1000293E0();
  sub_100029400();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10001527C()
{
  uint64_t v0 = sub_100008550(&qword_10003C968);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003C168 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100029600();
  swift_release();
  sub_100014690();
  sub_10000C5A8(&qword_10003C970, &qword_10003C968);
  sub_1000295F0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1000153E4()
{
  if (qword_10003C168 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100015444()
{
  unint64_t result = qword_10003C8A8;
  if (!qword_10003C8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C8A8);
  }
  return result;
}

unint64_t sub_10001549C()
{
  unint64_t result = qword_10003C8B0;
  if (!qword_10003C8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C8B0);
  }
  return result;
}

uint64_t sub_1000154F0()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100015524(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001553C(a1, a2, a3, (void (*)(void))sub_100014814);
}

uint64_t sub_10001553C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100015590@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C158, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D5B8, a1);
}

uint64_t sub_1000155C8@<X0>(uint64_t a1@<X8>)
{
  if (qword_10003C160 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008550(&qword_10003C610);
  uint64_t v3 = sub_100008690(v2, (uint64_t)qword_10003D5D0);

  return sub_100010434(v3, a1);
}

uint64_t sub_100015644(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100010548;
  return sub_1000149E8(a1, v5, v4);
}

uint64_t sub_1000156F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100016190();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100015718()
{
  return 0xD000000000000024;
}

unint64_t sub_100015738()
{
  unint64_t result = qword_10003C8C0;
  if (!qword_10003C8C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C8C0);
  }
  return result;
}

unint64_t sub_100015790()
{
  unint64_t result = qword_10003C8C8;
  if (!qword_10003C8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C8C8);
  }
  return result;
}

uint64_t sub_1000157E4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100015804, 0, 0);
}

uint64_t sub_100015804()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  unsigned char *v1 = sub_10001C958(0, 0xD000000000000014, 0x8000000100030760, 1) & 1;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100015890(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_1000158B4, 0, 0);
}

uint64_t sub_1000158B4()
{
  sub_10001CAD8(0, 0xD000000000000014, 0x8000000100030760, *(unsigned char *)(v0 + 16), 0xD000000000000030, 0x8000000100030780);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_100015954()
{
  unint64_t result = qword_10003C8D0;
  if (!qword_10003C8D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C8D0);
  }
  return result;
}

unint64_t sub_1000159AC()
{
  unint64_t result = qword_10003C8D8;
  if (!qword_10003C8D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C8D8);
  }
  return result;
}

uint64_t sub_100015A00(uint64_t a1)
{
  unint64_t v2 = sub_10001447C();

  return _EntityURLRepresentation.init(stringLiteral:)(0xD000000000000058, 0x800000010002F8F0, a1, v2);
}

unint64_t sub_100015A60()
{
  unint64_t result = qword_10003C8E0;
  if (!qword_10003C8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C8E0);
  }
  return result;
}

unint64_t sub_100015AB8()
{
  unint64_t result = qword_10003C8E8;
  if (!qword_10003C8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C8E8);
  }
  return result;
}

unint64_t sub_100015B10()
{
  unint64_t result = qword_10003C8F0;
  if (!qword_10003C8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C8F0);
  }
  return result;
}

uint64_t sub_100015B64@<X0>(uint64_t *a1@<X8>)
{
  sub_10000C884();
  uint64_t result = sub_100029410();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100015BA4()
{
  sub_100015E58();
  uint64_t v2 = sub_1000296D0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000872C(v3, v0, v2, v1);
}

uint64_t sub_100015C38@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C150, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10003D5A0, a1);
}

uint64_t sub_100015C70()
{
  return sub_10000C5A8(&qword_10003C900, &qword_10003C908);
}

uint64_t sub_100015CAC(uint64_t a1)
{
  unint64_t v2 = sub_10001447C();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100015CFC()
{
  unint64_t result = qword_10003C910;
  if (!qword_10003C910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C910);
  }
  return result;
}

uint64_t sub_100015D54(uint64_t a1)
{
  unint64_t v2 = sub_100015B10();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for RaiseToListenEntity.UpdateIntent_value()
{
  return &type metadata for RaiseToListenEntity.UpdateIntent_value;
}

ValueMetadata *type metadata accessor for RaiseToListenEntity.RaiseToListenEntityQuery()
{
  return &type metadata for RaiseToListenEntity.RaiseToListenEntityQuery;
}

ValueMetadata *type metadata accessor for RaiseToListenEntity()
{
  return &type metadata for RaiseToListenEntity;
}

ValueMetadata *type metadata accessor for OpenRaiseToListenEntity()
{
  return &type metadata for OpenRaiseToListenEntity;
}

uint64_t sub_100015DE0()
{
  return sub_10000C5A8(&qword_10003C918, &qword_10003C920);
}

uint64_t sub_100015E1C()
{
  return sub_10000C5A8(&qword_10003C928, &qword_10003C920);
}

unint64_t sub_100015E58()
{
  unint64_t result = qword_10003C930;
  if (!qword_10003C930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C930);
  }
  return result;
}

uint64_t sub_100015EAC()
{
  v17[0] = sub_1000296C0();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  unint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008550(&qword_10003C328);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000297E0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100008550(&qword_10003C938);
  sub_1000297C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v17[1] = 0;
  uint64_t v14 = sub_1000293F0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_10001447C();
  return sub_100029460();
}

uint64_t sub_100016190()
{
  uint64_t v0 = sub_100008550(&qword_10003C5B0);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1000296C0();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100008550(&qword_10003C328);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_1000297E0();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100008550(&qword_10003C938);
  sub_1000297C0();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_1000293F0();
  char v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_10001447C();
  uint64_t v19 = v23;
  uint64_t v24 = sub_100029460();
  sub_100008550(&qword_10003C5C0);
  sub_1000297C0();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100029910();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_100029470();
  return v24;
}

uint64_t sub_1000165D0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

unint64_t sub_1000165DC()
{
  unint64_t result = qword_10003C988;
  if (!qword_10003C988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C988);
  }
  return result;
}

unint64_t sub_100016630()
{
  unint64_t result = qword_10003C990;
  if (!qword_10003C990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C990);
  }
  return result;
}

unint64_t sub_100016688()
{
  unint64_t result = qword_10003C998;
  if (!qword_10003C998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C998);
  }
  return result;
}

unint64_t sub_1000166E0()
{
  unint64_t result = qword_10003C9A0;
  if (!qword_10003C9A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C9A0);
  }
  return result;
}

uint64_t sub_100016734()
{
  uint64_t v0 = sub_1000297D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100029810();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_1000298E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_1000297E0();
  sub_1000086C8(v6, qword_10003D5F0);
  sub_100008690(v6, (uint64_t)qword_10003D5F0);
  sub_1000298D0();
  sub_100029800();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_1000297F0();
}

unint64_t sub_100016918()
{
  unint64_t result = qword_10003C9A8;
  if (!qword_10003C9A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C9A8);
  }
  return result;
}

uint64_t sub_10001696C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100019730();
  unint64_t v5 = sub_100018FAC();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_1000169D8()
{
  unint64_t result = qword_10003C9B0;
  if (!qword_10003C9B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C9B0);
  }
  return result;
}

unint64_t sub_100016A30()
{
  unint64_t result = qword_10003C9B8;
  if (!qword_10003C9B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C9B8);
  }
  return result;
}

uint64_t sub_100016A84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100018690(a1, a2, a3, (void (*)(void))sub_100016918);
}

uint64_t sub_100016A9C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C170, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D5F0, a1);
}

uint64_t sub_100016AD4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100019730();
  unint64_t v7 = sub_100019784();
  unint64_t v8 = sub_100018FAC();
  void *v5 = v2;
  v5[1] = sub_100005D84;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100016BA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100019000();
  *a1 = result;
  return result;
}

uint64_t sub_100016BD0(uint64_t a1)
{
  unint64_t v2 = sub_100016918();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100016C10()
{
  unint64_t result = qword_10003C9C8;
  if (!qword_10003C9C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C9C8);
  }
  return result;
}

uint64_t sub_100016C68()
{
  uint64_t v0 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000297E0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_100029770();
  sub_1000086C8(v5, qword_10003D608);
  sub_100008690(v5, (uint64_t)qword_10003D608);
  sub_1000297C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_100029760();
}

uint64_t sub_100016DD4@<X0>(uint64_t a1@<X8>)
{
  v23[4] = a1;
  uint64_t v1 = sub_1000297D0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100029810();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_1000298E0();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_100008550(&qword_10003C358);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000297E0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  void v23[2] = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000297C0();
  sub_1000297C0();
  uint64_t v16 = *(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56);
  v23[3] = v12;
  v16(v12, 0, 1, v13);
  if (qword_10003C1C0 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_100029620();
  uint64_t v18 = sub_100008690(v17, (uint64_t)qword_10003D6C0);
  uint64_t v19 = *(void *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v9, v18, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v9, 0, 1, v17);
  sub_100008550(&qword_10003C370);
  v23[0] = *(void *)(v14 + 72);
  v23[1] = v9;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10002A100;
  sub_1000298D0();
  sub_100029800();
  uint64_t v20 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  v21(v4, enum case for LocalizedStringResource.BundleDescription.main(_:), v1);
  sub_1000297F0();
  sub_1000298D0();
  sub_100029800();
  v21(v4, v20, v1);
  sub_1000297F0();
  return sub_100029640();
}

uint64_t sub_100017274(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_1000297E0();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100017304, 0, 0);
}

uint64_t sub_100017304()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100008550(&qword_10003CA50);
  sub_1000297C0();
  sub_10000C5A8(&qword_10003CB08, &qword_10003CB10);
  uint64_t *v1 = sub_1000297A0();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_100017418()
{
  unint64_t result = qword_10003C9D8;
  if (!qword_10003C9D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C9D8);
  }
  return result;
}

uint64_t sub_10001746C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100018AA4();
  *uint64_t v4 = v2;
  v4[1] = sub_10000DA40;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100017520()
{
  unint64_t result = qword_10003C9E8;
  if (!qword_10003C9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C9E8);
  }
  return result;
}

unint64_t sub_100017578()
{
  unint64_t result = qword_10003C9F0;
  if (!qword_10003C9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C9F0);
  }
  return result;
}

unint64_t sub_1000175D0()
{
  unint64_t result = qword_10003C9F8[0];
  if (!qword_10003C9F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10003C9F8);
  }
  return result;
}

uint64_t sub_100017624(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100018AA4();
  void *v5 = v2;
  v5[1] = sub_10000DD10;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000176D8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100018AA4();
  *uint64_t v4 = v2;
  v4[1] = sub_100010544;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10001778C()
{
  unint64_t result = qword_10003CA10;
  if (!qword_10003CA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA10);
  }
  return result;
}

unint64_t sub_1000177E4()
{
  unint64_t result = qword_10003CA18;
  if (!qword_10003CA18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA18);
  }
  return result;
}

unint64_t sub_10001783C()
{
  unint64_t result = qword_10003CA20;
  if (!qword_10003CA20)
  {
    sub_1000056D8(qword_10003CA28);
    sub_1000177E4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA20);
  }
  return result;
}

uint64_t sub_1000178B0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100017418();
  void *v5 = v2;
  v5[1] = sub_10000E09C;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100017968()
{
  unint64_t result = qword_10003CA40;
  if (!qword_10003CA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA40);
  }
  return result;
}

uint64_t sub_1000179BC()
{
  return sub_10000C5A8(&qword_10003CA48, &qword_10003CA50);
}

uint64_t sub_1000179F8()
{
  uint64_t v0 = sub_1000297E0();
  sub_1000086C8(v0, qword_10003D620);
  sub_100008690(v0, (uint64_t)qword_10003D620);
  return sub_1000297C0();
}

uint64_t sub_100017A5C()
{
  uint64_t v0 = sub_100008550(&qword_10003C610);
  sub_1000086C8(v0, qword_10003D638);
  uint64_t v1 = sub_100008690(v0, (uint64_t)qword_10003D638);
  sub_1000295A0();
  uint64_t v2 = sub_1000295B0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100017B14()
{
  uint64_t result = swift_getKeyPath();
  qword_10003D650 = result;
  return result;
}

uint64_t sub_100017B3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100008550(&qword_10003C5D0);
  v3[9] = swift_task_alloc();
  sub_100008550(&qword_10003C5D8);
  v3[10] = swift_task_alloc();
  sub_100008550(&qword_10003CAF8);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_1000293F0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100008550(&qword_10003CB00);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_100017D00, 0, 0);
}

uint64_t sub_100017D00()
{
  sub_100029430();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_1000175D0();
  void *v1 = v0;
  v1[1] = sub_100017DD4;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_1000183CC, 0, &type metadata for SendAsTextMessageEntity, v2);
}

uint64_t sub_100017DD4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100017ED0, 0, 0);
}

uint64_t sub_100017ED0()
{
  sub_100029430();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_100029430();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_10003C190 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10003D650;
  *(void *)(v0 + 168) = qword_10003D650;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_10000C5A8(&qword_10003CB08, &qword_10003CB10);
  *uint64_t v3 = v0;
  v3[1] = sub_100018028;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_100018028()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10000ECB0;
  }
  else {
    uint64_t v2 = sub_10001817C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001817C()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_100029430();
  uint64_t v7 = sub_100029750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_100029780();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100017968();
  sub_1000177E4();
  sub_1000293C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_1000293E0();
  sub_100029400();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_1000183D0()
{
  uint64_t v0 = sub_100008550(&qword_10003CB18);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003C190 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100029600();
  swift_release();
  sub_1000177E4();
  sub_10000C5A8(&qword_10003CB20, &qword_10003CB18);
  sub_1000295F0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100018538()
{
  if (qword_10003C190 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100018598()
{
  unint64_t result = qword_10003CA58;
  if (!qword_10003CA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA58);
  }
  return result;
}

unint64_t sub_1000185F0()
{
  unint64_t result = qword_10003CA60;
  if (!qword_10003CA60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA60);
  }
  return result;
}

uint64_t sub_100018644()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100018678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100018690(a1, a2, a3, (void (*)(void))sub_100017968);
}

uint64_t sub_100018690(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000186E4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C180, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D620, a1);
}

uint64_t sub_10001871C@<X0>(uint64_t a1@<X8>)
{
  if (qword_10003C188 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008550(&qword_10003C610);
  uint64_t v3 = sub_100008690(v2, (uint64_t)qword_10003D638);

  return sub_100010434(v3, a1);
}

uint64_t sub_100018798(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100010548;
  return sub_100017B3C(a1, v5, v4);
}

uint64_t sub_100018844@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000192E4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10001886C()
{
  return 0xD000000000000028;
}

unint64_t sub_10001888C()
{
  unint64_t result = qword_10003CA70;
  if (!qword_10003CA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA70);
  }
  return result;
}

unint64_t sub_1000188E4()
{
  unint64_t result = qword_10003CA78;
  if (!qword_10003CA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA78);
  }
  return result;
}

uint64_t sub_100018938(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100018958, 0, 0);
}

uint64_t sub_100018958()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  unsigned char *v1 = sub_10001C958(0, 0x4D537341646E6553, 0xE900000000000053, 0) & 1;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000189E4(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100018A08, 0, 0);
}

uint64_t sub_100018A08()
{
  sub_10001CAD8(0, 0x4D537341646E6553, 0xE900000000000053, *(unsigned char *)(v0 + 16), 0xD00000000000002CLL, 0x8000000100030980);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_100018AA4()
{
  unint64_t result = qword_10003CA80;
  if (!qword_10003CA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA80);
  }
  return result;
}

unint64_t sub_100018AFC()
{
  unint64_t result = qword_10003CA88;
  if (!qword_10003CA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA88);
  }
  return result;
}

uint64_t sub_100018B50(uint64_t a1)
{
  unint64_t v2 = sub_1000175D0();

  return _EntityURLRepresentation.init(stringLiteral:)(0xD000000000000054, 0x800000010002F6B0, a1, v2);
}

unint64_t sub_100018BB0()
{
  unint64_t result = qword_10003CA90;
  if (!qword_10003CA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA90);
  }
  return result;
}

unint64_t sub_100018C08()
{
  unint64_t result = qword_10003CA98;
  if (!qword_10003CA98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA98);
  }
  return result;
}

unint64_t sub_100018C64()
{
  unint64_t result = qword_10003CAA0;
  if (!qword_10003CAA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CAA0);
  }
  return result;
}

uint64_t sub_100018CB8@<X0>(uint64_t *a1@<X8>)
{
  sub_10000C82C();
  uint64_t result = sub_100029410();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100018CF8()
{
  sub_100018FAC();
  uint64_t v2 = sub_1000296D0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000872C(v3, v0, v2, v1);
}

uint64_t sub_100018D8C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C178, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10003D608, a1);
}

uint64_t sub_100018DC4()
{
  return sub_10000C5A8(&qword_10003CAB0, &qword_10003CAB8);
}

uint64_t sub_100018E00(uint64_t a1)
{
  unint64_t v2 = sub_1000175D0();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100018E50()
{
  unint64_t result = qword_10003CAC0;
  if (!qword_10003CAC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CAC0);
  }
  return result;
}

uint64_t sub_100018EA8(uint64_t a1)
{
  unint64_t v2 = sub_100018C64();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SendAsTextMessageEntity.UpdateIntent_value()
{
  return &type metadata for SendAsTextMessageEntity.UpdateIntent_value;
}

ValueMetadata *type metadata accessor for SendAsTextMessageEntity.SendAsSMSEntityQuery()
{
  return &type metadata for SendAsTextMessageEntity.SendAsSMSEntityQuery;
}

ValueMetadata *type metadata accessor for SendAsTextMessageEntity()
{
  return &type metadata for SendAsTextMessageEntity;
}

ValueMetadata *type metadata accessor for OpenSendAsTextMessageEntity()
{
  return &type metadata for OpenSendAsTextMessageEntity;
}

uint64_t sub_100018F34()
{
  return sub_10000C5A8(&qword_10003CAC8, &qword_10003CAD0);
}

uint64_t sub_100018F70()
{
  return sub_10000C5A8(&qword_10003CAD8, &qword_10003CAD0);
}

unint64_t sub_100018FAC()
{
  unint64_t result = qword_10003CAE0;
  if (!qword_10003CAE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CAE0);
  }
  return result;
}

uint64_t sub_100019000()
{
  v17[0] = sub_1000296C0();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  unint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008550(&qword_10003C328);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000297E0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100008550(&qword_10003CAE8);
  sub_1000297C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v17[1] = 0;
  uint64_t v14 = sub_1000293F0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_1000175D0();
  return sub_100029460();
}

uint64_t sub_1000192E4()
{
  uint64_t v0 = sub_100008550(&qword_10003C5B0);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1000296C0();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100008550(&qword_10003C328);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_1000297E0();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100008550(&qword_10003CAE8);
  sub_1000297C0();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_1000293F0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_1000175D0();
  uint64_t v19 = v23;
  uint64_t v24 = sub_100029460();
  sub_100008550(&qword_10003C5C0);
  sub_1000297C0();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100029910();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_100029470();
  return v24;
}

uint64_t sub_100019724@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

unint64_t sub_100019730()
{
  unint64_t result = qword_10003CB38;
  if (!qword_10003CB38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CB38);
  }
  return result;
}

unint64_t sub_100019784()
{
  unint64_t result = qword_10003CB40;
  if (!qword_10003CB40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CB40);
  }
  return result;
}

unint64_t sub_1000197DC()
{
  unint64_t result = qword_10003CB48;
  if (!qword_10003CB48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CB48);
  }
  return result;
}

unint64_t sub_100019834()
{
  unint64_t result = qword_10003CB50;
  if (!qword_10003CB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CB50);
  }
  return result;
}

uint64_t sub_100019888()
{
  uint64_t v0 = sub_1000297D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100029810();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_1000298E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_1000297E0();
  sub_1000086C8(v6, qword_10003D658);
  sub_100008690(v6, (uint64_t)qword_10003D658);
  sub_1000298D0();
  sub_100029800();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_1000297F0();
}

unint64_t sub_100019A6C()
{
  unint64_t result = qword_10003CB58;
  if (!qword_10003CB58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CB58);
  }
  return result;
}

uint64_t sub_100019AC0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10001C7BC();
  unint64_t v5 = sub_10001C038();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100019B2C()
{
  unint64_t result = qword_10003CB60;
  if (!qword_10003CB60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CB60);
  }
  return result;
}

unint64_t sub_100019B84()
{
  unint64_t result = qword_10003CB68;
  if (!qword_10003CB68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CB68);
  }
  return result;
}

uint64_t sub_100019BD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001B71C(a1, a2, a3, (void (*)(void))sub_100019A6C);
}

uint64_t sub_100019BF0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C198, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D658, a1);
}

uint64_t sub_100019C28(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001C7BC();
  unint64_t v7 = sub_10001C810();
  unint64_t v8 = sub_10001C038();
  void *v5 = v2;
  v5[1] = sub_100005D84;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100019CFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001C08C();
  *a1 = result;
  return result;
}

uint64_t sub_100019D24(uint64_t a1)
{
  unint64_t v2 = sub_100019A6C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100019D64()
{
  unint64_t result = qword_10003CB78;
  if (!qword_10003CB78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CB78);
  }
  return result;
}

uint64_t sub_100019DBC()
{
  uint64_t v0 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1000297D0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100029810();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_1000298E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_1000297E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_100029770();
  sub_1000086C8(v10, qword_10003D670);
  sub_100008690(v10, (uint64_t)qword_10003D670);
  sub_1000298D0();
  sub_100029800();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_1000297F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_100029760();
}

uint64_t sub_10001A094()
{
  uint64_t v0 = sub_100008550(&qword_10003C358);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000297E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_1000297C0();
  sub_1000297C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  if (qword_10003C1C0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100029620();
  uint64_t v9 = sub_100008690(v8, (uint64_t)qword_10003D6C0);
  uint64_t v10 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v2, v9, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v2, 0, 1, v8);
  return sub_100029640();
}

uint64_t sub_10001A300(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_1000297E0();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_10001A390, 0, 0);
}

uint64_t sub_10001A390()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100008550(&qword_10003CC00);
  sub_1000297C0();
  sub_10000C5A8(&qword_10003CCB8, &qword_10003CCC0);
  uint64_t *v1 = sub_1000297A0();
  swift_task_dealloc();
  unint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_10001A4A4()
{
  unint64_t result = qword_10003CB88;
  if (!qword_10003CB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CB88);
  }
  return result;
}

uint64_t sub_10001A4F8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10001BB34();
  *uint64_t v4 = v2;
  v4[1] = sub_10000DA40;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10001A5AC()
{
  unint64_t result = qword_10003CB98;
  if (!qword_10003CB98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CB98);
  }
  return result;
}

unint64_t sub_10001A604()
{
  unint64_t result = qword_10003CBA0;
  if (!qword_10003CBA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CBA0);
  }
  return result;
}

unint64_t sub_10001A65C()
{
  unint64_t result = qword_10003CBA8[0];
  if (!qword_10003CBA8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10003CBA8);
  }
  return result;
}

uint64_t sub_10001A6B0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001BB34();
  void *v5 = v2;
  v5[1] = sub_10000DD10;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10001A764(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10001BB34();
  *uint64_t v4 = v2;
  v4[1] = sub_100010544;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10001A818()
{
  unint64_t result = qword_10003CBC0;
  if (!qword_10003CBC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CBC0);
  }
  return result;
}

unint64_t sub_10001A870()
{
  unint64_t result = qword_10003CBC8;
  if (!qword_10003CBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CBC8);
  }
  return result;
}

unint64_t sub_10001A8C8()
{
  unint64_t result = qword_10003CBD0;
  if (!qword_10003CBD0)
  {
    sub_1000056D8(qword_10003CBD8);
    sub_10001A870();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CBD0);
  }
  return result;
}

uint64_t sub_10001A93C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001A4A4();
  void *v5 = v2;
  v5[1] = sub_10000E09C;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_10001A9F4()
{
  unint64_t result = qword_10003CBF0;
  if (!qword_10003CBF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CBF0);
  }
  return result;
}

uint64_t sub_10001AA48()
{
  return sub_10000C5A8(&qword_10003CBF8, &qword_10003CC00);
}

uint64_t sub_10001AA84()
{
  uint64_t v0 = sub_1000297E0();
  sub_1000086C8(v0, qword_10003D688);
  sub_100008690(v0, (uint64_t)qword_10003D688);
  return sub_1000297C0();
}

uint64_t sub_10001AAE8()
{
  uint64_t v0 = sub_100008550(&qword_10003C610);
  sub_1000086C8(v0, qword_10003D6A0);
  uint64_t v1 = sub_100008690(v0, (uint64_t)qword_10003D6A0);
  sub_1000295A0();
  uint64_t v2 = sub_1000295B0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10001ABA0()
{
  uint64_t result = swift_getKeyPath();
  qword_10003D6B8 = result;
  return result;
}

uint64_t sub_10001ABC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100008550(&qword_10003C5D0);
  v3[9] = swift_task_alloc();
  sub_100008550(&qword_10003C5D8);
  v3[10] = swift_task_alloc();
  sub_100008550(&qword_10003CCA8);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_1000293F0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100008550(&qword_10003CCB0);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_10001AD8C, 0, 0);
}

uint64_t sub_10001AD8C()
{
  sub_100029430();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_10001A65C();
  void *v1 = v0;
  v1[1] = sub_10001AE60;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_10001B458, 0, &type metadata for NotifyMeEntity, v2);
}

uint64_t sub_10001AE60()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001AF5C, 0, 0);
}

uint64_t sub_10001AF5C()
{
  sub_100029430();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_100029430();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_10003C1B8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10003D6B8;
  *(void *)(v0 + 168) = qword_10003D6B8;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_10000C5A8(&qword_10003CCB8, &qword_10003CCC0);
  *uint64_t v3 = v0;
  v3[1] = sub_10001B0B4;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_10001B0B4()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10000ECB0;
  }
  else {
    uint64_t v2 = sub_10001B208;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001B208()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_100029430();
  uint64_t v7 = sub_100029750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_100029780();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_10001A9F4();
  sub_10001A870();
  sub_1000293C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_1000293E0();
  sub_100029400();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10001B45C()
{
  uint64_t v0 = sub_100008550(&qword_10003CCC8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003C1B8 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100029600();
  swift_release();
  sub_10001A870();
  sub_10000C5A8(&qword_10003CCD0, &qword_10003CCC8);
  sub_1000295F0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10001B5C4()
{
  if (qword_10003C1B8 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10001B624()
{
  unint64_t result = qword_10003CC08;
  if (!qword_10003CC08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CC08);
  }
  return result;
}

unint64_t sub_10001B67C()
{
  unint64_t result = qword_10003CC10;
  if (!qword_10003CC10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CC10);
  }
  return result;
}

uint64_t sub_10001B6D0()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10001B704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001B71C(a1, a2, a3, (void (*)(void))sub_10001A9F4);
}

uint64_t sub_10001B71C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001B770@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C1A8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D688, a1);
}

uint64_t sub_10001B7A8@<X0>(uint64_t a1@<X8>)
{
  if (qword_10003C1B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008550(&qword_10003C610);
  uint64_t v3 = sub_100008690(v2, (uint64_t)qword_10003D6A0);

  return sub_100010434(v3, a1);
}

uint64_t sub_10001B824(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100010548;
  return sub_10001ABC8(a1, v5, v4);
}

uint64_t sub_10001B8D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001C370();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10001B8F8()
{
  return 0xD00000000000001FLL;
}

unint64_t sub_10001B918()
{
  unint64_t result = qword_10003CC20;
  if (!qword_10003CC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CC20);
  }
  return result;
}

unint64_t sub_10001B970()
{
  unint64_t result = qword_10003CC28;
  if (!qword_10003CC28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CC28);
  }
  return result;
}

uint64_t sub_10001B9C4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10001B9E4, 0, 0);
}

uint64_t sub_10001B9E4()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  unsigned char *v1 = sub_10001C958(0, 0xD000000000000014, 0x8000000100030B10, 1) & 1;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10001BA70(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_10001BA94, 0, 0);
}

uint64_t sub_10001BA94()
{
  sub_10001CAD8(0, 0xD000000000000014, 0x8000000100030B10, *(unsigned char *)(v0 + 16), 0xD000000000000030, 0x8000000100030B30);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_10001BB34()
{
  unint64_t result = qword_10003CC30;
  if (!qword_10003CC30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CC30);
  }
  return result;
}

unint64_t sub_10001BB8C()
{
  unint64_t result = qword_10003CC38;
  if (!qword_10003CC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CC38);
  }
  return result;
}

uint64_t sub_10001BBE0(uint64_t a1)
{
  unint64_t v2 = sub_10001A65C();

  return _EntityURLRepresentation.init(stringLiteral:)(0xD000000000000057, 0x800000010002F830, a1, v2);
}

unint64_t sub_10001BC40()
{
  unint64_t result = qword_10003CC40;
  if (!qword_10003CC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CC40);
  }
  return result;
}

unint64_t sub_10001BC98()
{
  unint64_t result = qword_10003CC48;
  if (!qword_10003CC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CC48);
  }
  return result;
}

unint64_t sub_10001BCF0()
{
  unint64_t result = qword_10003CC50;
  if (!qword_10003CC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CC50);
  }
  return result;
}

uint64_t sub_10001BD44@<X0>(uint64_t *a1@<X8>)
{
  sub_10000C8DC();
  uint64_t result = sub_100029410();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10001BD84()
{
  sub_10001C038();
  uint64_t v2 = sub_1000296D0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000872C(v3, v0, v2, v1);
}

uint64_t sub_10001BE18@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C1A0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10003D670, a1);
}

uint64_t sub_10001BE50()
{
  return sub_10000C5A8(&qword_10003CC60, &qword_10003CC68);
}

uint64_t sub_10001BE8C(uint64_t a1)
{
  unint64_t v2 = sub_10001A65C();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001BEDC()
{
  unint64_t result = qword_10003CC70;
  if (!qword_10003CC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CC70);
  }
  return result;
}

uint64_t sub_10001BF34(uint64_t a1)
{
  unint64_t v2 = sub_10001BCF0();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for NotifyMeEntity.UpdateIntent_value()
{
  return &type metadata for NotifyMeEntity.UpdateIntent_value;
}

ValueMetadata *type metadata accessor for NotifyMeEntity.NotifyMeEntityQuery()
{
  return &type metadata for NotifyMeEntity.NotifyMeEntityQuery;
}

ValueMetadata *type metadata accessor for NotifyMeEntity()
{
  return &type metadata for NotifyMeEntity;
}

ValueMetadata *type metadata accessor for OpenNotifyMeEntity()
{
  return &type metadata for OpenNotifyMeEntity;
}

uint64_t sub_10001BFC0()
{
  return sub_10000C5A8(&qword_10003CC78, &qword_10003CC80);
}

uint64_t sub_10001BFFC()
{
  return sub_10000C5A8(&qword_10003CC88, &qword_10003CC80);
}

unint64_t sub_10001C038()
{
  unint64_t result = qword_10003CC90;
  if (!qword_10003CC90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CC90);
  }
  return result;
}

uint64_t sub_10001C08C()
{
  v17[0] = sub_1000296C0();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  unint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008550(&qword_10003C328);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000297E0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100008550(&qword_10003CC98);
  sub_1000297C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v17[1] = 0;
  uint64_t v14 = sub_1000293F0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_10001A65C();
  return sub_100029460();
}

uint64_t sub_10001C370()
{
  uint64_t v0 = sub_100008550(&qword_10003C5B0);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1000296C0();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100008550(&qword_10003C328);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_1000297E0();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100008550(&qword_10003CC98);
  sub_1000297C0();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_1000293F0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_10001A65C();
  uint64_t v19 = v23;
  uint64_t v24 = sub_100029460();
  sub_100008550(&qword_10003C5C0);
  sub_1000297C0();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100029910();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_100029470();
  return v24;
}

uint64_t sub_10001C7B0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

unint64_t sub_10001C7BC()
{
  unint64_t result = qword_10003CCE8;
  if (!qword_10003CCE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CCE8);
  }
  return result;
}

unint64_t sub_10001C810()
{
  unint64_t result = qword_10003CCF0;
  if (!qword_10003CCF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CCF0);
  }
  return result;
}

unint64_t sub_10001C864(char a1)
{
  if (!a1) {
    return 0xD000000000000013;
  }
  if (a1 == 1) {
    return 0xD000000000000010;
  }
  return 0xD000000000000012;
}

uint64_t sub_10001C8C0()
{
  uint64_t v0 = sub_100029620();
  sub_1000086C8(v0, qword_10003D6C0);
  sub_100008690(v0, (uint64_t)qword_10003D6C0);
  return sub_100029610();
}

uint64_t sub_10001C924()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for AppIntentsHelper()
{
  return self;
}

uint64_t sub_10001C958(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  id v5 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v6 = sub_1000298F0();
  swift_bridgeObjectRelease();
  id v7 = [v5 initWithSuiteName:v6];

  if (v7)
  {
    NSString v8 = sub_1000298F0();
    id v9 = [v7 objectForKey:v8];

    if (v9)
    {
      sub_100029920();

      swift_unknownObjectRelease();
      sub_10001CCBC(v12, v13);
      sub_10001CCBC(v13, v12);
      if (swift_dynamicCast()) {
        a4 = v11;
      }
    }
    else
    {
    }
  }
  return a4 & 1;
}

void sub_10001CAD8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  id v8 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v9 = sub_1000298F0();
  swift_bridgeObjectRelease();
  id v10 = [v8 initWithSuiteName:v9];

  if (v10)
  {
    NSString v11 = sub_1000298F0();
    [v10 setBool:a4 & 1 forKey:v11];

    [v10 synchronize];
    center = CFNotificationCenterGetDarwinNotifyCenter();
    uint64_t v12 = (__CFString *)sub_1000298F0();
    CFNotificationCenterPostNotification(center, v12, 0, 0, 1u);

    if (a6)
    {
      uint64_t v13 = (__CFString *)sub_1000298F0();
      CFNotificationCenterPostNotification(center, v13, 0, 0, 1u);
    }
  }
}

_OWORD *sub_10001CCBC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_10001CCD0()
{
  unint64_t result = qword_10003CD90;
  if (!qword_10003CD90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CD90);
  }
  return result;
}

unint64_t sub_10001CD28()
{
  unint64_t result = qword_10003CD98;
  if (!qword_10003CD98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CD98);
  }
  return result;
}

uint64_t sub_10001CD7C()
{
  uint64_t v0 = sub_1000297D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100029810();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_1000298E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_1000297E0();
  sub_1000086C8(v6, qword_10003D6D8);
  sub_100008690(v6, (uint64_t)qword_10003D6D8);
  sub_1000298D0();
  sub_100029800();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_1000297F0();
}

unint64_t sub_10001CF60()
{
  unint64_t result = qword_10003CDA0;
  if (!qword_10003CDA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CDA0);
  }
  return result;
}

uint64_t sub_10001CFB4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10001FE80();
  unint64_t v5 = sub_10001F6E8();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10001D020()
{
  unint64_t result = qword_10003CDA8;
  if (!qword_10003CDA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CDA8);
  }
  return result;
}

unint64_t sub_10001D078()
{
  unint64_t result = qword_10003CDB0;
  if (!qword_10003CDB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CDB0);
  }
  return result;
}

uint64_t sub_10001D0CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001EC10(a1, a2, a3, (void (*)(void))sub_10001CF60);
}

uint64_t sub_10001D0E4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C1C8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D6D8, a1);
}

uint64_t sub_10001D11C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001FE80();
  unint64_t v7 = sub_10001FED4();
  unint64_t v8 = sub_10001F6E8();
  void *v5 = v2;
  v5[1] = sub_100005D84;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_10001D1F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001F73C();
  *a1 = result;
  return result;
}

uint64_t sub_10001D218(uint64_t a1)
{
  unint64_t v2 = sub_10001CF60();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10001D258()
{
  unint64_t result = qword_10003CDC0;
  if (!qword_10003CDC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CDC0);
  }
  return result;
}

uint64_t sub_10001D2B0()
{
  uint64_t v0 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1000297D0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100029810();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_1000298E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_1000297E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_100029770();
  sub_1000086C8(v10, qword_10003D6F0);
  sub_100008690(v10, (uint64_t)qword_10003D6F0);
  sub_1000298D0();
  sub_100029800();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_1000297F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_100029760();
}

uint64_t sub_10001D588()
{
  uint64_t v0 = sub_100008550(&qword_10003C358);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000297E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_1000297C0();
  sub_1000297C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  if (qword_10003C1C0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100029620();
  uint64_t v9 = sub_100008690(v8, (uint64_t)qword_10003D6C0);
  uint64_t v10 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v2, v9, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v2, 0, 1, v8);
  return sub_100029640();
}

uint64_t sub_10001D7F4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_1000297E0();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_10001D884, 0, 0);
}

uint64_t sub_10001D884()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100008550(&qword_10003CE48);
  sub_1000297C0();
  sub_10000C5A8(&qword_10003CF00, &qword_10003CF08);
  uint64_t *v1 = sub_1000297A0();
  swift_task_dealloc();
  unint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_10001D998()
{
  unint64_t result = qword_10003CDD0;
  if (!qword_10003CDD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CDD0);
  }
  return result;
}

uint64_t sub_10001D9EC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10001F1E4();
  *uint64_t v4 = v2;
  v4[1] = sub_10000DA40;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10001DAA0()
{
  unint64_t result = qword_10003CDE0;
  if (!qword_10003CDE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CDE0);
  }
  return result;
}

unint64_t sub_10001DAF8()
{
  unint64_t result = qword_10003CDE8;
  if (!qword_10003CDE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CDE8);
  }
  return result;
}

unint64_t sub_10001DB50()
{
  unint64_t result = qword_10003CDF0[0];
  if (!qword_10003CDF0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10003CDF0);
  }
  return result;
}

uint64_t sub_10001DBA4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001F1E4();
  void *v5 = v2;
  v5[1] = sub_10000DD10;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10001DC58(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10001F1E4();
  *uint64_t v4 = v2;
  v4[1] = sub_100010544;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10001DD0C()
{
  unint64_t result = qword_10003CE08;
  if (!qword_10003CE08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE08);
  }
  return result;
}

unint64_t sub_10001DD64()
{
  unint64_t result = qword_10003CE10;
  if (!qword_10003CE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE10);
  }
  return result;
}

unint64_t sub_10001DDBC()
{
  unint64_t result = qword_10003CE18;
  if (!qword_10003CE18)
  {
    sub_1000056D8(qword_10003CE20);
    sub_10001DD64();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE18);
  }
  return result;
}

uint64_t sub_10001DE30(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001D998();
  void *v5 = v2;
  v5[1] = sub_10000E09C;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_10001DEE8()
{
  unint64_t result = qword_10003CE38;
  if (!qword_10003CE38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE38);
  }
  return result;
}

uint64_t sub_10001DF3C()
{
  return sub_10000C5A8(&qword_10003CE40, &qword_10003CE48);
}

uint64_t sub_10001DF78()
{
  uint64_t v0 = sub_1000297E0();
  sub_1000086C8(v0, qword_10003D708);
  sub_100008690(v0, (uint64_t)qword_10003D708);
  return sub_1000297C0();
}

uint64_t sub_10001DFDC()
{
  uint64_t v0 = sub_100008550(&qword_10003C610);
  sub_1000086C8(v0, qword_10003D720);
  uint64_t v1 = sub_100008690(v0, (uint64_t)qword_10003D720);
  sub_1000295A0();
  uint64_t v2 = sub_1000295B0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10001E094()
{
  uint64_t result = swift_getKeyPath();
  qword_10003D738 = result;
  return result;
}

uint64_t sub_10001E0BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100008550(&qword_10003C5D0);
  v3[9] = swift_task_alloc();
  sub_100008550(&qword_10003C5D8);
  v3[10] = swift_task_alloc();
  sub_100008550(&qword_10003CEF0);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_1000293F0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100008550(&qword_10003CEF8);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_10001E280, 0, 0);
}

uint64_t sub_10001E280()
{
  sub_100029430();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_10001DB50();
  void *v1 = v0;
  v1[1] = sub_10001E354;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_10001E94C, 0, &type metadata for LowQualityImageModeEntity, v2);
}

uint64_t sub_10001E354()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001E450, 0, 0);
}

uint64_t sub_10001E450()
{
  sub_100029430();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_100029430();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_10003C1E8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10003D738;
  *(void *)(v0 + 168) = qword_10003D738;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_10000C5A8(&qword_10003CF00, &qword_10003CF08);
  *uint64_t v3 = v0;
  v3[1] = sub_10001E5A8;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_10001E5A8()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10000ECB0;
  }
  else {
    uint64_t v2 = sub_10001E6FC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001E6FC()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_100029430();
  uint64_t v7 = sub_100029750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_100029780();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_10001DEE8();
  sub_10001DD64();
  sub_1000293C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_1000293E0();
  sub_100029400();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10001E950()
{
  uint64_t v0 = sub_100008550(&qword_10003CF10);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003C1E8 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100029600();
  swift_release();
  sub_10001DD64();
  sub_10000C5A8(&qword_10003CF18, &qword_10003CF10);
  sub_1000295F0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10001EAB8()
{
  if (qword_10003C1E8 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10001EB18()
{
  unint64_t result = qword_10003CE50;
  if (!qword_10003CE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE50);
  }
  return result;
}

unint64_t sub_10001EB70()
{
  unint64_t result = qword_10003CE58;
  if (!qword_10003CE58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE58);
  }
  return result;
}

uint64_t sub_10001EBC4()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10001EBF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001EC10(a1, a2, a3, (void (*)(void))sub_10001DEE8);
}

uint64_t sub_10001EC10(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001EC64@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C1D8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D708, a1);
}

uint64_t sub_10001EC9C@<X0>(uint64_t a1@<X8>)
{
  if (qword_10003C1E0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008550(&qword_10003C610);
  uint64_t v3 = sub_100008690(v2, (uint64_t)qword_10003D720);

  return sub_100010434(v3, a1);
}

uint64_t sub_10001ED18(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100010548;
  return sub_10001E0BC(a1, v5, v4);
}

uint64_t sub_10001EDC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001FA20();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10001EDEC()
{
  return 0xD00000000000002ALL;
}

unint64_t sub_10001EE10()
{
  unint64_t result = qword_10003CE68;
  if (!qword_10003CE68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE68);
  }
  return result;
}

unint64_t sub_10001EE68()
{
  unint64_t result = qword_10003CE70;
  if (!qword_10003CE70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE70);
  }
  return result;
}

uint64_t sub_10001EEBC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10001EEDC, 0, 0);
}

uint64_t sub_10001EEDC()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  unsigned char *v1 = sub_10001C958(2, 0xD000000000000019, 0x8000000100030DE0, 0) & 1;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10001EF68(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_10001EF8C, 0, 0);
}

uint64_t sub_10001EF8C()
{
  id v1 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v2 = sub_1000298F0();
  id v3 = [v1 initWithSuiteName:v2];

  if (v3)
  {
    uint64_t v4 = *(unsigned __int8 *)(v0 + 16);
    NSString v5 = sub_1000298F0();
    [v3 setBool:v4 forKey:v5];

    [v3 synchronize];
    uint64_t v6 = CFNotificationCenterGetDarwinNotifyCenter();
    uint64_t v7 = (__CFString *)sub_1000298F0();
    CFNotificationCenterPostNotification(v6, v7, 0, 0, 1u);
  }
  id v8 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v9 = sub_1000298F0();
  id v10 = [v8 initWithSuiteName:v9];

  if (v10)
  {
    NSString v11 = sub_1000298F0();
    [v10 setBool:1 forKey:v11];

    [v10 synchronize];
    uint64_t v12 = CFNotificationCenterGetDarwinNotifyCenter();
    uint64_t v13 = (__CFString *)sub_1000298F0();
    CFNotificationCenterPostNotification(v12, v13, 0, 0, 1u);
  }
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

unint64_t sub_10001F1E4()
{
  unint64_t result = qword_10003CE78;
  if (!qword_10003CE78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE78);
  }
  return result;
}

unint64_t sub_10001F23C()
{
  unint64_t result = qword_10003CE80;
  if (!qword_10003CE80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE80);
  }
  return result;
}

uint64_t sub_10001F290(uint64_t a1)
{
  unint64_t v2 = sub_10001DB50();

  return _EntityURLRepresentation.init(stringLiteral:)(0xD00000000000005CLL, 0x800000010002F950, a1, v2);
}

unint64_t sub_10001F2F0()
{
  unint64_t result = qword_10003CE88;
  if (!qword_10003CE88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE88);
  }
  return result;
}

unint64_t sub_10001F348()
{
  unint64_t result = qword_10003CE90;
  if (!qword_10003CE90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE90);
  }
  return result;
}

unint64_t sub_10001F3A0()
{
  unint64_t result = qword_10003CE98;
  if (!qword_10003CE98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE98);
  }
  return result;
}

uint64_t sub_10001F3F4@<X0>(uint64_t *a1@<X8>)
{
  sub_10000C934();
  uint64_t result = sub_100029410();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10001F434()
{
  sub_10001F6E8();
  uint64_t v2 = sub_1000296D0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000872C(v3, v0, v2, v1);
}

uint64_t sub_10001F4C8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C1D0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10003D6F0, a1);
}

uint64_t sub_10001F500()
{
  return sub_10000C5A8(&qword_10003CEA8, &qword_10003CEB0);
}

uint64_t sub_10001F53C(uint64_t a1)
{
  unint64_t v2 = sub_10001DB50();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001F58C()
{
  unint64_t result = qword_10003CEB8;
  if (!qword_10003CEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CEB8);
  }
  return result;
}

uint64_t sub_10001F5E4(uint64_t a1)
{
  unint64_t v2 = sub_10001F3A0();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for LowQualityImageModeEntity.UpdateIntent_value()
{
  return &type metadata for LowQualityImageModeEntity.UpdateIntent_value;
}

ValueMetadata *type metadata accessor for LowQualityImageModeEntity.LowQualityImageModeEntityQuery()
{
  return &type metadata for LowQualityImageModeEntity.LowQualityImageModeEntityQuery;
}

ValueMetadata *type metadata accessor for LowQualityImageModeEntity()
{
  return &type metadata for LowQualityImageModeEntity;
}

ValueMetadata *type metadata accessor for OpenLowQualityImageModeEntity()
{
  return &type metadata for OpenLowQualityImageModeEntity;
}

uint64_t sub_10001F670()
{
  return sub_10000C5A8(&qword_10003CEC0, &qword_10003CEC8);
}

uint64_t sub_10001F6AC()
{
  return sub_10000C5A8(&qword_10003CED0, &qword_10003CEC8);
}

unint64_t sub_10001F6E8()
{
  unint64_t result = qword_10003CED8;
  if (!qword_10003CED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CED8);
  }
  return result;
}

uint64_t sub_10001F73C()
{
  v17[0] = sub_1000296C0();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  unint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008550(&qword_10003C328);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v8 = (char *)v17 - v7;
  uint64_t v9 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v9 - 8);
  NSString v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000297E0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100008550(&qword_10003CEE0);
  sub_1000297C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v17[1] = 0;
  uint64_t v14 = sub_1000293F0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_10001DB50();
  return sub_100029460();
}

uint64_t sub_10001FA20()
{
  uint64_t v0 = sub_100008550(&qword_10003C5B0);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1000296C0();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100008550(&qword_10003C328);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  id v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v13;
  uint64_t v14 = sub_1000297E0();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100008550(&qword_10003CEE0);
  sub_1000297C0();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_1000293F0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v23 = v10;
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_10001DB50();
  uint64_t v19 = v22;
  uint64_t v24 = sub_100029460();
  sub_100008550(&qword_10003C5C0);
  sub_1000297C0();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100029910();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v23, 1, 1, v16);
  v26(v4, v27, v31);
  sub_100029470();
  return v24;
}

uint64_t sub_10001FE74@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

unint64_t sub_10001FE80()
{
  unint64_t result = qword_10003CF30;
  if (!qword_10003CF30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CF30);
  }
  return result;
}

unint64_t sub_10001FED4()
{
  unint64_t result = qword_10003CF38;
  if (!qword_10003CF38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CF38);
  }
  return result;
}

unint64_t sub_10001FF2C()
{
  unint64_t result = qword_10003CF40;
  if (!qword_10003CF40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CF40);
  }
  return result;
}

unint64_t sub_10001FF84()
{
  unint64_t result = qword_10003CF48;
  if (!qword_10003CF48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CF48);
  }
  return result;
}

uint64_t sub_10001FFD8()
{
  uint64_t v0 = sub_1000297D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100029810();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_1000298E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_1000297E0();
  sub_1000086C8(v6, qword_10003D740);
  sub_100008690(v6, (uint64_t)qword_10003D740);
  sub_1000298D0();
  sub_100029800();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_1000297F0();
}

unint64_t sub_1000201BC()
{
  unint64_t result = qword_10003CF50;
  if (!qword_10003CF50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CF50);
  }
  return result;
}

uint64_t sub_100020210(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100022FDC();
  unint64_t v5 = sub_100022858();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10002027C()
{
  unint64_t result = qword_10003CF58;
  if (!qword_10003CF58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CF58);
  }
  return result;
}

unint64_t sub_1000202D4()
{
  unint64_t result = qword_10003CF60;
  if (!qword_10003CF60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CF60);
  }
  return result;
}

uint64_t sub_100020328(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100021E6C(a1, a2, a3, (void (*)(void))sub_1000201BC);
}

uint64_t sub_100020340@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C1F0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D740, a1);
}

uint64_t sub_100020378(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100022FDC();
  unint64_t v7 = sub_100023030();
  unint64_t v8 = sub_100022858();
  void *v5 = v2;
  v5[1] = sub_100005D84;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_10002044C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000228AC();
  *a1 = result;
  return result;
}

uint64_t sub_100020474(uint64_t a1)
{
  unint64_t v2 = sub_1000201BC();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_1000204B4()
{
  unint64_t result = qword_10003CF70;
  if (!qword_10003CF70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CF70);
  }
  return result;
}

uint64_t sub_10002050C()
{
  uint64_t v0 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1000297D0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100029810();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_1000298E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_1000297E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_100029770();
  sub_1000086C8(v10, qword_10003D758);
  sub_100008690(v10, (uint64_t)qword_10003D758);
  sub_1000298D0();
  sub_100029800();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_1000297F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_100029760();
}

uint64_t sub_1000207E4()
{
  uint64_t v0 = sub_100008550(&qword_10003C358);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000297E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_1000297C0();
  sub_1000297C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  if (qword_10003C1C0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100029620();
  uint64_t v9 = sub_100008690(v8, (uint64_t)qword_10003D6C0);
  uint64_t v10 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v2, v9, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v2, 0, 1, v8);
  return sub_100029640();
}

uint64_t sub_100020A50(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_1000297E0();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100020AE0, 0, 0);
}

uint64_t sub_100020AE0()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100008550(&qword_10003CFF8);
  sub_1000297C0();
  sub_10000C5A8(&qword_10003D0B0, &qword_10003D0B8);
  uint64_t *v1 = sub_1000297A0();
  swift_task_dealloc();
  unint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_100020BF4()
{
  unint64_t result = qword_10003CF80;
  if (!qword_10003CF80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CF80);
  }
  return result;
}

uint64_t sub_100020C48(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100022354();
  *uint64_t v4 = v2;
  v4[1] = sub_10000DA40;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100020CFC()
{
  unint64_t result = qword_10003CF90;
  if (!qword_10003CF90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CF90);
  }
  return result;
}

unint64_t sub_100020D54()
{
  unint64_t result = qword_10003CF98;
  if (!qword_10003CF98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CF98);
  }
  return result;
}

unint64_t sub_100020DAC()
{
  unint64_t result = qword_10003CFA0[0];
  if (!qword_10003CFA0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10003CFA0);
  }
  return result;
}

uint64_t sub_100020E00(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100022354();
  void *v5 = v2;
  v5[1] = sub_10000DD10;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100020EB4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100022354();
  *uint64_t v4 = v2;
  v4[1] = sub_100010544;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100020F68()
{
  unint64_t result = qword_10003CFB8;
  if (!qword_10003CFB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CFB8);
  }
  return result;
}

unint64_t sub_100020FC0()
{
  unint64_t result = qword_10003CFC0;
  if (!qword_10003CFC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CFC0);
  }
  return result;
}

unint64_t sub_100021018()
{
  unint64_t result = qword_10003CFC8;
  if (!qword_10003CFC8)
  {
    sub_1000056D8(qword_10003CFD0);
    sub_100020FC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CFC8);
  }
  return result;
}

uint64_t sub_10002108C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100020BF4();
  void *v5 = v2;
  v5[1] = sub_10000E09C;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100021144()
{
  unint64_t result = qword_10003CFE8;
  if (!qword_10003CFE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CFE8);
  }
  return result;
}

uint64_t sub_100021198()
{
  return sub_10000C5A8(&qword_10003CFF0, &qword_10003CFF8);
}

uint64_t sub_1000211D4()
{
  uint64_t v0 = sub_1000297E0();
  sub_1000086C8(v0, qword_10003D770);
  sub_100008690(v0, (uint64_t)qword_10003D770);
  return sub_1000297C0();
}

uint64_t sub_100021238()
{
  uint64_t v0 = sub_100008550(&qword_10003C610);
  sub_1000086C8(v0, qword_10003D788);
  uint64_t v1 = sub_100008690(v0, (uint64_t)qword_10003D788);
  sub_1000295A0();
  uint64_t v2 = sub_1000295B0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_1000212F0()
{
  uint64_t result = swift_getKeyPath();
  qword_10003D7A0 = result;
  return result;
}

uint64_t sub_100021318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100008550(&qword_10003C5D0);
  v3[9] = swift_task_alloc();
  sub_100008550(&qword_10003C5D8);
  v3[10] = swift_task_alloc();
  sub_100008550(&qword_10003D0A0);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_1000293F0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100008550(&qword_10003D0A8);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_1000214DC, 0, 0);
}

uint64_t sub_1000214DC()
{
  sub_100029430();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_100020DAC();
  void *v1 = v0;
  v1[1] = sub_1000215B0;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100021BA8, 0, &type metadata for ShowSubjectFieldEntity, v2);
}

uint64_t sub_1000215B0()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000216AC, 0, 0);
}

uint64_t sub_1000216AC()
{
  sub_100029430();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_100029430();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_10003C210 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10003D7A0;
  *(void *)(v0 + 168) = qword_10003D7A0;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_10000C5A8(&qword_10003D0B0, &qword_10003D0B8);
  *uint64_t v3 = v0;
  v3[1] = sub_100021804;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_100021804()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10000ECB0;
  }
  else {
    uint64_t v2 = sub_100021958;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100021958()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_100029430();
  uint64_t v7 = sub_100029750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_100029780();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100021144();
  sub_100020FC0();
  sub_1000293C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_1000293E0();
  sub_100029400();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100021BAC()
{
  uint64_t v0 = sub_100008550(&qword_10003D0C0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003C210 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100029600();
  swift_release();
  sub_100020FC0();
  sub_10000C5A8(&qword_10003D0C8, &qword_10003D0C0);
  sub_1000295F0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100021D14()
{
  if (qword_10003C210 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100021D74()
{
  unint64_t result = qword_10003D000;
  if (!qword_10003D000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D000);
  }
  return result;
}

unint64_t sub_100021DCC()
{
  unint64_t result = qword_10003D008;
  if (!qword_10003D008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D008);
  }
  return result;
}

uint64_t sub_100021E20()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100021E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100021E6C(a1, a2, a3, (void (*)(void))sub_100021144);
}

uint64_t sub_100021E6C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100021EC0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C200, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D770, a1);
}

uint64_t sub_100021EF8@<X0>(uint64_t a1@<X8>)
{
  if (qword_10003C208 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008550(&qword_10003C610);
  uint64_t v3 = sub_100008690(v2, (uint64_t)qword_10003D788);

  return sub_100010434(v3, a1);
}

uint64_t sub_100021F74(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100010548;
  return sub_100021318(a1, v5, v4);
}

uint64_t sub_100022020@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100022B90();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100022048()
{
  return 0xD000000000000027;
}

unint64_t sub_100022068()
{
  unint64_t result = qword_10003D018;
  if (!qword_10003D018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D018);
  }
  return result;
}

unint64_t sub_1000220C0()
{
  unint64_t result = qword_10003D020;
  if (!qword_10003D020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D020);
  }
  return result;
}

uint64_t sub_100022114(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100022134, 0, 0);
}

uint64_t sub_100022134()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  unsigned char *v1 = sub_10001C958(0, 0x53776F6853534D4DLL, 0xEE007463656A6275, 0) & 1;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000221C8(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_1000221EC, 0, 0);
}

uint64_t sub_1000221EC()
{
  id v1 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v2 = sub_1000298F0();
  id v3 = [v1 initWithSuiteName:v2];

  if (v3)
  {
    uint64_t v4 = *(unsigned __int8 *)(v0 + 16);
    NSString v5 = sub_1000298F0();
    [v3 setBool:v4 forKey:v5];

    [v3 synchronize];
    uint64_t v6 = CFNotificationCenterGetDarwinNotifyCenter();
    uint64_t v7 = (__CFString *)sub_1000298F0();
    CFNotificationCenterPostNotification(v6, v7, 0, 0, 1u);
  }
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

unint64_t sub_100022354()
{
  unint64_t result = qword_10003D028;
  if (!qword_10003D028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D028);
  }
  return result;
}

unint64_t sub_1000223AC()
{
  unint64_t result = qword_10003D030;
  if (!qword_10003D030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D030);
  }
  return result;
}

uint64_t sub_100022400(uint64_t a1)
{
  unint64_t v2 = sub_100020DAC();

  return _EntityURLRepresentation.init(stringLiteral:)(0xD00000000000005BLL, 0x800000010002F710, a1, v2);
}

unint64_t sub_100022460()
{
  unint64_t result = qword_10003D038;
  if (!qword_10003D038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D038);
  }
  return result;
}

unint64_t sub_1000224B8()
{
  unint64_t result = qword_10003D040;
  if (!qword_10003D040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D040);
  }
  return result;
}

unint64_t sub_100022510()
{
  unint64_t result = qword_10003D048;
  if (!qword_10003D048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D048);
  }
  return result;
}

uint64_t sub_100022564@<X0>(uint64_t *a1@<X8>)
{
  sub_10000C554();
  uint64_t result = sub_100029410();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000225A4()
{
  sub_100022858();
  uint64_t v2 = sub_1000296D0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000872C(v3, v0, v2, v1);
}

uint64_t sub_100022638@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C1F8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10003D758, a1);
}

uint64_t sub_100022670()
{
  return sub_10000C5A8(&qword_10003D058, &qword_10003D060);
}

uint64_t sub_1000226AC(uint64_t a1)
{
  unint64_t v2 = sub_100020DAC();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000226FC()
{
  unint64_t result = qword_10003D068;
  if (!qword_10003D068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D068);
  }
  return result;
}

uint64_t sub_100022754(uint64_t a1)
{
  unint64_t v2 = sub_100022510();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for ShowSubjectFieldEntity.UpdateIntent_value()
{
  return &type metadata for ShowSubjectFieldEntity.UpdateIntent_value;
}

ValueMetadata *type metadata accessor for ShowSubjectFieldEntity.ShowSubjectFieldEntityQuery()
{
  return &type metadata for ShowSubjectFieldEntity.ShowSubjectFieldEntityQuery;
}

ValueMetadata *type metadata accessor for ShowSubjectFieldEntity()
{
  return &type metadata for ShowSubjectFieldEntity;
}

ValueMetadata *type metadata accessor for OpenShowSubjectFieldEntity()
{
  return &type metadata for OpenShowSubjectFieldEntity;
}

uint64_t sub_1000227E0()
{
  return sub_10000C5A8(&qword_10003D070, &qword_10003D078);
}

uint64_t sub_10002281C()
{
  return sub_10000C5A8(&qword_10003D080, &qword_10003D078);
}

unint64_t sub_100022858()
{
  unint64_t result = qword_10003D088;
  if (!qword_10003D088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D088);
  }
  return result;
}

uint64_t sub_1000228AC()
{
  v17[0] = sub_1000296C0();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  unint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008550(&qword_10003C328);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000297E0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100008550(&qword_10003D090);
  sub_1000297C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v17[1] = 0;
  uint64_t v14 = sub_1000293F0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_100020DAC();
  return sub_100029460();
}

uint64_t sub_100022B90()
{
  uint64_t v0 = sub_100008550(&qword_10003C5B0);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1000296C0();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100008550(&qword_10003C328);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_1000297E0();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100008550(&qword_10003D090);
  sub_1000297C0();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_1000293F0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_100020DAC();
  uint64_t v19 = v23;
  uint64_t v24 = sub_100029460();
  sub_100008550(&qword_10003C5C0);
  sub_1000297C0();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100029910();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_100029470();
  return v24;
}

uint64_t sub_100022FD0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

unint64_t sub_100022FDC()
{
  unint64_t result = qword_10003D0E0;
  if (!qword_10003D0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D0E0);
  }
  return result;
}

unint64_t sub_100023030()
{
  unint64_t result = qword_10003D0E8;
  if (!qword_10003D0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D0E8);
  }
  return result;
}

uint64_t sub_100023084()
{
  uint64_t v0 = sub_100008550(&qword_10003D0F8);

  return TupleWidget.init(_:)(v0, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100023104()
{
  unint64_t result = qword_10003D0F0;
  if (!qword_10003D0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D0F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for MessagesSettingsWidgetKitExtensionBundle()
{
  return &type metadata for MessagesSettingsWidgetKitExtensionBundle;
}

uint64_t sub_100023168()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100023188()
{
  unint64_t result = qword_10003D100;
  if (!qword_10003D100)
  {
    sub_1000056D8(&qword_10003D108);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D100);
  }
  return result;
}

unint64_t sub_1000231E8()
{
  unint64_t result = qword_10003D110;
  if (!qword_10003D110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D110);
  }
  return result;
}

unint64_t sub_100023240()
{
  unint64_t result = qword_10003D118;
  if (!qword_10003D118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D118);
  }
  return result;
}

uint64_t sub_100023294()
{
  uint64_t v0 = sub_1000297D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100029810();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_1000298E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_1000297E0();
  sub_1000086C8(v6, qword_10003D7A8);
  sub_100008690(v6, (uint64_t)qword_10003D7A8);
  sub_1000298D0();
  sub_100029800();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_1000297F0();
}

unint64_t sub_100023478()
{
  unint64_t result = qword_10003D120;
  if (!qword_10003D120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D120);
  }
  return result;
}

uint64_t sub_1000234CC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000261BC();
  unint64_t v5 = sub_100025A38();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100023538()
{
  unint64_t result = qword_10003D128;
  if (!qword_10003D128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D128);
  }
  return result;
}

unint64_t sub_100023590()
{
  unint64_t result = qword_10003D130;
  if (!qword_10003D130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D130);
  }
  return result;
}

uint64_t sub_1000235E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100025128(a1, a2, a3, (void (*)(void))sub_100023478);
}

uint64_t sub_1000235FC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C218, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D7A8, a1);
}

uint64_t sub_100023634(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000261BC();
  unint64_t v7 = sub_100026210();
  unint64_t v8 = sub_100025A38();
  void *v5 = v2;
  v5[1] = sub_100005D84;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100023708@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100025A8C();
  *a1 = result;
  return result;
}

uint64_t sub_100023730(uint64_t a1)
{
  unint64_t v2 = sub_100023478();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100023770()
{
  unint64_t result = qword_10003D140;
  if (!qword_10003D140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D140);
  }
  return result;
}

uint64_t sub_1000237C8()
{
  uint64_t v0 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1000297D0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100029810();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_1000298E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_1000297E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_100029770();
  sub_1000086C8(v10, qword_10003D7C0);
  sub_100008690(v10, (uint64_t)qword_10003D7C0);
  sub_1000298D0();
  sub_100029800();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_1000297F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_100029760();
}

uint64_t sub_100023AA0()
{
  uint64_t v0 = sub_100008550(&qword_10003C358);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000297E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_1000297C0();
  sub_1000297C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  if (qword_10003C1C0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100029620();
  uint64_t v9 = sub_100008690(v8, (uint64_t)qword_10003D6C0);
  uint64_t v10 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v2, v9, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v2, 0, 1, v8);
  return sub_100029640();
}

uint64_t sub_100023D0C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_1000297E0();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100023D9C, 0, 0);
}

uint64_t sub_100023D9C()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100008550(&qword_10003D1C8);
  sub_1000297C0();
  sub_10000C5A8(&qword_10003D280, &qword_10003D288);
  uint64_t *v1 = sub_1000297A0();
  swift_task_dealloc();
  unint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_100023EB0()
{
  unint64_t result = qword_10003D150;
  if (!qword_10003D150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D150);
  }
  return result;
}

uint64_t sub_100023F04(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100025534();
  *uint64_t v4 = v2;
  v4[1] = sub_10000DA40;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100023FB8()
{
  unint64_t result = qword_10003D160;
  if (!qword_10003D160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D160);
  }
  return result;
}

unint64_t sub_100024010()
{
  unint64_t result = qword_10003D168;
  if (!qword_10003D168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D168);
  }
  return result;
}

unint64_t sub_100024068()
{
  unint64_t result = qword_10003D170[0];
  if (!qword_10003D170[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10003D170);
  }
  return result;
}

uint64_t sub_1000240BC(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100025534();
  void *v5 = v2;
  v5[1] = sub_10000DD10;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100024170(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100025534();
  *uint64_t v4 = v2;
  v4[1] = sub_100010544;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100024224()
{
  unint64_t result = qword_10003D188;
  if (!qword_10003D188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D188);
  }
  return result;
}

unint64_t sub_10002427C()
{
  unint64_t result = qword_10003D190;
  if (!qword_10003D190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D190);
  }
  return result;
}

unint64_t sub_1000242D4()
{
  unint64_t result = qword_10003D198;
  if (!qword_10003D198)
  {
    sub_1000056D8(qword_10003D1A0);
    sub_10002427C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D198);
  }
  return result;
}

uint64_t sub_100024348(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100023EB0();
  void *v5 = v2;
  v5[1] = sub_10000E09C;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100024400()
{
  unint64_t result = qword_10003D1B8;
  if (!qword_10003D1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D1B8);
  }
  return result;
}

uint64_t sub_100024454()
{
  return sub_10000C5A8(&qword_10003D1C0, &qword_10003D1C8);
}

uint64_t sub_100024490()
{
  uint64_t v0 = sub_1000297E0();
  sub_1000086C8(v0, qword_10003D7D8);
  sub_100008690(v0, (uint64_t)qword_10003D7D8);
  return sub_1000297C0();
}

uint64_t sub_1000244F4()
{
  uint64_t v0 = sub_100008550(&qword_10003C610);
  sub_1000086C8(v0, qword_10003D7F0);
  uint64_t v1 = sub_100008690(v0, (uint64_t)qword_10003D7F0);
  sub_1000295A0();
  uint64_t v2 = sub_1000295B0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_1000245AC()
{
  uint64_t result = swift_getKeyPath();
  qword_10003D808 = result;
  return result;
}

uint64_t sub_1000245D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100008550(&qword_10003C5D0);
  v3[9] = swift_task_alloc();
  sub_100008550(&qword_10003C5D8);
  v3[10] = swift_task_alloc();
  sub_100008550(&qword_10003D270);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_1000293F0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100008550(&qword_10003D278);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_100024798, 0, 0);
}

uint64_t sub_100024798()
{
  sub_100029430();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_100024068();
  void *v1 = v0;
  v1[1] = sub_10002486C;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100024E64, 0, &type metadata for SendReadReceiptsEntity, v2);
}

uint64_t sub_10002486C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100024968, 0, 0);
}

uint64_t sub_100024968()
{
  sub_100029430();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_100029430();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_10003C238 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10003D808;
  *(void *)(v0 + 168) = qword_10003D808;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_10000C5A8(&qword_10003D280, &qword_10003D288);
  *uint64_t v3 = v0;
  v3[1] = sub_100024AC0;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_100024AC0()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10000ECB0;
  }
  else {
    uint64_t v2 = sub_100024C14;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100024C14()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_100029430();
  uint64_t v7 = sub_100029750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_100029780();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100024400();
  sub_10002427C();
  sub_1000293C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_1000293E0();
  sub_100029400();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100024E68()
{
  uint64_t v0 = sub_100008550(&qword_10003D290);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003C238 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100029600();
  swift_release();
  sub_10002427C();
  sub_10000C5A8(&qword_10003D298, &qword_10003D290);
  sub_1000295F0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100024FD0()
{
  if (qword_10003C238 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100025030()
{
  unint64_t result = qword_10003D1D0;
  if (!qword_10003D1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D1D0);
  }
  return result;
}

unint64_t sub_100025088()
{
  unint64_t result = qword_10003D1D8;
  if (!qword_10003D1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D1D8);
  }
  return result;
}

uint64_t sub_1000250DC()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100025110(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100025128(a1, a2, a3, (void (*)(void))sub_100024400);
}

uint64_t sub_100025128(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002517C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C228, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D7D8, a1);
}

uint64_t sub_1000251B4@<X0>(uint64_t a1@<X8>)
{
  if (qword_10003C230 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008550(&qword_10003C610);
  uint64_t v3 = sub_100008690(v2, (uint64_t)qword_10003D7F0);

  return sub_100010434(v3, a1);
}

uint64_t sub_100025230(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100010548;
  return sub_1000245D4(a1, v5, v4);
}

uint64_t sub_1000252DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100025D70();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100025304()
{
  return 0xD000000000000027;
}

unint64_t sub_100025324()
{
  unint64_t result = qword_10003D1E8;
  if (!qword_10003D1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D1E8);
  }
  return result;
}

unint64_t sub_10002537C()
{
  unint64_t result = qword_10003D1F0;
  if (!qword_10003D1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D1F0);
  }
  return result;
}

uint64_t sub_1000253D0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000253F0, 0, 0);
}

uint64_t sub_1000253F0()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  unsigned char *v1 = sub_10001C958(1, 0xD000000000000013, 0x8000000100031150, 0) & 1;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10002547C(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_1000254A0, 0, 0);
}

uint64_t sub_1000254A0()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)CKSharedSettingsHelper) init];
  [v2 setReadReceiptsEnabled:v1];

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

unint64_t sub_100025534()
{
  unint64_t result = qword_10003D1F8;
  if (!qword_10003D1F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D1F8);
  }
  return result;
}

unint64_t sub_10002558C()
{
  unint64_t result = qword_10003D200;
  if (!qword_10003D200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D200);
  }
  return result;
}

uint64_t sub_1000255E0(uint64_t a1)
{
  unint64_t v2 = sub_100024068();

  return _EntityURLRepresentation.init(stringLiteral:)(0xD000000000000055, 0x800000010002F650, a1, v2);
}

unint64_t sub_100025640()
{
  unint64_t result = qword_10003D208;
  if (!qword_10003D208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D208);
  }
  return result;
}

unint64_t sub_100025698()
{
  unint64_t result = qword_10003D210;
  if (!qword_10003D210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D210);
  }
  return result;
}

unint64_t sub_1000256F0()
{
  unint64_t result = qword_10003D218;
  if (!qword_10003D218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D218);
  }
  return result;
}

uint64_t sub_100025744@<X0>(uint64_t *a1@<X8>)
{
  sub_10000C7D4();
  uint64_t result = sub_100029410();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100025784()
{
  sub_100025A38();
  uint64_t v2 = sub_1000296D0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000872C(v3, v0, v2, v1);
}

uint64_t sub_100025818@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C220, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10003D7C0, a1);
}

uint64_t sub_100025850()
{
  return sub_10000C5A8(&qword_10003D228, &qword_10003D230);
}

uint64_t sub_10002588C(uint64_t a1)
{
  unint64_t v2 = sub_100024068();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000258DC()
{
  unint64_t result = qword_10003D238;
  if (!qword_10003D238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D238);
  }
  return result;
}

uint64_t sub_100025934(uint64_t a1)
{
  unint64_t v2 = sub_1000256F0();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SendReadReceiptsEntity.UpdateIntent_value()
{
  return &type metadata for SendReadReceiptsEntity.UpdateIntent_value;
}

ValueMetadata *type metadata accessor for SendReadReceiptsEntity.SendReadReceiptsEntityQuery()
{
  return &type metadata for SendReadReceiptsEntity.SendReadReceiptsEntityQuery;
}

ValueMetadata *type metadata accessor for SendReadReceiptsEntity()
{
  return &type metadata for SendReadReceiptsEntity;
}

ValueMetadata *type metadata accessor for OpenSendReadReceiptsEntity()
{
  return &type metadata for OpenSendReadReceiptsEntity;
}

uint64_t sub_1000259C0()
{
  return sub_10000C5A8(&qword_10003D240, &qword_10003D248);
}

uint64_t sub_1000259FC()
{
  return sub_10000C5A8(&qword_10003D250, &qword_10003D248);
}

unint64_t sub_100025A38()
{
  unint64_t result = qword_10003D258;
  if (!qword_10003D258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D258);
  }
  return result;
}

uint64_t sub_100025A8C()
{
  v17[0] = sub_1000296C0();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  unint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008550(&qword_10003C328);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000297E0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100008550(&qword_10003D260);
  sub_1000297C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v17[1] = 0;
  uint64_t v14 = sub_1000293F0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_100024068();
  return sub_100029460();
}

uint64_t sub_100025D70()
{
  uint64_t v0 = sub_100008550(&qword_10003C5B0);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1000296C0();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100008550(&qword_10003C328);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_1000297E0();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100008550(&qword_10003D260);
  sub_1000297C0();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_1000293F0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_100024068();
  uint64_t v19 = v23;
  uint64_t v24 = sub_100029460();
  sub_100008550(&qword_10003C5C0);
  sub_1000297C0();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100029910();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_100029470();
  return v24;
}

uint64_t sub_1000261B0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

unint64_t sub_1000261BC()
{
  unint64_t result = qword_10003D2B0;
  if (!qword_10003D2B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D2B0);
  }
  return result;
}

unint64_t sub_100026210()
{
  unint64_t result = qword_10003D2B8;
  if (!qword_10003D2B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D2B8);
  }
  return result;
}

unint64_t sub_100026268()
{
  unint64_t result = qword_10003D2C0;
  if (!qword_10003D2C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D2C0);
  }
  return result;
}

unint64_t sub_1000262C0()
{
  unint64_t result = qword_10003D2C8;
  if (!qword_10003D2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D2C8);
  }
  return result;
}

uint64_t sub_100026314()
{
  uint64_t v0 = sub_1000297D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100029810();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_1000298E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_1000297E0();
  sub_1000086C8(v6, qword_10003D810);
  sub_100008690(v6, (uint64_t)qword_10003D810);
  sub_1000298D0();
  sub_100029800();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_1000297F0();
}

unint64_t sub_1000264F8()
{
  unint64_t result = qword_10003D2D0;
  if (!qword_10003D2D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D2D0);
  }
  return result;
}

uint64_t sub_10002654C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100029248();
  unint64_t v5 = sub_100028AC4();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_1000265B8()
{
  unint64_t result = qword_10003D2D8;
  if (!qword_10003D2D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D2D8);
  }
  return result;
}

unint64_t sub_100026610()
{
  unint64_t result = qword_10003D2E0;
  if (!qword_10003D2E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D2E0);
  }
  return result;
}

uint64_t sub_100026664(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000281A8(a1, a2, a3, (void (*)(void))sub_1000264F8);
}

uint64_t sub_10002667C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C240, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D810, a1);
}

uint64_t sub_1000266B4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100029248();
  unint64_t v7 = sub_10002929C();
  unint64_t v8 = sub_100028AC4();
  void *v5 = v2;
  v5[1] = sub_100005D84;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100026788@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100028B18();
  *a1 = result;
  return result;
}

uint64_t sub_1000267B0(uint64_t a1)
{
  unint64_t v2 = sub_1000264F8();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_1000267F0()
{
  unint64_t result = qword_10003D2F0;
  if (!qword_10003D2F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D2F0);
  }
  return result;
}

uint64_t sub_100026848()
{
  uint64_t v0 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1000297D0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100029810();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_1000298E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_1000297E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_100029770();
  sub_1000086C8(v10, qword_10003D828);
  sub_100008690(v10, (uint64_t)qword_10003D828);
  sub_1000298D0();
  sub_100029800();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_1000297F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_100029760();
}

uint64_t sub_100026B20()
{
  uint64_t v0 = sub_100008550(&qword_10003C358);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000297E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_1000297C0();
  sub_1000297C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  if (qword_10003C1C0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100029620();
  uint64_t v9 = sub_100008690(v8, (uint64_t)qword_10003D6C0);
  uint64_t v10 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v2, v9, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v2, 0, 1, v8);
  return sub_100029640();
}

uint64_t sub_100026D8C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_1000297E0();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100026E1C, 0, 0);
}

uint64_t sub_100026E1C()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100008550(&qword_10003D378);
  sub_1000297C0();
  sub_10000C5A8(&qword_10003D430, &qword_10003D438);
  uint64_t *v1 = sub_1000297A0();
  swift_task_dealloc();
  unint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_100026F30()
{
  unint64_t result = qword_10003D300;
  if (!qword_10003D300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D300);
  }
  return result;
}

uint64_t sub_100026F84(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000285C0();
  *uint64_t v4 = v2;
  v4[1] = sub_10000DA40;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100027038()
{
  unint64_t result = qword_10003D310;
  if (!qword_10003D310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D310);
  }
  return result;
}

unint64_t sub_100027090()
{
  unint64_t result = qword_10003D318;
  if (!qword_10003D318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D318);
  }
  return result;
}

unint64_t sub_1000270E8()
{
  unint64_t result = qword_10003D320[0];
  if (!qword_10003D320[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10003D320);
  }
  return result;
}

uint64_t sub_10002713C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000285C0();
  void *v5 = v2;
  v5[1] = sub_10000DD10;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000271F0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000285C0();
  *uint64_t v4 = v2;
  v4[1] = sub_100010544;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_1000272A4()
{
  unint64_t result = qword_10003D338;
  if (!qword_10003D338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D338);
  }
  return result;
}

unint64_t sub_1000272FC()
{
  unint64_t result = qword_10003D340;
  if (!qword_10003D340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D340);
  }
  return result;
}

unint64_t sub_100027354()
{
  unint64_t result = qword_10003D348;
  if (!qword_10003D348)
  {
    sub_1000056D8(qword_10003D350);
    sub_1000272FC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D348);
  }
  return result;
}

uint64_t sub_1000273C8(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100026F30();
  void *v5 = v2;
  v5[1] = sub_10000E09C;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100027480()
{
  unint64_t result = qword_10003D368;
  if (!qword_10003D368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D368);
  }
  return result;
}

uint64_t sub_1000274D4()
{
  return sub_10000C5A8(&qword_10003D370, &qword_10003D378);
}

uint64_t sub_100027510()
{
  uint64_t v0 = sub_1000297E0();
  sub_1000086C8(v0, qword_10003D840);
  sub_100008690(v0, (uint64_t)qword_10003D840);
  return sub_1000297C0();
}

uint64_t sub_100027574()
{
  uint64_t v0 = sub_100008550(&qword_10003C610);
  sub_1000086C8(v0, qword_10003D858);
  uint64_t v1 = sub_100008690(v0, (uint64_t)qword_10003D858);
  sub_1000295A0();
  uint64_t v2 = sub_1000295B0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10002762C()
{
  uint64_t result = swift_getKeyPath();
  qword_10003D870 = result;
  return result;
}

uint64_t sub_100027654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100008550(&qword_10003C5D0);
  v3[9] = swift_task_alloc();
  sub_100008550(&qword_10003C5D8);
  v3[10] = swift_task_alloc();
  sub_100008550(&qword_10003D420);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_1000293F0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100008550(&qword_10003D428);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_100027818, 0, 0);
}

uint64_t sub_100027818()
{
  sub_100029430();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_1000270E8();
  void *v1 = v0;
  v1[1] = sub_1000278EC;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100027EE4, 0, &type metadata for ShowContactPhotosEntity, v2);
}

uint64_t sub_1000278EC()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000279E8, 0, 0);
}

uint64_t sub_1000279E8()
{
  sub_100029430();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_100029430();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_10003C260 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10003D870;
  *(void *)(v0 + 168) = qword_10003D870;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_10000C5A8(&qword_10003D430, &qword_10003D438);
  *uint64_t v3 = v0;
  v3[1] = sub_100027B40;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_100027B40()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10000ECB0;
  }
  else {
    uint64_t v2 = sub_100027C94;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100027C94()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_100029430();
  uint64_t v7 = sub_100029750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_100029780();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100027480();
  sub_1000272FC();
  sub_1000293C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_1000293E0();
  sub_100029400();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100027EE8()
{
  uint64_t v0 = sub_100008550(&qword_10003D440);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003C260 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100029600();
  swift_release();
  sub_1000272FC();
  sub_10000C5A8(&qword_10003D448, &qword_10003D440);
  sub_1000295F0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100028050()
{
  if (qword_10003C260 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_1000280B0()
{
  unint64_t result = qword_10003D380;
  if (!qword_10003D380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D380);
  }
  return result;
}

unint64_t sub_100028108()
{
  unint64_t result = qword_10003D388;
  if (!qword_10003D388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D388);
  }
  return result;
}

uint64_t sub_10002815C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100028190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000281A8(a1, a2, a3, (void (*)(void))sub_100027480);
}

uint64_t sub_1000281A8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000281FC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C250, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D840, a1);
}

uint64_t sub_100028234@<X0>(uint64_t a1@<X8>)
{
  if (qword_10003C258 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008550(&qword_10003C610);
  uint64_t v3 = sub_100008690(v2, (uint64_t)qword_10003D858);

  return sub_100010434(v3, a1);
}

uint64_t sub_1000282B0(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100010548;
  return sub_100027654(a1, v5, v4);
}

uint64_t sub_10002835C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100028DFC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100028384()
{
  return 0xD000000000000028;
}

unint64_t sub_1000283A4()
{
  unint64_t result = qword_10003D398;
  if (!qword_10003D398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D398);
  }
  return result;
}

unint64_t sub_1000283FC()
{
  unint64_t result = qword_10003D3A0;
  if (!qword_10003D3A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D3A0);
  }
  return result;
}

uint64_t sub_100028450(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100028470, 0, 0);
}

uint64_t sub_100028470()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  unsigned char *v1 = sub_10001C958(0, 0xD000000000000011, 0x8000000100031300, 1) & 1;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000284FC(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100028520, 0, 0);
}

uint64_t sub_100028520()
{
  sub_10001CAD8(0, 0xD000000000000011, 0x8000000100031300, *(unsigned char *)(v0 + 16), 0xD00000000000002DLL, 0x8000000100031320);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_1000285C0()
{
  unint64_t result = qword_10003D3A8;
  if (!qword_10003D3A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D3A8);
  }
  return result;
}

unint64_t sub_100028618()
{
  unint64_t result = qword_10003D3B0;
  if (!qword_10003D3B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D3B0);
  }
  return result;
}

uint64_t sub_10002866C(uint64_t a1)
{
  unint64_t v2 = sub_1000270E8();

  return _EntityURLRepresentation.init(stringLiteral:)(0xD000000000000056, 0x800000010002F5F0, a1, v2);
}

unint64_t sub_1000286CC()
{
  unint64_t result = qword_10003D3B8;
  if (!qword_10003D3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D3B8);
  }
  return result;
}

unint64_t sub_100028724()
{
  unint64_t result = qword_10003D3C0;
  if (!qword_10003D3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D3C0);
  }
  return result;
}

unint64_t sub_10002877C()
{
  unint64_t result = qword_10003D3C8;
  if (!qword_10003D3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D3C8);
  }
  return result;
}

uint64_t sub_1000287D0@<X0>(uint64_t *a1@<X8>)
{
  sub_10000C77C();
  uint64_t result = sub_100029410();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100028810()
{
  sub_100028AC4();
  uint64_t v2 = sub_1000296D0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000872C(v3, v0, v2, v1);
}

uint64_t sub_1000288A4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F87C(&qword_10003C248, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10003D828, a1);
}

uint64_t sub_1000288DC()
{
  return sub_10000C5A8(&qword_10003D3D8, &qword_10003D3E0);
}

uint64_t sub_100028918(uint64_t a1)
{
  unint64_t v2 = sub_1000270E8();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100028968()
{
  unint64_t result = qword_10003D3E8;
  if (!qword_10003D3E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D3E8);
  }
  return result;
}

uint64_t sub_1000289C0(uint64_t a1)
{
  unint64_t v2 = sub_10002877C();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for ShowContactPhotosEntity.UpdateIntent_value()
{
  return &type metadata for ShowContactPhotosEntity.UpdateIntent_value;
}

ValueMetadata *type metadata accessor for ShowContactPhotosEntity.ShowContactPhotosEntityQuery()
{
  return &type metadata for ShowContactPhotosEntity.ShowContactPhotosEntityQuery;
}

ValueMetadata *type metadata accessor for ShowContactPhotosEntity()
{
  return &type metadata for ShowContactPhotosEntity;
}

ValueMetadata *type metadata accessor for OpenShowContactPhotosEntity()
{
  return &type metadata for OpenShowContactPhotosEntity;
}

uint64_t sub_100028A4C()
{
  return sub_10000C5A8(&qword_10003D3F0, &qword_10003D3F8);
}

uint64_t sub_100028A88()
{
  return sub_10000C5A8(&qword_10003D400, &qword_10003D3F8);
}

unint64_t sub_100028AC4()
{
  unint64_t result = qword_10003D408;
  if (!qword_10003D408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D408);
  }
  return result;
}

uint64_t sub_100028B18()
{
  v17[0] = sub_1000296C0();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  unint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008550(&qword_10003C328);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000297E0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100008550(&qword_10003D410);
  sub_1000297C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v17[1] = 0;
  uint64_t v14 = sub_1000293F0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_1000270E8();
  return sub_100029460();
}

uint64_t sub_100028DFC()
{
  uint64_t v0 = sub_100008550(&qword_10003C5B0);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1000296C0();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100008550(&qword_10003C328);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100008550(&qword_10003C330);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_1000297E0();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100008550(&qword_10003D410);
  sub_1000297C0();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_1000293F0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_1000270E8();
  uint64_t v19 = v23;
  uint64_t v24 = sub_100029460();
  sub_100008550(&qword_10003C5C0);
  sub_1000297C0();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100029910();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_100029470();
  return v24;
}

uint64_t sub_10002923C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

unint64_t sub_100029248()
{
  unint64_t result = qword_10003D460;
  if (!qword_10003D460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D460);
  }
  return result;
}

unint64_t sub_10002929C()
{
  unint64_t result = qword_10003D468;
  if (!qword_10003D468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D468);
  }
  return result;
}

uint64_t sub_1000292F0()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100029300()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100029310()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100029350()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100029360()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100029370()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_100029380()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100029390()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000293C0()
{
  return IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)();
}

uint64_t sub_1000293E0()
{
  return IntentDialog.init<A, B>(from:capturedContent:)();
}

uint64_t sub_1000293F0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100029400()
{
  return static IntentResult.result<A>(value:dialog:)();
}

uint64_t sub_100029410()
{
  return _UniqueEntity.id.getter();
}

uint64_t sub_100029420()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100029430()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100029440()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100029450()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100029460()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100029470()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_100029480()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
}

uint64_t sub_100029490()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)();
}

uint64_t sub_1000294A0()
{
  return _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)();
}

uint64_t sub_1000294B0()
{
  return type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases();
}

uint64_t sub_1000294C0()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_1000294D0()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_1000294E0()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_1000294F0()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_100029500()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_100029510()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_100029520()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_100029530()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_100029540()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_100029550()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t sub_100029560()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_100029570()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_100029580()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_100029590()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_1000295A0()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_1000295B0()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_1000295F0()
{
  return static _DialogBuilderEntity.buildBlock<A>(_:)();
}

uint64_t sub_100029600()
{
  return static _DialogBuilderEntity.buildExpression<A, B>(_:)();
}

uint64_t sub_100029610()
{
  return DisplayRepresentation.Image.init(appBundleIdentifier:)();
}

uint64_t sub_100029620()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100029630()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100029640()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:)();
}

uint64_t sub_100029650()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100029660()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_100029670()
{
  return _URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100029690()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_1000296A0()
{
  return _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_1000296B0()
{
  return _EnumURLRepresentation.init(_:)();
}

uint64_t sub_1000296C0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_1000296D0()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_100029730()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100029750()
{
  return type metadata accessor for _GeneratedContentOptions();
}

uint64_t sub_100029760()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100029770()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100029780()
{
  return type metadata accessor for _GeneratedContentFallback();
}

uint64_t sub_1000297A0()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_1000297B0(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_1000297C0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_1000297D0()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_1000297E0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_1000297F0()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100029800()
{
  return static Locale.current.getter();
}

uint64_t sub_100029810()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100029830()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100029840()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100029850()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_100029860()
{
  return WidgetConfiguration.hiddenControl()();
}

uint64_t sub_100029870()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_100029880()
{
  return WidgetConfiguration.disablesControlStateCaching()();
}

uint64_t sub_100029890()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_1000298A0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_1000298C0()
{
  return ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)();
}

uint64_t sub_1000298D0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_1000298E0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_1000298F0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100029900()
{
  return String.hash(into:)();
}

uint64_t sub_100029910()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_100029920()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100029930()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100029940()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100029950()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_100029960()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100029970()
{
  return Hasher._finalize()();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}