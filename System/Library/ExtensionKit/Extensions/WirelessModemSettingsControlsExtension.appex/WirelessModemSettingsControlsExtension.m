unint64_t sub_1000032DC()
{
  unint64_t result;

  result = qword_10001C170;
  if (!qword_10001C170)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C170);
  }
  return result;
}

uint64_t sub_100003330()
{
  return sub_1000097A8(&qword_10001C178, &qword_10001C180);
}

uint64_t sub_10000336C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000033B4()
{
  uint64_t v0 = sub_1000093BC(&qword_10001C2D0);
  __chkstk_darwin(v0 - 8);
  v13 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100012CE0();
  uint64_t v2 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100012D30();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_100012E00();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_100012CF0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = sub_100012C70();
  sub_100009534(v9, qword_10001C850);
  sub_1000094FC(v9, (uint64_t)qword_10001C850);
  sub_100012DF0();
  sub_100012D20();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.main(_:), v12);
  sub_100012D00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v13, 1, 1, v7);
  return sub_100012C60();
}

uint64_t sub_1000036C4(uint64_t a1)
{
  return sub_100006130(a1, qword_10001C868);
}

uint64_t sub_1000036E8()
{
  uint64_t v0 = sub_1000093BC(&qword_10001C3C0);
  sub_100009534(v0, qword_10001C880);
  uint64_t v1 = sub_1000094FC(v0, (uint64_t)qword_10001C880);
  sub_100012AB0();
  uint64_t v2 = sub_100012AC0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_1000037A0()
{
  uint64_t result = swift_getKeyPath();
  qword_10001C898 = result;
  return result;
}

uint64_t sub_1000037CC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_1000037D8()
{
  sub_100012930();
  return v1;
}

uint64_t sub_10000380C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_1000093BC(&qword_10001C390);
  v3[9] = swift_task_alloc();
  sub_1000093BC(&qword_10001C398);
  v3[10] = swift_task_alloc();
  sub_1000093BC(&qword_10001C3A0);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_1000128E0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_1000093BC(&qword_10001C3A8);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_1000039D0, 0, 0);
}

uint64_t sub_1000039D0()
{
  sub_100012930();
  unsigned __int8 v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_1000054B4();
  *unsigned __int8 v1 = v0;
  v1[1] = sub_100003AA4;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100004160, 0, &type metadata for AllowOthersToJoinEntity, v2);
}

uint64_t sub_100003AA4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100003BA0, 0, 0);
}

uint64_t sub_100003BA0()
{
  sub_100012930();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_100012930();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_10001C100 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10001C898;
  *(void *)(v0 + 168) = qword_10001C898;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_1000097A8(&qword_10001C320, &qword_10001C328);
  *uint64_t v3 = v0;
  v3[1] = sub_100003CF8;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_100003CF8()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10000409C;
  }
  else {
    uint64_t v2 = sub_100003E4C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100003E4C()
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
  sub_100012930();
  uint64_t v7 = sub_100012C50();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_100012C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_1000032DC();
  sub_1000057CC();
  sub_1000128B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_1000128D0();
  sub_1000128F0();
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

uint64_t sub_10000409C()
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

uint64_t sub_100004164()
{
  uint64_t v0 = sub_1000093BC(&qword_10001C3B0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001C100 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100012B10();
  swift_release();
  sub_1000057CC();
  sub_1000097A8(&qword_10001C3B8, &qword_10001C3B0);
  sub_100012B00();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1000042CC@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100012930();
  *a1 = v3;
  return result;
}

uint64_t sub_100004308()
{
  return swift_release();
}

uint64_t (*sub_100004350(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100012920();
  return sub_1000043AC;
}

uint64_t sub_1000043B0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100012930();
  *a1 = v3;
  return result;
}

uint64_t sub_1000043EC()
{
  return sub_100012940();
}

uint64_t (*sub_100004424(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100012920();
  return sub_1000043AC;
}

uint64_t sub_100004480()
{
  if (qword_10001C100 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_1000044E0()
{
  return 0xD000000000000015;
}

unint64_t sub_100004504()
{
  unint64_t result = qword_10001C188;
  if (!qword_10001C188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C188);
  }
  return result;
}

unint64_t sub_10000455C()
{
  unint64_t result = qword_10001C190;
  if (!qword_10001C190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C190);
  }
  return result;
}

uint64_t sub_1000045B0()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1000045E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006428(a1, a2, a3, (void (*)(void))sub_1000032DC);
}

uint64_t sub_1000045FC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000064B4(&qword_10001C0F0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001C868, a1);
}

uint64_t sub_100004644@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001C0F8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000093BC(&qword_10001C3C0);
  uint64_t v3 = sub_1000094FC(v2, (uint64_t)qword_10001C880);

  return sub_1000097EC(v3, a1);
}

uint64_t sub_1000046C0(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009AC8;
  return sub_10000380C(a1, v5, v4);
}

uint64_t sub_10000476C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006DE4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100004794()
{
  return 0xD000000000000028;
}

unint64_t sub_1000047B4()
{
  unint64_t result = qword_10001C1A0;
  if (!qword_10001C1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1A0);
  }
  return result;
}

unint64_t sub_10000480C()
{
  unint64_t result = qword_10001C1A8;
  if (!qword_10001C1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1A8);
  }
  return result;
}

uint64_t sub_100004860(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100004880, 0, 0);
}

uint64_t sub_100004880()
{
  uint64_t v1 = *(BOOL **)(v0 + 16);
  WiFiManagerClientCreate();
  *uint64_t v1 = WiFiManagerClientGetMISDiscoveryState() != 0;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000048FC(uint64_t a1, char *a2)
{
  char v3 = *a2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100009AC8;
  return sub_100007224(v3);
}

uint64_t sub_100004990(void *a1)
{
  uint64_t v2 = sub_1000093BC(&qword_10001C378);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_projectBox();
  swift_beginAccess();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v6, 1, v2);
  if (!result)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
    uint64_t v9 = a1;
    id v8 = a1;
    sub_100012E50();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

void sub_100004ADC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_100004B44(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_1000093BC(&qword_10001C378);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000093BC(&qword_10001C370);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v13(v12, a1, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);
  swift_beginAccess();
  sub_100009744((uint64_t)v12, a2, &qword_10001C370);
  v18[0] = 0;
  if ([a3 setPower:1 error:v18])
  {
    return _objc_retain_x1();
  }
  else
  {
    v17[0] = v18[0];
    id v14 = v18[0];
    uint64_t v15 = sub_100012CC0();

    swift_willThrow();
    swift_beginAccess();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      return swift_errorRelease();
    }
    else
    {
      v13(v9, a2, v6);
      v17[1] = v15;
      sub_100012E40();
      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
  }
}

uint64_t sub_100004E0C(int a1)
{
  uint64_t v2 = sub_1000093BC(&qword_10001C348);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_projectBox();
  if (a1 == 1001)
  {
    uint64_t v7 = v6;
    swift_beginAccess();
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v7, 1, v2))
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
      v9[1] = 1001;
      sub_100012E50();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
  }
  return 0;
}

uint64_t sub_100004F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  uint64_t v6 = v5(a2, a3);
  swift_release();
  swift_unknownObjectRelease();
  return v6;
}

xpc_object_t sub_100004FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000093BC(&qword_10001C340);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000093BC(&qword_10001C348);
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v6, a1, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  swift_beginAccess();
  sub_100009744((uint64_t)v6, a2, &qword_10001C340);
  xpc_object_t result = xpc_dictionary_create_empty();
  if (netrbClientDeviceType)
  {
    xpc_dictionary_set_uint64(result, netrbClientDeviceType, 1uLL);
    _NETRBClientStartService();
    return (xpc_object_t)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100005140(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10001C308 + dword_10001C308);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100009ABC;
  return v4();
}

unint64_t sub_1000051E8()
{
  unint64_t result = qword_10001C1B8;
  if (!qword_10001C1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1B8);
  }
  return result;
}

uint64_t sub_10000523C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100005B00();
  void *v4 = v2;
  v4[1] = sub_1000052EC;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_1000052EC(uint64_t a1)
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

unint64_t sub_100005404()
{
  unint64_t result = qword_10001C1C8;
  if (!qword_10001C1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1C8);
  }
  return result;
}

unint64_t sub_10000545C()
{
  unint64_t result = qword_10001C1D0;
  if (!qword_10001C1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1D0);
  }
  return result;
}

unint64_t sub_1000054B4()
{
  unint64_t result = qword_10001C1D8[0];
  if (!qword_10001C1D8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10001C1D8);
  }
  return result;
}

uint64_t sub_10000550C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100005B00();
  *uint64_t v5 = v2;
  v5[1] = sub_1000055C0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000055C0(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_1000056C0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100005B00();
  void *v4 = v2;
  v4[1] = sub_100009ABC;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100005774()
{
  unint64_t result = qword_10001C1F0;
  if (!qword_10001C1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1F0);
  }
  return result;
}

unint64_t sub_1000057CC()
{
  unint64_t result = qword_10001C1F8;
  if (!qword_10001C1F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1F8);
  }
  return result;
}

unint64_t sub_100005824()
{
  unint64_t result = qword_10001C200;
  if (!qword_10001C200)
  {
    sub_10000336C(qword_10001C208);
    sub_1000057CC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C200);
  }
  return result;
}

uint64_t sub_100005898(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000051E8();
  *unint64_t v5 = v2;
  v5[1] = sub_10000594C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10000594C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005A40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10000594C;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

unint64_t sub_100005B00()
{
  unint64_t result = qword_10001C220;
  if (!qword_10001C220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C220);
  }
  return result;
}

unint64_t sub_100005B58()
{
  unint64_t result = qword_10001C228;
  if (!qword_10001C228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C228);
  }
  return result;
}

uint64_t sub_100005BAC(uint64_t a1)
{
  unint64_t v2 = sub_1000054B4();

  return _EntityURLRepresentation.init(stringLiteral:)(0xD000000000000045, 0x8000000100015060, a1, v2);
}

unint64_t sub_100005C0C()
{
  unint64_t result = qword_10001C230;
  if (!qword_10001C230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C230);
  }
  return result;
}

unint64_t sub_100005C64()
{
  unint64_t result = qword_10001C238;
  if (!qword_10001C238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C238);
  }
  return result;
}

unint64_t sub_100005CBC()
{
  unint64_t result = qword_10001C240;
  if (!qword_10001C240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C240);
  }
  return result;
}

void *sub_100005D10()
{
  return &protocol witness table for String;
}

uint64_t sub_100005D1C()
{
  sub_1000094A8();
  uint64_t v2 = sub_100012BD0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100009598(v3, v0, v2, v1);
}

unint64_t sub_100005DB4()
{
  unint64_t result = qword_10001C250;
  if (!qword_10001C250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C250);
  }
  return result;
}

unint64_t sub_100005E0C()
{
  unint64_t result = qword_10001C258;
  if (!qword_10001C258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C258);
  }
  return result;
}

unint64_t sub_100005E64()
{
  unint64_t result = qword_10001C260;
  if (!qword_10001C260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C260);
  }
  return result;
}

void *sub_100005EB8()
{
  return &protocol witness table for String;
}

