unint64_t sub_100002048()
{
  unint64_t result;

  result = qword_10001C158;
  if (!qword_10001C158)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C158);
  }
  return result;
}

unint64_t sub_1000020A0()
{
  unint64_t result = qword_10001C160;
  if (!qword_10001C160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C160);
  }
  return result;
}

uint64_t sub_1000020F4(uint64_t a1)
{
  return sub_100002AF0(a1, qword_10001CA08);
}

uint64_t sub_100002118@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100011560();
  *a1 = v3;
  return result;
}

uint64_t sub_100002154()
{
  return swift_release();
}

uint64_t (*sub_10000219C(void *a1))()
{
  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100011550();
  return sub_1000021F8;
}

unint64_t sub_100002200()
{
  unint64_t result = qword_10001C168;
  if (!qword_10001C168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C168);
  }
  return result;
}

unint64_t sub_100002258()
{
  unint64_t result = qword_10001C170;
  if (!qword_10001C170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C170);
  }
  return result;
}

uint64_t sub_1000022AC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100006424();
  unint64_t v5 = sub_1000060C4();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100002318()
{
  unint64_t result = qword_10001C178;
  if (!qword_10001C178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C178);
  }
  return result;
}

unint64_t sub_100002370()
{
  unint64_t result = qword_10001C180;
  if (!qword_10001C180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C180);
  }
  return result;
}

uint64_t sub_1000023C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000039A8(a1, a2, a3, (void (*)(void))sub_100002200);
}

uint64_t sub_1000023DC@<X0>(uint64_t a1@<X8>)
{
  return sub_100004B4C(&qword_10001C0A8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001CA08, a1);
}

uint64_t sub_100002414()
{
  return 0;
}

uint64_t sub_100002420()
{
  return 1;
}

uint64_t sub_100002430(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100006424();
  unint64_t v7 = sub_100006478();
  unint64_t v8 = sub_1000060C4();
  *unint64_t v5 = v2;
  v5[1] = sub_100002504;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100002504()
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

uint64_t sub_10000260C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000058C0();
  *a1 = result;
  return result;
}

uint64_t sub_100002634(uint64_t a1)
{
  unint64_t v2 = sub_100002200();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100002674()
{
  unint64_t result = qword_10001C190;
  if (!qword_10001C190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C190);
  }
  return result;
}

uint64_t sub_1000026C8()
{
  return sub_100006564(&qword_10001C198, &qword_10001C1A0);
}

uint64_t sub_100002704(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000274C()
{
  uint64_t v0 = sub_1000118B0();
  sub_100006060(v0, qword_10001CA20);
  sub_100006028(v0, (uint64_t)qword_10001CA20);
  return sub_1000118A0();
}

uint64_t sub_1000027B0()
{
  uint64_t v0 = sub_100005FE4(&qword_10001C2D8);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005FE4(&qword_10001C2C0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100011910();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  sub_100011900();
  sub_100011900();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_100011750();
  uint64_t v9 = sub_100011760();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v2, 0, 1, v9);
  sub_100005FE4(&qword_10001C2E0);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100011DA0;
  sub_100011900();
  sub_100011900();
  sub_100011900();
  sub_100011900();
  sub_100011900();
  return sub_100011770();
}

uint64_t sub_100002ACC(uint64_t a1)
{
  return sub_100002AF0(a1, qword_10001CA38);
}

uint64_t sub_100002AF0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100011910();
  sub_100006060(v3, a2);
  sub_100006028(v3, (uint64_t)a2);
  return sub_100011900();
}

uint64_t sub_100002B50()
{
  uint64_t v0 = sub_100005FE4(&qword_10001C358);
  sub_100006060(v0, qword_10001CA50);
  uint64_t v1 = sub_100006028(v0, (uint64_t)qword_10001CA50);
  sub_1000116C0();
  uint64_t v2 = sub_1000116D0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100002C08()
{
  uint64_t result = swift_getKeyPath();
  qword_10001CA68 = result;
  return result;
}

uint64_t sub_100002C34@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_100002C40()
{
  sub_100011560();
  return v1;
}

uint64_t sub_100002C74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100005FE4(&qword_10001C328);
  v3[9] = swift_task_alloc();
  sub_100005FE4(&qword_10001C330);
  v3[10] = swift_task_alloc();
  sub_100005FE4(&qword_10001C338);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_100011520();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100005FE4(&qword_10001C340);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_100002E38, 0, 0);
}

uint64_t sub_100002E38()
{
  sub_100011560();
  unsigned __int8 v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_10000411C();
  void *v1 = v0;
  v1[1] = sub_100002F0C;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_1000035C8, 0, &type metadata for AirDropBringDevicesTogetherEntity, v2);
}

uint64_t sub_100002F0C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100003008, 0, 0);
}

uint64_t sub_100003008()
{
  sub_100011560();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_100011560();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_10001C0C8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10001CA68;
  *(void *)(v0 + 168) = qword_10001CA68;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_100006564(&qword_10001C310, &qword_10001C318);
  *uint64_t v3 = v0;
  v3[1] = sub_100003160;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_100003160()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100003504;
  }
  else {
    uint64_t v2 = sub_1000032B4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000032B4()
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
  sub_100011560();
  uint64_t v7 = sub_100011890();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_1000118C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100002674();
  sub_100004434();
  sub_1000114F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_100011510();
  sub_100011530();
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

uint64_t sub_100003504()
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

uint64_t sub_1000035CC()
{
  uint64_t v0 = sub_100005FE4(&qword_10001C348);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001C0C8 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100011740();
  swift_release();
  sub_100004434();
  sub_100006564(&qword_10001C350, &qword_10001C348);
  sub_100011730();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100003734@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100011560();
  *a1 = v3;
  return result;
}

uint64_t sub_100003770()
{
  return sub_100011570();
}

uint64_t (*sub_1000037A8(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100011550();
  return sub_1000021F8;
}

void sub_100003804(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_100003850()
{
  if (qword_10001C0C8 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_1000038B0()
{
  unint64_t result = qword_10001C1A8;
  if (!qword_10001C1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1A8);
  }
  return result;
}

unint64_t sub_100003908()
{
  unint64_t result = qword_10001C1B0;
  if (!qword_10001C1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1B0);
  }
  return result;
}

uint64_t sub_10000395C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100003990(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000039A8(a1, a2, a3, (void (*)(void))sub_100002674);
}

uint64_t sub_1000039A8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000039FC@<X0>(uint64_t a1@<X8>)
{
  return sub_100004B4C(&qword_10001C0B8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001CA38, a1);
}

uint64_t sub_100003A38@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001C0C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005FE4(&qword_10001C358);
  uint64_t v3 = sub_100006028(v2, (uint64_t)qword_10001CA50);

  return sub_1000063BC(v3, a1);
}

uint64_t sub_100003AB4(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000066E8;
  return sub_100002C74(a1, v5, v4);
}

uint64_t sub_100003B60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100005BA4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100003B88()
{
  return 0xD000000000000032;
}

unint64_t sub_100003BA8()
{
  unint64_t result = qword_10001C1C0;
  if (!qword_10001C1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1C0);
  }
  return result;
}

unint64_t sub_100003C00()
{
  unint64_t result = qword_10001C1C8;
  if (!qword_10001C1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1C8);
  }
  return result;
}

uint64_t sub_100003C54(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100003C74, 0, 0);
}

uint64_t sub_100003C74()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  sub_1000119A0();
  uint64_t v2 = (void *)sub_100011990();
  char v3 = sub_100011960();

  unsigned char *v1 = v3 & 1;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100003D04(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100003D28, 0, 0);
}

uint64_t sub_100003D28()
{
  sub_1000119A0();
  uint64_t v1 = (void *)sub_100011990();
  sub_100011970();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100003DA8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10001C2F0 + dword_10001C2F0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_1000066E4;
  return v4();
}

unint64_t sub_100003E50()
{
  unint64_t result = qword_10001C1D8;
  if (!qword_10001C1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1D8);
  }
  return result;
}

uint64_t sub_100003EA4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100004824();
  *uint64_t v4 = v2;
  v4[1] = sub_100003F54;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_100003F54(uint64_t a1)
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

unint64_t sub_10000406C()
{
  unint64_t result = qword_10001C1E8;
  if (!qword_10001C1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1E8);
  }
  return result;
}

unint64_t sub_1000040C4()
{
  unint64_t result = qword_10001C1F0;
  if (!qword_10001C1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1F0);
  }
  return result;
}

unint64_t sub_10000411C()
{
  unint64_t result = qword_10001C1F8[0];
  if (!qword_10001C1F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10001C1F8);
  }
  return result;
}

uint64_t sub_100004174(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100004824();
  *uint64_t v5 = v2;
  v5[1] = sub_100004228;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100004228(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100004328(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100004824();
  *uint64_t v4 = v2;
  v4[1] = sub_1000066E4;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_1000043DC()
{
  unint64_t result = qword_10001C210;
  if (!qword_10001C210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C210);
  }
  return result;
}

unint64_t sub_100004434()
{
  unint64_t result = qword_10001C218;
  if (!qword_10001C218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C218);
  }
  return result;
}

unint64_t sub_10000448C()
{
  unint64_t result = qword_10001C220;
  if (!qword_10001C220)
  {
    sub_100002704(qword_10001C228);
    sub_100004434();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C220);
  }
  return result;
}

uint64_t sub_100004500(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100003E50();
  *unint64_t v5 = v2;
  v5[1] = sub_1000045B4;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_1000045B4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000046A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1000045B4;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

unint64_t sub_100004768()
{
  unint64_t result = qword_10001C240;
  if (!qword_10001C240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C240);
  }
  return result;
}

unint64_t sub_1000047C0()
{
  unint64_t result = qword_10001C248;
  if (!qword_10001C248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C248);
  }
  return result;
}

void *sub_100004814()
{
  return &protocol witness table for String;
}

unint64_t sub_100004824()
{
  unint64_t result = qword_10001C250;
  if (!qword_10001C250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C250);
  }
  return result;
}

unint64_t sub_10000487C()
{
  unint64_t result = qword_10001C258;
  if (!qword_10001C258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C258);
  }
  return result;
}

