uint64_t sub_100002FE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (**v21)();
  uint64_t (*v22)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v24 = a2;
  v25 = a1;
  v27 = a3;
  v3 = sub_100006998();
  v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_100004178(&qword_10000C578);
  v7 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100006A28();
  v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_allocWithZone((Class)type metadata accessor for AppleConnectAuthenticator());
  v15 = objc_msgSend(v14, "init", v24);
  [objc_allocWithZone((Class)GPAppleConnectTokenProvider) initWithAuthenticatingProtocol:v15];

  sub_100006A78();
  swift_allocObject();
  sub_100006A68();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for CreationViewStyle.modalSheet(_:), v10);
  sub_100006958();
  swift_allocObject();
  swift_retain();
  v16 = sub_100006938();
  swift_retain();
  sub_100006988();
  sub_10000492C(&qword_10000C540, (void (*)(uint64_t))&type metadata accessor for PickerView);
  v17 = v25;
  sub_100006AE8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v18 = swift_allocObject();
  *(void *)(v18 + 16) = v17;
  *(void *)(v18 + 24) = v16;
  v20 = v26;
  v19 = v27;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v27, v9, v26);
  v21 = (uint64_t (**)())(v19 + *(int *)(sub_100004178(&qword_10000C530) + 36));
  *v21 = sub_100004A08;
  v21[1] = (uint64_t (*)())v18;
  v21[2] = 0;
  v21[3] = 0;
  v22 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
  swift_retain();
  return v22(v9, v20);
}

uint64_t sub_100003364()
{
  swift_retain();
  sub_100006A98();
  sub_100006918();
  sub_100006A38();
  swift_release();
  swift_unknownObjectRetain();
  sub_100006948();
  sub_100006928();
  swift_unknownObjectRetain();
  sub_100006A58();
  swift_release();
  sub_100006918();
  swift_unknownObjectRetain();
  sub_100006A48();

  return swift_release();
}

uint64_t sub_100003430@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v27 = a3;
  uint64_t v25 = sub_100006978();
  uint64_t v4 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_100004178(&qword_10000C570);
  uint64_t v7 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100006A28();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = objc_allocWithZone((Class)type metadata accessor for AppleConnectAuthenticator());
  id v15 = objc_msgSend(v14, "init", v24);
  [objc_allocWithZone((Class)GPAppleConnectTokenProvider) initWithAuthenticatingProtocol:v15];

  sub_100006A78();
  swift_allocObject();
  sub_100006A68();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for CreationViewStyle.modalSheet(_:), v10);
  sub_100006958();
  swift_allocObject();
  swift_retain();
  sub_100006938();
  uint64_t v16 = sub_100006918();
  swift_retain();
  sub_100006928();
  swift_retain();
  sub_100006968();
  sub_10000492C(&qword_10000C558, (void (*)(uint64_t))&type metadata accessor for EditorView);
  uint64_t v17 = v25;
  sub_100006AE8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v17);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v16;
  *(void *)(v18 + 24) = a1;
  uint64_t v20 = v26;
  uint64_t v19 = v27;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v27, v9, v26);
  v21 = (uint64_t (**)())(v19 + *(int *)(sub_100004178(&qword_10000C548) + 36));
  *v21 = sub_1000049BC;
  v21[1] = (uint64_t (*)())v18;
  v21[2] = 0;
  v21[3] = 0;
  v22 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
  swift_retain();
  return v22(v9, v20);
}

uint64_t sub_1000037F0()
{
  return sub_100006A48();
}

uint64_t sub_10000384C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = sub_100006B48();
  v4[3] = sub_100006B38();
  sub_100006A18();
  v6 = (void *)swift_task_alloc();
  v4[4] = v6;
  void *v6 = v4;
  v6[1] = sub_100003908;
  return static ServicesStartup.preWarmServices(in:)(a4);
}

