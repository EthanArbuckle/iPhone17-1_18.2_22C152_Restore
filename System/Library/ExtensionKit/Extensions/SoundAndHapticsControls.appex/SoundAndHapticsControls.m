unint64_t sub_10000508C()
{
  unint64_t result;

  result = qword_100020338;
  if (!qword_100020338)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020338);
  }
  return result;
}

uint64_t sub_1000050E0()
{
  return sub_1000090B8(&qword_100020340, &qword_100020348);
}

uint64_t sub_10000511C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005164()
{
  uint64_t v0 = sub_1000088A0(&qword_100020508);
  sub_100008FEC(v0, qword_100020B88);
  sub_100008FB4(v0, (uint64_t)qword_100020B88);
  sub_100006A04();
  return sub_100015160();
}

uint64_t sub_1000051E0(uint64_t a1)
{
  return sub_100007678(a1, qword_100020BA0);
}

uint64_t sub_10000520C()
{
  uint64_t v0 = sub_100015210();
  sub_100008FEC(v0, qword_100020BB8);
  sub_100008FB4(v0, (uint64_t)qword_100020BB8);
  return sub_100015200();
}

uint64_t sub_100005270()
{
  uint64_t v0 = sub_1000088A0(&qword_100020580);
  sub_100008FEC(v0, qword_100020BD0);
  uint64_t v1 = sub_100008FB4(v0, (uint64_t)qword_100020BD0);
  sub_100014FB0();
  uint64_t v2 = sub_100014FC0();
  v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100005328()
{
  uint64_t result = swift_getKeyPath();
  qword_100020BE8 = result;
  return result;
}

uint64_t sub_100005354@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_100005360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_1000088A0(&qword_100020550);
  v3[9] = swift_task_alloc();
  sub_1000088A0(&qword_100020558);
  v3[10] = swift_task_alloc();
  sub_1000088A0(&qword_100020560);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_100014F10();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_1000088A0(&qword_100020568);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_100005524, 0, 0);
}

uint64_t sub_100005524()
{
  sub_100014F60();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_100006A04();
  *uint64_t v1 = v0;
  v1[1] = sub_1000055F8;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100005CAC, 0, &type metadata for AlertHapticsEntity, v2);
}

uint64_t sub_1000055F8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000056F4, 0, 0);
}

uint64_t sub_1000056F4()
{
  sub_100014F60();
  uint64_t v1 = v0[3];
  v0[4] = v1;
  v0[20] = v1;
  sub_100014F60();
  if (qword_1000202B8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_100020BE8;
  v0[21] = qword_100020BE8;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[22] = v3;
  uint64_t v4 = sub_1000090B8(&qword_100020520, &qword_100020528);
  void *v3 = v0;
  v3[1] = sub_100005844;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 24, v2, &type metadata for HapticsOption, v4);
}

uint64_t sub_100005844()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100005BE8;
  }
  else {
    uint64_t v2 = sub_100005998;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100005998()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_100014F60();
  uint64_t v7 = sub_100015170();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_1000151B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_10000508C();
  sub_100006D1C();
  sub_100014EE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_100014F00();
  sub_100014F20();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100005BE8()
{
  (*(void (**)(void, void))(v0[16] + 8))(v0[18], v0[15]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_100005CB0()
{
  uint64_t v0 = sub_1000088A0(&qword_100020570);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000202B8 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100015010();
  swift_release();
  sub_100006D1C();
  sub_1000090B8(&qword_100020578, &qword_100020570);
  sub_100015000();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100005E18@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100014F60();
  *a1 = v3;
  return result;
}

uint64_t sub_100005E54()
{
  return swift_release();
}

uint64_t (*sub_100005E9C(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100014F50();
  return sub_100005EF8;
}

uint64_t sub_100005EFC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100014F60();
  *a1 = v3;
  return result;
}

uint64_t sub_100005F38()
{
  return sub_100014F70();
}

uint64_t (*sub_100005F70(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100014F50();
  return sub_100005EF8;
}

void sub_100005FCC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_100006018()
{
  if (qword_1000202B8 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100006078()
{
  unint64_t result = qword_100020350;
  if (!qword_100020350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020350);
  }
  return result;
}

unint64_t sub_1000060D0()
{
  unint64_t result = qword_100020358;
  if (!qword_100020358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020358);
  }
  return result;
}

uint64_t sub_100006124()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100006158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000081B8(a1, a2, a3, (void (*)(void))sub_10000508C);
}

uint64_t sub_100006184@<X0>(uint64_t a1@<X8>)
{
  return sub_1000080E8(&qword_1000202A8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100020BB8, a1);
}

uint64_t sub_1000061CC@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000202B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000088A0(&qword_100020580);
  uint64_t v3 = sub_100008FB4(v2, (uint64_t)qword_100020BD0);
  return sub_1000090FC(v3, a1, &qword_100020580);
}

uint64_t sub_100006244(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009164;
  return sub_100005360(a1, v5, v4);
}

uint64_t sub_1000062F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000089F0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100006318()
{
  return 0xD000000000000023;
}

unint64_t sub_100006338()
{
  unint64_t result = qword_100020368;
  if (!qword_100020368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020368);
  }
  return result;
}

unint64_t sub_100006390()
{
  unint64_t result = qword_100020370;
  if (!qword_100020370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020370);
  }
  return result;
}

uint64_t sub_1000063E4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100006404, 0, 0);
}

unint64_t sub_100006404()
{
  if (qword_100020320 != -1) {
    swift_once();
  }
  unint64_t result = sub_100013BA8();
  if (result > 3)
  {
    __break(1u);
  }
  else
  {
    **(unsigned char **)(v0 + 16) = result;
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  return result;
}

uint64_t sub_1000064B0(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_1000064D4, 0, 0);
}

uint64_t sub_1000064D4()
{
  if (qword_100020320 != -1) {
    swift_once();
  }
  sub_100013CE8();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100006580(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_100015210();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100006610, 0, 0);
}

uint64_t sub_100006610()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_1000088A0(&qword_100020348);
  sub_100015200();
  sub_1000090B8(&qword_100020520, &qword_100020528);
  sub_100008200();
  *uint64_t v1 = sub_1000151D0();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_100006738()
{
  unint64_t result = qword_100020380;
  if (!qword_100020380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020380);
  }
  return result;
}

uint64_t sub_10000678C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100007164();
  *uint64_t v4 = v2;
  v4[1] = sub_10000683C;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_10000683C(uint64_t a1)
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

unint64_t sub_100006954()
{
  unint64_t result = qword_100020390;
  if (!qword_100020390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020390);
  }
  return result;
}

unint64_t sub_1000069AC()
{
  unint64_t result = qword_100020398;
  if (!qword_100020398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020398);
  }
  return result;
}

unint64_t sub_100006A04()
{
  unint64_t result = qword_1000203A0[0];
  if (!qword_1000203A0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000203A0);
  }
  return result;
}

uint64_t sub_100006A5C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100007164();
  *uint64_t v5 = v2;
  v5[1] = sub_100006B10;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100006B10(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100006C10(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100007164();
  *uint64_t v4 = v2;
  v4[1] = sub_100009160;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100006CC4()
{
  unint64_t result = qword_1000203B8;
  if (!qword_1000203B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000203B8);
  }
  return result;
}

unint64_t sub_100006D1C()
{
  unint64_t result = qword_1000203C0;
  if (!qword_1000203C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000203C0);
  }
  return result;
}

unint64_t sub_100006D74()
{
  unint64_t result = qword_1000203C8;
  if (!qword_1000203C8)
  {
    sub_10000511C(qword_1000203D0);
    sub_100006D1C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000203C8);
  }
  return result;
}

uint64_t sub_100006DE8(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100006738();
  *unint64_t v5 = v2;
  v5[1] = sub_100006E9C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100006E9C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006F90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100006E9C;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

unint64_t sub_100007050()
{
  unint64_t result = qword_1000203E8;
  if (!qword_1000203E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000203E8);
  }
  return result;
}

unint64_t sub_1000070A8()
{
  unint64_t result = qword_1000203F0;
  if (!qword_1000203F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000203F0);
  }
  return result;
}

unint64_t sub_100007100()
{
  unint64_t result = qword_1000203F8;
  if (!qword_1000203F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000203F8);
  }
  return result;
}

void *sub_100007154()
{
  return &protocol witness table for String;
}

unint64_t sub_100007164()
{
  unint64_t result = qword_100020400;
  if (!qword_100020400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020400);
  }
  return result;
}

unint64_t sub_1000071BC()
{
  unint64_t result = qword_100020408;
  if (!qword_100020408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020408);
  }
  return result;
}

uint64_t sub_100007210@<X0>(uint64_t a1@<X8>)
{
  if (qword_100020298 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000088A0(&qword_100020508);
  uint64_t v3 = sub_100008FB4(v2, (uint64_t)qword_100020B88);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_1000072C0()
{
  unint64_t result = qword_100020410;
  if (!qword_100020410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020410);
  }
  return result;
}

unint64_t sub_100007318()
{
  unint64_t result = qword_100020418;
  if (!qword_100020418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020418);
  }
  return result;
}

unint64_t sub_100007370()
{
  unint64_t result = qword_100020420;
  if (!qword_100020420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020420);
  }
  return result;
}

void *sub_1000073C4()
{
  return &protocol witness table for String;
}

uint64_t sub_1000073D0@<X0>(uint64_t *a1@<X8>)
{
  sub_100006390();
  uint64_t result = sub_100014F40();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100007410()
{
  sub_100009050();
  uint64_t v2 = sub_100015130();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_1000090A4(v3, v0, v2, v1);
}

uint64_t sub_1000074A4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000080E8(&qword_1000202A0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100020BA0, a1);
}

uint64_t sub_1000074DC()
{
  return sub_1000090B8(&qword_100020430, &qword_100020438);
}

uint64_t sub_100007518(uint64_t a1)
{
  unint64_t v2 = sub_100006A04();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100007568()
{
  unint64_t result = qword_100020440;
  if (!qword_100020440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020440);
  }
  return result;
}

