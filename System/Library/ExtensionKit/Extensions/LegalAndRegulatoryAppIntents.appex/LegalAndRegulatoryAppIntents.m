uint64_t sub_10000234C(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_1000024A0();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000023F8()
{
  unint64_t result = qword_10000C018;
  if (!qword_10000C018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }
  return result;
}

uint64_t sub_100002450()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000024A0()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

ValueMetadata *type metadata accessor for LegalAndRegulatoryAppIntentsExtension()
{
  return &type metadata for LegalAndRegulatoryAppIntentsExtension;
}

unint64_t sub_100002508()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

unint64_t sub_100002560()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

unint64_t sub_1000025B8()
{
  unint64_t result = qword_10000C058[0];
  if (!qword_10000C058[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C058);
  }
  return result;
}

uint64_t sub_10000260C(char a1)
{
  sub_100005FA8(&qword_10000C190);
  ((void (*)(void))__chkstk_darwin)();
  v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005FA8(&qword_10000C168);
  ((void (*)(void))__chkstk_darwin)();
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000063A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  __chkstk_darwin(v8);
  switch(a1)
  {
    case 1:
    case 4:
    case 6:
    case 8:
      sub_100006390();
      sub_100006390();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
      sub_100006280();
      uint64_t v10 = sub_100006290();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v3, 0, 1, v10);
      sub_100005FA8(&qword_10000C198);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000066C0;
      sub_100006390();
      break;
    default:
      sub_100006390();
      sub_100006390();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
      sub_100006280();
      uint64_t v9 = sub_100006290();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v3, 0, 1, v9);
      break;
  }
  sub_100006390();
  return sub_1000062A0();
}

uint64_t sub_1000032C4()
{
  sub_100005FA8(&qword_10000C168);
  __chkstk_darwin();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000063A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v4 = sub_100006370();
  sub_100006120(v4, qword_10000D160);
  sub_1000060E8(v4, (uint64_t)qword_10000D160);
  sub_100006390();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  return sub_100006360();
}

uint64_t sub_100003430(uint64_t a1)
{
  v5 = (uint64_t (*)(uint64_t))((char *)&dword_10000C1D8 + dword_10000C1D8);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_1000034D8;
  return v5(a1);
}

uint64_t sub_1000034D8(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_1000035D8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10000C1D0 + dword_10000C1D0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10000619C;
  return v4();
}

unint64_t sub_100003680()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

uint64_t sub_1000036D4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10000C1C0 + dword_10000C1C0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100003778;
  return v4();
}

uint64_t sub_100003778(uint64_t a1)
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

unint64_t sub_100003890()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

unint64_t sub_1000038E8()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

unint64_t sub_100003940()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    sub_1000039B4(qword_10000C098);
    sub_1000038E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

uint64_t sub_1000039B4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000039FC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100003680();
  void *v5 = v2;
  v5[1] = sub_100003AB0;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100003AB0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100003BA4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10000C1B0 + dword_10000C1B0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100003C48;
  return v4();
}

uint64_t sub_100003C48(char a1)
{
  uint64_t v3 = *(unsigned char **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  unsigned char *v3 = a1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

unint64_t sub_100003D64()
{
  unint64_t result = qword_10000C0B0;
  if (!qword_10000C0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B0);
  }
  return result;
}

uint64_t sub_100003DB8()
{
  uint64_t v0 = sub_100005FA8(&qword_10000C1A0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005FA8(&qword_10000C1A8);
  __chkstk_darwin();
  sub_1000025B8();
  sub_100006340();
  v6._object = (void *)0x8000000100007300;
  v6._countAndFlagsBits = 0xD000000000000038;
  sub_100006330(v6);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for _EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_100006320();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  sub_100006330(v7);
  return sub_100006350();
}

uint64_t sub_100003F74()
{
  uint64_t v0 = qword_10000C028;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100003FB0()
{
  unint64_t result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }
  return result;
}

unint64_t sub_100004008()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

unint64_t sub_100004060()
{
  unint64_t result = qword_10000C0C8;
  if (!qword_10000C0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C8);
  }
  return result;
}

unint64_t sub_1000040B8()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

uint64_t sub_10000410C()
{
  sub_100006094();
  uint64_t v2 = sub_1000062E0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006184(v3, v0, v2, v1);
}

unint64_t sub_1000041A4()
{
  unint64_t result = qword_10000C0E0;
  if (!qword_10000C0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E0);
  }
  return result;
}

unint64_t sub_1000041FC()
{
  unint64_t result = qword_10000C0E8;
  if (!qword_10000C0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E8);
  }
  return result;
}

