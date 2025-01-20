uint64_t sub_10000204C()
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
  uint64_t v10;

  v0 = sub_1000026C0(&qword_100010148);
  v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002618();
  sub_100008C00();
  v4 = sub_100008BE0();
  v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_100008C00();
  v6 = sub_100008BE0();
  v5(v3, v0);
  sub_1000026C0(&qword_100010150);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100009170;
  *(void *)(v7 + 32) = v4;
  *(void *)(v7 + 40) = v6;
  v8 = sub_100008BD0();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_100002204()
{
  uint64_t v0 = sub_1000026C0(&qword_100010138);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000266C();
  sub_100008C00();
  uint64_t v4 = sub_100008BE0();
  v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_100008C00();
  uint64_t v6 = sub_100008BE0();
  v5(v3, v0);
  sub_1000026C0(&qword_100010140);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100009170;
  *(void *)(v7 + 32) = v4;
  *(void *)(v7 + 40) = v6;
  uint64_t v8 = sub_100008BD0();
  swift_bridgeObjectRelease();
  return v8;
}

void sub_1000023B8()
{
  qword_1000105A0 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_1000023D4()
{
  if (qword_1000100D0 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for TransparencyAssistantIntents()
{
  return &type metadata for TransparencyAssistantIntents;
}

uint64_t sub_100002440()
{
  uint64_t v0 = sub_100008C30();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000048B8();
  sub_100002618();
  sub_100008C40();
  uint64_t v4 = sub_100008C20();
  v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  uint64_t v11 = sub_1000067C8();
  sub_10000266C();
  sub_100008C40();
  uint64_t v6 = sub_100008C20();
  v5(v3, v0);
  sub_1000026C0(&qword_100010130);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100009170;
  *(void *)(v7 + 32) = v4;
  *(void *)(v7 + 40) = v6;
  uint64_t v8 = sub_100008C10();
  swift_bridgeObjectRelease();
  return v8;
}

unint64_t sub_100002618()
{
  unint64_t result = qword_100010120;
  if (!qword_100010120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010120);
  }
  return result;
}

unint64_t sub_10000266C()
{
  unint64_t result = qword_100010128;
  if (!qword_100010128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010128);
  }
  return result;
}

uint64_t sub_1000026C0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000270C()
{
  unint64_t result = qword_100010190;
  if (!qword_100010190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010190);
  }
  return result;
}

unint64_t sub_100002764()
{
  unint64_t result = qword_100010198;
  if (!qword_100010198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010198);
  }
  return result;
}

uint64_t sub_1000027B8()
{
  uint64_t v0 = sub_100008DC0();
  sub_100004CD0(v0, qword_100010158);
  sub_100004C98(v0, (uint64_t)qword_100010158);
  return sub_100008DB0();
}

uint64_t sub_10000283C()
{
  uint64_t v0 = sub_1000026C0(&qword_1000102C8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000026C0(&qword_1000102A0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100008D80();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  sub_100008D70();
  sub_100008D70();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_100008C80();
  uint64_t v9 = sub_100008C90();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v2, 0, 1, v9);
  sub_1000026C0(&qword_1000102D0);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100009200;
  sub_100008D70();
  sub_100008D70();
  return sub_100008CA0();
}

uint64_t sub_100002AF0()
{
  uint64_t v0 = sub_1000026C0(&qword_1000102A0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008D80();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_100008D50();
  sub_100004CD0(v5, qword_1000105A8);
  sub_100004C98(v5, (uint64_t)qword_1000105A8);
  sub_100008D70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_100008D40();
}

uint64_t sub_100002C5C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_100008D80();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100002CEC, 0, 0);
}

uint64_t sub_100002CEC()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_1000026C0(&qword_1000102D8);
  sub_100008D70();
  sub_100004D48(&qword_1000102E8, &qword_1000102F0);
  *uint64_t v1 = sub_100008B80();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_100002DE0()
{
  unint64_t result = qword_1000101A8;
  if (!qword_1000101A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101A8);
  }
  return result;
}

uint64_t sub_100002E34(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100003740();
  *uint64_t v4 = v2;
  v4[1] = sub_100002EE4;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_100002EE4(uint64_t a1)
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

unint64_t sub_100002FFC()
{
  unint64_t result = qword_1000101B8;
  if (!qword_1000101B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101B8);
  }
  return result;
}