uint64_t sub_100005EC4@<X0>(uint64_t *a1@<X8>)
{
  sub_10000480C();
  uint64_t result = sub_100012910();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100005F04@<X0>(uint64_t a1@<X8>)
{
  return sub_1000064B4(&qword_10001C0E8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10001C850, a1);
}

uint64_t sub_100005F3C()
{
  return sub_1000097A8(&qword_10001C268, &qword_10001C270);
}

uint64_t sub_100005F78(uint64_t a1)
{
  unint64_t v2 = sub_1000054B4();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100005FC8()
{
  unint64_t result = qword_10001C278;
  if (!qword_10001C278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C278);
  }
  return result;
}

uint64_t sub_10000601C(uint64_t a1)
{
  unint64_t v2 = sub_10000480C();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100006068(uint64_t a1)
{
  unint64_t v2 = sub_100005E64();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000060B8()
{
  unint64_t result = qword_10001C280;
  if (!qword_10001C280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C280);
  }
  return result;
}

uint64_t sub_10000610C(uint64_t a1)
{
  return sub_100006130(a1, qword_10001C8A0);
}

uint64_t sub_100006130(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100012CF0();
  sub_100009534(v3, a2);
  sub_1000094FC(v3, (uint64_t)a2);
  return sub_100012CD0();
}

uint64_t sub_100006190()
{
  sub_100012930();
  return v1;
}

void sub_1000061C4(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100006214()
{
  unint64_t result = qword_10001C288;
  if (!qword_10001C288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C288);
  }
  return result;
}

unint64_t sub_10000626C()
{
  unint64_t result = qword_10001C290;
  if (!qword_10001C290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C290);
  }
  return result;
}

uint64_t sub_1000062C0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100009400();
  unint64_t v5 = sub_1000094A8();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100006328()
{
  uint64_t v0 = qword_10001C110;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100006364()
{
  unint64_t result = qword_10001C298;
  if (!qword_10001C298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C298);
  }
  return result;
}

unint64_t sub_1000063BC()
{
  unint64_t result = qword_10001C2A0;
  if (!qword_10001C2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C2A0);
  }
  return result;
}

uint64_t sub_100006410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006428(a1, a2, a3, (void (*)(void))sub_100006214);
}

uint64_t sub_100006428(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000647C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000064B4(&qword_10001C108, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001C8A0, a1);
}

uint64_t sub_1000064B4@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_1000094FC(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100006558()
{
  return 0;
}

uint64_t sub_100006560()
{
  return 1;
}

uint64_t sub_10000656C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100009400();
  unint64_t v7 = sub_100009454();
  unint64_t v8 = sub_1000094A8();
  *unint64_t v5 = v2;
  v5[1] = sub_100006640;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100006640()
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

uint64_t sub_100006748@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000090D8();
  *a1 = result;
  return result;
}

