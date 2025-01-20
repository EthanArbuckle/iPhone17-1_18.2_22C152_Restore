uint64_t sub_100004314()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  sub_100006708(&qword_10000C0E8);
  __chkstk_darwin();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_100006CD0();
  v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v4 = sub_100006CB0();
  sub_100006880(v4, qword_10000C168);
  sub_100006848(v4, (uint64_t)qword_10000C168);
  sub_100006CC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  return sub_100006CA0();
}

unint64_t sub_100004480()
{
  sub_100006708(&qword_10000C110);
  ((void (*)(void))__chkstk_darwin)();
  v1 = (char *)v16 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006708(&qword_10000C0E8);
  ((void (*)(void))__chkstk_darwin)();
  v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006CD0();
  uint64_t v17 = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  __chkstk_darwin(v6);
  sub_100006708(&qword_10000C118);
  v7 = (int *)(sub_100006708(&qword_10000C120) - 8);
  uint64_t v8 = *(void *)v7;
  uint64_t v19 = *(void *)(*(void *)v7 + 72);
  unint64_t v9 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = swift_allocObject();
  uint64_t v20 = v10;
  *(_OWORD *)(v10 + 16) = xmmword_100006E70;
  unint64_t v11 = v10 + v9;
  v16[0] = v10 + v9 + v7[14];
  *(unsigned char *)(v10 + v9) = 0;
  sub_100006CC0();
  v12 = *(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56);
  v16[1] = v5 + 56;
  v18 = v12;
  v12(v3, 1, 1, v4);
  sub_100006BF0();
  uint64_t v13 = sub_100006C00();
  v14 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v1, 0, 1, v13);
  sub_100006CC0();
  sub_100006C10();
  *(unsigned char *)(v11 + v19) = 1;
  sub_100006CC0();
  sub_100006CC0();
  v18(v3, 0, 1, v17);
  sub_100006BF0();
  v14(v1, 0, 1, v13);
  sub_100006CC0();
  sub_100006C10();
  unint64_t result = sub_100004890(v20);
  qword_10000C180 = result;
  return result;
}

