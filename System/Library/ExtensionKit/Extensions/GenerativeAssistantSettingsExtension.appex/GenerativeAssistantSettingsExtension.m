unint64_t sub_1000050A4()
{
  unint64_t result;

  result = qword_100018078;
  if (!qword_100018078)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018078);
  }
  return result;
}

unint64_t sub_1000050FC()
{
  unint64_t result = qword_100018080;
  if (!qword_100018080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018080);
  }
  return result;
}

uint64_t sub_100005150(uint64_t a1)
{
  return sub_100007854(a1, qword_100018670);
}

uint64_t (*sub_100005174(void *a1))()
{
  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10000F750();
  return sub_1000051D0;
}

unint64_t sub_1000051D8()
{
  unint64_t result = qword_100018088;
  if (!qword_100018088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018088);
  }
  return result;
}

uint64_t sub_10000522C(uint64_t a1, uint64_t a2)
{
  return sub_100007B48(a1, a2, (uint64_t (*)(void))sub_100009B6C, (uint64_t (*)(void))sub_100009B18);
}

unint64_t sub_10000525C()
{
  unint64_t result = qword_100018090;
  if (!qword_100018090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018090);
  }
  return result;
}

unint64_t sub_1000052B4()
{
  unint64_t result = qword_100018098;
  if (!qword_100018098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018098);
  }
  return result;
}

unint64_t sub_10000530C()
{
  unint64_t result = qword_1000180A0;
  if (!qword_1000180A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000180A0);
  }
  return result;
}

uint64_t sub_100005360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100007C84(a1, a2, a3, (void (*)(void))sub_1000051D8);
}

uint64_t sub_100005378@<X0>(uint64_t a1@<X8>)
{
  return sub_10000909C(&qword_100018000, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100018670, a1);
}

uint64_t sub_1000053B0()
{
  return 0;
}

uint64_t sub_1000053BC()
{
  return 1;
}

uint64_t sub_1000053CC(uint64_t a1, uint64_t a2)
{
  v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100009B6C();
  unint64_t v6 = sub_100009BC0();
  unint64_t v7 = sub_100009B18();
  void *v4 = v2;
  v4[1] = sub_100009C24;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100005498@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009688(&qword_1000183F8, 0xD00000000000002FLL, 0x800000010000FFB0, (void (*)(uint64_t))sub_100005A9C);
  *a1 = result;
  return result;
}

uint64_t sub_1000054F4(uint64_t a1)
{
  unint64_t v2 = sub_1000051D8();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100005534()
{
  unint64_t result = qword_1000180B0;
  if (!qword_1000180B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000180B0);
  }
  return result;
}

unint64_t sub_10000558C()
{
  unint64_t result = qword_1000180B8;
  if (!qword_1000180B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000180B8);
  }
  return result;
}

uint64_t sub_1000055E0()
{
  uint64_t v0 = sub_100009540(&qword_1000183A0);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10000F900();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000F970();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10000F9A0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10000F910();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10000F8B0();
  sub_1000095BC(v10, qword_100018688);
  sub_100009584(v10, (uint64_t)qword_100018688);
  sub_10000F990();
  sub_10000F960();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10000F920();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10000F8A0();
}

uint64_t sub_1000058C0()
{
  return _swift_task_switch(sub_100009C28, 0, 0);
}

unint64_t sub_1000058E0()
{
  unint64_t result = qword_1000180C8;
  if (!qword_1000180C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000180C8);
  }
  return result;
}

uint64_t sub_100005934(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100005FBC();
  void *v4 = v2;
  v4[1] = sub_100009C14;
  return UniqueAppEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_1000059EC()
{
  unint64_t result = qword_1000180D8;
  if (!qword_1000180D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000180D8);
  }
  return result;
}

unint64_t sub_100005A44()
{
  unint64_t result = qword_1000180E0;
  if (!qword_1000180E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000180E0);
  }
  return result;
}

unint64_t sub_100005A9C()
{
  unint64_t result = qword_1000180E8[0];
  if (!qword_1000180E8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000180E8);
  }
  return result;
}

uint64_t sub_100005AF4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100005FBC();
  *unint64_t v5 = v2;
  v5[1] = sub_100009C1C;
  return UniqueAppEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100005BA8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100005FBC();
  void *v4 = v2;
  v4[1] = sub_100009C14;
  return UniqueAppEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100005C5C()
{
  unint64_t result = qword_100018100;
  if (!qword_100018100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018100);
  }
  return result;
}

unint64_t sub_100005CB4()
{
  unint64_t result = qword_100018108;
  if (!qword_100018108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018108);
  }
  return result;
}

uint64_t sub_100005D08()
{
  return sub_1000089A4(&qword_100018110, qword_100018118, (void (*)(void))sub_100005CB4);
}

uint64_t sub_100005D44(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005D8C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000058E0();
  *unint64_t v5 = v2;
  v5[1] = sub_100009C2C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100005E40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100009C2C;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

unint64_t sub_100005F00()
{
  unint64_t result = qword_100018130;
  if (!qword_100018130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018130);
  }
  return result;
}

unint64_t sub_100005F58()
{
  unint64_t result = qword_100018138;
  if (!qword_100018138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018138);
  }
  return result;
}

void *sub_100005FAC()
{
  return &protocol witness table for String;
}

unint64_t sub_100005FBC()
{
  unint64_t result = qword_100018140;
  if (!qword_100018140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018140);
  }
  return result;
}

uint64_t sub_100006010()
{
  uint64_t v0 = qword_100018008;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10000604C()
{
  unint64_t result = qword_100018148;
  if (!qword_100018148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018148);
  }
  return result;
}

uint64_t sub_1000060A0(uint64_t a1)
{
  unint64_t v2 = sub_100005A9C();

  return EntityURLRepresentation.init(stringLiteral:)(0xD00000000000004FLL, 0x800000010000FF60, a1, v2);
}

unint64_t sub_100006100()
{
  unint64_t result = qword_100018150;
  if (!qword_100018150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018150);
  }
  return result;
}

unint64_t sub_100006158()
{
  unint64_t result = qword_100018158;
  if (!qword_100018158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018158);
  }
  return result;
}

unint64_t sub_1000061B0()
{
  unint64_t result = qword_100018160;
  if (!qword_100018160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018160);
  }
  return result;
}

void *sub_100006204()
{
  return &protocol witness table for String;
}

uint64_t sub_100006210@<X0>(uint64_t *a1@<X8>)
{
  return sub_100008F8C((void (*)(void))sub_10000558C, a1);
}

uint64_t sub_100006228()
{
  sub_100009B18();
  uint64_t v2 = sub_10000F800();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100009674(v3, v0, v2, v1);
}

uint64_t sub_1000062BC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000909C(&qword_100018018, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100018688, a1);
}

uint64_t sub_1000062F4()
{
  return sub_100009168(&qword_100018170, &qword_100018178);
}

uint64_t sub_10000631C(uint64_t a1)
{
  unint64_t v2 = sub_100005A9C();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000636C()
{
  unint64_t result = qword_100018180;
  if (!qword_100018180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018180);
  }
  return result;
}

uint64_t sub_1000063C0()
{
  return sub_100009274();
}

uint64_t sub_1000063E4(uint64_t a1)
{
  unint64_t v2 = sub_1000061B0();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100006434()
{
  unint64_t result = qword_100018188;
  if (!qword_100018188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018188);
  }
  return result;
}

unint64_t sub_10000648C()
{
  unint64_t result = qword_100018190;
  if (!qword_100018190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018190);
  }
  return result;
}

uint64_t sub_1000064E0(uint64_t a1)
{
  return sub_100007854(a1, qword_1000186A0);
}

unint64_t sub_100006508()
{
  unint64_t result = qword_100018198;
  if (!qword_100018198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018198);
  }
  return result;
}

uint64_t sub_10000655C(uint64_t a1, uint64_t a2)
{
  return sub_100007B48(a1, a2, (uint64_t (*)(void))sub_100009A70, (uint64_t (*)(void))sub_100009A1C);
}

