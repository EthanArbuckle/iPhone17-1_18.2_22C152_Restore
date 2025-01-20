uint64_t sub_100004DF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_10000D250();
  result = sub_10000D270();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100004E5C@<X0>(uint64_t a1@<X8>)
{
  sub_1000051CC();
  swift_bridgeObjectRetain();
  uint64_t result = sub_10000D280();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100004EC8()
{
  return sub_10000D2C0();
}

uint64_t sub_100004F60()
{
  return sub_10000D2B0();
}

ValueMetadata *type metadata accessor for VPNAppIntentWidget()
{
  return &type metadata for VPNAppIntentWidget;
}

uint64_t sub_1000050B0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000050D0()
{
  unint64_t result = qword_100014128;
  if (!qword_100014128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014128);
  }
  return result;
}

unint64_t sub_100005124()
{
  unint64_t result = qword_100014130;
  if (!qword_100014130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014130);
  }
  return result;
}

unint64_t sub_100005178()
{
  unint64_t result = qword_100014138;
  if (!qword_100014138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014138);
  }
  return result;
}

unint64_t sub_1000051CC()
{
  unint64_t result = qword_100014140;
  if (!qword_100014140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014140);
  }
  return result;
}

unint64_t sub_100005224()
{
  unint64_t result = qword_100014148;
  if (!qword_100014148)
  {
    sub_100005280(&qword_100014150);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014148);
  }
  return result;
}

uint64_t sub_100005280(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000052CC()
{
  unint64_t result = qword_100014168;
  if (!qword_100014168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014168);
  }
  return result;
}

uint64_t sub_100005320()
{
  return sub_10000CC9C(&qword_100014170, &qword_100014178);
}

uint64_t sub_100005360@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_10000536C()
{
  uint64_t v0 = sub_10000CA18(&qword_100014380);
  __chkstk_darwin(v0 - 8);
  v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000CA18(&qword_100014358);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000D230();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  swift_bridgeObjectRetain();
  sub_10000D220();
  sub_10000D220();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_10000D0E0();
  uint64_t v9 = sub_10000D0F0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v2, 0, 1, v9);
  sub_10000CA18(&qword_100014388);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000D6C0;
  sub_10000D220();
  sub_10000D220();
  return sub_10000D100();
}

uint64_t sub_100005634(uint64_t a1)
{
  return sub_100007A80(a1, qword_100015B90);
}

uint64_t sub_100005658(uint64_t a1)
{
  return sub_100009F6C(a1, qword_100015BA8);
}

uint64_t sub_10000567C(uint64_t a1)
{
  return sub_100007EE0(a1, qword_100015BC0);
}

uint64_t sub_1000056A0()
{
  uint64_t result = swift_getKeyPath();
  qword_100015BD8 = result;
  return result;
}

uint64_t sub_1000056C8()
{
  return swift_retain();
}

uint64_t sub_1000056D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[15] = a2;
  v3[16] = a3;
  v3[14] = a1;
  return _swift_task_switch(sub_1000056F4, 0, 0);
}

uint64_t sub_1000056F4()
{
  sub_10000D080();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 40) = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 32);
  *(void *)(v0 + 136) = v1;
  *(void *)(v0 + 144) = v2;
  *(void *)(v0 + 48) = v1;
  *(void *)(v0 + 56) = v2;
  sub_10000D080();
  *(unsigned char *)(v0 + 225) = *(unsigned char *)(v0 + 226);
  if (qword_1000140F0 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_100015BD8;
  *(void *)(v0 + 152) = qword_100015BD8;
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v4;
  uint64_t v5 = sub_10000CC9C(&qword_1000143E8, &qword_1000143F0);
  *(void *)(v0 + 168) = v5;
  *uint64_t v4 = v0;
  v4[1] = sub_100005858;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 225, v3, &type metadata for Bool, v5);
}

uint64_t sub_100005858()
{
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100005CA8;
  }
  else {
    uint64_t v2 = sub_1000059C8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000059C8()
{
  sub_10000D080();
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[13];
  v0[23] = v2;
  v0[24] = v3;
  v0[8] = v1;
  v0[9] = v2;
  v0[10] = v3;
  uint64_t v4 = qword_100015BD8;
  v0[25] = qword_100015BD8;
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[26] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_100005AB0;
  uint64_t v6 = v0[21];
  return AppEntity._value<A, B>(for:)(v0 + 28, v4, v6);
}

uint64_t sub_100005AB0()
{
  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100005CC0;
  }
  else {
    uint64_t v2 = sub_100005C20;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100005C20()
{
  *(unsigned char *)(v0 + 227) = *(unsigned char *)(v0 + 224);
  sub_10000CD58();
  sub_10000D060();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100005CA8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005CC0()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

__n128 sub_100005CD8@<Q0>(uint64_t a1@<X8>)
{
  sub_10000D080();
  __n128 result = v4;
  *(void *)a1 = v3;
  *(__n128 *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_100005D1C()
{
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_100005D84(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10000D070();
  return sub_100005DE0;
}

uint64_t sub_100005DE4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10000D080();
  *a1 = v3;
  return result;
}

uint64_t sub_100005E20()
{
  return sub_10000D090();
}

uint64_t (*sub_100005E58(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10000D070();
  return sub_100005DE0;
}

uint64_t sub_100005EB4(uint64_t a1, uint64_t a2)
{
  return sub_100008724(a1, a2, &qword_1000140F0);
}

unint64_t sub_100005EDC()
{
  unint64_t result = qword_100014180;
  if (!qword_100014180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014180);
  }
  return result;
}

unint64_t sub_100005F34()
{
  unint64_t result = qword_100014188;
  if (!qword_100014188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014188);
  }
  return result;
}

uint64_t sub_100005F88()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100005FBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000A238(a1, a2, a3, (void (*)(void))sub_1000052CC);
}

uint64_t sub_100005FD4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000A2C4(&qword_1000140E0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100015BA8, a1);
}

uint64_t sub_10000601C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000088CC(&qword_1000140E8, (uint64_t)qword_100015BC0, a1);
}

uint64_t sub_100006040(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_10000CDBC;
  *(_OWORD *)(v4 + 120) = *v1;
  *(void *)(v4 + 112) = a1;
  return _swift_task_switch(sub_1000056F4, 0, 0);
}

uint64_t sub_1000060F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000AC24();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10000611C()
{
  return 0xD000000000000031;
}

unint64_t sub_10000613C()
{
  unint64_t result = qword_100014198;
  if (!qword_100014198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014198);
  }
  return result;
}