unint64_t sub_100004890(uint64_t a1)
{
  uint64_t v2 = sub_100006708(&qword_10000C120);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006708(&qword_10000C128);
  uint64_t v6 = sub_100006D00();
  v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  unint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_1000068F8(v12, (uint64_t)v5, &qword_10000C120);
    char v14 = *v5;
    unint64_t result = sub_100006220(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100006C20();
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

unint64_t sub_100004A88(uint64_t a1)
{
  uint64_t v2 = sub_100006708(&qword_10000C140);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006708(&qword_10000C148);
  uint64_t v6 = sub_100006D00();
  v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  unint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_1000068F8(v12, (uint64_t)v5, &qword_10000C140);
    char v14 = *v5;
    unint64_t result = sub_100006220(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100006708(&qword_10000C150);
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

uint64_t sub_100004C88()
{
  uint64_t v0 = sub_100006708(&qword_10000C130);
  sub_100006880(v0, qword_10000C188);
  sub_100006848(v0, (uint64_t)qword_10000C188);
  sub_100006708(&qword_10000C138);
  uint64_t v1 = *(void *)(sub_100006708(&qword_10000C140) - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100006E70;
  *(unsigned char *)(v4 + v3) = 0;
  sub_100005268();
  sub_100006C30();
  *(unsigned char *)(v4 + v3 + v2) = 1;
  sub_100006C30();
  sub_100004A88(v4);
  return sub_100006C40();
}

uint64_t sub_100004E1C(char *a1, char *a2)
{
  return sub_100004E80(*a1, *a2);
}

unint64_t sub_100004E2C()
{
  unint64_t result = qword_10000C030;
  if (!qword_10000C030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }
  return result;
}

uint64_t sub_100004E80(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x615777654E646461;
  }
  else {
    uint64_t v3 = 1953460082;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xEF72657061706C6CLL;
  }
  if (a2) {
    uint64_t v5 = 0x615777654E646461;
  }
  else {
    uint64_t v5 = 1953460082;
  }
  if (a2) {
    unint64_t v6 = 0xEF72657061706C6CLL;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_100006D20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int sub_100004F2C()
{
  return sub_100006D40();
}

uint64_t sub_100004FB4()
{
  sub_100006CF0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100005028()
{
  return sub_100006D40();
}

uint64_t sub_1000050AC@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100008620;
  v8._object = v3;
  Swift::Int v5 = sub_100006D10(v4, v8);
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

void sub_10000510C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 1953460082;
  if (*v1) {
    uint64_t v2 = 0x615777654E646461;
  }
  unint64_t v3 = 0xE400000000000000;
  if (*v1) {
    unint64_t v3 = 0xEF72657061706C6CLL;
  }
  *a1 = v2;
  a1[1] = v3;
}

unint64_t sub_100005154()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

unint64_t sub_1000051AC()
{
  unint64_t result = qword_10000C040;
  if (!qword_10000C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

unint64_t sub_100005204()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

void *sub_100005258()
{
  return &protocol witness table for String;
}

unint64_t sub_100005268()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

unint64_t sub_1000052C0()
{
  unint64_t result = qword_10000C058;
  if (!qword_10000C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

uint64_t sub_100005314@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C010 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006708(&qword_10000C130);
  uint64_t v3 = sub_100006848(v2, (uint64_t)qword_10000C188);
  Swift::OpaquePointer v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_1000053C4()
{
  unint64_t result = qword_10000C060;
  if (!qword_10000C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

unint64_t sub_10000541C()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

unint64_t sub_100005474()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

unint64_t sub_1000054CC()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

uint64_t sub_100005520()
{
  sub_1000067F4();
  uint64_t v2 = sub_100006BE0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_1000068E4(v3, v0, v2, v1);
}

uint64_t sub_1000055B8@<X0>(uint64_t a1@<X8>)
{
  return sub_100005D5C(&qword_10000C000, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000C168, a1);
}

uint64_t sub_1000055F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005CDC(a1, a2, a3, (void (*)(void))sub_100005268);
}

uint64_t sub_10000561C(uint64_t a1)
{
  unint64_t v2 = sub_100005268();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000566C()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

unint64_t sub_1000056C4()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

unint64_t sub_10000571C()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

uint64_t sub_100005770()
{
  if (qword_10000C008 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000057CC(uint64_t a1)
{
  unint64_t v2 = sub_1000054CC();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000581C()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    sub_100005878(&qword_10000C0A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

uint64_t sub_100005878(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_1000058C0(void *a1@<X8>)
{
  *a1 = &off_100008670;
}

unint64_t sub_1000058D4()
{
  unint64_t result = qword_10000C0B0;
  if (!qword_10000C0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B0);
  }
  return result;
}

uint64_t sub_100005928()
{
  uint64_t v0 = sub_100006CD0();
  sub_100006880(v0, qword_10000C1A0);
  sub_100006848(v0, (uint64_t)qword_10000C1A0);
  return sub_100006CC0();
}

uint64_t sub_10000598C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006BB0();
  *a1 = v3;
  return result;
}

uint64_t sub_1000059C8()
{
  return sub_100006BC0();
}

void (*sub_100005A00(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100006BA0();
  return sub_100005A5C;
}

void sub_100005A5C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100005AAC()
{
  unint64_t result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }
  return result;
}

uint64_t sub_100005B00(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10000674C();
  unint64_t v5 = sub_1000067F4();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100005B6C()
{
  uint64_t v0 = qword_10000C020;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100005BAC()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

unint64_t sub_100005C04()
{
  unint64_t result = qword_10000C0C8;
  if (!qword_10000C0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C8);
  }
  return result;
}

unint64_t sub_100005C5C()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

uint64_t sub_100005CB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005CDC(a1, a2, a3, (void (*)(void))sub_100005AAC);
}

uint64_t sub_100005CDC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005D24@<X0>(uint64_t a1@<X8>)
{
  return sub_100005D5C(&qword_10000C018, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000C1A0, a1);
}

uint64_t sub_100005D5C@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100006848(v7, a3);
  unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100005E00()
{
  return 0;
}

uint64_t sub_100005E0C()
{
  return 1;
}

uint64_t sub_100005E1C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10000674C();
  unint64_t v6 = sub_1000067A0();
  unint64_t v7 = sub_1000067F4();
  *unint64_t v4 = v2;
  v4[1] = sub_100005EE8;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100005EE8()
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

uint64_t sub_100005FF0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006418();
  *a1 = result;
  return result;
}

uint64_t sub_100006018(uint64_t a1)
{
  unint64_t v2 = sub_100005AAC();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenWallpaperSettingsDeepLink()
{
  return &type metadata for OpenWallpaperSettingsDeepLink;
}

unsigned char *initializeBufferWithCopyOfBuffer for WallpaperSettingsDeepLink(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WallpaperSettingsDeepLink(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for WallpaperSettingsDeepLink(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000061D0);
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

uint64_t sub_1000061F8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100006204(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for WallpaperSettingsDeepLink()
{
  return &type metadata for WallpaperSettingsDeepLink;
}

unint64_t sub_100006220(char a1)
{
  sub_100006D30();
  sub_100006CF0();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_100006D40();

  return sub_1000062CC(a1 & 1, v2);
}

unint64_t sub_1000062CC(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    if (a1) {
      uint64_t v6 = 0x615777654E646461;
    }
    else {
      uint64_t v6 = 1953460082;
    }
    if (a1) {
      unint64_t v7 = 0xEF72657061706C6CLL;
    }
    else {
      unint64_t v7 = 0xE400000000000000;
    }
    while (1)
    {
      uint64_t v8 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0x615777654E646461 : 1953460082;
      unint64_t v9 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0xEF72657061706C6CLL : 0xE400000000000000;
      if (v8 == v6 && v9 == v7) {
        break;
      }
      char v11 = sub_100006D20();
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

uint64_t sub_100006418()
{
  uint64_t v17 = sub_100006C70();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006708(&qword_10000C0E0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_100006708(&qword_10000C0E8);
  __chkstk_darwin(v9 - 8);
  char v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006CD0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100006708(&qword_10000C0F0);
  sub_100006CC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 2;
  uint64_t v14 = sub_100006B90();
  v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_100005268();
  return sub_100006BD0();
}

uint64_t sub_100006708(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000674C()
{
  unint64_t result = qword_10000C0F8;
  if (!qword_10000C0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0F8);
  }
  return result;
}

unint64_t sub_1000067A0()
{
  unint64_t result = qword_10000C100;
  if (!qword_10000C100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C100);
  }
  return result;
}

unint64_t sub_1000067F4()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

uint64_t sub_100006848(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100006880(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000068E4(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_1000068F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006708(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000695C(uint64_t a1)
{
  unint64_t v2 = sub_100006AAC();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100006A04()
{
  unint64_t result = qword_10000C158;
  if (!qword_10000C158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C158);
  }
  return result;
}

uint64_t sub_100006A5C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100006AAC()
{
  unint64_t result = qword_10000C160;
  if (!qword_10000C160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C160);
  }
  return result;
}

ValueMetadata *type metadata accessor for WallpaperSettingsIntentsExtension()
{
  return &type metadata for WallpaperSettingsIntentsExtension;
}

uint64_t sub_100006B10()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100006B20()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100006B40()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100006B50()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100006B60()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100006B90()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100006BA0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100006BB0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006BC0()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100006BD0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100006BE0()
{
  return URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100006BF0()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100006C00()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100006C10()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100006C20()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100006C30()
{
  return EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_100006C40()
{
  return EnumURLRepresentation.init(_:)();
}

uint64_t sub_100006C70()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100006C90()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100006CA0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100006CB0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100006CC0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100006CD0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006CE0()
{
  return static AppExtension.main()();
}

uint64_t sub_100006CF0()
{
  return String.hash(into:)();
}

uint64_t sub_100006D00()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100006D10(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006D20()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006D30()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006D40()
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
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