unint64_t sub_10000658C()
{
  unint64_t result = qword_1000181A0;
  if (!qword_1000181A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181A0);
  }
  return result;
}

unint64_t sub_1000065E4()
{
  unint64_t result = qword_1000181A8;
  if (!qword_1000181A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181A8);
  }
  return result;
}

uint64_t sub_100006638(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100007C84(a1, a2, a3, (void (*)(void))sub_100006508);
}

uint64_t sub_100006650@<X0>(uint64_t a1@<X8>)
{
  return sub_10000909C(&qword_100018020, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000186A0, a1);
}

uint64_t sub_100006688(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100009A70();
  unint64_t v6 = sub_100009AC4();
  unint64_t v7 = sub_100009A1C();
  void *v4 = v2;
  v4[1] = sub_100009C24;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100006754@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009688(&qword_1000183D8, 0xD000000000000031, 0x800000010000FEA0, (void (*)(uint64_t))sub_100006F20);
  *a1 = result;
  return result;
}

uint64_t sub_1000067B0(uint64_t a1)
{
  unint64_t v2 = sub_100006508();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_1000067F0()
{
  unint64_t result = qword_1000181B8;
  if (!qword_1000181B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181B8);
  }
  return result;
}

unint64_t sub_100006848()
{
  unint64_t result = qword_1000181C0;
  if (!qword_1000181C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181C0);
  }
  return result;
}

uint64_t sub_10000689C()
{
  uint64_t v0 = sub_100009540(&qword_1000183A0);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10000F900();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000F970();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10000F9A0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10000F910();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10000F8B0();
  sub_1000095BC(v10, qword_1000186B8);
  sub_100009584(v10, (uint64_t)qword_1000186B8);
  sub_10000F990();
  sub_10000F960();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10000F920();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10000F8A0();
}

uint64_t sub_100006B74()
{
  uint64_t v0 = sub_100009540(&qword_100018398);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100009540(&qword_1000183A0);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000F910();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_10000F8F0();
  sub_10000F8F0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  uint64_t v8 = sub_10000F790();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v2, 1, 1, v8);
  return sub_10000F7B0();
}

unint64_t sub_100006D68()
{
  unint64_t result = qword_1000181D0;
  if (!qword_1000181D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181D0);
  }
  return result;
}

uint64_t sub_100006DBC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100007334();
  void *v4 = v2;
  v4[1] = sub_100009C14;
  return UniqueAppEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100006E70()
{
  unint64_t result = qword_1000181E0;
  if (!qword_1000181E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181E0);
  }
  return result;
}

unint64_t sub_100006EC8()
{
  unint64_t result = qword_1000181E8;
  if (!qword_1000181E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181E8);
  }
  return result;
}

unint64_t sub_100006F20()
{
  unint64_t result = qword_1000181F0[0];
  if (!qword_1000181F0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000181F0);
  }
  return result;
}

uint64_t sub_100006F74(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100007334();
  *unint64_t v5 = v2;
  v5[1] = sub_100009C1C;
  return UniqueAppEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100007028(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100007334();
  void *v4 = v2;
  v4[1] = sub_100009C14;
  return UniqueAppEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_1000070DC()
{
  unint64_t result = qword_100018208;
  if (!qword_100018208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018208);
  }
  return result;
}

unint64_t sub_100007134()
{
  unint64_t result = qword_100018210;
  if (!qword_100018210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018210);
  }
  return result;
}

uint64_t sub_100007188()
{
  return sub_1000089A4(&qword_100018218, qword_100018220, (void (*)(void))sub_100007134);
}

uint64_t sub_1000071C4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100006D68();
  *unint64_t v5 = v2;
  v5[1] = sub_100009C2C;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_10000727C()
{
  unint64_t result = qword_100018238;
  if (!qword_100018238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018238);
  }
  return result;
}

unint64_t sub_1000072D4()
{
  unint64_t result = qword_100018240;
  if (!qword_100018240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018240);
  }
  return result;
}

unint64_t sub_100007334()
{
  unint64_t result = qword_100018248;
  if (!qword_100018248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018248);
  }
  return result;
}

uint64_t sub_100007388()
{
  uint64_t v0 = qword_100018028;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_1000073C4()
{
  unint64_t result = qword_100018250;
  if (!qword_100018250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018250);
  }
  return result;
}

uint64_t sub_100007418(uint64_t a1)
{
  unint64_t v2 = sub_100006F20();

  return EntityURLRepresentation.init(stringLiteral:)(0xD000000000000049, 0x800000010000FE50, a1, v2);
}

unint64_t sub_100007478()
{
  unint64_t result = qword_100018258;
  if (!qword_100018258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018258);
  }
  return result;
}

unint64_t sub_1000074D0()
{
  unint64_t result = qword_100018260;
  if (!qword_100018260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018260);
  }
  return result;
}

unint64_t sub_10000752C()
{
  unint64_t result = qword_100018268;
  if (!qword_100018268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018268);
  }
  return result;
}

uint64_t sub_100007580@<X0>(uint64_t *a1@<X8>)
{
  return sub_100008F8C((void (*)(void))sub_100006848, a1);
}

uint64_t sub_100007598()
{
  sub_100009A1C();
  uint64_t v2 = sub_10000F800();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100009674(v3, v0, v2, v1);
}

uint64_t sub_10000762C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000909C(&qword_100018038, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_1000186B8, a1);
}

uint64_t sub_100007664()
{
  return sub_100009168(&qword_100018278, &qword_100018280);
}

uint64_t sub_10000768C(uint64_t a1)
{
  unint64_t v2 = sub_100006F20();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000076DC()
{
  unint64_t result = qword_100018288;
  if (!qword_100018288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018288);
  }
  return result;
}

uint64_t sub_100007734(uint64_t a1)
{
  unint64_t v2 = sub_10000752C();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100007784()
{
  unint64_t result = qword_100018290;
  if (!qword_100018290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018290);
  }
  return result;
}

unint64_t sub_1000077DC()
{
  unint64_t result = qword_100018298;
  if (!qword_100018298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018298);
  }
  return result;
}

uint64_t sub_100007830(uint64_t a1)
{
  return sub_100007854(a1, qword_1000186D0);
}

uint64_t sub_100007854(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000F900();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  unint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000F970();
  __chkstk_darwin();
  sub_10000F9A0();
  __chkstk_darwin();
  uint64_t v7 = sub_10000F910();
  sub_1000095BC(v7, a2);
  sub_100009584(v7, (uint64_t)a2);
  sub_10000F990();
  sub_10000F960();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  return sub_10000F920();
}

uint64_t sub_100007A30()
{
  return sub_10000F760();
}

uint64_t sub_100007A54()
{
  return sub_10000F770();
}

void sub_100007A78(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100007AC8()
{
  unint64_t result = qword_1000182A0;
  if (!qword_1000182A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182A0);
  }
  return result;
}

uint64_t sub_100007B1C(uint64_t a1, uint64_t a2)
{
  return sub_100007B48(a1, a2, (uint64_t (*)(void))sub_100009974, (uint64_t (*)(void))sub_100009620);
}

uint64_t sub_100007B48(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t v7 = a3();
  uint64_t v8 = a4();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v7, a2, v8);
}

unint64_t sub_100007BC0()
{
  unint64_t result = qword_1000182A8;
  if (!qword_1000182A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182A8);
  }
  return result;
}

unint64_t sub_100007C18()
{
  unint64_t result = qword_1000182B0;
  if (!qword_1000182B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182B0);
  }
  return result;
}

uint64_t sub_100007C6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100007C84(a1, a2, a3, (void (*)(void))sub_100007AC8);
}

uint64_t sub_100007C84(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100007CD8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000909C(&qword_100018040, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000186D0, a1);
}

uint64_t sub_100007D10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100009974();
  unint64_t v6 = sub_1000099C8();
  unint64_t v7 = sub_100009620();
  void *v4 = v2;
  v4[1] = sub_100007DDC;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100007DDC()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_100007EE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009688(&qword_1000183B8, 0xD00000000000002DLL, 0x800000010000FD50, (void (*)(uint64_t))sub_100008600);
  *a1 = result;
  return result;
}