uint64_t sub_100006770(uint64_t a1)
{
  unint64_t v2 = sub_100006214();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenAllowOthersToJoinDeepLink()
{
  return &type metadata for OpenAllowOthersToJoinDeepLink;
}

ValueMetadata *type metadata accessor for AllowOthersToJoinEntity.AllowOthersToJoinEntityQuery()
{
  return &type metadata for AllowOthersToJoinEntity.AllowOthersToJoinEntityQuery;
}

ValueMetadata *type metadata accessor for AllowOthersToJoinEntity()
{
  return &type metadata for AllowOthersToJoinEntity;
}

uint64_t destroy for AllowOthersToJoinEntity.UpdateIntent_value()
{
  swift_release();

  return swift_release();
}

void *_s38WirelessModemSettingsControlsExtension23AllowOthersToJoinEntityV18UpdateIntent_valueVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for AllowOthersToJoinEntity.UpdateIntent_value(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for AllowOthersToJoinEntity.UpdateIntent_value(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for AllowOthersToJoinEntity.UpdateIntent_value(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AllowOthersToJoinEntity.UpdateIntent_value(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AllowOthersToJoinEntity.UpdateIntent_value(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AllowOthersToJoinEntity.UpdateIntent_value()
{
  return &type metadata for AllowOthersToJoinEntity.UpdateIntent_value;
}

uint64_t sub_100006994()
{
  return sub_1000097A8(&qword_10001C2B0, &qword_10001C2B8);
}

uint64_t sub_1000069D0()
{
  return sub_1000097A8(&qword_10001C2C0, &qword_10001C2B8);
}

id sub_100006A0C(char a1)
{
  uint64_t v2 = sub_100012CE0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100012D30();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_100012E00();
  __chkstk_darwin(v7 - 8);
  if (!a1)
  {
    id result = (id)MobileGestalt_get_current_device();
    if (result) {
      goto LABEL_8;
    }
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (a1 == 1)
  {
    id result = (id)MobileGestalt_get_current_device();
    if (result) {
      goto LABEL_8;
    }
    __break(1u);
    goto LABEL_10;
  }
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
LABEL_8:
    uint64_t v9 = result;
    MobileGestalt_get_wapiCapability();

    sub_100012DF0();
    sub_100012D20();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
    return (id)sub_100012D10();
  }
LABEL_11:
  __break(1u);
  return result;
}

BOOL sub_100006CD0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100006CE4()
{
  Swift::UInt v1 = *v0;
  sub_100012F30();
  sub_100012F40(v1);
  return sub_100012F50();
}

void sub_100006D2C()
{
  sub_100012F40(*v0);
}

Swift::Int sub_100006D58()
{
  Swift::UInt v1 = *v0;
  sub_100012F30();
  sub_100012F40(v1);
  return sub_100012F50();
}

id sub_100006DAC()
{
  return sub_100006A0C(*v0);
}

BOOL sub_100006DB4(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *sub_100006DC8@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_100006DD8(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100006DE4()
{
  sub_1000093BC(&qword_10001C2E0);
  ((void (*)(void))__chkstk_darwin)();
  v28 = (char *)&v20 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_100012BC0();
  uint64_t v1 = *(void *)(v29 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000093BC(&qword_10001C2C8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v20 - v7;
  uint64_t v9 = sub_1000093BC(&qword_10001C2D0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = v11;
  uint64_t v12 = sub_100012CF0();
  uint64_t v27 = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v22 = sub_1000093BC(&qword_10001C2D8);
  sub_100012CD0();
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v26(v11, 1, 1, v12);
  uint64_t v31 = 0;
  uint64_t v14 = sub_1000128E0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  unsigned int v25 = enum case for InputConnectionBehavior.default(_:);
  v16 = *(void (**)(void))(v1 + 104);
  uint64_t v23 = v1 + 104;
  v24 = (void (*)(char *, void, uint64_t))v16;
  v16(v3);
  sub_1000054B4();
  v17 = v21;
  uint64_t v22 = sub_100012960();
  sub_1000093BC(&qword_10001C2E8);
  sub_100012CD0();
  v26(v17, 1, 1, v27);
  char v30 = 2;
  uint64_t v18 = sub_100012E30();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v28, 1, 1, v18);
  v15(v8, 1, 1, v14);
  v24(v3, v25, v29);
  sub_100012970();
  return v22;
}

uint64_t sub_100007224(char a1)
{
  *(unsigned char *)(v1 + 369) = a1;
  sub_1000093BC(&qword_10001C338);
  *(void *)(v1 + 216) = swift_task_alloc();
  uint64_t v2 = sub_100012E80();
  *(void *)(v1 + 224) = v2;
  *(void *)(v1 + 232) = *(void *)(v2 - 8);
  *(void *)(v1 + 240) = swift_task_alloc();
  return _swift_task_switch(sub_100007340, 0, 0);
}

uint64_t sub_100007340()
{
  int v1 = *(unsigned __int8 *)(v0 + 369);
  *(void *)(v0 + 248) = WiFiManagerClientCreate();
  if (v1 != 1) {
    goto LABEL_10;
  }
  NSString v2 = sub_100012E10();
  uint64_t v3 = _CTServerConnectionCreateWithIdentifier();

  if (!v3) {
    goto LABEL_17;
  }
  *(unsigned char *)(v0 + 368) = 1;
  _CTServerConnectionGetCellularDataIsEnabled();
  if (!*(unsigned char *)(v0 + 368)) {
    _CTServerConnectionSetCellularDataIsEnabled();
  }
  if (!WiFiManagerClientIsTetheringSupported())
  {
LABEL_17:
    sub_1000095E8();
    swift_allocError();
    unsigned char *v26 = 0;
    swift_willThrow();
LABEL_18:
    swift_task_dealloc();
    swift_task_dealloc();
    unsigned int v25 = *(uint64_t (**)(void))(v0 + 8);
LABEL_19:
    return v25();
  }
  uint64_t v4 = self;
  *(void *)(v0 + 256) = v4;
  id v5 = [v4 sharedInstance];
  if (!v5)
  {
    __break(1u);
    goto LABEL_32;
  }
  unint64_t v8 = v5;
  unsigned __int8 v9 = [v5 enabled];

  id v10 = [objc_allocWithZone((Class)CWFInterface) init];
  *(void *)(v0 + 264) = v10;
  unsigned __int8 v11 = [v10 powerOn];
  *(unsigned char *)(v0 + 370) = v11;
  if ((v9 & 1) == 0)
  {
    id v27 = [self defaultCenter];
    *(void *)(v0 + 272) = sub_100012E90();

    id v5 = [v4 sharedInstance];
    if (v5)
    {
      v28 = v5;
      [v5 setPowered:1];

      swift_retain();
      sub_100012E70();
      unint64_t v29 = sub_10000963C();
      char v30 = (void *)swift_task_alloc();
      *(void *)(v0 + 280) = v30;
      *char v30 = v0;
      v30[1] = sub_100007BF4;
      id v5 = *(id *)(v0 + 216);
      uint64_t v6 = *(void *)(v0 + 224);
      unint64_t v7 = v29;
      return dispatch thunk of AsyncIteratorProtocol.next()(v5, v6, v7);
    }
LABEL_32:
    __break(1u);
    return dispatch thunk of AsyncIteratorProtocol.next()(v5, v6, v7);
  }
  uint64_t v12 = *(void **)(v0 + 264);
  if (v11)
  {

LABEL_10:
    sub_1000093BC(&qword_10001C340);
    uint64_t v13 = swift_allocBox();
    uint64_t v15 = v14;
    *(void *)(v0 + 328) = v13;
    uint64_t v16 = sub_1000093BC(&qword_10001C348);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
    *(void *)(v0 + 128) = sub_1000095AC;
    *(void *)(v0 + 136) = v13;
    *(void *)(v0 + 96) = _NSConcreteStackBlock;
    *(void *)(v0 + 104) = 1107296256;
    *(void *)(v0 + 112) = sub_100004F5C;
    *(void *)(v0 + 120) = &unk_1000191A8;
    v17 = _Block_copy((const void *)(v0 + 96));
    swift_retain();
    swift_release();
    uint64_t v18 = _NETRBClientCreate();
    *(void *)(v0 + 336) = v18;
    _Block_release(v17);
    if (v18)
    {
      *(_DWORD *)(v0 + 364) = 1021;
      if (_NETRBClientGetGlobalServiceState())
      {
        if (*(_DWORD *)(v0 + 364) <= 0x3FDu)
        {
          uint64_t v19 = swift_task_alloc();
          *(void *)(v0 + 344) = v19;
          *(void *)(v19 + 16) = v15;
          *(void *)(v19 + 24) = v18;
          uint64_t v20 = (void *)swift_task_alloc();
          *(void *)(v0 + 352) = v20;
          type metadata accessor for response(0);
          *uint64_t v20 = v0;
          v20[1] = sub_100008A58;
          return withCheckedContinuation<A>(isolation:function:_:)(v0 + 360, 0, 0, 0xD000000000000017, 0x8000000100013BB0, sub_1000095CC, v19, v21);
        }
      }
    }
    char v22 = *(unsigned char *)(v0 + 369);
    _NETRBClientSetGlobalServiceState();
    sub_1000093BC(&qword_10001C350);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000133D0;
    strcpy((char *)(inited + 32), "SOFTAP_ENABLE");
    *(_WORD *)(inited + 46) = -4864;
    *(unsigned char *)(inited + 48) = v22;
    *(void *)(inited + 56) = 0xD000000000000018;
    *(void *)(inited + 64) = 0x80000001000150D0;
    *(unsigned char *)(inited + 72) = 1;
    sub_10000F228(inited);
    Class isa = sub_100012DE0().super.isa;
    swift_bridgeObjectRelease();
    WiFiManagerClientSetMISDiscoveryStateExt();

    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    unsigned int v25 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_19;
  }
  sub_1000093BC(&qword_10001C370);
  uint64_t v31 = swift_allocBox();
  uint64_t v33 = v32;
  *(void *)(v0 + 296) = v31;
  uint64_t v34 = sub_1000093BC(&qword_10001C378);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v33, 1, 1, v34);
  *(void *)(v0 + 176) = sub_100009694;
  *(void *)(v0 + 184) = v31;
  *(void *)(v0 + 144) = _NSConcreteStackBlock;
  *(void *)(v0 + 152) = 1107296256;
  *(void *)(v0 + 160) = sub_100004ADC;
  *(void *)(v0 + 168) = &unk_1000191D0;
  v35 = _Block_copy((const void *)(v0 + 144));
  swift_retain();
  swift_release();
  [v12 setEventHandler:v35];
  _Block_release(v35);
  *(void *)(v0 + 208) = 0;
  unsigned int v36 = [v12 startMonitoringEventType:1 error:v0 + 208];
  v37 = *(void **)(v0 + 208);
  if (!v36)
  {
    v43 = *(void **)(v0 + 264);
    id v44 = v37;
    sub_100012CC0();

    swift_willThrow();
    swift_release();
    goto LABEL_18;
  }
  uint64_t v38 = *(void *)(v0 + 264);
  uint64_t v39 = swift_task_alloc();
  *(void *)(v0 + 304) = v39;
  *(void *)(v39 + 16) = v33;
  *(void *)(v39 + 24) = v38;
  id v40 = v37;
  v41 = (void *)swift_task_alloc();
  *(void *)(v0 + 312) = v41;
  unint64_t v42 = sub_1000096A4();
  void *v41 = v0;
  v41[1] = sub_10000853C;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 192, 0, 0, 0xD000000000000017, 0x8000000100013BB0, sub_10000969C, v39, v42);
}

uint64_t sub_100007BF4()
{
  *(void *)(*(void *)v1 + 288) = v0;
  swift_task_dealloc();
  if (v0) {
    NSString v2 = sub_10000848C;
  }
  else {
    NSString v2 = sub_100007D34;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100007D34()
{
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v2 = sub_100012CB0();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 232) + 8))(*(void *)(v0 + 240), *(void *)(v0 + 224));
    swift_release();
    goto LABEL_6;
  }
  id v3 = [*(id *)(v0 + 256) sharedInstance];
  if (!v3)
  {
    __break(1u);
    goto LABEL_23;
  }
  unsigned __int8 v11 = v3;
  uint64_t v12 = *(void **)(v0 + 256);
  [v3 setDiscoverable:1];

  id v3 = [v12 sharedInstance];
  if (!v3)
  {
LABEL_23:
    __break(1u);
    return withCheckedContinuation<A>(isolation:function:_:)(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  uint64_t v13 = v3;
  uint64_t v15 = *(void *)(v0 + 232);
  uint64_t v14 = *(void *)(v0 + 240);
  uint64_t v17 = *(void *)(v0 + 216);
  uint64_t v16 = *(void *)(v0 + 224);
  [v3 setConnectable:1];

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  sub_1000096E4(v17);
LABEL_6:
  uint64_t v18 = *(void **)(v0 + 264);
  if (*(unsigned char *)(v0 + 370))
  {

    sub_1000093BC(&qword_10001C340);
    uint64_t v19 = swift_allocBox();
    uint64_t v21 = v20;
    *(void *)(v0 + 328) = v19;
    uint64_t v22 = sub_1000093BC(&qword_10001C348);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
    *(void *)(v0 + 128) = sub_1000095AC;
    *(void *)(v0 + 136) = v19;
    *(void *)(v0 + 96) = _NSConcreteStackBlock;
    *(void *)(v0 + 104) = 1107296256;
    *(void *)(v0 + 112) = sub_100004F5C;
    *(void *)(v0 + 120) = &unk_1000191A8;
    uint64_t v23 = _Block_copy((const void *)(v0 + 96));
    swift_retain();
    swift_release();
    uint64_t v24 = _NETRBClientCreate();
    *(void *)(v0 + 336) = v24;
    _Block_release(v23);
    if (v24)
    {
      *(_DWORD *)(v0 + 364) = 1021;
      if (_NETRBClientGetGlobalServiceState())
      {
        if (*(_DWORD *)(v0 + 364) <= 0x3FDu)
        {
          uint64_t v25 = swift_task_alloc();
          *(void *)(v0 + 344) = v25;
          *(void *)(v25 + 16) = v21;
          *(void *)(v25 + 24) = v24;
          v26 = (void *)swift_task_alloc();
          *(void *)(v0 + 352) = v26;
          type metadata accessor for response(0);
          void *v26 = v0;
          v26[1] = sub_100008A58;
          uint64_t v10 = v27;
          id v3 = (id)(v0 + 360);
          unint64_t v7 = 0x8000000100013BB0;
          unint64_t v8 = sub_1000095CC;
          uint64_t v4 = 0;
          uint64_t v5 = 0;
          unint64_t v6 = 0xD000000000000017;
          uint64_t v9 = v25;
          return withCheckedContinuation<A>(isolation:function:_:)(v3, v4, v5, v6, v7, v8, v9, v10);
        }
      }
    }
    char v40 = *(unsigned char *)(v0 + 369);
    _NETRBClientSetGlobalServiceState();
    sub_1000093BC(&qword_10001C350);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000133D0;
    strcpy((char *)(inited + 32), "SOFTAP_ENABLE");
    *(_WORD *)(inited + 46) = -4864;
    *(unsigned char *)(inited + 48) = v40;
    *(void *)(inited + 56) = 0xD000000000000018;
    *(void *)(inited + 64) = 0x80000001000150D0;
    *(unsigned char *)(inited + 72) = 1;
    sub_10000F228(inited);
    Class isa = sub_100012DE0().super.isa;
    swift_bridgeObjectRelease();
    WiFiManagerClientSetMISDiscoveryStateExt();

    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    v43 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_19;
  }
  sub_1000093BC(&qword_10001C370);
  uint64_t v28 = swift_allocBox();
  uint64_t v30 = v29;
  *(void *)(v0 + 296) = v28;
  uint64_t v31 = sub_1000093BC(&qword_10001C378);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v30, 1, 1, v31);
  *(void *)(v0 + 176) = sub_100009694;
  *(void *)(v0 + 184) = v28;
  *(void *)(v0 + 144) = _NSConcreteStackBlock;
  *(void *)(v0 + 152) = 1107296256;
  *(void *)(v0 + 160) = sub_100004ADC;
  *(void *)(v0 + 168) = &unk_1000191D0;
  uint64_t v32 = _Block_copy((const void *)(v0 + 144));
  swift_retain();
  swift_release();
  [v18 setEventHandler:v32];
  _Block_release(v32);
  *(void *)(v0 + 208) = 0;
  unsigned int v33 = [v18 startMonitoringEventType:1 error:v0 + 208];
  uint64_t v34 = *(void **)(v0 + 208);
  if (!v33)
  {
    id v44 = *(void **)(v0 + 264);
    id v45 = v34;
    sub_100012CC0();

    swift_willThrow();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    v43 = *(uint64_t (**)(void))(v0 + 8);
LABEL_19:
    return v43();
  }
  uint64_t v35 = *(void *)(v0 + 264);
  uint64_t v36 = swift_task_alloc();
  *(void *)(v0 + 304) = v36;
  *(void *)(v36 + 16) = v30;
  *(void *)(v36 + 24) = v35;
  id v37 = v34;
  uint64_t v38 = (void *)swift_task_alloc();
  *(void *)(v0 + 312) = v38;
  unint64_t v39 = sub_1000096A4();
  *uint64_t v38 = v0;
  v38[1] = sub_10000853C;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 192, 0, 0, 0xD000000000000017, 0x8000000100013BB0, sub_10000969C, v36, v39);
}

uint64_t sub_10000848C()
{
  *(void *)(v0 + 200) = *(void *)(v0 + 288);
  sub_1000093BC(&qword_10001C368);
  uint64_t v1 = swift_dynamicCast();
  return _swift_willThrowTypedImpl(v1, &type metadata for Never, &protocol witness table for Never);
}

uint64_t sub_10000853C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 320) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_100008D24;
  }
  else
  {

    swift_task_dealloc();
    uint64_t v3 = sub_100008698;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100008698()
{
  swift_release();
  sub_1000093BC(&qword_10001C340);
  uint64_t v1 = swift_allocBox();
  uint64_t v3 = v2;
  *(void *)(v0 + 328) = v1;
  uint64_t v4 = sub_1000093BC(&qword_10001C348);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(void *)(v0 + 128) = sub_1000095AC;
  *(void *)(v0 + 136) = v1;
  *(void *)(v0 + 96) = _NSConcreteStackBlock;
  *(void *)(v0 + 104) = 1107296256;
  *(void *)(v0 + 112) = sub_100004F5C;
  *(void *)(v0 + 120) = &unk_1000191A8;
  uint64_t v5 = _Block_copy((const void *)(v0 + 96));
  swift_retain();
  swift_release();
  uint64_t v6 = _NETRBClientCreate();
  *(void *)(v0 + 336) = v6;
  _Block_release(v5);
  if (v6
    && (*(_DWORD *)(v0 + 364) = 1021, _NETRBClientGetGlobalServiceState())
    && *(_DWORD *)(v0 + 364) <= 0x3FDu)
  {
    uint64_t v7 = swift_task_alloc();
    *(void *)(v0 + 344) = v7;
    *(void *)(v7 + 16) = v3;
    *(void *)(v7 + 24) = v6;
    unint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 352) = v8;
    type metadata accessor for response(0);
    *unint64_t v8 = v0;
    v8[1] = sub_100008A58;
    return withCheckedContinuation<A>(isolation:function:_:)(v0 + 360, 0, 0, 0xD000000000000017, 0x8000000100013BB0, sub_1000095CC, v7, v9);
  }
  else
  {
    char v10 = *(unsigned char *)(v0 + 369);
    _NETRBClientSetGlobalServiceState();
    sub_1000093BC(&qword_10001C350);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000133D0;
    strcpy((char *)(inited + 32), "SOFTAP_ENABLE");
    *(_WORD *)(inited + 46) = -4864;
    *(unsigned char *)(inited + 48) = v10;
    *(void *)(inited + 56) = 0xD000000000000018;
    *(void *)(inited + 64) = 0x80000001000150D0;
    *(unsigned char *)(inited + 72) = 1;
    sub_10000F228(inited);
    Class isa = sub_100012DE0().super.isa;
    swift_bridgeObjectRelease();
    WiFiManagerClientSetMISDiscoveryStateExt();

    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13();
  }
}

uint64_t sub_100008A58()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_100008B9C, 0, 0);
}

uint64_t sub_100008B9C()
{
  char v1 = *(unsigned char *)(v0 + 369);
  _NETRBClientSetGlobalServiceState();
  sub_1000093BC(&qword_10001C350);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000133D0;
  strcpy((char *)(inited + 32), "SOFTAP_ENABLE");
  *(_WORD *)(inited + 46) = -4864;
  *(unsigned char *)(inited + 48) = v1;
  *(void *)(inited + 56) = 0xD000000000000018;
  *(void *)(inited + 64) = 0x80000001000150D0;
  *(unsigned char *)(inited + 72) = 1;
  sub_10000F228(inited);
  Class isa = sub_100012DE0().super.isa;
  swift_bridgeObjectRelease();
  WiFiManagerClientSetMISDiscoveryStateExt();

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100008D24()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100008DE4()
{
  uint64_t v1 = sub_100012CE0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_100012D30();
  v0[5] = swift_task_alloc();
  sub_100012E00();
  v0[6] = swift_task_alloc();
  sub_100012CF0();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_100008F24, 0, 0);
}

uint64_t sub_100008F24()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_1000093BC(&qword_10001C180);
  sub_100012DF0();
  sub_100012D20();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_100012D10();
  sub_1000097A8(&qword_10001C320, &qword_10001C328);
  uint64_t v4 = sub_100012CA0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_1000090D8()
{
  v17[0] = sub_100012BC0();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  uint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000093BC(&qword_10001C2C8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_1000093BC(&qword_10001C2D0);
  __chkstk_darwin(v9 - 8);
  unsigned __int8 v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100012CF0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_1000093BC(&qword_10001C2D8);
  sub_100012CD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v17[1] = 0;
  uint64_t v14 = sub_1000128E0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_1000054B4();
  return sub_100012960();
}

uint64_t sub_1000093BC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100009400()
{
  unint64_t result = qword_10001C2F0;
  if (!qword_10001C2F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C2F0);
  }
  return result;
}

unint64_t sub_100009454()
{
  unint64_t result = qword_10001C2F8;
  if (!qword_10001C2F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C2F8);
  }
  return result;
}

unint64_t sub_1000094A8()
{
  unint64_t result = qword_10001C300;
  if (!qword_10001C300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C300);
  }
  return result;
}