uint64_t sub_1000048D0(uint64_t a1)
{
  unint64_t v2 = sub_10000411C();

  return _EntityURLRepresentation.init(stringLiteral:)(0xD00000000000004CLL, 0x80000001000141A0, a1, v2);
}

unint64_t sub_100004930()
{
  unint64_t result = qword_10001C260;
  if (!qword_10001C260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C260);
  }
  return result;
}

unint64_t sub_100004988()
{
  unint64_t result = qword_10001C268;
  if (!qword_10001C268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C268);
  }
  return result;
}

unint64_t sub_1000049E0()
{
  unint64_t result = qword_10001C270;
  if (!qword_10001C270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C270);
  }
  return result;
}

void *sub_100004A34()
{
  return &protocol witness table for String;
}

uint64_t sub_100004A40@<X0>(uint64_t *a1@<X8>)
{
  sub_100003C00();
  uint64_t result = sub_100011540();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100004A80()
{
  sub_1000060C4();
  uint64_t v2 = sub_100011810();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006118(v3, v0, v2, v1);
}

uint64_t sub_100004B14@<X0>(uint64_t a1@<X8>)
{
  return sub_100004B4C(&qword_10001C0B0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10001CA20, a1);
}

uint64_t sub_100004B4C@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100006028(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100004BF0()
{
  return sub_100006564(&qword_10001C280, &qword_10001C288);
}

uint64_t sub_100004C2C(uint64_t a1)
{
  unint64_t v2 = sub_10000411C();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100004C7C()
{
  unint64_t result = qword_10001C290;
  if (!qword_10001C290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C290);
  }
  return result;
}

uint64_t sub_100004CD4(uint64_t a1)
{
  unint64_t v2 = sub_1000049E0();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for AirDropBringDevicesTogetherEntity.AirDropBringDevicesTogetherEntityQuery()
{
  return &type metadata for AirDropBringDevicesTogetherEntity.AirDropBringDevicesTogetherEntityQuery;
}

uint64_t destroy for AirDropBringDevicesTogetherEntity.UpdateIntent_value()
{
  swift_release();

  return swift_release();
}

void *_s22AirDropSettingsIntents33AirDropBringDevicesTogetherEntityV18UpdateIntent_valueVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for AirDropBringDevicesTogetherEntity.UpdateIntent_value(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for AirDropBringDevicesTogetherEntity.UpdateIntent_value(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for AirDropBringDevicesTogetherEntity.UpdateIntent_value(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AirDropBringDevicesTogetherEntity.UpdateIntent_value(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AirDropBringDevicesTogetherEntity.UpdateIntent_value(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AirDropBringDevicesTogetherEntity.UpdateIntent_value()
{
  return &type metadata for AirDropBringDevicesTogetherEntity.UpdateIntent_value;
}

ValueMetadata *type metadata accessor for AirDropBringDevicesTogetherEntity()
{
  return &type metadata for AirDropBringDevicesTogetherEntity;
}

ValueMetadata *type metadata accessor for OpenAirDropBringDevicesTogetherEntity()
{
  return &type metadata for OpenAirDropBringDevicesTogetherEntity;
}

uint64_t sub_100004F08()
{
  return sub_100006564(&qword_10001C298, &qword_10001C2A0);
}

uint64_t sub_100004F44()
{
  return sub_100006564(&qword_10001C2A8, &qword_10001C2A0);
}

uint64_t sub_100004F80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v32 = a1;
  uint64_t v1 = sub_100005FE4(&qword_10001C370);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100005FE4(&qword_10001C378);
  uint64_t v26 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  unint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100005FE4(&qword_10001C380);
  uint64_t v27 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005FE4(&qword_10001C388);
  uint64_t v28 = *(void *)(v9 - 8);
  uint64_t v29 = v9;
  __chkstk_darwin(v9);
  v25 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100005FE4(&qword_10001C390);
  sub_100005FE4(&qword_10001C398);
  sub_100003C00();
  sub_100006564(&qword_10001C3A0, &qword_10001C390);
  sub_1000064F8();
  sub_100011A80();
  sub_1000119D0();
  uint64_t v11 = sub_100006564(&qword_10001C3B0, &qword_10001C370);
  sub_100011A00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_1000119D0();
  if (qword_10001C150 != -1) {
    swift_once();
  }
  id v12 = (id)qword_10001CBB0;
  uint64_t v13 = sub_100011A30();
  uint64_t v15 = v14;
  char v17 = v16 & 1;
  uint64_t v33 = v1;
  uint64_t v34 = v11;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v19 = v30;
  sub_1000119E0();
  sub_1000065A8(v13, v15, v17);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v19);
  uint64_t v33 = v19;
  uint64_t v34 = OpaqueTypeConformance2;
  uint64_t v20 = swift_getOpaqueTypeConformance2();
  v21 = v25;
  uint64_t v22 = v31;
  sub_100011A10();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v8, v22);
  uint64_t v33 = v22;
  uint64_t v34 = v20;
  swift_getOpaqueTypeConformance2();
  uint64_t v23 = v29;
  sub_1000119F0();
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v21, v23);
}

uint64_t sub_100005550@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100005FE4(&qword_10001C390);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000119D0();
  sub_100011A40();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v5, v2);
}

uint64_t sub_100005678@<X0>(uint64_t a1@<X8>)
{
  sub_1000119D0();
  uint64_t result = sub_100011A30();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

double sub_1000056EC@<D0>(char a1@<W0>, uint64_t a2@<X8>)
{
  if (a1)
  {
    sub_1000119D0();
    if (qword_10001C150 == -1) {
      goto LABEL_5;
    }
    goto LABEL_6;
  }
  sub_1000119D0();
  if (qword_10001C150 != -1) {
LABEL_6:
  }
    swift_once();
LABEL_5:
  id v3 = (id)qword_10001CBB0;
  sub_100011A30();
  sub_100011A20();
  double result = *(double *)&v5;
  *(_OWORD *)a2 = v5;
  *(_OWORD *)(a2 + 16) = v6;
  *(unsigned char *)(a2 + 32) = v7;
  return result;
}

uint64_t sub_1000058C0()
{
  v16[0] = sub_100011800();
  uint64_t v0 = *(void *)(v16[0] - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v2 = (char *)v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005FE4(&qword_10001C2B8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  long long v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  char v7 = (char *)v16 - v6;
  uint64_t v8 = sub_100005FE4(&qword_10001C2C0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100011910();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_100005FE4(&qword_10001C2C8);
  sub_100011900();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  v16[1] = 0;
  uint64_t v13 = sub_100011520();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v16[0]);
  sub_10000411C();
  return sub_100011590();
}

uint64_t sub_100005BA4()
{
  uint64_t v0 = sub_100005FE4(&qword_10001C2B0);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100011800();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005FE4(&qword_10001C2B8);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100005FE4(&qword_10001C2C0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_100011910();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100005FE4(&qword_10001C2C8);
  sub_100011900();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_100011520();
  char v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_10000411C();
  uint64_t v19 = v23;
  uint64_t v24 = sub_100011590();
  sub_100005FE4(&qword_10001C2D0);
  sub_100011900();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100011AB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_1000115A0();
  return v24;
}

uint64_t sub_100005FE4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006028(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100006060(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_1000060C4()
{
  unint64_t result = qword_10001C2E8;
  if (!qword_10001C2E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C2E8);
  }
  return result;
}

uint64_t sub_100006118(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_10000612C()
{
  sub_100011910();
  *(void *)(v0 + 16) = swift_task_alloc();
  return _swift_task_switch(sub_1000061B8, 0, 0);
}

uint64_t sub_1000061B8()
{
  sub_1000119A0();
  uint64_t v1 = (void *)sub_100011990();
  char v2 = sub_100011980();

  if (v2)
  {
    sub_100005FE4(&qword_10001C1A0);
    sub_100011900();
    sub_100006564(&qword_10001C310, &qword_10001C318);
    uint64_t v3 = sub_1000118F0();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v4(v3);
  }
  else
  {
    sub_100011450();
    sub_100006364();
    swift_allocError();
    sub_100011710();
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

unint64_t sub_100006364()
{
  unint64_t result = qword_10001C2F8;
  if (!qword_10001C2F8)
  {
    sub_100011450();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C2F8);
  }
  return result;
}

uint64_t sub_1000063BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005FE4(&qword_10001C358);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100006424()
{
  unint64_t result = qword_10001C360;
  if (!qword_10001C360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C360);
  }
  return result;
}

unint64_t sub_100006478()
{
  unint64_t result = qword_10001C368;
  if (!qword_10001C368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C368);
  }
  return result;
}

ValueMetadata *type metadata accessor for AirDropBringDevicesTogetherToggleControl()
{
  return &type metadata for AirDropBringDevicesTogetherToggleControl;
}

uint64_t sub_1000064DC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000064F8()
{
  unint64_t result = qword_10001C3A8;
  if (!qword_10001C3A8)
  {
    sub_100002704(&qword_10001C398);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3A8);
  }
  return result;
}

uint64_t sub_100006564(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100002704(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000065A8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000065B8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000066F0()
{
  unint64_t result = qword_10001C3B8;
  if (!qword_10001C3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3B8);
  }
  return result;
}

unint64_t sub_100006748()
{
  unint64_t result = qword_10001C3C0;
  if (!qword_10001C3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3C0);
  }
  return result;
}

uint64_t sub_10000679C(uint64_t a1)
{
  return sub_100002AF0(a1, qword_10001CA70);
}

unint64_t sub_1000067C4()
{
  unint64_t result = qword_10001C3C8;
  if (!qword_10001C3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3C8);
  }
  return result;
}

uint64_t sub_100006818(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10000A96C();
  unint64_t v5 = sub_10000A90C();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100006884()
{
  unint64_t result = qword_10001C3D0;
  if (!qword_10001C3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3D0);
  }
  return result;
}

unint64_t sub_1000068DC()
{
  unint64_t result = qword_10001C3D8;
  if (!qword_10001C3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3D8);
  }
  return result;
}

uint64_t sub_100006930(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000093C8(a1, a2, a3, (void (*)(void))sub_1000067C4);
}

uint64_t sub_10000695C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000092F8(&qword_10001C0D0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001CA70, a1);
}

uint64_t sub_100006994(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000A96C();
  unint64_t v7 = sub_10000A9C0();
  unint64_t v8 = sub_10000A90C();
  *unint64_t v5 = v2;
  v5[1] = sub_100002504;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100006A68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009E34();
  *a1 = result;
  return result;
}

uint64_t sub_100006A90(uint64_t a1)
{
  unint64_t v2 = sub_1000067C4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100006AD0()
{
  unint64_t result = qword_10001C3E8;
  if (!qword_10001C3E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3E8);
  }
  return result;
}

uint64_t sub_100006B24()
{
  return sub_100006564(&qword_10001C3F0, &qword_10001C3F8);
}

uint64_t sub_100006B60(uint64_t a1)
{
  return sub_100006B84(a1, qword_10001CA88);
}

uint64_t sub_100006B84(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000118B0();
  sub_100006060(v3, a2);
  sub_100006028(v3, (uint64_t)a2);
  return sub_1000118A0();
}

uint64_t sub_100006BE4()
{
  uint64_t v0 = sub_100005FE4(&qword_10001C2D8);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005FE4(&qword_10001C2C0);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100011910();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  sub_100011900();
  sub_100011900();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_100011750();
  uint64_t v9 = sub_100011760();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v2, 0, 1, v9);
  sub_100005FE4(&qword_10001C2E0);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000125E0;
  sub_100011900();
  sub_100011900();
  return sub_100011770();
}

uint64_t sub_100006EB4(uint64_t a1)
{
  return sub_100002AF0(a1, qword_10001CAA0);
}

uint64_t sub_100006ED8()
{
  uint64_t v0 = sub_100005FE4(&qword_10001C358);
  sub_100006060(v0, qword_10001CAB8);
  uint64_t v1 = sub_100006028(v0, (uint64_t)qword_10001CAB8);
  sub_1000116C0();
  uint64_t v2 = sub_1000116D0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100006F90()
{
  uint64_t result = swift_getKeyPath();
  qword_10001CAD0 = result;
  return result;
}

uint64_t sub_100006FB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100005FE4(&qword_10001C328);
  v3[9] = swift_task_alloc();
  sub_100005FE4(&qword_10001C330);
  v3[10] = swift_task_alloc();
  sub_100005FE4(&qword_10001C5C8);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_100011520();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100005FE4(&qword_10001C5D0);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_10000717C, 0, 0);
}

uint64_t sub_10000717C()
{
  sub_100011560();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_100008348();
  void *v1 = v0;
  v1[1] = sub_100007250;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100007840, 0, &type metadata for AirDropReceivingModeEntity, v2);
}