uint64_t sub_100006190(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  v2[16] = a1;
  v2[17] = v3;
  v2[18] = v4;
  return _swift_task_switch(sub_1000061B8, 0, 0);
}

uint64_t sub_1000061B8()
{
  uint64_t v1 = self;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_1000062C0;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100006BBC;
  v0[13] = &unk_100010C60;
  v0[14] = v2;
  [v1 loadAllFromPreferencesWithCompletionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_1000062C0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    uint64_t v2 = sub_1000064A0;
  }
  else {
    uint64_t v2 = sub_1000063D0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000063D0()
{
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v1 = *(void *)(v0 + 144);
  unint64_t v3 = *(void *)(v0 + 120);
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_10000B068(v3, v2, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4)
  {
    unsigned __int8 v5 = [v4 isOnDemandEnabled];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }
  **(unsigned char **)(v0 + 128) = v5;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_1000064A0()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000650C(void *a1, unsigned char *a2)
{
  uint64_t v3 = a1[1];
  *(void *)(v2 + 192) = *a1;
  *(void *)(v2 + 200) = v3;
  *(unsigned char *)(v2 + 232) = *a2;
  return _swift_task_switch(sub_100006538, 0, 0);
}

uint64_t sub_100006538()
{
  uint64_t v1 = self;
  v0[2] = v0;
  v0[7] = v0 + 23;
  v0[3] = sub_100006640;
  uint64_t v2 = swift_continuation_init();
  v0[18] = _NSConcreteStackBlock;
  v0[19] = 0x40000000;
  v0[20] = sub_100006BBC;
  v0[21] = &unk_100010C30;
  v0[22] = v2;
  [v1 loadAllFromPreferencesWithCompletionHandler:v0 + 18];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100006640()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 208) = v1;
  if (v1) {
    uint64_t v2 = sub_1000069E4;
  }
  else {
    uint64_t v2 = sub_100006750;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100006750()
{
  uint64_t v2 = *(void *)(v0 + 192);
  uint64_t v1 = *(void *)(v0 + 200);
  unint64_t v3 = *(void *)(v0 + 184);
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_10000B068(v3, v2, v1);
  *(void *)(v0 + 216) = v4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4)
  {
    [v4 setOnDemandEnabled:*(unsigned __int8 *)(v0 + 232)];
    *(void *)(v0 + 80) = v0;
    *(void *)(v0 + 88) = sub_1000068D4;
    uint64_t v5 = swift_continuation_init();
    *(void *)(v0 + 144) = _NSConcreteStackBlock;
    *(void *)(v0 + 152) = 0x40000000;
    *(void *)(v0 + 160) = sub_100006B24;
    *(void *)(v0 + 168) = &unk_100010C48;
    *(void *)(v0 + 176) = v5;
    [v4 saveToPreferencesWithCompletionHandler:v0 + 144];
    return _swift_continuation_await(v0 + 80);
  }
  else
  {
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_1000068D4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 224) = v1;
  if (v1) {
    uint64_t v2 = sub_100006AB4;
  }
  else {
    uint64_t v2 = sub_100006A50;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000069E4()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100006A50()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100006AB4()
{
  uint64_t v1 = *(void **)(v0 + 216);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100006B24(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_10000CA18(&qword_1000143D0);
    uint64_t v4 = swift_allocError();
    *uint64_t v5 = a2;
    id v6 = a2;
    return _swift_continuation_throwingResumeWithError(v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return _swift_continuation_throwingResume(v7);
  }
}

uint64_t sub_100006BBC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_10000CA18(&qword_1000143D0);
    uint64_t v5 = swift_allocError();
    *id v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    sub_10000CC5C();
    **(void **)(*(void *)(v3 + 64) + 40) = sub_10000D2E0();
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_100006C88(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100014420 + dword_100014420);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_100006D2C;
  return v4();
}

uint64_t sub_100006D2C(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  id v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

unint64_t sub_100006E44()
{
  unint64_t result = qword_1000141A8;
  if (!qword_1000141A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000141A8);
  }
  return result;
}

unint64_t sub_100006E9C()
{
  unint64_t result = qword_1000141B0[0];
  if (!qword_1000141B0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000141B0);
  }
  return result;
}

uint64_t sub_100006EF4(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100014410 + dword_100014410);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100006F9C;
  return v5(a1);
}

uint64_t sub_100006F9C(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_10000709C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100005178();
  *uint64_t v5 = v2;
  v5[1] = sub_10000CDBC;
  return EnumerableEntityQuery.suggestedEntities()(a1, a2, v6);
}

unint64_t sub_100007154()
{
  unint64_t result = qword_1000141C8;
  if (!qword_1000141C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000141C8);
  }
  return result;
}

unint64_t sub_1000071AC()
{
  unint64_t result = qword_1000141D0;
  if (!qword_1000141D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000141D0);
  }
  return result;
}

unint64_t sub_100007204()
{
  unint64_t result = qword_1000141D8;
  if (!qword_1000141D8)
  {
    sub_100005280(qword_1000141E0);
    sub_1000071AC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000141D8);
  }
  return result;
}

uint64_t sub_100007278(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000613C();
  *uint64_t v5 = v2;
  v5[1] = sub_10000CDBC;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10000732C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1000073E0;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

uint64_t sub_1000073E0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_1000074E0()
{
  unint64_t result = qword_1000141F8;
  if (!qword_1000141F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000141F8);
  }
  return result;
}

