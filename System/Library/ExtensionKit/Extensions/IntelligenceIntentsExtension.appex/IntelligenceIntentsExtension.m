uint64_t sub_1000039EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t OpaqueTypeConformance2;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v30 = a1;
  v1 = sub_100004148(&qword_1000343E8);
  v23 = *(void *)(v1 - 8);
  __chkstk_darwin();
  v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004148(&qword_1000343F0);
  v5 = *(void *)(v4 - 8);
  v24 = v4;
  v25 = v5;
  __chkstk_darwin();
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100004148(&qword_1000343F8);
  v9 = *(void *)(v8 - 8);
  v26 = v8;
  v27 = v9;
  __chkstk_darwin();
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100004148(&qword_100034400);
  v13 = *(void *)(v12 - 8);
  v28 = v12;
  v29 = v13;
  __chkstk_darwin();
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100004148(&qword_100034408);
  sub_100004190();
  sub_1000041E4();
  sub_100023518();
  sub_100023498();
  v16 = sub_1000042F0(&qword_100034440, &qword_1000343E8);
  sub_1000234C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_100023498();
  v31 = v1;
  v32 = v16;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v18 = v24;
  sub_1000234A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  v31 = v18;
  v32 = OpaqueTypeConformance2;
  v19 = swift_getOpaqueTypeConformance2();
  v20 = v26;
  sub_1000234B8();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  v31 = v20;
  v32 = v19;
  swift_getOpaqueTypeConformance2();
  v21 = v28;
  sub_1000234D8();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_100003EE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100004148(&qword_100034428);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100023498();
  sub_100023508();
  uint64_t v6 = sub_1000234F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  *(void *)(a1 + *(int *)(sub_100004148(&qword_100034408) + 36)) = v6;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100004024@<X0>(uint64_t a1@<X8>)
{
  sub_100023498();
  uint64_t result = sub_1000234E8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100004094@<X0>(uint64_t a1@<X8>)
{
  sub_100023498();
  uint64_t result = sub_1000234E8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

ValueMetadata *type metadata accessor for BusinessConnectCallingToggleControl()
{
  return &type metadata for BusinessConnectCallingToggleControl;
}

uint64_t sub_10000412C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004148(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100004190()
{
  unint64_t result = qword_100034410;
  if (!qword_100034410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034410);
  }
  return result;
}

unint64_t sub_1000041E4()
{
  unint64_t result = qword_100034418;
  if (!qword_100034418)
  {
    sub_1000042A8(&qword_100034408);
    sub_1000042F0(&qword_100034420, &qword_100034428);
    sub_1000042F0(&qword_100034430, &qword_100034438);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034418);
  }
  return result;
}

uint64_t sub_1000042A8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000042F0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000042A8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100004334()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100004464()
{
  unint64_t result = qword_100034448;
  if (!qword_100034448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034448);
  }
  return result;
}

uint64_t sub_1000044B8()
{
  return sub_1000042F0(&qword_100034450, &qword_100034458);
}

uint64_t sub_1000044F4()
{
  uint64_t v0 = sub_100004148(&qword_100034580);
  sub_100006E60(v0, qword_10003CAC8);
  sub_100006E28(v0, (uint64_t)qword_10003CAC8);
  sub_100005EE8();
  return sub_100023368();
}

uint64_t sub_100004570()
{
  uint64_t v0 = sub_100004148(&qword_100034570);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100023428();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_1000233D8();
  sub_100006E60(v5, qword_10003CAE0);
  sub_100006E28(v5, (uint64_t)qword_10003CAE0);
  sub_100023418();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_1000233C8();
}

uint64_t sub_1000046DC()
{
  uint64_t v0 = sub_100023428();
  sub_100006E60(v0, qword_10003CAF8);
  sub_100006E28(v0, (uint64_t)qword_10003CAF8);
  return sub_100023418();
}

uint64_t sub_100004740()
{
  uint64_t v0 = sub_100004148(&qword_100034600);
  sub_100006E60(v0, qword_10003CB10);
  uint64_t v1 = sub_100006E28(v0, (uint64_t)qword_10003CB10);
  sub_100023248();
  uint64_t v2 = sub_100023258();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_1000047F8()
{
  uint64_t result = swift_getKeyPath();
  qword_10003CB28 = result;
  return result;
}

uint64_t sub_100004824@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_100004830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100004148(&qword_1000345D0);
  v3[9] = swift_task_alloc();
  sub_100004148(&qword_1000345D8);
  v3[10] = swift_task_alloc();
  sub_100004148(&qword_1000345E0);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_1000230A8();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100004148(&qword_1000345E8);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_1000049F4, 0, 0);
}

uint64_t sub_1000049F4()
{
  sub_1000230F8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_100005EE8();
  *uint64_t v1 = v0;
  v1[1] = sub_100004AC8;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100005184, 0, &type metadata for FTSilenceUnknownCallersToggleEntity, v2);
}

uint64_t sub_100004AC8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100004BC4, 0, 0);
}

uint64_t sub_100004BC4()
{
  sub_1000230F8();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_1000230F8();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_1000342A8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10003CB28;
  *(void *)(v0 + 168) = qword_10003CB28;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_1000042F0(&qword_100034598, &qword_1000345A0);
  *uint64_t v3 = v0;
  v3[1] = sub_100004D1C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_100004D1C()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000050C0;
  }
  else {
    uint64_t v2 = sub_100004E70;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100004E70()
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
  sub_1000230F8();
  uint64_t v7 = sub_1000233B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_1000233E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100004464();
  sub_1000061FC();
  sub_100023078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_100023098();
  sub_1000230B8();
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

uint64_t sub_1000050C0()
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

uint64_t sub_100005188()
{
  uint64_t v0 = sub_100004148(&qword_1000345F0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000342A8 != -1) {
    swift_once();
  }
  swift_retain();
  sub_1000232A8();
  swift_release();
  sub_1000061FC();
  sub_1000042F0(&qword_1000345F8, &qword_1000345F0);
  sub_100023298();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1000052F0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1000230F8();
  *a1 = v3;
  return result;
}

uint64_t sub_10000532C()
{
  return swift_release();
}

uint64_t (*sub_100005374(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1000230E8();
  return sub_1000053D0;
}

uint64_t sub_1000053D4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000230F8();
  *a1 = v3;
  return result;
}

uint64_t sub_100005410()
{
  return sub_100023108();
}

uint64_t (*sub_100005448(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1000230E8();
  return sub_1000053D0;
}

void sub_1000054A4(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_1000054F0()
{
  if (qword_1000342A8 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100005550()
{
  return 0xD000000000000015;
}

unint64_t sub_100005574()
{
  unint64_t result = qword_100034460;
  if (!qword_100034460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034460);
  }
  return result;
}

unint64_t sub_1000055CC()
{
  unint64_t result = qword_100034468;
  if (!qword_100034468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034468);
  }
  return result;
}

uint64_t sub_100005620()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100005654()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000056A4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000069BC(&qword_100034298, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003CAF8, a1);
}

uint64_t sub_1000056EC@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000342A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004148(&qword_100034600);
  uint64_t v3 = sub_100006E28(v2, (uint64_t)qword_10003CB10);

  return sub_100007378(v3, a1);
}

uint64_t sub_100005768(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000073E4;
  return sub_100004830(a1, v5, v4);
}

uint64_t sub_100005814@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006F2C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10000583C()
{
  return 0xD000000000000034;
}

unint64_t sub_10000585C()
{
  unint64_t result = qword_100034478;
  if (!qword_100034478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034478);
  }
  return result;
}

unint64_t sub_1000058B4()
{
  unint64_t result = qword_100034480;
  if (!qword_100034480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034480);
  }
  return result;
}

uint64_t sub_100005908(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100005928, 0, 0);
}

uint64_t sub_100005928()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
  unsigned __int8 v3 = [v2 isSilenceUnknownCallersEnabledForFaceTime];

  *uint64_t v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1000059C4(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_1000059E8, 0, 0);
}

uint64_t sub_1000059E8()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
  [v2 setSilenceUnknownCallersEnabledForFaceTime:v1];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100005A78(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_100023428();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100005B08, 0, 0);
}

uint64_t sub_100005B08()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100004148(&qword_100034458);
  sub_100023418();
  sub_1000042F0(&qword_100034598, &qword_1000345A0);
  *uint64_t v1 = sub_100023408();
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_100005C1C()
{
  unint64_t result = qword_100034490;
  if (!qword_100034490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034490);
  }
  return result;
}

uint64_t sub_100005C70(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100006644();
  *uint64_t v4 = v2;
  v4[1] = sub_100005D20;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_100005D20(uint64_t a1)
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

unint64_t sub_100005E38()
{
  unint64_t result = qword_1000344A0;
  if (!qword_1000344A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000344A0);
  }
  return result;
}

unint64_t sub_100005E90()
{
  unint64_t result = qword_1000344A8;
  if (!qword_1000344A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000344A8);
  }
  return result;
}

unint64_t sub_100005EE8()
{
  unint64_t result = qword_1000344B0[0];
  if (!qword_1000344B0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000344B0);
  }
  return result;
}

uint64_t sub_100005F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100006644();
  void *v5 = v2;
  v5[1] = sub_100005FF0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100005FF0(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_1000060F0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100006644();
  *uint64_t v4 = v2;
  v4[1] = sub_1000073E0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_1000061A4()
{
  unint64_t result = qword_1000344C8;
  if (!qword_1000344C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000344C8);
  }
  return result;
}

unint64_t sub_1000061FC()
{
  unint64_t result = qword_1000344D0;
  if (!qword_1000344D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000344D0);
  }
  return result;
}

unint64_t sub_100006254()
{
  unint64_t result = qword_1000344D8;
  if (!qword_1000344D8)
  {
    sub_1000042A8(qword_1000344E0);
    sub_1000061FC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000344D8);
  }
  return result;
}

uint64_t sub_1000062C8(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100005C1C();
  void *v5 = v2;
  v5[1] = sub_10000637C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10000637C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006470(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10000637C;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

unint64_t sub_100006530()
{
  unint64_t result = qword_1000344F8;
  if (!qword_1000344F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000344F8);
  }
  return result;
}

unint64_t sub_100006588()
{
  unint64_t result = qword_100034500;
  if (!qword_100034500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034500);
  }
  return result;
}

unint64_t sub_1000065E0()
{
  unint64_t result = qword_100034508;
  if (!qword_100034508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034508);
  }
  return result;
}

void *sub_100006634()
{
  return &protocol witness table for String;
}

unint64_t sub_100006644()
{
  unint64_t result = qword_100034510;
  if (!qword_100034510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034510);
  }
  return result;
}

unint64_t sub_10000669C()
{
  unint64_t result = qword_100034518;
  if (!qword_100034518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034518);
  }
  return result;
}

uint64_t sub_1000066F0@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034288 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004148(&qword_100034580);
  uint64_t v3 = sub_100006E28(v2, (uint64_t)qword_10003CAC8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_1000067A0()
{
  unint64_t result = qword_100034520;
  if (!qword_100034520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034520);
  }
  return result;
}

unint64_t sub_1000067F8()
{
  unint64_t result = qword_100034528;
  if (!qword_100034528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034528);
  }
  return result;
}

unint64_t sub_100006850()
{
  unint64_t result = qword_100034530;
  if (!qword_100034530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034530);
  }
  return result;
}

void *sub_1000068A4()
{
  return &protocol witness table for String;
}

uint64_t sub_1000068B0@<X0>(uint64_t *a1@<X8>)
{
  sub_1000058B4();
  uint64_t result = sub_1000230D8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000068F0()
{
  sub_100006EC4();
  uint64_t v2 = sub_100023328();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006F18(v3, v0, v2, v1);
}

uint64_t sub_100006984@<X0>(uint64_t a1@<X8>)
{
  return sub_1000069BC(&qword_100034290, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10003CAE0, a1);
}

uint64_t sub_1000069BC@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100006E28(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100006A60()
{
  return sub_1000042F0(&qword_100034540, &qword_100034548);
}

uint64_t sub_100006A9C(uint64_t a1)
{
  unint64_t v2 = sub_100005EE8();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100006AEC()
{
  unint64_t result = qword_100034550;
  if (!qword_100034550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034550);
  }
  return result;
}

uint64_t sub_100006B40(uint64_t a1)
{
  unint64_t v2 = sub_1000058B4();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100006B8C(uint64_t a1)
{
  unint64_t v2 = sub_100006850();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for FTSilenceUnknownCallersToggleEntity.FTSilenceUnknownCallersEntityQuery()
{
  return &type metadata for FTSilenceUnknownCallersToggleEntity.FTSilenceUnknownCallersEntityQuery;
}

ValueMetadata *type metadata accessor for FTSilenceUnknownCallersToggleEntity()
{
  return &type metadata for FTSilenceUnknownCallersToggleEntity;
}

uint64_t destroy for FTSilenceUnknownCallersToggleEntity.UpdateIntent_value()
{
  swift_release();

  return swift_release();
}

void *_s28IntelligenceIntentsExtension35FTSilenceUnknownCallersToggleEntityV18UpdateIntent_valueVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for FTSilenceUnknownCallersToggleEntity.UpdateIntent_value(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for FTSilenceUnknownCallersToggleEntity.UpdateIntent_value(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for FTSilenceUnknownCallersToggleEntity.UpdateIntent_value(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for FTSilenceUnknownCallersToggleEntity.UpdateIntent_value(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FTSilenceUnknownCallersToggleEntity.UpdateIntent_value(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FTSilenceUnknownCallersToggleEntity.UpdateIntent_value()
{
  return &type metadata for FTSilenceUnknownCallersToggleEntity.UpdateIntent_value;
}

uint64_t sub_100006DB0()
{
  return sub_1000042F0(&qword_100034558, &qword_100034560);
}

uint64_t sub_100006DEC()
{
  return sub_1000042F0(&qword_100034568, &qword_100034560);
}

uint64_t sub_100006E28(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100006E60(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100006EC4()
{
  unint64_t result = qword_100034578;
  if (!qword_100034578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034578);
  }
  return result;
}

uint64_t sub_100006F18(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100006F2C()
{
  sub_100004148(&qword_1000345A8);
  ((void (*)(void))__chkstk_darwin)();
  v28 = (char *)&v20 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_100023318();
  uint64_t v1 = *(void *)(v29 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004148(&qword_1000345B0);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  unint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v20 - v7;
  uint64_t v9 = sub_100004148(&qword_100034570);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = v11;
  uint64_t v12 = sub_100023428();
  uint64_t v27 = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v22 = sub_100004148(&qword_1000345B8);
  sub_100023418();
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v26(v11, 1, 1, v12);
  uint64_t v31 = 0;
  uint64_t v14 = sub_1000230A8();
  v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  unsigned int v25 = enum case for InputConnectionBehavior.default(_:);
  v16 = *(void (**)(void))(v1 + 104);
  uint64_t v23 = v1 + 104;
  v24 = (void (*)(char *, void, uint64_t))v16;
  v16(v3);
  sub_100005EE8();
  v17 = v21;
  uint64_t v22 = sub_100023118();
  sub_100004148(&qword_1000345C0);
  sub_100023418();
  v26(v17, 1, 1, v27);
  char v30 = 2;
  uint64_t v18 = sub_100023558();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v28, 1, 1, v18);
  v15(v8, 1, 1, v14);
  v24(v3, v25, v29);
  sub_100023128();
  return v22;
}

uint64_t sub_10000736C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_100007378(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004148(&qword_100034600);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for BrandedCallingPrimaryToggleControl()
{
  return &type metadata for BrandedCallingPrimaryToggleControl;
}

uint64_t sub_1000073F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100007414@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100004148(&qword_1000343E8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004148(&qword_1000343F0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004148(&qword_1000343F8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004148(&qword_100034400);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100004148(&qword_100034408);
  sub_100007A54();
  sub_1000041E4();
  sub_100023518();
  sub_100023498();
  uint64_t v16 = sub_1000042F0(&qword_100034440, &qword_1000343E8);
  sub_1000234C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_100023498();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_1000234A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_1000234B8();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_1000234D8();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_100007908@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100004148(&qword_100034428);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100023498();
  sub_100023508();
  uint64_t v6 = sub_1000234F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  *(void *)(a1 + *(int *)(sub_100004148(&qword_100034408) + 36)) = v6;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_100007A54()
{
  unint64_t result = qword_100034608;
  if (!qword_100034608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034608);
  }
  return result;
}

uint64_t sub_100007AA8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100007BD8()
{
  unint64_t result = qword_100034610;
  if (!qword_100034610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034610);
  }
  return result;
}

uint64_t sub_100007C2C()
{
  return sub_1000042F0(&qword_100034618, &qword_100034620);
}

uint64_t sub_100007C68()
{
  uint64_t v0 = sub_100004148(&qword_100034740);
  sub_100006E60(v0, qword_10003CB30);
  sub_100006E28(v0, (uint64_t)qword_10003CB30);
  sub_100009240();
  return sub_100023368();
}

uint64_t sub_100007CE4()
{
  uint64_t v0 = sub_100004148(&qword_100034570);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100023428();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_1000233D8();
  sub_100006E60(v5, qword_10003CB48);
  sub_100006E28(v5, (uint64_t)qword_10003CB48);
  sub_100023418();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_1000233C8();
}

uint64_t sub_100007E50()
{
  uint64_t v0 = sub_100023428();
  sub_100006E60(v0, qword_10003CB60);
  sub_100006E28(v0, (uint64_t)qword_10003CB60);
  return sub_100023418();
}

uint64_t sub_100007EB4()
{
  uint64_t v0 = sub_100004148(&qword_100034600);
  sub_100006E60(v0, qword_10003CB78);
  uint64_t v1 = sub_100006E28(v0, (uint64_t)qword_10003CB78);
  sub_100023248();
  uint64_t v2 = sub_100023258();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100007F6C()
{
  uint64_t result = swift_getKeyPath();
  qword_10003CB90 = result;
  return result;
}

uint64_t sub_100007F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100004148(&qword_1000345D0);
  v3[9] = swift_task_alloc();
  sub_100004148(&qword_1000345D8);
  v3[10] = swift_task_alloc();
  sub_100004148(&qword_100034778);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_1000230A8();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100004148(&qword_100034780);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_100008158, 0, 0);
}

uint64_t sub_100008158()
{
  sub_1000230F8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_100009240();
  *uint64_t v1 = v0;
  v1[1] = sub_10000822C;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100008824, 0, &type metadata for SilenceJunkCallersToggleEntity, v2);
}

uint64_t sub_10000822C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100008328, 0, 0);
}

uint64_t sub_100008328()
{
  sub_1000230F8();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_1000230F8();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_1000342D0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10003CB90;
  *(void *)(v0 + 168) = qword_10003CB90;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_1000042F0(&qword_100034758, &qword_100034760);
  *uint64_t v3 = v0;
  v3[1] = sub_100008480;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_100008480()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000050C0;
  }
  else {
    uint64_t v2 = sub_1000085D4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000085D4()
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
  sub_1000230F8();
  uint64_t v7 = sub_1000233B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_1000233E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100007BD8();
  sub_100009454();
  sub_100023078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_100023098();
  sub_1000230B8();
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

uint64_t sub_100008828()
{
  uint64_t v0 = sub_100004148(&qword_100034788);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000342D0 != -1) {
    swift_once();
  }
  swift_retain();
  sub_1000232A8();
  swift_release();
  sub_100009454();
  sub_1000042F0(&qword_100034790, &qword_100034788);
  sub_100023298();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100008990()
{
  if (qword_1000342D0 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_1000089F0()
{
  unint64_t result = qword_100034628;
  if (!qword_100034628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034628);
  }
  return result;
}

unint64_t sub_100008A48()
{
  unint64_t result = qword_100034630;
  if (!qword_100034630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034630);
  }
  return result;
}

uint64_t sub_100008A9C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100008AD0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100008B20@<X0>(uint64_t a1@<X8>)
{
  return sub_1000069BC(&qword_1000342C0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003CB60, a1);
}

uint64_t sub_100008B58@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000342C8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004148(&qword_100034600);
  uint64_t v3 = sub_100006E28(v2, (uint64_t)qword_10003CB78);

  return sub_100007378(v3, a1);
}

uint64_t sub_100008BD4(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000073E4;
  return sub_100007F94(a1, v5, v4);
}

uint64_t sub_100008C80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009CC4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100008CA8()
{
  return 0xD00000000000002FLL;
}

unint64_t sub_100008CC8()
{
  unint64_t result = qword_100034640;
  if (!qword_100034640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034640);
  }
  return result;
}

unint64_t sub_100008D20()
{
  unint64_t result = qword_100034648;
  if (!qword_100034648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034648);
  }
  return result;
}

uint64_t sub_100008D74(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100008D94, 0, 0);
}

uint64_t sub_100008D94()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
  unsigned __int8 v3 = [v2 isSilenceJunkCallingEnabled];

  *uint64_t v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100008E30(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100008E54, 0, 0);
}

uint64_t sub_100008E54()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
  [v2 setSilenceJunkCallingEnabled:v1];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100008EE4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_100023428();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100008F74, 0, 0);
}

uint64_t sub_100008F74()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100004148(&qword_100034620);
  sub_100023418();
  sub_1000042F0(&qword_100034758, &qword_100034760);
  *uint64_t v1 = sub_100023408();
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_100009088()
{
  unint64_t result = qword_100034658;
  if (!qword_100034658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034658);
  }
  return result;
}

uint64_t sub_1000090DC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000096E0();
  *uint64_t v4 = v2;
  v4[1] = sub_100005D20;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100009190()
{
  unint64_t result = qword_100034668;
  if (!qword_100034668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034668);
  }
  return result;
}

unint64_t sub_1000091E8()
{
  unint64_t result = qword_100034670;
  if (!qword_100034670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034670);
  }
  return result;
}

