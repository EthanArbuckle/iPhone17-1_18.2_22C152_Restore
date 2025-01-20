uint64_t sub_1000028C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v0 = sub_100002F18(&qword_10000C038);
  v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002EC4();
  sub_100006490();
  v4 = sub_100006420();
  v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_100006490();
  v6 = sub_100006420();
  v5(v3, v0);
  sub_100006490();
  v7 = sub_100006420();
  v5(v3, v0);
  sub_100006490();
  v8 = sub_100006420();
  v5(v3, v0);
  sub_100002F18(&qword_10000C040);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1000068E0;
  *(void *)(v9 + 32) = v4;
  *(void *)(v9 + 40) = v6;
  *(void *)(v9 + 48) = v7;
  *(void *)(v9 + 56) = v8;
  v10 = sub_100006410();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100002B1C()
{
  uint64_t v0 = sub_100006480();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100002F5C();
  sub_100006400();
  swift_release();
  sub_100002EC4();
  sub_100006470();
  uint64_t v4 = sub_100006460();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100002F18(&qword_10000C028);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000068F0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100006450();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100002C84()
{
  return sub_1000063D0();
}

uint64_t sub_100002CA8()
{
  return sub_1000063E0();
}

uint64_t sub_100002CCC()
{
  uint64_t v0 = sub_100006440();
  sub_100002F18(&qword_10000C030);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1000068F0;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_100006430();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_100002D48()
{
  uint64_t v0 = sub_1000064C0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_1000057BC();
  sub_100002EC4();
  sub_1000064D0();
  uint64_t v4 = sub_1000064B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100002F18(&qword_10000C018);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000068F0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_1000064A0();
  swift_bridgeObjectRelease();
  return v6;
}

void *sub_100002EA8()
{
  return &_swiftEmptyArrayStorage;
}

ValueMetadata *type metadata accessor for StorageSettingsAssistantIntents()
{
  return &type metadata for StorageSettingsAssistantIntents;
}

unint64_t sub_100002EC4()
{
  unint64_t result = qword_10000C010;
  if (!qword_10000C010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C010);
  }
  return result;
}

uint64_t sub_100002F18(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100002F5C()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

uint64_t sub_100002FB0(uint64_t a1)
{
  unint64_t v2 = sub_100003104();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000305C()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

uint64_t sub_1000030B4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100003104()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

ValueMetadata *type metadata accessor for StorageSettingsIntentsExtensionExtension()
{
  return &type metadata for StorageSettingsIntentsExtensionExtension;
}

uint64_t sub_100003168()
{
  return sub_1000063D0();
}

uint64_t sub_100003190()
{
  return 1;
}

unint64_t sub_10000319C()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

Swift::Int sub_1000031F0()
{
  return sub_1000066E0();
}

uint64_t sub_100003240()
{
  return sub_1000066B0();
}

Swift::Int sub_100003254()
{
  return sub_1000066E0();
}

uint64_t sub_1000032A0@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  v3 = (void *)a1[1];
  v4._rawValue = &off_100008868;
  v7._object = v3;
  Swift::Int v5 = sub_1000066C0(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_1000032F4(void *a1@<X8>)
{
  *a1 = 0x746F6F7223;
  a1[1] = 0xE500000000000000;
}

uint64_t sub_10000330C()
{
  return sub_100004B80(&qword_10000C070, &qword_10000C078);
}

uint64_t sub_100003348(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100003390(void *a1@<X8>)
{
  *a1 = &off_1000088A0;
}

uint64_t sub_1000033A0()
{
  return 0x746F6F7223;
}

uint64_t sub_1000033B4@<X0>(uint64_t a1@<X0>, void *a2@<X1>, BOOL *a3@<X8>)
{
  swift_bridgeObjectRetain();
  v6._rawValue = &off_1000088C8;
  v9._countAndFlagsBits = a1;
  v9._object = a2;
  Swift::Int v7 = sub_1000066C0(v6, v9);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v7 != 0;
  return result;
}

unint64_t sub_10000341C()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

uint64_t sub_100003470()
{
  uint64_t v0 = sub_100002F18(&qword_10000C178);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1000065C0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  Swift::Int v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006600();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_100006680();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_1000065D0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_1000065A0();
  sub_100005DD8(v10, qword_10000D1F0);
  sub_100005DA0(v10, (uint64_t)qword_10000D1F0);
  sub_100006620();
  sub_1000065F0();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_1000065E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_100006590();
}

void sub_100003754(uint64_t a1@<X8>)
{
  uint64_t v32 = a1;
  uint64_t v1 = sub_100002F18(&qword_10000C1A0);
  __chkstk_darwin(v1 - 8);
  v31 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100002F18(&qword_10000C178);
  __chkstk_darwin(v3 - 8);
  v30 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000065C0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006600();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = sub_100006680();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_100006660();
  __chkstk_darwin(v11 - 8);
  uint64_t v29 = sub_1000065D0();
  uint64_t v12 = *(void *)(v29 - 8);
  uint64_t v13 = __chkstk_darwin(v29);
  v28 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v33 = (char *)&v27 - v15;
  NSString v16 = sub_100006690();
  v17 = (void *)MGGetStringAnswer();

  if (v17)
  {
    uint64_t v18 = sub_1000066A0();
    v20 = v19;

    sub_100006650();
    v34._countAndFlagsBits = 0;
    v34._object = (void *)0xE000000000000000;
    sub_100006640(v34);
    v35._countAndFlagsBits = v18;
    v35._object = v20;
    sub_100006630(v35);
    swift_bridgeObjectRelease();
    v36._countAndFlagsBits = 0xD00000000000001ELL;
    v36._object = (void *)0x8000000100007350;
    sub_100006640(v36);
    sub_100006670();
    sub_1000065F0();
    uint64_t v21 = enum case for LocalizedStringResource.BundleDescription.main(_:);
    v22 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
    v22(v8, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
    sub_1000065E0();
    sub_100002F18(&qword_10000C1A8);
    uint64_t v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_100006A70;
    sub_100006620();
    sub_1000065F0();
    v22(v8, v21, v5);
    sub_1000065E0();
    sub_100006620();
    sub_1000065F0();
    v22(v8, v21, v5);
    sub_1000065E0();
    uint64_t v23 = v29;
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v28, v33, v29);
    sub_100006620();
    sub_1000065F0();
    v22(v8, v21, v5);
    v24 = v30;
    sub_1000065E0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v24, 0, 1, v23);
    v25 = v31;
    sub_1000064E0();
    uint64_t v26 = sub_1000064F0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v25, 0, 1, v26);
    sub_100006500();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v33, v23);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100003DBC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10000C1D8 + dword_10000C1D8);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100003E60;
  return v4();
}

uint64_t sub_100003E60(uint64_t a1)
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

unint64_t sub_100003F78()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

unint64_t sub_100003FD0()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

unint64_t sub_100004028()
{
  unint64_t result = qword_10000C0A0[0];
  if (!qword_10000C0A0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C0A0);
  }
  return result;
}

uint64_t sub_10000407C(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_10000C1D0 + dword_10000C1D0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100004124;
  return v5(a1);
}

uint64_t sub_100004124(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100004224(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10000C1C0 + dword_10000C1C0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1000062FC;
  return v4();
}

unint64_t sub_1000042CC()
{
  unint64_t result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }
  return result;
}

unint64_t sub_100004328()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    sub_100003348(qword_10000C0C8);
    sub_100002F5C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

uint64_t sub_10000439C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000341C();
  *uint64_t v5 = v2;
  v5[1] = sub_100004450;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100004450()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100004544(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10000C1B0 + dword_10000C1B0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1000045E8;
  return v4();
}

uint64_t sub_1000045E8(char a1)
{
  uint64_t v3 = *(unsigned char **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  unsigned char *v3 = a1 & 1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

unint64_t sub_100004708()
{
  unint64_t result = qword_10000C0E0;
  if (!qword_10000C0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E0);
  }
  return result;
}

uint64_t sub_10000475C(uint64_t a1)
{
  unint64_t v2 = sub_100004028();

  return EntityURLRepresentation.init(stringLiteral:)(0xD00000000000003DLL, 0x8000000100007440, a1, v2);
}

unint64_t sub_1000047BC()
{
  unint64_t result = qword_10000C0E8;
  if (!qword_10000C0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E8);
  }
  return result;
}

unint64_t sub_100004814()
{
  unint64_t result = qword_10000C0F0;
  if (!qword_10000C0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0F0);
  }
  return result;
}