unint64_t sub_100003054()
{
  unint64_t result = qword_1000101C0;
  if (!qword_1000101C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101C0);
  }
  return result;
}

unint64_t sub_1000030AC()
{
  unint64_t result = qword_1000101C8[0];
  if (!qword_1000101C8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000101C8);
  }
  return result;
}

uint64_t sub_100003104(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100003740();
  void *v5 = v2;
  v5[1] = sub_1000031B8;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000031B8(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_1000032B8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100003740();
  *uint64_t v4 = v2;
  v4[1] = sub_100004D8C;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10000336C()
{
  unint64_t result = qword_1000101E0;
  if (!qword_1000101E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101E0);
  }
  return result;
}

unint64_t sub_1000033C4()
{
  unint64_t result = qword_1000101E8;
  if (!qword_1000101E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101E8);
  }
  return result;
}

unint64_t sub_10000341C()
{
  unint64_t result = qword_1000101F0;
  if (!qword_1000101F0)
  {
    sub_100003490(qword_1000101F8);
    sub_1000033C4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101F0);
  }
  return result;
}

uint64_t sub_100003490(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000034D8(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100002DE0();
  void *v5 = v2;
  v5[1] = sub_10000358C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10000358C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100003680(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10000358C;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

unint64_t sub_100003740()
{
  unint64_t result = qword_100010210;
  if (!qword_100010210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010210);
  }
  return result;
}

uint64_t sub_100003794()
{
  uint64_t v0 = qword_100010170;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_1000037D0()
{
  unint64_t result = qword_100010218;
  if (!qword_100010218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010218);
  }
  return result;
}

uint64_t sub_100003824(uint64_t a1)
{
  unint64_t v2 = sub_1000030AC();

  return _EntityURLRepresentation.init(stringLiteral:)(0xD000000000000042, 0x800000010000AC90, a1, v2);
}

unint64_t sub_100003884()
{
  unint64_t result = qword_100010220;
  if (!qword_100010220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010220);
  }
  return result;
}

unint64_t sub_1000038DC()
{
  unint64_t result = qword_100010228;
  if (!qword_100010228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010228);
  }
  return result;
}

unint64_t sub_100003934()
{
  unint64_t result = qword_100010230;
  if (!qword_100010230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010230);
  }
  return result;
}

void *sub_100003988()
{
  return &protocol witness table for String;
}

uint64_t sub_100003994()
{
  sub_100004C44();
  uint64_t v2 = sub_100008CF0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100004D34(v3, v0, v2, v1);
}

unint64_t sub_100003A2C()
{
  unint64_t result = qword_100010240;
  if (!qword_100010240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010240);
  }
  return result;
}

unint64_t sub_100003A84()
{
  unint64_t result = qword_100010248;
  if (!qword_100010248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010248);
  }
  return result;
}

unint64_t sub_100003ADC()
{
  unint64_t result = qword_100010250;
  if (!qword_100010250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010250);
  }
  return result;
}

void *sub_100003B30()
{
  return &protocol witness table for String;
}

uint64_t sub_100003B3C@<X0>(uint64_t *a1@<X8>)
{
  sub_100002764();
  uint64_t result = sub_100008B70();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100003B7C@<X0>(uint64_t a1@<X8>)
{
  return sub_100004108(&qword_1000100E0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_1000105A8, a1);
}

uint64_t sub_100003BB4()
{
  return sub_100004D48(&qword_100010258, &qword_100010260);
}

uint64_t sub_100003BF0(uint64_t a1)
{
  unint64_t v2 = sub_1000030AC();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100003C40()
{
  unint64_t result = qword_100010268;
  if (!qword_100010268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010268);
  }
  return result;
}

uint64_t sub_100003C98(uint64_t a1)
{
  unint64_t v2 = sub_100003ADC();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100003CE8()
{
  unint64_t result = qword_100010270;
  if (!qword_100010270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010270);
  }
  return result;
}

uint64_t sub_100003D3C()
{
  uint64_t v0 = sub_100008D80();
  sub_100004CD0(v0, qword_1000105C0);
  sub_100004C98(v0, (uint64_t)qword_1000105C0);
  return sub_100008D70();
}

uint64_t sub_100003DA0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100008BA0();
  *a1 = v3;
  return result;
}