uint64_t sub_1000075BC(uint64_t a1)
{
  unint64_t v2 = sub_100006390();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100007608(uint64_t a1)
{
  unint64_t v2 = sub_100007370();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100007654(uint64_t a1)
{
  return sub_100007678(a1, qword_100020BF0);
}

uint64_t sub_100007678(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000088A0(&qword_1000204D8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100015210();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = sub_1000151A0();
  sub_100008FEC(v8, a2);
  sub_100008FB4(v8, (uint64_t)a2);
  sub_100015200();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  sub_1000088A0(&qword_1000204F8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000158A0;
  sub_100015200();
  return sub_100015180();
}

uint64_t sub_10000783C()
{
  uint64_t v0 = sub_1000088A0(&qword_1000204D0);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000088A0(&qword_1000204D8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100015210();
  uint64_t v30 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_1000088A0(&qword_1000204E0);
  uint64_t v31 = sub_1000088A0(&qword_1000204E8);
  uint64_t v8 = *(void *)(v31 - 8);
  uint64_t v32 = *(void *)(v8 + 72);
  unint64_t v9 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = swift_allocObject();
  uint64_t v28 = v10;
  *(_OWORD *)(v10 + 16) = xmmword_1000158B0;
  *(unsigned char *)(v10 + v9) = 0;
  unint64_t v11 = v10 + v9;
  unint64_t v25 = v10 + v9;
  sub_100015200();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v12(v5, 1, 1, v6);
  uint64_t v26 = v7 + 56;
  v27 = v12;
  uint64_t v13 = sub_100015030();
  uint64_t v14 = *(void *)(v13 - 8);
  v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v24[1] = v14 + 56;
  v29(v2, 1, 1, v13);
  sub_100015060();
  uint64_t v15 = v31;
  uint64_t v16 = v32;
  v24[0] = v11 + v32 + *(int *)(v31 + 48);
  *(unsigned char *)(v11 + v32) = 1;
  sub_100015200();
  uint64_t v17 = v30;
  v12(v5, 1, 1, v30);
  v18 = v29;
  v29(v2, 1, 1, v13);
  sub_100015060();
  uint64_t v19 = 2 * v16;
  unint64_t v20 = v25;
  v24[0] = v25 + v19 + *(int *)(v15 + 48);
  *(unsigned char *)(v25 + v19) = 2;
  sub_100015200();
  v21 = v27;
  v27(v5, 1, 1, v17);
  v18(v2, 1, 1, v13);
  sub_100015060();
  *(unsigned char *)(v20 + v19 + v32) = 3;
  sub_100015200();
  v21(v5, 1, 1, v30);
  v29(v2, 1, 1, v13);
  sub_100015060();
  unint64_t v22 = sub_100008DEC(v28);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t result = swift_deallocClassInstance();
  qword_100020C08 = v22;
  return result;
}

BOOL sub_100007CD4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_100007CEC()
{
  unint64_t result = qword_100020448;
  if (!qword_100020448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020448);
  }
  return result;
}

Swift::Int sub_100007D40()
{
  Swift::UInt v1 = *v0;
  sub_1000153C0();
  sub_1000153D0(v1);
  return sub_1000153E0();
}

void sub_100007D88()
{
  sub_1000153D0(*v0);
}

Swift::Int sub_100007DB4()
{
  Swift::UInt v1 = *v0;
  sub_1000153C0();
  sub_1000153D0(v1);
  return sub_1000153E0();
}

unint64_t sub_100007DF8@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_100008DDC(*a1);
  *a2 = result;
  return result;
}

void sub_100007E24(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_100007E30()
{
  return &protocol witness table for Int;
}

unint64_t sub_100007E40()
{
  unint64_t result = qword_100020450;
  if (!qword_100020450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020450);
  }
  return result;
}

unint64_t sub_100007E98()
{
  unint64_t result = qword_100020458;
  if (!qword_100020458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020458);
  }
  return result;
}

unint64_t sub_100007EF0()
{
  unint64_t result = qword_100020460;
  if (!qword_100020460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020460);
  }
  return result;
}

void *sub_100007F44()
{
  return &protocol witness table for Int;
}

unint64_t sub_100007F54()
{
  unint64_t result = qword_100020468;
  if (!qword_100020468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020468);
  }
  return result;
}

unint64_t sub_100007FAC()
{
  unint64_t result = qword_100020470;
  if (!qword_100020470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020470);
  }
  return result;
}

unint64_t sub_100008004()
{
  unint64_t result = qword_100020478;
  if (!qword_100020478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020478);
  }
  return result;
}

unint64_t sub_10000805C()
{
  unint64_t result = qword_100020480;
  if (!qword_100020480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020480);
  }
  return result;
}

uint64_t sub_1000080B0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000080E8(&qword_1000202C0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100020BF0, a1);
}

uint64_t sub_1000080E8@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100008FB4(v7, a3);
  unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_10000818C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000081B8(a1, a2, a3, (void (*)(void))sub_100008200);
}

uint64_t sub_1000081B8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100008200()
{
  unint64_t result = qword_100020488;
  if (!qword_100020488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020488);
  }
  return result;
}

uint64_t sub_100008254(uint64_t a1)
{
  unint64_t v2 = sub_100008200();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000082A4()
{
  unint64_t result = qword_100020490;
  if (!qword_100020490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020490);
  }
  return result;
}

unint64_t sub_1000082FC()
{
  unint64_t result = qword_100020498;
  if (!qword_100020498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020498);
  }
  return result;
}

unint64_t sub_100008354()
{
  unint64_t result = qword_1000204A0;
  if (!qword_1000204A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000204A0);
  }
  return result;
}