uint64_t sub_100003908()
{
  swift_task_dealloc();
  uint64_t v1 = sub_100006B28();
  return _swift_task_switch(sub_100003A44, v1, v0);
}

uint64_t sub_100003A44()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100003AA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006B68();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100006B58();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000043A4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100006B28();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100003C48()
{
  uint64_t v0 = sub_100004178(&qword_10000C520);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004178(&qword_10000C528);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_100004178(&qword_10000C530);
  sub_100004724();
  sub_1000069B8();
  swift_retain();
  sub_100004178(&qword_10000C548);
  sub_100004850();
  sub_1000069A8();
  sub_100004974(&qword_10000C560, &qword_10000C528);
  sub_100004974(&qword_10000C568, &qword_10000C520);
  sub_1000069D8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100003EB4(uint64_t a1)
{
  unint64_t v2 = sub_1000046C8();

  return GPUIExtension.configuration.getter(a1, v2);
}

uint64_t sub_100003F00@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_100004178(&qword_10000C4F0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000069F8();
  swift_allocObject();
  uint64_t v5 = sub_1000069E8();
  uint64_t v6 = sub_100006B68();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  sub_100006B48();
  swift_retain_n();
  uint64_t v7 = sub_100006B38();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = &protocol witness table for MainActor;
  v8[4] = v5;
  sub_100003AA4((uint64_t)v4, (uint64_t)&unk_10000C500, (uint64_t)v8);
  swift_release();
  uint64_t result = swift_release();
  *a1 = v5;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000040AC()
{
  unint64_t result = qword_10000C4E0;
  if (!qword_10000C4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C4E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for UIExtension()
{
  return &type metadata for UIExtension;
}

uint64_t sub_100004114()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004130()
{
  return sub_10000492C(&qword_10000C4E8, (void (*)(uint64_t))&type metadata accessor for AppExtensionSceneConfiguration);
}

uint64_t sub_100004178(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000041BC()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000041FC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1000042B0;
  return sub_10000384C(a1, v4, v5, v6);
}

uint64_t sub_1000042B0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000043A4(uint64_t a1)
{
  uint64_t v2 = sub_100004178(&qword_10000C4F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100004404(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000044E0;
  return v6(a1);
}

uint64_t sub_1000044E0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000045D8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100004610(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000042B0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10000C508 + dword_10000C508);
  return v6(a1, v4);
}

unint64_t sub_1000046C8()
{
  unint64_t result = qword_10000C518;
  if (!qword_10000C518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C518);
  }
  return result;
}

uint64_t sub_10000471C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100002FE4(a1, v2, a2);
}

unint64_t sub_100004724()
{
  unint64_t result = qword_10000C538;
  if (!qword_10000C538)
  {
    sub_100004800(&qword_10000C530);
    sub_100006998();
    sub_10000492C(&qword_10000C540, (void (*)(uint64_t))&type metadata accessor for PickerView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C538);
  }
  return result;
}

uint64_t sub_100004800(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004848@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100003430(a1, v2, a2);
}

unint64_t sub_100004850()
{
  unint64_t result = qword_10000C550;
  if (!qword_10000C550)
  {
    sub_100004800(&qword_10000C548);
    sub_100006978();
    sub_10000492C(&qword_10000C558, (void (*)(uint64_t))&type metadata accessor for EditorView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C550);
  }
  return result;
}

uint64_t sub_10000492C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100004974(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100004800(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000049BC()
{
  return sub_1000037F0();
}

uint64_t sub_1000049C8()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100004A08()
{
  return sub_100003364();
}

uint64_t sub_100004A10()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004AD8()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100004B08()
{
  v1[2] = v0;
  uint64_t v2 = sub_100006AD8();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v1[6] = swift_task_alloc();
  sub_100006B48();
  v1[7] = sub_100006B38();
  uint64_t v4 = sub_100006B28();
  v1[8] = v4;
  v1[9] = v3;
  return _swift_task_switch(sub_100004C0C, v4, v3);
}

uint64_t sub_100004C0C()
{
  sub_100006AA8();
  uint64_t v1 = sub_100006AC8();
  os_log_type_t v2 = sub_100006B78();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Fetching auth token", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v7 = v0[2];

  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v8(v4, v5);
  uint64_t v9 = *(void *)(v7 + OBJC_IVAR____TtC13GPUIExtension25AppleConnectAuthenticator_token + 8);
  if (v9)
  {
    uint64_t v10 = *(void *)(v7 + OBJC_IVAR____TtC13GPUIExtension25AppleConnectAuthenticator_token);
    swift_bridgeObjectRetain();
    swift_release();
    sub_100006AA8();
    uint64_t v11 = sub_100006AC8();
    os_log_type_t v12 = sub_100006B78();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Reusing cached authentication token", v13, 2u);
      swift_slowDealloc();
    }
    uint64_t v14 = v0[5];
    uint64_t v15 = v0[3];

    v8(v14, v15);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
    return v16(v10, v9);
  }
  else
  {
    uint64_t v18 = (void *)swift_task_alloc();
    v0[10] = v18;
    *uint64_t v18 = v0;
    v18[1] = sub_100004E6C;
    return sub_1000050A0();
  }
}

uint64_t sub_100004E6C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void **)v3;
  *(void *)(*(void *)v3 + 88) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = v6[8];
    uint64_t v8 = v6[9];
    uint64_t v9 = sub_100005028;
  }
  else
  {
    v6[12] = a2;
    v6[13] = a1;
    uint64_t v7 = v6[8];
    uint64_t v8 = v6[9];
    uint64_t v9 = sub_100004FA0;
  }
  return _swift_task_switch(v9, v7, v8);
}

uint64_t sub_100004FA0()
{
  swift_release();
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[13];
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v2, v1);
}