unint64_t sub_100009240()
{
  unint64_t result = qword_100034678[0];
  if (!qword_100034678[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100034678);
  }
  return result;
}

uint64_t sub_100009294(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000096E0();
  void *v5 = v2;
  v5[1] = sub_100005FF0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100009348(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000096E0();
  *uint64_t v4 = v2;
  v4[1] = sub_1000073E0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_1000093FC()
{
  unint64_t result = qword_100034690;
  if (!qword_100034690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034690);
  }
  return result;
}

unint64_t sub_100009454()
{
  unint64_t result = qword_100034698;
  if (!qword_100034698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034698);
  }
  return result;
}

unint64_t sub_1000094AC()
{
  unint64_t result = qword_1000346A0;
  if (!qword_1000346A0)
  {
    sub_1000042A8(qword_1000346A8);
    sub_100009454();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000346A0);
  }
  return result;
}

uint64_t sub_100009520(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100009088();
  void *v5 = v2;
  v5[1] = sub_10000637C;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_1000095D8()
{
  unint64_t result = qword_1000346C0;
  if (!qword_1000346C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000346C0);
  }
  return result;
}

unint64_t sub_100009630()
{
  unint64_t result = qword_1000346C8;
  if (!qword_1000346C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000346C8);
  }
  return result;
}

unint64_t sub_100009688()
{
  unint64_t result = qword_1000346D0;
  if (!qword_1000346D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000346D0);
  }
  return result;
}

unint64_t sub_1000096E0()
{
  unint64_t result = qword_1000346D8;
  if (!qword_1000346D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000346D8);
  }
  return result;
}

unint64_t sub_100009738()
{
  unint64_t result = qword_1000346E0;
  if (!qword_1000346E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000346E0);
  }
  return result;
}

uint64_t sub_10000978C@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000342B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004148(&qword_100034740);
  uint64_t v3 = sub_100006E28(v2, (uint64_t)qword_10003CB30);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_10000983C()
{
  unint64_t result = qword_1000346E8;
  if (!qword_1000346E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000346E8);
  }
  return result;
}

unint64_t sub_100009894()
{
  unint64_t result = qword_1000346F0;
  if (!qword_1000346F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000346F0);
  }
  return result;
}

unint64_t sub_1000098F0()
{
  unint64_t result = qword_1000346F8;
  if (!qword_1000346F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000346F8);
  }
  return result;
}

uint64_t sub_100009944@<X0>(uint64_t *a1@<X8>)
{
  sub_100008D20();
  uint64_t result = sub_1000230D8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100009984()
{
  sub_100009C70();
  uint64_t v2 = sub_100023328();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006F18(v3, v0, v2, v1);
}

uint64_t sub_100009A18@<X0>(uint64_t a1@<X8>)
{
  return sub_1000069BC(&qword_1000342B8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10003CB48, a1);
}

uint64_t sub_100009A50()
{
  return sub_1000042F0(&qword_100034708, &qword_100034710);
}

uint64_t sub_100009A8C(uint64_t a1)
{
  unint64_t v2 = sub_100009240();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100009ADC()
{
  unint64_t result = qword_100034718;
  if (!qword_100034718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034718);
  }
  return result;
}

uint64_t sub_100009B30(uint64_t a1)
{
  unint64_t v2 = sub_100008D20();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100009B7C(uint64_t a1)
{
  unint64_t v2 = sub_1000098F0();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SilenceJunkCallersToggleEntity.SilenceJunkCallersEntityQuery()
{
  return &type metadata for SilenceJunkCallersToggleEntity.SilenceJunkCallersEntityQuery;
}

ValueMetadata *type metadata accessor for SilenceJunkCallersToggleEntity()
{
  return &type metadata for SilenceJunkCallersToggleEntity;
}

ValueMetadata *type metadata accessor for SilenceJunkCallersToggleEntity.UpdateIntent_value()
{
  return &type metadata for SilenceJunkCallersToggleEntity.UpdateIntent_value;
}

uint64_t sub_100009BF8()
{
  return sub_1000042F0(&qword_100034720, &qword_100034728);
}

uint64_t sub_100009C34()
{
  return sub_1000042F0(&qword_100034730, &qword_100034728);
}

unint64_t sub_100009C70()
{
  unint64_t result = qword_100034738;
  if (!qword_100034738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034738);
  }
  return result;
}

uint64_t sub_100009CC4()
{
  uint64_t v0 = sub_100004148(&qword_1000345A8);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100023318();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004148(&qword_1000345B0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100004148(&qword_100034570);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_100023428();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100004148(&qword_100034768);
  sub_100023418();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_1000230A8();
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_100009240();
  uint64_t v19 = v23;
  uint64_t v24 = sub_100023118();
  sub_100004148(&qword_1000345C0);
  sub_100023418();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100023558();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_100023128();
  return v24;
}

uint64_t sub_10000A104@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for SilenceJunkCallersToggleControl()
{
  return &type metadata for SilenceJunkCallersToggleControl;
}

uint64_t sub_10000A120()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000A13C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100004148(&qword_1000343E8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004148(&qword_1000343F0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004148(&qword_1000343F8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004148(&qword_100034400);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100004148(&qword_100034408);
  sub_100008D20();
  sub_1000041E4();
  sub_100023518();
  sub_100023498();
  uint64_t v16 = sub_1000042F0(&qword_100034440, &qword_1000343E8);
  sub_1000234C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_100023498();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_1000234A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_1000234B8();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_1000234D8();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10000A634@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100004148(&qword_100034428);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100023498();
  sub_100023508();
  uint64_t v6 = sub_1000234F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  *(void *)(a1 + *(int *)(sub_100004148(&qword_100034408) + 36)) = v6;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

ValueMetadata *type metadata accessor for FTSilenceUnknownCallersToggleControl()
{
  return &type metadata for FTSilenceUnknownCallersToggleControl;
}

uint64_t sub_10000A790()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000A7AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100004148(&qword_1000343E8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004148(&qword_1000343F0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004148(&qword_1000343F8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004148(&qword_100034400);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100004148(&qword_100034408);
  sub_1000058B4();
  sub_1000041E4();
  sub_100023518();
  sub_100023498();
  uint64_t v16 = sub_1000042F0(&qword_100034440, &qword_1000343E8);
  sub_1000234C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_100023498();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_1000234A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_1000234B8();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_1000234D8();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10000ACA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100004148(&qword_100034428);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100023498();
  sub_100023508();
  uint64_t v6 = sub_1000234F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  *(void *)(a1 + *(int *)(sub_100004148(&qword_100034408) + 36)) = v6;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_10000ADE4@<X0>(uint64_t a1@<X8>)
{
  sub_100023498();
  uint64_t result = sub_1000234E8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

unint64_t sub_10000AE64()
{
  unint64_t result = qword_100034798;
  if (!qword_100034798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034798);
  }
  return result;
}

unint64_t sub_10000AEBC()
{
  unint64_t result = qword_1000347A0;
  if (!qword_1000347A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000347A0);
  }
  return result;
}

unint64_t sub_10000AF14()
{
  unint64_t result = qword_1000347A8[0];
  if (!qword_1000347A8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000347A8);
  }
  return result;
}

uint64_t sub_10000AF68@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  v24[1] = a2;
  uint64_t v3 = sub_100004148(&qword_100034868);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v24 - v7;
  uint64_t v9 = sub_100004148(&qword_100034570);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v24 - v13;
  uint64_t v15 = sub_100023428();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v19 = __chkstk_darwin(v18);
  __chkstk_darwin(v19);
  switch(a1)
  {
    case 4:
      sub_100023418();
      sub_100023418();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v12, 0, 1, v15);
      sub_1000232B8();
      uint64_t v20 = sub_1000232C8();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v6, 0, 1, v20);
      TUDeviceHasChinaSKU();
      goto LABEL_5;
    case 5:
      sub_100023418();
      sub_100023418();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v14, 0, 1, v15);
      sub_1000232B8();
      uint64_t v21 = sub_1000232C8();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v8, 0, 1, v21);
      sub_100004148(&qword_100034870);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100026CE0;
      sub_100023418();
      sub_100023418();
      break;
    default:
      sub_100023418();
      sub_100023418();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v14, 0, 1, v15);
      sub_1000232B8();
      uint64_t v22 = sub_1000232C8();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v8, 0, 1, v22);
LABEL_5:
      sub_100023418();
      break;
  }
  return sub_1000232D8();
}

uint64_t sub_10000BF68()
{
  uint64_t v0 = sub_100004148(&qword_100034570);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100023428();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_1000233D8();
  sub_100006E60(v5, qword_10003CB98);
  sub_100006E28(v5, (uint64_t)qword_10003CB98);
  sub_100023418();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_1000233C8();
}

uint64_t sub_10000C0D4(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_1000348A8 + dword_1000348A8);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005FF0;
  return v5(a1);
}

uint64_t sub_10000C17C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000348A0 + dword_1000348A0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1000073E0;
  return v4();
}

unint64_t sub_10000C224()
{
  unint64_t result = qword_1000347C0;
  if (!qword_1000347C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000347C0);
  }
  return result;
}

uint64_t sub_10000C278(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100034898 + dword_100034898);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100005D20;
  return v4();
}

unint64_t sub_10000C320()
{
  unint64_t result = qword_1000347D0;
  if (!qword_1000347D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000347D0);
  }
  return result;
}

unint64_t sub_10000C378()
{
  unint64_t result = qword_1000347D8;
  if (!qword_1000347D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000347D8);
  }
  return result;
}

unint64_t sub_10000C3D0()
{
  unint64_t result = qword_1000347E0;
  if (!qword_1000347E0)
  {
    sub_1000042A8(qword_1000347E8);
    sub_10000C378();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000347E0);
  }
  return result;
}

uint64_t sub_10000C444(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000C224();
  void *v5 = v2;
  v5[1] = sub_10000637C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10000C4F8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100034890 + dword_100034890);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10000C59C;
  return v4();
}

uint64_t sub_10000C59C(char a1)
{
  uint64_t v3 = *(unsigned char **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  *uint64_t v3 = a1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

unint64_t sub_10000C6B0()
{
  unint64_t result = qword_100034800;
  if (!qword_100034800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034800);
  }
  return result;
}

uint64_t sub_10000C704()
{
  uint64_t v0 = sub_100004148(&qword_100034880);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004148(&qword_100034888);
  __chkstk_darwin(v4);
  sub_10000AF14();
  sub_100023398();
  v7._object = (void *)0x8000000100024840;
  v7._countAndFlagsBits = 0xD000000000000040;
  sub_100023388(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for _EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_100023378();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_100023388(v8);
  return sub_1000233A8();
}

unint64_t sub_10000C8C4()
{
  unint64_t result = qword_100034808;
  if (!qword_100034808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034808);
  }
  return result;
}

unint64_t sub_10000C91C()
{
  unint64_t result = qword_100034810;
  if (!qword_100034810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034810);
  }
  return result;
}

unint64_t sub_10000C974()
{
  unint64_t result = qword_100034818;
  if (!qword_100034818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034818);
  }
  return result;
}

unint64_t sub_10000C9CC()
{
  unint64_t result = qword_100034820;
  if (!qword_100034820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034820);
  }
  return result;
}

uint64_t sub_10000CA20()
{
  sub_10000CFD4();
  uint64_t v2 = sub_100023328();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006F18(v3, v0, v2, v1);
}

unint64_t sub_10000CAB8()
{
  unint64_t result = qword_100034830;
  if (!qword_100034830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034830);
  }
  return result;
}

unint64_t sub_10000CB10()
{
  unint64_t result = qword_100034838;
  if (!qword_100034838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034838);
  }
  return result;
}

unint64_t sub_10000CB68()
{
  unint64_t result = qword_100034840;
  if (!qword_100034840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034840);
  }
  return result;
}

unint64_t sub_10000CBC0()
{
  unint64_t result = qword_100034848;
  if (!qword_100034848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034848);
  }
  return result;
}

void sub_10000CC14(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000CC20@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000342D8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000233D8();
  uint64_t v3 = sub_100006E28(v2, (uint64_t)qword_10003CB98);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_10000CCCC()
{
  unint64_t result = qword_100034850;
  if (!qword_100034850)
  {
    sub_1000042A8(&qword_100034858);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034850);
  }
  return result;
}

uint64_t sub_10000CD28(uint64_t a1)
{
  unint64_t v2 = sub_10000AF14();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000CD78()
{
  unint64_t result = qword_100034860;
  if (!qword_100034860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034860);
  }
  return result;
}

uint64_t sub_10000CDCC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000AF68(*v1, a1);
}