uint64_t sub_1000083A8()
{
  if (qword_1000202C8 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_100008404(uint64_t a1)
{
  unint64_t v2 = sub_10000805C();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100008450()
{
  return sub_1000090B8(&qword_1000204A8, &qword_1000204B0);
}

void sub_10000848C(void *a1@<X8>)
{
  *a1 = &off_10001CE50;
}

ValueMetadata *type metadata accessor for AlertHapticsEntity.AlertHapticsEntityQuery()
{
  return &type metadata for AlertHapticsEntity.AlertHapticsEntityQuery;
}

unsigned char *initializeBufferWithCopyOfBuffer for HapticsOption(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HapticsOption(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for HapticsOption(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x100008618);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_100008640(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100008648(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HapticsOption()
{
  return &type metadata for HapticsOption;
}

ValueMetadata *type metadata accessor for AlertHapticsEntity()
{
  return &type metadata for AlertHapticsEntity;
}

uint64_t destroy for AlertHapticsEntity.UpdateIntent_value()
{
  swift_release();

  return swift_release();
}

void *_s23SoundAndHapticsControls18AlertHapticsEntityV18UpdateIntent_valueVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for AlertHapticsEntity.UpdateIntent_value(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for AlertHapticsEntity.UpdateIntent_value(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for AlertHapticsEntity.UpdateIntent_value(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AlertHapticsEntity.UpdateIntent_value(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AlertHapticsEntity.UpdateIntent_value(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AlertHapticsEntity.UpdateIntent_value()
{
  return &type metadata for AlertHapticsEntity.UpdateIntent_value;
}

uint64_t sub_100008828()
{
  return sub_1000090B8(&qword_1000204B8, &qword_1000204C0);
}

uint64_t sub_100008864()
{
  return sub_1000090B8(&qword_1000204C8, &qword_1000204C0);
}

uint64_t sub_1000088A0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000088E4(unsigned __int8 a1)
{
  sub_1000153C0();
  sub_1000153D0(a1);
  Swift::Int v2 = sub_1000153E0();

  return sub_100008950(a1, v2);
}

unint64_t sub_100008950(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1000089F0()
{
  uint64_t v27 = sub_100015120();
  uint64_t v0 = *(void *)(v27 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v26 = (char *)v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000088A0(&qword_100020530);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  unsigned int v6 = (char *)v19 - v5;
  uint64_t v7 = sub_1000088A0(&qword_1000204D8);
  __chkstk_darwin(v7 - 8);
  unint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100015210();
  uint64_t v25 = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v22 = sub_1000088A0(&qword_100020538);
  sub_100015200();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  uint64_t v23 = v11 + 56;
  v24 = v12;
  v12(v9, 1, 1, v10);
  uint64_t v29 = 0;
  uint64_t v13 = sub_100014F10();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  uint64_t v15 = v6;
  v14(v6, 1, 1, v13);
  v14(v4, 1, 1, v13);
  unsigned int v21 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v16 = *(void (**)(void))(v0 + 104);
  v19[1] = v0 + 104;
  unint64_t v20 = (void (*)(char *, void, uint64_t))v16;
  uint64_t v17 = v26;
  v16(v26);
  sub_100006A04();
  uint64_t v22 = sub_100014F90();
  sub_1000088A0(&qword_100020540);
  sub_100015200();
  v24(v9, 1, 1, v25);
  char v28 = 4;
  v14(v15, 1, 1, v13);
  v14(v4, 1, 1, v13);
  v20(v17, v21, v27);
  sub_100008200();
  sub_100014F80();
  return v22;
}

unint64_t sub_100008DDC(unint64_t result)
{
  if (result >= 4) {
    return 4;
  }
  return result;
}

unint64_t sub_100008DEC(uint64_t a1)
{
  uint64_t v2 = sub_1000088A0(&qword_1000204E8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (unsigned __int8 *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    sub_1000088A0(&qword_1000204F0);
    uint64_t v7 = (void *)sub_100015380();
    uint64_t v8 = &v5[*(int *)(v2 + 48)];
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v10 = *(void *)(v3 + 72);
    while (1)
    {
      sub_1000090FC(v9, (uint64_t)v5, &qword_1000204E8);
      unsigned __int8 v11 = *v5;
      unint64_t result = sub_1000088E4(*v5);
      if (v13) {
        break;
      }
      unint64_t v14 = result;
      *(void *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v7[6] + result) = v11;
      uint64_t v15 = v7[7];
      uint64_t v16 = sub_100015070();
      unint64_t result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(void *)(v16 - 8) + 32))(v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, v8, v16);
      uint64_t v17 = v7[2];
      BOOL v18 = __OFADD__(v17, 1);
      uint64_t v19 = v17 + 1;
      if (v18) {
        goto LABEL_10;
      }
      v7[2] = v19;
      v9 += v10;
      if (!--v6) {
        return (unint64_t)v7;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

uint64_t sub_100008FB4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100008FEC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100009050()
{
  unint64_t result = qword_100020500;
  if (!qword_100020500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020500);
  }
  return result;
}

uint64_t sub_1000090A4(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_1000090B8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000511C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000090FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000088A0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_10000916C()
{
  unint64_t result = qword_100020588;
  if (!qword_100020588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020588);
  }
  return result;
}

uint64_t sub_1000091C0()
{
  return sub_1000090B8(&qword_100020590, &qword_100020598);
}

uint64_t sub_1000091FC()
{
  uint64_t v0 = sub_1000088A0(&qword_1000204D8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100015210();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_1000151A0();
  sub_100008FEC(v5, qword_100020C10);
  sub_100008FB4(v5, (uint64_t)qword_100020C10);
  sub_100015200();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  sub_1000088A0(&qword_1000204F8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000158A0;
  sub_100015200();
  return sub_100015180();
}

uint64_t sub_1000093CC()
{
  uint64_t v0 = sub_100015210();
  sub_100008FEC(v0, qword_100020C28);
  sub_100008FB4(v0, (uint64_t)qword_100020C28);
  return sub_100015200();
}

uint64_t sub_100009430()
{
  uint64_t v0 = sub_1000088A0(&qword_100020580);
  sub_100008FEC(v0, qword_100020C40);
  uint64_t v1 = sub_100008FB4(v0, (uint64_t)qword_100020C40);
  sub_100014FB0();
  uint64_t v2 = sub_100014FC0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_1000094E8()
{
  uint64_t result = swift_getKeyPath();
  qword_100020C58 = result;
  return result;
}

uint64_t sub_100009510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_1000088A0(&qword_100020550);
  v3[9] = swift_task_alloc();
  sub_1000088A0(&qword_100020558);
  v3[10] = swift_task_alloc();
  sub_1000088A0(&qword_100020700);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_100014F10();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_1000088A0(&qword_100020708);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_1000096D4, 0, 0);
}

uint64_t sub_1000096D4()
{
  sub_100014F60();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_10000A880();
  *uint64_t v1 = v0;
  v1[1] = sub_1000097A8;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100009DA0, 0, &type metadata for ShowInStatusBarEntity, v2);
}

uint64_t sub_1000097A8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000098A4, 0, 0);
}

uint64_t sub_1000098A4()
{
  sub_100014F60();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_100014F60();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_1000202E8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_100020C58;
  *(void *)(v0 + 168) = qword_100020C58;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_1000090B8(&qword_1000206C8, &qword_1000206D0);
  void *v3 = v0;
  v3[1] = sub_1000099FC;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_1000099FC()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100005BE8;
  }
  else {
    uint64_t v2 = sub_100009B50;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100009B50()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_100014F60();
  uint64_t v7 = sub_100015170();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_1000151B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_10000916C();
  sub_10000AA94();
  sub_100014EE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_100014F00();
  sub_100014F20();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100009DA4()
{
  uint64_t v0 = sub_1000088A0(&qword_100020710);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000202E8 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100015010();
  swift_release();
  sub_10000AA94();
  sub_1000090B8(&qword_100020718, &qword_100020710);
  sub_100015000();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100009F0C()
{
  if (qword_1000202E8 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100009F6C()
{
  unint64_t result = qword_1000205A0;
  if (!qword_1000205A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000205A0);
  }
  return result;
}

unint64_t sub_100009FC4()
{
  unint64_t result = qword_1000205A8;
  if (!qword_1000205A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000205A8);
  }
  return result;
}

uint64_t sub_10000A018()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10000A04C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000A09C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B03C(&qword_1000202D8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100020C28, a1);
}

uint64_t sub_10000A0D4@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000202E0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000088A0(&qword_100020580);
  uint64_t v3 = sub_100008FB4(v2, (uint64_t)qword_100020C40);

  return sub_10000B800(v3, a1);
}

uint64_t sub_10000A150(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009164;
  return sub_100009510(a1, v5, v4);
}

uint64_t sub_10000A1FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000B3B4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10000A224()
{
  return 0xD000000000000026;
}

unint64_t sub_10000A244()
{
  unint64_t result = qword_1000205B8;
  if (!qword_1000205B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000205B8);
  }
  return result;
}

unint64_t sub_10000A29C()
{
  unint64_t result = qword_1000205C0;
  if (!qword_1000205C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000205C0);
  }
  return result;
}

uint64_t sub_10000A2F0(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_10000A310, 0, 0);
}

uint64_t sub_10000A310()
{
  if (qword_100020320 != -1) {
    swift_once();
  }
  uint64_t v1 = (BOOL *)v0[3];
  uint64_t v2 = qword_100020CE0;
  swift_getKeyPath();
  v0[2] = v2;
  sub_10000B35C();
  sub_100015230();
  swift_release();
  uint64_t v3 = (__CFString *)sub_100015350();
  uint64_t v4 = (__CFString *)sub_100015350();
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v3, v4, 0);

  *uint64_t v1 = AppBooleanValue != 0;
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_10000A464(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_10000A488, 0, 0);
}

uint64_t sub_10000A488()
{
  if (qword_100020320 != -1) {
    swift_once();
  }
  sub_100013E6C();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000A524(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_100015210();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_10000A5B4, 0, 0);
}

uint64_t sub_10000A5B4()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_1000088A0(&qword_100020598);
  sub_100015200();
  sub_1000090B8(&qword_1000206C8, &qword_1000206D0);
  *uint64_t v1 = sub_1000151E0();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_10000A6C8()
{
  unint64_t result = qword_1000205D0;
  if (!qword_1000205D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000205D0);
  }
  return result;
}

uint64_t sub_10000A71C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000AD20();
  *uint64_t v4 = v2;
  v4[1] = sub_10000683C;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10000A7D0()
{
  unint64_t result = qword_1000205E0;
  if (!qword_1000205E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000205E0);
  }
  return result;
}

unint64_t sub_10000A828()
{
  unint64_t result = qword_1000205E8;
  if (!qword_1000205E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000205E8);
  }
  return result;
}

unint64_t sub_10000A880()
{
  unint64_t result = qword_1000205F0[0];
  if (!qword_1000205F0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000205F0);
  }
  return result;
}

uint64_t sub_10000A8D4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000AD20();
  *unint64_t v5 = v2;
  v5[1] = sub_100006B10;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10000A988(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000AD20();
  *uint64_t v4 = v2;
  v4[1] = sub_100009160;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10000AA3C()
{
  unint64_t result = qword_100020608;
  if (!qword_100020608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020608);
  }
  return result;
}

unint64_t sub_10000AA94()
{
  unint64_t result = qword_100020610;
  if (!qword_100020610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020610);
  }
  return result;
}

unint64_t sub_10000AAEC()
{
  unint64_t result = qword_100020618;
  if (!qword_100020618)
  {
    sub_10000511C(qword_100020620);
    sub_10000AA94();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020618);
  }
  return result;
}

uint64_t sub_10000AB60(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000A6C8();
  *unint64_t v5 = v2;
  v5[1] = sub_100006E9C;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_10000AC18()
{
  unint64_t result = qword_100020638;
  if (!qword_100020638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020638);
  }
  return result;
}

unint64_t sub_10000AC70()
{
  unint64_t result = qword_100020640;
  if (!qword_100020640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020640);
  }
  return result;
}

unint64_t sub_10000ACC8()
{
  unint64_t result = qword_100020648;
  if (!qword_100020648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020648);
  }
  return result;
}

unint64_t sub_10000AD20()
{
  unint64_t result = qword_100020650;
  if (!qword_100020650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020650);
  }
  return result;
}

unint64_t sub_10000AD78()
{
  unint64_t result = qword_100020658;
  if (!qword_100020658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020658);
  }
  return result;
}

uint64_t sub_10000ADCC()
{
  sub_10000A880();

  return sub_100015160();
}

unint64_t sub_10000AE2C()
{
  unint64_t result = qword_100020660;
  if (!qword_100020660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020660);
  }
  return result;
}

unint64_t sub_10000AE84()
{
  unint64_t result = qword_100020668;
  if (!qword_100020668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020668);
  }
  return result;
}

unint64_t sub_10000AEDC()
{
  unint64_t result = qword_100020670;
  if (!qword_100020670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020670);
  }
  return result;
}

uint64_t sub_10000AF30@<X0>(uint64_t *a1@<X8>)
{
  sub_10000A29C();
  uint64_t result = sub_100014F40();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000AF70()
{
  sub_10000B300();
  uint64_t v2 = sub_100015130();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_1000090A4(v3, v0, v2, v1);
}

uint64_t sub_10000B004@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B03C(&qword_1000202D0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100020C10, a1);
}