unint64_t sub_100007538()
{
  unint64_t result = qword_100014200;
  if (!qword_100014200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014200);
  }
  return result;
}

unint64_t sub_100007590()
{
  unint64_t result = qword_100014208;
  if (!qword_100014208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014208);
  }
  return result;
}

void *sub_1000075E4()
{
  return &protocol witness table for String;
}

unint64_t sub_1000075F4()
{
  unint64_t result = qword_100014210;
  if (!qword_100014210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014210);
  }
  return result;
}

uint64_t sub_100007648(uint64_t a1)
{
  unint64_t v2 = sub_1000050D0();

  return _EntityURLRepresentation.init(stringLiteral:)(0xD00000000000004DLL, 0x800000010000EF30, a1, v2);
}

unint64_t sub_1000076A8()
{
  unint64_t result = qword_100014218;
  if (!qword_100014218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014218);
  }
  return result;
}

unint64_t sub_100007700()
{
  unint64_t result = qword_100014220;
  if (!qword_100014220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014220);
  }
  return result;
}

unint64_t sub_100007758()
{
  unint64_t result = qword_100014228;
  if (!qword_100014228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014228);
  }
  return result;
}

void *sub_1000077AC()
{
  return &protocol witness table for String;
}

uint64_t sub_1000077B8@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000077C4()
{
  sub_10000CB04();
  uint64_t v2 = sub_10000D170();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000CC48(v3, v0, v2, v1);
}

uint64_t sub_100007858@<X0>(uint64_t a1@<X8>)
{
  return sub_10000A2C4(&qword_1000140D8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100015B90, a1);
}

uint64_t sub_100007890()
{
  return sub_10000CC9C(&qword_100014238, &qword_100014240);
}

uint64_t sub_1000078CC(uint64_t a1)
{
  unint64_t v2 = sub_1000050D0();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000791C()
{
  unint64_t result = qword_100014248;
  if (!qword_100014248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014248);
  }
  return result;
}

uint64_t sub_100007970()
{
  return sub_10000536C();
}

uint64_t sub_100007978(uint64_t a1)
{
  unint64_t v2 = sub_100007758();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000079C8()
{
  unint64_t result = qword_100014250;
  if (!qword_100014250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014250);
  }
  return result;
}

uint64_t sub_100007A1C()
{
  return sub_10000CC9C(&qword_100014258, &qword_100014260);
}

uint64_t sub_100007A58(uint64_t a1)
{
  return sub_100007A80(a1, qword_100015BE0);
}

uint64_t sub_100007A80(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000CA18(&qword_100014358);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000D230();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = sub_10000D1D0();
  sub_10000CB90(v8, a2);
  sub_10000CB58(v8, (uint64_t)a2);
  sub_10000D220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  return sub_10000D1C0();
}

uint64_t sub_100007BE8()
{
  uint64_t v0 = sub_10000CA18(&qword_100014380);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000CA18(&qword_100014358);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000D230();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  sub_10000D220();
  sub_10000D220();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_10000D0E0();
  uint64_t v9 = sub_10000D0F0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v2, 0, 1, v9);
  sub_10000CA18(&qword_100014388);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000D6C0;
  sub_10000D220();
  sub_10000D220();
  return sub_10000D100();
}

uint64_t sub_100007E98(uint64_t a1)
{
  return sub_100009F6C(a1, qword_100015BF8);
}

uint64_t sub_100007EBC(uint64_t a1)
{
  return sub_100007EE0(a1, qword_100015C10);
}

uint64_t sub_100007EE0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000CA18(&qword_100014408);
  sub_10000CB90(v3, a2);
  uint64_t v4 = sub_10000CB58(v3, (uint64_t)a2);
  sub_10000D0C0();
  uint64_t v5 = sub_10000D0D0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);

  return v6(v4, 0, 1, v5);
}

uint64_t sub_100007F94()
{
  uint64_t result = swift_getKeyPath();
  qword_100015C28 = result;
  return result;
}

uint64_t sub_100007FBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[19] = a2;
  v3[20] = a3;
  v3[18] = a1;
  return _swift_task_switch(sub_100007FE0, 0, 0);
}

uint64_t sub_100007FE0()
{
  sub_10000D080();
  uint64_t v1 = v0[17];
  v0[21] = v1;
  v0[14] = v1;
  sub_10000D080();
  v0[11] = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  v0[22] = v2;
  v0[23] = v3;
  v0[12] = v2;
  v0[13] = v3;
  if (qword_100014110 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_100015C28;
  v0[24] = qword_100015C28;
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[25] = v5;
  uint64_t v6 = sub_10000CC9C(&qword_1000143B0, &qword_1000143B8);
  v0[26] = v6;
  *uint64_t v5 = v0;
  v5[1] = sub_10000814C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 11, v4, &type metadata for VPNConfigurationEntity, v6);
}

uint64_t sub_10000814C()
{
  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100005CC0;
  }
  else {
    uint64_t v2 = sub_1000082E0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000082E0()
{
  sub_10000D080();
  uint64_t v1 = v0[15];
  v0[16] = v1;
  uint64_t v2 = qword_100015C28;
  v0[28] = v1;
  v0[29] = v2;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[30] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1000083BC;
  uint64_t v4 = v0[26];
  return AppEntity._value<A, B>(for:)(v0 + 2, v2, v4);
}

uint64_t sub_1000083BC()
{
  *(void *)(*(void *)v1 + 248) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000085B8;
  }
  else {
    uint64_t v2 = sub_100008510;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100008510()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  v0[5] = v0[2];
  v0[6] = v1;
  v0[7] = v2;
  sub_1000071AC();
  sub_10000D060();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_1000085B8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000085D0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10000D080();
  *a1 = v3;
  return result;
}

uint64_t sub_10000860C()
{
  return swift_release();
}

__n128 sub_100008654@<Q0>(uint64_t a1@<X8>)
{
  sub_10000D080();
  __n128 result = v4;
  *(void *)a1 = v3;
  *(__n128 *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_100008698()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100008700(uint64_t a1, uint64_t a2)
{
  return sub_100008724(a1, a2, &qword_100014110);
}

uint64_t sub_100008724(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100008778()
{
  unint64_t result = qword_100014268;
  if (!qword_100014268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014268);
  }
  return result;
}

unint64_t sub_1000087D0()
{
  unint64_t result = qword_100014270;
  if (!qword_100014270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014270);
  }
  return result;
}

uint64_t sub_100008824()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100008858(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000A238(a1, a2, a3, (void (*)(void))sub_1000079C8);
}

uint64_t sub_100008870@<X0>(uint64_t a1@<X8>)
{
  return sub_10000A2C4(&qword_100014100, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100015BF8, a1);
}

uint64_t sub_1000088A8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000088CC(&qword_100014108, (uint64_t)qword_100015C10, a1);
}

uint64_t sub_1000088CC@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10000CA18(&qword_100014408);
  uint64_t v6 = sub_10000CB58(v5, a2);

  return sub_10000CCEC(v6, a3);
}