uint64_t sub_100007F40(uint64_t a1)
{
  unint64_t v2 = sub_100007AC8();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100007F80()
{
  unint64_t result = qword_1000182C0;
  if (!qword_1000182C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182C0);
  }
  return result;
}

unint64_t sub_100007FD8()
{
  unint64_t result = qword_1000182C8;
  if (!qword_1000182C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182C8);
  }
  return result;
}

uint64_t sub_10000802C()
{
  uint64_t v0 = sub_100009540(&qword_1000183A0);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10000F900();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000F970();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10000F9A0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10000F910();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10000F8B0();
  sub_1000095BC(v10, qword_1000186E8);
  sub_100009584(v10, (uint64_t)qword_1000186E8);
  sub_10000F990();
  sub_10000F960();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10000F920();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10000F8A0();
}

uint64_t sub_100008300()
{
  return _swift_task_switch(sub_10000831C, 0, 0);
}

uint64_t sub_10000831C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_100008338()
{
  unint64_t result = qword_1000182D8;
  if (!qword_1000182D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182D8);
  }
  return result;
}

uint64_t sub_10000838C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100008D2C();
  void *v4 = v2;
  v4[1] = sub_10000843C;
  return UniqueAppEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_10000843C(uint64_t a1)
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

unint64_t sub_100008550()
{
  unint64_t result = qword_1000182E8;
  if (!qword_1000182E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182E8);
  }
  return result;
}

unint64_t sub_1000085A8()
{
  unint64_t result = qword_1000182F0;
  if (!qword_1000182F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182F0);
  }
  return result;
}

unint64_t sub_100008600()
{
  unint64_t result = qword_1000182F8[0];
  if (!qword_1000182F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000182F8);
  }
  return result;
}

uint64_t sub_100008654(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100008D2C();
  *uint64_t v5 = v2;
  v5[1] = sub_100008708;
  return UniqueAppEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100008708(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100008808(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100008D2C();
  void *v4 = v2;
  v4[1] = sub_100009C14;
  return UniqueAppEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_1000088BC()
{
  unint64_t result = qword_100018310;
  if (!qword_100018310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018310);
  }
  return result;
}

unint64_t sub_100008914()
{
  unint64_t result = qword_100018318;
  if (!qword_100018318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018318);
  }
  return result;
}

uint64_t sub_100008968()
{
  return sub_1000089A4(&qword_100018320, qword_100018328, (void (*)(void))sub_100008914);
}

uint64_t sub_1000089A4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005D44(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100008A1C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100008338();
  *unint64_t v5 = v2;
  v5[1] = sub_100008AD0;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100008AD0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100008BC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100008AD0;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

unint64_t sub_100008C7C()
{
  unint64_t result = qword_100018340;
  if (!qword_100018340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018340);
  }
  return result;
}

unint64_t sub_100008CD4()
{
  unint64_t result = qword_100018348;
  if (!qword_100018348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018348);
  }
  return result;
}

unint64_t sub_100008D2C()
{
  unint64_t result = qword_100018350;
  if (!qword_100018350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018350);
  }
  return result;
}

uint64_t sub_100008D80()
{
  uint64_t v0 = qword_100018048;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100008DBC()
{
  unint64_t result = qword_100018358;
  if (!qword_100018358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018358);
  }
  return result;
}

uint64_t sub_100008E10(uint64_t a1)
{
  unint64_t v2 = sub_100008600();

  return EntityURLRepresentation.init(stringLiteral:)(0xD00000000000004ALL, 0x800000010000FD00, a1, v2);
}

unint64_t sub_100008E70()
{
  unint64_t result = qword_100018360;
  if (!qword_100018360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018360);
  }
  return result;
}

unint64_t sub_100008EC8()
{
  unint64_t result = qword_100018368;
  if (!qword_100018368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018368);
  }
  return result;
}

unint64_t sub_100008F20()
{
  unint64_t result = qword_100018370;
  if (!qword_100018370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018370);
  }
  return result;
}

uint64_t sub_100008F74@<X0>(uint64_t *a1@<X8>)
{
  return sub_100008F8C((void (*)(void))sub_100007FD8, a1);
}