uint64_t sub_100005028()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000050A0()
{
  v1[22] = v0;
  sub_100006B48();
  v1[23] = sub_100006B38();
  uint64_t v2 = sub_100006B28();
  v1[24] = v2;
  v1[25] = v3;
  return _swift_task_switch(sub_10000516C, v2, v3);
}

uint64_t sub_10000516C()
{
  uint64_t v1 = sub_100006AD8();
  v0[26] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[27] = *(void *)(v2 + 64);
  uint64_t v3 = swift_task_alloc();
  sub_100006AA8();
  uint64_t v4 = sub_100006AC8();
  os_log_type_t v5 = sub_100006B78();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Starting Apple Connect authentication", v6, 2u);
    swift_slowDealloc();
  }

  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[28] = v7;
  v0[29] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v7(v3, v1);
  swift_task_dealloc();
  if (ACAuthenticationRequest)
  {
    uint64_t v8 = v0[22];
    id v9 = [objc_allocWithZone((Class)ACAuthenticationRequest) init];
    v0[30] = v9;
    [v9 setAuthType:3];
    uint64_t v10 = *(void **)(v8 + OBJC_IVAR____TtC13GPUIExtension25AppleConnectAuthenticator_context);
    v0[2] = v0;
    v0[7] = v0 + 19;
    v0[3] = sub_100005488;
    uint64_t v11 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_1000059C4;
    v0[13] = &unk_100008838;
    v0[14] = v11;
    [v10 authenticateWithRequest:v9 completion:v0 + 10];
    return _swift_continuation_await(v0 + 2);
  }
  else
  {
    swift_release();
    sub_100006570();
    swift_allocError();
    *os_log_type_t v12 = xmmword_100007040;
    swift_willThrow();
    v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
}

uint64_t sub_100005488()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 200);
  uint64_t v2 = *(void *)(*(void *)v0 + 192);
  return _swift_task_switch(sub_1000055BC, v2, v1);
}