uint64_t sub_100008934(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_1000073E0;
  *(_OWORD *)(v4 + 152) = *v1;
  *(void *)(v4 + 144) = a1;
  return _swift_task_switch(sub_100007FE0, 0, 0);
}

uint64_t sub_1000089E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000C34C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100008A10()
{
  return 0xD000000000000026;
}

unint64_t sub_100008A30()
{
  unint64_t result = qword_100014280;
  if (!qword_100014280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014280);
  }
  return result;
}

uint64_t sub_100008A84()
{
  return sub_10000CC9C(&qword_100014288, &qword_100014290);
}

unint64_t sub_100008AC4()
{
  unint64_t result = qword_100014298;
  if (!qword_100014298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014298);
  }
  return result;
}

uint64_t sub_100008B18(uint64_t a1)
{
  v1[2] = a1;
  sub_10000D230();
  v1[3] = swift_task_alloc();
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000143C0 + dword_1000143C0);
  uint64_t v2 = (void *)swift_task_alloc();
  v1[4] = v2;
  void *v2 = v1;
  v2[1] = sub_100008BE8;
  return v4();
}

uint64_t sub_100008BE8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(*v2 + 40) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return _swift_task_switch(sub_100008D38, 0, 0);
  }
}

uint64_t sub_100008D38()
{
  uint64_t v1 = *(void **)(v0 + 40);
  if (v1)
  {
    id v2 = [*(id *)(v0 + 40) localizedDescription];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = sub_10000D2D0();
      unint64_t v6 = v5;

      sub_10000CA18(&qword_100014178);
      sub_10000D220();
      sub_10000CC9C(&qword_1000143E8, &qword_1000143F0);
      uint64_t v7 = sub_10000D200();

      goto LABEL_6;
    }
  }
  sub_10000CA18(&qword_100014178);
  sub_10000D220();
  sub_10000CC9C(&qword_1000143E8, &qword_1000143F0);
  uint64_t v7 = sub_10000D200();
  unint64_t v6 = 0xEC00000064657463;
  uint64_t v4 = 0x656E6E6F63736944;
LABEL_6:
  uint64_t v8 = *(uint64_t **)(v0 + 16);
  *uint64_t v8 = v4;
  v8[1] = v6;
  v8[2] = v7;
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_100008F60(uint64_t a1, void *a2)
{
  uint64_t v3 = a2[1];
  v2[17] = *a2;
  v2[18] = v3;
  uint64_t v4 = dword_1000143C0;
  unint64_t v5 = (void *)swift_task_alloc();
  v2[19] = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_100009034;
  return ((uint64_t (__cdecl *)())((char *)&dword_1000143C0 + v4))();
}

uint64_t sub_100009034(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[20] = a1;
  v3[21] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = (uint64_t (*)(void))v3[1];
    return v4();
  }
  else
  {
    return _swift_task_switch(sub_1000091AC, 0, 0);
  }
}

uint64_t sub_1000091AC()
{
  uint64_t v1 = *(void **)(v0 + 160);
  if (v1)
  {
    id v2 = [*(id *)(v0 + 160) connection];
    [v2 stopVPNTunnel];
  }
  BOOL v3 = *(void *)(v0 + 136) == 0x656E6E6F63736944 && *(void *)(v0 + 144) == 0xEC00000064657463;
  if (v3 || (sub_10000D320() & 1) != 0)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
  else
  {
    uint64_t v6 = self;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 120;
    *(void *)(v0 + 24) = sub_1000093C8;
    uint64_t v7 = swift_continuation_init();
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_100006BBC;
    *(void *)(v0 + 104) = &unk_100010C00;
    *(void *)(v0 + 112) = v7;
    [v6 loadAllFromPreferencesWithCompletionHandler:v0 + 80];
    return _swift_continuation_await(v0 + 16);
  }
}

uint64_t sub_1000093C8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 176) = v1;
  if (v1) {
    id v2 = sub_100009670;
  }
  else {
    id v2 = sub_100009504;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100009504()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  unint64_t v3 = v0[15];
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_10000B068(v3, v2, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v4) {
    goto LABEL_4;
  }
  id v5 = [v4 connection];
  v0[16] = 0;
  unsigned int v6 = [v5 startVPNTunnelAndReturnError:v0 + 16];

  uint64_t v7 = (void *)v0[16];
  if (v6)
  {
    id v8 = v7;

LABEL_4:
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    goto LABEL_6;
  }
  id v10 = v7;
  sub_10000D210();

  swift_willThrow();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
LABEL_6:
  return v9();
}

uint64_t sub_100009670()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100009708()
{
  uint64_t v0 = sub_10000CA18(&qword_100014290);
  sub_10000CB90(v0, qword_100015C30);
  sub_10000CB58(v0, (uint64_t)qword_100015C30);
  sub_100005124();
  return sub_10000D130();
}