uint64_t sub_10000CDD4(uint64_t a1)
{
  unint64_t v2 = sub_10000CB68();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unsigned char *initializeBufferWithCopyOfBuffer for FaceTimeSettingsDynamicDestination(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FaceTimeSettingsDynamicDestination(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF2) {
    goto LABEL_17;
  }
  if (a2 + 14 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 14) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 14;
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
      return (*a1 | (v4 << 8)) - 14;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 14;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xF;
  int v8 = v6 - 15;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FaceTimeSettingsDynamicDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *unint64_t result = a2 + 14;
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
        JUMPOUT(0x10000CF8CLL);
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
          *unint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FaceTimeSettingsDynamicDeepLinks()
{
  return &type metadata for FaceTimeSettingsDynamicDeepLinks;
}

ValueMetadata *type metadata accessor for FaceTimeSettingsDynamicDeepLinks.AvailableFaceTimeSettingsDynamicDestinationQuery()
{
  return &type metadata for FaceTimeSettingsDynamicDeepLinks.AvailableFaceTimeSettingsDynamicDestinationQuery;
}

unint64_t sub_10000CFD4()
{
  unint64_t result = qword_100034878;
  if (!qword_100034878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034878);
  }
  return result;
}

uint64_t sub_10000D028()
{
  return _swift_task_switch(sub_10000D044, 0, 0);
}

uint64_t sub_10000D044()
{
  uint64_t v1 = 15;
  sub_100020260(0, 15, 0);
  int v2 = &_swiftEmptyArrayStorage;
  unint64_t v3 = *((void *)&_swiftEmptyArrayStorage + 2);
  unsigned int v4 = &byte_100030EE8;
  do
  {
    char v6 = *v4++;
    char v5 = v6;
    uint64_t v10 = v2;
    unint64_t v7 = v2[3];
    if (v3 >= v7 >> 1)
    {
      sub_100020260((char *)(v7 > 1), v3 + 1, 1);
      int v2 = v10;
    }
    v2[2] = v3 + 1;
    *((unsigned char *)v2 + v3++ + 32) = v5;
    --v1;
  }
  while (v1);
  int v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_10000D148()
{
  return _swift_task_switch(sub_10000D164, 0, 0);
}

uint64_t sub_10000D164()
{
  uint64_t v1 = sub_10000D2A4((uint64_t)&off_100030EC8);
  int64_t v2 = v1[2];
  if (v2)
  {
    sub_100020260(0, v2, 0);
    uint64_t v3 = 0;
    uint64_t v4 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v5 = *((unsigned char *)v1 + v3 + 32);
      unint64_t v6 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v4 + v3 >= v6 >> 1) {
        sub_100020260((char *)(v6 > 1), v4 + v3 + 1, 1);
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

void *sub_10000D2A4(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  unint64_t v2 = 0;
  uint64_t v3 = a1 + 32;
  uint64_t v4 = &_swiftEmptyArrayStorage;
  uint64_t v19 = a1 + 32;
  unint64_t v20 = *(void *)(a1 + 16);
LABEL_3:
  uint64_t v21 = v4;
  uint64_t v5 = 0;
  if (v2 <= v1) {
    unint64_t v6 = v1;
  }
  else {
    unint64_t v6 = v2;
  }
  unint64_t v7 = v2 - v6;
  while (2)
  {
    if (!(v7 + v5))
    {
      __break(1u);
      JUMPOUT(0x10000D524);
    }
    char v11 = *(unsigned char *)(v3 + v2);
    switch(v11)
    {
      case 1:
      case 2:
      case 5:
      case 6:
      case 8:
      case 13:
      case 14:
        id v8 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
        unsigned __int8 v9 = objc_msgSend(v8, "isFaceTimeEnabledInSettings", v19);
        goto LABEL_8;
      case 4:
        id v8 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
        unsigned __int8 v9 = objc_msgSend(v8, "isRelaySecondaryAvailable", v19);
        goto LABEL_8;
      case 7:
        id v8 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
        unsigned __int8 v9 = objc_msgSend(v8, "isShareNameAndPhotosAvailable", v19);
        goto LABEL_8;
      case 9:
        id v8 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
        unsigned __int8 v9 = objc_msgSend(v8, "isAutomaticProminenceAvailable", v19);
        goto LABEL_8;
      case 10:
        id v12 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
        unsigned __int8 v13 = [v12 isFaceTimeEnabledInSettings];

        if ((v13 & 1) != 0 && [self isCaptioningSupported]) {
          goto LABEL_20;
        }
        goto LABEL_9;
      case 11:
        id v8 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
        unsigned __int8 v9 = objc_msgSend(v8, "isLivePhotosAvailable", v19);
LABEL_8:
        unsigned __int8 v10 = v9;

        if ((v10 & 1) == 0) {
          goto LABEL_9;
        }
        goto LABEL_20;
      case 12:
        if (sub_1000117E8()) {
          goto LABEL_20;
        }
LABEL_9:
        ++v5;
        ++v3;
        if (v2 != --v1) {
          continue;
        }
        uint64_t v4 = v21;
        break;
      default:
LABEL_20:
        uint64_t v4 = v21;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100020288(0, v21[2] + 1, 1);
          uint64_t v4 = v21;
        }
        uint64_t v3 = v19;
        unint64_t v15 = v4[2];
        unint64_t v14 = v4[3];
        if (v15 >= v14 >> 1)
        {
          sub_100020288((char *)(v14 > 1), v15 + 1, 1);
          uint64_t v4 = v21;
        }
        unint64_t v16 = v2 + 1;
        v2 += 1 + v5;
        v4[2] = v15 + 1;
        *((unsigned char *)v4 + v15 + 32) = v11;
        BOOL v17 = v16 == v1;
        unint64_t v1 = v20;
        if (!v17) {
          goto LABEL_3;
        }
        return v4;
    }
    return v4;
  }
}

uint64_t sub_10000D560(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000D580, 0, 0);
}

uint64_t sub_10000D580()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  unint64_t v2 = sub_10000D2A4(v1);
  swift_bridgeObjectRelease();
  int64_t v3 = v2[2];
  if (v3)
  {
    sub_100020260(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v6 = *((unsigned char *)v2 + v4 + 32);
      unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v5 + v4 >= v7 >> 1) {
        sub_100020260((char *)(v7 > 1), v5 + v4 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v5 + v4 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v5 + v4++ + 32) = v6;
    }
    while (v3 != v4);
  }
  swift_bridgeObjectRelease();
  id v8 = *(uint64_t (**)(void *))(v0 + 8);
  return v8(&_swiftEmptyArrayStorage);
}

uint64_t sub_10000D6CC()
{
  return _swift_task_switch(sub_10000D6E8, 0, 0);
}

uint64_t sub_10000D6E8()
{
  uint64_t v1 = sub_10000D2A4((uint64_t)&off_100030EC8);
  if (v1[2]) {
    uint64_t v2 = *((unsigned __int8 *)v1 + 32);
  }
  else {
    uint64_t v2 = 15;
  }
  swift_bridgeObjectRelease();
  int64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

ValueMetadata *type metadata accessor for MPSilenceUnknownCallersToggleControl()
{
  return &type metadata for MPSilenceUnknownCallersToggleControl;
}

uint64_t sub_10000D784()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000D7A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100004148(&qword_1000343E8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  int64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004148(&qword_1000343F0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004148(&qword_1000343F8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  char v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004148(&qword_100034400);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  unint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100004148(&qword_100034408);
  sub_10000DDE0();
  sub_1000041E4();
  sub_100023518();
  sub_100023498();
  uint64_t v16 = sub_1000042F0(&qword_100034440, &qword_1000343E8);
  sub_1000234C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_100023498();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_1000234A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_1000234B8();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_1000234D8();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10000DC94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100004148(&qword_100034428);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100023498();
  sub_100023508();
  uint64_t v6 = sub_1000234F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  *(void *)(a1 + *(int *)(sub_100004148(&qword_100034408) + 36)) = v6;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_10000DDE0()
{
  unint64_t result = qword_1000348B0;
  if (!qword_1000348B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000348B0);
  }
  return result;
}

unint64_t sub_10000DE34(char a1)
{
  unint64_t result = 47;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000014;
      break;
    case 2:
      unint64_t result = 0x434E554F4E4E412FLL;
      break;
    case 3:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 4:
    case 5:
    case 9:
      unint64_t result = 0xD000000000000018;
      break;
    case 6:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 7:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 8:
      unint64_t result = 0xD000000000000013;
      break;
    case 10:
      unint64_t result = 0xD000000000000023;
      break;
    case 11:
      unint64_t result = 0xD000000000000021;
      break;
    case 12:
      unint64_t result = 0xD000000000000016;
      break;
    case 13:
      unint64_t result = 0xD00000000000002DLL;
      break;
    case 14:
      unint64_t result = 0x45434E454C49532FLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_10000DFFC(char a1)
{
  unint64_t result = 47;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000014;
      break;
    case 2:
      unint64_t result = 0x434E554F4E4E412FLL;
      break;
    case 3:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 4:
    case 5:
    case 9:
      unint64_t result = 0xD000000000000018;
      break;
    case 6:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 7:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 8:
      unint64_t result = 0xD000000000000013;
      break;
    case 10:
      unint64_t result = 0xD000000000000023;
      break;
    case 11:
      unint64_t result = 0xD000000000000021;
      break;
    case 12:
      unint64_t result = 0xD000000000000016;
      break;
    case 13:
      unint64_t result = 0xD00000000000002DLL;
      break;
    case 14:
      unint64_t result = 0x45434E454C49532FLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000E1C4(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_10000DFFC(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_10000DFFC(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_1000235A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_10000E254()
{
  unint64_t result = qword_1000348B8;
  if (!qword_1000348B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000348B8);
  }
  return result;
}

Swift::Int sub_10000E2A8()
{
  char v1 = *v0;
  sub_1000235C8();
  sub_10000DFFC(v1);
  sub_100023538();
  swift_bridgeObjectRelease();
  return sub_1000235E8();
}

uint64_t sub_10000E30C()
{
  sub_10000DFFC(*v0);
  sub_100023538();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000E360()
{
  char v1 = *v0;
  sub_1000235C8();
  sub_10000DFFC(v1);
  sub_100023538();
  swift_bridgeObjectRelease();
  return sub_1000235E8();
}

uint64_t sub_10000E3C0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000E5F0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_10000E3F0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10000DFFC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10000E420()
{
  unint64_t result = qword_1000348C0;
  if (!qword_1000348C0)
  {
    sub_1000042A8(&qword_1000348C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000348C0);
  }
  return result;
}

void sub_10000E47C(void *a1@<X8>)
{
  *a1 = &off_100030EC8;
}

unint64_t sub_10000E48C()
{
  return sub_10000DE34(*v0);
}

uint64_t sub_10000E494@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_10000E5F0(a1, a2);
  *a3 = result;
  return result;
}

unsigned char *storeEnumTagSinglePayload for FaceTimeSettingsDynamicDestination(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *uint64_t result = a2 + 14;
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
        JUMPOUT(0x10000E5A8);
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
          *uint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

uint64_t sub_10000E5D0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000E5D8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FaceTimeSettingsDynamicDestination()
{
  return &type metadata for FaceTimeSettingsDynamicDestination;
}

uint64_t sub_10000E5F0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100030EF8;
  v6._object = a2;
  unint64_t v4 = sub_100023598(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xF) {
    return 15;
  }
  else {
    return v4;
  }
}

unint64_t sub_10000E640()
{
  unint64_t result = qword_1000348D0;
  if (!qword_1000348D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000348D0);
  }
  return result;
}

uint64_t sub_10000E694()
{
  return sub_1000042F0(&qword_1000348D8, &qword_1000348E0);
}

uint64_t sub_10000E6D0()
{
  uint64_t v0 = sub_100004148(&qword_100034A00);
  sub_100006E60(v0, qword_10003CBB0);
  sub_100006E28(v0, (uint64_t)qword_10003CBB0);
  sub_10000FCB0();
  return sub_100023368();
}

uint64_t sub_10000E74C()
{
  uint64_t v0 = sub_100004148(&qword_100034570);
  __chkstk_darwin(v0 - 8);
  char v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100023428();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_1000233D8();
  sub_100006E60(v5, qword_10003CBC8);
  sub_100006E28(v5, (uint64_t)qword_10003CBC8);
  sub_100023418();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_1000233C8();
}

uint64_t sub_10000E8B8()
{
  uint64_t v0 = sub_100023428();
  sub_100006E60(v0, qword_10003CBE0);
  sub_100006E28(v0, (uint64_t)qword_10003CBE0);
  return sub_100023418();
}

uint64_t sub_10000E91C()
{
  uint64_t v0 = sub_100004148(&qword_100034600);
  sub_100006E60(v0, qword_10003CBF8);
  uint64_t v1 = sub_100006E28(v0, (uint64_t)qword_10003CBF8);
  sub_100023248();
  uint64_t v2 = sub_100023258();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10000E9D4()
{
  uint64_t result = swift_getKeyPath();
  qword_10003CC10 = result;
  return result;
}

uint64_t sub_10000E9FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100004148(&qword_1000345D0);
  v3[9] = swift_task_alloc();
  sub_100004148(&qword_1000345D8);
  v3[10] = swift_task_alloc();
  sub_100004148(&qword_100034A38);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_1000230A8();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100004148(&qword_100034A40);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_10000EBC0, 0, 0);
}

uint64_t sub_10000EBC0()
{
  sub_1000230F8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_10000FCB0();
  *uint64_t v1 = v0;
  v1[1] = sub_10000EC94;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_10000F28C, 0, &type metadata for BrandedCallingSecondaryToggleEntity, v2);
}

uint64_t sub_10000EC94()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10000ED90, 0, 0);
}

uint64_t sub_10000ED90()
{
  sub_1000230F8();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_1000230F8();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_100034300 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10003CC10;
  *(void *)(v0 + 168) = qword_10003CC10;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_1000042F0(&qword_100034A18, &qword_100034A20);
  *uint64_t v3 = v0;
  v3[1] = sub_10000EEE8;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_10000EEE8()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000050C0;
  }
  else {
    uint64_t v2 = sub_10000F03C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000F03C()
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
  sub_1000230F8();
  uint64_t v7 = sub_1000233B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_1000233E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_10000E640();
  sub_10000FEC4();
  sub_100023078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_100023098();
  sub_1000230B8();
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

uint64_t sub_10000F290()
{
  uint64_t v0 = sub_100004148(&qword_100034A48);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100034300 != -1) {
    swift_once();
  }
  swift_retain();
  sub_1000232A8();
  swift_release();
  sub_10000FEC4();
  sub_1000042F0(&qword_100034A50, &qword_100034A48);
  sub_100023298();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10000F3F8()
{
  if (qword_100034300 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10000F458()
{
  unint64_t result = qword_1000348E8;
  if (!qword_1000348E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000348E8);
  }
  return result;
}

unint64_t sub_10000F4B0()
{
  unint64_t result = qword_1000348F0;
  if (!qword_1000348F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000348F0);
  }
  return result;
}

uint64_t sub_10000F504()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10000F538()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000F588@<X0>(uint64_t a1@<X8>)
{
  return sub_1000069BC(&qword_1000342F0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003CBE0, a1);
}

uint64_t sub_10000F5C0@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000342F8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004148(&qword_100034600);
  uint64_t v3 = sub_100006E28(v2, (uint64_t)qword_10003CBF8);

  return sub_100007378(v3, a1);
}

uint64_t sub_10000F63C(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000073E4;
  return sub_10000E9FC(a1, v5, v4);
}

uint64_t sub_10000F6E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100010734();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10000F710()
{
  return 0xD000000000000034;
}

unint64_t sub_10000F730()
{
  unint64_t result = qword_100034900;
  if (!qword_100034900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034900);
  }
  return result;
}

unint64_t sub_10000F788()
{
  unint64_t result = qword_100034908;
  if (!qword_100034908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034908);
  }
  return result;
}

uint64_t sub_10000F7DC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000F7FC, 0, 0);
}

uint64_t sub_10000F7FC()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
  unsigned __int8 v3 = [v2 isBrandedCallingEnabled:0];

  *uint64_t v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10000F89C(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_10000F8C0, 0, 0);
}

uint64_t sub_10000F8C0()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
  [v2 setBrandedCallingEnabled:v1 primary:0];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10000F954(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_100023428();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_10000F9E4, 0, 0);
}

uint64_t sub_10000F9E4()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100004148(&qword_1000348E0);
  sub_100023418();
  sub_1000042F0(&qword_100034A18, &qword_100034A20);
  *uint64_t v1 = sub_100023408();
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_10000FAF8()
{
  unint64_t result = qword_100034918;
  if (!qword_100034918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034918);
  }
  return result;
}

uint64_t sub_10000FB4C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100010154();
  *uint64_t v4 = v2;
  v4[1] = sub_100005D20;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10000FC00()
{
  unint64_t result = qword_100034928;
  if (!qword_100034928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034928);
  }
  return result;
}

unint64_t sub_10000FC58()
{
  unint64_t result = qword_100034930;
  if (!qword_100034930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034930);
  }
  return result;
}

unint64_t sub_10000FCB0()
{
  unint64_t result = qword_100034938[0];
  if (!qword_100034938[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100034938);
  }
  return result;
}

uint64_t sub_10000FD04(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100010154();
  void *v5 = v2;
  v5[1] = sub_100005FF0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10000FDB8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100010154();
  *uint64_t v4 = v2;
  v4[1] = sub_1000073E0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10000FE6C()
{
  unint64_t result = qword_100034950;
  if (!qword_100034950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034950);
  }
  return result;
}

unint64_t sub_10000FEC4()
{
  unint64_t result = qword_100034958;
  if (!qword_100034958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034958);
  }
  return result;
}

unint64_t sub_10000FF1C()
{
  unint64_t result = qword_100034960;
  if (!qword_100034960)
  {
    sub_1000042A8(qword_100034968);
    sub_10000FEC4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034960);
  }
  return result;
}

uint64_t sub_10000FF90(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000FAF8();
  void *v5 = v2;
  v5[1] = sub_10000637C;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100010048()
{
  unint64_t result = qword_100034980;
  if (!qword_100034980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034980);
  }
  return result;
}

unint64_t sub_1000100A0()
{
  unint64_t result = qword_100034988;
  if (!qword_100034988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034988);
  }
  return result;
}

unint64_t sub_1000100F8()
{
  unint64_t result = qword_100034990;
  if (!qword_100034990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034990);
  }
  return result;
}

unint64_t sub_100010154()
{
  unint64_t result = qword_100034998;
  if (!qword_100034998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034998);
  }
  return result;
}

unint64_t sub_1000101AC()
{
  unint64_t result = qword_1000349A0;
  if (!qword_1000349A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000349A0);
  }
  return result;
}

uint64_t sub_100010200@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000342E0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004148(&qword_100034A00);
  uint64_t v3 = sub_100006E28(v2, (uint64_t)qword_10003CBB0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_1000102B0()
{
  unint64_t result = qword_1000349A8;
  if (!qword_1000349A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000349A8);
  }
  return result;
}

unint64_t sub_100010308()
{
  unint64_t result = qword_1000349B0;
  if (!qword_1000349B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000349B0);
  }
  return result;
}

unint64_t sub_100010360()
{
  unint64_t result = qword_1000349B8;
  if (!qword_1000349B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000349B8);
  }
  return result;
}