uint64_t sub_1000094FC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100009534(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100009598(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_1000095AC(int a1)
{
  return sub_100004E0C(a1);
}

uint64_t sub_1000095B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000095C4()
{
  return swift_release();
}

xpc_object_t sub_1000095CC(uint64_t a1)
{
  return sub_100004FC8(a1, *(void *)(v1 + 16));
}

void type metadata accessor for response(uint64_t a1)
{
}

unint64_t sub_1000095E8()
{
  unint64_t result = qword_10001C358;
  if (!qword_10001C358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C358);
  }
  return result;
}

unint64_t sub_10000963C()
{
  unint64_t result = qword_10001C360;
  if (!qword_10001C360)
  {
    sub_100012E80();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C360);
  }
  return result;
}

uint64_t sub_100009694(void *a1)
{
  return sub_100004990(a1);
}

uint64_t sub_10000969C(uint64_t a1)
{
  return sub_100004B44(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

unint64_t sub_1000096A4()
{
  unint64_t result = qword_10001C380;
  if (!qword_10001C380)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_10001C380);
  }
  return result;
}

uint64_t sub_1000096E4(uint64_t a1)
{
  uint64_t v2 = sub_1000093BC(&qword_10001C338);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100009744(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000093BC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000097A8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000336C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000097EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000093BC(&qword_10001C3C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unsigned char *initializeBufferWithCopyOfBuffer for PersonalHotspotTetheringError(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PersonalHotspotTetheringError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PersonalHotspotTetheringError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x1000099C0);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_1000099E8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000099F0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PersonalHotspotTetheringError()
{
  return &type metadata for PersonalHotspotTetheringError;
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void sub_100009A1C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_100009A68()
{
  unint64_t result = qword_10001C3D8;
  if (!qword_10001C3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3D8);
  }
  return result;
}

uint64_t sub_100009ACC(uint64_t a1)
{
  uint64_t v45 = sub_100012990();
  uint64_t v52 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  id v44 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000093BC(&qword_10001C460);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v53 = v3;
  uint64_t v54 = v4;
  __chkstk_darwin(v3);
  unsigned int v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000093BC(&qword_10001C468);
  __chkstk_darwin(v7);
  unint64_t v8 = sub_1000032DC();
  sub_100012A50();
  v55._countAndFlagsBits = 0x206E727554;
  v55._object = (void *)0xE500000000000000;
  sub_100012A40(v55);
  swift_getKeyPath();
  unint64_t v9 = sub_10000BE38();
  sub_100012980();
  swift_release();
  sub_100012A30();
  swift_release();
  v56._countAndFlagsBits = 0xD000000000000016;
  v56._object = (void *)0x8000000100015340;
  sub_100012A40(v56);
  sub_100012A60();
  uint64_t v42 = sub_1000129B0();
  uint64_t v10 = v53;
  unsigned __int8 v11 = *(void (**)(char *, uint64_t))(v54 + 8);
  v54 += 8;
  v50 = v11;
  v11(v6, v53);
  sub_100012A50();
  v57._countAndFlagsBits = 0xD00000000000001CLL;
  v57._object = (void *)0x8000000100015360;
  sub_100012A40(v57);
  swift_getKeyPath();
  unint64_t v51 = v9;
  sub_100012980();
  swift_release();
  sub_100012A30();
  swift_release();
  v58._countAndFlagsBits = 46;
  v58._object = (void *)0xE100000000000000;
  sub_100012A40(v58);
  sub_100012A60();
  uint64_t v41 = sub_1000129B0();
  uint64_t v12 = v10;
  uint64_t v13 = v50;
  v50(v6, v12);
  sub_100012A50();
  v59._countAndFlagsBits = 0;
  v59._object = (void *)0xE000000000000000;
  sub_100012A40(v59);
  swift_getKeyPath();
  uint64_t v43 = a1;
  sub_100012980();
  swift_release();
  sub_100012A30();
  swift_release();
  v60._countAndFlagsBits = 0xD000000000000019;
  v60._object = (void *)0x8000000100015380;
  sub_100012A40(v60);
  unsigned int v46 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v14 = v52;
  uint64_t v15 = *(void (**)(void))(v52 + 104);
  uint64_t v48 = v52 + 104;
  v49 = (void (*)(char *, void, uint64_t))v15;
  uint64_t v16 = v44;
  uint64_t v17 = v45;
  v15(v44);
  sub_100012A20();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v14 + 8);
  uint64_t v52 = v14 + 8;
  uint64_t v47 = v18;
  v18(v16, v17);
  v61._countAndFlagsBits = 46;
  v61._object = (void *)0xE100000000000000;
  sub_100012A40(v61);
  sub_100012A60();
  uint64_t v40 = sub_1000129B0();
  v13(v6, v53);
  sub_100012A50();
  v62._countAndFlagsBits = 0x206E727554;
  v62._object = (void *)0xE500000000000000;
  sub_100012A40(v62);
  swift_getKeyPath();
  sub_100012980();
  swift_release();
  sub_100012A30();
  swift_release();
  v63._countAndFlagsBits = 0x746F7073746F6820;
  v63._object = (void *)0xE90000000000002ELL;
  sub_100012A40(v63);
  sub_100012A60();
  unint64_t v34 = v8;
  uint64_t v39 = sub_1000129B0();
  uint64_t v19 = v6;
  v13(v6, v53);
  sub_100012A50();
  v64._countAndFlagsBits = 0x206E727554;
  v64._object = (void *)0xE500000000000000;
  sub_100012A40(v64);
  swift_getKeyPath();
  sub_100012980();
  swift_release();
  sub_100012A30();
  swift_release();
  v65._countAndFlagsBits = 0x6972656874657420;
  v65._object = (void *)0xEB000000002E676ELL;
  sub_100012A40(v65);
  sub_100012A60();
  uint64_t v38 = sub_1000129B0();
  v13(v6, v53);
  sub_100012A50();
  v66._countAndFlagsBits = 0x70746F6820746553;
  v66._object = (void *)0xEF206F7420746F73;
  sub_100012A40(v66);
  swift_getKeyPath();
  sub_100012980();
  swift_release();
  sub_100012A30();
  swift_release();
  v67._countAndFlagsBits = 46;
  v67._object = (void *)0xE100000000000000;
  sub_100012A40(v67);
  sub_100012A60();
  uint64_t v37 = sub_1000129B0();
  uint64_t v20 = v53;
  v50(v19, v53);
  sub_100012A50();
  v68._object = (void *)0x80000001000153A0;
  v68._countAndFlagsBits = 0xD000000000000011;
  sub_100012A40(v68);
  swift_getKeyPath();
  sub_100012980();
  swift_release();
  sub_100012A30();
  swift_release();
  v69._countAndFlagsBits = 46;
  v69._object = (void *)0xE100000000000000;
  sub_100012A40(v69);
  sub_100012A60();
  uint64_t v36 = sub_1000129B0();
  uint64_t v21 = v19;
  uint64_t v22 = v19;
  uint64_t v23 = v50;
  v50(v21, v20);
  sub_100012A50();
  v70._countAndFlagsBits = 0;
  v70._object = (void *)0xE000000000000000;
  sub_100012A40(v70);
  swift_getKeyPath();
  sub_100012980();
  swift_release();
  sub_100012A30();
  swift_release();
  v71._countAndFlagsBits = 0x746F7073746F6820;
  v71._object = (void *)0xEC000000206E6920;
  sub_100012A40(v71);
  uint64_t v25 = v44;
  uint64_t v24 = v45;
  v49(v44, v46, v45);
  sub_100012A20();
  v47(v25, v24);
  v72._countAndFlagsBits = 46;
  v72._object = (void *)0xE100000000000000;
  sub_100012A40(v72);
  sub_100012A60();
  uint64_t v35 = sub_1000129B0();
  v23(v22, v53);
  sub_100012A50();
  v73._countAndFlagsBits = 0;
  v73._object = (void *)0xE000000000000000;
  sub_100012A40(v73);
  swift_getKeyPath();
  sub_100012980();
  swift_release();
  sub_100012A30();
  swift_release();
  v74._countAndFlagsBits = 0x6972656874657420;
  v74._object = (void *)0xEE00206E6920676ELL;
  sub_100012A40(v74);
  v49(v25, v46, v24);
  sub_100012A20();
  v47(v25, v24);
  v75._countAndFlagsBits = 46;
  v75._object = (void *)0xE100000000000000;
  sub_100012A40(v75);
  sub_100012A60();
  uint64_t v26 = sub_1000129B0();
  v23(v22, v53);
  sub_1000093BC(&qword_10001C470);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_100013DB0;
  uint64_t v28 = v41;
  *(void *)(v27 + 32) = v42;
  *(void *)(v27 + 40) = v28;
  uint64_t v29 = v39;
  *(void *)(v27 + 48) = v40;
  *(void *)(v27 + 56) = v29;
  uint64_t v30 = v37;
  *(void *)(v27 + 64) = v38;
  *(void *)(v27 + 72) = v30;
  uint64_t v31 = v35;
  *(void *)(v27 + 80) = v36;
  *(void *)(v27 + 88) = v31;
  *(void *)(v27 + 96) = v26;
  uint64_t v32 = sub_1000129A0();
  swift_bridgeObjectRelease();
  return v32;
}

uint64_t sub_10000A5E4(uint64_t a1)
{
  return sub_10000B728(a1, (uint64_t)&unk_100013EF8, (void (*)(void))sub_10000BE38, (void (*)(uint64_t))sub_1000032DC);
}

uint64_t sub_10000A630(uint64_t a1)
{
  uint64_t v24 = a1;
  uint64_t v1 = sub_100012990();
  uint64_t v20 = *(void *)(v1 - 8);
  uint64_t v21 = v1;
  __chkstk_darwin(v1);
  uint64_t v19 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000093BC(&qword_10001C448);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unsigned int v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000093BC(&qword_10001C450);
  __chkstk_darwin(v7);
  sub_10000BC74();
  sub_100012A50();
  v25._countAndFlagsBits = 0x206E727554;
  v25._object = (void *)0xE500000000000000;
  sub_100012A40(v25);
  swift_getKeyPath();
  unint64_t v23 = sub_10000BE38();
  sub_100012980();
  swift_release();
  sub_100012A30();
  swift_release();
  v26._object = (void *)0x80000001000152E0;
  v26._countAndFlagsBits = 0xD000000000000018;
  sub_100012A40(v26);
  sub_100012A60();
  uint64_t v18 = sub_1000129B0();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v4 + 8);
  v22(v6, v3);
  sub_100012A50();
  v27._countAndFlagsBits = 0xD00000000000001ELL;
  v27._object = (void *)0x8000000100015300;
  sub_100012A40(v27);
  swift_getKeyPath();
  sub_100012980();
  swift_release();
  sub_100012A30();
  swift_release();
  v28._countAndFlagsBits = 46;
  v28._object = (void *)0xE100000000000000;
  sub_100012A40(v28);
  sub_100012A60();
  uint64_t v17 = sub_1000129B0();
  uint64_t v8 = v3;
  v22(v6, v3);
  sub_100012A50();
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  sub_100012A40(v29);
  swift_getKeyPath();
  sub_100012980();
  swift_release();
  sub_100012A30();
  swift_release();
  v30._countAndFlagsBits = 0xD00000000000001BLL;
  v30._object = (void *)0x8000000100015320;
  sub_100012A40(v30);
  uint64_t v10 = v19;
  uint64_t v9 = v20;
  uint64_t v11 = v21;
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v19, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v21);
  sub_100012A20();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v10, v11);
  v31._countAndFlagsBits = 46;
  v31._object = (void *)0xE100000000000000;
  sub_100012A40(v31);
  sub_100012A60();
  uint64_t v12 = sub_1000129B0();
  v22(v6, v8);
  sub_1000093BC(&qword_10001C458);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100013DC0;
  uint64_t v14 = v17;
  *(void *)(v13 + 32) = v18;
  *(void *)(v13 + 40) = v14;
  *(void *)(v13 + 48) = v12;
  uint64_t v15 = sub_1000129A0();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_10000AB0C(uint64_t a1)
{
  return sub_10000B728(a1, (uint64_t)&unk_100013ED0, (void (*)(void))sub_10000BE38, (void (*)(uint64_t))sub_10000BC74);
}