uint64_t sub_100003DDC()
{
  return swift_release();
}

void (*sub_100003E24(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100008B90();
  return sub_100003E80;
}

void sub_100003E80(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100003ED4()
{
  unint64_t result = qword_100010278;
  if (!qword_100010278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010278);
  }
  return result;
}

uint64_t sub_100003F28(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100004B9C();
  unint64_t v5 = sub_100004C44();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100003F94()
{
  uint64_t v0 = qword_100010180;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100003FD4()
{
  unint64_t result = qword_100010280;
  if (!qword_100010280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010280);
  }
  return result;
}

unint64_t sub_10000402C()
{
  unint64_t result = qword_100010288;
  if (!qword_100010288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010288);
  }
  return result;
}

uint64_t sub_100004080()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000040D0@<X0>(uint64_t a1@<X8>)
{
  return sub_100004108(&qword_1000100E8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000105C0, a1);
}

uint64_t sub_100004108@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100004C98(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_1000041AC()
{
  return 0;
}

uint64_t sub_1000041B8()
{
  return 1;
}

uint64_t sub_1000041C8(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100004B9C();
  unint64_t v7 = sub_100004BF0();
  unint64_t v8 = sub_100004C44();
  void *v5 = v2;
  v5[1] = sub_10000429C;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_10000429C()
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

uint64_t sub_1000043A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000048B8();
  *a1 = result;
  return result;
}

uint64_t sub_1000043CC(uint64_t a1)
{
  unint64_t v2 = sub_100002618();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenTransparencyStatusDeepLink()
{
  return &type metadata for OpenTransparencyStatusDeepLink;
}

ValueMetadata *type metadata accessor for TransparencyStatusEntity()
{
  return &type metadata for TransparencyStatusEntity;
}

ValueMetadata *type metadata accessor for TransparencyStatusEntity.TransparencyStatusEntityQuery()
{
  return &type metadata for TransparencyStatusEntity.TransparencyStatusEntityQuery;
}

uint64_t sub_100004438(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_100004458, 0, 0);
}

uint64_t sub_100004458()
{
  if (qword_1000100D8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100008DC0();
  *(void *)(v0 + 32) = sub_100004C98(v1, (uint64_t)qword_100010158);
  unint64_t v2 = sub_100008DA0();
  os_log_type_t v3 = sub_100008E00();
  if (os_log_type_enabled(v2, v3))
  {
    unint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "getting Contact Key Verification Status...", v4, 2u);
    swift_slowDealloc();
  }

  if (qword_100010110 != -1) {
    swift_once();
  }
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v5;
  void *v5 = v0;
  v5[1] = sub_1000045DC;
  return sub_100006D38();
}

uint64_t sub_1000045DC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)*v3;
  v4[6] = a1;
  v4[7] = a2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v5 = (uint64_t (*)(void))v4[1];
    return v5();
  }
  else
  {
    return _swift_task_switch(sub_100004710, 0, 0);
  }
}

uint64_t sub_100004710()
{
  uint64_t v11 = v0;
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_100008DA0();
  os_log_type_t v2 = sub_100008E00();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v4 = v0[6];
    unint64_t v3 = v0[7];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_bridgeObjectRetain();
    v0[2] = sub_100007CC4(v4, v3, &v10);
    sub_100008E30();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "returning Contact Key Verification Status: %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v6 = v0[7];
  uint64_t v7 = (void *)v0[3];
  *uint64_t v7 = v0[6];
  v7[1] = v6;
  unint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_1000048B8()
{
  v16[0] = sub_100008CE0();
  uint64_t v0 = *(void *)(v16[0] - 8);
  ((void (*)(void))__chkstk_darwin)();
  os_log_type_t v2 = (char *)v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000026C0(&qword_100010298);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)v16 - v6;
  uint64_t v8 = sub_1000026C0(&qword_1000102A0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100008D80();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_1000026C0(&qword_1000102A8);
  sub_100008D70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  v16[1] = 0;
  uint64_t v13 = sub_100008B50();
  v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v16[0]);
  sub_1000030AC();
  return sub_100008BC0();
}