uint64_t sub_100007250()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10000734C, 0, 0);
}

uint64_t sub_10000734C()
{
  sub_100011560();
  uint64_t v1 = v0[3];
  v0[4] = v1;
  v0[20] = v1;
  sub_100011560();
  if (qword_10001C0F0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10001CAD0;
  v0[21] = qword_10001CAD0;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[22] = v3;
  uint64_t v4 = sub_100006564(&qword_10001C5B0, &qword_10001C5B8);
  *uint64_t v3 = v0;
  v3[1] = sub_10000749C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 24, v2, &type metadata for AirDropReceivingMode, v4);
}

uint64_t sub_10000749C()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100003504;
  }
  else {
    uint64_t v2 = sub_1000075F0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000075F0()
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
  sub_100011560();
  uint64_t v7 = sub_100011890();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_1000118C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100006AD0();
  sub_10000855C();
  sub_1000114F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_100011510();
  sub_100011530();
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

uint64_t sub_100007844()
{
  uint64_t v0 = sub_100005FE4(&qword_10001C5D8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001C0F0 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100011740();
  swift_release();
  sub_10000855C();
  sub_100006564(&qword_10001C5E0, &qword_10001C5D8);
  sub_100011730();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1000079AC()
{
  if (qword_10001C0F0 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100007A0C()
{
  unint64_t result = qword_10001C400;
  if (!qword_10001C400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C400);
  }
  return result;
}

unint64_t sub_100007A64()
{
  unint64_t result = qword_10001C408;
  if (!qword_10001C408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C408);
  }
  return result;
}

uint64_t sub_100007AB8()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100007AEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000093C8(a1, a2, a3, (void (*)(void))sub_100006AD0);
}

uint64_t sub_100007B18@<X0>(uint64_t a1@<X8>)
{
  return sub_1000092F8(&qword_10001C0E0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001CAA0, a1);
}

uint64_t sub_100007B50@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001C0E8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005FE4(&qword_10001C358);
  uint64_t v3 = sub_100006028(v2, (uint64_t)qword_10001CAB8);

  return sub_1000063BC(v3, a1);
}

uint64_t sub_100007BCC(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000066E8;
  return sub_100006FB8(a1, v5, v4);
}

uint64_t sub_100007C78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000A118();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100007CA0()
{
  return 0xD00000000000002BLL;
}

unint64_t sub_100007CC0()
{
  unint64_t result = qword_10001C418;
  if (!qword_10001C418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C418);
  }
  return result;
}

unint64_t sub_100007D18()
{
  unint64_t result = qword_10001C420;
  if (!qword_10001C420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C420);
  }
  return result;
}

uint64_t sub_100007D6C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100007D8C, 0, 0);
}

uint64_t sub_100007D8C()
{
  uint64_t v1 = *(char **)(v0 + 16);
  sub_1000119A0();
  uint64_t v2 = (void *)sub_100011990();
  uint64_t v3 = sub_100011920();

  if (v3 == 2) {
    char v4 = 2;
  }
  else {
    char v4 = v3 == 1;
  }
  char *v1 = v4;
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_100007E2C(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100007E50, 0, 0);
}

id sub_100007E50()
{
  if (*(unsigned char *)(v0 + 16) && *(unsigned char *)(v0 + 16) == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v1 = sub_100011AF0();
    swift_bridgeObjectRelease();
    if ((v1 & 1) == 0)
    {
LABEL_8:
      sub_1000119A0();
      uint64_t v6 = (void *)sub_100011990();
      sub_100011930();

      uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
      goto LABEL_9;
    }
  }
  id result = [self sharedManager];
  if (!result)
  {
    __break(1u);
    return result;
  }
  uint64_t v3 = result;
  unsigned int v4 = [result isMultiUser];

  if (!v4) {
    goto LABEL_8;
  }
  sub_100011450();
  sub_100006364();
  swift_allocError();
  sub_100011720();
  swift_willThrow();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
LABEL_9:
  return (id)v5();
}

uint64_t sub_100007FE0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_100011910();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100008070, 0, 0);
}

uint64_t sub_100008070()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100005FE4(&qword_10001C3F8);
  sub_100011900();
  sub_100006564(&qword_10001C5B0, &qword_10001C5B8);
  sub_100009410();
  uint64_t *v1 = sub_1000118E0();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_100008190()
{
  unint64_t result = qword_10001C430;
  if (!qword_10001C430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C430);
  }
  return result;
}

uint64_t sub_1000081E4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100008794();
  *uint64_t v4 = v2;
  v4[1] = sub_100003F54;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100008298()
{
  unint64_t result = qword_10001C440;
  if (!qword_10001C440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C440);
  }
  return result;
}

unint64_t sub_1000082F0()
{
  unint64_t result = qword_10001C448;
  if (!qword_10001C448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C448);
  }
  return result;
}

unint64_t sub_100008348()
{
  unint64_t result = qword_10001C450[0];
  if (!qword_10001C450[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10001C450);
  }
  return result;
}

uint64_t sub_10000839C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100008794();
  *unint64_t v5 = v2;
  v5[1] = sub_100004228;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100008450(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100008794();
  *uint64_t v4 = v2;
  v4[1] = sub_1000066E4;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100008504()
{
  unint64_t result = qword_10001C468;
  if (!qword_10001C468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C468);
  }
  return result;
}

unint64_t sub_10000855C()
{
  unint64_t result = qword_10001C470;
  if (!qword_10001C470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C470);
  }
  return result;
}

unint64_t sub_1000085B4()
{
  unint64_t result = qword_10001C478;
  if (!qword_10001C478)
  {
    sub_100002704(qword_10001C480);
    sub_10000855C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C478);
  }
  return result;
}

uint64_t sub_100008628(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100008190();
  *unint64_t v5 = v2;
  v5[1] = sub_1000045B4;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_1000086E4()
{
  unint64_t result = qword_10001C498;
  if (!qword_10001C498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C498);
  }
  return result;
}

unint64_t sub_10000873C()
{
  unint64_t result = qword_10001C4A0;
  if (!qword_10001C4A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4A0);
  }
  return result;
}

unint64_t sub_100008794()
{
  unint64_t result = qword_10001C4A8;
  if (!qword_10001C4A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4A8);
  }
  return result;
}

unint64_t sub_1000087EC()
{
  unint64_t result = qword_10001C4B0;
  if (!qword_10001C4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4B0);
  }
  return result;
}

uint64_t sub_100008840(uint64_t a1)
{
  unint64_t v2 = sub_100008348();

  return _EntityURLRepresentation.init(stringLiteral:)(0xD00000000000004ELL, 0x8000000100014650, a1, v2);
}

unint64_t sub_1000088A0()
{
  unint64_t result = qword_10001C4B8;
  if (!qword_10001C4B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4B8);
  }
  return result;
}

unint64_t sub_1000088F8()
{
  unint64_t result = qword_10001C4C0;
  if (!qword_10001C4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4C0);
  }
  return result;
}

unint64_t sub_100008950()
{
  unint64_t result = qword_10001C4C8;
  if (!qword_10001C4C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4C8);
  }
  return result;
}