uint64_t sub_10000AB54()
{
  uint64_t v0 = sub_1000129D0();
  uint64_t v1 = sub_1000129D0();
  uint64_t v2 = sub_1000129D0();
  uint64_t v3 = sub_1000129D0();
  sub_1000093BC(&qword_10001C408);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100013DD0;
  *(void *)(v4 + 32) = v0;
  *(void *)(v4 + 40) = v1;
  *(void *)(v4 + 48) = v2;
  *(void *)(v4 + 56) = v3;
  uint64_t v5 = sub_1000129C0();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10000AC1C(uint64_t a1)
{
  uint64_t v21 = a1;
  uint64_t v1 = sub_1000093BC(&qword_10001C428);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v23 = v1;
  uint64_t v24 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100012990();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000093BC(&qword_10001C430);
  __chkstk_darwin(v9);
  sub_100006214();
  sub_100012A50();
  v25._countAndFlagsBits = 0x206E65704FLL;
  v25._object = (void *)0xE500000000000000;
  sub_100012A40(v25);
  swift_getKeyPath();
  unint64_t v20 = sub_1000057CC();
  sub_100012980();
  swift_release();
  sub_100012A30();
  swift_release();
  v26._countAndFlagsBits = 544106784;
  v26._object = (void *)0xE400000000000000;
  sub_100012A40(v26);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v5);
  sub_100012A20();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v27._countAndFlagsBits = 0x6E69747465532029;
  v27._object = (void *)0xEA00000000007367;
  sub_100012A40(v27);
  sub_100012A60();
  uint64_t v22 = sub_1000129B0();
  uint64_t v10 = v23;
  uint64_t v18 = *(void (**)(char *, uint64_t))(v24 + 8);
  v24 += 8;
  v18(v4, v23);
  sub_100012A50();
  v28._countAndFlagsBits = 0x206E65704FLL;
  v28._object = (void *)0xE500000000000000;
  sub_100012A40(v28);
  swift_getKeyPath();
  sub_100012980();
  swift_release();
  sub_100012A30();
  swift_release();
  v29._countAndFlagsBits = 0x676E697474657320;
  v29._object = (void *)0xE800000000000000;
  sub_100012A40(v29);
  sub_100012A60();
  uint64_t v19 = sub_1000129B0();
  uint64_t v11 = v18;
  v18(v4, v10);
  sub_100012A50();
  v30._countAndFlagsBits = 0x20656D20656B6154;
  v30._object = (void *)0xEB00000000206F74;
  sub_100012A40(v30);
  swift_getKeyPath();
  sub_100012980();
  swift_release();
  sub_100012A30();
  swift_release();
  v31._countAndFlagsBits = 0x676E697474657320;
  v31._object = (void *)0xE800000000000000;
  sub_100012A40(v31);
  sub_100012A60();
  uint64_t v12 = sub_1000129B0();
  v11(v4, v23);
  sub_1000093BC(&qword_10001C438);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100013DC0;
  uint64_t v14 = v19;
  *(void *)(v13 + 32) = v22;
  *(void *)(v13 + 40) = v14;
  *(void *)(v13 + 48) = v12;
  uint64_t v15 = sub_1000129A0();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_10000B114(uint64_t a1)
{
  return sub_10000B728(a1, (uint64_t)&unk_100013EA8, (void (*)(void))sub_1000057CC, (void (*)(uint64_t))sub_100006214);
}

uint64_t sub_10000B15C()
{
  return sub_10000B8BC();
}

uint64_t sub_10000B178(uint64_t a1)
{
  uint64_t v21 = a1;
  uint64_t v1 = sub_1000093BC(&qword_10001C410);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v23 = v1;
  uint64_t v24 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100012990();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000093BC(&qword_10001C418);
  __chkstk_darwin(v9);
  sub_10000BCC8();
  sub_100012A50();
  v25._countAndFlagsBits = 0x206E65704FLL;
  v25._object = (void *)0xE500000000000000;
  sub_100012A40(v25);
  swift_getKeyPath();
  unint64_t v20 = sub_10000BD64();
  sub_100012980();
  swift_release();
  sub_100012A30();
  swift_release();
  v26._countAndFlagsBits = 544106784;
  v26._object = (void *)0xE400000000000000;
  sub_100012A40(v26);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v5);
  sub_100012A20();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v27._countAndFlagsBits = 0x6E69747465532029;
  v27._object = (void *)0xEA00000000007367;
  sub_100012A40(v27);
  sub_100012A60();
  uint64_t v22 = sub_1000129B0();
  uint64_t v10 = v23;
  uint64_t v18 = *(void (**)(char *, uint64_t))(v24 + 8);
  v24 += 8;
  v18(v4, v23);
  sub_100012A50();
  v28._countAndFlagsBits = 0x206E65704FLL;
  v28._object = (void *)0xE500000000000000;
  sub_100012A40(v28);
  swift_getKeyPath();
  sub_100012980();
  swift_release();
  sub_100012A30();
  swift_release();
  v29._countAndFlagsBits = 0x676E697474657320;
  v29._object = (void *)0xE800000000000000;
  sub_100012A40(v29);
  sub_100012A60();
  uint64_t v19 = sub_1000129B0();
  uint64_t v11 = v18;
  v18(v4, v10);
  sub_100012A50();
  v30._countAndFlagsBits = 0x20656D20656B6154;
  v30._object = (void *)0xEB00000000206F74;
  sub_100012A40(v30);
  swift_getKeyPath();
  sub_100012980();
  swift_release();
  sub_100012A30();
  swift_release();
  v31._countAndFlagsBits = 0x676E697474657320;
  v31._object = (void *)0xE800000000000000;
  sub_100012A40(v31);
  sub_100012A60();
  uint64_t v12 = sub_1000129B0();
  v11(v4, v23);
  sub_1000093BC(&qword_10001C420);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100013DC0;
  uint64_t v14 = v19;
  *(void *)(v13 + 32) = v22;
  *(void *)(v13 + 40) = v14;
  *(void *)(v13 + 48) = v12;
  uint64_t v15 = sub_1000129A0();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_10000B670()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000B6E0(uint64_t a1)
{
  return sub_10000B728(a1, (uint64_t)&unk_100013E80, (void (*)(void))sub_10000BD64, (void (*)(uint64_t))sub_10000BCC8);
}

uint64_t sub_10000B728(uint64_t a1, uint64_t a2, void (*a3)(void), void (*a4)(uint64_t))
{
  uint64_t v6 = sub_100012A10();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  a3();
  sub_100012980();
  uint64_t v10 = swift_release();
  a4(v10);
  sub_100012A00();
  uint64_t v11 = sub_1000129F0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_1000093BC(&qword_10001C400);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100013DE0;
  *(void *)(v12 + 32) = v11;
  uint64_t v13 = sub_1000129E0();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_10000B8A0()
{
  return sub_10000B8BC();
}

uint64_t sub_10000B8BC()
{
  uint64_t v0 = sub_1000129D0();
  sub_1000093BC(&qword_10001C408);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100013DE0;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_1000129C0();
  swift_bridgeObjectRelease();
  return v2;
}

void sub_10000B920()
{
  qword_10001C8B8 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_10000B93C()
{
  if (qword_10001C120 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for AssistantIntentsProvider()
{
  return &type metadata for AssistantIntentsProvider;
}

uint64_t sub_10000B9A8()
{
  uint64_t v0 = sub_100012A90();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100006DE4();
  uint64_t v15 = v4;
  sub_1000032DC();
  sub_100012AA0();
  uint64_t v5 = sub_100012A80();
  uint64_t v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  uint64_t v14 = sub_10000E6CC();
  uint64_t v15 = v7;
  sub_10000BC74();
  sub_100012AA0();
  uint64_t v8 = sub_100012A80();
  v6(v3, v0);
  uint64_t v14 = sub_1000090D8();
  sub_100006214();
  sub_100012AA0();
  uint64_t v9 = sub_100012A80();
  v6(v3, v0);
  uint64_t v14 = sub_10000EB24();
  sub_10000BCC8();
  sub_100012AA0();
  uint64_t v10 = sub_100012A80();
  v6(v3, v0);
  sub_1000093BC(&qword_10001C3F0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_100013DD0;
  *(void *)(v11 + 32) = v5;
  *(void *)(v11 + 40) = v8;
  *(void *)(v11 + 48) = v9;
  *(void *)(v11 + 56) = v10;
  uint64_t v12 = sub_100012A70();
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t sub_10000BC74()
{
  unint64_t result = qword_10001C3E0;
  if (!qword_10001C3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3E0);
  }
  return result;
}

unint64_t sub_10000BCC8()
{
  unint64_t result = qword_10001C3E8;
  if (!qword_10001C3E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3E8);
  }
  return result;
}

__n128 sub_10000BD1C@<Q0>(uint64_t a1@<X8>)
{
  sub_100012930();
  __n128 result = v4;
  *(void *)a1 = v3;
  *(__n128 *)(a1 + 8) = v4;
  return result;
}

unint64_t sub_10000BD64()
{
  unint64_t result = qword_10001C3F8;
  if (!qword_10001C3F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3F8);
  }
  return result;
}

uint64_t sub_10000BDB8@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100012930();
  *a1 = v3;
  return result;
}

uint64_t sub_10000BDF4()
{
  return sub_100012940();
}

unint64_t sub_10000BE38()
{
  unint64_t result = qword_10001C440;
  if (!qword_10001C440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C440);
  }
  return result;
}

uint64_t sub_10000BE90@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100012930();
  *a1 = v3;
  return result;
}

uint64_t sub_10000BED0()
{
  return sub_100012940();
}

uint64_t sub_10000BF0C()
{
  return sub_1000097A8(&qword_10001C488, &qword_10001C490);
}

uint64_t sub_10000BF48()
{
  sub_100012930();
  return v1;
}

uint64_t sub_10000BF80()
{
  uint64_t v0 = sub_1000093BC(&qword_10001C2D0);
  __chkstk_darwin(v0 - 8);
  uint64_t v13 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100012CE0();
  uint64_t v2 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  __n128 v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100012D30();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_100012E00();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_100012CF0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = sub_100012C70();
  sub_100009534(v9, qword_10001C8C0);
  sub_1000094FC(v9, (uint64_t)qword_10001C8C0);
  sub_100012DF0();
  sub_100012D20();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.main(_:), v12);
  sub_100012D00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v13, 1, 1, v7);
  return sub_100012C60();
}

uint64_t sub_10000C290(uint64_t a1)
{
  return sub_100006130(a1, qword_10001C8D8);
}

uint64_t sub_10000C2B4()
{
  uint64_t v0 = sub_1000093BC(&qword_10001C3C0);
  sub_100009534(v0, qword_10001C8F0);
  uint64_t v1 = sub_1000094FC(v0, (uint64_t)qword_10001C8F0);
  sub_100012AB0();
  uint64_t v2 = sub_100012AC0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10000C36C()
{
  uint64_t result = swift_getKeyPath();
  qword_10001C908 = result;
  return result;
}

uint64_t sub_10000C394()
{
  return swift_retain();
}

uint64_t sub_10000C39C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 16);
  return swift_retain();
}

