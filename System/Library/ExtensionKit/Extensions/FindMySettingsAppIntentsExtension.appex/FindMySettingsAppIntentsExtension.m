uint64_t sub_100002D9C(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_100002EF0();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100002E48()
{
  unint64_t result = qword_10000C018;
  if (!qword_10000C018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }
  return result;
}

uint64_t sub_100002EA0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100002EF0()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

ValueMetadata *type metadata accessor for FindMySettingsAppIntentsExtensionExtension()
{
  return &type metadata for FindMySettingsAppIntentsExtensionExtension;
}

uint64_t sub_100002F54()
{
  uint64_t v0 = sub_100005B48(&qword_10000C140);
  sub_100005CC0(v0, qword_10000CDA8);
  sub_100005C88(v0, (uint64_t)qword_10000CDA8);
  sub_100005B48(&qword_10000C148);
  uint64_t v1 = *(void *)(sub_100005B48(&qword_10000C150) - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000074D0;
  *(unsigned char *)(v4 + v3) = 0;
  sub_100003AF8();
  sub_100006AA0();
  *(unsigned char *)(v4 + v3 + v2) = 1;
  sub_100006AA0();
  sub_1000030E8(v4);
  return sub_100006AB0();
}

unint64_t sub_1000030E8(uint64_t a1)
{
  uint64_t v2 = sub_100005B48(&qword_10000C150);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005B48(&qword_10000C158);
  uint64_t v6 = sub_100006BD0();
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
    sub_100005D38(v12, (uint64_t)v5, &qword_10000C150);
    char v14 = *v5;
    unint64_t result = sub_100004D30(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100005B48(&qword_10000C160);
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

unint64_t sub_1000032E8(uint64_t a1)
{
  uint64_t v2 = sub_100005B48(&qword_10000C128);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005B48(&qword_10000C138);
  uint64_t v6 = sub_100006BD0();
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
    sub_100005D38(v12, (uint64_t)v5, &qword_10000C128);
    char v14 = *v5;
    unint64_t result = sub_100004D30(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100006A80();
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

uint64_t sub_1000034E0()
{
  sub_100005B48(&qword_10000C0F0);
  __chkstk_darwin();
  uint64_t v1 = (char *)v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[0] = sub_100006B40();
  uint64_t v2 = *(void *)(v9[0] - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006B80();
  __chkstk_darwin();
  sub_100006BB0();
  __chkstk_darwin();
  uint64_t v5 = sub_100006B50();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v7 = sub_100006B20();
  sub_100005CC0(v7, qword_10000CDC0);
  sub_100005C88(v7, (uint64_t)qword_10000CDC0);
  sub_100006BA0();
  sub_100006B70();
  (*(void (**)(char *, void, void))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.main(_:), v9[0]);
  sub_100006B60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v1, 1, 1, v5);
  return sub_100006B10();
}

uint64_t sub_1000037C0(char *a1, char *a2)
{
  return sub_100003824(*a1, *a2);
}

unint64_t sub_1000037D0()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

uint64_t sub_100003824(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x4C794D6572616873;
  }
  else {
    uint64_t v3 = 1953460082;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xEF6E6F697461636FLL;
  }
  if (a2) {
    uint64_t v5 = 0x4C794D6572616873;
  }
  else {
    uint64_t v5 = 1953460082;
  }
  if (a2) {
    unint64_t v6 = 0xEF6E6F697461636FLL;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_100006BF0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int sub_1000038D0()
{
  return sub_100006C10();
}

uint64_t sub_100003958()
{
  sub_100006BC0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000039CC()
{
  return sub_100006C10();
}

uint64_t sub_100003A50@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100008790;
  v8._object = v3;
  Swift::Int v5 = sub_100006BE0(v4, v8);
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

void sub_100003AB0(uint64_t *a1@<X8>)
{
  uint64_t v2 = 1953460082;
  if (*v1) {
    uint64_t v2 = 0x4C794D6572616873;
  }
  unint64_t v3 = 0xE400000000000000;
  if (*v1) {
    unint64_t v3 = 0xEF6E6F697461636FLL;
  }
  *a1 = v2;
  a1[1] = v3;
}

unint64_t sub_100003AF8()
{
  unint64_t result = qword_10000C040;
  if (!qword_10000C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

unint64_t sub_100003B50()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

uint64_t sub_100003BA4@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C000 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005B48(&qword_10000C140);
  uint64_t v3 = sub_100005C88(v2, (uint64_t)qword_10000CDA8);
  Swift::OpaquePointer v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100003C54()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

unint64_t sub_100003CAC()
{
  unint64_t result = qword_10000C058;
  if (!qword_10000C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

unint64_t sub_100003D04()
{
  unint64_t result = qword_10000C060;
  if (!qword_10000C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

void *sub_100003D58()
{
  return &protocol witness table for String;
}

uint64_t sub_100003D64()
{
  sub_100005C34();
  uint64_t v2 = sub_100006A90();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100005D24(v3, v0, v2, v1);
}

unint64_t sub_100003DFC()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

unint64_t sub_100003E54()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

unint64_t sub_100003EAC()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

unint64_t sub_100003F04()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

uint64_t sub_100003F5C@<X0>(uint64_t a1@<X8>)
{
  return sub_100004868(&qword_10000C008, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000CDC0, a1);
}

uint64_t sub_100003F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000047E8(a1, a2, a3, (void (*)(void))sub_100003AF8);
}

uint64_t sub_100003FC0(uint64_t a1)
{
  unint64_t v2 = sub_100003AF8();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100004010()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

unint64_t sub_100004068()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

unint64_t sub_1000040C0()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

uint64_t sub_100004118(uint64_t a1)
{
  unint64_t v2 = sub_100003F04();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100004168()
{
  unint64_t result = qword_10000C0A8;
  if (!qword_10000C0A8)
  {
    sub_1000041C4(&qword_10000C0B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A8);
  }
  return result;
}

uint64_t sub_1000041C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_10000420C(void *a1@<X8>)
{
  *a1 = &off_1000087E0;
}

unint64_t sub_100004220()
{
  unint64_t result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }
  return result;
}

uint64_t sub_100004274()
{
  uint64_t v0 = sub_100006B40();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006B80();
  __chkstk_darwin();
  sub_100006BB0();
  __chkstk_darwin();
  uint64_t v4 = sub_100006B50();
  sub_100005CC0(v4, qword_10000CDD8);
  sub_100005C88(v4, (uint64_t)qword_10000CDD8);
  sub_100006BA0();
  sub_100006B70();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_100006B60();
}

uint64_t sub_100004464()
{
  sub_1000068C0();
  return v1;
}

uint64_t sub_100004498@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000068C0();
  *a1 = v3;
  return result;
}

uint64_t sub_1000044D4()
{
  return sub_1000068D0();
}

void (*sub_10000450C(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1000068B0();
  return sub_100004568;
}

void sub_100004568(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_1000045B8()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

unint64_t sub_100004610()
{
  unint64_t result = qword_10000C0C8;
  if (!qword_10000C0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C8);
  }
  return result;
}

uint64_t sub_100004664(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100005B8C();
  unint64_t v5 = sub_100005C34();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_1000046D0()
{
  uint64_t v0 = qword_10000C028;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100004710()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

unint64_t sub_100004768()
{
  unint64_t result = qword_10000C0D8;
  if (!qword_10000C0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D8);
  }
  return result;
}

uint64_t sub_1000047BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000047E8(a1, a2, a3, (void (*)(void))sub_1000045B8);
}

uint64_t sub_1000047E8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004830@<X0>(uint64_t a1@<X8>)
{
  return sub_100004868(&qword_10000C010, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000CDD8, a1);
}

uint64_t sub_100004868@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100005C88(v7, a3);
  v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_10000490C()
{
  return 0;
}

uint64_t sub_100004918()
{
  return 1;
}

uint64_t sub_100004928(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100005B8C();
  unint64_t v7 = sub_100005BE0();
  unint64_t v8 = sub_100005C34();
  void *v5 = v2;
  v5[1] = sub_1000049FC;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_1000049FC()
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

uint64_t sub_100004B04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000056D8();
  *a1 = result;
  return result;
}

uint64_t sub_100004B2C(uint64_t a1)
{
  unint64_t v2 = sub_1000045B8();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenFindMySettingsDeepLinks()
{
  return &type metadata for OpenFindMySettingsDeepLinks;
}

unsigned char *initializeBufferWithCopyOfBuffer for FindMySettingsAppIntentsExtensionDeepLinks(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FindMySettingsAppIntentsExtensionDeepLinks(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FindMySettingsAppIntentsExtensionDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100004CE4);
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

uint64_t sub_100004D0C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100004D14(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FindMySettingsAppIntentsExtensionDeepLinks()
{
  return &type metadata for FindMySettingsAppIntentsExtensionDeepLinks;
}

unint64_t sub_100004D30(char a1)
{
  sub_100006C00();
  sub_100006BC0();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_100006C10();

  return sub_100004DDC(a1 & 1, v2);
}

unint64_t sub_100004DDC(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    if (a1) {
      uint64_t v6 = 0x4C794D6572616873;
    }
    else {
      uint64_t v6 = 1953460082;
    }
    if (a1) {
      unint64_t v7 = 0xEF6E6F697461636FLL;
    }
    else {
      unint64_t v7 = 0xE400000000000000;
    }
    while (1)
    {
      uint64_t v8 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0x4C794D6572616873 : 1953460082;
      unint64_t v9 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0xEF6E6F697461636FLL : 0xE400000000000000;
      if (v8 == v6 && v9 == v7) {
        break;
      }
      char v11 = sub_100006BF0();
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

unint64_t sub_100004F28()
{
  uint64_t v0 = sub_100005B48(&qword_10000C118);
  __chkstk_darwin(v0 - 8);
  v56 = &v33[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v2 = sub_100005B48(&qword_10000C0F0);
  __chkstk_darwin(v2 - 8);
  v52 = &v33[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_100006B40();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = &v33[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_100006B80();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_100006BB0();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = sub_100006B50();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v54 = v10;
  uint64_t v55 = v11;
  uint64_t v12 = __chkstk_darwin(v10);
  v53 = &v33[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v12);
  v37 = &v33[-v14];
  sub_100005B48(&qword_10000C120);
  uint64_t v15 = sub_100005B48(&qword_10000C128);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 72);
  uint64_t v18 = v15 - 8;
  uint64_t v47 = v15 - 8;
  uint64_t v49 = v17;
  unint64_t v19 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v20 = swift_allocObject();
  uint64_t v50 = v20;
  *(_OWORD *)(v20 + 16) = xmmword_1000074D0;
  unint64_t v48 = v20 + v19;
  unint64_t v46 = v20 + v19 + *(int *)(v18 + 56);
  *(unsigned char *)(v20 + v19) = 0;
  unint64_t v42 = 0xD000000000000010;
  sub_100006BA0();
  sub_100006B70();
  uint64_t v21 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v22 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 104);
  uint64_t v36 = v4;
  v22(v7, enum case for LocalizedStringResource.BundleDescription.main(_:), v4);
  uint64_t v35 = v5 + 104;
  unint64_t v51 = 0x8000000100006D90;
  sub_100006B60();
  unint64_t v44 = 0x8000000100006E00;
  unint64_t v45 = 0xD000000000000015;
  sub_100006BA0();
  sub_100006B70();
  unsigned int v34 = v21;
  v22(v7, v21, v4);
  v23 = v52;
  sub_100006B60();
  uint64_t v24 = v55 + 56;
  v43 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v55 + 56);
  v43(v23, 0, 1, v54);
  unint64_t v41 = 0x8000000100006E20;
  v25 = v56;
  sub_100006A50();
  uint64_t v39 = sub_100006A60();
  uint64_t v26 = *(void *)(v39 - 8);
  v38 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v26 + 56);
  uint64_t v40 = v26 + 56;
  v38(v25, 0, 1, v39);
  sub_100005B48(&qword_10000C130);
  uint64_t v55 = v24;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000074E0;
  sub_100006BA0();
  sub_100006B70();
  uint64_t v27 = v36;
  v22(v7, v21, v36);
  sub_100006B60();
  sub_100006B30();
  v28 = v52;
  sub_100006A70();
  v29 = (unsigned char *)(v48 + v49);
  v49 += v48 + *(int *)(v47 + 56);
  unsigned char *v29 = 1;
  sub_100006BA0();
  sub_100006B70();
  uint64_t v30 = v34;
  v22(v7, v34, v27);
  sub_100006B60();
  sub_100006BA0();
  sub_100006B70();
  v22(v7, v30, v27);
  sub_100006B60();
  v43(v28, 0, 1, v54);
  v31 = v56;
  sub_100006A50();
  v38(v31, 0, 1, v39);
  sub_100006B30();
  sub_100006A70();
  return sub_1000032E8(v50);
}

uint64_t sub_1000056D8()
{
  uint64_t v0 = sub_100006AC0();
  uint64_t v23 = *(void *)(v0 - 8);
  uint64_t v24 = v0;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v22 = (char *)v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B48(&qword_10000C0E8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v21 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v20 = (char *)v19 - v4;
  uint64_t v5 = sub_100005B48(&qword_10000C0F0);
  __chkstk_darwin(v5 - 8);
  unint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006B40();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006B80();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_100006BB0();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = sub_100006B50();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  v19[1] = sub_100005B48(&qword_10000C0F8);
  sub_100006BA0();
  sub_100006B70();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for LocalizedStringResource.BundleDescription.main(_:), v8);
  sub_100006B60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v7, 1, 1, v14);
  char v25 = 2;
  uint64_t v16 = sub_1000068A0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v20, 1, 1, v16);
  v17(v21, 1, 1, v16);
  (*(void (**)(char *, void, uint64_t))(v23 + 104))(v22, enum case for InputConnectionBehavior.default(_:), v24);
  sub_100003AF8();
  return sub_1000068E0();
}

uint64_t sub_100005B48(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005B8C()
{
  unint64_t result = qword_10000C100;
  if (!qword_10000C100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C100);
  }
  return result;
}

unint64_t sub_100005BE0()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

unint64_t sub_100005C34()
{
  unint64_t result = qword_10000C110;
  if (!qword_10000C110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C110);
  }
  return result;
}

uint64_t sub_100005C88(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100005CC0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100005D24(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100005D38(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005B48(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100005D9C()
{
  uint64_t v0 = sub_100005B48(&qword_10000C188);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000045B8();
  sub_1000069C0();
  uint64_t v4 = sub_100006950();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_1000069C0();
  uint64_t v6 = sub_100006950();
  v5(v3, v0);
  sub_1000069C0();
  uint64_t v7 = sub_100006950();
  v5(v3, v0);
  sub_1000069C0();
  uint64_t v8 = sub_100006950();
  v5(v3, v0);
  sub_100005B48(&qword_10000C198);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100007A30;
  *(void *)(v9 + 32) = v4;
  *(void *)(v9 + 40) = v6;
  *(void *)(v9 + 48) = v7;
  *(void *)(v9 + 56) = v8;
  uint64_t v10 = sub_100006940();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100005FF8()
{
  return sub_100006274();
}

uint64_t sub_100006010()
{
  return sub_100006408();
}

uint64_t sub_100006028()
{
  uint64_t v0 = sub_100005B48(&qword_10000C188);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005B48(&qword_10000C190);
  __chkstk_darwin(v4);
  sub_1000045B8();
  sub_1000069F0();
  v10._countAndFlagsBits = 0x206E65704FLL;
  v10._object = (void *)0xE500000000000000;
  sub_1000069E0(v10);
  swift_getKeyPath();
  sub_100003EAC();
  sub_100006930();
  swift_release();
  sub_1000069D0();
  swift_release();
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  sub_1000069E0(v11);
  sub_100006A00();
  uint64_t v5 = sub_100006950();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005B48(&qword_10000C198);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1000074E0;
  *(void *)(v6 + 32) = v5;
  uint64_t v7 = sub_100006940();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_10000625C()
{
  return sub_100006274();
}

uint64_t sub_100006274()
{
  uint64_t v0 = sub_1000069B0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100003EAC();
  sub_100006930();
  swift_release();
  sub_1000045B8();
  sub_1000069A0();
  uint64_t v4 = sub_100006990();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005B48(&qword_10000C180);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000074E0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100006980();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1000063D0()
{
  return sub_100006408();
}

uint64_t sub_1000063EC()
{
  return sub_100006408();
}

uint64_t sub_100006408()
{
  uint64_t v0 = sub_100006970();
  sub_100005B48(&qword_10000C170);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1000074E0;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_100006960();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_100006474()
{
  uint64_t v0 = sub_100006920();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000045B8();
  sub_100006910();
  uint64_t v4 = sub_100006900();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005B48(&qword_10000C168);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000074E0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_1000068F0();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for FindMyAssistantIntents()
{
  return &type metadata for FindMyAssistantIntents;
}

uint64_t sub_1000065BC()
{
  uint64_t v0 = sub_100006A30();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000056D8();
  sub_1000045B8();
  sub_100006A40();
  uint64_t v4 = sub_100006A20();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  uint64_t v11 = sub_1000056D8();
  sub_100006A40();
  uint64_t v6 = sub_100006A20();
  v5(v3, v0);
  sub_100005B48(&qword_10000C178);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1000074D0;
  *(void *)(v7 + 32) = v4;
  *(void *)(v7 + 40) = v6;
  uint64_t v8 = sub_100006A10();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_10000679C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000068C0();
  *a1 = v3;
  return result;
}

uint64_t sub_1000067D8()
{
  return sub_1000068D0();
}

uint64_t sub_100006810()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100006820()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100006830()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100006850()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100006860()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100006870()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000068A0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_1000068B0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_1000068C0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_1000068D0()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_1000068E0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_1000068F0()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
}

uint64_t sub_100006900()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)();
}

uint64_t sub_100006910()
{
  return _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)();
}

uint64_t sub_100006920()
{
  return type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases();
}

uint64_t sub_100006930()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_100006940()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100006950()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_100006960()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_100006970()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_100006980()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_100006990()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_1000069A0()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_1000069B0()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_1000069C0()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t sub_1000069D0()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_1000069E0(Swift::String a1)
{
}

uint64_t sub_1000069F0()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100006A00()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t sub_100006A10()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_100006A20()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_100006A30()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_100006A40()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_100006A50()
{
  return DisplayRepresentation.Image.init(appBundleIdentifier:)();
}

uint64_t sub_100006A60()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100006A70()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100006A80()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100006A90()
{
  return _URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100006AA0()
{
  return _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_100006AB0()
{
  return _EnumURLRepresentation.init(_:)();
}

uint64_t sub_100006AC0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100006B00()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100006B10()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100006B20()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100006B30()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100006B40()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100006B50()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006B60()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100006B70()
{
  return static Locale.current.getter();
}

uint64_t sub_100006B80()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100006B90()
{
  return static AppExtension.main()();
}

uint64_t sub_100006BA0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100006BB0()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_100006BC0()
{
  return String.hash(into:)();
}

uint64_t sub_100006BD0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100006BE0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006BF0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006C00()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006C10()
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