uint64_t sub_1000089A4@<X0>(uint64_t *a1@<X8>)
{
  sub_100007D18();
  uint64_t result = sub_100011540();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000089E4()
{
  sub_10000A90C();
  uint64_t v2 = sub_100011810();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006118(v3, v0, v2, v1);
}

uint64_t sub_100008A78@<X0>(uint64_t a1@<X8>)
{
  return sub_1000092F8(&qword_10001C0D8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10001CA88, a1);
}

uint64_t sub_100008AB0()
{
  return sub_100006564(&qword_10001C4D8, &qword_10001C4E0);
}

uint64_t sub_100008AEC(uint64_t a1)
{
  unint64_t v2 = sub_100008348();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100008B3C()
{
  unint64_t result = qword_10001C4E8;
  if (!qword_10001C4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4E8);
  }
  return result;
}

uint64_t sub_100008B94(uint64_t a1)
{
  unint64_t v2 = sub_100008950();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100008BE0(uint64_t a1)
{
  return sub_100006B84(a1, qword_10001CAD8);
}

uint64_t sub_100008C0C()
{
  sub_1000119D0();
  if (qword_10001C150 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10001CBB0;
  return sub_100011A30();
}

uint64_t sub_100008D20(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10000BD08(*a1, *a2);
}

unint64_t sub_100008D30()
{
  unint64_t result = qword_10001C4F0;
  if (!qword_10001C4F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4F0);
  }
  return result;
}

Swift::Int sub_100008D84()
{
  return sub_100011B10();
}

uint64_t sub_100008E28()
{
  sub_100011AA0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100008EB8()
{
  return sub_100011B10();
}

uint64_t sub_100008F58@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000A8C0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_100008F88(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE300000000000000;
  unint64_t v4 = 0xEC000000796C6E4FLL;
  uint64_t v5 = 0x73746361746E6F63;
  if (v2 != 1)
  {
    uint64_t v5 = 0x656E6F7972657665;
    unint64_t v4 = 0xE800000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 6710895;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

unint64_t sub_100008FEC()
{
  unint64_t result = qword_10001C4F8;
  if (!qword_10001C4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4F8);
  }
  return result;
}

void sub_100009040(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_100009050()
{
  unint64_t result = qword_10001C500;
  if (!qword_10001C500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C500);
  }
  return result;
}

unint64_t sub_1000090A8()
{
  unint64_t result = qword_10001C508;
  if (!qword_10001C508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C508);
  }
  return result;
}

unint64_t sub_100009100()
{
  unint64_t result = qword_10001C510;
  if (!qword_10001C510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C510);
  }
  return result;
}

void *sub_100009154()
{
  return &protocol witness table for String;
}

unint64_t sub_100009164()
{
  unint64_t result = qword_10001C518;
  if (!qword_10001C518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C518);
  }
  return result;
}

unint64_t sub_1000091BC()
{
  unint64_t result = qword_10001C520;
  if (!qword_10001C520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C520);
  }
  return result;
}

unint64_t sub_100009214()
{
  unint64_t result = qword_10001C528;
  if (!qword_10001C528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C528);
  }
  return result;
}

unint64_t sub_10000926C()
{
  unint64_t result = qword_10001C530;
  if (!qword_10001C530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C530);
  }
  return result;
}

uint64_t sub_1000092C0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000092F8(&qword_10001C0F8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10001CAD8, a1);
}

uint64_t sub_1000092F8@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100006028(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_10000939C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000093C8(a1, a2, a3, (void (*)(void))sub_100009410);
}

uint64_t sub_1000093C8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100009410()
{
  unint64_t result = qword_10001C538;
  if (!qword_10001C538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C538);
  }
  return result;
}

uint64_t sub_100009464(uint64_t a1)
{
  unint64_t v2 = sub_100009410();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000094B4()
{
  unint64_t result = qword_10001C540;
  if (!qword_10001C540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C540);
  }
  return result;
}

unint64_t sub_10000950C()
{
  unint64_t result = qword_10001C548;
  if (!qword_10001C548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C548);
  }
  return result;
}

uint64_t sub_100009564(uint64_t a1)
{
  unint64_t v2 = sub_10000926C();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_1000095B0()
{
  return sub_100006564(&qword_10001C550, &qword_10001C558);
}

void sub_1000095EC(void *a1@<X8>)
{
  *a1 = &off_100018E38;
}

ValueMetadata *type metadata accessor for AirDropReceivingModeEntity.AirDropDiscoveryModeEntityQuery()
{
  return &type metadata for AirDropReceivingModeEntity.AirDropDiscoveryModeEntityQuery;
}

unsigned char *initializeBufferWithCopyOfBuffer for AirDropReceivingMode(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AirDropReceivingMode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AirDropReceivingMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100009778);
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

uint64_t sub_1000097A0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000097A8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AirDropReceivingMode()
{
  return &type metadata for AirDropReceivingMode;
}

ValueMetadata *type metadata accessor for AirDropReceivingModeEntity.UpdateIntent_value()
{
  return &type metadata for AirDropReceivingModeEntity.UpdateIntent_value;
}

ValueMetadata *type metadata accessor for AirDropReceivingModeEntity()
{
  return &type metadata for AirDropReceivingModeEntity;
}

ValueMetadata *type metadata accessor for OpenAirDropReceivingModeEntity()
{
  return &type metadata for OpenAirDropReceivingModeEntity;
}

uint64_t sub_1000097F0()
{
  return sub_100006564(&qword_10001C560, &qword_10001C568);
}

uint64_t sub_10000982C()
{
  return sub_100006564(&qword_10001C570, &qword_10001C568);
}

uint64_t sub_100009868@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v1 = sub_100011A60();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_100005FE4(&qword_10001C5F8);
  uint64_t v17 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unsigned int v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005FE4(&qword_10001C600);
  uint64_t v18 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  BOOL v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005FE4(&qword_10001C608);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v19 = v8;
  uint64_t v20 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100011A50();
  sub_100009410();
  sub_10000AA40();
  sub_100007D18();
  sub_100011A70();
  sub_1000119D0();
  uint64_t v12 = sub_100006564(&qword_10001C618, &qword_10001C5F8);
  sub_100011A00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v4, v2);
  uint64_t v22 = v2;
  uint64_t v23 = v12;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_100011A10();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v5);
  uint64_t v22 = v5;
  uint64_t v23 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v14 = v19;
  sub_1000119F0();
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v11, v14);
}