uint64_t sub_10000C3A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[21] = a2;
  v3[22] = a3;
  v3[20] = a1;
  sub_1000093BC(&qword_10001C390);
  v3[23] = swift_task_alloc();
  sub_1000093BC(&qword_10001C398);
  v3[24] = swift_task_alloc();
  sub_1000093BC(&qword_10001C610);
  v3[25] = swift_task_alloc();
  uint64_t v4 = sub_1000128E0();
  v3[26] = v4;
  v3[27] = *(void *)(v4 - 8);
  v3[28] = swift_task_alloc();
  uint64_t v5 = sub_1000093BC(&qword_10001C618);
  v3[29] = v5;
  v3[30] = *(void *)(v5 - 8);
  v3[31] = swift_task_alloc();
  v3[32] = swift_task_alloc();
  return _swift_task_switch(sub_10000C56C, 0, 0);
}

uint64_t sub_10000C56C()
{
  sub_100012930();
  long long v1 = *(_OWORD *)(v0 + 24);
  *(void *)(v0 + 40) = *(void *)(v0 + 16);
  *(_OWORD *)(v0 + 48) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v2;
  unint64_t v3 = sub_10000D7EC();
  *uint64_t v2 = v0;
  v2[1] = sub_10000C650;
  uint64_t v4 = *(void *)(v0 + 256);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v4, v0 + 40, sub_10000CD58, 0, &type metadata for MaximizeCompatibilityEntity, v3);
}

uint64_t sub_10000C650()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10000C74C, 0, 0);
}

uint64_t sub_10000C74C()
{
  sub_100012930();
  *(void *)(v0 + 88) = *(void *)(v0 + 64);
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 80);
  *(void *)(v0 + 272) = v1;
  *(void *)(v0 + 280) = v2;
  *(void *)(v0 + 96) = v1;
  *(void *)(v0 + 104) = v2;
  sub_100012930();
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 313);
  if (qword_10001C140 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_10001C908;
  *(void *)(v0 + 288) = qword_10001C908;
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v4;
  uint64_t v5 = sub_1000097A8(&qword_10001C5F8, &qword_10001C600);
  void *v4 = v0;
  v4[1] = sub_10000C8AC;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 312, v3, &type metadata for Bool, v5);
}

uint64_t sub_10000C8AC()
{
  *(void *)(*(void *)v1 + 304) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_10000CC94;
  }
  else {
    uint64_t v2 = sub_10000CA1C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000CA1C()
{
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v10 = *(void *)(v0 + 248);
  uint64_t v11 = *(void *)(v0 + 256);
  uint64_t v2 = *(void *)(v0 + 232);
  uint64_t v13 = *(void *)(v0 + 216);
  uint64_t v14 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v4 = *(void *)(v0 + 192);
  uint64_t v12 = *(void *)(v0 + 224);
  sub_100012930();
  long long v5 = *(_OWORD *)(v0 + 144);
  *(void *)(v0 + 112) = *(void *)(v0 + 136);
  *(_OWORD *)(v0 + 120) = v5;
  uint64_t v6 = sub_100012C50();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  uint64_t v7 = sub_100012C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v3, 1, 1, v7);
  sub_10000BC74();
  sub_10000BD64();
  sub_1000128B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v10, v11, v2);
  sub_1000128D0();
  sub_1000128F0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v11, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_10000CC94()
{
  (*(void (**)(void, void))(v0[30] + 8))(v0[32], v0[29]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10000CD5C()
{
  uint64_t v0 = sub_1000093BC(&qword_10001C620);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001C140 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100012B10();
  swift_release();
  sub_10000BD64();
  sub_1000097A8(&qword_10001C628, &qword_10001C620);
  sub_100012B00();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

__n128 sub_10000CEC4@<Q0>(uint64_t a1@<X8>)
{
  sub_100012930();
  __n128 result = v4;
  *(void *)a1 = v3;
  *(__n128 *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_10000CF08()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000CF70()
{
  if (qword_10001C140 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10000CFD0()
{
  unint64_t result = qword_10001C498;
  if (!qword_10001C498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C498);
  }
  return result;
}

unint64_t sub_10000D028()
{
  unint64_t result = qword_10001C4A0;
  if (!qword_10001C4A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4A0);
  }
  return result;
}

uint64_t sub_10000D07C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10000D0B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000E284(a1, a2, a3, (void (*)(void))sub_10000BC74);
}

uint64_t sub_10000D0C8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000064B4(&qword_10001C130, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001C8D8, a1);
}

uint64_t sub_10000D100@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001C138 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000093BC(&qword_10001C3C0);
  uint64_t v3 = sub_1000094FC(v2, (uint64_t)qword_10001C8F0);

  return sub_1000097EC(v3, a1);
}

uint64_t sub_10000D17C(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100009AC8;
  return sub_10000C3A8(a1, v5, v4);
}

uint64_t sub_10000D228@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000E6CC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10000D250()
{
  return 0xD00000000000002CLL;
}

unint64_t sub_10000D270()
{
  unint64_t result = qword_10001C4B0;
  if (!qword_10001C4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4B0);
  }
  return result;
}

unint64_t sub_10000D2C8()
{
  unint64_t result = qword_10001C4B8;
  if (!qword_10001C4B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4B8);
  }
  return result;
}

uint64_t sub_10000D31C(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_10000D33C, 0, 0);
}

uint64_t sub_10000D33C()
{
  uint64_t result = WiFiManagerClientCreate();
  if (!kWiFiPHBandPreferenceKey)
  {
    __break(1u);
    goto LABEL_7;
  }
  type metadata accessor for CFString(0);
  swift_dynamicCastUnknownClassUnconditional();
  uint64_t result = WiFiManagerClientCopyProperty();
  if (!result)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v2 = *(BOOL **)(v0 + 24);
  *(void *)(v0 + 16) = result;
  swift_dynamicCast();
  *uint64_t v2 = *(_DWORD *)(v0 + 32) == 1;
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10000D430()
{
  return sub_10000F210(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10000D468(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10001C5E0 + dword_10001C5E0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10000D50C;
  return v4();
}

uint64_t sub_10000D50C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *v4;
  uint64_t v9 = *v4;
  swift_task_dealloc();
  if (!v3)
  {
    uint64_t v10 = *(void **)(v8 + 16);
    *uint64_t v10 = a1;
    v10[1] = a2;
    v10[2] = a3;
  }
  uint64_t v11 = *(uint64_t (**)(void))(v9 + 8);
  return v11();
}

unint64_t sub_10000D634()
{
  unint64_t result = qword_10001C4C8;
  if (!qword_10001C4C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4C8);
  }
  return result;
}

uint64_t sub_10000D688(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000DB30();
  void *v4 = v2;
  v4[1] = sub_1000052EC;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10000D73C()
{
  unint64_t result = qword_10001C4D8;
  if (!qword_10001C4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4D8);
  }
  return result;
}

unint64_t sub_10000D794()
{
  unint64_t result = qword_10001C4E0;
  if (!qword_10001C4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4E0);
  }
  return result;
}

unint64_t sub_10000D7EC()
{
  unint64_t result = qword_10001C4E8[0];
  if (!qword_10001C4E8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10001C4E8);
  }
  return result;
}

uint64_t sub_10000D840(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000DB30();
  *unint64_t v5 = v2;
  v5[1] = sub_1000055C0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10000D8F4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000DB30();
  void *v4 = v2;
  v4[1] = sub_100009ABC;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10000D9A8()
{
  unint64_t result = qword_10001C500;
  if (!qword_10001C500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C500);
  }
  return result;
}

unint64_t sub_10000DA04()
{
  unint64_t result = qword_10001C508;
  if (!qword_10001C508)
  {
    sub_10000336C(qword_10001C510);
    sub_10000BD64();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C508);
  }
  return result;
}

uint64_t sub_10000DA78(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000D634();
  *unint64_t v5 = v2;
  v5[1] = sub_10000594C;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_10000DB30()
{
  unint64_t result = qword_10001C528;
  if (!qword_10001C528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C528);
  }
  return result;
}

unint64_t sub_10000DB88()
{
  unint64_t result = qword_10001C530;
  if (!qword_10001C530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C530);
  }
  return result;
}

uint64_t sub_10000DBDC(uint64_t a1)
{
  unint64_t v2 = sub_10000D7EC();

  return _EntityURLRepresentation.init(stringLiteral:)(0xD00000000000004FLL, 0x8000000100015450, a1, v2);
}

unint64_t sub_10000DC3C()
{
  unint64_t result = qword_10001C538;
  if (!qword_10001C538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C538);
  }
  return result;
}

unint64_t sub_10000DC94()
{
  unint64_t result = qword_10001C540;
  if (!qword_10001C540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C540);
  }
  return result;
}

unint64_t sub_10000DCEC()
{
  unint64_t result = qword_10001C548;
  if (!qword_10001C548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C548);
  }
  return result;
}

uint64_t sub_10000DD44()
{
  sub_10000EEB4();
  uint64_t v2 = sub_100012BD0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100009598(v3, v0, v2, v1);
}

unint64_t sub_10000DDDC()
{
  unint64_t result = qword_10001C558;
  if (!qword_10001C558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C558);
  }
  return result;
}

unint64_t sub_10000DE34()
{
  unint64_t result = qword_10001C560;
  if (!qword_10001C560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C560);
  }
  return result;
}

unint64_t sub_10000DE8C()
{
  unint64_t result = qword_10001C568;
  if (!qword_10001C568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C568);
  }
  return result;
}

uint64_t sub_10000DEE0@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000DEEC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000064B4(&qword_10001C128, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10001C8C0, a1);
}

uint64_t sub_10000DF24()
{
  return sub_1000097A8(&qword_10001C570, &qword_10001C578);
}

uint64_t sub_10000DF60(uint64_t a1)
{
  unint64_t v2 = sub_10000D7EC();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000DFB0()
{
  unint64_t result = qword_10001C580;
  if (!qword_10001C580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C580);
  }
  return result;
}

uint64_t sub_10000E004(uint64_t a1)
{
  unint64_t v2 = sub_10000D2C8();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_10000E050(uint64_t a1)
{
  unint64_t v2 = sub_10000DE8C();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000E0A0()
{
  unint64_t result = qword_10001C588;
  if (!qword_10001C588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C588);
  }
  return result;
}

uint64_t sub_10000E0F4(uint64_t a1)
{
  return sub_100006130(a1, qword_10001C910);
}

uint64_t sub_10000E11C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10000EE0C();
  unint64_t v5 = sub_10000EEB4();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_10000E184()
{
  uint64_t v0 = qword_10001C478;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10000E1C0()
{
  unint64_t result = qword_10001C590;
  if (!qword_10001C590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C590);
  }
  return result;
}

unint64_t sub_10000E218()
{
  unint64_t result = qword_10001C598;
  if (!qword_10001C598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C598);
  }
  return result;
}

uint64_t sub_10000E26C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000E284(a1, a2, a3, (void (*)(void))sub_10000BCC8);
}

uint64_t sub_10000E284(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000E2D8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000064B4(&qword_10001C148, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001C910, a1);
}

uint64_t sub_10000E310(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000EE0C();
  unint64_t v7 = sub_10000EE60();
  unint64_t v8 = sub_10000EEB4();
  *unint64_t v5 = v2;
  v5[1] = sub_100006640;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_10000E3E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000EB24();
  *a1 = result;
  return result;
}