uint64_t sub_1000103B4@<X0>(uint64_t *a1@<X8>)
{
  sub_10000F788();
  uint64_t result = sub_1000230D8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000103F4()
{
  sub_1000106E0();
  uint64_t v2 = sub_100023328();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006F18(v3, v0, v2, v1);
}

uint64_t sub_100010488@<X0>(uint64_t a1@<X8>)
{
  return sub_1000069BC(&qword_1000342E8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10003CBC8, a1);
}

uint64_t sub_1000104C0()
{
  return sub_1000042F0(&qword_1000349C8, &qword_1000349D0);
}

uint64_t sub_1000104FC(uint64_t a1)
{
  unint64_t v2 = sub_10000FCB0();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001054C()
{
  unint64_t result = qword_1000349D8;
  if (!qword_1000349D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000349D8);
  }
  return result;
}

uint64_t sub_1000105A0(uint64_t a1)
{
  unint64_t v2 = sub_10000F788();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_1000105EC(uint64_t a1)
{
  unint64_t v2 = sub_100010360();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for BrandedCallingSecondaryToggleEntity.BrandedCallingSecondaryEntityQuery()
{
  return &type metadata for BrandedCallingSecondaryToggleEntity.BrandedCallingSecondaryEntityQuery;
}

ValueMetadata *type metadata accessor for BrandedCallingSecondaryToggleEntity()
{
  return &type metadata for BrandedCallingSecondaryToggleEntity;
}

ValueMetadata *type metadata accessor for BrandedCallingSecondaryToggleEntity.UpdateIntent_value()
{
  return &type metadata for BrandedCallingSecondaryToggleEntity.UpdateIntent_value;
}

uint64_t sub_100010668()
{
  return sub_1000042F0(&qword_1000349E0, &qword_1000349E8);
}

uint64_t sub_1000106A4()
{
  return sub_1000042F0(&qword_1000349F0, &qword_1000349E8);
}

unint64_t sub_1000106E0()
{
  unint64_t result = qword_1000349F8;
  if (!qword_1000349F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000349F8);
  }
  return result;
}

uint64_t sub_100010734()
{
  uint64_t v0 = sub_100004148(&qword_1000345A8);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100023318();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004148(&qword_1000345B0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100004148(&qword_100034570);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_100023428();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100004148(&qword_100034A28);
  sub_100023418();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_1000230A8();
  BOOL v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_10000FCB0();
  uint64_t v19 = v23;
  uint64_t v24 = sub_100023118();
  sub_100004148(&qword_1000345C0);
  sub_100023418();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100023558();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_100023128();
  return v24;
}

uint64_t sub_100010B74@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for LiveVoicemailToggleControl()
{
  return &type metadata for LiveVoicemailToggleControl;
}

uint64_t sub_100010B90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100010BAC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100004148(&qword_1000343E8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004148(&qword_1000343F0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004148(&qword_1000343F8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004148(&qword_100034400);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100004148(&qword_100034408);
  sub_1000111F4();
  sub_1000041E4();
  sub_100023518();
  sub_100023498();
  uint64_t v16 = sub_1000042F0(&qword_100034440, &qword_1000343E8);
  sub_1000234C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_100023498();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_1000234A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_1000234B8();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_1000234D8();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_1000110A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100004148(&qword_100034428);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100023498();
  sub_100023508();
  uint64_t v6 = sub_1000234F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  *(void *)(a1 + *(int *)(sub_100004148(&qword_100034408) + 36)) = v6;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_1000111F4()
{
  unint64_t result = qword_100034A58;
  if (!qword_100034A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034A58);
  }
  return result;
}

id sub_100011248()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for Features()) init];
  static Features.shared = (uint64_t)result;
  return result;
}

id Features.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

uint64_t *Features.shared.unsafeMutableAddressor()
{
  if (qword_100034308 != -1) {
    swift_once();
  }
  return &static Features.shared;
}

id static Features.shared.getter()
{
  if (qword_100034308 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static Features.shared;

  return v0;
}

uint64_t Features.isViewpointCorrectionEnabled.getter()
{
  uint64_t v3 = &type metadata for Features.AVConference;
  unint64_t v4 = sub_100011400();
  char v0 = sub_100023468();
  sub_100011454((uint64_t)v2);
  return v0 & 1;
}

unint64_t sub_100011400()
{
  unint64_t result = qword_100034A60;
  if (!qword_100034A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034A60);
  }
  return result;
}

uint64_t sub_100011454(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000114A4()
{
  return 1;
}

Swift::Int sub_1000114AC()
{
  return sub_1000235E8();
}

void sub_1000114F0()
{
}

Swift::Int sub_100011518()
{
  return sub_1000235E8();
}

const char *sub_100011558()
{
  return "AVConference";
}

const char *sub_10001156C()
{
  return "ViewpointCorrection";
}

id Features.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Features();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for Features()
{
  return self;
}

id Features.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Features();
  return objc_msgSendSuper2(&v2, "dealloc");
}

ValueMetadata *type metadata accessor for AvailabilityHelpers()
{
  return &type metadata for AvailabilityHelpers;
}

uint64_t getEnumTagSinglePayload for Features.AVConference(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for Features.AVConference(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100011750);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100011778()
{
  return 0;
}

ValueMetadata *type metadata accessor for Features.AVConference()
{
  return &type metadata for Features.AVConference;
}

unint64_t sub_100011794()
{
  unint64_t result = qword_100034A90;
  if (!qword_100034A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034A90);
  }
  return result;
}

uint64_t sub_1000117E8()
{
  id v0 = [self sharedInstance];
  uint64_t v1 = v0;
  if (v0)
  {
    id v2 = v0;
    NSString v3 = sub_100023528();
    id v4 = [v2 objectForKey:v3];

    if (v4)
    {
      sub_100023568();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
    }
    sub_100011DE0((uint64_t)&v18, (uint64_t)v21);
  }
  else
  {
    memset(v21, 0, sizeof(v21));
  }
  sub_100011D18((uint64_t)v21, (uint64_t)&v18);
  uint64_t v5 = *((void *)&v19 + 1);
  sub_100011D80((uint64_t)&v18);
  if (!v5)
  {
    *((void *)&v19 + 1) = &type metadata for Bool;
    LOBYTE(v18) = 1;
    sub_100011D80((uint64_t)v21);
    sub_100011DE0((uint64_t)&v18, (uint64_t)v21);
  }
  uint64_t v6 = self;
  id v7 = [v6 currentDevice];
  id v8 = [v7 userInterfaceIdiom];

  if (v8 == (id)1) {
    unsigned int v9 = 1;
  }
  else {
    unsigned int v9 = [self isEyeContactSupported];
  }
  id v10 = [v6 currentDevice];
  id v11 = [v10 userInterfaceIdiom];

  if (v11 && !v9) {
    goto LABEL_20;
  }
  int v12 = MGGetBoolAnswer();

  if (!v12) {
    goto LABEL_20;
  }
  if (qword_100034308 != -1) {
    swift_once();
  }
  *((void *)&v19 + 1) = &type metadata for Features.AVConference;
  unint64_t v20 = sub_100011400();
  char v13 = sub_100023468();
  sub_100011454((uint64_t)&v18);
  if (v13)
  {
    uint64_t result = sub_100011D18((uint64_t)v21, (uint64_t)&v16);
    if (v17)
    {
      sub_100011D80((uint64_t)v21);

      sub_100011E48(&v16, &v18);
      swift_dynamicCast();
      return v15;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
LABEL_20:
    sub_100011D80((uint64_t)v21);

    return 0;
  }
  return result;
}

uint64_t sub_100011A90()
{
  uint64_t v14 = sub_100023458();
  id v0 = *(void (***)(char *, uint64_t))(v14 - 8);
  __chkstk_darwin(v14);
  id v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = [objc_allocWithZone((Class)VMVoicemailManager) init];
  id v3 = [v15 accounts];
  sub_100011CD8();
  unint64_t v4 = sub_100023548();

  if (v4 >> 62) {
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v5)
  {
    uint64_t v6 = v0 + 1;
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = (v4 & 0xC000000000000001) != 0
         ? (void (**)(char *, uint64_t))sub_100023578()
         : (void (**)(char *, uint64_t))*(id *)(v4 + 8 * v7);
      id v0 = v8;
      uint64_t v9 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      if ([v8 isProvisioned])
      {
        id v10 = [v0 UUID];
        sub_100023448();

        Class isa = sub_100023438().super.isa;
        (*v6)(v2, v14);
        unsigned __int8 v12 = [v15 isPasscodeChangeSupportedForAccountUUID:isa];

        if (v12)
        {

          swift_bridgeObjectRelease();
          return 1;
        }
      }
      else
      {
      }
      ++v7;
      if (v9 == v5) {
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100023588();
    swift_bridgeObjectRelease();
  }
LABEL_15:

  swift_bridgeObjectRelease();
  return 0;
}

unint64_t sub_100011CD8()
{
  unint64_t result = qword_100034A98;
  if (!qword_100034A98)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100034A98);
  }
  return result;
}

uint64_t sub_100011D18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004148(&qword_100034AA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100011D80(uint64_t a1)
{
  uint64_t v2 = sub_100004148(&qword_100034AA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100011DE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004148(&qword_100034AA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100011E48(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

ValueMetadata *type metadata accessor for BrandedCallingSecondaryToggleControl()
{
  return &type metadata for BrandedCallingSecondaryToggleControl;
}

uint64_t sub_100011E68()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100011E84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100004148(&qword_1000343E8);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004148(&qword_1000343F0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004148(&qword_1000343F8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  id v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004148(&qword_100034400);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  id v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100004148(&qword_100034408);
  sub_10000F788();
  sub_1000041E4();
  sub_100023518();
  sub_100023498();
  uint64_t v16 = sub_1000042F0(&qword_100034440, &qword_1000343E8);
  sub_1000234C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_100023498();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_1000234A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_1000234B8();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_1000234D8();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_100012378@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100004148(&qword_100034428);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100023498();
  sub_100023508();
  uint64_t v6 = sub_1000234F8();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  *(void *)(a1 + *(int *)(sub_100004148(&qword_100034408) + 36)) = v6;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

BOOL sub_1000124C4(char a1)
{
  id v2 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
  uint64_t v3 = v2;
  switch(a1)
  {
    case 1:
      goto LABEL_5;
    case 2:
      id v5 = [v2 isCallAnnouncementAvailableForPhone];
      goto LABEL_25;
    case 4:
      if (![v2 isShareNameAndPhotosAvailable]) {
        goto LABEL_19;
      }
      id v4 = [self sharedInstance];
      if (!v4)
      {
        __break(1u);
        JUMPOUT(0x1000126B8);
      }
      goto LABEL_18;
    case 5:
      id v5 = [v2 isWiFiCallingAvailable];
      goto LABEL_25;
    case 6:
      id v5 = [v2 isRelayPrimaryAvailable];
      goto LABEL_25;
    case 7:
      id v5 = [v2 isRespondwithTextAvailable];
      goto LABEL_25;
    case 8:
      id v5 = [v2 isCallForwardingAvailable];
      goto LABEL_25;
    case 9:
      id v5 = [v2 isCallWaitingAvailable];
      goto LABEL_25;
    case 10:
      id v5 = [v2 isCallRecordingAvailable];
      goto LABEL_25;
    case 11:
      id v5 = [v2 isShowMyCallerIDAvailable];
      goto LABEL_25;
    case 12:
      id v5 = [v2 isCallScreeningAvailable];
      goto LABEL_25;
    case 14:
      id v5 = [v2 isCallBlockingAndIdentificationAvailable];
      goto LABEL_25;
    case 15:
      id v5 = [v2 isBlockedContactsAvailable];
      goto LABEL_25;
    case 16:
      id v5 = [v2 isILClassificationAvailable];
      goto LABEL_25;
    case 17:
      if (![v2 isSIMAvailable]) {
        goto LABEL_19;
      }
      char v6 = sub_100011A90();

      return v6 & 1;
    case 18:
      id v5 = [v2 isDialAssistAvailable];
      goto LABEL_25;
    default:
      if ([v2 isSIMAvailable])
      {
        id v4 = [self sharedInstance];
        if (v4)
        {
LABEL_18:
          uint64_t v8 = v4;
          id v9 = [v4 deviceType];

          return v9 == (id)2;
        }
        else
        {
          __break(1u);
LABEL_5:
          id v5 = [v3 isIncomingCallsAvailableForPhone];
LABEL_25:
          id v10 = v5;
        }
      }
      else
      {
LABEL_19:

        return 0;
      }
      return (BOOL)v10;
  }
}

unint64_t sub_100012704(char a1)
{
  unint64_t result = 47;
  switch(a1)
  {
    case 1:
    case 7:
      unint64_t result = 0xD000000000000014;
      break;
    case 2:
      unint64_t result = 0x434E554F4E4E412FLL;
      break;
    case 3:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 4:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000020;
      break;
    case 6:
      unint64_t result = 0xD000000000000016;
      break;
    case 8:
      unint64_t result = 0xD000000000000023;
      break;
    case 9:
      unint64_t result = 0xD000000000000020;
      break;
    case 10:
      unint64_t result = 0x45525F4C4C41432FLL;
      break;
    case 11:
      unint64_t result = 0xD00000000000002FLL;
      break;
    case 12:
      unint64_t result = 0x43535F4C4C41432FLL;
      break;
    case 13:
      unint64_t result = 0x45434E454C49532FLL;
      break;
    case 14:
      unint64_t result = 0xD000000000000011;
      break;
    case 15:
      unint64_t result = 0xD00000000000002DLL;
      break;
    case 16:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 17:
      unint64_t result = 0xD000000000000018;
      break;
    case 18:
      unint64_t result = 0x7373416C61694423;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_100012978(char a1)
{
  unint64_t result = 47;
  switch(a1)
  {
    case 1:
    case 7:
      unint64_t result = 0xD000000000000014;
      break;
    case 2:
      unint64_t result = 0x434E554F4E4E412FLL;
      break;
    case 3:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 4:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000020;
      break;
    case 6:
      unint64_t result = 0xD000000000000016;
      break;
    case 8:
      unint64_t result = 0xD000000000000023;
      break;
    case 9:
      unint64_t result = 0xD000000000000020;
      break;
    case 10:
      unint64_t result = 0x45525F4C4C41432FLL;
      break;
    case 11:
      unint64_t result = 0xD00000000000002FLL;
      break;
    case 12:
      unint64_t result = 0x43535F4C4C41432FLL;
      break;
    case 13:
      unint64_t result = 0x45434E454C49532FLL;
      break;
    case 14:
      unint64_t result = 0xD000000000000011;
      break;
    case 15:
      unint64_t result = 0xD00000000000002DLL;
      break;
    case 16:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 17:
      unint64_t result = 0xD000000000000018;
      break;
    case 18:
      unint64_t result = 0x7373416C61694423;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100012BEC(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_100012978(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_100012978(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_1000235A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_100012C7C()
{
  unint64_t result = qword_100034AA8;
  if (!qword_100034AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034AA8);
  }
  return result;
}

Swift::Int sub_100012CD0()
{
  char v1 = *v0;
  sub_1000235C8();
  sub_100012978(v1);
  sub_100023538();
  swift_bridgeObjectRelease();
  return sub_1000235E8();
}

uint64_t sub_100012D34()
{
  sub_100012978(*v0);
  sub_100023538();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100012D88()
{
  char v1 = *v0;
  sub_1000235C8();
  sub_100012978(v1);
  sub_100023538();
  swift_bridgeObjectRelease();
  return sub_1000235E8();
}

uint64_t sub_100012DE8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100013098();
  *a1 = result;
  return result;
}

unint64_t sub_100012E18@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100012978(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100012E48()
{
  unint64_t result = qword_100034AB0;
  if (!qword_100034AB0)
  {
    sub_1000042A8(&qword_100034AB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034AB0);
  }
  return result;
}

void sub_100012EA4(void *a1@<X8>)
{
  *a1 = &off_100031268;
}

unint64_t sub_100012EB4()
{
  return sub_100012704(*v0);
}

uint64_t sub_100012EBC@<X0>(unsigned char *a1@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_100013098();
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for MobilePhoneSettingsDynamicDestination(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MobilePhoneSettingsDynamicDestination(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 18;
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
        JUMPOUT(0x100013060);
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
          *uint64_t result = a2 + 18;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MobilePhoneSettingsDynamicDestination()
{
  return &type metadata for MobilePhoneSettingsDynamicDestination;
}

uint64_t sub_100013098()
{
  unint64_t v0 = sub_1000235B8();
  swift_bridgeObjectRelease();
  if (v0 >= 0x13) {
    return 19;
  }
  else {
    return v0;
  }
}

unint64_t sub_1000130F0()
{
  unint64_t result = qword_100034AC0;
  if (!qword_100034AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034AC0);
  }
  return result;
}

unint64_t sub_100013148()
{
  unint64_t result = qword_100034AC8;
  if (!qword_100034AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034AC8);
  }
  return result;
}

uint64_t sub_10001319C()
{
  uint64_t v0 = sub_100023428();
  sub_100006E60(v0, qword_10003CC20);
  sub_100006E28(v0, (uint64_t)qword_10003CC20);
  return sub_100023418();
}

uint64_t sub_100013200()
{
  sub_1000230F8();
  return v1;
}

uint64_t sub_100013234@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000230F8();
  *a1 = v3;
  return result;
}

uint64_t sub_100013270()
{
  return sub_100023108();
}

void (*sub_1000132A8(void *a1))(void *a1)
{
  int v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1000230E8();
  return sub_1000054A4;
}

unint64_t sub_100013308()
{
  unint64_t result = qword_100034AD0;
  if (!qword_100034AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034AD0);
  }
  return result;
}

unint64_t sub_100013360()
{
  unint64_t result = qword_100034AD8;
  if (!qword_100034AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034AD8);
  }
  return result;
}

uint64_t sub_1000133B4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100013B5C();
  unint64_t v5 = sub_100013C04();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100013420()
{
  unint64_t result = qword_100034AE0;
  if (!qword_100034AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034AE0);
  }
  return result;
}

unint64_t sub_100013478()
{
  unint64_t result = qword_100034AE8;
  if (!qword_100034AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034AE8);
  }
  return result;
}

uint64_t sub_1000134CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001351C@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034310 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100023428();
  uint64_t v3 = sub_100006E28(v2, (uint64_t)qword_10003CC20);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1000135C8(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100013B5C();
  unint64_t v7 = sub_100013BB0();
  unint64_t v8 = sub_100013C04();
  void *v5 = v2;
  v5[1] = sub_10001369C;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_10001369C()
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

uint64_t sub_1000137A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100013818();
  *a1 = result;
  return result;
}

uint64_t sub_1000137CC(uint64_t a1)
{
  unint64_t v2 = sub_100013308();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenMobilePhoneSettingsDynamicDeepLinks()
{
  return &type metadata for OpenMobilePhoneSettingsDynamicDeepLinks;
}

uint64_t sub_100013818()
{
  uint64_t v17 = sub_100023318();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  unint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100004148(&qword_1000345B0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_100004148(&qword_100034570);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100023428();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100004148(&qword_100034AF8);
  sub_100023418();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 19;
  uint64_t v14 = sub_1000230A8();
  id v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_100013B08();
  return sub_100023118();
}

unint64_t sub_100013B08()
{
  unint64_t result = qword_100034B00;
  if (!qword_100034B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034B00);
  }
  return result;
}

unint64_t sub_100013B5C()
{
  unint64_t result = qword_100034B08;
  if (!qword_100034B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034B08);
  }
  return result;
}

unint64_t sub_100013BB0()
{
  unint64_t result = qword_100034B10;
  if (!qword_100034B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034B10);
  }
  return result;
}

unint64_t sub_100013C04()
{
  unint64_t result = qword_100034B18;
  if (!qword_100034B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034B18);
  }
  return result;
}

unint64_t sub_100013C5C()
{
  unint64_t result = qword_100034B20;
  if (!qword_100034B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034B20);
  }
  return result;
}

uint64_t sub_100013CB0()
{
  return sub_1000042F0(&qword_100034B28, &qword_100034B30);
}

uint64_t sub_100013CEC()
{
  uint64_t v0 = sub_100004148(&qword_100034C48);
  sub_100006E60(v0, qword_10003CC38);
  sub_100006E28(v0, (uint64_t)qword_10003CC38);
  sub_100015278();
  return sub_100023368();
}

uint64_t sub_100013D68()
{
  uint64_t v0 = sub_100004148(&qword_100034570);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100023428();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_1000233D8();
  sub_100006E60(v5, qword_10003CC50);
  sub_100006E28(v5, (uint64_t)qword_10003CC50);
  sub_100023418();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_1000233C8();
}

uint64_t sub_100013ED4()
{
  uint64_t v0 = sub_100023428();
  sub_100006E60(v0, qword_10003CC68);
  sub_100006E28(v0, (uint64_t)qword_10003CC68);
  return sub_100023418();
}

uint64_t sub_100013F38()
{
  uint64_t v0 = sub_100004148(&qword_100034600);
  sub_100006E60(v0, qword_10003CC80);
  uint64_t v1 = sub_100006E28(v0, (uint64_t)qword_10003CC80);
  sub_100023248();
  uint64_t v2 = sub_100023258();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100013FF0()
{
  uint64_t result = swift_getKeyPath();
  qword_10003CC98 = result;
  return result;
}

uint64_t sub_100014018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100004148(&qword_1000345D0);
  v3[9] = swift_task_alloc();
  sub_100004148(&qword_1000345D8);
  v3[10] = swift_task_alloc();
  sub_100004148(&qword_100034C80);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_1000230A8();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100004148(&qword_100034C88);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_1000141DC, 0, 0);
}

uint64_t sub_1000141DC()
{
  sub_1000230F8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_100015278();
  *uint64_t v1 = v0;
  v1[1] = sub_1000142B0;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_1000148A8, 0, &type metadata for LiveVoicemailToggleEntity, v2);
}

uint64_t sub_1000142B0()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000143AC, 0, 0);
}

uint64_t sub_1000143AC()
{
  sub_1000230F8();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_1000230F8();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_100034338 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10003CC98;
  *(void *)(v0 + 168) = qword_10003CC98;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_1000042F0(&qword_100034C60, &qword_100034C68);
  *uint64_t v3 = v0;
  v3[1] = sub_100014504;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_100014504()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000050C0;
  }
  else {
    uint64_t v2 = sub_100014658;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100014658()
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
  sub_1000230F8();
  uint64_t v7 = sub_1000233B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_1000233E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100013C5C();
  sub_10001548C();
  sub_100023078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_100023098();
  sub_1000230B8();
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

uint64_t sub_1000148AC()
{
  uint64_t v0 = sub_100004148(&qword_100034C90);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100034338 != -1) {
    swift_once();
  }
  swift_retain();
  sub_1000232A8();
  swift_release();
  sub_10001548C();
  sub_1000042F0(&qword_100034C98, &qword_100034C90);
  sub_100023298();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100014A14()
{
  if (qword_100034338 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100014A74()
{
  unint64_t result = qword_100034B38;
  if (!qword_100034B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034B38);
  }
  return result;
}

unint64_t sub_100014ACC()
{
  unint64_t result = qword_100034B40;
  if (!qword_100034B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034B40);
  }
  return result;
}

uint64_t sub_100014B20()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100014B54()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100014BA4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000069BC(&qword_100034328, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003CC68, a1);
}

uint64_t sub_100014BDC@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034330 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004148(&qword_100034600);
  uint64_t v3 = sub_100006E28(v2, (uint64_t)qword_10003CC80);

  return sub_100007378(v3, a1);
}

uint64_t sub_100014C58(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000073E4;
  return sub_100014018(a1, v5, v4);
}

uint64_t sub_100014D04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100015CF8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100014D2C()
{
  return 0xD00000000000002ALL;
}

unint64_t sub_100014D4C()
{
  unint64_t result = qword_100034B50;
  if (!qword_100034B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034B50);
  }
  return result;
}

uint64_t sub_100014DA4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100014DC4, 0, 0);
}

uint64_t sub_100014DC4()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
  unsigned __int8 v3 = [v2 isCallScreeningEnabled];

  *uint64_t v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100014E60(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100014E84, 0, 0);
}