uint64_t sub_100009CA8@<X0>(uint64_t a1@<X8>)
{
  sub_1000119D0();
  if (qword_10001C150 != -1) {
    swift_once();
  }
  id v2 = (id)qword_10001CBB0;
  uint64_t result = sub_100011A30();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_100009D90@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_100008C0C();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100009DC8()
{
  return sub_100011A90();
}

uint64_t sub_100009E34()
{
  v17[0] = sub_100011800();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  id v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005FE4(&qword_10001C2B8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_100005FE4(&qword_10001C2C0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100011910();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100005FE4(&qword_10001C578);
  sub_100011900();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v17[1] = 0;
  uint64_t v14 = sub_100011520();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_100008348();
  return sub_100011590();
}

uint64_t sub_10000A118()
{
  uint64_t v28 = sub_100011800();
  uint64_t v0 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  unsigned int v27 = (char *)v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100005FE4(&qword_10001C2B8);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)v20 - v6;
  uint64_t v8 = sub_100005FE4(&qword_10001C2C0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100011910();
  uint64_t v26 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v23 = sub_100005FE4(&qword_10001C578);
  sub_100011900();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v24 = v12 + 56;
  uint64_t v25 = v13;
  v13(v10, 1, 1, v11);
  uint64_t v30 = 0;
  uint64_t v14 = sub_100011520();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v7;
  v15(v7, 1, 1, v14);
  v15(v5, 1, 1, v14);
  unsigned int v22 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v17 = *(void (**)(void))(v0 + 104);
  v20[1] = v0 + 104;
  uint64_t v21 = (void (*)(char *, void, uint64_t))v17;
  uint64_t v18 = v27;
  v17(v27);
  sub_100008348();
  uint64_t v23 = sub_100011590();
  sub_100005FE4(&qword_10001C580);
  sub_100011900();
  v25(v10, 1, 1, v26);
  char v29 = 3;
  v15(v16, 1, 1, v14);
  v15(v5, 1, 1, v14);
  v21(v18, v22, v28);
  sub_100009410();
  sub_100011580();
  return v23;
}

unint64_t sub_10000A504()
{
  uint64_t v0 = sub_100005FE4(&qword_10001C2D8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005FE4(&qword_10001C2C0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100011910();
  uint64_t v24 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_100005FE4(&qword_10001C588);
  uint64_t v8 = (int *)(sub_100005FE4(&qword_10001C590) - 8);
  uint64_t v9 = *(void *)(*(void *)v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(*(void *)v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v8 + 80);
  uint64_t v27 = 2 * v9;
  uint64_t v11 = swift_allocObject();
  uint64_t v28 = v11;
  *(_OWORD *)(v11 + 16) = xmmword_1000125F0;
  unint64_t v12 = v11 + v10 + v8[14];
  unint64_t v22 = v11 + v10;
  unint64_t v23 = v12;
  *(unsigned char *)(v11 + v10) = 0;
  unint64_t v13 = v11 + v10;
  sub_100011900();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  uint64_t v25 = v7 + 56;
  uint64_t v26 = v14;
  v14(v5, 1, 1, v6);
  uint64_t v15 = sub_100011760();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v16(v2, 1, 1, v15);
  uint64_t v17 = v2;
  sub_100011780();
  unint64_t v23 = v13 + v9 + v8[14];
  *(unsigned char *)(v13 + v9) = 1;
  sub_100011900();
  uint64_t v18 = v24;
  uint64_t v19 = v26;
  v26(v5, 1, 1, v24);
  v16(v17, 1, 1, v15);
  sub_100011780();
  *(unsigned char *)(v22 + v27) = 2;
  sub_100011900();
  v19(v5, 1, 1, v18);
  v16(v17, 1, 1, v15);
  sub_100011780();
  return sub_10000BE24(v28);
}

uint64_t sub_10000A8C0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100018DD0;
  v6._object = a2;
  unint64_t v4 = sub_100011AE0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

unint64_t sub_10000A90C()
{
  unint64_t result = qword_10001C598;
  if (!qword_10001C598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C598);
  }
  return result;
}

uint64_t sub_10000A960@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

unint64_t sub_10000A96C()
{
  unint64_t result = qword_10001C5E8;
  if (!qword_10001C5E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C5E8);
  }
  return result;
}

unint64_t sub_10000A9C0()
{
  unint64_t result = qword_10001C5F0;
  if (!qword_10001C5F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C5F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for AirDropReceivingModePickerControl()
{
  return &type metadata for AirDropReceivingModePickerControl;
}

uint64_t sub_10000AA24()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000AA40()
{
  unint64_t result = qword_10001C610;
  if (!qword_10001C610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C610);
  }
  return result;
}

uint64_t sub_10000AA94()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000AB84()
{
  uint64_t v0 = sub_100005FE4(&qword_10001C678);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  Swift::OpaquePointer v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005FE4(&qword_10001C680);
  __chkstk_darwin(v4);
  sub_10000B8CC();
  sub_100011660();
  v10._object = (void *)0x8000000100014850;
  v10._countAndFlagsBits = 0xD000000000000025;
  sub_100011650(v10);
  swift_getKeyPath();
  sub_10000B99C();
  sub_1000115B0();
  swift_release();
  sub_100011640();
  swift_release();
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  sub_100011650(v11);
  sub_100011670();
  uint64_t v5 = sub_1000115D0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005FE4(&qword_10001C688);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1000125E0;
  *(void *)(v6 + 32) = v5;
  uint64_t v7 = sub_1000115C0();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_10000ADC0(uint64_t a1)
{
  return sub_10000B3B0(a1, (uint64_t)&unk_100013198, (void (*)(void))sub_10000B99C, (void (*)(uint64_t))sub_10000B8CC);
}

uint64_t sub_10000AE0C()
{
  uint64_t v0 = sub_100005FE4(&qword_10001C660);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  Swift::OpaquePointer v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005FE4(&qword_10001C668);
  __chkstk_darwin(v4);
  sub_100002674();
  sub_100011660();
  v10._object = (void *)0x8000000100014820;
  v10._countAndFlagsBits = 0xD00000000000002ALL;
  sub_100011650(v10);
  swift_getKeyPath();
  sub_10000B99C();
  sub_1000115B0();
  swift_release();
  sub_100011640();
  swift_release();
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  sub_100011650(v11);
  sub_100011670();
  uint64_t v5 = sub_1000115D0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005FE4(&qword_10001C670);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1000125E0;
  *(void *)(v6 + 32) = v5;
  uint64_t v7 = sub_1000115C0();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_10000B048(uint64_t a1)
{
  return sub_10000B3B0(a1, (uint64_t)&unk_100013170, (void (*)(void))sub_10000B99C, (void (*)(uint64_t))sub_100002674);
}

uint64_t sub_10000B090()
{
  uint64_t v0 = sub_1000115F0();
  uint64_t v1 = sub_1000115F0();
  sub_100005FE4(&qword_10001C638);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1000130E0;
  *(void *)(v2 + 32) = v0;
  *(void *)(v2 + 40) = v1;
  uint64_t v3 = sub_1000115E0();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_10000B12C()
{
  uint64_t v0 = sub_100005FE4(&qword_10001C640);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005FE4(&qword_10001C648);
  __chkstk_darwin(v4);
  sub_100006AD0();
  sub_100011660();
  v10._object = (void *)0x8000000100014800;
  v10._countAndFlagsBits = 0xD00000000000001ELL;
  sub_100011650(v10);
  swift_getKeyPath();
  sub_100009214();
  sub_1000115B0();
  swift_release();
  sub_100011640();
  swift_release();
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  sub_100011650(v11);
  sub_100011670();
  uint64_t v5 = sub_1000115D0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005FE4(&qword_10001C650);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1000125E0;
  *(void *)(v6 + 32) = v5;
  uint64_t v7 = sub_1000115C0();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_10000B368(uint64_t a1)
{
  return sub_10000B3B0(a1, (uint64_t)&unk_100013148, (void (*)(void))sub_100009214, (void (*)(uint64_t))sub_100006AD0);
}

uint64_t sub_10000B3B0(uint64_t a1, uint64_t a2, void (*a3)(void), void (*a4)(uint64_t))
{
  uint64_t v6 = sub_100011630();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  a3();
  sub_1000115B0();
  uint64_t v10 = swift_release();
  a4(v10);
  sub_100011620();
  uint64_t v11 = sub_100011610();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_100005FE4(&qword_10001C630);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1000125E0;
  *(void *)(v12 + 32) = v11;
  uint64_t v13 = sub_100011600();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_10000B528()
{
  uint64_t v0 = sub_1000115F0();
  uint64_t v1 = sub_1000115F0();
  uint64_t v2 = sub_1000115F0();
  sub_100005FE4(&qword_10001C638);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1000125F0;
  *(void *)(v3 + 32) = v0;
  *(void *)(v3 + 40) = v1;
  *(void *)(v3 + 48) = v2;
  uint64_t v4 = sub_1000115E0();
  swift_bridgeObjectRelease();
  return v4;
}

void sub_10000B5EC()
{
  qword_10001CAF0 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_10000B608()
{
  if (qword_10001C100 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_10001CAF0;

  return _swift_bridgeObjectRetain(v0);
}

ValueMetadata *type metadata accessor for AirDropSettingsIntents()
{
  return &type metadata for AirDropSettingsIntents;
}

uint64_t sub_10000B674()
{
  uint64_t v0 = sub_1000116A0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100010A84();
  uint64_t v15 = v4;
  sub_10000B8CC();
  sub_1000116B0();
  uint64_t v5 = sub_100011690();
  uint64_t v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  uint64_t v14 = sub_100005BA4();
  uint64_t v15 = v7;
  sub_100002674();
  sub_1000116B0();
  uint64_t v8 = sub_100011690();
  v6(v3, v0);
  uint64_t v14 = sub_10000A118();
  uint64_t v15 = v9;
  sub_100006AD0();
  sub_1000116B0();
  uint64_t v10 = sub_100011690();
  v6(v3, v0);
  sub_100005FE4(&qword_10001C628);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1000125F0;
  *(void *)(v11 + 32) = v5;
  *(void *)(v11 + 40) = v8;
  *(void *)(v11 + 48) = v10;
  uint64_t v12 = sub_100011680();
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t sub_10000B8CC()
{
  unint64_t result = qword_10001C620;
  if (!qword_10001C620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C620);
  }
  return result;
}

uint64_t sub_10000B920@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100011560();
  *a1 = v3;
  return result;
}

uint64_t sub_10000B95C()
{
  return sub_100011570();
}

unint64_t sub_10000B99C()
{
  unint64_t result = qword_10001C658;
  if (!qword_10001C658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C658);
  }
  return result;
}

uint64_t sub_10000B9F4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100011560();
  *a1 = v3;
  return result;
}

uint64_t sub_10000BA34()
{
  return sub_100011570();
}

uint64_t sub_10000BA6C()
{
  uint64_t v0 = sub_100005FE4(&qword_10001C698);

  return TupleWidget.init(_:)(v0, v0);
}

void __swiftcall DELETE_ME_AFTER_123714910.init()()
{
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000BB68()
{
  unint64_t result = qword_10001C690;
  if (!qword_10001C690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C690);
  }
  return result;
}

ValueMetadata *type metadata accessor for DELETE_ME_AFTER_123714910()
{
  return &type metadata for DELETE_ME_AFTER_123714910;
}

ValueMetadata *type metadata accessor for AirDropSettingsIntentsBundle()
{
  return &type metadata for AirDropSettingsIntentsBundle;
}

uint64_t sub_10000BBDC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000BBFC()
{
  unint64_t result = qword_10001C6A0;
  if (!qword_10001C6A0)
  {
    sub_100002704(&qword_10001C6A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6A0);
  }
  return result;
}

unint64_t sub_10000BC5C()
{
  unint64_t result = qword_10001C6B0;
  if (!qword_10001C6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6B0);
  }
  return result;
}

unint64_t sub_10000BCB4()
{
  unint64_t result = qword_10001C6B8;
  if (!qword_10001C6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6B8);
  }
  return result;
}

uint64_t sub_10000BD08(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x73746361746E6F63;
    }
    else {
      uint64_t v3 = 0x656E6F7972657665;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xEC000000796C6E4FLL;
    }
    else {
      unint64_t v4 = 0xE800000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x73746361746E6F63;
      }
      else {
        uint64_t v6 = 0x656E6F7972657665;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xEC000000796C6E4FLL;
      }
      else {
        unint64_t v7 = 0xE800000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE300000000000000;
    uint64_t v3 = 6710895;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE300000000000000;
  if (v3 != 6710895)
  {
LABEL_21:
    char v8 = sub_100011AF0();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_10000BE24(uint64_t a1)
{
  uint64_t v2 = sub_100005FE4(&qword_10001C590);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  int v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    unint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005FE4(&qword_10001C7B0);
  uint64_t v6 = sub_100011AD0();
  unint64_t v7 = (void *)v6;
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
    sub_10000DE1C(v12, (uint64_t)v5, &qword_10001C590);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_10000D738(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100011790();
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

unint64_t sub_10000C01C(uint64_t a1)
{
  uint64_t v2 = sub_100005FE4(&qword_10001C760);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8);
  int v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    unint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005FE4(&qword_10001C768);
  uint64_t v6 = sub_100011AD0();
  unint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = v6 + 64;
  unint64_t v10 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v21[1] = a1;
  uint64_t v11 = a1 + v10;
  uint64_t v12 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_10000DE1C(v11, (uint64_t)v5, &qword_10001C760);
    unint64_t result = sub_10000D9D0();
    if (v14) {
      break;
    }
    unint64_t v15 = result;
    *(void *)(v9 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v16 = v7[7];
    uint64_t v17 = sub_100011790();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v16 + *(void *)(*(void *)(v17 - 8) + 72) * v15, v5, v17);
    uint64_t v18 = v7[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (v19) {
      goto LABEL_11;
    }
    v7[2] = v20;
    v11 += v12;
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

unint64_t sub_10000C1F8(uint64_t a1)
{
  uint64_t v2 = sub_100005FE4(&qword_10001C788);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8);
  int v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    unint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005FE4(&qword_10001C790);
  uint64_t v6 = sub_100011AD0();
  unint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = v6 + 64;
  unint64_t v10 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v21[1] = a1;
  uint64_t v11 = a1 + v10;
  uint64_t v12 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_10000DE1C(v11, (uint64_t)v5, &qword_10001C788);
    unint64_t result = sub_10000D9D0();
    if (v14) {
      break;
    }
    unint64_t v15 = result;
    *(void *)(v9 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v16 = v7[7];
    uint64_t v17 = sub_100005FE4(&qword_10001C798);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v16 + *(void *)(*(void *)(v17 - 8) + 72) * v15, v5, v17);
    uint64_t v18 = v7[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (v19) {
      goto LABEL_11;
    }
    v7[2] = v20;
    v11 += v12;
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

uint64_t sub_10000C3D8()
{
  uint64_t v0 = sub_100011910();
  sub_100006060(v0, qword_10001CAF8);
  sub_100006028(v0, (uint64_t)qword_10001CAF8);
  return sub_100011900();
}

uint64_t sub_10000C43C()
{
  return sub_100011560();
}

uint64_t sub_10000C460()
{
  return sub_100011570();
}

void (*sub_10000C484(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100011550();
  return sub_100003804;
}

unint64_t sub_10000C4E4()
{
  unint64_t result = qword_10001C6C0;
  if (!qword_10001C6C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6C0);
  }
  return result;
}

uint64_t sub_10000C538(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10000DD74();
  unint64_t v5 = sub_10000DA30();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10000C5A4()
{
  unint64_t result = qword_10001C6C8;
  if (!qword_10001C6C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6C8);
  }
  return result;
}

unint64_t sub_10000C5FC()
{
  unint64_t result = qword_10001C6D0;
  if (!qword_10001C6D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6D0);
  }
  return result;
}

uint64_t sub_10000C650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000D34C(a1, a2, a3, (void (*)(void))sub_10000C4E4);
}

uint64_t sub_10000C67C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D27C(&qword_10001C108, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001CAF8, a1);
}

uint64_t sub_10000C6B4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000DD74();
  unint64_t v7 = sub_10000DDC8();
  unint64_t v8 = sub_10000DA30();
  *unint64_t v5 = v2;
  v5[1] = sub_100002504;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_10000C788@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000DA84();
  *a1 = result;
  return result;
}

uint64_t sub_10000C7B0(uint64_t a1)
{
  unint64_t v2 = sub_10000C4E4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_10000C7EC()
{
  uint64_t v0 = sub_1000118B0();
  sub_100006060(v0, qword_10001CB10);
  sub_100006028(v0, (uint64_t)qword_10001CB10);
  return sub_1000118A0();
}

unint64_t sub_10000C850()
{
  uint64_t v0 = sub_100005FE4(&qword_10001C2D8);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005FE4(&qword_10001C2C0);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100011910();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  sub_100005FE4(&qword_10001C758);
  sub_100005FE4(&qword_10001C760);
  uint64_t v9 = swift_allocObject();
  long long v12 = xmmword_1000125E0;
  *(_OWORD *)(v9 + 16) = xmmword_1000125E0;
  sub_100011900();
  sub_100011900();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_100011750();
  uint64_t v10 = sub_100011760();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v2, 0, 1, v10);
  sub_100005FE4(&qword_10001C2E0);
  *(_OWORD *)(swift_allocObject() + 16) = v12;
  sub_100011900();
  sub_100011900();
  sub_100011770();
  unint64_t result = sub_10000C01C(v9);
  qword_10001CB28 = result;
  return result;
}

uint64_t sub_10000CBA8()
{
  uint64_t v0 = sub_100005FE4(&qword_10001C778);
  sub_100006060(v0, qword_10001CB30);
  sub_100006028(v0, (uint64_t)qword_10001CB30);
  sub_100005FE4(&qword_10001C780);
  sub_100005FE4(&qword_10001C788);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1000125E0;
  sub_10000CE48();
  sub_1000117E0();
  sub_10000C1F8(v1);
  return sub_1000117F0();
}

unint64_t sub_10000CCE4()
{
  unint64_t result = qword_10001C6E0;
  if (!qword_10001C6E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6E0);
  }
  return result;
}

Swift::Int sub_10000CD38()
{
  return sub_100011B10();
}

uint64_t sub_10000CD84()
{
  return sub_100011AA0();
}

Swift::Int sub_10000CD94()
{
  return sub_100011B10();
}

uint64_t sub_10000CDDC@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100018E88;
  v7._object = v3;
  Swift::Int v5 = sub_100011AE0(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_10000CE30(void *a1@<X8>)
{
  *a1 = 1953460082;
  a1[1] = 0xE400000000000000;
}

unint64_t sub_10000CE48()
{
  unint64_t result = qword_10001C6E8;
  if (!qword_10001C6E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6E8);
  }
  return result;
}

unint64_t sub_10000CEA0()
{
  unint64_t result = qword_10001C6F0;
  if (!qword_10001C6F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6F0);
  }
  return result;
}

uint64_t sub_10000CEF4@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001C120 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005FE4(&qword_10001C778);
  uint64_t v3 = sub_100006028(v2, (uint64_t)qword_10001CB30);
  Swift::OpaquePointer v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_10000CFA4()
{
  unint64_t result = qword_10001C6F8;
  if (!qword_10001C6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6F8);
  }
  return result;
}

unint64_t sub_10000CFFC()
{
  unint64_t result = qword_10001C700;
  if (!qword_10001C700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C700);
  }
  return result;
}

uint64_t sub_10000D050()
{
  sub_10000DA30();
  uint64_t v2 = sub_1000117B0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006118(v3, v0, v2, v1);
}

unint64_t sub_10000D0E8()
{
  unint64_t result = qword_10001C710;
  if (!qword_10001C710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C710);
  }
  return result;
}

unint64_t sub_10000D140()
{
  unint64_t result = qword_10001C718;
  if (!qword_10001C718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C718);
  }
  return result;
}

unint64_t sub_10000D198()
{
  unint64_t result = qword_10001C720;
  if (!qword_10001C720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C720);
  }
  return result;
}

unint64_t sub_10000D1F0()
{
  unint64_t result = qword_10001C728;
  if (!qword_10001C728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C728);
  }
  return result;
}

uint64_t sub_10000D244@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D27C(&qword_10001C110, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10001CB10, a1);
}