uint64_t sub_10000E40C(uint64_t a1)
{
  unint64_t v2 = sub_10000BCC8();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenMaximizeCompatibilityDeepLink()
{
  return &type metadata for OpenMaximizeCompatibilityDeepLink;
}

ValueMetadata *type metadata accessor for MaximizeCompatibilityEntity.MaximizeCompatibilityEntityQuery()
{
  return &type metadata for MaximizeCompatibilityEntity.MaximizeCompatibilityEntityQuery;
}

uint64_t destroy for MaximizeCompatibilityEntity()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

void *_s38WirelessModemSettingsControlsExtension27MaximizeCompatibilityEntityVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for MaximizeCompatibilityEntity(void *a1, void *a2)
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

__n128 initializeWithTake for MaximizeCompatibilityEntity(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for MaximizeCompatibilityEntity(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MaximizeCompatibilityEntity(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MaximizeCompatibilityEntity(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MaximizeCompatibilityEntity()
{
  return &type metadata for MaximizeCompatibilityEntity;
}

ValueMetadata *type metadata accessor for MaximizeCompatibilityEntity.UpdateIntent_value()
{
  return &type metadata for MaximizeCompatibilityEntity.UpdateIntent_value;
}

uint64_t sub_10000E654()
{
  return sub_1000097A8(&qword_10001C5A8, &qword_10001C5B0);
}

uint64_t sub_10000E690()
{
  return sub_1000097A8(&qword_10001C5B8, &qword_10001C5B0);
}

uint64_t sub_10000E6CC()
{
  uint64_t v0 = sub_1000093BC(&qword_10001C2E0);
  __chkstk_darwin(v0 - 8);
  Swift::String v31 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_100012BC0();
  uint64_t v2 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  unint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000093BC(&qword_10001C2C8);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  unint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_1000093BC(&qword_10001C2D0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_100012CF0();
  uint64_t v30 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v25 = sub_1000093BC(&qword_10001C5C0);
  sub_100012CD0();
  Swift::String v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v29(v13, 1, 1, v14);
  uint64_t v16 = sub_1000128E0();
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  uint64_t v33 = 0;
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v24 = v10;
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v28 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v26 = v2 + 104;
  Swift::String v27 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_10000D7EC();
  uint64_t v19 = v23;
  uint64_t v25 = sub_100012960();
  sub_1000093BC(&qword_10001C2E8);
  sub_100012CD0();
  v29(v19, 1, 1, v30);
  LOBYTE(v33) = 2;
  uint64_t v20 = sub_100012E30();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v31, 1, 1, v20);
  v17(v24, 1, 1, v16);
  v27(v4, v28, v32);
  sub_100012970();
  return v25;
}

uint64_t sub_10000EB24()
{
  v17[0] = sub_100012BC0();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  uint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000093BC(&qword_10001C2C8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_1000093BC(&qword_10001C2D0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100012CF0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_1000093BC(&qword_10001C5C0);
  sub_100012CD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  uint64_t v14 = sub_1000128E0();
  memset(&v17[1], 0, 24);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_10000D7EC();
  return sub_100012960();
}

unint64_t sub_10000EE0C()
{
  unint64_t result = qword_10001C5C8;
  if (!qword_10001C5C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C5C8);
  }
  return result;
}

unint64_t sub_10000EE60()
{
  unint64_t result = qword_10001C5D0;
  if (!qword_10001C5D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C5D0);
  }
  return result;
}

unint64_t sub_10000EEB4()
{
  unint64_t result = qword_10001C5D8;
  if (!qword_10001C5D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C5D8);
  }
  return result;
}

uint64_t sub_10000EF08()
{
  uint64_t v1 = sub_100012CE0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_100012D30();
  v0[5] = swift_task_alloc();
  sub_100012E00();
  v0[6] = swift_task_alloc();
  sub_100012CF0();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_10000F048, 0, 0);
}

uint64_t sub_10000F048()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_1000093BC(&qword_10001C490);
  sub_100012DF0();
  sub_100012D20();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_100012D10();
  sub_1000097A8(&qword_10001C5F8, &qword_10001C600);
  uint64_t v4 = sub_100012CA0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))v0[1];
  return v5(0xD00000000000001BLL, 0x8000000100014720, v4);
}

uint64_t sub_10000F210(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000F21C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 16);
  return swift_retain();
}

unint64_t sub_10000F228(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000093BC(&qword_10001C758);
  uint64_t v2 = (void *)sub_100012EA0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_100011060(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
    v2[2] = v13;
    if (!--v3)
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

unint64_t sub_10000F33C(uint64_t a1)
{
  uint64_t v2 = sub_1000093BC(&qword_10001C740);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    char v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000093BC(&qword_10001C748);
  uint64_t v6 = sub_100012EA0();
  char v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  char v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100011780(v12, (uint64_t)v5, &qword_10001C740);
    char v14 = *v5;
    unint64_t result = sub_1000110D8(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_1000093BC(&qword_10001C750);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
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

unint64_t sub_10000F53C(uint64_t a1)
{
  uint64_t v2 = sub_1000093BC(&qword_10001C718);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    char v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000093BC(&qword_10001C728);
  uint64_t v6 = sub_100012EA0();
  char v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  char v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100011780(v12, (uint64_t)v5, &qword_10001C718);
    char v14 = *v5;
    unint64_t result = sub_1000110D8(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100012B50();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
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

uint64_t sub_10000F734()
{
  uint64_t v0 = sub_1000093BC(&qword_10001C2D0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100012CF0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_100012C70();
  sub_100009534(v5, qword_10001C928);
  sub_1000094FC(v5, (uint64_t)qword_10001C928);
  sub_100012CD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_100012C60();
}

uint64_t sub_10000F8A0()
{
  uint64_t v0 = sub_1000093BC(&qword_10001C730);
  sub_100009534(v0, qword_10001C940);
  sub_1000094FC(v0, (uint64_t)qword_10001C940);
  sub_1000093BC(&qword_10001C738);
  uint64_t v1 = *(void *)(sub_1000093BC(&qword_10001C740) - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000133D0;
  *(unsigned char *)(v4 + v3) = 0;
  sub_1000101C4();
  sub_100012BA0();
  *(unsigned char *)(v4 + v3 + v2) = 1;
  sub_100012BA0();
  sub_10000F33C(v4);
  return sub_100012BB0();
}

unint64_t sub_10000FA34()
{
  uint64_t v0 = sub_1000093BC(&qword_10001C708);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000093BC(&qword_10001C2D0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100012CF0();
  uint64_t v33 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  uint64_t v26 = (char *)&v22 - v9;
  sub_1000093BC(&qword_10001C710);
  uint64_t v10 = (int *)(sub_1000093BC(&qword_10001C718) - 8);
  uint64_t v11 = *(void *)v10;
  uint64_t v35 = *(void *)(*(void *)v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v13 = swift_allocObject();
  uint64_t v36 = v13;
  *(_OWORD *)(v13 + 16) = xmmword_1000133D0;
  unint64_t v14 = v13 + v12;
  unint64_t v29 = v13 + v12 + v10[14];
  *(unsigned char *)(v13 + v12) = 0;
  unint64_t v34 = 0x80000001000155F0;
  sub_100012CD0();
  uint64_t v15 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
  v7 += 56;
  uint64_t v32 = v15;
  v15(v5, 1, 1, v6);
  unint64_t v30 = 0x8000000100015610;
  unint64_t v31 = 0xD000000000000027;
  sub_100012B20();
  uint64_t v16 = sub_100012B30();
  uint64_t v17 = *(void *)(v16 - 8);
  Swift::String v27 = *(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56);
  uint64_t v28 = v17 + 56;
  v27(v2, 0, 1, v16);
  uint64_t v18 = sub_1000093BC(&qword_10001C720);
  uint64_t v19 = *(unsigned __int8 *)(v7 + 24);
  uint64_t v24 = ((v19 + 32) & ~v19) + *(void *)(v7 + 16);
  uint64_t v25 = v18;
  uint64_t v23 = v19 | 7;
  uint64_t v20 = swift_allocObject();
  long long v22 = xmmword_100013DE0;
  *(_OWORD *)(v20 + 16) = xmmword_100013DE0;
  sub_100012CD0();
  sub_100012CD0();
  sub_100012B40();
  *(unsigned char *)(v14 + v35) = 1;
  sub_100012CD0();
  sub_100012CD0();
  v32(v5, 0, 1, v33);
  sub_100012B20();
  v27(v2, 0, 1, v16);
  *(_OWORD *)(swift_allocObject() + 16) = v22;
  sub_100012CD0();
  sub_100012CD0();
  sub_100012B40();
  unint64_t result = sub_10000F53C(v36);
  qword_10001C958 = result;
  return result;
}

uint64_t sub_10000FEC8(char *a1, char *a2)
{
  return sub_10000FF2C(*a1, *a2);
}

unint64_t sub_10000FED8()
{
  unint64_t result = qword_10001C640;
  if (!qword_10001C640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C640);
  }
  return result;
}

uint64_t sub_10000FF2C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x64726F7773736170;
  }
  else {
    uint64_t v3 = 1953460082;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE800000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x64726F7773736170;
  }
  else {
    uint64_t v5 = 1953460082;
  }
  if (a2) {
    unint64_t v6 = 0xE800000000000000;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_100012ED0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int sub_10000FFCC()
{
  return sub_100012F50();
}

uint64_t sub_100010048()
{
  sub_100012E20();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000100B0()
{
  return sub_100012F50();
}

uint64_t sub_100010128@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100019018;
  v8._object = v3;
  Swift::Int v5 = sub_100012EB0(v4, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_100010188(uint64_t *a1@<X8>)
{
  uint64_t v2 = 1953460082;
  if (*v1) {
    uint64_t v2 = 0x64726F7773736170;
  }
  unint64_t v3 = 0xE400000000000000;
  if (*v1) {
    unint64_t v3 = 0xE800000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

unint64_t sub_1000101C4()
{
  unint64_t result = qword_10001C648;
  if (!qword_10001C648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C648);
  }
  return result;
}

unint64_t sub_10001021C()
{
  unint64_t result = qword_10001C650;
  if (!qword_10001C650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C650);
  }
  return result;
}

uint64_t sub_100010270@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001C158 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000093BC(&qword_10001C730);
  uint64_t v3 = sub_1000094FC(v2, (uint64_t)qword_10001C940);
  Swift::OpaquePointer v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100010320()
{
  unint64_t result = qword_10001C658;
  if (!qword_10001C658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C658);
  }
  return result;
}

unint64_t sub_100010378()
{
  unint64_t result = qword_10001C660;
  if (!qword_10001C660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C660);
  }
  return result;
}

unint64_t sub_1000103D0()
{
  unint64_t result = qword_10001C668;
  if (!qword_10001C668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C668);
  }
  return result;
}

void *sub_100010424()
{
  return &protocol witness table for String;
}

uint64_t sub_100010430()
{
  sub_10001172C();
  uint64_t v2 = sub_100012B70();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100009598(v3, v0, v2, v1);
}

unint64_t sub_1000104C8()
{
  unint64_t result = qword_10001C678;
  if (!qword_10001C678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C678);
  }
  return result;
}

unint64_t sub_100010520()
{
  unint64_t result = qword_10001C680;
  if (!qword_10001C680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C680);
  }
  return result;
}

unint64_t sub_100010578()
{
  unint64_t result = qword_10001C688;
  if (!qword_10001C688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C688);
  }
  return result;
}

unint64_t sub_1000105D0()
{
  unint64_t result = qword_10001C690;
  if (!qword_10001C690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C690);
  }
  return result;
}

uint64_t sub_100010624@<X0>(uint64_t a1@<X8>)
{
  return sub_100010CD4(&qword_10001C150, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10001C928, a1);
}

uint64_t sub_10001065C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100010C54(a1, a2, a3, (void (*)(void))sub_1000101C4);
}

uint64_t sub_100010688(uint64_t a1)
{
  unint64_t v2 = sub_1000101C4();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000106D8()
{
  unint64_t result = qword_10001C698;
  if (!qword_10001C698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C698);
  }
  return result;
}

unint64_t sub_100010730()
{
  unint64_t result = qword_10001C6A0;
  if (!qword_10001C6A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6A0);
  }
  return result;
}

unint64_t sub_100010788()
{
  unint64_t result = qword_10001C6A8;
  if (!qword_10001C6A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6A8);
  }
  return result;
}

uint64_t sub_1000107DC()
{
  if (qword_10001C160 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_100010838(uint64_t a1)
{
  unint64_t v2 = sub_1000105D0();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100010888()
{
  unint64_t result = qword_10001C6B0;
  if (!qword_10001C6B0)
  {
    sub_10000336C(&qword_10001C6B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6B0);
  }
  return result;
}

void sub_1000108E4(void *a1@<X8>)
{
  *a1 = &off_100019068;
}

unint64_t sub_1000108F8()
{
  unint64_t result = qword_10001C6C0;
  if (!qword_10001C6C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6C0);
  }
  return result;
}

uint64_t sub_10001094C()
{
  uint64_t v0 = sub_100012CF0();
  sub_100009534(v0, qword_10001C960);
  sub_1000094FC(v0, (uint64_t)qword_10001C960);
  return sub_100012CD0();
}

uint64_t sub_1000109B0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100012930();
  *a1 = v3;
  return result;
}

uint64_t sub_1000109EC()
{
  return sub_100012940();
}

void (*sub_100010A24(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100012920();
  return sub_1000061C4;
}

unint64_t sub_100010A84()
{
  unint64_t result = qword_10001C6C8;
  if (!qword_10001C6C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6C8);
  }
  return result;
}

uint64_t sub_100010AD8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100011684();
  unint64_t v5 = sub_10001172C();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100010B40()
{
  uint64_t v0 = qword_10001C630;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100010B7C()
{
  unint64_t result = qword_10001C6D0;
  if (!qword_10001C6D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6D0);
  }
  return result;
}

unint64_t sub_100010BD4()
{
  unint64_t result = qword_10001C6D8;
  if (!qword_10001C6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6D8);
  }
  return result;
}

uint64_t sub_100010C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100010C54(a1, a2, a3, (void (*)(void))sub_100010A84);
}