unint64_t sub_100004B9C()
{
  unint64_t result = qword_1000102B0;
  if (!qword_1000102B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000102B0);
  }
  return result;
}

unint64_t sub_100004BF0()
{
  unint64_t result = qword_1000102B8;
  if (!qword_1000102B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000102B8);
  }
  return result;
}

unint64_t sub_100004C44()
{
  unint64_t result = qword_1000102C0;
  if (!qword_1000102C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000102C0);
  }
  return result;
}

uint64_t sub_100004C98(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100004CD0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100004D34(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100004D48(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003490(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100004D94()
{
  unint64_t result = qword_100010330;
  if (!qword_100010330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010330);
  }
  return result;
}

unint64_t sub_100004DEC()
{
  unint64_t result = qword_100010338;
  if (!qword_100010338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010338);
  }
  return result;
}

uint64_t sub_100004E40()
{
  uint64_t v0 = sub_100008DC0();
  sub_100004CD0(v0, qword_1000102F8);
  sub_100004C98(v0, (uint64_t)qword_1000102F8);
  return sub_100008DB0();
}

uint64_t sub_100004EC0()
{
  uint64_t v0 = sub_1000026C0(&qword_1000102C8);
  __chkstk_darwin(v0 - 8);
  os_log_type_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000026C0(&qword_1000102A0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100008D80();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  sub_100008D70();
  sub_100008D70();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_100008C80();
  uint64_t v9 = sub_100008C90();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v2, 0, 1, v9);
  sub_1000026C0(&qword_1000102D0);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100009200;
  sub_100008D70();
  sub_100008D70();
  return sub_100008CA0();
}

uint64_t sub_100005174()
{
  uint64_t v0 = sub_1000026C0(&qword_1000102A0);
  __chkstk_darwin(v0 - 8);
  os_log_type_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008D80();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_100008D50();
  sub_100004CD0(v5, qword_1000105D8);
  sub_100004C98(v5, (uint64_t)qword_1000105D8);
  sub_100008D70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_100008D40();
}

uint64_t sub_1000052E0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_100008D80();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100005370, 0, 0);
}

uint64_t sub_100005370()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_1000026C0(&qword_100010450);
  sub_100008D70();
  sub_100004D48(&qword_100010460, &qword_100010468);
  *uint64_t v1 = sub_100008B80();
  swift_task_dealloc();
  os_log_type_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_100005464()
{
  unint64_t result = qword_100010348;
  if (!qword_100010348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010348);
  }
  return result;
}

uint64_t sub_1000054B8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000059B4();
  *uint64_t v4 = v2;
  v4[1] = sub_100002EE4;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10000556C()
{
  unint64_t result = qword_100010358;
  if (!qword_100010358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010358);
  }
  return result;
}

unint64_t sub_1000055C4()
{
  unint64_t result = qword_100010360;
  if (!qword_100010360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010360);
  }
  return result;
}

unint64_t sub_10000561C()
{
  unint64_t result = qword_100010368[0];
  if (!qword_100010368[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100010368);
  }
  return result;
}

uint64_t sub_100005670(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000059B4();
  void *v5 = v2;
  v5[1] = sub_1000031B8;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100005724(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000059B4();
  *uint64_t v4 = v2;
  v4[1] = sub_100004D8C;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_1000057D8()
{
  unint64_t result = qword_100010380;
  if (!qword_100010380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010380);
  }
  return result;
}

unint64_t sub_100005830()
{
  unint64_t result = qword_100010388;
  if (!qword_100010388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010388);
  }
  return result;
}

unint64_t sub_100005888()
{
  unint64_t result = qword_100010390;
  if (!qword_100010390)
  {
    sub_100003490(qword_100010398);
    sub_100005830();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010390);
  }
  return result;
}

uint64_t sub_1000058FC(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100005464();
  void *v5 = v2;
  v5[1] = sub_10000358C;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_1000059B4()
{
  unint64_t result = qword_1000103B0;
  if (!qword_1000103B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000103B0);
  }
  return result;
}

uint64_t sub_100005A08()
{
  uint64_t v0 = qword_100010310;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100005A44()
{
  unint64_t result = qword_1000103B8;
  if (!qword_1000103B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000103B8);
  }
  return result;
}