uint64_t sub_100009784(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_10000D230();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100009814, 0, 0);
}

uint64_t sub_100009814()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_10000CA18(&qword_100014260);
  sub_10000D220();
  sub_10000CC9C(&qword_1000143B0, &qword_1000143B8);
  sub_1000050D0();
  *uint64_t v1 = sub_10000D1F0();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100009938(uint64_t a1)
{
  unint64_t v2 = sub_100008A30();

  return _EntityURLRepresentation.init(stringLiteral:)(0xD00000000000004DLL, 0x800000010000EF30, a1, v2);
}

unint64_t sub_100009998()
{
  unint64_t result = qword_1000142A0;
  if (!qword_1000142A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000142A0);
  }
  return result;
}

unint64_t sub_1000099F0()
{
  unint64_t result = qword_1000142A8;
  if (!qword_1000142A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000142A8);
  }
  return result;
}

unint64_t sub_100009A48()
{
  unint64_t result = qword_1000142B0;
  if (!qword_1000142B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000142B0);
  }
  return result;
}

uint64_t sub_100009A9C()
{
  return sub_10000CC9C((unint64_t *)&unk_1000142B8, &qword_100014290);
}

uint64_t sub_100009AD8@<X0>(uint64_t a1@<X8>)
{
  if (qword_100014118 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000CA18(&qword_100014290);
  uint64_t v3 = sub_10000CB58(v2, (uint64_t)qword_100015C30);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100009B84()
{
  sub_10000CBF4();
  uint64_t v2 = sub_10000D170();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000CC48(v3, v0, v2, v1);
}

unint64_t sub_100009C1C()
{
  unint64_t result = qword_1000142C8;
  if (!qword_1000142C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000142C8);
  }
  return result;
}

unint64_t sub_100009C74()
{
  unint64_t result = qword_1000142D0;
  if (!qword_1000142D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000142D0);
  }
  return result;
}

unint64_t sub_100009CCC()
{
  unint64_t result = qword_1000142D8;
  if (!qword_1000142D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000142D8);
  }
  return result;
}

unint64_t sub_100009D24()
{
  unint64_t result = qword_1000142E0;
  if (!qword_1000142E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000142E0);
  }
  return result;
}

void sub_100009D78(void *a1@<X8>)
{
  *a1 = 25705;
  a1[1] = 0xE200000000000000;
}

uint64_t sub_100009D88@<X0>(uint64_t a1@<X8>)
{
  return sub_10000A2C4(&qword_1000140F8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100015BE0, a1);
}

uint64_t sub_100009DC0()
{
  return sub_10000CC9C(&qword_1000142E8, &qword_1000142F0);
}

uint64_t sub_100009DFC(uint64_t a1)
{
  unint64_t v2 = sub_100008A30();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100009E4C()
{
  unint64_t result = qword_1000142F8;
  if (!qword_1000142F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000142F8);
  }
  return result;
}

uint64_t sub_100009EA4(uint64_t a1)
{
  unint64_t v2 = sub_100009D24();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100009EF4()
{
  unint64_t result = qword_100014300;
  if (!qword_100014300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014300);
  }
  return result;
}

uint64_t sub_100009F48(uint64_t a1)
{
  return sub_100009F6C(a1, qword_100015C48);
}

uint64_t sub_100009F6C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000D230();
  sub_10000CB90(v3, a2);
  sub_10000CB58(v3, (uint64_t)a2);
  return sub_10000D220();
}

void sub_100009FCC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_10000A01C()
{
  unint64_t result = qword_100014308;
  if (!qword_100014308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014308);
  }
  return result;
}

unint64_t sub_10000A074()
{
  unint64_t result = qword_100014310;
  if (!qword_100014310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014310);
  }
  return result;
}

uint64_t sub_10000A0C8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10000CA5C();
  unint64_t v5 = sub_10000CB04();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_10000A134()
{
  uint64_t v0 = qword_100014158;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10000A174()
{
  unint64_t result = qword_100014318;
  if (!qword_100014318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014318);
  }
  return result;
}

unint64_t sub_10000A1CC()
{
  unint64_t result = qword_100014320;
  if (!qword_100014320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014320);
  }
  return result;
}

uint64_t sub_10000A220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000A238(a1, a2, a3, (void (*)(void))sub_10000A01C);
}

uint64_t sub_10000A238(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000A28C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000A2C4(&qword_100014120, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100015C48, a1);
}

uint64_t sub_10000A2C4@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_10000CB58(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_10000A368()
{
  return 0;
}

uint64_t sub_10000A370()
{
  return 1;
}

uint64_t sub_10000A37C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000CA5C();
  unint64_t v7 = sub_10000CAB0();
  unint64_t v8 = sub_10000CB04();
  *unint64_t v5 = v2;
  v5[1] = sub_10000A450;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_10000A450()
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

uint64_t sub_10000A558@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000C728();
  *a1 = result;
  return result;
}