uint64_t sub_100008F8C@<X0>(void (*a1)(void)@<X2>, uint64_t *a2@<X8>)
{
  a1();
  uint64_t result = sub_10000F6C0();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_100008FD0()
{
  sub_100009620();
  uint64_t v2 = sub_10000F800();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100009674(v3, v0, v2, v1);
}

uint64_t sub_100009064@<X0>(uint64_t a1@<X8>)
{
  return sub_10000909C(&qword_100018058, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_1000186E8, a1);
}

uint64_t sub_10000909C@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100009584(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100009140()
{
  return sub_100009168(&qword_100018380, &qword_100018388);
}

uint64_t sub_100009168(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005D44(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000091B8(uint64_t a1)
{
  unint64_t v2 = sub_100008600();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100009208()
{
  unint64_t result = qword_100018390;
  if (!qword_100018390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018390);
  }
  return result;
}

uint64_t sub_10000925C()
{
  return sub_100009274();
}

uint64_t sub_100009274()
{
  uint64_t v0 = sub_100009540(&qword_100018398);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100009540(&qword_1000183A0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000F910();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_10000F8F0();
  sub_10000F8F0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  uint64_t v8 = sub_10000F790();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v2, 1, 1, v8);
  return sub_10000F7B0();
}

uint64_t sub_100009464(uint64_t a1)
{
  unint64_t v2 = sub_100008F20();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for GenerativeAssistantSettingsSignOutEntity.GenerativeAssistantSettingsSignOutEntityQuery()
{
  return &type metadata for GenerativeAssistantSettingsSignOutEntity.GenerativeAssistantSettingsSignOutEntityQuery;
}

ValueMetadata *type metadata accessor for GenerativeAssistantSettingsSignOutEntity()
{
  return &type metadata for GenerativeAssistantSettingsSignOutEntity;
}

ValueMetadata *type metadata accessor for OpenGenerativeAssistantSettingsSignOutEntity()
{
  return &type metadata for OpenGenerativeAssistantSettingsSignOutEntity;
}

ValueMetadata *type metadata accessor for GenerativeAssistantSettingsSignInFlowEntity.GenerativeAssistantSettingsSignInFlowEntityQuery()
{
  return &type metadata for GenerativeAssistantSettingsSignInFlowEntity.GenerativeAssistantSettingsSignInFlowEntityQuery;
}

ValueMetadata *type metadata accessor for GenerativeAssistantSettingsSignInFlowEntity()
{
  return &type metadata for GenerativeAssistantSettingsSignInFlowEntity;
}

ValueMetadata *type metadata accessor for OpenGenerativeAssistantSettingsSignInFlowEntity()
{
  return &type metadata for OpenGenerativeAssistantSettingsSignInFlowEntity;
}

ValueMetadata *type metadata accessor for GenerativeAssistantSettingsSetupFlowEntity.GenerativeAssistantSettingsSetupFlowEntityQuery()
{
  return &type metadata for GenerativeAssistantSettingsSetupFlowEntity.GenerativeAssistantSettingsSetupFlowEntityQuery;
}

ValueMetadata *type metadata accessor for GenerativeAssistantSettingsSetupFlowEntity()
{
  return &type metadata for GenerativeAssistantSettingsSetupFlowEntity;
}

ValueMetadata *type metadata accessor for OpenGenerativeAssistantSettingsSetupFlowEntity()
{
  return &type metadata for OpenGenerativeAssistantSettingsSetupFlowEntity;
}

uint64_t sub_100009540(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100009584(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000095BC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100009620()
{
  unint64_t result = qword_1000183A8;
  if (!qword_1000183A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183A8);
  }
  return result;
}

uint64_t sub_100009674(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100009688(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  v25 = a4;
  uint64_t v23 = a2;
  uint64_t v24 = sub_10000F880();
  uint64_t v5 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100009540(&qword_1000183B0);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v23 - v12;
  uint64_t v14 = sub_100009540(&qword_1000183A0);
  __chkstk_darwin(v14 - 8);
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10000F910();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  sub_100009540(a1);
  sub_10000F8F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
  char v26 = 1;
  uint64_t v19 = sub_10000F740();
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
  v20(v13, 1, 1, v19);
  v20(v11, 1, 1, v19);
  uint64_t v21 = (*(uint64_t (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for InputConnectionBehavior.default(_:), v24);
  v25(v21);
  return sub_10000F780();
}

unint64_t sub_100009974()
{
  unint64_t result = qword_1000183C0;
  if (!qword_1000183C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183C0);
  }
  return result;
}

unint64_t sub_1000099C8()
{
  unint64_t result = qword_1000183C8;
  if (!qword_1000183C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183C8);
  }
  return result;
}

unint64_t sub_100009A1C()
{
  unint64_t result = qword_1000183D0;
  if (!qword_1000183D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183D0);
  }
  return result;
}

unint64_t sub_100009A70()
{
  unint64_t result = qword_1000183E0;
  if (!qword_1000183E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183E0);
  }
  return result;
}

unint64_t sub_100009AC4()
{
  unint64_t result = qword_1000183E8;
  if (!qword_1000183E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183E8);
  }
  return result;
}

unint64_t sub_100009B18()
{
  unint64_t result = qword_1000183F0;
  if (!qword_1000183F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183F0);
  }
  return result;
}

unint64_t sub_100009B6C()
{
  unint64_t result = qword_100018400;
  if (!qword_100018400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018400);
  }
  return result;
}

unint64_t sub_100009BC0()
{
  unint64_t result = qword_100018408;
  if (!qword_100018408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018408);
  }
  return result;
}

uint64_t sub_100009C30(uint64_t a1)
{
  unint64_t v2 = sub_100009D80();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100009CD8()
{
  unint64_t result = qword_100018410;
  if (!qword_100018410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018410);
  }
  return result;
}

uint64_t sub_100009D30()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100009D80()
{
  unint64_t result = qword_100018418;
  if (!qword_100018418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018418);
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerativeAssistantSettingsExtensionExtension()
{
  return &type metadata for GenerativeAssistantSettingsExtensionExtension;
}

unint64_t GenerativeAssistantSettingsDestination.entityIdentifierString.getter(unint64_t result)
{
  unint64_t result = result;
  switch((char)result)
  {
    case 1:
      unint64_t result = 0x656C62616E457369;
      break;
    case 2:
      unint64_t result = 0x6F72507075746573;
      break;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    case 4:
      unint64_t result = 0x43746E756F636361;
      break;
    case 5:
      unint64_t result = 0x696D694C65746172;
      break;
    case 6:
      unint64_t result = 0x6168437055746573;
      break;
    case 7:
      unint64_t result = 0x6E496E676973;
      break;
    case 8:
      unint64_t result = 0x74754F6E676973;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t GenerativeAssistantSettingsDestination.rawValue.getter(unint64_t result)
{
  unint64_t result = result;
  switch((char)result)
  {
    case 1:
      unint64_t result = 0x656C62616E457369;
      break;
    case 2:
      unint64_t result = 0x6F72507075746573;
      break;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    case 4:
      unint64_t result = 0x43746E756F636361;
      break;
    case 5:
      unint64_t result = 0x696D694C65746172;
      break;
    case 6:
      unint64_t result = 0x6168437055746573;
      break;
    case 7:
      unint64_t result = 0x6E496E676973;
      break;
    case 8:
      unint64_t result = 0x74754F6E676973;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000A05C()
{
  sub_10000F9D0(48);
  uint64_t result = swift_bridgeObjectRelease();
  qword_100018420 = 0xD00000000000003DLL;
  *(void *)algn_100018428 = 0x8000000100010010;
  return result;
}

uint64_t GenerativeAssistantSettingsDestination.fullURL.getter@<X0>(unsigned __int8 a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100009540(&qword_100018430);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100018060 != -1) {
    swift_once();
  }
  v12[0] = qword_100018420;
  v12[1] = *(void *)algn_100018428;
  swift_bridgeObjectRetain();
  v13._countAndFlagsBits = 47;
  v13._object = (void *)0xE100000000000000;
  sub_10000F9C0(v13);
  v7._countAndFlagsBits = a1;
  uint64_t v8 = (void *)0xE000000000000000;
  switch(v7._countAndFlagsBits)
  {
    case 1:
      uint64_t v8 = (void *)0xE900000000000064;
      v7._countAndFlagsBits = 0x656C62616E457369;
      break;
    case 2:
      uint64_t v8 = (void *)0xEB0000000074706DLL;
      v7._countAndFlagsBits = 0x6F72507075746573;
      break;
    case 3:
      uint64_t v8 = (void *)0x800000010000FC20;
      v7._countAndFlagsBits = 0xD000000000000016;
      break;
    case 4:
      uint64_t v8 = (void *)0xEF736C6F72746E6FLL;
      v7._countAndFlagsBits = 0x43746E756F636361;
      break;
    case 5:
      uint64_t v8 = (void *)0xEF74706D6F725074;
      v7._countAndFlagsBits = 0x696D694C65746172;
      break;
    case 6:
      uint64_t v8 = (void *)0xEC00000054504774;
      v7._countAndFlagsBits = 0x6168437055746573;
      break;
    case 7:
      uint64_t v8 = (void *)0xE600000000000000;
      v7._countAndFlagsBits = 0x6E496E676973;
      break;
    case 8:
      uint64_t v8 = (void *)0xE700000000000000;
      v7._countAndFlagsBits = 0x74754F6E676973;
      break;
    default:
      break;
  }
  v7._object = v8;
  sub_10000F9C0(v7);
  swift_bridgeObjectRelease();
  sub_10000F930();
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_10000F950();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) == 1)
  {
    __break(1u);
    JUMPOUT(0x10000A34CLL);
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a2, v6, v9);
}

unint64_t GenerativeAssistantSettingsDestination.Origin.rawValue.getter(char a1)
{
  unint64_t result = 0x54504774616863;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 1769105779;
      break;
    case 3:
      unint64_t result = 0x54676E6974697277;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000A40C(unsigned __int8 *a1, char *a2)
{
  return sub_10000BAD8(*a1, *a2);
}

Swift::Int sub_10000A418()
{
  return sub_10000A420();
}

Swift::Int sub_10000A420()
{
  return sub_10000FA20();
}

uint64_t sub_10000A500()
{
  sub_10000F9B0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000A5C8()
{
  return sub_10000A5D0();
}

Swift::Int sub_10000A5D0()
{
  return sub_10000FA20();
}

uint64_t sub_10000A6AC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s36GenerativeAssistantSettingsExtension0abC11DestinationO6OriginO8rawValueAESgSS_tcfC_0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_10000A6DC(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE700000000000000;
  unint64_t v3 = 0x54504774616863;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0x800000010000FBE0;
      unint64_t v3 = 0xD000000000000010;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 1769105779;
      *(void *)(a1 + 8) = 0xE400000000000000;
      break;
    case 3:
      strcpy((char *)a1, "writingTools");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

uint64_t GenerativeAssistantSettingsDestination.fullURL(origin:)(uint64_t a1, unsigned __int8 a2)
{
  uint64_t v3 = sub_10000F8E0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000F950();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  GenerativeAssistantSettingsDestination.fullURL.getter(a2, (uint64_t)v10);
  sub_10000F8D0();
  swift_bridgeObjectRelease();
  sub_100009540(&qword_100018438);
  unint64_t v11 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100012680;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 16))(v12 + v11, v6, v3);
  sub_10000F940();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t static GenerativeAssistantSettingsDestination.entityIdentifier(for:)(uint64_t a1, void *a2)
{
  swift_bridgeObjectRetain();

  return _s36GenerativeAssistantSettingsExtension0abC11DestinationO8rawValueACSgSS_tcfC_0(a1, a2);
}

uint64_t GenerativeAssistantSettingsDestination.Action.rawValue.getter(char a1)
{
  if (!a1) {
    return 0x6168437055746573;
  }
  if (a1 == 1) {
    return 0x6E496E676973;
  }
  return 0x74754F6E676973;
}

uint64_t sub_10000AAC0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10000B9BC(*a1, *a2);
}

Swift::Int sub_10000AACC()
{
  return sub_10000FA20();
}

uint64_t sub_10000AB74()
{
  sub_10000F9B0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000AC08()
{
  return sub_10000FA20();
}

uint64_t sub_10000ACAC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s36GenerativeAssistantSettingsExtension0abC11DestinationO6ActionO8rawValueAESgSS_tcfC_0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_10000ACDC(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xEC00000054504774;
  unint64_t v4 = 0xE600000000000000;
  uint64_t v5 = 0x6E496E676973;
  if (v2 != 1)
  {
    uint64_t v5 = 0x74754F6E676973;
    unint64_t v4 = 0xE700000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6168437055746573;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

_UNKNOWN **static GenerativeAssistantSettingsDestination.allCases.getter()
{
  return &off_100014AF0;
}

uint64_t sub_10000AD4C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10000B6B0(*a1, *a2);
}

Swift::Int sub_10000AD58()
{
  return sub_10000FA20();
}

uint64_t sub_10000ADA0()
{
  return sub_10000BC70();
}

Swift::Int sub_10000ADA8()
{
  return sub_10000FA20();
}

uint64_t sub_10000ADEC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s36GenerativeAssistantSettingsExtension0abC11DestinationO8rawValueACSgSS_tcfC_0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_10000AE1C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = GenerativeAssistantSettingsDestination.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_10000AE48(void *a1@<X8>)
{
  *a1 = &off_100014AF0;
}

unint64_t sub_10000AE58()
{
  return GenerativeAssistantSettingsDestination.entityIdentifierString.getter(*v0);
}

uint64_t sub_10000AE60@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = _s36GenerativeAssistantSettingsExtension0abC11DestinationO8rawValueACSgSS_tcfC_0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t _s36GenerativeAssistantSettingsExtension0abC11DestinationO6OriginO8rawValueAESgSS_tcfC_0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100014910;
  v6._object = a2;
  unint64_t v4 = sub_10000F9F0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t _s36GenerativeAssistantSettingsExtension0abC11DestinationO8rawValueACSgSS_tcfC_0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100014990;
  v6._object = a2;
  unint64_t v4 = sub_10000F9F0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 9) {
    return 9;
  }
  else {
    return v4;
  }
}

uint64_t _s36GenerativeAssistantSettingsExtension0abC11DestinationO6ActionO8rawValueAESgSS_tcfC_0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100014A88;
  v6._object = a2;
  unint64_t v4 = sub_10000F9F0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

unint64_t sub_10000AF90()
{
  unint64_t result = qword_100018440;
  if (!qword_100018440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018440);
  }
  return result;
}

unint64_t sub_10000AFE8()
{
  unint64_t result = qword_100018448;
  if (!qword_100018448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018448);
  }
  return result;
}

unint64_t sub_10000B040()
{
  unint64_t result = qword_100018450;
  if (!qword_100018450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018450);
  }
  return result;
}

unint64_t sub_10000B098()
{
  unint64_t result = qword_100018458;
  if (!qword_100018458)
  {
    sub_100005D44(&qword_100018460);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018458);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for GenerativeAssistantSettingsDestination(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GenerativeAssistantSettingsDestination(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for GenerativeAssistantSettingsDestination(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x10000B260);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerativeAssistantSettingsDestination()
{
  return &type metadata for GenerativeAssistantSettingsDestination;
}

uint64_t getEnumTagSinglePayload for GenerativeAssistantSettingsDestination.Origin(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for GenerativeAssistantSettingsDestination.Origin(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000B3F4);
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

ValueMetadata *type metadata accessor for GenerativeAssistantSettingsDestination.Origin()
{
  return &type metadata for GenerativeAssistantSettingsDestination.Origin;
}

uint64_t getEnumTagSinglePayload for GenerativeAssistantSettingsDestination.Action(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for GenerativeAssistantSettingsDestination.Action(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x10000B588);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_10000B5B0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000B5B8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GenerativeAssistantSettingsDestination.Action()
{
  return &type metadata for GenerativeAssistantSettingsDestination.Action;
}

unint64_t sub_10000B5DC()
{
  unint64_t result = qword_100018478;
  if (!qword_100018478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018478);
  }
  return result;
}

uint64_t sub_10000B630()
{
  return sub_10000E9A0(&qword_100018480);
}

uint64_t type metadata accessor for GenerativeAssistantSettingsDeepLinks()
{
  uint64_t result = qword_1000185C0;
  if (!qword_1000185C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000B6B0(unint64_t a1, unsigned __int8 a2)
{
  a1 = a1;
  unint64_t v2 = 0xE000000000000000;
  switch((char)a1)
  {
    case 1:
      a1 = 0x656C62616E457369;
      unint64_t v2 = 0xE900000000000064;
      break;
    case 2:
      a1 = 0x6F72507075746573;
      unint64_t v2 = 0xEB0000000074706DLL;
      break;
    case 3:
      unint64_t v2 = 0x800000010000FC20;
      a1 = 0xD000000000000016;
      break;
    case 4:
      a1 = 0x43746E756F636361;
      unint64_t v2 = 0xEF736C6F72746E6FLL;
      break;
    case 5:
      a1 = 0x696D694C65746172;
      unint64_t v2 = 0xEF74706D6F725074;
      break;
    case 6:
      a1 = 0x6168437055746573;
      unint64_t v2 = 0xEC00000054504774;
      break;
    case 7:
      unint64_t v2 = 0xE600000000000000;
      a1 = 0x6E496E676973;
      break;
    case 8:
      unint64_t v2 = 0xE700000000000000;
      a1 = 0x74754F6E676973;
      break;
    default:
      break;
  }
  uint64_t v3 = a2;
  unint64_t v4 = 0xE000000000000000;
  switch(a2)
  {
    case 1u:
      unint64_t v4 = 0xE900000000000064;
      if (a1 == 0x656C62616E457369) {
        goto LABEL_25;
      }
      goto LABEL_28;
    case 2u:
      unint64_t v4 = 0xEB0000000074706DLL;
      if (a1 != 0x6F72507075746573) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 3u:
      unint64_t v4 = 0x800000010000FC20;
      if (a1 != 0xD000000000000016) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 4u:
      unint64_t v4 = 0xEF736C6F72746E6FLL;
      if (a1 != 0x43746E756F636361) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 5u:
      unint64_t v4 = 0xEF74706D6F725074;
      if (a1 != 0x696D694C65746172) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 6u:
      unint64_t v4 = 0xEC00000054504774;
      if (a1 != 0x6168437055746573) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 7u:
      unint64_t v4 = 0xE600000000000000;
      uint64_t v3 = 0x6E496E676973;
      goto LABEL_24;
    case 8u:
      unint64_t v4 = 0xE700000000000000;
      if (a1 != 0x74754F6E676973) {
        goto LABEL_28;
      }
      goto LABEL_25;
    default:
LABEL_24:
      if (a1 != v3) {
        goto LABEL_28;
      }
LABEL_25:
      if (v2 == v4) {
        char v5 = 1;
      }
      else {
LABEL_28:
      }
        char v5 = sub_10000FA00();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v5 & 1;
  }
}

uint64_t sub_10000B9BC(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xEC00000054504774;
  uint64_t v3 = 0x6168437055746573;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v5 = 0x6E496E676973;
    }
    else {
      uint64_t v5 = 0x74754F6E676973;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xE600000000000000;
    }
    else {
      unint64_t v6 = 0xE700000000000000;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  uint64_t v5 = 0x6168437055746573;
  unint64_t v6 = 0xEC00000054504774;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      uint64_t v3 = 0x6E496E676973;
    }
    else {
      uint64_t v3 = 0x74754F6E676973;
    }
    if (v7 == 1) {
      unint64_t v2 = 0xE600000000000000;
    }
    else {
      unint64_t v2 = 0xE700000000000000;
    }
  }
LABEL_15:
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_10000FA00();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_10000BAD8(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x54504774616863;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 0x54504774616863;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0x800000010000FBE0;
      unint64_t v5 = 0xD000000000000010;
      break;
    case 2:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1769105779;
      break;
    case 3:
      unint64_t v5 = 0x54676E6974697277;
      unint64_t v3 = 0xEC000000736C6F6FLL;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0x800000010000FBE0;
      if (v5 == 0xD000000000000010) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xE400000000000000;
      uint64_t v2 = 1769105779;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xEC000000736C6F6FLL;
      if (v5 == 0x54676E6974697277) {
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
        char v7 = sub_10000FA00();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_10000BC70()
{
  sub_10000F9B0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000BDE0()
{
  uint64_t v0 = sub_10000F910();
  sub_1000095BC(v0, qword_100018700);
  sub_100009584(v0, (uint64_t)qword_100018700);
  return sub_10000F8F0();
}

uint64_t sub_10000BE44(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GenerativeAssistantSettingsDeepLinks();
  __chkstk_darwin(v2 - 8);
  sub_10000E4D0(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000F770();
  return sub_10000E594(a1);
}

void (*sub_10000BED4(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10000F750();
  return sub_100007A78;
}

unint64_t sub_10000BF34()
{
  unint64_t result = qword_100018488;
  if (!qword_100018488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018488);
  }
  return result;
}

uint64_t sub_10000BF88(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10000F5E8();
  uint64_t v5 = sub_10000E9A0(&qword_100018620);

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10000C010()
{
  unint64_t result = qword_100018490;
  if (!qword_100018490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018490);
  }
  return result;
}

unint64_t sub_10000C068()
{
  unint64_t result = qword_100018498;
  if (!qword_100018498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018498);
  }
  return result;
}

uint64_t sub_10000C0BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000C10C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000DB14(&qword_100018068, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100018700, a1);
}

uint64_t sub_10000C144(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10000F5E8();
  unint64_t v6 = sub_10000F63C();
  uint64_t v7 = sub_10000E9A0(&qword_100018620);
  void *v4 = v2;
  v4[1] = sub_100007DDC;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10000C22C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000E9E4();
  *a1 = result;
  return result;
}

uint64_t sub_10000C254(uint64_t a1)
{
  unint64_t v2 = sub_10000BF34();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10000C294()
{
  unint64_t result = qword_1000184A8;
  if (!qword_1000184A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184A8);
  }
  return result;
}

unint64_t sub_10000C2EC()
{
  unint64_t result = qword_1000184B0;
  if (!qword_1000184B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184B0);
  }
  return result;
}

uint64_t sub_10000C340()
{
  return sub_10000E9A0(qword_1000184B8);
}

uint64_t sub_10000C374()
{
  uint64_t v0 = sub_100009540(&qword_1000183A0);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000F910();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_10000F8B0();
  sub_1000095BC(v5, qword_100018718);
  sub_100009584(v5, (uint64_t)qword_100018718);
  sub_10000F8F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_10000F8A0();
}

uint64_t sub_10000C4DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (uint64_t)v1;
  uint64_t v4 = type metadata accessor for GenerativeAssistantSettingsDeepLinks();
  __chkstk_darwin(v4);
  unint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100009540(&qword_1000185F8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = sub_10000C798();
  if (*(void *)(v10 + 16) && (unint64_t v11 = sub_10000E464(*v1), (v12 & 1) != 0))
  {
    unint64_t v13 = v11;
    uint64_t v14 = *(void *)(v10 + 56);
    uint64_t v15 = sub_10000F7C0();
    uint64_t v16 = *(void *)(v15 - 8);
    uint64_t v22 = v4;
    uint64_t v17 = a1;
    uint64_t v18 = v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v16 + 16))(v9, v14 + *(void *)(v16 + 72) * v13, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v9, 0, 1, v15);
    a1 = v17;
    uint64_t v4 = v22;
  }
  else
  {
    uint64_t v15 = sub_10000F7C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 1, 1, v15);
  }
  swift_bridgeObjectRelease();
  sub_10000E4D0(v2, (uint64_t)v6);
  sub_10000F7C0();
  uint64_t v19 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v9, 1, v15) == 1)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(a1, &v6[*(int *)(v4 + 20)], v15);
    return sub_10000E534((uint64_t)v9);
  }
  else
  {
    sub_10000E594((uint64_t)v6);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v19 + 32))(a1, v9, v15);
  }
}