uint64_t sub_100014E84()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
  [v2 setCallScreeningEnabled:v1];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100014F14(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_100023428();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100014FA4, 0, 0);
}

uint64_t sub_100014FA4()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100004148(&qword_100034B30);
  sub_100023418();
  sub_1000042F0(&qword_100034C60, &qword_100034C68);
  *uint64_t v1 = sub_100023408();
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_1000150C0()
{
  unint64_t result = qword_100034B60;
  if (!qword_100034B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034B60);
  }
  return result;
}

uint64_t sub_100015114(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100015718();
  *uint64_t v4 = v2;
  v4[1] = sub_100005D20;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_1000151C8()
{
  unint64_t result = qword_100034B70;
  if (!qword_100034B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034B70);
  }
  return result;
}

unint64_t sub_100015220()
{
  unint64_t result = qword_100034B78;
  if (!qword_100034B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034B78);
  }
  return result;
}

unint64_t sub_100015278()
{
  unint64_t result = qword_100034B80[0];
  if (!qword_100034B80[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100034B80);
  }
  return result;
}

uint64_t sub_1000152CC(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100015718();
  void *v5 = v2;
  v5[1] = sub_100005FF0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100015380(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100015718();
  *uint64_t v4 = v2;
  v4[1] = sub_1000073E0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100015434()
{
  unint64_t result = qword_100034B98;
  if (!qword_100034B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034B98);
  }
  return result;
}

unint64_t sub_10001548C()
{
  unint64_t result = qword_100034BA0;
  if (!qword_100034BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034BA0);
  }
  return result;
}

unint64_t sub_1000154E4()
{
  unint64_t result = qword_100034BA8;
  if (!qword_100034BA8)
  {
    sub_1000042A8(qword_100034BB0);
    sub_10001548C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034BA8);
  }
  return result;
}

uint64_t sub_100015558(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000150C0();
  void *v5 = v2;
  v5[1] = sub_10000637C;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100015610()
{
  unint64_t result = qword_100034BC8;
  if (!qword_100034BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034BC8);
  }
  return result;
}

unint64_t sub_100015668()
{
  unint64_t result = qword_100034BD0;
  if (!qword_100034BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034BD0);
  }
  return result;
}

unint64_t sub_1000156C0()
{
  unint64_t result = qword_100034BD8;
  if (!qword_100034BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034BD8);
  }
  return result;
}

unint64_t sub_100015718()
{
  unint64_t result = qword_100034BE0;
  if (!qword_100034BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034BE0);
  }
  return result;
}

unint64_t sub_100015770()
{
  unint64_t result = qword_100034BE8;
  if (!qword_100034BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034BE8);
  }
  return result;
}

uint64_t sub_1000157C4@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034318 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004148(&qword_100034C48);
  uint64_t v3 = sub_100006E28(v2, (uint64_t)qword_10003CC38);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100015874()
{
  unint64_t result = qword_100034BF0;
  if (!qword_100034BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034BF0);
  }
  return result;
}

unint64_t sub_1000158CC()
{
  unint64_t result = qword_100034BF8;
  if (!qword_100034BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034BF8);
  }
  return result;
}

unint64_t sub_100015924()
{
  unint64_t result = qword_100034C00;
  if (!qword_100034C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034C00);
  }
  return result;
}

uint64_t sub_100015978@<X0>(uint64_t *a1@<X8>)
{
  sub_1000111F4();
  uint64_t result = sub_1000230D8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000159B8()
{
  sub_100015CA4();
  uint64_t v2 = sub_100023328();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006F18(v3, v0, v2, v1);
}

uint64_t sub_100015A4C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000069BC(&qword_100034320, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10003CC50, a1);
}

uint64_t sub_100015A84()
{
  return sub_1000042F0(&qword_100034C10, &qword_100034C18);
}

uint64_t sub_100015AC0(uint64_t a1)
{
  unint64_t v2 = sub_100015278();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100015B10()
{
  unint64_t result = qword_100034C20;
  if (!qword_100034C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034C20);
  }
  return result;
}

uint64_t sub_100015B64(uint64_t a1)
{
  unint64_t v2 = sub_1000111F4();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100015BB0(uint64_t a1)
{
  unint64_t v2 = sub_100015924();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for LiveVoicemailToggleEntity.LiveVoicemailEntityQuery()
{
  return &type metadata for LiveVoicemailToggleEntity.LiveVoicemailEntityQuery;
}

ValueMetadata *type metadata accessor for LiveVoicemailToggleEntity()
{
  return &type metadata for LiveVoicemailToggleEntity;
}

ValueMetadata *type metadata accessor for LiveVoicemailToggleEntity.UpdateIntent_value()
{
  return &type metadata for LiveVoicemailToggleEntity.UpdateIntent_value;
}

uint64_t sub_100015C2C()
{
  return sub_1000042F0(&qword_100034C28, &qword_100034C30);
}

uint64_t sub_100015C68()
{
  return sub_1000042F0(&qword_100034C38, &qword_100034C30);
}

unint64_t sub_100015CA4()
{
  unint64_t result = qword_100034C40;
  if (!qword_100034C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034C40);
  }
  return result;
}

uint64_t sub_100015CF8()
{
  uint64_t v0 = sub_100004148(&qword_1000345A8);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100023318();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004148(&qword_1000345B0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100004148(&qword_100034570);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_100023428();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100004148(&qword_100034C70);
  sub_100023418();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_1000230A8();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  char v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_100015278();
  uint64_t v19 = v23;
  uint64_t v24 = sub_100023118();
  sub_100004148(&qword_1000345C0);
  sub_100023418();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100023558();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_100023128();
  return v24;
}

uint64_t sub_100016138@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

unint64_t sub_100016148()
{
  unint64_t result = qword_100034CA0;
  if (!qword_100034CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034CA0);
  }
  return result;
}

uint64_t sub_1000161A0()
{
  uint64_t v0 = sub_100023428();
  sub_100006E60(v0, qword_10003CCA0);
  sub_100006E28(v0, (uint64_t)qword_10003CCA0);
  return sub_100023418();
}

unint64_t sub_100016208()
{
  unint64_t result = qword_100034CA8;
  if (!qword_100034CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034CA8);
  }
  return result;
}

uint64_t sub_10001625C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10001689C();
  unint64_t v5 = sub_10000CFD4();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_1000162C8()
{
  unint64_t result = qword_100034CB0;
  if (!qword_100034CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034CB0);
  }
  return result;
}

unint64_t sub_100016320()
{
  unint64_t result = qword_100034CB8;
  if (!qword_100034CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034CB8);
  }
  return result;
}

uint64_t sub_100016374()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000163C4@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034340 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100023428();
  uint64_t v3 = sub_100006E28(v2, (uint64_t)qword_10003CCA0);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10001646C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001689C();
  unint64_t v7 = sub_1000168F0();
  unint64_t v8 = sub_10000CFD4();
  void *v5 = v2;
  v5[1] = sub_10001369C;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100016540@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000165B4();
  *a1 = result;
  return result;
}

uint64_t sub_100016568(uint64_t a1)
{
  unint64_t v2 = sub_100016208();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenFaceTimeSettingsDynamicDeepLinks()
{
  return &type metadata for OpenFaceTimeSettingsDynamicDeepLinks;
}

uint64_t sub_1000165B4()
{
  uint64_t v17 = sub_100023318();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  unint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100004148(&qword_1000345B0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_100004148(&qword_100034570);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100023428();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100004148(&qword_100034CC8);
  sub_100023418();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 15;
  uint64_t v14 = sub_1000230A8();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_10000AF14();
  return sub_100023118();
}

unint64_t sub_10001689C()
{
  unint64_t result = qword_100034CD0;
  if (!qword_100034CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034CD0);
  }
  return result;
}

unint64_t sub_1000168F0()
{
  unint64_t result = qword_100034CD8;
  if (!qword_100034CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034CD8);
  }
  return result;
}

unint64_t sub_100016948()
{
  unint64_t result = qword_100034CE0;
  if (!qword_100034CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034CE0);
  }
  return result;
}

uint64_t sub_10001699C()
{
  return sub_1000042F0(&qword_100034CE8, &qword_100034CF0);
}

uint64_t sub_1000169D8()
{
  uint64_t v0 = sub_100004148(&qword_100034E08);
  sub_100006E60(v0, qword_10003CCB8);
  sub_100006E28(v0, (uint64_t)qword_10003CCB8);
  sub_100017F5C();
  return sub_100023368();
}

uint64_t sub_100016A54()
{
  uint64_t v0 = sub_100004148(&qword_100034570);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100023428();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_1000233D8();
  sub_100006E60(v5, qword_10003CCD0);
  sub_100006E28(v5, (uint64_t)qword_10003CCD0);
  sub_100023418();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_1000233C8();
}

uint64_t sub_100016BC0()
{
  uint64_t v0 = sub_100023428();
  sub_100006E60(v0, qword_10003CCE8);
  sub_100006E28(v0, (uint64_t)qword_10003CCE8);
  return sub_100023418();
}

uint64_t sub_100016C24()
{
  uint64_t v0 = sub_100004148(&qword_100034600);
  sub_100006E60(v0, qword_10003CD00);
  uint64_t v1 = sub_100006E28(v0, (uint64_t)qword_10003CD00);
  sub_100023248();
  uint64_t v2 = sub_100023258();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100016CDC()
{
  uint64_t result = swift_getKeyPath();
  qword_10003CD18 = result;
  return result;
}

uint64_t sub_100016D04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100004148(&qword_1000345D0);
  v3[9] = swift_task_alloc();
  sub_100004148(&qword_1000345D8);
  v3[10] = swift_task_alloc();
  sub_100004148(&qword_100034E40);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_1000230A8();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100004148(&qword_100034E48);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_100016EC8, 0, 0);
}

uint64_t sub_100016EC8()
{
  sub_1000230F8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_100017F5C();
  *uint64_t v1 = v0;
  v1[1] = sub_100016F9C;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100017594, 0, &type metadata for BusinessConnectCallingToggleEntity, v2);
}

uint64_t sub_100016F9C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100017098, 0, 0);
}

uint64_t sub_100017098()
{
  sub_1000230F8();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_1000230F8();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_100034368 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10003CD18;
  *(void *)(v0 + 168) = qword_10003CD18;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_1000042F0(&qword_100034E20, &qword_100034E28);
  *uint64_t v3 = v0;
  v3[1] = sub_1000171F0;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_1000171F0()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000050C0;
  }
  else {
    uint64_t v2 = sub_100017344;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100017344()
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
  sub_1000230F8();
  uint64_t v7 = sub_1000233B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_1000233E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100016948();
  sub_100018170();
  sub_100023078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_100023098();
  sub_1000230B8();
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

uint64_t sub_100017598()
{
  uint64_t v0 = sub_100004148(&qword_100034E50);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100034368 != -1) {
    swift_once();
  }
  swift_retain();
  sub_1000232A8();
  swift_release();
  sub_100018170();
  sub_1000042F0(&qword_100034E58, &qword_100034E50);
  sub_100023298();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100017700()
{
  if (qword_100034368 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100017760()
{
  unint64_t result = qword_100034CF8;
  if (!qword_100034CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034CF8);
  }
  return result;
}

unint64_t sub_1000177B8()
{
  unint64_t result = qword_100034D00;
  if (!qword_100034D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D00);
  }
  return result;
}

uint64_t sub_10001780C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100017840()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100017890@<X0>(uint64_t a1@<X8>)
{
  return sub_1000069BC(&qword_100034358, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003CCE8, a1);
}

uint64_t sub_1000178C8@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034360 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004148(&qword_100034600);
  uint64_t v3 = sub_100006E28(v2, (uint64_t)qword_10003CD00);

  return sub_100007378(v3, a1);
}

uint64_t sub_100017944(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000073E4;
  return sub_100016D04(a1, v5, v4);
}

uint64_t sub_1000179F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000189DC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100017A18()
{
  return 0xD000000000000033;
}

unint64_t sub_100017A38()
{
  unint64_t result = qword_100034D10;
  if (!qword_100034D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D10);
  }
  return result;
}

uint64_t sub_100017A90(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100017AB0, 0, 0);
}

uint64_t sub_100017AB0()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
  unsigned __int8 v3 = [v2 isBusinessConnectCallingEnabled];

  *uint64_t v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100017B4C(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100017B70, 0, 0);
}

uint64_t sub_100017B70()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
  [v2 setBusinessConnectCallingEnabled:v1];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100017C00(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_100023428();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100017C90, 0, 0);
}

uint64_t sub_100017C90()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100004148(&qword_100034CF0);
  sub_100023418();
  sub_1000042F0(&qword_100034E20, &qword_100034E28);
  *uint64_t v1 = sub_100023408();
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_100017DA4()
{
  unint64_t result = qword_100034D20;
  if (!qword_100034D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D20);
  }
  return result;
}

uint64_t sub_100017DF8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000183FC();
  *uint64_t v4 = v2;
  v4[1] = sub_100005D20;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100017EAC()
{
  unint64_t result = qword_100034D30;
  if (!qword_100034D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D30);
  }
  return result;
}

unint64_t sub_100017F04()
{
  unint64_t result = qword_100034D38;
  if (!qword_100034D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D38);
  }
  return result;
}

unint64_t sub_100017F5C()
{
  unint64_t result = qword_100034D40[0];
  if (!qword_100034D40[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100034D40);
  }
  return result;
}

uint64_t sub_100017FB0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000183FC();
  void *v5 = v2;
  v5[1] = sub_100005FF0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100018064(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000183FC();
  *uint64_t v4 = v2;
  v4[1] = sub_1000073E0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100018118()
{
  unint64_t result = qword_100034D58;
  if (!qword_100034D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D58);
  }
  return result;
}

unint64_t sub_100018170()
{
  unint64_t result = qword_100034D60;
  if (!qword_100034D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D60);
  }
  return result;
}

unint64_t sub_1000181C8()
{
  unint64_t result = qword_100034D68;
  if (!qword_100034D68)
  {
    sub_1000042A8(qword_100034D70);
    sub_100018170();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D68);
  }
  return result;
}

uint64_t sub_10001823C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100017DA4();
  void *v5 = v2;
  v5[1] = sub_10000637C;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_1000182F4()
{
  unint64_t result = qword_100034D88;
  if (!qword_100034D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D88);
  }
  return result;
}

unint64_t sub_10001834C()
{
  unint64_t result = qword_100034D90;
  if (!qword_100034D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D90);
  }
  return result;
}

unint64_t sub_1000183A4()
{
  unint64_t result = qword_100034D98;
  if (!qword_100034D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D98);
  }
  return result;
}

unint64_t sub_1000183FC()
{
  unint64_t result = qword_100034DA0;
  if (!qword_100034DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034DA0);
  }
  return result;
}

unint64_t sub_100018454()
{
  unint64_t result = qword_100034DA8;
  if (!qword_100034DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034DA8);
  }
  return result;
}

uint64_t sub_1000184A8@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034348 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004148(&qword_100034E08);
  uint64_t v3 = sub_100006E28(v2, (uint64_t)qword_10003CCB8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100018558()
{
  unint64_t result = qword_100034DB0;
  if (!qword_100034DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034DB0);
  }
  return result;
}

unint64_t sub_1000185B0()
{
  unint64_t result = qword_100034DB8;
  if (!qword_100034DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034DB8);
  }
  return result;
}

unint64_t sub_100018608()
{
  unint64_t result = qword_100034DC0;
  if (!qword_100034DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034DC0);
  }
  return result;
}

