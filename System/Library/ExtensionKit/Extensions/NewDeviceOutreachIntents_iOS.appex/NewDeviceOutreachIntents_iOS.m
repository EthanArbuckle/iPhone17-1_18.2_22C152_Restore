uint64_t sub_100004C0C(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_100004D60();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100004CB8()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

uint64_t sub_100004D10()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100004D60()
{
  unint64_t result = qword_10000C028;
  if (!qword_10000C028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C028);
  }
  return result;
}

ValueMetadata *type metadata accessor for NewDeviceOutreachIntentsExtension()
{
  return &type metadata for NewDeviceOutreachIntentsExtension;
}

uint64_t sub_100004DC4()
{
  sub_100006C3C(&qword_10000C0F8);
  __chkstk_darwin();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100007050();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v4 = sub_100007030();
  sub_100006DB4(v4, qword_10000CCF0);
  sub_100006D7C(v4, (uint64_t)qword_10000CCF0);
  sub_100007040();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  return sub_100007020();
}

unint64_t sub_100004F2C()
{
  sub_100006C3C(&qword_10000C120);
  __chkstk_darwin();
  v1 = (char *)&v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006C3C(&qword_10000C0F8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100007050();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  sub_100006C3C(&qword_10000C128);
  sub_100006C3C(&qword_10000C130);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100007610;
  sub_100007040();
  sub_100007040();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  sub_100006F60();
  uint64_t v7 = sub_100006F70();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v1, 0, 1, v7);
  sub_100006C3C(&qword_10000C138);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100007620;
  sub_100007040();
  sub_100007040();
  sub_100006F80();
  unint64_t result = sub_100005254(v6);
  qword_10000CD08 = result;
  return result;
}