uint64_t sub_100005A98(uint64_t a1)
{
  unint64_t v2 = sub_10000561C();

  return _EntityURLRepresentation.init(stringLiteral:)(0xD000000000000042, 0x800000010000AC90, a1, v2);
}

unint64_t sub_100005AF8()
{
  unint64_t result = qword_1000103C0;
  if (!qword_1000103C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000103C0);
  }
  return result;
}

unint64_t sub_100005B50()
{
  unint64_t result = qword_1000103C8;
  if (!qword_1000103C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000103C8);
  }
  return result;
}

unint64_t sub_100005BA8()
{
  unint64_t result = qword_1000103D0;
  if (!qword_1000103D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000103D0);
  }
  return result;
}

uint64_t sub_100005BFC()
{
  sub_100006B54();
  uint64_t v2 = sub_100008CF0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100004D34(v3, v0, v2, v1);
}

unint64_t sub_100005C94()
{
  unint64_t result = qword_1000103E0;
  if (!qword_1000103E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000103E0);
  }
  return result;
}

unint64_t sub_100005CEC()
{
  unint64_t result = qword_1000103E8;
  if (!qword_1000103E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000103E8);
  }
  return result;
}

unint64_t sub_100005D48()
{
  unint64_t result = qword_1000103F0;
  if (!qword_1000103F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000103F0);
  }
  return result;
}

uint64_t sub_100005D9C@<X0>(uint64_t *a1@<X8>)
{
  sub_100004DEC();
  uint64_t result = sub_100008B70();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100005DDC@<X0>(uint64_t a1@<X8>)
{
  return sub_100004108(&qword_1000100F8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_1000105D8, a1);
}

uint64_t sub_100005E14()
{
  return sub_100004D48(&qword_1000103F8, &qword_100010400);
}

uint64_t sub_100005E50(uint64_t a1)
{
  unint64_t v2 = sub_10000561C();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100005EA0()
{
  unint64_t result = qword_100010408;
  if (!qword_100010408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010408);
  }
  return result;
}

uint64_t sub_100005EF8(uint64_t a1)
{
  unint64_t v2 = sub_100005D48();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100005F48()
{
  unint64_t result = qword_100010410;
  if (!qword_100010410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010410);
  }
  return result;
}

uint64_t sub_100005FA0()
{
  uint64_t v0 = sub_100008D80();
  sub_100004CD0(v0, qword_1000105F0);
  sub_100004C98(v0, (uint64_t)qword_1000105F0);
  return sub_100008D70();
}

uint64_t sub_100006008(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100006AAC();
  unint64_t v5 = sub_100006B54();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100006070()
{
  uint64_t v0 = qword_100010320;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_1000060AC()
{
  unint64_t result = qword_100010418;
  if (!qword_100010418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010418);
  }
  return result;
}

unint64_t sub_100006104()
{
  unint64_t result = qword_100010420;
  if (!qword_100010420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010420);
  }
  return result;
}

uint64_t sub_100006158()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000061A8@<X0>(uint64_t a1@<X8>)
{
  return sub_100004108(&qword_100010100, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000105F0, a1);
}

uint64_t sub_1000061E0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100006AAC();
  unint64_t v7 = sub_100006B00();
  unint64_t v8 = sub_100006B54();
  void *v5 = v2;
  v5[1] = sub_10000429C;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_1000062B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000067C8();
  *a1 = result;
  return result;
}

uint64_t sub_1000062DC(uint64_t a1)
{
  unint64_t v2 = sub_10000266C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenTransparencyPublicVerificationCodeDeepLink()
{
  return &type metadata for OpenTransparencyPublicVerificationCodeDeepLink;
}

ValueMetadata *type metadata accessor for TransparencyPublicVerificationCodeEntity()
{
  return &type metadata for TransparencyPublicVerificationCodeEntity;
}

ValueMetadata *type metadata accessor for TransparencyPublicVerificationCodeEntity.TransparencyPublicVerificationCodeEntityQuery()
{
  return &type metadata for TransparencyPublicVerificationCodeEntity.TransparencyPublicVerificationCodeEntityQuery;
}

uint64_t sub_100006348(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_100006368, 0, 0);
}