uint64_t sub_10001865C@<X0>(uint64_t *a1@<X8>)
{
  sub_100004190();
  uint64_t result = sub_1000230D8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10001869C()
{
  sub_100018988();
  uint64_t v2 = sub_100023328();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006F18(v3, v0, v2, v1);
}

uint64_t sub_100018730@<X0>(uint64_t a1@<X8>)
{
  return sub_1000069BC(&qword_100034350, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10003CCD0, a1);
}

uint64_t sub_100018768()
{
  return sub_1000042F0(&qword_100034DD0, &qword_100034DD8);
}

uint64_t sub_1000187A4(uint64_t a1)
{
  unint64_t v2 = sub_100017F5C();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000187F4()
{
  unint64_t result = qword_100034DE0;
  if (!qword_100034DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034DE0);
  }
  return result;
}

uint64_t sub_100018848(uint64_t a1)
{
  unint64_t v2 = sub_100004190();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100018894(uint64_t a1)
{
  unint64_t v2 = sub_100018608();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for BusinessConnectCallingToggleEntity.BusinessConnectCallingEntityQuery()
{
  return &type metadata for BusinessConnectCallingToggleEntity.BusinessConnectCallingEntityQuery;
}

ValueMetadata *type metadata accessor for BusinessConnectCallingToggleEntity()
{
  return &type metadata for BusinessConnectCallingToggleEntity;
}

ValueMetadata *type metadata accessor for BusinessConnectCallingToggleEntity.UpdateIntent_value()
{
  return &type metadata for BusinessConnectCallingToggleEntity.UpdateIntent_value;
}

uint64_t sub_100018910()
{
  return sub_1000042F0(&qword_100034DE8, &qword_100034DF0);
}

uint64_t sub_10001894C()
{
  return sub_1000042F0(&qword_100034DF8, &qword_100034DF0);
}

unint64_t sub_100018988()
{
  unint64_t result = qword_100034E00;
  if (!qword_100034E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034E00);
  }
  return result;
}

uint64_t sub_1000189DC()
{
  uint64_t v0 = sub_100004148(&qword_1000345A8);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100023318();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004148(&qword_1000345B0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100004148(&qword_100034570);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_100023428();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100004148(&qword_100034E30);
  sub_100023418();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_1000230A8();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  char v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_100017F5C();
  uint64_t v19 = v23;
  uint64_t v24 = sub_100023118();
  sub_100004148(&qword_1000345C0);
  sub_100023418();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100023558();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_100023128();
  return v24;
}

uint64_t sub_100018E1C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_100018E28()
{
  sub_100004148(&qword_100034E60);
  sub_100023228();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100028D10;
  sub_1000165B4();
  sub_100016208();
  sub_100023238();
  sub_1000165B4();
  sub_100023238();
  sub_1000165B4();
  sub_100023238();
  sub_1000165B4();
  sub_100023238();
  sub_100013818();
  sub_100013308();
  sub_100023238();
  sub_100013818();
  sub_100023238();
  sub_100013818();
  uint64_t result = sub_100023238();
  qword_10003CD20 = v0;
  return result;
}

uint64_t sub_100019158(uint64_t a1)
{
  uint64_t v20 = a1;
  uint64_t v1 = sub_100004148(&qword_100034E98);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v23 = v1;
  uint64_t v24 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100023148();
  uint64_t v5 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004148(&qword_100034EA0);
  __chkstk_darwin(v8);
  sub_100016208();
  sub_100023208();
  v25._countAndFlagsBits = 0x206E65704FLL;
  v25._object = (void *)0xE500000000000000;
  sub_1000231F8(v25);
  swift_getKeyPath();
  sub_10000C378();
  sub_100023138();
  swift_release();
  sub_1000231E8();
  swift_release();
  v26._countAndFlagsBits = 544106784;
  v26._object = (void *)0xE400000000000000;
  sub_1000231F8(v26);
  unsigned int v19 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  char v18 = *(void (**)(char *))(v5 + 104);
  uint64_t v9 = v21;
  v18(v7);
  sub_1000231D8();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v5 + 8);
  v16[1] = v5 + 8;
  uint64_t v17 = v10;
  v10(v7, v9);
  v27._countAndFlagsBits = 0x676E697474655320;
  v27._object = (void *)0xE900000000000073;
  sub_1000231F8(v27);
  sub_100023218();
  uint64_t v22 = sub_100023168();
  uint64_t v11 = *(void (**)(char *, uint64_t))(v24 + 8);
  v24 += 8;
  v16[0] = v11;
  v11(v4, v23);
  sub_100023208();
  v28._countAndFlagsBits = 0x20656D20776F6853;
  v28._object = (void *)0xE800000000000000;
  sub_1000231F8(v28);
  swift_getKeyPath();
  sub_100023138();
  swift_release();
  sub_1000231E8();
  swift_release();
  v29._countAndFlagsBits = 544106784;
  v29._object = (void *)0xE400000000000000;
  sub_1000231F8(v29);
  ((void (*)(char *, void, uint64_t))v18)(v7, v19, v9);
  sub_1000231D8();
  v17(v7, v9);
  v30._countAndFlagsBits = 0x676E697474655320;
  v30._object = (void *)0xE900000000000073;
  sub_1000231F8(v30);
  sub_100023218();
  uint64_t v12 = sub_100023168();
  ((void (*)(char *, uint64_t))v16[0])(v4, v23);
  sub_100004148(&qword_100034EA8);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100028D20;
  *(void *)(v13 + 32) = v22;
  *(void *)(v13 + 40) = v12;
  uint64_t v14 = sub_100023158();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1000195D4(uint64_t a1)
{
  return sub_10001B394(a1, (uint64_t)&unk_100028DF8, (void (*)(void))sub_10000C378, (void (*)(uint64_t))sub_100016208);
}

uint64_t sub_10001961C()
{
  uint64_t v15 = sub_100023188();
  uint64_t v14 = sub_100023188();
  uint64_t v13 = sub_100023188();
  uint64_t v12 = sub_100023188();
  uint64_t v0 = sub_100023188();
  uint64_t v1 = sub_100023188();
  uint64_t v2 = sub_100023188();
  uint64_t v3 = sub_100023188();
  uint64_t v4 = sub_100023188();
  uint64_t v5 = sub_100023188();
  uint64_t v6 = sub_100023188();
  uint64_t v7 = sub_100023188();
  uint64_t v8 = sub_100023188();
  sub_100004148(&qword_100034E78);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100028D30;
  *(void *)(v9 + 32) = v15;
  *(void *)(v9 + 40) = v14;
  *(void *)(v9 + 48) = v13;
  *(void *)(v9 + 56) = v12;
  *(void *)(v9 + 64) = v0;
  *(void *)(v9 + 72) = v1;
  *(void *)(v9 + 80) = v2;
  *(void *)(v9 + 88) = v3;
  *(void *)(v9 + 96) = v4;
  *(void *)(v9 + 104) = v5;
  *(void *)(v9 + 112) = v6;
  *(void *)(v9 + 120) = v7;
  *(void *)(v9 + 128) = v8;
  uint64_t v10 = sub_100023178();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100019880()
{
  uint64_t v0 = sub_100004148(&qword_100034E98);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100023148();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004148(&qword_100034EA0);
  __chkstk_darwin(v8);
  sub_100016208();
  sub_100023208();
  v14._object = (void *)0x80000001000251C0;
  v14._countAndFlagsBits = 0xD000000000000010;
  sub_1000231F8(v14);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v4);
  sub_1000231D8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v15._countAndFlagsBits = 0x676E697474655320;
  v15._object = (void *)0xE900000000000073;
  sub_1000231F8(v15);
  sub_100023218();
  uint64_t v9 = sub_100023168();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100004148(&qword_100034EA8);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100026CE0;
  *(void *)(v10 + 32) = v9;
  uint64_t v11 = sub_100023158();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100019B40(uint64_t a1)
{
  return sub_10001B394(a1, (uint64_t)&unk_100028DF8, (void (*)(void))sub_10000C378, (void (*)(uint64_t))sub_100016208);
}

uint64_t sub_100019B88()
{
  uint64_t v16 = sub_100023188();
  uint64_t v15 = sub_100023188();
  uint64_t v14 = sub_100023188();
  uint64_t v13 = sub_100023188();
  uint64_t v12 = sub_100023188();
  uint64_t v0 = sub_100023188();
  uint64_t v1 = sub_100023188();
  uint64_t v2 = sub_100023188();
  uint64_t v3 = sub_100023188();
  uint64_t v4 = sub_100023188();
  uint64_t v5 = sub_100023188();
  uint64_t v6 = sub_100023188();
  uint64_t v7 = sub_100023188();
  uint64_t v8 = sub_100023188();
  sub_100004148(&qword_100034E78);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100028D40;
  *(void *)(v9 + 32) = v16;
  *(void *)(v9 + 40) = v15;
  *(void *)(v9 + 48) = v14;
  *(void *)(v9 + 56) = v13;
  *(void *)(v9 + 64) = v12;
  *(void *)(v9 + 72) = v0;
  *(void *)(v9 + 80) = v1;
  *(void *)(v9 + 88) = v2;
  *(void *)(v9 + 96) = v3;
  *(void *)(v9 + 104) = v4;
  *(void *)(v9 + 112) = v5;
  *(void *)(v9 + 120) = v6;
  *(void *)(v9 + 128) = v7;
  *(void *)(v9 + 136) = v8;
  uint64_t v10 = sub_100023178();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100019E0C()
{
  uint64_t v0 = sub_100004148(&qword_100034E98);
  uint64_t v12 = *(void *)(v0 - 8);
  uint64_t v13 = v0;
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100023148();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004148(&qword_100034EA0);
  __chkstk_darwin(v7);
  sub_100016208();
  sub_100023208();
  v14._countAndFlagsBits = 2126665;
  v14._object = (void *)0xE300000000000000;
  sub_1000231F8(v14);
  swift_getKeyPath();
  sub_10000C378();
  sub_100023138();
  swift_release();
  sub_1000231E8();
  swift_release();
  v15._countAndFlagsBits = 0x2064656E72757420;
  v15._object = (void *)0xEE00206E69206E6FLL;
  sub_1000231F8(v15);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v3);
  sub_1000231D8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v16._countAndFlagsBits = 63;
  v16._object = (void *)0xE100000000000000;
  sub_1000231F8(v16);
  sub_100023218();
  uint64_t v8 = sub_100023168();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v2, v13);
  sub_100004148(&qword_100034EA8);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100026CE0;
  *(void *)(v9 + 32) = v8;
  uint64_t v10 = sub_100023158();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10001A12C(uint64_t a1)
{
  return sub_10001B394(a1, (uint64_t)&unk_100028DF8, (void (*)(void))sub_10000C378, (void (*)(uint64_t))sub_100016208);
}

uint64_t sub_10001A174()
{
  uint64_t v0 = sub_100023188();
  uint64_t v1 = sub_100023188();
  uint64_t v2 = sub_100023188();
  uint64_t v3 = sub_100023188();
  uint64_t v4 = sub_100023188();
  uint64_t v5 = sub_100023188();
  uint64_t v6 = sub_100023188();
  sub_100004148(&qword_100034E78);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100028D10;
  *(void *)(v7 + 32) = v0;
  *(void *)(v7 + 40) = v1;
  *(void *)(v7 + 48) = v2;
  *(void *)(v7 + 56) = v3;
  *(void *)(v7 + 64) = v4;
  *(void *)(v7 + 72) = v5;
  *(void *)(v7 + 80) = v6;
  uint64_t v8 = sub_100023178();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_10001A2E8()
{
  uint64_t v0 = sub_100004148(&qword_100034E98);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100023148();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004148(&qword_100034EA0);
  __chkstk_darwin(v8);
  sub_100016208();
  sub_100023208();
  v14._countAndFlagsBits = 2126665;
  v14._object = (void *)0xE300000000000000;
  sub_1000231F8(v14);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v4);
  sub_1000231D8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v15._countAndFlagsBits = 1064202016;
  v15._object = (void *)0xE400000000000000;
  sub_1000231F8(v15);
  sub_100023218();
  uint64_t v9 = sub_100023168();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100004148(&qword_100034EA8);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100026CE0;
  *(void *)(v10 + 32) = v9;
  uint64_t v11 = sub_100023158();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10001A590(uint64_t a1)
{
  return sub_10001B394(a1, (uint64_t)&unk_100028DF8, (void (*)(void))sub_10000C378, (void (*)(uint64_t))sub_100016208);
}

uint64_t sub_10001A5D8()
{
  return sub_10001AFC0();
}

uint64_t sub_10001A5FC()
{
  uint64_t v0 = sub_100004148(&qword_100034E80);
  uint64_t v12 = *(void *)(v0 - 8);
  uint64_t v13 = v0;
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100023148();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004148(&qword_100034E88);
  __chkstk_darwin(v7);
  sub_100013308();
  sub_100023208();
  v14._countAndFlagsBits = 0x206E65704FLL;
  v14._object = (void *)0xE500000000000000;
  sub_1000231F8(v14);
  swift_getKeyPath();
  sub_10001B844();
  sub_100023138();
  swift_release();
  sub_1000231E8();
  swift_release();
  v15._countAndFlagsBits = 544106784;
  v15._object = (void *)0xE400000000000000;
  sub_1000231F8(v15);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v3);
  sub_1000231D8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v16._countAndFlagsBits = 0x7465532070706120;
  v16._object = (void *)0xED000073676E6974;
  sub_1000231F8(v16);
  sub_100023218();
  uint64_t v8 = sub_100023168();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v2, v13);
  sub_100004148(&qword_100034E90);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100026CE0;
  *(void *)(v9 + 32) = v8;
  uint64_t v10 = sub_100023158();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10001A924(uint64_t a1)
{
  return sub_10001B394(a1, (uint64_t)&unk_100028DD0, (void (*)(void))sub_10001B844, (void (*)(uint64_t))sub_100013308);
}

uint64_t sub_10001A96C()
{
  uint64_t v21 = sub_100023188();
  uint64_t v20 = sub_100023188();
  uint64_t v19 = sub_100023188();
  uint64_t v18 = sub_100023188();
  uint64_t v17 = sub_100023188();
  uint64_t v16 = sub_100023188();
  uint64_t v15 = sub_100023188();
  uint64_t v14 = sub_100023188();
  uint64_t v13 = sub_100023188();
  uint64_t v12 = sub_100023188();
  uint64_t v0 = sub_100023188();
  uint64_t v1 = sub_100023188();
  uint64_t v2 = sub_100023188();
  uint64_t v3 = sub_100023188();
  uint64_t v4 = sub_100023188();
  uint64_t v5 = sub_100023188();
  uint64_t v6 = sub_100023188();
  uint64_t v7 = sub_100023188();
  uint64_t v8 = sub_100023188();
  sub_100004148(&qword_100034E78);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100028D50;
  *(void *)(v9 + 32) = v21;
  *(void *)(v9 + 40) = v20;
  *(void *)(v9 + 48) = v19;
  *(void *)(v9 + 56) = v18;
  *(void *)(v9 + 64) = v17;
  *(void *)(v9 + 72) = v16;
  *(void *)(v9 + 80) = v15;
  *(void *)(v9 + 88) = v14;
  *(void *)(v9 + 96) = v13;
  *(void *)(v9 + 104) = v12;
  *(void *)(v9 + 112) = v0;
  *(void *)(v9 + 120) = v1;
  *(void *)(v9 + 128) = v2;
  *(void *)(v9 + 136) = v3;
  *(void *)(v9 + 144) = v4;
  *(void *)(v9 + 152) = v5;
  *(void *)(v9 + 160) = v6;
  *(void *)(v9 + 168) = v7;
  *(void *)(v9 + 176) = v8;
  uint64_t v10 = sub_100023178();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10001ACA4()
{
  uint64_t v0 = sub_100004148(&qword_100034E80);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100023148();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004148(&qword_100034E88);
  __chkstk_darwin(v8);
  sub_100013308();
  sub_100023208();
  v14._object = (void *)0x80000001000251C0;
  v14._countAndFlagsBits = 0xD000000000000010;
  sub_1000231F8(v14);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v4);
  sub_1000231D8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v15._countAndFlagsBits = 0x676E697474655320;
  v15._object = (void *)0xEA00000000003F73;
  sub_1000231F8(v15);
  sub_100023218();
  uint64_t v9 = sub_100023168();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100004148(&qword_100034E90);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100026CE0;
  *(void *)(v10 + 32) = v9;
  uint64_t v11 = sub_100023158();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10001AF64(uint64_t a1)
{
  return sub_10001B394(a1, (uint64_t)&unk_100028DD0, (void (*)(void))sub_10001B844, (void (*)(uint64_t))sub_100013308);
}

uint64_t sub_10001AFAC()
{
  return sub_10001AFC0();
}

uint64_t sub_10001AFC0()
{
  uint64_t v0 = sub_100023188();
  sub_100004148(&qword_100034E78);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100026CE0;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_100023178();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_10001B024()
{
  uint64_t v0 = sub_100004148(&qword_100034E80);
  uint64_t v12 = *(void *)(v0 - 8);
  uint64_t v13 = v0;
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100023148();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004148(&qword_100034E88);
  __chkstk_darwin(v7);
  sub_100013308();
  sub_100023208();
  v14._countAndFlagsBits = 2126665;
  v14._object = (void *)0xE300000000000000;
  sub_1000231F8(v14);
  swift_getKeyPath();
  sub_10001B844();
  sub_100023138();
  swift_release();
  sub_1000231E8();
  swift_release();
  v15._countAndFlagsBits = 0x2064656E72757420;
  v15._object = (void *)0xEE00206E69206E6FLL;
  sub_1000231F8(v15);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v3);
  sub_1000231D8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v16._countAndFlagsBits = 0x3F70706120;
  v16._object = (void *)0xE500000000000000;
  sub_1000231F8(v16);
  sub_100023218();
  uint64_t v8 = sub_100023168();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v2, v13);
  sub_100004148(&qword_100034E90);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100026CE0;
  *(void *)(v9 + 32) = v8;
  uint64_t v10 = sub_100023158();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10001B34C(uint64_t a1)
{
  return sub_10001B394(a1, (uint64_t)&unk_100028DD0, (void (*)(void))sub_10001B844, (void (*)(uint64_t))sub_100013308);
}

uint64_t sub_10001B394(uint64_t a1, uint64_t a2, void (*a3)(void), void (*a4)(uint64_t))
{
  uint64_t v6 = sub_1000231C8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  a3();
  sub_100023138();
  uint64_t v10 = swift_release();
  a4(v10);
  sub_1000231B8();
  uint64_t v11 = sub_1000231A8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_100004148(&qword_100034E70);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100026CE0;
  *(void *)(v12 + 32) = v11;
  uint64_t v13 = sub_100023198();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_10001B50C()
{
  uint64_t v14 = sub_100023188();
  uint64_t v13 = sub_100023188();
  uint64_t v12 = sub_100023188();
  uint64_t v0 = sub_100023188();
  uint64_t v1 = sub_100023188();
  uint64_t v2 = sub_100023188();
  uint64_t v3 = sub_100023188();
  uint64_t v4 = sub_100023188();
  uint64_t v5 = sub_100023188();
  uint64_t v6 = sub_100023188();
  uint64_t v7 = sub_100023188();
  uint64_t v8 = sub_100023188();
  sub_100004148(&qword_100034E78);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100028D60;
  *(void *)(v9 + 32) = v14;
  *(void *)(v9 + 40) = v13;
  *(void *)(v9 + 48) = v12;
  *(void *)(v9 + 56) = v0;
  *(void *)(v9 + 64) = v1;
  *(void *)(v9 + 72) = v2;
  *(void *)(v9 + 80) = v3;
  *(void *)(v9 + 88) = v4;
  *(void *)(v9 + 96) = v5;
  *(void *)(v9 + 104) = v6;
  *(void *)(v9 + 112) = v7;
  *(void *)(v9 + 120) = v8;
  uint64_t v10 = sub_100023178();
  swift_bridgeObjectRelease();
  return v10;
}

void sub_10001B744()
{
  qword_10003CD28 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_10001B758(uint64_t a1, uint64_t a2)
{
  return sub_10001B7A4(a1, a2, &qword_100034370);
}

uint64_t sub_10001B780(uint64_t a1, uint64_t a2)
{
  return sub_10001B7A4(a1, a2, &qword_100034378);
}

uint64_t sub_10001B7A4(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for PFTAssistantIntentsProvider()
{
  return &type metadata for PFTAssistantIntentsProvider;
}

uint64_t sub_10001B804@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000230F8();
  *a1 = v3;
  return result;
}

unint64_t sub_10001B844()
{
  unint64_t result = qword_100034E68;
  if (!qword_100034E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034E68);
  }
  return result;
}

uint64_t sub_10001B89C()
{
  return sub_100023108();
}

unint64_t sub_10001B8DC()
{
  unint64_t result = qword_100034EB0;
  if (!qword_100034EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034EB0);
  }
  return result;
}

uint64_t sub_10001B930()
{
  return sub_1000042F0(&qword_100034EB8, &qword_100034EC0);
}

uint64_t sub_10001B96C()
{
  uint64_t v0 = sub_100004148(&qword_100034FD8);
  sub_100006E60(v0, qword_10003CD30);
  sub_100006E28(v0, (uint64_t)qword_10003CD30);
  sub_10001CEF8();
  return sub_100023368();
}

uint64_t sub_10001B9E8()
{
  uint64_t v0 = sub_100004148(&qword_100034570);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100023428();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_1000233D8();
  sub_100006E60(v5, qword_10003CD48);
  sub_100006E28(v5, (uint64_t)qword_10003CD48);
  sub_100023418();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_1000233C8();
}

uint64_t sub_10001BB54()
{
  uint64_t v0 = sub_100023428();
  sub_100006E60(v0, qword_10003CD60);
  sub_100006E28(v0, (uint64_t)qword_10003CD60);
  return sub_100023418();
}

uint64_t sub_10001BBB8()
{
  uint64_t v0 = sub_100004148(&qword_100034600);
  sub_100006E60(v0, qword_10003CD78);
  uint64_t v1 = sub_100006E28(v0, (uint64_t)qword_10003CD78);
  sub_100023248();
  uint64_t v2 = sub_100023258();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10001BC70()
{
  uint64_t result = swift_getKeyPath();
  qword_10003CD90 = result;
  return result;
}

uint64_t sub_10001BC98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100004148(&qword_1000345D0);
  v3[9] = swift_task_alloc();
  sub_100004148(&qword_1000345D8);
  v3[10] = swift_task_alloc();
  sub_100004148(&qword_100035010);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_1000230A8();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100004148(&qword_100035018);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_10001BE5C, 0, 0);
}

uint64_t sub_10001BE5C()
{
  sub_1000230F8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_10001CEF8();
  *uint64_t v1 = v0;
  v1[1] = sub_10001BF30;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_10001C528, 0, &type metadata for BrandedCallingPrimaryToggleEntity, v2);
}

uint64_t sub_10001BF30()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001C02C, 0, 0);
}

uint64_t sub_10001C02C()
{
  sub_1000230F8();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_1000230F8();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_1000343A0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10003CD90;
  *(void *)(v0 + 168) = qword_10003CD90;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_1000042F0(&qword_100034FF0, &qword_100034FF8);
  *uint64_t v3 = v0;
  v3[1] = sub_10001C184;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_10001C184()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000050C0;
  }
  else {
    uint64_t v2 = sub_10001C2D8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001C2D8()
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
  sub_1000230F8();
  uint64_t v7 = sub_1000233B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_1000233E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_10001B8DC();
  sub_10001D10C();
  sub_100023078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_100023098();
  sub_1000230B8();
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

uint64_t sub_10001C52C()
{
  uint64_t v0 = sub_100004148(&qword_100035020);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000343A0 != -1) {
    swift_once();
  }
  swift_retain();
  sub_1000232A8();
  swift_release();
  sub_10001D10C();
  sub_1000042F0(&qword_100035028, &qword_100035020);
  sub_100023298();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10001C694()
{
  if (qword_1000343A0 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10001C6F4()
{
  unint64_t result = qword_100034EC8;
  if (!qword_100034EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034EC8);
  }
  return result;
}

unint64_t sub_10001C74C()
{
  unint64_t result = qword_100034ED0;
  if (!qword_100034ED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034ED0);
  }
  return result;
}

uint64_t sub_10001C7A0()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10001C7D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001C824@<X0>(uint64_t a1@<X8>)
{
  return sub_1000069BC(&qword_100034390, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003CD60, a1);
}

uint64_t sub_10001C85C@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034398 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004148(&qword_100034600);
  uint64_t v3 = sub_100006E28(v2, (uint64_t)qword_10003CD78);

  return sub_100007378(v3, a1);
}

uint64_t sub_10001C8D8(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000073E4;
  return sub_10001BC98(a1, v5, v4);
}

uint64_t sub_10001C984@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001D978();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10001C9AC()
{
  return 0xD000000000000032;
}

unint64_t sub_10001C9CC()
{
  unint64_t result = qword_100034EE0;
  if (!qword_100034EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034EE0);
  }
  return result;
}