uint64_t sub_10000B03C@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100008FB4(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_10000B0E0()
{
  return sub_1000090B8(&qword_100020680, &qword_100020688);
}

uint64_t sub_10000B11C(uint64_t a1)
{
  unint64_t v2 = sub_10000A880();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000B16C()
{
  unint64_t result = qword_100020690;
  if (!qword_100020690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020690);
  }
  return result;
}

uint64_t sub_10000B1C0(uint64_t a1)
{
  unint64_t v2 = sub_10000A29C();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_10000B20C(uint64_t a1)
{
  unint64_t v2 = sub_10000AEDC();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for ShowInStatusBarEntity.ShowInStatusBarQuery()
{
  return &type metadata for ShowInStatusBarEntity.ShowInStatusBarQuery;
}

ValueMetadata *type metadata accessor for ShowInStatusBarEntity()
{
  return &type metadata for ShowInStatusBarEntity;
}

ValueMetadata *type metadata accessor for ShowInStatusBarEntity.UpdateIntent_value()
{
  return &type metadata for ShowInStatusBarEntity.UpdateIntent_value;
}

uint64_t sub_10000B288()
{
  return sub_1000090B8(&qword_100020698, &qword_1000206A0);
}

uint64_t sub_10000B2C4()
{
  return sub_1000090B8(&qword_1000206A8, &qword_1000206A0);
}

unint64_t sub_10000B300()
{
  unint64_t result = qword_1000206B0;
  if (!qword_1000206B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000206B0);
  }
  return result;
}

unint64_t sub_10000B35C()
{
  unint64_t result = qword_1000206D8;
  if (!qword_1000206D8)
  {
    type metadata accessor for SoundsSettings();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000206D8);
  }
  return result;
}

uint64_t sub_10000B3B4()
{
  uint64_t v0 = sub_1000088A0(&qword_1000206E0);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100015120();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000088A0(&qword_100020530);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_1000088A0(&qword_1000204D8);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_100015210();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_1000088A0(&qword_1000206E8);
  sub_100015200();
  char v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_100014F10();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  BOOL v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_10000A880();
  uint64_t v19 = v23;
  uint64_t v24 = sub_100014F90();
  sub_1000088A0(&qword_1000206F0);
  sub_100015200();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100015370();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_100014FA0();
  return v24;
}

uint64_t sub_10000B7F4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_10000B800(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000088A0(&qword_100020580);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000B86C()
{
  unint64_t result = qword_100020720;
  if (!qword_100020720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020720);
  }
  return result;
}

uint64_t sub_10000B8C0()
{
  return sub_1000090B8(&qword_100020728, &qword_100020730);
}

uint64_t sub_10000B8FC()
{
  uint64_t v0 = sub_1000088A0(&qword_1000204D8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100015210();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_1000151A0();
  sub_100008FEC(v5, qword_100020C60);
  sub_100008FB4(v5, (uint64_t)qword_100020C60);
  sub_100015200();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  sub_1000088A0(&qword_1000204F8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000158A0;
  sub_100015200();
  return sub_100015180();
}

uint64_t sub_10000BAC0()
{
  uint64_t v0 = sub_100015210();
  sub_100008FEC(v0, qword_100020C78);
  sub_100008FB4(v0, (uint64_t)qword_100020C78);
  return sub_100015200();
}

uint64_t sub_10000BB24()
{
  uint64_t v0 = sub_1000088A0(&qword_100020580);
  sub_100008FEC(v0, qword_100020C90);
  uint64_t v1 = sub_100008FB4(v0, (uint64_t)qword_100020C90);
  sub_100014FB0();
  uint64_t v2 = sub_100014FC0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10000BBDC()
{
  uint64_t result = swift_getKeyPath();
  qword_100020CA8 = result;
  return result;
}

uint64_t sub_10000BC04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_1000088A0(&qword_100020550);
  v3[9] = swift_task_alloc();
  sub_1000088A0(&qword_100020558);
  v3[10] = swift_task_alloc();
  sub_1000088A0(&qword_100020880);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_100014F10();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_1000088A0(&qword_100020888);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_10000BDC8, 0, 0);
}

uint64_t sub_10000BDC8()
{
  sub_100014F60();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_10000CFDC();
  *uint64_t v1 = v0;
  v1[1] = sub_10000BE9C;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_10000C494, 0, &type metadata for SilentModeEntity, v2);
}

uint64_t sub_10000BE9C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10000BF98, 0, 0);
}

uint64_t sub_10000BF98()
{
  sub_100014F60();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_100014F60();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_100020308 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_100020CA8;
  *(void *)(v0 + 168) = qword_100020CA8;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_1000090B8(&qword_100020860, &qword_100020868);
  void *v3 = v0;
  v3[1] = sub_10000C0F0;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_10000C0F0()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100005BE8;
  }
  else {
    uint64_t v2 = sub_10000C244;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000C244()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_100014F60();
  uint64_t v7 = sub_100015170();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_1000151B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_10000B86C();
  sub_10000D1F0();
  sub_100014EE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_100014F00();
  sub_100014F20();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10000C498()
{
  uint64_t v0 = sub_1000088A0(&qword_100020890);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100020308 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100015010();
  swift_release();
  sub_10000D1F0();
  sub_1000090B8(&qword_100020898, &qword_100020890);
  sub_100015000();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10000C600()
{
  if (qword_100020308 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10000C660()
{
  unint64_t result = qword_100020738;
  if (!qword_100020738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020738);
  }
  return result;
}

unint64_t sub_10000C6B8()
{
  unint64_t result = qword_100020740;
  if (!qword_100020740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020740);
  }
  return result;
}

uint64_t sub_10000C70C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10000C740()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000C790@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B03C(&qword_1000202F8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100020C78, a1);
}

uint64_t sub_10000C7C8@<X0>(uint64_t a1@<X8>)
{
  if (qword_100020300 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000088A0(&qword_100020580);
  uint64_t v3 = sub_100008FB4(v2, (uint64_t)qword_100020C90);

  return sub_10000B800(v3, a1);
}

uint64_t sub_10000C844(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100006E9C;
  return sub_10000BC04(a1, v5, v4);
}

uint64_t sub_10000C8F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000DA30();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10000C918()
{
  return 0xD000000000000021;
}

unint64_t sub_10000C938()
{
  unint64_t result = qword_100020750;
  if (!qword_100020750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020750);
  }
  return result;
}

unint64_t sub_10000C990()
{
  unint64_t result = qword_100020758;
  if (!qword_100020758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020758);
  }
  return result;
}

uint64_t sub_10000C9E4(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_10000CA04, 0, 0);
}

id sub_10000CA04()
{
  if (qword_100020320 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100020CE0;
  swift_getKeyPath();
  v0[2] = v1;
  sub_10000B35C();
  sub_100015230();
  swift_release();
  id result = [self sharedInstance];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (unsigned __int8 *)v0[3];
    unsigned __int8 v5 = [result getSilentMode];

    *uint64_t v4 = v5;
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return (id)v6();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000CB28(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 25) = *a2;
  return _swift_task_switch(sub_10000CB4C, 0, 0);
}

uint64_t sub_10000CB4C()
{
  if (qword_100020320 != -1) {
    swift_once();
  }
  char v1 = *(unsigned char *)(v0 + 25);
  uint64_t v2 = qword_100020CE0;
  swift_getKeyPath();
  *(unsigned char *)(swift_task_alloc() + 16) = v1;
  *(void *)(v0 + 16) = v2;
  sub_10000B35C();
  sub_100015220();
  swift_release();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10000CC80(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_100015210();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_10000CD10, 0, 0);
}

uint64_t sub_10000CD10()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_1000088A0(&qword_100020730);
  sub_100015200();
  sub_1000090B8(&qword_100020860, &qword_100020868);
  *uint64_t v1 = sub_1000151E0();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_10000CE24()
{
  unint64_t result = qword_100020768;
  if (!qword_100020768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020768);
  }
  return result;
}

uint64_t sub_10000CE78(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000D47C();
  *uint64_t v4 = v2;
  v4[1] = sub_10000683C;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10000CF2C()
{
  unint64_t result = qword_100020778;
  if (!qword_100020778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020778);
  }
  return result;
}

unint64_t sub_10000CF84()
{
  unint64_t result = qword_100020780;
  if (!qword_100020780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020780);
  }
  return result;
}

unint64_t sub_10000CFDC()
{
  unint64_t result = qword_100020788[0];
  if (!qword_100020788[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100020788);
  }
  return result;
}

uint64_t sub_10000D030(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000D47C();
  *unint64_t v5 = v2;
  v5[1] = sub_100006B10;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10000D0E4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000D47C();
  *uint64_t v4 = v2;
  v4[1] = sub_100009160;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10000D198()
{
  unint64_t result = qword_1000207A0;
  if (!qword_1000207A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000207A0);
  }
  return result;
}

unint64_t sub_10000D1F0()
{
  unint64_t result = qword_1000207A8;
  if (!qword_1000207A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000207A8);
  }
  return result;
}

unint64_t sub_10000D248()
{
  unint64_t result = qword_1000207B0;
  if (!qword_1000207B0)
  {
    sub_10000511C(qword_1000207B8);
    sub_10000D1F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000207B0);
  }
  return result;
}

uint64_t sub_10000D2BC(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000CE24();
  *unint64_t v5 = v2;
  v5[1] = sub_100009164;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_10000D374()
{
  unint64_t result = qword_1000207D0;
  if (!qword_1000207D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000207D0);
  }
  return result;
}

unint64_t sub_10000D3CC()
{
  unint64_t result = qword_1000207D8;
  if (!qword_1000207D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000207D8);
  }
  return result;
}

unint64_t sub_10000D424()
{
  unint64_t result = qword_1000207E0;
  if (!qword_1000207E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000207E0);
  }
  return result;
}

unint64_t sub_10000D47C()
{
  unint64_t result = qword_1000207E8;
  if (!qword_1000207E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000207E8);
  }
  return result;
}

unint64_t sub_10000D4D4()
{
  unint64_t result = qword_1000207F0;
  if (!qword_1000207F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000207F0);
  }
  return result;
}

uint64_t sub_10000D528()
{
  sub_10000CFDC();

  return sub_100015160();
}

unint64_t sub_10000D588()
{
  unint64_t result = qword_1000207F8;
  if (!qword_1000207F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000207F8);
  }
  return result;
}

unint64_t sub_10000D5E0()
{
  unint64_t result = qword_100020800;
  if (!qword_100020800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020800);
  }
  return result;
}

unint64_t sub_10000D638()
{
  unint64_t result = qword_100020808;
  if (!qword_100020808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020808);
  }
  return result;
}

uint64_t sub_10000D68C@<X0>(uint64_t *a1@<X8>)
{
  sub_10000C990();
  uint64_t result = sub_100014F40();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000D6CC()
{
  sub_10000D9B8();
  uint64_t v2 = sub_100015130();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_1000090A4(v3, v0, v2, v1);
}

uint64_t sub_10000D760@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B03C(&qword_1000202F0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100020C60, a1);
}

uint64_t sub_10000D798()
{
  return sub_1000090B8(&qword_100020818, &qword_100020820);
}

uint64_t sub_10000D7D4(uint64_t a1)
{
  unint64_t v2 = sub_10000CFDC();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000D824()
{
  unint64_t result = qword_100020828;
  if (!qword_100020828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020828);
  }
  return result;
}