unint64_t sub_10000C798()
{
  uint64_t v1 = sub_100009540(&qword_100018398);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100009540(&qword_1000183A0);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = (char *)v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000F910();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  v65 = (char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  char v12 = (char *)v41 - v11;
  sub_100009540(&qword_100018600);
  uint64_t v13 = sub_100009540(&qword_100018608);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 72);
  uint64_t v16 = v13 - 8;
  unint64_t v17 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v50 = 4 * v15;
  uint64_t v62 = v15;
  uint64_t v18 = swift_allocObject();
  uint64_t v51 = v18;
  *(_OWORD *)(v18 + 16) = xmmword_100012950;
  uint64_t v19 = (unsigned char *)(v18 + v17);
  uint64_t v20 = *(int *)(v16 + 56);
  uint64_t v64 = v16;
  uint64_t v21 = v18 + v17 + v20;
  *uint64_t v19 = 0;
  unint64_t v22 = v18 + v17;
  v59 = v19;
  uint64_t v23 = v0 + *(int *)(type metadata accessor for GenerativeAssistantSettingsDeepLinks() + 20);
  uint64_t v24 = sub_10000F7C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v21, v23, v24);
  unint64_t v45 = v22 + v15 + *(int *)(v16 + 56);
  *(unsigned char *)(v22 + v15) = 1;
  sub_10000F8F0();
  unint64_t v58 = 0x800000010000FC80;
  sub_10000F8F0();
  v25 = *(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56);
  v8 += 56;
  v63 = v25;
  uint64_t v44 = v7;
  v25(v6, 0, 1, v7);
  uint64_t v54 = sub_10000F790();
  uint64_t v26 = *(void *)(v54 - 8);
  v55 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56);
  uint64_t v56 = v26 + 56;
  v55(v3, 1, 1, v54);
  uint64_t v27 = sub_100009540(&qword_100018610);
  uint64_t v28 = *(void *)(v8 + 16);
  uint64_t v29 = *(unsigned __int8 *)(v8 + 24);
  uint64_t v57 = v8;
  uint64_t v30 = v28;
  uint64_t v53 = (v29 + 32) & ~v29;
  uint64_t v60 = v29 | 7;
  uint64_t v61 = v27;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100012960;
  sub_10000F8F0();
  sub_10000F8F0();
  uint64_t v48 = 2 * v30;
  sub_10000F8F0();
  uint64_t v49 = 3 * v30;
  sub_10000F8F0();
  uint64_t v47 = 4 * v30;
  sub_10000F8F0();
  uint64_t v31 = v30;
  uint64_t v46 = v30;
  sub_10000F8F0();
  sub_10000F8F0();
  v52 = v12;
  v32 = v6;
  v33 = v3;
  sub_10000F7A0();
  uint64_t v43 = 2 * v62;
  v34 = v59;
  v35 = &v59[2 * v62];
  v41[1] = &v35[*(int *)(v64 + 56)];
  unsigned char *v35 = 2;
  sub_10000F8F0();
  sub_10000F8F0();
  v63(v6, 0, 1, v7);
  uint64_t v36 = v54;
  v37 = v55;
  v55(v3, 1, 1, v54);
  unint64_t v45 = v53 + v31;
  uint64_t v38 = swift_allocObject();
  long long v42 = xmmword_100012680;
  *(_OWORD *)(v38 + 16) = xmmword_100012680;
  sub_10000F8F0();
  sub_10000F8F0();
  sub_10000F7A0();
  v34[v43 + v62] = 3;
  sub_10000F8F0();
  sub_10000F8F0();
  uint64_t v39 = v44;
  v63(v32, 0, 1, v44);
  v37(v33, 1, 1, v36);
  *(_OWORD *)(swift_allocObject() + 16) = v42;
  sub_10000F8F0();
  sub_10000F8F0();
  sub_10000F7A0();
  v59[v50] = 4;
  sub_10000F8F0();
  sub_10000F8F0();
  v63(v32, 0, 1, v39);
  v55(v33, 1, 1, v54);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100012970;
  sub_10000F8F0();
  sub_10000F8F0();
  sub_10000F8F0();
  sub_10000F8F0();
  sub_10000F8F0();
  sub_10000F7A0();
  return sub_10000D0C0(v51);
}