unint64_t sub_10000486C()
{
  unint64_t result = qword_10000C0F8;
  if (!qword_10000C0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0F8);
  }
  return result;
}

unint64_t sub_1000048C4()
{
  unint64_t result = qword_10000C100;
  if (!qword_10000C100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C100);
  }
  return result;
}

uint64_t sub_100004918()
{
  sub_100005D4C();
  uint64_t v2 = sub_100006530();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100005E3C(v3, v0, v2, v1);
}

unint64_t sub_1000049B0()
{
  unint64_t result = qword_10000C110;
  if (!qword_10000C110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C110);
  }
  return result;
}

unint64_t sub_100004A08()
{
  unint64_t result = qword_10000C118;
  if (!qword_10000C118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C118);
  }
  return result;
}

unint64_t sub_100004A60()
{
  unint64_t result = qword_10000C120;
  if (!qword_10000C120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C120);
  }
  return result;
}

unint64_t sub_100004AB8()
{
  unint64_t result = qword_10000C128;
  if (!qword_10000C128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C128);
  }
  return result;
}

uint64_t sub_100004B0C@<X0>(uint64_t a1@<X8>)
{
  return sub_100005228(&qword_10000C000, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000D1F0, a1);
}

uint64_t sub_100004B44()
{
  return sub_100004B80(&qword_10000C130, &qword_10000C138);
}

