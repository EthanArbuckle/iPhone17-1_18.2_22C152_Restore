uint64_t sub_100004DFC(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_1000060A4();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

uint64_t sub_100004E4C()
{
  sub_100006D4C(&qword_10000C0C8);
  __chkstk_darwin();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100007140();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v4 = sub_100007120();
  sub_100006EC4(v4, qword_10000CC60);
  sub_100006E8C(v4, (uint64_t)qword_10000CC60);
  sub_100007130();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  return sub_100007110();
}

unint64_t sub_100004FB0()
{
  sub_100006D4C(&qword_10000C0F0);
  __chkstk_darwin();
  v1 = (char *)&v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006D4C(&qword_10000C0C8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100007140();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  sub_100006D4C(&qword_10000C0F8);
  sub_100006D4C(&qword_10000C100);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100007300;
  sub_100007130();
  sub_100007130();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  sub_100007060();
  uint64_t v7 = sub_100007070();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v1, 0, 1, v7);
  sub_100007080();
  unint64_t result = sub_100005258(v6);
  qword_10000CC78 = result;
  return result;
}

unint64_t sub_100005258(uint64_t a1)
{
  uint64_t v2 = *(void *)(sub_100006D4C(&qword_10000C100) - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v6 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006D4C(&qword_10000C108);
  uint64_t v5 = sub_100007170();
  uint64_t v6 = (void *)v5;
  uint64_t v7 = *(void *)(a1 + 16);
  if (!v7)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v6;
  }
  uint64_t v8 = v5 + 64;
  unint64_t v9 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v20[1] = a1;
  uint64_t v10 = a1 + v9;
  uint64_t v11 = *(void *)(v2 + 72);
  swift_retain();
  while (1)
  {
    sub_100006F3C(v10, (uint64_t)v4, &qword_10000C100);
    unint64_t result = sub_1000069F4();
    if (v13) {
      break;
    }
    unint64_t v14 = result;
    *(void *)(v8 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v15 = v6[7];
    uint64_t v16 = sub_100007090();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, v4, v16);
    uint64_t v17 = v6[2];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_11;
    }
    v6[2] = v19;
    v10 += v11;
    if (!--v7)
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

unint64_t sub_100005434(uint64_t a1)
{
  uint64_t v2 = *(void *)(sub_100006D4C(&qword_10000C120) - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v6 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006D4C(&qword_10000C128);
  uint64_t v5 = sub_100007170();
  uint64_t v6 = (void *)v5;
  uint64_t v7 = *(void *)(a1 + 16);
  if (!v7)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v6;
  }
  uint64_t v8 = v5 + 64;
  unint64_t v9 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v20[1] = a1;
  uint64_t v10 = a1 + v9;
  uint64_t v11 = *(void *)(v2 + 72);
  swift_retain();
  while (1)
  {
    sub_100006F3C(v10, (uint64_t)v4, &qword_10000C120);
    unint64_t result = sub_1000069F4();
    if (v13) {
      break;
    }
    unint64_t v14 = result;
    *(void *)(v8 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v15 = v6[7];
    uint64_t v16 = sub_100006D4C((uint64_t *)&unk_10000C130);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, v4, v16);
    uint64_t v17 = v6[2];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_11;
    }
    v6[2] = v19;
    v10 += v11;
    if (!--v7)
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

uint64_t sub_100005614()
{
  uint64_t v0 = sub_100006D4C(&qword_10000C110);
  sub_100006EC4(v0, qword_10000CC80);
  sub_100006E8C(v0, (uint64_t)qword_10000CC80);
  sub_100006D4C(&qword_10000C118);
  sub_100006D4C(&qword_10000C120);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100007300;
  sub_100006154();
  sub_1000070A0();
  sub_100005434(v1);
  return sub_1000070B0();
}

uint64_t sub_10000574C()
{
  return 1;
}

Swift::Int sub_100005754()
{
  return sub_1000071A0();
}

uint64_t sub_1000057A0()
{
  return sub_100007160();
}

Swift::Int sub_1000057B0()
{
  return sub_1000071A0();
}

uint64_t sub_1000057F8@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_1000085D0;
  v7._object = v3;
  Swift::Int v5 = sub_100007180(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_10000584C(void *a1@<X8>)
{
  *a1 = 1953460082;
  a1[1] = 0xE400000000000000;
}

uint64_t sub_100005860@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C150 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006D4C(&qword_10000C110);
  uint64_t v3 = sub_100006E8C(v2, (uint64_t)qword_10000CC80);
  Swift::OpaquePointer v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000590C()
{
  sub_100006E38();
  uint64_t v2 = sub_100007050();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006F28(v3, v0, v2, v1);
}

uint64_t sub_1000059A4@<X0>(uint64_t a1@<X8>)
{
  return sub_100005CD4(&qword_10000C140, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000CC60, a1);
}

uint64_t sub_1000059DC(uint64_t a1)
{
  unint64_t v2 = sub_100006154();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_100005A28()
{
  if (qword_10000C148 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_10000CC78;

  return _swift_bridgeObjectRetain(v0);
}

uint64_t sub_100005A84(uint64_t a1)
{
  unint64_t v2 = sub_100006420();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

void sub_100005AD0(void *a1@<X8>)
{
  *a1 = &off_100008608;
}

uint64_t sub_100005AE0()
{
  uint64_t v0 = sub_100007140();
  sub_100006EC4(v0, qword_10000CC98);
  sub_100006E8C(v0, (uint64_t)qword_10000CC98);
  return sub_100007130();
}

uint64_t sub_100005B44()
{
  return sub_100007020();
}

uint64_t sub_100005B68()
{
  return sub_100007030();
}

void (*sub_100005B8C(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100007010();
  return sub_100005BE8;
}

void sub_100005BE8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_100005C34(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100006D90();
  unint64_t v5 = sub_100006E38();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100005C9C@<X0>(uint64_t a1@<X8>)
{
  return sub_100005CD4(qword_10000C158, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000CC98, a1);
}

uint64_t sub_100005CD4@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100006E8C(v7, a3);
  unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100005D78()
{
  return 0;
}

uint64_t sub_100005D8C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100006D90();
  unint64_t v6 = sub_100006DE4();
  unint64_t v7 = sub_100006E38();
  *unint64_t v4 = v2;
  v4[1] = sub_100005E58;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100005E58()
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

uint64_t sub_100005F60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006A54();
  *a1 = result;
  return result;
}

uint64_t sub_100005F88(uint64_t a1)
{
  unint64_t v2 = sub_1000066AC();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100006020()
{
  unint64_t result = qword_10000C000;
  if (!qword_10000C000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C000);
  }
  return result;
}

uint64_t sub_100006078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006834(a1, a2, a3, (void (*)(void))sub_1000060A4);
}

unint64_t sub_1000060A4()
{
  unint64_t result = qword_10000C008;
  if (!qword_10000C008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C008);
  }
  return result;
}

unint64_t sub_1000060FC()
{
  unint64_t result = qword_10000C010;
  if (!qword_10000C010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C010);
  }
  return result;
}

unint64_t sub_100006154()
{
  unint64_t result = qword_10000C018;
  if (!qword_10000C018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }
  return result;
}

unint64_t sub_1000061AC()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

unint64_t sub_100006204()
{
  unint64_t result = qword_10000C028;
  if (!qword_10000C028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C028);
  }
  return result;
}

unint64_t sub_10000625C()
{
  unint64_t result = qword_10000C030;
  if (!qword_10000C030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }
  return result;
}

unint64_t sub_1000062B4()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

void *sub_100006308()
{
  return &protocol witness table for String;
}

unint64_t sub_100006318()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

unint64_t sub_100006370()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

unint64_t sub_1000063C8()
{
  unint64_t result = qword_10000C058;
  if (!qword_10000C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

unint64_t sub_100006420()
{
  unint64_t result = qword_10000C060;
  if (!qword_10000C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

uint64_t sub_100006474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006834(a1, a2, a3, (void (*)(void))sub_100006154);
}

unint64_t sub_1000064A4()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

unint64_t sub_1000064FC()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

unint64_t sub_100006554()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

unint64_t sub_1000065AC()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    sub_100006608(&qword_10000C088);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

uint64_t sub_100006608(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006654()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

unint64_t sub_1000066AC()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

unint64_t sub_100006704()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

unint64_t sub_10000675C()
{
  unint64_t result = qword_10000C0A8;
  if (!qword_10000C0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A8);
  }
  return result;
}

unint64_t sub_1000067B4()
{
  unint64_t result = qword_10000C0B0;
  if (!qword_10000C0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B0);
  }
  return result;
}

uint64_t sub_100006808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006834(a1, a2, a3, (void (*)(void))sub_1000066AC);
}

uint64_t sub_100006834(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for OpenFontSettingsStaticDeepLinks()
{
  return &type metadata for OpenFontSettingsStaticDeepLinks;
}

uint64_t getEnumTagSinglePayload for FontSettingsDeepLinks(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for FontSettingsDeepLinks(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100006980);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for FontSettingsDeepLinks()
{
  return &type metadata for FontSettingsDeepLinks;
}

ValueMetadata *type metadata accessor for FontSettingsAppIntentsExtension()
{
  return &type metadata for FontSettingsAppIntentsExtension;
}

uint64_t sub_1000069C8(uint64_t a1)
{
  return a1 & ~(-1 << *(unsigned char *)(v1 + 32));
}

uint64_t sub_1000069F4()
{
  sub_100007190();
  sub_100007160();
  Swift::Int v0 = sub_1000071A0();

  return sub_1000069C8(v0);
}

uint64_t sub_100006A54()
{
  uint64_t v16 = sub_1000070E0();
  uint64_t v0 = *(void *)(v16 - 8);
  ((void (*)(void))__chkstk_darwin)();
  int v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006D4C(&qword_10000C0C0);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unint64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = sub_100006D4C(&qword_10000C0C8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100007140();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_100006D4C(&qword_10000C0D0);
  sub_100007130();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  char v17 = 1;
  uint64_t v13 = sub_100007000();
  unint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v16);
  sub_100006154();
  return sub_100007040();
}

uint64_t sub_100006D4C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006D90()
{
  unint64_t result = qword_10000C0D8;
  if (!qword_10000C0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D8);
  }
  return result;
}

unint64_t sub_100006DE4()
{
  unint64_t result = qword_10000C0E0;
  if (!qword_10000C0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E0);
  }
  return result;
}

unint64_t sub_100006E38()
{
  unint64_t result = qword_10000C0E8;
  if (!qword_10000C0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E8);
  }
  return result;
}

uint64_t sub_100006E8C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100006EC4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006F28(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100006F3C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006D4C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006FB0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100006FC0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100006FD0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100007000()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100007010()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100007020()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100007030()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100007040()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100007050()
{
  return URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100007060()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100007070()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100007080()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_100007090()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_1000070A0()
{
  return EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_1000070B0()
{
  return EnumURLRepresentation.init(_:)();
}

uint64_t sub_1000070E0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100007100()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100007110()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100007120()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100007130()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100007140()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100007150()
{
  return static AppExtension.main()();
}

uint64_t sub_100007160()
{
  return String.hash(into:)();
}

uint64_t sub_100007170()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100007180(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100007190()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1000071A0()
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