uint64_t sub_10000D878(uint64_t a1)
{
  unint64_t v2 = sub_10000C990();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_10000D8C4(uint64_t a1)
{
  unint64_t v2 = sub_10000D638();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SilentModeEntity.Query()
{
  return &type metadata for SilentModeEntity.Query;
}

ValueMetadata *type metadata accessor for SilentModeEntity()
{
  return &type metadata for SilentModeEntity;
}

ValueMetadata *type metadata accessor for SilentModeEntity.UpdateIntent_value()
{
  return &type metadata for SilentModeEntity.UpdateIntent_value;
}

uint64_t sub_10000D940()
{
  return sub_1000090B8(&qword_100020830, &qword_100020838);
}

uint64_t sub_10000D97C()
{
  return sub_1000090B8(&qword_100020840, &qword_100020838);
}

unint64_t sub_10000D9B8()
{
  unint64_t result = qword_100020848;
  if (!qword_100020848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020848);
  }
  return result;
}

void sub_10000DA14(unsigned __int8 *a1@<X8>)
{
  sub_100014324(*(unsigned char *)(v1 + 16), a1);
}

uint64_t sub_10000DA30()
{
  uint64_t v0 = sub_1000088A0(&qword_1000206E0);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100015120();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000088A0(&qword_100020530);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_1000088A0(&qword_1000204D8);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_100015210();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_1000088A0(&qword_100020870);
  sub_100015200();
  char v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_100014F10();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  BOOL v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_10000CFDC();
  uint64_t v19 = v23;
  uint64_t v24 = sub_100014F90();
  sub_1000088A0(&qword_1000206F0);
  sub_100015200();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100015370();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_100014FA0();
  return v24;
}

uint64_t sub_10000DE70@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for AlertHapticsPickerControl()
{
  return &type metadata for AlertHapticsPickerControl;
}

ValueMetadata *type metadata accessor for ShowInStatusBarToggleControl()
{
  return &type metadata for ShowInStatusBarToggleControl;
}

uint64_t sub_10000DE9C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000DEB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_1000088A0(&qword_1000208D0);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000088A0(&qword_1000208D8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000088A0(&qword_1000208E0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000088A0(&qword_1000208E8);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_1000088A0(&qword_1000208F0);
  sub_10000A29C();
  sub_1000090B8(&qword_1000208F8, &qword_1000208F0);
  sub_100015330();
  sub_100015280();
  uint64_t v16 = sub_1000090B8(&qword_100020900, &qword_1000208D0);
  sub_1000152B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_100015280();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_100015290();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_1000152C0();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_1000152A0();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10000E3D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000088A0(&qword_1000208F0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100015280();
  sub_1000152F0();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v5, v2);
}

uint64_t sub_10000E4F8@<X0>(uint64_t a1@<X8>)
{
  sub_100015280();
  uint64_t result = sub_1000152D0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_10000E570@<X0>(uint64_t a1@<X8>)
{
  sub_100015280();
  uint64_t result = sub_1000152D0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_10000E5F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000E610@<X0>(uint64_t a1@<X8>)
{
  uint64_t v14 = a1;
  uint64_t v1 = sub_100015310();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_1000088A0(&qword_1000208A0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000088A0(&qword_1000208A8);
  uint64_t v6 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[1] = swift_getKeyPath();
  sub_100015300();
  sub_1000088A0(&qword_1000208B0);
  sub_100008200();
  sub_10000EF8C();
  sub_100006390();
  sub_10000EFE0();
  sub_100015320();
  uint64_t v9 = sub_1000090B8(&qword_1000208C8, &qword_1000208A0);
  sub_1000152C0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v15 = v2;
  uint64_t v16 = v9;
  swift_getOpaqueTypeConformance2();
  uint64_t v10 = v13;
  sub_1000152A0();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v10);
}

uint64_t sub_10000E948@<X0>(uint64_t a1@<X8>)
{
  return sub_10000E988(a1);
}

uint64_t sub_10000E96C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000E988(a1);
}

uint64_t sub_10000E988@<X0>(uint64_t a1@<X8>)
{
  sub_100015280();
  uint64_t result = sub_1000152D0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_10000E9F0@<X0>(unsigned __int8 *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_100015070();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100015210();
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v31 - v13;
  uint64_t result = __chkstk_darwin(v12);
  uint64_t v18 = (char *)&v31 - v17;
  unsigned __int8 v19 = *a1;
  if (qword_1000202C8 != -1)
  {
    uint64_t v30 = v16;
    uint64_t result = swift_once();
    uint64_t v16 = v30;
  }
  uint64_t v20 = qword_100020C08;
  if (*(void *)(qword_100020C08 + 16) && (v32 = v16, uint64_t result = sub_1000088E4(v19), (v21 & 1) != 0))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, *(void *)(v20 + 56) + *(void *)(v5 + 72) * result, v4);
    sub_100015040();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v22 = v32;
    (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v18, v14, v8);
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v11, v18, v8);
    uint64_t v23 = sub_1000152E0();
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    uint64_t v29 = v28 & 1;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v18, v8);
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v25 = 0;
    uint64_t v29 = 0;
    uint64_t v27 = 0;
  }
  *a2 = v23;
  a2[1] = v25;
  a2[2] = v29;
  a2[3] = v27;
  return result;
}

uint64_t sub_10000ECA4@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  v22[1] = a2;
  uint64_t v3 = sub_100015070();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100015210();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)v22 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)v22 - v15;
  unsigned __int8 v17 = *a1;
  if (qword_1000202C8 != -1) {
    swift_once();
  }
  uint64_t v18 = qword_100020C08;
  if (*(void *)(qword_100020C08 + 16) && (unint64_t v19 = sub_1000088E4(v17), (v20 & 1) != 0))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(void *)(v18 + 56) + *(void *)(v4 + 72) * v19, v3);
    sub_100015040();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v16, v14, v7);
  }
  else
  {
    sub_100015200();
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v16, v7);
  sub_1000152E0();
  sub_100015340();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v16, v7);
}

unint64_t sub_10000EF8C()
{
  unint64_t result = qword_1000208B8;
  if (!qword_1000208B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000208B8);
  }
  return result;
}

unint64_t sub_10000EFE0()
{
  unint64_t result = qword_1000208C0;
  if (!qword_1000208C0)
  {
    sub_10000511C(&qword_1000208B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000208C0);
  }
  return result;
}

uint64_t sub_10000F050()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000F10C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000F238()
{
  uint64_t v0 = sub_1000088A0(&qword_100020910);

  return TupleWidget.init(_:)(v0, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000F2B8()
{
  unint64_t result = qword_100020908;
  if (!qword_100020908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020908);
  }
  return result;
}

ValueMetadata *type metadata accessor for SoundAndHapticsControlsBundle()
{
  return &type metadata for SoundAndHapticsControlsBundle;
}

uint64_t sub_10000F31C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000F33C()
{
  unint64_t result = qword_100020918;
  if (!qword_100020918)
  {
    sub_10000511C(&qword_100020920);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020918);
  }
  return result;
}

unint64_t sub_10000F398(char a1)
{
  unint64_t result = 0x746F6F7223;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x73654D5F74786554;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
    case 5:
    case 17:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x5F544C5541464544;
      break;
    case 6:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 7:
      unint64_t result = 0xD00000000000003DLL;
      break;
    case 8:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 9:
      unint64_t result = 0x4D5F544E454C4953;
      break;
    case 10:
      unint64_t result = 0xD000000000000012;
      break;
    case 11:
      unint64_t result = 0xD000000000000013;
      break;
    case 12:
      unint64_t result = 0x53434954504148;
      break;
    case 13:
      unint64_t result = 0x656E6F74676E6952;
      break;
    case 14:
      unint64_t result = 0x69616D6563696F56;
      break;
    case 15:
      unint64_t result = 0x4C49414D5F57454ELL;
      break;
    case 16:
      unint64_t result = 0x49414D5F544E4553;
      break;
    case 18:
      unint64_t result = 0x485F4D4554535953;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_10000F5FC(char a1)
{
  unint64_t result = 0x746F6F7223;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x73654D5F74786554;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
    case 5:
    case 17:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x5F544C5541464544;
      break;
    case 6:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 7:
      unint64_t result = 0xD00000000000003DLL;
      break;
    case 8:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 9:
      unint64_t result = 0x4D5F544E454C4953;
      break;
    case 10:
      unint64_t result = 0xD000000000000012;
      break;
    case 11:
      unint64_t result = 0xD000000000000013;
      break;
    case 12:
      unint64_t result = 0x53434954504148;
      break;
    case 13:
      unint64_t result = 0x656E6F74676E6952;
      break;
    case 14:
      unint64_t result = 0x69616D6563696F56;
      break;
    case 15:
      unint64_t result = 0x4C49414D5F57454ELL;
      break;
    case 16:
      unint64_t result = 0x49414D5F544E4553;
      break;
    case 18:
      unint64_t result = 0x485F4D4554535953;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000F860(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_10000F5FC(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_10000F5FC(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100015390();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_10000F8F0()
{
  unint64_t result = qword_100020938;
  if (!qword_100020938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020938);
  }
  return result;
}

Swift::Int sub_10000F944()
{
  char v1 = *v0;
  sub_1000153C0();
  sub_10000F5FC(v1);
  sub_100015360();
  swift_bridgeObjectRelease();
  return sub_1000153E0();
}

uint64_t sub_10000F9A8()
{
  sub_10000F5FC(*v0);
  sub_100015360();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000F9FC()
{
  char v1 = *v0;
  sub_1000153C0();
  sub_10000F5FC(v1);
  sub_100015360();
  swift_bridgeObjectRelease();
  return sub_1000153E0();
}

uint64_t sub_10000FA5C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100012C1C();
  *a1 = result;
  return result;
}

unint64_t sub_10000FA8C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10000F5FC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000FAB8()
{
  return sub_1000090B8(&qword_100020940, &qword_100020948);
}

void sub_10000FAF4(void *a1@<X8>)
{
  *a1 = &off_10001D060;
}

unint64_t sub_10000FB04()
{
  return sub_10000F398(*v0);
}

uint64_t sub_10000FB0C@<X0>(unsigned char *a1@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_100012C1C();
  *a1 = result;
  return result;
}

unint64_t sub_10000FB58()
{
  unint64_t result = qword_100020950;
  if (!qword_100020950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020950);
  }
  return result;
}

unint64_t sub_10000FBB0()
{
  unint64_t result = qword_100020958;
  if (!qword_100020958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020958);
  }
  return result;
}

uint64_t sub_10000FC04()
{
  uint64_t v0 = sub_100015210();
  sub_100008FEC(v0, qword_100020CB0);
  sub_100008FB4(v0, (uint64_t)qword_100020CB0);
  return sub_100015200();
}

uint64_t sub_10000FC68@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100014F60();
  *a1 = v3;
  return result;
}

uint64_t sub_10000FCA4()
{
  return sub_100014F70();
}

void (*sub_10000FCDC(void *a1))(void *a1)
{
  char v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100014F50();
  return sub_100005FCC;
}

unint64_t sub_10000FD3C()
{
  unint64_t result = qword_100020960;
  if (!qword_100020960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020960);
  }
  return result;
}

uint64_t sub_10000FD90(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100013B00();
  unint64_t v5 = sub_1000129B0();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10000FDFC()
{
  unint64_t result = qword_100020968;
  if (!qword_100020968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020968);
  }
  return result;
}

unint64_t sub_10000FE54()
{
  unint64_t result = qword_100020970;
  if (!qword_100020970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020970);
  }
  return result;
}