unint64_t sub_100004254()
{
  unint64_t result = qword_10000C0F0;
  if (!qword_10000C0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0F0);
  }
  return result;
}

unint64_t sub_1000042AC()
{
  unint64_t result = qword_10000C0F8;
  if (!qword_10000C0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0F8);
  }
  return result;
}

void sub_100004300(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000430C@<X0>(uint64_t a1@<X8>)
{
  return sub_100004F30(&qword_10000C008, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000D160, a1);
}

uint64_t sub_100004344()
{
  return sub_100004A24(&qword_10000C100, &qword_10000C108);
}

uint64_t sub_100004380(uint64_t a1)
{
  unint64_t v2 = sub_1000025B8();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000043D0()
{
  unint64_t result = qword_10000C110;
  if (!qword_10000C110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C110);
  }
  return result;
}

uint64_t sub_100004424()
{
  return sub_10000260C(*v0);
}

uint64_t sub_10000442C(uint64_t a1)
{
  unint64_t v2 = sub_100004254();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100004478(char a1)
{
  unint64_t result = 1953460082;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0x694C656369766564;
      break;
    case 3:
      unint64_t result = 0x6157656369766564;
      break;
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    case 5:
      unint64_t result = 0xD000000000000017;
      break;
    case 6:
      unint64_t result = 0xD000000000000014;
      break;
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    case 8:
      unint64_t result = 0xD000000000000013;
      break;
    case 9:
      unint64_t result = 0x4C646F50656D6F68;
      break;
    case 10:
      unint64_t result = 0x57646F50656D6F68;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_100004604(char a1)
{
  unint64_t result = 1953460082;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0x694C656369766564;
      break;
    case 3:
      unint64_t result = 0x6157656369766564;
      break;
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    case 5:
      unint64_t result = 0xD000000000000017;
      break;
    case 6:
      unint64_t result = 0xD000000000000014;
      break;
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    case 8:
      unint64_t result = 0xD000000000000013;
      break;
    case 9:
      unint64_t result = 0x4C646F50656D6F68;
      break;
    case 10:
      unint64_t result = 0x57646F50656D6F68;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100004790(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_100004604(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_100004604(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_1000063E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_100004820()
{
  unint64_t result = qword_10000C118;
  if (!qword_10000C118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C118);
  }
  return result;
}

Swift::Int sub_100004874()
{
  char v1 = *v0;
  sub_1000063F0();
  sub_100004604(v1);
  sub_1000063C0();
  swift_bridgeObjectRelease();
  return sub_100006400();
}

uint64_t sub_1000048D8()
{
  sub_100004604(*v0);
  sub_1000063C0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000492C()
{
  char v1 = *v0;
  sub_1000063F0();
  sub_100004604(v1);
  sub_1000063C0();
  swift_bridgeObjectRelease();
  return sub_100006400();
}

uint64_t sub_10000498C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100005C74(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_1000049BC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100004604(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000049E8()
{
  return sub_100004A24(&qword_10000C120, &qword_10000C128);
}

uint64_t sub_100004A24(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000039B4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100004A68(void *a1@<X8>)
{
  *a1 = &off_1000087A8;
}

unint64_t sub_100004A78()
{
  return sub_100004478(*v0);
}

uint64_t sub_100004A80@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_100005C74(a1, a2);
  *a3 = result;
  return result;
}

unint64_t sub_100004ACC()
{
  unint64_t result = qword_10000C130;
  if (!qword_10000C130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C130);
  }
  return result;
}

uint64_t sub_100004B20()
{
  uint64_t v0 = sub_1000063A0();
  sub_100006120(v0, qword_10000D178);
  sub_1000060E8(v0, (uint64_t)qword_10000D178);
  return sub_100006390();
}

uint64_t sub_100004B84@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006250();
  *a1 = v3;
  return result;
}

uint64_t sub_100004BC0()
{
  return sub_100006260();
}

void (*sub_100004BF8(void *a1))(void *a1)
{
  char v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100006240();
  return sub_100004C54;
}

void sub_100004C54(void *a1)
{
  char v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100004CA4()
{
  unint64_t result = qword_10000C138;
  if (!qword_10000C138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C138);
  }
  return result;
}

unint64_t sub_100004CFC()
{
  unint64_t result = qword_10000C140;
  if (!qword_10000C140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C140);
  }
  return result;
}

uint64_t sub_100004D50(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100005FEC();
  unint64_t v5 = sub_100006094();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100004DBC()
{
  uint64_t v0 = qword_10000C038;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100004DFC()
{
  unint64_t result = qword_10000C148;
  if (!qword_10000C148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C148);
  }
  return result;
}

unint64_t sub_100004E54()
{
  unint64_t result = qword_10000C150;
  if (!qword_10000C150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C150);
  }
  return result;
}

uint64_t sub_100004EA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004EF8@<X0>(uint64_t a1@<X8>)
{
  return sub_100004F30(&qword_10000C010, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000D178, a1);
}

uint64_t sub_100004F30@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_1000060E8(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100004FD4()
{
  return 0;
}

uint64_t sub_100004FE0()
{
  return 1;
}

uint64_t sub_100004FF0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100005FEC();
  unint64_t v7 = sub_100006040();
  unint64_t v8 = sub_100006094();
  void *v5 = v2;
  v5[1] = sub_1000050C4;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_1000050C4()
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

uint64_t sub_1000051CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100005CC0();
  *a1 = result;
  return result;
}

uint64_t sub_1000051F4(uint64_t a1)
{
  unint64_t v2 = sub_100004CA4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenLegalAndRegulatoryDeepLinks()
{
  return &type metadata for OpenLegalAndRegulatoryDeepLinks;
}

unsigned char *initializeBufferWithCopyOfBuffer for LegalAndRegulatoryDestination(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_100005258(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100005260(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LegalAndRegulatoryDestination()
{
  return &type metadata for LegalAndRegulatoryDestination;
}

uint64_t _s28LegalAndRegulatoryAppIntents29LegalAndRegulatoryDestinationOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
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
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s28LegalAndRegulatoryAppIntents29LegalAndRegulatoryDestinationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *uint64_t result = a2 + 10;
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
        JUMPOUT(0x1000053D4);
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
          *uint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LegalAndRegulatoryDeepLinks()
{
  return &type metadata for LegalAndRegulatoryDeepLinks;
}

ValueMetadata *type metadata accessor for LegalAndRegulatoryDeepLinks.AvailableLegalAndRegulatoryDestinationQuery()
{
  return &type metadata for LegalAndRegulatoryDeepLinks.AvailableLegalAndRegulatoryDestinationQuery;
}

char *sub_10000541C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000545C(a1, a2, a3, *v3);
  char *v3 = result;
  return result;
}

char *sub_10000543C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100005548(a1, a2, a3, *v3);
  char *v3 = result;
  return result;
}

char *sub_10000545C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100005FA8(&qword_10000C1C8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

char *sub_100005548(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100005FA8(&qword_10000C1B8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_100005634()
{
  return _swift_task_switch(sub_100005650, 0, 0);
}

uint64_t sub_100005650()
{
  char v1 = sub_100005790((uint64_t)&off_1000087A8);
  int64_t v2 = v1[2];
  if (v2)
  {
    sub_10000541C(0, v2, 0);
    uint64_t v3 = 0;
    uint64_t v4 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v5 = *((unsigned char *)v1 + v3 + 32);
      unint64_t v6 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v4 + v3 >= v6 >> 1) {
        sub_10000541C((char *)(v6 > 1), v4 + v3 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v4 + v3 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v4 + v3++ + 32) = v5;
    }
    while (v2 != v3);
  }
  swift_bridgeObjectRelease();
  int64_t v7 = *(uint64_t (**)(void *))(v0 + 8);
  return v7(&_swiftEmptyArrayStorage);
}

void *sub_100005790(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    unint64_t v2 = 0;
    uint64_t v13 = a1 + 32;
LABEL_3:
    uint64_t v3 = 0;
    if (v2 <= v1) {
      unint64_t v4 = v1;
    }
    else {
      unint64_t v4 = v2;
    }
    unint64_t v5 = v2 - v4;
    unint64_t v6 = v1;
    uint64_t v7 = v13;
    while (2)
    {
      if (v5 + v3)
      {
        char v8 = *(unsigned char *)(v7 + v2);
        switch(v8)
        {
          case 6:
            if ((SFShouldShowRoHSCompliance() & 1) == 0) {
              goto LABEL_8;
            }
            goto LABEL_14;
          case 7:
            if (SFShouldShowBuiltInApps()) {
              goto LABEL_14;
            }
            goto LABEL_8;
          case 8:
          case 9:
          case 10:
            if ([self areAnySpeakersConfigured]) {
              goto LABEL_14;
            }
LABEL_8:
            ++v3;
            ++v7;
            if (v2 != --v6) {
              continue;
            }
            return &_swiftEmptyArrayStorage;
          default:
LABEL_14:
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              sub_10000543C(0, *((void *)&_swiftEmptyArrayStorage + 2) + 1, 1);
            }
            unint64_t v10 = *((void *)&_swiftEmptyArrayStorage + 2);
            unint64_t v9 = *((void *)&_swiftEmptyArrayStorage + 3);
            if (v10 >= v9 >> 1) {
              sub_10000543C((char *)(v9 > 1), v10 + 1, 1);
            }
            unint64_t v11 = v2 + 1;
            v2 += 1 + v3;
            *((void *)&_swiftEmptyArrayStorage + 2) = v10 + 1;
            *((unsigned char *)&_swiftEmptyArrayStorage + v10 + 32) = v8;
            if (v11 == v6) {
              return &_swiftEmptyArrayStorage;
            }
            goto LABEL_3;
        }
      }
      break;
    }
    __break(1u);
    JUMPOUT(0x100005914);
  }
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100005940(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100005960, 0, 0);
}

uint64_t sub_100005960()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  unint64_t v2 = sub_100005790(v1);
  swift_bridgeObjectRelease();
  int64_t v3 = v2[2];
  if (v3)
  {
    sub_10000541C(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v6 = *((unsigned char *)v2 + v4 + 32);
      unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v5 + v4 >= v7 >> 1) {
        sub_10000541C((char *)(v7 > 1), v5 + v4 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v5 + v4 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v5 + v4++ + 32) = v6;
    }
    while (v3 != v4);
  }
  swift_bridgeObjectRelease();
  char v8 = *(uint64_t (**)(void *))(v0 + 8);
  return v8(&_swiftEmptyArrayStorage);
}

uint64_t sub_100005AAC()
{
  return _swift_task_switch(sub_100005AC8, 0, 0);
}

uint64_t sub_100005AC8()
{
  uint64_t v1 = sub_100005790((uint64_t)&off_1000087A8);
  if (v1[2]) {
    uint64_t v2 = *((unsigned __int8 *)v1 + 32);
  }
  else {
    uint64_t v2 = 11;
  }
  swift_bridgeObjectRelease();
  int64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_100005B54()
{
  return _swift_task_switch(sub_100005B70, 0, 0);
}

uint64_t sub_100005B70()
{
  uint64_t v1 = 11;
  sub_10000541C(0, 11, 0);
  uint64_t v2 = &_swiftEmptyArrayStorage;
  unint64_t v3 = *((void *)&_swiftEmptyArrayStorage + 2);
  uint64_t v4 = &byte_1000087C8;
  do
  {
    char v6 = *v4++;
    char v5 = v6;
    uint64_t v10 = v2;
    unint64_t v7 = v2[3];
    if (v3 >= v7 >> 1)
    {
      sub_10000541C((char *)(v7 > 1), v3 + 1, 1);
      uint64_t v2 = v10;
    }
    v2[2] = v3 + 1;
    *((unsigned char *)v2 + v3++ + 32) = v5;
    --v1;
  }
  while (v1);
  char v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_100005C74(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000087D8;
  v6._object = a2;
  unint64_t v4 = sub_1000063D0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xB) {
    return 11;
  }
  else {
    return v4;
  }
}

uint64_t sub_100005CC0()
{
  uint64_t v17 = sub_1000062D0();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005FA8(&qword_10000C160);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  Swift::String v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  char v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_100005FA8(&qword_10000C168);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000063A0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100005FA8(&qword_10000C170);
  sub_100006390();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 11;
  uint64_t v14 = sub_100006230();
  v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_1000025B8();
  return sub_100006270();
}

uint64_t sub_100005FA8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005FEC()
{
  unint64_t result = qword_10000C178;
  if (!qword_10000C178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C178);
  }
  return result;
}

unint64_t sub_100006040()
{
  unint64_t result = qword_10000C180;
  if (!qword_10000C180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C180);
  }
  return result;
}

unint64_t sub_100006094()
{
  unint64_t result = qword_10000C188;
  if (!qword_10000C188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C188);
  }
  return result;
}

uint64_t sub_1000060E8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100006120(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006184(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_1000061A0()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_1000061B0()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_1000061D0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_1000061E0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000061F0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100006230()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100006240()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100006250()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006260()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100006270()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100006280()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100006290()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_1000062A0()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_1000062B0()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_1000062C0()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_1000062D0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_1000062E0()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_100006310()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100006320()
{
  return _EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_100006330(Swift::String a1)
{
}

uint64_t sub_100006340()
{
  return _EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100006350()
{
  return _EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_100006360()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100006370()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100006390()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_1000063A0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_1000063B0()
{
  return static AppExtension.main()();
}

uint64_t sub_1000063C0()
{
  return String.hash(into:)();
}

Swift::Int sub_1000063D0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_1000063E0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000063F0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006400()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t SFShouldShowBuiltInApps()
{
  return _SFShouldShowBuiltInApps();
}

uint64_t SFShouldShowRoHSCompliance()
{
  return _SFShouldShowRoHSCompliance();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
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