uint64_t sub_100004B80(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003348(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100004BC4(uint64_t a1)
{
  unint64_t v2 = sub_100004028();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100004C14()
{
  unint64_t result = qword_10000C140;
  if (!qword_10000C140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C140);
  }
  return result;
}

uint64_t sub_100004C6C(uint64_t a1)
{
  unint64_t v2 = sub_100004A60();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100004CBC()
{
  unint64_t result = qword_10000C148;
  if (!qword_10000C148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C148);
  }
  return result;
}

uint64_t sub_100004D10()
{
  uint64_t v0 = sub_1000065C0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006600();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_100006680();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_1000065D0();
  sub_100005DD8(v6, qword_10000D208);
  sub_100005DA0(v6, (uint64_t)qword_10000D208);
  sub_100006620();
  sub_1000065F0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_1000065E0();
}

uint64_t sub_100004EFC()
{
  return sub_1000063D0();
}

uint64_t sub_100004F20()
{
  return sub_1000063E0();
}

void (*sub_100004F44(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1000063C0();
  return sub_100004FA0;
}

void sub_100004FA0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_100004FF0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100005CA4();
  unint64_t v5 = sub_100005D4C();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_10000505C()
{
  uint64_t v0 = qword_10000C058;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10000509C()
{
  unint64_t result = qword_10000C150;
  if (!qword_10000C150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C150);
  }
  return result;
}

unint64_t sub_1000050F4()
{
  unint64_t result = qword_10000C158;
  if (!qword_10000C158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C158);
  }
  return result;
}

unint64_t sub_10000514C()
{
  unint64_t result = qword_10000C160;
  if (!qword_10000C160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C160);
  }
  return result;
}

uint64_t sub_1000051A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000051F0@<X0>(uint64_t a1@<X8>)
{
  return sub_100005228(&qword_10000C008, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000D208, a1);
}

uint64_t sub_100005228@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100005DA0(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_1000052CC()
{
  return 0;
}

uint64_t sub_1000052E0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100005CA4();
  unint64_t v6 = sub_100005CF8();
  unint64_t v7 = sub_100005D4C();
  *unint64_t v4 = v2;
  v4[1] = sub_1000053AC;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_1000053AC()
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

uint64_t sub_1000054B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000057BC();
  *a1 = result;
  return result;
}

uint64_t sub_1000054DC(uint64_t a1)
{
  unint64_t v2 = sub_100002EC4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for StorageUIAppIntentsPackage()
{
  return &type metadata for StorageUIAppIntentsPackage;
}

ValueMetadata *type metadata accessor for OpenStorageSettingsDeeplinks()
{
  return &type metadata for OpenStorageSettingsDeeplinks;
}

ValueMetadata *type metadata accessor for StorageSettingsDeeplinks()
{
  return &type metadata for StorageSettingsDeeplinks;
}

ValueMetadata *type metadata accessor for StorageSettingsDeeplinks.StorageSettingsDeeplinksQuery()
{
  return &type metadata for StorageSettingsDeeplinks.StorageSettingsDeeplinksQuery;
}

uint64_t getEnumTagSinglePayload for StorageSettingsDynamicDestination(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for StorageSettingsDynamicDestination(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10000564CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for StorageSettingsDynamicDestination()
{
  return &type metadata for StorageSettingsDynamicDestination;
}

char *sub_100005684(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000056D4(a1, a2, a3, *v3, &qword_10000C1C8);
  char *v3 = result;
  return result;
}

char *sub_1000056AC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000056D4(a1, a2, a3, *v3, &qword_10000C1B8);
  char *v3 = result;
  return result;
}

char *sub_1000056D4(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  int64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    int64_t v10 = *((void *)a4 + 2);
  }
  else {
    int64_t v10 = v8;
  }
  if (v10)
  {
    sub_100002F18(a5);
    uint64_t v11 = (char *)swift_allocObject();
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v13 >= &v14[v9]) {
      memmove(v13, v14, v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v9);
  }
  swift_release();
  return v11;
}

uint64_t sub_1000057BC()
{
  uint64_t v0 = sub_100006570();
  uint64_t v26 = *(void *)(v0 - 8);
  uint64_t v27 = v0;
  ((void (*)(void))__chkstk_darwin)();
  v25 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002F18(&qword_10000C170);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v24 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v23 = (char *)&v21 - v4;
  uint64_t v5 = sub_100002F18(&qword_10000C178);
  __chkstk_darwin(v5 - 8);
  v22 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000065C0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  int64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100006600();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_100006680();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_1000065D0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v21 = sub_100002F18(&qword_10000C180);
  sub_100006620();
  sub_1000065F0();
  uint64_t v15 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  NSString v16 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 104);
  v16(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  sub_1000065E0();
  sub_100006620();
  sub_1000065F0();
  v16(v10, v15, v7);
  v17 = v22;
  sub_1000065E0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v13);
  char v28 = 1;
  uint64_t v18 = sub_1000063B0();
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v23, 1, 1, v18);
  v19(v24, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v26 + 104))(v25, enum case for InputConnectionBehavior.default(_:), v27);
  sub_100004028();
  return sub_1000063F0();
}