uint64_t sub_10001CA24(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10001CA44, 0, 0);
}

uint64_t sub_10001CA44()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
  unsigned __int8 v3 = [v2 isBrandedCallingEnabled:1];

  *uint64_t v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10001CAE4(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_10001CB08, 0, 0);
}

uint64_t sub_10001CB08()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
  [v2 setBrandedCallingEnabled:v1 primary:1];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10001CB9C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_100023428();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_10001CC2C, 0, 0);
}

uint64_t sub_10001CC2C()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100004148(&qword_100034EC0);
  sub_100023418();
  sub_1000042F0(&qword_100034FF0, &qword_100034FF8);
  *uint64_t v1 = sub_100023408();
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_10001CD40()
{
  unint64_t result = qword_100034EF0;
  if (!qword_100034EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034EF0);
  }
  return result;
}

uint64_t sub_10001CD94(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10001D398();
  *uint64_t v4 = v2;
  v4[1] = sub_100005D20;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10001CE48()
{
  unint64_t result = qword_100034F00;
  if (!qword_100034F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034F00);
  }
  return result;
}

unint64_t sub_10001CEA0()
{
  unint64_t result = qword_100034F08;
  if (!qword_100034F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034F08);
  }
  return result;
}

unint64_t sub_10001CEF8()
{
  unint64_t result = qword_100034F10[0];
  if (!qword_100034F10[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100034F10);
  }
  return result;
}

uint64_t sub_10001CF4C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001D398();
  void *v5 = v2;
  v5[1] = sub_100005FF0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10001D000(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10001D398();
  *uint64_t v4 = v2;
  v4[1] = sub_1000073E0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10001D0B4()
{
  unint64_t result = qword_100034F28;
  if (!qword_100034F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034F28);
  }
  return result;
}

unint64_t sub_10001D10C()
{
  unint64_t result = qword_100034F30;
  if (!qword_100034F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034F30);
  }
  return result;
}

unint64_t sub_10001D164()
{
  unint64_t result = qword_100034F38;
  if (!qword_100034F38)
  {
    sub_1000042A8(qword_100034F40);
    sub_10001D10C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034F38);
  }
  return result;
}

uint64_t sub_10001D1D8(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001CD40();
  void *v5 = v2;
  v5[1] = sub_10000637C;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_10001D290()
{
  unint64_t result = qword_100034F58;
  if (!qword_100034F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034F58);
  }
  return result;
}

unint64_t sub_10001D2E8()
{
  unint64_t result = qword_100034F60;
  if (!qword_100034F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034F60);
  }
  return result;
}

unint64_t sub_10001D340()
{
  unint64_t result = qword_100034F68;
  if (!qword_100034F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034F68);
  }
  return result;
}

unint64_t sub_10001D398()
{
  unint64_t result = qword_100034F70;
  if (!qword_100034F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034F70);
  }
  return result;
}

unint64_t sub_10001D3F0()
{
  unint64_t result = qword_100034F78;
  if (!qword_100034F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034F78);
  }
  return result;
}

uint64_t sub_10001D444@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034380 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004148(&qword_100034FD8);
  uint64_t v3 = sub_100006E28(v2, (uint64_t)qword_10003CD30);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_10001D4F4()
{
  unint64_t result = qword_100034F80;
  if (!qword_100034F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034F80);
  }
  return result;
}

unint64_t sub_10001D54C()
{
  unint64_t result = qword_100034F88;
  if (!qword_100034F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034F88);
  }
  return result;
}

unint64_t sub_10001D5A4()
{
  unint64_t result = qword_100034F90;
  if (!qword_100034F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034F90);
  }
  return result;
}

uint64_t sub_10001D5F8@<X0>(uint64_t *a1@<X8>)
{
  sub_100007A54();
  uint64_t result = sub_1000230D8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10001D638()
{
  sub_10001D924();
  uint64_t v2 = sub_100023328();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006F18(v3, v0, v2, v1);
}

uint64_t sub_10001D6CC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000069BC(&qword_100034388, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10003CD48, a1);
}

uint64_t sub_10001D704()
{
  return sub_1000042F0(&qword_100034FA0, &qword_100034FA8);
}

uint64_t sub_10001D740(uint64_t a1)
{
  unint64_t v2 = sub_10001CEF8();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001D790()
{
  unint64_t result = qword_100034FB0;
  if (!qword_100034FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034FB0);
  }
  return result;
}

uint64_t sub_10001D7E4(uint64_t a1)
{
  unint64_t v2 = sub_100007A54();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_10001D830(uint64_t a1)
{
  unint64_t v2 = sub_10001D5A4();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for BrandedCallingPrimaryToggleEntity.BrandedCallingPrimaryEntityQuery()
{
  return &type metadata for BrandedCallingPrimaryToggleEntity.BrandedCallingPrimaryEntityQuery;
}

ValueMetadata *type metadata accessor for BrandedCallingPrimaryToggleEntity()
{
  return &type metadata for BrandedCallingPrimaryToggleEntity;
}

ValueMetadata *type metadata accessor for BrandedCallingPrimaryToggleEntity.UpdateIntent_value()
{
  return &type metadata for BrandedCallingPrimaryToggleEntity.UpdateIntent_value;
}

uint64_t sub_10001D8AC()
{
  return sub_1000042F0(&qword_100034FB8, &qword_100034FC0);
}

uint64_t sub_10001D8E8()
{
  return sub_1000042F0(&qword_100034FC8, &qword_100034FC0);
}

unint64_t sub_10001D924()
{
  unint64_t result = qword_100034FD0;
  if (!qword_100034FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034FD0);
  }
  return result;
}

uint64_t sub_10001D978()
{
  uint64_t v0 = sub_100004148(&qword_1000345A8);
  __chkstk_darwin(v0 - 8);
  Swift::String v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100023318();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004148(&qword_1000345B0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100004148(&qword_100034570);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_100023428();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100004148(&qword_100035000);
  sub_100023418();
  Swift::String v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_1000230A8();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  Swift::String v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_10001CEF8();
  uint64_t v19 = v23;
  uint64_t v24 = sub_100023118();
  sub_100004148(&qword_1000345C0);
  sub_100023418();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100023558();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_100023128();
  return v24;
}

uint64_t sub_10001DDB8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

unint64_t sub_10001DDC8()
{
  unint64_t result = qword_100035030;
  if (!qword_100035030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035030);
  }
  return result;
}

unint64_t sub_10001DE20()
{
  unint64_t result = qword_100035038[0];
  if (!qword_100035038[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100035038);
  }
  return result;
}

uint64_t sub_10001DE78@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v3 = sub_100004148(&qword_100034868);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v37 - v8;
  __chkstk_darwin(v7);
  v38 = (char *)&v37 - v10;
  uint64_t v11 = sub_100004148(&qword_100034570);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v37 - v16;
  __chkstk_darwin(v15);
  v37 = (char *)&v37 - v18;
  uint64_t v39 = sub_100023428();
  uint64_t v19 = *(void *)(v39 - 8);
  uint64_t v20 = __chkstk_darwin(v39);
  uint64_t v21 = __chkstk_darwin(v20);
  uint64_t v22 = __chkstk_darwin(v21);
  uint64_t v23 = __chkstk_darwin(v22);
  uint64_t v24 = __chkstk_darwin(v23);
  __chkstk_darwin(v24);
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
      sub_100023418();
      uint64_t v33 = v37;
      sub_100023418();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v33, 0, 1, v39);
      v34 = v38;
      sub_1000232B8();
      uint64_t v35 = sub_1000232C8();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v34, 0, 1, v35);
      goto LABEL_7;
    case 5:
      TUDeviceHasChinaSKU();
      sub_100023418();
      TUDeviceHasChinaSKU();
      sub_100023418();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v17, 0, 1, v39);
      sub_1000232B8();
      uint64_t v28 = sub_1000232C8();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v9, 0, 1, v28);
      TUDeviceHasChinaSKU();
      goto LABEL_7;
    case 6:
      sub_100023418();
      sub_100023418();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v14, 0, 1, v39);
      sub_1000232B8();
      uint64_t v29 = sub_1000232C8();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v6, 0, 1, v29);
      TUDeviceHasChinaSKU();
LABEL_7:
      sub_100023418();
      break;
    case 7:
      sub_100023418();
      Swift::String v30 = v37;
      sub_100023418();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v30, 0, 1, v39);
      uint64_t v31 = v38;
      sub_1000232B8();
      uint64_t v32 = sub_1000232C8();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v31, 0, 1, v32);
      sub_100004148(&qword_100034870);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100026CE0;
      sub_100023418();
      sub_100023418();
      break;
    default:
      sub_100023418();
      uint64_t v25 = v37;
      sub_100023418();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v25, 0, 1, v39);
      Swift::String v26 = v38;
      sub_1000232B8();
      uint64_t v27 = sub_1000232C8();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v26, 0, 1, v27);
      sub_100004148(&qword_100034870);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100029480;
      sub_100023418();
      sub_100023418();
      sub_100023418();
      sub_100023418();
      break;
  }
  return sub_1000232D8();
}

uint64_t sub_10001F454()
{
  uint64_t v0 = sub_100004148(&qword_100034570);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100023428();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_1000233D8();
  sub_100006E60(v5, qword_10003CD98);
  sub_100006E28(v5, (uint64_t)qword_10003CD98);
  sub_100023418();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_1000233C8();
}

uint64_t sub_10001F5C8(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100035120 + dword_100035120);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005FF0;
  return v5(a1);
}

uint64_t sub_10001F670(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100035118 + dword_100035118);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1000073E0;
  return v4();
}

unint64_t sub_10001F718()
{
  unint64_t result = qword_100035050;
  if (!qword_100035050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035050);
  }
  return result;
}

uint64_t sub_10001F76C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100035108 + dword_100035108);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100005D20;
  return v4();
}

unint64_t sub_10001F814()
{
  unint64_t result = qword_100035060;
  if (!qword_100035060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035060);
  }
  return result;
}

unint64_t sub_10001F870()
{
  unint64_t result = qword_100035068;
  if (!qword_100035068)
  {
    sub_1000042A8(qword_100035070);
    sub_10001B844();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035068);
  }
  return result;
}

uint64_t sub_10001F8E4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001F718();
  void *v5 = v2;
  v5[1] = sub_10000637C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10001F998(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000350F8 + dword_1000350F8);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10000C59C;
  return v4();
}

unint64_t sub_10001FA40()
{
  unint64_t result = qword_100035088;
  if (!qword_100035088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035088);
  }
  return result;
}

uint64_t sub_10001FA94()
{
  uint64_t v0 = sub_100004148(&qword_1000350E8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004148(&qword_1000350F0);
  __chkstk_darwin(v4);
  sub_100013B08();
  sub_100023398();
  v7._object = (void *)0x8000000100025BA0;
  v7._countAndFlagsBits = 0xD000000000000043;
  sub_100023388(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for _EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_100023378();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_100023388(v8);
  return sub_1000233A8();
}

unint64_t sub_10001FC54()
{
  unint64_t result = qword_100035090;
  if (!qword_100035090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035090);
  }
  return result;
}

unint64_t sub_10001FCAC()
{
  unint64_t result = qword_100035098;
  if (!qword_100035098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035098);
  }
  return result;
}

unint64_t sub_10001FD04()
{
  unint64_t result = qword_1000350A0;
  if (!qword_1000350A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000350A0);
  }
  return result;
}

uint64_t sub_10001FD58()
{
  sub_100013C04();
  uint64_t v2 = sub_100023328();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006F18(v3, v0, v2, v1);
}

unint64_t sub_10001FDF0()
{
  unint64_t result = qword_1000350B0;
  if (!qword_1000350B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000350B0);
  }
  return result;
}

unint64_t sub_10001FE48()
{
  unint64_t result = qword_1000350B8;
  if (!qword_1000350B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000350B8);
  }
  return result;
}

unint64_t sub_10001FEA0()
{
  unint64_t result = qword_1000350C0;
  if (!qword_1000350C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000350C0);
  }
  return result;
}

unint64_t sub_10001FEF8()
{
  unint64_t result = qword_1000350C8;
  if (!qword_1000350C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000350C8);
  }
  return result;
}

uint64_t sub_10001FF4C@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000343A8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000233D8();
  uint64_t v3 = sub_100006E28(v2, (uint64_t)qword_10003CD98);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_10001FFF8()
{
  unint64_t result = qword_1000350D0;
  if (!qword_1000350D0)
  {
    sub_1000042A8(&qword_1000350D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000350D0);
  }
  return result;
}

uint64_t sub_100020054(uint64_t a1)
{
  unint64_t v2 = sub_100013B08();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000200A4()
{
  unint64_t result = qword_1000350E0;
  if (!qword_1000350E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000350E0);
  }
  return result;
}

uint64_t sub_1000200F8@<X0>(uint64_t a1@<X8>)
{
  return sub_10001DE78(*v1, a1);
}

uint64_t sub_100020100(uint64_t a1)
{
  unint64_t v2 = sub_10001FEA0();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for MobilePhoneSettingsDynamicDeepLinks.AvailableMobilePhoneSettingsDynamicDestinationQuery()
{
  return &type metadata for MobilePhoneSettingsDynamicDeepLinks.AvailableMobilePhoneSettingsDynamicDestinationQuery;
}

unsigned char *storeEnumTagSinglePayload for MobilePhoneSettingsDynamicDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100020228);
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