uint64_t sub_100006368()
{
  if (qword_1000100F0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100008DC0();
  *(void *)(v0 + 32) = sub_100004C98(v1, (uint64_t)qword_1000102F8);
  unint64_t v2 = sub_100008DA0();
  os_log_type_t v3 = sub_100008E00();
  if (os_log_type_enabled(v2, v3))
  {
    unint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "getting Contact Key Verification public verification code...", v4, 2u);
    swift_slowDealloc();
  }

  if (qword_100010110 != -1) {
    swift_once();
  }
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v5;
  void *v5 = v0;
  v5[1] = sub_1000064EC;
  return sub_1000072FC();
}

uint64_t sub_1000064EC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)*v3;
  v4[6] = a1;
  v4[7] = a2;
  swift_task_dealloc();
  if (v2)
  {
    unint64_t v5 = (uint64_t (*)(void))v4[1];
    return v5();
  }
  else
  {
    return _swift_task_switch(sub_100006620, 0, 0);
  }
}

uint64_t sub_100006620()
{
  uint64_t v11 = v0;
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_100008DA0();
  os_log_type_t v2 = sub_100008E00();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v4 = v0[6];
    unint64_t v3 = v0[7];
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)unint64_t v5 = 136315138;
    swift_bridgeObjectRetain();
    v0[2] = sub_100007CC4(v4, v3, &v10);
    sub_100008E30();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "returning Contact Key Verification public verification code: %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v6 = v0[7];
  uint64_t v7 = (void *)v0[3];
  *uint64_t v7 = v0[6];
  v7[1] = v6;
  unint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_1000067C8()
{
  v17[0] = sub_100008CE0();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  os_log_type_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000026C0(&qword_100010298);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_1000026C0(&qword_1000102A0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100008D80();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_1000026C0(&qword_100010430);
  sub_100008D70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v17[1] = 0;
  uint64_t v14 = sub_100008B50();
  v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_10000561C();
  return sub_100008BC0();
}

unint64_t sub_100006AAC()
{
  unint64_t result = qword_100010438;
  if (!qword_100010438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010438);
  }
  return result;
}

unint64_t sub_100006B00()
{
  unint64_t result = qword_100010440;
  if (!qword_100010440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010440);
  }
  return result;
}

unint64_t sub_100006B54()
{
  unint64_t result = qword_100010448;
  if (!qword_100010448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010448);
  }
  return result;
}

uint64_t sub_100006BA8()
{
  uint64_t v0 = sub_100008DC0();
  sub_100004CD0(v0, qword_100010470);
  sub_100004C98(v0, (uint64_t)qword_100010470);
  return sub_100008DB0();
}

id sub_100006C28()
{
  type metadata accessor for TransparencySettingsIntentsInterop();
  uint64_t v0 = swift_allocObject();
  if (qword_100010108 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100008DC0();
  sub_100004C98(v1, (uint64_t)qword_100010470);
  os_log_type_t v2 = sub_100008DA0();
  os_log_type_t v3 = sub_100008E20();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "init", v4, 2u);
    swift_slowDealloc();
  }

  id result = [objc_allocWithZone((Class)TUIKTAppIntentsData) init];
  *(void *)(v0 + 16) = result;
  qword_100010608 = v0;
  return result;
}

uint64_t sub_100006D38()
{
  *(void *)(v1 + 32) = v0;
  return _swift_task_switch(sub_100006D58, 0, 0);
}

uint64_t sub_100006D58()
{
  if (qword_100010108 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100008DC0();
  sub_100004C98(v1, (uint64_t)qword_100010470);
  os_log_type_t v2 = sub_100008DA0();
  os_log_type_t v3 = sub_100008E20();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "status", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v5;
  void *v5 = v0;
  v5[1] = sub_100006EEC;
  uint64_t v6 = *(void *)(v0 + 32);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 16, 0, 0, 0x2928737574617473, 0xE800000000000000, sub_1000083DC, v6, &type metadata for String);
}

uint64_t sub_100006EEC()
{
  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  if (v0) {
    os_log_type_t v2 = sub_100008518;
  }
  else {
    os_log_type_t v2 = sub_10000851C;
  }
  return _swift_task_switch(v2, 0, 0);
}

