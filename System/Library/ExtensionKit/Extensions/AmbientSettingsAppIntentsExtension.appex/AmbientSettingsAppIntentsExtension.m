uint64_t sub_100003B40(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_100003C94();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003BEC()
{
  unint64_t result = qword_10000C018;
  if (!qword_10000C018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }
  return result;
}

uint64_t sub_100003C44()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100003C94()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

ValueMetadata *type metadata accessor for AmbientSettingsAppIntentsExtensionExtension()
{
  return &type metadata for AmbientSettingsAppIntentsExtensionExtension;
}

uint64_t sub_100003CF8()
{
  uint64_t v0 = sub_10000670C(&qword_10000C140);
  sub_100006884(v0, qword_10000CCF0);
  sub_10000684C(v0, (uint64_t)qword_10000CCF0);
  sub_10000670C(&qword_10000C148);
  uint64_t v1 = *(void *)(sub_10000670C(&qword_10000C150) - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100006DE0;
  unint64_t v5 = v4 + v3;
  *(unsigned char *)(v4 + v3) = 0;
  sub_1000049D0();
  sub_100006A80();
  *(unsigned char *)(v5 + v2) = 1;
  sub_100006A80();
  *(unsigned char *)(v5 + 2 * v2) = 2;
  sub_100006A80();
  *(unsigned char *)(v5 + 3 * v2) = 3;
  sub_100006A80();
  sub_100003F00(v4);
  return sub_100006A90();
}

unint64_t sub_100003F00(uint64_t a1)
{
  uint64_t v2 = sub_10000670C(&qword_10000C150);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  unint64_t v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000670C(&qword_10000C158);
  uint64_t v6 = sub_100006B50();
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
    sub_1000068FC(v12, (uint64_t)v5, &qword_10000C150);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_100005A44(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_10000670C((uint64_t *)&unk_10000C160);
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

unint64_t sub_100004100(uint64_t a1)
{
  uint64_t v2 = sub_10000670C(&qword_10000C128);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000670C(&qword_10000C138);
  uint64_t v6 = sub_100006B50();
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
    sub_1000068FC(v12, (uint64_t)v5, &qword_10000C128);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_100005A44(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100006A60();
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

uint64_t sub_1000042F8()
{
  sub_10000670C(&qword_10000C0F0);
  __chkstk_darwin();
  uint64_t v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100006B20();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v4 = sub_100006B00();
  sub_100006884(v4, qword_10000CD08);
  sub_10000684C(v4, (uint64_t)qword_10000CD08);
  sub_100006B10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  return sub_100006AF0();
}

uint64_t sub_100004460(unsigned __int8 *a1, char *a2)
{
  return sub_1000044C4(*a1, *a2);
}

unint64_t sub_100004470()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

uint64_t sub_1000044C4(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 1953460082;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 1953460082;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x7942646E617473;
      break;
    case 2:
      unint64_t v3 = 0x8000000100007320;
      unint64_t v5 = 0xD000000000000011;
      break;
    case 3:
      unint64_t v5 = 0xD000000000000014;
      unint64_t v3 = 0x8000000100007340;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE700000000000000;
      if (v5 == 0x7942646E617473) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0x8000000100007320;
      unint64_t v2 = 0xD000000000000011;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0x8000000100007340;
      if (v5 == 0xD000000000000014) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_100006B70();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

Swift::Int sub_10000465C()
{
  return sub_100004664();
}

Swift::Int sub_100004664()
{
  return sub_100006B90();
}

uint64_t sub_100004744()
{
  return sub_10000474C();
}

uint64_t sub_10000474C()
{
  sub_100006B40();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100004818()
{
  return sub_100004820();
}

Swift::Int sub_100004820()
{
  return sub_100006B90();
}

uint64_t sub_1000048FC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000063D0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_10000492C(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE400000000000000;
  uint64_t v3 = 1953460082;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE700000000000000;
      uint64_t v3 = 0x7942646E617473;
      goto LABEL_3;
    case 2:
      *a1 = 0xD000000000000011;
      a1[1] = 0x8000000100007320;
      break;
    case 3:
      *a1 = 0xD000000000000014;
      a1[1] = 0x8000000100007340;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

unint64_t sub_1000049D0()
{
  unint64_t result = qword_10000C040;
  if (!qword_10000C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

unint64_t sub_100004A28()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

uint64_t sub_100004A7C@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C000 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000670C(&qword_10000C140);
  uint64_t v3 = sub_10000684C(v2, (uint64_t)qword_10000CCF0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100004B2C()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

unint64_t sub_100004B84()
{
  unint64_t result = qword_10000C058;
  if (!qword_10000C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

unint64_t sub_100004BDC()
{
  unint64_t result = qword_10000C060;
  if (!qword_10000C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

void *sub_100004C30()
{
  return &protocol witness table for String;
}

uint64_t sub_100004C3C()
{
  sub_1000067F8();
  uint64_t v2 = sub_100006A70();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_1000068E8(v3, v0, v2, v1);
}

unint64_t sub_100004CD4()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

unint64_t sub_100004D2C()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

unint64_t sub_100004D84()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

unint64_t sub_100004DDC()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

uint64_t sub_100004E34@<X0>(uint64_t a1@<X8>)
{
  return sub_100005580(&qword_10000C008, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000CD08, a1);
}

uint64_t sub_100004E6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005500(a1, a2, a3, (void (*)(void))sub_1000049D0);
}

uint64_t sub_100004E98(uint64_t a1)
{
  unint64_t v2 = sub_1000049D0();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100004EE8()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

unint64_t sub_100004F40()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

unint64_t sub_100004F98()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

uint64_t sub_100004FF0(uint64_t a1)
{
  unint64_t v2 = sub_100004DDC();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100005040()
{
  unint64_t result = qword_10000C0A8;
  if (!qword_10000C0A8)
  {
    sub_10000509C(&qword_10000C0B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A8);
  }
  return result;
}

uint64_t sub_10000509C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_1000050E4(void *a1@<X8>)
{
  *a1 = &off_1000086B0;
}

unint64_t sub_1000050F8()
{
  unint64_t result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }
  return result;
}

uint64_t sub_10000514C()
{
  uint64_t v0 = sub_100006B20();
  sub_100006884(v0, qword_10000CD20);
  sub_10000684C(v0, (uint64_t)qword_10000CD20);
  return sub_100006B10();
}

uint64_t sub_1000051B0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006A00();
  *a1 = v3;
  return result;
}

uint64_t sub_1000051EC()
{
  return sub_100006A10();
}

void (*sub_100005224(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1000069F0();
  return sub_100005280;
}

void sub_100005280(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_1000052D0()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

unint64_t sub_100005328()
{
  unint64_t result = qword_10000C0C8;
  if (!qword_10000C0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C8);
  }
  return result;
}

uint64_t sub_10000537C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100006750();
  unint64_t v5 = sub_1000067F8();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_1000053E8()
{
  uint64_t v0 = qword_10000C028;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100005428()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

unint64_t sub_100005480()
{
  unint64_t result = qword_10000C0D8;
  if (!qword_10000C0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D8);
  }
  return result;
}

uint64_t sub_1000054D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005500(a1, a2, a3, (void (*)(void))sub_1000052D0);
}

uint64_t sub_100005500(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005548@<X0>(uint64_t a1@<X8>)
{
  return sub_100005580(&qword_10000C010, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000CD20, a1);
}

uint64_t sub_100005580@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_10000684C(v7, a3);
  v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100005624()
{
  return 0;
}

uint64_t sub_100005630()
{
  return 1;
}

uint64_t sub_100005640(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100006750();
  unint64_t v7 = sub_1000067A4();
  unint64_t v8 = sub_1000067F8();
  *unint64_t v5 = v2;
  v5[1] = sub_100005714;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100005714()
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

uint64_t sub_10000581C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000641C();
  *a1 = result;
  return result;
}

uint64_t sub_100005844(uint64_t a1)
{
  unint64_t v2 = sub_1000052D0();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenAmbientSettingsDeepLinks()
{
  return &type metadata for OpenAmbientSettingsDeepLinks;
}

unsigned char *initializeBufferWithCopyOfBuffer for AmbientSettingsDeepLinks(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AmbientSettingsDeepLinks(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AmbientSettingsDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000059FCLL);
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

uint64_t sub_100005A24(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100005A2C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AmbientSettingsDeepLinks()
{
  return &type metadata for AmbientSettingsDeepLinks;
}

unint64_t sub_100005A44(unsigned __int8 a1)
{
  sub_100006B80();
  sub_100006B40();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_100006B90();

  return sub_100005B48(a1, v2);
}

unint64_t sub_100005B48(unsigned __int8 a1, uint64_t a2)
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
          unint64_t v7 = 0xE700000000000000;
          unint64_t v8 = 0x7942646E617473;
          break;
        case 2:
          unint64_t v7 = 0x8000000100007320;
          unint64_t v8 = 0xD000000000000011;
          break;
        case 3:
          unint64_t v8 = 0xD000000000000014;
          unint64_t v7 = 0x8000000100007340;
          break;
        default:
          break;
      }
      unint64_t v9 = 0xE400000000000000;
      unint64_t v10 = 1953460082;
      switch(v6)
      {
        case 1:
          unint64_t v9 = 0xE700000000000000;
          if (v8 == 0x7942646E617473) {
            goto LABEL_14;
          }
          goto LABEL_15;
        case 2:
          unint64_t v9 = 0x8000000100007320;
          unint64_t v10 = 0xD000000000000011;
          goto LABEL_11;
        case 3:
          unint64_t v9 = 0x8000000100007340;
          if (v8 == 0xD000000000000014) {
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
          char v11 = sub_100006B70();
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

unint64_t sub_100005D48()
{
  uint64_t v0 = sub_10000670C(&qword_10000C118);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000670C(&qword_10000C0F0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006B20();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  unint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v28 - v11;
  sub_10000670C(&qword_10000C120);
  uint64_t v13 = sub_10000670C(&qword_10000C128);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v38 = *(void *)(v14 + 72);
  uint64_t v15 = v13 - 8;
  unint64_t v16 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = swift_allocObject();
  uint64_t v33 = v17;
  *(_OWORD *)(v17 + 16) = xmmword_100006DE0;
  uint64_t v18 = *(int *)(v15 + 56);
  uint64_t v39 = v15;
  unint64_t v40 = v17 + v16;
  v31 = (unsigned char *)(v17 + v16 + v18);
  *(unsigned char *)(v17 + v16) = 0;
  unint64_t v19 = v17 + v16;
  sub_100006B10();
  v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  uint64_t v29 = v6;
  v32(v5, 1, 1, v6);
  unint64_t v37 = 0x80000001000073E0;
  sub_100006A30();
  uint64_t v41 = sub_100006A40();
  uint64_t v20 = *(void *)(v41 - 8);
  v30 = *(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56);
  uint64_t v36 = v20 + 56;
  v30(v2, 0, 1, v41);
  sub_10000670C(&qword_10000C130);
  uint64_t v35 = v7 + 56;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100006DF0;
  sub_100006B10();
  sub_100006B10();
  v34 = v12;
  sub_100006A50();
  uint64_t v21 = v38;
  v31 = (unsigned char *)(v19 + v38 + *(int *)(v15 + 56));
  *(unsigned char *)(v19 + v38) = 1;
  sub_100006B10();
  sub_100006B10();
  uint64_t v22 = v32;
  v32(v5, 0, 1, v6);
  sub_100006A30();
  v23 = v30;
  v30(v2, 0, 1, v41);
  v28 = v10;
  sub_100006B10();
  sub_100006A50();
  uint64_t v24 = 2 * v21;
  v25 = (unsigned char *)(v40 + 2 * v21);
  v31 = &v25[*(int *)(v39 + 56)];
  unsigned char *v25 = 2;
  sub_100006B10();
  sub_100006B10();
  uint64_t v26 = v29;
  v22(v5, 0, 1, v29);
  sub_100006A30();
  v23(v2, 0, 1, v41);
  sub_100006B10();
  sub_100006A50();
  *(unsigned char *)(v40 + v24 + v38) = 3;
  sub_100006B10();
  sub_100006B10();
  v22(v5, 0, 1, v26);
  sub_100006A30();
  v23(v2, 0, 1, v41);
  sub_100006B10();
  sub_100006A50();
  return sub_100004100(v33);
}

uint64_t sub_1000063D0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100008630;
  v6._object = a2;
  unint64_t v4 = sub_100006B60(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t sub_10000641C()
{
  uint64_t v16 = sub_100006AA0();
  uint64_t v0 = *(void *)(v16 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000670C(&qword_10000C0E8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = sub_10000670C(&qword_10000C0F0);
  __chkstk_darwin(v8 - 8);
  unint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100006B20();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_10000670C(&qword_10000C0F8);
  sub_100006B10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  char v17 = 4;
  uint64_t v13 = sub_1000069E0();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v16);
  sub_1000049D0();
  return sub_100006A20();
}

uint64_t sub_10000670C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006750()
{
  unint64_t result = qword_10000C100;
  if (!qword_10000C100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C100);
  }
  return result;
}

unint64_t sub_1000067A4()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

unint64_t sub_1000067F8()
{
  unint64_t result = qword_10000C110;
  if (!qword_10000C110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C110);
  }
  return result;
}

uint64_t sub_10000684C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100006884(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000068E8(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_1000068FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000670C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006960()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100006970()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100006990()
{
  return static AppIntent.description.getter();
}

uint64_t sub_1000069A0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000069B0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000069E0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_1000069F0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100006A00()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006A10()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100006A20()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100006A30()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100006A40()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100006A50()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100006A60()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100006A70()
{
  return _URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100006A80()
{
  return _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_100006A90()
{
  return _EnumURLRepresentation.init(_:)();
}

uint64_t sub_100006AA0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100006AE0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100006AF0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100006B00()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100006B10()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100006B20()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006B30()
{
  return static AppExtension.main()();
}

uint64_t sub_100006B40()
{
  return String.hash(into:)();
}

uint64_t sub_100006B50()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100006B60(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006B70()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006B80()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006B90()
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