unint64_t sub_10000FEAC()
{
  unint64_t result = qword_100020978;
  if (!qword_100020978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020978);
  }
  return result;
}

uint64_t sub_10000FF00()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000FF50@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B03C(&qword_100020310, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100020CB0, a1);
}

uint64_t sub_10000FF88()
{
  return 0;
}

uint64_t sub_10000FF90()
{
  return 1;
}

uint64_t sub_10000FF9C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100013B00();
  unint64_t v6 = sub_100013B54();
  unint64_t v7 = sub_1000129B0();
  *unint64_t v4 = v2;
  v4[1] = sub_100010068;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100010068()
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

uint64_t sub_100010170@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100012C70();
  *a1 = result;
  return result;
}

uint64_t sub_100010198(uint64_t a1)
{
  unint64_t v2 = sub_10000FD3C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_1000101D8()
{
  unint64_t result = qword_100020988;
  if (!qword_100020988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020988);
  }
  return result;
}

unint64_t sub_100010230()
{
  unint64_t result = qword_100020990;
  if (!qword_100020990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020990);
  }
  return result;
}

unint64_t sub_100010288()
{
  unint64_t result = qword_100020998[0];
  if (!qword_100020998[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100020998);
  }
  return result;
}

uint64_t sub_1000102DC()
{
  uint64_t v0 = sub_1000088A0(&qword_1000204D8);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100015210();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_1000151A0();
  sub_100008FEC(v5, qword_100020CC8);
  sub_100008FB4(v5, (uint64_t)qword_100020CC8);
  sub_100015200();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_100015190();
}

uint64_t sub_100010448(char a1)
{
  uint64_t v2 = sub_1000088A0(&qword_1000204D0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000088A0(&qword_1000204D8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100015210();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  __chkstk_darwin(v10);
  switch(a1)
  {
    case 1:
    case 17:
      sub_100015200();
      sub_100015200();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      sub_100015020();
      uint64_t v15 = sub_100015030();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v4, 0, 1, v15);
      sub_1000088A0(&qword_1000204F8);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100016EE0;
      sub_100015200();
      sub_100015200();
      sub_100015200();
      break;
    case 2:
    case 8:
    case 9:
    case 10:
    case 12:
    case 13:
      sub_100015200();
      sub_100015200();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      sub_100015020();
      uint64_t v13 = sub_100015030();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 0, 1, v13);
      sub_1000088A0(&qword_1000204F8);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000158A0;
      sub_100015200();
      break;
    case 3:
    case 4:
    case 5:
    case 11:
    case 15:
    case 16:
    case 18:
      sub_100015200();
      sub_100015200();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      sub_100015020();
      uint64_t v16 = sub_100015030();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v4, 0, 1, v16);
      break;
    case 6:
    case 7:
      sub_100015200();
      sub_100015200();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      sub_100015020();
      uint64_t v12 = sub_100015030();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v4, 0, 1, v12);
      sub_1000088A0(&qword_1000204F8);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100016EF0;
      sub_100015200();
      sub_100015200();
      break;
    case 14:
      sub_100015200();
      sub_100015200();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      sub_100015020();
      uint64_t v14 = sub_100015030();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 0, 1, v14);
      sub_1000088A0(&qword_1000204F8);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000158A0;
      sub_100015200();
      break;
    default:
      sub_100015200();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
      sub_100015020();
      uint64_t v11 = sub_100015030();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v4, 0, 1, v11);
      sub_1000088A0(&qword_1000204F8);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000158A0;
      sub_100015200();
      break;
  }
  sub_100015200();
  return sub_100015050();
}

uint64_t sub_100011B4C(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100020A90 + dword_100020A90);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100006B10;
  return v5(a1);
}

uint64_t sub_100011BF4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100020A80 + dword_100020A80);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100009160;
  return v4();
}

unint64_t sub_100011C9C()
{
  unint64_t result = qword_1000209B0;
  if (!qword_1000209B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000209B0);
  }
  return result;
}

uint64_t sub_100011CF0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100020A70 + dword_100020A70);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10000683C;
  return v4();
}

unint64_t sub_100011D98()
{
  unint64_t result = qword_1000209C0;
  if (!qword_1000209C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000209C0);
  }
  return result;
}

unint64_t sub_100011DF0()
{
  unint64_t result = qword_1000209C8;
  if (!qword_1000209C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000209C8);
  }
  return result;
}

unint64_t sub_100011E48()
{
  unint64_t result = qword_1000209D0;
  if (!qword_1000209D0)
  {
    sub_10000511C(qword_1000209D8);
    sub_100011DF0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000209D0);
  }
  return result;
}

uint64_t sub_100011EBC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100011C9C();
  *uint64_t v5 = v2;
  v5[1] = sub_100006E9C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100011F70(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100020A68 + dword_100020A68);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100012014;
  return v4();
}

uint64_t sub_100012014(char a1)
{
  uint64_t v3 = *(unsigned char **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  unsigned char *v3 = a1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

unint64_t sub_100012128()
{
  unint64_t result = qword_1000209F0;
  if (!qword_1000209F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000209F0);
  }
  return result;
}

uint64_t sub_10001217C()
{
  uint64_t v0 = sub_1000088A0(&qword_100020A58);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000088A0(&qword_100020A60);
  __chkstk_darwin(v4);
  sub_100010288();
  sub_100015100();
  v7._object = (void *)0x8000000100018E30;
  v7._countAndFlagsBits = 0xD000000000000030;
  sub_1000150F0(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_1000150E0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_1000150F0(v8);
  return sub_100015110();
}

uint64_t sub_100012338()
{
  uint64_t v0 = qword_100020928;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100012374()
{
  unint64_t result = qword_1000209F8;
  if (!qword_1000209F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000209F8);
  }
  return result;
}

unint64_t sub_1000123CC()
{
  unint64_t result = qword_100020A00;
  if (!qword_100020A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020A00);
  }
  return result;
}

unint64_t sub_100012424()
{
  unint64_t result = qword_100020A08;
  if (!qword_100020A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020A08);
  }
  return result;
}

uint64_t sub_100012478()
{
  sub_1000129B0();
  uint64_t v2 = sub_1000150B0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_1000090A4(v3, v0, v2, v1);
}

unint64_t sub_100012510()
{
  unint64_t result = qword_100020A18;
  if (!qword_100020A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020A18);
  }
  return result;
}

unint64_t sub_100012568()
{
  unint64_t result = qword_100020A20;
  if (!qword_100020A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020A20);
  }
  return result;
}

unint64_t sub_1000125C0()
{
  unint64_t result = qword_100020A28;
  if (!qword_100020A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020A28);
  }
  return result;
}

unint64_t sub_100012618()
{
  unint64_t result = qword_100020A30;
  if (!qword_100020A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020A30);
  }
  return result;
}

void sub_10001266C(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100012678@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B03C(&qword_100020318, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100020CC8, a1);
}

uint64_t sub_1000126B0()
{
  return sub_1000090B8(&qword_100020A38, &qword_100020A40);
}

uint64_t sub_1000126EC(uint64_t a1)
{
  unint64_t v2 = sub_100010288();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001273C()
{
  unint64_t result = qword_100020A48;
  if (!qword_100020A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020A48);
  }
  return result;
}

uint64_t sub_100012790()
{
  return sub_100010448(*v0);
}

uint64_t sub_100012798(uint64_t a1)
{
  unint64_t v2 = sub_1000125C0();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SoundsAndHapticsDeepLinks.AvailableLinksQuery()
{
  return &type metadata for SoundsAndHapticsDeepLinks.AvailableLinksQuery;
}

ValueMetadata *type metadata accessor for SoundsAndHapticsDeepLinks()
{
  return &type metadata for SoundsAndHapticsDeepLinks;
}

ValueMetadata *type metadata accessor for OpenSoundsAndHapticsDeepLinks()
{
  return &type metadata for OpenSoundsAndHapticsDeepLinks;
}

uint64_t _s23SoundAndHapticsControls27SoundsAndHapticsDestinationOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEE) {
    goto LABEL_17;
  }
  if (a2 + 18 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 18) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 18;
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
      return (*a1 | (v4 << 8)) - 18;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 18;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x13;
  int v8 = v6 - 19;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s23SoundAndHapticsControls27SoundsAndHapticsDestinationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 18 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 18) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xED)
  {
    unsigned int v6 = ((a2 - 238) >> 8) + 1;
    *unint64_t result = a2 + 18;
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
        JUMPOUT(0x100012978);
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
          *unint64_t result = a2 + 18;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SoundsAndHapticsDestination()
{
  return &type metadata for SoundsAndHapticsDestination;
}

unint64_t sub_1000129B0()
{
  unint64_t result = qword_100020A50;
  if (!qword_100020A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020A50);
  }
  return result;
}

char *sub_100012A04(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100012A44(a1, a2, a3, *v3);
  char *v3 = result;
  return result;
}

char *sub_100012A24(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100012B30(a1, a2, a3, *v3);
  char *v3 = result;
  return result;
}

char *sub_100012A44(char *result, int64_t a2, char a3, char *a4)
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
    sub_1000088A0(&qword_100020A78);
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

char *sub_100012B30(char *result, int64_t a2, char a3, char *a4)
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
    sub_1000088A0(&qword_100020A88);
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

uint64_t sub_100012C1C()
{
  unint64_t v0 = sub_1000153A0();
  swift_bridgeObjectRelease();
  if (v0 >= 0x13) {
    return 19;
  }
  else {
    return v0;
  }
}

uint64_t sub_100012C70()
{
  uint64_t v17 = sub_100015120();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  int v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000088A0(&qword_100020530);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  int64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_1000088A0(&qword_1000204D8);
  __chkstk_darwin(v9 - 8);
  size_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100015210();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_1000088A0(&qword_100020A98);
  sub_100015200();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 19;
  uint64_t v14 = sub_100014F10();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_100010288();
  return sub_100014F90();
}

uint64_t sub_100012F58()
{
  return _swift_task_switch(sub_100012F74, 0, 0);
}

uint64_t sub_100012F74()
{
  uint64_t v1 = 19;
  sub_100012A04(0, 19, 0);
  int v2 = &_swiftEmptyArrayStorage;
  unint64_t v3 = *((void *)&_swiftEmptyArrayStorage + 2);
  uint64_t v4 = &byte_10001D080;
  do
  {
    char v6 = *v4++;
    char v5 = v6;
    uint64_t v10 = v2;
    unint64_t v7 = v2[3];
    if (v3 >= v7 >> 1)
    {
      sub_100012A04((char *)(v7 > 1), v3 + 1, 1);
      int v2 = v10;
    }
    v2[2] = v3 + 1;
    *((unsigned char *)v2 + v3++ + 32) = v5;
    --v1;
  }
  while (v1);
  int64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_100013078(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100013098, 0, 0);
}