uint64_t sub_10000D27C@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100006028(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_10000D320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000D34C(a1, a2, a3, (void (*)(void))sub_10000CE48);
}

uint64_t sub_10000D34C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000D394(uint64_t a1)
{
  unint64_t v2 = sub_10000CE48();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000D3E4()
{
  unint64_t result = qword_10001C730;
  if (!qword_10001C730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C730);
  }
  return result;
}

unint64_t sub_10000D43C()
{
  unint64_t result = qword_10001C738;
  if (!qword_10001C738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C738);
  }
  return result;
}

unint64_t sub_10000D494()
{
  unint64_t result = qword_10001C740;
  if (!qword_10001C740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C740);
  }
  return result;
}

uint64_t sub_10000D4E8()
{
  if (qword_10001C118 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_10001CB28;

  return _swift_bridgeObjectRetain(v0);
}

uint64_t sub_10000D544(uint64_t a1)
{
  unint64_t v2 = sub_10000D1F0();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000D594()
{
  unint64_t result = qword_10001C748;
  if (!qword_10001C748)
  {
    sub_100002704(&qword_10001C750);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C748);
  }
  return result;
}

void sub_10000D5F0(void *a1@<X8>)
{
  *a1 = &off_100018EC0;
}

uint64_t getEnumTagSinglePayload for AirDropSettingsStaticLinks(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AirDropSettingsStaticLinks(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10000D6F0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AirDropSettingsStaticLinks()
{
  return &type metadata for AirDropSettingsStaticLinks;
}

ValueMetadata *type metadata accessor for OpenAirDropSettingsStaticLinks()
{
  return &type metadata for OpenAirDropSettingsStaticLinks;
}

unint64_t sub_10000D738(unsigned __int8 a1)
{
  sub_100011B00();
  sub_100011AA0();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_100011B10();

  return sub_10000D800(a1, v2);
}

unint64_t sub_10000D800(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    while (1)
    {
      if (*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        if (*(unsigned char *)(*(void *)(v2 + 48) + v4) == 1)
        {
          uint64_t v7 = 0x73746361746E6F63;
          unint64_t v8 = 0xEC000000796C6E4FLL;
          int v9 = a1;
          if (!a1) {
            goto LABEL_17;
          }
        }
        else
        {
          unint64_t v8 = 0xE800000000000000;
          uint64_t v7 = 0x656E6F7972657665;
          int v9 = a1;
          if (!a1)
          {
LABEL_17:
            unint64_t v11 = 0xE300000000000000;
            if (v7 != 6710895) {
              goto LABEL_19;
            }
            goto LABEL_18;
          }
        }
      }
      else
      {
        unint64_t v8 = 0xE300000000000000;
        uint64_t v7 = 6710895;
        int v9 = a1;
        if (!a1) {
          goto LABEL_17;
        }
      }
      if (v9 == 1) {
        uint64_t v10 = 0x73746361746E6F63;
      }
      else {
        uint64_t v10 = 0x656E6F7972657665;
      }
      if (v9 == 1) {
        unint64_t v11 = 0xEC000000796C6E4FLL;
      }
      else {
        unint64_t v11 = 0xE800000000000000;
      }
      if (v7 != v10) {
        goto LABEL_19;
      }
LABEL_18:
      if (v8 == v11)
      {
        swift_bridgeObjectRelease_n();
        return v4;
      }
LABEL_19:
      char v12 = sub_100011AF0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v6;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
  }
  return v4;
}

uint64_t sub_10000D9A4(uint64_t a1)
{
  return a1 & ~(-1 << *(unsigned char *)(v1 + 32));
}

uint64_t sub_10000D9D0()
{
  sub_100011B00();
  sub_100011AA0();
  Swift::Int v0 = sub_100011B10();

  return sub_10000D9A4(v0);
}

unint64_t sub_10000DA30()
{
  unint64_t result = qword_10001C770;
  if (!qword_10001C770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C770);
  }
  return result;
}

uint64_t sub_10000DA84()
{
  uint64_t v17 = sub_100011800();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005FE4(&qword_10001C2B8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_100005FE4(&qword_10001C2C0);
  __chkstk_darwin(v9 - 8);
  unint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100011910();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100005FE4(&qword_10001C7B8);
  sub_100011900();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 1;
  uint64_t v14 = sub_100011520();
  unint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_10000CE48();
  return sub_100011580();
}

unint64_t sub_10000DD74()
{
  unint64_t result = qword_10001C7A0;
  if (!qword_10001C7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C7A0);
  }
  return result;
}

unint64_t sub_10000DDC8()
{
  unint64_t result = qword_10001C7A8;
  if (!qword_10001C7A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C7A8);
  }
  return result;
}

uint64_t sub_10000DE1C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005FE4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_10000DE84()
{
  unint64_t result = qword_10001C7C0;
  if (!qword_10001C7C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C7C0);
  }
  return result;
}