unint64_t sub_100005CA4()
{
  unint64_t result = qword_10000C188;
  if (!qword_10000C188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C188);
  }
  return result;
}

unint64_t sub_100005CF8()
{
  unint64_t result = qword_10000C190;
  if (!qword_10000C190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C190);
  }
  return result;
}

unint64_t sub_100005D4C()
{
  unint64_t result = qword_10000C198;
  if (!qword_10000C198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C198);
  }
  return result;
}

uint64_t sub_100005DA0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100005DD8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100005E3C(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100005E50()
{
  return _swift_task_switch(sub_100005E6C, 0, 0);
}

uint64_t sub_100005E6C()
{
  int64_t v1 = sub_100005F84((uint64_t)&off_100008900)[2];
  if (v1)
  {
    sub_100005684(0, v1, 0);
    unint64_t v2 = _swiftEmptyArrayStorage[2];
    do
    {
      unint64_t v3 = _swiftEmptyArrayStorage[3];
      unint64_t v4 = v2 + 1;
      if (v2 >= v3 >> 1) {
        sub_100005684((char *)(v3 > 1), v2 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v4;
      unint64_t v2 = v4;
      --v1;
    }
    while (v1);
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = *(uint64_t (**)(void *))(v0 + 8);
  return v5(_swiftEmptyArrayStorage);
}

void *sub_100005F84(uint64_t a1)
{
  for (uint64_t i = *(void *)(a1 + 16); i; --i)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_1000056AC(0, _swiftEmptyArrayStorage[2] + 1, 1);
    }
    unint64_t v3 = _swiftEmptyArrayStorage[2];
    unint64_t v2 = _swiftEmptyArrayStorage[3];
    unint64_t v4 = v3 + 1;
    if (v3 >= v2 >> 1) {
      sub_1000056AC((char *)(v2 > 1), v3 + 1, 1);
    }
    _swiftEmptyArrayStorage[2] = v4;
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100006040(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100006060, 0, 0);
}

uint64_t sub_100006060()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  unint64_t v2 = sub_100005F84(v1);
  swift_bridgeObjectRelease();
  int64_t v3 = v2[2];
  if (v3)
  {
    sub_100005684(0, v3, 0);
    unint64_t v4 = _swiftEmptyArrayStorage[2];
    do
    {
      unint64_t v5 = _swiftEmptyArrayStorage[3];
      unint64_t v6 = v4 + 1;
      if (v4 >= v5 >> 1) {
        sub_100005684((char *)(v5 > 1), v4 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v6;
      unint64_t v4 = v6;
      --v3;
    }
    while (v3);
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = *(uint64_t (**)(void *))(v0 + 8);
  return v7(_swiftEmptyArrayStorage);
}

uint64_t sub_100006184()
{
  return _swift_task_switch(sub_1000061A0, 0, 0);
}

uint64_t sub_1000061A0()
{
  uint64_t v1 = sub_100005F84((uint64_t)&off_100008928)[2];
  swift_bridgeObjectRelease();
  unint64_t v2 = *(uint64_t (**)(BOOL))(v0 + 8);
  return v2(v1 == 0);
}

uint64_t sub_100006224()
{
  return _swift_task_switch(sub_100006240, 0, 0);
}

uint64_t sub_100006240()
{
  sub_100005684(0, 1, 0);
  unint64_t v2 = *((void *)&_swiftEmptyArrayStorage + 2);
  unint64_t v1 = *((void *)&_swiftEmptyArrayStorage + 3);
  unint64_t v3 = v2 + 1;
  if (v2 >= v1 >> 1) {
    sub_100005684((char *)(v1 > 1), v2 + 1, 1);
  }
  *((void *)&_swiftEmptyArrayStorage + 2) = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100006300()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100006310()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100006320()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100006340()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100006350()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100006360()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100006380()
{
  return static AppIntentsPackage.includedPackages.getter();
}

uint64_t sub_1000063B0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_1000063C0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_1000063D0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_1000063E0()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_1000063F0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100006400()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_100006410()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100006420()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_100006430()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_100006440()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_100006450()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_100006460()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_100006470()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_100006480()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_100006490()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t sub_1000064A0()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_1000064B0()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_1000064C0()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_1000064D0()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_1000064E0()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_1000064F0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100006500()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:)();
}

uint64_t sub_100006510()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_100006520()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_100006530()
{
  return URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_100006570()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100006580()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100006590()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_1000065A0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_1000065C0()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_1000065D0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_1000065E0()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_1000065F0()
{
  return static Locale.current.getter();
}

uint64_t sub_100006600()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100006610()
{
  return static AppExtension.main()();
}

uint64_t sub_100006620()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

void sub_100006630(Swift::String a1)
{
}

void sub_100006640(Swift::String a1)
{
}

uint64_t sub_100006650()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100006660()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t sub_100006670()
{
  return String.LocalizationValue.init(stringInterpolation:)();
}

uint64_t sub_100006680()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_100006690()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000066A0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000066B0()
{
  return String.hash(into:)();
}

Swift::Int sub_1000066C0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_1000066D0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1000066E0()
{
  return Hasher._finalize()();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
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