unint64_t sub_10000D0C0(uint64_t a1)
{
  uint64_t v2 = sub_100009540(&qword_100018608);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100009540(&qword_100018618);
  uint64_t v6 = sub_10000F9E0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_10000E938(v12, (uint64_t)v5);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_10000E464(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_10000F7C0();
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

uint64_t sub_10000D2B0(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100018648 + dword_100018648);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100008708;
  return v5(a1);
}

uint64_t sub_10000D358(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100018638 + dword_100018638);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_10000843C;
  return v4();
}

unint64_t sub_10000D400()
{
  unint64_t result = qword_1000184D0;
  if (!qword_1000184D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184D0);
  }
  return result;
}

uint64_t sub_10000D454()
{
  return sub_10000E9A0(&qword_1000184D8);
}

unint64_t sub_10000D48C()
{
  unint64_t result = qword_1000184E0;
  if (!qword_1000184E0)
  {
    sub_100005D44(qword_1000184E8);
    sub_10000E9A0(&qword_1000184D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000184E0);
  }
  return result;
}

uint64_t sub_10000D51C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000D63C();
  *uint64_t v5 = v2;
  v5[1] = sub_100008AD0;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10000D5D0()
{
  return sub_10000E9A0(&qword_100018500);
}

uint64_t sub_10000D604()
{
  return sub_10000E9A0(&qword_100018508);
}