uint64_t sub_100013098()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  int v2 = sub_1000131E4(v1);
  swift_bridgeObjectRelease();
  int64_t v3 = v2[2];
  if (v3)
  {
    sub_100012A04(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v6 = *((unsigned char *)v2 + v4 + 32);
      unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v5 + v4 >= v7 >> 1) {
        sub_100012A04((char *)(v7 > 1), v5 + v4 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v5 + v4 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v5 + v4++ + 32) = v6;
    }
    while (v3 != v4);
  }
  swift_bridgeObjectRelease();
  int64_t v8 = *(uint64_t (**)(void *))(v0 + 8);
  return v8(&_swiftEmptyArrayStorage);
}

void *sub_1000131E4(uint64_t a1)
{
  unint64_t v36 = *(void *)(a1 + 16);
  if (!v36) {
    return &_swiftEmptyArrayStorage;
  }
  unint64_t v1 = 0;
  uint64_t v2 = a1 + 32;
  unint64_t result = &_swiftEmptyArrayStorage;
  uint64_t v35 = v2;
LABEL_3:
  v37 = result;
  uint64_t v4 = 0;
  unint64_t v5 = v36;
  if (v1 <= v36) {
    unint64_t v6 = v36;
  }
  else {
    unint64_t v6 = v1;
  }
  unint64_t v7 = v1 - v6;
  while (2)
  {
    if (!(v7 + v4))
    {
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
    }
    char v10 = *(unsigned char *)(v2 + v1);
    switch(v10)
    {
      case 9:
        id v18 = (id)MobileGestalt_get_current_device();
        if (!v18) {
          goto LABEL_42;
        }
        unint64_t v19 = v18;
        char ringerSwitchCapability = MobileGestalt_get_ringerSwitchCapability();
        goto LABEL_28;
      case 10:
        id v21 = (id)MobileGestalt_get_current_device();
        if (!v21) {
          goto LABEL_43;
        }
        uint64_t v22 = v21;
        char ringerButtonCapability = MobileGestalt_get_ringerButtonCapability();

        if (ringerButtonCapability) {
          goto LABEL_8;
        }
        id v24 = (id)MobileGestalt_get_current_device();
        if (!v24)
        {
          __break(1u);
          JUMPOUT(0x100013558);
        }
        goto LABEL_27;
      case 11:
      case 13:
      case 14:
        id v11 = (id)MobileGestalt_get_current_device();
        if (!v11) {
          goto LABEL_40;
        }
        uint64_t v12 = v11;
        char telephonyCapability = MobileGestalt_get_telephonyCapability();

        if (telephonyCapability) {
          goto LABEL_31;
        }
        goto LABEL_8;
      case 12:
        id v24 = (id)MobileGestalt_get_current_device();
        if (!v24) {
          goto LABEL_44;
        }
        goto LABEL_27;
      case 15:
      case 16:
        id v14 = objc_allocWithZone((Class)LSApplicationRecord);
        NSString v15 = sub_100015350();
        id v38 = 0;
        id v16 = [v14 initWithBundleIdentifier:v15 allowPlaceholder:0 error:&v38];

        if (!v16)
        {
          id v17 = v38;
          sub_1000151F0();

          swift_willThrow();
          swift_errorRelease();
LABEL_8:
          ++v4;
          ++v2;
          if (v1 == --v5) {
            return v37;
          }
          continue;
        }
        id v29 = v38;

LABEL_31:
        uint64_t v30 = v37;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v39 = v37;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_100012A24(0, v37[2] + 1, 1);
          uint64_t v30 = v39;
        }
        uint64_t v2 = v35;
        unint64_t result = v30;
        unint64_t v32 = v30[2];
        unint64_t v33 = result[3];
        if (v32 >= v33 >> 1)
        {
          sub_100012A24((char *)(v33 > 1), v32 + 1, 1);
          uint64_t v2 = v35;
          unint64_t result = v39;
        }
        unint64_t v34 = v1 + 1;
        v1 += 1 + v4;
        result[2] = v32 + 1;
        *((unsigned char *)result + v32 + 32) = v10;
        if (v34 != v5) {
          goto LABEL_3;
        }
        return result;
      case 17:
        id v8 = [self currentDevice];
        id v9 = [v8 _feedbackSupportLevel];

        if (v9 != (id)2) {
          goto LABEL_8;
        }
        goto LABEL_31;
      case 18:
        id v25 = (id)MobileGestalt_get_current_device();
        if (!v25) {
          goto LABEL_41;
        }
        uint64_t v26 = v25;
        char deviceSupportsClosedLoopHaptics = MobileGestalt_get_deviceSupportsClosedLoopHaptics();

        if ((deviceSupportsClosedLoopHaptics & 1) == 0) {
          goto LABEL_8;
        }
        id v24 = (id)MobileGestalt_get_current_device();
        if (!v24) {
          goto LABEL_45;
        }
LABEL_27:
        unint64_t v19 = v24;
        char ringerSwitchCapability = MobileGestalt_get_iPadCapability();
LABEL_28:
        char v28 = ringerSwitchCapability;

        if ((v28 & 1) == 0) {
          goto LABEL_31;
        }
        goto LABEL_8;
      default:
        goto LABEL_31;
    }
  }
}

uint64_t sub_1000135A4()
{
  return _swift_task_switch(sub_1000135C0, 0, 0);
}

uint64_t sub_1000135C0()
{
  unint64_t v1 = sub_1000131E4((uint64_t)&off_10001D060);
  int64_t v2 = v1[2];
  if (v2)
  {
    sub_100012A04(0, v2, 0);
    uint64_t v3 = 0;
    uint64_t v4 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v5 = *((unsigned char *)v1 + v3 + 32);
      unint64_t v6 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v4 + v3 >= v6 >> 1) {
        sub_100012A04((char *)(v6 > 1), v4 + v3 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v4 + v3 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v4 + v3++ + 32) = v5;
    }
    while (v2 != v3);
  }
  swift_bridgeObjectRelease();
  unint64_t v7 = *(uint64_t (**)(void *))(v0 + 8);
  return v7(&_swiftEmptyArrayStorage);
}

uint64_t sub_100013700()
{
  return _swift_task_switch(sub_10001378C, 0, 0);
}

uint64_t sub_10001378C()
{
  uint64_t v1 = 19;
  int64_t v2 = (void **)(v0 + 16);
  uint64_t v3 = &byte_10001D080;
  while (2)
  {
    unsigned int v7 = *v3++;
    uint64_t v6 = v7;
    switch(v7)
    {
      case 9u:
        id v16 = (id)MobileGestalt_get_current_device();
        if (!v16) {
          goto LABEL_34;
        }
        id v17 = v16;
        char ringerSwitchCapability = MobileGestalt_get_ringerSwitchCapability();

        if (ringerSwitchCapability) {
          goto LABEL_3;
        }
        uint64_t v6 = 9;
        goto LABEL_27;
      case 0xAu:
        id v19 = (id)MobileGestalt_get_current_device();
        if (!v19)
        {
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
          JUMPOUT(0x100013AB0);
        }
        char v20 = v19;
        char ringerButtonCapability = MobileGestalt_get_ringerButtonCapability();

        if (ringerButtonCapability) {
          goto LABEL_3;
        }
        id v22 = (id)MobileGestalt_get_current_device();
        if (!v22) {
          goto LABEL_37;
        }
        uint64_t v23 = v22;
        char iPadCapability = MobileGestalt_get_iPadCapability();

        if (iPadCapability) {
          goto LABEL_3;
        }
        uint64_t v6 = 10;
        goto LABEL_27;
      case 0xBu:
      case 0xDu:
      case 0xEu:
        id v8 = (id)MobileGestalt_get_current_device();
        if (!v8) {
          __break(1u);
        }
        uint64_t v9 = v8;
        char telephonyCapability = MobileGestalt_get_telephonyCapability();

        if (telephonyCapability) {
          goto LABEL_27;
        }
        goto LABEL_3;
      case 0xCu:
        id v25 = (id)MobileGestalt_get_current_device();
        if (!v25) {
          goto LABEL_35;
        }
        uint64_t v26 = v25;
        char v27 = MobileGestalt_get_iPadCapability();

        if (v27) {
          goto LABEL_3;
        }
        uint64_t v6 = 12;
        goto LABEL_27;
      case 0xFu:
      case 0x10u:
        id v11 = objc_allocWithZone((Class)LSApplicationRecord);
        NSString v12 = sub_100015350();
        *int64_t v2 = 0;
        id v13 = [v11 initWithBundleIdentifier:v12 allowPlaceholder:0 error:v0 + 16];

        id v14 = *v2;
        if (!v13)
        {
          id v15 = v14;
          sub_1000151F0();

          swift_willThrow();
          swift_errorRelease();
LABEL_3:
          if (!--v1)
          {
            uint64_t v6 = 19;
            goto LABEL_27;
          }
          continue;
        }
        id v36 = v14;

LABEL_27:
        unint64_t v34 = *(uint64_t (**)(uint64_t))(v0 + 8);
        return v34(v6);
      case 0x11u:
        id v4 = [self currentDevice];
        id v5 = [v4 _feedbackSupportLevel];

        if (v5 != (id)2) {
          goto LABEL_3;
        }
        uint64_t v6 = 17;
        goto LABEL_27;
      case 0x12u:
        id v28 = (id)MobileGestalt_get_current_device();
        if (!v28) {
          goto LABEL_36;
        }
        id v29 = v28;
        char deviceSupportsClosedLoopHaptics = MobileGestalt_get_deviceSupportsClosedLoopHaptics();

        if ((deviceSupportsClosedLoopHaptics & 1) == 0) {
          goto LABEL_3;
        }
        id v31 = (id)MobileGestalt_get_current_device();
        if (!v31) {
          goto LABEL_38;
        }
        unint64_t v32 = v31;
        int v33 = MobileGestalt_get_iPadCapability();

        if (v33) {
          goto LABEL_3;
        }
        uint64_t v6 = 18;
        goto LABEL_27;
      default:
        goto LABEL_27;
    }
  }
}