uint64_t sub_100010C54(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100010C9C@<X0>(uint64_t a1@<X8>)
{
  return sub_100010CD4(&qword_10001C168, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001C960, a1);
}

uint64_t sub_100010CD4@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_1000094FC(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100010D78(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100011684();
  unint64_t v7 = sub_1000116D8();
  unint64_t v8 = sub_10001172C();
  *unint64_t v5 = v2;
  v5[1] = sub_100006640;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100010E4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100011394();
  *a1 = result;
  return result;
}

uint64_t sub_100010E74(uint64_t a1)
{
  unint64_t v2 = sub_100010A84();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenWirelessModemSettingsDeepLinks()
{
  return &type metadata for OpenWirelessModemSettingsDeepLinks;
}

uint64_t getEnumTagSinglePayload for WirelessModemSettingsStaticDeepLinks(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for WirelessModemSettingsStaticDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x10001101CLL);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_100011044(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for WirelessModemSettingsStaticDeepLinks()
{
  return &type metadata for WirelessModemSettingsStaticDeepLinks;
}

unint64_t sub_100011060(uint64_t a1, uint64_t a2)
{
  sub_100012F30();
  sub_100012E20();
  Swift::Int v4 = sub_100012F50();

  return sub_100011178(a1, a2, v4);
}

unint64_t sub_1000110D8(char a1)
{
  sub_100012F30();
  sub_100012E20();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_100012F50();

  return sub_10001125C(a1 & 1, v2);
}

unint64_t sub_100011178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100012ED0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100012ED0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10001125C(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    if (a1) {
      uint64_t v6 = 0x64726F7773736170;
    }
    else {
      uint64_t v6 = 1953460082;
    }
    if (a1) {
      unint64_t v7 = 0xE800000000000000;
    }
    else {
      unint64_t v7 = 0xE400000000000000;
    }
    while (1)
    {
      uint64_t v8 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0x64726F7773736170 : 1953460082;
      unint64_t v9 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0xE800000000000000 : 0xE400000000000000;
      if (v8 == v6 && v9 == v7) {
        break;
      }
      char v11 = sub_100012ED0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
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

uint64_t sub_100011394()
{
  uint64_t v17 = sub_100012BC0();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000093BC(&qword_10001C2C8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_1000093BC(&qword_10001C2D0);
  __chkstk_darwin(v9 - 8);
  char v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100012CF0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_1000093BC(&qword_10001C6E8);
  sub_100012CD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 2;
  uint64_t v14 = sub_1000128E0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_1000101C4();
  return sub_100012950();
}

unint64_t sub_100011684()
{
  unint64_t result = qword_10001C6F0;
  if (!qword_10001C6F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6F0);
  }
  return result;
}

unint64_t sub_1000116D8()
{
  unint64_t result = qword_10001C6F8;
  if (!qword_10001C6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C6F8);
  }
  return result;
}

unint64_t sub_10001172C()
{
  unint64_t result = qword_10001C700;
  if (!qword_10001C700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C700);
  }
  return result;
}

uint64_t sub_100011780(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000093BC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

ValueMetadata *type metadata accessor for MaximizeCompatibilityToggleControl()
{
  return &type metadata for MaximizeCompatibilityToggleControl;
}

ValueMetadata *type metadata accessor for AllowOthersToJoinToggleControl()
{
  return &type metadata for AllowOthersToJoinToggleControl;
}

uint64_t sub_100011804()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100011820@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_1000093BC(&qword_10001C760);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000093BC(&qword_10001C768);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000093BC(&qword_10001C770);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  char v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000093BC(&qword_10001C778);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_1000093BC(&qword_10001C780);
  sub_10000480C();
  sub_1000097A8(&qword_10001C788, &qword_10001C780);
  sub_100012DD0();
  sub_100012D60();
  uint64_t v16 = sub_1000097A8(&qword_10001C790, &qword_10001C760);
  sub_100012D90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_100012D60();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_100012D70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_100012DA0();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_100012D80();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_100011D38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000093BC(&qword_10001C780);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D60();
  sub_100012DC0();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v5, v2);
}

uint64_t sub_100011E78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100011E94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_1000093BC(&qword_10001C760);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000093BC(&qword_10001C768);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000093BC(&qword_10001C770);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  char v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000093BC(&qword_10001C778);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_1000093BC(&qword_10001C780);
  sub_10000D2C8();
  sub_1000097A8(&qword_10001C788, &qword_10001C780);
  sub_100012DD0();
  sub_100012D60();
  uint64_t v16 = sub_1000097A8(&qword_10001C790, &qword_10001C760);
  sub_100012D90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_100012D60();
  uint64_t v31 = v1;
  uint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_100012D70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  uint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_100012DA0();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_100012D80();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_1000123AC()
{
  sub_100012D60();

  return sub_100012DC0();
}

uint64_t sub_100012420@<X0>(uint64_t a1@<X8>)
{
  sub_100012D60();
  uint64_t result = sub_100012DB0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100012498@<X0>(uint64_t a1@<X8>)
{
  sub_100012D60();
  uint64_t result = sub_100012DB0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100012520()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001264C()
{
  uint64_t v0 = sub_1000093BC(&qword_10001C7A0);

  return TupleWidget.init(_:)(v0, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000126CC()
{
  unint64_t result = qword_10001C798;
  if (!qword_10001C798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C798);
  }
  return result;
}

ValueMetadata *type metadata accessor for WirelessModemSettingsControlsBundle()
{
  return &type metadata for WirelessModemSettingsControlsBundle;
}

uint64_t sub_100012730()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100012750()
{
  unint64_t result = qword_10001C7A8;
  if (!qword_10001C7A8)
  {
    sub_10000336C(&qword_10001C7B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C7A8);
  }
  return result;
}

uint64_t sub_1000127AC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1000127E0()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_1000127F0()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100012800()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100012840()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100012850()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100012860()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_100012870()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100012880()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000128B0()
{
  return IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)();
}

uint64_t sub_1000128D0()
{
  return IntentDialog.init<A, B>(from:capturedContent:)();
}

uint64_t sub_1000128E0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_1000128F0()
{
  return static IntentResult.result<A>(value:dialog:)();
}

uint64_t sub_100012910()
{
  return _UniqueEntity.id.getter();
}

uint64_t sub_100012920()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100012930()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100012940()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100012950()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100012960()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100012970()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_100012980()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_100012990()
{
  return type metadata accessor for _AssistantIntent.PhraseToken();
}

uint64_t sub_1000129A0()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_1000129B0()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_1000129C0()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_1000129D0()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_1000129E0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_1000129F0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_100012A00()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_100012A10()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_100012A20()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

uint64_t sub_100012A30()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_100012A40(Swift::String a1)
{
}

uint64_t sub_100012A50()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100012A60()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t sub_100012A70()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_100012A80()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_100012A90()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_100012AA0()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_100012AB0()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_100012AC0()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_100012B00()
{
  return static _DialogBuilderEntity.buildBlock<A>(_:)();
}

uint64_t sub_100012B10()
{
  return static _DialogBuilderEntity.buildExpression<A, B>(_:)();
}

uint64_t sub_100012B20()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100012B30()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100012B40()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100012B50()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100012B60()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_100012B70()
{
  return _URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100012B90()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_100012BA0()
{
  return _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_100012BB0()
{
  return _EnumURLRepresentation.init(_:)();
}

uint64_t sub_100012BC0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100012BD0()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_100012C30()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100012C50()
{
  return type metadata accessor for _GeneratedContentOptions();
}

uint64_t sub_100012C60()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100012C70()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100012C80()
{
  return type metadata accessor for _GeneratedContentFallback();
}

uint64_t sub_100012CA0()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_100012CB0()
{
  return type metadata accessor for Notification();
}

uint64_t sub_100012CC0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100012CD0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100012CE0()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100012CF0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100012D00()
{
  return LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)();
}

uint64_t sub_100012D10()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100012D20()
{
  return static Locale.current.getter();
}

uint64_t sub_100012D30()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100012D50()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100012D60()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100012D70()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_100012D80()
{
  return WidgetConfiguration.hiddenControl()();
}

uint64_t sub_100012D90()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_100012DA0()
{
  return WidgetConfiguration.disablesControlStateCaching()();
}

uint64_t sub_100012DB0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_100012DC0()
{
  return Label<>.init(_:systemImage:)();
}

uint64_t sub_100012DD0()
{
  return ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)();
}

NSDictionary sub_100012DE0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100012DF0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100012E00()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_100012E10()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100012E20()
{
  return String.hash(into:)();
}

uint64_t sub_100012E30()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_100012E40()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_100012E50()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_100012E70()
{
  return NSNotificationCenter.Notifications.makeAsyncIterator()();
}

uint64_t sub_100012E80()
{
  return type metadata accessor for NSNotificationCenter.Notifications.Iterator();
}

uint64_t sub_100012E90()
{
  return NSNotificationCenter.notifications(named:object:)();
}

uint64_t sub_100012EA0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100012EB0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100012ED0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100012EF0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100012F00()
{
  return Error._code.getter();
}

uint64_t sub_100012F10()
{
  return Error._domain.getter();
}

uint64_t sub_100012F20()
{
  return Error._userInfo.getter();
}

uint64_t sub_100012F30()
{
  return Hasher.init(_seed:)();
}

void sub_100012F40(Swift::UInt a1)
{
}

Swift::Int sub_100012F50()
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

uint64_t WiFiManagerClientCopyProperty()
{
  return _WiFiManagerClientCopyProperty();
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiManagerClientGetMISDiscoveryState()
{
  return _WiFiManagerClientGetMISDiscoveryState();
}

uint64_t WiFiManagerClientIsTetheringSupported()
{
  return _WiFiManagerClientIsTetheringSupported();
}

uint64_t WiFiManagerClientSetMISDiscoveryStateExt()
{
  return _WiFiManagerClientSetMISDiscoveryStateExt();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return __CTServerConnectionCreateWithIdentifier();
}

uint64_t _CTServerConnectionGetCellularDataIsEnabled()
{
  return __CTServerConnectionGetCellularDataIsEnabled();
}

uint64_t _CTServerConnectionSetCellularDataIsEnabled()
{
  return __CTServerConnectionSetCellularDataIsEnabled();
}

uint64_t _NETRBClientCreate()
{
  return __NETRBClientCreate();
}

uint64_t _NETRBClientGetGlobalServiceState()
{
  return __NETRBClientGetGlobalServiceState();
}

uint64_t _NETRBClientSetGlobalServiceState()
{
  return __NETRBClientSetGlobalServiceState();
}

uint64_t _NETRBClientStartService()
{
  return __NETRBClientStartService();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return _swift_dynamicCastUnknownClassUnconditional();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}