unint64_t sub_10000D63C()
{
  unint64_t result = qword_100018510;
  if (!qword_100018510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018510);
  }
  return result;
}

unint64_t sub_10000D694()
{
  unint64_t result = qword_100018518;
  if (!qword_100018518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018518);
  }
  return result;
}

uint64_t sub_10000D6E8()
{
  return sub_10000E9A0(&qword_100018520);
}

uint64_t sub_10000D71C()
{
  uint64_t v0 = sub_100009540(&qword_100018628);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100009540(&qword_100018630);
  __chkstk_darwin(v4);
  sub_10000E9A0(qword_1000184B8);
  sub_10000F860();
  v7._object = (void *)0x8000000100010320;
  v7._countAndFlagsBits = 0xD00000000000003ELL;
  sub_10000F850(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_10000F840();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_10000F850(v8);
  return sub_10000F870();
}

uint64_t sub_10000D8F4()
{
  uint64_t v0 = qword_100018468;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_10000D92C()
{
  return sub_10000E9A0(&qword_100018528);
}

uint64_t sub_10000D960()
{
  return sub_10000E9A0(&qword_100018530);
}

uint64_t sub_10000D994()
{
  return sub_10000E9A0(&qword_100018538);
}

unint64_t sub_10000D9CC()
{
  unint64_t result = qword_100018540;
  if (!qword_100018540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018540);
  }
  return result;
}

void sub_10000DA20(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000DA2C()
{
  sub_10000E9A0(&qword_100018620);
  uint64_t v2 = sub_10000F800();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100009674(v3, v0, v2, v1);
}

uint64_t sub_10000DADC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000DB14(&qword_100018070, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100018718, a1);
}

uint64_t sub_10000DB14@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100009584(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

unint64_t sub_10000DBBC()
{
  unint64_t result = qword_100018550;
  if (!qword_100018550)
  {
    sub_100005D44(&qword_100018558);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018550);
  }
  return result;
}

uint64_t sub_10000DC18(uint64_t a1)
{
  uint64_t v2 = sub_10000E9A0(qword_1000184B8);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10000DC80()
{
  return sub_10000E9A0(&qword_100018560);
}

uint64_t sub_10000DCB8(uint64_t a1)
{
  uint64_t v2 = sub_10000E9A0(&qword_100018538);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for GenerativeAssistantSettingsDeepLinks.GenerativeAssistantSettingsAvailableLinksQuery()
{
  return &type metadata for GenerativeAssistantSettingsDeepLinks.GenerativeAssistantSettingsAvailableLinksQuery;
}

uint64_t *sub_10000DD30(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_10000F7C0();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_10000DDFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_10000F7C0();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

unsigned char *sub_10000DE64(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_10000F7C0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

unsigned char *sub_10000DEE0(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_10000F7C0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

unsigned char *sub_10000DF5C(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_10000F7C0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

unsigned char *sub_10000DFD8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_10000F7C0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_10000E054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000E068);
}

uint64_t sub_10000E068(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 247)
  {
    unsigned int v4 = *a1;
    if (v4 >= 9) {
      return v4 - 8;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = sub_10000F7C0();
    uint64_t v9 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    unint64_t v11 = &a1[*(int *)(a3 + 20)];
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10000E110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000E124);
}

unsigned char *sub_10000E124(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 247)
  {
    *unint64_t result = a2 + 8;
  }
  else
  {
    uint64_t v7 = sub_10000F7C0();
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = &v5[*(int *)(a4 + 20)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_10000E1C8()
{
  uint64_t result = sub_10000F7C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenGenerativeAssistantSettingsDeepLinks()
{
  return &type metadata for OpenGenerativeAssistantSettingsDeepLinks;
}

size_t sub_10000E270(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_10000E290(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_10000E290(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100009540(&qword_100018640);
  uint64_t v10 = *(void *)(type metadata accessor for GenerativeAssistantSettingsDeepLinks() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for GenerativeAssistantSettingsDeepLinks() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

unint64_t sub_10000E464(unsigned __int8 a1)
{
  sub_10000FA10();
  sub_10000BC70();
  Swift::Int v2 = sub_10000FA20();

  return sub_10000E5F0(a1, v2);
}

uint64_t sub_10000E4D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GenerativeAssistantSettingsDeepLinks();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E534(uint64_t a1)
{
  uint64_t v2 = sub_100009540(&qword_1000185F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000E594(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GenerativeAssistantSettingsDeepLinks();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000E5F0(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    while (1)
    {
      uint64_t v7 = *(void *)(v2 + 48);
      unint64_t v8 = *(unsigned __int8 *)(v7 + v4);
      unint64_t v9 = 0xE000000000000000;
      switch(*(unsigned char *)(v7 + v4))
      {
        case 1:
          unint64_t v8 = 0x656C62616E457369;
          unint64_t v9 = 0xE900000000000064;
          break;
        case 2:
          unint64_t v8 = 0x6F72507075746573;
          unint64_t v9 = 0xEB0000000074706DLL;
          break;
        case 3:
          unint64_t v9 = 0x800000010000FC20;
          unint64_t v8 = 0xD000000000000016;
          break;
        case 4:
          unint64_t v8 = 0x43746E756F636361;
          unint64_t v9 = 0xEF736C6F72746E6FLL;
          break;
        case 5:
          unint64_t v8 = 0x696D694C65746172;
          unint64_t v9 = 0xEF74706D6F725074;
          break;
        case 6:
          unint64_t v8 = 0x6168437055746573;
          unint64_t v9 = 0xEC00000054504774;
          break;
        case 7:
          unint64_t v9 = 0xE600000000000000;
          unint64_t v8 = 0x6E496E676973;
          break;
        case 8:
          unint64_t v9 = 0xE700000000000000;
          unint64_t v8 = 0x74754F6E676973;
          break;
        default:
          break;
      }
      unint64_t v10 = a1;
      unint64_t v11 = 0xE000000000000000;
      switch(a1)
      {
        case 1u:
          unint64_t v10 = 0x656C62616E457369;
          unint64_t v11 = 0xE900000000000064;
          break;
        case 2u:
          unint64_t v10 = 0x6F72507075746573;
          unint64_t v11 = 0xEB0000000074706DLL;
          break;
        case 3u:
          unint64_t v11 = 0x800000010000FC20;
          unint64_t v10 = 0xD000000000000016;
          break;
        case 4u:
          unint64_t v10 = 0x43746E756F636361;
          unint64_t v11 = 0xEF736C6F72746E6FLL;
          break;
        case 5u:
          unint64_t v10 = 0x696D694C65746172;
          unint64_t v11 = 0xEF74706D6F725074;
          break;
        case 6u:
          unint64_t v10 = 0x6168437055746573;
          unint64_t v11 = 0xEC00000054504774;
          break;
        case 7u:
          unint64_t v11 = 0xE600000000000000;
          unint64_t v10 = 0x6E496E676973;
          break;
        case 8u:
          unint64_t v11 = 0xE700000000000000;
          unint64_t v10 = 0x74754F6E676973;
          break;
        default:
          break;
      }
      if (v8 == v10 && v9 == v11) {
        break;
      }
      char v13 = sub_10000FA00();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v13 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v6;
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

uint64_t sub_10000E938(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009540(&qword_100018608);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E9A0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for GenerativeAssistantSettingsDeepLinks();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000E9E4()
{
  uint64_t v22 = sub_10000F880();
  uint64_t v0 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100009540(&qword_1000183B0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v21 - v7;
  uint64_t v9 = sub_100009540(&qword_100018650);
  __chkstk_darwin(v9 - 8);
  unint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100009540(&qword_1000183A0);
  __chkstk_darwin(v12 - 8);
  unsigned __int8 v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000F910();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v21 = sub_100009540(&qword_100018658);
  sub_10000F8F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  uint64_t v17 = type metadata accessor for GenerativeAssistantSettingsDeepLinks();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
  uint64_t v18 = sub_10000F740();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v8, 1, 1, v18);
  v19(v6, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v22);
  sub_10000E9A0(qword_1000184B8);
  return sub_10000F780();
}

uint64_t sub_10000ED68(uint64_t a1)
{
  v1[2] = a1;
  sub_100009540(&qword_100018398);
  v1[3] = swift_task_alloc();
  sub_100009540(&qword_1000183A0);
  v1[4] = swift_task_alloc();
  uint64_t v2 = sub_10000F910();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  v1[8] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for GenerativeAssistantSettingsDeepLinks();
  v1[9] = v3;
  v1[10] = *(void *)(v3 - 8);
  v1[11] = swift_task_alloc();
  return _swift_task_switch(sub_10000EEF4, 0, 0);
}

uint64_t sub_10000EEF4()
{
  uint64_t v1 = v0[2];
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v16 = v0[10];
    uint64_t v3 = v0[6];
    sub_10000E270(0, v2, 0);
    uint64_t v4 = (char *)(v1 + 32);
    uint64_t v15 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56);
    do
    {
      uint64_t v5 = v0[4];
      uint64_t v6 = v0[5];
      uint64_t v7 = v0[3];
      char v8 = *v4++;
      *(unsigned char *)v0[11] = v8;
      sub_10000F8F0();
      sub_10000F8F0();
      (*v15)(v5, 0, 1, v6);
      uint64_t v9 = sub_10000F790();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
      sub_10000F8F0();
      sub_10000F7A0();
      unint64_t v11 = _swiftEmptyArrayStorage[2];
      unint64_t v10 = _swiftEmptyArrayStorage[3];
      if (v11 >= v10 >> 1) {
        sub_10000E270(v10 > 1, v11 + 1, 1);
      }
      uint64_t v12 = v0[11];
      _swiftEmptyArrayStorage[2] = v11 + 1;
      sub_10000F580(v12, (uint64_t)_swiftEmptyArrayStorage+ ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))+ *(void *)(v16 + 72) * v11);
      --v2;
    }
    while (v2);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void *))v0[1];
  return v13(_swiftEmptyArrayStorage);
}

uint64_t sub_10000F174()
{
  sub_100009540(&qword_100018398);
  v0[2] = swift_task_alloc();
  sub_100009540(&qword_1000183A0);
  v0[3] = swift_task_alloc();
  uint64_t v1 = sub_10000F910();
  v0[4] = v1;
  v0[5] = *(void *)(v1 - 8);
  v0[6] = swift_task_alloc();
  v0[7] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for GenerativeAssistantSettingsDeepLinks();
  v0[8] = v2;
  v0[9] = *(void *)(v2 - 8);
  v0[10] = swift_task_alloc();
  return _swift_task_switch(sub_10000F2FC, 0, 0);
}

uint64_t sub_10000F2FC()
{
  uint64_t v1 = 9;
  uint64_t v15 = v0[9];
  uint64_t v2 = v0[5];
  sub_10000E270(0, 9, 0);
  uint64_t v3 = &byte_100014B10;
  unsigned __int8 v14 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56);
  do
  {
    uint64_t v4 = v0[3];
    uint64_t v5 = v0[4];
    uint64_t v6 = v0[2];
    char v7 = *v3++;
    *(unsigned char *)v0[10] = v7;
    sub_10000F8F0();
    sub_10000F8F0();
    (*v14)(v4, 0, 1, v5);
    uint64_t v8 = sub_10000F790();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
    sub_10000F8F0();
    sub_10000F7A0();
    unint64_t v10 = _swiftEmptyArrayStorage[2];
    unint64_t v9 = _swiftEmptyArrayStorage[3];
    if (v10 >= v9 >> 1) {
      sub_10000E270(v9 > 1, v10 + 1, 1);
    }
    uint64_t v11 = v0[10];
    _swiftEmptyArrayStorage[2] = v10 + 1;
    sub_10000F580(v11, (uint64_t)_swiftEmptyArrayStorage+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(void *)(v15 + 72) * v10);
    --v1;
  }
  while (v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void *))v0[1];
  return v12(_swiftEmptyArrayStorage);
}

uint64_t sub_10000F580(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GenerativeAssistantSettingsDeepLinks();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000F5E8()
{
  unint64_t result = qword_100018660;
  if (!qword_100018660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018660);
  }
  return result;
}

unint64_t sub_10000F63C()
{
  unint64_t result = qword_100018668;
  if (!qword_100018668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018668);
  }
  return result;
}

uint64_t sub_10000F6C0()
{
  return UniqueAppEntity<>.id.getter();
}

uint64_t sub_10000F6E0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_10000F6F0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_10000F700()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_10000F740()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_10000F750()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_10000F760()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_10000F770()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_10000F780()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_10000F790()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_10000F7A0()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_10000F7B0()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_10000F7C0()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_10000F7D0()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_10000F7F0()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_10000F800()
{
  return URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_10000F840()
{
  return EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_10000F850(Swift::String a1)
{
}

uint64_t sub_10000F860()
{
  return EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10000F870()
{
  return EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_10000F880()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_10000F890()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_10000F8A0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_10000F8B0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_10000F8D0()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t sub_10000F8E0()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_10000F8F0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10000F900()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_10000F910()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10000F920()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_10000F930()
{
  return URL.init(string:)();
}

uint64_t sub_10000F940()
{
  return URL.appending(queryItems:)();
}

uint64_t sub_10000F950()
{
  return type metadata accessor for URL();
}

uint64_t sub_10000F960()
{
  return static Locale.current.getter();
}

uint64_t sub_10000F970()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10000F980()
{
  return static AppExtension.main()();
}

uint64_t sub_10000F990()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_10000F9A0()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_10000F9B0()
{
  return String.hash(into:)();
}

void sub_10000F9C0(Swift::String a1)
{
}

void sub_10000F9D0(Swift::Int a1)
{
}

uint64_t sub_10000F9E0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_10000F9F0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10000FA00()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000FA10()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10000FA20()
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

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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