void sub_100007000(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000026C0(&qword_100010548);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  if (qword_100010108 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_100008DC0();
  sub_100004C98(v7, (uint64_t)qword_100010470);
  uint64_t v8 = sub_100008DA0();
  os_log_type_t v9 = sub_100008E10();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "getting status...", v10, 2u);
    swift_slowDealloc();
  }

  uint64_t v11 = *(void **)(a2 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v12 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v13 + v12, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_10000847C;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100007268;
  aBlock[3] = &unk_10000CB50;
  uint64_t v14 = _Block_copy(aBlock);
  swift_release();
  [v11 statusWithCompletion:v14];
  _Block_release(v14);
}

void sub_100007268(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  uint64_t v5 = sub_100008DD0();
  uint64_t v7 = v6;
  swift_retain();
  id v8 = a3;
  v4(v5, v7, a3);
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_1000072FC()
{
  *(void *)(v1 + 32) = v0;
  return _swift_task_switch(sub_10000731C, 0, 0);
}

uint64_t sub_10000731C()
{
  if (qword_100010108 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100008DC0();
  sub_100004C98(v1, (uint64_t)qword_100010470);
  os_log_type_t v2 = sub_100008DA0();
  os_log_type_t v3 = sub_100008E20();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "publicVerificationCode", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v5;
  void *v5 = v0;
  v5[1] = sub_1000074B4;
  uint64_t v6 = *(void *)(v0 + 32);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 16, 0, 0, 0xD000000000000018, 0x800000010000AE40, sub_100007BA8, v6, &type metadata for String);
}

uint64_t sub_1000074B4()
{
  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  if (v0) {
    os_log_type_t v2 = sub_1000075E4;
  }
  else {
    os_log_type_t v2 = sub_1000075C8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000075C8()
{
  return (*(uint64_t (**)(void, void))(v0 + 8))(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000075E4()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1000075FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000026C0(&qword_100010548);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  if (qword_100010108 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_100008DC0();
  sub_100004C98(v7, (uint64_t)qword_100010470);
  uint64_t v8 = sub_100008DA0();
  os_log_type_t v9 = sub_100008E10();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "getting public verification code...", v10, 2u);
    swift_slowDealloc();
  }

  uint64_t v11 = *(void **)(a2 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v12 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v13 + v12, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_100007BC4;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100007268;
  aBlock[3] = &unk_10000CB00;
  uint64_t v14 = _Block_copy(aBlock);
  swift_release();
  [v11 publicVerificationCodeWithCompletion:v14];
  _Block_release(v14);
}

uint64_t sub_100007864(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  if (qword_100010108 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_100008DC0();
  sub_100004C98(v9, (uint64_t)qword_100010470);
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v10 = sub_100008DA0();
  os_log_type_t v11 = sub_100008E00();
  if (os_log_type_enabled(v10, v11))
  {
    format = a5;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    v17[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315394;
    swift_bridgeObjectRetain();
    sub_100007CC4(a1, a2, v17);
    sub_100008E30();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v12 + 12) = 2112;
    if (a3)
    {
      swift_errorRetain();
      uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
      sub_100008E30();
    }
    else
    {
      sub_100008E30();
      uint64_t v14 = 0;
    }
    *uint64_t v13 = v14;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, format, (uint8_t *)v12, 0x16u);
    sub_1000026C0(&qword_100010550);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }
  v17[0] = a1;
  v17[1] = a2;
  swift_bridgeObjectRetain();
  sub_1000026C0(&qword_100010548);
  return sub_100008DF0();
}

uint64_t sub_100007B4C()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for TransparencySettingsIntentsInterop()
{
  return self;
}

void sub_100007BA8(uint64_t a1)
{
  sub_1000075FC(a1, v1);
}

uint64_t sub_100007BB0(uint64_t result, unsigned char **a2)
{
  os_log_type_t v2 = *a2;
  *os_log_type_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100007BC4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_100008488(a1, a2, a3, "got public verification code: %s error: %@");
}

uint64_t sub_100007BD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100007BE0()
{
  return swift_release();
}

uint64_t sub_100007BE8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100007C24(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100007C4C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_100007CC4(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_100008E30();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_100007CC4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100007D98(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000837C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000837C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000832C((uint64_t)v12);
  return v7;
}

uint64_t sub_100007D98(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_100008E40();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100007F54(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_100008E60();
  if (!v8)
  {
    sub_100008E70();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100008E80();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_100007F54(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100007FEC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000081CC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000081CC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100007FEC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_100008164(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100008E50();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100008E70();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100008DE0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100008E80();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100008E70();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100008164(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_1000026C0(&qword_100010558);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000081CC(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    sub_1000026C0(&qword_100010558);
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
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100008E80();
  __break(1u);
  return result;
}

unsigned char **sub_10000831C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10000832C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000837C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1000083DC(uint64_t a1)
{
  sub_100007000(a1, v1);
}

uint64_t sub_1000083E8()
{
  uint64_t v1 = sub_1000026C0(&qword_100010548);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000847C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_100008488(a1, a2, a3, "got status: %s error: %@");
}

uint64_t sub_100008488(uint64_t a1, unint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v9 = *(void *)(sub_1000026C0(&qword_100010548) - 8);
  return sub_100007864(a1, a2, a3, v4 + ((*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), a4);
}

unint64_t sub_10000852C()
{
  unint64_t result = qword_100010560;
  if (!qword_100010560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010560);
  }
  return result;
}

unint64_t sub_100008584()
{
  unint64_t result = qword_100010568;
  if (!qword_100010568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010568);
  }
  return result;
}

uint64_t sub_1000085D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000085F4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100008644()
{
  unint64_t result = qword_100010570;
  if (!qword_100010570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010570);
  }
  return result;
}

uint64_t sub_100008698()
{
  uint64_t v0 = sub_100008D80();
  sub_100004CD0(v0, qword_100010610);
  sub_100004C98(v0, (uint64_t)qword_100010610);
  return sub_100008D70();
}

uint64_t sub_1000086FC@<X0>(uint64_t a1@<X8>)
{
  if (qword_100010118 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008D80();
  uint64_t v3 = sub_100004C98(v2, (uint64_t)qword_100010610);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1000087AC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000087CC, 0, 0);
}

uint64_t sub_1000087CC()
{
  sub_100008B60();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100008830(uint64_t a1)
{
  unint64_t v2 = sub_100008644();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for TransparencySettingsIntents()
{
  return &type metadata for TransparencySettingsIntents;
}

unint64_t sub_100008880()
{
  unint64_t result = qword_100010580;
  if (!qword_100010580)
  {
    sub_100003490(&qword_100010588);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010580);
  }
  return result;
}

uint64_t sub_1000088DC(uint64_t a1)
{
  unint64_t v2 = sub_100008A2C();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100008984()
{
  unint64_t result = qword_100010590;
  if (!qword_100010590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010590);
  }
  return result;
}

uint64_t sub_1000089DC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100008A2C()
{
  unint64_t result = qword_100010598;
  if (!qword_100010598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010598);
  }
  return result;
}

ValueMetadata *type metadata accessor for TransparencySettingsIntentsExtension()
{
  return &type metadata for TransparencySettingsIntentsExtension;
}

uint64_t sub_100008A90()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100008AA0()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100008AB0()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100008AD0()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100008AE0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100008AF0()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_100008B00()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100008B10()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100008B50()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100008B60()
{
  return static IntentResult.result<>()();
}

uint64_t sub_100008B70()
{
  return _UniqueEntity.id.getter();
}

uint64_t sub_100008B80()
{
  return EntityProperty<>.init(title:_get:)();
}

uint64_t sub_100008B90()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100008BA0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100008BB0()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100008BC0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100008BD0()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100008BE0()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_100008BF0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock()();
}

uint64_t sub_100008C00()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t sub_100008C10()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_100008C20()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_100008C30()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_100008C40()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_100008C80()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100008C90()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100008CA0()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100008CB0()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_100008CD0()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_100008CE0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100008CF0()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_100008D20()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100008D40()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100008D50()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100008D70()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100008D80()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100008D90()
{
  return static AppExtension.main()();
}

uint64_t sub_100008DA0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100008DB0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100008DC0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100008DD0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_100008DE0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100008DF0()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_100008E00()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100008E10()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100008E20()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100008E30()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100008E40()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100008E50()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100008E60()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100008E70()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100008E80()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}