uint64_t sub_1000055BC()
{
  swift_release();
  uint64_t v1 = (void *)v0[19];
  id v2 = [v1 serviceTicket];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (void *)v0[30];
    uint64_t v5 = v0[22];
    uint64_t v6 = sub_100006B18();
    uint64_t v8 = v7;

    id v9 = (uint64_t *)(v5 + OBJC_IVAR____TtC13GPUIExtension25AppleConnectAuthenticator_token);
    uint64_t *v9 = v6;
    v9[1] = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
    return v10(v6, v8);
  }
  else
  {
    uint64_t v12 = swift_task_alloc();
    sub_100006AA8();
    v13 = v1;
    uint64_t v14 = sub_100006AC8();
    os_log_type_t v15 = sub_100006B88();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 138412290;
      if ([v13 error])
      {
        uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
        v0[21] = v18;
        sub_100006B98();
      }
      else
      {
        v0[20] = 0;
        sub_100006B98();
        uint64_t v18 = 0;
      }
      *uint64_t v17 = v18;

      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Failed to authenticate: %@", v16, 0xCu);
      sub_100004178(&qword_10000C648);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v14 = v13;
    }
    uint64_t v19 = (void (*)(uint64_t, uint64_t))v0[28];
    uint64_t v20 = v0[26];

    v19(v12, v20);
    swift_task_dealloc();
    id v21 = [v13 error];
    if (v21)
    {
      swift_getErrorValue();
      uint64_t v22 = v0[15];
      uint64_t v23 = v0[16];
      uint64_t v24 = *(void *)(v23 - 8);
      uint64_t v25 = swift_task_alloc();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v25, v22, v23);

      id v21 = (id)sub_100006BA8();
      uint64_t v27 = v26;
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v23);
      swift_task_dealloc();
    }
    else
    {
      uint64_t v27 = 0;
    }
    v28 = (void *)v0[30];
    sub_100006570();
    swift_allocError();
    void *v29 = v21;
    v29[1] = v27;
    swift_willThrow();

    v30 = (uint64_t (*)(void))v0[1];
    return v30();
  }
}

uint64_t sub_1000059C4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  **(void **)(*(void *)(v2 + 64) + 40) = a2;
  id v3 = a2;

  return _swift_continuation_resume(v2);
}

uint64_t sub_100005A18(uint64_t a1, uint64_t a2)
{
  if (a2 == 1) {
    return sub_100006B08();
  }
  sub_100004178(&qword_10000C650);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100007050;
  *(void *)(v5 + 56) = &type metadata for String;
  *(void *)(v5 + 64) = sub_100006878();
  uint64_t v6 = 0x6E776F6E6B6E75;
  if (a2) {
    uint64_t v6 = a1;
  }
  unint64_t v7 = 0xE700000000000000;
  if (a2) {
    unint64_t v7 = a2;
  }
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v7;
  sub_1000068C0(a1, a2);
  uint64_t v2 = sub_100006B08();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_100005B20()
{
  return sub_100005A18(*v0, v0[1]);
}

uint64_t sub_100005B28()
{
  return sub_1000068E8();
}

uint64_t sub_100005B40()
{
  return sub_1000068F8();
}

uint64_t sub_100005B58()
{
  return sub_1000068D8();
}

id sub_100005B80()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = &v0[OBJC_IVAR____TtC13GPUIExtension25AppleConnectAuthenticator_token];
  *(void *)uint64_t v2 = 0;
  *((void *)v2 + 1) = 0;
  uint64_t v3 = OBJC_IVAR____TtC13GPUIExtension25AppleConnectAuthenticator_context;
  id v4 = objc_allocWithZone((Class)ACMobileAuthenticationContext);
  uint64_t v5 = v0;
  id v6 = [v4 init];
  id v7 = objc_allocWithZone((Class)NSNumber);
  id v8 = v6;
  id v9 = [v7 initWithInteger:191000];
  [v8 setAppID:v9];

  [v8 setEnvironment:0];
  *(void *)&v0[v3] = v8;

  v11.receiver = v5;
  v11.super_class = ObjectType;
  return objc_msgSendSuper2(&v11, "init");
}