unint64_t sub_100013B00()
{
  unint64_t result = qword_100020AA0;
  if (!qword_100020AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020AA0);
  }
  return result;
}

unint64_t sub_100013B54()
{
  unint64_t result = qword_100020AA8;
  if (!qword_100020AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020AA8);
  }
  return result;
}

BOOL sub_100013BA8()
{
  swift_getKeyPath();
  sub_10000B35C();
  sub_100015230();
  swift_release();
  uint64_t v0 = (__CFString *)sub_100015350();
  uint64_t v1 = (__CFString *)sub_100015350();
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v0, v1, 0);

  uint64_t v3 = (__CFString *)sub_100015350();
  id v4 = (__CFString *)sub_100015350();
  int v5 = CFPreferencesGetAppBooleanValue(v3, v4, 0);

  uint64_t v6 = 2;
  if (!v5) {
    uint64_t v6 = 3;
  }
  if (AppBooleanValue) {
    return v5 == 0;
  }
  else {
    return v6;
  }
}

uint64_t sub_100013CE8()
{
  return swift_release();
}

BOOL sub_100013D98()
{
  swift_getKeyPath();
  sub_10000B35C();
  sub_100015230();
  swift_release();
  uint64_t v0 = (__CFString *)sub_100015350();
  uint64_t v1 = (__CFString *)sub_100015350();
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v0, v1, 0);

  return AppBooleanValue != 0;
}

uint64_t sub_100013E6C()
{
  return swift_release();
}

id sub_100013F20()
{
  swift_getKeyPath();
  sub_10000B35C();
  sub_100015230();
  swift_release();
  id result = [self sharedInstance];
  if (result)
  {
    uint64_t v1 = result;
    id v2 = [result getSilentMode];

    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100013FD0()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for SoundsSettings()) init];
  qword_100020CE0 = (uint64_t)result;
  return result;
}

void sub_1000141D4(unsigned __int8 *a1@<X8>)
{
  swift_getKeyPath();
  sub_10000B35C();
  sub_100015230();
  swift_release();
  id v2 = [self sharedInstance];
  if (v2)
  {
    uint64_t v3 = v2;
    unsigned __int8 v4 = [v2 getSilentMode];

    *a1 = v4;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100014288()
{
  return swift_release();
}

void sub_100014324(char a1@<W0>, unsigned __int8 *a2@<X8>)
{
  id v4 = [self sharedInstance];
  if (v4)
  {
    int v5 = v4;
    NSString v6 = sub_100015350();
    unsigned __int8 v7 = [v5 setSilentMode:a1 & 1 untilTime:0 reason:v6 clientType:7];

    *a2 = v7;
  }
  else
  {
    __break(1u);
  }
}

BOOL sub_1000144D0@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_100013D98();
  *a1 = result;
  return result;
}

uint64_t sub_100014500()
{
  return sub_100013E6C();
}

void sub_100014528(char a1)
{
  id v2 = (__CFString *)sub_100015350();
  id v3 = [objc_allocWithZone((Class)NSNumber) initWithBool:a1 & 1];
  id v4 = (__CFString *)sub_100015350();
  CFPreferencesSetValue(v2, v3, v4, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

  int v5 = (__CFString *)sub_100015350();
  CFPreferencesSynchronize(v5, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

  NSString v6 = sub_100015350();
  NSString v7 = sub_100015350();
  GSSendAppPreferencesChanged();
}

void sub_100014768(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      uint64_t v1 = (__CFString *)sub_100015350();
      id v2 = (id *)&kCFBooleanTrue;
      goto LABEL_5;
    case 1:
      id v13 = (__CFString *)sub_100015350();
      CFBooleanRef v14 = kCFBooleanTrue;
      id v15 = (__CFString *)sub_100015350();
      CFStringRef v6 = kCFPreferencesCurrentUser;
      CFStringRef v7 = kCFPreferencesAnyHost;
      CFPreferencesSetValue(v13, v14, v15, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

      id v8 = (__CFString *)sub_100015350();
      uint64_t v9 = (id *)&kCFBooleanFalse;
      goto LABEL_7;
    case 2:
      id v3 = (__CFString *)sub_100015350();
      CFBooleanRef v4 = kCFBooleanFalse;
      int v5 = (__CFString *)sub_100015350();
      CFStringRef v6 = kCFPreferencesCurrentUser;
      CFStringRef v7 = kCFPreferencesAnyHost;
      CFPreferencesSetValue(v3, v4, v5, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

      id v8 = (__CFString *)sub_100015350();
      uint64_t v9 = (id *)&kCFBooleanTrue;
LABEL_7:
      id v12 = *v9;
      break;
    case 3:
      uint64_t v1 = (__CFString *)sub_100015350();
      id v2 = (id *)&kCFBooleanFalse;
LABEL_5:
      id v10 = *v2;
      id v11 = (__CFString *)sub_100015350();
      CFStringRef v6 = kCFPreferencesCurrentUser;
      CFStringRef v7 = kCFPreferencesAnyHost;
      CFPreferencesSetValue(v1, v10, v11, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

      id v8 = (__CFString *)sub_100015350();
      id v12 = v10;
      break;
    default:
      sub_1000153B0();
      __break(1u);
      JUMPOUT(0x100014AE8);
  }
  id v16 = v12;
  id v17 = (__CFString *)sub_100015350();
  CFPreferencesSetValue(v8, v16, v17, v6, v7);

  id v18 = (__CFString *)sub_100015350();
  CFPreferencesSynchronize(v18, v6, v7);
}

id sub_100014B4C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100014BF0()
{
  return type metadata accessor for SoundsSettings();
}

uint64_t type metadata accessor for SoundsSettings()
{
  uint64_t result = qword_100020AE0;
  if (!qword_100020AE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100014C44()
{
  uint64_t result = sub_100015250();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

BOOL sub_100014CD4@<W0>(BOOL *a1@<X8>)
{
  BOOL result = sub_100013BA8();
  *a1 = result;
  return result;
}

uint64_t sub_100014D00()
{
  return sub_100013CE8();
}

void sub_100014D28()
{
  sub_100014768(*(void *)(v0 + 16));
}

BOOL sub_100014D44@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_100013D98();
  *a1 = result;
  return result;
}

uint64_t sub_100014D74()
{
  return sub_100013E6C();
}

void sub_100014D9C()
{
  sub_100014528(*(unsigned char *)(v0 + 16));
}

void sub_100014DC4(unsigned __int8 *a1@<X8>)
{
}

void sub_100014DDC()
{
}

void sub_100014DF4()
{
}

uint64_t sub_100014E0C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100014E70()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100014E80()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100014E90()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_100014EA0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100014EB0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100014EE0()
{
  return IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)();
}

uint64_t sub_100014F00()
{
  return IntentDialog.init<A, B>(from:capturedContent:)();
}

uint64_t sub_100014F10()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100014F20()
{
  return static IntentResult.result<A>(value:dialog:)();
}

uint64_t sub_100014F40()
{
  return _UniqueEntity.id.getter();
}

uint64_t sub_100014F50()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100014F60()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100014F70()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100014F80()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100014F90()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100014FA0()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_100014FB0()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_100014FC0()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_100015000()
{
  return static _DialogBuilderEntity.buildBlock<A>(_:)();
}

uint64_t sub_100015010()
{
  return static _DialogBuilderEntity.buildExpression<A, B>(_:)();
}

uint64_t sub_100015020()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100015030()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100015040()
{
  return DisplayRepresentation.title.getter();
}

uint64_t sub_100015050()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100015060()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_100015070()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100015080()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_1000150A0()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_1000150B0()
{
  return URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_1000150E0()
{
  return EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_1000150F0(Swift::String a1)
{
}

uint64_t sub_100015100()
{
  return EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100015110()
{
  return EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_100015120()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100015130()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_100015150()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100015160()
{
  return _EntityURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_100015170()
{
  return type metadata accessor for _GeneratedContentOptions();
}

uint64_t sub_100015180()
{
  return TypeDisplayRepresentation.init(name:numericFormat:synonyms:)();
}

uint64_t sub_100015190()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_1000151A0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_1000151B0()
{
  return type metadata accessor for _GeneratedContentFallback();
}

uint64_t sub_1000151D0()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_1000151E0()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_1000151F0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100015200()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100015210()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100015220()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t sub_100015230()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t sub_100015240()
{
  return ObservationRegistrar.init()();
}

uint64_t sub_100015250()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t sub_100015270()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100015280()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100015290()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_1000152A0()
{
  return WidgetConfiguration.hiddenControl()();
}

uint64_t sub_1000152B0()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_1000152C0()
{
  return WidgetConfiguration.disablesControlStateCaching()();
}

uint64_t sub_1000152D0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_1000152E0()
{
  return Text.init(_:)();
}

uint64_t sub_1000152F0()
{
  return Label<>.init(_:systemImage:)();
}

uint64_t sub_100015300()
{
  return static ControlSize._1x1.getter();
}

uint64_t sub_100015310()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_100015320()
{
  return ControlPicker.init<A, B, C, D, E, F, G, H>(kind:displayName:preferredSize:intentUpdatableProperty:title:subtitle:value:affordances:)();
}

uint64_t sub_100015330()
{
  return ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)();
}

uint64_t sub_100015340()
{
  return ControlAffordances.init(tint:status:actionHint:)();
}

NSString sub_100015350()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100015360()
{
  return String.hash(into:)();
}

uint64_t sub_100015370()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_100015380()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100015390()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000153A0()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_1000153B0()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t sub_1000153C0()
{
  return Hasher.init(_seed:)();
}

void sub_1000153D0(Swift::UInt a1)
{
}

Swift::Int sub_1000153E0()
{
  return Hasher._finalize()();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

uint64_t GSSendAppPreferencesChanged()
{
  return _GSSendAppPreferencesChanged();
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t MobileGestalt_get_deviceSupportsClosedLoopHaptics()
{
  return _MobileGestalt_get_deviceSupportsClosedLoopHaptics();
}

uint64_t MobileGestalt_get_iPadCapability()
{
  return _MobileGestalt_get_iPadCapability();
}

uint64_t MobileGestalt_get_ringerButtonCapability()
{
  return _MobileGestalt_get_ringerButtonCapability();
}

uint64_t MobileGestalt_get_ringerSwitchCapability()
{
  return _MobileGestalt_get_ringerSwitchCapability();
}

uint64_t MobileGestalt_get_telephonyCapability()
{
  return _MobileGestalt_get_telephonyCapability();
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}