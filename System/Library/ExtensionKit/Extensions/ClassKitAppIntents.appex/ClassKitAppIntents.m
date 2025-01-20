uint64_t sub_100004730(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_100004884();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000047DC()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

uint64_t sub_100004834()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100004884()
{
  unint64_t result = qword_10000C028;
  if (!qword_10000C028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C028);
  }
  return result;
}

ValueMetadata *type metadata accessor for ClassKitAppIntentsExtension()
{
  return &type metadata for ClassKitAppIntentsExtension;
}

uint64_t sub_1000048E8()
{
  sub_100006A0C(&qword_10000C0F8);
  __chkstk_darwin();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for LocalizedStringResource();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v4 = type metadata accessor for TypeDisplayRepresentation();
  sub_100006B84(v4, qword_10000CCF0);
  sub_100006B4C(v4, (uint64_t)qword_10000CCF0);
  LocalizedStringResource.init(stringLiteral:)();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

unint64_t sub_100004A5C()
{
  sub_100006A0C(&qword_10000C120);
  ((void (*)(void))__chkstk_darwin)();
  v1 = (char *)v12 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006A0C(&qword_10000C0F8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = v3;
  uint64_t v4 = type metadata accessor for LocalizedStringResource();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  __chkstk_darwin(v6);
  sub_100006A0C(&qword_10000C128);
  uint64_t v7 = *(void *)(sub_100006A0C(&qword_10000C130) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100007640;
  v12[1] = v9 + v8;
  LocalizedStringResource.init(stringLiteral:)();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  DisplayRepresentation.Image.init(systemName:isTemplate:)();
  uint64_t v10 = type metadata accessor for DisplayRepresentation.Image();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v1, 0, 1, v10);
  sub_100006A0C(&qword_10000C138);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100007650;
  LocalizedStringResource.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
  unint64_t result = sub_100005024(v9);
  qword_10000CD08 = result;
  return result;
}

unint64_t sub_100005024(uint64_t a1)
{
  uint64_t v2 = *(void *)(sub_100006A0C(&qword_10000C130) - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v6 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006A0C(&qword_10000C140);
  uint64_t v5 = static _DictionaryStorage.allocate(capacity:)();
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
    sub_100006BFC(v10, (uint64_t)v4, &qword_10000C130);
    unint64_t result = sub_1000066BC();
    if (v13) {
      break;
    }
    unint64_t v14 = result;
    *(void *)(v8 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v15 = v6[7];
    uint64_t v16 = type metadata accessor for DisplayRepresentation();
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

unint64_t sub_100005200(uint64_t a1)
{
  uint64_t v2 = *(void *)(sub_100006A0C(&qword_10000C158) - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v6 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006A0C(&qword_10000C160);
  uint64_t v5 = static _DictionaryStorage.allocate(capacity:)();
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
    sub_100006BFC(v10, (uint64_t)v4, &qword_10000C158);
    unint64_t result = sub_1000066BC();
    if (v13) {
      break;
    }
    unint64_t v14 = result;
    *(void *)(v8 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v15 = v6[7];
    uint64_t v16 = sub_100006A0C(&qword_10000C168);
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

uint64_t sub_1000053E0()
{
  uint64_t v0 = sub_100006A0C(&qword_10000C148);
  sub_100006B84(v0, qword_10000CD10);
  sub_100006B4C(v0, (uint64_t)qword_10000CD10);
  sub_100006A0C(&qword_10000C150);
  sub_100006A0C(&qword_10000C158);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100007640;
  sub_100005688();
  EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
  sub_100005200(v1);
  return EnumURLRepresentation.init(_:)();
}

uint64_t sub_100005518()
{
  return 1;
}

unint64_t sub_100005524()
{
  unint64_t result = qword_10000C040;
  if (!qword_10000C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

Swift::Int sub_100005578()
{
  return Hasher._finalize()();
}

uint64_t sub_1000055C4()
{
  return String.hash(into:)();
}

Swift::Int sub_1000055D4()
{
  return Hasher._finalize()();
}

uint64_t sub_10000561C@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100008608, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void sub_100005670(void *a1@<X8>)
{
  *a1 = 1953460082;
  a1[1] = 0xE400000000000000;
}

unint64_t sub_100005688()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

unint64_t sub_1000056E0()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

uint64_t sub_100005734@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C010 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006A0C(&qword_10000C148);
  uint64_t v3 = sub_100006B4C(v2, (uint64_t)qword_10000CD10);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_1000057E4()
{
  unint64_t result = qword_10000C058;
  if (!qword_10000C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

unint64_t sub_10000583C()
{
  unint64_t result = qword_10000C060;
  if (!qword_10000C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

unint64_t sub_100005894()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

void *sub_1000058E8()
{
  return &protocol witness table for String;
}

uint64_t sub_1000058F4()
{
  sub_100006AF8();
  uint64_t v2 = URLRepresentableEnum.urlRepresentationParameter.getter();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006BE8(v3, v0, v2, v1);
}

unint64_t sub_10000598C()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

unint64_t sub_1000059E4()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

unint64_t sub_100005A3C()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

unint64_t sub_100005A94()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

uint64_t sub_100005AEC@<X0>(uint64_t a1@<X8>)
{
  return sub_100006264(&qword_10000C000, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000CCF0, a1);
}

uint64_t sub_100005B24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000061E4(a1, a2, a3, (void (*)(void))sub_100005688);
}

uint64_t sub_100005B50(uint64_t a1)
{
  unint64_t v2 = sub_100005688();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100005BA0()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

unint64_t sub_100005BF8()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

unint64_t sub_100005C50()
{
  unint64_t result = qword_10000C0A8;
  if (!qword_10000C0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A8);
  }
  return result;
}

uint64_t sub_100005CA4()
{
  if (qword_10000C008 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_100005D00(uint64_t a1)
{
  unint64_t v2 = sub_100005A94();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100005D50()
{
  unint64_t result = qword_10000C0B0;
  if (!qword_10000C0B0)
  {
    sub_100005DAC(&qword_10000C0B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B0);
  }
  return result;
}

uint64_t sub_100005DAC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100005DF4(void *a1@<X8>)
{
  *a1 = &off_100008640;
}

unint64_t sub_100005E08()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

uint64_t sub_100005E5C()
{
  uint64_t v0 = type metadata accessor for LocalizedStringResource();
  sub_100006B84(v0, qword_10000CD28);
  sub_100006B4C(v0, (uint64_t)qword_10000CD28);
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100005EC0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100005EE4()
{
  return IntentParameter.wrappedValue.setter();
}

void (*sub_100005F08(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100005F64;
}

void sub_100005F64(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100005FB4()
{
  unint64_t result = qword_10000C0C8;
  if (!qword_10000C0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C8);
  }
  return result;
}

uint64_t sub_100006008(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100006A50();
  unint64_t v5 = sub_100006AF8();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100006074()
{
  uint64_t v0 = qword_10000C030;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_1000060B4()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

unint64_t sub_10000610C()
{
  unint64_t result = qword_10000C0D8;
  if (!qword_10000C0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D8);
  }
  return result;
}

unint64_t sub_100006164()
{
  unint64_t result = qword_10000C0E0;
  if (!qword_10000C0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E0);
  }
  return result;
}

uint64_t sub_1000061B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000061E4(a1, a2, a3, (void (*)(void))sub_100005FB4);
}

uint64_t sub_1000061E4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000622C@<X0>(uint64_t a1@<X8>)
{
  return sub_100006264(&qword_10000C018, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000CD28, a1);
}

uint64_t sub_100006264@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100006B4C(v7, a3);
  unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100006308()
{
  return 0;
}

uint64_t sub_10000631C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100006A50();
  unint64_t v6 = sub_100006AA4();
  unint64_t v7 = sub_100006AF8();
  *unint64_t v4 = v2;
  v4[1] = sub_1000063E8;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_1000063E8()
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

uint64_t sub_1000064F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000671C();
  *a1 = result;
  return result;
}

uint64_t sub_100006518(uint64_t a1)
{
  unint64_t v2 = sub_100005FB4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenClassKitAppIntentsDeepLinks()
{
  return &type metadata for OpenClassKitAppIntentsDeepLinks;
}

uint64_t getEnumTagSinglePayload for ClassKitAppIntentsDeepLinks(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ClassKitAppIntentsDeepLinks(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100006658);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ClassKitAppIntentsDeepLinks()
{
  return &type metadata for ClassKitAppIntentsDeepLinks;
}

uint64_t sub_100006690(uint64_t a1)
{
  return a1 & ~(-1 << *(unsigned char *)(v1 + 32));
}

uint64_t sub_1000066BC()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();

  return sub_100006690(v0);
}

uint64_t sub_10000671C()
{
  uint64_t v17 = type metadata accessor for InputConnectionBehavior();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  int v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006A0C(&qword_10000C0F0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_100006A0C(&qword_10000C0F8);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for LocalizedStringResource();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100006A0C(&qword_10000C100);
  LocalizedStringResource.init(stringLiteral:)();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 1;
  uint64_t v14 = type metadata accessor for IntentDialog();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_100005688();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100006A0C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006A50()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

unint64_t sub_100006AA4()
{
  unint64_t result = qword_10000C110;
  if (!qword_10000C110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C110);
  }
  return result;
}

unint64_t sub_100006AF8()
{
  unint64_t result = qword_10000C118;
  if (!qword_10000C118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C118);
  }
  return result;
}

uint64_t sub_100006B4C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100006B84(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006BE8(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100006BFC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006A0C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t static AppIntentInternal.sideEffect.getter()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t static AppIntentInternal.shortcutsMetadata.getter()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t static AppIntent.description.getter()
{
  return static AppIntent.description.getter();
}

uint64_t static AppIntent.parameterSummary.getter()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t static AppIntent.authenticationPolicy.getter()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t type metadata accessor for IntentDialog()
{
  return type metadata accessor for IntentDialog();
}

uint64_t IntentParameter.wrappedValue.modify()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t IntentParameter.wrappedValue.getter()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t IntentParameter.wrappedValue.setter()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t URLRepresentableEnum.urlRepresentationParameter.getter()
{
  return URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t DisplayRepresentation.Image.init(systemName:isTemplate:)()
{
  return DisplayRepresentation.Image.init(systemName:isTemplate:)();
}

uint64_t type metadata accessor for DisplayRepresentation.Image()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t type metadata accessor for DisplayRepresentation()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)()
{
  return EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t EnumURLRepresentation.init(_:)()
{
  return EnumURLRepresentation.init(_:)();
}

uint64_t type metadata accessor for InputConnectionBehavior()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t static PersistentlyIdentifiable.persistentIdentifier.getter()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t TypeDisplayRepresentation.init(name:numericFormat:)()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t type metadata accessor for TypeDisplayRepresentation()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t LocalizedStringResource.init(stringLiteral:)()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t static AppExtension.main()()
{
  return static AppExtension.main()();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
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