id sub_100005CAC()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AppleConnectAuthenticator()
{
  return self;
}

uint64_t sub_100005D58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a5;
  v6[3] = a6;
  v6[4] = sub_100006B48();
  v6[5] = sub_100006B38();
  id v7 = (void *)swift_task_alloc();
  v6[6] = v7;
  *id v7 = v6;
  v7[1] = sub_100005E08;
  return sub_100004B08();
}

uint64_t sub_100005E08(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 56) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = sub_100006B28();
    uint64_t v9 = v8;
    uint64_t v10 = sub_100006020;
  }
  else
  {
    *(void *)(v6 + 64) = a2;
    *(void *)(v6 + 72) = a1;
    uint64_t v7 = sub_100006B28();
    uint64_t v9 = v11;
    uint64_t v10 = sub_100005F94;
  }
  return _swift_task_switch(v10, v7, v9);
}

uint64_t sub_100005F94()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v3 = (void (*)(uint64_t, uint64_t, void))v0[2];
  swift_release();
  v3(v2, v1, 0);
  swift_bridgeObjectRelease();
  id v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100006020()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = (void (*)(void, void, uint64_t))v0[2];
  swift_release();
  swift_errorRetain();
  v2(0, 0, v1);
  swift_errorRelease();
  swift_errorRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