unint64_t sub_100005254(uint64_t a1)
{
  uint64_t v2 = *(void *)(sub_100006C3C(&qword_10000C130) - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v6 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006C3C(&qword_10000C140);
  uint64_t v5 = sub_100007080();
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
    sub_100006E2C(v10, (uint64_t)v4, &qword_10000C130);
    unint64_t result = sub_1000068F0();
    if (v13) {
      break;
    }
    unint64_t v14 = result;
    *(void *)(v8 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v15 = v6[7];
    uint64_t v16 = sub_100006F90();
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

unint64_t sub_100005430(uint64_t a1)
{
  uint64_t v2 = *(void *)(sub_100006C3C(&qword_10000C158) - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v6 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006C3C(&qword_10000C160);
  uint64_t v5 = sub_100007080();
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
    sub_100006E2C(v10, (uint64_t)v4, &qword_10000C158);
    unint64_t result = sub_1000068F0();
    if (v13) {
      break;
    }
    unint64_t v14 = result;
    *(void *)(v8 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v15 = v6[7];
    uint64_t v16 = sub_100006C3C(&qword_10000C168);
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

uint64_t sub_100005610()
{
  uint64_t v0 = sub_100006C3C(&qword_10000C148);
  sub_100006DB4(v0, qword_10000CD10);
  sub_100006D7C(v0, (uint64_t)qword_10000CD10);
  sub_100006C3C(&qword_10000C150);
  sub_100006C3C(&qword_10000C158);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100007610;
  sub_1000058B8();
  sub_100006FB0();
  sub_100005430(v1);
  return sub_100006FC0();
}

uint64_t sub_100005748()
{
  return 1;
}

unint64_t sub_100005754()
{
  unint64_t result = qword_10000C040;
  if (!qword_10000C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

Swift::Int sub_1000057A8()
{
  return sub_1000070B0();
}

uint64_t sub_1000057F4()
{
  return sub_100007070();
}

Swift::Int sub_100005804()
{
  return sub_1000070B0();
}

uint64_t sub_10000584C@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100008618;
  v7._object = v3;
  Swift::Int v5 = sub_100007090(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_1000058A0(void *a1@<X8>)
{
  *a1 = 1953460082;
  a1[1] = 0xE400000000000000;
}

unint64_t sub_1000058B8()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

unint64_t sub_100005910()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

uint64_t sub_100005964@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C010 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006C3C(&qword_10000C148);
  uint64_t v3 = sub_100006D7C(v2, (uint64_t)qword_10000CD10);
  Swift::OpaquePointer v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100005A14()
{
  unint64_t result = qword_10000C058;
  if (!qword_10000C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

unint64_t sub_100005A6C()
{
  unint64_t result = qword_10000C060;
  if (!qword_10000C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

unint64_t sub_100005AC4()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

void *sub_100005B18()
{
  return &protocol witness table for String;
}

uint64_t sub_100005B24()
{
  sub_100006D28();
  uint64_t v2 = sub_100006FA0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006E18(v3, v0, v2, v1);
}

unint64_t sub_100005BBC()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

unint64_t sub_100005C14()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

unint64_t sub_100005C6C()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

unint64_t sub_100005CC4()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

uint64_t sub_100005D1C@<X0>(uint64_t a1@<X8>)
{
  return sub_100006490(&qword_10000C000, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000CCF0, a1);
}

uint64_t sub_100005D54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006410(a1, a2, a3, (void (*)(void))sub_1000058B8);
}

uint64_t sub_100005D80(uint64_t a1)
{
  unint64_t v2 = sub_1000058B8();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100005DD0()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

unint64_t sub_100005E28()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

unint64_t sub_100005E80()
{
  unint64_t result = qword_10000C0A8;
  if (!qword_10000C0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A8);
  }
  return result;
}

uint64_t sub_100005ED4()
{
  if (qword_10000C008 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_100005F30(uint64_t a1)
{
  unint64_t v2 = sub_100005CC4();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100005F80()
{
  unint64_t result = qword_10000C0B0;
  if (!qword_10000C0B0)
  {
    sub_100005FDC(&qword_10000C0B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B0);
  }
  return result;
}

uint64_t sub_100005FDC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100006024(void *a1@<X8>)
{
  *a1 = &off_100008650;
}

unint64_t sub_100006038()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

uint64_t sub_10000608C()
{
  uint64_t v0 = sub_100007050();
  sub_100006DB4(v0, qword_10000CD28);
  sub_100006D7C(v0, (uint64_t)qword_10000CD28);
  return sub_100007040();
}

uint64_t sub_1000060EC()
{
  return sub_100006F30();
}

uint64_t sub_100006110()
{
  return sub_100006F40();
}

void (*sub_100006134(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100006F20();
  return sub_100006190;
}

void sub_100006190(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_1000061E0()
{
  unint64_t result = qword_10000C0C8;
  if (!qword_10000C0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C8);
  }
  return result;
}

unint64_t sub_100006238()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

uint64_t sub_10000628C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100006C80();
  unint64_t v5 = sub_100006D28();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_1000062F8()
{
  uint64_t v0 = qword_10000C030;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100006338()
{
  unint64_t result = qword_10000C0D8;
  if (!qword_10000C0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D8);
  }
  return result;
}

unint64_t sub_100006390()
{
  unint64_t result = qword_10000C0E0;
  if (!qword_10000C0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E0);
  }
  return result;
}

uint64_t sub_1000063E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006410(a1, a2, a3, (void (*)(void))sub_1000061E0);
}

uint64_t sub_100006410(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006458@<X0>(uint64_t a1@<X8>)
{
  return sub_100006490(&qword_10000C018, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000CD28, a1);
}

uint64_t sub_100006490@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100006D7C(v7, a3);
  unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100006534()
{
  return 0;
}

uint64_t sub_100006548(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100006C80();
  unint64_t v7 = sub_100006CD4();
  unint64_t v8 = sub_100006D28();
  *unint64_t v5 = v2;
  v5[1] = sub_10000661C;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_10000661C()
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

uint64_t sub_100006724@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006950();
  *a1 = result;
  return result;
}

uint64_t sub_10000674C(uint64_t a1)
{
  unint64_t v2 = sub_1000061E0();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenNewDeviceOutreachStaticDeepLinks()
{
  return &type metadata for OpenNewDeviceOutreachStaticDeepLinks;
}

uint64_t getEnumTagSinglePayload for NewDeviceOutreachStaticDeepLinks(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for NewDeviceOutreachStaticDeepLinks(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10000688CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for NewDeviceOutreachStaticDeepLinks()
{
  return &type metadata for NewDeviceOutreachStaticDeepLinks;
}

uint64_t sub_1000068C4(uint64_t a1)
{
  return a1 & ~(-1 << *(unsigned char *)(v1 + 32));
}

uint64_t sub_1000068F0()
{
  sub_1000070A0();
  sub_100007070();
  Swift::Int v0 = sub_1000070B0();

  return sub_1000068C4(v0);
}

uint64_t sub_100006950()
{
  uint64_t v16 = sub_100006FD0();
  uint64_t v0 = *(void *)(v16 - 8);
  ((void (*)(void))__chkstk_darwin)();
  int v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006C3C(&qword_10000C0F0);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unint64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = sub_100006C3C(&qword_10000C0F8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100007050();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_100006C3C(&qword_10000C100);
  sub_100007040();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  char v17 = 1;
  uint64_t v13 = sub_100006F10();
  unint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v16);
  sub_1000058B8();
  return sub_100006F50();
}

uint64_t sub_100006C3C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006C80()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

unint64_t sub_100006CD4()
{
  unint64_t result = qword_10000C110;
  if (!qword_10000C110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C110);
  }
  return result;
}

unint64_t sub_100006D28()
{
  unint64_t result = qword_10000C118;
  if (!qword_10000C118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C118);
  }
  return result;
}

uint64_t sub_100006D7C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100006DB4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006E18(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100006E2C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006C3C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006E90()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100006EA0()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100006EC0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100006ED0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100006EE0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100006F10()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100006F20()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100006F30()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006F40()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100006F50()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100006F60()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100006F70()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100006F80()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:)();
}

uint64_t sub_100006F90()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100006FA0()
{
  return _URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100006FB0()
{
  return _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_100006FC0()
{
  return _EnumURLRepresentation.init(_:)();
}

uint64_t sub_100006FD0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100007010()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100007020()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100007030()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100007040()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100007050()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100007060()
{
  return static AppExtension.main()();
}

uint64_t sub_100007070()
{
  return String.hash(into:)();
}

uint64_t sub_100007080()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100007090(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_1000070A0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1000070B0()
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