unint64_t sub_10000DEDC()
{
  unint64_t result = qword_10001C7C8;
  if (!qword_10001C7C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C7C8);
  }
  return result;
}

uint64_t sub_10000DF30(uint64_t a1)
{
  return sub_100002AF0(a1, qword_10001CB48);
}

unint64_t sub_10000DF58()
{
  unint64_t result = qword_10001C7D0;
  if (!qword_10001C7D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C7D0);
  }
  return result;
}

uint64_t sub_10000DFAC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000111B4();
  unint64_t v5 = sub_1000102E8();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10000E018()
{
  unint64_t result = qword_10001C7D8;
  if (!qword_10001C7D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C7D8);
  }
  return result;
}

unint64_t sub_10000E070()
{
  unint64_t result = qword_10001C7E0;
  if (!qword_10001C7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C7E0);
  }
  return result;
}

uint64_t sub_10000E0C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000F244(a1, a2, a3, (void (*)(void))sub_10000DF58);
}

uint64_t sub_10000E0DC@<X0>(uint64_t a1@<X8>)
{
  return sub_100004B4C(&qword_10001C128, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001CB48, a1);
}

uint64_t sub_10000E114(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000111B4();
  unint64_t v7 = sub_100011208();
  unint64_t v8 = sub_1000102E8();
  *unint64_t v5 = v2;
  v5[1] = sub_100002504;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_10000E1E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100010ED0();
  *a1 = result;
  return result;
}

uint64_t sub_10000E210(uint64_t a1)
{
  unint64_t v2 = sub_10000DF58();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_10000E250()
{
  return sub_100006564(&qword_10001C7F0, &qword_10001C7F8);
}

uint64_t sub_10000E28C()
{
  uint64_t v0 = sub_1000118B0();
  sub_100006060(v0, qword_10001CB60);
  sub_100006028(v0, (uint64_t)qword_10001CB60);
  return sub_1000118A0();
}

id sub_10000E2F0()
{
  uint64_t v0 = sub_100005FE4(&qword_10001C2D8);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005FE4(&qword_10001C2C0);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100011910();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  sub_100011900();
  sub_100011900();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_100011750();
  uint64_t v9 = sub_100011760();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v2, 0, 1, v9);
  sub_100005FE4(&qword_10001C2E0);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000125E0;
  sub_100011900();
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    unint64_t v11 = result;
    MobileGestalt_get_wapiCapability();

    sub_100011900();
    return (id)sub_100011770();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000E5EC(uint64_t a1)
{
  return sub_100002AF0(a1, qword_10001CB78);
}

uint64_t sub_10000E610()
{
  uint64_t v0 = sub_100005FE4(&qword_10001C358);
  sub_100006060(v0, qword_10001CB90);
  uint64_t v1 = sub_100006028(v0, (uint64_t)qword_10001CB90);
  sub_1000116C0();
  uint64_t v2 = sub_1000116D0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10000E6C8()
{
  uint64_t result = swift_getKeyPath();
  qword_10001CBA8 = result;
  return result;
}

uint64_t sub_10000E6F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100005FE4(&qword_10001C328);
  v3[9] = swift_task_alloc();
  sub_100005FE4(&qword_10001C330);
  v3[10] = swift_task_alloc();
  sub_100005FE4(&qword_10001C940);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_100011520();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100005FE4(&qword_10001C948);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_10000E8B4, 0, 0);
}

uint64_t sub_10000E8B4()
{
  sub_100011560();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_10000F99C();
  void *v1 = v0;
  v1[1] = sub_10000E988;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_10000EF80, 0, &type metadata for AirDropUseCellularDataEntity, v2);
}

uint64_t sub_10000E988()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10000EA84, 0, 0);
}

uint64_t sub_10000EA84()
{
  sub_100011560();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_100011560();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_10001C148 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10001CBA8;
  *(void *)(v0 + 168) = qword_10001CBA8;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_100006564(&qword_10001C920, &qword_10001C928);
  *uint64_t v3 = v0;
  v3[1] = sub_10000EBDC;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_10000EBDC()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100003504;
  }
  else {
    uint64_t v2 = sub_10000ED30;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000ED30()
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
  sub_100011560();
  uint64_t v7 = sub_100011890();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_1000118C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_10000B8CC();
  sub_10000FBB0();
  sub_1000114F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_100011510();
  sub_100011530();
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

uint64_t sub_10000EF84()
{
  uint64_t v0 = sub_100005FE4(&qword_10001C950);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001C148 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100011740();
  swift_release();
  sub_10000FBB0();
  sub_100006564(&qword_10001C958, &qword_10001C950);
  sub_100011730();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10000F0EC()
{
  if (qword_10001C148 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10000F14C()
{
  unint64_t result = qword_10001C800;
  if (!qword_10001C800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C800);
  }
  return result;
}

unint64_t sub_10000F1A4()
{
  unint64_t result = qword_10001C808;
  if (!qword_10001C808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C808);
  }
  return result;
}

uint64_t sub_10000F1F8()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10000F22C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000F244(a1, a2, a3, (void (*)(void))sub_10000B8CC);
}

uint64_t sub_10000F244(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000F298@<X0>(uint64_t a1@<X8>)
{
  return sub_100004B4C(&qword_10001C138, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001CB78, a1);
}

uint64_t sub_10000F2D0@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001C140 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005FE4(&qword_10001C358);
  uint64_t v3 = sub_100006028(v2, (uint64_t)qword_10001CB90);

  return sub_1000063BC(v3, a1);
}

uint64_t sub_10000F34C(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000066E8;
  return sub_10000E6F0(a1, v5, v4);
}

uint64_t sub_10000F3F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100010A84();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10000F420()
{
  return 0xD00000000000002DLL;
}

unint64_t sub_10000F440()
{
  unint64_t result = qword_10001C818;
  if (!qword_10001C818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C818);
  }
  return result;
}

unint64_t sub_10000F498()
{
  unint64_t result = qword_10001C820;
  if (!qword_10001C820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C820);
  }
  return result;
}

uint64_t sub_10000F4EC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000F50C, 0, 0);
}

uint64_t sub_10000F50C()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  sub_1000119A0();
  uint64_t v2 = (void *)sub_100011990();
  char v3 = sub_100011940();

  unsigned char *v1 = v3 & 1;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10000F59C(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_10000F5C0, 0, 0);
}

uint64_t sub_10000F5C0()
{
  sub_1000119A0();
  uint64_t v1 = (void *)sub_100011990();
  sub_100011950();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000F640(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_100011910();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_10000F6D0, 0, 0);
}

uint64_t sub_10000F6D0()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100005FE4(&qword_10001C7F8);
  sub_100011900();
  sub_100006564(&qword_10001C920, &qword_10001C928);
  uint64_t *v1 = sub_1000118F0();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_10000F7E4()
{
  unint64_t result = qword_10001C830;
  if (!qword_10001C830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C830);
  }
  return result;
}

uint64_t sub_10000F838(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000FDE4();
  *uint64_t v4 = v2;
  v4[1] = sub_100003F54;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10000F8EC()
{
  unint64_t result = qword_10001C840;
  if (!qword_10001C840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C840);
  }
  return result;
}

unint64_t sub_10000F944()
{
  unint64_t result = qword_10001C848;
  if (!qword_10001C848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C848);
  }
  return result;
}

unint64_t sub_10000F99C()
{
  unint64_t result = qword_10001C850[0];
  if (!qword_10001C850[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10001C850);
  }
  return result;
}

uint64_t sub_10000F9F0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000FDE4();
  *unint64_t v5 = v2;
  v5[1] = sub_100004228;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10000FAA4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000FDE4();
  *uint64_t v4 = v2;
  v4[1] = sub_1000066E4;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10000FB58()
{
  unint64_t result = qword_10001C868;
  if (!qword_10001C868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C868);
  }
  return result;
}

unint64_t sub_10000FBB0()
{
  unint64_t result = qword_10001C870;
  if (!qword_10001C870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C870);
  }
  return result;
}

unint64_t sub_10000FC08()
{
  unint64_t result = qword_10001C878;
  if (!qword_10001C878)
  {
    sub_100002704(qword_10001C880);
    sub_10000FBB0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C878);
  }
  return result;
}

uint64_t sub_10000FC7C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000F7E4();
  *unint64_t v5 = v2;
  v5[1] = sub_1000045B4;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_10000FD34()
{
  unint64_t result = qword_10001C898;
  if (!qword_10001C898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C898);
  }
  return result;
}

unint64_t sub_10000FD8C()
{
  unint64_t result = qword_10001C8A0;
  if (!qword_10001C8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C8A0);
  }
  return result;
}

unint64_t sub_10000FDE4()
{
  unint64_t result = qword_10001C8A8;
  if (!qword_10001C8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C8A8);
  }
  return result;
}

unint64_t sub_10000FE3C()
{
  unint64_t result = qword_10001C8B0;
  if (!qword_10001C8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C8B0);
  }
  return result;
}

uint64_t sub_10000FE90(uint64_t a1)
{
  unint64_t v2 = sub_10000F99C();

  return _EntityURLRepresentation.init(stringLiteral:)(0xD000000000000057, 0x8000000100014C30, a1, v2);
}

unint64_t sub_10000FEF0()
{
  unint64_t result = qword_10001C8B8;
  if (!qword_10001C8B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C8B8);
  }
  return result;
}

