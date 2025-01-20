uint64_t sub_1000048D8(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_100004A2C();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100004984()
{
  unint64_t result = qword_10000C018;
  if (!qword_10000C018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }
  return result;
}

uint64_t sub_1000049DC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100004A2C()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

ValueMetadata *type metadata accessor for DictionarySettingsExtension()
{
  return &type metadata for DictionarySettingsExtension;
}

uint64_t sub_100004A90()
{
  sub_100006140(&qword_10000C0B0);
  __chkstk_darwin();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100006F30();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v4 = sub_100006F00();
  sub_1000061BC(v4, qword_10000CCE0);
  sub_100006184(v4, (uint64_t)qword_10000CCE0);
  sub_100006F10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  return sub_100006EF0();
}

unint64_t sub_100004BFC(uint64_t a1)
{
  uint64_t v2 = *(void *)(sub_100006140(&qword_10000C0C0) - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v6 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006140(&qword_10000C0D0);
  uint64_t v5 = sub_100006FB0();
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
    sub_100006288(v10, (uint64_t)v4, &qword_10000C0C0);
    unint64_t result = sub_100005B78();
    if (v13) {
      break;
    }
    unint64_t v14 = result;
    *(void *)(v8 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v15 = v6[7];
    uint64_t v16 = sub_100006E70();
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

unint64_t sub_100004DD8(uint64_t a1)
{
  uint64_t v2 = *(void *)(sub_100006140(&qword_10000C0F0) - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v6 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006140(&qword_10000C0F8);
  uint64_t v5 = sub_100006FB0();
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
    sub_100006288(v10, (uint64_t)v4, &qword_10000C0F0);
    unint64_t result = sub_100005B78();
    if (v13) {
      break;
    }
    unint64_t v14 = result;
    *(void *)(v8 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v15 = v6[7];
    uint64_t v16 = sub_100006140(&qword_10000C100);
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

uint64_t sub_100004FB8()
{
  uint64_t v0 = sub_100006140(&qword_10000C0E0);
  sub_1000061BC(v0, qword_10000CCF8);
  sub_100006184(v0, (uint64_t)qword_10000CCF8);
  sub_100006140(&qword_10000C0E8);
  sub_100006140(&qword_10000C0F0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1000071D0;
  sub_100005260();
  sub_100006E80();
  sub_100004DD8(v1);
  return sub_100006E90();
}

uint64_t sub_1000050F0()
{
  return 1;
}

unint64_t sub_1000050FC()
{
  unint64_t result = qword_10000C028;
  if (!qword_10000C028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C028);
  }
  return result;
}

Swift::Int sub_100005150()
{
  return sub_100006FE0();
}

uint64_t sub_10000519C()
{
  return sub_100006FA0();
}

Swift::Int sub_1000051AC()
{
  return sub_100006FE0();
}

uint64_t sub_1000051F4@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100008640;
  v7._object = v3;
  Swift::Int v5 = sub_100006FC0(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_100005248(void *a1@<X8>)
{
  *a1 = 1953460082;
  a1[1] = 0xE400000000000000;
}

unint64_t sub_100005260()
{
  unint64_t result = qword_10000C030;
  if (!qword_10000C030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }
  return result;
}

unint64_t sub_1000052B8()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

uint64_t sub_10000530C@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C008 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006140(&qword_10000C0E0);
  uint64_t v3 = sub_100006184(v2, (uint64_t)qword_10000CCF8);
  Swift::OpaquePointer v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_1000053BC()
{
  unint64_t result = qword_10000C040;
  if (!qword_10000C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

unint64_t sub_100005414()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

unint64_t sub_10000546C()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

void *sub_1000054C0()
{
  return &protocol witness table for String;
}

uint64_t sub_1000054CC()
{
  sub_100006220();
  uint64_t v2 = sub_100006E30();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006274(v3, v0, v2, v1);
}

unint64_t sub_100005564()
{
  unint64_t result = qword_10000C060;
  if (!qword_10000C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

unint64_t sub_1000055BC()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

unint64_t sub_100005614()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

unint64_t sub_10000566C()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

uint64_t sub_1000056C4@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C000 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006F00();
  uint64_t v3 = sub_100006184(v2, (uint64_t)qword_10000CCE0);
  Swift::OpaquePointer v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000576C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000057BC(uint64_t a1)
{
  unint64_t v2 = sub_100005260();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000580C()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

unint64_t sub_100005864()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

unint64_t sub_1000058BC()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

uint64_t sub_100005914(uint64_t a1)
{
  unint64_t v2 = sub_10000566C();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100005964()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    sub_1000059C0(&qword_10000C0A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

uint64_t sub_1000059C0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100005A08(void *a1@<X8>)
{
  *a1 = &off_100008678;
}

uint64_t getEnumTagSinglePayload for DictionarySettingsDeepLinks(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for DictionarySettingsDeepLinks(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100005B0CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100005B34()
{
  return 0;
}

ValueMetadata *type metadata accessor for DictionarySettingsDeepLinks()
{
  return &type metadata for DictionarySettingsDeepLinks;
}

uint64_t sub_100005B4C(uint64_t a1)
{
  return a1 & ~(-1 << *(unsigned char *)(v1 + 32));
}

uint64_t sub_100005B78()
{
  sub_100006FD0();
  sub_100006FA0();
  Swift::Int v0 = sub_100006FE0();

  return sub_100005B4C(v0);
}

unint64_t sub_100005BD8()
{
  uint64_t v0 = sub_100006F20();
  uint64_t v23 = *(void *)(v0 - 8);
  uint64_t v24 = v0;
  ((void (*)(void))__chkstk_darwin)();
  int v2 = (char *)v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006F60();
  ((void (*)(void))__chkstk_darwin)();
  sub_100006F90();
  ((void (*)(void))__chkstk_darwin)();
  sub_100006140(&qword_10000C0A8);
  ((void (*)(void))__chkstk_darwin)();
  unsigned int v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006140(&qword_10000C0B0);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  void v20[2] = v6;
  uint64_t v7 = sub_100006F30();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  v22 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v20[3] = (char *)v20 - v11;
  sub_100006140(&qword_10000C0B8);
  uint64_t v12 = *(void *)(sub_100006140(&qword_10000C0C0) - 8);
  unint64_t v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1000071D0;
  v20[4] = v14 + v13;
  uint64_t v21 = v14;
  sub_100006F10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  v20[1] = v4;
  sub_100006E40();
  uint64_t v15 = sub_100006E50();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v4, 0, 1, v15);
  sub_100006140(&qword_10000C0C8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000071E0;
  sub_100006F80();
  sub_100006F50();
  uint64_t v16 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v17 = v24;
  BOOL v18 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 104);
  v18(v2, enum case for LocalizedStringResource.BundleDescription.main(_:), v24);
  sub_100006F40();
  sub_100006F80();
  sub_100006F50();
  v18(v2, v16, v17);
  sub_100006F40();
  sub_100006F80();
  sub_100006F50();
  v18(v2, v16, v17);
  sub_100006F40();
  sub_100006E60();
  return sub_100004BFC(v21);
}

uint64_t sub_100006140(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006184(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000061BC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100006220()
{
  unint64_t result = qword_10000C0D8;
  if (!qword_10000C0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D8);
  }
  return result;
}

uint64_t sub_100006274(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100006288(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006140(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_1000062F0()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

uint64_t sub_100006344()
{
  uint64_t v0 = sub_100006F30();
  sub_1000061BC(v0, qword_10000CD10);
  sub_100006184(v0, (uint64_t)qword_10000CD10);
  return sub_100006F10();
}

uint64_t sub_1000063A8()
{
  return sub_100006E00();
}

uint64_t sub_1000063CC()
{
  return sub_100006E10();
}

void (*sub_1000063F0(void *a1))(void *a1)
{
  int v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100006DF0();
  return sub_10000644C;
}

void sub_10000644C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_10000649C()
{
  unint64_t result = qword_10000C110;
  if (!qword_10000C110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C110);
  }
  return result;
}

uint64_t sub_1000064F0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100006CA8();
  unint64_t v5 = sub_100006220();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100006568()
{
  unint64_t result = qword_10000C118;
  if (!qword_10000C118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C118);
  }
  return result;
}

unint64_t sub_1000065C0()
{
  unint64_t result = qword_10000C120;
  if (!qword_10000C120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C120);
  }
  return result;
}

unint64_t sub_100006618()
{
  unint64_t result = qword_10000C128;
  if (!qword_10000C128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C128);
  }
  return result;
}

uint64_t sub_10000666C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000066BC@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C010 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006F30();
  uint64_t v3 = sub_100006184(v2, (uint64_t)qword_10000CD10);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100006770(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100006CA8();
  unint64_t v6 = sub_100006CFC();
  unint64_t v7 = sub_100006220();
  *unint64_t v4 = v2;
  v4[1] = sub_10000683C;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10000683C()
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

uint64_t sub_100006944@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000069B8();
  *a1 = result;
  return result;
}

uint64_t sub_10000696C(uint64_t a1)
{
  unint64_t v2 = sub_10000649C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenDictionarySettingsDeepLinks()
{
  return &type metadata for OpenDictionarySettingsDeepLinks;
}

uint64_t sub_1000069B8()
{
  uint64_t v17 = sub_100006EC0();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  unint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006140(&qword_10000C138);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_100006140(&qword_10000C0B0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006F30();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100006140(&qword_10000C140);
  sub_100006F10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 1;
  uint64_t v14 = sub_100006DE0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_100005260();
  return sub_100006E20();
}

unint64_t sub_100006CA8()
{
  unint64_t result = qword_10000C148;
  if (!qword_10000C148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C148);
  }
  return result;
}

unint64_t sub_100006CFC()
{
  unint64_t result = qword_10000C150;
  if (!qword_10000C150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C150);
  }
  return result;
}

uint64_t sub_100006D50()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100006D60()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100006D70()
{
  return static AppIntentInternal.attributionBundleIdentifier.getter();
}

uint64_t sub_100006D90()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100006DA0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100006DB0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100006DE0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100006DF0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100006E00()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006E10()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100006E20()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100006E30()
{
  return URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100006E40()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100006E50()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100006E60()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100006E70()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100006E80()
{
  return EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_100006E90()
{
  return EnumURLRepresentation.init(_:)();
}

uint64_t sub_100006EC0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100006EE0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100006EF0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100006F00()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100006F10()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100006F20()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100006F30()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006F40()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100006F50()
{
  return static Locale.current.getter();
}

uint64_t sub_100006F60()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100006F70()
{
  return static AppExtension.main()();
}

uint64_t sub_100006F80()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100006F90()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_100006FA0()
{
  return String.hash(into:)();
}

uint64_t sub_100006FB0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100006FC0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006FD0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006FE0()
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