ValueMetadata *type metadata accessor for MobilePhoneSettingsDynamicDeepLinks()
{
  return &type metadata for MobilePhoneSettingsDynamicDeepLinks;
}

char *sub_100020260(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100020300(a1, a2, a3, *v3, &qword_100035130);
  *int v3 = result;
  return result;
}

char *sub_100020288(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100020300(a1, a2, a3, *v3, &qword_100035128);
  *int v3 = result;
  return result;
}

char *sub_1000202B0(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100020300(a1, a2, a3, *v3, &qword_100035110);
  *int v3 = result;
  return result;
}

char *sub_1000202D8(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100020300(a1, a2, a3, *v3, &qword_100035100);
  *int v3 = result;
  return result;
}

char *sub_100020300(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
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
    sub_100004148(a5);
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

uint64_t sub_1000203E8(uint64_t result)
{
  unint64_t v1 = 0;
  unint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = result + 32;
LABEL_2:
  if (v1 <= v2) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = v1;
  }
  while (1)
  {
    if (v2 == v1) {
      return (uint64_t)_swiftEmptyArrayStorage;
    }
    if (v4 == v1) {
      break;
    }
    char v5 = *(unsigned char *)(v3 + v1++);
    unint64_t result = sub_1000124C4(v5);
    if (result)
    {
      unint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0) {
        unint64_t result = (uint64_t)sub_1000202D8(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v7 = _swiftEmptyArrayStorage[2];
      unint64_t v6 = _swiftEmptyArrayStorage[3];
      if (v7 >= v6 >> 1) {
        unint64_t result = (uint64_t)sub_1000202D8((char *)(v6 > 1), v7 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v7 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage[4] + v7) = v5;
      goto LABEL_2;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1000204E0()
{
  return _swift_task_switch(sub_1000204FC, 0, 0);
}

uint64_t sub_1000204FC()
{
  uint64_t v1 = 19;
  sub_1000202B0(0, 19, 0);
  unint64_t v2 = _swiftEmptyArrayStorage;
  unint64_t v3 = _swiftEmptyArrayStorage[2];
  unint64_t v4 = &byte_100031288;
  do
  {
    char v6 = *v4++;
    char v5 = v6;
    int64_t v10 = v2;
    unint64_t v7 = v2[3];
    if (v3 >= v7 >> 1)
    {
      sub_1000202B0((char *)(v7 > 1), v3 + 1, 1);
      unint64_t v2 = v10;
    }
    v2[2] = v3 + 1;
    *((unsigned char *)v2 + v3++ + 32) = v5;
    --v1;
  }
  while (v1);
  int64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_100020600()
{
  return _swift_task_switch(sub_10002061C, 0, 0);
}

uint64_t sub_10002061C()
{
  uint64_t v1 = sub_1000203E8((uint64_t)&off_100031268);
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    sub_1000202B0(0, v2, 0);
    uint64_t v3 = 0;
    uint64_t v4 = _swiftEmptyArrayStorage[2];
    do
    {
      char v5 = *(unsigned char *)(v1 + v3 + 32);
      unint64_t v6 = _swiftEmptyArrayStorage[3];
      if (v4 + v3 >= v6 >> 1) {
        sub_1000202B0((char *)(v6 > 1), v4 + v3 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v4 + v3 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage[4] + v4 + v3++) = v5;
    }
    while (v2 != v3);
  }
  swift_bridgeObjectRelease();
  unint64_t v7 = *(uint64_t (**)(void *))(v0 + 8);
  return v7(_swiftEmptyArrayStorage);
}

uint64_t sub_10002075C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10002077C, 0, 0);
}

uint64_t sub_10002077C()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  uint64_t v2 = sub_1000203E8(v1);
  swift_bridgeObjectRelease();
  int64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    sub_1000202B0(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = _swiftEmptyArrayStorage[2];
    do
    {
      char v6 = *(unsigned char *)(v2 + v4 + 32);
      unint64_t v7 = _swiftEmptyArrayStorage[3];
      if (v5 + v4 >= v7 >> 1) {
        sub_1000202B0((char *)(v7 > 1), v5 + v4 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v5 + v4 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage[4] + v5 + v4++) = v6;
    }
    while (v3 != v4);
  }
  swift_bridgeObjectRelease();
  int64_t v8 = *(uint64_t (**)(void *))(v0 + 8);
  return v8(_swiftEmptyArrayStorage);
}

uint64_t sub_1000208C8()
{
  return _swift_task_switch(sub_1000208E4, 0, 0);
}

uint64_t sub_1000208E4()
{
  uint64_t v1 = sub_1000203E8((uint64_t)&off_100031268);
  if (*(void *)(v1 + 16)) {
    uint64_t v2 = *(unsigned __int8 *)(v1 + 32);
  }
  else {
    uint64_t v2 = 19;
  }
  swift_bridgeObjectRelease();
  int64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_100020974()
{
  uint64_t v0 = sub_100004148(&qword_100035140);

  return TupleWidget.init(_:)(v0, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000209F4()
{
  unint64_t result = qword_100035138;
  if (!qword_100035138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035138);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceIntentsBundle()
{
  return &type metadata for IntelligenceIntentsBundle;
}

uint64_t sub_100020A58()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100020A78()
{
  unint64_t result = qword_100035148;
  if (!qword_100035148)
  {
    sub_1000042A8(&qword_100035150);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035148);
  }
  return result;
}

unint64_t sub_100020AD8()
{
  unint64_t result = qword_100035158;
  if (!qword_100035158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035158);
  }
  return result;
}

uint64_t sub_100020B2C()
{
  return sub_1000042F0(&qword_100035160, &qword_100035168);
}

uint64_t sub_100020B68()
{
  uint64_t v0 = sub_100004148(&qword_100035280);
  sub_100006E60(v0, qword_10003CDB0);
  sub_100006E28(v0, (uint64_t)qword_10003CDB0);
  sub_1000220EC();
  return sub_100023368();
}

uint64_t sub_100020BE4()
{
  uint64_t v0 = sub_100004148(&qword_100034570);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100023428();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_1000233D8();
  sub_100006E60(v5, qword_10003CDC8);
  sub_100006E28(v5, (uint64_t)qword_10003CDC8);
  sub_100023418();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_1000233C8();
}

uint64_t sub_100020D50()
{
  uint64_t v0 = sub_100023428();
  sub_100006E60(v0, qword_10003CDE0);
  sub_100006E28(v0, (uint64_t)qword_10003CDE0);
  return sub_100023418();
}

uint64_t sub_100020DB4()
{
  uint64_t v0 = sub_100004148(&qword_100034600);
  sub_100006E60(v0, qword_10003CDF8);
  uint64_t v1 = sub_100006E28(v0, (uint64_t)qword_10003CDF8);
  sub_100023248();
  uint64_t v2 = sub_100023258();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100020E6C()
{
  uint64_t result = swift_getKeyPath();
  qword_10003CE10 = result;
  return result;
}

uint64_t sub_100020E94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100004148(&qword_1000345D0);
  v3[9] = swift_task_alloc();
  sub_100004148(&qword_1000345D8);
  v3[10] = swift_task_alloc();
  sub_100004148(&qword_1000352B8);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_1000230A8();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100004148(&qword_1000352C0);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_100021058, 0, 0);
}

uint64_t sub_100021058()
{
  sub_1000230F8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_1000220EC();
  *uint64_t v1 = v0;
  v1[1] = sub_10002112C;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100021724, 0, &type metadata for MPSilenceUnknownCallersToggleEntity, v2);
}

uint64_t sub_10002112C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100021228, 0, 0);
}

uint64_t sub_100021228()
{
  sub_1000230F8();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_1000230F8();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_1000343D0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10003CE10;
  *(void *)(v0 + 168) = qword_10003CE10;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_1000042F0(&qword_100035298, &qword_1000352A0);
  *uint64_t v3 = v0;
  v3[1] = sub_100021380;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_100021380()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000050C0;
  }
  else {
    uint64_t v2 = sub_1000214D4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000214D4()
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
  sub_1000230F8();
  uint64_t v7 = sub_1000233B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_1000233E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100020AD8();
  sub_100022300();
  sub_100023078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_100023098();
  sub_1000230B8();
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

uint64_t sub_100021728()
{
  uint64_t v0 = sub_100004148(&qword_1000352C8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000343D0 != -1) {
    swift_once();
  }
  swift_retain();
  sub_1000232A8();
  swift_release();
  sub_100022300();
  sub_1000042F0((unint64_t *)&unk_1000352D0, &qword_1000352C8);
  sub_100023298();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100021890()
{
  if (qword_1000343D0 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_1000218F0()
{
  unint64_t result = qword_100035170;
  if (!qword_100035170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035170);
  }
  return result;
}

unint64_t sub_100021948()
{
  unint64_t result = qword_100035178;
  if (!qword_100035178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035178);
  }
  return result;
}

uint64_t sub_10002199C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1000219D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100021A20@<X0>(uint64_t a1@<X8>)
{
  return sub_1000069BC(&qword_1000343C0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003CDE0, a1);
}

uint64_t sub_100021A58@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000343C8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004148(&qword_100034600);
  uint64_t v3 = sub_100006E28(v2, (uint64_t)qword_10003CDF8);

  return sub_100007378(v3, a1);
}

uint64_t sub_100021AD4(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000073E4;
  return sub_100020E94(a1, v5, v4);
}

uint64_t sub_100021B80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100022B6C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100021BA8()
{
  return 0xD000000000000034;
}

unint64_t sub_100021BC8()
{
  unint64_t result = qword_100035188;
  if (!qword_100035188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035188);
  }
  return result;
}

uint64_t sub_100021C20(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100021C40, 0, 0);
}

uint64_t sub_100021C40()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
  unsigned __int8 v3 = [v2 isSilenceUnknownCallersEnabledForPhone];

  *uint64_t v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100021CDC(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100021D00, 0, 0);
}

uint64_t sub_100021D00()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)TUConfigurationProvider) init];
  [v2 setSilenceUnknownCallersEnabledForPhone:v1];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100021D90(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_100023428();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100021E20, 0, 0);
}

uint64_t sub_100021E20()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100004148(&qword_100035168);
  sub_100023418();
  sub_1000042F0(&qword_100035298, &qword_1000352A0);
  *uint64_t v1 = sub_100023408();
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_100021F34()
{
  unint64_t result = qword_100035198;
  if (!qword_100035198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035198);
  }
  return result;
}

uint64_t sub_100021F88(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10002258C();
  *uint64_t v4 = v2;
  v4[1] = sub_100005D20;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10002203C()
{
  unint64_t result = qword_1000351A8;
  if (!qword_1000351A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000351A8);
  }
  return result;
}

unint64_t sub_100022094()
{
  unint64_t result = qword_1000351B0;
  if (!qword_1000351B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000351B0);
  }
  return result;
}

unint64_t sub_1000220EC()
{
  unint64_t result = qword_1000351B8[0];
  if (!qword_1000351B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000351B8);
  }
  return result;
}

uint64_t sub_100022140(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10002258C();
  void *v5 = v2;
  v5[1] = sub_100005FF0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000221F4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10002258C();
  *uint64_t v4 = v2;
  v4[1] = sub_1000073E0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_1000222A8()
{
  unint64_t result = qword_1000351D0;
  if (!qword_1000351D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000351D0);
  }
  return result;
}

unint64_t sub_100022300()
{
  unint64_t result = qword_1000351D8;
  if (!qword_1000351D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000351D8);
  }
  return result;
}

unint64_t sub_100022358()
{
  unint64_t result = qword_1000351E0;
  if (!qword_1000351E0)
  {
    sub_1000042A8(qword_1000351E8);
    sub_100022300();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000351E0);
  }
  return result;
}

uint64_t sub_1000223CC(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100021F34();
  void *v5 = v2;
  v5[1] = sub_10000637C;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100022484()
{
  unint64_t result = qword_100035200;
  if (!qword_100035200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035200);
  }
  return result;
}

unint64_t sub_1000224DC()
{
  unint64_t result = qword_100035208;
  if (!qword_100035208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035208);
  }
  return result;
}

unint64_t sub_100022534()
{
  unint64_t result = qword_100035210;
  if (!qword_100035210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035210);
  }
  return result;
}

unint64_t sub_10002258C()
{
  unint64_t result = qword_100035218;
  if (!qword_100035218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035218);
  }
  return result;
}

unint64_t sub_1000225E4()
{
  unint64_t result = qword_100035220;
  if (!qword_100035220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035220);
  }
  return result;
}

uint64_t sub_100022638@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000343B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004148(&qword_100035280);
  uint64_t v3 = sub_100006E28(v2, (uint64_t)qword_10003CDB0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_1000226E8()
{
  unint64_t result = qword_100035228;
  if (!qword_100035228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035228);
  }
  return result;
}

unint64_t sub_100022740()
{
  unint64_t result = qword_100035230;
  if (!qword_100035230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035230);
  }
  return result;
}

unint64_t sub_100022798()
{
  unint64_t result = qword_100035238;
  if (!qword_100035238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035238);
  }
  return result;
}

uint64_t sub_1000227EC@<X0>(uint64_t *a1@<X8>)
{
  sub_10000DDE0();
  uint64_t result = sub_1000230D8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10002282C()
{
  sub_100022B18();
  uint64_t v2 = sub_100023328();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006F18(v3, v0, v2, v1);
}

uint64_t sub_1000228C0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000069BC(&qword_1000343B8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10003CDC8, a1);
}

uint64_t sub_1000228F8()
{
  return sub_1000042F0(&qword_100035248, &qword_100035250);
}

uint64_t sub_100022934(uint64_t a1)
{
  unint64_t v2 = sub_1000220EC();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100022984()
{
  unint64_t result = qword_100035258;
  if (!qword_100035258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035258);
  }
  return result;
}

uint64_t sub_1000229D8(uint64_t a1)
{
  unint64_t v2 = sub_10000DDE0();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100022A24(uint64_t a1)
{
  unint64_t v2 = sub_100022798();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for MPSilenceUnknownCallersToggleEntity.MPSilenceUnknownCallersEntityQuery()
{
  return &type metadata for MPSilenceUnknownCallersToggleEntity.MPSilenceUnknownCallersEntityQuery;
}

ValueMetadata *type metadata accessor for MPSilenceUnknownCallersToggleEntity()
{
  return &type metadata for MPSilenceUnknownCallersToggleEntity;
}

ValueMetadata *type metadata accessor for MPSilenceUnknownCallersToggleEntity.UpdateIntent_value()
{
  return &type metadata for MPSilenceUnknownCallersToggleEntity.UpdateIntent_value;
}

uint64_t sub_100022AA0()
{
  return sub_1000042F0(&qword_100035260, &qword_100035268);
}

uint64_t sub_100022ADC()
{
  return sub_1000042F0(&qword_100035270, &qword_100035268);
}

unint64_t sub_100022B18()
{
  unint64_t result = qword_100035278;
  if (!qword_100035278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035278);
  }
  return result;
}

uint64_t sub_100022B6C()
{
  uint64_t v0 = sub_100004148(&qword_1000345A8);
  __chkstk_darwin(v0 - 8);
  Swift::String v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100023318();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004148(&qword_1000345B0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100004148(&qword_100034570);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_100023428();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100004148(&qword_1000352A8);
  sub_100023418();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_1000230A8();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  Swift::String v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_1000220EC();
  uint64_t v19 = v23;
  uint64_t v24 = sub_100023118();
  sub_100004148(&qword_1000345C0);
  sub_100023418();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100023558();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_100023128();
  return v24;
}

uint64_t sub_100022FAC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_100022FB8()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100022FC8()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100022FD8()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100023008()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100023018()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100023028()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_100023038()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100023048()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100023078()
{
  return IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)();
}

uint64_t sub_100023098()
{
  return IntentDialog.init<A, B>(from:capturedContent:)();
}

uint64_t sub_1000230A8()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_1000230B8()
{
  return static IntentResult.result<A>(value:dialog:)();
}

uint64_t sub_1000230D8()
{
  return _UniqueEntity.id.getter();
}

uint64_t sub_1000230E8()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_1000230F8()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100023108()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100023118()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100023128()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_100023138()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_100023148()
{
  return type metadata accessor for _AssistantIntent.PhraseToken();
}

uint64_t sub_100023158()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100023168()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_100023178()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_100023188()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_100023198()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_1000231A8()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_1000231B8()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_1000231C8()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_1000231D8()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

uint64_t sub_1000231E8()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_1000231F8(Swift::String a1)
{
}

uint64_t sub_100023208()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100023218()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t sub_100023228()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_100023238()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_100023248()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_100023258()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_100023298()
{
  return static _DialogBuilderEntity.buildBlock<A>(_:)();
}

uint64_t sub_1000232A8()
{
  return static _DialogBuilderEntity.buildExpression<A, B>(_:)();
}

uint64_t sub_1000232B8()
{
  return DisplayRepresentation.Image.init(appBundleIdentifier:)();
}

uint64_t sub_1000232C8()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_1000232D8()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_1000232E8()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_100023308()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_100023318()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100023328()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_100023358()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100023368()
{
  return _EntityURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_100023378()
{
  return _EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_100023388(Swift::String a1)
{
}

uint64_t sub_100023398()
{
  return _EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000233A8()
{
  return _EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_1000233B8()
{
  return type metadata accessor for _GeneratedContentOptions();
}

uint64_t sub_1000233C8()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_1000233D8()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_1000233E8()
{
  return type metadata accessor for _GeneratedContentFallback();
}

uint64_t sub_100023408()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_100023418()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100023428()
{
  return type metadata accessor for LocalizedStringResource();
}

NSUUID sub_100023438()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_100023448()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100023458()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100023468()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_100023488()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100023498()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_1000234A8()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_1000234B8()
{
  return WidgetConfiguration.hiddenControl()();
}

uint64_t sub_1000234C8()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_1000234D8()
{
  return WidgetConfiguration.disablesControlStateCaching()();
}

uint64_t sub_1000234E8()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_1000234F8()
{
  return static Color.green.getter();
}

uint64_t sub_100023508()
{
  return Label<>.init(_:systemImage:)();
}

uint64_t sub_100023518()
{
  return ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)();
}

NSString sub_100023528()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100023538()
{
  return String.hash(into:)();
}

uint64_t sub_100023548()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100023558()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_100023568()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100023578()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100023588()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

Swift::Int sub_100023598(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_1000235A8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000235B8()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_1000235C8()
{
  return Hasher.init(_seed:)();
}

void sub_1000235D8(Swift::UInt a1)
{
}

Swift::Int sub_1000235E8()
{
  return Hasher._finalize()();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t TUDeviceHasChinaSKU()
{
  return _TUDeviceHasChinaSKU();
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}