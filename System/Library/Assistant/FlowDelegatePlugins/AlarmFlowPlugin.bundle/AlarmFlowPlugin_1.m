unint64_t sub_C2950()
{
  unint64_t result;

  result = qword_1426B8;
  if (!qword_1426B8)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1426B8);
  }
  return result;
}

unint64_t sub_C29A8()
{
  unint64_t result = qword_1426C0;
  if (!qword_1426C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1426C0);
  }
  return result;
}

uint64_t sub_C29FC()
{
  return sub_C158(&qword_1426C8, &qword_1426D0);
}

unint64_t sub_C2A3C()
{
  unint64_t result = qword_1426D8;
  if (!qword_1426D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1426D8);
  }
  return result;
}

unint64_t sub_C2A94()
{
  unint64_t result = qword_1426E0;
  if (!qword_1426E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1426E0);
  }
  return result;
}

uint64_t sub_C2AE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC15AlarmFlowPlugin13AlarmNLIntent_intent;
  uint64_t v4 = sub_10F928();
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_C2B60()
{
  return swift_retain();
}

uint64_t sub_C2B74(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return NLIntentWrapper.traversableIntentNode.getter(a1, WitnessTable);
}

uint64_t sub_C2BD8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return NLIntentWrapper.traversableOntologyNode.getter(a1, WitnessTable);
}

uint64_t sub_C2C2C()
{
  swift_getWitnessTable();

  return sub_10F0C8();
}

uint64_t sub_C2C80()
{
  return sub_C2CE8(&qword_1426E8);
}

uint64_t sub_C2CB4()
{
  return sub_C2CE8(&qword_1426F0);
}

uint64_t sub_C2CE8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AlarmNLIntent();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_C2D2C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_10E0B8();
  uint64_t v9 = *(void *)(v8 - 8);
  v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  Class isa = 0;
  if (v10(a1, 1, v8) != 1)
  {
    Class isa = sub_10E038().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  }
  if (v10(a2, 1, v8) == 1)
  {
    Class v12 = 0;
  }
  else
  {
    Class v12 = sub_10E038().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a2, v8);
  }
  id v13 = [v4 initWithStartDateComponents:isa endDateComponents:v12 recurrenceRule:a3];

  return v13;
}

uint64_t sub_C2E90(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_C2EA4(id a1)
{
  if (a1 != (char *)&dword_0 + 1) {
}
  }

uint64_t sub_C2EB4(uint64_t result)
{
  if (result != 1) {
    return swift_release();
  }
  return result;
}

unint64_t sub_C2EC4()
{
  unint64_t result = qword_142770;
  if (!qword_142770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_142770);
  }
  return result;
}

unint64_t sub_C2F18()
{
  unint64_t result = qword_142778;
  if (!qword_142778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_142778);
  }
  return result;
}

uint64_t sub_C2F6C()
{
  if (qword_13F110 != -1) {
    swift_once();
  }
  type metadata accessor for AlarmNLIntent();
  sub_C2CE8(&qword_1426E8);
  sub_10F318();
  if (!v3) {
    return 0;
  }
  uint64_t result = v2;
  uint64_t v1 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0) {
    uint64_t v1 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v1)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return result;
}

uint64_t sub_C3050()
{
  unint64_t v0 = sub_110E08();
  swift_bridgeObjectRelease();
  if (v0 >= 0x23) {
    return 35;
  }
  else {
    return v0;
  }
}

unint64_t sub_C30A4()
{
  unint64_t result = qword_142780;
  if (!qword_142780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_142780);
  }
  return result;
}

unint64_t sub_C30F8()
{
  unint64_t result = qword_142788;
  if (!qword_142788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_142788);
  }
  return result;
}

unint64_t sub_C314C()
{
  unint64_t result = qword_142790;
  if (!qword_142790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_142790);
  }
  return result;
}

unint64_t sub_C31A0()
{
  unint64_t result = qword_142798;
  if (!qword_142798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_142798);
  }
  return result;
}

unint64_t sub_C31F4()
{
  unint64_t result = qword_1427A0;
  if (!qword_1427A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1427A0);
  }
  return result;
}

unint64_t sub_C3248()
{
  unint64_t result = qword_1427A8;
  if (!qword_1427A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1427A8);
  }
  return result;
}

unint64_t sub_C329C()
{
  unint64_t result = qword_1427B0;
  if (!qword_1427B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1427B0);
  }
  return result;
}

uint64_t sub_C32F0(uint64_t result)
{
  if (result != 1) {
    return swift_retain();
  }
  return result;
}

id sub_C3300(id result)
{
  if (result != (char *)&dword_0 + 1) {
    return result;
  }
  return result;
}

uint64_t sub_C3310(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t type metadata accessor for ChangeAlarmStatusCATsSimple()
{
  uint64_t result = qword_142818;
  if (!qword_142818) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_C3380()
{
  return swift_initClassMetadata2();
}

uint64_t sub_C33C0(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return _swift_task_switch(sub_C33E0, 0, 0);
}

uint64_t sub_C33E0()
{
  uint64_t v1 = v0[2];
  sub_3DD4(&qword_13FC38);
  uint64_t v2 = swift_allocObject();
  v0[4] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_1117A0;
  *(void *)(v2 + 32) = 0x6D72616C61;
  *(void *)(v2 + 40) = 0xE500000000000000;
  uint64_t v3 = 0;
  if (v1)
  {
    uint64_t v3 = type metadata accessor for AlarmAlarm(0);
  }
  else
  {
    *(void *)(v2 + 56) = 0;
    *(void *)(v2 + 64) = 0;
  }
  *(void *)(v2 + 48) = v1;
  *(void *)(v2 + 72) = v3;
  v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:)
                                                                           + async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_C3518;
  return v6(0xD00000000000002FLL, 0x8000000000116D30, v2);
}

uint64_t sub_C3518(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 48) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return _swift_task_switch(sub_C4850, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t sub_C3670(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return _swift_task_switch(sub_C3690, 0, 0);
}

uint64_t sub_C3690()
{
  uint64_t v1 = v0[2];
  sub_3DD4(&qword_13FC38);
  uint64_t v2 = swift_allocObject();
  v0[4] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_1117A0;
  *(void *)(v2 + 32) = 0x6D72616C61;
  *(void *)(v2 + 40) = 0xE500000000000000;
  uint64_t v3 = 0;
  if (v1)
  {
    uint64_t v3 = type metadata accessor for AlarmAlarm(0);
  }
  else
  {
    *(void *)(v2 + 56) = 0;
    *(void *)(v2 + 64) = 0;
  }
  *(void *)(v2 + 48) = v1;
  *(void *)(v2 + 72) = v3;
  v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:)
                                                                           + async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_C3518;
  return v6(0xD00000000000002ELL, 0x8000000000116D00, v2);
}

uint64_t sub_C37C8(char a1, char a2, char a3, char a4, char a5, uint64_t a6, uint64_t a7, char a8)
{
  *(void *)(v9 + 24) = a7;
  *(void *)(v9 + 32) = v8;
  *(unsigned char *)(v9 + 78) = v12;
  *(unsigned char *)(v9 + 77) = a8;
  *(void *)(v9 + 16) = a6;
  *(unsigned char *)(v9 + 76) = a5;
  *(unsigned char *)(v9 + 75) = a4;
  *(unsigned char *)(v9 + 74) = a3;
  *(unsigned char *)(v9 + 73) = a2;
  *(unsigned char *)(v9 + 72) = a1;
  sub_3DD4(&qword_13FA88);
  *(void *)(v9 + 40) = swift_task_alloc();
  return _swift_task_switch(sub_C3884, 0, 0);
}

uint64_t sub_C3884()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 76);
  char v4 = *(unsigned char *)(v0 + 75);
  char v5 = *(unsigned char *)(v0 + 74);
  char v6 = *(unsigned char *)(v0 + 73);
  char v7 = *(unsigned char *)(v0 + 72);
  sub_3DD4(&qword_13FC38);
  uint64_t v8 = swift_allocObject();
  *(void *)(v0 + 48) = v8;
  *(_OWORD *)(v8 + 16) = xmmword_111A50;
  *(void *)(v8 + 32) = 0xD000000000000012;
  *(void *)(v8 + 40) = 0x8000000000115200;
  *(unsigned char *)(v8 + 48) = v7;
  *(void *)(v8 + 72) = &type metadata for Bool;
  *(void *)(v8 + 80) = 0xD000000000000017;
  *(void *)(v8 + 88) = 0x8000000000115260;
  *(unsigned char *)(v8 + 96) = v6;
  *(void *)(v8 + 120) = &type metadata for Bool;
  *(void *)(v8 + 128) = 0xD000000000000016;
  *(void *)(v8 + 136) = 0x8000000000115240;
  *(unsigned char *)(v8 + 144) = v5;
  *(void *)(v8 + 168) = &type metadata for Bool;
  *(void *)(v8 + 176) = 0xD000000000000018;
  *(void *)(v8 + 184) = 0x80000000001151E0;
  *(unsigned char *)(v8 + 192) = v4;
  *(void *)(v8 + 216) = &type metadata for Bool;
  *(void *)(v8 + 224) = 0xD000000000000016;
  *(void *)(v8 + 232) = 0x8000000000115220;
  *(unsigned char *)(v8 + 240) = v3;
  uint64_t v9 = (uint64_t *)(v8 + 288);
  *(void *)(v8 + 264) = &type metadata for Bool;
  *(void *)(v8 + 272) = 0xD000000000000012;
  *(void *)(v8 + 280) = 0x8000000000115280;
  sub_AFBC(v2, v1, &qword_13FA88);
  uint64_t v10 = sub_10FBC8();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v1, 1, v10);
  uint64_t v13 = *(void *)(v0 + 40);
  if (v12 == 1)
  {
    sub_1646C(*(void *)(v0 + 40), &qword_13FA88);
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v8 + 304) = 0u;
  }
  else
  {
    *(void *)(v8 + 312) = v10;
    v14 = sub_31294(v9);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v11 + 32))(v14, v13, v10);
  }
  uint64_t v15 = *(void *)(v0 + 24);
  *(void *)(v8 + 320) = 0xD000000000000011;
  *(void *)(v8 + 328) = 0x80000000001152A0;
  uint64_t v16 = 0;
  if (v15)
  {
    uint64_t v16 = sub_10FB08();
  }
  else
  {
    *(void *)(v8 + 344) = 0;
    *(void *)(v8 + 352) = 0;
  }
  char v17 = *(unsigned char *)(v0 + 78);
  char v18 = *(unsigned char *)(v0 + 77);
  *(void *)(v8 + 336) = v15;
  *(void *)(v8 + 360) = v16;
  *(void *)(v8 + 368) = 0xD000000000000010;
  *(void *)(v8 + 376) = 0x80000000001151C0;
  *(unsigned char *)(v8 + 384) = v18;
  *(void *)(v8 + 408) = &type metadata for Bool;
  strcpy((char *)(v8 + 416), "isMixedAlarms");
  *(_WORD *)(v8 + 430) = -4864;
  *(void *)(v8 + 456) = &type metadata for Bool;
  *(unsigned char *)(v8 + 432) = v17;
  v21 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:)
                                                                            + async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  swift_retain();
  v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v19;
  void *v19 = v0;
  v19[1] = sub_C3BC8;
  return v21(0xD000000000000037, 0x8000000000116CC0, v8);
}

uint64_t sub_C3BC8(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 64) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return _swift_task_switch(sub_C4854, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    char v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t sub_C3D24(char a1, char a2, char a3, char a4, char a5, uint64_t a6, uint64_t a7, char a8)
{
  *(void *)(v9 + 24) = a7;
  *(void *)(v9 + 32) = v8;
  *(unsigned char *)(v9 + 78) = v12;
  *(unsigned char *)(v9 + 77) = a8;
  *(void *)(v9 + 16) = a6;
  *(unsigned char *)(v9 + 76) = a5;
  *(unsigned char *)(v9 + 75) = a4;
  *(unsigned char *)(v9 + 74) = a3;
  *(unsigned char *)(v9 + 73) = a2;
  *(unsigned char *)(v9 + 72) = a1;
  sub_3DD4(&qword_13FA88);
  *(void *)(v9 + 40) = swift_task_alloc();
  return _swift_task_switch(sub_C3DE0, 0, 0);
}

uint64_t sub_C3DE0()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 76);
  char v4 = *(unsigned char *)(v0 + 75);
  char v5 = *(unsigned char *)(v0 + 74);
  char v6 = *(unsigned char *)(v0 + 73);
  char v7 = *(unsigned char *)(v0 + 72);
  sub_3DD4(&qword_13FC38);
  uint64_t v8 = swift_allocObject();
  *(void *)(v0 + 48) = v8;
  *(_OWORD *)(v8 + 16) = xmmword_111A50;
  *(void *)(v8 + 32) = 0xD000000000000012;
  *(void *)(v8 + 40) = 0x8000000000115200;
  *(unsigned char *)(v8 + 48) = v7;
  *(void *)(v8 + 72) = &type metadata for Bool;
  *(void *)(v8 + 80) = 0xD000000000000017;
  *(void *)(v8 + 88) = 0x8000000000115260;
  *(unsigned char *)(v8 + 96) = v6;
  *(void *)(v8 + 120) = &type metadata for Bool;
  *(void *)(v8 + 128) = 0xD000000000000016;
  *(void *)(v8 + 136) = 0x8000000000115240;
  *(unsigned char *)(v8 + 144) = v5;
  *(void *)(v8 + 168) = &type metadata for Bool;
  *(void *)(v8 + 176) = 0xD000000000000018;
  *(void *)(v8 + 184) = 0x80000000001151E0;
  *(unsigned char *)(v8 + 192) = v4;
  *(void *)(v8 + 216) = &type metadata for Bool;
  *(void *)(v8 + 224) = 0xD000000000000016;
  *(void *)(v8 + 232) = 0x8000000000115220;
  *(unsigned char *)(v8 + 240) = v3;
  uint64_t v9 = (uint64_t *)(v8 + 288);
  *(void *)(v8 + 264) = &type metadata for Bool;
  *(void *)(v8 + 272) = 0xD000000000000012;
  *(void *)(v8 + 280) = 0x8000000000115280;
  sub_AFBC(v2, v1, &qword_13FA88);
  uint64_t v10 = sub_10FBC8();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v1, 1, v10);
  uint64_t v13 = *(void *)(v0 + 40);
  if (v12 == 1)
  {
    sub_1646C(*(void *)(v0 + 40), &qword_13FA88);
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v8 + 304) = 0u;
  }
  else
  {
    *(void *)(v8 + 312) = v10;
    v14 = sub_31294(v9);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v11 + 32))(v14, v13, v10);
  }
  uint64_t v15 = *(void *)(v0 + 24);
  *(void *)(v8 + 320) = 0xD000000000000011;
  *(void *)(v8 + 328) = 0x80000000001152A0;
  uint64_t v16 = 0;
  if (v15)
  {
    uint64_t v16 = sub_10FB08();
  }
  else
  {
    *(void *)(v8 + 344) = 0;
    *(void *)(v8 + 352) = 0;
  }
  char v17 = *(unsigned char *)(v0 + 78);
  char v18 = *(unsigned char *)(v0 + 77);
  *(void *)(v8 + 336) = v15;
  *(void *)(v8 + 360) = v16;
  *(void *)(v8 + 368) = 0xD000000000000010;
  *(void *)(v8 + 376) = 0x80000000001151C0;
  *(unsigned char *)(v8 + 384) = v18;
  *(void *)(v8 + 408) = &type metadata for Bool;
  strcpy((char *)(v8 + 416), "isMixedAlarms");
  *(_WORD *)(v8 + 430) = -4864;
  *(void *)(v8 + 456) = &type metadata for Bool;
  *(unsigned char *)(v8 + 432) = v17;
  v21 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:)
                                                                            + async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  swift_retain();
  v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v19;
  void *v19 = v0;
  v19[1] = sub_89AD0;
  return v21(0xD000000000000036, 0x8000000000116C80, v8);
}

uint64_t sub_C4124(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return _swift_task_switch(sub_C4144, 0, 0);
}

uint64_t sub_C4144()
{
  uint64_t v1 = v0[2];
  sub_3DD4(&qword_13FC38);
  uint64_t v2 = swift_allocObject();
  v0[4] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_1117A0;
  *(void *)(v2 + 32) = 0x616C417065656C73;
  *(void *)(v2 + 40) = 0xEA00000000006D72;
  uint64_t v3 = 0;
  if (v1)
  {
    uint64_t v3 = type metadata accessor for AlarmAlarm(0);
  }
  else
  {
    *(void *)(v2 + 56) = 0;
    *(void *)(v2 + 64) = 0;
  }
  *(void *)(v2 + 48) = v1;
  *(void *)(v2 + 72) = v3;
  char v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:)
                                                                           + async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  swift_retain();
  char v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  *char v4 = v0;
  v4[1] = sub_C3518;
  return v6(0xD00000000000002DLL, 0x8000000000116C50, v2);
}

uint64_t sub_C4284(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return _swift_task_switch(sub_C42A4, 0, 0);
}

uint64_t sub_C42A4()
{
  uint64_t v1 = v0[2];
  sub_3DD4(&qword_13FC38);
  uint64_t v2 = swift_allocObject();
  v0[4] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_1117A0;
  *(void *)(v2 + 32) = 0x616C417065656C73;
  *(void *)(v2 + 40) = 0xEA00000000006D72;
  uint64_t v3 = 0;
  if (v1)
  {
    uint64_t v3 = type metadata accessor for AlarmAlarm(0);
  }
  else
  {
    *(void *)(v2 + 56) = 0;
    *(void *)(v2 + 64) = 0;
  }
  *(void *)(v2 + 48) = v1;
  *(void *)(v2 + 72) = v3;
  char v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:)
                                                                           + async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  swift_retain();
  char v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  *char v4 = v0;
  v4[1] = sub_C43E4;
  return v6(0xD00000000000002CLL, 0x8000000000116C20, v2);
}

uint64_t sub_C43E4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 48) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return _swift_task_switch(sub_C453C, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    char v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t sub_C453C()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_C45A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FC68();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3DD4((uint64_t *)&unk_13F780);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  sub_AFBC(a1, (uint64_t)v10, (uint64_t *)&unk_13F780);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = sub_10FBD8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_1646C(a1, (uint64_t *)&unk_13F780);
  return v11;
}

uint64_t sub_C4738(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10FC68();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a2, v3);
  uint64_t v7 = sub_10FBE8();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a2, v3);
  return v7;
}

uint64_t sub_C4848()
{
  return type metadata accessor for ChangeAlarmStatusCATsSimple();
}

void *sub_C4858(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)v4 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_110088();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = sub_3DD4((uint64_t *)&unk_140770);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return v4;
}

uint64_t sub_C49F8(uint64_t a1, uint64_t a2)
{
  _s20HandleIntentStrategyVwxx_1(a1);
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_110088();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    long long v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t sub_C4AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_110088();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_3DD4((uint64_t *)&unk_140770);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t *sub_C4C0C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  sub_31D24(a1, a2);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_110088();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = sub_3DD4((uint64_t *)&unk_140770);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t sub_C4D88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (const void *)(a2 + v5);
  uint64_t v8 = sub_110088();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    uint64_t v10 = sub_3DD4((uint64_t *)&unk_140770);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t sub_C4EA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _s20HandleIntentStrategyVwxx_1(a1);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_110088();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_3DD4((uint64_t *)&unk_140770);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_C5030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_C5044);
}

uint64_t sub_C5044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_3DD4((uint64_t *)&unk_140770);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_C50F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_C510C);
}

uint64_t sub_C510C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_3DD4((uint64_t *)&unk_140770);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t _s21ConfirmIntentStrategyVMa()
{
  uint64_t result = qword_142908;
  if (!qword_142908) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_C5204()
{
  sub_C529C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_C529C()
{
  if (!qword_142918)
  {
    sub_110088();
    unint64_t v0 = sub_110B18();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_142918);
    }
  }
}

uint64_t sub_C52F4()
{
  uint64_t v0 = sub_110778();
  sub_2D924(v0, qword_142898);
  sub_3E18(v0, (uint64_t)qword_142898);
  return sub_1104D8();
}

uint64_t sub_C5340@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_3DD4(&qword_13F818);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_13F150 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_110778();
  sub_3E18(v9, (uint64_t)qword_142898);
  uint64_t v10 = sub_110768();
  os_log_type_t v11 = sub_1109F8();
  if (os_log_type_enabled(v10, v11))
  {
    int v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v12 = 0;
    _os_log_impl(&dword_0, v10, v11, "SnoozeAlarm.ConfirmIntentStrategy.actionForInput() called.", v12, 2u);
    swift_slowDealloc();
  }

  int v13 = (void *)(v3 + *(int *)(_s21ConfirmIntentStrategyVMa() + 20));
  uint64_t v14 = enum case for DecideAction.PromptExpectation.confirmation(_:);
  uint64_t v15 = sub_10FEA8();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 104))(v8, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v8, 0, 1, v15);
  sub_55260(a1, v13, 0, (uint64_t)v8, a2);
  return sub_1646C((uint64_t)v8, &qword_13F818);
}

uint64_t sub_C553C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_3DD4((uint64_t *)&unk_13F7B0);
  v3[5] = swift_task_alloc();
  uint64_t v4 = sub_10EB78();
  v3[6] = v4;
  v3[7] = *(void *)(v4 - 8);
  v3[8] = swift_task_alloc();
  return _swift_task_switch(sub_C5630, 0, 0);
}

uint64_t sub_C5630()
{
  if (qword_13F150 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_110778();
  sub_3E18(v1, (uint64_t)qword_142898);
  uint64_t v2 = sub_110768();
  os_log_type_t v3 = sub_1109F8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "SnoozeAlarm.ConfirmIntentStrategy.parseConfirmationResponse() called.", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v6 = v0[7];
  uint64_t v5 = v0[8];
  uint64_t v7 = v0[5];
  uint64_t v8 = v0[6];
  uint64_t v9 = v0[3];

  sub_2B828(v9, v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v7, v5, v8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v7, 0, 1, v8);
  sub_3DD4(&qword_141CD8);
  sub_10EC18();
  sub_110308();
  sub_10EB48();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_C5810(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  sub_3DD4(&qword_13F908);
  v2[9] = swift_task_alloc();
  uint64_t v3 = sub_10EAF8();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  sub_10E828();
  v2[13] = swift_task_alloc();
  uint64_t v4 = sub_10EC88();
  v2[14] = v4;
  v2[15] = *(void *)(v4 - 8);
  v2[16] = swift_task_alloc();
  uint64_t v5 = sub_110778();
  v2[17] = v5;
  v2[18] = *(void *)(v5 - 8);
  v2[19] = swift_task_alloc();
  uint64_t v6 = sub_10FD58();
  v2[20] = v6;
  v2[21] = *(void *)(v6 - 8);
  v2[22] = swift_task_alloc();
  uint64_t v7 = sub_10FD78();
  v2[23] = v7;
  v2[24] = *(void *)(v7 - 8);
  v2[25] = swift_task_alloc();
  uint64_t v8 = sub_10FDC8();
  v2[26] = v8;
  v2[27] = *(void *)(v8 - 8);
  v2[28] = swift_task_alloc();
  sub_3DD4(&qword_13FA88);
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  uint64_t v9 = sub_10EAB8();
  v2[31] = v9;
  v2[32] = *(void *)(v9 - 8);
  v2[33] = swift_task_alloc();
  uint64_t v10 = sub_1103B8();
  v2[34] = v10;
  v2[35] = *(void *)(v10 - 8);
  v2[36] = swift_task_alloc();
  sub_3DD4((uint64_t *)&unk_140770);
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  v2[39] = swift_task_alloc();
  return _swift_task_switch(sub_C5C3C, 0, 0);
}

uint64_t sub_C5C3C()
{
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = v2 + *(int *)(_s21ConfirmIntentStrategyVMa() + 20);
  sub_5B788(v3, v1);
  uint64_t v4 = sub_110088();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(v1, 1, v4);
  uint64_t v8 = *(void *)(v0 + 312);
  if (v7 == 1)
  {
    sub_1646C(*(void *)(v0 + 312), (uint64_t *)&unk_140770);
  }
  else
  {
    uint64_t v9 = (void *)sub_10FF78();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v4);
    if (v9)
    {
      char v10 = sub_110658();

      goto LABEL_6;
    }
  }
  char v10 = 0;
LABEL_6:
  uint64_t v11 = *(void *)(v0 + 304);
  uint64_t v12 = *(void *)(v0 + 288);
  uint64_t v13 = *(void *)(v0 + 264);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 280) + 104))(v12, enum case for AlarmNLv4Constants.AlarmVerb.snooze(_:), *(void *)(v0 + 272));
  sub_C946C(v12, v13);
  sub_5B788(v3, v11);
  int v14 = v6(v11, 1, v4);
  uint64_t v15 = *(void *)(v0 + 304);
  if (v14 == 1)
  {
    sub_1646C(*(void *)(v0 + 304), (uint64_t *)&unk_140770);
  }
  else
  {
    uint64_t v16 = (void *)sub_10FF78();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v15, v4);
    if (v16)
    {
      sub_1106A8();
      uint64_t v18 = v17;

      if (v18)
      {
        uint64_t v19 = *(void *)(v0 + 240);
        sub_110878();
        swift_bridgeObjectRelease();
        uint64_t v20 = sub_10FBC8();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 0, 1, v20);
        goto LABEL_12;
      }
    }
  }
  uint64_t v21 = *(void *)(v0 + 240);
  uint64_t v22 = sub_10FBC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
LABEL_12:
  uint64_t v23 = *(void *)(v0 + 296);
  sub_5B788(v3, v23);
  int v24 = v6(v23, 1, v4);
  uint64_t v25 = *(void *)(v0 + 296);
  if (v24 == 1)
  {
    sub_1646C(*(void *)(v0 + 296), (uint64_t *)&unk_140770);
  }
  else
  {
    v26 = (void *)sub_10FF78();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v25, v4);
    if (v26)
    {
      sub_1106B8();
      uint64_t v28 = v27;

      if (v28)
      {
        uint64_t v29 = *(void *)(v0 + 232);
        sub_110878();
        swift_bridgeObjectRelease();
        uint64_t v30 = sub_10FBC8();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v29, 0, 1, v30);
        goto LABEL_18;
      }
    }
  }
  uint64_t v31 = *(void *)(v0 + 232);
  uint64_t v32 = sub_10FBC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v31, 1, 1, v32);
LABEL_18:
  uint64_t v34 = *(void *)(v0 + 216);
  uint64_t v33 = *(void *)(v0 + 224);
  uint64_t v35 = *(void *)(v0 + 208);
  sub_10FDB8();
  BOOL v36 = sub_10FDA8();
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v35);
  if (v36)
  {
    v37 = (void *)sub_10EB08();

    uint64_t v39 = sub_110AE8();
    uint64_t v41 = v40;

    *(void *)(v0 + 320) = v41;
    if (v41)
    {
      v42 = (void *)sub_10EB08();
      v44 = v43;

      uint64_t v45 = sub_110AE8();
      uint64_t v47 = v46;

      *(void *)(v0 + 328) = v47;
      if (v47)
      {
        uint64_t v69 = v45;
        (*(void (**)(void, void, void))(*(void *)(v0 + 168) + 104))(*(void *)(v0 + 176), enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), *(void *)(v0 + 160));
        if (qword_13F150 != -1) {
          swift_once();
        }
        uint64_t v48 = *(void *)(v0 + 144);
        uint64_t v49 = *(void *)(v0 + 152);
        uint64_t v50 = *(void *)(v0 + 136);
        uint64_t v51 = sub_3E18(v50, (uint64_t)qword_142898);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16))(v49, v51, v50);
        mach_absolute_time();
        sub_10FD88();
        if (qword_13F058 != -1) {
          swift_once();
        }
        v52 = (int8x16_t *)swift_task_alloc();
        *(void *)(v0 + 336) = v52;
        v52[1] = vextq_s8(*(int8x16_t *)(v0 + 232), *(int8x16_t *)(v0 + 232), 8uLL);
        v52[2].i64[0] = v69;
        v52[2].i64[1] = v47;
        v52[3].i64[0] = v39;
        v52[3].i64[1] = v41;
        v53 = (void *)swift_task_alloc();
        *(void *)(v0 + 344) = v53;
        void *v53 = v0;
        v53[1] = sub_C6508;
        return sub_84A04(v10 & 1, (v10 & 1) == 0, (uint64_t)sub_C8080, (uint64_t)v52);
      }
      swift_bridgeObjectRelease();
    }
    if (qword_13F150 != -1) {
      swift_once();
    }
    sub_3E18(*(void *)(v0 + 136), (uint64_t)qword_142898);
    v59 = sub_110768();
    os_log_type_t v60 = sub_1109E8();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v61 = 0;
      _os_log_impl(&dword_0, v59, v60, "Could not create direct invocation for confirm or reject actions.", v61, 2u);
      swift_slowDealloc();
    }

    sub_3DD4(&qword_1401F0);
    sub_425E8();
    swift_allocError();
    unsigned char *v62 = 0;
    swift_willThrow();
    uint64_t v64 = *(void *)(v0 + 256);
    uint64_t v63 = *(void *)(v0 + 264);
    uint64_t v66 = *(void *)(v0 + 240);
    uint64_t v65 = *(void *)(v0 + 248);
    uint64_t v67 = *(void *)(v0 + 232);
    (*(void (**)(void, void))(*(void *)(v0 + 280) + 8))(*(void *)(v0 + 288), *(void *)(v0 + 272));
    sub_1646C(v67, &qword_13FA88);
    sub_1646C(v66, &qword_13FA88);
    (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v63, v65);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v68 = *(uint64_t (**)(void))(v0 + 8);
    return v68();
  }
  else
  {
    if (qword_13F050 != -1) {
      swift_once();
    }
    v55 = (void *)swift_task_alloc();
    *(void *)(v0 + 384) = v55;
    void *v55 = v0;
    v55[1] = sub_C6AC8;
    uint64_t v57 = *(void *)(v0 + 232);
    uint64_t v56 = *(void *)(v0 + 240);
    uint64_t v58 = *(void *)(v0 + 96);
    return sub_FB3D8(v58, (v10 & 1) == 0, v10 & 1, v56, v57);
  }
}

uint64_t sub_C6508(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 352) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v5 = sub_C71F0;
  }
  else
  {
    *(void *)(v4 + 360) = a1;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v5 = sub_C6698;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_C6698()
{
  uint64_t v1 = v0[33];
  sub_10E7C8();
  *(void *)(swift_task_alloc() + 16) = v1;
  sub_10EC58();
  swift_task_dealloc();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[46] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_C6794;
  uint64_t v3 = v0[25];
  uint64_t v4 = v0[16];
  uint64_t v5 = v0[7];
  return PatternExecutionResult.generatePatternOutput(manifest:measure:)(v5, v4, v3);
}

uint64_t sub_C6794()
{
  uint64_t v2 = *(void **)(*(void *)v1 + 360);
  uint64_t v3 = *(void *)(*(void *)v1 + 128);
  uint64_t v4 = *(void *)(*(void *)v1 + 120);
  uint64_t v5 = *(void *)(*(void *)v1 + 112);
  *(void *)(*(void *)v1 + 376) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);

  if (v0) {
    uint64_t v6 = sub_C7398;
  }
  else {
    uint64_t v6 = sub_C6924;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_C6924()
{
  uint64_t v2 = v0[35];
  uint64_t v1 = v0[36];
  uint64_t v4 = v0[33];
  uint64_t v3 = v0[34];
  uint64_t v5 = v0[31];
  uint64_t v6 = v0[32];
  uint64_t v8 = v0[29];
  uint64_t v7 = v0[30];
  (*(void (**)(void, void))(v0[24] + 8))(v0[25], v0[23]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_1646C(v8, &qword_13FA88);
  sub_1646C(v7, &qword_13FA88);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_C6AC8()
{
  uint64_t v2 = (void *)*v1;
  v2[49] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_C7540, 0, 0);
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&dword_141D40 + dword_141D40);
    uint64_t v3 = (void *)swift_task_alloc();
    v2[50] = v3;
    *uint64_t v3 = v2;
    v3[1] = sub_C6C54;
    uint64_t v4 = v2[36];
    return v6(v4);
  }
}

uint64_t sub_C6C54(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 408) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_C7048;
  }
  else
  {
    *(void *)(v4 + 416) = a1;
    uint64_t v5 = sub_C6D7C;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_C6D7C()
{
  uint64_t v1 = *(void *)(v0 + 264);
  uint64_t v14 = *(void *)(v0 + 272);
  uint64_t v15 = *(void *)(v0 + 288);
  uint64_t v2 = *(void *)(v0 + 248);
  uint64_t v3 = *(void *)(v0 + 256);
  uint64_t v16 = *(void *)(v0 + 240);
  uint64_t v12 = *(void *)(v0 + 280);
  uint64_t v13 = *(void *)(v0 + 232);
  uint64_t v9 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v10 = *(void *)(v0 + 88);
  uint64_t v11 = *(void *)(v0 + 80);
  uint64_t v5 = *(uint64_t **)(v0 + 56);
  sub_17BD8(*(void **)(v0 + 64), *(void *)(*(void *)(v0 + 64) + 24));
  sub_10E788();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v1, v2);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
  uint64_t v6 = sub_10EED8();
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  v5[3] = v6;
  v5[4] = (uint64_t)&protocol witness table for AceOutput;
  sub_31294(v5);
  sub_10E9A8();
  swift_bridgeObjectRelease();
  sub_1646C(v0 + 16, &qword_13F910);
  sub_1646C(v4, &qword_13F908);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v14);
  sub_1646C(v13, &qword_13FA88);
  sub_1646C(v16, &qword_13FA88);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_C7048()
{
  (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
  uint64_t v1 = v0[32];
  uint64_t v2 = v0[33];
  uint64_t v4 = v0[30];
  uint64_t v3 = v0[31];
  uint64_t v5 = v0[29];
  (*(void (**)(void, void))(v0[35] + 8))(v0[36], v0[34]);
  sub_1646C(v5, &qword_13FA88);
  sub_1646C(v4, &qword_13FA88);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_C71F0()
{
  (*(void (**)(void, void))(v0[24] + 8))(v0[25], v0[23]);
  uint64_t v1 = v0[32];
  uint64_t v2 = v0[33];
  uint64_t v4 = v0[30];
  uint64_t v3 = v0[31];
  uint64_t v5 = v0[29];
  (*(void (**)(void, void))(v0[35] + 8))(v0[36], v0[34]);
  sub_1646C(v5, &qword_13FA88);
  sub_1646C(v4, &qword_13FA88);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_C7398()
{
  (*(void (**)(void, void))(v0[24] + 8))(v0[25], v0[23]);
  uint64_t v1 = v0[32];
  uint64_t v2 = v0[33];
  uint64_t v4 = v0[30];
  uint64_t v3 = v0[31];
  uint64_t v5 = v0[29];
  (*(void (**)(void, void))(v0[35] + 8))(v0[36], v0[34]);
  sub_1646C(v5, &qword_13FA88);
  sub_1646C(v4, &qword_13FA88);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_C7540()
{
  uint64_t v1 = v0[32];
  uint64_t v2 = v0[33];
  uint64_t v4 = v0[30];
  uint64_t v3 = v0[31];
  uint64_t v5 = v0[29];
  (*(void (**)(void, void))(v0[35] + 8))(v0[36], v0[34]);
  sub_1646C(v5, &qword_13FA88);
  sub_1646C(v4, &qword_13FA88);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_C76D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_3DD4(&qword_13FA88);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (int *)type metadata accessor for SnoozeConfirmOtherRoomParameters(0);
  sub_17604(a2, a1 + v9[5]);
  sub_17604(a3, a1 + v9[8]);
  swift_bridgeObjectRetain();
  sub_10FB98();
  uint64_t v10 = sub_10FBC8();
  uint64_t v11 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
  v11(v8, 0, 1, v10);
  sub_33F10((uint64_t)v8, a1);
  swift_bridgeObjectRetain();
  sub_10FB98();
  v11(v8, 0, 1, v10);
  return sub_33F10((uint64_t)v8, a1 + v9[9]);
}

uint64_t sub_C784C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_3DD4(&qword_13F908);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10EC78();
  uint64_t v6 = sub_10EAB8();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  return sub_10EC68();
}

uint64_t sub_C7958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_13024;
  return sub_C553C(a1, a2, a3);
}

uint64_t sub_C7A08(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 32) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_C7AB0;
  return sub_C5810(a1);
}

uint64_t sub_C7AB0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_C7BE4, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_C7BE4()
{
  v0[3] = v0[5];
  sub_3DD4(&qword_13FA70);
  sub_10FF38();
  swift_willThrow();
  swift_errorRelease();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_C7CA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_13024;
  return ConfirmIntentFlowStrategyAsync.makeRepromptOnEmptyParse(confirmParameters:)(a1, a2, a3, a4);
}

uint64_t sub_C7D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_13024;
  return ConfirmIntentFlowStrategyAsync.makeRepromptOnLowConfidence(confirmParameters:)(a1, a2, a3, a4);
}

uint64_t sub_C7E2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_13024;
  return ConfirmIntentFlowStrategyAsync.makeConfirmationRejectedResponse(confirmParameters:)(a1, a2, a3, a4);
}

uint64_t sub_C7EF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_33C04;
  return ConfirmIntentFlowStrategyAsync.makeFlowCancelledResponse(confirmParameters:)(a1, a2, a3, a4);
}

uint64_t sub_C7FB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_13024;
  return ConfirmIntentFlowStrategyAsync.makeErrorResponse(error:confirmParameters:)(a1, a2, a3, a4, a5);
}

uint64_t sub_C8080(uint64_t a1)
{
  return sub_C76D0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_C8090(uint64_t a1)
{
  return sub_C784C(a1, *(void *)(v1 + 16));
}

uint64_t type metadata accessor for DeleteAlarmCATPatternsExecutor(uint64_t a1)
{
  return sub_19B4C(a1, (uint64_t *)&unk_142990);
}

uint64_t sub_C80B8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_C80F8()
{
  uint64_t v1 = sub_3DD4(&qword_13FA88);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3DD4(&qword_13FC38);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_112960;
  strcpy((char *)(v4 + 32), "isMixedAlarms");
  *(_WORD *)(v4 + 46) = -4864;
  *(unsigned char *)(v4 + 48) = *v0;
  *(void *)(v4 + 72) = &type metadata for Bool;
  *(void *)(v4 + 80) = 0xD000000000000010;
  *(void *)(v4 + 88) = 0x80000000001151C0;
  *(unsigned char *)(v4 + 96) = v0[1];
  *(void *)(v4 + 120) = &type metadata for Bool;
  *(void *)(v4 + 128) = 0xD000000000000018;
  *(void *)(v4 + 136) = 0x80000000001151E0;
  *(unsigned char *)(v4 + 144) = v0[2];
  *(void *)(v4 + 168) = &type metadata for Bool;
  *(void *)(v4 + 176) = 0xD000000000000012;
  *(void *)(v4 + 184) = 0x8000000000115200;
  *(unsigned char *)(v4 + 192) = v0[3];
  *(void *)(v4 + 216) = &type metadata for Bool;
  *(void *)(v4 + 224) = 0xD000000000000016;
  *(void *)(v4 + 232) = 0x8000000000115220;
  *(unsigned char *)(v4 + 240) = v0[4];
  *(void *)(v4 + 264) = &type metadata for Bool;
  *(void *)(v4 + 272) = 0xD000000000000016;
  *(void *)(v4 + 280) = 0x8000000000115240;
  *(unsigned char *)(v4 + 288) = v0[5];
  *(void *)(v4 + 312) = &type metadata for Bool;
  *(void *)(v4 + 320) = 0xD000000000000017;
  *(void *)(v4 + 328) = 0x8000000000115260;
  *(unsigned char *)(v4 + 336) = v0[6];
  *(void *)(v4 + 360) = &type metadata for Bool;
  *(void *)(v4 + 368) = 0x68637461577369;
  *(void *)(v4 + 376) = 0xE700000000000000;
  *(unsigned char *)(v4 + 384) = v0[7];
  uint64_t v5 = (uint64_t *)(v4 + 432);
  *(void *)(v4 + 408) = &type metadata for Bool;
  *(void *)(v4 + 416) = 0xD000000000000012;
  *(void *)(v4 + 424) = 0x8000000000115280;
  uint64_t v6 = type metadata accessor for DeleteAlarmIntentHandledMultipleParameters(0);
  sub_AFBC((uint64_t)&v0[*(int *)(v6 + 48)], (uint64_t)v3, &qword_13FA88);
  uint64_t v7 = sub_10FBC8();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v3, 1, v7) == 1)
  {
    sub_1646C((uint64_t)v3, &qword_13FA88);
    *(_OWORD *)uint64_t v5 = 0u;
    *(_OWORD *)(v4 + 448) = 0u;
  }
  else
  {
    *(void *)(v4 + 456) = v7;
    uint64_t v9 = sub_31294(v5);
    (*(void (**)(uint64_t *, char *, uint64_t))(v8 + 32))(v9, v3, v7);
  }
  *(void *)(v4 + 464) = 0xD000000000000011;
  *(void *)(v4 + 472) = 0x80000000001152A0;
  uint64_t v10 = *(void *)&v0[*(int *)(v6 + 52)];
  if (v10)
  {
    uint64_t v11 = sub_10FB08();
  }
  else
  {
    uint64_t v11 = 0;
    *(void *)(v4 + 488) = 0;
    *(void *)(v4 + 496) = 0;
  }
  *(void *)(v4 + 480) = v10;
  *(void *)(v4 + 504) = v11;
  swift_retain();
  return v4;
}

uint64_t sub_C8400(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FC68();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3DD4((uint64_t *)&unk_13F780);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  sub_AFBC(a1, (uint64_t)v10, (uint64_t *)&unk_13F780);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = sub_10FB18();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_1646C(a1, (uint64_t *)&unk_13F780);
  return v11;
}

uint64_t sub_C8598()
{
  return type metadata accessor for DeleteAlarmCATPatternsExecutor(0);
}

uint64_t sub_C85A0(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  *(unsigned char *)(v3 + 48) = a1;
  return _swift_task_switch(sub_C85C4, 0, 0);
}

uint64_t sub_C85C4()
{
  uint64_t v1 = *(void *)(v0 + 24);
  char v2 = *(unsigned char *)(v0 + 48);
  sub_3DD4(&qword_13FC38);
  uint64_t v3 = swift_allocObject();
  *(void *)(v0 + 32) = v3;
  *(_OWORD *)(v3 + 16) = xmmword_112860;
  *(void *)(v3 + 32) = 0x6D72616C61;
  *(void *)(v3 + 40) = 0xE500000000000000;
  uint64_t v4 = type metadata accessor for AlarmAlarm(0);
  *(void *)(v3 + 48) = v1;
  *(void *)(v3 + 88) = 0x80000000001156D0;
  *(void *)(v3 + 120) = &type metadata for Bool;
  *(unsigned char *)(v3 + 96) = v2;
  uint64_t v7 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                           + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  *(void *)(v3 + 72) = v4;
  *(void *)(v3 + 80) = 0xD000000000000014;
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_C926C;
  return v7(0xD000000000000019, 0x8000000000116E10, v3);
}

uint64_t sub_C8724(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  *(unsigned char *)(v3 + 48) = a1;
  return _swift_task_switch(sub_C8748, 0, 0);
}

uint64_t sub_C8748()
{
  uint64_t v1 = *(void *)(v0 + 24);
  char v2 = *(unsigned char *)(v0 + 48);
  sub_3DD4(&qword_13FC38);
  uint64_t v3 = swift_allocObject();
  *(void *)(v0 + 32) = v3;
  *(_OWORD *)(v3 + 16) = xmmword_112860;
  *(void *)(v3 + 32) = 0x6D72616C61;
  *(void *)(v3 + 40) = 0xE500000000000000;
  uint64_t v4 = type metadata accessor for AlarmAlarm(0);
  *(void *)(v3 + 48) = v1;
  *(void *)(v3 + 88) = 0x80000000001156D0;
  *(void *)(v3 + 120) = &type metadata for Bool;
  *(unsigned char *)(v3 + 96) = v2;
  uint64_t v7 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                           + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  *(void *)(v3 + 72) = v4;
  *(void *)(v3 + 80) = 0xD000000000000014;
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_C88A8;
  return v7(0xD000000000000019, 0x8000000000116E10, v3);
}

uint64_t sub_C88A8(uint64_t a1)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v4 = swift_bridgeObjectRelease();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_C89CC(char a1, char a2, char a3, char a4, char a5, char a6, char a7, char a8)
{
  *(void *)(v8 + 16) = v11;
  *(void *)(v8 + 24) = v12;
  *(unsigned char *)(v8 + 87) = a8;
  *(unsigned char *)(v8 + 86) = a7;
  *(unsigned char *)(v8 + 85) = a6;
  *(unsigned char *)(v8 + 84) = a5;
  *(unsigned char *)(v8 + 83) = a4;
  *(unsigned char *)(v8 + 82) = a3;
  *(unsigned char *)(v8 + 81) = a2;
  *(unsigned char *)(v8 + 80) = a1;
  *(void *)(v8 + 32) = type metadata accessor for DeleteAlarmIntentHandledMultipleParameters(0);
  *(void *)(v8 + 40) = swift_task_alloc();
  return _swift_task_switch(sub_C8A88, 0, 0);
}

uint64_t sub_C8A88()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(unsigned char **)(v0 + 40);
  uint64_t v16 = *(void **)(v0 + 24);
  char v14 = *(unsigned char *)(v0 + 86);
  char v15 = *(unsigned char *)(v0 + 87);
  char v3 = *(unsigned char *)(v0 + 85);
  char v4 = *(unsigned char *)(v0 + 84);
  char v5 = *(unsigned char *)(v0 + 83);
  char v6 = *(unsigned char *)(v0 + 82);
  char v7 = *(unsigned char *)(v0 + 81);
  char v8 = *(unsigned char *)(v0 + 80);
  uint64_t v9 = &v1[*(int *)(v2 + 48)];
  uint64_t v10 = sub_10FBC8();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  unsigned char *v1 = v8;
  v1[1] = v7;
  v1[2] = v6;
  v1[3] = v5;
  v1[4] = v4;
  v1[5] = v3;
  v1[6] = v14;
  v1[7] = v15;
  *(void *)&v1[*(int *)(v2 + 52)] = 0;
  sub_E9D50((uint64_t)v1, v16);
  uint64_t v11 = sub_C80F8();
  *(void *)(v0 + 48) = v11;
  uint64_t v17 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                            + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_C8C28;
  return v17(0xD000000000000021, 0x8000000000116E30, v11);
}

uint64_t sub_C8C28(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 64) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    char v5 = sub_C8DE8;
  }
  else
  {
    *(void *)(v4 + 72) = a1;
    char v5 = sub_C8D74;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_C8D74()
{
  sub_C8E78(v0[5]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[9];
  return v1(v2);
}

uint64_t sub_C8DE8()
{
  sub_C8E78(*(void *)(v0 + 40));
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t type metadata accessor for DeleteAlarmIntentHandledMultipleParameters(uint64_t a1)
{
  return sub_19B4C(a1, qword_142A50);
}

uint64_t sub_C8E78(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DeleteAlarmIntentHandledMultipleParameters(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_C8ED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_C8EE8);
}

uint64_t sub_C8EE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_3DD4(&qword_13FA88);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 48);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 52));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    int v13 = v12 - 1;
    if (v13 < 0) {
      int v13 = -1;
    }
    return (v13 + 1);
  }
}

uint64_t sub_C8FBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_C8FD0);
}

uint64_t sub_C8FD0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_3DD4(&qword_13FA88);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 48);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 52)) = a2;
  }
  return result;
}

void sub_C9094()
{
  sub_37BC4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_C9140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_C9154);
}

uint64_t sub_C9154(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3DD4(&qword_13FA88);
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_C91C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_C91D8);
}

uint64_t sub_C91D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3DD4(&qword_13FA88);
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for DeleteAlarmUnsupportedWithReasonSleepAlarmNotSupportedParameters(uint64_t a1)
{
  return sub_19B4C(a1, qword_142B00);
}

uint64_t sub_C9270()
{
  uint64_t v0 = sub_110778();
  sub_2D924(v0, qword_142B38);
  sub_3E18(v0, (uint64_t)qword_142B38);
  return sub_1104D8();
}

uint64_t sub_C92BC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_1104F8();
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    swift_bridgeObjectRetain();
    uint64_t v4 = a1 + 40;
    do
    {
      id v5 = objc_allocWithZone(ObjCClassFromMetadata);
      swift_bridgeObjectRetain();
      NSString v6 = sub_110838();
      swift_bridgeObjectRelease();
      NSString v7 = sub_110838();
      [v5 initWithIdentifier:v6 displayString:v7];

      sub_1108E8();
      if (*(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
        sub_110948();
      }
      v4 += 16;
      sub_110958();
      sub_110928();
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  sub_13370((unint64_t)_swiftEmptyArrayStorage);

  return swift_bridgeObjectRelease();
}

uint64_t sub_C9428@<X0>(uint64_t a1@<X8>)
{
  return sub_CAD04(1, (void (*)(void))&type metadata accessor for UsoTaskBuilder_create_common_Alarm, (void (*)(void))&UsoTaskBuilder_create_common_Alarm.init(), (void (*)(uint64_t))&dispatch thunk of Uso_VerbTemplateBuilder_Target.setTarget(value:), a1);
}

uint64_t sub_C946C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_3DD4(&qword_142B68);
  __chkstk_darwin(v4 - 8);
  NSString v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10F008();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  char v14 = (char *)&v29 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v29 - v15;
  sub_CA384();
  sub_10F5B8();
  swift_allocObject();
  uint64_t v17 = sub_10F5A8();
  sub_CBFFC(a1, v17);
  swift_release();
  sub_10FF58();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1) {
    return sub_1646C((uint64_t)v6, &qword_142B68);
  }
  uint64_t v32 = a2;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v16, v6, v7);
  if (qword_13F160 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_110778();
  sub_3E18(v19, (uint64_t)qword_142B50);
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v20(v14, v16, v7);
  uint64_t v21 = sub_110768();
  os_log_type_t v22 = sub_1109F8();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    os_log_t v30 = v21;
    int v24 = (uint8_t *)v23;
    uint64_t v31 = swift_slowAlloc();
    uint64_t v34 = v31;
    *(_DWORD *)int v24 = 136315138;
    uint64_t v29 = v24 + 4;
    v20(v11, v14, v7);
    uint64_t v25 = sub_110858();
    uint64_t v33 = sub_6750(v25, v26, &v34);
    sub_110B28();
    swift_bridgeObjectRelease();
    uint64_t v27 = *(void (**)(char *, uint64_t))(v8 + 8);
    v27(v14, v7);
    os_log_t v28 = v30;
    _os_log_impl(&dword_0, v30, v22, "Submitting NLv4 dialog act: %s", v24, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v27 = *(void (**)(char *, uint64_t))(v8 + 8);
    v27(v14, v7);
  }
  sub_10E9E8();
  return ((uint64_t (*)(char *, uint64_t))v27)(v16, v7);
}

uint64_t sub_C9864(unint64_t a1, uint64_t a2, char a3)
{
  uint64_t v56 = a2;
  os_log_t v57 = 0;
  unint64_t v67 = a1;
  uint64_t v4 = sub_10E198();
  uint64_t v63 = *(void *)(v4 - 8);
  uint64_t v64 = v4;
  __chkstk_darwin(v4);
  v62 = (char *)v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_3DD4(&qword_142B68);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_10F008();
  uint64_t v61 = *(void *)(v66 - 8);
  uint64_t v9 = __chkstk_darwin(v66);
  v55 = (char *)v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v58 = (char *)v54 - v12;
  __chkstk_darwin(v11);
  uint64_t v65 = (char *)v54 - v13;
  sub_10EAA8();
  uint64_t v69 = 0;
  unint64_t v70 = 0xE000000000000000;
  sub_110BD8(20);
  swift_bridgeObjectRelease();
  uint64_t v69 = 0xD000000000000012;
  unint64_t v70 = 0x8000000000115070;
  v71._countAndFlagsBits = sub_110888();
  sub_1108A8(v71);
  swift_bridgeObjectRelease();
  sub_10EA68();
  sub_10EA38();
  uint64_t v14 = sub_3DD4(&qword_13FA80);
  uint64_t v15 = swift_allocObject();
  long long v59 = xmmword_1117A0;
  *(_OWORD *)(v15 + 16) = xmmword_1117A0;
  *(void *)(v15 + 32) = sub_1CB0C();
  *(void *)(v15 + 40) = v16;
  sub_10EA58();
  uint64_t v60 = v14;
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_111970;
  uint64_t v69 = 0;
  unint64_t v70 = 0xE000000000000000;
  sub_110BD8(20);
  swift_bridgeObjectRelease();
  uint64_t v69 = 0xD000000000000012;
  unint64_t v70 = 0x8000000000115070;
  v72._countAndFlagsBits = sub_110888();
  sub_1108A8(v72);
  swift_bridgeObjectRelease();
  unint64_t v18 = v70;
  *(void *)(v17 + 32) = v69;
  *(void *)(v17 + 40) = v18;
  uint64_t v69 = 0;
  unint64_t v70 = 0xE000000000000000;
  sub_110BD8(20);
  swift_bridgeObjectRelease();
  uint64_t v69 = 0xD000000000000012;
  unint64_t v70 = 0x8000000000115070;
  v73._countAndFlagsBits = sub_110888();
  sub_1108A8(v73);
  swift_bridgeObjectRelease();
  unint64_t v19 = v70;
  *(void *)(v17 + 48) = v69;
  *(void *)(v17 + 56) = v19;
  uint64_t v69 = 0;
  unint64_t v70 = 0xE000000000000000;
  sub_110BD8(20);
  swift_bridgeObjectRelease();
  uint64_t v69 = 0xD000000000000012;
  unint64_t v70 = 0x8000000000115070;
  v74._countAndFlagsBits = sub_110888();
  sub_1108A8(v74);
  swift_bridgeObjectRelease();
  unint64_t v20 = v70;
  *(void *)(v17 + 64) = v69;
  *(void *)(v17 + 72) = v20;
  uint64_t v69 = 0;
  unint64_t v70 = 0xE000000000000000;
  sub_110BD8(20);
  swift_bridgeObjectRelease();
  uint64_t v69 = 0xD000000000000012;
  unint64_t v70 = 0x8000000000115070;
  v75._countAndFlagsBits = sub_110888();
  sub_1108A8(v75);
  swift_bridgeObjectRelease();
  unint64_t v21 = v70;
  *(void *)(v17 + 80) = v69;
  *(void *)(v17 + 88) = v21;
  if (a3)
  {
    uint64_t v69 = 0;
    unint64_t v70 = 0xE000000000000000;
    sub_110BD8(20);
    swift_bridgeObjectRelease();
    uint64_t v69 = 0xD000000000000012;
    unint64_t v70 = 0x8000000000115070;
    v76._countAndFlagsBits = sub_110888();
    sub_1108A8(v76);
    swift_bridgeObjectRelease();
    uint64_t v22 = v69;
    unint64_t v23 = v70;
    unint64_t v25 = *(void *)(v17 + 16);
    unint64_t v24 = *(void *)(v17 + 24);
    if (v25 >= v24 >> 1) {
      uint64_t v17 = (uint64_t)sub_B75F4((void *)(v24 > 1), v25 + 1, 1, (void *)v17);
    }
    os_log_t v26 = v57;
    uint64_t v27 = v58;
    *(void *)(v17 + 16) = v25 + 1;
    uint64_t v28 = v17 + 16 * v25;
    *(void *)(v28 + 32) = v22;
    *(void *)(v28 + 40) = v23;
    sub_CA0F0((uint64_t)&off_1376D0);
    sub_10EA78();
  }
  else
  {
    os_log_t v26 = v57;
    uint64_t v27 = v58;
  }
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_10EA88();
  __chkstk_darwin(v29);
  v54[-2] = v56;
  sub_CA1C8((void (*)(uint64_t *__return_ptr, id *))sub_CC56C, (uint64_t)&v54[-4], v67);
  uint64_t v58 = (char *)v26;
  sub_10EFD8();
  swift_bridgeObjectRelease();
  uint64_t v30 = v61;
  uint64_t v31 = v66;
  int v32 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v61 + 48))(v8, 1, v66);
  uint64_t v33 = v65;
  if (v32 == 1)
  {
    sub_1646C((uint64_t)v8, &qword_142B68);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v65, v8, v31);
    if (qword_13F160 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_110778();
    sub_3E18(v34, (uint64_t)qword_142B50);
    uint64_t v35 = v30;
    BOOL v36 = *(void (**)(char *, char *, uint64_t))(v30 + 16);
    v36(v27, v33, v31);
    v37 = sub_110768();
    os_log_type_t v38 = sub_1109F8();
    int v39 = v38;
    os_log_t v57 = v37;
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v69 = swift_slowAlloc();
      LODWORD(v56) = v39;
      *(_DWORD *)uint64_t v40 = 136315138;
      v54[1] = v40 + 4;
      v36(v55, v27, v66);
      uint64_t v41 = sub_110858();
      uint64_t v68 = sub_6750(v41, v42, &v69);
      uint64_t v31 = v66;
      sub_110B28();
      swift_bridgeObjectRelease();
      v43 = *(void (**)(char *, uint64_t))(v35 + 8);
      v43(v27, v31);
      os_log_t v44 = v57;
      _os_log_impl(&dword_0, v57, (os_log_type_t)v56, "Submitting Alarm Disambiguation NLv4 dialog act: %s", v40, 0xCu);
      swift_arrayDestroy();
      uint64_t v33 = v65;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v43 = *(void (**)(char *, uint64_t))(v35 + 8);
      v43(v27, v31);
    }
    sub_10E9E8();
    v43(v33, v31);
  }
  sub_BB450(v67);
  sub_10EA18();
  uint64_t v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = v59;
  *(void *)(v45 + 32) = sub_1CB0C();
  *(void *)(v45 + 40) = v46;
  sub_10EA98();
  uint64_t v47 = v62;
  sub_10E188();
  uint64_t v48 = sub_10E178();
  uint64_t v50 = v49;
  uint64_t v51 = (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v47, v64);
  __chkstk_darwin(v51);
  v54[-2] = v48;
  v54[-1] = v50;
  unint64_t v52 = swift_bridgeObjectRetain();
  sub_CBCA0(v52, (void (*)(uint64_t, id))sub_CC5C8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_10EA08();
}

void *sub_CA0F0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_CB5F4(0, v1, 0);
    uint64_t v3 = a1 + 32;
    do
    {
      ++v3;
      unint64_t v4 = sub_1CB0C();
      uint64_t v6 = v5;
      unint64_t v8 = _swiftEmptyArrayStorage[2];
      unint64_t v7 = _swiftEmptyArrayStorage[3];
      if (v8 >= v7 >> 1) {
        sub_CB5F4(v7 > 1, v8 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v8 + 1;
      uint64_t v9 = &_swiftEmptyArrayStorage[2 * v8];
      v9[4] = v4;
      v9[5] = v6;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

void *sub_CA1C8(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  while (1)
  {
    uint64_t result = _swiftEmptyArrayStorage;
    if (!v6) {
      break;
    }
    uint64_t v13 = _swiftEmptyArrayStorage;
    uint64_t result = (void *)sub_110C78();
    if (v6 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v8 = 0;
    while (v6 != v8)
    {
      if ((a3 & 0xC000000000000001) != 0) {
        id v9 = (id)sub_110C18();
      }
      else {
        id v9 = *(id *)(a3 + 8 * v8 + 32);
      }
      uint64_t v10 = v9;
      id v11 = v9;
      a1(&v12, &v11);

      if (v3) {
        return (void *)swift_release();
      }
      ++v8;
      sub_110C58();
      sub_110C88();
      sub_110C98();
      sub_110C68();
      if (v6 == v8) {
        return v13;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_110CD8();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_CA338()
{
  uint64_t v0 = sub_110778();
  sub_2D924(v0, qword_142B50);
  sub_3E18(v0, (uint64_t)qword_142B50);
  return sub_1104D8();
}

uint64_t sub_CA384()
{
  uint64_t v0 = sub_10EF28();
  __chkstk_darwin(v0 - 8);
  uint64_t v38 = sub_10EFC8();
  uint64_t v36 = *(void *)(v38 - 8);
  uint64_t v1 = __chkstk_darwin(v38);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v29 - v4;
  uint64_t v6 = sub_10EF58();
  uint64_t v34 = *(void *)(v6 - 8);
  uint64_t v35 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  int v32 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v29 - v9;
  uint64_t v37 = sub_10F008();
  uint64_t v31 = *(void *)(v37 - 8);
  uint64_t v33 = v31;
  __chkstk_darwin(v37);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10EAA8();
  unint64_t v40 = 0;
  unint64_t v41 = 0xE000000000000000;
  sub_110BD8(20);
  swift_bridgeObjectRelease();
  unint64_t v40 = 0xD000000000000012;
  unint64_t v41 = 0x8000000000115070;
  v42._countAndFlagsBits = sub_110888();
  sub_1108A8(v42);
  swift_bridgeObjectRelease();
  sub_10EA68();
  sub_10EA38();
  sub_CA0F0((uint64_t)&off_1376A8);
  sub_10EA78();
  sub_3DD4(&qword_13FA80);
  uint64_t v13 = swift_allocObject();
  long long v39 = xmmword_1117A0;
  *(_OWORD *)(v13 + 16) = xmmword_1117A0;
  *(void *)(v13 + 32) = sub_1CB0C();
  *(void *)(v13 + 40) = v14;
  sub_10EA58();
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = v39;
  unint64_t v40 = 0;
  unint64_t v41 = 0xE000000000000000;
  sub_110BD8(20);
  swift_bridgeObjectRelease();
  unint64_t v40 = 0xD000000000000012;
  unint64_t v41 = 0x8000000000115070;
  v43._countAndFlagsBits = sub_110888();
  sub_1108A8(v43);
  swift_bridgeObjectRelease();
  unint64_t v16 = v41;
  *(void *)(v15 + 32) = v40;
  *(void *)(v15 + 40) = v16;
  sub_10EA88();
  sub_10EFF8();
  uint64_t v17 = v10;
  sub_10EF48();
  uint64_t v30 = v5;
  sub_10EFB8();
  sub_10EF18();
  sub_10EFA8();
  uint64_t v18 = v36;
  uint64_t v19 = v38;
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v3, v5, v38);
  sub_10EF38();
  uint64_t v20 = v34;
  uint64_t v21 = v35;
  uint64_t v22 = v17;
  (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v32, v17, v35);
  sub_10EFE8();
  sub_3DD4(&qword_142B70);
  uint64_t v23 = v33;
  unint64_t v24 = (*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = v39;
  unint64_t v26 = v25 + v24;
  uint64_t v27 = v37;
  (*(void (**)(unint64_t, char *, uint64_t))(v23 + 16))(v26, v12, v37);
  sub_10EA28();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v30, v19);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v21);
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v12, v27);
}

uint64_t sub_CA878@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int v29 = a1;
  uint64_t v3 = sub_10EF58();
  uint64_t v32 = *(void *)(v3 - 8);
  uint64_t v33 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v31 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v26 - v6;
  uint64_t v34 = sub_10F008();
  uint64_t v30 = *(void *)(v34 - 8);
  uint64_t v8 = v30;
  __chkstk_darwin(v34);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10EF28();
  __chkstk_darwin(v11 - 8);
  uint64_t v28 = sub_10EFC8();
  uint64_t v35 = *(void *)(v28 - 8);
  uint64_t v12 = __chkstk_darwin(v28);
  uint64_t v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  unint64_t v16 = (char *)v26 - v15;
  sub_10EAA8();
  unint64_t v36 = 0;
  unint64_t v37 = 0xE000000000000000;
  sub_110BD8(20);
  swift_bridgeObjectRelease();
  unint64_t v36 = 0xD000000000000012;
  unint64_t v37 = 0x8000000000115070;
  v38._countAndFlagsBits = sub_110888();
  sub_1108A8(v38);
  swift_bridgeObjectRelease();
  v26[1] = a2;
  sub_10EA68();
  sub_3DD4(&qword_13FA80);
  uint64_t v17 = swift_allocObject();
  long long v27 = xmmword_1117A0;
  *(_OWORD *)(v17 + 16) = xmmword_1117A0;
  *(void *)(v17 + 32) = sub_1C934();
  *(void *)(v17 + 40) = v18;
  sub_10EA88();
  sub_10EA38();
  sub_10EFB8();
  sub_10EF18();
  sub_10EFA8();
  sub_10EFF8();
  sub_10EF48();
  uint64_t v19 = v28;
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v14, v16, v28);
  sub_10EF38();
  uint64_t v20 = v32;
  uint64_t v21 = v33;
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v31, v7, v33);
  sub_10EFE8();
  sub_3DD4(&qword_142B70);
  unint64_t v22 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = v27;
  uint64_t v24 = v34;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 16))(v23 + v22, v10, v34);
  sub_10EA28();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v21);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v16, v19);
}

uint64_t sub_CACC0@<X0>(uint64_t a1@<X8>)
{
  return sub_CAD04(8, (void (*)(void))&type metadata accessor for UsoTaskBuilder_update_common_Alarm, (void (*)(void))&UsoTaskBuilder_update_common_Alarm.init(), (void (*)(uint64_t))&dispatch thunk of Uso_VerbTemplateBuilder_ReferenceTarget.setTarget(value:), a1);
}

uint64_t sub_CAD04@<X0>(int a1@<W0>, void (*a2)(void)@<X1>, void (*a3)(void)@<X2>, void (*a4)(uint64_t)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_3DD4(&qword_142B68);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10F008();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  long long v39 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  unint64_t v40 = (char *)&v35 - v18;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v35 - v19;
  sub_CA878(a1, a5);
  a2(0);
  swift_allocObject();
  a3();
  sub_10F5B8();
  swift_allocObject();
  uint64_t v21 = sub_10F5A8();
  sub_10F6A8();
  swift_allocObject();
  sub_10F698();
  sub_10F588();
  swift_release();
  a4(v21);
  sub_10FF48();
  swift_release();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1) {
    return sub_1646C((uint64_t)v12, &qword_142B68);
  }
  uint64_t v38 = a5;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v20, v12, v13);
  uint64_t v23 = v20;
  if (qword_13F160 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_110778();
  sub_3E18(v24, (uint64_t)qword_142B50);
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  unint64_t v26 = v40;
  v25(v40, v20, v13);
  long long v27 = sub_110768();
  os_log_type_t v28 = sub_1109F8();
  os_log_t v37 = v27;
  if (os_log_type_enabled(v27, v28))
  {
    int v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    unint64_t v36 = v20;
    uint64_t v42 = v30;
    *(_DWORD *)int v29 = 136315138;
    uint64_t v35 = v29 + 4;
    v25(v39, v26, v13);
    uint64_t v31 = sub_110858();
    uint64_t v41 = sub_6750(v31, v32, &v42);
    sub_110B28();
    swift_bridgeObjectRelease();
    uint64_t v33 = *(void (**)(char *, uint64_t))(v14 + 8);
    v33(v26, v13);
    os_log_t v34 = v37;
    _os_log_impl(&dword_0, v37, v28, "Submitting NLv4 dialog act: %s", v29, 0xCu);
    swift_arrayDestroy();
    uint64_t v23 = v36;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v33 = *(void (**)(char *, uint64_t))(v14 + 8);
    v33(v26, v13);
  }
  sub_10E9E8();
  return ((uint64_t (*)(char *, uint64_t))v33)(v23, v13);
}

uint64_t sub_CB188@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_3DD4(&qword_142B68);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10F008();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v25 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v25 - v13;
  sub_CA878(6, a1);
  sub_10F7D8();
  swift_allocObject();
  sub_10F7C8();
  sub_10F5B8();
  swift_allocObject();
  sub_10F5A8();
  sub_10F598();
  sub_10F8B8();
  sub_10FF48();
  swift_release();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_1646C((uint64_t)v4, &qword_142B68);
  }
  uint64_t v28 = a1;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v14, v4, v5);
  if (qword_13F160 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_110778();
  sub_3E18(v16, (uint64_t)qword_142B50);
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v17(v12, v14, v5);
  uint64_t v18 = sub_110768();
  os_log_type_t v19 = sub_1109F8();
  os_log_t v27 = v18;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v30 = v26;
    *(_DWORD *)uint64_t v20 = 136315138;
    uint64_t v25 = v20 + 4;
    v17(v9, v12, v5);
    uint64_t v21 = sub_110858();
    uint64_t v29 = sub_6750(v21, v22, &v30);
    sub_110B28();
    swift_bridgeObjectRelease();
    uint64_t v23 = *(void (**)(char *, uint64_t))(v6 + 8);
    v23(v12, v5);
    os_log_t v24 = v27;
    _os_log_impl(&dword_0, v27, v19, "Submitting NLv4 dialog act: %s", v20, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v23 = *(void (**)(char *, uint64_t))(v6 + 8);
    v23(v12, v5);
  }
  sub_10E9E8();
  return ((uint64_t (*)(char *, uint64_t))v23)(v14, v5);
}

uint64_t sub_CB5B4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_CB634(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_CB5D4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_CB874(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_CB5F4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_CB9D4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_CB614(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_CBB40(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_CB634(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
    uint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_3DD4(&qword_141358);
  uint64_t v10 = *(void *)(sub_10FBC8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_10FBC8() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  os_log_type_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_110D08();
  __break(1u);
  return result;
}

uint64_t sub_CB874(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_3DD4(&qword_142B78);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_110D08();
  __break(1u);
  return result;
}

uint64_t sub_CB9D4(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_3DD4(&qword_13FA80);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_110D08();
  __break(1u);
  return result;
}

uint64_t sub_CBB40(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_3DD4(&qword_142290);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_110D08();
  __break(1u);
  return result;
}

void *sub_CBCA0(unint64_t a1, void (*a2)(uint64_t, id))
{
  uint64_t v3 = v2;
  os_log_t v34 = a2;
  uint64_t v5 = sub_3DD4(&qword_13FAA8);
  __chkstk_darwin(v5 - 8);
  int64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1107D8();
  uint64_t v28 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v33 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  os_log_t v27 = (char *)&v25 - v11;
  if (a1 >> 62) {
    goto LABEL_19;
  }
  uint64_t v12 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v12; uint64_t v12 = sub_110CD8())
  {
    uint64_t v25 = v3;
    unint64_t v32 = a1 & 0xC000000000000001;
    uint64_t v29 = v28 + 32;
    uint64_t v30 = (unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
    uint64_t v35 = &_swiftEmptyArrayStorage;
    uint64_t v13 = 4;
    unint64_t v26 = a1;
    uint64_t v31 = v12;
    size_t v14 = (void (**)(char *, char *, uint64_t))(v28 + 32);
    while (1)
    {
      uint64_t v3 = v8;
      uint64_t v8 = v13 - 4;
      id v15 = v32 ? (id)sub_110C18() : *(id *)(a1 + 8 * v13);
      uint64_t v16 = v15;
      uint64_t v17 = v13 - 3;
      if (__OFADD__(v8, 1)) {
        break;
      }
      v34(v13 - 4, v15);

      uint64_t v8 = v3;
      if ((*v30)(v7, 1, v3) == 1)
      {
        sub_1646C((uint64_t)v7, &qword_13FAA8);
      }
      else
      {
        uint64_t v18 = *v14;
        os_log_type_t v19 = v27;
        (*v14)(v27, v7, v3);
        v18(v33, v19, v3);
        if (swift_isUniquelyReferenced_nonNull_native()) {
          unint64_t v20 = (unint64_t)v35;
        }
        else {
          unint64_t v20 = sub_B7704(0, v35[2] + 1, 1, (unint64_t)v35);
        }
        unint64_t v22 = *(void *)(v20 + 16);
        unint64_t v21 = *(void *)(v20 + 24);
        if (v22 >= v21 >> 1) {
          unint64_t v20 = sub_B7704(v21 > 1, v22 + 1, 1, v20);
        }
        *(void *)(v20 + 16) = v22 + 1;
        unint64_t v23 = (*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
        uint64_t v35 = (void *)v20;
        uint64_t v8 = v3;
        v18((char *)(v20 + v23 + *(void *)(v28 + 72) * v22), v33, v3);
        a1 = v26;
      }
      ++v13;
      if (v17 == v31)
      {
        swift_bridgeObjectRelease();
        return v35;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_CBFFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1103B8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v23 - v9;
  if (qword_13F160 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_110778();
  sub_3E18(v11, (uint64_t)qword_142B50);
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v28(v10, a1, v4);
  uint64_t v12 = sub_110768();
  os_log_type_t v13 = sub_1109F8();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v27 = a2;
    id v15 = (uint8_t *)v14;
    uint64_t v16 = swift_slowAlloc();
    os_log_t v24 = v8;
    uint64_t v30 = v16;
    uint64_t v25 = a1;
    uint64_t v26 = v4;
    *(_DWORD *)id v15 = 136315138;
    uint64_t v17 = sub_1103A8();
    uint64_t v29 = sub_6750(v17, v18, &v30);
    a1 = v25;
    uint64_t v4 = v26;
    sub_110B28();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    _os_log_impl(&dword_0, v12, v13, "In alarmNLBuilderForVerb, verb = %s", v15, 0xCu);
    swift_arrayDestroy();
    uint64_t v8 = v24;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }

  v28(v8, a1, v4);
  int v19 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v4);
  if (v19 == enum case for AlarmNLv4Constants.AlarmVerb.unknown(_:)) {
    goto LABEL_7;
  }
  if (v19 == enum case for AlarmNLv4Constants.AlarmVerb.checkExistence(_:))
  {
    sub_10F8D8();
    swift_allocObject();
    uint64_t v21 = sub_10F8C8();
LABEL_10:
    uint64_t v20 = v21;
    sub_10F718();
    return v20;
  }
  if (v19 == enum case for AlarmNLv4Constants.AlarmVerb.create(_:))
  {
    sub_10F758();
    swift_allocObject();
    return sub_10F748();
  }
  if (v19 == enum case for AlarmNLv4Constants.AlarmVerb.delete(_:))
  {
    sub_10F778();
    swift_allocObject();
    uint64_t v21 = sub_10F768();
    goto LABEL_10;
  }
  if (v19 == enum case for AlarmNLv4Constants.AlarmVerb.disable(_:)) {
    goto LABEL_17;
  }
  if (v19 == enum case for AlarmNLv4Constants.AlarmVerb.enable(_:)) {
    goto LABEL_19;
  }
  if (v19 == enum case for AlarmNLv4Constants.AlarmVerb.read(_:))
  {
    sub_10F6C8();
    swift_allocObject();
    uint64_t v21 = sub_10F6B8();
    goto LABEL_10;
  }
  if (v19 == enum case for AlarmNLv4Constants.AlarmVerb.request(_:))
  {
LABEL_7:
    sub_10F818();
    swift_allocObject();
    uint64_t v20 = sub_10F808();
    sub_10F898();
    return v20;
  }
  if (v19 == enum case for AlarmNLv4Constants.AlarmVerb.snooze(_:))
  {
    sub_10F7B8();
    swift_allocObject();
    uint64_t v21 = sub_10F7A8();
    goto LABEL_10;
  }
  if (v19 == enum case for AlarmNLv4Constants.AlarmVerb.summarise(_:))
  {
    sub_10F848();
    swift_allocObject();
    uint64_t v21 = sub_10F838();
    goto LABEL_10;
  }
  if (v19 == enum case for AlarmNLv4Constants.AlarmVerb.update(_:))
  {
    sub_10F7D8();
    swift_allocObject();
    uint64_t v20 = sub_10F7C8();
    sub_10F8A8();
    return v20;
  }
  if (v19 == enum case for AlarmNLv4Constants.AlarmVerb.noVerb(_:)) {
    goto LABEL_7;
  }
  if (v19 == enum case for AlarmNLv4Constants.AlarmVerb.close(_:)) {
    goto LABEL_17;
  }
  if (v19 == enum case for AlarmNLv4Constants.AlarmVerb.resume(_:))
  {
LABEL_19:
    sub_10F798();
    swift_allocObject();
    uint64_t v21 = sub_10F788();
    goto LABEL_10;
  }
  if (v19 == enum case for AlarmNLv4Constants.AlarmVerb.stop(_:))
  {
LABEL_17:
    sub_10F7F8();
    swift_allocObject();
    uint64_t v21 = sub_10F7E8();
    goto LABEL_10;
  }
  uint64_t result = sub_110DD8();
  __break(1u);
  return result;
}

uint64_t sub_CC56C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = sub_148BC();
  uint64_t v5 = sub_CBFFC(v3, v4);
  uint64_t result = swift_release();
  *a1 = v5;
  return result;
}

uint64_t sub_CC5CC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_140F0(*(void *)(v2 + 16), *(void *)(v2 + 24), a1, 0, a2);
}

void *sub_CC600(uint64_t a1)
{
  return sub_CCC9C(a1, &qword_142BD8, &qword_13F950, &qword_142BE0, &qword_142BE8);
}

void *sub_CC638()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1103B8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3DD4(&qword_140B18);
  uint64_t v6 = (void *)sub_10ECA8();
  id v7 = [v6 disambiguationItems];

  uint64_t v8 = sub_110908();
  uint64_t v9 = sub_CDD58(v8);
  swift_bridgeObjectRelease();
  if (!v9)
  {
    sub_3DD4(&qword_1401F0);
    sub_C158((unint64_t *)&qword_1401F8, &qword_1401F0);
    swift_allocError();
    *uint64_t v27 = 1;
    return (void *)swift_willThrow();
  }
  uint64_t v49 = v2;
  uint64_t v10 = (void *)sub_10EC98();
  if (qword_13F188 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_110778();
  uint64_t v12 = sub_3E18(v11, (uint64_t)qword_142F58);
  id v13 = v10;
  uint64_t v47 = (char *)v12;
  uint64_t v14 = sub_110768();
  os_log_type_t v15 = sub_1109F8();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v45 = v9;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v44 = swift_slowAlloc();
    uint64_t v51 = v44;
    uint64_t v48 = v3;
    *(_DWORD *)uint64_t v17 = 136315138;
    v42[1] = v17 + 4;
    Swift::String v43 = v17;
    id v18 = v13;
    uint64_t v46 = v0;
    id v19 = v18;
    id v20 = [v18 description];
    id v21 = v13;
    unint64_t v22 = v5;
    uint64_t v23 = sub_110848();
    unint64_t v25 = v24;

    uint64_t v26 = v23;
    uint64_t v5 = v22;
    id v13 = v21;
    uint64_t v50 = sub_6750(v26, v25, (uint64_t *)&v51);
    uint64_t v3 = v48;
    sub_110B28();

    uint64_t v1 = v46;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v14, v15, "Creating ResponseAlarmDisambiguationFlowProvider with intent: %s", v43, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v9 = v45;
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v29 = v49;
  sub_110258();
  if (swift_dynamicCastClass())
  {
    uint64_t v30 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.create(_:);
  }
  else
  {
    sub_110298();
    if (swift_dynamicCastClass())
    {
      uint64_t v30 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.delete(_:);
    }
    else
    {
      sub_1102C8();
      if (swift_dynamicCastClass())
      {
        uint64_t v30 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.read(_:);
      }
      else
      {
        sub_1101F8();
        if (swift_dynamicCastClass())
        {
          id v31 = v13;
          id v32 = v13;
          if ([v32 operation] == (char *)&dword_0 + 2) {
            uint64_t v33 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.disable(_:);
          }
          else {
            uint64_t v33 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.enable(_:);
          }
          (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *v33, v29);

          id v13 = v31;
          goto LABEL_15;
        }
        sub_110328();
        if (swift_dynamicCastClass())
        {
          uint64_t v30 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.update(_:);
        }
        else
        {
          sub_110308();
          if (swift_dynamicCastClass())
          {
            uint64_t v30 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.snooze(_:);
          }
          else
          {
            sub_110368();
            if (!swift_dynamicCastClass())
            {
              uint64_t v48 = v3;
              os_log_t v34 = v13;
              uint64_t v35 = sub_110768();
              os_log_type_t v36 = sub_1109E8();
              if (os_log_type_enabled(v35, v36))
              {
                uint64_t v47 = v5;
                uint64_t v37 = swift_slowAlloc();
                uint64_t v44 = (uint64_t)v13;
                uint64_t v38 = (uint8_t *)v37;
                uint64_t v39 = swift_slowAlloc();
                uint64_t v46 = v1;
                unint64_t v40 = (void *)v39;
                uint64_t v45 = v9;
                *(_DWORD *)uint64_t v38 = 138412290;
                uint64_t v51 = v34;
                uint64_t v41 = v34;
                uint64_t v5 = v47;
                uint64_t v9 = v45;
                sub_110B28();
                *unint64_t v40 = v34;

                uint64_t v29 = v49;
                _os_log_impl(&dword_0, v35, v36, "Unable to recognize the alarm intent %@. Returning default verb of .unknown", v38, 0xCu);
                sub_3DD4((uint64_t *)&unk_13F8C0);
                swift_arrayDestroy();
                swift_slowDealloc();
                id v13 = (id)v44;
                swift_slowDealloc();
              }
              else
              {

                uint64_t v35 = v34;
              }

              (*(void (**)(char *, void, uint64_t))(v48 + 104))(v5, enum case for AlarmNLv4Constants.AlarmVerb.unknown(_:), v29);
              goto LABEL_15;
            }
            uint64_t v30 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.disable(_:);
          }
        }
      }
    }
  }
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *v30, v29);
LABEL_15:
  sub_3DD4(&qword_141DB0);
  swift_allocObject();
  return sub_CD348((unint64_t)v9, v13, v5, &qword_142BC8, &qword_142BD0);
}

void *sub_CCC9C(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v10 = v5;
  uint64_t v11 = sub_1103B8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v62 = v11;
  uint64_t v63 = v12;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3DD4(a2);
  os_log_type_t v15 = (void *)sub_10ECA8();
  id v16 = [v15 disambiguationItems];

  uint64_t v17 = sub_110908();
  id v18 = sub_CDD58(v17);
  swift_bridgeObjectRelease();
  if (!v18)
  {
    sub_3DD4(&qword_1401F0);
    sub_C158((unint64_t *)&qword_1401F8, &qword_1401F0);
    swift_allocError();
    *uint64_t v38 = 1;
    return (void *)swift_willThrow();
  }
  uint64_t v61 = v14;
  id v19 = (void *)sub_10EC98();
  if (qword_13F188 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_110778();
  uint64_t v21 = sub_3E18(v20, (uint64_t)qword_142F58);
  id v22 = v19;
  id v59 = (id)v21;
  uint64_t v23 = sub_110768();
  os_log_type_t v24 = sub_1109F8();
  int v25 = v24;
  if (os_log_type_enabled(v23, v24))
  {
    LODWORD(v56) = v25;
    uint64_t v26 = swift_slowAlloc();
    os_log_t v57 = a5;
    uint64_t v27 = (uint8_t *)v26;
    v55 = (uint8_t *)swift_slowAlloc();
    uint64_t v65 = v55;
    uint64_t v60 = v18;
    *(_DWORD *)uint64_t v27 = 136315138;
    v53 = v27 + 4;
    v54 = v27;
    id v28 = v22;
    uint64_t v58 = v5;
    id v29 = v28;
    uint64_t v30 = a3;
    id v31 = [v28 description];
    id v32 = v22;
    uint64_t v33 = a4;
    uint64_t v34 = sub_110848();
    unint64_t v36 = v35;

    a3 = v30;
    uint64_t v37 = v34;
    a4 = v33;
    id v22 = v32;
    uint64_t v64 = sub_6750(v37, v36, (uint64_t *)&v65);
    id v18 = v60;
    sub_110B28();

    uint64_t v10 = v58;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v23, (os_log_type_t)v56, "Creating ResponseAlarmDisambiguationFlowProvider with intent: %s", v54, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a5 = v57;
    swift_slowDealloc();
  }
  else
  {
  }
  unint64_t v40 = v61;
  sub_110258();
  if (swift_dynamicCastClass())
  {
    uint64_t v41 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.create(_:);
  }
  else
  {
    sub_110298();
    if (swift_dynamicCastClass())
    {
      uint64_t v41 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.delete(_:);
    }
    else
    {
      sub_1102C8();
      if (swift_dynamicCastClass())
      {
        uint64_t v41 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.read(_:);
      }
      else
      {
        sub_1101F8();
        if (swift_dynamicCastClass())
        {
          uint64_t v42 = (void *)swift_dynamicCastClassUnconditional();
          id v59 = v22;
          id v43 = v22;
          if ([v42 operation] == (char *)&dword_0 + 2) {
            uint64_t v44 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.disable(_:);
          }
          else {
            uint64_t v44 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.enable(_:);
          }
          (*(void (**)(char *, void, uint64_t))(v63 + 104))(v40, *v44, v62);

          id v22 = v59;
          goto LABEL_15;
        }
        sub_110328();
        if (swift_dynamicCastClass())
        {
          uint64_t v41 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.update(_:);
        }
        else
        {
          sub_110308();
          if (swift_dynamicCastClass())
          {
            uint64_t v41 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.snooze(_:);
          }
          else
          {
            sub_110368();
            if (!swift_dynamicCastClass())
            {
              uint64_t v60 = v18;
              uint64_t v45 = (uint8_t *)v22;
              uint64_t v46 = sub_110768();
              os_log_type_t v47 = sub_1109E8();
              if (os_log_type_enabled(v46, v47))
              {
                os_log_t v57 = a5;
                uint64_t v48 = swift_slowAlloc();
                id v59 = v22;
                uint64_t v49 = (uint8_t *)v48;
                uint64_t v50 = (uint8_t *)swift_slowAlloc();
                v54 = v50;
                uint64_t v58 = v10;
                v55 = v49;
                *(_DWORD *)uint64_t v49 = 138412290;
                uint64_t v65 = v45;
                uint64_t v51 = v45;
                uint64_t v56 = a3;
                unint64_t v52 = v51;
                unint64_t v40 = v61;
                a5 = v57;
                sub_110B28();
                *(void *)uint64_t v50 = v45;

                a3 = v56;
                _os_log_impl(&dword_0, v46, v47, "Unable to recognize the alarm intent %@. Returning default verb of .unknown", v55, 0xCu);
                sub_3DD4((uint64_t *)&unk_13F8C0);
                swift_arrayDestroy();
                swift_slowDealloc();
                id v22 = v59;
                swift_slowDealloc();
              }
              else
              {

                uint64_t v46 = v45;
              }
              id v18 = v60;

              (*(void (**)(char *, void, uint64_t))(v63 + 104))(v40, enum case for AlarmNLv4Constants.AlarmVerb.unknown(_:), v62);
              goto LABEL_15;
            }
            uint64_t v41 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.disable(_:);
          }
        }
      }
    }
  }
  (*(void (**)(char *, void, uint64_t))(v63 + 104))(v40, *v41, v62);
LABEL_15:
  sub_3DD4(a3);
  swift_allocObject();
  return sub_CD348((unint64_t)v18, v22, v40, a4, a5);
}

void *sub_CD348(unint64_t a1, void *a2, char *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v44 = a5;
  os_log_type_t v47 = a3;
  uint64_t v9 = sub_1103B8();
  uint64_t v45 = *(void *)(v9 - 8);
  uint64_t v46 = v9;
  __chkstk_darwin(v9);
  id v43 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10EC28();
  uint64_t v11 = sub_10EAD8();
  swift_allocObject();
  uint64_t v12 = sub_10EAC8();
  uint64_t v49 = v11;
  uint64_t v50 = &protocol witness table for ResponseFactory;
  uint64_t v48 = v12;
  uint64_t v13 = sub_10E4C8();
  swift_allocObject();
  uint64_t v14 = sub_10E4B8();
  v5[8] = v13;
  v5[9] = &protocol witness table for PatternFlowProvider;
  v5[5] = v14;
  v5[10] = 0xD000000000000018;
  v5[11] = 0x8000000000115A70;
  uint64_t v42 = v5;
  if (qword_13F030 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_110778();
  sub_3E18(v15, (uint64_t)qword_140B40);
  swift_bridgeObjectRetain_n();
  id v16 = a2;
  uint64_t v17 = sub_110768();
  os_log_type_t v18 = sub_1109F8();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    v51[0] = v40;
    *(_DWORD *)uint64_t v19 = 134218242;
    uint64_t v41 = a4;
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_110CD8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v20 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    }
    swift_bridgeObjectRelease();
    uint64_t v48 = v20;
    sub_110B28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    uint64_t v39 = v19 + 14;
    id v21 = v16;
    id v22 = v16;
    id v23 = [v22 description];
    uint64_t v24 = sub_110848();
    unint64_t v26 = v25;

    uint64_t v48 = sub_6750(v24, v26, v51);
    sub_110B28();

    id v16 = v21;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v17, v18, "ResponseAlarmDisambiguationFlowProvider.init with %ld items and intent: %s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    a4 = v41;
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v27 = v42;
  id v28 = v43;
  void v42[2] = a1;
  v27[12] = v16;
  uint64_t v29 = v45;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v28, v47, v46);
  sub_3DD4(a4);
  uint64_t v30 = swift_allocObject();
  uint64_t v31 = v30 + qword_140BE8;
  uint64_t v32 = sub_10ED58();
  uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56);
  v33(v31, 1, 1, v32);
  *(void *)(v30 + qword_140BF0) = 0x8000000000000000;
  *(void *)(v30 + qword_140BF8) = 0;
  *(void *)(v30 + 16) = a1;
  uint64_t v34 = *(void (**)(uint64_t, char *, uint64_t))(v29 + 32);
  unint64_t v35 = v28;
  uint64_t v36 = v46;
  v34(v30 + qword_140BE0, v35, v46);
  v27[3] = v30;
  sub_3DD4(v44);
  uint64_t v37 = swift_allocObject();
  v33(v37 + qword_140BE8, 1, 1, v32);
  *(void *)(v37 + qword_140BF0) = 0x8000000000000000;
  *(void *)(v37 + qword_140BF8) = 0;
  *(void *)(v37 + 16) = a1;
  v34(v37 + qword_140BE0, v47, v36);
  v27[4] = v37;
  swift_bridgeObjectRetain_n();
  return v27;
}

uint64_t sub_CD840(uint64_t a1)
{
  sub_110298();
  sub_110278();
  sub_10E5C8();
  if (qword_13F180 != -1) {
    swift_once();
  }
  sub_10E528();
  sub_3DD4(&qword_142B80);
  sub_10E588();
  sub_3DD4(&qword_142B90);
  sub_C158(&qword_142B98, &qword_142B90);
  sub_10E538();
  sub_10E5B8();
  sub_BD80(a1, (uint64_t)v5);
  sub_CDBB0();
  sub_10E558();
  sub_10E5A8();
  sub_BD80(a1, (uint64_t)v4);
  _s21ConfirmIntentStrategyCMa();
  uint64_t v2 = swift_allocObject();
  sub_BE08(v4, v2 + 16);
  *(void *)&v4[0] = v2;
  sub_CDC04();
  sub_10E548();
  sub_10E598();
  sub_BD80(a1, (uint64_t)v4);
  sub_CDC5C();
  sub_10E518();
  sub_10E578();
  swift_release();
  _s20HandleIntentStrategyVwxx_1(a1);
  sub_CDCB0((uint64_t)v4);
  return sub_CDD04((uint64_t)v5);
}

uint64_t sub_CDA5C(void *a1, uint64_t a2)
{
  *a1 = sub_CCC9C(a2, &qword_1406A0, &qword_142B90, &qword_142BB8, &qword_142BC0);
  uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
  return sub_31934(v3);
}

BOOL sub_CDB54()
{
  sub_3DD4(&qword_140AE0);
  uint64_t v0 = (void *)sub_10EBF8();
  sub_110268();

  uint64_t v1 = sub_110288();
  return v1 == sub_110288();
}

unint64_t sub_CDBB0()
{
  unint64_t result = qword_142BA0;
  if (!qword_142BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_142BA0);
  }
  return result;
}

unint64_t sub_CDC04()
{
  unint64_t result = qword_142BA8;
  if (!qword_142BA8)
  {
    _s21ConfirmIntentStrategyCMa();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_142BA8);
  }
  return result;
}

unint64_t sub_CDC5C()
{
  unint64_t result = qword_142BB0;
  if (!qword_142BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_142BB0);
  }
  return result;
}

uint64_t sub_CDCB0(uint64_t a1)
{
  return a1;
}

uint64_t sub_CDD04(uint64_t a1)
{
  return a1;
}

void *sub_CDD58(uint64_t a1)
{
  uint64_t v6 = _swiftEmptyArrayStorage;
  uint64_t v2 = *(void *)(a1 + 16);
  sub_110C78();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_69E0(i, (uint64_t)v5);
    sub_1104F8();
    if (!swift_dynamicCast()) {
      break;
    }
    sub_110C58();
    sub_110C88();
    sub_110C98();
    sub_110C68();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

uint64_t sub_CDE54()
{
  uint64_t v0 = sub_110778();
  sub_2D924(v0, qword_142BF0);
  sub_3E18(v0, (uint64_t)qword_142BF0);
  return sub_1104D8();
}

uint64_t sub_CDEA0()
{
  unint64_t v1 = *(void *)(v0 + 56);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_110CD8();
    uint64_t v2 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
  uint64_t result = swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_18;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v2; ++i)
  {
    if ((v1 & 0xC000000000000001) != 0) {
      id v5 = (id)sub_110C18();
    }
    else {
      id v5 = *(id *)(v1 + 8 * i + 32);
    }
    uint64_t v6 = v5;
    id v7 = [v5 sleepAlarmAttribute];

    if (!v7)
    {
LABEL_5:
      sub_110C58();
      sub_110C88();
      sub_110C98();
      sub_110C68();
      continue;
    }
    id v8 = [v6 enabled];
    sub_12EE4();
    v9.super.super.Class isa = sub_110AC8(1).super.super.isa;
    if (v8)
    {
      id v10 = v8;
      char v11 = sub_110AD8();

      if (v11) {
        goto LABEL_5;
      }
    }
    else
    {
    }
  }
  swift_bridgeObjectRelease();
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
  {
LABEL_21:
    swift_bridgeObjectRetain();
    sub_110CD8();
    swift_release();
    return swift_release();
  }
LABEL_19:
  if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0) {
    goto LABEL_21;
  }
  return swift_release();
}

unint64_t sub_CE098()
{
  unint64_t v1 = *(void *)(v0 + 56);
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_110CD8();
  if (!v2) {
    goto LABEL_17;
  }
LABEL_3:
  unint64_t result = sub_12EE4();
  if (v2 >= 1)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((v1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_110C18();
      }
      else {
        id v5 = *(id *)(v1 + 8 * i + 32);
      }
      uint64_t v6 = v5;
      id v7 = [v5 enabled];
      v8.super.super.Class isa = sub_110AC8(1).super.super.isa;
      if (v7)
      {
        id v9 = v7;
        char v10 = sub_110AD8();

        if (v10)
        {
          sub_110C58();
          sub_110C88();
          sub_110C98();
          sub_110C68();
        }
        else
        {
        }
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_20;
    }
LABEL_18:
    if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) == 0) {
      return swift_release();
    }
LABEL_20:
    swift_bridgeObjectRetain();
    sub_110CD8();
    swift_release();
    return swift_release();
  }
  __break(1u);
  return result;
}

void *sub_CE274()
{
  unint64_t v1 = *(void *)(v0 + 56);
  if (v1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain_n();
  for (; v2; uint64_t v2 = sub_110CD8())
  {
    uint64_t v3 = 4;
    while (1)
    {
      id v4 = (v1 & 0xC000000000000001) != 0 ? (id)sub_110C18() : *(id *)(v1 + 8 * v3);
      id v5 = v4;
      uint64_t v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1)) {
        break;
      }
      id v7 = [v4 sleepAlarmAttribute];

      if (v7)
      {
        swift_bridgeObjectRelease_n();
        id v9 = sub_800B8(0, 0);

        return v9;
      }

      ++v3;
      if (v6 == v2) {
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain_n();
  }
LABEL_10:
  swift_bridgeObjectRelease_n();
  return 0;
}

uint64_t sub_CE3A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  sub_10FFB8();
  sub_10FFA8();
  sub_10FF98();
  swift_release();
  *(void *)(v2 + 72) = 0xD000000000000018;
  *(void *)(v2 + 80) = 0x80000000001167B0;
  if (qword_13F168 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_110778();
  sub_3E18(v6, (uint64_t)qword_142BF0);
  id v7 = sub_110768();
  os_log_type_t v8 = sub_1109F8();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_0, v7, v8, "SearchAlarm.ResultSetProvider init", v9, 2u);
    swift_slowDealloc();
  }

  *(void *)(v3 + 56) = a2;
  *(void *)(v3 + 64) = a1;
  return v3;
}

uint64_t sub_CE4D8()
{
  *(void *)(v1 + 32) = v0;
  return _swift_task_switch(sub_CE4F8, 0, 0);
}

uint64_t sub_CE4F8()
{
  uint64_t v1 = v0[4];
  sub_10EC28();
  sub_10EAD8();
  swift_allocObject();
  sub_10EAC8();
  uint64_t v2 = sub_10E4C8();
  swift_allocObject();
  uint64_t v3 = sub_10E4B8();
  v0[5] = v3;
  v0[2] = v3;
  v0[3] = v1;
  id v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  uint64_t v5 = _s17ResultSetProviderCMa();
  uint64_t v7 = sub_D7888((unint64_t *)&unk_142E58, v6, (void (*)(uint64_t))_s17ResultSetProviderCMa);
  *id v4 = v0;
  v4[1] = sub_CE668;
  return PatternFlowProviding.makeResultSetFlow<A>(provider:)(v0 + 3, v2, v5, &protocol witness table for PatternFlowProvider, v7);
}

uint64_t sub_CE668(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 56) = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    return _swift_task_switch(sub_CE7CC, 0, 0);
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t sub_CE7CC()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_CE7E4()
{
  v1[2] = v0;
  sub_10E828();
  v1[3] = swift_task_alloc();
  uint64_t v2 = sub_10EC88();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  uint64_t v3 = sub_110778();
  v1[7] = v3;
  v1[8] = *(void *)(v3 - 8);
  v1[9] = swift_task_alloc();
  uint64_t v4 = sub_10FD58();
  v1[10] = v4;
  v1[11] = *(void *)(v4 - 8);
  v1[12] = swift_task_alloc();
  uint64_t v5 = sub_10FD78();
  v1[13] = v5;
  v1[14] = *(void *)(v5 - 8);
  v1[15] = swift_task_alloc();
  return _swift_task_switch(sub_CE9E4, 0, 0);
}

uint64_t sub_CE9E4()
{
  if (qword_13F168 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_3E18(v0[7], (uint64_t)qword_142BF0);
  uint64_t v1 = sub_110768();
  os_log_type_t v2 = sub_1109F8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "SearchAlarm.ResultSetProvider makeEmptyResultsFlow()", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[11];
  uint64_t v4 = v0[12];
  uint64_t v7 = v0[9];
  uint64_t v6 = v0[10];
  uint64_t v8 = v0[7];
  uint64_t v9 = v0[8];
  uint64_t v10 = v0[2];

  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v4, enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v16, v8);
  mach_absolute_time();
  sub_10FD88();
  if (*(void *)(v10 + 64)) {
    char v11 = sub_DAEE8();
  }
  else {
    char v11 = _swiftEmptyArrayStorage;
  }
  v0[16] = v11;
  if (qword_13F0C0 != -1) {
    swift_once();
  }
  uint64_t v12 = qword_144500;
  uint64_t v17 = (uint64_t (*)(char, uint64_t, uint64_t, uint64_t))((char *)&dword_141F10 + dword_141F10);
  swift_retain();
  uint64_t v13 = (void *)swift_task_alloc();
  v0[17] = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_CEC38;
  uint64_t v14 = v0[2];
  return v17(1, (uint64_t)v11, v12, v14);
}

uint64_t sub_CEC38(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 144) = v1;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = sub_CF0AC;
  }
  else
  {
    *(void *)(v4 + 152) = a1;
    uint64_t v5 = sub_CEDA0;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_CEDA0()
{
  sub_10E7B8();
  sub_10EC58();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[20] = v1;
  void *v1 = v0;
  v1[1] = sub_CEE74;
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[6];
  return PatternExecutionResult.generateFlow(manifest:measure:)(v3, v2);
}

uint64_t sub_CEE74(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)v1 + 152);
  uint64_t v3 = *(void *)(*(void *)v1 + 48);
  uint64_t v4 = *(void *)(*(void *)v1 + 40);
  uint64_t v5 = *(void *)(*(void *)v1 + 32);
  *(void *)(*(void *)v1 + 168) = a1;
  swift_task_dealloc();

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  return _swift_task_switch(sub_CEFEC, 0, 0);
}

uint64_t sub_CEFEC()
{
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[21];
  return v1(v2);
}

uint64_t sub_CF0AC()
{
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_CF168()
{
  v1[17] = v0;
  uint64_t v2 = sub_10EC88();
  v1[18] = v2;
  v1[19] = *(void *)(v2 - 8);
  v1[20] = swift_task_alloc();
  uint64_t v3 = sub_110778();
  v1[21] = v3;
  v1[22] = *(void *)(v3 - 8);
  v1[23] = swift_task_alloc();
  uint64_t v4 = sub_10FD58();
  v1[24] = v4;
  v1[25] = *(void *)(v4 - 8);
  v1[26] = swift_task_alloc();
  uint64_t v5 = sub_10FD78();
  v1[27] = v5;
  v1[28] = *(void *)(v5 - 8);
  v1[29] = swift_task_alloc();
  v1[30] = swift_task_alloc();
  uint64_t v6 = sub_10EAB8();
  v1[31] = v6;
  v1[32] = *(void *)(v6 - 8);
  v1[33] = swift_task_alloc();
  uint64_t v7 = sub_10E828();
  v1[34] = v7;
  v1[35] = *(void *)(v7 - 8);
  v1[36] = swift_task_alloc();
  sub_3DD4(&qword_1401D8);
  v1[37] = swift_task_alloc();
  uint64_t v8 = sub_110538();
  v1[38] = v8;
  v1[39] = *(void *)(v8 - 8);
  v1[40] = swift_task_alloc();
  sub_3DD4(&qword_13FA88);
  v1[41] = swift_task_alloc();
  uint64_t v9 = sub_10FDC8();
  v1[42] = v9;
  v1[43] = *(void *)(v9 - 8);
  v1[44] = swift_task_alloc();
  return _swift_task_switch(sub_CF51C, 0, 0);
}

uint64_t sub_CF51C()
{
  unint64_t v1 = *(void *)(*(void *)(v0 + 136) + 56);
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void **)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_43:
    swift_bridgeObjectRelease();
    *(unsigned char *)(v0 + 528) = 3;
    sub_3DD4(&qword_1401F0);
    sub_C158((unint64_t *)&qword_1401F8, &qword_1401F0);
    swift_allocError();
    sub_10FF38();
    swift_willThrow();
LABEL_44:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v61 = *(uint64_t (**)(void))(v0 + 8);
    return v61();
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_110CD8();
  if (!v2) {
    goto LABEL_43;
  }
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    id v3 = (id)sub_110C18();
LABEL_6:
    uint64_t v2 = v3;
    *(void *)(v0 + 360) = v3;
    swift_bridgeObjectRelease();
    if (qword_13F168 == -1) {
      goto LABEL_7;
    }
    goto LABEL_49;
  }
  if (*(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8)))
  {
    id v3 = *(id *)(v1 + 32);
    goto LABEL_6;
  }
  __break(1u);
LABEL_49:
  swift_once();
LABEL_7:
  uint64_t v4 = sub_3E18(*(void *)(v0 + 168), (uint64_t)qword_142BF0);
  *(void *)(v0 + 368) = v4;
  uint64_t v5 = sub_110768();
  os_log_type_t v6 = sub_1109F8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "SearchAlarm.ResultSetProvider makeSingleItemFlow()", v7, 2u);
    swift_slowDealloc();
  }
  uint64_t v9 = *(void *)(v0 + 344);
  uint64_t v8 = *(void *)(v0 + 352);
  uint64_t v10 = *(void *)(v0 + 336);

  sub_10FDB8();
  BOOL v11 = sub_10FD98();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  if (v11)
  {
    uint64_t v12 = sub_800B8(0, 0);
    *(void *)(v0 + 376) = v12;
    if (v12)
    {
      uint64_t v13 = (uint64_t)v12;
      if (qword_13F0B8 != -1) {
        swift_once();
      }
      uint64_t v14 = *(void *)(v0 + 136);
      swift_retain();
      sub_CDEA0();
      uint64_t v16 = v15;
      sub_CE098();
      uint64_t v18 = v17;
      uint64_t v19 = *(void **)(v14 + 64);
      if (v19)
      {
        id v20 = [*(id *)(v14 + 64) label];
        uint64_t v21 = *(void *)(v0 + 328);
        if (v20)
        {
          id v22 = v20;
          sub_110848();

          sub_110878();
          swift_bridgeObjectRelease();
          uint64_t v23 = sub_10FBC8();
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v21, 0, 1, v23);
        }
        else
        {
          uint64_t v50 = sub_10FBC8();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v21, 1, 1, v50);
        }
        uint64_t v44 = sub_33FD8();
        [v19 alarmSearchStatus];
        uint64_t v51 = sub_110378();
        char v45 = v51 == sub_110378();
        id v52 = [v19 includeSleepAlarm];
        sub_12EE4();
        v53.super.super.Class isa = sub_110AC8(1).super.super.isa;
        Class isa = v53.super.super.isa;
        if (v52)
        {
          id v55 = v52;
          sub_110AD8();
        }
        else
        {
        }
      }
      else
      {
        uint64_t v42 = *(void *)(v0 + 328);
        uint64_t v43 = sub_10FBC8();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v42, 1, 1, v43);
        uint64_t v44 = 0;
        char v45 = 0;
      }
      *(void *)(v0 + 384) = v44;
      id v56 = [v19 isMeridianInferred];
      sub_12EE4();
      v57.super.super.Class isa = sub_110AC8(1).super.super.isa;
      if (v56)
      {
        id v58 = v56;
        sub_110AD8();
      }
      id v59 = (void *)swift_task_alloc();
      *(void *)(v0 + 392) = v59;
      void *v59 = v0;
      v59[1] = sub_CFE8C;
      uint64_t v60 = *(void *)(v0 + 328);
      return sub_10CD98(v13, v16, 0, v18, 0, v60, v44, v45);
    }
    uint64_t v38 = sub_110768();
    os_log_type_t v39 = sub_1109E8();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl(&dword_0, v38, v39, "Can NOT retrieve alarm data.", v40, 2u);
      swift_slowDealloc();
    }

    sub_3DD4(&qword_1401F0);
    sub_C158((unint64_t *)&qword_1401F8, &qword_1401F0);
    swift_allocError();
    *uint64_t v41 = 3;
    swift_willThrow();

    goto LABEL_44;
  }
  uint64_t v24 = *(void *)(v0 + 184);
  uint64_t v25 = *(void *)(v0 + 168);
  uint64_t v26 = *(void *)(v0 + 176);
  (*(void (**)(void, void, void))(*(void *)(v0 + 200) + 104))(*(void *)(v0 + 208), enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), *(void *)(v0 + 192));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v24, v4, v25);
  mach_absolute_time();
  sub_10FD88();
  if (qword_13F0C0 != -1) {
    swift_once();
  }
  uint64_t v27 = qword_144500;
  id v28 = *(void **)(*(void *)(v0 + 136) + 64);
  id v29 = [v28 isMeridianInferred];
  sub_12EE4();
  v30.super.super.Class isa = sub_110AC8(1).super.super.isa;
  if (v29)
  {
    id v31 = v29;
    LOBYTE(v29) = sub_110AD8();
  }
  if (v28)
  {
    [v28 alarmSearchStatus];
    uint64_t v32 = sub_110378();
    BOOL v33 = v32 == sub_110378();
    id v34 = [v28 includeSleepAlarm];
    v35.super.super.Class isa = sub_110AC8(1).super.super.isa;
    if (v34)
    {
      id v36 = v34;
      char v37 = sub_110AD8();
    }
    else
    {
      char v37 = 0;
    }
  }
  else
  {
    char v37 = 0;
    BOOL v33 = 0;
  }
  uint64_t v62 = (uint64_t (*)(char, char, char, uint64_t, uint64_t, uint64_t))((char *)&dword_141F08 + dword_141F08);
  id v46 = v2;
  swift_retain();
  os_log_type_t v47 = (void *)swift_task_alloc();
  *(void *)(v0 + 488) = v47;
  *os_log_type_t v47 = v0;
  v47[1] = sub_D1314;
  uint64_t v48 = *(void *)(v0 + 136);
  return v62(v29 & 1, v33, v37 & 1, v27, (uint64_t)v46, v48);
}

uint64_t sub_CFE8C(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 400) = a1;
  *(void *)(v4 + 408) = v1;
  swift_task_dealloc();
  sub_1646C(*(void *)(v3 + 328), &qword_13FA88);
  swift_release();
  swift_release();
  if (v1) {
    uint64_t v5 = sub_D1924;
  }
  else {
    uint64_t v5 = sub_D0010;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_D0010()
{
  id v1 = [*(id *)(v0 + 360) sleepAlarmAttribute];

  if (v1)
  {
    NSNumber v35 = (uint64_t (__cdecl *)())((char *)&dword_143AE0 + dword_143AE0);
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 416) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_D05A4;
    return v35();
  }
  else
  {
    uint64_t v4 = *(void *)(v0 + 304);
    uint64_t v5 = *(void *)(v0 + 312);
    uint64_t v6 = *(void *)(v0 + 296);
    sub_80D78(0, 0xE000000000000000, 0, 0xE000000000000000, v6);
    swift_bridgeObjectRelease_n();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4) == 1)
    {
      sub_1646C(*(void *)(v0 + 296), &qword_1401D8);
      uint64_t v7 = sub_110768();
      os_log_type_t v8 = sub_1109E8();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_0, v7, v8, "Can NOT retrieve alarm snippet model.", v9, 2u);
        swift_slowDealloc();
      }
      uint64_t v10 = *(void **)(v0 + 400);
      BOOL v11 = *(void **)(v0 + 360);

      sub_3DD4(&qword_1401F0);
      sub_C158((unint64_t *)&qword_1401F8, &qword_1401F0);
      swift_allocError();
      *uint64_t v12 = 3;
      swift_willThrow();
      swift_release();

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
      return v13();
    }
    else
    {
      uint64_t v14 = *(void **)(v0 + 360);
      uint64_t v15 = *(void *)(v0 + 312);
      uint64_t v16 = *(void *)(v0 + 304);
      uint64_t v17 = *(void *)(v0 + 200);
      uint64_t v29 = *(void *)(v0 + 320);
      uint64_t v30 = *(void *)(v0 + 208);
      uint64_t v18 = *(void *)(v0 + 176);
      uint64_t v31 = *(void *)(v0 + 192);
      uint64_t v32 = *(void *)(v0 + 184);
      uint64_t v33 = *(void *)(v0 + 168);
      uint64_t v34 = *(void *)(v0 + 368);
      (*(void (**)(void))(v15 + 32))();
      sub_10E7B8();
      sub_3DD4(&qword_1401E8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_111BF0;
      *(void *)(inited + 32) = v14;
      unint64_t v36 = inited;
      sub_110928();
      id v20 = v14;
      sub_13370(v36);
      swift_bridgeObjectRelease();
      uint64_t v21 = sub_110548();
      *(void *)(v0 + 120) = v21;
      *(void *)(v0 + 128) = sub_D7888((unint64_t *)&qword_140200, 255, (void (*)(uint64_t))&type metadata accessor for SiriAlarmSnippetModels);
      id v22 = sub_31294((uint64_t *)(v0 + 96));
      sub_3DD4(&qword_140208);
      unint64_t v23 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
      uint64_t v24 = swift_allocObject();
      *(_OWORD *)(v24 + 16) = xmmword_1117A0;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v15 + 16))(v24 + v23, v29, v16);
      sub_110388();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v22, enum case for SiriAlarmSnippetModels.alarmMulti(_:), v21);
      (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v30, enum case for SiriTimeMeasurement.LogDescription.dialogResponseTime(_:), v31);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v32, v34, v33);
      mach_absolute_time();
      sub_10FD88();
      uint64_t v25 = (void *)swift_task_alloc();
      *(void *)(v0 + 480) = v25;
      *uint64_t v25 = v0;
      v25[1] = sub_D0F7C;
      uint64_t v26 = *(void *)(v0 + 288);
      uint64_t v27 = *(void *)(v0 + 264);
      uint64_t v28 = *(void *)(v0 + 240);
      return DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)(v0 + 16, v26, v27, v0 + 96, v28, 0, 0, 0);
    }
  }
}

uint64_t sub_D05A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[53] = a1;
  v4[54] = a2;
  v4[55] = v2;
  swift_task_dealloc();
  if (v2)
  {
    return _swift_task_switch(sub_D0868, 0, 0);
  }
  else
  {
    uint64_t v7 = (uint64_t (*)(void))((char *)&dword_143AD8 + dword_143AD8);
    uint64_t v5 = (void *)swift_task_alloc();
    v4[56] = v5;
    *uint64_t v5 = v4;
    v5[1] = sub_D072C;
    return v7();
  }
}

uint64_t sub_D072C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 456) = v2;
  swift_task_dealloc();
  if (v2)
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_D0E68;
  }
  else
  {
    *(void *)(v6 + 464) = a2;
    *(void *)(v6 + 472) = a1;
    uint64_t v7 = sub_D097C;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_D0868()
{
  id v1 = *(void **)(v0 + 400);

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_D097C()
{
  uint64_t v1 = v0[38];
  uint64_t v2 = v0[39];
  uint64_t v3 = v0[37];
  sub_80D78(v0[53], v0[54], v0[59], v0[58], v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_1646C(v0[37], &qword_1401D8);
    uint64_t v4 = sub_110768();
    os_log_type_t v5 = sub_1109E8();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_0, v4, v5, "Can NOT retrieve alarm snippet model.", v6, 2u);
      swift_slowDealloc();
    }
    uint64_t v7 = (void *)v0[50];
    uint64_t v8 = (void *)v0[45];

    sub_3DD4(&qword_1401F0);
    sub_C158((unint64_t *)&qword_1401F8, &qword_1401F0);
    swift_allocError();
    *uint64_t v9 = 3;
    swift_willThrow();
    swift_release();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
  else
  {
    uint64_t v12 = (void *)v0[45];
    uint64_t v13 = v0[39];
    uint64_t v14 = v0[38];
    uint64_t v15 = v0[25];
    uint64_t v27 = v0[40];
    uint64_t v28 = v0[26];
    uint64_t v16 = v0[22];
    uint64_t v29 = v0[24];
    uint64_t v30 = v0[23];
    uint64_t v31 = v0[21];
    uint64_t v32 = v0[46];
    (*(void (**)(void))(v13 + 32))();
    sub_10E7B8();
    sub_3DD4(&qword_1401E8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_111BF0;
    *(void *)(inited + 32) = v12;
    unint64_t v33 = inited;
    sub_110928();
    id v18 = v12;
    sub_13370(v33);
    swift_bridgeObjectRelease();
    uint64_t v19 = sub_110548();
    v0[15] = v19;
    v0[16] = sub_D7888((unint64_t *)&qword_140200, 255, (void (*)(uint64_t))&type metadata accessor for SiriAlarmSnippetModels);
    id v20 = sub_31294(v0 + 12);
    sub_3DD4(&qword_140208);
    unint64_t v21 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_1117A0;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v13 + 16))(v22 + v21, v27, v14);
    sub_110388();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v20, enum case for SiriAlarmSnippetModels.alarmMulti(_:), v19);
    (*(void (**)(uint64_t, void, uint64_t))(v15 + 104))(v28, enum case for SiriTimeMeasurement.LogDescription.dialogResponseTime(_:), v29);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v30, v32, v31);
    mach_absolute_time();
    sub_10FD88();
    unint64_t v23 = (void *)swift_task_alloc();
    v0[60] = v23;
    *unint64_t v23 = v0;
    v23[1] = sub_D0F7C;
    uint64_t v24 = v0[36];
    uint64_t v25 = v0[33];
    uint64_t v26 = v0[30];
    return DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)(v0 + 2, v24, v25, v0 + 12, v26, 0, 0, 0);
  }
}

uint64_t sub_D0E68()
{
  uint64_t v1 = *(void **)(v0 + 400);

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_D0F7C()
{
  uint64_t v11 = *(void *)v0 + 96;
  uint64_t v1 = *(void *)(*(void *)v0 + 288);
  uint64_t v2 = *(void *)(*(void *)v0 + 280);
  uint64_t v3 = *(void *)(*(void *)v0 + 272);
  uint64_t v4 = *(void *)(*(void *)v0 + 264);
  uint64_t v5 = *(void *)(*(void *)v0 + 256);
  uint64_t v6 = *(void *)(*(void *)v0 + 248);
  uint64_t v7 = *(void *)(*(void *)v0 + 240);
  uint64_t v8 = *(void *)(*(void *)v0 + 224);
  uint64_t v9 = *(void *)(*(void *)v0 + 216);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_1646C(v11, &qword_140210);
  return _swift_task_switch(sub_D11AC, 0, 0);
}

uint64_t sub_D11AC()
{
  uint64_t v1 = (void *)v0[50];
  uint64_t v2 = (void *)v0[45];
  uint64_t v4 = v0[39];
  uint64_t v3 = v0[40];
  uint64_t v5 = v0[38];
  sub_17BD8(v0 + 2, v0[5]);
  uint64_t v8 = sub_10EE98();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  _s20HandleIntentStrategyVwxx_1((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
  return v6(v8);
}

uint64_t sub_D1314(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[62] = v1;
  swift_task_dealloc();
  uint64_t v5 = (void *)v4[45];
  swift_release();

  if (v1)
  {
    uint64_t v6 = sub_D1804;
  }
  else
  {
    v4[63] = a1;
    uint64_t v6 = sub_D1470;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_D1470()
{
  uint64_t v1 = v0[45];
  sub_10E7B8();
  *(void *)(swift_task_alloc() + 16) = v1;
  sub_10EC58();
  swift_task_dealloc();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[64] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_D1568;
  uint64_t v3 = v0[29];
  uint64_t v4 = v0[20];
  return PatternExecutionResult.generateFlow(manifest:measure:)(v4, v3);
}

uint64_t sub_D1568(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)v1 + 504);
  uint64_t v3 = *(void *)(*(void *)v1 + 160);
  uint64_t v4 = *(void *)(*(void *)v1 + 152);
  uint64_t v5 = *(void *)(*(void *)v1 + 144);
  *(void *)(*(void *)v1 + 520) = a1;
  swift_task_dealloc();

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  return _swift_task_switch(sub_D16E0, 0, 0);
}

uint64_t sub_D16E0()
{
  uint64_t v2 = *(void *)(v0 + 224);
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v3 = *(void *)(v0 + 216);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v6 = *(void *)(v0 + 520);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v4(v6);
}

uint64_t sub_D1804()
{
  uint64_t v2 = *(void *)(v0 + 224);
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v3 = *(void *)(v0 + 216);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_D1924()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_D1A30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_3DD4(&qword_13FA88);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_800B8(0, 0);
  swift_release();
  *(void *)a1 = v8;
  sub_CDEA0();
  *(void *)(a1 + 40) = v9;
  *(unsigned char *)(a1 + 48) = 0;
  sub_CE098();
  *(void *)(a1 + 16) = v10;
  *(unsigned char *)(a1 + 24) = 0;
  uint64_t v11 = sub_CE274();
  swift_release();
  *(void *)(a1 + 32) = v11;
  uint64_t v12 = *(void *)(a3 + 64);
  if (v12)
  {
    id v13 = [*(id *)(a3 + 64) label];
    if (v13)
    {
      uint64_t v14 = v13;
      sub_110848();

      sub_110878();
      swift_bridgeObjectRelease();
      uint64_t v15 = sub_10FBC8();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v7, 0, 1, v15);
    }
    else
    {
      uint64_t v18 = sub_10FBC8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v7, 1, 1, v18);
    }
    uint64_t SuccessSingleParameters = type metadata accessor for SearchQuerySuccessSingleParameters(0);
    sub_33F10((uint64_t)v7, a1 + *(int *)(SuccessSingleParameters + 44));
    uint64_t v12 = sub_33FD8();
  }
  else
  {
    uint64_t v16 = sub_10FBC8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v7, 1, 1, v16);
    uint64_t v17 = type metadata accessor for SearchQuerySuccessSingleParameters(0);
    sub_33F10((uint64_t)v7, a1 + *(int *)(v17 + 44));
  }
  uint64_t v20 = *(int *)(type metadata accessor for SearchQuerySuccessSingleParameters(0) + 52);
  swift_release();
  *(void *)(a1 + v20) = v12;
  sub_10FB68();
  if (qword_13F180 != -1) {
    swift_once();
  }
  swift_retain();
  uint64_t v21 = sub_10FB58();
  uint64_t result = swift_release();
  *(void *)(a1 + 8) = v21;
  return result;
}

uint64_t sub_D1CB0(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_3DD4(&qword_13F908);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3DD4(&qword_1401E8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_111BF0;
  *(void *)(inited + 32) = a2;
  unint64_t v11 = inited;
  sub_110928();
  unint64_t v7 = v11;
  id v8 = a2;
  sub_13370(v7);
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_10EAB8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v5, 0, 1, v9);
  return sub_10EC68();
}

uint64_t sub_D1DC4()
{
  v1[12] = v0;
  uint64_t v2 = sub_10EC88();
  v1[13] = v2;
  v1[14] = *(void *)(v2 - 8);
  v1[15] = swift_task_alloc();
  uint64_t v3 = sub_10ED58();
  v1[16] = v3;
  v1[17] = *(void *)(v3 - 8);
  v1[18] = swift_task_alloc();
  uint64_t v4 = sub_110778();
  v1[19] = v4;
  v1[20] = *(void *)(v4 - 8);
  v1[21] = swift_task_alloc();
  uint64_t v5 = sub_10FD58();
  v1[22] = v5;
  v1[23] = *(void *)(v5 - 8);
  v1[24] = swift_task_alloc();
  uint64_t v6 = sub_10FD78();
  v1[25] = v6;
  v1[26] = *(void *)(v6 - 8);
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  uint64_t v7 = sub_10EAB8();
  v1[29] = v7;
  v1[30] = *(void *)(v7 - 8);
  v1[31] = swift_task_alloc();
  uint64_t v8 = sub_10E828();
  v1[32] = v8;
  v1[33] = *(void *)(v8 - 8);
  v1[34] = swift_task_alloc();
  uint64_t v9 = sub_10FDC8();
  v1[35] = v9;
  v1[36] = *(void *)(v9 - 8);
  v1[37] = swift_task_alloc();
  return _swift_task_switch(sub_D2118, 0, 0);
}

uint64_t sub_D2118()
{
  if (qword_13F168 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_3E18(v0[19], (uint64_t)qword_142BF0);
  v0[38] = v1;
  uint64_t v2 = sub_110768();
  os_log_type_t v3 = sub_1109F8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "SearchAlarm.ResultSetProvider makeAllResultsFlow()", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[12];

  unint64_t v6 = *(void *)(v5 + 56);
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_110CD8();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v11 = (void *)swift_task_alloc();
    v0[39] = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_D2564;
    return sub_CE7E4();
  }
  if (!*(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8))) {
    goto LABEL_13;
  }
LABEL_7:
  unint64_t v7 = *(void *)(v5 + 56);
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_110CD8();
    swift_bridgeObjectRelease();
    if (v12 == 1) {
      goto LABEL_9;
    }
  }
  else if (*(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8)) == 1)
  {
LABEL_9:
    uint64_t v8 = (void *)swift_task_alloc();
    v0[40] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_D278C;
    return sub_CF168();
  }
  uint64_t v14 = v0[36];
  uint64_t v13 = v0[37];
  uint64_t v15 = v0[35];
  sub_10FDB8();
  BOOL v16 = sub_10FD98();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  if (v16)
  {
    uint64_t v25 = (uint64_t (*)(void))((char *)&dword_143AE0 + dword_143AE0);
    uint64_t v17 = (void *)swift_task_alloc();
    v0[41] = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_D29B4;
    return v25();
  }
  else
  {
    uint64_t v18 = v0[21];
    uint64_t v19 = v0[19];
    uint64_t v20 = v0[20];
    (*(void (**)(void, void, void))(v0[23] + 104))(v0[24], enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), v0[22]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v18, v1, v19);
    mach_absolute_time();
    sub_10FD88();
    sub_10ED08();
    uint64_t v21 = *(void *)(v5 + 56);
    v0[54] = v21;
    swift_bridgeObjectRetain();
    uint64_t v22 = (void *)swift_task_alloc();
    v0[55] = v22;
    *uint64_t v22 = v0;
    v22[1] = sub_D3754;
    uint64_t v23 = v0[18];
    uint64_t v24 = v0[12];
    v22[3] = v21;
    v22[4] = v24;
    v22[2] = v23;
    return _swift_task_switch(sub_D63C0, 0, 0);
  }
}

uint64_t sub_D2564(uint64_t a1)
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v2 + 8);
  if (!v7) {
    uint64_t v3 = a1;
  }
  return v4(v3);
}

uint64_t sub_D278C(uint64_t a1)
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v2 + 8);
  if (!v7) {
    uint64_t v3 = a1;
  }
  return v4(v3);
}

uint64_t sub_D29B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[42] = a1;
  v4[43] = a2;
  swift_task_dealloc();
  if (v2)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v4[1];
    return v5();
  }
  else
  {
    uint64_t v8 = (uint64_t (__cdecl *)())((char *)&dword_143AD8 + dword_143AD8);
    uint64_t v7 = (void *)swift_task_alloc();
    v4[44] = v7;
    *uint64_t v7 = v4;
    v7[1] = sub_D2BBC;
    return v8();
  }
}

uint64_t sub_D2BBC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 360) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = sub_D2CF0;
  }
  else
  {
    *(void *)(v6 + 368) = a2;
    *(void *)(v6 + 376) = a1;
    uint64_t v7 = sub_D2DD8;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_D2CF0()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_D2DD8()
{
  uint64_t v1 = v0[46];
  uint64_t v2 = v0[47];
  uint64_t v4 = v0[42];
  uint64_t v3 = v0[43];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v5 = swift_bridgeObjectRetain();
  v0[48] = sub_D7550(v5, v4, v3, v2, v1);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  if (qword_13F0B8 != -1) {
    swift_once();
  }
  sub_CDEA0();
  uint64_t v7 = v6;
  sub_3DD4(&qword_13FC38);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 32) = 0xD000000000000010;
  *(void *)(v8 + 40) = 0x8000000000116730;
  *(void *)(v8 + 72) = &type metadata for Double;
  uint64_t v11 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:)
                                                                            + async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  v0[49] = v8;
  *(_OWORD *)(v8 + 16) = xmmword_1117A0;
  *(void *)(v8 + 48) = v7;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[50] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_D2FB8;
  return v11(0xD000000000000025, 0x8000000000116EB0, v8);
}

uint64_t sub_D2FB8(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 408) = v1;
  swift_task_dealloc();
  if (v1)
  {
    unint64_t v5 = sub_D3664;
  }
  else
  {
    swift_bridgeObjectRelease();
    *(void *)(v4 + 416) = a1;
    unint64_t v5 = sub_D30E8;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_D30E8()
{
  uint64_t v15 = v0[38];
  uint64_t v2 = v0[23];
  uint64_t v1 = v0[24];
  uint64_t v3 = v0[21];
  uint64_t v4 = v0[22];
  uint64_t v5 = v0[20];
  uint64_t v14 = v0[19];
  sub_10E7B8();
  unint64_t v6 = swift_bridgeObjectRetain();
  sub_13370(v6);
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_110548();
  v0[10] = v7;
  v0[11] = sub_D7888((unint64_t *)&qword_140200, 255, (void (*)(uint64_t))&type metadata accessor for SiriAlarmSnippetModels);
  uint64_t v8 = sub_31294(v0 + 7);
  sub_110388();
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v7 - 8) + 104))(v8, enum case for SiriAlarmSnippetModels.alarmMulti(_:), v7);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for SiriTimeMeasurement.LogDescription.dialogResponseTime(_:), v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v15, v14);
  mach_absolute_time();
  sub_10FD88();
  uint64_t v9 = (void *)swift_task_alloc();
  v0[53] = (uint64_t)v9;
  *uint64_t v9 = v0;
  v9[1] = sub_D3314;
  uint64_t v10 = v0[34];
  uint64_t v11 = v0[31];
  uint64_t v12 = v0[28];
  return DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)(v0 + 2, v10, v11, v0 + 7, v12, 0, 0, 0);
}

uint64_t sub_D3314()
{
  uint64_t v11 = *(void *)v0 + 56;
  uint64_t v1 = *(void *)(*(void *)v0 + 272);
  uint64_t v2 = *(void *)(*(void *)v0 + 264);
  uint64_t v3 = *(void *)(*(void *)v0 + 256);
  uint64_t v4 = *(void *)(*(void *)v0 + 248);
  uint64_t v5 = *(void *)(*(void *)v0 + 240);
  uint64_t v6 = *(void *)(*(void *)v0 + 232);
  uint64_t v7 = *(void *)(*(void *)v0 + 224);
  uint64_t v8 = *(void *)(*(void *)v0 + 208);
  uint64_t v9 = *(void *)(*(void *)v0 + 200);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_1646C(v11, &qword_140210);
  return _swift_task_switch(sub_D3544, 0, 0);
}

uint64_t sub_D3544()
{
  uint64_t v1 = (void *)v0[52];
  sub_17BD8(v0 + 2, v0[5]);
  uint64_t v2 = sub_10EE98();

  _s20HandleIntentStrategyVwxx_1((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
  return v3(v2);
}

uint64_t sub_D3664()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_D3754(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[56] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[18];
  uint64_t v6 = v4[17];
  uint64_t v7 = v4[16];
  if (v1)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_D3C58;
  }
  else
  {
    v4[57] = a1;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_D3900;
  }
  return _swift_task_switch(v8, 0, 0);
}

uint64_t sub_D3900()
{
  sub_10E7B8();
  sub_10EC58();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[58] = v1;
  void *v1 = v0;
  v1[1] = sub_D39E0;
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[15];
  return PatternExecutionResult.generateFlow(manifest:measure:)(v3, v2);
}

uint64_t sub_D39E0(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)v1 + 456);
  uint64_t v3 = *(void *)(*(void *)v1 + 120);
  uint64_t v4 = *(void *)(*(void *)v1 + 112);
  uint64_t v5 = *(void *)(*(void *)v1 + 104);
  *(void *)(*(void *)v1 + 472) = a1;
  swift_task_dealloc();

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  return _swift_task_switch(sub_D3B58, 0, 0);
}

uint64_t sub_D3B58()
{
  (*(void (**)(void, void))(v0[26] + 8))(v0[27], v0[25]);
  uint64_t v1 = v0[59];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_D3C58()
{
  (*(void (**)(void, void))(v0[26] + 8))(v0[27], v0[25]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_D3D50()
{
  uint64_t v0 = sub_3DD4(&qword_13F908);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v3 = swift_bridgeObjectRetain();
  sub_13370(v3);
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_10EAB8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 0, 1, v4);
  return sub_10EC68();
}

uint64_t sub_D3E2C(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  uint64_t v4 = sub_10ED58();
  v3[7] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[8] = v5;
  v3[9] = *(void *)(v5 + 64);
  v3[10] = swift_task_alloc();
  uint64_t v6 = sub_10E828();
  v3[11] = v6;
  v3[12] = *(void *)(v6 - 8);
  v3[13] = swift_task_alloc();
  uint64_t v7 = sub_10EC88();
  v3[14] = v7;
  v3[15] = *(void *)(v7 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  uint64_t v8 = sub_1103B8();
  v3[18] = v8;
  v3[19] = *(void *)(v8 - 8);
  v3[20] = swift_task_alloc();
  uint64_t v9 = sub_10EAB8();
  v3[21] = v9;
  v3[22] = *(void *)(v9 - 8);
  v3[23] = swift_task_alloc();
  return _swift_task_switch(sub_D4078, 0, 0);
}

uint64_t sub_D4078()
{
  if (qword_13F168 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_110778();
  sub_3E18(v1, (uint64_t)qword_142BF0);
  uint64_t v2 = sub_110768();
  os_log_type_t v3 = sub_1109F8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "SearchAlarm.ResultSetProvider makeWindowFlow", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[23];
  uint64_t v6 = v0[20];
  uint64_t v26 = v0[22];
  uint64_t v27 = v0[21];
  uint64_t v7 = v0[18];
  uint64_t v8 = v0[19];
  uint64_t v9 = v0[15];
  uint64_t v10 = v0[14];
  uint64_t v30 = v0[13];
  uint64_t v11 = v0[12];
  uint64_t v19 = v0[11];
  uint64_t v20 = v0[16];
  uint64_t v28 = v0[17];
  uint64_t v29 = v0[10];
  uint64_t v12 = v0[8];
  uint64_t v22 = v0[7];
  uint64_t v23 = v0[9];
  uint64_t v24 = v0[6];
  uint64_t v25 = v0[5];
  uint64_t v21 = v0[4];

  (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v6, enum case for AlarmNLv4Constants.AlarmVerb.summarise(_:), v7);
  sub_C946C(v6, v5);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  sub_10E7D8();
  sub_10EC48();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v30, v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v20, v28, v10);
  sub_10EAD8();
  swift_allocObject();
  sub_10EAC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v29, v21, v22);
  unint64_t v13 = (*(unsigned __int8 *)(v12 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v24;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v12 + 32))(v14 + v13, v29, v22);
  *(void *)(v14 + ((v23 + v13 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
  sub_110108();
  swift_allocObject();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1100F8();
  sub_10EC28();
  swift_allocObject();
  sub_10EAC8();
  sub_10E4C8();
  swift_allocObject();
  v0[2] = sub_10E4B8();
  sub_D7888(&qword_142E40, 255, (void (*)(uint64_t))&type metadata accessor for YesNoSearchWindowStrategy);
  uint64_t v15 = sub_10E4D8();
  swift_release();
  v0[3] = v15;
  sub_3DD4(&qword_142E48);
  sub_C158(&qword_142E50, &qword_142E48);
  uint64_t v16 = sub_10E608();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v28, v10);
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v5, v27);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(uint64_t))v0[1];
  return v17(v16);
}

uint64_t sub_D45B8(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_10EAB8();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  uint64_t v3 = sub_10E828();
  v1[6] = v3;
  v1[7] = *(void *)(v3 - 8);
  v1[8] = swift_task_alloc();
  return _swift_task_switch(sub_D46D4, 0, 0);
}

uint64_t sub_D46D4()
{
  if (qword_13F168 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_110778();
  sub_3E18(v1, (uint64_t)qword_142BF0);
  uint64_t v2 = sub_110768();
  os_log_type_t v3 = sub_1109F8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "SearchAlarm.ResultSetProvider window prompt producing rejection output", v4, 2u);
    swift_slowDealloc();
  }

  sub_10E808();
  sub_10EAA8();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[9] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_D4844;
  uint64_t v6 = v0[8];
  uint64_t v7 = v0[5];
  uint64_t v8 = v0[2];
  return sub_30148(v8, v6, v7);
}

uint64_t sub_D4844()
{
  uint64_t v2 = *(void *)(*v1 + 64);
  uint64_t v3 = *(void *)(*v1 + 56);
  uint64_t v4 = *(void *)(*v1 + 48);
  uint64_t v5 = *(void *)(*v1 + 40);
  uint64_t v6 = *(void *)(*v1 + 32);
  uint64_t v7 = *(void *)(*v1 + 24);
  uint64_t v8 = *v1;
  *(void *)(*v1 + 80) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0)
  {
    return _swift_task_switch(sub_D7938, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(void))(v8 + 8);
    return v9();
  }
}

uint64_t sub_D4A70(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_10EAB8();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  uint64_t v3 = sub_10E828();
  v1[6] = v3;
  v1[7] = *(void *)(v3 - 8);
  v1[8] = swift_task_alloc();
  return _swift_task_switch(sub_D4B8C, 0, 0);
}

uint64_t sub_D4B8C()
{
  if (qword_13F168 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_110778();
  sub_3E18(v1, (uint64_t)qword_142BF0);
  uint64_t v2 = sub_110768();
  os_log_type_t v3 = sub_1109F8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "SearchAlarm.ResultSetProvider window prompt producing cancel output", v4, 2u);
    swift_slowDealloc();
  }

  sub_10E808();
  sub_10EAA8();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[9] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_46FA8;
  uint64_t v6 = v0[8];
  uint64_t v7 = v0[5];
  uint64_t v8 = v0[2];
  return sub_30148(v8, v6, v7);
}

uint64_t sub_D4CFC(uint64_t a1)
{
  uint64_t v2 = sub_10F928();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_13F168 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_110778();
  sub_3E18(v6, (uint64_t)qword_142BF0);
  uint64_t v7 = sub_110768();
  os_log_type_t v8 = sub_1109F8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_0, v7, v8, "SearchAlarm.ResultSetProvider Window prompt parsing nlv3 ActionForInput", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  type metadata accessor for AlarmNLIntent();
  swift_allocObject();
  sub_BDBE0((uint64_t)v5);
  if (sub_BDB0C() == 3) {
    sub_10E928();
  }
  else {
    sub_10E918();
  }
  return swift_release();
}

uint64_t sub_D4ED4(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_3DD4((uint64_t *)&unk_13F7B0);
  v2[4] = swift_task_alloc();
  uint64_t v3 = sub_10F928();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return _swift_task_switch(sub_D4FC4, 0, 0);
}

uint64_t sub_D4FC4()
{
  if (qword_13F168 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_110778();
  sub_3E18(v1, (uint64_t)qword_142BF0);
  uint64_t v2 = sub_110768();
  os_log_type_t v3 = sub_1109F8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "SearchAlarm.ResultSetProvider Window prompt parsing nlv3 window action", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v6 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v7 = v0[5];
  uint64_t v8 = v0[3];

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
  type metadata accessor for AlarmNLIntent();
  swift_allocObject();
  sub_BDBE0(v5);
  int v9 = sub_BDB0C();
  if ((v9 - 1) < 2)
  {
    uint64_t v10 = v0[4];
    uint64_t v11 = (unsigned int *)&enum case for ConfirmationResponse.rejected(_:);
LABEL_9:
    uint64_t v12 = *v11;
    uint64_t v13 = sub_10EB78();
    uint64_t v14 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 104))(v10, v12, v13);
    uint64_t v15 = 0;
    goto LABEL_11;
  }
  if (!v9)
  {
    uint64_t v10 = v0[4];
    uint64_t v11 = (unsigned int *)&enum case for ConfirmationResponse.confirmed(_:);
    goto LABEL_9;
  }
  uint64_t v13 = sub_10EB78();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = 1;
LABEL_11:
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v14 + 56))(v0[4], v15, 1, v13);
  sub_10EDD8();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_D5264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[3] = a3;
  v7[4] = a1;
  v7[1] = sub_11D1C;
  v7[2] = a2;
  return _swift_task_switch(sub_D63C0, 0, 0);
}

uint64_t sub_D5320(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  sub_10E828();
  v3[5] = swift_task_alloc();
  uint64_t v4 = sub_10EC88();
  v3[6] = v4;
  v3[7] = *(void *)(v4 - 8);
  v3[8] = swift_task_alloc();
  uint64_t v5 = sub_110778();
  v3[9] = v5;
  v3[10] = *(void *)(v5 - 8);
  v3[11] = swift_task_alloc();
  uint64_t v6 = sub_10FD58();
  v3[12] = v6;
  v3[13] = *(void *)(v6 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v7 = sub_10FD78();
  v3[15] = v7;
  v3[16] = *(void *)(v7 - 8);
  v3[17] = swift_task_alloc();
  return _swift_task_switch(sub_D5524, 0, 0);
}

uint64_t sub_D5524()
{
  if (qword_13F168 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_3E18(*(void *)(v0 + 72), (uint64_t)qword_142BF0);
  uint64_t v2 = sub_110768();
  os_log_type_t v3 = sub_1109F8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "SearchAlarm.ResultSetProvider makeFinalWindowFlow", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = *(void *)(v0 + 32);

  unint64_t v6 = *(void *)(v5 + 56);
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_110CD8();
    swift_bridgeObjectRelease();
    if (v12 == 1) {
      goto LABEL_7;
    }
  }
  else if (*(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8)) == 1)
  {
LABEL_7:
    uint64_t v7 = sub_110768();
    os_log_type_t v8 = sub_1109F8();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_0, v7, v8, "SearchAlarm.ResultSetProvider Bypassing windowing flow for single item presentation", v9, 2u);
      swift_slowDealloc();
    }

    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 144) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_D5828;
    return sub_CF168();
  }
  uint64_t v13 = *(void *)(v0 + 88);
  uint64_t v14 = *(void *)(v0 + 72);
  uint64_t v15 = *(void *)(v0 + 80);
  (*(void (**)(void, void, void))(*(void *)(v0 + 104) + 104))(*(void *)(v0 + 112), enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), *(void *)(v0 + 96));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v13, v1, v14);
  mach_absolute_time();
  sub_10FD88();
  uint64_t v16 = swift_task_alloc();
  *(void *)(v0 + 152) = v16;
  *(void *)uint64_t v16 = v0;
  *(void *)(v16 + 8) = sub_D59D4;
  long long v17 = *(_OWORD *)(v0 + 16);
  *(void *)(v16 + 32) = *(void *)(v0 + 32);
  *(_OWORD *)(v16 + 16) = v17;
  return _swift_task_switch(sub_D63C0, 0, 0);
}

uint64_t sub_D5828(uint64_t a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = swift_task_dealloc();
  unint64_t v6 = *(uint64_t (**)(uint64_t))(v4 + 8);
  if (!v1) {
    uint64_t v5 = a1;
  }
  return v6(v5);
}

uint64_t sub_D59D4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 160) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_D5E30;
  }
  else
  {
    *(void *)(v4 + 168) = a1;
    uint64_t v5 = sub_D5AFC;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_D5AFC()
{
  uint64_t v1 = v0[3];
  sub_10E7B8();
  *(void *)(swift_task_alloc() + 16) = v1;
  sub_10EC58();
  swift_task_dealloc();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[22] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_D5BF4;
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[8];
  return PatternExecutionResult.generateFlow(manifest:measure:)(v4, v3);
}

uint64_t sub_D5BF4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)v1 + 168);
  uint64_t v3 = *(void *)(*(void *)v1 + 64);
  uint64_t v4 = *(void *)(*(void *)v1 + 56);
  uint64_t v5 = *(void *)(*(void *)v1 + 48);
  *(void *)(*(void *)v1 + 184) = a1;
  swift_task_dealloc();

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  return _swift_task_switch(sub_D5D6C, 0, 0);
}

uint64_t sub_D5D6C()
{
  (*(void (**)(void, void))(v0[16] + 8))(v0[17], v0[15]);
  uint64_t v1 = v0[23];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_D5E30()
{
  (*(void (**)(void, void))(v0[16] + 8))(v0[17], v0[15]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_D5EEC(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = sub_3DD4(&qword_13F908);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_13370(a2);
  uint64_t v6 = sub_10EAB8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
  return sub_10EC68();
}

uint64_t sub_D5FB8(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  sub_3DD4(&qword_142E00);
  v2[5] = swift_task_alloc();
  uint64_t v3 = sub_10FAA8();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  return _swift_task_switch(sub_D60B8, 0, 0);
}

uint64_t sub_D60B8()
{
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 56);
  sub_10FA68();
  sub_10FA58();
  sub_10FA48();
  swift_release();
  sub_1101E8();
  swift_release();
  sub_10FA98();
  char v5 = sub_10FA88();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v6(v2, v3);
  v6(v1, v3);
  if (qword_13F168 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_110778();
  sub_3E18(v7, (uint64_t)qword_142BF0);
  uint64_t v8 = sub_110768();
  os_log_type_t v9 = sub_1109F8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 67109120;
    *(_DWORD *)(v0 + 80) = v5 & 1;
    sub_110B28();
    _os_log_impl(&dword_0, v8, v9, "[ResultSetProvider.makeWindowingConfiguration] Using windowing configuration = %{BOOL}d", v10, 8u);
    swift_slowDealloc();
  }

  if (v5)
  {
    *(void *)(v0 + 16) = *(void *)(v0 + 32);
    sub_3DD4(&qword_140DE0);
    _s17ResultSetProviderCMa();
    sub_D7888(&qword_142E10, v11, (void (*)(uint64_t))_s17ResultSetProviderCMa);
    sub_10E4A8();
    sub_10EC38();
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 1;
  }
  uint64_t v13 = *(void *)(v0 + 24);
  uint64_t v14 = sub_3DD4(&qword_142E08);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, v12, 1, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

uint64_t sub_D639C(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return _swift_task_switch(sub_D63C0, 0, 0);
}

uint64_t sub_D63C0()
{
  unint64_t v1 = v0[3];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_110CD8();
    uint64_t v2 = result;
    if (result)
    {
LABEL_3:
      if (v2 < 1)
      {
        __break(1u);
        goto LABEL_38;
      }
      uint64_t v4 = 0;
      unint64_t v5 = v1 & 0xC000000000000001;
      uint64_t v6 = v0[3] + 32;
      do
      {
        if (v5) {
          id v7 = (id)sub_110C18();
        }
        else {
          id v7 = *(id *)(v6 + 8 * v4);
        }
        uint64_t v8 = v7;
        id v9 = [v7 sleepAlarmAttribute];

        if (v9)
        {
        }
        else
        {
          sub_110C58();
          sub_110C88();
          sub_110C98();
          sub_110C68();
        }
        ++v4;
      }
      while (v2 != v4);
      swift_bridgeObjectRelease();
      if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
        goto LABEL_29;
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
    goto LABEL_29;
  }
LABEL_16:
  if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0)
  {
LABEL_29:
    swift_retain();
    uint64_t result = sub_110CD8();
    uint64_t v10 = result;
    if (!result) {
      goto LABEL_30;
    }
    goto LABEL_18;
  }
  uint64_t v10 = _swiftEmptyArrayStorage[2];
  uint64_t result = swift_retain();
  if (v10)
  {
LABEL_18:
    if (v10 >= 1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000001) != 0) {
          id v12 = (id)sub_110C18();
        }
        else {
          id v12 = (id)_swiftEmptyArrayStorage[i + 4];
        }
        uint64_t v13 = v12;
        uint64_t v14 = sub_800B8(0, 0);

        if (v14)
        {
          sub_1108E8();
          if (*(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
            sub_110948();
          }
          sub_110958();
          sub_110928();
        }
      }
      goto LABEL_30;
    }
LABEL_38:
    __break(1u);
    return result;
  }
LABEL_30:
  swift_release();
  v0[5] = _swiftEmptyArrayStorage;
  swift_release();
  if ((unint64_t)_swiftEmptyArrayStorage >> 62)
  {
    swift_bridgeObjectRetain();
    sub_110CD8();
    swift_bridgeObjectRelease();
  }
  uint64_t v15 = sub_CE274();
  v0[6] = v15;
  if (qword_13F0C0 != -1) {
    swift_once();
  }
  uint64_t v16 = v0[4];
  uint64_t v17 = v0[2];
  char v24 = sub_10ED48();
  char v18 = sub_10ED28();
  char v19 = sub_10ED48();
  char v20 = sub_10ED38();
  char v21 = sub_10ECF8();
  uint64_t v22 = (void *)swift_task_alloc();
  v0[7] = v22;
  v22[2] = v17;
  v22[3] = v15;
  v22[4] = v16;
  uint64_t v23 = (void *)swift_task_alloc();
  v0[8] = v23;
  *uint64_t v23 = v0;
  v23[1] = sub_D6788;
  return sub_B07F0(1, (v24 & 1) == 0, v18 & 1, v19 & 1, v20 & 1, v21 & 1, (uint64_t)_swiftEmptyArrayStorage, (uint64_t)sub_D7340);
}

uint64_t sub_D6788(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 72) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    swift_task_dealloc();
    unint64_t v5 = sub_D6954;
  }
  else
  {
    *(void *)(v4 + 80) = a1;
    swift_task_dealloc();
    unint64_t v5 = sub_D68EC;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_D68EC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 80);
  return v1(v2);
}

uint64_t sub_D6954()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

double sub_D69B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_10FB68();
  uint64_t v7 = qword_13F180;
  swift_retain();
  if (v7 != -1) {
    swift_once();
  }
  swift_retain();
  uint64_t v8 = sub_10FB58();
  SuccessMultiParameters = (int *)type metadata accessor for SearchQuerySuccessMultiParameters(0);
  uint64_t v10 = SuccessMultiParameters[5];
  swift_release();
  *(void *)(a1 + v10) = v8;
  uint64_t v11 = sub_10ED18();
  uint64_t v12 = a1 + SuccessMultiParameters[17];
  *(double *)uint64_t v12 = (double)v11;
  *(unsigned char *)(v12 + 8) = 0;
  uint64_t v13 = SuccessMultiParameters[15];
  swift_release();
  *(void *)(a1 + v13) = a3;
  unint64_t v14 = *(void *)(a4 + 56);
  if (v14 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_110CD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = *(void *)((char *)&dword_10 + (v14 & 0xFFFFFFFFFFFFFF8));
  }
  double result = (double)v15;
  uint64_t v17 = a1 + SuccessMultiParameters[16];
  *(double *)uint64_t v17 = (double)v15;
  *(unsigned char *)(v17 + 8) = 0;
  return result;
}

uint64_t sub_D6AF0()
{
  _s20HandleIntentStrategyVwxx_1(v0 + 16);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t _s17ResultSetProviderCMa()
{
  return self;
}

uint64_t sub_D6B64()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_D6B70()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_D6BA4()
{
  uint64_t v1 = sub_10E5E8();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return sub_D700C(v2, v0, v1);
}

uint64_t sub_D6C28()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_61C8C;
  return sub_CE7E4();
}

uint64_t sub_D6CB8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_61C8C;
  return sub_CF168();
}

uint64_t sub_D6D48()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_61C8C;
  return sub_D1DC4();
}

uint64_t sub_D6DD8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_33C04;
  return sub_D5FB8(a1);
}

uint64_t sub_D6E74(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_61C8C;
  return sub_D5320(a1, v4);
}

uint64_t sub_D6F1C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_61C8C;
  return sub_D3E2C(a1, v4);
}

uint64_t sub_D6FC4(uint64_t a1, uint64_t a2)
{
  return sub_D7888(qword_142DC8, a2, (void (*)(uint64_t))_s17ResultSetProviderCMa);
}

uint64_t sub_D700C(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_D7020(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_D7040, 0, 0);
}

uint64_t sub_D7040()
{
  if (qword_13F168 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_110778();
  sub_3E18(v1, (uint64_t)qword_142BF0);
  uint64_t v2 = sub_110768();
  os_log_type_t v3 = sub_1109F8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "SearchAlarm.HandleIntentStrategy.makeIntentHandledResponse() called.", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = sub_110768();
  os_log_type_t v6 = sub_1109D8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "Alarms #response enabled – allowing ResultSet output to handle rendering", v7, 2u);
    swift_slowDealloc();
  }

  sub_10E868();
  sub_10E858();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_D71DC(uint64_t a1)
{
  os_log_type_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *os_log_type_t v3 = v1;
  v3[1] = sub_13024;
  v3[2] = a1;
  return _swift_task_switch(sub_D7040, 0, 0);
}

uint64_t sub_D7284(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_143370 + dword_143370);
  os_log_type_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *os_log_type_t v3 = v1;
  v3[1] = sub_13024;
  return v5(a1);
}

double sub_D7340(uint64_t a1)
{
  return sub_D69B8(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_D734C(uint64_t a1)
{
  return sub_D5EEC(a1, *(void *)(v1 + 16));
}

uint64_t sub_D7354()
{
  uint64_t v1 = sub_10ED58();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_D743C()
{
  uint64_t v2 = *(void *)(sub_10ED58() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_6197C;
  return sub_D5264(v4, v5, v6);
}

uint64_t sub_D7548()
{
  return sub_D3D50();
}

char *sub_D7550(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v36 = a4;
  uint64_t v37 = a5;
  uint64_t v34 = a2;
  uint64_t v35 = a3;
  uint64_t v8 = sub_3DD4(&qword_1401D8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_110538();
  uint64_t v30 = *(void *)(v38 - 8);
  uint64_t v11 = __chkstk_darwin(v38);
  unint64_t v33 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v29 = (char *)v27 - v13;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v14 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v14; uint64_t v14 = sub_110CD8())
  {
    v27[1] = v6;
    uint64_t v31 = (unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48);
    unint64_t v32 = a1 & 0xC000000000000001;
    uint64_t v15 = (void (**)(char *, char *, uint64_t))(v30 + 32);
    uint64_t v16 = (char *)_swiftEmptyArrayStorage;
    uint64_t v17 = 4;
    unint64_t v28 = a1;
    while (1)
    {
      uint64_t v6 = v17 - 4;
      id v18 = v32 ? (id)sub_110C18() : *(id *)(a1 + 8 * v17);
      char v19 = v18;
      uint64_t v20 = v17 - 3;
      if (__OFADD__(v6, 1)) {
        break;
      }
      sub_80D78(v34, v35, v36, v37, (uint64_t)v10);

      uint64_t v21 = v38;
      if ((*v31)(v10, 1, v38) == 1)
      {
        sub_1646C((uint64_t)v10, &qword_1401D8);
      }
      else
      {
        uint64_t v22 = *v15;
        uint64_t v23 = v29;
        (*v15)(v29, v10, v21);
        v22(v33, v23, v21);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v16 = (char *)sub_B7B64(0, *((void *)v16 + 2) + 1, 1, (unint64_t)v16);
        }
        unint64_t v25 = *((void *)v16 + 2);
        unint64_t v24 = *((void *)v16 + 3);
        if (v25 >= v24 >> 1) {
          uint64_t v16 = (char *)sub_B7B64(v24 > 1, v25 + 1, 1, (unint64_t)v16);
        }
        *((void *)v16 + 2) = v25 + 1;
        v22(&v16[((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80))+ *(void *)(v30 + 72) * v25], v33, v38);
        a1 = v28;
      }
      ++v17;
      if (v20 == v14)
      {
        swift_bridgeObjectRelease();
        return v16;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return (char *)_swiftEmptyArrayStorage;
}

uint64_t sub_D7880(uint64_t a1)
{
  return sub_D1CB0(a1, *(void **)(v1 + 16));
}

uint64_t sub_D7888(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *_s20HandleIntentStrategyVMa_3()
{
  return &_s20HandleIntentStrategyVN_2;
}

unint64_t sub_D78E4()
{
  unint64_t result = qword_142E68[0];
  if (!qword_142E68[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_142E68);
  }
  return result;
}

uint64_t sub_D793C(uint64_t a1)
{
  return sub_D796C(a1, &enum case for SiriTimeAppBundleId.clockApp(_:), &qword_1445A8, &qword_1445B0);
}

uint64_t sub_D7954(uint64_t a1)
{
  return sub_D796C(a1, (unsigned int *)&enum case for SiriTimeAppBundleId.alarmExtension(_:), &qword_1445B8, &qword_1445C0);
}

uint64_t sub_D796C(uint64_t a1, unsigned int *a2, uint64_t *a3, void *a4)
{
  uint64_t v7 = sub_10FD08();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *a2, v7);
  uint64_t v11 = sub_10FCF8();
  uint64_t v13 = v12;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  *a3 = v11;
  *a4 = v13;
  return result;
}

uint64_t sub_D7A78()
{
  if (qword_13F170 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_13F178;
  swift_bridgeObjectRetain();
  if (v0 != -1) {
    swift_once();
  }
  sub_1101C8();
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t result = sub_1101B8();
  qword_1445C8 = result;
  return result;
}

uint64_t type metadata accessor for DeleteAlarmCATs_Async()
{
  uint64_t result = qword_142EB0;
  if (!qword_142EB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_D7BC0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_D7C00(uint64_t a1, char a2, char a3, char a4)
{
  *(unsigned char *)(v5 + 58) = a4;
  *(unsigned char *)(v5 + 57) = a3;
  *(unsigned char *)(v5 + 56) = a2;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = v4;
  return _swift_task_switch(sub_D7C2C, 0, 0);
}

uint64_t sub_D7C2C()
{
  char v1 = *(unsigned char *)(v0 + 58);
  char v2 = *(unsigned char *)(v0 + 57);
  char v3 = *(unsigned char *)(v0 + 56);
  sub_3DD4(&qword_13FC38);
  uint64_t v4 = swift_allocObject();
  *(void *)(v0 + 32) = v4;
  *(_OWORD *)(v4 + 16) = xmmword_112980;
  *(void *)(v4 + 32) = 0xD000000000000010;
  *(void *)(v4 + 40) = 0x80000000001151C0;
  *(unsigned char *)(v4 + 48) = v3;
  *(void *)(v4 + 72) = &type metadata for Bool;
  strcpy((char *)(v4 + 80), "hasSleepAlarm");
  *(_WORD *)(v4 + 94) = -4864;
  *(unsigned char *)(v4 + 96) = v2;
  *(void *)(v4 + 120) = &type metadata for Bool;
  *(void *)(v4 + 128) = 0x68637461577369;
  *(void *)(v4 + 136) = 0xE700000000000000;
  *(void *)(v4 + 168) = &type metadata for Bool;
  *(unsigned char *)(v4 + 144) = v1;
  uint64_t v8 = (uint64_t (*)(uint64_t, unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:)
                                                                                    + async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_D7DB0;
  uint64_t v6 = *(void *)(v0 + 16);
  return v8(v6, 0xD000000000000037, 0x8000000000116F60, v4);
}

uint64_t sub_D7DB0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_C453C, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    char v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_D7EEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FC68();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3DD4((uint64_t *)&unk_13F780);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  sub_1C86C(a1, (uint64_t)v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = sub_10FB18();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_1C8D4(a1);
  return v11;
}

uint64_t sub_D8070()
{
  return type metadata accessor for DeleteAlarmCATs_Async();
}

uint64_t type metadata accessor for CreateAlarmCATs_Async()
{
  uint64_t result = qword_142F08;
  if (!qword_142F08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_D80C4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_D8104(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FC68();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3DD4((uint64_t *)&unk_13F780);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  sub_1C86C(a1, (uint64_t)v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = sub_10FB18();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_1C8D4(a1);
  return v11;
}

uint64_t sub_D8288()
{
  return type metadata accessor for CreateAlarmCATs_Async();
}

uint64_t sub_D8290()
{
  uint64_t v0 = sub_110778();
  sub_2D924(v0, qword_142F58);
  sub_3E18(v0, (uint64_t)qword_142F58);
  return sub_1104D8();
}

void *sub_D82DC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)v4 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_110088();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return v4;
}

uint64_t sub_D83E4(uint64_t a1, uint64_t a2)
{
  _s20HandleIntentStrategyVwxx_1(a1);
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_110088();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_D8458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_110088();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t *sub_D8508(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  sub_31D24(a1, a2);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_110088();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_D8588(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_110088();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_D860C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _s20HandleIntentStrategyVwxx_1(a1);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_110088();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_D869C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_D86B0);
}

uint64_t sub_D86B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_110088();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_D8760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_D8774);
}

uint64_t sub_D8774(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_110088();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t _s21ConfirmIntentStrategyVMa_0()
{
  uint64_t result = qword_142FE0;
  if (!qword_142FE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_D8868()
{
  uint64_t result = sub_110088();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_D8900()
{
  uint64_t v0 = sub_110778();
  sub_2D924(v0, qword_142F70);
  sub_3E18(v0, (uint64_t)qword_142F70);
  return sub_1104D8();
}

uint64_t sub_D894C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_3DD4(&qword_13F818);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_3DD4((uint64_t *)&unk_140770);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_13F190 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_110778();
  sub_3E18(v12, (uint64_t)qword_142F70);
  uint64_t v13 = sub_110768();
  os_log_type_t v14 = sub_1109F8();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_0, v13, v14, "DismissAlarm.ConfirmIntentStrategy.actionForInput() called.", v15, 2u);
    swift_slowDealloc();
  }

  uint64_t v16 = v3 + *(int *)(_s21ConfirmIntentStrategyVMa_0() + 20);
  uint64_t v17 = sub_110088();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v11, v16, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v11, 0, 1, v17);
  uint64_t v19 = enum case for DecideAction.PromptExpectation.confirmation(_:);
  uint64_t v20 = sub_10FEA8();
  uint64_t v21 = *(void *)(v20 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 104))(v8, v19, v20);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v8, 0, 1, v20);
  sub_55280(a1, v11, 0, (uint64_t)v8, a2);
  sub_1646C((uint64_t)v8, &qword_13F818);
  return sub_1646C((uint64_t)v11, (uint64_t *)&unk_140770);
}

uint64_t sub_D8C18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_3DD4((uint64_t *)&unk_13F7B0);
  v3[5] = swift_task_alloc();
  uint64_t v4 = sub_10EB78();
  v3[6] = v4;
  v3[7] = *(void *)(v4 - 8);
  v3[8] = swift_task_alloc();
  return _swift_task_switch(sub_D8D0C, 0, 0);
}

uint64_t sub_D8D0C()
{
  if (qword_13F190 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_110778();
  sub_3E18(v1, (uint64_t)qword_142F70);
  uint64_t v2 = sub_110768();
  os_log_type_t v3 = sub_1109F8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "In DismissAlarm.ConfirmIntentStrategy.parseConfirmationResponse().", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v6 = v0[7];
  uint64_t v5 = v0[8];
  uint64_t v7 = v0[5];
  uint64_t v8 = v0[6];
  uint64_t v9 = v0[3];

  sub_2B828(v9, v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v7, v5, v8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v7, 0, 1, v8);
  sub_3DD4(&qword_13FA78);
  sub_10EC18();
  sub_110368();
  sub_10EB48();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_D8EEC(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  sub_3DD4(&qword_13F908);
  v2[9] = swift_task_alloc();
  sub_3DD4(&qword_13FA88);
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  uint64_t v3 = sub_10EAF8();
  v2[12] = v3;
  v2[13] = *(void *)(v3 - 8);
  v2[14] = swift_task_alloc();
  sub_10E828();
  v2[15] = swift_task_alloc();
  uint64_t v4 = sub_10EC88();
  v2[16] = v4;
  v2[17] = *(void *)(v4 - 8);
  v2[18] = swift_task_alloc();
  uint64_t v5 = sub_110778();
  v2[19] = v5;
  v2[20] = *(void *)(v5 - 8);
  v2[21] = swift_task_alloc();
  uint64_t v6 = sub_10FD58();
  v2[22] = v6;
  v2[23] = *(void *)(v6 - 8);
  v2[24] = swift_task_alloc();
  uint64_t v7 = sub_10FD78();
  v2[25] = v7;
  v2[26] = *(void *)(v7 - 8);
  v2[27] = swift_task_alloc();
  uint64_t v8 = sub_10FDC8();
  v2[28] = v8;
  v2[29] = *(void *)(v8 - 8);
  v2[30] = swift_task_alloc();
  uint64_t v9 = sub_10EAB8();
  v2[31] = v9;
  v2[32] = *(void *)(v9 - 8);
  v2[33] = swift_task_alloc();
  uint64_t v10 = sub_1103B8();
  v2[34] = v10;
  v2[35] = *(void *)(v10 - 8);
  v2[36] = swift_task_alloc();
  return _swift_task_switch(sub_D92CC, 0, 0);
}

uint64_t sub_D92CC()
{
  uint64_t v1 = v0[36];
  uint64_t v2 = v0[33];
  uint64_t v4 = v0[29];
  uint64_t v3 = v0[30];
  uint64_t v5 = v0[28];
  (*(void (**)(uint64_t, void, void))(v0[35] + 104))(v1, enum case for AlarmNLv4Constants.AlarmVerb.disable(_:), v0[34]);
  sub_C946C(v1, v2);
  sub_10FDB8();
  LOBYTE(v1) = sub_10FDA8();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v1)
  {
    (*(void (**)(void, void, void))(v0[23] + 104))(v0[24], enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), v0[22]);
    if (qword_13F190 != -1) {
      swift_once();
    }
    uint64_t v7 = v0[20];
    uint64_t v6 = v0[21];
    uint64_t v8 = v0[19];
    uint64_t v9 = sub_3E18(v8, (uint64_t)qword_142F70);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
    mach_absolute_time();
    sub_10FD88();
    if (qword_13EFC8 != -1) {
      swift_once();
    }
    uint64_t v10 = v0[8];
    _s21ConfirmIntentStrategyVMa_0();
    sub_110088();
    char v11 = sub_10FF68();
    char v12 = sub_10FF68();
    uint64_t v13 = swift_task_alloc();
    v0[37] = v13;
    *(void *)(v13 + 16) = v10;
    os_log_type_t v14 = (void *)swift_task_alloc();
    v0[38] = v14;
    void *v14 = v0;
    v14[1] = sub_D97D4;
    return sub_DC138(v11 & 1, (v12 & 1) == 0, (uint64_t)sub_DAED8, v13);
  }
  else
  {
    if (qword_13EFC0 != -1) {
      swift_once();
    }
    _s21ConfirmIntentStrategyVMa_0();
    sub_110088();
    char v16 = sub_10FF68();
    char v17 = sub_10FF68();
    uint64_t v18 = sub_10FF78();
    if (v18 && (uint64_t v19 = (void *)v18, sub_1106A8(), v21 = v20, v19, v21))
    {
      uint64_t v22 = v0[11];
      sub_110878();
      swift_bridgeObjectRelease();
      uint64_t v23 = sub_10FBC8();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 0, 1, v23);
    }
    else
    {
      uint64_t v24 = v0[11];
      uint64_t v25 = sub_10FBC8();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v24, 1, 1, v25);
    }
    uint64_t v26 = sub_10FF78();
    if (v26 && (uint64_t v27 = (void *)v26, sub_1106B8(), v29 = v28, v27, v29))
    {
      uint64_t v30 = v0[10];
      sub_110878();
      swift_bridgeObjectRelease();
      uint64_t v31 = sub_10FBC8();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v30, 0, 1, v31);
    }
    else
    {
      uint64_t v32 = v0[10];
      uint64_t v33 = sub_10FBC8();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v32, 1, 1, v33);
    }
    uint64_t v34 = (void *)swift_task_alloc();
    v0[43] = v34;
    *uint64_t v34 = v0;
    v34[1] = sub_D9D04;
    uint64_t v35 = v0[14];
    uint64_t v37 = v0[10];
    uint64_t v36 = v0[11];
    return sub_EA568(v35, (v16 & 1) == 0, v17 & 1, v36, v37);
  }
}

uint64_t sub_D97D4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 312) = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_DA40C;
  }
  else
  {
    *(void *)(v4 + 320) = a1;
    uint64_t v5 = sub_D9920;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_D9920()
{
  uint64_t v1 = v0[33];
  sub_10E7C8();
  *(void *)(swift_task_alloc() + 16) = v1;
  sub_10EC58();
  swift_task_dealloc();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[41] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_D9A1C;
  uint64_t v3 = v0[27];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[7];
  return PatternExecutionResult.generatePatternOutput(manifest:measure:)(v5, v4, v3);
}

uint64_t sub_D9A1C()
{
  uint64_t v2 = *(void **)(*(void *)v1 + 320);
  uint64_t v3 = *(void *)(*(void *)v1 + 144);
  uint64_t v4 = *(void *)(*(void *)v1 + 136);
  uint64_t v5 = *(void *)(*(void *)v1 + 128);
  *(void *)(*(void *)v1 + 336) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);

  if (v0) {
    uint64_t v6 = sub_DA574;
  }
  else {
    uint64_t v6 = sub_D9BAC;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_D9BAC()
{
  uint64_t v2 = v0[35];
  uint64_t v1 = v0[36];
  uint64_t v4 = v0[33];
  uint64_t v3 = v0[34];
  uint64_t v5 = v0[31];
  uint64_t v6 = v0[32];
  (*(void (**)(void, void))(v0[26] + 8))(v0[27], v0[25]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_D9D04()
{
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = (void *)*v1;
  v2[44] = v0;
  swift_task_dealloc();
  uint64_t v4 = v2[11];
  uint64_t v5 = v2[10];
  if (v0)
  {
    sub_1646C(v5, &qword_13FA88);
    sub_1646C(v4, &qword_13FA88);
    return _swift_task_switch(sub_DA6D4, 0, 0);
  }
  else
  {
    sub_1646C(v5, &qword_13FA88);
    sub_1646C(v4, &qword_13FA88);
    uint64_t v9 = (uint64_t (*)(uint64_t))((char *)&dword_141D40 + dword_141D40);
    uint64_t v6 = (void *)swift_task_alloc();
    v2[45] = v6;
    *uint64_t v6 = v3;
    v6[1] = sub_D9F00;
    uint64_t v7 = v2[36];
    return v9(v7);
  }
}

uint64_t sub_D9F00(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 368) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_DA2A4;
  }
  else
  {
    *(void *)(v4 + 376) = a1;
    uint64_t v5 = sub_DA028;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_DA028()
{
  uint64_t v1 = *(void *)(v0 + 264);
  uint64_t v13 = *(void *)(v0 + 272);
  uint64_t v14 = *(void *)(v0 + 288);
  uint64_t v3 = *(void *)(v0 + 248);
  uint64_t v2 = *(void *)(v0 + 256);
  uint64_t v9 = *(void *)(v0 + 112);
  uint64_t v10 = *(void *)(v0 + 104);
  uint64_t v11 = *(void *)(v0 + 96);
  uint64_t v12 = *(void *)(v0 + 280);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v5 = *(uint64_t **)(v0 + 56);
  sub_17BD8(*(void **)(v0 + 64), *(void *)(*(void *)(v0 + 64) + 24));
  sub_10E788();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v4, v1, v3);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v4, 0, 1, v3);
  uint64_t v6 = sub_10EED8();
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  v5[3] = v6;
  v5[4] = (uint64_t)&protocol witness table for AceOutput;
  sub_31294(v5);
  sub_10E9A8();
  swift_bridgeObjectRelease();
  sub_1646C(v0 + 16, &qword_13F910);
  sub_1646C(v4, &qword_13F908);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v14, v13);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_DA2A4()
{
  uint64_t v2 = v0[35];
  uint64_t v1 = v0[36];
  uint64_t v3 = v0[34];
  uint64_t v4 = v0[32];
  (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(void, void))(v4 + 8))(v0[33], v0[31]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_DA40C()
{
  uint64_t v2 = v0[35];
  uint64_t v1 = v0[36];
  uint64_t v3 = v0[34];
  uint64_t v4 = v0[32];
  (*(void (**)(void, void))(v0[26] + 8))(v0[27], v0[25]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(void, void))(v4 + 8))(v0[33], v0[31]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_DA574()
{
  uint64_t v2 = v0[35];
  uint64_t v1 = v0[36];
  uint64_t v3 = v0[34];
  (*(void (**)(void, void))(v0[26] + 8))(v0[27], v0[25]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(void, void))(v0[32] + 8))(v0[33], v0[31]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_DA6D4()
{
  uint64_t v1 = v0[32];
  (*(void (**)(void, void))(v0[35] + 8))(v0[36], v0[34]);
  (*(void (**)(void, void))(v1 + 8))(v0[33], v0[31]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_DA81C(uint64_t a1)
{
  uint64_t v2 = sub_3DD4(&qword_13FA88);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v22 - v6;
  _s21ConfirmIntentStrategyVMa_0();
  sub_110088();
  uint64_t v8 = sub_10FF78();
  if (v8 && (uint64_t v9 = (void *)v8, sub_1106A8(), v11 = v10, v9, v11))
  {
    sub_110878();
    swift_bridgeObjectRelease();
    uint64_t v12 = sub_10FBC8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_10FBC8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 1, 1, v13);
  }
  sub_33F10((uint64_t)v7, a1);
  uint64_t v14 = sub_10FF78();
  if (v14 && (uint64_t v15 = (void *)v14, sub_1106B8(), v17 = v16, v15, v17))
  {
    sub_110878();
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_10FBC8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v5, 0, 1, v18);
  }
  else
  {
    uint64_t v19 = sub_10FBC8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v5, 1, 1, v19);
  }
  uint64_t v20 = type metadata accessor for StopConfirmationParameters(0);
  return sub_33F10((uint64_t)v5, a1 + *(int *)(v20 + 28));
}

uint64_t sub_DAA80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_3DD4(&qword_13F908);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10EC78();
  uint64_t v6 = sub_10EAB8();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  return sub_10EC68();
}

uint64_t sub_DAB8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_13024;
  return sub_D8C18(a1, a2, a3);
}

uint64_t sub_DAC3C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 32) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_DACE4;
  return sub_D8EEC(a1);
}

uint64_t sub_DACE4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_DAE18, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_DAE18()
{
  v0[3] = v0[5];
  sub_3DD4(&qword_13FA70);
  sub_10FF38();
  swift_willThrow();
  swift_errorRelease();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_DAED8(uint64_t a1)
{
  return sub_DA81C(a1);
}

uint64_t sub_DAEE0(uint64_t a1)
{
  return sub_DAA80(a1, *(void *)(v1 + 16));
}

void *sub_DAEE8()
{
  uint64_t v1 = v0;
  uint64_t v2 = _swiftEmptyArrayStorage;
  switch((unint64_t)[v0 period])
  {
    case 1uLL:
      uint64_t v2 = sub_B75F4(0, 1, 1, _swiftEmptyArrayStorage);
      unint64_t v4 = v2[2];
      unint64_t v3 = v2[3];
      if (v4 >= v3 >> 1) {
        uint64_t v2 = sub_B75F4((void *)(v3 > 1), v4 + 1, 1, v2);
      }
      v2[2] = v4 + 1;
      uint64_t v5 = &v2[2 * v4];
      unsigned int v6 = 1852993389;
      goto LABEL_8;
    case 2uLL:
      uint64_t v2 = sub_B75F4(0, 1, 1, _swiftEmptyArrayStorage);
      unint64_t v12 = v2[2];
      unint64_t v11 = v2[3];
      if (v12 >= v11 >> 1) {
        uint64_t v2 = sub_B75F4((void *)(v11 > 1), v12 + 1, 1, v2);
      }
      v2[2] = v12 + 1;
      uint64_t v13 = &v2[2 * v12];
      v13[4] = 0x6F6F6E7265746661;
      uint64_t v9 = v13 + 4;
      unint64_t v10 = 0xE90000000000006ELL;
      goto LABEL_15;
    case 3uLL:
      uint64_t v2 = sub_B75F4(0, 1, 1, _swiftEmptyArrayStorage);
      unint64_t v8 = v2[2];
      unint64_t v7 = v2[3];
      if (v8 >= v7 >> 1) {
        uint64_t v2 = sub_B75F4((void *)(v7 > 1), v8 + 1, 1, v2);
      }
      v2[2] = v8 + 1;
      uint64_t v5 = &v2[2 * v8];
      unsigned int v6 = 1852143205;
LABEL_8:
      v5[4] = v6 | 0x676E6900000000;
      uint64_t v9 = v5 + 4;
      unint64_t v10 = 0xE700000000000000;
      goto LABEL_15;
    case 8uLL:
      uint64_t v2 = sub_B75F4(0, 1, 1, _swiftEmptyArrayStorage);
      unint64_t v15 = v2[2];
      unint64_t v14 = v2[3];
      if (v15 >= v14 >> 1) {
        uint64_t v2 = sub_B75F4((void *)(v14 > 1), v15 + 1, 1, v2);
      }
      v2[2] = v15 + 1;
      uint64_t v16 = &v2[2 * v15];
      v16[4] = 0x776F72726F6D6F74;
      uint64_t v9 = v16 + 4;
      unint64_t v10 = 0xE800000000000000;
LABEL_15:
      v9[1] = v10;
      break;
    default:
      break;
  }
  uint64_t v17 = sub_33FD8();
  swift_release();
  if (v17)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_B75F4(0, v2[2] + 1, 1, v2);
    }
    unint64_t v19 = v2[2];
    unint64_t v18 = v2[3];
    if (v19 >= v18 >> 1) {
      uint64_t v2 = sub_B75F4((void *)(v18 > 1), v19 + 1, 1, v2);
    }
    v2[2] = v19 + 1;
    uint64_t v20 = &v2[2 * v19];
    v20[4] = 0xD000000000000011;
    v20[5] = 0x80000000001152A0;
  }
  id v21 = [v1 label];
  if (v21)
  {

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_B75F4(0, v2[2] + 1, 1, v2);
    }
    unint64_t v23 = v2[2];
    unint64_t v22 = v2[3];
    if (v23 >= v22 >> 1) {
      uint64_t v2 = sub_B75F4((void *)(v22 > 1), v23 + 1, 1, v2);
    }
    v2[2] = v23 + 1;
    uint64_t v24 = &v2[2 * v23];
    v24[4] = 0xD000000000000012;
    v24[5] = 0x8000000000115280;
  }
  uint64_t v25 = (char *)[v1 alarmReferenceType];
  if ((unint64_t)v25 >= 2)
  {
    if (v25 == (unsigned char *)&dword_0 + 3)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v2 = sub_B75F4(0, v2[2] + 1, 1, v2);
      }
      unint64_t v27 = v2[2];
      unint64_t v26 = v2[3];
      if (v27 >= v26 >> 1) {
        uint64_t v2 = sub_B75F4((void *)(v26 > 1), v27 + 1, 1, v2);
      }
      v2[2] = v27 + 1;
      uint64_t v28 = &v2[2 * v27];
      v28[4] = 7105633;
      uint64_t v29 = v28 + 4;
      unint64_t v30 = 0xE300000000000000;
    }
    else
    {
      if (v25 != (unsigned char *)&dword_0 + 2)
      {
        sub_110E18();
        __break(1u);
        JUMPOUT(0xDB5A8);
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v2 = sub_B75F4(0, v2[2] + 1, 1, v2);
      }
      unint64_t v32 = v2[2];
      unint64_t v31 = v2[3];
      if (v32 >= v31 >> 1) {
        uint64_t v2 = sub_B75F4((void *)(v31 > 1), v32 + 1, 1, v2);
      }
      v2[2] = v32 + 1;
      uint64_t v33 = &v2[2 * v32];
      v33[4] = 1954047342;
      uint64_t v29 = v33 + 4;
      unint64_t v30 = 0xE400000000000000;
    }
    v29[1] = v30;
  }
  id v34 = [v1 includeSleepAlarm];
  sub_12EE4();
  v35.super.super.Class isa = sub_110AC8(1).super.super.isa;
  Class isa = v35.super.super.isa;
  if (v34)
  {
    id v37 = v34;
    char v38 = sub_110AD8();

    if (v38)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v2 = sub_B75F4(0, v2[2] + 1, 1, v2);
      }
      unint64_t v40 = v2[2];
      unint64_t v39 = v2[3];
      if (v40 >= v39 >> 1) {
        uint64_t v2 = sub_B75F4((void *)(v39 > 1), v40 + 1, 1, v2);
      }
      v2[2] = v40 + 1;
      uint64_t v41 = &v2[2 * v40];
      v41[4] = 0x7065656C73;
      v41[5] = 0xE500000000000000;
    }
  }
  else
  {
  }
  uint64_t v42 = (char *)[v1 alarmSearchStatus];
  if (v42 == (unsigned char *)&dword_0 + 2)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_B75F4(0, v2[2] + 1, 1, v2);
    }
    unint64_t v49 = v2[2];
    unint64_t v48 = v2[3];
    if (v49 >= v48 >> 1) {
      uint64_t v2 = sub_B75F4((void *)(v48 > 1), v49 + 1, 1, v2);
    }
    v2[2] = v49 + 1;
    uint64_t v50 = &v2[2 * v49];
    v50[4] = 0x64656C6261736964;
    id v46 = v50 + 4;
    unint64_t v47 = 0xE800000000000000;
    goto LABEL_62;
  }
  if (v42 == (unsigned char *)&dword_0 + 1)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_B75F4(0, v2[2] + 1, 1, v2);
    }
    unint64_t v44 = v2[2];
    unint64_t v43 = v2[3];
    if (v44 >= v43 >> 1) {
      uint64_t v2 = sub_B75F4((void *)(v43 > 1), v44 + 1, 1, v2);
    }
    v2[2] = v44 + 1;
    char v45 = &v2[2 * v44];
    v45[4] = 0x64656C62616E65;
    id v46 = v45 + 4;
    unint64_t v47 = 0xE700000000000000;
LABEL_62:
    v46[1] = v47;
  }
  uint64_t v51 = swift_bridgeObjectRetain();
  id v52 = sub_DB5C8(v51);
  swift_bridgeObjectRelease_n();
  return v52;
}

void *sub_DB5C8(uint64_t a1)
{
  uint64_t v3 = sub_10FBC8();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unsigned int v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v7 = *(void *)(a1 + 16);
  unint64_t v8 = _swiftEmptyArrayStorage;
  if (v7)
  {
    v13[1] = v1;
    unint64_t v14 = _swiftEmptyArrayStorage;
    sub_CB5B4(0, v7, 0);
    unint64_t v8 = v14;
    uint64_t v9 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_110878();
      swift_bridgeObjectRelease();
      unint64_t v14 = v8;
      unint64_t v11 = v8[2];
      unint64_t v10 = v8[3];
      if (v11 >= v10 >> 1)
      {
        sub_CB5B4(v10 > 1, v11 + 1, 1);
        unint64_t v8 = v14;
      }
      v9 += 16;
      v8[2] = v11 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))((unint64_t)v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v11, v6, v3);
      --v7;
    }
    while (v7);
  }
  return v8;
}

uint64_t sub_DB76C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_DB7D0()
{
  uint64_t v0 = sub_110778();
  sub_2D924(v0, qword_143060);
  sub_3E18(v0, (uint64_t)qword_143060);
  return sub_1104D8();
}

char *sub_DB81C(uint64_t a1, int64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  BOOL v5 = *v3;
  int64_t v6 = *((void *)*v3 + 2);
  if (v6 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!result || v10 > *((void *)v5 + 3) >> 1)
  {
    if (v6 <= v10) {
      int64_t v13 = v6 + v9;
    }
    else {
      int64_t v13 = v6;
    }
    uint64_t result = sub_B79B8(result, v13, 1, v5);
    BOOL v5 = result;
  }
  unint64_t v14 = &v5[8 * a1 + 32];
  if (!v9) {
    goto LABEL_20;
  }
  uint64_t v15 = *((void *)v5 + 2);
  BOOL v16 = __OFSUB__(v15, a2);
  uint64_t v17 = v15 - a2;
  if (v16) {
    goto LABEL_26;
  }
  if ((v17 & 0x8000000000000000) == 0)
  {
    uint64_t result = v14 + 8;
    unint64_t v18 = &v5[8 * a2 + 32];
    if (v14 + 8 != v18 || result >= &v18[8 * v17]) {
      uint64_t result = (char *)memmove(result, v18, 8 * v17);
    }
    uint64_t v19 = *((void *)v5 + 2);
    BOOL v16 = __OFADD__(v19, v9);
    uint64_t v20 = v19 + v9;
    if (!v16)
    {
      *((void *)v5 + 2) = v20;
LABEL_20:
      *(void *)unint64_t v14 = a3;
      *uint64_t v3 = v5;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = (char *)sub_110D08();
  __break(1u);
  return result;
}

uint64_t sub_DB980(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = *(void *)(*a2 + 16);
  if (!v3)
  {
LABEL_7:
    sub_DB81C(*(void *)(*a2 + 16), *(void *)(*a2 + 16), a1);
    return v3;
  }
  uint64_t v4 = *(void *)(v2 + 32);
  if (v4 < a1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v2 + 40;
    while (v3 - 1 != v5)
    {
      uint64_t v4 = *(void *)(v6 + 8 * v5++);
      if (v4 >= a1) {
        goto LABEL_9;
      }
    }
    goto LABEL_7;
  }
  uint64_t v5 = 0;
LABEL_9:
  if (v5 >= v3)
  {
    __break(1u);
    JUMPOUT(0xDBA28);
  }
  if (v4 != a1) {
    sub_DB81C(v5, v5, a1);
  }
  return v5;
}

uint64_t sub_DBA44(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10E158();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for StopCATPatternsExecutor(uint64_t a1)
{
  return sub_19B4C(a1, (uint64_t *)&unk_143088);
}

uint64_t sub_DBAA8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_DBAE8()
{
  uint64_t v1 = sub_3DD4(&qword_13FA88);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v16 - v5;
  sub_3DD4(&qword_13FC38);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_111970;
  uint64_t v8 = (uint64_t *)(v7 + 48);
  *(void *)(v7 + 32) = 0x614E656369766564;
  *(void *)(v7 + 40) = 0xEA0000000000656DLL;
  sub_AFBC(v0, (uint64_t)v6, &qword_13FA88);
  uint64_t v9 = sub_10FBC8();
  uint64_t v10 = *(void *)(v9 - 8);
  unint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v6, 1, v9) == 1)
  {
    sub_1646C((uint64_t)v6, &qword_13FA88);
    *(_OWORD *)uint64_t v8 = 0u;
    *(_OWORD *)(v7 + 64) = 0u;
  }
  else
  {
    *(void *)(v7 + 72) = v9;
    unint64_t v12 = sub_31294(v8);
    (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 32))(v12, v6, v9);
  }
  *(void *)(v7 + 80) = 0x6E756D6D6F437369;
  *(void *)(v7 + 88) = 0xEA00000000006C61;
  int64_t v13 = (int *)type metadata accessor for StopConfirmationParameters(0);
  *(unsigned char *)(v7 + 96) = *(unsigned char *)(v0 + v13[5]);
  *(void *)(v7 + 120) = &type metadata for Bool;
  *(void *)(v7 + 128) = 0x6E6F737265507369;
  *(void *)(v7 + 136) = 0xEA00000000006C61;
  *(unsigned char *)(v7 + 144) = *(unsigned char *)(v0 + v13[6]);
  *(void *)(v7 + 168) = &type metadata for Bool;
  *(void *)(v7 + 176) = 0x656D614E6D6F6F72;
  *(void *)(v7 + 184) = 0xE800000000000000;
  sub_AFBC(v0 + v13[7], (uint64_t)v4, &qword_13FA88);
  if (v11(v4, 1, v9) == 1)
  {
    sub_1646C((uint64_t)v4, &qword_13FA88);
    *(_OWORD *)(v7 + 192) = 0u;
    *(_OWORD *)(v7 + 208) = 0u;
  }
  else
  {
    *(void *)(v7 + 216) = v9;
    unint64_t v14 = sub_31294((uint64_t *)(v7 + 192));
    (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 32))(v14, v4, v9);
  }
  return v7;
}

uint64_t sub_DBD84()
{
  uint64_t v1 = sub_3DD4(&qword_13FA88);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  unint64_t v23 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v23 - v5;
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v23 - v7;
  sub_3DD4(&qword_13FC38);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_111650;
  *(void *)(v9 + 32) = 0x6D72616C61;
  *(void *)(v9 + 40) = 0xE500000000000000;
  uint64_t v24 = v0;
  uint64_t v10 = *v0;
  if (*v0)
  {
    uint64_t v11 = type metadata accessor for AlarmAlarm(0);
    uint64_t v12 = v10;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v11 = 0;
    *(void *)(v9 + 56) = 0;
    *(void *)(v9 + 64) = 0;
  }
  *(void *)(v9 + 48) = v12;
  *(void *)(v9 + 72) = v11;
  *(void *)(v9 + 80) = 0x614E656369766564;
  *(void *)(v9 + 88) = 0xEA0000000000656DLL;
  int64_t v13 = (int *)type metadata accessor for StopIntentHandledElsewhereParameters(0);
  sub_AFBC((uint64_t)v24 + v13[5], (uint64_t)v8, &qword_13FA88);
  uint64_t v14 = sub_10FBC8();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v16(v8, 1, v14) == 1)
  {
    swift_retain();
    sub_1646C((uint64_t)v8, &qword_13FA88);
    *(_OWORD *)(v9 + 96) = 0u;
    *(_OWORD *)(v9 + 112) = 0u;
  }
  else
  {
    *(void *)(v9 + 120) = v14;
    uint64_t v17 = sub_31294((uint64_t *)(v9 + 96));
    (*(void (**)(uint64_t *, char *, uint64_t))(v15 + 32))(v17, v8, v14);
    swift_retain();
  }
  unint64_t v18 = v24;
  *(void *)(v9 + 128) = 0x7954676F6C616964;
  *(void *)(v9 + 136) = 0xEA00000000006570;
  sub_AFBC((uint64_t)v18 + v13[6], (uint64_t)v6, &qword_13FA88);
  if (v16(v6, 1, v14) == 1)
  {
    sub_1646C((uint64_t)v6, &qword_13FA88);
    *(_OWORD *)(v9 + 144) = 0u;
    *(_OWORD *)(v9 + 160) = 0u;
  }
  else
  {
    *(void *)(v9 + 168) = v14;
    uint64_t v19 = sub_31294((uint64_t *)(v9 + 144));
    (*(void (**)(uint64_t *, char *, uint64_t))(v15 + 32))(v19, v6, v14);
  }
  uint64_t v20 = (uint64_t)v23;
  *(void *)(v9 + 176) = 0x537373696D736964;
  *(void *)(v9 + 184) = 0xEF796C746E656C69;
  *(unsigned char *)(v9 + 192) = *((unsigned char *)v18 + v13[7]);
  *(void *)(v9 + 216) = &type metadata for Bool;
  *(void *)(v9 + 224) = 0x656D614E6D6F6F72;
  *(void *)(v9 + 232) = 0xE800000000000000;
  sub_AFBC((uint64_t)v18 + v13[8], v20, &qword_13FA88);
  if (v16((char *)v20, 1, v14) == 1)
  {
    sub_1646C(v20, &qword_13FA88);
    *(_OWORD *)(v9 + 240) = 0u;
    *(_OWORD *)(v9 + 256) = 0u;
  }
  else
  {
    *(void *)(v9 + 264) = v14;
    id v21 = sub_31294((uint64_t *)(v9 + 240));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v15 + 32))(v21, v20, v14);
  }
  return v9;
}

uint64_t sub_DC138(char a1, char a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v5 + 24) = a4;
  *(void *)(v5 + 32) = v4;
  *(void *)(v5 + 16) = a3;
  *(unsigned char *)(v5 + 89) = a2;
  *(unsigned char *)(v5 + 88) = a1;
  *(void *)(v5 + 40) = type metadata accessor for StopConfirmationParameters(0);
  *(void *)(v5 + 48) = swift_task_alloc();
  return _swift_task_switch(sub_DC1D8, 0, 0);
}

uint64_t sub_DC1D8()
{
  uint64_t v2 = *(int **)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = *(void (**)(uint64_t))(v0 + 16);
  char v4 = *(unsigned char *)(v0 + 89);
  char v5 = *(unsigned char *)(v0 + 88);
  uint64_t v6 = sub_10FBC8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v1, 1, 1, v6);
  v7(v1 + v2[7], 1, 1, v6);
  *(unsigned char *)(v1 + v2[5]) = v5;
  *(unsigned char *)(v1 + v2[6]) = v4;
  v3(v1);
  uint64_t v8 = sub_DBAE8();
  *(void *)(v0 + 56) = v8;
  uint64_t v11 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                            + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_DC358;
  return v11(0xD000000000000011, 0x80000000001170D0, v8);
}

uint64_t sub_DC358(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 72) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    char v5 = sub_DC52C;
  }
  else
  {
    *(void *)(v4 + 80) = a1;
    char v5 = sub_DC4A4;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_DC4A4()
{
  sub_DCC24(v0[6], type metadata accessor for StopConfirmationParameters);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[10];
  return v1(v2);
}

uint64_t sub_DC52C()
{
  sub_DCC24(*(void *)(v0 + 48), type metadata accessor for StopConfirmationParameters);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_DC5B0(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 16) = a2;
  *(unsigned char *)(v4 + 88) = a1;
  *(void *)(v4 + 40) = type metadata accessor for StopIntentHandledElsewhereParameters(0);
  *(void *)(v4 + 48) = swift_task_alloc();
  return _swift_task_switch(sub_DC64C, 0, 0);
}

uint64_t sub_DC64C()
{
  uint64_t v2 = *(int **)(v0 + 40);
  uint64_t v1 = *(char **)(v0 + 48);
  uint64_t v3 = *(void (**)(char *))(v0 + 16);
  char v4 = *(unsigned char *)(v0 + 88);
  char v5 = &v1[v2[5]];
  uint64_t v6 = sub_10FBC8();
  uint64_t v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v5, 1, 1, v6);
  v7(&v1[v2[6]], 1, 1, v6);
  v7(&v1[v2[8]], 1, 1, v6);
  *(void *)uint64_t v1 = 0;
  v1[v2[7]] = v4;
  v3(v1);
  uint64_t v8 = sub_DBD84();
  *(void *)(v0 + 56) = v8;
  uint64_t v11 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                            + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_DC7EC;
  return v11(0xD00000000000001BLL, 0x80000000001170B0, v8);
}

uint64_t sub_DC7EC(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 72) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    char v5 = sub_DC9C0;
  }
  else
  {
    *(void *)(v4 + 80) = a1;
    char v5 = sub_DC938;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_DC938()
{
  sub_DCC24(v0[6], type metadata accessor for StopIntentHandledElsewhereParameters);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[10];
  return v1(v2);
}

uint64_t sub_DC9C0()
{
  sub_DCC24(*(void *)(v0 + 48), type metadata accessor for StopIntentHandledElsewhereParameters);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_DCA44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FC68();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3DD4((uint64_t *)&unk_13F780);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  sub_AFBC(a1, (uint64_t)v10, (uint64_t *)&unk_13F780);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = sub_10FB18();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_1646C(a1, (uint64_t *)&unk_13F780);
  return v11;
}

uint64_t sub_DCBDC()
{
  return type metadata accessor for StopCATPatternsExecutor(0);
}

uint64_t type metadata accessor for StopIntentHandledElsewhereParameters(uint64_t a1)
{
  return sub_19B4C(a1, qword_1431D8);
}

uint64_t type metadata accessor for StopConfirmationParameters(uint64_t a1)
{
  return sub_19B4C(a1, qword_143140);
}

uint64_t sub_DCC24(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_DCC84(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10FBC8();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48);
    if (v9(a2, 1, v7))
    {
      uint64_t v10 = sub_3DD4(&qword_13FA88);
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v12 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    *((unsigned char *)a1 + v12) = *((unsigned char *)a2 + v12);
    uint64_t v13 = a3[7];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    if (v9((uint64_t *)v15, 1, v7))
    {
      uint64_t v16 = sub_3DD4(&qword_13FA88);
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v14, v15, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v14, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_DCEA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FBC8();
  uint64_t v9 = *(void *)(v4 - 8);
  int v5 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (!v5(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v4);
  }
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v5)(v6, 1, v4);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v6, v4);
  }
  return result;
}

char *sub_DCFD4(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_10FBC8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    uint64_t v9 = sub_3DD4(&qword_13FA88);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  a1[v10] = a2[v10];
  uint64_t v11 = a3[7];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  if (v8(v13, 1, v6))
  {
    uint64_t v14 = sub_3DD4(&qword_13FA88);
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v12, v13, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);
  }
  return a1;
}

char *sub_DD1A8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_10FBC8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = sub_3DD4(&qword_13FA88);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  a1[a3[5]] = a2[a3[5]];
  a1[a3[6]] = a2[a3[6]];
  uint64_t v12 = a3[7];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  int v15 = v8(&a1[v12], 1, v6);
  int v16 = v8(v14, 1, v6);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(v13, v14, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    uint64_t v17 = sub_3DD4(&qword_13FA88);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v14, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
  return a1;
}

char *sub_DD43C(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_10FBC8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    uint64_t v9 = sub_3DD4(&qword_13FA88);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  a1[v10] = a2[v10];
  uint64_t v11 = a3[7];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  if (v8(v13, 1, v6))
  {
    uint64_t v14 = sub_3DD4(&qword_13FA88);
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v13, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);
  }
  return a1;
}

char *sub_DD610(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_10FBC8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = sub_3DD4(&qword_13FA88);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  a1[v12] = a2[v12];
  uint64_t v13 = a3[7];
  uint64_t v14 = &a1[v13];
  int v15 = &a2[v13];
  int v16 = v8(&a1[v13], 1, v6);
  int v17 = v8(v15, 1, v6);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(v14, v15, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v14, v6);
    goto LABEL_12;
  }
  if (v17)
  {
LABEL_12:
    uint64_t v18 = sub_3DD4(&qword_13FA88);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v14, v15, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v14, 0, 1, v6);
  return a1;
}

uint64_t sub_DD8A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_DD8B4);
}

uint64_t sub_DD8B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_3DD4(&qword_13FA88);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 2) {
      return ((v10 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_DD988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_DD99C);
}

uint64_t sub_DD99C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_3DD4(&qword_13FA88);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  }
  return result;
}

void sub_DDA5C()
{
  sub_37BC4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void *sub_DDAF4(void *a1, char *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *(void *)a2;
  *a1 = *(void *)a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    unsigned int v10 = &a2[v8];
    uint64_t v11 = sub_10FBC8();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_retain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = sub_3DD4(&qword_13FA88);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v15 = a3[6];
    int v16 = (char *)v7 + v15;
    int v17 = &a2[v15];
    if (v13(&a2[v15], 1, v11))
    {
      uint64_t v18 = sub_3DD4(&qword_13FA88);
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v16, v17, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v16, 0, 1, v11);
    }
    uint64_t v19 = a3[8];
    *((unsigned char *)v7 + a3[7]) = a2[a3[7]];
    uint64_t v20 = (char *)v7 + v19;
    id v21 = &a2[v19];
    if (v13(v21, 1, v11))
    {
      uint64_t v22 = sub_3DD4(&qword_13FA88);
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v20, v21, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v20, 0, 1, v11);
    }
  }
  return v7;
}

uint64_t sub_DDDC8(uint64_t a1, int *a2)
{
  swift_release();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_10FBC8();
  uint64_t v11 = *(void *)(v5 - 8);
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (!v6(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + a2[6];
  if (!v6(v7, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v7, v5);
  }
  uint64_t v8 = a1 + a2[8];
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(v8, 1, v5);
  if (!result)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
    return v10(v8, v5);
  }
  return result;
}

void *sub_DDF30(void *a1, char *a2, int *a3)
{
  *a1 = *(void *)a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_10FBC8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_retain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = sub_3DD4(&qword_13FA88);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    uint64_t v16 = sub_3DD4(&qword_13FA88);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v14, v15, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  uint64_t v17 = a3[8];
  *((unsigned char *)a1 + a3[7]) = a2[a3[7]];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = &a2[v17];
  if (v11(v19, 1, v9))
  {
    uint64_t v20 = sub_3DD4(&qword_13FA88);
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v18, v19, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v18, 0, 1, v9);
  }
  return a1;
}

char *sub_DE1A4(char *a1, void *a2, int *a3)
{
  *(void *)a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_10FBC8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = sub_3DD4(&qword_13FA88);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = (char *)a2 + v15;
  int v18 = v11(&a1[v15], 1, v9);
  int v19 = v11(v17, 1, v9);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v17, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
LABEL_12:
    uint64_t v20 = sub_3DD4(&qword_13FA88);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v16, v17, v9);
LABEL_13:
  a1[a3[7]] = *((unsigned char *)a2 + a3[7]);
  uint64_t v21 = a3[8];
  uint64_t v22 = &a1[v21];
  unint64_t v23 = (char *)a2 + v21;
  int v24 = v11(&a1[v21], 1, v9);
  int v25 = v11(v23, 1, v9);
  if (!v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v22, v23, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v22, v9);
    goto LABEL_18;
  }
  if (v25)
  {
LABEL_18:
    uint64_t v26 = sub_3DD4(&qword_13FA88);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v22, v23, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v22, 0, 1, v9);
  return a1;
}

void *sub_DE540(void *a1, char *a2, int *a3)
{
  *a1 = *(void *)a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_10FBC8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = sub_3DD4(&qword_13FA88);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    uint64_t v16 = sub_3DD4(&qword_13FA88);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v14, v15, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  uint64_t v17 = a3[8];
  *((unsigned char *)a1 + a3[7]) = a2[a3[7]];
  int v18 = (char *)a1 + v17;
  int v19 = &a2[v17];
  if (v11(v19, 1, v9))
  {
    uint64_t v20 = sub_3DD4(&qword_13FA88);
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v18, v19, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v18, 0, 1, v9);
  }
  return a1;
}

char *sub_DE7AC(char *a1, void *a2, int *a3)
{
  *(void *)a1 = *a2;
  swift_release();
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_10FBC8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = sub_3DD4(&qword_13FA88);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = (char *)a2 + v15;
  int v18 = v11(&a1[v15], 1, v9);
  int v19 = v11(v17, 1, v9);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v16, v17, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
LABEL_12:
    uint64_t v20 = sub_3DD4(&qword_13FA88);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v16, v17, v9);
LABEL_13:
  uint64_t v21 = a3[8];
  a1[a3[7]] = *((unsigned char *)a2 + a3[7]);
  uint64_t v22 = &a1[v21];
  unint64_t v23 = (char *)a2 + v21;
  int v24 = v11(&a1[v21], 1, v9);
  int v25 = v11(v23, 1, v9);
  if (!v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v22, v23, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v22, v9);
    goto LABEL_18;
  }
  if (v25)
  {
LABEL_18:
    uint64_t v26 = sub_3DD4(&qword_13FA88);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v22, v23, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v22, 0, 1, v9);
  return a1;
}

uint64_t sub_DEB3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_DEB50);
}

uint64_t sub_DEB50(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_3DD4(&qword_13FA88);
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    int v12 = (char *)a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_DEC10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_DEC24);
}

void *sub_DEC24(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_3DD4(&qword_13FA88);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_DECD0()
{
  sub_37BC4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t type metadata accessor for ChangeAlarmStatusCATPatternsExecutor()
{
  uint64_t result = qword_143220;
  if (!qword_143220) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_DEDC0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_DEE00(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  return _swift_task_switch(sub_DEE24, 0, 0);
}

uint64_t sub_DEE24()
{
  v0[2] = 0;
  uint64_t v1 = (void (*)(void *))v0[5];
  v0[3] = 0;
  v0[4] = 0;
  v1(v0 + 2);
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  v0[8] = v2;
  v0[9] = v3;
  uint64_t v4 = v0[4];
  sub_3DD4(&qword_13FC38);
  uint64_t v5 = swift_allocObject();
  v0[10] = v5;
  *(_OWORD *)(v5 + 16) = xmmword_112980;
  *(void *)(v5 + 32) = 0x6D72616C61;
  *(void *)(v5 + 40) = 0xE500000000000000;
  if (v2)
  {
    uint64_t v6 = type metadata accessor for AlarmAlarm(0);
    uint64_t v7 = v2;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    *(void *)(v5 + 56) = 0;
    *(void *)(v5 + 64) = 0;
  }
  *(void *)(v5 + 48) = v7;
  *(void *)(v5 + 72) = v6;
  *(void *)(v5 + 80) = 7368801;
  *(void *)(v5 + 88) = 0xE300000000000000;
  if (v3)
  {
    uint64_t v8 = sub_10FB68();
    uint64_t v9 = v3;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0;
    *(void *)(v5 + 104) = 0;
    *(void *)(v5 + 112) = 0;
  }
  *(void *)(v5 + 96) = v9;
  *(void *)(v5 + 120) = v8;
  *(void *)(v5 + 128) = 0x616C417065656C73;
  *(void *)(v5 + 136) = 0xEA00000000006D72;
  uint64_t v10 = 0;
  if (v4)
  {
    uint64_t v10 = type metadata accessor for AlarmAlarm(0);
  }
  else
  {
    *(void *)(v5 + 152) = 0;
    *(void *)(v5 + 160) = 0;
  }
  v0[11] = v4;
  *(void *)(v5 + 144) = v4;
  *(void *)(v5 + 168) = v10;
  int v13 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                            + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v11 = (void *)swift_task_alloc();
  v0[12] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_B4464;
  return v13(0xD000000000000020, 0x80000000001171B0, v5);
}

uint64_t sub_DF018(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 48) = a1;
  return _swift_task_switch(sub_DF03C, 0, 0);
}

uint64_t sub_DF03C()
{
  char v1 = *(unsigned char *)(v0 + 48);
  sub_3DD4(&qword_13FC38);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 32) = 0xD000000000000010;
  *(void *)(v2 + 40) = 0x80000000001151C0;
  *(void *)(v2 + 72) = &type metadata for Bool;
  *(unsigned char *)(v2 + 48) = v1;
  uint64_t v5 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                           + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  *(void *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_1117A0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_DF164;
  return v5(0xD00000000000003BLL, 0x8000000000117170, v2);
}

uint64_t sub_DF164(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return _swift_task_switch(sub_E0FE0, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t sub_DF2BC(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 48) = a1;
  return _swift_task_switch(sub_DF2E0, 0, 0);
}

uint64_t sub_DF2E0()
{
  char v1 = *(unsigned char *)(v0 + 48);
  sub_3DD4(&qword_13FC38);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 32) = 0xD000000000000010;
  *(void *)(v2 + 40) = 0x80000000001151C0;
  *(void *)(v2 + 72) = &type metadata for Bool;
  *(unsigned char *)(v2 + 48) = v1;
  uint64_t v5 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                           + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  *(void *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_1117A0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_DF408;
  return v5(0xD00000000000003ALL, 0x8000000000117130, v2);
}

uint64_t sub_DF408(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return _swift_task_switch(sub_DF560, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t sub_DF560()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_DF5C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FC68();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3DD4((uint64_t *)&unk_13F780);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  sub_1C86C(a1, (uint64_t)v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = sub_10FB18();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_1C8D4(a1);
  return v11;
}

uint64_t sub_DF748()
{
  return type metadata accessor for ChangeAlarmStatusCATPatternsExecutor();
}

uint64_t sub_DF750(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_DF770, 0, 0);
}

uint64_t sub_DF770()
{
  uint64_t v1 = sub_10FB68();
  if (qword_13F180 != -1) {
    swift_once();
  }
  swift_retain();
  uint64_t v2 = sub_10FB58();
  v0[4] = v2;
  uint64_t v3 = sub_800B8(0, 0);
  sub_3DD4(&qword_13FC38);
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = (void *)v4;
  v0[5] = v4;
  *(_OWORD *)(v4 + 16) = xmmword_112980;
  *(void *)(v4 + 32) = 0x6D72616C61;
  *(void *)(v4 + 40) = 0xE500000000000000;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  *(void *)(v4 + 80) = 7368801;
  *(void *)(v4 + 88) = 0xE300000000000000;
  if (v2)
  {
    uint64_t v6 = v2;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v1 = 0;
    *(void *)(v4 + 104) = 0;
    *(void *)(v4 + 112) = 0;
  }
  *(void *)(v4 + 96) = v6;
  *(void *)(v4 + 120) = v1;
  *(void *)(v4 + 128) = 0x616C417065656C73;
  *(void *)(v4 + 136) = 0xEA00000000006D72;
  uint64_t v7 = 0;
  if (v3)
  {
    uint64_t v7 = type metadata accessor for AlarmAlarm(0);
  }
  else
  {
    v5[19] = 0;
    v5[20] = 0;
  }
  v0[6] = v3;
  v5[18] = v3;
  v5[21] = v7;
  uint64_t v10 = (char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
      + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:);
  swift_retain();
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[7] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_DF978;
  return ((uint64_t (*)(unint64_t, unint64_t, void *))v10)(0xD000000000000025, 0x80000000001171E0, v5);
}

uint64_t sub_DF978(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 64) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = sub_DFB38;
  }
  else
  {
    *(void *)(v4 + 72) = a1;
    uint64_t v5 = sub_DFAC4;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_DFAC4()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 72);
  return v1(v2);
}

uint64_t sub_DFB38()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_DFBA8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_DFBC8, 0, 0);
}

uint64_t sub_DFBC8()
{
  uint64_t v1 = sub_800B8(0, 0);
  v0[4] = v1;
  uint64_t v2 = sub_10FB68();
  if (qword_13F180 != -1) {
    swift_once();
  }
  swift_retain();
  uint64_t v3 = sub_10FB58();
  v0[5] = v3;
  sub_3DD4(&qword_13FC38);
  uint64_t v4 = swift_allocObject();
  v0[6] = v4;
  *(_OWORD *)(v4 + 16) = xmmword_112980;
  *(void *)(v4 + 32) = 0x6D72616C61;
  *(void *)(v4 + 40) = 0xE500000000000000;
  if (v1)
  {
    uint64_t v5 = type metadata accessor for AlarmAlarm(0);
    uint64_t v6 = v1;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
    *(void *)(v4 + 56) = 0;
    *(void *)(v4 + 64) = 0;
  }
  *(void *)(v4 + 48) = v6;
  *(void *)(v4 + 72) = v5;
  *(void *)(v4 + 80) = 7368801;
  *(void *)(v4 + 88) = 0xE300000000000000;
  if (!v3)
  {
    uint64_t v2 = 0;
    *(void *)(v4 + 104) = 0;
    *(void *)(v4 + 112) = 0;
  }
  *(void *)(v4 + 96) = v3;
  *(void *)(v4 + 120) = v2;
  *(void *)(v4 + 128) = 0x616C417065656C73;
  *(void *)(v4 + 136) = 0xEA00000000006D72;
  *(_OWORD *)(v4 + 144) = 0u;
  *(_OWORD *)(v4 + 160) = 0u;
  uint64_t v9 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                           + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  swift_retain();
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[7] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_7E0E0;
  return v9(0xD000000000000020, 0x80000000001171B0, v4);
}

uint64_t sub_DFDC4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_DFDE4, 0, 0);
}

uint64_t sub_DFDE4()
{
  uint64_t v1 = sub_10FB68();
  if (qword_13F180 != -1) {
    swift_once();
  }
  swift_retain();
  uint64_t v2 = sub_10FB58();
  v0[4] = v2;
  uint64_t v3 = sub_800B8(0, 0);
  sub_3DD4(&qword_13FC38);
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = (void *)v4;
  v0[5] = v4;
  *(_OWORD *)(v4 + 16) = xmmword_112980;
  *(void *)(v4 + 32) = 0x6D72616C61;
  *(void *)(v4 + 40) = 0xE500000000000000;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  *(void *)(v4 + 80) = 7368801;
  *(void *)(v4 + 88) = 0xE300000000000000;
  if (v2)
  {
    uint64_t v6 = v2;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v1 = 0;
    *(void *)(v4 + 104) = 0;
    *(void *)(v4 + 112) = 0;
  }
  *(void *)(v4 + 96) = v6;
  *(void *)(v4 + 120) = v1;
  *(void *)(v4 + 128) = 0x616C417065656C73;
  *(void *)(v4 + 136) = 0xEA00000000006D72;
  uint64_t v7 = 0;
  if (v3)
  {
    uint64_t v7 = type metadata accessor for AlarmAlarm(0);
  }
  else
  {
    v5[19] = 0;
    v5[20] = 0;
  }
  v0[6] = v3;
  v5[18] = v3;
  v5[21] = v7;
  uint64_t v10 = (char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
      + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:);
  swift_retain();
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[7] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_DFFEC;
  return ((uint64_t (*)(unint64_t, unint64_t, void *))v10)(0xD000000000000026, 0x8000000000117210, v5);
}

uint64_t sub_DFFEC(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 64) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = sub_E0FD4;
  }
  else
  {
    *(void *)(v4 + 72) = a1;
    uint64_t v5 = sub_E0FD0;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_E0138(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_E0158, 0, 0);
}

uint64_t sub_E0158()
{
  uint64_t v1 = sub_800B8(0, 0);
  v0[4] = v1;
  uint64_t v2 = sub_10FB68();
  if (qword_13F180 != -1) {
    swift_once();
  }
  swift_retain();
  uint64_t v3 = sub_10FB58();
  v0[5] = v3;
  sub_3DD4(&qword_13FC38);
  uint64_t v4 = swift_allocObject();
  v0[6] = v4;
  *(_OWORD *)(v4 + 16) = xmmword_112980;
  *(void *)(v4 + 32) = 0x6D72616C61;
  *(void *)(v4 + 40) = 0xE500000000000000;
  if (v1)
  {
    uint64_t v5 = type metadata accessor for AlarmAlarm(0);
    uint64_t v6 = v1;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
    *(void *)(v4 + 56) = 0;
    *(void *)(v4 + 64) = 0;
  }
  *(void *)(v4 + 48) = v6;
  *(void *)(v4 + 72) = v5;
  *(void *)(v4 + 80) = 7368801;
  *(void *)(v4 + 88) = 0xE300000000000000;
  if (!v3)
  {
    uint64_t v2 = 0;
    *(void *)(v4 + 104) = 0;
    *(void *)(v4 + 112) = 0;
  }
  *(void *)(v4 + 96) = v3;
  *(void *)(v4 + 120) = v2;
  *(void *)(v4 + 128) = 0x616C417065656C73;
  *(void *)(v4 + 136) = 0xEA00000000006D72;
  *(_OWORD *)(v4 + 144) = 0u;
  *(_OWORD *)(v4 + 160) = 0u;
  uint64_t v9 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                           + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  swift_retain();
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[7] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_E0354;
  return v9(0xD000000000000021, 0x8000000000117240, v4);
}

uint64_t sub_E0354(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 64) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = sub_E0FE8;
  }
  else
  {
    *(void *)(v4 + 72) = a1;
    uint64_t v5 = sub_E0FE4;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_E04A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return _swift_task_switch(sub_E04C4, 0, 0);
}

uint64_t sub_E04C4()
{
  uint64_t v1 = v0[3];
  swift_retain();
  uint64_t v2 = sub_800B8(0, 0);
  sub_3DD4(&qword_13FC38);
  uint64_t v3 = swift_allocObject();
  v0[5] = v3;
  *(_OWORD *)(v3 + 16) = xmmword_112980;
  *(void *)(v3 + 32) = 0x6D72616C61;
  *(void *)(v3 + 40) = 0xE500000000000000;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(void *)(v3 + 80) = 7368801;
  *(void *)(v3 + 88) = 0xE300000000000000;
  if (v1)
  {
    uint64_t v4 = sub_10FB68();
    uint64_t v5 = v1;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v4 = 0;
    *(void *)(v3 + 104) = 0;
    *(void *)(v3 + 112) = 0;
  }
  *(void *)(v3 + 96) = v5;
  *(void *)(v3 + 120) = v4;
  *(void *)(v3 + 128) = 0x616C417065656C73;
  *(void *)(v3 + 136) = 0xEA00000000006D72;
  uint64_t v6 = 0;
  if (v2)
  {
    uint64_t v6 = type metadata accessor for AlarmAlarm(0);
  }
  else
  {
    *(void *)(v3 + 152) = 0;
    *(void *)(v3 + 160) = 0;
  }
  v0[6] = v2;
  *(void *)(v3 + 144) = v2;
  *(void *)(v3 + 168) = v6;
  uint64_t v9 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                           + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  swift_retain();
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[7] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_E0680;
  return v9(0xD000000000000025, 0x80000000001171E0, v3);
}

uint64_t sub_E0680(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 64) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = sub_E0840;
  }
  else
  {
    *(void *)(v4 + 72) = a1;
    uint64_t v5 = sub_E07CC;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_E07CC()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 72);
  return v1(v2);
}

uint64_t sub_E0840()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_E08B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return _swift_task_switch(sub_E08D4, 0, 0);
}

uint64_t sub_E08D4()
{
  uint64_t v1 = v0[3];
  swift_retain();
  uint64_t v2 = sub_800B8(0, 0);
  sub_3DD4(&qword_13FC38);
  uint64_t v3 = swift_allocObject();
  v0[5] = v3;
  *(_OWORD *)(v3 + 16) = xmmword_112980;
  *(void *)(v3 + 32) = 0x6D72616C61;
  *(void *)(v3 + 40) = 0xE500000000000000;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(void *)(v3 + 80) = 7368801;
  *(void *)(v3 + 88) = 0xE300000000000000;
  if (v1)
  {
    uint64_t v4 = sub_10FB68();
    uint64_t v5 = v1;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v4 = 0;
    *(void *)(v3 + 104) = 0;
    *(void *)(v3 + 112) = 0;
  }
  *(void *)(v3 + 96) = v5;
  *(void *)(v3 + 120) = v4;
  *(void *)(v3 + 128) = 0x616C417065656C73;
  *(void *)(v3 + 136) = 0xEA00000000006D72;
  uint64_t v6 = 0;
  if (v2)
  {
    uint64_t v6 = type metadata accessor for AlarmAlarm(0);
  }
  else
  {
    *(void *)(v3 + 152) = 0;
    *(void *)(v3 + 160) = 0;
  }
  v0[6] = v2;
  *(void *)(v3 + 144) = v2;
  *(void *)(v3 + 168) = v6;
  uint64_t v9 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                           + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  swift_retain();
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[7] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_E0A90;
  return v9(0xD000000000000026, 0x8000000000117210, v3);
}

uint64_t sub_E0A90(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 64) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = sub_E0FDC;
  }
  else
  {
    *(void *)(v4 + 72) = a1;
    uint64_t v5 = sub_E0FD8;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_E0BDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return _swift_task_switch(sub_E0C00, 0, 0);
}

uint64_t sub_E0C00()
{
  uint64_t v1 = sub_800B8(0, 0);
  v0[5] = v1;
  sub_3DD4(&qword_13FC38);
  uint64_t v2 = swift_allocObject();
  v0[6] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_112980;
  *(void *)(v2 + 32) = 0x6D72616C61;
  *(void *)(v2 + 40) = 0xE500000000000000;
  if (v1)
  {
    uint64_t v3 = type metadata accessor for AlarmAlarm(0);
    uint64_t v4 = v1;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
    *(void *)(v2 + 56) = 0;
    *(void *)(v2 + 64) = 0;
  }
  uint64_t v5 = v0[4];
  *(void *)(v2 + 48) = v4;
  *(void *)(v2 + 72) = v3;
  *(void *)(v2 + 80) = 7368801;
  *(void *)(v2 + 88) = 0xE300000000000000;
  uint64_t v6 = 0;
  if (v5)
  {
    uint64_t v6 = sub_10FB68();
  }
  else
  {
    *(void *)(v2 + 104) = 0;
    *(void *)(v2 + 112) = 0;
  }
  *(void *)(v2 + 96) = v5;
  *(void *)(v2 + 120) = v6;
  *(void *)(v2 + 128) = 0x616C417065656C73;
  *(void *)(v2 + 136) = 0xEA00000000006D72;
  *(_OWORD *)(v2 + 144) = 0u;
  *(_OWORD *)(v2 + 160) = 0u;
  uint64_t v9 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                           + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  swift_retain();
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[7] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_E0DB8;
  return v9(0xD000000000000021, 0x8000000000117240, v2);
}

uint64_t sub_E0DB8(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 64) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = sub_E0F6C;
  }
  else
  {
    *(void *)(v4 + 72) = a1;
    uint64_t v5 = sub_E0F04;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_E0F04()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 72);
  return v1(v2);
}

uint64_t sub_E0F6C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id SIRINLUUserDialogAct.alarmSearch.getter()
{
  if (sub_110A38())
  {
    id v0 = sub_35F94();
    swift_release();
    return v0;
  }
  else
  {
    if (qword_13F1A0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_110778();
    sub_3E18(v2, (uint64_t)qword_1432C0);
    uint64_t v3 = sub_110768();
    os_log_type_t v4 = sub_1109E8();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_0, v3, v4, "No task found in userDialogAct.", v5, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
}

uint64_t sub_E10EC()
{
  uint64_t v0 = sub_110778();
  sub_2D924(v0, qword_1432C0);
  sub_3E18(v0, (uint64_t)qword_1432C0);
  return sub_1104D8();
}

uint64_t sub_E1138(uint64_t a1)
{
  return sub_E11A0(a1, (void (*)(void))type metadata accessor for CreateAlarmCATsSimple, (uint64_t (*)(char *, void))&CATWrapperSimple.__allocating_init(options:globals:), &qword_144610);
}

uint64_t sub_E116C(uint64_t a1)
{
  return sub_E11A0(a1, (void (*)(void))type metadata accessor for CreateAlarmCATPatternsExecutor, (uint64_t (*)(char *, void))&CATWrapper.__allocating_init(options:globals:), &qword_144618);
}

uint64_t sub_E11A0(uint64_t a1, void (*a2)(void), uint64_t (*a3)(char *, void), uint64_t *a4)
{
  uint64_t v7 = sub_10FC68();
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2(0);
  sub_10FC48();
  uint64_t result = a3(v9, 0);
  *a4 = result;
  return result;
}

ValueMetadata *_s20HandleIntentStrategyVMa_4()
{
  return &_s20HandleIntentStrategyVN_3;
}

uint64_t sub_E1254(uint64_t a1)
{
  v1[10] = a1;
  uint64_t v2 = sub_10EAB8();
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  uint64_t v3 = sub_10E828();
  v1[14] = v3;
  v1[15] = *(void *)(v3 - 8);
  v1[16] = swift_task_alloc();
  sub_10FC68();
  v1[17] = swift_task_alloc();
  uint64_t v4 = sub_110778();
  v1[18] = v4;
  v1[19] = *(void *)(v4 - 8);
  v1[20] = swift_task_alloc();
  uint64_t v5 = sub_10FD58();
  v1[21] = v5;
  v1[22] = *(void *)(v5 - 8);
  v1[23] = swift_task_alloc();
  uint64_t v6 = sub_10FD78();
  v1[24] = v6;
  v1[25] = *(void *)(v6 - 8);
  v1[26] = swift_task_alloc();
  return _swift_task_switch(sub_E14B0, 0, 0);
}

uint64_t sub_E14B0()
{
  (*(void (**)(void, void, void))(v0[22] + 104))(v0[23], enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), v0[21]);
  if (qword_13F158 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[19];
  uint64_t v1 = v0[20];
  uint64_t v3 = v0[18];
  uint64_t v4 = sub_3E18(v3, (uint64_t)qword_142B38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  mach_absolute_time();
  sub_10FD88();
  type metadata accessor for AlarmBaseCATPatternsExecutor(0);
  sub_10FC48();
  v0[27] = sub_10FB38();
  uint64_t v7 = (char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
     + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[28] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_E1654;
  return ((uint64_t (*)(unint64_t, unint64_t, void *))v7)(0xD000000000000016, 0x8000000000117270, _swiftEmptyArrayStorage);
}

uint64_t sub_E1654(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 232) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_EA3CC;
  }
  else
  {
    *(void *)(v4 + 240) = a1;
    swift_release();
    uint64_t v5 = sub_E1784;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_E1784()
{
  sub_10E7E8();
  sub_10EAA8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[31] = v1;
  void *v1 = v0;
  v1[1] = sub_E1844;
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[10];
  return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)(v5, v3, v4, v2, 0);
}

uint64_t sub_E1844()
{
  uint64_t v2 = *(void **)(*(void *)v1 + 240);
  uint64_t v3 = *(void *)(*(void *)v1 + 128);
  uint64_t v4 = *(void *)(*(void *)v1 + 120);
  uint64_t v5 = *(void *)(*(void *)v1 + 112);
  uint64_t v6 = *(void *)(*(void *)v1 + 104);
  uint64_t v7 = *(void *)(*(void *)v1 + 96);
  uint64_t v8 = *(void *)(*(void *)v1 + 88);
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v0) {
    uint64_t v9 = sub_EA3C8;
  }
  else {
    uint64_t v9 = sub_E1A30;
  }
  return _swift_task_switch(v9, 0, 0);
}

uint64_t sub_E1A30()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t)(v0 + 2);
  uint64_t v3 = v0[25];
  uint64_t v4 = v0[26];
  uint64_t v5 = v0[24];
  uint64_t v6 = sub_1101A8();
  v0[5] = v6;
  v0[6] = (uint64_t)&protocol witness table for ABCReport;
  uint64_t v7 = sub_31294(v0 + 2);
  v0[9] = sub_110368();
  sub_3DD4((uint64_t *)&unk_140910);
  *uint64_t v7 = sub_110858();
  v7[1] = v8;
  uint64_t v9 = enum case for UnhandledAbortSubtype.generic(_:);
  uint64_t v10 = sub_1100D8();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104))(v7, v9, v10);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v6 - 8) + 104))(v7, enum case for ABCReport.unhandledAbort(_:), v6);
  sub_10FF28();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  _s20HandleIntentStrategyVwxx_1(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v1[1];
  return v11();
}

uint64_t sub_E1C00(uint64_t a1)
{
  v1[10] = a1;
  uint64_t v2 = sub_10EAB8();
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  uint64_t v3 = sub_10E828();
  v1[14] = v3;
  v1[15] = *(void *)(v3 - 8);
  v1[16] = swift_task_alloc();
  sub_10FC68();
  v1[17] = swift_task_alloc();
  uint64_t v4 = sub_110778();
  v1[18] = v4;
  v1[19] = *(void *)(v4 - 8);
  v1[20] = swift_task_alloc();
  uint64_t v5 = sub_10FD58();
  v1[21] = v5;
  v1[22] = *(void *)(v5 - 8);
  v1[23] = swift_task_alloc();
  uint64_t v6 = sub_10FD78();
  v1[24] = v6;
  v1[25] = *(void *)(v6 - 8);
  v1[26] = swift_task_alloc();
  return _swift_task_switch(sub_E1E5C, 0, 0);
}

uint64_t sub_E1E5C()
{
  (*(void (**)(void, void, void))(v0[22] + 104))(v0[23], enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), v0[21]);
  if (qword_13F158 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[19];
  uint64_t v1 = v0[20];
  uint64_t v3 = v0[18];
  uint64_t v4 = sub_3E18(v3, (uint64_t)qword_142B38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  mach_absolute_time();
  sub_10FD88();
  type metadata accessor for AlarmBaseCATPatternsExecutor(0);
  sub_10FC48();
  v0[27] = sub_10FB38();
  uint64_t v7 = (char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
     + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[28] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_E2000;
  return ((uint64_t (*)(unint64_t, unint64_t, void *))v7)(0xD000000000000016, 0x8000000000117270, _swiftEmptyArrayStorage);
}

uint64_t sub_E2000(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 232) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_EA3CC;
  }
  else
  {
    *(void *)(v4 + 240) = a1;
    swift_release();
    uint64_t v5 = sub_E2130;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_E2130()
{
  sub_10E7E8();
  sub_10EAA8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[31] = v1;
  void *v1 = v0;
  v1[1] = sub_E21F0;
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[10];
  return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)(v5, v3, v4, v2, 0);
}

uint64_t sub_E21F0()
{
  uint64_t v2 = *(void **)(*(void *)v1 + 240);
  uint64_t v3 = *(void *)(*(void *)v1 + 128);
  uint64_t v4 = *(void *)(*(void *)v1 + 120);
  uint64_t v5 = *(void *)(*(void *)v1 + 112);
  uint64_t v6 = *(void *)(*(void *)v1 + 104);
  uint64_t v7 = *(void *)(*(void *)v1 + 96);
  uint64_t v8 = *(void *)(*(void *)v1 + 88);
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v0) {
    uint64_t v9 = sub_EA3C8;
  }
  else {
    uint64_t v9 = sub_E23DC;
  }
  return _swift_task_switch(v9, 0, 0);
}

uint64_t sub_E23DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t)(v0 + 2);
  uint64_t v3 = v0[25];
  uint64_t v4 = v0[26];
  uint64_t v5 = v0[24];
  uint64_t v6 = sub_1101A8();
  v0[5] = v6;
  v0[6] = (uint64_t)&protocol witness table for ABCReport;
  uint64_t v7 = sub_31294(v0 + 2);
  v0[9] = sub_110328();
  sub_3DD4((uint64_t *)&unk_1408D8);
  *uint64_t v7 = sub_110858();
  v7[1] = v8;
  uint64_t v9 = enum case for UnhandledAbortSubtype.generic(_:);
  uint64_t v10 = sub_1100D8();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104))(v7, v9, v10);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v6 - 8) + 104))(v7, enum case for ABCReport.unhandledAbort(_:), v6);
  sub_10FF28();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  _s20HandleIntentStrategyVwxx_1(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v1[1];
  return v11();
}

uint64_t sub_E25AC(uint64_t a1)
{
  v1[10] = a1;
  uint64_t v2 = sub_10EAB8();
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  uint64_t v3 = sub_10E828();
  v1[14] = v3;
  v1[15] = *(void *)(v3 - 8);
  v1[16] = swift_task_alloc();
  sub_10FC68();
  v1[17] = swift_task_alloc();
  uint64_t v4 = sub_110778();
  v1[18] = v4;
  v1[19] = *(void *)(v4 - 8);
  v1[20] = swift_task_alloc();
  uint64_t v5 = sub_10FD58();
  v1[21] = v5;
  v1[22] = *(void *)(v5 - 8);
  v1[23] = swift_task_alloc();
  uint64_t v6 = sub_10FD78();
  v1[24] = v6;
  v1[25] = *(void *)(v6 - 8);
  v1[26] = swift_task_alloc();
  return _swift_task_switch(sub_E2808, 0, 0);
}

uint64_t sub_E2808()
{
  (*(void (**)(void, void, void))(v0[22] + 104))(v0[23], enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), v0[21]);
  if (qword_13F158 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[19];
  uint64_t v1 = v0[20];
  uint64_t v3 = v0[18];
  uint64_t v4 = sub_3E18(v3, (uint64_t)qword_142B38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  mach_absolute_time();
  sub_10FD88();
  type metadata accessor for AlarmBaseCATPatternsExecutor(0);
  sub_10FC48();
  v0[27] = sub_10FB38();
  uint64_t v7 = (char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
     + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[28] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_E29AC;
  return ((uint64_t (*)(unint64_t, unint64_t, void *))v7)(0xD000000000000016, 0x8000000000117270, _swiftEmptyArrayStorage);
}

uint64_t sub_E29AC(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 232) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_EA3CC;
  }
  else
  {
    *(void *)(v4 + 240) = a1;
    swift_release();
    uint64_t v5 = sub_E2ADC;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_E2ADC()
{
  sub_10E7E8();
  sub_10EAA8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[31] = v1;
  void *v1 = v0;
  v1[1] = sub_E2B9C;
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[10];
  return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)(v5, v3, v4, v2, 0);
}

uint64_t sub_E2B9C()
{
  uint64_t v2 = *(void **)(*(void *)v1 + 240);
  uint64_t v3 = *(void *)(*(void *)v1 + 128);
  uint64_t v4 = *(void *)(*(void *)v1 + 120);
  uint64_t v5 = *(void *)(*(void *)v1 + 112);
  uint64_t v6 = *(void *)(*(void *)v1 + 104);
  uint64_t v7 = *(void *)(*(void *)v1 + 96);
  uint64_t v8 = *(void *)(*(void *)v1 + 88);
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v0) {
    uint64_t v9 = sub_EA3C8;
  }
  else {
    uint64_t v9 = sub_E2D88;
  }
  return _swift_task_switch(v9, 0, 0);
}

uint64_t sub_E2D88()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t)(v0 + 2);
  uint64_t v3 = v0[25];
  uint64_t v4 = v0[26];
  uint64_t v5 = v0[24];
  uint64_t v6 = sub_1101A8();
  v0[5] = v6;
  v0[6] = (uint64_t)&protocol witness table for ABCReport;
  uint64_t v7 = sub_31294(v0 + 2);
  v0[9] = sub_110258();
  sub_3DD4(&qword_140900);
  *uint64_t v7 = sub_110858();
  v7[1] = v8;
  uint64_t v9 = enum case for UnhandledAbortSubtype.generic(_:);
  uint64_t v10 = sub_1100D8();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104))(v7, v9, v10);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v6 - 8) + 104))(v7, enum case for ABCReport.unhandledAbort(_:), v6);
  sub_10FF28();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  _s20HandleIntentStrategyVwxx_1(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v1[1];
  return v11();
}

uint64_t sub_E2F58(uint64_t a1)
{
  v1[10] = a1;
  uint64_t v2 = sub_10EAB8();
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  uint64_t v3 = sub_10E828();
  v1[14] = v3;
  v1[15] = *(void *)(v3 - 8);
  v1[16] = swift_task_alloc();
  sub_10FC68();
  v1[17] = swift_task_alloc();
  uint64_t v4 = sub_110778();
  v1[18] = v4;
  v1[19] = *(void *)(v4 - 8);
  v1[20] = swift_task_alloc();
  uint64_t v5 = sub_10FD58();
  v1[21] = v5;
  v1[22] = *(void *)(v5 - 8);
  v1[23] = swift_task_alloc();
  uint64_t v6 = sub_10FD78();
  v1[24] = v6;
  v1[25] = *(void *)(v6 - 8);
  v1[26] = swift_task_alloc();
  return _swift_task_switch(sub_E31B4, 0, 0);
}

uint64_t sub_E31B4()
{
  (*(void (**)(void, void, void))(v0[22] + 104))(v0[23], enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), v0[21]);
  if (qword_13F158 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[19];
  uint64_t v1 = v0[20];
  uint64_t v3 = v0[18];
  uint64_t v4 = sub_3E18(v3, (uint64_t)qword_142B38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  mach_absolute_time();
  sub_10FD88();
  type metadata accessor for AlarmBaseCATPatternsExecutor(0);
  sub_10FC48();
  v0[27] = sub_10FB38();
  uint64_t v7 = (char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
     + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[28] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_E3358;
  return ((uint64_t (*)(unint64_t, unint64_t, void *))v7)(0xD000000000000016, 0x8000000000117270, _swiftEmptyArrayStorage);
}

uint64_t sub_E3358(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 232) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_E3734;
  }
  else
  {
    *(void *)(v4 + 240) = a1;
    swift_release();
    uint64_t v5 = sub_E3488;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_E3488()
{
  sub_10E7E8();
  sub_10EAA8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[31] = v1;
  void *v1 = v0;
  v1[1] = sub_E3548;
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[10];
  return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)(v5, v3, v4, v2, 0);
}

uint64_t sub_E3548()
{
  uint64_t v2 = *(void **)(*(void *)v1 + 240);
  uint64_t v3 = *(void *)(*(void *)v1 + 128);
  uint64_t v4 = *(void *)(*(void *)v1 + 120);
  uint64_t v5 = *(void *)(*(void *)v1 + 112);
  uint64_t v6 = *(void *)(*(void *)v1 + 104);
  uint64_t v7 = *(void *)(*(void *)v1 + 96);
  uint64_t v8 = *(void *)(*(void *)v1 + 88);
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v0) {
    uint64_t v9 = sub_E3A4C;
  }
  else {
    uint64_t v9 = sub_E387C;
  }
  return _swift_task_switch(v9, 0, 0);
}

uint64_t sub_E3734()
{
  swift_release();
  uint64_t v2 = v0[25];
  uint64_t v1 = v0[26];
  uint64_t v3 = v0[24];
  v0[8] = v0[29];
  sub_3DD4(&qword_13FA70);
  sub_10FF38();
  swift_willThrow();
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_E387C()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t)(v0 + 2);
  uint64_t v3 = v0[25];
  uint64_t v4 = v0[26];
  uint64_t v5 = v0[24];
  uint64_t v6 = sub_1101A8();
  v0[5] = v6;
  v0[6] = (uint64_t)&protocol witness table for ABCReport;
  uint64_t v7 = sub_31294(v0 + 2);
  v0[9] = sub_1101F8();
  sub_3DD4(&qword_143358);
  *uint64_t v7 = sub_110858();
  v7[1] = v8;
  uint64_t v9 = enum case for UnhandledAbortSubtype.generic(_:);
  uint64_t v10 = sub_1100D8();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104))(v7, v9, v10);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v6 - 8) + 104))(v7, enum case for ABCReport.unhandledAbort(_:), v6);
  sub_10FF28();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  _s20HandleIntentStrategyVwxx_1(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v1[1];
  return v11();
}

uint64_t sub_E3A4C()
{
  uint64_t v2 = v0[25];
  uint64_t v1 = v0[26];
  uint64_t v3 = v0[24];
  v0[8] = v0[32];
  sub_3DD4(&qword_13FA70);
  sub_10FF38();
  swift_willThrow();
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_E3B8C(uint64_t a1)
{
  v1[10] = a1;
  uint64_t v2 = sub_10EAB8();
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  uint64_t v3 = sub_10E828();
  v1[14] = v3;
  v1[15] = *(void *)(v3 - 8);
  v1[16] = swift_task_alloc();
  sub_10FC68();
  v1[17] = swift_task_alloc();
  uint64_t v4 = sub_110778();
  v1[18] = v4;
  v1[19] = *(void *)(v4 - 8);
  v1[20] = swift_task_alloc();
  uint64_t v5 = sub_10FD58();
  v1[21] = v5;
  v1[22] = *(void *)(v5 - 8);
  v1[23] = swift_task_alloc();
  uint64_t v6 = sub_10FD78();
  v1[24] = v6;
  v1[25] = *(void *)(v6 - 8);
  v1[26] = swift_task_alloc();
  return _swift_task_switch(sub_E3DE8, 0, 0);
}

uint64_t sub_E3DE8()
{
  (*(void (**)(void, void, void))(v0[22] + 104))(v0[23], enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), v0[21]);
  if (qword_13F158 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[19];
  uint64_t v1 = v0[20];
  uint64_t v3 = v0[18];
  uint64_t v4 = sub_3E18(v3, (uint64_t)qword_142B38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  mach_absolute_time();
  sub_10FD88();
  type metadata accessor for AlarmBaseCATPatternsExecutor(0);
  sub_10FC48();
  v0[27] = sub_10FB38();
  uint64_t v7 = (char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
     + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[28] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_E3F8C;
  return ((uint64_t (*)(unint64_t, unint64_t, void *))v7)(0xD000000000000016, 0x8000000000117270, _swiftEmptyArrayStorage);
}

uint64_t sub_E3F8C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 232) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_EA3CC;
  }
  else
  {
    *(void *)(v4 + 240) = a1;
    swift_release();
    uint64_t v5 = sub_E40BC;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_E40BC()
{
  sub_10E7E8();
  sub_10EAA8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[31] = v1;
  void *v1 = v0;
  v1[1] = sub_E417C;
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[10];
  return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)(v5, v3, v4, v2, 0);
}

uint64_t sub_E417C()
{
  uint64_t v2 = *(void **)(*(void *)v1 + 240);
  uint64_t v3 = *(void *)(*(void *)v1 + 128);
  uint64_t v4 = *(void *)(*(void *)v1 + 120);
  uint64_t v5 = *(void *)(*(void *)v1 + 112);
  uint64_t v6 = *(void *)(*(void *)v1 + 104);
  uint64_t v7 = *(void *)(*(void *)v1 + 96);
  uint64_t v8 = *(void *)(*(void *)v1 + 88);
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v0) {
    uint64_t v9 = sub_EA3C8;
  }
  else {
    uint64_t v9 = sub_E4368;
  }
  return _swift_task_switch(v9, 0, 0);
}

uint64_t sub_E4368()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t)(v0 + 2);
  uint64_t v3 = v0[25];
  uint64_t v4 = v0[26];
  uint64_t v5 = v0[24];
  uint64_t v6 = sub_1101A8();
  v0[5] = v6;
  v0[6] = (uint64_t)&protocol witness table for ABCReport;
  uint64_t v7 = sub_31294(v0 + 2);
  v0[9] = sub_1102C8();
  sub_3DD4(&qword_143378);
  *uint64_t v7 = sub_110858();
  v7[1] = v8;
  uint64_t v9 = enum case for UnhandledAbortSubtype.generic(_:);
  uint64_t v10 = sub_1100D8();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104))(v7, v9, v10);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v6 - 8) + 104))(v7, enum case for ABCReport.unhandledAbort(_:), v6);
  sub_10FF28();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  _s20HandleIntentStrategyVwxx_1(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v1[1];
  return v11();
}

uint64_t sub_E4538(uint64_t a1)
{
  v1[10] = a1;
  uint64_t v2 = sub_10EAB8();
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  uint64_t v3 = sub_10E828();
  v1[14] = v3;
  v1[15] = *(void *)(v3 - 8);
  v1[16] = swift_task_alloc();
  sub_10FC68();
  v1[17] = swift_task_alloc();
  uint64_t v4 = sub_110778();
  v1[18] = v4;
  v1[19] = *(void *)(v4 - 8);
  v1[20] = swift_task_alloc();
  uint64_t v5 = sub_10FD58();
  v1[21] = v5;
  v1[22] = *(void *)(v5 - 8);
  v1[23] = swift_task_alloc();
  uint64_t v6 = sub_10FD78();
  v1[24] = v6;
  v1[25] = *(void *)(v6 - 8);
  v1[26] = swift_task_alloc();
  return _swift_task_switch(sub_E4794, 0, 0);
}

uint64_t sub_E4794()
{
  (*(void (**)(void, void, void))(v0[22] + 104))(v0[23], enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), v0[21]);
  if (qword_13F158 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[19];
  uint64_t v1 = v0[20];
  uint64_t v3 = v0[18];
  uint64_t v4 = sub_3E18(v3, (uint64_t)qword_142B38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  mach_absolute_time();
  sub_10FD88();
  type metadata accessor for AlarmBaseCATPatternsExecutor(0);
  sub_10FC48();
  v0[27] = sub_10FB38();
  uint64_t v7 = (char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
     + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[28] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_E4938;
  return ((uint64_t (*)(unint64_t, unint64_t, void *))v7)(0xD000000000000016, 0x8000000000117270, _swiftEmptyArrayStorage);
}

uint64_t sub_E4938(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 232) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_EA3CC;
  }
  else
  {
    *(void *)(v4 + 240) = a1;
    swift_release();
    uint64_t v5 = sub_E4A68;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_E4A68()
{
  sub_10E7E8();
  sub_10EAA8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[31] = v1;
  void *v1 = v0;
  v1[1] = sub_E4B28;
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[10];
  return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)(v5, v3, v4, v2, 0);
}

uint64_t sub_E4B28()
{
  uint64_t v2 = *(void **)(*(void *)v1 + 240);
  uint64_t v3 = *(void *)(*(void *)v1 + 128);
  uint64_t v4 = *(void *)(*(void *)v1 + 120);
  uint64_t v5 = *(void *)(*(void *)v1 + 112);
  uint64_t v6 = *(void *)(*(void *)v1 + 104);
  uint64_t v7 = *(void *)(*(void *)v1 + 96);
  uint64_t v8 = *(void *)(*(void *)v1 + 88);
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v0) {
    uint64_t v9 = sub_EA3C8;
  }
  else {
    uint64_t v9 = sub_E4D14;
  }
  return _swift_task_switch(v9, 0, 0);
}

uint64_t sub_E4D14()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t)(v0 + 2);
  uint64_t v3 = v0[25];
  uint64_t v4 = v0[26];
  uint64_t v5 = v0[24];
  uint64_t v6 = sub_1101A8();
  v0[5] = v6;
  v0[6] = (uint64_t)&protocol witness table for ABCReport;
  uint64_t v7 = sub_31294(v0 + 2);
  v0[9] = sub_110298();
  sub_3DD4(&qword_1408E8);
  *uint64_t v7 = sub_110858();
  v7[1] = v8;
  uint64_t v9 = enum case for UnhandledAbortSubtype.generic(_:);
  uint64_t v10 = sub_1100D8();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104))(v7, v9, v10);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v6 - 8) + 104))(v7, enum case for ABCReport.unhandledAbort(_:), v6);
  sub_10FF28();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  _s20HandleIntentStrategyVwxx_1(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v1[1];
  return v11();
}

uint64_t sub_E4EE4(uint64_t a1)
{
  v1[10] = a1;
  uint64_t v2 = sub_10EAB8();
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  uint64_t v3 = sub_10E828();
  v1[14] = v3;
  v1[15] = *(void *)(v3 - 8);
  v1[16] = swift_task_alloc();
  sub_10FC68();
  v1[17] = swift_task_alloc();
  uint64_t v4 = sub_110778();
  v1[18] = v4;
  v1[19] = *(void *)(v4 - 8);
  v1[20] = swift_task_alloc();
  uint64_t v5 = sub_10FD58();
  v1[21] = v5;
  v1[22] = *(void *)(v5 - 8);
  v1[23] = swift_task_alloc();
  uint64_t v6 = sub_10FD78();
  v1[24] = v6;
  v1[25] = *(void *)(v6 - 8);
  v1[26] = swift_task_alloc();
  return _swift_task_switch(sub_E5140, 0, 0);
}

uint64_t sub_E5140()
{
  (*(void (**)(void, void, void))(v0[22] + 104))(v0[23], enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), v0[21]);
  if (qword_13F158 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[19];
  uint64_t v1 = v0[20];
  uint64_t v3 = v0[18];
  uint64_t v4 = sub_3E18(v3, (uint64_t)qword_142B38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  mach_absolute_time();
  sub_10FD88();
  type metadata accessor for AlarmBaseCATPatternsExecutor(0);
  sub_10FC48();
  v0[27] = sub_10FB38();
  uint64_t v7 = (char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
     + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[28] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_E52E4;
  return ((uint64_t (*)(unint64_t, unint64_t, void *))v7)(0xD000000000000016, 0x8000000000117270, _swiftEmptyArrayStorage);
}

uint64_t sub_E52E4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 232) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_EA3CC;
  }
  else
  {
    *(void *)(v4 + 240) = a1;
    swift_release();
    uint64_t v5 = sub_E5414;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_E5414()
{
  sub_10E7E8();
  sub_10EAA8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[31] = v1;
  void *v1 = v0;
  v1[1] = sub_E54D4;
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[10];
  return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)(v5, v3, v4, v2, 0);
}

uint64_t sub_E54D4()
{
  uint64_t v2 = *(void **)(*(void *)v1 + 240);
  uint64_t v3 = *(void *)(*(void *)v1 + 128);
  uint64_t v4 = *(void *)(*(void *)v1 + 120);
  uint64_t v5 = *(void *)(*(void *)v1 + 112);
  uint64_t v6 = *(void *)(*(void *)v1 + 104);
  uint64_t v7 = *(void *)(*(void *)v1 + 96);
  uint64_t v8 = *(void *)(*(void *)v1 + 88);
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v0) {
    uint64_t v9 = sub_EA3C8;
  }
  else {
    uint64_t v9 = sub_E56C0;
  }
  return _swift_task_switch(v9, 0, 0);
}

uint64_t sub_E56C0()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t)(v0 + 2);
  uint64_t v3 = v0[25];
  uint64_t v4 = v0[26];
  uint64_t v5 = v0[24];
  uint64_t v6 = sub_1101A8();
  v0[5] = v6;
  v0[6] = (uint64_t)&protocol witness table for ABCReport;
  uint64_t v7 = sub_31294(v0 + 2);
  v0[9] = sub_110308();
  sub_3DD4(&qword_140908);
  *uint64_t v7 = sub_110858();
  v7[1] = v8;
  uint64_t v9 = enum case for UnhandledAbortSubtype.generic(_:);
  uint64_t v10 = sub_1100D8();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104))(v7, v9, v10);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v6 - 8) + 104))(v7, enum case for ABCReport.unhandledAbort(_:), v6);
  sub_10FF28();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  _s20HandleIntentStrategyVwxx_1(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v1[1];
  return v11();
}

uint64_t sub_E5890()
{
  uint64_t v0 = sub_110778();
  sub_2D924(v0, qword_1432D8);
  sub_3E18(v0, (uint64_t)qword_1432D8);
  return sub_1104D8();
}

uint64_t sub_E58DC(uint64_t a1, uint64_t a2)
{
  v3[14] = a2;
  v3[15] = v2;
  v3[13] = a1;
  uint64_t v4 = sub_10EAF8();
  v3[16] = v4;
  v3[17] = *(void *)(v4 - 8);
  v3[18] = swift_task_alloc();
  sub_10FC68();
  v3[19] = swift_task_alloc();
  uint64_t v5 = sub_110138();
  v3[20] = v5;
  v3[21] = *(void *)(v5 - 8);
  v3[22] = swift_task_alloc();
  uint64_t v6 = sub_10FE68();
  v3[23] = v6;
  v3[24] = *(void *)(v6 - 8);
  v3[25] = swift_task_alloc();
  sub_3DD4(&qword_13FA88);
  v3[26] = swift_task_alloc();
  v3[27] = swift_task_alloc();
  type metadata accessor for DeleteAlarmUnsupportedWithReasonSleepAlarmNotSupportedParameters(0);
  v3[28] = swift_task_alloc();
  uint64_t v7 = sub_10FDC8();
  v3[29] = v7;
  v3[30] = *(void *)(v7 - 8);
  v3[31] = swift_task_alloc();
  uint64_t v8 = sub_10E828();
  v3[32] = v8;
  v3[33] = *(void *)(v8 - 8);
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  v3[37] = type metadata accessor for DeleteAllIntentHandledParameters(0);
  v3[38] = swift_task_alloc();
  uint64_t v9 = sub_110778();
  v3[39] = v9;
  v3[40] = *(void *)(v9 - 8);
  v3[41] = swift_task_alloc();
  uint64_t v10 = sub_10FD58();
  v3[42] = v10;
  v3[43] = *(void *)(v10 - 8);
  v3[44] = swift_task_alloc();
  uint64_t v11 = sub_10FD78();
  v3[45] = v11;
  v3[46] = *(void *)(v11 - 8);
  v3[47] = swift_task_alloc();
  v3[48] = swift_task_alloc();
  v3[49] = swift_task_alloc();
  uint64_t v12 = sub_10EE68();
  v3[50] = v12;
  v3[51] = *(void *)(v12 - 8);
  v3[52] = swift_task_alloc();
  uint64_t v13 = sub_10EAB8();
  v3[53] = v13;
  v3[54] = *(void *)(v13 - 8);
  v3[55] = swift_task_alloc();
  uint64_t v14 = sub_10FEF8();
  v3[56] = v14;
  v3[57] = *(void *)(v14 - 8);
  v3[58] = swift_task_alloc();
  uint64_t v15 = sub_10FF18();
  v3[59] = v15;
  v3[60] = *(void *)(v15 - 8);
  v3[61] = swift_task_alloc();
  return _swift_task_switch(sub_E5E94, 0, 0);
}

uint64_t sub_E5E94()
{
  if (qword_13F1B8 != -1) {
    swift_once();
  }
  uint64_t v1 = (__objc2_ivar *)sub_3E18(v0[39], (uint64_t)qword_1432D8);
  uint64_t v2 = sub_110768();
  os_log_type_t v3 = sub_1109F8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "DeleteAlarm.HandleIntentStrategy.makeIntentHandledResponse() called.", v4, 2u);
    swift_slowDealloc();
  }

  sub_3DD4(&qword_140AE0);
  uint64_t v5 = (void *)sub_10EC18();
  v0[62] = v5;
  id v6 = [v5 alarms];
  if (v6)
  {
    uint64_t v7 = v6;
    sub_1104F8();
    unint64_t v8 = sub_110908();

    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_110CD8();
      swift_bridgeObjectRelease();
      if (v9)
      {
LABEL_8:
        if (v9 < 1)
        {
          __break(1u);
        }
        else
        {
          v137 = v1;
          v141 = v0;
          uint64_t v0 = (void *)(v8 & 0xC000000000000001);
          swift_bridgeObjectRetain();
          uint64_t v10 = 0;
          uint64_t v1 = &stru_13E000;
          do
          {
            if (v0) {
              id v11 = (id)sub_110C18();
            }
            else {
              id v11 = *(id *)(v8 + 8 * v10 + 32);
            }
            uint64_t v12 = v11;
            id v13 = [v11 sleepAlarmAttribute];

            if (v13)
            {
              sub_110C58();
              sub_110C88();
              sub_110C98();
              sub_110C68();
            }
            else
            {
            }
            ++v10;
          }
          while (v9 != v10);
          swift_bridgeObjectRelease();
          if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) == 0
            && ((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) == 0)
          {
            uint64_t v14 = _swiftEmptyArrayStorage[2];
            goto LABEL_20;
          }
        }
        swift_bridgeObjectRetain();
        uint64_t v14 = sub_110CD8();
        swift_release();
LABEL_20:
        id v135 = v5;
        swift_release();
        if (v14)
        {
          uint64_t v16 = v141[60];
          uint64_t v15 = v141[61];
          uint64_t v17 = v141[59];
          (*(void (**)(void, void, void))(v141[57] + 104))(v141[58], enum case for AppInstallUtil.Domain.sleep(_:), v141[56]);
          sub_10FF08();
          LOBYTE(v14) = sub_10FEC8();
          (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
        }
        sub_13370(v8);
        if (v8 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v18 = sub_110CD8();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v18 = *(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8));
        }
        if (v18 >= 2)
        {
          id v19 = [v5 alarmSearch];
          if (v19)
          {
            uint64_t v20 = v19;
            [v19 alarmReferenceType];

            uint64_t v21 = sub_1103C8();
            BOOL v131 = v21 == sub_1103C8();
          }
          else
          {
            BOOL v131 = 0;
          }
          id v55 = [v5 alarmSearch];
          if (v55)
          {
            id v56 = v55;
            [v55 period];

            uint64_t v57 = sub_110498();
            BOOL v136 = v57 == sub_110498();
          }
          else
          {
            BOOL v136 = 0;
          }
          id v58 = [v5 alarmSearch];
          if (v58)
          {
            id v59 = v58;
            [v58 period];

            uint64_t v60 = sub_110498();
            BOOL v134 = v60 == sub_110498();
          }
          else
          {
            BOOL v134 = 0;
          }
          id v61 = [v5 alarmSearch];
          if (v61)
          {
            uint64_t v62 = v61;
            [v61 period];

            uint64_t v63 = sub_110498();
            BOOL v133 = v63 == sub_110498();
          }
          else
          {
            BOOL v133 = 0;
          }
          id v64 = [v5 alarmSearch];
          if (v64)
          {
            uint64_t v65 = v64;
            [v64 period];

            uint64_t v66 = sub_110498();
            BOOL v132 = v66 == sub_110498();
          }
          else
          {
            BOOL v132 = 0;
          }
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (v0) {
              id v68 = (id)sub_110C18();
            }
            else {
              id v68 = *(id *)(v8 + 8 * i + 32);
            }
            uint64_t v69 = v68;
            id v70 = [v68 v1[28].name];

            if (v70)
            {
            }
            else
            {
              sub_110C58();
              sub_110C88();
              sub_110C98();
              sub_110C68();
            }
          }
          swift_bridgeObjectRelease();
          Swift::String v71 = sub_E9BA4((unint64_t)_swiftEmptyArrayStorage);
          swift_release();
          if (v71[2])
          {
            uint64_t v73 = v141[51];
            uint64_t v72 = v141[52];
            uint64_t v74 = v141[50];
            sub_F9694((uint64_t)v71, v72);
            swift_bridgeObjectRelease();
            sub_10E9F8();
            (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v72, v74);
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          uint64_t v75 = v141[41];
          uint64_t v77 = v141[39];
          uint64_t v76 = v141[40];
          (*(void (**)(void, void, void))(v141[43] + 104))(v141[44], enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), v141[42]);
          (*(void (**)(uint64_t, __objc2_ivar *, uint64_t))(v76 + 16))(v75, v137, v77);
          mach_absolute_time();
          sub_10FD88();
          v78 = sub_110768();
          os_log_type_t v79 = sub_1109D8();
          BOOL v80 = os_log_type_enabled(v78, v79);
          if (!v131)
          {
            if (v80)
            {
              v90 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v90 = 0;
              _os_log_impl(&dword_0, v78, v79, "Hitting RF path for delete multiple alarms", v90, 2u);
              swift_slowDealloc();
            }

            if (qword_13F078 != -1) {
              swift_once();
            }
            sub_17BD8((void *)v141[15], *(void *)(v141[15] + 24));
            sub_10E798();
            v139 = (char *)&dword_1429E8 + dword_1429E8;
            v5;
            v91 = (void *)swift_task_alloc();
            v141[66] = v91;
            void *v91 = v141;
            v91[1] = sub_E777C;
            __asm { BR              X8; sub_C89CC }
          }
          if (v80)
          {
            v81 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v81 = 0;
            _os_log_impl(&dword_0, v78, v79, "Hitting RF path for delete all alarms", v81, 2u);
            swift_slowDealloc();
          }

          if (qword_13F080 != -1) {
            swift_once();
          }
          uint64_t v83 = v141[37];
          v82 = (unsigned char *)v141[38];
          sub_17BD8((void *)v141[15], *(void *)(v141[15] + 24));
          char v84 = sub_10E798();
          v85 = &v82[*(int *)(v83 + 48)];
          uint64_t v86 = sub_10FBC8();
          (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v86 - 8) + 56))(v85, 1, 1, v86);
          unsigned char *v82 = v14 & 1;
          v82[1] = 1;
          v82[2] = v136;
          v82[3] = 1;
          v82[4] = v134;
          v82[5] = v133;
          v82[6] = v132;
          v82[7] = v84 & 1;
          *(void *)&v82[*(int *)(v83 + 52)] = 0;
          uint64_t v48 = sub_887F0();
          v141[63] = v48;
          v138 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                                     + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
          v87 = (void *)swift_task_alloc();
          v141[64] = v87;
          void *v87 = v141;
          v87[1] = sub_E7378;
          unint64_t v88 = 0xD000000000000017;
          v89 = "DeleteAll#IntentHandled";
LABEL_96:
          return v138(v88, (unint64_t)(v89 - 32) | 0x8000000000000000, v48);
        }
        if (v14)
        {
          swift_bridgeObjectRelease();
          uint64_t v22 = sub_110768();
          os_log_type_t v23 = sub_1109F8();
          int v24 = v141;
          if (os_log_type_enabled(v22, v23))
          {
            int v25 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)int v25 = 0;
            _os_log_impl(&dword_0, v22, v23, "Delete sleep alarm is not supported, punch out.", v25, 2u);
            swift_slowDealloc();
          }
          uint64_t v27 = v141[30];
          uint64_t v26 = v141[31];
          uint64_t v28 = v141[29];

          sub_10FDB8();
          BOOL v29 = sub_10FDA8();
          (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
          unint64_t v30 = sub_110768();
          os_log_type_t v31 = sub_1109F8();
          BOOL v32 = os_log_type_enabled(v30, v31);
          if (v29)
          {
            if (v32)
            {
              uint64_t v33 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v33 = 0;
              _os_log_impl(&dword_0, v30, v31, "Hitting RF path for deleting sleep alarm.", v33, 2u);
              swift_slowDealloc();
            }
            uint64_t v34 = v141[43];
            uint64_t v35 = v141[44];
            uint64_t v37 = v141[41];
            uint64_t v36 = v141[42];
            uint64_t v39 = v141[39];
            uint64_t v38 = v141[40];

            (*(void (**)(uint64_t, void, uint64_t))(v34 + 104))(v35, enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), v36);
            (*(void (**)(uint64_t, __objc2_ivar *, uint64_t))(v38 + 16))(v37, v137, v39);
            mach_absolute_time();
            sub_10FD88();
            if (qword_13F078 != -1) {
              swift_once();
            }
            uint64_t v41 = v141[27];
            uint64_t v40 = v141[28];
            uint64_t v42 = v141[25];
            uint64_t v43 = v141[26];
            uint64_t v44 = v141[23];
            uint64_t v45 = v141[24];
            uint64_t v46 = sub_10FBC8();
            uint64_t v47 = *(void *)(v46 - 8);
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v47 + 56))(v40, 1, 1, v46);
            (*(void (**)(uint64_t, void, uint64_t))(v45 + 104))(v42, enum case for PunchOutApp.sleep(_:), v44);
            sub_10FE48();
            (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v42, v44);
            sub_33F10(v41, v40);
            sub_3DD4(&qword_13FC38);
            uint64_t v48 = swift_allocObject();
            v141[77] = v48;
            *(_OWORD *)(v48 + 16) = xmmword_1117A0;
            unint64_t v49 = (uint64_t *)(v48 + 48);
            *(void *)(v48 + 32) = 0xD000000000000014;
            *(void *)(v48 + 40) = 0x8000000000116060;
            sub_8B4C8(v40, v43);
            int v50 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v43, 1, v46);
            uint64_t v51 = v141[26];
            if (v50 == 1)
            {
              sub_1646C(v141[26], &qword_13FA88);
              *(_OWORD *)unint64_t v49 = 0u;
              *(_OWORD *)(v48 + 64) = 0u;
            }
            else
            {
              *(void *)(v48 + 72) = v46;
              v103 = sub_31294(v49);
              (*(void (**)(uint64_t *, uint64_t, uint64_t))(v47 + 32))(v103, v51, v46);
            }
            v138 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                                       + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
            v104 = (void *)swift_task_alloc();
            v141[78] = v104;
            void *v104 = v141;
            v104[1] = sub_E85BC;
            unint64_t v88 = 0xD000000000000037;
            v89 = "DeleteAlarm#UnsupportedWithReasonSleepAlarmNotSupported";
            goto LABEL_96;
          }
          if (v32)
          {
            v92 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v92 = 0;
            _os_log_impl(&dword_0, v30, v31, "Hitting non-RF path for deleting sleep alarm.", v92, 2u);
            int v24 = v141;
            swift_slowDealloc();
          }
          uint64_t v94 = v24[57];
          uint64_t v93 = v24[58];
          uint64_t v95 = v24[56];

          (*(void (**)(uint64_t, void, uint64_t))(v94 + 104))(v93, enum case for AppInstallUtil.Domain.sleep(_:), v95);
          type metadata accessor for AlarmBaseCATs_Async();
          sub_10FC48();
          sub_10FB38();
          sub_591F8();
          sub_110128();
          v96 = (void *)swift_task_alloc();
          v24[83] = v96;
          void *v96 = v24;
          v96[1] = sub_E8D14;
          return AppInstallDialogOutputUtil.makeLaunchAppView()();
        }
        id v52 = [v5 alarmSearch];
        if (v52)
        {
          NSNumber v53 = v52;
          v54 = [v52 label];

          if (v54)
          {

            v54 = (void *)(&dword_0 + 1);
          }
        }
        else
        {
          v54 = 0;
        }
        id v97 = [v5 alarms];
        if (v97)
        {
          v98 = v97;
          unint64_t v99 = sub_110908();

          if (v99 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v126 = sub_110CD8();
            swift_bridgeObjectRelease();
            if (v126) {
              goto LABEL_87;
            }
          }
          else if (*(void *)((char *)&dword_10 + (v99 & 0xFFFFFFFFFFFFFF8)))
          {
LABEL_87:
            if ((v99 & 0xC000000000000001) != 0)
            {
              id v100 = (id)sub_110C18();
            }
            else
            {
              if (!*(void *)((char *)&dword_10 + (v99 & 0xFFFFFFFFFFFFFF8)))
              {
                __break(1u);
LABEL_123:
                swift_once();
LABEL_107:
                uint64_t v122 = qword_1444D0;
                v140 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_1429F0 + dword_1429F0);
                swift_retain();
                v123 = (void *)swift_task_alloc();
                v54[72] = v123;
                void *v123 = v54;
                v123[1] = sub_E7E88;
                return v140((char)v135, v122, v99);
              }
              id v100 = *(id *)(v99 + 32);
            }
            v101 = v100;
            swift_bridgeObjectRelease();
            unint64_t v99 = (unint64_t)sub_800B8(0, 0);
            v141[71] = v99;

            if (v99)
            {
              if (v0)
              {
                id v102 = (id)sub_110C18();
              }
              else
              {
                if (!*(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8)))
                {
                  __break(1u);
                  return AppInstallDialogOutputUtil.makeLaunchAppView()();
                }
                id v102 = *(id *)(v8 + 32);
              }
              v106 = v102;
              swift_bridgeObjectRelease();
              sub_3DD4(&qword_1401E8);
              uint64_t inited = swift_initStackObject();
              *(_OWORD *)(inited + 16) = xmmword_111BF0;
              *(void *)(inited + 32) = v106;
              unint64_t v142 = inited;
              sub_110928();
              id v108 = v106;
              v109 = sub_E9BA4(v142);
              swift_bridgeObjectRelease();
              if (v109[2])
              {
                uint64_t v110 = v141[51];
                uint64_t v111 = v141[52];
                uint64_t v112 = v141[50];
                sub_F9694((uint64_t)v109, v111);
                swift_bridgeObjectRelease();
                sub_10E9F8();

                (*(void (**)(uint64_t, uint64_t))(v110 + 8))(v111, v112);
              }
              else
              {

                swift_bridgeObjectRelease();
              }
              LOBYTE(v135) = (_BYTE)v54;
              v113 = sub_110768();
              os_log_type_t v114 = sub_1109F8();
              if (os_log_type_enabled(v113, v114))
              {
                v115 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)v115 = 0;
                _os_log_impl(&dword_0, v113, v114, "RF path for deleting single alarm.", v115, 2u);
                swift_slowDealloc();
              }
              uint64_t v116 = v141[43];
              uint64_t v117 = v141[44];
              uint64_t v119 = v141[41];
              uint64_t v118 = v141[42];
              v54 = v141;
              uint64_t v120 = v141[40];
              uint64_t v121 = v141[39];

              (*(void (**)(uint64_t, void, uint64_t))(v116 + 104))(v117, enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), v118);
              (*(void (**)(uint64_t, __objc2_ivar *, uint64_t))(v120 + 16))(v119, v137, v121);
              mach_absolute_time();
              sub_10FD88();
              if (qword_13F078 == -1) {
                goto LABEL_107;
              }
              goto LABEL_123;
            }
            goto LABEL_120;
          }
          swift_bridgeObjectRelease();
        }
LABEL_120:
        uint64_t v127 = v141[55];
        uint64_t v128 = v141[54];
        uint64_t v129 = v141[53];
        swift_bridgeObjectRelease();
        sub_3DD4(&qword_1401F0);
        sub_425E8();
        swift_allocError();
        unsigned char *v130 = 3;
        swift_willThrow();

        uint64_t v0 = v141;
        (*(void (**)(uint64_t, uint64_t))(v128 + 8))(v127, v129);
        goto LABEL_113;
      }
    }
    else
    {
      uint64_t v9 = *(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8));
      if (v9) {
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease();
  }
  sub_3DD4(&qword_1401F0);
  sub_425E8();
  swift_allocError();
  unsigned char *v124 = 3;
  swift_willThrow();

LABEL_113:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v125 = (uint64_t (*)(void))v0[1];
  return v125();
}

uint64_t sub_E7378(uint64_t a1)
{
  os_log_type_t v3 = (void *)*v2;
  v3[7] = v2;
  v3[8] = a1;
  v3[9] = v1;
  v3[65] = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1) {
    uint64_t v4 = sub_E7588;
  }
  else {
    uint64_t v4 = sub_E74B4;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_E74B4()
{
  sub_EA300(v0[38], type metadata accessor for DeleteAllIntentHandledParameters);
  v0[68] = v0[8];
  sub_10E818();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[69] = v1;
  void *v1 = v0;
  v1[1] = sub_E7B48;
  uint64_t v2 = v0[55];
  uint64_t v3 = v0[49];
  uint64_t v4 = v0[36];
  uint64_t v5 = v0[13];
  return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)(v5, v4, v2, v3, 0);
}

uint64_t sub_E7588()
{
  uint64_t v1 = (void *)v0[62];
  uint64_t v3 = v0[54];
  uint64_t v2 = v0[55];
  uint64_t v4 = v0[53];
  uint64_t v5 = v0[49];
  uint64_t v6 = v0[45];
  uint64_t v7 = v0[46];
  sub_EA300(v0[38], type metadata accessor for DeleteAllIntentHandledParameters);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_E777C(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  v4[10] = v2;
  v4[11] = a1;
  v4[12] = v1;
  v4[67] = v1;
  swift_task_dealloc();

  if (v1) {
    uint64_t v5 = sub_E7970;
  }
  else {
    uint64_t v5 = sub_E78B8;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_E78B8()
{
  v0[68] = v0[11];
  sub_10E818();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[69] = v1;
  void *v1 = v0;
  v1[1] = sub_E7B48;
  uint64_t v2 = v0[55];
  uint64_t v3 = v0[49];
  uint64_t v4 = v0[36];
  uint64_t v5 = v0[13];
  return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)(v5, v4, v2, v3, 0);
}

uint64_t sub_E7970()
{
  uint64_t v2 = *(void *)(v0 + 432);
  uint64_t v1 = *(void *)(v0 + 440);
  uint64_t v3 = *(void *)(v0 + 424);
  uint64_t v4 = *(void *)(v0 + 392);
  uint64_t v5 = *(void *)(v0 + 360);
  uint64_t v6 = *(void *)(v0 + 368);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_E7B48()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 560) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[33] + 8))(v2[36], v2[32]);
  if (v0) {
    uint64_t v3 = sub_E9298;
  }
  else {
    uint64_t v3 = sub_E7CB0;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_E7CB0()
{
  uint64_t v1 = *(void **)(v0 + 544);
  uint64_t v3 = *(void *)(v0 + 432);
  uint64_t v2 = *(void *)(v0 + 440);
  uint64_t v4 = *(void *)(v0 + 424);
  uint64_t v5 = *(void *)(v0 + 392);
  uint64_t v6 = *(void *)(v0 + 360);
  uint64_t v7 = *(void *)(v0 + 368);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_E7E88(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 584) = a1;
  *(void *)(v3 + 592) = v1;
  swift_task_dealloc();
  swift_release();
  if (v1) {
    uint64_t v4 = sub_E81FC;
  }
  else {
    uint64_t v4 = sub_E7FC8;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_E7FC8()
{
  sub_10E7B8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[75] = v1;
  void *v1 = v0;
  v1[1] = sub_E807C;
  uint64_t v2 = v0[55];
  uint64_t v3 = v0[48];
  uint64_t v4 = v0[35];
  uint64_t v5 = v0[13];
  return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)(v5, v4, v2, v3, 0);
}

uint64_t sub_E807C()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 608) = v0;
  swift_task_dealloc();
  uint64_t v3 = (void *)v2[73];
  (*(void (**)(void, void))(v2[33] + 8))(v2[35], v2[32]);

  if (v0) {
    uint64_t v4 = sub_E99C0;
  }
  else {
    uint64_t v4 = sub_E83E0;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_E81FC()
{
  uint64_t v2 = *(void *)(v0 + 432);
  uint64_t v1 = *(void *)(v0 + 440);
  uint64_t v3 = *(void *)(v0 + 424);
  uint64_t v4 = *(void *)(v0 + 384);
  uint64_t v5 = *(void *)(v0 + 360);
  uint64_t v6 = *(void *)(v0 + 368);

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_E83E0()
{
  uint64_t v2 = *(void *)(v0 + 432);
  uint64_t v1 = *(void *)(v0 + 440);
  uint64_t v3 = *(void *)(v0 + 424);
  uint64_t v4 = *(void *)(v0 + 384);
  uint64_t v5 = *(void *)(v0 + 360);
  uint64_t v6 = *(void *)(v0 + 368);

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_E85BC(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 632) = a1;
  *(void *)(v3 + 640) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1) {
    uint64_t v4 = sub_E8950;
  }
  else {
    uint64_t v4 = sub_E86FC;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_E86FC()
{
  sub_EA300(v0[28], type metadata accessor for DeleteAlarmUnsupportedWithReasonSleepAlarmNotSupportedParameters);
  sub_10E7E8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[81] = v1;
  void *v1 = v0;
  v1[1] = sub_E87D0;
  uint64_t v2 = v0[55];
  uint64_t v3 = v0[47];
  uint64_t v4 = v0[34];
  uint64_t v5 = v0[13];
  return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)(v5, v4, v2, v3, 0);
}

uint64_t sub_E87D0()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 656) = v0;
  swift_task_dealloc();
  uint64_t v3 = (void *)v2[79];
  (*(void (**)(void, void))(v2[33] + 8))(v2[34], v2[32]);

  if (v0) {
    uint64_t v4 = sub_E9478;
  }
  else {
    uint64_t v4 = sub_E8B44;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_E8950()
{
  uint64_t v1 = (void *)v0[62];
  uint64_t v3 = v0[54];
  uint64_t v2 = v0[55];
  uint64_t v4 = v0[53];
  uint64_t v6 = v0[46];
  uint64_t v5 = v0[47];
  uint64_t v7 = v0[45];
  sub_EA300(v0[28], type metadata accessor for DeleteAlarmUnsupportedWithReasonSleepAlarmNotSupportedParameters);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_E8B44()
{
  uint64_t v2 = *(void *)(v0 + 432);
  uint64_t v1 = *(void *)(v0 + 440);
  uint64_t v3 = *(void *)(v0 + 424);
  uint64_t v5 = *(void *)(v0 + 368);
  uint64_t v4 = *(void *)(v0 + 376);
  uint64_t v6 = *(void *)(v0 + 360);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_E8D14(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  v4[84] = a1;
  v4[85] = v1;
  swift_task_dealloc();
  (*(void (**)(void, void))(v3[21] + 8))(v3[22], v3[20]);
  if (v1) {
    uint64_t v5 = sub_E9650;
  }
  else {
    uint64_t v5 = sub_E8E88;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_E8E88()
{
  if (qword_13F070 != -1) {
    swift_once();
  }
  sub_17BD8(*(void **)(v0 + 120), *(void *)(*(void *)(v0 + 120) + 24));
  char v1 = sub_10E798();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 688) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_E8F90;
  uint64_t v3 = *(void *)(v0 + 144);
  return sub_D7C00(v3, 0, 1, v1 & 1);
}

uint64_t sub_E8F90()
{
  *(void *)(*(void *)v1 + 696) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_E9808;
  }
  else
  {
    uint64_t v2 = sub_E90AC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_E90AC()
{
  uint64_t v1 = *(void **)(v0 + 496);
  uint64_t v3 = *(void *)(v0 + 432);
  uint64_t v2 = *(void *)(v0 + 440);
  uint64_t v4 = *(void *)(v0 + 424);
  uint64_t v6 = *(void *)(v0 + 136);
  uint64_t v5 = *(void *)(v0 + 144);
  uint64_t v7 = *(void *)(v0 + 128);
  sub_30FB8(*(void *)(v0 + 672), v2, *(uint64_t **)(v0 + 104));

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_E9298()
{
  uint64_t v1 = *(void **)(v0 + 544);
  uint64_t v3 = *(void *)(v0 + 432);
  uint64_t v2 = *(void *)(v0 + 440);
  uint64_t v4 = *(void *)(v0 + 424);
  uint64_t v5 = *(void *)(v0 + 392);
  uint64_t v6 = *(void *)(v0 + 360);
  uint64_t v7 = *(void *)(v0 + 368);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_E9478()
{
  uint64_t v2 = *(void *)(v0 + 432);
  uint64_t v1 = *(void *)(v0 + 440);
  uint64_t v3 = *(void *)(v0 + 424);
  uint64_t v5 = *(void *)(v0 + 368);
  uint64_t v4 = *(void *)(v0 + 376);
  uint64_t v6 = *(void *)(v0 + 360);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_E9650()
{
  uint64_t v2 = *(void *)(v0 + 432);
  uint64_t v1 = *(void *)(v0 + 440);
  uint64_t v3 = *(void *)(v0 + 424);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_E9808()
{
  uint64_t v2 = *(void *)(v0 + 432);
  uint64_t v1 = *(void *)(v0 + 440);
  uint64_t v3 = *(void *)(v0 + 424);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_E99C0()
{
  uint64_t v2 = *(void *)(v0 + 432);
  uint64_t v1 = *(void *)(v0 + 440);
  uint64_t v3 = *(void *)(v0 + 424);
  uint64_t v4 = *(void *)(v0 + 384);
  uint64_t v5 = *(void *)(v0 + 360);
  uint64_t v6 = *(void *)(v0 + 368);

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

void *sub_E9BA4(unint64_t a1)
{
  unint64_t v1 = a1;
  if (!(a1 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t result = (void *)sub_110CD8();
  uint64_t v2 = (uint64_t)result;
  if (!result) {
    goto LABEL_17;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    unint64_t v18 = v1 & 0xC000000000000001;
    uint64_t v5 = _swiftEmptyArrayStorage;
    uint64_t v16 = v2;
    unint64_t v17 = v1;
    do
    {
      if (v18) {
        id v7 = (id)sub_110C18();
      }
      else {
        id v7 = *(id *)(v1 + 8 * v4 + 32);
      }
      sub_B35D8(v7, (uint64_t)v19);
      uint64_t v8 = v19[0];
      uint64_t v9 = v19[1];
      uint64_t v11 = v19[2];
      uint64_t v10 = v19[3];
      uint64_t v12 = v19[4];
      char v13 = v20;
      sub_EA360((uint64_t)v19, (uint64_t)v21);
      if (v22)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v5 = sub_B7B98(0, v5[2] + 1, 1, v5);
        }
        unint64_t v15 = v5[2];
        unint64_t v14 = v5[3];
        if (v15 >= v14 >> 1) {
          uint64_t v5 = sub_B7B98((void *)(v14 > 1), v15 + 1, 1, v5);
        }
        v5[2] = v15 + 1;
        uint64_t v6 = &v5[6 * v15];
        v6[4] = v8;
        v6[5] = v9;
        v6[6] = v11;
        v6[7] = v10;
        v6[8] = v12;
        *((unsigned char *)v6 + 72) = v13 & 1;
        uint64_t v2 = v16;
        unint64_t v1 = v17;
      }
      ++v4;
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
    return v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_E9D50(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_3DD4(&qword_13FA88);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [a2 alarmSearch];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = [v7 label];
    if (v9)
    {
      uint64_t v10 = v9;
      sub_110848();

      sub_110878();
      swift_bridgeObjectRelease();
      uint64_t v11 = sub_10FBC8();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 0, 1, v11);
    }
    else
    {
      uint64_t v13 = sub_10FBC8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 1, 1, v13);
    }
  }
  else
  {
    uint64_t v12 = sub_10FBC8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v6, 1, 1, v12);
  }
  uint64_t v14 = type metadata accessor for DeleteAlarmIntentHandledMultipleParameters(0);
  sub_33F10((uint64_t)v6, a1 + *(int *)(v14 + 48));
  id v15 = [a2 alarmSearch];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = sub_33FD8();
  }
  else
  {
    uint64_t v17 = 0;
  }
  uint64_t v18 = *(int *)(v14 + 52);
  uint64_t result = swift_release();
  *(void *)(a1 + v18) = v17;
  return result;
}

uint64_t sub_E9F50(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_E9FF8;
  return sub_E58DC(a1, a2);
}

uint64_t sub_E9FF8()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_EA12C, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_EA12C()
{
  v0[3] = v0[5];
  sub_3DD4(&qword_13FA70);
  sub_10FF38();
  swift_willThrow();
  swift_errorRelease();
  unint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_EA1EC(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_143338 + dword_143338);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_33C04;
  return v5(a1);
}

unint64_t sub_EA2AC()
{
  unint64_t result = qword_1432F8[0];
  if (!qword_1432F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1432F8);
  }
  return result;
}

uint64_t sub_EA300(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_EA360(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3DD4(&qword_143348);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_EA3D0(uint64_t a1)
{
  return sub_EA438(a1, (void (*)(void))type metadata accessor for UpdateAlarmCATsSimple, (uint64_t (*)(char *, void))&CATWrapperSimple.__allocating_init(options:globals:), &qword_144620);
}

uint64_t sub_EA404(uint64_t a1)
{
  return sub_EA438(a1, (void (*)(void))type metadata accessor for ModifyAlarmCATPatternsExecutor, (uint64_t (*)(char *, void))&CATWrapper.__allocating_init(options:globals:), &qword_144628);
}

uint64_t sub_EA438(uint64_t a1, void (*a2)(void), uint64_t (*a3)(char *, void), uint64_t *a4)
{
  uint64_t v7 = sub_10FC68();
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2(0);
  sub_10FC48();
  uint64_t result = a3(v9, 0);
  *a4 = result;
  return result;
}

uint64_t type metadata accessor for DismissAlarmCATs_Async()
{
  uint64_t result = qword_143390;
  if (!qword_143390) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_EA528()
{
  return swift_initClassMetadata2();
}

uint64_t sub_EA568(uint64_t a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v6 + 32) = a5;
  *(void *)(v6 + 40) = v5;
  *(unsigned char *)(v6 + 89) = a3;
  *(unsigned char *)(v6 + 88) = a2;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a4;
  sub_3DD4(&qword_13FA88);
  *(void *)(v6 + 48) = swift_task_alloc();
  *(void *)(v6 + 56) = swift_task_alloc();
  return _swift_task_switch(sub_EA618, 0, 0);
}

uint64_t sub_EA618()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 24);
  char v3 = *(unsigned char *)(v0 + 89);
  char v4 = *(unsigned char *)(v0 + 88);
  sub_3DD4(&qword_13FC38);
  uint64_t v5 = swift_allocObject();
  *(void *)(v0 + 64) = v5;
  *(_OWORD *)(v5 + 16) = xmmword_111970;
  *(void *)(v5 + 32) = 0x6E6F737265507369;
  *(void *)(v5 + 40) = 0xEA00000000006C61;
  *(unsigned char *)(v5 + 48) = v4;
  *(void *)(v5 + 72) = &type metadata for Bool;
  *(void *)(v5 + 80) = 0x6E756D6D6F437369;
  *(void *)(v5 + 88) = 0xEA00000000006C61;
  *(unsigned char *)(v5 + 96) = v3;
  uint64_t v6 = (uint64_t *)(v5 + 144);
  *(void *)(v5 + 120) = &type metadata for Bool;
  *(void *)(v5 + 128) = 0x614E656369766564;
  *(void *)(v5 + 136) = 0xEA0000000000656DLL;
  sub_AFBC(v2, v1, &qword_13FA88);
  uint64_t v7 = sub_10FBC8();
  uint64_t v8 = *(void *)(v7 - 8);
  id v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(v1, 1, v7);
  uint64_t v11 = *(void *)(v0 + 56);
  if (v10 == 1)
  {
    sub_1646C(*(void *)(v0 + 56), &qword_13FA88);
    *(_OWORD *)uint64_t v6 = 0u;
    *(_OWORD *)(v5 + 160) = 0u;
  }
  else
  {
    *(void *)(v5 + 168) = v7;
    uint64_t v12 = sub_31294(v6);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v8 + 32))(v12, v11, v7);
  }
  uint64_t v13 = *(void *)(v0 + 48);
  uint64_t v14 = *(void *)(v0 + 32);
  *(void *)(v5 + 176) = 0x656D614E6D6F6F72;
  *(void *)(v5 + 184) = 0xE800000000000000;
  sub_AFBC(v14, v13, &qword_13FA88);
  int v15 = v9(v13, 1, v7);
  uint64_t v16 = *(void *)(v0 + 48);
  if (v15 == 1)
  {
    sub_1646C(*(void *)(v0 + 48), &qword_13FA88);
    *(_OWORD *)(v5 + 192) = 0u;
    *(_OWORD *)(v5 + 208) = 0u;
  }
  else
  {
    *(void *)(v5 + 216) = v7;
    uint64_t v17 = sub_31294((uint64_t *)(v5 + 192));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v8 + 32))(v17, v16, v7);
  }
  uint64_t v21 = (uint64_t (*)(uint64_t, unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:)
                                                                                     + async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:));
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_EA8EC;
  uint64_t v19 = *(void *)(v0 + 16);
  return v21(v19, 0xD000000000000025, 0x80000000001173B0, v5);
}

uint64_t sub_EA8EC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_EAA40, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    char v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_EAA40()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_EAAB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FC68();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3DD4((uint64_t *)&unk_13F780);
  __chkstk_darwin(v8 - 8);
  int v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  sub_AFBC(a1, (uint64_t)v10, (uint64_t *)&unk_13F780);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = sub_10FB18();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_1646C(a1, (uint64_t *)&unk_13F780);
  return v11;
}

uint64_t sub_EAC50()
{
  return type metadata accessor for DismissAlarmCATs_Async();
}

uint64_t type metadata accessor for CreateAlarmCATsSimple()
{
  uint64_t result = qword_1433E8;
  if (!qword_1433E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_EACA4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_EACE4(uint64_t a1, char a2, char a3, char a4, char a5)
{
  *(unsigned char *)(v6 + 59) = a5;
  *(unsigned char *)(v6 + 58) = a4;
  *(unsigned char *)(v6 + 57) = a3;
  *(unsigned char *)(v6 + 56) = a2;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = v5;
  return _swift_task_switch(sub_EAD14, 0, 0);
}

uint64_t sub_EAD14()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_3DD4(&qword_13FC38);
  uint64_t v2 = swift_allocObject();
  *(void *)(v0 + 32) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_111650;
  *(void *)(v2 + 32) = 0x6D72616C61;
  *(void *)(v2 + 40) = 0xE500000000000000;
  uint64_t v3 = 0;
  if (v1)
  {
    uint64_t v3 = type metadata accessor for AlarmAlarm(0);
  }
  else
  {
    *(void *)(v2 + 56) = 0;
    *(void *)(v2 + 64) = 0;
  }
  char v4 = *(unsigned char *)(v0 + 59);
  char v5 = *(unsigned char *)(v0 + 58);
  char v6 = *(unsigned char *)(v0 + 57);
  char v7 = *(unsigned char *)(v0 + 56);
  *(void *)(v2 + 48) = v1;
  *(void *)(v2 + 72) = v3;
  *(void *)(v2 + 80) = 0xD000000000000014;
  *(void *)(v2 + 88) = 0x8000000000116100;
  *(unsigned char *)(v2 + 96) = v7;
  *(void *)(v2 + 120) = &type metadata for Bool;
  *(void *)(v2 + 128) = 0xD000000000000015;
  *(void *)(v2 + 136) = 0x80000000001160E0;
  *(unsigned char *)(v2 + 144) = v6;
  *(void *)(v2 + 168) = &type metadata for Bool;
  *(void *)(v2 + 176) = 0xD000000000000014;
  *(void *)(v2 + 184) = 0x80000000001156D0;
  *(unsigned char *)(v2 + 192) = v5;
  *(void *)(v2 + 216) = &type metadata for Bool;
  *(void *)(v2 + 224) = 0xD000000000000017;
  *(void *)(v2 + 232) = 0x8000000000116120;
  *(void *)(v2 + 264) = &type metadata for Bool;
  int v10 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:)
                                                                            + async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(unsigned char *)(v2 + 240) = v4;
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_C43E4;
  return v10(0xD000000000000021, 0x8000000000116140, v2);
}

uint64_t sub_EAEE8(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return _swift_task_switch(sub_EAF0C, 0, 0);
}

uint64_t sub_EAF0C()
{
  uint64_t v1 = v0[2];
  sub_3DD4(&qword_13FC38);
  uint64_t v2 = swift_allocObject();
  v0[5] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_112860;
  *(void *)(v2 + 32) = 0x6D72616C61;
  *(void *)(v2 + 40) = 0xE500000000000000;
  if (v1)
  {
    uint64_t v3 = type metadata accessor for AlarmAlarm(0);
    uint64_t v4 = v1;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
    *(void *)(v2 + 56) = 0;
    *(void *)(v2 + 64) = 0;
  }
  uint64_t v5 = v0[3];
  *(void *)(v2 + 48) = v4;
  *(void *)(v2 + 72) = v3;
  *(void *)(v2 + 80) = 7368801;
  *(void *)(v2 + 88) = 0xE300000000000000;
  uint64_t v6 = 0;
  if (v5)
  {
    uint64_t v6 = sub_10FB68();
  }
  else
  {
    *(void *)(v2 + 104) = 0;
    *(void *)(v2 + 112) = 0;
  }
  *(void *)(v2 + 96) = v5;
  *(void *)(v2 + 120) = v6;
  uint64_t v9 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:)
                                                                           + async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  swift_retain();
  swift_retain();
  char v7 = (void *)swift_task_alloc();
  v0[6] = v7;
  *char v7 = v0;
  v7[1] = sub_43808;
  return v9(0xD000000000000032, 0x80000000001161A0, v2);
}

uint64_t sub_EB08C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FC68();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3DD4((uint64_t *)&unk_13F780);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  sub_1C86C(a1, (uint64_t)v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = sub_10FBD8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_1C8D4(a1);
  return v11;
}

uint64_t sub_EB210(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10FC68();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a2, v3);
  uint64_t v7 = sub_10FBE8();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a2, v3);
  return v7;
}

uint64_t sub_EB320()
{
  return type metadata accessor for CreateAlarmCATsSimple();
}

uint64_t sub_EB328()
{
  uint64_t v0 = sub_110778();
  sub_2D924(v0, qword_143448);
  sub_3E18(v0, (uint64_t)qword_143448);
  return sub_1104D8();
}

uint64_t sub_EB374@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_3DD4(&qword_13F818);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_3DD4((uint64_t *)&unk_140770);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_13F1D0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_110778();
  sub_3E18(v10, (uint64_t)qword_143448);
  uint64_t v11 = sub_110768();
  os_log_type_t v12 = sub_1109F8();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_0, v11, v12, "UpdateAlarm.NeedsValueStrategy.actionForInput() called)", v13, 2u);
    swift_slowDealloc();
  }

  uint64_t v14 = sub_110088();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 1, 1, v14);
  uint64_t v15 = enum case for DecideAction.PromptExpectation.slot(_:);
  uint64_t v16 = sub_10FEA8();
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 104))(v6, v15, v16);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v6, 0, 1, v16);
  sub_552A0(a1, v9, 0, (uint64_t)v6, a2);
  sub_1646C((uint64_t)v6, &qword_13F818);
  return sub_1646C((uint64_t)v9, (uint64_t *)&unk_140770);
}

uint64_t sub_EB5F4(uint64_t a1, uint64_t a2)
{
  v2[3] = a1;
  v2[4] = a2;
  uint64_t v3 = sub_110778();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  uint64_t v4 = sub_10FD58();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  uint64_t v5 = sub_10FD78();
  v2[11] = v5;
  v2[12] = *(void *)(v5 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  uint64_t v6 = sub_10EAB8();
  v2[15] = v6;
  v2[16] = *(void *)(v6 - 8);
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  uint64_t v7 = sub_10E828();
  v2[19] = v7;
  v2[20] = *(void *)(v7 - 8);
  v2[21] = swift_task_alloc();
  uint64_t v8 = sub_10EB68();
  v2[22] = v8;
  v2[23] = *(void *)(v8 - 8);
  v2[24] = swift_task_alloc();
  return _swift_task_switch(sub_EB8A0, 0, 0);
}

uint64_t sub_EB8A0()
{
  uint64_t v40 = v0;
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[24];
  uint64_t v3 = v0[22];
  sub_3DD4(&qword_142BD8);
  sub_10ECB8();
  uint64_t v4 = sub_10EB58();
  unint64_t v6 = v5;
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  if (qword_13F1D0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_3E18(v0[5], (uint64_t)qword_143448);
  uint64_t v8 = sub_110768();
  os_log_type_t v9 = sub_1109F8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_0, v8, v9, "UpdateAlarm.NeedsValueStrategy.makePromptForValue() called)", v10, 2u);
    swift_slowDealloc();
  }

  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_110768();
  os_log_type_t v12 = sub_1109F8();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_bridgeObjectRetain();
    v0[2] = sub_6750(v4, v6, &v39);
    sub_110B28();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v11, v12, "makeParameterPromptDialog for parameterName=%s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_10E7D8();
  if (v4 == 0x6465736F706F7270 && v6 == 0xED00006C6562614CLL)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    sub_CB188(v0[18]);
    uint64_t v15 = sub_110768();
    os_log_type_t v16 = sub_1109F8();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_0, v15, v16, "UpdateAlarm.NeedsValueStrategy.makePromptForValue() #Response label prompt", v17, 2u);
      swift_slowDealloc();
    }
    uint64_t v19 = v0[9];
    uint64_t v18 = v0[10];
    uint64_t v21 = v0[7];
    uint64_t v20 = v0[8];
    uint64_t v22 = v0[5];
    uint64_t v23 = v0[6];

    (*(void (**)(uint64_t, void, uint64_t))(v19 + 104))(v18, enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), v20);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v21, v7, v22);
    mach_absolute_time();
    sub_10FD88();
    if (qword_13F1C8 != -1) {
      swift_once();
    }
    uint64_t v38 = (char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
        + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:);
    int v24 = (void *)swift_task_alloc();
    v0[25] = v24;
    *int v24 = v0;
    v24[1] = sub_EBED0;
    unint64_t v25 = 0x80000000001174D0;
    unint64_t v26 = 0xD000000000000017;
    goto LABEL_22;
  }
  char v14 = sub_110DE8();
  swift_bridgeObjectRelease();
  if (v14) {
    goto LABEL_12;
  }
  sub_CACC0(v0[17]);
  uint64_t v27 = sub_110768();
  os_log_type_t v28 = sub_1109F8();
  if (os_log_type_enabled(v27, v28))
  {
    BOOL v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v29 = 0;
    _os_log_impl(&dword_0, v27, v28, "UpdateAlarm.NeedsValueStrategy.makePromptForValue() #Response time prompt", v29, 2u);
    swift_slowDealloc();
  }
  uint64_t v31 = v0[9];
  uint64_t v30 = v0[10];
  uint64_t v33 = v0[7];
  uint64_t v32 = v0[8];
  uint64_t v34 = v0[5];
  uint64_t v35 = v0[6];

  (*(void (**)(uint64_t, void, uint64_t))(v31 + 104))(v30, enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), v32);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v33, v7, v34);
  mach_absolute_time();
  sub_10FD88();
  if (qword_13F1C8 != -1) {
    swift_once();
  }
  uint64_t v38 = (char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
      + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:);
  uint64_t v36 = (void *)swift_task_alloc();
  v0[30] = v36;
  *uint64_t v36 = v0;
  v36[1] = sub_EC3F0;
  unint64_t v25 = 0x80000000001174B0;
  unint64_t v26 = 0xD000000000000016;
LABEL_22:
  return ((uint64_t (*)(unint64_t, unint64_t, void *))v38)(v26, v25, _swiftEmptyArrayStorage);
}

uint64_t sub_EBED0(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  unint64_t v5 = *(void **)v2;
  *(void *)(*(void *)v2 + 208) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return _swift_task_switch(sub_EC198, 0, 0);
  }
  else
  {
    v4[27] = a1;
    unint64_t v6 = (void *)swift_task_alloc();
    v4[28] = v6;
    *unint64_t v6 = v5;
    v6[1] = sub_EC06C;
    uint64_t v7 = v4[21];
    uint64_t v8 = v4[18];
    uint64_t v9 = v4[14];
    uint64_t v10 = v4[3];
    return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)(v10, v7, v8, v9, 0);
  }
}

uint64_t sub_EC06C()
{
  uint64_t v2 = *(void **)(*(void *)v1 + 216);
  *(void *)(*(void *)v1 + 232) = v0;
  swift_task_dealloc();

  if (v0) {
    uint64_t v3 = sub_EC910;
  }
  else {
    uint64_t v3 = sub_EC2C8;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_EC198()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[15];
  uint64_t v4 = v0[16];
  (*(void (**)(void, void))(v0[12] + 8))(v0[14], v0[11]);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  (*(void (**)(void, void))(v1 + 8))(v0[21], v0[19]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_EC2C8()
{
  uint64_t v2 = v0[20];
  uint64_t v1 = v0[21];
  uint64_t v3 = v0[18];
  uint64_t v4 = v0[19];
  uint64_t v5 = v0[16];
  uint64_t v6 = v0[15];
  (*(void (**)(void, void))(v0[12] + 8))(v0[14], v0[11]);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_EC3F0(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  uint64_t v5 = *(void **)v2;
  *(void *)(*(void *)v2 + 248) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return _swift_task_switch(sub_EC6B8, 0, 0);
  }
  else
  {
    v4[32] = a1;
    uint64_t v6 = (void *)swift_task_alloc();
    v4[33] = v6;
    *uint64_t v6 = v5;
    v6[1] = sub_EC58C;
    uint64_t v7 = v4[21];
    uint64_t v8 = v4[17];
    uint64_t v9 = v4[13];
    uint64_t v10 = v4[3];
    return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)(v10, v7, v8, v9, 0);
  }
}

uint64_t sub_EC58C()
{
  uint64_t v2 = *(void **)(*(void *)v1 + 256);
  *(void *)(*(void *)v1 + 272) = v0;
  swift_task_dealloc();

  if (v0) {
    uint64_t v3 = sub_ECA34;
  }
  else {
    uint64_t v3 = sub_EC7E8;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_EC6B8()
{
  uint64_t v1 = v0[20];
  uint64_t v3 = v0[16];
  uint64_t v2 = v0[17];
  uint64_t v4 = v0[15];
  (*(void (**)(void, void))(v0[12] + 8))(v0[13], v0[11]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  (*(void (**)(void, void))(v1 + 8))(v0[21], v0[19]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_EC7E8()
{
  uint64_t v2 = v0[16];
  uint64_t v1 = v0[17];
  uint64_t v4 = v0[20];
  uint64_t v3 = v0[21];
  uint64_t v5 = v0[19];
  uint64_t v6 = v0[15];
  (*(void (**)(void, void))(v0[12] + 8))(v0[13], v0[11]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_EC910()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[16];
  (*(void (**)(void, void))(v0[12] + 8))(v0[14], v0[11]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  (*(void (**)(void, void))(v0[20] + 8))(v0[21], v0[19]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_ECA34()
{
  uint64_t v2 = v0[16];
  uint64_t v1 = v0[17];
  uint64_t v3 = v0[15];
  (*(void (**)(void, void))(v0[12] + 8))(v0[13], v0[11]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(void, void))(v0[20] + 8))(v0[21], v0[19]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_ECB58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[16] = a2;
  v3[17] = a3;
  v3[15] = a1;
  uint64_t v4 = sub_10EF08();
  v3[18] = v4;
  v3[19] = *(void *)(v4 - 8);
  v3[20] = swift_task_alloc();
  uint64_t v5 = sub_10EEB8();
  v3[21] = v5;
  v3[22] = *(void *)(v5 - 8);
  v3[23] = swift_task_alloc();
  uint64_t v6 = sub_10EE28();
  v3[24] = v6;
  v3[25] = *(void *)(v6 - 8);
  v3[26] = swift_task_alloc();
  v3[27] = swift_task_alloc();
  v3[28] = swift_task_alloc();
  uint64_t v7 = sub_10E0B8();
  v3[29] = v7;
  v3[30] = *(void *)(v7 - 8);
  v3[31] = swift_task_alloc();
  v3[32] = sub_3DD4(&qword_13F848);
  v3[33] = swift_task_alloc();
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  v3[37] = swift_task_alloc();
  v3[38] = swift_task_alloc();
  v3[39] = swift_task_alloc();
  v3[40] = swift_task_alloc();
  v3[41] = swift_task_alloc();
  uint64_t v8 = sub_10F928();
  v3[42] = v8;
  v3[43] = *(void *)(v8 - 8);
  v3[44] = swift_task_alloc();
  v3[45] = swift_task_alloc();
  uint64_t v9 = sub_10EE88();
  v3[46] = v9;
  v3[47] = *(void *)(v9 - 8);
  v3[48] = swift_task_alloc();
  v3[49] = swift_task_alloc();
  return _swift_task_switch(sub_ECEBC, 0, 0);
}

uint64_t sub_ECEBC()
{
  v280 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 4;
  v275 = v0 + 10;
  uint64_t v3 = v0 + 11;
  uint64_t v4 = v0[49];
  uint64_t v5 = v0[47];
  uint64_t v6 = v1[46];
  sub_3DD4(&qword_142BD8);
  uint64_t v7 = (void *)sub_10EC98();
  sub_10EE08();
  int v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 88))(v4, v6);
  v277 = v1;
  if (v8 == enum case for Parse.NLv3IntentOnly(_:))
  {
    v272 = v2;
    uint64_t v9 = v1[49];
    uint64_t v10 = v1[45];
    uint64_t v12 = v1[42];
    uint64_t v11 = v1[43];
    (*(void (**)(uint64_t, void))(v1[47] + 96))(v9, v1[46]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v10, v9, v12);
    if (qword_13F1D0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_110778();
    sub_3E18(v13, (uint64_t)qword_143448);
    id v14 = v7;
    uint64_t v15 = sub_110768();
    os_log_type_t v16 = sub_1109F8();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v278 = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 136315138;
      id v18 = v14;
      id v19 = [v18 description];
      uint64_t v20 = sub_110848();
      unint64_t v22 = v21;

      uint64_t v23 = v20;
      uint64_t v1 = v277;
      uint64_t *v275 = sub_6750(v23, v22, (uint64_t *)&v278);
      sub_110B28();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_0, v15, v16, "Current SK intent: %s", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v33 = v1[44];
    uint64_t v34 = v1[41];
    uint64_t v35 = v1[29];
    uint64_t v36 = v1[30];
    (*(void (**)(uint64_t, void, void))(v1[43] + 16))(v33, v1[45], v1[42]);
    type metadata accessor for AlarmNLIntent();
    swift_allocObject();
    sub_BDBE0(v33);
    sub_C0154(v34);
    Class isa = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35) != 1)
    {
      uint64_t v38 = v1[41];
      uint64_t v39 = v1[29];
      uint64_t v40 = v1[30];
      Class isa = sub_10E038().super.isa;
      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v38, v39);
    }
    [v14 setProposedTime:isa];

    uint64_t v41 = (void *)sub_BF958();
    if (v41)
    {
      uint64_t v42 = sub_10FA28();
      swift_release();
      if (v42)
      {
        sub_12EE4();
        char v43 = sub_10F9A8();
        uint64_t v41 = sub_110AB8(v43 & 1).super.super.isa;
        swift_release();
      }
      else
      {
        uint64_t v41 = 0;
      }
    }
    [v14 setProposedMeridiemSetByUser:v41];

    sub_BC618();
    if (v81)
    {
      NSString v82 = sub_110838();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v82 = 0;
    }
    [v14 setProposedLabel:v82];

    id v83 = v14;
    char v84 = sub_110768();
    os_log_type_t v85 = sub_1109F8();
    if (os_log_type_enabled(v84, v85))
    {
      uint64_t v86 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v278 = swift_slowAlloc();
      *(_DWORD *)uint64_t v86 = 136315138;
      id v87 = v83;
      id v88 = [v87 description];
      uint64_t v89 = sub_110848();
      unint64_t v91 = v90;

      uint64_t v92 = v89;
      uint64_t v1 = v277;
      uint64_t *v272 = sub_6750(v92, v91, (uint64_t *)&v278);
      sub_110B28();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_0, v84, v85, "Updated SK intent: %s", v86, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v93 = v1[45];
    uint64_t v94 = v1[42];
    uint64_t v95 = v1[43];
    uint64_t v96 = v1[15];
    sub_110328();
    long long v278 = 0u;
    long long v279 = 0u;
    sub_10EB38();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v93, v94);
LABEL_38:
    uint64_t v97 = sub_3DD4(&qword_143560);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v97 - 8) + 56))(v96, 0, 1, v97);
    goto LABEL_66;
  }
  if (v8 == enum case for Parse.NLv3IntentPlusServerConversion(_:))
  {
    (*(void (**)(void, void))(v1[47] + 96))(v1[49], v1[46]);
    sub_3DD4((uint64_t *)&unk_13F7D0);
    id v269 = (id)sub_10EE78();
    sub_110328();
    int v24 = (void *)swift_dynamicCastClassUnconditional();
    id v25 = [v24 proposedTime];
    uint64_t v26 = v1[39];
    id v273 = v24;
    if (v25)
    {
      uint64_t v27 = v25;
      v264 = v7;
      uint64_t v29 = v1[30];
      uint64_t v28 = v1[31];
      uint64_t v30 = v1[29];
      sub_10E048();

      uint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32);
      v31(v26, v28, v30);
      uint64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56);
      v32(v26, 0, 1, v30);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v26, 1, v30) != 1)
      {
        uint64_t v102 = v1[40];
        uint64_t v103 = v1[29];
        v31(v102, v1[39], v103);
        v32(v102, 0, 1, v103);
        uint64_t v7 = v264;
LABEL_52:
        if (qword_13F1D0 != -1) {
          swift_once();
        }
        uint64_t v118 = v1[40];
        uint64_t v119 = v1[37];
        uint64_t v120 = sub_110778();
        sub_3E18(v120, (uint64_t)qword_143448);
        sub_EF8E4(v118, v119);
        uint64_t v121 = sub_110768();
        os_log_type_t v122 = sub_1109F8();
        BOOL v123 = os_log_type_enabled(v121, v122);
        uint64_t v124 = v1[37];
        if (v123)
        {
          uint64_t v125 = v1[36];
          uint64_t v126 = (uint8_t *)swift_slowAlloc();
          *(void *)&long long v278 = swift_slowAlloc();
          *(_DWORD *)uint64_t v126 = 136315138;
          sub_EF8E4(v124, v125);
          uint64_t v1 = v277;
          uint64_t v127 = sub_110858();
          v277[9] = sub_6750(v127, v128, (uint64_t *)&v278);
          sub_110B28();
          swift_bridgeObjectRelease();
          sub_1646C(v124, &qword_13F848);
          _os_log_impl(&dword_0, v121, v122, "Proposed Time: %s", v126, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          sub_1646C(v124, &qword_13F848);
        }

        id v129 = [v7 alarm];
        v130 = v129;
        if (v129)
        {
          id v131 = [v129 identifier];

          if (v131)
          {
            sub_110848();
          }
        }
        uint64_t v132 = v1[40];
        uint64_t v133 = v1[35];
        uint64_t v134 = v1[30];
        uint64_t v135 = v277[29];
        sub_1104A8();
        id v136 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
        swift_bridgeObjectRetain();
        NSString v137 = sub_110838();
        swift_bridgeObjectRelease();
        NSString v138 = sub_110838();
        id v139 = [v136 initWithIdentifier:v137 displayString:v138];

        sub_12EE4();
        Class v140 = sub_110AC8(1).super.super.isa;
        [v139 setIncludeSleepAlarm:v140];

        swift_bridgeObjectRelease();
        [v7 setAlarmSearch:v139];

        objc_msgSend(v7, "setOperation:", objc_msgSend(v273, "operation"));
        sub_EF8E4(v132, v133);
        uint64_t v141 = v135;
        uint64_t v1 = v277;
        Class v142 = 0;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v134 + 48))(v133, 1, v141) != 1)
        {
          uint64_t v143 = v277[35];
          uint64_t v144 = v277[29];
          uint64_t v145 = v277[30];
          Class v142 = sub_10E038().super.isa;
          (*(void (**)(uint64_t, uint64_t))(v145 + 8))(v143, v144);
        }
        [v7 setProposedTime:v142];

        id v146 = [v273 proposedMeridiemSetByUser];
        [v7 setProposedMeridiemSetByUser:v146];

        id v147 = [v273 proposedLabel];
        [v7 setProposedLabel:v147];

        v148 = v7;
        v149 = sub_110768();
        os_log_type_t v150 = sub_1109F8();
        if (os_log_type_enabled(v149, v150))
        {
          v151 = (uint8_t *)swift_slowAlloc();
          v152 = (void *)swift_slowAlloc();
          *(_DWORD *)v151 = 138412290;
          v277[14] = v148;
          v153 = v148;
          sub_110B28();
          void *v152 = v148;

          uint64_t v1 = v277;
          _os_log_impl(&dword_0, v149, v150, "Updated intent: %@", v151, 0xCu);
          sub_3DD4((uint64_t *)&unk_13F8C0);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          v149 = v148;
        }
        uint64_t v154 = v1[49];
        uint64_t v156 = v1[42];
        uint64_t v155 = v1[43];
        uint64_t v157 = v1[40];
        uint64_t v158 = v1[15];

        long long v278 = 0u;
        long long v279 = 0u;
        sub_10EB38();

        swift_release();
        sub_1646C(v157, &qword_13F848);
        uint64_t v159 = sub_3DD4(&qword_143560);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v159 - 8) + 56))(v158, 0, 1, v159);
        (*(void (**)(uint64_t, uint64_t))(v155 + 8))(v154, v156);
        goto LABEL_66;
      }
      uint64_t v7 = v264;
    }
    else
    {
      uint64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1[30] + 56);
      v32(v26, 1, 1, v1[29]);
    }
    id v98 = [v24 alarmSearch];
    if (v98)
    {
      unint64_t v99 = v98;
      id v100 = [v98 time];

      if (v100)
      {
        sub_10E048();

        uint64_t v101 = 0;
      }
      else
      {
        uint64_t v101 = 1;
      }
      uint64_t v116 = v1[40];
      uint64_t v117 = v1[38];
      v32(v117, v101, 1, v1[29]);
      sub_119F4(v117, v116);
    }
    else
    {
      v32(v1[40], 1, 1, v1[29]);
    }
    sub_1646C(v1[39], &qword_13F848);
    goto LABEL_52;
  }
  if (v8 == enum case for Parse.NLv4IntentOnly(_:))
  {
    (*(void (**)(void, void))(v1[47] + 96))(v1[49], v1[46]);
    swift_getObjectType();
    if (sub_110A38())
    {
      uint64_t v44 = v7;
      sub_110328();
      uint64_t v45 = swift_retain();
      uint64_t v46 = sub_902FC(v45);
      if (v46)
      {
        v262 = v46;
        if (qword_13F1D0 != -1) {
          swift_once();
        }
        uint64_t v47 = v1 + 13;
        uint64_t v48 = sub_110778();
        sub_3E18(v48, (uint64_t)qword_143448);
        id v49 = v44;
        int v50 = sub_110768();
        os_log_type_t v51 = sub_1109F8();
        v261 = v3;
        v265 = v49;
        if (os_log_type_enabled(v50, v51))
        {
          id v52 = (uint8_t *)swift_slowAlloc();
          *(void *)&long long v278 = swift_slowAlloc();
          *(_DWORD *)id v52 = 136315138;
          id v53 = v49;
          id v54 = [v53 description];
          uint64_t v55 = sub_110848();
          unint64_t v57 = v56;

          uint64_t v58 = v55;
          uint64_t v1 = v277;
          *uint64_t v47 = sub_6750(v58, v57, (uint64_t *)&v278);
          sub_110B28();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_0, v50, v51, "Current SK intent: %s", v52, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        v177 = v1 + 12;
        v178 = v262;
        v179 = sub_110768();
        os_log_type_t v180 = sub_1109F8();
        if (os_log_type_enabled(v179, v180))
        {
          v181 = (uint8_t *)swift_slowAlloc();
          *(void *)&long long v278 = swift_slowAlloc();
          *(_DWORD *)v181 = 136315138;
          v182 = v178;
          id v183 = [v182 description];
          uint64_t v184 = sub_110848();
          v185 = v178;
          unint64_t v187 = v186;

          uint64_t v1 = v277;
          uint64_t *v177 = sub_6750(v184, v187, (uint64_t *)&v278);
          sub_110B28();
          v178 = v185;
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_0, v179, v180, "This turn of updateAlarmIntent: %s", v181, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        id v188 = [v178 proposedTime];
        uint64_t v189 = v1[34];
        if (v188)
        {
          v190 = v188;
          uint64_t v192 = v1[30];
          uint64_t v191 = v1[31];
          uint64_t v193 = v1[29];
          sub_10E048();

          (*(void (**)(uint64_t, uint64_t, uint64_t))(v192 + 32))(v189, v191, v193);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v192 + 56))(v189, 0, 1, v193);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v192 + 48))(v189, 1, v193) == 1)
          {
            Class v194 = 0;
          }
          else
          {
            uint64_t v195 = v1[34];
            uint64_t v196 = v1[29];
            uint64_t v197 = v1[30];
            Class v194 = sub_10E038().super.isa;
            (*(void (**)(uint64_t, uint64_t))(v197 + 8))(v195, v196);
          }
        }
        else
        {
          (*(void (**)(void, uint64_t, uint64_t, void))(v1[30] + 56))(v1[34], 1, 1, v1[29]);
          Class v194 = 0;
        }
        [v265 setProposedTime:v194];

        id v198 = [v178 proposedMeridiemSetByUser];
        [v265 setProposedMeridiemSetByUser:v198];

        id v199 = [v178 proposedLabel];
        [v265 setProposedLabel:v199];

        id v200 = v265;
        v201 = sub_110768();
        os_log_type_t v202 = sub_1109F8();
        if (os_log_type_enabled(v201, v202))
        {
          v203 = (uint8_t *)swift_slowAlloc();
          *(void *)&long long v278 = swift_slowAlloc();
          *(_DWORD *)v203 = 136315138;
          id v204 = v200;
          v205 = v178;
          id v206 = [v204 description];
          uint64_t v207 = sub_110848();
          unint64_t v209 = v208;

          v178 = v205;
          uint64_t *v261 = sub_6750(v207, v209, (uint64_t *)&v278);
          sub_110B28();
          uint64_t v1 = v277;
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_0, v201, v202, "Updated SK intent: %s", v203, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        uint64_t v210 = v1[15];
        long long v278 = 0u;
        long long v279 = 0u;
        sub_10EB38();
        swift_release();

        swift_unknownObjectRelease();
        uint64_t v211 = sub_3DD4(&qword_143560);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v211 - 8) + 56))(v210, 0, 1, v211);
        goto LABEL_66;
      }
      swift_release();
    }
    v267 = v7;
    if (qword_13F1D0 != -1) {
      swift_once();
    }
    uint64_t v165 = v1[28];
    uint64_t v166 = v1[24];
    uint64_t v167 = v1[25];
    uint64_t v168 = v1[16];
    uint64_t v169 = sub_110778();
    sub_3E18(v169, (uint64_t)qword_143448);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v167 + 16))(v165, v168, v166);
    v170 = sub_110768();
    os_log_type_t v171 = sub_1109E8();
    if (os_log_type_enabled(v170, v171))
    {
      uint64_t v172 = v1[28];
      uint64_t v173 = v1[25];
      uint64_t v263 = v1[24];
      v174 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v278 = swift_slowAlloc();
      *(_DWORD *)v174 = 136315138;
      sub_10EE08();
      uint64_t v175 = sub_110858();
      v1[2] = sub_6750(v175, v176, (uint64_t *)&v278);
      sub_110B28();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v173 + 8))(v172, v263);
      _os_log_impl(&dword_0, v170, v171, "Failed to parse userDialogAct to UpdateAlarmIntent: %s", v174, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(void, void))(v1[25] + 8))(v1[28], v1[24]);
    }

    *((unsigned char *)v1 + 400) = 0;
    sub_3DD4(&qword_1401F0);
    sub_425E8();
    swift_allocError();
    sub_10FF38();
    swift_willThrow();

    swift_unknownObjectRelease();
  }
  else
  {
    if (v8 == enum case for Parse.uso(_:))
    {
      uint64_t v59 = v1[49];
      uint64_t v61 = v1[22];
      uint64_t v60 = v1[23];
      uint64_t v63 = v1[20];
      uint64_t v62 = v1[21];
      uint64_t v65 = v1[18];
      uint64_t v64 = v1[19];
      (*(void (**)(uint64_t, void))(v1[47] + 96))(v59, v1[46]);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 32))(v60, v59, v62);
      sub_10EEA8();
      uint64_t v66 = sub_10EEE8();
      (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v63, v65);
      if (v66)
      {
        sub_110328();
        uint64_t v67 = swift_retain();
        id v68 = sub_902FC(v67);
        if (v68)
        {
          uint64_t v69 = v68;
          if (qword_13F1D0 != -1) {
            swift_once();
          }
          id v70 = v1 + 8;
          uint64_t v71 = sub_110778();
          sub_3E18(v71, (uint64_t)qword_143448);
          id v270 = v7;
          uint64_t v72 = sub_110768();
          os_log_type_t v73 = sub_1109F8();
          v276 = v1 + 6;
          if (os_log_type_enabled(v72, v73))
          {
            uint64_t v74 = (uint8_t *)swift_slowAlloc();
            *(void *)&long long v278 = swift_slowAlloc();
            *(_DWORD *)uint64_t v74 = 136315138;
            id v75 = v270;
            id v76 = [v75 description];
            uint64_t v77 = sub_110848();
            unint64_t v79 = v78;

            uint64_t v80 = v77;
            uint64_t v1 = v277;
            *id v70 = sub_6750(v80, v79, (uint64_t *)&v278);
            sub_110B28();
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_0, v72, v73, "Current SK intent: %s", v74, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
          }
          v224 = v1 + 7;
          v225 = v69;
          v226 = sub_110768();
          os_log_type_t v227 = sub_1109F8();
          if (os_log_type_enabled(v226, v227))
          {
            v228 = (uint8_t *)swift_slowAlloc();
            *(void *)&long long v278 = swift_slowAlloc();
            *(_DWORD *)v228 = 136315138;
            v229 = v225;
            v230 = v224;
            id v231 = [v229 description];
            uint64_t v232 = sub_110848();
            v233 = v225;
            unint64_t v235 = v234;

            uint64_t *v230 = sub_6750(v232, v235, (uint64_t *)&v278);
            sub_110B28();
            v225 = v233;
            swift_bridgeObjectRelease();

            uint64_t v1 = v277;
            _os_log_impl(&dword_0, v226, v227, "This turn of updateAlarmIntent: %s", v228, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
          }
          id v236 = [v225 proposedTime];
          uint64_t v237 = v1[33];
          if (v236)
          {
            v238 = v236;
            uint64_t v240 = v1[30];
            uint64_t v239 = v1[31];
            uint64_t v241 = v1[29];
            sub_10E048();

            (*(void (**)(uint64_t, uint64_t, uint64_t))(v240 + 32))(v237, v239, v241);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v240 + 56))(v237, 0, 1, v241);
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v240 + 48))(v237, 1, v241) == 1)
            {
              Class v242 = 0;
            }
            else
            {
              uint64_t v243 = v1[33];
              uint64_t v244 = v1[29];
              uint64_t v245 = v1[30];
              Class v242 = sub_10E038().super.isa;
              (*(void (**)(uint64_t, uint64_t))(v245 + 8))(v243, v244);
            }
          }
          else
          {
            (*(void (**)(void, uint64_t, uint64_t, void))(v1[30] + 56))(v1[33], 1, 1, v1[29]);
            Class v242 = 0;
          }
          [v270 setProposedTime:v242];

          id v246 = [v225 proposedMeridiemSetByUser];
          [v270 setProposedMeridiemSetByUser:v246];

          id v247 = [v225 proposedLabel];
          [v270 setProposedLabel:v247];

          id v248 = v270;
          v249 = sub_110768();
          os_log_type_t v250 = sub_1109F8();
          if (os_log_type_enabled(v249, v250))
          {
            v251 = (uint8_t *)swift_slowAlloc();
            *(void *)&long long v278 = swift_slowAlloc();
            *(_DWORD *)v251 = 136315138;
            id v252 = v248;
            id v253 = [v252 description];
            uint64_t v254 = sub_110848();
            v255 = v225;
            unint64_t v257 = v256;

            uint64_t v1 = v277;
            uint64_t *v276 = sub_6750(v254, v257, (uint64_t *)&v278);
            sub_110B28();
            v225 = v255;
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_0, v249, v250, "Updated SK intent: %s", v251, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
          }
          uint64_t v259 = v1[22];
          uint64_t v258 = v1[23];
          uint64_t v260 = v1[21];
          uint64_t v96 = v1[15];
          long long v278 = 0u;
          long long v279 = 0u;
          sub_10EB38();

          swift_release();
          (*(void (**)(uint64_t, uint64_t))(v259 + 8))(v258, v260);
          goto LABEL_38;
        }
        swift_release();
      }
      v268 = v7;
      if (qword_13F1D0 != -1) {
        swift_once();
      }
      uint64_t v212 = v1[27];
      uint64_t v213 = v1[24];
      uint64_t v214 = v1[25];
      uint64_t v215 = v1[16];
      uint64_t v216 = sub_110778();
      sub_3E18(v216, (uint64_t)qword_143448);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v214 + 16))(v212, v215, v213);
      v217 = sub_110768();
      os_log_type_t v218 = sub_1109E8();
      if (os_log_type_enabled(v217, v218))
      {
        uint64_t v219 = v1[27];
        uint64_t v220 = v1[25];
        id v274 = (id)v1[24];
        v221 = (uint8_t *)swift_slowAlloc();
        *(void *)&long long v278 = swift_slowAlloc();
        *(_DWORD *)v221 = 136315138;
        sub_10EE08();
        uint64_t v222 = sub_110858();
        v1[5] = sub_6750(v222, v223, (uint64_t *)&v278);
        sub_110B28();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, id))(v220 + 8))(v219, v274);
        _os_log_impl(&dword_0, v217, v218, "Failed to parse userDialogAct to UpdateAlarmIntent: %s", v221, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(void, void))(v1[25] + 8))(v1[27], v1[24]);
      }

      uint64_t v163 = v1[22];
      uint64_t v162 = v1[23];
      uint64_t v164 = v1[21];
      *((unsigned char *)v1 + 401) = 0;
      sub_3DD4(&qword_1401F0);
      sub_425E8();
      swift_allocError();
      sub_10FF38();
      swift_willThrow();
    }
    else
    {
      if (qword_13F1D0 != -1) {
        swift_once();
      }
      uint64_t v105 = v1[25];
      uint64_t v104 = v1[26];
      uint64_t v106 = v1[24];
      uint64_t v107 = v1[16];
      uint64_t v108 = sub_110778();
      sub_3E18(v108, (uint64_t)qword_143448);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v105 + 16))(v104, v107, v106);
      v109 = sub_110768();
      os_log_type_t v110 = sub_1109E8();
      if (os_log_type_enabled(v109, v110))
      {
        uint64_t v112 = v1[25];
        uint64_t v111 = v1[26];
        id v271 = (id)v1[24];
        v266 = v7;
        v113 = (uint8_t *)swift_slowAlloc();
        *(void *)&long long v278 = swift_slowAlloc();
        *(_DWORD *)v113 = 136315138;
        sub_10EE08();
        uint64_t v114 = sub_110858();
        v1[3] = sub_6750(v114, v115, (uint64_t *)&v278);
        sub_110B28();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, id))(v112 + 8))(v111, v271);
        _os_log_impl(&dword_0, v109, v110, "Received an unsupported input: %s", v113, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v7 = v266;
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(void, void))(v1[25] + 8))(v1[26], v1[24]);
      }

      uint64_t v162 = v1[49];
      uint64_t v164 = v1[46];
      uint64_t v163 = v1[47];
      *((unsigned char *)v1 + 402) = 0;
      sub_3DD4(&qword_1401F0);
      sub_425E8();
      swift_allocError();
      sub_10FF38();
      swift_willThrow();
    }
    (*(void (**)(uint64_t, uint64_t))(v163 + 8))(v162, v164);
  }
LABEL_66:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v160 = (uint64_t (*)(void))v1[1];
  return v160();
}

uint64_t _s18NeedsValueStrategyCMa_0()
{
  return self;
}

uint64_t sub_EF3DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_EB374(a1, a2);
}

uint64_t sub_EF3F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_13024;
  return sub_ECB58(a1, a2, a3);
}

uint64_t sub_EF4A4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_33C04;
  return sub_EB5F4(a1, a2);
}

uint64_t sub_EF544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = _s18NeedsValueStrategyCMa_0();
  *int v8 = v4;
  v8[1] = sub_13024;
  return NeedsValueFlowStrategyAsync.makeRepromptOnEmptyParse(resolveRecord:)(a1, a2, v9, a4);
}

uint64_t sub_EF608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = _s18NeedsValueStrategyCMa_0();
  *int v8 = v4;
  v8[1] = sub_13024;
  return NeedsValueFlowStrategyAsync.makeRepromptOnLowConfidence(resolveRecord:)(a1, a2, v9, a4);
}

uint64_t sub_EF6CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v12;
  uint64_t v13 = _s18NeedsValueStrategyCMa_0();
  *uint64_t v12 = v6;
  v12[1] = sub_13024;
  return ParameterResolutionHandlingAsync.makeFlowCancelledResponse(app:intent:parameter:)(a1, a2, a3, a4, v13, a6);
}

uint64_t sub_EF7A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v14 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v14;
  uint64_t v15 = _s18NeedsValueStrategyCMa_0();
  void *v14 = v7;
  v14[1] = sub_13024;
  return ParameterResolutionHandlingAsync.makeErrorResponse(error:app:intent:parameter:)(a1, a2, a3, a4, a5, v15, a7);
}

unint64_t sub_EF890()
{
  unint64_t result = qword_143538[0];
  if (!qword_143538[0])
  {
    _s18NeedsValueStrategyCMa_0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_143538);
  }
  return result;
}

uint64_t sub_EF8E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3DD4(&qword_13F848);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for AlarmBaseCATPatternsExecutor(uint64_t a1)
{
  return sub_19B4C(a1, (uint64_t *)&unk_143568);
}

uint64_t sub_EF96C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_EF9AC()
{
  uint64_t v1 = sub_3DD4(&qword_13FA88);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3DD4(&qword_13FC38);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_114430;
  *(void *)(v4 + 32) = 7368801;
  *(void *)(v4 + 40) = 0xE300000000000000;
  uint64_t v5 = *v0;
  if (*v0)
  {
    uint64_t v6 = sub_10FB68();
    uint64_t v7 = v5;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    *(void *)(v4 + 56) = 0;
    *(void *)(v4 + 64) = 0;
  }
  *(void *)(v4 + 48) = v7;
  *(void *)(v4 + 72) = v6;
  *(void *)(v4 + 80) = 0x6E69577473726966;
  *(void *)(v4 + 88) = 0xEF657A6953776F64;
  if (v0[2])
  {
    int v8 = 0;
    *(void *)(v4 + 104) = 0;
    *(void *)(v4 + 112) = 0;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = v0[1];
    int v8 = &type metadata for Double;
  }
  *(void *)(v4 + 96) = v9;
  *(void *)(v4 + 120) = v8;
  strcpy((char *)(v4 + 128), "isConclusion");
  *(unsigned char *)(v4 + 141) = 0;
  *(_WORD *)(v4 + 142) = -5120;
  *(unsigned char *)(v4 + 144) = *((unsigned char *)v0 + 17);
  *(void *)(v4 + 168) = &type metadata for Bool;
  strcpy((char *)(v4 + 176), "isFirstWindow");
  *(_WORD *)(v4 + 190) = -4864;
  *(unsigned char *)(v4 + 192) = *((unsigned char *)v0 + 18);
  *(void *)(v4 + 216) = &type metadata for Bool;
  strcpy((char *)(v4 + 224), "isLastWindow");
  *(unsigned char *)(v4 + 237) = 0;
  *(_WORD *)(v4 + 238) = -5120;
  *(unsigned char *)(v4 + 240) = *((unsigned char *)v0 + 19);
  *(void *)(v4 + 264) = &type metadata for Bool;
  *(void *)(v4 + 272) = 0xD000000000000016;
  *(void *)(v4 + 280) = 0x8000000000116800;
  *(unsigned char *)(v4 + 288) = *((unsigned char *)v0 + 20);
  *(void *)(v4 + 312) = &type metadata for Bool;
  *(void *)(v4 + 320) = 0x6D6F727065527369;
  *(void *)(v4 + 328) = 0xEA00000000007470;
  *(unsigned char *)(v4 + 336) = *((unsigned char *)v0 + 21);
  *(void *)(v4 + 360) = &type metadata for Bool;
  *(void *)(v4 + 368) = 0x736D657469;
  *(void *)(v4 + 376) = 0xE500000000000000;
  uint64_t v10 = v0[3];
  uint64_t v11 = sub_3DD4(&qword_13FD88);
  *(void *)(v4 + 384) = v10;
  *(void *)(v4 + 408) = v11;
  *(void *)(v4 + 416) = 0xD000000000000013;
  *(void *)(v4 + 424) = 0x8000000000116820;
  if (v0[5])
  {
    uint64_t v12 = 0;
    *(void *)(v4 + 440) = 0;
    *(void *)(v4 + 448) = 0;
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = v0[4];
    uint64_t v12 = &type metadata for Double;
  }
  *(void *)(v4 + 432) = v13;
  *(void *)(v4 + 456) = v12;
  *(void *)(v4 + 464) = 0x6574496C61746F74;
  *(void *)(v4 + 472) = 0xEA0000000000736DLL;
  if (v0[7])
  {
    id v14 = 0;
    *(void *)(v4 + 488) = 0;
    *(void *)(v4 + 496) = 0;
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = v0[6];
    id v14 = &type metadata for Double;
  }
  *(void *)(v4 + 480) = v15;
  *(void *)(v4 + 504) = v14;
  *(void *)(v4 + 512) = 0xD000000000000018;
  *(void *)(v4 + 520) = 0x8000000000117560;
  uint64_t v16 = type metadata accessor for AlarmBaseDisambiguationParameters(0);
  sub_AFBC((uint64_t)v0 + *(int *)(v16 + 56), (uint64_t)v3, &qword_13FA88);
  uint64_t v17 = sub_10FBC8();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v3, 1, v17) == 1)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    sub_1646C((uint64_t)v3, &qword_13FA88);
    *(_OWORD *)(v4 + 528) = 0u;
    *(_OWORD *)(v4 + 544) = 0u;
  }
  else
  {
    *(void *)(v4 + 552) = v17;
    id v19 = sub_31294((uint64_t *)(v4 + 528));
    (*(void (**)(uint64_t *, char *, uint64_t))(v18 + 32))(v19, v3, v17);
    swift_retain();
    swift_bridgeObjectRetain();
  }
  *(void *)(v4 + 560) = 0x6953776F646E6977;
  *(void *)(v4 + 568) = 0xEA0000000000657ALL;
  uint64_t v20 = (uint64_t *)((char *)v0 + *(int *)(v16 + 60));
  if (v20[1])
  {
    unint64_t v21 = 0;
    *(_OWORD *)(v4 + 584) = 0u;
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = *v20;
    unint64_t v21 = &type metadata for Double;
  }
  *(void *)(v4 + 576) = v22;
  *(void *)(v4 + 600) = v21;
  return v4;
}

uint64_t sub_EFDD8()
{
  uint64_t v1 = sub_3DD4(&qword_13FA88);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v18 - v5;
  sub_3DD4(&qword_13FC38);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_112980;
  int v8 = (uint64_t *)(v7 + 48);
  *(void *)(v7 + 32) = 0xD000000000000010;
  *(void *)(v7 + 40) = 0x8000000000115AC0;
  sub_AFBC(v0, (uint64_t)v6, &qword_13FA88);
  uint64_t v9 = sub_10FBC8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v6, 1, v9) == 1)
  {
    sub_1646C((uint64_t)v6, &qword_13FA88);
    *(_OWORD *)int v8 = 0u;
    *(_OWORD *)(v7 + 64) = 0u;
  }
  else
  {
    *(void *)(v7 + 72) = v9;
    uint64_t v12 = sub_31294(v8);
    (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 32))(v12, v6, v9);
  }
  *(void *)(v7 + 80) = 0xD000000000000014;
  *(void *)(v7 + 88) = 0x8000000000116060;
  uint64_t v13 = type metadata accessor for AlarmBaseAppNotInstalledPromptInstallParameters(0);
  sub_AFBC(v0 + *(int *)(v13 + 20), (uint64_t)v4, &qword_13FA88);
  if (v11(v4, 1, v9) == 1)
  {
    sub_1646C((uint64_t)v4, &qword_13FA88);
    *(_OWORD *)(v7 + 96) = 0u;
    *(_OWORD *)(v7 + 112) = 0u;
  }
  else
  {
    *(void *)(v7 + 120) = v9;
    id v14 = sub_31294((uint64_t *)(v7 + 96));
    (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 32))(v14, v4, v9);
  }
  *(void *)(v7 + 128) = 0x656369766564;
  *(void *)(v7 + 136) = 0xE600000000000000;
  uint64_t v15 = *(void *)(v0 + *(int *)(v13 + 24));
  if (v15)
  {
    uint64_t v16 = sub_10FC18();
  }
  else
  {
    uint64_t v16 = 0;
    *(void *)(v7 + 152) = 0;
    *(void *)(v7 + 160) = 0;
  }
  *(void *)(v7 + 144) = v15;
  *(void *)(v7 + 168) = v16;
  swift_retain();
  return v7;
}

uint64_t sub_F0068(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_3DD4(&qword_13FA88);
  v2[4] = swift_task_alloc();
  v2[5] = swift_task_alloc();
  v2[6] = type metadata accessor for AlarmBaseAppNotInstalledFallbackToSleepParameters(0);
  v2[7] = swift_task_alloc();
  return _swift_task_switch(sub_F013C, 0, 0);
}

uint64_t sub_F013C()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  uint64_t v19 = v0[4];
  uint64_t v4 = (void *)v0[3];
  uint64_t v5 = sub_10FBC8();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(v1, 1, 1, v5);
  uint64_t v7 = *(int *)(v2 + 20);
  *(void *)(v1 + v7) = 0;
  sub_17BD8(v4, v4[3]);
  sub_110168();
  sub_33F10(v3, v1);
  sub_17BD8(v4, v4[3]);
  uint64_t v8 = sub_110178();
  swift_release();
  *(void *)(v1 + v7) = v8;
  uint64_t v9 = v6;
  sub_3DD4(&qword_13FC38);
  uint64_t v10 = swift_allocObject();
  v0[8] = v10;
  *(_OWORD *)(v10 + 16) = xmmword_112860;
  uint64_t v11 = (uint64_t *)(v10 + 48);
  *(void *)(v10 + 32) = 0xD000000000000014;
  *(void *)(v10 + 40) = 0x8000000000116060;
  sub_AFBC(v1, v19, &qword_13FA88);
  int v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v19, 1, v5);
  uint64_t v13 = v0[4];
  if (v12 == 1)
  {
    sub_1646C(v0[4], &qword_13FA88);
    *(_OWORD *)uint64_t v11 = 0u;
    *(_OWORD *)(v10 + 64) = 0u;
  }
  else
  {
    *(void *)(v10 + 72) = v5;
    id v14 = sub_31294(v11);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v9 + 32))(v14, v13, v5);
  }
  *(void *)(v10 + 80) = 0x656369766564;
  *(void *)(v10 + 88) = 0xE600000000000000;
  uint64_t v15 = *(void *)(v1 + v7);
  if (v15)
  {
    uint64_t v16 = sub_10FC18();
  }
  else
  {
    uint64_t v16 = 0;
    *(void *)(v10 + 104) = 0;
    *(void *)(v10 + 112) = 0;
  }
  *(void *)(v10 + 96) = v15;
  *(void *)(v10 + 120) = v16;
  uint64_t v20 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                            + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  swift_retain();
  uint64_t v17 = (void *)swift_task_alloc();
  v0[9] = v17;
  *uint64_t v17 = v0;
  v17[1] = sub_F0408;
  return v20(0xD000000000000028, 0x8000000000117580, v10);
}

uint64_t sub_F0408(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 80) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = sub_F05F8;
  }
  else
  {
    *(void *)(v4 + 88) = a1;
    uint64_t v5 = sub_F0554;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_F0554()
{
  sub_F31DC(v0[7], type metadata accessor for AlarmBaseAppNotInstalledFallbackToSleepParameters);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[11];
  return v1(v2);
}

uint64_t sub_F05F8()
{
  sub_F31DC(*(void *)(v0 + 56), type metadata accessor for AlarmBaseAppNotInstalledFallbackToSleepParameters);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_F0698(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v3[5] = type metadata accessor for AlarmBaseAppNotInstalledPromptInstallParameters(0);
  v3[6] = swift_task_alloc();
  return _swift_task_switch(sub_F0730, 0, 0);
}

uint64_t sub_F0730()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = (void (*)(uint64_t))v0[2];
  uint64_t v4 = sub_10FBC8();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  v5(v1, 1, 1, v4);
  v5(v1 + *(int *)(v2 + 20), 1, 1, v4);
  *(void *)(v1 + *(int *)(v2 + 24)) = 0;
  v3(v1);
  uint64_t v6 = sub_EFDD8();
  v0[7] = v6;
  uint64_t v9 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                           + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  uint64_t v7 = (void *)swift_task_alloc();
  v0[8] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_F0898;
  return v9(0xD000000000000026, 0x8000000000117530, v6);
}

uint64_t sub_F0898(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 72) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = sub_F0A6C;
  }
  else
  {
    *(void *)(v4 + 80) = a1;
    uint64_t v5 = sub_F09E4;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_F09E4()
{
  sub_F31DC(v0[6], type metadata accessor for AlarmBaseAppNotInstalledPromptInstallParameters);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[10];
  return v1(v2);
}

uint64_t sub_F0A6C()
{
  sub_F31DC(*(void *)(v0 + 48), type metadata accessor for AlarmBaseAppNotInstalledPromptInstallParameters);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_F0AF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FC68();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3DD4((uint64_t *)&unk_13F780);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  sub_AFBC(a1, (uint64_t)v10, (uint64_t *)&unk_13F780);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = sub_10FB18();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_1646C(a1, (uint64_t *)&unk_13F780);
  return v11;
}

uint64_t sub_F0C88()
{
  return type metadata accessor for AlarmBaseCATPatternsExecutor(0);
}

uint64_t type metadata accessor for AlarmBaseAppNotInstalledPromptInstallParameters(uint64_t a1)
{
  return sub_19B4C(a1, qword_1436D0);
}

uint64_t type metadata accessor for AlarmBaseDisambiguationParameters(uint64_t a1)
{
  return sub_19B4C(a1, qword_143618);
}

uint64_t sub_F0CD0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = v4 + ((v3 + 16) & ~(unint64_t)v3);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    *(void *)(a1 + 8) = a2[1];
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(_DWORD *)(a1 + 17) = *(_DWORD *)((char *)a2 + 17);
    *(unsigned char *)(a1 + 21) = *((unsigned char *)a2 + 21);
    uint64_t v8 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v8;
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
    *(void *)(a1 + 48) = a2[6];
    uint64_t v9 = *(int *)(a3 + 56);
    __dst = (void *)(a1 + v9);
    uint64_t v10 = (char *)a2 + v9;
    uint64_t v11 = sub_10FBC8();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
    swift_retain();
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = sub_3DD4(&qword_13FA88);
      memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v15 = *(int *)(a3 + 60);
    uint64_t v16 = v7 + v15;
    uint64_t v17 = (uint64_t)a2 + v15;
    *(void *)uint64_t v16 = *(void *)v17;
    *(unsigned char *)(v16 + 8) = *(unsigned char *)(v17 + 8);
  }
  return v7;
}

uint64_t sub_F0EC4(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 56);
  uint64_t v5 = sub_10FBC8();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t sub_F0F9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 17) = *(_DWORD *)(a2 + 17);
  *(unsigned char *)(a1 + 21) = *(unsigned char *)(a2 + 21);
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = v7;
  uint64_t v8 = *(int *)(a3 + 56);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_10FBC8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  swift_retain();
  swift_bridgeObjectRetain();
  if (v13(v10, 1, v11))
  {
    uint64_t v14 = sub_3DD4(&qword_13FA88);
    memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v15 = *(int *)(a3 + 60);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  *(void *)uint64_t v16 = *(void *)v17;
  *(unsigned char *)(v16 + 8) = *(unsigned char *)(v17 + 8);
  return a1;
}

uint64_t sub_F1138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  uint64_t v6 = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  *(unsigned char *)(a1 + 19) = *(unsigned char *)(a2 + 19);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(unsigned char *)(a1 + 21) = *(unsigned char *)(a2 + 21);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v7;
  uint64_t v8 = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = v8;
  uint64_t v9 = *(int *)(a3 + 56);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = sub_10FBC8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 24))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = sub_3DD4(&qword_13FA88);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  uint64_t v18 = *(int *)(a3 + 60);
  uint64_t v19 = a1 + v18;
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v21 = *v20;
  *(unsigned char *)(v19 + 8) = *((unsigned char *)v20 + 8);
  *(void *)uint64_t v19 = v21;
  return a1;
}

uint64_t sub_F135C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 17) = *(_DWORD *)(a2 + 17);
  *(unsigned char *)(a1 + 21) = *(unsigned char *)(a2 + 21);
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = v8;
  uint64_t v9 = *(int *)(a3 + 56);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = sub_10FBC8();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = sub_3DD4(&qword_13FA88);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  uint64_t v15 = *(int *)(a3 + 60);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  *(void *)uint64_t v16 = *(void *)v17;
  *(unsigned char *)(v16 + 8) = *(unsigned char *)(v17 + 8);
  return a1;
}

uint64_t sub_F14D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  *(unsigned char *)(a1 + 19) = *(unsigned char *)(a2 + 19);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(unsigned char *)(a1 + 21) = *(unsigned char *)(a2 + 21);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v6 = *(int *)(a3 + 56);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_10FBC8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = sub_3DD4(&qword_13FA88);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 60);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  *(void *)uint64_t v16 = *(void *)v17;
  *(unsigned char *)(v16 + 8) = *(unsigned char *)(v17 + 8);
  return a1;
}

uint64_t sub_F16E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_F16FC);
}

uint64_t sub_F16FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_3DD4(&qword_13FA88);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 56);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_F17B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_F17C4);
}

uint64_t sub_F17C4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_3DD4(&qword_13FA88);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 56);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_F1870()
{
  sub_37BC4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_F1934(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_10FBC8();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48);
    if (v9(a2, 1, v7))
    {
      uint64_t v10 = sub_3DD4(&qword_13FA88);
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v12 = *(int *)(a3 + 20);
    int v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    if (v9((uint64_t *)((char *)a2 + v12), 1, v7))
    {
      uint64_t v15 = sub_3DD4(&qword_13FA88);
      memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v14, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v13, 0, 1, v7);
    }
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
  }
  swift_retain();
  return a1;
}

uint64_t sub_F1B58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FBC8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v6(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 20);
  if (!v6(v7, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
  }

  return swift_release();
}

char *sub_F1C74(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10FBC8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    uint64_t v9 = sub_3DD4(&qword_13FA88);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  if (v8(&a2[v10], 1, v6))
  {
    uint64_t v13 = sub_3DD4(&qword_13FA88);
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v12, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  swift_retain();
  return a1;
}

char *sub_F1E4C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10FBC8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = sub_3DD4(&qword_13FA88);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  int v15 = v8(&a1[v12], 1, v6);
  int v16 = v8(v14, 1, v6);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(v13, v14, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    uint64_t v17 = sub_3DD4(&qword_13FA88);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v14, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
LABEL_13:
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  swift_retain();
  swift_release();
  return a1;
}

char *sub_F20EC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10FBC8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    uint64_t v9 = sub_3DD4(&qword_13FA88);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  if (v8(&a2[v10], 1, v6))
  {
    uint64_t v13 = sub_3DD4(&qword_13FA88);
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v12, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  return a1;
}

char *sub_F22C0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10FBC8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = sub_3DD4(&qword_13FA88);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  int v15 = v8(&a1[v12], 1, v6);
  int v16 = v8(v14, 1, v6);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(v13, v14, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    uint64_t v17 = sub_3DD4(&qword_13FA88);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v13, v14, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
LABEL_13:
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  swift_release();
  return a1;
}

uint64_t sub_F2558(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_F256C);
}

uint64_t sub_F256C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_3DD4(&qword_13FA88);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_F263C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_F2650);
}

uint64_t sub_F2650(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_3DD4(&qword_13FA88);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = a2;
  }
  return result;
}

void sub_F2710()
{
  sub_37BC4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_F27A8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_10FBC8();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_3DD4(&qword_13FA88);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_F2920(uint64_t a1)
{
  uint64_t v2 = sub_10FBC8();
  uint64_t v3 = *(void *)(v2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  }

  return swift_release();
}

char *sub_F29EC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10FBC8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_3DD4(&qword_13FA88);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_retain();
  return a1;
}

char *sub_F2B18(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10FBC8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = sub_3DD4(&qword_13FA88);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_retain();
  swift_release();
  return a1;
}

char *sub_F2CB4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10FBC8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_3DD4(&qword_13FA88);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_F2DDC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10FBC8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = sub_3DD4(&qword_13FA88);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_release();
  return a1;
}

uint64_t sub_F2F70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_F2F84);
}

uint64_t sub_F2F84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_3DD4(&qword_13FA88);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_F3054(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_F3068);
}

uint64_t sub_F3068(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_3DD4(&qword_13FA88);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  return result;
}

uint64_t type metadata accessor for AlarmBaseAppNotInstalledFallbackToSleepParameters(uint64_t a1)
{
  return sub_19B4C(a1, qword_143768);
}

void sub_F3148()
{
  sub_37BC4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_F31DC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_F323C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_8B4C8(v2 + *(int *)(a1 + 20), a2);
}

uint64_t sub_F324C(uint64_t a1, uint64_t a2)
{
  return sub_33F10(a1, v2 + *(int *)(a2 + 20));
}

uint64_t (*sub_F3258())()
{
  return nullsub_1;
}

uint64_t sub_F327C()
{
  return swift_retain();
}

uint64_t sub_F3288(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(int *)(a2 + 24);
  uint64_t result = swift_release();
  *(void *)(v2 + v4) = a1;
  return result;
}

uint64_t (*sub_F32C0())()
{
  return nullsub_1;
}

uint64_t sub_F32E4@<X0>(uint64_t a1@<X8>)
{
  return sub_8B4C8(v1, a1);
}

uint64_t sub_F32F0(uint64_t a1)
{
  return sub_33F10(a1, v1);
}

uint64_t (*sub_F32F8())()
{
  return nullsub_1;
}

uint64_t sub_F3318()
{
  return swift_retain();
}

uint64_t sub_F3324(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(int *)(a2 + 20);
  uint64_t result = swift_release();
  *(void *)(v2 + v4) = a1;
  return result;
}

ValueMetadata *type metadata accessor for UnsupportedAppNotInstalledWithSleepFallbackPatternExecutor()
{
  return &type metadata for UnsupportedAppNotInstalledWithSleepFallbackPatternExecutor;
}

uint64_t sub_F336C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FEF8();
  int v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_F33D8(uint64_t a1)
{
  uint64_t v2 = sub_10FEF8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_F343C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FEF8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_F34A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FEF8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_F3504(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FEF8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_F3568(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FEF8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_F35CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_F35E0);
}

uint64_t sub_F35E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FEF8();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_F364C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_F3660);
}

uint64_t sub_F3660(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FEF8();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for UnsupportedAppNotInstalledPatternExecutor()
{
  uint64_t result = qword_143800;
  if (!qword_143800) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_F371C()
{
  uint64_t result = sub_10FEF8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_F37A8(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  sub_10FC68();
  v3[10] = swift_task_alloc();
  return _swift_task_switch(sub_F383C, 0, 0);
}

uint64_t sub_F383C()
{
  uint64_t v9 = v0[9];
  unint64_t v1 = (void (*)(uint64_t *))v0[7];
  uint64_t v2 = type metadata accessor for AlarmBaseAppNotInstalledPromptInstallParameters(0);
  v0[5] = v2;
  v0[6] = sub_F4360(&qword_143850, (void (*)(uint64_t))type metadata accessor for AlarmBaseAppNotInstalledPromptInstallParameters);
  uint64_t v3 = sub_31294(v0 + 2);
  uint64_t v4 = sub_10FBC8();
  uint64_t v5 = *(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  v5((uint64_t *)((char *)v3 + *(int *)(v2 + 20)), 1, 1, v4);
  *(uint64_t *)((char *)v3 + *(int *)(v2 + 24)) = 0;
  v1(v0 + 2);
  type metadata accessor for AlarmBaseCATPatternsExecutor(0);
  sub_10FC48();
  v0[11] = sub_10FB38();
  uint64_t v6 = swift_task_alloc();
  v0[12] = v6;
  *(void *)(v6 + 16) = v0 + 2;
  *(void *)(v6 + 24) = v9;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[13] = (uint64_t)v7;
  *uint64_t v7 = v0;
  v7[1] = sub_F3A1C;
  return sub_F0698((uint64_t)sub_F3F14, v6);
}

uint64_t sub_F3A1C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 112) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_F3BC8;
  }
  else
  {
    swift_release();
    *(void *)(v4 + 120) = a1;
    swift_task_dealloc();
    uint64_t v5 = sub_F3B54;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_F3B54()
{
  _s20HandleIntentStrategyVwxx_1(v0 + 16);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 120);
  return v1(v2);
}

uint64_t sub_F3BC8()
{
  swift_release();
  swift_task_dealloc();
  _s20HandleIntentStrategyVwxx_1(v0 + 16);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_F3C54(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_3DD4(&qword_13FA88);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_17BD8(a2, a2[3]);
  sub_110168();
  uint64_t v7 = type metadata accessor for AlarmBaseAppNotInstalledPromptInstallParameters(0);
  sub_33F10((uint64_t)v6, a1 + *(int *)(v7 + 20));
  sub_17BD8(a2, a2[3]);
  uint64_t v8 = sub_110178();
  uint64_t v9 = *(int *)(v7 + 24);
  swift_release();
  *(void *)(a1 + v9) = v8;
  sub_10FEE8();
  sub_110878();
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_10FBC8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 0, 1, v10);
  return sub_33F10((uint64_t)v6, a1);
}

uint64_t sub_F3DBC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_11D1C;
  return sub_F37A8(a1, a2);
}

uint64_t sub_F3E60(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_143858 + dword_143858);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_61C8C;
  return v7(a1, a2);
}

uint64_t sub_F3F14(uint64_t a1)
{
  return sub_F3C54(a1, *(void **)(v1 + 16));
}

uint64_t sub_F3F1C(uint64_t a1, uint64_t a2)
{
  v2[7] = a1;
  v2[8] = a2;
  sub_10FC68();
  v2[9] = swift_task_alloc();
  return _swift_task_switch(sub_F3FAC, 0, 0);
}

uint64_t sub_F3FAC()
{
  uint64_t v1 = (void (*)(uint64_t *))v0[7];
  uint64_t v2 = type metadata accessor for AlarmBaseAppNotInstalledFallbackToSleepParameters(0);
  v0[5] = v2;
  v0[6] = sub_F4360(&qword_143860, (void (*)(uint64_t))type metadata accessor for AlarmBaseAppNotInstalledFallbackToSleepParameters);
  uint64_t v3 = sub_31294(v0 + 2);
  uint64_t v4 = sub_10FBC8();
  (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(uint64_t *)((char *)v3 + *(int *)(v2 + 20)) = 0;
  v1(v0 + 2);
  type metadata accessor for AlarmBaseCATPatternsExecutor(0);
  sub_10FC48();
  uint64_t v5 = sub_10FB38();
  v0[10] = v5;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t *))((char *)&dword_1437A0 + dword_1437A0);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[11] = (uint64_t)v6;
  *uint64_t v6 = v0;
  v6[1] = sub_F4144;
  return v8(v5, v0 + 2);
}

uint64_t sub_F4144(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 96) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_F42E8;
  }
  else
  {
    swift_release();
    *(void *)(v4 + 104) = a1;
    uint64_t v5 = sub_F4274;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_F4274()
{
  _s20HandleIntentStrategyVwxx_1(v0 + 16);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 104);
  return v1(v2);
}

uint64_t sub_F42E8()
{
  swift_release();
  _s20HandleIntentStrategyVwxx_1(v0 + 16);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_F4360(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_F43A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_F43BC);
}

uint64_t sub_F43BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_3DD4((uint64_t *)&unk_140770);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_F4470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_F4484);
}

uint64_t sub_F4484(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_3DD4((uint64_t *)&unk_140770);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t _s20HandleIntentStrategyVMa_5()
{
  uint64_t result = qword_1438D8;
  if (!qword_1438D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_F457C()
{
  sub_C529C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_F4614()
{
  uint64_t v0 = sub_110778();
  sub_2D924(v0, qword_143868);
  sub_3E18(v0, (uint64_t)qword_143868);
  return sub_1104D8();
}

uint64_t sub_F4660(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  sub_3DD4(&qword_143960);
  v2[9] = swift_task_alloc();
  uint64_t v3 = sub_110718();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  uint64_t v4 = sub_110648();
  v2[13] = v4;
  v2[14] = *(void *)(v4 - 8);
  v2[15] = swift_task_alloc();
  sub_3DD4((uint64_t *)&unk_140770);
  v2[16] = swift_task_alloc();
  sub_3DD4(&qword_143968);
  v2[17] = swift_task_alloc();
  uint64_t v5 = sub_10E198();
  v2[18] = v5;
  v2[19] = *(void *)(v5 - 8);
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  return _swift_task_switch(sub_F4878, 0, 0);
}

uint64_t sub_F4878()
{
  sub_10E768();
  sub_17BD8(v0 + 2, v0[5]);
  sub_10EBD8();
  if (v1)
  {
    uint64_t v2 = v0[18];
    uint64_t v3 = v0[19];
    uint64_t v4 = v0[17];
    _s20HandleIntentStrategyVwxx_1((uint64_t)(v0 + 2));
    sub_10E168();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) == 1)
    {
      sub_1646C(v0[17], &qword_143968);
    }
    else
    {
      uint64_t v5 = v0[16];
      uint64_t v6 = v0[8];
      (*(void (**)(void, void, void))(v0[19] + 32))(v0[21], v0[17], v0[18]);
      uint64_t v7 = _s20HandleIntentStrategyVMa_5();
      sub_5B788(v6 + *(int *)(v7 + 20), v5);
      uint64_t v8 = sub_110088();
      uint64_t v9 = *(void *)(v8 - 8);
      int v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8);
      uint64_t v11 = v0[21];
      if (v10 != 1)
      {
        uint64_t v21 = v0[19];
        uint64_t v30 = v0[20];
        uint64_t v31 = v0[18];
        uint64_t v23 = (uint64_t *)v0[15];
        uint64_t v22 = v0[16];
        uint64_t v24 = v0[14];
        uint64_t v35 = v0[13];
        uint64_t v25 = v0[11];
        uint64_t v32 = v0[12];
        uint64_t v33 = v0[10];
        uint64_t v34 = v0[9];
        uint64_t v36 = (uint64_t *)v0[7];
        uint64_t v26 = (void *)sub_110078();
        (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v22, v8);
        sub_1106E8();
        sub_1106D8();
        sub_3DD4(&qword_143980);
        sub_3DD4(&qword_1401E8);
        uint64_t v27 = swift_allocObject();
        *(_OWORD *)(v27 + 16) = xmmword_111BF0;
        *(void *)(v27 + 32) = v26;
        uint64_t v37 = v27;
        sub_110928();
        *uint64_t v23 = v37;
        v23[1] = 0;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v30, v11, v31);
        (*(void (**)(uint64_t, void, uint64_t))(v25 + 104))(v32, enum case for ExecutionInfo.Action.alarmSnooze(_:), v33);
        uint64_t v28 = sub_110708();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v34, 1, 1, v28);
        id v29 = v26;
        sub_1106F8();
        (*(void (**)(uint64_t *, void, uint64_t))(v24 + 104))(v23, enum case for CrossDeviceCommandExecution.started(_:), v35);
        sub_1106C8();
        swift_release();
        (*(void (**)(uint64_t *, uint64_t))(v24 + 8))(v23, v35);
        v36[3] = sub_10EED8();
        v36[4] = (uint64_t)&protocol witness table for AceOutput;
        sub_31294(v36);
        sub_10EEC8();

        (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v11, v31);
        goto LABEL_12;
      }
      uint64_t v13 = v0[18];
      uint64_t v12 = v0[19];
      sub_1646C(v0[16], (uint64_t *)&unk_140770);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    }
  }
  else
  {
    _s20HandleIntentStrategyVwxx_1((uint64_t)(v0 + 2));
  }
  if (qword_13F1D8 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_110778();
  sub_3E18(v14, (uint64_t)qword_143868);
  int v15 = sub_110768();
  os_log_type_t v16 = sub_1109F8();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_0, v15, v16, "SnoozeAlarm.HandleIntentStrategy.makePreHandleIntentOutput() returning - selectedDevice not found in halInfo", v17, 2u);
    swift_slowDealloc();
  }
  uint64_t v18 = (uint64_t *)v0[7];

  v18[3] = sub_10EED8();
  v18[4] = (uint64_t)&protocol witness table for AceOutput;
  sub_31294(v18);
  sub_10EEC8();
LABEL_12:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t sub_F4DC0(uint64_t a1, uint64_t a2)
{
  v3[29] = a2;
  v3[30] = v2;
  v3[28] = a1;
  sub_3DD4(&qword_143960);
  v3[31] = swift_task_alloc();
  uint64_t v4 = sub_110718();
  v3[32] = v4;
  v3[33] = *(void *)(v4 - 8);
  v3[34] = swift_task_alloc();
  uint64_t v5 = sub_110648();
  v3[35] = v5;
  v3[36] = *(void *)(v5 - 8);
  v3[37] = swift_task_alloc();
  uint64_t v6 = sub_110638();
  v3[38] = v6;
  v3[39] = *(void *)(v6 - 8);
  v3[40] = swift_task_alloc();
  sub_3DD4(&qword_143968);
  v3[41] = swift_task_alloc();
  uint64_t v7 = sub_10E198();
  v3[42] = v7;
  v3[43] = *(void *)(v7 - 8);
  v3[44] = swift_task_alloc();
  v3[45] = swift_task_alloc();
  uint64_t v8 = sub_10E828();
  v3[46] = v8;
  v3[47] = *(void *)(v8 - 8);
  v3[48] = swift_task_alloc();
  v3[49] = swift_task_alloc();
  v3[50] = swift_task_alloc();
  uint64_t v9 = sub_110778();
  v3[51] = v9;
  v3[52] = *(void *)(v9 - 8);
  v3[53] = swift_task_alloc();
  uint64_t v10 = sub_10FD58();
  v3[54] = v10;
  v3[55] = *(void *)(v10 - 8);
  v3[56] = swift_task_alloc();
  uint64_t v11 = sub_10FD78();
  v3[57] = v11;
  v3[58] = *(void *)(v11 - 8);
  v3[59] = swift_task_alloc();
  sub_3DD4((uint64_t *)&unk_140770);
  v3[60] = swift_task_alloc();
  v3[61] = swift_task_alloc();
  uint64_t v12 = sub_10EAB8();
  v3[62] = v12;
  v3[63] = *(void *)(v12 - 8);
  v3[64] = swift_task_alloc();
  return _swift_task_switch(sub_F5230, 0, 0);
}

uint64_t sub_F5230()
{
  if (qword_13F1D8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_3E18(v0[51], (uint64_t)qword_143868);
  uint64_t v2 = sub_110768();
  os_log_type_t v3 = sub_1109F8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "SnoozeAlarm.HandleIntentStrategy.makeIntentHandledResponse() called.", v4, 2u);
    swift_slowDealloc();
  }

  v0[65] = sub_3DD4(&qword_141CD8);
  uint64_t v5 = (void *)sub_10EC18();
  id v6 = [v5 alarmId];

  if (!v6) {
    goto LABEL_10;
  }
  uint64_t v7 = v0[61];
  uint64_t v8 = v0[30];
  uint64_t v9 = sub_110848();
  uint64_t v11 = v10;

  uint64_t v12 = _s20HandleIntentStrategyVMa_5();
  sub_5B788(v8 + *(int *)(v12 + 20), v7);
  uint64_t v13 = sub_110088();
  uint64_t v14 = *(void *)(v13 - 8);
  int v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v7, 1, v13);
  uint64_t v16 = v0[61];
  if (v15 != 1)
  {
    uint64_t v17 = (void *)sub_10FF78();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v16, v13);
    if (!v17) {
      goto LABEL_11;
    }
    swift_bridgeObjectRelease();

LABEL_10:
    sub_10EAA8();
    goto LABEL_12;
  }
  sub_1646C(v0[61], (uint64_t *)&unk_140770);
LABEL_11:
  sub_3DD4(&qword_13FA80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1117A0;
  *(void *)(inited + 32) = v9;
  *(void *)(inited + 40) = v11;
  sub_C92BC(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
LABEL_12:
  uint64_t v19 = v0[53];
  uint64_t v20 = v0[51];
  uint64_t v21 = v0[52];
  (*(void (**)(void, void, void))(v0[55] + 104))(v0[56], enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), v0[54]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v19, v1, v20);
  mach_absolute_time();
  sub_10FD88();
  uint64_t v22 = (void *)sub_10EBF8();
  uint64_t v23 = sub_1102D8();

  if (v23 == 100)
  {
    if (qword_13F058 != -1) {
      swift_once();
    }
    uint64_t v32 = (char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
        + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:);
    uint64_t v28 = (void *)swift_task_alloc();
    v0[72] = v28;
    *uint64_t v28 = v0;
    v28[1] = sub_F6100;
    uint64_t v29 = 0x4E23657A6F6F6E53;
    unint64_t v30 = 0xEF676E697269466FLL;
  }
  else
  {
    if (v23 == 4)
    {
      if (qword_13F058 != -1) {
        swift_once();
      }
      uint64_t v24 = v0[30];
      uint64_t v25 = swift_task_alloc();
      v0[66] = v25;
      *(void *)(v25 + 16) = v24;
      uint64_t v26 = (void *)swift_task_alloc();
      v0[67] = v26;
      void *v26 = v0;
      v26[1] = sub_F57AC;
      return sub_84EBC((uint64_t)sub_F8678, v25);
    }
    if (qword_13F058 != -1) {
      swift_once();
    }
    uint64_t v32 = (char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
        + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:);
    uint64_t v31 = (void *)swift_task_alloc();
    v0[77] = v31;
    *uint64_t v31 = v0;
    v31[1] = sub_F6BA8;
    uint64_t v29 = 0x4523657A6F6F6E53;
    unint64_t v30 = 0xEC000000726F7272;
  }
  return ((uint64_t (*)(uint64_t, unint64_t, void *))v32)(v29, v30, _swiftEmptyArrayStorage);
}

uint64_t sub_F57AC(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 544) = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_F7650;
  }
  else
  {
    *(void *)(v4 + 552) = a1;
    uint64_t v5 = sub_F58F8;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_F58F8()
{
  sub_10E7B8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[70] = v1;
  void *v1 = v0;
  v1[1] = sub_F59B0;
  uint64_t v2 = v0[64];
  uint64_t v3 = v0[59];
  uint64_t v4 = v0[50];
  return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)(v0 + 23, v4, v2, v3, 0);
}

uint64_t sub_F59B0()
{
  uint64_t v2 = *(void **)(*(void *)v1 + 552);
  uint64_t v3 = *(void *)(*(void *)v1 + 400);
  uint64_t v4 = *(void *)(*(void *)v1 + 376);
  uint64_t v5 = *(void *)(*(void *)v1 + 368);
  *(void *)(*(void *)v1 + 568) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);

  if (v0) {
    uint64_t v6 = sub_F77C8;
  }
  else {
    uint64_t v6 = sub_F5B40;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_F5B40()
{
  sub_BE08((long long *)(v0 + 184), *(void *)(v0 + 224));
  sub_10E768();
  sub_17BD8((void *)(v0 + 104), *(void *)(v0 + 128));
  sub_10EBD8();
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 336);
    uint64_t v3 = *(void *)(v0 + 344);
    uint64_t v4 = *(void *)(v0 + 328);
    _s20HandleIntentStrategyVwxx_1(v0 + 104);
    sub_10E168();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) == 1)
    {
      uint64_t v6 = *(void *)(v0 + 504);
      uint64_t v5 = *(void *)(v0 + 512);
      uint64_t v7 = *(void *)(v0 + 496);
      uint64_t v8 = *(void *)(v0 + 328);
      (*(void (**)(void, void))(*(void *)(v0 + 464) + 8))(*(void *)(v0 + 472), *(void *)(v0 + 456));
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
      sub_1646C(v8, &qword_143968);
    }
    else
    {
      uint64_t v12 = *(void *)(v0 + 480);
      uint64_t v13 = *(void *)(v0 + 240);
      (*(void (**)(void, void, void))(*(void *)(v0 + 344) + 32))(*(void *)(v0 + 360), *(void *)(v0 + 328), *(void *)(v0 + 336));
      uint64_t v14 = _s20HandleIntentStrategyVMa_5();
      sub_5B788(v13 + *(int *)(v14 + 20), v12);
      uint64_t v15 = sub_110088();
      LODWORD(v13) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v12, 1, v15);
      sub_1646C(v12, (uint64_t *)&unk_140770);
      if (v13 == 1)
      {
        uint64_t v17 = *(void *)(v0 + 504);
        uint64_t v16 = *(void *)(v0 + 512);
        uint64_t v18 = *(void *)(v0 + 496);
        uint64_t v20 = *(void *)(v0 + 464);
        uint64_t v19 = *(void *)(v0 + 472);
        uint64_t v21 = *(void *)(v0 + 456);
        (*(void (**)(void, void))(*(void *)(v0 + 344) + 8))(*(void *)(v0 + 360), *(void *)(v0 + 336));
        (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
        (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
      }
      else
      {
        uint64_t v48 = *(void *)(v0 + 512);
        uint64_t v46 = *(void *)(v0 + 504);
        uint64_t v47 = *(void *)(v0 + 496);
        uint64_t v43 = *(void *)(v0 + 464);
        uint64_t v44 = *(void *)(v0 + 456);
        uint64_t v45 = *(void *)(v0 + 472);
        uint64_t v22 = *(void *)(v0 + 360);
        uint64_t v38 = *(void *)(v0 + 352);
        uint64_t v23 = *(void *)(v0 + 344);
        uint64_t v49 = *(void *)(v0 + 336);
        uint64_t v24 = *(void *)(v0 + 312);
        uint64_t v25 = *(void *)(v0 + 320);
        uint64_t v26 = *(void *)(v0 + 296);
        uint64_t v37 = *(void *)(v0 + 304);
        uint64_t v27 = *(void *)(v0 + 288);
        uint64_t v28 = *(void *)(v0 + 264);
        uint64_t v39 = *(void *)(v0 + 272);
        uint64_t v40 = *(void *)(v0 + 256);
        uint64_t v41 = *(void *)(v0 + 248);
        uint64_t v42 = *(void *)(v0 + 280);
        uint64_t v29 = (void *)sub_10EBF8();
        sub_1102D8();

        uint64_t v30 = sub_1102F8();
        uint64_t v31 = sub_1102F8();
        uint64_t v32 = (unsigned int *)&enum case for CrossDeviceCommandExecution.Result.success(_:);
        if (v30 != v31) {
          uint64_t v32 = (unsigned int *)&enum case for CrossDeviceCommandExecution.Result.error(_:);
        }
        (*(void (**)(uint64_t, void, uint64_t))(v24 + 104))(v25, *v32, v37);
        sub_1106E8();
        sub_1106D8();
        uint64_t v33 = v26 + *(int *)(sub_3DD4(&qword_143970) + 48);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v38, v22, v49);
        (*(void (**)(uint64_t, void, uint64_t))(v28 + 104))(v39, enum case for ExecutionInfo.Action.alarmSnooze(_:), v40);
        uint64_t v34 = sub_110708();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v41, 1, 1, v34);
        sub_1106F8();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v33, v25, v37);
        (*(void (**)(uint64_t, void, uint64_t))(v27 + 104))(v26, enum case for CrossDeviceCommandExecution.ended(_:), v42);
        sub_1106C8();
        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v42);
        (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v37);
        (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v49);
        (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v45, v44);
        (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v48, v47);
      }
    }
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 504);
    uint64_t v9 = *(void *)(v0 + 512);
    uint64_t v11 = *(void *)(v0 + 496);
    (*(void (**)(void, void))(*(void *)(v0 + 464) + 8))(*(void *)(v0 + 472), *(void *)(v0 + 456));
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    _s20HandleIntentStrategyVwxx_1(v0 + 104);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
  return v35();
}

uint64_t sub_F6100(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 584) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_F6470;
  }
  else
  {
    *(void *)(v4 + 592) = a1;
    uint64_t v5 = sub_F6228;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_F6228()
{
  sub_10E7E8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[75] = v1;
  void *v1 = v0;
  v1[1] = sub_F62E0;
  uint64_t v2 = v0[64];
  uint64_t v3 = v0[59];
  uint64_t v4 = v0[49];
  return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)(v0 + 18, v4, v2, v3, 0);
}

uint64_t sub_F62E0()
{
  uint64_t v2 = *(void **)(*(void *)v1 + 592);
  uint64_t v3 = *(void *)(*(void *)v1 + 392);
  uint64_t v4 = *(void *)(*(void *)v1 + 376);
  uint64_t v5 = *(void *)(*(void *)v1 + 368);
  *(void *)(*(void *)v1 + 608) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);

  if (v0) {
    uint64_t v6 = sub_F7940;
  }
  else {
    uint64_t v6 = sub_F65E8;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_F6470()
{
  uint64_t v2 = v0[63];
  uint64_t v1 = v0[64];
  uint64_t v3 = v0[62];
  (*(void (**)(void, void))(v0[58] + 8))(v0[59], v0[57]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_F65E8()
{
  sub_BE08((long long *)(v0 + 144), *(void *)(v0 + 224));
  sub_10E768();
  sub_17BD8((void *)(v0 + 104), *(void *)(v0 + 128));
  sub_10EBD8();
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 336);
    uint64_t v3 = *(void *)(v0 + 344);
    uint64_t v4 = *(void *)(v0 + 328);
    _s20HandleIntentStrategyVwxx_1(v0 + 104);
    sub_10E168();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) == 1)
    {
      uint64_t v6 = *(void *)(v0 + 504);
      uint64_t v5 = *(void *)(v0 + 512);
      uint64_t v7 = *(void *)(v0 + 496);
      uint64_t v8 = *(void *)(v0 + 328);
      (*(void (**)(void, void))(*(void *)(v0 + 464) + 8))(*(void *)(v0 + 472), *(void *)(v0 + 456));
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
      sub_1646C(v8, &qword_143968);
    }
    else
    {
      uint64_t v12 = *(void *)(v0 + 480);
      uint64_t v13 = *(void *)(v0 + 240);
      (*(void (**)(void, void, void))(*(void *)(v0 + 344) + 32))(*(void *)(v0 + 360), *(void *)(v0 + 328), *(void *)(v0 + 336));
      uint64_t v14 = _s20HandleIntentStrategyVMa_5();
      sub_5B788(v13 + *(int *)(v14 + 20), v12);
      uint64_t v15 = sub_110088();
      LODWORD(v13) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v12, 1, v15);
      sub_1646C(v12, (uint64_t *)&unk_140770);
      if (v13 == 1)
      {
        uint64_t v17 = *(void *)(v0 + 504);
        uint64_t v16 = *(void *)(v0 + 512);
        uint64_t v18 = *(void *)(v0 + 496);
        uint64_t v20 = *(void *)(v0 + 464);
        uint64_t v19 = *(void *)(v0 + 472);
        uint64_t v21 = *(void *)(v0 + 456);
        (*(void (**)(void, void))(*(void *)(v0 + 344) + 8))(*(void *)(v0 + 360), *(void *)(v0 + 336));
        (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
        (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
      }
      else
      {
        uint64_t v48 = *(void *)(v0 + 512);
        uint64_t v46 = *(void *)(v0 + 504);
        uint64_t v47 = *(void *)(v0 + 496);
        uint64_t v43 = *(void *)(v0 + 464);
        uint64_t v44 = *(void *)(v0 + 456);
        uint64_t v45 = *(void *)(v0 + 472);
        uint64_t v22 = *(void *)(v0 + 360);
        uint64_t v38 = *(void *)(v0 + 352);
        uint64_t v23 = *(void *)(v0 + 344);
        uint64_t v49 = *(void *)(v0 + 336);
        uint64_t v24 = *(void *)(v0 + 312);
        uint64_t v25 = *(void *)(v0 + 320);
        uint64_t v26 = *(void *)(v0 + 296);
        uint64_t v37 = *(void *)(v0 + 304);
        uint64_t v27 = *(void *)(v0 + 288);
        uint64_t v28 = *(void *)(v0 + 264);
        uint64_t v39 = *(void *)(v0 + 272);
        uint64_t v40 = *(void *)(v0 + 256);
        uint64_t v41 = *(void *)(v0 + 248);
        uint64_t v42 = *(void *)(v0 + 280);
        uint64_t v29 = (void *)sub_10EBF8();
        sub_1102D8();

        uint64_t v30 = sub_1102F8();
        uint64_t v31 = sub_1102F8();
        uint64_t v32 = (unsigned int *)&enum case for CrossDeviceCommandExecution.Result.success(_:);
        if (v30 != v31) {
          uint64_t v32 = (unsigned int *)&enum case for CrossDeviceCommandExecution.Result.error(_:);
        }
        (*(void (**)(uint64_t, void, uint64_t))(v24 + 104))(v25, *v32, v37);
        sub_1106E8();
        sub_1106D8();
        uint64_t v33 = v26 + *(int *)(sub_3DD4(&qword_143970) + 48);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v38, v22, v49);
        (*(void (**)(uint64_t, void, uint64_t))(v28 + 104))(v39, enum case for ExecutionInfo.Action.alarmSnooze(_:), v40);
        uint64_t v34 = sub_110708();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v41, 1, 1, v34);
        sub_1106F8();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v33, v25, v37);
        (*(void (**)(uint64_t, void, uint64_t))(v27 + 104))(v26, enum case for CrossDeviceCommandExecution.ended(_:), v42);
        sub_1106C8();
        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v42);
        (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v37);
        (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v49);
        (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v45, v44);
        (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v48, v47);
      }
    }
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 504);
    uint64_t v9 = *(void *)(v0 + 512);
    uint64_t v11 = *(void *)(v0 + 496);
    (*(void (**)(void, void))(*(void *)(v0 + 464) + 8))(*(void *)(v0 + 472), *(void *)(v0 + 456));
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    _s20HandleIntentStrategyVwxx_1(v0 + 104);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
  return v35();
}

uint64_t sub_F6BA8(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 624) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_F6F18;
  }
  else
  {
    *(void *)(v4 + 632) = a1;
    uint64_t v5 = sub_F6CD0;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_F6CD0()
{
  sub_10E7E8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[80] = v1;
  void *v1 = v0;
  v1[1] = sub_F6D88;
  uint64_t v2 = v0[64];
  uint64_t v3 = v0[59];
  uint64_t v4 = v0[48];
  return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)(v0 + 8, v4, v2, v3, 0);
}

uint64_t sub_F6D88()
{
  uint64_t v2 = *(void **)(*(void *)v1 + 632);
  uint64_t v3 = *(void *)(*(void *)v1 + 384);
  uint64_t v4 = *(void *)(*(void *)v1 + 376);
  uint64_t v5 = *(void *)(*(void *)v1 + 368);
  *(void *)(*(void *)v1 + 648) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);

  if (v0) {
    uint64_t v6 = sub_F7AB8;
  }
  else {
    uint64_t v6 = sub_F7090;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_F6F18()
{
  uint64_t v2 = v0[63];
  uint64_t v1 = v0[64];
  uint64_t v3 = v0[62];
  (*(void (**)(void, void))(v0[58] + 8))(v0[59], v0[57]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_F7090()
{
  sub_BE08((long long *)(v0 + 64), *(void *)(v0 + 224));
  sub_10E768();
  sub_17BD8((void *)(v0 + 104), *(void *)(v0 + 128));
  sub_10EBD8();
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 336);
    uint64_t v3 = *(void *)(v0 + 344);
    uint64_t v4 = *(void *)(v0 + 328);
    _s20HandleIntentStrategyVwxx_1(v0 + 104);
    sub_10E168();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) == 1)
    {
      uint64_t v6 = *(void *)(v0 + 504);
      uint64_t v5 = *(void *)(v0 + 512);
      uint64_t v7 = *(void *)(v0 + 496);
      uint64_t v8 = *(void *)(v0 + 328);
      (*(void (**)(void, void))(*(void *)(v0 + 464) + 8))(*(void *)(v0 + 472), *(void *)(v0 + 456));
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
      sub_1646C(v8, &qword_143968);
    }
    else
    {
      uint64_t v12 = *(void *)(v0 + 480);
      uint64_t v13 = *(void *)(v0 + 240);
      (*(void (**)(void, void, void))(*(void *)(v0 + 344) + 32))(*(void *)(v0 + 360), *(void *)(v0 + 328), *(void *)(v0 + 336));
      uint64_t v14 = _s20HandleIntentStrategyVMa_5();
      sub_5B788(v13 + *(int *)(v14 + 20), v12);
      uint64_t v15 = sub_110088();
      LODWORD(v13) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v12, 1, v15);
      sub_1646C(v12, (uint64_t *)&unk_140770);
      if (v13 == 1)
      {
        uint64_t v17 = *(void *)(v0 + 504);
        uint64_t v16 = *(void *)(v0 + 512);
        uint64_t v18 = *(void *)(v0 + 496);
        uint64_t v20 = *(void *)(v0 + 464);
        uint64_t v19 = *(void *)(v0 + 472);
        uint64_t v21 = *(void *)(v0 + 456);
        (*(void (**)(void, void))(*(void *)(v0 + 344) + 8))(*(void *)(v0 + 360), *(void *)(v0 + 336));
        (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
        (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
      }
      else
      {
        uint64_t v48 = *(void *)(v0 + 512);
        uint64_t v46 = *(void *)(v0 + 504);
        uint64_t v47 = *(void *)(v0 + 496);
        uint64_t v43 = *(void *)(v0 + 464);
        uint64_t v44 = *(void *)(v0 + 456);
        uint64_t v45 = *(void *)(v0 + 472);
        uint64_t v22 = *(void *)(v0 + 360);
        uint64_t v38 = *(void *)(v0 + 352);
        uint64_t v23 = *(void *)(v0 + 344);
        uint64_t v49 = *(void *)(v0 + 336);
        uint64_t v24 = *(void *)(v0 + 312);
        uint64_t v25 = *(void *)(v0 + 320);
        uint64_t v26 = *(void *)(v0 + 296);
        uint64_t v37 = *(void *)(v0 + 304);
        uint64_t v27 = *(void *)(v0 + 288);
        uint64_t v28 = *(void *)(v0 + 264);
        uint64_t v39 = *(void *)(v0 + 272);
        uint64_t v40 = *(void *)(v0 + 256);
        uint64_t v41 = *(void *)(v0 + 248);
        uint64_t v42 = *(void *)(v0 + 280);
        uint64_t v29 = (void *)sub_10EBF8();
        sub_1102D8();

        uint64_t v30 = sub_1102F8();
        uint64_t v31 = sub_1102F8();
        uint64_t v32 = (unsigned int *)&enum case for CrossDeviceCommandExecution.Result.success(_:);
        if (v30 != v31) {
          uint64_t v32 = (unsigned int *)&enum case for CrossDeviceCommandExecution.Result.error(_:);
        }
        (*(void (**)(uint64_t, void, uint64_t))(v24 + 104))(v25, *v32, v37);
        sub_1106E8();
        sub_1106D8();
        uint64_t v33 = v26 + *(int *)(sub_3DD4(&qword_143970) + 48);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v38, v22, v49);
        (*(void (**)(uint64_t, void, uint64_t))(v28 + 104))(v39, enum case for ExecutionInfo.Action.alarmSnooze(_:), v40);
        uint64_t v34 = sub_110708();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v41, 1, 1, v34);
        sub_1106F8();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v33, v25, v37);
        (*(void (**)(uint64_t, void, uint64_t))(v27 + 104))(v26, enum case for CrossDeviceCommandExecution.ended(_:), v42);
        sub_1106C8();
        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v42);
        (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v37);
        (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v49);
        (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v45, v44);
        (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v48, v47);
      }
    }
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 504);
    uint64_t v9 = *(void *)(v0 + 512);
    uint64_t v11 = *(void *)(v0 + 496);
    (*(void (**)(void, void))(*(void *)(v0 + 464) + 8))(*(void *)(v0 + 472), *(void *)(v0 + 456));
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    _s20HandleIntentStrategyVwxx_1(v0 + 104);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
  return v35();
}

uint64_t sub_F7650()
{
  uint64_t v2 = v0[63];
  uint64_t v1 = v0[64];
  uint64_t v3 = v0[62];
  (*(void (**)(void, void))(v0[58] + 8))(v0[59], v0[57]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_F77C8()
{
  uint64_t v2 = v0[63];
  uint64_t v1 = v0[64];
  uint64_t v3 = v0[62];
  (*(void (**)(void, void))(v0[58] + 8))(v0[59], v0[57]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_F7940()
{
  uint64_t v2 = v0[63];
  uint64_t v1 = v0[64];
  uint64_t v3 = v0[62];
  (*(void (**)(void, void))(v0[58] + 8))(v0[59], v0[57]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_F7AB8()
{
  uint64_t v2 = v0[63];
  uint64_t v1 = v0[64];
  uint64_t v3 = v0[62];
  (*(void (**)(void, void))(v0[58] + 8))(v0[59], v0[57]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_F7C30(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = a1;
  uint64_t v3 = sub_3DD4((uint64_t *)&unk_140770);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v35 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v35 - v10;
  uint64_t v12 = sub_3DD4(&qword_13FA88);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v37 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v36 = (char *)&v35 - v16;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v35 - v17;
  uint64_t v19 = a2 + *(int *)(_s20HandleIntentStrategyVMa_5() + 20);
  sub_5B788(v19, (uint64_t)v11);
  uint64_t v20 = sub_110088();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
  if (v22(v11, 1, v20) == 1)
  {
    sub_1646C((uint64_t)v11, (uint64_t *)&unk_140770);
  }
  else
  {
    uint64_t v23 = (void *)sub_10FF78();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v20);
    if (v23)
    {
      sub_110678();

      uint64_t v24 = sub_10FBC8();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v18, 0, 1, v24);
      goto LABEL_6;
    }
  }
  uint64_t v25 = sub_10FBC8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v18, 1, 1, v25);
LABEL_6:
  uint64_t v26 = (int *)type metadata accessor for SnoozeIntentHandledParameters(0);
  sub_33F10((uint64_t)v18, v38 + v26[6]);
  sub_5B788(v19, (uint64_t)v9);
  if (v22(v9, 1, v20) == 1)
  {
    sub_1646C((uint64_t)v9, (uint64_t *)&unk_140770);
    uint64_t v27 = v38;
    uint64_t v28 = (uint64_t)v36;
  }
  else
  {
    uint64_t v29 = (void *)sub_10FF78();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v9, v20);
    uint64_t v27 = v38;
    uint64_t v28 = (uint64_t)v36;
    if (v29)
    {
      sub_110688();

      goto LABEL_11;
    }
  }
  uint64_t v30 = sub_10FBC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v28, 1, 1, v30);
LABEL_11:
  sub_33F10(v28, v27 + v26[7]);
  sub_5B788(v19, (uint64_t)v6);
  if (v22(v6, 1, v20) == 1)
  {
    sub_1646C((uint64_t)v6, (uint64_t *)&unk_140770);
    uint64_t v31 = (uint64_t)v37;
LABEL_15:
    uint64_t v33 = sub_10FBC8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v31, 1, 1, v33);
    return sub_33F10(v31, v27 + v26[5]);
  }
  uint64_t v32 = (void *)sub_10FF78();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v20);
  uint64_t v31 = (uint64_t)v37;
  if (!v32) {
    goto LABEL_15;
  }
  sub_110668();

  return sub_33F10(v31, v27 + v26[5]);
}

uint64_t sub_F80C0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_13024;
  return sub_F4660(a1);
}

uint64_t sub_F8158(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_F8200;
  return sub_F4DC0(a1, a2);
}

uint64_t sub_F8200()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_F8334, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_F8334()
{
  v0[3] = v0[5];
  sub_3DD4(&qword_13FA70);
  sub_10FF38();
  swift_willThrow();
  swift_errorRelease();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_F83F4(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_143368 + dword_143368);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_33C04;
  return v5(a1);
}

uint64_t sub_F84B0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = v3;
  if (qword_13F1D8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_110778();
  sub_3E18(v9, (uint64_t)qword_143868);
  uint64_t v10 = sub_110768();
  os_log_type_t v11 = sub_1109F8();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_0, v10, v11, "SnoozeAlarm.HandleIntentStrategy.makeIntentExecutionBehavior is called.", v12, 2u);
    swift_slowDealloc();
  }

  uint64_t v13 = sub_12934(a1, a2, v6 + *(int *)(a3 + 20));
  uint64_t v14 = *(uint64_t (**)(uint64_t))(v4 + 8);
  return sub_AFC7C(v14, v4, v13);
}

unint64_t sub_F8620()
{
  unint64_t result = qword_143918[0];
  if (!qword_143918[0])
  {
    _s20HandleIntentStrategyVMa_5();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_143918);
  }
  return result;
}

uint64_t sub_F8678(uint64_t a1)
{
  return sub_F7C30(a1, *(void *)(v1 + 16));
}

void *INDateComponentsRange.alarmRepeatSchedule.getter()
{
  uint64_t v1 = [v0 recurrenceRule];
  if (v1)
  {
    uint64_t v2 = v1;
    if ([v1 frequency] == (char *)&dword_0 + 3)
    {
      if (qword_13F1E0 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_110778();
      sub_3E18(v3, (uint64_t)qword_143988);
      uint64_t v4 = sub_110768();
      os_log_type_t v5 = sub_1109F8();
      if (os_log_type_enabled(v4, v5))
      {
        uint64_t v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_0, v4, v5, "User requested to set alarm for every day.", v6, 2u);
        swift_slowDealloc();
      }

      char v7 = 127;
    }
    else
    {
      char v7 = [v2 weeklyRecurrenceDays];
    }
    os_log_type_t v11 = sub_8B6C4(v7);
  }
  else
  {
    if (qword_13F1E0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_110778();
    sub_3E18(v8, (uint64_t)qword_143988);
    uint64_t v2 = sub_110768();
    os_log_type_t v9 = sub_1109F8();
    if (os_log_type_enabled(v2, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_0, v2, v9, "No weeklyRecurrenceDays found.", v10, 2u);
      swift_slowDealloc();
    }
    os_log_type_t v11 = &_swiftEmptyArrayStorage;
  }

  return v11;
}

uint64_t sub_F8870()
{
  uint64_t v0 = sub_110778();
  sub_2D924(v0, qword_143988);
  sub_3E18(v0, (uint64_t)qword_143988);
  return sub_1104D8();
}

uint64_t destroy for AlarmSnapshot()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AlarmSnapshot(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AlarmSnapshot(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

__n128 initializeWithTake for AlarmSnapshot(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AlarmSnapshot(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for AlarmSnapshot(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AlarmSnapshot(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AlarmSnapshot()
{
  return &type metadata for AlarmSnapshot;
}

unint64_t sub_F8AD8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    long long v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_3DD4(&qword_143A08);
  uint64_t v2 = sub_110CF8();
  long long v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_AFBC(v6, (uint64_t)&v15, &qword_143A10);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_14FB0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    os_log_type_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *os_log_type_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_15470(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

unint64_t sub_F8C10(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    long long v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_3DD4(&qword_140158);
  uint64_t v2 = sub_110CF8();
  long long v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_AFBC(v6, (uint64_t)v15, &qword_1439D8);
    unint64_t result = sub_15028((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_15470(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
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

unint64_t sub_F8D54(uint64_t a1)
{
  uint64_t v2 = sub_3DD4(&qword_1439E0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_3DD4(&qword_1439E8);
  uint64_t v6 = sub_110CF8();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_AFBC(v12, (uint64_t)v5, &qword_1439E0);
    unint64_t result = sub_1506C((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_10F9F8();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
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

uint64_t sub_F8F48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_F92F8(a1, (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.disable(_:), a2);
}

uint64_t sub_F8F54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v37 = sub_1103B8();
  uint64_t v3 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10FFF8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v36 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v32 - v10;
  uint64_t v12 = sub_110038();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  char v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, enum case for DirectInvocationUtils.Alarm.URI.undo(_:), v12);
  uint64_t v35 = sub_110028();
  uint64_t v34 = v16;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  sub_3DD4(&qword_140148);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_112860;
  uint64_t v33 = *(void (**)(char *, void, uint64_t))(v7 + 104);
  v33(v11, enum case for DirectInvocationUtils.Alarm.UserInfoKey.verb(_:), v6);
  uint64_t v18 = sub_10FFE8();
  uint64_t v20 = v19;
  uint64_t v21 = *(void (**)(char *, uint64_t))(v7 + 8);
  v21(v11, v6);
  *(void *)(inited + 32) = v18;
  *(void *)(inited + 40) = v20;
  uint64_t v22 = v37;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for AlarmNLv4Constants.AlarmVerb.delete(_:), v37);
  uint64_t v23 = sub_1103A8();
  uint64_t v25 = v24;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v22);
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v23;
  *(void *)(inited + 56) = v25;
  uint64_t v26 = v36;
  v33(v36, enum case for DirectInvocationUtils.Alarm.UserInfoKey.alarmId(_:), v6);
  uint64_t v27 = sub_10FFE8();
  uint64_t v29 = v28;
  v21(v26, v6);
  *(void *)(inited + 80) = v27;
  *(void *)(inited + 88) = v29;
  *(void *)(inited + 120) = &type metadata for String;
  uint64_t v30 = v39;
  *(void *)(inited + 96) = v38;
  *(void *)(inited + 104) = v30;
  swift_bridgeObjectRetain();
  sub_F8AD8(inited);
  return sub_10EE38();
}

uint64_t sub_F92EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_F92F8(a1, (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.enable(_:), a2);
}

uint64_t sub_F92F8@<X0>(uint64_t a1@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v38 = a1;
  uint64_t v39 = a3;
  uint64_t v36 = sub_1103B8();
  uint64_t v3 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10FFF8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v35 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v31 - v10;
  uint64_t v12 = sub_110038();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  char v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, enum case for DirectInvocationUtils.Alarm.URI.undo(_:), v12);
  uint64_t v34 = sub_110028();
  uint64_t v33 = v16;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  sub_3DD4(&qword_140148);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_112860;
  uint64_t v32 = *(void (**)(char *, void, uint64_t))(v7 + 104);
  v32(v11, enum case for DirectInvocationUtils.Alarm.UserInfoKey.verb(_:), v6);
  uint64_t v18 = sub_10FFE8();
  uint64_t v20 = v19;
  uint64_t v21 = *(void (**)(char *, uint64_t))(v7 + 8);
  v21(v11, v6);
  *(void *)(inited + 32) = v18;
  *(void *)(inited + 40) = v20;
  uint64_t v22 = v36;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *v37, v36);
  uint64_t v23 = sub_1103A8();
  uint64_t v25 = v24;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v22);
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v23;
  *(void *)(inited + 56) = v25;
  uint64_t v26 = v35;
  v32(v35, enum case for DirectInvocationUtils.Alarm.UserInfoKey.alarmId(_:), v6);
  uint64_t v27 = sub_10FFE8();
  uint64_t v29 = v28;
  v21(v26, v6);
  *(void *)(inited + 80) = v27;
  *(void *)(inited + 88) = v29;
  *(void *)(inited + 120) = sub_3DD4(&qword_13F8A0);
  *(void *)(inited + 96) = v38;
  swift_bridgeObjectRetain();
  sub_F8AD8(inited);
  return sub_10EE38();
}

uint64_t sub_F9694@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v39 = sub_1103B8();
  uint64_t v3 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v38 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10FFF8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v37 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v34 - v9;
  uint64_t v11 = sub_110038();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10DFD8();
  swift_allocObject();
  sub_10DFC8();
  uint64_t v41 = a1;
  sub_3DD4(&qword_13F870);
  sub_FB070();
  uint64_t v36 = sub_10DFB8();
  unint64_t v35 = v15;
  swift_release();
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for DirectInvocationUtils.Alarm.URI.undo(_:), v11);
  v34[2] = sub_110028();
  v34[1] = v16;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  sub_3DD4(&qword_140148);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_112860;
  v34[0] = *(void *)(v6 + 104);
  ((void (*)(char *, void, uint64_t))v34[0])(v10, enum case for DirectInvocationUtils.Alarm.UserInfoKey.verb(_:), v5);
  uint64_t v18 = sub_10FFE8();
  uint64_t v20 = v19;
  uint64_t v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v21(v10, v5);
  *(void *)(inited + 32) = v18;
  *(void *)(inited + 40) = v20;
  uint64_t v22 = v38;
  uint64_t v23 = v39;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v38, enum case for AlarmNLv4Constants.AlarmVerb.create(_:), v39);
  uint64_t v24 = sub_1103A8();
  uint64_t v26 = v25;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v22, v23);
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v24;
  *(void *)(inited + 56) = v26;
  uint64_t v27 = v37;
  ((void (*)(char *, void, uint64_t))v34[0])(v37, enum case for DirectInvocationUtils.Alarm.UserInfoKey.alarmSnapshotsJson(_:), v5);
  uint64_t v28 = sub_10FFE8();
  uint64_t v30 = v29;
  v21(v27, v5);
  *(void *)(inited + 80) = v28;
  *(void *)(inited + 88) = v30;
  *(void *)(inited + 120) = sub_3DD4(&qword_143A28);
  uint64_t v31 = v36;
  unint64_t v32 = v35;
  *(void *)(inited + 96) = v36;
  *(void *)(inited + 104) = v32;
  sub_FB138(v31, v32);
  sub_F8AD8(inited);
  sub_10EE38();
  return sub_FB14C(v31, v32);
}

unint64_t sub_F9AF4(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6574756E696DLL;
      break;
    case 2:
      unint64_t result = 0x6C6562616CLL;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x64656C62616E65;
      break;
    default:
      unint64_t result = 1920298856;
      break;
  }
  return result;
}

uint64_t sub_F9B98(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_3DD4(&qword_1439C0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_17BD8(a1, a1[3]);
  sub_FAD1C();
  sub_110EC8();
  char v14 = 0;
  sub_110D98();
  if (!v2)
  {
    char v13 = 1;
    sub_110D98();
    char v12 = 2;
    sub_110D78();
    uint64_t v11 = *(void *)(v3 + 32);
    v10[15] = 3;
    sub_3DD4(&qword_1439B0);
    sub_FAD70(&qword_1439C8);
    sub_110DA8();
    v10[14] = 4;
    sub_110D88();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_F9DB8()
{
  return sub_F9AF4(*v0);
}

uint64_t sub_F9DC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_FA804(a1, a2);
  *a3 = result;
  return result;
}

void sub_F9DE8(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_F9DF4(uint64_t a1)
{
  unint64_t v2 = sub_FAD1C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_F9E30(uint64_t a1)
{
  unint64_t v2 = sub_FAD1C();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_F9E6C@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_FA9E4(a1, (uint64_t)&v6);
  if (!v2)
  {
    long long v5 = v7[0];
    *a2 = v6;
    a2[1] = v5;
    double result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 25) = *(_OWORD *)((char *)v7 + 9);
  }
  return result;
}

uint64_t sub_F9EB0(void *a1)
{
  return sub_F9B98(a1);
}

id sub_F9EC8(uint64_t a1, uint64_t a2)
{
  uint64_t v39 = a2;
  uint64_t v38 = a1;
  uint64_t v2 = sub_10FFF8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v37 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v36 - v6;
  uint64_t v8 = sub_110038();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for DirectInvocationUtils.Alarm.URI.buttonPress(_:), v8);
  sub_110028();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  id v12 = objc_allocWithZone((Class)SKIDirectInvocationPayload);
  NSString v13 = sub_110838();
  swift_bridgeObjectRelease();
  id v36 = [v12 initWithIdentifier:v13];

  sub_3DD4(&qword_1439D0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_112860;
  unint64_t v15 = *(void (**)(char *, void, uint64_t))(v3 + 104);
  v15(v7, enum case for DirectInvocationUtils.Alarm.UserInfoKey.verb(_:), v2);
  uint64_t v16 = sub_10FFE8();
  uint64_t v18 = v17;
  uint64_t v19 = *(void (**)(char *, uint64_t))(v3 + 8);
  v19(v7, v2);
  uint64_t v40 = v16;
  uint64_t v41 = v18;
  sub_110B98();
  uint64_t v20 = sub_1103A8();
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 72) = v20;
  *(void *)(inited + 80) = v21;
  uint64_t v22 = v37;
  v15(v37, enum case for DirectInvocationUtils.Alarm.UserInfoKey.buttonPressed(_:), v2);
  uint64_t v23 = v22;
  uint64_t v24 = sub_10FFE8();
  uint64_t v26 = v25;
  v19(v23, v2);
  uint64_t v40 = v24;
  uint64_t v41 = v26;
  sub_110B98();
  uint64_t v27 = sub_10FE88();
  *(void *)(inited + 168) = &type metadata for String;
  *(void *)(inited + 144) = v27;
  *(void *)(inited + 152) = v28;
  sub_F8C10(inited);
  Class isa = sub_1107E8().super.isa;
  swift_bridgeObjectRelease();
  id v30 = v36;
  [v36 setUserData:isa];

  uint64_t v31 = self;
  sub_10FFB8();
  sub_10FFA8();
  sub_10FF98();
  swift_release();
  sub_17BD8(&v40, v42);
  unint64_t v32 = (void *)sub_10E7A8();
  id v33 = [v31 runSiriKitExecutorCommandWithContext:v32 payload:v30];

  _s20HandleIntentStrategyVwxx_1((uint64_t)&v40);
  id v34 = [v31 wrapCommandInStartLocalRequest:v33];

  return v34;
}

id sub_FA32C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v36 = a3;
  uint64_t v35 = a2;
  uint64_t v34 = a1;
  uint64_t v3 = sub_10FFF8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  id v33 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v32 - v7;
  uint64_t v9 = sub_110038();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for DirectInvocationUtils.Alarm.URI.disambiguation(_:), v9);
  sub_110028();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  id v13 = objc_allocWithZone((Class)SKIDirectInvocationPayload);
  NSString v14 = sub_110838();
  swift_bridgeObjectRelease();
  id v32 = [v13 initWithIdentifier:v14];

  sub_3DD4(&qword_1439D0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_112860;
  uint64_t v16 = *(void (**)(char *, void, uint64_t))(v4 + 104);
  v16(v8, enum case for DirectInvocationUtils.Alarm.UserInfoKey.verb(_:), v3);
  uint64_t v17 = sub_10FFE8();
  uint64_t v19 = v18;
  uint64_t v20 = *(void (**)(char *, uint64_t))(v4 + 8);
  v20(v8, v3);
  uint64_t v37 = v17;
  uint64_t v38 = v19;
  sub_110B98();
  uint64_t v21 = sub_1103A8();
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 72) = v21;
  *(void *)(inited + 80) = v22;
  uint64_t v23 = v33;
  v16(v33, enum case for DirectInvocationUtils.Alarm.UserInfoKey.alarmId(_:), v3);
  uint64_t v24 = v23;
  uint64_t v25 = sub_10FFE8();
  uint64_t v27 = v26;
  v20(v24, v3);
  uint64_t v37 = v25;
  uint64_t v38 = v27;
  sub_110B98();
  *(void *)(inited + 168) = &type metadata for String;
  uint64_t v28 = v36;
  *(void *)(inited + 144) = v35;
  *(void *)(inited + 152) = v28;
  swift_bridgeObjectRetain();
  sub_F8C10(inited);
  Class isa = sub_1107E8().super.isa;
  swift_bridgeObjectRelease();
  id v30 = v32;
  [v32 setUserData:isa];

  return v30;
}

id sub_FA6E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = sub_FA32C(a1, a2, a3);
  id v4 = [objc_allocWithZone((Class)SKIDirectInvocationContext) init];
  [v4 setInputOrigin:SAInputOriginDialogButtonTapValue];
  [v4 setInteractionType:SAIntentGroupAceInteractionTypeDisplayDrivenValue];
  uint64_t v5 = self;
  sub_10FFB8();
  sub_10FFA8();
  sub_10FF98();
  swift_release();
  sub_17BD8(v9, v9[3]);
  uint64_t v6 = (void *)sub_10E7A8();
  id v7 = [v5 runSiriKitExecutorCommandWithContext:v6 payload:v3];

  _s20HandleIntentStrategyVwxx_1((uint64_t)v9);
  return v7;
}

uint64_t sub_FA804(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1920298856 && a2 == 0xE400000000000000;
  if (v3 || (sub_110DE8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574756E696DLL && a2 == 0xE600000000000000 || (sub_110DE8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6562616CLL && a2 == 0xE500000000000000 || (sub_110DE8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000000117610 || (sub_110DE8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x64656C62616E65 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_110DE8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_FA9E4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_3DD4(&qword_1439A0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_17BD8(a1, a1[3]);
  sub_FAD1C();
  sub_110EB8();
  if (v2) {
    return _s20HandleIntentStrategyVwxx_1((uint64_t)a1);
  }
  char v28 = 0;
  uint64_t v9 = sub_110D48();
  char v27 = 1;
  uint64_t v10 = sub_110D48();
  char v26 = 2;
  uint64_t v11 = sub_110D28();
  uint64_t v13 = v12;
  uint64_t v20 = v10;
  uint64_t v21 = v11;
  sub_3DD4(&qword_1439B0);
  char v25 = 3;
  sub_FAD70(&qword_1439B8);
  uint64_t v22 = v13;
  swift_bridgeObjectRetain();
  sub_110D58();
  char v24 = 4;
  uint64_t v19 = v23;
  swift_bridgeObjectRetain();
  uint64_t v18 = 0;
  LOBYTE(v13) = sub_110D38();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  _s20HandleIntentStrategyVwxx_1((uint64_t)a1);
  uint64_t v14 = v19;
  swift_bridgeObjectRelease();
  uint64_t v15 = v22;
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v17 = v20;
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v17;
  *(void *)(a2 + 16) = v21;
  *(void *)(a2 + 24) = v15;
  *(void *)(a2 + 32) = v14;
  *(unsigned char *)(a2 + 40) = v13 & 1;
  return result;
}

unint64_t sub_FAD1C()
{
  unint64_t result = qword_1439A8;
  if (!qword_1439A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1439A8);
  }
  return result;
}

uint64_t sub_FAD70(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2DEA8(&qword_1439B0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AlarmSnapshot.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AlarmSnapshot.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0xFAF30);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AlarmSnapshot.CodingKeys()
{
  return &type metadata for AlarmSnapshot.CodingKeys;
}

unint64_t sub_FAF6C()
{
  unint64_t result = qword_1439F0;
  if (!qword_1439F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1439F0);
  }
  return result;
}

unint64_t sub_FAFC4()
{
  unint64_t result = qword_1439F8;
  if (!qword_1439F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1439F8);
  }
  return result;
}

unint64_t sub_FB01C()
{
  unint64_t result = qword_143A00;
  if (!qword_143A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_143A00);
  }
  return result;
}

unint64_t sub_FB070()
{
  unint64_t result = qword_143A18;
  if (!qword_143A18)
  {
    sub_2DEA8(&qword_13F870);
    sub_FB0E4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_143A18);
  }
  return result;
}

unint64_t sub_FB0E4()
{
  unint64_t result = qword_143A20;
  if (!qword_143A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_143A20);
  }
  return result;
}

uint64_t sub_FB138(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_38940(a1, a2);
  }
  return a1;
}

uint64_t sub_FB14C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2DDDC(a1, a2);
  }
  return a1;
}

unint64_t sub_FB160()
{
  unint64_t result = qword_143A30;
  if (!qword_143A30)
  {
    _s18NeedsValueStrategyCMa();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_143A30);
  }
  return result;
}

unint64_t sub_FB1B8()
{
  unint64_t result = qword_143A40;
  if (!qword_143A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_143A40);
  }
  return result;
}

uint64_t sub_FB20C(uint64_t a1)
{
  return sub_FB2A8(a1, (void (*)(void))type metadata accessor for ChangeAlarmStatusCATsSimple, (uint64_t (*)(char *, void))&CATWrapperSimple.__allocating_init(options:globals:), &qword_144660);
}

uint64_t sub_FB240(uint64_t a1)
{
  return sub_FB2A8(a1, (void (*)(void))type metadata accessor for ChangeAlarmStatusCATPatternsExecutor, (uint64_t (*)(char *, void))&CATWrapper.__allocating_init(options:globals:), &qword_144668);
}

uint64_t sub_FB274(uint64_t a1)
{
  return sub_FB2A8(a1, (void (*)(void))type metadata accessor for ModifyAllCATPatternsExecutor, (uint64_t (*)(char *, void))&CATWrapper.__allocating_init(options:globals:), &qword_144670);
}

uint64_t sub_FB2A8(uint64_t a1, void (*a2)(void), uint64_t (*a3)(char *, void), uint64_t *a4)
{
  uint64_t v7 = sub_10FC68();
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2(0);
  sub_10FC48();
  uint64_t result = a3(v9, 0);
  *a4 = result;
  return result;
}

uint64_t type metadata accessor for SnoozeAlarmCATs_Async()
{
  uint64_t result = qword_143A48;
  if (!qword_143A48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_FB398()
{
  return swift_initClassMetadata2();
}

uint64_t sub_FB3D8(uint64_t a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v6 + 32) = a5;
  *(void *)(v6 + 40) = v5;
  *(unsigned char *)(v6 + 89) = a3;
  *(unsigned char *)(v6 + 88) = a2;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a4;
  sub_3DD4(&qword_13FA88);
  *(void *)(v6 + 48) = swift_task_alloc();
  *(void *)(v6 + 56) = swift_task_alloc();
  return _swift_task_switch(sub_FB488, 0, 0);
}

uint64_t sub_FB488()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 24);
  char v3 = *(unsigned char *)(v0 + 89);
  char v4 = *(unsigned char *)(v0 + 88);
  sub_3DD4(&qword_13FC38);
  uint64_t v5 = swift_allocObject();
  *(void *)(v0 + 64) = v5;
  *(_OWORD *)(v5 + 16) = xmmword_111970;
  *(void *)(v5 + 32) = 0x6E6F737265507369;
  *(void *)(v5 + 40) = 0xEA00000000006C61;
  *(unsigned char *)(v5 + 48) = v4;
  *(void *)(v5 + 72) = &type metadata for Bool;
  *(void *)(v5 + 80) = 0x6E756D6D6F437369;
  *(void *)(v5 + 88) = 0xEA00000000006C61;
  *(unsigned char *)(v5 + 96) = v3;
  uint64_t v6 = (uint64_t *)(v5 + 144);
  *(void *)(v5 + 120) = &type metadata for Bool;
  *(void *)(v5 + 128) = 0x614E656369766564;
  *(void *)(v5 + 136) = 0xEA0000000000656DLL;
  sub_AFBC(v2, v1, &qword_13FA88);
  uint64_t v7 = sub_10FBC8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(v1, 1, v7);
  uint64_t v11 = *(void *)(v0 + 56);
  if (v10 == 1)
  {
    sub_1646C(*(void *)(v0 + 56), &qword_13FA88);
    *(_OWORD *)uint64_t v6 = 0u;
    *(_OWORD *)(v5 + 160) = 0u;
  }
  else
  {
    *(void *)(v5 + 168) = v7;
    uint64_t v12 = sub_31294(v6);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v8 + 32))(v12, v11, v7);
  }
  uint64_t v13 = *(void *)(v0 + 48);
  uint64_t v14 = *(void *)(v0 + 32);
  *(void *)(v5 + 176) = 0x656D614E6D6F6F72;
  *(void *)(v5 + 184) = 0xE800000000000000;
  sub_AFBC(v14, v13, &qword_13FA88);
  int v15 = v9(v13, 1, v7);
  uint64_t v16 = *(void *)(v0 + 48);
  if (v15 == 1)
  {
    sub_1646C(*(void *)(v0 + 48), &qword_13FA88);
    *(_OWORD *)(v5 + 192) = 0u;
    *(_OWORD *)(v5 + 208) = 0u;
  }
  else
  {
    *(void *)(v5 + 216) = v7;
    uint64_t v17 = sub_31294((uint64_t *)(v5 + 192));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v8 + 32))(v17, v16, v7);
  }
  uint64_t v21 = (uint64_t (*)(uint64_t, unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:)
                                                                                     + async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:));
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_EA8EC;
  uint64_t v19 = *(void *)(v0 + 16);
  return v21(v19, 0xD000000000000024, 0x8000000000117660, v5);
}

uint64_t sub_FB75C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FC68();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3DD4((uint64_t *)&unk_13F780);
  __chkstk_darwin(v8 - 8);
  int v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  sub_AFBC(a1, (uint64_t)v10, (uint64_t *)&unk_13F780);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = sub_10FB18();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_1646C(a1, (uint64_t *)&unk_13F780);
  return v11;
}

uint64_t sub_FB8F4()
{
  return type metadata accessor for SnoozeAlarmCATs_Async();
}

uint64_t sub_FB8FC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v3 = sub_10E2A8();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_3DD4(&qword_13F888);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_3DD4(&qword_13F848);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10E0B8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v36 - v18;
  id v20 = [a1 dateTime];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v36 = v4;
    sub_10E048();

    uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
    v22(v12, v17, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) != 1)
    {
      v22(v19, v12, v13);
      sub_10E268();
      sub_10E248();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v3);
      uint64_t v23 = sub_10E158();
      uint64_t v24 = *(void *)(v23 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v9, 1, v23) == 1)
      {
        sub_1646C((uint64_t)v9, &qword_13F888);
        if (qword_13F200 != -1) {
          swift_once();
        }
        uint64_t v25 = sub_110778();
        sub_3E18(v25, (uint64_t)qword_143AA0);
        char v26 = sub_110768();
        os_log_type_t v27 = sub_1109E8();
        if (os_log_type_enabled(v26, v27))
        {
          char v28 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)char v28 = 0;
          _os_log_impl(&dword_0, v26, v27, "getAlarmDate: Could not get date from alarmDateComponents.", v28, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 56))(v37, 1, 1, v23);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
        uint64_t v35 = v37;
        (*(void (**)(uint64_t, char *, uint64_t))(v24 + 32))(v37, v9, v23);
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v24 + 56))(v35, 0, 1, v23);
      }
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  }
  sub_1646C((uint64_t)v12, &qword_13F848);
  if (qword_13F200 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_110778();
  sub_3E18(v30, (uint64_t)qword_143AA0);
  uint64_t v31 = sub_110768();
  os_log_type_t v32 = sub_1109E8();
  if (os_log_type_enabled(v31, v32))
  {
    id v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v33 = 0;
    _os_log_impl(&dword_0, v31, v32, "getAlarmDate: DateComponents not available from alarm in intent response.", v33, 2u);
    swift_slowDealloc();
  }

  uint64_t v34 = sub_10E158();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v37, 1, 1, v34);
}

uint64_t sub_FBE9C(uint64_t a1)
{
  return sub_FBF04(a1, (uint64_t (*)(void))&type metadata accessor for Logger, qword_143AA0, (uint64_t (*)(void))&static SiriTimeLog.alarmFlow.getter);
}

uint64_t sub_FBED0(uint64_t a1)
{
  return sub_FBF04(a1, (uint64_t (*)(void))&type metadata accessor for Locale, qword_143AB8, (uint64_t (*)(void))&static Locale.autoupdatingCurrent.getter);
}

uint64_t sub_FBF04(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a2(0);
  sub_2D924(v6, a3);
  sub_3E18(v6, (uint64_t)a3);
  return a4();
}

uint64_t sub_FBF60()
{
  uint64_t v0 = sub_10FC68();
  __chkstk_darwin(v0 - 8);
  type metadata accessor for AlarmBaseCATs_Async();
  sub_10FC48();
  uint64_t result = sub_10FB38();
  qword_143AD0 = result;
  return result;
}

uint64_t sub_FBFEC()
{
  uint64_t v0 = sub_10E1C8();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10E1E8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_13F208 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_3E18(v4, (uint64_t)qword_143AB8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  sub_10E1D8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  int v9 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v9 == enum case for Locale.HourCycle.zeroToEleven(_:) || v9 == enum case for Locale.HourCycle.oneToTwelve(_:))
  {
    if (qword_13F200 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_110778();
    sub_3E18(v11, (uint64_t)qword_143AA0);
    uint64_t v12 = sub_110768();
    os_log_type_t v13 = sub_1109F8();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_0, v12, v13, "uses24HourTime: Using 12h clock for time output", v14, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  if (v9 != enum case for Locale.HourCycle.zeroToTwentyThree(_:)
    && v9 != enum case for Locale.HourCycle.oneToTwentyFour(_:))
  {
    if (qword_13F200 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_110778();
    sub_3E18(v21, (uint64_t)qword_143AA0);
    uint64_t v22 = sub_110768();
    os_log_type_t v23 = sub_1109E8();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_0, v22, v23, "uses24HourTime: Unknown hourCycle enumeration found. This is a programming error. Defaulting to 12h time.", v24, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return 0;
  }
  if (qword_13F200 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_110778();
  sub_3E18(v16, (uint64_t)qword_143AA0);
  uint64_t v17 = sub_110768();
  os_log_type_t v18 = sub_1109F8();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_0, v17, v18, "uses24HourTime: Using 24h clock for time output", v19, 2u);
    swift_slowDealloc();
  }

  return 1;
}

uint64_t sub_FC42C(void *a1)
{
  uint64_t v2 = sub_10E1E8();
  uint64_t v34 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_3DD4(&qword_13F848);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10E0B8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v33 - v13;
  uint64_t v15 = 0;
  if (sub_FBFEC()) {
    return v15;
  }
  id v16 = [a1 dateTime];
  if (v16)
  {
    uint64_t v17 = v16;
    sub_10E048();

    os_log_type_t v18 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v18(v7, v12, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
    {
      v18(v14, v7, v8);
      uint64_t v19 = sub_10E058();
      if ((v20 & 1) == 0)
      {
        uint64_t v21 = v19;
        id v22 = [objc_allocWithZone((Class)NSDateFormatter) init];
        if (qword_13F208 != -1) {
          swift_once();
        }
        uint64_t v23 = sub_3E18(v2, (uint64_t)qword_143AB8);
        uint64_t v24 = v34;
        (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v4, v23, v2);
        Class isa = sub_10E1A8().super.isa;
        (*(void (**)(char *, uint64_t))(v24 + 8))(v4, v2);
        [v22 setLocale:isa];

        if (v21 >= 12)
        {
          id v26 = [v22 PMSymbol];
          if (v26) {
            goto LABEL_9;
          }
        }
        else
        {
          id v26 = [v22 AMSymbol];
          if (v26)
          {
LABEL_9:
            os_log_type_t v27 = v26;
            uint64_t v15 = sub_110848();

LABEL_21:
            (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
            return v15;
          }
        }

        uint64_t v15 = 0;
        goto LABEL_21;
      }
      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
      goto LABEL_12;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  }
  sub_1646C((uint64_t)v7, &qword_13F848);
LABEL_12:
  if (qword_13F200 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_110778();
  sub_3E18(v28, (uint64_t)qword_143AA0);
  uint64_t v29 = sub_110768();
  os_log_type_t v30 = sub_1109E8();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v31 = 0;
    _os_log_impl(&dword_0, v29, v30, "getMeridiemForSnippet: Could not get hour from alarmDateComponents.", v31, 2u);
    swift_slowDealloc();
  }

  return 0;
}

uint64_t sub_FC8EC(void *a1)
{
  uint64_t v2 = sub_10E028();
  uint64_t v111 = *(void *)(v2 - 8);
  uint64_t v112 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  v109 = (char *)v101 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v108 = (char *)v101 - v6;
  __chkstk_darwin(v5);
  os_log_type_t v110 = (char *)v101 - v7;
  uint64_t v107 = sub_3DD4((uint64_t *)&unk_143AF0);
  uint64_t v8 = __chkstk_darwin(v107);
  uint64_t v116 = (char *)v101 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v113 = (char *)v101 - v10;
  uint64_t v11 = sub_10E1E8();
  uint64_t v114 = *(void *)(v11 - 8);
  uint64_t v115 = v11;
  __chkstk_darwin(v11);
  uint64_t v117 = (char *)v101 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10E2A8();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v16 = (char *)v101 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_3DD4(&qword_13F888);
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)v101 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10E158();
  uint64_t v119 = *(void *)(v20 - 8);
  uint64_t v120 = v20;
  __chkstk_darwin(v20);
  uint64_t v118 = (char *)v101 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_3DD4(&qword_13F848);
  __chkstk_darwin(v22 - 8);
  uint64_t v24 = (char *)v101 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_10E0B8();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v29 = (char *)v101 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v121 = (char *)v101 - v30;
  id v31 = [a1 dateTime];
  if (!v31)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56))(v24, 1, 1, v25);
    goto LABEL_10;
  }
  os_log_type_t v32 = v31;
  uint64_t v105 = a1;
  sub_10E048();

  uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
  v33(v24, v29, v25);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v24, 0, 1, v25);
  uint64_t v106 = v26;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25) == 1)
  {
LABEL_10:
    sub_1646C((uint64_t)v24, &qword_13F848);
    if (qword_13F200 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_110778();
    sub_3E18(v41, (uint64_t)qword_143AA0);
    uint64_t v42 = sub_110768();
    os_log_type_t v43 = sub_1109E8();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v44 = 0;
      _os_log_impl(&dword_0, v42, v43, "getFormattedTimeComponentsForSnippet: DateComponents not available from alarm in intent response.", v44, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  v33(v121, v24, v25);
  sub_10E268();
  sub_10E248();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  uint64_t v35 = v119;
  uint64_t v34 = v120;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v119 + 48))(v19, 1, v120) != 1)
  {
    uint64_t v104 = v25;
    (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v118, v19, v34);
    id v47 = [objc_allocWithZone((Class)NSDateFormatter) init];
    if (qword_13F208 != -1) {
      swift_once();
    }
    uint64_t v48 = v115;
    uint64_t v49 = sub_3E18(v115, (uint64_t)qword_143AB8);
    uint64_t v50 = v114;
    os_log_type_t v51 = v117;
    (*(void (**)(char *, uint64_t, uint64_t))(v114 + 16))(v117, v49, v48);
    Class isa = sub_10E1A8().super.isa;
    id v53 = *(void (**)(char *, uint64_t))(v50 + 8);
    uint64_t v103 = v50 + 8;
    uint64_t v102 = v53;
    v53(v51, v48);
    [v47 setLocale:isa];

    id v54 = v113;
    if (qword_13F200 != -1) {
      swift_once();
    }
    uint64_t v55 = sub_110778();
    uint64_t v56 = sub_3E18(v55, (uint64_t)qword_143AA0);
    unint64_t v57 = (char *)v47;
    uint64_t v58 = sub_110768();
    os_log_type_t v59 = sub_1109F8();
    if (os_log_type_enabled(v58, v59))
    {
      v101[1] = v56;
      uint64_t v60 = (uint8_t *)swift_slowAlloc();
      uint64_t v122 = swift_slowAlloc();
      *(_DWORD *)uint64_t v60 = 136315138;
      id v61 = [v57 locale];
      if (v61)
      {
        uint64_t v62 = v61;
        sub_10E1B8();

        uint64_t v63 = 0;
      }
      else
      {
        uint64_t v63 = 1;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v50 + 56))(v54, v63, 1, v48);
      uint64_t v64 = sub_110858();
      uint64_t v124 = sub_6750(v64, v65, &v122);
      sub_110B28();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v58, v59, "getFormattedTimeComponentsForSnippet: Using locale for snippet: %s", v60, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    char v66 = sub_FBFEC();
    NSString v67 = sub_110838();
    swift_bridgeObjectRelease();
    id v68 = [v57 locale];
    if (v68)
    {
      uint64_t v69 = v68;
      id v70 = v117;
      sub_10E1B8();

      uint64_t v71 = v116;
      (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v116, v70, v48);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v50 + 56))(v71, 0, 1, v48);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v71, 1, v48) == 1)
      {
        Class v72 = 0;
      }
      else
      {
        Class v72 = sub_10E1A8().super.isa;
        v102(v71, v48);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v50 + 56))(v116, 1, 1, v48);
      Class v72 = 0;
    }
    uint64_t v117 = v57;
    id v73 = [self dateFormatFromTemplate:v67 options:0 locale:v72];

    if (v73)
    {
      uint64_t v74 = sub_110848();
      id v76 = v75;

      uint64_t v122 = v74;
      id v123 = v76;
      uint64_t v77 = v108;
      sub_10DFE8();
      unint64_t v78 = v109;
      sub_10DFF8();
      unint64_t v79 = v110;
      sub_10E018();
      uint64_t v80 = v112;
      uint64_t v81 = *(void (**)(char *, uint64_t))(v111 + 8);
      v81(v78, v112);
      v81(v77, v80);
      sub_14048();
      uint64_t v82 = sub_110B48();
      id v73 = v83;
      v81(v79, v80);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v82 = 0;
    }
    swift_bridgeObjectRetain_n();
    char v84 = sub_110768();
    os_log_type_t v85 = sub_1109F8();
    BOOL v86 = os_log_type_enabled(v84, v85);
    uint64_t v116 = (char *)v82;
    if (v86)
    {
      id v87 = (uint8_t *)swift_slowAlloc();
      uint64_t v88 = swift_slowAlloc();
      id v123 = v73;
      uint64_t v124 = v88;
      *(_DWORD *)id v87 = 136315138;
      uint64_t v122 = v82;
      swift_bridgeObjectRetain();
      sub_3DD4(&qword_141328);
      uint64_t v89 = sub_110858();
      uint64_t v122 = sub_6750(v89, v90, &v124);
      sub_110B28();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v84, v85, "getFormattedTimeComponentsForSnippet: Alarm time format: %s", v87, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      unint64_t v91 = v117;
      if (v73)
      {
LABEL_37:
        NSString v92 = sub_110838();
        swift_bridgeObjectRelease();
        goto LABEL_40;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      unint64_t v91 = v117;
      if (v73) {
        goto LABEL_37;
      }
    }
    NSString v92 = 0;
LABEL_40:
    [v91 setDateFormat:v92];

    Class v93 = sub_10E128().super.isa;
    id v94 = [v91 stringFromDate:v93];

    uint64_t v45 = sub_110848();
    unint64_t v96 = v95;

    swift_bridgeObjectRetain_n();
    uint64_t v97 = sub_110768();
    os_log_type_t v98 = sub_1109F8();
    if (os_log_type_enabled(v97, v98))
    {
      unint64_t v99 = (uint8_t *)swift_slowAlloc();
      uint64_t v122 = swift_slowAlloc();
      *(_DWORD *)unint64_t v99 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v124 = sub_6750(v45, v96, &v122);
      unint64_t v91 = v117;
      sub_110B28();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v97, v98, "getFormattedTimeComponentsForSnippet: Alarm time to print: %s", v99, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      id v100 = v105;
      if ((v66 & 1) == 0)
      {
LABEL_42:
        sub_FC42C(v100);

LABEL_45:
        (*(void (**)(char *, uint64_t))(v119 + 8))(v118, v120);
        (*(void (**)(char *, uint64_t))(v106 + 8))(v121, v104);
        return v45;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      id v100 = v105;
      if ((v66 & 1) == 0) {
        goto LABEL_42;
      }
    }

    goto LABEL_45;
  }
  sub_1646C((uint64_t)v19, &qword_13F888);
  uint64_t v36 = v106;
  if (qword_13F200 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_110778();
  sub_3E18(v37, (uint64_t)qword_143AA0);
  uint64_t v38 = sub_110768();
  os_log_type_t v39 = sub_1109E8();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v40 = 0;
    _os_log_impl(&dword_0, v38, v39, "getFormattedTimeComponentsForSnippet: Could not get date from alarmDateComponents.", v40, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v36 + 8))(v121, v25);
  return 0;
}

uint64_t sub_FD848()
{
  uint64_t v1 = sub_10E988();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  uint64_t v2 = sub_10EAF8();
  v0[5] = v2;
  v0[6] = *(void *)(v2 - 8);
  v0[7] = swift_task_alloc();
  sub_3DD4(&qword_140140);
  v0[8] = swift_task_alloc();
  return _swift_task_switch(sub_FD990, 0, 0);
}

uint64_t sub_FD990()
{
  if (qword_13F210 != -1) {
    swift_once();
  }
  uint64_t v4 = (char *)&async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:)
     + async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  void *v1 = v0;
  v1[1] = sub_FDA90;
  uint64_t v2 = *(void *)(v0 + 56);
  return ((uint64_t (*)(uint64_t, unint64_t, unint64_t, void *))v4)(v2, 0xD00000000000001DLL, 0x80000000001176D0, _swiftEmptyArrayStorage);
}

uint64_t sub_FDA90()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_FDD9C;
  }
  else {
    uint64_t v2 = sub_FDBA4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_FDBA4()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  uint64_t v4 = sub_10EAE8();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v5 = *(void *)(v4 + 16);
  uint64_t v6 = sub_10EB28();
  uint64_t v7 = *(void *)(v6 - 8);
  if (v5)
  {
    (*(void (**)(void, unint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(v0[8], v4+ ((*(unsigned __int8 *)(*(void *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80)), v6);
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 1;
  }
  uint64_t v9 = v0[8];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v9, v8, 1, v6);
  swift_bridgeObjectRelease();
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v9, 1, v6);
  uint64_t v11 = v0[8];
  if (v10 == 1)
  {
    sub_1646C(v0[8], &qword_140140);
    uint64_t v12 = 0;
    unint64_t v13 = 0xE000000000000000;
  }
  else
  {
    uint64_t v15 = v0[3];
    uint64_t v14 = v0[4];
    uint64_t v16 = v0[2];
    sub_10EB18();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v6);
    uint64_t v12 = sub_10E978();
    unint64_t v13 = v17;
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(uint64_t, unint64_t))v0[1];
  return v18(v12, v13);
}

uint64_t sub_FDD9C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_FDE14()
{
  uint64_t v1 = sub_10E988();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  uint64_t v2 = sub_10EAF8();
  v0[5] = v2;
  v0[6] = *(void *)(v2 - 8);
  v0[7] = swift_task_alloc();
  sub_3DD4(&qword_140140);
  v0[8] = swift_task_alloc();
  return _swift_task_switch(sub_FDF5C, 0, 0);
}

uint64_t sub_FDF5C()
{
  if (qword_13F210 != -1) {
    swift_once();
  }
  uint64_t v4 = (char *)&async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:)
     + async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  void *v1 = v0;
  v1[1] = sub_FE05C;
  uint64_t v2 = *(void *)(v0 + 56);
  return ((uint64_t (*)(uint64_t, unint64_t, unint64_t, void *))v4)(v2, 0xD00000000000001ALL, 0x80000000001176B0, _swiftEmptyArrayStorage);
}

uint64_t sub_FE05C()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_FE3B8;
  }
  else {
    uint64_t v2 = sub_FE3BC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_FE170()
{
  uint64_t v1 = sub_10E988();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  uint64_t v2 = sub_10EAF8();
  v0[5] = v2;
  v0[6] = *(void *)(v2 - 8);
  v0[7] = swift_task_alloc();
  sub_3DD4(&qword_140140);
  v0[8] = swift_task_alloc();
  return _swift_task_switch(sub_FE2B8, 0, 0);
}

uint64_t sub_FE2B8()
{
  if (qword_13F210 != -1) {
    swift_once();
  }
  uint64_t v4 = (char *)&async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:)
     + async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  void *v1 = v0;
  v1[1] = sub_FE05C;
  uint64_t v2 = *(void *)(v0 + 56);
  return ((uint64_t (*)(uint64_t, unint64_t, unint64_t, void *))v4)(v2, 0xD00000000000001CLL, 0x8000000000117690, _swiftEmptyArrayStorage);
}

uint64_t sub_FE3C0()
{
  uint64_t v0 = sub_110778();
  sub_2D924(v0, qword_143B00);
  sub_3E18(v0, (uint64_t)qword_143B00);
  return sub_1104D8();
}

uint64_t static Transformer<>.alarmToTimerParseTransformer.getter()
{
  sub_10EE88();

  return sub_10FA78();
}

uint64_t sub_FE468@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10E0B8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3DD4(&qword_13F848);
  __chkstk_darwin(v8 - 8);
  int v10 = (char *)v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_3DD4(&qword_143B90);
  __chkstk_darwin(v11 - 8);
  unint64_t v13 = (char *)v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_13F218 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_110778();
  sub_3E18(v14, (uint64_t)qword_143B00);
  id v15 = a1;
  uint64_t v16 = sub_110768();
  os_log_type_t v17 = sub_1109F8();
  int v18 = v17;
  BOOL v19 = os_log_type_enabled(v16, v17);
  id v52 = v10;
  if (v19)
  {
    uint64_t v51 = v4;
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    v54[0] = v49;
    int v48 = v18;
    *(_DWORD *)uint64_t v20 = 136315138;
    v46[1] = v20 + 4;
    id v47 = v20;
    id v21 = v15;
    uint64_t v22 = v5;
    uint64_t v23 = a2;
    id v24 = [v21 description];
    uint64_t v25 = v7;
    uint64_t v26 = sub_110848();
    id v50 = v15;
    unint64_t v28 = v27;

    a2 = v23;
    uint64_t v5 = v22;
    uint64_t v29 = v26;
    uint64_t v7 = v25;
    uint64_t v53 = sub_6750(v29, v28, v54);
    sub_110B28();

    id v15 = v50;
    uint64_t v4 = v51;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v16, (os_log_type_t)v48, "AlarmFlowFactory: routing flow with SK intent: %s", v47, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_FF6A4(v15, (uint64_t)v13);
  uint64_t v30 = sub_10E698();
  uint64_t v31 = *(void *)(v30 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v13, 1, v30) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v31 + 32))(a2, v13, v30);
  }
  sub_1646C((uint64_t)v13, &qword_143B90);
  sub_110258();
  uint64_t v32 = swift_dynamicCastClass();
  if (v32)
  {
    uint64_t v33 = (void *)v32;
    id v34 = v15;
    id v35 = [v33 time];
    if (v35)
    {
      uint64_t v36 = v35;
      sub_10E048();

      uint64_t v37 = (uint64_t)v52;
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v52, v7, v4);
      char v38 = 1;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v37, 0, 1, v4);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v37, 1, v4) != 1) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v37 = (uint64_t)v52;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v52, 1, 1, v4);
    }
    char v38 = 0;
LABEL_16:
    sub_1646C(v37, &qword_13F848);
    sub_101CC4(v38, 0);
LABEL_17:
    sub_10E678();

    return swift_release();
  }
  sub_110298();
  if (swift_dynamicCastClass())
  {
    sub_102128();
LABEL_20:
    sub_10E678();
    return swift_release();
  }
  sub_1102C8();
  if (swift_dynamicCastClass())
  {
    sub_1025A4();
    goto LABEL_20;
  }
  sub_1101F8();
  uint64_t v40 = swift_dynamicCastClass();
  if (v40)
  {
    uint64_t v41 = (void *)v40;
    id v34 = v15;
    if ([v41 operation] == (char *)&dword_0 + 2) {
      sub_102A28();
    }
    else {
      sub_102B6C();
    }
    goto LABEL_17;
  }
  sub_110328();
  if (swift_dynamicCastClass())
  {
    sub_102FE8();
    goto LABEL_20;
  }
  sub_110308();
  if (swift_dynamicCastClass())
  {
    sub_10E408();
    swift_allocObject();
    v54[0] = sub_10E418();
    sub_10E5F8();
    swift_release();
    goto LABEL_20;
  }
  uint64_t v42 = sub_1101A8();
  v54[3] = v42;
  v54[4] = (uint64_t)&protocol witness table for ABCReport;
  os_log_type_t v43 = sub_31294(v54);
  uint64_t *v43 = swift_getObjectType();
  uint64_t v44 = enum case for UnhandledAbortSubtype.unknownIntent(_:);
  uint64_t v45 = sub_1100D8();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v45 - 8) + 104))(v43, v44, v45);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v42 - 8) + 104))(v43, enum case for ABCReport.unhandledAbort(_:), v42);
  sub_10FF28();
  _s20HandleIntentStrategyVwxx_1((uint64_t)v54);
  return sub_10E658();
}

uint64_t sub_FEB4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1103B8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_13F218 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_110778();
  uint64_t v9 = sub_3E18(v8, (uint64_t)qword_143B00);
  swift_unknownObjectRetain_n();
  int v10 = sub_110768();
  os_log_type_t v11 = sub_1109F8();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v29 = v7;
    uint64_t v30 = a1;
    uint64_t v31 = v13;
    v28[2] = v9;
    *(_DWORD *)uint64_t v12 = 136315138;
    v28[1] = v12 + 4;
    swift_unknownObjectRetain();
    sub_3DD4((uint64_t *)&unk_143CB0);
    uint64_t v14 = sub_110858();
    uint64_t v30 = sub_6750(v14, v15, &v31);
    sub_110B28();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v10, v11, "AlarmFlowFactory: routing flow with nlv4 intent: %s", v12, 0xCu);
    swift_arrayDestroy();
    uint64_t v7 = v29;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  swift_getObjectType();
  uint64_t v16 = sub_110A38();
  if (!v16)
  {
    id v24 = sub_110768();
    os_log_type_t v25 = sub_1109E8();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_0, v24, v25, "UsoTask is empty! Calling searchAlarmFlow anyways", v26, 2u);
      swift_slowDealloc();
    }

    sub_1025A4();
    sub_10E678();
    return swift_release();
  }
  uint64_t v17 = v16;
  int v18 = sub_110768();
  os_log_type_t v19 = sub_1109F8();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_0, v18, v19, "AlarmFlowFactory: Testing for qualified AlarmFlowFactory.getUnsupportedFlow()", v20, 2u);
    swift_slowDealloc();
  }

  if (sub_6A8C(v17))
  {
    id v21 = sub_110768();
    os_log_type_t v22 = sub_1109F8();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_0, v21, v22, "This is not supported nvl4 intent, use unsupportedFlow.", v23, 2u);
      swift_slowDealloc();
    }

    sub_10E678();
    swift_release();
    return swift_release();
  }
  sub_42C6C((uint64_t)v7);
  swift_retain();
  sub_FEFB0((uint64_t)v7, 0, v17, a2);
  swift_release_n();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_FEFB0@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v50 = a4;
  uint64_t v7 = sub_1103B8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v44 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  id v47 = (char *)&v39 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  int v48 = (char *)&v39 - v14;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v39 - v15;
  if (qword_13F218 != -1) {
    goto LABEL_39;
  }
  while (1)
  {
    uint64_t v17 = sub_110778();
    uint64_t v18 = sub_3E18(v17, (uint64_t)qword_143B00);
    uint64_t v49 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    v49(v16, a1, v7);
    uint64_t v45 = (uint8_t *)v18;
    os_log_type_t v19 = sub_110768();
    os_log_type_t v20 = sub_1109F8();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v40 = a1;
      os_log_type_t v22 = (uint8_t *)v21;
      uint64_t v23 = swift_slowAlloc();
      int v43 = a2;
      id v52 = (char *)v23;
      uint64_t v41 = v7;
      uint64_t v42 = v8;
      *(_DWORD *)os_log_type_t v22 = 136315138;
      uint64_t v24 = sub_1103A8();
      uint64_t v51 = sub_6750(v24, v25, (uint64_t *)&v52);
      uint64_t v7 = v41;
      uint64_t v8 = v42;
      sub_110B28();
      swift_bridgeObjectRelease();
      uint64_t v46 = *(void (**)(char *, uint64_t))(v8 + 8);
      v46(v16, v7);
      _os_log_impl(&dword_0, v19, v20, "AlarmFlowFactory: routing flow with verb: %s", v22, 0xCu);
      swift_arrayDestroy();
      a2 = v43;
      swift_slowDealloc();
      a1 = v40;
      swift_slowDealloc();
    }
    else
    {
      uint64_t v46 = *(void (**)(char *, uint64_t))(v8 + 8);
      v46(v16, v7);
    }

    uint64_t v26 = v48;
    unint64_t v27 = v49;
    v49(v48, a1, v7);
    int v28 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v26, v7);
    if (v28 == enum case for AlarmNLv4Constants.AlarmVerb.unknown(_:))
    {
      uint64_t v29 = v47;
      v27(v47, a1, v7);
      uint64_t v30 = sub_110768();
      os_log_type_t v31 = sub_1109E8();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = (uint8_t *)swift_slowAlloc();
        int v48 = (char *)swift_slowAlloc();
        id v52 = v48;
        *(_DWORD *)uint64_t v32 = 136315138;
        uint64_t v45 = v32 + 4;
        v27(v44, (uint64_t)v29, v7);
        uint64_t v33 = sub_110858();
        uint64_t v51 = sub_6750(v33, v34, (uint64_t *)&v52);
        sub_110B28();
        swift_bridgeObjectRelease();
        v46(v29, v7);
        _os_log_impl(&dword_0, v30, v31, "Unexpected alarmVerb: %s", v32, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        v46(v29, v7);
      }

LABEL_17:
      sub_1025A4();
      goto LABEL_18;
    }
    if (v28 == enum case for AlarmNLv4Constants.AlarmVerb.checkExistence(_:)) {
      goto LABEL_17;
    }
    if (v28 == enum case for AlarmNLv4Constants.AlarmVerb.create(_:))
    {
LABEL_10:
      if (a3)
      {
        uint64_t v35 = sub_10F8E8();
        if (!v35)
        {
LABEL_22:
          sub_101CC4(v35, a2 & 1);
          goto LABEL_18;
        }
        uint64_t v36 = sub_10F398();
        swift_release();
        if (v36)
        {
          uint64_t v37 = sub_10F428();
          swift_release();
          if (v37)
          {
            swift_release();
            LOBYTE(v35) = 1;
            goto LABEL_22;
          }
        }
      }
      LOBYTE(v35) = 0;
      goto LABEL_22;
    }
    if (v28 == enum case for AlarmNLv4Constants.AlarmVerb.delete(_:))
    {
      sub_102128();
      goto LABEL_18;
    }
    if (v28 == enum case for AlarmNLv4Constants.AlarmVerb.disable(_:)) {
      break;
    }
    if (v28 == enum case for AlarmNLv4Constants.AlarmVerb.enable(_:))
    {
LABEL_26:
      sub_102B6C();
      goto LABEL_18;
    }
    if (v28 == enum case for AlarmNLv4Constants.AlarmVerb.read(_:)
      || v28 == enum case for AlarmNLv4Constants.AlarmVerb.request(_:))
    {
      goto LABEL_17;
    }
    if (v28 == enum case for AlarmNLv4Constants.AlarmVerb.snooze(_:))
    {
      sub_10E408();
      swift_allocObject();
      id v52 = (char *)sub_10E418();
      sub_10E5F8();
      swift_release();
      goto LABEL_18;
    }
    if (v28 == enum case for AlarmNLv4Constants.AlarmVerb.summarise(_:)) {
      goto LABEL_17;
    }
    if (v28 == enum case for AlarmNLv4Constants.AlarmVerb.update(_:))
    {
      sub_102FE8();
      goto LABEL_18;
    }
    if (v28 == enum case for AlarmNLv4Constants.AlarmVerb.noVerb(_:)) {
      goto LABEL_10;
    }
    if (v28 == enum case for AlarmNLv4Constants.AlarmVerb.close(_:)) {
      break;
    }
    if (v28 == enum case for AlarmNLv4Constants.AlarmVerb.resume(_:)) {
      goto LABEL_26;
    }
    if (v28 == enum case for AlarmNLv4Constants.AlarmVerb.stop(_:)) {
      break;
    }
    sub_110DD8();
    __break(1u);
LABEL_39:
    swift_once();
  }
  sub_102A28();
LABEL_18:
  sub_10E678();
  return swift_release();
}

uint64_t sub_FF6A4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (sub_B430(0)) {
    goto LABEL_2;
  }
  sub_110258();
  if (!swift_dynamicCastClass())
  {
    sub_110298();
    uint64_t v9 = swift_dynamicCastClass();
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      Class isa = a1;
      id v12 = [v10 alarmSearch];
      if (!v12) {
        goto LABEL_20;
      }
    }
    else
    {
      sub_1102C8();
      uint64_t v13 = swift_dynamicCastClass();
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        Class isa = a1;
        id v12 = [v14 alarmSearch];
        if (!v12) {
          goto LABEL_20;
        }
      }
      else
      {
        sub_1101F8();
        uint64_t v15 = swift_dynamicCastClass();
        if (v15)
        {
          uint64_t v16 = (void *)v15;
          Class isa = a1;
          id v12 = [v16 alarmSearch];
          if (!v12) {
            goto LABEL_20;
          }
        }
        else
        {
          sub_110328();
          uint64_t v17 = swift_dynamicCastClass();
          if (!v17) {
            goto LABEL_21;
          }
          uint64_t v18 = (void *)v17;
          Class isa = a1;
          id v12 = [v18 alarmSearch];
          if (!v12) {
            goto LABEL_20;
          }
        }
      }
    }
    os_log_type_t v19 = v12;
    id v20 = [v12 includeSleepAlarm];
    sub_12EE4();
    v21.super.super.Class isa = sub_110AC8(1).super.super.isa;
    if (v20)
    {
      id v22 = v20;
      char v23 = sub_110AD8();

      if ((v23 & 1) != 0 && sub_B430(1))
      {
LABEL_2:
        sub_10E678();
        swift_release();
        uint64_t v4 = sub_10E698();
        uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
        uint64_t v6 = v4;
        uint64_t v7 = a2;
        uint64_t v8 = 0;
        goto LABEL_22;
      }
      goto LABEL_21;
    }

    Class isa = v21.super.super.isa;
LABEL_20:
  }
LABEL_21:
  uint64_t v24 = sub_10E698();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56);
  uint64_t v6 = v24;
  uint64_t v7 = a2;
  uint64_t v8 = 1;
LABEL_22:

  return v5(v7, v8, 1, v6);
}

uint64_t sub_FF950(uint64_t a1)
{
  v1[3] = a1;
  uint64_t v2 = sub_3DD4(&qword_143C48);
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  uint64_t v3 = sub_3DD4(&qword_143C50);
  v1[7] = v3;
  v1[8] = *(void *)(v3 - 8);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  v1[11] = sub_3DD4((uint64_t *)&unk_143C58);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  uint64_t v4 = sub_10FE38();
  v1[14] = v4;
  v1[15] = *(void *)(v4 - 8);
  v1[16] = swift_task_alloc();
  sub_3DD4((uint64_t *)&unk_140770);
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  return _swift_task_switch(sub_FFB64, 0, 0);
}

uint64_t sub_FFB64()
{
  if (qword_13F218 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_110778();
  sub_3E18(v1, (uint64_t)qword_143B00);
  uint64_t v2 = sub_110768();
  os_log_type_t v3 = sub_1109F8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "AlarmFlowFactory: making snoozeAlarmFlow.", v4, 2u);
    swift_slowDealloc();
  }

  sub_1101D8();
  sub_10FE18();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_FFCCC;
  return SiriTimeDeviceContextProvider.fetchAlarmContexts()();
}

uint64_t sub_FFCCC(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 128);
  uint64_t v3 = *(void *)(*(void *)v1 + 120);
  uint64_t v4 = *(void *)(*(void *)v1 + 112);
  *(void *)(*(void *)v1 + 160) = a1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return _swift_task_switch(sub_FFE2C, 0, 0);
}

uint64_t sub_FFE2C()
{
  uint64_t v24 = v0;
  uint64_t v1 = sub_110938();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = sub_110088();
  uint64_t v4 = *(void *)(v3 - 8);
  if (v2)
  {
    (*(void (**)(void, unint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(v0[18], v1+ ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80)), v3);
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  uint64_t v6 = v0[18];
  uint64_t v7 = v0[13];
  uint64_t v8 = v0[11];
  uint64_t v18 = v0[10];
  uint64_t v9 = v0[8];
  uint64_t v21 = v0[9];
  uint64_t v22 = v0[17];
  uint64_t v10 = v0[7];
  uint64_t v19 = v0[12];
  uint64_t v20 = v0[6];
  uint64_t v11 = v0[5];
  uint64_t v16 = v0[4];
  uint64_t v17 = (uint64_t *)v0[3];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v6, v5, 1, v3);
  swift_bridgeObjectRelease();
  sub_10FFB8();
  sub_10FFA8();
  sub_10FF98();
  swift_release();
  sub_AFBC(v6, v7 + *(int *)(v8 + 36), (uint64_t *)&unk_140770);
  sub_10FFA8();
  sub_10FF98();
  swift_release();
  sub_AFBC(v6, v22, (uint64_t *)&unk_140770);
  sub_8D4BC((uint64_t)v23, v22);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v21, v18, v10);
  sub_3DD4(&qword_143C68);
  swift_allocObject();
  sub_10E5D8();
  sub_AFBC(v7, v19, (uint64_t *)&unk_143C58);
  sub_C158(&qword_143C70, (uint64_t *)&unk_143C58);
  swift_retain();
  sub_10E968();
  uint64_t v12 = sub_10E948();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v20, v16);
  v0[2] = v12;
  sub_3DD4(&qword_143C78);
  sub_C158((unint64_t *)&unk_143C80, &qword_143C78);
  uint64_t v13 = sub_10E5F8();
  swift_release();
  v17[3] = sub_10E498();
  v17[4] = (uint64_t)&protocol witness table for AnyFlow;
  swift_release();
  *uint64_t v17 = v13;
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v18, v10);
  sub_1646C(v7, (uint64_t *)&unk_143C58);
  sub_1646C(v6, (uint64_t *)&unk_140770);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_1001F0(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_110088();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  uint64_t v3 = sub_10FE38();
  v1[6] = v3;
  v1[7] = *(void *)(v3 - 8);
  v1[8] = swift_task_alloc();
  sub_3DD4((uint64_t *)&unk_140770);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  return _swift_task_switch(sub_10034C, 0, 0);
}

uint64_t sub_10034C()
{
  if (qword_13F218 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_110778();
  *(void *)(v0 + 88) = sub_3E18(v1, (uint64_t)qword_143B00);
  uint64_t v2 = sub_110768();
  os_log_type_t v3 = sub_1109F8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "AlarmFlowFactory: making decideDismissOrChangeAlarmStatusFlow.", v4, 2u);
    swift_slowDealloc();
  }

  sub_1101D8();
  sub_10FE18();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1004B8;
  return SiriTimeDeviceContextProvider.fetchAlarmContexts()();
}

uint64_t sub_1004B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 64);
  uint64_t v3 = *(void *)(*(void *)v1 + 56);
  uint64_t v4 = *(void *)(*(void *)v1 + 48);
  *(void *)(*(void *)v1 + 104) = a1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return _swift_task_switch(sub_100618, 0, 0);
}

uint64_t sub_100618()
{
  uint64_t v1 = sub_110938();
  swift_bridgeObjectRelease();
  if (*(void *)(v1 + 16))
  {
    (*(void (**)(void, unint64_t, void))(v0[4] + 16))(v0[10], v1 + ((*(unsigned __int8 *)(v0[4] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[4] + 80)), v0[3]);
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = 1;
  }
  uint64_t v4 = v0[9];
  uint64_t v3 = v0[10];
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(v3, v2, 1, v5);
  swift_bridgeObjectRelease();
  sub_AFBC(v3, v4, (uint64_t *)&unk_140770);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_1646C(v0[9], (uint64_t *)&unk_140770);
    uint64_t v7 = sub_110768();
    os_log_type_t v8 = sub_1109F8();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_0, v7, v8, "DecideDismissOrChangeStateFlow: Can NOT get valid HAL info, running changeAlarmStatusFlow.", v9, 2u);
      swift_slowDealloc();
    }
    uint64_t v10 = (uint64_t *)v0[2];

    uint64_t v11 = sub_102B6C();
    v10[3] = sub_10E498();
    v10[4] = (uint64_t)&protocol witness table for AnyFlow;
    *uint64_t v10 = v11;
  }
  else
  {
    (*(void (**)(void, void, void))(v0[4] + 32))(v0[5], v0[9], v0[3]);
    uint64_t v12 = sub_110768();
    os_log_type_t v13 = sub_1109D8();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_0, v12, v13, "DecideDismissOrChangeStateFlow: Running dismissAlarmFlow.", v14, 2u);
      swift_slowDealloc();
    }
    uint64_t v16 = v0[4];
    uint64_t v15 = v0[5];
    uint64_t v18 = (uint64_t *)v0[2];
    uint64_t v17 = v0[3];

    uint64_t v19 = sub_103570(v15);
    v18[3] = sub_10E498();
    v18[4] = (uint64_t)&protocol witness table for AnyFlow;
    *uint64_t v18 = v19;
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  sub_1646C(v0[10], (uint64_t *)&unk_140770);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_1008F0@<X0>(uint8_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v111 = a1;
  uint64_t v103 = a2;
  uint64_t v3 = sub_10EE68();
  uint64_t v95 = *(void *)(v3 - 8);
  uint64_t v96 = v3;
  __chkstk_darwin(v3);
  os_log_type_t v98 = (char *)&v91 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_3DD4((uint64_t *)&unk_143B30);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v91 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3DD4(&qword_143B50);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10F1A8();
  uint64_t v100 = *(void *)(v11 - 8);
  uint64_t v101 = v11;
  __chkstk_darwin(v11);
  unint64_t v99 = (char *)&v91 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = sub_10F928();
  uint64_t v102 = *(void *)(v107 - 8);
  uint64_t v13 = __chkstk_darwin(v107);
  uint64_t v15 = (char *)&v91 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v91 - v17;
  __chkstk_darwin(v16);
  uint64_t v108 = (char *)&v91 - v19;
  uint64_t v20 = sub_10EE88();
  uint64_t v110 = *(void *)(v20 - 8);
  uint64_t v21 = __chkstk_darwin(v20);
  NSString v92 = (char *)&v91 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v21);
  id v94 = (char *)&v91 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v97 = (char *)&v91 - v26;
  __chkstk_darwin(v25);
  int v28 = (char *)&v91 - v27;
  if (qword_13F218 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_110778();
  uint64_t v106 = sub_3E18(v29, (uint64_t)qword_143B00);
  uint64_t v30 = sub_110768();
  os_log_type_t v31 = sub_1109F8();
  BOOL v32 = os_log_type_enabled(v30, v31);
  uint64_t v109 = v20;
  if (v32)
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl(&dword_0, v30, v31, "Transforming timer parse to alarm parse", v33, 2u);
    uint64_t v20 = v109;
    swift_slowDealloc();
  }

  uint64_t v34 = v110;
  uint64_t v35 = *(uint64_t (**)(uint64_t, uint8_t *, uint64_t))(v110 + 16);
  uint64_t v104 = v110 + 16;
  uint64_t v105 = v35;
  v35((uint64_t)v28, v111, v20);
  int v36 = (*(uint64_t (**)(char *, uint64_t))(v34 + 88))(v28, v20);
  if (v36 != enum case for Parse.NLv3IntentOnly(_:))
  {
    int v45 = v36;
    if (v36 == enum case for Parse.NLv4IntentOnly(_:))
    {
      (*(void (**)(char *, uint64_t))(v34 + 96))(v28, v20);
      swift_unknownObjectRelease();
      uint64_t v46 = sub_110768();
      os_log_type_t v47 = sub_1109E8();
      if (os_log_type_enabled(v46, v47))
      {
        int v48 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int v48 = 0;
        _os_log_impl(&dword_0, v46, v47, "Alarm domain was told to reform an NLv4 parse, which is not supported. Qualifying Alarm NLv4 parses should go directly to the Timer domain.", v48, 2u);
        swift_slowDealloc();
      }

      return v105(v103, v111, v20);
    }
    int v52 = enum case for Parse.uso(_:);
    uint64_t v53 = sub_110768();
    os_log_type_t v54 = sub_1109E8();
    BOOL v55 = os_log_type_enabled(v53, v54);
    if (v45 == v52)
    {
      if (v55)
      {
        uint64_t v56 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v56 = 0;
        os_log_type_t v57 = v54;
        uint64_t v58 = "Alarm domain was told to reform a USO parse, which is not supported. Qualifying Alarm USO parses should go"
              " directly to the Timer domain.";
LABEL_29:
        _os_log_impl(&dword_0, v53, v57, v58, v56, 2u);
        swift_slowDealloc();
      }
    }
    else if (v55)
    {
      uint64_t v56 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v56 = 0;
      os_log_type_t v57 = v54;
      uint64_t v58 = "Transformer should only be called for nlv3 parse. Check the caller to make sure it's not mis-used.";
      goto LABEL_29;
    }

    uint64_t v89 = v109;
    v105(v103, v111, v109);
    return (*(uint64_t (**)(char *, uint64_t))(v110 + 8))(v28, v89);
  }
  uint64_t v91 = v2;
  (*(void (**)(char *, uint64_t))(v34 + 96))(v28, v20);
  uint64_t v37 = v102;
  char v38 = v108;
  uint64_t v39 = v28;
  uint64_t v40 = v107;
  (*(void (**)(char *, char *, uint64_t))(v102 + 32))(v108, v39, v107);
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
  v41(v18, v38, v40);
  type metadata accessor for AlarmNLIntent();
  swift_allocObject();
  uint64_t v93 = sub_BDBE0((uint64_t)v18);
  sub_BC750((uint64_t)v10);
  uint64_t v43 = v100;
  uint64_t v42 = v101;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v100 + 48))(v10, 1, v101) == 1)
  {
    sub_1646C((uint64_t)v10, &qword_143B50);
    uint64_t v44 = v107;
LABEL_23:
    uint64_t v81 = v108;
    v41(v15, v108, v44);
    uint64_t v82 = sub_110768();
    os_log_type_t v83 = sub_1109E8();
    if (os_log_type_enabled(v82, v83))
    {
      char v84 = (uint8_t *)swift_slowAlloc();
      v113[0] = swift_slowAlloc();
      *(_DWORD *)char v84 = 136315138;
      sub_103A9C((unint64_t *)&unk_143B80, (void (*)(uint64_t))&type metadata accessor for NLIntent);
      uint64_t v85 = sub_110DB8();
      uint64_t v112 = sub_6750(v85, v86, v113);
      uint64_t v20 = v109;
      sub_110B28();
      swift_bridgeObjectRelease();
      id v87 = *(void (**)(char *, uint64_t))(v102 + 8);
      v87(v15, v44);
      _os_log_impl(&dword_0, v82, v83, "Not able to parse timer duration from alarm NLv3 intent %s", v84, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_release();
      v87(v108, v44);
    }
    else
    {

      swift_release();
      uint64_t v88 = *(void (**)(char *, uint64_t))(v102 + 8);
      v88(v15, v44);
      v88(v81, v44);
    }
    return v105(v103, v111, v20);
  }
  (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v99, v10, v42);
  sub_10F188();
  uint64_t v50 = sub_10F278();
  uint64_t v51 = *(void *)(v50 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48))(v7, 1, v50) == 1)
  {
    sub_1646C((uint64_t)v7, (uint64_t *)&unk_143B30);
    uint64_t v44 = v107;
LABEL_22:
    (*(void (**)(char *, uint64_t))(v100 + 8))(v99, v101);
    uint64_t v20 = v109;
    goto LABEL_23;
  }
  sub_10F268();
  char v60 = v59;
  (*(void (**)(char *, uint64_t))(v51 + 8))(v7, v50);
  uint64_t v44 = v107;
  if (v60) {
    goto LABEL_22;
  }
  id v61 = sub_110768();
  os_log_type_t v62 = sub_1109F8();
  if (os_log_type_enabled(v61, v62))
  {
    uint64_t v63 = (uint8_t *)swift_slowAlloc();
    v113[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v63 = 136315138;
    uint64_t v64 = sub_1109A8();
    uint64_t v112 = sub_6750(v64, v65, v113);
    sub_110B28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v61, v62, "Found timer duration from alarmTime %s", v63, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v66 = v109;
  NSString v67 = (void (*)(char *, char *, uint64_t))v105;
  uint64_t v69 = v95;
  uint64_t v68 = v96;
  sub_BC584();
  id v70 = v98;
  sub_110008();
  swift_bridgeObjectRelease();
  uint64_t v71 = v97;
  (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v97, v70, v68);
  (*(void (**)(char *, void, uint64_t))(v110 + 104))(v71, enum case for Parse.directInvocation(_:), v66);
  Class v72 = v94;
  v67(v94, v71, v66);
  id v73 = sub_110768();
  os_log_type_t v74 = sub_1109F8();
  if (os_log_type_enabled(v73, v74))
  {
    id v75 = (uint8_t *)swift_slowAlloc();
    v113[0] = swift_slowAlloc();
    *(_DWORD *)id v75 = 136315138;
    uint64_t v111 = v75 + 4;
    v105((uint64_t)v92, (uint8_t *)v72, v109);
    uint64_t v76 = sub_110858();
    uint64_t v112 = sub_6750(v76, v77, v113);
    uint64_t v66 = v109;
    sub_110B28();
    swift_bridgeObjectRelease();
    uint64_t v78 = v110;
    (*(void (**)(char *, uint64_t))(v110 + 8))(v72, v66);
    _os_log_impl(&dword_0, v73, v74, "Alarm reformed alarm parse to timer: %s", v75, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_release();
    (*(void (**)(char *, uint64_t))(v95 + 8))(v98, v96);
    (*(void (**)(char *, uint64_t))(v100 + 8))(v99, v101);
    (*(void (**)(char *, uint64_t))(v102 + 8))(v108, v107);
    uint64_t v79 = v103;
    uint64_t v80 = v78;
  }
  else
  {

    swift_release();
    uint64_t v90 = v110;
    (*(void (**)(char *, uint64_t))(v110 + 8))(v72, v66);
    (*(void (**)(char *, uint64_t))(v69 + 8))(v98, v68);
    (*(void (**)(char *, uint64_t))(v100 + 8))(v99, v101);
    (*(void (**)(char *, uint64_t))(v102 + 8))(v108, v107);
    uint64_t v79 = v103;
    uint64_t v80 = v90;
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v80 + 32))(v79, v97, v66);
}

void *sub_1016E0(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_10FC68();
  __chkstk_darwin(v4 - 8);
  uint64_t v9 = sub_110518();
  uint64_t v10 = &protocol witness table for SiriAlarmManagerImpl;
  *(void *)&long long v8 = a1;
  type metadata accessor for DeleteAlarmCATs_Async();
  sub_10FC48();
  a2[2] = sub_10FB38();
  type metadata accessor for DeleteAlarmCATPatternsExecutor(0);
  sub_10FC48();
  a2[3] = sub_10FB38();
  sub_10FC48();
  a2[4] = sub_10FB38();
  type metadata accessor for ErrorCATPatternsExecutor(0);
  sub_10FC48();
  a2[5] = sub_10FB38();
  a2[6] = _s15AlarmFlowPlugin021RecreateDeletedAlarmsB0C11osLogObject33_DB4DDA2311F8F0836B4CA98F718F999FLLSo03OS_G4_logCvpfi_0();
  a2[12] = 0;
  a2[13] = 0;
  uint64_t v5 = (char *)a2 + OBJC_IVAR____TtC15AlarmFlowPlugin19UndoCreateAlarmFlow_followupPluginAction;
  uint64_t v6 = sub_10E8D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_BE08(&v8, (uint64_t)(a2 + 7));
  return a2;
}

uint64_t sub_10185C(uint64_t a1)
{
  uint64_t v28 = a1;
  uint64_t v1 = sub_3DD4(&qword_143D48);
  uint64_t v29 = *(void *)(v1 - 8);
  uint64_t v30 = v1;
  __chkstk_darwin(v1);
  uint64_t v27 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_3DD4(&qword_143D50);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v26 - v8;
  uint64_t v10 = sub_3DD4(&qword_143D58);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v26 - v14;
  if (qword_13F218 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_110778();
  sub_3E18(v16, (uint64_t)qword_143B00);
  uint64_t v17 = sub_110768();
  os_log_type_t v18 = sub_1109F8();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_0, v17, v18, "AlarmFlowFactory: making createAlarmFlow.", v19, 2u);
    swift_slowDealloc();
  }

  sub_10FFB8();
  sub_10FFA8();
  sub_10FF98();
  swift_release();
  uint64_t v20 = &v15[*(int *)(v10 + 36)];
  uint64_t v21 = sub_110088();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v20, 1, 1, v21);
  sub_10FFA8();
  sub_10FF98();
  swift_release();
  sub_BBCC((uint64_t)v31, 0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  sub_3DD4(&qword_143D68);
  swift_allocObject();
  sub_10E5D8();
  sub_AFBC((uint64_t)v15, (uint64_t)v13, &qword_143D58);
  sub_C158(&qword_143D70, &qword_143D58);
  swift_retain();
  uint64_t v22 = v27;
  sub_10E968();
  if (qword_13F180 != -1) {
    swift_once();
  }
  uint64_t v23 = v30;
  uint64_t v24 = sub_10E958();
  swift_release();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v22, v23);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  sub_1646C((uint64_t)v15, &qword_143D58);
  return v24;
}

uint64_t sub_101CC4(char a1, char a2)
{
  uint64_t v4 = sub_3DD4(&qword_143D48);
  uint64_t v30 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_3DD4(&qword_143D50);
  uint64_t v31 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v27 - v11;
  uint64_t v13 = sub_3DD4(&qword_143D58);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  os_log_type_t v18 = (char *)&v27 - v17;
  if (a2 & 1) != 0 || (a1)
  {
    sub_10FFB8();
    uint64_t v28 = v7;
    uint64_t v29 = v4;
    sub_10FFA8();
    sub_10FF98();
    swift_release();
    uint64_t v21 = &v18[*(int *)(v13 + 36)];
    uint64_t v22 = sub_110088();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
    sub_10FFA8();
    sub_10FF98();
    swift_release();
    sub_BBCC((uint64_t)v32, a2 & 1);
    uint64_t v23 = v31;
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v10, v12, v7);
    sub_3DD4(&qword_143D68);
    swift_allocObject();
    sub_10E5D8();
    sub_AFBC((uint64_t)v18, (uint64_t)v16, &qword_143D58);
    sub_C158(&qword_143D70, &qword_143D58);
    swift_retain();
    sub_10E968();
    uint64_t v24 = v29;
    uint64_t v25 = sub_10E948();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v24);
    v32[0] = v25;
    sub_3DD4(&qword_143D78);
    sub_C158((unint64_t *)&unk_143D80, &qword_143D78);
    uint64_t v20 = sub_10E5F8();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v28);
    sub_1646C((uint64_t)v18, &qword_143D58);
  }
  else
  {
    type metadata accessor for CreateAlarmReformableFlow();
    uint64_t v19 = swift_allocObject();
    *(unsigned char *)(v19 + 16) = 0;
    *(void *)(v19 + 24) = 0;
    v32[0] = v19;
    sub_103A9C(&qword_143D60, (void (*)(uint64_t))type metadata accessor for CreateAlarmReformableFlow);
    uint64_t v20 = sub_10E5F8();
    swift_release();
  }
  return v20;
}

uint64_t sub_102128()
{
  uint64_t v0 = sub_3DD4((uint64_t *)&unk_143BA0);
  uint64_t v27 = *(void *)(v0 - 8);
  uint64_t v28 = v0;
  __chkstk_darwin(v0);
  uint64_t v26 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_3DD4(&qword_142B80);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v26 - v7;
  uint64_t v9 = sub_3DD4(&qword_143BB0);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v26 - v13;
  if (qword_13F218 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_110778();
  sub_3E18(v15, (uint64_t)qword_143B00);
  uint64_t v16 = sub_110768();
  os_log_type_t v17 = sub_1109F8();
  if (os_log_type_enabled(v16, v17))
  {
    os_log_type_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v18 = 0;
    _os_log_impl(&dword_0, v16, v17, "AlarmFlowFactory: making deleteAlarmFlow.", v18, 2u);
    swift_slowDealloc();
  }

  sub_10FFB8();
  sub_10FFA8();
  sub_10FF98();
  swift_release();
  uint64_t v19 = &v14[*(int *)(v9 + 36)];
  uint64_t v20 = sub_110088();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
  sub_10FFA8();
  sub_10FF98();
  swift_release();
  sub_CD840((uint64_t)v29);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  sub_3DD4(&qword_143BB8);
  swift_allocObject();
  sub_10E5D8();
  sub_AFBC((uint64_t)v14, (uint64_t)v12, &qword_143BB0);
  sub_C158(&qword_143BC0, &qword_143BB0);
  swift_retain();
  uint64_t v21 = v26;
  sub_10E968();
  uint64_t v22 = v28;
  uint64_t v23 = sub_10E948();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v21, v22);
  v29[0] = v23;
  sub_3DD4(&qword_143BC8);
  sub_C158(&qword_143BD0, &qword_143BC8);
  uint64_t v24 = sub_10E5F8();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  sub_1646C((uint64_t)v14, &qword_143BB0);
  return v24;
}

uint64_t sub_1025A4()
{
  uint64_t v0 = sub_3DD4((uint64_t *)&unk_143CD0);
  uint64_t v26 = *(void *)(v0 - 8);
  uint64_t v27 = v0;
  __chkstk_darwin(v0);
  uint64_t v25 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_3DD4(&qword_13F3B0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v25 - v7;
  uint64_t v9 = sub_3DD4(&qword_143CE0);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v25 - v13;
  if (qword_13F218 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_110778();
  sub_3E18(v15, (uint64_t)qword_143B00);
  uint64_t v16 = sub_110768();
  os_log_type_t v17 = sub_1109F8();
  if (os_log_type_enabled(v16, v17))
  {
    os_log_type_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v18 = 0;
    _os_log_impl(&dword_0, v16, v17, "AlarmFlowFactory: making Search Alarm Flow.", v18, 2u);
    swift_slowDealloc();
  }

  sub_10FFB8();
  sub_10FFA8();
  sub_10FF98();
  swift_release();
  uint64_t v19 = &v14[*(int *)(v9 + 36)];
  uint64_t v20 = sub_110088();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
  sub_10FFA8();
  sub_10FF98();
  swift_release();
  sub_1BE10((uint64_t)v28);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  sub_3DD4(&qword_143CE8);
  swift_allocObject();
  sub_10E5D8();
  sub_AFBC((uint64_t)v14, (uint64_t)v12, &qword_143CE0);
  sub_C158(&qword_143CF0, &qword_143CE0);
  swift_retain();
  uint64_t v21 = v25;
  sub_10E968();
  uint64_t v22 = v27;
  v28[0] = sub_10E948();
  sub_3DD4(&qword_143CF8);
  sub_C158(&qword_143D00, &qword_143CF8);
  uint64_t v23 = sub_10E5F8();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v21, v22);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  sub_1646C((uint64_t)v14, &qword_143CE0);
  return v23;
}

uint64_t sub_102A28()
{
  if (qword_13F218 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_110778();
  sub_3E18(v0, (uint64_t)qword_143B00);
  uint64_t v1 = sub_110768();
  os_log_type_t v2 = sub_1109F8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "AlarmFlowFactory: making DecideDismissOrChangeStateFlow.", v3, 2u);
    swift_slowDealloc();
  }

  sub_10E408();
  swift_allocObject();
  sub_10E418();
  uint64_t v4 = sub_10E5F8();
  swift_release();
  return v4;
}

uint64_t sub_102B6C()
{
  uint64_t v0 = sub_3DD4(&qword_143BD8);
  uint64_t v27 = *(void *)(v0 - 8);
  uint64_t v28 = v0;
  __chkstk_darwin(v0);
  uint64_t v26 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_3DD4(&qword_143BE0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v26 - v7;
  uint64_t v9 = sub_3DD4(&qword_143BE8);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v26 - v13;
  if (qword_13F218 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_110778();
  sub_3E18(v15, (uint64_t)qword_143B00);
  uint64_t v16 = sub_110768();
  os_log_type_t v17 = sub_1109F8();
  if (os_log_type_enabled(v16, v17))
  {
    os_log_type_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v18 = 0;
    _os_log_impl(&dword_0, v16, v17, "AlarmFlowFactory: making changeAlarmStatusFlow.", v18, 2u);
    swift_slowDealloc();
  }

  sub_10FFB8();
  sub_10FFA8();
  sub_10FF98();
  swift_release();
  uint64_t v19 = &v14[*(int *)(v9 + 36)];
  uint64_t v20 = sub_110088();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
  sub_10FFA8();
  sub_10FF98();
  swift_release();
  sub_92464((uint64_t)v29);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  sub_3DD4(&qword_143BF0);
  swift_allocObject();
  sub_10E5D8();
  sub_AFBC((uint64_t)v14, (uint64_t)v12, &qword_143BE8);
  sub_C158(&qword_143BF8, &qword_143BE8);
  swift_retain();
  uint64_t v21 = v26;
  sub_10E968();
  uint64_t v22 = v28;
  uint64_t v23 = sub_10E948();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v21, v22);
  v29[0] = v23;
  sub_3DD4(&qword_143C00);
  sub_C158(&qword_143C08, &qword_143C00);
  uint64_t v24 = sub_10E5F8();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  sub_1646C((uint64_t)v14, &qword_143BE8);
  return v24;
}

uint64_t sub_102FE8()
{
  uint64_t v0 = sub_3DD4((uint64_t *)&unk_143C10);
  uint64_t v27 = *(void *)(v0 - 8);
  uint64_t v28 = v0;
  __chkstk_darwin(v0);
  uint64_t v26 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_3DD4(&qword_13F938);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v26 - v7;
  uint64_t v9 = sub_3DD4(&qword_143C20);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v26 - v13;
  if (qword_13F218 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_110778();
  sub_3E18(v15, (uint64_t)qword_143B00);
  uint64_t v16 = sub_110768();
  os_log_type_t v17 = sub_1109F8();
  if (os_log_type_enabled(v16, v17))
  {
    os_log_type_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v18 = 0;
    _os_log_impl(&dword_0, v16, v17, "AlarmFlowFactory: making updateAlarmFlow.", v18, 2u);
    swift_slowDealloc();
  }

  sub_10FFB8();
  sub_10FFA8();
  sub_10FF98();
  swift_release();
  uint64_t v19 = &v14[*(int *)(v9 + 36)];
  uint64_t v20 = sub_110088();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
  sub_10FFA8();
  sub_10FF98();
  swift_release();
  sub_3147C((uint64_t)v29);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  sub_3DD4(&qword_143C28);
  swift_allocObject();
  sub_10E5D8();
  sub_AFBC((uint64_t)v14, (uint64_t)v12, &qword_143C20);
  sub_C158(&qword_143C30, &qword_143C20);
  swift_retain();
  uint64_t v21 = v26;
  sub_10E968();
  uint64_t v22 = v28;
  uint64_t v23 = sub_10E948();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v21, v22);
  v29[0] = v23;
  sub_3DD4(&qword_143C38);
  sub_C158(&qword_143C40, &qword_143C38);
  uint64_t v24 = sub_10E5F8();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  sub_1646C((uint64_t)v14, &qword_143C20);
  return v24;
}

ValueMetadata *type metadata accessor for AlarmFlowFactory()
{
  return &type metadata for AlarmFlowFactory;
}

unint64_t sub_103474()
{
  unint64_t result = qword_143C98;
  if (!qword_143C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_143C98);
  }
  return result;
}

unint64_t sub_1034C8()
{
  unint64_t result = qword_143CA8;
  if (!qword_143CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_143CA8);
  }
  return result;
}

unint64_t sub_10351C()
{
  unint64_t result = qword_143CC0;
  if (!qword_143CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_143CC0);
  }
  return result;
}

uint64_t sub_103570(uint64_t a1)
{
  uint64_t v35 = a1;
  uint64_t v1 = sub_3DD4((uint64_t *)&unk_143D10);
  uint64_t v39 = *(void *)(v1 - 8);
  uint64_t v40 = v1;
  __chkstk_darwin(v1);
  int v36 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_110088();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_3DD4(&qword_140218);
  uint64_t v37 = *(void *)(v7 - 8);
  uint64_t v38 = v7;
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v34 = (char *)&v32 - v11;
  uint64_t v12 = sub_3DD4(&qword_143D20);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v33 = (uint64_t)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v32 - v15;
  if (qword_13F218 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_110778();
  sub_3E18(v17, (uint64_t)qword_143B00);
  os_log_type_t v18 = sub_110768();
  os_log_type_t v19 = sub_1109F8();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_0, v18, v19, "AlarmFlowFactory: making dismissAlarmFlow.", v20, 2u);
    swift_slowDealloc();
  }

  sub_10FFB8();
  sub_10FFA8();
  sub_10FF98();
  swift_release();
  uint64_t v21 = &v16[*(int *)(v12 + 36)];
  uint64_t v32 = v12;
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v23 = v35;
  v22(v21, v35, v3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v21, 0, 1, v3);
  sub_10FFA8();
  sub_10FF98();
  swift_release();
  v22(v6, v23, v3);
  uint64_t v24 = v34;
  sub_42778((uint64_t)v41, (uint64_t)v6);
  uint64_t v26 = v37;
  uint64_t v25 = v38;
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v10, v24, v38);
  sub_3DD4(&qword_143D28);
  swift_allocObject();
  sub_10E5D8();
  sub_AFBC((uint64_t)v16, v33, &qword_143D20);
  sub_C158(&qword_143D30, &qword_143D20);
  swift_retain();
  uint64_t v27 = v36;
  sub_10E968();
  uint64_t v28 = v40;
  uint64_t v29 = sub_10E948();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v27, v28);
  v41[0] = v29;
  sub_3DD4(&qword_143D38);
  sub_C158(&qword_143D40, &qword_143D38);
  uint64_t v30 = sub_10E5F8();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v24, v25);
  sub_1646C((uint64_t)v16, &qword_143D20);
  return v30;
}

uint64_t sub_103A9C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_103AE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

void sub_103AEC()
{
  sub_C529C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void *sub_103B84(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    uint64_t v8 = *(int *)(a3 + 36);
    uint64_t v9 = (char *)v4 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_110088();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = sub_3DD4((uint64_t *)&unk_140770);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return v4;
}

uint64_t *sub_103D24(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  sub_31D24(a1, a2);
  uint64_t v6 = *(int *)(a3 + 36);
  long long v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_110088();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = sub_3DD4((uint64_t *)&unk_140770);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t sub_103EA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 36);
  uint64_t v6 = (void *)(a1 + v5);
  long long v7 = (const void *)(a2 + v5);
  uint64_t v8 = sub_110088();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    uint64_t v10 = sub_3DD4((uint64_t *)&unk_140770);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t sub_103FBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _s20HandleIntentStrategyVwxx_1(a1);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_110088();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_3DD4((uint64_t *)&unk_140770);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_104148(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10415C);
}

uint64_t sub_10415C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_3DD4((uint64_t *)&unk_140770);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_104210(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_104224);
}

uint64_t sub_104224(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_3DD4((uint64_t *)&unk_140770);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t _s12FlowStrategyVMa()
{
  return sub_36C78();
}

uint64_t sub_1042E8()
{
  uint64_t v0 = sub_110778();
  sub_2D924(v0, qword_143D90);
  sub_3E18(v0, (uint64_t)qword_143D90);
  return sub_1104D8();
}

uint64_t sub_104334(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  long long v4[2] = a1;
  v4[3] = a2;
  return _swift_task_switch(sub_104358, 0, 0);
}

uint64_t sub_104358()
{
  if (qword_13F220 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_110778();
  sub_3E18(v1, (uint64_t)qword_143D90);
  uint64_t v2 = sub_110768();
  os_log_type_t v3 = sub_1109F8();
  if (os_log_type_enabled(v2, v3))
  {
    unint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "AlarmIntents.FlowStrategy.makeIntentExecutionBehavior is called.", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v8 = v0[2];
  uint64_t v7 = (void *)v0[3];

  uint64_t v9 = sub_12934(v8, v7, v5 + *(int *)(v6 + 36));
  uint64_t v10 = (uint64_t (*)(uint64_t))v0[1];
  return v10(v9);
}

uint64_t sub_104490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_13024;
  return RCHFlowStrategyAsync.makeErrorResponse(error:)(a1, a2, a3, a4);
}

uint64_t sub_104554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_13024;
  return ResolveConfirmFlowStrategyAsync.makeAppDoesNotSupportIntentResponse(app:intent:)(a1, a2, a3, a4, a5);
}

uint64_t sub_104620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_13024;
  return ResolveConfirmFlowStrategyAsync.makeAppNotFoundOnDeviceResponse(app:intent:)(a1, a2, a3, a4, a5);
}

uint64_t sub_1046EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_13024;
  return ResolveConfirmFlowStrategyAsync.makeDeviceIncompatibleResponse(app:intent:)(a1, a2, a3, a4, a5);
}

uint64_t sub_1047B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_33C04;
  return ResolveConfirmFlowStrategyAsync.makeErrorResponse(error:app:intent:)(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_104894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_13024;
  return RouteConfirmIntentResponseFlowStrategyAsync.makeFailureConfirmingIntentResponse(app:intent:intentResponse:)(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_104970()
{
  return swift_getWitnessTable();
}

uint64_t sub_10498C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1049A8()
{
  return swift_getWitnessTable();
}

uint64_t sub_1049C4(uint64_t a1)
{
  uint64_t v2 = sub_3DD4(&qword_13F818);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for DeleteAlarmCATsSimple()
{
  uint64_t result = qword_143E78;
  if (!qword_143E78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_104A70()
{
  return swift_initClassMetadata2();
}

uint64_t sub_104AB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FC68();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3DD4((uint64_t *)&unk_13F780);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  sub_1C86C(a1, (uint64_t)v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = sub_10FBD8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_1C8D4(a1);
  return v11;
}

uint64_t sub_104C34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10FC68();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a2, v3);
  uint64_t v7 = sub_10FBE8();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a2, v3);
  return v7;
}

uint64_t sub_104D44()
{
  return type metadata accessor for DeleteAlarmCATsSimple();
}

void *UndoCreateAlarmFlow.__allocating_init()()
{
  sub_110518();
  uint64_t v0 = sub_110508();
  type metadata accessor for UndoCreateAlarmFlow();
  uint64_t v1 = (void *)swift_allocObject();

  return sub_1016E0(v0, v1);
}

uint64_t sub_104DB0()
{
  uint64_t v0 = sub_110778();
  sub_2D924(v0, qword_143EC8);
  sub_3E18(v0, (uint64_t)qword_143EC8);
  return sub_1104D8();
}

uint64_t sub_104DFC(uint64_t a1)
{
  return sub_47488(a1, (uint64_t (*)(void))&type metadata accessor for SiriTimeEventSender.TaskType, qword_144698, &enum case for SiriTimeEventSender.TaskType.undoCreateAlarm(_:));
}

uint64_t sub_104E24(uint64_t a1)
{
  return sub_47488(a1, (uint64_t (*)(void))&type metadata accessor for SiriTimeEventSender.Attribute, qword_1446B0, &enum case for SiriTimeEventSender.Attribute.corrections(_:));
}

void *UndoCreateAlarmFlow.__allocating_init(manager:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = sub_47568(a1, v3);
  uint64_t v6 = sub_10AEA8(v5, v1, v3, v4);
  _s20HandleIntentStrategyVwxx_1(a1);
  return v6;
}

uint64_t type metadata accessor for UndoCreateAlarmFlow()
{
  uint64_t result = qword_143F30;
  if (!qword_143F30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *UndoCreateAlarmFlow.init(manager:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = sub_47568(a1, v3);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  uint64_t v9 = sub_10ACF8((uint64_t)v7, v1, v3, v4);
  _s20HandleIntentStrategyVwxx_1(a1);
  return v9;
}

uint64_t UndoCreateAlarmFlow.on(input:)()
{
  uint64_t v0 = sub_3DD4(&qword_140438);
  __chkstk_darwin(v0 - 8);
  uint64_t v73 = (uint64_t)&v70 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_110038();
  uint64_t v77 = *(void *)(v2 - 8);
  uint64_t v78 = v2;
  __chkstk_darwin(v2);
  uint64_t v76 = (char *)&v70 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_3DD4(&qword_13F7F8);
  __chkstk_darwin(v4 - 8);
  os_log_type_t v83 = (char *)&v70 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1103B8();
  uint64_t v81 = *(void *)(v6 - 8);
  uint64_t v82 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  id v75 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v80 = (char *)&v70 - v9;
  uint64_t v10 = sub_10FFF8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v79 = (char *)&v70 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v70 - v14;
  uint64_t v16 = sub_10EE68();
  uint64_t v17 = *(void (***)(char *, char *, uint64_t))(v16 - 8);
  __chkstk_darwin(v16);
  os_log_type_t v19 = (char *)&v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10EE88();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v70 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10EE08();
  if ((*(unsigned int (**)(char *, uint64_t))(v21 + 88))(v23, v20) != enum case for Parse.directInvocation(_:))
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
    return 0;
  }
  (*(void (**)(char *, uint64_t))(v21 + 96))(v23, v20);
  v17[4](v19, v23, v16);
  uint64_t v24 = sub_10EE58();
  uint64_t v25 = (char *)v16;
  uint64_t v26 = v19;
  if (!v24)
  {
LABEL_15:
    ((void (*)(char *, char *))v17[1])(v26, v25);
    return 0;
  }
  uint64_t v27 = v24;
  Class v72 = v26;
  uint64_t v28 = *(void (**)(char *, void, uint64_t))(v11 + 104);
  v28(v15, enum case for DirectInvocationUtils.Alarm.UserInfoKey.verb(_:), v10);
  uint64_t v29 = sub_10FFE8();
  uint64_t v31 = v30;
  uint64_t v32 = v15;
  uint64_t v33 = *(void (**)(char *, uint64_t))(v11 + 8);
  v33(v32, v10);
  if (*(void *)(v27 + 16) && (unint64_t v34 = sub_14FB0(v29, v31), (v35 & 1) != 0))
  {
    sub_69E0(*(void *)(v27 + 56) + 32 * v34, (uint64_t)&v85);
  }
  else
  {
    long long v85 = 0u;
    long long v86 = 0u;
  }
  uint64_t v36 = (uint64_t)v83;
  swift_bridgeObjectRelease();
  if (!*((void *)&v86 + 1))
  {
    swift_bridgeObjectRelease();
    sub_1646C((uint64_t)&v85, (uint64_t *)&unk_1408B0);
LABEL_14:
    uint64_t v26 = v72;
    goto LABEL_15;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  os_log_type_t v83 = v25;
  sub_110398();
  uint64_t v37 = v81;
  uint64_t v38 = v82;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v81 + 48))(v36, 1, v82) == 1)
  {
    ((void (*)(char *, char *))v17[1])(v72, v83);
    swift_bridgeObjectRelease();
    sub_1646C(v36, &qword_13F7F8);
    return 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v80, v36, v38);
  uint64_t v40 = v79;
  v28(v79, enum case for DirectInvocationUtils.Alarm.UserInfoKey.alarmId(_:), v10);
  uint64_t v41 = sub_10FFE8();
  uint64_t v43 = v42;
  v33(v40, v10);
  if (*(void *)(v27 + 16))
  {
    unint64_t v44 = sub_14FB0(v41, v43);
    if (v45)
    {
      sub_69E0(*(void *)(v27 + 56) + 32 * v44, (uint64_t)&v85);
    }
    else
    {
      long long v85 = 0u;
      long long v86 = 0u;
    }
    uint64_t v46 = v81;
    os_log_type_t v47 = v83;
  }
  else
  {
    long long v85 = 0u;
    long long v86 = 0u;
    uint64_t v46 = v81;
    os_log_type_t v47 = v83;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v86 + 1))
  {
    swift_bridgeObjectRelease();
    sub_1646C((uint64_t)&v85, (uint64_t *)&unk_1408B0);
LABEL_30:
    (*(void (**)(char *, uint64_t))(v46 + 8))(v80, v82);
LABEL_44:
    ((void (*)(char *, char *))v17[1])(v72, v47);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
  uint64_t v81 = v27;
  uint64_t v79 = (char *)v17;
  uint64_t v48 = *((void *)&v84 + 1);
  uint64_t v71 = v84;
  uint64_t v49 = sub_10EE48();
  uint64_t v51 = v50;
  int v52 = v76;
  uint64_t v53 = v77;
  uint64_t v54 = v78;
  (*(void (**)(char *, void, uint64_t))(v77 + 104))(v76, enum case for DirectInvocationUtils.Alarm.URI.undo(_:), v78);
  uint64_t v55 = sub_110028();
  uint64_t v57 = v56;
  (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v54);
  if (v49 == v55 && v51 == v57)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v58 = sub_110DE8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v58 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      os_log_type_t v62 = *(void (**)(char *, uint64_t))(v46 + 8);
      uint64_t v17 = (void (**)(char *, char *, uint64_t))v79;
      uint64_t v60 = v82;
      os_log_type_t v47 = v83;
      goto LABEL_43;
    }
  }
  char v59 = v75;
  uint64_t v60 = v82;
  (*(void (**)(char *, void, uint64_t))(v46 + 104))(v75, enum case for AlarmNLv4Constants.AlarmVerb.delete(_:), v82);
  sub_10B0A8(&qword_140440, (void (*)(uint64_t))&type metadata accessor for AlarmNLv4Constants.AlarmVerb);
  sub_1108D8();
  sub_1108D8();
  if (v85 == v84) {
    char v61 = 1;
  }
  else {
    char v61 = sub_110DE8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_log_type_t v62 = *(void (**)(char *, uint64_t))(v46 + 8);
  v62(v59, v60);
  if ((v61 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v17 = (void (**)(char *, char *, uint64_t))v79;
    os_log_type_t v47 = v83;
LABEL_43:
    v62(v80, v60);
    goto LABEL_44;
  }
  if (qword_13F228 != -1) {
    swift_once();
  }
  uint64_t v63 = sub_110778();
  sub_3E18(v63, (uint64_t)qword_143EC8);
  uint64_t v64 = sub_110768();
  os_log_type_t v65 = sub_1109F8();
  if (os_log_type_enabled(v64, v65))
  {
    uint64_t v66 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v66 = 0;
    _os_log_impl(&dword_0, v64, v65, "UndoCreateAlarmFlow: accepting input.", v66, 2u);
    swift_slowDealloc();
  }

  uint64_t v67 = v74;
  *(void *)(v74 + 96) = v71;
  *(void *)(v67 + 104) = v48;
  swift_bridgeObjectRelease();
  uint64_t v68 = v73;
  sub_385F8(v81, v73);
  swift_bridgeObjectRelease();
  v62(v80, v60);
  (*((void (**)(char *, char *))v79 + 1))(v72, v83);
  uint64_t v69 = v67 + OBJC_IVAR____TtC15AlarmFlowPlugin19UndoCreateAlarmFlow_followupPluginAction;
  swift_beginAccess();
  sub_4E844(v68, v69);
  swift_endAccess();
  return 1;
}

uint64_t UndoCreateAlarmFlow.execute(completion:)()
{
  return sub_10E618();
}

uint64_t UndoCreateAlarmFlow.execute()(uint64_t a1)
{
  v2[31] = a1;
  v2[32] = v1;
  sub_3DD4(&qword_140438);
  v2[33] = swift_task_alloc();
  uint64_t v3 = sub_10E8D8();
  v2[34] = v3;
  v2[35] = *(void *)(v3 - 8);
  v2[36] = swift_task_alloc();
  uint64_t v4 = sub_10FD28();
  v2[37] = v4;
  v2[38] = *(void *)(v4 - 8);
  v2[39] = swift_task_alloc();
  sub_3DD4(&qword_1401D0);
  v2[40] = swift_task_alloc();
  v2[41] = swift_task_alloc();
  uint64_t v5 = sub_10E828();
  v2[42] = v5;
  v2[43] = *(void *)(v5 - 8);
  v2[44] = swift_task_alloc();
  uint64_t v6 = sub_110778();
  v2[45] = v6;
  v2[46] = *(void *)(v6 - 8);
  v2[47] = swift_task_alloc();
  uint64_t v7 = sub_10FD58();
  v2[48] = v7;
  v2[49] = *(void *)(v7 - 8);
  v2[50] = swift_task_alloc();
  uint64_t v8 = sub_10FD78();
  v2[51] = v8;
  v2[52] = *(void *)(v8 - 8);
  v2[53] = swift_task_alloc();
  uint64_t v9 = sub_10EAB8();
  v2[54] = v9;
  v2[55] = *(void *)(v9 - 8);
  v2[56] = swift_task_alloc();
  sub_3DD4(&qword_140458);
  v2[57] = swift_task_alloc();
  sub_3DD4(&qword_140460);
  v2[58] = swift_task_alloc();
  sub_3DD4(&qword_140468);
  v2[59] = swift_task_alloc();
  uint64_t v10 = sub_10FD38();
  v2[60] = v10;
  v2[61] = *(void *)(v10 - 8);
  v2[62] = swift_task_alloc();
  uint64_t v11 = sub_10E8A8();
  v2[63] = v11;
  v2[64] = *(void *)(v11 - 8);
  v2[65] = swift_task_alloc();
  return _swift_task_switch(sub_105F4C, 0, 0);
}

uint64_t sub_105F4C()
{
  uint64_t v1 = v0[65];
  uint64_t v2 = v0[63];
  uint64_t v3 = v0[64];
  uint64_t v4 = enum case for ActivityType.correction(_:);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 104);
  v0[66] = v5;
  v0[67] = (v3 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v5(v1, v4, v2);
  if (qword_13F230 != -1) {
    swift_once();
  }
  uint64_t v7 = v0[61];
  uint64_t v6 = v0[62];
  uint64_t v9 = v0[59];
  uint64_t v8 = v0[60];
  uint64_t v10 = sub_3E18(v8, (uint64_t)qword_144698);
  v0[68] = v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v10, v8);
  uint64_t v11 = sub_10E708();
  v0[69] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
  v0[70] = v13;
  v0[71] = (v12 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v13(v9, 1, 1, v11);
  if (qword_13F238 != -1) {
    swift_once();
  }
  uint64_t v14 = v0[64];
  uint64_t v16 = v0[61];
  uint64_t v15 = v0[62];
  uint64_t v17 = v0[59];
  uint64_t v45 = v0[65];
  uint64_t v46 = v0[60];
  uint64_t v19 = v0[57];
  uint64_t v18 = v0[58];
  uint64_t v20 = v0[38];
  uint64_t v44 = v0[37];
  uint64_t v47 = v0[32];
  uint64_t v48 = v0[63];
  uint64_t v21 = sub_10FD48();
  v0[72] = v21;
  uint64_t v22 = sub_3E18(v21, (uint64_t)qword_1446B0);
  v0[73] = v22;
  uint64_t v23 = *(void *)(v21 - 8);
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
  v0[74] = v24;
  v0[75] = (v23 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v24(v18, v22, v21);
  uint64_t v25 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v23 + 56);
  v0[76] = v25;
  v0[77] = (v23 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v25(v18, 0, 1, v21);
  uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
  v0[78] = v26;
  v0[79] = (v20 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v26(v19, 1, 1, v44);
  sub_10FD18();
  sub_1646C(v19, &qword_140458);
  sub_1646C(v18, &qword_140460);
  sub_1646C(v17, &qword_140468);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v46);
  uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  v0[80] = v27;
  v0[81] = (v14 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v27(v45, v48);
  uint64_t v28 = *(void *)(v47 + 104);
  v0[82] = v28;
  if (v28)
  {
    uint64_t v29 = v0[32];
    uint64_t v30 = *(void *)(v29 + 96);
    swift_bridgeObjectRetain();
    uint64_t v31 = (void *)swift_task_alloc();
    v0[83] = v31;
    v31[2] = v30;
    v31[3] = v28;
    v31[4] = v29;
    uint64_t v32 = (void *)swift_task_alloc();
    v0[84] = v32;
    uint64_t v33 = sub_3DD4(qword_140EA0);
    *uint64_t v32 = v0;
    v32[1] = sub_106494;
    return withCheckedContinuation<A>(isolation:function:_:)(v0 + 30, 0, 0, 0xD000000000000010, 0x8000000000117780, sub_10AF98, v31, v33);
  }
  else
  {
    if (qword_13F228 != -1) {
      swift_once();
    }
    sub_3E18(v0[45], (uint64_t)qword_143EC8);
    unint64_t v34 = sub_110768();
    os_log_type_t v35 = sub_1109E8();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl(&dword_0, v34, v35, "UndoCreateAlarmFlow: No alarm id to delete! This should never happen.", v36, 2u);
      swift_slowDealloc();
    }
    uint64_t v38 = v0[38];
    uint64_t v37 = v0[39];
    uint64_t v39 = v0[37];

    (*(void (**)(uint64_t, void, uint64_t))(v38 + 104))(v37, enum case for SiriTimeEventSender.ReasonDescription.noAlarmToDelete(_:), v39);
    uint64_t v40 = (void *)swift_task_alloc();
    v0[98] = v40;
    *uint64_t v40 = v0;
    v40[1] = sub_107EAC;
    uint64_t v41 = v0[39];
    uint64_t v42 = v0[31];
    return sub_109B34(v42, v41);
  }
}

uint64_t sub_106494()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_1065AC, 0, 0);
}

uint64_t sub_1065AC()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0[30];
  v0[85] = v1;
  if (v1)
  {
    uint64_t v2 = v0[32];
    uint64_t v3 = swift_task_alloc();
    v0[86] = v3;
    *(void *)(v3 + 16) = v2;
    *(void *)(v3 + 24) = v1;
    uint64_t v4 = (void *)swift_task_alloc();
    v0[87] = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_10680C;
    return withCheckedContinuation<A>(isolation:function:_:)(v0 + 101, 0, 0, 0xD000000000000013, 0x80000000001177A0, sub_10AFA4, v3, &type metadata for Bool);
  }
  else
  {
    if (qword_13F228 != -1) {
      swift_once();
    }
    sub_3E18(v0[45], (uint64_t)qword_143EC8);
    uint64_t v5 = sub_110768();
    os_log_type_t v6 = sub_1109E8();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_0, v5, v6, "UndoCreateAlarmFlow: No alarm id to delete! This should never happen.", v7, 2u);
      swift_slowDealloc();
    }
    uint64_t v9 = v0[38];
    uint64_t v8 = v0[39];
    uint64_t v10 = v0[37];

    (*(void (**)(uint64_t, void, uint64_t))(v9 + 104))(v8, enum case for SiriTimeEventSender.ReasonDescription.noAlarmToDelete(_:), v10);
    uint64_t v11 = (void *)swift_task_alloc();
    v0[98] = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_107EAC;
    uint64_t v12 = v0[39];
    uint64_t v13 = v0[31];
    return sub_109B34(v13, v12);
  }
}

uint64_t sub_10680C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_106924, 0, 0);
}

uint64_t sub_106924()
{
  uint64_t v43 = v0;
  if (*(unsigned char *)(v0 + 808) == 1)
  {
    uint64_t v1 = sub_800B8(0, 0);
    *(void *)(v0 + 704) = v1;
    uint64_t v2 = *(void **)(v0 + 680);
    if (v1)
    {
      uint64_t v41 = (uint64_t)v1;
      sub_3DD4(&qword_1401E8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_111BF0;
      *(void *)(inited + 32) = v2;
      v42[0] = inited;
      sub_110928();
      id v4 = v2;
      sub_13370(v42[0]);
      swift_bridgeObjectRelease();
      if (qword_13F228 != -1) {
        swift_once();
      }
      uint64_t v5 = sub_3E18(*(void *)(v0 + 360), (uint64_t)qword_143EC8);
      *(void *)(v0 + 712) = v5;
      os_log_type_t v6 = sub_110768();
      os_log_type_t v7 = sub_1109F8();
      if (os_log_type_enabled(v6, v7))
      {
        uint64_t v8 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_0, v6, v7, "UndoCreateAlarmFlow: RF path for undoing a create alarm.", v8, 2u);
        swift_slowDealloc();
      }
      uint64_t v10 = *(void *)(v0 + 392);
      uint64_t v9 = *(void *)(v0 + 400);
      uint64_t v12 = *(void *)(v0 + 376);
      uint64_t v11 = *(void *)(v0 + 384);
      uint64_t v14 = *(void *)(v0 + 360);
      uint64_t v13 = *(void *)(v0 + 368);
      uint64_t v15 = *(void *)(v0 + 256);

      (*(void (**)(uint64_t, void, uint64_t))(v10 + 104))(v9, enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), v11);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v5, v14);
      mach_absolute_time();
      sub_10FD88();
      uint64_t v16 = *(void *)(v15 + 32);
      uint64_t v40 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_1429E0 + dword_1429E0);
      swift_retain();
      uint64_t v17 = (void *)swift_task_alloc();
      *(void *)(v0 + 720) = v17;
      *uint64_t v17 = v0;
      v17[1] = sub_10708C;
      return v40(0, v16, v41);
    }
    else
    {
      uint64_t v22 = sub_1101A8();
      *(void *)(v0 + 120) = v22;
      *(void *)(v0 + 128) = &protocol witness table for ABCReport;
      uint64_t v23 = sub_31294((uint64_t *)(v0 + 96));
      *uint64_t v23 = 0xD000000000000013;
      v23[1] = 0x80000000001177C0;
      uint64_t v24 = enum case for UnhandledAbortSubtype.expectedObject(_:);
      uint64_t v25 = sub_1100D8();
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 104))(v23, v24, v25);
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v23, enum case for ABCReport.unhandledAbort(_:), v22);
      sub_10FF28();
      _s20HandleIntentStrategyVwxx_1(v0 + 96);
      v42[0] = 0;
      v42[1] = 0xE000000000000000;
      sub_110BD8(87);
      v45._countAndFlagsBits = 0xD000000000000055;
      v45._object = (void *)0x80000000001177E0;
      sub_1108A8(v45);
      id v26 = [v2 description];
      uint64_t v27 = sub_110848();
      uint64_t v29 = v28;

      v46._countAndFlagsBits = v27;
      v46._object = v29;
      sub_1108A8(v46);
      swift_bridgeObjectRelease();
      if (qword_13F228 != -1) {
        swift_once();
      }
      uint64_t v30 = *(void *)(v0 + 360);
      uint64_t v31 = *(void *)(v0 + 368);
      uint64_t v33 = *(void *)(v0 + 320);
      uint64_t v32 = *(void *)(v0 + 328);
      uint64_t v34 = sub_3E18(v30, (uint64_t)qword_143EC8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v32, v34, v30);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v31 + 56))(v32, 0, 1, v30);
      sub_AFBC(v32, v33, &qword_1401D0);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v33, 1, v30) == 1)
      {
        sub_1646C(*(void *)(v0 + 320), &qword_1401D0);
      }
      else
      {
        swift_bridgeObjectRetain_n();
        os_log_type_t v35 = sub_110768();
        os_log_type_t v36 = sub_1109E8();
        if (os_log_type_enabled(v35, v36))
        {
          uint64_t v37 = swift_slowAlloc();
          v42[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v37 = 136315650;
          uint64_t v38 = sub_110BF8();
          *(void *)(v0 + 216) = sub_6750(v38, v39, v42);
          sub_110B28();
          swift_bridgeObjectRelease();
          *(_WORD *)(v37 + 12) = 2048;
          *(void *)(v0 + 208) = 84;
          sub_110B28();
          *(_WORD *)(v37 + 22) = 2080;
          swift_bridgeObjectRetain();
          *(void *)(v0 + 200) = sub_6750(0, 0xE000000000000000, v42);
          sub_110B28();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_0, v35, v36, "FatalError at %s:%lu - %s", (uint8_t *)v37, 0x20u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        (*(void (**)(void, void))(*(void *)(v0 + 368) + 8))(*(void *)(v0 + 320), *(void *)(v0 + 360));
      }
      sub_10E758();
      return sub_110CB8();
    }
  }
  else
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 304) + 104))(*(void *)(v0 + 312), enum case for SiriTimeEventSender.ReasonDescription.failedToDeleteAlarm(_:), *(void *)(v0 + 296));
    uint64_t v19 = (void *)swift_task_alloc();
    *(void *)(v0 + 776) = v19;
    void *v19 = v0;
    v19[1] = sub_107844;
    uint64_t v20 = *(void *)(v0 + 312);
    uint64_t v21 = *(void *)(v0 + 248);
    return sub_109B34(v21, v20);
  }
}

uint64_t sub_10708C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 728) = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    uint64_t v5 = sub_107420;
  }
  else
  {
    *(void *)(v4 + 736) = a1;
    uint64_t v5 = sub_1071D8;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_1071D8()
{
  sub_10E7B8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[93] = v1;
  void *v1 = v0;
  v1[1] = sub_107290;
  uint64_t v2 = v0[56];
  uint64_t v3 = v0[53];
  uint64_t v4 = v0[44];
  return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)(v0 + 17, v4, v2, v3, 0);
}

uint64_t sub_107290()
{
  uint64_t v2 = *(void **)(*(void *)v1 + 736);
  uint64_t v3 = *(void *)(*(void *)v1 + 352);
  uint64_t v4 = *(void *)(*(void *)v1 + 344);
  uint64_t v5 = *(void *)(*(void *)v1 + 336);
  *(void *)(*(void *)v1 + 752) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);

  if (v0) {
    uint64_t v6 = sub_108478;
  }
  else {
    uint64_t v6 = sub_107668;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_107420()
{
  uint64_t v13 = v0;
  (*(void (**)(void, void))(v0[52] + 8))(v0[53], v0[51]);
  uint64_t v1 = v0[91];
  v0[99] = v1;
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_110768();
  os_log_type_t v3 = sub_1109E8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v12 = v5;
    v0[28] = v1;
    swift_errorRetain();
    sub_3DD4(&qword_13FA70);
    uint64_t v6 = sub_110858();
    v0[29] = sub_6750(v6, v7, &v12);
    sub_110B28();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "UndoCreateAlarmFlow: Error in RF path: %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(void, void, void))(v0[38] + 104))(v0[39], enum case for SiriTimeEventSender.ReasonDescription.errorProducingOutput(_:), v0[37]);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[100] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_1081B8;
  uint64_t v9 = v0[39];
  uint64_t v10 = v0[31];
  return sub_109B34(v10, v9);
}

uint64_t sub_107668()
{
  sub_10EC28();
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[11];
  sub_17BD8(v0 + 7, v1);
  os_log_type_t v3 = (void *)swift_task_alloc();
  v0[95] = v3;
  *os_log_type_t v3 = v0;
  v3[1] = sub_107730;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v0 + 17, v1, v2);
}

uint64_t sub_107730()
{
  *(void *)(*(void *)v1 + 768) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1086C0;
  }
  else {
    uint64_t v2 = sub_107AD0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_107844()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 312);
  uint64_t v2 = *(void *)(*(void *)v0 + 304);
  uint64_t v3 = *(void *)(*(void *)v0 + 296);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return _swift_task_switch(sub_10799C, 0, 0);
}

uint64_t sub_10799C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_107AD0()
{
  uint64_t v33 = (void (*)(uint64_t, uint64_t))v0[80];
  uint64_t v28 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[78];
  uint64_t v27 = (void (*)(uint64_t, void, uint64_t, uint64_t))v0[76];
  id v26 = (void (*)(uint64_t, uint64_t, uint64_t))v0[74];
  uint64_t v24 = v0[72];
  uint64_t v25 = v0[73];
  uint64_t v22 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[70];
  uint64_t v21 = v0[69];
  uint64_t v20 = (void (*)(uint64_t, void, uint64_t))v0[66];
  uint64_t v18 = v0[65];
  uint64_t v19 = v0[63];
  uint64_t v2 = v0[58];
  uint64_t v1 = v0[59];
  uint64_t v3 = v0[56];
  uint64_t v4 = v0[57];
  uint64_t v5 = v0[54];
  uint64_t v6 = v0[55];
  uint64_t v8 = v0[52];
  uint64_t v7 = v0[53];
  uint64_t v9 = v0[51];
  uint64_t v23 = v0[37];
  uint64_t v31 = v0[35];
  uint64_t v32 = v0[34];
  uint64_t v29 = v0[32];
  uint64_t v30 = v0[33];
  swift_release();
  _s20HandleIntentStrategyVwxx_1((uint64_t)(v0 + 17));
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v5);
  _s20HandleIntentStrategyVwxx_1((uint64_t)(v0 + 7));
  v20(v18, enum case for ActivityType.completed(_:), v19);
  v22(v1, 1, 1, v21);
  v26(v2, v25, v24);
  v27(v2, 0, 1, v24);
  v28(v4, 1, 1, v23);
  sub_10FD18();
  sub_1646C(v4, &qword_140458);
  sub_1646C(v2, &qword_140460);
  sub_1646C(v1, &qword_140468);
  v33(v18, v19);
  uint64_t v10 = v29 + OBJC_IVAR____TtC15AlarmFlowPlugin19UndoCreateAlarmFlow_followupPluginAction;
  swift_beginAccess();
  sub_AFBC(v10, v30, &qword_140438);
  int v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v30, 1, v32);
  uint64_t v12 = (void *)v0[85];
  if (v11 == 1)
  {
    sub_1646C(v0[33], &qword_140438);
    sub_10E9C8();
  }
  else
  {
    uint64_t v14 = v0[35];
    uint64_t v13 = v0[36];
    uint64_t v15 = v0[34];
    (*(void (**)(uint64_t, void, uint64_t))(v14 + 32))(v13, v0[33], v15);
    sub_10E9D8();

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_107EAC()
{
  uint64_t v1 = *(void *)(*v0 + 312);
  uint64_t v2 = *(void *)(*v0 + 304);
  uint64_t v3 = *(void *)(*v0 + 296);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_1081B8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 312);
  uint64_t v2 = *(void *)(*(void *)v0 + 304);
  uint64_t v3 = *(void *)(*(void *)v0 + 296);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return _swift_task_switch(sub_108310, 0, 0);
}

uint64_t sub_108310()
{
  uint64_t v1 = (void *)v0[85];
  uint64_t v3 = v0[55];
  uint64_t v2 = v0[56];
  uint64_t v4 = v0[54];
  swift_release();
  swift_errorRelease();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_108478()
{
  uint64_t v13 = v0;
  (*(void (**)(void, void))(v0[52] + 8))(v0[53], v0[51]);
  uint64_t v1 = v0[94];
  v0[99] = v1;
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_110768();
  os_log_type_t v3 = sub_1109E8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v12 = v5;
    v0[28] = v1;
    swift_errorRetain();
    sub_3DD4(&qword_13FA70);
    uint64_t v6 = sub_110858();
    v0[29] = sub_6750(v6, v7, &v12);
    sub_110B28();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "UndoCreateAlarmFlow: Error in RF path: %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(void, void, void))(v0[38] + 104))(v0[39], enum case for SiriTimeEventSender.ReasonDescription.errorProducingOutput(_:), v0[37]);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[100] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_1081B8;
  uint64_t v9 = v0[39];
  uint64_t v10 = v0[31];
  return sub_109B34(v10, v9);
}

uint64_t sub_1086C0()
{
  uint64_t v16 = v0;
  uint64_t v2 = v0[52];
  uint64_t v1 = v0[53];
  uint64_t v3 = v0[51];
  _s20HandleIntentStrategyVwxx_1((uint64_t)(v0 + 17));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  _s20HandleIntentStrategyVwxx_1((uint64_t)(v0 + 7));
  uint64_t v4 = v0[96];
  v0[99] = v4;
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = sub_110768();
  os_log_type_t v6 = sub_1109E8();
  if (os_log_type_enabled(v5, v6))
  {
    unint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)unint64_t v7 = 136315138;
    uint64_t v15 = v8;
    v0[28] = v4;
    swift_errorRetain();
    sub_3DD4(&qword_13FA70);
    uint64_t v9 = sub_110858();
    v0[29] = sub_6750(v9, v10, &v15);
    sub_110B28();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v5, v6, "UndoCreateAlarmFlow: Error in RF path: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(void, void, void))(v0[38] + 104))(v0[39], enum case for SiriTimeEventSender.ReasonDescription.errorProducingOutput(_:), v0[37]);
  int v11 = (void *)swift_task_alloc();
  v0[100] = v11;
  *int v11 = v0;
  v11[1] = sub_1081B8;
  uint64_t v12 = v0[39];
  uint64_t v13 = v0[31];
  return sub_109B34(v13, v12);
}

uint64_t sub_108924(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v37 = a4;
  uint64_t v36 = sub_3DD4(&qword_141070);
  uint64_t v7 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v34 = v8;
  os_log_type_t v35 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_110758();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_13F228 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_110778();
  sub_3E18(v13, (uint64_t)qword_143EC8);
  swift_bridgeObjectRetain_n();
  uint64_t v14 = sub_110768();
  os_log_type_t v15 = sub_1109F8();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v33 = a2;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v32 = a1;
    v39[0] = v18;
    uint64_t v31 = v12;
    *(_DWORD *)uint64_t v17 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_6750(v33, a3, v39);
    uint64_t v12 = v31;
    sub_110B28();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v14, v15, "UndoCreateAlarmFlow.searchAlarm for %s", v17, 0xCu);
    swift_arrayDestroy();
    a1 = v32;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_1104A8();
  id v19 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  swift_bridgeObjectRetain();
  NSString v20 = sub_110838();
  swift_bridgeObjectRelease();
  NSString v21 = sub_110838();
  id v22 = [v19 initWithIdentifier:v20 displayString:v21];

  sub_110A28();
  uint64_t v23 = v37;
  sub_110748();
  sub_110738();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_BD80(v23 + 56, (uint64_t)v39);
  sub_17BD8(v39, v39[3]);
  uint64_t v25 = v35;
  uint64_t v24 = v36;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v35, a1, v36);
  unint64_t v26 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = v23;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v27 + v26, v25, v24);
  id v28 = v22;
  swift_retain();
  sub_1105B8();

  swift_release();
  return _s20HandleIntentStrategyVwxx_1((uint64_t)v39);
}

uint64_t sub_108DA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v41 = a3;
  uint64_t v4 = sub_1103E8();
  uint64_t v39 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v40 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v39 - v7;
  uint64_t v9 = sub_3DD4(&qword_140660);
  __chkstk_darwin(v9);
  uint64_t v11 = (uint64_t *)((char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = sub_110758();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  os_log_type_t v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_110A18();
  sub_110748();
  sub_110738();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  sub_AFBC(a1, (uint64_t)v11, &qword_140660);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    uint64_t v30 = *v11;
    if ((unint64_t)*v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_110CD8();
      swift_bridgeObjectRelease();
      if (v33 == 1)
      {
        swift_bridgeObjectRetain();
        uint64_t v34 = sub_110CD8();
        swift_bridgeObjectRelease();
        if (v34) {
          goto LABEL_9;
        }
      }
    }
    else if (*(void *)((char *)&dword_10 + (v30 & 0xFFFFFFFFFFFFFF8)) == 1)
    {
LABEL_9:
      if ((v30 & 0xC000000000000001) != 0)
      {
        id v31 = (id)sub_110C18();
        goto LABEL_12;
      }
      if (*(void *)((char *)&dword_10 + (v30 & 0xFFFFFFFFFFFFFF8)))
      {
        id v31 = *(id *)(v30 + 32);
LABEL_12:
        uint64_t v32 = (uint64_t)v31;
        swift_bridgeObjectRelease();
        v42[0] = v32;
LABEL_19:
        sub_3DD4(&qword_141070);
        return sub_110998();
      }
      __break(1u);
      goto LABEL_22;
    }
    swift_bridgeObjectRelease();
    if (qword_13F228 == -1)
    {
LABEL_16:
      uint64_t v35 = sub_110778();
      sub_3E18(v35, (uint64_t)qword_143EC8);
      uint64_t v36 = sub_110768();
      os_log_type_t v37 = sub_1109E8();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v38 = 0;
        _os_log_impl(&dword_0, v36, v37, "UndoCreateAlarmFlow: Alarm not found.", v38, 2u);
        swift_slowDealloc();
      }

      v42[0] = 0;
      goto LABEL_19;
    }
LABEL_22:
    swift_once();
    goto LABEL_16;
  }
  uint64_t v16 = v39;
  uint64_t v17 = *(void (**)(char *, uint64_t *, uint64_t))(v39 + 32);
  v17(v8, v11, v4);
  uint64_t v18 = v8;
  if (qword_13F228 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_110778();
  sub_3E18(v19, (uint64_t)qword_143EC8);
  NSString v20 = sub_110768();
  os_log_type_t v21 = sub_1109E8();
  if (os_log_type_enabled(v20, v21))
  {
    id v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v22 = 0;
    _os_log_impl(&dword_0, v20, v21, "UndoCreateAlarmFlow: Alarm search failure.", v22, 2u);
    swift_slowDealloc();
  }

  v42[0] = 0;
  sub_3DD4(&qword_141070);
  sub_110998();
  uint64_t v23 = sub_1101A8();
  v42[3] = v23;
  v42[4] = (uint64_t)&protocol witness table for ABCReport;
  uint64_t v24 = sub_31294(v42);
  uint64_t v25 = v40;
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v40, v18, v4);
  sub_10B0A8(&qword_140658, (void (*)(uint64_t))&type metadata accessor for AlarmOperationError);
  swift_allocError();
  v17(v26, (uint64_t *)v25, v4);
  *uint64_t v24 = sub_10E0C8();
  uint64_t v27 = enum case for ErrorSubType.managerReturnedError(_:);
  uint64_t v28 = sub_10FEB8();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 104))(v24, v27, v28);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v23 - 8) + 104))(v24, enum case for ABCReport.alarmUndoHandle(_:), v23);
  sub_10FF28();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v4);
  _s20HandleIntentStrategyVwxx_1((uint64_t)v42);
  return swift_errorRelease();
}

uint64_t sub_1093C8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = a3;
  uint64_t v19 = a1;
  uint64_t v4 = sub_3DD4(&qword_144068);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  uint64_t v7 = sub_110758();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_110A28();
  sub_110748();
  sub_110738();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_BD80(a2 + 56, (uint64_t)v21);
  v17[1] = v21[4];
  sub_17BD8(v21, v21[3]);
  sub_3DD4(&qword_1401E8);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_111BF0;
  uint64_t v12 = v18;
  *(void *)(v11 + 32) = v18;
  uint64_t v20 = v11;
  sub_110928();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v19, v4);
  unint64_t v13 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v14 + v13, (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  id v15 = v12;
  swift_retain();
  sub_110598();
  swift_bridgeObjectRelease();
  swift_release();
  return _s20HandleIntentStrategyVwxx_1((uint64_t)v21);
}

uint64_t sub_10966C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v31 = a3;
  uint64_t v4 = sub_1103E8();
  uint64_t v29 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v30 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v29 - v7;
  uint64_t v9 = sub_3DD4(&qword_140660);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_110758();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  id v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_110A18();
  sub_110748();
  sub_110738();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  sub_AFBC(a1, (uint64_t)v11, &qword_140660);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v16 = v29;
    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v29 + 32);
    v17(v8, v11, v4);
    if (qword_13F228 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_110778();
    sub_3E18(v18, (uint64_t)qword_143EC8);
    uint64_t v19 = sub_110768();
    os_log_type_t v20 = sub_1109E8();
    if (os_log_type_enabled(v19, v20))
    {
      os_log_type_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v21 = 0;
      _os_log_impl(&dword_0, v19, v20, "UndoCreateAlarmFlow: Failed to delete alarm.", v21, 2u);
      swift_slowDealloc();
    }

    LOBYTE(v32[0]) = 0;
    sub_3DD4(&qword_144068);
    sub_110998();
    uint64_t v22 = sub_1101A8();
    v32[3] = v22;
    v32[4] = (uint64_t)&protocol witness table for ABCReport;
    uint64_t v23 = sub_31294(v32);
    uint64_t v24 = v30;
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v30, v8, v4);
    sub_10B0A8(&qword_140658, (void (*)(uint64_t))&type metadata accessor for AlarmOperationError);
    swift_allocError();
    v17(v25, v24, v4);
    *uint64_t v23 = sub_10E0C8();
    uint64_t v26 = enum case for ErrorSubType.managerReturnedError(_:);
    uint64_t v27 = sub_10FEB8();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 104))(v23, v26, v27);
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v23, enum case for ABCReport.alarmUndoHandle(_:), v22);
    sub_10FF28();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v4);
    _s20HandleIntentStrategyVwxx_1((uint64_t)v32);
    return swift_errorRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    LOBYTE(v32[0]) = 1;
    sub_3DD4(&qword_144068);
    return sub_110998();
  }
}

uint64_t sub_109B34(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = sub_10EAB8();
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  uint64_t v5 = sub_10E828();
  v3[8] = v5;
  v3[9] = *(void *)(v5 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = type metadata accessor for ErrorNotFoundParameters(0);
  v3[12] = swift_task_alloc();
  uint64_t v6 = sub_110778();
  v3[13] = v6;
  v3[14] = *(void *)(v6 - 8);
  v3[15] = swift_task_alloc();
  uint64_t v7 = sub_10FD58();
  v3[16] = v7;
  v3[17] = *(void *)(v7 - 8);
  v3[18] = swift_task_alloc();
  uint64_t v8 = sub_10FD78();
  v3[19] = v8;
  v3[20] = *(void *)(v8 - 8);
  v3[21] = swift_task_alloc();
  sub_3DD4(&qword_140458);
  v3[22] = swift_task_alloc();
  sub_3DD4(&qword_140460);
  v3[23] = swift_task_alloc();
  sub_3DD4(&qword_140468);
  v3[24] = swift_task_alloc();
  uint64_t v9 = sub_10FD38();
  v3[25] = v9;
  v3[26] = *(void *)(v9 - 8);
  v3[27] = swift_task_alloc();
  uint64_t v10 = sub_10E8A8();
  v3[28] = v10;
  v3[29] = *(void *)(v10 - 8);
  v3[30] = swift_task_alloc();
  return _swift_task_switch(sub_109EE0, 0, 0);
}

uint64_t sub_109EE0()
{
  (*(void (**)(void, void, void))(v0[29] + 104))(v0[30], enum case for ActivityType.failed(_:), v0[28]);
  if (qword_13F230 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[26];
  uint64_t v1 = v0[27];
  uint64_t v4 = v0[24];
  uint64_t v3 = v0[25];
  uint64_t v5 = sub_3E18(v3, (uint64_t)qword_144698);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  uint64_t v6 = enum case for SiriKitReliabilityCodes.genericError(_:);
  uint64_t v7 = sub_10E708();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 104))(v4, v6, v7);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);
  if (qword_13F238 != -1) {
    swift_once();
  }
  uint64_t v9 = v0[29];
  uint64_t v10 = v0[27];
  uint64_t v39 = v0[28];
  uint64_t v11 = v0[26];
  uint64_t v37 = v0[30];
  uint64_t v38 = v0[25];
  uint64_t v13 = v0[23];
  uint64_t v12 = v0[24];
  uint64_t v14 = v0[22];
  uint64_t v15 = v0[3];
  uint64_t v16 = sub_10FD48();
  uint64_t v17 = sub_3E18(v16, (uint64_t)qword_1446B0);
  uint64_t v18 = *(void *)(v16 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v13, v17, v16);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(v13, 0, 1, v16);
  uint64_t v19 = sub_10FD28();
  uint64_t v20 = *(void *)(v19 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v14, v15, v19);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v20 + 56))(v14, 0, 1, v19);
  sub_10FD18();
  sub_1646C(v14, &qword_140458);
  sub_1646C(v13, &qword_140460);
  sub_1646C(v12, &qword_140468);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v38);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v37, v39);
  if (qword_13F228 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_3E18(v0[13], (uint64_t)qword_143EC8);
  v0[31] = v21;
  uint64_t v40 = v21;
  uint64_t v22 = sub_110768();
  os_log_type_t v23 = sub_1109F8();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl(&dword_0, v22, v23, "UndoCreateAlarmFlow: Hitting alarm RF codepath for UndoCreateAlarmFlow error case.", v24, 2u);
    swift_slowDealloc();
  }
  uint64_t v25 = v0[17];
  uint64_t v26 = v0[18];
  uint64_t v28 = v0[15];
  uint64_t v27 = v0[16];
  uint64_t v30 = v0[13];
  uint64_t v29 = v0[14];
  uint64_t v32 = (int *)v0[11];
  uint64_t v31 = v0[12];

  (*(void (**)(uint64_t, void, uint64_t))(v25 + 104))(v26, enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:), v27);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v28, v40, v30);
  mach_absolute_time();
  sub_10FD88();
  uint64_t v33 = sub_10FBC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v31, 1, 1, v33);
  *(unsigned char *)(v31 + v32[5]) = 0;
  *(void *)(v31 + v32[6]) = _swiftEmptyArrayStorage;
  *(void *)(v31 + v32[7]) = 0;
  uint64_t v34 = sub_36D08();
  v0[32] = v34;
  uint64_t v41 = (uint64_t (*)(uint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                   + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  uint64_t v35 = (void *)swift_task_alloc();
  v0[33] = v35;
  *uint64_t v35 = v0;
  v35[1] = sub_10A440;
  return v41(0x6F4E23726F727245, 0xEE00646E756F4674, v34);
}

uint64_t sub_10A440(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 272) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = sub_10A934;
  }
  else
  {
    *(void *)(v4 + 280) = a1;
    uint64_t v5 = sub_10A58C;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10A58C()
{
  sub_38130(v0[12]);
  sub_10E7E8();
  sub_10EAA8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[36] = v1;
  void *v1 = v0;
  v1[1] = sub_10A654;
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[7];
  uint64_t v5 = v0[2];
  return PatternExecutionResult.generateFlowPatternResponse(phase:contextUpdate:measure:)(v5, v3, v4, v2);
}

uint64_t sub_10A654()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 280);
  uint64_t v2 = *(void *)(*(void *)v0 + 80);
  uint64_t v3 = *(void *)(*(void *)v0 + 72);
  uint64_t v4 = *(void *)(*(void *)v0 + 64);
  uint64_t v5 = *(void *)(*(void *)v0 + 56);
  uint64_t v6 = *(void *)(*(void *)v0 + 48);
  uint64_t v7 = *(void *)(*(void *)v0 + 40);
  swift_task_dealloc();

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return _swift_task_switch(sub_10A828, 0, 0);
}

uint64_t sub_10A828()
{
  (*(void (**)(void, void))(v0[20] + 8))(v0[21], v0[19]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10A934()
{
  uint64_t v2 = v0[20];
  uint64_t v1 = v0[21];
  uint64_t v3 = v0[19];
  sub_38130(v0[12]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = sub_110768();
  os_log_type_t v5 = sub_1109E8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_0, v4, v5, "UndoCreateAlarmFlow: Failed to produce Incomplete response.", v6, 2u);
    swift_slowDealloc();
  }

  sub_10E9C8();
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t UndoCreateAlarmFlow.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  _s20HandleIntentStrategyVwxx_1(v0 + 56);
  swift_bridgeObjectRelease();
  sub_1646C(v0 + OBJC_IVAR____TtC15AlarmFlowPlugin19UndoCreateAlarmFlow_followupPluginAction, &qword_140438);
  return v0;
}

uint64_t UndoCreateAlarmFlow.__deallocating_deinit()
{
  UndoCreateAlarmFlow.deinit();

  return swift_deallocClassInstance();
}

uint64_t sub_10AB98()
{
  return UndoCreateAlarmFlow.on(input:)() & 1;
}

uint64_t sub_10ABC0()
{
  return sub_10E618();
}

uint64_t sub_10AC20(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_33C04;
  return UndoCreateAlarmFlow.execute()(a1);
}

uint64_t sub_10ACBC()
{
  type metadata accessor for UndoCreateAlarmFlow();

  return sub_10E648();
}

void *sub_10ACF8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_10FC68();
  __chkstk_darwin(v8 - 8);
  uint64_t v14 = a3;
  uint64_t v15 = a4;
  uint64_t v9 = sub_31294((uint64_t *)&v13);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(v9, a1, a3);
  type metadata accessor for DeleteAlarmCATs_Async();
  sub_10FC48();
  a2[2] = sub_10FB38();
  type metadata accessor for DeleteAlarmCATPatternsExecutor(0);
  sub_10FC48();
  a2[3] = sub_10FB38();
  sub_10FC48();
  a2[4] = sub_10FB38();
  type metadata accessor for ErrorCATPatternsExecutor(0);
  sub_10FC48();
  a2[5] = sub_10FB38();
  a2[6] = _s15AlarmFlowPlugin021RecreateDeletedAlarmsB0C11osLogObject33_DB4DDA2311F8F0836B4CA98F718F999FLLSo03OS_G4_logCvpfi_0();
  a2[12] = 0;
  a2[13] = 0;
  uint64_t v10 = (char *)a2 + OBJC_IVAR____TtC15AlarmFlowPlugin19UndoCreateAlarmFlow_followupPluginAction;
  uint64_t v11 = sub_10E8D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  sub_BE08(&v13, (uint64_t)(a2 + 7));
  return a2;
}

void *sub_10AEA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a3 - 8);
  __chkstk_darwin(a1);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for UndoCreateAlarmFlow();
  uint64_t v10 = (void *)swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  return sub_10ACF8((uint64_t)v9, v10, a3, a4);
}

uint64_t sub_10AF98(uint64_t a1)
{
  return sub_108924(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_10AFA4(uint64_t a1)
{
  return sub_1093C8(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_10AFAC()
{
  return type metadata accessor for UndoCreateAlarmFlow();
}

void sub_10AFB4()
{
  sub_4E9A8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_10B07C()
{
  return sub_7C668(&qword_144068);
}

uint64_t sub_10B088(uint64_t a1)
{
  return sub_10B11C(a1, &qword_144068, sub_10966C);
}

uint64_t sub_10B0A8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10B0F0()
{
  return sub_7C668(&qword_141070);
}

uint64_t sub_10B0FC(uint64_t a1)
{
  return sub_10B11C(a1, &qword_141070, sub_108DA0);
}

uint64_t sub_10B11C(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(sub_3DD4(a2) - 8);
  uint64_t v6 = *(void *)(v3 + 16);
  uint64_t v7 = v3 + ((*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return a3(a1, v6, v7);
}

uint64_t type metadata accessor for ChangeAlarmStatusCATs_Async()
{
  uint64_t result = qword_144070;
  if (!qword_144070) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10B1F0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_10B230(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FC68();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3DD4((uint64_t *)&unk_13F780);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  sub_1C86C(a1, (uint64_t)v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = sub_10FB18();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_1C8D4(a1);
  return v11;
}

uint64_t sub_10B3B4()
{
  return type metadata accessor for ChangeAlarmStatusCATs_Async();
}

id Siri_Nlu_External_UserParse.alarmSearch.getter()
{
  if (sub_10EEE8())
  {
    id v0 = sub_35F94();
    swift_release();
    return v0;
  }
  else
  {
    if (qword_13F240 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_110778();
    sub_3E18(v2, (uint64_t)qword_1440C0);
    uint64_t v3 = sub_110768();
    os_log_type_t v4 = sub_1109E8();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_0, v3, v4, "No task found in userDialogAct.", v5, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
}

uint64_t sub_10B4BC()
{
  uint64_t v0 = sub_110778();
  sub_2D924(v0, qword_1440C0);
  sub_3E18(v0, (uint64_t)qword_1440C0);
  return sub_1104D8();
}

uint64_t sub_10B508()
{
  uint64_t v0 = sub_110778();
  sub_2D924(v0, qword_1440D8);
  sub_3E18(v0, (uint64_t)qword_1440D8);
  return sub_1104B8();
}

uint64_t type metadata accessor for AlarmFlowPlugin()
{
  return self;
}

void sub_10B578(uint64_t *a1@<X8>)
{
  type metadata accessor for AlarmFlowPlugin();
  uint64_t v2 = swift_allocObject();
  sub_10FB88();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v4 = [self bundleForClass:ObjCClassFromMetadata];
  sub_10FB78();

  *a1 = v2;
}

uint64_t sub_10B63C(uint64_t a1, uint64_t a2)
{
  return sub_10B92C(&qword_144198, a2, (void (*)(uint64_t))type metadata accessor for AlarmFlowPlugin);
}

uint64_t sub_10B684(uint8_t *a1)
{
  uint64_t v2 = sub_3DD4(&qword_143B90);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static AlarmFlowFactory.makeFlowFrom(parse:)(a1, (uint64_t)v4);
  uint64_t v5 = sub_10E698();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_10B8CC((uint64_t)v4);
  }
  else
  {
    uint64_t v7 = sub_10E668();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7) {
      return v7;
    }
  }
  if (qword_13F248 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_110778();
  sub_3E18(v8, (uint64_t)qword_1440D8);
  uint64_t v9 = sub_110768();
  os_log_type_t v10 = sub_1109E8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_0, v9, v10, "Unable to parse valid alarm flow in deprecated makeFlowFor(parse:)", v11, 2u);
    swift_slowDealloc();
  }

  sub_110198();
  swift_allocObject();
  v13[1] = sub_110188();
  sub_10B92C(qword_1441A0, 255, (void (*)(uint64_t))&type metadata accessor for NoOpFlow);
  uint64_t v7 = sub_10E5F8();
  swift_release();
  return v7;
}

uint64_t sub_10B8CC(uint64_t a1)
{
  uint64_t v2 = sub_3DD4(&qword_143B90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10B92C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10B974(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_33C04;
  return sub_6218C(a1, a2, a3);
}

ValueMetadata *type metadata accessor for AlarmAppNotInstalledLegacyDialog()
{
  return &type metadata for AlarmAppNotInstalledLegacyDialog;
}

uint64_t sub_10BA38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  long long v4[2] = a1;
  v4[3] = a2;
  sub_3DD4(&qword_13FA88);
  v4[6] = swift_task_alloc();
  uint64_t v5 = sub_10EAF8();
  v4[7] = v5;
  v4[8] = *(void *)(v5 - 8);
  v4[9] = swift_task_alloc();
  sub_3DD4(&qword_140458);
  v4[10] = swift_task_alloc();
  sub_3DD4(&qword_140460);
  v4[11] = swift_task_alloc();
  sub_3DD4(&qword_140468);
  v4[12] = swift_task_alloc();
  uint64_t v6 = sub_10FD38();
  v4[13] = v6;
  v4[14] = *(void *)(v6 - 8);
  v4[15] = swift_task_alloc();
  uint64_t v7 = sub_10E8A8();
  v4[16] = v7;
  v4[17] = *(void *)(v7 - 8);
  v4[18] = swift_task_alloc();
  uint64_t v8 = sub_10FF18();
  v4[19] = v8;
  v4[20] = *(void *)(v8 - 8);
  v4[21] = swift_task_alloc();
  sub_10FC68();
  v4[22] = swift_task_alloc();
  uint64_t v9 = sub_10FEF8();
  v4[23] = v9;
  v4[24] = *(void *)(v9 - 8);
  v4[25] = swift_task_alloc();
  v4[26] = swift_task_alloc();
  uint64_t v10 = sub_110138();
  v4[27] = v10;
  v4[28] = *(void *)(v10 - 8);
  v4[29] = swift_task_alloc();
  return _swift_task_switch(sub_10BDC4, 0, 0);
}

uint64_t sub_10BDC4()
{
  uint64_t v1 = v0[26];
  uint64_t v2 = v0[23];
  uint64_t v3 = v0[24];
  uint64_t v4 = v0[3];
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[30] = v5;
  v0[31] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  v0[32] = type metadata accessor for AlarmBaseCATs_Async();
  sub_10FC48();
  sub_10FB38();
  sub_591F8();
  sub_110128();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[33] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_10BEE8;
  return AppInstallDialogOutputUtil.makeLaunchAppView()();
}

uint64_t sub_10BEE8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 272) = a1;
  *(void *)(v3 + 280) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_10C8B8;
  }
  else {
    uint64_t v4 = sub_10BFFC;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_10BFFC()
{
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 152);
  (*(void (**)(void, void, void))(v0 + 240))(*(void *)(v0 + 208), *(void *)(v0 + 24), *(void *)(v0 + 184));
  sub_10FF08();
  char v4 = sub_10FEC8();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v5 = *(void *)(v0 + 184);
  if (v4) {
    (*(void (**)(void, void, uint64_t))(*(void *)(v0 + 192) + 104))(*(void *)(v0 + 200), enum case for AppInstallUtil.Domain.clock(_:), v5);
  }
  else {
    (*(void (**)(void, void, uint64_t))(v0 + 240))(*(void *)(v0 + 200), *(void *)(v0 + 24), v5);
  }
  uint64_t v6 = *(void *)(v0 + 136);
  uint64_t v7 = *(void *)(v0 + 120);
  uint64_t v27 = *(void *)(v0 + 128);
  uint64_t v8 = *(void *)(v0 + 104);
  uint64_t v9 = *(void *)(v0 + 112);
  uint64_t v25 = *(void *)(v0 + 144);
  uint64_t v26 = v8;
  uint64_t v11 = *(void *)(v0 + 88);
  uint64_t v10 = *(void *)(v0 + 96);
  uint64_t v12 = *(void *)(v0 + 80);
  uint64_t v28 = *(void *)(v0 + 48);
  uint64_t v29 = *(void *)(v0 + 32);
  (*(void (**)(void))(v6 + 104))();
  (*(void (**)(uint64_t, void, uint64_t))(v9 + 104))(v7, enum case for SiriTimeEventSender.TaskType.current(_:), v8);
  uint64_t v13 = enum case for SiriKitReliabilityCodes.noAppFoundOnDeviceToSupportIntent(_:);
  uint64_t v14 = sub_10E708();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 104))(v10, v13, v14);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(v10, 0, 1, v14);
  uint64_t v16 = sub_10FD48();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v11, 1, 1, v16);
  uint64_t v17 = enum case for SiriTimeEventSender.ReasonDescription.alarmAppNotInstalledLegacyDialog(_:);
  uint64_t v18 = sub_10FD28();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 104))(v12, v17, v18);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(v12, 0, 1, v18);
  sub_10FD18();
  sub_1646C(v12, &qword_140458);
  sub_1646C(v11, &qword_140460);
  sub_1646C(v10, &qword_140468);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v26);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v25, v27);
  sub_10FC48();
  *(void *)(v0 + 288) = sub_10FB38();
  sub_10FEE8();
  sub_110878();
  swift_bridgeObjectRelease();
  uint64_t v20 = sub_10FBC8();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v28, 0, 1, v20);
  uint64_t v21 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v21;
  *uint64_t v21 = v0;
  v21[1] = sub_10C414;
  uint64_t v22 = *(void *)(v0 + 72);
  uint64_t v23 = *(void *)(v0 + 48);
  return sub_625EC(v22, v29, v23);
}

uint64_t sub_10C414()
{
  uint64_t v2 = (void *)*v1;
  v2[38] = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_1646C(v2[6], &qword_13FA88);
    swift_release();
    swift_bridgeObjectRelease();
    return _swift_task_switch(sub_10C9DC, 0, 0);
  }
  else
  {
    sub_1646C(v2[6], &qword_13FA88);
    swift_release();
    uint64_t v3 = (void *)swift_task_alloc();
    v2[39] = v3;
    *uint64_t v3 = v2;
    v3[1] = sub_10C5E0;
    uint64_t v4 = v2[34];
    uint64_t v5 = v2[5];
    uint64_t v6 = v2[2];
    return sub_309C4(v6, v4, v5);
  }
}

uint64_t sub_10C5E0()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  uint64_t v3 = *(void *)(*(void *)v1 + 64);
  uint64_t v4 = *(void *)(*(void *)v1 + 56);
  *(void *)(*(void *)v1 + 320) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v5 = sub_10CB18;
  }
  else {
    uint64_t v5 = sub_10C774;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10C774()
{
  uint64_t v2 = v0[28];
  uint64_t v1 = v0[29];
  uint64_t v3 = v0[27];
  (*(void (**)(void, void))(v0[24] + 8))(v0[25], v0[23]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_10C8B8()
{
  (*(void (**)(void, void))(v0[28] + 8))(v0[29], v0[27]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10C9DC()
{
  (*(void (**)(void, void))(v0[24] + 8))(v0[25], v0[23]);
  (*(void (**)(void, void))(v0[28] + 8))(v0[29], v0[27]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10CB18()
{
  (*(void (**)(void, void))(v0[24] + 8))(v0[25], v0[23]);
  (*(void (**)(void, void))(v0[28] + 8))(v0[29], v0[27]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10CC54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_13024;
  return sub_10BA38(a1, a2, a3, a4);
}

uint64_t type metadata accessor for SearchAlarmCATsSimple()
{
  uint64_t result = qword_1441C0;
  if (!qword_1441C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10CD58()
{
  return swift_initClassMetadata2();
}

uint64_t sub_10CD98(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8)
{
  *(_WORD *)(v9 + 99) = v12;
  *(unsigned char *)(v9 + 98) = a8;
  *(void *)(v9 + 48) = a7;
  *(void *)(v9 + 56) = v8;
  *(unsigned char *)(v9 + 97) = a5;
  *(void *)(v9 + 32) = a4;
  *(void *)(v9 + 40) = a6;
  *(unsigned char *)(v9 + 96) = a3;
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  sub_3DD4(&qword_13FA88);
  *(void *)(v9 + 64) = swift_task_alloc();
  return _swift_task_switch(sub_10CE54, 0, 0);
}

uint64_t sub_10CE54()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_3DD4(&qword_13FC38);
  uint64_t v2 = swift_allocObject();
  *(void *)(v0 + 72) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_114D50;
  *(void *)(v2 + 32) = 0x6D72616C61;
  *(void *)(v2 + 40) = 0xE500000000000000;
  uint64_t v3 = 0;
  if (v1)
  {
    uint64_t v3 = type metadata accessor for AlarmAlarm(0);
  }
  else
  {
    *(void *)(v2 + 56) = 0;
    *(void *)(v2 + 64) = 0;
  }
  char v4 = *(unsigned char *)(v0 + 96);
  *(void *)(v2 + 48) = v1;
  *(void *)(v2 + 72) = v3;
  *(void *)(v2 + 80) = 0xD000000000000010;
  *(void *)(v2 + 88) = 0x8000000000116730;
  if (v4)
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
    *(void *)(v2 + 104) = 0;
    *(void *)(v2 + 112) = 0;
  }
  else
  {
    uint64_t v5 = *(void *)(v0 + 24);
    uint64_t v6 = &type metadata for Double;
  }
  char v7 = *(unsigned char *)(v0 + 97);
  *(void *)(v2 + 96) = v5;
  *(void *)(v2 + 120) = v6;
  *(void *)(v2 + 128) = 0xD000000000000012;
  *(void *)(v2 + 136) = 0x80000000001166F0;
  if (v7)
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0;
    *(void *)(v2 + 152) = 0;
    *(void *)(v2 + 160) = 0;
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 32);
    uint64_t v9 = &type metadata for Double;
  }
  uint64_t v10 = *(void *)(v0 + 64);
  uint64_t v11 = *(void *)(v0 + 40);
  *(void *)(v2 + 144) = v8;
  *(void *)(v2 + 168) = v9;
  *(void *)(v2 + 176) = 0xD000000000000012;
  *(void *)(v2 + 184) = 0x8000000000115280;
  sub_AFBC(v11, v10, &qword_13FA88);
  uint64_t v12 = sub_10FBC8();
  uint64_t v13 = *(void *)(v12 - 8);
  int v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12);
  uint64_t v15 = *(void *)(v0 + 64);
  if (v14 == 1)
  {
    swift_retain();
    sub_1646C(v15, &qword_13FA88);
    *(_OWORD *)(v2 + 192) = 0u;
    *(_OWORD *)(v2 + 208) = 0u;
  }
  else
  {
    *(void *)(v2 + 216) = v12;
    uint64_t v16 = sub_31294((uint64_t *)(v2 + 192));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v13 + 32))(v16, v15, v12);
    swift_retain();
  }
  uint64_t v17 = *(void *)(v0 + 48);
  *(void *)(v2 + 224) = 0xD000000000000011;
  *(void *)(v2 + 232) = 0x80000000001152A0;
  uint64_t v18 = 0;
  if (v17)
  {
    uint64_t v18 = sub_10FB08();
  }
  else
  {
    *(void *)(v2 + 248) = 0;
    *(void *)(v2 + 256) = 0;
  }
  char v19 = *(unsigned char *)(v0 + 100);
  char v20 = *(unsigned char *)(v0 + 99);
  *(void *)(v2 + 264) = v18;
  *(void *)(v2 + 272) = 0xD000000000000014;
  char v21 = *(unsigned char *)(v0 + 98);
  *(void *)(v2 + 280) = 0x8000000000116750;
  *(void *)(v2 + 240) = v17;
  *(unsigned char *)(v2 + 288) = v21;
  *(void *)(v2 + 312) = &type metadata for Bool;
  *(void *)(v2 + 320) = 0xD000000000000012;
  *(void *)(v2 + 328) = 0x8000000000116770;
  *(unsigned char *)(v2 + 336) = v20;
  *(void *)(v2 + 360) = &type metadata for Bool;
  *(void *)(v2 + 368) = 0xD000000000000012;
  *(void *)(v2 + 376) = 0x8000000000116710;
  *(void *)(v2 + 408) = &type metadata for Bool;
  uint64_t v24 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:)
                                                                            + async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(unsigned char *)(v2 + 384) = v19;
  swift_retain();
  uint64_t v22 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v22;
  *uint64_t v22 = v0;
  v22[1] = sub_10D1B0;
  return v24(0xD00000000000002CLL, 0x8000000000117A70, v2);
}

uint64_t sub_10D1B0(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 88) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return _swift_task_switch(sub_10D30C, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t sub_10D30C()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10D378(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10FC68();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3DD4((uint64_t *)&unk_13F780);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  sub_AFBC(a1, (uint64_t)v10, (uint64_t *)&unk_13F780);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = sub_10FBD8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_1646C(a1, (uint64_t *)&unk_13F780);
  return v11;
}

uint64_t sub_10D510(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10FC68();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a2, v3);
  uint64_t v7 = sub_10FBE8();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a2, v3);
  return v7;
}

uint64_t sub_10D620()
{
  return type metadata accessor for SearchAlarmCATsSimple();
}

ValueMetadata *_s24UnsupportedValueStrategyVMa_3()
{
  return &_s24UnsupportedValueStrategyVN_3;
}

uint64_t sub_10D638()
{
  uint64_t v0 = sub_110778();
  sub_2D924(v0, qword_144218);
  sub_3E18(v0, (uint64_t)qword_144218);
  return sub_1104D8();
}

uint64_t sub_10D684(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return _swift_task_switch(sub_10D6A4, 0, 0);
}

uint64_t sub_10D6A4()
{
  sub_3DD4(&qword_142BD8);
  uint64_t v1 = (void *)sub_10ECA8();
  v0[5] = v1;
  if (qword_13F250 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_110778();
  sub_3E18(v2, (uint64_t)qword_144218);
  id v3 = v1;
  uint64_t v4 = sub_110768();
  os_log_type_t v5 = sub_1109F8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 134217984;
    v0[2] = [v3 unsupportedReason];
    sub_110B28();

    _os_log_impl(&dword_0, v4, v5, "UpdateAlarm.UnsupportedValueStrategy.makeUnsupportedValueOutput() called with unsupportedReason: %ld", v6, 0xCu);
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v7 = (void *)sub_10EC98();
  id v8 = [v7 alarmSearch];
  v0[6] = v8;

  uint64_t v9 = (void *)swift_task_alloc();
  v0[7] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_10D8B4;
  uint64_t v10 = v0[3];
  return sub_2E23C(v10, (uint64_t)v8, (uint64_t)v3);
}

uint64_t sub_10D8B4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v3 = sub_10DA34;
  }
  else
  {

    id v3 = sub_10D9D0;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_10D9D0()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10DA34()
{
  uint64_t v1 = *(void **)(v0 + 40);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10DA9C(uint64_t a1)
{
  v1[3] = a1;
  uint64_t v2 = sub_10EB68();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  v1[7] = swift_task_alloc();
  v1[8] = swift_task_alloc();
  return _swift_task_switch(sub_10DB78, 0, 0);
}

uint64_t sub_10DB78()
{
  uint64_t v26 = v0;
  sub_3DD4(&qword_142BD8);
  sub_10ECB8();
  if (qword_13F250 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = sub_110778();
  sub_3E18(v5, (uint64_t)qword_144218);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v6(v2, v1, v3);
  uint64_t v7 = sub_110768();
  os_log_type_t v8 = sub_1109F8();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = v0[7];
  if (v9)
  {
    os_log_type_t type = v8;
    uint64_t v12 = v0[5];
    uint64_t v11 = v0[6];
    log = v7;
    uint64_t v13 = v0[4];
    int v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)int v14 = 136315138;
    v6(v11, v10, v13);
    uint64_t v15 = sub_110858();
    v0[2] = sub_6750(v15, v16, &v25);
    sub_110B28();
    swift_bridgeObjectRelease();
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v17(v10, v13);
    uint64_t v7 = log;
    _os_log_impl(&dword_0, log, type, "UpdateAlarm.UnsupportedValueStrategy.makeUpdatedIntentForUnsupportedValue() called for parameter: %s", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0[5] + 8);
    v17(v0[7], v0[4]);
  }

  uint64_t v18 = v0[8];
  uint64_t v19 = v0[4];
  uint64_t v20 = sub_10EC98();
  v17(v18, v19);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v21 = (uint64_t (*)(uint64_t))v0[1];
  return v21(v20);
}

uint64_t sub_10DE44(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_33C04;
  v5[3] = a1;
  v5[4] = a2;
  return _swift_task_switch(sub_10D6A4, 0, 0);
}

uint64_t sub_10DEF4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_11D1C;
  return sub_10DA9C(a1);
}

uint64_t sub_10DF88()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_10DF98()
{
  return JSONDecoder.init()();
}

uint64_t sub_10DFA8()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_10DFB8()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_10DFC8()
{
  return JSONEncoder.init()();
}

uint64_t sub_10DFD8()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_10DFE8()
{
  return static CharacterSet.whitespaces.getter();
}

uint64_t sub_10DFF8()
{
  return CharacterSet.init(charactersIn:)();
}

uint64_t sub_10E008()
{
  return static CharacterSet.urlPathAllowed.getter();
}

uint64_t sub_10E018()
{
  return CharacterSet.union(_:)();
}

uint64_t sub_10E028()
{
  return type metadata accessor for CharacterSet();
}

NSDateComponents sub_10E038()
{
  return DateComponents._bridgeToObjectiveC()();
}

uint64_t sub_10E048()
{
  return static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10E058()
{
  return DateComponents.hour.getter();
}

uint64_t sub_10E068()
{
  return DateComponents.hour.setter();
}

uint64_t sub_10E078()
{
  return DateComponents.minute.getter();
}

uint64_t sub_10E088()
{
  return DateComponents.minute.setter();
}

uint64_t sub_10E098()
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
}

uint64_t sub_10E0A8()
{
  return DateComponents.calendar.setter();
}

uint64_t sub_10E0B8()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_10E0C8()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10E0D8()
{
  return URL.absoluteString.getter();
}

void sub_10E0E8(NSURL *retstr@<X8>)
{
}

uint64_t sub_10E0F8()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10E108()
{
  return URL.init(string:)();
}

uint64_t sub_10E118()
{
  return type metadata accessor for URL();
}

NSDate sub_10E128()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_10E138()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_10E148()
{
  return Date.init()();
}

uint64_t sub_10E158()
{
  return type metadata accessor for Date();
}

uint64_t sub_10E168()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_10E178()
{
  return UUID.uuidString.getter();
}

uint64_t sub_10E188()
{
  return UUID.init()();
}

uint64_t sub_10E198()
{
  return type metadata accessor for UUID();
}

NSLocale sub_10E1A8()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_10E1B8()
{
  return static Locale._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10E1C8()
{
  return type metadata accessor for Locale.HourCycle();
}

uint64_t sub_10E1D8()
{
  return Locale.hourCycle.getter();
}

uint64_t sub_10E1E8()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10E1F8()
{
  return type metadata accessor for Calendar.MatchingPolicy();
}

uint64_t sub_10E208()
{
  return Calendar.dateComponents(_:from:)();
}

uint64_t sub_10E218()
{
  return type metadata accessor for Calendar.SearchDirection();
}

uint64_t sub_10E228()
{
  return type metadata accessor for Calendar.RepeatedTimePolicy();
}

uint64_t sub_10E238()
{
  return Calendar.date(bySettingHour:minute:second:of:matchingPolicy:repeatedTimePolicy:direction:)();
}

uint64_t sub_10E248()
{
  return Calendar.date(from:)();
}

uint64_t sub_10E258()
{
  return Calendar.date(byAdding:value:to:wrappingComponents:)();
}

uint64_t sub_10E268()
{
  return static Calendar.current.getter();
}

uint64_t sub_10E278()
{
  return Calendar.nextDate(after:matching:matchingPolicy:repeatedTimePolicy:direction:)();
}

uint64_t sub_10E288()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_10E298()
{
  return Calendar.component(_:from:)();
}

uint64_t sub_10E2A8()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_10E2B8()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_10E318()
{
  return HandleIntentFlowStrategyAsync.authenticationPolicy.getter();
}

uint64_t sub_10E408()
{
  return type metadata accessor for AsyncConstructingFlow();
}

uint64_t sub_10E418()
{
  return AsyncConstructingFlow.init(_:)();
}

uint64_t sub_10E498()
{
  return type metadata accessor for AnyFlow();
}

uint64_t sub_10E4A8()
{
  return static PromptFlowProviderType.continuation<A>(_:)();
}

uint64_t sub_10E4B8()
{
  return PatternFlowProvider.init(outputPublisher:responseGenerator:)();
}

uint64_t sub_10E4C8()
{
  return type metadata accessor for PatternFlowProvider();
}

uint64_t sub_10E4D8()
{
  return PatternFlowProviding.makeResponseFlowWithContinuationPrompt<A>(strategy:)();
}

uint64_t sub_10E4F8()
{
  return static RCHChildFlowFactoryHelper.makeNeedsValueFlowProducer<A>(strategy:)();
}

uint64_t sub_10E508()
{
  return static RCHChildFlowFactoryHelper.makeHandleIntentFlowProducer<A>(strategy:responseFlowProducer:)();
}

uint64_t sub_10E518()
{
  return static RCHChildFlowFactoryHelper.makeHandleIntentFlowProducer<A>(strategy:)();
}

uint64_t sub_10E528()
{
  return static RCHChildFlowFactoryHelper.makeAppResolutionFlowProducer<A, B>(app:)();
}

uint64_t sub_10E538()
{
  return static RCHChildFlowFactoryHelper.makeNeedsDisambiguationFlowProducer<A, B>(_:)();
}

uint64_t sub_10E548()
{
  return static RCHChildFlowFactoryHelper.makeConditionalConfirmIntentFlowProducer<A>(strategy:_:)();
}

uint64_t sub_10E558()
{
  return static RCHChildFlowFactoryHelper.makeUnsupportedValueAndCancelFlowProducer<A>(strategy:)();
}

uint64_t sub_10E568()
{
  return RCHChildFlowProducersAsync.needsValueFlowProducer.setter();
}

uint64_t sub_10E578()
{
  return RCHChildFlowProducersAsync.handleIntentFlowProducer.setter();
}

uint64_t sub_10E588()
{
  return RCHChildFlowProducersAsync.appResolutionFlowProducer.setter();
}

uint64_t sub_10E598()
{
  return RCHChildFlowProducersAsync.confirmIntentFlowProducer.setter();
}

uint64_t sub_10E5A8()
{
  return RCHChildFlowProducersAsync.unsupportedValueFlowProducer.setter();
}

uint64_t sub_10E5B8()
{
  return RCHChildFlowProducersAsync.needsDisambiguationFlowProducer.setter();
}

uint64_t sub_10E5C8()
{
  return RCHChildFlowProducersAsync.init()();
}

uint64_t sub_10E5D8()
{
  return RCHChildFlowFactory.init(producers:)();
}

uint64_t sub_10E5E8()
{
  return ResultSetFlowProvider.makeNarrowingPromptFlowIfNeeded()();
}

uint64_t sub_10E5F8()
{
  return Flow.eraseToAnyFlow()();
}

uint64_t sub_10E608()
{
  return Flow.eraseToAnyValueFlow()();
}

uint64_t sub_10E618()
{
  return Flow.deferToExecuteAsync(_:)();
}

uint64_t sub_10E628()
{
  return Flow.flexibleExecutionSupport.getter();
}

uint64_t sub_10E648()
{
  return Flow<>.exitValue.getter();
}

uint64_t sub_10E658()
{
  return static FlowSearchResult.noFlow.getter();
}

uint64_t sub_10E668()
{
  return FlowSearchResult.flow.getter();
}

uint64_t sub_10E678()
{
  return static FlowSearchResult.flow(_:)();
}

uint64_t sub_10E688()
{
  return static FlowSearchResult.reform(transformer:exclude:)();
}

uint64_t sub_10E698()
{
  return type metadata accessor for FlowSearchResult();
}

uint64_t sub_10E6A8()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_10E6B8()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_10E6C8(Swift::String refId)
{
}

void sub_10E6D8()
{
}

uint64_t sub_10E6E8()
{
  return SiriKitIntentHandler.init<A>(app:intentHandler:intent:)();
}

uint64_t sub_10E6F8()
{
  return type metadata accessor for SiriKitIntentHandler();
}

uint64_t sub_10E708()
{
  return type metadata accessor for SiriKitReliabilityCodes();
}

uint64_t sub_10E718()
{
  return type metadata accessor for SiriKitConfirmationState();
}

uint64_t sub_10E728()
{
  return static SiriKitIntentExecutionBehavior.remoteIntentExecution(targetDevice:)();
}

uint64_t sub_10E738()
{
  return static SiriKitIntentExecutionBehavior.embeddedIntentHandler(intentHandler:)();
}

uint64_t sub_10E748()
{
  return type metadata accessor for SiriKitIntentExecutionBehavior();
}

uint64_t sub_10E758()
{
  return static SiriKitLifecycle._logCrashToEventBus(_:)();
}

uint64_t sub_10E768()
{
  return static AceService.currentAsync.getter();
}

uint64_t sub_10E778()
{
  return dispatch thunk of DeviceState.siriLocale.getter();
}

uint64_t sub_10E788()
{
  return dispatch thunk of DeviceState.isTextToSpeechEnabled.getter();
}

uint64_t sub_10E798()
{
  return dispatch thunk of DeviceState.isWatch.getter();
}

uint64_t sub_10E7A8()
{
  return DeviceState.asInvocationContext.getter();
}

uint64_t sub_10E7B8()
{
  return static DialogPhase.completion.getter();
}

uint64_t sub_10E7C8()
{
  return static DialogPhase.confirmation.getter();
}

uint64_t sub_10E7D8()
{
  return static DialogPhase.clarification.getter();
}

uint64_t sub_10E7E8()
{
  return static DialogPhase.error.getter();
}

uint64_t sub_10E7F8()
{
  return DialogPhase.aceValue.getter();
}

uint64_t sub_10E808()
{
  return static DialogPhase.canceled.getter();
}

uint64_t sub_10E818()
{
  return static DialogPhase.confirmed.getter();
}

uint64_t sub_10E828()
{
  return type metadata accessor for DialogPhase();
}

uint64_t sub_10E838()
{
  return DisplayHint.init(idValue:displayValue:)();
}

uint64_t sub_10E848()
{
  return type metadata accessor for DisplayHint();
}

uint64_t sub_10E858()
{
  return static EmptyOutput.instance.getter();
}

uint64_t sub_10E868()
{
  return type metadata accessor for EmptyOutput();
}

uint64_t sub_10E878()
{
  return ViewFactory.init(ttsEnabled:)();
}

uint64_t sub_10E888()
{
  return dispatch thunk of ViewFactory.makeUtteranceViews(template:listenAfterSpeaking:canUseServerTTS:)();
}

uint64_t sub_10E898()
{
  return type metadata accessor for ViewFactory();
}

uint64_t sub_10E8A8()
{
  return type metadata accessor for ActivityType();
}

uint64_t sub_10E8B8()
{
  return PluginAction.init(flowHandlerId:input:)();
}

uint64_t sub_10E8C8()
{
  return PluginAction.init(data:)();
}

uint64_t sub_10E8D8()
{
  return type metadata accessor for PluginAction();
}

uint64_t sub_10E8E8()
{
  return SemanticValue.init(string:label:nodeClass:)();
}

uint64_t sub_10E8F8()
{
  return type metadata accessor for SemanticValue();
}

uint64_t sub_10E908()
{
  return static ActionForInput.cancel()();
}

uint64_t sub_10E918()
{
  return static ActionForInput.handle()();
}

uint64_t sub_10E928()
{
  return static ActionForInput.ignore()();
}

uint64_t sub_10E938()
{
  return type metadata accessor for ActionForInput();
}

uint64_t sub_10E948()
{
  return RCHFlowFactory.makeAppResolvingRCHFlow()();
}

uint64_t sub_10E958()
{
  return RCHFlowFactory.makeRCHFlowWithResolvedApp(_:intent:)();
}

uint64_t sub_10E968()
{
  return RCHFlowFactory.init(strategy:childFlowFactory:)();
}

uint64_t sub_10E978()
{
  return TemplatingText.text.getter();
}

uint64_t sub_10E988()
{
  return type metadata accessor for TemplatingText();
}

uint64_t sub_10E998()
{
  return static AceOutputHelper.makeCompletionViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)();
}

uint64_t sub_10E9A8()
{
  return static AceOutputHelper.makeConfirmationViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)();
}

uint64_t sub_10E9B8()
{
  return static ExecuteResponse.ongoing<A>(next:childCompletion:)();
}

uint64_t sub_10E9C8()
{
  return static ExecuteResponse.complete()();
}

uint64_t sub_10E9D8()
{
  return static ExecuteResponse.redirect(nextPluginAction:)();
}

uint64_t sub_10E9E8()
{
  return NLContextUpdate.add(nluSystemDialogAct:)();
}

uint64_t sub_10E9F8()
{
  return NLContextUpdate.set(undoDirectInvocation:)();
}

uint64_t sub_10EA08()
{
  return NLContextUpdate.rrEntities.setter();
}

uint64_t sub_10EA18()
{
  return NLContextUpdate.displayHints.setter();
}

uint64_t sub_10EA28()
{
  return NLContextUpdate.nluSystemDialogActs.setter();
}

uint64_t sub_10EA38()
{
  return NLContextUpdate.weightedPromptStrict.setter();
}

uint64_t sub_10EA48()
{
  return NLContextUpdate.applicationContextObjects.setter();
}

uint64_t sub_10EA58()
{
  return NLContextUpdate.weightedPromptAbortValues.setter();
}

uint64_t sub_10EA68()
{
  return NLContextUpdate.weightedPromptTargetDomain.setter();
}

uint64_t sub_10EA78()
{
  return NLContextUpdate.weightedPromptResponseOptions.setter();
}

uint64_t sub_10EA88()
{
  return NLContextUpdate.weightedPromptResponseTargets.setter();
}

uint64_t sub_10EA98()
{
  return NLContextUpdate.disambiguationPromptAbortValues.setter();
}

uint64_t sub_10EAA8()
{
  return NLContextUpdate.init()();
}

uint64_t sub_10EAB8()
{
  return type metadata accessor for NLContextUpdate();
}

uint64_t sub_10EAC8()
{
  return ResponseFactory.init()();
}

uint64_t sub_10EAD8()
{
  return type metadata accessor for ResponseFactory();
}

uint64_t sub_10EAE8()
{
  return TemplatingResult.sections.getter();
}

uint64_t sub_10EAF8()
{
  return type metadata accessor for TemplatingResult();
}

uint64_t sub_10EB08()
{
  return static InvocationFactory.makeConfirmAndRejectActions()();
}

uint64_t sub_10EB18()
{
  return TemplatingSection.content.getter();
}

uint64_t sub_10EB28()
{
  return type metadata accessor for TemplatingSection();
}

uint64_t sub_10EB38()
{
  return IntentPromptAnswer.init(answeredValue:updatedIntent:)();
}

uint64_t sub_10EB48()
{
  return ConfirmIntentAnswer.init(confirmationResponse:intent:)();
}

uint64_t sub_10EB58()
{
  return ParameterIdentifier.name.getter();
}

uint64_t sub_10EB68()
{
  return type metadata accessor for ParameterIdentifier();
}

uint64_t sub_10EB78()
{
  return type metadata accessor for ConfirmationResponse();
}

uint64_t sub_10EBA8()
{
  return RCHFlowStrategyAsync.makeParameterMetadata(intent:)();
}

uint64_t sub_10EBB8()
{
  return NamedParseTransformer.init(transformer:)();
}

uint64_t sub_10EBC8()
{
  return type metadata accessor for NamedParseTransformer();
}

uint64_t sub_10EBD8()
{
  return dispatch thunk of AceServiceInvokerAsync.currentStartRequestId()();
}

uint64_t sub_10EBF8()
{
  return IntentResolutionRecord.intentResponse.getter();
}

uint64_t sub_10EC08()
{
  return IntentResolutionRecord.app.getter();
}

uint64_t sub_10EC18()
{
  return IntentResolutionRecord.intent.getter();
}

uint64_t sub_10EC28()
{
  return static OutputPublisherFactory.makeOutputPublisherAsync()();
}

uint64_t sub_10EC38()
{
  return WindowingConfiguration.init(promptFlowProviderType:padding:windowSizeOverride:)();
}

uint64_t sub_10EC48()
{
  return static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)();
}

uint64_t sub_10EC58()
{
  return OutputGenerationManifest.init(dialogPhase:_:)();
}

uint64_t sub_10EC68()
{
  return OutputGenerationManifest.nlContextUpdate.setter();
}

uint64_t sub_10EC78()
{
  return OutputGenerationManifest.listenAfterSpeaking.setter();
}

uint64_t sub_10EC88()
{
  return type metadata accessor for OutputGenerationManifest();
}

uint64_t sub_10EC98()
{
  return ParameterResolutionRecord.intent.getter();
}

uint64_t sub_10ECA8()
{
  return ParameterResolutionRecord.result.getter();
}

uint64_t sub_10ECB8()
{
  return ParameterResolutionRecord.parameter.getter();
}

uint64_t sub_10ECC8()
{
  return OrdinalDisplayHintsBuilder.init(referenceNode:)();
}

uint64_t sub_10ECD8()
{
  return OrdinalDisplayHintsBuilder.build(for:)();
}

uint64_t sub_10ECE8()
{
  return type metadata accessor for OrdinalDisplayHintsBuilder();
}

uint64_t sub_10ECF8()
{
  return WindowedPaginationParameters.isNextWindowLastWindow.getter();
}

uint64_t sub_10ED08()
{
  return static WindowedPaginationParameters.makeNoPagination()();
}

uint64_t sub_10ED18()
{
  return WindowedPaginationParameters.windowSize.getter();
}

uint64_t sub_10ED28()
{
  return WindowedPaginationParameters.isConclusion.getter();
}

uint64_t sub_10ED38()
{
  return WindowedPaginationParameters.isLastWindow.getter();
}

uint64_t sub_10ED48()
{
  return WindowedPaginationParameters.isFirstWindow.getter();
}

uint64_t sub_10ED58()
{
  return type metadata accessor for WindowedPaginationParameters();
}

uint64_t sub_10ED88()
{
  return static WindowingDisambiguationInputType.unsupported()();
}

uint64_t sub_10ED98()
{
  return static WindowingDisambiguationInputType.proceedToNextWindow()();
}

uint64_t sub_10EDA8()
{
  return static WindowingDisambiguationInputType.disambiguationChoice()();
}

uint64_t sub_10EDB8()
{
  return static WindowingDisambiguationInputType.cancel()();
}

uint64_t sub_10EDC8()
{
  return type metadata accessor for WindowingDisambiguationInputType();
}

uint64_t sub_10EDD8()
{
  return SimpleConfirmationResponseProvider.init(_:)();
}

uint64_t sub_10EE08()
{
  return Input.parse.getter();
}

uint64_t sub_10EE18()
{
  return Input.init(parse:)();
}

uint64_t sub_10EE28()
{
  return type metadata accessor for Input();
}

uint64_t sub_10EE38()
{
  return Parse.DirectInvocation.init(identifier:userData:)();
}

uint64_t sub_10EE48()
{
  return Parse.DirectInvocation.identifier.getter();
}

uint64_t sub_10EE58()
{
  return Parse.DirectInvocation.userData.getter();
}

uint64_t sub_10EE68()
{
  return type metadata accessor for Parse.DirectInvocation();
}

uint64_t sub_10EE78()
{
  return Parse.ServerConversion.siriKitIntent.getter();
}

uint64_t sub_10EE88()
{
  return type metadata accessor for Parse();
}

uint64_t sub_10EE98()
{
  return Output.generateFlow()();
}

uint64_t sub_10EEA8()
{
  return USOParse.userParse.getter();
}

uint64_t sub_10EEB8()
{
  return type metadata accessor for USOParse();
}

uint64_t sub_10EEC8()
{
  return AceOutput.init(commands:flowActivity:)();
}

uint64_t sub_10EED8()
{
  return type metadata accessor for AceOutput();
}

uint64_t sub_10EEE8()
{
  return Siri_Nlu_External_UserParse.firstUsoTask.getter();
}

uint64_t sub_10EEF8()
{
  return Siri_Nlu_External_UserParse.userDialogActs.getter();
}

uint64_t sub_10EF08()
{
  return type metadata accessor for Siri_Nlu_External_UserParse();
}

uint64_t sub_10EF18()
{
  return Siri_Nlu_External_UserAccepted.init()();
}

uint64_t sub_10EF28()
{
  return type metadata accessor for Siri_Nlu_External_UserAccepted();
}

uint64_t sub_10EF38()
{
  return Siri_Nlu_External_SystemOffered.offeredAct.setter();
}

uint64_t sub_10EF48()
{
  return Siri_Nlu_External_SystemOffered.init()();
}

uint64_t sub_10EF58()
{
  return type metadata accessor for Siri_Nlu_External_SystemOffered();
}

uint64_t sub_10EF68()
{
  return Siri_Nlu_External_UserDialogAct.hasAccepted.getter();
}

uint64_t sub_10EF78()
{
  return Siri_Nlu_External_UserDialogAct.hasRejected.getter();
}

uint64_t sub_10EF88()
{
  return Siri_Nlu_External_UserDialogAct.hasCancelled.getter();
}

uint64_t sub_10EF98()
{
  return Siri_Nlu_External_UserDialogAct.hasWantedToProceed.getter();
}

uint64_t sub_10EFA8()
{
  return Siri_Nlu_External_UserDialogAct.accepted.setter();
}

uint64_t sub_10EFB8()
{
  return Siri_Nlu_External_UserDialogAct.init()();
}

uint64_t sub_10EFC8()
{
  return type metadata accessor for Siri_Nlu_External_UserDialogAct();
}

uint64_t sub_10EFD8()
{
  return static Siri_Nlu_External_SystemDialogAct.buildDisambiguationDialogActFrom(_:includeBinaryPrompt:)();
}

uint64_t sub_10EFE8()
{
  return Siri_Nlu_External_SystemDialogAct.offered.setter();
}

uint64_t sub_10EFF8()
{
  return Siri_Nlu_External_SystemDialogAct.init()();
}

uint64_t sub_10F008()
{
  return type metadata accessor for Siri_Nlu_External_SystemDialogAct();
}

uint64_t sub_10F018()
{
  return dispatch thunk of Uso_VerbTemplate_NoVerb.entity.getter();
}

uint64_t sub_10F028()
{
  return dispatch thunk of UsoEntity_appleAlarm_AlarmAttribute.definedValue.getter();
}

uint64_t sub_10F038()
{
  return type metadata accessor for UsoEntity_appleAlarm_AlarmAttribute.DefinedValues();
}

uint64_t sub_10F048()
{
  return type metadata accessor for UsoEntity_appleAlarm_AlarmAttribute();
}

uint64_t sub_10F058()
{
  return DomainOntologyNode.init(name:childNodes:isInEventTree:)();
}

uint64_t sub_10F068()
{
  return type metadata accessor for DomainOntologyNode();
}

uint64_t sub_10F078()
{
  return TerminalOntologyNode.init(name:multicardinal:)();
}

uint64_t sub_10F088()
{
  return TerminalOntologyNode.name.getter();
}

uint64_t sub_10F098()
{
  return dispatch thunk of IntentNode.ontologyNodeName.getter();
}

uint64_t sub_10F0A8()
{
  return CodeGenBase.entity.getter();
}

uint64_t sub_10F0C8()
{
  return NLIntentWrapper.description.getter();
}

uint64_t sub_10F0E8()
{
  return type metadata accessor for TerminalElement.Recurrence();
}

uint64_t sub_10F0F8()
{
  return TerminalElement.DateTimeValue.endDate.getter();
}

uint64_t sub_10F108()
{
  return TerminalElement.DateTimeValue.endTime.getter();
}

uint64_t sub_10F118()
{
  return TerminalElement.DateTimeValue.init(startDate:endDate:duration:interval:recurrence:startTime:endTime:startPosition:endPosition:temporalIntent:)();
}

uint64_t sub_10F128()
{
  return TerminalElement.DateTimeValue.startTime.getter();
}

uint64_t sub_10F138()
{
  return TerminalElement.DateTimeValue.toDateTimeWithMeridiemSetByUser()();
}

uint64_t sub_10F148()
{
  return TerminalElement.DateTimeValue.recurrence.getter();
}

uint64_t sub_10F158()
{
  return TerminalElement.DateTimeValue.endPosition.getter();
}

uint64_t sub_10F168()
{
  return TerminalElement.DateTimeValue.startPosition.getter();
}

uint64_t sub_10F178()
{
  return TerminalElement.DateTimeValue.temporalIntent.getter();
}

uint64_t sub_10F188()
{
  return TerminalElement.DateTimeValue.duration.getter();
}

uint64_t sub_10F198()
{
  return TerminalElement.DateTimeValue.interval.getter();
}

uint64_t sub_10F1A8()
{
  return type metadata accessor for TerminalElement.DateTimeValue();
}

uint64_t sub_10F1B8()
{
  return type metadata accessor for TerminalElement.OriginalValue();
}

uint64_t sub_10F1C8()
{
  return TerminalElement.originalValue.getter();
}

uint64_t sub_10F1D8()
{
  return TerminalElement.DateTimePeriod.period.getter();
}

uint64_t sub_10F1E8()
{
  return type metadata accessor for TerminalElement.DateTimePeriod();
}

uint64_t sub_10F1F8()
{
  return type metadata accessor for TerminalElement.Date();
}

uint64_t sub_10F208()
{
  return TerminalElement.Time.toTime()();
}

uint64_t sub_10F218()
{
  return TerminalElement.Time.period.getter();
}

uint64_t sub_10F228()
{
  return type metadata accessor for TerminalElement.Time();
}

uint64_t sub_10F238()
{
  return type metadata accessor for TerminalElement.Value();
}

uint64_t sub_10F248()
{
  return TerminalElement.value.getter();
}

uint64_t sub_10F258()
{
  return type metadata accessor for TerminalElement.Period();
}

uint64_t sub_10F268()
{
  return TerminalElement.Duration.duration.getter();
}

uint64_t sub_10F278()
{
  return type metadata accessor for TerminalElement.Duration();
}

uint64_t sub_10F288()
{
  return TerminalElement.Interval.period.getter();
}

uint64_t sub_10F298()
{
  return type metadata accessor for TerminalElement.Interval();
}

uint64_t sub_10F2A8()
{
  return type metadata accessor for TerminalElement();
}

uint64_t sub_10F2B8()
{
  return dispatch thunk of CodeGenListEntry.entry.getter();
}

uint64_t sub_10F2C8()
{
  return dispatch thunk of CodeGenGlobalArgs.usoQuantifier.getter();
}

uint64_t sub_10F2D8()
{
  return dispatch thunk of CodeGenGlobalArgs.usoListPosition.getter();
}

uint64_t sub_10F2E8()
{
  return dispatch thunk of CodeGenGlobalArgs.usoReferenceType.getter();
}

uint64_t sub_10F2F8()
{
  return TerminalIntentNode.elements.getter();
}

uint64_t sub_10F308()
{
  return type metadata accessor for TerminalIntentNode();
}

uint64_t sub_10F318()
{
  return IntentNodeTraversable.value<A>(forNode:)();
}

uint64_t sub_10F328()
{
  return NonTerminalIntentNode.ontologyNodeName.getter();
}

uint64_t sub_10F338()
{
  return NonTerminalIntentNode.childNodes.getter();
}

uint64_t sub_10F348()
{
  return type metadata accessor for NonTerminalIntentNode();
}

uint64_t sub_10F358()
{
  return dispatch thunk of UsoEntity_common_Time.occurringIn.getter();
}

uint64_t sub_10F368()
{
  return dispatch thunk of UsoEntity_common_Time.hour.getter();
}

uint64_t sub_10F378()
{
  return UsoEntity_common_Alarm.relativeOffsetInMinutes.getter();
}

uint64_t sub_10F388()
{
  return dispatch thunk of UsoEntity_common_Alarm.attributes.getter();
}

uint64_t sub_10F398()
{
  return dispatch thunk of UsoEntity_common_Alarm.endDateTime.getter();
}

uint64_t sub_10F3A8()
{
  return dispatch thunk of UsoEntity_common_Alarm.timeRemaining.getter();
}

uint64_t sub_10F3B8()
{
  return dispatch thunk of UsoEntity_common_Alarm.recurringDateTime.getter();
}

uint64_t sub_10F3C8()
{
  return dispatch thunk of UsoEntity_common_Alarm.name.getter();
}

uint64_t sub_10F3D8()
{
  return dispatch thunk of Uso_VerbTemplate_Target.target.getter();
}

uint64_t sub_10F3E8()
{
  return static UsoTask_CodegenConverter.convert(task:)();
}

uint64_t sub_10F3F8()
{
  return static UsoBuilderConversionUtils.convertEntityBuilderToEntity(entityBuilder:)();
}

uint64_t sub_10F408()
{
  return UsoEntity_common_DateTime.toDateTimeWithMeridiemSetByUser()();
}

uint64_t sub_10F418()
{
  return dispatch thunk of UsoEntity_common_DateTime.occurringIn.getter();
}

uint64_t sub_10F428()
{
  return dispatch thunk of UsoEntity_common_DateTime.time.getter();
}

uint64_t sub_10F438()
{
  return type metadata accessor for UsoTask_read_common_Alarm();
}

uint64_t sub_10F448()
{
  return type metadata accessor for UsoTask_read_uso_NoEntity();
}

uint64_t sub_10F458()
{
  return type metadata accessor for UsoTask_stop_uso_NoEntity();
}

uint64_t sub_10F468()
{
  return static UsoEntity_CodeGenConverter.convertAs<A>(entity:asType:)();
}

uint64_t sub_10F478()
{
  return type metadata accessor for UsoTask_close_uso_NoEntity();
}

uint64_t sub_10F488()
{
  return type metadata accessor for UsoTask_start_uso_NoEntity();
}

uint64_t sub_10F498()
{
  return dispatch thunk of Uso_VerbTemplate_Reference.reference.getter();
}

uint64_t sub_10F4A8()
{
  return dispatch thunk of UsoEntity_common_Quantifier.definedValue.getter();
}

uint64_t sub_10F4B8()
{
  return type metadata accessor for UsoEntity_common_Quantifier.DefinedValues();
}

uint64_t sub_10F4C8()
{
  return type metadata accessor for UsoTask_create_common_Alarm();
}

uint64_t sub_10F4D8()
{
  return type metadata accessor for UsoTask_delete_common_Alarm();
}

uint64_t sub_10F4E8()
{
  return type metadata accessor for UsoTask_delete_uso_NoEntity();
}

uint64_t sub_10F4F8()
{
  return type metadata accessor for UsoTask_enable_common_Alarm();
}

uint64_t sub_10F508()
{
  return type metadata accessor for UsoTask_noVerb_common_Alarm();
}

uint64_t sub_10F518()
{
  return type metadata accessor for UsoTask_noVerb_uso_NoEntity();
}

uint64_t sub_10F528()
{
  return type metadata accessor for UsoTask_resume_uso_NoEntity();
}

uint64_t sub_10F538()
{
  return type metadata accessor for UsoTask_snooze_common_Alarm();
}

uint64_t sub_10F548()
{
  return type metadata accessor for UsoTask_update_common_Alarm();
}

uint64_t sub_10F558()
{
  return type metadata accessor for UsoTask_update_uso_NoEntity();
}

uint64_t sub_10F568()
{
  return type metadata accessor for UsoTask_disable_common_Alarm();
}

uint64_t sub_10F578()
{
  return type metadata accessor for UsoTask_request_common_Alarm();
}

uint64_t sub_10F588()
{
  return dispatch thunk of UsoEntityBuilder_common_Alarm.setEndDateTime(value:)();
}

uint64_t sub_10F598()
{
  return dispatch thunk of UsoEntityBuilder_common_Alarm.setName(value:)();
}

uint64_t sub_10F5A8()
{
  return UsoEntityBuilder_common_Alarm.init()();
}

uint64_t sub_10F5B8()
{
  return type metadata accessor for UsoEntityBuilder_common_Alarm();
}

uint64_t sub_10F5C8()
{
  return dispatch thunk of UsoEntity_common_ListPosition.definedValue.getter();
}

uint64_t sub_10F5D8()
{
  return type metadata accessor for UsoEntity_common_ListPosition.DefinedValues();
}

uint64_t sub_10F5E8()
{
  return dispatch thunk of UsoEntity_common_DateTimeRange.definedValue.getter();
}

uint64_t sub_10F5F8()
{
  return type metadata accessor for UsoEntity_common_DateTimeRange.DefinedValues();
}

uint64_t sub_10F608()
{
  return dispatch thunk of UsoEntity_common_ReferenceType.definedValue.getter();
}

uint64_t sub_10F618()
{
  return type metadata accessor for UsoEntity_common_ReferenceType.DefinedValues();
}

uint64_t sub_10F628()
{
  return type metadata accessor for UsoTask_summarise_common_Alarm();
}

uint64_t sub_10F638()
{
  return dispatch thunk of UsoEntityBuilder_common_Integer.setIntegerValue(value:)();
}

uint64_t sub_10F648()
{
  return UsoEntityBuilder_common_Integer.init()();
}

uint64_t sub_10F658()
{
  return type metadata accessor for UsoEntityBuilder_common_Integer();
}

uint64_t sub_10F688()
{
  return dispatch thunk of UsoEntityBuilder_common_DateTime.setTime(value:)();
}

uint64_t sub_10F698()
{
  return UsoEntityBuilder_common_DateTime.init()();
}

uint64_t sub_10F6A8()
{
  return type metadata accessor for UsoEntityBuilder_common_DateTime();
}

uint64_t sub_10F6B8()
{
  return UsoTaskBuilder_read_common_Alarm.init()();
}

uint64_t sub_10F6C8()
{
  return type metadata accessor for UsoTaskBuilder_read_common_Alarm();
}

uint64_t sub_10F6D8()
{
  return dispatch thunk of Uso_VerbTemplate_ReferenceSelect.select.getter();
}

uint64_t sub_10F6E8()
{
  return dispatch thunk of Uso_VerbTemplate_ReferenceSelect.reference.getter();
}

uint64_t sub_10F6F8()
{
  return dispatch thunk of Uso_VerbTemplate_ReferenceTarget.target.getter();
}

uint64_t sub_10F708()
{
  return dispatch thunk of Uso_VerbTemplate_ReferenceTarget.reference.getter();
}

uint64_t sub_10F718()
{
  return dispatch thunk of Uso_VerbTemplateBuilder_Reference.setReference(value:)();
}

uint64_t sub_10F728()
{
  return dispatch thunk of Uso_VerbTemplate_ReferenceControl.reference.getter();
}

uint64_t sub_10F738()
{
  return UsoEntity_common_RecurringDateTime.toDateTimeWithMeridiemSetByUser()();
}

uint64_t sub_10F748()
{
  return UsoTaskBuilder_create_common_Alarm.init()();
}

uint64_t sub_10F758()
{
  return type metadata accessor for UsoTaskBuilder_create_common_Alarm();
}

uint64_t sub_10F768()
{
  return UsoTaskBuilder_delete_common_Alarm.init()();
}

uint64_t sub_10F778()
{
  return type metadata accessor for UsoTaskBuilder_delete_common_Alarm();
}

uint64_t sub_10F788()
{
  return UsoTaskBuilder_enable_common_Alarm.init()();
}

uint64_t sub_10F798()
{
  return type metadata accessor for UsoTaskBuilder_enable_common_Alarm();
}

uint64_t sub_10F7A8()
{
  return UsoTaskBuilder_snooze_common_Alarm.init()();
}

uint64_t sub_10F7B8()
{
  return type metadata accessor for UsoTaskBuilder_snooze_common_Alarm();
}

uint64_t sub_10F7C8()
{
  return UsoTaskBuilder_update_common_Alarm.init()();
}

uint64_t sub_10F7D8()
{
  return type metadata accessor for UsoTaskBuilder_update_common_Alarm();
}

uint64_t sub_10F7E8()
{
  return UsoTaskBuilder_disable_common_Alarm.init()();
}

uint64_t sub_10F7F8()
{
  return type metadata accessor for UsoTaskBuilder_disable_common_Alarm();
}

uint64_t sub_10F808()
{
  return UsoTaskBuilder_request_common_Alarm.init()();
}

uint64_t sub_10F818()
{
  return type metadata accessor for UsoTaskBuilder_request_common_Alarm();
}

uint64_t sub_10F828()
{
  return type metadata accessor for UsoTask_checkExistence_common_Alarm();
}

uint64_t sub_10F838()
{
  return UsoTaskBuilder_summarise_common_Alarm.init()();
}

uint64_t sub_10F848()
{
  return type metadata accessor for UsoTaskBuilder_summarise_common_Alarm();
}

uint64_t sub_10F858()
{
  return dispatch thunk of UsoEntityBuilder_common_Time24HourClock.setHour(value:)();
}

uint64_t sub_10F868()
{
  return dispatch thunk of UsoEntityBuilder_common_Time24HourClock.setMinute(value:)();
}

uint64_t sub_10F878()
{
  return UsoEntityBuilder_common_Time24HourClock.init()();
}

uint64_t sub_10F888()
{
  return type metadata accessor for UsoEntityBuilder_common_Time24HourClock();
}

uint64_t sub_10F898()
{
  return dispatch thunk of Uso_VerbTemplateBuilder_ReferenceSelect.setReference(value:)();
}

uint64_t sub_10F8A8()
{
  return dispatch thunk of Uso_VerbTemplateBuilder_ReferenceTarget.setReference(value:)();
}

uint64_t sub_10F8B8()
{
  return dispatch thunk of Uso_VerbTemplateBuilder_ReferenceTarget.setTarget(value:)();
}

uint64_t sub_10F8C8()
{
  return UsoTaskBuilder_checkExistence_common_Alarm.init()();
}

uint64_t sub_10F8D8()
{
  return type metadata accessor for UsoTaskBuilder_checkExistence_common_Alarm();
}

uint64_t sub_10F8E8()
{
  return UsoTask.alarmEntity.getter();
}

uint64_t sub_10F8F8()
{
  return UsoTask.verbString.getter();
}

uint64_t sub_10F908()
{
  return type metadata accessor for UsoTask();
}

uint64_t sub_10F918()
{
  return NLIntent.domainNode.getter();
}

uint64_t sub_10F928()
{
  return type metadata accessor for NLIntent();
}

uint64_t sub_10F938()
{
  return UsoEntity.attributes.getter();
}

uint64_t sub_10F948()
{
  return type metadata accessor for DateTimeResolutionContext.Hemisphere();
}

uint64_t sub_10F958()
{
  return DefinedDateTimeRangeStore.isDateInDefinedDateTimeRange(_:dateTimeRange:calendar:locale:hemisphere:overrides:)();
}

uint64_t sub_10F968()
{
  return DefinedDateTimeRangeStore.init()();
}

uint64_t sub_10F978()
{
  return type metadata accessor for DefinedDateTimeRangeStore();
}

uint64_t sub_10F988()
{
  return DateTime.Time.dateComponents()();
}

uint64_t sub_10F998()
{
  return dispatch thunk of DateTime.Time.description.getter();
}

uint64_t sub_10F9A8()
{
  return dispatch thunk of DateTime.Time.meridiemSetByUser.getter();
}

unint64_t sub_10F9B8(Swift::Bool isTimeRange)
{
  return (unint64_t)DateTime.toINAlarmSearchDateTime(isTimeRange:)(isTimeRange);
}

INDateComponentsRange sub_10F9C8()
{
  return DateTime.asDateComponentsRange()();
}

unint64_t sub_10F9D8(Swift::Bool shouldUseInferredMeridiem, Swift::Bool insertToEndTime)
{
  return (unint64_t)DateTime.asTimePoint(shouldUseInferredMeridiem:insertToEndTime:)(shouldUseInferredMeridiem, insertToEndTime);
}

uint64_t sub_10F9E8()
{
  return DateTime.dateComponentsIn24HourClock(shouldUseInferredMeridiem:)();
}

uint64_t sub_10F9F8()
{
  return type metadata accessor for DateTime.DateTimeRange.DefinedDateTimeRange();
}

uint64_t sub_10FA08()
{
  return dispatch thunk of DateTime.DateTimeRange.description.getter();
}

uint64_t sub_10FA18()
{
  return DateTime.occurringIn.getter();
}

uint64_t sub_10FA28()
{
  return DateTime.time.getter();
}

uint64_t sub_10FA38()
{
  return type metadata accessor for DateTime();
}

uint64_t sub_10FA48()
{
  return SiriEnvironment.currentRequest.getter();
}

uint64_t sub_10FA58()
{
  return static SiriEnvironment.default.getter();
}

uint64_t sub_10FA68()
{
  return type metadata accessor for SiriEnvironment();
}

uint64_t sub_10FA78()
{
  return Transformer.init(transform:)();
}

uint64_t sub_10FA88()
{
  return static ResponseMode.== infix(_:_:)();
}

uint64_t sub_10FA98()
{
  return static ResponseMode.voiceOnly.getter();
}

uint64_t sub_10FAA8()
{
  return type metadata accessor for ResponseMode();
}

uint64_t sub_10FAB8()
{
  return dispatch thunk of DialogCalendar.nonSpecificDateTimeDescriptive.getter();
}

uint64_t sub_10FAC8()
{
  return dispatch thunk of DialogCalendar.Builder.build()();
}

uint64_t sub_10FAD8()
{
  return dispatch thunk of DialogCalendar.Builder.withSecs(_:)();
}

uint64_t sub_10FAE8()
{
  return DialogCalendar.Builder.init()();
}

uint64_t sub_10FAF8()
{
  return type metadata accessor for DialogCalendar.Builder();
}

uint64_t sub_10FB08()
{
  return type metadata accessor for DialogCalendar();
}

uint64_t sub_10FB18()
{
  return CATWrapper.init(templateDir:options:globals:)();
}

uint64_t sub_10FB28()
{
  return dispatch thunk of CATWrapper.execute(catId:parameters:)();
}

uint64_t sub_10FB38()
{
  return CATWrapper.__allocating_init(options:globals:)();
}

uint64_t sub_10FB48()
{
  return CATWrapper.deinit();
}

uint64_t sub_10FB58()
{
  return SirikitApp.init(app:)();
}

uint64_t sub_10FB68()
{
  return type metadata accessor for SirikitApp();
}

uint64_t sub_10FB78()
{
  return static CATExecutor.registerBundle(bundle:templateDir:)();
}

uint64_t sub_10FB88()
{
  return type metadata accessor for CATExecutor();
}

uint64_t sub_10FB98()
{
  return SpeakableString.init(serializedValue:)();
}

uint64_t sub_10FBA8()
{
  return SpeakableString.init(print:speak:)();
}

uint64_t sub_10FBB8()
{
  return SpeakableString.print.getter();
}

uint64_t sub_10FBC8()
{
  return type metadata accessor for SpeakableString();
}

uint64_t sub_10FBD8()
{
  return CATWrapperSimple.init(templateDir:options:globals:)();
}

uint64_t sub_10FBE8()
{
  return CATWrapperSimple.init(useResponseMode:options:)();
}

uint64_t sub_10FBF8()
{
  return CATWrapperSimple.__allocating_init(options:globals:)();
}

uint64_t sub_10FC08()
{
  return CATWrapperSimple.deinit();
}

uint64_t sub_10FC18()
{
  return type metadata accessor for SirikitDeviceState();
}

uint64_t sub_10FC28()
{
  return static Log.siriDialogEngine.getter();
}

uint64_t sub_10FC38()
{
  return CATType.toDictionary.getter();
}

uint64_t sub_10FC48()
{
  return static CATOption.defaultMode.getter();
}

uint64_t sub_10FC58()
{
  return static CATOption.labelMode.getter();
}

uint64_t sub_10FC68()
{
  return type metadata accessor for CATOption();
}

uint64_t sub_10FC78()
{
  return static DateTimeInferenceUtils.defaultAnchorDate.getter();
}

uint64_t sub_10FC88()
{
  return static DateTimeInferenceUtils.inferDateTime(from:anchorDate:)();
}

uint64_t sub_10FC98()
{
  return static DateTimeInferenceUtils.inferDateTimeRange(from:anchorDate:)();
}

uint64_t sub_10FCA8()
{
  return SiriReferenceResolutionResolver.getAlarmEntityFromDateTime()();
}

uint64_t sub_10FCB8()
{
  return SiriReferenceResolutionResolver.hasReference(usoEntity:)();
}

uint64_t sub_10FCC8()
{
  return SiriReferenceResolutionResolver.resolveReferenceEntity(referenceEntity:)();
}

uint64_t sub_10FCD8()
{
  return static SiriReferenceResolutionResolver.shared.getter();
}

uint64_t sub_10FCE8()
{
  return type metadata accessor for SiriReferenceResolutionResolver();
}

uint64_t sub_10FCF8()
{
  return SiriTimeAppBundleId.rawValue.getter();
}

uint64_t sub_10FD08()
{
  return type metadata accessor for SiriTimeAppBundleId();
}

uint64_t sub_10FD18()
{
  return static SiriTimeEventSender.sendEvent(activityType:taskType:reason:attribute:description:)();
}

uint64_t sub_10FD28()
{
  return type metadata accessor for SiriTimeEventSender.ReasonDescription();
}

uint64_t sub_10FD38()
{
  return type metadata accessor for SiriTimeEventSender.TaskType();
}

uint64_t sub_10FD48()
{
  return type metadata accessor for SiriTimeEventSender.Attribute();
}

uint64_t sub_10FD58()
{
  return type metadata accessor for SiriTimeMeasurement.LogDescription();
}

void sub_10FD68()
{
}

uint64_t sub_10FD78()
{
  return type metadata accessor for SiriTimeMeasurement();
}

uint64_t sub_10FD88()
{
  return SiriTimeMeasurement.init(_:log:startTime:)();
}

BOOL sub_10FD98()
{
  return SiriTimeFeatureFlagsImpl.isAlarmSmartEnabled()();
}

BOOL sub_10FDA8()
{
  return SiriTimeFeatureFlagsImpl.isConfirmationsResponseFrameworkEnabled()();
}

uint64_t sub_10FDB8()
{
  return static SiriTimeFeatureFlagsImpl.instance.getter();
}

uint64_t sub_10FDC8()
{
  return type metadata accessor for SiriTimeFeatureFlagsImpl();
}

uint64_t sub_10FDD8()
{
  return SiriTimeCrossDeviceAnalytics.logSharedAnalyticsEnded(result:)();
}

uint64_t sub_10FDE8()
{
  return SiriTimeCrossDeviceAnalytics.logSharedAnalyticsStarted(selectedDevice:)();
}

uint64_t sub_10FDF8()
{
  return SiriTimeCrossDeviceAnalytics.init(action:)();
}

uint64_t sub_10FE08()
{
  return type metadata accessor for SiriTimeCrossDeviceAnalytics();
}

uint64_t sub_10FE18()
{
  return SiriTimeDeviceContextProvider.init(sharedContext:)();
}

uint64_t sub_10FE38()
{
  return type metadata accessor for SiriTimeDeviceContextProvider();
}

uint64_t sub_10FE48()
{
  return PunchOutApp.toResponseFrameworkCommandAction()();
}

uint64_t sub_10FE58()
{
  return PunchOutApp.url.getter();
}

uint64_t sub_10FE68()
{
  return type metadata accessor for PunchOutApp();
}

uint64_t sub_10FE78()
{
  return ButtonOption.init(rawValue:)();
}

uint64_t sub_10FE88()
{
  return ButtonOption.rawValue.getter();
}

uint64_t sub_10FE98()
{
  return type metadata accessor for ButtonOption();
}

uint64_t sub_10FEA8()
{
  return type metadata accessor for DecideAction.PromptExpectation();
}

uint64_t sub_10FEB8()
{
  return type metadata accessor for ErrorSubType();
}

uint64_t sub_10FEC8()
{
  return AppInstallUtil.isAppInstalled.getter();
}

uint64_t sub_10FED8()
{
  return AppInstallUtil.appStorePunchout(installOnly:)();
}

uint64_t sub_10FEE8()
{
  return AppInstallUtil.Domain.appTypeToInstall.getter();
}

uint64_t sub_10FEF8()
{
  return type metadata accessor for AppInstallUtil.Domain();
}

uint64_t sub_10FF08()
{
  return AppInstallUtil.init(domain:)();
}

uint64_t sub_10FF18()
{
  return type metadata accessor for AppInstallUtil();
}

uint64_t sub_10FF28()
{
  return static BarbaraWalters.stopThePresses(for:)();
}

uint64_t sub_10FF38()
{
  return static BarbaraWalters.logAndReturnError<A>(context:_:)();
}

uint64_t sub_10FF48()
{
  return static DialogActBuilder.buildPromptValueDialogActFrom(_:forDomain:)();
}

uint64_t sub_10FF58()
{
  return static DialogActBuilder.buildPromptConfirmationDialogActFrom(_:forDomain:)();
}

uint64_t sub_10FF68()
{
  return HALDeviceContext.isCommunal.getter();
}

uint64_t sub_10FF78()
{
  return HALDeviceContext.remoteDevice.getter();
}

uint64_t sub_10FF88()
{
  return HALDeviceContext.shouldDismissSilently.getter();
}

uint64_t sub_10FF98()
{
  return ApplicationContext.deviceState.getter();
}

uint64_t sub_10FFA8()
{
  return static ApplicationContext.shared.getter();
}

uint64_t sub_10FFB8()
{
  return type metadata accessor for ApplicationContext();
}

uint64_t sub_10FFC8()
{
  return static DirectInvocationUtils.isQuickStopDirectInvocation(_:)();
}

uint64_t sub_10FFD8()
{
  return static DirectInvocationUtils.siriKitConfirmationResponse(_:)();
}

uint64_t sub_10FFE8()
{
  return DirectInvocationUtils.Alarm.UserInfoKey.rawValue.getter();
}

uint64_t sub_10FFF8()
{
  return type metadata accessor for DirectInvocationUtils.Alarm.UserInfoKey();
}

uint64_t sub_110008()
{
  return static DirectInvocationUtils.Alarm.reformToTimer(duration:label:)();
}

uint64_t sub_110018()
{
  return DirectInvocationUtils.Alarm.URI.init(rawValue:)();
}

uint64_t sub_110028()
{
  return DirectInvocationUtils.Alarm.URI.rawValue.getter();
}

uint64_t sub_110038()
{
  return type metadata accessor for DirectInvocationUtils.Alarm.URI();
}

uint64_t sub_110048()
{
  return HALAlarmDeviceContext.toSnoozeAlarmIntent.getter();
}

uint64_t sub_110058()
{
  return HALAlarmDeviceContext.toDismissAlarmIntent.getter();
}

uint64_t sub_110068()
{
  return HALAlarmDeviceContext.remoteExecutionId.getter();
}

uint64_t sub_110078()
{
  return HALAlarmDeviceContext.device.getter();
}

uint64_t sub_110088()
{
  return type metadata accessor for HALAlarmDeviceContext();
}

uint64_t sub_110098()
{
  return static ResponseDisambigUtils.windowingResponse(for:)();
}

uint64_t sub_1100A8()
{
  return static ResponseDisambigUtils.windowingResponse(for:)();
}

uint64_t sub_1100B8()
{
  return static ResponseDisambigUtils.calculateWindow<A>(windowItems:allItems:windowSize:)();
}

uint64_t sub_1100D8()
{
  return type metadata accessor for UnhandledAbortSubtype();
}

uint64_t sub_1100E8()
{
  return type metadata accessor for DialogLayerErrorSubType();
}

uint64_t sub_1100F8()
{
  return YesNoSearchWindowStrategy.init(manifest:responseGenerator:rejectionOutputProducer:cancellationOutputProducer:nlv3ActionForInput:nlv3ParseConfirmation:promptPatternExecutionProducer:)();
}

uint64_t sub_110108()
{
  return type metadata accessor for YesNoSearchWindowStrategy();
}

uint64_t sub_110128()
{
  return AppInstallDialogOutputUtil.init(domain:fallbackCAT:)();
}

uint64_t sub_110138()
{
  return type metadata accessor for AppInstallDialogOutputUtil();
}

uint64_t sub_110148()
{
  return UnsupportedAppNotInstalledFlow.init(domain:patternExecutor:legacyBuilder:)();
}

uint64_t sub_110158()
{
  return type metadata accessor for UnsupportedAppNotInstalledFlow();
}

uint64_t sub_110168()
{
  return dispatch thunk of UnsupportedAppPatternParameters.buttonPunchoutAction.getter();
}

uint64_t sub_110178()
{
  return dispatch thunk of UnsupportedAppPatternParameters.device.getter();
}

uint64_t sub_110188()
{
  return NoOpFlow.init()();
}

uint64_t sub_110198()
{
  return type metadata accessor for NoOpFlow();
}

uint64_t sub_1101A8()
{
  return type metadata accessor for ABCReport();
}

uint64_t sub_1101B8()
{
  return App.init(appIdentifier:systemExtensionBundleId:systemUIExtensionBundleId:pluginIdentifier:)();
}

uint64_t sub_1101C8()
{
  return type metadata accessor for App();
}

uint64_t sub_1101D8()
{
  return static SharedContext.current.getter();
}

uint64_t sub_1101E8()
{
  return CurrentRequest.responseMode.getter();
}

uint64_t sub_1101F8()
{
  return type metadata accessor for ChangeAlarmStatusIntent();
}

uint64_t sub_110208()
{
  return ChangeAlarmStatusOperation.rawValue.getter();
}

uint64_t sub_110218()
{
  return type metadata accessor for ChangeAlarmStatusIntentResponse();
}

uint64_t sub_110228()
{
  return dispatch thunk of CreateAlarmIntentResponse.code.getter();
}

uint64_t sub_110238()
{
  return type metadata accessor for CreateAlarmIntentResponse();
}

uint64_t sub_110248()
{
  return CreateAlarmIntentResponseCode.rawValue.getter();
}

uint64_t sub_110258()
{
  return type metadata accessor for CreateAlarmIntent();
}

uint64_t sub_110268()
{
  return dispatch thunk of DeleteAlarmIntentResponse.code.getter();
}

uint64_t sub_110278()
{
  return type metadata accessor for DeleteAlarmIntentResponse();
}

uint64_t sub_110288()
{
  return DeleteAlarmIntentResponseCode.rawValue.getter();
}

uint64_t sub_110298()
{
  return type metadata accessor for DeleteAlarmIntent();
}

uint64_t sub_1102A8()
{
  return type metadata accessor for SearchAlarmIntentResponse();
}

uint64_t sub_1102B8()
{
  return SearchAlarmAlarmsUnsupportedReason.init(rawValue:)();
}

uint64_t sub_1102C8()
{
  return type metadata accessor for SearchAlarmIntent();
}

uint64_t sub_1102D8()
{
  return dispatch thunk of SnoozeAlarmHalIntentResponse.code.getter();
}

uint64_t sub_1102E8()
{
  return type metadata accessor for SnoozeAlarmHalIntentResponse();
}

uint64_t sub_1102F8()
{
  return SnoozeAlarmHalIntentResponseCode.rawValue.getter();
}

uint64_t sub_110308()
{
  return type metadata accessor for SnoozeAlarmHalIntent();
}

uint64_t sub_110318()
{
  return type metadata accessor for UpdateAlarmIntentResponse();
}

uint64_t sub_110328()
{
  return type metadata accessor for UpdateAlarmIntent();
}

uint64_t sub_110338()
{
  return dispatch thunk of DismissAlarmHalIntentResponse.code.getter();
}

uint64_t sub_110348()
{
  return type metadata accessor for DismissAlarmHalIntentResponse();
}

uint64_t sub_110358()
{
  return DismissAlarmHalIntentResponseCode.rawValue.getter();
}

uint64_t sub_110368()
{
  return type metadata accessor for DismissAlarmHalIntent();
}

uint64_t sub_110378()
{
  return AlarmSearchStatus.rawValue.getter();
}

uint64_t sub_110388()
{
  return AlarmSnippetModel.init(alarms:)();
}

uint64_t sub_110398()
{
  return AlarmNLv4Constants.AlarmVerb.init(rawValue:)();
}

uint64_t sub_1103A8()
{
  return AlarmNLv4Constants.AlarmVerb.rawValue.getter();
}

uint64_t sub_1103B8()
{
  return type metadata accessor for AlarmNLv4Constants.AlarmVerb();
}

uint64_t sub_1103C8()
{
  return AlarmReferenceType.rawValue.getter();
}

uint64_t sub_1103D8()
{
  return AlarmSelectorModel.init(alarms:header:)();
}

uint64_t sub_1103E8()
{
  return type metadata accessor for AlarmOperationError();
}

uint64_t sub_1103F8()
{
  return type metadata accessor for AlarmRepeatSchedule();
}

uint64_t sub_110408()
{
  return static AlarmIntentHandlerUtils.selectIntentHandlers(from:)();
}

uint64_t sub_110418()
{
  return static AlarmRepeatScheduleConstants.friday.getter();
}

uint64_t sub_110428()
{
  return static AlarmRepeatScheduleConstants.monday.getter();
}

uint64_t sub_110438()
{
  return static AlarmRepeatScheduleConstants.sunday.getter();
}

uint64_t sub_110448()
{
  return static AlarmRepeatScheduleConstants.tuesday.getter();
}

uint64_t sub_110458()
{
  return static AlarmRepeatScheduleConstants.saturday.getter();
}

uint64_t sub_110468()
{
  return static AlarmRepeatScheduleConstants.thursday.getter();
}

uint64_t sub_110478()
{
  return static AlarmRepeatScheduleConstants.wednesday.getter();
}

uint64_t sub_110488()
{
  return static AlarmID.alarmUUID(fromIdentifier:)();
}

uint64_t sub_110498()
{
  return AlarmPeriod.rawValue.getter();
}

uint64_t sub_1104A8()
{
  return type metadata accessor for AlarmSearch();
}

uint64_t sub_1104B8()
{
  return static SiriTimeLog.alarmPlugin.getter();
}

uint64_t _s15AlarmFlowPlugin021RecreateDeletedAlarmsB0C11osLogObject33_DB4DDA2311F8F0836B4CA98F718F999FLLSo03OS_G4_logCvpfi_0()
{
  return static SiriTimeLog.alarmExtensionOSLogObject.getter();
}

uint64_t sub_1104D8()
{
  return static SiriTimeLog.alarmFlow.getter();
}

uint64_t sub_1104E8()
{
  return SiriAlarm.matches(alarmSearch:)();
}

uint64_t sub_1104F8()
{
  return type metadata accessor for SiriAlarm();
}

uint64_t sub_110508()
{
  return SiriAlarmManagerImpl.__allocating_init(endpointUUID:)();
}

uint64_t sub_110518()
{
  return type metadata accessor for SiriAlarmManagerImpl();
}

uint64_t sub_110528()
{
  return SiriAlarmSnippetModel.init(id:isSleepAlarm:formattedTimeString:alarmDate:enabled:labelForSnippetWithRecurrence:sleepWakeUpLabel:sleepDisabledLabel:nonSpecificDateTimeDescriptive:locale:punchoutURL:)();
}

uint64_t sub_110538()
{
  return type metadata accessor for SiriAlarmSnippetModel();
}

uint64_t sub_110548()
{
  return type metadata accessor for SiriAlarmSnippetModels();
}

uint64_t sub_110558()
{
  return dispatch thunk of SiriAlarmManager.enableNextWakeUpAlarm(completion:)();
}

uint64_t sub_110568()
{
  return dispatch thunk of SiriAlarmManager.disableNextWakeUpAlarm(completion:)();
}

uint64_t sub_110578()
{
  return dispatch thunk of SiriAlarmManager.searchUpcomingSleepAlarm(completion:)();
}

uint64_t sub_110588()
{
  return dispatch thunk of SiriAlarmManager.createAlarm(intent:completion:)();
}

uint64_t sub_110598()
{
  return dispatch thunk of SiriAlarmManager.deleteAlarms(alarms:completion:)();
}

uint64_t sub_1105A8()
{
  return dispatch thunk of SiriAlarmManager.enableAlarms(alarms:completion:)();
}

uint64_t sub_1105B8()
{
  return dispatch thunk of SiriAlarmManager.searchAlarms(alarmSearch:completion:)();
}

uint64_t sub_1105C8()
{
  return dispatch thunk of SiriAlarmManager.disableAlarms(alarms:completion:)();
}

uint64_t sub_1105D8()
{
  return SiriAlarmItemModel.init(id:formattedTimeString:alarmDate:labelForSnippetWithRecurrence:invocationVerbValue:locale:)();
}

uint64_t sub_1105E8()
{
  return type metadata accessor for SiriAlarmItemModel();
}

uint64_t sub_1105F8()
{
  return AlarmInternalIdentifierPrefix.rawValue.getter();
}

uint64_t sub_110608()
{
  return type metadata accessor for AlarmInternalIdentifierPrefix();
}

uint64_t sub_110618()
{
  return RepeatSchedule.init(rawValue:)();
}

uint64_t sub_110628()
{
  return RepeatSchedule.rawValue.getter();
}

uint64_t sub_110638()
{
  return type metadata accessor for CrossDeviceCommandExecution.Result();
}

uint64_t sub_110648()
{
  return type metadata accessor for CrossDeviceCommandExecution();
}

uint64_t sub_110658()
{
  return DeviceUnit.isCommunalDevice.getter();
}

uint64_t sub_110668()
{
  return DeviceUnit.deviceName.getter();
}

uint64_t sub_110678()
{
  return DeviceUnit.dialogType.getter();
}

uint64_t sub_110688()
{
  return DeviceUnit.room.getter();
}

uint64_t sub_110698()
{
  return DeviceUnit.identifier.getter();
}

uint64_t sub_1106A8()
{
  return DeviceUnit.name.getter();
}

uint64_t sub_1106B8()
{
  return DeviceUnit.roomName.getter();
}

uint64_t sub_1106C8()
{
  return dispatch thunk of DeviceResolutionAnalyticsImpl.logCommandExecution(_:)();
}

uint64_t sub_1106D8()
{
  return static DeviceResolutionService.sharedAnalytics.getter();
}

uint64_t sub_1106E8()
{
  return type metadata accessor for DeviceResolutionService();
}

uint64_t sub_1106F8()
{
  return ExecutionInfo.init(executionId:action:quickStopActionResult:)();
}

uint64_t sub_110708()
{
  return type metadata accessor for ExecutionInfo.QuickStopActionResult();
}

uint64_t sub_110718()
{
  return type metadata accessor for ExecutionInfo.Action();
}

uint64_t sub_110728()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_110738()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t sub_110748()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t sub_110758()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_110768()
{
  return Logger.logObject.getter();
}

uint64_t sub_110778()
{
  return type metadata accessor for Logger();
}

uint64_t sub_110788()
{
  return GroupIdentifier.init(id:seq:)();
}

uint64_t sub_110798()
{
  return type metadata accessor for GroupIdentifier();
}

uint64_t sub_1107A8()
{
  return RREntity.convertData<A>(to:)();
}

uint64_t sub_1107B8()
{
  return RREntity.init<A>(id:appBundleId:usoEntity:intentEntity:group:)();
}

uint64_t sub_1107C8()
{
  return RREntity.group.setter();
}

uint64_t sub_1107D8()
{
  return type metadata accessor for RREntity();
}

NSDictionary sub_1107E8()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1107F8()
{
  return Dictionary.description.getter();
}

uint64_t sub_110808()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_110818()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_110828()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_110838()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_110848()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_110858()
{
  return String.init<A>(describing:)();
}

uint64_t sub_110868()
{
  return String.uppercased()()._countAndFlagsBits;
}

uint64_t sub_110878()
{
  return String.toSpeakableString.getter();
}

uint64_t sub_110888()
{
  return String.labelCapitalization()()._countAndFlagsBits;
}

uint64_t sub_110898()
{
  return String.hash(into:)();
}

void sub_1108A8(Swift::String a1)
{
}

Swift::Int sub_1108B8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1108C8()
{
  return Sequence.compactMap<A>(_:)();
}

uint64_t sub_1108D8()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_1108E8()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1108F8()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_110908()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_110918()
{
  return Array.description.getter();
}

uint64_t sub_110928()
{
  return specialized Array._endMutation()();
}

uint64_t sub_110938()
{
  return Array<A>.firingDevices()();
}

uint64_t sub_110948()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_110958()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_110968()
{
  return Array.count.getter();
}

uint64_t sub_110978()
{
  return type metadata accessor for Array();
}

uint64_t sub_110988()
{
  return Bool.number.getter();
}

uint64_t sub_110998()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_1109A8()
{
  return Double.description.getter();
}

uint64_t sub_1109B8()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_1109C8()
{
  return Collection.isEmpty.getter();
}

uint64_t sub_1109D8()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1109E8()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1109F8()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_110A08()
{
  return SASTButtonItem.init(label:commands:)();
}

uint64_t sub_110A18()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_110A28()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_110A38()
{
  return SIRINLUUserDialogAct.firstUsoTask.getter();
}

uint64_t sub_110A98()
{
  return INIntent.withIntentId.getter();
}

uint64_t sub_110AA8()
{
  return INIntent.withEndpointId.getter();
}

NSNumber sub_110AB8(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

NSNumber sub_110AC8(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t sub_110AD8()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_110AE8()
{
  return AceObject.serializeToBase64()().value._countAndFlagsBits;
}

uint64_t sub_110AF8()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_110B08()
{
  return Optional<A>.isRecurrent.getter();
}

uint64_t sub_110B18()
{
  return type metadata accessor for Optional();
}

uint64_t sub_110B28()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_110B38()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_110B48()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t sub_110B58()
{
  return StringProtocol.addingPercentEncoding(withAllowedCharacters:)();
}

uint64_t sub_110B68()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_110B78(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_110B88()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_110B98()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_110BA8()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_110BB8()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_110BC8()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_110BD8(Swift::Int a1)
{
}

uint64_t sub_110BE8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_110BF8()
{
  return StaticString.description.getter();
}

void sub_110C08(Swift::Int a1)
{
}

uint64_t sub_110C18()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_110C28()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_110C38()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_110C48()
{
  return _ArrayProtocol.filter(_:)();
}

uint64_t sub_110C58()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_110C68()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_110C78()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_110C88()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_110C98()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_110CA8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_110CB8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_110CC8()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_110CD8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_110CE8()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_110CF8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_110D08()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_110D18()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_110D28()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_110D38()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_110D48()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_110D58()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_110D68()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_110D78()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_110D88()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_110D98()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_110DA8()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_110DB8()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_110DD8()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t sub_110DE8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_110DF8()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_110E08()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_110E18()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t sub_110E28()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_110E38()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_110E48()
{
  return Error._code.getter();
}

uint64_t sub_110E58()
{
  return Error._domain.getter();
}

uint64_t sub_110E68()
{
  return Error._userInfo.getter();
}

uint64_t sub_110E78()
{
  return Hasher.init(_seed:)();
}

void sub_110E88(Swift::UInt a1)
{
}

Swift::Int sub_110E98()
{
  return Hasher._finalize()();
}

uint64_t sub_110EA8()
{
  return Result<>.firstPrint.getter();
}

uint64_t sub_110EB8()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_110EC8()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t sub_110EF8()
{
  return _typeName(_:qualified:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return _swift_dynamicCastClassUnconditional();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return _swift_dynamicCastUnknownClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}