void *initializeBufferWithCopyOfBuffer for AppleConnectAuthenticator.DAWToken(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AppleConnectAuthenticator.DAWToken()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AppleConnectAuthenticator.DAWToken(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for AppleConnectAuthenticator.DAWToken(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for AppleConnectAuthenticator.DAWToken(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleConnectAuthenticator.DAWToken(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppleConnectAuthenticator.DAWToken(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleConnectAuthenticator.DAWToken()
{
  return &type metadata for AppleConnectAuthenticator.DAWToken;
}

void sub_100006390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v6 = (void *)sub_100006AF8();
    if (a3)
    {
LABEL_3:
      uint64_t v7 = sub_100006908();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v6);
}

uint64_t sub_100006420()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100006458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100006390(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_100006460()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000064A8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_1000042B0;
  return sub_100005D58(a1, v4, v5, v6, v7, v8);
}

unint64_t sub_100006570()
{
  unint64_t result = qword_10000C640;
  if (!qword_10000C640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C640);
  }
  return result;
}

unint64_t destroy for AppleConnectAuthenticator.AuthenticationError(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  int v2 = -1;
  if (result < 0xFFFFFFFF) {
    int v2 = result;
  }
  if (v2 - 1 < 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *_s13GPUIExtension25AppleConnectAuthenticatorC19AuthenticationErrorOwCP_0(void *a1, void *a2)
{
  unint64_t v3 = a2[1];
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF) {
    uint64_t v4 = a2[1];
  }
  if ((int)v4 - 1 < 0)
  {
    *a1 = *a2;
    a1[1] = v3;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  return a1;
}

void *assignWithCopy for AppleConnectAuthenticator.AuthenticationError(void *a1, void *a2)
{
  LODWORD(v4) = -1;
  if (a1[1] >= 0xFFFFFFFFuLL) {
    LODWORD(v5) = -1;
  }
  else {
    uint64_t v5 = a1[1];
  }
  int v6 = v5 - 1;
  if (a2[1] < 0xFFFFFFFFuLL) {
    uint64_t v4 = a2[1];
  }
  int v7 = v4 - 1;
  if (v6 < 0)
  {
    if (v7 < 0)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if ((v7 & 0x80000000) == 0)
  {
LABEL_11:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithTake for AppleConnectAuthenticator.AuthenticationError(void *a1, void *a2)
{
  unint64_t v4 = a1[1];
  int v5 = -1;
  if (v4 < 0xFFFFFFFF) {
    int v5 = v4;
  }
  if (v5 - 1 < 0)
  {
    unint64_t v6 = a2[1];
    LODWORD(v7) = -1;
    if (v6 < 0xFFFFFFFF) {
      uint64_t v7 = a2[1];
    }
    if ((int)v7 - 1 < 0)
    {
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleConnectAuthenticator.AuthenticationError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  if ((v4 + 1) >= 2) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AppleConnectAuthenticator.AuthenticationError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_100006810(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

void *sub_100006838(void *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    *unint64_t result = a2 - 0x7FFFFFFF;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleConnectAuthenticator.AuthenticationError()
{
  return &type metadata for AppleConnectAuthenticator.AuthenticationError;
}

unint64_t sub_100006878()
{
  unint64_t result = qword_10000C658;
  if (!qword_10000C658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C658);
  }
  return result;
}

uint64_t sub_1000068C0(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1000068D8()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_1000068E8()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_1000068F8()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_100006908()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100006918()
{
  return PlaygroundHomeViewModel.composingViewModel.getter();
}

uint64_t sub_100006928()
{
  return PlaygroundHomeViewModel.photoGridViewModel.getter();
}

uint64_t sub_100006938()
{
  return PlaygroundHomeViewModel.init(servicesFetcher:appleConnectTokenProvider:creationViewStyle:pickerMode:forceDarkMode:sessionUndoManager:)();
}

uint64_t sub_100006948()
{
  return PlaygroundHomeViewModel.delegate.setter();
}

uint64_t sub_100006958()
{
  return type metadata accessor for PlaygroundHomeViewModel();
}

uint64_t sub_100006968()
{
  return EditorView.init(composingViewModel:composingDelegate:gridViewModel:)();
}

uint64_t sub_100006978()
{
  return type metadata accessor for EditorView();
}

uint64_t sub_100006988()
{
  return PickerView.init(viewModel:)();
}

uint64_t sub_100006998()
{
  return type metadata accessor for PickerView();
}

uint64_t sub_1000069A8()
{
  return GPEditorScene.init(content:)();
}

uint64_t sub_1000069B8()
{
  return GPPickerScene.init(content:)();
}

uint64_t sub_1000069D8()
{
  return static GPSceneBuilder.buildBlock<A, B>(_:_:)();
}

uint64_t sub_1000069E8()
{
  return ServicesFetcher.init()();
}

uint64_t sub_1000069F8()
{
  return type metadata accessor for ServicesFetcher();
}

uint64_t sub_100006A18()
{
  return type metadata accessor for ServicesStartup();
}

uint64_t sub_100006A28()
{
  return type metadata accessor for CreationViewStyle();
}

void sub_100006A38()
{
}

uint64_t sub_100006A48()
{
  return ComposingViewModel.delegate.setter();
}

uint64_t sub_100006A58()
{
  return PhotoGridViewModel.delegate.setter();
}

uint64_t sub_100006A68()
{
  return SessionUndoManager.init(undoManager:)();
}

uint64_t sub_100006A78()
{
  return type metadata accessor for SessionUndoManager();
}

uint64_t sub_100006A88()
{
  return ServiceSideConnectionManager.composingViewModel.setter();
}

uint64_t sub_100006A98()
{
  return ServiceSideConnectionManager.playgroundHomeViewModel.setter();
}

uint64_t sub_100006AA8()
{
  return static GPLog.authentication.getter();
}

uint64_t sub_100006AB8()
{
  return static AppExtension<>.main()();
}

uint64_t sub_100006AC8()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006AD8()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006AE8()
{
  return View.extensionStateTrackable(connectionManager:)();
}

uint64_t sub_100006AF8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006B08()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_100006B18()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006B28()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100006B38()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100006B48()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100006B58()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100006B68()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100006B78()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100006B88()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006B98()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006BA8()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100006BB8()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100006BC8()
{
  return Error._code.getter();
}

uint64_t sub_100006BD8()
{
  return Error._domain.getter();
}

uint64_t sub_100006BE8()
{
  return Error._userInfo.getter();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
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