uint64_t sub_10000A580(uint64_t a1)
{
  unint64_t v2 = sub_10000A01C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenVPNDeepLink()
{
  return &type metadata for OpenVPNDeepLink;
}

ValueMetadata *type metadata accessor for CurrentlyConnectedVPN()
{
  return &type metadata for CurrentlyConnectedVPN;
}

uint64_t destroy for CurrentlyConnectedVPN.UpdateIntent_value()
{
  swift_release();

  return swift_release();
}

__n128 initializeWithTake for VPNConfigurationEntity.UpdateIntent_connectOnDemand(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for CurrentlyConnectedVPN.UpdateIntent_value()
{
  return &type metadata for CurrentlyConnectedVPN.UpdateIntent_value;
}

ValueMetadata *type metadata accessor for VPNConfigurationEntity.Query()
{
  return &type metadata for VPNConfigurationEntity.Query;
}

uint64_t destroy for VPNConfigurationEntity()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

void *_s27VPNAppIntentWidgetExtension22VPNConfigurationEntityVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for VPNConfigurationEntity(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for VPNConfigurationEntity(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for VPNConfigurationEntity(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for VPNConfigurationEntity(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VPNConfigurationEntity(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VPNConfigurationEntity()
{
  return &type metadata for VPNConfigurationEntity;
}

void *_s27VPNAppIntentWidgetExtension22VPNConfigurationEntityV28UpdateIntent_connectOnDemandVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *_s27VPNAppIntentWidgetExtension22VPNConfigurationEntityV28UpdateIntent_connectOnDemandVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *_s27VPNAppIntentWidgetExtension22VPNConfigurationEntityV28UpdateIntent_connectOnDemandVwta_0(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t _s27VPNAppIntentWidgetExtension22VPNConfigurationEntityV28UpdateIntent_connectOnDemandVwet_0(uint64_t *a1, int a2)
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

uint64_t sub_10000A954(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for VPNConfigurationEntity.UpdateIntent_connectOnDemand()
{
  return &type metadata for VPNConfigurationEntity.UpdateIntent_connectOnDemand;
}

uint64_t sub_10000A9A0()
{
  return sub_10000CC9C(&qword_100014330, &qword_100014338);
}

uint64_t sub_10000A9DC()
{
  return sub_10000CC9C(&qword_100014340, &qword_100014348);
}

uint64_t sub_10000AA18(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  __n128 result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  __n128 result = (uint64_t)sub_10000AB08((char *)result, v10, 1, (char *)v3);
  uint64_t v3 = result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  __n128 result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    __n128 result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    *(void *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

char *sub_10000AB08(char *result, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000CA18(&qword_100014418);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    int64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10000AC24()
{
  sub_10000CA18(&qword_100014428);
  ((void (*)(void))__chkstk_darwin)();
  v27 = (char *)&v20 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_10000D160();
  uint64_t v1 = *(void *)(v28 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000CA18(&qword_100014350);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  unint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v20 - v7;
  uint64_t v9 = sub_10000CA18(&qword_100014358);
  __chkstk_darwin(v9 - 8);
  size_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = v11;
  uint64_t v12 = sub_10000D230();
  uint64_t v26 = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v21 = sub_10000CA18(&qword_100014360);
  sub_10000D220();
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v25(v11, 1, 1, v12);
  uint64_t v14 = sub_10000D050();
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v29 = 0;
  v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  unsigned int v24 = enum case for InputConnectionBehavior.default(_:);
  v16 = *(void (**)(void))(v1 + 104);
  uint64_t v22 = v1 + 104;
  v23 = (void (*)(char *, void, uint64_t))v16;
  v16(v3);
  sub_1000050D0();
  v17 = v20;
  uint64_t v21 = sub_10000D0A0();
  sub_10000CA18(&qword_100014430);
  sub_10000D220();
  v25(v17, 1, 1, v26);
  LOBYTE(v29) = 2;
  uint64_t v18 = sub_10000D2F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v27, 1, 1, v18);
  v15(v8, 1, 1, v14);
  v23(v3, v24, v28);
  sub_10000D0B0();
  return v21;
}

void *sub_10000B068(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_10000D310())
  {
    uint64_t v6 = 4;
    while (1)
    {
      id v7 = (a1 & 0xC000000000000001) != 0 ? (id)sub_10000D300() : *(id *)(a1 + 8 * v6);
      uint64_t v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      id v10 = [v7 localizedDescription];
      if (v10)
      {
        size_t v11 = v10;
        uint64_t v12 = sub_10000D2D0();
        uint64_t v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v8;
        }
        char v16 = sub_10000D320();
        swift_bridgeObjectRelease();
        if (v16) {
          goto LABEL_18;
        }
      }

      ++v6;
      if (v9 == v5) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10000B1FC()
{
  return _swift_task_switch(sub_10000B218, 0, 0);
}

uint64_t sub_10000B218()
{
  uint64_t v1 = self;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_10000B320;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100006BBC;
  v0[13] = &unk_100010C18;
  v0[14] = v2;
  [v1 loadAllFromPreferencesWithCompletionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10000B320()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 128) = v1;
  if (v1) {
    uint64_t v2 = sub_10000B5B4;
  }
  else {
    uint64_t v2 = sub_10000B430;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000B430()
{
  ivars = v0[1].ivars;
  if ((unint64_t)ivars >> 62) {
    goto LABEL_13;
  }
  uint64_t v2 = *(void *)(((unint64_t)ivars & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_10000D310())
  {
    size_t v11 = v0;
    uint64_t v3 = 0;
    uint64_t v0 = &ResourceBundleClass;
    while (1)
    {
      id v4 = ((unint64_t)ivars & 0xC000000000000001) != 0
         ? (id)sub_10000D300()
         : *(id *)&ivars[v3 + 4];
      uint64_t v5 = v4;
      uint64_t v6 = v3 + 1;
      if (__OFADD__(v3, 1)) {
        break;
      }
      id v7 = [v4 connection];
      id v8 = [v7 status];

      if (v8 == (id)3)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v0 = v11;
        goto LABEL_15;
      }

      ++v3;
      if (v6 == v2)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v5 = 0;
        uint64_t v0 = v11;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease_n();
  uint64_t v5 = 0;
LABEL_15:
  uint64_t v9 = *(uint64_t (**)(void *))&v0->ivar_base_size;
  return v9(v5);
}

uint64_t sub_10000B5B4()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000B620()
{
  sub_10000D230();
  *(void *)(v0 + 128) = swift_task_alloc();
  return _swift_task_switch(sub_10000B6AC, 0, 0);
}

uint64_t sub_10000B6AC()
{
  uint64_t v1 = self;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_10000B7B4;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100006BBC;
  v0[13] = &unk_100010C90;
  v0[14] = v2;
  [v1 loadAllFromPreferencesWithCompletionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10000B7B4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 136) = v1;
  if (v1) {
    uint64_t v2 = sub_10000BC30;
  }
  else {
    uint64_t v2 = sub_10000B8C4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000B8C4()
{
  unint64_t v1 = *(void *)(v0 + 120);
  sub_10000CA18(&qword_100014418);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10000D6C0;
  sub_10000CA18(&qword_100014178);
  sub_10000D220();
  sub_10000CC9C(&qword_1000143E8, &qword_1000143F0);
  uint64_t v3 = sub_10000D200();
  strcpy((char *)(v2 + 32), "Disconnected");
  *(unsigned char *)(v2 + 45) = 0;
  *(_WORD *)(v2 + 46) = -5120;
  *(void *)(v2 + 48) = v3;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_10000D310();
    uint64_t v4 = result;
    uint64_t v21 = v2;
    if (result) {
      goto LABEL_3;
    }
LABEL_17:
    id v7 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_18;
  }
  uint64_t v4 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v21 = v2;
  if (!v4) {
    goto LABEL_17;
  }
LABEL_3:
  if (v4 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = 0;
  id v7 = (char *)&_swiftEmptyArrayStorage;
  unint64_t v23 = v1 & 0xC000000000000001;
  do
  {
    if (v23) {
      id v8 = (id)sub_10000D300();
    }
    else {
      id v8 = *(id *)(v1 + 8 * v6 + 32);
    }
    uint64_t v9 = v8;
    id v10 = [v8 localizedDescription];
    if (v10)
    {
      size_t v11 = v10;
      unint64_t v12 = v1;
      uint64_t v13 = sub_10000D2D0();
      uint64_t v15 = v14;

      sub_10000D220();
      uint64_t v16 = sub_10000D200();

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v7 = sub_10000AB08(0, *((void *)v7 + 2) + 1, 1, v7);
      }
      unint64_t v18 = *((void *)v7 + 2);
      unint64_t v17 = *((void *)v7 + 3);
      if (v18 >= v17 >> 1) {
        id v7 = sub_10000AB08((char *)(v17 > 1), v18 + 1, 1, v7);
      }
      *((void *)v7 + 2) = v18 + 1;
      v19 = &v7[24 * v18];
      *((void *)v19 + 4) = v13;
      *((void *)v19 + 5) = v15;
      *((void *)v19 + 6) = v16;
      unint64_t v1 = v12;
    }
    else
    {
    }
    ++v6;
  }
  while (v4 != v6);
LABEL_18:
  swift_bridgeObjectRelease_n();
  sub_10000AA18((uint64_t)v7);
  swift_task_dealloc();
  v20 = *(uint64_t (**)(uint64_t))(v22 + 8);
  return v20(v21);
}

uint64_t sub_10000BC30()
{
  swift_willThrow();
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

char *sub_10000BCA4(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10000D230();
  __chkstk_darwin(v6 - 8);
  uint64_t v30 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_37;
  }
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v8)
  {
    while (1)
    {
      uint64_t v9 = 0;
      unint64_t v35 = a1 & 0xC000000000000001;
      unint64_t v31 = a1 + 32;
      uint64_t v27 = v3;
      uint64_t v28 = (void *)(a2 + 56);
      id v10 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v29 = 0x800000010000EEF0;
      uint64_t v32 = a2;
      unint64_t v33 = a1;
      uint64_t v34 = v8;
      while (1)
      {
        if (v35) {
          id v11 = (id)sub_10000D300();
        }
        else {
          id v11 = *(id *)(v31 + 8 * v9);
        }
        unint64_t v12 = v11;
        if (__OFADD__(v9++, 1))
        {
          __break(1u);
          goto LABEL_36;
        }
        id v14 = [v11 localizedDescription];
        if (v14) {
          break;
        }

LABEL_5:
        if (v9 == v8)
        {
          swift_bridgeObjectRelease();
          return v10;
        }
      }
      uint64_t v15 = v14;
      uint64_t v16 = sub_10000D2D0();
      uint64_t v3 = v17;

      uint64_t v18 = *(void *)(a2 + 16);
      if (!v18)
      {

        swift_bridgeObjectRelease();
        goto LABEL_5;
      }
      BOOL v19 = *(void *)(a2 + 32) == v16 && *(void *)(a2 + 40) == v3;
      if (v19 || (sub_10000D320() & 1) != 0) {
        break;
      }
      if (v18 == 1)
      {
LABEL_33:

        swift_bridgeObjectRelease();
        a2 = v32;
        a1 = v33;
LABEL_22:
        uint64_t v8 = v34;
        goto LABEL_5;
      }
      uint64_t v24 = v28;
      a2 = 1;
      while (1)
      {
        a1 = a2 + 1;
        if (__OFADD__(a2, 1)) {
          break;
        }
        BOOL v25 = *(v24 - 1) == v16 && *v24 == v3;
        if (v25 || (sub_10000D320() & 1) != 0) {
          goto LABEL_17;
        }
        v24 += 2;
        ++a2;
        if (a1 == v18) {
          goto LABEL_33;
        }
      }
LABEL_36:
      __break(1u);
LABEL_37:
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_10000D310();
      if (!v8) {
        goto LABEL_38;
      }
    }
LABEL_17:
    sub_10000CA18(&qword_100014178);
    sub_10000D220();
    sub_10000CC9C(&qword_1000143E8, &qword_1000143F0);
    uint64_t v20 = sub_10000D200();

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      id v10 = sub_10000AB08(0, *((void *)v10 + 2) + 1, 1, v10);
    }
    a1 = v33;
    unint64_t v22 = *((void *)v10 + 2);
    unint64_t v21 = *((void *)v10 + 3);
    if (v22 >= v21 >> 1) {
      id v10 = sub_10000AB08((char *)(v21 > 1), v22 + 1, 1, v10);
    }
    a2 = v32;
    *((void *)v10 + 2) = v22 + 1;
    unint64_t v23 = &v10[24 * v22];
    *((void *)v23 + 4) = v16;
    *((void *)v23 + 5) = v3;
    *((void *)v23 + 6) = v20;
    goto LABEL_22;
  }
LABEL_38:
  swift_bridgeObjectRelease();
  return (char *)&_swiftEmptyArrayStorage;
}

uint64_t sub_10000C010(uint64_t a1)
{
  *(void *)(v1 + 128) = a1;
  return _swift_task_switch(sub_10000C030, 0, 0);
}

uint64_t sub_10000C030()
{
  uint64_t v1 = self;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_10000C138;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100006BBC;
  v0[13] = &unk_100010C78;
  v0[14] = v2;
  [v1 loadAllFromPreferencesWithCompletionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10000C138()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 136) = v1;
  if (v1) {
    uint64_t v2 = sub_10000C2E0;
  }
  else {
    uint64_t v2 = sub_10000C248;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000C248()
{
  unint64_t v1 = v0[15];
  uint64_t v2 = v0[16];
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_10000BCA4(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t (*)(char *))v0[1];
  return v4(v3);
}

uint64_t sub_10000C2E0()
{
  swift_willThrow();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000C34C()
{
  uint64_t v26 = sub_10000D160();
  uint64_t v0 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  BOOL v25 = (char *)v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10000CA18(&qword_100014350);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)v19 - v6;
  uint64_t v8 = sub_10000CA18(&qword_100014358);
  __chkstk_darwin(v8 - 8);
  id v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000D230();
  uint64_t v24 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v22 = sub_10000CA18(&qword_1000143F8);
  sub_10000D220();
  unint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  v23(v10, 1, 1, v11);
  uint64_t v27 = 0;
  uint64_t v13 = sub_10000D050();
  id v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  uint64_t v15 = v5;
  v14(v5, 1, 1, v13);
  unsigned int v21 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v16 = *(void (**)(void))(v0 + 104);
  v19[1] = v0 + 104;
  uint64_t v20 = (void (*)(char *, void, uint64_t))v16;
  uint64_t v17 = v25;
  v16(v25);
  sub_100008A30();
  uint64_t v22 = sub_10000D0A0();
  sub_10000CA18(&qword_100014360);
  sub_10000D220();
  v23(v10, 1, 1, v24);
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  v14(v7, 1, 1, v13);
  v14(v15, 1, 1, v13);
  v20(v17, v21, v26);
  sub_1000050D0();
  sub_10000D0A0();
  return v22;
}

uint64_t sub_10000C728()
{
  v17[0] = sub_10000D160();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  uint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000CA18(&qword_100014350);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_10000CA18(&qword_100014358);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000D230();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_10000CA18(&qword_100014360);
  sub_10000D220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  uint64_t v14 = sub_10000D050();
  memset(&v17[1], 0, 24);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_1000050D0();
  return sub_10000D0A0();
}

uint64_t sub_10000CA18(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000CA5C()
{
  unint64_t result = qword_100014368;
  if (!qword_100014368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014368);
  }
  return result;
}

unint64_t sub_10000CAB0()
{
  unint64_t result = qword_100014370;
  if (!qword_100014370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014370);
  }
  return result;
}

unint64_t sub_10000CB04()
{
  unint64_t result = qword_100014378;
  if (!qword_100014378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014378);
  }
  return result;
}

uint64_t sub_10000CB58(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_10000CB90(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_10000CBF4()
{
  unint64_t result = qword_100014390;
  if (!qword_100014390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014390);
  }
  return result;
}

uint64_t sub_10000CC48(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

unint64_t sub_10000CC5C()
{
  unint64_t result = qword_1000143C8;
  if (!qword_1000143C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000143C8);
  }
  return result;
}

uint64_t sub_10000CC9C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005280(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000CCE0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_10000CCEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000CA18(&qword_100014408);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000CD58()
{
  unint64_t result = qword_100014440;
  if (!qword_100014440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014440);
  }
  return result;
}

uint64_t sub_10000CDAC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 16);
  return swift_retain();
}

uint64_t sub_10000CDC0()
{
  unint64_t v0 = sub_10000CEBC();

  return static WidgetBundleBuilder.buildBlock<A>(_:)(v0, &type metadata for VPNAppIntentWidget, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000CE3C()
{
  unint64_t result = qword_100014448;
  if (!qword_100014448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014448);
  }
  return result;
}

ValueMetadata *type metadata accessor for VPNAppIntentWidgetBundle()
{
  return &type metadata for VPNAppIntentWidgetBundle;
}

uint64_t sub_10000CEA0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000CEBC()
{
  unint64_t result = qword_100014450;
  if (!qword_100014450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014450);
  }
  return result;
}

uint64_t sub_10000CF10()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000CF5C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_10000CF90()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_10000CFA0()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_10000CFE0()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_10000CFF0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_10000D000()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_10000D010()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_10000D020()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_10000D050()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_10000D060()
{
  return static IntentResult.result<A>(value:)();
}

uint64_t sub_10000D070()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_10000D080()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_10000D090()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_10000D0A0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_10000D0B0()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_10000D0C0()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_10000D0D0()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_10000D0E0()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_10000D0F0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_10000D100()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_10000D120()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_10000D130()
{
  return _UniqueEntityProvider.init(_:)();
}

uint64_t sub_10000D150()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_10000D160()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_10000D170()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_10000D1A0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_10000D1C0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_10000D1D0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_10000D1F0()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_10000D200()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_10000D210()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10000D220()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10000D230()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10000D240()
{
  return static WidgetBundle.main()();
}

uint64_t sub_10000D250()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_10000D270()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_10000D280()
{
  return Text.init<A>(_:)();
}

uint64_t sub_10000D290()
{
  return static ControlSize._1x1.getter();
}

uint64_t sub_10000D2A0()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_10000D2B0()
{
  return ControlPicker.init<A, B, C, D, E, F, G>(kind:displayName:preferredSize:intentUpdatableProperty:title:value:affordances:)();
}

uint64_t sub_10000D2C0()
{
  return ControlAffordances.init(tint:status:actionHint:)();
}

uint64_t sub_10000D2D0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000D2E0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000D2F0()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_10000D300()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10000D310()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10000D320()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
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

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}