unint64_t sub_10000FF48()
{
  unint64_t result = qword_10001C8C0;
  if (!qword_10001C8C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C8C0);
  }
  return result;
}

unint64_t sub_10000FFA0()
{
  unint64_t result = qword_10001C8C8;
  if (!qword_10001C8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C8C8);
  }
  return result;
}

uint64_t sub_10000FFF4@<X0>(uint64_t *a1@<X8>)
{
  sub_10000F498();
  uint64_t result = sub_100011540();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100010034()
{
  sub_1000102E8();
  uint64_t v2 = sub_100011810();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006118(v3, v0, v2, v1);
}

uint64_t sub_1000100C8@<X0>(uint64_t a1@<X8>)
{
  return sub_100004B4C(&qword_10001C130, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10001CB60, a1);
}

uint64_t sub_100010100()
{
  return sub_100006564(&qword_10001C8D8, &qword_10001C8E0);
}

uint64_t sub_10001013C(uint64_t a1)
{
  unint64_t v2 = sub_10000F99C();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001018C()
{
  unint64_t result = qword_10001C8E8;
  if (!qword_10001C8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C8E8);
  }
  return result;
}

uint64_t sub_1000101E4(uint64_t a1)
{
  unint64_t v2 = sub_10000FFA0();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for AirDropUseCellularDataEntity.AirDropUseCellularDataEntityQuery()
{
  return &type metadata for AirDropUseCellularDataEntity.AirDropUseCellularDataEntityQuery;
}

ValueMetadata *type metadata accessor for AirDropUseCellularDataEntity.UpdateIntent_value()
{
  return &type metadata for AirDropUseCellularDataEntity.UpdateIntent_value;
}

ValueMetadata *type metadata accessor for AirDropUseCellularDataEntity()
{
  return &type metadata for AirDropUseCellularDataEntity;
}

ValueMetadata *type metadata accessor for OpenAirDropUseCellularDataEntity()
{
  return &type metadata for OpenAirDropUseCellularDataEntity;
}

uint64_t sub_100010270()
{
  return sub_100006564(&qword_10001C8F0, &qword_10001C8F8);
}

uint64_t sub_1000102AC()
{
  return sub_100006564(&qword_10001C900, &qword_10001C8F8);
}

unint64_t sub_1000102E8()
{
  unint64_t result = qword_10001C908;
  if (!qword_10001C908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C908);
  }
  return result;
}

id sub_10001033C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v1 = sub_100005FE4(&qword_10001C370);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_100005FE4(&qword_10001C378);
  uint64_t v27 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  unint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100005FE4(&qword_10001C380);
  uint64_t v28 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_100005FE4(&qword_10001C388);
  uint64_t v30 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v26 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100005FE4(&qword_10001C390);
  sub_100005FE4(&qword_10001C398);
  sub_10000F498();
  sub_100006564(&qword_10001C3A0, &qword_10001C390);
  sub_1000064F8();
  sub_100011A80();
  sub_1000119D0();
  uint64_t v10 = sub_100006564(&qword_10001C3B0, &qword_10001C370);
  sub_100011A00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    uint64_t v12 = result;
    MobileGestalt_get_wapiCapability();

    sub_1000119D0();
    if (qword_10001C150 != -1) {
      swift_once();
    }
    id v13 = (id)qword_10001CBB0;
    uint64_t v14 = sub_100011A30();
    uint64_t v16 = v15;
    char v18 = v17 & 1;
    uint64_t v34 = v1;
    uint64_t v35 = v10;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v20 = v29;
    sub_1000119E0();
    sub_1000065A8(v14, v16, v18);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v20);
    uint64_t v34 = v20;
    uint64_t v35 = OpaqueTypeConformance2;
    uint64_t v21 = swift_getOpaqueTypeConformance2();
    uint64_t v22 = v26;
    uint64_t v23 = v31;
    sub_100011A10();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v23);
    uint64_t v34 = v23;
    uint64_t v35 = v21;
    swift_getOpaqueTypeConformance2();
    uint64_t v24 = v32;
    sub_1000119F0();
    return (id)(*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v22, v24);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001094C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100005FE4(&qword_10001C390);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000119D0();
  sub_100011A40();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v5, v2);
}

uint64_t sub_100010A84()
{
  uint64_t v0 = sub_100005FE4(&qword_10001C2B0);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100011800();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005FE4(&qword_10001C2B8);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100005FE4(&qword_10001C2C0);
  __chkstk_darwin(v11 - 8);
  id v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_100011910();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100005FE4(&qword_10001C930);
  sub_100011900();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_100011520();
  char v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  char v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_10000F99C();
  BOOL v19 = v23;
  uint64_t v24 = sub_100011590();
  sub_100005FE4(&qword_10001C2D0);
  sub_100011900();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100011AB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_1000115A0();
  return v24;
}

uint64_t sub_100010EC4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_100010ED0()
{
  v17[0] = sub_100011800();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  uint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005FE4(&qword_10001C2B8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_100005FE4(&qword_10001C2C0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100011910();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100005FE4(&qword_10001C930);
  sub_100011900();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v17[1] = 0;
  uint64_t v14 = sub_100011520();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_10000F99C();
  return sub_100011590();
}

unint64_t sub_1000111B4()
{
  unint64_t result = qword_10001C960;
  if (!qword_10001C960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C960);
  }
  return result;
}

unint64_t sub_100011208()
{
  unint64_t result = qword_10001C968;
  if (!qword_10001C968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C968);
  }
  return result;
}

ValueMetadata *type metadata accessor for AirDropUseCellularDataToggleControl()
{
  return &type metadata for AirDropUseCellularDataToggleControl;
}

uint64_t sub_10001126C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100011288()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000113B4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for FindAirDropSettingsIntentsClass()
{
  return self;
}

id sub_1000113E8()
{
  type metadata accessor for FindAirDropSettingsIntentsClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_10001CBB0 = (uint64_t)result;
  return result;
}

uint64_t sub_100011440()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100011450()
{
  return type metadata accessor for _PrebuiltAppIntentError();
}

uint64_t sub_100011490()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_1000114A0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_1000114B0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000114C0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000114F0()
{
  return IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)();
}

uint64_t sub_100011510()
{
  return IntentDialog.init<A, B>(from:capturedContent:)();
}

uint64_t sub_100011520()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100011530()
{
  return static IntentResult.result<A>(value:dialog:)();
}

uint64_t sub_100011540()
{
  return _UniqueEntity.id.getter();
}

uint64_t sub_100011550()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100011560()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100011570()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100011580()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100011590()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000115A0()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000115B0()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_1000115C0()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_1000115D0()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_1000115E0()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_1000115F0()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_100011600()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_100011610()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_100011620()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_100011630()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_100011640()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_100011650(Swift::String a1)
{
}

uint64_t sub_100011660()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100011670()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t sub_100011680()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_100011690()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_1000116A0()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_1000116B0()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_1000116C0()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_1000116D0()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_100011710()
{
  return static _UnrecoverableError.unsupportedOnDevice.getter();
}

uint64_t sub_100011720()
{
  return static _UnrecoverableError.featureCurrentlyRestricted.getter();
}

uint64_t sub_100011730()
{
  return static _DialogBuilderEntity.buildBlock<A>(_:)();
}

uint64_t sub_100011740()
{
  return static _DialogBuilderEntity.buildExpression<A, B>(_:)();
}

uint64_t sub_100011750()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100011760()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100011770()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100011780()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_100011790()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_1000117A0()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_1000117B0()
{
  return _URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_1000117D0()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_1000117E0()
{
  return _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_1000117F0()
{
  return _EnumURLRepresentation.init(_:)();
}

uint64_t sub_100011800()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100011810()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_100011870()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100011890()
{
  return type metadata accessor for _GeneratedContentOptions();
}

uint64_t sub_1000118A0()
{
  return TypeDisplayRepresentation.init(stringLiteral:)();
}

uint64_t sub_1000118B0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_1000118C0()
{
  return type metadata accessor for _GeneratedContentFallback();
}

uint64_t sub_1000118E0()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_1000118F0()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_100011900()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100011910()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100011920()
{
  return AirDropSettingsState.discoverableMode.getter();
}

uint64_t sub_100011930()
{
  return AirDropSettingsState.discoverableMode.setter();
}

uint64_t sub_100011940()
{
  return AirDropSettingsState.isCellularUsageEnabled.getter();
}

uint64_t sub_100011950()
{
  return AirDropSettingsState.isCellularUsageEnabled.setter();
}

uint64_t sub_100011960()
{
  return AirDropSettingsState.isNearbySharingEnabled.getter();
}

uint64_t sub_100011970()
{
  return AirDropSettingsState.isNearbySharingEnabled.setter();
}

uint64_t sub_100011980()
{
  return AirDropSettingsState.isNearbySharingSupported.getter();
}

uint64_t sub_100011990()
{
  return static AirDropSettingsState.shared.getter();
}

uint64_t sub_1000119A0()
{
  return type metadata accessor for AirDropSettingsState();
}

uint64_t sub_1000119C0()
{
  return static WidgetBundle.main()();
}

uint64_t sub_1000119D0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_1000119E0()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_1000119F0()
{
  return WidgetConfiguration.hiddenControl()();
}

uint64_t sub_100011A00()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_100011A10()
{
  return WidgetConfiguration.disablesControlStateCaching()();
}

uint64_t sub_100011A20()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_100011A30()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_100011A40()
{
  return Label<>.init(_:systemImage:)();
}

uint64_t sub_100011A50()
{
  return static ControlSize._1x1.getter();
}

uint64_t sub_100011A60()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_100011A70()
{
  return ControlPicker.init<A, B, C, D, E, F, G, H>(kind:displayName:preferredSize:intentUpdatableProperty:title:subtitle:value:affordances:)();
}

uint64_t sub_100011A80()
{
  return ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)();
}

uint64_t sub_100011A90()
{
  return ControlAffordances.init(tint:status:actionHint:)();
}

uint64_t sub_100011AA0()
{
  return String.hash(into:)();
}

uint64_t sub_100011AB0()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_100011AC0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100011AD0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100011AE0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100011AF0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100011B00()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100011B10()
{
  return Hasher._finalize()();
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return _MobileGestalt_get_wapiCapability();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}